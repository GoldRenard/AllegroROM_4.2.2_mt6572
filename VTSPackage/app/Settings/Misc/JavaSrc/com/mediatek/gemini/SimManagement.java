// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.gemini;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.sip.SipManager;
import android.os.*;
import android.preference.*;
import android.telephony.TelephonyManager;
import android.view.Window;
import android.widget.CompoundButton;
import com.android.internal.telephony.ITelephony;
import com.android.internal.telephony.PhoneConstants;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.settings.SettingsPreferenceFragment;
import com.android.settings.Utils;
import com.mediatek.CellConnService.CellConnMgr;
import com.mediatek.settings.ext.ISimManagementExt;
import com.mediatek.telephony.TelephonyManagerEx;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.mediatek.gemini:
//            SimInfoEnablePreference, DefaultSimPreference, SimItem, SimInfoEditor, 
//            SimListEntrance

public class SimManagement extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceChangeListener, SimInfoEnablePreference.OnPreferenceClickCallback
{

    private static final String ACTION_DATA_USAGE_DISABLED_DIALOG_OK = "com.mediatek.systemui.net.action.ACTION_DATA_USAGE_DISABLED_DIALOG_OK";
    private static final int ALL_RADIO_OFF = 0;
    private static final int ALL_RADIO_ON = 3;
    private static final int ATTACH_DATA_CONN_TIME_OUT = 30000;
    private static final String CONFIRM_DIALOG_MSG_ID = "confirm_dialog_msg_id";
    private static final int DATA_3G_SWITCH_TIME_OUT_MSG = 2002;
    private static final int DATA_SWITCH_TIME_OUT_MSG = 2000;
    private static final int DETACH_DATA_CONN_TIME_OUT = 10000;
    private static final int DIALOG_3G_MODEM_SWITCH_CONFIRM = 1001;
    private static final int DIALOG_GPRS_SWITCH_CONFIRM = 1002;
    private static final int DIALOG_NOT_REMOVE_TIME_OUT = 1000;
    private static final int DIALOG_NOT_SHOW_SUCCESS_MSG = 2001;
    private static final int EVENT_DUAL_SIM_MODE_CHANGED_COMPLETE = 1;
    private static final String KEY_3G_SERVICE_SETTING = "3g_service_settings";
    private static final String KEY_DEFAULT_SIM_SETTINGS_CATEGORY = "default_sim";
    private static final String KEY_GENERAL_SETTINGS_CATEGORY = "general_settings";
    private static final String KEY_GPRS_SIM_SETTING = "gprs_sim_setting";
    private static final String KEY_SIM_CONTACTS_SETTINGS = "contacts_sim";
    private static final String KEY_SIM_INFO_CATEGORY = "sim_info";
    private static final String KEY_SMS_SIM_SETTING = "sms_sim_setting";
    private static final String KEY_VIDEO_CALL_SIM_SETTING = "video_call_sim_setting";
    private static final String KEY_VOICE_CALL_SIM_SETTING = "voice_call_sim_setting";
    private static final int PROGRESS_DIALOG = 1000;
    private static final String PROGRESS_DIALOG_MSG_ID = "progress_dialog_msg_id";
    private static final int SIM_SLOT_1_RADIO_ON = 1;
    private static final int SIM_SLOT_2_RADIO_ON = 2;
    private static final int SWITCH_3G_TIME_OUT = 60000;
    private static final String TAG = "SimManagementSettings";
    private static final String TRANSACTION_START = "com.android.mms.transaction.START";
    private static final String TRANSACTION_STOP = "com.android.mms.transaction.STOP";
    private static final int VIDEO_CALL_OFF = -1;
    private static boolean sIsVoipAvailable = true;
    private static boolean sVTCallSupport = true;
    private CellConnMgr mCellConnMgr;
    private ConnectivityManager mConnService;
    private int mDataSwitchMsgIndex;
    private ISimManagementExt mExt;
    private ContentObserver mGprsDefaultSIMObserver;
    private DefaultSimPreference mGprsSimSetting;
    private IntentFilter mIntentFilter;
    private boolean mIs3gOff;
    private boolean mIsDataConnectActing;
    private boolean mIsSIMRadioSwitching;
    private boolean mIsSlot1Insert;
    private boolean mIsSlot2Insert;
    private boolean mIsSmsCapable;
    private boolean mIsVoiceCapable;
    private int mProDlgMsgId;
    private boolean mRemoveProgDlg;
    private long mSelectedGprsSimId;
    private long mSelectedVideoSimId;
    private PreferenceScreen mSimAndContacts;
    private List mSimItemListGprs;
    private List mSimItemListSms;
    private List mSimItemListVideo;
    private List mSimItemListVoice;
    private int mSimNum;
    private BroadcastReceiver mSimReceiver;
    private List mSiminfoList;
    private DefaultSimPreference mSmsSimSetting;
    private Messenger mSwitchRadioStateMsg;
    private ITelephony mTelephony;
    private TelephonyManager mTelephonyManager;
    private Handler mTimerHandler;
    private DefaultSimPreference mVideoCallSimSetting;
    private DefaultSimPreference mVoiceCallSimSetting;
    private boolean noNeedRestoreProgDlg;

    public SimManagement()
    {
        mIs3gOff = false;
        mIsSlot1Insert = false;
        mIsSlot2Insert = false;
        mSiminfoList = new ArrayList();
        mSimItemListVoice = new ArrayList();
        mSimItemListVideo = new ArrayList();
        mSimItemListSms = new ArrayList();
        mSimItemListGprs = new ArrayList();
        mIsSIMRadioSwitching = false;
        mDataSwitchMsgIndex = -1;
        mIsVoiceCapable = false;
        mIsSmsCapable = false;
        mIsDataConnectActing = false;
        mRemoveProgDlg = false;
        mProDlgMsgId = -1;
        noNeedRestoreProgDlg = false;
        mGprsDefaultSIMObserver = new ContentObserver(new Handler()) {

            final SimManagement this$0;

            public void onChange(boolean flag)
            {
                updateDataConnPrefe();
            }

            
            {
                this$0 = SimManagement.this;
                super(handler);
            }
        }
;
        mTimerHandler = new Handler() {

            final SimManagement this$0;

            public void handleMessage(Message message)
            {
                if (2000 == message.what)
                {
                    Xlog.i("SimManagementSettings", "reveive time out msg...");
                    removeProgDlg();
                    mIsDataConnectActing = false;
                    updateDataConnPrefe();
                } else
                {
                    if (2001 == message.what)
                    {
                        Xlog.i("SimManagementSettings", "handle abnormal progress dialog not showing");
                        dealWithSwtichComplete();
                        return;
                    }
                    if (2002 == message.what)
                    {
                        Xlog.d("SimManagementSettings", "3G switch time out remove the progress dialog");
                        removeProgDlg();
                        setStatusBarEnableStatus(true);
                        updateVideoCallDefaultSIM();
                        return;
                    }
                    if (1 == message.what)
                    {
                        Xlog.d("SimManagementSettings", "dual sim mode changed");
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
        mSwitchRadioStateMsg = new Messenger(mTimerHandler);
        mSimReceiver = new BroadcastReceiver() {

            final SimManagement this$0;

            public void onReceive(Context context, Intent intent)
            {
                boolean flag = true;
                String s = intent.getAction();
                Xlog.d("SimManagementSettings", (new StringBuilder()).append("mSimReceiver receive action=").append(s).toString());
                if (!s.equals("android.intent.action.SIM_INFO_UPDATE") && !s.equals("android.intent.action.SIM_SETTING_INFO_CHANGED") && !s.equals("android.intent.action.SIM_NAME_UPDATE") && !s.equals("android.intent.action.SIM_INDICATOR_STATE_CHANGED") && !s.equals("android.intent.action.AIRPLANE_MODE"))
                {
                    if (s.equals("com.android.mms.transaction.START"))
                    {
                        if (mGprsSimSetting.isEnabled())
                            mGprsSimSetting.setEnabled(false);
                        Dialog dialog1 = mGprsSimSetting.getDialog();
                        if (dialog1 != null && dialog1.isShowing())
                        {
                            Xlog.d("SimManagementSettings", "MMS starting dismiss GPRS selection dialog to prohbit data switch");
                            dialog1.dismiss();
                            return;
                        }
                    } else
                    if (s.equals("com.android.mms.transaction.STOP"))
                    {
                        if (!mGprsSimSetting.isEnabled())
                        {
                            DefaultSimPreference defaultsimpreference1 = mGprsSimSetting;
                            if (isRadioOff())
                                flag = false;
                            defaultsimpreference1.setEnabled(flag);
                        }
                        Dialog dialog = mGprsSimSetting.getDialog();
                        if (dialog != null && dialog.isShowing())
                        {
                            Xlog.d("SimManagementSettings", "MMS stopped dismiss GPRS selection dialog");
                            dialog.dismiss();
                            return;
                        }
                    } else
                    if (s.equals(GeminiPhone.EVENT_3G_SWITCH_LOCK_CHANGED))
                    {
                        boolean flag1 = intent.getBooleanExtra(GeminiPhone.EXTRA_3G_SWITCH_LOCKED, false);
                        if (SimManagement.sVTCallSupport)
                        {
                            DefaultSimPreference defaultsimpreference = mVideoCallSimSetting;
                            if (mIs3gOff || flag1 || mSimNum == flag)
                                flag = false;
                            defaultsimpreference.setEnabled(flag);
                            Xlog.d("SimManagementSettings", (new StringBuilder()).append("mIs3gOff=").append(mIs3gOff).append(" lockState=").append(flag1).toString());
                            return;
                        }
                    } else
                    {
                        if (s.equals(GeminiPhone.EVENT_3G_SWITCH_DONE))
                        {
                            mTimerHandler.removeMessages(2002);
                            removeProgDlg();
                            setStatusBarEnableStatus(flag);
                            updateVideoCallDefaultSIM();
                            return;
                        }
                        if (s.equals("android.intent.action.ANY_DATA_STATE"))
                        {
                            int i = intent.getIntExtra("simId", -1);
                            String s1 = intent.getStringExtra("apnType");
                            com.android.internal.telephony.PhoneConstants.DataState datastate = SimManagement.getMobileDataState(intent);
                            Xlog.i("SimManagementSettings", (new StringBuilder()).append("slotId=").append(i).toString());
                            Xlog.i("SimManagementSettings", (new StringBuilder()).append("state=").append(datastate).toString());
                            Xlog.i("SimManagementSettings", (new StringBuilder()).append("apnTypeList=").append(s1).toString());
                            mExt.dealWithDataConnChanged(intent, isResumed());
                            if ((datastate == com.android.internal.telephony.PhoneConstants.DataState.CONNECTED || datastate == com.android.internal.telephony.PhoneConstants.DataState.DISCONNECTED) && "default".equals(s1))
                            {
                                Xlog.d("SimManagementSettings", (new StringBuilder()).append("****the slot ").append(i).append(datastate).append(" mIsDataConnectActing=").append(mIsDataConnectActing).toString());
                                if (mIsDataConnectActing)
                                {
                                    mTimerHandler.removeMessages(2000);
                                    removeProgDlg();
                                    mIsDataConnectActing = false;
                                    return;
                                }
                            }
                        } else
                        if (s.equals("com.mediatek.systemui.net.action.ACTION_DATA_USAGE_DISABLED_DIALOG_OK") && mIsDataConnectActing)
                        {
                            mIsDataConnectActing = false;
                            removeProgDlg();
                            return;
                        }
                    }
                } else
                {
                    getSimInfo();
                    updatePreferenceUI();
                    dealDlgOnAirplaneMode(s);
                }
            }

            
            {
                this$0 = SimManagement.this;
                super();
            }
        }
;
    }

    private void addSimInfoPreference()
    {
        Xlog.d("SimManagementSettings", "addSimInfoPreference()");
        PreferenceGroup preferencegroup = (PreferenceGroup)findPreference("sim_info");
        preferencegroup.removeAll();
        Iterator iterator = mSiminfoList.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            final android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("siminfo.mDisplayName = ").append(siminfo.mDisplayName).toString());
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("siminfo.mNumber = ").append(siminfo.mNumber).toString());
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("siminfo.mSlot = ").append(siminfo.mSlot).toString());
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("siminfo.mColor = ").append(siminfo.mColor).toString());
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("siminfo.mDispalyNumberFormat = ").append(siminfo.mDispalyNumberFormat).toString());
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("siminfo.mSimId = ").append(siminfo.mSimId).toString());
            int i = getSimIndicator(siminfo.mSlot);
            boolean flag;
            final SimInfoEnablePreference simInfoPref;
            if (android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", -1) == 1)
                flag = true;
            else
                flag = false;
            simInfoPref = new SimInfoEnablePreference(getActivity(), siminfo.mDisplayName, siminfo.mNumber, siminfo.mSlot, i, siminfo.mColor, siminfo.mDispalyNumberFormat, siminfo.mSimId, flag);
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("simid status is  ").append(i).toString());
            if (simInfoPref != null)
            {
                simInfoPref.setClickCallback(this);
                if (mTelephony != null)
                    try
                    {
                        boolean flag1 = mTelephony.isRadioOnGemini(siminfo.mSlot);
                        simInfoPref.setCheck(flag1);
                        Xlog.d("SimManagementSettings", (new StringBuilder()).append("sim card ").append(siminfo.mSlot).append(" radio state is isRadioOn=").append(flag1).toString());
                    }
                    catch (RemoteException remoteexception)
                    {
                        Xlog.e("SimManagementSettings", "mTelephony exception");
                    }
                simInfoPref.setCheckBoxClickListener(new android.widget.CompoundButton.OnCheckedChangeListener() {

                    final SimManagement this$0;
                    final SimInfoEnablePreference val$simInfoPref;
                    final android.provider.Telephony.SIMInfo val$siminfo;

                    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag2)
                    {
                        boolean flag3 = true;
                        Xlog.i("SimManagementSettings", (new StringBuilder()).append("receive slot ").append(siminfo.mSlot).append(" switch is clicking! with isChecked=").append(flag2).toString());
                        if (!mIsSIMRadioSwitching)
                        {
                            Xlog.d("SimManagementSettings", (new StringBuilder()).append("start to turn radio in ").append(flag2).toString());
                            mIsSIMRadioSwitching = flag3;
                            simInfoPref.setCheck(flag2);
                            if (PhoneConstants.GEMINI_SIM_NUM > 2)
                            {
                                switchGeminiPlusSimRadioState(siminfo.mSlot);
                                return;
                            } else
                            {
                                switchSimRadioState(siminfo.mSlot, flag2);
                                return;
                            }
                        }
                        Xlog.d("SimManagementSettings", "Click too fast it is switching and set the switch to previous state");
                        SimInfoEnablePreference siminfoenablepreference = simInfoPref;
                        if (flag2)
                            flag3 = false;
                        siminfoenablepreference.setCheck(flag3);
                    }

            
            {
                this$0 = SimManagement.this;
                siminfo = siminfo1;
                simInfoPref = siminfoenablepreference;
                super();
            }
                }
);
                preferencegroup.addPreference(simInfoPref);
            }
        } while (true);
    }

    private int current3GSlotId()
    {
label0:
        {
            int i = -1;
            int j;
            try
            {
                if (mTelephony == null)
                    break label0;
                j = mTelephony.get3GCapabilitySIM();
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

    private int dataSwitchConfirmDlgMsg(long l)
    {
        boolean flag = true;
        android.provider.Telephony.SIMInfo siminfo = findSIMInfoBySimId(l);
        boolean flag1 = TelephonyManagerEx.getDefault().isNetworkRoaming(siminfo.mSlot);
        if (siminfo.mDataRoaming != flag)
            flag = false;
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("isInRoaming=").append(flag1).append(" isRoamingDataAllowed=").append(flag).toString());
        return !flag1 || flag ? -1 : 0x7f0b00fc;
    }

    private void dealDialogOnResume()
    {
        Xlog.d("SimManagementSettings", "dealDialogOnResume");
        if (mRemoveProgDlg)
        {
            Xlog.d("SimManagementSettings", "on resume to remove dialog");
            removeDialog(1000);
            mRemoveProgDlg = false;
        }
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("mRemoveProgDlg = ").append(mRemoveProgDlg).toString());
        if (isRadioOff() && isDialogShowing(1001))
            removeDialog(1001);
        if (isRadioOff() && isDialogShowing(1002))
            removeDialog(1002);
    }

    private void dealDlgOnAirplaneMode(String s)
    {
        if ("android.intent.action.AIRPLANE_MODE".equals(s) && isResumed() && isRadioOff())
        {
            Xlog.d("SimManagementSettings", "dealDlgOnAirplaneMode");
            if (isDialogShowing(1001))
                removeDialog(1001);
            else
            if (isDialogShowing(1002))
            {
                removeDialog(1002);
                return;
            }
        }
    }

    private void dealWithSwtichComplete()
    {
        Xlog.d("SimManagementSettings", "dealWithSwtichComplete()");
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("mIsSIMModeSwitching is ").append(mIsSIMRadioSwitching).toString());
        if (!mIsSIMRadioSwitching)
            Xlog.i("SimManagementSettings", "dual mode change by other not sim management");
        else
        if (!isDialogShowing(1000))
        {
            Xlog.d("SimManagementSettings", "Dialog is not show yet but dual sim modechange has sent msg");
            mTimerHandler.sendEmptyMessageDelayed(2001, 1000L);
        } else
        {
            removeProgDlg();
            mIsSIMRadioSwitching = false;
        }
        mGprsSimSetting.setEnabled(isGPRSEnable());
        mExt.showChangeDataConnDialog(this, isResumed());
    }

    private void enableDataRoaming(long l)
    {
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("enableDataRoaming with SimId=").append(l).toString());
        if (isSimInsertedIn(l))
        {
            try
            {
                if (mTelephony != null)
                    mTelephony.setDataRoamingEnabledGemini(true, android.provider.Telephony.SIMInfo.getSlotById(getActivity(), l));
            }
            catch (RemoteException remoteexception)
            {
                Xlog.e("SimManagementSettings", "mTelephony exception");
                return;
            }
            android.provider.Telephony.SIMInfo.setDataRoaming(getActivity(), 1, l);
            return;
        } else
        {
            Xlog.d("SimManagementSettings", (new StringBuilder()).append("sim Id ").append(l).append(" not inserted in phone do nothing").toString());
            return;
        }
    }

    private int findListPosBySimId(long l)
    {
        int i = mSiminfoList.size();
        int j = -1;
        if (i == 1)
            j = 0;
        if (i > 1)
        {
            android.provider.Telephony.SIMInfo siminfo = findSIMInfoBySimId(l);
            if (siminfo == null)
                Xlog.d("SimManagementSettings", "Error can not find the sim id with related siminfo");
            else
                j = siminfo.mSlot;
        }
        Xlog.d("SimManagementSettings", (new StringBuilder()).append(i).append(" sim card inserted and the sim is in pos with ").append(j).toString());
        return j;
    }

    private android.provider.Telephony.SIMInfo findSIMInfoBySimId(long l)
    {
        for (Iterator iterator = mSiminfoList.iterator(); iterator.hasNext();)
        {
            android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
            if (siminfo.mSimId == l)
                return siminfo;
        }

        Xlog.d("SimManagementSettings", "Error happend on findSIMInfoBySimId no siminfo find");
        return null;
    }

    private android.provider.Telephony.SIMInfo findSIMInofBySlotId(int i)
    {
        for (Iterator iterator = mSiminfoList.iterator(); iterator.hasNext();)
        {
            android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
            if (siminfo.mSlot == i)
                return siminfo;
        }

        Xlog.d("SimManagementSettings", "Error happend on findSIMInofBySlotId no siminfo find");
        return null;
    }

    private long getDataValue(String s)
    {
        return android.provider.Settings.System.getLong(getContentResolver(), s, -5L);
    }

    private int getInverseNumber(int i)
    {
        String s = Integer.toBinaryString(~i);
        int j = Integer.parseInt(s.substring(s.length() - 4), 2);
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("inverseNum = ").append(j).toString());
        return j;
    }

    private static com.android.internal.telephony.PhoneConstants.DataState getMobileDataState(Intent intent)
    {
        String s = intent.getStringExtra("state");
        if (s != null)
            return (com.android.internal.telephony.PhoneConstants.DataState)Enum.valueOf(com/android/internal/telephony/PhoneConstants$DataState, s);
        else
            return com.android.internal.telephony.PhoneConstants.DataState.DISCONNECTED;
    }

    private android.provider.Telephony.SIMInfo getSIMInfoById(Long long1)
    {
        for (Iterator iterator = mSiminfoList.iterator(); iterator.hasNext();)
        {
            android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
            if (siminfo.mSimId == long1.longValue())
                return siminfo;
        }

        Xlog.d("SimManagementSettings", (new StringBuilder()).append("Error there is no correct siminfo found by simid ").append(long1).toString());
        return null;
    }

    private int getSimIndicator(int i)
    {
label0:
        {
            int j = -1;
            Xlog.d("SimManagementSettings", (new StringBuilder()).append("getSimIndicator---slotId=").append(i).toString());
            int k;
            try
            {
                if (mTelephony == null)
                    break label0;
                k = mTelephony.getSimIndicatorStateGemini(i);
            }
            catch (RemoteException remoteexception)
            {
                Xlog.e("SimManagementSettings", "RemoteException");
                return j;
            }
            catch (NullPointerException nullpointerexception)
            {
                Xlog.e("SimManagementSettings", "NullPointerException");
                return j;
            }
            j = k;
        }
        return j;
    }

    private void getSimInfo()
    {
        Xlog.d("SimManagementSettings", "getSimInfo()");
        mSiminfoList = android.provider.Telephony.SIMInfo.getInsertedSIMList(getActivity());
        mSimNum = mSiminfoList.size();
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("total inserted sim card =").append(mSimNum).toString());
        Collections.sort(mSiminfoList, new GeminiUtils.SIMInfoComparable());
        for (int i = 0; i < mSiminfoList.size(); i++)
        {
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("siminfo.mDisplayName = ").append(((android.provider.Telephony.SIMInfo)mSiminfoList.get(i)).mDisplayName).toString());
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("siminfo.mNumber = ").append(((android.provider.Telephony.SIMInfo)mSiminfoList.get(i)).mNumber).toString());
            int j = ((android.provider.Telephony.SIMInfo)mSiminfoList.get(i)).mSlot;
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("siminfo.mSlot = ").append(j).toString());
            if (j == 0)
                mIsSlot1Insert = true;
            else
            if (j == 1)
                mIsSlot2Insert = true;
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("siminfo.mColor = ").append(((android.provider.Telephony.SIMInfo)mSiminfoList.get(i)).mColor).toString());
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("siminfo.mDispalyNumberFormat = ").append(((android.provider.Telephony.SIMInfo)mSiminfoList.get(i)).mDispalyNumberFormat).toString());
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("siminfo.mSimId = ").append(((android.provider.Telephony.SIMInfo)mSiminfoList.get(i)).mSimId).toString());
        }

    }

    private void initIntentFilter()
    {
        Xlog.d("SimManagementSettings", "initIntentFilter");
        mIntentFilter = new IntentFilter("android.intent.action.SIM_INDICATOR_STATE_CHANGED");
        mIntentFilter.addAction("android.intent.action.SIM_SETTING_INFO_CHANGED");
        mIntentFilter.addAction("android.intent.action.ANY_DATA_STATE");
        mIntentFilter.addAction("android.intent.action.AIRPLANE_MODE");
        mIntentFilter.addAction("com.android.mms.transaction.START");
        mIntentFilter.addAction("com.android.mms.transaction.STOP");
        mIntentFilter.addAction("android.intent.action.SIM_NAME_UPDATE");
        mIntentFilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        mIntentFilter.addAction("com.mediatek.systemui.net.action.ACTION_DATA_USAGE_DISABLED_DIALOG_OK");
    }

    private boolean isGPRSEnable()
    {
        ConnectivityManager connectivitymanager = (ConnectivityManager)getSystemService("connectivity");
        boolean flag = false;
        if (connectivitymanager != null)
        {
            NetworkInfo networkinfo = connectivitymanager.getNetworkInfo(2);
            flag = false;
            if (networkinfo != null)
            {
                android.net.NetworkInfo.State state = networkinfo.getState();
                Xlog.d("SimManagementSettings", (new StringBuilder()).append("mms state = ").append(state).toString());
                if (state != android.net.NetworkInfo.State.CONNECTING && state != android.net.NetworkInfo.State.CONNECTED)
                    flag = false;
                else
                    flag = true;
            }
        }
        boolean flag1 = isRadioOff();
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("isMMSProcess=").append(flag).append(" isRadioOff=").append(flag1).toString());
        return !flag && !flag1;
    }

    private boolean isRadioOff()
    {
        boolean flag = true;
        if (android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", -1) != flag && android.provider.Settings.System.getInt(getContentResolver(), "dual_sim_mode_setting", -1) != 0 && mSimNum != 0)
            flag = false;
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("isAllRadioOff=").append(flag).toString());
        return flag;
    }

    private boolean isSimInsertedIn(long l)
    {
        for (Iterator iterator = mSiminfoList.iterator(); iterator.hasNext();)
            if (((android.provider.Telephony.SIMInfo)iterator.next()).mSimId == l)
                return true;

        Xlog.d("SimManagementSettings", (new StringBuilder()).append("simid = ").append(l).append(" not inserted in phone").toString());
        return false;
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

    private void removeDefaultSimPref()
    {
        PreferenceGroup preferencegroup = (PreferenceGroup)findPreference("default_sim");
        if (preferencegroup != null)
        {
            Xlog.d("SimManagementSettings", "group != null");
            preferencegroup.removePreference(mVideoCallSimSetting);
            preferencegroup.removePreference(mSmsSimSetting);
        }
        PreferenceGroup preferencegroup1 = (PreferenceGroup)findPreference("general_settings");
        if (preferencegroup1 != null)
            preferencegroup1.removePreference(findPreference("contacts_sim"));
    }

    private void removeProgDlg()
    {
        Xlog.d("SimManagementSettings", "removeProgDlg()");
        if (isResumed())
        {
            Xlog.d("SimManagementSettings", "Progress Dialog removed");
            removeDialog(1000);
            return;
        } else
        {
            Xlog.d("SimManagementSettings", "under onpause not enable to remove set flag as true");
            mRemoveProgDlg = true;
            return;
        }
    }

    private void removeUnusedPref()
    {
        Xlog.d("SimManagementSettings", "removeUnusedPref()");
        if (!mIsVoiceCapable)
            sVTCallSupport = false;
        PreferenceGroup preferencegroup = (PreferenceGroup)findPreference("default_sim");
        if (!mIsVoiceCapable)
        {
            preferencegroup.removePreference(mVoiceCallSimSetting);
            preferencegroup.removePreference(mVideoCallSimSetting);
            if (!mIsSmsCapable)
                preferencegroup.removePreference(mSmsSimSetting);
        }
        if (!sVTCallSupport)
        {
            Xlog.d("SimManagementSettings", (new StringBuilder()).append("Video call is ").append(sVTCallSupport).append(" remove the pref").toString());
            preferencegroup.removePreference(mVideoCallSimSetting);
        }
    }

    private void setIconForDefaultSimPref()
    {
        mVoiceCallSimSetting.setIcon(0x7f020041);
        mVideoCallSimSetting.setIcon(0x7f020040);
        mSmsSimSetting.setIcon(0x7f02003f);
        mGprsSimSetting.setIcon(0x7f02003e);
    }

    private void setNoSimInfoUi()
    {
        PreferenceGroup preferencegroup = (PreferenceGroup)findPreference("sim_info");
        preferencegroup.removeAll();
        Preference preference = new Preference(getActivity());
        if (preference != null)
        {
            preference.setTitle(0x7f0b00f1);
            preferencegroup.addPreference(preference);
        }
        getPreferenceScreen().setEnabled(false);
        if (mIsVoiceCapable && isVoipAvailable())
        {
            mVoiceCallSimSetting.setEnabled(true);
            return;
        }
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("finish() sim management for sim hot swap as mSimNum = ").append(mSimNum).toString());
        if ("tablet".equals(SystemProperties.get("ro.build.characteristics")))
        {
            if (!getResources().getBoolean(0x1110007))
            {
                Xlog.i("SimManagementSettings", "[Tablet] It is single pane, so finish it!");
                finish();
                return;
            } else
            {
                Xlog.i("SimManagementSettings", "[Tablet] It is multi pane, so do not finish it!");
                return;
            }
        } else
        {
            finish();
            return;
        }
    }

    private void setPreferenceProperty()
    {
        long l;
        long l1;
        long l2;
        int i;
        int k;
        l = getDataValue("voice_call_sim_setting");
        l1 = getDataValue("sms_sim_setting");
        l2 = getDataValue("gprs_connection_sim_setting");
        i = current3GSlotId();
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("voicecallID =").append(l).append(" smsID =").append(l1).append(" dataconnectionID =").append(l2).append(" videocallSlotID =").append(i).toString());
        int j = 0;
        for (Iterator iterator = mSiminfoList.iterator(); iterator.hasNext(); j++)
        {
            android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
            if (siminfo == null)
                continue;
            if (siminfo.mSimId == l && mIsVoiceCapable)
            {
                mVoiceCallSimSetting.setInitValue(j);
                mVoiceCallSimSetting.setSummary(siminfo.mDisplayName);
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
            if (sVTCallSupport && siminfo.mSlot == i)
            {
                mVideoCallSimSetting.setInitValue(j);
                mVideoCallSimSetting.setSummary(siminfo.mDisplayName);
            }
        }

        k = mSiminfoList.size();
        if (!mIsVoiceCapable) goto _L2; else goto _L1
_L1:
        if (l != -2L) goto _L4; else goto _L3
_L3:
        mVoiceCallSimSetting.setInitValue(k);
        mVoiceCallSimSetting.setSummary(0x7f0b00de);
_L2:
        boolean flag;
        DefaultSimPreference defaultsimpreference;
        DefaultSimPreference defaultsimpreference1;
        int i1;
        if (l1 == -1L)
        {
            mSmsSimSetting.setInitValue(k);
            mSmsSimSetting.setSummary(0x7f0b00dd);
        } else
        if (l1 == -5L)
            mSmsSimSetting.setSummary(0x7f0b058e);
        else
        if (mExt.isNeedsetAutoItem() && l1 == -3L)
        {
            mExt.setPrefProperty(mSmsSimSetting, l1);
            mSmsSimSetting.setInitValue(k + 1);
        }
        if (l2 == 0L)
        {
            mGprsSimSetting.setInitValue(k);
            mGprsSimSetting.setSummary(0x7f0b00df);
        } else
        if (l2 == -5L)
            mGprsSimSetting.setSummary(0x7f0b058e);
        if (!sVTCallSupport)
            break MISSING_BLOCK_LABEL_510;
        if (i == -1)
        {
            mIs3gOff = true;
            mVideoCallSimSetting.setSummary(0x7f0b00e0);
        } else
        {
            mIs3gOff = false;
        }
        if (mTelephony == null)
            break MISSING_BLOCK_LABEL_510;
        defaultsimpreference = mVideoCallSimSetting;
        if (!mIs3gOff && !mTelephony.is3GSwitchLocked() && mSimNum != 1)
            flag = true;
        else
            flag = false;
        defaultsimpreference.setEnabled(flag);
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("mIs3gOff=").append(mIs3gOff).toString());
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("mTelephony.is3GSwitchLocked() is ").append(mTelephony.is3GSwitchLocked()).toString());
        mGprsSimSetting.setEnabled(isGPRSEnable());
        return;
_L4:
        if (l == -1L)
        {
            defaultsimpreference1 = mVoiceCallSimSetting;
            if (sIsVoipAvailable)
                i1 = k + 1;
            else
                i1 = k;
            defaultsimpreference1.setInitValue(i1);
            mVoiceCallSimSetting.setSummary(0x7f0b00dd);
        } else
        if (l == -5L)
        {
            mVoiceCallSimSetting.setInitValue(-5);
            mVoiceCallSimSetting.setSummary(0x7f0b058e);
        }
        continue; /* Loop/switch isn't completed */
        RemoteException remoteexception;
        remoteexception;
        Xlog.e("SimManagementSettings", "mTelephony exception");
        return;
        if (true) goto _L2; else goto _L5
_L5:
    }

    private void setStatusBarEnableStatus(boolean flag)
    {
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("setStatusBarEnableStatus(").append(flag).append(")").toString());
        StatusBarManager statusbarmanager = (StatusBarManager)getSystemService("statusbar");
        if (statusbarmanager != null)
        {
            if (flag)
            {
                statusbarmanager.disable(0);
                return;
            } else
            {
                statusbarmanager.disable(0x1210000);
                return;
            }
        } else
        {
            Xlog.e("SimManagementSettings", "Fail to get status bar instance");
            return;
        }
    }

    private void showDataConnDialog(boolean flag)
    {
        long l;
        if (flag)
            l = 30000L;
        else
            l = 10000L;
        mTimerHandler.sendEmptyMessageDelayed(2000, l);
        showProgressDlg(0x7f0b00f3);
        mIsDataConnectActing = true;
    }

    private void showProgressDlg(int i)
    {
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("showProgressDlg() with dialogMsg = ").append(i).toString());
        mProDlgMsgId = i;
        showDialog(1000);
        setCancelable(false);
    }

    private void switchGeminiPlusSimRadioState(int i)
    {
        Xlog.d("SimManagementSettings", "switchGeminiPlusSimRadioState");
        int j = android.provider.Settings.System.getInt(getContentResolver(), "dual_sim_mode_setting", -1);
        int k = i;
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("The current dual sim mode is ").append(j).append("with slot = ").append(i).toString());
        switch (i)
        {
        case 3: // '\003'
            k = 8;
            break;

        case 2: // '\002'
            k = 4;
            break;

        case 1: // '\001'
            k = 2;
            break;

        case 0: // '\0'
            k = 1;
            break;

        default:
            Xlog.d("SimManagementSettings", (new StringBuilder()).append("error of the slot = ").append(i).toString());
            break;
        }
        int l;
        boolean flag;
        if ((j & k) > 0)
        {
            l = j & getInverseNumber(k);
            flag = false;
        } else
        {
            l = j | k;
            flag = true;
        }
        int i1;
        if (flag)
            i1 = 0x7f0b00e5;
        else
            i1 = 0x7f0b00e6;
        showProgressDlg(i1);
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("dualState=").append(l).append(" isRadioOn=").append(flag).toString());
        android.provider.Settings.System.putInt(getContentResolver(), "dual_sim_mode_setting", l);
        Intent intent = new Intent("android.intent.action.DUAL_SIM_MODE");
        intent.putExtra("mode", l);
        getActivity().sendBroadcast(intent);
    }

    private void switchGprsDefautlSIM(long l)
    {
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("switchGprsDefautlSIM() with simid=").append(l).toString());
        if (l >= 0L && (l <= 0L || isSimInsertedIn(l)))
        {
            boolean flag;
            if (l > 0L)
                flag = true;
            else
                flag = false;
            long l1 = android.provider.Settings.System.getLong(getContentResolver(), "gprs_connection_sim_setting", -5L);
            Xlog.d("SimManagementSettings", (new StringBuilder()).append("curConSimId=").append(l1).toString());
            if (l != l1)
            {
                Intent intent = new Intent("android.intent.action.DATA_DEFAULT_SIM");
                intent.putExtra("simid", l);
                getActivity().sendBroadcast(intent);
                showDataConnDialog(flag);
                return;
            }
        } else
        {
            Xlog.d("SimManagementSettings", (new StringBuilder()).append("simid = ").append(l).append(" not available anymore").toString());
        }
    }

    private void switchSimRadioState(int i, boolean flag)
    {
label0:
        {
            Xlog.d("SimManagementSettings", "switchSimRadioState");
            int j = android.provider.Settings.System.getInt(getContentResolver(), "dual_sim_mode_setting", -1);
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("The current dual sim mode is ").append(j).toString());
            mExt.setToClosedSimSlot(-1);
            int k;
            boolean flag1;
            switch (j)
            {
            default:
                break label0;

            case 3: // '\003'
                if (!flag)
                {
                    if (i == 0)
                    {
                        k = 2;
                        mExt.setToClosedSimSlot(0);
                    } else
                    {
                        k = 0;
                        if (i == 1)
                        {
                            k = 1;
                            mExt.setToClosedSimSlot(1);
                        }
                    }
                    Xlog.d("SimManagementSettings", (new StringBuilder()).append("Turning off only sim ").append(i).toString());
                    flag1 = false;
                } else
                {
                    Xlog.d("SimManagementSettings", "try to turn on but actually they are all on");
                    k = j;
                    flag1 = true;
                }
                break;

            case 2: // '\002'
                if (i == 1)
                {
                    if (flag)
                    {
                        Xlog.d("SimManagementSettings", "try to turn on slot 2 again since it is already on");
                        k = j;
                        flag1 = true;
                    } else
                    {
                        k = 0;
                        flag1 = false;
                    }
                    Xlog.d("SimManagementSettings", (new StringBuilder()).append("Turning off sim ").append(i).append(" and all sim radio is off").toString());
                } else
                {
                    k = 0;
                    flag1 = false;
                    if (i == 0)
                    {
                        if (mIsSlot2Insert)
                        {
                            k = 3;
                            Xlog.d("SimManagementSettings", (new StringBuilder()).append("sim 1 was radio on and now turning on sim ").append(i).toString());
                        } else
                        {
                            k = 1;
                            Xlog.d("SimManagementSettings", (new StringBuilder()).append("Turning on only sim ").append(i).toString());
                        }
                        flag1 = true;
                    }
                }
                break;

            case 1: // '\001'
                if (i == 0)
                {
                    if (flag)
                    {
                        Xlog.d("SimManagementSettings", "try to turn on slot 1 again since it is already on");
                        k = j;
                        flag1 = true;
                    } else
                    {
                        k = 0;
                        flag1 = false;
                    }
                    Xlog.d("SimManagementSettings", (new StringBuilder()).append("Turning off sim ").append(i).append(" and all sim radio is off").toString());
                } else
                {
                    k = 0;
                    flag1 = false;
                    if (i == 1)
                    {
                        if (mIsSlot1Insert)
                        {
                            k = 3;
                            Xlog.d("SimManagementSettings", (new StringBuilder()).append("sim 0 was radio on and now turning on sim ").append(i).toString());
                        } else
                        {
                            k = 2;
                            Xlog.d("SimManagementSettings", (new StringBuilder()).append("Turning on only sim ").append(i).toString());
                        }
                        flag1 = true;
                    }
                }
                break;

            case 0: // '\0'
                if (i == 0)
                {
                    k = 1;
                } else
                {
                    k = 0;
                    if (i == 1)
                        k = 2;
                }
                Xlog.d("SimManagementSettings", (new StringBuilder()).append("Turning on only sim ").append(i).toString());
                flag1 = true;
                break;
            }
            int l;
            if (flag1)
                l = 0x7f0b00e5;
            else
                l = 0x7f0b00e6;
            showProgressDlg(l);
            Xlog.d("SimManagementSettings", (new StringBuilder()).append("dualState=").append(k).append(" isRadioOn=").append(flag1).toString());
            android.provider.Settings.System.putInt(getContentResolver(), "dual_sim_mode_setting", k);
            Intent intent = new Intent("android.intent.action.DUAL_SIM_MODE");
            intent.putExtra("mode", k);
            getActivity().sendBroadcast(intent);
            return;
        }
        Xlog.d("SimManagementSettings", "Error not correct values");
    }

    private void switchVideoCallDefaultSIM(long l)
    {
        android.provider.Telephony.SIMInfo siminfo;
label0:
        {
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("switchVideoCallDefaultSIM to ").append(l).toString());
            if (mTelephony != null)
            {
                siminfo = findSIMInfoBySimId(l);
                Xlog.i("SimManagementSettings", (new StringBuilder()).append("siminfo = ").append(siminfo).toString());
                if (siminfo != null)
                    break label0;
                Xlog.d("SimManagementSettings", "Error no corrent siminfo found");
            }
            return;
        }
        try
        {
            Xlog.i("SimManagementSettings", (new StringBuilder()).append("set sim slot ").append(siminfo.mSlot).append(" with 3G capability").toString());
            if (mTelephony.set3GCapabilitySIM(siminfo.mSlot))
            {
                showProgressDlg(0x7f0b00f4);
                mTimerHandler.sendEmptyMessageDelayed(2002, 60000L);
                return;
            }
        }
        catch (RemoteException remoteexception)
        {
            Xlog.e("SimManagementSettings", "mTelephony exception");
            return;
        }
        updateVideoCallDefaultSIM();
        return;
    }

    private void updateDataConnPrefe()
    {
        long l = android.provider.Settings.System.getLong(getContentResolver(), "gprs_connection_sim_setting", -5L);
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("Gprs connection SIM changed with simid is ").append(l).toString());
        if (l == 0L)
        {
            mGprsSimSetting.setInitValue(mSiminfoList.size());
            mGprsSimSetting.setSummary(0x7f0b00df);
            return;
        }
        if (l > 0L)
        {
            int i = findListPosBySimId(l);
            android.provider.Telephony.SIMInfo siminfo = findSIMInfoBySimId(l);
            if (siminfo == null)
            {
                Xlog.d("SimManagementSettings", "Error no correct siminfo get...");
                return;
            } else
            {
                mGprsSimSetting.setInitValue(i);
                mGprsSimSetting.setSummary(siminfo.mDisplayName);
                return;
            }
        } else
        {
            Xlog.d("SimManagementSettings", "Error wrong simid need to check...");
            return;
        }
    }

    private void updateDefaultSIMSummary(DefaultSimPreference defaultsimpreference, Long long1)
    {
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("updateDefaultSIMSummary() with simid=").append(long1).toString());
        if (long1.longValue() > 0L)
        {
            android.provider.Telephony.SIMInfo siminfo = getSIMInfoById(long1);
            if (siminfo != null)
                defaultsimpreference.setSummary(siminfo.mDisplayName);
        } else
        {
            if (long1.longValue() == -2L)
            {
                defaultsimpreference.setSummary(0x7f0b00de);
                return;
            }
            if (long1.longValue() == -1L)
            {
                defaultsimpreference.setSummary(0x7f0b00dd);
                return;
            }
            if (long1.longValue() == 0L)
            {
                defaultsimpreference.setSummary(0x7f0b00df);
                return;
            }
            if (long1.longValue() == -3L)
            {
                mExt.updateDefaultSIMSummary(defaultsimpreference, long1);
                return;
            }
        }
    }

    private void updatePreferenceUI()
    {
        if (isResumed())
        {
            Xlog.d("SimManagementSettings", "updatePreferenceUI() and update UI");
            PreferenceScreen preferencescreen = getPreferenceScreen();
            boolean flag;
            if (mSimNum > 0)
                flag = true;
            else
                flag = false;
            preferencescreen.setEnabled(flag);
            initDefaultSimPreference();
            setPreferenceProperty();
            if (mSimNum > 0)
            {
                addSimInfoPreference();
                return;
            } else
            {
                setNoSimInfoUi();
                return;
            }
        } else
        {
            Xlog.d("SimManagementSettings", "on backgroud no need update preference");
            return;
        }
    }

    private void updateVideoCallDefaultSIM()
    {
        Xlog.d("SimManagementSettings", "updateVideoCallDefaultSIM()");
        if (mTelephony == null)
            break MISSING_BLOCK_LABEL_139;
        int i;
        i = mTelephony.get3GCapabilitySIM();
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("updateVideoCallDefaultSIM()---slotId=").append(i).toString());
        if (i < 0)
            return;
        android.provider.Telephony.SIMInfo siminfo = findSIMInofBySlotId(i);
        if (siminfo == null)
            break MISSING_BLOCK_LABEL_122;
        int j = findListPosBySimId(siminfo.mSimId);
        if (j >= 0)
        {
            try
            {
                mVideoCallSimSetting.setInitValue(j);
                mVideoCallSimSetting.setSummary(siminfo.mDisplayName);
                return;
            }
            catch (RemoteException remoteexception)
            {
                Xlog.e("SimManagementSettings", "mTelephony exception");
            }
            return;
        }
        break MISSING_BLOCK_LABEL_139;
        Xlog.d("SimManagementSettings", "mVideoCallSimSetting.setInitValue(-1)");
        mVideoCallSimSetting.setInitValue(-1);
    }

    protected void initDefaultSimPreference()
    {
        Xlog.d("SimManagementSettings", "initDefaultSimPreference()");
        mSimItemListVoice.clear();
        mSimItemListVideo.clear();
        mSimItemListSms.clear();
        mSimItemListGprs.clear();
        Iterator iterator = mSiminfoList.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
            if (siminfo != null)
            {
                SimItem simitem4 = new SimItem(siminfo);
                simitem4.mState = getSimIndicator(siminfo.mSlot);
                if (isRadioOff())
                {
                    Xlog.d("SimManagementSettings", "Force the state to be radio off as airplane mode or dual sim mode");
                    simitem4.mState = 1;
                }
                mSimItemListVoice.add(simitem4);
                mSimItemListSms.add(simitem4);
                mSimItemListGprs.add(simitem4);
                if (sVTCallSupport)
                    mSimItemListVideo.add(simitem4);
            }
        } while (true);
        if (sIsVoipAvailable)
        {
            Xlog.d("SimManagementSettings", "set internet call item");
            SimItem simitem3 = new SimItem(getString(0x7f0b00de), 8, -2L);
            mSimItemListVoice.add(simitem3);
        }
        SimItem simitem = new SimItem(getString(0x7f0b00dd), -1, -1L);
        if (mSimItemListVoice.size() > 1)
            mSimItemListVoice.add(simitem);
        else
        if (mSimItemListVoice.size() == 1 && sIsVoipAvailable)
        {
            Xlog.d("SimManagementSettings", "no sim card inserted but internet call is on");
            mSimItemListVoice.add(simitem);
        }
        if (mSimItemListSms.size() > 1)
            mSimItemListSms.add(simitem);
        if (mExt.isNeedsetAutoItem() && mSimItemListSms.size() > 1)
        {
            SimItem simitem2 = new SimItem(mExt.getAutoString(), -1, -3L);
            mSimItemListSms.add(simitem2);
        }
        SimItem simitem1 = new SimItem(getString(0x7f0b00df), -1, 0L);
        if (isRadioOff())
            simitem1.mState = 1;
        mSimItemListGprs.add(simitem1);
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("mSimItemListVoice.size=").append(mSimItemListVoice.size()).append(" mSimItemListVideo.size=").append(mSimItemListVideo.size()).append(" mSimItemListSms.size=").append(mSimItemListSms.size()).append(" mSimItemListSms.size=").append(mSimItemListGprs.size()).toString());
        if (sVTCallSupport)
            if (mSimItemListVideo.size() == 1)
            {
                mVideoCallSimSetting.setEnabled(false);
            } else
            {
                mVideoCallSimSetting.setInitData(mSimItemListVideo);
                mVideoCallSimSetting.setEnabled(true);
            }
        if (mIsVoiceCapable)
            if (mSimItemListVoice.size() == 1)
            {
                mVoiceCallSimSetting.setEnabled(false);
            } else
            {
                mVoiceCallSimSetting.setInitData(mSimItemListVoice);
                mVoiceCallSimSetting.setEnabled(true);
            }
        if (mSimItemListSms.size() == 1)
        {
            mSmsSimSetting.setEnabled(false);
        } else
        {
            mSmsSimSetting.setInitData(mSimItemListSms);
            mSmsSimSetting.setEnabled(true);
        }
        if (mSimNum == 1)
            mSimAndContacts.setEnabled(false);
        else
        if (mSimNum > 1)
            mSimAndContacts.setEnabled(true);
        mGprsSimSetting.setInitData(mSimItemListGprs);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050036);
        Xlog.d("SimManagementSettings", "onCreate Sim Management");
        Xlog.d("SimManagementSettings", "MTK_VT3G324M_SUPPORT=falseMTK_GEMINI_3G_SWITCH=false");
        sVTCallSupport = false;
        mConnService = ConnectivityManager.from(getActivity());
        mTelephonyManager = (TelephonyManager)getSystemService("phone");
        mTelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        Xlog.d("SimManagementSettings", "FeatureOption.MTK_GEMINI_3G_SWITCH=false");
        PreferenceGroup preferencegroup = (PreferenceGroup)findPreference("general_settings");
        mExt = Utils.getSimManagmentExtPlugin(getActivity());
        mExt.updateSimManagementPref(preferencegroup);
        initIntentFilter();
        mVoiceCallSimSetting = (DefaultSimPreference)findPreference("voice_call_sim_setting");
        mVideoCallSimSetting = (DefaultSimPreference)findPreference("video_call_sim_setting");
        mSmsSimSetting = (DefaultSimPreference)findPreference("sms_sim_setting");
        mGprsSimSetting = (DefaultSimPreference)findPreference("gprs_sim_setting");
        setIconForDefaultSimPref();
        mSimAndContacts = (PreferenceScreen)findPreference("contacts_sim");
        mVoiceCallSimSetting.setType(1);
        mVoiceCallSimSetting.setOnPreferenceChangeListener(this);
        mVideoCallSimSetting.setType(2);
        mVideoCallSimSetting.setOnPreferenceChangeListener(this);
        mSmsSimSetting.setType(3);
        mSmsSimSetting.setOnPreferenceChangeListener(this);
        mGprsSimSetting.setType(4);
        mGprsSimSetting.setOnPreferenceChangeListener(this);
        mCellConnMgr = new CellConnMgr();
        mCellConnMgr.register(getActivity());
        mGprsSimSetting.setCellConnMgr(mCellConnMgr);
        try
        {
            if (mTelephony != null)
                mTelephony.registerForSimModeChange(mSwitchRadioStateMsg.getBinder(), 1);
        }
        catch (RemoteException remoteexception)
        {
            Xlog.e("SimManagementSettings", "mTelephony exception");
            return;
        }
        getActivity().registerReceiver(mSimReceiver, mIntentFilter);
        if (bundle != null)
        {
            mDataSwitchMsgIndex = bundle.getInt("confirm_dialog_msg_id", -1);
            mProDlgMsgId = bundle.getInt("progress_dialog_msg_id", -1);
            if (mProDlgMsgId != -1)
            {
                Xlog.d("SimManagementSettings", "mProDlgMsgId != -1 to remove dialog");
                noNeedRestoreProgDlg = true;
            }
            Xlog.d("SimManagementSettings", (new StringBuilder()).append("onrestore the dailog msg id with mDataSwitchMsgIndex = ").append(mDataSwitchMsgIndex).append(" mProDlgMsgId = ").append(mProDlgMsgId).toString());
        }
    }

    public Dialog onCreateDialog(int i)
    {
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("onCreateDialog() with id = ").append(i).toString());
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(getActivity());
        switch (i)
        {
        case 1001: 
            builder.setTitle(0x1040014);
            builder.setIcon(0x1080027);
            builder.setMessage(getResources().getString(0x7f0b00f5));
            builder.setPositiveButton(0x1040013, new android.content.DialogInterface.OnClickListener() {

                final SimManagement this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    switchVideoCallDefaultSIM(mSelectedVideoSimId);
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

        case 1002: 
            builder.setTitle(0x1040014);
            builder.setIcon(0x1080027);
            builder.setMessage(getResources().getString(mDataSwitchMsgIndex));
            builder.setPositiveButton(0x1040013, new android.content.DialogInterface.OnClickListener() {

                final SimManagement this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    if (mDataSwitchMsgIndex == 0x7f0b00fc)
                        enableDataRoaming(mSelectedGprsSimId);
                    switchGprsDefautlSIM(mSelectedGprsSimId);
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
                    updateDataConnPrefe();
                }

            
            {
                this$0 = SimManagement.this;
                super();
            }
            }
);
            return builder.create();

        case 1000: 
            ProgressDialog progressdialog = new ProgressDialog(getActivity());
            progressdialog.setMessage(getResources().getString(mProDlgMsgId));
            progressdialog.setIndeterminate(true);
            if (mProDlgMsgId == 0x7f0b00f4)
            {
                Xlog.d("SimManagementSettings", "3G switch to dispatch home key");
                Window window = progressdialog.getWindow();
                android.view.WindowManager.LayoutParams layoutparams = window.getAttributes();
                layoutparams.flags = 0x80000000 | layoutparams.flags;
                window.setAttributes(layoutparams);
                setStatusBarEnableStatus(false);
            }
            return progressdialog;
        }
        return null;
    }

    public void onDestroy()
    {
        super.onDestroy();
        Xlog.d("SimManagementSettings", "onDestroy()");
        getActivity().unregisterReceiver(mSimReceiver);
        try
        {
            if (mTelephony != null)
                mTelephony.unregisterForSimModeChange(mSwitchRadioStateMsg.getBinder());
        }
        catch (RemoteException remoteexception)
        {
            Xlog.e("SimManagementSettings", "mTelephony exception");
            return;
        }
        mCellConnMgr.unregister();
        mTimerHandler.removeMessages(2000);
        mTimerHandler.removeMessages(2001);
        mTimerHandler.removeMessages(2002);
        mTimerHandler.removeMessages(1);
    }

    public void onPause()
    {
        super.onPause();
        Xlog.d("SimManagementSettings", "OnPause()");
        getContentResolver().unregisterContentObserver(mGprsDefaultSIMObserver);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        String s = preference.getKey();
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("Enter onPreferenceChange function with ").append(s).toString());
        if ("voice_call_sim_setting".equals(s))
        {
            android.provider.Settings.System.putLong(getContentResolver(), "voice_call_sim_setting", ((Long)obj).longValue());
            Intent intent1 = new Intent("android.intent.action.VOICE_CALL_DEFAULT_SIM");
            intent1.putExtra("simid", (Long)obj);
            getActivity().sendBroadcast(intent1);
            Xlog.d("SimManagementSettings", (new StringBuilder()).append("send broadcast voice call change with simid=").append((Long)obj).toString());
            updateDefaultSIMSummary(mVoiceCallSimSetting, (Long)obj);
        } else
        if (!"video_call_sim_setting".equals(s))
            if ("sms_sim_setting".equals(s))
            {
                android.provider.Settings.System.putLong(getContentResolver(), "sms_sim_setting", ((Long)obj).longValue());
                Intent intent = new Intent("android.intent.action.SMS_DEFAULT_SIM");
                intent.putExtra("simid", (Long)obj);
                getActivity().sendBroadcast(intent);
                Xlog.d("SimManagementSettings", (new StringBuilder()).append("send broadcast sms change with simid=").append((Long)obj).toString());
                updateDefaultSIMSummary(mSmsSimSetting, (Long)obj);
            } else
            if ("gprs_sim_setting".equals(s))
            {
                long l = ((Long)obj).longValue();
                Xlog.d("SimManagementSettings", (new StringBuilder()).append("value=").append(l).toString());
                if (l == 0L)
                    mDataSwitchMsgIndex = -1;
                else
                    mDataSwitchMsgIndex = dataSwitchConfirmDlgMsg(l);
                if (mDataSwitchMsgIndex != -1)
                {
                    mSelectedGprsSimId = l;
                    showDialog(1002);
                    setOnCancelListener(new android.content.DialogInterface.OnCancelListener() {

                        final SimManagement this$0;

                        public void onCancel(DialogInterface dialoginterface)
                        {
                            updateDataConnPrefe();
                        }

            
            {
                this$0 = SimManagement.this;
                super();
            }
                    }
);
                } else
                {
                    switchGprsDefautlSIM(l);
                }
            }
        return true;
    }

    public void onPreferenceClick(long l)
    {
        Bundle bundle = new Bundle();
        bundle.putLong("simid", l);
        startFragment(this, com/mediatek/gemini/SimInfoEditor.getCanonicalName(), -1, bundle, 0x7f0b00cf);
        Xlog.i("SimManagementSettings", (new StringBuilder()).append("startFragment ").append(com/mediatek/gemini/SimInfoEditor.getCanonicalName()).toString());
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if ("contacts_sim".equals(preference.getKey()))
            if (mSiminfoList.size() == 1)
            {
                android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)mSiminfoList.get(0);
                if (siminfo != null)
                {
                    Intent intent = new Intent();
                    intent.setClassName("com.android.settings", "com.mediatek.gemini.GeminiSIMTetherInfo");
                    int i = siminfo.mSlot;
                    Xlog.d("SimManagementSettings", (new StringBuilder()).append("Enter sim contanct of sim ").append(siminfo.mSlot).toString());
                    if (i >= 0)
                    {
                        intent.putExtra("simid", siminfo.mSimId);
                        mSimAndContacts.setIntent(intent);
                    }
                }
            } else
            {
                Bundle bundle = new Bundle();
                bundle.putInt("type", 3);
                startFragment(this, com/mediatek/gemini/SimListEntrance.getCanonicalName(), -1, bundle, 0x7f0b00d7);
                Xlog.i("SimManagementSettings", "startFragment(this, SimListEntrance.class.getCanonicalName(), -1, extras);");
            }
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }

    public void onResume()
    {
        super.onResume();
        Xlog.d("SimManagementSettings", "onResume()");
        if (noNeedRestoreProgDlg)
        {
            Xlog.d("SimManagementSettings", "Unexpected is killed so restore the state but for progess dialog no need as the state has lost");
            removeDialog(1000);
            noNeedRestoreProgDlg = false;
        }
        mIsVoiceCapable = mTelephonyManager.isVoiceCapable();
        mIsSmsCapable = mTelephonyManager.isSmsCapable();
        sIsVoipAvailable = isVoipAvailable();
        Xlog.d("SimManagementSettings", (new StringBuilder()).append("mIsVoiceCapable=").append(mIsVoiceCapable).append(" mIsSmsCapable=").append(mIsSmsCapable).append(" sVTCallSupport=").append(sVTCallSupport).append(" sIsVoipAvailable=").append(sIsVoipAvailable).toString());
        getSimInfo();
        removeUnusedPref();
        updatePreferenceUI();
        getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("gprs_connection_sim_setting"), false, mGprsDefaultSIMObserver);
        dealDialogOnResume();
        mExt.dealWithDataConnChanged(null, isResumed());
    }

    public void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        if (isDialogShowing(1000))
            bundle.putInt("progress_dialog_msg_id", mProDlgMsgId);
        else
        if (isDialogShowing(1002))
        {
            bundle.putInt("confirm_dialog_msg_id", mDataSwitchMsgIndex);
            return;
        }
    }














/*
    static boolean access$1802(SimManagement simmanagement, boolean flag)
    {
        simmanagement.mIsSIMRadioSwitching = flag;
        return flag;
    }

*/





/*
    static boolean access$202(SimManagement simmanagement, boolean flag)
    {
        simmanagement.mIsDataConnectActing = flag;
        return flag;
    }

*/













}
