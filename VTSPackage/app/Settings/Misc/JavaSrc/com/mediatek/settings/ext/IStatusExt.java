// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.content.IntentFilter;
import android.preference.Preference;

public interface IStatusExt
{

    public abstract void addAction(IntentFilter intentfilter, String s);

    public abstract void updateOpNameFromRec(Preference preference, String s);

    public abstract void updateServiceState(Preference preference, String s);
}
