// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.os.*;
import android.preference.*;
import android.telephony.ServiceState;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.*;
import com.android.internal.telephony.*;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.mediatek.phone.SIMInfoWrapper;
import com.mediatek.settings.CallSettings;
import java.util.List;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, NotificationMgr

public class NetworkSetting extends PreferenceActivity
{

    private static final String BUTTON_AUTO_SELECT_KEY = "button_auto_select_key";
    private static final String BUTTON_SELECT_MANUAL = "button_manual_select_key";
    private static final boolean DBG = true;
    private static final int DIALOG_DISCONNECT_DATA_CONNECTION = 500;
    private static final int DIALOG_NETWORK_AUTO_SELECT = 300;
    private static final int DIALOG_NETWORK_MENU_SELECT = 200;
    private static final int EVENT_AUTO_SELECT_DONE = 300;
    private static final int EVENT_SERVICE_STATE_CHANGED = 400;
    private static final String LOG_TAG = "phone";
    private static final int MENU_CANCEL = 100;
    private static final int SIM_CARD_UNDEFINED = -1;
    private boolean mAirplaneModeEnabled;
    private Preference mAutoSelect;
    private int mDualSimMode;
    private GeminiPhone mGeminiPhone;
    private final Handler mHandler = new Handler() {

        final NetworkSetting this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 400: 
                Log.d("phone", "EVENT_SERVICE_STATE_CHANGED");
                setScreenEnabled(true);
                return;

            case 300: 
                log("hideProgressPanel");
                removeDialog(300);
                AsyncResult asyncresult = (AsyncResult)message.obj;
                if (asyncresult.exception != null)
                {
                    log("automatic network selection: failed!");
                    displayNetworkSelectionFailed(asyncresult.exception);
                    return;
                } else
                {
                    log("automatic network selection: succeeded!");
                    displayNetworkSelectionSucceeded();
                    return;
                }
            }
        }

            
            {
                this$0 = NetworkSetting.this;
                super();
            }
    }
;
    private IntentFilter mIntentFilter;
    protected boolean mIsForeground;
    protected boolean mIsResignSuccess;
    private Preference mManuSelect;
    String mNetworkSelectMsg;
    private TextView mNoServiceMsg;
    Phone mPhone;
    private PhoneStateIntentReceiver mPhoneStateReceiver;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final NetworkSetting this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            if (s.equals("android.intent.action.AIRPLANE_MODE"))
            {
                mAirplaneModeEnabled = intent.getBooleanExtra("state", false);
                log((new StringBuilder()).append("ACTION_AIRPLANE_MODE_CHANGED ||mAirplaneModeEnabled:").append(mAirplaneModeEnabled).toString());
                setScreenEnabled(true);
            } else
            {
                if (s.equals("android.intent.action.DUAL_SIM_MODE"))
                {
                    mDualSimMode = intent.getIntExtra("mode", -1);
                    setScreenEnabled(true);
                    return;
                }
                if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
                {
                    Log.d("phone", "ACTION_SIM_INFO_UPDATE received");
                    List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(NetworkSetting.this);
                    if (list.size() == 0)
                    {
                        Log.d("phone", "Activity finished");
                        CallSettings.goToMobileNetworkSettings(NetworkSetting.this);
                        return;
                    }
                    if (list.size() == 1 && ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot != mSimId)
                    {
                        Log.d("phone", (new StringBuilder()).append("temp.size()=").append(list.size()).append("Activity finished").toString());
                        CallSettings.goToMobileNetworkSettings(NetworkSetting.this);
                        return;
                    }
                }
            }
        }

            
            {
                this$0 = NetworkSetting.this;
                super();
            }
    }
;
    private CheckBox mShowAlwaysCheck;
    private TextView mShowAlwaysTitle;
    private int mSimId;
    private String mTitleName;

    public NetworkSetting()
    {
        mIsForeground = false;
        mTitleName = null;
        mIsResignSuccess = false;
        mSimId = 0;
        mDualSimMode = -1;
    }

    private void displayNetworkSelectionFailed(Throwable throwable)
    {
        mIsResignSuccess = false;
        setScreenEnabled(true);
        String s;
        if (throwable != null && (throwable instanceof CommandException) && ((CommandException)throwable).getCommandError() == com.android.internal.telephony.CommandException.Error.ILLEGAL_SIM_OR_ME)
            s = getResources().getString(0x7f0d01f8);
        else
            s = getResources().getString(0x7f0d01f9);
        PhoneGlobals.getInstance().notificationMgr.postTransientNotification(4, s);
    }

    private void displayNetworkSelectionSucceeded()
    {
        mIsResignSuccess = true;
        setScreenEnabled(false);
        String s = getResources().getString(0x7f0d01fa);
        PhoneGlobals.getInstance().notificationMgr.postTransientNotification(4, s);
        mHandler.postDelayed(new Runnable() {

            final NetworkSetting this$0;

            public void run()
            {
                finish();
            }

            
            {
                this$0 = NetworkSetting.this;
                super();
            }
        }
, 3000L);
    }

    private void geminiPhoneInit()
    {
        if (CallSettings.isMultipleSim())
        {
            mSimId = getIntent().getIntExtra("simId", -1);
            mGeminiPhone = (GeminiPhone)PhoneGlobals.getPhone();
        }
    }

    private boolean isNoService()
    {
        return getIntent().getBooleanExtra("no_service", false);
    }

    private boolean isRadioPoweroff()
    {
        boolean flag;
        if (CallSettings.isMultipleSim())
        {
            if (mPhoneStateReceiver.getServiceStateGemini(mSimId).getState() == 3)
                flag = true;
            else
                flag = false;
        } else
        if (mPhoneStateReceiver.getServiceState().getState() == 3)
            flag = true;
        else
            flag = false;
        Log.d("phone", (new StringBuilder()).append("isRadioPoweroff=").append(flag).toString());
        return flag;
    }

    private void log(String s)
    {
        Log.d("phone", (new StringBuilder()).append("[NetworksList] ").append(s).toString());
    }

    private void selectNetworkAutomatic()
    {
        log("select network automatically...");
        if (mIsForeground)
            showDialog(300);
        Message message = mHandler.obtainMessage(300);
        if (!CallSettings.isMultipleSim())
        {
            mPhone.setNetworkSelectionModeAutomatic(message);
            return;
        } else
        {
            mGeminiPhone.setNetworkSelectionModeAutomaticGemini(message, mSimId);
            return;
        }
    }

    private void setScreenEnabled(boolean flag)
    {
        boolean flag1 = true;
        TelephonyManager telephonymanager = (TelephonyManager)getSystemService("phone");
        boolean flag2;
        if (CallSettings.isMultipleSim() && PhoneFactory.isDualTalkMode())
        {
            if (telephonymanager.getCallStateGemini(mSimId) == 0)
                flag2 = flag1;
            else
                flag2 = false;
        } else
        if (telephonymanager.getCallState() == 0)
            flag2 = flag1;
        else
            flag2 = false;
        PreferenceScreen preferencescreen = getPreferenceScreen();
        if (!flag || mIsResignSuccess || isRadioPoweroff() || !flag2 || mAirplaneModeEnabled || mDualSimMode == 0)
            flag1 = false;
        preferencescreen.setEnabled(flag1);
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f040028);
        addPreferencesFromResource(0x7f060004);
        mPhone = PhoneGlobals.getPhone();
        mManuSelect = getPreferenceScreen().findPreference("button_manual_select_key");
        mAutoSelect = getPreferenceScreen().findPreference("button_auto_select_key");
        mTitleName = getIntent().getStringExtra("sub_title_name");
        if (mTitleName != null)
            setTitle(mTitleName);
        mNoServiceMsg = (TextView)findViewById(0x7f0800ae);
        mShowAlwaysCheck = (CheckBox)findViewById(0x7f0800af);
        if (mShowAlwaysCheck != null)
        {
            final SharedPreferences sp = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
            mShowAlwaysCheck.setChecked(sp.getBoolean("no_service_key", false));
            mShowAlwaysCheck.setOnCheckedChangeListener(new android.widget.CompoundButton.OnCheckedChangeListener() {

                final NetworkSetting this$0;
                final SharedPreferences val$sp;

                public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
                {
                    android.content.SharedPreferences.Editor editor = sp.edit();
                    editor.putBoolean("no_service_key", flag);
                    editor.commit();
                }

            
            {
                this$0 = NetworkSetting.this;
                sp = sharedpreferences;
                super();
            }
            }
);
        }
        mShowAlwaysTitle = (TextView)findViewById(0x7f0800b0);
        geminiPhoneInit();
        if (isNoService())
        {
            if (CallSettings.isMultipleSim())
            {
                SIMInfoWrapper siminfowrapper = SIMInfoWrapper.getDefault();
                if (siminfowrapper != null)
                {
                    android.provider.Telephony.SIMInfo siminfo = siminfowrapper.getSimInfoBySlot(mSimId);
                    if (siminfo != null)
                    {
                        Resources resources = getResources();
                        Object aobj[] = new Object[1];
                        aobj[0] = siminfo.mDisplayName;
                        setTitle(resources.getString(0x7f0d011c, aobj));
                        TextView textview = mNoServiceMsg;
                        Resources resources1 = getResources();
                        Object aobj1[] = new Object[1];
                        aobj1[0] = siminfo.mDisplayName;
                        textview.setText(resources1.getString(0x7f0d0119, aobj1));
                    }
                }
            } else
            {
                setTitle(getResources().getString(0x7f0d011d));
                mNoServiceMsg.setText(getResources().getString(0x7f0d011a));
            }
        } else
        {
            mNoServiceMsg.setVisibility(8);
            mShowAlwaysCheck.setVisibility(8);
            mShowAlwaysTitle.setVisibility(8);
        }
        log((new StringBuilder()).append("It's a GeminiPhone ? = ").append(CallSettings.isMultipleSim()).append("SIM_ID = ").append(mSimId).toString());
        mIntentFilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        if (CallSettings.isMultipleSim())
            mIntentFilter.addAction("android.intent.action.DUAL_SIM_MODE");
        mIntentFilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        mPhoneStateReceiver = new PhoneStateIntentReceiver(this, mHandler);
        mPhoneStateReceiver.notifyServiceState(400);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    protected Dialog onCreateDialog(int i)
    {
        Object obj = null;
        switch (i)
        {
        case 500: 
            obj = (new android.app.AlertDialog.Builder(this)).setMessage(0x7f0d013a).setTitle(0x1040014).setIcon(0x1080027).setPositiveButton(0x1040013, new android.content.DialogInterface.OnClickListener() {

                final NetworkSetting this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    ConnectivityManager connectivitymanager = (ConnectivityManager)getSystemService("connectivity");
                    if (connectivitymanager != null)
                        connectivitymanager.setMobileDataEnabled(false);
                    showDialog(200);
                }

            
            {
                this$0 = NetworkSetting.this;
                super();
            }
            }
).setNegativeButton(0x1040009, null).create();
            break;

        case 200: 
            obj = (new android.app.AlertDialog.Builder(this)).setTitle(0x1040014).setIcon(0x1080027).setMessage(getResources().getString(0x7f0d0118)).setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

                final NetworkSetting this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    Intent intent = new Intent();
                    intent.setClassName("com.android.phone", "com.mediatek.settings.NetworkSettingList");
                    intent.putExtra("simId", mSimId);
                    startActivity(intent);
                }

            
            {
                this$0 = NetworkSetting.this;
                super();
            }
            }
).setNegativeButton(0x1040000, null).create();
            break;

        case 300: 
            obj = new ProgressDialog(this);
            ((ProgressDialog)obj).setMessage(getResources().getString(0x7f0d01ff));
            ((ProgressDialog)obj).setCancelable(false);
            ((ProgressDialog)obj).setIndeterminate(true);
            break;
        }
        log((new StringBuilder()).append("[onCreateDialog] create dialog id is ").append(i).toString());
        return ((Dialog) (obj));
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        if (isNoService())
            menu.add(0, 100, 0, 0x7f0d0196).setShowAsAction(1);
        return super.onCreateOptionsMenu(menu);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 16908332: 
            finish();
            return true;

        case 100: // 'd'
            finish();
            break;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    protected void onPause()
    {
        super.onPause();
        mIsForeground = false;
        mPhoneStateReceiver.unregisterIntent();
        unregisterReceiver(mReceiver);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference == mAutoSelect)
            selectNetworkAutomatic();
        else
        if (preference == mManuSelect)
        {
            if (CallSettings.isMultipleSim() && !PhoneFactory.isDualTalkMode())
            {
                long l = android.provider.Settings.System.getLong(getContentResolver(), "gprs_connection_sim_setting", -5L);
                log((new StringBuilder()).append("dataConnectionId = ").append(l).toString());
                if (l != 0L)
                {
                    int i = android.provider.Telephony.SIMInfo.getSlotById(this, l);
                    log((new StringBuilder()).append("slot = ").append(mSimId).toString());
                    if (i != mSimId)
                    {
                        showDialog(500);
                        return true;
                    }
                }
            }
            showDialog(200);
            return true;
        }
        return true;
    }

    protected void onResume()
    {
        super.onResume();
        mIsForeground = true;
        mPhoneStateReceiver.registerIntent();
        registerReceiver(mReceiver, mIntentFilter);
        boolean flag;
        if (android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", -1) == 1)
            flag = true;
        else
            flag = false;
        mAirplaneModeEnabled = flag;
        if (CallSettings.isMultipleSim())
        {
            mDualSimMode = android.provider.Settings.System.getInt(getContentResolver(), "dual_sim_mode_setting", -1);
            Log.d("phone", (new StringBuilder()).append("NetworkSettings.onResume(), mDualSimMode=").append(mDualSimMode).toString());
        }
        setScreenEnabled(true);
    }



/*
    static boolean access$002(NetworkSetting networksetting, boolean flag)
    {
        networksetting.mAirplaneModeEnabled = flag;
        return flag;
    }

*/




/*
    static int access$302(NetworkSetting networksetting, int i)
    {
        networksetting.mDualSimMode = i;
        return i;
    }

*/



}
