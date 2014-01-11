// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.view.View;

public final class Space extends View
{

    public Space(Context context)
    {
        this(context, null);
    }

    public Space(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public Space(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        if (getVisibility() == 0)
            setVisibility(4);
    }

    private static int getDefaultSize2(int i, int j)
    {
        int k = android.view.View.MeasureSpec.getMode(j);
        int l = android.view.View.MeasureSpec.getSize(j);
        switch (k)
        {
        case 1073741824: 
            return l;

        case -2147483648: 
            return Math.min(i, l);

        case 0: // '\0'
            return i;
        }
        return i;
    }

    public void draw(Canvas canvas)
    {
    }

    protected void onMeasure(int i, int j)
    {
        setMeasuredDimension(getDefaultSize2(getSuggestedMinimumWidth(), i), getDefaultSize2(getSuggestedMinimumHeight(), j));
    }
}
