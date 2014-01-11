// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.voicesettings;

import android.app.ActionBar;
import android.app.Activity;
import android.content.*;
import android.content.res.Resources;
import android.os.*;
import android.preference.*;
import android.widget.CompoundButton;
import android.widget.Switch;
import com.android.settings.SettingsPreferenceFragment;
import com.mediatek.common.voicecommand.IVoiceCommandManager;
import com.mediatek.common.voicecommand.VoiceCommandListener;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.mediatek.voicesettings:
//            VoiceUiAvailableLanguageFragment, VoiceUiUtils

public class VoiceUiSettings extends SettingsPreferenceFragment
    implements android.widget.CompoundButton.OnCheckedChangeListener
{
    private class VoiceCommandCallback extends VoiceCommandListener
    {

        final VoiceUiSettings this$0;

        public void onVoiceCommandNotified(int i, int j, Bundle bundle)
        {
            int k = bundle.getInt("Result");
            Xlog.d("VoiceUiSettings", (new StringBuilder()).append(" VoiceCommandListener subAction=").append(j).append(" result=").append(k).toString());
            switch (j)
            {
            case 5: // '\005'
                Xlog.d("VoiceUiSettings", "keyword path get ok");
                if (k == 1)
                {
                    String s2 = bundle.getString("Result_Info");
                    Xlog.d("VoiceUiSettings", (new StringBuilder()).append("get keywords file name :").append(s2).toString());
                    (new VoiceUiUtils()).readKeyWordFromXml(mVoiceKeyWordInfos, s2);
                    Xlog.d("VoiceUiSettings", mVoiceKeyWordInfos.keySet().toString());
                    String s3;
                    for (Iterator iterator = mVoiceKeyWordInfos.keySet().iterator(); iterator.hasNext(); Xlog.d("VoiceUiSettings", Arrays.toString((Object[])mVoiceKeyWordInfos.get(s3))))
                        s3 = (String)iterator.next();

                    updateKeywordsSummary(mVoiceKeyWordInfos);
                    return;
                }
                break;

            case 4: // '\004'
                StringBuilder stringbuilder1 = (new StringBuilder()).append("Voice language changed is ");
                String s1;
                if (k == 1)
                    s1 = "ok";
                else
                    s1 = "error";
                Xlog.d("VoiceUiSettings", stringbuilder1.append(s1).toString());
                Xlog.d("VoiceUiSettings", (new StringBuilder()).append("Current Language: ").append(mSupportLangs[mDefaultLangIndex]).toString());
                mLanguagePref.setSummary(mSupportLangs[mDefaultLangIndex]);
                return;

            case 3: // '\003'
                handleSupportLanguageList(k, bundle);
                return;

            case 2: // '\002'
                StringBuilder stringbuilder = (new StringBuilder()).append("Voice settings for apps is ");
                String s;
                if (k == 1)
                    s = "ok";
                else
                    s = "error";
                Xlog.d("VoiceUiSettings", stringbuilder.append(s).toString());
                return;

            case 1: // '\001'
                handleVoiceUiApps(k, bundle);
                return;

            default:
                Xlog.d("VoiceUiSettings", (new StringBuilder()).append("never should here, maybe error subAction=").append(j).toString());
                break;
            }
        }

        public VoiceCommandCallback(Context context)
        {
            this$0 = VoiceUiSettings.this;
            super(context);
        }
    }


    private static final String KEY_VOICE_UI_ALARM = "alarm_pref";
    private static final String KEY_VOICE_UI_CAMERA = "camera_pref";
    private static final String KEY_VOICE_UI_FOR_APP_CATEGORY = "voice_ui_app";
    private static final String KEY_VOICE_UI_INCOMMING_CALL = "incomming_all_pref";
    private static final String KEY_VOICE_UI_LANGUAGE = "language_settings";
    private static final String KEY_VOICE_UI_MUSIC = "music_pref";
    private static final int SUCCESS_RESULT = 1;
    private static final String TAG = "VoiceUiSettings";
    private static final String VOICE_CONTROL_DEFAULT_LANGUAGE = "voice_control_default_language";
    private static final String VOICE_CONTROL_ENABLED = "voice_control_enabled";
    private static final String VOICE_UI_SUPPORT_LANGUAGES = "voice_ui_support_languages";
    private int mChoosedLanguage;
    private int mDefaultLangIndex;
    private Switch mEnabledSwitch;
    private Preference mLanguagePref;
    private Locale mLocale;
    private String mLocaleCode;
    private HashMap mRawData;
    private String mSupportLangs[];
    private IVoiceCommandManager mVoiceCmdMgr;
    private boolean mVoiceControlEnable;
    private HashMap mVoiceKeyWordInfos;
    private VoiceCommandListener mVoiceListener;
    private PreferenceCategory mVoiceUiAppCategory;
    private HashMap mVoiceUiAppStatus;

    public VoiceUiSettings()
    {
        mVoiceControlEnable = false;
        mDefaultLangIndex = 0;
        mChoosedLanguage = 0;
        mVoiceKeyWordInfos = new HashMap();
        mVoiceUiAppStatus = new HashMap();
        mRawData = new HashMap();
    }

    private void changeSupportLanguage(int i)
    {
        Bundle bundle;
        if (mVoiceCmdMgr == null)
            break MISSING_BLOCK_LABEL_59;
        Xlog.d("VoiceUiSettings", "send change support language command");
        bundle = new Bundle();
        bundle.putInt("Send_Info", i);
        Xlog.d("VoiceUiSettings", "send command mainAction = 5 subAction = 4");
        mVoiceCmdMgr.sendCommand(getActivity(), 5, 4, bundle);
        sendCommand(5);
        return;
        RemoteException remoteexception;
        remoteexception;
        Xlog.w("VoiceUiSettings", (new StringBuilder()).append("Remote exception error").append(remoteexception.getMessage()).toString());
        remoteexception.printStackTrace();
        return;
        IllegalAccessException illegalaccessexception;
        illegalaccessexception;
        Xlog.w("VoiceUiSettings", (new StringBuilder()).append("IllegalAccessException exception error").append(illegalaccessexception.getMessage()).toString());
        illegalaccessexception.printStackTrace();
        return;
    }

    private void createPreferenceHierarchy(HashMap hashmap)
    {
        Iterator iterator = hashmap.keySet().iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            String s = (String)iterator.next();
            CheckBoxPreference checkboxpreference = new CheckBoxPreference(getActivity());
            if (checkboxpreference != null)
            {
                int i = ((Integer)hashmap.get(s)).intValue();
                checkboxpreference.setTitle(getProcessTitleResourceId(s));
                boolean flag;
                if (i == 1)
                    flag = true;
                else
                    flag = false;
                checkboxpreference.setEnabled(flag);
                checkboxpreference.setKey(s);
                mVoiceUiAppCategory.addPreference(checkboxpreference);
            }
        } while (true);
    }

    private int getProcessTitleResourceId(String s)
    {
        if (s.equals("com.android.deskclock"))
            return 0x7f0b01b4;
        if (s.equals("com.android.phone"))
            return 0x7f0b01b3;
        if (s.equals("com.android.music"))
            return 0x7f0b01b6;
        if (s.equals("com.android.gallery3d"))
        {
            return 0x7f0b01b5;
        } else
        {
            Xlog.d("VoiceUiSettings", (new StringBuilder()).append("voice ui not support ").append(s).toString());
            return 0;
        }
    }

    private int getSummaryResourceId(String s)
    {
        if (s.equals("com.android.deskclock"))
            return 0x7f0b01b8;
        if (s.equals("com.android.phone"))
            return 0x7f0b01b7;
        if (s.equals("com.android.music"))
            return 0x7f0b01ba;
        if (s.equals("com.android.gallery3d"))
        {
            return 0x7f0b01b9;
        } else
        {
            Xlog.d("VoiceUiSettings", (new StringBuilder()).append("voice ui not support ").append(s).toString());
            return 0;
        }
    }

    private void handleSupportLanguageList(int i, Bundle bundle)
    {
        Xlog.d("VoiceUiSettings", (new StringBuilder()).append("handleSupportLanguageList result=").append(i).toString());
        if (bundle != null && i == 1)
        {
            mSupportLangs = bundle.getStringArray("Result_Info");
            mDefaultLangIndex = bundle.getInt("Reslut_INfo1");
            Xlog.d("VoiceUiSettings", (new StringBuilder()).append("handleSupportLanguageList Default language is ").append(mSupportLangs[mDefaultLangIndex]).toString());
            mChoosedLanguage = mDefaultLangIndex;
            String s = mSupportLangs[mDefaultLangIndex];
            mLanguagePref.setSummary(s);
        }
    }

    private void handleVoiceUiApps(int i, Bundle bundle)
    {
        Xlog.d("VoiceUiSettings", "handleVoiceUiApps");
        if (i != 1)
        {
            Xlog.d("VoiceUiSettings", (new StringBuilder()).append("handleVoiceUiApps error = ").append(i).toString());
            return;
        }
        String as[] = bundle.getStringArray("Result_Info");
        int ai[] = bundle.getIntArray("Reslut_INfo1");
        Xlog.d("VoiceUiSettings", (new StringBuilder()).append("get process data from framework: ").append(Arrays.toString(as)).toString());
        Xlog.d("VoiceUiSettings", (new StringBuilder()).append("get values data from framework: ").append(Arrays.toString(ai)).toString());
label0:
        for (int j = 0; j < as.length; j++)
        {
            String s2 = as[j];
            int i1 = ai[j];
            Iterator iterator2 = mVoiceUiAppStatus.keySet().iterator();
            do
            {
                if (!iterator2.hasNext())
                    continue label0;
                if (((String)iterator2.next()).equals(s2))
                    mRawData.put(s2, Integer.valueOf(i1));
            } while (true);
        }

        boolean flag = isAllDisabled(as, ai, (String[])mRawData.keySet().toArray(new String[0]));
        Xlog.d("VoiceUiSettings", (new StringBuilder()).append("isAllProcessesOff=").append(flag).append(" mVoiceControlEnable=").append(mVoiceControlEnable).toString());
        if (flag)
        {
            if (mVoiceControlEnable)
            {
                String s1;
                for (Iterator iterator1 = mVoiceUiAppStatus.keySet().iterator(); iterator1.hasNext(); mVoiceUiAppStatus.put(s1, Integer.valueOf(0)))
                    s1 = (String)iterator1.next();

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
        Xlog.d("VoiceUiSettings", (new StringBuilder()).append("mVoiceUiAppStatus hash map: ").append(mVoiceUiAppStatus.toString()).toString());
        Xlog.d("VoiceUiSettings", (new StringBuilder()).append("mVoiceControlEnable = ").append(mVoiceControlEnable).toString());
        mEnabledSwitch.setChecked(mVoiceControlEnable);
        mVoiceUiAppCategory.setEnabled(mVoiceControlEnable);
        updateVoiceUiAppPrefs(mVoiceUiAppStatus);
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
        Xlog.d("VoiceUiSettings", (new StringBuilder()).append("all app disabled is ").append(flag).toString());
        return flag;
    }

    private boolean isAllDisabled(String as[], int ai[], String as1[])
    {
        HashMap hashmap = new HashMap();
        Xlog.d("VoiceUiSettings", Arrays.toString(as));
        Xlog.d("VoiceUiSettings", Arrays.toString(ai));
        for (int i = 0; i < as.length; i++)
        {
            String s1 = as[i];
            int j = ai[i];
            int k = as1.length;
            for (int l = 0; l < k; l++)
                if (as1[l].equals(s1))
                    hashmap.put(s1, Integer.valueOf(j));

        }

        Xlog.d("VoiceUiSettings", (new StringBuilder()).append("judge is All Disabled ").append(hashmap.toString()).toString());
        for (Iterator iterator = hashmap.keySet().iterator(); iterator.hasNext();)
        {
            String s = (String)iterator.next();
            if (((Integer)hashmap.get(s)).intValue() == 1)
            {
                Xlog.d("VoiceUiSettings", (new StringBuilder()).append(s).append(" is ").append("on").toString());
                return false;
            }
        }

        return true;
    }

    private void sendCommand(int i)
    {
        if (mVoiceCmdMgr == null)
            break MISSING_BLOCK_LABEL_49;
        Xlog.d("VoiceUiSettings", (new StringBuilder()).append("send command mainAction = 5 subAction = ").append(i).toString());
        mVoiceCmdMgr.sendCommand(getActivity(), 5, i, null);
        return;
        RemoteException remoteexception;
        remoteexception;
        Xlog.w("VoiceUiSettings", (new StringBuilder()).append("Remote exception error").append(remoteexception.getMessage()).toString());
        remoteexception.printStackTrace();
        return;
        IllegalAccessException illegalaccessexception;
        illegalaccessexception;
        Xlog.w("VoiceUiSettings", (new StringBuilder()).append("IllegalAccessException exception error").append(illegalaccessexception.getMessage()).toString());
        illegalaccessexception.printStackTrace();
        return;
    }

    private void setApps(String as[], int ai[])
    {
        Xlog.d("VoiceUiSettings", (new StringBuilder()).append("send command: set apps names ").append(Arrays.toString(as)).toString());
        Xlog.d("VoiceUiSettings", (new StringBuilder()).append("send command: set apps values ").append(Arrays.toString(ai)).toString());
        while (as.length != ai.length || mVoiceCmdMgr == null) 
            return;
        Bundle bundle = new Bundle();
        bundle.putStringArray("Send_Info", as);
        bundle.putIntArray("Send_Info1", ai);
        try
        {
            Xlog.d("VoiceUiSettings", "send command mainAction = 5 subAction = 2");
            mVoiceCmdMgr.sendCommand(getActivity(), 5, 2, bundle);
            return;
        }
        catch (RemoteException remoteexception)
        {
            Xlog.w("VoiceUiSettings", (new StringBuilder()).append("Remote exception error").append(remoteexception.getMessage()).toString());
            remoteexception.printStackTrace();
            return;
        }
        catch (IllegalAccessException illegalaccessexception)
        {
            Xlog.w("VoiceUiSettings", (new StringBuilder()).append("IllegalAccessException exception error").append(illegalaccessexception.getMessage()).toString());
            illegalaccessexception.printStackTrace();
            return;
        }
    }

    private void updateVoiceUiAppPrefs(HashMap hashmap)
    {
        Iterator iterator = hashmap.keySet().iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            String s = (String)iterator.next();
            boolean flag;
            if (((Integer)hashmap.get(s)).intValue() == 1)
                flag = true;
            else
                flag = false;
            Preference preference = getPreferenceFromProcessName(s);
            if (preference != null && (preference instanceof CheckBoxPreference))
                ((CheckBoxPreference)preference).setChecked(flag);
        } while (true);
    }

    public Preference getPreferenceFromProcessName(String s)
    {
        if (mVoiceUiAppCategory != null)
        {
            return mVoiceUiAppCategory.findPreference(s);
        } else
        {
            Xlog.d("VoiceUiSettings", "app checkbox list category is null");
            return null;
        }
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        Activity activity = getActivity();
        mEnabledSwitch = new Switch(activity);
        int i = activity.getResources().getDimensionPixelSize(0x7f0d0002);
        mEnabledSwitch.setPadding(0, 0, i, 0);
        mEnabledSwitch.setOnCheckedChangeListener(this);
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
        StringBuilder stringbuilder = (new StringBuilder()).append("-->>result ").append(j).append(" data is ");
        String s;
        if (intent == null)
            s = "null";
        else
            s = "not null";
        Xlog.d("VoiceUiSettings", stringbuilder.append(s).toString());
        if (j == 1 && intent != null)
        {
            mChoosedLanguage = intent.getIntExtra("voice_control_default_language", 0);
            String s1 = mSupportLangs[mChoosedLanguage];
            mLanguagePref.setSummary(s1);
            Xlog.d("VoiceUiSettings", (new StringBuilder()).append("Select Voice language ").append(s1).toString());
            return;
        } else
        {
            return;
        }
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        android.content.ContentResolver contentresolver = compoundbutton.getContext().getContentResolver();
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        android.provider.Settings.Secure.putInt(contentresolver, "voice_control_enabled", i);
        mVoiceControlEnable = flag;
        StringBuilder stringbuilder = (new StringBuilder()).append("on checked change switch is ");
        String s;
        if (flag)
            s = "checked";
        else
            s = "unchecked";
        Xlog.d("VoiceUiSettings", stringbuilder.append(s).toString());
        mVoiceUiAppCategory.setEnabled(flag);
        if (mVoiceUiAppStatus.isEmpty())
        {
            Xlog.d("VoiceUiSettings", "mVoiceUiAppStatus not initialized");
        } else
        {
            boolean flag1 = isAllDisabled(mRawData);
            boolean flag2;
            if (!flag)
                flag2 = true;
            else
                flag2 = false;
            if (flag1 != flag2)
            {
                if (!mEnabledSwitch.isChecked())
                {
                    Iterator iterator1 = mRawData.keySet().iterator();
                    do
                    {
                        if (!iterator1.hasNext())
                            break;
                        String s3 = (String)iterator1.next();
                        if (((Integer)mRawData.get(s3)).intValue() == 1)
                        {
                            Xlog.d("VoiceUiSettings", (new StringBuilder()).append("disable process : ").append(s3).toString());
                            mRawData.put(s3, Integer.valueOf(0));
                        }
                    } while (true);
                } else
                {
                    Iterator iterator = mVoiceUiAppStatus.keySet().iterator();
                    do
                    {
                        if (!iterator.hasNext())
                            break;
                        String s2 = (String)iterator.next();
                        if (((Integer)mVoiceUiAppStatus.get(s2)).intValue() == 1)
                        {
                            Xlog.d("VoiceUiSettings", (new StringBuilder()).append("enable process : ").append(s2).toString());
                            mRawData.put(s2, Integer.valueOf(1));
                        }
                    } while (true);
                }
                String as[] = (String[])mRawData.keySet().toArray(new String[0]);
                int ai[] = new int[as.length];
                for (int j = 0; j < as.length; j++)
                    ai[j] = ((Integer)mRawData.get(as[j])).intValue();

                setApps(as, ai);
                StringBuilder stringbuilder1 = (new StringBuilder()).append("update these values ");
                String s1;
                if (mEnabledSwitch.isChecked())
                    s1 = "on ";
                else
                    s1 = "off ";
                Xlog.d("VoiceUiSettings", stringbuilder1.append(s1).append(Arrays.toString(as)).toString());
                return;
            }
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050046);
        mVoiceUiAppCategory = (PreferenceCategory)findPreference("voice_ui_app");
        mLanguagePref = findPreference("language_settings");
        Activity activity = getActivity();
        if (!"tablet".equals(SystemProperties.get("ro.build.characteristics")) || !getResources().getBoolean(0x1110007))
            activity.getActionBar().setTitle(0x7f0b01af);
        mVoiceUiAppStatus.put("com.android.phone", Integer.valueOf(1));
        mVoiceUiAppStatus.put("com.android.deskclock", Integer.valueOf(1));
        mVoiceUiAppStatus.put("com.android.gallery3d", Integer.valueOf(1));
        mVoiceUiAppStatus.put("com.android.music", Integer.valueOf(1));
        SharedPreferences sharedpreferences = getActivity().getSharedPreferences("voice_ui_settings", 0);
        String s;
        int i;
        for (Iterator iterator = mVoiceUiAppStatus.keySet().iterator(); iterator.hasNext(); mVoiceUiAppStatus.put(s, Integer.valueOf(i)))
        {
            s = (String)iterator.next();
            i = sharedpreferences.getInt(s, 1);
        }

        Xlog.d("VoiceUiSettings", (new StringBuilder()).append("read from shared preference ").append(mVoiceUiAppStatus.toString()).toString());
        createPreferenceHierarchy(mVoiceUiAppStatus);
        mDefaultLangIndex = android.provider.Settings.Secure.getInt(getContentResolver(), "voice_control_default_language", 0);
        mChoosedLanguage = mDefaultLangIndex;
        mVoiceCmdMgr = (IVoiceCommandManager)getSystemService("voicecommand");
        if (mVoiceCmdMgr != null)
            mVoiceListener = new VoiceCommandCallback(getActivity());
    }

    public void onPause()
    {
        super.onPause();
        Xlog.d("VoiceUiSettings", (new StringBuilder()).append("--->> on Pause mVoiceControlEnable = ").append(mVoiceControlEnable).toString());
        Xlog.d("VoiceUiSettings", (new StringBuilder()).append("--->> mVoiceUiAppStatus ").append(mVoiceUiAppStatus.toString()).toString());
        Xlog.d("VoiceUiSettings", (new StringBuilder()).append("--->> mRawData ").append(mRawData.toString()).toString());
        android.content.SharedPreferences.Editor editor;
        if (mVoiceCmdMgr != null)
            try
            {
                mVoiceCmdMgr.unRegisterListener(mVoiceListener);
            }
            catch (RemoteException remoteexception)
            {
                Xlog.w("VoiceUiSettings", (new StringBuilder()).append("Remote exception error").append(remoteexception.getMessage()).toString());
                remoteexception.printStackTrace();
            }
            catch (IllegalAccessException illegalaccessexception)
            {
                Xlog.w("VoiceUiSettings", (new StringBuilder()).append("IllegalAccessException exception error").append(illegalaccessexception.getMessage()).toString());
                illegalaccessexception.printStackTrace();
            }
        editor = getActivity().getSharedPreferences("voice_ui_settings", 0).edit();
        String s;
        for (Iterator iterator = mVoiceUiAppStatus.keySet().iterator(); iterator.hasNext(); Xlog.d("VoiceUiSettings", (new StringBuilder()).append(s).append(" = ").append(mVoiceUiAppStatus.get(s)).toString()))
        {
            s = (String)iterator.next();
            editor.putInt(s, ((Integer)mVoiceUiAppStatus.get(s)).intValue());
            Xlog.d("VoiceUiSettings", "save state now");
        }

        editor.commit();
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (mSupportLangs != null && !mVoiceUiAppStatus.isEmpty())
        {
            Xlog.d("VoiceUiSettings", (new StringBuilder()).append(" onPreferenceTreeClick ").append(mVoiceUiAppStatus.toString()).toString());
            Xlog.d("VoiceUiSettings", (new StringBuilder()).append(" onPreferenceTreeClick ").append(mRawData.toString()).toString());
            if ("language_settings".equals(preference.getKey()))
            {
                Bundle bundle = new Bundle();
                bundle.putStringArray("voice_ui_support_languages", mSupportLangs);
                bundle.putInt("voice_control_default_language", mDefaultLangIndex);
                startFragment(this, com/mediatek/voicesettings/VoiceUiAvailableLanguageFragment.getCanonicalName(), 1, bundle, 0x7f0b01b2);
                return true;
            }
            if (mVoiceUiAppStatus.containsKey(preference.getKey()))
            {
                String s = preference.getKey();
                int i;
                if (((CheckBoxPreference)preference).isChecked())
                    i = 1;
                else
                    i = 0;
                mVoiceUiAppStatus.put(s, Integer.valueOf(i));
                mRawData.put(s, Integer.valueOf(i));
                setApps(new String[] {
                    s
                }, new int[] {
                    i
                });
                Xlog.d("VoiceUiSettings", (new StringBuilder()).append("changed app name = ").append(s).append(" value = ").append(i).toString());
                if (isAllDisabled(mRawData))
                {
                    Xlog.d("VoiceUiSettings", " set switch to off, disable app preferences");
                    android.provider.Settings.Secure.putInt(getActivity().getContentResolver(), "voice_control_enabled", 0);
                    mVoiceControlEnable = false;
                    mEnabledSwitch.setChecked(mVoiceControlEnable);
                    mVoiceUiAppCategory.setEnabled(mVoiceControlEnable);
                }
            } else
            {
                Xlog.d("VoiceUiSettings", (new StringBuilder()).append("onPreferenceClick not support click this preference ").append(preference.getKey()).toString());
            }
            return super.onPreferenceTreeClick(preferencescreen, preference);
        } else
        {
            Xlog.d("VoiceUiSettings", "Voice UI data got from framework is null");
            return false;
        }
    }

    public void onResume()
    {
        boolean flag;
        flag = true;
        super.onResume();
        Xlog.d("VoiceUiSettings", "--->> onResume");
        if (mVoiceCmdMgr == null)
            break MISSING_BLOCK_LABEL_120;
        StringBuilder stringbuilder;
        mVoiceCmdMgr.registerListener(mVoiceListener);
        Xlog.d("VoiceUiSettings", "send command mainAction = 5 subAction = 1");
        mVoiceCmdMgr.sendCommand(getActivity(), 5, 1, null);
        stringbuilder = (new StringBuilder()).append("Support language is ");
        String s;
        if (mSupportLangs == null)
            s = "null";
        else
            s = "not null";
        try
        {
            Xlog.d("VoiceUiSettings", stringbuilder.append(s).toString());
            if (mSupportLangs == null)
            {
                sendCommand(3);
                sendCommand(5);
            }
        }
        catch (RemoteException remoteexception)
        {
            Xlog.w("VoiceUiSettings", (new StringBuilder()).append("Remote exception error").append(remoteexception.getMessage()).toString());
            remoteexception.printStackTrace();
        }
        catch (IllegalAccessException illegalaccessexception)
        {
            Xlog.w("VoiceUiSettings", (new StringBuilder()).append("IllegalAccessException exception error").append(illegalaccessexception.getMessage()).toString());
            illegalaccessexception.printStackTrace();
        }
        if (mChoosedLanguage != mDefaultLangIndex && mSupportLangs.length > 0)
        {
            Xlog.d("VoiceUiSettings", (new StringBuilder()).append("Default language is ").append(mSupportLangs[mDefaultLangIndex]).toString());
            Xlog.d("VoiceUiSettings", (new StringBuilder()).append("Use choose language is ").append(mSupportLangs[mChoosedLanguage]).toString());
            Xlog.d("VoiceUiSettings", "in onResume change support language and update keywords summary");
            android.provider.Settings.Secure.putInt(getContentResolver(), "voice_control_default_language", mChoosedLanguage);
            changeSupportLanguage(mChoosedLanguage);
            mDefaultLangIndex = mChoosedLanguage;
            mLanguagePref.setSummary(mSupportLangs[mDefaultLangIndex]);
        }
        if (android.provider.Settings.Secure.getInt(getContentResolver(), "voice_control_enabled", 0) != flag)
            flag = false;
        mVoiceControlEnable = flag;
        Xlog.d("VoiceUiSettings", (new StringBuilder()).append("--->> mVoiceControlEnable = ").append(mVoiceControlEnable).toString());
        return;
    }

    public void onStart()
    {
        super.onStart();
        Activity activity = getActivity();
        activity.getActionBar().setDisplayOptions(16, 16);
        activity.getActionBar().setCustomView(mEnabledSwitch, new android.app.ActionBar.LayoutParams(-2, -2, 21));
    }

    public void onStop()
    {
        super.onStop();
        Activity activity = getActivity();
        activity.getActionBar().setDisplayOptions(0, 16);
        activity.getActionBar().setCustomView(null);
    }

    public void updateKeywordsSummary(HashMap hashmap)
    {
        Xlog.d("VoiceUiSettings", "update keywords summary");
        if (hashmap.isEmpty())
        {
            Xlog.d("VoiceUiSettings", "keywords is empty");
        } else
        {
            Iterator iterator = hashmap.keySet().iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                String s = (String)iterator.next();
                String as[] = (String[])hashmap.get(s);
                Xlog.d("VoiceUiSettings", (new StringBuilder()).append("updateKeywordsSummary processName = ").append(s).append(" commands = ").append(Arrays.toString(as)).toString());
                Xlog.d("VoiceUiSettings", (new StringBuilder()).append("commands length is ").append(as.length).toString());
                StringBuilder stringbuilder = new StringBuilder();
                String s1 = (new StringBuilder()).append("\"").append(as[-1 + as.length]).append("\"").toString();
                for (int i = 0; i < -1 + as.length; i++)
                {
                    stringbuilder.append("\"").append(as[i]).append("\"");
                    if (i != -2 + as.length)
                        stringbuilder.append(",");
                }

                int j = getSummaryResourceId(s);
                if (j != 0)
                {
                    Object aobj[] = new Object[2];
                    aobj[0] = stringbuilder.toString();
                    aobj[1] = s1;
                    String s2 = getString(j, aobj);
                    Preference preference = getPreferenceFromProcessName(s);
                    if (preference != null && as.length > 1)
                        preference.setSummary(s2);
                }
            } while (true);
        }
    }






}
