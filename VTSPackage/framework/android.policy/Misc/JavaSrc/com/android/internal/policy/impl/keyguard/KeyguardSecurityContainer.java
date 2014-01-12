// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.FrameLayout;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardSecurityViewFlipper

public class KeyguardSecurityContainer extends FrameLayout
{

    public KeyguardSecurityContainer(Context context)
    {
        this(null, null, 0);
    }

    public KeyguardSecurityContainer(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public KeyguardSecurityContainer(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
    }

    KeyguardSecurityViewFlipper getFlipper()
    {
        for (int i = 0; i < getChildCount(); i++)
        {
            android.view.View view = getChildAt(i);
            if (view instanceof KeyguardSecurityViewFlipper)
                return (KeyguardSecurityViewFlipper)view;
        }

        return null;
    }

    public void hideBouncer(int i)
    {
        KeyguardSecurityViewFlipper keyguardsecurityviewflipper = getFlipper();
        if (keyguardsecurityviewflipper != null)
            keyguardsecurityviewflipper.hideBouncer(i);
    }

    public void setClipChildrenForNewEventView(boolean flag)
    {
        setClipChildren(flag);
        KeyguardSecurityViewFlipper keyguardsecurityviewflipper = getFlipper();
        if (keyguardsecurityviewflipper != null)
            keyguardsecurityviewflipper.setClipChildrenForNewEventView(flag);
    }

    public void showBouncer(int i)
    {
        KeyguardSecurityViewFlipper keyguardsecurityviewflipper = getFlipper();
        if (keyguardsecurityviewflipper != null)
            keyguardsecurityviewflipper.showBouncer(i);
    }
}
