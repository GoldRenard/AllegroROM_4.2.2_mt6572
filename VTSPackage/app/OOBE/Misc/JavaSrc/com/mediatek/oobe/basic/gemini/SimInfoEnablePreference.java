// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic.gemini;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.LinearLayout;

// Referenced classes of package com.mediatek.oobe.basic.gemini:
//            SimInfoPreference

public class SimInfoEnablePreference extends SimInfoPreference
    implements android.view.View.OnClickListener
{
    static interface OnPreferenceClickCallback
    {

        public abstract void onPreferenceClick(long l);
    }


    private static final String TAG = "SimInfoEnablePreference";
    private android.view.View.OnClickListener mCheckBoxClickListener;
    private OnPreferenceClickCallback mClickCallback;
    private boolean mRadioOn;

    public SimInfoEnablePreference(Context context, String s, String s1, int i, int j, int k, int l, 
            long l1)
    {
        super(context, s, s1, i, j, k, l, l1, false);
        mRadioOn = true;
        setLayoutResource(0x7f030012);
    }

    public View getView(View view, ViewGroup viewgroup)
    {
        View view1 = super.getView(view, viewgroup);
        CheckBox checkbox = (CheckBox)view1.findViewById(0x7f0b0023);
        if (checkbox != null && mCheckBoxClickListener != null)
        {
            checkbox.setClickable(true);
            checkbox.setFocusable(true);
            checkbox.setOnClickListener(mCheckBoxClickListener);
        }
        View view2 = view1.findViewById(0x7f0b002d);
        if (view2 != null && (view2 instanceof LinearLayout))
        {
            view2.setOnClickListener(this);
            view2.setFocusable(true);
        }
        return view1;
    }

    boolean isRadioOn()
    {
        return mRadioOn;
    }

    public void onClick(View view)
    {
        if (view != null && view.getId() != 0x7f0b0023 && mClickCallback != null)
        {
            mClickCallback.onPreferenceClick(Long.valueOf(getKey()).longValue());
            return;
        } else
        {
            return;
        }
    }

    void setCheckBoxClickListener(android.view.View.OnClickListener onclicklistener)
    {
        mCheckBoxClickListener = onclicklistener;
    }

    void setClickCallback(OnPreferenceClickCallback onpreferenceclickcallback)
    {
        mClickCallback = onpreferenceclickcallback;
    }

    void setRadioOn(boolean flag)
    {
        mRadioOn = flag;
    }
}
