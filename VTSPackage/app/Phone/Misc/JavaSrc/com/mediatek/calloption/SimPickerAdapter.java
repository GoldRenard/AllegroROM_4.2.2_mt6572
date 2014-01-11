// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;

import android.accounts.Account;
import android.content.Context;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.provider.Telephony;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;
import com.android.internal.telephony.ITelephony;
import java.util.List;

public abstract class SimPickerAdapter extends BaseAdapter
{
    public static class ItemHolder
    {

        public Object mData;
        public int mType;

        public ItemHolder(Object obj, int i)
        {
            mData = obj;
            mType = i;
        }
    }

    public class ViewHolder
    {

        public TextView mDisplayName;
        public ImageView mInternetIcon;
        public TextView mPhoneNumber;
        public RadioButton mRadioButton;
        public TextView mShortPhoneNumber;
        public View mSimIcon;
        public TextView mSimSignal;
        public ImageView mSimStatus;
        public ImageView mSuggested;
        public TextView mText;
        final SimPickerAdapter this$0;

        public ViewHolder()
        {
            this$0 = SimPickerAdapter.this;
            super();
        }
    }


    public static final int ITEM_TYPE_ACCOUNT = 3;
    public static final int ITEM_TYPE_INTERNET = 1;
    public static final int ITEM_TYPE_SIM = 0;
    public static final int ITEM_TYPE_TEXT = 2;
    public static final int ITEM_TYPE_UNKNOWN = -1;
    private static final int NUMBER_LENGTH_MINUS = 4;
    private static final int VIEW_TYPE_COUNT = 4;
    protected Context mContext;
    protected boolean mIsMultiSim;
    protected List mItems;
    protected long mSuggestedSimId;

    public SimPickerAdapter(Context context, long l, boolean flag)
    {
        mContext = context;
        mSuggestedSimId = l;
        mIsMultiSim = flag;
    }

    protected abstract View createView(ViewHolder viewholder, int i);

    public int getCount()
    {
        return mItems.size();
    }

    public Object getItem(int i)
    {
        ItemHolder itemholder = (ItemHolder)mItems.get(i);
        if (itemholder.mType == 0)
            return Integer.valueOf(((android.provider.Telephony.SIMInfo)itemholder.mData).mSlot);
        if (itemholder.mType == 1)
            return Integer.valueOf(-2);
        if (itemholder.mType != 2 && itemholder.mType != 3)
            return null;
        else
            return itemholder.mData;
    }

    public long getItemId(int i)
    {
        return 0L;
    }

    public int getItemViewType(int i)
    {
        return ((ItemHolder)mItems.get(i)).mType;
    }

    protected int getSimStatusIcon(int i)
    {
        ITelephony itelephony;
        int j;
        itelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        if (itelephony == null)
            return 0;
        j = -1;
        if (!mIsMultiSim) goto _L2; else goto _L1
_L1:
        j = itelephony.getSimIndicatorStateGemini(i);
          goto _L3
_L2:
        int k = itelephony.getSimIndicatorState();
        j = k;
          goto _L3
        RemoteException remoteexception;
        remoteexception;
        remoteexception.printStackTrace();
          goto _L3
_L17:
        return 0x20200ff;
_L15:
        return 0x2020117;
_L13:
        return 0x2020119;
_L7:
        return 0x20200f8;
_L10:
        return 0x20200ef;
_L11:
        return 0x2020118;
_L3:
        j;
        JVM INSTR tableswitch 1 8: default 124
    //                   1 126
    //                   2 59
    //                   3 68
    //                   4 65
    //                   5 124
    //                   6 62
    //                   7 71
    //                   8 74;
           goto _L4 _L5 _L6 _L7 _L8 _L4 _L9 _L10 _L11
_L8:
        continue; /* Loop/switch isn't completed */
_L6:
        continue; /* Loop/switch isn't completed */
_L9:
        break; /* Loop/switch isn't completed */
_L5:
        break; /* Loop/switch isn't completed */
_L4:
        return 0;
        if (true) goto _L13; else goto _L12
_L12:
        return 0x2020112;
          goto _L13
        if (true) goto _L15; else goto _L14
_L14:
        if (true) goto _L17; else goto _L16
_L16:
    }

    public View getView(int i, View view, ViewGroup viewgroup)
    {
        View view1 = view;
        int j = getItemViewType(i);
        if (view1 == null)
        {
            ViewHolder viewholder1 = new ViewHolder();
            view1 = createView(viewholder1, j);
            view1.setTag(viewholder1);
        }
        ViewHolder viewholder = (ViewHolder)view1.getTag();
        if (j == 0)
        {
            android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)((ItemHolder)mItems.get(i)).mData;
            viewholder.mDisplayName.setText(siminfo.mDisplayName);
            viewholder.mSimIcon.setBackgroundResource(Telephony.SIMBackgroundDarkRes[siminfo.mColor]);
            if (siminfo.mSimId == mSuggestedSimId)
                viewholder.mSuggested.setVisibility(0);
            else
                viewholder.mSuggested.setVisibility(8);
            String s1 = "";
            if (!TextUtils.isEmpty(siminfo.mNumber))
            {
                switch (siminfo.mDispalyNumberFormat)
                {
                default:
                    break;

                case 0: // '\0'
                    s1 = "";
                    break;

                case 2: // '\002'
                    if (siminfo.mNumber.length() <= 4)
                        s1 = siminfo.mNumber;
                    else
                        s1 = siminfo.mNumber.substring(-4 + siminfo.mNumber.length(), siminfo.mNumber.length());
                    break;

                case 1: // '\001'
                    if (siminfo.mNumber.length() <= 4)
                        s1 = siminfo.mNumber;
                    else
                        s1 = siminfo.mNumber.substring(0, 4);
                    break;
                }
                viewholder.mPhoneNumber.setText(siminfo.mNumber);
                viewholder.mPhoneNumber.setVisibility(0);
            } else
            {
                viewholder.mPhoneNumber.setVisibility(8);
            }
            viewholder.mShortPhoneNumber.setText(s1);
            viewholder.mSimSignal.setVisibility(4);
            viewholder.mSimStatus.setImageResource(getSimStatusIcon(siminfo.mSlot));
        } else
        {
            if (j == 1)
            {
                viewholder.mInternetIcon.setBackgroundResource(0x20200e6);
                return view1;
            }
            if (j == 2)
            {
                String s = (String)((ItemHolder)mItems.get(i)).mData;
                viewholder.mText.setText(s);
                return view1;
            }
            if (j == 3)
            {
                Account account = (Account)((ItemHolder)mItems.get(i)).mData;
                viewholder.mText.setText(account.name);
                return view1;
            }
        }
        return view1;
    }

    public int getViewTypeCount()
    {
        return 4;
    }

    public void setItems(List list)
    {
        mItems = list;
    }
}
