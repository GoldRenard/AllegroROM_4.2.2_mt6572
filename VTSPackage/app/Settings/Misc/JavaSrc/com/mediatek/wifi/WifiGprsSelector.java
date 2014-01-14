// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.wifi;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.database.Cursor;
import android.net.*;
import android.net.wifi.WifiManager;
import android.os.*;
import android.preference.*;
import android.provider.Telephony;
import android.telephony.*;
import android.view.*;
import android.widget.*;
import com.android.internal.telephony.ITelephony;
import com.android.settings.AirplaneModeEnabler;
import com.android.settings.ApnPreference;
import com.android.settings.wifi.WifiSettings;
import com.mediatek.CellConnService.CellConnMgr;
import com.mediatek.telephony.TelephonyManagerEx;
import com.mediatek.xlog.Xlog;
import java.util.*;

public class WifiGprsSelector extends WifiSettings
    implements android.preference.Preference.OnPreferenceChangeListener
{
    class SelectionListAdapter extends BaseAdapter
    {

        List mSimItemList;
        final WifiGprsSelector this$0;

        private void setImageSim(RelativeLayout relativelayout, SimItem simitem)
        {
            if (simitem.mIsSim)
            {
                int i = getSimColorResource(simitem.mColor);
                if (i >= 0)
                {
                    relativelayout.setVisibility(0);
                    relativelayout.setBackgroundResource(i);
                }
                return;
            }
            if (simitem.mColor == 8)
            {
                relativelayout.setVisibility(0);
                relativelayout.setBackgroundResource(0x20200e6);
                return;
            } else
            {
                relativelayout.setVisibility(8);
                return;
            }
        }

        private void setImageStatus(ImageView imageview, SimItem simitem)
        {
            int i;
label0:
            {
                if (simitem.mIsSim)
                {
                    i = getStatusResource(simitem.mState);
                    if (i != -1)
                        break label0;
                    imageview.setVisibility(8);
                }
                return;
            }
            imageview.setVisibility(0);
            imageview.setImageResource(i);
        }

        private void setNameAndNum(TextView textview, TextView textview1, SimItem simitem)
        {
            if (simitem.mName == null)
            {
                textview.setVisibility(8);
            } else
            {
                textview.setVisibility(0);
                textview.setText(simitem.mName);
            }
            if (simitem.mIsSim && simitem.mNumber != null && simitem.mNumber.length() != 0)
            {
                textview1.setVisibility(0);
                textview1.setText(simitem.mNumber);
                return;
            } else
            {
                textview1.setVisibility(8);
                return;
            }
        }

        private void setTextNumFormat(TextView textview, SimItem simitem)
        {
            if (simitem.mIsSim && simitem.mNumber != null)
                switch (simitem.mDispalyNumberFormat)
                {
                case 2: // '\002'
                    textview.setVisibility(0);
                    if (simitem.mNumber.length() >= 4)
                    {
                        textview.setText(simitem.mNumber.substring(-4 + simitem.mNumber.length()));
                        return;
                    } else
                    {
                        textview.setText(simitem.mNumber);
                        return;
                    }

                case 1: // '\001'
                    textview.setVisibility(0);
                    if (simitem.mNumber.length() >= 4)
                    {
                        textview.setText(simitem.mNumber.substring(0, 4));
                        return;
                    } else
                    {
                        textview.setText(simitem.mNumber);
                        return;
                    }

                case 0: // '\0'
                    textview.setVisibility(8);
                    return;
                }
        }

        private void setViewHolderId(ViewHolder viewholder, View view)
        {
            viewholder.mTextName = (TextView)view.findViewById(0x7f080115);
            viewholder.mTextNum = (TextView)view.findViewById(0x7f080116);
            viewholder.mImageStatus = (ImageView)view.findViewById(0x7f080112);
            viewholder.mTextNumFormat = (TextView)view.findViewById(0x7f080113);
            viewholder.mCkRadioOn = (RadioButton)view.findViewById(0x7f080117);
            viewholder.mImageSim = (RelativeLayout)view.findViewById(0x7f080111);
        }

        public int getCount()
        {
            return mSimItemList.size();
        }

        public Object getItem(int i)
        {
            return mSimItemList.get(i);
        }

        public long getItemId(int i)
        {
            return (long)i;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            ViewHolder viewholder;
            if (view == null)
            {
                view = LayoutInflater.from(getActivity()).inflate(0x7f040071, null);
                viewholder = new ViewHolder();
                setViewHolderId(viewholder, view);
                view.setTag(viewholder);
            } else
            {
                viewholder = (ViewHolder)view.getTag();
            }
            SimItem simitem = (SimItem)getItem(i);
            setNameAndNum(viewholder.mTextName, viewholder.mTextNum, simitem);
            setImageSim(viewholder.mImageSim, simitem);
            setImageStatus(viewholder.mImageStatus, simitem);
            setTextNumFormat(viewholder.mTextNumFormat, simitem);
            RadioButton radiobutton = viewholder.mCkRadioOn;
            boolean flag;
            if (mInitValue == i)
                flag = true;
            else
                flag = false;
            radiobutton.setChecked(flag);
            if (simitem.mState == 1)
            {
                view.setEnabled(false);
                viewholder.mTextName.setEnabled(false);
                viewholder.mTextNum.setEnabled(false);
                viewholder.mCkRadioOn.setEnabled(false);
                return view;
            } else
            {
                view.setEnabled(true);
                viewholder.mTextName.setEnabled(true);
                viewholder.mTextNum.setEnabled(true);
                viewholder.mCkRadioOn.setEnabled(true);
                return view;
            }
        }

        public SelectionListAdapter(List list)
        {
            this$0 = WifiGprsSelector.this;
            super();
            mSimItemList = list;
        }
    }

    class SelectionListAdapter.ViewHolder
    {

        RadioButton mCkRadioOn;
        RelativeLayout mImageSim;
        ImageView mImageStatus;
        TextView mTextName;
        TextView mTextNum;
        TextView mTextNumFormat;
        final SelectionListAdapter this$1;

        SelectionListAdapter.ViewHolder()
        {
            this$1 = SelectionListAdapter.this;
            super();
        }
    }

    static class SimItem
    {

        public int mColor;
        public int mDispalyNumberFormat;
        public boolean mIsSim;
        public String mName;
        public String mNumber;
        public long mSimId;
        public int mSlot;
        public int mState;

        public SimItem(android.provider.Telephony.SIMInfo siminfo)
        {
            mIsSim = true;
            mName = null;
            mNumber = null;
            mDispalyNumberFormat = 0;
            mColor = -1;
            mSlot = -1;
            mState = 5;
            mSimId = -1L;
            mIsSim = true;
            mName = siminfo.mDisplayName;
            mNumber = siminfo.mNumber;
            mDispalyNumberFormat = siminfo.mDispalyNumberFormat;
            mColor = siminfo.mColor;
            mSlot = siminfo.mSlot;
            mSimId = siminfo.mSimId;
        }

        public SimItem(String s, int i, long l)
        {
            mIsSim = true;
            mName = null;
            mNumber = null;
            mDispalyNumberFormat = 0;
            mColor = -1;
            mSlot = -1;
            mState = 5;
            mSimId = -1L;
            mName = s;
            mColor = i;
            mIsSim = false;
        }
    }


    private static final String APN_ID = "apn_id";
    private static final int APN_INDEX = 2;
    private static final int ATTACH_TIME_OUT_LENGTH = 30000;
    private static final int COLOR_INDEX_EIGHT = 8;
    private static final int COLOR_INDEX_SEVEN = 7;
    private static final int COLOR_INDEX_ZERO = 0;
    private static final int DETACH_TIME_OUT_LENGTH = 10000;
    private static final int DIALOG_WAITING = 1001;
    private static final int DISPLAY_FIRST_FOUR = 1;
    private static final int DISPLAY_LAST_FOUR = 2;
    private static final int DISPLAY_NONE = 0;
    private static final int EVENT_ATTACH_TIME_OUT = 2001;
    private static final int EVENT_DETACH_TIME_OUT = 2000;
    private static final int ID_INDEX = 0;
    private static final String KEY_ADD_WIFI_NETWORK = "add_network";
    private static final String KEY_APN_LIST = "apn_list";
    private static final String KEY_DATA_ENABLER = "data_enabler";
    private static final String KEY_DATA_ENABLER_CATEGORY = "data_enabler_category";
    private static final String KEY_DATA_ENABLER_GEMINI = "data_enabler_gemini";
    private static final int NAME_INDEX = 1;
    private static final int PIN1_REQUEST_CODE = 302;
    private static final Uri PREFERAPN_URI = Uri.parse("content://telephony/carriers/preferapn");
    private static final Uri PREFERAPN_URI_GEMINI_SIM1 = Uri.parse("content://telephony/carriers_sim1/preferapn");
    private static final Uri PREFERAPN_URI_GEMINI_SIM2 = Uri.parse("content://telephony/carriers_sim2/preferapn");
    private static final String PREFERRED_APN_URI = "content://telephony/carriers/preferapn";
    private static final String PREFERRED_APN_URI_GEMINI_SIM1 = "content://telephony/carriers_sim1/preferapn";
    private static final String PREFERRED_APN_URI_GEMINI_SIM2 = "content://telephony/carriers_sim2/preferapn";
    private static final String PROJECTION_ARRAY[] = {
        "_id", "name", "apn", "type", "sourcetype"
    };
    private static final int SIM_CARD_1 = 0;
    private static final int SIM_CARD_2 = 1;
    private static final int SIM_CARD_SINGLE = 2;
    private static final int SIM_CARD_UNDEFINED = -1;
    private static final int SIM_NUMBER_LEN = 4;
    private static final int SOURCE_TYPE_INDEX = 4;
    private static final String TAG = "WifiGprsSelector";
    private static final String TRANSACTION_START = "com.android.mms.transaction.START";
    private static final String TRANSACTION_STOP = "com.android.mms.transaction.STOP";
    private static final int TYPES_INDEX = 3;
    private Preference mAddWifiNetwork;
    private boolean mAirplaneModeEnabled;
    private PreferenceCategory mApnList;
    private CellConnMgr mCellConnMgr;
    private CheckBoxPreference mDataEnabler;
    private Preference mDataEnablerGemini;
    ContentObserver mGprsConnectObserver;
    private int mInitValue;
    private boolean mIsCallStateIdle;
    private boolean mIsGprsSwitching;
    private boolean mIsSIMExist;
    private IntentFilter mMobileStateFilter;
    private final BroadcastReceiver mMobileStateReceiver = new BroadcastReceiver() {

        final WifiGprsSelector this$0;

        public void onReceive(Context context, Intent intent)
        {
            boolean flag = true;
            String s = intent.getAction();
            if (s.equals("android.intent.action.ANY_DATA_STATE"))
            {
                String s1 = intent.getStringExtra("reason");
                com.android.internal.telephony.PhoneConstants.DataState datastate = WifiGprsSelector.getMobileDataState(intent);
                Xlog.d("WifiGprsSelector", (new StringBuilder()).append("catch data change, reason : ").append(s1).append("  state = ").append(datastate).append(";").toString());
                if (s1 != null)
                {
                    if (s1.equals("dataEnabled") && datastate == com.android.internal.telephony.PhoneConstants.DataState.CONNECTED && mIsGprsSwitching)
                    {
                        mTimeHandler.removeMessages(2001);
                        if (isResumed())
                            removeDialog(1001);
                        mIsGprsSwitching = false;
                        updateDataEnabler();
                        return;
                    }
                    if (s1.equals("dataDisabled") && datastate == com.android.internal.telephony.PhoneConstants.DataState.DISCONNECTED && mIsGprsSwitching)
                    {
                        mTimeHandler.removeMessages(2000);
                        if (isResumed())
                            removeDialog(1001);
                        mIsGprsSwitching = false;
                        updateDataEnabler();
                        return;
                    }
                }
            } else
            {
                if (s.equals("android.intent.action.AIRPLANE_MODE"))
                {
                    mAirplaneModeEnabled = intent.getBooleanExtra("state", false);
                    Xlog.d("WifiGprsSelector", (new StringBuilder()).append("AIRPLANE_MODE state changed: ").append(mAirplaneModeEnabled).append(";").toString());
                    PreferenceCategory preferencecategory2 = mApnList;
                    if (mAirplaneModeEnabled)
                        flag = false;
                    preferencecategory2.setEnabled(flag);
                    updateDataEnabler();
                    return;
                }
                if (s.equals("com.android.mms.transaction.START"))
                {
                    Xlog.d("WifiGprsSelector", "ssr: TRANSACTION_START in ApnSettings;");
                    mScreenEnable = false;
                    PreferenceCategory preferencecategory1 = mApnList;
                    if (mAirplaneModeEnabled || !mScreenEnable)
                        flag = false;
                    preferencecategory1.setEnabled(flag);
                    return;
                }
                if (s.equals("com.android.mms.transaction.STOP"))
                {
                    Xlog.d("WifiGprsSelector", "ssr: TRANSACTION_STOP in ApnSettings;");
                    mScreenEnable = flag;
                    PreferenceCategory preferencecategory = mApnList;
                    if (mAirplaneModeEnabled || !mScreenEnable)
                        flag = false;
                    preferencecategory.setEnabled(flag);
                    return;
                }
                if (s.equals("android.net.wifi.WIFI_STATE_CHANGED"))
                {
                    handleWifiStateChanged(intent.getIntExtra("wifi_state", 4));
                    return;
                }
                if ("android.intent.action.SIM_INFO_UPDATE".equals(s))
                {
                    Xlog.d("WifiGprsSelector", "receive ACTION_SIM_INFO_UPDATE");
                    if (android.provider.Telephony.SIMInfo.getInsertedSIMList(getActivity()) != null)
                    {
                        mSimSlot = getSimSlot();
                        updateDataEnabler();
                        return;
                    }
                }
            }
        }

            
            {
                this$0 = WifiGprsSelector.this;
                super();
            }
    }
;
    private PhoneStateListener mPhoneStateListener;
    private Uri mRestoreCarrierUri;
    private boolean mScreenEnable;
    private String mSelectedKey;
    private Runnable mServiceComplete;
    private Map mSimMap;
    private List mSimMapKeyList;
    private int mSimSlot;
    private TelephonyManager mTelephonyManager;
    private TelephonyManagerEx mTelephonyManagerEx;
    Handler mTimeHandler;
    private Uri mUri;
    private WifiManager mWifiManager;

    public WifiGprsSelector()
    {
        mIsCallStateIdle = true;
        mAirplaneModeEnabled = false;
        mIsSIMExist = true;
        mSimMapKeyList = null;
        mScreenEnable = true;
        mIsGprsSwitching = false;
        mGprsConnectObserver = new ContentObserver(new Handler()) {

            final WifiGprsSelector this$0;

            public void onChange(boolean flag)
            {
                Xlog.i("WifiGprsSelector", "Gprs connection changed");
                mSimSlot = getSimSlot();
                updateDataEnabler();
            }

            
            {
                this$0 = WifiGprsSelector.this;
                super(handler);
            }
        }
;
        mPhoneStateListener = new PhoneStateListener() {

            final WifiGprsSelector this$0;

            public void onServiceStateChanged(ServiceState servicestate)
            {
                super.onServiceStateChanged(servicestate);
                WifiGprsSelector wifigprsselector = WifiGprsSelector.this;
                boolean flag;
                if (mTelephonyManager.getCallState() == 0)
                    flag = true;
                else
                    flag = false;
                wifigprsselector.mIsCallStateIdle = flag;
            }

            
            {
                this$0 = WifiGprsSelector.this;
                super();
            }
        }
;
        mServiceComplete = new Runnable() {

            final WifiGprsSelector this$0;

            public void run()
            {
            }

            
            {
                this$0 = WifiGprsSelector.this;
                super();
            }
        }
;
        mTimeHandler = new Handler() {

            final WifiGprsSelector this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 2000: 
                    Xlog.d("WifiGprsSelector", "detach time out......");
                    if (isResumed())
                        removeDialog(1001);
                    mIsGprsSwitching = false;
                    updateDataEnabler();
                    return;

                case 2001: 
                    Xlog.d("WifiGprsSelector", "attach time out......");
                    if (isResumed())
                        removeDialog(1001);
                    mIsGprsSwitching = false;
                    updateDataEnabler();
                    return;
                }
            }

            
            {
                this$0 = WifiGprsSelector.this;
                super();
            }
        }
;
    }

    private void dealWithConnChange(boolean flag)
    {
        Xlog.d("WifiGprsSelector", "only sigle SIM load can controling data connection");
    }

    private void fillList(int i)
    {
        mApnList.removeAll();
        if (i >= 0 && i <= 2)
        {
            Xlog.d("WifiGprsSelector", (new StringBuilder()).append("fillList(), simSlot=").append(i).append(";").toString());
            String s = (new StringBuilder()).append("numeric=\"").append(getQueryWhere(i)).append("\"").toString();
            Cursor cursor = getActivity().managedQuery(mUri, PROJECTION_ARRAY, s, "name ASC");
            ArrayList arraylist = new ArrayList();
            boolean flag = false;
            mSelectedKey = getSelectedApnKey();
            Xlog.d("WifiGprsSelector", (new StringBuilder()).append("mSelectedKey = ").append(mSelectedKey).append(";").toString());
            cursor.moveToFirst();
            for (; !cursor.isAfterLast(); cursor.moveToNext())
            {
                String s1 = cursor.getString(1);
                String s2 = cursor.getString(2);
                String s3 = cursor.getString(0);
                String s4 = cursor.getString(3);
                int k = cursor.getInt(4);
                ApnPreference apnpreference1 = new ApnPreference(getActivity());
                apnpreference1.setSimId(i);
                apnpreference1.setKey(s3);
                apnpreference1.setTitle(s1);
                apnpreference1.setSummary(s2);
                apnpreference1.setSourceType(k);
                apnpreference1.setPersistent(false);
                apnpreference1.setOnPreferenceChangeListener(this);
                boolean flag8;
                if (s4 != null && (s4.equals("mms") || s4.equals("cmmail")))
                    flag8 = false;
                else
                    flag8 = true;
                apnpreference1.setSelectable(flag8);
                if (flag8)
                {
                    if (mSelectedKey != null && mSelectedKey.equals(s3))
                    {
                        setSelectedApnKey(s3);
                        apnpreference1.setChecked();
                        flag = true;
                        Xlog.d("WifiGprsSelector", (new StringBuilder()).append("apn key: ").append(s3).append(" set.").append(";").toString());
                    }
                    Xlog.d("WifiGprsSelector", (new StringBuilder()).append("key:  ").append(s3).append(" added!").append(";").toString());
                    mApnList.addPreference(apnpreference1);
                    apnpreference1.setDependency("data_enabler_gemini");
                } else
                {
                    arraylist.add(apnpreference1);
                }
            }

            int j = mApnList.getPreferenceCount();
            if (!flag && j > 0)
            {
                ApnPreference apnpreference = (ApnPreference)mApnList.getPreference(0);
                if (apnpreference != null)
                {
                    setSelectedApnKey(apnpreference.getKey());
                    apnpreference.setChecked();
                    Xlog.d("WifiGprsSelector", (new StringBuilder()).append("Key does not match.Set key: ").append(apnpreference.getKey()).append(".").toString());
                }
            }
            boolean flag1;
            if (mTelephonyManager.getCallState() == 0)
                flag1 = true;
            else
                flag1 = false;
            mIsCallStateIdle = flag1;
            switch (mSimSlot)
            {
            case 2: // '\002'
                boolean flag6;
                if (5 == TelephonyManager.getDefault().getSimState())
                    flag6 = true;
                else
                    flag6 = false;
                PreferenceCategory preferencecategory2 = mApnList;
                boolean flag7;
                if (mScreenEnable && mIsCallStateIdle && !mAirplaneModeEnabled && flag6)
                    flag7 = true;
                else
                    flag7 = false;
                preferencecategory2.setEnabled(flag7);
                return;

            case 1: // '\001'
                boolean flag4;
                if (5 == mTelephonyManagerEx.getSimState(1))
                    flag4 = true;
                else
                    flag4 = false;
                PreferenceCategory preferencecategory1 = mApnList;
                boolean flag5;
                if (mScreenEnable && mIsCallStateIdle && !mAirplaneModeEnabled && flag4)
                    flag5 = true;
                else
                    flag5 = false;
                preferencecategory1.setEnabled(flag5);
                return;

            case 0: // '\0'
                boolean flag2;
                if (5 == mTelephonyManagerEx.getSimState(0))
                    flag2 = true;
                else
                    flag2 = false;
                PreferenceCategory preferencecategory = mApnList;
                boolean flag3;
                if (mScreenEnable && mIsCallStateIdle && !mAirplaneModeEnabled && flag2)
                    flag3 = true;
                else
                    flag3 = false;
                preferencecategory.setEnabled(flag3);
                return;
            }
            return;
        } else
        {
            return;
        }
    }

    private static com.android.internal.telephony.PhoneConstants.DataState getMobileDataState(Intent intent)
    {
        String s = intent.getStringExtra("state");
        if (s == null)
            return com.android.internal.telephony.PhoneConstants.DataState.DISCONNECTED;
        else
            return (com.android.internal.telephony.PhoneConstants.DataState)Enum.valueOf(com/android/internal/telephony/PhoneConstants$DataState, s);
    }

    private String getQueryWhere(int i)
    {
        String s = "";
        switch (i)
        {
        case 2: // '\002'
            mUri = android.provider.Telephony.Carriers.CONTENT_URI;
            s = SystemProperties.get("gsm.sim.operator.numeric", "");
            mRestoreCarrierUri = PREFERAPN_URI;
            break;

        case 1: // '\001'
            mUri = android.provider.Telephony.Carriers.SIM2Carriers.CONTENT_URI;
            s = SystemProperties.get("gsm.sim.operator.numeric.2", "-1");
            mRestoreCarrierUri = PREFERAPN_URI_GEMINI_SIM2;
            break;

        case 0: // '\0'
            mUri = android.provider.Telephony.Carriers.SIM1Carriers.CONTENT_URI;
            s = SystemProperties.get("gsm.sim.operator.numeric", "-1");
            mRestoreCarrierUri = PREFERAPN_URI_GEMINI_SIM1;
            break;

        default:
            Toast.makeText(getActivity(), "Can't get any valid SIM information", 0).show();
            finish();
            break;
        }
        Xlog.d("WifiGprsSelector", (new StringBuilder()).append("where = ").append(s).append(";").toString());
        Xlog.d("WifiGprsSelector", (new StringBuilder()).append("mUri = ").append(mUri).append(";").toString());
        return s;
    }

    private String getSelectedApnKey()
    {
        Cursor cursor = getActivity().managedQuery(mRestoreCarrierUri, new String[] {
            "_id"
        }, null, "name ASC");
        int i = cursor.getCount();
        String s = null;
        if (i > 0)
        {
            cursor.moveToFirst();
            s = cursor.getString(0);
        }
        return s;
    }

    private int getSimSlot()
    {
        int i = -1;
        long l = (int)android.provider.Settings.System.getLong(getContentResolver(), "gprs_connection_sim_setting", -5L);
        Xlog.d("WifiGprsSelector", (new StringBuilder()).append("getSimSlot,dataConnectId = ").append(l).toString());
        if (l > 0L)
            i = ((android.provider.Telephony.SIMInfo)mSimMap.get(Long.valueOf(l))).mSlot;
        return i;
    }

    private void handleWifiStateChanged(int i)
    {
        Xlog.d("WifiGprsSelector", (new StringBuilder()).append("handleWifiStateChanged(), new state=").append(i).append(";").toString());
        Xlog.d("WifiGprsSelector", "[0- stoping 1-stoped 2-starting 3-started 4-unknown]");
        if (i == 3)
        {
            mAddWifiNetwork.setEnabled(true);
            return;
        } else
        {
            mAddWifiNetwork.setEnabled(false);
            return;
        }
    }

    private boolean init()
    {
        ITelephony itelephony;
        Xlog.d("WifiGprsSelector", "init()");
        itelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        if (itelephony == null)
            return false;
        boolean flag;
        if (!itelephony.isSimInsert(0) && !itelephony.isSimInsert(1))
            flag = false;
        else
            flag = true;
        try
        {
            mIsSIMExist = flag;
        }
        catch (RemoteException remoteexception)
        {
            Xlog.d("WifiGprsSelector", "RemoteException happens......");
            return false;
        }
        return true;
    }

    private void initPhoneState()
    {
        Xlog.d("WifiGprsSelector", "initPhoneState()");
        mSimSlot = getActivity().getIntent().getIntExtra("simId", -1);
        mTelephonyManagerEx = TelephonyManagerEx.getDefault();
        mSimMap = new HashMap();
        initSimMap();
        if (mSimSlot == -1)
            mSimSlot = getSimSlot();
        Xlog.d("WifiGprsSelector", (new StringBuilder()).append("GEMINI_SIM_ID_KEY = ").append(mSimSlot).append(";").toString());
    }

    private void initSimMap()
    {
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(getActivity());
        Collections.sort(list, new com.mediatek.gemini.GeminiUtils.SIMInfoComparable());
        mSimMap.clear();
        Xlog.i("WifiGprsSelector", (new StringBuilder()).append("sim number is ").append(list.size()).toString());
        android.provider.Telephony.SIMInfo siminfo;
        for (Iterator iterator = list.iterator(); iterator.hasNext(); mSimMap.put(Long.valueOf(siminfo.mSimId), siminfo))
            siminfo = (android.provider.Telephony.SIMInfo)iterator.next();

        mSimMapKeyList = new ArrayList(mSimMap.keySet());
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
                    Xlog.d("WifiGprsSelector", (new StringBuilder()).append("mms state = ").append(state).toString());
                    if (state == android.net.NetworkInfo.State.CONNECTING || state == android.net.NetworkInfo.State.CONNECTED)
                        break label0;
                    flag = true;
                }
            }
            return flag;
        }
        return false;
    }

    private void setSelectedApnKey(String s)
    {
        mSelectedKey = s;
        ContentResolver contentresolver = getContentResolver();
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("apn_id", mSelectedKey);
        contentresolver.update(mRestoreCarrierUri, contentvalues, null, null);
    }

    private void switchGprsDefautlSIM(long l)
    {
        if (l >= 0L)
        {
            long l1 = android.provider.Settings.System.getLong(getContentResolver(), "gprs_connection_sim_setting", -5L);
            Xlog.d("WifiGprsSelector", (new StringBuilder()).append("value=").append(l).append(", gprsValue=").append(l1).append(", valueOfNotSet").append(-5L).toString());
            if (l != l1)
            {
                Intent intent = new Intent("android.intent.action.DATA_DEFAULT_SIM");
                intent.putExtra("simid", l);
                getActivity().sendBroadcast(intent);
                Xlog.d("WifiGprsSelector", "send gprs switch broadcast");
                showDialog(1001);
                mIsGprsSwitching = true;
                if (l > 0L)
                {
                    mTimeHandler.sendEmptyMessageDelayed(2001, 30000L);
                    Xlog.d("WifiGprsSelector", "set ATTACH_TIME_OUT");
                    return;
                } else
                {
                    mTimeHandler.sendEmptyMessageDelayed(2000, 10000L);
                    Xlog.d("WifiGprsSelector", "set DETACH_TIME_OUT");
                    return;
                }
            }
        }
    }

    private void updateDataEnabler()
    {
        Xlog.d("WifiGprsSelector", (new StringBuilder()).append("updateDataEnabler, mSimSlot=").append(mSimSlot).toString());
        fillList(mSimSlot);
        Preference preference = mDataEnablerGemini;
        boolean flag;
        if (mIsSIMExist && !mAirplaneModeEnabled)
            flag = true;
        else
            flag = false;
        preference.setEnabled(flag);
    }

    public int getSimColorResource(int i)
    {
        if (i >= 0 && i <= 7)
            return Telephony.SIMBackgroundDarkRes[i];
        else
            return -1;
    }

    public int getStatusResource(int i)
    {
        switch (i)
        {
        case 8: // '\b'
            return 0x2020118;

        case 7: // '\007'
            return 0x20200ef;

        case 6: // '\006'
            return 0x2020117;

        case 4: // '\004'
            return 0x2020119;

        case 3: // '\003'
            return 0x20200f8;

        case 2: // '\002'
            return 0x20200ff;

        case 1: // '\001'
            return 0x2020112;

        case 5: // '\005'
        default:
            return -1;
        }
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        Xlog.d("WifiGprsSelector", "onActivityCreated()");
        mApnList = (PreferenceCategory)findPreference("apn_list");
        mAddWifiNetwork = findPreference("add_network");
        PreferenceCategory preferencecategory = (PreferenceCategory)findPreference("data_enabler_category");
        mDataEnablerGemini = findPreference("data_enabler_gemini");
        preferencecategory.removePreference(findPreference("data_enabler"));
        initPhoneState();
        mMobileStateFilter = new IntentFilter("android.intent.action.ANY_DATA_STATE");
        mMobileStateFilter.addAction("android.intent.action.AIRPLANE_MODE");
        mMobileStateFilter.addAction("com.android.mms.transaction.START");
        mMobileStateFilter.addAction("com.android.mms.transaction.STOP");
        mMobileStateFilter.addAction("android.net.wifi.WIFI_STATE_CHANGED");
        mMobileStateFilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        getActivity().setTitle(0x7f0b0135);
        init();
        setHasOptionsMenu(false);
    }

    public Dialog onCreateDialog(int i)
    {
        ProgressDialog progressdialog = new ProgressDialog(getActivity());
        if (i == 1001)
        {
            progressdialog.setMessage(getResources().getString(0x7f0b0138));
            progressdialog.setIndeterminate(true);
            progressdialog.setCancelable(false);
            return progressdialog;
        } else
        {
            return super.onCreateDialog(i);
        }
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
    }

    public void onDestroy()
    {
        mTimeHandler.removeMessages(2001);
        mTimeHandler.removeMessages(2000);
        super.onDestroy();
    }

    public void onPause()
    {
        Xlog.d("WifiGprsSelector", "onPause");
        super.onPause();
        mTelephonyManager.listen(mPhoneStateListener, 0);
        getActivity().unregisterReceiver(mMobileStateReceiver);
        mCellConnMgr.unregister();
        getContentResolver().unregisterContentObserver(mGprsConnectObserver);
        if (mIsGprsSwitching)
            removeDialog(1001);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        Xlog.d("WifiGprsSelector", (new StringBuilder()).append("onPreferenceChange(): Preference - ").append(preference).append(", newValue - ").append(obj).append(", newValue type - ").append(obj.getClass()).toString());
        String s;
        if (preference == null)
            s = "";
        else
            s = preference.getKey();
        if ("data_enabler".equals(s))
        {
            boolean flag = ((Boolean)obj).booleanValue();
            Xlog.d("WifiGprsSelector", (new StringBuilder()).append("Data connection enabled?").append(flag).toString());
            dealWithConnChange(flag);
        } else
        if (obj instanceof String)
            setSelectedApnKey((String)obj);
        return true;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        String s = preference.getKey();
        if (!"add_network".equals(s)) goto _L2; else goto _L1
_L1:
        if (mWifiManager.isWifiEnabled())
        {
            Xlog.d("WifiGprsSelector", "add network");
            super.addNetworkForSelector();
        }
_L6:
        return true;
_L2:
        final ArrayList simItemList;
        Iterator iterator;
        if (!"data_enabler_gemini".equals(s))
            break; /* Loop/switch isn't completed */
        simItemList = new ArrayList();
        iterator = mSimMapKeyList.iterator();
_L4:
        android.provider.Telephony.SIMInfo siminfo;
        SimItem simitem1;
        if (!iterator.hasNext())
            break; /* Loop/switch isn't completed */
        Long long1 = (Long)iterator.next();
        siminfo = (android.provider.Telephony.SIMInfo)mSimMap.get(long1);
        if (siminfo == null)
            continue; /* Loop/switch isn't completed */
        simitem1 = new SimItem(siminfo);
        ITelephony itelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        if (itelephony != null)
            try
            {
                simitem1.mState = itelephony.getSimIndicatorStateGemini(siminfo.mSlot);
                simItemList.add(simitem1);
            }
            catch (RemoteException remoteexception)
            {
                Xlog.d("WifiGprsSelector", (new StringBuilder()).append("[e = ").append(remoteexception).append("]").toString());
            }
        if (true) goto _L4; else goto _L3
_L3:
        SimItem simitem = new SimItem(getString(0x7f0b00df), -1, 0L);
        simItemList.add(simitem);
        int i = simItemList.size();
        Xlog.d("WifiGprsSelector", (new StringBuilder()).append("simListSize = ").append(i).toString());
        int j = i - 1;
        int k = -1;
        long l = (int)android.provider.Settings.System.getLong(getContentResolver(), "gprs_connection_sim_setting", -5L);
        Xlog.d("WifiGprsSelector", (new StringBuilder()).append("getSimSlot,dataConnectId = ").append(l).toString());
        for (int i1 = 0; i1 < j; i1++)
            if (((SimItem)simItemList.get(i1)).mSimId == l)
                k = i1;

        SelectionListAdapter selectionlistadapter;
        android.app.AlertDialog.Builder builder;
        int j1;
        android.content.DialogInterface.OnClickListener onclicklistener;
        android.app.AlertDialog.Builder builder1;
        android.content.DialogInterface.OnClickListener onclicklistener1;
        if (k != -1)
            j = k;
        mInitValue = j;
        Xlog.d("WifiGprsSelector", (new StringBuilder()).append("mInitValue = ").append(mInitValue).toString());
        selectionlistadapter = new SelectionListAdapter(simItemList);
        builder = new android.app.AlertDialog.Builder(getActivity());
        j1 = mInitValue;
        onclicklistener = new android.content.DialogInterface.OnClickListener() {

            final WifiGprsSelector this$0;
            final List val$simItemList;

            public void onClick(DialogInterface dialoginterface, int k1)
            {
                Xlog.d("WifiGprsSelector", (new StringBuilder()).append("which = ").append(k1).toString());
                SimItem simitem2 = (SimItem)simItemList.get(k1);
                mSimSlot = simitem2.mSlot;
                Xlog.d("WifiGprsSelector", (new StringBuilder()).append("mSimSlot = ").append(mSimSlot).toString());
                Xlog.d("WifiGprsSelector", (new StringBuilder()).append("mIsSim=").append(simitem2.mIsSim).append(",mState=").append(simitem2.mState).append(",SIM_INDICATOR_LOCKED=").append(2).toString());
                if (simitem2.mIsSim)
                {
                    if (mCellConnMgr != null && simitem2.mState == 2)
                    {
                        Xlog.d("WifiGprsSelector", "mCellConnMgr.handleCellConn");
                        mCellConnMgr.handleCellConn(simitem2.mSlot, 302);
                    } else
                    {
                        switchGprsDefautlSIM(simitem2.mSimId);
                    }
                } else
                {
                    switchGprsDefautlSIM(0L);
                }
                dialoginterface.dismiss();
            }

            
            {
                this$0 = WifiGprsSelector.this;
                simItemList = list;
                super();
            }
        }
;
        builder1 = builder.setSingleChoiceItems(selectionlistadapter, j1, onclicklistener).setTitle(0x7f0b00db);
        onclicklistener1 = new android.content.DialogInterface.OnClickListener() {

            final WifiGprsSelector this$0;

            public void onClick(DialogInterface dialoginterface, int k1)
            {
            }

            
            {
                this$0 = WifiGprsSelector.this;
                super();
            }
        }
;
        builder1.setNegativeButton(0x1040009, onclicklistener1).create().show();
        if (true) goto _L6; else goto _L5
_L5:
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }

    public void onResume()
    {
        Xlog.d("WifiGprsSelector", "onResume");
        super.onResume();
        mTelephonyManager = (TelephonyManager)getSystemService("phone");
        mTelephonyManager.listen(mPhoneStateListener, 1);
        getActivity().registerReceiver(mMobileStateReceiver, mMobileStateFilter);
        mAirplaneModeEnabled = AirplaneModeEnabler.isAirplaneModeOn(getActivity());
        mWifiManager = (WifiManager)getActivity().getApplicationContext().getSystemService("wifi");
        handleWifiStateChanged(mWifiManager.getWifiState());
        mScreenEnable = isMMSNotTransaction();
        fillList(mSimSlot);
        updateDataEnabler();
        mCellConnMgr = new CellConnMgr(mServiceComplete);
        mCellConnMgr.register(getActivity());
        getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("gprs_connection_sim_setting"), false, mGprsConnectObserver);
        if (mIsGprsSwitching)
            showDialog(1001);
    }






/*
    static boolean access$102(WifiGprsSelector wifigprsselector, boolean flag)
    {
        wifigprsselector.mIsGprsSwitching = flag;
        return flag;
    }

*/


/*
    static boolean access$1102(WifiGprsSelector wifigprsselector, boolean flag)
    {
        wifigprsselector.mIsCallStateIdle = flag;
        return flag;
    }

*/












/*
    static boolean access$502(WifiGprsSelector wifigprsselector, boolean flag)
    {
        wifigprsselector.mAirplaneModeEnabled = flag;
        return flag;
    }

*/




/*
    static boolean access$702(WifiGprsSelector wifigprsselector, boolean flag)
    {
        wifigprsselector.mScreenEnable = flag;
        return flag;
    }

*/




/*
    static int access$902(WifiGprsSelector wifigprsselector, int i)
    {
        wifigprsselector.mSimSlot = i;
        return i;
    }

*/
}
