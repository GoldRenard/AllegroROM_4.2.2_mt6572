// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.applications;

import android.view.LayoutInflater;
import android.view.View;
import android.widget.*;

public class AppViewHolder
{

    public ImageView appIcon;
    public TextView appName;
    public TextView appSize;
    public CheckBox checkBox;
    public TextView disabled;
    public ApplicationsState.AppEntry entry;
    public View rootView;


    public static AppViewHolder createOrRecycle(LayoutInflater layoutinflater, View view)
    {
        if (view == null)
        {
            View view1 = layoutinflater.inflate(0x7f040047, null);
            AppViewHolder appviewholder = new AppViewHolder();
            appviewholder.rootView = view1;
            appviewholder.appName = (TextView)view1.findViewById(0x7f0800c8);
            appviewholder.appIcon = (ImageView)view1.findViewById(0x7f080056);
            appviewholder.appSize = (TextView)view1.findViewById(0x7f0800ca);
            appviewholder.disabled = (TextView)view1.findViewById(0x7f0800cb);
            appviewholder.checkBox = (CheckBox)view1.findViewById(0x7f0800c9);
            view1.setTag(appviewholder);
            return appviewholder;
        } else
        {
            return (AppViewHolder)view.getTag();
        }
    }

    void updateSizeText(CharSequence charsequence, int i)
    {
        if (entry.sizeStr != null)
            switch (i)
            {
            case 2: // '\002'
                appSize.setText(entry.externalSizeStr);
                return;

            case 1: // '\001'
                appSize.setText(entry.internalSizeStr);
                return;

            default:
                appSize.setText(entry.sizeStr);
                break;
            }
        else
        if (entry.size == -2L)
        {
            appSize.setText(charsequence);
            return;
        }
    }
}
