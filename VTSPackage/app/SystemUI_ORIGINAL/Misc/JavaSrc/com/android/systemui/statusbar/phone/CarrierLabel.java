// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.TextView;
import com.mediatek.xlog.Xlog;

public class CarrierLabel extends TextView
{

    private static final String TAG = "CarrierLabel";
    private boolean mAttached;
    private String mNetworkNameSeparator;

    public CarrierLabel(Context context)
    {
        this(context, null);
    }

    public CarrierLabel(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public CarrierLabel(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        updateNetworkName(false, null, false, null);
        mNetworkNameSeparator = getContext().getString(0x7f0b005b);
    }

    void updateNetworkName(boolean flag, String s, boolean flag1, String s1)
    {
        Xlog.d("CarrierLabel", (new StringBuilder()).append("updateNetworkName, showSpn=").append(flag).append(" spn=").append(s).append(" showPlmn=").append(flag1).append(" plmn=").append(s1).toString());
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
