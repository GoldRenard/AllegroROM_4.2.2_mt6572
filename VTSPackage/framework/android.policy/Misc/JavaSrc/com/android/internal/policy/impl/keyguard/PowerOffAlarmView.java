// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.app.AlarmManager;
import android.content.*;
import android.os.*;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.internal.widget.LockPatternUtils;
import com.mediatek.common.voicecommand.IVoiceCommandManager;
import com.mediatek.common.voicecommand.VoiceCommandListener;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardSecurityView, MediatekGlowPadView, Alarm, KeyguardSecurityCallback, 
//            KeyguardUpdateMonitor

public class PowerOffAlarmView extends RelativeLayout
    implements KeyguardSecurityView, MediatekGlowPadView.OnTriggerListener
{

    private static final boolean DEBUG = false;
    private static final String DEFAULT_SNOOZE = "10";
    private static final String DEFAULT_VOLUME_BEHAVIOR = "2";
    private static final String DISABLE_POWER_KEY_ACTION = "android.intent.action.DISABLE_POWER_KEY";
    private static final boolean ENABLE_PING_AUTO_REPEAT = true;
    private static final String NORMAL_BOOT_ACTION = "android.intent.action.normal.boot";
    private static final String NORMAL_BOOT_DONE_ACTION = "android.intent.action.normal.boot.done";
    private static final long PING_AUTO_REPEAT_DELAY_MSEC = 1200L;
    private static final int PING_MESSAGE_WHAT = 101;
    protected static final String SCREEN_OFF = "screen_off";
    private static final String SNOOZE = "android.intent.action.SNOOZE";
    private static final String TAG = "PowerOffAlarm";
    private static final int UPDATE_LABEL = 99;
    private static final String UPDATE_LABEL_ACTION = "update.power.off.alarm.label";
    private final int DELAY_TIME_SECONDS;
    private boolean SUPPORT_VOICE_UI;
    protected Alarm mAlarm;
    private AlarmManager mAm;
    private KeyguardSecurityCallback mCallback;
    private Context mContext;
    private boolean mEnableFallback;
    private int mFailedPatternAttemptsSinceLastTimeout;
    private Button mForgotPatternButton;
    boolean mFullscreenStyle;
    private MediatekGlowPadView mGlowPadView;
    private final Handler mHandler;
    private boolean mIsDocked;
    private LockPatternUtils mLockPatternUtils;
    private boolean mPingEnabled;
    private final BroadcastReceiver mReceiver;
    private int mTotalFailedPatternAttempts;
    private TextView mVcTips;
    private LinearLayout mVcTipsContainer;
    private int mVolumeBehavior;
    private TextView titleView;
    private VoiceCommandListener voiceCmdListener;
    private IVoiceCommandManager voiceCmdManager;

    public PowerOffAlarmView(Context context)
    {
        this(context, null);
    }

    public PowerOffAlarmView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        DELAY_TIME_SECONDS = 7;
        mFailedPatternAttemptsSinceLastTimeout = 0;
        mTotalFailedPatternAttempts = 0;
        titleView = null;
        SUPPORT_VOICE_UI = false;
        mIsDocked = false;
        mPingEnabled = true;
        mHandler = new Handler() {

            final PowerOffAlarmView this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 99: // 'c'
                    if (titleView != null)
                    {
                        titleView.setText(message.getData().getString("label"));
                        return;
                    }
                    // fall through

                case 100: // 'd'
                default:
                    return;

                case 101: // 'e'
                    triggerPing();
                    return;
                }
            }

            
            {
                this$0 = PowerOffAlarmView.this;
                super();
            }
        }
;
        mReceiver = new BroadcastReceiver() {

            final PowerOffAlarmView this$0;

            public void onReceive(Context context1, Intent intent)
            {
                String s = intent.getAction();
                Log.v("PowerOffAlarm", (new StringBuilder()).append("receive action : ").append(s).toString());
                if ("update.power.off.alarm.label".equals(s))
                {
                    Message message = new Message();
                    message.what = 99;
                    Bundle bundle = new Bundle();
                    bundle.putString("label", intent.getStringExtra("label"));
                    message.setData(bundle);
                    mHandler.sendMessage(message);
                    context1.removeStickyBroadcast(intent);
                } else
                if (KeyguardUpdateMonitor.isAlarmBoot())
                {
                    snooze();
                    return;
                }
            }

            
            {
                this$0 = PowerOffAlarmView.this;
                super();
            }
        }
;
        mContext = context;
        if (SUPPORT_VOICE_UI)
            registerVoiceCmdService(context);
    }

    private void enableEventDispatching(boolean flag)
    {
        IWindowManager iwindowmanager;
        try
        {
            iwindowmanager = android.view.IWindowManager.Stub.asInterface(ServiceManager.getService("window"));
        }
        catch (RemoteException remoteexception)
        {
            Log.w("PowerOffAlarm", remoteexception.toString());
            return;
        }
        if (iwindowmanager == null)
            break MISSING_BLOCK_LABEL_23;
        iwindowmanager.setEventDispatching(flag);
    }

    private void powerOff()
    {
        unregisteVoiceCmd();
        sendBR("stop_ringtone");
    }

    private void powerOn()
    {
        enableEventDispatching(false);
        stopPlayAlarm();
        SystemProperties.set("service.bootanim.exit", "0");
        SystemProperties.set("ctl.start", "bootanim");
        Log.d("PowerOffAlarm", "start boot animation");
        sendBR("android.intent.action.normal.boot");
        unregisteVoiceCmd();
    }

    private void registerVoiceCmdService(Context context)
    {
        voiceCmdManager = (IVoiceCommandManager)context.getSystemService("voicecommand");
        if (voiceCmdManager != null)
            voiceCmdListener = new VoiceCommandListener("powerOffAlarm") {

                final PowerOffAlarmView this$0;

                public void onVoiceCommandNotified(int i, int j, Bundle bundle)
                {
                    int k;
                    k = bundle.getInt("Result");
                    bundle.getString("Reslut_INfo1");
                    if (i != 2) goto _L2; else goto _L1
_L1:
                    j;
                    JVM INSTR tableswitch 1 5: default 56
                //                               1 57
                //                               2 56
                //                               3 56
                //                               4 56
                //                               5 94;
                       goto _L3 _L4 _L3 _L3 _L3 _L5
_L3:
                    return;
_L4:
                    if (k == 1)
                    {
                        try
                        {
                            voiceCmdManager.sendCommand(mContext, 1, 1, null);
                            return;
                        }
                        catch (Exception exception)
                        {
                            exception.printStackTrace();
                        }
                        return;
                    }
                    continue; /* Loop/switch isn't completed */
_L5:
                    if (bundle.getInt("Result") == 1)
                    {
                        int l = bundle.getInt("Result_Info");
                        Log.v("PowerOffAlarm", (new StringBuilder()).append("voice command id = ").append(l).toString());
                        if (l == 5)
                        {
                            snooze();
                            return;
                        }
                        if (l == 16)
                        {
                            powerOn();
                            return;
                        }
                        if (l == 17)
                        {
                            powerOff();
                            return;
                        }
                    }
                    continue; /* Loop/switch isn't completed */
_L2:
                    if (i == 1 && j == 1 && bundle.getInt("Result") == 1)
                    {
                        String as[] = bundle.getStringArray("Result_Info");
                        String s = mContext.getString(0x205010a);
                        String s1 = mContext.getString(0x205010b);
                        if (TextUtils.isEmpty(s))
                        {
                            s = "\"";
                            s1 = "\"";
                        }
                        StringBuilder stringbuilder = new StringBuilder();
                        stringbuilder.append(mContext.getString(0x2050107));
                        stringbuilder.append(s).append(as[0]).append(s1);
                        stringbuilder.append(mContext.getString(0x2050109));
                        stringbuilder.append(s).append(as[1]).append(s1);
                        stringbuilder.append(mContext.getString(0x205010c));
                        stringbuilder.append(s).append(as[2]).append(s1);
                        stringbuilder.append(mContext.getString(0x2050108));
                        if (mVcTips != null)
                            mVcTips.setText(stringbuilder);
                        if (mVcTipsContainer != null)
                        {
                            mVcTipsContainer.setVisibility(0);
                            return;
                        }
                    }
                    if (true) goto _L3; else goto _L6
_L6:
                }

            
            {
                this$0 = PowerOffAlarmView.this;
                super(s);
            }
            }
;
    }

    private void sendBR(String s)
    {
        Log.w("PowerOffAlarm", (new StringBuilder()).append("send BR: ").append(s).toString());
        mContext.sendBroadcast(new Intent(s));
    }

    private void snooze()
    {
        Intent intent = new Intent("android.intent.action.SNOOZE");
        mContext.startService(intent);
        unregisteVoiceCmd();
    }

    private void stopPlayAlarm()
    {
        mContext.stopService(new Intent("com.android.deskclock.ALARM_ALERT"));
    }

    private void triggerPing()
    {
        if (mPingEnabled)
        {
            mGlowPadView.ping();
            mHandler.sendEmptyMessageDelayed(101, 1200L);
        }
    }

    private void unregisteVoiceCmd()
    {
        if (!SUPPORT_VOICE_UI || voiceCmdManager == null)
            break MISSING_BLOCK_LABEL_27;
        voiceCmdManager.unRegisterListener(voiceCmdListener);
        return;
        Exception exception;
        exception;
        exception.printStackTrace();
        return;
    }

    public void cleanUp()
    {
        mLockPatternUtils = null;
    }

    public KeyguardSecurityCallback getCallback()
    {
        return mCallback;
    }

    public void hideBouncer(int i)
    {
    }

    public boolean needsInput()
    {
        return false;
    }

    public void onDetachedFromWindow()
    {
        Log.v("PowerOffAlarm", "onDetachedFromWindow ....");
        mContext.unregisterReceiver(mReceiver);
    }

    public void onFinishFinalAnimation()
    {
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        Log.w("PowerOffAlarm", "onFinishInflate ... ");
        setKeepScreenOn(true);
        titleView = (TextView)findViewById(0x210005b);
        if (SUPPORT_VOICE_UI)
        {
            mVcTips = (TextView)findViewById(0x2100061);
            mVcTipsContainer = (LinearLayout)findViewById(0x2100060);
        }
        mGlowPadView = (MediatekGlowPadView)findViewById(0x2100062);
        mGlowPadView.setOnTriggerListener(this);
        setFocusableInTouchMode(true);
        triggerPing();
        IntentFilter intentfilter = new IntentFilter("android.intent.action.DOCK_EVENT");
        Intent intent = mContext.registerReceiver(null, intentfilter);
        LockPatternUtils lockpatternutils;
        if (intent != null)
        {
            IntentFilter intentfilter1;
            boolean flag;
            if (intent.getIntExtra("android.intent.extra.DOCK_STATE", -1) != 0)
                flag = true;
            else
                flag = false;
            mIsDocked = flag;
        }
        intentfilter1 = new IntentFilter("alarm_killed");
        intentfilter1.addAction("com.android.deskclock.ALARM_SNOOZE");
        intentfilter1.addAction("com.android.deskclock.ALARM_DISMISS");
        intentfilter1.addAction("update.power.off.alarm.label");
        mContext.registerReceiver(mReceiver, intentfilter1);
        if (mLockPatternUtils == null)
            lockpatternutils = new LockPatternUtils(mContext);
        else
            lockpatternutils = mLockPatternUtils;
        mLockPatternUtils = lockpatternutils;
        mAm = (AlarmManager)mContext.getSystemService("alarm");
        enableEventDispatching(true);
        if (!SUPPORT_VOICE_UI || voiceCmdManager == null)
            break MISSING_BLOCK_LABEL_292;
        voiceCmdManager.registerListener(voiceCmdListener);
        Log.v("PowerOffAlarm", "register and send command ...... ");
        voiceCmdManager.sendCommand(mContext, 2, 1, null);
        return;
        RemoteException remoteexception;
        remoteexception;
        remoteexception.printStackTrace();
        return;
        Exception exception;
        exception;
        exception.printStackTrace();
        return;
    }

    public void onGrabbed(View view, int i)
    {
    }

    public void onGrabbedStateChange(View view, int i)
    {
    }

    public void onPause()
    {
    }

    public void onReleased(View view, int i)
    {
    }

    public void onResume(int i)
    {
        reset();
        Log.v("PowerOffAlarm", "onResume");
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        return super.onTouchEvent(motionevent);
    }

    public void onTrigger(View view, int i)
    {
        switch (mGlowPadView.getResourceIdForTarget(i))
        {
        case 33685578: 
            powerOn();
            return;

        case 33685577: 
            powerOff();
            return;

        case 33685580: 
            snooze();
            return;

        case 33685579: 
        default:
            Log.e("PowerOffAlarm", "Trigger detected on unhandled resource. Skipping.");
            return;
        }
    }

    public void reset()
    {
    }

    public void setKeyguardCallback(KeyguardSecurityCallback keyguardsecuritycallback)
    {
        mCallback = keyguardsecuritycallback;
    }

    public void setLockPatternUtils(LockPatternUtils lockpatternutils)
    {
        mLockPatternUtils = lockpatternutils;
    }

    public void showBouncer(int i)
    {
    }

    public void showUsabilityHint()
    {
    }










}
