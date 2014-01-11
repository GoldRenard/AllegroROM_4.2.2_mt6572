// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.*;
import android.content.*;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.util.Log;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.*;
import java.util.Calendar;
import java.util.TimeZone;

// Referenced classes of package com.android.settings:
//            DateTimeSettings, ZonePicker

public class DateTimeSettingsSetupWizard extends Activity
    implements android.view.View.OnClickListener, android.widget.AdapterView.OnItemClickListener, android.widget.CompoundButton.OnCheckedChangeListener, android.preference.PreferenceFragment.OnPreferenceStartFragmentCallback
{

    private static final String EXTRA_INITIAL_AUTO_DATETIME_VALUE = "extra_initial_auto_datetime_value";
    private static final String TAG = com/android/settings/DateTimeSettingsSetupWizard.getSimpleName();
    private CompoundButton mAutoDateTimeButton;
    private DatePicker mDatePicker;
    private InputMethodManager mInputMethodManager;
    private BroadcastReceiver mIntentReceiver;
    private TimeZone mSelectedTimeZone;
    private TimePicker mTimePicker;
    private SimpleAdapter mTimeZoneAdapter;
    private Button mTimeZoneButton;
    private ListPopupWindow mTimeZonePopup;
    private boolean mUsingXLargeLayout;

    public DateTimeSettingsSetupWizard()
    {
        mIntentReceiver = new BroadcastReceiver() {

            final DateTimeSettingsSetupWizard this$0;

            public void onReceive(Context context, Intent intent)
            {
                updateTimeAndDateDisplay();
            }

            
            {
                this$0 = DateTimeSettingsSetupWizard.this;
                super();
            }
        }
;
    }

    private boolean isAutoDateTimeEnabled()
    {
        int i;
        try
        {
            i = android.provider.Settings.Global.getInt(getContentResolver(), "auto_time");
        }
        catch (android.provider.Settings.SettingNotFoundException settingnotfoundexception)
        {
            return true;
        }
        return i > 0;
    }

    private void showTimezonePicker(int i)
    {
        View view = findViewById(i);
        if (view == null)
        {
            Log.e(TAG, (new StringBuilder()).append("Unable to find zone picker anchor view ").append(i).toString());
            return;
        } else
        {
            mTimeZonePopup = new ListPopupWindow(this, null);
            mTimeZonePopup.setWidth(view.getWidth());
            mTimeZonePopup.setAnchorView(view);
            mTimeZonePopup.setAdapter(mTimeZoneAdapter);
            mTimeZonePopup.setOnItemClickListener(this);
            mTimeZonePopup.setModal(true);
            mTimeZonePopup.show();
            return;
        }
    }

    private void updateTimeAndDateDisplay()
    {
        if (!mUsingXLargeLayout)
        {
            return;
        } else
        {
            Calendar calendar = Calendar.getInstance();
            mTimeZoneButton.setText(calendar.getTimeZone().getDisplayName());
            mDatePicker.updateDate(calendar.get(1), calendar.get(2), calendar.get(5));
            mTimePicker.setCurrentHour(Integer.valueOf(calendar.get(11)));
            mTimePicker.setCurrentMinute(Integer.valueOf(calendar.get(12)));
            return;
        }
    }

    public void initUiForXl()
    {
        boolean flag = true;
        TimeZone timezone = TimeZone.getDefault();
        mSelectedTimeZone = timezone;
        mTimeZoneButton = (Button)findViewById(0x7f080066);
        mTimeZoneButton.setText(timezone.getDisplayName());
        mTimeZoneButton.setOnClickListener(this);
        Intent intent = getIntent();
        boolean flag1;
        if (intent.hasExtra("extra_initial_auto_datetime_value"))
            flag1 = intent.getBooleanExtra("extra_initial_auto_datetime_value", false);
        else
            flag1 = isAutoDateTimeEnabled();
        mAutoDateTimeButton = (CompoundButton)findViewById(0x7f080068);
        mAutoDateTimeButton.setChecked(flag1);
        mAutoDateTimeButton.setOnCheckedChangeListener(this);
        mTimePicker = (TimePicker)findViewById(0x7f08006d);
        TimePicker timepicker = mTimePicker;
        boolean flag2;
        if (!flag1)
            flag2 = flag;
        else
            flag2 = false;
        timepicker.setEnabled(flag2);
        mDatePicker = (DatePicker)findViewById(0x7f08006a);
        DatePicker datepicker = mDatePicker;
        if (flag1)
            flag = false;
        datepicker.setEnabled(flag);
        mDatePicker.setCalendarViewShown(false);
        mInputMethodManager = (InputMethodManager)getSystemService("input_method");
        ((Button)findViewById(0x7f080029)).setOnClickListener(this);
        Button button = (Button)findViewById(0x7f08017b);
        if (button != null)
            button.setOnClickListener(this);
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        boolean flag1 = true;
        if (compoundbutton == mAutoDateTimeButton)
        {
            android.content.ContentResolver contentresolver = getContentResolver();
            int i;
            if (flag)
                i = ((flag1) ? 1 : 0);
            else
                i = 0;
            android.provider.Settings.Global.putInt(contentresolver, "auto_time", i);
            TimePicker timepicker = mTimePicker;
            boolean flag2;
            if (!flag)
                flag2 = flag1;
            else
                flag2 = false;
            timepicker.setEnabled(flag2);
            DatePicker datepicker = mDatePicker;
            if (flag)
                flag1 = false;
            datepicker.setEnabled(flag1);
        }
        if (flag)
        {
            View view = getCurrentFocus();
            if (view != null)
            {
                mInputMethodManager.hideSoftInputFromWindow(view.getWindowToken(), 0);
                view.clearFocus();
            }
        }
    }

    public void onClick(View view)
    {
        switch (view.getId())
        {
        case 2131230761: 
            if (mSelectedTimeZone != null && !TimeZone.getDefault().equals(mSelectedTimeZone))
            {
                Log.i(TAG, "Another TimeZone is selected by a user. Changing system TimeZone.");
                ((AlarmManager)getSystemService("alarm")).setTimeZone(mSelectedTimeZone.getID());
            }
            if (mAutoDateTimeButton != null)
            {
                android.content.ContentResolver contentresolver = getContentResolver();
                int i;
                if (mAutoDateTimeButton.isChecked())
                    i = 1;
                else
                    i = 0;
                android.provider.Settings.Global.putInt(contentresolver, "auto_time", i);
                if (!mAutoDateTimeButton.isChecked())
                {
                    DateTimeSettings.setDate(this, mDatePicker.getYear(), mDatePicker.getMonth(), mDatePicker.getDayOfMonth());
                    DateTimeSettings.setTime(this, mTimePicker.getCurrentHour().intValue(), mTimePicker.getCurrentMinute().intValue());
                }
            }
            // fall through

        case 2131231099: 
            setResult(-1);
            finish();
            return;

        case 2131230822: 
            showTimezonePicker(0x7f080066);
            return;

        default:
            return;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        boolean flag = true;
        requestWindowFeature(flag);
        super.onCreate(bundle);
        setContentView(0x7f04002f);
        if (findViewById(0x7f080066) == null)
            flag = false;
        mUsingXLargeLayout = flag;
        if (mUsingXLargeLayout)
            initUiForXl();
        else
            findViewById(0x7f080029).setOnClickListener(this);
        mTimeZoneAdapter = ZonePicker.constructTimezoneAdapter(this, false, 0x7f040030);
        if (!mUsingXLargeLayout)
            findViewById(0x7f080062).setSystemUiVisibility(0x400000);
    }

    public void onItemClick(AdapterView adapterview, View view, int i, long l)
    {
        TimeZone timezone = ZonePicker.obtainTimeZoneFromItem(adapterview.getItemAtPosition(i));
        if (mUsingXLargeLayout)
        {
            mSelectedTimeZone = timezone;
            Calendar calendar = Calendar.getInstance(timezone);
            if (mTimeZoneButton != null)
                mTimeZoneButton.setText(timezone.getDisplayName());
            mDatePicker.updateDate(calendar.get(1), calendar.get(2), calendar.get(5));
            mTimePicker.setCurrentHour(Integer.valueOf(calendar.get(11)));
            mTimePicker.setCurrentMinute(Integer.valueOf(calendar.get(12)));
        } else
        {
            ((AlarmManager)getSystemService("alarm")).setTimeZone(timezone.getID());
            DateTimeSettings datetimesettings = (DateTimeSettings)getFragmentManager().findFragmentById(0x7f080064);
            if (datetimesettings != null)
                datetimesettings.updateTimeAndDateDisplay(this);
        }
        mTimeZonePopup.dismiss();
    }

    public void onPause()
    {
        super.onPause();
        unregisterReceiver(mIntentReceiver);
    }

    public boolean onPreferenceStartFragment(PreferenceFragment preferencefragment, Preference preference)
    {
        showTimezonePicker(0x7f080063);
        return true;
    }

    public void onResume()
    {
        super.onResume();
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.TIME_TICK");
        intentfilter.addAction("android.intent.action.TIME_SET");
        intentfilter.addAction("android.intent.action.TIMEZONE_CHANGED");
        registerReceiver(mIntentReceiver, intentfilter, null, null);
    }


}
