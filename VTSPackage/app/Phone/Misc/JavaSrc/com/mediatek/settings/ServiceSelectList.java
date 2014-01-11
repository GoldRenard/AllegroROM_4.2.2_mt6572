// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.view.*;
import android.widget.*;
import com.android.internal.telephony.ITelephony;
import com.android.phone.PhoneGlobals;
import com.android.phone.PhoneInterfaceManager;
import com.mediatek.phone.Utils;
import com.mediatek.telephony.TelephonyManagerEx;
import com.mediatek.xlog.Xlog;
import java.util.*;

public class ServiceSelectList extends DialogPreference
    implements android.widget.AdapterView.OnItemClickListener, android.content.DialogInterface.OnClickListener
{
    class SelectionListAdapter extends BaseAdapter
    {

        final ServiceSelectList this$0;

        private void setImageSim(RelativeLayout relativelayout, SimItem simitem)
        {
            if (simitem.mIsSim)
            {
                int i = Utils.getSimColorResource(simitem.mColor);
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
            ITelephony itelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
            int i;
            if (imageview == null || itelephony == null)
                break MISSING_BLOCK_LABEL_81;
            i = -1;
            if (simitem.mSlot >= 0)
                i = getSimStatusImge(itelephony.getSimIndicatorStateGemini(simitem.mSlot));
            if (i == -1)
            {
                try
                {
                    imageview.setVisibility(8);
                    return;
                }
                catch (RemoteException remoteexception)
                {
                    imageview.setVisibility(8);
                }
                break MISSING_BLOCK_LABEL_81;
            }
            imageview.setVisibility(0);
            imageview.setImageResource(i);
            return;
        }

        private void setNameAndNum(TextView textview, TextView textview1, SimItem simitem)
        {
            if (simitem.mName != null)
            {
                textview.setVisibility(0);
                textview.setText(simitem.mName);
            } else
            {
                textview.setVisibility(8);
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
            if (simitem.mIsSim && simitem.mNumber != null)
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

        public int getHas3GService()
        {
            int i = -1;
            int j = 0;
            do
            {
label0:
                {
                    if (j < mSimItemList.size())
                    {
                        if (!((SimItem)mSimItemList.get(j)).mHas3GCapability)
                            break label0;
                        i = j;
                    }
                    return i;
                }
                j++;
            } while (true);
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
                view = mFlater.inflate(0x7f040035, null);
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
            Xlog.d("Settings/ServiceSelectList", (new StringBuilder()).append("getview, simItem.mState=").append(simitem.mState).toString());
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

        public SelectionListAdapter(Context context)
        {
            this$0 = ServiceSelectList.this;
            super();
        }

        public SelectionListAdapter(List list)
        {
            this$0 = ServiceSelectList.this;
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

    class SimItem
    {

        public static final long DESCRIPTION_LIST_ITEM_SIMID = -2L;
        public static final long OFF_LIST_ITEM_SIMID = -1L;
        public int mColor;
        public int mDispalyNumberFormat;
        public boolean mHas3GCapability;
        public boolean mIsSim;
        public String mName;
        public String mNumber;
        public long mSimID;
        public int mSlot;
        public int mState;
        final ServiceSelectList this$0;

        public SimItem(android.provider.Telephony.SIMInfo siminfo)
        {
            boolean flag = true;
            this$0 = ServiceSelectList.this;
            super();
            mHas3GCapability = false;
            mIsSim = flag;
            mName = null;
            mNumber = null;
            mDispalyNumberFormat = 0;
            mColor = -1;
            mSlot = -1;
            mSimID = -1L;
            mState = 5;
            mIsSim = flag;
            mName = siminfo.mDisplayName;
            mNumber = siminfo.mNumber;
            mDispalyNumberFormat = siminfo.mDispalyNumberFormat;
            mColor = siminfo.mColor;
            mSlot = siminfo.mSlot;
            mSimID = siminfo.mSimId;
            if (mPhoneMgr != null)
            {
                if (mSlot != mPhoneMgr.get3GCapabilitySIM())
                    flag = false;
                mHas3GCapability = flag;
            }
        }

        public SimItem(String s, int i, long l)
        {
            boolean flag = true;
            this$0 = ServiceSelectList.this;
            super();
            mHas3GCapability = false;
            mIsSim = flag;
            mName = null;
            mNumber = null;
            mDispalyNumberFormat = 0;
            mColor = -1;
            mSlot = -1;
            mSimID = -1L;
            mState = 5;
            mName = s;
            mColor = i;
            mIsSim = false;
            mSimID = l;
            if (mPhoneMgr != null)
            {
                if (mSlot != mPhoneMgr.get3GCapabilitySIM())
                    flag = false;
                mHas3GCapability = flag;
            }
        }
    }


    private static final int DISPLAY_FIRST_FOUR = 1;
    private static final int DISPLAY_LAST_FOUR = 2;
    private static final int DISPLAY_NONE = 0;
    private static final int PIN1_REQUEST_CODE = 302;
    private static final String TAG = "Settings/ServiceSelectList";
    private SelectionListAdapter mAdapter;
    private AlertDialog mAlertDialog;
    private Context mContext;
    private CharSequence mEntries[];
    private CharSequence mEntryValues[];
    private LayoutInflater mFlater;
    private Drawable mIcon;
    private int mInitValue;
    private ListView mListView;
    private PhoneInterfaceManager mPhoneMgr;
    private int mSelected;
    private List mSimItemList;
    private int mSwitchID;
    private int mSwitchTo;
    private TelephonyManagerEx mTelephonyManagerEx;
    private String mValue;

    public ServiceSelectList(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public ServiceSelectList(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset);
        mSelected = -1;
        mSwitchTo = -1;
        mInitValue = -1;
        mPhoneMgr = null;
        mAlertDialog = null;
        mContext = context;
        mFlater = LayoutInflater.from(context);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.ListPreference, 0, 0);
        mEntries = typedarray.getTextArray(0);
        mEntryValues = typedarray.getTextArray(1);
        typedarray.recycle();
        mPhoneMgr = PhoneGlobals.getInstance().phoneMgr;
        mTelephonyManagerEx = TelephonyManagerEx.getDefault();
    }

    private int getSimStatusImge(int i)
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

    void dismissDialogs()
    {
        Xlog.d("Settings/ServiceSelectList", "disable the 3G switch.");
        Dialog dialog = getDialog();
        if (dialog != null)
            dialog.dismiss();
        if (mAlertDialog != null && mAlertDialog.isShowing())
            mAlertDialog.dismiss();
    }

    void dismissSelf()
    {
        Xlog.d("Settings/ServiceSelectList", "Dismiss the select list.");
        AlertDialog alertdialog = (AlertDialog)getDialog();
        if (alertdialog != null)
            alertdialog.dismiss();
    }

    public void onBindView(View view)
    {
        super.onBindView(view);
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (i == -1)
            onDialogClosed(true);
        else
        if (i == -2)
        {
            onDialogClosed(false);
            return;
        }
    }

    protected void onDialogClosed(boolean flag)
    {
        super.onDialogClosed(flag);
        Xlog.i("Settings/ServiceSelectList", (new StringBuilder()).append("onDialogClosed : mSelected = ").append(mSelected).toString());
        Xlog.i("Settings/ServiceSelectList", (new StringBuilder()).append("onDialogClosed : mInitValue = ").append(mInitValue).toString());
        Xlog.i("Settings/ServiceSelectList", (new StringBuilder()).append("onDialogClosed : mSwitchID = ").append(mSwitchID).toString());
        if (flag)
        {
            Xlog.i("Settings/ServiceSelectList", "callChangeListener");
            if (mSwitchID != mSelected && mSimItemList.get(mSwitchID) != null)
            {
                callChangeListener(Long.valueOf(((SimItem)mSimItemList.get(mSwitchID)).mSimID));
                mSelected = mSwitchID;
                mInitValue = mSelected;
                Xlog.d("Settings/ServiceSelectList", "mSelected is changed after popup dialog so use mSwitchID");
            } else
            {
                callChangeListener(Long.valueOf(((SimItem)mSimItemList.get(mSelected)).mSimID));
                mInitValue = mSelected;
                Xlog.d("Settings/ServiceSelectList", "Nothing modify after popup confirm dialog");
            }
        }
        dismissSelf();
    }

    public void onItemClick(AdapterView adapterview, View view, int i, long l)
    {
        Xlog.i("Settings/ServiceSelectList", "onclick");
        Xlog.i("Settings/ServiceSelectList", (new StringBuilder()).append("positon is ").append(i).toString());
        Xlog.i("Settings/ServiceSelectList", (new StringBuilder()).append("current select is ").append(mSelected).toString());
        if (view.isEnabled())
        {
            if (i == mSelected)
            {
                dismissSelf();
                return;
            }
            if (((SimItem)mSimItemList.get(i)).mSimID != -2L)
            {
                mSelected = i;
                mSwitchID = i;
                Xlog.d("Settings/ServiceSelectList", (new StringBuilder()).append("onPrepareDialogBuilder mSelected = ").append(mSelected).toString());
                Xlog.i("Settings/ServiceSelectList", (new StringBuilder()).append("Switch to ").append(mSelected).toString());
                onDialogClosed(true);
                return;
            }
        }
    }

    protected void onPrepareDialogBuilder(android.app.AlertDialog.Builder builder)
    {
        super.onPrepareDialogBuilder(builder);
        refreshList();
        mAdapter = new SelectionListAdapter(getContext());
        mListView = new ListView(mContext);
        mListView.setAdapter(mAdapter);
        mListView.setOnItemClickListener(this);
        mSelected = mAdapter.getHas3GService();
        Xlog.d("Settings/ServiceSelectList", (new StringBuilder()).append("onPrepareDialogBuilder mSelected = ").append(mSelected).toString());
        mListView.setItemsCanFocus(false);
        mListView.setCacheColorHint(0);
        builder.setInverseBackgroundForced(true);
        builder.setView(mListView, 0, 0, 0, 0);
        builder.setNegativeButton(0x7f0d0196, this);
        builder.setPositiveButton(null, null);
    }

    public void refreshList()
    {
        ArrayList arraylist;
        int i;
        boolean flag;
        Iterator iterator;
        arraylist = new ArrayList();
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(mContext);
        Collections.sort(list, new CallSettings.SIMInfoComparable());
        i = 0;
        flag = true;
        iterator = list.iterator();
_L3:
        android.provider.Telephony.SIMInfo siminfo;
        SimItem simitem1;
        if (!iterator.hasNext())
            break MISSING_BLOCK_LABEL_187;
        siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
        if (siminfo == null)
            continue; /* Loop/switch isn't completed */
        simitem1 = new SimItem(siminfo);
        ITelephony itelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        if (itelephony == null)
            break MISSING_BLOCK_LABEL_112;
        int j = itelephony.getSimIndicatorStateGemini(siminfo.mSlot);
        i = j;
_L1:
        simitem1.mState = i;
        arraylist.add(simitem1);
        RemoteException remoteexception;
        if (flag)
            if (i == 1)
                flag = true;
            else
                flag = false;
        continue; /* Loop/switch isn't completed */
        remoteexception;
        Xlog.d("Settings/ServiceSelectList", (new StringBuilder()).append("[e = ").append(remoteexception).append("]").toString());
          goto _L1
        SimItem simitem = new SimItem(mContext.getResources().getString(0x7f0d00a0), 0, -1L);
        if (flag)
            simitem.mState = 1;
        arraylist.add(simitem);
        mSimItemList = arraylist;
        if (mAdapter != null)
        {
            mSelected = mAdapter.getHas3GService();
            Xlog.d("Settings/ServiceSelectList", (new StringBuilder()).append("refreshList mSelected = ").append(mSelected).toString());
            mAdapter.notifyDataSetChanged();
        }
        return;
        if (true) goto _L3; else goto _L2
_L2:
    }

    void setInitValue(int i)
    {
        mInitValue = i;
        mSelected = i;
    }

    void setRadioCheched(int i)
    {
        int j = mListView.getCount();
        for (int k = 0; k < j; k++)
        {
            RadioButton radiobutton = (RadioButton)mListView.getChildAt(k).findViewById(0x7f0800de);
            if (radiobutton == null)
                continue;
            boolean flag;
            if (k == i)
                flag = true;
            else
                flag = false;
            radiobutton.setChecked(flag);
        }

    }



/*
    static List access$002(ServiceSelectList serviceselectlist, List list)
    {
        serviceselectlist.mSimItemList = list;
        return list;
    }

*/




}
