// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.support.v4.view;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.*;
import android.widget.TextView;

// Referenced classes of package android.support.v4.view:
//            PagerTitleStrip, ViewPager

public class PagerTabStrip extends PagerTitleStrip
{

    private static final int FULL_UNDERLINE_HEIGHT = 1;
    private static final int INDICATOR_HEIGHT = 3;
    private static final int MIN_PADDING_BOTTOM = 6;
    private static final int MIN_STRIP_HEIGHT = 32;
    private static final int MIN_TEXT_SPACING = 64;
    private static final int TAB_PADDING = 16;
    private static final int TAB_SPACING = 32;
    private static final String TAG = "PagerTabStrip";
    private boolean mDrawFullUnderline;
    private boolean mDrawFullUnderlineSet;
    private int mFullUnderlineHeight;
    private boolean mIgnoreTap;
    private int mIndicatorColor;
    private int mIndicatorHeight;
    private float mInitialMotionX;
    private float mInitialMotionY;
    private int mMinPaddingBottom;
    private int mMinStripHeight;
    private int mMinTextSpacing;
    private int mTabAlpha;
    private int mTabPadding;
    private final Paint mTabPaint;
    private final Rect mTempRect;
    private int mTouchSlop;

    public PagerTabStrip(Context context)
    {
        this(context, null);
    }

    public PagerTabStrip(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mTabPaint = new Paint();
        mTempRect = new Rect();
        mTabAlpha = 255;
        mDrawFullUnderline = false;
        mDrawFullUnderlineSet = false;
        mIndicatorColor = super.mTextColor;
        mTabPaint.setColor(mIndicatorColor);
        float f = context.getResources().getDisplayMetrics().density;
        mIndicatorHeight = (int)(0.5F + 3F * f);
        mMinPaddingBottom = (int)(0.5F + 6F * f);
        mMinTextSpacing = (int)(64F * f);
        mTabPadding = (int)(0.5F + 16F * f);
        mFullUnderlineHeight = (int)(0.5F + 1.0F * f);
        mMinStripHeight = (int)(0.5F + 32F * f);
        mTouchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        setPadding(getPaddingLeft(), getPaddingTop(), getPaddingRight(), getPaddingBottom());
        setTextSpacing(getTextSpacing());
        setWillNotDraw(false);
        super.mPrevText.setFocusable(true);
        super.mPrevText.setOnClickListener(new android.view.View.OnClickListener() {

            final PagerTabStrip this$0;

            public void onClick(View view)
            {
                mPager.setCurrentItem(-1 + mPager.getCurrentItem());
            }

            
            {
                this$0 = PagerTabStrip.this;
                super();
            }
        }
);
        super.mNextText.setFocusable(true);
        super.mNextText.setOnClickListener(new android.view.View.OnClickListener() {

            final PagerTabStrip this$0;

            public void onClick(View view)
            {
                mPager.setCurrentItem(1 + mPager.getCurrentItem());
            }

            
            {
                this$0 = PagerTabStrip.this;
                super();
            }
        }
);
        if (getBackground() == null)
            mDrawFullUnderline = true;
    }

    public boolean getDrawFullUnderline()
    {
        return mDrawFullUnderline;
    }

    int getMinHeight()
    {
        return Math.max(super.getMinHeight(), mMinStripHeight);
    }

    public int getTabIndicatorColor()
    {
        return mIndicatorColor;
    }

    protected void onDraw(Canvas canvas)
    {
        super.onDraw(canvas);
        int i = getHeight();
        int j = super.mCurrText.getLeft() - mTabPadding;
        int k = super.mCurrText.getRight() + mTabPadding;
        int l = i - mIndicatorHeight;
        mTabPaint.setColor(mTabAlpha << 24 | 0xffffff & mIndicatorColor);
        canvas.drawRect(j, l, k, i, mTabPaint);
        if (mDrawFullUnderline)
        {
            mTabPaint.setColor(0xff000000 | 0xffffff & mIndicatorColor);
            canvas.drawRect(getPaddingLeft(), i - mFullUnderlineHeight, getWidth() - getPaddingRight(), i, mTabPaint);
        }
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        int i = motionevent.getAction();
        if (i != 0 && mIgnoreTap)
            return false;
        float f = motionevent.getX();
        float f1 = motionevent.getY();
        switch (i)
        {
        default:
            break;

        case 1: // '\001'
            if (f < (float)(super.mCurrText.getLeft() - mTabPadding))
            {
                super.mPager.setCurrentItem(-1 + super.mPager.getCurrentItem());
                break;
            }
            if (f > (float)(super.mCurrText.getRight() + mTabPadding))
                super.mPager.setCurrentItem(1 + super.mPager.getCurrentItem());
            break;

        case 2: // '\002'
            if (Math.abs(f - mInitialMotionX) > (float)mTouchSlop || Math.abs(f1 - mInitialMotionY) > (float)mTouchSlop)
                mIgnoreTap = true;
            break;

        case 0: // '\0'
            mInitialMotionX = f;
            mInitialMotionY = f1;
            mIgnoreTap = false;
            break;
        }
        return true;
    }

    public void setBackgroundColor(int i)
    {
        super.setBackgroundColor(i);
        if (!mDrawFullUnderlineSet)
        {
            boolean flag;
            if ((0xff000000 & i) == 0)
                flag = true;
            else
                flag = false;
            mDrawFullUnderline = flag;
        }
    }

    public void setBackgroundDrawable(Drawable drawable)
    {
        super.setBackgroundDrawable(drawable);
        if (!mDrawFullUnderlineSet)
        {
            boolean flag;
            if (drawable == null)
                flag = true;
            else
                flag = false;
            mDrawFullUnderline = flag;
        }
    }

    public void setBackgroundResource(int i)
    {
        super.setBackgroundResource(i);
        if (!mDrawFullUnderlineSet)
        {
            boolean flag;
            if (i == 0)
                flag = true;
            else
                flag = false;
            mDrawFullUnderline = flag;
        }
    }

    public void setDrawFullUnderline(boolean flag)
    {
        mDrawFullUnderline = flag;
        mDrawFullUnderlineSet = true;
        invalidate();
    }

    public void setPadding(int i, int j, int k, int l)
    {
        if (l < mMinPaddingBottom)
            l = mMinPaddingBottom;
        super.setPadding(i, j, k, l);
    }

    public void setTabIndicatorColor(int i)
    {
        mIndicatorColor = i;
        mTabPaint.setColor(mIndicatorColor);
        invalidate();
    }

    public void setTabIndicatorColorResource(int i)
    {
        setTabIndicatorColor(getContext().getResources().getColor(i));
    }

    public void setTextSpacing(int i)
    {
        if (i < mMinTextSpacing)
            i = mMinTextSpacing;
        super.setTextSpacing(i);
    }

    void updateTextPositions(int i, float f, boolean flag)
    {
        Rect rect = mTempRect;
        int j = getHeight();
        int k = super.mCurrText.getLeft() - mTabPadding;
        int l = super.mCurrText.getRight() + mTabPadding;
        int i1 = j - mIndicatorHeight;
        rect.set(k, i1, l, j);
        super.updateTextPositions(i, f, flag);
        mTabAlpha = (int)(255F * (2.0F * Math.abs(f - 0.5F)));
        rect.union(super.mCurrText.getLeft() - mTabPadding, i1, super.mCurrText.getRight() + mTabPadding, j);
        invalidate(rect);
    }
}
