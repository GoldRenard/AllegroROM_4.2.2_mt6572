// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.gemini;

import android.app.Dialog;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.view.*;
import android.widget.*;
import com.mediatek.CellConnService.CellConnMgr;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.mediatek.gemini:
//            SimItem, GeminiUtils

public class DefaultSimPreference extends DialogPreference
    implements android.widget.AdapterView.OnItemClickListener
{
    class SelectionListAdapter extends BaseAdapter
    {

        List mSimItemList;
        final DefaultSimPreference this$0;

        private void setImageSim(RelativeLayout relativelayout, SimItem simitem)
        {
            if (simitem.mIsSim)
            {
                int i = GeminiUtils.getSimColorResource(simitem.mColor);
                if (i >= 0)
                {
                    relativelayout.setVisibility(0);
                    relativelayout.setBackgroundResource(i);
                }
                return;
            }
            if (simitem.mColor == 8)
            {
                relativelayout.setVisibility(0);
                relativelayout.setBackgroundResource(0x20200e6);
                return;
            } else
            {
                relativelayout.setVisibility(8);
                return;
            }
        }

        private void setImageStatus(ImageView imageview, SimItem simitem)
        {
            if (simitem.mIsSim)
            {
                int i = GeminiUtils.getStatusResource(simitem.mState);
                if (i == -1)
                {
                    imageview.setVisibility(8);
                    return;
                } else
                {
                    imageview.setVisibility(0);
                    imageview.setImageResource(i);
                    return;
                }
            } else
            {
                imageview.setVisibility(8);
                return;
            }
        }

        private void setNameAndNum(TextView textview, TextView textview1, SimItem simitem)
        {
            if (simitem.mName == null)
            {
                textview.setVisibility(8);
            } else
            {
                textview.setVisibility(0);
                textview.setText(simitem.mName);
            }
            if (simitem.mIsSim && simitem.mNumber != null && simitem.mNumber.length() != 0)
            {
                textview1.setVisibility(0);
                textview1.setText(simitem.mNumber);
                return;
            } else
            {
                textview1.setVisibility(8);
                return;
            }
        }

        private void setTextNumFormat(TextView textview, SimItem simitem)
        {
            if (simitem.mIsSim)
            {
                if (simitem.mNumber != null)
                {
                    switch (simitem.mDispalyNumberFormat)
                    {
                    case 2: // '\002'
                        textview.setVisibility(0);
                        if (simitem.mNumber.length() >= 4)
                        {
                            textview.setText(simitem.mNumber.substring(-4 + simitem.mNumber.length()));
                            return;
                        } else
                        {
                            textview.setText(simitem.mNumber);
                            return;
                        }

                    case 1: // '\001'
                        textview.setVisibility(0);
                        if (simitem.mNumber.length() >= 4)
                        {
                            textview.setText(simitem.mNumber.substring(0, 4));
                            return;
                        } else
                        {
                            textview.setText(simitem.mNumber);
                            return;
                        }

                    case 0: // '\0'
                        textview.setVisibility(8);
                        return;
                    }
                    return;
                } else
                {
                    Xlog.d("DefaultSimPreference", (new StringBuilder()).append("simItem.mNumber=").append(simitem.mNumber).toString());
                    textview.setVisibility(8);
                    return;
                }
            } else
            {
                textview.setVisibility(8);
                return;
            }
        }

        private void setViewHolderId(ViewHolder viewholder, View view)
        {
            viewholder.mTextName = (TextView)view.findViewById(0x7f080115);
            viewholder.mTextNum = (TextView)view.findViewById(0x7f080116);
            viewholder.mImageStatus = (ImageView)view.findViewById(0x7f080112);
            viewholder.mTextNumFormat = (TextView)view.findViewById(0x7f080113);
            viewholder.mCkRadioOn = (RadioButton)view.findViewById(0x7f080117);
            viewholder.mImageSim = (RelativeLayout)view.findViewById(0x7f080111);
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
                view = mFlater.inflate(0x7f040071, null);
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
            if (simitem.mState != 1 && (mType != 3 || getCount() != 2 || simitem.mSimID != -1L) && (mType != 1 || getCount() != 2 && getCount() != 1 || simitem.mSimID != -1L))
            {
                view.setEnabled(true);
                viewholder.mTextName.setEnabled(true);
                viewholder.mTextNum.setEnabled(true);
                viewholder.mCkRadioOn.setEnabled(true);
                return view;
            } else
            {
                view.setEnabled(false);
                viewholder.mTextName.setEnabled(false);
                viewholder.mTextNum.setEnabled(false);
                viewholder.mCkRadioOn.setEnabled(false);
                return view;
            }
        }

        public void updateListData(List list)
        {
            mSimItemList = list;
        }

        public SelectionListAdapter(List list)
        {
            this$0 = DefaultSimPreference.this;
            super();
            mSimItemList = list;
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


    private static final int COLOR_INTERNET_CALL = 8;
    private static final int DISPLAY_FIRST_FOUR = 1;
    private static final int DISPLAY_LAST_FOUR = 2;
    private static final int DISPLAY_NONE = 0;
    private static final int NUM_WIDTH = 4;
    private static final int PIN1_REQUEST_CODE = 302;
    private static final String TAG = "DefaultSimPreference";
    private SelectionListAdapter mAdapter;
    private CellConnMgr mCellConnMgr;
    private Context mContext;
    private LayoutInflater mFlater;
    private int mInitValue;
    private ListView mListView;
    private int mSelected;
    private List mSimItemList;
    private int mType;

    public DefaultSimPreference(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public DefaultSimPreference(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mSimItemList = new ArrayList();
        mSelected = -1;
        mInitValue = -1;
        mType = -1;
        mContext = context;
        mFlater = LayoutInflater.from(context);
    }

    private void updateData()
    {
        int i = 0;
        for (Iterator iterator = mSimItemList.iterator(); iterator.hasNext(); i++)
        {
            SimItem simitem = (SimItem)iterator.next();
            if (!simitem.mIsSim)
                continue;
            android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(mContext, simitem.mSimID);
            if (siminfo != null)
            {
                SimItem simitem1 = new SimItem(siminfo);
                mSimItemList.set(i, simitem1);
            }
        }

    }

    long getValue()
    {
        return ((SimItem)mSimItemList.get(mSelected)).mSimID;
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
        Xlog.i("DefaultSimPreference", (new StringBuilder()).append("mSelected = ").append(mSelected).toString());
        Xlog.i("DefaultSimPreference", (new StringBuilder()).append("mInitValue = ").append(mInitValue).toString());
        if (flag && mSelected >= 0 && mSelected != mInitValue)
        {
            Xlog.i("DefaultSimPreference", "callChangeListener");
            callChangeListener(Long.valueOf(((SimItem)mSimItemList.get(mSelected)).mSimID));
            mInitValue = mSelected;
        }
    }

    public void onItemClick(AdapterView adapterview, View view, int i, long l)
    {
        Xlog.i("DefaultSimPreference", (new StringBuilder()).append("positon is ").append(i).toString());
        if (view != null && view.isEnabled())
        {
            SimItem simitem = (SimItem)mSimItemList.get(i);
            if (mType == 4 && simitem.mIsSim && mCellConnMgr != null && simitem.mState == 2)
            {
                mCellConnMgr.handleCellConn(simitem.mSlot, 302);
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
        super.onPrepareDialogBuilder(builder);
        mAdapter = new SelectionListAdapter(mSimItemList);
        mListView = new ListView(mContext);
        mListView.setAdapter(mAdapter);
        mListView.setOnItemClickListener(this);
        mListView.setItemsCanFocus(false);
        builder.setView(mListView, 0, 0, 0, 0);
        builder.setNegativeButton(0x1040000, null);
    }

    void setCellConnMgr(CellConnMgr cellconnmgr)
    {
        mCellConnMgr = cellconnmgr;
    }

    void setData(List list)
    {
        mSimItemList = list;
        if (getDialog() != null && mListView != null)
        {
            mAdapter = new SelectionListAdapter(mSimItemList);
            mListView.setAdapter(mAdapter);
            mAdapter.notifyDataSetChanged();
        }
    }

    public void setEnabled(boolean flag)
    {
        Drawable drawable = getIcon();
        if (drawable != null)
        {
            char c;
            if (flag)
                c = '\377';
            else
                c = 'K';
            drawable.setAlpha(c);
        } else
        {
            Xlog.d("DefaultSimPreference", "fail to set icon alpha due to icon is null");
        }
        super.setEnabled(flag);
    }

    void setInitData(List list)
    {
        mSimItemList = list;
        if (mAdapter != null)
        {
            Xlog.d("DefaultSimPreference", "mAdapter is not null");
            mAdapter.updateListData(mSimItemList);
            mAdapter.notifyDataSetChanged();
        }
    }

    void setInitValue(int i)
    {
        mInitValue = i;
        mSelected = i;
        if (mAdapter != null)
            mAdapter.notifyDataSetChanged();
    }

    void setType(int i)
    {
        mType = i;
    }



}
