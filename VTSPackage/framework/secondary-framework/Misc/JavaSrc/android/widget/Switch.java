// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.res.*;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.text.*;
import android.text.method.AllCapsTransformationMethod;
import android.text.method.TransformationMethod2;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import java.util.List;

// Referenced classes of package android.widget:
//            CompoundButton

public class Switch extends CompoundButton
{

    private static final int CHECKED_STATE_SET[] = {
        0x10100a0
    };
    private static final int MONOSPACE = 3;
    private static final int SANS = 1;
    private static final int SERIF = 2;
    private static final int TOUCH_MODE_DOWN = 1;
    private static final int TOUCH_MODE_DRAGGING = 2;
    private static final int TOUCH_MODE_IDLE;
    private int mMinFlingVelocity;
    private Layout mOffLayout;
    private Layout mOnLayout;
    private int mSwitchBottom;
    private int mSwitchHeight;
    private int mSwitchLeft;
    private int mSwitchMinWidth;
    private int mSwitchPadding;
    private int mSwitchRight;
    private int mSwitchTop;
    private TransformationMethod2 mSwitchTransformationMethod;
    private int mSwitchWidth;
    private final Rect mTempRect;
    private ColorStateList mTextColors;
    private CharSequence mTextOff;
    private CharSequence mTextOn;
    private TextPaint mTextPaint;
    private Drawable mThumbDrawable;
    private float mThumbPosition;
    private int mThumbTextPadding;
    private int mThumbWidth;
    private int mTouchMode;
    private int mTouchSlop;
    private float mTouchX;
    private float mTouchY;
    private Drawable mTrackDrawable;
    private VelocityTracker mVelocityTracker;

    public Switch(Context context)
    {
        this(context, null);
    }

    public Switch(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0x10103f6);
    }

    public Switch(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mVelocityTracker = VelocityTracker.obtain();
        mTempRect = new Rect();
        mTextPaint = new TextPaint(1);
        Resources resources = getResources();
        mTextPaint.density = resources.getDisplayMetrics().density;
        mTextPaint.setCompatibilityScaling(resources.getCompatibilityInfo().applicationScale);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.Switch, i, 0);
        mThumbDrawable = typedarray.getDrawable(2);
        mTrackDrawable = typedarray.getDrawable(4);
        mTextOn = typedarray.getText(0);
        mTextOff = typedarray.getText(1);
        mThumbTextPadding = typedarray.getDimensionPixelSize(7, 0);
        mSwitchMinWidth = typedarray.getDimensionPixelSize(5, 0);
        mSwitchPadding = typedarray.getDimensionPixelSize(6, 0);
        int j = typedarray.getResourceId(3, 0);
        if (j != 0)
            setSwitchTextAppearance(context, j);
        typedarray.recycle();
        ViewConfiguration viewconfiguration = ViewConfiguration.get(context);
        mTouchSlop = viewconfiguration.getScaledTouchSlop();
        mMinFlingVelocity = viewconfiguration.getScaledMinimumFlingVelocity();
        refreshDrawableState();
        setChecked(isChecked());
    }

    private void animateThumbToCheckedState(boolean flag)
    {
        setChecked(flag);
    }

    private void cancelSuperTouch(MotionEvent motionevent)
    {
        MotionEvent motionevent1 = MotionEvent.obtain(motionevent);
        motionevent1.setAction(3);
        super.onTouchEvent(motionevent1);
        motionevent1.recycle();
    }

    private boolean getTargetCheckedState()
    {
        if (isLayoutRtl())
        {
            if (mThumbPosition > (float)(getThumbScrollRange() / 2))
                return false;
        } else
        if (mThumbPosition < (float)(getThumbScrollRange() / 2))
            return false;
        return true;
    }

    private int getThumbScrollRange()
    {
        if (mTrackDrawable == null)
        {
            return 0;
        } else
        {
            mTrackDrawable.getPadding(mTempRect);
            return mSwitchWidth - mThumbWidth - mTempRect.left - mTempRect.right;
        }
    }

    private boolean hitThumb(float f, float f1)
    {
        mThumbDrawable.getPadding(mTempRect);
        int i = mSwitchTop - mTouchSlop;
        int j = (mSwitchLeft + (int)(0.5F + mThumbPosition)) - mTouchSlop;
        int k = j + mThumbWidth + mTempRect.left + mTempRect.right + mTouchSlop;
        int l = mSwitchBottom + mTouchSlop;
        return f > (float)j && f < (float)k && f1 > (float)i && f1 < (float)l;
    }

    private Layout makeLayout(CharSequence charsequence)
    {
        CharSequence charsequence1;
        if (mSwitchTransformationMethod != null)
            charsequence1 = mSwitchTransformationMethod.getTransformation(charsequence, this);
        else
            charsequence1 = charsequence;
        return new StaticLayout(charsequence1, mTextPaint, (int)Math.ceil(Layout.getDesiredWidth(charsequence1, mTextPaint)), android.text.Layout.Alignment.ALIGN_NORMAL, 1.0F, 0.0F, true);
    }

    private void setSwitchTypefaceByIndex(int i, int j)
    {
        Typeface typeface = null;
        switch (i)
        {
        case 3: // '\003'
            typeface = Typeface.MONOSPACE;
            break;

        case 2: // '\002'
            typeface = Typeface.SERIF;
            break;

        case 1: // '\001'
            typeface = Typeface.SANS_SERIF;
            break;
        }
        setSwitchTypeface(typeface, j);
    }

    private void setThumbPosition(boolean flag)
    {
        if (isLayoutRtl())
        {
            float f1 = 0.0F;
            if (!flag)
                f1 = getThumbScrollRange();
            mThumbPosition = f1;
            return;
        }
        float f = 0.0F;
        if (flag)
            f = getThumbScrollRange();
        mThumbPosition = f;
    }

    private void stopDrag(MotionEvent motionevent)
    {
        mTouchMode = 0;
        boolean flag;
        if (motionevent.getAction() == 1 && isEnabled())
            flag = true;
        else
            flag = false;
        cancelSuperTouch(motionevent);
        if (flag)
        {
            mVelocityTracker.computeCurrentVelocity(1000);
            float f = mVelocityTracker.getXVelocity();
            boolean flag1;
            if (Math.abs(f) > (float)mMinFlingVelocity)
            {
                if (isLayoutRtl())
                {
                    if (f < 0.0F)
                        flag1 = true;
                    else
                        flag1 = false;
                } else
                if (f > 0.0F)
                    flag1 = true;
                else
                    flag1 = false;
            } else
            {
                flag1 = getTargetCheckedState();
            }
            animateThumbToCheckedState(flag1);
            return;
        } else
        {
            animateThumbToCheckedState(isChecked());
            return;
        }
    }

    protected void drawableStateChanged()
    {
        super.drawableStateChanged();
        int ai[] = getDrawableState();
        if (mThumbDrawable != null)
            mThumbDrawable.setState(ai);
        if (mTrackDrawable != null)
            mTrackDrawable.setState(ai);
        invalidate();
    }

    public int getCompoundPaddingLeft()
    {
        int i;
        if (!isLayoutRtl())
        {
            i = super.getCompoundPaddingLeft();
        } else
        {
            i = super.getCompoundPaddingLeft() + mSwitchWidth;
            if (!TextUtils.isEmpty(getText()))
                return i + mSwitchPadding;
        }
        return i;
    }

    public int getCompoundPaddingRight()
    {
        int i;
        if (isLayoutRtl())
        {
            i = super.getCompoundPaddingRight();
        } else
        {
            i = super.getCompoundPaddingRight() + mSwitchWidth;
            if (!TextUtils.isEmpty(getText()))
                return i + mSwitchPadding;
        }
        return i;
    }

    public int getSwitchMinWidth()
    {
        return mSwitchMinWidth;
    }

    public int getSwitchPadding()
    {
        return mSwitchPadding;
    }

    public CharSequence getTextOff()
    {
        return mTextOff;
    }

    public CharSequence getTextOn()
    {
        return mTextOn;
    }

    public Drawable getThumbDrawable()
    {
        return mThumbDrawable;
    }

    public int getThumbTextPadding()
    {
        return mThumbTextPadding;
    }

    public Drawable getTrackDrawable()
    {
        return mTrackDrawable;
    }

    public void jumpDrawablesToCurrentState()
    {
        super.jumpDrawablesToCurrentState();
        mThumbDrawable.jumpToCurrentState();
        mTrackDrawable.jumpToCurrentState();
    }

    protected int[] onCreateDrawableState(int i)
    {
        int ai[] = super.onCreateDrawableState(i + 1);
        if (isChecked())
            mergeDrawableStates(ai, CHECKED_STATE_SET);
        return ai;
    }

    protected void onDraw(Canvas canvas)
    {
        super.onDraw(canvas);
        int i = mSwitchLeft;
        int j = mSwitchTop;
        int k = mSwitchRight;
        int l = mSwitchBottom;
        mTrackDrawable.setBounds(i, j, k, l);
        mTrackDrawable.draw(canvas);
        canvas.save();
        mTrackDrawable.getPadding(mTempRect);
        int i1 = i + mTempRect.left;
        int j1 = j + mTempRect.top;
        int k1 = k - mTempRect.right;
        int l1 = l - mTempRect.bottom;
        canvas.clipRect(i1, j, k1, l);
        mThumbDrawable.getPadding(mTempRect);
        int i2 = (int)(0.5F + mThumbPosition);
        int j2 = i2 + (i1 - mTempRect.left);
        int k2 = i1 + i2 + mThumbWidth + mTempRect.right;
        mThumbDrawable.setBounds(j2, j, k2, l);
        mThumbDrawable.draw(canvas);
        if (mTextColors != null)
            mTextPaint.setColor(mTextColors.getColorForState(getDrawableState(), mTextColors.getDefaultColor()));
        mTextPaint.drawableState = getDrawableState();
        Layout layout;
        if (getTargetCheckedState())
            layout = mOnLayout;
        else
            layout = mOffLayout;
        if (layout != null)
        {
            canvas.translate((j2 + k2) / 2 - layout.getWidth() / 2, (j1 + l1) / 2 - layout.getHeight() / 2);
            layout.draw(canvas);
        }
        canvas.restore();
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/Switch.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        CharSequence charsequence;
        CharSequence charsequence1;
label0:
        {
            super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
            accessibilitynodeinfo.setClassName(android/widget/Switch.getName());
            if (isChecked())
                charsequence = mTextOn;
            else
                charsequence = mTextOff;
            if (!TextUtils.isEmpty(charsequence))
            {
                charsequence1 = accessibilitynodeinfo.getText();
                if (!TextUtils.isEmpty(charsequence1))
                    break label0;
                accessibilitynodeinfo.setText(charsequence);
            }
            return;
        }
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append(charsequence1).append(' ').append(charsequence);
        accessibilitynodeinfo.setText(stringbuilder);
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
        setThumbPosition(isChecked());
        int i1;
        int j1;
        if (isLayoutRtl())
        {
            j1 = getPaddingLeft();
            i1 = j1 + mSwitchWidth;
        } else
        {
            i1 = getWidth() - getPaddingRight();
            j1 = i1 - mSwitchWidth;
        }
        int k1;
        int l1;
        switch (0x70 & getGravity())
        {
        case 80: // 'P'
            l1 = getHeight() - getPaddingBottom();
            k1 = l1 - mSwitchHeight;
            break;

        case 16: // '\020'
            k1 = ((getPaddingTop() + getHeight()) - getPaddingBottom()) / 2 - mSwitchHeight / 2;
            l1 = k1 + mSwitchHeight;
            break;

        default:
            k1 = getPaddingTop();
            l1 = k1 + mSwitchHeight;
            break;
        }
        mSwitchLeft = j1;
        mSwitchTop = k1;
        mSwitchBottom = l1;
        mSwitchRight = i1;
    }

    public void onMeasure(int i, int j)
    {
        if (mOnLayout == null)
            mOnLayout = makeLayout(mTextOn);
        if (mOffLayout == null)
            mOffLayout = makeLayout(mTextOff);
        mTrackDrawable.getPadding(mTempRect);
        int k = Math.max(mOnLayout.getWidth(), mOffLayout.getWidth());
        int l = Math.max(mSwitchMinWidth, k * 2 + 4 * mThumbTextPadding + mTempRect.left + mTempRect.right);
        int i1 = mTrackDrawable.getIntrinsicHeight();
        mThumbWidth = k + 2 * mThumbTextPadding;
        mSwitchWidth = l;
        mSwitchHeight = i1;
        super.onMeasure(i, j);
        if (getMeasuredHeight() < i1)
            setMeasuredDimension(getMeasuredWidthAndState(), i1);
    }

    public void onPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onPopulateAccessibilityEvent(accessibilityevent);
        Layout layout;
        if (isChecked())
            layout = mOnLayout;
        else
            layout = mOffLayout;
        if (layout != null && !TextUtils.isEmpty(layout.getText()))
            accessibilityevent.getText().add(layout.getText());
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        boolean flag;
label0:
        {
            flag = true;
            mVelocityTracker.addMovement(motionevent);
label1:
            switch (motionevent.getActionMasked())
            {
            default:
                break;

            case 1: // '\001'
            case 3: // '\003'
                if (mTouchMode == 2)
                {
                    stopDrag(motionevent);
                    return flag;
                }
                mTouchMode = 0;
                mVelocityTracker.clear();
                break;

            case 2: // '\002'
                switch (mTouchMode)
                {
                case 0: // '\0'
                default:
                    break label1;

                case 2: // '\002'
                    float f4 = motionevent.getX();
                    float f5 = Math.max(0.0F, Math.min((f4 - mTouchX) + mThumbPosition, getThumbScrollRange()));
                    if (f5 != mThumbPosition)
                    {
                        mThumbPosition = f5;
                        mTouchX = f4;
                        invalidate();
                        return flag;
                    }
                    break;

                case 1: // '\001'
                    float f2 = motionevent.getX();
                    float f3 = motionevent.getY();
                    if (Math.abs(f2 - mTouchX) > (float)mTouchSlop || Math.abs(f3 - mTouchY) > (float)mTouchSlop)
                    {
                        mTouchMode = 2;
                        getParent().requestDisallowInterceptTouchEvent(flag);
                        mTouchX = f2;
                        mTouchY = f3;
                        return flag;
                    }
                    break label1;
                }
                break label0;

            case 0: // '\0'
                float f = motionevent.getX();
                float f1 = motionevent.getY();
                if (isEnabled() && hitThumb(f, f1))
                {
                    mTouchMode = ((flag) ? 1 : 0);
                    mTouchX = f;
                    mTouchY = f1;
                }
                break;
            }
            flag = super.onTouchEvent(motionevent);
        }
        return flag;
    }

    public void setChecked(boolean flag)
    {
        super.setChecked(flag);
        setThumbPosition(isChecked());
        invalidate();
    }

    public void setSwitchMinWidth(int i)
    {
        mSwitchMinWidth = i;
        requestLayout();
    }

    public void setSwitchPadding(int i)
    {
        mSwitchPadding = i;
        requestLayout();
    }

    public void setSwitchTextAppearance(Context context, int i)
    {
        TypedArray typedarray = context.obtainStyledAttributes(i, com.android.internal.R.styleable.TextAppearance);
        ColorStateList colorstatelist = typedarray.getColorStateList(3);
        if (colorstatelist != null)
            mTextColors = colorstatelist;
        else
            mTextColors = getTextColors();
        int j = typedarray.getDimensionPixelSize(0, 0);
        if (j != 0 && (float)j != mTextPaint.getTextSize())
        {
            mTextPaint.setTextSize(j);
            requestLayout();
        }
        setSwitchTypefaceByIndex(typedarray.getInt(1, -1), typedarray.getInt(2, -1));
        if (typedarray.getBoolean(7, false))
        {
            mSwitchTransformationMethod = new AllCapsTransformationMethod(getContext());
            mSwitchTransformationMethod.setLengthChangesAllowed(true);
        } else
        {
            mSwitchTransformationMethod = null;
        }
        typedarray.recycle();
    }

    public void setSwitchTypeface(Typeface typeface)
    {
        if (mTextPaint.getTypeface() != typeface)
        {
            mTextPaint.setTypeface(typeface);
            requestLayout();
            invalidate();
        }
    }

    public void setSwitchTypeface(Typeface typeface, int i)
    {
        if (i > 0)
        {
            Typeface typeface1;
            if (typeface == null)
                typeface1 = Typeface.defaultFromStyle(i);
            else
                typeface1 = Typeface.create(typeface, i);
            setSwitchTypeface(typeface1);
            int j;
            if (typeface1 != null)
                j = typeface1.getStyle();
            else
                j = 0;
            int k = i & ~j;
            TextPaint textpaint = mTextPaint;
            int l = k & 1;
            boolean flag = false;
            if (l != 0)
                flag = true;
            textpaint.setFakeBoldText(flag);
            TextPaint textpaint1 = mTextPaint;
            float f;
            if ((k & 2) != 0)
                f = -0.25F;
            else
                f = 0.0F;
            textpaint1.setTextSkewX(f);
            return;
        } else
        {
            mTextPaint.setFakeBoldText(false);
            mTextPaint.setTextSkewX(0.0F);
            setSwitchTypeface(typeface);
            return;
        }
    }

    public void setTextOff(CharSequence charsequence)
    {
        mTextOff = charsequence;
        requestLayout();
    }

    public void setTextOn(CharSequence charsequence)
    {
        mTextOn = charsequence;
        requestLayout();
    }

    public void setThumbDrawable(Drawable drawable)
    {
        mThumbDrawable = drawable;
        requestLayout();
    }

    public void setThumbResource(int i)
    {
        setThumbDrawable(getContext().getResources().getDrawable(i));
    }

    public void setThumbTextPadding(int i)
    {
        mThumbTextPadding = i;
        requestLayout();
    }

    public void setTrackDrawable(Drawable drawable)
    {
        mTrackDrawable = drawable;
        requestLayout();
    }

    public void setTrackResource(int i)
    {
        setTrackDrawable(getContext().getResources().getDrawable(i));
    }

    protected boolean verifyDrawable(Drawable drawable)
    {
        return super.verifyDrawable(drawable) || drawable == mThumbDrawable || drawable == mTrackDrawable;
    }

}
