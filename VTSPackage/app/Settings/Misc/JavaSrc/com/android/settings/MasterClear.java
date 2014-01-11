// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.accounts.*;
import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.*;
import android.os.storage.StorageManager;
import android.os.storage.StorageVolume;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.mediatek.xlog.Xlog;
import java.util.Locale;

// Referenced classes of package com.android.settings:
//            Utils, ChooseLockSettingsHelper, MasterClearConfirm

public class MasterClear extends Fragment
{

    static final String ERASE_EXTERNAL_EXTRA = "erase_sd";
    private static final int KEYGUARD_REQUEST = 55;
    private static final String TAG = "MasterClear";
    private View mContentView;
    private CheckBox mExternalStorage;
    private View mExternalStorageContainer;
    private Button mInitiateButton;
    private final android.view.View.OnClickListener mInitiateListener = new android.view.View.OnClickListener() {

        final MasterClear this$0;

        public void onClick(View view)
        {
            if (!runKeyguardConfirmation(55))
                showFinalConfirmation();
        }

            
            {
                this$0 = MasterClear.this;
                super();
            }
    }
;
    private String mVolumeDescription;


    private void establishInitialState()
    {
        mInitiateButton = (Button)mContentView.findViewById(0x7f0800d5);
        mInitiateButton.setOnClickListener(mInitiateListener);
        mExternalStorageContainer = mContentView.findViewById(0x7f0800d1);
        mExternalStorage = (CheckBox)mContentView.findViewById(0x7f0800d2);
        boolean flag = Environment.isExternalStorageEmulated();
        boolean flag1 = Utils.isSomeStorageEmulated();
        Xlog.d("MasterClear", (new StringBuilder()).append("isExtStorageEmulated=").append(flag).append(" isSomeStorageEmulated=").append(flag1).toString());
        if (!flag1 && !flag && (Environment.isExternalStorageRemovable() || !isExtStorageEncrypted()))
        {
            mExternalStorageContainer.setOnClickListener(new android.view.View.OnClickListener() {

                final MasterClear this$0;

                public void onClick(View view)
                {
                    mExternalStorage.toggle();
                }

            
            {
                this$0 = MasterClear.this;
                super();
            }
            }
);
        } else
        {
            mExternalStorageContainer.setVisibility(8);
            mContentView.findViewById(0x7f0800d0).setVisibility(8);
            mContentView.findViewById(0x7f0800cd).setVisibility(0);
            CheckBox checkbox = mExternalStorage;
            boolean flag2;
            if (!flag)
                flag2 = true;
            else
                flag2 = false;
            checkbox.setChecked(flag2);
        }
        loadAccountList();
    }

    private void getVolumeDescription()
    {
        StorageVolume astoragevolume[] = ((StorageManager)getActivity().getSystemService("storage")).getVolumeList();
        int i = 0;
        do
        {
label0:
            {
                if (i < astoragevolume.length)
                {
                    if (astoragevolume[i].isRemovable())
                        break label0;
                    mVolumeDescription = astoragevolume[i].getDescription(getActivity());
                    mVolumeDescription = mVolumeDescription.toLowerCase();
                }
                Xlog.d("MasterClear", (new StringBuilder()).append("mVolumeDescription=").append(mVolumeDescription).toString());
                return;
            }
            i++;
        } while (true);
    }

    private String getVolumeString(int i)
    {
        String s1;
        if (mVolumeDescription == null)
        {
            Xlog.d("MasterClear", "+mVolumeDescription is null and use default string");
            s1 = getString(i);
        } else
        {
            String s = getString(0x7f0b029a);
            Xlog.d("MasterClear", (new StringBuilder()).append("sdCardString=").append(s).toString());
            s1 = getString(i).replace(s, mVolumeDescription);
            if (s1 != null && s1.equals(getString(i)))
            {
                String s2 = s.toLowerCase().replace("sd", "SD");
                Xlog.d("MasterClear", (new StringBuilder()).append("sdCardString").append(s2).toString());
                s1 = getString(i).replace(s2, mVolumeDescription);
                Xlog.d("MasterClear", (new StringBuilder()).append("str").append(s1).toString());
            }
            if (s1 != null && s1.equals(getString(i)))
            {
                s1 = getString(i).replace("SD", mVolumeDescription);
                Xlog.d("MasterClear", (new StringBuilder()).append("Not any available then replase key word sd str=").append(s1).toString());
            }
            Locale locale = Locale.getDefault();
            if (locale.getCountry().equals(Locale.CHINA.getCountry()) || locale.getCountry().equals(Locale.TAIWAN.getCountry()))
                return s1.replace((new StringBuilder()).append(" ").append(mVolumeDescription).toString(), mVolumeDescription);
        }
        return s1;
    }

    private boolean isExtStorageEncrypted()
    {
        return !"".equals(SystemProperties.get("vold.decrypt"));
    }

    private void loadAccountList()
    {
        View view;
        LinearLayout linearlayout;
        Activity activity;
        Account aaccount[];
        int i;
        LayoutInflater layoutinflater;
        AuthenticatorDescription aauthenticatordescription[];
        int j;
        int k;
        view = mContentView.findViewById(0x7f0800ce);
        linearlayout = (LinearLayout)mContentView.findViewById(0x7f0800cf);
        linearlayout.removeAllViews();
        activity = getActivity();
        aaccount = AccountManager.get(activity).getAccounts();
        i = aaccount.length;
        if (i == 0)
        {
            view.setVisibility(8);
            linearlayout.setVisibility(8);
            return;
        }
        layoutinflater = (LayoutInflater)activity.getSystemService("layout_inflater");
        aauthenticatordescription = AccountManager.get(activity).getAuthenticatorTypes();
        j = aauthenticatordescription.length;
        k = 0;
_L11:
        Account account;
        int l;
        if (k >= i)
            break MISSING_BLOCK_LABEL_339;
        account = aaccount[k];
        l = 0;
_L7:
        int i1;
        AuthenticatorDescription authenticatordescription;
        i1 = l;
        authenticatordescription = null;
        if (i1 >= j) goto _L2; else goto _L1
_L1:
        if (!account.type.equals(aauthenticatordescription[l].type)) goto _L4; else goto _L3
_L3:
        authenticatordescription = aauthenticatordescription[l];
_L2:
        if (authenticatordescription != null) goto _L6; else goto _L5
_L5:
        Log.w("MasterClear", (new StringBuilder()).append("No descriptor for account name=").append(account.name).append(" type=").append(account.type).toString());
_L8:
        k++;
        continue; /* Loop/switch isn't completed */
_L4:
        l++;
          goto _L7
_L6:
        int j1 = authenticatordescription.iconId;
        android.graphics.drawable.Drawable drawable;
        drawable = null;
        if (j1 == 0)
            break MISSING_BLOCK_LABEL_252;
        android.graphics.drawable.Drawable drawable1 = activity.createPackageContext(authenticatordescription.packageName, 0).getResources().getDrawable(authenticatordescription.iconId);
        drawable = drawable1;
_L9:
        TextView textview = (TextView)layoutinflater.inflate(0x7f04004a, linearlayout, false);
        textview.setText(account.name);
        if (drawable != null)
            textview.setCompoundDrawablesWithIntrinsicBounds(drawable, null, null, null);
        linearlayout.addView(textview);
          goto _L8
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        Log.w("MasterClear", (new StringBuilder()).append("No icon for account type ").append(authenticatordescription.type).toString());
        drawable = null;
          goto _L9
        view.setVisibility(0);
        linearlayout.setVisibility(0);
        return;
        if (true) goto _L11; else goto _L10
_L10:
    }

    private boolean runKeyguardConfirmation(int i)
    {
        Resources resources = getActivity().getResources();
        return (new ChooseLockSettingsHelper(getActivity(), this)).launchConfirmationActivity(i, resources.getText(0x7f0b05be), resources.getText(0x7f0b05bf));
    }

    private void showFinalConfirmation()
    {
        Preference preference = new Preference(getActivity());
        preference.setFragment(com/android/settings/MasterClearConfirm.getName());
        preference.setTitle(0x7f0b05c1);
        preference.getExtras().putBoolean("erase_sd", mExternalStorage.isChecked());
        ((PreferenceActivity)getActivity()).onPreferenceStartFragment(null, preference);
    }

    private void updateTextLable()
    {
        ((TextView)mContentView.findViewById(0x7f0800d0)).setText(getVolumeString(0x7f0b05b8));
        ((TextView)mContentView.findViewById(0x7f0800d3)).setText(getVolumeString(0x7f0b05b9));
        ((TextView)mContentView.findViewById(0x7f0800d4)).setText(getVolumeString(0x7f0b05ba));
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
        super.onActivityResult(i, j, intent);
        if (i != 55)
            return;
        if (j == -1)
        {
            showFinalConfirmation();
            return;
        } else
        {
            establishInitialState();
            return;
        }
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        mContentView = layoutinflater.inflate(0x7f040049, null);
        getVolumeDescription();
        updateTextLable();
        establishInitialState();
        return mContentView;
    }



}
