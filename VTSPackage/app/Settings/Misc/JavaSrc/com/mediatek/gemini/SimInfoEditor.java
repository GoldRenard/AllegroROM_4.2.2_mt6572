// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.gemini;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.*;
import android.text.Editable;
import android.text.TextWatcher;
import android.widget.Button;
import android.widget.EditText;
import com.android.settings.*;
import com.mediatek.settings.ext.ISimManagementExt;
import com.mediatek.xlog.Xlog;
import java.util.List;

// Referenced classes of package com.mediatek.gemini:
//            ColorPickerPreference

public class SimInfoEditor extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceChangeListener, TextWatcher
{

    private static final int DIALOG_SIM_NAME_DUP = 1010;
    private static final String KEY_SIM_COLOR = "sim_color";
    private static final String KEY_SIM_NAME = "sim_name";
    private static final String KEY_SIM_NUMBER = "sim_number";
    private static final String KEY_SIM_NUMBER_FORMAT = "sim_number_format";
    private static final String KEY_SIM_STATUS = "status_info";
    private static final int NAME_EXISTED = -2;
    private static final String TAG = "SimInfoEditor";
    private static final int TYPE_COLOR = 1;
    private static final int TYPE_FORMAT = 3;
    private static final int TYPE_NAME = 0;
    private static final int TYPE_NUMBER = 2;
    private static String sArrayNumFormat[];
    private static String sNotSet;
    private ISimManagementExt mExt;
    private IntentFilter mIntentFilter;
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
                String s = intent.getAction();
                if (s.equals("android.intent.action.AIRPLANE_MODE"))
                    updateStatusUiState();
                else
                if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
                {
                    Xlog.d("SimInfoEditor", "receive ACTION_SIM_INFO_UPDATE");
                    List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(getActivity());
                    if (list != null)
                    {
                        if (list.size() == 0)
                        {
                            Xlog.d("SimInfoEditor", (new StringBuilder()).append("Hot swap_simList.size()=").append(list.size()).toString());
                            goBackSettings();
                            return;
                        }
                        if (list.size() == 1 && ((android.provider.Telephony.SIMInfo)list.get(0)).mSimId != mSimID)
                        {
                            finish();
                            return;
                        }
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

    private void goBackSettings()
    {
        Intent intent = new Intent(getActivity(), com/android/settings/Settings);
        intent.addFlags(0x4000000);
        startActivity(intent);
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
        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(getActivity(), mSimID);
        if (siminfo != null)
        {
            if (siminfo.mDisplayName == null)
            {
                mSimName.setSummary(sNotSet);
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
                mSimNumber.setSummary(sNotSet);
                mSimNumber.setText("");
            }
            mSimColor.setInitValue(siminfo.mColor);
            int i = turnNumformatValuetoIndex(siminfo.mDispalyNumberFormat);
            if (i >= 0)
            {
                mSimNumberFormat.setValueIndex(i);
                mSimNumberFormat.setSummary(sArrayNumFormat[i]);
                return;
            }
        }
    }

    private void updateStatusUiState()
    {
        Preference preference;
label0:
        {
            boolean flag;
            if (android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", -1) == 1)
                flag = true;
            else
                flag = false;
            preference = findPreference("status_info");
            if (preference != null)
            {
                if (!flag)
                    break label0;
                preference.setEnabled(false);
            }
            return;
        }
        preference.setEnabled(true);
    }

    public void afterTextChanged(Editable editable)
    {
    }

    public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        sNotSet = getResources().getString(0x7f0b058e);
        Bundle bundle1 = getArguments();
        if (bundle1 != null)
            mSimID = bundle1.getLong("simid", -1L);
        Xlog.i("SimInfoEditor", (new StringBuilder()).append("simid is ").append(mSimID).toString());
        sArrayNumFormat = getResources().getStringArray(0x7f070047);
        addPreferencesFromResource(0x7f050034);
        mSimNumberFormat = (ListPreference)findPreference("sim_number_format");
        mSimNumberFormat.setOnPreferenceChangeListener(this);
        mSimName = (EditTextPreference)findPreference("sim_name");
        mSimName.setOnPreferenceChangeListener(this);
        mSimNumber = (EditTextPreference)findPreference("sim_number");
        mSimNumber.setOnPreferenceChangeListener(this);
        mSimColor = (ColorPickerPreference)findPreference("sim_color");
        mSimColor.setSimID(mSimID);
        mSimColor.setOnPreferenceChangeListener(this);
        PreferenceScreen preferencescreen = getPreferenceScreen();
        mExt = Utils.getSimManagmentExtPlugin(getActivity());
        mExt.updateSimManagementPref(preferencescreen);
        mExt.updateSimEditorPref(this);
    }

    public Dialog onCreateDialog(int i)
    {
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(getActivity());
        switch (i)
        {
        case 1010: 
            builder.setTitle(getResources().getString(0x7f0b00ec));
            builder.setIcon(0x1080027);
            builder.setMessage(getResources().getString(0x7f0b00ed));
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

    public void onPause()
    {
        super.onPause();
        Xlog.d("SimInfoEditor", "OnPause()");
        getActivity().unregisterReceiver(mReceiver);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        String s = preference.getKey();
        if ("sim_name".equals(s))
        {
            if (mSimName.getEditText().getText() != null)
            {
                String s2 = mSimName.getEditText().getText().toString();
                android.provider.Telephony.SIMInfo siminfo1 = android.provider.Telephony.SIMInfo.getSIMInfoById(getActivity(), mSimID);
                Xlog.i("SimInfoEditor", (new StringBuilder()).append("name is ").append(s2).toString());
                if (siminfo1 != null && s2 != null && s2.equals(siminfo1.mDisplayName))
                    return false;
                int k = android.provider.Telephony.SIMInfo.setDisplayNameEx(getActivity(), s2, mSimID, 2L);
                Xlog.i("SimInfoEditor", (new StringBuilder()).append("result is ").append(k).toString());
                if (k > 0)
                {
                    mSimName.setSummary(s2);
                    Intent intent3 = new Intent("android.intent.action.SIM_SETTING_INFO_CHANGED");
                    intent3.putExtra("simid", mSimID);
                    intent3.putExtra("type", 0);
                    getActivity().sendBroadcast(intent3);
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
            if (android.provider.Telephony.SIMInfo.setColor(getActivity(), ((Integer)obj).intValue(), mSimID) > 0)
            {
                Xlog.i("SimInfoEditor", (new StringBuilder()).append("set color succeed ").append(obj).toString());
                Intent intent2 = new Intent("android.intent.action.SIM_SETTING_INFO_CHANGED");
                intent2.putExtra("simid", mSimID);
                intent2.putExtra("type", 1);
                getActivity().sendBroadcast(intent2);
            }
        } else
        if ("sim_number".equals(s))
        {
            Editable editable = mSimNumber.getEditText().getText();
            if (editable != null)
            {
                Xlog.i("SimInfoEditor", "textNumber != null ");
                String s1 = editable.toString();
                if (android.provider.Telephony.SIMInfo.setNumber(getActivity(), s1, mSimID) > 0)
                {
                    Xlog.i("SimInfoEditor", (new StringBuilder()).append("set number succeed ").append(s1).toString());
                    if (s1 != null && s1.length() != 0)
                        mSimNumber.setSummary(s1);
                    else
                        mSimNumber.setSummary(sNotSet);
                    Intent intent1 = new Intent("android.intent.action.SIM_SETTING_INFO_CHANGED");
                    intent1.putExtra("simid", mSimID);
                    intent1.putExtra("type", 2);
                    getActivity().sendBroadcast(intent1);
                } else
                {
                    android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(getActivity(), mSimID);
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
            if (android.provider.Telephony.SIMInfo.setDispalyNumberFormat(getActivity(), i, mSimID) > 0)
            {
                Xlog.i("SimInfoEditor", (new StringBuilder()).append("set format succeed ").append(i).toString());
                int j = turnNumformatValuetoIndex(i);
                mSimNumberFormat.setSummary(sArrayNumFormat[j]);
                Intent intent = new Intent("android.intent.action.SIM_SETTING_INFO_CHANGED");
                intent.putExtra("simid", mSimID);
                intent.putExtra("type", 3);
                getActivity().sendBroadcast(intent);
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
            int i = android.provider.Telephony.SIMInfo.getSlotById(getActivity(), mSimID);
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
        updateStatusUiState();
        mIntentFilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        mIntentFilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        getActivity().registerReceiver(mReceiver, mIntentFilter);
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
