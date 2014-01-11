// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui;

import android.content.Context;
import android.content.res.Configuration;
import java.io.FileDescriptor;
import java.io.PrintWriter;

public abstract class SystemUI
{

    public Context mContext;


    public void dump(FileDescriptor filedescriptor, PrintWriter printwriter, String as[])
    {
    }

    protected void onConfigurationChanged(Configuration configuration)
    {
    }

    public abstract void start();
}
