// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Dialog;
import android.content.ContentResolver;
import android.content.Context;
import android.database.ContentObserver;
import android.hardware.input.InputManager;
import android.os.*;
import android.preference.SeekBarDialogPreference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.SeekBar;

public class PointerSpeedPreference extends SeekBarDialogPreference
    implements android.widget.SeekBar.OnSeekBarChangeListener
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
        int oldSpeed;
        int progress;

        public void writeToParcel(Parcel parcel, int i)
        {
            super.writeToParcel(parcel, i);
            parcel.writeInt(progress);
            parcel.writeInt(oldSpeed);
        }


        public SavedState(Parcel parcel)
        {
            super(parcel);
            progress = parcel.readInt();
            oldSpeed = parcel.readInt();
        }

        public SavedState(Parcelable parcelable)
        {
            super(parcelable);
        }
    }


    private final InputManager mIm = (InputManager)getContext().getSystemService("input");
    private int mOldSpeed;
    private boolean mRestoredOldState;
    private SeekBar mSeekBar;
    private ContentObserver mSpeedObserver;
    private boolean mTouchInProgress;

    public PointerSpeedPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mSpeedObserver = new ContentObserver(new Handler()) {

            final PointerSpeedPreference this$0;

            public void onChange(boolean flag)
            {
                onSpeedChanged();
            }

            
            {
                this$0 = PointerSpeedPreference.this;
                super(handler);
            }
        }
;
    }

    private void onSpeedChanged()
    {
        int i = mIm.getPointerSpeed(getContext());
        mSeekBar.setProgress(i + 7);
    }

    private void restoreOldState()
    {
        if (mRestoredOldState)
        {
            return;
        } else
        {
            mIm.tryPointerSpeed(mOldSpeed);
            mRestoredOldState = true;
            return;
        }
    }

    protected void onBindDialogView(View view)
    {
        super.onBindDialogView(view);
        mSeekBar = getSeekBar(view);
        mSeekBar.setMax(14);
        mOldSpeed = mIm.getPointerSpeed(getContext());
        mSeekBar.setProgress(7 + mOldSpeed);
        mSeekBar.setOnSeekBarChangeListener(this);
    }

    protected void onDialogClosed(boolean flag)
    {
        super.onDialogClosed(flag);
        ContentResolver contentresolver = getContext().getContentResolver();
        if (flag)
            mIm.setPointerSpeed(getContext(), -7 + mSeekBar.getProgress());
        else
            restoreOldState();
        contentresolver.unregisterContentObserver(mSpeedObserver);
    }

    public void onProgressChanged(SeekBar seekbar, int i, boolean flag)
    {
        if (!mTouchInProgress)
            mIm.tryPointerSpeed(i - 7);
    }

    protected void onRestoreInstanceState(Parcelable parcelable)
    {
        if (parcelable != null && parcelable.getClass().equals(com/android/settings/PointerSpeedPreference$SavedState))
        {
            SavedState savedstate = (SavedState)parcelable;
            super.onRestoreInstanceState(savedstate.getSuperState());
            mOldSpeed = savedstate.oldSpeed;
            mSeekBar.setProgress(savedstate.progress);
            mIm.tryPointerSpeed(-7 + savedstate.progress);
            return;
        } else
        {
            super.onRestoreInstanceState(parcelable);
            return;
        }
    }

    protected Parcelable onSaveInstanceState()
    {
        Parcelable parcelable = super.onSaveInstanceState();
        if (getDialog() != null && getDialog().isShowing())
        {
            SavedState savedstate = new SavedState(parcelable);
            savedstate.progress = mSeekBar.getProgress();
            savedstate.oldSpeed = mOldSpeed;
            restoreOldState();
            return savedstate;
        } else
        {
            return parcelable;
        }
    }

    public void onStartTrackingTouch(SeekBar seekbar)
    {
        mTouchInProgress = true;
    }

    public void onStopTrackingTouch(SeekBar seekbar)
    {
        mTouchInProgress = false;
        mIm.tryPointerSpeed(-7 + seekbar.getProgress());
    }

    protected void showDialog(Bundle bundle)
    {
        super.showDialog(bundle);
        getContext().getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("pointer_speed"), true, mSpeedObserver);
        mRestoredOldState = false;
    }

}
