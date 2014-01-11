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

// Referenced classes of package com.android.phone:
//            PhoneGlobals, EmergencyCallbackModeService

public class EmergencyCallbackModeExitDialog extends Activity
    implements android.content.DialogInterface.OnDismissListener
{

    static final String ACTION_SHOW_ECM_EXIT_DIALOG = "com.android.phone.action.ACTION_SHOW_ECM_EXIT_DIALOG";
    private static final int ECM_TIMER_RESET = 1;
    public static final int EXIT_ECM_BLOCK_OTHERS = 1;
    public static final int EXIT_ECM_DIALOG = 2;
    public static final int EXIT_ECM_IN_EMERGENCY_CALL_DIALOG = 4;
    public static final int EXIT_ECM_PROGRESS_DIALOG = 3;
    public static final String EXTRA_EXIT_ECM_RESULT = "exit_ecm_result";
    AlertDialog mAlertDialog;
    private ServiceConnection mConnection;
    int mDialogType;
    private BroadcastReceiver mEcmExitReceiver;
    long mEcmTimeout;
    Handler mHandler;
    private boolean mInEmergencyCall;
    private Phone mPhone;
    ProgressDialog mProgressDialog;
    EmergencyCallbackModeService mService;
    private Runnable mTask;
    CountDownTimer mTimer;
    private Handler mTimerResetHandler;

    public EmergencyCallbackModeExitDialog()
    {
        mAlertDialog = null;
        mProgressDialog = null;
        mTimer = null;
        mService = null;
        mHandler = null;
        mDialogType = 0;
        mEcmTimeout = 0L;
        mInEmergencyCall = false;
        mPhone = null;
        mTask = new Runnable() {

            final EmergencyCallbackModeExitDialog this$0;

            public void run()
            {
                Looper.prepare();
                bindService(new Intent(EmergencyCallbackModeExitDialog.this, com/android/phone/EmergencyCallbackModeService), mConnection, 1);
                EmergencyCallbackModeExitDialog emergencycallbackmodeexitdialog = EmergencyCallbackModeExitDialog.this;
                emergencycallbackmodeexitdialog;
                JVM INSTR monitorenter ;
                if (mService == null)
                    wait();
_L2:
                if (mService != null)
                {
                    mEcmTimeout = mService.getEmergencyCallbackModeTimeout();
                    mInEmergencyCall = mService.getEmergencyCallbackModeCallState();
                }
                unbindService(mConnection);
                if (mHandler != null)
                    mHandler.post(new Runnable() {

                        final _cls1 this$1;

                        public void run()
                        {
                            showEmergencyCallbackModeExitDialog();
                        }

            
            {
                this$1 = _cls1.this;
                super();
            }
                    }
);
                return;
                InterruptedException interruptedexception;
                interruptedexception;
                Log.d("ECM", (new StringBuilder()).append("EmergencyCallbackModeExitDialog InterruptedException: ").append(interruptedexception.getMessage()).toString());
                interruptedexception.printStackTrace();
                if (true) goto _L2; else goto _L1
_L1:
                Exception exception;
                exception;
                emergencycallbackmodeexitdialog;
                JVM INSTR monitorexit ;
                throw exception;
            }

            
            {
                this$0 = EmergencyCallbackModeExitDialog.this;
                super();
            }
        }
;
        mEcmExitReceiver = new BroadcastReceiver() {

            final EmergencyCallbackModeExitDialog this$0;

            public void onReceive(Context context, Intent intent)
            {
                if (intent.getAction().equals("android.intent.action.EMERGENCY_CALLBACK_MODE_CHANGED") && !intent.getBooleanExtra("phoneinECMState", false))
                {
                    if (mAlertDialog != null)
                        mAlertDialog.dismiss();
                    if (mProgressDialog != null)
                        mProgressDialog.dismiss();
                    setResult(-1, (new Intent()).putExtra("exit_ecm_result", true));
                    finish();
                }
            }

            
            {
                this$0 = EmergencyCallbackModeExitDialog.this;
                super();
            }
        }
;
        mConnection = new ServiceConnection() {

            final EmergencyCallbackModeExitDialog this$0;

            public void onServiceConnected(ComponentName componentname, IBinder ibinder)
            {
                mService = ((EmergencyCallbackModeService.LocalBinder)ibinder).getService();
                synchronized (EmergencyCallbackModeExitDialog.this)
                {
                    notify();
                }
                return;
                exception;
                emergencycallbackmodeexitdialog;
                JVM INSTR monitorexit ;
                throw exception;
            }

            public void onServiceDisconnected(ComponentName componentname)
            {
                mService = null;
            }

            
            {
                this$0 = EmergencyCallbackModeExitDialog.this;
                super();
            }
        }
;
        mTimerResetHandler = new Handler() {

            final EmergencyCallbackModeExitDialog this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 1: // '\001'
                    if (!((Boolean)((AsyncResult)message.obj).result).booleanValue())
                    {
                        setResult(-1, (new Intent()).putExtra("exit_ecm_result", false));
                        finish();
                        return;
                    }
                    break;
                }
            }

            
            {
                this$0 = EmergencyCallbackModeExitDialog.this;
                super();
            }
        }
;
    }

    private CharSequence getDialogText(long l)
    {
        int i = (int)(l / 60000L);
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(i);
        aobj[1] = Long.valueOf((l % 60000L) / 1000L);
        String s = String.format("%d:%02d", aobj);
        switch (mDialogType)
        {
        case 2: // '\002'
            return String.format(getResources().getQuantityText(0x7f0e0001, i).toString(), new Object[] {
                s
            });

        case 1: // '\001'
            return String.format(getResources().getQuantityText(0x7f0e0002, i).toString(), new Object[] {
                s
            });
        }
        return null;
    }

    private void showEmergencyCallbackModeExitDialog()
    {
        if (mHandler != null && !isFinishing())
        {
            if (mInEmergencyCall)
            {
                mDialogType = 4;
                showDialog(4);
                return;
            }
            if (getIntent().getAction().equals("android.intent.action.ACTION_SHOW_NOTICE_ECM_BLOCK_OTHERS"))
            {
                mDialogType = 1;
                showDialog(1);
            } else
            if (getIntent().getAction().equals("com.android.phone.action.ACTION_SHOW_ECM_EXIT_DIALOG"))
            {
                mDialogType = 2;
                showDialog(2);
            }
            mTimer = (new CountDownTimer(mEcmTimeout, 1000L) {

                final EmergencyCallbackModeExitDialog this$0;

                public void onFinish()
                {
                }

                public void onTick(long l)
                {
                    CharSequence charsequence = getDialogText(l);
                    mAlertDialog.setMessage(charsequence);
                }

            
            {
                this$0 = EmergencyCallbackModeExitDialog.this;
                super(l, l1);
            }
            }
).start();
            return;
        } else
        {
            Log.w("ECM", "showEmergencyCallbackModeExitDialog, activity is finishing");
            return;
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        if (!Boolean.parseBoolean(SystemProperties.get("ril.cdma.inecmmode")))
            finish();
        mHandler = new Handler();
        (new Thread(null, mTask, "EcmExitDialogWaitThread")).start();
        mPhone = PhoneGlobals.getPhone();
        mPhone.registerForEcmTimerReset(mTimerResetHandler, 1, null);
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.EMERGENCY_CALLBACK_MODE_CHANGED");
        registerReceiver(mEcmExitReceiver, intentfilter);
    }

    protected Dialog onCreateDialog(int i)
    {
        switch (i)
        {
        case 3: // '\003'
            mProgressDialog = new ProgressDialog(this);
            mProgressDialog.setMessage(getText(0x7f0d0312));
            mProgressDialog.setIndeterminate(true);
            mProgressDialog.setCancelable(false);
            return mProgressDialog;

        case 4: // '\004'
            mAlertDialog = (new android.app.AlertDialog.Builder(this)).setIcon(0x7f02009b).setTitle(0x7f0d030f).setMessage(0x7f0d0311).setNeutralButton(0x7f0d0315, new android.content.DialogInterface.OnClickListener() {

                final EmergencyCallbackModeExitDialog this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    setResult(-1, (new Intent()).putExtra("exit_ecm_result", false));
                    finish();
                }

            
            {
                this$0 = EmergencyCallbackModeExitDialog.this;
                super();
            }
            }
).create();
            mAlertDialog.setOnDismissListener(this);
            return mAlertDialog;

        case 1: // '\001'
        case 2: // '\002'
            CharSequence charsequence = getDialogText(mEcmTimeout);
            mAlertDialog = (new android.app.AlertDialog.Builder(this)).setIcon(0x7f02009b).setTitle(0x7f0d030f).setMessage(charsequence).setPositiveButton(0x7f0d0313, new android.content.DialogInterface.OnClickListener() {

                final EmergencyCallbackModeExitDialog this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    mPhone.exitEmergencyCallbackMode();
                    showDialog(3);
                    mTimer.cancel();
                }

            
            {
                this$0 = EmergencyCallbackModeExitDialog.this;
                super();
            }
            }
).setNegativeButton(0x7f0d0314, new android.content.DialogInterface.OnClickListener() {

                final EmergencyCallbackModeExitDialog this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    setResult(-1, (new Intent()).putExtra("exit_ecm_result", false));
                    finish();
                }

            
            {
                this$0 = EmergencyCallbackModeExitDialog.this;
                super();
            }
            }
).create();
            mAlertDialog.setOnDismissListener(this);
            return mAlertDialog;
        }
        return null;
    }

    public void onDestroy()
    {
        super.onDestroy();
        unregisterReceiver(mEcmExitReceiver);
        mPhone.unregisterForEcmTimerReset(mHandler);
        mHandler = null;
    }

    public void onDismiss(DialogInterface dialoginterface)
    {
        setResult(-1, (new Intent()).putExtra("exit_ecm_result", false));
        finish();
    }

    protected void onRestoreInstanceState(Bundle bundle)
    {
        super.onRestoreInstanceState(bundle);
        mDialogType = bundle.getInt("DIALOG_TYPE");
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        bundle.putInt("DIALOG_TYPE", mDialogType);
    }



/*
    static boolean access$102(EmergencyCallbackModeExitDialog emergencycallbackmodeexitdialog, boolean flag)
    {
        emergencycallbackmodeexitdialog.mInEmergencyCall = flag;
        return flag;
    }

*/



}
