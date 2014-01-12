// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.TextView;
import com.mediatek.xlog.Xlog;

public class CarrierLabelGemini extends TextView
{

    private static final String TAG = "CarrierLabelGemini";
    private String mNetworkNameSeparator;
    private int mSlotId;

    public CarrierLabelGemini(Context context)
    {
        this(context, null);
    }

    public CarrierLabelGemini(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public CarrierLabelGemini(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mSlotId = -1;
        updateNetworkName(false, null, false, null);
        mNetworkNameSeparator = getContext().getString(0x7f0b005c);
    }

    public int getSlotId()
    {
        return mSlotId;
    }

    public void setSlotId(int i)
    {
        mSlotId = i;
    }

    void updateNetworkName(boolean flag, String s, boolean flag1, String s1)
    {
        Xlog.d("CarrierLabelGemini", (new StringBuilder()).append("updateNetworkName, showSpn=").append(flag).append(" spn=").append(s).append(" showPlmn=").append(flag1).append(" plmn=").append(s1).toString());
        StringBuilder stringbuilder = new StringBuilder();
        boolean flag2 = false;
        if (flag1)
        {
            flag2 = false;
            if (s1 != null)
            {
                stringbuilder.append(s1);
                flag2 = true;
            }
        }
        if (flag && s != null)
        {
            if (flag2)
                stringbuilder.append(mNetworkNameSeparator);
            stringbuilder.append(s);
            flag2 = true;
        }
        if (flag2)
        {
            setText(stringbuilder.toString());
            return;
        } else
        {
            setText(0x10402e6);
            return;
        }
    }
}
