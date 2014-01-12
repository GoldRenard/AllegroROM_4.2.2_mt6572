// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.inputmethod;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.*;
import android.content.pm.ServiceInfo;
import android.content.res.Resources;
import android.preference.Preference;
import android.text.TextUtils;
import android.view.View;
import android.view.textservice.*;
import android.widget.*;

// Referenced classes of package com.android.settings.inputmethod:
//            SpellCheckersSettings

public class SingleSpellCheckerPreference extends Preference
{

    private static final boolean DBG = false;
    private static final float DISABLED_ALPHA = 0.4F;
    private static final String TAG = com/android/settings/inputmethod/SingleSpellCheckerPreference.getSimpleName();
    private AlertDialog mDialog;
    private final SpellCheckersSettings mFragment;
    private View mPrefAll;
    private View mPrefLeftButton;
    private RadioButton mRadioButton;
    private final Resources mRes;
    private boolean mSelected;
    private View mSettingsButton;
    private Intent mSettingsIntent;
    private final SpellCheckerInfo mSpellCheckerInfo;
    private ImageView mSubtypeButton;
    private TextView mSummaryText;
    private TextView mTitleText;
    private final TextServicesManager mTsm;

    public SingleSpellCheckerPreference(SpellCheckersSettings spellcheckerssettings, Intent intent, SpellCheckerInfo spellcheckerinfo, TextServicesManager textservicesmanager)
    {
        super(spellcheckerssettings.getActivity(), null, 0);
        mDialog = null;
        mFragment = spellcheckerssettings;
        mRes = spellcheckerssettings.getActivity().getResources();
        mTsm = textservicesmanager;
        setLayoutResource(0x7f040075);
        mSpellCheckerInfo = spellcheckerinfo;
        mSelected = false;
        String s = mSpellCheckerInfo.getSettingsActivity();
        if (!TextUtils.isEmpty(s))
        {
            mSettingsIntent = new Intent("android.intent.action.MAIN");
            mSettingsIntent.setClassName(mSpellCheckerInfo.getPackageName(), s);
            return;
        } else
        {
            mSettingsIntent = null;
            return;
        }
    }

    private void enableButtons(boolean flag)
    {
        if (mSettingsButton != null)
            if (mSettingsIntent == null)
            {
                mSettingsButton.setVisibility(8);
            } else
            {
                mSettingsButton.setEnabled(flag);
                mSettingsButton.setClickable(flag);
                mSettingsButton.setFocusable(flag);
                if (!flag)
                    mSettingsButton.setAlpha(0.4F);
            }
        if (mSubtypeButton != null)
            if (mSpellCheckerInfo.getSubtypeCount() <= 0)
            {
                mSubtypeButton.setVisibility(8);
            } else
            {
                mSubtypeButton.setEnabled(flag);
                mSubtypeButton.setClickable(flag);
                mSubtypeButton.setFocusable(flag);
                if (!flag)
                {
                    mSubtypeButton.setAlpha(0.4F);
                    return;
                }
            }
    }

    private void onLeftButtonClicked(View view)
    {
        mFragment.onPreferenceClick(this);
    }

    private void onSettingsButtonClicked(View view)
    {
        if (mFragment == null || mSettingsIntent == null)
            break MISSING_BLOCK_LABEL_25;
        mFragment.startActivity(mSettingsIntent);
        return;
        ActivityNotFoundException activitynotfoundexception;
        activitynotfoundexception;
        SpellCheckersSettings spellcheckerssettings = mFragment;
        Object aobj[] = new Object[1];
        aobj[0] = mSpellCheckerInfo.loadLabel(mFragment.getActivity().getPackageManager());
        String s = spellcheckerssettings.getString(0x7f0b06c9, aobj);
        Toast.makeText(mFragment.getActivity(), s, 1).show();
        return;
    }

    private void onSubtypeButtonClicked(View view)
    {
        android.app.AlertDialog.Builder builder;
        int i;
        CharSequence acharsequence[];
        SpellCheckerSubtype spellcheckersubtype;
        int k;
        if (mDialog != null && mDialog.isShowing())
            mDialog.dismiss();
        builder = new android.app.AlertDialog.Builder(mFragment.getActivity());
        builder.setTitle(0x7f0b06bb);
        i = mSpellCheckerInfo.getSubtypeCount();
        acharsequence = new CharSequence[i + 1];
        acharsequence[0] = mRes.getString(0x7f0b0701);
        for (int j = 0; j < i; j++)
        {
            CharSequence charsequence = mSpellCheckerInfo.getSubtypeAt(j).getDisplayName(mFragment.getActivity(), mSpellCheckerInfo.getPackageName(), mSpellCheckerInfo.getServiceInfo().applicationInfo);
            acharsequence[j + 1] = charsequence;
        }

        spellcheckersubtype = mTsm.getCurrentSpellCheckerSubtype(false);
        k = 0;
        if (spellcheckersubtype == null) goto _L2; else goto _L1
_L1:
        int l = 0;
_L7:
        k = 0;
        if (l >= i) goto _L2; else goto _L3
_L3:
        if (!mSpellCheckerInfo.getSubtypeAt(l).equals(spellcheckersubtype)) goto _L5; else goto _L4
_L4:
        k = l + 1;
_L2:
        builder.setSingleChoiceItems(acharsequence, k, new android.content.DialogInterface.OnClickListener() {

            final SingleSpellCheckerPreference this$0;

            public void onClick(DialogInterface dialoginterface, int i1)
            {
                if (i1 == 0)
                    mTsm.setSpellCheckerSubtype(null);
                else
                    mTsm.setSpellCheckerSubtype(mSpellCheckerInfo.getSubtypeAt(i1 - 1));
                dialoginterface.dismiss();
            }

            
            {
                this$0 = SingleSpellCheckerPreference.this;
                super();
            }
        }
);
        mDialog = builder.create();
        mDialog.show();
        return;
_L5:
        l++;
        if (true) goto _L7; else goto _L6
_L6:
    }

    private void updateSelectedState(boolean flag)
    {
        if (mPrefAll != null)
        {
            mRadioButton.setChecked(flag);
            enableButtons(flag);
        }
    }

    public SpellCheckerInfo getSpellCheckerInfo()
    {
        return mSpellCheckerInfo;
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        mPrefAll = view.findViewById(0x7f08011f);
        mRadioButton = (RadioButton)view.findViewById(0x7f080121);
        mPrefLeftButton = view.findViewById(0x7f080120);
        mPrefLeftButton.setOnClickListener(new android.view.View.OnClickListener() {

            final SingleSpellCheckerPreference this$0;

            public void onClick(View view1)
            {
                onLeftButtonClicked(view1);
            }

            
            {
                this$0 = SingleSpellCheckerPreference.this;
                super();
            }
        }
);
        mTitleText = (TextView)view.findViewById(0x1020016);
        mSummaryText = (TextView)view.findViewById(0x1020010);
        mSubtypeButton = (ImageView)view.findViewById(0x7f080124);
        mSubtypeButton.setOnClickListener(new android.view.View.OnClickListener() {

            final SingleSpellCheckerPreference this$0;

            public void onClick(View view1)
            {
                onSubtypeButtonClicked(view1);
            }

            
            {
                this$0 = SingleSpellCheckerPreference.this;
                super();
            }
        }
);
        mSettingsButton = view.findViewById(0x7f080122);
        mSettingsButton.setOnClickListener(new android.view.View.OnClickListener() {

            final SingleSpellCheckerPreference this$0;

            public void onClick(View view1)
            {
                onSettingsButtonClicked(view1);
            }

            
            {
                this$0 = SingleSpellCheckerPreference.this;
                super();
            }
        }
);
        updateSelectedState(mSelected);
    }

    public void setSelected(boolean flag)
    {
        mSelected = flag;
        updateSelectedState(flag);
    }






}
