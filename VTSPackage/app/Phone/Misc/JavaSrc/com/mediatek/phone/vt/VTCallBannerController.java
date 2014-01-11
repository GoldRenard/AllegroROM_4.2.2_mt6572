// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.vt;

import android.content.ContentUris;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.text.format.DateUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.ViewGroup;
import android.widget.TextView;
import com.android.internal.telephony.*;
import com.android.phone.*;
import com.mediatek.common.MediatekClassFactory;
import com.mediatek.common.telephony.IServiceStateExt;
import com.mediatek.phone.HyphonManager;
import com.mediatek.phone.ext.ExtensionManager;
import com.mediatek.phone.ext.VTCallBannerControllerExtension;
import com.mediatek.phone.gemini.GeminiUtils;

// Referenced classes of package com.mediatek.phone.vt:
//            VTCallBanner, VTCallUtils

public class VTCallBannerController
    implements com.android.internal.telephony.CallerInfoAsyncQuery.OnQueryCompleteListener, com.android.phone.ContactsAsyncHelper.OnImageLoadCompleteListener
{

    private static final boolean DBG = true;
    private static final String LOG_TAG = "VTCallBannerController";
    private static final int SECOND_TO_MILLISECOND = 1000;
    private static final int TOKEN_LOAD_PHOTO;
    protected PhoneGlobals mApplication;
    protected VTCallBanner mCallBanner;
    private int mCallBannerSidePadding;
    private int mCallBannerTopBottomPadding;
    protected Context mContext;
    protected float mDensity;
    private boolean mNeedClearUserData;
    protected com.android.phone.ContactsAsyncHelper.ImageTracker mPhotoTracker;
    private IServiceStateExt mServiceStateExt;
    private int mSimBorderMap[] = {
        0x7f0200a2, 0x7f0200a5, 0x7f0200a3, 0x7f0200a6
    };
    private int mSimColorMap[] = {
        0x7f02008e, 0x7f02008f, 0x7f020090, 0x7f020091
    };
    private int mSimIndicatorLeftPadding;
    private int mSimIndicatorRightPadding;
    protected android.provider.Telephony.SIMInfo mSimInfo;
    private int mTextColorCallTypeSip;

    public VTCallBannerController(VTCallBanner vtcallbanner, Context context)
    {
        mCallBanner = vtcallbanner;
        mContext = context;
        mApplication = PhoneGlobals.getInstance();
        mDensity = context.getResources().getDisplayMetrics().density;
        mCallBannerSidePadding = context.getResources().getDimensionPixelSize(0x7f0c0006);
        mCallBannerTopBottomPadding = context.getResources().getDimensionPixelSize(0x7f0c0007);
        mSimIndicatorLeftPadding = context.getResources().getDimensionPixelSize(0x7f0c0022);
        mSimIndicatorRightPadding = context.getResources().getDimensionPixelSize(0x7f0c0023);
        mTextColorCallTypeSip = context.getResources().getColor(0x7f090000);
        mPhotoTracker = new com.android.phone.ContactsAsyncHelper.ImageTracker();
        ExtensionManager.getInstance().getVTCallBannerControllerExtension().initialize(context, vtcallbanner);
        mServiceStateExt = (IServiceStateExt)MediatekClassFactory.createInstance(com/mediatek/common/telephony/IServiceStateExt, new Object[] {
            context
        });
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
            static class _cls1
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

            switch (_cls1..SwitchMap.com.android.internal.telephony.Connection.DisconnectCause[disconnectcause.ordinal()])
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
        return mContext.getString(i);
    }

    private String getPresentationString(int i)
    {
        String s = mContext.getString(0x7f0d0176);
        if (i == PhoneConstants.PRESENTATION_RESTRICTED)
            s = mContext.getString(0x7f0d0177);
        else
        if (i == PhoneConstants.PRESENTATION_PAYPHONE)
            return mContext.getString(0x7f0d0178);
        return s;
    }

    private static void log(String s)
    {
        Log.d("VTCallBannerController", s);
    }

    private void updateCallBanner()
    {
        if (mSimInfo != null && mSimColorMap != null && mSimInfo.mColor >= 0 && mSimInfo.mColor < mSimColorMap.length)
        {
            mCallBanner.mVtCallStateAndSimIndicate.setBackgroundResource(mSimColorMap[mSimInfo.mColor]);
            if (mCallBanner.mSimIndicator != null)
                mCallBanner.mSimIndicator.setBackgroundResource(mSimBorderMap[mSimInfo.mColor]);
        } else
        {
            log("mSimInfo is null or mSimInfo.mColor invalid.");
            mCallBanner.mVtCallStateAndSimIndicate.setBackgroundResource(0x7f020091);
            if (mCallBanner.mSimIndicator != null)
                mCallBanner.mSimIndicator.setBackgroundResource(0x7f0200a6);
        }
        mCallBanner.mMainCallBanner.setPadding(mCallBannerSidePadding, mCallBannerTopBottomPadding, mCallBannerSidePadding, mCallBannerTopBottomPadding);
        if (mCallBanner.mSimIndicator != null)
            mCallBanner.mSimIndicator.setPadding(mSimIndicatorLeftPadding, 0, mSimIndicatorRightPadding, 0);
    }

    private void updateCallStateWidgets(Call call)
    {
        log((new StringBuilder()).append("updateCallStateWidgets(call ").append(call).append(")...").toString());
        com.android.internal.telephony.Call.State state = call.getState();
        Phone phone = call.getPhone();
        int i = phone.getPhoneType();
        int j = _cls1..SwitchMap.com.android.internal.telephony.Call.State[state.ordinal()];
        String s = null;
        switch (j)
        {
        case 9: // '\t'
            s = getCallFailedString(call);
            break;

        case 8: // '\b'
            s = mContext.getString(0x7f0d02c0);
            break;

        case 4: // '\004'
        case 5: // '\005'
            s = mContext.getString(0x7f0d02ba);
            break;

        case 3: // '\003'
            s = mContext.getString(0x7f0d02bf);
            break;

        case 2: // '\002'
            Connection connection = call.getLatestConnection();
            s = null;
            if (connection != null)
            {
                VTCallUtils.VTTimingMode vttimingmode = VTCallUtils.VTTimingMode.VT_TIMING_DEFAULT;
                VTCallUtils.VTTimingMode vttimingmode1 = VTCallUtils.checkVTTimingMode(call.getLatestConnection().getAddress());
                s = null;
                if (vttimingmode == vttimingmode1)
                    s = DateUtils.formatElapsedTime(CallTime.getCallDuration(call) / 1000L);
            }
            break;

        case 1: // '\001'
            Log.w("VTCallBannerController", "displayMainCallStatus: IDLE call in the main call card!");
            s = null;
            break;

        default:
            Log.wtf("VTCallBannerController", (new StringBuilder()).append("updateCallStateWidgets: unexpected call state: ").append(state).toString());
            break;

        case 6: // '\006'
        case 7: // '\007'
            break;
        }
        if (i == 2)
            if (state == com.android.internal.telephony.Call.State.ACTIVE && mApplication.cdmaPhoneCallState.IsThreeWayCallOrigStateDialing())
                s = mContext.getString(0x7f0d02ba);
            else
            if (PhoneGlobals.getInstance().notifier.getIsCdmaRedialCall())
                s = mContext.getString(0x7f0d02bb);
        if (PhoneUtils.isPhoneInEcm(phone))
            s = PhoneUtils.getECMCardTitle(mContext, phone);
        log((new StringBuilder()).append("==> callStateLabel: '").append(s).append("'").toString());
        mCallBanner.mCallStateLabel.setVisibility(0);
        mCallBanner.mCallStateLabel.setText(s);
        ExtensionManager.getInstance().getVTCallBannerControllerExtension().updateCallStateWidgets(call);
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
            mCallBanner.mCallTypeLabel.setVisibility(0);
            mCallBanner.mCallTypeLabel.setText(0x7f0d02e1);
            mCallBanner.mCallTypeLabel.setTextColor(mTextColorCallTypeSip);
            return;
        } else
        {
            mCallBanner.mCallTypeLabel.setVisibility(8);
            return;
        }
    }

    private void updateDisplayForPerson(CallerInfo callerinfo, int i, boolean flag, Call call, Connection connection)
    {
        log((new StringBuilder()).append("updateDisplayForPerson(").append(callerinfo).append(")\npresentation:").append(i).append(" isTemporary:").append(flag).toString());
        mPhotoTracker.setPhotoRequest(callerinfo);
        mPhotoTracker.setPhotoState(-1);
        String s = null;
        String s1 = null;
        String s2 = null;
        if (callerinfo != null)
        {
            String s3 = callerinfo.phoneNumber;
            if (s3 != null && s3.startsWith("sip:"))
                s3 = s3.substring("sip:".length());
            String s4 = HyphonManager.getInstance().formatNumber(s3);
            String s5;
            if (TextUtils.isEmpty(callerinfo.name))
            {
                if (TextUtils.isEmpty(s4))
                {
                    s5 = getPresentationString(i);
                    log((new StringBuilder()).append("  ==> no name *or* number! displayName = ").append(s5).toString());
                } else
                if (i != PhoneConstants.PRESENTATION_ALLOWED)
                {
                    s5 = getPresentationString(i);
                    log((new StringBuilder()).append("  ==> presentation not allowed! displayName = ").append(s5).toString());
                    s = null;
                    s1 = null;
                    s2 = null;
                } else
                if (!TextUtils.isEmpty(callerinfo.cnapName))
                {
                    s5 = callerinfo.cnapName;
                    callerinfo.name = callerinfo.cnapName;
                    s = s4;
                    log((new StringBuilder()).append("  ==> cnapName available: displayName '").append(s5).append("', displayNumber '").append(s).append("'").toString());
                    s1 = null;
                    s2 = null;
                } else
                {
                    s5 = s4;
                    s2 = null;
                    if (connection != null)
                        s2 = callerinfo.geoDescription;
                    log((new StringBuilder()).append("  ==>  no name; falling back to number: displayName '").append(s5).append("', displayNumber '").append(null).append("'").toString());
                    s = null;
                    s1 = null;
                }
            } else
            if (i != PhoneConstants.PRESENTATION_ALLOWED)
            {
                s5 = getPresentationString(i);
                log((new StringBuilder()).append("  ==> valid name, but presentation not allowed! displayName = ").append(s5).toString());
                s = null;
                s1 = null;
                s2 = null;
            } else
            {
                s5 = callerinfo.name;
                s = s4;
                s1 = callerinfo.phoneLabel;
                log((new StringBuilder()).append("  ==>  name is present in CallerInfo: displayName '").append(s5).append("', displayNumber '").append(s).append("'").toString());
                s2 = callerinfo.geoDescription;
                log((new StringBuilder()).append("  ==>  name is present in CallerInfo: numberGeooDescription '").append(s2).append("'").toString());
            }
            android.net.Uri uri = ContentUris.withAppendedId(android.provider.ContactsContract.Contacts.CONTENT_URI, callerinfo.person_id);
            log((new StringBuilder()).append("- got personUri: '").append(uri).append("', based on info.person_id: ").append(callerinfo.person_id).toString());
            if (call.isGeneric())
                mCallBanner.mName.setText(0x7f0d02c1);
            else
                mCallBanner.mName.setText(s5);
            mCallBanner.mName.setVisibility(0);
            if (s != null && !call.isGeneric())
            {
                mCallBanner.mPhoneNumber.setText(s);
                mCallBanner.mPhoneNumber.setVisibility(0);
            } else
            {
                mCallBanner.mPhoneNumber.setVisibility(8);
            }
            if (s1 != null && !call.isGeneric())
            {
                mCallBanner.mLabel.setText(s1);
                mCallBanner.mLabel.setVisibility(0);
            } else
            {
                mCallBanner.mLabel.setVisibility(8);
            }
            if (TextUtils.isEmpty(s2))
            {
                mCallBanner.mPhoneNumberGeoDescription.setVisibility(4);
            } else
            {
                mCallBanner.mPhoneNumberGeoDescription.setText(s2);
                mCallBanner.mPhoneNumberGeoDescription.setVisibility(0);
            }
            updateCallTypeLabel(call);
            ExtensionManager.getInstance().getVTCallBannerControllerExtension().updateDisplayForPerson(callerinfo, i, flag, call, connection);
            return;
        } else
        {
            log("- info is null, just return ");
            return;
        }
    }

    public void clearCallBannerInfo()
    {
        mCallBanner.mName.setText("");
        mCallBanner.mPhoneNumber.setText("");
        mCallBanner.mLabel.setText("");
        mCallBanner.mCallTypeLabel.setText("");
        mCallBanner.mOperatorName.setText("");
        mCallBanner.mSimIndicator.setText("");
        mCallBanner.mSimIndicator.setVisibility(4);
        mCallBanner.mCallStateLabel.setText("");
        mCallBanner.mPhoneNumberGeoDescription.setText("");
    }

    public void onImageLoadComplete(int i, Drawable drawable, Bitmap bitmap, Object obj)
    {
        log("onImageLoadComplete enter!");
        if (obj == null)
            return;
        CallerInfo callerinfo;
        if (obj instanceof Call)
        {
            log((new StringBuilder()).append("onImageLoadComplete = ").append(obj).toString());
            Connection connection = ((Call)obj).getEarliestConnection();
            if (connection != null)
            {
                Object obj1 = connection.getUserData();
                if (obj1 instanceof CallerInfo)
                    callerinfo = (CallerInfo)obj1;
                else
                if (obj1 instanceof com.android.phone.PhoneUtils.CallerInfoToken)
                {
                    callerinfo = ((com.android.phone.PhoneUtils.CallerInfoToken)obj1).currentInfo;
                } else
                {
                    Log.w("VTCallBannerController", "CallerInfo isn't available while Call object is available.");
                    callerinfo = null;
                }
            } else
            {
                log("onImageLoadComplete no connection found!");
                callerinfo = null;
            }
        } else
        {
            log("onImageLoadComplete: the cookie is unkown!");
            callerinfo = null;
        }
        if (callerinfo != null)
        {
            callerinfo.cachedPhoto = drawable;
            callerinfo.cachedPhotoIcon = bitmap;
            callerinfo.isCachedPhotoCurrent = true;
            return;
        } else
        {
            log("onImageLoadComplete callerInfo == null!");
            return;
        }
    }

    public void onQueryComplete(int i, Object obj, CallerInfo callerinfo)
    {
        log((new StringBuilder()).append("onQueryComplete: token ").append(i).append(", cookie ").append(obj).append(", ci ").append(callerinfo).toString());
        if (obj instanceof Call)
        {
            log("callerinfo query complete, updating ui from displayMainCallStatus()");
            Call call = (Call)obj;
            int j = call.getPhone().getPhoneType();
            Connection connection;
            if (j == 2)
            {
                connection = call.getLatestConnection();
            } else
            {
                if (j != 1 && j != 3)
                    throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(j).toString());
                connection = call.getEarliestConnection();
            }
            com.android.phone.PhoneUtils.CallerInfoToken callerinfotoken = PhoneUtils.startGetCallerInfo(mContext, connection, this, null);
            int k = PhoneConstants.PRESENTATION_ALLOWED;
            if (connection != null)
                k = connection.getNumberPresentation();
            log((new StringBuilder()).append("- onQueryComplete: presentation=").append(k).append(", contactExists=").append(callerinfo.contactExists).toString());
            android.net.Uri uri = ContentUris.withAppendedId(android.provider.ContactsContract.Contacts.CONTENT_URI, callerinfo.person_id);
            ContactsAsyncHelper.startObtainPhotoAsync(0, mApplication, uri, this, call);
            if (callerinfo.contactExists)
            {
                updateDisplayForPerson(callerinfo, PhoneConstants.PRESENTATION_ALLOWED, false, call, connection);
            } else
            {
                updateDisplayForPerson(callerinfotoken.currentInfo, k, false, call, connection);
                return;
            }
        } else
        if (obj instanceof TextView)
        {
            log("callerinfo query complete, updating ui from ongoing or onhold");
            ((TextView)obj).setText(PhoneUtils.getCompactNameFromCallerInfo(callerinfo, mContext));
            return;
        }
    }

    public void setNeedClearUserData(boolean flag)
    {
        mNeedClearUserData = flag;
    }

    void updateElapsedTimeWidget(long l)
    {
        log((new StringBuilder()).append("updateElapsedTimeWidget: ").append(l).toString());
        if (l < 0L)
        {
            mCallBanner.mCallStateLabel.setText("");
            return;
        } else
        {
            String s = DateUtils.formatElapsedTime(l);
            log((new StringBuilder()).append("updateElapsedTimeWidget: ").append(l).toString());
            mCallBanner.mCallStateLabel.setText(s);
            return;
        }
    }

    void updateState(Call call)
    {
        log((new StringBuilder()).append("updateState(").append(call).append(")...").toString());
        if (!ExtensionManager.getInstance().getVTCallBannerControllerExtension().updateState(call))
        {
            if (GeminiUtils.isGeminiSupport())
            {
                mSimInfo = PhoneUtils.getSimInfoByCall(call);
                if (mSimInfo != null)
                {
                    mCallBanner.setVisibility(0);
                    if (!TextUtils.isEmpty(mSimInfo.mDisplayName))
                    {
                        mCallBanner.mSimIndicator.setText(mSimInfo.mDisplayName);
                        mCallBanner.mSimIndicator.setVisibility(0);
                    } else
                    {
                        mCallBanner.mSimIndicator.setVisibility(4);
                    }
                } else
                {
                    mCallBanner.setVisibility(4);
                    return;
                }
            } else
            {
                mCallBanner.mSimIndicator.setVisibility(4);
            }
            updateCallBanner();
            String s = GeminiUtils.getVTNetworkOperatorName(call);
            if (s != null)
            {
                mCallBanner.mOperatorName.setText(s);
                mCallBanner.mOperatorName.setVisibility(0);
            }
            if (call != null)
            {
                updateCallStateWidgets(call);
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
                    log("updateState: connection is null, using default values.");
                    updateDisplayForPerson(PhoneUtils.getCallerInfo(mContext, null), PhoneConstants.PRESENTATION_ALLOWED, false, call, connection);
                    return;
                }
                log((new StringBuilder()).append("  - CONN: ").append(connection).append(", state = ").append(connection.getState()).toString());
                int j = connection.getNumberPresentation();
                Object obj = connection.getUserData();
                boolean flag;
                if (mNeedClearUserData)
                {
                    log("language changed to clear userdata");
                    connection.clearUserData();
                    mNeedClearUserData = false;
                    flag = true;
                } else
                if (obj instanceof com.android.phone.PhoneUtils.CallerInfoToken)
                    flag = mPhotoTracker.isDifferentImageRequest(((com.android.phone.PhoneUtils.CallerInfoToken)obj).currentInfo);
                else
                    flag = mPhotoTracker.isDifferentImageRequest(connection);
                if (flag)
                {
                    log("- updateState: starting CallerInfo query...");
                    com.android.phone.PhoneUtils.CallerInfoToken callerinfotoken = PhoneUtils.startGetCallerInfo(mContext, connection, this, call);
                    CallerInfo callerinfo2 = callerinfotoken.currentInfo;
                    boolean flag1;
                    if (!callerinfotoken.isFinal)
                        flag1 = true;
                    else
                        flag1 = false;
                    updateDisplayForPerson(callerinfo2, j, flag1, call, connection);
                    return;
                }
                log("- updateState: using data we already have...");
                if (obj instanceof CallerInfo)
                {
                    CallerInfo callerinfo1 = (CallerInfo)obj;
                    callerinfo1.cnapName = connection.getCnapName();
                    callerinfo1.numberPresentation = connection.getNumberPresentation();
                    callerinfo1.namePresentation = connection.getCnapNamePresentation();
                    log((new StringBuilder()).append("- updateState: CNAP data from Connection: CNAP name=").append(callerinfo1.cnapName).append(", Number/Name Presentation=").append(callerinfo1.numberPresentation).toString());
                    log((new StringBuilder()).append("   ==> Got CallerInfo; updating display: ci = ").append(callerinfo1).toString());
                    updateDisplayForPerson(callerinfo1, j, false, call, connection);
                    return;
                }
                if (obj instanceof com.android.phone.PhoneUtils.CallerInfoToken)
                {
                    CallerInfo callerinfo = ((com.android.phone.PhoneUtils.CallerInfoToken)obj).currentInfo;
                    log((new StringBuilder()).append("- updateState: CNAP data from Connection: CNAP name=").append(callerinfo.cnapName).append(", Number/Name Presentation=").append(callerinfo.numberPresentation).toString());
                    log((new StringBuilder()).append("   ==> Got CallerInfoToken; updating display: ci = ").append(callerinfo).toString());
                    updateDisplayForPerson(callerinfo, j, true, call, connection);
                    return;
                } else
                {
                    Log.w("VTCallBannerController", (new StringBuilder()).append("updateState: runQuery was false, but we didn't have a cached CallerInfo object!  o = ").append(obj).toString());
                    return;
                }
            }
        }
    }
}
