// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Dialog;
import android.content.ContentResolver;
import android.content.Context;
import android.database.ContentObserver;
import android.hardware.SensorManager;
import android.os.*;
import android.preference.SeekBarDialogPreference;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.widget.*;

public class BrightnessPreference extends SeekBarDialogPreference
    implements android.widget.SeekBar.OnSeekBarChangeListener, android.widget.CompoundButton.OnCheckedChangeListener, android.view.View.OnClickListener
{
    private static class SavedState extends android.preference.Preference.BaseSavedState
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
        boolean automatic;
        boolean automaticEco;
        int curBrightness;
        boolean oldAutomatic;
        boolean oldAutomaticEco;
        int oldProgress;
        int progress;

        public void writeToParcel(Parcel parcel, int i)
        {
            int j = 1;
            super.writeToParcel(parcel, i);
            int k;
            if (automatic)
                k = j;
            else
                k = 0;
            parcel.writeInt(k);
            parcel.writeInt(progress);
            if (!oldAutomatic)
                j = 0;
            parcel.writeInt(j);
            parcel.writeInt(oldProgress);
            parcel.writeInt(curBrightness);
        }


        public SavedState(Parcel parcel)
        {
            boolean flag = true;
            super(parcel);
            boolean flag1;
            if (parcel.readInt() == flag)
                flag1 = flag;
            else
                flag1 = false;
            automatic = flag1;
            progress = parcel.readInt();
            if (parcel.readInt() != flag)
                flag = false;
            oldAutomatic = flag;
            oldProgress = parcel.readInt();
            curBrightness = parcel.readInt();
        }

        public SavedState(Parcelable parcelable)
        {
            super(parcelable);
        }
    }


    private static final int AUTOMATIC_ECO_MODE = 2;
    private static final int BRIGHTNESS_MODE_MANUAL = 0;
    private static final int SEEK_BAR_RANGE = 10000;
    private static final String TAG = "BrightnessPreference";
    private static final boolean USE_SCREEN_AUTO_BRIGHTNESS_ADJUSTMENT = PowerManager.useScreenAutoBrightnessAdjustmentFeature();
    private CheckBox mAutoBacklightCheckBox;
    private TextView mAutoBacklightTitle;
    private TextView mAutoBackligthSummary;
    private boolean mAutomaticAvailable;
    private boolean mAutomaticEcoMode;
    private boolean mAutomaticMode;
    private ContentObserver mBrightnessEcoModeObserver;
    private ContentObserver mBrightnessModeObserver;
    private ContentObserver mBrightnessObserver;
    private CheckBox mCheckBox;
    private int mCurBrightness;
    private boolean mEcoFirstLaunch;
    private boolean mEcoModeChangeOut;
    private boolean mEcoModeChangeSelf;
    private boolean mFirstLaunch;
    private boolean mModeChangeOut;
    private boolean mModeChangeSelf;
    private int mOldAutomatic;
    private int mOldAutomaticEco;
    private int mOldBrightness;
    private boolean mRestoredOldState;
    private final int mScreenBrightnessMaximum;
    private final int mScreenBrightnessMinimum;
    private SeekBar mSeekBar;

    public BrightnessPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mEcoModeChangeOut = false;
        mEcoModeChangeSelf = false;
        mEcoFirstLaunch = false;
        mCurBrightness = -1;
        mModeChangeOut = false;
        mModeChangeSelf = false;
        mFirstLaunch = false;
        mBrightnessObserver = new ContentObserver(new Handler()) {

            final BrightnessPreference this$0;

            public void onChange(boolean flag1)
            {
                onBrightnessChanged();
            }

            
            {
                this$0 = BrightnessPreference.this;
                super(handler);
            }
        }
;
        mBrightnessModeObserver = new ContentObserver(new Handler()) {

            final BrightnessPreference this$0;

            public void onChange(boolean flag1)
            {
                onBrightnessModeChanged();
            }

            
            {
                this$0 = BrightnessPreference.this;
                super(handler);
            }
        }
;
        mBrightnessEcoModeObserver = new ContentObserver(new Handler()) {

            final BrightnessPreference this$0;

            public void onChange(boolean flag1)
            {
                onBrightnessEcoModeChanged();
            }

            
            {
                this$0 = BrightnessPreference.this;
                super(handler);
            }
        }
;
        PowerManager powermanager = (PowerManager)context.getSystemService("power");
        mScreenBrightnessMinimum = powermanager.getMinimumScreenBrightnessSetting();
        mScreenBrightnessMaximum = powermanager.getMaximumScreenBrightnessSetting();
        android.hardware.Sensor sensor = ((SensorManager)context.getSystemService("sensor")).getDefaultSensor(5);
        boolean flag = false;
        if (sensor != null)
            flag = true;
        mAutomaticAvailable = flag;
        Log.d("BrightnessPreference", (new StringBuilder()).append("mAutomaticAvailable=").append(mAutomaticAvailable).toString());
        setDialogLayoutResource(0x7f040061);
        setDialogIcon(0x7f020083);
    }

    private int getBrightness(int i)
    {
        int j;
        try
        {
            j = android.provider.Settings.System.getInt(getContext().getContentResolver(), "screen_brightness");
        }
        catch (android.provider.Settings.SettingNotFoundException settingnotfoundexception)
        {
            Log.d("BrightnessPreference", "SettingNotFoundException");
            return i;
        }
        return j;
    }

    private int getBrightnessEcoMode(int i)
    {
        int j = i;
        int k = android.provider.Settings.System.getInt(getContext().getContentResolver(), "screen_brightness_eco_mode");
        j = k;
_L2:
        Log.d("BrightnessPreference", (new StringBuilder()).append("brightnessEcoMode = ").append(j).toString());
        return j;
        android.provider.Settings.SettingNotFoundException settingnotfoundexception;
        settingnotfoundexception;
        Log.d("BrightnessPreference", "SettingNotFoundException");
        if (true) goto _L2; else goto _L1
_L1:
    }

    private int getBrightnessMode(int i)
    {
        int j = i;
        int k = android.provider.Settings.System.getInt(getContext().getContentResolver(), "screen_brightness_mode");
        j = k;
_L2:
        Log.d("BrightnessPreference", (new StringBuilder()).append("brightnessMode=").append(j).toString());
        return j;
        android.provider.Settings.SettingNotFoundException settingnotfoundexception;
        settingnotfoundexception;
        Log.d("BrightnessPreference", "SettingNotFoundException");
        if (true) goto _L2; else goto _L1
_L1:
    }

    private void onBrightnessChanged()
    {
        Log.i("BrightnessPreference", "onBrightnessChanged");
        int i = getBrightness(mScreenBrightnessMaximum);
        mSeekBar.setProgress(i - mScreenBrightnessMinimum);
        mOldBrightness = i;
    }

    private void onBrightnessEcoModeChanged()
    {
        Log.i("BrightnessPreference", "onBrightnessEcoModeChanged");
        boolean flag;
        if (getBrightnessEcoMode(2) != 0)
            flag = true;
        else
            flag = false;
        updateOldAutomaticEcoMode();
        mAutoBacklightCheckBox.setChecked(flag);
    }

    private void onBrightnessModeChanged()
    {
        SeekBar seekbar;
        boolean flag1;
label0:
        {
            Log.i("BrightnessPreference", "onBrightnessModeChanged");
            boolean flag;
            if (getBrightnessMode(0) != 0)
                flag = true;
            else
                flag = false;
            updateOldAutomaticMode();
            mCheckBox.setChecked(flag);
            seekbar = mSeekBar;
            if (flag)
            {
                boolean flag2 = USE_SCREEN_AUTO_BRIGHTNESS_ADJUSTMENT;
                flag1 = false;
                if (!flag2)
                    break label0;
            }
            flag1 = true;
        }
        seekbar.setEnabled(flag1);
    }

    private void restoreOldState()
    {
        if (mAutomaticAvailable)
            setMode(mOldAutomatic);
        if (!mAutomaticAvailable || mOldAutomatic == 0)
        {
            setBrightness(mOldBrightness);
            updateSeekBarPos(mOldBrightness);
            android.provider.Settings.System.putInt(getContext().getContentResolver(), "screen_brightness", mOldBrightness);
        }
    }

    private void setBrightness(int i)
    {
        IPowerManager ipowermanager = android.os.IPowerManager.Stub.asInterface(ServiceManager.getService("power"));
        if (ipowermanager == null)
            break MISSING_BLOCK_LABEL_39;
        if (ipowermanager.isScreenOn())
        {
            ipowermanager.setTemporaryScreenBrightnessSettingOverride(i);
            return;
        }
        try
        {
            ipowermanager.setTemporaryScreenBrightnessSettingOverride(-1);
            return;
        }
        catch (RemoteException remoteexception) { }
    }

    private void setEcoMode(int i)
    {
        Log.d("BrightnessPreference", (new StringBuilder()).append("setEcoMode, the mode = ").append(i).toString());
        boolean flag;
        if (i == 2)
            flag = true;
        else
            flag = false;
        mAutomaticEcoMode = flag;
        android.provider.Settings.System.putInt(getContext().getContentResolver(), "screen_brightness_eco_mode", i);
    }

    private void setEcoModeChangeState()
    {
        if (mEcoFirstLaunch)
            mEcoFirstLaunch = false;
        else
        if (!mEcoModeChangeOut)
            mEcoModeChangeSelf = true;
        if (mEcoModeChangeOut && !mEcoModeChangeSelf)
            mEcoModeChangeOut = false;
    }

    private void setMode(int i)
    {
        boolean flag = true;
        Log.d("BrightnessPreference", (new StringBuilder()).append("setMode, the mode = ").append(i).toString());
        if (i != flag)
            flag = false;
        mAutomaticMode = flag;
        android.provider.Settings.System.putInt(getContext().getContentResolver(), "screen_brightness_mode", i);
    }

    private void setModeChangeState()
    {
        if (mFirstLaunch)
            mFirstLaunch = false;
        else
        if (!mModeChangeOut)
            mModeChangeSelf = true;
        if (mModeChangeOut && !mModeChangeSelf)
            mModeChangeOut = false;
    }

    private void updateOldAutomaticEcoMode()
    {
        Log.d("BrightnessPreference", "updateOldAutomaticEcoMode");
        if (!mEcoModeChangeSelf)
            mEcoModeChangeOut = true;
        if (mEcoModeChangeOut && !mEcoModeChangeSelf)
        {
            mOldAutomaticEco = getBrightnessEcoMode(2);
            Log.d("BrightnessPreference", (new StringBuilder()).append("updateOldAutomaticEcoMode + mOldAutomaticEco = ").append(mOldAutomaticEco).toString());
        }
        if (mEcoModeChangeSelf && !mEcoModeChangeOut)
            mEcoModeChangeSelf = false;
    }

    private void updateOldAutomaticMode()
    {
        Log.i("BrightnessPreference", "updateOldAutomaticMode");
        if (!mModeChangeSelf)
            mModeChangeOut = true;
        if (mModeChangeOut && !mModeChangeSelf)
        {
            mOldAutomatic = getBrightnessMode(0);
            Log.i("BrightnessPreference", (new StringBuilder()).append("updateOldAutomaticMode+mOldAutomatic=").append(mOldAutomatic).toString());
        }
        if (mModeChangeSelf && !mModeChangeOut)
            mModeChangeSelf = false;
    }

    private void updateSeekBarPos(int i)
    {
        if (mSeekBar != null)
        {
            Log.i("BrightnessPreference", "updateSeekBar position");
            mSeekBar.setProgress(i - mScreenBrightnessMinimum);
        }
    }

    protected void onBindDialogView(View view)
    {
label0:
        {
label1:
            {
                SeekBar seekbar;
                boolean flag1;
label2:
                {
                    super.onBindDialogView(view);
                    mSeekBar = getSeekBar(view);
                    mSeekBar.setMax(mScreenBrightnessMaximum - mScreenBrightnessMinimum);
                    mOldBrightness = getBrightness(0);
                    mSeekBar.setProgress(mOldBrightness - mScreenBrightnessMinimum);
                    mCheckBox = (CheckBox)view.findViewById(0x7f0800f1);
                    mAutoBacklightCheckBox = (CheckBox)view.findViewById(0x7f0800f2);
                    mAutoBacklightTitle = (TextView)view.findViewById(0x7f0800f3);
                    mAutoBackligthSummary = (TextView)view.findViewById(0x7f0800f4);
                    mAutoBacklightCheckBox.setVisibility(8);
                    mAutoBacklightTitle.setVisibility(8);
                    mAutoBackligthSummary.setVisibility(8);
                    if (!mAutomaticAvailable)
                        break label1;
                    mCheckBox.setOnCheckedChangeListener(this);
                    mOldAutomatic = getBrightnessMode(0);
                    boolean flag;
                    if (mOldAutomatic == 1)
                        flag = true;
                    else
                        flag = false;
                    mAutomaticMode = flag;
                    mCheckBox.setChecked(mAutomaticMode);
                    seekbar = mSeekBar;
                    if (mAutomaticMode)
                    {
                        boolean flag2 = USE_SCREEN_AUTO_BRIGHTNESS_ADJUSTMENT;
                        flag1 = false;
                        if (!flag2)
                            break label2;
                    }
                    flag1 = true;
                }
                seekbar.setEnabled(flag1);
                break label0;
            }
            mSeekBar.setEnabled(true);
            mCheckBox.setVisibility(8);
        }
        mSeekBar.setOnSeekBarChangeListener(this);
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
label0:
        {
label1:
            {
                SeekBar seekbar;
                boolean flag1;
label2:
                {
                    if (compoundbutton.getId() != 0x7f0800f1)
                        break label1;
                    Log.d("BrightnessPreference", (new StringBuilder()).append("onCheckedChanged, automatic isChecked =  ").append(flag).toString());
                    setModeChangeState();
                    int i;
                    if (flag)
                        i = 1;
                    else
                        i = 0;
                    setMode(i);
                    seekbar = mSeekBar;
                    if (mAutomaticMode)
                    {
                        boolean flag2 = USE_SCREEN_AUTO_BRIGHTNESS_ADJUSTMENT;
                        flag1 = false;
                        if (!flag2)
                            break label2;
                    }
                    flag1 = true;
                }
                seekbar.setEnabled(flag1);
                if (!flag)
                    setBrightness(mSeekBar.getProgress() + mScreenBrightnessMinimum);
                break label0;
            }
            if (compoundbutton.getId() == 0x7f0800f2)
            {
                Log.d("BrightnessPreference", (new StringBuilder()).append("onCheckedChanged, backlight isChecked =  ").append(flag).toString());
                setEcoModeChangeState();
                byte byte0 = 0;
                if (flag)
                    byte0 = 2;
                setEcoMode(byte0);
                return;
            }
        }
    }

    public void onClick(View view)
    {
        if (view == mAutoBacklightTitle || view == mAutoBackligthSummary)
        {
            CheckBox checkbox = mAutoBacklightCheckBox;
            boolean flag;
            if (!mAutoBacklightCheckBox.isChecked())
                flag = true;
            else
                flag = false;
            checkbox.setChecked(flag);
        }
    }

    protected void onDialogClosed(boolean flag)
    {
        Log.d("BrightnessPreference", "onDialogClosed");
        super.onDialogClosed(flag);
        ContentResolver contentresolver = getContext().getContentResolver();
        if (flag)
            android.provider.Settings.System.putInt(contentresolver, "screen_brightness", mSeekBar.getProgress() + mScreenBrightnessMinimum);
        else
            restoreOldState();
        contentresolver.unregisterContentObserver(mBrightnessObserver);
        contentresolver.unregisterContentObserver(mBrightnessModeObserver);
    }

    public void onProgressChanged(SeekBar seekbar, int i, boolean flag)
    {
        setBrightness(i + mScreenBrightnessMinimum);
    }

    protected void onRestoreInstanceState(Parcelable parcelable)
    {
        int i = 1;
        if (parcelable != null && parcelable.getClass().equals(com/android/settings/BrightnessPreference$SavedState))
        {
            SavedState savedstate = (SavedState)parcelable;
            super.onRestoreInstanceState(savedstate.getSuperState());
            mOldBrightness = savedstate.oldProgress;
            int j;
            if (savedstate.oldAutomatic)
                j = i;
            else
                j = 0;
            mOldAutomatic = j;
            if (!savedstate.automatic)
                i = 0;
            setMode(i);
            mCurBrightness = savedstate.curBrightness;
            setBrightness(savedstate.progress + mScreenBrightnessMinimum);
            return;
        } else
        {
            super.onRestoreInstanceState(parcelable);
            return;
        }
    }

    protected Parcelable onSaveInstanceState()
    {
        boolean flag = true;
        Parcelable parcelable = super.onSaveInstanceState();
        if (getDialog() != null && getDialog().isShowing())
        {
            SavedState savedstate = new SavedState(parcelable);
            savedstate.automatic = mCheckBox.isChecked();
            savedstate.progress = mSeekBar.getProgress();
            if (mOldAutomatic != flag)
                flag = false;
            savedstate.oldAutomatic = flag;
            savedstate.oldProgress = mOldBrightness;
            savedstate.curBrightness = mCurBrightness;
            restoreOldState();
            return savedstate;
        } else
        {
            return parcelable;
        }
    }

    public void onStartTrackingTouch(SeekBar seekbar)
    {
    }

    public void onStopTrackingTouch(SeekBar seekbar)
    {
    }

    protected void showDialog(Bundle bundle)
    {
        if (mAutomaticAvailable && getBrightnessMode(0) != 0)
        {
            mFirstLaunch = true;
            Log.i("BrightnessPreference", (new StringBuilder()).append("onBindDialogView---mFirstLaunch=").append(mFirstLaunch).toString());
        }
        super.showDialog(bundle);
        getContext().getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("screen_brightness"), true, mBrightnessObserver);
        getContext().getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("screen_brightness_mode"), true, mBrightnessModeObserver);
    }




}
