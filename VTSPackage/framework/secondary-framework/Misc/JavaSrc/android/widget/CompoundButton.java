// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

// Referenced classes of package android.widget:
//            Button, Checkable

public abstract class CompoundButton extends Button
    implements Checkable
{
    public static interface OnCheckedChangeListener
    {

        public abstract void onCheckedChanged(CompoundButton compoundbutton, boolean flag);
    }

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
        boolean checked;

        public String toString()
        {
            return (new StringBuilder()).append("CompoundButton.SavedState{").append(Integer.toHexString(System.identityHashCode(this))).append(" checked=").append(checked).append("}").toString();
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            super.writeToParcel(parcel, i);
            parcel.writeValue(Boolean.valueOf(checked));
        }


        private SavedState(Parcel parcel)
        {
            super(parcel);
            checked = ((Boolean)parcel.readValue(null)).booleanValue();
        }


        SavedState(Parcelable parcelable)
        {
            super(parcelable);
        }
    }


    private static final int CHECKED_STATE_SET[] = {
        0x10100a0
    };
    private boolean mBroadcasting;
    private Drawable mButtonDrawable;
    private int mButtonResource;
    private boolean mChecked;
    private OnCheckedChangeListener mOnCheckedChangeListener;
    private OnCheckedChangeListener mOnCheckedChangeWidgetListener;

    public CompoundButton(Context context)
    {
        this(context, null);
    }

    public CompoundButton(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public CompoundButton(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.CompoundButton, i, 0);
        Drawable drawable = typedarray.getDrawable(1);
        if (drawable != null)
            setButtonDrawable(drawable);
        setChecked(typedarray.getBoolean(0, false));
        typedarray.recycle();
    }

    protected void drawableStateChanged()
    {
        super.drawableStateChanged();
        if (mButtonDrawable != null)
        {
            int ai[] = getDrawableState();
            mButtonDrawable.setState(ai);
            invalidate();
        }
    }

    public int getCompoundPaddingLeft()
    {
        int i = super.getCompoundPaddingLeft();
        if (!isLayoutRtl())
        {
            Drawable drawable = mButtonDrawable;
            if (drawable != null)
                i += drawable.getIntrinsicWidth();
        }
        return i;
    }

    public int getCompoundPaddingRight()
    {
        int i = super.getCompoundPaddingRight();
        if (isLayoutRtl())
        {
            Drawable drawable = mButtonDrawable;
            if (drawable != null)
                i += drawable.getIntrinsicWidth();
        }
        return i;
    }

    public int getHorizontalOffsetForDrawables()
    {
        Drawable drawable = mButtonDrawable;
        if (drawable != null)
            return drawable.getIntrinsicWidth();
        else
            return 0;
    }

    public boolean isChecked()
    {
        return mChecked;
    }

    public void jumpDrawablesToCurrentState()
    {
        super.jumpDrawablesToCurrentState();
        if (mButtonDrawable != null)
            mButtonDrawable.jumpToCurrentState();
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
        Drawable drawable = mButtonDrawable;
        if (drawable != null)
        {
            int i = 0x70 & getGravity();
            int j = drawable.getIntrinsicHeight();
            int k = drawable.getIntrinsicWidth();
            int l = 0;
            switch (i)
            {
            case 16: // '\020'
                l = (getHeight() - j) / 2;
                break;

            case 80: // 'P'
                l = getHeight() - j;
                break;
            }
            int i1 = l + j;
            int j1;
            if (isLayoutRtl())
                j1 = getWidth() - k;
            else
                j1 = 0;
            int k1;
            if (isLayoutRtl())
                k1 = getWidth();
            else
                k1 = k;
            drawable.setBounds(j1, l, k1, i1);
            drawable.draw(canvas);
        }
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/CompoundButton.getName());
        accessibilityevent.setChecked(mChecked);
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/CompoundButton.getName());
        accessibilitynodeinfo.setCheckable(true);
        accessibilitynodeinfo.setChecked(mChecked);
    }

    public void onRestoreInstanceState(Parcelable parcelable)
    {
        SavedState savedstate = (SavedState)parcelable;
        super.onRestoreInstanceState(savedstate.getSuperState());
        setChecked(savedstate.checked);
        requestLayout();
    }

    public Parcelable onSaveInstanceState()
    {
        setFreezesText(true);
        SavedState savedstate = new SavedState(super.onSaveInstanceState());
        savedstate.checked = isChecked();
        return savedstate;
    }

    public boolean performClick()
    {
        toggle();
        return super.performClick();
    }

    public void setButtonDrawable(int i)
    {
        if (i != 0 && i == mButtonResource)
            return;
        mButtonResource = i;
        int j = mButtonResource;
        Drawable drawable = null;
        if (j != 0)
            drawable = getResources().getDrawable(mButtonResource);
        setButtonDrawable(drawable);
    }

    public void setButtonDrawable(Drawable drawable)
    {
        if (drawable != null)
        {
            if (mButtonDrawable != null)
            {
                mButtonDrawable.setCallback(null);
                unscheduleDrawable(mButtonDrawable);
            }
            drawable.setCallback(this);
            drawable.setState(getDrawableState());
            boolean flag;
            if (getVisibility() == 0)
                flag = true;
            else
                flag = false;
            drawable.setVisible(flag, false);
            mButtonDrawable = drawable;
            mButtonDrawable.setState(null);
            setMinHeight(mButtonDrawable.getIntrinsicHeight());
        }
        refreshDrawableState();
    }

    public void setChecked(boolean flag)
    {
        if (mChecked != flag)
        {
            mChecked = flag;
            refreshDrawableState();
            notifyAccessibilityStateChanged();
            if (!mBroadcasting)
            {
                mBroadcasting = true;
                if (mOnCheckedChangeListener != null)
                    mOnCheckedChangeListener.onCheckedChanged(this, mChecked);
                if (mOnCheckedChangeWidgetListener != null)
                    mOnCheckedChangeWidgetListener.onCheckedChanged(this, mChecked);
                mBroadcasting = false;
                return;
            }
        }
    }

    public void setOnCheckedChangeListener(OnCheckedChangeListener oncheckedchangelistener)
    {
        mOnCheckedChangeListener = oncheckedchangelistener;
    }

    void setOnCheckedChangeWidgetListener(OnCheckedChangeListener oncheckedchangelistener)
    {
        mOnCheckedChangeWidgetListener = oncheckedchangelistener;
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

    protected boolean verifyDrawable(Drawable drawable)
    {
        return super.verifyDrawable(drawable) || drawable == mButtonDrawable;
    }

}
