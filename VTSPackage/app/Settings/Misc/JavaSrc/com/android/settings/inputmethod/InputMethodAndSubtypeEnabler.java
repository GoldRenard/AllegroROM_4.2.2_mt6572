// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.inputmethod;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.*;
import android.content.pm.ApplicationInfo;
import android.content.pm.ServiceInfo;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.*;
import android.text.TextUtils;
import android.util.Log;
import android.view.inputmethod.*;
import com.android.settings.SettingsPreferenceFragment;
import java.util.*;

// Referenced classes of package com.android.settings.inputmethod:
//            InputMethodAndSubtypeUtil

public class InputMethodAndSubtypeEnabler extends SettingsPreferenceFragment
{
    private static class SubtypeCheckBoxPreference extends CheckBoxPreference
    {

        private final boolean mIsSystemLanguage;
        private final boolean mIsSystemLocale;

        public int compareTo(Preference preference)
        {
            byte byte0 = -1;
            if (preference instanceof SubtypeCheckBoxPreference)
            {
                SubtypeCheckBoxPreference subtypecheckboxpreference = (SubtypeCheckBoxPreference)preference;
                CharSequence charsequence = getTitle();
                CharSequence charsequence1 = subtypecheckboxpreference.getTitle();
                if (TextUtils.equals(charsequence, charsequence1))
                    byte0 = 0;
                else
                if (!mIsSystemLocale)
                {
                    if (subtypecheckboxpreference.mIsSystemLocale)
                        return 1;
                    if (!mIsSystemLanguage)
                    {
                        if (subtypecheckboxpreference.mIsSystemLanguage)
                            return 1;
                        if (TextUtils.isEmpty(charsequence))
                            return 1;
                        if (!TextUtils.isEmpty(charsequence1))
                            return charsequence.toString().compareTo(charsequence1.toString());
                    }
                }
                return byte0;
            } else
            {
                Log.w(InputMethodAndSubtypeEnabler.TAG, "Illegal preference type.");
                return byte0;
            }
        }

        public volatile int compareTo(Object obj)
        {
            return compareTo((Preference)obj);
        }

        public SubtypeCheckBoxPreference(Context context, String s, String s1)
        {
            boolean flag;
label0:
            {
                super(context);
                if (TextUtils.isEmpty(s))
                {
                    mIsSystemLocale = false;
                    mIsSystemLanguage = false;
                    return;
                }
                mIsSystemLocale = s.equals(s1);
                if (!mIsSystemLocale)
                {
                    boolean flag1 = s.startsWith(s1.substring(0, 2));
                    flag = false;
                    if (!flag1)
                        break label0;
                }
                flag = true;
            }
            mIsSystemLanguage = flag;
        }
    }


    private static final String TAG = com/android/settings/inputmethod/InputMethodAndSubtypeEnabler.getSimpleName();
    private AlertDialog mDialog;
    private boolean mHaveHardKeyboard;
    private InputMethodManager mImm;
    private final HashMap mInputMethodAndSubtypePrefsMap = new HashMap();
    private String mInputMethodId;
    private List mInputMethodProperties;
    private final HashMap mSubtypeAutoSelectionCBMap = new HashMap();
    private String mSystemLocale;
    private String mTitle;

    public InputMethodAndSubtypeEnabler()
    {
        mDialog = null;
        mSystemLocale = "";
    }

    private void clearImplicitlyEnabledSubtypes(String s)
    {
        updateImplicitlyEnabledSubtypes(s, false);
    }

    private PreferenceScreen createPreferenceHierarchy()
    {
        PreferenceScreen preferencescreen = getPreferenceManager().createPreferenceScreen(getActivity());
        Activity activity = getActivity();
        int i;
        if (mInputMethodProperties == null)
            i = 0;
        else
            i = mInputMethodProperties.size();
        for (int j = 0; j < i; j++)
        {
            InputMethodInfo inputmethodinfo = (InputMethodInfo)mInputMethodProperties.get(j);
            int k = inputmethodinfo.getSubtypeCount();
            if (k <= 1)
                continue;
            String s = inputmethodinfo.getId();
            if (!TextUtils.isEmpty(mInputMethodId) && !mInputMethodId.equals(s))
                continue;
            PreferenceCategory preferencecategory = new PreferenceCategory(activity);
            preferencescreen.addPreference(preferencecategory);
            preferencecategory.setTitle(inputmethodinfo.loadLabel(getPackageManager()));
            preferencecategory.setKey(s);
            CheckBoxPreference checkboxpreference = new CheckBoxPreference(activity);
            mSubtypeAutoSelectionCBMap.put(s, checkboxpreference);
            preferencecategory.addPreference(checkboxpreference);
            PreferenceCategory preferencecategory1 = new PreferenceCategory(activity);
            preferencecategory1.setTitle(0x7f0b0700);
            preferencescreen.addPreference(preferencecategory1);
            ArrayList arraylist = new ArrayList();
            CharSequence charsequence = null;
            boolean flag = false;
            if (k > 0)
            {
                for (int l = 0; l < k; l++)
                {
                    InputMethodSubtype inputmethodsubtype = inputmethodinfo.getSubtypeAt(l);
                    CharSequence charsequence1 = inputmethodsubtype.getDisplayName(activity, inputmethodinfo.getPackageName(), inputmethodinfo.getServiceInfo().applicationInfo);
                    if (inputmethodsubtype.overridesImplicitlyEnabledSubtype())
                    {
                        if (!flag)
                        {
                            flag = true;
                            charsequence = charsequence1;
                        }
                    } else
                    {
                        SubtypeCheckBoxPreference subtypecheckboxpreference = new SubtypeCheckBoxPreference(activity, inputmethodsubtype.getLocale(), mSystemLocale);
                        subtypecheckboxpreference.setKey((new StringBuilder()).append(s).append(inputmethodsubtype.hashCode()).toString());
                        subtypecheckboxpreference.setTitle(charsequence1);
                        arraylist.add(subtypecheckboxpreference);
                    }
                }

                Collections.sort(arraylist);
                for (int i1 = 0; i1 < arraylist.size(); i1++)
                    preferencecategory1.addPreference((Preference)arraylist.get(i1));

                mInputMethodAndSubtypePrefsMap.put(s, arraylist);
            }
            if (flag)
            {
                if (TextUtils.isEmpty(charsequence))
                {
                    Log.w(TAG, "Title for auto subtype is empty.");
                    checkboxpreference.setTitle("---");
                } else
                {
                    checkboxpreference.setTitle(charsequence);
                }
            } else
            {
                checkboxpreference.setTitle(0x7f0b0701);
            }
        }

        return preferencescreen;
    }

    private boolean isNoSubtypesExplicitlySelected(String s)
    {
        boolean flag = true;
        Iterator iterator = ((List)mInputMethodAndSubtypePrefsMap.get(s)).iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            Preference preference = (Preference)iterator.next();
            if (!(preference instanceof CheckBoxPreference) || !((CheckBoxPreference)preference).isChecked())
                continue;
            flag = false;
            break;
        } while (true);
        return flag;
    }

    private void onCreateIMM()
    {
        mInputMethodProperties = ((InputMethodManager)getSystemService("input_method")).getInputMethodList();
    }

    private void setCheckedImplicitlyEnabledSubtypes(String s)
    {
        updateImplicitlyEnabledSubtypes(s, true);
    }

    private void setSubtypeAutoSelectionEnabled(String s, boolean flag)
    {
        CheckBoxPreference checkboxpreference = (CheckBoxPreference)mSubtypeAutoSelectionCBMap.get(s);
        if (checkboxpreference != null)
        {
            checkboxpreference.setChecked(flag);
            Iterator iterator = ((List)mInputMethodAndSubtypePrefsMap.get(s)).iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                Preference preference = (Preference)iterator.next();
                if (preference instanceof CheckBoxPreference)
                {
                    boolean flag1;
                    if (!flag)
                        flag1 = true;
                    else
                        flag1 = false;
                    preference.setEnabled(flag1);
                    if (flag)
                        ((CheckBoxPreference)preference).setChecked(false);
                }
            } while (true);
            if (flag)
            {
                InputMethodAndSubtypeUtil.saveInputMethodSubtypeList(this, getContentResolver(), mInputMethodProperties, mHaveHardKeyboard);
                setCheckedImplicitlyEnabledSubtypes(s);
                return;
            }
        }
    }

    private void updateAutoSelectionCB()
    {
        String s;
        for (Iterator iterator = mInputMethodAndSubtypePrefsMap.keySet().iterator(); iterator.hasNext(); setSubtypeAutoSelectionEnabled(s, isNoSubtypesExplicitlySelected(s)))
            s = (String)iterator.next();

        setCheckedImplicitlyEnabledSubtypes(null);
    }

    private void updateImplicitlyEnabledSubtypes(String s, boolean flag)
    {
        Iterator iterator = mInputMethodProperties.iterator();
        do
        {
label0:
            {
                String s1;
                List list;
                List list1;
                do
                {
                    InputMethodInfo inputmethodinfo;
                    CheckBoxPreference checkboxpreference;
                    do
                    {
                        do
                        {
                            if (!iterator.hasNext())
                                break label0;
                            inputmethodinfo = (InputMethodInfo)iterator.next();
                            s1 = inputmethodinfo.getId();
                        } while (s != null && !s.equals(s1));
                        checkboxpreference = (CheckBoxPreference)mSubtypeAutoSelectionCBMap.get(s1);
                    } while (checkboxpreference == null || !checkboxpreference.isChecked());
                    list = (List)mInputMethodAndSubtypePrefsMap.get(s1);
                    list1 = mImm.getEnabledInputMethodSubtypeList(inputmethodinfo, true);
                } while (list == null || list1 == null);
                Iterator iterator1 = list.iterator();
label1:
                do
                {
                    if (!iterator1.hasNext())
                        break;
                    Preference preference = (Preference)iterator1.next();
                    if (!(preference instanceof CheckBoxPreference))
                        continue;
                    CheckBoxPreference checkboxpreference1 = (CheckBoxPreference)preference;
                    checkboxpreference1.setChecked(false);
                    if (!flag)
                        continue;
                    Iterator iterator2 = list1.iterator();
                    String s2;
                    do
                    {
                        if (!iterator2.hasNext())
                            continue label1;
                        InputMethodSubtype inputmethodsubtype = (InputMethodSubtype)iterator2.next();
                        s2 = (new StringBuilder()).append(s1).append(inputmethodsubtype.hashCode()).toString();
                    } while (!checkboxpreference1.getKey().equals(s2));
                    checkboxpreference1.setChecked(true);
                } while (true);
            }
        } while (true);
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        if (!TextUtils.isEmpty(mTitle))
            getActivity().setTitle(mTitle);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mImm = (InputMethodManager)getSystemService("input_method");
        Configuration configuration = getResources().getConfiguration();
        boolean flag;
        if (configuration.keyboard == 2)
            flag = true;
        else
            flag = false;
        mHaveHardKeyboard = flag;
        Bundle bundle1 = getArguments();
        mInputMethodId = getActivity().getIntent().getStringExtra("input_method_id");
        if (mInputMethodId == null && bundle1 != null)
        {
            String s1 = bundle1.getString("input_method_id");
            if (s1 != null)
                mInputMethodId = s1;
        }
        mTitle = getActivity().getIntent().getStringExtra("android.intent.extra.TITLE");
        if (mTitle == null && bundle1 != null)
        {
            String s = bundle1.getString("android.intent.extra.TITLE");
            if (s != null)
                mTitle = s;
        }
        mSystemLocale = configuration.locale.toString();
        onCreateIMM();
        setPreferenceScreen(createPreferenceHierarchy());
    }

    public void onDestroy()
    {
        super.onDestroy();
        if (mDialog != null)
        {
            mDialog.dismiss();
            mDialog = null;
        }
    }

    public void onPause()
    {
        super.onPause();
        clearImplicitlyEnabledSubtypes(null);
        InputMethodAndSubtypeUtil.saveInputMethodSubtypeList(this, getContentResolver(), mInputMethodProperties, mHaveHardKeyboard);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference instanceof CheckBoxPreference)
        {
            final CheckBoxPreference chkPref = (CheckBoxPreference)preference;
            for (Iterator iterator = mSubtypeAutoSelectionCBMap.keySet().iterator(); iterator.hasNext();)
            {
                String s = (String)iterator.next();
                if (mSubtypeAutoSelectionCBMap.get(s) == chkPref)
                {
                    setSubtypeAutoSelectionEnabled(s, chkPref.isChecked());
                    return super.onPreferenceTreeClick(preferencescreen, preference);
                }
            }

            final String id = chkPref.getKey();
            if (chkPref.isChecked())
            {
                int i = mInputMethodProperties.size();
                int j = 0;
label0:
                do
                {
label1:
                    {
                        InputMethodInfo inputmethodinfo = null;
                        if (j < i)
                        {
                            InputMethodInfo inputmethodinfo1 = (InputMethodInfo)mInputMethodProperties.get(j);
                            if (!id.equals(inputmethodinfo1.getId()))
                                break label1;
                            inputmethodinfo = inputmethodinfo1;
                            if (InputMethodAndSubtypeUtil.isSystemIme(inputmethodinfo1))
                            {
                                InputMethodAndSubtypeUtil.setSubtypesPreferenceEnabled(this, mInputMethodProperties, id, true);
                                return super.onPreferenceTreeClick(preferencescreen, preference);
                            }
                        }
                        if (inputmethodinfo == null)
                            return super.onPreferenceTreeClick(preferencescreen, preference);
                        chkPref.setChecked(false);
                        if (mDialog == null)
                            mDialog = (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x1040014).setIconAttribute(0x1010355).setCancelable(true).setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

                                final InputMethodAndSubtypeEnabler this$0;
                                final CheckBoxPreference val$chkPref;
                                final String val$id;

                                public void onClick(DialogInterface dialoginterface, int k)
                                {
                                    chkPref.setChecked(true);
                                    InputMethodAndSubtypeUtil.setSubtypesPreferenceEnabled(InputMethodAndSubtypeEnabler.this, mInputMethodProperties, id, true);
                                }

            
            {
                this$0 = InputMethodAndSubtypeEnabler.this;
                chkPref = checkboxpreference;
                id = s;
                super();
            }
                            }
).setNegativeButton(0x1040000, new android.content.DialogInterface.OnClickListener() {

                                final InputMethodAndSubtypeEnabler this$0;

                                public void onClick(DialogInterface dialoginterface, int k)
                                {
                                }

            
            {
                this$0 = InputMethodAndSubtypeEnabler.this;
                super();
            }
                            }
).create();
                        else
                        if (mDialog.isShowing())
                            mDialog.dismiss();
                        AlertDialog alertdialog = mDialog;
                        Resources resources = getResources();
                        Object aobj[] = new Object[1];
                        aobj[0] = inputmethodinfo.getServiceInfo().applicationInfo.loadLabel(getPackageManager());
                        alertdialog.setMessage(resources.getString(0x7f0b06c5, aobj));
                        mDialog.show();
                        break label0;
                    }
                    j++;
                } while (true);
            } else
            {
                InputMethodAndSubtypeUtil.setSubtypesPreferenceEnabled(this, mInputMethodProperties, id, false);
                updateAutoSelectionCB();
            }
        }
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }

    public void onResume()
    {
        super.onResume();
        InputMethodAndSubtypeUtil.loadInputMethodSubtypeList(this, getContentResolver(), mInputMethodProperties, mInputMethodAndSubtypePrefsMap);
        updateAutoSelectionCB();
    }



}
