// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.util.AttributeSet;

// Referenced classes of package android.widget:
//            MultiAutoCompleteTextView

public class MTKMultiAutoCompleteTextView extends MultiAutoCompleteTextView
{

    public MTKMultiAutoCompleteTextView(Context context)
    {
        super(context);
    }

    public MTKMultiAutoCompleteTextView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    public MTKMultiAutoCompleteTextView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
    }

    public int mtkGetMaxLines()
    {
        return super.getMaxLines();
    }

    public final void mtkSetShowSoftInputOnFocus(boolean flag)
    {
        super.setShowSoftInputOnFocus(flag);
    }
}
