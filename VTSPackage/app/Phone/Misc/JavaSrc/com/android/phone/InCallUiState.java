// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import com.android.internal.telephony.Connection;

// Referenced classes of package com.android.phone:
//            PhoneUtils

public class InCallUiState
{
    public static class FakeCall
    {

        com.android.internal.telephony.Connection.DisconnectCause cause;
        Connection conn;
        String number;
        int phoneType;
        int slotId;

    }

    public static final class InCallScreenMode extends Enum
    {

        private static final InCallScreenMode $VALUES[];
        public static final InCallScreenMode CALL_ENDED;
        public static final InCallScreenMode MANAGE_CONFERENCE;
        public static final InCallScreenMode NORMAL;
        public static final InCallScreenMode OTA_ENDED;
        public static final InCallScreenMode OTA_NORMAL;
        public static final InCallScreenMode UNDEFINED;

        public static InCallScreenMode valueOf(String s)
        {
            return (InCallScreenMode)Enum.valueOf(com/android/phone/InCallUiState$InCallScreenMode, s);
        }

        public static InCallScreenMode[] values()
        {
            return (InCallScreenMode[])$VALUES.clone();
        }

        static 
        {
            NORMAL = new InCallScreenMode("NORMAL", 0);
            MANAGE_CONFERENCE = new InCallScreenMode("MANAGE_CONFERENCE", 1);
            CALL_ENDED = new InCallScreenMode("CALL_ENDED", 2);
            OTA_NORMAL = new InCallScreenMode("OTA_NORMAL", 3);
            OTA_ENDED = new InCallScreenMode("OTA_ENDED", 4);
            UNDEFINED = new InCallScreenMode("UNDEFINED", 5);
            InCallScreenMode aincallscreenmode[] = new InCallScreenMode[6];
            aincallscreenmode[0] = NORMAL;
            aincallscreenmode[1] = MANAGE_CONFERENCE;
            aincallscreenmode[2] = CALL_ENDED;
            aincallscreenmode[3] = OTA_NORMAL;
            aincallscreenmode[4] = OTA_ENDED;
            aincallscreenmode[5] = UNDEFINED;
            $VALUES = aincallscreenmode;
        }

        private InCallScreenMode(String s, int i)
        {
            super(s, i);
        }
    }

    public static final class ProgressIndicationType extends Enum
    {

        private static final ProgressIndicationType $VALUES[];
        public static final ProgressIndicationType NONE;
        public static final ProgressIndicationType RETRYING;
        public static final ProgressIndicationType TURNING_ON_RADIO;

        public static ProgressIndicationType valueOf(String s)
        {
            return (ProgressIndicationType)Enum.valueOf(com/android/phone/InCallUiState$ProgressIndicationType, s);
        }

        public static ProgressIndicationType[] values()
        {
            return (ProgressIndicationType[])$VALUES.clone();
        }

        static 
        {
            NONE = new ProgressIndicationType("NONE", 0);
            TURNING_ON_RADIO = new ProgressIndicationType("TURNING_ON_RADIO", 1);
            RETRYING = new ProgressIndicationType("RETRYING", 2);
            ProgressIndicationType aprogressindicationtype[] = new ProgressIndicationType[3];
            aprogressindicationtype[0] = NONE;
            aprogressindicationtype[1] = TURNING_ON_RADIO;
            aprogressindicationtype[2] = RETRYING;
            $VALUES = aprogressindicationtype;
        }

        private ProgressIndicationType(String s, int i)
        {
            super(s, i);
        }
    }


    private static final boolean DBG = true;
    static final int INCALLSCREEN_NOT_EXIT_NORMAL = -1;
    static final int INCALLSCREEN_NOT_EXIT_NOT_FORGROUND = 0;
    static final int INCALLSCREEN_NOT_EXIT_NOT_INIT = 1;
    private static final String TAG = "InCallUiState";
    private static InCallUiState sInstance;
    static int sLastInCallScreenStatus;
    boolean delayFinished;
    String dialpadContextText;
    String dialpadDigits;
    InCallScreenMode inCallScreenMode;
    String latestActiveCallOrigin;
    long latestActiveCallOriginTimeStamp;
    FakeCall latestDisconnectCall;
    private Context mContext;
    InCallScreenMode mLastInCallScreenMode;
    private Message mMmiMsg;
    private Constants.CallStatusCode mPendingCallStatusCode;
    private int mSlot;
    private String mStrNumber;
    boolean needToShowCallLostDialog;
    private ProgressIndicationType progressIndication;
    String providerAddress;
    Uri providerGatewayUri;
    Drawable providerIcon;
    boolean providerInfoVisible;
    CharSequence providerLabel;
    boolean showAlreadyDisconnectedState;
    boolean showDialpad;

    private InCallUiState(Context context)
    {
        mSlot = -1;
        inCallScreenMode = InCallScreenMode.UNDEFINED;
        mLastInCallScreenMode = InCallScreenMode.UNDEFINED;
        mPendingCallStatusCode = Constants.CallStatusCode.SUCCESS;
        progressIndication = ProgressIndicationType.NONE;
        mMmiMsg = null;
        latestDisconnectCall = null;
        delayFinished = false;
        mContext = context;
    }

    static InCallUiState init(Context context)
    {
        com/android/phone/InCallUiState;
        JVM INSTR monitorenter ;
        if (sInstance != null)
            break MISSING_BLOCK_LABEL_29;
        sInstance = new InCallUiState(context);
_L1:
        InCallUiState incalluistate = sInstance;
        com/android/phone/InCallUiState;
        JVM INSTR monitorexit ;
        return incalluistate;
        Log.wtf("InCallUiState", (new StringBuilder()).append("init() called multiple times!  sInstance = ").append(sInstance).toString());
          goto _L1
        Exception exception;
        exception;
        com/android/phone/InCallUiState;
        JVM INSTR monitorexit ;
        throw exception;
    }

    static boolean isNormalInCallScreenState()
    {
        return sLastInCallScreenStatus == -1;
    }

    private static void log(String s)
    {
        Log.d("InCallUiState", s);
    }

    public void clearPendingCallStatusCode()
    {
        log("clearPendingCallStatusCode()...");
        mPendingCallStatusCode = Constants.CallStatusCode.SUCCESS;
    }

    public void clearProgressIndication()
    {
        progressIndication = ProgressIndicationType.NONE;
    }

    public void clearProviderInfo()
    {
        providerInfoVisible = false;
        providerLabel = null;
        providerIcon = null;
        providerGatewayUri = null;
        providerAddress = null;
    }

    public void clearState()
    {
        log("clearState()");
        showDialpad = false;
    }

    public void dumpState()
    {
        log("dumpState():");
        log((new StringBuilder()).append("  - showDialpad: ").append(showDialpad).toString());
        log((new StringBuilder()).append("    - dialpadContextText: ").append(dialpadContextText).toString());
        if (hasPendingCallStatusCode())
        {
            log("  - status indication is pending!");
            log((new StringBuilder()).append("    - pending call status code = ").append(mPendingCallStatusCode).toString());
        } else
        {
            log("  - pending call status code: none");
        }
        log((new StringBuilder()).append("  - progressIndication: ").append(progressIndication).toString());
        if (providerInfoVisible)
            log((new StringBuilder()).append("  - provider info VISIBLE: ").append(providerLabel).append(" / ").append(providerIcon).append(" / ").append(providerGatewayUri).append(" / ").append(providerAddress).toString());
        else
            log("  - provider info: none");
        log((new StringBuilder()).append("  - latestActiveCallOrigin: ").append(latestActiveCallOrigin).toString());
    }

    public String getNumber()
    {
        return mStrNumber;
    }

    public Constants.CallStatusCode getPendingCallStatusCode()
    {
        log((new StringBuilder()).append("getPendingCallStatusCode() ==> ").append(mPendingCallStatusCode).toString());
        return mPendingCallStatusCode;
    }

    Message getPendingUssdMessage()
    {
        return mMmiMsg;
    }

    public ProgressIndicationType getProgressIndication()
    {
        return progressIndication;
    }

    public int getSlot()
    {
        return mSlot;
    }

    boolean hasPendingCallEvents()
    {
        return false;
    }

    public boolean hasPendingCallStatusCode()
    {
        StringBuilder stringbuilder = (new StringBuilder()).append("hasPendingCallStatusCode() ==> ");
        boolean flag;
        if (mPendingCallStatusCode != Constants.CallStatusCode.SUCCESS)
            flag = true;
        else
            flag = false;
        log(stringbuilder.append(flag).toString());
        return mPendingCallStatusCode != Constants.CallStatusCode.SUCCESS;
    }

    public boolean isProgressIndicationActive()
    {
        return progressIndication != ProgressIndicationType.NONE;
    }

    public void setNumberSlot(int i, String s)
    {
        mSlot = i;
        mStrNumber = s;
    }

    public void setPendingCallStatusCode(Constants.CallStatusCode callstatuscode)
    {
        log((new StringBuilder()).append("setPendingCallStatusCode( ").append(callstatuscode).append(" )...").toString());
        if (mPendingCallStatusCode != Constants.CallStatusCode.SUCCESS)
            Log.w("InCallUiState", (new StringBuilder()).append("setPendingCallStatusCode: setting new code ").append(callstatuscode).append(", but a previous code ").append(mPendingCallStatusCode).append(" was already pending!").toString());
        mPendingCallStatusCode = callstatuscode;
    }

    void setPendingUssdMessage(Message message)
    {
        mMmiMsg = message;
    }

    public void setProgressIndication(ProgressIndicationType progressindicationtype)
    {
        progressIndication = progressindicationtype;
    }

    public void setProviderInfo(Intent intent)
    {
        providerLabel = PhoneUtils.getProviderLabel(mContext, intent);
        providerIcon = PhoneUtils.getProviderIcon(mContext, intent);
        providerGatewayUri = PhoneUtils.getProviderGatewayUri(intent);
        providerAddress = PhoneUtils.formatProviderUri(providerGatewayUri);
        providerInfoVisible = true;
        if (TextUtils.isEmpty(providerLabel) || providerIcon == null || providerGatewayUri == null || TextUtils.isEmpty(providerAddress))
            clearProviderInfo();
    }
}
