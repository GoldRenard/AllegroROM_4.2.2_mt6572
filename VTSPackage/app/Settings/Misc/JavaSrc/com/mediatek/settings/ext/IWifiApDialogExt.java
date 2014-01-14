// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.content.Context;
import android.widget.Spinner;

public interface IWifiApDialogExt
{

    public abstract int getSecurityType(int i);

    public abstract int getSelection(int i);

    public abstract void setAdapter(Context context, Spinner spinner, int i);
}
