// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.support.v4.view;

import android.os.Bundle;
import android.view.View;

public class ViewCompatJB
{


    public static Object getAccessibilityNodeProvider(View view)
    {
        return view.getAccessibilityNodeProvider();
    }

    public static int getImportantForAccessibility(View view)
    {
        return view.getImportantForAccessibility();
    }

    public static boolean hasTransientState(View view)
    {
        return view.hasTransientState();
    }

    public static boolean performAccessibilityAction(View view, int i, Bundle bundle)
    {
        return view.performAccessibilityAction(i, bundle);
    }

    public static void postInvalidateOnAnimation(View view)
    {
        view.postInvalidateOnAnimation();
    }

    public static void postInvalidateOnAnimation(View view, int i, int j, int k, int l)
    {
        view.postInvalidate(i, j, k, l);
    }

    public static void postOnAnimation(View view, Runnable runnable)
    {
        view.postOnAnimation(runnable);
    }

    public static void postOnAnimationDelayed(View view, Runnable runnable, long l)
    {
        view.postOnAnimationDelayed(runnable, l);
    }

    public static void setHasTransientState(View view, boolean flag)
    {
        view.setHasTransientState(flag);
    }

    public static void setImportantForAccessibility(View view, int i)
    {
        view.setImportantForAccessibility(i);
    }
}
