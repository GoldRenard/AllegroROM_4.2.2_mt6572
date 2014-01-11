// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import android.view.*;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.android.internal.telephony.*;
import com.mediatek.phone.gemini.GeminiUtils;
import java.util.List;

public class CallPickerAdapter extends BaseAdapter
{
    private class ViewHolder
    {

        TextView mDisplayName;
        TextView mOperator;
        TextView mPhoneNumber;
        final CallPickerAdapter this$0;

        private ViewHolder()
        {
            this$0 = CallPickerAdapter.this;
            super();
        }

    }


    Context mContext;
    private String mFirstCallerInfoName;
    private int mFirstSimColor;
    List mItems;
    private String mOperatorNameFirstCall;
    private String mOperatorNameSecondCall;
    private String mSecondCallerInfoName;
    private int mSecondSimColor;
    private int mSimDarkBorderMap[] = {
        0x7f02009d, 0x7f0200a0, 0x7f02009e, 0x7f0200a1
    };
    private int mSimIndicatorPaddingLeft;
    private int mSimIndicatorPaddingRight;

    public CallPickerAdapter(Context context, List list)
    {
        mContext = context;
        mItems = list;
        mSimIndicatorPaddingLeft = mContext.getResources().getDimensionPixelSize(0x7f0c0022);
        mSimIndicatorPaddingRight = mContext.getResources().getDimensionPixelSize(0x7f0c0023);
    }

    private String tripHyphen(String s)
    {
        if (TextUtils.isEmpty(s))
            return s;
        StringBuilder stringbuilder = new StringBuilder();
        for (int i = 0; i < s.length(); i++)
        {
            char c = s.charAt(i);
            if (c != '-' && c != ' ')
                stringbuilder.append(c);
        }

        return stringbuilder.toString();
    }

    private void updateCallOperatorBackground(Call call, TextView textview, int i)
    {
label0:
        {
            if (GeminiUtils.isGeminiSupport())
            {
                if (3 == call.getPhone().getPhoneType())
                {
                    if (textview != null && textview.getVisibility() == 0)
                        textview.setBackgroundResource(0x7f02009f);
                } else
                {
                    if (mSimDarkBorderMap == null || i < 0 || i >= mSimDarkBorderMap.length)
                        break label0;
                    if (textview != null && textview.getVisibility() == 0)
                        textview.setBackgroundResource(mSimDarkBorderMap[i]);
                }
            } else
            if (textview != null && textview.getVisibility() == 0)
                textview.setBackgroundResource(0x7f0200a1);
            if (textview != null && textview.getVisibility() == 0)
                textview.setPadding(mSimIndicatorPaddingLeft, 0, mSimIndicatorPaddingRight, 0);
        }
    }

    public String getCallerInfoName(int i)
    {
        if (i == 0)
            return mFirstCallerInfoName;
        else
            return mSecondCallerInfoName;
    }

    public int getCount()
    {
        return mItems.size();
    }

    public Object getItem(int i)
    {
        return mItems.get(i);
    }

    public long getItemId(int i)
    {
        return 0L;
    }

    public int getOperatorColor(int i)
    {
        if (i == 0)
            return mFirstSimColor;
        else
            return mSecondSimColor;
    }

    public String getOperatorName(int i)
    {
        if (i == 0)
            return mOperatorNameFirstCall;
        else
            return mOperatorNameSecondCall;
    }

    public View getView(int i, View view, ViewGroup viewgroup)
    {
        View view1 = view;
        if (view1 == null)
        {
            LayoutInflater layoutinflater = LayoutInflater.from(mContext);
            ViewHolder viewholder1 = new ViewHolder();
            view1 = layoutinflater.inflate(0x7f040009, null);
            viewholder1.mDisplayName = (TextView)view1.findViewById(0x7f08001b);
            viewholder1.mOperator = (TextView)view1.findViewById(0x7f08001a);
            viewholder1.mPhoneNumber = (TextView)view1.findViewById(0x7f08001c);
            view1.setTag(viewholder1);
        }
        ViewHolder viewholder = (ViewHolder)view1.getTag();
        Call call = (Call)mItems.get(i);
        String s = getOperatorName(i);
        String s1 = getCallerInfoName(i);
        String s2 = null;
        if (call != null)
        {
            Connection connection = call.getLatestConnection();
            s2 = null;
            if (connection != null)
                s2 = call.getLatestConnection().getAddress();
        }
        if (s2 != null && s1 != null && tripHyphen(s1).equals(s2))
        {
            viewholder.mDisplayName.setText(s1);
            viewholder.mPhoneNumber.setVisibility(8);
        } else
        {
            if (s1 != null)
                viewholder.mDisplayName.setText(s1);
            if (s2 != null)
            {
                viewholder.mPhoneNumber.setVisibility(0);
                viewholder.mPhoneNumber.setText(s2);
            }
        }
        if (s != null)
        {
            updateCallOperatorBackground(call, viewholder.mOperator, getOperatorColor(i));
            viewholder.mOperator.setText(s);
        }
        return view1;
    }

    public void setCallerInfoName(String s, String s1)
    {
        mFirstCallerInfoName = s;
        mSecondCallerInfoName = s1;
    }

    public void setOperatorColor(int i, int j)
    {
        mFirstSimColor = i;
        mSecondSimColor = j;
    }

    public void setOperatorName(String s, String s1)
    {
        mOperatorNameFirstCall = s;
        mOperatorNameSecondCall = s1;
    }
}
