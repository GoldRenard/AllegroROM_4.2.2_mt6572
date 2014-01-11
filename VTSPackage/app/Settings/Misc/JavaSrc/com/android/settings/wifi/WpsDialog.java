// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi;

import android.app.AlertDialog;
import android.content.*;
import android.net.NetworkInfo;
import android.net.wifi.*;
import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.*;
import com.mediatek.xlog.Xlog;
import java.util.Timer;
import java.util.TimerTask;

public class WpsDialog extends AlertDialog
{
    class _cls1WpsListener
        implements android.net.wifi.WifiManager.WpsListener
    {

        final WpsDialog this$0;

        public void onCompletion()
        {
            updateDialog(DialogState.WPS_COMPLETE, mContext.getString(0x7f0b045a));
        }

        public void onFailure(int i)
        {
            String s;
            switch (i)
            {
            case 1: // '\001'
                s = mContext.getString(0x7f0b045c);
                break;

            case 5: // '\005'
                s = mContext.getString(0x7f0b045f);
                break;

            case 4: // '\004'
                s = mContext.getString(0x7f0b045e);
                break;

            case 3: // '\003'
                s = mContext.getString(0x7f0b0461);
                break;

            case 2: // '\002'
            default:
                s = mContext.getString(0x7f0b045d);
                break;
            }
            updateDialog(DialogState.WPS_FAILED, s);
        }

        public void onStartSuccess(String s)
        {
            if (s != null)
            {
                updateDialog(DialogState.WPS_START, String.format(mContext.getString(0x7f0b0459), new Object[] {
                    s
                }));
                return;
            } else
            {
                updateDialog(DialogState.WPS_START, mContext.getString(0x7f0b0458));
                return;
            }
        }

        _cls1WpsListener()
        {
            this$0 = WpsDialog.this;
            super();
        }
    }

    private static final class DialogState extends Enum
    {

        private static final DialogState $VALUES[];
        public static final DialogState CONNECTED;
        public static final DialogState WPS_COMPLETE;
        public static final DialogState WPS_FAILED;
        public static final DialogState WPS_INIT;
        public static final DialogState WPS_START;

        public static DialogState valueOf(String s)
        {
            return (DialogState)Enum.valueOf(com/android/settings/wifi/WpsDialog$DialogState, s);
        }

        public static DialogState[] values()
        {
            return (DialogState[])$VALUES.clone();
        }

        static 
        {
            WPS_INIT = new DialogState("WPS_INIT", 0);
            WPS_START = new DialogState("WPS_START", 1);
            WPS_COMPLETE = new DialogState("WPS_COMPLETE", 2);
            CONNECTED = new DialogState("CONNECTED", 3);
            WPS_FAILED = new DialogState("WPS_FAILED", 4);
            DialogState adialogstate[] = new DialogState[5];
            adialogstate[0] = WPS_INIT;
            adialogstate[1] = WPS_START;
            adialogstate[2] = WPS_COMPLETE;
            adialogstate[3] = CONNECTED;
            adialogstate[4] = WPS_FAILED;
            $VALUES = adialogstate;
        }

        private DialogState(String s, int i)
        {
            super(s, i);
        }
    }


    private static final String TAG = "WpsDialog";
    private static final int WPS_TIMEOUT_S = 120;
    private Button mButton;
    private Context mContext;
    DialogState mDialogState;
    private final IntentFilter mFilter = new IntentFilter();
    private Handler mHandler;
    private ProgressBar mProgressBar;
    private BroadcastReceiver mReceiver;
    private TextView mTextView;
    private ProgressBar mTimeoutBar;
    private Timer mTimer;
    private View mView;
    private WifiManager mWifiManager;
    private android.net.wifi.WifiManager.WpsListener mWpsListener;
    private int mWpsSetup;

    public WpsDialog(Context context, int i)
    {
        super(context);
        mHandler = new Handler();
        mDialogState = DialogState.WPS_INIT;
        mContext = context;
        mWpsSetup = i;
        mWpsListener = new _cls1WpsListener();
        mFilter.addAction("android.net.wifi.STATE_CHANGE");
        mFilter.addAction("android.net.wifi.WIFI_STATE_CHANGED");
        mReceiver = new BroadcastReceiver() {

            final WpsDialog this$0;

            public void onReceive(Context context1, Intent intent)
            {
                handleEvent(context1, intent);
            }

            
            {
                this$0 = WpsDialog.this;
                super();
            }
        }
;
    }

    private void handleEvent(Context context, Intent intent)
    {
        String s = intent.getAction();
        if ("android.net.wifi.STATE_CHANGE".equals(s))
        {
            if (((NetworkInfo)intent.getParcelableExtra("networkInfo")).getDetailedState() == android.net.NetworkInfo.DetailedState.CONNECTED && mDialogState == DialogState.WPS_COMPLETE)
            {
                WifiInfo wifiinfo = mWifiManager.getConnectionInfo();
                if (wifiinfo != null)
                {
                    String s1 = mContext.getString(0x7f0b045b);
                    Object aobj[] = new Object[1];
                    aobj[0] = wifiinfo.getSSID();
                    String s2 = String.format(s1, aobj);
                    updateDialog(DialogState.CONNECTED, s2);
                }
            }
        } else
        if ("android.net.wifi.WIFI_STATE_CHANGED".equals(s) && intent.getIntExtra("wifi_state", 4) == 1)
        {
            Xlog.d("WpsDialog", "handleEvent, wifi disabled");
            dismiss();
            return;
        }
    }

    private void updateDialog(final DialogState state, final String msg)
    {
        if (mDialogState.ordinal() >= state.ordinal())
        {
            return;
        } else
        {
            mDialogState = state;
            mHandler.post(new Runnable() {

                final WpsDialog this$0;
                final String val$msg;
                final DialogState val$state;

                public void run()
                {
                    static class _cls5
                    {

                        static final int $SwitchMap$com$android$settings$wifi$WpsDialog$DialogState[];

                        static 
                        {
                            $SwitchMap$com$android$settings$wifi$WpsDialog$DialogState = new int[DialogState.values().length];
                            try
                            {
                                $SwitchMap$com$android$settings$wifi$WpsDialog$DialogState[DialogState.WPS_COMPLETE.ordinal()] = 1;
                            }
                            catch (NoSuchFieldError nosuchfielderror) { }
                            try
                            {
                                $SwitchMap$com$android$settings$wifi$WpsDialog$DialogState[DialogState.CONNECTED.ordinal()] = 2;
                            }
                            catch (NoSuchFieldError nosuchfielderror1) { }
                            try
                            {
                                $SwitchMap$com$android$settings$wifi$WpsDialog$DialogState[DialogState.WPS_FAILED.ordinal()] = 3;
                            }
                            catch (NoSuchFieldError nosuchfielderror2)
                            {
                                return;
                            }
                        }
                    }

                    switch (_cls5..SwitchMap.com.android.settings.wifi.WpsDialog.DialogState[state.ordinal()])
                    {
                    case 2: // '\002'
                    case 3: // '\003'
                        mButton.setText(mContext.getString(0x7f0b066b));
                        mTimeoutBar.setVisibility(8);
                        mProgressBar.setVisibility(8);
                        if (mReceiver != null)
                        {
                            mContext.unregisterReceiver(mReceiver);
                            mReceiver = null;
                        }
                        break;

                    case 1: // '\001'
                        mTimeoutBar.setVisibility(8);
                        mProgressBar.setVisibility(0);
                        break;
                    }
                    mTextView.setText(msg);
                }

            
            {
                this$0 = WpsDialog.this;
                state = dialogstate;
                msg = s;
                super();
            }
            }
);
            return;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        Xlog.d("WpsDialog", "onCreate");
        mView = getLayoutInflater().inflate(0x7f0400b1, null);
        mTextView = (TextView)mView.findViewById(0x7f080244);
        mTextView.setText(0x7f0b0457);
        mTimeoutBar = (ProgressBar)mView.findViewById(0x7f080245);
        mTimeoutBar.setMax(120);
        mTimeoutBar.setProgress(0);
        mProgressBar = (ProgressBar)mView.findViewById(0x7f080246);
        mProgressBar.setVisibility(8);
        mButton = (Button)mView.findViewById(0x7f080247);
        mButton.setText(0x7f0b0490);
        mButton.setOnClickListener(new android.view.View.OnClickListener() {

            final WpsDialog this$0;

            public void onClick(View view)
            {
                dismiss();
            }

            
            {
                this$0 = WpsDialog.this;
                super();
            }
        }
);
        mWifiManager = (WifiManager)mContext.getApplicationContext().getSystemService("wifi");
        setView(mView);
        super.onCreate(bundle);
    }

    protected void onStart()
    {
        Xlog.d("WpsDialog", "onStart");
        mTimer = new Timer(false);
        mTimer.schedule(new TimerTask() {

            final WpsDialog this$0;

            public void run()
            {
                mHandler.post(new Runnable() {

                    final _cls3 this$1;

                    public void run()
                    {
                        mTimeoutBar.incrementProgressBy(1);
                    }

            
            {
                this$1 = _cls3.this;
                super();
            }
                }
);
            }

            
            {
                this$0 = WpsDialog.this;
                super();
            }
        }
, 1000L, 1000L);
        mContext.registerReceiver(mReceiver, mFilter);
        WpsInfo wpsinfo = new WpsInfo();
        wpsinfo.setup = mWpsSetup;
        mWifiManager.startWps(wpsinfo, mWpsListener);
    }

    protected void onStop()
    {
        Xlog.d("WpsDialog", "onStop");
        if (mDialogState != DialogState.WPS_COMPLETE)
            mWifiManager.cancelWps(null);
        if (mReceiver != null)
        {
            mContext.unregisterReceiver(mReceiver);
            mReceiver = null;
        }
        if (mTimer != null)
            mTimer.cancel();
    }










/*
    static BroadcastReceiver access$702(WpsDialog wpsdialog, BroadcastReceiver broadcastreceiver)
    {
        wpsdialog.mReceiver = broadcastreceiver;
        return broadcastreceiver;
    }

*/

}
