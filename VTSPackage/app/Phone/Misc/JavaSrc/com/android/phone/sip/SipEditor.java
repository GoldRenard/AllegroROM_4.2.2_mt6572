// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone.sip;

import android.app.ActionBar;
import android.content.Intent;
import android.net.sip.SipManager;
import android.net.sip.SipProfile;
import android.os.Bundle;
import android.preference.*;
import android.text.TextUtils;
import android.util.Log;
import android.view.*;
import android.widget.Button;
import android.widget.Toast;
import com.android.internal.telephony.CallManager;
import com.android.phone.SipUtil;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Arrays;

// Referenced classes of package com.android.phone.sip:
//            SipSharedPreferences, SipProfileDb, SipSettings

public class SipEditor extends PreferenceActivity
    implements android.preference.Preference.OnPreferenceChangeListener
{
    private class AdvancedSettings
        implements android.preference.Preference.OnPreferenceClickListener
    {

        private Preference mAdvancedSettingsTrigger;
        private Preference mPreferences[];
        private boolean mShowing;
        final SipEditor this$0;

        private void hide()
        {
            mShowing = false;
            mAdvancedSettingsTrigger.setSummary(0x7f0d035c);
            PreferenceScreen preferencescreen = getPreferenceScreen();
            Preference apreference[] = mPreferences;
            int i = apreference.length;
            for (int j = 0; j < i; j++)
                preferencescreen.removePreference(apreference[j]);

        }

        private void loadAdvancedPreferences()
        {
            PreferenceScreen preferencescreen = getPreferenceScreen();
            addPreferencesFromResource(0x7f06001c);
            PreferenceGroup preferencegroup = (PreferenceGroup)preferencescreen.findPreference(getString(0x7f0d0373));
            preferencescreen.removePreference(preferencegroup);
            mPreferences = new Preference[preferencegroup.getPreferenceCount()];
            int i = preferencescreen.getPreferenceCount();
            int j = 0;
            int k = mPreferences.length;
            int i1;
            for (int l = i; j < k; l = i1)
            {
                Preference preference = preferencegroup.getPreference(j);
                i1 = l + 1;
                preference.setOrder(l);
                setupPreference(preference);
                mPreferences[j] = preference;
                j++;
            }

        }

        public boolean onPreferenceClick(Preference preference)
        {
            Log.v(SipEditor.TAG, "optional settings clicked");
            if (!mShowing)
                show();
            else
                hide();
            return true;
        }

        void show()
        {
            mShowing = true;
            mAdvancedSettingsTrigger.setSummary(0x7f0d035d);
            PreferenceScreen preferencescreen = getPreferenceScreen();
            Preference apreference[] = mPreferences;
            int i = apreference.length;
            for (int j = 0; j < i; j++)
            {
                Preference preference = apreference[j];
                preferencescreen.addPreference(preference);
                Log.v(SipEditor.TAG, (new StringBuilder()).append("add pref ").append(preference.getKey()).append(": order=").append(preference.getOrder()).toString());
            }

        }

        AdvancedSettings()
        {
            this$0 = SipEditor.this;
            super();
            mShowing = false;
            mAdvancedSettingsTrigger = getPreferenceScreen().findPreference(getString(0x7f0d0354));
            mAdvancedSettingsTrigger.setOnPreferenceClickListener(this);
            loadAdvancedPreferences();
        }
    }

    static final class PreferenceKey extends Enum
    {

        private static final PreferenceKey $VALUES[];
        public static final PreferenceKey AuthUserName;
        public static final PreferenceKey DisplayName;
        public static final PreferenceKey DomainAddress;
        public static final PreferenceKey Password;
        public static final PreferenceKey Port;
        public static final PreferenceKey ProxyAddress;
        public static final PreferenceKey SendKeepAlive;
        public static final PreferenceKey Transport;
        public static final PreferenceKey Username;
        final int mDefaultSummary;
        final int mInitValue;
        Preference mPreference;
        final int mText;

        public static PreferenceKey valueOf(String s)
        {
            return (PreferenceKey)Enum.valueOf(com/android/phone/sip/SipEditor$PreferenceKey, s);
        }

        public static PreferenceKey[] values()
        {
            return (PreferenceKey[])$VALUES.clone();
        }

        String getValue()
        {
            if (mPreference instanceof EditTextPreference)
                return ((EditTextPreference)mPreference).getText();
            if (mPreference instanceof ListPreference)
                return ((ListPreference)mPreference).getValue();
            else
                throw new RuntimeException((new StringBuilder()).append("getValue() for the preference ").append(this).toString());
        }

        void setValue(String s)
        {
            if (mPreference instanceof EditTextPreference)
            {
                String s1 = getValue();
                ((EditTextPreference)mPreference).setText(s);
                if (this != Password)
                    Log.v(SipEditor.TAG, (new StringBuilder()).append(this).append(": setValue() ").append(s).append(": ").append(s1).append(" --> ").append(getValue()).toString());
            } else
            if (mPreference instanceof ListPreference)
                ((ListPreference)mPreference).setValue(s);
            if (TextUtils.isEmpty(s))
            {
                mPreference.setSummary(mDefaultSummary);
                return;
            }
            if (this == Password)
            {
                mPreference.setSummary(SipEditor.scramble(s));
                return;
            }
            if (this == DisplayName && s.equals(SipEditor.getDefaultDisplayName()))
            {
                mPreference.setSummary(mDefaultSummary);
                return;
            } else
            {
                mPreference.setSummary(s);
                return;
            }
        }

        static 
        {
            Username = new PreferenceKey("Username", 0, 0x7f0d036b, 0, 0x7f0d0357);
            Password = new PreferenceKey("Password", 1, 0x7f0d036c, 0, 0x7f0d0357);
            DomainAddress = new PreferenceKey("DomainAddress", 2, 0x7f0d036a, 0, 0x7f0d0357);
            DisplayName = new PreferenceKey("DisplayName", 3, 0x7f0d036d, 0, 0x7f0d0358);
            ProxyAddress = new PreferenceKey("ProxyAddress", 4, 0x7f0d036e, 0, 0x7f0d0359);
            Port = new PreferenceKey("Port", 5, 0x7f0d036f, 0x7f0d035a, 0x7f0d035a);
            Transport = new PreferenceKey("Transport", 6, 0x7f0d0370, 0x7f0d035b, 0);
            SendKeepAlive = new PreferenceKey("SendKeepAlive", 7, 0x7f0d0371, 0x7f0d0365, 0);
            AuthUserName = new PreferenceKey("AuthUserName", 8, 0x7f0d0374, 0, 0x7f0d0359);
            PreferenceKey apreferencekey[] = new PreferenceKey[9];
            apreferencekey[0] = Username;
            apreferencekey[1] = Password;
            apreferencekey[2] = DomainAddress;
            apreferencekey[3] = DisplayName;
            apreferencekey[4] = ProxyAddress;
            apreferencekey[5] = Port;
            apreferencekey[6] = Transport;
            apreferencekey[7] = SendKeepAlive;
            apreferencekey[8] = AuthUserName;
            $VALUES = apreferencekey;
        }

        private PreferenceKey(String s, int i, int j, int k, int l)
        {
            super(s, i);
            mText = j;
            mInitValue = k;
            mDefaultSummary = l;
        }
    }

    private class PrimaryAccountSelector
    {

        private CheckBoxPreference mCheckbox;
        private final boolean mWasPrimaryAccount;
        final SipEditor this$0;

        void commit(SipProfile sipprofile)
        {
            if (sipprofile != null && mCheckbox.isChecked())
                mSharedPreferences.setPrimaryAccount(sipprofile.getUriString());
            else
            if (mWasPrimaryAccount)
                mSharedPreferences.unsetPrimaryAccount();
            Log.d(SipEditor.TAG, (new StringBuilder()).append(" primary account changed to : ").append(mSharedPreferences.getPrimaryAccount()).toString());
        }

        boolean isSelected()
        {
            return mCheckbox.isChecked();
        }

        PrimaryAccountSelector(SipProfile sipprofile)
        {
            CheckBoxPreference checkboxpreference;
            boolean flag3;
label0:
            {
                this$0 = SipEditor.this;
                super();
                mCheckbox = (CheckBoxPreference)getPreferenceScreen().findPreference(getString(0x7f0d0372));
                boolean flag;
                if (!mSharedPreferences.hasPrimaryAccount())
                    flag = true;
                else
                    flag = false;
                boolean flag1;
                if (sipprofile == null)
                    flag1 = true;
                else
                    flag1 = false;
                boolean flag2;
                if (!flag1 && mSharedPreferences.isPrimaryAccount(sipprofile.getUriString()))
                    flag2 = true;
                else
                    flag2 = false;
                mWasPrimaryAccount = flag2;
                Log.v(SipEditor.TAG, (new StringBuilder()).append(" noPrimaryAccountSet: ").append(flag).toString());
                Log.v(SipEditor.TAG, (new StringBuilder()).append(" editNewProfile: ").append(flag1).toString());
                Log.v(SipEditor.TAG, (new StringBuilder()).append(" mWasPrimaryAccount: ").append(mWasPrimaryAccount).toString());
                checkboxpreference = mCheckbox;
                if (!mWasPrimaryAccount)
                {
                    flag3 = false;
                    if (!flag1)
                        break label0;
                    flag3 = false;
                    if (!flag)
                        break label0;
                }
                flag3 = true;
            }
            checkboxpreference.setChecked(flag3);
        }
    }


    private static final String GET_METHOD_PREFIX = "get";
    private static final String KEY_PROFILE = "profile";
    private static final int MENU_DISCARD = 2;
    private static final int MENU_REMOVE = 3;
    private static final int MENU_SAVE = 1;
    private static final int NA = 0;
    private static final char SCRAMBLED = 42;
    private static final String TAG = com/android/phone/sip/SipEditor.getSimpleName();
    private AdvancedSettings mAdvancedSettings;
    private CallManager mCallManager;
    private boolean mDisplayNameSet;
    private boolean mHomeButtonClicked;
    private SipProfile mOldProfile;
    private PrimaryAccountSelector mPrimaryAccountSelector;
    private SipProfileDb mProfileDb;
    private Button mRemoveButton;
    private SipSharedPreferences mSharedPreferences;
    private SipManager mSipManager;
    private boolean mUpdateRequired;
    private boolean mUpdatedFieldIsEmpty;


    private void checkIfDisplayNameSet()
    {
        String s = PreferenceKey.DisplayName.getValue();
        boolean flag;
        if (!TextUtils.isEmpty(s) && !s.equals(getDefaultDisplayName()))
            flag = true;
        else
            flag = false;
        mDisplayNameSet = flag;
        Log.d(TAG, (new StringBuilder()).append("displayName set? ").append(mDisplayNameSet).toString());
        if (mDisplayNameSet)
        {
            PreferenceKey.DisplayName.mPreference.setSummary(s);
            return;
        } else
        {
            PreferenceKey.DisplayName.setValue("");
            return;
        }
    }

    private SipProfile createSipProfile()
        throws Exception
    {
        return (new android.net.sip.SipProfile.Builder(PreferenceKey.Username.getValue(), PreferenceKey.DomainAddress.getValue())).setProfileName(getProfileName()).setPassword(PreferenceKey.Password.getValue()).setOutboundProxy(PreferenceKey.ProxyAddress.getValue()).setProtocol(PreferenceKey.Transport.getValue()).setDisplayName(PreferenceKey.DisplayName.getValue()).setPort(Integer.parseInt(PreferenceKey.Port.getValue())).setSendKeepAlive(isAlwaysSendKeepAlive()).setAutoRegistration(mSharedPreferences.isReceivingCallsEnabled()).setAuthUserName(PreferenceKey.AuthUserName.getValue()).build();
    }

    private void deleteAndUnregisterProfile(SipProfile sipprofile)
    {
        if (sipprofile == null)
        {
            return;
        } else
        {
            mProfileDb.deleteProfile(sipprofile);
            unregisterProfile(sipprofile.getUriString());
            return;
        }
    }

    private static String getDefaultDisplayName()
    {
        return PreferenceKey.Username.getValue();
    }

    private PreferenceKey getPreferenceKey(Preference preference)
    {
        PreferenceKey apreferencekey[] = PreferenceKey.values();
        int i = apreferencekey.length;
        for (int j = 0; j < i; j++)
        {
            PreferenceKey preferencekey = apreferencekey[j];
            if (preferencekey.mPreference == preference)
                return preferencekey;
        }

        throw new RuntimeException("not possible to reach here");
    }

    private String getProfileName()
    {
        return (new StringBuilder()).append(PreferenceKey.Username.getValue()).append("@").append(PreferenceKey.DomainAddress.getValue()).toString();
    }

    private boolean isAlwaysSendKeepAlive()
    {
        ListPreference listpreference = (ListPreference)PreferenceKey.SendKeepAlive.mPreference;
        return getString(0x7f0d0366).equals(listpreference.getValue());
    }

    private boolean isEditTextEmpty(PreferenceKey preferencekey)
    {
        EditTextPreference edittextpreference = (EditTextPreference)preferencekey.mPreference;
        return TextUtils.isEmpty(edittextpreference.getText()) || edittextpreference.getSummary().equals(getString(preferencekey.mDefaultSummary));
    }

    private void loadPreferencesFromProfile(SipProfile sipprofile)
    {
        if (sipprofile == null) goto _L2; else goto _L1
_L1:
        int l;
        Object obj;
        String s;
        int i1;
        Log.v(TAG, (new StringBuilder()).append("Edit the existing profile : ").append(sipprofile.getProfileName()).toString());
        PreferenceKey apreferencekey1[];
        int k;
        PreferenceKey preferencekey1;
        Method method;
        try
        {
            apreferencekey1 = PreferenceKey.values();
            k = apreferencekey1.length;
        }
        catch (Exception exception)
        {
            Log.e(TAG, "Can not load pref from profile", exception);
            return;
        }
        l = 0;
_L12:
        if (l >= k) goto _L4; else goto _L3
_L3:
        preferencekey1 = apreferencekey1[l];
        method = android/net/sip/SipProfile.getMethod((new StringBuilder()).append("get").append(getString(preferencekey1.mText)).toString(), (Class[])null);
        if (preferencekey1 != PreferenceKey.SendKeepAlive) goto _L6; else goto _L5
_L5:
        if (((Boolean)method.invoke(sipprofile, (Object[])null)).booleanValue())
            i1 = 0x7f0d0366;
        else
            i1 = 0x7f0d0365;
        preferencekey1.setValue(getString(i1));
          goto _L7
_L6:
        obj = method.invoke(sipprofile, (Object[])null);
        if (obj != null) goto _L9; else goto _L8
_L8:
        s = "";
_L10:
        preferencekey1.setValue(s);
          goto _L7
_L9:
        s = obj.toString();
          goto _L10
_L4:
        checkIfDisplayNameSet();
        return;
_L2:
        Log.v(TAG, "Edit a new profile");
        PreferenceKey apreferencekey[] = PreferenceKey.values();
        int i = apreferencekey.length;
        for (int j = 0; j < i; j++)
        {
            PreferenceKey preferencekey = apreferencekey[j];
            preferencekey.mPreference.setOnPreferenceChangeListener(this);
            if (preferencekey.mInitValue != 0)
                preferencekey.setValue(getString(preferencekey.mInitValue));
        }

        mDisplayNameSet = false;
        return;
_L7:
        l++;
        if (true) goto _L12; else goto _L11
_L11:
    }

    private void replaceProfile(final SipProfile oldProfile, final SipProfile newProfile)
    {
        (new Thread(new Runnable() {

            final SipEditor this$0;
            final SipProfile val$newProfile;
            final SipProfile val$oldProfile;

            public void run()
            {
                try
                {
                    if (newProfile != null && mPrimaryAccountSelector.isSelected())
                        unregisterOldPrimaryAccount();
                    mPrimaryAccountSelector.commit(newProfile);
                    deleteAndUnregisterProfile(oldProfile);
                    saveAndRegisterProfile(newProfile);
                    finish();
                    return;
                }
                catch (Exception exception)
                {
                    Log.e(SipEditor.TAG, "Can not save/register new SipProfile", exception);
                    showAlert(exception);
                    return;
                }
            }

            
            {
                this$0 = SipEditor.this;
                newProfile = sipprofile;
                oldProfile = sipprofile1;
                super();
            }
        }
, "SipEditor")).start();
    }

    private void saveAndRegisterProfile(SipProfile sipprofile)
        throws IOException
    {
        if (sipprofile != null)
        {
            mProfileDb.saveProfile(sipprofile);
            if (sipprofile.getAutoRegistration() || mSharedPreferences.isPrimaryAccount(sipprofile.getUriString()))
            {
                try
                {
                    mSipManager.open(sipprofile, SipUtil.createIncomingCallPendingIntent(), null);
                    return;
                }
                catch (Exception exception)
                {
                    Log.e(TAG, (new StringBuilder()).append("register failed: ").append(sipprofile.getUriString()).toString(), exception);
                }
                return;
            }
        }
    }

    private static String scramble(String s)
    {
        char ac[] = new char[s.length()];
        Arrays.fill(ac, '*');
        return new String(ac);
    }

    private void setRemovedProfileAndFinish()
    {
        setResult(1, new Intent(this, com/android/phone/sip/SipSettings));
        Toast.makeText(this, 0x7f0d0335, 0).show();
        replaceProfile(mOldProfile, null);
    }

    private void setupPreference(Preference preference)
    {
        preference.setOnPreferenceChangeListener(this);
        PreferenceKey apreferencekey[] = PreferenceKey.values();
        int i = apreferencekey.length;
        int j = 0;
        do
        {
label0:
            {
                if (j < i)
                {
                    PreferenceKey preferencekey = apreferencekey[j];
                    if (!getString(preferencekey.mText).equals(preference.getKey()))
                        break label0;
                    preferencekey.mPreference = preference;
                }
                return;
            }
            j++;
        } while (true);
    }

    private void showAlert(final String message)
    {
        if (mHomeButtonClicked)
        {
            Log.v(TAG, (new StringBuilder()).append("Home button clicked, don't show dialog: ").append(message).toString());
            return;
        } else
        {
            runOnUiThread(new Runnable() {

                final SipEditor this$0;
                final String val$message;

                public void run()
                {
                    (new android.app.AlertDialog.Builder(SipEditor.this)).setTitle(0x1040014).setIconAttribute(0x1010355).setMessage(message).setPositiveButton(0x7f0d0339, null).show();
                }

            
            {
                this$0 = SipEditor.this;
                message = s;
                super();
            }
            }
);
            return;
        }
    }

    private void showAlert(Throwable throwable)
    {
        String s = throwable.getMessage();
        if (TextUtils.isEmpty(s))
            s = throwable.toString();
        showAlert(s);
    }

    private void unregisterOldPrimaryAccount()
    {
        String s = mSharedPreferences.getPrimaryAccount();
        Log.v(TAG, (new StringBuilder()).append("old primary: ").append(s).toString());
        if (s != null && !mSharedPreferences.isReceivingCallsEnabled())
        {
            Log.v(TAG, (new StringBuilder()).append("unregister old primary: ").append(s).toString());
            unregisterProfile(s);
        }
    }

    private void unregisterProfile(final String uri)
    {
        (new Thread(new Runnable() {

            final SipEditor this$0;
            final String val$uri;

            public void run()
            {
                try
                {
                    mSipManager.close(uri);
                    return;
                }
                catch (Exception exception)
                {
                    Log.e(SipEditor.TAG, (new StringBuilder()).append("unregister failed: ").append(uri).toString(), exception);
                }
            }

            
            {
                this$0 = SipEditor.this;
                uri = s;
                super();
            }
        }
)).start();
    }

    private void validateAndSetResult()
    {
        boolean flag;
        CharSequence charsequence;
        PreferenceKey apreferencekey[];
        int i;
        int j;
        flag = true;
        charsequence = null;
        apreferencekey = PreferenceKey.values();
        i = apreferencekey.length;
        j = 0;
_L9:
        PreferenceKey preferencekey;
        Preference preference;
        if (j >= i)
            break MISSING_BLOCK_LABEL_201;
        preferencekey = apreferencekey[j];
        preference = preferencekey.mPreference;
        if (!(preference instanceof EditTextPreference)) goto _L2; else goto _L1
_L1:
        EditTextPreference edittextpreference;
        boolean flag1;
        edittextpreference = (EditTextPreference)preference;
        flag1 = isEditTextEmpty(preferencekey);
        if (flag && !flag1)
            flag = false;
        if (!flag1) goto _L4; else goto _L3
_L3:
        static class _cls4
        {

            static final int $SwitchMap$com$android$phone$sip$SipEditor$PreferenceKey[];

            static 
            {
                $SwitchMap$com$android$phone$sip$SipEditor$PreferenceKey = new int[PreferenceKey.values().length];
                try
                {
                    $SwitchMap$com$android$phone$sip$SipEditor$PreferenceKey[PreferenceKey.DisplayName.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror) { }
                try
                {
                    $SwitchMap$com$android$phone$sip$SipEditor$PreferenceKey[PreferenceKey.AuthUserName.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror1) { }
                try
                {
                    $SwitchMap$com$android$phone$sip$SipEditor$PreferenceKey[PreferenceKey.ProxyAddress.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror2) { }
                try
                {
                    $SwitchMap$com$android$phone$sip$SipEditor$PreferenceKey[PreferenceKey.Port.ordinal()] = 4;
                }
                catch (NoSuchFieldError nosuchfielderror3)
                {
                    return;
                }
            }
        }

        _cls4..SwitchMap.com.android.phone.sip.SipEditor.PreferenceKey[preferencekey.ordinal()];
        JVM INSTR tableswitch 1 4: default 112
    //                   1 128
    //                   2 122
    //                   3 122
    //                   4 139;
           goto _L5 _L6 _L7 _L7 _L8
_L7:
        break; /* Loop/switch isn't completed */
_L5:
        if (charsequence == null)
            charsequence = edittextpreference.getTitle();
_L2:
        j++;
          goto _L9
_L6:
        edittextpreference.setText(getDefaultDisplayName());
          goto _L2
_L8:
        edittextpreference.setText(getString(0x7f0d035a));
          goto _L2
_L4:
        if (preferencekey != PreferenceKey.Port) goto _L2; else goto _L10
_L10:
        int k = Integer.parseInt(PreferenceKey.Port.getValue());
        if (k >= 1000 && k <= 65534) goto _L2; else goto _L11
_L11:
        showAlert(getString(0x7f0d035f));
        return;
        if (flag || !mUpdateRequired)
        {
            finish();
            return;
        }
        if (charsequence != null)
        {
            showAlert(getString(0x7f0d035e, new Object[] {
                charsequence
            }));
            return;
        }
        try
        {
            if (mOldProfile != null)
                unregisterProfile(mOldProfile.getUriString());
            SipProfile sipprofile = createSipProfile();
            Intent intent = new Intent(this, com/android/phone/sip/SipSettings);
            intent.putExtra("sip_profile", sipprofile);
            setResult(-1, intent);
            Toast.makeText(this, 0x7f0d0334, 0).show();
            replaceProfile(mOldProfile, sipprofile);
            return;
        }
        catch (Exception exception)
        {
            Log.w(TAG, "Can not create new SipProfile", exception);
            showAlert(exception);
            return;
        }
    }

    public void onCreate(Bundle bundle)
    {
        Log.v(TAG, "start profile editor");
        super.onCreate(bundle);
        mSipManager = SipManager.newInstance(this);
        mSharedPreferences = new SipSharedPreferences(this);
        mProfileDb = new SipProfileDb(this);
        mCallManager = CallManager.getInstance();
        setContentView(0x7f04003d);
        addPreferencesFromResource(0x7f06001d);
        android.os.Parcelable parcelable;
        if (bundle == null)
            parcelable = getIntent().getParcelableExtra("sip_profile");
        else
            parcelable = bundle.getParcelable("profile");
        SipProfile sipprofile = (SipProfile)parcelable;
        mOldProfile = sipprofile;
        PreferenceScreen preferencescreen = getPreferenceScreen();
        int i = 0;
        for (int j = preferencescreen.getPreferenceCount(); i < j; i++)
            setupPreference(preferencescreen.getPreference(i));

        if (sipprofile == null)
            preferencescreen.setTitle(0x7f0d0349);
        mAdvancedSettings = new AdvancedSettings();
        mPrimaryAccountSelector = new PrimaryAccountSelector(sipprofile);
        loadPreferencesFromProfile(sipprofile);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        super.onCreateOptionsMenu(menu);
        menu.add(0, 2, 0, 0x7f0d0337).setShowAsAction(1);
        menu.add(0, 1, 0, 0x7f0d0336).setShowAsAction(1);
        menu.add(0, 3, 0, 0x7f0d0332).setShowAsAction(0);
        return true;
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        switch (i)
        {
        case 4: // '\004'
            validateAndSetResult();
            return true;
        }
        return super.onKeyDown(i, keyevent);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 16908332: 
            finish();
            return true;

        case 3: // '\003'
            setRemovedProfileAndFinish();
            return true;

        case 2: // '\002'
            finish();
            return true;

        case 1: // '\001'
            validateAndSetResult();
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public void onPause()
    {
        Log.v(TAG, (new StringBuilder()).append("SipEditor onPause(): finishing? ").append(isFinishing()).toString());
        if (!isFinishing())
        {
            mHomeButtonClicked = true;
            validateAndSetResult();
        }
        super.onPause();
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        if (!mUpdateRequired)
            mUpdateRequired = true;
        if (preference instanceof CheckBoxPreference)
        {
            invalidateOptionsMenu();
            return true;
        }
        String s;
        if (obj == null)
            s = "";
        else
            s = obj.toString();
        if (TextUtils.isEmpty(s))
            preference.setSummary(getPreferenceKey(preference).mDefaultSummary);
        else
        if (preference == PreferenceKey.Password.mPreference)
            preference.setSummary(scramble(s));
        else
            preference.setSummary(s);
        if (preference == PreferenceKey.DisplayName.mPreference)
        {
            ((EditTextPreference)preference).setText(s);
            checkIfDisplayNameSet();
        }
        invalidateOptionsMenu();
        return true;
    }

    public boolean onPrepareOptionsMenu(Menu menu)
    {
        MenuItem menuitem = menu.findItem(3);
        boolean flag;
        if (mOldProfile != null)
            flag = true;
        else
            flag = false;
        menuitem.setVisible(flag);
        menu.findItem(1).setEnabled(mUpdateRequired);
        return super.onPrepareOptionsMenu(menu);
    }

    public void onResume()
    {
        super.onResume();
        mHomeButtonClicked = false;
        if (mCallManager.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
        {
            mAdvancedSettings.show();
            getPreferenceScreen().setEnabled(false);
            if (mRemoveButton != null)
                mRemoveButton.setEnabled(false);
        } else
        {
            getPreferenceScreen().setEnabled(true);
            if (mRemoveButton != null)
            {
                mRemoveButton.setEnabled(true);
                return;
            }
        }
    }












}
