// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.screenshot;

import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;

class SaveImageInBackgroundData
{

    Context context;
    Runnable finisher;
    int iconSize;
    Bitmap image;
    Uri imageUri;
    int result;

}
