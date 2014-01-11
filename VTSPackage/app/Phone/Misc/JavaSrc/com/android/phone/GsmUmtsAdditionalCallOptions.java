// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.ActionBar;
import android.content.*;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.view.MenuItem;
import com.mediatek.settings.CallSettings;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package com.android.phone:
//            TimeConsumingPreferenceActivity, CLIRListPreference, CallWaitingCheckBoxPreference, PhoneGlobals, 
//            PhoneUtils

public class GsmUmtsAdditionalCallOptions extends TimeConsumingPreferenceActivity
{

    private static final String BUTTON_CLIR_KEY = "button_clir_key";
    private static final String BUTTON_CW_KEY = "button_cw_key";
    private static final boolean DBG = true;
    public static final int DEFAULT_SIM = 2;
    private static final String LOG_TAG = "GsmUmtsAdditionalCallOptions";
    private CLIRListPreference mCLIRButton;
    private CallWaitingCheckBoxPreference mCWButton;
    boolean mFirstResume;
    Bundle mIcicle;
    private int mInitIndex;
    private IntentFilter mIntentFilter;
    private boolean mIsVtSetting;
    private final ArrayList mPreferences = new ArrayList();
    private BroadcastReceiver mReceiver;
    private int mSimId;

    public GsmUmtsAdditionalCallOptions()
    {
        mInitIndex = 0;
        mIcicle = null;
        mFirstResume = false;
        mSimId = 2;
        mIsVtSetting = false;
        mReceiver = new BroadcastReceiver() {

            final GsmUmtsAdditionalCallOptions this$0;

            public void onReceive(Context context, Intent intent)
            {
                if (intent.getAction().equals("android.intent.action.SIM_INFO_UPDATE"))
                {
                    List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(context);
                    if (list.size() == 0)
                    {
                        Xlog.d("GsmUmtsAdditionalCallOptions", "Activity finished");
                        CallSettings.goUpToTopLevelSetting(GsmUmtsAdditionalCallOptions.this);
                    } else
                    if (CallSettings.isMultipleSim() && list.size() == 1 && ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot != mSimId)
                    {
                        Xlog.d("GsmUmtsAdditionalCallOptions", (new StringBuilder()).append("temp.size()=").append(list.size()).append("Activity finished").toString());
                        finish();
                        return;
                    }
                }
            }

            
            {
                this$0 = GsmUmtsAdditionalCallOptions.this;
                super();
            }
        }
;
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f060010);
        PreferenceScreen preferencescreen = getPreferenceScreen();
        mCLIRButton = (CLIRListPreference)preferencescreen.findPreference("button_clir_key");
        mCWButton = (CallWaitingCheckBoxPreference)preferencescreen.findPreference("button_cw_key");
        mPreferences.add(mCLIRButton);
        mPreferences.add(mCWButton);
        if (CallSettings.isMultipleSim())
        {
            PhoneGlobals.getInstance();
            mSimId = getIntent().getIntExtra("simId", -1);
        }
        mIntentFilter = new IntentFilter("android.intent.action.SIM_INFO_UPDATE");
        registerReceiver(mReceiver, mIntentFilter);
        mIsVtSetting = getIntent().getBooleanExtra("ISVT", false);
        Xlog.d("GsmUmtsAdditionalCallOptions", (new StringBuilder()).append("[GsmUmtsAdditionalCallOptions]Sim Id : ").append(mSimId).append(" ISVT = ").append(mIsVtSetting).toString());
        mIcicle = bundle;
        mFirstResume = true;
        if (getIntent().getStringExtra("sub_title_name") != null)
            setTitle(getIntent().getStringExtra("sub_title_name"));
        if (mIsVtSetting)
            mCWButton.setServiceClass(512);
        PhoneUtils.setMmiFinished(false);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    protected void onDestroy()
    {
        super.onDestroy();
        unregisterReceiver(mReceiver);
    }

    public void onFinished(Preference preference, boolean flag)
    {
        if (mInitIndex < -1 + mPreferences.size() && !isFinishing())
        {
            mInitIndex = 1 + mInitIndex;
            Preference preference1 = (Preference)mPreferences.get(mInitIndex);
            if (preference1 instanceof CallWaitingCheckBoxPreference)
                ((CallWaitingCheckBoxPreference)preference1).init(this, false, mSimId);
        }
        super.onFinished(preference, flag);
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

    public void onResume()
    {
        super.onResume();
        mInitIndex = 0;
        if (mFirstResume)
        {
            mCLIRButton.init(this, false, mSimId);
            mFirstResume = false;
            return;
        }
        if (PhoneUtils.getMmiFinished())
        {
            mCLIRButton.init(this, false, mSimId);
            PhoneUtils.setMmiFinished(false);
            return;
        } else
        {
            mInitIndex = -1 + mPreferences.size();
            return;
        }
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        if (mCLIRButton.mClirArray != null)
            bundle.putIntArray(mCLIRButton.getKey(), mCLIRButton.mClirArray);
    }

}
