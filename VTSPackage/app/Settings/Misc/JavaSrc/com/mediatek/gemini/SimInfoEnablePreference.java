// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.gemini;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.Switch;

// Referenced classes of package com.mediatek.gemini:
//            SimInfoPreference

public class SimInfoEnablePreference extends SimInfoPreference
    implements android.view.View.OnClickListener
{
    static interface OnPreferenceClickCallback
    {

        public abstract void onPreferenceClick(long l);
    }


    private static final String TAG = "SimInfoEnablePreference";
    private OnPreferenceClickCallback mClickCallback;
    private Context mContext;
    private boolean mDisableSwitch;
    private boolean mRadioOn;
    private android.widget.CompoundButton.OnCheckedChangeListener mSwitchChangeListener;

    public SimInfoEnablePreference(Context context, String s, String s1, int i, int j, int k, int l, 
            long l1, boolean flag)
    {
        super(context, s, s1, i, j, k, l, l1, true);
        mContext = context;
        mRadioOn = true;
        mDisableSwitch = flag;
        setLayoutResource(0x7f040074);
    }

    public View getView(View view, ViewGroup viewgroup)
    {
        boolean flag = true;
        View view1 = super.getView(view, viewgroup);
        Switch switch1 = (Switch)view1.findViewById(0x7f08011c);
        if (switch1 != null && mSwitchChangeListener != null)
        {
            switch1.setClickable(flag);
            if (mDisableSwitch)
                flag = false;
            switch1.setEnabled(flag);
            switch1.setOnCheckedChangeListener(mSwitchChangeListener);
        }
        View view2 = view1.findViewById(0x7f08011d);
        if (view2 != null && (view2 instanceof LinearLayout))
            view2.setOnClickListener(this);
        return view1;
    }

    boolean isRadioOn()
    {
        return mRadioOn;
    }

    public void onClick(View view)
    {
        if (view != null && view.getId() != 0x7f08011c && mClickCallback != null)
        {
            mClickCallback.onPreferenceClick(Long.valueOf(getKey()).longValue());
            return;
        } else
        {
            return;
        }
    }

    void setCheckBoxClickListener(android.widget.CompoundButton.OnCheckedChangeListener oncheckedchangelistener)
    {
        mSwitchChangeListener = oncheckedchangelistener;
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
