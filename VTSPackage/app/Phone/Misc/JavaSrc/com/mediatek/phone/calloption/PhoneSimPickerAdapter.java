// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.calloption;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.mediatek.calloption.SimPickerAdapter;

public class PhoneSimPickerAdapter extends SimPickerAdapter
{

    public PhoneSimPickerAdapter(Context context, long l, boolean flag)
    {
        super(context, l, flag);
    }

    protected View createView(com.mediatek.calloption.SimPickerAdapter.ViewHolder viewholder, int i)
    {
        View view1;
label0:
        {
            LayoutInflater layoutinflater = LayoutInflater.from(super.mContext);
            if (i == 0)
            {
                view1 = layoutinflater.inflate(0x7f04003a, null);
                viewholder.mSimSignal = (TextView)view1.findViewById(0x7f080100);
                viewholder.mSimStatus = (ImageView)view1.findViewById(0x7f0800cc);
                viewholder.mShortPhoneNumber = (TextView)view1.findViewById(0x7f080101);
                viewholder.mDisplayName = (TextView)view1.findViewById(0x7f08001b);
                viewholder.mPhoneNumber = (TextView)view1.findViewById(0x7f08001c);
                viewholder.mSimIcon = view1.findViewById(0x7f0800cb);
                viewholder.mSuggested = (ImageView)view1.findViewById(0x7f080102);
                break label0;
            }
            if (i == 1)
            {
                View view2 = layoutinflater.inflate(0x7f04003b, null);
                viewholder.mInternetIcon = (ImageView)view2.findViewById(0x7f080103);
                return view2;
            }
            if (i != 2)
            {
                view1 = null;
                if (i != 3)
                    break label0;
            }
            View view = layoutinflater.inflate(0x7f04003c, null);
            viewholder.mText = (TextView)view.findViewById(0x7f080104);
            return view;
        }
        return view1;
    }
}
