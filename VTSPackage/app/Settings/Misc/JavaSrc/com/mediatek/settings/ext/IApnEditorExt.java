// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.preference.DialogPreference;

public interface IApnEditorExt
{

    public static final String CMCC_CARD_1 = "46000";
    public static final String CMCC_CARD_2 = "46002";
    public static final String CMCC_CARD_3 = "46007";

    public abstract String[] getApnTypeArray(Context context, int i, int j, int k);

    public abstract String[] getApnTypeArrayByCard(Context context, String s, boolean flag, int i, int j, int k, String as[]);

    public abstract Uri getUriFromIntent(Context context, Intent intent);

    public abstract void setPreferenceState(DialogPreference dialogpreference);
}
