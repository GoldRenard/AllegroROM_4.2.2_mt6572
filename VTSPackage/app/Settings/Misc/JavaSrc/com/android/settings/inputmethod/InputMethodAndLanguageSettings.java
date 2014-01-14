// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.inputmethod;

import android.app.Activity;
import android.content.*;
import android.content.res.*;
import android.database.ContentObserver;
import android.hardware.input.InputManager;
import android.hardware.input.KeyboardLayout;
import android.os.*;
import android.preference.*;
import android.text.TextUtils;
import android.view.InputDevice;
import android.view.inputmethod.InputMethodInfo;
import android.view.inputmethod.InputMethodManager;
import com.android.settings.*;
import com.mediatek.common.voicecommand.IVoiceCommandManager;
import com.mediatek.common.voicecommand.VoiceCommandListener;
import com.mediatek.voicesettings.VoiceUiSwitchPreference;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.android.settings.inputmethod:
//            InputMethodPreference, KeyboardLayoutDialogFragment, InputMethodAndSubtypeUtil, UserDictionaryList, 
//            SpellCheckersPreference

public class InputMethodAndLanguageSettings extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceChangeListener, android.hardware.input.InputManager.InputDeviceListener, KeyboardLayoutDialogFragment.OnSetupKeyboardLayoutsListener
{
    private class SettingsObserver extends ContentObserver
    {

        private Context mContext;
        final InputMethodAndLanguageSettings this$0;

        public void onChange(boolean flag)
        {
            updateCurrentImeName();
        }

        public void pause()
        {
            mContext.getContentResolver().unregisterContentObserver(this);
        }

        public void resume()
        {
            ContentResolver contentresolver = mContext.getContentResolver();
            contentresolver.registerContentObserver(android.provider.Settings.Secure.getUriFor("default_input_method"), false, this);
            contentresolver.registerContentObserver(android.provider.Settings.Secure.getUriFor("selected_input_method_subtype"), false, this);
        }

        public SettingsObserver(Handler handler, Context context)
        {
            this$0 = InputMethodAndLanguageSettings.this;
            super(handler);
            mContext = context;
        }
    }

    private class VoiceCommandCallback extends VoiceCommandListener
    {

        final InputMethodAndLanguageSettings this$0;

        public void onVoiceCommandNotified(int i, int j, Bundle bundle)
        {
            int k = bundle.getInt("Result");
            Xlog.d("InputMethodAndLanguageSettings", (new StringBuilder()).append(" VoiceCommandListener subAction=").append(j).append(" result=").append(k).toString());
            if (j == 1)
                handleVoiceUiApps(k, bundle);
        }

        public VoiceCommandCallback(Context context)
        {
            this$0 = InputMethodAndLanguageSettings.this;
            super(context);
        }
    }

    private class VoiceControlListener
        implements com.mediatek.voicesettings.VoiceUiSwitchPreference.OnCheckedChangeListener
    {

        final InputMethodAndLanguageSettings this$0;

        public boolean onBeforeCheckedChanged(boolean flag)
        {
            Xlog.d("InputMethodAndLanguageSettings", (new StringBuilder()).append("onBeforeCheckedChanged isChecked = ").append(flag).toString());
            boolean flag1 = isAllDisabled(mRawData);
            boolean flag2 = isAllDisabled(mVoiceUiAppStatus);
            if (flag1 && flag2)
            {
                Xlog.d("InputMethodAndLanguageSettings", "can't open switch, because all is off");
                if (flag)
                    return false;
            }
            return true;
        }

        public void onCheckedChanged(boolean flag)
        {
            Xlog.d("InputMethodAndLanguageSettings", (new StringBuilder()).append("onCheckedChanged isChecked = ").append(flag).toString());
            Xlog.d("InputMethodAndLanguageSettings", (new StringBuilder()).append("onCheckedChanged mVoiceUiEnaber = ").append(mVoiceUiEnaber.isChecked()).toString());
            ContentResolver contentresolver = getActivity().getContentResolver();
            int i;
            if (flag)
                i = 1;
            else
                i = 0;
            android.provider.Settings.Secure.putInt(contentresolver, "voice_control_enabled", i);
            boolean flag1 = isAllDisabled(mRawData);
            Xlog.d("InputMethodAndLanguageSettings", (new StringBuilder()).append("isAllOff=").append(flag1).toString());
            boolean flag2;
            if (!flag)
                flag2 = true;
            else
                flag2 = false;
            if (flag1 == flag2)
                return;
            if (!flag)
            {
                Iterator iterator1 = mRawData.keySet().iterator();
                do
                {
                    if (!iterator1.hasNext())
                        break;
                    String s2 = (String)iterator1.next();
                    if (((Integer)mRawData.get(s2)).intValue() == 1)
                    {
                        Xlog.d("InputMethodAndLanguageSettings", (new StringBuilder()).append("status is unchecked, disable process name: ").append(s2).toString());
                        mRawData.put(s2, Integer.valueOf(0));
                    }
                } while (true);
            } else
            {
                Iterator iterator = mVoiceUiAppStatus.keySet().iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    String s1 = (String)iterator.next();
                    if (((Integer)mVoiceUiAppStatus.get(s1)).intValue() == 1)
                    {
                        Xlog.d("InputMethodAndLanguageSettings", (new StringBuilder()).append("status is checked, enable process name: ").append(s1).toString());
                        mRawData.put(s1, Integer.valueOf(1));
                    }
                } while (true);
            }
            String as[] = (String[])mRawData.keySet().toArray(new String[0]);
            int ai[] = new int[as.length];
            for (int j = 0; j < as.length; j++)
                ai[j] = ((Integer)mRawData.get(as[j])).intValue();

            setApps(as, ai);
            StringBuilder stringbuilder = (new StringBuilder()).append("update values ");
            String s;
            if (flag)
                s = "on ";
            else
                s = "off ";
            Xlog.d("InputMethodAndLanguageSettings", stringbuilder.append(s).append(as.toString()).toString());
        }

        private VoiceControlListener()
        {
            this$0 = InputMethodAndLanguageSettings.this;
            super();
        }

    }


    private static final String KEY_CURRENT_INPUT_METHOD = "current_input_method";
    private static final String KEY_INPUT_METHOD_SELECTOR = "input_method_selector";
    private static final String KEY_PHONE_LANGUAGE = "phone_language";
    private static final String KEY_USER_DICTIONARY_SETTINGS = "key_user_dictionary_settings";
    private static final String KEY_VOICE_CATEGORY = "voice_category";
    private static final String KEY_VOICE_UI_ENABLER = "voice_ui_enabler";
    private static final boolean SHOW_INPUT_METHOD_SWITCHER_SETTINGS = false;
    private static final String TAG = "InputMethodAndLanguageSettings";
    private static final String VOICE_CONTROL_ENABLED = "voice_control_enabled";
    private static final String sHardKeyboardKeys[] = {
        "auto_replace", "auto_caps", "auto_punctuate"
    };
    private static final String sSystemSettingNames[] = {
        "auto_replace", "auto_caps", "auto_punctuate"
    };
    private int mDefaultInputMethodSelectorVisibility;
    private PreferenceCategory mGameControllerCategory;
    private Handler mHandler;
    private PreferenceCategory mHardKeyboardCategory;
    private final ArrayList mHardKeyboardPreferenceList = new ArrayList();
    private InputManager mIm;
    private List mImis;
    private InputMethodManager mImm;
    private final ArrayList mInputMethodPreferenceList = new ArrayList();
    private Intent mIntentWaitingForResult;
    private boolean mIsOnlyImeSettings;
    private PreferenceCategory mKeyboardSettingsCategory;
    private Preference mLanguagePref;
    private HashMap mRawData;
    private SettingsObserver mSettingsObserver;
    private ListPreference mShowInputMethodSelectorPref;
    private PreferenceCategory mVoiceCategory;
    private IVoiceCommandManager mVoiceCmdMgr;
    private boolean mVoiceControlEnable;
    private VoiceCommandListener mVoiceListener;
    private HashMap mVoiceUiAppStatus;
    private VoiceUiSwitchPreference mVoiceUiEnaber;

    public InputMethodAndLanguageSettings()
    {
        mDefaultInputMethodSelectorVisibility = 0;
        mVoiceControlEnable = false;
        mVoiceUiAppStatus = new HashMap();
        mRawData = new HashMap();
    }

    private InputMethodPreference getInputMethodPreference(InputMethodInfo inputmethodinfo, int i)
    {
        CharSequence charsequence = inputmethodinfo.loadLabel(getPackageManager());
        String s = inputmethodinfo.getSettingsActivity();
        Intent intent;
        if (!TextUtils.isEmpty(s))
        {
            intent = new Intent("android.intent.action.MAIN");
            intent.setClassName(inputmethodinfo.getPackageName(), s);
        } else
        {
            intent = null;
        }
        InputMethodPreference inputmethodpreference = new InputMethodPreference(this, intent, mImm, inputmethodinfo, i);
        inputmethodpreference.setKey(inputmethodinfo.getId());
        inputmethodpreference.setTitle(charsequence);
        return inputmethodpreference;
    }

    private void handleVoiceUiApps(int i, Bundle bundle)
    {
        Xlog.d("InputMethodAndLanguageSettings", "handleVoiceUiApps");
        if (i != 1)
        {
            Xlog.d("InputMethodAndLanguageSettings", (new StringBuilder()).append("handleVoiceUiApps error = ").append(i).toString());
            return;
        }
        String as[] = bundle.getStringArray("Result_Info");
        int ai[] = bundle.getIntArray("Reslut_INfo1");
        Xlog.d("InputMethodAndLanguageSettings", (new StringBuilder()).append("get process data from framework: ").append(Arrays.toString(as)).toString());
        Xlog.d("InputMethodAndLanguageSettings", (new StringBuilder()).append("get values data from framework: ").append(Arrays.toString(ai)).toString());
label0:
        for (int j = 0; j < as.length; j++)
        {
            String s1 = as[j];
            int i1 = ai[j];
            Iterator iterator1 = mVoiceUiAppStatus.keySet().iterator();
            do
            {
                if (!iterator1.hasNext())
                    continue label0;
                if (((String)iterator1.next()).equals(s1))
                    mRawData.put(s1, Integer.valueOf(i1));
            } while (true);
        }

        if (isAllDisabled(as, ai, (String[])mRawData.keySet().toArray(new String[0])))
        {
            if (mVoiceControlEnable)
            {
                mVoiceControlEnable = false;
                android.provider.Settings.Secure.putInt(getActivity().getContentResolver(), "voice_control_enabled", 0);
            }
        } else
        {
            mVoiceControlEnable = true;
            android.provider.Settings.Secure.putInt(getActivity().getContentResolver(), "voice_control_enabled", 1);
label1:
            for (int k = 0; k < as.length; k++)
            {
                String s = as[k];
                int l = ai[k];
                Iterator iterator = mVoiceUiAppStatus.keySet().iterator();
                do
                {
                    if (!iterator.hasNext())
                        continue label1;
                    if (((String)iterator.next()).equals(s))
                        mVoiceUiAppStatus.put(s, Integer.valueOf(l));
                } while (true);
            }

        }
        Xlog.d("InputMethodAndLanguageSettings", (new StringBuilder()).append("mVoiceUiAppStatus hash map: ").append(mVoiceUiAppStatus.toString()).toString());
        Xlog.d("InputMethodAndLanguageSettings", (new StringBuilder()).append("mVoiceControlEnable=").append(mVoiceControlEnable).toString());
        mVoiceUiEnaber.setChecked(mVoiceControlEnable);
    }

    private boolean hasOnlyOneLanguageInstance(String s, String as[])
    {
        boolean flag = true;
        int i = 0;
        int j = as.length;
        for (int k = 0; k < j; k++)
        {
            String s1 = as[k];
            if (s1.length() > 2 && s1.startsWith(s) && ++i > flag)
                return false;
        }

        if (i != flag)
            flag = false;
        return flag;
    }

    private boolean haveInputDeviceWithVibrator()
    {
        int ai[] = InputDevice.getDeviceIds();
        for (int i = 0; i < ai.length; i++)
        {
            InputDevice inputdevice = InputDevice.getDevice(ai[i]);
            if (inputdevice != null && !inputdevice.isVirtual() && inputdevice.getVibrator().hasVibrator())
                return true;
        }

        return false;
    }

    private boolean isAllDisabled(HashMap hashmap)
    {
        boolean flag = true;
        Iterator iterator = hashmap.values().iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            if (((Integer)iterator.next()).intValue() != 1)
                continue;
            flag = false;
            break;
        } while (true);
        StringBuilder stringbuilder = (new StringBuilder()).append("all app ");
        String s;
        if (flag)
            s = "is";
        else
            s = "is not";
        Xlog.d("InputMethodAndLanguageSettings", stringbuilder.append(s).append(" disabled").toString());
        return flag;
    }

    private boolean isAllDisabled(String as[], int ai[], String as1[])
    {
        HashMap hashmap = new HashMap();
        Xlog.d("InputMethodAndLanguageSettings", Arrays.toString(as));
        Xlog.d("InputMethodAndLanguageSettings", Arrays.toString(ai));
        for (int i = 0; i < as.length; i++)
        {
            String s1 = as[i];
            int j = ai[i];
            int k = as1.length;
            for (int l = 0; l < k; l++)
                if (as1[l].equals(s1))
                    hashmap.put(s1, Integer.valueOf(j));

        }

        Xlog.d("InputMethodAndLanguageSettings", (new StringBuilder()).append("judge is All Disabled ").append(hashmap.toString()).toString());
        for (Iterator iterator = hashmap.keySet().iterator(); iterator.hasNext();)
        {
            String s = (String)iterator.next();
            if (((Integer)hashmap.get(s)).intValue() == 1)
            {
                Xlog.d("InputMethodAndLanguageSettings", (new StringBuilder()).append(s).append(" is ").append("on").toString());
                return false;
            }
        }

        return true;
    }

    private int loadInputMethodSelectorVisibility()
    {
        return android.provider.Settings.Secure.getInt(getContentResolver(), "input_method_selector_visibility", mDefaultInputMethodSelectorVisibility);
    }

    private void saveInputMethodSelectorVisibility(String s)
    {
        try
        {
            int i = Integer.valueOf(s).intValue();
            android.provider.Settings.Secure.putInt(getContentResolver(), "input_method_selector_visibility", i);
            updateInputMethodSelectorSummary(i);
            return;
        }
        catch (NumberFormatException numberformatexception)
        {
            return;
        }
    }

    private void setApps(String as[], int ai[])
    {
        Xlog.d("InputMethodAndLanguageSettings", (new StringBuilder()).append("send command: set apps names ").append(Arrays.toString(as)).toString());
        Xlog.d("InputMethodAndLanguageSettings", (new StringBuilder()).append("send command: set apps values ").append(Arrays.toString(ai)).toString());
        while (as.length != ai.length || mVoiceCmdMgr == null) 
            return;
        Bundle bundle = new Bundle();
        bundle.putStringArray("Send_Info", as);
        bundle.putIntArray("Send_Info1", ai);
        try
        {
            Xlog.d("InputMethodAndLanguageSettings", "send command mainAction = 5 subAction = 2");
            mVoiceCmdMgr.sendCommand(getActivity(), 5, 2, bundle);
            return;
        }
        catch (RemoteException remoteexception)
        {
            Xlog.w("InputMethodAndLanguageSettings", (new StringBuilder()).append("Remote exception error").append(remoteexception.getMessage()).toString());
            remoteexception.printStackTrace();
            return;
        }
        catch (IllegalAccessException illegalaccessexception)
        {
            Xlog.w("InputMethodAndLanguageSettings", (new StringBuilder()).append("IllegalAccessException exception error").append(illegalaccessexception.getMessage()).toString());
            illegalaccessexception.printStackTrace();
            return;
        }
    }

    private void showKeyboardLayoutDialog(String s)
    {
        KeyboardLayoutDialogFragment keyboardlayoutdialogfragment = new KeyboardLayoutDialogFragment(s);
        keyboardlayoutdialogfragment.setTargetFragment(this, 0);
        keyboardlayoutdialogfragment.show(getActivity().getFragmentManager(), "keyboardLayout");
    }

    private void updateActiveInputMethodsSummary()
    {
        Iterator iterator = mInputMethodPreferenceList.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            InputMethodPreference inputmethodpreference = (InputMethodPreference)iterator.next();
            if (inputmethodpreference instanceof InputMethodPreference)
                ((InputMethodPreference)inputmethodpreference).updateSummary();
        } while (true);
        updateCurrentImeName();
    }

    private void updateCurrentImeName()
    {
        Preference preference;
        CharSequence charsequence;
        for (Activity activity = getActivity(); activity == null || mImm == null || ((preference = getPreferenceScreen().findPreference("current_input_method")) == null || TextUtils.isEmpty(charsequence = InputMethodAndSubtypeUtil.getCurrentInputMethodName(activity, getContentResolver(), mImm, mImis, getPackageManager())));)
            return;

        this;
        JVM INSTR monitorenter ;
        preference.setSummary(charsequence);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void updateGameControllers()
    {
        boolean flag = true;
        if (haveInputDeviceWithVibrator())
        {
            getPreferenceScreen().addPreference(mGameControllerCategory);
            CheckBoxPreference checkboxpreference = (CheckBoxPreference)mGameControllerCategory.findPreference("vibrate_input_devices");
            if (android.provider.Settings.System.getInt(getContentResolver(), "vibrate_input_devices", flag) <= 0)
                flag = false;
            checkboxpreference.setChecked(flag);
            return;
        } else
        {
            getPreferenceScreen().removePreference(mGameControllerCategory);
            return;
        }
    }

    private void updateHardKeyboards()
    {
        mHardKeyboardPreferenceList.clear();
        if (getResources().getConfiguration().keyboard == 2)
        {
            int ai[] = InputDevice.getDeviceIds();
            for (int i1 = 0; i1 < ai.length; i1++)
            {
                InputDevice inputdevice = InputDevice.getDevice(ai[i1]);
                if (inputdevice == null || inputdevice.isVirtual() || !inputdevice.isFullKeyboard())
                    continue;
                final String inputDeviceDescriptor = inputdevice.getDescriptor();
                String s = mIm.getCurrentKeyboardLayoutForInputDevice(inputDeviceDescriptor);
                KeyboardLayout keyboardlayout;
                if (s != null)
                    keyboardlayout = mIm.getKeyboardLayout(s);
                else
                    keyboardlayout = null;
                PreferenceScreen preferencescreen = new PreferenceScreen(getActivity(), null);
                preferencescreen.setTitle(inputdevice.getName());
                if (keyboardlayout != null)
                    preferencescreen.setSummary(keyboardlayout.toString());
                else
                    preferencescreen.setSummary(0x7f0b06d2);
                preferencescreen.setOnPreferenceClickListener(new android.preference.Preference.OnPreferenceClickListener() {

                    final InputMethodAndLanguageSettings this$0;
                    final String val$inputDeviceDescriptor;

                    public boolean onPreferenceClick(Preference preference2)
                    {
                        showKeyboardLayoutDialog(inputDeviceDescriptor);
                        return true;
                    }

            
            {
                this$0 = InputMethodAndLanguageSettings.this;
                inputDeviceDescriptor = s;
                super();
            }
                }
);
                mHardKeyboardPreferenceList.add(preferencescreen);
            }

        }
        if (!mHardKeyboardPreferenceList.isEmpty())
        {
            int i = mHardKeyboardCategory.getPreferenceCount();
            do
            {
                int j = i - 1;
                if (i <= 0)
                    break;
                Preference preference1 = mHardKeyboardCategory.getPreference(j);
                if (preference1.getOrder() < 1000)
                    mHardKeyboardCategory.removePreference(preference1);
                i = j;
            } while (true);
            Collections.sort(mHardKeyboardPreferenceList);
            int k = mHardKeyboardPreferenceList.size();
            for (int l = 0; l < k; l++)
            {
                Preference preference = (Preference)mHardKeyboardPreferenceList.get(l);
                preference.setOrder(l);
                mHardKeyboardCategory.addPreference(preference);
            }

            getPreferenceScreen().addPreference(mHardKeyboardCategory);
            return;
        } else
        {
            getPreferenceScreen().removePreference(mHardKeyboardCategory);
            return;
        }
    }

    private void updateInputDevices()
    {
        updateHardKeyboards();
        updateGameControllers();
    }

    private void updateInputMethodSelectorSummary(int i)
    {
        String as[] = getResources().getStringArray(0x7f070079);
        if (as.length > i)
        {
            mShowInputMethodSelectorPref.setSummary(as[i]);
            mShowInputMethodSelectorPref.setValue(String.valueOf(i));
        }
    }

    private void updateUserDictionaryPreference(Preference preference)
    {
label0:
        {
            TreeSet treeset = UserDictionaryList.getUserDictionaryLocalesSet(getActivity());
            if (treeset == null)
            {
                getPreferenceScreen().removePreference(preference);
            } else
            {
                if (treeset.size() > 1)
                    break label0;
                Intent intent = new Intent("android.settings.USER_DICTIONARY_SETTINGS");
                preference.setTitle(0x7f0b06d5);
                preference.setIntent(intent);
                preference.setFragment(com/android/settings/UserDictionarySettings.getName());
                if (treeset.size() == 1)
                {
                    String s = (String)treeset.toArray()[0];
                    preference.getExtras().putString("locale", s);
                    return;
                }
            }
            return;
        }
        preference.setTitle(0x7f0b06d6);
        preference.setFragment(com/android/settings/inputmethod/UserDictionaryList.getName());
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
        super.onActivityResult(i, j, intent);
        if (mIntentWaitingForResult != null)
        {
            String s = mIntentWaitingForResult.getStringExtra("input_device_descriptor");
            mIntentWaitingForResult = null;
            showKeyboardLayoutDialog(s);
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f05001d);
        int i;
        int j;
        Intent intent;
        SpellCheckersPreference spellcheckerspreference;
        try
        {
            mDefaultInputMethodSelectorVisibility = Integer.valueOf(getString(0x7f0b0006)).intValue();
        }
        catch (NumberFormatException numberformatexception) { }
        if (getActivity().getAssets().getLocales().length == 1)
            getPreferenceScreen().removePreference(findPreference("phone_language"));
        else
            mLanguagePref = findPreference("phone_language");
        (new VoiceInputOutputSettings(this)).onCreate();
        mHardKeyboardCategory = (PreferenceCategory)findPreference("hard_keyboard");
        mKeyboardSettingsCategory = (PreferenceCategory)findPreference("keyboard_settings_category");
        mGameControllerCategory = (PreferenceCategory)findPreference("game_controller_settings_category");
        mIsOnlyImeSettings = "android.settings.INPUT_METHOD_SETTINGS".equals(getActivity().getIntent().getAction());
        getActivity().getIntent().setAction(null);
        if (mIsOnlyImeSettings)
        {
            getPreferenceScreen().removeAll();
            getPreferenceScreen().addPreference(mHardKeyboardCategory);
            getPreferenceScreen().addPreference(mKeyboardSettingsCategory);
        }
        mImm = (InputMethodManager)getSystemService("input_method");
        mImis = mImm.getInputMethodList();
        mKeyboardSettingsCategory.removeAll();
        if (!mIsOnlyImeSettings)
        {
            PreferenceScreen preferencescreen = new PreferenceScreen(getActivity(), null);
            preferencescreen.setKey("current_input_method");
            preferencescreen.setTitle(getResources().getString(0x7f0b06f8));
            mKeyboardSettingsCategory.addPreference(preferencescreen);
        }
        mInputMethodPreferenceList.clear();
        if (mImis == null)
            i = 0;
        else
            i = mImis.size();
        for (j = 0; j < i; j++)
        {
            InputMethodPreference inputmethodpreference = getInputMethodPreference((InputMethodInfo)mImis.get(j), i);
            mInputMethodPreferenceList.add(inputmethodpreference);
        }

        if (!mInputMethodPreferenceList.isEmpty())
        {
            Collections.sort(mInputMethodPreferenceList);
            for (int k = 0; k < i; k++)
                mKeyboardSettingsCategory.addPreference((Preference)mInputMethodPreferenceList.get(k));

        }
        mIm = (InputManager)getActivity().getSystemService("input");
        updateInputDevices();
        intent = new Intent("android.intent.action.MAIN");
        intent.setClass(getActivity(), com/android/settings/Settings$SpellCheckersSettingsActivity);
        spellcheckerspreference = (SpellCheckersPreference)findPreference("spellcheckers_settings");
        if (spellcheckerspreference != null)
            spellcheckerspreference.setFragmentIntent(this, intent);
        mHandler = new Handler();
        mSettingsObserver = new SettingsObserver(mHandler, getActivity());
        mVoiceCategory = (PreferenceCategory)findPreference("voice_category");
        if (mVoiceCategory != null)
            mVoiceUiEnaber = (VoiceUiSwitchPreference)mVoiceCategory.findPreference("voice_ui_enabler");
        if (mIsOnlyImeSettings);
        Xlog.d("InputMethodAndLanguageSettings", "going to remove voice ui feature ");
        if (mVoiceUiEnaber != null && mVoiceCategory != null)
        {
            Xlog.d("InputMethodAndLanguageSettings", "removed done");
            mVoiceCategory.removePreference(mVoiceUiEnaber);
        }
    }

    public void onInputDeviceAdded(int i)
    {
        updateInputDevices();
    }

    public void onInputDeviceChanged(int i)
    {
        updateInputDevices();
    }

    public void onInputDeviceRemoved(int i)
    {
        updateInputDevices();
    }

    public void onPause()
    {
        super.onPause();
        mIm.unregisterInputDeviceListener(this);
        mSettingsObserver.pause();
        ContentResolver contentresolver = getContentResolver();
        List list = mImis;
        boolean flag;
        if (!mHardKeyboardPreferenceList.isEmpty())
            flag = true;
        else
            flag = false;
        InputMethodAndSubtypeUtil.saveInputMethodSubtypeList(this, contentresolver, list, flag);
        if (mIsOnlyImeSettings);
        if (mIsOnlyImeSettings);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        return false;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (Utils.isMonkeyRunning())
            return false;
        if (preference instanceof PreferenceScreen)
        {
            if (preference.getFragment() == null && "current_input_method".equals(preference.getKey()))
                ((InputMethodManager)getSystemService("input_method")).showInputMethodPicker();
        } else
        if (preference instanceof CheckBoxPreference)
        {
            CheckBoxPreference checkboxpreference = (CheckBoxPreference)preference;
            if (!mHardKeyboardPreferenceList.isEmpty())
            {
                for (int j = 0; j < sHardKeyboardKeys.length; j++)
                    if (checkboxpreference == mHardKeyboardCategory.findPreference(sHardKeyboardKeys[j]))
                    {
                        ContentResolver contentresolver1 = getContentResolver();
                        String s = sSystemSettingNames[j];
                        boolean flag1 = checkboxpreference.isChecked();
                        int k = 0;
                        if (flag1)
                            k = 1;
                        android.provider.Settings.System.putInt(contentresolver1, s, k);
                        return true;
                    }

            }
            if (checkboxpreference == mGameControllerCategory.findPreference("vibrate_input_devices"))
            {
                ContentResolver contentresolver = getContentResolver();
                boolean flag = checkboxpreference.isChecked();
                int i = 0;
                if (flag)
                    i = 1;
                android.provider.Settings.System.putInt(contentresolver, "vibrate_input_devices", i);
                return true;
            }
        }
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }

    public void onResume()
    {
        super.onResume();
        mSettingsObserver.resume();
        mIm.registerInputDeviceListener(this, null);
        if (!mIsOnlyImeSettings)
        {
            if (mLanguagePref != null)
            {
                Configuration configuration = getResources().getConfiguration();
                String s;
                if (hasOnlyOneLanguageInstance(configuration.locale.getLanguage(), Resources.getSystem().getAssets().getLocales()))
                    s = configuration.locale.getDisplayLanguage(configuration.locale);
                else
                    s = configuration.locale.getDisplayName(configuration.locale);
                if (s.length() > 1)
                {
                    String s1 = (new StringBuilder()).append(Character.toUpperCase(s.charAt(0))).append(s.substring(1)).toString();
                    mLanguagePref.setSummary(s1);
                }
            }
            updateUserDictionaryPreference(findPreference("key_user_dictionary_settings"));
        }
        if (!mHardKeyboardPreferenceList.isEmpty())
        {
            for (int i = 0; i < sHardKeyboardKeys.length; i++)
            {
                CheckBoxPreference checkboxpreference = (CheckBoxPreference)mHardKeyboardCategory.findPreference(sHardKeyboardKeys[i]);
                boolean flag;
                if (android.provider.Settings.System.getInt(getContentResolver(), sSystemSettingNames[i], 1) > 0)
                    flag = true;
                else
                    flag = false;
                checkboxpreference.setChecked(flag);
            }

        }
        updateInputDevices();
        InputMethodAndSubtypeUtil.loadInputMethodSubtypeList(this, getContentResolver(), mImis, null);
        updateActiveInputMethodsSummary();
        if (mIsOnlyImeSettings);
    }

    public void onSetupKeyboardLayouts(String s)
    {
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.setClass(getActivity(), com/android/settings/Settings$KeyboardLayoutPickerActivity);
        intent.putExtra("input_device_descriptor", s);
        mIntentWaitingForResult = intent;
        startActivityForResult(intent, 0);
    }

    public void onStop()
    {
        super.onStop();
    }









}
