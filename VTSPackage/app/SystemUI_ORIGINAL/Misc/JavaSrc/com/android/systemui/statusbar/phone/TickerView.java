// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.TextSwitcher;

// Referenced classes of package com.android.systemui.statusbar.phone:
//            Ticker

public class TickerView extends TextSwitcher
{

    Ticker mTicker;

    public TickerView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        super.onSizeChanged(i, j, k, l);
        mTicker.reflowText();
    }

    public void setTicker(Ticker ticker)
    {
        mTicker = ticker;
    }
}
