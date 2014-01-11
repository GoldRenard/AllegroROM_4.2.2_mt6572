// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;


public class SoundEffectConstants
{

    public static final int CLICK = 0;
    public static final int NAVIGATION_DOWN = 4;
    public static final int NAVIGATION_LEFT = 1;
    public static final int NAVIGATION_RIGHT = 3;
    public static final int NAVIGATION_UP = 2;

    private SoundEffectConstants()
    {
    }

    public static int getContantForFocusDirection(int i)
    {
        switch (i)
        {
        case 1: // '\001'
        case 33: // '!'
            return 2;

        case 17: // '\021'
            return 1;

        case 2: // '\002'
        case 130: 
            return 4;

        case 66: // 'B'
            return 3;
        }
        throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT, FOCUS_FORWARD, FOCUS_BACKWARD}.");
    }
}
