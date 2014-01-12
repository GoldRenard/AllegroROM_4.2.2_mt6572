// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.animation.*;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.hardware.input.InputManager;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.*;
import android.widget.ImageView;
import com.android.systemui.SwipeHelper;

public class KeyButtonView extends ImageView
{

    private static final String TAG = "StatusBar.KeyButtonView";
    final float BUTTON_QUIESCENT_ALPHA;
    final float GLOW_MAX_SCALE_FACTOR;
    Runnable mCheckLongPress = new Runnable() {

        final KeyButtonView this$0;

        public void run()
        {
label0:
            {
                if (isPressed())
                {
                    if (mCode == 0)
                        break label0;
                    sendEvent(0, 128);
                    sendAccessibilityEvent(2);
                }
                return;
            }
            performLongClick();
        }

            
            {
                this$0 = KeyButtonView.this;
                super();
            }
    }
;
    int mCode;
    long mDownTime;
    float mDrawingAlpha;
    float mGlowAlpha;
    Drawable mGlowBG;
    int mGlowHeight;
    float mGlowScale;
    int mGlowWidth;
    AnimatorSet mPressedAnim;
    RectF mRect;
    boolean mSupportsLongpress;
    int mTouchSlop;

    public KeyButtonView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public KeyButtonView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset);
        GLOW_MAX_SCALE_FACTOR = 1.8F;
        BUTTON_QUIESCENT_ALPHA = 0.7F;
        mGlowAlpha = 0.0F;
        mGlowScale = 1.0F;
        mDrawingAlpha = 1.0F;
        mSupportsLongpress = true;
        mRect = new RectF(0.0F, 0.0F, 0.0F, 0.0F);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.systemui.R.styleable.KeyButtonView, i, 0);
        mCode = typedarray.getInteger(0, 0);
        mSupportsLongpress = typedarray.getBoolean(1, true);
        mGlowBG = typedarray.getDrawable(2);
        if (mGlowBG != null)
        {
            setDrawingAlpha(0.7F);
            mGlowWidth = mGlowBG.getIntrinsicWidth();
            mGlowHeight = mGlowBG.getIntrinsicHeight();
        }
        typedarray.recycle();
        setClickable(true);
        mTouchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
    }

    public float getDrawingAlpha()
    {
        if (mGlowBG == null)
            return 0.0F;
        else
            return mDrawingAlpha;
    }

    public float getGlowAlpha()
    {
        if (mGlowBG == null)
            return 0.0F;
        else
            return mGlowAlpha;
    }

    public float getGlowScale()
    {
        if (mGlowBG == null)
            return 0.0F;
        else
            return mGlowScale;
    }

    protected void onDraw(Canvas canvas)
    {
        if (mGlowBG != null)
        {
            canvas.save();
            int i = getWidth();
            int j = getHeight();
            int k = (int)(((float)mGlowWidth / (float)mGlowHeight) * (float)j);
            int l = (k - i) / 2;
            canvas.scale(mGlowScale, mGlowScale, 0.5F * (float)i, 0.5F * (float)j);
            mGlowBG.setBounds(-l, 0, k - l, j);
            mGlowBG.setAlpha((int)(255F * (mDrawingAlpha * mGlowAlpha)));
            mGlowBG.draw(canvas);
            canvas.restore();
            mRect.right = i;
            mRect.bottom = j;
        }
        super.onDraw(canvas);
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        switch (motionevent.getAction())
        {
        default:
            break;

        case 1: // '\001'
            boolean flag1 = isPressed();
            setPressed(false);
            if (mCode != 0)
            {
                if (flag1)
                {
                    sendEvent(1, 0);
                    sendAccessibilityEvent(1);
                    if (mCode != 82)
                        playSoundEffect(0);
                } else
                {
                    sendEvent(1, 32);
                }
            } else
            if (flag1)
                performClick();
            if (mSupportsLongpress)
            {
                removeCallbacks(mCheckLongPress);
                return true;
            }
            break;

        case 3: // '\003'
            setPressed(false);
            if (mCode != 0)
                sendEvent(1, 32);
            if (mSupportsLongpress)
            {
                removeCallbacks(mCheckLongPress);
                return true;
            }
            break;

        case 2: // '\002'
            int i = (int)motionevent.getX();
            int j = (int)motionevent.getY();
            int k = -mTouchSlop;
            boolean flag = false;
            if (i >= k)
            {
                int l = getWidth() + mTouchSlop;
                flag = false;
                if (i < l)
                {
                    int i1 = -mTouchSlop;
                    flag = false;
                    if (j >= i1)
                    {
                        int j1 = getHeight() + mTouchSlop;
                        flag = false;
                        if (j < j1)
                            flag = true;
                    }
                }
            }
            setPressed(flag);
            return true;

        case 0: // '\0'
            mDownTime = SystemClock.uptimeMillis();
            setPressed(true);
            if (mCode != 0)
                sendEvent(0, 0, mDownTime);
            else
                performHapticFeedback(1);
            if (mSupportsLongpress)
            {
                removeCallbacks(mCheckLongPress);
                postDelayed(mCheckLongPress, ViewConfiguration.getLongPressTimeout());
                return true;
            }
            break;
        }
        return true;
    }

    void sendEvent(int i, int j)
    {
        sendEvent(i, j, SystemClock.uptimeMillis());
    }

    void sendEvent(int i, int j, long l)
    {
        int k;
        if ((j & 0x80) != 0)
            k = 1;
        else
            k = 0;
        KeyEvent keyevent = new KeyEvent(mDownTime, l, i, mCode, k, 0, -1, 0, 0x40 | (j | 8), 257);
        InputManager.getInstance().injectInputEvent(keyevent, 0);
    }

    public void setDrawingAlpha(float f)
    {
        if (mGlowBG == null)
        {
            return;
        } else
        {
            setAlpha((int)(255F * f));
            mDrawingAlpha = f;
            return;
        }
    }

    public void setGlowAlpha(float f)
    {
        if (mGlowBG == null)
        {
            return;
        } else
        {
            mGlowAlpha = f;
            invalidate();
            return;
        }
    }

    public void setGlowBackgroud(Drawable drawable)
    {
        mGlowBG = drawable;
    }

    public void setGlowScale(float f)
    {
        if (mGlowBG == null)
        {
            return;
        } else
        {
            mGlowScale = f;
            float f1 = getWidth();
            float f2 = getHeight();
            float f3 = 1.0F + (f1 * 0.8F) / 2.0F;
            float f4 = 1.0F + (f2 * 0.8F) / 2.0F;
            SwipeHelper.invalidateGlobalRegion(this, new RectF((float)getLeft() - f3, (float)getTop() - f4, f3 + (float)getRight(), f4 + (float)getBottom()));
            ((View)getParent()).invalidate();
            return;
        }
    }

    public void setPressed(boolean flag)
    {
        if (mGlowBG != null && flag != isPressed())
        {
            if (mPressedAnim != null && mPressedAnim.isRunning())
                mPressedAnim.cancel();
            AnimatorSet animatorset = new AnimatorSet();
            mPressedAnim = animatorset;
            if (flag)
            {
                if (mGlowScale < 1.8F)
                    mGlowScale = 1.8F;
                if (mGlowAlpha < 0.7F)
                    mGlowAlpha = 0.7F;
                setDrawingAlpha(1.0F);
                Animator aanimator1[] = new Animator[2];
                aanimator1[0] = ObjectAnimator.ofFloat(this, "glowAlpha", new float[] {
                    1.0F
                });
                aanimator1[1] = ObjectAnimator.ofFloat(this, "glowScale", new float[] {
                    1.8F
                });
                animatorset.playTogether(aanimator1);
                animatorset.setDuration(50L);
            } else
            {
                Animator aanimator[] = new Animator[3];
                aanimator[0] = ObjectAnimator.ofFloat(this, "glowAlpha", new float[] {
                    0.0F
                });
                aanimator[1] = ObjectAnimator.ofFloat(this, "glowScale", new float[] {
                    1.0F
                });
                aanimator[2] = ObjectAnimator.ofFloat(this, "drawingAlpha", new float[] {
                    0.7F
                });
                animatorset.playTogether(aanimator);
                animatorset.setDuration(500L);
            }
            animatorset.start();
        }
        super.setPressed(flag);
    }
}
