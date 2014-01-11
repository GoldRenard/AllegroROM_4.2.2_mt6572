// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.toolbar;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.*;
import com.android.systemui.statusbar.policy.TelephonyIcons;
import com.android.systemui.statusbar.util.SIMHelper;
import com.mediatek.xlog.Xlog;

public class SimIconView extends LinearLayout
{

    private static final String TAG = "SimIconView";
    private ImageView mOnIndicator;
    private boolean mSelected;
    private int mSelectedIconColor;
    private int mSimBackground;
    private ImageView mSimIcon;
    private TextView mSimName;
    private TextView mSimOpName;
    private ImageView mSimStateView;
    private TextView mSimType;
    private int mSlotId;

    public SimIconView(Context context)
    {
        this(context, null);
    }

    public SimIconView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mSelectedIconColor = 0;
        mSimBackground = 0;
        mSlotId = -1;
        mSelected = false;
    }

    private String getFormatedNumber(String s, int i)
    {
        switch (i)
        {
        case 0: // '\0'
            return "";

        case 2: // '\002'
            if (s.length() > 4)
                return s.substring(-4 + s.length(), s.length());
            break;

        case 1: // '\001'
            if (s.length() > 4)
                return s.substring(0, 4);
            break;

        default:
            s = "";
            break;
        }
        return s;
    }

    public TextView getOpName()
    {
        return mSimOpName;
    }

    public ImageView getSimIcon()
    {
        return mSimIcon;
    }

    public int getSlotId()
    {
        return mSlotId;
    }

    public boolean isSelected()
    {
        return mSelected;
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        mSimIcon = (ImageView)findViewById(0x7f080123);
        mSimName = (TextView)findViewById(0x7f080125);
        mSimType = (TextView)findViewById(0x7f08011c);
        mSimStateView = (ImageView)findViewById(0x7f080124);
        mSimOpName = (TextView)findViewById(0x7f08011e);
        mOnIndicator = (ImageView)findViewById(0x7f08009e);
    }

    public void set3GIconVisibility(boolean flag)
    {
        TextView textview = mSimType;
        byte byte0;
        if (flag)
            byte0 = 0;
        else
            byte0 = 8;
        textview.setVisibility(byte0);
    }

    public void setOpName(int i)
    {
        mSimOpName.setText(i);
    }

    public void setSelected(boolean flag)
    {
        mSelected = flag;
        if (flag && mSelectedIconColor >= 0 && mSelectedIconColor < TelephonyIcons.SIM_INDICATOR_BACKGROUND.length)
        {
            if (mSelectedIconColor > 3)
                mSimIcon.setBackgroundResource(TelephonyIcons.SIM_INDICATOR_BACKGROUND[mSelectedIconColor]);
            else
            if (mSelectedIconColor <= 3 && mSelectedIconColor >= 0)
                mOnIndicator.setImageResource(TelephonyIcons.SIM_INDICATOR_BACKGROUND[mSelectedIconColor]);
            mOnIndicator.setVisibility(0);
            return;
        } else
        {
            mSimIcon.setBackgroundResource(mSimBackground);
            mOnIndicator.setVisibility(8);
            return;
        }
    }

    public void setSimColor(int i)
    {
        mSelectedIconColor = i;
    }

    public void setSimIconViewResource(int i)
    {
        mSimBackground = i;
        setSelected(mSelected);
    }

    public void setSlotId(int i)
    {
        mSlotId = i;
    }

    public void updateSimIcon(com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord)
    {
        Xlog.d("SimIconView", (new StringBuilder()).append("updateSimIcon called, simName is ").append(siminforecord.mDisplayName).append(", simNumber is ").append(siminforecord.mNumber).toString());
        if (siminforecord.mNumber != null && !siminforecord.mNumber.isEmpty())
            mSimName.setText(getFormatedNumber(siminforecord.mNumber, siminforecord.mDispalyNumberFormat));
        else
            mSimName.setText("");
        mSimBackground = siminforecord.mSimBackgroundDarkRes;
        setSelected(mSelected);
        mSimOpName.setText(siminforecord.mDisplayName);
        int i = siminforecord.mSimSlotId;
        int j = SIMHelper.getSimIndicatorStateGemini(i);
        Xlog.d("SimIconView", (new StringBuilder()).append("updateSimIcon called, simState is ").append(j).append(", slotId is ").append(i).toString());
        updateSimState(j);
    }

    public void updateSimState(int i)
    {
        int j = SIMHelper.getSIMStateIcon(i);
        if (j > -1)
            mSimStateView.setImageResource(j);
    }
}
