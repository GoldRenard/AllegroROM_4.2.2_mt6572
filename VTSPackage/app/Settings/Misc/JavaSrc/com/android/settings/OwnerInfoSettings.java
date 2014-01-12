// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.Fragment;
import android.content.ContentResolver;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.UserHandle;
import android.view.*;
import android.view.inputmethod.InputMethodManager;
import android.widget.*;

public class OwnerInfoSettings extends Fragment
{

    private CheckBox mCheckbox;
    private EditText mEditText;
    private View mView;


    private void initView(View view)
    {
        boolean flag = true;
        final ContentResolver res = getActivity().getContentResolver();
        String s = android.provider.Settings.Secure.getString(res, "lock_screen_owner_info");
        int i = android.provider.Settings.Secure.getInt(res, "lock_screen_owner_info_enabled", flag);
        mCheckbox = (CheckBox)mView.findViewById(0x7f0800e3);
        mEditText = (EditText)mView.findViewById(0x7f0800e4);
        mEditText.setText(s);
        EditText edittext = mEditText;
        boolean flag1;
        if (i != 0)
            flag1 = flag;
        else
            flag1 = false;
        edittext.setEnabled(flag1);
        CheckBox checkbox = mCheckbox;
        if (i == 0)
            flag = false;
        checkbox.setChecked(flag);
        if (UserHandle.myUserId() != 0)
            mCheckbox.setText(0x7f0b0378);
        mCheckbox.setOnCheckedChangeListener(new android.widget.CompoundButton.OnCheckedChangeListener() {

            final OwnerInfoSettings this$0;
            final ContentResolver val$res;

            public void onCheckedChanged(CompoundButton compoundbutton, boolean flag2)
            {
                ContentResolver contentresolver = res;
                int j;
                if (flag2)
                    j = 1;
                else
                    j = 0;
                android.provider.Settings.Secure.putInt(contentresolver, "lock_screen_owner_info_enabled", j);
                mEditText.setEnabled(flag2);
            }

            
            {
                this$0 = OwnerInfoSettings.this;
                res = contentresolver;
                super();
            }
        }
);
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        mView = layoutinflater.inflate(0x7f040055, viewgroup, false);
        initView(mView);
        return mView;
    }

    public void onPause()
    {
        super.onPause();
        if (getResources().getBoolean(0x7f090006))
        {
            getActivity();
            ((InputMethodManager)getActivity().getSystemService("input_method")).hideSoftInputFromWindow(getActivity().getCurrentFocus().getWindowToken(), 0);
        }
        saveToDb();
    }

    void saveToDb()
    {
        android.provider.Settings.Secure.putString(getActivity().getContentResolver(), "lock_screen_owner_info", mEditText.getText().toString());
    }

}
