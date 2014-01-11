// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.Fragment;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.view.*;
import android.widget.TextView;
import com.android.internal.widget.*;
import com.google.android.collect.Lists;
import java.util.*;

// Referenced classes of package com.android.settings:
//            ChooseLockSettingsHelper

public class ChooseLockPattern extends PreferenceActivity
{
    public static class ChooseLockPatternFragment extends Fragment
        implements android.view.View.OnClickListener
    {

        public static final int CONFIRM_EXISTING_REQUEST = 55;
        private static final int ID_EMPTY_MESSAGE = -1;
        static final int INFORMATION_MSG_TIMEOUT_MS = 3000;
        private static final String KEY_PATTERN_CHOICE = "chosenPattern";
        private static final String KEY_UI_STAGE = "uiStage";
        private static final int WRONG_PATTERN_CLEAR_TIMEOUT_MS = 2000;
        private final List mAnimatePattern;
        private ChooseLockSettingsHelper mChooseLockSettingsHelper;
        protected com.android.internal.widget.LockPatternView.OnPatternListener mChooseNewLockPatternListener;
        protected List mChosenPattern;
        private Runnable mClearPatternRunnable;
        private TextView mFooterLeftButton;
        private TextView mFooterRightButton;
        protected TextView mFooterText;
        protected TextView mHeaderText;
        protected LockPatternView mLockPatternView;
        private Stage mUiStage;

        private void postClearPatternRunnable()
        {
            mLockPatternView.removeCallbacks(mClearPatternRunnable);
            mLockPatternView.postDelayed(mClearPatternRunnable, 2000L);
        }

        private void saveChosenPatternAndFinish()
        {
            LockPatternUtils lockpatternutils = mChooseLockSettingsHelper.utils();
            boolean flag;
            if (!lockpatternutils.isPatternEverChosen())
                flag = true;
            else
                flag = false;
            boolean flag1 = getActivity().getIntent().getBooleanExtra("lockscreen.weak_fallback", false);
            String s = getActivity().getIntent().getStringExtra("lockscreen.weak_fallback_for");
            String s1 = getActivity().getIntent().getStringExtra("settings_command_key");
            String s2 = getActivity().getIntent().getStringExtra("settings_command_value");
            lockpatternutils.saveLockPattern(mChosenPattern, flag1, s);
            if (s1 != null)
                android.provider.Settings.System.putString(getActivity().getContentResolver(), s1, s2);
            lockpatternutils.setLockPatternEnabled(true);
            if (flag)
                lockpatternutils.setVisiblePatternEnabled(true);
            getActivity().setResult(-1);
            getActivity().finish();
        }

        public void onActivityResult(int i, int j, Intent intent)
        {
            super.onActivityResult(i, j, intent);
            switch (i)
            {
            case 55: // '7'
                if (j != -1)
                {
                    getActivity().setResult(1);
                    getActivity().finish();
                }
                updateStage(Stage.Introduction);
                return;
            }
        }

        public void onClick(View view)
        {
            if (view == mFooterLeftButton)
            {
                if (mUiStage.leftMode == LeftButtonMode.Retry)
                {
                    mChosenPattern = null;
                    mLockPatternView.clearPattern();
                    updateStage(Stage.Introduction);
                } else
                if (mUiStage.leftMode == LeftButtonMode.Cancel)
                {
                    getActivity().setResult(1);
                    getActivity().finish();
                    return;
                } else
                {
                    throw new IllegalStateException((new StringBuilder()).append("left footer button pressed, but stage of ").append(mUiStage).append(" doesn't make sense").toString());
                }
            } else
            if (view == mFooterRightButton)
            {
                if (mUiStage.rightMode == RightButtonMode.Continue)
                    if (mUiStage != Stage.FirstChoiceValid)
                    {
                        throw new IllegalStateException((new StringBuilder()).append("expected ui stage ").append(Stage.FirstChoiceValid).append(" when button is ").append(RightButtonMode.Continue).toString());
                    } else
                    {
                        updateStage(Stage.NeedToConfirm);
                        return;
                    }
                if (mUiStage.rightMode == RightButtonMode.Confirm)
                    if (mUiStage != Stage.ChoiceConfirmed)
                    {
                        throw new IllegalStateException((new StringBuilder()).append("expected ui stage ").append(Stage.ChoiceConfirmed).append(" when button is ").append(RightButtonMode.Confirm).toString());
                    } else
                    {
                        saveChosenPatternAndFinish();
                        return;
                    }
                if (mUiStage.rightMode == RightButtonMode.Ok)
                    if (mUiStage != Stage.HelpScreen)
                    {
                        throw new IllegalStateException((new StringBuilder()).append("Help screen is only mode with ok button, but stage is ").append(mUiStage).toString());
                    } else
                    {
                        mLockPatternView.clearPattern();
                        mLockPatternView.setDisplayMode(com.android.internal.widget.LockPatternView.DisplayMode.Correct);
                        updateStage(Stage.Introduction);
                        return;
                    }
            }
        }

        public void onCreate(Bundle bundle)
        {
            super.onCreate(bundle);
            mChooseLockSettingsHelper = new ChooseLockSettingsHelper(getActivity());
        }

        public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
        {
            View view = layoutinflater.inflate(0x7f040017, null);
            mHeaderText = (TextView)view.findViewById(0x7f080025);
            mLockPatternView = (LockPatternView)view.findViewById(0x7f08002c);
            mLockPatternView.setOnPatternListener(mChooseNewLockPatternListener);
            mLockPatternView.setTactileFeedbackEnabled(mChooseLockSettingsHelper.utils().isTactileFeedbackEnabled());
            mFooterText = (TextView)view.findViewById(0x7f08002d);
            mFooterLeftButton = (TextView)view.findViewById(0x7f08002e);
            mFooterRightButton = (TextView)view.findViewById(0x7f08002f);
            mFooterLeftButton.setOnClickListener(this);
            mFooterRightButton.setOnClickListener(this);
            ((LinearLayoutWithDefaultTouchRecepient)view.findViewById(0x7f08002b)).setDefaultTouchRecepient(mLockPatternView);
            boolean flag = getActivity().getIntent().getBooleanExtra("confirm_credentials", false);
            if (bundle == null)
                if (flag)
                {
                    updateStage(Stage.NeedToConfirm);
                    if (!mChooseLockSettingsHelper.launchConfirmationActivity(55, null, null))
                        updateStage(Stage.Introduction);
                    return view;
                } else
                {
                    updateStage(Stage.Introduction);
                    return view;
                }
            String s = bundle.getString("chosenPattern");
            if (s != null)
                mChosenPattern = LockPatternUtils.stringToPattern(s);
            updateStage(Stage.values()[bundle.getInt("uiStage")]);
            return view;
        }

        public boolean onKeyDown(int i, KeyEvent keyevent)
        {
            if (i == 4 && keyevent.getRepeatCount() == 0 && mUiStage == Stage.HelpScreen)
            {
                updateStage(Stage.Introduction);
                return true;
            }
            if (i == 82 && mUiStage == Stage.Introduction)
            {
                updateStage(Stage.HelpScreen);
                return true;
            } else
            {
                return false;
            }
        }

        public void onSaveInstanceState(Bundle bundle)
        {
            super.onSaveInstanceState(bundle);
            bundle.putInt("uiStage", mUiStage.ordinal());
            if (mChosenPattern != null)
                bundle.putString("chosenPattern", LockPatternUtils.patternToString(mChosenPattern));
        }

        protected void updateStage(Stage stage)
        {
            Stage stage1 = mUiStage;
            mUiStage = stage;
            if (stage == Stage.ChoiceTooShort)
            {
                TextView textview = mHeaderText;
                Resources resources = getResources();
                int i = stage.headerMessage;
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(4);
                textview.setText(resources.getString(i, aobj));
            } else
            {
                mHeaderText.setText(stage.headerMessage);
            }
            if (stage.footerMessage == -1)
                mFooterText.setText("");
            else
                mFooterText.setText(stage.footerMessage);
            if (stage.leftMode == LeftButtonMode.Gone)
            {
                mFooterLeftButton.setVisibility(8);
            } else
            {
                mFooterLeftButton.setVisibility(0);
                mFooterLeftButton.setText(stage.leftMode.text);
                mFooterLeftButton.setEnabled(stage.leftMode.enabled);
            }
            mFooterRightButton.setText(stage.rightMode.text);
            mFooterRightButton.setEnabled(stage.rightMode.enabled);
            if (stage.patternEnabled)
                mLockPatternView.enableInput();
            else
                mLockPatternView.disableInput();
            mLockPatternView.setDisplayMode(com.android.internal.widget.LockPatternView.DisplayMode.Correct);
            static class _cls1
            {

                static final int $SwitchMap$com$android$settings$ChooseLockPattern$ChooseLockPatternFragment$Stage[];

                static 
                {
                    $SwitchMap$com$android$settings$ChooseLockPattern$ChooseLockPatternFragment$Stage = new int[ChooseLockPatternFragment.Stage.values().length];
                    try
                    {
                        $SwitchMap$com$android$settings$ChooseLockPattern$ChooseLockPatternFragment$Stage[ChooseLockPatternFragment.Stage.Introduction.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror) { }
                    try
                    {
                        $SwitchMap$com$android$settings$ChooseLockPattern$ChooseLockPatternFragment$Stage[ChooseLockPatternFragment.Stage.HelpScreen.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror1) { }
                    try
                    {
                        $SwitchMap$com$android$settings$ChooseLockPattern$ChooseLockPatternFragment$Stage[ChooseLockPatternFragment.Stage.ChoiceTooShort.ordinal()] = 3;
                    }
                    catch (NoSuchFieldError nosuchfielderror2) { }
                    try
                    {
                        $SwitchMap$com$android$settings$ChooseLockPattern$ChooseLockPatternFragment$Stage[ChooseLockPatternFragment.Stage.FirstChoiceValid.ordinal()] = 4;
                    }
                    catch (NoSuchFieldError nosuchfielderror3) { }
                    try
                    {
                        $SwitchMap$com$android$settings$ChooseLockPattern$ChooseLockPatternFragment$Stage[ChooseLockPatternFragment.Stage.NeedToConfirm.ordinal()] = 5;
                    }
                    catch (NoSuchFieldError nosuchfielderror4) { }
                    try
                    {
                        $SwitchMap$com$android$settings$ChooseLockPattern$ChooseLockPatternFragment$Stage[ChooseLockPatternFragment.Stage.ConfirmWrong.ordinal()] = 6;
                    }
                    catch (NoSuchFieldError nosuchfielderror5) { }
                    try
                    {
                        $SwitchMap$com$android$settings$ChooseLockPattern$ChooseLockPatternFragment$Stage[ChooseLockPatternFragment.Stage.ChoiceConfirmed.ordinal()] = 7;
                    }
                    catch (NoSuchFieldError nosuchfielderror6)
                    {
                        return;
                    }
                }
            }

            switch (_cls1..SwitchMap.com.android.settings.ChooseLockPattern.ChooseLockPatternFragment.Stage[mUiStage.ordinal()])
            {
            case 6: // '\006'
                mLockPatternView.setDisplayMode(com.android.internal.widget.LockPatternView.DisplayMode.Wrong);
                postClearPatternRunnable();
                break;

            case 5: // '\005'
                mLockPatternView.clearPattern();
                break;

            case 3: // '\003'
                mLockPatternView.setDisplayMode(com.android.internal.widget.LockPatternView.DisplayMode.Wrong);
                postClearPatternRunnable();
                break;

            case 2: // '\002'
                mLockPatternView.setPattern(com.android.internal.widget.LockPatternView.DisplayMode.Animate, mAnimatePattern);
                break;

            case 1: // '\001'
                mLockPatternView.clearPattern();
                break;
            }
            if (stage1 != stage)
                mHeaderText.announceForAccessibility(mHeaderText.getText());
        }





        public ChooseLockPatternFragment()
        {
            mChosenPattern = null;
            com.android.internal.widget.LockPatternView.Cell acell[] = new com.android.internal.widget.LockPatternView.Cell[4];
            acell[0] = com.android.internal.widget.LockPatternView.Cell.of(0, 0);
            acell[1] = com.android.internal.widget.LockPatternView.Cell.of(0, 1);
            acell[2] = com.android.internal.widget.LockPatternView.Cell.of(1, 1);
            acell[3] = com.android.internal.widget.LockPatternView.Cell.of(2, 1);
            mAnimatePattern = Collections.unmodifiableList(Lists.newArrayList(acell));
            mChooseNewLockPatternListener = new _cls1();
            mUiStage = Stage.Introduction;
            mClearPatternRunnable = new _cls2();
        }
    }

    static final class ChooseLockPatternFragment.LeftButtonMode extends Enum
    {

        private static final ChooseLockPatternFragment.LeftButtonMode $VALUES[];
        public static final ChooseLockPatternFragment.LeftButtonMode Cancel;
        public static final ChooseLockPatternFragment.LeftButtonMode CancelDisabled;
        public static final ChooseLockPatternFragment.LeftButtonMode Gone;
        public static final ChooseLockPatternFragment.LeftButtonMode Retry;
        public static final ChooseLockPatternFragment.LeftButtonMode RetryDisabled;
        final boolean enabled;
        final int text;

        public static ChooseLockPatternFragment.LeftButtonMode valueOf(String s)
        {
            return (ChooseLockPatternFragment.LeftButtonMode)Enum.valueOf(com/android/settings/ChooseLockPattern$ChooseLockPatternFragment$LeftButtonMode, s);
        }

        public static ChooseLockPatternFragment.LeftButtonMode[] values()
        {
            return (ChooseLockPatternFragment.LeftButtonMode[])$VALUES.clone();
        }

        static 
        {
            Cancel = new ChooseLockPatternFragment.LeftButtonMode("Cancel", 0, 0x7f0b034b, true);
            CancelDisabled = new ChooseLockPatternFragment.LeftButtonMode("CancelDisabled", 1, 0x7f0b034b, false);
            Retry = new ChooseLockPatternFragment.LeftButtonMode("Retry", 2, 0x7f0b061b, true);
            RetryDisabled = new ChooseLockPatternFragment.LeftButtonMode("RetryDisabled", 3, 0x7f0b061b, false);
            Gone = new ChooseLockPatternFragment.LeftButtonMode("Gone", 4, -1, false);
            ChooseLockPatternFragment.LeftButtonMode aleftbuttonmode[] = new ChooseLockPatternFragment.LeftButtonMode[5];
            aleftbuttonmode[0] = Cancel;
            aleftbuttonmode[1] = CancelDisabled;
            aleftbuttonmode[2] = Retry;
            aleftbuttonmode[3] = RetryDisabled;
            aleftbuttonmode[4] = Gone;
            $VALUES = aleftbuttonmode;
        }

        private ChooseLockPatternFragment.LeftButtonMode(String s, int i, int j, boolean flag)
        {
            super(s, i);
            text = j;
            enabled = flag;
        }
    }

    static final class ChooseLockPatternFragment.RightButtonMode extends Enum
    {

        private static final ChooseLockPatternFragment.RightButtonMode $VALUES[];
        public static final ChooseLockPatternFragment.RightButtonMode Confirm;
        public static final ChooseLockPatternFragment.RightButtonMode ConfirmDisabled;
        public static final ChooseLockPatternFragment.RightButtonMode Continue;
        public static final ChooseLockPatternFragment.RightButtonMode ContinueDisabled;
        public static final ChooseLockPatternFragment.RightButtonMode Ok;
        final boolean enabled;
        final int text;

        public static ChooseLockPatternFragment.RightButtonMode valueOf(String s)
        {
            return (ChooseLockPatternFragment.RightButtonMode)Enum.valueOf(com/android/settings/ChooseLockPattern$ChooseLockPatternFragment$RightButtonMode, s);
        }

        public static ChooseLockPatternFragment.RightButtonMode[] values()
        {
            return (ChooseLockPatternFragment.RightButtonMode[])$VALUES.clone();
        }

        static 
        {
            Continue = new ChooseLockPatternFragment.RightButtonMode("Continue", 0, 0x7f0b061c, true);
            ContinueDisabled = new ChooseLockPatternFragment.RightButtonMode("ContinueDisabled", 1, 0x7f0b061c, false);
            Confirm = new ChooseLockPatternFragment.RightButtonMode("Confirm", 2, 0x7f0b0619, true);
            ConfirmDisabled = new ChooseLockPatternFragment.RightButtonMode("ConfirmDisabled", 3, 0x7f0b0619, false);
            Ok = new ChooseLockPatternFragment.RightButtonMode("Ok", 4, 0x104000a, true);
            ChooseLockPatternFragment.RightButtonMode arightbuttonmode[] = new ChooseLockPatternFragment.RightButtonMode[5];
            arightbuttonmode[0] = Continue;
            arightbuttonmode[1] = ContinueDisabled;
            arightbuttonmode[2] = Confirm;
            arightbuttonmode[3] = ConfirmDisabled;
            arightbuttonmode[4] = Ok;
            $VALUES = arightbuttonmode;
        }

        private ChooseLockPatternFragment.RightButtonMode(String s, int i, int j, boolean flag)
        {
            super(s, i);
            text = j;
            enabled = flag;
        }
    }

    protected static final class ChooseLockPatternFragment.Stage extends Enum
    {

        private static final ChooseLockPatternFragment.Stage $VALUES[];
        public static final ChooseLockPatternFragment.Stage ChoiceConfirmed;
        public static final ChooseLockPatternFragment.Stage ChoiceTooShort;
        public static final ChooseLockPatternFragment.Stage ConfirmWrong;
        public static final ChooseLockPatternFragment.Stage FirstChoiceValid;
        public static final ChooseLockPatternFragment.Stage HelpScreen;
        public static final ChooseLockPatternFragment.Stage Introduction;
        public static final ChooseLockPatternFragment.Stage NeedToConfirm;
        final int footerMessage;
        final int headerMessage;
        final ChooseLockPatternFragment.LeftButtonMode leftMode;
        final boolean patternEnabled;
        final ChooseLockPatternFragment.RightButtonMode rightMode;

        public static ChooseLockPatternFragment.Stage valueOf(String s)
        {
            return (ChooseLockPatternFragment.Stage)Enum.valueOf(com/android/settings/ChooseLockPattern$ChooseLockPatternFragment$Stage, s);
        }

        public static ChooseLockPatternFragment.Stage[] values()
        {
            return (ChooseLockPatternFragment.Stage[])$VALUES.clone();
        }

        static 
        {
            Introduction = new ChooseLockPatternFragment.Stage("Introduction", 0, 0x7f0b0612, ChooseLockPatternFragment.LeftButtonMode.Cancel, ChooseLockPatternFragment.RightButtonMode.ContinueDisabled, -1, true);
            HelpScreen = new ChooseLockPatternFragment.Stage("HelpScreen", 1, 0x7f0b0625, ChooseLockPatternFragment.LeftButtonMode.Gone, ChooseLockPatternFragment.RightButtonMode.Ok, -1, false);
            ChoiceTooShort = new ChooseLockPatternFragment.Stage("ChoiceTooShort", 2, 0x7f0b0615, ChooseLockPatternFragment.LeftButtonMode.Retry, ChooseLockPatternFragment.RightButtonMode.ContinueDisabled, -1, true);
            FirstChoiceValid = new ChooseLockPatternFragment.Stage("FirstChoiceValid", 3, 0x7f0b0616, ChooseLockPatternFragment.LeftButtonMode.Retry, ChooseLockPatternFragment.RightButtonMode.Continue, -1, false);
            NeedToConfirm = new ChooseLockPatternFragment.Stage("NeedToConfirm", 4, 0x7f0b0617, ChooseLockPatternFragment.LeftButtonMode.Cancel, ChooseLockPatternFragment.RightButtonMode.ConfirmDisabled, -1, true);
            ConfirmWrong = new ChooseLockPatternFragment.Stage("ConfirmWrong", 5, 0x7f0b0610, ChooseLockPatternFragment.LeftButtonMode.Cancel, ChooseLockPatternFragment.RightButtonMode.ConfirmDisabled, -1, true);
            ChoiceConfirmed = new ChooseLockPatternFragment.Stage("ChoiceConfirmed", 6, 0x7f0b0618, ChooseLockPatternFragment.LeftButtonMode.Cancel, ChooseLockPatternFragment.RightButtonMode.Confirm, -1, false);
            ChooseLockPatternFragment.Stage astage[] = new ChooseLockPatternFragment.Stage[7];
            astage[0] = Introduction;
            astage[1] = HelpScreen;
            astage[2] = ChoiceTooShort;
            astage[3] = FirstChoiceValid;
            astage[4] = NeedToConfirm;
            astage[5] = ConfirmWrong;
            astage[6] = ChoiceConfirmed;
            $VALUES = astage;
        }

        private ChooseLockPatternFragment.Stage(String s, int i, int j, ChooseLockPatternFragment.LeftButtonMode leftbuttonmode, ChooseLockPatternFragment.RightButtonMode rightbuttonmode, int k, boolean flag)
        {
            super(s, i);
            headerMessage = j;
            leftMode = leftbuttonmode;
            rightMode = rightbuttonmode;
            footerMessage = k;
            patternEnabled = flag;
        }
    }


    static final int RESULT_FINISHED = 1;


    public Intent getIntent()
    {
        Intent intent = new Intent(super.getIntent());
        intent.putExtra(":android:show_fragment", com/android/settings/ChooseLockPattern$ChooseLockPatternFragment.getName());
        intent.putExtra(":android:no_headers", true);
        return intent;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        CharSequence charsequence = getText(0x7f0b0600);
        showBreadCrumbs(charsequence, charsequence);
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        return super.onKeyDown(i, keyevent);
    }

    // Unreferenced inner class com/android/settings/ChooseLockPattern$ChooseLockPatternFragment$1

/* anonymous class */
    class ChooseLockPatternFragment._cls1
        implements com.android.internal.widget.LockPatternView.OnPatternListener
    {

        final ChooseLockPatternFragment this$0;

        private void patternInProgress()
        {
            mHeaderText.setText(0x7f0b0614);
            mFooterText.setText("");
            mFooterLeftButton.setEnabled(false);
            mFooterRightButton.setEnabled(false);
        }

        public void onPatternCellAdded(List list)
        {
        }

        public void onPatternCleared()
        {
            mLockPatternView.removeCallbacks(mClearPatternRunnable);
        }

        public void onPatternDetected(List list)
        {
            if (mUiStage != ChooseLockPatternFragment.Stage.NeedToConfirm && mUiStage != ChooseLockPatternFragment.Stage.ConfirmWrong)
            {
                if (mUiStage != ChooseLockPatternFragment.Stage.Introduction && mUiStage != ChooseLockPatternFragment.Stage.ChoiceTooShort)
                    throw new IllegalStateException((new StringBuilder()).append("Unexpected stage ").append(mUiStage).append(" when ").append("entering the pattern.").toString());
                if (list.size() < 4)
                {
                    updateStage(ChooseLockPatternFragment.Stage.ChoiceTooShort);
                    return;
                } else
                {
                    mChosenPattern = new ArrayList(list);
                    updateStage(ChooseLockPatternFragment.Stage.FirstChoiceValid);
                    return;
                }
            }
            if (mChosenPattern == null)
                throw new IllegalStateException("null chosen pattern in stage 'need to confirm");
            if (mChosenPattern.equals(list))
            {
                updateStage(ChooseLockPatternFragment.Stage.ChoiceConfirmed);
                return;
            } else
            {
                updateStage(ChooseLockPatternFragment.Stage.ConfirmWrong);
                return;
            }
        }

        public void onPatternStart()
        {
            mLockPatternView.removeCallbacks(mClearPatternRunnable);
            patternInProgress();
        }

            
            {
                this$0 = ChooseLockPatternFragment.this;
                super();
            }
    }


    // Unreferenced inner class com/android/settings/ChooseLockPattern$ChooseLockPatternFragment$2

/* anonymous class */
    class ChooseLockPatternFragment._cls2
        implements Runnable
    {

        final ChooseLockPatternFragment this$0;

        public void run()
        {
            mLockPatternView.clearPattern();
        }

            
            {
                this$0 = ChooseLockPatternFragment.this;
                super();
            }
    }

}
