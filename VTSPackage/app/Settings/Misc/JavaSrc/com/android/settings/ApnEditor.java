// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.*;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.database.Cursor;
import android.net.*;
import android.os.*;
import android.preference.*;
import android.telephony.*;
import android.util.Log;
import android.view.*;
import com.android.internal.telephony.ITelephony;
import com.mediatek.settings.ext.IApnEditorExt;
import com.mediatek.xlog.Xlog;
import java.util.List;

// Referenced classes of package com.android.settings:
//            ApnTypePreference, Utils, AirplaneModeEnabler

public class ApnEditor extends PreferenceActivity
    implements android.content.SharedPreferences.OnSharedPreferenceChangeListener, android.preference.Preference.OnPreferenceChangeListener
{

    private static final int APN_INDEX = 2;
    private static final int AUTH_TYPE_INDEX = 14;
    private static final int BEARER_INDEX = 18;
    private static final int CARRIER_ENABLED_INDEX = 17;
    private static final int DIALOG_CONFIRM_CHANGE = 1;
    private static final int ERROR_DIALOG_ID = 0;
    private static final int ID_INDEX = 0;
    private static final String KEY_APN_TYPE_LIST = "apn_type_list";
    private static final String KEY_AUTH_TYPE = "auth_type";
    private static final String KEY_BEARER = "bearer";
    private static final String KEY_CARRIER_ENABLED = "carrier_enabled";
    private static final String KEY_PROTOCOL = "apn_protocol";
    private static final String KEY_ROAMING_PROTOCOL = "apn_roaming_protocol";
    private static final int MCC_INDEX = 9;
    private static final int MENU_CANCEL = 3;
    private static final int MENU_DELETE = 1;
    private static final int MENU_SAVE = 2;
    private static final int MMSC_INDEX = 8;
    private static final int MMSPORT_INDEX = 13;
    private static final int MMSPROXY_INDEX = 12;
    private static final int MNC_INDEX = 10;
    private static final int NAME_INDEX = 1;
    private static final int PASSWORD_INDEX = 7;
    private static final int PORT_INDEX = 4;
    private static final String PROJECTION[] = {
        "_id", "name", "apn", "proxy", "port", "user", "server", "password", "mmsc", "mcc", 
        "mnc", "numeric", "mmsproxy", "mmsport", "authtype", "type", "protocol", "carrier_enabled", "bearer", "roaming_protocol", 
        "sourcetype"
    };
    private static final int PROTOCOL_INDEX = 16;
    private static final int PROXY_INDEX = 3;
    private static final int ROAMING_PROTOCOL_INDEX = 19;
    private static final String SAVED_POS = "pos";
    private static final int SERVER_INDEX = 6;
    private static final int SIM_CARD_SINGLE = 0;
    private static final int SOURCE_TYPE_DEFAULT = 0;
    private static final int SOURCE_TYPE_INDEX = 20;
    private static final int SOURCE_TYPE_OMACP = 2;
    private static final int SOURCE_TYPE_USER_EDIT = 1;
    private static final String SS_TAG = "ssr";
    private static final String TAG = com/android/settings/ApnEditor.getSimpleName();
    private static final String TRANSACTION_START = "com.android.mms.transaction.START";
    private static final String TRANSACTION_STOP = "com.android.mms.transaction.STOP";
    private static final int TYPE_INDEX = 15;
    private static final int USER_INDEX = 5;
    private static String sNotSet;
    private boolean mAirplaneModeEnabled;
    private EditTextPreference mApn;
    private ApnTypePreference mApnTypeList;
    private ListPreference mAuthType;
    private ListPreference mBearer;
    private CheckBoxPreference mCarrierEnabled;
    private ContentObserver mContentObserver;
    private String mCurMcc;
    private String mCurMnc;
    private Cursor mCursor;
    private int mDualSimMode;
    IApnEditorExt mExt;
    private boolean mFirstTime;
    private String mIMSI;
    private IntentFilter mIntentFilter;
    private boolean mIsCallStateIdle;
    private EditTextPreference mMcc;
    private EditTextPreference mMmsPort;
    private EditTextPreference mMmsProxy;
    private EditTextPreference mMmsc;
    private EditTextPreference mMnc;
    private EditTextPreference mName;
    private boolean mNewApn;
    private boolean mNotInMmsTransaction;
    private EditTextPreference mPassword;
    private PhoneStateListener mPhoneStateListener;
    private PhoneStateListener mPhoneStateListener1;
    private String mPnn;
    private EditTextPreference mPort;
    private ListPreference mProtocol;
    private Uri mProviderUri;
    private EditTextPreference mProxy;
    private boolean mReadOnlyMode;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final ApnEditor this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            if (s.equals("android.intent.action.AIRPLANE_MODE"))
            {
                mAirplaneModeEnabled = intent.getBooleanExtra("state", false);
                if (mAirplaneModeEnabled)
                {
                    Xlog.d("ssr", "receiver: ACTION_AIRPLANE_MODE_CHANGED in ApnEditor");
                    radioOffExit();
                }
            } else
            {
                if (s.equals("com.android.mms.transaction.START"))
                {
                    Xlog.d("ssr", "receiver: TRANSACTION_START in ApnEditor");
                    mNotInMmsTransaction = false;
                    getPreferenceScreen().setEnabled(false);
                    return;
                }
                if (s.equals("com.android.mms.transaction.STOP"))
                {
                    Xlog.d("ssr", "receiver: TRANSACTION_STOP in ApnEditor");
                    mNotInMmsTransaction = true;
                    setScreenEnabledStatus();
                    if ("tethering".equals(mApnTypeList.getTypeString()))
                    {
                        mExt.setPreferenceState(mApnTypeList);
                        return;
                    }
                } else
                if (s.equals("android.intent.action.DUAL_SIM_MODE"))
                {
                    mDualSimMode = intent.getIntExtra("mode", -1);
                    Xlog.d(ApnEditor.TAG, (new StringBuilder()).append("receiver, new dual sim mode").append(mDualSimMode).toString());
                    if (mDualSimMode == 0)
                    {
                        radioOffExit();
                        return;
                    }
                } else
                if ("android.intent.action.SIM_STATE_CHANGED".equals(s))
                {
                    if (mSpn == null || mSpn.isEmpty())
                        setSpn();
                    if (mIMSI == null || mIMSI.isEmpty())
                        setIMSI();
                    if (mPnn == null || mPnn.isEmpty())
                    {
                        setPnn();
                        return;
                    }
                } else
                if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
                {
                    List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(ApnEditor.this);
                    if (list.size() == 0)
                    {
                        Xlog.d(ApnEditor.TAG, "Activity finished");
                        finish();
                        return;
                    }
                    if (list.size() == 1 && ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot != mSimId)
                    {
                        Xlog.d(ApnEditor.TAG, (new StringBuilder()).append("temp.size()=").append(list.size()).append("Activity finished").toString());
                        finish();
                        return;
                    }
                }
            }
        }

            
            {
                this$0 = ApnEditor.this;
                super();
            }
    }
;
    private Resources mRes;
    private ListPreference mRoamingProtocol;
    private EditTextPreference mServer;
    private int mSimId;
    private int mSourceType;
    private String mSpn;
    private Uri mUri;
    private EditTextPreference mUser;

    public ApnEditor()
    {
        mSourceType = -1;
        mIsCallStateIdle = true;
        mAirplaneModeEnabled = false;
        mDualSimMode = -1;
        mNotInMmsTransaction = true;
        mReadOnlyMode = false;
        mSpn = "";
        mIMSI = "";
        mPnn = "";
        mPhoneStateListener = new PhoneStateListener() {

            final ApnEditor this$0;

            public void onServiceStateChanged(ServiceState servicestate)
            {
                super.onServiceStateChanged(servicestate);
                TelephonyManager telephonymanager = (TelephonyManager)getSystemService("phone");
                ApnEditor apneditor = ApnEditor.this;
                boolean flag;
                if (telephonymanager.getCallState() == 0)
                    flag = true;
                else
                    flag = false;
                apneditor.mIsCallStateIdle = flag;
                Xlog.d(ApnEditor.TAG, (new StringBuilder()).append("[onServiceStateChanged][mIsCallStateIdle=").append(mIsCallStateIdle).append("]").toString());
                invalidateOptionsMenu();
            }

            
            {
                this$0 = ApnEditor.this;
                super();
            }
        }
;
        mPhoneStateListener1 = new PhoneStateListener() {

            final ApnEditor this$0;

            public void onCallStateChanged(int i, String s)
            {
                super.onCallStateChanged(i, s);
                TelephonyManager telephonymanager = (TelephonyManager)getSystemService("phone");
                ApnEditor apneditor = ApnEditor.this;
                boolean flag;
                if (telephonymanager.getCallState() == 0)
                    flag = true;
                else
                    flag = false;
                apneditor.mIsCallStateIdle = flag;
                Xlog.d(ApnEditor.TAG, (new StringBuilder()).append("[onCallStateChanged][mIsCallStateIdle=").append(mIsCallStateIdle).append("]").toString());
                invalidateOptionsMenu();
            }

            
            {
                this$0 = ApnEditor.this;
                super();
            }
        }
;
        mContentObserver = new ContentObserver(new Handler()) {

            final ApnEditor this$0;

            public void onChange(boolean flag)
            {
                Xlog.d(ApnEditor.TAG, "background changed apn ");
                mFirstTime = true;
                stopManagingCursor(mCursor);
                mCursor = managedQuery(mUri, ApnEditor.PROJECTION, null, null);
                mCursor.moveToFirst();
                fillUi();
            }

            
            {
                this$0 = ApnEditor.this;
                super(handler);
            }
        }
;
    }

    private String bearerDescription(String s)
    {
        int i = mBearer.findIndexOfValue(s);
        if (i == -1)
            return null;
        String as[] = mRes.getStringArray(0x7f07002c);
        String s1;
        try
        {
            s1 = as[i];
        }
        catch (ArrayIndexOutOfBoundsException arrayindexoutofboundsexception)
        {
            return null;
        }
        return s1;
    }

    private String checkNotSet(String s)
    {
        if (s == null || s.equals(sNotSet))
            s = "";
        return s;
    }

    private String checkNull(String s)
    {
        if (s == null || s.length() == 0)
            s = sNotSet;
        return s;
    }

    private void deleteApn()
    {
        if (mUri != null)
            getContentResolver().delete(mUri, null, null);
        finish();
    }

    private void fillUi()
    {
        if (mCursor.getCount() == 0)
        {
            finish();
            return;
        }
        if (mFirstTime)
        {
            mFirstTime = false;
            mName.setText(mCursor.getString(1));
            mApn.setText(mCursor.getString(2));
            mProxy.setText(mCursor.getString(3));
            mPort.setText(mCursor.getString(4));
            mUser.setText(mCursor.getString(5));
            mServer.setText(mCursor.getString(6));
            mPassword.setText(mCursor.getString(7));
            mMmsProxy.setText(mCursor.getString(12));
            mMmsPort.setText(mCursor.getString(13));
            mMmsc.setText(mCursor.getString(8));
            mMcc.setText(mCursor.getString(9));
            mMnc.setText(mCursor.getString(10));
            String s1 = mCursor.getString(15);
            mApnTypeList.setType(mCursor.getString(9), mCursor.getString(10), getIntent());
            mApnTypeList.setSummary(checkNull(s1));
            mApnTypeList.intCheckState(s1);
            if (mNewApn)
            {
                String s2 = SystemProperties.get(getIccOperator(mSimId));
                if (s2 != null && s2.length() > 4)
                {
                    String s3 = s2.substring(0, 3);
                    String s4 = s2.substring(3);
                    mMcc.setText(s3);
                    mMnc.setText(s4);
                    mCurMnc = s4;
                    mCurMcc = s3;
                }
                if ("tethering".equals(getIntent().getStringExtra("apn_type")))
                {
                    mApnTypeList.setSummary("tethering");
                    mApnTypeList.intCheckState("tethering");
                } else
                {
                    mApnTypeList.setSummary("default");
                    mApnTypeList.intCheckState("default");
                }
            }
            int j = mCursor.getInt(14);
            if (j != -1)
                mAuthType.setValueIndex(j);
            else
                mAuthType.setValue(null);
            mProtocol.setValue(mCursor.getString(16));
            mRoamingProtocol.setValue(mCursor.getString(19));
            CheckBoxPreference checkboxpreference = mCarrierEnabled;
            boolean flag;
            if (mCursor.getInt(17) == 1)
                flag = true;
            else
                flag = false;
            checkboxpreference.setChecked(flag);
            mBearer.setValue(mCursor.getString(18));
            mSourceType = mCursor.getInt(20);
        }
        mName.setSummary(checkNull(mName.getText()));
        mApn.setSummary(checkNull(mApn.getText()));
        mProxy.setSummary(checkNull(mProxy.getText()));
        mPort.setSummary(checkNull(mPort.getText()));
        mUser.setSummary(checkNull(mUser.getText()));
        mServer.setSummary(checkNull(mServer.getText()));
        mPassword.setSummary(starify(mPassword.getText()));
        mMmsProxy.setSummary(checkNull(mMmsProxy.getText()));
        mMmsPort.setSummary(checkNull(mMmsPort.getText()));
        mMmsc.setSummary(checkNull(mMmsc.getText()));
        mMcc.setSummary(checkNull(mMcc.getText()));
        mMnc.setSummary(checkNull(mMnc.getText()));
        String s = mAuthType.getValue();
        if (s != null)
        {
            int i = Integer.parseInt(s);
            mAuthType.setValueIndex(i);
            String as[] = mRes.getStringArray(0x7f070028);
            mAuthType.setSummary(as[i]);
        } else
        {
            mAuthType.setSummary(sNotSet);
        }
        mProtocol.setSummary(checkNull(protocolDescription(mProtocol.getValue(), mProtocol)));
        mRoamingProtocol.setSummary(checkNull(protocolDescription(mRoamingProtocol.getValue(), mRoamingProtocol)));
        mBearer.setSummary(checkNull(bearerDescription(mBearer.getValue())));
    }

    private String getErrorMsg()
    {
        String s = checkNotSet(mName.getText());
        String s1 = checkNotSet(mApn.getText());
        String s2 = checkNotSet(mMcc.getText());
        String s3 = checkNotSet(mMnc.getText());
        String s4;
        if (s.length() < 1)
        {
            s4 = mRes.getString(0x7f0b05ac);
        } else
        {
            if (s1.length() < 1)
                return mRes.getString(0x7f0b05ad);
            if (s2.length() != 3)
                return mRes.getString(0x7f0b05ae);
            int i = 0xfffe & s3.length();
            s4 = null;
            if (i != 2)
                return mRes.getString(0x7f0b05af);
        }
        return s4;
    }

    private Uri getGeminiUri(int i)
    {
        Log.d(TAG, (new StringBuilder()).append("simId=").append(i).toString());
        switch (i)
        {
        case 3: // '\003'
            return android.provider.Telephony.Carriers.SIM4Carriers.CONTENT_URI;

        case 2: // '\002'
            return android.provider.Telephony.Carriers.SIM3Carriers.CONTENT_URI;

        case 1: // '\001'
            return android.provider.Telephony.Carriers.SIM2Carriers.CONTENT_URI;

        case 0: // '\0'
            return android.provider.Telephony.Carriers.SIM1Carriers.CONTENT_URI;
        }
        Log.d(TAG, (new StringBuilder()).append("Error need to check simId=").append(i).toString());
        return android.provider.Telephony.Carriers.SIM1Carriers.CONTENT_URI;
    }

    private String getIccOperator(int i)
    {
        switch (i)
        {
        case 3: // '\003'
            return "gsm.sim.operator.numeric.4";

        case 2: // '\002'
            return "gsm.sim.operator.numeric.3";

        case 1: // '\001'
            return "gsm.sim.operator.numeric.2";

        case 0: // '\0'
            return "gsm.sim.operator.numeric";
        }
        Log.d(TAG, (new StringBuilder()).append("Error need to check simId=").append(i).toString());
        return "gsm.sim.operator.numeric";
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
                    Xlog.d(TAG, (new StringBuilder()).append("mms state = ").append(state).toString());
                    if (state == android.net.NetworkInfo.State.CONNECTING || state == android.net.NetworkInfo.State.CONNECTED)
                        break label0;
                    flag = true;
                }
            }
            return flag;
        }
        return false;
    }

    private String protocolDescription(String s, ListPreference listpreference)
    {
        int i = listpreference.findIndexOfValue(s);
        if (i == -1)
            return null;
        String as[] = mRes.getStringArray(0x7f07002a);
        String s1;
        try
        {
            s1 = as[i];
        }
        catch (ArrayIndexOutOfBoundsException arrayindexoutofboundsexception)
        {
            return null;
        }
        return s1;
    }

    private void radioOffExit()
    {
        if (mNewApn && mUri != null)
            getContentResolver().delete(mUri, null, null);
        finish();
    }

    private void setIMSI()
    {
        try
        {
            mIMSI = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone")).isOperatorMvnoForImsiGemini(mSimId);
        }
        catch (RemoteException remoteexception)
        {
            Xlog.d(TAG, "RemoteException");
        }
        Xlog.d(TAG, (new StringBuilder()).append("IMSI = ").append(mIMSI).toString());
    }

    private void setPnn()
    {
        mPnn = ((TelephonyManager)getSystemService("phone")).isOperatorMvnoForEfPnnGemini(mSimId);
        Xlog.d(TAG, (new StringBuilder()).append("mPnn = ").append(mPnn).toString());
    }

    private void setScreenEnabledStatus()
    {
        if (mReadOnlyMode)
            Log.d(TAG, "-----------mReadOnlyMode is true -----------");
        if (mAirplaneModeEnabled)
            Log.d(TAG, "-----------mAirplaneModeEnabled is true -----------");
        if (!mNotInMmsTransaction)
            Log.d(TAG, "-----------!mNotInMmsTransaction is true -----------");
        if (mDualSimMode == 0)
            Log.d(TAG, "-----------mDualSimMode is 0 -----------");
        PreferenceScreen preferencescreen = getPreferenceScreen();
        boolean flag;
        if (!mReadOnlyMode && !mAirplaneModeEnabled && mNotInMmsTransaction && mDualSimMode != 0)
            flag = true;
        else
            flag = false;
        preferencescreen.setEnabled(flag);
    }

    private void setSpn()
    {
        try
        {
            mSpn = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone")).getSpNameInEfSpnGemini(mSimId);
        }
        catch (RemoteException remoteexception)
        {
            Xlog.d(TAG, "RemoteException");
        }
        Xlog.d(TAG, (new StringBuilder()).append("spn = ").append(mSpn).toString());
    }

    private String starify(String s)
    {
        if (s != null && s.length() != 0)
        {
            char ac[] = new char[s.length()];
            for (int i = 0; i < ac.length; i++)
                ac[i] = '*';

            return new String(ac);
        } else
        {
            return sNotSet;
        }
    }

    private boolean validateAndSave(boolean flag)
    {
        String s2;
        String s3;
        ContentValues contentvalues;
        String s = checkNotSet(mName.getText());
        String s1 = checkNotSet(mApn.getText());
        s2 = checkNotSet(mMcc.getText());
        s3 = checkNotSet(mMnc.getText());
        if (getErrorMsg() != null && !flag)
        {
            showDialog(0);
            return false;
        }
        if (!mCursor.moveToFirst() && !mNewApn)
        {
            Log.w(TAG, "Could not go to the first row in the Cursor when saving data.");
            return false;
        }
        if (flag && mNewApn && s.length() < 1 && s1.length() < 1)
        {
            if (mUri != null)
            {
                getContentResolver().delete(mUri, null, null);
                mUri = null;
            }
            return false;
        }
        contentvalues = new ContentValues();
        if (s.length() < 1)
            s = getResources().getString(0x7f0b0807);
        contentvalues.put("name", s);
        contentvalues.put("apn", s1);
        contentvalues.put("proxy", checkNotSet(mProxy.getText()));
        contentvalues.put("port", checkNotSet(mPort.getText()));
        contentvalues.put("mmsproxy", checkNotSet(mMmsProxy.getText()));
        contentvalues.put("mmsport", checkNotSet(mMmsPort.getText()));
        contentvalues.put("user", checkNotSet(mUser.getText()));
        contentvalues.put("server", checkNotSet(mServer.getText()));
        contentvalues.put("password", checkNotSet(mPassword.getText()));
        contentvalues.put("mmsc", checkNotSet(mMmsc.getText()));
        boolean flag2 = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone")).isIccCardProviderAsMvnoGemini(mSimId);
        boolean flag1 = flag2;
_L1:
        RemoteException remoteexception;
        String s4;
        int i;
        String s5;
        if (flag1)
            if (mIMSI != null && !mIMSI.isEmpty())
                contentvalues.put("imsi", checkNotSet(mIMSI));
            else
            if (mSpn != null && !mSpn.isEmpty())
                contentvalues.put("spn", checkNotSet(mSpn));
            else
                contentvalues.put("pnn", checkNotSet(mPnn));
        s4 = mAuthType.getValue();
        if (s4 != null)
            contentvalues.put("authtype", Integer.valueOf(Integer.parseInt(s4)));
        contentvalues.put("protocol", checkNotSet(mProtocol.getValue()));
        contentvalues.put("roaming_protocol", checkNotSet(mRoamingProtocol.getValue()));
        contentvalues.put("type", checkNotSet(mApnTypeList.getTypeString()));
        if (mCarrierEnabled.isChecked())
            i = 1;
        else
            i = 0;
        contentvalues.put("carrier_enabled", Integer.valueOf(i));
        contentvalues.put("mcc", s2);
        contentvalues.put("mnc", s3);
        contentvalues.put("numeric", (new StringBuilder()).append(s2).append(s3).toString());
        if (mCurMnc != null && mCurMcc != null && mCurMnc.equals(s3) && mCurMcc.equals(s2))
            contentvalues.put("current", Integer.valueOf(1));
        s5 = mBearer.getValue();
        if (s5 != null)
            contentvalues.put("bearer", Integer.valueOf(Integer.parseInt(s5)));
        if (mNewApn)
            contentvalues.put("sourcetype", Integer.valueOf(1));
        if (mUri == null)
        {
            Xlog.i(TAG, "former inserted URI was already deleted, insert a new one");
            mUri = getContentResolver().insert(getIntent().getData(), new ContentValues());
        }
        if (mUri != null)
            getContentResolver().update(mUri, contentvalues, null, null);
        return true;
        remoteexception;
        Xlog.d(TAG, "RemoteException");
        flag1 = false;
          goto _L1
    }

    protected void onCreate(Bundle bundle)
    {
label0:
        {
            super.onCreate(bundle);
            addPreferencesFromResource(0x7f050005);
            sNotSet = getResources().getString(0x7f0b058e);
            mName = (EditTextPreference)findPreference("apn_name");
            mApn = (EditTextPreference)findPreference("apn_apn");
            mProxy = (EditTextPreference)findPreference("apn_http_proxy");
            mPort = (EditTextPreference)findPreference("apn_http_port");
            mUser = (EditTextPreference)findPreference("apn_user");
            mServer = (EditTextPreference)findPreference("apn_server");
            mPassword = (EditTextPreference)findPreference("apn_password");
            mMmsProxy = (EditTextPreference)findPreference("apn_mms_proxy");
            mMmsPort = (EditTextPreference)findPreference("apn_mms_port");
            mMmsc = (EditTextPreference)findPreference("apn_mmsc");
            mMcc = (EditTextPreference)findPreference("apn_mcc");
            mMnc = (EditTextPreference)findPreference("apn_mnc");
            mApnTypeList = (ApnTypePreference)findPreference("apn_type_list");
            mApnTypeList.setOnPreferenceChangeListener(this);
            mAuthType = (ListPreference)findPreference("auth_type");
            mAuthType.setOnPreferenceChangeListener(this);
            mProtocol = (ListPreference)findPreference("apn_protocol");
            mProtocol.setOnPreferenceChangeListener(this);
            mRoamingProtocol = (ListPreference)findPreference("apn_roaming_protocol");
            mRoamingProtocol.setOnPreferenceChangeListener(this);
            mCarrierEnabled = (CheckBoxPreference)findPreference("carrier_enabled");
            mBearer = (ListPreference)findPreference("bearer");
            mBearer.setOnPreferenceChangeListener(this);
            mRes = getResources();
            Intent intent = getIntent();
            String s = intent.getAction();
            boolean flag;
            if (bundle == null)
                flag = true;
            else
                flag = false;
            mFirstTime = flag;
            mSimId = intent.getIntExtra("simId", 0);
            mProviderUri = getGeminiUri(mSimId);
            mExt = Utils.getApnEditorPlugin(this);
            if (s.equals("android.intent.action.EDIT"))
            {
                mUri = intent.getData();
                mReadOnlyMode = intent.getBooleanExtra("readOnly", false);
                Xlog.d(TAG, (new StringBuilder()).append("Read only mode : ").append(mReadOnlyMode).toString());
            } else
            {
                if (!s.equals("android.intent.action.INSERT"))
                    break label0;
                if (!mFirstTime && bundle.getInt("pos") != 0)
                {
                    mUri = mExt.getUriFromIntent(this, intent);
                    mUri = ContentUris.withAppendedId(mProviderUri, bundle.getInt("pos"));
                } else
                {
                    mUri = getContentResolver().insert(intent.getData(), new ContentValues());
                }
                mNewApn = true;
                if (mUri == null)
                {
                    Log.w(TAG, (new StringBuilder()).append("Failed to insert new telephony provider into ").append(getIntent().getData()).toString());
                    finish();
                    return;
                }
                setResult(-1, (new Intent()).setAction(mUri.toString()));
            }
            mIntentFilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
            mIntentFilter.addAction("android.intent.action.SIM_STATE_CHANGED");
            mIntentFilter.addAction("android.intent.action.SIM_INFO_UPDATE");
            if (!mReadOnlyMode)
            {
                mIntentFilter.addAction("com.android.mms.transaction.START");
                mIntentFilter.addAction("com.android.mms.transaction.STOP");
            }
            mCursor = managedQuery(mUri, PROJECTION, null, null);
            mCursor.moveToFirst();
            fillUi();
            if (!mNewApn)
                getContentResolver().registerContentObserver(mUri, true, mContentObserver);
            setSpn();
            setIMSI();
            setPnn();
            return;
        }
        finish();
    }

    protected Dialog onCreateDialog(int i)
    {
        if (i == 0)
        {
            String s = getErrorMsg();
            return (new android.app.AlertDialog.Builder(this)).setTitle(0x7f0b05ab).setPositiveButton(0x104000a, null).setMessage(s).create();
        }
        if (i == 1)
            return (new android.app.AlertDialog.Builder(this)).setIcon(0x1080027).setTitle(0x7f0b05ab).setMessage(getString(0x7f0b0091)).setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

                final ApnEditor this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    if (validateAndSave(false))
                        finish();
                }

            
            {
                this$0 = ApnEditor.this;
                super();
            }
            }
).setNegativeButton(0x7f0b034b, null).create();
        else
            return super.onCreateDialog(i);
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        super.onCreateOptionsMenu(menu);
        if (mReadOnlyMode)
            return true;
        if (!mNewApn && mSourceType != 0)
            menu.add(0, 1, 0, 0x7f0b05a7).setIcon(0x7f02006b);
        menu.add(0, 2, 0, 0x7f0b05a9).setIcon(0x108004e);
        menu.add(0, 3, 0, 0x7f0b05aa).setIcon(0x1080038);
        return true;
    }

    public void onDestroy()
    {
        if (!mNewApn)
            getContentResolver().unregisterContentObserver(mContentObserver);
        super.onDestroy();
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        switch (i)
        {
        case 4: // '\004'
            if (validateAndSave(false))
                finish();
            return true;
        }
        return super.onKeyDown(i, keyevent);
    }

    public boolean onMenuOpened(int i, Menu menu)
    {
        super.onMenuOpened(i, menu);
        if (menu != null)
        {
            boolean flag;
            if (mNotInMmsTransaction && mIsCallStateIdle && !mAirplaneModeEnabled && mDualSimMode != 0)
                flag = true;
            else
                flag = false;
            menu.setGroupEnabled(0, flag);
        }
        return true;
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        boolean flag = true;
        switch (menuitem.getItemId())
        {
        case 3: // '\003'
            if (mNewApn && mUri != null)
                getContentResolver().delete(mUri, null, null);
            finish();
            return flag;

        case 2: // '\002'
            if (mSourceType == 0)
            {
                showDialog(flag);
                return flag;
            }
            if (validateAndSave(false))
            {
                finish();
                return flag;
            }
            break;

        case 1: // '\001'
            deleteApn();
            return flag;

        default:
            flag = super.onOptionsItemSelected(menuitem);
            break;
        }
        return flag;
    }

    public void onPause()
    {
        getPreferenceScreen().getSharedPreferences().unregisterOnSharedPreferenceChangeListener(this);
        unregisterReceiver(mReceiver);
        TelephonyManager telephonymanager = (TelephonyManager)getSystemService("phone");
        telephonymanager.listen(mPhoneStateListener, 0);
        telephonymanager.listen(mPhoneStateListener1, 0);
        Xlog.d(TAG, "onDestroy set PhoneStateListener.LISTEN_NONE!");
        super.onPause();
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        String s = preference.getKey();
        if (!"auth_type".equals(s)) goto _L2; else goto _L1
_L1:
        try
        {
            int i = Integer.parseInt((String)obj);
            mAuthType.setValueIndex(i);
            String as[] = mRes.getStringArray(0x7f070028);
            mAuthType.setSummary(as[i]);
        }
        catch (NumberFormatException numberformatexception)
        {
            return false;
        }
_L4:
        return true;
_L2:
        if ("apn_protocol".equals(s))
        {
            String s3 = protocolDescription((String)obj, mProtocol);
            if (s3 == null)
                return false;
            mProtocol.setValue((String)obj);
            mProtocol.setSummary(s3);
        } else
        if ("apn_roaming_protocol".equals(s))
        {
            String s2 = protocolDescription((String)obj, mRoamingProtocol);
            if (s2 == null)
                return false;
            mRoamingProtocol.setValue((String)obj);
            mRoamingProtocol.setSummary(s2);
        } else
        if ("bearer".equals(s))
        {
            String s1 = bearerDescription((String)obj);
            if (s1 == null)
                return false;
            mBearer.setValue((String)obj);
            mBearer.setSummary(s1);
        } else
        if ("apn_type_list".equals(s))
            mApnTypeList.setSummary(checkNull(mApnTypeList.getTypeString()));
        if (true) goto _L4; else goto _L3
_L3:
    }

    protected void onPrepareDialog(int i, Dialog dialog)
    {
        super.onPrepareDialog(i, dialog);
        if (i == 0)
        {
            String s = getErrorMsg();
            if (s != null)
                ((AlertDialog)dialog).setMessage(s);
        }
    }

    public void onResume()
    {
        super.onResume();
        getPreferenceScreen().getSharedPreferences().registerOnSharedPreferenceChangeListener(this);
        registerReceiver(mReceiver, mIntentFilter);
        TelephonyManager telephonymanager = (TelephonyManager)getSystemService("phone");
        boolean flag;
        if (telephonymanager.getCallState() == 0)
            flag = true;
        else
            flag = false;
        mIsCallStateIdle = flag;
        telephonymanager.listen(mPhoneStateListener, 1);
        telephonymanager.listen(mPhoneStateListener1, 32);
        mAirplaneModeEnabled = AirplaneModeEnabler.isAirplaneModeOn(this);
        mDualSimMode = android.provider.Settings.System.getInt(getContentResolver(), "dual_sim_mode_setting", -1);
        mNotInMmsTransaction = isMMSNotTransaction();
        setScreenEnabledStatus();
        if ("tethering".equals(mApnTypeList.getTypeString()))
            mExt.setPreferenceState(mApnTypeList);
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        if (validateAndSave(true) && mCursor != null && mCursor.getCount() > 0)
            bundle.putInt("pos", mCursor.getInt(0));
    }

    public void onSharedPreferenceChanged(SharedPreferences sharedpreferences, String s)
    {
        Preference preference;
label0:
        {
            preference = findPreference(s);
            if (preference != null)
            {
                if (!preference.equals(mPassword))
                    break label0;
                preference.setSummary(starify(sharedpreferences.getString(s, "")));
            }
            return;
        }
        if (s.equals("carrier_enabled"))
        {
            preference.setSummary(checkNull(String.valueOf(sharedpreferences.getBoolean(s, true))));
            return;
        } else
        {
            preference.setSummary(checkNull(sharedpreferences.getString(s, "")));
            return;
        }
    }




/*
    static boolean access$002(ApnEditor apneditor, boolean flag)
    {
        apneditor.mAirplaneModeEnabled = flag;
        return flag;
    }

*/








/*
    static boolean access$1402(ApnEditor apneditor, boolean flag)
    {
        apneditor.mIsCallStateIdle = flag;
        return flag;
    }

*/


/*
    static boolean access$1502(ApnEditor apneditor, boolean flag)
    {
        apneditor.mFirstTime = flag;
        return flag;
    }

*/



/*
    static Cursor access$1602(ApnEditor apneditor, Cursor cursor)
    {
        apneditor.mCursor = cursor;
        return cursor;
    }

*/






/*
    static boolean access$202(ApnEditor apneditor, boolean flag)
    {
        apneditor.mNotInMmsTransaction = flag;
        return flag;
    }

*/





/*
    static int access$502(ApnEditor apneditor, int i)
    {
        apneditor.mDualSimMode = i;
        return i;
    }

*/




}
