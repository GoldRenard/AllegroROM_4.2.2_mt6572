// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.*;
import android.content.pm.PackageManager;
import android.os.*;
import android.telephony.*;
import android.util.Log;
import com.android.internal.telephony.*;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, OtaUtils

public class OtaStartupReceiver extends BroadcastReceiver
{

    private static final boolean DBG = true;
    private static final int MIN_READY = 10;
    private static final int SERVICE_STATE_CHANGED = 11;
    private static final String TAG = "OtaStartupReceiver";
    private Context mContext;
    private Handler mHandler;
    private int mOtaspMode;
    private PhoneStateListener mPhoneStateListener;
    private boolean mPhoneStateListenerRegistered;

    public OtaStartupReceiver()
    {
        mOtaspMode = -1;
        mPhoneStateListenerRegistered = false;
        mPhoneStateListener = new PhoneStateListener() {

            final OtaStartupReceiver this$0;

            public void onOtaspChanged(int i)
            {
                mOtaspMode = i;
                Log.v("OtaStartupReceiver", (new StringBuilder()).append("onOtaspChanged: mOtaspMode=").append(mOtaspMode).toString());
            }

            
            {
                this$0 = OtaStartupReceiver.this;
                super();
            }
        }
;
        mHandler = new Handler() {

            final OtaStartupReceiver this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 11: // '\013'
                    ServiceState servicestate = (ServiceState)((AsyncResult)message.obj).result;
                    Log.d("OtaStartupReceiver", (new StringBuilder()).append("onServiceStateChanged()...  new state = ").append(servicestate).toString());
                    if (servicestate.getState() == 0)
                    {
                        Log.d("OtaStartupReceiver", "call OtaUtils.maybeDoOtaCall after network is available");
                        PhoneGlobals.getPhone().unregisterForServiceStateChanged(this);
                        OtaUtils.maybeDoOtaCall(mContext, mHandler, 10);
                        return;
                    }
                    // fall through

                default:
                    return;

                case 10: // '\n'
                    Log.v("OtaStartupReceiver", (new StringBuilder()).append("Attempting OtaActivation from handler, mOtaspMode=").append(mOtaspMode).toString());
                    OtaUtils.maybeDoOtaCall(mContext, mHandler, 10);
                    return;
                }
            }

            
            {
                this$0 = OtaStartupReceiver.this;
                super();
            }
        }
;
    }

    private boolean shouldPostpone(Context context)
    {
        Intent intent = new Intent("android.intent.action.DEVICE_INITIALIZATION_WIZARD");
        android.content.pm.ResolveInfo resolveinfo = context.getPackageManager().resolveActivity(intent, 0x10000);
        boolean flag;
        if (android.provider.Settings.Global.getInt(context.getContentResolver(), "device_provisioned", 0) != 0)
            flag = true;
        else
            flag = false;
        String s = SystemProperties.get("ro.setupwizard.mode", "REQUIRED");
        boolean flag1;
        if (!"REQUIRED".equals(s) && !"OPTIONAL".equals(s))
            flag1 = false;
        else
            flag1 = true;
        Log.v("OtaStartupReceiver", (new StringBuilder()).append("resolvInfo = ").append(resolveinfo).append(", provisioned = ").append(flag).append(", runningSetupWizard = ").append(flag1).toString());
        return resolveinfo != null && !flag && flag1;
    }

    public void onReceive(Context context, Intent intent)
    {
        mContext = context;
        Log.v("OtaStartupReceiver", (new StringBuilder()).append("onReceive: intent action=").append(intent.getAction()).append("  mOtaspMode=").append(mOtaspMode).toString());
        if (PhoneGlobals.getInstanceIfPrimary() == null)
        {
            Log.d("OtaStartupReceiver", "Not primary user, nothing to do.");
            return;
        }
        if (!TelephonyCapabilities.supportsOtasp(PhoneGlobals.getPhone()))
        {
            Log.d("OtaStartupReceiver", "OTASP not supported, nothing to do.");
            return;
        }
        if (!mPhoneStateListenerRegistered)
        {
            Log.d("OtaStartupReceiver", "Register our PhoneStateListener");
            ((TelephonyManager)context.getSystemService("phone")).listen(mPhoneStateListener, 512);
            mPhoneStateListenerRegistered = true;
        } else
        {
            Log.d("OtaStartupReceiver", "PhoneStateListener already registered");
        }
        if (shouldPostpone(context))
        {
            Log.d("OtaStartupReceiver", "Postponing OTASP until wizard runs");
            return;
        }
        PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
        Phone phone = PhoneGlobals.getPhone();
        if (phoneglobals.mCM.getServiceState() != 0)
        {
            Log.w("OtaStartupReceiver", "Network is not ready. Registering to receive notification.");
            phone.registerForServiceStateChanged(mHandler, 11, null);
            return;
        } else
        {
            Log.d("OtaStartupReceiver", "call OtaUtils.maybeDoOtaCall");
            OtaUtils.maybeDoOtaCall(mContext, mHandler, 10);
            return;
        }
    }



/*
    static int access$002(OtaStartupReceiver otastartupreceiver, int i)
    {
        otastartupreceiver.mOtaspMode = i;
        return i;
    }

*/


}
