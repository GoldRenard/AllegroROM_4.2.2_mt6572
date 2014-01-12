// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.ext;

import android.preference.DialogPreference;

public interface ISimManagementExt
{

    public abstract String getAutoString();

    public abstract boolean isNeedsetAutoItem();

    public abstract void setPrefProperty(DialogPreference dialogpreference, long l);

    public abstract void updateDefaultSIMSummary(DialogPreference dialogpreference, Long long1);
}
