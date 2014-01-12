// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.*;
import android.app.admin.DevicePolicyManager;
import android.content.*;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.text.TextUtils;
import android.view.*;
import android.widget.Button;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.settings:
//            ChooseLockSettingsHelper, CryptKeeperConfirm

public class CryptKeeperSettings extends Fragment
{

    private static final int KEYGUARD_REQUEST = 55;
    private static final int MIN_BATTERY_LEVEL = 80;
    static final int MIN_PASSWORD_QUALITY = 0x20000;
    private static final String TAG = "CryptKeeper";
    private View mBatteryWarning;
    private View mContentView;
    private Button mInitiateButton;
    private android.view.View.OnClickListener mInitiateListener;
    private IntentFilter mIntentFilter;
    private BroadcastReceiver mIntentReceiver;
    private View mPowerWarning;

    public CryptKeeperSettings()
    {
        mIntentReceiver = new BroadcastReceiver() {

            final CryptKeeperSettings this$0;

            public void onReceive(Context context, Intent intent)
            {
                byte byte0 = 8;
                boolean flag = true;
                if (intent.getAction().equals("android.intent.action.BATTERY_CHANGED"))
                {
                    int i = intent.getIntExtra("level", 0);
                    int j = intent.getIntExtra("plugged", 0);
                    int k = intent.getIntExtra("invalid_charger", 0);
                    boolean flag1;
                    if (i >= 80)
                        flag1 = flag;
                    else
                        flag1 = false;
                    boolean flag2;
                    if ((j & 7) != 0 && k == 0)
                        flag2 = flag;
                    else
                        flag2 = false;
                    Button button = mInitiateButton;
                    if (!flag1 || !flag2)
                        flag = false;
                    button.setEnabled(flag);
                    View view = mPowerWarning;
                    byte byte1;
                    if (flag2)
                        byte1 = byte0;
                    else
                        byte1 = 0;
                    view.setVisibility(byte1);
                    View view1 = mBatteryWarning;
                    if (!flag1)
                        byte0 = 0;
                    view1.setVisibility(byte0);
                }
            }

            
            {
                this$0 = CryptKeeperSettings.this;
                super();
            }
        }
;
        mInitiateListener = new android.view.View.OnClickListener() {

            final CryptKeeperSettings this$0;

            public void onClick(View view)
            {
                if (!runKeyguardConfirmation(55))
                    (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b0387).setIconAttribute(0x1010355).setMessage(0x7f0b0388).setPositiveButton(0x104000a, null).create().show();
            }

            
            {
                this$0 = CryptKeeperSettings.this;
                super();
            }
        }
;
    }

    private boolean runKeyguardConfirmation(int i)
    {
        LockPatternUtils lockpatternutils = new LockPatternUtils(getActivity());
        int j = lockpatternutils.getActivePasswordQuality();
        if (j == 32768 && lockpatternutils.isLockPasswordEnabled())
            j = lockpatternutils.getKeyguardStoredPasswordQuality();
        if (j < 0x20000)
        {
            return false;
        } else
        {
            Resources resources = getActivity().getResources();
            return (new ChooseLockSettingsHelper(getActivity(), this)).launchConfirmationActivity(i, resources.getText(0x7f0b05be), resources.getText(0x7f0b05bf));
        }
    }

    private void showFinalConfirmation(String s)
    {
        Preference preference = new Preference(getActivity());
        preference.setFragment(com/android/settings/CryptKeeperConfirm.getName());
        preference.setTitle(0x7f0b0389);
        preference.getExtras().putString("password", s);
        ((PreferenceActivity)getActivity()).onPreferenceStartFragment(null, preference);
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        Activity activity = getActivity();
        if ("android.app.action.START_ENCRYPTION".equals(activity.getIntent().getAction()))
        {
            DevicePolicyManager devicepolicymanager = (DevicePolicyManager)activity.getSystemService("device_policy");
            if (devicepolicymanager != null && devicepolicymanager.getStorageEncryptionStatus() != 1)
                activity.finish();
        }
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
        super.onActivityResult(i, j, intent);
        if (i == 55 && j == -1 && intent != null)
        {
            String s = intent.getStringExtra("password");
            if (!TextUtils.isEmpty(s))
            {
                showFinalConfirmation(s);
                return;
            }
        }
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        mContentView = layoutinflater.inflate(0x7f040021, null);
        mIntentFilter = new IntentFilter();
        mIntentFilter.addAction("android.intent.action.BATTERY_CHANGED");
        mInitiateButton = (Button)mContentView.findViewById(0x7f080045);
        mInitiateButton.setOnClickListener(mInitiateListener);
        mInitiateButton.setEnabled(false);
        mPowerWarning = mContentView.findViewById(0x7f080044);
        mBatteryWarning = mContentView.findViewById(0x7f080043);
        return mContentView;
    }

    public void onPause()
    {
        super.onPause();
        getActivity().unregisterReceiver(mIntentReceiver);
    }

    public void onResume()
    {
        super.onResume();
        getActivity().registerReceiver(mIntentReceiver, mIntentFilter);
    }




}
