// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.deviceinfo;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Paint;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RectShape;
import android.preference.Preference;

public class StorageItemPreference extends Preference
{

    public final int color;
    public final int userHandle;

    public StorageItemPreference(Context context, int i, int j)
    {
        this(context, context.getText(i), j, -10000);
    }

    public StorageItemPreference(Context context, CharSequence charsequence, int i, int j)
    {
        super(context);
        if (i != 0)
        {
            color = context.getResources().getColor(i);
            Resources resources = context.getResources();
            setIcon(createRectShape(resources.getDimensionPixelSize(0x7f0d0000), resources.getDimensionPixelSize(0x7f0d0001), color));
        } else
        {
            color = -65281;
        }
        setTitle(charsequence);
        setSummary(0x7f0b0566);
        userHandle = j;
    }

    private static ShapeDrawable createRectShape(int i, int j, int k)
    {
        ShapeDrawable shapedrawable = new ShapeDrawable(new RectShape());
        shapedrawable.setIntrinsicHeight(j);
        shapedrawable.setIntrinsicWidth(i);
        shapedrawable.getPaint().setColor(k);
        return shapedrawable;
    }
}
