// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic.gemini;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.net.sip.SipManager;
import android.os.*;
import android.preference.*;
import android.telephony.TelephonyManager;
import android.view.View;
import android.view.Window;
import android.widget.ListView;
import com.android.internal.telephony.ITelephony;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.mediatek.CellConnService.CellConnMgr;
import com.mediatek.oobe.ext.ISimManagementExt;
import com.mediatek.oobe.utils.SettingsPreferenceFragment;
import com.mediatek.oobe.utils.Utils;
import com.mediatek.telephony.TelephonyManagerEx;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.mediatek.oobe.basic.gemini:
//            SimInfoEnablePreference, DefaultSimPreference, GeminiUtils, SimItem, 
//            SimInfoEditor

public class SimManagement extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceChangeListener, SimInfoEnablePreference.OnPreferenceClickCallback
{

    private static final int ALL_RADIO_OFF = 0;
    private static final int ATTACH_TIME_OUT_LENGTH = 30000;
    private static final int DATA_SWITCH_MSG_CASE0 = 0;
    private static final int DATA_SWITCH_MSG_CASE1 = 1;
    private static final int DATA_SWITCH_MSG_CASE2 = 2;
    private static final int DATA_SWITCH_MSG_CASE3 = 3;
    private static final int DATA_SWITCH_MSG_CASE4 = 4;
    private static final int DETACH_TIME_OUT_LENGTH = 10000;
    private static final int DIALOG_3G_MODEM_SWITCHING = 1006;
    private static final int DIALOG_3G_MODEM_SWITCH_CONFIRM = 1007;
    private static final int DIALOG_ACTIVATE = 1000;
    private static final int DIALOG_DATA_SWITCH = 1102;
    private static final int DIALOG_DEACTIVATE = 1001;
    private static final int DIALOG_GPRS_SWITCH_CONFIRM = 1008;
    private static final int DIALOG_MODEN_SWITCH = 1103;
    private static final int DIALOG_NETWORK_MODE = 1104;
    private static final int DIALOG_NETWORK_MODE_CHANGE = 1005;
    private static final int DIALOG_NONE = -1;
    private static final int DIALOG_RADIO_OFF = 1101;
    private static final int DIALOG_RADIO_ON = 1100;
    private static final int DIALOG_WAITING = 1004;
    private static final int EVENT_ATTACH_TIME_OUT = 2001;
    private static final int EVENT_DETACH_TIME_OUT = 2000;
    private static final int EVENT_DUAL_SIM_MODE_CHANGED_COMPLETE = 1;
    private static final int GPRS_SIM_INDEX = 3;
    private static final String KEY_DEFAULT_SIM_SETTINGS_CATEGORY = "default_sim";
    private static final String KEY_GENERAL_SETTINGS_CATEGORY = "general_settings";
    private static final String KEY_GPRS_SIM_SETTING = "gprs_sim_setting";
    private static final String KEY_SIM_CONTACTS_SETTINGS = "contacts_sim";
    private static final String KEY_SIM_INFO_CATEGORY = "sim_info";
    private static final String KEY_SMS_SIM_SETTING = "sms_sim_setting";
    private static final String KEY_VIDEO_CALL_SIM_SETTING = "video_call_sim_setting";
    private static final String KEY_VOICE_CALL_SIM_SETTING = "voice_call_sim_setting";
    private static final String MMS_TRANSACTION = "mms.transaction";
    private static final int PIN1_REQUEST_CODE = 302;
    private static final int SIM_GENIMI_MODE_DUAL = 3;
    private static final int SIM_GENIMI_MODE_SIM1 = 1;
    private static final int SIM_GENIMI_MODE_SIM2 = 2;
    private static final int SMS_SIM_INDEX = 2;
    private static final String TAG = "SimManagementSettings";
    private static final String TRANSACTION_START = "com.android.mms.transaction.START";
    private static final String TRANSACTION_STOP = "com.android.mms.transaction.STOP";
    private static final int TYPE_SIM_COLOR = 1;
    private static final int TYPE_SIM_NAME = 0;
    private static final int TYPE_SIM_NUMBER = 2;
    private static final int TYPE_SIM_NUMBER_FORMAT = 3;
    private static final int VEDIO_CALL_OFF = -1;
    private static final int VIDEO_CALL_SIM_INDEX = 1;
    private static final int VOICE_CALL_SIM_INDEX;
    private static boolean mIsVoiceCapable = false;
    private static boolean sAllSimRadioOff = false;
    private static int sCurrentStep;
    private static ContentObserver sGprsDefaultSIMObserver;
    private static boolean sGprsTargSim = false;
    private static boolean sHasSim = false;
    private static int sProgressbarMaxSize;
    private static boolean sScreenEnable = true;
    private static boolean sVTCallSupport = true;
    private static boolean sVoipAvailable = true;
    private CellConnMgr mCellConnMgr;
    private int mDataSwitchMsgIndex;
    private int mDataSwitchMsgStr[] = {
        0x7f09001a, 0x7f09001b, 0x7f09001c, 0x7f09001d, 0x7f09001e
    };
    private int mDualSimMode;
    private Handler mDualSimModeChangedHander;
    private ISimManagementExt mExt;
    private DefaultSimPreference mGprsSimSetting;
    private ITelephony mITelephony;
    private IntentFilter mIntentFilter;
    private boolean mIs3gOff;
    private boolean mIsGprsSwitching;
    private boolean mIsSIMModeSwitching;
    private int mIsShowDlg;
    private boolean mIsSlot1Insert;
    private boolean mIsSlot2Insert;
    private boolean mIsSmsCapable;
    private Messenger mMessenger;
    private Runnable mServiceComplete;
    private Map mSimIdToIndexMap;
    private List mSimItemListGprs;
    private List mSimItemListSms;
    private List mSimItemListVideo;
    private List mSimItemListVoice;
    private Map mSimMap;
    private BroadcastReceiver mSimReceiver;
    private SimInfoEnablePreference mSlot1SimPref;
    private SimInfoEnablePreference mSlot2SimPref;
    private DefaultSimPreference mSmsSimSetting;
    private StatusBarManager mStatusBarManager;
    private TelephonyManager mTelephonyManager;
    private TelephonyManagerEx mTelephonyManagerEx;
    private Handler mTimeHandler;
    private long mVTTargetTemp;
    private DefaultSimPreference mVideoCallSimSetting;
    private DefaultSimPreference mVoiceCallSimSetting;

    public SimManagement()
    {
        mIsSmsCapable = false;
        mIs3gOff = false;
        mDualSimMode = 0;
        mIsSlot1Insert = false;
        mIsSlot2Insert = false;
        mSimItemListVoice = new ArrayList();
        mSimItemListVideo = new ArrayList();
        mSimItemListSms = new ArrayList();
        mSimItemListGprs = new ArrayList();
        mIsSIMModeSwitching = false;
        mIsGprsSwitching = false;
        mIsShowDlg = -1;
        mDataSwitchMsgIndex = -1;
        mServiceComplete = new Runnable() {

            final SimManagement this$0;

            public void run()
            {
            }

            
            {
                this$0 = SimManagement.this;
                super();
            }
        }
;
        mDualSimModeChangedHander = new Handler() {

            final SimManagement this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 1: // '\001'
                    if (getActivity() == null)
                    {
                        Xlog.i("SimManagementSettings", "getActivity is null!");
                        return;
                    } else
                    {
                        Xlog.i("SimManagementSettings", "dual sim mode changed!");
                        dealWithSwtichComplete();
                        return;
                    }
                }
            }

            
            {
                this$0 = SimManagement.this;
                super();
            }
        }
;
        mMessenger = new Messenger(mDualSimModeChangedHander);
        mSimReceiver = new BroadcastReceiver() {

            final SimManagement this$0;

            public void onReceive(Context context, Intent intent)
            {
                String s = intent.getAction();
                Xlog.d("SimManagementSettings", (new StringBuilder()).append("receiver:").append(s).toString());
                if (s.equals("android.intent.action.SIM_SETTING_INFO_CHANGED"))
                {
                    long l1 = intent.getLongExtra("simid", -1L);
                    int j1 = intent.getIntExtra("type", -1);
                    Xlog.i("SimManagementSettings", "receiver: Intent.SIM_SETTINGS_INFO_CHANGED");
                    Xlog.i("SimManagementSettings", (new StringBuilder()).append("type is ").append(j1).append(" simid is ").append(l1).toString());
                    updateSimInfo(l1, j1);
                    updateDefaultSimInfo(l1);
                } else
                if (s.equals("android.intent.action.SIM_INDICATOR_STATE_CHANGED"))
                {
                    int k = intent.getIntExtra("slotId", -1);
                    int i1 = intent.getIntExtra("state", -1);
                    Xlog.i("SimManagementSettings", (new StringBuilder()).append("slotid is ").append(k).append("status is ").append(i1).toString());
                    if (k >= 0 && i1 >= 0)
                    {
                        updateSimState(k, i1);
                        updateDefaultSimState(k, i1);
                        return;
                    }
                } else
                {
                    if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
                    {
                        disableSimPrefs();
                        return;
                    }
                    if (s.equals("android.intent.action.SIM_NAME_UPDATE"))
                    {
                        int j = intent.getIntExtra("simId", -1);
                        if (j >= 0)
                        {
                            android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(context, j);
                            if (siminfo != null)
                            {
                                long l = siminfo.mSimId;
                                Xlog.i("SimManagementSettings", (new StringBuilder()).append("slotid is ").append(j).toString());
                                updateSimInfo(l, 0);
                                updateDefaultSimInfo(l);
                                return;
                            }
                        }
                    } else
                    if (s.equals("com.android.mms.transaction.START"))
                    {
                        Xlog.i("SimManagementSettings", "receiver: TRANSACTION_START");
                        SimManagement.sScreenEnable = false;
                        DefaultSimPreference defaultsimpreference2 = mGprsSimSetting;
                        boolean flag4;
                        if (!SimManagement.sAllSimRadioOff && SimManagement.sScreenEnable && SimManagement.sHasSim)
                            flag4 = true;
                        else
                            flag4 = false;
                        defaultsimpreference2.setEnabled(flag4);
                        Dialog dialog1 = mGprsSimSetting.getDialog();
                        if (dialog1 != null && dialog1.isShowing())
                        {
                            dialog1.dismiss();
                            return;
                        }
                    } else
                    if (s.equals("com.android.mms.transaction.STOP"))
                    {
                        Xlog.i("SimManagementSettings", "receiver: TRANSACTION_STOP");
                        SimManagement.sScreenEnable = true;
                        DefaultSimPreference defaultsimpreference1 = mGprsSimSetting;
                        boolean flag3;
                        if (!SimManagement.sAllSimRadioOff && SimManagement.sScreenEnable && SimManagement.sHasSim)
                            flag3 = true;
                        else
                            flag3 = false;
                        defaultsimpreference1.setEnabled(flag3);
                        Dialog dialog = mGprsSimSetting.getDialog();
                        if (dialog != null && dialog.isShowing())
                        {
                            dialog.dismiss();
                            return;
                        }
                    } else
                    {
                        if (s.equals("android.intent.action.AIRPLANE_MODE"))
                        {
                            boolean flag2;
                            if (!intent.getBooleanExtra("state", false) && android.provider.Settings.System.getInt(context.getContentResolver(), "dual_sim_mode_setting", -1) != 0)
                                flag2 = false;
                            else
                                flag2 = true;
                            SimManagement.sAllSimRadioOff = flag2;
                            Xlog.i("SimManagementSettings", (new StringBuilder()).append("airplane mode changed to ").append(SimManagement.sAllSimRadioOff).toString());
                            initDefaultSimPreference();
                            return;
                        }
                        if (s.equals(GeminiPhone.EVENT_3G_SWITCH_DONE))
                        {
                            Xlog.i("SimManagementSettings", "receiver: GeminiPhone.EVENT_3G_SWITCH_DONE");
                            if (mIsShowDlg == 1103)
                            {
                                mIsShowDlg = -1;
                                if (isResumed())
                                    removeDialog(1006);
                            }
                            if (mStatusBarManager != null)
                                mStatusBarManager.disable(0);
                            updateVideoCallDefaultSIM();
                            return;
                        }
                        if (s.equals(GeminiPhone.EVENT_3G_SWITCH_LOCK_CHANGED))
                        {
                            Xlog.i("SimManagementSettings", "receiver: GeminiPhone.EVENT_3G_SWITCH_LOCK_CHANGED");
                            boolean flag = intent.getBooleanExtra(GeminiPhone.EXTRA_3G_SWITCH_LOCKED, false);
                            DefaultSimPreference defaultsimpreference = mVideoCallSimSetting;
                            boolean flag1;
                            if (!mIs3gOff && !flag && SimManagement.sHasSim)
                                flag1 = true;
                            else
                                flag1 = false;
                            defaultsimpreference.setEnabled(flag1);
                            return;
                        }
                        if (s.equals("android.intent.action.ANY_DATA_STATE"))
                        {
                            String s1 = intent.getStringExtra("reason");
                            String s2 = intent.getStringExtra("apnType");
                            com.android.internal.telephony.PhoneConstants.DataState datastate = SimManagement.getMobileDataState(intent);
                            int i = intent.getIntExtra("simId", -1);
                            Xlog.i("SimManagementSettings", (new StringBuilder()).append("mDataConnectionReceiver simId is : ").append(i).toString());
                            Xlog.i("SimManagementSettings", (new StringBuilder()).append("mDataConnectionReceiver state is : ").append(datastate).toString());
                            Xlog.i("SimManagementSettings", (new StringBuilder()).append("mDataConnectionReceiver reason is : ").append(s1).toString());
                            Xlog.i("SimManagementSettings", (new StringBuilder()).append("mDataConnectionReceiver apn type is : ").append(s2).toString());
                            if (s1 != null && "default".equals(s2))
                            {
                                if (s1.equals("dataAttached") && datastate == com.android.internal.telephony.PhoneConstants.DataState.CONNECTED && mIsGprsSwitching)
                                {
                                    mTimeHandler.removeMessages(2001);
                                    if (mIsShowDlg == 1102)
                                    {
                                        mIsShowDlg = -1;
                                        if (isResumed())
                                            removeDialog(1004);
                                    }
                                    updateGprsSettings();
                                    mIsGprsSwitching = false;
                                    return;
                                }
                                if (s1.equals("dataDetached") && datastate == com.android.internal.telephony.PhoneConstants.DataState.DISCONNECTED && mIsGprsSwitching && !SimManagement.sGprsTargSim)
                                {
                                    mTimeHandler.removeMessages(2000);
                                    if (mIsShowDlg == 1102)
                                    {
                                        mIsShowDlg = -1;
                                        if (isResumed())
                                            removeDialog(1004);
                                    }
                                    updateGprsSettings();
                                    mIsGprsSwitching = false;
                                    return;
                                }
                            }
                        }
                    }
                }
            }

            
            {
                this$0 = SimManagement.this;
                super();
            }
        }
;
        mTimeHandler = new Handler() {

            final SimManagement this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 2001: 
                    Xlog.i("SimManagementSettings", "attach time out......");
                    if (mIsShowDlg == 1102)
                    {
                        mIsShowDlg = -1;
                        if (isResumed())
                            removeDialog(1004);
                    }
                    updateGprsSettings();
                    mIsGprsSwitching = false;
                    return;

                case 2000: 
                    Xlog.i("SimManagementSettings", "detach time out......");
                    if (mIsShowDlg == 1102)
                    {
                        mIsShowDlg = -1;
                        if (isResumed())
                            removeDialog(1004);
                    }
                    updateGprsSettings();
                    mIsGprsSwitching = false;
                    return;
                }
            }

            
            {
                this$0 = SimManagement.this;
                super();
            }
        }
;
    }

    private void addNoSimIndicator()
    {
        PreferenceGroup preferencegroup = (PreferenceGroup)findPreference("sim_info");
        Preference preference = new Preference(getActivity());
        if (preference != null)
        {
            preference.setTitle(0x7f090012);
            preferencegroup.addPreference(preference);
        }
    }

    private void addSimInfoPreference()
    {
        PreferenceGroup preferencegroup = (PreferenceGroup)findPreference("sim_info");
        if (preferencegroup != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        Iterator iterator;
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(getActivity());
        Collections.sort(list, new GeminiUtils.SIMInfoComparable());
        preferencegroup.removeAll();
        iterator = list.iterator();
_L5:
        if (!iterator.hasNext()) goto _L1; else goto _L3
_L3:
        android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
        if (siminfo == null) goto _L1; else goto _L4
_L4:
        int i;
        i = -1;
        if (mITelephony == null)
            break MISSING_BLOCK_LABEL_100;
        int j = mITelephony.getSimIndicatorStateGemini(siminfo.mSlot);
        i = j;
_L6:
        SimInfoEnablePreference siminfoenablepreference = new SimInfoEnablePreference(getActivity(), siminfo.mDisplayName, siminfo.mNumber, siminfo.mSlot, i, siminfo.mColor, siminfo.mDispalyNumberFormat, siminfo.mSimId);
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("simid status is  ").append(i).toString());
        if (siminfoenablepreference != null)
        {
            siminfoenablepreference.setClickCallback(this);
            RemoteException remoteexception1;
            if (mITelephony != null)
                try
                {
                    boolean flag = mITelephony.isRadioOnGemini(siminfo.mSlot);
                    siminfoenablepreference.setCheck(flag);
                    siminfoenablepreference.setRadioOn(flag);
                }
                catch (RemoteException remoteexception)
                {
                    Xlog.e("SimManagementSettings", "mITelephony exception");
                }
            if (siminfo.mSlot == 0)
            {
                mIsSlot1Insert = true;
                mSlot1SimPref = siminfoenablepreference;
                siminfoenablepreference.setCheckBoxClickListener(new android.view.View.OnClickListener() {

                    final SimManagement this$0;

                    public void onClick(View view)
                    {
                        boolean flag1 = true;
                        Xlog.i("SimManagementSettings", "receive sim1 click intent!");
                        boolean flag2 = mSlot1SimPref.getCheck();
                        if (mIsSIMModeSwitching)
                        {
                            Xlog.i("SimManagementSettings", "mIsSIMModeSwitching == true");
                            mSlot1SimPref.setCheck(flag2);
                            return;
                        }
                        mIsSIMModeSwitching = flag1;
                        Xlog.i("SimManagementSettings", "set mIsSIMModeSwitching true");
                        SimInfoEnablePreference siminfoenablepreference1 = mSlot1SimPref;
                        if (flag2)
                            flag1 = false;
                        siminfoenablepreference1.setCheck(flag1);
                        dealSim1Change();
                    }

            
            {
                this$0 = SimManagement.this;
                super();
            }
                }
);
            } else
            if (siminfo.mSlot == 1)
            {
                mIsSlot2Insert = true;
                mSlot2SimPref = siminfoenablepreference;
                siminfoenablepreference.setCheckBoxClickListener(new android.view.View.OnClickListener() {

                    final SimManagement this$0;

                    public void onClick(View view)
                    {
                        boolean flag1 = true;
                        Xlog.i("SimManagementSettings", "receive sim2 click intent!");
                        boolean flag2 = mSlot2SimPref.getCheck();
                        if (mIsSIMModeSwitching)
                        {
                            Xlog.i("SimManagementSettings", "mIsSIMModeSwitching == true");
                            mSlot2SimPref.setCheck(flag2);
                            return;
                        }
                        mIsSIMModeSwitching = flag1;
                        Xlog.i("SimManagementSettings", "set mIsSIMModeSwitching true");
                        SimInfoEnablePreference siminfoenablepreference1 = mSlot2SimPref;
                        if (flag2)
                            flag1 = false;
                        siminfoenablepreference1.setCheck(flag1);
                        dealSim2Change();
                    }

            
            {
                this$0 = SimManagement.this;
                super();
            }
                }
);
            }
            preferencegroup.addPreference(siminfoenablepreference);
        }
          goto _L5
        remoteexception1;
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("RemoteException  ").append(remoteexception1.getMessage()).toString());
          goto _L6
    }

    private int current3GSlotId()
    {
label0:
        {
            int i = -1;
            int j;
            try
            {
                if (mITelephony == null)
                    break label0;
                j = mITelephony.get3GCapabilitySIM();
            }
            catch (RemoteException remoteexception)
            {
                Xlog.e("SimManagementSettings", "mTelephony exception");
                return i;
            }
            i = j;
        }
        return i;
    }

    private void dealSim1Change()
    {
label0:
        {
label1:
            {
label2:
                {
                    mDualSimMode = android.provider.Settings.System.getInt(getContentResolver(), "dual_sim_mode_setting", -1);
                    Xlog.i("SimManagementSettings", (new StringBuilder()).append("dealSim1Change mDualSimMode value is : ").append(mDualSimMode).toString());
                    Xlog.i("SimManagementSettings", (new StringBuilder()).append("mIsSlot1Insert = ").append(mIsSlot1Insert).append("; mIsSlot2Insert =").append(mIsSlot2Insert).toString());
                    if (1 == android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", -1))
                    {
                        Xlog.i("SimManagementSettings", "airplane mode is on");
                        if (mIsSlot1Insert && mIsSlot2Insert)
                        {
                            android.provider.Settings.System.putInt(getContentResolver(), "airplane_mode_on", 0);
                            android.provider.Settings.System.putInt(getContentResolver(), "dual_sim_mode_setting", 1);
                            Intent intent6 = new Intent("android.intent.action.AIRPLANE_MODE");
                            intent6.putExtra("state", false);
                            getActivity().sendBroadcast(intent6);
                            showProgressDlg(true);
                        } else
                        if (mIsSlot1Insert && !mIsSlot2Insert)
                        {
                            android.provider.Settings.System.putInt(getContentResolver(), "airplane_mode_on", 0);
                            android.provider.Settings.System.putInt(getContentResolver(), "dual_sim_mode_setting", 1);
                            Intent intent5 = new Intent("android.intent.action.AIRPLANE_MODE");
                            intent5.putExtra("state", false);
                            getActivity().sendBroadcast(intent5);
                            showProgressDlg(true);
                            return;
                        }
                    } else
                    {
                        switch (mDualSimMode)
                        {
                        default:
                            break label0;

                        case 0: // '\0'
                            break label1;

                        case 1: // '\001'
                            break label2;

                        case 3: // '\003'
                            if (mIsSlot1Insert && mIsSlot2Insert)
                            {
                                android.provider.Settings.System.putInt(getContentResolver(), "dual_sim_mode_setting", 2);
                                Intent intent4 = new Intent("android.intent.action.DUAL_SIM_MODE");
                                intent4.putExtra("mode", 2);
                                getActivity().sendBroadcast(intent4);
                                showProgressDlg(false);
                                return;
                            }
                            break;

                        case 2: // '\002'
                            if (mIsSlot1Insert && mIsSlot2Insert)
                            {
                                android.provider.Settings.System.putInt(getContentResolver(), "dual_sim_mode_setting", 3);
                                Intent intent3 = new Intent("android.intent.action.DUAL_SIM_MODE");
                                intent3.putExtra("mode", 3);
                                getActivity().sendBroadcast(intent3);
                                showProgressDlg(true);
                                return;
                            }
                            if (mIsSlot1Insert && mIsSlot2Insert)
                            {
                                android.provider.Settings.System.putInt(getContentResolver(), "dual_sim_mode_setting", 1);
                                Intent intent2 = new Intent("android.intent.action.DUAL_SIM_MODE");
                                intent2.putExtra("mode", 1);
                                getActivity().sendBroadcast(intent2);
                                showProgressDlg(true);
                                return;
                            }
                            break;
                        }
                    }
                    return;
                }
                android.provider.Settings.System.putInt(getContentResolver(), "dual_sim_mode_setting", 0);
                Intent intent1 = new Intent("android.intent.action.DUAL_SIM_MODE");
                intent1.putExtra("mode", 0);
                getActivity().sendBroadcast(intent1);
                showProgressDlg(false);
                return;
            }
            android.provider.Settings.System.putInt(getContentResolver(), "dual_sim_mode_setting", 1);
            Intent intent = new Intent("android.intent.action.DUAL_SIM_MODE");
            intent.putExtra("mode", 1);
            getActivity().sendBroadcast(intent);
            showProgressDlg(true);
            return;
        }
        Xlog.i("SimManagementSettings", "dual sim mode error.");
    }

    private void dealSim2Change()
    {
label0:
        {
label1:
            {
                mDualSimMode = android.provider.Settings.System.getInt(getContentResolver(), "dual_sim_mode_setting", -1);
                Xlog.i("SimManagementSettings", (new StringBuilder()).append("dealSim2Change mDualSimMode value is : ").append(mDualSimMode).toString());
                if (1 == android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", -1))
                {
                    if (mIsSlot1Insert && mIsSlot2Insert)
                    {
                        android.provider.Settings.System.putInt(getContentResolver(), "airplane_mode_on", 0);
                        android.provider.Settings.System.putInt(getContentResolver(), "dual_sim_mode_setting", 2);
                        Intent intent6 = new Intent("android.intent.action.AIRPLANE_MODE");
                        intent6.putExtra("state", false);
                        getActivity().sendBroadcast(intent6);
                        showProgressDlg(true);
                    } else
                    if (!mIsSlot1Insert && mIsSlot2Insert)
                    {
                        android.provider.Settings.System.putInt(getContentResolver(), "airplane_mode_on", 0);
                        android.provider.Settings.System.putInt(getContentResolver(), "dual_sim_mode_setting", 2);
                        Intent intent5 = new Intent("android.intent.action.AIRPLANE_MODE");
                        intent5.putExtra("state", false);
                        getActivity().sendBroadcast(intent5);
                        showProgressDlg(true);
                        return;
                    }
                } else
                {
                    switch (mDualSimMode)
                    {
                    default:
                        break label0;

                    case 0: // '\0'
                        break label1;

                    case 3: // '\003'
                        if (mIsSlot1Insert && mIsSlot2Insert)
                        {
                            android.provider.Settings.System.putInt(getContentResolver(), "dual_sim_mode_setting", 1);
                            Intent intent4 = new Intent("android.intent.action.DUAL_SIM_MODE");
                            intent4.putExtra("mode", 1);
                            getActivity().sendBroadcast(intent4);
                            showProgressDlg(false);
                            return;
                        }
                        break;

                    case 2: // '\002'
                        android.provider.Settings.System.putInt(getContentResolver(), "dual_sim_mode_setting", 0);
                        Intent intent3 = new Intent("android.intent.action.DUAL_SIM_MODE");
                        intent3.putExtra("mode", 0);
                        getActivity().sendBroadcast(intent3);
                        showProgressDlg(false);
                        return;

                    case 1: // '\001'
                        if (mIsSlot1Insert && mIsSlot2Insert)
                        {
                            android.provider.Settings.System.putInt(getContentResolver(), "dual_sim_mode_setting", 3);
                            Intent intent2 = new Intent("android.intent.action.DUAL_SIM_MODE");
                            intent2.putExtra("mode", 3);
                            getActivity().sendBroadcast(intent2);
                            showProgressDlg(true);
                            return;
                        }
                        if (!mIsSlot1Insert && mIsSlot2Insert)
                        {
                            android.provider.Settings.System.putInt(getContentResolver(), "dual_sim_mode_setting", 2);
                            Intent intent1 = new Intent("android.intent.action.DUAL_SIM_MODE");
                            intent1.putExtra("mode", 2);
                            getActivity().sendBroadcast(intent1);
                            showProgressDlg(true);
                            return;
                        }
                        break;
                    }
                }
                return;
            }
            android.provider.Settings.System.putInt(getContentResolver(), "dual_sim_mode_setting", 2);
            Intent intent = new Intent("android.intent.action.DUAL_SIM_MODE");
            intent.putExtra("mode", 2);
            getActivity().sendBroadcast(intent);
            showProgressDlg(true);
            return;
        }
        Xlog.i("SimManagementSettings", "dual sim mode error.");
    }

    private void dealWithSwtichComplete()
    {
        boolean flag = true;
        Iterator iterator = mSimMap.keySet().iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            Long long1 = (Long)iterator.next();
            android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)mSimMap.get(long1);
            SimInfoEnablePreference siminfoenablepreference = (SimInfoEnablePreference)findPreference(String.valueOf(siminfo.mSimId));
            if (siminfoenablepreference != null && mITelephony != null)
                try
                {
                    boolean flag2 = mITelephony.isRadioOnGemini(siminfo.mSlot);
                    boolean flag3 = siminfoenablepreference.isRadioOn();
                    siminfoenablepreference.setRadioOn(flag2);
                    siminfoenablepreference.setCheck(flag2);
                    Xlog.i("SimManagementSettings", (new StringBuilder()).append("mIsSIMModeSwitching is ").append(mIsSIMModeSwitching).append(" newState is ").append(flag2).append(" oldState is ").append(flag3).toString());
                }
                catch (RemoteException remoteexception)
                {
                    Xlog.e("SimManagementSettings", "mITelephony exception");
                    return;
                }
        } while (true);
        Xlog.i("SimManagementSettings", "next will remove the progress dlg");
        boolean flag1;
        if (mIsShowDlg == 1100 || mIsShowDlg == 1101)
        {
            if (isResumed())
            {
                DefaultSimPreference defaultsimpreference;
                char c;
                if (mIsShowDlg == 1100)
                    c = '\u03E8';
                else
                    c = '\u03E9';
                removeDialog(c);
            }
            mIsShowDlg = -1;
        }
        if (!mIsSIMModeSwitching)
            Xlog.i("SimManagementSettings", "mIsSIMModeSwitching value error......");
        mIsSIMModeSwitching = false;
        Xlog.e("SimManagementSettings", (new StringBuilder()).append("mIsSIMModeSwitching is ").append(mIsSIMModeSwitching).toString());
        if (android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", -1) == flag || android.provider.Settings.System.getInt(getContentResolver(), "dual_sim_mode_setting", -1) == 0)
            flag1 = flag;
        else
            flag1 = false;
        sAllSimRadioOff = flag1;
        defaultsimpreference = mGprsSimSetting;
        if (sAllSimRadioOff || !sScreenEnable || !sHasSim)
            flag = false;
        defaultsimpreference.setEnabled(flag);
    }

    private void dealwithAttach()
    {
        mIsGprsSwitching = true;
        mTimeHandler.sendEmptyMessageDelayed(2001, 30000L);
        showDialog(1004);
        mIsShowDlg = 1102;
        setCancelable(false);
    }

    private void dealwithDetach()
    {
        mIsGprsSwitching = true;
        mTimeHandler.sendEmptyMessageDelayed(2000, 10000L);
        showDialog(1004);
        mIsShowDlg = 1102;
        setCancelable(false);
    }

    private void enableDataRoaming(long l)
    {
        try
        {
            if (mITelephony != null)
                mITelephony.setDataRoamingEnabledGemini(true, android.provider.Telephony.SIMInfo.getSlotById(getActivity(), l));
        }
        catch (RemoteException remoteexception)
        {
            Xlog.e("SimManagementSettings", "mITelephony exception");
            return;
        }
        android.provider.Telephony.SIMInfo.setDataRoaming(getActivity(), 1, l);
    }

    private long getDataValue(String s)
    {
        return android.provider.Settings.System.getLong(getContentResolver(), s, -5L);
    }

    private static com.android.internal.telephony.PhoneConstants.DataState getMobileDataState(Intent intent)
    {
        String s = intent.getStringExtra("state");
        if (s != null)
            return (com.android.internal.telephony.PhoneConstants.DataState)Enum.valueOf(com/android/internal/telephony/PhoneConstants$DataState, s);
        else
            return com.android.internal.telephony.PhoneConstants.DataState.DISCONNECTED;
    }

    public static void initProgressBar(int i, int j)
    {
        sProgressbarMaxSize = i;
        sCurrentStep = j;
    }

    private void initSimMap()
    {
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(getActivity());
        Collections.sort(list, new GeminiUtils.SIMInfoComparable());
        mSimMap.clear();
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("sim number is ").append(list.size()).toString());
        android.provider.Telephony.SIMInfo siminfo;
        for (Iterator iterator = list.iterator(); iterator.hasNext(); mSimMap.put(Long.valueOf(siminfo.mSimId), siminfo))
            siminfo = (android.provider.Telephony.SIMInfo)iterator.next();

    }

    private boolean isRadioOff()
    {
        boolean flag = true;
        if (android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", -1) != flag && android.provider.Settings.System.getInt(getContentResolver(), "dual_sim_mode_setting", -1) != 0)
            flag = false;
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("isAllRadioOff=").append(flag).toString());
        return flag;
    }

    private boolean isVoipAvailable()
    {
        int i = android.provider.Settings.System.getInt(getContentResolver(), "enable_internet_call_value", 0);
        boolean flag = SipManager.isVoipSupported(getActivity());
        boolean flag1 = false;
        if (flag)
        {
            flag1 = false;
            if (i != 0)
                flag1 = true;
        }
        return flag1;
    }

    private void setIconForDefaultSimPref()
    {
        mVoiceCallSimSetting.setIcon(0x7f02000e);
        mVideoCallSimSetting.setIcon(0x7f02000d);
        mSmsSimSetting.setIcon(0x7f02000c);
        mGprsSimSetting.setIcon(0x7f02000b);
    }

    private void showProgressDlg(boolean flag)
    {
        if (flag)
            if (!getActivity().isFinishing())
            {
                Xlog.i("SimManagementSettings", "DIALOG_ACTIVATE");
                showDialog(1000);
                mIsShowDlg = 1100;
                setCancelable(false);
                return;
            } else
            {
                Xlog.i("SimManagementSettings", "Activity isFinishing, state error......");
                return;
            }
        if (!getActivity().isFinishing())
        {
            Xlog.i("SimManagementSettings", "DIALOG_DEACTIVATE");
            showDialog(1001);
            mIsShowDlg = 1101;
            setCancelable(false);
            return;
        } else
        {
            Xlog.i("SimManagementSettings", "Activity isFinishing, state error......");
            return;
        }
    }

    private void switchGprsDefautlSIM(long l)
    {
        if (l >= 0L && l != android.provider.Settings.System.getLong(getContentResolver(), "gprs_connection_sim_setting", -5L))
        {
            Intent intent = new Intent("android.intent.action.DATA_DEFAULT_SIM");
            intent.putExtra("simid", l);
            boolean flag;
            if (l > 0L)
                flag = true;
            else
                flag = false;
            sGprsTargSim = flag;
            if (sGprsTargSim)
                dealwithAttach();
            else
                dealwithDetach();
            getActivity().sendBroadcast(intent);
            return;
        } else
        {
            return;
        }
    }

    private void switchVideoCallDefaultSIM(long l)
    {
        android.provider.Telephony.SIMInfo siminfo;
label0:
        {
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("switchVideoCallDefaultSIM to ").append(l).toString());
            if (mITelephony != null)
            {
                siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(getActivity(), l);
                Xlog.i("SimManagementSettings", (new StringBuilder()).append("siminfo = ").append(siminfo).toString());
                if (siminfo != null)
                    break label0;
            }
            return;
        }
        try
        {
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("sim slot  = ").append(siminfo.mSlot).toString());
            if (mITelephony.set3GCapabilitySIM(siminfo.mSlot))
            {
                Xlog.i("SimManagementSettings", "result is true");
                if (mStatusBarManager != null)
                    mStatusBarManager.disable(0x10000);
                showDialog(1006);
                mIsShowDlg = 1103;
                setCancelable(false);
                return;
            }
        }
        catch (RemoteException remoteexception)
        {
            Xlog.e("SimManagementSettings", "mITelephony exception");
            return;
        }
        updateVideoCallDefaultSIM();
        return;
    }

    private void updateDefaultSIMSummary(DefaultSimPreference defaultsimpreference, Long long1)
    {
        if (long1.longValue() > 0L)
        {
            android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)mSimMap.get(long1);
            if (siminfo != null)
                defaultsimpreference.setSummary(siminfo.mDisplayName);
        } else
        {
            if (long1.longValue() == -2L)
            {
                defaultsimpreference.setSummary(0x7f09000b);
                return;
            }
            if (long1.longValue() == -1L)
            {
                defaultsimpreference.setSummary(0x7f09000a);
                return;
            }
            if (long1.longValue() == 0L)
            {
                defaultsimpreference.setSummary(0x7f09000c);
                return;
            }
            if (long1.longValue() == -3L)
            {
                mExt.updateDefaultSIMSummary(defaultsimpreference, long1);
                return;
            }
        }
    }

    private void updateDefaultSimValue(int i, long l)
    {
        if (l >= 0L)
            if (l == 0L)
            {
                if (i == 4)
                {
                    mGprsSimSetting.setInitValue(mSimMap.size());
                    mGprsSimSetting.setSummary(0x7f09000c);
                    return;
                }
            } else
            {
                Integer integer = (Integer)mSimIdToIndexMap.get(Long.valueOf(l));
                if (integer != null)
                {
                    int j = integer.intValue();
                    if (j >= 0)
                    {
                        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(getActivity(), l);
                        if (siminfo != null && i == 4)
                        {
                            mGprsSimSetting.setInitValue(j);
                            mGprsSimSetting.setSummary(siminfo.mDisplayName);
                            return;
                        }
                    }
                }
            }
    }

    private void updateVideoCallDefaultSIM()
    {
        if (mITelephony == null)
            break MISSING_BLOCK_LABEL_126;
        int i;
        i = mITelephony.get3GCapabilitySIM();
        GeminiUtils.sG3SloteID = i;
        if (i < 0)
            return;
        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(getActivity(), i);
        if (siminfo == null)
            break MISSING_BLOCK_LABEL_118;
        Integer integer = (Integer)mSimIdToIndexMap.get(Long.valueOf(siminfo.mSimId));
        if (integer == null)
            break MISSING_BLOCK_LABEL_126;
        int j = integer.intValue();
        if (j >= 0 && siminfo != null)
        {
            try
            {
                mVideoCallSimSetting.setInitValue(j);
                mVideoCallSimSetting.setSummary(siminfo.mDisplayName);
                return;
            }
            catch (RemoteException remoteexception)
            {
                Xlog.e("SimManagementSettings", "mITelephony exception");
            }
            return;
        }
        break MISSING_BLOCK_LABEL_126;
        mVideoCallSimSetting.setInitValue(-1);
    }

    public void disableSimPrefs()
    {
        boolean flag = true;
        if (mSlot1SimPref != null)
            mSlot1SimPref.setEnabled(false);
        if (mSlot2SimPref != null)
            mSlot2SimPref.setEnabled(false);
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(getActivity());
        Xlog.i("hotswapdbg", (new StringBuilder()).append("sim number is ").append(list.size()).toString());
        Iterator iterator = list.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
            Xlog.d("hotswapdbg", (new StringBuilder()).append(" ").append(siminfo.mSlot).append(" ").append(siminfo.mDisplayName).toString());
            if (siminfo.mSlot == 0)
            {
                if (mSlot1SimPref != null)
                    mSlot1SimPref.setEnabled(flag);
            } else
            if (siminfo.mSlot == flag && mSlot2SimPref != null)
                mSlot2SimPref.setEnabled(flag);
        } while (true);
        initDefaultSimPreference();
        int i = list.size();
        if (i < 2)
        {
            if (mVoiceCallSimSetting.getDialog() != null)
                mVoiceCallSimSetting.getDialog().dismiss();
            if (mVideoCallSimSetting.getDialog() != null)
                mVideoCallSimSetting.getDialog().dismiss();
            if (mSmsSimSetting.getDialog() != null)
                mSmsSimSetting.getDialog().dismiss();
        }
        if (i == 0)
        {
            mGprsSimSetting.setEnabled(false);
            if (mGprsSimSetting.getDialog() != null)
                mGprsSimSetting.getDialog().dismiss();
        }
        if (i <= 0)
            flag = false;
        sHasSim = flag;
    }

    protected void initDefaultSimPreference()
    {
        int i;
        long l;
        long l1;
        long l2;
        int j;
        List list;
        Iterator iterator;
        mSimItemListVoice.clear();
        mSimItemListSms.clear();
        mSimItemListGprs.clear();
        mSimItemListVideo.clear();
        i = 0;
        l = getDataValue("voice_call_sim_setting");
        l1 = getDataValue("sms_sim_setting");
        l2 = getDataValue("gprs_connection_sim_setting");
        j = current3GSlotId();
        if (sVTCallSupport)
            mVideoCallSimSetting.setSummary("");
        mGprsSimSetting.setSummary("");
        list = android.provider.Telephony.SIMInfo.getInsertedSIMList(getActivity());
        Collections.sort(list, new GeminiUtils.SIMInfoComparable());
        iterator = list.iterator();
_L7:
        if (!iterator.hasNext()) goto _L2; else goto _L1
_L1:
        android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
        if (siminfo == null) goto _L4; else goto _L3
_L3:
        SimItem simitem4;
        int j1;
        simitem4 = new SimItem(siminfo);
        j1 = -1;
        if (mITelephony == null)
            break MISSING_BLOCK_LABEL_192;
        int k1 = mITelephony.getSimIndicatorStateGemini(siminfo.mSlot);
        j1 = k1;
_L5:
        simitem4.mState = j1;
        if (siminfo.mSimId == l && mIsVoiceCapable)
        {
            mVoiceCallSimSetting.setInitValue(i);
            mVoiceCallSimSetting.setSummary(siminfo.mDisplayName);
        }
        if (siminfo.mSimId == l1)
        {
            mSmsSimSetting.setInitValue(i);
            mSmsSimSetting.setSummary(siminfo.mDisplayName);
        }
        if (siminfo.mSimId == l2)
        {
            mGprsSimSetting.setInitValue(i);
            mGprsSimSetting.setSummary(siminfo.mDisplayName);
        }
        if (sVTCallSupport && siminfo.mSlot == j)
        {
            mVideoCallSimSetting.setInitValue(i);
            mVideoCallSimSetting.setSummary(siminfo.mDisplayName);
        }
        mSimItemListVoice.add(simitem4);
        mSimItemListSms.add(simitem4);
        mSimItemListGprs.add(simitem4);
        if (sVTCallSupport)
            mSimItemListVideo.add(simitem4);
        mSimIdToIndexMap.put(Long.valueOf(siminfo.mSimId), Integer.valueOf(i));
_L4:
        i++;
        continue; /* Loop/switch isn't completed */
        RemoteException remoteexception;
        remoteexception;
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("RemoteException  ").append(remoteexception.getMessage()).toString());
        if (true) goto _L5; else goto _L2
_L2:
        if (sVoipAvailable)
        {
            SimItem simitem = new SimItem(getString(0x7f09000b), 8, -2L);
            mSimItemListVoice.add(simitem);
        }
        SimItem simitem1 = new SimItem(getString(0x7f09000a), -1, -1L);
        SimItem simitem2;
        int k;
        if (mSimItemListVoice.size() > 1)
            mSimItemListVoice.add(simitem1);
        else
        if (mSimItemListVoice.size() == 1 && sVoipAvailable)
        {
            Xlog.d("SimManagementSettings", "no sim card inserted but internet call is on");
            mSimItemListVoice.add(simitem1);
        }
        if (mSimItemListSms.size() > 1)
            mSimItemListSms.add(simitem1);
        if (mExt.isNeedsetAutoItem() && mSimItemListSms.size() > 1)
        {
            SimItem simitem3 = new SimItem(mExt.getAutoString(), -1, -3L);
            mSimItemListSms.add(simitem3);
        }
        simitem2 = new SimItem(getString(0x7f09000c), -1, 0L);
        if (isRadioOff())
            simitem2.mState = 1;
        mSimItemListGprs.add(simitem2);
        k = list.size();
        if (l == -2L)
        {
            mVoiceCallSimSetting.setInitValue(k);
            mVoiceCallSimSetting.setSummary(0x7f09000b);
        } else
        if (l == -1L)
        {
            DefaultSimPreference defaultsimpreference = mVoiceCallSimSetting;
            int i1;
            if (sVoipAvailable)
                i1 = k + 1;
            else
                i1 = k;
            defaultsimpreference.setInitValue(i1);
            mVoiceCallSimSetting.setSummary(0x7f09000a);
        } else
        if (l == -5L)
            mVoiceCallSimSetting.setSummary(0x7f090019);
        if (l1 == -1L)
        {
            mSmsSimSetting.setInitValue(k);
            mSmsSimSetting.setSummary(0x7f09000a);
        } else
        if (l1 == -5L)
            mSmsSimSetting.setSummary(0x7f090019);
        else
        if (mExt.isNeedsetAutoItem() && l1 == -3L)
        {
            mExt.setPrefProperty(mSmsSimSetting, l1);
            mSmsSimSetting.setInitValue(k + 1);
        }
        if (l2 == 0L)
        {
            mGprsSimSetting.setInitValue(k);
            mGprsSimSetting.setSummary(0x7f09000d);
        } else
        if (l2 == -5L)
            mGprsSimSetting.setSummary(0x7f090019);
        mGprsSimSetting.setData(mSimItemListGprs);
        mVoiceCallSimSetting.setData(mSimItemListVoice);
        mSmsSimSetting.setData(mSimItemListSms);
        mVideoCallSimSetting.setData(mSimItemListVideo);
        if (sVTCallSupport)
            if (mSimItemListVideo.size() < 2)
            {
                mVideoCallSimSetting.setEnabled(false);
            } else
            {
                mVideoCallSimSetting.setData(mSimItemListVideo);
                mVideoCallSimSetting.setEnabled(true);
            }
        if (mIsVoiceCapable)
            if (mSimItemListVoice.size() < 2)
                mVoiceCallSimSetting.setEnabled(false);
            else
                mVoiceCallSimSetting.setEnabled(true);
        if (mSimItemListSms.size() < 2)
        {
            mSmsSimSetting.setEnabled(false);
            return;
        }
        mSmsSimSetting.setEnabled(true);
        return;
        if (true) goto _L7; else goto _L6
_L6:
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mTelephonyManager = (TelephonyManager)getSystemService("phone");
        mIsVoiceCapable = mTelephonyManager.isVoiceCapable();
        sVTCallSupport = false;
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("sVTCallSupport = ").append(sVTCallSupport).toString());
        int i = android.provider.Settings.System.getInt(getContentResolver(), "enable_internet_call_value", 0);
        boolean flag;
        if (SipManager.isVoipSupported(getActivity()) && i != 0)
            flag = true;
        else
            flag = false;
        sVoipAvailable = flag;
        addPreferencesFromResource(0x7f050008);
        mExt = Utils.getSimManagmentExtPlugin(getActivity());
        mTelephonyManagerEx = TelephonyManagerEx.getDefault();
        mITelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        mStatusBarManager = (StatusBarManager)getSystemService("statusbar");
        mIntentFilter = new IntentFilter("android.intent.action.SIM_INDICATOR_STATE_CHANGED");
        mIntentFilter.addAction("android.intent.action.SIM_SETTING_INFO_CHANGED");
        mIntentFilter.addAction("android.intent.action.ANY_DATA_STATE");
        mIntentFilter.addAction("android.intent.action.AIRPLANE_MODE");
        mIntentFilter.addAction("com.android.mms.transaction.START");
        mIntentFilter.addAction("com.android.mms.transaction.STOP");
        mIntentFilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        mIntentFilter.addAction("android.intent.action.SIM_NAME_UPDATE");
        mIntentFilter.addAction("android.intent.action.PHB_STATE_CHANGED");
        mSimMap = new HashMap();
        mSimIdToIndexMap = new HashMap();
        mVoiceCallSimSetting = (DefaultSimPreference)findPreference("voice_call_sim_setting");
        mSmsSimSetting = (DefaultSimPreference)findPreference("sms_sim_setting");
        mGprsSimSetting = (DefaultSimPreference)findPreference("gprs_sim_setting");
        mVideoCallSimSetting = (DefaultSimPreference)findPreference("video_call_sim_setting");
        setIconForDefaultSimPref();
        mVoiceCallSimSetting.setType(1);
        mSmsSimSetting.setType(3);
        mGprsSimSetting.setType(4);
        mVoiceCallSimSetting.setOnPreferenceChangeListener(this);
        mSmsSimSetting.setOnPreferenceChangeListener(this);
        mGprsSimSetting.setOnPreferenceChangeListener(this);
        if (mVideoCallSimSetting != null)
            if (sVTCallSupport)
            {
                mVideoCallSimSetting.setType(2);
                mVideoCallSimSetting.setOnPreferenceChangeListener(this);
            } else
            {
                PreferenceGroup preferencegroup = (PreferenceGroup)findPreference("default_sim");
                if (preferencegroup != null)
                    preferencegroup.removePreference(mVideoCallSimSetting);
            }
        initSimMap();
        if (mSimMap.size() > 0)
        {
            sHasSim = true;
            try
            {
                if (mITelephony != null)
                    mITelephony.registerForSimModeChange(mMessenger.getBinder(), 1);
            }
            catch (RemoteException remoteexception)
            {
                Xlog.e("SimManagementSettings", "mITelephony exception");
                return;
            }
            getActivity().registerReceiver(mSimReceiver, mIntentFilter);
            addSimInfoPreference();
            if (sVTCallSupport && !mIsSlot1Insert)
                mVideoCallSimSetting.setEnabled(false);
            mCellConnMgr = new CellConnMgr(mServiceComplete);
            mCellConnMgr.register(getActivity());
            mGprsSimSetting.setCellConnMgr(mCellConnMgr);
        } else
        {
            sHasSim = false;
            addNoSimIndicator();
            getPreferenceScreen().setEnabled(false);
            mVoiceCallSimSetting.setEnabled(true);
        }
        sGprsDefaultSIMObserver = new ContentObserver(new Handler()) {

            final SimManagement this$0;

            public void onChange(boolean flag1)
            {
                Xlog.i("SimManagementSettings", "Gprs connection SIM changed");
                long l = android.provider.Settings.System.getLong(getContentResolver(), "gprs_connection_sim_setting", -5L);
                updateDefaultSimValue(4, l);
            }

            
            {
                this$0 = SimManagement.this;
                super(handler);
            }
        }
;
        if (bundle != null)
        {
            Xlog.d("SimManagementSettings", "saved instance not null ,means we need init default sim preference to avoid problems");
            initDefaultSimPreference();
        }
    }

    public Dialog onCreateDialog(int i)
    {
        ProgressDialog progressdialog = new ProgressDialog(getActivity());
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(getActivity());
        switch (i)
        {
        case 1006: 
            progressdialog.setMessage(getResources().getString(0x7f090014));
            progressdialog.setIndeterminate(true);
            Window window = progressdialog.getWindow();
            android.view.WindowManager.LayoutParams layoutparams = window.getAttributes();
            layoutparams.flags = 0x80000000 | layoutparams.flags;
            window.setAttributes(layoutparams);
            return progressdialog;

        case 1007: 
            builder.setTitle(0x1040014);
            builder.setIcon(0x1080027);
            builder.setMessage(getResources().getString(0x7f090015));
            builder.setPositiveButton(0x1040013, new android.content.DialogInterface.OnClickListener() {

                final SimManagement this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    switchVideoCallDefaultSIM(mVTTargetTemp);
                }

            
            {
                this$0 = SimManagement.this;
                super();
            }
            }
);
            builder.setNegativeButton(0x1040009, new android.content.DialogInterface.OnClickListener() {

                final SimManagement this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    updateVideoCallDefaultSIM();
                }

            
            {
                this$0 = SimManagement.this;
                super();
            }
            }
);
            return builder.create();

        case 1008: 
            builder.setTitle(0x1040014);
            builder.setIcon(0x1080027);
            if (mDataSwitchMsgIndex >= 0 && mDataSwitchMsgIndex <= 4)
                builder.setMessage(getResources().getString(mDataSwitchMsgStr[mDataSwitchMsgIndex]));
            builder.setPositiveButton(0x1040013, new android.content.DialogInterface.OnClickListener() {

                final SimManagement this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    if (mDataSwitchMsgIndex == 0 || mDataSwitchMsgIndex == 3 || mDataSwitchMsgIndex == 4)
                        enableDataRoaming(mGprsSimSetting.getValue());
                    switchGprsDefautlSIM(mGprsSimSetting.getValue());
                }

            
            {
                this$0 = SimManagement.this;
                super();
            }
            }
);
            builder.setNegativeButton(0x1040009, new android.content.DialogInterface.OnClickListener() {

                final SimManagement this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    updateGprsSettings();
                }

            
            {
                this$0 = SimManagement.this;
                super();
            }
            }
);
            return builder.create();

        case 1005: 
            progressdialog.setMessage(getResources().getString(0x7f090013));
            progressdialog.setIndeterminate(true);
            return progressdialog;

        case 1004: 
            progressdialog.setMessage(getResources().getString(0x7f090013));
            progressdialog.setIndeterminate(true);
            return progressdialog;

        case 1001: 
            progressdialog.setMessage(getResources().getString(0x7f090018));
            progressdialog.setIndeterminate(true);
            return progressdialog;

        case 1000: 
            progressdialog.setMessage(getResources().getString(0x7f090017));
            progressdialog.setIndeterminate(true);
            return progressdialog;

        case 1002: 
        case 1003: 
        default:
            return null;
        }
    }

    public void onDestroy()
    {
        super.onDestroy();
        if (mSimMap.size() > 0)
        {
            try
            {
                if (mITelephony != null)
                    mITelephony.unregisterForSimModeChange(mMessenger.getBinder());
            }
            catch (RemoteException remoteexception)
            {
                Xlog.e("SimManagementSettings", "mITelephony exception");
                return;
            }
            getActivity().unregisterReceiver(mSimReceiver);
            mCellConnMgr.unregister();
        }
        mDualSimMode = android.provider.Settings.System.getInt(getContentResolver(), "dual_sim_mode_setting", -1);
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("has attach msg = ").append(mTimeHandler.hasMessages(2001)).toString());
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("has detach msg = ").append(mTimeHandler.hasMessages(2000)).toString());
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("has sim mode msg = ").append(mDualSimModeChangedHander.hasMessages(1)).toString());
        mTimeHandler.removeMessages(2001);
        mTimeHandler.removeMessages(2000);
        mDualSimModeChangedHander.removeMessages(1);
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("onDestroy: mDualSimMode value is : ").append(mDualSimMode).toString());
    }

    public void onPause()
    {
        super.onPause();
        switch (mIsShowDlg)
        {
        case 1104: 
            removeDialog(1005);
            break;

        case 1103: 
            removeDialog(1006);
            break;

        case 1102: 
            removeDialog(1004);
            break;

        case 1100: 
            removeDialog(1001);
            break;

        case 1101: 
            removeDialog(1000);
            break;
        }
        if (mSimMap.size() >= 0)
        {
            ContentResolver contentresolver = getContentResolver();
            if (contentresolver != null && sGprsDefaultSIMObserver != null)
                contentresolver.unregisterContentObserver(sGprsDefaultSIMObserver);
        }
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        Xlog.i("SimManagementSettings", "Enter onPreferenceChange function.");
        String s = preference.getKey();
        if ("voice_call_sim_setting".equals(s))
        {
            android.provider.Settings.System.putLong(getContentResolver(), "voice_call_sim_setting", ((Long)obj).longValue());
            Intent intent1 = new Intent("android.intent.action.VOICE_CALL_DEFAULT_SIM");
            intent1.putExtra("simid", (Long)obj);
            getActivity().sendBroadcast(intent1);
            updateDefaultSIMSummary(mVoiceCallSimSetting, (Long)obj);
        } else
        if (!"video_call_sim_setting".equals(s))
            if ("sms_sim_setting".equals(s))
            {
                android.provider.Settings.System.putLong(getContentResolver(), "sms_sim_setting", ((Long)obj).longValue());
                Intent intent = new Intent("android.intent.action.SMS_DEFAULT_SIM");
                intent.putExtra("simid", (Long)obj);
                getActivity().sendBroadcast(intent);
                updateDefaultSIMSummary(mSmsSimSetting, (Long)obj);
            } else
            if ("gprs_sim_setting".equals(s))
            {
                long l = ((Long)obj).longValue();
                if (l == 0L)
                {
                    switchGprsDefautlSIM(l);
                    return true;
                }
                android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)mSimMap.get(Long.valueOf(l));
                if (siminfo == null)
                    return false;
                boolean flag = mTelephonyManagerEx.isNetworkRoaming(siminfo.mSlot);
                mDataSwitchMsgIndex = -1;
                if (flag)
                {
                    boolean flag1;
                    if (siminfo.mDataRoaming == 1)
                        flag1 = true;
                    else
                        flag1 = false;
                    if (flag1)
                    {
                        if (siminfo.mSlot == GeminiUtils.sG3SloteID);
                    } else
                    {
                        if (!mIs3gOff && !mIs3gOff)
                            if (siminfo.mSlot == GeminiUtils.sG3SloteID);
                        mDataSwitchMsgIndex = 0;
                    }
                } else
                if (siminfo.mSlot == GeminiUtils.sG3SloteID);
                if (mDataSwitchMsgIndex == -1)
                {
                    switchGprsDefautlSIM(l);
                } else
                {
                    showDialog(1008);
                    setOnCancelListener(new android.content.DialogInterface.OnCancelListener() {

                        final SimManagement this$0;

                        public void onCancel(DialogInterface dialoginterface)
                        {
                            updateGprsSettings();
                        }

            
            {
                this$0 = SimManagement.this;
                super();
            }
                    }
);
                }
            }
        return true;
    }

    public void onPreferenceClick(long l)
    {
        Intent intent = new Intent(getActivity(), com/mediatek/oobe/basic/gemini/SimInfoEditor);
        intent.putExtra("oobe_step_total", sProgressbarMaxSize);
        intent.putExtra("oobe_step_index", sCurrentStep);
        intent.putExtra("simid", l);
        startActivity(intent);
        getActivity().overridePendingTransition(0x7f040002, 0x7f040001);
        Xlog.i("SimManagementSettings", (new StringBuilder()).append(" Start Sim info editor, simId=").append(l).toString());
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }

    public void onResume()
    {
        super.onResume();
        int i = android.provider.Settings.System.getInt(getContentResolver(), "enable_internet_call_value", 0);
        boolean flag;
        if (SipManager.isVoipSupported(getActivity()) && i != 0)
            flag = true;
        else
            flag = false;
        sVoipAvailable = flag;
        mIsSmsCapable = mTelephonyManager.isSmsCapable();
        if (mSimMap.size() >= 0)
        {
            ContentResolver contentresolver = getContentResolver();
            if (contentresolver != null && sGprsDefaultSIMObserver != null)
                contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("gprs_connection_sim_setting"), false, sGprsDefaultSIMObserver);
            long l = android.provider.Settings.System.getLong(getContentResolver(), "voice_call_sim_setting", -5L);
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("voicecallID =").append(l).toString());
            long l1 = android.provider.Settings.System.getLong(getContentResolver(), "sms_sim_setting", -5L);
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("smsID =").append(l1).toString());
            long l2 = android.provider.Settings.System.getLong(getContentResolver(), "gprs_connection_sim_setting", -5L);
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("dataconnectionID =").append(l2).toString());
            int j = 0;
            List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(getActivity());
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
                if (siminfo != null)
                {
                    if (siminfo.mSimId == l)
                    {
                        mVoiceCallSimSetting.setInitValue(j);
                        mVoiceCallSimSetting.setSummary(siminfo.mDisplayName);
                    }
                    Xlog.i("SimManagementSettings", (new StringBuilder()).append("siminfo.mSlot  = ").append(siminfo.mSlot).toString());
                    if (sVTCallSupport && siminfo.mSlot == 0)
                    {
                        Xlog.i("SimManagementSettings", (new StringBuilder()).append("set init video call").append(j).toString());
                        mVideoCallSimSetting.setInitValue(0);
                        mVideoCallSimSetting.setSummary(siminfo.mDisplayName);
                    }
                    if (siminfo.mSimId == l1)
                    {
                        mSmsSimSetting.setInitValue(j);
                        mSmsSimSetting.setSummary(siminfo.mDisplayName);
                    }
                    if (siminfo.mSimId == l2)
                    {
                        mGprsSimSetting.setInitValue(j);
                        mGprsSimSetting.setSummary(siminfo.mDisplayName);
                    }
                    SimInfoEnablePreference siminfoenablepreference = (SimInfoEnablePreference)findPreference(String.valueOf(siminfo.mSimId));
                    if (siminfoenablepreference != null && mITelephony != null)
                        try
                        {
                            boolean flag4 = mITelephony.isRadioOnGemini(siminfo.mSlot);
                            siminfoenablepreference.setCheck(flag4);
                            siminfoenablepreference.setRadioOn(flag4);
                        }
                        catch (RemoteException remoteexception)
                        {
                            Xlog.e("SimManagementSettings", "mITelephony exception");
                            return;
                        }
                }
                j++;
            } while (true);
            int k = list.size();
            boolean flag1;
            boolean flag2;
            DefaultSimPreference defaultsimpreference;
            boolean flag3;
            if (l == -2L)
            {
                mVoiceCallSimSetting.setInitValue(k);
                mVoiceCallSimSetting.setSummary(0x7f09000b);
            } else
            if (l == -1L)
            {
                DefaultSimPreference defaultsimpreference1 = mVoiceCallSimSetting;
                int i1;
                if (sVoipAvailable)
                    i1 = k + 1;
                else
                    i1 = k;
                defaultsimpreference1.setInitValue(i1);
                mVoiceCallSimSetting.setSummary(0x7f09000a);
            } else
            if (l == -5L)
                mVoiceCallSimSetting.setSummary(0x7f090019);
            if (l1 == -1L)
            {
                mSmsSimSetting.setInitValue(k);
                mSmsSimSetting.setSummary(0x7f09000a);
            } else
            if (l1 == -5L)
                mSmsSimSetting.setSummary(0x7f090019);
            else
            if (mExt.isNeedsetAutoItem() && l1 == -3L)
            {
                mExt.setPrefProperty(mSmsSimSetting, l1);
                mSmsSimSetting.setInitValue(k + 1);
            }
            if (l2 == 0L)
            {
                mGprsSimSetting.setInitValue(k);
                mGprsSimSetting.setSummary(0x7f09000c);
            } else
            if (l2 == -5L)
                mGprsSimSetting.setSummary(0x7f090019);
            if (sVTCallSupport && android.provider.Settings.System.getLong(getContentResolver(), "video_call_sim_setting", -5L) == -5L)
                mVideoCallSimSetting.setSummary(0x7f090019);
            if (android.provider.Settings.System.getInt(getContentResolver(), "mms.transaction", 0) == 0)
                flag1 = true;
            else
                flag1 = false;
            sScreenEnable = flag1;
            if (android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", -1) == 1 || android.provider.Settings.System.getInt(getContentResolver(), "dual_sim_mode_setting", -1) == 0)
                flag2 = true;
            else
                flag2 = false;
            sAllSimRadioOff = flag2;
            defaultsimpreference = mGprsSimSetting;
            if (!sAllSimRadioOff && sScreenEnable && sHasSim)
                flag3 = true;
            else
                flag3 = false;
            defaultsimpreference.setEnabled(flag3);
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("mGprsSimSetting.setEnabled = ").append(mGprsSimSetting.isEnabled()).append(" in onResume").toString());
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("sAllSimRadioOff = ").append(sAllSimRadioOff).append(" sScreenEnable = ").append(sScreenEnable).append(" sHasSim = ").append(sHasSim).toString());
        }
        mIsShowDlg;
        JVM INSTR tableswitch 1100 1104: default 876
    //                   1100 1084
    //                   1101 1069
    //                   1102 1099
    //                   1103 1114
    //                   1104 1129;
           goto _L1 _L2 _L3 _L4 _L5 _L6
_L1:
        initDefaultSimPreference();
        return;
_L3:
        showDialog(1000);
        setCancelable(false);
        continue; /* Loop/switch isn't completed */
_L2:
        showDialog(1001);
        setCancelable(false);
        continue; /* Loop/switch isn't completed */
_L4:
        showDialog(1004);
        setCancelable(false);
        continue; /* Loop/switch isn't completed */
_L5:
        showDialog(1006);
        setCancelable(false);
        continue; /* Loop/switch isn't completed */
_L6:
        showDialog(1005);
        setCancelable(false);
        if (true) goto _L1; else goto _L7
_L7:
    }

    public void onStart()
    {
        super.onStart();
        getListView().setItemsCanFocus(true);
    }

    protected void updateDefaultSimInfo(long l)
    {
        android.provider.Telephony.SIMInfo siminfo;
        int i;
        SimItem simitem;
        int j;
        Integer integer;
label0:
        {
            siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(getActivity(), l);
            if (siminfo != null)
            {
                integer = (Integer)mSimIdToIndexMap.get(Long.valueOf(siminfo.mSimId));
                if (integer != null)
                    break label0;
            }
            return;
        }
        i = integer.intValue();
        simitem = new SimItem(siminfo);
        j = -1;
        int k = mITelephony.getSimIndicatorStateGemini(siminfo.mSlot);
        j = k;
_L1:
        simitem.mState = j;
        RemoteException remoteexception;
        boolean flag;
        if (siminfo.mSlot == 0)
            flag = true;
        else
            flag = false;
        updateDefaultSimItemList(i, simitem, flag);
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("simid status of sim ").append(siminfo.mSimId).append("is  ").append(j).toString());
        return;
        remoteexception;
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("RemoteException  ").append(remoteexception.getMessage()).toString());
          goto _L1
    }

    protected void updateDefaultSimItemList(int i, SimItem simitem, boolean flag)
    {
        if (i < mSimItemListVoice.size())
        {
            mSimItemListVoice.set(i, simitem);
            mVoiceCallSimSetting.setData(mSimItemListVoice);
        }
        if (i < mSimItemListSms.size())
        {
            mSimItemListSms.set(i, simitem);
            mSmsSimSetting.setData(mSimItemListSms);
        }
        if (i < mSimItemListGprs.size())
        {
            mSimItemListGprs.set(i, simitem);
            mGprsSimSetting.setData(mSimItemListGprs);
        }
        if (sVTCallSupport)
        {
            if (flag)
                mSimItemListVideo.set(0, simitem);
            mVideoCallSimSetting.setData(mSimItemListVideo);
        }
    }

    protected void updateDefaultSimState(int i, int j)
    {
        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(getActivity(), i);
        if (siminfo != null)
        {
            Integer integer = (Integer)mSimIdToIndexMap.get(Long.valueOf(siminfo.mSimId));
            if (integer != null)
            {
                int k = integer.intValue();
                Xlog.i("SimManagementSettings", (new StringBuilder()).append("index is").append(k).toString());
                SimItem simitem = new SimItem(siminfo);
                simitem.mState = j;
                boolean flag;
                if (i == 0)
                    flag = true;
                else
                    flag = false;
                updateDefaultSimItemList(k, simitem, flag);
                Xlog.i("SimManagementSettings", (new StringBuilder()).append("simid status of sim ").append(siminfo.mSimId).append("is  ").append(j).toString());
                return;
            }
        }
    }

    protected void updateGprsSettings()
    {
        long l = android.provider.Settings.System.getLong(getContentResolver(), "gprs_connection_sim_setting", -5L);
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("dataconnectionID =").append(l).toString());
        if (l > 0L)
        {
            Integer integer = (Integer)mSimIdToIndexMap.get(Long.valueOf(l));
            if (integer != null)
            {
                int j = integer.intValue();
                android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)mSimMap.get(Long.valueOf(l));
                if (j >= 0 && siminfo != null)
                {
                    mGprsSimSetting.setInitValue(j);
                    mGprsSimSetting.setSummary(siminfo.mDisplayName);
                    return;
                }
            }
        } else
        if (l == 0L)
        {
            int i = mSimMap.size();
            mGprsSimSetting.setInitValue(i);
            mGprsSimSetting.setSummary(0x7f09000c);
            return;
        }
    }

    protected void updateSimInfo(long l, int i)
    {
        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(getActivity(), l);
        if (siminfo != null)
        {
            mSimMap.put(Long.valueOf(l), siminfo);
            SimInfoEnablePreference siminfoenablepreference = (SimInfoEnablePreference)findPreference(String.valueOf(l));
            if (siminfoenablepreference != null)
            {
                switch (i)
                {
                case 3: // '\003'
                    siminfoenablepreference.setNumDisplayFormat(siminfo.mDispalyNumberFormat);
                    return;

                case 2: // '\002'
                    siminfoenablepreference.setNumber(siminfo.mNumber);
                    return;

                case 1: // '\001'
                    siminfoenablepreference.setColor(siminfo.mColor);
                    return;

                case 0: // '\0'
                    siminfoenablepreference.setName(siminfo.mDisplayName);
                    return;
                }
                return;
            }
        }
    }

    protected void updateSimState(int i, int j)
    {
        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(getActivity(), i);
        if (siminfo != null)
        {
            SimInfoEnablePreference siminfoenablepreference = (SimInfoEnablePreference)findPreference(String.valueOf(siminfo.mSimId));
            if (siminfoenablepreference != null)
            {
                siminfoenablepreference.setStatus(j);
                Xlog.i("SimManagementSettings", (new StringBuilder()).append("simid status of sim ").append(siminfo.mSimId).append("is  ").append(j).toString());
            }
        }
    }






/*
    static boolean access$102(boolean flag)
    {
        sScreenEnable = flag;
        return flag;
    }

*/




/*
    static boolean access$1202(SimManagement simmanagement, boolean flag)
    {
        simmanagement.mIsGprsSwitching = flag;
        return flag;
    }

*/











/*
    static boolean access$202(boolean flag)
    {
        sAllSimRadioOff = flag;
        return flag;
    }

*/







/*
    static boolean access$2502(SimManagement simmanagement, boolean flag)
    {
        simmanagement.mIsSIMModeSwitching = flag;
        return flag;
    }

*/










/*
    static int access$502(SimManagement simmanagement, int i)
    {
        simmanagement.mIsShowDlg = i;
        return i;
    }

*/




}
