// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewPropertyAnimator;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            ChallengeLayout, KeyguardWidgetPager, KeyguardHostView, SlidingChallengeLayout, 
//            KeyguardWidgetFrame, CameraWidgetFrame, KeyguardSecurityView, KeyguardUtils

public class KeyguardViewStateManager
    implements SlidingChallengeLayout.OnChallengeScrolledListener, ChallengeLayout.OnBouncerStateChangedListener
{

    private static final int SCREEN_ON_HINT_DURATION = 1000;
    private static final int SCREEN_ON_RING_HINT_DELAY = 300;
    private static final String TAG = "KeyguardViewStateManager";
    static final int TRANSPORT_GONE = 0;
    static final int TRANSPORT_INVISIBLE = 1;
    static final int TRANSPORT_VISIBLE = 2;
    private ChallengeLayout mChallengeLayout;
    int mChallengeTop;
    private int mCurrentPage;
    private Runnable mHideHintsRunnable;
    private KeyguardHostView mKeyguardHostView;
    private KeyguardSecurityView mKeyguardSecurityContainer;
    private KeyguardWidgetPager mKeyguardWidgetPager;
    int mLastScrollState;
    Handler mMainQueue;
    private int mPageIndexOnPageBeginMoving;
    private int mPageListeningToSlider;
    private int mTmpLoc[];
    private int mTmpPoint[];
    private int mTransportState;

    public KeyguardViewStateManager(KeyguardHostView keyguardhostview)
    {
        mTmpPoint = new int[2];
        mTmpLoc = new int[2];
        mMainQueue = new Handler(Looper.myLooper());
        mTransportState = 0;
        mLastScrollState = 0;
        mPageListeningToSlider = -1;
        mCurrentPage = -1;
        mPageIndexOnPageBeginMoving = -1;
        mChallengeTop = 0;
        mHideHintsRunnable = new Runnable() {

            final KeyguardViewStateManager this$0;

            public void run()
            {
                KeyguardUtils.xlogD("KeyguardViewStateManager", (new StringBuilder()).append("mHideHintsRunnable mKeyguardWidgetPager=").append(mKeyguardWidgetPager).toString());
                if (mKeyguardWidgetPager != null)
                    mKeyguardWidgetPager.hideOutlinesAndSidePages();
            }

            
            {
                this$0 = KeyguardViewStateManager.this;
                super();
            }
        }
;
        mKeyguardHostView = keyguardhostview;
    }

    private int getChallengeTopRelativeToFrame(KeyguardWidgetFrame keyguardwidgetframe, int i)
    {
        mTmpPoint[0] = 0;
        mTmpPoint[1] = i;
        mapPoint((View)mChallengeLayout, keyguardwidgetframe, mTmpPoint);
        return mTmpPoint[1];
    }

    private void mapPoint(View view, View view1, int ai[])
    {
        view.getLocationInWindow(mTmpLoc);
        int i = mTmpLoc[0];
        int j = mTmpLoc[1];
        view1.getLocationInWindow(mTmpLoc);
        int k = mTmpLoc[0];
        int l = mTmpLoc[1];
        ai[0] = ai[0] + (i - k);
        ai[1] = ai[1] + (j - l);
    }

    private void updateEdgeSwiping()
    {
label0:
        {
            if (mChallengeLayout != null && mKeyguardWidgetPager != null)
            {
                if (!mChallengeLayout.isChallengeOverlapping())
                    break label0;
                mKeyguardWidgetPager.setOnlyAllowEdgeSwipes(true);
            }
            return;
        }
        mKeyguardWidgetPager.setOnlyAllowEdgeSwipes(false);
    }

    private void userActivity()
    {
        if (mKeyguardHostView != null)
        {
            mKeyguardHostView.onUserActivityTimeoutChanged();
            mKeyguardHostView.userActivity();
        }
    }

    public void fadeInSecurity(int i)
    {
        ((View)mKeyguardSecurityContainer).animate().alpha(1.0F).setDuration(i);
    }

    public void fadeOutSecurity(int i)
    {
        ((View)mKeyguardSecurityContainer).animate().alpha(0.0F).setDuration(i);
    }

    public int getTransportState()
    {
        return mTransportState;
    }

    public boolean isBouncing()
    {
        return mChallengeLayout.isBouncing();
    }

    public boolean isChallengeOverlapping()
    {
        if (mChallengeLayout != null)
            return mChallengeLayout.isChallengeOverlapping();
        else
            return false;
    }

    public boolean isChallengeShowing()
    {
        if (mChallengeLayout != null)
            return mChallengeLayout.isChallengeShowing();
        else
            return false;
    }

    public void onBouncerStateChanged(boolean flag)
    {
        if (flag)
        {
            mKeyguardWidgetPager.zoomOutToBouncer();
        } else
        {
            mKeyguardWidgetPager.zoomInFromBouncer();
            if (mKeyguardHostView != null)
            {
                mKeyguardHostView.setOnDismissAction(null);
                return;
            }
        }
    }

    public void onPageBeginMoving()
    {
        if (mChallengeLayout.isChallengeOverlapping() && (mChallengeLayout instanceof SlidingChallengeLayout))
        {
            ((SlidingChallengeLayout)mChallengeLayout).fadeOutChallenge();
            mPageIndexOnPageBeginMoving = mKeyguardWidgetPager.getCurrentPage();
        }
        if (mKeyguardHostView != null)
        {
            mKeyguardHostView.clearAppWidgetToShow();
            mKeyguardHostView.setOnDismissAction(null);
        }
        if (mHideHintsRunnable != null)
            mMainQueue.removeCallbacks(mHideHintsRunnable);
    }

    public void onPageEndMoving()
    {
        mPageIndexOnPageBeginMoving = -1;
    }

    public void onPageSwitched(View view, int i)
    {
        if (mCurrentPage == i)
            return;
        if (mKeyguardWidgetPager != null && mChallengeLayout != null)
        {
            KeyguardWidgetFrame keyguardwidgetframe = mKeyguardWidgetPager.getWidgetPageAt(mCurrentPage);
            if (keyguardwidgetframe != null && mCurrentPage != mPageListeningToSlider && mCurrentPage != mKeyguardWidgetPager.getWidgetToResetOnPageFadeOut())
                keyguardwidgetframe.resetSize();
            KeyguardWidgetFrame keyguardwidgetframe1 = mKeyguardWidgetPager.getWidgetPageAt(i);
            if (mChallengeLayout.isChallengeOverlapping() && !keyguardwidgetframe1.isSmall() && mPageListeningToSlider != i)
                keyguardwidgetframe1.shrinkWidget();
        }
        mCurrentPage = i;
    }

    public void onPageSwitching(View view, int i)
    {
        if (mKeyguardWidgetPager != null && (mChallengeLayout instanceof SlidingChallengeLayout))
        {
            boolean flag = view instanceof CameraWidgetFrame;
            SlidingChallengeLayout slidingchallengelayout = (SlidingChallengeLayout)mChallengeLayout;
            boolean flag1;
            if (!flag)
                flag1 = true;
            else
                flag1 = false;
            slidingchallengelayout.setChallengeInteractive(flag1);
        }
        if (mPageIndexOnPageBeginMoving == mKeyguardWidgetPager.getNextPage() && (mChallengeLayout instanceof SlidingChallengeLayout))
        {
            ((SlidingChallengeLayout)mChallengeLayout).fadeInChallenge();
            mKeyguardWidgetPager.setWidgetToResetOnPageFadeOut(-1);
        }
        mPageIndexOnPageBeginMoving = -1;
    }

    public void onScrollPositionChanged(float f, int i)
    {
        mChallengeTop = i;
        KeyguardWidgetFrame keyguardwidgetframe = mKeyguardWidgetPager.getWidgetPageAt(mPageListeningToSlider);
        if (keyguardwidgetframe != null && mLastScrollState != 3)
            keyguardwidgetframe.adjustFrame(getChallengeTopRelativeToFrame(keyguardwidgetframe, mChallengeTop));
    }

    public void onScrollStateChanged(int i)
    {
label0:
        {
            if (mKeyguardWidgetPager == null || mChallengeLayout == null)
                break label0;
            boolean flag = mChallengeLayout.isChallengeOverlapping();
            if (i == 0)
            {
                KeyguardWidgetFrame keyguardwidgetframe1 = mKeyguardWidgetPager.getWidgetPageAt(mPageListeningToSlider);
                if (keyguardwidgetframe1 == null)
                    break label0;
                if (!flag)
                    if (!mKeyguardWidgetPager.isPageMoving())
                    {
                        keyguardwidgetframe1.resetSize();
                        userActivity();
                    } else
                    {
                        mKeyguardWidgetPager.setWidgetToResetOnPageFadeOut(mPageListeningToSlider);
                    }
                if (keyguardwidgetframe1.isSmall())
                    keyguardwidgetframe1.setFrameHeight(keyguardwidgetframe1.getSmallFrameHeight());
                if (i != 3)
                    keyguardwidgetframe1.hideFrame(this);
                updateEdgeSwiping();
                if (mChallengeLayout.isChallengeShowing())
                    mKeyguardSecurityContainer.onResume(2);
                else
                    mKeyguardSecurityContainer.onPause();
                mPageListeningToSlider = -1;
            } else
            if (mLastScrollState == 0)
            {
                mPageListeningToSlider = mKeyguardWidgetPager.getNextPage();
                KeyguardWidgetFrame keyguardwidgetframe = mKeyguardWidgetPager.getWidgetPageAt(mPageListeningToSlider);
                if (keyguardwidgetframe == null)
                    break label0;
                if (!mChallengeLayout.isBouncing())
                {
                    if (i != 3)
                        keyguardwidgetframe.showFrame(this);
                    if (!keyguardwidgetframe.isSmall())
                    {
                        mPageListeningToSlider = mKeyguardWidgetPager.getNextPage();
                        keyguardwidgetframe.shrinkWidget(false);
                    }
                } else
                if (!keyguardwidgetframe.isSmall())
                    mPageListeningToSlider = mKeyguardWidgetPager.getNextPage();
                mKeyguardSecurityContainer.onPause();
            }
            mLastScrollState = i;
            return;
        }
    }

    public void setChallengeLayout(ChallengeLayout challengelayout)
    {
        mChallengeLayout = challengelayout;
        updateEdgeSwiping();
    }

    public void setPagedView(KeyguardWidgetPager keyguardwidgetpager)
    {
        mKeyguardWidgetPager = keyguardwidgetpager;
        updateEdgeSwiping();
    }

    public void setSecurityViewContainer(KeyguardSecurityView keyguardsecurityview)
    {
        mKeyguardSecurityContainer = keyguardsecurityview;
    }

    public void setTransportState(int i)
    {
        mTransportState = i;
    }

    public void showBouncer(boolean flag)
    {
        mChallengeLayout.showBouncer();
    }

    public void showUsabilityHints()
    {
        mMainQueue.postDelayed(new Runnable() {

            final KeyguardViewStateManager this$0;

            public void run()
            {
                mKeyguardSecurityContainer.showUsabilityHint();
            }

            
            {
                this$0 = KeyguardViewStateManager.this;
                super();
            }
        }
, 300L);
        mKeyguardWidgetPager.showInitialPageHints();
        if (mHideHintsRunnable != null)
            mMainQueue.postDelayed(mHideHintsRunnable, 1000L);
    }


}
