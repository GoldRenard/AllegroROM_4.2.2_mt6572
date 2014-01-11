// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.CompatibilityInfo;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.text.InputFilter;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.method.NumberKeyListener;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import android.view.animation.DecelerateInterpolator;
import android.view.inputmethod.InputMethodManager;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import libcore.icu.LocaleData;

// Referenced classes of package android.widget:
//            LinearLayout, ImageButton, EditText, Scroller, 
//            TextView, Button

public class NumberPicker extends LinearLayout
{
    class BeginSoftInputOnLongPressCommand
        implements Runnable
    {

        final NumberPicker this$0;

        public void run()
        {
            showSoftInput();
            mIngonreMoveEvents = true;
        }

        BeginSoftInputOnLongPressCommand()
        {
            this$0 = NumberPicker.this;
            super();
        }
    }

    class ChangeCurrentByOneFromLongPressCommand
        implements Runnable
    {

        private boolean mIncrement;
        final NumberPicker this$0;

        private void setStep(boolean flag)
        {
            mIncrement = flag;
        }

        public void run()
        {
            changeValueByOne(mIncrement);
            postDelayed(this, mLongPressUpdateInterval);
        }


        ChangeCurrentByOneFromLongPressCommand()
        {
            this$0 = NumberPicker.this;
            super();
        }
    }

    public static class CustomEditText extends EditText
    {

        public void onEditorAction(int i)
        {
            super.onEditorAction(i);
            if (i == 6)
                clearFocus();
        }

        public CustomEditText(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
        }
    }

    public static interface Formatter
    {

        public abstract String format(int i);
    }

    class InputTextFilter extends NumberKeyListener
    {

        final NumberPicker this$0;

        public CharSequence filter(CharSequence charsequence, int i, int j, Spanned spanned, int k, int l)
        {
            if (mDisplayedValues == null)
            {
                CharSequence charsequence1 = super.filter(charsequence, i, j, spanned, k, l);
                if (charsequence1 == null)
                    charsequence1 = charsequence.subSequence(i, j);
                String s4 = (new StringBuilder()).append(String.valueOf(spanned.subSequence(0, k))).append(charsequence1).append(spanned.subSequence(l, spanned.length())).toString();
                if ("".equals(s4))
                    return s4;
                if (getSelectedPos(s4) > mMaxValue)
                    return "";
                else
                    return charsequence1;
            }
            String s = String.valueOf(charsequence.subSequence(i, j));
            if (TextUtils.isEmpty(s))
                return "";
            String s1 = (new StringBuilder()).append(String.valueOf(spanned.subSequence(0, k))).append(s).append(spanned.subSequence(l, spanned.length())).toString();
            String s2 = String.valueOf(s1).toLowerCase();
            String as[] = mDisplayedValues;
            int i1 = as.length;
            for (int j1 = 0; j1 < i1; j1++)
            {
                String s3 = as[j1];
                if (s3.toLowerCase().startsWith(s2))
                {
                    postSetSelectionCommand(s1.length(), s3.length());
                    return s3.subSequence(k, s3.length());
                }
            }

            return "";
        }

        protected char[] getAcceptedChars()
        {
            return NumberPicker.DIGIT_CHARACTERS;
        }

        public int getInputType()
        {
            return 1;
        }

        InputTextFilter()
        {
            this$0 = NumberPicker.this;
            super();
        }
    }

    public static interface OnScrollListener
    {

        public static final int SCROLL_STATE_FLING = 2;
        public static final int SCROLL_STATE_IDLE = 0;
        public static final int SCROLL_STATE_TOUCH_SCROLL = 1;

        public abstract void onScrollStateChange(NumberPicker numberpicker, int i);
    }

    public static interface OnValueChangeListener
    {

        public abstract void onValueChange(NumberPicker numberpicker, int i, int j);
    }

    class SetSelectionCommand
        implements Runnable
    {

        private int mSelectionEnd;
        private int mSelectionStart;
        final NumberPicker this$0;

        public void run()
        {
            if (mSelectionStart < mSelectionEnd ? mInputText.length() >= mSelectionEnd : mInputText.length() >= mSelectionStart)
                mInputText.setSelection(mSelectionStart, mSelectionEnd);
        }


/*
        static int access$602(SetSelectionCommand setselectioncommand, int i)
        {
            setselectioncommand.mSelectionStart = i;
            return i;
        }

*/


/*
        static int access$702(SetSelectionCommand setselectioncommand, int i)
        {
            setselectioncommand.mSelectionEnd = i;
            return i;
        }

*/

        SetSelectionCommand()
        {
            this$0 = NumberPicker.this;
            super();
        }
    }

    private static class TwoDigitFormatter
        implements Formatter
    {

        final Object mArgs[] = new Object[1];
        final StringBuilder mBuilder = new StringBuilder();
        java.util.Formatter mFmt;
        char mZeroDigit;

        private java.util.Formatter createFormatter(Locale locale)
        {
            return new Formatter(mBuilder, locale);
        }

        private static char getZeroDigit(Locale locale)
        {
            return LocaleData.get(locale).zeroDigit;
        }

        private void init(Locale locale)
        {
            mFmt = createFormatter(locale);
            mZeroDigit = getZeroDigit(locale);
        }

        public String format(int i)
        {
            Locale locale = Locale.getDefault();
            if (mZeroDigit != getZeroDigit(locale))
                init(locale);
            mArgs[0] = Integer.valueOf(i);
            mBuilder.delete(0, mBuilder.length());
            mFmt.format("%02d", mArgs);
            return mFmt.toString();
        }

        TwoDigitFormatter()
        {
            init(Locale.getDefault());
        }
    }


    private static final int DEFAULT_LAYOUT_RESOURCE_ID = 0x1090096;
    private static final long DEFAULT_LONG_PRESS_UPDATE_INTERVAL = 300L;
    private static final char DIGIT_CHARACTERS[] = {
        '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
        '\u0660', '\u0661', '\u0662', '\u0663', '\u0664', '\u0665', '\u0666', '\u0667', '\u0668', '\u0669', 
        '\u06F0', '\u06F1', '\u06F2', '\u06F3', '\u06F4', '\u06F5', '\u06F6', '\u06F7', '\u06F8', '\u06F9'
    };
    private static final int SELECTOR_ADJUSTMENT_DURATION_MILLIS = 800;
    private static final int SELECTOR_MAX_FLING_VELOCITY_ADJUSTMENT = 8;
    private static final int SELECTOR_MIDDLE_ITEM_INDEX = 1;
    private static final int SELECTOR_WHEEL_ITEM_COUNT = 3;
    private static final int SIZE_UNSPECIFIED = -1;
    private static final int SNAP_SCROLL_DURATION = 300;
    private static final float TOP_AND_BOTTOM_FADING_EDGE_STRENGTH = 0.9F;
    private static final int UNSCALED_DEFAULT_SELECTION_DIVIDERS_DISTANCE = 48;
    private static final int UNSCALED_DEFAULT_SELECTION_DIVIDER_HEIGHT = 2;
    private static final TwoDigitFormatter sTwoDigitFormatter = new TwoDigitFormatter();
    private AccessibilityNodeProviderImpl mAccessibilityNodeProvider;
    private final Scroller mAdjustScroller;
    private BeginSoftInputOnLongPressCommand mBeginSoftInputOnLongPressCommand;
    private int mBottomSelectionDividerBottom;
    private ChangeCurrentByOneFromLongPressCommand mChangeCurrentByOneFromLongPressCommand;
    private final boolean mComputeMaxWidth;
    private int mCurrentScrollOffset;
    private final ImageButton mDecrementButton;
    private boolean mDecrementVirtualButtonPressed;
    private String mDisplayedValues[];
    private final Scroller mFlingScroller;
    private Formatter mFormatter;
    private final boolean mHasSelectorWheel;
    private final ImageButton mIncrementButton;
    private boolean mIncrementVirtualButtonPressed;
    private boolean mIngonreMoveEvents;
    private int mInitialScrollOffset;
    private final EditText mInputText;
    private long mLastDownEventTime;
    private float mLastDownEventY;
    private float mLastDownOrMoveEventY;
    private int mLastHoveredChildVirtualViewId;
    private long mLongPressUpdateInterval;
    private final int mMaxHeight;
    private int mMaxValue;
    private int mMaxWidth;
    private int mMaximumFlingVelocity;
    private final int mMinHeight;
    private int mMinValue;
    private final int mMinWidth;
    private int mMinimumFlingVelocity;
    private OnScrollListener mOnScrollListener;
    private OnValueChangeListener mOnValueChangeListener;
    private final PressedStateHelper mPressedStateHelper;
    private int mPreviousScrollerY;
    private int mScrollState;
    private final Drawable mSelectionDivider;
    private final int mSelectionDividerHeight;
    private final int mSelectionDividersDistance;
    private int mSelectorElementHeight;
    private final SparseArray mSelectorIndexToStringCache;
    private final int mSelectorIndices[];
    private int mSelectorTextGapHeight;
    private final Paint mSelectorWheelPaint;
    private SetSelectionCommand mSetSelectionCommand;
    private boolean mShowSoftInputOnTap;
    private final int mSolidColor;
    private final int mTextSize;
    private int mTopSelectionDividerTop;
    private int mTouchSlop;
    private int mValue;
    private VelocityTracker mVelocityTracker;
    private final Drawable mVirtualButtonPressedDrawable;
    private boolean mWrapSelectorWheel;

    public NumberPicker(Context context)
    {
        NumberPicker(context, null);
    }

    public NumberPicker(Context context, AttributeSet attributeset)
    {
        NumberPicker(context, attributeset, 0x10103de);
    }

    public NumberPicker(Context context, AttributeSet attributeset, int i)
    {
        LinearLayout(context, attributeset, i);
        mLongPressUpdateInterval = 300L;
        mSelectorIndexToStringCache = new SparseArray();
        mSelectorIndices = new int[3];
        mInitialScrollOffset = 0x80000000;
        mScrollState = 0;
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.NumberPicker, i, 0);
        int j = typedarray.getResourceId(1, 0x1090096);
        boolean flag;
        if (j != 0x1090096)
            flag = true;
        else
            flag = false;
        mHasSelectorWheel = flag;
        mSolidColor = typedarray.getColor(0, 0);
        mSelectionDivider = typedarray.getDrawable(2);
        mSelectionDividerHeight = typedarray.getDimensionPixelSize(3, (int)TypedValue.applyDimension(1, 2.0F, getResources().getDisplayMetrics()));
        mSelectionDividersDistance = typedarray.getDimensionPixelSize(4, (int)TypedValue.applyDimension(1, 48F, getResources().getDisplayMetrics()));
        mMinHeight = typedarray.getDimensionPixelSize(5, -1);
        mMaxHeight = typedarray.getDimensionPixelSize(6, -1);
        if (mMinHeight != -1 && mMaxHeight != -1 && mMinHeight > mMaxHeight)
            throw new IllegalArgumentException("minHeight > maxHeight");
        mMinWidth = typedarray.getDimensionPixelSize(7, -1);
        mMaxWidth = typedarray.getDimensionPixelSize(8, -1);
        if (mMinWidth != -1 && mMaxWidth != -1 && mMinWidth > mMaxWidth)
            throw new IllegalArgumentException("minWidth > maxWidth");
        boolean flag1;
        if (mMaxWidth == -1)
            flag1 = true;
        else
            flag1 = false;
        mComputeMaxWidth = flag1;
        mVirtualButtonPressedDrawable = typedarray.getDrawable(9);
        typedarray.recycle();
        mPressedStateHelper = new PressedStateHelper();
        boolean flag2;
        if (!mHasSelectorWheel)
            flag2 = true;
        else
            flag2 = false;
        setWillNotDraw(flag2);
        ((LayoutInflater)getContext().getSystemService("layout_inflater")).inflate(j, this, true);
        android.view.View.OnClickListener onclicklistener = new android.view.View.OnClickListener() {

            final NumberPicker this$0;

            public void onClick(View view)
            {
                hideSoftInput();
                mInputText.clearFocus();
                if (view.getId() == 0x1020340)
                {
                    changeValueByOne(true);
                    return;
                } else
                {
                    changeValueByOne(false);
                    return;
                }
            }

            
            {
                this$0 = NumberPicker.this;
                super();
            }
        }
;
        android.view.View.OnLongClickListener onlongclicklistener = new android.view.View.OnLongClickListener() {

            final NumberPicker this$0;

            public boolean onLongClick(View view)
            {
                hideSoftInput();
                mInputText.clearFocus();
                if (view.getId() == 0x1020340)
                {
                    postChangeCurrentByOneFromLongPress(true, 0L);
                    return true;
                } else
                {
                    postChangeCurrentByOneFromLongPress(false, 0L);
                    return true;
                }
            }

            
            {
                this$0 = NumberPicker.this;
                super();
            }
        }
;
        if (!mHasSelectorWheel)
        {
            mIncrementButton = (ImageButton)findViewById(0x1020340);
            mIncrementButton.setOnClickListener(onclicklistener);
            mIncrementButton.setOnLongClickListener(onlongclicklistener);
        } else
        {
            mIncrementButton = null;
        }
        if (!mHasSelectorWheel)
        {
            mDecrementButton = (ImageButton)findViewById(0x1020342);
            mDecrementButton.setOnClickListener(onclicklistener);
            mDecrementButton.setOnLongClickListener(onlongclicklistener);
        } else
        {
            mDecrementButton = null;
        }
        mInputText = (EditText)findViewById(0x1020341);
        mInputText.setOnFocusChangeListener(new android.view.View.OnFocusChangeListener() {

            final NumberPicker this$0;

            public void onFocusChange(View view, boolean flag3)
            {
                if (flag3)
                {
                    mInputText.selectAll();
                    return;
                } else
                {
                    mInputText.setSelection(0, 0);
                    validateInputTextView(view);
                    return;
                }
            }

            
            {
                this$0 = NumberPicker.this;
                super();
            }
        }
);
        EditText edittext = mInputText;
        InputFilter ainputfilter[] = new InputFilter[1];
        ainputfilter[0] = new InputTextFilter();
        edittext.setFilters(ainputfilter);
        mInputText.setRawInputType(2);
        mInputText.setImeOptions(6);
        ViewConfiguration viewconfiguration = ViewConfiguration.get(context);
        mTouchSlop = viewconfiguration.getScaledTouchSlop();
        mMinimumFlingVelocity = viewconfiguration.getScaledMinimumFlingVelocity();
        mMaximumFlingVelocity = viewconfiguration.getScaledMaximumFlingVelocity() / 8;
        mTextSize = (int)mInputText.getTextSize();
        Paint paint = new Paint();
        paint.setAntiAlias(true);
        paint.setTextAlign(android.graphics.Paint.Align.CENTER);
        paint.setTextSize(mTextSize);
        paint.setTypeface(mInputText.getTypeface());
        paint.setColor(mInputText.getTextColors().getColorForState(ENABLED_STATE_SET, -1));
        mSelectorWheelPaint = paint;
        mFlingScroller = new Scroller(getContext(), null, true);
        mAdjustScroller = new Scroller(getContext(), new DecelerateInterpolator(2.5F));
        updateInputTextView();
        if (getImportantForAccessibility() == 0)
            setImportantForAccessibility(1);
    }

    private void changeValueByOne(boolean flag)
    {
        if (mHasSelectorWheel)
        {
            mInputText.setVisibility(4);
            if (!moveToFinalScrollerPosition(mFlingScroller))
                moveToFinalScrollerPosition(mAdjustScroller);
            mPreviousScrollerY = 0;
            if (flag)
                mFlingScroller.startScroll(0, 0, 0, -mSelectorElementHeight, 300);
            else
                mFlingScroller.startScroll(0, 0, 0, mSelectorElementHeight, 300);
            invalidate();
            return;
        }
        if (flag)
        {
            setValueInternal(1 + mValue, true);
            return;
        } else
        {
            setValueInternal(-1 + mValue, true);
            return;
        }
    }

    private void decrementSelectorIndices(int ai[])
    {
        for (int i = -1 + ai.length; i > 0; i--)
            ai[i] = ai[i - 1];

        int j = -1 + ai[1];
        if (mWrapSelectorWheel && j < mMinValue)
            j = mMaxValue;
        ai[0] = j;
        ensureCachedScrollSelectorValue(j);
    }

    private void ensureCachedScrollSelectorValue(int i)
    {
        SparseArray sparsearray = mSelectorIndexToStringCache;
        if ((String)sparsearray.get(i) != null)
            return;
        String s;
        if (i >= mMinValue && i <= mMaxValue)
        {
            if (mDisplayedValues != null)
            {
                int j = i - mMinValue;
                s = mDisplayedValues[j];
            } else
            {
                s = formatNumber(i);
            }
        } else
        {
            s = "";
        }
        sparsearray.put(i, s);
    }

    private boolean ensureScrollWheelAdjusted()
    {
        int i = mInitialScrollOffset - mCurrentScrollOffset;
        boolean flag = false;
        if (i != 0)
        {
            mPreviousScrollerY = 0;
            if (Math.abs(i) > mSelectorElementHeight / 2)
            {
                int j;
                if (i > 0)
                    j = -mSelectorElementHeight;
                else
                    j = mSelectorElementHeight;
                i += j;
            }
            mAdjustScroller.startScroll(0, 0, 0, i, 800);
            invalidate();
            flag = true;
        }
        return flag;
    }

    private void fling(int i)
    {
        mPreviousScrollerY = 0;
        if (i > 0)
            mFlingScroller.fling(0, 0, 0, i, 0, 0, 0, 0x7fffffff);
        else
            mFlingScroller.fling(0, 0x7fffffff, 0, i, 0, 0, 0, 0x7fffffff);
        invalidate();
    }

    private String formatNumber(int i)
    {
        if (mFormatter != null)
            return mFormatter.format(i);
        else
            return formatNumberWithLocale(i);
    }

    private static String formatNumberWithLocale(int i)
    {
        Locale locale = Locale.getDefault();
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i);
        return String.format(locale, "%d", aobj);
    }

    private int getSelectedPos(String s)
    {
        if (mDisplayedValues != null)
            break MISSING_BLOCK_LABEL_16;
        int k = Integer.parseInt(s);
        return k;
        for (int i = 0; i < mDisplayedValues.length; i++)
        {
            s = s.toLowerCase();
            if (mDisplayedValues[i].toLowerCase().startsWith(s))
                return i + mMinValue;
        }

        int j = Integer.parseInt(s);
        return j;
        NumberFormatException numberformatexception1;
        numberformatexception1;
_L2:
        return mMinValue;
        NumberFormatException numberformatexception;
        numberformatexception;
        if (true) goto _L2; else goto _L1
_L1:
    }

    public static final Formatter getTwoDigitFormatter()
    {
        return sTwoDigitFormatter;
    }

    private int getWrappedSelectorIndex(int i)
    {
        if (i > mMaxValue)
            i = -1 + (mMinValue + (i - mMaxValue) % (mMaxValue - mMinValue));
        else
        if (i < mMinValue)
            return 1 + (mMaxValue - (mMinValue - i) % (mMaxValue - mMinValue));
        return i;
    }

    private void hideSoftInput()
    {
        InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
        if (inputmethodmanager != null && inputmethodmanager.isActive(mInputText))
        {
            inputmethodmanager.hideSoftInputFromWindow(getWindowToken(), 0);
            if (mHasSelectorWheel)
                mInputText.setVisibility(4);
        }
    }

    private void incrementSelectorIndices(int ai[])
    {
        for (int i = 0; i < -1 + ai.length; i++)
            ai[i] = ai[i + 1];

        int j = 1 + ai[-2 + ai.length];
        if (mWrapSelectorWheel && j > mMaxValue)
            j = mMinValue;
        ai[-1 + ai.length] = j;
        ensureCachedScrollSelectorValue(j);
    }

    private void initializeFadingEdges()
    {
        setVerticalFadingEdgeEnabled(true);
        setFadingEdgeLength((super.mBottom - super.mTop - mTextSize) / 2);
    }

    private void initializeSelectorWheel()
    {
        initializeSelectorWheelIndices();
        int ai[] = mSelectorIndices;
        int i = ai.length * mTextSize;
        mSelectorTextGapHeight = (int)(0.5F + (float)(super.mBottom - super.mTop - i) / (float)ai.length);
        mSelectorElementHeight = mTextSize + mSelectorTextGapHeight;
        mInitialScrollOffset = (mInputText.getBaseline() + mInputText.getTop()) - 1 * mSelectorElementHeight;
        mCurrentScrollOffset = mInitialScrollOffset;
        updateInputTextView();
    }

    private void initializeSelectorWheelIndices()
    {
        mSelectorIndexToStringCache.clear();
        int ai[] = mSelectorIndices;
        int i = getValue();
        for (int j = 0; j < mSelectorIndices.length; j++)
        {
            int k = i + (j - 1);
            if (mWrapSelectorWheel)
                k = getWrappedSelectorIndex(k);
            ai[j] = k;
            ensureCachedScrollSelectorValue(ai[j]);
        }

    }

    private int makeMeasureSpec(int i, int j)
    {
        if (j != -1)
        {
            int k = android.view.View.MeasureSpec.getSize(i);
            int l = android.view.View.MeasureSpec.getMode(i);
            switch (l)
            {
            case 0: // '\0'
                return android.view.View.MeasureSpec.makeMeasureSpec(j, 0x40000000);

            case -2147483648: 
                return android.view.View.MeasureSpec.makeMeasureSpec(Math.min(k, j), 0x40000000);

            default:
                throw new IllegalArgumentException((new StringBuilder()).append("Unknown measure mode: ").append(l).toString());

            case 1073741824: 
                break;
            }
        }
        return i;
    }

    private boolean moveToFinalScrollerPosition(Scroller scroller)
    {
        scroller.forceFinished(true);
        int i = scroller.getFinalY() - scroller.getCurrY();
        int j = (i + mCurrentScrollOffset) % mSelectorElementHeight;
        int k = mInitialScrollOffset - j;
        if (k != 0)
        {
            if (Math.abs(k) > mSelectorElementHeight / 2)
                if (k > 0)
                    k -= mSelectorElementHeight;
                else
                    k += mSelectorElementHeight;
            scrollBy(0, i + k);
            return true;
        } else
        {
            return false;
        }
    }

    private void notifyChange(int i, int j)
    {
        if (mOnValueChangeListener != null)
            mOnValueChangeListener.onValueChange(this, i, mValue);
    }

    private void onScrollStateChange(int i)
    {
        if (mScrollState != i)
        {
            mScrollState = i;
            if (mOnScrollListener != null)
            {
                mOnScrollListener.onScrollStateChange(this, i);
                return;
            }
        }
    }

    private void onScrollerFinished(Scroller scroller)
    {
        if (scroller == mFlingScroller)
        {
            if (!ensureScrollWheelAdjusted())
                updateInputTextView();
            onScrollStateChange(0);
        } else
        if (mScrollState != 1)
        {
            updateInputTextView();
            return;
        }
    }

    private void postBeginSoftInputOnLongPressCommand()
    {
        if (mBeginSoftInputOnLongPressCommand == null)
            mBeginSoftInputOnLongPressCommand = new BeginSoftInputOnLongPressCommand();
        else
            removeCallbacks(mBeginSoftInputOnLongPressCommand);
        postDelayed(mBeginSoftInputOnLongPressCommand, ViewConfiguration.getLongPressTimeout());
    }

    private void postChangeCurrentByOneFromLongPress(boolean flag, long l)
    {
        if (mChangeCurrentByOneFromLongPressCommand == null)
            mChangeCurrentByOneFromLongPressCommand = new ChangeCurrentByOneFromLongPressCommand();
        else
            removeCallbacks(mChangeCurrentByOneFromLongPressCommand);
        mChangeCurrentByOneFromLongPressCommand.setStep(flag);
        postDelayed(mChangeCurrentByOneFromLongPressCommand, l);
    }

    private void postSetSelectionCommand(int i, int j)
    {
        if (mSetSelectionCommand == null)
            mSetSelectionCommand = new SetSelectionCommand();
        else
            removeCallbacks(mSetSelectionCommand);
        mSetSelectionCommand.mSelectionStart = i;
        mSetSelectionCommand.mSelectionEnd = j;
        post(mSetSelectionCommand);
    }

    private void removeAllCallbacks()
    {
        if (mChangeCurrentByOneFromLongPressCommand != null)
            removeCallbacks(mChangeCurrentByOneFromLongPressCommand);
        if (mSetSelectionCommand != null)
            removeCallbacks(mSetSelectionCommand);
        if (mBeginSoftInputOnLongPressCommand != null)
            removeCallbacks(mBeginSoftInputOnLongPressCommand);
        mPressedStateHelper.cancel();
    }

    private void removeBeginSoftInputCommand()
    {
        if (mBeginSoftInputOnLongPressCommand != null)
            removeCallbacks(mBeginSoftInputOnLongPressCommand);
    }

    private void removeChangeCurrentByOneFromLongPress()
    {
        if (mChangeCurrentByOneFromLongPressCommand != null)
            removeCallbacks(mChangeCurrentByOneFromLongPressCommand);
    }

    private int resolveSizeAndStateRespectingMinSize(int i, int j, int k)
    {
        if (i != -1)
            j = resolveSizeAndState(Math.max(i, j), k, 0);
        return j;
    }

    private void setValueInternal(int i, boolean flag)
    {
        if (mValue == i)
            return;
        int j;
        if (mWrapSelectorWheel)
            j = getWrappedSelectorIndex(i);
        else
            j = Math.min(Math.max(i, mMinValue), mMaxValue);
        int k = mValue;
        mValue = j;
        updateInputTextView();
        if (flag)
            notifyChange(k, j);
        initializeSelectorWheelIndices();
        invalidate();
    }

    private void showSoftInput()
    {
        InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
        if (inputmethodmanager != null)
        {
            if (mHasSelectorWheel)
                mInputText.setVisibility(0);
            mInputText.requestFocus();
            inputmethodmanager.showSoftInput(mInputText, 0);
        }
    }

    private void tryComputeMaxWidth()
    {
        if (mComputeMaxWidth)
        {
            int i = 0;
            if (mDisplayedValues == null)
            {
                float f1 = 0.0F;
                for (int i1 = 0; i1 <= 9; i1++)
                {
                    float f2 = mSelectorWheelPaint.measureText(formatNumberWithLocale(i1));
                    if (f2 > f1)
                        f1 = f2;
                }

                int j1 = 0;
                for (int k1 = mMaxValue; k1 > 0; k1 /= 10)
                    j1++;

                i = (int)(f1 * (float)j1);
            } else
            {
                int j = mDisplayedValues.length;
                for (int k = 0; k < j; k++)
                {
                    float f = mSelectorWheelPaint.measureText(mDisplayedValues[k]);
                    if (f > (float)i)
                        i = (int)f;
                }

            }
            int l = i + (mInputText.getPaddingLeft() + mInputText.getPaddingRight());
            if (mMaxWidth != l)
            {
                if (l > mMinWidth)
                    mMaxWidth = l;
                else
                    mMaxWidth = mMinWidth;
                invalidate();
                return;
            }
        }
    }

    private boolean updateInputTextView()
    {
        String s;
        if (mDisplayedValues == null)
            s = formatNumber(mValue);
        else
            s = mDisplayedValues[mValue - mMinValue];
        if (!TextUtils.isEmpty(s) && !s.equals(mInputText.getText().toString()))
        {
            mInputText.setText(s);
            return true;
        } else
        {
            return false;
        }
    }

    private void validateInputTextView(View view)
    {
        String s = String.valueOf(((TextView)view).getText());
        if (TextUtils.isEmpty(s))
        {
            updateInputTextView();
            return;
        } else
        {
            setValueInternal(getSelectedPos(s.toString()), true);
            return;
        }
    }

    public void computeScroll()
    {
        Scroller scroller = mFlingScroller;
        if (scroller.isFinished())
        {
            scroller = mAdjustScroller;
            if (scroller.isFinished())
                return;
        }
        scroller.computeScrollOffset();
        int i = scroller.getCurrY();
        if (mPreviousScrollerY == 0)
            mPreviousScrollerY = scroller.getStartY();
        scrollBy(0, i - mPreviousScrollerY);
        mPreviousScrollerY = i;
        if (scroller.isFinished())
        {
            onScrollerFinished(scroller);
            return;
        } else
        {
            invalidate();
            return;
        }
    }

    protected boolean dispatchHoverEvent(MotionEvent motionevent)
    {
        if (!mHasSelectorWheel)
            return super.dispatchHoverEvent(motionevent);
        if (AccessibilityManager.getInstance(super.mContext).isEnabled())
        {
            int i = (int)motionevent.getY();
            int j;
            if (i < mTopSelectionDividerTop)
                j = 3;
            else
            if (i > mBottomSelectionDividerBottom)
                j = 1;
            else
                j = 2;
            int k = motionevent.getActionMasked();
            AccessibilityNodeProviderImpl accessibilitynodeproviderimpl = (AccessibilityNodeProviderImpl)getAccessibilityNodeProvider();
            switch (k)
            {
            case 8: // '\b'
            default:
                break;

            case 10: // '\n'
                accessibilitynodeproviderimpl.sendAccessibilityEventForVirtualView(j, 256);
                mLastHoveredChildVirtualViewId = -1;
                break;

            case 7: // '\007'
                if (mLastHoveredChildVirtualViewId != j && mLastHoveredChildVirtualViewId != -1)
                {
                    accessibilitynodeproviderimpl.sendAccessibilityEventForVirtualView(mLastHoveredChildVirtualViewId, 256);
                    accessibilitynodeproviderimpl.sendAccessibilityEventForVirtualView(j, 128);
                    mLastHoveredChildVirtualViewId = j;
                    accessibilitynodeproviderimpl.performAction(j, 64, null);
                }
                break;

            case 9: // '\t'
                accessibilitynodeproviderimpl.sendAccessibilityEventForVirtualView(j, 128);
                mLastHoveredChildVirtualViewId = j;
                accessibilitynodeproviderimpl.performAction(j, 64, null);
                break;
            }
        }
        return false;
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        switch (keyevent.getKeyCode())
        {
        case 23: // '\027'
        case 66: // 'B'
            removeAllCallbacks();
            break;
        }
        return super.dispatchKeyEvent(keyevent);
    }

    public boolean dispatchTouchEvent(MotionEvent motionevent)
    {
        switch (motionevent.getActionMasked())
        {
        case 1: // '\001'
        case 3: // '\003'
            removeAllCallbacks();
            // fall through

        case 2: // '\002'
        default:
            return super.dispatchTouchEvent(motionevent);
        }
    }

    public boolean dispatchTrackballEvent(MotionEvent motionevent)
    {
        switch (motionevent.getActionMasked())
        {
        case 1: // '\001'
        case 3: // '\003'
            removeAllCallbacks();
            // fall through

        case 2: // '\002'
        default:
            return super.dispatchTrackballEvent(motionevent);
        }
    }

    public AccessibilityNodeProvider getAccessibilityNodeProvider()
    {
        if (!mHasSelectorWheel)
            return super.getAccessibilityNodeProvider();
        if (mAccessibilityNodeProvider == null)
            mAccessibilityNodeProvider = new AccessibilityNodeProviderImpl();
        return mAccessibilityNodeProvider;
    }

    protected float getBottomFadingEdgeStrength()
    {
        return 0.9F;
    }

    public String[] getDisplayedValues()
    {
        return mDisplayedValues;
    }

    public int getMaxValue()
    {
        return mMaxValue;
    }

    public int getMinValue()
    {
        return mMinValue;
    }

    public int getSolidColor()
    {
        return mSolidColor;
    }

    protected float getTopFadingEdgeStrength()
    {
        return 0.9F;
    }

    public int getValue()
    {
        return mValue;
    }

    public boolean getWrapSelectorWheel()
    {
        return mWrapSelectorWheel;
    }

    protected void onDetachedFromWindow()
    {
        removeAllCallbacks();
    }

    protected void onDraw(Canvas canvas)
    {
        if (!mHasSelectorWheel)
        {
            super.onDraw(canvas);
        } else
        {
            float f = (super.mRight - super.mLeft) / 2;
            float f1 = mCurrentScrollOffset;
            if (mVirtualButtonPressedDrawable != null && mScrollState == 0)
            {
                if (mDecrementVirtualButtonPressed)
                {
                    mVirtualButtonPressedDrawable.setState(PRESSED_STATE_SET);
                    mVirtualButtonPressedDrawable.setBounds(0, 0, super.mRight, mTopSelectionDividerTop);
                    mVirtualButtonPressedDrawable.draw(canvas);
                }
                if (mIncrementVirtualButtonPressed)
                {
                    mVirtualButtonPressedDrawable.setState(PRESSED_STATE_SET);
                    mVirtualButtonPressedDrawable.setBounds(0, mBottomSelectionDividerBottom, super.mRight, super.mBottom);
                    mVirtualButtonPressedDrawable.draw(canvas);
                }
            }
            int ai[] = mSelectorIndices;
            for (int i = 0; i < ai.length; i++)
            {
                int j1 = ai[i];
                String s = (String)mSelectorIndexToStringCache.get(j1);
                if (i != 1 || mInputText.getVisibility() != 0)
                    canvas.drawText(s, f, f1, mSelectorWheelPaint);
                f1 += mSelectorElementHeight;
            }

            if (mSelectionDivider != null)
            {
                int j = mTopSelectionDividerTop;
                int k = j + mSelectionDividerHeight;
                mSelectionDivider.setBounds(0, j, super.mRight, k);
                mSelectionDivider.draw(canvas);
                int l = mBottomSelectionDividerBottom;
                int i1 = l - mSelectionDividerHeight;
                mSelectionDivider.setBounds(0, i1, super.mRight, l);
                mSelectionDivider.draw(canvas);
                return;
            }
        }
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/NumberPicker.getName());
        accessibilityevent.setScrollable(true);
        accessibilityevent.setScrollY((mMinValue + mValue) * mSelectorElementHeight);
        accessibilityevent.setMaxScrollY((mMaxValue - mMinValue) * mSelectorElementHeight);
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        if (mHasSelectorWheel && isEnabled())
        {
            switch (motionevent.getActionMasked())
            {
            case 0: // '\0'
                removeAllCallbacks();
                mInputText.setVisibility(4);
                float f = motionevent.getY();
                mLastDownEventY = f;
                mLastDownOrMoveEventY = f;
                mLastDownEventTime = motionevent.getEventTime();
                mIngonreMoveEvents = false;
                mShowSoftInputOnTap = false;
                if (mLastDownEventY < (float)mTopSelectionDividerTop)
                {
                    if (mScrollState == 0)
                        mPressedStateHelper.buttonPressDelayed(2);
                } else
                if (mLastDownEventY > (float)mBottomSelectionDividerBottom && mScrollState == 0)
                    mPressedStateHelper.buttonPressDelayed(1);
                getParent().requestDisallowInterceptTouchEvent(true);
                if (!mFlingScroller.isFinished())
                {
                    mFlingScroller.forceFinished(true);
                    mAdjustScroller.forceFinished(true);
                    onScrollStateChange(0);
                    return true;
                }
                if (!mAdjustScroller.isFinished())
                {
                    mFlingScroller.forceFinished(true);
                    mAdjustScroller.forceFinished(true);
                    return true;
                }
                if (mLastDownEventY < (float)mTopSelectionDividerTop)
                {
                    hideSoftInput();
                    postChangeCurrentByOneFromLongPress(false, ViewConfiguration.getLongPressTimeout());
                    return true;
                }
                if (mLastDownEventY > (float)mBottomSelectionDividerBottom)
                {
                    hideSoftInput();
                    postChangeCurrentByOneFromLongPress(true, ViewConfiguration.getLongPressTimeout());
                    return true;
                } else
                {
                    mShowSoftInputOnTap = true;
                    postBeginSoftInputOnLongPressCommand();
                    return true;
                }
            }
            return false;
        } else
        {
            return false;
        }
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        if (!mHasSelectorWheel)
        {
            super.onLayout(flag, i, j, k, l);
        } else
        {
            int i1 = getMeasuredWidth();
            int j1 = getMeasuredHeight();
            int k1 = mInputText.getMeasuredWidth();
            int l1 = mInputText.getMeasuredHeight();
            int i2 = (i1 - k1) / 2;
            int j2 = (j1 - l1) / 2;
            int k2 = i2 + k1;
            int l2 = j2 + l1;
            mInputText.layout(i2, j2, k2, l2);
            if (flag)
            {
                initializeSelectorWheel();
                initializeFadingEdges();
                mTopSelectionDividerTop = (getHeight() - mSelectionDividersDistance) / 2 - mSelectionDividerHeight;
                mBottomSelectionDividerBottom = mTopSelectionDividerTop + 2 * mSelectionDividerHeight + mSelectionDividersDistance;
                return;
            }
        }
    }

    protected void onMeasure(int i, int j)
    {
        if (!mHasSelectorWheel)
        {
            super.onMeasure(i, j);
            return;
        } else
        {
            super.onMeasure(makeMeasureSpec(i, mMaxWidth), makeMeasureSpec(j, mMaxHeight));
            setMeasuredDimension(resolveSizeAndStateRespectingMinSize(mMinWidth, getMeasuredWidth(), i), resolveSizeAndStateRespectingMinSize(mMinHeight, getMeasuredHeight(), j));
            return;
        }
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (isEnabled() && mHasSelectorWheel)
        {
            if (mVelocityTracker == null)
                mVelocityTracker = VelocityTracker.obtain();
            mVelocityTracker.addMovement(motionevent);
            switch (motionevent.getActionMasked())
            {
            default:
                break;

            case 1: // '\001'
                removeBeginSoftInputCommand();
                removeChangeCurrentByOneFromLongPress();
                mPressedStateHelper.cancel();
                VelocityTracker velocitytracker = mVelocityTracker;
                velocitytracker.computeCurrentVelocity(1000, mMaximumFlingVelocity);
                int i = (int)velocitytracker.getYVelocity();
                if (Math.abs(i) > mMinimumFlingVelocity)
                {
                    fling(i);
                    onScrollStateChange(2);
                } else
                {
                    int j = (int)motionevent.getY();
                    int k = (int)Math.abs((float)j - mLastDownEventY);
                    long l = motionevent.getEventTime() - mLastDownEventTime;
                    if (k <= mTouchSlop && l < (long)ViewConfiguration.getTapTimeout())
                    {
                        if (mShowSoftInputOnTap)
                        {
                            mShowSoftInputOnTap = false;
                            showSoftInput();
                        } else
                        {
                            int i1 = -1 + j / mSelectorElementHeight;
                            if (i1 > 0)
                            {
                                changeValueByOne(true);
                                mPressedStateHelper.buttonTapped(1);
                            } else
                            if (i1 < 0)
                            {
                                changeValueByOne(false);
                                mPressedStateHelper.buttonTapped(2);
                            }
                        }
                    } else
                    {
                        ensureScrollWheelAdjusted();
                    }
                    onScrollStateChange(0);
                }
                mVelocityTracker.recycle();
                mVelocityTracker = null;
                break;

            case 2: // '\002'
                if (mIngonreMoveEvents)
                    break;
                float f = motionevent.getY();
                if (mScrollState != 1)
                {
                    if ((int)Math.abs(f - mLastDownEventY) > mTouchSlop)
                    {
                        removeAllCallbacks();
                        onScrollStateChange(1);
                    }
                } else
                {
                    scrollBy(0, (int)(f - mLastDownOrMoveEventY));
                    invalidate();
                }
                mLastDownOrMoveEventY = f;
                break;
            }
            return true;
        } else
        {
            return false;
        }
    }

    public void scrollBy(int i, int j)
    {
        int ai[] = mSelectorIndices;
        if (!mWrapSelectorWheel && j > 0 && ai[1] <= mMinValue)
        {
            mCurrentScrollOffset = mInitialScrollOffset;
        } else
        {
            if (!mWrapSelectorWheel && j < 0 && ai[1] >= mMaxValue)
            {
                mCurrentScrollOffset = mInitialScrollOffset;
                return;
            }
            mCurrentScrollOffset = j + mCurrentScrollOffset;
            do
            {
                if (mCurrentScrollOffset - mInitialScrollOffset <= mSelectorTextGapHeight)
                    break;
                mCurrentScrollOffset = mCurrentScrollOffset - mSelectorElementHeight;
                decrementSelectorIndices(ai);
                setValueInternal(ai[1], true);
                if (!mWrapSelectorWheel && ai[1] <= mMinValue)
                    mCurrentScrollOffset = mInitialScrollOffset;
            } while (true);
            do
            {
                if (mCurrentScrollOffset - mInitialScrollOffset >= -mSelectorTextGapHeight)
                    break;
                mCurrentScrollOffset = mCurrentScrollOffset + mSelectorElementHeight;
                incrementSelectorIndices(ai);
                setValueInternal(ai[1], true);
                if (!mWrapSelectorWheel && ai[1] >= mMaxValue)
                    mCurrentScrollOffset = mInitialScrollOffset;
            } while (true);
        }
    }

    public void setDisplayedValues(String as[])
    {
        if (mDisplayedValues == as)
            return;
        mDisplayedValues = as;
        if (mDisplayedValues != null)
            mInputText.setRawInputType(0x80001);
        else
            mInputText.setRawInputType(2);
        updateInputTextView();
        initializeSelectorWheelIndices();
        tryComputeMaxWidth();
    }

    public void setEnabled(boolean flag)
    {
        super.setEnabled(flag);
        if (!mHasSelectorWheel)
            mIncrementButton.setEnabled(flag);
        if (!mHasSelectorWheel)
            mDecrementButton.setEnabled(flag);
        mInputText.setEnabled(flag);
    }

    public void setFormatter(Formatter formatter)
    {
        if (formatter == mFormatter)
        {
            return;
        } else
        {
            mFormatter = formatter;
            initializeSelectorWheelIndices();
            updateInputTextView();
            return;
        }
    }

    public void setMaxValue(int i)
    {
        if (mMaxValue == i)
            return;
        if (i < 0)
            throw new IllegalArgumentException("maxValue must be >= 0");
        mMaxValue = i;
        if (mMaxValue < mValue)
            mValue = mMaxValue;
        boolean flag;
        if (mMaxValue - mMinValue > mSelectorIndices.length)
            flag = true;
        else
            flag = false;
        setWrapSelectorWheel(flag);
        initializeSelectorWheelIndices();
        updateInputTextView();
        tryComputeMaxWidth();
        invalidate();
    }

    public void setMinValue(int i)
    {
        if (mMinValue == i)
            return;
        if (i < 0)
            throw new IllegalArgumentException("minValue must be >= 0");
        mMinValue = i;
        if (mMinValue > mValue)
            mValue = mMinValue;
        boolean flag;
        if (mMaxValue - mMinValue > mSelectorIndices.length)
            flag = true;
        else
            flag = false;
        setWrapSelectorWheel(flag);
        initializeSelectorWheelIndices();
        updateInputTextView();
        tryComputeMaxWidth();
        invalidate();
    }

    public void setOnLongPressUpdateInterval(long l)
    {
        mLongPressUpdateInterval = l;
    }

    public void setOnScrollListener(OnScrollListener onscrolllistener)
    {
        mOnScrollListener = onscrolllistener;
    }

    public void setOnValueChangedListener(OnValueChangeListener onvaluechangelistener)
    {
        mOnValueChangeListener = onvaluechangelistener;
    }

    public void setValue(int i)
    {
        setValueInternal(i, false);
    }

    public void setWrapSelectorWheel(boolean flag)
    {
        boolean flag1;
        if (mMaxValue - mMinValue >= mSelectorIndices.length)
            flag1 = true;
        else
            flag1 = false;
        if ((!flag || flag1) && flag != mWrapSelectorWheel)
            mWrapSelectorWheel = flag;
    }









/*
    static boolean access$1302(NumberPicker numberpicker, boolean flag)
    {
        numberpicker.mIncrementVirtualButtonPressed = flag;
        return flag;
    }

*/


/*
    static boolean access$1380(NumberPicker numberpicker, int i)
    {
        boolean flag = (byte)(i ^ numberpicker.mIncrementVirtualButtonPressed);
        numberpicker.mIncrementVirtualButtonPressed = flag;
        return flag;
    }

*/






/*
    static boolean access$1702(NumberPicker numberpicker, boolean flag)
    {
        numberpicker.mDecrementVirtualButtonPressed = flag;
        return flag;
    }

*/


/*
    static boolean access$1780(NumberPicker numberpicker, int i)
    {
        boolean flag = (byte)(i ^ numberpicker.mDecrementVirtualButtonPressed);
        numberpicker.mDecrementVirtualButtonPressed = flag;
        return flag;
    }

*/













/*
    static boolean access$2802(NumberPicker numberpicker, boolean flag)
    {
        numberpicker.mIngonreMoveEvents = flag;
        return flag;
    }

*/











































}
