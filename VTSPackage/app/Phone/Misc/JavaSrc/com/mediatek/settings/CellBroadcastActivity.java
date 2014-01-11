// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.ActionBar;
import android.content.*;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.view.MenuItem;
import com.android.phone.TimeConsumingPreferenceActivity;
import com.mediatek.xlog.Xlog;
import java.util.List;

// Referenced classes of package com.mediatek.settings:
//            CellBroadcastCheckBox, CellBroadcastSettings

public class CellBroadcastActivity extends TimeConsumingPreferenceActivity
{

    private static final String BUTTON_CB_CHECKBOX_KEY = "enable_cellBroadcast";
    private static final String BUTTON_CB_SETTINGS_KEY = "cbsettings";
    private static final String LOG_TAG = "Settings/CellBroadcastActivity";
    private CellBroadcastCheckBox mCBCheckBox;
    private Preference mCBSetting;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final CellBroadcastActivity this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            Xlog.d("Settings/CellBroadcastActivity", (new StringBuilder()).append("[action = ").append(s).append("]").toString());
            if ("android.intent.action.SIM_INFO_UPDATE".equals(s))
                setScreenEnabled();
        }

            
            {
                this$0 = CellBroadcastActivity.this;
                super();
            }
    }
;
    int mSimId;

    public CellBroadcastActivity()
    {
        mSimId = 0;
        mCBCheckBox = null;
        mCBSetting = null;
    }

    private void setScreenEnabled()
    {
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        if (list.size() == 0)
            finish();
        else
        if (list.size() == 1 && mSimId != ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot)
        {
            finish();
            return;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f06000a);
        mSimId = getIntent().getIntExtra("simId", 0);
        mCBCheckBox = (CellBroadcastCheckBox)findPreference("enable_cellBroadcast");
        mCBSetting = findPreference("cbsettings");
        CellBroadcastCheckBox cellbroadcastcheckbox = mCBCheckBox;
        int i;
        if (mCBCheckBox.isChecked())
            i = 0x7f0d00f2;
        else
            i = 0x7f0d00f3;
        cellbroadcastcheckbox.setSummary(i);
        if (getIntent().getStringExtra("sub_title_name") != null)
            setTitle(getIntent().getStringExtra("sub_title_name"));
        if (mCBCheckBox != null)
            mCBCheckBox.init(this, false, mSimId);
        IntentFilter intentfilter = new IntentFilter("android.intent.action.SIM_INFO_UPDATE");
        registerReceiver(mReceiver, intentfilter);
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

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference == mCBSetting)
        {
            Intent intent = new Intent(this, com/mediatek/settings/CellBroadcastSettings);
            intent.putExtra("simId", mSimId);
            startActivity(intent);
            return true;
        } else
        {
            return false;
        }
    }

}
