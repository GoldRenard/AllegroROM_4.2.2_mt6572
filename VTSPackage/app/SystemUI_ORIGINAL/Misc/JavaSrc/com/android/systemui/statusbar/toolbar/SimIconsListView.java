// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.toolbar;

import android.content.*;
import android.os.SystemProperties;
import android.view.*;
import android.widget.*;
import com.android.systemui.statusbar.util.SIMHelper;
import com.mediatek.telephony.SimInfoManager;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;
import java.util.List;

public class SimIconsListView extends ListView
{
    private static class SimInfoViewHolder
    {

        RelativeLayout mSimBg;
        TextView mSimNumber;
        TextView mSimOpName;
        RadioButton mSimSelectedRadio;
        TextView mSimShortNumber;
        ImageView mSimStatus;
        TextView mSimType;

        private SimInfoViewHolder()
        {
        }

    }

    private class SimInfotListAdapter extends BaseAdapter
    {

        private Context mContext;
        private LayoutInflater mInflater;
        final SimIconsListView this$0;

        public int getCount()
        {
            return mSimItems.size();
        }

        public SimItem getItem(int i)
        {
            return (SimItem)mSimItems.get(i);
        }

        public volatile Object getItem(int i)
        {
            return getItem(i);
        }

        public long getItemId(int i)
        {
            return (long)i;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            SimInfoViewHolder siminfoviewholder;
            SimItem simitem;
            if (view == null)
            {
                view = mInflater.inflate(0x7f040049, null);
                siminfoviewholder = new SimInfoViewHolder();
                siminfoviewholder.mSimBg = (RelativeLayout)view.findViewById(0x7f08011a);
                siminfoviewholder.mSimType = (TextView)view.findViewById(0x7f08011c);
                siminfoviewholder.mSimShortNumber = (TextView)view.findViewById(0x7f08011d);
                siminfoviewholder.mSimStatus = (ImageView)view.findViewById(0x7f08011b);
                siminfoviewholder.mSimOpName = (TextView)view.findViewById(0x7f08011e);
                siminfoviewholder.mSimNumber = (TextView)view.findViewById(0x7f08011f);
                siminfoviewholder.mSimSelectedRadio = (RadioButton)view.findViewById(0x7f080120);
                view.setTag(siminfoviewholder);
            } else
            {
                siminfoviewholder = (SimInfoViewHolder)view.getTag();
            }
            simitem = (SimItem)mSimItems.get(i);
            if (!simitem.mIsSim)
            {
                if (simitem.mColor == 8)
                {
                    siminfoviewholder.mSimBg.setVisibility(0);
                    siminfoviewholder.mSimBg.setBackgroundResource(0x20200e6);
                } else
                {
                    siminfoviewholder.mSimBg.setVisibility(8);
                }
                siminfoviewholder.mSimOpName.setText(simitem.mName);
                siminfoviewholder.mSimNumber.setVisibility(8);
                siminfoviewholder.mSimBg.setVisibility(8);
                siminfoviewholder.mSimType.setVisibility(8);
            } else
            {
                siminfoviewholder.mSimBg.setVisibility(0);
                siminfoviewholder.mSimBg.setBackgroundResource(simitem.mColor);
                siminfoviewholder.mSimOpName.setText(simitem.mName);
                if (simitem.mState == 1)
                    siminfoviewholder.mSimOpName.setTextColor(0xff888888);
                else
                    siminfoviewholder.mSimOpName.setTextColor(-1);
                if (simitem.mNumber != null && simitem.mNumber.length() > 0)
                {
                    siminfoviewholder.mSimNumber.setVisibility(0);
                    siminfoviewholder.mSimNumber.setText(simitem.mNumber);
                    if (simitem.mState == 1)
                        siminfoviewholder.mSimNumber.setTextColor(0xff888888);
                    else
                        siminfoviewholder.mSimNumber.setTextColor(-1);
                } else
                {
                    siminfoviewholder.mSimNumber.setVisibility(8);
                }
                siminfoviewholder.mSimStatus.setImageResource(SIMHelper.getSIMStateIcon(simitem.mState));
                siminfoviewholder.mSimShortNumber.setText(simitem.getFormatedNumber());
                siminfoviewholder.mSimType.setVisibility(8);
            }
            RadioButton radiobutton = siminfoviewholder.mSimSelectedRadio;
            boolean flag;
            if (simitem.mSimID == mSelectedSimId)
                flag = true;
            else
                flag = false;
            radiobutton.setChecked(flag);
            Xlog.d("SimIconsListView", (new StringBuilder()).append("getVIew called, simItem's simId is ").append(simitem.mSimID).append(", mSelectedSimId is ").append(mSelectedSimId).toString());
            Xlog.d("SimIconsListView", (new StringBuilder()).append("getVIew called, simItem's simColor is ").append(simitem.mColor).toString());
            if (simitem.mIsSim)
                if (SIMHelper.getSimIndicatorStateGemini(simitem.mSlot) == 1)
                {
                    Xlog.d("SimIconsListView", "simItem is radio off");
                    siminfoviewholder.mSimOpName.setEnabled(false);
                    siminfoviewholder.mSimNumber.setEnabled(false);
                    siminfoviewholder.mSimSelectedRadio.setEnabled(false);
                    view.setEnabled(false);
                } else
                {
                    Xlog.d("SimIconsListView", "simItem is not radio off");
                    siminfoviewholder.mSimOpName.setEnabled(true);
                    siminfoviewholder.mSimNumber.setEnabled(true);
                    siminfoviewholder.mSimSelectedRadio.setEnabled(true);
                    view.setEnabled(true);
                }
            if (simitem.mSimID != 0L) goto _L2; else goto _L1
_L1:
            int j = 0;
_L8:
            int k;
            boolean flag1;
            k = mSimItems.size();
            flag1 = false;
            if (j >= k) goto _L4; else goto _L3
_L3:
            SimItem simitem1 = (SimItem)mSimItems.get(j);
            if (!simitem1.mIsSim || simitem1.mState == 1) goto _L6; else goto _L5
_L5:
            flag1 = true;
_L4:
            if (!flag1)
                siminfoviewholder.mSimOpName.setTextColor(0xff888888);
            else
                siminfoviewholder.mSimOpName.setTextColor(-1);
            siminfoviewholder.mSimSelectedRadio.setEnabled(flag1);
            view.setEnabled(flag1);
_L2:
            return view;
_L6:
            j++;
            if (true) goto _L8; else goto _L7
_L7:
        }

        public SimInfotListAdapter(Context context)
        {
            this$0 = SimIconsListView.this;
            super();
            mContext = context;
            mInflater = (LayoutInflater)mContext.getSystemService("layout_inflater");
        }
    }

    class SimItem
    {

        public int mColor;
        public int mDispalyNumberFormat;
        public boolean mIsCU;
        public boolean mIsSim;
        public String mName;
        public String mNumber;
        public long mSimID;
        public int mSlot;
        public int mState;
        final SimIconsListView this$0;

        private String getFormatedNumber()
        {
            if (mNumber != null && !mNumber.isEmpty())
            {
                Xlog.d("SimIconsListView", (new StringBuilder()).append("getFormatedNumber called, mNumber is ").append(mNumber).toString());
                switch (mDispalyNumberFormat)
                {
                case 0: // '\0'
                    return "";

                case 2: // '\002'
                    if (mNumber.length() <= 4)
                        return mNumber;
                    else
                        return mNumber.substring(-4 + mNumber.length(), mNumber.length());

                case 1: // '\001'
                    if (mNumber.length() <= 4)
                        return mNumber;
                    else
                        return mNumber.substring(0, 4);
                }
                return "";
            } else
            {
                return "";
            }
        }


        public SimItem(com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord)
        {
            this$0 = SimIconsListView.this;
            super();
            mIsSim = true;
            mName = null;
            mNumber = null;
            mDispalyNumberFormat = 0;
            mColor = -1;
            mSlot = -1;
            mSimID = -1L;
            mState = 5;
            mIsCU = true;
            mIsSim = true;
            mName = siminforecord.mDisplayName;
            mNumber = siminforecord.mNumber;
            mDispalyNumberFormat = siminforecord.mDispalyNumberFormat;
            mColor = siminforecord.mSimBackgroundDarkRes;
            mSlot = siminforecord.mSimSlotId;
            mSimID = siminforecord.mSimInfoId;
        }

        public SimItem(String s, int i, long l)
        {
            this$0 = SimIconsListView.this;
            super();
            mIsSim = true;
            mName = null;
            mNumber = null;
            mDispalyNumberFormat = 0;
            mColor = -1;
            mSlot = -1;
            mSimID = -1L;
            mState = 5;
            mIsCU = true;
            mName = s;
            mColor = i;
            mIsSim = false;
            mSimID = l;
        }
    }


    private static final String CUMCCMNC = "46001";
    private static final boolean DBG = true;
    private static final String TAG = "SimIconsListView";
    private Context mContext;
    private BroadcastReceiver mIntentReceiver;
    private long mSelectedSimId;
    private String mServiceType;
    private SimInfotListAdapter mSimInfotListAdapter;
    private List mSimItems;

    public SimIconsListView(Context context, String s)
    {
        super(context, null);
        mSimItems = new ArrayList();
        mIntentReceiver = new BroadcastReceiver() {

            final SimIconsListView this$0;

            public void onReceive(Context context1, Intent intent)
            {
                if (intent.getAction().equals("android.intent.action.SIM_INDICATOR_STATE_CHANGED"))
                {
                    initSimList();
                    notifyDataChange();
                }
            }

            
            {
                this$0 = SimIconsListView.this;
                super();
            }
        }
;
        mContext = context;
        mServiceType = s;
        initListViews();
    }

    private void initListViews()
    {
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.SIM_INDICATOR_STATE_CHANGED");
        mContext.registerReceiver(mIntentReceiver, intentfilter);
        setCacheColorHint(0);
        initSimList();
        mSimInfotListAdapter = new SimInfotListAdapter(mContext);
        setAdapter(mSimInfotListAdapter);
    }

    public void initSimList()
    {
        mSelectedSimId = SIMHelper.getDefaultSIM(mContext, mServiceType);
        mSimItems.clear();
        List list = SIMHelper.getSIMInfoList(mContext);
        if (list != null && list.size() != 0)
        {
            for (int i = 0; i < list.size(); i++)
            {
                com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord2 = (com.mediatek.telephony.SimInfoManager.SimInfoRecord)list.get(i);
                String s = "";
                if (siminforecord2.mSimSlotId == 1)
                    s = SystemProperties.get("gsm.sim.operator.numeric.2");
                else
                if (siminforecord2.mSimSlotId != 2 && siminforecord2.mSimSlotId != 3)
                    s = SystemProperties.get("gsm.sim.operator.numeric");
                if (s.equals("46001"))
                    Xlog.d("SimIconsListView", "IsAllCUCard = true;");
            }

            if (mServiceType.equals("video_call_sim_setting"))
            {
                com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord1 = SimInfoManager.getSimInfoBySlot(mContext, 0);
                if (siminforecord1 != null)
                {
                    SimItem simitem2 = new SimItem(siminforecord1);
                    simitem2.mState = SIMHelper.getSimIndicatorStateGemini(siminforecord1.mSimSlotId);
                    mSimItems.add(simitem2);
                    return;
                }
            } else
            {
                for (int j = 0; j < list.size(); j++)
                {
                    com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = (com.mediatek.telephony.SimInfoManager.SimInfoRecord)list.get(j);
                    if (siminforecord != null)
                    {
                        SimItem simitem1 = new SimItem(siminforecord);
                        simitem1.mState = SIMHelper.getSimIndicatorStateGemini(siminforecord.mSimSlotId);
                        mSimItems.add(simitem1);
                    }
                }

                if (mServiceType.equals("gprs_connection_sim_setting"))
                {
                    SimItem simitem = new SimItem(mContext.getString(0x7f0b001d), -1, 0L);
                    mSimItems.add(simitem);
                    return;
                }
            }
        }
    }

    public void notifyDataChange()
    {
        if (mSimInfotListAdapter != null)
            mSimInfotListAdapter.notifyDataSetChanged();
    }

    public void updateResources()
    {
        if (mSimItems != null && mSimItems.size() != 0 && mServiceType.equals("gprs_connection_sim_setting"))
            ((SimItem)mSimItems.get(-1 + mSimItems.size())).mName = mContext.getString(0x7f0b001d);
    }


}
