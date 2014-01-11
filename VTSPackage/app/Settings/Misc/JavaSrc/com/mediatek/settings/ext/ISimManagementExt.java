// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.content.Intent;
import android.preference.*;

public interface ISimManagementExt
{

    public abstract void dealWithDataConnChanged(Intent intent, boolean flag);

    public abstract String getAutoString();

    public abstract boolean isNeedsetAutoItem();

    public abstract void setPrefProperty(DialogPreference dialogpreference, long l);

    public abstract void setToClosedSimSlot(int i);

    public abstract void showChangeDataConnDialog(PreferenceFragment preferencefragment, boolean flag);

    public abstract void updateDefaultSIMSummary(DialogPreference dialogpreference, Long long1);

    public abstract void updateSimEditorPref(PreferenceFragment preferencefragment);

    public abstract void updateSimManagementPref(PreferenceGroup preferencegroup);
}
