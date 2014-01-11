// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.*;
import android.content.*;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.preference.*;
import android.telephony.PhoneNumberUtils;
import android.text.*;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.*;
import com.android.internal.telephony.*;
import com.mediatek.phone.DualTalkUtils;
import com.mediatek.phone.gemini.GeminiUtils;
import com.mediatek.settings.OthersSettings;
import java.util.Arrays;

// Referenced classes of package com.android.phone:
//            PhoneUtils, InCallScreen, PhoneGlobals, CallNotifier

public class RespondViaSmsManager
{
    public class RespondViaSmsCancelListener
        implements android.content.DialogInterface.OnCancelListener, android.content.DialogInterface.OnDismissListener
    {

        final RespondViaSmsManager this$0;

        public void onCancel(DialogInterface dialoginterface)
        {
            RespondViaSmsManager.log("RespondViaSmsCancelListener.onCancel()...");
            dismissPopup();
            if (PhoneGlobals.getInstance().mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
            {
                PhoneGlobals.getInstance().dismissCallScreen();
                return;
            } else
            {
                PhoneGlobals.getInstance().notifier.restartRinger();
                mInCallScreen.requestUpdateScreen();
                return;
            }
        }

        public void onDismiss(DialogInterface dialoginterface)
        {
            RespondViaSmsManager.log("RespondViaSmsCancelListener.onDismiss()...");
            if (PhoneGlobals.getInstance().mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
            {
                PhoneGlobals.getInstance().mCM.clearDisconnected();
                RespondViaSmsManager.log("- onDismiss: clear disconnected.");
                if (mInCallScreen != null)
                {
                    mInCallScreen.finish();
                    RespondViaSmsManager.log("- onDismiss: finish...");
                }
            }
        }

        public RespondViaSmsCancelListener()
        {
            this$0 = RespondViaSmsManager.this;
            super();
        }
    }

    public class RespondViaSmsItemClickListener
        implements android.widget.AdapterView.OnItemClickListener
    {

        private String mPhoneNumber;
        final RespondViaSmsManager this$0;

        public void onItemClick(AdapterView adapterview, View view, int i, long l)
        {
            RespondViaSmsManager.log((new StringBuilder()).append("RespondViaSmsItemClickListener.onItemClick(").append(i).append(")...").toString());
            String s = (String)adapterview.getItemAtPosition(i);
            RespondViaSmsManager.log((new StringBuilder()).append("- message: '").append(s).append("'").toString());
            if (i == -1 + adapterview.getCount())
            {
                launchSmsCompose(mPhoneNumber);
            } else
            {
                sendText(mPhoneNumber, s);
                String s1 = mInCallScreen.getResources().getString(0x7f0d037f);
                Object aobj[] = new Object[1];
                aobj[0] = mPhoneNumber;
                String s2 = String.format(s1, aobj);
                Toast.makeText(mInCallScreen, s2, 1).show();
            }
            if (!DualTalkUtils.isSupportDualTalk() || DualTalkUtils.getInstance().hasMultipleRingingCall() || -1 == mOldSoltId || mOldSoltId == getSendTextSimId())
                mInCallScreen.hangupRingingCall();
            dismissPopup();
            if (PhoneGlobals.getInstance().mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
            {
                PhoneGlobals.getInstance().dismissCallScreen();
                return;
            } else
            {
                mInCallScreen.requestUpdateScreen();
                return;
            }
        }

        public RespondViaSmsItemClickListener(String s)
        {
            this$0 = RespondViaSmsManager.this;
            super();
            mPhoneNumber = s;
        }
    }

    public static class Settings extends PreferenceActivity
        implements android.preference.Preference.OnPreferenceChangeListener
    {

        private void initThePreference(EditTextPreference edittextpreference)
        {
            EditText edittext = edittextpreference.getEditText();
            Dialog dialog = edittextpreference.getDialog();
            if (edittext != null || (dialog instanceof AlertDialog))
            {
                Button button = ((AlertDialog)dialog).getButton(-1);
                if (button != null)
                {
                    edittext.addTextChangedListener(button. new TextWatcher() {

                        final Settings this$0;
                        final Button val$button;

                        public void afterTextChanged(Editable editable)
                        {
                            String s = editable.toString();
                            Button button1 = button;
                            boolean flag;
                            if (!s.isEmpty())
                                flag = true;
                            else
                                flag = false;
                            button1.setEnabled(flag);
                        }

                        public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
                        {
                        }

                        public void onTextChanged(CharSequence charsequence, int i, int j, int k)
                        {
                        }

            
            {
                this$0 = final_settings;
                button = Button.this;
                super();
            }
                    }
);
                    return;
                }
            }
        }

        protected void onCreate(Bundle bundle)
        {
            super.onCreate(bundle);
            RespondViaSmsManager.log("Settings: onCreate()...");
            getPreferenceManager().setSharedPreferencesName("respond_via_sms_prefs");
            addPreferencesFromResource(0x7f06001a);
            EditTextPreference edittextpreference = (EditTextPreference)findPreference("canned_response_pref_1");
            edittextpreference.setTitle(edittextpreference.getText());
            edittextpreference.setOnPreferenceChangeListener(this);
            EditTextPreference edittextpreference1 = (EditTextPreference)findPreference("canned_response_pref_2");
            edittextpreference1.setTitle(edittextpreference1.getText());
            edittextpreference1.setOnPreferenceChangeListener(this);
            EditTextPreference edittextpreference2 = (EditTextPreference)findPreference("canned_response_pref_3");
            edittextpreference2.setTitle(edittextpreference2.getText());
            edittextpreference2.setOnPreferenceChangeListener(this);
            EditTextPreference edittextpreference3 = (EditTextPreference)findPreference("canned_response_pref_4");
            edittextpreference3.setTitle(edittextpreference3.getText());
            edittextpreference3.setOnPreferenceChangeListener(this);
            ActionBar actionbar = getActionBar();
            if (actionbar != null)
                actionbar.setDisplayHomeAsUpEnabled(true);
        }

        public boolean onOptionsItemSelected(MenuItem menuitem)
        {
            if (menuitem.getItemId() == 0x102002c)
            {
                OthersSettings.goUpToTopLevelSetting(this);
                return true;
            } else
            {
                return super.onOptionsItemSelected(menuitem);
            }
        }

        public boolean onPreferenceChange(Preference preference, Object obj)
        {
            RespondViaSmsManager.log((new StringBuilder()).append("onPreferenceChange: key = ").append(preference.getKey()).toString());
            RespondViaSmsManager.log((new StringBuilder()).append("  preference = '").append(preference).append("'").toString());
            RespondViaSmsManager.log((new StringBuilder()).append("  newValue = '").append(obj).append("'").toString());
            ((EditTextPreference)preference).setTitle((String)obj);
            return true;
        }

        public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
        {
            super.onPreferenceTreeClick(preferencescreen, preference);
            if (preference instanceof EditTextPreference)
                initThePreference((EditTextPreference)preference);
            return true;
        }

    }


    private static final String ACTION_SENDTO_NO_CONFIRMATION = "com.android.mms.intent.action.SENDTO_NO_CONFIRMATION";
    private static final boolean DBG = true;
    private static final String KEY_CANNED_RESPONSE_PREF_1 = "canned_response_pref_1";
    private static final String KEY_CANNED_RESPONSE_PREF_2 = "canned_response_pref_2";
    private static final String KEY_CANNED_RESPONSE_PREF_3 = "canned_response_pref_3";
    private static final String KEY_CANNED_RESPONSE_PREF_4 = "canned_response_pref_4";
    private static final int NUM_CANNED_RESPONSES = 4;
    private static final String SHARED_PREFERENCES_NAME = "respond_via_sms_prefs";
    private static final String TAG = "RespondViaSmsManager";
    private static final boolean VDBG = true;
    private String mCannedResponses[];
    private InCallScreen mInCallScreen;
    private int mOldSoltId;
    private Dialog mPopup;

    public RespondViaSmsManager()
    {
        mOldSoltId = -1;
    }

    public static boolean allowRespondViaSmsForCall(Context context, Call call)
    {
        log((new StringBuilder()).append("allowRespondViaSmsForCall(").append(call).append(")...").toString());
        if (call == null)
        {
            Log.w("RespondViaSmsManager", "allowRespondViaSmsForCall: null ringingCall!");
        } else
        {
            if (!call.isRinging())
            {
                Log.w("RespondViaSmsManager", (new StringBuilder()).append("allowRespondViaSmsForCall: ringingCall not ringing! state = ").append(call.getState()).toString());
                return false;
            }
            Connection connection = call.getLatestConnection();
            if (connection == null)
            {
                Log.w("RespondViaSmsManager", "allowRespondViaSmsForCall: null Connection!");
                return false;
            }
            String s = connection.getAddress();
            log((new StringBuilder()).append("- number: '").append(s).append("'").toString());
            if (TextUtils.isEmpty(s))
            {
                Log.w("RespondViaSmsManager", "allowRespondViaSmsForCall: no incoming number!");
                return false;
            }
            if (PhoneNumberUtils.isUriNumber(s))
            {
                Log.i("RespondViaSmsManager", "allowRespondViaSmsForCall: incoming 'number' is a SIP address.");
                return false;
            }
            int i = connection.getNumberPresentation();
            log((new StringBuilder()).append("- presentation: ").append(i).toString());
            if (i == PhoneConstants.PRESENTATION_RESTRICTED)
            {
                Log.i("RespondViaSmsManager", "allowRespondViaSmsForCall: PRESENTATION_RESTRICTED.");
                return false;
            }
            if (PhoneUtils.isDMLocked())
            {
                Log.i("RespondViaSmsManager", "allowRespondViaSmsForCall: isDMLocked.");
                return false;
            }
            if (context.getPackageManager().resolveService(getInstantTextIntent(s, null), 0) != null)
                return true;
        }
        return false;
    }

    private static Intent getInstantTextIntent(String s, String s1)
    {
        Intent intent = new Intent("com.android.mms.intent.action.SENDTO_NO_CONFIRMATION", Uri.fromParts("smsto", s, null));
        if (s1 != null)
        {
            intent.putExtra("android.intent.extra.TEXT", s1);
            return intent;
        } else
        {
            intent.putExtra("exit_on_sent", true);
            intent.putExtra("showUI", true);
            return intent;
        }
    }

    private void launchSmsCompose(String s)
    {
        log((new StringBuilder()).append("launchSmsCompose: number ").append(s).toString());
        Intent intent = getInstantTextIntent(s, null);
        if (GeminiUtils.isGeminiSupport())
            if (-1 != mOldSoltId)
                intent.putExtra("simId", mOldSoltId);
            else
                intent.putExtra("simId", getSendTextSimId());
        log((new StringBuilder()).append("- Launching SMS compose UI: ").append(intent).toString());
        mInCallScreen.startService(intent);
    }

    private String[] loadCannedResponses()
    {
        log("loadCannedResponses()...");
        SharedPreferences sharedpreferences = mInCallScreen.getSharedPreferences("respond_via_sms_prefs", 0);
        Resources resources = mInCallScreen.getResources();
        String as[] = new String[4];
        as[0] = sharedpreferences.getString("canned_response_pref_1", resources.getString(0x7f0d0376));
        as[1] = sharedpreferences.getString("canned_response_pref_2", resources.getString(0x7f0d0377));
        as[2] = sharedpreferences.getString("canned_response_pref_3", resources.getString(0x7f0d0378));
        as[3] = sharedpreferences.getString("canned_response_pref_4", resources.getString(0x7f0d0379));
        return as;
    }

    private static void log(String s)
    {
        Log.d("RespondViaSmsManager", s);
    }

    private void sendText(String s, String s1)
    {
        log((new StringBuilder()).append("sendText: number ").append(s).append(", message '").append(s1).append("'").toString());
        Intent intent = new Intent("com.android.mms.intent.action.SENDTO_NO_CONFIRMATION", Uri.fromParts("smsto", s, null));
        intent.putExtra("android.intent.extra.TEXT", s1);
        if (GeminiUtils.isGeminiSupport())
            if (-1 != mOldSoltId)
                intent.putExtra("simId", mOldSoltId);
            else
                intent.putExtra("simId", getSendTextSimId());
        mInCallScreen.startService(intent);
    }

    public void dismissPopup()
    {
        if (mPopup != null)
        {
            mPopup.dismiss();
            mPopup = null;
            mOldSoltId = -1;
        }
    }

    protected int getSendTextSimId()
    {
        Call call = PhoneGlobals.getInstance().mCM.getFirstActiveRingingCall();
        if (DualTalkUtils.isSupportDualTalk())
        {
            Call call1 = DualTalkUtils.getInstance().getFirstActiveRingingCall();
            if (call1 != null && com.android.internal.telephony.Call.State.DISCONNECTED != call1.getState())
                call = call1;
        }
        android.provider.Telephony.SIMInfo siminfo = PhoneUtils.getSimInfoByCall(call);
        int i = 0;
        int j = 0;
        if (siminfo != null)
        {
            i = (int)siminfo.mSimId;
            j = siminfo.mSlot;
        }
        log((new StringBuilder()).append("getSendTextSimId, slot = ").append(j).append(" id = ").append(i).toString());
        return i;
    }

    public boolean isShowingPopup()
    {
        return mPopup != null && mPopup.isShowing();
    }

    public void setInCallScreenInstance(InCallScreen incallscreen)
    {
        mInCallScreen = incallscreen;
        if (mInCallScreen != null)
            mInCallScreen.getSharedPreferences("respond_via_sms_prefs", 0);
    }

    protected boolean shouldDismissInCallScreen()
    {
        CallManager callmanager = PhoneGlobals.getInstance().mCM;
        return !callmanager.hasActiveFgCall() && !callmanager.hasActiveBgCall() && callmanager.getState() != com.android.internal.telephony.PhoneConstants.State.RINGING;
    }

    public void showRespondViaSmsPopup(Call call)
    {
        log("showRespondViaSmsPopup()...");
        ListView listview = new ListView(mInCallScreen);
        mCannedResponses = loadCannedResponses();
        int i = 1 + mCannedResponses.length;
        String as[] = (String[])Arrays.copyOf(mCannedResponses, i);
        as[i - 1] = mInCallScreen.getResources().getString(0x7f0d037a);
        listview.setAdapter(new ArrayAdapter(mInCallScreen, 0x1090003, 0x1020014, as));
        Connection connection = call.getLatestConnection();
        log((new StringBuilder()).append("- connection: ").append(connection).toString());
        if (connection == null)
        {
            Log.i("RespondViaSmsManager", "showRespondViaSmsPopup: null connection; bailing out...");
            return;
        }
        String s = connection.getAddress();
        log((new StringBuilder()).append("- phoneNumber: ").append(s).toString());
        listview.setOnItemClickListener(new RespondViaSmsItemClickListener(s));
        if (isShowingPopup())
            dismissPopup();
        if (DualTalkUtils.isSupportDualTalk() && DualTalkUtils.getInstance().hasMultipleRingingCall())
            mOldSoltId = getSendTextSimId();
        RespondViaSmsCancelListener respondviasmscancellistener = new RespondViaSmsCancelListener();
        mPopup = (new android.app.AlertDialog.Builder(mInCallScreen)).setCancelable(true).setOnCancelListener(respondviasmscancellistener).setView(listview).create();
        mPopup.show();
        mPopup.setOnDismissListener(respondviasmscancellistener);
    }





}
