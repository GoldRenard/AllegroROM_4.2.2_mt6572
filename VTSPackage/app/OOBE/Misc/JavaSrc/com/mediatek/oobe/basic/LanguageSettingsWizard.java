// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic;

import android.app.*;
import android.app.backup.BackupManager;
import android.content.*;
import android.content.res.*;
import android.os.Bundle;
import android.os.RemoteException;
import android.telephony.TelephonyManager;
import android.text.format.DateFormat;
import android.view.View;
import android.widget.*;
import com.mediatek.oobe.utils.OOBEStepPreferenceActivity;
import com.mediatek.oobe.utils.Utils;
import com.mediatek.telephony.TelephonyManagerEx;
import com.mediatek.xlog.Xlog;
import java.text.Collator;
import java.util.Arrays;
import java.util.Locale;

public class LanguageSettingsWizard extends OOBEStepPreferenceActivity
{
    private static class Loc
        implements Comparable
    {

        static Collator sCollator = Collator.getInstance();
        String mLabel;
        Locale mLocale;

        public int compareTo(Loc loc)
        {
            return sCollator.compare(mLabel, loc.mLabel);
        }

        public volatile int compareTo(Object obj)
        {
            return compareTo((Loc)obj);
        }

        public String toString()
        {
            return mLabel;
        }


        public Loc(String s, Locale locale)
        {
            mLabel = s;
            mLocale = locale;
        }
    }


    private static final int DIALOG_WAITING_SWITCHING = 10001;
    private static final String TAG = "OOBE";
    private ArrayAdapter mAdapter;
    private Locale mCurrentLocale;
    private android.view.View.OnClickListener mEmergencyButtonClickListener;
    private Button mEmergencybtn;
    protected android.widget.AdapterView.OnItemSelectedListener mLangSelectListener;
    private Loc mLocales[];
    private Locale mSelectedLoc;
    private boolean mShowEmergencycall;
    private BroadcastReceiver mSimStateChangedListener;
    private IntentFilter mSimStateIntentFilter;
    private String mSpecialLocaleCodes[];
    private String mSpecialLocaleNames[];
    private Spinner mSpinner;

    public LanguageSettingsWizard()
    {
        mSpinner = null;
        mAdapter = null;
        mSimStateChangedListener = new BroadcastReceiver() {

            final LanguageSettingsWizard this$0;

            public void onReceive(Context context, Intent intent)
            {
                String s = intent.getAction();
                if (s != null && s.equals("android.intent.action.SIM_STATE_CHANGED"))
                {
                    String s1 = intent.getStringExtra("ss");
                    int i = intent.getIntExtra("simId", -1);
                    Xlog.d("OOBE", (new StringBuilder()).append("sim card status:").append(s1).append(";").append(i).toString());
                    if (s1.equals("READY"))
                    {
                        mShowEmergencycall = false;
                        if (mEmergencybtn.isShown() != mShowEmergencycall)
                            updateEmergencycallButton(mShowEmergencycall);
                    } else
                    if (s1.equals("NOT_READY"))
                    {
                        mShowEmergencycall = true;
                        if (mEmergencybtn.isShown() != mShowEmergencycall)
                            updateEmergencycallButton(mShowEmergencycall);
                    }
                    Xlog.d("OOBE", (new StringBuilder()).append("mShowEmergencycall:").append(mShowEmergencycall).append(" mEmergencybtn.isShown:").append(mEmergencybtn.isShown()).toString());
                }
            }

            
            {
                this$0 = LanguageSettingsWizard.this;
                super();
            }
        }
;
        mLangSelectListener = new android.widget.AdapterView.OnItemSelectedListener() {

            final LanguageSettingsWizard this$0;

            public void onItemSelected(AdapterView adapterview, View view, int i, long l)
            {
                mSelectedLoc = mLocales[i].mLocale;
            }

            public void onNothingSelected(AdapterView adapterview)
            {
            }

            
            {
                this$0 = LanguageSettingsWizard.this;
                super();
            }
        }
;
        mEmergencyButtonClickListener = new android.view.View.OnClickListener() {

            final LanguageSettingsWizard this$0;

            public void onClick(View view)
            {
                Intent intent = new Intent("com.android.phone.EmergencyDialer.DIAL");
                intent.setFlags(0x10800000);
                startActivity(intent);
            }

            
            {
                this$0 = LanguageSettingsWizard.this;
                super();
            }
        }
;
    }

    private String getDisplayName(Locale locale)
    {
        String s = locale.toString();
        for (int i = 0; i < mSpecialLocaleCodes.length; i++)
            if (mSpecialLocaleCodes[i].equals(s))
                return mSpecialLocaleNames[i];

        return locale.getDisplayName(locale);
    }

    private Locale getLanguage()
    {
        Xlog.v("OOBE", "Get Language");
        Locale locale;
        try
        {
            locale = ActivityManagerNative.getDefault().getConfiguration().locale;
        }
        catch (RemoteException remoteexception)
        {
            Xlog.e("OOBE", "Excetpion");
            remoteexception.printStackTrace();
            return null;
        }
        return locale;
    }

    private void initLanguageSettings()
    {
        mSpecialLocaleCodes = getResources().getStringArray(0x7f060000);
        mSpecialLocaleNames = getResources().getStringArray(0x7f060001);
        String as[] = getAssets().getLocales();
        Arrays.sort(as);
        int i = as.length;
        Loc aloc[] = new Loc[i];
        int j = 0;
        int k;
        int j1;
        for (k = 0; j < i; k = j1)
        {
            String s = as[j];
            if (s.length() == 5)
            {
                String s1 = s.substring(0, 2);
                Locale locale = new Locale(s1, s.substring(3, 5));
                if (k == 0)
                {
                    j1 = k + 1;
                    Loc loc2 = new Loc(toTitleCase(locale.getDisplayLanguage(locale)), locale);
                    aloc[k] = loc2;
                } else
                if (aloc[k - 1].mLocale.getLanguage().equals(s1))
                {
                    aloc[k - 1].mLabel = toTitleCase(getDisplayName(aloc[k - 1].mLocale));
                    j1 = k + 1;
                    Loc loc1 = new Loc(toTitleCase(getDisplayName(locale)), locale);
                    aloc[k] = loc1;
                } else
                {
                    String s2;
                    if (s.equals("zz_ZZ"))
                        s2 = "Pseudo...";
                    else
                        s2 = toTitleCase(locale.getDisplayLanguage(locale));
                    j1 = k + 1;
                    Loc loc = new Loc(s2, locale);
                    aloc[k] = loc;
                }
            } else
            {
                j1 = k;
            }
            j++;
        }

        mLocales = new Loc[k];
        for (int l = 0; l < k; l++)
            mLocales[l] = aloc[l];

        Arrays.sort(mLocales);
        mCurrentLocale = getLanguage();
        mAdapter.clear();
        for (int i1 = 0; i1 < k; i1++)
        {
            mAdapter.add(mLocales[i1].toString());
            if (mCurrentLocale != null && mCurrentLocale.equals(mLocales[i1].mLocale))
                mSpinner.setSelection(i1, true);
        }

    }

    private boolean isEmergencycallShow()
    {
        Xlog.d("OOBE", "LanuageSettingsWizard getEmergencycallAvialiable() function");
        TelephonyManagerEx telephonymanagerex = TelephonyManagerEx.getDefault();
        if (Utils.isGemini())
        {
            int i = telephonymanagerex.getSimState(0);
            int j = telephonymanagerex.getSimState(1);
            Xlog.d("OOBE", (new StringBuilder()).append("LanuageSettingsWizard isGemini true").append(i).append(" : ").append(j).toString());
            if (i == 5 || j == 5)
                return false;
        } else
        {
            TelephonyManager telephonymanager = (TelephonyManager)getSystemService("phone");
            Xlog.d("OOBE", "LanuageSettingsWizard isGemini false");
            if (telephonymanager.getSimState() == 5)
                return false;
        }
        return true;
    }

    private void setLanguage(Locale locale)
    {
        Xlog.v("OOBE", (new StringBuilder()).append("------Set Language: ").append(locale.getCountry()).toString());
        try
        {
            IActivityManager iactivitymanager = ActivityManagerNative.getDefault();
            Configuration configuration = iactivitymanager.getConfiguration();
            configuration.locale = locale;
            configuration.userSetLocale = true;
            iactivitymanager.updateConfiguration(configuration);
        }
        catch (RemoteException remoteexception)
        {
            Xlog.e("OOBE", "Excetpion");
            remoteexception.printStackTrace();
        }
        Xlog.v("OOBE", "------Set Language: updateHourFormat");
        updateHourFormat();
        BackupManager.dataChanged("com.android.providers.settings");
    }

    private static String toTitleCase(String s)
    {
        if (s.length() == 0)
            return s;
        else
            return (new StringBuilder()).append(Character.toUpperCase(s.charAt(0))).append(s.substring(1)).toString();
    }

    private void updateEmergencycallButton(boolean flag)
    {
        Xlog.d("OOBE", (new StringBuilder()).append("mShowEmergencycall:").append(mShowEmergencycall).toString());
        boolean flag1;
        if (Utils.isWifiOnly(this))
            flag1 = false;
        else
            flag1 = flag;
        Xlog.d("OOBE", (new StringBuilder()).append("[updateEmergencycallButton] toShow:").append(flag1).toString());
        if (flag1)
        {
            mEmergencybtn.setVisibility(0);
            mEmergencybtn.setOnClickListener(mEmergencyButtonClickListener);
            return;
        } else
        {
            mEmergencybtn.setVisibility(8);
            mEmergencybtn.setOnClickListener(null);
            return;
        }
    }

    private void updateHourFormat()
    {
        if (!DateFormat.is24HourFormat(getApplicationContext()) && getResources().getString(0x1040030).indexOf('H') >= 0)
            android.provider.Settings.System.putString(getApplicationContext().getContentResolver(), "time_12_24", "24");
    }

    protected String getStepSpecialTag()
    {
        return "LanguageSetupActivity";
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Xlog.d("OOBE", "OnCreate LanguageSettingsWizard");
        mSimStateIntentFilter = new IntentFilter("android.intent.action.SIM_STATE_CHANGED");
        mSpinner = (Spinner)findViewById(0x7f0b000d);
        mSpinner.setVisibility(0);
        mAdapter = new ArrayAdapter(this, 0x7f030008, 0x7f0b0019);
        mSpinner.setAdapter(mAdapter);
        mSpinner.setOnItemSelectedListener(mLangSelectListener);
        ((LinearLayout)findViewById(0x7f0b000f)).setVisibility(0);
        findViewById(0x102000a).setVisibility(8);
        mShowEmergencycall = isEmergencycallShow();
        mEmergencybtn = (Button)findViewById(0x7f0b000e);
        updateEmergencycallButton(mShowEmergencycall);
        initSpecialLayout(0x7f09004d, 0x7f09004e);
    }

    protected Dialog onCreateDialog(int i)
    {
        if (i == 10001)
        {
            ProgressDialog progressdialog = new ProgressDialog(this);
            progressdialog.setMessage(getResources().getString(0x7f090060));
            progressdialog.setCancelable(false);
            progressdialog.setIndeterminate(true);
            return progressdialog;
        } else
        {
            return null;
        }
    }

    public void onDestroy()
    {
        Xlog.v("OOBE", "LanguageSetupActivity onDestroy");
        removeDialog(10001);
        super.onDestroy();
    }

    public void onNextStep(boolean flag)
    {
        if (!flag)
        {
            Xlog.i("OOBE", "Back to former settings");
            finishActivityByResultCode(21);
            return;
        }
        Xlog.i("OOBE", "Forward to next settings");
        if (super.mLastStep)
        {
            finishActivityByResultCode(22);
            return;
        }
        if (mSelectedLoc != null && !mSelectedLoc.getCountry().equals(mCurrentLocale.getCountry()))
        {
            Xlog.i("OOBE", "Set Language");
            showDialog(10001);
            setLanguage(mSelectedLoc);
        }
        Xlog.i("OOBE", "------RESULT_CODE_NEXT");
        finishActivityByResultCode(20);
    }

    public void onPause()
    {
        super.onPause();
        unregisterReceiver(mSimStateChangedListener);
    }

    public void onResume()
    {
        super.onResume();
        initLanguageSettings();
        registerReceiver(mSimStateChangedListener, mSimStateIntentFilter);
    }



/*
    static boolean access$002(LanguageSettingsWizard languagesettingswizard, boolean flag)
    {
        languagesettingswizard.mShowEmergencycall = flag;
        return flag;
    }

*/




/*
    static Locale access$302(LanguageSettingsWizard languagesettingswizard, Locale locale)
    {
        languagesettingswizard.mSelectedLoc = locale;
        return locale;
    }

*/

}
