// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;

public class AccessibilityEnableScriptInjectionPreference extends DialogPreference
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
        private boolean mInjectionAllowed;

        public void writeToParcel(Parcel parcel, int i)
        {
            super.writeToParcel(parcel, i);
            int j;
            if (mInjectionAllowed)
                j = 1;
            else
                j = 0;
            parcel.writeInt(j);
        }




/*
        static boolean access$002(SavedState savedstate, boolean flag)
        {
            savedstate.mInjectionAllowed = flag;
            return flag;
        }

*/

        public SavedState(Parcel parcel)
        {
            boolean flag = true;
            super(parcel);
            if (parcel.readInt() != flag)
                flag = false;
            mInjectionAllowed = flag;
        }

        public SavedState(Parcelable parcelable)
        {
            super(parcelable);
        }
    }


    private boolean mInjectionAllowed;
    private boolean mSendClickAccessibilityEvent;

    public AccessibilityEnableScriptInjectionPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        updateSummary();
    }

    private void sendAccessibilityEvent(View view)
    {
        AccessibilityManager accessibilitymanager = AccessibilityManager.getInstance(getContext());
        if (mSendClickAccessibilityEvent && accessibilitymanager.isEnabled())
        {
            AccessibilityEvent accessibilityevent = AccessibilityEvent.obtain();
            accessibilityevent.setEventType(1);
            view.onInitializeAccessibilityEvent(accessibilityevent);
            view.dispatchPopulateAccessibilityEvent(accessibilityevent);
            accessibilitymanager.sendAccessibilityEvent(accessibilityevent);
        }
        mSendClickAccessibilityEvent = false;
    }

    private void setSystemSetting(boolean flag)
    {
        android.content.ContentResolver contentresolver = getContext().getContentResolver();
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        android.provider.Settings.Secure.putInt(contentresolver, "accessibility_script_injection", i);
    }

    private void updateSummary()
    {
        String s;
        if (mInjectionAllowed)
            s = getContext().getString(0x7f0b073f);
        else
            s = getContext().getString(0x7f0b0740);
        setSummary(s);
    }

    public boolean isInjectionAllowed()
    {
        return mInjectionAllowed;
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        sendAccessibilityEvent(view.findViewById(0x1020010));
    }

    protected void onClick()
    {
        if (isInjectionAllowed())
        {
            setInjectionAllowed(false);
            setSystemSetting(false);
            mSendClickAccessibilityEvent = true;
            return;
        } else
        {
            super.onClick();
            mSendClickAccessibilityEvent = false;
            return;
        }
    }

    protected void onDialogClosed(boolean flag)
    {
        setInjectionAllowed(flag);
        if (flag)
            setSystemSetting(true);
    }

    protected Object onGetDefaultValue(TypedArray typedarray, int i)
    {
        return Boolean.valueOf(typedarray.getBoolean(i, false));
    }

    protected void onRestoreInstanceState(Parcelable parcelable)
    {
        if (parcelable != null && parcelable.getClass().equals(com/android/settings/AccessibilityEnableScriptInjectionPreference$SavedState))
        {
            SavedState savedstate = (SavedState)parcelable;
            super.onRestoreInstanceState(savedstate.getSuperState());
            setInjectionAllowed(savedstate.mInjectionAllowed);
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
        if (isPersistent())
        {
            return parcelable;
        } else
        {
            SavedState savedstate = new SavedState(parcelable);
            savedstate.mInjectionAllowed = mInjectionAllowed;
            return savedstate;
        }
    }

    protected void onSetInitialValue(boolean flag, Object obj)
    {
        boolean flag1;
        if (flag)
            flag1 = getPersistedBoolean(mInjectionAllowed);
        else
            flag1 = ((Boolean)obj).booleanValue();
        setInjectionAllowed(flag1);
    }

    public void setInjectionAllowed(boolean flag)
    {
        if (mInjectionAllowed != flag)
        {
            mInjectionAllowed = flag;
            persistBoolean(flag);
            updateSummary();
        }
    }
}
