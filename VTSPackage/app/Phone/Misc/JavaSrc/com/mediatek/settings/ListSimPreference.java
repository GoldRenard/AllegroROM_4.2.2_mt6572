// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.content.Context;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.preference.ListPreference;
import android.provider.Telephony;
import android.util.AttributeSet;
import android.view.View;
import android.widget.*;
import com.android.internal.telephony.ITelephony;

public class ListSimPreference extends ListPreference
{

    private static final boolean DBG = true;
    private static final String LOG_TAG = "Settings/SimPreference";
    private int mSimColor;
    private String mSimIconNumber;
    private String mSimName;
    private String mSimNumber;
    private int mSimSlot;

    public ListSimPreference(Context context)
    {
        this(context, null);
    }

    public ListSimPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
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

    public void onBindView(View view)
    {
        ImageView imageview;
        super.onBindView(view);
        imageview = (ImageView)view.findViewById(0x7f0800cc);
        ITelephony itelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        if (imageview == null || itelephony == null)
            break MISSING_BLOCK_LABEL_63;
        int i = getSimStatusImge(itelephony.getSimIndicatorStateGemini(mSimSlot));
        RelativeLayout relativelayout;
        TextView textview;
        if (i != -1)
            break MISSING_BLOCK_LABEL_200;
        TextView textview1;
        TextView textview2;
        try
        {
            imageview.setVisibility(8);
        }
        catch (RemoteException remoteexception)
        {
            imageview.setVisibility(8);
        }
        relativelayout = (RelativeLayout)view.findViewById(0x7f0800cb);
        if (relativelayout != null)
            if (mSimColor >= 0 && mSimColor <= 3)
                relativelayout.setBackgroundResource(Telephony.SIMBackgroundDarkRes[mSimColor]);
            else
                relativelayout.setBackgroundDrawable(null);
        textview = (TextView)view.findViewById(0x7f0800d0);
        if (textview != null)
            if (mSimNumber != null && !mSimNumber.isEmpty())
                textview.setText(mSimNumber);
            else
                textview.setVisibility(8);
        textview1 = (TextView)view.findViewById(0x7f0800cf);
        if (textview1 != null)
            textview1.setText(mSimName);
        textview2 = (TextView)view.findViewById(0x7f0800cd);
        if (textview2 != null)
            textview2.setText(mSimIconNumber);
        return;
        imageview.setVisibility(0);
        imageview.setImageResource(i);
        break MISSING_BLOCK_LABEL_63;
    }

    public void setSimColor(int i)
    {
        mSimColor = i;
    }

    public void setSimIconNumber(String s)
    {
        mSimIconNumber = s;
    }

    public void setSimName(String s)
    {
        mSimName = s;
    }

    public void setSimNumber(String s)
    {
        mSimNumber = s;
    }

    public void setSimSlot(int i)
    {
        mSimSlot = i;
    }
}
