// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.SystemProperties;
import android.preference.*;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.*;
import android.widget.Button;
import android.widget.EditText;
import com.mediatek.xlog.Xlog;
import java.util.List;

// Referenced classes of package com.mediatek.settings:
//            PLMNListPreference, CallSettings

public class NetworkEditor extends PreferenceActivity
    implements android.preference.Preference.OnPreferenceChangeListener, TextWatcher
{

    private static final String BUTTON_NETWORK_ID_KEY = "network_id_key";
    private static final String BUTTON_NEWWORK_MODE_KEY = "network_mode_key";
    private static final String BUTTON_PRIORITY_KEY = "priority_key";
    private static final int DIALOG_NETWORK_ID = 0;
    private static final int DUAL_MODE = 2;
    private static final int GSM = 0;
    private static final int MENU_DELETE = 1;
    private static final int MENU_DISCARD = 3;
    private static final int MENU_SAVE = 2;
    public static final int MODEM_MASK_TDSCDMA = 8;
    public static final String PLMN_ADD = "plmn_add";
    public static final String PLMN_CODE = "plmn_code";
    public static final String PLMN_NAME = "plmn_name";
    public static final String PLMN_PRIORITY = "plmn_priority";
    public static final String PLMN_SERVICE = "plmn_service";
    public static final String PLMN_SIZE = "plmn_size";
    public static final String PLMN_SLOT = "plmn_slot";
    public static final String PROPERTY_KEY = "gsm.baseband.capability";
    public static final int RESULT_DELETE = 200;
    public static final int RESULT_MODIFY = 100;
    private static final int RIL_2G = 1;
    private static final int RIL_2G_3G = 5;
    private static final int RIL_3G = 4;
    private static final String TAG = "NetworkEditor";
    private static final int WCDMA_TDSCDMA = 1;
    private boolean mActSupport;
    private boolean mAirplaneModeEnabled;
    private int mDualSimMode;
    private AlertDialog mIdDialog;
    private IntentFilter mIntentFilter;
    private Preference mNetworkId;
    private android.content.DialogInterface.OnClickListener mNetworkIdListener;
    private EditText mNetworkIdText;
    private ListPreference mNetworkMode;
    private String mNotSet;
    private String mPLMNName;
    private PhoneStateListener mPhoneStateListener;
    private EditTextPreference mPriority;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final NetworkEditor this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            if (s.equals("android.intent.action.AIRPLANE_MODE"))
            {
                mAirplaneModeEnabled = intent.getBooleanExtra("state", false);
                setScreenEnabled();
            } else
            {
                if (s.equals("android.intent.action.DUAL_SIM_MODE"))
                {
                    mDualSimMode = intent.getIntExtra("mode", -1);
                    setScreenEnabled();
                    return;
                }
                if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
                {
                    Xlog.d("NetworkEditor", "ACTION_SIM_INFO_UPDATE received");
                    List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(NetworkEditor.this);
                    if (list.size() == 0 || list.size() == 1 && ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot != mSlotId)
                    {
                        Xlog.d("NetworkEditor", (new StringBuilder()).append("sim card number is ").append(list.size()).toString());
                        CallSettings.goToMobileNetworkSettings(NetworkEditor.this);
                        return;
                    }
                }
            }
        }

            
            {
                this$0 = NetworkEditor.this;
                super();
            }
    }
;
    private int mSlotId;
    private TelephonyManager mTelephonyManager;

    public NetworkEditor()
    {
        mNetworkId = null;
        mPriority = null;
        mNetworkMode = null;
        mNotSet = null;
        mAirplaneModeEnabled = false;
        mDualSimMode = -1;
        mActSupport = true;
        mIdDialog = null;
        mPhoneStateListener = new PhoneStateListener() {

            final NetworkEditor this$0;

            public void onCallStateChanged(int i, String s)
            {
                super.onCallStateChanged(i, s);
                switch (i)
                {
                case 0: // '\0'
                    setScreenEnabled();
                    return;
                }
            }

            
            {
                this$0 = NetworkEditor.this;
                super();
            }
        }
;
        mNetworkIdListener = new android.content.DialogInterface.OnClickListener() {

            final NetworkEditor this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                if (i == -1)
                {
                    String s = checkNull(mNetworkIdText.getText().toString());
                    Xlog.d("NetworkEditor", (new StringBuilder()).append("input network id is ").append(s).toString());
                    mNetworkId.setSummary(s);
                }
            }

            
            {
                this$0 = NetworkEditor.this;
                super();
            }
        }
;
    }

    private String checkNotSet(String s)
    {
        if (s == null || s.equals(mNotSet))
            s = "";
        return s;
    }

    private String checkNull(String s)
    {
        if (s == null || s.length() == 0)
            s = mNotSet;
        return s;
    }

    public static int covertApNW2Ril(int i)
    {
        if (i == 2)
            return 5;
        return i != 1 ? 1 : 4;
    }

    public static int covertRilNW2Ap(int i)
    {
        if (i >= 5)
            return 2;
        return (i & 4) == 0 ? 0 : 1;
    }

    private void createNetworkInfo(Intent intent)
    {
        boolean flag = true;
        mPLMNName = intent.getStringExtra("plmn_name");
        String s = intent.getStringExtra("plmn_code");
        mNetworkId.setSummary(checkNull(s));
        int i = intent.getIntExtra("plmn_priority", 0);
        mPriority.setSummary(String.valueOf(i));
        mPriority.setText(String.valueOf(i));
        int j = intent.getIntExtra("plmn_service", 0);
        Xlog.d("NetworkEditor", (new StringBuilder()).append("act = ").append(j).toString());
        if (!getIntent().getBooleanExtra("plmn_add", flag))
        {
            if (j == 0)
                flag = false;
            mActSupport = flag;
        }
        Xlog.d("NetworkEditor", (new StringBuilder()).append("mActSupport = ").append(mActSupport).toString());
        int k = covertRilNW2Ap(j);
        if (k < 0 || k > 2)
            k = 0;
        String s1;
        if ((8 & getBaseBand()) == 0)
        {
            s1 = getResources().getStringArray(0x7f07001b)[k];
        } else
        {
            mNetworkMode.setEntries(getResources().getTextArray(0x7f07001c));
            s1 = getResources().getStringArray(0x7f07001c)[k];
        }
        mNetworkMode.setSummary(s1);
        mNetworkMode.setValue(String.valueOf(k));
        mSlotId = intent.getIntExtra("plmn_slot", -1);
    }

    private void genNetworkInfo(Intent intent)
    {
        intent.putExtra("plmn_name", checkNotSet(mPLMNName));
        intent.putExtra("plmn_code", mNetworkId.getSummary());
        int i = getIntent().getIntExtra("plmn_size", 0);
        int j;
        int k;
        try
        {
            k = Integer.parseInt(String.valueOf(mPriority.getSummary()));
        }
        catch (NumberFormatException numberformatexception)
        {
            Xlog.d("NetworkEditor", "parse value of basband error");
            j = 0;
            continue;
        }
        j = k;
        do
        {
            if (getIntent().getBooleanExtra("plmn_add", false))
            {
                if (j > i)
                    j = i;
            } else
            if (j >= i)
                j = i - 1;
            intent.putExtra("plmn_priority", j);
            try
            {
                intent.putExtra("plmn_service", covertApNW2Ril(Integer.parseInt(String.valueOf(mNetworkMode.getValue()))));
                return;
            }
            catch (NumberFormatException numberformatexception1)
            {
                intent.putExtra("plmn_service", covertApNW2Ril(0));
            }
            return;
        } while (true);
    }

    static int getBaseBand()
    {
        String s = SystemProperties.get("gsm.baseband.capability");
        if (s == null || "".equals(s))
            return 0;
        int i;
        try
        {
            i = Integer.valueOf(s, 16).intValue();
        }
        catch (NumberFormatException numberformatexception)
        {
            Xlog.d("NetworkEditor", "parse value of basband error");
            return 0;
        }
        return i;
    }

    private void setRemovedNetwork()
    {
        Intent intent = new Intent(this, com/mediatek/settings/PLMNListPreference);
        setResult(200, intent);
        genNetworkInfo(intent);
    }

    private void setScreenEnabled()
    {
        boolean flag = true;
        boolean flag1;
        if (mTelephonyManager.getCallState() == 0)
            flag1 = flag;
        else
            flag1 = false;
        boolean flag2;
        if (flag1 && !mAirplaneModeEnabled && mDualSimMode != 0)
            flag2 = flag;
        else
            flag2 = false;
        getPreferenceScreen().setEnabled(flag2);
        invalidateOptionsMenu();
        ListPreference listpreference = mNetworkMode;
        if (!mActSupport || !flag2)
            flag = false;
        listpreference.setEnabled(flag);
    }

    private void validateAndSetResult()
    {
        Intent intent = new Intent(this, com/mediatek/settings/PLMNListPreference);
        setResult(100, intent);
        genNetworkInfo(intent);
    }

    public void afterTextChanged(Editable editable)
    {
        validate();
    }

    public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f060018);
        mNotSet = getResources().getString(0x7f0d0171);
        mNetworkId = findPreference("network_id_key");
        mPriority = (EditTextPreference)findPreference("priority_key");
        mNetworkMode = (ListPreference)findPreference("network_mode_key");
        mPriority.setOnPreferenceChangeListener(this);
        mNetworkMode.setOnPreferenceChangeListener(this);
        mTelephonyManager = (TelephonyManager)getSystemService("phone");
        mTelephonyManager.listen(mPhoneStateListener, 32);
        mIntentFilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        if (CallSettings.isMultipleSim())
            mIntentFilter.addAction("android.intent.action.DUAL_SIM_MODE");
        mIntentFilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        registerReceiver(mReceiver, mIntentFilter);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    public Dialog onCreateDialog(int i)
    {
        AlertDialog alertdialog = null;
        if (i == 0)
        {
            mNetworkIdText = new EditText(this);
            if (!mNotSet.equals(mNetworkId.getSummary()))
                mNetworkIdText.setText(mNetworkId.getSummary());
            mNetworkIdText.addTextChangedListener(this);
            mNetworkIdText.setInputType(2);
            mIdDialog = (new android.app.AlertDialog.Builder(this)).setTitle(getResources().getString(0x7f0d0121)).setView(mNetworkIdText).setPositiveButton(getResources().getString(0x104000a), mNetworkIdListener).setNegativeButton(getResources().getString(0x1040000), null).create();
            mIdDialog.getWindow().setSoftInputMode(4);
            alertdialog = mIdDialog;
        }
        return alertdialog;
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        super.onCreateOptionsMenu(menu);
        if (!getIntent().getBooleanExtra("plmn_add", false))
            menu.add(0, 1, 0, 0x10403c2);
        menu.add(0, 2, 0, 0x7f0d0286);
        menu.add(0, 3, 0, 0x1040000);
        return true;
    }

    protected void onDestroy()
    {
        super.onDestroy();
        unregisterReceiver(mReceiver);
        if (mTelephonyManager != null)
            mTelephonyManager.listen(mPhoneStateListener, 0);
    }

    public boolean onMenuOpened(int i, Menu menu)
    {
        boolean flag1;
        boolean flag2;
label0:
        {
            super.onMenuOpened(i, menu);
            boolean flag;
            if (mTelephonyManager.getCallState() == 0)
                flag = true;
            else
                flag = false;
            if (flag && !mAirplaneModeEnabled && mDualSimMode != 0)
                flag1 = true;
            else
                flag1 = false;
            if (!mNotSet.equals(mNetworkId.getSummary()) && !mNotSet.equals(mPriority.getSummary()))
                flag2 = false;
            else
                flag2 = true;
            if (menu != null)
            {
                menu.setGroupEnabled(0, flag1);
                if (!getIntent().getBooleanExtra("plmn_add", true))
                    break label0;
                MenuItem menuitem1 = menu.getItem(0);
                boolean flag4 = false;
                if (flag1)
                {
                    flag4 = false;
                    if (!flag2)
                        flag4 = true;
                }
                menuitem1.setEnabled(flag4);
            }
            return true;
        }
        MenuItem menuitem = menu.getItem(1);
        boolean flag3 = false;
        if (flag1)
        {
            flag3 = false;
            if (!flag2)
                flag3 = true;
        }
        menuitem.setEnabled(flag3);
        return true;
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 16908332: 
            finish();
            return true;

        case 2: // '\002'
            validateAndSetResult();
            break;

        case 1: // '\001'
            setRemovedNetwork();
            break;
        }
        finish();
        return super.onOptionsItemSelected(menuitem);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        String s = obj.toString();
        if (preference == mPriority)
            mPriority.setSummary(checkNull(s));
        else
        if (preference == mNetworkMode)
        {
            mNetworkMode.setValue(s);
            int i = Integer.parseInt(s);
            String s1;
            if ((8 & getBaseBand()) == 0)
                s1 = getResources().getStringArray(0x7f07001b)[i];
            else
                s1 = getResources().getStringArray(0x7f07001c)[i];
            mNetworkMode.setSummary(s1);
        }
        return true;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference == mNetworkId)
        {
            removeDialog(0);
            showDialog(0);
            validate();
        }
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }

    protected void onResume()
    {
        boolean flag = true;
        super.onResume();
        createNetworkInfo(getIntent());
        if (android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", -1) != flag)
            flag = false;
        mAirplaneModeEnabled = flag;
        if (CallSettings.isMultipleSim())
            mDualSimMode = android.provider.Settings.System.getInt(getContentResolver(), "dual_sim_mode_setting", -1);
        setScreenEnabled();
    }

    public void onTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    public void validate()
    {
        int i = mNetworkIdText.getText().toString().length();
        boolean flag = true;
        if (i < 5 || i > 6)
            flag = false;
        if (mIdDialog != null)
            mIdDialog.getButton(-1).setEnabled(flag);
    }



/*
    static boolean access$102(NetworkEditor networkeditor, boolean flag)
    {
        networkeditor.mAirplaneModeEnabled = flag;
        return flag;
    }

*/


/*
    static int access$202(NetworkEditor networkeditor, int i)
    {
        networkeditor.mDualSimMode = i;
        return i;
    }

*/




}
