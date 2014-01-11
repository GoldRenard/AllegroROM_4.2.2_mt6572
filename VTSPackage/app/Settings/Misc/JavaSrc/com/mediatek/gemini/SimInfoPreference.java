// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.gemini;

import android.content.Context;
import android.preference.Preference;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.gemini:
//            GeminiUtils

public class SimInfoPreference extends Preference
{

    private static final int DISPLAY_FIRST_FOUR = 1;
    private static final int DISPLAY_LAST_FOUR = 2;
    private static final int DISPLAY_NONE = 0;
    private static final int NUMFORMAT = 4;
    private static final String TAG = "SimInfoPreference";
    private boolean mChecked;
    private int mColor;
    private Context mContext;
    private String mName;
    private boolean mNeedCheckbox;
    private boolean mNeedStatus;
    private int mNumDisplayFormat;
    private String mSimNum;
    protected final int mSlotIndex;
    private int mStatus;
    private boolean mUseCheckBox;

    public SimInfoPreference(Context context, String s, String s1, int i, int j, int k, int l, 
            long l1, boolean flag)
    {
        this(context, s, s1, i, j, k, l, l1, flag, true);
    }

    public SimInfoPreference(Context context, String s, String s1, int i, int j, int k, int l, 
            long l1, boolean flag, boolean flag1)
    {
        super(context, null);
        mChecked = true;
        mNeedCheckbox = true;
        mNeedStatus = true;
        mUseCheckBox = false;
        mName = s;
        mSimNum = s1;
        mSlotIndex = i;
        mStatus = j;
        mColor = k;
        mNumDisplayFormat = l;
        mNeedCheckbox = flag;
        mNeedStatus = flag1;
        mContext = context;
        setKey(String.valueOf(l1));
        setLayoutResource(0x7f040072);
        if (mName != null)
            setTitle(mName);
        if (mSimNum != null && mSimNum.length() != 0)
            setSummary(mSimNum);
    }

    public SimInfoPreference(Context context, String s, String s1, int i, int j, int k, int l, 
            long l1, boolean flag, boolean flag1, boolean flag2)
    {
        super(context, null);
        mChecked = true;
        mNeedCheckbox = true;
        mNeedStatus = true;
        mUseCheckBox = false;
        mName = s;
        mSimNum = s1;
        mSlotIndex = i;
        mStatus = j;
        mColor = k;
        mNumDisplayFormat = l;
        mNeedCheckbox = flag;
        mNeedStatus = flag1;
        mContext = context;
        mUseCheckBox = flag2;
        setKey(String.valueOf(l1));
        setLayoutResource(0x7f040073);
        if (mName != null)
            setTitle(mName);
        if (mSimNum != null && mSimNum.length() != 0)
            setSummary(mSimNum);
    }

    boolean getCheck()
    {
        return mChecked;
    }

    public View getView(View view, ViewGroup viewgroup)
    {
        View view1 = super.getView(view, viewgroup);
        TextView textview = (TextView)view1.findViewById(0x1020016);
        if (textview != null && mName != null)
            textview.setText(mName);
        TextView textview1 = (TextView)view1.findViewById(0x1020010);
        if (textview1 != null)
            if (mSimNum != null && mSimNum.length() != 0)
            {
                if (!textview1.isShown())
                    textview1.setVisibility(0);
                textview1.setText(mSimNum);
            } else
            {
                textview1.setVisibility(8);
            }
        ImageView imageview = (ImageView)view1.findViewById(0x7f080119);
        if (imageview != null)
            if (mNeedStatus)
            {
                int j = GeminiUtils.getStatusResource(mStatus);
                if (j == -1)
                    imageview.setVisibility(8);
                else
                    imageview.setImageResource(j);
            } else
            {
                imageview.setVisibility(8);
            }
        RelativeLayout relativelayout = (RelativeLayout)view1.findViewById(0x7f080118);
        if (relativelayout != null)
        {
            int i = GeminiUtils.getSimColorResource(mColor);
            if (i < 0)
                relativelayout.setBackgroundDrawable(null);
            else
                relativelayout.setBackgroundResource(i);
        }
        Xlog.i("SimInfoPreference", (new StringBuilder()).append("mUseCheckBox=").append(mUseCheckBox).append(" mChecked=").append(mChecked).toString());
        if (!mUseCheckBox)
        {
            Switch switch1 = (Switch)view1.findViewById(0x7f08011c);
            if (switch1 != null)
                if (mNeedCheckbox)
                    switch1.setChecked(mChecked);
                else
                    switch1.setVisibility(8);
        } else
        {
            CheckBox checkbox = (CheckBox)view1.findViewById(0x7f08011c);
            if (checkbox != null)
                if (mNeedCheckbox)
                    checkbox.setChecked(mChecked);
                else
                    checkbox.setVisibility(8);
        }
        TextView textview2 = (TextView)view1.findViewById(0x7f08011a);
        if (textview1 != null && mSimNum != null)
            switch (mNumDisplayFormat)
            {
            case 2: // '\002'
                if (mSimNum.length() >= 4)
                {
                    textview2.setText(mSimNum.substring(-4 + mSimNum.length()));
                    return view1;
                } else
                {
                    textview2.setText(mSimNum);
                    return view1;
                }

            case 1: // '\001'
                if (mSimNum.length() >= 4)
                {
                    textview2.setText(mSimNum.substring(0, 4));
                    return view1;
                } else
                {
                    textview2.setText(mSimNum);
                    return view1;
                }

            case 0: // '\0'
                textview2.setVisibility(8);
                return view1;
            }
        return view1;
    }

    void setCheck(boolean flag)
    {
        mChecked = flag;
        notifyChanged();
    }

    void setColor(int i)
    {
        mColor = i;
        notifyChanged();
    }

    void setName(String s)
    {
        mName = s;
        notifyChanged();
    }

    public void setNeedCheckBox(boolean flag)
    {
        mNeedCheckbox = flag;
        notifyChanged();
    }

    void setNumDisplayFormat(int i)
    {
        mNumDisplayFormat = i;
        notifyChanged();
    }

    void setNumber(String s)
    {
        mSimNum = s;
        notifyChanged();
    }

    void setStatus(int i)
    {
        mStatus = i;
        notifyChanged();
    }
}
