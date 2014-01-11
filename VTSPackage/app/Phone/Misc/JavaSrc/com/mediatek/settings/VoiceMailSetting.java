// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.*;
import android.content.*;
import android.content.pm.*;
import android.database.Cursor;
import android.os.*;
import android.preference.*;
import android.text.TextUtils;
import android.view.MenuItem;
import android.view.Window;
import android.widget.ListAdapter;
import com.android.internal.telephony.CallForwardInfo;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.phone.EditPhoneNumberPreference;
import com.android.phone.PhoneGlobals;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.mediatek.settings:
//            CallSettings

public class VoiceMailSetting extends PreferenceActivity
    implements android.content.DialogInterface.OnClickListener, android.preference.Preference.OnPreferenceChangeListener, com.android.phone.EditPhoneNumberPreference.OnDialogClosedListener, com.android.phone.EditPhoneNumberPreference.GetDefaultNumberListener
{
    private class CallFeaturesSettingBroadcastReceiver extends BroadcastReceiver
    {

        final VoiceMailSetting this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            if ((!s.equals("android.intent.action.AIRPLANE_MODE") || !intent.getBooleanExtra("state", false)) && (!s.equals("android.intent.action.DUAL_SIM_MODE") || intent.getIntExtra("mode", -1) != 0))
            {
                if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
                {
                    List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(context);
                    if (list.size() == 0)
                    {
                        Xlog.d("Settings/VoiceMailSetting", "Activity finished");
                        CallSettings.goUpToTopLevelSetting(VoiceMailSetting.this);
                        return;
                    }
                    if (CallSettings.isMultipleSim() && list.size() == 1 && ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot != mSimId)
                    {
                        Xlog.d("Settings/VoiceMailSetting", (new StringBuilder()).append("temp.size()=").append(list.size()).append("Activity finished").toString());
                        finish();
                        return;
                    }
                }
            } else
            {
                finish();
            }
        }

        private CallFeaturesSettingBroadcastReceiver()
        {
            this$0 = VoiceMailSetting.this;
            super();
        }

    }

    private class VoiceMailProvider
    {

        public Intent mIntent;
        public String mName;
        final VoiceMailSetting this$0;

        public VoiceMailProvider(String s, Intent intent)
        {
            this$0 = VoiceMailSetting.this;
            super();
            mName = s;
            mIntent = intent;
        }
    }

    private class VoiceMailProviderSettings
    {

        public CallForwardInfo mForwardingSettings[];
        public String mVoicemailNumber;
        final VoiceMailSetting this$0;

        private boolean forwardingSettingsEqual(CallForwardInfo acallforwardinfo[], CallForwardInfo acallforwardinfo1[])
        {
label0:
            {
                if (acallforwardinfo != acallforwardinfo1)
                {
                    if (acallforwardinfo == null || acallforwardinfo1 == null)
                        break label0;
                    if (acallforwardinfo.length != acallforwardinfo1.length)
                        return false;
                    for (int i = 0; i < acallforwardinfo.length;)
                    {
                        CallForwardInfo callforwardinfo = acallforwardinfo[i];
                        CallForwardInfo callforwardinfo1 = acallforwardinfo1[i];
                        if (callforwardinfo.status == callforwardinfo1.status && callforwardinfo.reason == callforwardinfo1.reason && callforwardinfo.serviceClass == callforwardinfo1.serviceClass && callforwardinfo.toa == callforwardinfo1.toa && callforwardinfo.number == callforwardinfo1.number && callforwardinfo.timeSeconds == callforwardinfo1.timeSeconds)
                            i++;
                        else
                            return false;
                    }

                }
                return true;
            }
            return false;
        }

        public boolean equals(Object obj)
        {
            if (obj != null && (obj instanceof VoiceMailProviderSettings))
            {
                VoiceMailProviderSettings voicemailprovidersettings = (VoiceMailProviderSettings)obj;
                if ((mVoicemailNumber == null && voicemailprovidersettings.mVoicemailNumber == null || mVoicemailNumber != null && mVoicemailNumber.equals(voicemailprovidersettings.mVoicemailNumber)) && forwardingSettingsEqual(mForwardingSettings, voicemailprovidersettings.mForwardingSettings))
                    return true;
            }
            return false;
        }

        public int hashCode()
        {
            return super.hashCode();
        }

        public String toString()
        {
            StringBuilder stringbuilder = (new StringBuilder()).append(mVoicemailNumber);
            String s;
            if (mForwardingSettings != null)
                s = (new StringBuilder()).append(", ").append(mForwardingSettings.toString()).toString();
            else
                s = "";
            return stringbuilder.append(s).toString();
        }

        public VoiceMailProviderSettings(String s, String s1, int i)
        {
            this$0 = VoiceMailSetting.this;
            super();
            mVoicemailNumber = s;
            if (s1 != null && s1.length() != 0)
            {
                mForwardingSettings = new CallForwardInfo[VoiceMailSetting.FORWARDING_SETTINGS_REASONS.length];
                for (int j = 0; j < mForwardingSettings.length; j++)
                {
                    CallForwardInfo callforwardinfo = new CallForwardInfo();
                    mForwardingSettings[j] = callforwardinfo;
                    callforwardinfo.reason = VoiceMailSetting.FORWARDING_SETTINGS_REASONS[j];
                    int k;
                    if (callforwardinfo.reason == 0)
                        k = 0;
                    else
                        k = 1;
                    callforwardinfo.status = k;
                    callforwardinfo.serviceClass = 1;
                    callforwardinfo.toa = 145;
                    callforwardinfo.number = s1;
                    callforwardinfo.timeSeconds = i;
                }

            } else
            {
                mForwardingSettings = VoiceMailSetting.FWD_SETTINGS_DONT_TOUCH;
            }
        }

        public VoiceMailProviderSettings(String s, CallForwardInfo acallforwardinfo[])
        {
            this$0 = VoiceMailSetting.this;
            super();
            mVoicemailNumber = s;
            mForwardingSettings = acallforwardinfo;
        }
    }


    public static final String ACTION_ADD_VOICEMAIL = "com.android.phone.CallFeaturesSetting.ADD_VOICEMAIL";
    public static final String ACTION_CONFIGURE_VOICEMAIL = "com.android.phone.CallFeaturesSetting.CONFIGURE_VOICEMAIL";
    private static final String BUTTON_VOICEMAIL_KEY = "button_voicemail_key";
    private static final String BUTTON_VOICEMAIL_PROVIDER_KEY = "button_voicemail_provider_key";
    private static final String BUTTON_VOICEMAIL_SETTING_KEY = "button_voicemail_setting_key";
    private static final boolean DBG = true;
    private static final String DEFAULT_VM_PROVIDER_KEY[] = {
        "1", "2", "3", "4"
    };
    static final int DTMF_TONE_TYPE_LONG = 1;
    static final int DTMF_TONE_TYPE_NORMAL = 0;
    private static final int EVENT_FORWARDING_CHANGED = 501;
    private static final int EVENT_FORWARDING_GET_COMPLETED = 502;
    private static final int EVENT_VOICEMAIL_CHANGED = 500;
    static final int FORWARDING_SETTINGS_REASONS[] = {
        0, 1, 2, 3
    };
    public static final String FWD_NUMBER_EXTRA = "com.android.phone.ForwardingNumber";
    public static final String FWD_NUMBER_TIME_EXTRA = "com.android.phone.ForwardingNumberTime";
    public static final CallForwardInfo FWD_SETTINGS_DONT_TOUCH[] = null;
    public static final String FWD_SETTINGS_LENGTH_TAG = "#Length";
    public static final String FWD_SETTINGS_TAG = "#FWDSettings";
    public static final String FWD_SETTING_NUMBER = "#Number";
    public static final String FWD_SETTING_REASON = "#Reason";
    public static final String FWD_SETTING_STATUS = "#Status";
    public static final String FWD_SETTING_TAG = "#Setting";
    public static final String FWD_SETTING_TIME = "#Time";
    private static final int FW_GET_RESPONSE_ERROR = 502;
    private static final int FW_SET_RESPONSE_ERROR = 501;
    public static final String IGNORE_PROVIDER_EXTRA = "com.android.phone.ProviderToIgnore";
    private static final String LOG_TAG = "Settings/VoiceMailSetting";
    private static final int MSG_FW_GET_EXCEPTION = 402;
    private static final int MSG_FW_SET_EXCEPTION = 401;
    private static final int MSG_VM_EXCEPTION = 400;
    private static final int MSG_VM_NOCHANGE = 700;
    private static final int MSG_VM_OK = 600;
    private static final String NUM_PROJECTION[] = {
        "data1"
    };
    public static final String SIGNOUT_EXTRA = "com.android.phone.Signout";
    private static final int VM_NOCHANGE_ERROR = 400;
    private static final String VM_NUMBERS_SHARED_PREFERENCES_NAME[] = {
        "vm_numbers", "vm_numbers_sim2", "vm_numbers_sim3", "vm_numbers_sim4"
    };
    public static final String VM_NUMBER_EXTRA = "com.android.phone.VoicemailNumber";
    public static final String VM_NUMBER_TAG = "#VMNumber";
    private static final int VM_RESPONSE_ERROR = 500;
    private static final int VOICEMAIL_DIALOG_CONFIRM = 600;
    private static final int VOICEMAIL_FWD_READING_DIALOG = 602;
    private static final int VOICEMAIL_FWD_SAVING_DIALOG = 601;
    private static final int VOICEMAIL_PREF_ID = 1;
    private static final int VOICEMAIL_PROVIDER_CFG_ID = 2;
    private static final int VOICEMAIL_REVERTING_DIALOG = 603;
    boolean mChangingVMorFwdDueToProviderChange;
    int mCurrentDialogId;
    private Collection mExpectedChangeResultReasons;
    private boolean mForeground;
    private Map mForwardingChangeResults;
    CallForwardInfo mForwardingReadResults[];
    boolean mFwdChangesRequireRollback;
    private final Handler mGetOptionComplete = new Handler() {

        final VoiceMailSetting this$0;

        public void handleMessage(Message message)
        {
            AsyncResult asyncresult = (AsyncResult)message.obj;
            switch (message.what)
            {
            case 502: 
                handleForwardingSettingsReadResult(asyncresult, message.arg1);
                return;
            }
        }

            
            {
                this$0 = VoiceMailSetting.this;
                super();
            }
    }
;
    private String mInitTitle;
    private CallForwardInfo mNewFwdSettings[];
    String mNewVMNumber;
    private String mOldVmNumber;
    SharedPreferences mPerProviderSavedVMNumbers;
    private Phone mPhone;
    String mPreviousVMProviderKey;
    private boolean mReadingSettingsForDefaultProvider;
    private final BroadcastReceiver mReceiver = new CallFeaturesSettingBroadcastReceiver();
    private final Handler mRevertOptionComplete = new Handler() {

        final VoiceMailSetting this$0;

        public void handleMessage(Message message)
        {
            AsyncResult asyncresult = (AsyncResult)message.obj;
            switch (message.what)
            {
            case 501: 
                mForwardingChangeResults.put(Integer.valueOf(message.arg1), asyncresult);
                if (asyncresult.exception != null)
                    VoiceMailSetting.log((new StringBuilder()).append("Error in reverting fwd# ").append(message.arg1).append(": ").append(asyncresult.exception.getMessage()).toString());
                else
                    VoiceMailSetting.log((new StringBuilder()).append("Success in reverting fwd# ").append(message.arg1).toString());
                VoiceMailSetting.log("FWD revert complete msg ");
                break;

            case 500: 
                mVoicemailChangeResult = asyncresult;
                VoiceMailSetting.log("VM revert complete msg");
                break;
            }
            boolean flag;
            if (mVMChangeCompletedSuccesfully && mVoicemailChangeResult == null || mFwdChangesRequireRollback && !checkForwardingCompleted())
                flag = false;
            else
                flag = true;
            if (flag)
            {
                VoiceMailSetting.log("All VM reverts done");
                dismissDialogSafely(603);
                onRevertDone();
            }
        }

            
            {
                this$0 = VoiceMailSetting.this;
                super();
            }
    }
;
    private final Handler mSetOptionComplete = new Handler() {

        final VoiceMailSetting this$0;

        public void handleMessage(Message message)
        {
            AsyncResult asyncresult = (AsyncResult)message.obj;
            int i = message.what;
            boolean flag = false;
            switch (i)
            {
            default:
                break;

            case 501: 
                mForwardingChangeResults.put(Integer.valueOf(message.arg1), asyncresult);
                if (asyncresult.exception != null)
                    VoiceMailSetting.log((new StringBuilder()).append("Error in setting fwd# ").append(message.arg1).append(": ").append(asyncresult.exception.getMessage()).toString());
                else
                    VoiceMailSetting.log((new StringBuilder()).append("Success in setting fwd# ").append(message.arg1).toString());
                boolean flag2 = checkForwardingCompleted();
                flag = false;
                if (!flag2)
                    break;
                if (checkFwdChangeSuccess() == null)
                {
                    VoiceMailSetting.log("Overall fwd changes completed ok, starting vm change");
                    setVMNumberWithCarrier();
                    flag = false;
                    break;
                }
                VoiceMailSetting.log("Overall fwd changes completed, failure");
                mFwdChangesRequireRollback = false;
                Iterator iterator = mForwardingChangeResults.entrySet().iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    if (((AsyncResult)((java.util.Map.Entry)iterator.next()).getValue()).exception != null)
                        continue;
                    VoiceMailSetting.log("Rollback will be required");
                    mFwdChangesRequireRollback = true;
                    break;
                } while (true);
                flag = true;
                break;

            case 500: 
                mVoicemailChangeResult = asyncresult;
                VoiceMailSetting voicemailsetting = VoiceMailSetting.this;
                String s = checkVMChangeSuccess();
                boolean flag1 = false;
                if (s == null)
                    flag1 = true;
                voicemailsetting.mVMChangeCompletedSuccesfully = flag1;
                VoiceMailSetting.log((new StringBuilder()).append("VM change complete msg, VM change done = ").append(String.valueOf(mVMChangeCompletedSuccesfully)).toString());
                flag = true;
                break;
            }
            if (flag)
            {
                VoiceMailSetting.log("All VM provider related changes done");
                if (mForwardingChangeResults != null)
                    dismissDialogSafely(601);
                handleSetVMOrFwdMessage();
            }
        }

            
            {
                this$0 = VoiceMailSetting.this;
                super();
            }
    }
;
    private int mSimId;
    private EditPhoneNumberPreference mSubMenuVoicemailSettings;
    boolean mVMChangeCompletedSuccesfully;
    int mVMOrFwdSetError;
    boolean mVMProviderSettingsForced;
    private final Map mVMProvidersData = new HashMap();
    AsyncResult mVoicemailChangeResult;
    private ListPreference mVoicemailProviders;
    private PreferenceScreen mVoicemailSettings;

    public VoiceMailSetting()
    {
        mInitTitle = null;
        mForwardingReadResults = null;
        mForwardingChangeResults = null;
        mExpectedChangeResultReasons = null;
        mVoicemailChangeResult = null;
        mPreviousVMProviderKey = null;
        mCurrentDialogId = 0;
        mVMProviderSettingsForced = false;
        mChangingVMorFwdDueToProviderChange = false;
        mVMChangeCompletedSuccesfully = false;
        mFwdChangesRequireRollback = false;
        mVMOrFwdSetError = 0;
        mReadingSettingsForDefaultProvider = false;
    }

    private boolean checkForwardingCompleted()
    {
        boolean flag;
label0:
        {
            if (mForwardingChangeResults == null)
            {
                flag = true;
                break label0;
            }
            flag = true;
            Iterator iterator = mExpectedChangeResultReasons.iterator();
            Integer integer;
            do
            {
                if (!iterator.hasNext())
                    break label0;
                integer = (Integer)iterator.next();
            } while (mForwardingChangeResults.get(integer) != null);
            return false;
        }
        return flag;
    }

    private String checkFwdChangeSuccess()
    {
        Iterator iterator = mForwardingChangeResults.entrySet().iterator();
        String s;
        do
        {
            boolean flag = iterator.hasNext();
            s = null;
            if (!flag)
                break;
            Throwable throwable = ((AsyncResult)((java.util.Map.Entry)iterator.next()).getValue()).exception;
            if (throwable == null)
                continue;
            s = throwable.getMessage();
            if (s == null)
                s = "";
            break;
        } while (true);
        return s;
    }

    private String checkVMChangeSuccess()
    {
        if (mVoicemailChangeResult.exception != null)
        {
            String s = mVoicemailChangeResult.exception.getMessage();
            if (s == null)
                s = "";
            return s;
        } else
        {
            return null;
        }
    }

    private void deleteSettingsForVoicemailProvider(String s)
    {
        log((new StringBuilder()).append("Deleting settings for").append(s).toString());
        if (mVoicemailProviders == null)
        {
            return;
        } else
        {
            mPerProviderSavedVMNumbers.edit().putString((new StringBuilder()).append(s).append("#VMNumber").toString(), null).putInt((new StringBuilder()).append(s).append("#FWDSettings").append("#Length").toString(), 0).commit();
            return;
        }
    }

    private void dismissDialogSafely(int i)
    {
        try
        {
            dismissDialog(i);
            return;
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            log("IllegalArgumentException");
        }
    }

    private String getCurrentVoicemailProviderKey()
    {
        String s = mVoicemailProviders.getValue();
        if (CallSettings.isMultipleSim())
            s = PreferenceManager.getDefaultSharedPreferences(getApplicationContext()).getString((new StringBuilder()).append("button_voicemail_provider_key").append(mSimId).toString(), "");
        if (CallSettings.isMultipleSim())
        {
            if (s == null)
                return DEFAULT_VM_PROVIDER_KEY[mSimId];
        } else
        if (s == null)
            return DEFAULT_VM_PROVIDER_KEY[0];
        return s;
    }

    private void handleSetVMOrFwdMessage()
    {
        log("handleSetVMMessage: set VM request complete");
        boolean flag = true;
        String s = "";
        Map map = mForwardingChangeResults;
        boolean flag1 = false;
        if (map != null)
        {
            s = checkFwdChangeSuccess();
            flag1 = false;
            if (s != null)
            {
                flag = false;
                flag1 = true;
            }
        }
        if (flag)
        {
            s = checkVMChangeSuccess();
            if (s != null)
                flag = false;
        }
        if (flag)
        {
            log("change VM success!");
            handleVMAndFwdSetSuccess(600);
            updateVoiceNumberField();
            return;
        }
        if (flag1)
        {
            log((new StringBuilder()).append("change FW failed: ").append(s).toString());
            handleVMOrFwdSetError(401);
            return;
        } else
        {
            log((new StringBuilder()).append("change VM failed: ").append(s).toString());
            handleVMOrFwdSetError(400);
            return;
        }
    }

    private void handleVMAndFwdSetSuccess(int i)
    {
        mChangingVMorFwdDueToProviderChange = false;
        showVMDialog(i);
    }

    private void handleVMBtnClickRequest()
    {
        saveVoiceMailAndForwardingNumber(getCurrentVoicemailProviderKey(), new VoiceMailProviderSettings(mSubMenuVoicemailSettings.getPhoneNumber(), FWD_SETTINGS_DONT_TOUCH));
    }

    private void handleVMOrFwdSetError(int i)
    {
        if (mChangingVMorFwdDueToProviderChange)
        {
            mVMOrFwdSetError = i;
            mChangingVMorFwdDueToProviderChange = false;
            switchToPreviousVoicemailProvider();
            return;
        } else
        {
            mChangingVMorFwdDueToProviderChange = false;
            showVMDialog(i);
            updateVoiceNumberField();
            return;
        }
    }

    private CallForwardInfo infoForReason(CallForwardInfo acallforwardinfo[], int i)
    {
        CallForwardInfo callforwardinfo = null;
        if (acallforwardinfo == null) goto _L2; else goto _L1
_L1:
        int j;
        int k;
        j = acallforwardinfo.length;
        k = 0;
_L7:
        callforwardinfo = null;
        if (k >= j) goto _L2; else goto _L3
_L3:
        CallForwardInfo callforwardinfo1 = acallforwardinfo[k];
        if (callforwardinfo1.reason != i) goto _L5; else goto _L4
_L4:
        callforwardinfo = callforwardinfo1;
_L2:
        return callforwardinfo;
_L5:
        k++;
        if (true) goto _L7; else goto _L6
_L6:
    }

    private void initVoiceMailProviders()
    {
        log((new StringBuilder()).append("callFeaturesSettings, initVoiceMailProviders: simId = ").append(mSimId).toString());
        if (CallSettings.isMultipleSim())
            mPerProviderSavedVMNumbers = getApplicationContext().getSharedPreferences(VM_NUMBERS_SHARED_PREFERENCES_NAME[mSimId], 0);
        else
            mPerProviderSavedVMNumbers = getApplicationContext().getSharedPreferences(VM_NUMBERS_SHARED_PREFERENCES_NAME[0], 0);
        boolean flag = "com.android.phone.CallFeaturesSetting.ADD_VOICEMAIL".equals(getIntent().getAction());
        String s = null;
        if (flag)
        {
            log("ACTION_ADD_VOICEMAIL");
            boolean flag1 = getIntent().hasExtra("com.android.phone.ProviderToIgnore");
            s = null;
            if (flag1)
                s = getIntent().getStringExtra("com.android.phone.ProviderToIgnore");
            log((new StringBuilder()).append("providerToIgnore=").append(s).toString());
            if (s != null)
                deleteSettingsForVoicemailProvider(s);
        }
        mVMProvidersData.clear();
        String s1 = getString(0x7f0d01f0);
        if (CallSettings.isMultipleSim())
        {
            Map map2 = mVMProvidersData;
            String s6 = DEFAULT_VM_PROVIDER_KEY[mSimId];
            VoiceMailProvider voicemailprovider2 = new VoiceMailProvider(s1, null);
            map2.put(s6, voicemailprovider2);
        } else
        {
            Map map = mVMProvidersData;
            String s2 = DEFAULT_VM_PROVIDER_KEY[0];
            VoiceMailProvider voicemailprovider = new VoiceMailProvider(s1, null);
            map.put(s2, voicemailprovider);
        }
        PackageManager packagemanager = getPackageManager();
        Intent intent = new Intent();
        intent.setAction("com.android.phone.CallFeaturesSetting.CONFIGURE_VOICEMAIL");
        List list = packagemanager.queryIntentActivities(intent, 0);
        int i = 1 + list.size();
        for (int j = 0; j < list.size(); j++)
        {
            ResolveInfo resolveinfo = (ResolveInfo)list.get(j);
            ActivityInfo activityinfo = resolveinfo.activityInfo;
            String s4 = makeKeyForActivity(activityinfo);
            log((new StringBuilder()).append("Loading ").append(s4).toString());
            if (s4.equals(s))
            {
                log((new StringBuilder()).append("Ignoring ").append(s4).toString());
                i--;
            } else
            {
                String s5 = resolveinfo.loadLabel(packagemanager).toString();
                Intent intent1 = new Intent();
                intent1.setAction("com.android.phone.CallFeaturesSetting.CONFIGURE_VOICEMAIL");
                intent1.setClassName(activityinfo.packageName, activityinfo.name);
                Map map1 = mVMProvidersData;
                VoiceMailProvider voicemailprovider1 = new VoiceMailProvider(s5, intent1);
                map1.put(s4, voicemailprovider1);
            }
        }

        String as[] = new String[i];
        String as1[] = new String[i];
        as[0] = s1;
        if (CallSettings.isMultipleSim())
            as1[0] = DEFAULT_VM_PROVIDER_KEY[mSimId];
        else
            as1[0] = DEFAULT_VM_PROVIDER_KEY[0];
        int k = 1;
        for (int l = 0; l < list.size(); l++)
        {
            String s3 = makeKeyForActivity(((ResolveInfo)list.get(l)).activityInfo);
            if (mVMProvidersData.containsKey(s3))
            {
                as[k] = ((VoiceMailProvider)mVMProvidersData.get(s3)).mName;
                as1[k] = s3;
                k++;
            }
        }

        mVoicemailProviders.setEntries(as);
        mVoicemailProviders.setEntryValues(as1);
        mPreviousVMProviderKey = getCurrentVoicemailProviderKey();
        if (CallSettings.isMultipleSim())
        {
            SharedPreferences sharedpreferences = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
            mVoicemailProviders.setValue(sharedpreferences.getString((new StringBuilder()).append("button_voicemail_provider_key").append(mSimId).toString(), null));
        }
        updateVMPreferenceWidgets(mPreviousVMProviderKey);
    }

    private boolean isAirplaneModeOn()
    {
        int i = android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        return flag;
    }

    private boolean isUpdateRequired(CallForwardInfo callforwardinfo, CallForwardInfo callforwardinfo1)
    {
        boolean flag = true;
        if (callforwardinfo1.status == 0 && callforwardinfo != null && callforwardinfo.status == 0)
            flag = false;
        return flag;
    }

    private VoiceMailProviderSettings loadSettingsForVoiceMailProvider(String s)
    {
        String s1 = mPerProviderSavedVMNumbers.getString((new StringBuilder()).append(s).append("#VMNumber").toString(), null);
        if (s1 == null)
        {
            log((new StringBuilder()).append("Settings for ").append(s).append(" not found").toString());
            return null;
        }
        CallForwardInfo acallforwardinfo[] = FWD_SETTINGS_DONT_TOUCH;
        String s2 = (new StringBuilder()).append(s).append("#FWDSettings").toString();
        int i = mPerProviderSavedVMNumbers.getInt((new StringBuilder()).append(s2).append("#Length").toString(), 0);
        if (i > 0)
        {
            acallforwardinfo = new CallForwardInfo[i];
            for (int j = 0; j < acallforwardinfo.length; j++)
            {
                String s3 = (new StringBuilder()).append(s2).append("#Setting").append(String.valueOf(j)).toString();
                acallforwardinfo[j] = new CallForwardInfo();
                acallforwardinfo[j].status = mPerProviderSavedVMNumbers.getInt((new StringBuilder()).append(s3).append("#Status").toString(), 0);
                acallforwardinfo[j].reason = mPerProviderSavedVMNumbers.getInt((new StringBuilder()).append(s3).append("#Reason").toString(), 5);
                acallforwardinfo[j].serviceClass = 1;
                acallforwardinfo[j].toa = 145;
                acallforwardinfo[j].number = mPerProviderSavedVMNumbers.getString((new StringBuilder()).append(s3).append("#Number").toString(), "");
                acallforwardinfo[j].timeSeconds = mPerProviderSavedVMNumbers.getInt((new StringBuilder()).append(s3).append("#Time").toString(), 20);
            }

        }
        VoiceMailProviderSettings voicemailprovidersettings = new VoiceMailProviderSettings(s1, acallforwardinfo);
        log((new StringBuilder()).append("Loaded settings for ").append(s).append(": ").append(voicemailprovidersettings.toString()).toString());
        return voicemailprovidersettings;
    }

    private static void log(String s)
    {
        Xlog.d("Settings/VoiceMailSetting", s);
    }

    private String makeKeyForActivity(ActivityInfo activityinfo)
    {
        return activityinfo.name;
    }

    private void maybeSaveSettingsForVoicemailProvider(String s, VoiceMailProviderSettings voicemailprovidersettings)
    {
        if (mVoicemailProviders == null)
            return;
        if (voicemailprovidersettings.equals(loadSettingsForVoiceMailProvider(s)))
        {
            log((new StringBuilder()).append("Not saving setting for ").append(s).append(" since they have not changed").toString());
            return;
        }
        log((new StringBuilder()).append("Saving settings for ").append(s).append(": ").append(voicemailprovidersettings.toString()).toString());
        android.content.SharedPreferences.Editor editor = mPerProviderSavedVMNumbers.edit();
        editor.putString((new StringBuilder()).append(s).append("#VMNumber").toString(), voicemailprovidersettings.mVoicemailNumber);
        String s1 = (new StringBuilder()).append(s).append("#FWDSettings").toString();
        CallForwardInfo acallforwardinfo[] = voicemailprovidersettings.mForwardingSettings;
        if (acallforwardinfo != FWD_SETTINGS_DONT_TOUCH)
        {
            editor.putInt((new StringBuilder()).append(s1).append("#Length").toString(), acallforwardinfo.length);
            for (int i = 0; i < acallforwardinfo.length; i++)
            {
                String s2 = (new StringBuilder()).append(s1).append("#Setting").append(String.valueOf(i)).toString();
                CallForwardInfo callforwardinfo = acallforwardinfo[i];
                editor.putInt((new StringBuilder()).append(s2).append("#Status").toString(), callforwardinfo.status);
                editor.putInt((new StringBuilder()).append(s2).append("#Reason").toString(), callforwardinfo.reason);
                editor.putString((new StringBuilder()).append(s2).append("#Number").toString(), callforwardinfo.number);
                editor.putInt((new StringBuilder()).append(s2).append("#Time").toString(), callforwardinfo.timeSeconds);
            }

        } else
        {
            editor.putInt((new StringBuilder()).append(s1).append("#Length").toString(), 0);
        }
        editor.apply();
    }

    private void resetForwardingChangeState()
    {
        mForwardingChangeResults = new HashMap();
        mExpectedChangeResultReasons = new HashSet();
    }

    private void saveVoiceMailAndForwardingNumber(String s, VoiceMailProviderSettings voicemailprovidersettings)
    {
        log((new StringBuilder()).append("saveVoiceMailAndForwardingNumber: ").append(voicemailprovidersettings.toString()).toString());
        mNewVMNumber = voicemailprovidersettings.mVoicemailNumber;
        if (mNewVMNumber == null)
            mNewVMNumber = "";
        mNewFwdSettings = voicemailprovidersettings.mForwardingSettings;
        StringBuilder stringbuilder = (new StringBuilder()).append("newFwdNumber ");
        int i;
        if (mNewFwdSettings != null)
            i = mNewFwdSettings.length;
        else
            i = 0;
        log(stringbuilder.append(String.valueOf(i)).append(" settings").toString());
        if (mPhone.getPhoneType() == 2)
        {
            log("ignoring forwarding setting since this is CDMA phone");
            mNewFwdSettings = FWD_SETTINGS_DONT_TOUCH;
        }
        if (mNewVMNumber.equals(mOldVmNumber) && mNewFwdSettings == FWD_SETTINGS_DONT_TOUCH)
        {
            showVMDialog(700);
            return;
        }
        maybeSaveSettingsForVoicemailProvider(s, voicemailprovidersettings);
        mVMChangeCompletedSuccesfully = false;
        mFwdChangesRequireRollback = false;
        mVMOrFwdSetError = 0;
        boolean flag;
        if (CallSettings.isMultipleSim())
            flag = mPreviousVMProviderKey.equals(DEFAULT_VM_PROVIDER_KEY[mSimId]);
        else
            flag = mPreviousVMProviderKey.equals(DEFAULT_VM_PROVIDER_KEY[0]);
        if (!s.equals(mPreviousVMProviderKey) && flag)
        {
            log("Reading current forwarding settings");
            mForwardingReadResults = new CallForwardInfo[FORWARDING_SETTINGS_REASONS.length];
            for (int j = 0; j < FORWARDING_SETTINGS_REASONS.length; j++)
            {
                mForwardingReadResults[j] = null;
                if (CallSettings.isMultipleSim())
                    ((GeminiPhone)mPhone).getCallForwardingOptionGemini(FORWARDING_SETTINGS_REASONS[j], mGetOptionComplete.obtainMessage(502, j, 0), mSimId);
                else
                    mPhone.getCallForwardingOption(FORWARDING_SETTINGS_REASONS[j], mGetOptionComplete.obtainMessage(502, j, 0));
            }

            showDialogIfForeground(602);
            return;
        } else
        {
            saveVoiceMailAndForwardingNumberStage2();
            return;
        }
    }

    private void saveVoiceMailAndForwardingNumberStage2()
    {
        mForwardingChangeResults = null;
        mVoicemailChangeResult = null;
        if (mNewFwdSettings != FWD_SETTINGS_DONT_TOUCH)
        {
            resetForwardingChangeState();
            for (int i = 0; i < mNewFwdSettings.length; i++)
            {
                CallForwardInfo callforwardinfo = mNewFwdSettings[i];
                if (isUpdateRequired(infoForReason(mForwardingReadResults, callforwardinfo.reason), callforwardinfo))
                {
                    log((new StringBuilder()).append("Setting fwd #: ").append(i).append(": ").append(callforwardinfo.toString()).toString());
                    mExpectedChangeResultReasons.add(Integer.valueOf(i));
                    if (CallSettings.isMultipleSim())
                    {
                        GeminiPhone geminiphone = (GeminiPhone)mPhone;
                        byte byte1;
                        if (callforwardinfo.status == 1)
                            byte1 = 3;
                        else
                            byte1 = 0;
                        geminiphone.setCallForwardingOptionGemini(byte1, callforwardinfo.reason, callforwardinfo.number, callforwardinfo.timeSeconds, mSetOptionComplete.obtainMessage(501, i, 0), mSimId);
                    } else
                    {
                        Phone phone = mPhone;
                        byte byte0;
                        if (callforwardinfo.status == 1)
                            byte0 = 3;
                        else
                            byte0 = 0;
                        phone.setCallForwardingOption(byte0, callforwardinfo.reason, callforwardinfo.number, callforwardinfo.timeSeconds, mSetOptionComplete.obtainMessage(501, i, 0));
                    }
                }
                showDialogIfForeground(601);
            }

        } else
        {
            log("Not touching fwd #");
            setVMNumberWithCarrier();
        }
    }

    private void showDialogIfForeground(int i)
    {
        if (mForeground)
            showDialog(i);
    }

    private void showVMDialog(int i)
    {
        switch (i)
        {
        case 600: 
            showDialogIfForeground(600);
            return;

        case 700: 
            showDialogIfForeground(400);
            return;

        case 402: 
            showDialogIfForeground(502);
            return;

        case 401: 
            showDialogIfForeground(501);
            return;

        case 400: 
            showDialogIfForeground(500);
            return;
        }
    }

    private void simulatePreferenceClick(Preference preference)
    {
        ListAdapter listadapter = getPreferenceScreen().getRootAdapter();
        int i = 0;
        do
        {
label0:
            {
                if (i < listadapter.getCount())
                {
                    if (listadapter.getItem(i) != preference)
                        break label0;
                    getPreferenceScreen().onItemClick(getListView(), null, i, listadapter.getItemId(i));
                }
                return;
            }
            i++;
        } while (true);
    }

    private void switchToPreviousVoicemailProvider()
    {
        log((new StringBuilder()).append("switchToPreviousVoicemailProvider ").append(mPreviousVMProviderKey).toString());
        if (mPreviousVMProviderKey != null)
        {
            if (!mVMChangeCompletedSuccesfully && !mFwdChangesRequireRollback)
            {
                log("No need to revert");
                onRevertDone();
                return;
            }
            showDialogIfForeground(603);
            VoiceMailProviderSettings voicemailprovidersettings = loadSettingsForVoiceMailProvider(mPreviousVMProviderKey);
            if (voicemailprovidersettings != null)
            {
                if (mVMChangeCompletedSuccesfully)
                {
                    mNewVMNumber = voicemailprovidersettings.mVoicemailNumber;
                    log((new StringBuilder()).append("have to revert VM to ").append(mNewVMNumber).toString());
                    if (CallSettings.isMultipleSim())
                        ((GeminiPhone)mPhone).setVoiceMailNumberGemini(((GeminiPhone)mPhone).getVoiceMailAlphaTagGemini(mSimId).toString(), mNewVMNumber, Message.obtain(mRevertOptionComplete, 500), mSimId);
                    else
                        mPhone.setVoiceMailNumber(mPhone.getVoiceMailAlphaTag().toString(), mNewVMNumber, Message.obtain(mRevertOptionComplete, 500));
                }
                if (mFwdChangesRequireRollback)
                {
                    log("have to revert fwd");
                    CallForwardInfo acallforwardinfo[] = voicemailprovidersettings.mForwardingSettings;
                    if (acallforwardinfo != null)
                    {
                        Map map = mForwardingChangeResults;
                        resetForwardingChangeState();
                        for (int i = 0; i < acallforwardinfo.length; i++)
                        {
                            CallForwardInfo callforwardinfo = acallforwardinfo[i];
                            log((new StringBuilder()).append("Reverting fwd #: ").append(i).append(": ").append(callforwardinfo.toString()).toString());
                            AsyncResult asyncresult = (AsyncResult)map.get(Integer.valueOf(callforwardinfo.reason));
                            if (asyncresult == null || asyncresult.exception != null)
                                continue;
                            mExpectedChangeResultReasons.add(Integer.valueOf(callforwardinfo.reason));
                            if (CallSettings.isMultipleSim())
                            {
                                GeminiPhone geminiphone = (GeminiPhone)mPhone;
                                byte byte1;
                                if (callforwardinfo.status == 1)
                                    byte1 = 3;
                                else
                                    byte1 = 0;
                                geminiphone.setCallForwardingOptionGemini(byte1, callforwardinfo.reason, callforwardinfo.number, callforwardinfo.timeSeconds, mRevertOptionComplete.obtainMessage(501, i, 0), mSimId);
                                continue;
                            }
                            Phone phone = mPhone;
                            byte byte0;
                            if (callforwardinfo.status == 1)
                                byte0 = 3;
                            else
                                byte0 = 0;
                            phone.setCallForwardingOption(byte0, callforwardinfo.reason, callforwardinfo.number, callforwardinfo.timeSeconds, mRevertOptionComplete.obtainMessage(501, i, 0));
                        }

                    }
                }
            }
        }
    }

    private void updateVMPreferenceWidgets(String s)
    {
        VoiceMailProvider voicemailprovider = (VoiceMailProvider)mVMProvidersData.get(s);
        if (voicemailprovider == null)
        {
            mVoicemailProviders.setSummary(getString(0x7f0d01ef));
            mVoicemailSettings.setSummary("");
            mVoicemailSettings.setEnabled(false);
            mVoicemailSettings.setIntent(null);
            return;
        } else
        {
            String s1 = voicemailprovider.mName;
            mVoicemailProviders.setSummary(s1);
            mVoicemailSettings.setSummary(getApplicationContext().getString(0x7f0d0165, new Object[] {
                s1
            }));
            mVoicemailSettings.setEnabled(true);
            mVoicemailSettings.setIntent(voicemailprovider.mIntent);
            return;
        }
    }

    private void updateVoiceNumberField()
    {
        if (mSubMenuVoicemailSettings == null)
            return;
        Xlog.d("Settings/VoiceMailSetting", (new StringBuilder()).append("updateVoiceNumberField, simid:").append(mSimId).toString());
        if (CallSettings.isMultipleSim())
            mOldVmNumber = ((GeminiPhone)mPhone).getVoiceMailNumberGemini(mSimId);
        else
            mOldVmNumber = mPhone.getVoiceMailNumber();
        Xlog.d("Settings/VoiceMailSetting", (new StringBuilder()).append("updateVoiceNumberField, mOldVmNumber:").append(mOldVmNumber).toString());
        if (mOldVmNumber == null)
            mOldVmNumber = "";
        mSubMenuVoicemailSettings.setPhoneNumber(mOldVmNumber);
        String s;
        if (mOldVmNumber.length() > 0)
            s = mOldVmNumber;
        else
            s = getString(0x7f0d0171);
        mSubMenuVoicemailSettings.setSummary(s);
    }

    void handleForwardingSettingsReadResult(AsyncResult asyncresult, int i)
    {
        Xlog.d("Settings/VoiceMailSetting", (new StringBuilder()).append("handleForwardingSettingsReadResult: ").append(i).toString());
        Throwable throwable = asyncresult.exception;
        Throwable throwable1 = null;
        if (throwable != null)
        {
            Xlog.d("Settings/VoiceMailSetting", (new StringBuilder()).append("FwdRead: ar.exception=").append(asyncresult.exception.getMessage()).toString());
            throwable1 = asyncresult.exception;
        }
        if (asyncresult.userObj instanceof Throwable)
        {
            Xlog.d("Settings/VoiceMailSetting", (new StringBuilder()).append("FwdRead: userObj=").append(((Throwable)asyncresult.userObj).getMessage()).toString());
            throwable1 = (Throwable)asyncresult.userObj;
        }
        if (mForwardingReadResults == null)
        {
            Xlog.d("Settings/VoiceMailSetting", (new StringBuilder()).append("ignoring fwd reading result: ").append(i).toString());
            return;
        }
        if (throwable1 != null)
        {
            Xlog.d("Settings/VoiceMailSetting", (new StringBuilder()).append("Error discovered for fwd read : ").append(i).toString());
            mForwardingReadResults = null;
            dismissDialogSafely(602);
            showVMDialog(402);
            return;
        }
        CallForwardInfo acallforwardinfo[] = (CallForwardInfo[])(CallForwardInfo[])asyncresult.result;
        int j = 0;
        do
        {
label0:
            {
                int k = acallforwardinfo.length;
                CallForwardInfo callforwardinfo = null;
                if (j < k)
                {
                    if ((1 & acallforwardinfo[j].serviceClass) == 0)
                        break label0;
                    callforwardinfo = acallforwardinfo[j];
                }
                if (callforwardinfo == null)
                {
                    Xlog.d("Settings/VoiceMailSetting", (new StringBuilder()).append("Creating default info for ").append(i).toString());
                    callforwardinfo = new CallForwardInfo();
                    callforwardinfo.status = 0;
                    callforwardinfo.reason = FORWARDING_SETTINGS_REASONS[i];
                    callforwardinfo.serviceClass = 1;
                } else
                {
                    if (callforwardinfo.number == null || callforwardinfo.number.length() == 0)
                        callforwardinfo.status = 0;
                    Xlog.d("Settings/VoiceMailSetting", (new StringBuilder()).append("Got  ").append(callforwardinfo.toString()).append(" for ").append(i).toString());
                }
                mForwardingReadResults[i] = callforwardinfo;
                boolean flag = true;
                int l = 0;
                do
                {
label1:
                    {
                        if (l < mForwardingReadResults.length)
                        {
                            if (mForwardingReadResults[l] != null)
                                break label1;
                            flag = false;
                        }
                        if (flag)
                        {
                            Xlog.d("Settings/VoiceMailSetting", "Done receiving fwd info");
                            dismissDialogSafely(602);
                            if (mReadingSettingsForDefaultProvider)
                            {
                                if (CallSettings.isMultipleSim())
                                    maybeSaveSettingsForVoicemailProvider(DEFAULT_VM_PROVIDER_KEY[mSimId], new VoiceMailProviderSettings(mOldVmNumber, mForwardingReadResults));
                                else
                                    maybeSaveSettingsForVoicemailProvider(DEFAULT_VM_PROVIDER_KEY[0], new VoiceMailProviderSettings(mOldVmNumber, mForwardingReadResults));
                                mReadingSettingsForDefaultProvider = false;
                            }
                            saveVoiceMailAndForwardingNumberStage2();
                            return;
                        } else
                        {
                            Xlog.d("Settings/VoiceMailSetting", "Not done receiving fwd info");
                            return;
                        }
                    }
                    l++;
                } while (true);
            }
            j++;
        } while (true);
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        if (i != 2) goto _L2; else goto _L1
_L1:
        boolean flag1;
        String s;
        log((new StringBuilder()).append("mVMProviderSettingsForced: ").append(mVMProviderSettingsForced).toString());
        flag1 = mVMProviderSettingsForced;
        mVMProviderSettingsForced = false;
        s = null;
        if (j == -1) goto _L4; else goto _L3
_L3:
        boolean flag2;
        log("onActivityResult: vm provider cfg result not OK.");
        flag2 = true;
_L17:
        if (!flag2) goto _L6; else goto _L5
_L5:
        log("Failure in return from voicemail provider");
        if (!flag1) goto _L8; else goto _L7
_L7:
        switchToPreviousVoicemailProvider();
_L15:
        return;
_L4:
        if (intent == null)
        {
            log("onActivityResult: vm provider cfg result has no data");
            flag2 = true;
            s = null;
            continue; /* Loop/switch isn't completed */
        }
        if (intent.getBooleanExtra("com.android.phone.Signout", false))
        {
            log("Provider requested signout");
            if (flag1)
            {
                log("Going back to previous provider on signout");
                switchToPreviousVoicemailProvider();
                return;
            } else
            {
                String s3 = getCurrentVoicemailProviderKey();
                log((new StringBuilder()).append("Relaunching activity and ignoring ").append(s3).toString());
                Intent intent1 = new Intent("com.android.phone.CallFeaturesSetting.ADD_VOICEMAIL");
                intent1.putExtra("com.android.phone.ProviderToIgnore", s3);
                intent1.setFlags(0x4000000);
                startActivity(intent1);
                return;
            }
        }
        s = intent.getStringExtra("com.android.phone.VoicemailNumber");
        if (s != null)
        {
            int l = s.length();
            flag2 = false;
            if (l != 0)
                continue; /* Loop/switch isn't completed */
        }
        log("onActivityResult: vm provider cfg result has no vmnum");
        flag2 = true;
        continue; /* Loop/switch isn't completed */
_L8:
        log("Not switching back the provider since this is not forced config");
        return;
_L6:
        mChangingVMorFwdDueToProviderChange = flag1;
        String s1 = intent.getStringExtra("com.android.phone.ForwardingNumber");
        int k = intent.getIntExtra("com.android.phone.ForwardingNumberTime", 20);
        StringBuilder stringbuilder = (new StringBuilder()).append("onActivityResult: vm provider cfg result ");
        String s2;
        if (s1 != null)
            s2 = "has";
        else
            s2 = " does not have";
        log(stringbuilder.append(s2).append(" forwarding number").toString());
        saveVoiceMailAndForwardingNumber(getCurrentVoicemailProviderKey(), new VoiceMailProviderSettings(s, s1, k));
        return;
_L2:
        Cursor cursor;
        if (j != -1)
        {
            log("onActivityResult: contact picker result not OK.");
            return;
        }
        cursor = null;
        cursor = getContentResolver().query(intent.getData(), NUM_PROJECTION, null, null, null);
        if (cursor == null) goto _L10; else goto _L9
_L9:
        boolean flag = cursor.moveToFirst();
        if (!flag) goto _L10; else goto _L11
_L11:
        i;
        JVM INSTR tableswitch 1 1: default 416
    //                   1 429;
           goto _L10 _L12
_L10:
        if (cursor != null)
        {
            cursor.close();
            return;
        }
        break; /* Loop/switch isn't completed */
_L12:
        mSubMenuVoicemailSettings.onPickActivityResult(cursor.getString(0));
        if (true) goto _L10; else goto _L13
_L13:
        if (true) goto _L15; else goto _L14
_L14:
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
        if (true) goto _L17; else goto _L16
_L16:
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        dialoginterface.dismiss();
        switch (i)
        {
        case -1: 
            log("Positive button");
            if (mCurrentDialogId == 502)
            {
                saveVoiceMailAndForwardingNumberStage2();
                return;
            } else
            {
                finish();
                return;
            }

        case -2: 
            log("Negative button");
            if (mCurrentDialogId == 502)
                switchToPreviousVoicemailProvider();
            break;

        case -3: 
            log("Neutral button");
            break;
        }
        if ("com.android.phone.CallFeaturesSetting.ADD_VOICEMAIL".equals(getIntent().getAction()))
            finish();
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        log("Creating activity");
        mPhone = PhoneGlobals.getPhone();
        mSimId = getIntent().getIntExtra("simId", -1);
        if (mSimId != -1)
        {
            mInitTitle = getIntent().getStringExtra("sub_title_name");
            if (mInitTitle == null)
                mInitTitle = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(this, mSimId).mDisplayName;
        }
        addPreferencesFromResource(0x7f060022);
        if (mInitTitle != null)
            setTitle(mInitTitle);
        mSubMenuVoicemailSettings = (EditPhoneNumberPreference)findPreference("button_voicemail_key");
        if (mSubMenuVoicemailSettings != null)
        {
            mSubMenuVoicemailSettings.setParentActivity(this, 1, this);
            mSubMenuVoicemailSettings.setDialogOnClosedListener(this);
            mSubMenuVoicemailSettings.setDialogTitle(0x7f0d02b9);
        }
        mVoicemailProviders = (ListPreference)findPreference("button_voicemail_provider_key");
        if (mVoicemailProviders != null)
        {
            mVoicemailProviders.setOnPreferenceChangeListener(this);
            mVoicemailSettings = (PreferenceScreen)findPreference("button_voicemail_setting_key");
            if (CallSettings.isMultipleSim())
                mVoicemailProviders.setKey((new StringBuilder()).append("button_voicemail_provider_key").append(mSimId).toString());
            initVoiceMailProviders();
        }
        if (bundle == null && "com.android.phone.CallFeaturesSetting.ADD_VOICEMAIL".equals(getIntent().getAction()) && mVoicemailProviders != null)
            if (mVMProvidersData.size() > 1)
                simulatePreferenceClick(mVoicemailProviders);
            else
            if (CallSettings.isMultipleSim())
            {
                onPreferenceChange(mVoicemailProviders, DEFAULT_VM_PROVIDER_KEY[mSimId]);
                mVoicemailProviders.setValue(DEFAULT_VM_PROVIDER_KEY[mSimId]);
            } else
            {
                onPreferenceChange(mVoicemailProviders, DEFAULT_VM_PROVIDER_KEY[0]);
                mVoicemailProviders.setValue(DEFAULT_VM_PROVIDER_KEY[0]);
            }
        mVMProviderSettingsForced = false;
        IntentFilter intentfilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        intentfilter.addAction("android.intent.action.DUAL_SIM_MODE");
        intentfilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        registerReceiver(mReceiver, intentfilter);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    protected Dialog onCreateDialog(int i)
    {
        if (i != 500 && i != 400 && i != 501 && i != 502 && i != 600)
        {
            if (i != 601 && i != 602 && i != 603)
                return super.onCreateDialog(i);
            ProgressDialog progressdialog = new ProgressDialog(this);
            progressdialog.setTitle(getText(0x7f0d01dc));
            progressdialog.setIndeterminate(true);
            progressdialog.setCancelable(false);
            int l;
            if (i == 601)
                l = 0x7f0d01df;
            else
            if (i == 603)
                l = 0x7f0d01e0;
            else
                l = 0x7f0d01de;
            progressdialog.setMessage(getText(l));
            return progressdialog;
        }
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
        int j = 0x7f0d01dd;
        int k;
        switch (i)
        {
        case 502: 
            k = 0x7f0d01ed;
            builder.setPositiveButton(0x7f0d0313, this);
            builder.setNegativeButton(0x7f0d0314, this);
            break;

        case 501: 
            k = 0x7f0d01ec;
            builder.setPositiveButton(0x7f0d01e5, this);
            break;

        case 500: 
            k = 0x7f0d01eb;
            builder.setPositiveButton(0x7f0d01e5, this);
            break;

        case 400: 
            k = 0x7f0d01ee;
            j = 0x7f0d01b4;
            builder.setNegativeButton(0x7f0d01e5, this);
            break;

        case 600: 
            k = 0x7f0d01ea;
            j = 0x7f0d01b4;
            builder.setNegativeButton(0x7f0d01e5, this);
            break;

        default:
            k = 0x7f0d01e2;
            builder.setNeutralButton(0x7f0d01e5, this);
            break;
        }
        builder.setTitle(getText(j));
        builder.setMessage(getText(k).toString());
        builder.setCancelable(false);
        AlertDialog alertdialog = builder.create();
        alertdialog.getWindow().addFlags(4);
        return alertdialog;
    }

    protected void onDestroy()
    {
        super.onDestroy();
        unregisterReceiver(mReceiver);
    }

    public void onDialogClosed(EditPhoneNumberPreference editphonenumberpreference, int i)
    {
        log((new StringBuilder()).append("onPreferenceClick: request preference click on dialog close: ").append(i).toString());
        if (i != -2 && (editphonenumberpreference instanceof EditPhoneNumberPreference) && editphonenumberpreference == mSubMenuVoicemailSettings)
        {
            handleVMBtnClickRequest();
            return;
        } else
        {
            return;
        }
    }

    public String onGetDefaultNumber(EditPhoneNumberPreference editphonenumberpreference)
    {
        if (editphonenumberpreference == mSubMenuVoicemailSettings)
        {
            log("updating default for voicemail dialog");
            updateVoiceNumberField();
            return null;
        }
        String s;
        if (CallSettings.isMultipleSim())
            s = ((GeminiPhone)mPhone).getVoiceMailNumberGemini(mSimId);
        else
            s = mPhone.getVoiceMailNumber();
        if (TextUtils.isEmpty(s))
        {
            return null;
        } else
        {
            log("updating default for call forwarding dialogs");
            log((new StringBuilder()).append("ongetDefaultnumber, vmDisplay:").append(s).toString());
            return (new StringBuilder()).append(getString(0x7f0d01b5)).append(" ").append(s).toString();
        }
    }

    protected void onNewIntent(Intent intent)
    {
        int i = intent.getIntExtra("simId", -1);
        log((new StringBuilder()).append("onNewIntent newSlotId, oldSlotID ").append(i).append(",").append(mSimId).toString());
        if (i != mSimId)
        {
            startActivity(intent);
            finish();
            return;
        }
        setIntent(intent);
        mSimId = i;
        if (mSimId != -1)
        {
            mInitTitle = intent.getStringExtra("sub_title_name");
            if (mInitTitle == null)
                mInitTitle = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(this, mSimId).mDisplayName;
        }
        if (mInitTitle != null)
            setTitle(mInitTitle);
        if (mSubMenuVoicemailSettings != null)
        {
            mSubMenuVoicemailSettings.setParentActivity(this, 1, this);
            mSubMenuVoicemailSettings.setDialogOnClosedListener(this);
            mSubMenuVoicemailSettings.setDialogTitle(0x7f0d02b9);
        }
        if (mVoicemailProviders != null)
        {
            mVoicemailProviders.setOnPreferenceChangeListener(this);
            mVoicemailSettings = (PreferenceScreen)findPreference("button_voicemail_setting_key");
            if (CallSettings.isMultipleSim())
                mVoicemailProviders.setKey((new StringBuilder()).append("button_voicemail_provider_key").append(mSimId).toString());
            initVoiceMailProviders();
        }
        updateVoiceNumberField();
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 16908332: 
            finish();
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public void onPause()
    {
        super.onPause();
        mForeground = false;
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        String s;
        String s1;
label0:
        {
            if (preference == mVoicemailProviders)
            {
                s = getCurrentVoicemailProviderKey();
                mPreviousVMProviderKey = s;
                s1 = (String)obj;
                log((new StringBuilder()).append("VM provider changes to ").append(s1).append(" from ").append(mPreviousVMProviderKey).toString());
                if (!mPreviousVMProviderKey.equals(s1))
                    break label0;
                log("No change ");
            }
            return true;
        }
        if (CallSettings.isMultipleSim())
        {
            android.content.SharedPreferences.Editor editor = PreferenceManager.getDefaultSharedPreferences(getApplicationContext()).edit();
            editor.putString((new StringBuilder()).append("button_voicemail_provider_key").append(mSimId).toString(), s1);
            editor.commit();
        }
        updateVMPreferenceWidgets(s1);
        mPreviousVMProviderKey = s;
        VoiceMailProviderSettings voicemailprovidersettings = loadSettingsForVoiceMailProvider(s1);
        if (voicemailprovidersettings == null)
        {
            log("Saved preferences not found - invoking config");
            mVMProviderSettingsForced = true;
            return true;
        } else
        {
            log("Saved preferences found - switching to them");
            mChangingVMorFwdDueToProviderChange = true;
            saveVoiceMailAndForwardingNumber(s1, voicemailprovidersettings);
            return true;
        }
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference == mVoicemailSettings && preference.getIntent() != null)
        {
            log((new StringBuilder()).append("Invoking cfg intent ").append(preference.getIntent().getPackage()).toString());
            startActivityForResult(preference.getIntent(), 2);
            return true;
        } else
        {
            return false;
        }
    }

    protected void onPrepareDialog(int i, Dialog dialog)
    {
        super.onPrepareDialog(i, dialog);
        mCurrentDialogId = i;
    }

    public void onResume()
    {
        super.onResume();
        updateVoiceNumberField();
        mForeground = true;
    }

    void onRevertDone()
    {
        log((new StringBuilder()).append("Flipping provider key back to ").append(mPreviousVMProviderKey).toString());
        mVoicemailProviders.setValue(mPreviousVMProviderKey);
        updateVMPreferenceWidgets(mPreviousVMProviderKey);
        updateVoiceNumberField();
        if (mVMOrFwdSetError != 0)
        {
            showVMDialog(mVMOrFwdSetError);
            mVMOrFwdSetError = 0;
        }
    }

    void setVMNumberWithCarrier()
    {
        log((new StringBuilder()).append("save voicemail #: ").append(mNewVMNumber).toString());
        if (CallSettings.isMultipleSim())
        {
            ((GeminiPhone)mPhone).setVoiceMailNumberGemini(((GeminiPhone)mPhone).getVoiceMailAlphaTagGemini(mSimId).toString(), mNewVMNumber, Message.obtain(mSetOptionComplete, 500), mSimId);
            return;
        } else
        {
            mPhone.setVoiceMailNumber(mPhone.getVoiceMailAlphaTag().toString(), mNewVMNumber, Message.obtain(mSetOptionComplete, 500));
            return;
        }
    }

    public void startActivityForResult(Intent intent, int i)
    {
        if (i == -1)
        {
            super.startActivityForResult(intent, i);
            return;
        } else
        {
            log("startSubActivity: starting requested subactivity");
            super.startActivityForResult(intent, i);
            return;
        }
    }









}
