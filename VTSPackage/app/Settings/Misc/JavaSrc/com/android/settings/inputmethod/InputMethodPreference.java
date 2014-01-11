// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.inputmethod;

import android.app.*;
import android.content.*;
import android.content.pm.ApplicationInfo;
import android.content.pm.ServiceInfo;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.PreferenceActivity;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.inputmethod.*;
import android.widget.*;
import com.android.settings.SettingsPreferenceFragment;
import java.util.*;

// Referenced classes of package com.android.settings.inputmethod:
//            InputMethodAndSubtypeUtil, InputMethodAndSubtypeEnabler

public class InputMethodPreference extends CheckBoxPreference
    implements Comparator
{

    private static final float DISABLED_ALPHA = 0.4F;
    private static final String TAG = com/android/settings/inputmethod/InputMethodPreference.getSimpleName();
    private final boolean mAlwaysChecked;
    private AlertDialog mDialog;
    private final SettingsPreferenceFragment mFragment;
    private final InputMethodInfo mImi;
    private final InputMethodManager mImm;
    private View mInputMethodPref;
    private ImageView mInputMethodSettingsButton;
    private final boolean mIsSystemIme;
    private final android.view.View.OnClickListener mPrefOnclickListener = new android.view.View.OnClickListener() {

        final InputMethodPreference this$0;

        public void onClick(View view)
        {
            if (!isEnabled())
                return;
            if (isChecked())
            {
                setChecked(false, true);
                return;
            }
            if (mIsSystemIme)
            {
                setChecked(true, true);
                return;
            } else
            {
                showSecurityWarnDialog(mImi, InputMethodPreference.this);
                return;
            }
        }

            
            {
                this$0 = InputMethodPreference.this;
                super();
            }
    }
;
    private final Intent mSettingsIntent;
    private TextView mSummaryText;
    private TextView mTitleText;

    public InputMethodPreference(SettingsPreferenceFragment settingspreferencefragment, Intent intent, InputMethodManager inputmethodmanager, InputMethodInfo inputmethodinfo, int i)
    {
        super(settingspreferencefragment.getActivity(), null, 0x7f0f001a);
        mDialog = null;
        setLayoutResource(0x7f040068);
        setWidgetLayoutResource(0x7f040069);
        mFragment = settingspreferencefragment;
        mSettingsIntent = intent;
        mImm = inputmethodmanager;
        mImi = inputmethodinfo;
        updateSummary();
        mAlwaysChecked = InputMethodAndSubtypeUtil.isAlwaysCheckedIme(inputmethodinfo, settingspreferencefragment.getActivity(), i);
        mIsSystemIme = InputMethodAndSubtypeUtil.isSystemIme(inputmethodinfo);
        if (mAlwaysChecked)
            setEnabled(false);
    }

    private void saveImeSettings()
    {
        SettingsPreferenceFragment settingspreferencefragment = mFragment;
        android.content.ContentResolver contentresolver = mFragment.getActivity().getContentResolver();
        List list = mImm.getInputMethodList();
        boolean flag;
        if (mFragment.getResources().getConfiguration().keyboard == 2)
            flag = true;
        else
            flag = false;
        InputMethodAndSubtypeUtil.saveInputMethodSubtypeList(settingspreferencefragment, contentresolver, list, flag);
    }

    private void showSecurityWarnDialog(InputMethodInfo inputmethodinfo, final InputMethodPreference chkPref)
    {
        if (mDialog != null && mDialog.isShowing())
            mDialog.dismiss();
        mDialog = (new android.app.AlertDialog.Builder(mFragment.getActivity())).setTitle(0x1040014).setIconAttribute(0x1010355).setCancelable(true).setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

            final InputMethodPreference this$0;
            final InputMethodPreference val$chkPref;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                chkPref.setChecked(true, true);
            }

            
            {
                this$0 = InputMethodPreference.this;
                chkPref = inputmethodpreference1;
                super();
            }
        }
).setNegativeButton(0x1040000, new android.content.DialogInterface.OnClickListener() {

            final InputMethodPreference this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
            }

            
            {
                this$0 = InputMethodPreference.this;
                super();
            }
        }
).create();
        AlertDialog alertdialog = mDialog;
        Resources resources = mFragment.getResources();
        Object aobj[] = new Object[1];
        aobj[0] = inputmethodinfo.getServiceInfo().applicationInfo.loadLabel(mFragment.getActivity().getPackageManager());
        alertdialog.setMessage(resources.getString(0x7f0b06c5, aobj));
        mDialog.show();
    }

    public static boolean startFragment(Fragment fragment, String s, int i, Bundle bundle)
    {
        if (fragment.getActivity() instanceof PreferenceActivity)
        {
            ((PreferenceActivity)fragment.getActivity()).startPreferencePanel(s, bundle, 0, null, fragment, i);
            return true;
        } else
        {
            Log.w(TAG, (new StringBuilder()).append("Parent isn't PreferenceActivity, thus there's no way to launch the given Fragment (name: ").append(s).append(", requestCode: ").append(i).append(")").toString());
            return false;
        }
    }

    private void updatePreferenceViews()
    {
        boolean flag = isChecked();
        if (mInputMethodSettingsButton != null)
        {
            mInputMethodSettingsButton.setEnabled(flag);
            mInputMethodSettingsButton.setClickable(flag);
            mInputMethodSettingsButton.setFocusable(flag);
            if (!flag)
                mInputMethodSettingsButton.setAlpha(0.4F);
        }
        if (mTitleText != null)
            mTitleText.setEnabled(true);
        if (mSummaryText != null)
            mSummaryText.setEnabled(flag);
        if (mInputMethodPref != null)
        {
            mInputMethodPref.setEnabled(true);
            mInputMethodPref.setLongClickable(flag);
            boolean flag1 = isEnabled();
            View view = mInputMethodPref;
            android.view.View.OnClickListener onclicklistener;
            if (flag1)
                onclicklistener = mPrefOnclickListener;
            else
                onclicklistener = null;
            view.setOnClickListener(onclicklistener);
            if (!flag1)
                mInputMethodPref.setBackgroundColor(0);
        }
    }

    public int compare(InputMethodPreference inputmethodpreference, InputMethodPreference inputmethodpreference1)
    {
        if (inputmethodpreference.isEnabled() == inputmethodpreference.isEnabled())
            return inputmethodpreference.mImi.getId().compareTo(inputmethodpreference1.mImi.getId());
        return !inputmethodpreference.isEnabled() ? -1 : 1;
    }

    public volatile int compare(Object obj, Object obj1)
    {
        return compare((InputMethodPreference)obj, (InputMethodPreference)obj1);
    }

    public String getSummaryString()
    {
        StringBuilder stringbuilder = new StringBuilder();
        InputMethodSubtype inputmethodsubtype;
        for (Iterator iterator = mImm.getEnabledInputMethodSubtypeList(mImi, true).iterator(); iterator.hasNext(); stringbuilder.append(inputmethodsubtype.getDisplayName(mFragment.getActivity(), mImi.getPackageName(), mImi.getServiceInfo().applicationInfo)))
        {
            inputmethodsubtype = (InputMethodSubtype)iterator.next();
            if (stringbuilder.length() > 0)
                stringbuilder.append(", ");
        }

        return stringbuilder.toString();
    }

    protected void onBindView(View view)
    {
        int i = 1;
        super.onBindView(view);
        mInputMethodPref = view.findViewById(0x7f080103);
        mInputMethodPref.setOnClickListener(mPrefOnclickListener);
        mInputMethodSettingsButton = (ImageView)view.findViewById(0x7f080104);
        mTitleText = (TextView)view.findViewById(0x1020016);
        mSummaryText = (TextView)view.findViewById(0x1020010);
        if (mImi.getSubtypeCount() <= i)
            i = 0;
        final String imiId = mImi.getId();
        if (i != 0)
            mInputMethodPref.setOnLongClickListener(new android.view.View.OnLongClickListener() {

                final InputMethodPreference this$0;
                final String val$imiId;

                public boolean onLongClick(View view1)
                {
                    Bundle bundle = new Bundle();
                    bundle.putString("input_method_id", imiId);
                    InputMethodPreference.startFragment(mFragment, com/android/settings/inputmethod/InputMethodAndSubtypeEnabler.getName(), 0, bundle);
                    return true;
                }

            
            {
                this$0 = InputMethodPreference.this;
                imiId = s;
                super();
            }
            }
);
        if (mSettingsIntent != null)
            mInputMethodSettingsButton.setOnClickListener(new android.view.View.OnClickListener() {

                final InputMethodPreference this$0;

                public void onClick(View view1)
                {
                    try
                    {
                        mFragment.startActivity(mSettingsIntent);
                        return;
                    }
                    catch (ActivityNotFoundException activitynotfoundexception)
                    {
                        Log.d(InputMethodPreference.TAG, (new StringBuilder()).append("IME's Settings Activity Not Found: ").append(activitynotfoundexception).toString());
                    }
                    SettingsPreferenceFragment settingspreferencefragment = mFragment;
                    Object aobj[] = new Object[1];
                    aobj[0] = mImi.loadLabel(mFragment.getActivity().getPackageManager());
                    String s = settingspreferencefragment.getString(0x7f0b06c9, aobj);
                    Toast.makeText(mFragment.getActivity(), s, 1).show();
                }

            
            {
                this$0 = InputMethodPreference.this;
                super();
            }
            }
);
        if (i != 0)
        {
            android.view.View.OnLongClickListener onlongclicklistener = new android.view.View.OnLongClickListener() {

                final InputMethodPreference this$0;
                final String val$imiId;

                public boolean onLongClick(View view1)
                {
                    Bundle bundle = new Bundle();
                    bundle.putString("input_method_id", imiId);
                    InputMethodPreference.startFragment(mFragment, com/android/settings/inputmethod/InputMethodAndSubtypeEnabler.getName(), 0, bundle);
                    return true;
                }

            
            {
                this$0 = InputMethodPreference.this;
                imiId = s;
                super();
            }
            }
;
            mInputMethodSettingsButton.setOnLongClickListener(onlongclicklistener);
        }
        if (mSettingsIntent == null)
        {
            mInputMethodSettingsButton.setVisibility(8);
            return;
        } else
        {
            updatePreferenceViews();
            return;
        }
    }

    public void setChecked(boolean flag)
    {
        setChecked(flag, false);
    }

    public void setChecked(boolean flag, boolean flag1)
    {
        super.setChecked(flag);
        if (flag1)
            saveImeSettings();
        updateSummary();
    }

    public void setEnabled(boolean flag)
    {
        super.setEnabled(flag);
        updatePreferenceViews();
    }

    public void updateSummary()
    {
        String s = getSummaryString();
        if (TextUtils.isEmpty(s))
        {
            return;
        } else
        {
            setSummary(s);
            return;
        }
    }







}
