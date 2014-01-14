// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.animation.*;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.*;
import android.widget.FrameLayout;
import com.mediatek.common.MediatekClassFactory;
import com.mediatek.common.pluginmanager.IPlugin;
import com.mediatek.common.pluginmanager.IPluginManager;
import com.mediatek.common.policy.IKeyguardLayer;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            ChallengeLayout, KeyguardUtils, KeyguardSecurityContainer, MediatekGlowPadView

public class MultiPaneChallengeLayout extends ViewGroup
    implements ChallengeLayout
{
    public static class LayoutParams extends android.view.ViewGroup.MarginLayoutParams
    {

        public static final int CHILD_TYPE_CHALLENGE = 2;
        public static final int CHILD_TYPE_KEYGUARD_LAYER_BACKGROUND = 9;
        public static final int CHILD_TYPE_KEYGUARD_LAYER_FOREGROUND = 8;
        public static final int CHILD_TYPE_NONE = 0;
        public static final int CHILD_TYPE_PAGE_DELETE_DROP_TARGET = 7;
        public static final int CHILD_TYPE_SCRIM = 4;
        public static final int CHILD_TYPE_USER_SWITCHER = 3;
        public static final int CHILD_TYPE_WIDGET = 1;
        public float centerWithinArea;
        public int childType;
        public int gravity;
        public int maxHeight;
        public int maxWidth;

        public LayoutParams()
        {
            this(-2, -2);
        }

        public LayoutParams(int i, int j)
        {
            super(i, j);
            centerWithinArea = 0.0F;
            childType = 0;
            gravity = 0;
            maxWidth = -1;
            maxHeight = -1;
        }

        LayoutParams(Context context, AttributeSet attributeset, MultiPaneChallengeLayout multipanechallengelayout)
        {
            super(context, attributeset);
            centerWithinArea = 0.0F;
            childType = 0;
            gravity = 0;
            maxWidth = -1;
            maxHeight = -1;
            TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.MultiPaneChallengeLayout_Layout);
            centerWithinArea = typedarray.getFloat(3, 0.0F);
            childType = typedarray.getInt(2, 0);
            gravity = typedarray.getInt(0, 0);
            maxWidth = typedarray.getDimensionPixelSize(4, -1);
            maxHeight = typedarray.getDimensionPixelSize(1, -1);
            if (gravity == 0)
                if (multipanechallengelayout.mOrientation == 0)
                    switch (childType)
                    {
                    case 3: // '\003'
                        gravity = 81;
                        break;

                    case 2: // '\002'
                        gravity = 21;
                        break;

                    case 1: // '\001'
                        gravity = 19;
                        break;
                    }
                else
                    switch (childType)
                    {
                    case 3: // '\003'
                        gravity = 81;
                        break;

                    case 2: // '\002'
                        gravity = 81;
                        break;

                    case 1: // '\001'
                        gravity = 49;
                        break;
                    }
            typedarray.recycle();
        }

        public LayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
        {
            super(layoutparams);
            centerWithinArea = 0.0F;
            childType = 0;
            gravity = 0;
            maxWidth = -1;
            maxHeight = -1;
        }

        public LayoutParams(android.view.ViewGroup.MarginLayoutParams marginlayoutparams)
        {
            super(marginlayoutparams);
            centerWithinArea = 0.0F;
            childType = 0;
            gravity = 0;
            maxWidth = -1;
            maxHeight = -1;
        }

        public LayoutParams(LayoutParams layoutparams)
        {
            this(((android.view.ViewGroup.MarginLayoutParams) (layoutparams)));
            centerWithinArea = layoutparams.centerWithinArea;
            childType = layoutparams.childType;
            gravity = layoutparams.gravity;
            maxWidth = layoutparams.maxWidth;
            maxHeight = layoutparams.maxHeight;
        }
    }


    public static final int ANIMATE_BOUNCE_DURATION = 350;
    public static final int HORIZONTAL = 0;
    private static final String TAG = "MultiPaneChallengeLayout";
    public static final int VERTICAL = 1;
    private ChallengeLayout.OnBouncerStateChangedListener mBouncerListener;
    private KeyguardSecurityContainer mChallengeView;
    private final DisplayMetrics mDisplayMetrics;
    private boolean mIsBouncing;
    private IKeyguardLayer mKeyguardLayerBackground;
    private FrameLayout mKeyguardLayerBackgroundLayout;
    private View mKeyguardLayerBackgroundView;
    private IKeyguardLayer mKeyguardLayerForeground;
    private FrameLayout mKeyguardLayerForegroundLayout;
    private View mKeyguardLayerForegroundView;
    final int mOrientation;
    private final android.view.View.OnClickListener mScrimClickListener;
    private View mScrimView;
    private boolean mShowKeyguardLayer;
    private Runnable mShowKeyguardLayerRunnable = new Runnable() {

        final MultiPaneChallengeLayout this$0;

        public void run()
        {
            updateKeyguardLayerView(mShowKeyguardLayer);
            if (mKeyguardLayerForegroundLayout != null)
            {
                FrameLayout framelayout1 = mKeyguardLayerForegroundLayout;
                byte byte1;
                if (mShowKeyguardLayer)
                    byte1 = 0;
                else
                    byte1 = 4;
                framelayout1.setVisibility(byte1);
            }
            if (mKeyguardLayerBackgroundLayout != null)
            {
                FrameLayout framelayout = mKeyguardLayerBackgroundLayout;
                boolean flag = mShowKeyguardLayer;
                byte byte0 = 0;
                if (!flag)
                    byte0 = 4;
                framelayout.setVisibility(byte0);
            }
        }

            
            {
                this$0 = MultiPaneChallengeLayout.this;
                super();
            }
    }
;
    private final Rect mTempRect;
    private View mUserSwitcherView;
    private final Rect mZeroPadding;

    public MultiPaneChallengeLayout(Context context)
    {
        this(context, null);
    }

    public MultiPaneChallengeLayout(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public MultiPaneChallengeLayout(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mTempRect = new Rect();
        mZeroPadding = new Rect();
        mScrimClickListener = new android.view.View.OnClickListener() {

            final MultiPaneChallengeLayout this$0;

            public void onClick(View view)
            {
                hideBouncer();
            }

            
            {
                this$0 = MultiPaneChallengeLayout.this;
                super();
            }
        }
;
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.MultiPaneChallengeLayout, i, 0);
        mOrientation = typedarray.getInt(0, 0);
        typedarray.recycle();
        mDisplayMetrics = getResources().getDisplayMetrics();
        setSystemUiVisibility(256);
    }

    private int getVirtualHeight(LayoutParams layoutparams, int i, int j)
    {
        int k = i;
        View view = getRootView();
        if (view != null)
            k = mDisplayMetrics.heightPixels - view.getPaddingTop();
        if (layoutparams.childType != 1 && layoutparams.childType != 3)
        {
            if (layoutparams.childType != 7)
                return Math.min(k - j, i);
        } else
        {
            i = k - j;
        }
        return i;
    }

    private void layoutWithGravity(int i, int j, View view, Rect rect, boolean flag)
    {
        LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
        int k = getVirtualHeight(layoutparams, j, (rect.top + rect.bottom) - getPaddingTop() - getPaddingBottom());
        int l = Gravity.getAbsoluteGravity(layoutparams.gravity, getLayoutDirection());
        boolean flag1;
        if (layoutparams.centerWithinArea > 0.0F)
            flag1 = true;
        else
            flag1 = false;
        boolean flag2;
        if (flag1 && mOrientation == 0)
            flag2 = true;
        else
            flag2 = false;
        boolean flag3;
        if (flag1 && mOrientation == 1)
            flag3 = true;
        else
            flag3 = false;
        int i1;
        int j1;
        if (flag2)
        {
            i1 = (int)(0.5F + (float)(i - rect.left - rect.right) * layoutparams.centerWithinArea);
            j1 = k;
        } else
        if (flag3)
        {
            int i3 = k - getPaddingTop() - getPaddingBottom();
            i1 = i;
            j1 = (int)(0.5F + (float)i3 * layoutparams.centerWithinArea);
        } else
        {
            i1 = i;
            j1 = k;
        }
        boolean flag4 = Gravity.isVertical(l);
        boolean flag5 = Gravity.isHorizontal(l);
        int k1 = view.getMeasuredWidth();
        int l1 = view.getMeasuredHeight();
        int i2 = rect.left;
        int j2 = rect.top;
        int k2 = i2 + k1;
        int l2 = j2 + l1;
        switch (l & 0x70)
        {
        case 16: // '\020'
            j2 = rect.top + (k - l1) / 2;
            l2 = j2 + l1;
            break;

        case 80: // 'P'
            if (flag3)
                l2 = (k + rect.top) - (j1 - l1) / 2;
            else
                l2 = k + rect.top;
            j2 = l2 - l1;
            if (flag && flag4)
            {
                rect.bottom = k - j2;
                rect.top = rect.top + l1 / 2;
            }
            break;

        case 48: // '0'
            if (flag3)
                j2 = rect.top + (j1 - l1) / 2;
            else
                j2 = rect.top;
            l2 = j2 + l1;
            if (flag && flag4)
            {
                rect.top = l2;
                rect.bottom = rect.bottom + l1 / 2;
            }
            break;
        }
        switch (l & 7)
        {
        case 2: // '\002'
        case 4: // '\004'
        default:
            break;

        case 1: // '\001'
            i2 = (i - rect.left - rect.right - k1) / 2;
            k2 = i2 + k1;
            break;

        case 5: // '\005'
            if (flag2)
                k2 = i - rect.right - (i1 - k1) / 2;
            else
                k2 = i - rect.right;
            i2 = k2 - k1;
            if (flag && flag5 && !flag4)
            {
                rect.right = i - i2;
                rect.left = rect.left + k1 / 2;
            }
            break;

        case 3: // '\003'
            if (flag2)
                i2 = rect.left + (i1 - k1) / 2;
            else
                i2 = rect.left;
            k2 = i2 + k1;
            if (flag && flag5 && !flag4)
            {
                rect.left = k2;
                rect.right = rect.right + k1 / 2;
            }
            break;
        }
        view.layout(i2, j2, k2, l2);
    }

    private void updateKeyguardLayerPosition(int i)
    {
        if (mKeyguardLayerForegroundLayout != null && mChallengeView != null)
            mKeyguardLayerForegroundLayout.layout(mKeyguardLayerForegroundLayout.getLeft(), i - mKeyguardLayerForegroundLayout.getHeight(), mKeyguardLayerForegroundLayout.getRight(), i);
    }

    private void updateKeyguardLayerView(boolean flag)
    {
        KeyguardUtils.xlogD("MultiPaneChallengeLayout", (new StringBuilder()).append("updateDataUsageView show=").append(flag).toString());
        if (!flag || mKeyguardLayerBackgroundView != null || mKeyguardLayerForegroundView != null) goto _L2; else goto _L1
_L1:
        IPluginManager ipluginmanager;
        int i;
        Object aobj[] = new Object[4];
        aobj[0] = "create";
        aobj[1] = mContext;
        aobj[2] = com/mediatek/common/policy/IKeyguardLayer.getName();
        aobj[3] = null;
        ipluginmanager = (IPluginManager)MediatekClassFactory.createInstance(com/mediatek/common/pluginmanager/IPluginManager, aobj);
        i = ipluginmanager.getPluginCount();
        if (i == 0) goto _L4; else goto _L3
_L3:
        int j = 0;
_L11:
        if (j >= i) goto _L4; else goto _L5
_L5:
        IKeyguardLayer ikeyguardlayer;
        View view;
        ikeyguardlayer = (IKeyguardLayer)ipluginmanager.getPlugin(j).createObject();
        view = ikeyguardlayer.create();
        if (ikeyguardlayer.getKeyguardLayerInfo() == null) goto _L7; else goto _L6
_L6:
        mKeyguardLayerBackground = ikeyguardlayer;
        mKeyguardLayerBackgroundView = view;
          goto _L8
_L7:
        mKeyguardLayerForeground = ikeyguardlayer;
        mKeyguardLayerForegroundView = view;
          goto _L8
        Exception exception;
        exception;
        exception.printStackTrace();
_L2:
        return;
_L4:
        if (mKeyguardLayerForegroundLayout != null && mKeyguardLayerForegroundView != null)
        {
            LayoutParams layoutparams1 = new LayoutParams(-1, -1);
            mKeyguardLayerForegroundView.setLayoutParams(layoutparams1);
            mKeyguardLayerForegroundLayout.addView(mKeyguardLayerForegroundView);
        }
        if (mKeyguardLayerBackgroundLayout == null || mKeyguardLayerBackgroundView == null) goto _L2; else goto _L9
_L9:
        LayoutParams layoutparams = new LayoutParams(-1, -1);
        mKeyguardLayerBackgroundView.setLayoutParams(layoutparams);
        mKeyguardLayerBackgroundLayout.addView(mKeyguardLayerBackgroundView);
        return;
_L8:
        j++;
        if (true) goto _L11; else goto _L10
_L10:
    }

    protected boolean checkLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return layoutparams instanceof LayoutParams;
    }

    protected android.view.ViewGroup.LayoutParams generateDefaultLayoutParams()
    {
        return new LayoutParams();
    }

    public android.view.ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return new LayoutParams(getContext(), attributeset, this);
    }

    protected android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        if (layoutparams instanceof LayoutParams)
            return new LayoutParams((LayoutParams)layoutparams);
        if (layoutparams instanceof android.view.ViewGroup.MarginLayoutParams)
            return new LayoutParams((android.view.ViewGroup.MarginLayoutParams)layoutparams);
        else
            return new LayoutParams(layoutparams);
    }

    public int getBouncerAnimationDuration()
    {
        return 350;
    }

    public void hideBouncer()
    {
        if (mIsBouncing)
        {
            mIsBouncing = false;
            if (mScrimView != null)
            {
                if (mChallengeView != null)
                    mChallengeView.hideBouncer(350);
                ObjectAnimator objectanimator = ObjectAnimator.ofFloat(mScrimView, "alpha", new float[] {
                    0.0F
                });
                objectanimator.setDuration(350L);
                objectanimator.addListener(new AnimatorListenerAdapter() {

                    final MultiPaneChallengeLayout this$0;

                    public void onAnimationEnd(Animator animator)
                    {
                        mScrimView.setVisibility(4);
                    }

            
            {
                this$0 = MultiPaneChallengeLayout.this;
                super();
            }
                }
);
                objectanimator.start();
            }
            if (mBouncerListener != null)
            {
                mBouncerListener.onBouncerStateChanged(false);
                return;
            }
        }
    }

    public boolean isBouncing()
    {
        return mIsBouncing;
    }

    public boolean isChallengeOverlapping()
    {
        return false;
    }

    public boolean isChallengeShowing()
    {
        return true;
    }

    public void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        removeCallbacks(mShowKeyguardLayerRunnable);
        if (mKeyguardLayerBackground != null)
        {
            mKeyguardLayerBackground.destroy();
            mKeyguardLayerBackground = null;
        }
        if (mKeyguardLayerForeground != null)
        {
            mKeyguardLayerForeground.destroy();
            mKeyguardLayerForeground = null;
        }
    }

    public void onFinishInflate()
    {
        super.onFinishInflate();
        int i = getChildCount();
        for (int j = 0; j < i; j++)
        {
            View view = getChildAt(j);
            LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
            if (layoutparams.childType == 8)
            {
                mKeyguardLayerForegroundLayout = (FrameLayout)view;
                continue;
            }
            if (layoutparams.childType == 9)
            {
                mKeyguardLayerBackgroundLayout = (FrameLayout)view;
                continue;
            }
            if (layoutparams.childType != 2)
                continue;
            if (mChallengeView != null)
                throw new IllegalStateException("There may only be one child with layout_isChallenge=\"true\"");
            mChallengeView = (KeyguardSecurityContainer)view;
        }

    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        Rect rect = mTempRect;
        rect.left = getPaddingLeft();
        rect.top = getPaddingTop();
        rect.right = getPaddingRight();
        rect.bottom = getPaddingBottom();
        int i1 = k - i;
        int j1 = l - j;
        if (mUserSwitcherView != null && mUserSwitcherView.getVisibility() != 8)
            layoutWithGravity(i1, j1, mUserSwitcherView, rect, true);
        int k1 = getChildCount();
        for (int l1 = 0; l1 < k1; l1++)
        {
            View view = getChildAt(l1);
            LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
            if (view == mUserSwitcherView || view.getVisibility() == 8)
                continue;
            if (view == mScrimView)
            {
                view.layout(0, 0, i1, j1);
                continue;
            }
            if (layoutparams.childType == 7)
            {
                layoutWithGravity(i1, j1, view, mZeroPadding, false);
                continue;
            }
            if (layoutparams.childType == 8)
                continue;
            if (layoutparams.childType == 9)
                view.layout(i, j, k, l);
            if (mKeyguardLayerForegroundLayout != null)
                mKeyguardLayerForegroundLayout.layout(i, mChallengeView.getBottom() - mKeyguardLayerForegroundLayout.getMeasuredHeight(), k, mChallengeView.getBottom());
            layoutWithGravity(i1, j1, view, rect, false);
        }

    }

    protected void onMeasure(int i, int j)
    {
        if (android.view.View.MeasureSpec.getMode(i) == 0x40000000 && android.view.View.MeasureSpec.getMode(j) == 0x40000000)
        {
            int k = android.view.View.MeasureSpec.getSize(i);
            int l = android.view.View.MeasureSpec.getSize(j);
            setMeasuredDimension(k, l);
            int i1 = 0;
            int j1 = 0;
            mChallengeView = null;
            mUserSwitcherView = null;
            int k1 = getChildCount();
            for (int l1 = 0; l1 < k1; l1++)
            {
                View view1 = getChildAt(l1);
                LayoutParams layoutparams1 = (LayoutParams)view1.getLayoutParams();
                if (layoutparams1.childType == 2)
                {
                    if (mChallengeView != null)
                        throw new IllegalStateException("There may only be one child of type challenge");
                    if (!(view1 instanceof KeyguardSecurityContainer))
                        throw new IllegalArgumentException("Challenge must be a KeyguardSecurityContainer");
                    mChallengeView = (KeyguardSecurityContainer)view1;
                    continue;
                }
                if (layoutparams1.childType == 3)
                {
                    if (mUserSwitcherView != null)
                        throw new IllegalStateException("There may only be one child of type userSwitcher");
                    mUserSwitcherView = view1;
                    if (view1.getVisibility() == 8)
                        continue;
                    int i3 = i;
                    int j3 = j;
                    if (layoutparams1.maxWidth >= 0)
                        i3 = android.view.View.MeasureSpec.makeMeasureSpec(Math.min(layoutparams1.maxWidth, k), 0x40000000);
                    if (layoutparams1.maxHeight >= 0)
                        j3 = android.view.View.MeasureSpec.makeMeasureSpec(Math.min(layoutparams1.maxHeight, l), 0x40000000);
                    measureChildWithMargins(view1, i3, 0, j3, 0);
                    if (Gravity.isVertical(layoutparams1.gravity))
                    {
                        j1 = (int)((float)j1 + 1.5F * (float)view1.getMeasuredHeight());
                        continue;
                    }
                    if (Gravity.isHorizontal(layoutparams1.gravity))
                        i1 = (int)((float)i1 + 1.5F * (float)view1.getMeasuredWidth());
                    continue;
                }
                if (layoutparams1.childType == 4)
                {
                    setScrimView(view1);
                    view1.measure(i, j);
                }
            }

            for (int i2 = 0; i2 < k1; i2++)
            {
                View view = getChildAt(i2);
                LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
                if (layoutparams.childType == 3 || layoutparams.childType == 4 || view.getVisibility() == 8)
                    continue;
                int j2 = getVirtualHeight(layoutparams, l, j1);
                int k2;
                int l2;
                if (layoutparams.centerWithinArea > 0.0F)
                {
                    if (mOrientation == 0)
                    {
                        k2 = android.view.View.MeasureSpec.makeMeasureSpec((int)(0.5F + (float)(k - i1) * layoutparams.centerWithinArea), 0x40000000);
                        l2 = android.view.View.MeasureSpec.makeMeasureSpec(j2, 0x40000000);
                    } else
                    {
                        k2 = android.view.View.MeasureSpec.makeMeasureSpec(k - i1, 0x40000000);
                        l2 = android.view.View.MeasureSpec.makeMeasureSpec((int)(0.5F + (float)j2 * layoutparams.centerWithinArea), 0x40000000);
                    }
                } else
                {
                    k2 = android.view.View.MeasureSpec.makeMeasureSpec(k - i1, 0x40000000);
                    l2 = android.view.View.MeasureSpec.makeMeasureSpec(j2, 0x40000000);
                }
                if (layoutparams.maxWidth >= 0)
                    k2 = android.view.View.MeasureSpec.makeMeasureSpec(Math.min(layoutparams.maxWidth, android.view.View.MeasureSpec.getSize(k2)), 0x40000000);
                if (layoutparams.maxHeight >= 0)
                    l2 = android.view.View.MeasureSpec.makeMeasureSpec(Math.min(layoutparams.maxHeight, android.view.View.MeasureSpec.getSize(l2)), 0x40000000);
                measureChildWithMargins(view, k2, 0, l2, 0);
            }

            return;
        } else
        {
            throw new IllegalArgumentException("MultiPaneChallengeLayout must be measured with an exact size");
        }
    }

    public void requestChildFocus(View view, View view1)
    {
        if (mIsBouncing && view != mChallengeView)
            hideBouncer();
        super.requestChildFocus(view, view1);
    }

    public void setClipChildrenForNewEventView(boolean flag)
    {
        setClipChildren(flag);
        if (mChallengeView != null)
            mChallengeView.setClipChildrenForNewEventView(flag);
    }

    public void setOnBouncerStateChangedListener(ChallengeLayout.OnBouncerStateChangedListener onbouncerstatechangedlistener)
    {
        mBouncerListener = onbouncerstatechangedlistener;
    }

    void setScrimView(View view)
    {
        if (mScrimView != null)
            mScrimView.setOnClickListener(null);
        mScrimView = view;
        View view1 = mScrimView;
        float f;
        if (mIsBouncing)
            f = 1.0F;
        else
            f = 0.0F;
        view1.setAlpha(f);
        View view2 = mScrimView;
        byte byte0;
        if (mIsBouncing)
            byte0 = 0;
        else
            byte0 = 4;
        view2.setVisibility(byte0);
        mScrimView.setFocusable(true);
        mScrimView.setOnClickListener(mScrimClickListener);
    }

    public void setTouchRecepientForKeyguardLayer(MediatekGlowPadView mediatekglowpadview)
    {
        if (mKeyguardLayerForegroundLayout != null && mediatekglowpadview != null)
            mediatekglowpadview.setTouchRecepient(mKeyguardLayerForegroundLayout);
    }

    public void showBouncer()
    {
        if (!mIsBouncing)
        {
            mIsBouncing = true;
            if (mScrimView != null)
            {
                if (mChallengeView != null)
                    mChallengeView.showBouncer(350);
                ObjectAnimator objectanimator = ObjectAnimator.ofFloat(mScrimView, "alpha", new float[] {
                    1.0F
                });
                objectanimator.setDuration(350L);
                objectanimator.addListener(new AnimatorListenerAdapter() {

                    final MultiPaneChallengeLayout this$0;

                    public void onAnimationStart(Animator animator)
                    {
                        mScrimView.setVisibility(0);
                    }

            
            {
                this$0 = MultiPaneChallengeLayout.this;
                super();
            }
                }
);
                objectanimator.start();
            }
            if (mBouncerListener != null)
            {
                mBouncerListener.onBouncerStateChanged(true);
                return;
            }
        }
    }

    public void showChallenge(boolean flag)
    {
    }

    public void updateKeyguardLayerVisibility(boolean flag)
    {
        mShowKeyguardLayer = flag;
        removeCallbacks(mShowKeyguardLayerRunnable);
        post(mShowKeyguardLayerRunnable);
    }





}
