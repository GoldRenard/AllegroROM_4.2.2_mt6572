// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.inputmethod;

import android.app.Activity;
import android.content.Intent;
import android.hardware.input.InputManager;
import android.hardware.input.KeyboardLayout;
import android.os.Bundle;
import android.preference.*;
import android.view.InputDevice;
import com.android.settings.SettingsPreferenceFragment;
import java.util.*;

public class KeyboardLayoutPickerFragment extends SettingsPreferenceFragment
    implements android.hardware.input.InputManager.InputDeviceListener
{

    public static final String EXTRA_INPUT_DEVICE_DESCRIPTOR = "input_device_descriptor";
    private InputManager mIm;
    private String mInputDeviceDescriptor;
    private int mInputDeviceId;
    private KeyboardLayout mKeyboardLayouts[];
    private HashMap mPreferenceMap;

    public KeyboardLayoutPickerFragment()
    {
        mInputDeviceId = -1;
        mPreferenceMap = new HashMap();
    }

    private PreferenceScreen createPreferenceHierarchy()
    {
        PreferenceScreen preferencescreen = getPreferenceManager().createPreferenceScreen(getActivity());
        Activity activity = getActivity();
        KeyboardLayout akeyboardlayout[] = mKeyboardLayouts;
        int i = akeyboardlayout.length;
        for (int j = 0; j < i; j++)
        {
            KeyboardLayout keyboardlayout = akeyboardlayout[j];
            CheckBoxPreference checkboxpreference = new CheckBoxPreference(activity);
            checkboxpreference.setTitle(keyboardlayout.getLabel());
            checkboxpreference.setSummary(keyboardlayout.getCollection());
            preferencescreen.addPreference(checkboxpreference);
            mPreferenceMap.put(checkboxpreference, keyboardlayout);
        }

        return preferencescreen;
    }

    private void updateCheckedState()
    {
        String as[] = mIm.getKeyboardLayoutsForInputDevice(mInputDeviceDescriptor);
        Arrays.sort(as);
        CheckBoxPreference checkboxpreference;
        boolean flag;
        for (Iterator iterator = mPreferenceMap.entrySet().iterator(); iterator.hasNext(); checkboxpreference.setChecked(flag))
        {
            java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
            checkboxpreference = (CheckBoxPreference)entry.getKey();
            if (Arrays.binarySearch(as, ((KeyboardLayout)entry.getValue()).getDescriptor()) >= 0)
                flag = true;
            else
                flag = false;
        }

    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mInputDeviceDescriptor = getActivity().getIntent().getStringExtra("input_device_descriptor");
        if (mInputDeviceDescriptor == null)
            getActivity().finish();
        mIm = (InputManager)getSystemService("input");
        mKeyboardLayouts = mIm.getKeyboardLayouts();
        Arrays.sort(mKeyboardLayouts);
        setPreferenceScreen(createPreferenceHierarchy());
    }

    public void onInputDeviceAdded(int i)
    {
    }

    public void onInputDeviceChanged(int i)
    {
        if (mInputDeviceId >= 0 && i == mInputDeviceId)
            updateCheckedState();
    }

    public void onInputDeviceRemoved(int i)
    {
        if (mInputDeviceId >= 0 && i == mInputDeviceId)
            getActivity().finish();
    }

    public void onPause()
    {
        mIm.unregisterInputDeviceListener(this);
        mInputDeviceId = -1;
        super.onPause();
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference instanceof CheckBoxPreference)
        {
            CheckBoxPreference checkboxpreference = (CheckBoxPreference)preference;
            KeyboardLayout keyboardlayout = (KeyboardLayout)mPreferenceMap.get(checkboxpreference);
            if (keyboardlayout != null)
            {
                if (checkboxpreference.isChecked())
                    mIm.addKeyboardLayoutForInputDevice(mInputDeviceDescriptor, keyboardlayout.getDescriptor());
                else
                    mIm.removeKeyboardLayoutForInputDevice(mInputDeviceDescriptor, keyboardlayout.getDescriptor());
                return true;
            }
        }
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }

    public void onResume()
    {
        super.onResume();
        mIm.registerInputDeviceListener(this, null);
        InputDevice inputdevice = mIm.getInputDeviceByDescriptor(mInputDeviceDescriptor);
        if (inputdevice == null)
        {
            getActivity().finish();
            return;
        } else
        {
            mInputDeviceId = inputdevice.getId();
            updateCheckedState();
            return;
        }
    }
}
