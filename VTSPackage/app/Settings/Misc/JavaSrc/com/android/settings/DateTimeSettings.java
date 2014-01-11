// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.TimePickerDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.text.format.DateFormat;
import android.text.format.Time;
import android.util.Log;
import android.widget.DatePicker;
import android.widget.ListView;
import android.widget.TimePicker;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

// Referenced classes of package com.android.settings:
//            SettingsPreferenceFragment, Utils

public class DateTimeSettings extends SettingsPreferenceFragment
    implements android.content.SharedPreferences.OnSharedPreferenceChangeListener, android.app.TimePickerDialog.OnTimeSetListener, android.app.DatePickerDialog.OnDateSetListener, android.content.DialogInterface.OnClickListener, android.content.DialogInterface.OnCancelListener
{

    private static final int AUTO_TIME_GPS_INDEX = 1;
    private static final int AUTO_TIME_NETWORK_INDEX = 0;
    private static final int AUTO_TIME_OFF_INDEX = 2;
    private static final int DIALOG_DATEPICKER = 0;
    private static final int DIALOG_GPS_CONFIRM = 2;
    private static final int DIALOG_TIMEPICKER = 1;
    protected static final String EXTRA_IS_FIRST_RUN = "firstRun";
    private static final String HOURS_12 = "12";
    private static final String HOURS_24 = "24";
    private static final String KEY_AUTO_TIME = "auto_time_list";
    private static final String KEY_AUTO_TIME_ZONE = "auto_zone";
    private static final String KEY_DATE_FORMAT = "date_format";
    private static final String TAG = "DateTimeSettings";
    private ListPreference mAutoTimePref;
    private CheckBoxPreference mAutoTimeZonePref;
    private ListPreference mDateFormat;
    private Preference mDatePref;
    private Calendar mDummyDate;
    private BroadcastReceiver mIntentReceiver;
    private Preference mTime24Pref;
    private Preference mTimePref;
    private Preference mTimeZone;

    public DateTimeSettings()
    {
        mIntentReceiver = new BroadcastReceiver() {

            final DateTimeSettings this$0;

            public void onReceive(Context context, Intent intent)
            {
                Activity activity = getActivity();
                if (activity != null)
                {
                    updateTimeAndDateDisplay(activity);
                    updateDateFormatEntries();
                }
            }

            
            {
                this$0 = DateTimeSettings.this;
                super();
            }
        }
;
    }

    private static StringBuilder formatOffset(StringBuilder stringbuilder, TimeZone timezone, Date date)
    {
        int i = timezone.getOffset(date.getTime()) / 1000 / 60;
        stringbuilder.append("GMT");
        if (i < 0)
        {
            stringbuilder.append('-');
            i = -i;
        } else
        {
            stringbuilder.append('+');
        }
        int j = i / 60;
        int k = i % 60;
        stringbuilder.append((char)(48 + j / 10));
        stringbuilder.append((char)(48 + j % 10));
        stringbuilder.append(':');
        stringbuilder.append((char)(48 + k / 10));
        stringbuilder.append((char)(48 + k % 10));
        return stringbuilder;
    }

    private boolean getAutoState(String s)
    {
        int i;
        boolean flag;
        try
        {
            i = android.provider.Settings.Global.getInt(getContentResolver(), s);
        }
        catch (android.provider.Settings.SettingNotFoundException settingnotfoundexception)
        {
            return false;
        }
        flag = false;
        if (i > 0)
            flag = true;
        return flag;
    }

    private String getDateFormat()
    {
        return android.provider.Settings.System.getString(getContentResolver(), "date_format");
    }

    static String getTimeZoneText(TimeZone timezone)
    {
        Date date = new Date();
        return formatOffset(new StringBuilder(), timezone, date).append(", ").append(timezone.getDisplayName(timezone.inDaylightTime(date), 1)).toString();
    }

    private void initUI()
    {
        boolean flag = getAutoState("auto_time");
        boolean flag1 = getAutoState("auto_time_zone");
        boolean flag2 = getAutoState("auto_time_gps");
        boolean flag3 = getActivity().getIntent().getBooleanExtra("firstRun", false);
        mDummyDate = Calendar.getInstance();
        mAutoTimePref = (ListPreference)findPreference("auto_time_list");
        if (flag)
            mAutoTimePref.setValueIndex(0);
        else
        if (flag2)
            mAutoTimePref.setValueIndex(1);
        else
            mAutoTimePref.setValueIndex(2);
        mAutoTimePref.setSummary(mAutoTimePref.getValue());
        mAutoTimeZonePref = (CheckBoxPreference)findPreference("auto_zone");
        if (Utils.isWifiOnly(getActivity()) || flag3)
        {
            getPreferenceScreen().removePreference(mAutoTimeZonePref);
            flag1 = false;
        }
        mAutoTimeZonePref.setChecked(flag1);
        mTimePref = findPreference("time");
        mTime24Pref = findPreference("24 hour");
        mTimeZone = findPreference("timezone");
        mDatePref = findPreference("date");
        mDateFormat = (ListPreference)findPreference("date_format");
        if (flag3)
        {
            getPreferenceScreen().removePreference(mTime24Pref);
            getPreferenceScreen().removePreference(mDateFormat);
        }
        String as[] = getResources().getStringArray(0x7f070001);
        String as1[] = new String[as.length];
        String s = getDateFormat();
        if (s == null)
            s = "";
        for (int i = 0; i < as1.length; i++)
        {
            String s1 = DateFormat.getDateFormatForSetting(getActivity(), as[i]).format(mDummyDate.getTime());
            if (as[i].length() == 0)
                as1[i] = getResources().getString(0x7f0b02f5, new Object[] {
                    s1
                });
            else
                as1[i] = s1;
        }

        mDateFormat.setEntries(as1);
        mDateFormat.setEntryValues(0x7f070001);
        mDateFormat.setValue(s);
        boolean flag4;
        if (!flag && !flag2)
            flag4 = false;
        else
            flag4 = true;
        Preference preference = mTimePref;
        boolean flag5;
        if (!flag4)
            flag5 = true;
        else
            flag5 = false;
        preference.setEnabled(flag5);
        Preference preference1 = mDatePref;
        boolean flag6;
        if (!flag4)
            flag6 = true;
        else
            flag6 = false;
        preference1.setEnabled(flag6);
        Preference preference2 = mTimeZone;
        boolean flag7;
        if (!flag1)
            flag7 = true;
        else
            flag7 = false;
        preference2.setEnabled(flag7);
    }

    private boolean is24Hour()
    {
        return DateFormat.is24HourFormat(getActivity());
    }

    private void reSetAutoTimePref()
    {
        Log.d("DateTimeSettings", "reset AutoTimePref as cancel the selection");
        boolean flag = getAutoState("auto_time");
        boolean flag1 = getAutoState("auto_time_gps");
        if (flag)
            mAutoTimePref.setValueIndex(0);
        else
        if (flag1)
            mAutoTimePref.setValueIndex(1);
        else
            mAutoTimePref.setValueIndex(2);
        mAutoTimePref.setSummary(mAutoTimePref.getValue());
    }

    private void set24Hour(boolean flag)
    {
        android.content.ContentResolver contentresolver = getContentResolver();
        String s;
        if (flag)
            s = "24";
        else
            s = "12";
        android.provider.Settings.System.putString(contentresolver, "time_12_24", s);
    }

    static void setDate(Context context, int i, int j, int k)
    {
        Calendar calendar = Calendar.getInstance();
        calendar.set(1, i);
        calendar.set(2, j);
        calendar.set(5, k);
        long l = calendar.getTimeInMillis();
        if (l / 1000L < 0x7fffffffL)
            ((AlarmManager)context.getSystemService("alarm")).setTime(l);
    }

    private void setDateRange(DatePickerDialog datepickerdialog)
    {
        if (datepickerdialog != null)
        {
            Time time = new Time();
            Time time1 = new Time();
            time.set(0, 0, 0, 1, 0, 1970);
            time1.set(59, 59, 23, 31, 11, 2037);
            long l = 999L + time1.toMillis(false);
            long l1 = time.toMillis(false);
            datepickerdialog.getDatePicker().setMinDate(l1);
            datepickerdialog.getDatePicker().setMaxDate(l);
        }
    }

    static void setTime(Context context, int i, int j)
    {
        Calendar calendar = Calendar.getInstance();
        calendar.set(11, i);
        calendar.set(12, j);
        calendar.set(13, 0);
        calendar.set(14, 0);
        long l = calendar.getTimeInMillis();
        if (l / 1000L < 0x7fffffffL)
            ((AlarmManager)context.getSystemService("alarm")).setTime(l);
    }

    private void timeUpdated()
    {
        Intent intent = new Intent("android.intent.action.TIME_SET");
        getActivity().sendBroadcast(intent);
    }

    private void updateDateFormatEntries()
    {
        String as[] = getResources().getStringArray(0x7f070001);
        String as1[] = new String[as.length];
        for (int i = 0; i < as1.length; i++)
        {
            String s = DateFormat.getDateFormatForSetting(getActivity(), as[i]).format(mDummyDate.getTime());
            if (as[i].length() == 0)
                as1[i] = getResources().getString(0x7f0b02f5, new Object[] {
                    s
                });
            else
                as1[i] = s;
        }

        mDateFormat.setEntries(as1);
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
        updateTimeAndDateDisplay(getActivity());
    }

    public void onCancel(DialogInterface dialoginterface)
    {
        Log.d("DateTimeSettings", "onCancel Dialog");
        reSetAutoTimePref();
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (i == -1)
        {
            Log.d("DateTimeSettings", "Enable GPS time sync");
            if (!android.provider.Settings.Secure.isLocationProviderEnabled(getContentResolver(), "gps"))
                android.provider.Settings.Secure.setLocationProviderEnabled(getContentResolver(), "gps", true);
            android.provider.Settings.Global.putInt(getContentResolver(), "auto_time", 0);
            android.provider.Settings.Global.putInt(getContentResolver(), "auto_time_gps", 1);
        } else
        if (i == -2)
        {
            Log.d("DateTimeSettings", "DialogInterface.BUTTON_NEGATIVE");
            reSetAutoTimePref();
            return;
        }
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        Log.d("DateTimeSettings", "onConfigurationChanged");
        super.onConfigurationChanged(configuration);
        getListView().clearScrapViewsIfNeeded();
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f05000d);
        initUI();
    }

    public Dialog onCreateDialog(int i)
    {
        switch (i)
        {
        case 2: // '\002'
            int j;
            if (android.provider.Settings.Secure.isLocationProviderEnabled(getContentResolver(), "gps"))
                j = 0x7f0b00c8;
            else
                j = 0x7f0b00c9;
            return (new android.app.AlertDialog.Builder(getActivity())).setMessage(getActivity().getResources().getString(j)).setTitle(0x7f0b0308).setIcon(0x1080027).setPositiveButton(0x1040013, this).setNegativeButton(0x1040009, this).create();

        case 1: // '\001'
            Calendar calendar1 = Calendar.getInstance();
            return new TimePickerDialog(getActivity(), this, calendar1.get(11), calendar1.get(12), DateFormat.is24HourFormat(getActivity()));

        case 0: // '\0'
            Calendar calendar = Calendar.getInstance();
            DatePickerDialog datepickerdialog = new DatePickerDialog(getActivity(), this, calendar.get(1), calendar.get(2), calendar.get(5));
            setDateRange((DatePickerDialog)datepickerdialog);
            return datepickerdialog;
        }
        return null;
    }

    public void onDateSet(DatePicker datepicker, int i, int j, int k)
    {
        Activity activity = getActivity();
        if (activity != null)
        {
            setDate(activity, i, j, k);
            updateTimeAndDateDisplay(activity);
            updateDateFormatEntries();
        }
    }

    public void onPause()
    {
        super.onPause();
        getActivity().unregisterReceiver(mIntentReceiver);
        getPreferenceScreen().getSharedPreferences().unregisterOnSharedPreferenceChangeListener(this);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference == mDatePref)
            showDialog(0);
        else
        if (preference == mTimePref)
        {
            removeDialog(1);
            showDialog(1);
        } else
        if (preference == mTime24Pref)
        {
            set24Hour(((CheckBoxPreference)mTime24Pref).isChecked());
            updateTimeAndDateDisplay(getActivity());
            timeUpdated();
        }
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }

    public void onResume()
    {
        super.onResume();
        getPreferenceScreen().getSharedPreferences().registerOnSharedPreferenceChangeListener(this);
        ((CheckBoxPreference)mTime24Pref).setChecked(is24Hour());
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.TIME_TICK");
        intentfilter.addAction("android.intent.action.TIME_SET");
        intentfilter.addAction("android.intent.action.TIMEZONE_CHANGED");
        getActivity().registerReceiver(mIntentReceiver, intentfilter, null, null);
        updateTimeAndDateDisplay(getActivity());
        updateDateFormatEntries();
    }

    public void onSharedPreferenceChanged(SharedPreferences sharedpreferences, String s)
    {
        boolean flag = true;
        if (s.equals("date_format"))
        {
            String s2 = sharedpreferences.getString(s, getResources().getString(0x7f0b02f4));
            android.provider.Settings.System.putString(getContentResolver(), "date_format", s2);
            updateTimeAndDateDisplay(getActivity());
        } else
        {
            if (s.equals("auto_time_list"))
            {
                String s1 = mAutoTimePref.getValue();
                int j = mAutoTimePref.findIndexOfValue(s1);
                mAutoTimePref.setSummary(s1);
                boolean flag2 = true;
                if (j == 0)
                {
                    android.provider.Settings.Global.putInt(getContentResolver(), "auto_time", flag);
                    android.provider.Settings.Global.putInt(getContentResolver(), "auto_time_gps", 0);
                } else
                if (j == flag)
                {
                    showDialog(2);
                    setOnCancelListener(this);
                } else
                {
                    android.provider.Settings.Global.putInt(getContentResolver(), "auto_time", 0);
                    android.provider.Settings.Global.putInt(getContentResolver(), "auto_time_gps", 0);
                    flag2 = false;
                }
                Preference preference1 = mTimePref;
                boolean flag3;
                if (!flag2)
                    flag3 = flag;
                else
                    flag3 = false;
                preference1.setEnabled(flag3);
                Preference preference2 = mDatePref;
                if (flag2)
                    flag = false;
                preference2.setEnabled(flag);
                return;
            }
            if (s.equals("auto_zone"))
            {
                boolean flag1 = sharedpreferences.getBoolean(s, flag);
                android.content.ContentResolver contentresolver = getContentResolver();
                int i;
                if (flag1)
                    i = ((flag) ? 1 : 0);
                else
                    i = 0;
                android.provider.Settings.Global.putInt(contentresolver, "auto_time_zone", i);
                Preference preference = mTimeZone;
                if (flag1)
                    flag = false;
                preference.setEnabled(flag);
                return;
            }
        }
    }

    public void onTimeSet(TimePicker timepicker, int i, int j)
    {
        Activity activity = getActivity();
        if (activity != null)
        {
            setTime(activity, i, j);
            updateTimeAndDateDisplay(activity);
        }
    }

    public void updateTimeAndDateDisplay(Context context)
    {
        java.text.DateFormat dateformat = DateFormat.getDateFormat(context);
        Calendar calendar = Calendar.getInstance();
        mDummyDate.setTimeZone(calendar.getTimeZone());
        mDummyDate.set(calendar.get(1), 11, 31, 13, 0, 0);
        Date date = mDummyDate.getTime();
        mTimePref.setSummary(DateFormat.getTimeFormat(getActivity()).format(calendar.getTime()));
        mTimeZone.setSummary(getTimeZoneText(calendar.getTimeZone()));
        mDatePref.setSummary(dateformat.format(calendar.getTime()));
        mDateFormat.setSummary(dateformat.format(date));
        mTime24Pref.setSummary(DateFormat.getTimeFormat(getActivity()).format(date));
    }

}
