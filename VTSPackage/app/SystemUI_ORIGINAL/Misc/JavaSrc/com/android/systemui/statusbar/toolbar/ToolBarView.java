// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.toolbar;

import android.content.*;
import android.graphics.Canvas;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.*;
import android.view.animation.Interpolator;
import android.widget.ScrollView;
import android.widget.Scroller;
import com.android.systemui.statusbar.BaseStatusBar;
import com.android.systemui.statusbar.phone.PhoneStatusBar;
import com.android.systemui.statusbar.util.SIMHelper;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.systemui.statusbar.toolbar:
//            SimSwitchPanel, ToolBarIndicator

public class ToolBarView extends ViewGroup
{
    static class SavedState extends android.view.View.BaseSavedState
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public SavedState createFromParcel(Parcel parcel)
            {
                return new SavedState(parcel);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public SavedState[] newArray(int i)
            {
                return new SavedState[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        }
;
        int mCurrentScreen;

        public void writeToParcel(Parcel parcel, int i)
        {
            super.writeToParcel(parcel, i);
            parcel.writeInt(mCurrentScreen);
        }


        private SavedState(Parcel parcel)
        {
            super(parcel);
            mCurrentScreen = -1;
            mCurrentScreen = parcel.readInt();
        }


        SavedState(Parcelable parcelable)
        {
            super(parcelable);
            mCurrentScreen = -1;
        }
    }

    static interface ScrollToScreenCallback
    {

        public abstract void onScrollFinish(int i);
    }

    private static class WorkspaceOvershootInterpolator
        implements Interpolator
    {

        private static final float DEFAULT_TENSION = 1.3F;
        private float mTension;

        public void disableSettle()
        {
            mTension = 0.0F;
        }

        public float getInterpolation(float f)
        {
            float f1 = f - 1.0F;
            return 1.0F + f1 * f1 * (f1 * (1.0F + mTension) + mTension);
        }

        public void setDistance(int i)
        {
            float f = 1.3F;
            if (i > 0)
                f /= i;
            mTension = f;
        }

        public WorkspaceOvershootInterpolator()
        {
            mTension = 1.3F;
        }
    }


    private static final float BASELINE_FLING_VELOCITY = 2500F;
    private static final boolean DEBUG = true;
    private static final float FLING_VELOCITY_INFLUENCE = 0.4F;
    private static final int INVALID_POINTER = -1;
    private static final int INVALID_SCREEN = -1;
    private static final int SNAP_VELOCITY = 600;
    private static final String TAG = "ToolBarView";
    private static final int TOUCH_STATE_REST = 0;
    private static final int TOUCH_STATE_SCROLLING = 1;
    private int mActivePointerId;
    private boolean mAllowLongPress;
    private int mCurrentScreen;
    private int mDefaultScreen;
    private Display mDisplay;
    private boolean mFirstLayout;
    private BroadcastReceiver mIntentReceiver = new BroadcastReceiver() {

        final ToolBarView this$0;

        public void onReceive(Context context1, Intent intent)
        {
            String s = intent.getAction();
            if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
            {
                Xlog.d("ToolBarView", "sim ready");
                updateForSimReady();
            } else
            if (s.equals("android.intent.action.SIM_NAME_UPDATE"))
            {
                updateForSimNameUpdate();
                return;
            }
        }

            
            {
                this$0 = ToolBarView.this;
                super();
            }
    }
;
    private boolean mIsUpdated;
    private float mLastMotionX;
    private float mLastMotionY;
    private int mMaximumVelocity;
    private int mNextScreen;
    private int mOverscrollDistance;
    private WorkspaceOvershootInterpolator mScrollInterpolator;
    private ScrollToScreenCallback mScrollToScreenCallback;
    private Scroller mScroller;
    public SimSwitchPanel mSimSwitchPanelView;
    private BaseStatusBar mStatusBarService;
    private ToolBarIndicator mToolBarIndicator;
    private View mToolBarSwitchPanel;
    private int mTouchSlop;
    private int mTouchState;
    private VelocityTracker mVelocityTracker;

    public ToolBarView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public ToolBarView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mFirstLayout = true;
        mNextScreen = -1;
        mTouchState = 0;
        mAllowLongPress = true;
        mIsUpdated = false;
        mActivePointerId = -1;
        mDefaultScreen = 0;
        mDisplay = ((WindowManager)context.getSystemService("window")).getDefaultDisplay();
        setHapticFeedbackEnabled(false);
        initWorkspace();
    }

    private void acquireVelocityTrackerAndAddMovement(MotionEvent motionevent)
    {
        if (mVelocityTracker == null)
            mVelocityTracker = VelocityTracker.obtain();
        mVelocityTracker.addMovement(motionevent);
    }

    private void initWorkspace()
    {
        Context context = getContext();
        mScrollInterpolator = new WorkspaceOvershootInterpolator();
        mScroller = new Scroller(context, mScrollInterpolator);
        mCurrentScreen = mDefaultScreen;
        ViewConfiguration viewconfiguration = ViewConfiguration.get(getContext());
        mTouchSlop = viewconfiguration.getScaledTouchSlop();
        mMaximumVelocity = viewconfiguration.getScaledMaximumFlingVelocity();
        mOverscrollDistance = viewconfiguration.getScaledOverscrollDistance();
    }

    private void onSecondaryPointerUp(MotionEvent motionevent)
    {
        int i = (0xff00 & motionevent.getAction()) >> 8;
        if (motionevent.getPointerId(i) == mActivePointerId)
        {
            int j;
            if (i == 0)
                j = 1;
            else
                j = 0;
            mLastMotionX = motionevent.getX(j);
            mLastMotionY = motionevent.getY(j);
            mActivePointerId = motionevent.getPointerId(j);
            if (mVelocityTracker != null)
                mVelocityTracker.clear();
        }
    }

    private void releaseVelocityTracker()
    {
        if (mVelocityTracker != null)
        {
            mVelocityTracker.recycle();
            mVelocityTracker = null;
        }
    }

    private void setUpdate()
    {
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        intentfilter.addAction("android.intent.action.SIM_NAME_UPDATE");
        mContext.registerReceiver(mIntentReceiver, intentfilter, null, null);
    }

    private void snapToScreen(int i, int j, boolean flag)
    {
        int k = Math.max(0, Math.min(i, -1 + getChildCount()));
        enableChildrenCache(mCurrentScreen, k);
        mNextScreen = k;
        mScrollToScreenCallback.onScrollFinish(mNextScreen);
        Xlog.d("ToolBarView", (new StringBuilder()).append("snapToScreen  mNextScreen is ").append(mNextScreen).toString());
        View view = getFocusedChild();
        if (view != null && k != mCurrentScreen && view == getChildAt(mCurrentScreen))
            view.clearFocus();
        int l = Math.max(1, Math.abs(k - mCurrentScreen));
        int i1 = k * getWidth() - mScrollX;
        int j1 = 100 * (l + 1);
        if (!mScroller.isFinished())
            mScroller.abortAnimation();
        if (flag)
            mScrollInterpolator.setDistance(l);
        else
            mScrollInterpolator.disableSettle();
        int k1 = Math.abs(j);
        int l1;
        if (k1 > 0)
            l1 = (int)((float)j1 + 0.4F * ((float)j1 / ((float)k1 / 2500F)));
        else
            l1 = j1 + 100;
        awakenScrollBars(l1);
        mScroller.startScroll(mScrollX, 0, i1, 0, l1);
        if (mNextScreen != -1)
            mCurrentScreen = Math.max(0, Math.min(mNextScreen, -1 + getChildCount()));
        invalidate();
    }

    private void updateForSimNameUpdate()
    {
        updateForSimReady();
    }

    private void updateForSimReady()
    {
        SIMHelper.updateSIMInfos(mContext);
        mSimSwitchPanelView.updateSimInfo();
    }

    public boolean allowLongPress()
    {
        return mAllowLongPress;
    }

    void clearChildrenCache()
    {
        int i = getChildCount();
        for (int j = 0; j < i; j++)
            ((ViewGroup)getChildAt(j)).setDrawingCacheEnabled(false);

    }

    public void computeScroll()
    {
        if (mScroller.computeScrollOffset())
        {
            mScrollX = mScroller.getCurrX();
            mScrollY = mScroller.getCurrY();
            postInvalidate();
        } else
        if (mNextScreen != -1)
        {
            mCurrentScreen = Math.max(0, Math.min(mNextScreen, -1 + getChildCount()));
            Xlog.d("ToolBarView", (new StringBuilder()).append("computeScroll  mCurrentScreen is ").append(mCurrentScreen).toString());
            mScrollToScreenCallback.onScrollFinish(mCurrentScreen);
            mNextScreen = -1;
            clearChildrenCache();
            return;
        }
    }

    public void dismissDialogs()
    {
        mSimSwitchPanelView.dismissDialogs();
    }

    protected void dispatchDraw(Canvas canvas)
    {
        int i = 1;
        if (mTouchState == i || mNextScreen != -1)
            i = 0;
        if (i != 0)
        {
            drawChild(canvas, getChildAt(mCurrentScreen), getDrawingTime());
        } else
        {
            long l = getDrawingTime();
            float f = (float)mScrollX / (float)getWidth();
            int j = (int)f;
            int k = j + 1;
            if (j >= 0)
                drawChild(canvas, getChildAt(j), l);
            if (f != (float)j && k < getChildCount())
                drawChild(canvas, getChildAt(k), l);
        }
        if (false)
            canvas.restoreToCount(0);
    }

    public boolean dispatchTouchEvent(MotionEvent motionevent)
    {
        return super.dispatchTouchEvent(motionevent);
    }

    void enableChildrenCache(int i, int j)
    {
        if (i > j)
        {
            int k1 = i;
            i = j;
            j = k1;
        }
        int k = getChildCount();
        int l = Math.max(i, 0);
        int i1 = Math.min(j, k - 1);
        for (int j1 = l; j1 <= i1; j1++)
        {
            ViewGroup viewgroup = (ViewGroup)getChildAt(j1);
            viewgroup.setDrawingCacheEnabled(true);
            viewgroup.setDrawingCacheEnabled(true);
        }

    }

    public void focusableViewAvailable(View view)
    {
        View view1 = getChildAt(mCurrentScreen);
        View view2 = view;
        do
        {
            if (view2 == view1)
            {
                super.focusableViewAvailable(view);
                break;
            }
            if (view2 == this || !(view2.getParent() instanceof View))
                break;
            view2 = (View)view2.getParent();
        } while (true);
    }

    public int getCurrentScreen()
    {
        return mCurrentScreen;
    }

    public int getIndicatorCount()
    {
        return getChildCount();
    }

    public int getScreenForView(View view)
    {
        if (view != null)
        {
            android.view.ViewParent viewparent = view.getParent();
            int i = getChildCount();
            for (int j = 0; j < i; j++)
                if (viewparent == getChildAt(j))
                    return j;

        }
        return -1;
    }

    public final BaseStatusBar getStatusBarService()
    {
        return mStatusBarService;
    }

    public void hideSimSwithPanel()
    {
        setSimSwitchPanleVisibility(false);
        mDefaultScreen = 0;
        setCurrentScreen(0, 0);
    }

    boolean isDefaultScreenShowing()
    {
        return mCurrentScreen == mDefaultScreen;
    }

    public boolean isStatusBarExpanded()
    {
        return mStatusBarService.isExpanded();
    }

    public void moveToCurrentScreen(int i)
    {
        setCurrentScreen(mCurrentScreen, i);
    }

    public void moveToDefaultScreen(boolean flag)
    {
        if (flag)
            snapToScreen(mDefaultScreen);
        else
            setCurrentScreen(mDefaultScreen, 0);
        getChildAt(mDefaultScreen).requestFocus();
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        postDelayed(new Runnable() {

            final ToolBarView this$0;

            public void run()
            {
                setUpdate();
                mSimSwitchPanelView.setUpdates(true);
            }

            
            {
                this$0 = ToolBarView.this;
                super();
            }
        }
, 200L);
        computeScroll();
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        postDelayed(new Runnable() , 200L);
    }

    public void onFinishInflate()
    {
        onFinishInflate();
        mSimSwitchPanelView = (SimSwitchPanel)findViewById(0x7f080126);
        mSimSwitchPanelView.setToolBar(this);
        mIsUpdated = true;
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        int i = motionevent.getAction();
        if (i != 2 || mTouchState == 0)
        {
            acquireVelocityTrackerAndAddMovement(motionevent);
            switch (i & 0xff)
            {
            case 6: // '\006'
                onSecondaryPointerUp(motionevent);
                break;

            case 1: // '\001'
            case 3: // '\003'
                clearChildrenCache();
                mTouchState = 0;
                mActivePointerId = -1;
                mAllowLongPress = false;
                releaseVelocityTracker();
                break;

            case 0: // '\0'
                float f2 = motionevent.getX();
                float f3 = motionevent.getY();
                mLastMotionX = f2;
                mLastMotionY = f3;
                mActivePointerId = motionevent.getPointerId(0);
                mAllowLongPress = true;
                int j1;
                if (mScroller.isFinished())
                    j1 = 0;
                else
                    j1 = 1;
                mTouchState = j1;
                break;

            case 2: // '\002'
                int j = motionevent.findPointerIndex(mActivePointerId);
                float f = motionevent.getX(j);
                float f1 = motionevent.getY(j);
                int k = (int)Math.abs(f - mLastMotionX);
                int l = (int)Math.abs(f1 - mLastMotionY);
                int i1 = mTouchSlop;
                boolean flag;
                if (k > i1)
                    flag = true;
                else
                    flag = false;
                boolean flag1;
                if (l > i1)
                    flag1 = true;
                else
                    flag1 = false;
                if (flag || flag1)
                {
                    if (flag)
                    {
                        mTouchState = 1;
                        enableChildrenCache(-1 + mCurrentScreen, 1 + mCurrentScreen);
                    }
                    if (mAllowLongPress)
                    {
                        mAllowLongPress = false;
                        getChildAt(mCurrentScreen).cancelLongPress();
                    }
                }
                break;
            }
            if (mTouchState == 0)
                return false;
        }
        return true;
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        int i1 = 0;
        int j1 = getChildCount();
        for (int k1 = 0; k1 < j1; k1++)
        {
            View view = getChildAt(k1);
            if (view.getVisibility() != 8)
            {
                int l1 = view.getMeasuredWidth();
                view.layout(i1, 0, i1 + l1, view.getMeasuredHeight());
                i1 += l1;
            }
        }

    }

    protected void onMeasure(int i, int j)
    {
        onMeasure(i, j);
        int k = android.view.View.MeasureSpec.getSize(i);
        android.view.View.MeasureSpec.getMode(i);
        int l = getChildCount();
        for (int i1 = 0; i1 < l; i1++)
            getChildAt(i1).measure(i, j);

        if (mFirstLayout)
        {
            setHorizontalScrollBarEnabled(false);
            scrollTo(k * mCurrentScreen, 0);
            setHorizontalScrollBarEnabled(true);
            mFirstLayout = false;
        }
    }

    protected void onRestoreInstanceState(Parcelable parcelable)
    {
        SavedState savedstate = (SavedState)parcelable;
        onRestoreInstanceState(savedstate.getSuperState());
        if (savedstate.mCurrentScreen != -1)
            mCurrentScreen = savedstate.mCurrentScreen;
    }

    protected Parcelable onSaveInstanceState()
    {
        SavedState savedstate = new SavedState(onSaveInstanceState());
        savedstate.mCurrentScreen = mCurrentScreen;
        return savedstate;
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        acquireVelocityTrackerAndAddMovement(motionevent);
        switch (0xff & motionevent.getAction())
        {
        case 4: // '\004'
        case 5: // '\005'
        default:
            break;

        case 6: // '\006'
            onSecondaryPointerUp(motionevent);
            break;

        case 3: // '\003'
            if (mTouchState == 1)
            {
                int l1 = getWidth();
                snapToScreen((mScrollX + l1 / 2) / l1, 0, true);
            }
            mTouchState = 0;
            mActivePointerId = -1;
            releaseVelocityTracker();
            break;

        case 1: // '\001'
            if (mTouchState == 1)
            {
                VelocityTracker velocitytracker = mVelocityTracker;
                velocitytracker.computeCurrentVelocity(1000, mMaximumVelocity);
                int k = (int)velocitytracker.getXVelocity(mActivePointerId);
                int l = getWidth();
                int i1 = (mScrollX + l / 2) / l;
                float f2 = (float)mScrollX / (float)l;
                if (k > 600 && mCurrentScreen > 0)
                {
                    int k1;
                    if (f2 < (float)i1)
                        k1 = -1 + mCurrentScreen;
                    else
                        k1 = mCurrentScreen;
                    snapToScreen(Math.min(i1, k1), k, true);
                } else
                if (k < -600 && mCurrentScreen < -1 + getChildCount())
                {
                    int j1;
                    if (f2 > (float)i1)
                        j1 = 1 + mCurrentScreen;
                    else
                        j1 = mCurrentScreen;
                    snapToScreen(Math.max(i1, j1), k, true);
                } else
                {
                    snapToScreen(i1, 0, true);
                }
            }
            mTouchState = 0;
            mActivePointerId = -1;
            releaseVelocityTracker();
            break;

        case 2: // '\002'
            if (mTouchState != 1)
                break;
            float f = motionevent.getX(motionevent.findPointerIndex(mActivePointerId));
            float f1 = mLastMotionX - f;
            mLastMotionX = f;
            if (f1 < 0.0F)
            {
                int j = mScrollX + mOverscrollDistance;
                if (j > 0)
                    scrollBy((int)Math.max(-j, f1), 0);
                break;
            }
            if (f1 > 0.0F)
            {
                int i = (getChildAt(-1 + getChildCount()).getRight() - mScrollX - getWidth()) + mOverscrollDistance;
                if (i > 0)
                    scrollBy((int)Math.min(i, f1), 0);
            } else
            {
                awakenScrollBars();
            }
            break;

        case 0: // '\0'
            if (!mScroller.isFinished())
                mScroller.abortAnimation();
            mLastMotionX = motionevent.getX();
            mActivePointerId = motionevent.getPointerId(0);
            if (mTouchState == 1)
                enableChildrenCache(-1 + mCurrentScreen, 1 + mCurrentScreen);
            break;
        }
        return true;
    }

    public void scrollLeft()
    {
        if (mScroller.isFinished())
        {
            if (mCurrentScreen > 0)
                snapToScreen(-1 + mCurrentScreen);
        } else
        if (mNextScreen > 0)
        {
            snapToScreen(-1 + mNextScreen);
            return;
        }
    }

    public void scrollRight()
    {
        if (mScroller.isFinished())
        {
            if (mCurrentScreen < -1 + getChildCount())
                snapToScreen(1 + mCurrentScreen);
        } else
        if (mNextScreen < -1 + getChildCount())
        {
            snapToScreen(1 + mNextScreen);
            return;
        }
    }

    public void scrollTo(int i, int j)
    {
        scrollTo(i, j);
    }

    public void setAllowLongPress(boolean flag)
    {
        mAllowLongPress = flag;
    }

    public void setCurrentScreen(int i, int j)
    {
        if (!mScroller.isFinished())
            mScroller.abortAnimation();
        mCurrentScreen = Math.max(0, Math.min(i, -1 + getChildCount()));
        if (mScrollToScreenCallback != null)
            mScrollToScreenCallback.onScrollFinish(mCurrentScreen);
        int k = mDisplay.getWidth();
        if (j != 0)
            k = j;
        Xlog.d("Width", (new StringBuilder()).append("width is: ").append(k).toString());
        scrollTo(k * mCurrentScreen, 0);
        invalidate();
    }

    public void setScrollToScreenCallback(ScrollToScreenCallback scrolltoscreencallback)
    {
        mScrollToScreenCallback = scrolltoscreencallback;
    }

    void setSimSwitchPanleVisibility(boolean flag)
    {
        PhoneStatusBar phonestatusbar = (PhoneStatusBar)getStatusBarService();
        if (flag)
        {
            if (!phonestatusbar.mHasFlipSettings || phonestatusbar.mFlipSettingsView == null || phonestatusbar.mFlipSettingsView.getVisibility() != 0 || phonestatusbar.mScrollView.getVisibility() == 0)
            {
                mToolBarSwitchPanel.setVisibility(0);
                mSimSwitchPanelView.setPanelShowing(true);
            }
        } else
        if (!flag)
        {
            if (mToolBarSwitchPanel.getVisibility() != 8)
            {
                phonestatusbar.dismissAppGuide();
                mToolBarSwitchPanel.setVisibility(8);
            }
            mSimSwitchPanelView.setPanelShowing(false);
        }
        updateIndicator();
    }

    public void setStatusBarService(BaseStatusBar basestatusbar)
    {
        mStatusBarService = basestatusbar;
    }

    public void setToolBarIndicator(ToolBarIndicator toolbarindicator)
    {
        mToolBarIndicator = toolbarindicator;
        updateIndicator();
    }

    public void setToolBarSwitchPanel(View view)
    {
        mToolBarSwitchPanel = view;
    }

    public void showSimSwithPanel(String s)
    {
        if (mSimSwitchPanelView.updateSimService(s))
            setSimSwitchPanleVisibility(true);
        else
            setSimSwitchPanleVisibility(false);
        mDefaultScreen = 0;
        setCurrentScreen(0, 0);
    }

    public void snapToScreen(int i)
    {
        snapToScreen(i, 0, false);
    }

    public void updateIndicator()
    {
        Xlog.d("ToolBarView", (new StringBuilder()).append("updateIndicator called, and indicator count is ").append(getChildCount()).toString());
        if (getIndicatorCount() == 1)
        {
            mToolBarIndicator.setVisibility(8);
            return;
        } else
        {
            mToolBarIndicator.setVisibility(0);
            mToolBarIndicator.setCount(getIndicatorCount());
            mToolBarIndicator.requestLayout();
            return;
        }
    }

    public void updateResources()
    {
        if (!mIsUpdated)
        {
            return;
        } else
        {
            mSimSwitchPanelView.updateResources();
            return;
        }
    }

    public void updateSimInfos(Intent intent)
    {
        mSimSwitchPanelView.updateSimInfo();
    }





}
