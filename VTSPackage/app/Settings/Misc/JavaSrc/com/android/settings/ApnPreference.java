// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.*;
import android.preference.Preference;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;

public class ApnPreference extends Preference
    implements android.widget.CompoundButton.OnCheckedChangeListener, android.view.View.OnClickListener
{

    static final String TAG = "ApnPreference";
    private static CompoundButton sCurrentChecked = null;
    private static boolean sIsCU = false;
    private static String sSelectedKey = null;
    private boolean mEditable;
    private boolean mProtectFromCheckedChange;
    private boolean mSelectable;
    private int mSimId;
    private int mSourceType;

    public ApnPreference(Context context)
    {
        super(context);
        mProtectFromCheckedChange = false;
        mSelectable = true;
        mSourceType = 2;
        mSimId = 0;
        mEditable = true;
        init();
    }

    public ApnPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mProtectFromCheckedChange = false;
        mSelectable = true;
        mSourceType = 2;
        mSimId = 0;
        mEditable = true;
        init();
    }

    public ApnPreference(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mProtectFromCheckedChange = false;
        mSelectable = true;
        mSourceType = 2;
        mSimId = 0;
        mEditable = true;
        init();
    }

    private void init()
    {
        setLayoutResource(0x7f040006);
    }

    public boolean getSelectable()
    {
        return mSelectable;
    }

    public int getSourceType()
    {
        return mSourceType;
    }

    public View getView(View view, ViewGroup viewgroup)
    {
        View view1 = super.getView(view, viewgroup);
        View view2 = view1.findViewById(0x1010001);
        if (view2 != null && (view2 instanceof RadioButton))
        {
            RadioButton radiobutton = (RadioButton)view2;
            if (mSelectable)
            {
                radiobutton.setOnCheckedChangeListener(this);
                boolean flag = getKey().equals(sSelectedKey);
                if (flag)
                {
                    sCurrentChecked = radiobutton;
                    sSelectedKey = getKey();
                }
                mProtectFromCheckedChange = true;
                radiobutton.setChecked(flag);
                mProtectFromCheckedChange = false;
            } else
            {
                radiobutton.setVisibility(8);
            }
        }
        View view3 = view1.findViewById(0x1010000);
        if (view3 != null && (view3 instanceof RelativeLayout))
            view3.setOnClickListener(this);
        return view1;
    }

    public boolean isChecked()
    {
        return getKey().equals(sSelectedKey);
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        Log.i("ApnPreference", (new StringBuilder()).append("ID: ").append(getKey()).append(" :").append(flag).toString());
        if (mProtectFromCheckedChange)
            return;
        if (flag)
        {
            if (sCurrentChecked != null)
                sCurrentChecked.setChecked(false);
            sCurrentChecked = compoundbutton;
            sSelectedKey = getKey();
            callChangeListener(sSelectedKey);
            return;
        } else
        {
            sCurrentChecked = null;
            sSelectedKey = null;
            return;
        }
    }

    public void onClick(View view)
    {
        if (view != null && 0x1010000 == view.getId())
        {
            Context context = getContext();
            if (context != null)
            {
                int i = Integer.parseInt(getKey());
                android.net.Uri uri;
                switch (mSimId)
                {
                case 3: // '\003'
                    uri = android.provider.Telephony.Carriers.SIM4Carriers.CONTENT_URI;
                    break;

                case 2: // '\002'
                    uri = android.provider.Telephony.Carriers.SIM3Carriers.CONTENT_URI;
                    break;

                case 1: // '\001'
                    uri = android.provider.Telephony.Carriers.SIM2Carriers.CONTENT_URI;
                    break;

                case 0: // '\0'
                    uri = android.provider.Telephony.Carriers.SIM1Carriers.CONTENT_URI;
                    break;

                default:
                    Log.d("ApnPreference", (new StringBuilder()).append("error need to check mSimId = ").append(mSimId).toString());
                    uri = android.provider.Telephony.Carriers.SIM1Carriers.CONTENT_URI;
                    break;
                }
                Intent intent = new Intent("android.intent.action.EDIT", ContentUris.withAppendedId(uri, i));
                intent.putExtra("simId", mSimId);
                boolean flag;
                if (!mEditable)
                    flag = true;
                else
                    flag = false;
                intent.putExtra("readOnly", flag);
                context.startActivity(intent);
            }
        }
    }

    public void setApnEditable(boolean flag)
    {
        mEditable = flag;
    }

    public void setChecked()
    {
        sSelectedKey = getKey();
    }

    public void setSelectable(boolean flag)
    {
        mSelectable = flag;
    }

    public void setSimId(int i)
    {
        mSimId = i;
    }

    public void setSourceType(int i)
    {
        mSourceType = i;
    }

}
