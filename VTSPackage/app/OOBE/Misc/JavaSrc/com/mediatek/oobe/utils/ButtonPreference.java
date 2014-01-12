// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.utils;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.Button;

public class ButtonPreference extends Preference
{
    public static interface PrefButtonClickedListener
    {

        public abstract void onPreButtonClicked();
    }


    private static final String TAG = "OOBE/ButtonPreference";
    private Button mAddNetworkButton;
    public android.view.View.OnClickListener mButtonClickListener = new android.view.View.OnClickListener() {

        final ButtonPreference this$0;

        public void onClick(View view)
        {
            if (view == mAddNetworkButton && mPrefButtonClickedListener != null)
                mPrefButtonClickedListener.onPreButtonClicked();
        }

            
            {
                this$0 = ButtonPreference.this;
                super();
            }
    }
;
    private PrefButtonClickedListener mPrefButtonClickedListener;

    public ButtonPreference(Context context)
    {
        super(context);
    }

    public ButtonPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        setLayoutResource(0x7f03000a);
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        mAddNetworkButton = (Button)view.findViewById(0x7f0b001b);
        mAddNetworkButton.setOnClickListener(mButtonClickListener);
    }

    public void setPrefButtonCallback(PrefButtonClickedListener prefbuttonclickedlistener)
    {
        mPrefButtonClickedListener = prefbuttonclickedlistener;
    }


}
