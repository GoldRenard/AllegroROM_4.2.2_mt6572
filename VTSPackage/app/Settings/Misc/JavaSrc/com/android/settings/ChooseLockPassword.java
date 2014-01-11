// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.Fragment;
import android.content.Intent;
import android.content.res.Resources;
import android.inputmethodservice.KeyboardView;
import android.os.*;
import android.preference.PreferenceActivity;
import android.text.*;
import android.view.*;
import android.widget.Button;
import android.widget.TextView;
import com.android.internal.widget.*;

// Referenced classes of package com.android.settings:
//            ChooseLockSettingsHelper

public class ChooseLockPassword extends PreferenceActivity
{
    public static class ChooseLockPasswordFragment extends Fragment
        implements android.view.View.OnClickListener, android.widget.TextView.OnEditorActionListener, TextWatcher
    {

        private static final int CONFIRM_EXISTING_REQUEST = 58;
        private static final long ERROR_MESSAGE_TIMEOUT = 3000L;
        private static final String KEY_FIRST_PIN = "first_pin";
        private static final String KEY_UI_STAGE = "ui_stage";
        private static final int MSG_SHOW_ERROR = 1;
        static final int RESULT_FINISHED = 1;
        private Button mCancelButton;
        private ChooseLockSettingsHelper mChooseLockSettingsHelper;
        private String mFirstPin;
        private Handler mHandler;
        private TextView mHeaderText;
        private boolean mIsAlphaMode;
        private PasswordEntryKeyboardHelper mKeyboardHelper;
        private KeyboardView mKeyboardView;
        private LockPatternUtils mLockPatternUtils;
        private Button mNextButton;
        private TextView mPasswordEntry;
        private int mPasswordMaxLength;
        private int mPasswordMinLength;
        private int mPasswordMinLetters;
        private int mPasswordMinLowerCase;
        private int mPasswordMinNonLetter;
        private int mPasswordMinNumeric;
        private int mPasswordMinSymbols;
        private int mPasswordMinUpperCase;
        private int mRequestedQuality;
        private Stage mUiStage;

        private void handleNext()
        {
            String s = mPasswordEntry.getText().toString();
            if (!TextUtils.isEmpty(s))
            {
                String s1;
                if (mUiStage == Stage.Introduction)
                {
                    s1 = validatePassword(s);
                    if (s1 == null)
                    {
                        mFirstPin = s;
                        mPasswordEntry.setText("");
                        updateStage(Stage.NeedToConfirm);
                    }
                } else
                {
                    Stage stage = mUiStage;
                    Stage stage1 = Stage.NeedToConfirm;
                    s1 = null;
                    if (stage == stage1)
                        if (mFirstPin.equals(s))
                        {
                            boolean flag = getActivity().getIntent().getBooleanExtra("lockscreen.weak_fallback", false);
                            String s2 = getActivity().getIntent().getStringExtra("settings_command_key");
                            String s3 = getActivity().getIntent().getStringExtra("settings_command_value");
                            String s4 = getActivity().getIntent().getStringExtra("lockscreen.weak_fallback_for");
                            if (s2 != null)
                                android.provider.Settings.System.putString(getActivity().getContentResolver(), s2, s3);
                            mLockPatternUtils.clearLock(flag);
                            mLockPatternUtils.saveLockPassword(s, mRequestedQuality, flag, s4);
                            getActivity().setResult(-1);
                            getActivity().finish();
                            s1 = null;
                        } else
                        {
                            CharSequence charsequence = mPasswordEntry.getText();
                            if (charsequence != null)
                                Selection.setSelection((Spannable)charsequence, 0, charsequence.length());
                            updateStage(Stage.ConfirmWrong);
                            s1 = null;
                        }
                }
                if (s1 != null)
                {
                    showError(s1, mUiStage);
                    return;
                }
            }
        }

        private void showError(String s, Stage stage)
        {
            mHeaderText.setText(s);
            mHeaderText.announceForAccessibility(mHeaderText.getText());
            Message message = mHandler.obtainMessage(1, stage);
            mHandler.removeMessages(1);
            mHandler.sendMessageDelayed(message, 3000L);
        }

        private void updateUi()
        {
            String s = mPasswordEntry.getText().toString();
            int i = s.length();
            if (mUiStage == Stage.Introduction && i > 0)
            {
                if (i < mPasswordMinLength)
                {
                    int k;
                    if (mIsAlphaMode)
                        k = 0x7f0b03b3;
                    else
                        k = 0x7f0b03b4;
                    Object aobj[] = new Object[1];
                    aobj[0] = Integer.valueOf(mPasswordMinLength);
                    String s2 = getString(k, aobj);
                    mHeaderText.setText(s2);
                    mNextButton.setEnabled(false);
                } else
                {
                    String s1 = validatePassword(s);
                    if (s1 != null)
                    {
                        mHeaderText.setText(s1);
                        mNextButton.setEnabled(false);
                    } else
                    {
                        mHeaderText.setText(0x7f0b03b5);
                        mNextButton.setEnabled(true);
                    }
                }
            } else
            {
                TextView textview = mHeaderText;
                int j;
                if (mIsAlphaMode)
                    j = mUiStage.alphaHint;
                else
                    j = mUiStage.numericHint;
                textview.setText(j);
                Button button = mNextButton;
                boolean flag;
                if (i > 0)
                    flag = true;
                else
                    flag = false;
                button.setEnabled(flag);
            }
            mNextButton.setText(mUiStage.buttonText);
        }

        private String validatePassword(String s)
        {
            if (s.length() < mPasswordMinLength)
            {
                int j2;
                if (mIsAlphaMode)
                    j2 = 0x7f0b03b3;
                else
                    j2 = 0x7f0b03b4;
                Object aobj7[] = new Object[1];
                aobj7[0] = Integer.valueOf(mPasswordMinLength);
                return getString(j2, aobj7);
            }
            if (s.length() > mPasswordMaxLength)
            {
                int i2;
                if (mIsAlphaMode)
                    i2 = 0x7f0b03b7;
                else
                    i2 = 0x7f0b03b8;
                Object aobj6[] = new Object[1];
                aobj6[0] = Integer.valueOf(1 + mPasswordMaxLength);
                return getString(i2, aobj6);
            }
            int i = 0;
            int j = 0;
            int k = 0;
            int l = 0;
            int i1 = 0;
            int j1 = 0;
            for (int k1 = 0; k1 < s.length();)
            {
                char c = s.charAt(k1);
                if (c >= ' ' && c <= '\177')
                {
                    if (c >= '0' && c <= '9')
                    {
                        j++;
                        j1++;
                    } else
                    if (c >= 'A' && c <= 'Z')
                    {
                        i++;
                        i1++;
                    } else
                    if (c >= 'a' && c <= 'z')
                    {
                        i++;
                        k++;
                    } else
                    {
                        l++;
                        j1++;
                    }
                    k1++;
                } else
                {
                    return getString(0x7f0b03bb);
                }
            }

            if (0x20000 != mRequestedQuality || i <= 0 && l <= 0)
            {
                if (0x60000 == mRequestedQuality)
                {
                    if (i < mPasswordMinLetters)
                    {
                        String s6 = getResources().getQuantityString(0x7f0e0001, mPasswordMinLetters);
                        Object aobj5[] = new Object[1];
                        aobj5[0] = Integer.valueOf(mPasswordMinLetters);
                        return String.format(s6, aobj5);
                    }
                    if (j < mPasswordMinNumeric)
                    {
                        String s5 = getResources().getQuantityString(0x7f0e0004, mPasswordMinNumeric);
                        Object aobj4[] = new Object[1];
                        aobj4[0] = Integer.valueOf(mPasswordMinNumeric);
                        return String.format(s5, aobj4);
                    }
                    if (k < mPasswordMinLowerCase)
                    {
                        String s4 = getResources().getQuantityString(0x7f0e0002, mPasswordMinLowerCase);
                        Object aobj3[] = new Object[1];
                        aobj3[0] = Integer.valueOf(mPasswordMinLowerCase);
                        return String.format(s4, aobj3);
                    }
                    if (i1 < mPasswordMinUpperCase)
                    {
                        String s3 = getResources().getQuantityString(0x7f0e0003, mPasswordMinUpperCase);
                        Object aobj2[] = new Object[1];
                        aobj2[0] = Integer.valueOf(mPasswordMinUpperCase);
                        return String.format(s3, aobj2);
                    }
                    if (l < mPasswordMinSymbols)
                    {
                        String s2 = getResources().getQuantityString(0x7f0e0005, mPasswordMinSymbols);
                        Object aobj1[] = new Object[1];
                        aobj1[0] = Integer.valueOf(mPasswordMinSymbols);
                        return String.format(s2, aobj1);
                    }
                    if (j1 < mPasswordMinNonLetter)
                    {
                        String s1 = getResources().getQuantityString(0x7f0e0006, mPasswordMinNonLetter);
                        Object aobj[] = new Object[1];
                        aobj[0] = Integer.valueOf(mPasswordMinNonLetter);
                        return String.format(s1, aobj);
                    }
                } else
                {
                    boolean flag;
                    if (0x40000 == mRequestedQuality)
                        flag = true;
                    else
                        flag = false;
                    boolean flag1;
                    if (0x50000 == mRequestedQuality)
                        flag1 = true;
                    else
                        flag1 = false;
                    if ((flag || flag1) && i == 0)
                        return getString(0x7f0b03bc);
                    if (flag1 && j == 0)
                        return getString(0x7f0b03bd);
                }
                if (mLockPatternUtils.checkPasswordHistory(s))
                {
                    int l1;
                    if (mIsAlphaMode)
                        l1 = 0x7f0b03bf;
                    else
                        l1 = 0x7f0b03ba;
                    return getString(l1);
                } else
                {
                    return null;
                }
            } else
            {
                return getString(0x7f0b03b9);
            }
        }

        public void afterTextChanged(Editable editable)
        {
            if (mUiStage == Stage.ConfirmWrong)
                mUiStage = Stage.NeedToConfirm;
            updateUi();
        }

        public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
        {
        }

        public void onActivityResult(int i, int j, Intent intent)
        {
            super.onActivityResult(i, j, intent);
            switch (i)
            {
            case 58: // ':'
                if (j != -1)
                {
                    getActivity().setResult(1);
                    getActivity().finish();
                    return;
                }
                break;
            }
        }

        public void onClick(View view)
        {
            switch (view.getId())
            {
            case 2131230760: 
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
            Intent intent = getActivity().getIntent();
            mRequestedQuality = Math.max(intent.getIntExtra("lockscreen.password_type", mRequestedQuality), mLockPatternUtils.getRequestedPasswordQuality());
            mPasswordMinLength = Math.max(intent.getIntExtra("lockscreen.password_min", mPasswordMinLength), mLockPatternUtils.getRequestedMinimumPasswordLength());
            mPasswordMaxLength = intent.getIntExtra("lockscreen.password_max", mPasswordMaxLength);
            mPasswordMinLetters = Math.max(intent.getIntExtra("lockscreen.password_min_letters", mPasswordMinLetters), mLockPatternUtils.getRequestedPasswordMinimumLetters());
            mPasswordMinUpperCase = Math.max(intent.getIntExtra("lockscreen.password_min_uppercase", mPasswordMinUpperCase), mLockPatternUtils.getRequestedPasswordMinimumUpperCase());
            mPasswordMinLowerCase = Math.max(intent.getIntExtra("lockscreen.password_min_lowercase", mPasswordMinLowerCase), mLockPatternUtils.getRequestedPasswordMinimumLowerCase());
            mPasswordMinNumeric = Math.max(intent.getIntExtra("lockscreen.password_min_numeric", mPasswordMinNumeric), mLockPatternUtils.getRequestedPasswordMinimumNumeric());
            mPasswordMinSymbols = Math.max(intent.getIntExtra("lockscreen.password_min_symbols", mPasswordMinSymbols), mLockPatternUtils.getRequestedPasswordMinimumSymbols());
            mPasswordMinNonLetter = Math.max(intent.getIntExtra("lockscreen.password_min_nonletter", mPasswordMinNonLetter), mLockPatternUtils.getRequestedPasswordMinimumNonLetter());
            mChooseLockSettingsHelper = new ChooseLockSettingsHelper(getActivity());
        }

        public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
        {
            View view = layoutinflater.inflate(0x7f040016, null);
            mCancelButton = (Button)view.findViewById(0x7f080028);
            mCancelButton.setOnClickListener(this);
            mNextButton = (Button)view.findViewById(0x7f080029);
            mNextButton.setOnClickListener(this);
            boolean flag;
            if (0x40000 != mRequestedQuality && 0x50000 != mRequestedQuality && 0x60000 != mRequestedQuality)
                flag = false;
            else
                flag = true;
            mIsAlphaMode = flag;
            mKeyboardView = (PasswordEntryKeyboardView)view.findViewById(0x7f08002a);
            mPasswordEntry = (TextView)view.findViewById(0x7f080027);
            mPasswordEntry.setOnEditorActionListener(this);
            mPasswordEntry.addTextChangedListener(this);
            Activity activity = getActivity();
            mKeyboardHelper = new PasswordEntryKeyboardHelper(activity, mKeyboardView, mPasswordEntry);
            PasswordEntryKeyboardHelper passwordentrykeyboardhelper = mKeyboardHelper;
            int i;
            if (mIsAlphaMode)
                i = 0;
            else
                i = 1;
            passwordentrykeyboardhelper.setKeyboardMode(i);
            mHeaderText = (TextView)view.findViewById(0x7f080025);
            mKeyboardView.requestFocus();
            int j = mPasswordEntry.getInputType();
            TextView textview = mPasswordEntry;
            if (!mIsAlphaMode)
                j = 18;
            textview.setInputType(j);
            boolean flag1 = getActivity().getIntent().getBooleanExtra("confirm_credentials", true);
            if (bundle == null)
            {
                updateStage(Stage.Introduction);
                if (flag1)
                    mChooseLockSettingsHelper.launchConfirmationActivity(58, null, null);
            } else
            {
                mFirstPin = bundle.getString("first_pin");
                String s = bundle.getString("ui_stage");
                if (s != null)
                {
                    mUiStage = Stage.valueOf(s);
                    updateStage(mUiStage);
                }
            }
            if (activity instanceof PreferenceActivity)
            {
                PreferenceActivity preferenceactivity = (PreferenceActivity)activity;
                int k;
                if (mIsAlphaMode)
                    k = 0x7f0b05ff;
                else
                    k = 0x7f0b0601;
                CharSequence charsequence = getText(k);
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
            mHandler.removeMessages(1);
            super.onPause();
        }

        public void onResume()
        {
            super.onResume();
            updateStage(mUiStage);
            mKeyboardView.requestFocus();
        }

        public void onSaveInstanceState(Bundle bundle)
        {
            super.onSaveInstanceState(bundle);
            bundle.putString("ui_stage", mUiStage.name());
            bundle.putString("first_pin", mFirstPin);
        }

        public void onTextChanged(CharSequence charsequence, int i, int j, int k)
        {
        }

        protected void updateStage(Stage stage)
        {
            Stage stage1 = mUiStage;
            mUiStage = stage;
            updateUi();
            if (stage1 != stage)
                mHeaderText.announceForAccessibility(mHeaderText.getText());
        }

        public ChooseLockPasswordFragment()
        {
            mPasswordMinLength = 4;
            mPasswordMaxLength = 16;
            mPasswordMinLetters = 0;
            mPasswordMinUpperCase = 0;
            mPasswordMinLowerCase = 0;
            mPasswordMinSymbols = 0;
            mPasswordMinNumeric = 0;
            mPasswordMinNonLetter = 0;
            mRequestedQuality = 0x20000;
            mUiStage = Stage.Introduction;
            mHandler = new _cls1();
        }
    }

    protected static final class ChooseLockPasswordFragment.Stage extends Enum
    {

        private static final ChooseLockPasswordFragment.Stage $VALUES[];
        public static final ChooseLockPasswordFragment.Stage ConfirmWrong;
        public static final ChooseLockPasswordFragment.Stage Introduction;
        public static final ChooseLockPasswordFragment.Stage NeedToConfirm;
        public final int alphaHint;
        public final int buttonText;
        public final int numericHint;

        public static ChooseLockPasswordFragment.Stage valueOf(String s)
        {
            return (ChooseLockPasswordFragment.Stage)Enum.valueOf(com/android/settings/ChooseLockPassword$ChooseLockPasswordFragment$Stage, s);
        }

        public static ChooseLockPasswordFragment.Stage[] values()
        {
            return (ChooseLockPasswordFragment.Stage[])$VALUES.clone();
        }

        static 
        {
            Introduction = new ChooseLockPasswordFragment.Stage("Introduction", 0, 0x7f0b05ff, 0x7f0b0601, 0x7f0b03b6);
            NeedToConfirm = new ChooseLockPasswordFragment.Stage("NeedToConfirm", 1, 0x7f0b0602, 0x7f0b0604, 0x7f0b03c0);
            ConfirmWrong = new ChooseLockPasswordFragment.Stage("ConfirmWrong", 2, 0x7f0b0605, 0x7f0b0606, 0x7f0b03b6);
            ChooseLockPasswordFragment.Stage astage[] = new ChooseLockPasswordFragment.Stage[3];
            astage[0] = Introduction;
            astage[1] = NeedToConfirm;
            astage[2] = ConfirmWrong;
            $VALUES = astage;
        }

        private ChooseLockPasswordFragment.Stage(String s, int i, int j, int k, int l)
        {
            super(s, i);
            alphaHint = j;
            numericHint = k;
            buttonText = l;
        }
    }


    public static final String PASSWORD_MAX_KEY = "lockscreen.password_max";
    public static final String PASSWORD_MIN_KEY = "lockscreen.password_min";
    public static final String PASSWORD_MIN_LETTERS_KEY = "lockscreen.password_min_letters";
    public static final String PASSWORD_MIN_LOWERCASE_KEY = "lockscreen.password_min_lowercase";
    public static final String PASSWORD_MIN_NONLETTER_KEY = "lockscreen.password_min_nonletter";
    public static final String PASSWORD_MIN_NUMERIC_KEY = "lockscreen.password_min_numeric";
    public static final String PASSWORD_MIN_SYMBOLS_KEY = "lockscreen.password_min_symbols";
    public static final String PASSWORD_MIN_UPPERCASE_KEY = "lockscreen.password_min_uppercase";


    public Intent getIntent()
    {
        Intent intent = new Intent(super.getIntent());
        intent.putExtra(":android:show_fragment", com/android/settings/ChooseLockPassword$ChooseLockPasswordFragment.getName());
        intent.putExtra(":android:no_headers", true);
        return intent;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        CharSequence charsequence = getText(0x7f0b05ff);
        showBreadCrumbs(charsequence, charsequence);
    }

    // Unreferenced inner class com/android/settings/ChooseLockPassword$ChooseLockPasswordFragment$1

/* anonymous class */
    class ChooseLockPasswordFragment._cls1 extends Handler
    {

        final ChooseLockPasswordFragment this$0;

        public void handleMessage(Message message)
        {
            if (message.what == 1)
                updateStage((ChooseLockPasswordFragment.Stage)message.obj);
        }

            
            {
                this$0 = ChooseLockPasswordFragment.this;
                super();
            }
    }

}
