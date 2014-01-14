// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.tablet;

import android.animation.*;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.*;
import android.view.animation.*;
import android.widget.RelativeLayout;
import com.android.systemui.ExpandHelper;
import com.android.systemui.statusbar.policy.NotificationRowLayout;

// Referenced classes of package com.android.systemui.statusbar.tablet:
//            StatusBarPanel, TabletStatusBar, NotificationPanelTitle

public class NotificationPanel extends RelativeLayout
    implements StatusBarPanel, android.view.View.OnClickListener
{
    private class Choreographer
        implements android.animation.Animator.AnimatorListener
    {

        static final int CLOSE_DURATION = 250;
        static final int OPEN_DURATION = 250;
        final int HYPERSPACE_OFFRAMP = 200;
        AnimatorSet mContentAnim;
        int mPanelHeight;
        boolean mVisible;
        final NotificationPanel this$0;

        void createAnimation(boolean flag)
        {
            float f = mContentParent.getTranslationY();
            float f1;
            float f2;
            if (flag)
            {
                int i = mNotificationCount;
                f2 = 0.0F;
                if (i == 0)
                    f2 = 0.0F + mContentFrameMissingTranslation;
                f1 = 200F + f2;
            } else
            {
                f1 = f;
                f2 = f + 200F;
            }
            ObjectAnimator objectanimator = ObjectAnimator.ofFloat(mContentParent, "translationY", new float[] {
                f1, f2
            });
            Interpolator interpolator;
            if (flag)
                interpolator = NotificationPanel.sDecelerateInterpolator;
            else
                interpolator = NotificationPanel.sAccelerateInterpolator;
            objectanimator.setInterpolator(interpolator);
            if (mContentAnim != null && mContentAnim.isRunning())
                mContentAnim.cancel();
            ViewGroup viewgroup = mContentParent;
            float af[] = new float[1];
            float f3;
            if (flag)
                f3 = 1.0F;
            else
                f3 = 0.0F;
            af[0] = f3;
            ObjectAnimator objectanimator1 = ObjectAnimator.ofFloat(viewgroup, "alpha", af);
            Interpolator interpolator1;
            if (flag)
                interpolator1 = NotificationPanel.sAccelerateInterpolator;
            else
                interpolator1 = NotificationPanel.sDecelerateInterpolator;
            objectanimator1.setInterpolator(interpolator1);
            mContentAnim = new AnimatorSet();
            mContentAnim.play(objectanimator1).with(objectanimator);
            AnimatorSet animatorset = mContentAnim;
            if (!flag);
            animatorset.setDuration(250);
            mContentAnim.addListener(this);
        }

        public void onAnimationCancel(Animator animator)
        {
        }

        public void onAnimationEnd(Animator animator)
        {
            if (!mVisible)
                setVisibility(8);
            mContentParent.setLayerType(0, null);
            mContentAnim = null;
            if (mVisible)
                updateClearButton();
        }

        public void onAnimationRepeat(Animator animator)
        {
        }

        public void onAnimationStart(Animator animator)
        {
        }

        void startAnimation(boolean flag)
        {
            createAnimation(flag);
            mContentAnim.start();
            mVisible = flag;
            if (!mVisible)
                updateClearButton();
        }

        Choreographer()
        {
            this$0 = NotificationPanel.this;
            super();
        }
    }


    static final boolean DEBUG = false;
    static final int PANEL_FADE_DURATION = 150;
    static final String TAG = "Tablet/NotificationPanel";
    static Interpolator sAccelerateInterpolator = new AccelerateInterpolator();
    static Interpolator sDecelerateInterpolator = new DecelerateInterpolator();
    private NotificationRowLayout latestItems;
    TabletStatusBar mBar;
    Choreographer mChoreo;
    View mClearButton;
    private android.view.View.OnClickListener mClearButtonListener = new android.view.View.OnClickListener() {

        final NotificationPanel this$0;

        public void onClick(View view)
        {
            mBar.clearAll();
        }

            
            {
                this$0 = NotificationPanel.this;
                super();
            }
    }
;
    Rect mContentArea;
    ViewGroup mContentFrame;
    float mContentFrameMissingTranslation;
    ViewGroup mContentParent;
    private ExpandHelper mExpandHelper;
    boolean mHasClearableNotifications;
    View mNotificationButton;
    int mNotificationCount;
    View mNotificationScroller;
    private android.view.ViewTreeObserver.OnPreDrawListener mPreDrawListener = new android.view.ViewTreeObserver.OnPreDrawListener() {

        final NotificationPanel this$0;

        public boolean onPreDraw()
        {
            getViewTreeObserver().removeOnPreDrawListener(this);
            mChoreo.startAnimation(true);
            return false;
        }

            
            {
                this$0 = NotificationPanel.this;
                super();
            }
    }
;
    View mSettingsButton;
    View mSettingsView;
    boolean mShowing;
    NotificationPanelTitle mTitleArea;

    public NotificationPanel(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public NotificationPanel(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mHasClearableNotifications = false;
        mNotificationCount = 0;
        mContentArea = new Rect();
        mChoreo = new Choreographer();
    }

    void addSettingsView()
    {
        mSettingsView = LayoutInflater.from(getContext()).inflate(0x7f040042, mContentFrame, false);
        mSettingsView.setVisibility(8);
        mContentFrame.addView(mSettingsView);
    }

    public boolean dispatchHoverEvent(MotionEvent motionevent)
    {
        int i = (int)motionevent.getX();
        int j = (int)motionevent.getY();
        if (i >= 0 && i < getWidth() && j >= 0 && j < getHeight())
            return super.dispatchHoverEvent(motionevent);
        else
            return true;
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        boolean flag = true;
        switch (keyevent.getKeyCode())
        {
        case 3: // '\003'
            if (keyevent.getAction() == flag)
                mBar.animateCollapsePanels();
            // fall through

        default:
            flag = super.dispatchKeyEvent(keyevent);
            break;

        case 4: // '\004'
            if (keyevent.getAction() == flag)
            {
                mBar.animateCollapsePanels();
                return flag;
            }
            break;
        }
        return flag;
    }

    public View getClearButton()
    {
        return mClearButton;
    }

    public boolean isInContentArea(int i, int j)
    {
        mContentArea.left = mContentFrame.getLeft() + mContentFrame.getPaddingLeft();
        mContentArea.top = mContentFrame.getTop() + mContentFrame.getPaddingTop() + (int)mContentParent.getTranslationY();
        mContentArea.right = mContentFrame.getRight() - mContentFrame.getPaddingRight();
        mContentArea.bottom = mContentFrame.getBottom() - mContentFrame.getPaddingBottom();
        offsetDescendantRectToMyCoords(mContentParent, mContentArea);
        return mContentArea.contains(i, j);
    }

    public boolean isShowing()
    {
        return mShowing;
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        latestItems = (NotificationRowLayout)findViewById(0x7f0800b4);
        int i = getResources().getDimensionPixelSize(0x7f0d001a);
        int j = getResources().getDimensionPixelSize(0x7f0d001b);
        mExpandHelper = new ExpandHelper(mContext, latestItems, i, j);
        mExpandHelper.setEventSource(this);
        mExpandHelper.setGravity(80);
    }

    public void onClick(View view)
    {
        if (mSettingsButton.isEnabled() && view == mTitleArea)
            swapPanels();
    }

    public void onFinishInflate()
    {
        super.onFinishInflate();
        setWillNotDraw(false);
        mContentParent = (ViewGroup)findViewById(0x7f0800ec);
        mContentParent.bringToFront();
        mTitleArea = (NotificationPanelTitle)findViewById(0x7f0800f0);
        mTitleArea.setPanel(this);
        mSettingsButton = findViewById(0x7f0800ac);
        mNotificationButton = findViewById(0x7f0800ad);
        mNotificationScroller = findViewById(0x7f0800ef);
        mContentFrame = (ViewGroup)findViewById(0x7f0800ee);
        mContentFrameMissingTranslation = 0.0F;
        mClearButton = findViewById(0x7f0800aa);
        mClearButton.setOnClickListener(mClearButtonListener);
        mShowing = false;
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        MotionEvent motionevent1 = MotionEvent.obtain(motionevent);
        motionevent1.setAction(3);
        boolean flag;
        if (!mExpandHelper.onInterceptTouchEvent(motionevent) && !super.onInterceptTouchEvent(motionevent))
            flag = false;
        else
            flag = true;
        if (flag)
            latestItems.onInterceptTouchEvent(motionevent1);
        return flag;
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        return mExpandHelper.onTouchEvent(motionevent) || super.onTouchEvent(motionevent);
    }

    public void onVisibilityChanged(View view, int i)
    {
        super.onVisibilityChanged(view, i);
        if (i != 0)
        {
            if (mSettingsView != null)
                removeSettingsView();
            mNotificationScroller.setVisibility(0);
            mNotificationScroller.setAlpha(1.0F);
            mNotificationScroller.scrollTo(0, 0);
            updatePanelModeButtons();
        }
    }

    void removeSettingsView()
    {
        if (mSettingsView != null)
        {
            mContentFrame.removeView(mSettingsView);
            mSettingsView = null;
        }
    }

    public void setBar(TabletStatusBar tabletstatusbar)
    {
        mBar = tabletstatusbar;
    }

    public void setClearable(boolean flag)
    {
        mHasClearableNotifications = flag;
    }

    public void setContentFrameVisible(boolean flag, boolean flag1)
    {
    }

    public void setNotificationCount(int i)
    {
        mNotificationCount = i;
    }

    public void setSettingsEnabled(boolean flag)
    {
        if (mSettingsButton != null)
        {
            mSettingsButton.setEnabled(flag);
            View view = mSettingsButton;
            byte byte0;
            if (flag)
                byte0 = 0;
            else
                byte0 = 8;
            view.setVisibility(byte0);
        }
    }

    public void show(boolean flag, boolean flag1)
    {
label0:
        {
label1:
            {
                if (!flag1)
                    break label0;
                if (mShowing != flag)
                {
                    mShowing = flag;
                    if (!flag)
                        break label1;
                    setVisibility(0);
                    mContentParent.setLayerType(2, null);
                    getViewTreeObserver().addOnPreDrawListener(mPreDrawListener);
                }
                return;
            }
            mChoreo.startAnimation(flag);
            return;
        }
        mShowing = flag;
        byte byte0 = 0;
        if (!flag)
            byte0 = 8;
        setVisibility(byte0);
    }

    public void swapPanels()
    {
        final View toShow;
        final View toHide;
        if (mSettingsView == null)
        {
            addSettingsView();
            toShow = mSettingsView;
            toHide = mNotificationScroller;
        } else
        {
            toShow = mNotificationScroller;
            toHide = mSettingsView;
        }
        ObjectAnimator objectanimator = ObjectAnimator.ofFloat(toHide, "alpha", new float[] {
            1.0F, 0.0F
        }).setDuration(150L);
        objectanimator.addListener(new AnimatorListenerAdapter() {

            final NotificationPanel this$0;
            final View val$toHide;
            final View val$toShow;

            public void onAnimationEnd(Animator animator)
            {
                toHide.setVisibility(8);
                if (toShow != null)
                {
                    toShow.setVisibility(0);
                    if (toShow == mSettingsView || mNotificationCount > 0)
                        ObjectAnimator.ofFloat(toShow, "alpha", new float[] {
                            0.0F, 1.0F
                        }).setDuration(150L).start();
                    if (toHide == mSettingsView)
                        removeSettingsView();
                }
                updateClearButton();
                updatePanelModeButtons();
            }

            
            {
                this$0 = NotificationPanel.this;
                toHide = view;
                toShow = view1;
                super();
            }
        }
);
        objectanimator.start();
    }

    public void updateClearButton()
    {
        if (mBar != null)
        {
            boolean flag;
            if (isShowing() && mHasClearableNotifications && mNotificationScroller.getVisibility() == 0)
                flag = true;
            else
                flag = false;
            View view = getClearButton();
            byte byte0 = 0;
            if (!flag)
                byte0 = 4;
            view.setVisibility(byte0);
        }
    }

    public void updatePanelModeButtons()
    {
        boolean flag;
        if (mSettingsView != null)
            flag = true;
        else
            flag = false;
        View view = mSettingsButton;
        byte byte0;
        if (!flag && mSettingsButton.isEnabled())
            byte0 = 0;
        else
            byte0 = 8;
        view.setVisibility(byte0);
        View view1 = mNotificationButton;
        byte byte1 = 0;
        if (!flag)
            byte1 = 8;
        view1.setVisibility(byte1);
    }

}
