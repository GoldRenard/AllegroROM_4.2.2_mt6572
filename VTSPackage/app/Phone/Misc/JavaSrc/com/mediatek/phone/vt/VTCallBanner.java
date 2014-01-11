// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.vt;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.TextView;

public class VTCallBanner extends RelativeLayout
{

    private static final boolean DBG = true;
    private static final String LOG_TAG = "VTCallBanner";
    public TextView mCallStateLabel;
    public TextView mCallTypeLabel;
    public TextView mLabel;
    public ViewGroup mMainCallBanner;
    public TextView mName;
    public TextView mOperatorName;
    public TextView mPhoneNumber;
    public TextView mPhoneNumberGeoDescription;
    public TextView mSimIndicator;
    public ViewGroup mVtCallStateAndSimIndicate;

    public VTCallBanner(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    private static void log(String s)
    {
        Log.d("VTCallBanner", s);
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        log((new StringBuilder()).append("onFinishInflate(this = ").append(this).append(")...").toString());
        mOperatorName = (TextView)findViewById(0x7f0800cf);
        mSimIndicator = (TextView)findViewById(0x7f0800ef);
        mName = (TextView)findViewById(0x7f0800e4);
        mPhoneNumber = (TextView)findViewById(0x7f08001c);
        mLabel = (TextView)findViewById(0x7f0800e6);
        mCallTypeLabel = (TextView)findViewById(0x7f0800e8);
        mMainCallBanner = (ViewGroup)findViewById(0x7f08010c);
        mCallStateLabel = (TextView)findViewById(0x7f0800ee);
        mPhoneNumberGeoDescription = (TextView)findViewById(0x7f0800e7);
        mVtCallStateAndSimIndicate = (ViewGroup)findViewById(0x7f08010d);
    }
}
