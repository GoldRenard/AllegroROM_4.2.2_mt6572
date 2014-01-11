// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.gemini;

import android.app.Dialog;
import android.content.Context;
import android.content.res.Resources;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.mediatek.xlog.Xlog;
import java.util.*;

public class ColorPickerPreference extends DialogPreference
    implements android.view.View.OnClickListener
{

    private static final int COLORID[] = {
        0x7f080031, 0x7f080032, 0x7f080033, 0x7f080034
    };
    private static final int COLOR_SIZE = 8;
    private static final int SIM_COLOR[] = {
        0x7f0a0016, 0x7f0a0017, 0x7f0a0018, 0x7f0a0019
    };
    private static final String TAG = "ColorPicker";
    private final Context mContext;
    private int mCurrentSelected;
    private final List mCurrentUsed = new ArrayList();
    private int mInitValue;
    private long mSimID;

    public ColorPickerPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mCurrentSelected = -1;
        mInitValue = -1;
        mSimID = -1L;
        mContext = context;
        setLayoutResource(0x7f040060);
        setDialogLayoutResource(0x7f040018);
        setNegativeButtonText(0x1040000);
    }

    public View getView(View view, ViewGroup viewgroup)
    {
        View view1 = super.getView(view, viewgroup);
        if (view1 != null)
        {
            TextView textview = (TextView)view1.findViewById(0x1020010);
            if (textview != null)
                textview.setVisibility(8);
            ImageView imageview = (ImageView)view1.findViewById(0x7f0800f0);
            if (imageview != null)
                imageview.setBackgroundColor(mContext.getResources().getColor(SIM_COLOR[mCurrentSelected]));
        }
        return view1;
    }

    protected void onBindDialogView(View view)
    {
        super.onBindDialogView(view);
        Iterator iterator = android.provider.Telephony.SIMInfo.getInsertedSIMList(mContext).iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
            if (siminfo != null)
            {
                Xlog.i("ColorPicker", (new StringBuilder()).append("current used =").append(Integer.valueOf(siminfo.mColor)).toString());
                ImageView imageview = (ImageView)view.findViewById(COLORID[siminfo.mColor]);
                if (mSimID == siminfo.mSimId)
                {
                    mCurrentSelected = siminfo.mColor;
                    mInitValue = siminfo.mColor;
                    imageview.setBackgroundResource(0x7f020024);
                } else
                {
                    mCurrentUsed.add(Integer.valueOf(siminfo.mColor));
                    if (siminfo.mColor != mCurrentSelected)
                        imageview.setBackgroundResource(0x7f020025);
                }
            }
        } while (true);
        for (int i = 0; i < COLORID.length; i++)
            ((ImageView)view.findViewById(COLORID[i])).setOnClickListener(this);

    }

    public void onClick(View view)
    {
        int i = view.getId();
        if (view instanceof ImageView)
        {
            for (int j = 0; j < COLORID.length; j++)
                if (COLORID[j] == i)
                {
                    mCurrentSelected = j;
                    Xlog.i("ColorPicker", (new StringBuilder()).append("mCurrentSelected is ").append(j).toString());
                }

            onClick(((android.content.DialogInterface) (getDialog())), -1);
            getDialog().dismiss();
        }
    }

    protected void onDialogClosed(boolean flag)
    {
        super.onDialogClosed(flag);
        Xlog.i("ColorPicker", (new StringBuilder()).append("positiveResult is ").append(flag).append(" mCurrentSelected is ").append(mCurrentSelected).append(" mInitValue is ").append(mInitValue).toString());
        if (flag && mCurrentSelected >= 0 && mCurrentSelected != mInitValue)
        {
            callChangeListener(Integer.valueOf(mCurrentSelected));
            notifyChanged();
        }
    }

    protected void onPrepareDialogBuilder(android.app.AlertDialog.Builder builder)
    {
        super.onPrepareDialogBuilder(builder);
        builder.setInverseBackgroundForced(true);
        builder.setPositiveButton(null, null);
    }

    public void setInitValue(int i)
    {
        mCurrentSelected = i;
        mInitValue = i;
    }

    public void setSimID(long l)
    {
        mSimID = l;
    }

}
