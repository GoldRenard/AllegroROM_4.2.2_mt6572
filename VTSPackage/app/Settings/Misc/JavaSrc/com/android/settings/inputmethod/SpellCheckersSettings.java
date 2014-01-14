// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.inputmethod;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.pm.ApplicationInfo;
import android.content.pm.ServiceInfo;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.view.textservice.SpellCheckerInfo;
import android.view.textservice.TextServicesManager;
import com.android.settings.SettingsPreferenceFragment;
import java.util.ArrayList;
import java.util.Iterator;

// Referenced classes of package com.android.settings.inputmethod:
//            SingleSpellCheckerPreference, SpellCheckerUtils

public class SpellCheckersSettings extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceClickListener
{

    private static final boolean DBG;
    private static final String TAG = com/android/settings/inputmethod/SpellCheckersSettings.getSimpleName();
    private SpellCheckerInfo mCurrentSci;
    private AlertDialog mDialog;
    private SpellCheckerInfo mEnabledScis[];
    private final ArrayList mSpellCheckers = new ArrayList();
    private TextServicesManager mTsm;

    public SpellCheckersSettings()
    {
        mDialog = null;
    }

    private void changeCurrentSpellChecker(SingleSpellCheckerPreference singlespellcheckerpreference)
    {
        mTsm.setCurrentSpellChecker(singlespellcheckerpreference.getSpellCheckerInfo());
        updateScreen();
    }

    private static boolean isSystemApp(SpellCheckerInfo spellcheckerinfo)
    {
        return (1 & spellcheckerinfo.getServiceInfo().applicationInfo.flags) != 0;
    }

    private void saveState()
    {
        SpellCheckerUtils.setCurrentSpellChecker(mTsm, mCurrentSci);
    }

    private void showSecurityWarnDialog(final SingleSpellCheckerPreference scp)
    {
        if (mDialog != null && mDialog.isShowing())
            mDialog.dismiss();
        mDialog = (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x1040014).setIconAttribute(0x1010355).setCancelable(true).setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

            final SpellCheckersSettings this$0;
            final SingleSpellCheckerPreference val$scp;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                changeCurrentSpellChecker(scp);
            }

            
            {
                this$0 = SpellCheckersSettings.this;
                scp = singlespellcheckerpreference;
                super();
            }
        }
).setNegativeButton(0x1040000, new android.content.DialogInterface.OnClickListener() {

            final SpellCheckersSettings this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
            }

            
            {
                this$0 = SpellCheckersSettings.this;
                super();
            }
        }
).create();
        AlertDialog alertdialog = mDialog;
        Resources resources = getResources();
        Object aobj[] = new Object[1];
        aobj[0] = scp.getSpellCheckerInfo().getServiceInfo().applicationInfo.loadLabel(getActivity().getPackageManager());
        alertdialog.setMessage(resources.getString(0x7f0b06c6, aobj));
        mDialog.show();
    }

    private void updateEnabledSpellCheckers()
    {
        android.content.pm.PackageManager packagemanager = getPackageManager();
        mCurrentSci = SpellCheckerUtils.getCurrentSpellChecker(mTsm);
        mEnabledScis = SpellCheckerUtils.getEnabledSpellCheckers(mTsm);
        if (mCurrentSci != null && mEnabledScis != null)
        {
            mSpellCheckers.clear();
            for (int i = 0; i < mEnabledScis.length; i++)
            {
                SpellCheckerInfo spellcheckerinfo = mEnabledScis[i];
                SingleSpellCheckerPreference singlespellcheckerpreference = new SingleSpellCheckerPreference(this, null, spellcheckerinfo, mTsm);
                mSpellCheckers.add(singlespellcheckerpreference);
                singlespellcheckerpreference.setTitle(spellcheckerinfo.loadLabel(packagemanager));
                boolean flag;
                if (mCurrentSci != null && mCurrentSci.getId().equals(spellcheckerinfo.getId()))
                    flag = true;
                else
                    flag = false;
                singlespellcheckerpreference.setSelected(flag);
                getPreferenceScreen().addPreference(singlespellcheckerpreference);
            }

        }
    }

    private void updateScreen()
    {
        getPreferenceScreen().removeAll();
        updateEnabledSpellCheckers();
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mTsm = (TextServicesManager)getSystemService("textservices");
        addPreferencesFromResource(0x7f050039);
        updateScreen();
    }

    public void onPause()
    {
        super.onPause();
        saveState();
    }

    public boolean onPreferenceClick(Preference preference)
    {
        SingleSpellCheckerPreference singlespellcheckerpreference = null;
        Iterator iterator = mSpellCheckers.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            SingleSpellCheckerPreference singlespellcheckerpreference1 = (SingleSpellCheckerPreference)iterator.next();
            if (preference.equals(singlespellcheckerpreference1))
                singlespellcheckerpreference = singlespellcheckerpreference1;
        } while (true);
        if (singlespellcheckerpreference != null)
            if (!isSystemApp(singlespellcheckerpreference.getSpellCheckerInfo()))
                showSecurityWarnDialog(singlespellcheckerpreference);
            else
                changeCurrentSpellChecker(singlespellcheckerpreference);
        return true;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        return false;
    }

    public void onResume()
    {
        super.onResume();
        updateScreen();
    }


}
