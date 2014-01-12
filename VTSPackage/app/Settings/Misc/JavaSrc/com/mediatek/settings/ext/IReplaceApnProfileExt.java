// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;

public interface IReplaceApnProfileExt
{

    public abstract long replaceApn(Context context, Uri uri, String s, String s1, String s2, ContentValues contentvalues, String s3);
}
