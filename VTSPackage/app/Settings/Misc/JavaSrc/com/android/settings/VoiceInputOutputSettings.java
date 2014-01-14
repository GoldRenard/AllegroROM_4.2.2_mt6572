// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.*;
import android.content.res.*;
import android.preference.*;
import android.speech.tts.TtsEngines;
import android.util.Log;
import android.util.Xml;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import org.xmlpull.v1.XmlPullParserException;

// Referenced classes of package com.android.settings:
//            SettingsPreferenceFragment

public class VoiceInputOutputSettings
    implements android.preference.Preference.OnPreferenceChangeListener
{

    private static final String KEY_RECOGNIZER = "recognizer";
    private static final String KEY_RECOGNIZER_SETTINGS = "recognizer_settings";
    private static final String KEY_TTS_SETTINGS = "tts_settings";
    private static final String KEY_VOICE_CATEGORY = "voice_category";
    private static final String TAG = "VoiceInputOutputSettings";
    private HashMap mAvailableRecognizersMap;
    private final SettingsPreferenceFragment mFragment;
    private PreferenceGroup mParent;
    private ListPreference mRecognizerPref;
    private Preference mRecognizerSettingsPref;
    private PreferenceScreen mSettingsPref;
    private final TtsEngines mTtsEngines;
    private Preference mTtsSettingsPref;
    private PreferenceCategory mVoiceCategory;

    public VoiceInputOutputSettings(SettingsPreferenceFragment settingspreferencefragment)
    {
        mFragment = settingspreferencefragment;
        mTtsEngines = new TtsEngines(settingspreferencefragment.getPreferenceScreen().getContext());
    }

    private void populateOrRemovePreferences()
    {
        boolean flag = populateOrRemoveRecognizerPrefs();
        boolean flag1 = populateOrRemoveTtsPrefs();
        if (!flag && !flag1)
            mFragment.getPreferenceScreen().removePreference(mVoiceCategory);
    }

    private boolean populateOrRemoveRecognizerPrefs()
    {
        List list = mFragment.getPackageManager().queryIntentServices(new Intent("android.speech.RecognitionService"), 128);
        int i = list.size();
        if (i == 0)
        {
            mVoiceCategory.removePreference(mRecognizerPref);
            mVoiceCategory.removePreference(mRecognizerSettingsPref);
            return false;
        }
        if (i == 1)
        {
            mVoiceCategory.removePreference(mRecognizerPref);
            ResolveInfo resolveinfo = (ResolveInfo)list.get(0);
            String s = (new ComponentName(((PackageItemInfo) (resolveinfo.serviceInfo)).packageName, resolveinfo.serviceInfo.name)).flattenToShortString();
            mAvailableRecognizersMap.put(s, resolveinfo);
            updateSettingsLink(android.provider.Settings.Secure.getString(mFragment.getContentResolver(), "voice_recognition_service"));
        } else
        {
            populateRecognizerPreference(list);
        }
        return true;
    }

    private boolean populateOrRemoveTtsPrefs()
    {
        if (mTtsEngines.getEngines().isEmpty())
        {
            mVoiceCategory.removePreference(mTtsSettingsPref);
            return false;
        } else
        {
            return true;
        }
    }

    private void populateRecognizerPreference(List list)
    {
        int i = list.size();
        CharSequence acharsequence[] = new CharSequence[i];
        CharSequence acharsequence1[] = new CharSequence[i];
        String s = android.provider.Settings.Secure.getString(mFragment.getContentResolver(), "voice_recognition_service");
        for (int j = 0; j < i; j++)
        {
            ResolveInfo resolveinfo = (ResolveInfo)list.get(j);
            String s1 = (new ComponentName(((PackageItemInfo) (resolveinfo.serviceInfo)).packageName, resolveinfo.serviceInfo.name)).flattenToShortString();
            mAvailableRecognizersMap.put(s1, resolveinfo);
            acharsequence[j] = resolveinfo.loadLabel(mFragment.getPackageManager());
            acharsequence1[j] = s1;
        }

        mRecognizerPref.setEntries(acharsequence);
        mRecognizerPref.setEntryValues(acharsequence1);
        mRecognizerPref.setDefaultValue(s);
        mRecognizerPref.setValue(s);
        updateSettingsLink(s);
    }

    private void updateSettingsLink(String s)
    {
        ResolveInfo resolveinfo;
        ServiceInfo serviceinfo;
        XmlResourceParser xmlresourceparser;
        String s1;
        resolveinfo = (ResolveInfo)mAvailableRecognizersMap.get(s);
        if (resolveinfo == null)
            return;
        serviceinfo = resolveinfo.serviceInfo;
        xmlresourceparser = null;
        s1 = null;
        xmlresourceparser = serviceinfo.loadXmlMetaData(mFragment.getPackageManager(), "android.speech");
        s1 = null;
        if (xmlresourceparser != null) goto _L2; else goto _L1
_L1:
        throw new XmlPullParserException((new StringBuilder()).append("No android.speech meta-data for ").append(((PackageItemInfo) (serviceinfo)).packageName).toString());
        XmlPullParserException xmlpullparserexception;
        xmlpullparserexception;
        Log.e("VoiceInputOutputSettings", "error parsing recognition service meta-data", xmlpullparserexception);
        if (xmlresourceparser != null)
            xmlresourceparser.close();
_L3:
        Exception exception;
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        IOException ioexception;
        Resources resources;
        android.util.AttributeSet attributeset;
        int i;
        boolean flag;
        if (s1 == null)
        {
            Log.w("VoiceInputOutputSettings", (new StringBuilder()).append("no recognizer settings available for ").append(((PackageItemInfo) (serviceinfo)).packageName).toString());
            mSettingsPref.setIntent(null);
            mVoiceCategory.removePreference(mSettingsPref);
            return;
        } else
        {
            Intent intent = new Intent("android.intent.action.MAIN");
            intent.setComponent(new ComponentName(((PackageItemInfo) (serviceinfo)).packageName, s1));
            mSettingsPref.setIntent(intent);
            mRecognizerPref.setSummary(resolveinfo.loadLabel(mFragment.getPackageManager()));
            return;
        }
_L2:
        resources = mFragment.getPackageManager().getResourcesForApplication(serviceinfo.applicationInfo);
        attributeset = Xml.asAttributeSet(xmlresourceparser);
        do
            i = xmlresourceparser.next();
        while (i != 1 && i != 2);
        flag = "recognition-service".equals(xmlresourceparser.getName());
        s1 = null;
        if (flag)
            break MISSING_BLOCK_LABEL_264;
        throw new XmlPullParserException("Meta-data does not start with recognition-service tag");
        ioexception;
        Log.e("VoiceInputOutputSettings", "error parsing recognition service meta-data", ioexception);
        if (xmlresourceparser != null)
            xmlresourceparser.close();
          goto _L3
        TypedArray typedarray = resources.obtainAttributes(attributeset, com.android.internal.R.styleable.RecognitionService);
        s1 = typedarray.getString(0);
        typedarray.recycle();
        if (xmlresourceparser != null)
            xmlresourceparser.close();
          goto _L3
        namenotfoundexception;
        Log.e("VoiceInputOutputSettings", "error parsing recognition service meta-data", namenotfoundexception);
        if (xmlresourceparser != null)
            xmlresourceparser.close();
          goto _L3
        exception;
        if (xmlresourceparser != null)
            xmlresourceparser.close();
        throw exception;
    }

    public void onCreate()
    {
        mParent = mFragment.getPreferenceScreen();
        mVoiceCategory = (PreferenceCategory)mParent.findPreference("voice_category");
        mRecognizerPref = (ListPreference)mVoiceCategory.findPreference("recognizer");
        mRecognizerSettingsPref = mVoiceCategory.findPreference("recognizer_settings");
        mTtsSettingsPref = mVoiceCategory.findPreference("tts_settings");
        mRecognizerPref.setOnPreferenceChangeListener(this);
        mSettingsPref = (PreferenceScreen)mVoiceCategory.findPreference("recognizer_settings");
        mAvailableRecognizersMap = new HashMap();
        populateOrRemovePreferences();
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        if (preference == mRecognizerPref)
        {
            String s = (String)obj;
            android.provider.Settings.Secure.putString(mFragment.getContentResolver(), "voice_recognition_service", s);
            updateSettingsLink(s);
        }
        return true;
    }
}
