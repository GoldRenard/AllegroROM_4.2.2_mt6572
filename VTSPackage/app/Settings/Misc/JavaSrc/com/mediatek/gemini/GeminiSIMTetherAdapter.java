// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.gemini;

import android.content.Context;
import android.content.res.Resources;
import android.provider.Telephony;
import android.view.*;
import android.widget.*;
import java.util.ArrayList;

// Referenced classes of package com.mediatek.gemini:
//            GeminiSIMTetherItem

public class GeminiSIMTetherAdapter extends BaseAdapter
{
    static class ItemViewHolder
    {

        CheckBox mCheckBox;
        TextView mName;
        TextView mPhoneNum;
        TextView mPhoneNumType;
        TextView mSimInfo;
        LinearLayout mSimInfoLayout;

    }


    private static final int BGCOLOR_SIM_ABSENT = 10;
    public static final int FLAG_CHECKBOX_STSTUS_CHECKED = 1;
    public static final int FLAG_CHECKBOX_STSTUS_NONE = -1;
    public static final int FLAG_CHECKBOX_STSTUS_UNCHECKED = 0;
    public static final int FLAG_SIM_STATUS_1 = 1;
    public static final int FLAG_SIM_STATUS_2 = 2;
    private static final int MAX_COLORSIZE = 7;
    private static final String TAG = "GeminiSIMTetherAdapter";
    private Context mContext;
    private ArrayList mDataList;
    private LayoutInflater mInflater;
    private boolean mIsShowCheckBox;
    private GeminiSIMTetherItem mItem;
    private int mSIMCardNamePadding;

    public GeminiSIMTetherAdapter(Context context, ArrayList arraylist, boolean flag)
    {
        mIsShowCheckBox = false;
        mContext = context;
        mDataList = arraylist;
        mIsShowCheckBox = flag;
        mInflater = (LayoutInflater)mContext.getSystemService("layout_inflater");
        mSIMCardNamePadding = context.getResources().getDimensionPixelSize(0x20d001b);
    }

    public int getCount()
    {
        if (mDataList != null)
            return mDataList.size();
        else
            return 0;
    }

    public Object getItem(int i)
    {
        if (mDataList != null)
            return (GeminiSIMTetherItem)mDataList.get(i);
        else
            return null;
    }

    public long getItemId(int i)
    {
        return 0L;
    }

    public View getView(int i, View view, ViewGroup viewgroup)
    {
        ItemViewHolder itemviewholder;
        if (view == null)
        {
            itemviewholder = new ItemViewHolder();
            view = mInflater.inflate(0x7f04003a, null);
            itemviewholder.mName = (TextView)view.findViewById(0x7f080085);
            itemviewholder.mCheckBox = (CheckBox)view.findViewById(0x7f080084);
            itemviewholder.mPhoneNum = (TextView)view.findViewById(0x7f080087);
            itemviewholder.mSimInfoLayout = (LinearLayout)view.findViewById(0x7f080088);
            itemviewholder.mSimInfo = (TextView)view.findViewById(0x7f080089);
            itemviewholder.mPhoneNumType = (TextView)view.findViewById(0x7f080086);
            view.setTag(itemviewholder);
        } else
        {
            itemviewholder = (ItemViewHolder)view.getTag();
        }
        mItem = (GeminiSIMTetherItem)mDataList.get(i);
        String s = ((GeminiSIMTetherItem)mDataList.get(i)).getSimName();
        int j = ((GeminiSIMTetherItem)mDataList.get(i)).getSimColor();
        if (mItem != null && itemviewholder != null)
        {
            itemviewholder.mName.setText(mItem.getName());
            itemviewholder.mPhoneNumType.setText(mItem.getPhoneNumType());
            itemviewholder.mPhoneNum.setText(mItem.getPhoneNum());
            if (s != null && !s.equals(""))
            {
                itemviewholder.mSimInfoLayout.setVisibility(0);
                itemviewholder.mSimInfo.setVisibility(0);
                itemviewholder.mSimInfo.setText(s);
            } else
            {
                itemviewholder.mSimInfo.setVisibility(8);
                itemviewholder.mSimInfoLayout.setVisibility(8);
            }
            int k = ((GeminiSIMTetherItem)mDataList.get(i)).getCheckedStatus();
            if (mIsShowCheckBox)
            {
                itemviewholder.mCheckBox.setVisibility(0);
                CheckBox checkbox = itemviewholder.mCheckBox;
                boolean flag;
                if (k == 1)
                    flag = true;
                else
                    flag = false;
                checkbox.setChecked(flag);
            } else
            {
                itemviewholder.mCheckBox.setVisibility(8);
            }
            if (j >= 0 && j <= 7)
            {
                itemviewholder.mSimInfo.setBackgroundResource(Telephony.SIMBackgroundDarkRes[j]);
                itemviewholder.mSimInfo.setPadding(mSIMCardNamePadding, 0, mSIMCardNamePadding, 0);
            } else
            if (j == 10)
            {
                itemviewholder.mSimInfo.setBackgroundResource(0x20200e3);
                itemviewholder.mSimInfo.setPadding(mSIMCardNamePadding, 0, mSIMCardNamePadding, 0);
                return view;
            }
        }
        return view;
    }

    public void setShowCheckBox(boolean flag)
    {
        mIsShowCheckBox = flag;
        notifyDataSetChanged();
    }
}
