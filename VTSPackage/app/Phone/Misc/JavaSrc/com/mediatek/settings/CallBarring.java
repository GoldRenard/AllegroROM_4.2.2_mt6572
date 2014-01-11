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
import com.android.phone.*;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package com.mediatek.settings:
//            CallBarringInterface, CallBarringBasePreference, CallBarringResetPreference, CallSettings, 
//            CallBarringChangePassword

public class CallBarring extends TimeConsumingPreferenceActivity
    implements CallBarringInterface
{

    private static final String BUTTON_ALL_INCOMING_EXCEPT = "all_incoming_except_key";
    private static final String BUTTON_ALL_INCOMING_KEY = "all_incoming_key";
    private static final String BUTTON_ALL_OUTING_KEY = "all_outing_international_key";
    private static final String BUTTON_CALL_BARRING_KEY = "all_outing_key";
    private static final String BUTTON_CHANGE_PASSWORD_KEY = "change_password_key";
    private static final String BUTTON_DEACTIVATE_KEY = "deactivate_all_key";
    private static final String BUTTON_OUT_INTERNATIONAL_EXCEPT = "all_outing_except_key";
    private static final boolean DBG = true;
    public static final int DEFAULT_SIM = 2;
    private static final String LOG_TAG = "Settings/CallBarring";
    private CallBarringBasePreference mCallAllOutButton;
    private CallBarringResetPreference mCallCancel;
    private CallBarringChangePassword mCallChangePassword;
    private CallBarringBasePreference mCallInButton;
    private CallBarringBasePreference mCallInButton2;
    private CallBarringBasePreference mCallInternationalOutButton;
    private CallBarringBasePreference mCallInternationalOutButton2;
    private ArrayList mCheckedPreferences;
    private int mErrorState;
    private boolean mFirstResume;
    private int mInitIndex;
    private IntentFilter mIntentFilter;
    private String mPassword;
    private ArrayList mPreferences;
    private BroadcastReceiver mReceiver;
    private int mResetIndex;
    private int mSimId;
    private boolean mVtSetting;

    public CallBarring()
    {
        mPreferences = new ArrayList();
        mCheckedPreferences = new ArrayList();
        mInitIndex = 0;
        mResetIndex = 0;
        mPassword = null;
        mErrorState = 0;
        mFirstResume = false;
        mSimId = 2;
        mVtSetting = false;
        mReceiver = new BroadcastReceiver() {

            final CallBarring this$0;

            public void onReceive(Context context, Intent intent)
            {
                if (intent.getAction().equals("android.intent.action.SIM_INFO_UPDATE"))
                {
                    List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(context);
                    if (list.size() == 0)
                    {
                        Xlog.d("Settings/CallBarring", "Activity finished");
                        CallSettings.goUpToTopLevelSetting(CallBarring.this);
                    } else
                    if (CallSettings.isMultipleSim() && list.size() == 1 && ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot != mSimId)
                    {
                        Xlog.d("Settings/CallBarring", (new StringBuilder()).append("temp.size()=").append(list.size()).append("Activity finished").toString());
                        finish();
                        return;
                    }
                }
            }

            
            {
                this$0 = CallBarring.this;
                super();
            }
        }
;
    }

    private void doGetCallState(Preference preference)
    {
        if (preference instanceof CallBarringBasePreference)
            ((CallBarringBasePreference)preference).init(this, false, mSimId);
    }

    private void initial()
    {
        mCallAllOutButton.setmFacility("AO");
        mCallAllOutButton.setmTitle(0x7f0d00ba);
        mCallInternationalOutButton.setmFacility("OI");
        mCallInternationalOutButton.setmTitle(0x7f0d00bb);
        mCallInternationalOutButton2.setmFacility("OX");
        mCallInternationalOutButton2.setmTitle(0x7f0d00bc);
        mCallInButton.setmFacility("AI");
        mCallInButton.setmTitle(0x7f0d00bd);
        mCallInButton2.setmFacility("IR");
        mCallInButton2.setmTitle(0x7f0d00be);
        mCallCancel.setListener(this);
    }

    private void startUpdate()
    {
        mInitIndex = 0;
        Preference preference = (Preference)mPreferences.get(mInitIndex);
        if (preference != null)
        {
            doGetCallState(preference);
            PhoneUtils.setMmiFinished(false);
        }
    }

    public void doCallBarringRefresh(String s)
    {
        String s1 = mCallAllOutButton.getContext().getString(0x7f0d00c2);
        if (s.equals("AO"))
        {
            mCallInternationalOutButton.setSummary(s1);
            mCallInternationalOutButton.setChecked(false);
            mCallInternationalOutButton2.setSummary(s1);
            mCallInternationalOutButton2.setChecked(false);
        }
        if (s.equals("OI"))
        {
            mCallAllOutButton.setSummary(s1);
            mCallAllOutButton.setChecked(false);
            mCallInternationalOutButton2.setSummary(s1);
            mCallInternationalOutButton2.setChecked(false);
        }
        if (s.equals("OX"))
        {
            mCallAllOutButton.setSummary(s1);
            mCallAllOutButton.setChecked(false);
            mCallInternationalOutButton.setSummary(s1);
            mCallInternationalOutButton.setChecked(false);
        }
        if (s.equals("AI"))
        {
            mCallInButton2.setSummary(s1);
            mCallInButton2.setChecked(false);
        }
        if (s.equals("IR"))
        {
            mCallInButton.setSummary(s1);
            mCallInButton.setChecked(false);
        }
    }

    public void doCancelAllState()
    {
        String s = mCallAllOutButton.getContext().getString(0x7f0d00c2);
        mCallAllOutButton.setSummary(s);
        mCallAllOutButton.setChecked(false);
        mCallInternationalOutButton.setSummary(s);
        mCallInternationalOutButton.setChecked(false);
        mCallInternationalOutButton2.setSummary(s);
        mCallInternationalOutButton2.setChecked(false);
        mCallInButton.setSummary(s);
        mCallInButton.setChecked(false);
        mCallInButton2.setSummary(s);
        mCallInButton2.setChecked(false);
    }

    public int getErrorState()
    {
        return mErrorState;
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        dialoginterface.dismiss();
        if (300 == getErrorState())
            finish();
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        if (CallSettings.isMultipleSim())
        {
            PhoneGlobals.getInstance();
            mSimId = getIntent().getIntExtra("simId", -1);
        }
        mIntentFilter = new IntentFilter("android.intent.action.SIM_INFO_UPDATE");
        registerReceiver(mReceiver, mIntentFilter);
        mVtSetting = getIntent().getBooleanExtra("ISVT", false);
        Xlog.d("CallBarring", (new StringBuilder()).append("Sim Id : ").append(mSimId).append(" ISVT = ").append(mVtSetting).toString());
        addPreferencesFromResource(0x7f060000);
        PreferenceScreen preferencescreen = getPreferenceScreen();
        mCallAllOutButton = (CallBarringBasePreference)preferencescreen.findPreference("all_outing_key");
        mCallInternationalOutButton = (CallBarringBasePreference)preferencescreen.findPreference("all_outing_international_key");
        mCallInternationalOutButton2 = (CallBarringBasePreference)preferencescreen.findPreference("all_outing_except_key");
        mCallInButton = (CallBarringBasePreference)preferencescreen.findPreference("all_incoming_key");
        mCallInButton2 = (CallBarringBasePreference)preferencescreen.findPreference("all_incoming_except_key");
        mCallCancel = (CallBarringResetPreference)preferencescreen.findPreference("deactivate_all_key");
        mCallChangePassword = (CallBarringChangePassword)preferencescreen.findPreference("change_password_key");
        initial();
        mPreferences.add(mCallAllOutButton);
        mPreferences.add(mCallInternationalOutButton);
        mPreferences.add(mCallInternationalOutButton2);
        mPreferences.add(mCallInButton);
        mPreferences.add(mCallInButton2);
        mCallAllOutButton.setRefreshInterface(this);
        mCallInternationalOutButton.setRefreshInterface(this);
        mCallInternationalOutButton2.setRefreshInterface(this);
        mCallInButton.setRefreshInterface(this);
        mCallInButton2.setRefreshInterface(this);
        mCallCancel.setCallBarringInterface(this, mSimId);
        mCallChangePassword.setTimeConsumingListener(this, mSimId);
        if (getIntent().getStringExtra("sub_title_name") != null)
            setTitle(getIntent().getStringExtra("sub_title_name"));
        if (mVtSetting)
        {
            mCallAllOutButton.setServiceClass(512);
            mCallInternationalOutButton.setServiceClass(512);
            mCallInternationalOutButton2.setServiceClass(512);
            mCallInButton.setServiceClass(512);
            mCallInButton2.setServiceClass(512);
            mCallCancel.setServiceClass(512);
        }
        mFirstResume = true;
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
            if (((CallBarringBasePreference)mPreferences.get(mInitIndex)).isSuccess())
            {
                mInitIndex = 1 + mInitIndex;
                Xlog.i("Settings/CallBarring", (new StringBuilder()).append("onFinished() is called (init part) mInitIndex is ").append(mInitIndex).append("is reading?  ").append(flag).toString());
                doGetCallState((Preference)mPreferences.get(mInitIndex));
            } else
            {
                for (int i = mInitIndex; i < mPreferences.size(); i++)
                    ((Preference)mPreferences.get(i)).setEnabled(false);

                mInitIndex = mPreferences.size();
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
        if (mFirstResume)
        {
            mFirstResume = false;
            startUpdate();
        } else
        if (PhoneUtils.getMmiFinished())
        {
            startUpdate();
            return;
        }
    }

    public void resetIndex(int i)
    {
        mInitIndex = i;
    }

    public void setErrorState(int i)
    {
        mErrorState = i;
    }

}
