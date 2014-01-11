// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.recent;

import android.view.View;

public interface RecentsCallback
{

    public static final int SWIPE_DOWN = 3;
    public static final int SWIPE_LEFT = 0;
    public static final int SWIPE_RIGHT = 1;
    public static final int SWIPE_UP = 2;

    public abstract void dismiss();

    public abstract void handleLongPress(View view, View view1, View view2);

    public abstract void handleOnClick(View view);

    public abstract void handleSwipe(View view);
}
