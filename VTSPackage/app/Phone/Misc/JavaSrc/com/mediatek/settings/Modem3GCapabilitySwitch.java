// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.os.*;
import android.preference.*;
import android.view.MenuItem;
import android.view.Window;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.PhoneFactory;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.phone.PhoneGlobals;
import com.android.phone.PhoneInterfaceManager;
import com.mediatek.phone.ext.ExtensionManager;
import com.mediatek.phone.ext.SettingsExtension;
import com.mediatek.xlog.Xlog;
import java.util.List;

// Referenced classes of package com.mediatek.settings:
//            CallSettings, ServiceSelectList

public class Modem3GCapabilitySwitch extends PreferenceActivity
    implements android.preference.Preference.OnPreferenceChangeListener
{
    class ModemSwitchReceiver extends BroadcastReceiver
    {

        final Modem3GCapabilitySwitch this$0;

        public void onReceive(Context context, Intent intent)
        {
label0:
            {
                String s = intent.getAction();
                if (GeminiPhone.EVENT_3G_SWITCH_LOCK_CHANGED.equals(s))
                {
                    Xlog.d("Settings/Modem3GCapabilitySwitch", "receives EVENT_3G_SWITCH_LOCK_CHANGED...");
                    intent.getBooleanExtra(GeminiPhone.EXTRA_3G_SWITCH_LOCKED, false);
                    updateItemStatus();
                } else
                if (GeminiPhone.EVENT_PRE_3G_SWITCH.equals(s))
                {
                    Xlog.d("Settings/Modem3GCapabilitySwitch", (new StringBuilder()).append("Starting the switch......@").append(this).toString());
                    showSwitchProgress();
                    showInstanceIndex("Receive starting switch broadcast");
                    setStatusBarEnableStatus(false);
                    mTimerHandler.sendEmptyMessageDelayed(1000, 60000L);
                    if (mNetworkMode.getDialog() != null)
                    {
                        mNetworkMode.getDialog().dismiss();
                        return;
                    }
                } else
                {
                    if (GeminiPhone.EVENT_3G_SWITCH_DONE.equals(s))
                    {
                        Xlog.d("Settings/Modem3GCapabilitySwitch", (new StringBuilder()).append("Done the switch......@").append(this).toString());
                        showInstanceIndex("Receive switch done broadcast");
                        clearAfterSwitch(intent);
                        mTimerHandler.removeMessages(1000);
                        return;
                    }
                    if ("android.intent.action.AIRPLANE_MODE".equals(s) || s.equals("android.intent.action.SIM_INDICATOR_STATE_CHANGED"))
                        break label0;
                    if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
                    {
                        Xlog.d("Settings/Modem3GCapabilitySwitch", "ACTION_SIM_INFO_UPDATE received");
                        if (android.provider.Telephony.SIMInfo.getInsertedSIMList(Modem3GCapabilitySwitch.this).size() > 0)
                        {
                            mServiceList.refreshList();
                            int i = mPhoneMgr.get3GCapabilitySIM();
                            long l;
                            if (i == -1)
                            {
                                l = i;
                            } else
                            {
                                android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(Modem3GCapabilitySwitch.this, i);
                                if (siminfo != null)
                                    l = siminfo.mSimId;
                                else
                                    l = -2L;
                            }
                            updateSummarys(l);
                            updateNetworkMode();
                            return;
                        } else
                        {
                            finish();
                            return;
                        }
                    }
                }
                return;
            }
            boolean flag = intent.getBooleanExtra("state", false);
            Xlog.d("Settings/Modem3GCapabilitySwitch", (new StringBuilder()).append("airplaneMode new  state is [").append(flag).append("]").toString());
            updateNetworkMode();
            update3GService();
            mServiceList.refreshList();
        }

        ModemSwitchReceiver()
        {
            this$0 = Modem3GCapabilitySwitch.this;
            super();
        }
    }

    private class MyHandler extends Handler
    {

        private static final int MESSAGE_GET_PREFERRED_NETWORK_TYPE = 0;
        private static final int MESSAGE_SET_PREFERRED_NETWORK_TYPE = 1;
        final Modem3GCapabilitySwitch this$0;

        private void handleGetPreferredNetworkTypeResponse(Message message)
        {
            Xlog.d("Settings/Modem3GCapabilitySwitch", "[handleGetPreferredNetworkTypeResponse]");
            if (mPD != null && mPD.isShowing() && message.arg2 == 1)
                mPD.dismiss();
            AsyncResult asyncresult = (AsyncResult)message.obj;
            if (asyncresult.exception == null)
            {
                int i = ((int[])(int[])asyncresult.result)[0];
                Xlog.d("Settings/Modem3GCapabilitySwitch", (new StringBuilder()).append("handleGetPreferredNetworkTypeResponse: modemNetworkMode = ").append(i).toString());
                int j = android.provider.Settings.Global.getInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", 0);
                Xlog.d("Settings/Modem3GCapabilitySwitch", (new StringBuilder()).append("handleGetPreferredNetworkTypeReponse: settingsNetworkMode = ").append(j).toString());
                if (i != 0 && i != 1 && i != 2 && i != 3 && i != 4 && i != 5 && i != 6 && i != 7)
                {
                    Xlog.d("Settings/Modem3GCapabilitySwitch", "handleGetPreferredNetworkTypeResponse: else: reset to default");
                    resetNetworkModeToDefault();
                    return;
                }
                Xlog.d("Settings/Modem3GCapabilitySwitch", (new StringBuilder()).append("handleGetPreferredNetworkTypeResponse: if 1: modemNetworkMode = ").append(i).toString());
                if (i != j)
                {
                    Xlog.d("Settings/Modem3GCapabilitySwitch", "handleGetPreferredNetworkTypeResponse: if 2: modemNetworkMode != settingsNetworkMode");
                    int k = i;
                    Xlog.d("Settings/Modem3GCapabilitySwitch", (new StringBuilder()).append("handleGetPreferredNetworkTypeResponse: if 2: settingsNetworkMode = ").append(k).toString());
                    android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", k);
                }
                if (i == 3)
                    i = 0;
                mNetworkMode.setValue(Integer.toString(i));
                updatePreferredNetworkModeSummary(i);
                return;
            } else
            {
                Xlog.i("Settings/Modem3GCapabilitySwitch", "handleGetPreferredNetworkTypeResponse(), response exist exception");
                return;
            }
        }

        private void handleSetPreferredNetworkTypeResponse(Message message)
        {
            Xlog.d("Settings/Modem3GCapabilitySwitch", "-------------[handleSetPreferredNetworkTypeResponse]--------------");
            AsyncResult _tmp = (AsyncResult)message.obj;
            int i = mPhoneMgr.get3GCapabilitySIM();
            if (CallSettings.isMultipleSim())
            {
                mGeminiPhone.getPreferredNetworkTypeGemini(obtainMessage(0, 1001, 1, null), i);
                return;
            } else
            {
                mPhone.getPreferredNetworkType(obtainMessage(0, 1001, 1, null));
                return;
            }
        }

        private void resetNetworkModeToDefault()
        {
            mNetworkMode.setValue(Integer.toString(0));
            android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", 0);
            int i = mPhoneMgr.get3GCapabilitySIM();
            if (CallSettings.isMultipleSim())
            {
                mGeminiPhone.setPreferredNetworkTypeGemini(0, obtainMessage(1), i);
                return;
            } else
            {
                mPhone.setPreferredNetworkType(0, obtainMessage(1));
                return;
            }
        }

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 1: // '\001'
                handleSetPreferredNetworkTypeResponse(message);
                return;

            case 0: // '\0'
                handleGetPreferredNetworkTypeResponse(message);
                return;
            }
        }

        private MyHandler()
        {
            this$0 = Modem3GCapabilitySwitch.this;
            super();
        }

    }


    private static final boolean DBG = true;
    public static final String NETWORK_MODE_KEY = "preferred_network_mode_key";
    public static final String SERVICE_LIST_KEY = "preferred_3g_service_key";
    private static final int SIMID_3G_SERVICE_NOT_SET = -2;
    private static final int SIMID_3G_SERVICE_OFF = -1;
    private static final int SWITCH_3G_TIME_OUT_MSG = 1000;
    private static final int SWITCH_3G_TIME_OUT_VALUE = 60000;
    private static final String TAG = "Settings/Modem3GCapabilitySwitch";
    private static int sInstanceFlag = 0;
    private SettingsExtension mExtension;
    private GeminiPhone mGeminiPhone;
    MyHandler mHandler;
    private int mInstanceIndex;
    private ListPreference mNetworkMode;
    private ProgressDialog mPD;
    private ProgressDialog mPDSwitching;
    private Phone mPhone;
    PhoneInterfaceManager mPhoneMgr;
    private ServiceSelectList mServiceList;
    private ModemSwitchReceiver mSlr;
    private StatusBarManager mStatusBarManager;
    private Handler mTimerHandler;

    public Modem3GCapabilitySwitch()
    {
        mServiceList = null;
        mNetworkMode = null;
        mPhoneMgr = null;
        mStatusBarManager = null;
        mPD = null;
        mPDSwitching = null;
        mInstanceIndex = 0;
        mTimerHandler = new Handler() {

            final Modem3GCapabilitySwitch this$0;

            public void handleMessage(Message message)
            {
                if (1000 == message.what)
                {
                    Xlog.d("TEST", "3G switch time out remove the progress dialog");
                    disSwitchProgressDialog();
                    setStatusBarEnableStatus(true);
                }
            }

            
            {
                this$0 = Modem3GCapabilitySwitch.this;
                super();
            }
        }
;
        int i = 1 + sInstanceFlag;
        sInstanceFlag = i;
        mInstanceIndex = i;
        Xlog.i("Settings/Modem3GCapabilitySwitch", (new StringBuilder()).append("Modem3GCapabilitySwitch(), instanceIndex=").append(mInstanceIndex).toString());
    }

    private void disSwitchProgressDialog()
    {
        Xlog.d("Settings/Modem3GCapabilitySwitch", "disSwitchProgressDialog()");
        if (mPDSwitching != null && mPDSwitching.isShowing())
        {
            Xlog.d("Settings/Modem3GCapabilitySwitch", "disSwitchProgressDialog(), take effect");
            mPDSwitching.dismiss();
            mPDSwitching = null;
            return;
        }
        StringBuilder stringbuilder = (new StringBuilder()).append("pdSwitching != null?");
        boolean flag;
        if (mPDSwitching != null)
            flag = true;
        else
            flag = false;
        Xlog.d("Settings/Modem3GCapabilitySwitch", stringbuilder.append(flag).toString());
    }

    private void handleServiceSwitch(long l)
    {
        if (mPhoneMgr.is3GSwitchLocked())
        {
            Xlog.d("Settings/Modem3GCapabilitySwitch", "Switch has been locked, return");
            return;
        }
        Xlog.d("Settings/Modem3GCapabilitySwitch", (new StringBuilder()).append("handleServiceSwitch(").append(l).append("), show switching dialog first").toString());
        showSwitchProgress();
        setStatusBarEnableStatus(false);
        int i = -1;
        if (l != -1L)
        {
            android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(this, l);
            if (siminfo == null)
                i = -1;
            else
                i = siminfo.mSlot;
        }
        if (mPhoneMgr.set3GCapabilitySIM(i))
        {
            Xlog.d("Settings/Modem3GCapabilitySwitch", "Receive ok for the switch, and starting the waiting...");
            return;
        } else
        {
            Xlog.d("Settings/Modem3GCapabilitySwitch", "Receive error for the switch & Dismiss switching didalog");
            disSwitchProgressDialog();
            setStatusBarEnableStatus(true);
            return;
        }
    }

    private void setStatusBarEnableStatus(boolean flag)
    {
        Xlog.i("Settings/Modem3GCapabilitySwitch", (new StringBuilder()).append("setStatusBarEnableStatus(").append(flag).append(")").toString());
        if (mStatusBarManager == null)
            mStatusBarManager = (StatusBarManager)getSystemService("statusbar");
        if (mStatusBarManager != null)
        {
            if (flag)
            {
                mStatusBarManager.disable(0);
                return;
            } else
            {
                mStatusBarManager.disable(0x1210000);
                return;
            }
        } else
        {
            Xlog.e("Settings/Modem3GCapabilitySwitch", "Fail to get status bar instance");
            return;
        }
    }

    private void showInstanceIndex(String s)
    {
        Xlog.i("Settings/Modem3GCapabilitySwitch", (new StringBuilder()).append("Instance[").append(mInstanceIndex).append("]: ").append(s).toString());
    }

    private void showProgressDialog()
    {
        mPD = new ProgressDialog(this);
        mPD.setMessage(getText(0x7f0d01df));
        mPD.setCancelable(false);
        mPD.setIndeterminate(true);
        mPD.show();
    }

    private void update3GService()
    {
        boolean flag = true;
        if (!mPhoneMgr.is3GSwitchLocked() && CallSettings.isMultipleSim())
        {
            int i;
            if (android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", -1) == flag)
                i = ((flag) ? 1 : 0);
            else
                i = 0;
            ServiceSelectList serviceselectlist = mServiceList;
            if (i != 0)
                flag = false;
            serviceselectlist.setEnabled(flag);
            if (i != 0)
            {
                mServiceList.dismissDialogs();
                return;
            }
        }
    }

    private void updateItemStatus()
    {
        boolean flag = true;
        boolean flag1 = mPhoneMgr.is3GSwitchLocked();
        Xlog.d("Settings/Modem3GCapabilitySwitch", (new StringBuilder()).append("updateItemStatus(), is3GSwitchLocked()?").append(flag1).toString());
        if (mServiceList != null)
        {
            ServiceSelectList serviceselectlist = mServiceList;
            boolean flag2;
            if (!flag1)
                flag2 = flag;
            else
                flag2 = false;
            serviceselectlist.setEnabled(flag2);
        }
        if (mNetworkMode != null)
        {
            int i = mPhoneMgr.get3GCapabilitySIM();
            android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(this, i);
            ListPreference listpreference = mNetworkMode;
            if (flag1 || siminfo == null || !CallSettings.isRadioOn(i))
                flag = false;
            listpreference.setEnabled(flag);
            if (!mNetworkMode.isEnabled())
                mNetworkMode.setSummary("");
        }
    }

    private void updateNetworkMode()
    {
        if (mNetworkMode == null)
            return;
        int i = mPhoneMgr.get3GCapabilitySIM();
        boolean flag = mPhoneMgr.is3GSwitchLocked();
        Xlog.d("Settings/Modem3GCapabilitySwitch", (new StringBuilder()).append("updateNetworkMode(), 3G capability slot=").append(i).toString());
        if (!flag && CallSettings.isMultipleSim() && i != -1 && CallSettings.isRadioOn(i))
        {
            mNetworkMode.setEnabled(true);
            Xlog.d("Settings/Modem3GCapabilitySwitch", (new StringBuilder()).append("Try to get preferred network mode for slot ").append(i).toString());
            mGeminiPhone.getPreferredNetworkTypeGemini(mHandler.obtainMessage(0), i);
            return;
        } else
        {
            mNetworkMode.setEnabled(false);
            mNetworkMode.setSummary("");
            return;
        }
    }

    private void updatePreferredNetworkModeSummary(int i)
    {
        mNetworkMode.getValue();
        switch (i)
        {
        case 6: // '\006'
            mNetworkMode.setSummary("EvDo only");
            return;

        case 5: // '\005'
            mNetworkMode.setSummary("CDMA only");
            return;

        case 4: // '\004'
            mNetworkMode.setSummary("CDMA / EvDo");
            return;

        case 3: // '\003'
            mNetworkMode.setSummary("GSM/WCDMA");
            return;

        case 2: // '\002'
            mNetworkMode.setSummary(mNetworkMode.getEntry());
            return;

        case 1: // '\001'
            mNetworkMode.setSummary(mNetworkMode.getEntry());
            return;

        case 0: // '\0'
            mNetworkMode.setSummary(mNetworkMode.getEntry());
            return;
        }
        mNetworkMode.setSummary("Global");
    }

    private void updateSummarys(long l)
    {
        if (mServiceList != null)
        {
            Xlog.d("Settings/Modem3GCapabilitySwitch", (new StringBuilder()).append("updateSummarys(), simId=").append(l).toString());
            if (l == -1L)
            {
                mServiceList.setSummary(0x7f0d00a0);
                if (mNetworkMode != null)
                {
                    mNetworkMode.setEnabled(false);
                    mNetworkMode.setSummary("");
                    return;
                }
            } else
            {
                if (l == -2L)
                {
                    mServiceList.setSummary("");
                    mNetworkMode.setEnabled(false);
                    mNetworkMode.setSummary("");
                    return;
                }
                android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(this, l);
                if (siminfo != null)
                {
                    mServiceList.setSummary(siminfo.mDisplayName);
                    boolean flag = CallSettings.isRadioOn(siminfo.mSlot);
                    Xlog.d("Settings/Modem3GCapabilitySwitch", (new StringBuilder()).append("updateSummarys(), SIM ").append(l).append(" power status is ").append(flag).toString());
                    mNetworkMode.setEnabled(flag);
                    if (!flag)
                    {
                        mNetworkMode.setSummary("");
                        return;
                    }
                }
            }
        }
    }

    public void changeForNetworkMode(Object obj)
    {
        byte byte0;
label0:
        {
            mNetworkMode.setValue((String)obj);
            int i = Integer.valueOf((String)obj).intValue();
            if (i != android.provider.Settings.Global.getInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", 0))
            {
                showProgressDialog();
                switch (i)
                {
                case 0: // '\0'
                    byte0 = 0;
                    break;

                case 1: // '\001'
                    byte0 = 1;
                    break;

                case 2: // '\002'
                    byte0 = 2;
                    break;

                case 3: // '\003'
                    byte0 = 3;
                    break;

                case 4: // '\004'
                    byte0 = 4;
                    break;

                case 5: // '\005'
                    byte0 = 5;
                    break;

                case 6: // '\006'
                    byte0 = 6;
                    break;

                case 7: // '\007'
                    byte0 = 7;
                    break;

                default:
                    byte0 = 3;
                    break;
                }
                updatePreferredNetworkModeSummary(i);
                android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", i);
                int j = mPhoneMgr.get3GCapabilitySIM();
                if (!CallSettings.isMultipleSim())
                    break label0;
                mGeminiPhone.setPreferredNetworkTypeGemini(byte0, mHandler.obtainMessage(1), j);
            }
            return;
        }
        mPhone.setPreferredNetworkType(byte0, mHandler.obtainMessage(1));
    }

    void clearAfterSwitch(Intent intent)
    {
        long l = -2L;
        Xlog.d("Settings/Modem3GCapabilitySwitch", "clearAfterSwitch(), remove switching dialog");
        disSwitchProgressDialog();
        setStatusBarEnableStatus(true);
        int i = intent.getIntExtra(GeminiPhone.EXTRA_3G_SIM, -2);
        if (i == -1)
        {
            l = -1L;
        } else
        {
            android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(this, i);
            if (siminfo != null)
                l = siminfo.mSimId;
        }
        updateSummarys(l);
        updateNetworkMode();
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Xlog.d("Settings/Modem3GCapabilitySwitch", "onCreate()");
        addPreferencesFromResource(0x7f06001b);
        mServiceList = (ServiceSelectList)findPreference("preferred_3g_service_key");
        mNetworkMode = (ListPreference)findPreference("preferred_network_mode_key");
        mServiceList.setOnPreferenceChangeListener(this);
        mNetworkMode.setOnPreferenceChangeListener(this);
        mPhone = PhoneFactory.getDefaultPhone();
        if (CallSettings.isMultipleSim())
            mGeminiPhone = (GeminiPhone)mPhone;
        mHandler = new MyHandler();
        mPhoneMgr = PhoneGlobals.getInstance().phoneMgr;
        mSlr = new ModemSwitchReceiver();
        IntentFilter intentfilter = new IntentFilter(GeminiPhone.EVENT_3G_SWITCH_LOCK_CHANGED);
        intentfilter.addAction(GeminiPhone.EVENT_PRE_3G_SWITCH);
        intentfilter.addAction(GeminiPhone.EVENT_3G_SWITCH_DONE);
        intentfilter.addAction("android.intent.action.AIRPLANE_MODE");
        intentfilter.addAction("android.intent.action.SIM_INDICATOR_STATE_CHANGED");
        intentfilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        registerReceiver(mSlr, intentfilter);
        int i = mPhoneMgr.get3GCapabilitySIM();
        if (i >= 0 && (8 & CallSettings.getBaseband(i)) != 0)
            mNetworkMode.setEntries(getResources().getTextArray(0x7f070024));
        mExtension = ExtensionManager.getInstance().getSettingsExtension();
        mExtension.removeNMOpFor3GSwitch(getPreferenceScreen(), mNetworkMode);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    protected void onDestroy()
    {
        super.onDestroy();
        Xlog.d("Settings/Modem3GCapabilitySwitch", (new StringBuilder()).append("Instance[").append(mInstanceIndex).append("].").append("onDestroy()").toString());
        if (mPD != null && mPD.isShowing())
            mPD.dismiss();
        if (mPD != null)
            mPD = null;
        disSwitchProgressDialog();
        if (mSlr != null)
            unregisterReceiver(mSlr);
        setStatusBarEnableStatus(true);
        mTimerHandler.removeMessages(1000);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 16908332: 
            finish();
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        if (preference == mServiceList)
            handleServiceSwitch(Long.valueOf(obj.toString()).longValue());
        else
        if (preference == mNetworkMode)
            changeForNetworkMode(obj);
        return true;
    }

    protected void onResume()
    {
        super.onResume();
        int i = mPhoneMgr.get3GCapabilitySIM();
        long l;
        if (i == -1)
        {
            l = i;
        } else
        {
            android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(this, i);
            if (siminfo != null)
                l = siminfo.mSimId;
            else
                l = -2L;
        }
        updateSummarys(l);
        updateNetworkMode();
        updateItemStatus();
        update3GService();
    }

    void showSwitchProgress()
    {
        if (mPDSwitching != null)
        {
            Xlog.d("Settings/Modem3GCapabilitySwitch", "The progress dialog already exist, so exit!");
            return;
        }
        mPDSwitching = new ProgressDialog(this);
        if (mPDSwitching != null)
            mPDSwitching.setMessage(getResources().getString(0x7f0d009e));
        Xlog.d("Settings/Modem3GCapabilitySwitch", "Create and show the progress dialog...");
        mPDSwitching.setCancelable(false);
        Window window = mPDSwitching.getWindow();
        android.view.WindowManager.LayoutParams layoutparams = window.getAttributes();
        layoutparams.flags = 0x80000000 | layoutparams.flags;
        window.setAttributes(layoutparams);
        mPDSwitching.show();
    }















}
