// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic.gemini;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.*;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.*;
import android.text.Editable;
import android.text.TextWatcher;
import android.widget.*;
import com.mediatek.oobe.utils.OOBEStepPreferenceActivity;
import com.mediatek.xlog.Xlog;
import java.util.List;

// Referenced classes of package com.mediatek.oobe.basic.gemini:
//            ColorPickerPreference

public class SimInfoEditor extends OOBEStepPreferenceActivity
    implements android.preference.Preference.OnPreferenceChangeListener, TextWatcher
{

    private static final int DIALOG_SIM_NAME_DUP = 1010;
    private static final String KEY_SIM_COLOR = "sim_color";
    private static final String KEY_SIM_NAME = "sim_name";
    private static final String KEY_SIM_NUMBER = "sim_number";
    private static final String KEY_SIM_NUMBER_FORMAT = "sim_number_format";
    private static final String KEY_SIM_STATUS = "status_info";
    private static final String TAG = "SimInfoEditor";
    private String mArrayNumFormat[];
    private IntentFilter mIntentFilter;
    private String mNotSet;
    private BroadcastReceiver mReceiver;
    private ColorPickerPreference mSimColor;
    private long mSimID;
    private EditTextPreference mSimName;
    private EditTextPreference mSimNumber;
    private ListPreference mSimNumberFormat;

    public SimInfoEditor()
    {
        mReceiver = new BroadcastReceiver() {

            final SimInfoEditor this$0;

            public void onReceive(Context context, Intent intent)
            {
                if (intent.getAction().equals("android.intent.action.SIM_INFO_UPDATE"))
                {
                    Xlog.d("SimInfoEditor", "ACTION_SIM_INFO_UPDATE received");
                    List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(SimInfoEditor.this);
                    if (list.size() == 0 || list.size() == 1 && ((android.provider.Telephony.SIMInfo)list.get(0)).mSimId != mSimID)
                    {
                        Xlog.d("SimInfoEditor", (new StringBuilder()).append("sim card number is ").append(list.size()).toString());
                        finish();
                    }
                }
            }

            
            {
                this$0 = SimInfoEditor.this;
                super();
            }
        }
;
    }

    private int turnNumformatValuetoIndex(int i)
    {
        if (i == 0)
            return 2;
        else
            return i - 1;
    }

    private void updateInfo()
    {
        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(this, mSimID);
        if (siminfo != null)
        {
            if (siminfo.mDisplayName == null)
            {
                mSimName.setSummary(mNotSet);
            } else
            {
                mSimName.setSummary(siminfo.mDisplayName);
                mSimName.setText(siminfo.mDisplayName);
            }
            if (siminfo.mNumber != null && siminfo.mNumber.length() != 0)
            {
                mSimNumber.setSummary(siminfo.mNumber);
                mSimNumber.setText(siminfo.mNumber);
            } else
            {
                mSimNumber.setSummary(mNotSet);
                mSimNumber.setText("");
            }
            mSimColor.setInitValue(siminfo.mColor);
            int i = turnNumformatValuetoIndex(siminfo.mDispalyNumberFormat);
            if (i >= 0)
            {
                mSimNumberFormat.setValueIndex(i);
                mSimNumberFormat.setSummary(mArrayNumFormat[i]);
                return;
            }
        }
    }

    public void afterTextChanged(Editable editable)
    {
    }

    public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    protected void finishActivityByResultCode(int i)
    {
        finish();
        overridePendingTransition(0x7f040000, 0x7f040003);
        Xlog.i("SimInfoEditor", (new StringBuilder()).append("SimInfoEditor Finish ").append(getStepSpecialTag()).toString());
    }

    protected String getStepSpecialTag()
    {
        return "SimInfoEditor";
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mNotSet = getResources().getString(0x7f090019);
        Bundle bundle1 = getIntent().getExtras();
        if (bundle1 != null)
            mSimID = bundle1.getLong("simid", -1L);
        Xlog.i("SimInfoEditor", (new StringBuilder()).append("simid is ").append(mSimID).toString());
        mArrayNumFormat = getResources().getStringArray(0x7f060003);
        initSpecialLayout(0x7f090057, 0x7f090058);
        addPreferencesFromResource(0x7f050007);
        mSimNumberFormat = (ListPreference)findPreference("sim_number_format");
        mSimNumberFormat.setOnPreferenceChangeListener(this);
        mSimName = (EditTextPreference)findPreference("sim_name");
        mSimName.setOnPreferenceChangeListener(this);
        mSimNumber = (EditTextPreference)findPreference("sim_number");
        mSimNumber.setOnPreferenceChangeListener(this);
        mSimColor = (ColorPickerPreference)findPreference("sim_color");
        mSimColor.setSimID(mSimID);
        mSimColor.setOnPreferenceChangeListener(this);
        Spinner spinner = (Spinner)findViewById(0x7f0b000d);
        if (spinner != null)
            spinner.setVisibility(8);
        mIntentFilter = new IntentFilter("android.intent.action.SIM_INFO_UPDATE");
    }

    public Dialog onCreateDialog(int i)
    {
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
        switch (i)
        {
        case 1010: 
            builder.setTitle(getResources().getString(0x7f09001f));
            builder.setIcon(0x1080027);
            builder.setMessage(getResources().getString(0x7f090020));
            builder.setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

                final SimInfoEditor this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                }

            
            {
                this$0 = SimInfoEditor.this;
                super();
            }
            }
);
            return builder.create();
        }
        return null;
    }

    public void onNextStep(boolean flag)
    {
        finish();
        if (flag)
        {
            overridePendingTransition(0x7f040002, 0x7f040001);
            return;
        } else
        {
            overridePendingTransition(0x7f040000, 0x7f040003);
            return;
        }
    }

    public void onPause()
    {
        super.onPause();
        unregisterReceiver(mReceiver);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        String s = preference.getKey();
        if ("sim_name".equals(s))
        {
            if (mSimName.getEditText().getText() != null)
            {
                String s2 = mSimName.getEditText().getText().toString();
                android.provider.Telephony.SIMInfo siminfo1 = android.provider.Telephony.SIMInfo.getSIMInfoById(this, mSimID);
                Xlog.i("SimInfoEditor", (new StringBuilder()).append("name is ").append(s2).toString());
                if (siminfo1 != null && s2 != null && s2.equals(siminfo1.mDisplayName))
                    return false;
                int k = android.provider.Telephony.SIMInfo.setDisplayName(this, s2, mSimID);
                Xlog.i("SimInfoEditor", (new StringBuilder()).append("result is ").append(k).toString());
                if (k > 0)
                {
                    mSimName.setSummary(s2);
                    Intent intent3 = new Intent("android.intent.action.SIM_SETTING_INFO_CHANGED");
                    intent3.putExtra("simid", mSimID);
                    intent3.putExtra("type", 0);
                    sendBroadcast(intent3);
                } else
                {
                    if (k == -2)
                        showDialog(1010);
                    if (siminfo1 != null && siminfo1.mDisplayName != null)
                        mSimName.setText(siminfo1.mDisplayName);
                    return false;
                }
            }
        } else
        if ("sim_color".equals(s))
        {
            if (android.provider.Telephony.SIMInfo.setColor(this, ((Integer)obj).intValue(), mSimID) > 0)
            {
                Xlog.i("SimInfoEditor", (new StringBuilder()).append("set color succeed ").append(obj).toString());
                Intent intent2 = new Intent("android.intent.action.SIM_SETTING_INFO_CHANGED");
                intent2.putExtra("simid", mSimID);
                intent2.putExtra("type", 1);
                sendBroadcast(intent2);
            }
        } else
        if ("sim_number".equals(s))
        {
            Editable editable = mSimNumber.getEditText().getText();
            if (editable != null)
            {
                Xlog.i("SimInfoEditor", "textNumber != null ");
                String s1 = editable.toString();
                if (android.provider.Telephony.SIMInfo.setNumber(this, s1, mSimID) > 0)
                {
                    Xlog.i("SimInfoEditor", (new StringBuilder()).append("set number succeed ").append(s1).toString());
                    if (s1 != null && s1.length() != 0)
                        mSimNumber.setSummary(s1);
                    else
                        mSimNumber.setSummary(mNotSet);
                    Intent intent1 = new Intent("android.intent.action.SIM_SETTING_INFO_CHANGED");
                    intent1.putExtra("simid", mSimID);
                    intent1.putExtra("type", 2);
                    sendBroadcast(intent1);
                } else
                {
                    android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(this, mSimID);
                    if (siminfo != null)
                        if (siminfo.mNumber != null && siminfo.mNumber.length() != 0)
                            mSimNumber.setText(siminfo.mNumber);
                        else
                            mSimNumber.setText("");
                    return false;
                }
            }
        } else
        if ("sim_number_format".equals(s))
        {
            int i = Integer.parseInt((String)obj);
            Xlog.i("SimInfoEditor", (new StringBuilder()).append("KEY_SIM_NUMBER_FORMAT is ").append(i).toString());
            if (i < 0)
                return false;
            if (android.provider.Telephony.SIMInfo.setDispalyNumberFormat(this, i, mSimID) > 0)
            {
                Xlog.i("SimInfoEditor", (new StringBuilder()).append("set format succeed ").append(i).toString());
                int j = turnNumformatValuetoIndex(i);
                mSimNumberFormat.setSummary(mArrayNumFormat[j]);
                Intent intent = new Intent("android.intent.action.SIM_SETTING_INFO_CHANGED");
                intent.putExtra("simid", mSimID);
                intent.putExtra("type", 3);
                sendBroadcast(intent);
            }
        }
        return true;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference.getKey().equals("status_info"))
        {
            Intent intent = new Intent();
            intent.setClassName("com.android.settings", "com.android.settings.deviceinfo.SimStatusGemini");
            int i = android.provider.Telephony.SIMInfo.getSlotById(this, mSimID);
            if (i >= 0)
            {
                intent.putExtra("slotid", i);
                Xlog.i("SimInfoEditor", (new StringBuilder()).append("slotid is ").append(i).toString());
                startActivity(intent);
                return false;
            }
        }
        return false;
    }

    public void onResume()
    {
        super.onResume();
        updateInfo();
        mSimName.getEditText().addTextChangedListener(this);
        registerReceiver(mReceiver, mIntentFilter);
    }

    public void onTextChanged(CharSequence charsequence, int i, int j, int k)
    {
        Dialog dialog = mSimName.getDialog();
        if (dialog instanceof AlertDialog)
        {
            Button button = ((AlertDialog)dialog).getButton(-1);
            boolean flag;
            if (charsequence.length() > 0)
                flag = true;
            else
                flag = false;
            button.setEnabled(flag);
        }
    }

}
