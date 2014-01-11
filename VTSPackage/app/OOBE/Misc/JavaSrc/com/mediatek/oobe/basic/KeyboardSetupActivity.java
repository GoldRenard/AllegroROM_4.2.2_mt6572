// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic;

import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.view.inputmethod.InputMethodInfo;
import android.view.inputmethod.InputMethodManager;
import com.mediatek.oobe.utils.*;
import com.mediatek.xlog.Xlog;
import java.util.HashMap;
import java.util.List;

public class KeyboardSetupActivity extends OOBEStepPreferenceActivity
    implements android.view.View.OnClickListener
{

    public static final String ACTION_INPUT_METHOD_SETTING = "com.mediatek.ime.INPUT_METHOD_SELECTION_WIZARD";
    private static final String MTK_INPUT_METHOD = "com.mediatek.ime/.MtkIME";
    private static final String TAG = "OOBE";
    private HashMap mInputMethodMaps;
    private List mInputMethodProperties;
    private String mLastInputMethodId;
    private RadioButtonPreference mLastSelectedPref;
    final android.text.TextUtils.SimpleStringSplitter mStringColonSplitter = new android.text.TextUtils.SimpleStringSplitter(':');

    public KeyboardSetupActivity()
    {
        mInputMethodMaps = new HashMap();
    }

    private void initInputMethods()
    {
        mLastInputMethodId = android.provider.Settings.Secure.getString(getContentResolver(), "default_input_method");
        mInputMethodProperties = ((InputMethodManager)getSystemService("input_method")).getEnabledInputMethodList();
        int i;
        if (mInputMethodProperties == null)
            i = 0;
        else
            i = mInputMethodProperties.size();
        for (int j = 0; j < i; j++)
        {
            InputMethodInfo inputmethodinfo = (InputMethodInfo)mInputMethodProperties.get(j);
            String s = inputmethodinfo.getId();
            CharSequence charsequence = inputmethodinfo.loadLabel(getPackageManager());
            mInputMethodMaps.put(s, charsequence);
            String s1 = "";
            if (isMTKIme(s))
                s1 = getResources().getString(0x7f090061);
            RadioButtonPreference radiobuttonpreference = new RadioButtonPreference(this, charsequence.toString(), s1);
            radiobuttonpreference.setNote(s);
            if (mLastInputMethodId.equals(s))
            {
                radiobuttonpreference.setChecked(true);
                mLastSelectedPref = radiobuttonpreference;
            }
            getPreferenceScreen().addPreference(radiobuttonpreference);
        }

        Xlog.v("OOBE", (new StringBuilder()).append("Default Input method: ").append(mLastInputMethodId).toString());
    }

    private boolean isMTKIme(String s)
    {
        return s.equals("com.mediatek.ime/.MtkIME");
    }

    private void selectIME(RadioButtonPreference radiobuttonpreference)
    {
        if (mLastSelectedPref != null)
        {
            if (mLastSelectedPref == radiobuttonpreference)
                return;
            mLastSelectedPref.setChecked(false);
        }
        radiobuttonpreference.setChecked(true);
        mLastSelectedPref = radiobuttonpreference;
        InputMethodManager inputmethodmanager = (InputMethodManager)getSystemService("input_method");
        if (checkCallingOrSelfPermission("android.permission.WRITE_SECURE_SETTINGS") != 0)
        {
            Xlog.i("OOBE", "myActivity requires permission android.permission.WRITE_SECURE_SETTINGS");
        } else
        {
            Xlog.v("OOBE", (new StringBuilder()).append("Select IME is: ").append(radiobuttonpreference.getNote()).toString());
            inputmethodmanager.setInputMethod(null, radiobuttonpreference.getNote());
            mLastInputMethodId = radiobuttonpreference.getNote();
        }
        Xlog.v("OOBE", (new StringBuilder()).append("After selected: ").append(android.provider.Settings.Secure.getString(getContentResolver(), "default_input_method")).toString());
    }

    private void startMTKIMESetting()
    {
        Intent intent = new Intent();
        intent.setAction("com.mediatek.ime.INPUT_METHOD_SELECTION_WIZARD");
        intent.putExtra("oobe_step_total", super.mTotalStep);
        intent.putExtra("oobe_step_index", super.mStepIndex);
        startActivityForResult(intent, 1);
    }

    protected String getStepSpecialTag()
    {
        return "KeyboardSetupActivity";
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        OOBEConstants.logd((new StringBuilder()).append("KeyboardSetupActivity onActivityResult: resultCode = ").append(j).toString());
        if (21 == j)
            Xlog.d("OOBE", "back request");
        else
        if (20 == j)
        {
            finishActivityByResultCode(20);
            return;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        Xlog.d("OOBE", "OnCreate KeyboardSetupActivity");
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050004);
        initSpecialLayout(0x7f09004f, 0x7f090050);
        initInputMethods();
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
        if (isMTKIme(mLastInputMethodId))
        {
            startMTKIMESetting();
            return;
        } else
        {
            finishActivityByResultCode(20);
            return;
        }
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference instanceof RadioButtonPreference)
            selectIME((RadioButtonPreference)preference);
        return true;
    }
}
