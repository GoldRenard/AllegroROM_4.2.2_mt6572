// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.ActionBar;
import android.content.*;
import android.database.Cursor;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.telephony.ServiceState;
import android.view.MenuItem;
import android.widget.Toast;
import com.android.internal.telephony.CallForwardInfo;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.mediatek.settings.CallSettings;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.android.phone:
//            TimeConsumingPreferenceActivity, PhoneGlobals, CallForwardEditPreference, PhoneUtils

public class GsmUmtsCallForwardOptions extends TimeConsumingPreferenceActivity
{

    private static final String BUTTON_CFB_KEY = "button_cfb_key";
    private static final String BUTTON_CFNRC_KEY = "button_cfnrc_key";
    private static final String BUTTON_CFNRY_KEY = "button_cfnry_key";
    private static final String BUTTON_CFU_KEY = "button_cfu_key";
    private static final boolean DBG = true;
    public static final int DEFAULT_SIM = 2;
    private static final String KEY_ITEM_STATUS = "item_status";
    private static final String KEY_NUMBER = "number";
    private static final String KEY_STATUS = "status";
    private static final String KEY_TOGGLE = "toggle";
    private static final String LOG_TAG = "Settings/GsmUmtsCallForwardOptions";
    private static final String NUM_PROJECTION[] = {
        "data1"
    };
    private CallForwardEditPreference mButtonCFB;
    private CallForwardEditPreference mButtonCFNRc;
    private CallForwardEditPreference mButtonCFNRy;
    private CallForwardEditPreference mButtonCFU;
    private boolean mFirstResume;
    private Bundle mIcicle;
    private int mInitIndex;
    private BroadcastReceiver mIntentReceiver;
    private boolean mIsFinished;
    private boolean mIsVtSetting;
    private final ArrayList mPreferences = new ArrayList();
    private int mSimId;

    public GsmUmtsCallForwardOptions()
    {
        mInitIndex = 0;
        mIsFinished = false;
        mIsVtSetting = false;
        mSimId = 2;
        mIntentReceiver = new BroadcastReceiver() {

            final GsmUmtsCallForwardOptions this$0;

            public void onReceive(Context context, Intent intent)
            {
                String s = intent.getAction();
                if ("android.intent.action.AIRPLANE_MODE".equals(s))
                {
                    if (intent.getBooleanExtra("state", false))
                        finish();
                } else
                if ("android.intent.action.DUAL_SIM_MODE".equals(s))
                {
                    if (intent.getIntExtra("mode", -1) == 0)
                    {
                        finish();
                        return;
                    }
                } else
                if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
                {
                    List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(context);
                    if (list.size() == 0)
                    {
                        Xlog.d("Settings/GsmUmtsCallForwardOptions", "Activity finished");
                        CallSettings.goUpToTopLevelSetting(GsmUmtsCallForwardOptions.this);
                        return;
                    }
                    if (CallSettings.isMultipleSim() && list.size() == 1 && ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot != mSimId)
                    {
                        Xlog.d("Settings/GsmUmtsCallForwardOptions", (new StringBuilder()).append("temp.size()=").append(list.size()).append("Activity finished").toString());
                        finish();
                        return;
                    }
                }
            }

            
            {
                this$0 = GsmUmtsCallForwardOptions.this;
                super();
            }
        }
;
    }

    private void isReady()
    {
        Phone phone = PhoneGlobals.getPhone();
        int i;
        if (CallSettings.isMultipleSim())
            i = ((GeminiPhone)phone).getServiceStateGemini(mSimId).getState();
        else
            i = phone.getServiceState().getState();
        if (i != 0)
        {
            finish();
            Toast.makeText(this, getString(0x7f0d00e5), 0).show();
        }
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        Xlog.d("Settings/GsmUmtsCallForwardOptions", "onActivityResult: done");
        if (j == -1) goto _L2; else goto _L1
_L1:
        Xlog.d("Settings/GsmUmtsCallForwardOptions", "onActivityResult: contact picker result not OK.");
_L15:
        return;
_L2:
        Cursor cursor = null;
        cursor = getContentResolver().query(intent.getData(), NUM_PROJECTION, null, null, null);
        if (cursor == null) goto _L4; else goto _L3
_L3:
        boolean flag = cursor.moveToFirst();
        if (!flag) goto _L4; else goto _L5
_L5:
        i;
        JVM INSTR tableswitch 0 3: default 96
    //                   0 109
    //                   1 151
    //                   2 176
    //                   3 201;
           goto _L4 _L6 _L7 _L8 _L9
_L4:
        if (cursor != null)
        {
            cursor.close();
            return;
        }
        continue; /* Loop/switch isn't completed */
_L6:
        if (mButtonCFU == null) goto _L4; else goto _L10
_L10:
        mButtonCFU.onPickActivityResult(cursor.getString(0));
          goto _L4
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
_L7:
        if (mButtonCFB == null) goto _L4; else goto _L11
_L11:
        mButtonCFB.onPickActivityResult(cursor.getString(0));
          goto _L4
_L8:
        if (mButtonCFNRy == null) goto _L4; else goto _L12
_L12:
        mButtonCFNRy.onPickActivityResult(cursor.getString(0));
          goto _L4
_L9:
        if (mButtonCFNRc == null) goto _L4; else goto _L13
_L13:
        mButtonCFNRc.onPickActivityResult(cursor.getString(0));
          goto _L4
        if (true) goto _L15; else goto _L14
_L14:
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f060003);
        PreferenceScreen preferencescreen = getPreferenceScreen();
        mButtonCFU = (CallForwardEditPreference)preferencescreen.findPreference("button_cfu_key");
        mButtonCFB = (CallForwardEditPreference)preferencescreen.findPreference("button_cfb_key");
        mButtonCFNRy = (CallForwardEditPreference)preferencescreen.findPreference("button_cfnry_key");
        mButtonCFNRc = (CallForwardEditPreference)preferencescreen.findPreference("button_cfnrc_key");
        mButtonCFU.setParentActivity(this, mButtonCFU.mReason);
        mButtonCFB.setParentActivity(this, mButtonCFB.mReason);
        mButtonCFNRy.setParentActivity(this, mButtonCFNRy.mReason);
        mButtonCFNRc.setParentActivity(this, mButtonCFNRc.mReason);
        mPreferences.add(mButtonCFU);
        mPreferences.add(mButtonCFB);
        mPreferences.add(mButtonCFNRy);
        mPreferences.add(mButtonCFNRc);
        mFirstResume = true;
        mIcicle = bundle;
        if (CallSettings.isMultipleSim())
            mSimId = getIntent().getIntExtra("simId", -1);
        mIsVtSetting = getIntent().getBooleanExtra("ISVT", false);
        Xlog.d("GsmUmtsCallForwardoptions", (new StringBuilder()).append("Sim Id : ").append(mSimId).append("  for VT setting = ").append(mIsVtSetting).toString());
        isReady();
        if (mIsVtSetting)
        {
            mButtonCFU.setServiceClass(512);
            mButtonCFB.setServiceClass(512);
            mButtonCFNRy.setServiceClass(512);
            mButtonCFNRc.setServiceClass(512);
        }
        if (bundle != null)
        {
            Iterator iterator = mPreferences.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                CallForwardEditPreference callforwardeditpreference = (CallForwardEditPreference)iterator.next();
                if (callforwardeditpreference != null)
                {
                    Bundle bundle1 = (Bundle)bundle.getParcelable(callforwardeditpreference.getKey());
                    if (bundle1 != null)
                        callforwardeditpreference.setToggled(bundle1.getBoolean("toggle"));
                }
            } while (true);
        }
        PhoneUtils.setMmiFinished(false);
        if (getIntent().getStringExtra("sub_title_name") != null)
            setTitle(getIntent().getStringExtra("sub_title_name"));
        IntentFilter intentfilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        intentfilter.addAction("android.intent.action.DUAL_SIM_MODE");
        intentfilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        registerReceiver(mIntentReceiver, intentfilter);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    public void onDestroy()
    {
        if (mButtonCFU != null)
            mButtonCFU.setStatus(true);
        if (mButtonCFB != null)
            mButtonCFB.setStatus(true);
        if (mButtonCFNRy != null)
            mButtonCFNRy.setStatus(true);
        if (mButtonCFNRc != null)
            mButtonCFNRc.setStatus(true);
        unregisterReceiver(mIntentReceiver);
        super.onDestroy();
    }

    public void onFinished(Preference preference, boolean flag)
    {
        if (mInitIndex < -1 + mPreferences.size() && !isFinishing())
        {
            ArrayList arraylist = mPreferences;
            int i = mInitIndex;
            mInitIndex = i + 1;
            if (((CallForwardEditPreference)arraylist.get(i)).isSuccess())
            {
                Xlog.d("Settings/GsmUmtsCallForwardOptions", (new StringBuilder()).append("START INIT(onFinished): mInitIndex is  ").append(mInitIndex).toString());
                ((CallForwardEditPreference)mPreferences.get(mInitIndex)).init(this, false, mSimId);
            } else
            {
                for (int j = mInitIndex; j < mPreferences.size(); j++)
                    ((CallForwardEditPreference)mPreferences.get(j)).setEnabled(false);

                mInitIndex = mPreferences.size();
            }
        }
        super.onFinished(preference, flag);
        removeDialog();
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
        if (mFirstResume)
        {
            mInitIndex = 0;
            Xlog.d("Settings/GsmUmtsCallForwardOptions", (new StringBuilder()).append("START INIT(onResume1): mInitIndex is  ").append(mInitIndex).toString());
            ((CallForwardEditPreference)mPreferences.get(mInitIndex)).init(this, false, mSimId);
            mFirstResume = false;
            return;
        }
        if (PhoneUtils.getMmiFinished())
        {
            mInitIndex = 0;
            Xlog.d("Settings/GsmUmtsCallForwardOptions", (new StringBuilder()).append("START INIT(onResume2): mInitIndex is  ").append(mInitIndex).toString());
            ((CallForwardEditPreference)mPreferences.get(mInitIndex)).init(this, false, mSimId);
            PhoneUtils.setMmiFinished(false);
            return;
        } else
        {
            Xlog.d("Settings/GsmUmtsCallForwardOptions", "No change, so don't query!");
            return;
        }
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        CallForwardEditPreference callforwardeditpreference;
        Bundle bundle1;
        for (Iterator iterator = mPreferences.iterator(); iterator.hasNext(); bundle.putParcelable(callforwardeditpreference.getKey(), bundle1))
        {
            callforwardeditpreference = (CallForwardEditPreference)iterator.next();
            bundle1 = new Bundle();
            bundle1.putBoolean("toggle", callforwardeditpreference.isToggled());
            bundle1.putBoolean("item_status", callforwardeditpreference.isEnabled());
            if (callforwardeditpreference.mCallForwardInfo != null)
            {
                bundle1.putString("number", callforwardeditpreference.mCallForwardInfo.number);
                bundle1.putInt("status", callforwardeditpreference.mCallForwardInfo.status);
            }
        }

    }

    public void refreshSettings(boolean flag)
    {
        if (flag)
        {
            mInitIndex = 1;
            Xlog.d("Settings/GsmUmtsCallForwardOptions", (new StringBuilder()).append("START INIT(refreshSettings): mInitIndex is  ").append(mInitIndex).toString());
            ((CallForwardEditPreference)mPreferences.get(mInitIndex)).init(this, false, mSimId);
        }
    }


}
