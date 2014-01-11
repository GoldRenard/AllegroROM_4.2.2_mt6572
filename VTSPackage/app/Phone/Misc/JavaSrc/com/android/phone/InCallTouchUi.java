// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.*;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.internal.telephony.*;
import com.android.internal.widget.multiwaveview.GlowPadView;
import com.mediatek.phone.DualTalkUtils;
import com.mediatek.phone.InCallMenuState;
import com.mediatek.phone.ext.ExtensionManager;
import com.mediatek.phone.ext.InCallTouchUiExtension;
import com.mediatek.phone.vt.VTCallUtils;
import java.util.List;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, PhoneUtils, InCallScreen, InCallControlState, 
//            InCallUiState, RespondViaSmsManager, SmallerHitTargetTouchListener, NotificationMgr

public class InCallTouchUi extends FrameLayout
    implements android.view.View.OnClickListener, android.view.View.OnLongClickListener, com.android.internal.widget.multiwaveview.GlowPadView.OnTriggerListener, android.widget.PopupMenu.OnMenuItemClickListener, android.widget.PopupMenu.OnDismissListener
{

    private static final int ACTIVE_AND_HOLD_IN_SAME_PHONE = 13;
    private static final int ACTIVE_AND_TWO_HOLD = 15;
    private static final int ACTIVE_CALL_IS_NOT_EXIST = 11;
    private static final int ACTIVE_OR_HOLD_NOT_IN_SAME_PHONE = 14;
    private static final int ACTIVE_OUTGOING_CALL = 16;
    private static final int ACTIVE_VOICE_CALL_ONLY_ONE = 12;
    private static final int ACTIVE_VT_CALL = 10;
    private static final int ANSWER_CALL_ID = 0;
    private static final boolean DBG = true;
    private static final int DECLINE_CALL_ID = 2;
    private static final boolean ENABLE_PING_AUTO_REPEAT = true;
    private static final boolean ENABLE_PING_ON_RING_EVENTS = false;
    private static final int INCOMING_CALL_ACTION_DURATION = 500;
    private static final int INCOMING_CALL_WIDGET_PING = 101;
    private static final String LOG_TAG = "InCallTouchUi";
    private static final long PING_AUTO_REPEAT_DELAY_MSEC = 1200L;
    private static final int SEND_SMS_ID = 1;
    private Button mAddButton;
    private PhoneGlobals mApp;
    private CompoundButton mAudioButton;
    private PopupMenu mAudioModePopup;
    private boolean mAudioModePopupVisible;
    private ViewGroup mCdmaMergeButton;
    private CompoundButton mDialpadButton;
    private Button mEndButton;
    private ViewStub mExtraButtonRow;
    private ViewGroup mExtraButtonRowInflated;
    private Handler mHandler;
    protected boolean mHasPermanentMenuKey;
    private CompoundButton mHoldButton;
    private View mHoldSwapSpacer;
    private View mInCallControls;
    private InCallScreen mInCallScreen;
    private GlowPadView mIncomingCallWidget;
    private boolean mIncomingCallWidgetIsFadingOut;
    private boolean mIncomingCallWidgetShouldBeReset;
    private ImageButton mIncomingMenuButton;
    private int mIncomingVTCallIconMap[] = {
        0x7f02005e, 0x7f020060, 0x7f02005f, 0x7f020061, 0x7f020062
    };
    private int mIncomingVoiceCallMap[] = {
        0x7f020059, 0x7f02005b, 0x7f02005a, 0x7f02005c, 0x7f020057
    };
    private long mLastIncomingCallActionTime;
    private long mLastIncomingPingTime;
    private ViewGroup mManageConferenceButton;
    private ImageButton mManageConferenceButtonImage;
    private ImageButton mMenuButton;
    private Button mMergeButton;
    private CompoundButton mMuteButton;
    private boolean mNotShowDualTalkConference;
    private TextView mRejectCallNoti;
    private boolean mShowInCallControlsDuringHidingAnimation;
    private Button mSwapButton;

    public InCallTouchUi(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mIncomingCallWidgetShouldBeReset = true;
        mAudioModePopupVisible = false;
        mNotShowDualTalkConference = true;
        mHandler = new Handler() {

            final InCallTouchUi this$0;

            public void handleMessage(Message message)
            {
                if (mInCallScreen == null)
                    return;
                switch (message.what)
                {
                case 101: // 'e'
                    log("INCOMING_CALL_WIDGET_PING...");
                    triggerPing();
                    return;
                }
                Log.wtf("InCallTouchUi", (new StringBuilder()).append("mHandler: unexpected message: ").append(message).toString());
            }

            
            {
                this$0 = InCallTouchUi.this;
                super();
            }
        }
;
        mHasPermanentMenuKey = false;
        log("InCallTouchUi constructor...");
        log((new StringBuilder()).append("- this = ").append(this).toString());
        log((new StringBuilder()).append("- context ").append(context).append(", attrs ").append(attributeset).toString());
        mApp = PhoneGlobals.getInstance();
    }

    private void dumpBottomButtonState()
    {
        log((new StringBuilder()).append(" - dialpad: ").append(getButtonState(mDialpadButton)).toString());
        log((new StringBuilder()).append(" - speaker: ").append(getButtonState(mAudioButton)).toString());
        log((new StringBuilder()).append(" - mute: ").append(getButtonState(mMuteButton)).toString());
        log((new StringBuilder()).append(" - hold: ").append(getButtonState(mHoldButton)).toString());
        log((new StringBuilder()).append(" - swap: ").append(getButtonState(mSwapButton)).toString());
        log((new StringBuilder()).append(" - add: ").append(getButtonState(mAddButton)).toString());
        log((new StringBuilder()).append(" - merge: ").append(getButtonState(mMergeButton)).toString());
        log((new StringBuilder()).append(" - cdmaMerge: ").append(getButtonState(mCdmaMergeButton)).toString());
        log((new StringBuilder()).append(" - swap: ").append(getButtonState(mSwapButton)).toString());
        log((new StringBuilder()).append(" - manageConferenceButton: ").append(getButtonState(mManageConferenceButton)).toString());
    }

    private int getAllCallsStateMsg()
    {
label0:
        {
            DualTalkUtils dualtalkutils = DualTalkUtils.getInstance();
            if (dualtalkutils != null)
            {
                if (dualtalkutils.isRingingWhenOutgoing())
                {
                    log("ACTIVE_OUTGOING_CALL");
                    return 16;
                }
                if (VTCallUtils.isVTActive())
                {
                    log("ACTIVE_VT_CALL");
                    return 10;
                }
                if (dualtalkutils.isDualTalkMultipleHoldCase())
                {
                    log("ACTIVE_AND_TWO_HOLD");
                    return 15;
                }
                Call call = mApp.mCM.getActiveFgCall();
                Call call1 = mApp.mCM.getFirstActiveBgCall();
                if (call != null && call.getState().isAlive() && call1 != null && call1.getState().isAlive() && call.getPhone() == call1.getPhone())
                {
                    log("ACTIVE_AND_HOLD_IN_SAME_PHONE");
                    return 13;
                }
                if (call != null && call.getState().isAlive() && call1 != null && call1.getState().isAlive() && call.getPhone() != call1.getPhone() || dualtalkutils.hasDualHoldCallsOnly())
                    break label0;
                dualtalkutils.getAllActiveCalls();
                List list = dualtalkutils.getAllActiveCalls();
                log((new StringBuilder()).append("activeCalls : ").append(list.size()).toString());
                if (list.size() == 0)
                {
                    log("ACTIVE_CALL_IS_NOT_EXIST");
                    return 11;
                }
                if (1 == list.size() && !VTCallUtils.isVTActive())
                {
                    log("ACTIVE_CALL_ONLY_ONE");
                    return 12;
                }
            }
            return -1;
        }
        log("ACTIVE_OR_HOLD_NOT_IN_SAME_PHONE");
        return 14;
    }

    private static String getButtonState(View view)
    {
        if (view == null)
            return "(null)";
        StringBuilder stringbuilder = new StringBuilder();
        StringBuilder stringbuilder1 = (new StringBuilder()).append("visibility: ");
        String s;
        if (view.getVisibility() == 0)
            s = "VISIBLE";
        else
        if (view.getVisibility() == 4)
            s = "INVISIBLE";
        else
            s = "GONE";
        stringbuilder.append(stringbuilder1.append(s).toString());
        if (view instanceof ImageButton)
            stringbuilder.append((new StringBuilder()).append(", enabled: ").append(((ImageButton)view).isEnabled()).toString());
        else
        if (view instanceof CompoundButton)
        {
            stringbuilder.append((new StringBuilder()).append(", enabled: ").append(((CompoundButton)view).isEnabled()).toString());
            stringbuilder.append((new StringBuilder()).append(", checked: ").append(((CompoundButton)view).isChecked()).toString());
        }
        return stringbuilder.toString();
    }

    private int getColorIndexByCall(Call call)
    {
        int i = 5;
        android.provider.Telephony.SIMInfo siminfo = PhoneUtils.getSimInfoByCall(call);
        if (siminfo != null)
            i = siminfo.mColor;
        if (i == 5)
            i = 4;
        return i;
    }

    private int getExtraButtonVisibility()
    {
        if (mExtraButtonRowInflated != null)
            return mExtraButtonRowInflated.getVisibility();
        else
            return mExtraButtonRow.getVisibility();
    }

    private int getRejectCallNotifyMsg()
    {
        int i = -1;
        if (mRejectCallNoti == null)
            return i;
        if (DualTalkUtils.isSupportDualTalk())
        {
            boolean flag = mInCallScreen.mDualTalk.hasMultipleRingingCall();
            mInCallScreen.mDualTalk.getFirstActiveRingingCall();
            mInCallScreen.mDualTalk.getSecondActiveRingCall();
            switch (getAllCallsStateMsg())
            {
            case 12: // '\f'
                if (flag)
                {
                    if (false)
                        i = 0x7f0d007f;
                    else
                        i = 0x7f0d007c;
                } else
                if (false)
                    i = 0x7f0d007a;
                break;

            case 14: // '\016'
                if (flag)
                {
                    if (false)
                        i = 0x7f0d007d;
                    else
                        i = 0x7f0d007f;
                } else
                if (false)
                    i = 0x7f0d007d;
                break;

            case 11: // '\013'
                if (flag && (false || false))
                    i = 0x7f0d007c;
                break;

            case 13: // '\r'
                if (flag)
                {
                    if (false)
                        i = 0x7f0d007d;
                    else
                        i = 0x7f0d007f;
                } else
                if (false)
                    i = 0x7f0d007d;
                else
                    i = 0x7f0d007a;
                break;

            case 15: // '\017'
                i = 0x7f0d007a;
                break;

            case 10: // '\n'
                if (flag)
                    i = 0x7f0d007f;
                else
                    i = 0x7f0d007a;
                break;

            case 16: // '\020'
                if (flag)
                    i = 0x7f0d007e;
                else
                    i = 0x7f0d007b;
                break;
            }
        } else
        if (mApp.mCM.hasActiveFgCall() && mApp.mCM.hasActiveBgCall())
            i = 0x7f0d007a;
        return i;
    }

    private void handleAudioButtonClick()
    {
        PhoneGlobals.getInstance().pokeUserActivity();
        if (mInCallScreen.getUpdatedInCallControlState().bluetoothEnabled)
        {
            log("- handleAudioButtonClick: 'popup menu' mode...");
            showAudioModePopup();
            mAudioButton.setChecked(false);
            return;
        } else
        {
            log("- handleAudioButtonClick: 'speaker toggle' mode...");
            mInCallScreen.toggleSpeaker();
            return;
        }
    }

    private void hideIncomingCallWidget()
    {
        log("hideIncomingCallWidget()...");
        if (mIncomingCallWidget.getVisibility() == 0 && !mIncomingCallWidgetIsFadingOut)
        {
            ViewPropertyAnimator viewpropertyanimator = mIncomingCallWidget.animate();
            viewpropertyanimator.cancel();
            viewpropertyanimator.setDuration(250L);
            viewpropertyanimator.setListener(new AnimatorListenerAdapter() {

                final InCallTouchUi this$0;

                public void onAnimationCancel(Animator animator)
                {
                    log("IncomingCallWidget's hiding animation Canceled");
                    mIncomingCallWidget.animate().setListener(null);
                    mShowInCallControlsDuringHidingAnimation = false;
                    mIncomingCallWidgetIsFadingOut = false;
                    mIncomingCallWidgetShouldBeReset = true;
                }

                public void onAnimationEnd(Animator animator)
                {
                    log("IncomingCallWidget's hiding animation ended");
                    mIncomingCallWidget.setAlpha(1.0F);
                    mIncomingCallWidget.setVisibility(8);
                    mIncomingMenuButton.setVisibility(8);
                    mIncomingCallWidget.animate().setListener(null);
                    mShowInCallControlsDuringHidingAnimation = false;
                    mIncomingCallWidgetIsFadingOut = false;
                    mIncomingCallWidgetShouldBeReset = true;
                }

                public void onAnimationStart(Animator animator)
                {
                    log("IncomingCallWidget's hiding animation started");
                    mIncomingCallWidgetIsFadingOut = true;
                    if (mShowInCallControlsDuringHidingAnimation)
                    {
                        log("IncomingCallWidget's onAnimationStart, during hiding animation");
                        updateInCallControls(mApp.mCM);
                        mInCallControls.setVisibility(0);
                    }
                }

            
            {
                this$0 = InCallTouchUi.this;
                super();
            }
            }
);
            viewpropertyanimator.alpha(0.0F);
            return;
        } else
        {
            log("Skipping hideIncomingCallWidget action");
            return;
        }
    }

    private void log(String s)
    {
        Log.d("InCallTouchUi", s);
    }

    private boolean okToShowInCallControls()
    {
        return mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.NORMAL || mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.CALL_ENDED;
    }

    private void setExtraButtonVisibility(int i)
    {
        if (mExtraButtonRow != null)
        {
            mExtraButtonRow.setVisibility(i);
            if (i == 0)
            {
                mExtraButtonRowInflated = (ViewGroup)mInCallControls.findViewById(0x7f080077);
                mExtraButtonRowInflated.setVisibility(0);
                mExtraButtonRow = null;
            }
        } else
        if (mExtraButtonRowInflated != null)
        {
            mExtraButtonRowInflated.setVisibility(i);
            return;
        }
    }

    private void setupExtraButtons()
    {
        mCdmaMergeButton = (ViewGroup)mInCallControls.findViewById(0x7f080065);
        if (mCdmaMergeButton == null)
        {
            Log.wtf("InCallTouchUi", "CDMA Merge button is null even after ViewStub being inflated.");
            return;
        } else
        {
            mCdmaMergeButton.setOnClickListener(this);
            mManageConferenceButton = (ViewGroup)mInCallControls.findViewById(0x7f080062);
            mManageConferenceButton.setOnClickListener(this);
            mManageConferenceButtonImage = (ImageButton)mInCallControls.findViewById(0x7f080063);
            return;
        }
    }

    private void showAudioModePopup()
    {
        log("showAudioModePopup()...");
        if (mAudioModePopup != null)
        {
            log("AudioModePopup already show, return ...");
            return;
        }
        mAudioModePopup = new PopupMenu(mInCallScreen, mAudioButton);
        mAudioModePopup.getMenuInflater().inflate(0x7f100001, mAudioModePopup.getMenu());
        mAudioModePopup.setOnMenuItemClickListener(this);
        mAudioModePopup.setOnDismissListener(this);
        InCallControlState incallcontrolstate = mInCallScreen.getUpdatedInCallControlState();
        Menu menu = mAudioModePopup.getMenu();
        menu.findItem(0x7f080134).setEnabled(incallcontrolstate.speakerEnabled);
        MenuItem menuitem = menu.findItem(0x7f080135);
        MenuItem menuitem1 = menu.findItem(0x7f080136);
        boolean flag = mApp.isHeadsetPlugged();
        boolean flag1;
        if (!flag)
            flag1 = true;
        else
            flag1 = false;
        menuitem.setVisible(flag1);
        boolean flag2 = false;
        if (!flag)
            flag2 = true;
        menuitem.setEnabled(flag2);
        menuitem1.setVisible(flag);
        menuitem1.setEnabled(flag);
        menu.findItem(0x7f080137).setEnabled(incallcontrolstate.bluetoothEnabled);
        mAudioModePopup.show();
        mAudioModePopupVisible = true;
    }

    private void showIncomingCallWidget(Call call)
    {
        log("showIncomingCallWidget()...");
        ViewPropertyAnimator viewpropertyanimator = mIncomingCallWidget.animate();
        if (viewpropertyanimator != null)
            viewpropertyanimator.cancel();
        mShowInCallControlsDuringHidingAnimation = false;
        mIncomingCallWidget.setAlpha(1.0F);
        boolean flag = DualTalkUtils.isSupportDualTalk();
        boolean flag1 = false;
        if (flag)
        {
            DualTalkUtils dualtalkutils = mInCallScreen.mDualTalk;
            flag1 = false;
            if (dualtalkutils != null)
            {
                flag1 = mInCallScreen.mDualTalk.hasMultipleRingingCall();
                if (flag1)
                    call = mInCallScreen.mDualTalk.getFirstActiveRingingCall();
            }
        }
        boolean flag2 = RespondViaSmsManager.allowRespondViaSmsForCall(mInCallScreen, call);
        int i;
        if (flag2)
            i = 0x7f070006;
        else
            i = 0x7f070009;
        if (i != mIncomingCallWidget.getTargetResourceId())
        {
            if (flag2)
            {
                mIncomingCallWidget.setTargetResources(i);
                mIncomingCallWidget.setTargetDescriptionsResourceId(0x7f070007);
                mIncomingCallWidget.setDirectionDescriptionsResourceId(0x7f070008);
            } else
            {
                mIncomingCallWidget.setTargetResources(i);
                mIncomingCallWidget.setTargetDescriptionsResourceId(0x7f07000a);
                mIncomingCallWidget.setDirectionDescriptionsResourceId(0x7f07000b);
            }
            mIncomingCallWidgetShouldBeReset = true;
        }
        if (VTCallUtils.isVideoCall(call))
        {
            if (flag1)
                mIncomingCallWidget.setHandleDrawableImage(mIncomingVTCallIconMap[getColorIndexByCall(call)]);
            else
                mIncomingCallWidget.setHandleDrawableImage(0x7f020062);
        } else
        if (flag1)
            mIncomingCallWidget.setHandleDrawableImage(mIncomingVoiceCallMap[getColorIndexByCall(call)]);
        else
            mIncomingCallWidget.setHandleDrawableImage(0x7f020057);
        if (mIncomingCallWidgetShouldBeReset)
        {
            mIncomingCallWidget.reset(false);
            mIncomingCallWidgetShouldBeReset = false;
        }
        if (PhoneUtils.isLandscape(getContext()))
        {
            TextView textview = (TextView)mIncomingCallWidget.getRootView().findViewById(0x7f0800ee);
            if (textview != null)
                textview.setGravity(3);
        }
        mIncomingCallWidget.setVisibility(0);
        int j = 1;
        if (call != null && call.getPhone() != null)
            j = call.getPhone().getPhoneType();
        long l = SystemClock.uptimeMillis();
        if (3 == j && 0L != mLastIncomingPingTime && l < 1200L + mLastIncomingPingTime)
        {
            log("updateState: Too soon after last update widget; not resend!");
        } else
        {
            mHandler.removeMessages(101);
            mHandler.sendEmptyMessageDelayed(101, 250L);
            if (3 == j)
            {
                mLastIncomingPingTime = SystemClock.uptimeMillis();
                return;
            }
        }
    }

    private void updateAudioButton(InCallControlState incallcontrolstate)
    {
        char c = '\377';
        log("updateAudioButton()...");
        boolean flag = false;
        boolean flag1 = false;
        boolean flag2 = false;
        boolean flag3;
        boolean flag4;
        if (incallcontrolstate.bluetoothEnabled)
        {
            log("- updateAudioButton: 'popup menu action button' mode...");
            mAudioButton.setEnabled(true);
            mAudioButton.setChecked(false);
            flag4 = true;
            if (incallcontrolstate.bluetoothIndicatorOn)
                flag3 = true;
            else
            if (incallcontrolstate.speakerOn)
            {
                flag = true;
                flag3 = false;
                flag2 = false;
                flag1 = false;
            } else
            {
                flag2 = true;
                flag3 = false;
                flag1 = false;
                flag = false;
            }
        } else
        if (incallcontrolstate.speakerEnabled)
        {
            log("- updateAudioButton: 'speaker toggle' mode...");
            mAudioButton.setEnabled(true);
            mAudioButton.setChecked(incallcontrolstate.speakerOn);
            flag = incallcontrolstate.speakerOn;
            if (!incallcontrolstate.speakerOn)
                flag1 = true;
            else
                flag1 = false;
            flag3 = false;
            flag2 = false;
            flag4 = false;
        } else
        {
            log("- updateAudioButton: disabled...");
            mAudioButton.setEnabled(false);
            mAudioButton.setChecked(false);
            flag1 = true;
            flag3 = false;
            flag2 = false;
            flag4 = false;
            flag = false;
        }
        LayerDrawable layerdrawable = (LayerDrawable)mAudioButton.getBackground();
        log((new StringBuilder()).append("- 'layers' drawable: ").append(layerdrawable).toString());
        Drawable drawable = layerdrawable.findDrawableByLayerId(0x7f08012c);
        char c1;
        if (flag4)
            c1 = c;
        else
            c1 = '\0';
        drawable.setAlpha(c1);
        Drawable drawable1 = layerdrawable.findDrawableByLayerId(0x7f08012d);
        char c2;
        if (flag3)
            c2 = c;
        else
            c2 = '\0';
        drawable1.setAlpha(c2);
        Drawable drawable2 = layerdrawable.findDrawableByLayerId(0x7f08012e);
        char c3;
        if (flag2)
            c3 = c;
        else
            c3 = '\0';
        drawable2.setAlpha(c3);
        Drawable drawable3 = layerdrawable.findDrawableByLayerId(0x7f08012f);
        char c4;
        if (flag)
            c4 = c;
        else
            c4 = '\0';
        drawable3.setAlpha(c4);
        Drawable drawable4 = layerdrawable.findDrawableByLayerId(0x7f080130);
        if (!flag1)
            c = '\0';
        drawable4.setAlpha(c);
        if (SystemProperties.get("ro.rgk.sm611.style").equals("samsun"))
            if (flag3)
            {
                mAudioButton.setText(0x7f0d019b);
            } else
            {
                if (flag2)
                {
                    mAudioButton.setText(0x7f0d0199);
                    return;
                }
                if (flag1 || flag)
                {
                    mAudioButton.setText(0x7f0d0198);
                    return;
                }
            }
    }

    public void cancelIncomingCallActionTime()
    {
        log("cancelIncomingCallActionTime()");
        mLastIncomingCallActionTime = SystemClock.uptimeMillis() - 500L;
    }

    public void cancelIncomingPingTime()
    {
        mLastIncomingPingTime = 1200L + SystemClock.uptimeMillis();
        log((new StringBuilder()).append("cancelIncomingPingTime()").append(mLastIncomingPingTime).toString());
    }

    public void dismissAudioModePopup()
    {
        if (mAudioModePopup != null)
        {
            mAudioModePopup.dismiss();
            mAudioModePopup = null;
            mAudioModePopupVisible = false;
        }
    }

    public int getTouchUiHeight()
    {
        int i = 0 + (int)getResources().getDimension(0x7f0c000a) + (int)getResources().getDimension(0x7f0c000b);
        if (getExtraButtonVisibility() == 0 || PhoneUtils.isConferenceCall(PhoneGlobals.getInstance().mCM.getActiveFgCall()) && mNotShowDualTalkConference)
            i += (int)getResources().getDimension(0x7f0c000a);
        return i + (int)getResources().getDimension(0x7f0c0005);
    }

    public void onClick(View view)
    {
        int i = view.getId();
        log((new StringBuilder()).append("onClick(View ").append(view).append(", id ").append(i).append(")...").toString());
        switch (i)
        {
        case 2131230857: 
        case 2131230859: 
            mInCallScreen.handleOnscreenButtonClick(i);
            return;

        case 2131230846: 
            handleAudioButtonClick();
            return;

        case 2131230818: 
        case 2131230821: 
        case 2131230841: 
        case 2131230845: 
        case 2131230847: 
        case 2131230852: 
        case 2131230853: 
        case 2131230855: 
        case 2131230856: 
            mInCallScreen.handleOnscreenButtonClick(i);
            return;
        }
        Log.w("InCallTouchUi", (new StringBuilder()).append("onClick: unexpected click: View ").append(view).append(", id ").append(i).toString());
    }

    public void onDismiss(PopupMenu popupmenu)
    {
        log((new StringBuilder()).append("- onDismiss: ").append(popupmenu).toString());
        mAudioModePopupVisible = false;
        mAudioModePopup = null;
    }

    public void onFinishFinalAnimation()
    {
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        log((new StringBuilder()).append("InCallTouchUi onFinishInflate(this = ").append(this).append(")...").toString());
        mHasPermanentMenuKey = ViewConfiguration.get(getContext()).hasPermanentMenuKey();
        mIncomingCallWidget = (GlowPadView)findViewById(0x7f08008a);
        mIncomingCallWidget.setOnTriggerListener(this);
        mInCallControls = findViewById(0x7f080074);
        mRejectCallNoti = (TextView)findViewById(0x7f08008c);
        mMenuButton = (ImageButton)mInCallControls.findViewById(0x7f080089);
        if (mHasPermanentMenuKey)
        {
            mAddButton = (Button)mInCallControls.findViewById(0x7f080087);
            if (mAddButton != null)
            {
                mAddButton.setOnClickListener(this);
                mAddButton.setOnLongClickListener(this);
            }
            mMergeButton = (Button)mInCallControls.findViewById(0x7f080088);
            if (mMergeButton != null)
            {
                mMergeButton.setOnClickListener(this);
                mMergeButton.setOnLongClickListener(this);
            }
            if (mMenuButton != null)
                mMenuButton.setVisibility(8);
        } else
        {
            String s = SystemProperties.get("ro.build.characteristics");
            mAddButton = (Button)mInCallControls.findViewById(0x7f080087);
            if (mAddButton != null)
                if (s != null && s.equals("tablet"))
                    mAddButton.setOnClickListener(this);
                else
                    mAddButton.setVisibility(8);
            mMergeButton = (Button)mInCallControls.findViewById(0x7f080088);
            if (mMergeButton != null)
                if (s != null && s.equals("tablet"))
                    mMergeButton.setOnClickListener(this);
                else
                    mMergeButton.setVisibility(8);
            if (mMenuButton != null)
            {
                mMenuButton.setOnClickListener(this);
                mMenuButton.setVisibility(0);
            }
        }
        mIncomingMenuButton = (ImageButton)findViewById(0x7f08008b);
        mIncomingMenuButton.setOnClickListener(this);
        mEndButton = (Button)mInCallControls.findViewById(0x7f080079);
        mEndButton.setOnClickListener(this);
        mDialpadButton = (CompoundButton)mInCallControls.findViewById(0x7f08007d);
        mDialpadButton.setOnClickListener(this);
        mDialpadButton.setOnLongClickListener(this);
        mMuteButton = (CompoundButton)mInCallControls.findViewById(0x7f08007f);
        mMuteButton.setOnClickListener(this);
        mMuteButton.setOnLongClickListener(this);
        mAudioButton = (CompoundButton)mInCallControls.findViewById(0x7f08007e);
        mAudioButton.setOnClickListener(this);
        mAudioButton.setOnLongClickListener(this);
        mHoldButton = (CompoundButton)mInCallControls.findViewById(0x7f080084);
        mHoldButton.setOnClickListener(this);
        mHoldButton.setOnLongClickListener(this);
        mSwapButton = (Button)mInCallControls.findViewById(0x7f080085);
        mSwapButton.setOnClickListener(this);
        mSwapButton.setOnLongClickListener(this);
        mHoldSwapSpacer = mInCallControls.findViewById(0x7f080086);
        mExtraButtonRow = (ViewStub)mInCallControls.findViewById(0x7f080076);
        if (!PhoneUtils.isLandscape(getContext()))
            mEndButton.setOnTouchListener(new SmallerHitTargetTouchListener());
        SmallerHitTargetTouchListener smallerhittargettouchlistener = new SmallerHitTargetTouchListener();
        mEndButton.setOnTouchListener(smallerhittargettouchlistener);
        ExtensionManager.getInstance().getInCallTouchUiExtension().onFinishInflate(this);
    }

    public void onGrabbed(View view, int i)
    {
    }

    public void onGrabbedStateChange(View view, int i)
    {
        if (mInCallScreen != null)
            switch (i)
            {
            default:
                Log.e("InCallTouchUi", (new StringBuilder()).append("onGrabbedStateChange: unexpected grabbedState: ").append(i).toString());
                // fall through

            case 0: // '\0'
            case 1: // '\001'
                mInCallScreen.updateIncomingCallWidgetHint(0, 0);
                break;
            }
    }

    public void onIncomingRing()
    {
    }

    public boolean onLongClick(View view)
    {
        int i = view.getId();
        log((new StringBuilder()).append("onLongClick(View ").append(view).append(", id ").append(i).append(")...").toString());
        switch (i)
        {
        case 2131230845: 
        case 2131230846: 
        case 2131230847: 
        case 2131230852: 
        case 2131230853: 
        case 2131230855: 
        case 2131230856: 
            CharSequence charsequence = view.getContentDescription();
            if (!TextUtils.isEmpty(charsequence))
            {
                Toast toast = Toast.makeText(view.getContext(), charsequence, 0);
                toast.setGravity(81, 0, view.getHeight());
                toast.show();
            }
            return true;

        case 2131230848: 
        case 2131230849: 
        case 2131230850: 
        case 2131230851: 
        case 2131230854: 
        default:
            Log.w("InCallTouchUi", (new StringBuilder()).append("onLongClick() with unexpected View ").append(view).append(". Ignoring it.").toString());
            return false;
        }
    }

    public boolean onMenuItemClick(MenuItem menuitem)
    {
        log((new StringBuilder()).append("- onMenuItemClick: ").append(menuitem).toString());
        log((new StringBuilder()).append("  id: ").append(menuitem.getItemId()).toString());
        log((new StringBuilder()).append("  title: '").append(menuitem.getTitle()).append("'").toString());
        if (mInCallScreen == null)
        {
            Log.w("InCallTouchUi", (new StringBuilder()).append("onMenuItemClick(").append(menuitem).append("), but null mInCallScreen!").toString());
            return true;
        }
        switch (menuitem.getItemId())
        {
        case 2131231031: 
            mInCallScreen.switchInCallAudio(InCallScreen.InCallAudioMode.BLUETOOTH);
            return true;

        case 2131231029: 
        case 2131231030: 
            mInCallScreen.switchInCallAudio(InCallScreen.InCallAudioMode.EARPIECE);
            return true;

        case 2131231028: 
            mInCallScreen.switchInCallAudio(InCallScreen.InCallAudioMode.SPEAKER);
            return true;
        }
        Log.wtf("InCallTouchUi", (new StringBuilder()).append("onMenuItemClick:  unexpected View ID ").append(menuitem.getItemId()).append(" (MenuItem = '").append(menuitem).append("')").toString());
        return true;
    }

    public void onReleased(View view, int i)
    {
    }

    public void onTrigger(View view, int i)
    {
        log((new StringBuilder()).append("onTrigger(whichHandle = ").append(i).append(")...").toString());
        if (mInCallScreen == null)
        {
            Log.wtf("InCallTouchUi", (new StringBuilder()).append("onTrigger(").append(i).append(") from incoming-call widget, but null mInCallScreen!").toString());
            return;
        }
        mShowInCallControlsDuringHidingAnimation = false;
        switch (i)
        {
        case 2: // '\002'
            log("DECLINE_CALL_ID: reject!");
            mInCallScreen.handleOnscreenButtonClick(0x7f080009);
            mLastIncomingCallActionTime = SystemClock.uptimeMillis();
            break;

        case 1: // '\001'
            log("SEND_SMS_ID!");
            mInCallScreen.handleOnscreenButtonClick(0x7f08000a);
            break;

        case 0: // '\0'
            log("ANSWER_CALL_ID: answer!");
            cancelIncomingPingTime();
            mInCallScreen.handleOnscreenButtonClick(0x7f080008);
            mShowInCallControlsDuringHidingAnimation = true;
            mLastIncomingCallActionTime = SystemClock.uptimeMillis();
            break;

        default:
            Log.wtf("InCallTouchUi", (new StringBuilder()).append("onDialTrigger: unexpected whichHandle value: ").append(i).toString());
            break;
        }
        hideIncomingCallWidget();
        mInCallScreen.updateIncomingCallWidgetHint(0, 0);
    }

    public void refreshAudioModePopup()
    {
        if (mAudioModePopup != null && mAudioModePopupVisible)
        {
            mAudioModePopup.dismiss();
            showAudioModePopup();
        }
    }

    void setInCallScreenInstance(InCallScreen incallscreen)
    {
        mInCallScreen = incallscreen;
    }

    public void triggerPing()
    {
        log((new StringBuilder()).append("triggerPing: mIncomingCallWidget = ").append(mIncomingCallWidget).toString());
        if (!mInCallScreen.isForegroundActivity())
        {
            log("- triggerPing: InCallScreen no longer in foreground; ignoring...");
            return;
        }
        if (mIncomingCallWidget == null)
        {
            Log.w("InCallTouchUi", "- triggerPing: null mIncomingCallWidget!");
            return;
        }
        log((new StringBuilder()).append("- triggerPing: mIncomingCallWidget visibility = ").append(mIncomingCallWidget.getVisibility()).toString());
        if (mIncomingCallWidget.getVisibility() != 0)
        {
            log("- triggerPing: mIncomingCallWidget no longer visible; ignoring...");
            return;
        } else
        {
            mIncomingCallWidget.ping();
            mHandler.sendEmptyMessageDelayed(101, 1200L);
            return;
        }
    }

    void updateInCallControls(CallManager callmanager)
    {
        boolean flag = true;
        if (PhoneUtils.isDMLocked())
        {
            updateInCallControlsDuringDMLocked();
            return;
        }
        int i;
        if (DualTalkUtils.isSupportDualTalk() && mInCallScreen.mDualTalk.isCdmaAndGsmActive())
            i = mInCallScreen.mDualTalk.getActiveFgCall().getPhone().getPhoneType();
        else
            i = callmanager.getActiveFgCall().getPhone().getPhoneType();
        InCallControlState incallcontrolstate = mInCallScreen.getUpdatedInCallControlState();
        log("updateInCallControls()...");
        incallcontrolstate.dumpState();
        if (mHasPermanentMenuKey && mAddButton != null && mMergeButton != null)
        {
            if (incallcontrolstate.canAddCall)
            {
                mAddButton.setVisibility(0);
                mAddButton.setEnabled(flag);
                mMergeButton.setVisibility(8);
            } else
            if (incallcontrolstate.canMerge)
            {
                if (i == 2)
                {
                    mMergeButton.setVisibility(8);
                } else
                {
                    if (i != flag && i != 3)
                        throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
                    mMergeButton.setVisibility(0);
                    mMergeButton.setEnabled(flag);
                    mAddButton.setVisibility(8);
                }
            } else
            {
                mAddButton.setVisibility(0);
                mAddButton.setEnabled(false);
                mMergeButton.setVisibility(8);
            }
            if (incallcontrolstate.canAddCall && incallcontrolstate.canMerge)
                if (i != flag && i != 3)
                {
                    if (i == 2)
                        log("updateInCallControls: CDMA: Add and Merge both enabled");
                    else
                        throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
                } else
                {
                    Log.w("InCallTouchUi", "updateInCallControls: Add *and* Merge enabled, but can't show both!");
                }
        }
        if (mAddButton != null)
            mAddButton.setEnabled(incallcontrolstate.canAddCall);
        if (PhoneUtils.isPhoneInEcm(callmanager.getActiveFgCall().getPhone()) && mMenuButton != null)
            mMenuButton.setVisibility(8);
        mEndButton.setEnabled(incallcontrolstate.canEndCall);
        mDialpadButton.setEnabled(incallcontrolstate.dialpadEnabled);
        mDialpadButton.setChecked(incallcontrolstate.dialpadVisible);
        mMuteButton.setEnabled(incallcontrolstate.canMute);
        mMuteButton.setChecked(incallcontrolstate.muteIndicatorOn);
        updateAudioButton(incallcontrolstate);
        if (incallcontrolstate.canHold)
        {
            mHoldButton.setVisibility(0);
            mHoldButton.setEnabled(flag);
            mHoldButton.setChecked(incallcontrolstate.onHold);
            mSwapButton.setVisibility(8);
            mHoldSwapSpacer.setVisibility(0);
        } else
        if (incallcontrolstate.canSwap)
        {
            mSwapButton.setVisibility(0);
            mSwapButton.setEnabled(flag);
            mHoldButton.setVisibility(8);
            mHoldSwapSpacer.setVisibility(0);
        } else
        if (incallcontrolstate.supportsHold)
        {
            mHoldButton.setVisibility(0);
            mHoldButton.setEnabled(false);
            mHoldButton.setChecked(false);
            mSwapButton.setVisibility(8);
            mHoldSwapSpacer.setVisibility(0);
        } else
        {
            mHoldButton.setVisibility(8);
            mSwapButton.setVisibility(8);
            mHoldSwapSpacer.setVisibility(8);
        }
        mInCallScreen.updateButtonStateOutsideInCallTouchUi();
        if (incallcontrolstate.canSwap && incallcontrolstate.canHold)
            Log.w("InCallTouchUi", "updateInCallControls: Hold *and* Swap enabled, but can't show both!");
        if (i == 2 && incallcontrolstate.canSwap && incallcontrolstate.canMerge)
            Log.w("InCallTouchUi", "updateInCallControls: Merge *and* Swapenabled, but can't show both!");
        boolean flag1;
        if (i == 2 && incallcontrolstate.canMerge)
            flag1 = flag;
        else
            flag1 = false;
        if (!flag1 && (!incallcontrolstate.manageConferenceVisible || !mNotShowDualTalkConference))
            flag = false;
        if (flag && !incallcontrolstate.dialpadVisible)
        {
            setExtraButtonVisibility(0);
            if (mCdmaMergeButton == null)
                setupExtraButtons();
            ViewGroup viewgroup = mCdmaMergeButton;
            byte byte0;
            if (flag1)
                byte0 = 0;
            else
                byte0 = 8;
            viewgroup.setVisibility(byte0);
            if (incallcontrolstate.manageConferenceVisible)
            {
                mManageConferenceButton.setVisibility(0);
                mManageConferenceButtonImage.setEnabled(incallcontrolstate.manageConferenceEnabled);
            } else
            {
                mManageConferenceButton.setVisibility(8);
                if (!mNotShowDualTalkConference)
                    mCdmaMergeButton.setVisibility(8);
            }
        } else
        {
            setExtraButtonVisibility(8);
        }
        log("At the end of updateInCallControls().");
        dumpBottomButtonState();
    }

    void updateInCallControlsDuringDMLocked()
    {
        byte byte0 = 8;
        InCallControlState incallcontrolstate = mInCallScreen.getUpdatedInCallControlState();
        if (mHasPermanentMenuKey)
        {
            if (mAddButton != null)
            {
                mAddButton.setVisibility(0);
                mAddButton.setEnabled(false);
            }
            if (mMergeButton != null)
                mMergeButton.setVisibility(byte0);
        }
        mEndButton.setEnabled(true);
        mDialpadButton.setEnabled(incallcontrolstate.dialpadEnabled);
        CompoundButton compoundbutton = mHoldButton;
        byte byte1;
        if (incallcontrolstate.canShowSwap)
            byte1 = byte0;
        else
            byte1 = 0;
        compoundbutton.setVisibility(byte1);
        mHoldButton.setEnabled(false);
        Button button = mSwapButton;
        if (incallcontrolstate.canShowSwap)
            byte0 = 0;
        button.setVisibility(byte0);
        mSwapButton.setEnabled(false);
        updateAudioButton(incallcontrolstate);
    }

    void updateState(CallManager callmanager)
    {
        if (mInCallScreen == null)
        {
            log("- updateState: mInCallScreen has been destroyed; bailing out...");
            return;
        }
        com.android.internal.telephony.PhoneConstants.State state = callmanager.getState();
        log((new StringBuilder()).append("updateState: current state = ").append(state).toString());
        boolean flag = false;
        Call call = callmanager.getFirstActiveRingingCall();
        com.android.internal.telephony.Call.State state1 = callmanager.getActiveFgCallState();
        boolean flag1;
        if (call.getState() == com.android.internal.telephony.Call.State.IDLE || state1.isDialing() && (!DualTalkUtils.isSupportDualTalk() || !mInCallScreen.mDualTalk.isRingingWhenOutgoing()))
        {
            if (okToShowInCallControls())
            {
                if (DualTalkUtils.isSupportDualTalk())
                {
                    Call call1 = callmanager.getActiveFgCall();
                    if (callmanager.hasActiveFgCall() && VTCallUtils.isVideoCall(call1))
                    {
                        log("- updateState: dualtalk case NOT OK to show touch UI; disabling...");
                        flag = false;
                        flag1 = false;
                    } else
                    {
                        flag = true;
                        flag1 = false;
                    }
                } else
                {
                    flag = true;
                    flag1 = false;
                }
            } else
            {
                log("- updateState: NOT OK to show touch UI; disabling...");
                flag = false;
                flag1 = false;
            }
        } else
        {
            if (call.getState().isAlive() && !mInCallScreen.getOnAnswerAndEndFlag())
            {
                log("- updateState: RINGING!  Showing incoming call controls...");
                flag1 = true;
            } else
            {
                int i = callmanager.getFgCallConnections().size() + callmanager.getBgCallConnections().size();
                flag = false;
                flag1 = false;
                if (i > 0)
                {
                    boolean flag3 = okToShowInCallControls();
                    flag = false;
                    flag1 = false;
                    if (flag3)
                    {
                        flag = true;
                        flag1 = false;
                    }
                }
            }
            if (SystemClock.uptimeMillis() < 500L + mLastIncomingCallActionTime)
            {
                log("updateState: Too soon after last action; not drawing!");
                boolean flag2 = DualTalkUtils.isSupportDualTalk();
                flag1 = false;
                if (flag2)
                    mInCallScreen.requestUpdateScreenDelay(500L);
            }
            if (mInCallScreen.isQuickResponseDialogShowing())
            {
                log("updateState: quickResponse visible. Cancel showing incoming call controls.");
                flag1 = false;
            }
        }
        if (flag1 && flag)
            throw new IllegalStateException("'Incoming' and 'in-call' touch controls visible at the same time!");
        if (mShowInCallControlsDuringHidingAnimation)
        {
            log("- updateState: FORCE showing in-call controls during incoming call widget being hidden with animation");
            flag = true;
        }
        if (flag)
        {
            log("- updateState: showing in-call controls...");
            updateInCallControls(callmanager);
            mInCallControls.setVisibility(0);
        } else
        {
            log("- updateState: HIDING in-call controls...");
            mInCallControls.setVisibility(8);
        }
        if (flag1)
        {
            log("- updateState: showing incoming call widget...");
            showIncomingCallWidget(call);
            if (!mHasPermanentMenuKey && InCallMenuState.canIncomingMenuShow(callmanager))
                mIncomingMenuButton.setVisibility(0);
            else
                mIncomingMenuButton.setVisibility(8);
            mApp.notificationMgr.statusBarHelper.enableSystemBarNavigation(false);
            if (DualTalkUtils.isSupportDualTalk() && mInCallScreen.mDualTalk.isRingingWhenOutgoing())
                Toast.makeText(getContext(), 0x7f0d0166, 1).show();
            if (DualTalkUtils.isSupportDualTalk() && mInCallScreen.mDualTalk.isMultiplePhoneActive())
            {
                if (mRejectCallNoti != null)
                    mRejectCallNoti.setVisibility(8);
            } else
            if (mRejectCallNoti != null)
                mRejectCallNoti.setVisibility(8);
        } else
        {
            log("- updateState: HIDING incoming call widget...");
            hideIncomingCallWidget();
            mIncomingMenuButton.setVisibility(8);
            if (mRejectCallNoti != null)
                mRejectCallNoti.setVisibility(8);
            mApp.notificationMgr.statusBarHelper.enableSystemBarNavigation(true);
            cancelIncomingPingTime();
        }
        if (state != com.android.internal.telephony.PhoneConstants.State.OFFHOOK || state1 != com.android.internal.telephony.Call.State.ALERTING && state1 != com.android.internal.telephony.Call.State.ACTIVE)
            dismissAudioModePopup();
        ExtensionManager.getInstance().getInCallTouchUiExtension().updateState(callmanager);
    }




/*
    static boolean access$202(InCallTouchUi incalltouchui, boolean flag)
    {
        incalltouchui.mIncomingCallWidgetIsFadingOut = flag;
        return flag;
    }

*/



/*
    static boolean access$302(InCallTouchUi incalltouchui, boolean flag)
    {
        incalltouchui.mShowInCallControlsDuringHidingAnimation = flag;
        return flag;
    }

*/






/*
    static boolean access$802(InCallTouchUi incalltouchui, boolean flag)
    {
        incalltouchui.mIncomingCallWidgetShouldBeReset = flag;
        return flag;
    }

*/
}
