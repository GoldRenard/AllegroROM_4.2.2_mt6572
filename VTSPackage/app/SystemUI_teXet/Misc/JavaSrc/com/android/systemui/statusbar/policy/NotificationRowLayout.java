// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.animation.LayoutTransition;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.util.*;
import android.view.*;
import android.widget.LinearLayout;
import com.android.systemui.SwipeHelper;
import com.android.systemui.statusbar.NotificationData;
import java.util.HashMap;

// Referenced classes of package com.android.systemui.statusbar.policy:
//            OnSizeChangedListener

public class NotificationRowLayout extends LinearLayout
    implements com.android.systemui.SwipeHelper.Callback, com.android.systemui.ExpandHelper.Callback
{

    private static final int APPEAR_ANIM_LEN = 250;
    private static final boolean DEBUG = false;
    private static final int DISAPPEAR_ANIM_LEN = 250;
    private static final boolean SLOW_ANIMATIONS = false;
    private static final String TAG = "NotificationRowLayout";
    boolean mAnimateBounds;
    HashMap mAppearingViews;
    HashMap mDisappearingViews;
    private OnSizeChangedListener mOnSizeChangedListener;
    private LayoutTransition mRealLayoutTransition;
    boolean mRemoveViews;
    private SwipeHelper mSwipeHelper;
    Rect mTmpRect;

    public NotificationRowLayout(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public NotificationRowLayout(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mAnimateBounds = true;
        mTmpRect = new Rect();
        mAppearingViews = new HashMap();
        mDisappearingViews = new HashMap();
        mRemoveViews = true;
        mRealLayoutTransition = new LayoutTransition();
        mRealLayoutTransition.setAnimateParentHierarchy(true);
        setLayoutTransitionsEnabled(true);
        setOrientation(1);
        mSwipeHelper = new SwipeHelper(0, this, getResources().getDisplayMetrics().density, ViewConfiguration.get(mContext).getScaledPagingTouchSlop());
    }

    private void logLayoutTransition()
    {
        StringBuilder stringbuilder = (new StringBuilder()).append("layout ");
        String s;
        if (mRealLayoutTransition.isChangingLayout())
            s = "is ";
        else
            s = "is not ";
        StringBuilder stringbuilder1 = stringbuilder.append(s).append("in transition and animations ");
        String s1;
        if (mRealLayoutTransition.isRunning())
            s1 = "are ";
        else
            s1 = "are not ";
        Log.v("NotificationRowLayout", stringbuilder1.append(s1).append("running.").toString());
    }

    public boolean canChildBeDismissed(View view)
    {
        View view1 = view.findViewById(0x7f0800b3);
        return view1 != null && view1.getVisibility() != 8;
    }

    public boolean canChildBeExpanded(View view)
    {
        return NotificationData.getIsExpandable(view);
    }

    public void dismissRowAnimated(View view)
    {
        dismissRowAnimated(view, 0);
    }

    public void dismissRowAnimated(View view, int i)
    {
        mSwipeHelper.dismissChild(view, i);
    }

    public View getChildAtPosition(float f, float f1)
    {
        int i = getChildCount();
        int j = 0;
        for (int k = 0; k < i; k++)
        {
            View view = getChildAt(k);
            if (view.getVisibility() == 8)
                continue;
            j += view.getMeasuredHeight();
            if (f1 < (float)j)
                return view;
        }

        return null;
    }

    public View getChildAtPosition(MotionEvent motionevent)
    {
        return getChildAtPosition(motionevent.getX(), motionevent.getY());
    }

    public View getChildAtRawPosition(float f, float f1)
    {
        int ai[] = new int[2];
        getLocationOnScreen(ai);
        return getChildAtPosition(f - (float)ai[0], f1 - (float)ai[1]);
    }

    public View getChildContentView(View view)
    {
        return view;
    }

    public void onBeginDrag(View view)
    {
        requestDisallowInterceptTouchEvent(true);
    }

    public void onChildDismissed(View view)
    {
        View view1 = view.findViewById(0x7f0800b3);
        if (view1 != null && view1.getVisibility() != 8 && mRemoveViews)
            view1.performClick();
    }

    protected void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        float f = getResources().getDisplayMetrics().density;
        mSwipeHelper.setDensityScale(f);
        float f1 = ViewConfiguration.get(mContext).getScaledPagingTouchSlop();
        mSwipeHelper.setPagingTouchSlop(f1);
    }

    public void onDragCancelled(View view)
    {
    }

    public void onDraw(Canvas canvas)
    {
        super.onDraw(canvas);
    }

    public void onFinishInflate()
    {
        super.onFinishInflate();
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        return mSwipeHelper.onInterceptTouchEvent(motionevent) || super.onInterceptTouchEvent(motionevent);
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        if (mOnSizeChangedListener != null)
            mOnSizeChangedListener.onSizeChanged(this, i, j, k, l);
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        return mSwipeHelper.onTouchEvent(motionevent) || super.onTouchEvent(motionevent);
    }

    public void onWindowFocusChanged(boolean flag)
    {
        super.onWindowFocusChanged(flag);
        if (!flag)
            mSwipeHelper.removeLongPressCallback();
    }

    public void setAnimateBounds(boolean flag)
    {
        mAnimateBounds = flag;
    }

    public void setLayoutTransitionsEnabled(boolean flag)
    {
        if (flag)
        {
            setLayoutTransition(mRealLayoutTransition);
            return;
        }
        if (mRealLayoutTransition.isRunning())
            mRealLayoutTransition.cancel();
        setLayoutTransition(null);
    }

    public void setLongPressListener(android.view.View.OnLongClickListener onlongclicklistener)
    {
        mSwipeHelper.setLongPressListener(onlongclicklistener);
    }

    public void setOnSizeChangedListener(OnSizeChangedListener onsizechangedlistener)
    {
        mOnSizeChangedListener = onsizechangedlistener;
    }

    public boolean setUserExpandedChild(View view, boolean flag)
    {
        return NotificationData.setUserExpanded(view, flag);
    }

    public boolean setUserLockedChild(View view, boolean flag)
    {
        return NotificationData.setUserLocked(view, flag);
    }

    public void setViewRemoval(boolean flag)
    {
        mRemoveViews = flag;
    }
}
