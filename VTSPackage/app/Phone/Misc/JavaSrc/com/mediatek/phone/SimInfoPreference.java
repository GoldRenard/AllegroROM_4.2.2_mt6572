// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone;

import android.content.Context;
import android.preference.Preference;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;
import com.android.phone.PhoneGlobals;
import com.android.phone.PhoneInterfaceManager;

// Referenced classes of package com.mediatek.phone:
//            Utils

public class SimInfoPreference extends Preference
{

    private static final int DISPLAY_FIRST_FOUR = 1;
    private static final int DISPLAY_LAST_FOUR = 2;
    private static final int DISPLAY_NONE = 0;
    private static final String TAG = "SimInfoPreference";
    private boolean mChecked;
    private int mColor;
    private Context mContext;
    private String mName;
    private boolean mNeedCheckbox;
    private int mNumDisplayFormat;
    private String mSimNum;
    protected final int mSlotIndex;
    private int mStatus;

    public SimInfoPreference(Context context, String s, String s1, int i, int j, int k, int l, 
            long l1, boolean flag)
    {
        super(context, null);
        mChecked = true;
        mNeedCheckbox = true;
        mName = s;
        mSimNum = s1;
        mSlotIndex = i;
        mStatus = j;
        mColor = k;
        mNumDisplayFormat = l;
        mNeedCheckbox = flag;
        mContext = context;
        setKey(String.valueOf(l1));
        setLayoutResource(0x7f040034);
        displayNameAndNumber();
    }

    private void displayNameAndNumber()
    {
        if (mName != null)
            setTitle(mName);
        if (mSimNum != null && mSimNum.length() != 0)
        {
            setSummary(mSimNum);
            Log.i("SimInfoPreference", (new StringBuilder()).append("mSimNum is ").append(mSimNum).toString());
            return;
        } else
        {
            setSummary(null);
            Log.i("SimInfoPreference", "mSimNum is null");
            return;
        }
    }

    boolean getCheck()
    {
        return mChecked;
    }

    public View getView(View view, ViewGroup viewgroup)
    {
        View view1 = super.getView(view, viewgroup);
        displayNameAndNumber();
        ImageView imageview = (ImageView)view1.findViewById(0x7f0800cc);
        if (imageview != null)
        {
            int k = Utils.getStatusResource(mStatus);
            if (k == -1)
                imageview.setVisibility(8);
            else
                imageview.setImageResource(k);
        }
        int i = PhoneGlobals.getInstance().phoneMgr.get3GCapabilitySIM();
        Log.i("SimInfoPreference", (new StringBuilder()).append("mSlotIndex is: ").append(mSlotIndex).toString());
        Log.i("SimInfoPreference", (new StringBuilder()).append("simId is: ").append(i).toString());
        TextView textview = (TextView)view1.findViewById(0x7f0800df);
        if (textview != null && (i == -1 || i != mSlotIndex))
            textview.setVisibility(8);
        RelativeLayout relativelayout = (RelativeLayout)view1.findViewById(0x7f0800cb);
        if (relativelayout != null)
        {
            int j = Utils.getSimColorResource(mColor);
            if (j < 0)
                relativelayout.setBackgroundDrawable(null);
            else
                relativelayout.setBackgroundResource(j);
        }
        CheckBox checkbox = (CheckBox)view1.findViewById(0x7f0800e0);
        Log.i("SimInfoPreference", (new StringBuilder()).append("ckRadioOn.setChecked ").append(mChecked).toString());
        if (checkbox != null)
            if (mNeedCheckbox)
                checkbox.setChecked(mChecked);
            else
                checkbox.setVisibility(8);
        TextView textview1 = (TextView)view1.findViewById(0x7f0800cd);
        if (textview1 != null && mSimNum != null)
            switch (mNumDisplayFormat)
            {
            case 2: // '\002'
                if (mSimNum.length() >= 4)
                {
                    textview1.setText(mSimNum.substring(-4 + mSimNum.length()));
                    return view1;
                } else
                {
                    textview1.setText(mSimNum);
                    return view1;
                }

            case 1: // '\001'
                if (mSimNum.length() >= 4)
                {
                    textview1.setText(mSimNum.substring(0, 4));
                    return view1;
                } else
                {
                    textview1.setText(mSimNum);
                    return view1;
                }

            case 0: // '\0'
                textview1.setVisibility(8);
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

    public void updateInfo(String s, String s1, int i, int j)
    {
        mName = s;
        mSimNum = s1;
        mColor = i;
        mNumDisplayFormat = j;
        displayNameAndNumber();
    }
}
