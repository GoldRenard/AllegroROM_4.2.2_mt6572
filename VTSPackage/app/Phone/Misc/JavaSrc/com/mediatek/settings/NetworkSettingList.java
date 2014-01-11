// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.os.*;
import android.preference.*;
import android.telephony.ServiceState;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Log;
import android.view.MenuItem;
import com.android.internal.telephony.*;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.phone.*;
import java.util.*;

// Referenced classes of package com.mediatek.settings:
//            CallSettings

public class NetworkSettingList extends PreferenceActivity
    implements android.content.DialogInterface.OnCancelListener
{

    private static final boolean DBG = true;
    private static final int DIALOG_ALL_FORBIDDEN = 400;
    private static final int DIALOG_NETWORK_LIST_LOAD = 200;
    private static final int DIALOG_NETWORK_SELECTION = 100;
    private static final int EVENT_NETWORK_SCAN_COMPLETED = 100;
    private static final int EVENT_NETWORK_SCAN_COMPLETED_2 = 101;
    private static final int EVENT_NETWORK_SCAN_COMPLETED_3 = 102;
    private static final int EVENT_NETWORK_SCAN_COMPLETED_4 = 103;
    private static final int EVENT_NETWORK_SELECTION_DONE = 200;
    private static final int EVENT_SERVICE_STATE_CHANGED = 400;
    private static final String LIST_NETWORKS_KEY = "list_networks_key";
    private static final String LOG_TAG = "phone";
    private static final int SIM_CARD_UNDEFINED = -1;
    private boolean mAirplaneModeEnabled;
    private final INetworkQueryServiceCallback mCallback = new com.android.phone.INetworkQueryServiceCallback.Stub() {

        final NetworkSettingList this$0;

        public void onQueryComplete(List list, int i)
        {
            log("notifying message loop of query completion.");
            byte byte0 = 100;
            switch (mSimId)
            {
            case 3: // '\003'
                byte0 = 103;
                break;

            case 2: // '\002'
                byte0 = 102;
                break;

            case 1: // '\001'
                byte0 = 101;
                break;

            case 0: // '\0'
                byte0 = 100;
                break;

            default:
                log((new StringBuilder()).append("mSimId = ").append(mSimId).append(" error!").toString());
                break;
            }
            mHandler.obtainMessage(byte0, i, 0, list).sendToTarget();
        }

            
            {
                this$0 = NetworkSettingList.this;
                super();
            }
    }
;
    private int mDualSimMode;
    private GeminiPhone mGeminiPhone;
    private final Handler mHandler = new Handler() {

        final NetworkSettingList this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            default:
                break;

            case 400: 
                Log.d("phone", "EVENT_SERVICE_STATE_CHANGED");
                setScreenEnabled(true);
                return;

            case 200: 
                log("hideProgressPanel");
                removeDialog(100);
                AsyncResult asyncresult = (AsyncResult)message.obj;
                if (asyncresult.exception != null)
                {
                    log("manual network selection: failed!");
                    displayNetworkSelectionFailed(asyncresult.exception);
                    return;
                } else
                {
                    log("manual network selection: succeeded!");
                    displayNetworkSelectionSucceeded();
                    return;
                }

            case 103: // 'g'
                log((new StringBuilder()).append("EVENT_NETWORK_SCAN_COMPLETED_4 || mSimId:").append(mSimId).toString());
                if (!CallSettings.isMultipleSim() || mSimId == 3)
                {
                    networksListLoaded((List)message.obj, message.arg1);
                    return;
                }
                break;

            case 102: // 'f'
                log((new StringBuilder()).append("EVENT_NETWORK_SCAN_COMPLETED_3 || mSimId:").append(mSimId).toString());
                if (!CallSettings.isMultipleSim() || mSimId == 2)
                {
                    networksListLoaded((List)message.obj, message.arg1);
                    return;
                }
                break;

            case 101: // 'e'
                log((new StringBuilder()).append("EVENT_NETWORK_SCAN_COMPLETED_2 || mSimId:").append(mSimId).toString());
                if (!CallSettings.isMultipleSim() || mSimId == 1)
                {
                    networksListLoaded((List)message.obj, message.arg1);
                    return;
                }
                break;

            case 100: // 'd'
                log((new StringBuilder()).append("EVENT_NETWORK_SCAN_COMPLETED || mSimId:").append(mSimId).toString());
                if (!CallSettings.isMultipleSim() || mSimId == 0)
                {
                    networksListLoaded((List)message.obj, message.arg1);
                    return;
                }
                break;
            }
        }

            
            {
                this$0 = NetworkSettingList.this;
                super();
            }
    }
;
    private IntentFilter mIntentFilter;
    protected boolean mIsForeground;
    protected boolean mIsResignSuccess;
    private PreferenceGroup mNetworkList;
    private HashMap mNetworkMap;
    private INetworkQueryService mNetworkQueryService;
    private final ServiceConnection mNetworkQueryServiceConnection = new ServiceConnection() {

        final NetworkSettingList this$0;

        public void onServiceConnected(ComponentName componentname, IBinder ibinder)
        {
            log("connection created, binding local service.");
            mNetworkQueryService = ((com.android.phone.NetworkQueryService.LocalBinder)ibinder).getService();
            loadNetworksList();
        }

        public void onServiceDisconnected(ComponentName componentname)
        {
            log("connection disconnected, cleaning local binding.");
            mNetworkQueryService = null;
        }

            
            {
                this$0 = NetworkSettingList.this;
                super();
            }
    }
;
    String mNetworkSelectMsg;
    Phone mPhone;
    private PhoneStateIntentReceiver mPhoneStateReceiver;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final NetworkSettingList this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            if (s.equals("android.intent.action.AIRPLANE_MODE"))
            {
                mAirplaneModeEnabled = intent.getBooleanExtra("state", false);
                log((new StringBuilder()).append("ACTION_AIRPLANE_MODE_CHANGED || mAirplaneModeEnabled:").append(mAirplaneModeEnabled).toString());
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
                    List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(NetworkSettingList.this);
                    if (list.size() == 0)
                    {
                        Log.d("phone", "Activity finished");
                        CallSettings.goToMobileNetworkSettings(NetworkSettingList.this);
                        return;
                    }
                    if (list.size() == 1 && ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot != mSimId)
                    {
                        Log.d("phone", (new StringBuilder()).append("temp.size()=").append(list.size()).append("Activity finished").toString());
                        CallSettings.goToMobileNetworkSettings(NetworkSettingList.this);
                        return;
                    }
                }
            }
        }

            
            {
                this$0 = NetworkSettingList.this;
                super();
            }
    }
;
    private int mSimId;
    private String mTitleName;

    public NetworkSettingList()
    {
        mIsForeground = false;
        mTitleName = null;
        mIsResignSuccess = false;
        mSimId = 0;
        mDualSimMode = -1;
        mNetworkQueryService = null;
    }

    private void clearList()
    {
        Preference preference;
        for (Iterator iterator = mNetworkMap.keySet().iterator(); iterator.hasNext(); mNetworkList.removePreference(preference))
            preference = (Preference)iterator.next();

        mNetworkMap.clear();
    }

    private void displayEmptyNetworkList(boolean flag)
    {
        if (flag)
        {
            log("SET empty network list title");
            setTitle(0x7f0d01f4);
            mNetworkList.setTitle(0x7f0d01f4);
            return;
        }
        if (CallSettings.isMultipleSim())
        {
            if (mTitleName != null)
            {
                setTitle(mTitleName);
                mNetworkList.setTitle(mTitleName);
                return;
            } else
            {
                setTitle(getString(0x7f0d01f2));
                mNetworkList.setTitle(getString(0x7f0d01f2));
                return;
            }
        } else
        {
            log("SET SIM Title");
            setTitle(0x7f0d01f2);
            mNetworkList.setTitle(0x7f0d01f2);
            return;
        }
    }

    private void displayNetworkQueryFailed(int i)
    {
        String s = getResources().getString(0x7f0d01f6);
        PhoneGlobals.getInstance().notificationMgr.postTransientNotification(4, s);
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

            final NetworkSettingList this$0;

            public void run()
            {
                finish();
            }

            
            {
                this$0 = NetworkSettingList.this;
                super();
            }
        }
, 3000L);
    }

    private void displayNetworkSeletionInProgress(String s)
    {
        mNetworkSelectMsg = getResources().getString(0x7f0d01f7, new Object[] {
            s
        });
        if (mIsForeground)
            showDialog(100);
    }

    private String getNetworkTitle(OperatorInfo operatorinfo)
    {
        if (!TextUtils.isEmpty(operatorinfo.getOperatorAlphaLong()))
            return operatorinfo.getOperatorAlphaLong();
        if (!TextUtils.isEmpty(operatorinfo.getOperatorAlphaShort()))
            return operatorinfo.getOperatorAlphaShort();
        else
            return operatorinfo.getOperatorNumeric();
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

    private void loadNetworksList()
    {
        log("load networks list...");
        if (mIsForeground)
            showDialog(200);
        try
        {
            mNetworkQueryService.startNetworkQuery(mCallback);
        }
        catch (RemoteException remoteexception)
        {
            log("RemoteException");
        }
        displayEmptyNetworkList(false);
    }

    private void log(String s)
    {
        Log.d("phone", (new StringBuilder()).append("[NetworksList] ").append(s).toString());
    }

    private void networksListLoaded(List list, int i)
    {
        log("networks list loaded");
        log("hideProgressPanel");
        removeDialog(200);
        setScreenEnabled(true);
        clearList();
        if (i != 0)
        {
            log("error while querying available networks");
            displayNetworkQueryFailed(i);
            displayEmptyNetworkList(true);
        } else
        if (list != null)
        {
            displayEmptyNetworkList(false);
            int j = 0;
            Iterator iterator = list.iterator();
            while (iterator.hasNext()) 
            {
                OperatorInfo operatorinfo = (OperatorInfo)iterator.next();
                Preference preference = new Preference(this, null);
                String s = "";
                if (operatorinfo.getState() == com.android.internal.telephony.OperatorInfo.State.FORBIDDEN)
                {
                    s = (new StringBuilder()).append("(").append(getResources().getString(0x7f0d00a3)).append(")").toString();
                    j++;
                }
                preference.setTitle((new StringBuilder()).append(getNetworkTitle(operatorinfo)).append(s).toString());
                preference.setPersistent(false);
                mNetworkList.addPreference(preference);
                mNetworkMap.put(preference, operatorinfo);
                if (j == list.size())
                    showDialog(400);
                log((new StringBuilder()).append("  ").append(operatorinfo).toString());
            }
        } else
        {
            displayEmptyNetworkList(true);
        }
        try
        {
            mNetworkQueryService.stopNetworkQuery(mCallback);
            return;
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
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

    public void geminiPhoneInit()
    {
        if (CallSettings.isMultipleSim())
        {
            mSimId = getIntent().getIntExtra("simId", -1);
            mGeminiPhone = (GeminiPhone)PhoneGlobals.getInstance().phone;
        }
    }

    public void onCancel(DialogInterface dialoginterface)
    {
        try
        {
            mNetworkQueryService.stopNetworkQuery(mCallback);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
        finish();
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f060005);
        mPhone = PhoneGlobals.getPhone();
        mNetworkList = (PreferenceGroup)getPreferenceScreen().findPreference("list_networks_key");
        mNetworkMap = new HashMap();
        mTitleName = getIntent().getStringExtra("sub_title_name");
        geminiPhoneInit();
        log((new StringBuilder()).append("It's a GeminiPhone ? = ").append(CallSettings.isMultipleSim()).append("SIM_ID = ").append(mSimId).toString());
        Intent intent = new Intent(this, com/android/phone/NetworkQueryService);
        intent.putExtra("simId", mSimId);
        startService(intent);
        bindService(intent, mNetworkQueryServiceConnection, 1);
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
        if (i == 400)
        {
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
            builder.setTitle(0x1040014);
            builder.setIcon(0x1080027);
            builder.setMessage(getResources().getString(0x7f0d014f));
            builder.setPositiveButton(0x1040013, null);
            return builder.create();
        }
        ProgressDialog progressdialog = null;
        switch (i)
        {
        case 200: 
            progressdialog = new ProgressDialog(this);
            progressdialog.setMessage(getResources().getString(0x7f0d01f3));
            progressdialog.setCancelable(true);
            progressdialog.setOnCancelListener(this);
            break;

        case 100: // 'd'
            progressdialog = new ProgressDialog(this);
            progressdialog.setMessage(mNetworkSelectMsg);
            progressdialog.setCancelable(false);
            progressdialog.setIndeterminate(true);
            break;
        }
        log((new StringBuilder()).append("[onCreateDialog] create dialog id is ").append(i).toString());
        return progressdialog;
    }

    protected void onDestroy()
    {
        log("[onDestroy]Call onDestroy. unbindService");
        unbindService(mNetworkQueryServiceConnection);
        super.onDestroy();
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

    protected void onPause()
    {
        super.onPause();
        mIsForeground = false;
        mPhoneStateReceiver.unregisterIntent();
        unregisterReceiver(mReceiver);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        String s = preference.getTitle().toString();
        log((new StringBuilder()).append("selected network: ").append(s).toString());
        Message message = mHandler.obtainMessage(200);
        if (!CallSettings.isMultipleSim())
            mPhone.selectNetworkManually((OperatorInfo)mNetworkMap.get(preference), message);
        else
            mGeminiPhone.selectNetworkManuallyGemini((OperatorInfo)mNetworkMap.get(preference), message, mSimId);
        displayNetworkSeletionInProgress(s);
        return true;
    }

    protected void onPrepareDialog(int i, Dialog dialog)
    {
        if (i == 100 || i == 200)
            setScreenEnabled(false);
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
    static boolean access$002(NetworkSettingList networksettinglist, boolean flag)
    {
        networksettinglist.mAirplaneModeEnabled = flag;
        return flag;
    }

*/





/*
    static int access$302(NetworkSettingList networksettinglist, int i)
    {
        networksettinglist.mDualSimMode = i;
        return i;
    }

*/






/*
    static INetworkQueryService access$802(NetworkSettingList networksettinglist, INetworkQueryService inetworkqueryservice)
    {
        networksettinglist.mNetworkQueryService = inetworkqueryservice;
        return inetworkqueryservice;
    }

*/

}
