// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.ActionBar;
import android.content.*;
import android.os.Bundle;
import android.preference.*;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.MenuItem;
import com.mediatek.xlog.Xlog;
import java.util.List;

// Referenced classes of package com.mediatek.settings:
//            CallSettings

public class IpPrefixPreference extends PreferenceActivity
    implements android.preference.Preference.OnPreferenceChangeListener, TextWatcher
{

    private static final String IP_PREFIX_NUMBER_EDIT_KEY = "button_ip_prefix_edit_key";
    private static final String TAG = "IpPrefixPreference";
    private EditTextPreference mButtonIpPrefix;
    private String mInitTitle;
    private IntentFilter mIntentFilter;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final IpPrefixPreference this$0;

        public void onReceive(Context context, Intent intent)
        {
            if (intent.getAction().equals("android.intent.action.SIM_INFO_UPDATE"))
            {
                List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(context);
                if (list.size() == 0)
                {
                    Xlog.d("IpPrefixPreference", "Activity finished");
                    CallSettings.goUpToTopLevelSetting(IpPrefixPreference.this);
                } else
                if (CallSettings.isMultipleSim() && list.size() == 1 && ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot != mSlot)
                {
                    Xlog.d("IpPrefixPreference", (new StringBuilder()).append("temp.size()=").append(list.size()).append("Activity finished").toString());
                    finish();
                    return;
                }
            }
        }

            
            {
                this$0 = IpPrefixPreference.this;
                super();
            }
    }
;
    private int mSlot;

    public IpPrefixPreference()
    {
        mButtonIpPrefix = null;
        mSlot = -1;
        mInitTitle = null;
    }

    private String getIpPrefix(int i)
    {
        String s = "ipprefix";
        if (CallSettings.isMultipleSim())
        {
            android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(this, mSlot);
            if (siminfo != null)
                s = (new StringBuilder()).append(s).append(Long.valueOf(siminfo.mSimId).toString()).toString();
        }
        return android.provider.Settings.System.getString(getContentResolver(), s);
    }

    private void saveIpPrefix(String s)
    {
        String s1 = "ipprefix";
        if (CallSettings.isMultipleSim())
        {
            android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(this, mSlot);
            if (siminfo != null)
                s1 = (new StringBuilder()).append(s1).append(Long.valueOf(siminfo.mSimId).toString()).toString();
        }
        if (!android.provider.Settings.System.putString(getContentResolver(), s1, s))
            Log.d("IpPrefixPreference", "Store ip prefix error!");
    }

    public void afterTextChanged(Editable editable)
    {
    }

    public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f060013);
        mButtonIpPrefix = (EditTextPreference)findPreference("button_ip_prefix_edit_key");
        mButtonIpPrefix.setOnPreferenceChangeListener(this);
        mSlot = getIntent().getIntExtra("simId", -1);
        mInitTitle = getIntent().getStringExtra("sub_title_name");
        if (mInitTitle != null)
            setTitle(mInitTitle);
        mIntentFilter = new IntentFilter();
        mIntentFilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        registerReceiver(mReceiver, mIntentFilter);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    protected void onDestroy()
    {
        super.onDestroy();
        unregisterReceiver(mReceiver);
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
        mButtonIpPrefix.setSummary(obj.toString());
        mButtonIpPrefix.setText(obj.toString());
        if (obj == null || "".equals(obj))
            mButtonIpPrefix.setSummary(0x7f0d0098);
        saveIpPrefix(obj.toString());
        return false;
    }

    protected void onResume()
    {
        super.onResume();
        String s = getIpPrefix(mSlot);
        if (s != null && !"".equals(s))
        {
            mButtonIpPrefix.setSummary(s);
            mButtonIpPrefix.setText(s);
            return;
        } else
        {
            mButtonIpPrefix.setSummary(0x7f0d0098);
            mButtonIpPrefix.setText("");
            return;
        }
    }

    public void onTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

}
