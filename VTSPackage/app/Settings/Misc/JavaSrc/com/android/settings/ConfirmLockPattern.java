// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.Fragment;
import android.content.Intent;
import android.os.*;
import android.preference.PreferenceActivity;
import android.view.*;
import android.widget.TextView;
import com.android.internal.widget.*;
import java.util.List;

public class ConfirmLockPattern extends PreferenceActivity
{
    public static class ConfirmLockPatternFragment extends Fragment
    {

        private static final String KEY_NUM_WRONG_ATTEMPTS = "num_wrong_attempts";
        private static final int WRONG_PATTERN_CLEAR_TIMEOUT_MS = 2000;
        private Runnable mClearPatternRunnable;
        private com.android.internal.widget.LockPatternView.OnPatternListener mConfirmExistingLockPatternListener;
        private CountDownTimer mCountdownTimer;
        private CharSequence mFooterText;
        private TextView mFooterTextView;
        private CharSequence mFooterWrongText;
        private CharSequence mHeaderText;
        private TextView mHeaderTextView;
        private CharSequence mHeaderWrongText;
        private LockPatternUtils mLockPatternUtils;
        private LockPatternView mLockPatternView;
        private int mNumWrongConfirmAttempts;

        private void handleAttemptLockout(long l)
        {
            updateStage(Stage.LockedOut);
            mCountdownTimer = (new CountDownTimer(l - SystemClock.elapsedRealtime(), 1000L) {

                final ConfirmLockPatternFragment this$0;

                public void onFinish()
                {
                    mNumWrongConfirmAttempts = 0;
                    updateStage(Stage.NeedToUnlock);
                }

                public void onTick(long l)
                {
                    mHeaderTextView.setText(0x7f0b0626);
                    int i = (int)(l / 1000L);
                    TextView textview = mFooterTextView;
                    ConfirmLockPatternFragment confirmlockpatternfragment = ConfirmLockPatternFragment.this;
                    Object aobj[] = new Object[1];
                    aobj[0] = Integer.valueOf(i);
                    textview.setText(confirmlockpatternfragment.getString(0x7f0b0627, aobj));
                }

            
            {
                this$0 = ConfirmLockPatternFragment.this;
                super(l, l1);
            }
            }
).start();
        }

        private void postClearPatternRunnable()
        {
            mLockPatternView.removeCallbacks(mClearPatternRunnable);
            mLockPatternView.postDelayed(mClearPatternRunnable, 2000L);
        }

        private void updateStage(Stage stage)
        {
            static class _cls1
            {

                static final int $SwitchMap$com$android$settings$ConfirmLockPattern$Stage[];

                static 
                {
                    $SwitchMap$com$android$settings$ConfirmLockPattern$Stage = new int[Stage.values().length];
                    try
                    {
                        $SwitchMap$com$android$settings$ConfirmLockPattern$Stage[Stage.NeedToUnlock.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror) { }
                    try
                    {
                        $SwitchMap$com$android$settings$ConfirmLockPattern$Stage[Stage.NeedToUnlockWrong.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror1) { }
                    try
                    {
                        $SwitchMap$com$android$settings$ConfirmLockPattern$Stage[Stage.LockedOut.ordinal()] = 3;
                    }
                    catch (NoSuchFieldError nosuchfielderror2)
                    {
                        return;
                    }
                }
            }

            switch (_cls1..SwitchMap.com.android.settings.ConfirmLockPattern.Stage[stage.ordinal()])
            {
            default:
                break;

            case 3: // '\003'
                mLockPatternView.clearPattern();
                mLockPatternView.setEnabled(false);
                break;

            case 2: // '\002'
                if (mHeaderWrongText != null)
                    mHeaderTextView.setText(mHeaderWrongText);
                else
                    mHeaderTextView.setText(0x7f0b0610);
                if (mFooterWrongText != null)
                    mFooterTextView.setText(mFooterWrongText);
                else
                    mFooterTextView.setText(0x7f0b0611);
                mLockPatternView.setDisplayMode(com.android.internal.widget.LockPatternView.DisplayMode.Wrong);
                mLockPatternView.setEnabled(true);
                mLockPatternView.enableInput();
                break;

            case 1: // '\001'
                if (mHeaderText != null)
                    mHeaderTextView.setText(mHeaderText);
                else
                    mHeaderTextView.setText(0x7f0b060e);
                if (mFooterText != null)
                    mFooterTextView.setText(mFooterText);
                else
                    mFooterTextView.setText(0x7f0b060f);
                mLockPatternView.setEnabled(true);
                mLockPatternView.enableInput();
                break;
            }
            mHeaderTextView.announceForAccessibility(mHeaderTextView.getText());
        }

        public void onCreate(Bundle bundle)
        {
            super.onCreate(bundle);
            mLockPatternUtils = new LockPatternUtils(getActivity());
        }

        public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
        {
            View view = layoutinflater.inflate(0x7f04001a, null);
            mHeaderTextView = (TextView)view.findViewById(0x7f080025);
            mLockPatternView = (LockPatternView)view.findViewById(0x7f08002c);
            mFooterTextView = (TextView)view.findViewById(0x7f08002d);
            ((LinearLayoutWithDefaultTouchRecepient)view.findViewById(0x7f08002b)).setDefaultTouchRecepient(mLockPatternView);
            Intent intent = getActivity().getIntent();
            if (intent != null)
            {
                mHeaderText = intent.getCharSequenceExtra("com.android.settings.ConfirmLockPattern.header");
                mFooterText = intent.getCharSequenceExtra("com.android.settings.ConfirmLockPattern.footer");
                mHeaderWrongText = intent.getCharSequenceExtra("com.android.settings.ConfirmLockPattern.header_wrong");
                mFooterWrongText = intent.getCharSequenceExtra("com.android.settings.ConfirmLockPattern.footer_wrong");
            }
            mLockPatternView.setTactileFeedbackEnabled(mLockPatternUtils.isTactileFeedbackEnabled());
            mLockPatternView.setOnPatternListener(mConfirmExistingLockPatternListener);
            updateStage(Stage.NeedToUnlock);
            if (bundle != null)
                mNumWrongConfirmAttempts = bundle.getInt("num_wrong_attempts");
            else
            if (!mLockPatternUtils.savedPatternExists())
            {
                getActivity().setResult(-1);
                getActivity().finish();
                return view;
            }
            return view;
        }

        public void onPause()
        {
            super.onPause();
            if (mCountdownTimer != null)
                mCountdownTimer.cancel();
        }

        public void onResume()
        {
            super.onResume();
            long l = mLockPatternUtils.getLockoutAttemptDeadline();
            if (l != 0L)
                handleAttemptLockout(l);
            else
            if (!mLockPatternView.isEnabled())
            {
                mNumWrongConfirmAttempts = 0;
                updateStage(Stage.NeedToUnlock);
                return;
            }
        }

        public void onSaveInstanceState(Bundle bundle)
        {
            bundle.putInt("num_wrong_attempts", mNumWrongConfirmAttempts);
        }





/*
        static int access$302(ConfirmLockPatternFragment confirmlockpatternfragment, int i)
        {
            confirmlockpatternfragment.mNumWrongConfirmAttempts = i;
            return i;
        }

*/


/*
        static int access$304(ConfirmLockPatternFragment confirmlockpatternfragment)
        {
            int i = 1 + confirmlockpatternfragment.mNumWrongConfirmAttempts;
            confirmlockpatternfragment.mNumWrongConfirmAttempts = i;
            return i;
        }

*/






        public ConfirmLockPatternFragment()
        {
            mClearPatternRunnable = new _cls1();
            mConfirmExistingLockPatternListener = new _cls2();
        }
    }

    private static final class Stage extends Enum
    {

        private static final Stage $VALUES[];
        public static final Stage LockedOut;
        public static final Stage NeedToUnlock;
        public static final Stage NeedToUnlockWrong;

        public static Stage valueOf(String s)
        {
            return (Stage)Enum.valueOf(com/android/settings/ConfirmLockPattern$Stage, s);
        }

        public static Stage[] values()
        {
            return (Stage[])$VALUES.clone();
        }

        static 
        {
            NeedToUnlock = new Stage("NeedToUnlock", 0);
            NeedToUnlockWrong = new Stage("NeedToUnlockWrong", 1);
            LockedOut = new Stage("LockedOut", 2);
            Stage astage[] = new Stage[3];
            astage[0] = NeedToUnlock;
            astage[1] = NeedToUnlockWrong;
            astage[2] = LockedOut;
            $VALUES = astage;
        }

        private Stage(String s, int i)
        {
            super(s, i);
        }
    }


    public static final String FOOTER_TEXT = "com.android.settings.ConfirmLockPattern.footer";
    public static final String FOOTER_WRONG_TEXT = "com.android.settings.ConfirmLockPattern.footer_wrong";
    public static final String HEADER_TEXT = "com.android.settings.ConfirmLockPattern.header";
    public static final String HEADER_WRONG_TEXT = "com.android.settings.ConfirmLockPattern.header_wrong";
    public static final String PACKAGE = "com.android.settings";


    public Intent getIntent()
    {
        Intent intent = new Intent(super.getIntent());
        intent.putExtra(":android:show_fragment", com/android/settings/ConfirmLockPattern$ConfirmLockPatternFragment.getName());
        intent.putExtra(":android:no_headers", true);
        return intent;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        CharSequence charsequence = getText(0x7f0b0603);
        showBreadCrumbs(charsequence, charsequence);
    }

    // Unreferenced inner class com/android/settings/ConfirmLockPattern$ConfirmLockPatternFragment$1

/* anonymous class */
    class ConfirmLockPatternFragment._cls1
        implements Runnable
    {

        final ConfirmLockPatternFragment this$0;

        public void run()
        {
            mLockPatternView.clearPattern();
        }

            
            {
                this$0 = ConfirmLockPatternFragment.this;
                super();
            }
    }


    // Unreferenced inner class com/android/settings/ConfirmLockPattern$ConfirmLockPatternFragment$2

/* anonymous class */
    class ConfirmLockPatternFragment._cls2
        implements com.android.internal.widget.LockPatternView.OnPatternListener
    {

        final ConfirmLockPatternFragment this$0;

        public void onPatternCellAdded(List list)
        {
        }

        public void onPatternCleared()
        {
            mLockPatternView.removeCallbacks(mClearPatternRunnable);
        }

        public void onPatternDetected(List list)
        {
            if (mLockPatternUtils.checkPattern(list))
            {
                Intent intent = new Intent();
                intent.putExtra("password", LockPatternUtils.patternToString(list));
                getActivity().setResult(-1, intent);
                getActivity().finish();
                return;
            }
            if (list.size() >= 4 && int i = 1 + 
// JavaClassFileOutputException: get_constant: invalid tag

        public void onPatternStart()
        {
            mLockPatternView.removeCallbacks(mClearPatternRunnable);
        }

            
            {
                this$0 = ConfirmLockPatternFragment.this;
                super();
            }
    }

}
