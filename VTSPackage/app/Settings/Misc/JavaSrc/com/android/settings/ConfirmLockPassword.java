// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.preference.PreferenceActivity;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.*;
import android.widget.Button;
import android.widget.TextView;
import com.android.internal.widget.*;

public class ConfirmLockPassword extends PreferenceActivity
{
    public static class ConfirmLockPasswordFragment extends Fragment
        implements android.view.View.OnClickListener, android.widget.TextView.OnEditorActionListener, TextWatcher
    {

        private static final long ERROR_MESSAGE_TIMEOUT = 3000L;
        private Button mContinueButton;
        private Handler mHandler;
        private TextView mHeaderText;
        private PasswordEntryKeyboardHelper mKeyboardHelper;
        private PasswordEntryKeyboardView mKeyboardView;
        private LockPatternUtils mLockPatternUtils;
        private TextView mPasswordEntry;

        private void handleNext()
        {
            String s = mPasswordEntry.getText().toString();
            if (mLockPatternUtils.checkPassword(s))
            {
                Intent intent = new Intent();
                intent.putExtra("password", s);
                getActivity().setResult(-1, intent);
                getActivity().finish();
                return;
            } else
            {
                showError(0x7f0b0610);
                return;
            }
        }

        private void showError(int i)
        {
            mHeaderText.setText(i);
            mHeaderText.announceForAccessibility(mHeaderText.getText());
            mPasswordEntry.setText(null);
            mHandler.postDelayed(new Runnable() {

                final ConfirmLockPasswordFragment this$0;

                public void run()
                {
                    mHeaderText.setText(0x7f0b0602);
                }

            
            {
                this$0 = ConfirmLockPasswordFragment.this;
                super();
            }
            }
, 3000L);
        }

        public void afterTextChanged(Editable editable)
        {
            Button button = mContinueButton;
            boolean flag;
            if (mPasswordEntry.getText().length() > 0)
                flag = true;
            else
                flag = false;
            button.setEnabled(flag);
        }

        public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
        {
        }

        public void onClick(View view)
        {
            switch (view.getId())
            {
            case 2131230760: 
                getActivity().setResult(0);
                getActivity().finish();
                return;

            case 2131230761: 
                handleNext();
                return;
            }
        }

        public void onCreate(Bundle bundle)
        {
            super.onCreate(bundle);
            mLockPatternUtils = new LockPatternUtils(getActivity());
        }

        public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
        {
            int i = mLockPatternUtils.getKeyguardStoredPasswordQuality();
            View view = layoutinflater.inflate(0x7f040019, null);
            view.findViewById(0x7f080028).setOnClickListener(this);
            mContinueButton = (Button)view.findViewById(0x7f080029);
            mContinueButton.setOnClickListener(this);
            mContinueButton.setEnabled(false);
            mPasswordEntry = (TextView)view.findViewById(0x7f080027);
            mPasswordEntry.setOnEditorActionListener(this);
            mPasswordEntry.addTextChangedListener(this);
            mKeyboardView = (PasswordEntryKeyboardView)view.findViewById(0x7f08002a);
            mHeaderText = (TextView)view.findViewById(0x7f080025);
            boolean flag;
            if (0x40000 != i && 0x50000 != i && 0x60000 != i)
                flag = false;
            else
                flag = true;
            TextView textview = mHeaderText;
            int j;
            if (flag)
                j = 0x7f0b0602;
            else
                j = 0x7f0b0604;
            textview.setText(j);
            Activity activity = getActivity();
            mKeyboardHelper = new PasswordEntryKeyboardHelper(activity, mKeyboardView, mPasswordEntry);
            PasswordEntryKeyboardHelper passwordentrykeyboardhelper = mKeyboardHelper;
            int k;
            if (flag)
                k = 0;
            else
                k = 1;
            passwordentrykeyboardhelper.setKeyboardMode(k);
            mKeyboardView.requestFocus();
            int l = mPasswordEntry.getInputType();
            TextView textview1 = mPasswordEntry;
            if (!flag)
                l = 18;
            textview1.setInputType(l);
            if (activity instanceof PreferenceActivity)
            {
                PreferenceActivity preferenceactivity = (PreferenceActivity)activity;
                int i1;
                if (flag)
                    i1 = 0x7f0b0602;
                else
                    i1 = 0x7f0b0604;
                CharSequence charsequence = getText(i1);
                preferenceactivity.showBreadCrumbs(charsequence, charsequence);
            }
            return view;
        }

        public boolean onEditorAction(TextView textview, int i, KeyEvent keyevent)
        {
            if (i != 0 && i != 6 && i != 5)
            {
                return false;
            } else
            {
                handleNext();
                return true;
            }
        }

        public void onPause()
        {
            super.onPause();
            mKeyboardView.requestFocus();
        }

        public void onResume()
        {
            super.onResume();
            mKeyboardView.requestFocus();
        }

        public void onTextChanged(CharSequence charsequence, int i, int j, int k)
        {
        }


        public ConfirmLockPasswordFragment()
        {
            mHandler = new Handler();
        }
    }



    public Intent getIntent()
    {
        Intent intent = new Intent(super.getIntent());
        intent.putExtra(":android:show_fragment", com/android/settings/ConfirmLockPassword$ConfirmLockPasswordFragment.getName());
        intent.putExtra(":android:no_headers", true);
        return intent;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        CharSequence charsequence = getText(0x7f0b0602);
        showBreadCrumbs(charsequence, charsequence);
    }
}
