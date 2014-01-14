// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard_obsolete;

import android.content.Context;
import android.text.TextUtils;
import android.text.format.DateFormat;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import com.android.internal.widget.*;
import java.util.ArrayList;
import java.util.Date;
import libcore.util.MutableInt;

// Referenced classes of package com.android.internal.policy.impl.keyguard_obsolete:
//            KeyguardUpdateMonitor, KeyguardScreenCallback, KeyguardUpdateMonitorCallback

class KeyguardStatusViewManager
    implements android.view.View.OnClickListener
{
    static final class StatusMode extends Enum
    {

        private static final StatusMode $VALUES[];
        public static final StatusMode NetworkLocked;
        public static final StatusMode Normal;
        public static final StatusMode SimLocked;
        public static final StatusMode SimMissing;
        public static final StatusMode SimMissingLocked;
        public static final StatusMode SimPermDisabled;
        public static final StatusMode SimPukLocked;
        private final boolean mShowStatusLines;

        public static StatusMode valueOf(String s)
        {
            return (StatusMode)Enum.valueOf(com/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$StatusMode, s);
        }

        public static StatusMode[] values()
        {
            return (StatusMode[])$VALUES.clone();
        }

        public boolean shouldShowStatusLines()
        {
            return mShowStatusLines;
        }

        static 
        {
            Normal = new StatusMode("Normal", 0, true);
            NetworkLocked = new StatusMode("NetworkLocked", 1, true);
            SimMissing = new StatusMode("SimMissing", 2, false);
            SimMissingLocked = new StatusMode("SimMissingLocked", 3, false);
            SimPukLocked = new StatusMode("SimPukLocked", 4, false);
            SimLocked = new StatusMode("SimLocked", 5, true);
            SimPermDisabled = new StatusMode("SimPermDisabled", 6, false);
            StatusMode astatusmode[] = new StatusMode[7];
            astatusmode[0] = Normal;
            astatusmode[1] = NetworkLocked;
            astatusmode[2] = SimMissing;
            astatusmode[3] = SimMissingLocked;
            astatusmode[4] = SimPukLocked;
            astatusmode[5] = SimLocked;
            astatusmode[6] = SimPermDisabled;
            $VALUES = astatusmode;
        }

        private StatusMode(String s, int i, boolean flag)
        {
            Enum(s, i);
            mShowStatusLines = flag;
        }
    }

    private class TransientTextManager
    {

        private ArrayList mMessages;
        private TextView mTextView;
        final KeyguardStatusViewManager this$0;

        void post(CharSequence charsequence, int i, long l)
        {
            if (mTextView == null)
            {
                return;
            } else
            {
                mTextView.setText(charsequence);
                mTextView.setCompoundDrawablesWithIntrinsicBounds(i, 0, 0, 0);
                Data data = new Data(charsequence, i);
                mContainer.postDelayed(data. new Runnable() {

                    final TransientTextManager this$1;
                    final TransientTextManager.Data val$data;

                    public void run()
                    {
                        mMessages.remove(data);
                        int i = -1 + mMessages.size();
                        CharSequence charsequence;
                        int j;
                        if (i > 0)
                        {
                            TransientTextManager.Data data1 = (TransientTextManager.Data)mMessages.get(i);
                            charsequence = data1.text;
                            j = data1.icon;
                        } else
                        {
                            MutableInt mutableint = new MutableInt(0);
                            charsequence = getAltTextMessage(mutableint);
                            j = mutableint.value;
                        }
                        mTextView.setText(charsequence);
                        mTextView.setCompoundDrawablesWithIntrinsicBounds(j, 0, 0, 0);
                    }

            
            {
                this$1 = final_transienttextmanager;
                data = TransientTextManager.Data.this;
                Object();
            }
                }
, l);
                return;
            }
        }



        TransientTextManager(TextView textview)
        {
            this$0 = KeyguardStatusViewManager.this;
            Object();
            mMessages = new ArrayList(5);
            mTextView = textview;
        }
    }

    private class TransientTextManager.Data
    {

        final int icon;
        final CharSequence text;
        final TransientTextManager this$1;

        TransientTextManager.Data(CharSequence charsequence, int i)
        {
            this$1 = TransientTextManager.this;
            Object();
            text = charsequence;
            icon = i;
        }
    }


    public static final int ALARM_ICON = 0x108002e;
    private static final int BATTERY_INFO = 15;
    public static final int BATTERY_LOW_ICON = 0;
    private static final int CARRIER_HELP_TEXT = 12;
    private static final int CARRIER_TEXT = 11;
    public static final int CHARGING_ICON = 0;
    private static final boolean DEBUG = false;
    private static final int HELP_MESSAGE_TEXT = 13;
    private static final long INSTRUCTION_RESET_DELAY = 2000L;
    private static final int INSTRUCTION_TEXT = 10;
    public static final int LOCK_ICON = 0;
    private static final int OWNER_INFO = 14;
    private static final String TAG = "KeyguardStatusView";
    private TextView mAlarmStatusView;
    protected boolean mBatteryCharged;
    protected boolean mBatteryIsLow;
    private int mBatteryLevel;
    private KeyguardScreenCallback mCallback;
    private CharSequence mCarrierHelpText;
    private CharSequence mCarrierText;
    private TextView mCarrierView;
    private View mContainer;
    private String mDateFormatString;
    private TextView mDateView;
    private DigitalClock mDigitalClock;
    private boolean mEmergencyButtonEnabledBecauseSimLocked;
    private Button mEmergencyCallButton;
    private final boolean mEmergencyCallButtonEnabledInScreen;
    private String mHelpMessageText;
    private KeyguardUpdateMonitorCallback mInfoCallback;
    private String mInstructionText;
    private LockPatternUtils mLockPatternUtils;
    private CharSequence mOwnerInfoText;
    private TextView mOwnerInfoView;
    protected int mPhoneState;
    private CharSequence mPlmn;
    private boolean mPluggedIn;
    private boolean mShowingBatteryInfo;
    private boolean mShowingStatus;
    protected com.android.internal.telephony.IccCardConstants.State mSimState;
    private CharSequence mSpn;
    private StatusMode mStatus;
    private TextView mStatus1View;
    private TransientTextManager mTransientTextManager;
    private TransportControlView mTransportView;
    private KeyguardUpdateMonitor mUpdateMonitor;

    public KeyguardStatusViewManager(View view, KeyguardUpdateMonitor keyguardupdatemonitor, LockPatternUtils lockpatternutils, KeyguardScreenCallback keyguardscreencallback, boolean flag)
    {
        mShowingBatteryInfo = false;
        mPluggedIn = false;
        mBatteryLevel = 100;
        mInfoCallback = new KeyguardUpdateMonitorCallback() {

            final KeyguardStatusViewManager this$0;

            public void onPhoneStateChanged(int k)
            {
                mPhoneState = k;
                updateEmergencyCallButtonState(k);
            }

            public void onRefreshBatteryInfo(KeyguardUpdateMonitor.BatteryStatus batterystatus)
            {
                KeyguardStatusViewManager keyguardstatusviewmanager = KeyguardStatusViewManager.this;
                boolean flag1;
                if (!batterystatus.isPluggedIn() && !batterystatus.isBatteryLow())
                    flag1 = false;
                else
                    flag1 = true;
                keyguardstatusviewmanager.mShowingBatteryInfo = flag1;
                mPluggedIn = batterystatus.isPluggedIn();
                mBatteryLevel = batterystatus.level;
                mBatteryCharged = batterystatus.isCharged();
                mBatteryIsLow = batterystatus.isBatteryLow();
                MutableInt mutableint = new MutableInt(0);
                update(15, getAltTextMessage(mutableint));
            }

            public void onRefreshCarrierInfo(CharSequence charsequence, CharSequence charsequence1)
            {
                mPlmn = charsequence;
                mSpn = charsequence1;
                updateCarrierStateWithSimStatus(mSimState);
            }

            public void onSimStateChanged(com.android.internal.telephony.IccCardConstants.State state)
            {
                updateCarrierStateWithSimStatus(state);
            }

            public void onTimeChanged()
            {
                refreshDate();
            }

            
            {
                this$0 = KeyguardStatusViewManager.this;
                KeyguardUpdateMonitorCallback();
            }
        }
;
        mContainer = view;
        mDateFormatString = getContext().getString(0x1040063);
        mLockPatternUtils = lockpatternutils;
        mUpdateMonitor = keyguardupdatemonitor;
        mCallback = keyguardscreencallback;
        mCarrierView = (TextView)findViewById(0x10202e9);
        mDateView = (TextView)findViewById(0x1020063);
        mStatus1View = (TextView)findViewById(0x10202e8);
        mAlarmStatusView = (TextView)findViewById(0x10202e7);
        mOwnerInfoView = (TextView)findViewById(0x10202f9);
        mTransportView = (TransportControlView)findViewById(0x10202eb);
        mEmergencyCallButton = (Button)findViewById(0x10202d3);
        mEmergencyCallButtonEnabledInScreen = flag;
        mDigitalClock = (DigitalClock)findViewById(0x1020064);
        if (mTransportView != null)
            mTransportView.setVisibility(8);
        if (mEmergencyCallButton != null)
        {
            mEmergencyCallButton.setText(0x10402eb);
            mEmergencyCallButton.setOnClickListener(this);
            mEmergencyCallButton.setFocusable(false);
        }
        mTransientTextManager = new TransientTextManager(mCarrierView);
        mUpdateMonitor.registerCallback(mInfoCallback);
        resetStatusInfo();
        refreshDate();
        updateOwnerInfo();
        View aview[] = new View[5];
        aview[0] = mCarrierView;
        aview[1] = mDateView;
        aview[2] = mStatus1View;
        aview[3] = mOwnerInfoView;
        aview[4] = mAlarmStatusView;
        int i = aview.length;
        for (int j = 0; j < i; j++)
        {
            View view1 = aview[j];
            if (view1 != null)
                view1.setSelected(true);
        }

    }

    private View findViewById(int i)
    {
        return mContainer.findViewById(i);
    }

    private CharSequence getAltTextMessage(MutableInt mutableint)
    {
        if (mShowingBatteryInfo)
        {
            String s;
            if (mPluggedIn)
            {
                Context context = getContext();
                int i;
                if (mBatteryCharged)
                    i = 0x10402f2;
                else
                    i = 0x10402f1;
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(mBatteryLevel);
                s = context.getString(i, aobj);
                mutableint.value = 0;
            } else
            {
                boolean flag = mBatteryIsLow;
                s = null;
                if (flag)
                {
                    String s1 = getContext().getString(0x10402f4);
                    mutableint.value = 0;
                    return s1;
                }
            }
            return s;
        } else
        {
            return mCarrierText;
        }
    }

    private Context getContext()
    {
        return mContainer.getContext();
    }

    private CharSequence getPriorityTextMessage(MutableInt mutableint)
    {
        String s;
        if (!TextUtils.isEmpty(mInstructionText))
        {
            s = mInstructionText;
            mutableint.value = 0;
        } else
        if (mShowingBatteryInfo)
        {
            if (mPluggedIn)
            {
                Context context = getContext();
                int i;
                if (mBatteryCharged)
                    i = 0x10402f2;
                else
                    i = 0x10402f1;
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(mBatteryLevel);
                String s2 = context.getString(i, aobj);
                mutableint.value = 0;
                return s2;
            }
            boolean flag1 = mBatteryIsLow;
            s = null;
            if (flag1)
            {
                String s1 = getContext().getString(0x10402f4);
                mutableint.value = 0;
                return s1;
            }
        } else
        {
            boolean flag = inWidgetMode();
            s = null;
            if (!flag)
            {
                TextView textview = mOwnerInfoView;
                s = null;
                if (textview == null)
                {
                    CharSequence charsequence = mOwnerInfoText;
                    s = null;
                    if (charsequence != null)
                        return mOwnerInfoText;
                }
            }
        }
        return s;
    }

    private CharSequence getText(int i)
    {
        if (i == 0)
            return null;
        else
            return getContext().getText(i);
    }

    private boolean inWidgetMode()
    {
        return mTransportView != null && mTransportView.getVisibility() == 0;
    }

    private static CharSequence makeCarierString(CharSequence charsequence, CharSequence charsequence1)
    {
        boolean flag;
        if (!TextUtils.isEmpty(charsequence))
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (!TextUtils.isEmpty(charsequence1))
            flag1 = true;
        else
            flag1 = false;
        if (flag && flag1)
            charsequence = (new StringBuilder()).append(charsequence).append("|").append(charsequence1).toString();
        else
        if (!flag)
            if (flag1)
                return charsequence1;
            else
                return "";
        return charsequence;
    }

    private CharSequence makeCarrierStringOnEmergencyCapable(CharSequence charsequence, CharSequence charsequence1)
    {
        if (mLockPatternUtils.isEmergencyCallCapable())
            charsequence = makeCarierString(charsequence, charsequence1);
        return charsequence;
    }

    private void update(int i, CharSequence charsequence)
    {
        if (inWidgetMode())
        {
            switch (i)
            {
            case 10: // '\n'
            case 12: // '\f'
            case 13: // '\r'
            case 15: // '\017'
                mTransientTextManager.post(charsequence, 0, 2000L);
                return;

            case 11: // '\013'
            case 14: // '\016'
            default:
                return;
            }
        } else
        {
            updateStatusLines(mShowingStatus);
            return;
        }
    }

    private void updateAlarmInfo()
    {
        if (mAlarmStatusView != null)
        {
            String s = mLockPatternUtils.getNextAlarm();
            boolean flag;
            if (mShowingStatus && !TextUtils.isEmpty(s))
                flag = true;
            else
                flag = false;
            mAlarmStatusView.setText(s);
            mAlarmStatusView.setCompoundDrawablesWithIntrinsicBounds(0x108002e, 0, 0, 0);
            TextView textview = mAlarmStatusView;
            byte byte0 = 0;
            if (!flag)
                byte0 = 8;
            textview.setVisibility(byte0);
        }
    }

    private void updateCarrierStateWithSimStatus(com.android.internal.telephony.IccCardConstants.State state)
    {
        mEmergencyButtonEnabledBecauseSimLocked = false;
        mStatus = getStatusForIccState(state);
        mSimState = state;
        static class _cls2
        {

            static final int $SwitchMap$com$android$internal$policy$impl$keyguard_obsolete$KeyguardStatusViewManager$StatusMode[];
            static final int $SwitchMap$com$android$internal$telephony$IccCardConstants$State[];

            static 
            {
                $SwitchMap$com$android$internal$policy$impl$keyguard_obsolete$KeyguardStatusViewManager$StatusMode = new int[StatusMode.values().length];
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard_obsolete$KeyguardStatusViewManager$StatusMode[StatusMode.Normal.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard_obsolete$KeyguardStatusViewManager$StatusMode[StatusMode.NetworkLocked.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror1) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard_obsolete$KeyguardStatusViewManager$StatusMode[StatusMode.SimMissing.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror2) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard_obsolete$KeyguardStatusViewManager$StatusMode[StatusMode.SimPermDisabled.ordinal()] = 4;
                }
                catch (NoSuchFieldError nosuchfielderror3) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard_obsolete$KeyguardStatusViewManager$StatusMode[StatusMode.SimMissingLocked.ordinal()] = 5;
                }
                catch (NoSuchFieldError nosuchfielderror4) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard_obsolete$KeyguardStatusViewManager$StatusMode[StatusMode.SimLocked.ordinal()] = 6;
                }
                catch (NoSuchFieldError nosuchfielderror5) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard_obsolete$KeyguardStatusViewManager$StatusMode[StatusMode.SimPukLocked.ordinal()] = 7;
                }
                catch (NoSuchFieldError nosuchfielderror6) { }
                $SwitchMap$com$android$internal$telephony$IccCardConstants$State = new int[com.android.internal.telephony.IccCardConstants.State.values().length];
                try
                {
                    $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.ABSENT.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror7) { }
                try
                {
                    $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror8) { }
                try
                {
                    $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.NOT_READY.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror9) { }
                try
                {
                    $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED.ordinal()] = 4;
                }
                catch (NoSuchFieldError nosuchfielderror10) { }
                try
                {
                    $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED.ordinal()] = 5;
                }
                catch (NoSuchFieldError nosuchfielderror11) { }
                try
                {
                    $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.READY.ordinal()] = 6;
                }
                catch (NoSuchFieldError nosuchfielderror12) { }
                try
                {
                    $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.PERM_DISABLED.ordinal()] = 7;
                }
                catch (NoSuchFieldError nosuchfielderror13) { }
                try
                {
                    $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.UNKNOWN.ordinal()] = 8;
                }
                catch (NoSuchFieldError nosuchfielderror14)
                {
                    return;
                }
            }
        }

        int i = _cls2..SwitchMap.com.android.internal.policy.impl.keyguard_obsolete.KeyguardStatusViewManager.StatusMode[mStatus.ordinal()];
        int j = 0;
        CharSequence charsequence = null;
        switch (i)
        {
        default:
            break;

        case 7: // '\007'
            charsequence = makeCarrierStringOnEmergencyCapable(getContext().getText(0x1040302), mPlmn);
            boolean flag = mLockPatternUtils.isPukUnlockScreenEnable();
            j = 0;
            if (!flag)
            {
                mEmergencyButtonEnabledBecauseSimLocked = true;
                j = 0;
            }
            break;

        case 6: // '\006'
            charsequence = makeCarrierStringOnEmergencyCapable(getContext().getText(0x1040304), mPlmn);
            mEmergencyButtonEnabledBecauseSimLocked = true;
            j = 0;
            break;

        case 5: // '\005'
            charsequence = makeCarrierStringOnEmergencyCapable(getContext().getText(0x10402f5), mPlmn);
            j = 0x10402f7;
            mEmergencyButtonEnabledBecauseSimLocked = true;
            break;

        case 4: // '\004'
            charsequence = getContext().getText(0x10402f9);
            j = 0x10402fa;
            mEmergencyButtonEnabledBecauseSimLocked = true;
            break;

        case 3: // '\003'
            charsequence = makeCarrierStringOnEmergencyCapable(getContext().getText(0x10402f5), mPlmn);
            j = 0x10402f8;
            break;

        case 2: // '\002'
            charsequence = makeCarrierStringOnEmergencyCapable(getContext().getText(0x1040301), mPlmn);
            j = 0x10402e9;
            break;

        case 1: // '\001'
            charsequence = makeCarierString(mPlmn, mSpn);
            j = 0;
            break;
        }
        setCarrierText(charsequence);
        setCarrierHelpText(j);
        updateEmergencyCallButtonState(mPhoneState);
    }

    private void updateCarrierText()
    {
        if (!inWidgetMode() && mCarrierView != null)
            mCarrierView.setText(mCarrierText);
    }

    private void updateEmergencyCallButtonState(int i)
    {
        if (mEmergencyCallButton != null)
        {
            boolean flag;
            if (mLockPatternUtils.isEmergencyCallEnabledWhileSimLocked() && mEmergencyButtonEnabledBecauseSimLocked)
                flag = true;
            else
                flag = false;
            boolean flag1;
            if (!mEmergencyCallButtonEnabledInScreen && !flag)
                flag1 = false;
            else
                flag1 = true;
            mLockPatternUtils.updateEmergencyCallButtonState(mEmergencyCallButton, i, flag1);
        }
    }

    private void updateOwnerInfo()
    {
        int i = 1;
        android.content.ContentResolver contentresolver = getContext().getContentResolver();
        if (android.provider.Settings.Secure.getInt(contentresolver, "lock_screen_owner_info_enabled", i) == 0)
            i = 0;
        String s;
        if (i != 0)
            s = android.provider.Settings.Secure.getString(contentresolver, "lock_screen_owner_info");
        else
            s = null;
        mOwnerInfoText = s;
        if (mOwnerInfoView != null)
        {
            mOwnerInfoView.setText(mOwnerInfoText);
            TextView textview = mOwnerInfoView;
            byte byte0;
            if (TextUtils.isEmpty(mOwnerInfoText))
                byte0 = 8;
            else
                byte0 = 0;
            textview.setVisibility(byte0);
        }
    }

    private void updateStatus1()
    {
        if (mStatus1View != null)
        {
            MutableInt mutableint = new MutableInt(0);
            CharSequence charsequence = getPriorityTextMessage(mutableint);
            mStatus1View.setText(charsequence);
            mStatus1View.setCompoundDrawablesWithIntrinsicBounds(mutableint.value, 0, 0, 0);
            TextView textview = mStatus1View;
            boolean flag = mShowingStatus;
            byte byte0 = 0;
            if (!flag)
                byte0 = 4;
            textview.setVisibility(byte0);
        }
    }

    public StatusMode getStatusForIccState(com.android.internal.telephony.IccCardConstants.State state)
    {
        if (state == null)
            return StatusMode.Normal;
        boolean flag;
        if (mUpdateMonitor.isDeviceProvisioned() || state != com.android.internal.telephony.IccCardConstants.State.ABSENT && state != com.android.internal.telephony.IccCardConstants.State.PERM_DISABLED)
            flag = false;
        else
            flag = true;
        if (flag)
            state = com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED;
        switch (_cls2..SwitchMap.com.android.internal.telephony.IccCardConstants.State[state.ordinal()])
        {
        case 8: // '\b'
            return StatusMode.SimMissing;

        case 7: // '\007'
            return StatusMode.SimPermDisabled;

        case 6: // '\006'
            return StatusMode.Normal;

        case 5: // '\005'
            return StatusMode.SimPukLocked;

        case 4: // '\004'
            return StatusMode.SimLocked;

        case 3: // '\003'
            return StatusMode.SimMissing;

        case 2: // '\002'
            return StatusMode.SimMissingLocked;

        case 1: // '\001'
            return StatusMode.SimMissing;
        }
        return StatusMode.SimMissing;
    }

    public void onClick(View view)
    {
        if (view == mEmergencyCallButton)
            mCallback.takeEmergencyCallAction();
    }

    public void onPause()
    {
        mUpdateMonitor.removeCallback(mInfoCallback);
    }

    public void onResume()
    {
        if (mDigitalClock != null)
            mDigitalClock.updateTime();
        mUpdateMonitor.registerCallback(mInfoCallback);
        resetStatusInfo();
        if (mUpdateMonitor.getMaxBiometricUnlockAttemptsReached())
            setInstructionText(getContext().getString(0x10402f0));
    }

    void refreshDate()
    {
        if (mDateView != null)
            mDateView.setText(DateFormat.format(mDateFormatString, new Date()));
    }

    void resetStatusInfo()
    {
        mInstructionText = null;
        updateStatusLines(true);
    }

    public void setCarrierHelpText(int i)
    {
        mCarrierHelpText = getText(i);
        update(12, mCarrierHelpText);
    }

    void setCarrierText(CharSequence charsequence)
    {
        mCarrierText = charsequence;
        update(11, charsequence);
    }

    public void setHelpMessage(int i, int j)
    {
        CharSequence charsequence = getText(i);
        String s;
        if (charsequence == null)
            s = null;
        else
            s = charsequence.toString();
        mHelpMessageText = s;
        update(13, mHelpMessageText);
    }

    void setInstructionText(String s)
    {
        mInstructionText = s;
        update(10, s);
    }

    void setOwnerInfo(CharSequence charsequence)
    {
        mOwnerInfoText = charsequence;
        update(14, charsequence);
    }

    void updateStatusLines(boolean flag)
    {
        mShowingStatus = flag;
        updateAlarmInfo();
        updateOwnerInfo();
        updateStatus1();
        updateCarrierText();
    }






/*
    static boolean access$402(KeyguardStatusViewManager keyguardstatusviewmanager, boolean flag)
    {
        keyguardstatusviewmanager.mShowingBatteryInfo = flag;
        return flag;
    }

*/


/*
    static boolean access$502(KeyguardStatusViewManager keyguardstatusviewmanager, boolean flag)
    {
        keyguardstatusviewmanager.mPluggedIn = flag;
        return flag;
    }

*/


/*
    static int access$602(KeyguardStatusViewManager keyguardstatusviewmanager, int i)
    {
        keyguardstatusviewmanager.mBatteryLevel = i;
        return i;
    }

*/



/*
    static CharSequence access$802(KeyguardStatusViewManager keyguardstatusviewmanager, CharSequence charsequence)
    {
        keyguardstatusviewmanager.mPlmn = charsequence;
        return charsequence;
    }

*/


/*
    static CharSequence access$902(KeyguardStatusViewManager keyguardstatusviewmanager, CharSequence charsequence)
    {
        keyguardstatusviewmanager.mSpn = charsequence;
        return charsequence;
    }

*/
}
