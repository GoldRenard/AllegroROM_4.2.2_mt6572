// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.inputmethod;

import android.content.Context;
import android.content.Intent;
import android.preference.CheckBoxPreference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.settings.SettingsPreferenceFragment;

public class CheckBoxAndSettingsPreference extends CheckBoxPreference
{

    private static final float DISABLED_ALPHA = 0.4F;
    private SettingsPreferenceFragment mFragment;
    private ImageView mSettingsButton;
    private Intent mSettingsIntent;
    private TextView mSummaryText;
    private TextView mTitleText;

    public CheckBoxAndSettingsPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        setLayoutResource(0x7f040068);
        setWidgetLayoutResource(0x7f040069);
    }

    private void enableSettingsButton()
    {
        if (mSettingsButton != null)
            if (mSettingsIntent == null)
            {
                mSettingsButton.setVisibility(8);
            } else
            {
                boolean flag = isChecked();
                mSettingsButton.setEnabled(flag);
                mSettingsButton.setClickable(flag);
                mSettingsButton.setFocusable(flag);
                if (!flag)
                    mSettingsButton.setAlpha(0.4F);
            }
        if (mTitleText != null)
            mTitleText.setEnabled(true);
        if (mSummaryText != null)
            mSummaryText.setEnabled(true);
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        view.findViewById(0x7f080103).setOnClickListener(new android.view.View.OnClickListener() {

            final CheckBoxAndSettingsPreference this$0;

            public void onClick(View view1)
            {
                onCheckBoxClicked();
            }

            
            {
                this$0 = CheckBoxAndSettingsPreference.this;
                super();
            }
        }
);
        mSettingsButton = (ImageView)view.findViewById(0x7f080104);
        mTitleText = (TextView)view.findViewById(0x1020016);
        mSummaryText = (TextView)view.findViewById(0x1020010);
        mSettingsButton.setOnClickListener(new android.view.View.OnClickListener() {

            final CheckBoxAndSettingsPreference this$0;

            public void onClick(View view1)
            {
                onSettingsButtonClicked();
            }

            
            {
                this$0 = CheckBoxAndSettingsPreference.this;
                super();
            }
        }
);
        enableSettingsButton();
    }

    protected void onCheckBoxClicked()
    {
        if (isChecked())
        {
            setChecked(false);
            return;
        } else
        {
            setChecked(true);
            return;
        }
    }

    protected void onSettingsButtonClicked()
    {
        if (mFragment != null && mSettingsIntent != null)
            mFragment.startActivity(mSettingsIntent);
    }

    public void setEnabled(boolean flag)
    {
        super.setEnabled(flag);
        enableSettingsButton();
    }

    public void setFragmentIntent(SettingsPreferenceFragment settingspreferencefragment, Intent intent)
    {
        mFragment = settingspreferencefragment;
        mSettingsIntent = intent;
    }
}
