// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.os.*;
import android.util.Log;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.PhoneFactory;

public class EmergencyCallbackModeService extends Service
{
    public class LocalBinder extends Binder
    {

        final EmergencyCallbackModeService this$0;

        EmergencyCallbackModeService getService()
        {
            return EmergencyCallbackModeService.this;
        }

        public LocalBinder()
        {
            this$0 = EmergencyCallbackModeService.this;
            super();
        }
    }


    private static final int DEFAULT_ECM_EXIT_TIMER_VALUE = 0x493e0;
    private static final int ECM_TIMER_RESET = 1;
    private static final String LOG_TAG = "EmergencyCallbackModeService";
    private final IBinder mBinder = new LocalBinder();
    private BroadcastReceiver mEcmReceiver;
    private Handler mHandler;
    private boolean mInEmergencyCall;
    private NotificationManager mNotificationManager;
    private Phone mPhone;
    private long mTimeLeft;
    private CountDownTimer mTimer;

    public EmergencyCallbackModeService()
    {
        mNotificationManager = null;
        mTimer = null;
        mTimeLeft = 0L;
        mPhone = null;
        mInEmergencyCall = false;
        mHandler = new Handler() {

            final EmergencyCallbackModeService this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 1: // '\001'
                    resetEcmTimer((AsyncResult)message.obj);
                    return;
                }
            }

            
            {
                this$0 = EmergencyCallbackModeService.this;
                super();
            }
        }
;
        mEcmReceiver = new BroadcastReceiver() {

            final EmergencyCallbackModeService this$0;

            public void onReceive(Context context, Intent intent)
            {
                if (intent.getAction().equals("android.intent.action.EMERGENCY_CALLBACK_MODE_CHANGED"))
                {
                    if (!intent.getBooleanExtra("phoneinECMState", false))
                        stopSelf();
                } else
                if (intent.getAction().equals("android.intent.action.ACTION_SHOW_NOTICE_ECM_BLOCK_OTHERS"))
                {
                    context.startActivity((new Intent("android.intent.action.ACTION_SHOW_NOTICE_ECM_BLOCK_OTHERS")).setFlags(0x10000000));
                    return;
                }
            }

            
            {
                this$0 = EmergencyCallbackModeService.this;
                super();
            }
        }
;
    }

    private void resetEcmTimer(AsyncResult asyncresult)
    {
        if (((Boolean)asyncresult.result).booleanValue())
        {
            mInEmergencyCall = true;
            mTimer.cancel();
            showNotification(0L);
            return;
        } else
        {
            mInEmergencyCall = false;
            startTimerNotification();
            return;
        }
    }

    private void showNotification(long l)
    {
        Notification notification = new Notification(0x7f02009a, getText(0x7f0d030e), 0L);
        PendingIntent pendingintent = PendingIntent.getActivity(this, 0, new Intent("com.android.phone.action.ACTION_SHOW_ECM_EXIT_DIALOG"), 0);
        String s1;
        if (mInEmergencyCall)
        {
            s1 = getText(0x7f0d0310).toString();
        } else
        {
            int i = (int)(l / 60000L);
            Object aobj[] = new Object[2];
            aobj[0] = Integer.valueOf(i);
            aobj[1] = Long.valueOf((l % 60000L) / 1000L);
            String s = String.format("%d:%02d", aobj);
            s1 = String.format(getResources().getQuantityText(0x7f0e0000, i).toString(), new Object[] {
                s
            });
        }
        notification.setLatestEventInfo(this, getText(0x7f0d030f), s1, pendingintent);
        notification.flags = 2;
        mNotificationManager.notify(0x7f0d030f, notification);
    }

    private void startTimerNotification()
    {
        long l = SystemProperties.getLong("ro.cdma.ecmexittimer", 0x493e0L);
        showNotification(l);
        mTimer = (new CountDownTimer(l, 1000L) {

            final EmergencyCallbackModeService this$0;

            public void onFinish()
            {
            }

            public void onTick(long l1)
            {
                mTimeLeft = l1;
                showNotification(l1);
            }

            
            {
                this$0 = EmergencyCallbackModeService.this;
                super(l, l1);
            }
        }
).start();
    }

    public boolean getEmergencyCallbackModeCallState()
    {
        return mInEmergencyCall;
    }

    public long getEmergencyCallbackModeTimeout()
    {
        return mTimeLeft;
    }

    public IBinder onBind(Intent intent)
    {
        return mBinder;
    }

    public void onCreate()
    {
        if (PhoneFactory.getDefaultPhone().getPhoneType() != 2)
        {
            Log.e("EmergencyCallbackModeService", (new StringBuilder()).append("Error! Emergency Callback Mode not supported for ").append(PhoneFactory.getDefaultPhone().getPhoneName()).append(" phones").toString());
            stopSelf();
        }
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.EMERGENCY_CALLBACK_MODE_CHANGED");
        intentfilter.addAction("android.intent.action.ACTION_SHOW_NOTICE_ECM_BLOCK_OTHERS");
        registerReceiver(mEcmReceiver, intentfilter);
        mNotificationManager = (NotificationManager)getSystemService("notification");
        mPhone = PhoneFactory.getDefaultPhone();
        mPhone.registerForEcmTimerReset(mHandler, 1, null);
        startTimerNotification();
    }

    public void onDestroy()
    {
        unregisterReceiver(mEcmReceiver);
        mPhone.unregisterForEcmTimerReset(mHandler);
        mNotificationManager.cancel(0x7f0d030f);
        mTimer.cancel();
    }



/*
    static long access$102(EmergencyCallbackModeService emergencycallbackmodeservice, long l)
    {
        emergencycallbackmodeservice.mTimeLeft = l;
        return l;
    }

*/

}
