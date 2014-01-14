// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.app.ActivityManagerNative;
import android.app.IActivityManager;
import android.content.*;
import android.graphics.drawable.AnimationDrawable;
import android.os.*;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import com.android.internal.widget.LockPatternUtils;
import com.mediatek.common.voicecommand.IVoiceCommandManager;
import com.mediatek.common.voicecommand.VoiceCommandListener;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            BiometricSensorUnlock, KeyguardUpdateMonitor, KeyguardSecurityCallback, SecurityMessageDisplay

public class VoiceUnlock
    implements BiometricSensorUnlock, android.os.Handler.Callback, KeyguardHostView.OnDismissAction
{

    private static final boolean DEBUG = true;
    private static final int FAIL_TYPE_NOISY = 2;
    private static final int FAIL_TYPE_PASSWORD_WRONG = 1;
    private static final int FAIL_TYPE_SERVICE_ERROR = 0;
    private static final int FAIL_TYPE_WEAK = 3;
    private static final int INTENSITY_ANIMATION_INTERVAL = 90;
    private static final String KEY_VOICE_COMMAND1 = "voice_command1";
    private static final String KEY_VOICE_COMMAND2 = "voice_command2";
    private static final String KEY_VOICE_COMMAND3 = "voice_command3";
    private static final int MSG_CANCEL = 5;
    private static final int MSG_RECOGNIZE_FAIL = 2;
    private static final int MSG_RECOGNIZE_PASS = 1;
    private static final int MSG_SERVICE_ERROR = 3;
    private static final int MSG_SHOW_RECOGNIZE_READY = 0;
    private static final int MSG_UPDATE_INTENSITY = 4;
    private static final int SOUND_ATTENUATION = -6;
    private static final String SOUND_PATH = "system/media/audio/notifications/Tejat.ogg";
    private static final String TAG = "VoiceUnlock";
    private final int BACKUP_LOCK_TIMEOUT;
    private final long TIMEOUT_AFTER_UNLOCK_FAIL;
    private boolean mBoundToService;
    private ImageView mCancel;
    private final Context mContext;
    private Handler mHandler;
    private Handler mHideHandler;
    private Runnable mHideRunnable = new Runnable() {

        final VoiceUnlock this$0;

        public void run()
        {
            stop();
            pokeWakelock(5000);
        }

            
            {
                this$0 = VoiceUnlock.this;
                super();
            }
    }
;
    private Handler mIntensityHandler;
    private Runnable mIntensityRunnable = new Runnable() {

        final VoiceUnlock this$0;

        public void run()
        {
            if (mVoiceCommandManager != null)
                try
                {
                    log("sendCommand RECOGNIZE_INTENSITY");
                    mVoiceCommandManager.sendCommand(mContext, 4, 2, null);
                }
                catch (RemoteException remoteexception)
                {
                    remoteexception.printStackTrace();
                }
                catch (IllegalAccessException illegalaccessexception)
                {
                    illegalaccessexception.printStackTrace();
                }
            mIntensityHandler.postDelayed(this, 90L);
        }

            
            {
                this$0 = VoiceUnlock.this;
                super();
            }
    }
;
    private volatile boolean mIsRunning;
    KeyguardSecurityCallback mKeyguardScreenCallback;
    private String mLaunchApp;
    private final LockPatternUtils mLockPatternUtils;
    private SecurityMessageDisplay mSecurityMessageDisplay;
    private View mUnlockView;
    private VoiceCommandListener mVoiceCommandListener;
    private IVoiceCommandManager mVoiceCommandManager;
    private View mVoiceUnlockView;
    private ImageView mWave;
    private AnimationDrawable mWaveAnim;

    public VoiceUnlock(Context context)
    {
        this(context, null);
    }

    public VoiceUnlock(Context context, View view)
    {
        BACKUP_LOCK_TIMEOUT = 5000;
        TIMEOUT_AFTER_UNLOCK_FAIL = 3000L;
        mIsRunning = false;
        mBoundToService = false;
        mContext = context;
        mLockPatternUtils = new LockPatternUtils(context);
        mUnlockView = view;
        if (view != null)
            mSecurityMessageDisplay = new KeyguardMessageArea.Helper(view);
        mHandler = new Handler(this);
        mVoiceCommandManager = (IVoiceCommandManager)context.getSystemService("voicecommand");
        mVoiceCommandListener = new VoiceCommandListener(mContext) {

            final VoiceUnlock this$0;

            public void onVoiceCommandNotified(int i, int j, Bundle bundle)
            {
                int k = bundle.getInt("Result");
                log((new StringBuilder()).append("onNotified result=").append(k).append(" mainAction = ").append(i).append(" subAction = ").append(j).toString());
                if (k == 1)
                    switch (j)
                    {
                    case 2: // '\002'
                        int j1 = bundle.getInt("Result_Info");
                        log((new StringBuilder()).append("onNotified RECOGNIZE_INTENSITY intensity = ").append(j1).toString());
                        mHandler.removeMessages(4);
                        mHandler.obtainMessage(4, j1, 0).sendToTarget();
                        return;

                    case 3: // '\003'
                        int l = bundle.getInt("Result_Info");
                        log((new StringBuilder()).append("onNotified RECOGNIZE_NOTIFY verifyResult = ").append(l).toString());
                        if (l == 1)
                        {
                            int i1 = bundle.getInt("Reslut_INfo1");
                            log((new StringBuilder()).append("onNotified RECOGNIZE_NOTIFY commandId = ").append(i1).toString());
                            mHandler.obtainMessage(1, i1, 0).sendToTarget();
                            return;
                        } else
                        {
                            mHandler.obtainMessage(2, l, 0).sendToTarget();
                            return;
                        }

                    case 1: // '\001'
                        log("onNotified RECOGNIZE_START");
                        mHandler.obtainMessage(0).sendToTarget();
                        return;
                    }
                else
                if (k == 10)
                {
                    mHandler.obtainMessage(3).sendToTarget();
                    return;
                }
            }

            
            {
                this$0 = VoiceUnlock.this;
                super(context);
            }
        }
;
        mIntensityHandler = new Handler();
        mHideHandler = new Handler();
    }

    private void handleCancel()
    {
        log("handleCancel()");
        KeyguardUpdateMonitor.getInstance(mContext).setAlternateUnlockEnabled(false);
        mKeyguardScreenCallback.showBackupSecurity();
        stop();
        mKeyguardScreenCallback.userActivity(5000L);
    }

    private void handleUpdateIntensity(int i)
    {
        log((new StringBuilder()).append("updateIntensity intensity = ").append(i).toString());
        int j = i - 200;
        if (j < 128)
        {
            mWave.setImageLevel(0);
        } else
        {
            if (j < 256)
            {
                mWave.setImageLevel(1);
                return;
            }
            if (j < 512)
            {
                mWave.setImageLevel(2);
                return;
            }
            if (j < 1024)
            {
                mWave.setImageLevel(3);
                return;
            }
            if (j < 2048)
            {
                mWave.setImageLevel(4);
                return;
            }
        }
    }

    private void handleVoiceCommandFail(int i)
    {
        switch (i)
        {
        case 3: // '\003'
            mSecurityMessageDisplay.setMessage(0x2050104, true);
            reportFailedBiometricUnlockAttempt();
            break;

        case 2: // '\002'
            mSecurityMessageDisplay.setMessage(0x2050103, true);
            reportFailedBiometricUnlockAttempt();
            break;

        case 1: // '\001'
            mSecurityMessageDisplay.setMessage(0x2050102, true);
            reportFailedBiometricUnlockAttempt();
            break;

        case 0: // '\0'
            mSecurityMessageDisplay.setMessage(0x2050101, true);
            break;
        }
        mHandler.sendEmptyMessageDelayed(5, 3000L);
    }

    private void handleVoiceCommandPass(int i)
    {
        stop();
        switch (i)
        {
        case 3: // '\003'
            mLaunchApp = android.provider.Settings.System.getString(mContext.getContentResolver(), "voice_unlock_and_launch3");
            break;

        case 2: // '\002'
            mLaunchApp = android.provider.Settings.System.getString(mContext.getContentResolver(), "voice_unlock_and_launch2");
            break;

        case 1: // '\001'
            mLaunchApp = android.provider.Settings.System.getString(mContext.getContentResolver(), "voice_unlock_and_launch1");
            break;

        default:
            mLaunchApp = null;
            break;
        }
        log((new StringBuilder()).append("handleVoiceCommandPass commandId = ").append(i).append(" appName = ").append(mLaunchApp).toString());
        if (!mKeyguardScreenCallback.hasOnDismissAction())
        {
            log("onDismissAction is null, set voice unlock dismiss action");
            mKeyguardScreenCallback.setOnDismissAction(this);
        }
        mKeyguardScreenCallback.reportSuccessfulUnlockAttempt();
        mKeyguardScreenCallback.dismiss(true);
        pokeWakelock(10000);
    }

    private void handleVoiceServiceReady()
    {
        pokeWakelock(10000);
        mWaveAnim = (AnimationDrawable)mWave.getBackground();
        if (mWaveAnim.isRunning())
            mWaveAnim.stop();
        mWaveAnim.start();
        int i = 0;
        for (int j = 0; j < mWaveAnim.getNumberOfFrames(); j++)
            i += mWaveAnim.getDuration(j);

        mIntensityHandler.postDelayed(mIntensityRunnable, i);
    }

    private void log(String s)
    {
        Xlog.d("VoiceUnlock", s);
    }

    private void reportFailedBiometricUnlockAttempt()
    {
        Log.d("VoiceUnlock", "handleReportFailedAttempt()");
        KeyguardUpdateMonitor.getInstance(mContext).setAlternateUnlockEnabled(false);
        mKeyguardScreenCallback.reportFailedUnlockAttempt();
        mHideHandler.postDelayed(mHideRunnable, 5000L);
    }

    public void cleanUp()
    {
        log("cleanUp()");
        mVoiceCommandManager = null;
        mVoiceCommandListener = null;
    }

    public int getQuality()
    {
        return 16384;
    }

    public boolean handleMessage(Message message)
    {
label0:
        {
            switch (message.what)
            {
            default:
                break label0;

            case 5: // '\005'
                handleCancel();
                break;

            case 4: // '\004'
                handleUpdateIntensity(message.arg1);
                break;

            case 3: // '\003'
                handleVoiceCommandFail(0);
                break;

            case 2: // '\002'
                switch (message.arg1)
                {
                case 3: // '\003'
                    handleVoiceCommandFail(3);
                    break;

                case 2: // '\002'
                    handleVoiceCommandFail(2);
                    break;

                case 0: // '\0'
                case 100: // 'd'
                    handleVoiceCommandFail(1);
                    break;
                }
                break;

            case 1: // '\001'
                handleVoiceCommandPass(message.arg1);
                break;

            case 0: // '\0'
                handleVoiceServiceReady();
                break;
            }
            return true;
        }
        log("Unhandled message");
        return false;
    }

    public void initializeView(View view)
    {
        log("initializeView()");
        mVoiceUnlockView = view;
        mWave = (ImageView)view.findViewById(0x10203c1);
        mWave.setBackgroundResource(0x2020140);
        mWave.setImageResource(0x202013a);
        mWave.setImageLevel(0);
        mCancel = (ImageView)view.findViewById(0x10203c2);
        mCancel.setOnClickListener(new android.view.View.OnClickListener() {

            final VoiceUnlock this$0;

            public void onClick(View view1)
            {
                mHandler.obtainMessage(5).sendToTarget();
            }

            
            {
                this$0 = VoiceUnlock.this;
                super();
            }
        }
);
    }

    public boolean isRunning()
    {
        return mIsRunning;
    }

    public boolean onDismiss()
    {
        if (mLaunchApp == null)
            return false;
        ComponentName componentname = ComponentName.unflattenFromString(mLaunchApp);
        log((new StringBuilder()).append("onDismiss cn = ").append(componentname.toString()).toString());
        Intent intent = new Intent();
        intent.setComponent(componentname);
        intent.setAction("android.intent.action.MAIN");
        intent.setFlags(0x34000000);
        try
        {
            ActivityManagerNative.getDefault().dismissKeyguardOnNextActivity();
        }
        catch (RemoteException remoteexception)
        {
            log("can't dismiss keyguard on launch");
        }
        try
        {
            mContext.startActivityAsUser(intent, new UserHandle(mLockPatternUtils.getCurrentUser()));
            log((new StringBuilder()).append("startActivity intent = ").append(intent.toString()).toString());
        }
        catch (ActivityNotFoundException activitynotfoundexception)
        {
            log((new StringBuilder()).append("Activity not found for intent + ").append(intent.getAction()).toString());
            return false;
        }
        return true;
    }

    public void pokeWakelock(int i)
    {
        if (((PowerManager)mContext.getSystemService("power")).isScreenOn())
            mKeyguardScreenCallback.userActivity(i);
    }

    public void setKeyguardCallback(KeyguardSecurityCallback keyguardsecuritycallback)
    {
        mKeyguardScreenCallback = keyguardsecuritycallback;
    }

    public boolean start()
    {
        log((new StringBuilder()).append("start() mBoundToService = ").append(mBoundToService).toString());
        if (mHandler.getLooper() != Looper.myLooper())
            log("start() called off of the UI thread");
        if (mIsRunning)
            log("start() called when already running");
        mHideHandler.removeCallbacks(mHideRunnable);
        startUi();
        if (!mBoundToService && mVoiceCommandManager != null)
            try
            {
                log("register to service");
                mVoiceCommandManager.registerListener(mVoiceCommandListener);
                log("sendCommand RECOGNIZE_START");
                mVoiceCommandManager.sendCommand(mContext, 4, 1, null);
                mBoundToService = true;
            }
            catch (RemoteException remoteexception)
            {
                remoteexception.printStackTrace();
            }
            catch (IllegalAccessException illegalaccessexception)
            {
                illegalaccessexception.printStackTrace();
            }
        log("start() mIsRunning = true");
        mIsRunning = true;
        return true;
    }

    public void startUi()
    {
        log("startUi()");
        if (mHandler.getLooper() != Looper.myLooper())
            log("startUi() called off of the UI thread");
        if (mVoiceUnlockView != null)
            mVoiceUnlockView.setVisibility(0);
    }

    public boolean stop()
    {
        log((new StringBuilder()).append("stop() mBoundToService = ").append(mBoundToService).toString());
        if (mHandler.getLooper() != Looper.myLooper())
            log("stop() called off of the UI thread");
        mIntensityHandler.removeCallbacks(mIntensityRunnable);
        boolean flag = mIsRunning;
        stopUi();
        if (mBoundToService)
        {
            if (mVoiceCommandManager != null)
                try
                {
                    log("unregister to service");
                    mVoiceCommandManager.unRegisterListener(mVoiceCommandListener);
                }
                catch (RemoteException remoteexception)
                {
                    remoteexception.printStackTrace();
                }
                catch (IllegalAccessException illegalaccessexception)
                {
                    illegalaccessexception.printStackTrace();
                }
            mBoundToService = false;
        } else
        {
            log("Attempt to unRegisterListener from Voice Unlock when not bound");
        }
        log("stop() mIsRunning  = false");
        mIsRunning = false;
        return flag;
    }

    public void stopAndShowBackup()
    {
        Log.d("VoiceUnlock", "stopAndShowBackup()");
        mHandler.obtainMessage(5).sendToTarget();
    }

    public void stopUi()
    {
        log("stopUi()");
        if (mVoiceUnlockView != null)
        {
            mVoiceUnlockView.setVisibility(4);
            return;
        } else
        {
            log("mVoiceUnlockView is null in stopUi()");
            return;
        }
    }





}
