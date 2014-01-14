// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import java.util.ArrayList;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            UnReadEventView, UnReadHintAnimation, LockScreenNewEventView

public class LockScreenLayout extends FrameLayout
{
    public static class LayoutParams extends android.widget.FrameLayout.LayoutParams
    {

        public boolean customPosition;
        public int x;
        public int y;

        public LayoutParams(int i, int j)
        {
            super(i, j);
            customPosition = false;
        }
    }


    private static final int ANIMATE_BACK_DELAY = 200;
    private static final int ANIMATE_BACK_DURATION = 200;
    private static final boolean DEBUG = false;
    protected static final int INVALID_POINTER = -1;
    private static final String TAG = "LockScreenLayout";
    private static final int TOUCH_DOWN_EMPTY = 1;
    private static final int TOUCH_DOWN_ICON = 4;
    private static final int TOUCH_MOVE_EMPTY = 2;
    private static final int TOUCH_MOVE_ICON_DRAG_MOVE = 6;
    private static final int TOUCH_MOVE_ICON_DRAG_START = 5;
    private static final int TOUCH_MOVE_ICON_DRAG_TRIGGER = 7;
    private static final int TOUCH_RESET = 0;
    private static final int TOUCH_UP_EMPTY = 3;
    private static final int TOUCH_UP_ICON = 8;
    final int DRAG_BITMAP_PADDING;
    private float mLockScreenX;
    private float mLockScreenY;
    private final Rect mTempRect;
    private boolean mTouchTriggered;
    private UnReadEventView mUnReadEventView;
    private ArrayList mUnReadHintAnimations;

    public LockScreenLayout(Context context)
    {
        super(context);
        mTempRect = new Rect();
        DRAG_BITMAP_PADDING = 0;
        mUnReadHintAnimations = new ArrayList();
    }

    public LockScreenLayout(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mTempRect = new Rect();
        DRAG_BITMAP_PADDING = 0;
        mUnReadHintAnimations = new ArrayList();
        setMotionEventSplittingEnabled(false);
    }

    private void finishShakeAnimation()
    {
        if (mUnReadEventView != null && mUnReadEventView.getNewEventViewList() != null && mUnReadEventView.getNewEventViewList().size() > 0)
        {
            int i = mUnReadHintAnimations.size();
            for (int j = 0; j < i; j++)
                ((UnReadHintAnimation)mUnReadHintAnimations.get(j)).completeAnimationImmediately();

            mUnReadHintAnimations.clear();
            return;
        } else
        {
            return;
        }
    }

    private float getDescendantCoordRelativeToSelf(View view, int ai[])
    {
        float af[] = new float[2];
        af[0] = ai[0];
        af[1] = ai[1];
        view.getMatrix().mapPoints(af);
        float f = 1.0F * view.getScaleX();
        af[0] = af[0] + (float)view.getLeft();
        af[1] = af[1] + (float)view.getTop();
        View view1;
        for (android.view.ViewParent viewparent = view.getParent(); (viewparent instanceof View) && viewparent != this; viewparent = view1.getParent())
        {
            view1 = (View)viewparent;
            view1.getMatrix().mapPoints(af);
            f *= view1.getScaleX();
            af[0] = af[0] + (float)(view1.getLeft() - view1.getScrollX());
            af[1] = af[1] + (float)(view1.getTop() - view1.getScrollY());
        }

        ai[0] = Math.round(af[0]);
        ai[1] = Math.round(af[1]);
        return f;
    }

    void beginShakeAnimation()
    {
        if (mUnReadEventView != null && mUnReadEventView.getNewEventViewList() != null && mUnReadEventView.getNewEventViewList().size() > 0)
        {
            finishShakeAnimation();
            ArrayList arraylist = mUnReadEventView.getNewEventViewList();
            for (int i = 0; i < arraylist.size(); i++)
            {
                UnReadHintAnimation unreadhintanimation = new UnReadHintAnimation((LockScreenNewEventView)arraylist.get(i));
                mUnReadHintAnimations.add(unreadhintanimation);
                unreadhintanimation.animate();
            }

        }
    }

    public boolean dispatchTouchEvent(MotionEvent motionevent)
    {
        if (mUnReadEventView == null)
            return super.dispatchTouchEvent(motionevent);
        if (super.dispatchTouchEvent(motionevent))
        {
            return true;
        } else
        {
            mTempRect.set(0, 0, 0, 0);
            offsetRectIntoDescendantCoords(mUnReadEventView, mTempRect);
            motionevent.setLocation(motionevent.getX() + (float)mTempRect.left, motionevent.getY() + (float)mTempRect.top);
            return mUnReadEventView.dispatchTouchEvent(motionevent);
        }
    }

    public void getLocationInLockScreenLayout(View view, int ai[])
    {
        ai[0] = 0;
        ai[1] = 0;
        getDescendantCoordRelativeToSelf(view, ai);
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
        int i1 = getChildCount();
        for (int j1 = 0; j1 < i1; j1++)
        {
            View view = getChildAt(j1);
            android.widget.FrameLayout.LayoutParams layoutparams = (android.widget.FrameLayout.LayoutParams)view.getLayoutParams();
            if (!(layoutparams instanceof LayoutParams))
                continue;
            LayoutParams layoutparams1 = (LayoutParams)layoutparams;
            if (layoutparams1.customPosition)
                view.layout(layoutparams1.x, layoutparams1.y, layoutparams1.x + layoutparams1.width, layoutparams1.y + layoutparams1.height);
        }

    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (mUnReadEventView != null && mUnReadEventView.getNewEventViewList() != null && mUnReadEventView.getNewEventViewList().size() > 0)
        {
            switch (motionevent.getAction())
            {
            case 0: // '\0'
                beginShakeAnimation();
                break;
            }
            return true;
        } else
        {
            return super.onTouchEvent(motionevent);
        }
    }

    public void setUnReadEventView(UnReadEventView unreadeventview)
    {
        mUnReadEventView = unreadeventview;
    }
}
