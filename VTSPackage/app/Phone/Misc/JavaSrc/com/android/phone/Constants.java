// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;


public class Constants
{
    public static final class CallStatusCode extends Enum
    {

        private static final CallStatusCode $VALUES[];
        public static final CallStatusCode CALL_FAILED;
        public static final CallStatusCode CDMA_CALL_LOST;
        public static final CallStatusCode DIALED_MMI;
        public static final CallStatusCode DROP_VOICECALL;
        public static final CallStatusCode EMERGENCY_ONLY;
        public static final CallStatusCode EXITED_ECM;
        public static final CallStatusCode FDN_BLOCKED;
        public static final CallStatusCode NO_PHONE_NUMBER_SUPPLIED;
        public static final CallStatusCode OUT_OF_3G_FAILED;
        public static final CallStatusCode OUT_OF_SERVICE;
        public static final CallStatusCode POWER_OFF;
        public static final CallStatusCode SUCCESS;
        public static final CallStatusCode VOICEMAIL_NUMBER_MISSING;

        public static CallStatusCode valueOf(String s)
        {
            return (CallStatusCode)Enum.valueOf(com/android/phone/Constants$CallStatusCode, s);
        }

        public static CallStatusCode[] values()
        {
            return (CallStatusCode[])$VALUES.clone();
        }

        static 
        {
            SUCCESS = new CallStatusCode("SUCCESS", 0);
            POWER_OFF = new CallStatusCode("POWER_OFF", 1);
            EMERGENCY_ONLY = new CallStatusCode("EMERGENCY_ONLY", 2);
            OUT_OF_SERVICE = new CallStatusCode("OUT_OF_SERVICE", 3);
            NO_PHONE_NUMBER_SUPPLIED = new CallStatusCode("NO_PHONE_NUMBER_SUPPLIED", 4);
            DIALED_MMI = new CallStatusCode("DIALED_MMI", 5);
            CALL_FAILED = new CallStatusCode("CALL_FAILED", 6);
            VOICEMAIL_NUMBER_MISSING = new CallStatusCode("VOICEMAIL_NUMBER_MISSING", 7);
            CDMA_CALL_LOST = new CallStatusCode("CDMA_CALL_LOST", 8);
            EXITED_ECM = new CallStatusCode("EXITED_ECM", 9);
            OUT_OF_3G_FAILED = new CallStatusCode("OUT_OF_3G_FAILED", 10);
            FDN_BLOCKED = new CallStatusCode("FDN_BLOCKED", 11);
            DROP_VOICECALL = new CallStatusCode("DROP_VOICECALL", 12);
            CallStatusCode acallstatuscode[] = new CallStatusCode[13];
            acallstatuscode[0] = SUCCESS;
            acallstatuscode[1] = POWER_OFF;
            acallstatuscode[2] = EMERGENCY_ONLY;
            acallstatuscode[3] = OUT_OF_SERVICE;
            acallstatuscode[4] = NO_PHONE_NUMBER_SUPPLIED;
            acallstatuscode[5] = DIALED_MMI;
            acallstatuscode[6] = CALL_FAILED;
            acallstatuscode[7] = VOICEMAIL_NUMBER_MISSING;
            acallstatuscode[8] = CDMA_CALL_LOST;
            acallstatuscode[9] = EXITED_ECM;
            acallstatuscode[10] = OUT_OF_3G_FAILED;
            acallstatuscode[11] = FDN_BLOCKED;
            acallstatuscode[12] = DROP_VOICECALL;
            $VALUES = acallstatuscode;
        }

        private CallStatusCode(String s, int i)
        {
            super(s, i);
        }
    }

    public static final class VTScreenMode extends Enum
    {

        private static final VTScreenMode $VALUES[];
        public static final VTScreenMode VT_SCREEN_CLOSE;
        public static final VTScreenMode VT_SCREEN_OPEN;
        public static final VTScreenMode VT_SCREEN_WAITING;

        public static VTScreenMode valueOf(String s)
        {
            return (VTScreenMode)Enum.valueOf(com/android/phone/Constants$VTScreenMode, s);
        }

        public static VTScreenMode[] values()
        {
            return (VTScreenMode[])$VALUES.clone();
        }

        static 
        {
            VT_SCREEN_CLOSE = new VTScreenMode("VT_SCREEN_CLOSE", 0);
            VT_SCREEN_OPEN = new VTScreenMode("VT_SCREEN_OPEN", 1);
            VT_SCREEN_WAITING = new VTScreenMode("VT_SCREEN_WAITING", 2);
            VTScreenMode avtscreenmode[] = new VTScreenMode[3];
            avtscreenmode[0] = VT_SCREEN_CLOSE;
            avtscreenmode[1] = VT_SCREEN_OPEN;
            avtscreenmode[2] = VT_SCREEN_WAITING;
            $VALUES = avtscreenmode;
        }

        private VTScreenMode(String s, int i)
        {
            super(s, i);
        }
    }


    public static final String CALL_SETTING_CLASS_NAME = "com.mediatek.settings.CallSettings";
    public static final int CALL_STATUS_DIALED = 0;
    public static final int CALL_STATUS_DIALED_MMI = 1;
    public static final int CALL_STATUS_DROP_VOICECALL = 3;
    public static final int CALL_STATUS_FAILED = 2;
    public static final String EXTRA_ACTUAL_NUMBER_TO_DIAL = "android.phone.extra.ACTUAL_NUMBER_TO_DIAL";
    public static final String EXTRA_FOLLOW_SIM_MANAGEMENT = "follow_sim_management";
    public static final String EXTRA_INTERNATIONAL_DIAL_OPTION = "com.android.phone.extra.international";
    public static final String EXTRA_IS_FORBIDE_DIALOG = "com.android.phone.extra.forbid_dialog";
    public static final String EXTRA_IS_IP_DIAL = "com.android.phone.extra.ip";
    public static final String EXTRA_IS_NOTIFICATION = "com.android.phone.extra.notification";
    public static final String EXTRA_IS_VIDEO_CALL = "com.android.phone.extra.video";
    public static final String EXTRA_ORIGINAL_SIM_ID = "com.android.phone.extra.original";
    public static final String EXTRA_SLOT_ID = "com.android.phone.extra.slot";
    public static final int INTERNATIONAL_DIAL_OPTION_IGNORE = 2;
    public static final int INTERNATIONAL_DIAL_OPTION_NORMAL = 0;
    public static final int INTERNATIONAL_DIAL_OPTION_WITH_COUNTRY_CODE = 1;
    public static final String IP_PREFIX_SETTING_CLASS_NAME = "com.mediatek.settings.IpPrefixPreference";
    public static final String MODEM_3G_CAPABILITY_SWITCH_SETTING_CLASS_NAME = "com.mediatek.settings.Modem3GCapabilitySwitch";
    public static final String OUTGOING_CALL_BROADCASTER = "com.android.phone.OutgoingCallBroadcaster";
    public static final String OUTGOING_CALL_RECEIVER = "com.mediatek.phone.OutgoingCallReceiver";
    public static final String PHONE_PACKAGE = "com.android.phone";
    public static final String PHONE_PREFERENCE_NAME = "com.android.phone_preferences";
    public static final int PHONE_RECORDING_TYPE_NOT_RECORDING = 0;
    public static final int PHONE_RECORDING_TYPE_ONLY_PEER_VIDEO = 3;
    public static final int PHONE_RECORDING_TYPE_ONLY_VOICE = 2;
    public static final int PHONE_RECORDING_TYPE_VOICE_AND_PEER_VIDEO = 1;
    public static final int PHONE_RECORDING_VIDEO_CALL_CUSTOM_VALUE = 1;
    public static final int PHONE_RECORDING_VOICE_CALL_CUSTOM_VALUE = 0;
    public static final long PHONE_RECORD_LOW_STORAGE_THRESHOLD = 0x200000L;
    public static final String SCHEME_SIP = "sip";
    public static final String SCHEME_SMS = "sms";
    public static final String SCHEME_SMSTO = "smsto";
    public static final String SCHEME_TEL = "tel";
    public static final String SCHEME_VOICEMAIL = "voicemail";
    public static final String SETTING_SUB_TITLE_NAME = "sub_title_name";
    public static final String SIP_CALL_SETTING_CLASS_NAME = "com.mediatek.settings.SipCallSetting";
    public static final String STORAGE_SETTING_INTENT_NAME = "android.settings.INTERNAL_STORAGE_SETTINGS";
    public static final int STORAGE_TYPE_PHONE_STORAGE = 0;
    public static final int STORAGE_TYPE_SD_CARD = 1;
    public static final String VOICEMAIL_URI = "voicemail:";
    public static final String VOICE_MAIL_SETTINGS_CLASS_NAME = "com.mediatek.settings.VoiceMailSetting";

}
