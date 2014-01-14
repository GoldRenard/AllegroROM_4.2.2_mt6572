// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.wifi.hotspot;

import android.content.Context;
import android.net.wifi.HotspotClient;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.Button;

public class ButtonPreference extends Preference
    implements android.view.View.OnClickListener
{
    static interface OnButtonClickCallback
    {

        public abstract void onClick(View view, HotspotClient hotspotclient);
    }


    private Button mButton;
    private OnButtonClickCallback mCallBack;
    private HotspotClient mHotspotClient;
    private String mIpAddress;
    private String mMacAddress;
    private String mText;

    public ButtonPreference(Context context, HotspotClient hotspotclient, OnButtonClickCallback onbuttonclickcallback)
    {
        super(context);
        setWidgetLayoutResource(0x7f04005f);
        mHotspotClient = hotspotclient;
        mCallBack = onbuttonclickcallback;
    }

    public ButtonPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        setWidgetLayoutResource(0x7f04005f);
    }

    public ButtonPreference(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        setWidgetLayoutResource(0x7f04005f);
    }

    public String getMacAddress()
    {
        return mMacAddress;
    }

    public boolean isBlocked()
    {
        return mHotspotClient.isBlocked;
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        mButton = (Button)view.findViewById(0x7f0800ef);
        mButton.setText(mText);
        mButton.setFocusable(false);
        mButton.setOnClickListener(this);
    }

    public void onClick(View view)
    {
        if (view != null && mCallBack != null)
        {
            mCallBack.onClick(view, mHotspotClient);
            return;
        } else
        {
            return;
        }
    }

    public void setButtonText(String s)
    {
        mText = s;
        notifyChanged();
    }

    public void setMacAddress(String s)
    {
        mMacAddress = s;
        setTitle(mMacAddress);
    }
}
