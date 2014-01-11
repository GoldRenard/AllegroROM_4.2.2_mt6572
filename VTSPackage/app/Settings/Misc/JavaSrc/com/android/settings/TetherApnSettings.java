// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.*;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.net.Uri;
import android.os.Bundle;
import android.preference.PreferenceScreen;
import android.telephony.TelephonyManager;
import android.view.Menu;
import android.view.MenuItem;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;

// Referenced classes of package com.android.settings:
//            ApnSettings

public class TetherApnSettings extends ApnSettings
    implements android.preference.Preference.OnPreferenceChangeListener
{

    private static final Uri PREFER_APN_TETHER_URI = Uri.parse("content://telephony/carriers/prefertetheringapn");
    static final String TAG = "TetherApnSettings";
    private ConnectivityManager mConnManager;
    private boolean mIsSIMReady;
    private boolean mIsSwitching;
    private boolean mIsTetehred;
    private final BroadcastReceiver mTetheringStateReceiver = new BroadcastReceiver() {

        final TetherApnSettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            if (s.equals("android.net.conn.TETHER_CHANGED_DONE"))
            {
                Xlog.d("TetherApnSettings", "onReceive:ConnectivityManager.TETHER_CHANGED_DONE_ACTION");
                mIsSwitching = false;
                getPreferenceScreen().setEnabled(getScreenEnableState());
            } else
            {
                if (s.equals("android.intent.action.AIRPLANE_MODE"))
                {
                    Xlog.d("TetherApnSettings", (new StringBuilder()).append("onReceive:AIRPLANE_MODE state changed: ").append(mAirplaneModeEnabled).toString());
                    mAirplaneModeEnabled = intent.getBooleanExtra("state", false);
                    getPreferenceScreen().setEnabled(getScreenEnableState());
                    return;
                }
                if (s.equals("android.net.conn.TETHER_STATE_CHANGED"))
                {
                    Xlog.d("TetherApnSettings", "onReceive: ConnectivityManager.ACTION_TETHER_STATE_CHANGED");
                    ArrayList arraylist = intent.getStringArrayListExtra("activeArray");
                    if (arraylist != null)
                    {
                        updateTetheredState(arraylist.toArray());
                        return;
                    } else
                    {
                        Xlog.d("TetherApnSettings", "active tether is null , not update tether state.");
                        return;
                    }
                }
            }
        }

            
            {
                this$0 = TetherApnSettings.this;
                super();
            }
    }
;
    private String mUsbRegexs[];

    public TetherApnSettings()
    {
        mIsSwitching = false;
        mIsSIMReady = true;
        mIsTetehred = false;
    }

    private void updateTetheredState(Object aobj[])
    {
        mIsTetehred = false;
        int i = aobj.length;
        for (int j = 0; j < i; j++)
        {
            String s = (String)aobj[j];
            String as[] = mUsbRegexs;
            int k = as.length;
            for (int l = 0; l < k; l++)
                if (s.matches(as[l]))
                    mIsTetehred = true;

        }

        getPreferenceScreen().setEnabled(getScreenEnableState());
    }

    protected void addMenu(Menu menu)
    {
        if (!"20801".equals(super.mNumeric) && !"23430".equals(super.mNumeric) && !"23431".equals(super.mNumeric) && !"23432".equals(super.mNumeric))
        {
            menu.add(0, 1, 0, getResources().getString(0x7f0b05a8)).setIcon(0x1080033);
            return;
        } else
        {
            return;
        }
    }

    protected void addNewApn()
    {
        Intent intent = new Intent("android.intent.action.INSERT", super.mUri);
        intent.putExtra("simId", super.mSimId);
        intent.putExtra("apn_type", "tethering");
        startActivity(intent);
    }

    protected BroadcastReceiver getBroadcastReceiver()
    {
        return mTetheringStateReceiver;
    }

    protected String getFillListQuery()
    {
        return (new StringBuilder()).append("numeric=\"").append(super.mNumeric).append("\" AND type=\"").append("tethering").append("\"").toString();
    }

    protected IntentFilter getIntentFilter()
    {
        IntentFilter intentfilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        intentfilter.addAction("android.net.conn.TETHER_CHANGED_DONE");
        intentfilter.addAction("android.net.conn.TETHER_STATE_CHANGED");
        return intentfilter;
    }

    protected boolean getScreenEnableState()
    {
        boolean flag;
        if (super.mTelephonyManager.getCallState() == 0)
            flag = true;
        else
            flag = false;
        super.mIsCallStateIdle = flag;
        Xlog.w("TetherApnSettings", (new StringBuilder()).append("mIsCallStateIdle : ").append(super.mIsCallStateIdle).append(" mAirplaneModeEnabled : ").append(super.mAirplaneModeEnabled).append(" mIsSIMReady :").append(mIsSIMReady).append(" mIsSwitching: ").append(mIsSwitching).append(" mIsTetehred: ").append(mIsTetehred).toString());
        return !mIsTetehred && super.mIsCallStateIdle && !super.mAirplaneModeEnabled && mIsSIMReady && !mIsSwitching;
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mConnManager = (ConnectivityManager)getSystemService("connectivity");
        if (mConnManager != null)
            mUsbRegexs = mConnManager.getTetherableUsbRegexs();
        TelephonyManager telephonymanager = TelephonyManager.getDefault();
        if (telephonymanager != null)
        {
            boolean flag;
            if (5 == telephonymanager.getSimState())
                flag = true;
            else
                flag = false;
            mIsSIMReady = flag;
        }
        super.mIsTetherApn = true;
        super.mRestoreCarrierUri = PREFER_APN_TETHER_URI;
    }

    protected void onResume()
    {
        super.onResume();
        Xlog.d("TetherApnSettings", (new StringBuilder()).append("onResume , mIsSwitching = ").append(mIsSwitching).toString());
        if (mConnManager != null)
        {
            boolean flag;
            if (!mConnManager.isTetheringChangeDone())
                flag = true;
            else
                flag = false;
            mIsSwitching = flag;
            updateTetheredState(mConnManager.getTetheredIfaces());
        }
    }

    protected void setSelectedApnKey(String s)
    {
        super.mSelectedKey = s;
        ContentResolver contentresolver = getContentResolver();
        contentresolver.delete(PREFER_APN_TETHER_URI, null, null);
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("apn_id", super.mSelectedKey);
        contentresolver.insert(PREFER_APN_TETHER_URI, contentvalues);
    }



/*
    static boolean access$002(TetherApnSettings tetherapnsettings, boolean flag)
    {
        tetherapnsettings.mIsSwitching = flag;
        return flag;
    }

*/

}
