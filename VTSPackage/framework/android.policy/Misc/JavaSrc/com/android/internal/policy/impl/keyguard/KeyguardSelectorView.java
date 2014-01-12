// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.animation.ObjectAnimator;
import android.app.SearchManager;
import android.app.admin.DevicePolicyManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.SystemProperties;
import android.util.*;
import android.view.*;
import com.android.internal.widget.LockPatternUtils;
import com.mediatek.common.MediatekClassFactory;
import com.mediatek.common.hdmi.IHDMINative;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            LockScreenLayout, KeyguardSecurityView, KeyguardHostView, KeyguardUpdateMonitor, 
//            KeyguardSecurityViewHelper, MediatekGlowPadView, UnReadEventView, KeyguardUtils, 
//            KeyguardSecurityCallback, KeyguardActivityLauncher, KeyguardUpdateMonitorCallback, SecurityMessageDisplay

public class KeyguardSelectorView extends LockScreenLayout
    implements KeyguardSecurityView
{

    private static final String ASSIST_ICON_METADATA_NAME = "com.android.systemui.action_assist_icon";
    private static final boolean DEBUG = false;
    private static final String INCOMING_INDICATOR_ON_LOCKSCREEN = "incoming_indicator_on_lockscreen";
    private static final String TAG = "SecuritySelectorView";
    private final KeyguardActivityLauncher mActivityLauncher;
    private ObjectAnimator mAnim;
    private Drawable mBouncerFrame;
    private KeyguardSecurityCallback mCallback;
    private boolean mCameraDisabled;
    private View mFadeView;
    private MediatekGlowPadView mGlowPadView;
    private IHDMINative mHDMI;
    KeyguardUpdateMonitorCallback mInfoCallback = new KeyguardUpdateMonitorCallback() {

        final KeyguardSelectorView this$0;

        public void onDevicePolicyManagerStateChanged()
        {
            updateTargets();
        }

        public void onSimStateChanged(com.android.internal.telephony.IccCardConstants.State state)
        {
            updateTargets();
        }

            
            {
                this$0 = KeyguardSelectorView.this;
                super();
            }
    }
;
    private boolean mIsBouncing;
    private LockPatternUtils mLockPatternUtils;
    MediatekGlowPadView.OnTriggerListener mOnTriggerListener = new MediatekGlowPadView.OnTriggerListener() {

        final KeyguardSelectorView this$0;

        public void onFinishFinalAnimation()
        {
        }

        public void onGrabbed(View view, int i)
        {
            mCallback.userActivity(0L);
            doTransition(mFadeView, 0.0F);
        }

        public void onGrabbedStateChange(View view, int i)
        {
        }

        public void onReleased(View view, int i)
        {
            if (!mIsBouncing)
                doTransition(mFadeView, 1.0F);
        }

        public void onTrigger(View view, int i)
        {
            Intent intent;
            switch (mGlowPadView.getResourceIdForTarget(i))
            {
            case -1: 
                mCallback.userActivity(0L);
                if (isSecure())
                {
                    mCallback.dismiss(false);
                    return;
                }
                // fall through

            default:
                return;

            case 17302271: 
            case 17302274: 
                mCallback.userActivity(0L);
                mCallback.dismiss(false);
                return;

            case 17302241: 
                mActivityLauncher.launchCamera(null, null);
                mCallback.userActivity(0L);
                return;

            case 17302164: 
                intent = ((SearchManager)
// JavaClassFileOutputException: get_constant: invalid tag

            
            {
                this$0 = KeyguardSelectorView.this;
                super();
            }
    }
;
    private boolean mSearchDisabled;
    private SecurityMessageDisplay mSecurityMessageDisplay;

    public KeyguardSelectorView(Context context)
    {
        this(context, null);
    }

    public KeyguardSelectorView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mActivityLauncher = new KeyguardActivityLauncher() ;
        mHDMI = null;
        mLockPatternUtils = new LockPatternUtils(getContext());
        try
        {
            if (mHDMI == null)
                mHDMI = (IHDMINative)MediatekClassFactory.createInstance(com/mediatek/common/hdmi/IHDMINative, new Object[0]);
            return;
        }
        catch (Exception exception)
        {
            exception.printStackTrace();
        }
    }

    private void updateTargets()
    {
        int i = mLockPatternUtils.getCurrentUser();
        DevicePolicyManager devicepolicymanager = mLockPatternUtils.getDevicePolicyManager();
        int j = devicepolicymanager.getKeyguardDisabledFeatures(null, i);
        boolean flag;
        if (mLockPatternUtils.isSecure() && (j & 2) != 0)
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (!devicepolicymanager.getCameraDisabled(null, i) && !flag)
            flag1 = false;
        else
            flag1 = true;
        boolean flag2 = KeyguardUpdateMonitor.getInstance(getContext()).isSimPinSecure();
        boolean flag3 = isTargetPresent(0x10802e1);
        boolean flag4 = isTargetPresent(0x1080294);
        if (flag1)
            Log.v("SecuritySelectorView", "Camera disabled by Device Policy");
        else
        if (flag2)
            Log.v("SecuritySelectorView", "Camera disabled by Sim State");
        boolean flag5;
        if (android.provider.Settings.Secure.getIntForUser(mContext.getContentResolver(), "user_setup_complete", 0, i) != 0)
            flag5 = true;
        else
            flag5 = false;
        boolean flag6;
        if (((SearchManager)mContext.getSystemService("search")).getAssistIntent(mContext, -2) != null)
            flag6 = true;
        else
            flag6 = false;
        boolean flag7;
        if (!flag1 && !flag2 && flag3 && flag5)
            flag7 = false;
        else
            flag7 = true;
        mCameraDisabled = flag7;
        boolean flag8;
        if (!flag2 && flag6 && flag4 && flag5)
            flag8 = false;
        else
            flag8 = true;
        mSearchDisabled = flag8;
        updateResources();
    }

    void doTransition(View view, float f)
    {
        if (mAnim != null)
            mAnim.cancel();
        mAnim = ObjectAnimator.ofFloat(view, "alpha", new float[] {
            f
        });
        mAnim.start();
    }

    public KeyguardSecurityCallback getCallback()
    {
        return mCallback;
    }

    public MediatekGlowPadView getGlowPadView()
    {
        return mGlowPadView;
    }

    public void hideBouncer(int i)
    {
        mIsBouncing = false;
        KeyguardSecurityViewHelper.hideBouncer(mSecurityMessageDisplay, mFadeView, mBouncerFrame, i);
    }

    public boolean isSecure()
    {
        return mLockPatternUtils.isSecure() || KeyguardUpdateMonitor.getInstance(mContext).isSimPinSecure();
    }

    public boolean isTargetPresent(int i)
    {
        return mGlowPadView.getTargetPosition(i) != -1;
    }

    public boolean needsInput()
    {
        return false;
    }

    public void onDetachedFromWindow()
    {
        onDetachedFromWindow();
        mGlowPadView.setOnTriggerListener(null);
    }

    protected void onFinishInflate()
    {
        byte byte0 = 4;
        onFinishInflate();
        mGlowPadView = (MediatekGlowPadView)findViewById(0x10202b2);
        mGlowPadView.setOnTriggerListener(mOnTriggerListener);
        updateTargets();
        mSecurityMessageDisplay = new Helper(this);
        mBouncerFrame = findViewById(0x10202ff).getBackground();
        boolean flag = KeyguardUpdateMonitor.getInstance(getContext()).dmIsLocked();
        if (SystemProperties.get("ro.rgk.sm611.style").equals("samsun"))
        {
            mGlowPadView.setVisibility(8);
        } else
        {
            MediatekGlowPadView mediatekglowpadview = mGlowPadView;
            byte byte1;
            if (flag)
                byte1 = byte0;
            else
                byte1 = 0;
            mediatekglowpadview.setVisibility(byte1);
        }
        if (android.provider.Settings.System.getInt(getContext().getContentResolver(), "incoming_indicator_on_lockscreen", 1) == 1)
        {
            Log.d("SecuritySelectorView", "constructor infalte newevent feature related views");
            mGlowPadView.setLockScreenView(this);
            ViewGroup viewgroup = (ViewGroup)findViewById(0x1020300);
            LayoutInflater.from(mContext).inflate(0x2070011, viewgroup, true);
            UnReadEventView unreadeventview = (UnReadEventView)findViewById(0x2100046);
            if (!flag)
                byte0 = 0;
            unreadeventview.setVisibility(byte0);
            unreadeventview.updateQueryBaseTimeAndRefreshUnReadNumber(KeyguardUpdateMonitor.getInstance(mContext).getQueryBaseTime());
            setUnReadEventView(unreadeventview);
            mGlowPadView.syncUnReadEventView(unreadeventview);
        }
    }

    public void onPause()
    {
        KeyguardUpdateMonitor.getInstance(getContext()).removeCallback(mInfoCallback);
        KeyguardUtils.xlogD("SecuritySelectorView", (new StringBuilder()).append("onPause this=").append(this).append(", mInfoCallback=").append(mInfoCallback).toString());
        if (mHDMI != null)
            mHDMI.hdmiPortraitEnable(false);
        KeyguardUtils.xlogD("SecuritySelectorView", (new StringBuilder()).append("onPause this=").append(this).append(", hdmiPortraitEnable disable done").toString());
        if (mCallback != null)
            mCallback.updateClipChildren(true);
    }

    public void onResume(int i)
    {
        KeyguardUpdateMonitor.getInstance(getContext()).registerCallback(mInfoCallback);
        KeyguardUtils.xlogD("SecuritySelectorView", (new StringBuilder()).append("onResume this=").append(this).append(", mInfoCallback=").append(mInfoCallback).toString());
        if (mHDMI != null)
            mHDMI.hdmiPortraitEnable(true);
        KeyguardUtils.xlogD("SecuritySelectorView", (new StringBuilder()).append("onResume this=").append(this).append(", hdmiPortraitEnable enable done").toString());
        if (mCallback != null && !KeyguardUpdateMonitor.getInstance(getContext()).dmIsLocked())
            mCallback.updateClipChildren(false);
        if (mGlowPadView != null)
            mGlowPadView.reset(false);
    }

    public void onVisibilityChanged(View view, int i)
    {
        if (mCallback != null)
        {
            KeyguardSecurityCallback keyguardsecuritycallback = mCallback;
            boolean flag;
            if (i == 0)
                flag = true;
            else
                flag = false;
            keyguardsecuritycallback.updateKeyguardLayerVisibility(flag);
        }
    }

    public void reset()
    {
        mGlowPadView.reset(false);
    }

    public void setCarrierArea(View view)
    {
        mFadeView = view;
        mFadeView.setLayerType(2, null);
    }

    public void setKeyguardCallback(KeyguardSecurityCallback keyguardsecuritycallback)
    {
        mCallback = keyguardsecuritycallback;
        mCallback.updateKeyguardLayerVisibility(true);
    }

    public void setLockPatternUtils(LockPatternUtils lockpatternutils)
    {
        mLockPatternUtils = lockpatternutils;
    }

    public void showBouncer(int i)
    {
        mIsBouncing = true;
        KeyguardSecurityViewHelper.showBouncer(mSecurityMessageDisplay, mFadeView, mBouncerFrame, i);
    }

    public void showUsabilityHint()
    {
        mGlowPadView.ping();
    }

    public void updateResources()
    {
        boolean flag = true;
        if (!mSearchDisabled)
        {
            Intent intent = ((SearchManager)mContext.getSystemService("search")).getAssistIntent(mContext, -2);
            if (intent != null)
            {
                android.content.ComponentName componentname = intent.getComponent();
                if (!mGlowPadView.replaceTargetDrawablesIfPresent(componentname, "com.android.systemui.action_assist_icon_google", 0x1080294) && !mGlowPadView.replaceTargetDrawablesIfPresent(componentname, "com.android.systemui.action_assist_icon", 0x1080294))
                    Slog.w("SecuritySelectorView", (new StringBuilder()).append("Couldn't grab icon from package ").append(componentname).toString());
            }
        }
        MediatekGlowPadView mediatekglowpadview = mGlowPadView;
        boolean flag1;
        if (!mCameraDisabled)
            flag1 = flag;
        else
            flag1 = false;
        mediatekglowpadview.setEnableTarget(0x10802e1, flag1);
        MediatekGlowPadView mediatekglowpadview1 = mGlowPadView;
        if (mSearchDisabled)
            flag = false;
        mediatekglowpadview1.setEnableTarget(0x1080294, flag);
    }

    static 
    {
        DEBUG = KeyguardHostView.DEBUG;
    }










}
