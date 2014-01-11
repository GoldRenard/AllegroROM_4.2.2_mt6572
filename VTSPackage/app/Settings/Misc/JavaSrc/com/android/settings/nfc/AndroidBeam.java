// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.nfc;

import android.app.*;
import android.content.res.Resources;
import android.nfc.NfcAdapter;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.view.*;
import android.widget.*;
import com.mediatek.beam.BeamShareHistory;

public class AndroidBeam extends Fragment
    implements android.widget.CompoundButton.OnCheckedChangeListener
{

    private static final int MENU_SHOW_RECEIVED_FILES;
    private Switch mActionBarSwitch;
    private ImageView mImageView;
    private NfcAdapter mNfcAdapter;
    private CharSequence mOldActivityTitle;
    private View mView;


    private void initView(View view)
    {
        if (mNfcAdapter != null)
        {
            mActionBarSwitch.setOnCheckedChangeListener(this);
            mActionBarSwitch.setChecked(mNfcAdapter.isNdefPushEnabled());
        }
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        mActionBarSwitch.setEnabled(false);
        boolean flag1;
        if (flag)
            flag1 = mNfcAdapter.enableNdefPush();
        else
            flag1 = mNfcAdapter.disableNdefPush();
        if (flag1)
            mActionBarSwitch.setChecked(flag);
        mActionBarSwitch.setEnabled(true);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Activity activity = getActivity();
        mActionBarSwitch = new Switch(activity);
        if (activity instanceof PreferenceActivity)
        {
            PreferenceActivity preferenceactivity = (PreferenceActivity)activity;
            int i = activity.getResources().getDimensionPixelSize(0x7f0d0002);
            mActionBarSwitch.setPadding(0, 0, i, 0);
            activity.getActionBar().setDisplayOptions(16, 16);
            activity.getActionBar().setCustomView(mActionBarSwitch, new android.app.ActionBar.LayoutParams(-2, -2, 0x800015));
            if (!preferenceactivity.onIsMultiPane() || preferenceactivity.onIsHidingHeaders())
            {
                mOldActivityTitle = getActivity().getTitle();
                activity.getActionBar().setTitle(0x7f0b0428);
            }
        }
        mNfcAdapter = NfcAdapter.getDefaultAdapter(getActivity());
        if (mNfcAdapter != null)
        {
            mActionBarSwitch.setOnCheckedChangeListener(this);
            mActionBarSwitch.setChecked(mNfcAdapter.isNdefPushEnabled());
        }
        setHasOptionsMenu(true);
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        super.onCreateOptionsMenu(menu, menuinflater);
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        mView = layoutinflater.inflate(0x7f040004, viewgroup, false);
        initView(mView);
        return mView;
    }

    public void onDestroyView()
    {
        getActivity().getActionBar().setCustomView(null);
        if (mOldActivityTitle != null)
            getActivity().getActionBar().setTitle(mOldActivityTitle);
        super.onDestroyView();
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        if (menuitem.getItemId() == 0)
            ((PreferenceActivity)getActivity()).startPreferencePanel(com/mediatek/beam/BeamShareHistory.getName(), null, 0, null, null, 0);
        return super.onOptionsItemSelected(menuitem);
    }
}
