// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.providers.settings.ext;

import android.content.Context;

public interface IDatabaseHelperExt
{

    public abstract String getResBoolean(Context context, String s, int i);

    public abstract String getResFraction(Context context, String s, int i, int j);

    public abstract String getResInteger(Context context, String s, int i);

    public abstract String getResStr(Context context, String s, int i);
}
