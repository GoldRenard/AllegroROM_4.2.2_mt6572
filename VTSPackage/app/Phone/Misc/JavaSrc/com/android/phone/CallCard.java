// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.ContentUris;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.*;
import android.text.TextUtils;
import android.text.format.DateUtils;
import android.util.*;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.*;
import android.widget.*;
import com.android.internal.telephony.*;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.mediatek.common.MediatekClassFactory;
import com.mediatek.common.telephony.IServiceStateExt;
import com.mediatek.phone.*;
import com.mediatek.phone.ext.CallCardExtension;
import com.mediatek.phone.ext.ExtensionManager;
import com.mediatek.phone.gemini.GeminiUtils;
import com.mediatek.phone.vt.VTCallUtils;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, PhoneUtils, ContactsAsyncHelper, AnimationUtils, 
//            SmallerHitTargetTouchListener, InCallScreen, CdmaPhoneCallState, CallNotifier, 
//            InCallUiState, CallTime

public class CallCard extends LinearLayout
    implements CallTime.OnTickListener, com.android.internal.telephony.CallerInfoAsyncQuery.OnQueryCompleteListener, ContactsAsyncHelper.OnImageLoadCompleteListener
{
    private static class AsyncLoadCookie
    {

        public final Call call;
        public final CallerInfo callerInfo;
        public final ImageView imageView;

        public AsyncLoadCookie(ImageView imageview, CallerInfo callerinfo, Call call1)
        {
            imageView = imageview;
            callerInfo = callerinfo;
            call = call1;
        }
    }

    private class CallInfoCookie
    {

        public int bannerNumber;
        public Call call;
        final CallCard this$0;

        CallInfoCookie(Call call1, int i)
        {
            this$0 = CallCard.this;
            super();
            bannerNumber = i;
            call = call1;
        }
    }


    private static final boolean DBG = true;
    private static final String LOG_TAG = "CallCard";
    private static final int MESSAGE_DELAY = 500;
    private static final int MESSAGE_SHOW_UNKNOWN_PHOTO = 101;
    private static final int PRIMARY_CALL_BANNER = 0;
    private static final int SECONDARY_CALL_BANNER = 1;
    private static final int SECOND_HOLD_CALL_BANNER = 2;
    private static final int TOKEN_DO_NOTHING = 1;
    private static final int TOKEN_UPDATE_PHOTO_FOR_CALL_STATE;
    private static boolean mLCforUserData = false;
    private static boolean mLCforUserDataHoldCall = false;
    private static boolean mLocaleChanged = false;
    private static boolean sLCforUserDataSecondHoldCall = false;
    android.view.View.OnClickListener callCardListener;
    TextView m2ndHoldName;
    TextView m2ndHoldState;
    TextView m2ndIncomingName;
    TextView m2ndIncomingState;
    android.view.animation.Animation.AnimationListener mAnimationListener;
    private PhoneGlobals mApplication;
    private int mCallBannerSidePadding;
    private int mCallBannerTopBottomPadding;
    private ViewGroup mCallInfoContainer;
    private TextView mCallStateLabel;
    private TextView mCallTypeLabel;
    private float mDensity;
    DualTalkUtils mDualTalk;
    private ViewStub mDualTalkSecondaryCallInfo;
    private View mDualTalkSecondaryCallPhotoDimEffect;
    private final Handler mHandler = new Handler() {

        final CallCard this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 101: // 'e'
                CallCard.showImage(mPhoto, 0x7f02009c);
                return;
            }
            Log.wtf("CallCard", (new StringBuilder()).append("mHandler: unexpected message: ").append(message).toString());
        }

            
            {
                this$0 = CallCard.this;
                super();
            }
    }
;
    private InCallScreen mInCallScreen;
    private ViewGroup mIncomingCall2Info;
    private View mIncomingCall2PhotoDimEffect;
    private int mIncomingCallInfoHeight;
    private int mIncomingCallInfoTopMargin;
    private int mIncomingCallInfoWidth;
    private int mIncomingCallWidgetHintColorResId;
    private int mIncomingCallWidgetHintTextResId;
    private TextView mLabel;
    private Uri mLoadingPersonUri;
    private TextView mName;
    private boolean mNeedShowIncomingCall2Animator;
    private TextView mOperatorName;
    private TextView mPhoneNumber;
    private TextView mPhoneNumberGeoDescription;
    private ImageView mPhoto;
    private View mPhotoDimEffect;
    private ImageView mPhotoHoldPre;
    private ImageView mPhotoIncomingPre;
    private ContactsAsyncHelper.ImageTracker mPhotoTracker;
    private ViewGroup mPrimaryCallBanner;
    private ViewGroup mPrimaryCallInfo;
    private TextView mProviderAddress;
    private ViewGroup mProviderInfo;
    private TextView mProviderLabel;
    private ViewGroup mSecondHoldCallBanner;
    private ViewGroup mSecondIncomingCallBanner;
    private ViewGroup mSecondaryCallBanner;
    private ViewStub mSecondaryCallInfo;
    private TextView mSecondaryCallName;
    private ImageView mSecondaryCallPhoto;
    private View mSecondaryCallPhotoDimEffect;
    private TextView mSecondaryCallStatus;
    private ViewGroup mSecondaryInfoContainer;
    private IServiceStateExt mServiceStateExt;
    private int mShowAnimator2End;
    private boolean mShowSwtchCall2Animator;
    private int mSimBorderMap[] = {
        0x7f0200a2, 0x7f0200a5, 0x7f0200a3, 0x7f0200a6
    };
    private int mSimColorMap[] = {
        0x7f02008e, 0x7f02008f, 0x7f020090, 0x7f020091
    };
    private TextView mSimIndicator;
    private int mSimIndicatorPaddingLeft;
    private int mSimIndicatorPaddingRight;
    private android.provider.Telephony.SIMInfo mSimInfo;
    private int mTextColorCallTypeSip;

    public CallCard(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mShowAnimator2End = 1;
        callCardListener = new android.view.View.OnClickListener() {

            final CallCard this$0;

            public void onClick(View view)
            {
                switch (view.getId())
                {
                case 2131230801: 
                    CallCard.log("callCardListener: Which call to disconnected?");
                    DualTalkUtils _tmp = mDualTalk;
                    if (DualTalkUtils.isSupportDualTalk() && mDualTalk.isDualTalkMultipleHoldCase())
                    {
                        mInCallScreen.handleUnholdAndEnd(mDualTalk.getActiveFgCall());
                        return;
                    }
                    DualTalkUtils _tmp1 = mDualTalk;
                    if (DualTalkUtils.isSupportDualTalk() && mDualTalk.isMultiplePhoneActive() && !mDualTalk.hasMultipleRingingCall())
                    {
                        PhoneUtils.switchHoldingAndActive(mDualTalk.getSecondActiveBgCall());
                        return;
                    } else
                    {
                        PhoneUtils.switchHoldingAndActive(mApplication.mCM.getFirstActiveBgCall());
                        return;
                    }

                case 2131230863: 
                    mShowSwtchCall2Animator = true;
                    displaySwitchIncomingAnimator();
                    return;
                }
                CallCard.log("do nothing");
            }

            
            {
                this$0 = CallCard.this;
                super();
            }
        }
;
        mAnimationListener = new android.view.animation.Animation.AnimationListener() {

            final CallCard this$0;

            public void onAnimationEnd(Animation animation)
            {
                CallCard.log("onAnimationEnd");
                int i = ((AnimationSet)animation).getAnimations().size();
                int i = 
// JavaClassFileOutputException: get_constant: invalid tag

            public void onAnimationRepeat(Animation animation)
            {
                CallCard.log("onAnimationRepeat");
            }

            public void onAnimationStart(Animation animation)
            {
                CallCard.log("onAnimationStart");
                RelativeLayout relativelayout = (RelativeLayout)findViewById(0x7f0800f2);
                android.view.ViewGroup.MarginLayoutParams marginlayoutparams = new android.view.ViewGroup.MarginLayoutParams(-1, -1);
                marginlayoutparams.topMargin = 0;
                relativelayout.setLayoutParams(new android.widget.RelativeLayout.LayoutParams(marginlayoutparams));
                if (mNeedShowIncomingCall2Animator)
                    mNeedShowIncomingCall2Animator = false;
            }

            
            {
                this$0 = CallCard.this;
                super();
            }
        }
;
        Object aobj[] = new Object[1];
        aobj[0] = getContext();
        mServiceStateExt = (IServiceStateExt)MediatekClassFactory.createInstance(com/mediatek/common/telephony/IServiceStateExt, aobj);
        log("CallCard constructor...");
        log((new StringBuilder()).append("- this = ").append(this).toString());
        log((new StringBuilder()).append("- context ").append(context).append(", attrs ").append(attributeset).toString());
        mApplication = PhoneGlobals.getInstance();
        mPhotoTracker = new ContactsAsyncHelper.ImageTracker();
        if (DualTalkUtils.isSupportDualTalk())
            mDualTalk = DualTalkUtils.getInstance();
        mDensity = getResources().getDisplayMetrics().density;
        mCallBannerSidePadding = getResources().getDimensionPixelSize(0x7f0c0040);
        mCallBannerTopBottomPadding = getResources().getDimensionPixelSize(0x7f0c0007);
        mSimIndicatorPaddingLeft = getResources().getDimensionPixelSize(0x7f0c0022);
        mSimIndicatorPaddingRight = getResources().getDimensionPixelSize(0x7f0c0023);
        log((new StringBuilder()).append("- Density: ").append(mDensity).toString());
    }

    private void dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent, View view)
    {
        List list = accessibilityevent.getText();
        int i = list.size();
        view.dispatchPopulateAccessibilityEvent(accessibilityevent);
        if (i == list.size())
            list.add(null);
    }

    private void displayMainCallStatus(CallManager callmanager, Call call)
    {
        log((new StringBuilder()).append("displayMainCallStatus(call ").append(call).append(")...").toString());
        if (call == null)
        {
            mPrimaryCallInfo.setVisibility(8);
        } else
        {
            log((new StringBuilder()).append("displayMainCallStatus(call ").append(call.getConnections()).append(")...").toString());
            mPrimaryCallInfo.setVisibility(0);
            updateCallStateWidgets(call);
            android.provider.Telephony.SIMInfo siminfo = PhoneUtils.getSimInfoByCall(call);
            if (siminfo != null && !TextUtils.isEmpty(siminfo.mDisplayName) && call.getPhone().getPhoneType() != 3)
            {
                mSimIndicator.setText(siminfo.mDisplayName);
                mSimIndicator.setVisibility(0);
            } else
            if (call.getPhone().getPhoneType() == 3)
            {
                mSimIndicator.setText(0x7f0d02e1);
                mSimIndicator.setVisibility(0);
            } else
            {
                mSimIndicator.setVisibility(8);
            }
            updateCallBannerBackground(call, mPrimaryCallBanner);
            if (call.getPhone().getPhoneType() == 3)
            {
                mOperatorName.setVisibility(0);
                mOperatorName.setText(0x7f0d02e1);
            } else
            if (!PhoneUtils.isEccCall(call))
            {
                mOperatorName.setText(GeminiUtils.getNetworkOperatorName(call));
                mOperatorName.setVisibility(0);
            } else
            {
                mOperatorName.setVisibility(8);
            }
            if (PhoneUtils.isConferenceCall(call))
            {
                updateDisplayForConference(call);
            } else
            {
                int i = call.getPhone().getPhoneType();
                Connection connection;
                if (i == 2)
                {
                    connection = call.getLatestConnection();
                } else
                {
                    if (i != 1 && i != 3)
                        throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
                    connection = call.getEarliestConnection();
                }
                if (connection == null)
                {
                    log("displayMainCallStatus: connection is null, using default values.");
                    updateDisplayForPerson(PhoneUtils.getCallerInfo(getContext(), null), PhoneConstants.PRESENTATION_ALLOWED, false, call, connection);
                } else
                {
                    log((new StringBuilder()).append("  - CONN: ").append(connection).append(", state = ").append(connection.getState()).toString());
                    int j = connection.getNumberPresentation();
                    Object obj = connection.getUserData();
                    boolean flag;
                    if (obj instanceof PhoneUtils.CallerInfoToken)
                        flag = mPhotoTracker.isDifferentImageRequest(((PhoneUtils.CallerInfoToken)obj).currentInfo);
                    else
                        flag = mPhotoTracker.isDifferentImageRequest(connection);
                    if (i == 2)
                    {
                        Object obj1 = connection.getUserData();
                        String s = connection.getAddress();
                        String s1 = connection.getCnapName();
                        CallerInfo callerinfo3;
                        if (obj1 instanceof PhoneUtils.CallerInfoToken)
                        {
                            callerinfo3 = ((PhoneUtils.CallerInfoToken)obj).currentInfo;
                        } else
                        {
                            boolean flag2 = obj instanceof CallerInfo;
                            callerinfo3 = null;
                            if (flag2)
                                callerinfo3 = (CallerInfo)obj;
                        }
                        if (callerinfo3 != null)
                        {
                            if (s != null && !s.equals(callerinfo3.phoneNumber))
                            {
                                log((new StringBuilder()).append("- displayMainCallStatus: updatedNumber = ").append(s).toString());
                                flag = true;
                            }
                            if (s1 != null && !s1.equals(callerinfo3.cnapName))
                            {
                                log((new StringBuilder()).append("- displayMainCallStatus: updatedCnapName = ").append(s1).toString());
                                flag = true;
                            }
                        }
                    }
                    if (flag)
                    {
                        log("- displayMainCallStatus: starting CallerInfo query...");
                        if (mLCforUserData)
                        {
                            log("- displayMainCallStatus: the language changed to clear userdata");
                            connection.clearUserData();
                            mLCforUserData = false;
                        }
                        CallInfoCookie callinfocookie = new CallInfoCookie(call, 0);
                        PhoneUtils.CallerInfoToken callerinfotoken = PhoneUtils.startGetCallerInfo(getContext(), connection, this, callinfocookie);
                        CallerInfo callerinfo2 = callerinfotoken.currentInfo;
                        boolean flag1;
                        if (!callerinfotoken.isFinal)
                            flag1 = true;
                        else
                            flag1 = false;
                        updateDisplayForPerson(callerinfo2, j, flag1, call, connection);
                    } else
                    {
                        log("- displayMainCallStatus: using data we already have...");
                        if (obj instanceof CallerInfo)
                        {
                            CallerInfo callerinfo1 = (CallerInfo)obj;
                            callerinfo1.cnapName = connection.getCnapName();
                            callerinfo1.numberPresentation = connection.getNumberPresentation();
                            callerinfo1.namePresentation = connection.getCnapNamePresentation();
                            log((new StringBuilder()).append("- displayMainCallStatus: CNAP data from Connection: CNAP name=").append(callerinfo1.cnapName).append(", Number/Name Presentation=").append(callerinfo1.numberPresentation).toString());
                            log((new StringBuilder()).append("   ==> Got CallerInfo; updating display: ci = ").append(callerinfo1).toString());
                            updateDisplayForPerson(callerinfo1, j, false, call, connection);
                        } else
                        if (obj instanceof PhoneUtils.CallerInfoToken)
                        {
                            CallerInfo callerinfo = ((PhoneUtils.CallerInfoToken)obj).currentInfo;
                            log((new StringBuilder()).append("- displayMainCallStatus: CNAP data from Connection: CNAP name=").append(callerinfo.cnapName).append(", Number/Name Presentation=").append(callerinfo.numberPresentation).toString());
                            log((new StringBuilder()).append("   ==> Got CallerInfoToken; updating display: ci = ").append(callerinfo).toString());
                            updateDisplayForPerson(callerinfo, j, true, call, connection);
                        } else
                        {
                            Log.w("CallCard", (new StringBuilder()).append("displayMainCallStatus: runQuery was false, but we didn't have a cached CallerInfo object!  o = ").append(obj).toString());
                        }
                    }
                }
            }
            updatePhotoForCallState(call, mPhoto);
            if (mIncomingCallWidgetHintTextResId != 0)
            {
                mPhoneNumber.setText(mIncomingCallWidgetHintTextResId);
                mPhoneNumber.setTextColor(getResources().getColor(mIncomingCallWidgetHintColorResId));
                mPhoneNumber.setVisibility(0);
                mLabel.setVisibility(8);
                return;
            }
        }
    }

    private void displaySecondaryCallStatus(CallManager callmanager, Call call)
    {
        log((new StringBuilder()).append("displaySecondaryCallStatus(call =").append(call).append(")...").toString());
        if (call != null && !PhoneGlobals.getInstance().isOtaCallInActiveState())
        {
            com.android.internal.telephony.Call.State state = call.getState();
            PhoneUtils.getSimInfoByCall(call);
            static class _cls4
            {

                static final int $SwitchMap$com$android$internal$telephony$Call$State[];
                static final int $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[];

                static 
                {
                    $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause = new int[com.android.internal.telephony.Connection.DisconnectCause.values().length];
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.BUSY.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.CONGESTION.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror1) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.TIMED_OUT.ordinal()] = 3;
                    }
                    catch (NoSuchFieldError nosuchfielderror2) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.SERVER_UNREACHABLE.ordinal()] = 4;
                    }
                    catch (NoSuchFieldError nosuchfielderror3) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.NUMBER_UNREACHABLE.ordinal()] = 5;
                    }
                    catch (NoSuchFieldError nosuchfielderror4) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.INVALID_CREDENTIALS.ordinal()] = 6;
                    }
                    catch (NoSuchFieldError nosuchfielderror5) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.SERVER_ERROR.ordinal()] = 7;
                    }
                    catch (NoSuchFieldError nosuchfielderror6) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.OUT_OF_NETWORK.ordinal()] = 8;
                    }
                    catch (NoSuchFieldError nosuchfielderror7) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.LOST_SIGNAL.ordinal()] = 9;
                    }
                    catch (NoSuchFieldError nosuchfielderror8) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.CDMA_DROP.ordinal()] = 10;
                    }
                    catch (NoSuchFieldError nosuchfielderror9) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.LIMIT_EXCEEDED.ordinal()] = 11;
                    }
                    catch (NoSuchFieldError nosuchfielderror10) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.POWER_OFF.ordinal()] = 12;
                    }
                    catch (NoSuchFieldError nosuchfielderror11) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.ICC_ERROR.ordinal()] = 13;
                    }
                    catch (NoSuchFieldError nosuchfielderror12) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.OUT_OF_SERVICE.ordinal()] = 14;
                    }
                    catch (NoSuchFieldError nosuchfielderror13) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.INVALID_NUMBER.ordinal()] = 15;
                    }
                    catch (NoSuchFieldError nosuchfielderror14) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.UNOBTAINABLE_NUMBER.ordinal()] = 16;
                    }
                    catch (NoSuchFieldError nosuchfielderror15) { }
                    $SwitchMap$com$android$internal$telephony$Call$State = new int[com.android.internal.telephony.Call.State.values().length];
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.IDLE.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror16) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.ACTIVE.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror17) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.HOLDING.ordinal()] = 3;
                    }
                    catch (NoSuchFieldError nosuchfielderror18) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.DIALING.ordinal()] = 4;
                    }
                    catch (NoSuchFieldError nosuchfielderror19) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.ALERTING.ordinal()] = 5;
                    }
                    catch (NoSuchFieldError nosuchfielderror20) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.INCOMING.ordinal()] = 6;
                    }
                    catch (NoSuchFieldError nosuchfielderror21) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.WAITING.ordinal()] = 7;
                    }
                    catch (NoSuchFieldError nosuchfielderror22) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.DISCONNECTING.ordinal()] = 8;
                    }
                    catch (NoSuchFieldError nosuchfielderror23) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.DISCONNECTED.ordinal()] = 9;
                    }
                    catch (NoSuchFieldError nosuchfielderror24)
                    {
                        return;
                    }
                }
            }

            switch (_cls4..SwitchMap.com.android.internal.telephony.Call.State[state.ordinal()])
            {
            case 2: // '\002'
                showSecondaryCallInfo();
                if (DualTalkUtils.isSupportDualTalk() && call.getPhone().getPhoneType() == 2 && mSecondaryCallBanner != null)
                    updateCallBannerBackground(call, mSecondaryCallBanner);
                if (mApplication.phone.getPhoneType() == 2)
                {
                    showSecondaryCallInfo();
                    if (call.getConnections().size() > 2)
                    {
                        mSecondaryCallName.setText(getContext().getString(0x7f0d02c1));
                        showImage(mSecondaryCallPhoto, 0x7f02009c);
                    } else
                    {
                        Connection connection1 = call.getEarliestConnection();
                        PhoneUtils.CallerInfoToken callerinfotoken1 = PhoneUtils.startGetCallerInfo(getContext(), connection1, this, mSecondaryCallName);
                        CallerInfo callerinfo = callerinfotoken1.currentInfo;
                        String s = PhoneUtils.getCompactNameFromCallerInfo(callerinfo, getContext());
                        boolean flag = false;
                        if (callerinfo != null)
                        {
                            int l = callerinfo.numberPresentation;
                            int i1 = PhoneConstants.PRESENTATION_ALLOWED;
                            flag = false;
                            if (l != i1)
                            {
                                s = PhoneUtils.getPresentationString(getContext(), callerinfo.numberPresentation);
                                flag = true;
                            }
                        }
                        mSecondaryCallName.setText(s);
                        if (callerinfotoken1.isFinal)
                        {
                            if (!showCachedImage(mSecondaryCallPhoto, callerinfotoken1.currentInfo))
                            {
                                Uri uri = ContentUris.withAppendedId(android.provider.ContactsContract.Contacts.CONTENT_URI, callerinfotoken1.currentInfo.person_id);
                                mLoadingPersonUri = uri;
                                mSecondaryCallPhoto.setTag(null);
                                mSecondaryCallPhoto.setVisibility(4);
                                ContactsAsyncHelper.startObtainPhotoAsync(0, getContext(), uri, this, new AsyncLoadCookie(mSecondaryCallPhoto, callerinfo, call));
                                mHandler.removeMessages(101);
                                mHandler.sendEmptyMessageDelayed(101, 500L);
                            }
                            int k = connection1.getNumberPresentation();
                            updateDisplayForPerson(callerinfotoken1.currentInfo, k, false, call, connection1, mSecondaryCallName, true, null, null, mSecondaryCallPhoto);
                        }
                        if (!flag && callerinfotoken1.isFinal)
                            showCachedImage(mSecondaryCallPhoto, callerinfo);
                        else
                            showImage(mSecondaryCallPhoto, 0x7f02009c);
                    }
                } else
                {
                    Log.w("CallCard", "displaySecondaryCallStatus: ACTIVE state on non-CDMA device");
                    mSecondaryCallInfo.setVisibility(8);
                }
                AnimationUtils.Fade.hide(mSecondaryCallPhotoDimEffect, 8);
                return;

            case 3: // '\003'
                showSecondaryCallInfo();
                if (mSecondaryCallBanner != null)
                    updateCallBannerBackground(call, mSecondaryCallBanner);
                if (PhoneUtils.isConferenceCall(call))
                {
                    log("==> conference call.");
                    mSecondaryCallName.setText(getContext().getString(0x7f0d0190));
                    showImage(mSecondaryCallPhoto, 0x7f020098);
                } else
                {
                    log("==> NOT a conf call; call startGetCallerInfo...");
                    PhoneUtils.CallerInfoToken callerinfotoken;
                    if (mLCforUserDataHoldCall)
                    {
                        log("- displaySecondaryCallStatus: the language changed to clear userdata");
                        CallInfoCookie callinfocookie = new CallInfoCookie(call, 1);
                        callerinfotoken = PhoneUtils.startGetCallerInfo(getContext(), call, this, callinfocookie, true);
                        mLCforUserDataHoldCall = false;
                    } else
                    {
                        callerinfotoken = PhoneUtils.startGetCallerInfo(getContext(), call, this, mSecondaryCallName);
                    }
                    mSecondaryCallName.setText(PhoneUtils.getCompactNameFromCallerInfo(callerinfotoken.currentInfo, getContext()));
                    if (callerinfotoken.isFinal)
                    {
                        int i = call.getPhone().getPhoneType();
                        Connection connection;
                        if (i == 2)
                        {
                            connection = call.getLatestConnection();
                        } else
                        {
                            if (i != 1 && i != 3)
                                throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
                            connection = call.getEarliestConnection();
                        }
                        int j = connection.getNumberPresentation();
                        updateDisplayForPerson(callerinfotoken.currentInfo, j, false, call, connection, mSecondaryCallName, true, null, null, mSecondaryCallPhoto);
                    } else
                    {
                        showImage(mSecondaryCallPhoto, 0x7f02009c);
                    }
                }
                AnimationUtils.Fade.show(mSecondaryCallPhotoDimEffect);
                return;
            }
            mSecondaryCallInfo.setVisibility(8);
            return;
        } else
        {
            mSecondaryCallInfo.setVisibility(8);
            return;
        }
    }

    private void displaySecondaryIncomingAnimator()
    {
        AnimationSet animationset = new AnimationSet(true);
        int i = mPrimaryCallInfo.getRight() + mIncomingCallInfoWidth;
        int j = mIncomingCallInfoTopMargin + mIncomingCallInfoHeight;
        TranslateAnimation translateanimation = new TranslateAnimation(0.0F, i, 0.0F, j);
        translateanimation.setDuration(300L);
        animationset.addAnimation(translateanimation);
        ScaleAnimation scaleanimation = new ScaleAnimation(0.0F, 0.4F, 0.0F, 0.4F, 1, 0.0F, 1, 0.0F);
        scaleanimation.setDuration(0L);
        animationset.addAnimation(scaleanimation);
        animationset.setAnimationListener(mAnimationListener);
        mIncomingCall2Info.startAnimation(animationset);
    }

    private void displaySwitchIncomingAnimator()
    {
        int i = mPrimaryCallInfo.getRight() - mIncomingCallInfoWidth;
        AnimationSet animationset = new AnimationSet(true);
        TranslateAnimation translateanimation = new TranslateAnimation(i, 0.0F, mIncomingCallInfoTopMargin, 0.0F);
        translateanimation.setDuration(500L);
        animationset.addAnimation(translateanimation);
        ScaleAnimation scaleanimation = new ScaleAnimation(0.4F, 0.0F, 0.4F, 0.0F, 1, 0.0F, 1, 0.0F);
        scaleanimation.setDuration(500L);
        animationset.addAnimation(scaleanimation);
        animationset.setAnimationListener(mAnimationListener);
        mIncomingCall2Info.startAnimation(animationset);
    }

    private String getCallFailedString(Call call)
    {
        Connection connection = call.getEarliestConnection();
        int i;
        if (connection == null)
        {
            log("getCallFailedString: connection is null, using default values.");
            i = 0x7f0d02be;
        } else
        {
            com.android.internal.telephony.Connection.DisconnectCause disconnectcause = connection.getDisconnectCause();
            switch (_cls4..SwitchMap.com.android.internal.telephony.Connection.DisconnectCause[disconnectcause.ordinal()])
            {
            case 15: // '\017'
            case 16: // '\020'
                i = 0x7f0d018f;
                break;

            case 14: // '\016'
                i = 0x7f0d0187;
                break;

            case 13: // '\r'
                if (mServiceStateExt.isImeiLocked())
                    i = 0x7f0d018e;
                else
                    i = 0x7f0d0186;
                break;

            case 12: // '\f'
                i = 0x7f0d0185;
                break;

            case 11: // '\013'
                i = 0x7f0d0184;
                break;

            case 9: // '\t'
            case 10: // '\n'
                i = 0x7f0d0183;
                break;

            case 8: // '\b'
                i = 0x7f0d0181;
                break;

            case 7: // '\007'
                i = 0x7f0d0182;
                break;

            case 6: // '\006'
                i = 0x7f0d0180;
                break;

            case 5: // '\005'
                i = 0x7f0d017f;
                break;

            case 4: // '\004'
                i = 0x7f0d017e;
                break;

            case 3: // '\003'
                i = 0x7f0d017d;
                break;

            case 2: // '\002'
                i = 0x7f0d017c;
                break;

            case 1: // '\001'
                i = 0x7f0d017b;
                break;

            default:
                i = 0x7f0d02be;
                break;
            }
        }
        return getContext().getString(i);
    }

    private String getCallFailedString(com.android.internal.telephony.Connection.DisconnectCause disconnectcause)
    {
        int i;
        if (disconnectcause == null)
        {
            log("getCallFailedString: connection is null, using default values.");
            i = 0x7f0d02be;
        } else
        {
            switch (_cls4..SwitchMap.com.android.internal.telephony.Connection.DisconnectCause[disconnectcause.ordinal()])
            {
            case 15: // '\017'
            case 16: // '\020'
                i = 0x7f0d018f;
                break;

            case 14: // '\016'
                i = 0x7f0d0187;
                break;

            case 13: // '\r'
                if (mServiceStateExt.isImeiLocked())
                    i = 0x7f0d018e;
                else
                    i = 0x7f0d0186;
                break;

            case 12: // '\f'
                i = 0x7f0d0185;
                break;

            case 11: // '\013'
                i = 0x7f0d0184;
                break;

            case 9: // '\t'
            case 10: // '\n'
                i = 0x7f0d0183;
                break;

            case 8: // '\b'
                i = 0x7f0d0181;
                break;

            case 7: // '\007'
                i = 0x7f0d0182;
                break;

            case 6: // '\006'
                i = 0x7f0d0180;
                break;

            case 5: // '\005'
                i = 0x7f0d017f;
                break;

            case 4: // '\004'
                i = 0x7f0d017e;
                break;

            case 3: // '\003'
                i = 0x7f0d017d;
                break;

            case 2: // '\002'
                i = 0x7f0d017c;
                break;

            case 1: // '\001'
                i = 0x7f0d017b;
                break;

            default:
                i = 0x7f0d02be;
                break;
            }
        }
        return getContext().getString(i);
    }

    private boolean isSecondHoldCallVisible(CallManager callmanager)
    {
        boolean flag;
        if (DualTalkUtils.isSupportDualTalk() && mDualTalk != null && mDualTalk.isDualTalkMultipleHoldCase())
        {
            flag = true;
        } else
        {
            if (DualTalkUtils.isSupportDualTalk() && mDualTalk != null && mDualTalk.hasDualHoldCallsOnly())
            {
                Call call2 = mDualTalk.getFirstActiveBgCall();
                Call call3 = mDualTalk.getSecondActiveBgCall();
                return call2.getPhone() != call3.getPhone();
            }
            Call call = callmanager.getActiveFgCall();
            Call call1 = callmanager.getFirstActiveBgCall();
            flag = false;
            if (call != null)
            {
                com.android.internal.telephony.Call.State state = call.getState();
                com.android.internal.telephony.Call.State state1 = com.android.internal.telephony.Call.State.IDLE;
                flag = false;
                if (state != state1)
                {
                    flag = false;
                    if (call1 != null)
                    {
                        boolean flag1 = call1.getState().isAlive();
                        flag = false;
                        if (flag1)
                            return call.getPhone() != call1.getPhone();
                    }
                }
            }
        }
        return flag;
    }

    private boolean isSecondaryCallVisible(CallManager callmanager)
    {
        boolean flag;
        if (DualTalkUtils.isSupportDualTalk() && mDualTalk != null && mDualTalk.isDualTalkMultipleHoldCase())
        {
            flag = true;
        } else
        {
            if (DualTalkUtils.isSupportDualTalk() && mDualTalk != null && mDualTalk.hasDualHoldCallsOnly())
            {
                Call call2 = mDualTalk.getFirstActiveBgCall();
                Call call3 = mDualTalk.getSecondActiveBgCall();
                return call2.getPhone() == call3.getPhone();
            }
            Call call = callmanager.getActiveFgCall();
            Call call1 = callmanager.getFirstActiveBgCall();
            flag = false;
            if (call != null)
            {
                com.android.internal.telephony.Call.State state = call.getState();
                com.android.internal.telephony.Call.State state1 = com.android.internal.telephony.Call.State.IDLE;
                flag = false;
                if (state != state1)
                {
                    flag = false;
                    if (call1 != null)
                    {
                        boolean flag1 = call1.getState().isAlive();
                        flag = false;
                        if (flag1)
                            return call.getPhone() == call1.getPhone();
                    }
                }
            }
        }
        return flag;
    }

    private static void log(String s)
    {
        Log.d("CallCard", s);
    }

    private static final boolean showCachedImage(ImageView imageview, CallerInfo callerinfo)
    {
        if (callerinfo != null && callerinfo.isCachedPhotoCurrent)
        {
            if (callerinfo.cachedPhoto != null)
            {
                log("showCachedImage: using the cachedPhoto!");
                showImage(imageview, callerinfo.cachedPhoto);
            } else
            {
                log("showCachedImage: using picture_unknown!");
                showImage(imageview, 0x7f02009c);
            }
            return true;
        } else
        {
            log("showCachedImage: return false!");
            return false;
        }
    }

    private static final void showImage(ImageView imageview, int i)
    {
        showImage(imageview, imageview.getContext().getResources().getDrawable(i));
    }

    private static final void showImage(ImageView imageview, Bitmap bitmap)
    {
        showImage(imageview, ((Drawable) (new BitmapDrawable(imageview.getContext().getResources(), bitmap))));
    }

    private static final void showImage(ImageView imageview, Drawable drawable)
    {
        imageview.getContext().getResources();
        Drawable drawable1 = (Drawable)imageview.getTag();
        if (drawable1 == null)
        {
            log((new StringBuilder()).append("Start fade-in animation for ").append(imageview).toString());
            imageview.setImageDrawable(drawable);
            AnimationUtils.Fade.show(imageview);
            imageview.setTag(drawable);
            return;
        } else
        {
            AnimationUtils.startCrossFade(imageview, drawable1, drawable);
            imageview.setVisibility(0);
            return;
        }
    }

    private void showSecondaryCallInfo()
    {
        log("showSecondaryCallInfo()");
        mSecondaryCallInfo.setVisibility(0);
        if (mSecondaryCallName == null)
            mSecondaryCallName = (TextView)findViewById(0x7f0800f4);
        if (mSecondaryCallStatus == null)
            mSecondaryCallStatus = (TextView)findViewById(0x7f0800f9);
        if (mSecondaryCallPhoto == null)
            mSecondaryCallPhoto = (ImageView)findViewById(0x7f0800f5);
        if (mSecondaryCallPhotoDimEffect == null)
        {
            mSecondaryCallPhotoDimEffect = findViewById(0x7f0800f6);
            mSecondaryCallPhotoDimEffect.setOnClickListener(mInCallScreen);
            mSecondaryCallPhotoDimEffect.setOnTouchListener(new SmallerHitTargetTouchListener());
        }
        if (mSecondaryCallBanner == null)
            mSecondaryCallBanner = (ViewGroup)findViewById(0x7f0800f7);
        mInCallScreen.updateButtonStateOutsideInCallTouchUi();
    }

    private void updateAlreadyDisconnected(CallManager callmanager)
    {
        mPrimaryCallInfo.setVisibility(0);
        mSecondaryInfoContainer.setLayoutTransition(null);
        mProviderInfo.setVisibility(8);
        mCallStateLabel.setVisibility(0);
        mCallStateLabel.setText(mContext.getString(0x7f0d02be));
        displaySecondaryCallStatus(callmanager, null);
        displaySecondHoldCallStatus(null);
    }

    private void updateCallBannerBackground(Call call, ViewGroup viewgroup)
    {
label0:
        {
label1:
            {
                android.provider.Telephony.SIMInfo siminfo = PhoneUtils.getSimInfoByCall(call);
                if (GeminiUtils.isGeminiSupport())
                {
                    int i = call.getPhone().getPhoneType();
                    log((new StringBuilder()).append("Phone type is ").append(i).toString());
                    if (3 == i)
                    {
                        if (mSimIndicator != null && mSimIndicator.getVisibility() == 0)
                            mSimIndicator.setBackgroundResource(0x7f0200a4);
                        if (mSecondaryInfoContainer != null && mSecondaryInfoContainer.getVisibility() == 0)
                            mSecondaryInfoContainer.setBackgroundResource(0x7f020092);
                        if (mSecondaryCallBanner != null && mSecondaryCallBanner.getVisibility() == 0)
                            mSecondaryCallBanner.setBackgroundResource(0x7f020092);
                    } else
                    if (siminfo != null && mSimColorMap != null && siminfo.mColor >= 0 && siminfo.mColor < mSimColorMap.length)
                    {
                        if (mSimIndicator != null && mSimIndicator.getVisibility() == 0)
                            mSimIndicator.setBackgroundResource(mSimBorderMap[siminfo.mColor]);
                        if (mSecondaryInfoContainer != null && mSecondaryInfoContainer.getVisibility() == 0)
                            mSecondaryInfoContainer.setBackgroundResource(mSimColorMap[siminfo.mColor]);
                        if (mSecondaryCallBanner != null && mSecondaryCallBanner.getVisibility() == 0)
                            mSecondaryCallBanner.setBackgroundResource(mSimColorMap[siminfo.mColor]);
                    } else
                    {
                        log("mSimInfo is null or mSimInfo.mColor invalid, do not update background");
                        return;
                    }
                } else
                {
                    if (siminfo == null || mSimColorMap == null || siminfo.mColor < 0 || siminfo.mColor >= mSimColorMap.length)
                        break label1;
                    if (mSimIndicator != null && mSimIndicator.getVisibility() == 0)
                        mSimIndicator.setBackgroundResource(mSimBorderMap[siminfo.mColor]);
                    if (mSecondaryInfoContainer != null && mSecondaryInfoContainer.getVisibility() == 0)
                        mSecondaryInfoContainer.setBackgroundResource(mSimColorMap[siminfo.mColor]);
                    if (mSecondaryCallBanner != null && mSecondaryCallBanner.getVisibility() == 0)
                        mSecondaryCallBanner.setBackgroundResource(mSimColorMap[siminfo.mColor]);
                }
                if (mSecondaryCallBanner != null && mSecondaryCallBanner.getVisibility() == 0)
                    mSecondaryCallBanner.setPadding(mCallBannerSidePadding, 0, mCallBannerSidePadding, 0);
                if (mSimIndicator != null && mSimIndicator.getVisibility() == 0)
                    mSimIndicator.setPadding(mSimIndicatorPaddingLeft, 0, mSimIndicatorPaddingRight, 0);
                break label0;
            }
            log("mSimInfo is null or mSimInfo.mColor invalid, set them to default value");
            if (3 == call.getPhone().getPhoneType())
            {
                if (mSimIndicator != null && mSimIndicator.getVisibility() == 0)
                    mSimIndicator.setBackgroundResource(0x7f0200a4);
                if (mSecondaryInfoContainer != null && mSecondaryInfoContainer.getVisibility() == 0)
                    mSecondaryInfoContainer.setBackgroundResource(0x7f020092);
                if (mSecondaryCallBanner != null && mSecondaryCallBanner.getVisibility() == 0)
                {
                    mSecondaryCallBanner.setBackgroundResource(0x7f020092);
                    return;
                }
            }
        }
    }

    private void updateCallBannerBackground(InCallUiState.FakeCall fakecall, ViewGroup viewgroup)
    {
        log("displayFakeCallStatus...");
        if (GeminiUtils.isGeminiSupport())
        {
            int i = fakecall.phoneType;
            log((new StringBuilder()).append("Phone type is ").append(i).toString());
            if (3 == i)
            {
                if (mSimIndicator != null && mSimIndicator.getVisibility() == 0)
                    mSimIndicator.setBackgroundResource(0x7f0200a4);
                if (mSecondaryInfoContainer != null && mSecondaryInfoContainer.getVisibility() == 0)
                    mSecondaryInfoContainer.setBackgroundResource(0x7f020092);
                if (mSecondaryCallBanner != null && mSecondaryCallBanner.getVisibility() == 0)
                    mSecondaryCallBanner.setBackgroundResource(0x7f020092);
            } else
            if (mSimInfo != null && mSimColorMap != null && mSimInfo.mColor >= 0 && mSimInfo.mColor < mSimColorMap.length)
            {
                if (mSimIndicator != null && mSimIndicator.getVisibility() == 0)
                    mSimIndicator.setBackgroundResource(mSimBorderMap[mSimInfo.mColor]);
                if (mSecondaryInfoContainer != null && mSecondaryInfoContainer.getVisibility() == 0)
                    mSecondaryInfoContainer.setBackgroundResource(mSimColorMap[mSimInfo.mColor]);
                if (mSecondaryCallBanner != null && mSecondaryCallBanner.getVisibility() == 0)
                    mSecondaryCallBanner.setBackgroundResource(mSimColorMap[mSimInfo.mColor]);
            } else
            {
                log("mSimInfo is null or mSimInfo.mColor invalid, do not update background");
                return;
            }
        } else
        {
            if (mSimIndicator != null && mSimIndicator.getVisibility() == 0)
                mSimIndicator.setBackgroundResource(0x7f0200a6);
            if (mSecondaryInfoContainer != null && mSecondaryInfoContainer.getVisibility() == 0)
                mSecondaryInfoContainer.setBackgroundResource(0x7f020091);
            if (mSecondaryCallBanner != null && mSecondaryCallBanner.getVisibility() == 0)
                mSecondaryCallBanner.setBackgroundResource(0x7f020091);
        }
        if (mSecondaryCallBanner != null && mSecondaryCallBanner.getVisibility() == 0)
            mSecondaryCallBanner.setPadding(mCallBannerSidePadding, 0, mCallBannerSidePadding, 0);
        if (mSimIndicator != null && mSimIndicator.getVisibility() == 0)
            mSimIndicator.setPadding(mSimIndicatorPaddingLeft, 0, mSimIndicatorPaddingRight, 0);
    }

    private void updateCallInfoLayout(com.android.internal.telephony.PhoneConstants.State state)
    {
        if (ExtensionManager.getInstance().getCallCardExtension().updateCallInfoLayout(state))
            return;
        boolean flag;
        if (state == com.android.internal.telephony.PhoneConstants.State.RINGING)
            flag = true;
        else
            flag = false;
        log((new StringBuilder()).append("updateCallInfoLayout()...  ringing = ").append(flag).toString());
        if (PhoneUtils.isLandscape(getContext()));
        android.view.ViewGroup.MarginLayoutParams marginlayoutparams = (android.view.ViewGroup.MarginLayoutParams)getLayoutParams();
        marginlayoutparams.bottomMargin = 0;
        log((new StringBuilder()).append("  ==> callInfoLp.bottomMargin: ").append(0).toString());
        setLayoutParams(marginlayoutparams);
    }

    private void updateCallStateWidgets(Call call)
    {
        log((new StringBuilder()).append("updateCallStateWidgets(call ").append(call).append(")...").toString());
        com.android.internal.telephony.Call.State state = call.getState();
        Context context = getContext();
        Phone phone = call.getPhone();
        int i = phone.getPhoneType();
        int j = _cls4..SwitchMap.com.android.internal.telephony.Call.State[state.ordinal()];
        int k = 0;
        String s = null;
        switch (j)
        {
        case 9: // '\t'
            s = getCallFailedString(call);
            k = 0;
            break;

        case 8: // '\b'
            s = context.getString(0x7f0d02c0);
            k = 0;
            break;

        case 6: // '\006'
        case 7: // '\007'
            if (VTCallUtils.isVideoCall(call))
                s = context.getString(0x7f0d0148);
            else
                s = context.getString(0x7f0d02bd);
            boolean flag1 = mApplication.showBluetoothIndication();
            k = 0;
            if (flag1)
                k = 0x7f020064;
            break;

        case 4: // '\004'
        case 5: // '\005'
            s = context.getString(0x7f0d02ba);
            k = 0;
            break;

        case 3: // '\003'
            s = context.getString(0x7f0d02bf);
            k = 0;
            break;

        case 1: // '\001'
            s = "";
            k = 0;
            break;

        default:
            Log.wtf("CallCard", (new StringBuilder()).append("updateCallStateWidgets: unexpected call state: ").append(state).toString());
            break;

        case 2: // '\002'
            break;
        }
        if (i == 2)
            if (state == com.android.internal.telephony.Call.State.ACTIVE && mApplication.cdmaPhoneCallState.IsThreeWayCallOrigStateDialing())
                s = context.getString(0x7f0d02ba);
            else
            if (PhoneGlobals.getInstance().notifier.getIsCdmaRedialCall())
                s = context.getString(0x7f0d02bb);
        if (PhoneUtils.isPhoneInEcm(phone))
            s = PhoneUtils.getECMCardTitle(context, phone);
        InCallUiState incalluistate = mApplication.inCallUiState;
        log((new StringBuilder()).append("==> callStateLabel: '").append(s).append("', bluetoothIconId = ").append(k).append(", providerInfoVisible = ").append(incalluistate.providerInfoVisible).toString());
        boolean flag;
        if (state != com.android.internal.telephony.Call.State.DIALING && state != com.android.internal.telephony.Call.State.DISCONNECTING && state != com.android.internal.telephony.Call.State.DISCONNECTED)
            flag = false;
        else
            flag = true;
        android.animation.LayoutTransition layouttransition = null;
        if (flag)
        {
            layouttransition = mSecondaryInfoContainer.getLayoutTransition();
            mSecondaryInfoContainer.setLayoutTransition(null);
        }
        if (incalluistate.providerInfoVisible)
        {
            mProviderInfo.setVisibility(0);
            TextView textview = mProviderLabel;
            Object aobj[] = new Object[1];
            aobj[0] = incalluistate.providerLabel;
            textview.setText(context.getString(0x7f0d0319, aobj));
            mProviderAddress.setText(incalluistate.providerAddress);
            mInCallScreen.requestRemoveProviderInfoWithDelay();
        } else
        {
            mProviderInfo.setVisibility(8);
        }
        mCallStateLabel.setVisibility(0);
        if (s != null)
            mCallStateLabel.setText(s);
        if (DualTalkUtils.isSupportDualTalk())
            log("DualTalkUtils.isSupportDualTalk()");
        if (k != 0)
        {
            mCallStateLabel.setCompoundDrawablesWithIntrinsicBounds(0, 0, k, 0);
            mCallStateLabel.setCompoundDrawablePadding((int)(5F * mDensity));
        } else
        {
            mCallStateLabel.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
        }
        if (flag)
            mSecondaryInfoContainer.setLayoutTransition(layouttransition);
    }

    private void updateCallTypeLabel(Call call)
    {
        int i;
        if (call != null)
            i = call.getPhone().getPhoneType();
        else
            i = 0;
        if (i == 3)
        {
            mCallTypeLabel.setVisibility(0);
            mCallTypeLabel.setText(0x7f0d02e1);
            mCallTypeLabel.setTextColor(mTextColorCallTypeSip);
            return;
        } else
        {
            mCallTypeLabel.setVisibility(8);
            return;
        }
    }

    private void updateDisplayForConference(Call call)
    {
        log("updateDisplayForConference()...");
        boolean flag = DualTalkUtils.isSupportDualTalk();
        boolean flag1 = false;
        if (flag)
        {
            boolean flag2 = mDualTalk.hasMultipleRingingCall();
            flag1 = false;
            if (flag2)
                flag1 = true;
        }
        int i = call.getPhone().getPhoneType();
        if (i == 2)
        {
            showImage(mPhoto, 0x7f020099);
            if (flag1)
                showImage(mPhotoIncomingPre, 0x7f020099);
            mName.setText(0x7f0d02c1);
        } else
        {
            if (i != 1 && i != 3)
                throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
            showImage(mPhoto, 0x7f020098);
            if (flag1)
                showImage(mPhotoIncomingPre, 0x7f020098);
            mName.setText(0x7f0d02bc);
        }
        mName.setVisibility(0);
        mPhoneNumber.setVisibility(8);
        mLabel.setVisibility(8);
        if (mPhoneNumberGeoDescription != null)
            mPhoneNumberGeoDescription.setVisibility(8);
        updateCallTypeLabel(call);
    }

    private void updateDisplayForPerson(CallerInfo callerinfo, int i, boolean flag, Call call, Connection connection)
    {
        log((new StringBuilder()).append("updateDisplayForPerson(").append(callerinfo).append(")\npresentation:").append(i).append(" isTemporary:").append(flag).toString());
        mPhotoTracker.setPhotoRequest(callerinfo);
        mPhotoTracker.setPhotoState(-1);
        String s = null;
        String s1 = null;
        String s2 = null;
        boolean flag1 = true;
        String s3;
        Uri uri;
        if (callerinfo != null)
        {
            if (mLocaleChanged)
            {
                if (callerinfo.isEmergencyNumber())
                    callerinfo.phoneNumber = getContext().getString(0x10402e5);
                mLocaleChanged = false;
            }
            String s4 = callerinfo.phoneNumber;
            if (s4 != null && s4.startsWith("sip:"))
                s4 = s4.substring(4);
            if (s4 != null)
                s4 = HyphonManager.getInstance().formatNumber(s4);
            if (TextUtils.isEmpty(callerinfo.name))
            {
                if (TextUtils.isEmpty(s4))
                {
                    s3 = PhoneUtils.getPresentationString(getContext(), i);
                    log((new StringBuilder()).append("  ==> no name *or* number! displayName = ").append(s3).toString());
                } else
                if (i != PhoneConstants.PRESENTATION_ALLOWED)
                {
                    s3 = PhoneUtils.getPresentationString(getContext(), i);
                    log((new StringBuilder()).append("  ==> presentation not allowed! displayName = ").append(s3).toString());
                    s = null;
                    s1 = null;
                    s2 = null;
                } else
                if (!TextUtils.isEmpty(callerinfo.cnapName))
                {
                    s3 = callerinfo.cnapName;
                    callerinfo.name = callerinfo.cnapName;
                    s = s4;
                    log((new StringBuilder()).append("  ==> cnapName available: displayName '").append(s3).append("', displayNumber '").append(s).append("'").toString());
                    s1 = null;
                    s2 = null;
                } else
                {
                    s3 = s4;
                    s2 = null;
                    if (connection != null)
                        s2 = callerinfo.geoDescription;
                    log((new StringBuilder()).append("  ==>  no name; falling back to number: displayName '").append(s3).append("', numberGeoDescription '").append(s2).append("'").toString());
                    s = null;
                    s1 = null;
                }
            } else
            if (i != PhoneConstants.PRESENTATION_ALLOWED)
            {
                s3 = PhoneUtils.getPresentationString(getContext(), i);
                log((new StringBuilder()).append("  ==> valid name, but presentation not allowed! displayName = ").append(s3).toString());
                s = null;
                s1 = null;
                s2 = null;
            } else
            {
                s3 = callerinfo.name;
                s = s4;
                s1 = callerinfo.phoneLabel;
                log((new StringBuilder()).append("  ==>  name is present in CallerInfo: displayName '").append(s3).append("', displayNumber '").append(s).append("'").toString());
                s2 = callerinfo.geoDescription;
                log((new StringBuilder()).append("  ==>  name is present in CallerInfo: numberGeooDescription '").append(s2).append("'").toString());
            }
            uri = ContentUris.withAppendedId(android.provider.ContactsContract.Contacts.CONTENT_URI, callerinfo.person_id);
            log((new StringBuilder()).append("- got personUri: '").append(uri).append("', based on info.person_id: ").append(callerinfo.person_id).toString());
        } else
        {
            s3 = PhoneUtils.getPresentationString(getContext(), i);
            s = null;
            s1 = null;
            s2 = null;
            uri = null;
        }
        if (call.isGeneric())
            mName.setText(0x7f0d02c1);
        else
            mName.setText(s3);
        mName.setVisibility(0);
        if (s != null && !call.isGeneric())
        {
            mPhoneNumber.setText(s);
            mPhoneNumber.setVisibility(0);
        } else
        {
            mPhoneNumber.setVisibility(8);
        }
        if (s1 != null && !call.isGeneric())
        {
            mLabel.setText(s1);
            mLabel.setVisibility(0);
        } else
        {
            mLabel.setVisibility(8);
        }
        boolean flag2 = DualTalkUtils.isSupportDualTalk();
        boolean flag3 = false;
        if (flag2)
        {
            boolean flag4 = mDualTalk.hasMultipleRingingCall();
            flag3 = false;
            if (flag4)
            {
                flag3 = true;
                mDualTalk.getFirstActiveRingingCall();
                if (call == mDualTalk.getSecondActiveRingCall())
                    flag1 = false;
            }
        }
        if (!flag || callerinfo != null && callerinfo.isCachedPhotoCurrent)
        {
            if (callerinfo != null && callerinfo.photoResource != 0)
            {
                if (flag1)
                    showImage(mPhoto, callerinfo.photoResource);
                else
                    showImage(mPhotoIncomingPre, callerinfo.photoResource);
            } else
            {
                ImageView imageview;
                if (flag1)
                    imageview = mPhoto;
                else
                    imageview = mPhotoIncomingPre;
                if (!showCachedImage(imageview, callerinfo))
                {
                    if (uri == null)
                    {
                        Log.w("CallCard", "personPri is null. Just use Unknown picture.");
                        ImageView imageview2;
                        if (flag1)
                            imageview2 = mPhoto;
                        else
                            imageview2 = mPhotoIncomingPre;
                        showImage(imageview2, 0x7f02009c);
                    } else
                    if (uri.equals(mLoadingPersonUri))
                    {
                        log((new StringBuilder()).append("The requested Uri (").append(uri).append(") is being loaded already.").append(" Ignoret the duplicate load request.").toString());
                    } else
                    {
                        mLoadingPersonUri = uri;
                        mPhoto.setTag(null);
                        mPhoto.setVisibility(4);
                        ContactsAsyncHelper.startObtainPhotoAsync(0, getContext(), uri, this, new AsyncLoadCookie(mPhoto, callerinfo, call));
                        mHandler.removeMessages(101);
                        mHandler.sendEmptyMessageDelayed(101, 500L);
                    }
                    if (flag3)
                    {
                        Context context = getContext();
                        ImageView imageview1;
                        if (flag1)
                            imageview1 = mPhoto;
                        else
                            imageview1 = mPhotoIncomingPre;
                        ContactsAsyncHelper.startObtainPhotoAsync(0, context, uri, this, new AsyncLoadCookie(imageview1, callerinfo, call));
                    }
                }
            }
        } else
        {
            mPhoto.setTag(null);
            mPhoto.setVisibility(4);
        }
        if (call.getState() == com.android.internal.telephony.Call.State.HOLDING)
            AnimationUtils.Fade.show(mPhotoDimEffect);
        else
            AnimationUtils.Fade.hide(mPhotoDimEffect, 8);
        if (TextUtils.isEmpty(s2))
        {
            mPhoneNumberGeoDescription.setVisibility(4);
        } else
        {
            mPhoneNumberGeoDescription.setText(s2);
            mPhoneNumberGeoDescription.setVisibility(0);
        }
        updateCallTypeLabel(call);
    }

    private void updateDisplayForPerson(CallerInfo callerinfo, int i, boolean flag, Call call, Connection connection, TextView textview, boolean flag1, 
            TextView textview1, TextView textview2, ImageView imageview)
    {
        log((new StringBuilder()).append("updateDisplayForPerson(), info: ").append(callerinfo).append(" presentation:").append(i).append(" isTemporary: ").append(flag).append(" call: ").append(call).append(" conn: ").append(connection).append(" nameView: ").append(textview).append(" isOnHold: +").append(flag1).append(" numberView: ").append(textview1).append(" labelView: ").append(textview2).append("photoView: ").append(imageview).toString());
        if (!flag1)
        {
            mPhotoTracker.setPhotoRequest(callerinfo);
            mPhotoTracker.setPhotoState(-1);
        }
        String s = null;
        String s1 = null;
        String s2;
        Uri uri;
        if (callerinfo != null)
        {
            if (mLocaleChanged)
            {
                if (callerinfo.isEmergencyNumber())
                    callerinfo.phoneNumber = getContext().getString(0x10402e5);
                mLocaleChanged = false;
            }
            String s3 = callerinfo.phoneNumber;
            if (s3 != null && s3.startsWith("sip:"))
                s3 = s3.substring(4);
            String s4 = HyphonManager.getInstance().formatNumber(s3);
            if (TextUtils.isEmpty(callerinfo.name))
            {
                if (TextUtils.isEmpty(s4))
                {
                    s2 = PhoneUtils.getPresentationString(mInCallScreen, i);
                    log((new StringBuilder()).append("  ==> no name *or* number! displayName = ").append(s2).toString());
                } else
                if (i != PhoneConstants.PRESENTATION_ALLOWED)
                {
                    s2 = PhoneUtils.getPresentationString(mInCallScreen, i);
                    log((new StringBuilder()).append("  ==> presentation not allowed! displayName = ").append(s2).toString());
                    s = null;
                    s1 = null;
                } else
                if (!TextUtils.isEmpty(callerinfo.cnapName))
                {
                    s2 = callerinfo.cnapName;
                    callerinfo.name = callerinfo.cnapName;
                    s = s4;
                    log((new StringBuilder()).append("  ==> cnapName available: displayName '").append(s2).append("', displayNumber '").append(s).append("'").toString());
                    s1 = null;
                } else
                {
                    s2 = s4;
                    if (connection != null && connection.isIncoming() && call.getState() != com.android.internal.telephony.Call.State.HOLDING)
                        if (TextUtils.isEmpty(callerinfo.geoDescription))
                        {
                            mPhoneNumberGeoDescription.setVisibility(4);
                        } else
                        {
                            mPhoneNumberGeoDescription.setText(callerinfo.geoDescription);
                            mPhoneNumberGeoDescription.setVisibility(0);
                        }
                    log((new StringBuilder()).append("  ==>  no name; falling back to number: displayName '").append(s2).append("', displayNumber '").append(null).append("'").toString());
                    s = null;
                    s1 = null;
                }
            } else
            if (i != PhoneConstants.PRESENTATION_ALLOWED)
            {
                s2 = PhoneUtils.getPresentationString(mInCallScreen, i);
                log((new StringBuilder()).append("  ==> valid name, but presentation not allowed! displayName = ").append(s2).toString());
                s = null;
                s1 = null;
            } else
            {
                s2 = callerinfo.name;
                s = s4;
                s1 = callerinfo.phoneLabel;
                log((new StringBuilder()).append("  ==>  name is present in CallerInfo: displayName '").append(s2).append("', displayNumber '").append(s).append("'").toString());
            }
            uri = ContentUris.withAppendedId(android.provider.ContactsContract.Contacts.CONTENT_URI, callerinfo.person_id);
            log((new StringBuilder()).append("- got personUri: '").append(uri).append("', based on info.person_id: ").append(callerinfo.person_id).toString());
        } else
        {
            s2 = PhoneUtils.getPresentationString(mInCallScreen, i);
            s = null;
            s1 = null;
            uri = null;
        }
        if (call.isGeneric() && textview != null)
            textview.setText(0x7f0d02c1);
        else
        if (textview != null)
            textview.setText(s2);
        if (textview != null)
            textview.setVisibility(0);
        if (!flag || callerinfo != null && callerinfo.isCachedPhotoCurrent)
        {
            if (callerinfo != null && callerinfo.photoResource != 0)
                showImage(imageview, callerinfo.photoResource);
            else
            if (!showCachedImage(imageview, callerinfo))
            {
                mLoadingPersonUri = uri;
                imageview.setTag(null);
                imageview.setVisibility(4);
                if (uri == null)
                {
                    Log.w("CallCard", "personPri is null. Just use Unknown picture.");
                    showImage(imageview, 0x7f02009c);
                } else
                {
                    ContactsAsyncHelper.startObtainPhotoAsync(0, getContext(), uri, this, new AsyncLoadCookie(imageview, callerinfo, call));
                    mHandler.removeMessages(101);
                    mHandler.sendEmptyMessageDelayed(101, 500L);
                }
            }
        } else
        {
            imageview.setTag(null);
            imageview.setVisibility(4);
        }
        if (textview1 != null && s != null && !call.isGeneric())
        {
            textview1.setText(s);
            textview1.setVisibility(0);
        } else
        if (textview1 != null)
            textview1.setVisibility(8);
        if (textview2 != null && s1 != null && !call.isGeneric())
        {
            textview2.setText(s1);
            textview2.setVisibility(0);
        } else
        if (textview2 != null)
        {
            textview2.setVisibility(8);
            return;
        }
    }

    private void updateForegroundCall(CallManager callmanager)
    {
        log("updateForegroundCall()...");
        Call call;
        Call call1;
        if (DualTalkUtils.isSupportDualTalk() && mDualTalk.isDualTalkMultipleHoldCase())
        {
            call = mDualTalk.getActiveFgCall();
            call1 = mDualTalk.getFirstActiveBgCall();
        } else
        if (DualTalkUtils.isSupportDualTalk() && mDualTalk.hasDualHoldCallsOnly())
        {
            call = mDualTalk.getFirstActiveBgCall();
            call1 = mDualTalk.getSecondActiveBgCall();
        } else
        if (DualTalkUtils.isSupportDualTalk() && mDualTalk.isCdmaAndGsmActive())
        {
            call = mDualTalk.getActiveFgCall();
            call1 = mDualTalk.getFirstActiveBgCall();
            log((new StringBuilder()).append("isCdmaAndGsmActive: fgCall = ").append(call).append("  bgCall = ").append(call1).toString());
        } else
        {
            call = callmanager.getActiveFgCall();
            call1 = callmanager.getFirstActiveBgCall();
            log((new StringBuilder()).append("updateForegroundCall: common case : fgCall ").append(call).append("  bgCall = ").append(call1).toString());
        }
        Call call2 = callmanager.getFirstActiveRingingCall();
        if (call2 == null || call == null || call2.getState() == com.android.internal.telephony.Call.State.IDLE || !call.getState().isDialing())
        {
            if (call.getState() == com.android.internal.telephony.Call.State.IDLE)
            {
                log("updateForegroundCall: no active call, show holding call");
                call = call1;
                call1 = null;
            }
            if (call.getState() == com.android.internal.telephony.Call.State.ACTIVE)
                updateElapsedTimeWidget(call);
            displayMainCallStatus(callmanager, call);
            int i = call.getPhone().getPhoneType();
            log((new StringBuilder()).append("updateForegroundCall: fgCall phoneType ").append(i).toString());
            if (DualTalkUtils.isSupportDualTalk() && mDualTalk.isCdmaAndGsmActive())
                if (i == 1 && call1 != null && call1.getPhone().getPhoneType() == 1)
                {
                    displaySecondaryCallStatus(callmanager, call1);
                    displaySecondHoldCallStatus(mDualTalk.getSecondActiveBgCall());
                    return;
                } else
                {
                    displaySecondaryCallStatus(callmanager, null);
                    displaySecondHoldCallStatus(call1);
                    return;
                }
            if (i == 2)
                if (mApplication.cdmaPhoneCallState.getCurrentCallState() == CdmaPhoneCallState.PhoneCallState.THRWAY_ACTIVE && mApplication.cdmaPhoneCallState.IsThreeWayCallOrigStateDialing())
                {
                    displaySecondaryCallStatus(callmanager, call);
                    return;
                } else
                {
                    displaySecondaryCallStatus(callmanager, call1);
                    return;
                }
            if (i == 1 || i == 3)
            {
                boolean flag = isSecondaryCallVisible(callmanager);
                if (flag)
                    displaySecondaryCallStatus(callmanager, call1);
                else
                    displaySecondaryCallStatus(callmanager, null);
                if (isSecondHoldCallVisible(callmanager))
                {
                    if (flag)
                    {
                        displaySecondHoldCallStatus(mDualTalk.getSecondActiveBgCall());
                        return;
                    } else
                    {
                        displaySecondHoldCallStatus(call1);
                        return;
                    }
                } else
                {
                    displaySecondHoldCallStatus(null);
                    return;
                }
            }
        }
    }

    private void updateNoCall(CallManager callmanager)
    {
        log("updateNoCall()...");
        InCallUiState.FakeCall fakecall = mApplication.inCallUiState.latestDisconnectCall;
        if (fakecall != null)
        {
            displayFakeCallStatus(fakecall);
            return;
        } else
        {
            displayMainCallStatus(callmanager, null);
            displaySecondaryCallStatus(callmanager, null);
            displaySecondHoldCallStatus(null);
            return;
        }
    }

    private void updatePhotoForCallState(Call call, ImageView imageview)
    {
        log((new StringBuilder()).append("updatePhotoForCallState(").append(call).append(")...").toString());
        com.android.internal.telephony.Call.State state = call.getState();
        int _tmp = _cls4..SwitchMap.com.android.internal.telephony.Call.State[state.ordinal()];
        int i = call.getPhone().getPhoneType();
        Connection connection;
        if (i == 2)
        {
            connection = call.getLatestConnection();
        } else
        {
            if (i != 1 && i != 3)
                throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
            connection = call.getEarliestConnection();
        }
        CallerInfo callerinfo = null;
        if (connection != null)
        {
            Object obj = connection.getUserData();
            if (obj instanceof CallerInfo)
            {
                callerinfo = (CallerInfo)obj;
            } else
            {
                boolean flag = obj instanceof PhoneUtils.CallerInfoToken;
                callerinfo = null;
                if (flag)
                    callerinfo = ((PhoneUtils.CallerInfoToken)obj).currentInfo;
            }
        }
        int j = 0;
        if (callerinfo != null)
            j = callerinfo.photoResource;
        if (j == 0)
        {
            if (!PhoneUtils.isConferenceCall(call) && !showCachedImage(imageview, callerinfo) && mPhotoTracker.getPhotoState() == -2)
            {
                Uri uri = mPhotoTracker.getPhotoUri();
                if (uri == null)
                {
                    Log.w("CallCard", "photoUri became null. Show default avatar icon");
                    showImage(imageview, 0x7f02009c);
                } else
                {
                    log("start asynchronous load inside updatePhotoForCallState()");
                    imageview.setTag(null);
                    imageview.setVisibility(4);
                    ContactsAsyncHelper.startObtainPhotoAsync(1, getContext(), uri, this, new AsyncLoadCookie(imageview, callerinfo, null));
                }
                mPhotoTracker.setPhotoState(-1);
            }
            if (j != 0)
            {
                log((new StringBuilder()).append("- overrriding photo image: ").append(j).toString());
                showImage(imageview, j);
                mPhotoTracker.setPhotoState(-2);
            }
            return;
        } else
        {
            showImage(imageview, j);
            mPhotoTracker.setPhotoState(-1);
            return;
        }
    }

    private void updateRingingCall(CallManager callmanager)
    {
        log("updateRingingCall()...");
        Call call;
        if (DualTalkUtils.isSupportDualTalk() && mDualTalk.hasMultipleRingingCall())
            call = mDualTalk.getFirstActiveRingingCall();
        else
            call = callmanager.getFirstActiveRingingCall();
        displayMainCallStatus(callmanager, call);
        if (DualTalkUtils.isSupportDualTalk())
            if (mDualTalk.hasMultipleRingingCall())
                displaySecondIncomingCallStatus(mDualTalk.getSecondActiveRingCall());
            else
                displaySecondIncomingCallStatus(null);
        displaySecondaryCallStatus(callmanager, null);
        displaySecondHoldCallStatus(null);
    }

    private void updateSimInfo(Call call)
    {
        if (GeminiUtils.isGeminiSupport())
        {
            GeminiPhone geminiphone = (GeminiPhone)PhoneGlobals.getInstance().phone;
            int i = GeminiUtils.getSlotNotIdle(geminiphone);
            if (i == -1)
            {
                int ai[] = GeminiUtils.getSlots();
                int j = ai.length;
                int k = 0;
label0:
                do
                {
label1:
                    {
                        if (k < j)
                        {
                            int l = ai[k];
                            if (geminiphone.getPendingMmiCodesGemini(l).size() == 0)
                                break label1;
                            i = l;
                        }
                        mSimInfo = null;
                        if (i == -1 && call != null)
                            mSimInfo = PhoneUtils.getSimInfoByCall(call);
                        log((new StringBuilder()).append("updateSimIndicator, running mmi, slot = ").append(i).toString());
                        break label0;
                    }
                    k++;
                } while (true);
            } else
            {
                mSimInfo = SIMInfoWrapper.getDefault().getSimInfoBySlot(i);
                if (mSimInfo != null)
                {
                    log((new StringBuilder()).append("updateSimIndicator slot = ").append(i).append(" mSimInfo :").toString());
                    log((new StringBuilder()).append("displayName = ").append(mSimInfo.mDisplayName).toString());
                    log((new StringBuilder()).append("color       = ").append(mSimInfo.mColor).toString());
                    if (mSimInfo.mDisplayName == null)
                    {
                        mSimInfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(mInCallScreen, i);
                        log((new StringBuilder()).append("displayName = ").append(mSimInfo.mDisplayName).toString());
                        return;
                    }
                }
            }
        }
    }

    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        if (accessibilityevent.getEventType() == 32)
        {
            dispatchPopulateAccessibilityEvent(accessibilityevent, ((View) (mName)));
            dispatchPopulateAccessibilityEvent(accessibilityevent, ((View) (mPhoneNumber)));
        } else
        {
            dispatchPopulateAccessibilityEvent(accessibilityevent, ((View) (mCallStateLabel)));
            dispatchPopulateAccessibilityEvent(accessibilityevent, ((View) (mPhoto)));
            dispatchPopulateAccessibilityEvent(accessibilityevent, ((View) (mName)));
            dispatchPopulateAccessibilityEvent(accessibilityevent, ((View) (mPhoneNumber)));
            dispatchPopulateAccessibilityEvent(accessibilityevent, ((View) (mLabel)));
            if (mSecondaryCallName != null)
                dispatchPopulateAccessibilityEvent(accessibilityevent, ((View) (mSecondaryCallName)));
            if (mSecondaryCallPhoto != null)
            {
                dispatchPopulateAccessibilityEvent(accessibilityevent, ((View) (mSecondaryCallPhoto)));
                return true;
            }
        }
        return true;
    }

    void displayFakeCallStatus(InCallUiState.FakeCall fakecall)
    {
        if (fakecall == null)
        {
            mPrimaryCallInfo.setVisibility(8);
            return;
        }
        log("displayFakeCallStatus...");
        PhoneUtils.CallerInfoToken callerinfotoken = PhoneUtils.startGetCallerInfo(getContext(), fakecall.conn, this, fakecall);
        mPrimaryCallInfo.setVisibility(0);
        mCallStateLabel.setVisibility(0);
        mCallStateLabel.setText(getCallFailedString(fakecall.cause));
        if (GeminiUtils.isGeminiSupport())
            mSimInfo = SIMInfoWrapper.getDefault().getSimInfoBySlot(fakecall.slotId);
        else
            mSimInfo = null;
        if (mSimInfo != null)
        {
            mSimIndicator.setText(mSimInfo.mDisplayName);
            mSimIndicator.setVisibility(0);
        }
        updateCallBannerBackground(fakecall, mPrimaryCallBanner);
        if (fakecall.phoneType == 3)
        {
            mOperatorName.setText(0x7f0d02e1);
        } else
        {
            String s = GeminiUtils.getOperatorName(fakecall.slotId);
            mOperatorName.setText(s);
            mOperatorName.setVisibility(0);
        }
        if (mPhoneNumber.getVisibility() == 0)
            mPhoneNumber.setText("");
        if (mLabel.getVisibility() == 0)
            mLabel.setText("");
        if (mSimInfo != null && !TextUtils.isEmpty(mSimInfo.mDisplayName) && fakecall.phoneType != 3)
        {
            mSimIndicator.setText(mSimInfo.mDisplayName);
            mSimIndicator.setVisibility(0);
        } else
        {
            mSimIndicator.setVisibility(8);
        }
        if (callerinfotoken != null && callerinfotoken.isFinal)
        {
            if (callerinfotoken.currentInfo != null && !TextUtils.isEmpty(callerinfotoken.currentInfo.name))
                mName.setText(callerinfotoken.currentInfo.name);
            else
                mName.setText(fakecall.number);
        } else
        {
            mName.setText(fakecall.number);
        }
        showImage(mPhoto, 0x7f02009c);
        displaySecondaryCallStatus(mApplication.mCM, null);
        displaySecondHoldCallStatus(null);
    }

    void displaySecondHoldCallStatus(Call call)
    {
        log((new StringBuilder()).append("displaySecondHoldCallStatus(call =").append(call).append(")...").toString());
        if (call == null)
        {
            if (m2ndHoldName != null)
                m2ndHoldName.setVisibility(8);
            if (m2ndHoldState != null)
                m2ndHoldState.setVisibility(8);
            if (mPhotoHoldPre != null)
                mPhotoHoldPre.setVisibility(8);
            if (mDualTalkSecondaryCallInfo != null)
                mDualTalkSecondaryCallInfo.setVisibility(8);
            if (mDualTalkSecondaryCallPhotoDimEffect != null)
                AnimationUtils.Fade.hide(mDualTalkSecondaryCallPhotoDimEffect, 8);
            return;
        }
        if (mDualTalkSecondaryCallInfo == null)
        {
            mDualTalkSecondaryCallInfo = (ViewStub)findViewById(0x7f0800f1);
            mDualTalkSecondaryCallInfo.setVisibility(0);
            mPhotoHoldPre = (ImageView)findViewById(0x7f080050);
            m2ndHoldName = (TextView)findViewById(0x7f08004f);
            m2ndHoldState = (TextView)findViewById(0x7f080054);
            mSecondHoldCallBanner = (ViewGroup)findViewById(0x7f080052);
            mDualTalkSecondaryCallPhotoDimEffect = findViewById(0x7f080051);
            mDualTalkSecondaryCallPhotoDimEffect.setEnabled(true);
            mDualTalkSecondaryCallPhotoDimEffect.setClickable(true);
            mDualTalkSecondaryCallPhotoDimEffect.setOnClickListener(callCardListener);
            mDualTalkSecondaryCallPhotoDimEffect.setOnTouchListener(new SmallerHitTargetTouchListener());
        } else
        {
            mDualTalkSecondaryCallInfo.setVisibility(0);
        }
        m2ndHoldName.setVisibility(0);
        m2ndHoldState.setVisibility(0);
        mPhotoHoldPre.setVisibility(0);
        AnimationUtils.Fade.show(mDualTalkSecondaryCallPhotoDimEffect);
        log((new StringBuilder()).append("displaySecondHoldCallStatus ==> ").append(call.getConnections()).toString());
        android.provider.Telephony.SIMInfo siminfo = PhoneUtils.getSimInfoByCall(call);
        if (siminfo != null && siminfo.mColor >= 0 && siminfo.mColor < mSimColorMap.length)
            mSecondHoldCallBanner.setBackgroundResource(mSimColorMap[siminfo.mColor]);
        else
        if (siminfo == null && call.getPhone().getPhoneType() == 3)
            mSecondHoldCallBanner.setBackgroundResource(0x7f020092);
        mSecondHoldCallBanner.setPadding(mCallBannerSidePadding, 0, mCallBannerSidePadding, 0);
        com.android.internal.telephony.Call.State state = call.getState();
        switch (_cls4..SwitchMap.com.android.internal.telephony.Call.State[state.ordinal()])
        {
        case 2: // '\002'
            log("displaySecondHoldCallStatus : meet cdma case!");
            // fall through

        case 3: // '\003'
            if (PhoneUtils.isConferenceCall(call))
            {
                log("==> conference call.");
                m2ndHoldName.setText(getContext().getString(0x7f0d0190));
                if (call.getPhone().getPhoneType() == 2)
                    showImage(mPhotoHoldPre, 0x7f020099);
                else
                    showImage(mPhotoHoldPre, 0x7f020098);
            } else
            {
                PhoneUtils.CallerInfoToken callerinfotoken;
                if (sLCforUserDataSecondHoldCall)
                {
                    log("- displaySecondHoldCallStatus: the language changed to clear userdata");
                    CallInfoCookie callinfocookie = new CallInfoCookie(call, 2);
                    callerinfotoken = PhoneUtils.startGetCallerInfo(getContext(), call, this, callinfocookie, true);
                    sLCforUserDataSecondHoldCall = false;
                } else
                {
                    callerinfotoken = PhoneUtils.startGetCallerInfo(getContext(), call, this, m2ndHoldName);
                }
                log("==> NOT a conf call; call startGetCallerInfo...");
                m2ndHoldName.setText(PhoneUtils.getCompactNameFromCallerInfo(callerinfotoken.currentInfo, getContext()));
                if (callerinfotoken.isFinal)
                {
                    int i = call.getPhone().getPhoneType();
                    Connection connection;
                    if (i == 2)
                    {
                        connection = call.getLatestConnection();
                    } else
                    {
                        if (i != 1 && i != 3)
                            throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
                        connection = call.getEarliestConnection();
                    }
                    int j = connection.getNumberPresentation();
                    updateDisplayForPerson(callerinfotoken.currentInfo, j, false, call, connection, null, false, null, null, mPhotoHoldPre);
                } else
                {
                    showImage(mPhotoHoldPre, 0x7f02009c);
                }
            }
            m2ndHoldState.setText(getContext().getString(0x7f0d02bf));
            return;

        default:
            mDualTalkSecondaryCallInfo.setVisibility(8);
            return;
        }
    }

    void displaySecondIncomingCallStatus(Call call)
    {
        log((new StringBuilder()).append("displaySecondIncomingCallStatus(call =").append(call).append(")...").toString());
        if (call == null)
        {
            if (m2ndIncomingName != null)
                m2ndIncomingName.setVisibility(8);
            if (m2ndIncomingState != null)
                m2ndIncomingState.setVisibility(8);
            if (mPhotoIncomingPre != null)
                mPhotoIncomingPre.setVisibility(8);
            if (mIncomingCall2PhotoDimEffect != null)
                AnimationUtils.Fade.hide(mIncomingCall2PhotoDimEffect, 8);
            if (mSecondIncomingCallBanner != null)
                mSecondIncomingCallBanner.setVisibility(8);
            if (mIncomingCall2Info != null)
            {
                mIncomingCall2Info.setVisibility(8);
                mNeedShowIncomingCall2Animator = false;
            }
            return;
        }
        log((new StringBuilder()).append("displaySecondIncomingCallStatus ==> ").append(call.getConnections()).toString());
        if (mIncomingCall2Info != null && 8 == mIncomingCall2Info.getVisibility())
            mNeedShowIncomingCall2Animator = true;
        if (mNeedShowIncomingCall2Animator)
            displaySecondaryIncomingAnimator();
        if (mIncomingCall2Info != null && mIncomingCall2PhotoDimEffect != null)
        {
            mIncomingCall2Info.setVisibility(0);
            AnimationUtils.Fade.show(mIncomingCall2PhotoDimEffect);
        }
        if (mPhotoIncomingPre != null)
            mPhotoIncomingPre.setVisibility(0);
        if (PhoneUtils.isConferenceCall(call))
        {
            updateDisplayForConference(call);
        } else
        {
            int i = call.getPhone().getPhoneType();
            Connection connection;
            if (i == 2)
            {
                connection = call.getLatestConnection();
            } else
            {
                if (i != 1 && i != 3)
                    throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
                connection = call.getEarliestConnection();
            }
            if (connection == null)
            {
                log("displaySecondIncomingCallStatus: connection is null, using default values.");
                updateDisplayForPerson(PhoneUtils.getCallerInfo(getContext(), null), PhoneConstants.PRESENTATION_ALLOWED, false, call, connection);
            } else
            {
                log((new StringBuilder()).append("  - CONN: ").append(connection).append(", state = ").append(connection.getState()).toString());
                int j = connection.getNumberPresentation();
                Object obj = connection.getUserData();
                boolean flag;
                if (obj instanceof PhoneUtils.CallerInfoToken)
                    flag = mPhotoTracker.isDifferentImageRequest(((PhoneUtils.CallerInfoToken)obj).currentInfo);
                else
                    flag = mPhotoTracker.isDifferentImageRequest(connection);
                if (i == 2)
                {
                    Object obj1 = connection.getUserData();
                    String s1 = connection.getAddress();
                    String s2 = connection.getCnapName();
                    CallerInfo callerinfo4;
                    if (obj1 instanceof PhoneUtils.CallerInfoToken)
                    {
                        callerinfo4 = ((PhoneUtils.CallerInfoToken)obj).currentInfo;
                    } else
                    {
                        boolean flag2 = obj instanceof CallerInfo;
                        callerinfo4 = null;
                        if (flag2)
                            callerinfo4 = (CallerInfo)obj;
                    }
                    if (callerinfo4 != null)
                    {
                        if (s1 != null && !s1.equals(callerinfo4.phoneNumber))
                        {
                            log((new StringBuilder()).append("- displayMainCallStatus: updatedNumber = ").append(s1).toString());
                            flag = true;
                        }
                        if (s2 != null && !s2.equals(callerinfo4.cnapName))
                        {
                            log((new StringBuilder()).append("- displayMainCallStatus: updatedCnapName = ").append(s2).toString());
                            flag = true;
                        }
                    }
                }
                if (flag)
                {
                    log("- displaySecondIncomingCallStatus: starting CallerInfo query...");
                    if (mLCforUserData)
                    {
                        log("- displaySecondIncomingCallStatus: the language changed to clear userdata");
                        connection.clearUserData();
                        mLCforUserData = false;
                    }
                    CallInfoCookie callinfocookie = new CallInfoCookie(call, 0);
                    PhoneUtils.CallerInfoToken callerinfotoken = PhoneUtils.startGetCallerInfo(getContext(), connection, this, callinfocookie);
                    TextView textview = m2ndIncomingName;
                    CallerInfo callerinfo2 = callerinfotoken.currentInfo;
                    boolean flag1;
                    if (!callerinfotoken.isFinal)
                        flag1 = true;
                    else
                        flag1 = false;
                    textview.setText(getCallerName(callerinfo2, j, flag1, call, connection));
                    CallerInfo callerinfo3 = callerinfotoken.currentInfo;
                    ImageView imageview2 = mPhotoIncomingPre;
                    updateDisplayForPerson(callerinfo3, j, false, call, connection, null, false, null, null, imageview2);
                } else
                {
                    log("- displaySecondIncomingCallStatus: using data we already have...");
                    if (obj instanceof CallerInfo)
                    {
                        CallerInfo callerinfo1 = (CallerInfo)obj;
                        callerinfo1.cnapName = connection.getCnapName();
                        callerinfo1.numberPresentation = connection.getNumberPresentation();
                        callerinfo1.namePresentation = connection.getCnapNamePresentation();
                        log((new StringBuilder()).append("- displaySecondIncomingCallStatus: CNAP data from Connection: CNAP name=").append(callerinfo1.cnapName).append(", Number/Name Presentation=").append(callerinfo1.numberPresentation).toString());
                        log((new StringBuilder()).append("   ==> Got CallerInfo; updating display: ci = ").append(callerinfo1).toString());
                        ImageView imageview1 = mPhotoIncomingPre;
                        updateDisplayForPerson(callerinfo1, j, false, call, connection, null, false, null, null, imageview1);
                        m2ndIncomingName.setText(getCallerName(callerinfo1, j, false, call, connection));
                    } else
                    if (obj instanceof PhoneUtils.CallerInfoToken)
                    {
                        CallerInfo callerinfo = ((PhoneUtils.CallerInfoToken)obj).currentInfo;
                        log((new StringBuilder()).append("- displaySecondIncomingCallStatus: CNAP data from Connection: CNAP name=").append(callerinfo.cnapName).append(", Number/Name Presentation=").append(callerinfo.numberPresentation).toString());
                        log((new StringBuilder()).append("   ==> Got CallerInfoToken; updating display: ci = ").append(callerinfo).toString());
                        ImageView imageview = mPhotoIncomingPre;
                        updateDisplayForPerson(callerinfo, j, false, call, connection, null, false, null, null, imageview);
                        m2ndIncomingName.setText(getCallerName(callerinfo, j, true, call, connection));
                    } else
                    {
                        Log.w("CallCard", (new StringBuilder()).append("displaySecondIncomingCallStatus: runQuery was false, but we didn't have a cached CallerInfo object!  o = ").append(obj).toString());
                    }
                }
            }
        }
        android.provider.Telephony.SIMInfo siminfo = PhoneUtils.getSimInfoByCall(call);
        if (siminfo != null && siminfo.mColor >= 0 && siminfo.mColor < mSimColorMap.length)
        {
            if (mSecondIncomingCallBanner != null)
                mSecondIncomingCallBanner.setBackgroundResource(mSimColorMap[siminfo.mColor]);
        } else
        if (siminfo == null && call.getPhone().getPhoneType() == 3 && mSecondIncomingCallBanner != null)
            mSecondIncomingCallBanner.setBackgroundResource(0x7f020092);
        if (mSecondIncomingCallBanner != null)
            mSecondIncomingCallBanner.setVisibility(0);
        m2ndIncomingName.setVisibility(0);
        m2ndIncomingState.setVisibility(0);
        String s;
        if (VTCallUtils.isVideoCall(call))
            s = getContext().getString(0x7f0d0148);
        else
            s = getContext().getString(0x7f0d02bd);
        m2ndIncomingState.setText(s);
    }

    public String getCallInfoName(int i)
    {
        String s;
        if (i == 0)
        {
            TextView textview2 = mName;
            s = null;
            if (textview2 != null)
            {
                CharSequence charsequence2 = mName.getText();
                s = null;
                if (charsequence2 != null)
                    s = mName.getText().toString();
            }
        } else
        if (i == 1)
        {
            TextView textview1 = mSecondaryCallName;
            s = null;
            if (textview1 != null)
            {
                CharSequence charsequence1 = mSecondaryCallName.getText();
                s = null;
                if (charsequence1 != null)
                    return mSecondaryCallName.getText().toString();
            }
        } else
        {
            TextView textview = m2ndHoldName;
            s = null;
            if (textview != null)
            {
                CharSequence charsequence = m2ndHoldName.getText();
                s = null;
                if (charsequence != null)
                    return m2ndHoldName.getText().toString();
            }
        }
        return s;
    }

    String getCallerName(CallerInfo callerinfo, int i, boolean flag, Call call, Connection connection)
    {
        if (callerinfo != null)
        {
            if (mLocaleChanged)
            {
                if (callerinfo.isEmergencyNumber())
                    callerinfo.phoneNumber = getContext().getString(0x10402e5);
                mLocaleChanged = false;
            }
            String s = callerinfo.phoneNumber;
            if (s != null && s.startsWith("sip:"))
                s = s.substring(4);
            if (s != null)
                s = HyphonManager.getInstance().formatNumber(s);
            if (TextUtils.isEmpty(callerinfo.name))
            {
                String s2;
                if (TextUtils.isEmpty(s))
                {
                    s2 = PhoneUtils.getPresentationString(mInCallScreen, i);
                    log((new StringBuilder()).append("  ==> no name *or* number! displayName = ").append(s2).toString());
                } else
                {
                    if (i != PhoneConstants.PRESENTATION_ALLOWED)
                    {
                        String s4 = PhoneUtils.getPresentationString(mInCallScreen, i);
                        log((new StringBuilder()).append("  ==> presentation not allowed! displayName = ").append(s4).toString());
                        return s4;
                    }
                    if (!TextUtils.isEmpty(callerinfo.cnapName))
                    {
                        String s3 = callerinfo.cnapName;
                        callerinfo.name = callerinfo.cnapName;
                        log((new StringBuilder()).append("  ==> cnapName available: displayName '").append(s3).append("'").toString());
                        return s3;
                    }
                    s2 = s;
                    if (connection != null && connection.isIncoming())
                    {
                        log(" (conn != null) && (conn.isIncoming())");
                        return s2;
                    }
                }
                return s2;
            }
            if (i != PhoneConstants.PRESENTATION_ALLOWED)
            {
                String s1 = PhoneUtils.getPresentationString(mInCallScreen, i);
                log((new StringBuilder()).append("  ==> valid name, but presentation not allowed! displayName = ").append(s1).toString());
                return s1;
            } else
            {
                return callerinfo.name;
            }
        } else
        {
            return PhoneUtils.getPresentationString(mInCallScreen, i);
        }
    }

    int getOperatorColorByCall(Call call)
    {
        if (call != null && GeminiUtils.isGeminiSupport())
        {
            android.provider.Telephony.SIMInfo siminfo = PhoneUtils.getSimInfoByCall(call);
            if (siminfo != null && !TextUtils.isEmpty(siminfo.mDisplayName) && call.getPhone().getPhoneType() != 3)
                return siminfo.mColor;
        }
        return -1;
    }

    String getOperatorNameByCall(Call call)
    {
label0:
        {
            if (call != null)
            {
                if (!GeminiUtils.isGeminiSupport())
                    break label0;
                android.provider.Telephony.SIMInfo siminfo = PhoneUtils.getSimInfoByCall(call);
                if (siminfo != null && !TextUtils.isEmpty(siminfo.mDisplayName) && call.getPhone().getPhoneType() != 3)
                    return siminfo.mDisplayName;
                if (call.getPhone().getPhoneType() == 3)
                    return getContext().getString(0x7f0d02e1);
            }
            return null;
        }
        return SystemProperties.get("gsm.operator.alpha");
    }

    public boolean hasMultiplePhoneActive()
    {
        CallManager callmanager = mApplication.mCM;
        if (callmanager != null && callmanager.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
        {
            List list = callmanager.getAllPhones();
            log((new StringBuilder()).append("CallManager says in idle state!").append(list).toString());
            int i = 0;
            for (Iterator iterator = list.iterator(); iterator.hasNext();)
            {
                Phone phone = (Phone)iterator.next();
                if (phone.getState() == com.android.internal.telephony.PhoneConstants.State.OFFHOOK)
                {
                    i++;
                    log((new StringBuilder()).append("non IDLE phone = ").append(phone.toString()).toString());
                    if (i > 1)
                    {
                        log("More than one phone active!");
                        return true;
                    }
                }
            }

            log("Strange! no phone active but we go here!");
            return false;
        } else
        {
            log("CallManager says in idle state!");
            return false;
        }
    }

    public void hideCallCardElements()
    {
        mPrimaryCallInfo.setVisibility(8);
        mSecondaryCallInfo.setVisibility(8);
    }

    public void hideCallStates(CallManager callmanager)
    {
        if (mSimInfo != null && TextUtils.isEmpty(mSimInfo.mDisplayName))
        {
            log("mSimIndicator GONE");
            mSimIndicator.setVisibility(8);
        }
        if (callmanager != null && callmanager.getFirstActiveBgCall() == null)
        {
            log("mSecondaryCallInfo GONE");
            mSecondaryCallInfo.setVisibility(8);
        }
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        log((new StringBuilder()).append("CallCard onFinishInflate(this = ").append(this).append(")...").toString());
        mCallInfoContainer = (ViewGroup)findViewById(0x7f08000c);
        mPrimaryCallInfo = (ViewGroup)findViewById(0x7f08000d);
        mPrimaryCallBanner = (ViewGroup)findViewById(0x7f0800e3);
        mSecondaryInfoContainer = (ViewGroup)findViewById(0x7f0800e9);
        mProviderInfo = (ViewGroup)findViewById(0x7f0800ea);
        mProviderLabel = (TextView)findViewById(0x7f0800eb);
        mProviderAddress = (TextView)findViewById(0x7f0800ec);
        mCallStateLabel = (TextView)findViewById(0x7f0800ee);
        mTextColorCallTypeSip = getResources().getColor(0x7f090000);
        mPhoto = (ImageView)findViewById(0x7f0800e1);
        mPhotoDimEffect = findViewById(0x7f0800e2);
        mName = (TextView)findViewById(0x7f0800e4);
        mPhoneNumber = (TextView)findViewById(0x7f08001c);
        mLabel = (TextView)findViewById(0x7f0800e6);
        mCallTypeLabel = (TextView)findViewById(0x7f0800e8);
        mSecondaryCallInfo = (ViewStub)findViewById(0x7f08000f);
        mOperatorName = (TextView)findViewById(0x7f0800cf);
        mSimIndicator = (TextView)findViewById(0x7f0800ef);
        mPhoneNumberGeoDescription = (TextView)findViewById(0x7f0800e7);
        if (DualTalkUtils.isSupportDualTalk())
        {
            mIncomingCall2Info = (ViewGroup)findViewById(0x7f0800f2);
            mPhotoIncomingPre = (ImageView)findViewById(0x7f08008e);
            m2ndIncomingName = (TextView)findViewById(0x7f08008d);
            m2ndIncomingState = (TextView)findViewById(0x7f080091);
            mSecondIncomingCallBanner = (ViewGroup)findViewById(0x7f080090);
            mIncomingCall2PhotoDimEffect = findViewById(0x7f08008f);
            mIncomingCall2PhotoDimEffect.setEnabled(true);
            mIncomingCall2PhotoDimEffect.setClickable(true);
            mIncomingCall2PhotoDimEffect.setOnClickListener(callCardListener);
            mIncomingCall2PhotoDimEffect.setOnTouchListener(new SmallerHitTargetTouchListener());
            mIncomingCallInfoWidth = getContext().getResources().getDimensionPixelSize(0x7f0c003a);
            mIncomingCallInfoHeight = getContext().getResources().getDimensionPixelSize(0x7f0c0039);
            mIncomingCallInfoTopMargin = getContext().getResources().getDimensionPixelSize(0x7f0c0038);
        }
        ExtensionManager.getInstance().getCallCardExtension().onFinishInflate(this);
    }

    public void onImageLoadComplete(int i, Drawable drawable, Bitmap bitmap, Object obj)
    {
        mHandler.removeMessages(101);
        if (mLoadingPersonUri != null)
            PhoneUtils.sendViewNotificationAsync(mApplication, mLoadingPersonUri);
        else
            Log.w("CallCard", "Person Uri isn't available while Image is successfully loaded.");
        mLoadingPersonUri = null;
        AsyncLoadCookie asyncloadcookie = (AsyncLoadCookie)obj;
        CallerInfo callerinfo = asyncloadcookie.callerInfo;
        ImageView imageview = asyncloadcookie.imageView;
        Call call = asyncloadcookie.call;
        callerinfo.cachedPhoto = drawable;
        callerinfo.cachedPhotoIcon = bitmap;
        callerinfo.isCachedPhotoCurrent = true;
        if (drawable != null)
            showImage(imageview, drawable);
        else
        if (bitmap != null)
            showImage(imageview, bitmap);
        else
            showImage(imageview, 0x7f02009c);
        if (i == 0)
            updatePhotoForCallState(call, imageview);
    }

    public void onQueryComplete(int i, Object obj, CallerInfo callerinfo)
    {
        log((new StringBuilder()).append("onQueryComplete: token ").append(i).append(", cookie ").append(obj).append(", ci ").append(callerinfo).toString());
        if (obj instanceof CallInfoCookie)
        {
            log("callerinfo query complete, cookie is CallInfo");
            CallInfoCookie callinfocookie = (CallInfoCookie)obj;
            int j = callinfocookie.bannerNumber;
            Call call = callinfocookie.call;
            int k = call.getPhone().getPhoneType();
            Connection connection;
            if (k == 2)
            {
                connection = call.getLatestConnection();
            } else
            {
                if (k != 1 && k != 3)
                    throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(k).toString());
                connection = call.getEarliestConnection();
            }
            int l = PhoneConstants.PRESENTATION_ALLOWED;
            if (connection != null)
                l = connection.getNumberPresentation();
            log((new StringBuilder()).append("- onQueryComplete: presentation=").append(l).append(", contactExists=").append(callerinfo.contactExists).toString());
            if (j == 0)
            {
                log("banner number is PRIMARY_CALL_BANNER");
                PhoneUtils.CallerInfoToken callerinfotoken2 = PhoneUtils.startGetCallerInfo(getContext(), connection, this, null);
                if (callerinfo.contactExists)
                    updateDisplayForPerson(callerinfo, PhoneConstants.PRESENTATION_ALLOWED, false, call, connection);
                else
                    updateDisplayForPerson(callerinfotoken2.currentInfo, l, false, call, connection);
                updatePhotoForCallState(call, mPhoto);
            } else
            {
                if (1 == j)
                {
                    log("banner number is SECONDARY_CALL_BANNER");
                    PhoneUtils.CallerInfoToken callerinfotoken1 = PhoneUtils.startGetCallerInfo(getContext(), call, this, mSecondaryCallName);
                    mSecondaryCallName.setText(PhoneUtils.getCompactNameFromCallerInfo(callerinfotoken1.currentInfo, getContext()));
                    updateDisplayForPerson(callerinfotoken1.currentInfo, l, false, call, connection, mSecondaryCallName, true, null, null, mSecondaryCallPhoto);
                    return;
                }
                if (2 == j)
                {
                    PhoneUtils.CallerInfoToken callerinfotoken = PhoneUtils.startGetCallerInfo(getContext(), call, this, m2ndHoldName);
                    m2ndHoldName.setText(PhoneUtils.getCompactNameFromCallerInfo(callerinfotoken.currentInfo, getContext()));
                    updateDisplayForPerson(callerinfotoken.currentInfo, l, false, call, connection, m2ndHoldName, true, null, null, mPhotoHoldPre);
                    return;
                }
            }
        } else
        {
            if (obj instanceof TextView)
            {
                log("callerinfo query complete, updating ui from ongoing or onhold");
                ((TextView)obj).setText(PhoneUtils.getCompactNameFromCallerInfo(callerinfo, mContext));
                return;
            }
            if (obj instanceof InCallUiState.FakeCall)
            {
                log("callerinfo query complete, updating fake call ui!");
                if (callerinfo != null)
                {
                    log((new StringBuilder()).append("ci.name = ").append(callerinfo.name).toString());
                    log((new StringBuilder()).append("ci.phoneNumber = ").append(callerinfo.phoneNumber).toString());
                    if (!TextUtils.isEmpty(callerinfo.name))
                    {
                        mName.setText(callerinfo.name);
                        return;
                    }
                }
            }
        }
    }

    public void onTickForCallTimeElapsed(long l)
    {
        updateElapsedTimeWidget(l);
    }

    void setInCallScreenInstance(InCallScreen incallscreen)
    {
        mInCallScreen = incallscreen;
    }

    void setIncomingCallWidgetHint(int i, int j)
    {
        mIncomingCallWidgetHintTextResId = i;
        mIncomingCallWidgetHintColorResId = j;
    }

    void setSecondaryCallClickable(boolean flag)
    {
        if (mSecondaryCallPhotoDimEffect != null)
            mSecondaryCallPhotoDimEffect.setEnabled(flag);
    }

    public void updateElapsedTimeWidget(long l)
    {
        log((new StringBuilder()).append("updateElapsedTimeWidget: ").append(l).toString());
        mCallStateLabel.setText(DateUtils.formatElapsedTime(l));
    }

    void updateElapsedTimeWidget(Call call)
    {
        updateElapsedTimeWidget(CallTime.getCallDuration(call) / 1000L);
    }

    public void updateForLanguageChange()
    {
        mLocaleChanged = true;
        mLCforUserData = true;
        mLCforUserDataHoldCall = true;
        sLCforUserDataSecondHoldCall = true;
    }

    void updateState(CallManager callmanager)
    {
        log((new StringBuilder()).append("updateState(").append(callmanager).append(")...").toString());
        PhoneUtils.dumpCallManager();
        log((new StringBuilder()).append("updateState: current active call is : ").append(callmanager.getActiveFgCall().getConnections()).toString());
        com.android.internal.telephony.PhoneConstants.State state = callmanager.getState();
        Call call = callmanager.getFirstActiveRingingCall();
        Call call1 = callmanager.getActiveFgCall();
        Call call2 = callmanager.getFirstActiveBgCall();
        if (!PhoneUtils.isLandscape(getContext()))
            updateCallInfoLayout(state);
        if (call.getState() == com.android.internal.telephony.Call.State.IDLE || call1.getState().isDialing() && (!DualTalkUtils.isSupportDualTalk() || !mDualTalk.isRingingWhenOutgoing()))
        {
            if (call1.getState() == com.android.internal.telephony.Call.State.IDLE && call2.getState() == com.android.internal.telephony.Call.State.IDLE)
            {
                if (mApplication.inCallUiState.showAlreadyDisconnectedState)
                    updateAlreadyDisconnected(callmanager);
                else
                    updateNoCall(callmanager);
            } else
            {
                updateForegroundCall(callmanager);
            }
        } else
        {
            boolean flag;
            if ((call1.getState() == com.android.internal.telephony.Call.State.ACTIVE || call1.getState() == com.android.internal.telephony.Call.State.DISCONNECTING || call1.getState() == com.android.internal.telephony.Call.State.DISCONNECTED || call2.getState() == com.android.internal.telephony.Call.State.HOLDING) && !call.getState().isAlive())
                flag = true;
            else
                flag = false;
            if (flag)
            {
                updateForegroundCall(callmanager);
                return;
            }
            updateRingingCall(callmanager);
        }
        ExtensionManager.getInstance().getCallCardExtension().updateState(callmanager);
    }








/*
    static boolean access$1202(CallCard callcard, boolean flag)
    {
        callcard.mNeedShowIncomingCall2Animator = flag;
        return flag;
    }

*/



/*
    static boolean access$202(CallCard callcard, boolean flag)
    {
        callcard.mShowSwtchCall2Animator = flag;
        return flag;
    }

*/







/*
    static int access$702(CallCard callcard, int i)
    {
        callcard.mShowAnimator2End = i;
        return i;
    }

*/


/*
    static int access$708(CallCard callcard)
    {
        int i = callcard.mShowAnimator2End;
        callcard.mShowAnimator2End = i + 1;
        return i;
    }

*/


}
