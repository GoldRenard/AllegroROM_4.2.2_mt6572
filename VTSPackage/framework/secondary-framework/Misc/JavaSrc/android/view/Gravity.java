// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.graphics.Rect;

public class Gravity
{

    public static final int AXIS_CLIP = 8;
    public static final int AXIS_PULL_AFTER = 4;
    public static final int AXIS_PULL_BEFORE = 2;
    public static final int AXIS_SPECIFIED = 1;
    public static final int AXIS_X_SHIFT = 0;
    public static final int AXIS_Y_SHIFT = 4;
    public static final int BOTTOM = 80;
    public static final int CENTER = 17;
    public static final int CENTER_HORIZONTAL = 1;
    public static final int CENTER_VERTICAL = 16;
    public static final int CLIP_HORIZONTAL = 8;
    public static final int CLIP_VERTICAL = 128;
    public static final int DISPLAY_CLIP_HORIZONTAL = 0x1000000;
    public static final int DISPLAY_CLIP_VERTICAL = 0x10000000;
    public static final int END = 0x800005;
    public static final int FILL = 119;
    public static final int FILL_HORIZONTAL = 7;
    public static final int FILL_VERTICAL = 112;
    public static final int HORIZONTAL_GRAVITY_MASK = 7;
    public static final int LEFT = 3;
    public static final int NO_GRAVITY = 0;
    public static final int RELATIVE_HORIZONTAL_GRAVITY_MASK = 0x800007;
    public static final int RELATIVE_LAYOUT_DIRECTION = 0x800000;
    public static final int RIGHT = 5;
    public static final int START = 0x800003;
    public static final int TOP = 48;
    public static final int VERTICAL_GRAVITY_MASK = 112;


    public static void apply(int i, int j, int k, Rect rect, int l, int i1, Rect rect1)
    {
        switch (i & 6)
        {
        case 4: // '\004'
            rect1.right = rect.right - l;
            rect1.left = rect1.right - j;
            if ((i & 8) == 8 && rect1.left < rect.left)
                rect1.left = rect.left;
            break;

        case 2: // '\002'
            rect1.left = l + rect.left;
            rect1.right = j + rect1.left;
            if ((i & 8) == 8 && rect1.right > rect.right)
                rect1.right = rect.right;
            break;

        case 0: // '\0'
            rect1.left = l + (rect.left + (rect.right - rect.left - j) / 2);
            rect1.right = j + rect1.left;
            if ((i & 8) == 8)
            {
                if (rect1.left < rect.left)
                    rect1.left = rect.left;
                if (rect1.right > rect.right)
                    rect1.right = rect.right;
            }
            break;

        case 1: // '\001'
        case 3: // '\003'
        default:
            rect1.left = l + rect.left;
            rect1.right = l + rect.right;
            break;
        }
        switch (i & 0x60)
        {
        case 64: // '@'
            rect1.bottom = rect.bottom - i1;
            rect1.top = rect1.bottom - k;
            if ((i & 0x80) == 128 && rect1.top < rect.top)
            {
                rect1.top = rect.top;
                return;
            }
            break;

        case 32: // ' '
            rect1.top = i1 + rect.top;
            rect1.bottom = k + rect1.top;
            if ((i & 0x80) == 128 && rect1.bottom > rect.bottom)
            {
                rect1.bottom = rect.bottom;
                return;
            }
            break;

        case 0: // '\0'
            rect1.top = i1 + (rect.top + (rect.bottom - rect.top - k) / 2);
            rect1.bottom = k + rect1.top;
            if ((i & 0x80) != 128)
                break;
            if (rect1.top < rect.top)
                rect1.top = rect.top;
            if (rect1.bottom > rect.bottom)
            {
                rect1.bottom = rect.bottom;
                return;
            }
            break;

        default:
            rect1.top = i1 + rect.top;
            rect1.bottom = i1 + rect.bottom;
            break;
        }
    }

    public static void apply(int i, int j, int k, Rect rect, int l, int i1, Rect rect1, int j1)
    {
        apply(getAbsoluteGravity(i, j1), j, k, rect, l, i1, rect1);
    }

    public static void apply(int i, int j, int k, Rect rect, Rect rect1)
    {
        apply(i, j, k, rect, 0, 0, rect1);
    }

    public static void apply(int i, int j, int k, Rect rect, Rect rect1, int l)
    {
        apply(getAbsoluteGravity(i, l), j, k, rect, 0, 0, rect1);
    }

    public static void applyDisplay(int i, Rect rect, Rect rect1)
    {
        if ((0x10000000 & i) != 0)
        {
            if (rect1.top < rect.top)
                rect1.top = rect.top;
            if (rect1.bottom > rect.bottom)
                rect1.bottom = rect.bottom;
        } else
        {
            int l;
            if (rect1.top < rect.top)
            {
                l = rect.top - rect1.top;
            } else
            {
                int j = rect1.bottom;
                int k = rect.bottom;
                l = 0;
                if (j > k)
                    l = rect.bottom - rect1.bottom;
            }
            if (l != 0)
                if (rect1.height() > rect.bottom - rect.top)
                {
                    rect1.top = rect.top;
                    rect1.bottom = rect.bottom;
                } else
                {
                    rect1.top = l + rect1.top;
                    rect1.bottom = l + rect1.bottom;
                }
        }
        if ((0x1000000 & i) != 0)
        {
            if (rect1.left < rect.left)
                rect1.left = rect.left;
            if (rect1.right > rect.right)
                rect1.right = rect.right;
        } else
        {
            int k1;
            if (rect1.left < rect.left)
            {
                k1 = rect.left - rect1.left;
            } else
            {
                int i1 = rect1.right;
                int j1 = rect.right;
                k1 = 0;
                if (i1 > j1)
                    k1 = rect.right - rect1.right;
            }
            if (k1 != 0)
                if (rect1.width() > rect.right - rect.left)
                {
                    rect1.left = rect.left;
                    rect1.right = rect.right;
                    return;
                } else
                {
                    rect1.left = k1 + rect1.left;
                    rect1.right = k1 + rect1.right;
                    return;
                }
        }
    }

    public static void applyDisplay(int i, Rect rect, Rect rect1, int j)
    {
        applyDisplay(getAbsoluteGravity(i, j), rect, rect1);
    }

    public static int getAbsoluteGravity(int i, int j)
    {
        int k = i;
        if ((0x800000 & k) > 0)
        {
            if ((k & 0x800003) == 0x800003)
            {
                int i1 = k & 0xff7ffffc;
                if (j == 1)
                    k = i1 | 5;
                else
                    k = i1 | 3;
            } else
            if ((k & 0x800005) == 0x800005)
            {
                int l = k & 0xff7ffffa;
                if (j == 1)
                    k = l | 3;
                else
                    k = l | 5;
            }
            k &= 0xff7fffff;
        }
        return k;
    }

    public static boolean isHorizontal(int i)
    {
        return i > 0 && (0x800007 & i) != 0;
    }

    public static boolean isVertical(int i)
    {
        return i > 0 && (i & 0x70) != 0;
    }
}
