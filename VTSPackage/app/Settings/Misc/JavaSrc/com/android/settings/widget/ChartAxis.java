// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.widget;

import android.content.res.Resources;
import android.text.SpannableStringBuilder;

public interface ChartAxis
{

    public abstract long buildLabel(Resources resources, SpannableStringBuilder spannablestringbuilder, long l);

    public abstract float convertToPoint(long l);

    public abstract long convertToValue(float f);

    public abstract float[] getTickPoints();

    public abstract boolean setBounds(long l, long l1);

    public abstract boolean setSize(float f);

    public abstract int shouldAdjustAxis(long l);
}
