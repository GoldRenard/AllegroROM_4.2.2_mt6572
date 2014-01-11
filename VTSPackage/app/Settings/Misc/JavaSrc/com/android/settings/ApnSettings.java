// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.*;
import android.content.res.Resources;
import android.database.Cursor;
import android.net.*;
import android.os.*;
import android.preference.*;
import android.telephony.*;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ListView;
import android.widget.Toast;
import com.android.internal.telephony.ITelephony;
import com.mediatek.settings.ext.IRcseOnlyApnExtension;
import com.mediatek.settings.ext.ISettingsMiscExt;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.android.settings:
//            ApnPreference, Utils, AirplaneModeEnabler

public class ApnSettings extends PreferenceActivity
    implements android.preference.Preference.OnPreferenceChangeListener
{
    private class RestoreApnProcessHandler extends Handler
    {

        private Handler mRestoreApnUiHandler;
        final ApnSettings this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 1: // '\001'
                getContentResolver().delete(mDefaultApnUri, null, null);
                mRestoreApnUiHandler.sendEmptyMessage(2);
                return;
            }
        }

        public RestoreApnProcessHandler(Looper looper, Handler handler)
        {
            this$0 = ApnSettings.this;
            super(looper);
            mRestoreApnUiHandler = handler;
        }
    }

    private class RestoreApnUiHandler extends Handler
    {

        final ApnSettings this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 2: // '\002'
                fillList(mSimId);
                getPreferenceScreen().setEnabled(true);
                mRestoreDefaultApnMode = false;
                removeDialog(1001);
                Toast.makeText(ApnSettings.this, getResources().getString(0x7f0b05b2), 1).show();
                return;
            }
        }

        private RestoreApnUiHandler()
        {
            this$0 = ApnSettings.this;
            super();
        }

    }


    public static final String APN_ID = "apn_id";
    private static final int APN_INDEX = 2;
    public static final String APN_TYPE = "apn_type";
    protected static final Uri DEFAULTAPN_URI = Uri.parse("content://telephony/carriers/restore");
    private static final Uri DEFAULTAPN_URI_GEMINI_SIM1 = Uri.parse("content://telephony/carriers_sim1/restore");
    private static final Uri DEFAULTAPN_URI_GEMINI_SIM2 = Uri.parse("content://telephony/carriers_sim2/restore");
    private static final Uri DEFAULTAPN_URI_GEMINI_SIM3 = Uri.parse("content://telephony/carriers_sim3/restore");
    private static final Uri DEFAULTAPN_URI_GEMINI_SIM4 = Uri.parse("content://telephony/carriers_sim4/restore");
    private static final int DIALOG_APN_DISABLED = 2000;
    private static final int DIALOG_RESTORE_DEFAULTAPN = 1001;
    private static final int EVENT_RESTORE_DEFAULTAPN_COMPLETE = 2;
    private static final int EVENT_RESTORE_DEFAULTAPN_START = 1;
    private static final int EVENT_SERVICE_STATE_CHANGED = 5;
    public static final String EXTRA_POSITION = "position";
    private static final int ID_INDEX = 0;
    protected static final int MENU_NEW = 1;
    private static final int MENU_RESTORE = 2;
    private static final int NAME_INDEX = 1;
    private static final Uri PREFERAPN_URI = Uri.parse("content://telephony/carriers/preferapn");
    private static final Uri PREFERAPN_URI_GEMINI_SIM1 = Uri.parse("content://telephony/carriers_sim1/preferapn");
    private static final Uri PREFERAPN_URI_GEMINI_SIM2 = Uri.parse("content://telephony/carriers_sim2/preferapn");
    private static final Uri PREFERAPN_URI_GEMINI_SIM3 = Uri.parse("content://telephony/carriers_sim3/preferapn");
    private static final Uri PREFERAPN_URI_GEMINI_SIM4 = Uri.parse("content://telephony/carriers_sim4/preferapn");
    public static final String PREFERRED_APN_URI = "content://telephony/carriers/preferapn";
    private static final String PREFERRED_APN_URI_GEMINI_SIM1 = "content://telephony/carriers_sim1/preferapn";
    private static final String PREFERRED_APN_URI_GEMINI_SIM2 = "content://telephony/carriers_sim2/preferapn";
    private static final String PREFERRED_APN_URI_GEMINI_SIM3 = "content://telephony/carriers_sim3/preferapn";
    private static final String PREFERRED_APN_URI_GEMINI_SIM4 = "content://telephony/carriers_sim4/preferapn";
    public static final String RCSE_TYPE = "rcse";
    public static final String RESTORE_CARRIERS_URI = "content://telephony/carriers/restore";
    private static final String RESTORE_CARRIERS_URI_GEMINI_SIM1 = "content://telephony/carriers_sim1/restore";
    private static final String RESTORE_CARRIERS_URI_GEMINI_SIM2 = "content://telephony/carriers_sim2/restore";
    private static final String RESTORE_CARRIERS_URI_GEMINI_SIM3 = "content://telephony/carriers_sim3/restore";
    private static final String RESTORE_CARRIERS_URI_GEMINI_SIM4 = "content://telephony/carriers_sim4/restore";
    public static final int SIM_CARD_SINGLE = -1;
    public static final int SIM_CARD_UNDEFINED = -1;
    private static final int SOURCE_TYPE_INDEX = 4;
    static final String TAG = "ApnSettings";
    public static final String TETHER_TYPE = "tethering";
    private static final String TRANSACTION_START = "com.android.mms.transaction.START";
    private static final String TRANSACTION_STOP = "com.android.mms.transaction.STOP";
    private static final int TYPES_INDEX = 3;
    private static boolean sNotInMmsTransation = true;
    protected boolean mAirplaneModeEnabled;
    protected Uri mDefaultApnUri;
    private int mDualSimMode;
    private ISettingsMiscExt mExt;
    private String mIMSI;
    protected boolean mIsCallStateIdle;
    private boolean mIsTetehred;
    protected boolean mIsTetherApn;
    private com.mediatek.settings.ext.IRcseOnlyApnExtension.OnRcseOnlyApnStateChangedListener mListener;
    private IntentFilter mMobileStateFilter;
    private final BroadcastReceiver mMobileStateReceiver = new BroadcastReceiver() {

        final ApnSettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            boolean flag = true;
            String s = intent.getAction();
            if (s.equals("android.intent.action.ANY_DATA_STATE"))
            {
                com.android.internal.telephony.PhoneConstants.DataState datastate = ApnSettings.getMobileDataState(intent);
                static class _cls5
                {

                    static final int $SwitchMap$com$android$internal$telephony$PhoneConstants$DataState[];

                    static 
                    {
                        $SwitchMap$com$android$internal$telephony$PhoneConstants$DataState = new int[com.android.internal.telephony.PhoneConstants.DataState.values().length];
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$PhoneConstants$DataState[com.android.internal.telephony.PhoneConstants.DataState.CONNECTED.ordinal()] = 1;
                        }
                        catch (NoSuchFieldError nosuchfielderror) { }
                    }
                }

                switch (_cls5..SwitchMap.com.android.internal.telephony.PhoneConstants.DataState[datastate.ordinal()])
                {
                case 1: // '\001'
                    int i = intent.getIntExtra("simId", -1);
                    Xlog.d("ApnSettings", (new StringBuilder()).append("Get sim Id in broadcast received is:").append(i).toString());
                    if (i == mSimId)
                    {
                        fillList(mSimId);
                        return;
                    }
                    break;
                }
            } else
            {
                if (s.equals("android.intent.action.AIRPLANE_MODE"))
                {
                    mAirplaneModeEnabled = intent.getBooleanExtra("state", false);
                    Xlog.d("ApnSettings", (new StringBuilder()).append("AIRPLANE_MODE state changed: ").append(mAirplaneModeEnabled).toString());
                    PreferenceScreen preferencescreen1 = getPreferenceScreen();
                    if (mAirplaneModeEnabled || mDualSimMode == 0)
                        flag = false;
                    preferencescreen1.setEnabled(flag);
                    return;
                }
                if (s.equals("android.intent.action.SIM_STATE_CHANGED"))
                {
                    Xlog.d("ApnSettings", "receiver: ACTION_SIM_STATE_CHANGED in ApnSettings");
                    if (mNumeric != null && mNumeric.equals("-1") || (mSpn == null || mSpn.isEmpty()) && (mIMSI == null || mIMSI.isEmpty()) && (mPnn == null || mPnn.isEmpty()))
                    {
                        initSimState();
                        setSpn();
                        setIMSI();
                        setPnn();
                        if (!mRestoreDefaultApnMode)
                        {
                            fillList(mSimId);
                            return;
                        }
                    }
                } else
                {
                    if (s.equals("com.android.mms.transaction.START"))
                    {
                        Xlog.d("ApnSettings", "receiver: TRANSACTION_START in ApnSettings");
                        ApnSettings.sNotInMmsTransation = false;
                        getPreferenceScreen().setEnabled(false);
                        return;
                    }
                    if (s.equals("com.android.mms.transaction.STOP"))
                    {
                        Xlog.d("ApnSettings", "receiver: TRANSACTION_STOP in ApnSettings");
                        ApnSettings.sNotInMmsTransation = flag;
                        getPreferenceScreen().setEnabled(getScreenEnableState());
                        return;
                    }
                    if (s.equals("android.intent.action.DUAL_SIM_MODE"))
                    {
                        mDualSimMode = intent.getIntExtra("mode", -1);
                        Xlog.d("ApnSettings", (new StringBuilder()).append("receiver, new dual sim mode").append(mDualSimMode).toString());
                        PreferenceScreen preferencescreen = getPreferenceScreen();
                        if (mAirplaneModeEnabled || mDualSimMode == 0)
                            flag = false;
                        preferencescreen.setEnabled(flag);
                        return;
                    }
                    if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
                    {
                        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(ApnSettings.this);
                        if (list.size() == 0)
                        {
                            Xlog.d("ApnSettings", "Activity finished");
                            finish();
                            return;
                        }
                        if (list.size() == flag && ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot != mSimId)
                        {
                            Xlog.d("ApnSettings", (new StringBuilder()).append("temp.size()=").append(list.size()).append("Activity finished").toString());
                            finish();
                            return;
                        }
                    }
                }
            }
        }

            
            {
                this$0 = ApnSettings.this;
                super();
            }
    }
;
    protected String mNumeric;
    private PhoneStateListener mPhoneStateListener;
    private String mPnn;
    private IRcseOnlyApnExtension mRcseExt;
    private BroadcastReceiver mReceiver;
    private RestoreApnProcessHandler mRestoreApnProcessHandler;
    private RestoreApnUiHandler mRestoreApnUiHandler;
    protected Uri mRestoreCarrierUri;
    protected boolean mRestoreDefaultApnMode;
    private HandlerThread mRestoreDefaultApnThread;
    protected int mSelectableApnCount;
    protected String mSelectedKey;
    protected int mSimId;
    private String mSpn;
    protected TelephonyManager mTelephonyManager;
    protected Uri mUri;

    public ApnSettings()
    {
        mIsCallStateIdle = true;
        mAirplaneModeEnabled = false;
        mDualSimMode = -1;
        mSelectableApnCount = 0;
        mSpn = "";
        mIMSI = "";
        mPnn = "";
        mIsTetherApn = false;
        mIsTetehred = false;
        mListener = new com.mediatek.settings.ext.IRcseOnlyApnExtension.OnRcseOnlyApnStateChangedListener() {

            final ApnSettings this$0;

            public void onRcseOnlyApnStateChanged(boolean flag)
            {
                Xlog.e("ApnSettings", (new StringBuilder()).append("onRcseOnlyApnStateChanged()-current state is ").append(flag).toString());
                fillList(mSimId);
            }

            
            {
                this$0 = ApnSettings.this;
                super();
            }
        }
;
        mPhoneStateListener = new PhoneStateListener() {

            final ApnSettings this$0;

            public void onServiceStateChanged(ServiceState servicestate)
            {
                super.onServiceStateChanged(servicestate);
                ApnSettings apnsettings = ApnSettings.this;
                boolean flag;
                if (mTelephonyManager.getCallState() == 0)
                    flag = true;
                else
                    flag = false;
                apnsettings.mIsCallStateIdle = flag;
            }

            
            {
                this$0 = ApnSettings.this;
                super();
            }
        }
;
    }

    private void fillList(int i)
    {
        String s = getFillListQuery();
        Xlog.e("ApnSettings", (new StringBuilder()).append("fillList where: ").append(s).toString());
        if (mUri == null)
        {
            Xlog.e("ApnSettings", "fillList, mUri null !");
            finish();
            return;
        }
        Cursor cursor = getContentResolver().query(mUri, new String[] {
            "_id", "name", "apn", "type", "sourcetype"
        }, s, null, null);
        PreferenceGroup preferencegroup = (PreferenceGroup)findPreference("apn_list");
        preferencegroup.removeAll();
        ArrayList arraylist = new ArrayList();
        boolean flag = false;
        mSelectedKey = getSelectedApnKey();
        Xlog.d("ApnSettings", (new StringBuilder()).append("fillList : mSelectedKey = ").append(mSelectedKey).toString());
        cursor.moveToFirst();
        do
        {
            if (cursor.isAfterLast())
                break;
            String s1 = cursor.getString(3);
            if (mIsTetherApn && !"tethering".equals(s1))
            {
                cursor.moveToNext();
                continue;
            }
            String s2 = cursor.getString(1);
            String s3 = cursor.getString(2);
            String s4 = cursor.getString(0);
            int k = cursor.getInt(4);
            if ("cmmail".equals(s3) && k == 0)
            {
                cursor.moveToNext();
                continue;
            }
            if ("rcse".equals(s1) && mRcseExt != null)
            {
                if (!mRcseExt.isRcseOnlyApnEnabled())
                {
                    cursor.moveToNext();
                    Xlog.d("ApnSettings", "Vodafone not matched");
                    continue;
                }
                Xlog.d("ApnSettings", "Vodafone matched");
            }
            ApnPreference apnpreference1 = new ApnPreference(this);
            apnpreference1.setSimId(i);
            apnpreference1.setKey(s4);
            apnpreference1.setTitle(s2);
            apnpreference1.setSummary(s3);
            apnpreference1.setPersistent(false);
            apnpreference1.setSourceType(k);
            apnpreference1.setOnPreferenceChangeListener(this);
            boolean flag1 = mExt.isAllowEditPresetApn(s1, s3, mNumeric);
            boolean flag2;
            if (k == 0 && !flag1)
                flag2 = false;
            else
                flag2 = true;
            apnpreference1.setApnEditable(flag2);
            boolean flag3;
            if ("tethering".equals(s1))
                flag3 = mIsTetherApn;
            else
            if (!"mms".equals(s1))
                flag3 = true;
            else
                flag3 = false;
            apnpreference1.setSelectable(flag3);
            if (flag3)
            {
                if (mSelectedKey != null && mSelectedKey.equals(s4))
                {
                    apnpreference1.setChecked();
                    flag = true;
                    Xlog.d("ApnSettings", (new StringBuilder()).append("apn key: ").append(s4).append(" set.").toString());
                }
                preferencegroup.addPreference(apnpreference1);
                Xlog.i("ApnSettings", (new StringBuilder()).append("key:  ").append(s4).append(" added!").toString());
            } else
            {
                arraylist.add(apnpreference1);
            }
            cursor.moveToNext();
        } while (true);
        cursor.close();
        mSelectableApnCount = preferencegroup.getPreferenceCount();
        if (!flag && mSelectableApnCount > 0)
        {
            int ai[] = new int[mSelectableApnCount];
            for (int j = 0; j < mSelectableApnCount; j++)
                ai[j] = ((ApnPreference)preferencegroup.getPreference(j)).getSourceType();

            ApnPreference apnpreference = (ApnPreference)mExt.getApnPref(preferencegroup, mSelectableApnCount, ai);
            if (apnpreference != null)
            {
                setSelectedApnKey(apnpreference.getKey());
                apnpreference.setChecked();
                Xlog.i("ApnSettings", (new StringBuilder()).append("Key does not match.Set key: ").append(apnpreference.getKey()).append(".").toString());
            }
        }
        if (!mIsTetherApn)
        {
            for (Iterator iterator = arraylist.iterator(); iterator.hasNext(); preferencegroup.addPreference((Preference)iterator.next()));
        }
        getPreferenceScreen().setEnabled(getScreenEnableState());
    }

    private static com.android.internal.telephony.PhoneConstants.DataState getMobileDataState(Intent intent)
    {
        String s = intent.getStringExtra("state");
        if (s != null)
            return (com.android.internal.telephony.PhoneConstants.DataState)Enum.valueOf(com/android/internal/telephony/PhoneConstants$DataState, s);
        else
            return com.android.internal.telephony.PhoneConstants.DataState.DISCONNECTED;
    }

    private String getSelectedApnKey()
    {
        Cursor cursor = getContentResolver().query(mRestoreCarrierUri, new String[] {
            "_id"
        }, null, null, "name ASC");
        int i = cursor.getCount();
        String s = null;
        if (i > 0)
        {
            cursor.moveToFirst();
            s = cursor.getString(0);
        }
        cursor.close();
        return s;
    }

    private void initSimState()
    {
        mSimId = getIntent().getIntExtra("simId", -1);
        if (android.provider.Telephony.SIMInfo.getInsertedSIMCount(this) > 1)
        {
            android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(this, mSimId);
            if (siminfo != null)
                setTitle(siminfo.mDisplayName);
        }
        Xlog.d("ApnSettings", (new StringBuilder()).append("GEMINI_SIM_ID_KEY = ").append(mSimId).toString());
        switch (mSimId)
        {
        case 3: // '\003'
            mUri = android.provider.Telephony.Carriers.SIM4Carriers.CONTENT_URI;
            mNumeric = SystemProperties.get("gsm.sim.operator.numeric.4", "-1");
            mDefaultApnUri = DEFAULTAPN_URI_GEMINI_SIM4;
            mRestoreCarrierUri = PREFERAPN_URI_GEMINI_SIM4;
            break;

        case 2: // '\002'
            mUri = android.provider.Telephony.Carriers.SIM3Carriers.CONTENT_URI;
            mNumeric = SystemProperties.get("gsm.sim.operator.numeric.3", "-1");
            mDefaultApnUri = DEFAULTAPN_URI_GEMINI_SIM3;
            mRestoreCarrierUri = PREFERAPN_URI_GEMINI_SIM3;
            break;

        case 1: // '\001'
            mUri = android.provider.Telephony.Carriers.SIM2Carriers.CONTENT_URI;
            mNumeric = SystemProperties.get("gsm.sim.operator.numeric.2", "-1");
            mDefaultApnUri = DEFAULTAPN_URI_GEMINI_SIM2;
            mRestoreCarrierUri = PREFERAPN_URI_GEMINI_SIM2;
            break;

        case 0: // '\0'
            mUri = android.provider.Telephony.Carriers.SIM1Carriers.CONTENT_URI;
            mNumeric = SystemProperties.get("gsm.sim.operator.numeric", "-1");
            mDefaultApnUri = DEFAULTAPN_URI_GEMINI_SIM1;
            mRestoreCarrierUri = PREFERAPN_URI_GEMINI_SIM1;
            break;

        case -1: 
            mUri = android.provider.Telephony.Carriers.CONTENT_URI;
            mNumeric = SystemProperties.get("gsm.sim.operator.numeric", "-1");
            mDefaultApnUri = DEFAULTAPN_URI;
            mRestoreCarrierUri = PREFERAPN_URI;
            break;

        default:
            Xlog.i("ApnSettings", "Incorrect sim id ");
            Intent intent = new Intent();
            intent.setClassName("com.android.phone", "com.mediatek.settings.MultipleSimActivity");
            intent.putExtra("TARGET_CLASS", "com.android.settings.ApnSettings");
            startActivity(intent);
            finish();
            break;
        }
        Xlog.d("ApnSettings", (new StringBuilder()).append("mNumeric ").append(mNumeric).toString());
        Xlog.d("ApnSettings", (new StringBuilder()).append("mUri = ").append(mUri).toString());
    }

    private boolean isMMSNotTransaction()
    {
label0:
        {
            boolean flag = true;
            ConnectivityManager connectivitymanager = (ConnectivityManager)getSystemService("connectivity");
            if (connectivitymanager != null)
            {
                NetworkInfo networkinfo = connectivitymanager.getNetworkInfo(2);
                if (networkinfo != null)
                {
                    android.net.NetworkInfo.State state = networkinfo.getState();
                    Xlog.d("ApnSettings", (new StringBuilder()).append("mms state = ").append(state).toString());
                    if (state == android.net.NetworkInfo.State.CONNECTING || state == android.net.NetworkInfo.State.CONNECTED)
                        break label0;
                    flag = true;
                }
            }
            return flag;
        }
        return false;
    }

    private boolean restoreDefaultApn()
    {
        Xlog.w("ApnSettings", "restore Default Apn.");
        showDialog(1001);
        mRestoreDefaultApnMode = true;
        if (mRestoreApnUiHandler == null)
            mRestoreApnUiHandler = new RestoreApnUiHandler();
        if (mRestoreApnProcessHandler == null || mRestoreDefaultApnThread == null)
        {
            mRestoreDefaultApnThread = new HandlerThread("Restore default APN Handler: Process Thread");
            mRestoreDefaultApnThread.start();
            mRestoreApnProcessHandler = new RestoreApnProcessHandler(mRestoreDefaultApnThread.getLooper(), mRestoreApnUiHandler);
        }
        mRestoreApnProcessHandler.sendEmptyMessage(1);
        return true;
    }

    private void setIMSI()
    {
        try
        {
            mIMSI = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone")).isOperatorMvnoForImsiGemini(mSimId);
            Xlog.d("ApnSettings", (new StringBuilder()).append("IMSI = ").append(mIMSI).toString());
        }
        catch (RemoteException remoteexception)
        {
            Xlog.d("ApnSettings", "RemoteException");
        }
        Xlog.d("ApnSettings", (new StringBuilder()).append("IMSI = ").append(mIMSI).toString());
    }

    private void setPnn()
    {
        mPnn = mTelephonyManager.isOperatorMvnoForEfPnnGemini(mSimId);
        Xlog.d("ApnSettings", (new StringBuilder()).append("Pnn = ").append(mPnn).toString());
    }

    private void setSpn()
    {
        try
        {
            mSpn = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone")).getSpNameInEfSpnGemini(mSimId);
            Xlog.d("ApnSettings", (new StringBuilder()).append("spn = ").append(mSpn).toString());
            return;
        }
        catch (RemoteException remoteexception)
        {
            Xlog.d("ApnSettings", "RemoteException");
        }
    }

    protected void addMenu(Menu menu)
    {
        menu.add(0, 1, 0, getResources().getString(0x7f0b05a8)).setIcon(0x1080033);
        menu.add(0, 2, 0, getResources().getString(0x7f0b05b1)).setIcon(0x1080055);
    }

    protected void addNewApn()
    {
        Intent intent = new Intent("android.intent.action.INSERT", mUri);
        intent.putExtra("simId", mSimId);
        startActivity(intent);
    }

    protected BroadcastReceiver getBroadcastReceiver()
    {
        return mMobileStateReceiver;
    }

    protected String getFillListQuery()
    {
        boolean flag5 = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone")).isIccCardProviderAsMvnoGemini(mSimId);
        boolean flag = flag5;
_L1:
        String s = "";
        Xlog.d("ApnSettings", (new StringBuilder()).append("[isMVNO =").append(flag).append("]").toString());
        if (flag)
        {
            String s2 = mIMSI;
            boolean flag1 = false;
            if (s2 != null)
            {
                boolean flag4 = mIMSI.isEmpty();
                flag1 = false;
                if (!flag4)
                {
                    flag1 = true;
                    s = (new StringBuilder()).append(s).append(" imsi=\"").append(mIMSI).append("\"").toString();
                }
            }
            String s3 = mSpn;
            boolean flag2 = false;
            if (s3 != null)
            {
                boolean flag3 = mSpn.isEmpty();
                flag2 = false;
                if (!flag3)
                {
                    flag2 = true;
                    RemoteException remoteexception;
                    String s1;
                    if (flag1)
                        s = (new StringBuilder()).append(s).append(" or spn=\"").append(mSpn).append("\"").toString();
                    else
                        s = (new StringBuilder()).append(s).append(" spn=\"").append(mSpn).append("\"").toString();
                }
            }
            if (mPnn != null && !mPnn.isEmpty())
                if (flag1 || flag2)
                    s = (new StringBuilder()).append(s).append(" or pnn=\"").append(mPnn).append("\"").toString();
                else
                    s = (new StringBuilder()).append(s).append(" pnn=\"").append(mPnn).append("\"").toString();
        } else
        {
            s = "(spn is NULL or spn=\"\") and (imsi is NULL or imsi=\"\") and (pnn is NULL or pnn=\"\") ";
        }
        s1 = (new StringBuilder()).append("numeric=\"").append(mNumeric).append("\" and ( ").append(s).append(")").toString();
        Xlog.e("ApnSettings", (new StringBuilder()).append("getFillListQuery result: ").append(s1).toString());
        return s1;
        remoteexception;
        Xlog.d("ApnSettings", "RemoteException");
        flag = false;
          goto _L1
    }

    protected IntentFilter getIntentFilter()
    {
        IntentFilter intentfilter = new IntentFilter("android.intent.action.ANY_DATA_STATE");
        intentfilter.addAction("android.intent.action.AIRPLANE_MODE");
        intentfilter.addAction("android.intent.action.SIM_STATE_CHANGED");
        intentfilter.addAction("com.android.mms.transaction.START");
        intentfilter.addAction("com.android.mms.transaction.STOP");
        intentfilter.addAction("android.intent.action.DUAL_SIM_MODE");
        intentfilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        return intentfilter;
    }

    protected boolean getScreenEnableState()
    {
        boolean flag;
        if (5 == TelephonyManager.getDefault().getSimStateGemini(mSimId))
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (mTelephonyManager.getCallState() == 0)
            flag1 = true;
        else
            flag1 = false;
        mIsCallStateIdle = flag1;
        return sNotInMmsTransation && mIsCallStateIdle && !mAirplaneModeEnabled && flag;
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050006);
        getListView().setItemsCanFocus(true);
        mExt = Utils.getMiscPlugin(this);
        mRcseExt = Utils.getRcseApnPlugin(this);
        if (mRcseExt != null)
            mRcseExt.addRcseOnlyApnStateChanged(mListener);
        else
            Xlog.d("ApnSettings", "mApnPlugin is null");
        initSimState();
        mMobileStateFilter = getIntentFilter();
        mReceiver = getBroadcastReceiver();
        mTelephonyManager = (TelephonyManager)getSystemService("phone");
        mTelephonyManager.listen(mPhoneStateListener, 1);
        setSpn();
        setIMSI();
        setPnn();
    }

    protected Dialog onCreateDialog(int i)
    {
        if (i == 1001)
        {
            ProgressDialog progressdialog = new ProgressDialog(this);
            progressdialog.setMessage(getResources().getString(0x7f0b05b0));
            progressdialog.setCancelable(false);
            return progressdialog;
        }
        if (i == 2000)
            return (new android.app.AlertDialog.Builder(this)).setTitle(0x7f0b0092).setMessage(0x7f0b0093).setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

                final ApnSettings this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    finish();
                }

            
            {
                this$0 = ApnSettings.this;
                super();
            }
            }
).create();
        else
            return null;
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        super.onCreateOptionsMenu(menu);
        addMenu(menu);
        return true;
    }

    protected void onDestroy()
    {
        super.onDestroy();
        mTelephonyManager.listen(mPhoneStateListener, 0);
        Xlog.d("ApnSettings", "onDestroy set PhoneStateListener.LISTEN_NONE!");
        if (mRestoreDefaultApnThread != null)
            mRestoreDefaultApnThread.quit();
        if (mRcseExt != null)
            mRcseExt.removeRcseOnlyApnStateChanged(mListener);
    }

    public boolean onMenuOpened(int i, Menu menu)
    {
        super.onMenuOpened(i, menu);
        if (menu != null)
            menu.setGroupEnabled(0, getScreenEnableState());
        return true;
    }

    protected void onNewIntent(Intent intent)
    {
        setIntent(intent);
        initSimState();
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 2: // '\002'
            restoreDefaultApn();
            return true;

        case 1: // '\001'
            addNewApn();
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    protected void onPause()
    {
        super.onPause();
        unregisterReceiver(mReceiver);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        Log.d("ApnSettings", (new StringBuilder()).append("onPreferenceChange(): Preference - ").append(preference).append(", newValue - ").append(obj).append(", newValue type - ").append(obj.getClass()).toString());
        if (obj instanceof String)
            setSelectedApnKey((String)obj);
        return true;
    }

    protected void onPrepareDialog(int i, Dialog dialog)
    {
        if (i == 1001)
            getPreferenceScreen().setEnabled(false);
    }

    protected void onResume()
    {
        super.onResume();
        registerReceiver(mReceiver, mMobileStateFilter);
        mAirplaneModeEnabled = AirplaneModeEnabler.isAirplaneModeOn(this);
        mDualSimMode = android.provider.Settings.System.getInt(getContentResolver(), "dual_sim_mode_setting", -1);
        sNotInMmsTransation = isMMSNotTransaction();
        if (mAirplaneModeEnabled || mDualSimMode == 0)
            showDialog(2000);
        if (!mRestoreDefaultApnMode)
            fillList(mSimId);
    }

    protected void setSelectedApnKey(String s)
    {
        mSelectedKey = s;
        ContentResolver contentresolver = getContentResolver();
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("apn_id", mSelectedKey);
        contentresolver.update(mRestoreCarrierUri, contentvalues, null, null);
    }





/*
    static boolean access$1002(boolean flag)
    {
        sNotInMmsTransation = flag;
        return flag;
    }

*/



/*
    static int access$202(ApnSettings apnsettings, int i)
    {
        apnsettings.mDualSimMode = i;
        return i;
    }

*/







}
