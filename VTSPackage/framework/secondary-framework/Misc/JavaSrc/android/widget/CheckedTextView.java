// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

// Referenced classes of package android.widget:
//            TextView, Checkable

public class CheckedTextView extends TextView
    implements Checkable
{

    private static final int CHECKED_STATE_SET[] = {
        0x10100a0
    };
    private int mBasePadding;
    private Drawable mCheckMarkDrawable;
    private int mCheckMarkResource;
    private int mCheckMarkWidth;
    private boolean mChecked;
    private boolean mNeedRequestlayout;

    public CheckedTextView(Context context)
    {
        this(context, null);
    }

    public CheckedTextView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0x10103c8);
    }

    public CheckedTextView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.CheckedTextView, i, 0);
        Drawable drawable = typedarray.getDrawable(1);
        if (drawable != null)
            setCheckMarkDrawable(drawable);
        setChecked(typedarray.getBoolean(0, false));
        typedarray.recycle();
    }

    private void setBasePadding(boolean flag)
    {
        if (flag)
        {
            mBasePadding = super.mPaddingLeft;
            return;
        } else
        {
            mBasePadding = super.mPaddingRight;
            return;
        }
    }

    private void updatePadding()
    {
        boolean flag = true;
        resetPaddingToInitialValues();
        int i;
        if (mCheckMarkDrawable != null)
            i = mCheckMarkWidth + mBasePadding;
        else
            i = mBasePadding;
        if (isLayoutRtl())
        {
            boolean flag2 = mNeedRequestlayout;
            if (super.mPaddingLeft == i)
                flag = false;
            mNeedRequestlayout = flag | flag2;
            super.mPaddingLeft = i;
        } else
        {
            boolean flag1 = mNeedRequestlayout;
            if (super.mPaddingRight == i)
                flag = false;
            mNeedRequestlayout = flag | flag1;
            super.mPaddingRight = i;
        }
        if (mNeedRequestlayout)
        {
            requestLayout();
            mNeedRequestlayout = false;
        }
    }

    protected void drawableStateChanged()
    {
        super.drawableStateChanged();
        if (mCheckMarkDrawable != null)
        {
            int ai[] = getDrawableState();
            mCheckMarkDrawable.setState(ai);
            invalidate();
        }
    }

    public Drawable getCheckMarkDrawable()
    {
        return mCheckMarkDrawable;
    }

    protected void internalSetPadding(int i, int j, int k, int l)
    {
        super.internalSetPadding(i, j, k, l);
        setBasePadding(isLayoutRtl());
    }

    public boolean isChecked()
    {
        return mChecked;
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
        Drawable drawable = mCheckMarkDrawable;
        if (drawable != null)
        {
            int i = 0x70 & getGravity();
            int j = drawable.getIntrinsicHeight();
            int k = 0;
            switch (i)
            {
            case 16: // '\020'
                k = (getHeight() - j) / 2;
                break;

            case 80: // 'P'
                k = getHeight() - j;
                break;
            }
            boolean flag = isLayoutRtl();
            int l = getWidth();
            int i1 = k;
            int j1 = i1 + j;
            int k1;
            int l1;
            if (flag)
            {
                l1 = mBasePadding;
                k1 = l1 + mCheckMarkWidth;
            } else
            {
                k1 = l - mBasePadding;
                l1 = k1 - mCheckMarkWidth;
            }
            drawable.setBounds(l1, i1, k1, j1);
            drawable.draw(canvas);
        }
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/CheckedTextView.getName());
        accessibilityevent.setChecked(mChecked);
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/CheckedTextView.getName());
        accessibilitynodeinfo.setCheckable(true);
        accessibilitynodeinfo.setChecked(mChecked);
    }

    public void onRtlPropertiesChanged(int i)
    {
        super.onRtlPropertiesChanged(i);
        updatePadding();
    }

    public void setCheckMarkDrawable(int i)
    {
        if (i != 0 && i == mCheckMarkResource)
            return;
        mCheckMarkResource = i;
        int j = mCheckMarkResource;
        Drawable drawable = null;
        if (j != 0)
            drawable = getResources().getDrawable(mCheckMarkResource);
        setCheckMarkDrawable(drawable);
    }

    public void setCheckMarkDrawable(Drawable drawable)
    {
        boolean flag = true;
        if (mCheckMarkDrawable != null)
        {
            mCheckMarkDrawable.setCallback(null);
            unscheduleDrawable(mCheckMarkDrawable);
        }
        boolean flag1;
        if (drawable != mCheckMarkDrawable)
            flag1 = flag;
        else
            flag1 = false;
        mNeedRequestlayout = flag1;
        if (drawable != null)
        {
            drawable.setCallback(this);
            if (getVisibility() != 0)
                flag = false;
            drawable.setVisible(flag, false);
            drawable.setState(CHECKED_STATE_SET);
            setMinHeight(drawable.getIntrinsicHeight());
            mCheckMarkWidth = drawable.getIntrinsicWidth();
            drawable.setState(getDrawableState());
        } else
        {
            mCheckMarkWidth = 0;
        }
        mCheckMarkDrawable = drawable;
        resolvePadding();
    }

    public void setChecked(boolean flag)
    {
        if (mChecked != flag)
        {
            mChecked = flag;
            refreshDrawableState();
            notifyAccessibilityStateChanged();
        }
    }

    public void toggle()
    {
        boolean flag;
        if (!mChecked)
            flag = true;
        else
            flag = false;
        setChecked(flag);
    }

}
