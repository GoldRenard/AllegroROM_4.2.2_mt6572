// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.Dialog;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.preference.DialogPreference;
import android.provider.Telephony;
import android.util.AttributeSet;
import android.view.*;
import android.widget.*;
import com.mediatek.CellConnService.CellConnMgr;
import com.mediatek.xlog.Xlog;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.mediatek.settings:
//            SimItem

public class DefaultSimPreference extends DialogPreference
    implements android.widget.AdapterView.OnItemClickListener
{
    class SelectionListAdapter extends BaseAdapter
    {

        final DefaultSimPreference this$0;

        private void setImageSim(RelativeLayout relativelayout, SimItem simitem)
        {
            if (simitem.mIsSim)
            {
                int i = getSimColorResource(simitem.mSiminfo.mColor);
                if (i >= 0)
                {
                    relativelayout.setVisibility(0);
                    relativelayout.setBackgroundResource(i);
                }
                return;
            } else
            {
                relativelayout.setVisibility(8);
                return;
            }
        }

        private void setImageStatus(ImageView imageview, SimItem simitem)
        {
            int i;
label0:
            {
                if (simitem.mIsSim)
                {
                    i = getStatusResource(simitem.mState);
                    if (i != -1)
                        break label0;
                    imageview.setVisibility(8);
                }
                return;
            }
            imageview.setVisibility(0);
            imageview.setImageResource(i);
        }

        private void setNameAndNum(TextView textview, TextView textview1, SimItem simitem)
        {
            if (simitem.mSiminfo != null)
            {
                if (simitem.mSiminfo.mDisplayName != null)
                {
                    textview.setVisibility(0);
                    textview.setText(simitem.mSiminfo.mDisplayName);
                } else
                {
                    textview.setVisibility(8);
                }
            } else
            {
                textview.setVisibility(0);
                textview.setText(0x7f0d00a0);
            }
            if (simitem.mIsSim && simitem.mSiminfo.mNumber != null && simitem.mSiminfo.mNumber.length() != 0)
            {
                textview1.setVisibility(0);
                textview1.setText(simitem.mSiminfo.mNumber);
                return;
            } else
            {
                textview1.setVisibility(8);
                return;
            }
        }

        private void setTextNumFormat(TextView textview, SimItem simitem)
        {
            if (simitem.mIsSim && simitem.mSiminfo.mNumber != null)
                switch (simitem.mSiminfo.mDispalyNumberFormat)
                {
                case 2: // '\002'
                    textview.setVisibility(0);
                    if (simitem.mSiminfo.mNumber.length() >= 4)
                    {
                        textview.setText(simitem.mSiminfo.mNumber.substring(-4 + simitem.mSiminfo.mNumber.length()));
                        return;
                    } else
                    {
                        textview.setText(simitem.mSiminfo.mNumber);
                        return;
                    }

                case 1: // '\001'
                    textview.setVisibility(0);
                    if (simitem.mSiminfo.mNumber.length() >= 4)
                    {
                        textview.setText(simitem.mSiminfo.mNumber.substring(0, 4));
                        return;
                    } else
                    {
                        textview.setText(simitem.mSiminfo.mNumber);
                        return;
                    }

                case 0: // '\0'
                    textview.setVisibility(8);
                    return;
                }
        }

        private void setViewHolderId(ViewHolder viewholder, View view)
        {
            viewholder.mTextName = (TextView)view.findViewById(0x7f0800dc);
            viewholder.mTextNum = (TextView)view.findViewById(0x7f0800dd);
            viewholder.mImageStatus = (ImageView)view.findViewById(0x7f0800d9);
            viewholder.mTextNumFormat = (TextView)view.findViewById(0x7f0800da);
            viewholder.mCkRadioOn = (RadioButton)view.findViewById(0x7f0800de);
            viewholder.mImageSim = (RelativeLayout)view.findViewById(0x7f0800d8);
        }

        public int getCount()
        {
            return mSimItemList.size();
        }

        public Object getItem(int i)
        {
            return mSimItemList.get(i);
        }

        public long getItemId(int i)
        {
            return (long)i;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            ViewHolder viewholder;
            if (view == null)
            {
                view = mFlater.inflate(0x7f040033, null);
                viewholder = new ViewHolder();
                setViewHolderId(viewholder, view);
                view.setTag(viewholder);
            } else
            {
                viewholder = (ViewHolder)view.getTag();
            }
            SimItem simitem = (SimItem)getItem(i);
            setNameAndNum(viewholder.mTextName, viewholder.mTextNum, simitem);
            setImageSim(viewholder.mImageSim, simitem);
            setImageStatus(viewholder.mImageStatus, simitem);
            setTextNumFormat(viewholder.mTextNumFormat, simitem);
            RadioButton radiobutton = viewholder.mCkRadioOn;
            boolean flag;
            if (mSelected == i)
                flag = true;
            else
                flag = false;
            radiobutton.setChecked(flag);
            Xlog.d("DefaultSimPreference", (new StringBuilder()).append("DefaultSiminfo simItem.mState=").append(simitem.mState).toString());
            if (simitem.mState == 1)
            {
                view.setEnabled(false);
                viewholder.mTextName.setEnabled(false);
                viewholder.mTextNum.setEnabled(false);
                viewholder.mCkRadioOn.setEnabled(false);
                return view;
            } else
            {
                view.setEnabled(true);
                viewholder.mTextName.setEnabled(true);
                viewholder.mTextNum.setEnabled(true);
                viewholder.mCkRadioOn.setEnabled(true);
                return view;
            }
        }

        SelectionListAdapter()
        {
            this$0 = DefaultSimPreference.this;
            super();
        }
    }

    class SelectionListAdapter.ViewHolder
    {

        RadioButton mCkRadioOn;
        RelativeLayout mImageSim;
        ImageView mImageStatus;
        TextView mTextName;
        TextView mTextNum;
        TextView mTextNumFormat;
        final SelectionListAdapter this$1;

        SelectionListAdapter.ViewHolder()
        {
            this$1 = SelectionListAdapter.this;
            super();
        }
    }


    private static final int DISPLAY_FIRST_FOUR = 1;
    private static final int DISPLAY_LAST_FOUR = 2;
    private static final int DISPLAY_NONE = 0;
    private static final int PIN1_REQUEST_CODE = 302;
    private static final String TAG = "DefaultSimPreference";
    private SelectionListAdapter mAdapter;
    private CellConnMgr mCellConnMgr;
    private Context mContext;
    private LayoutInflater mFlater;
    private Drawable mIcon;
    private int mInitValue;
    private ListView mListView;
    private int mSelected;
    private List mSimItemList;
    private String mValue;

    public DefaultSimPreference(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public DefaultSimPreference(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mSelected = -1;
        mInitValue = -1;
        mContext = context;
        mFlater = LayoutInflater.from(context);
    }

    private int getSimColorResource(int i)
    {
        if (i >= 0 && i <= 4)
            return Telephony.SIMBackgroundDarkRes[i];
        else
            return -1;
    }

    private int getStatusResource(int i)
    {
        switch (i)
        {
        case 8: // '\b'
            return 0x2020118;

        case 7: // '\007'
            return 0x20200ef;

        case 6: // '\006'
            return 0x2020117;

        case 4: // '\004'
            return 0x2020119;

        case 3: // '\003'
            return 0x20200f8;

        case 2: // '\002'
            return 0x20200ff;

        case 1: // '\001'
            return 0x2020112;

        case 5: // '\005'
        default:
            return -1;
        }
    }

    private void updateData()
    {
        int i = 0;
        for (Iterator iterator = mSimItemList.iterator(); iterator.hasNext(); i++)
        {
            SimItem simitem = (SimItem)iterator.next();
            if (!simitem.mIsSim)
                continue;
            android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(mContext, simitem.mSiminfo.mSimId);
            if (siminfo != null)
            {
                SimItem simitem1 = new SimItem(siminfo);
                mSimItemList.set(i, simitem1);
            }
        }

    }

    long getValue()
    {
        return ((SimItem)mSimItemList.get(mSelected)).mSiminfo.mSimId;
    }

    public void onBindView(View view)
    {
        super.onBindView(view);
        TextView textview = (TextView)view.findViewById(0x1020010);
        if (textview != null)
        {
            textview.setSingleLine();
            textview.setEllipsize(android.text.TextUtils.TruncateAt.MIDDLE);
        }
        Xlog.i("DefaultSimPreference", (new StringBuilder()).append("summary is +").append(getSummary()).toString());
    }

    protected void onDialogClosed(boolean flag)
    {
        super.onDialogClosed(flag);
        Xlog.i("DefaultSimPreference", (new StringBuilder()).append("onDialogClosed---mSelected = ").append(mSelected).toString());
        Xlog.i("DefaultSimPreference", (new StringBuilder()).append("onDialogClosed---mInitValue = ").append(mInitValue).toString());
        if (flag && mSelected >= 0 && mSelected != mInitValue)
        {
            Xlog.i("DefaultSimPreference", "callChangeListener");
            long l;
            if (((SimItem)mSimItemList.get(mSelected)).mSiminfo != null)
                l = ((SimItem)mSimItemList.get(mSelected)).mSiminfo.mSimId;
            else
                l = 0L;
            callChangeListener(Long.valueOf(l));
            mInitValue = mSelected;
        }
    }

    public void onItemClick(AdapterView adapterview, View view, int i, long l)
    {
        Xlog.i("DefaultSimPreference", (new StringBuilder()).append("positon is ").append(i).toString());
        if (view != null && view.isEnabled())
        {
            SimItem simitem = (SimItem)mSimItemList.get(i);
            if (simitem.mIsSim && mCellConnMgr != null && simitem.mState == 2)
            {
                mCellConnMgr.handleCellConn(simitem.mSiminfo.mSlot, 302);
                return;
            } else
            {
                mSelected = i;
                onClick(getDialog(), -1);
                getDialog().dismiss();
                return;
            }
        } else
        {
            return;
        }
    }

    protected void onPrepareDialogBuilder(android.app.AlertDialog.Builder builder)
    {
        Xlog.i("DefaultSimPreference", "onPrepareDialogBuilder");
        if (mSimItemList != null)
        {
            mAdapter = new SelectionListAdapter();
            mListView = new ListView(mContext);
            mListView.setAdapter(mAdapter);
            mListView.setOnItemClickListener(this);
            mListView.setItemsCanFocus(false);
            builder.setView(mListView, 0, 0, 0, 0);
            builder.setNegativeButton(0x1040000, null);
        }
        super.onPrepareDialogBuilder(builder);
    }

    public void setCellConnMgr(CellConnMgr cellconnmgr)
    {
        mCellConnMgr = cellconnmgr;
    }

    public void setInitData(List list)
    {
        Xlog.d("DefaultSimPreference", "setInitData()");
        mSimItemList = list;
        if (mAdapter != null)
        {
            Xlog.d("DefaultSimPreference", "setInitData()+mAdapter!=null");
            mAdapter.notifyDataSetChanged();
        }
    }

    public void setInitValue(int i)
    {
        mInitValue = i;
        mSelected = i;
    }





}
