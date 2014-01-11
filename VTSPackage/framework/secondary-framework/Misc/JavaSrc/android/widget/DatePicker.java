// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import android.text.format.DateUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.inputmethod.InputMethodManager;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

// Referenced classes of package android.widget:
//            FrameLayout, LinearLayout, CalendarView, NumberPicker, 
//            EditText, TextView

public class DatePicker extends FrameLayout
{
    public static interface OnDateChangedListener
    {

        public abstract void onDateChanged(DatePicker datepicker, int i, int j, int k);
    }

    private static class SavedState extends android.view.View.BaseSavedState
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public SavedState createFromParcel(Parcel parcel)
            {
                return new SavedState(parcel);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public SavedState[] newArray(int i)
            {
                return new SavedState[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        }
;
        private final int mDay;
        private final int mMonth;
        private final int mYear;

        public void writeToParcel(Parcel parcel, int i)
        {
            super.writeToParcel(parcel, i);
            parcel.writeInt(mYear);
            parcel.writeInt(mMonth);
            parcel.writeInt(mDay);
        }





        private SavedState(Parcel parcel)
        {
            super(parcel);
            mYear = parcel.readInt();
            mMonth = parcel.readInt();
            mDay = parcel.readInt();
        }


        private SavedState(Parcelable parcelable, int i, int j, int k)
        {
            super(parcelable);
            mYear = i;
            mMonth = j;
            mDay = k;
        }

    }


    private static final String DATE_FORMAT = "MM/dd/yyyy";
    private static final boolean DEFAULT_CALENDAR_VIEW_SHOWN = true;
    private static final boolean DEFAULT_ENABLED_STATE = true;
    private static final int DEFAULT_END_YEAR = 2100;
    private static final boolean DEFAULT_SPINNERS_SHOWN = true;
    private static final int DEFAULT_START_YEAR = 1900;
    private static final String LOG_TAG = android/widget/DatePicker.getSimpleName();
    private final CalendarView mCalendarView;
    private Calendar mCurrentDate;
    private Locale mCurrentLocale;
    private final DateFormat mDateFormat;
    private final NumberPicker mDaySpinner;
    private final EditText mDaySpinnerInput;
    private boolean mIsEnabled;
    private Calendar mMaxDate;
    private Calendar mMinDate;
    private final NumberPicker mMonthSpinner;
    private final EditText mMonthSpinnerInput;
    private int mNumberOfMonths;
    private OnDateChangedListener mOnDateChangedListener;
    private String mShortMonths[];
    private final LinearLayout mSpinners;
    private Calendar mTempDate;
    private final NumberPicker mYearSpinner;
    private final EditText mYearSpinnerInput;

    public DatePicker(Context context)
    {
        this(context, null);
    }

    public DatePicker(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0x101035c);
    }

    public DatePicker(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mDateFormat = new SimpleDateFormat("MM/dd/yyyy");
        mIsEnabled = true;
        setCurrentLocale(Locale.getDefault());
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.DatePicker, i, 0);
        boolean flag = typedarray.getBoolean(4, true);
        boolean flag1 = typedarray.getBoolean(5, true);
        int j = typedarray.getInt(0, 1900);
        int k = typedarray.getInt(1, 2100);
        String s = typedarray.getString(2);
        String s1 = typedarray.getString(3);
        int l = typedarray.getResourceId(6, 0x1090037);
        typedarray.recycle();
        ((LayoutInflater)context.getSystemService("layout_inflater")).inflate(l, this, true);
        NumberPicker.OnValueChangeListener onvaluechangelistener = new NumberPicker.OnValueChangeListener() {

            final DatePicker this$0;

            public void onValueChange(NumberPicker numberpicker, int i1, int j1)
            {
label0:
                {
                    updateInputState();
                    mTempDate.setTimeInMillis(mCurrentDate.getTimeInMillis());
                    if (numberpicker == mDaySpinner)
                    {
                        int k1 = mTempDate.getActualMaximum(5);
                        if (i1 == k1 && j1 == 1)
                            mTempDate.add(5, 1);
                        else
                        if (i1 == 1 && j1 == k1)
                            mTempDate.add(5, -1);
                        else
                            mTempDate.add(5, j1 - i1);
                    } else
                    if (numberpicker == mMonthSpinner)
                    {
                        if (i1 == 11 && j1 == 0)
                            mTempDate.add(2, 1);
                        else
                        if (i1 == 0 && j1 == 11)
                            mTempDate.add(2, -1);
                        else
                            mTempDate.add(2, j1 - i1);
                    } else
                    {
                        if (numberpicker != mYearSpinner)
                            break label0;
                        mTempDate.set(1, j1);
                    }
                    setDate(mTempDate.get(1), mTempDate.get(2), mTempDate.get(5));
                    updateSpinners();
                    updateCalendarView();
                    notifyDateChanged();
                    return;
                }
                throw new IllegalArgumentException();
            }

            
            {
                this$0 = DatePicker.this;
                super();
            }
        }
;
        mSpinners = (LinearLayout)findViewById(0x102027c);
        mCalendarView = (CalendarView)findViewById(0x1020280);
        mCalendarView.setOnDateChangeListener(new CalendarView.OnDateChangeListener() {

            final DatePicker this$0;

            public void onSelectedDayChange(CalendarView calendarview, int i1, int j1, int k1)
            {
                setDate(i1, j1, k1);
                updateSpinners();
                notifyDateChanged();
            }

            
            {
                this$0 = DatePicker.this;
                super();
            }
        }
);
        mDaySpinner = (NumberPicker)findViewById(0x102027e);
        mDaySpinner.setFormatter(NumberPicker.getTwoDigitFormatter());
        mDaySpinner.setOnLongPressUpdateInterval(100L);
        mDaySpinner.setOnValueChangedListener(onvaluechangelistener);
        mDaySpinnerInput = (EditText)mDaySpinner.findViewById(0x1020341);
        mMonthSpinner = (NumberPicker)findViewById(0x102027d);
        mMonthSpinner.setMinValue(0);
        mMonthSpinner.setMaxValue(-1 + mNumberOfMonths);
        mMonthSpinner.setDisplayedValues(mShortMonths);
        mMonthSpinner.setOnLongPressUpdateInterval(200L);
        mMonthSpinner.setOnValueChangedListener(onvaluechangelistener);
        mMonthSpinnerInput = (EditText)mMonthSpinner.findViewById(0x1020341);
        mYearSpinner = (NumberPicker)findViewById(0x102027f);
        mYearSpinner.setOnLongPressUpdateInterval(100L);
        mYearSpinner.setOnValueChangedListener(onvaluechangelistener);
        mYearSpinnerInput = (EditText)mYearSpinner.findViewById(0x1020341);
        if (!flag && !flag1)
        {
            setSpinnersShown(true);
        } else
        {
            setSpinnersShown(flag);
            setCalendarViewShown(flag1);
        }
        mTempDate.clear();
        if (!TextUtils.isEmpty(s))
        {
            if (!parseDate(s, mTempDate))
                mTempDate.set(j, 0, 1);
        } else
        {
            mTempDate.set(j, 0, 1);
        }
        setMinDate(mTempDate.getTimeInMillis());
        mTempDate.clear();
        if (!TextUtils.isEmpty(s1))
        {
            if (!parseDate(s1, mTempDate))
                mTempDate.set(k, 11, 31);
        } else
        {
            mTempDate.set(k, 11, 31);
        }
        setMaxDate(mTempDate.getTimeInMillis());
        mCurrentDate.setTimeInMillis(System.currentTimeMillis());
        init(mCurrentDate.get(1), mCurrentDate.get(2), mCurrentDate.get(5), null);
        reorderSpinners();
        setContentDescriptions();
        if (getImportantForAccessibility() == 0)
            setImportantForAccessibility(1);
    }

    private Calendar getCalendarForLocale(Calendar calendar, Locale locale)
    {
        if (calendar == null)
        {
            return Calendar.getInstance(locale);
        } else
        {
            long l = calendar.getTimeInMillis();
            Calendar calendar1 = Calendar.getInstance(locale);
            calendar1.setTimeInMillis(l);
            return calendar1;
        }
    }

    private boolean isNewDate(int i, int j, int k)
    {
        return mCurrentDate.get(1) != i || mCurrentDate.get(2) != k || mCurrentDate.get(5) != j;
    }

    private void notifyDateChanged()
    {
        sendAccessibilityEvent(4);
        if (mOnDateChangedListener != null)
            mOnDateChangedListener.onDateChanged(this, getYear(), getMonth(), getDayOfMonth());
    }

    private boolean parseDate(String s, Calendar calendar)
    {
        try
        {
            calendar.setTime(mDateFormat.parse(s));
        }
        catch (ParseException parseexception)
        {
            Log.w(LOG_TAG, (new StringBuilder()).append("Date: ").append(s).append(" not in format: ").append("MM/dd/yyyy").toString());
            return false;
        }
        return true;
    }

    private void reorderSpinners()
    {
label0:
        {
            mSpinners.removeAllViews();
            char ac[] = android.text.format.DateFormat.getDateFormatOrder(getContext());
            int i = ac.length;
            int j = 0;
label1:
            do
            {
                if (j >= i)
                    break label0;
                switch (ac[j])
                {
                default:
                    break label1;

                case 121: // 'y'
                    mSpinners.addView(mYearSpinner);
                    setImeOptions(mYearSpinner, i, j);
                    break;

                case 77: // 'M'
                    mSpinners.addView(mMonthSpinner);
                    setImeOptions(mMonthSpinner, i, j);
                    break;

                case 100: // 'd'
                    mSpinners.addView(mDaySpinner);
                    setImeOptions(mDaySpinner, i, j);
                    break;
                }
                j++;
            } while (true);
            throw new IllegalArgumentException();
        }
    }

    private void setContentDescriptions()
    {
        trySetContentDescription(mDaySpinner, 0x1020340, 0x10404c7);
        trySetContentDescription(mDaySpinner, 0x1020342, 0x10404c8);
        trySetContentDescription(mMonthSpinner, 0x1020340, 0x10404c5);
        trySetContentDescription(mMonthSpinner, 0x1020342, 0x10404c6);
        trySetContentDescription(mYearSpinner, 0x1020340, 0x10404c9);
        trySetContentDescription(mYearSpinner, 0x1020342, 0x10404ca);
    }

    private void setCurrentLocale(Locale locale)
    {
        if (!locale.equals(mCurrentLocale))
        {
            mCurrentLocale = locale;
            mTempDate = getCalendarForLocale(mTempDate, locale);
            mMinDate = getCalendarForLocale(mMinDate, locale);
            mMaxDate = getCalendarForLocale(mMaxDate, locale);
            mCurrentDate = getCalendarForLocale(mCurrentDate, locale);
            mNumberOfMonths = 1 + mTempDate.getActualMaximum(2);
            mShortMonths = new String[mNumberOfMonths];
            for (int i = 0; i < mNumberOfMonths; i++)
                mShortMonths[i] = DateUtils.getMonthString(i + 0, 20);

        }
    }

    private void setDate(int i, int j, int k)
    {
        mCurrentDate.set(i, j, k);
        if (mCurrentDate.before(mMinDate))
            mCurrentDate.setTimeInMillis(mMinDate.getTimeInMillis());
        else
        if (mCurrentDate.after(mMaxDate))
        {
            mCurrentDate.setTimeInMillis(mMaxDate.getTimeInMillis());
            return;
        }
    }

    private void setImeOptions(NumberPicker numberpicker, int i, int j)
    {
        byte byte0;
        if (j < i - 1)
            byte0 = 5;
        else
            byte0 = 6;
        ((TextView)numberpicker.findViewById(0x1020341)).setImeOptions(byte0);
    }

    private void trySetContentDescription(View view, int i, int j)
    {
        View view1 = view.findViewById(i);
        if (view1 != null)
            view1.setContentDescription(super.mContext.getString(j));
    }

    private void updateCalendarView()
    {
        mCalendarView.setDate(mCurrentDate.getTimeInMillis(), false, false);
    }

    private void updateInputState()
    {
        InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
        if (inputmethodmanager != null)
            if (inputmethodmanager.isActive(mYearSpinnerInput))
            {
                mYearSpinnerInput.clearFocus();
                inputmethodmanager.hideSoftInputFromWindow(getWindowToken(), 0);
            } else
            {
                if (inputmethodmanager.isActive(mMonthSpinnerInput))
                {
                    mMonthSpinnerInput.clearFocus();
                    inputmethodmanager.hideSoftInputFromWindow(getWindowToken(), 0);
                    return;
                }
                if (inputmethodmanager.isActive(mDaySpinnerInput))
                {
                    mDaySpinnerInput.clearFocus();
                    inputmethodmanager.hideSoftInputFromWindow(getWindowToken(), 0);
                    return;
                }
            }
    }

    private void updateSpinners()
    {
        if (mCurrentDate.equals(mMinDate))
        {
            mDaySpinner.setMinValue(mCurrentDate.get(5));
            mDaySpinner.setMaxValue(mCurrentDate.getActualMaximum(5));
            mDaySpinner.setWrapSelectorWheel(false);
            mMonthSpinner.setDisplayedValues(null);
            mMonthSpinner.setMinValue(mCurrentDate.get(2));
            mMonthSpinner.setMaxValue(mCurrentDate.getActualMaximum(2));
            mMonthSpinner.setWrapSelectorWheel(false);
        } else
        if (mCurrentDate.equals(mMaxDate))
        {
            mDaySpinner.setMinValue(mCurrentDate.getActualMinimum(5));
            mDaySpinner.setMaxValue(mCurrentDate.get(5));
            mDaySpinner.setWrapSelectorWheel(false);
            mMonthSpinner.setDisplayedValues(null);
            mMonthSpinner.setMinValue(mCurrentDate.getActualMinimum(2));
            mMonthSpinner.setMaxValue(mCurrentDate.get(2));
            mMonthSpinner.setWrapSelectorWheel(false);
        } else
        {
            mDaySpinner.setMinValue(1);
            mDaySpinner.setMaxValue(mCurrentDate.getActualMaximum(5));
            mDaySpinner.setWrapSelectorWheel(true);
            mMonthSpinner.setDisplayedValues(null);
            mMonthSpinner.setMinValue(0);
            mMonthSpinner.setMaxValue(11);
            mMonthSpinner.setWrapSelectorWheel(true);
        }
        String as[] = (String[])Arrays.copyOfRange(mShortMonths, mMonthSpinner.getMinValue(), 1 + mMonthSpinner.getMaxValue());
        mMonthSpinner.setDisplayedValues(as);
        mYearSpinner.setMinValue(mMinDate.get(1));
        mYearSpinner.setMaxValue(mMaxDate.get(1));
        mYearSpinner.setWrapSelectorWheel(false);
        mYearSpinner.setValue(mCurrentDate.get(1));
        mMonthSpinner.setValue(mCurrentDate.get(2));
        mDaySpinner.setValue(mCurrentDate.get(5));
    }

    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        onPopulateAccessibilityEvent(accessibilityevent);
        return true;
    }

    protected void dispatchRestoreInstanceState(SparseArray sparsearray)
    {
        dispatchThawSelfOnly(sparsearray);
    }

    public CalendarView getCalendarView()
    {
        return mCalendarView;
    }

    public boolean getCalendarViewShown()
    {
        return mCalendarView.isShown();
    }

    public int getDayOfMonth()
    {
        return mCurrentDate.get(5);
    }

    public long getMaxDate()
    {
        return mCalendarView.getMaxDate();
    }

    public long getMinDate()
    {
        return mCalendarView.getMinDate();
    }

    public int getMonth()
    {
        return mCurrentDate.get(2);
    }

    public boolean getSpinnersShown()
    {
        return mSpinners.isShown();
    }

    public int getYear()
    {
        return mCurrentDate.get(1);
    }

    public void init(int i, int j, int k, OnDateChangedListener ondatechangedlistener)
    {
        setDate(i, j, k);
        updateSpinners();
        updateCalendarView();
        mOnDateChangedListener = ondatechangedlistener;
    }

    public boolean isEnabled()
    {
        return mIsEnabled;
    }

    protected void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        setCurrentLocale(configuration.locale);
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/DatePicker.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/DatePicker.getName());
    }

    public void onPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onPopulateAccessibilityEvent(accessibilityevent);
        String s = DateUtils.formatDateTime(super.mContext, mCurrentDate.getTimeInMillis(), 20);
        accessibilityevent.getText().add(s);
    }

    protected void onRestoreInstanceState(Parcelable parcelable)
    {
        SavedState savedstate = (SavedState)parcelable;
        super.onRestoreInstanceState(savedstate.getSuperState());
        setDate(savedstate.mYear, savedstate.mMonth, savedstate.mDay);
        updateSpinners();
        updateCalendarView();
    }

    protected Parcelable onSaveInstanceState()
    {
        return new SavedState(super.onSaveInstanceState(), getYear(), getMonth(), getDayOfMonth());
    }

    public void setCalendarViewShown(boolean flag)
    {
        CalendarView calendarview = mCalendarView;
        byte byte0;
        if (flag)
            byte0 = 0;
        else
            byte0 = 8;
        calendarview.setVisibility(byte0);
    }

    public void setEnabled(boolean flag)
    {
        if (mIsEnabled == flag)
        {
            return;
        } else
        {
            super.setEnabled(flag);
            mDaySpinner.setEnabled(flag);
            mMonthSpinner.setEnabled(flag);
            mYearSpinner.setEnabled(flag);
            mCalendarView.setEnabled(flag);
            mIsEnabled = flag;
            return;
        }
    }

    public void setMaxDate(long l)
    {
        mTempDate.setTimeInMillis(l);
        if (mTempDate.get(1) == mMaxDate.get(1) && mTempDate.get(6) != mMaxDate.get(6))
            return;
        mMaxDate.setTimeInMillis(l);
        mCalendarView.setMaxDate(l);
        if (mCurrentDate.after(mMaxDate))
        {
            mCurrentDate.setTimeInMillis(mMaxDate.getTimeInMillis());
            updateCalendarView();
        }
        updateSpinners();
    }

    public void setMinDate(long l)
    {
        mTempDate.setTimeInMillis(l);
        if (mTempDate.get(1) == mMinDate.get(1) && mTempDate.get(6) != mMinDate.get(6))
            return;
        mMinDate.setTimeInMillis(l);
        mCalendarView.setMinDate(l);
        if (mCurrentDate.before(mMinDate))
        {
            mCurrentDate.setTimeInMillis(mMinDate.getTimeInMillis());
            updateCalendarView();
        }
        updateSpinners();
    }

    public void setSpinnersShown(boolean flag)
    {
        LinearLayout linearlayout = mSpinners;
        byte byte0;
        if (flag)
            byte0 = 0;
        else
            byte0 = 8;
        linearlayout.setVisibility(byte0);
    }

    public void updateDate(int i, int j, int k)
    {
        if (!isNewDate(i, j, k))
        {
            return;
        } else
        {
            setDate(i, j, k);
            updateSpinners();
            updateCalendarView();
            notifyDateChanged();
            return;
        }
    }











}
