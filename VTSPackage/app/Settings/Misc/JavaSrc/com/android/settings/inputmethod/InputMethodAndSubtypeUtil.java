// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.inputmethod;

import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.preference.*;
import android.text.TextUtils;
import android.view.inputmethod.*;
import com.android.settings.SettingsPreferenceFragment;
import java.util.*;

public class InputMethodAndSubtypeUtil
{

    private static final boolean DEBUG = false;
    private static final Locale ENGLISH_LOCALE = new Locale("en");
    private static final char INPUT_METHOD_SEPARATER = 58;
    private static final char INPUT_METHOD_SUBTYPE_SEPARATER = 59;
    private static final int NOT_A_SUBTYPE_ID = -1;
    static final String TAG = "InputMethdAndSubtypeUtil";
    private static final android.text.TextUtils.SimpleStringSplitter sStringInputMethodSplitter = new android.text.TextUtils.SimpleStringSplitter(':');
    private static final android.text.TextUtils.SimpleStringSplitter sStringInputMethodSubtypeSplitter = new android.text.TextUtils.SimpleStringSplitter(';');


    public static void buildDisabledSystemInputMethods(StringBuilder stringbuilder, HashSet hashset)
    {
        boolean flag = false;
        String s;
        for (Iterator iterator = hashset.iterator(); iterator.hasNext(); stringbuilder.append(s))
        {
            s = (String)iterator.next();
            if (flag)
                stringbuilder.append(':');
            else
                flag = true;
        }

    }

    private static void buildEnabledInputMethodsString(StringBuilder stringbuilder, String s, HashSet hashset)
    {
        stringbuilder.append(s);
        String s1;
        for (Iterator iterator = hashset.iterator(); iterator.hasNext(); stringbuilder.append(';').append(s1))
            s1 = (String)iterator.next();

    }

    public static void buildInputMethodsAndSubtypesString(StringBuilder stringbuilder, HashMap hashmap)
    {
        boolean flag = false;
        String s;
        for (Iterator iterator = hashmap.keySet().iterator(); iterator.hasNext(); buildEnabledInputMethodsString(stringbuilder, s, (HashSet)hashmap.get(s)))
        {
            s = (String)iterator.next();
            if (flag)
                stringbuilder.append(':');
            else
                flag = true;
        }

    }

    private static boolean containsSubtypeOf(InputMethodInfo inputmethodinfo, String s)
    {
        int i = inputmethodinfo.getSubtypeCount();
        for (int j = 0; j < i; j++)
            if (inputmethodinfo.getSubtypeAt(j).getLocale().startsWith(s))
                return true;

        return false;
    }

    public static CharSequence getCurrentInputMethodName(Context context, ContentResolver contentresolver, InputMethodManager inputmethodmanager, List list, PackageManager packagemanager)
    {
label0:
        {
            if (contentresolver == null || list == null)
                break label0;
            String s = android.provider.Settings.Secure.getString(contentresolver, "default_input_method");
            if (TextUtils.isEmpty(s))
                break label0;
            Iterator iterator = list.iterator();
            InputMethodInfo inputmethodinfo;
            do
            {
                if (!iterator.hasNext())
                    break label0;
                inputmethodinfo = (InputMethodInfo)iterator.next();
            } while (!s.equals(inputmethodinfo.getId()));
            InputMethodSubtype inputmethodsubtype = inputmethodmanager.getCurrentInputMethodSubtype();
            CharSequence charsequence = inputmethodinfo.loadLabel(packagemanager);
            if (inputmethodsubtype != null)
            {
                CharSequence acharsequence[] = new CharSequence[2];
                acharsequence[0] = inputmethodsubtype.getDisplayName(context, inputmethodinfo.getPackageName(), inputmethodinfo.getServiceInfo().applicationInfo);
                String s1;
                if (TextUtils.isEmpty(charsequence))
                    s1 = "";
                else
                    s1 = (new StringBuilder()).append(" - ").append(charsequence).toString();
                acharsequence[1] = s1;
                return TextUtils.concat(acharsequence);
            } else
            {
                return charsequence;
            }
        }
        return null;
    }

    private static HashSet getDisabledSystemIMEs(ContentResolver contentresolver)
    {
        HashSet hashset = new HashSet();
        String s = android.provider.Settings.Secure.getString(contentresolver, "disabled_system_input_methods");
        if (!TextUtils.isEmpty(s))
        {
            sStringInputMethodSplitter.setString(s);
            for (; sStringInputMethodSplitter.hasNext(); hashset.add(sStringInputMethodSplitter.next()));
        }
        return hashset;
    }

    private static HashMap getEnabledInputMethodsAndSubtypeList(ContentResolver contentresolver)
    {
        String s = android.provider.Settings.Secure.getString(contentresolver, "enabled_input_methods");
        HashMap hashmap = new HashMap();
        if (!TextUtils.isEmpty(s))
        {
            sStringInputMethodSplitter.setString(s);
            do
            {
                if (!sStringInputMethodSplitter.hasNext())
                    break;
                String s1 = sStringInputMethodSplitter.next();
                sStringInputMethodSubtypeSplitter.setString(s1);
                if (sStringInputMethodSubtypeSplitter.hasNext())
                {
                    HashSet hashset = new HashSet();
                    String s2 = sStringInputMethodSubtypeSplitter.next();
                    for (; sStringInputMethodSubtypeSplitter.hasNext(); hashset.add(sStringInputMethodSubtypeSplitter.next()));
                    hashmap.put(s2, hashset);
                }
            } while (true);
        }
        return hashmap;
    }

    private static int getInputMethodSubtypeSelected(ContentResolver contentresolver)
    {
        int i;
        try
        {
            i = android.provider.Settings.Secure.getInt(contentresolver, "selected_input_method_subtype");
        }
        catch (android.provider.Settings.SettingNotFoundException settingnotfoundexception)
        {
            return -1;
        }
        return i;
    }

    public static boolean isAlwaysCheckedIme(InputMethodInfo inputmethodinfo, Context context, int i)
    {
        if (i > 1)
        {
            if (!isSystemIme(inputmethodinfo))
                return false;
            if (isAuxiliaryIme(inputmethodinfo))
                return false;
            if (!isValidDefaultIme(inputmethodinfo, context))
                return containsSubtypeOf(inputmethodinfo, ENGLISH_LOCALE.getLanguage());
        }
        return true;
    }

    public static boolean isAuxiliaryIme(InputMethodInfo inputmethodinfo)
    {
        return inputmethodinfo.isAuxiliaryIme();
    }

    private static boolean isInputMethodSubtypeSelected(ContentResolver contentresolver)
    {
        return getInputMethodSubtypeSelected(contentresolver) != -1;
    }

    public static boolean isSystemIme(InputMethodInfo inputmethodinfo)
    {
        return (1 & inputmethodinfo.getServiceInfo().applicationInfo.flags) != 0;
    }

    private static boolean isValidDefaultIme(InputMethodInfo inputmethodinfo, Context context)
    {
        int i = inputmethodinfo.getIsDefaultResourceId();
        boolean flag = false;
        if (i == 0)
            break MISSING_BLOCK_LABEL_67;
        boolean flag1;
        boolean flag2;
        try
        {
            flag1 = context.createPackageContext(inputmethodinfo.getPackageName(), 0).getResources().getBoolean(inputmethodinfo.getIsDefaultResourceId());
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            return false;
        }
        catch (android.content.res.Resources.NotFoundException notfoundexception)
        {
            return false;
        }
        flag = false;
        if (!flag1)
            break MISSING_BLOCK_LABEL_67;
        flag2 = containsSubtypeOf(inputmethodinfo, context.getResources().getConfiguration().locale.getLanguage());
        flag = false;
        if (flag2)
            flag = true;
        return flag;
    }

    public static void loadInputMethodSubtypeList(SettingsPreferenceFragment settingspreferencefragment, ContentResolver contentresolver, List list, Map map)
    {
        HashMap hashmap = getEnabledInputMethodsAndSubtypeList(contentresolver);
        Iterator iterator = list.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            String s = ((InputMethodInfo)iterator.next()).getId();
            Preference preference = settingspreferencefragment.findPreference(s);
            if (preference != null && (preference instanceof CheckBoxPreference))
            {
                CheckBoxPreference checkboxpreference = (CheckBoxPreference)preference;
                boolean flag = hashmap.containsKey(s);
                checkboxpreference.setChecked(flag);
                if (map != null)
                {
                    for (Iterator iterator1 = ((List)map.get(s)).iterator(); iterator1.hasNext(); ((Preference)iterator1.next()).setEnabled(flag));
                }
                setSubtypesPreferenceEnabled(settingspreferencefragment, list, s, flag);
            }
        } while (true);
        updateSubtypesPreferenceChecked(settingspreferencefragment, list, hashmap);
    }

    private static void putSelectedInputMethodSubtype(ContentResolver contentresolver, int i)
    {
        android.provider.Settings.Secure.putInt(contentresolver, "selected_input_method_subtype", i);
    }

    public static void saveInputMethodSubtypeList(SettingsPreferenceFragment settingspreferencefragment, ContentResolver contentresolver, List list, boolean flag)
    {
        String s = android.provider.Settings.Secure.getString(contentresolver, "default_input_method");
        int i = getInputMethodSubtypeSelected(contentresolver);
        HashMap hashmap = getEnabledInputMethodsAndSubtypeList(contentresolver);
        HashSet hashset = getDisabledSystemIMEs(contentresolver);
        int j = list.size();
        boolean flag1 = false;
        Iterator iterator = list.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            InputMethodInfo inputmethodinfo = (InputMethodInfo)iterator.next();
            String s1 = inputmethodinfo.getId();
            Preference preference = settingspreferencefragment.findPreference(s1);
            if (preference != null)
            {
                boolean flag2;
                if (preference instanceof CheckBoxPreference)
                    flag2 = ((CheckBoxPreference)preference).isChecked();
                else
                    flag2 = hashmap.containsKey(s1);
                boolean flag3 = s1.equals(s);
                boolean flag4 = isSystemIme(inputmethodinfo);
                if ((flag || !isAlwaysCheckedIme(inputmethodinfo, settingspreferencefragment.getActivity(), j)) && !flag2)
                {
                    hashmap.remove(s1);
                    if (flag3)
                        s = null;
                } else
                {
                    if (!hashmap.containsKey(s1))
                        hashmap.put(s1, new HashSet());
                    HashSet hashset1 = (HashSet)hashmap.get(s1);
                    boolean flag5 = false;
                    int k = inputmethodinfo.getSubtypeCount();
                    for (int l = 0; l < k; l++)
                    {
                        InputMethodSubtype inputmethodsubtype = inputmethodinfo.getSubtypeAt(l);
                        String s2 = String.valueOf(inputmethodsubtype.hashCode());
                        CheckBoxPreference checkboxpreference = (CheckBoxPreference)settingspreferencefragment.findPreference((new StringBuilder()).append(s1).append(s2).toString());
                        if (checkboxpreference == null)
                            continue;
                        if (!flag5)
                        {
                            hashset1.clear();
                            flag1 = true;
                            flag5 = true;
                        }
                        if (checkboxpreference.isChecked())
                        {
                            hashset1.add(s2);
                            if (flag3 && i == inputmethodsubtype.hashCode())
                                flag1 = false;
                        } else
                        {
                            hashset1.remove(s2);
                        }
                    }

                }
                if (flag4 && flag)
                    if (hashset.contains(s1))
                    {
                        if (flag2)
                            hashset.remove(s1);
                    } else
                    if (!flag2)
                        hashset.add(s1);
            }
        } while (true);
        StringBuilder stringbuilder = new StringBuilder();
        buildInputMethodsAndSubtypesString(stringbuilder, hashmap);
        StringBuilder stringbuilder1 = new StringBuilder();
        buildDisabledSystemInputMethods(stringbuilder1, hashset);
        if (flag1 || !isInputMethodSubtypeSelected(contentresolver))
            putSelectedInputMethodSubtype(contentresolver, -1);
        android.provider.Settings.Secure.putString(contentresolver, "enabled_input_methods", stringbuilder.toString());
        if (stringbuilder1.length() > 0)
            android.provider.Settings.Secure.putString(contentresolver, "disabled_system_input_methods", stringbuilder1.toString());
        if (s == null)
            s = "";
        android.provider.Settings.Secure.putString(contentresolver, "default_input_method", s);
    }

    public static void setSubtypesPreferenceEnabled(SettingsPreferenceFragment settingspreferencefragment, List list, String s, boolean flag)
    {
        PreferenceScreen preferencescreen = settingspreferencefragment.getPreferenceScreen();
        Iterator iterator = list.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            InputMethodInfo inputmethodinfo = (InputMethodInfo)iterator.next();
            if (s.equals(inputmethodinfo.getId()))
            {
                int i = inputmethodinfo.getSubtypeCount();
                int j = 0;
                while (j < i) 
                {
                    InputMethodSubtype inputmethodsubtype = inputmethodinfo.getSubtypeAt(j);
                    CheckBoxPreference checkboxpreference = (CheckBoxPreference)preferencescreen.findPreference((new StringBuilder()).append(s).append(inputmethodsubtype.hashCode()).toString());
                    if (checkboxpreference != null)
                        checkboxpreference.setEnabled(flag);
                    j++;
                }
            }
        } while (true);
    }

    public static void updateSubtypesPreferenceChecked(SettingsPreferenceFragment settingspreferencefragment, List list, HashMap hashmap)
    {
        PreferenceScreen preferencescreen = settingspreferencefragment.getPreferenceScreen();
        Iterator iterator = list.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            InputMethodInfo inputmethodinfo = (InputMethodInfo)iterator.next();
            String s = inputmethodinfo.getId();
            if (!hashmap.containsKey(s))
                break;
            HashSet hashset = (HashSet)hashmap.get(s);
            int i = inputmethodinfo.getSubtypeCount();
            int j = 0;
            while (j < i) 
            {
                String s1 = String.valueOf(inputmethodinfo.getSubtypeAt(j).hashCode());
                CheckBoxPreference checkboxpreference = (CheckBoxPreference)preferencescreen.findPreference((new StringBuilder()).append(s).append(s1).toString());
                if (checkboxpreference != null)
                    checkboxpreference.setChecked(hashset.contains(s1));
                j++;
            }
        } while (true);
    }

}
