// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic.gemini;

import android.content.Context;
import android.content.res.Resources;
import android.preference.Preference;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;
import com.mediatek.oobe.basic.ImportContactsActivity;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package com.mediatek.oobe.basic.gemini:
//            GeminiUtils

public class SimInfoPreference extends Preference
{

    private static final int DISPLAY_FIRST_FOUR = 1;
    private static final int DISPLAY_LAST_FOUR = 2;
    private static final int DISPLAY_NONE = 0;
    private static final String TAG = "SimInfoPreference";
    private static List sListenerList = new ArrayList();
    private boolean mChecked;
    private int mColor;
    private Context mContext;
    private boolean mFinishImporting;
    private boolean mIsImporting;
    private String mName;
    private boolean mNeedCheckbox;
    private boolean mNeedStatus;
    private int mNumDisplayFormat;
    private int mProgressCurrNum;
    private int mProgressTotalCount;
    private String mSimNum;
    protected final int mSlotIndex;
    private int mStatus;
    private String mTextImportingProgress;

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
        mProgressCurrNum = 0;
        mProgressTotalCount = 0;
        mTextImportingProgress = "";
        mIsImporting = false;
        mFinishImporting = false;
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
        if (flag)
            setLayoutResource(0x7f03000d);
        else
            setLayoutResource(0x7f030011);
        if (mName != null)
            setTitle(mName);
        if (mSimNum != null && mSimNum.length() != 0)
            setSummary(mSimNum);
    }

    private void notifyCallback()
    {
        for (int i = 0; i < sListenerList.size(); i++)
        {
            ImportContactsActivity importcontactsactivity = (ImportContactsActivity)sListenerList.get(i);
            if (importcontactsactivity == mContext)
                Xlog.w("SimInfoPreference", "Contact Import callback============self, do not notify==========");
            else
                importcontactsactivity.refreshProgress();
        }

    }

    private void notifyCancelImport()
    {
        for (int i = 0; i < sListenerList.size(); i++)
        {
            ImportContactsActivity importcontactsactivity = (ImportContactsActivity)sListenerList.get(i);
            if (importcontactsactivity == mContext)
                Xlog.w("SimInfoPreference", "Contact Import cancel importing============self, do not notify==========");
            else
                importcontactsactivity.refreshCancel();
        }

    }

    public static void registerCallback(ImportContactsActivity importcontactsactivity)
    {
        sListenerList.add(importcontactsactivity);
    }

    public static void unregisterCallback(ImportContactsActivity importcontactsactivity)
    {
        sListenerList.remove(importcontactsactivity);
    }

    public void dealWithCancel()
    {
        mFinishImporting = false;
        mIsImporting = false;
        notifyChanged();
        notifyCancelImport();
    }

    public void finishProgressBar()
    {
        if (mFinishImporting)
        {
            return;
        } else
        {
            mFinishImporting = true;
            notifyChanged();
            notifyCallback();
            return;
        }
    }

    public boolean getCheck()
    {
        return mChecked;
    }

    public int getSlotIndex()
    {
        return mSlotIndex;
    }

    public View getView(View view, ViewGroup viewgroup)
    {
        View view1;
        ProgressBar progressbar;
        TextView textview3;
label0:
        {
            view1 = super.getView(view, viewgroup);
            TextView textview = (TextView)view1.findViewById(0x1020016);
            if (textview != null && mName != null)
                textview.setText(mName);
            TextView textview1 = (TextView)view1.findViewById(0x1020010);
            if (textview1 != null)
                if (mSimNum != null && mSimNum.length() != 0)
                    textview1.setText(mSimNum);
                else
                    textview1.setVisibility(8);
            ImageView imageview = (ImageView)view1.findViewById(0x7f0b001e);
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
            RelativeLayout relativelayout = (RelativeLayout)view1.findViewById(0x7f0b001d);
            if (relativelayout != null)
            {
                int i = GeminiUtils.getSimColorResource(mColor);
                if (i < 0)
                    relativelayout.setBackgroundDrawable(null);
                else
                    relativelayout.setBackgroundResource(i);
            }
            CheckBox checkbox = (CheckBox)view1.findViewById(0x7f0b0023);
            Xlog.i("SimInfoPreference", (new StringBuilder()).append("ckRadioOn.setChecked ").append(mChecked).toString());
            if (checkbox != null)
                if (mNeedCheckbox)
                {
                    checkbox.setChecked(mChecked);
                    byte byte2;
                    if (!mFinishImporting && !mIsImporting)
                        byte2 = 0;
                    else
                        byte2 = 8;
                    checkbox.setVisibility(byte2);
                } else
                {
                    checkbox.setVisibility(8);
                }
            TextView textview2 = (TextView)view1.findViewById(0x7f0b001f);
            if (textview1 != null && mSimNum != null)
                switch (mNumDisplayFormat)
                {
                default:
                    break;

                case 2: // '\002'
                    if (mSimNum.length() >= 4)
                        textview2.setText(mSimNum.substring(-4 + mSimNum.length()));
                    else
                        textview2.setText(mSimNum);
                    break;

                case 1: // '\001'
                    if (mSimNum.length() >= 4)
                        textview2.setText(mSimNum.substring(0, 4));
                    else
                        textview2.setText(mSimNum);
                    break;

                case 0: // '\0'
                    textview2.setVisibility(8);
                    break;
                }
            Xlog.d("SimInfoPreference", (new StringBuilder()).append("mNeedCheckbox: ").append(mNeedCheckbox).toString());
            if (mNeedCheckbox)
            {
                progressbar = (ProgressBar)view1.findViewById(0x7f0b0018);
                textview3 = (TextView)view1.findViewById(0x7f0b0021);
                ImageView imageview1 = (ImageView)view1.findViewById(0x7f0b0022);
                TextView textview4 = (TextView)view1.findViewById(0x1020010);
                String s;
                if (textview4 == null)
                    s = "";
                else
                    s = textview4.getText().toString();
                byte byte0;
                if (mFinishImporting)
                    byte0 = 0;
                else
                    byte0 = 8;
                imageview1.setVisibility(byte0);
                if (textview4 != null)
                {
                    byte byte1;
                    if ((!mIsImporting || mFinishImporting) && !TextUtils.isEmpty(s))
                        byte1 = 0;
                    else
                        byte1 = 8;
                    textview4.setVisibility(byte1);
                }
                if (!mIsImporting || mFinishImporting)
                    break label0;
                progressbar.setVisibility(0);
                progressbar.setMax(mProgressTotalCount);
                progressbar.setProgress(mProgressCurrNum);
                textview3.setVisibility(0);
                textview3.setText(mTextImportingProgress);
            }
            return view1;
        }
        progressbar.setVisibility(8);
        textview3.setVisibility(8);
        return view1;
    }

    public void incrementProgressTo(int i)
    {
        Xlog.d("SimInfoPreference", (new StringBuilder()).append(mName).append("--incrementProgressTo ").append(i).toString());
        mProgressCurrNum = i;
        String s = mContext.getResources().getString(0x7f09006e);
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(mProgressCurrNum);
        aobj[1] = Integer.valueOf(mProgressTotalCount);
        mTextImportingProgress = String.format(s, aobj);
        notifyChanged();
        notifyCallback();
    }

    public void initProgressBar(int i)
    {
        Xlog.d("SimInfoPreference", (new StringBuilder()).append(mName).append("--initProgressBar, totalCount=").append(i).toString());
        mIsImporting = true;
        if (mContext == null)
            Xlog.d("SimInfoPreference", "mContext is null");
        mTextImportingProgress = mContext.getResources().getString(0x7f09006f);
        mProgressCurrNum = 0;
        mProgressTotalCount = i;
        notifyChanged();
    }

    public boolean isFinishImporting()
    {
        return mFinishImporting;
    }

    public boolean isImporting()
    {
        return mIsImporting;
    }

    public void setCheck(boolean flag)
    {
        mChecked = flag;
        notifyChanged();
    }

    public void setColor(int i)
    {
        mColor = i;
        notifyChanged();
    }

    public void setFinishImporting(boolean flag)
    {
        mFinishImporting = flag;
        notifyChanged();
    }

    public void setImporting(boolean flag)
    {
        mIsImporting = flag;
        notifyChanged();
    }

    public void setName(String s)
    {
        mName = s;
        notifyChanged();
    }

    public void setNeedCheckBox(boolean flag)
    {
        mNeedCheckbox = flag;
        notifyChanged();
    }

    public void setNumDisplayFormat(int i)
    {
        mNumDisplayFormat = i;
        notifyChanged();
    }

    public void setNumber(String s)
    {
        mSimNum = s;
        notifyChanged();
    }

    public void setStatus(int i)
    {
        mStatus = i;
        notifyChanged();
    }

}
