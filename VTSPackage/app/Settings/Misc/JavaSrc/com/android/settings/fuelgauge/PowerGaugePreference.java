// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.fuelgauge;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.preference.Preference;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.TextView;

// Referenced classes of package com.android.settings.fuelgauge:
//            BatterySipper

public class PowerGaugePreference extends Preference
{

    private BatterySipper mInfo;
    private int mProgress;
    private CharSequence mProgressText;

    public PowerGaugePreference(Context context, Drawable drawable, BatterySipper batterysipper)
    {
        super(context);
        setLayoutResource(0x7f040007);
        if (drawable == null)
            drawable = new ColorDrawable(0);
        setIcon(drawable);
        mInfo = batterysipper;
    }

    BatterySipper getInfo()
    {
        return mInfo;
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        ((ProgressBar)view.findViewById(0x102000d)).setProgress(mProgress);
        ((TextView)view.findViewById(0x1020014)).setText(mProgressText);
    }

    public void setPercent(double d, double d1)
    {
        mProgress = (int)Math.ceil(d);
        Resources resources = getContext().getResources();
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf((int)Math.ceil(d1));
        mProgressText = resources.getString(0x7f0b0905, aobj);
        notifyChanged();
    }
}
