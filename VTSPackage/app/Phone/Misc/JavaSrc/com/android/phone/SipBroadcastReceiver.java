// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.*;
import android.net.sip.*;
import android.util.Log;
import com.android.internal.telephony.*;
import com.android.internal.telephony.sip.SipPhone;
import com.android.phone.sip.SipProfileDb;
import com.android.phone.sip.SipSharedPreferences;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, PhoneUtils, SipUtil

public class SipBroadcastReceiver extends BroadcastReceiver
{

    private static final String TAG = com/android/phone/SipBroadcastReceiver.getSimpleName();
    private SipSharedPreferences mSipSharedPreferences;


    private void registerAllProfiles()
    {
        (new Thread(new Runnable() {

            final SipBroadcastReceiver this$0;
            final Context val$context;

            public void run()
            {
                SipManager sipmanager = SipManager.newInstance(context);
                Iterator iterator = (new SipProfileDb(context)).retrieveSipProfileList().iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    SipProfile sipprofile = (SipProfile)iterator.next();
                    try
                    {
                        if (sipprofile.getAutoRegistration() || sipprofile.getUriString().equals(mSipSharedPreferences.getPrimaryAccount()))
                            sipmanager.open(sipprofile, SipUtil.createIncomingCallPendingIntent(), null);
                    }
                    catch (SipException sipexception)
                    {
                        Log.e(SipBroadcastReceiver.TAG, (new StringBuilder()).append("failed").append(sipprofile.getProfileName()).toString(), sipexception);
                    }
                } while (true);
            }

            
            {
                this$0 = SipBroadcastReceiver.this;
                context = context1;
                super();
            }
        }
)).start();
    }

    private void removeSipPhone(String s)
    {
        for (Iterator iterator = CallManager.getInstance().getAllPhones().iterator(); iterator.hasNext();)
        {
            Phone phone = (Phone)iterator.next();
            if (phone.getPhoneType() == 3 && ((SipPhone)phone).getSipUri().equals(s))
            {
                CallManager.getInstance().unregisterPhone((SipPhone)phone);
                return;
            }
        }

        Log.v(TAG, (new StringBuilder()).append("Remove phone failed:cannot find phone with uri ").append(s).toString());
    }

    private void takeCall(Intent intent)
    {
        PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
        SipAudioCall sipaudiocall;
        sipaudiocall = SipManager.newInstance(phoneglobals).takeAudioCall(intent, null);
        for (Iterator iterator = CallManager.getInstance().getAllPhones().iterator(); iterator.hasNext();)
        {
            Phone phone = (Phone)iterator.next();
            if (phone.getPhoneType() == 3 && ((SipPhone)phone).canTake(sipaudiocall))
                return;
        }

        try
        {
            Log.v(TAG, "Reject SIP incoming call while 1A1H exist.");
            sipaudiocall.endCall();
            Log.v(TAG, (new StringBuilder()).append("drop SIP call: ").append(intent).toString());
            return;
        }
        catch (SipException sipexception)
        {
            Log.e(TAG, "process incoming SIP call", sipexception);
        }
        return;
    }

    public void onReceive(Context context, Intent intent)
    {
        String s = intent.getAction();
        if (!PhoneUtils.isVoipSupported())
        {
            Log.v(TAG, (new StringBuilder()).append("SIP VOIP not supported: ").append(s).toString());
            return;
        }
        mSipSharedPreferences = new SipSharedPreferences(context);
        if (s.equals("com.android.phone.SIP_INCOMING_CALL"))
        {
            takeCall(intent);
            return;
        }
        if (s.equals("com.android.phone.SIP_ADD_PHONE"))
        {
            String s2 = intent.getStringExtra("android:localSipUri");
            SipPhone sipphone = PhoneFactory.makeSipPhone(s2);
            if (sipphone != null)
                CallManager.getInstance().registerPhone(sipphone);
            Log.d(TAG, (new StringBuilder()).append("new phone: ").append(s2).append(" #phones=").append(CallManager.getInstance().getAllPhones().size()).toString());
            return;
        }
        if (s.equals("com.android.phone.SIP_REMOVE_PHONE"))
        {
            String s1 = intent.getStringExtra("android:localSipUri");
            removeSipPhone(s1);
            Log.d(TAG, (new StringBuilder()).append("removed phone: ").append(s1).append(" #phones=").append(CallManager.getInstance().getAllPhones().size()).toString());
            return;
        }
        if (s.equals("android.net.sip.SIP_SERVICE_UP"))
        {
            Log.v(TAG, "start auto registration");
            registerAllProfiles();
            return;
        } else
        {
            Log.v(TAG, (new StringBuilder()).append("action not processed: ").append(s).toString());
            return;
        }
    }



}
