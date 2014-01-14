// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.animation.*;
import android.appwidget.AppWidgetHostView;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            CheckLongPressHelper, KeyguardUpdateMonitor, KeyguardStatusView, KeyguardUpdateMonitorCallback

public class KeyguardWidgetFrame extends FrameLayout
{

    static final boolean ENABLE_HOVER_OVER_DELETE_DROP_TARGET_OVERLAY = true;
    static final int HOVER_OVER_DELETE_DROP_TARGET_OVERLAY_COLOR = 0x99ff0000;
    static final float OUTLINE_ALPHA_MULTIPLIER = 0.6F;
    private static final PorterDuffXfermode sAddBlendMode;
    private float mBackgroundAlpha;
    private float mBackgroundAlphaMultiplier;
    private Drawable mBackgroundDrawable;
    private Rect mBackgroundRect;
    private Object mBgAlphaController;
    private float mContentAlpha;
    private int mForegroundAlpha;
    private LinearGradient mForegroundGradient;
    private final Rect mForegroundRect;
    private Animator mFrameFade;
    private int mFrameHeight;
    private int mFrameStrokeAdjustment;
    private int mGradientColor;
    private Paint mGradientPaint;
    private boolean mIsHoveringOverDeleteDropTarget;
    private boolean mIsSmall;
    boolean mLeftToRight;
    private LinearGradient mLeftToRightGradient;
    private CheckLongPressHelper mLongPressHelper;
    private int mMaxChallengeTop;
    private float mOverScrollAmount;
    private boolean mPerformAppWidgetSizeUpdateOnBootComplete;
    private LinearGradient mRightToLeftGradient;
    private int mSmallFrameHeight;
    private int mSmallWidgetHeight;
    private KeyguardUpdateMonitorCallback mUpdateMonitorCallbacks = new KeyguardUpdateMonitorCallback() {

        final KeyguardWidgetFrame this$0;

        public void onBootCompleted()
        {
            if (mPerformAppWidgetSizeUpdateOnBootComplete)
            {
                performAppWidgetSizeCallbacksIfNecessary();
                mPerformAppWidgetSizeUpdateOnBootComplete = false;
            }
        }

            
            {
                this$0 = KeyguardWidgetFrame.this;
                super();
            }
    }
;
    private boolean mWidgetLockedSmall;
    private Handler mWorkerHandler;

    public KeyguardWidgetFrame(Context context)
    {
        this(context, null, 0);
    }

    public KeyguardWidgetFrame(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public KeyguardWidgetFrame(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mGradientPaint = new Paint();
        mLeftToRight = true;
        mOverScrollAmount = 0.0F;
        mForegroundRect = new Rect();
        mForegroundAlpha = 0;
        mIsSmall = false;
        mBackgroundAlphaMultiplier = 1.0F;
        mBackgroundRect = new Rect();
        mWidgetLockedSmall = false;
        mMaxChallengeTop = -1;
        mLongPressHelper = new CheckLongPressHelper(this);
        Resources resources = context.getResources();
        float f = resources.getDisplayMetrics().density;
        int j = (int)(8F * resources.getDisplayMetrics().density);
        setPadding(j, j, j, j);
        mFrameStrokeAdjustment = 2 + (int)(2.0F * f);
        mSmallWidgetHeight = resources.getDimensionPixelSize(0x1050076);
        mBackgroundDrawable = resources.getDrawable(0x10803c5);
        mGradientColor = resources.getColor(0x1060048);
        mGradientPaint.setXfermode(sAddBlendMode);
    }

    private void drawGradientOverlay(Canvas canvas)
    {
        mGradientPaint.setShader(mForegroundGradient);
        mGradientPaint.setAlpha(mForegroundAlpha);
        canvas.drawRect(mForegroundRect, mGradientPaint);
    }

    private void drawHoveringOverDeleteOverlay(Canvas canvas)
    {
        if (mIsHoveringOverDeleteDropTarget)
            canvas.drawColor(0x99ff0000);
    }

    private void performAppWidgetSizeCallbacksIfNecessary()
    {
        View view = getContent();
        if (!(view instanceof AppWidgetHostView))
            return;
        if (!KeyguardUpdateMonitor.getInstance(mContext).hasBootCompleted())
        {
            mPerformAppWidgetSizeUpdateOnBootComplete = true;
            return;
        } else
        {
            AppWidgetHostView appwidgethostview = (AppWidgetHostView)view;
            float f = getResources().getDisplayMetrics().density;
            int i = (int)((float)view.getMeasuredWidth() / f);
            int j = (int)((float)view.getMeasuredHeight() / f);
            appwidgethostview.updateAppWidgetSize(null, i, j, i, j, true);
            return;
        }
    }

    private void setWidgetHeight(int i)
    {
        View view = getContent();
        boolean flag = false;
        if (view != null)
        {
            android.widget.FrameLayout.LayoutParams layoutparams = (android.widget.FrameLayout.LayoutParams)view.getLayoutParams();
            int j = layoutparams.height;
            flag = false;
            if (j != i)
            {
                flag = true;
                layoutparams.height = i;
            }
        }
        if (flag)
            requestLayout();
    }

    private void updateGradient()
    {
        float f;
        if (mLeftToRight)
            f = 0.0F;
        else
            f = mForegroundRect.width();
        float f1;
        if (mLeftToRight)
            f1 = mForegroundRect.width();
        else
            f1 = 0.0F;
        mLeftToRightGradient = new LinearGradient(f, 0.0F, f1, 0.0F, mGradientColor, 0, android.graphics.Shader.TileMode.CLAMP);
        int i = mGradientColor;
        android.graphics.Shader.TileMode tilemode = android.graphics.Shader.TileMode.CLAMP;
        mRightToLeftGradient = new LinearGradient(f1, 0.0F, f, 0.0F, i, 0, tilemode);
    }

    public void adjustFrame(int i)
    {
        setFrameHeight(i + getPaddingBottom());
    }

    public void cancelLongPress()
    {
        super.cancelLongPress();
        mLongPressHelper.cancelLongPress();
    }

    public void disableHardwareLayers()
    {
        setLayerType(0, null);
    }

    public void disableHardwareLayersForContent()
    {
        View view = getContent();
        if (view != null)
            view.setLayerType(0, null);
    }

    protected void dispatchDraw(Canvas canvas)
    {
        canvas.save();
        drawBg(canvas);
        super.dispatchDraw(canvas);
        drawGradientOverlay(canvas);
        drawHoveringOverDeleteOverlay(canvas);
        canvas.restore();
    }

    protected void drawBg(Canvas canvas)
    {
        if (mBackgroundAlpha > 0.0F)
        {
            Drawable drawable = mBackgroundDrawable;
            drawable.setAlpha((int)(255F * (mBackgroundAlpha * mBackgroundAlphaMultiplier)));
            drawable.setBounds(mBackgroundRect);
            drawable.draw(canvas);
        }
    }

    public void enableHardwareLayers()
    {
        setLayerType(2, null);
    }

    public void enableHardwareLayersForContent()
    {
        View view = getContent();
        if (view != null)
            view.setLayerType(2, null);
    }

    public void fadeFrame(Object obj, boolean flag, float f, int i)
    {
        if (flag)
            mBgAlphaController = obj;
        if (mBgAlphaController != obj && mBgAlphaController != null)
            return;
        if (mFrameFade != null)
        {
            mFrameFade.cancel();
            mFrameFade = null;
        }
        mFrameFade = ObjectAnimator.ofPropertyValuesHolder(this, new PropertyValuesHolder[] {
            PropertyValuesHolder.ofFloat("backgroundAlpha", new float[] {
                f
            })
        });
        mFrameFade.setDuration(i);
        mFrameFade.start();
    }

    public float getBackgroundAlpha()
    {
        return mBackgroundAlpha;
    }

    public float getBackgroundAlphaMultiplier()
    {
        return mBackgroundAlphaMultiplier;
    }

    public View getContent()
    {
        return getChildAt(0);
    }

    public float getContentAlpha()
    {
        return mContentAlpha;
    }

    public int getContentAppWidgetId()
    {
        View view = getContent();
        if (view instanceof AppWidgetHostView)
            return ((AppWidgetHostView)view).getAppWidgetId();
        if (view instanceof KeyguardStatusView)
            return ((KeyguardStatusView)view).getAppWidgetId();
        else
            return 0;
    }

    public int getSmallFrameHeight()
    {
        return mSmallFrameHeight;
    }

    public Handler getWorkerHandler()
    {
        return mWorkerHandler;
    }

    public void hideFrame(Object obj)
    {
        fadeFrame(obj, false, 0.0F, 375);
    }

    public boolean isSmall()
    {
        return mIsSmall;
    }

    public void onActive(boolean flag)
    {
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        KeyguardUpdateMonitor.getInstance(mContext).registerCallback(mUpdateMonitorCallbacks);
    }

    public void onBouncerShowing(boolean flag)
    {
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        cancelLongPress();
        KeyguardUpdateMonitor.getInstance(mContext).removeCallback(mUpdateMonitorCallbacks);
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        switch (motionevent.getAction())
        {
        case 1: // '\001'
        case 3: // '\003'
        case 5: // '\005'
            mLongPressHelper.cancelLongPress();
            break;

        case 2: // '\002'
            mLongPressHelper.onMove(motionevent);
            break;

        case 0: // '\0'
            mLongPressHelper.postCheckForLongPress(motionevent);
            break;
        }
        return false;
    }

    protected void onMeasure(int i, int j)
    {
        super.onMeasure(i, j);
        performAppWidgetSizeCallbacksIfNecessary();
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        super.onSizeChanged(i, j, k, l);
        if (!mIsSmall)
            mFrameHeight = j;
        mForegroundRect.set(mFrameStrokeAdjustment, mFrameStrokeAdjustment, i - mFrameStrokeAdjustment, Math.min(j, mFrameHeight) - mFrameStrokeAdjustment);
        mBackgroundRect.set(0, 0, getMeasuredWidth(), Math.min(j, mFrameHeight));
        updateGradient();
        invalidate();
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        switch (motionevent.getAction())
        {
        case 1: // '\001'
        case 3: // '\003'
        case 5: // '\005'
            mLongPressHelper.cancelLongPress();
            break;

        case 2: // '\002'
            mLongPressHelper.onMove(motionevent);
            break;
        }
        return true;
    }

    public boolean onUserInteraction(MotionEvent motionevent)
    {
        return false;
    }

    public void requestDisallowInterceptTouchEvent(boolean flag)
    {
        super.requestDisallowInterceptTouchEvent(flag);
        cancelLongPress();
    }

    public void resetSize()
    {
        mIsSmall = false;
        if (!mWidgetLockedSmall)
            setWidgetHeight(-1);
        setFrameHeight(getMeasuredHeight());
    }

    public void setBackgroundAlpha(float f)
    {
        if (Float.compare(mBackgroundAlpha, f) != 0)
        {
            mBackgroundAlpha = f;
            invalidate();
        }
    }

    public void setBackgroundAlphaMultiplier(float f)
    {
        if (Float.compare(mBackgroundAlphaMultiplier, f) != 0)
        {
            mBackgroundAlphaMultiplier = f;
            invalidate();
        }
    }

    public void setContentAlpha(float f)
    {
        mContentAlpha = f;
        View view = getContent();
        if (view != null)
            view.setAlpha(f);
    }

    public void setFrameHeight(int i)
    {
        mFrameHeight = i;
        mBackgroundRect.set(0, 0, getMeasuredWidth(), Math.min(mFrameHeight, getMeasuredHeight()));
        mForegroundRect.set(mFrameStrokeAdjustment, mFrameStrokeAdjustment, getMeasuredWidth() - mFrameStrokeAdjustment, Math.min(getMeasuredHeight(), mFrameHeight) - mFrameStrokeAdjustment);
        updateGradient();
        invalidate();
    }

    void setIsHoveringOverDeleteDropTarget(boolean flag)
    {
        if (mIsHoveringOverDeleteDropTarget != flag)
        {
            mIsHoveringOverDeleteDropTarget = flag;
            invalidate();
        }
    }

    public void setMaxChallengeTop(int i)
    {
        boolean flag;
        if (mMaxChallengeTop != i)
            flag = true;
        else
            flag = false;
        mMaxChallengeTop = i;
        mSmallWidgetHeight = i - getPaddingTop();
        mSmallFrameHeight = i + getPaddingBottom();
        if (flag && mIsSmall)
        {
            setWidgetHeight(mSmallWidgetHeight);
            setFrameHeight(mSmallFrameHeight);
        } else
        if (flag && mWidgetLockedSmall)
        {
            setWidgetHeight(mSmallWidgetHeight);
            return;
        }
    }

    void setOverScrollAmount(float f, boolean flag)
    {
        if (Float.compare(mOverScrollAmount, f) != 0)
        {
            mOverScrollAmount = f;
            LinearGradient lineargradient;
            if (flag)
                lineargradient = mLeftToRightGradient;
            else
                lineargradient = mRightToLeftGradient;
            mForegroundGradient = lineargradient;
            mForegroundAlpha = Math.round(255F * (0.5F * f));
            setBackgroundAlpha(Math.min(0.6F + 0.4F * f, 1.0F));
            invalidate();
        }
    }

    public void setWidgetLockedSmall(boolean flag)
    {
        if (flag)
            setWidgetHeight(mSmallWidgetHeight);
        mWidgetLockedSmall = flag;
    }

    public void setWorkerHandler(Handler handler)
    {
        mWorkerHandler = handler;
    }

    public void showFrame(Object obj)
    {
        fadeFrame(obj, true, 0.6F, 100);
    }

    public void shrinkWidget()
    {
        shrinkWidget(true);
    }

    public void shrinkWidget(boolean flag)
    {
        mIsSmall = true;
        setWidgetHeight(mSmallWidgetHeight);
        if (flag)
            setFrameHeight(mSmallFrameHeight);
    }

    static 
    {
        sAddBlendMode = new PorterDuffXfermode(android.graphics.PorterDuff.Mode.ADD);
    }



/*
    static boolean access$002(KeyguardWidgetFrame keyguardwidgetframe, boolean flag)
    {
        keyguardwidgetframe.mPerformAppWidgetSizeUpdateOnBootComplete = flag;
        return flag;
    }

*/

}
