// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.*;
import android.os.Bundle;
import android.util.*;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.LinearInterpolator;
import com.mediatek.xlog.Xlog;
import java.lang.ref.WeakReference;
import java.util.HashMap;

// Referenced classes of package android.widget:
//            AdapterViewAnimator, ImageView, FrameLayout

public class StackView extends AdapterViewAnimator
{
    private static class HolographicHelper
    {

        private static final int CLICK_FEEDBACK = 1;
        private static final int RES_OUT;
        private final Paint mBlurPaint = new Paint();
        private final Canvas mCanvas = new Canvas();
        private float mDensity;
        private final Paint mErasePaint = new Paint();
        private final Paint mHolographicPaint = new Paint();
        private final Matrix mIdentityMatrix = new Matrix();
        private BlurMaskFilter mLargeBlurMaskFilter;
        private final Canvas mMaskCanvas = new Canvas();
        private BlurMaskFilter mSmallBlurMaskFilter;
        private final int mTmpXY[] = new int[2];

        Bitmap createClickOutline(View view, int i)
        {
            return createOutline(view, 1, i);
        }

        Bitmap createOutline(View view, int i, int j)
        {
            mHolographicPaint.setColor(j);
            if (i == 0)
                mBlurPaint.setMaskFilter(mSmallBlurMaskFilter);
            else
            if (i == 1)
                mBlurPaint.setMaskFilter(mLargeBlurMaskFilter);
            if (view.getMeasuredWidth() != 0 && view.getMeasuredHeight() != 0)
            {
                Bitmap bitmap = Bitmap.createBitmap(view.getResources().getDisplayMetrics(), view.getMeasuredWidth(), view.getMeasuredHeight(), android.graphics.Bitmap.Config.ARGB_8888);
                mCanvas.setBitmap(bitmap);
                float f = view.getRotationX();
                float f1 = view.getRotation();
                float f2 = view.getTranslationY();
                float f3 = view.getTranslationX();
                view.setRotationX(0.0F);
                view.setRotation(0.0F);
                view.setTranslationY(0.0F);
                view.setTranslationX(0.0F);
                view.draw(mCanvas);
                view.setRotationX(f);
                view.setRotation(f1);
                view.setTranslationY(f2);
                view.setTranslationX(f3);
                drawOutline(mCanvas, bitmap);
                mCanvas.setBitmap(null);
                return bitmap;
            } else
            {
                return null;
            }
        }

        Bitmap createResOutline(View view, int i)
        {
            return createOutline(view, 0, i);
        }

        void drawOutline(Canvas canvas, Bitmap bitmap)
        {
            int ai[] = mTmpXY;
            Bitmap bitmap1 = bitmap.extractAlpha(mBlurPaint, ai);
            mMaskCanvas.setBitmap(bitmap1);
            mMaskCanvas.drawBitmap(bitmap, -ai[0], -ai[1], mErasePaint);
            canvas.drawColor(0, android.graphics.PorterDuff.Mode.CLEAR);
            canvas.setMatrix(mIdentityMatrix);
            canvas.drawBitmap(bitmap1, ai[0], ai[1], mHolographicPaint);
            mMaskCanvas.setBitmap(null);
            bitmap1.recycle();
        }

        HolographicHelper(Context context)
        {
            mDensity = context.getResources().getDisplayMetrics().density;
            mHolographicPaint.setFilterBitmap(true);
            mHolographicPaint.setMaskFilter(TableMaskFilter.CreateClipTable(0, 30));
            mErasePaint.setXfermode(new PorterDuffXfermode(android.graphics.PorterDuff.Mode.DST_OUT));
            mErasePaint.setFilterBitmap(true);
            mSmallBlurMaskFilter = new BlurMaskFilter(2.0F * mDensity, android.graphics.BlurMaskFilter.Blur.NORMAL);
            mLargeBlurMaskFilter = new BlurMaskFilter(4F * mDensity, android.graphics.BlurMaskFilter.Blur.NORMAL);
        }
    }

    class LayoutParams extends android.view.ViewGroup.LayoutParams
    {

        private final Rect globalInvalidateRect;
        int horizontalOffset;
        private final Rect invalidateRect;
        private final RectF invalidateRectf;
        View mView;
        private final Rect parentRect;
        final StackView this$0;
        int verticalOffset;

        Rect getInvalidateRect()
        {
            return invalidateRect;
        }

        void invalidateGlobalRegion(View view, Rect rect)
        {
            globalInvalidateRect.set(rect);
            globalInvalidateRect.union(0, 0, getWidth(), getHeight());
            View view1 = view;
            if (view.getParent() != null && (view.getParent() instanceof View))
            {
                boolean flag = true;
                parentRect.set(0, 0, 0, 0);
                while (view1.getParent() != null && (view1.getParent() instanceof View) && !parentRect.contains(globalInvalidateRect)) 
                {
                    if (!flag)
                        globalInvalidateRect.offset(view1.getLeft() - view1.getScrollX(), view1.getTop() - view1.getScrollY());
                    view1 = (View)view1.getParent();
                    parentRect.set(view1.getScrollX(), view1.getScrollY(), view1.getWidth() + view1.getScrollX(), view1.getHeight() + view1.getScrollY());
                    view1.invalidate(globalInvalidateRect.left, globalInvalidateRect.top, globalInvalidateRect.right, globalInvalidateRect.bottom);
                    flag = false;
                }
                view1.invalidate(globalInvalidateRect.left, globalInvalidateRect.top, globalInvalidateRect.right, globalInvalidateRect.bottom);
                return;
            } else
            {
                return;
            }
        }

        void resetInvalidateRect()
        {
            invalidateRect.set(0, 0, 0, 0);
        }

        public void setHorizontalOffset(int i)
        {
            setOffsets(i, verticalOffset);
        }

        public void setOffsets(int i, int j)
        {
            int k = i - horizontalOffset;
            horizontalOffset = i;
            int l = j - verticalOffset;
            verticalOffset = j;
            if (mView != null)
            {
                mView.requestLayout();
                int i1 = Math.min(k + mView.getLeft(), mView.getLeft());
                int j1 = Math.max(k + mView.getRight(), mView.getRight());
                int k1 = Math.min(l + mView.getTop(), mView.getTop());
                int l1 = Math.max(l + mView.getBottom(), mView.getBottom());
                invalidateRectf.set(i1, k1, j1, l1);
                float f = -invalidateRectf.left;
                float f1 = -invalidateRectf.top;
                invalidateRectf.offset(f, f1);
                mView.getMatrix().mapRect(invalidateRectf);
                invalidateRectf.offset(-f, -f1);
                invalidateRect.set((int)Math.floor(invalidateRectf.left), (int)Math.floor(invalidateRectf.top), (int)Math.ceil(invalidateRectf.right), (int)Math.ceil(invalidateRectf.bottom));
                invalidateGlobalRegion(mView, invalidateRect);
            }
        }

        public void setVerticalOffset(int i)
        {
            setOffsets(horizontalOffset, i);
        }

        LayoutParams(Context context, AttributeSet attributeset)
        {
            this$0 = StackView.this;
            super(context, attributeset);
            parentRect = new Rect();
            invalidateRect = new Rect();
            invalidateRectf = new RectF();
            globalInvalidateRect = new Rect();
            horizontalOffset = 0;
            verticalOffset = 0;
            super.width = 0;
            super.height = 0;
        }

        LayoutParams(View view)
        {
            this$0 = StackView.this;
            super(0, 0);
            parentRect = new Rect();
            invalidateRect = new Rect();
            invalidateRectf = new RectF();
            globalInvalidateRect = new Rect();
            super.width = 0;
            super.height = 0;
            horizontalOffset = 0;
            verticalOffset = 0;
            mView = view;
        }
    }

    private static class StackFrame extends FrameLayout
    {

        WeakReference sliderAnimator;
        WeakReference transformAnimator;

        boolean cancelSliderAnimator()
        {
            if (sliderAnimator != null)
            {
                ObjectAnimator objectanimator = (ObjectAnimator)sliderAnimator.get();
                if (objectanimator != null)
                {
                    objectanimator.cancel();
                    return true;
                }
            }
            return false;
        }

        boolean cancelTransformAnimator()
        {
            if (transformAnimator != null)
            {
                ObjectAnimator objectanimator = (ObjectAnimator)transformAnimator.get();
                if (objectanimator != null)
                {
                    objectanimator.cancel();
                    return true;
                }
            }
            return false;
        }

        void setSliderAnimator(ObjectAnimator objectanimator)
        {
            sliderAnimator = new WeakReference(objectanimator);
        }

        void setTransformAnimator(ObjectAnimator objectanimator)
        {
            transformAnimator = new WeakReference(objectanimator);
        }

        public StackFrame(Context context)
        {
            super(context);
        }
    }

    private class StackSlider
    {

        static final int BEGINNING_OF_STACK_MODE = 1;
        static final int END_OF_STACK_MODE = 2;
        static final int NORMAL_MODE;
        int mMode;
        View mView;
        float mXProgress;
        float mYProgress;
        final StackView this$0;

        private float cubic(float f)
        {
            return (float)(1.0D + Math.pow(2.0F * f - 1.0F, 3D)) / 2.0F;
        }

        private float getDuration(boolean flag, float f)
        {
            if (mView != null)
            {
                LayoutParams layoutparams = (LayoutParams)mView.getLayoutParams();
                float f1 = (float)Math.sqrt(Math.pow(layoutparams.horizontalOffset, 2D) + Math.pow(layoutparams.verticalOffset, 2D));
                float f2 = (float)Math.sqrt(Math.pow(mSlideAmount, 2D) + Math.pow(0.4F * (float)mSlideAmount, 2D));
                float f3;
                if (f == 0.0F)
                {
                    float f4;
                    if (flag)
                        f4 = 1.0F - f1 / f2;
                    else
                        f4 = f1 / f2;
                    f3 = f4 * 400F;
                } else
                {
                    if (flag)
                        f3 = f1 / Math.abs(f);
                    else
                        f3 = (f2 - f1) / Math.abs(f);
                    if (f3 < 50F || f3 > 400F)
                        return getDuration(flag, 0.0F);
                }
                return f3;
            } else
            {
                return 0.0F;
            }
        }

        private float highlightAlphaInterpolator(float f)
        {
            if (f < 0.4F)
                return 0.85F * cubic(f / 0.4F);
            else
                return 0.85F * cubic(1.0F - (f - 0.4F) / (1.0F - 0.4F));
        }

        private float rotationInterpolator(float f)
        {
            if (f < 0.2F)
                return 0.0F;
            else
                return (f - 0.2F) / (1.0F - 0.2F);
        }

        private float viewAlphaInterpolator(float f)
        {
            if (f > 0.3F)
                return (f - 0.3F) / (1.0F - 0.3F);
            else
                return 0.0F;
        }

        float getDurationForNeutralPosition()
        {
            return getDuration(false, 0.0F);
        }

        float getDurationForNeutralPosition(float f)
        {
            return getDuration(false, f);
        }

        float getDurationForOffscreenPosition()
        {
            return getDuration(true, 0.0F);
        }

        float getDurationForOffscreenPosition(float f)
        {
            return getDuration(true, f);
        }

        public float getXProgress()
        {
            return mXProgress;
        }

        public float getYProgress()
        {
            return mYProgress;
        }

        void setMode(int i)
        {
            mMode = i;
        }

        void setView(View view)
        {
            mView = view;
        }

        public void setXProgress(float f)
        {
            float f1 = Math.max(-2F, Math.min(2.0F, f));
            mXProgress = f1;
            if (mView == null)
            {
                return;
            } else
            {
                LayoutParams layoutparams = (LayoutParams)mView.getLayoutParams();
                LayoutParams layoutparams1 = (LayoutParams)mHighlight.getLayoutParams();
                float f2 = f1 * 0.2F;
                layoutparams.setHorizontalOffset(Math.round(f2 * (float)mSlideAmount));
                layoutparams1.setHorizontalOffset(Math.round(f2 * (float)mSlideAmount));
                return;
            }
        }

        public void setYProgress(float f)
        {
            float f1 = Math.max(0.0F, Math.min(1.0F, f));
            mYProgress = f1;
            if (mView == null)
                return;
            LayoutParams layoutparams = (LayoutParams)mView.getLayoutParams();
            LayoutParams layoutparams1 = (LayoutParams)mHighlight.getLayoutParams();
            int i;
            if (mStackMode == 0)
                i = 1;
            else
                i = -1;
            if (Float.compare(0.0F, mYProgress) != 0 && Float.compare(1.0F, mYProgress) != 0)
            {
                if (mView.getLayerType() == 0)
                    mView.setLayerType(2, null);
            } else
            if (mView.getLayerType() != 0)
                mView.setLayerType(0, null);
            switch (mMode)
            {
            case 1: // '\001'
                float f4 = 0.2F * (1.0F - f1);
                layoutparams.setVerticalOffset(Math.round(f4 * (float)i * (float)mSlideAmount));
                layoutparams1.setVerticalOffset(Math.round(f4 * (float)i * (float)mSlideAmount));
                mHighlight.setAlpha(highlightAlphaInterpolator(f4));
                return;

            case 2: // '\002'
                float f3 = f1 * 0.2F;
                layoutparams.setVerticalOffset(Math.round(f3 * (float)(-i) * (float)mSlideAmount));
                layoutparams1.setVerticalOffset(Math.round(f3 * (float)(-i) * (float)mSlideAmount));
                mHighlight.setAlpha(highlightAlphaInterpolator(f3));
                return;

            case 0: // '\0'
                layoutparams.setVerticalOffset(Math.round(-f1 * (float)i * (float)mSlideAmount));
                layoutparams1.setVerticalOffset(Math.round(-f1 * (float)i * (float)mSlideAmount));
                mHighlight.setAlpha(highlightAlphaInterpolator(f1));
                float f2 = viewAlphaInterpolator(1.0F - f1);
                if (mView.getAlpha() == 0.0F && f2 != 0.0F && mView.getVisibility() != 0)
                    mView.setVisibility(0);
                else
                if (f2 == 0.0F && mView.getAlpha() != 0.0F && mView.getVisibility() == 0)
                    mView.setVisibility(4);
                mView.setAlpha(f2);
                mView.setRotationX(90F * (float)i * rotationInterpolator(f1));
                mHighlight.setRotationX(90F * (float)i * rotationInterpolator(f1));
                return;
            }
        }

        public StackSlider()
        {
            this$0 = StackView.this;
            super();
            mMode = 0;
        }

        public StackSlider(StackSlider stackslider)
        {
            this$0 = StackView.this;
            super();
            mMode = 0;
            mView = stackslider.mView;
            mYProgress = stackslider.mYProgress;
            mXProgress = stackslider.mXProgress;
            mMode = stackslider.mMode;
        }
    }


    private static final boolean DBG = true;
    private static final boolean DBG_MOTION = false;
    private static final boolean DBG_SHOW = false;
    private static final int DEFAULT_ANIMATION_DURATION = 400;
    private static final int FRAME_PADDING = 4;
    private static final int GESTURE_NONE = 0;
    private static final int GESTURE_SLIDE_DOWN = 2;
    private static final int GESTURE_SLIDE_UP = 1;
    private static final int INVALID_POINTER = -1;
    private static final int ITEMS_SLIDE_DOWN = 1;
    private static final int ITEMS_SLIDE_UP = 0;
    private static final int MINIMUM_ANIMATION_DURATION = 50;
    private static final int MIN_TIME_BETWEEN_INTERACTION_AND_AUTOADVANCE = 5000;
    private static final long MIN_TIME_BETWEEN_SCROLLS = 100L;
    private static final int NUM_ACTIVE_VIEWS = 5;
    private static final float PERSPECTIVE_SCALE_FACTOR = 0F;
    private static final float PERSPECTIVE_SHIFT_FACTOR_X = 0.1F;
    private static final float PERSPECTIVE_SHIFT_FACTOR_Y = 0.1F;
    private static final float SLIDE_UP_RATIO = 0.7F;
    private static final int STACK_RELAYOUT_DURATION = 100;
    private static final float SWIPE_THRESHOLD_RATIO = 0.2F;
    private static HolographicHelper sHolographicHelper;
    private final String TAG;
    private int mActivePointerId;
    private int mClickColor;
    private ImageView mClickFeedback;
    private boolean mClickFeedbackIsValid;
    private boolean mFirstLayoutHappened;
    private int mFramePadding;
    private ImageView mHighlight;
    private float mInitialX;
    private float mInitialY;
    private long mLastInteractionTime;
    private long mLastScrollTime;
    private int mMaximumVelocity;
    private float mNewPerspectiveShiftX;
    private float mNewPerspectiveShiftY;
    private float mPerspectiveShiftX;
    private float mPerspectiveShiftY;
    private int mResOutColor;
    private int mSlideAmount;
    private int mStackMode;
    private StackSlider mStackSlider;
    private int mSwipeGestureType;
    private int mSwipeThreshold;
    private final Rect mTouchRect;
    private int mTouchSlop;
    private boolean mTransitionIsSetup;
    private VelocityTracker mVelocityTracker;
    private int mYVelocity;
    private final Rect stackInvalidateRect;

    public StackView(Context context)
    {
        this(context, null);
    }

    public StackView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0x10103dd);
    }

    public StackView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        TAG = "StackView";
        mTouchRect = new Rect();
        mYVelocity = 0;
        mSwipeGestureType = 0;
        mTransitionIsSetup = false;
        mClickFeedbackIsValid = false;
        mFirstLayoutHappened = false;
        mLastInteractionTime = 0L;
        stackInvalidateRect = new Rect();
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.StackView, i, 0);
        mResOutColor = typedarray.getColor(0, 0);
        mClickColor = typedarray.getColor(1, 0);
        typedarray.recycle();
        int j = context.getResources().getThemeMainColor();
        if (j != 0)
        {
            mResOutColor = j;
            mClickColor = j;
        }
        initStackView();
    }

    private void beginGestureIfNeeded(float f)
    {
        boolean flag = true;
        if ((int)Math.abs(f) > mTouchSlop && mSwipeGestureType == 0)
        {
            int i;
            if (f < 0.0F)
                i = ((flag) ? 1 : 0);
            else
                i = 2;
            cancelLongPress();
            requestDisallowInterceptTouchEvent(flag);
            if (super.mAdapter != null)
            {
                int j = getCount();
                int k;
                if (mStackMode == 0)
                {
                    if (i == 2)
                        k = 0;
                    else
                        k = ((flag) ? 1 : 0);
                } else
                if (i == 2)
                    k = ((flag) ? 1 : 0);
                else
                    k = 0;
                int l;
                if (!super.mLoopViews || j != flag || (mStackMode != 0 || i != flag) && (mStackMode != flag || i != 2))
                    l = 0;
                else
                    l = ((flag) ? 1 : 0);
                int i1;
                if (!super.mLoopViews || j != flag || (mStackMode != flag || i != flag) && (mStackMode != 0 || i != 2))
                    i1 = 0;
                else
                    i1 = ((flag) ? 1 : 0);
                byte byte0;
                if (super.mLoopViews && i1 == 0 && l == 0)
                    byte0 = 0;
                else
                if (k + super.mCurrentWindowStartUnbounded != -1 && i1 == 0)
                {
                    if (k + super.mCurrentWindowStartUnbounded != j - 1 && l == 0)
                        byte0 = 0;
                    else
                        byte0 = 2;
                } else
                {
                    k++;
                    byte0 = 1;
                }
                if (byte0 != 0)
                    flag = false;
                mTransitionIsSetup = flag;
                View view = getViewAtRelativeIndex(k);
                if (view != null)
                {
                    setupStackSlider(view, byte0);
                    mSwipeGestureType = i;
                    cancelHandleClick();
                    return;
                }
            }
        }
    }

    private void handlePointerUp(MotionEvent motionevent)
    {
        int i = (int)(motionevent.getY(motionevent.findPointerIndex(mActivePointerId)) - mInitialY);
        mLastInteractionTime = System.currentTimeMillis();
        if (mVelocityTracker != null)
        {
            mVelocityTracker.computeCurrentVelocity(1000, mMaximumVelocity);
            mYVelocity = (int)mVelocityTracker.getYVelocity(mActivePointerId);
        }
        if (mVelocityTracker != null)
        {
            mVelocityTracker.recycle();
            mVelocityTracker = null;
        }
        if (i > mSwipeThreshold && mSwipeGestureType == 2 && mStackSlider.mMode == 0)
        {
            mSwipeGestureType = 0;
            if (mStackMode == 0)
                showPrevious();
            else
                showNext();
            mHighlight.bringToFront();
        } else
        if (i < -mSwipeThreshold && mSwipeGestureType == 1 && mStackSlider.mMode == 0)
        {
            mSwipeGestureType = 0;
            if (mStackMode == 0)
                showNext();
            else
                showPrevious();
            mHighlight.bringToFront();
        } else
        if (mSwipeGestureType == 1)
        {
            float f1;
            if (mStackMode == 1)
                f1 = 1.0F;
            else
                f1 = 0.0F;
            int k;
            if (mStackMode != 0 && mStackSlider.mMode == 0)
                k = Math.round(mStackSlider.getDurationForOffscreenPosition());
            else
                k = Math.round(mStackSlider.getDurationForNeutralPosition());
            StackSlider stackslider1 = new StackSlider(mStackSlider);
            PropertyValuesHolder propertyvaluesholder1 = PropertyValuesHolder.ofFloat("YProgress", new float[] {
                f1
            });
            ObjectAnimator objectanimator1 = ObjectAnimator.ofPropertyValuesHolder(stackslider1, new PropertyValuesHolder[] {
                PropertyValuesHolder.ofFloat("XProgress", new float[] {
                    0.0F
                }), propertyvaluesholder1
            });
            objectanimator1.setDuration(k);
            objectanimator1.setInterpolator(new LinearInterpolator());
            objectanimator1.start();
        } else
        if (mSwipeGestureType == 2)
        {
            float f;
            if (mStackMode == 1)
                f = 0.0F;
            else
                f = 1.0F;
            int j;
            if (mStackMode != 1 && mStackSlider.mMode == 0)
                j = Math.round(mStackSlider.getDurationForOffscreenPosition());
            else
                j = Math.round(mStackSlider.getDurationForNeutralPosition());
            StackSlider stackslider = new StackSlider(mStackSlider);
            PropertyValuesHolder propertyvaluesholder = PropertyValuesHolder.ofFloat("YProgress", new float[] {
                f
            });
            ObjectAnimator objectanimator = ObjectAnimator.ofPropertyValuesHolder(stackslider, new PropertyValuesHolder[] {
                PropertyValuesHolder.ofFloat("XProgress", new float[] {
                    0.0F
                }), propertyvaluesholder
            });
            objectanimator.setDuration(j);
            objectanimator.start();
        }
        mActivePointerId = -1;
        mSwipeGestureType = 0;
    }

    private void initStackView()
    {
        configureViewAnimator(5, 1);
        setStaticTransformationsEnabled(true);
        ViewConfiguration viewconfiguration = ViewConfiguration.get(getContext());
        mTouchSlop = viewconfiguration.getScaledTouchSlop();
        mMaximumVelocity = viewconfiguration.getScaledMaximumFlingVelocity();
        mActivePointerId = -1;
        mHighlight = new ImageView(getContext());
        mHighlight.setLayoutParams(new LayoutParams(mHighlight));
        addViewInLayout(mHighlight, -1, new LayoutParams(mHighlight));
        mClickFeedback = new ImageView(getContext());
        mClickFeedback.setLayoutParams(new LayoutParams(mClickFeedback));
        addViewInLayout(mClickFeedback, -1, new LayoutParams(mClickFeedback));
        mClickFeedback.setVisibility(4);
        mStackSlider = new StackSlider();
        if (sHolographicHelper == null)
            sHolographicHelper = new HolographicHelper(super.mContext);
        setClipChildren(false);
        setClipToPadding(false);
        mStackMode = 1;
        super.mWhichChild = -1;
        mFramePadding = (int)Math.ceil(4F * super.mContext.getResources().getDisplayMetrics().density);
    }

    private void measureChildren()
    {
        int i = getChildCount();
        int j = getMeasuredWidth();
        int k = getMeasuredHeight();
        int l = Math.round(0.9F * (float)j) - super.mPaddingLeft - super.mPaddingRight;
        int i1 = Math.round(0.9F * (float)k) - super.mPaddingTop - super.mPaddingBottom;
        int j1 = 0;
        int k1 = 0;
        for (int l1 = 0; l1 < i; l1++)
        {
            View view = getChildAt(l1);
            view.measure(android.view.View.MeasureSpec.makeMeasureSpec(l, 0x80000000), android.view.View.MeasureSpec.makeMeasureSpec(i1, 0x80000000));
            if (view == mHighlight || view == mClickFeedback)
                continue;
            int i2 = view.getMeasuredWidth();
            int j2 = view.getMeasuredHeight();
            if (i2 > j1)
                j1 = i2;
            if (j2 > k1)
                k1 = j2;
        }

        mNewPerspectiveShiftX = 0.1F * (float)j;
        mNewPerspectiveShiftY = 0.1F * (float)k;
        if (j1 > 0 && i > 0 && j1 < l)
            mNewPerspectiveShiftX = j - j1;
        if (k1 > 0 && i > 0 && k1 < i1)
            mNewPerspectiveShiftY = k - k1;
    }

    private void onLayout()
    {
        if (!mFirstLayoutHappened)
        {
            mFirstLayoutHappened = true;
            updateChildTransforms();
        }
        int i = Math.round(0.7F * (float)getMeasuredHeight());
        if (mSlideAmount != i)
        {
            mSlideAmount = i;
            mSwipeThreshold = Math.round(0.2F * (float)i);
        }
        if (Float.compare(mPerspectiveShiftY, mNewPerspectiveShiftY) != 0 || Float.compare(mPerspectiveShiftX, mNewPerspectiveShiftX) != 0)
        {
            mPerspectiveShiftY = mNewPerspectiveShiftY;
            mPerspectiveShiftX = mNewPerspectiveShiftX;
            updateChildTransforms();
        }
    }

    private void onSecondaryPointerUp(MotionEvent motionevent)
    {
        int i = motionevent.getActionIndex();
        if (motionevent.getPointerId(i) != mActivePointerId) goto _L2; else goto _L1
_L1:
        View view;
        int j;
        if (mSwipeGestureType == 2)
            j = 0;
        else
            j = 1;
        view = getViewAtRelativeIndex(j);
        if (view == null) goto _L2; else goto _L3
_L3:
        int k = 0;
_L6:
        if (k >= motionevent.getPointerCount()) goto _L5; else goto _L4
_L4:
        if (k == i)
            continue; /* Loop/switch isn't completed */
        float f = motionevent.getX(k);
        float f1 = motionevent.getY(k);
        mTouchRect.set(view.getLeft(), view.getTop(), view.getRight(), view.getBottom());
        if (!mTouchRect.contains(Math.round(f), Math.round(f1)))
            continue; /* Loop/switch isn't completed */
        float f2 = motionevent.getX(i);
        float f3 = motionevent.getY(i);
        mInitialY = mInitialY + (f1 - f3);
        mInitialX = mInitialX + (f - f2);
        mActivePointerId = motionevent.getPointerId(k);
        if (mVelocityTracker != null)
        {
            mVelocityTracker.clear();
            return;
        }
_L2:
        return;
        k++;
          goto _L6
_L5:
        handlePointerUp(motionevent);
        return;
    }

    private void pacedScroll(boolean flag)
    {
        if (System.currentTimeMillis() - mLastScrollTime > 100L)
        {
            if (flag)
                showPrevious();
            else
                showNext();
            mLastScrollTime = System.currentTimeMillis();
        }
    }

    private void setupStackSlider(View view, int i)
    {
        mStackSlider.setMode(i);
        if (view != null)
        {
            mHighlight.setImageBitmap(sHolographicHelper.createResOutline(view, mResOutColor));
            mHighlight.setRotation(view.getRotation());
            mHighlight.setTranslationY(view.getTranslationY());
            mHighlight.setTranslationX(view.getTranslationX());
            mHighlight.bringToFront();
            view.bringToFront();
            mStackSlider.setView(view);
            view.setVisibility(0);
        }
    }

    private void transformViewAtIndex(int i, View view, boolean flag)
    {
        float f = mPerspectiveShiftY;
        float f1 = mPerspectiveShiftX;
        int j;
        if (mStackMode == 1)
        {
            j = -1 + (super.mMaxNumActiveViews - i);
            int k = -1 + super.mMaxNumActiveViews;
            if (j == k)
                j--;
        } else
        {
            j = i - 1;
            if (j < 0)
                j++;
        }
        float f2 = (1.0F * (float)j) / (float)(-2 + super.mMaxNumActiveViews);
        float f3 = 1.0F - 0.0F * (1.0F - f2);
        float f4 = f2 * f + (f3 - 1.0F) * ((0.9F * (float)getMeasuredHeight()) / 2.0F);
        float f5 = f1 * (1.0F - f2) + (1.0F - f3) * ((0.9F * (float)getMeasuredWidth()) / 2.0F);
        if (view instanceof StackFrame)
            ((StackFrame)view).cancelTransformAnimator();
        if (flag)
        {
            PropertyValuesHolder propertyvaluesholder = PropertyValuesHolder.ofFloat("translationX", new float[] {
                f5
            });
            PropertyValuesHolder propertyvaluesholder1 = PropertyValuesHolder.ofFloat("translationY", new float[] {
                f4
            });
            ObjectAnimator objectanimator = ObjectAnimator.ofPropertyValuesHolder(view, new PropertyValuesHolder[] {
                PropertyValuesHolder.ofFloat("scaleX", new float[] {
                    f3
                }), PropertyValuesHolder.ofFloat("scaleY", new float[] {
                    f3
                }), propertyvaluesholder1, propertyvaluesholder
            });
            objectanimator.setDuration(100L);
            if (view instanceof StackFrame)
                ((StackFrame)view).setTransformAnimator(objectanimator);
            objectanimator.start();
            return;
        } else
        {
            view.setTranslationX(f5);
            view.setTranslationY(f4);
            view.setScaleX(f3);
            view.setScaleY(f3);
            return;
        }
    }

    private void updateChildTransforms()
    {
        for (int i = 0; i < getNumActiveViews(); i++)
        {
            View view = getViewAtRelativeIndex(i);
            if (view != null)
                transformViewAtIndex(i, view, false);
        }

    }

    public void advance()
    {
        long l = System.currentTimeMillis() - mLastInteractionTime;
        if (super.mAdapter != null && (getCount() != 1 || !super.mLoopViews) && mSwipeGestureType == 0 && l > 5000L)
        {
            showNext();
            return;
        } else
        {
            return;
        }
    }

    void applyTransformForChildAtIndex(View view, int i)
    {
    }

    volatile android.view.ViewGroup.LayoutParams createOrReuseLayoutParams(View view)
    {
        return createOrReuseLayoutParams(view);
    }

    LayoutParams createOrReuseLayoutParams(View view)
    {
        android.view.ViewGroup.LayoutParams layoutparams = view.getLayoutParams();
        if (layoutparams instanceof LayoutParams)
        {
            LayoutParams layoutparams1 = (LayoutParams)layoutparams;
            layoutparams1.setHorizontalOffset(0);
            layoutparams1.setVerticalOffset(0);
            layoutparams1.width = 0;
            layoutparams1.width = 0;
            return layoutparams1;
        } else
        {
            return new LayoutParams(view);
        }
    }

    protected void dispatchDraw(Canvas canvas)
    {
        boolean flag = false;
        canvas.getClipBounds(stackInvalidateRect);
        int i = getChildCount();
        for (int j = 0; j < i; j++)
        {
            View view = getChildAt(j);
            LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
            if (layoutparams.horizontalOffset == 0 && layoutparams.verticalOffset == 0 || view.getAlpha() == 0.0F || view.getVisibility() != 0)
                layoutparams.resetInvalidateRect();
            Rect rect = layoutparams.getInvalidateRect();
            if (!rect.isEmpty())
            {
                flag = true;
                stackInvalidateRect.union(rect);
            }
        }

        if (flag)
        {
            canvas.save(2);
            canvas.clipRect(stackInvalidateRect, android.graphics.Region.Op.UNION);
            super.dispatchDraw(canvas);
            canvas.restore();
            return;
        } else
        {
            super.dispatchDraw(canvas);
            return;
        }
    }

    FrameLayout getFrameForChild()
    {
        StackFrame stackframe = new StackFrame(super.mContext);
        stackframe.setPadding(mFramePadding, mFramePadding, mFramePadding, mFramePadding);
        return stackframe;
    }

    void hideTapFeedback(View view)
    {
        mClickFeedback.setVisibility(4);
        invalidate();
    }

    public boolean onGenericMotionEvent(MotionEvent motionevent)
    {
        if ((2 & motionevent.getSource()) != 0)
            switch (motionevent.getAction())
            {
            case 8: // '\b'
                float f = motionevent.getAxisValue(9);
                if (f < 0.0F)
                {
                    pacedScroll(false);
                    return true;
                }
                if (f > 0.0F)
                {
                    pacedScroll(true);
                    return true;
                }
                break;
            }
        return super.onGenericMotionEvent(motionevent);
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/StackView.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        boolean flag = true;
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/StackView.getName());
        if (getChildCount() <= flag)
            flag = false;
        accessibilitynodeinfo.setScrollable(flag);
        if (isEnabled())
        {
            if (getDisplayedChild() < -1 + getChildCount())
                accessibilitynodeinfo.addAction(4096);
            if (getDisplayedChild() > 0)
                accessibilitynodeinfo.addAction(8192);
        }
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        int i = motionevent.getAction();
        switch (i & 0xff)
        {
        case 4: // '\004'
        case 5: // '\005'
        default:
            break;

        case 1: // '\001'
        case 3: // '\003'
            mActivePointerId = -1;
            mSwipeGestureType = 0;
            break;

        case 6: // '\006'
            onSecondaryPointerUp(motionevent);
            break;

        case 2: // '\002'
            int k = motionevent.findPointerIndex(mActivePointerId);
            if (k == -1)
            {
                Log.d("StackView", "Error: No data for our primary pointer.");
                return false;
            }
            beginGestureIfNeeded(motionevent.getY(k) - mInitialY);
            break;

        case 0: // '\0'
            if (mActivePointerId == -1)
            {
                mInitialX = motionevent.getX();
                mInitialY = motionevent.getY();
                mActivePointerId = motionevent.getPointerId(0);
            }
            break;
        }
        Log.d("StackView", (new StringBuilder()).append("onInterceptTouchEvent end: action = ").append(i).append(",x = ").append(motionevent.getX()).append(",y = ").append(motionevent.getY()).append(",mSwipeGestureType = ").append(mSwipeGestureType).toString());
        int j = mSwipeGestureType;
        boolean flag = false;
        if (j != 0)
            flag = true;
        return flag;
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        checkForAndHandleDataChanged();
        int i1 = getChildCount();
        for (int j1 = 0; j1 < i1; j1++)
        {
            View view = getChildAt(j1);
            int k1 = super.mPaddingLeft + view.getMeasuredWidth();
            int l1 = super.mPaddingTop + view.getMeasuredHeight();
            LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
            view.layout(super.mPaddingLeft + layoutparams.horizontalOffset, super.mPaddingTop + layoutparams.verticalOffset, k1 + layoutparams.horizontalOffset, l1 + layoutparams.verticalOffset);
        }

        onLayout();
    }

    protected void onMeasure(int i, int j)
    {
        int k = android.view.View.MeasureSpec.getSize(i);
        int l = android.view.View.MeasureSpec.getSize(j);
        int i1 = android.view.View.MeasureSpec.getMode(i);
        int j1 = android.view.View.MeasureSpec.getMode(j);
        boolean flag;
        if (super.mReferenceChildWidth != -1 && super.mReferenceChildHeight != -1)
            flag = true;
        else
            flag = false;
        if (j1 == 0)
        {
            if (flag)
                l = Math.round((float)super.mReferenceChildHeight * (1.0F + 1.111111F)) + super.mPaddingTop + super.mPaddingBottom;
            else
                l = 0;
        } else
        if (j1 == 0x80000000)
            if (flag)
            {
                int l1 = Math.round((float)super.mReferenceChildHeight * (1.0F + 1.111111F)) + super.mPaddingTop + super.mPaddingBottom;
                if (l1 <= l)
                    l = l1;
                else
                    l |= 0x1000000;
            } else
            {
                l = 0;
            }
        if (i1 == 0)
        {
            if (flag)
                k = Math.round((float)super.mReferenceChildWidth * (1.0F + 1.111111F)) + super.mPaddingLeft + super.mPaddingRight;
            else
                k = 0;
        } else
        if (j1 == 0x80000000)
            if (flag)
            {
                int k1 = super.mReferenceChildWidth + super.mPaddingLeft + super.mPaddingRight;
                if (k1 <= k)
                    k = k1;
                else
                    k |= 0x1000000;
            } else
            {
                k = 0;
            }
        setMeasuredDimension(k, l);
        measureChildren();
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        super.onTouchEvent(motionevent);
        int i = motionevent.getAction();
        int j = motionevent.findPointerIndex(mActivePointerId);
        if (j == -1)
        {
            Log.d("StackView", "Error: No data for our primary pointer.");
            return false;
        }
        float f = motionevent.getY(j);
        float f1 = motionevent.getX(j);
        float f2 = f - mInitialY;
        float f3 = f1 - mInitialX;
        if (mVelocityTracker == null)
            mVelocityTracker = VelocityTracker.obtain();
        mVelocityTracker.addMovement(motionevent);
        switch (i & 0xff)
        {
        case 4: // '\004'
        case 5: // '\005'
        default:
            break;

        case 3: // '\003'
            mActivePointerId = -1;
            mSwipeGestureType = 0;
            break;

        case 6: // '\006'
            onSecondaryPointerUp(motionevent);
            break;

        case 1: // '\001'
            handlePointerUp(motionevent);
            break;

        case 2: // '\002'
            beginGestureIfNeeded(f2);
            float f4 = f3 / (1.0F * (float)mSlideAmount);
            if (mSwipeGestureType == 2)
            {
                float f6 = 1.0F * ((f2 - 1.0F * (float)mTouchSlop) / (float)mSlideAmount);
                if (mStackMode == 1)
                    f6 = 1.0F - f6;
                mStackSlider.setYProgress(1.0F - f6);
                mStackSlider.setXProgress(f4);
                return true;
            }
            if (mSwipeGestureType != 1)
                break;
            float f5 = 1.0F * (-(f2 + 1.0F * (float)mTouchSlop) / (float)mSlideAmount);
            if (mStackMode == 1)
                f5 = 1.0F - f5;
            mStackSlider.setYProgress(f5);
            mStackSlider.setXProgress(f4);
            return true;
        }
        return true;
    }

    public boolean performAccessibilityAction(int i, Bundle bundle)
    {
        if (super.performAccessibilityAction(i, bundle))
            return true;
        if (!isEnabled())
            return false;
        switch (i)
        {
        case 8192: 
            if (getDisplayedChild() > 0)
            {
                showPrevious();
                return true;
            } else
            {
                return false;
            }

        case 4096: 
            if (getDisplayedChild() < -1 + getChildCount())
            {
                showNext();
                return true;
            } else
            {
                return false;
            }
        }
        return false;
    }

    public void showNext()
    {
        if (mSwipeGestureType != 0)
            return;
        if (!mTransitionIsSetup)
        {
            View view = getViewAtRelativeIndex(1);
            if (view != null)
            {
                setupStackSlider(view, 0);
                mStackSlider.setYProgress(0.0F);
                mStackSlider.setXProgress(0.0F);
            }
        }
        super.showNext();
    }

    void showOnly(int i, boolean flag)
    {
        super.showOnly(i, flag);
        Xlog.d("StackView", (new StringBuilder()).append("showOnly: childIndex = ").append(i).append(",mCurrentWindowStart = ").append(super.mCurrentWindowStart).append(",mCurrentWindowEnd = ").append(super.mCurrentWindowEnd).append(",mWhichChild = ").append(super.mWhichChild).append(",mHighlight = ").append(mHighlight).toString());
        for (int j = super.mCurrentWindowEnd; j >= super.mCurrentWindowStart; j--)
        {
            int k = modulo(j, getWindowSize());
            if ((AdapterViewAnimator.ViewAndMetaData)super.mViewsMap.get(Integer.valueOf(k)) == null)
                continue;
            View view = ((AdapterViewAnimator.ViewAndMetaData)super.mViewsMap.get(Integer.valueOf(k))).view;
            if (view != null)
                view.bringToFront();
        }

        if (mHighlight != null)
            mHighlight.bringToFront();
        mTransitionIsSetup = false;
        mClickFeedbackIsValid = false;
    }

    public void showPrevious()
    {
        if (mSwipeGestureType != 0)
            return;
        if (!mTransitionIsSetup)
        {
            View view = getViewAtRelativeIndex(0);
            if (view != null)
            {
                setupStackSlider(view, 0);
                mStackSlider.setYProgress(1.0F);
                mStackSlider.setXProgress(0.0F);
            }
        }
        super.showPrevious();
    }

    void showTapFeedback(View view)
    {
        updateClickFeedback();
        mClickFeedback.setVisibility(0);
        mClickFeedback.bringToFront();
        invalidate();
    }

    void transformViewForTransition(int i, int j, final View view, boolean flag)
    {
        if (!flag)
        {
            ((StackFrame)view).cancelSliderAnimator();
            view.setRotationX(0.0F);
            LayoutParams layoutparams1 = (LayoutParams)view.getLayoutParams();
            layoutparams1.setVerticalOffset(0);
            layoutparams1.setHorizontalOffset(0);
        }
        if (i == -1 && j == -1 + getNumActiveViews())
        {
            transformViewAtIndex(j, view, false);
            view.setVisibility(0);
            view.setAlpha(1.0F);
        } else
        if (i == 0 && j == 1)
        {
            ((StackFrame)view).cancelSliderAnimator();
            view.setVisibility(0);
            int l = Math.round(mStackSlider.getDurationForNeutralPosition(mYVelocity));
            StackSlider stackslider1 = new StackSlider(mStackSlider);
            stackslider1.setView(view);
            if (flag)
            {
                PropertyValuesHolder propertyvaluesholder1 = PropertyValuesHolder.ofFloat("YProgress", new float[] {
                    0.0F
                });
                ObjectAnimator objectanimator1 = ObjectAnimator.ofPropertyValuesHolder(stackslider1, new PropertyValuesHolder[] {
                    PropertyValuesHolder.ofFloat("XProgress", new float[] {
                        0.0F
                    }), propertyvaluesholder1
                });
                objectanimator1.setDuration(l);
                objectanimator1.setInterpolator(new LinearInterpolator());
                ((StackFrame)view).setSliderAnimator(objectanimator1);
                objectanimator1.start();
            } else
            {
                stackslider1.setYProgress(0.0F);
                stackslider1.setXProgress(0.0F);
            }
        } else
        if (i == 1 && j == 0)
        {
            ((StackFrame)view).cancelSliderAnimator();
            int k = Math.round(mStackSlider.getDurationForOffscreenPosition(mYVelocity));
            StackSlider stackslider = new StackSlider(mStackSlider);
            stackslider.setView(view);
            if (flag)
            {
                PropertyValuesHolder propertyvaluesholder = PropertyValuesHolder.ofFloat("YProgress", new float[] {
                    1.0F
                });
                ObjectAnimator objectanimator = ObjectAnimator.ofPropertyValuesHolder(stackslider, new PropertyValuesHolder[] {
                    PropertyValuesHolder.ofFloat("XProgress", new float[] {
                        0.0F
                    }), propertyvaluesholder
                });
                objectanimator.setDuration(k);
                objectanimator.setInterpolator(new LinearInterpolator());
                ((StackFrame)view).setSliderAnimator(objectanimator);
                objectanimator.start();
            } else
            {
                stackslider.setYProgress(1.0F);
                stackslider.setXProgress(0.0F);
            }
        } else
        if (j == 0)
        {
            view.setAlpha(0.0F);
            view.setVisibility(4);
        } else
        if ((i == 0 || i == 1) && j > 1)
        {
            view.setVisibility(0);
            view.setAlpha(1.0F);
            view.setRotationX(0.0F);
            LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
            layoutparams.setVerticalOffset(0);
            layoutparams.setHorizontalOffset(0);
        } else
        if (i == -1)
        {
            view.setAlpha(1.0F);
            view.setVisibility(0);
        } else
        if (j == -1)
            if (flag)
                postDelayed(new Runnable() {

                    final StackView this$0;
                    final View val$view;

                    public void run()
                    {
                        view.setAlpha(0.0F);
                    }

            
            {
                this$0 = StackView.this;
                view = view1;
                super();
            }
                }
, 100L);
            else
                view.setAlpha(0.0F);
        if (j != -1)
            transformViewAtIndex(j, view, flag);
    }

    void updateClickFeedback()
    {
        if (!mClickFeedbackIsValid)
        {
            View view = getViewAtRelativeIndex(1);
            if (view != null)
            {
                mClickFeedback.setImageBitmap(sHolographicHelper.createClickOutline(view, mClickColor));
                mClickFeedback.setTranslationX(view.getTranslationX());
                mClickFeedback.setTranslationY(view.getTranslationY());
            }
            mClickFeedbackIsValid = true;
        }
    }



}
