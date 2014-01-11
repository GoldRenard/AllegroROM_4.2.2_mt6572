// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.content.Context;
import android.view.*;
import android.widget.*;
import java.util.ArrayList;

// Referenced classes of package com.mediatek.settings:
//            CallRejectListItem

public class CallRejectListAdapter extends BaseAdapter
{
    public static interface CheckSelectCallBack
    {

        public abstract void setChecked(boolean flag);
    }

    static class ItemViewHolder
    {

        CheckBox mCheckBox;
        int mId;
        TextView mName;
        TextView mPhoneNum;

    }


    private static final String TAG = "CallRejectListAdapter";
    private CheckSelectCallBack mCheckSelectCallBack;
    private Context mContext;
    private ArrayList mDataList;
    private LayoutInflater mInflater;

    public CallRejectListAdapter(Context context, ArrayList arraylist)
    {
        mCheckSelectCallBack = null;
        mContext = context;
        mDataList = arraylist;
        mInflater = (LayoutInflater)mContext.getSystemService("layout_inflater");
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
            return (CallRejectListItem)mDataList.get(i);
        else
            return null;
    }

    public long getItemId(int i)
    {
        return 0L;
    }

    public View getView(int i, View view, ViewGroup viewgroup)
    {
        final ItemViewHolder holder;
        if (view == null)
        {
            holder = new ItemViewHolder();
            view = mInflater.inflate(0x7f040006, null);
            holder.mName = (TextView)view.findViewById(0x7f080016);
            holder.mCheckBox = (CheckBox)view.findViewById(0x7f080015);
            holder.mId = i;
            holder.mCheckBox.setOnCheckedChangeListener(new android.widget.CompoundButton.OnCheckedChangeListener() {

                final CallRejectListAdapter this$0;
                final ItemViewHolder val$holder;

                public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
                {
                    ((CallRejectListItem)mDataList.get(holder.mId)).setIsChecked(flag);
                    mCheckSelectCallBack.setChecked(flag);
                }

            
            {
                this$0 = CallRejectListAdapter.this;
                holder = itemviewholder;
                super();
            }
            }
);
            holder.mPhoneNum = (TextView)view.findViewById(0x7f080017);
            view.setTag(holder);
        } else
        {
            holder = (ItemViewHolder)view.getTag();
            holder.mId = i;
        }
        if (holder.mName != null)
            holder.mName.setText(((CallRejectListItem)mDataList.get(i)).getName());
        if (holder.mCheckBox != null)
            holder.mCheckBox.setChecked(((CallRejectListItem)mDataList.get(i)).getIsChecked());
        if (holder.mPhoneNum != null)
            holder.mPhoneNum.setText(((CallRejectListItem)mDataList.get(i)).getPhoneNum());
        return view;
    }

    public void setCheckSelectCallBack(CheckSelectCallBack checkselectcallback)
    {
        mCheckSelectCallBack = checkselectcallback;
    }


}
