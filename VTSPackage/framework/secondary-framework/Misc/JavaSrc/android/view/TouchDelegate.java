// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.graphics.Rect;

// Referenced classes of package android.view:
//            View, ViewConfiguration, MotionEvent

public class TouchDelegate
{

    public static final int ABOVE = 1;
    public static final int BELOW = 2;
    public static final int TO_LEFT = 4;
    public static final int TO_RIGHT = 8;
    private Rect mBounds;
    private boolean mDelegateTargeted;
    private View mDelegateView;
    private int mSlop;
    private Rect mSlopBounds;

    public TouchDelegate(Rect rect, View view)
    {
        mBounds = rect;
        mSlop = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
        mSlopBounds = new Rect(rect);
        mSlopBounds.inset(-mSlop, -mSlop);
        mDelegateView = view;
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        int i = (int)motionevent.getX();
        int j = (int)motionevent.getY();
        boolean flag = true;
        int k = motionevent.getAction();
        boolean flag1 = false;
        switch (k)
        {
        default:
            break;

        case 3: // '\003'
            flag1 = mDelegateTargeted;
            mDelegateTargeted = false;
            break;

        case 1: // '\001'
        case 2: // '\002'
            flag1 = mDelegateTargeted;
            if (flag1 && !mSlopBounds.contains(i, j))
                flag = false;
            break;

        case 0: // '\0'
            boolean flag3 = mBounds.contains(i, j);
            flag1 = false;
            if (flag3)
            {
                mDelegateTargeted = true;
                flag1 = true;
            }
            break;
        }
        boolean flag2 = false;
        if (flag1)
        {
            View view = mDelegateView;
            if (flag)
            {
                motionevent.setLocation(view.getWidth() / 2, view.getHeight() / 2);
            } else
            {
                int l = mSlop;
                motionevent.setLocation(-(l * 2), -(l * 2));
            }
            flag2 = view.dispatchTouchEvent(motionevent);
        }
        return flag2;
    }
}
