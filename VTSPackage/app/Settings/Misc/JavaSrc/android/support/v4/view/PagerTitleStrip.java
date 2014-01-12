// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.support.v4.view;

import android.content.Context;
import android.content.res.*;
import android.database.DataSetObserver;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.ViewGroup;
import android.widget.TextView;
import java.lang.ref.WeakReference;

// Referenced classes of package android.support.v4.view:
//            ViewPager, PagerAdapter, PagerTitleStripIcs

public class PagerTitleStrip extends ViewGroup
    implements ViewPager.Decor
{
    private class PageListener extends DataSetObserver
        implements ViewPager.OnPageChangeListener, ViewPager.OnAdapterChangeListener
    {

        private int mScrollState;
        final PagerTitleStrip this$0;

        public void onAdapterChanged(PagerAdapter pageradapter, PagerAdapter pageradapter1)
        {
            updateAdapter(pageradapter, pageradapter1);
        }

        public void onChanged()
        {
            updateText(mPager.getCurrentItem(), mPager.getAdapter());
            int i = mLastKnownPositionOffset != 0.0F;
            float f = 0.0F;
            if (i >= 0)
                f = mLastKnownPositionOffset;
            updateTextPositions(mPager.getCurrentItem(), f, true);
        }

        public void onPageScrollStateChanged(int i)
        {
            mScrollState = i;
        }

        public void onPageScrolled(int i, float f, int j)
        {
            if (f > 0.5F)
                i++;
            updateTextPositions(i, f, false);
        }

        public void onPageSelected(int i)
        {
            if (mScrollState == 0)
            {
                updateText(mPager.getCurrentItem(), mPager.getAdapter());
                int j = mLastKnownPositionOffset != 0.0F;
                float f = 0.0F;
                if (j >= 0)
                    f = mLastKnownPositionOffset;
                updateTextPositions(mPager.getCurrentItem(), f, true);
            }
        }

        private PageListener()
        {
            this$0 = PagerTitleStrip.this;
            super();
        }

    }

    static interface PagerTitleStripImpl
    {

        public abstract void setSingleLineAllCaps(TextView textview);
    }

    static class PagerTitleStripImplBase
        implements PagerTitleStripImpl
    {

        public void setSingleLineAllCaps(TextView textview)
        {
            textview.setSingleLine();
        }

    }

    static class PagerTitleStripImplIcs
        implements PagerTitleStripImpl
    {

        public void setSingleLineAllCaps(TextView textview)
        {
            PagerTitleStripIcs.setSingleLineAllCaps(textview);
        }

    }


    private static final int ATTRS[] = {
        0x1010034, 0x1010095, 0x1010098, 0x10100af
    };
    private static final PagerTitleStripImpl IMPL;
    private static final float SIDE_ALPHA = 0.6F;
    private static final String TAG = "PagerTitleStrip";
    private static final int TEXT_ATTRS[] = {
        0x101038c
    };
    private static final int TEXT_SPACING = 16;
    TextView mCurrText;
    private int mGravity;
    private int mLastKnownCurrentPage;
    private float mLastKnownPositionOffset;
    TextView mNextText;
    private int mNonPrimaryAlpha;
    private final PageListener mPageListener;
    ViewPager mPager;
    TextView mPrevText;
    private int mScaledTextSpacing;
    int mTextColor;
    private boolean mUpdatingPositions;
    private boolean mUpdatingText;
    private WeakReference mWatchingAdapter;

    public PagerTitleStrip(Context context)
    {
        this(context, null);
    }

    public PagerTitleStrip(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mLastKnownCurrentPage = -1;
        mLastKnownPositionOffset = -1F;
        mPageListener = new PageListener();
        TextView textview = new TextView(context);
        mPrevText = textview;
        addView(textview);
        TextView textview1 = new TextView(context);
        mCurrText = textview1;
        addView(textview1);
        TextView textview2 = new TextView(context);
        mNextText = textview2;
        addView(textview2);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, ATTRS);
        int i = typedarray.getResourceId(0, 0);
        if (i != 0)
        {
            mPrevText.setTextAppearance(context, i);
            mCurrText.setTextAppearance(context, i);
            mNextText.setTextAppearance(context, i);
        }
        int j = typedarray.getDimensionPixelSize(1, 0);
        if (j != 0)
            setTextSize(0, j);
        if (typedarray.hasValue(2))
        {
            int k = typedarray.getColor(2, 0);
            mPrevText.setTextColor(k);
            mCurrText.setTextColor(k);
            mNextText.setTextColor(k);
        }
        mGravity = typedarray.getInteger(3, 80);
        typedarray.recycle();
        mTextColor = mCurrText.getTextColors().getDefaultColor();
        setNonPrimaryAlpha(0.6F);
        mPrevText.setEllipsize(android.text.TextUtils.TruncateAt.END);
        mCurrText.setEllipsize(android.text.TextUtils.TruncateAt.END);
        mNextText.setEllipsize(android.text.TextUtils.TruncateAt.END);
        boolean flag = false;
        if (i != 0)
        {
            TypedArray typedarray1 = context.obtainStyledAttributes(i, TEXT_ATTRS);
            flag = typedarray1.getBoolean(0, false);
            typedarray1.recycle();
        }
        if (flag)
        {
            setSingleLineAllCaps(mPrevText);
            setSingleLineAllCaps(mCurrText);
            setSingleLineAllCaps(mNextText);
        } else
        {
            mPrevText.setSingleLine();
            mCurrText.setSingleLine();
            mNextText.setSingleLine();
        }
        mScaledTextSpacing = (int)(16F * context.getResources().getDisplayMetrics().density);
    }

    private static void setSingleLineAllCaps(TextView textview)
    {
        IMPL.setSingleLineAllCaps(textview);
    }

    int getMinHeight()
    {
        Drawable drawable = getBackground();
        int i = 0;
        if (drawable != null)
            i = drawable.getIntrinsicHeight();
        return i;
    }

    public int getTextSpacing()
    {
        return mScaledTextSpacing;
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        android.view.ViewParent viewparent = getParent();
        if (!(viewparent instanceof ViewPager))
            throw new IllegalStateException("PagerTitleStrip must be a direct child of a ViewPager.");
        ViewPager viewpager = (ViewPager)viewparent;
        PagerAdapter pageradapter = viewpager.getAdapter();
        viewpager.setInternalPageChangeListener(mPageListener);
        viewpager.setOnAdapterChangeListener(mPageListener);
        mPager = viewpager;
        PagerAdapter pageradapter1;
        if (mWatchingAdapter != null)
            pageradapter1 = (PagerAdapter)mWatchingAdapter.get();
        else
            pageradapter1 = null;
        updateAdapter(pageradapter1, pageradapter);
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        if (mPager != null)
        {
            updateAdapter(mPager.getAdapter(), null);
            mPager.setInternalPageChangeListener(null);
            mPager.setOnAdapterChangeListener(null);
            mPager = null;
        }
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        if (mPager != null)
        {
            int i1 = mLastKnownPositionOffset != 0.0F;
            float f = 0.0F;
            if (i1 >= 0)
                f = mLastKnownPositionOffset;
            updateTextPositions(mLastKnownCurrentPage, f, true);
        }
    }

    protected void onMeasure(int i, int j)
    {
        int k = android.view.View.MeasureSpec.getMode(i);
        int l = android.view.View.MeasureSpec.getMode(j);
        int i1 = android.view.View.MeasureSpec.getSize(i);
        int j1 = android.view.View.MeasureSpec.getSize(j);
        if (k != 0x40000000)
            throw new IllegalStateException("Must measure with an exact width");
        int k1 = getMinHeight();
        int l1 = getPaddingTop() + getPaddingBottom();
        int i2 = j1 - l1;
        int j2 = android.view.View.MeasureSpec.makeMeasureSpec((int)(0.8F * (float)i1), 0x80000000);
        int k2 = android.view.View.MeasureSpec.makeMeasureSpec(i2, 0x80000000);
        mPrevText.measure(j2, k2);
        mCurrText.measure(j2, k2);
        mNextText.measure(j2, k2);
        if (l == 0x40000000)
        {
            setMeasuredDimension(i1, j1);
            return;
        } else
        {
            setMeasuredDimension(i1, Math.max(k1, l1 + mCurrText.getMeasuredHeight()));
            return;
        }
    }

    public void requestLayout()
    {
        if (!mUpdatingText)
            super.requestLayout();
    }

    public void setGravity(int i)
    {
        mGravity = i;
        requestLayout();
    }

    public void setNonPrimaryAlpha(float f)
    {
        mNonPrimaryAlpha = 0xff & (int)(255F * f);
        int i = mNonPrimaryAlpha << 24 | 0xffffff & mTextColor;
        mPrevText.setTextColor(i);
        mNextText.setTextColor(i);
    }

    public void setTextColor(int i)
    {
        mTextColor = i;
        mCurrText.setTextColor(i);
        int j = mNonPrimaryAlpha << 24 | 0xffffff & mTextColor;
        mPrevText.setTextColor(j);
        mNextText.setTextColor(j);
    }

    public void setTextSize(int i, float f)
    {
        mPrevText.setTextSize(i, f);
        mCurrText.setTextSize(i, f);
        mNextText.setTextSize(i, f);
    }

    public void setTextSpacing(int i)
    {
        mScaledTextSpacing = i;
        requestLayout();
    }

    void updateAdapter(PagerAdapter pageradapter, PagerAdapter pageradapter1)
    {
        if (pageradapter != null)
        {
            pageradapter.unregisterDataSetObserver(mPageListener);
            mWatchingAdapter = null;
        }
        if (pageradapter1 != null)
        {
            pageradapter1.registerDataSetObserver(mPageListener);
            mWatchingAdapter = new WeakReference(pageradapter1);
        }
        if (mPager != null)
        {
            mLastKnownCurrentPage = -1;
            mLastKnownPositionOffset = -1F;
            updateText(mPager.getCurrentItem(), pageradapter1);
            requestLayout();
        }
    }

    void updateText(int i, PagerAdapter pageradapter)
    {
        int j;
        if (pageradapter != null)
            j = pageradapter.getCount();
        else
            j = 0;
        mUpdatingText = true;
        CharSequence charsequence = null;
        if (i >= 1)
        {
            charsequence = null;
            if (pageradapter != null)
                charsequence = pageradapter.getPageTitle(i - 1);
        }
        mPrevText.setText(charsequence);
        TextView textview = mCurrText;
        CharSequence charsequence1;
        if (pageradapter != null && i < j)
            charsequence1 = pageradapter.getPageTitle(i);
        else
            charsequence1 = null;
        textview.setText(charsequence1);
        int k = i + 1;
        CharSequence charsequence2 = null;
        if (k < j)
        {
            charsequence2 = null;
            if (pageradapter != null)
                charsequence2 = pageradapter.getPageTitle(i + 1);
        }
        mNextText.setText(charsequence2);
        int l = getWidth() - getPaddingLeft() - getPaddingRight();
        int i1 = getHeight() - getPaddingTop() - getPaddingBottom();
        int j1 = android.view.View.MeasureSpec.makeMeasureSpec((int)(0.8F * (float)l), 0x80000000);
        int k1 = android.view.View.MeasureSpec.makeMeasureSpec(i1, 0x80000000);
        mPrevText.measure(j1, k1);
        mCurrText.measure(j1, k1);
        mNextText.measure(j1, k1);
        mLastKnownCurrentPage = i;
        if (!mUpdatingPositions)
            updateTextPositions(i, mLastKnownPositionOffset, false);
        mUpdatingText = false;
    }

    void updateTextPositions(int i, float f, boolean flag)
    {
        if (i != mLastKnownCurrentPage)
            updateText(i, mPager.getAdapter());
        else
        if (!flag && f == mLastKnownPositionOffset)
            return;
        mUpdatingPositions = true;
        int j = mPrevText.getMeasuredWidth();
        int k = mCurrText.getMeasuredWidth();
        int l = mNextText.getMeasuredWidth();
        int i1 = k / 2;
        int j1 = getWidth();
        int k1 = getHeight();
        int l1 = getPaddingLeft();
        int i2 = getPaddingRight();
        int j2 = getPaddingTop();
        int k2 = getPaddingBottom();
        int l2 = l1 + i1;
        int i3 = i2 + i1;
        int j3 = j1 - l2 - i3;
        float f1 = f + 0.5F;
        if (f1 > 1.0F)
            f1--;
        int k3 = j1 - i3 - (int)(f1 * (float)j3) - k / 2;
        int l3 = k3 + k;
        int i4 = mPrevText.getBaseline();
        int j4 = mCurrText.getBaseline();
        int k4 = mNextText.getBaseline();
        int l4 = Math.max(Math.max(i4, j4), k4);
        int i5 = l4 - i4;
        int j5 = l4 - j4;
        int k5 = l4 - k4;
        int l5 = i5 + mPrevText.getMeasuredHeight();
        int i6 = j5 + mCurrText.getMeasuredHeight();
        int j6 = k5 + mNextText.getMeasuredHeight();
        int k6 = Math.max(Math.max(l5, i6), j6);
        int l6;
        int i7;
        int j7;
        switch (0x70 & mGravity)
        {
        case 80: // 'P'
            int k9 = k1 - k2 - k6;
            l6 = k9 + i5;
            i7 = k9 + j5;
            j7 = k9 + k5;
            break;

        case 16: // '\020'
            int j9 = (k1 - j2 - k2 - k6) / 2;
            l6 = j9 + i5;
            i7 = j9 + j5;
            j7 = j9 + k5;
            break;

        default:
            l6 = j2 + i5;
            i7 = j2 + j5;
            j7 = j2 + k5;
            break;
        }
        TextView textview = mCurrText;
        int k7 = i7 + mCurrText.getMeasuredHeight();
        textview.layout(k3, i7, l3, k7);
        int l7 = Math.min(l1, k3 - mScaledTextSpacing - j);
        TextView textview1 = mPrevText;
        int i8 = l7 + j;
        int j8 = l6 + mPrevText.getMeasuredHeight();
        textview1.layout(l7, l6, i8, j8);
        int k8 = Math.max(j1 - i2 - l, l3 + mScaledTextSpacing);
        TextView textview2 = mNextText;
        int l8 = k8 + l;
        int i9 = j7 + mNextText.getMeasuredHeight();
        textview2.layout(k8, j7, l8, i9);
        mLastKnownPositionOffset = f;
        mUpdatingPositions = false;
    }

    static 
    {
        if (android.os.Build.VERSION.SDK_INT >= 14)
            IMPL = new PagerTitleStripImplIcs();
        else
            IMPL = new PagerTitleStripImplBase();
    }

}
