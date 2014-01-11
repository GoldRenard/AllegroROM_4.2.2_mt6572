// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;


public interface ScreenStateChangeListener
{

    public static final int SCREEN_ENTER = 0;
    public static final int SCREEN_LEAVE = 4;
    public static final int SCREEN_PASS = 8;

    public abstract void onScreenStateChanged(int i, int j);
}
