// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.*;
import android.content.pm.PackageManager;
import android.content.res.*;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.inputmethodservice.ExtractEditText;
import android.os.*;
import android.text.*;
import android.text.method.*;
import android.text.style.*;
import android.util.*;
import android.view.*;
import android.view.inputmethod.*;
import com.android.internal.util.ArrayUtils;
import com.android.internal.view.StandaloneActionMode;
import com.android.internal.widget.EditableInputConnection;
import java.lang.reflect.Field;
import java.util.*;

// Referenced classes of package android.widget:
//            TextView, PopupWindow, SpellChecker, LinearLayout, 
//            ListView, AdapterView, BaseAdapter

public class Editor
{
    private class ActionPopupWindow extends PinnedPopupWindow
        implements android.view.View.OnClickListener
    {

        private static final int POPUP_TEXT_LAYOUT = 0x10900d4;
        private TextView mClipBoardTextView;
        private TextView mInputMethodTextView;
        private TextView mPasteTextView;
        private TextView mReplaceTextView;
        private TextView mSelectionTextView;
        final Editor this$0;

        protected int clipVertically(int i)
        {
            if (i < 0)
            {
                int j = getTextOffset();
                Layout layout = mTextView.getLayout();
                int k = layout.getLineForOffset(j);
                i = i + (layout.getLineBottom(k) - layout.getLineTop(k)) + super.mContentView.getMeasuredHeight() + mTextView.getResources().getDrawable(mTextView.mTextSelectHandleRes).getIntrinsicHeight();
            }
            return i;
        }

        protected void createPopupWindow()
        {
            super.mPopupWindow = new PopupWindow(mTextView.getContext(), null, 0x10102c8);
            super.mPopupWindow.setClippingEnabled(true);
        }

        protected int getTextOffset()
        {
            return (mTextView.getSelectionStart() + mTextView.getSelectionEnd()) / 2;
        }

        protected int getVerticalLocalPosition(int i)
        {
            return mTextView.getLayout().getLineTop(i) - super.mContentView.getMeasuredHeight();
        }

        protected void initContentView()
        {
            LinearLayout linearlayout = new LinearLayout(mTextView.getContext());
            linearlayout.setOrientation(0);
            super.mContentView = linearlayout;
            super.mContentView.setBackgroundResource(0x10805c7);
            LayoutInflater layoutinflater = (LayoutInflater)mTextView.getContext().getSystemService("layout_inflater");
            android.view.ViewGroup.LayoutParams layoutparams = new android.view.ViewGroup.LayoutParams(-2, -2);
            mPasteTextView = (TextView)layoutinflater.inflate(0x10900d4, null);
            TypedValue typedvalue = new TypedValue();
            mTextView.getContext().getTheme().resolveAttribute(0x101030e, typedvalue, true);
            int _tmp = typedvalue.resourceId;
            DisplayMetrics displaymetrics = mTextView.getContext().getResources().getDisplayMetrics();
            int _tmp1 = (int)TypedValue.applyDimension(1, 12F, displaymetrics);
            int _tmp2 = (int)TypedValue.applyDimension(1, 8F, displaymetrics);
            int _tmp3 = (int)TypedValue.applyDimension(1, 12F, displaymetrics);
            int _tmp4 = (int)TypedValue.applyDimension(1, 8F, displaymetrics);
            mPasteTextView.setLayoutParams(layoutparams);
            super.mContentView.addView(mPasteTextView);
            mPasteTextView.setText(0x104000b);
            mPasteTextView.setOnClickListener(this);
            mReplaceTextView = (TextView)layoutinflater.inflate(0x10900d4, null);
            mReplaceTextView.setLayoutParams(layoutparams);
            super.mContentView.addView(mReplaceTextView);
            mReplaceTextView.setText(0x10403c1);
            mReplaceTextView.setOnClickListener(this);
        }

        public void onClick(View view)
        {
            if (view == mPasteTextView && mTextView.canPaste())
            {
                mTextView.onTextContextMenuItem(0x1020022);
                hide();
            } else
            if (view == mReplaceTextView)
            {
                int i = (mTextView.getSelectionStart() + mTextView.getSelectionEnd()) / 2;
                stopSelectionActionMode();
                Selection.setSelection((Spannable)mTextView.getText(), i);
                showSuggestions();
                return;
            }
        }

        public void show()
        {
            boolean flag = mTextView.canPaste();
            boolean flag1;
            if (mTextView.isSuggestionsEnabled() && isCursorInsideSuggestionSpan())
                flag1 = true;
            else
                flag1 = false;
            boolean flag2;
            if (mTextView.textCanBeSelected() && !mTextView.hasSelection() && !mTextView.mNotStartSelectionMode)
                flag2 = true;
            else
                flag2 = false;
            if (flag2)
                if (mTextView.mShowInputMethodActionPopup);
            if (mTextView.canPaste() || mTextView.hasTextInClipboardList())
                if (mTextView.mUseYlSelectionMode);
            TextView textview = mPasteTextView;
            byte byte0;
            if (flag)
                byte0 = 0;
            else
                byte0 = 8;
            textview.setVisibility(byte0);
            TextView textview1 = mReplaceTextView;
            byte byte1 = 0;
            if (!flag1)
                byte1 = 8;
            textview1.setVisibility(byte1);
            if (!flag && !flag1)
            {
                return;
            } else
            {
                super.show();
                return;
            }
        }

        private ActionPopupWindow()
        {
            this$0 = Editor.this;
            super();
        }

    }

    private class Blink extends Handler
        implements Runnable
    {

        private boolean mCancelled;
        final Editor this$0;

        void cancel()
        {
            if (!mCancelled)
            {
                removeCallbacks(this);
                mCancelled = true;
            }
        }

        public void run()
        {
            if (!mCancelled)
            {
                removeCallbacks(this);
                if (shouldBlink())
                {
                    if (mTextView.getLayout() != null)
                        mTextView.invalidateCursorPath();
                    postAtTime(this, 500L + SystemClock.uptimeMillis());
                    return;
                }
            }
        }

        void uncancel()
        {
            mCancelled = false;
        }

        private Blink()
        {
            this$0 = Editor.this;
            super();
        }

    }

    private class CorrectionHighlighter
    {

        private static final int FADE_OUT_DURATION = 400;
        private int mEnd;
        private long mFadingStartTime;
        private final Paint mPaint = new Paint(1);
        private final Path mPath = new Path();
        private int mStart;
        private RectF mTempRectF;
        final Editor this$0;

        private void invalidate(boolean flag)
        {
            if (mTextView.getLayout() == null)
                return;
            if (mTempRectF == null)
                mTempRectF = new RectF();
            mPath.computeBounds(mTempRectF, false);
            int i = mTextView.getCompoundPaddingLeft();
            int j = mTextView.getExtendedPaddingTop() + mTextView.getVerticalOffset(true);
            if (flag)
            {
                mTextView.postInvalidateOnAnimation(i + (int)mTempRectF.left, j + (int)mTempRectF.top, i + (int)mTempRectF.right, j + (int)mTempRectF.bottom);
                return;
            } else
            {
                mTextView.postInvalidate((int)mTempRectF.left, (int)mTempRectF.top, (int)mTempRectF.right, (int)mTempRectF.bottom);
                return;
            }
        }

        private void stopAnimation()
        {
            mCorrectionHighlighter = null;
        }

        private boolean updatePaint()
        {
            long l = SystemClock.uptimeMillis() - mFadingStartTime;
            if (l > 400L)
            {
                return false;
            } else
            {
                float f = 1.0F - (float)l / 400F;
                int i = Color.alpha(mTextView.mHighlightColor);
                int j = (0xffffff & mTextView.mHighlightColor) + ((int)(f * (float)i) << 24);
                mPaint.setColor(j);
                return true;
            }
        }

        private boolean updatePath()
        {
            Layout layout = mTextView.getLayout();
            if (layout == null)
            {
                return false;
            } else
            {
                int i = mTextView.getText().length();
                int j = Math.min(i, mStart);
                int k = Math.min(i, mEnd);
                mPath.reset();
                layout.getSelectionPath(j, k, mPath);
                return true;
            }
        }

        public void draw(Canvas canvas, int i)
        {
            if (updatePath() && updatePaint())
            {
                if (i != 0)
                    canvas.translate(0.0F, i);
                canvas.drawPath(mPath, mPaint);
                if (i != 0)
                    canvas.translate(0.0F, -i);
                invalidate(true);
                return;
            } else
            {
                stopAnimation();
                invalidate(false);
                return;
            }
        }

        public void highlight(CorrectionInfo correctioninfo)
        {
            mStart = correctioninfo.getOffset();
            mEnd = mStart + correctioninfo.getNewText().length();
            mFadingStartTime = SystemClock.uptimeMillis();
            if (mStart < 0 || mEnd < 0)
                stopAnimation();
        }


        public CorrectionHighlighter()
        {
            this$0 = Editor.this;
            super();
            mPaint.setCompatibilityScaling(mTextView.getResources().getCompatibilityInfo().applicationScale);
            mPaint.setStyle(android.graphics.Paint.Style.FILL);
        }
    }

    private static interface CursorController
        extends android.view.ViewTreeObserver.OnTouchModeChangeListener
    {

        public abstract void hide();

        public abstract boolean isShowing();

        public abstract void onDetached();

        public abstract void show();
    }

    private static class DragLocalState
    {

        public int end;
        public TextView sourceTextView;
        public int start;

        public DragLocalState(TextView textview, int i, int j)
        {
            sourceTextView = textview;
            start = i;
            end = j;
        }
    }

    private class EasyEditPopupWindow extends PinnedPopupWindow
        implements android.view.View.OnClickListener
    {

        private static final int POPUP_TEXT_LAYOUT = 0x10900d4;
        private TextView mDeleteTextView;
        private EasyEditSpan mEasyEditSpan;
        final Editor this$0;

        protected int clipVertically(int i)
        {
            return i;
        }

        protected void createPopupWindow()
        {
            super.mPopupWindow = new PopupWindow(mTextView.getContext(), null, 0x10102c8);
            super.mPopupWindow.setInputMethodMode(2);
            super.mPopupWindow.setClippingEnabled(true);
        }

        protected int getTextOffset()
        {
            return ((Editable)mTextView.getText()).getSpanEnd(mEasyEditSpan);
        }

        protected int getVerticalLocalPosition(int i)
        {
            return mTextView.getLayout().getLineBottom(i);
        }

        protected void initContentView()
        {
            LinearLayout linearlayout = new LinearLayout(mTextView.getContext());
            linearlayout.setOrientation(0);
            super.mContentView = linearlayout;
            super.mContentView.setBackgroundResource(0x10805c8);
            LayoutInflater layoutinflater = (LayoutInflater)mTextView.getContext().getSystemService("layout_inflater");
            android.view.ViewGroup.LayoutParams layoutparams = new android.view.ViewGroup.LayoutParams(-2, -2);
            mDeleteTextView = (TextView)layoutinflater.inflate(0x10900d4, null);
            mDeleteTextView.setLayoutParams(layoutparams);
            mDeleteTextView.setText(0x10403c2);
            mDeleteTextView.setOnClickListener(this);
            super.mContentView.addView(mDeleteTextView);
        }

        public void onClick(View view)
        {
            if (view == mDeleteTextView)
            {
                Editable editable = (Editable)mTextView.getText();
                int i = editable.getSpanStart(mEasyEditSpan);
                int j = editable.getSpanEnd(mEasyEditSpan);
                if (i >= 0 && j >= 0)
                    mTextView.deleteText_internal(i, j);
            }
        }

        public void setEasyEditSpan(EasyEditSpan easyeditspan)
        {
            mEasyEditSpan = easyeditspan;
        }


        private EasyEditPopupWindow()
        {
            this$0 = Editor.this;
            super();
        }

    }

    class EasyEditSpanController
        implements SpanWatcher
    {

        private static final int DISPLAY_TIMEOUT_MS = 3000;
        private Runnable mHidePopup;
        private EasyEditPopupWindow mPopupWindow;
        final Editor this$0;

        public void hide()
        {
            if (mPopupWindow != null)
            {
                mPopupWindow.hide();
                mTextView.removeCallbacks(mHidePopup);
            }
        }

        public void onSpanAdded(Spannable spannable, Object obj, int i, int j)
        {
            if (obj instanceof EasyEditSpan)
            {
                if (mPopupWindow == null)
                {
                    mPopupWindow = new EasyEditPopupWindow();
                    mHidePopup = new Runnable() {

                        final EasyEditSpanController this$1;

                        public void run()
                        {
                            hide();
                        }

            
            {
                this$1 = EasyEditSpanController.this;
                super();
            }
                    }
;
                }
                if (mPopupWindow.mEasyEditSpan != null)
                    spannable.removeSpan(mPopupWindow.mEasyEditSpan);
                mPopupWindow.setEasyEditSpan((EasyEditSpan)obj);
                if (mTextView.getWindowVisibility() == 0 && mTextView.getLayout() != null && !extractedTextModeWillBeStarted())
                {
                    mPopupWindow.show();
                    mTextView.removeCallbacks(mHidePopup);
                    mTextView.postDelayed(mHidePopup, 3000L);
                    return;
                }
            }
        }

        public void onSpanChanged(Spannable spannable, Object obj, int i, int j, int k, int l)
        {
            if (mPopupWindow != null && obj == mPopupWindow.mEasyEditSpan)
                spannable.removeSpan(mPopupWindow.mEasyEditSpan);
        }

        public void onSpanRemoved(Spannable spannable, Object obj, int i, int j)
        {
            if (mPopupWindow != null && obj == mPopupWindow.mEasyEditSpan)
                hide();
        }

        EasyEditSpanController()
        {
            this$0 = Editor.this;
            super();
        }
    }

    private static class ErrorPopup extends PopupWindow
    {

        private boolean mAbove;
        private int mPopupInlineErrorAboveBackgroundId;
        private int mPopupInlineErrorBackgroundId;
        private final TextView mView;

        private int getResourceId(int i, int j)
        {
            if (i == 0)
            {
                TypedArray typedarray = mView.getContext().obtainStyledAttributes(android.R.styleable.Theme);
                i = typedarray.getResourceId(j, 0);
                typedarray.recycle();
            }
            return i;
        }

        void fixDirection(boolean flag)
        {
            mAbove = flag;
            if (flag)
                mPopupInlineErrorAboveBackgroundId = getResourceId(mPopupInlineErrorAboveBackgroundId, 223);
            else
                mPopupInlineErrorBackgroundId = getResourceId(mPopupInlineErrorBackgroundId, 222);
            TextView textview = mView;
            int i;
            if (flag)
                i = mPopupInlineErrorAboveBackgroundId;
            else
                i = mPopupInlineErrorBackgroundId;
            textview.setBackgroundResource(i);
        }

        public void update(int i, int j, int k, int l, boolean flag)
        {
            super.update(i, j, k, l, flag);
            boolean flag1 = isAboveAnchor();
            if (flag1 != mAbove)
                fixDirection(flag1);
        }

        ErrorPopup(TextView textview, int i, int j)
        {
            super(textview, i, j);
            mAbove = false;
            mPopupInlineErrorBackgroundId = 0;
            mPopupInlineErrorAboveBackgroundId = 0;
            mView = textview;
            mPopupInlineErrorBackgroundId = getResourceId(mPopupInlineErrorBackgroundId, 222);
            mView.setBackgroundResource(mPopupInlineErrorBackgroundId);
        }
    }

    private abstract class HandleView extends View
        implements TextViewPositionListener
    {

        private static final int HISTORY_SIZE = 5;
        private static final int TOUCH_UP_FILTER_DELAY_AFTER = 150;
        private static final int TOUCH_UP_FILTER_DELAY_BEFORE = 350;
        private Runnable mActionPopupShower;
        protected ActionPopupWindow mActionPopupWindow;
        private final PopupWindow mContainer;
        protected Drawable mDrawable;
        protected Drawable mDrawableLtr;
        protected Drawable mDrawableRtl;
        protected int mHotspotX;
        private float mIdealVerticalOffset;
        private boolean mIsDragging;
        private int mLastParentX;
        private int mLastParentY;
        private int mNumberPreviousOffsets;
        private boolean mPositionHasChanged;
        private int mPositionX;
        private int mPositionY;
        private int mPreviousOffset;
        private int mPreviousOffsetIndex;
        private final int mPreviousOffsets[] = new int[5];
        private final long mPreviousOffsetsTimes[] = new long[5];
        private float mTouchOffsetY;
        private float mTouchToWindowOffsetX;
        private float mTouchToWindowOffsetY;
        final Editor this$0;

        private void addPositionToTouchUpFilter(int i)
        {
            mPreviousOffsetIndex = (1 + mPreviousOffsetIndex) % 5;
            mPreviousOffsets[mPreviousOffsetIndex] = i;
            mPreviousOffsetsTimes[mPreviousOffsetIndex] = SystemClock.uptimeMillis();
            mNumberPreviousOffsets = 1 + mNumberPreviousOffsets;
        }

        private void filterOnTouchUp()
        {
            long l = SystemClock.uptimeMillis();
            int i = 0;
            int j = mPreviousOffsetIndex;
            int k;
            for (k = Math.min(mNumberPreviousOffsets, 5); i < k && l - mPreviousOffsetsTimes[j] < 150L; j = (5 + (mPreviousOffsetIndex - i)) % 5)
                i++;

            if (i > 0 && i < k && l - mPreviousOffsetsTimes[j] > 350L)
                positionAtCursorOffset(mPreviousOffsets[j], false);
        }

        private boolean isVisible()
        {
            if (mIsDragging)
                return true;
            if (mTextView.isInBatchEditMode())
                return false;
            else
                return isPositionVisible(mPositionX + mHotspotX, mPositionY);
        }

        private void startTouchUpFilter(int i)
        {
            mNumberPreviousOffsets = 0;
            addPositionToTouchUpFilter(i);
        }

        protected void dismiss()
        {
            mIsDragging = false;
            mContainer.dismiss();
            onDetached();
        }

        public abstract int getCurrentCursorOffset();

        protected abstract int getHotspotX(Drawable drawable, boolean flag);

        public void hide()
        {
            dismiss();
            getPositionListener().removeSubscriber(this);
        }

        protected void hideActionPopupWindow()
        {
            if (mActionPopupShower != null)
                mTextView.removeCallbacks(mActionPopupShower);
            if (mActionPopupWindow != null)
                mActionPopupWindow.hide();
        }

        public boolean isDragging()
        {
            return mIsDragging;
        }

        public boolean isShowing()
        {
            return mContainer.isShowing();
        }

        public boolean offsetHasBeenChanged()
        {
            return mNumberPreviousOffsets > 1;
        }

        public void onDetached()
        {
            hideActionPopupWindow();
        }

        protected void onDraw(Canvas canvas)
        {
            mDrawable.setBounds(0, 0, super.mRight - super.mLeft, super.mBottom - super.mTop);
            mDrawable.draw(canvas);
        }

        void onHandleMoved()
        {
            hideActionPopupWindow();
        }

        protected void onMeasure(int i, int j)
        {
            setMeasuredDimension(mDrawable.getIntrinsicWidth(), mDrawable.getIntrinsicHeight());
        }

        public boolean onTouchEvent(MotionEvent motionevent)
        {
            switch (motionevent.getActionMasked())
            {
            case 3: // '\003'
                mIsDragging = false;
                return true;

            case 1: // '\001'
                filterOnTouchUp();
                mIsDragging = false;
                return true;

            case 2: // '\002'
                float f = motionevent.getRawX();
                float f1 = motionevent.getRawY();
                float f2 = mTouchToWindowOffsetY - (float)mLastParentY;
                float f3 = f1 - (float)mPositionY - (float)mLastParentY;
                float f4;
                if (f2 < mIdealVerticalOffset)
                    f4 = Math.max(Math.min(f3, mIdealVerticalOffset), f2);
                else
                    f4 = Math.min(Math.max(f3, mIdealVerticalOffset), f2);
                mTouchToWindowOffsetY = f4 + (float)mLastParentY;
                updatePosition((f - mTouchToWindowOffsetX) + (float)mHotspotX, (f1 - mTouchToWindowOffsetY) + mTouchOffsetY);
                return true;

            case 0: // '\0'
                startTouchUpFilter(getCurrentCursorOffset());
                mTouchToWindowOffsetX = motionevent.getRawX() - (float)mPositionX;
                mTouchToWindowOffsetY = motionevent.getRawY() - (float)mPositionY;
                PositionListener positionlistener = getPositionListener();
                mLastParentX = positionlistener.getPositionX();
                mLastParentY = positionlistener.getPositionY();
                mIsDragging = true;
                return true;
            }
            return true;
        }

        protected void positionAtCursorOffset(int i, boolean flag)
        {
            Layout layout = mTextView.getLayout();
            if (layout == null)
            {
                prepareCursorControllers();
            } else
            {
                boolean flag1;
                if (i != mPreviousOffset)
                    flag1 = true;
                else
                    flag1 = false;
                if (flag1 || flag)
                {
                    if (flag1)
                    {
                        updateSelection(i);
                        addPositionToTouchUpFilter(i);
                    }
                    int j = layout.getLineForOffset(i);
                    mPositionX = (int)(layout.getPrimaryHorizontal(i) - 0.5F - (float)mHotspotX);
                    mPositionY = layout.getLineBottom(j);
                    mPositionX = mPositionX + mTextView.viewportToContentHorizontalOffset();
                    mPositionY = mPositionY + mTextView.viewportToContentVerticalOffset();
                    mPreviousOffset = i;
                    mPositionHasChanged = true;
                    return;
                }
            }
        }

        public void show()
        {
            if (isShowing())
            {
                return;
            } else
            {
                getPositionListener().addSubscriber(this, true);
                mPreviousOffset = -1;
                positionAtCursorOffset(getCurrentCursorOffset(), false);
                hideActionPopupWindow();
                return;
            }
        }

        void showActionPopupWindow(int i)
        {
            if (mActionPopupWindow == null)
                mActionPopupWindow = new ActionPopupWindow();
            if (mActionPopupShower == null)
                mActionPopupShower = new Runnable() {

                    final HandleView this$1;

                    public void run()
                    {
                        mActionPopupWindow.show();
                    }

            
            {
                this$1 = HandleView.this;
                super();
            }
                }
;
            else
                mTextView.removeCallbacks(mActionPopupShower);
            mTextView.postDelayed(mActionPopupShower, i);
        }

        protected void updateDrawable()
        {
            int i = getCurrentCursorOffset();
            boolean flag = mTextView.getLayout().isRtlCharAt(i);
            Drawable drawable;
            if (flag)
                drawable = mDrawableRtl;
            else
                drawable = mDrawableLtr;
            mDrawable = drawable;
            mHotspotX = getHotspotX(mDrawable, flag);
        }

        public abstract void updatePosition(float f, float f1);

        public void updatePosition(int i, int j, boolean flag, boolean flag1)
        {
            positionAtCursorOffset(getCurrentCursorOffset(), flag1);
            if (flag || mPositionHasChanged)
            {
                if (mIsDragging)
                {
                    if (i != mLastParentX || j != mLastParentY)
                    {
                        mTouchToWindowOffsetX = mTouchToWindowOffsetX + (float)(i - mLastParentX);
                        mTouchToWindowOffsetY = mTouchToWindowOffsetY + (float)(j - mLastParentY);
                        mLastParentX = i;
                        mLastParentY = j;
                    }
                    onHandleMoved();
                }
                if (isVisible())
                {
                    int k = i + mPositionX;
                    int l = j + mPositionY;
                    if (isShowing())
                        mContainer.update(k, l, -1, -1);
                    else
                        mContainer.showAtLocation(mTextView, 0, k, l);
                } else
                if (isShowing())
                    dismiss();
                mPositionHasChanged = false;
            }
        }

        protected abstract void updateSelection(int i);

        public HandleView(Drawable drawable, Drawable drawable1)
        {
            this$0 = Editor.this;
            super(mTextView.getContext());
            mPreviousOffset = -1;
            mPositionHasChanged = true;
            mPreviousOffsetIndex = 0;
            mNumberPreviousOffsets = 0;
            mContainer = new PopupWindow(mTextView.getContext(), null, 0x10102c8);
            mContainer.setSplitTouchEnabled(true);
            mContainer.setClippingEnabled(false);
            mContainer.setWindowLayoutType(1002);
            mContainer.setContentView(this);
            mDrawableLtr = drawable;
            mDrawableRtl = drawable1;
            updateDrawable();
            int i = mDrawable.getIntrinsicHeight();
            mTouchOffsetY = -0.3F * (float)i;
            mIdealVerticalOffset = 0.7F * (float)i;
        }
    }

    static class InputContentType
    {

        boolean enterDown;
        Bundle extras;
        int imeActionId;
        CharSequence imeActionLabel;
        int imeOptions;
        TextView.OnEditorActionListener onEditorActionListener;
        String privateImeOptions;

        InputContentType()
        {
            imeOptions = 0;
        }
    }

    static class InputMethodState
    {

        int mBatchEditNesting;
        int mChangedDelta;
        int mChangedEnd;
        int mChangedStart;
        boolean mContentChanged;
        boolean mCursorChanged;
        Rect mCursorRectInWindow;
        final ExtractedText mExtractedText = new ExtractedText();
        ExtractedTextRequest mExtractedTextRequest;
        boolean mSelectionModeChanged;
        float mTmpOffset[];
        RectF mTmpRectF;

        InputMethodState()
        {
            mCursorRectInWindow = new Rect();
            mTmpRectF = new RectF();
            mTmpOffset = new float[2];
        }
    }

    private class InsertionHandleView extends HandleView
    {

        private static final int DELAY_BEFORE_HANDLE_FADES_OUT = 4000;
        private static final int RECENT_CUT_COPY_DURATION = 15000;
        private float mDownPositionX;
        private float mDownPositionY;
        private Runnable mHider;
        final Editor this$0;

        private void hideAfterDelay()
        {
            if (mHider == null)
                mHider = new Runnable() {

                    final InsertionHandleView this$1;

                    public void run()
                    {
                        hide();
                    }

            
            {
                this$1 = InsertionHandleView.this;
                super();
            }
                }
;
            else
                removeHiderCallback();
            mTextView.postDelayed(mHider, 4000L);
        }

        private void removeHiderCallback()
        {
            if (mHider != null)
                mTextView.removeCallbacks(mHider);
        }

        public int getCurrentCursorOffset()
        {
            return mTextView.getSelectionStart();
        }

        protected int getHotspotX(Drawable drawable, boolean flag)
        {
            return drawable.getIntrinsicWidth() / 2;
        }

        public void onDetached()
        {
            super.onDetached();
            removeHiderCallback();
        }

        void onHandleMoved()
        {
            super.onHandleMoved();
            removeHiderCallback();
        }

        public boolean onTouchEvent(MotionEvent motionevent)
        {
            boolean flag = super.onTouchEvent(motionevent);
            switch (motionevent.getActionMasked())
            {
            case 3: // '\003'
                hideAfterDelay();
                return flag;

            case 1: // '\001'
                if (!offsetHasBeenChanged())
                {
                    float f = mDownPositionX - motionevent.getRawX();
                    float f1 = mDownPositionY - motionevent.getRawY();
                    float f2 = f * f + f1 * f1;
                    int i = ViewConfiguration.get(mTextView.getContext()).getScaledTouchSlop();
                    if (f2 < (float)(i * i))
                        if (super.mActionPopupWindow != null && super.mActionPopupWindow.isShowing())
                            super.mActionPopupWindow.hide();
                        else
                            showWithActionPopup();
                }
                hideAfterDelay();
                return flag;

            case 0: // '\0'
                mDownPositionX = motionevent.getRawX();
                mDownPositionY = motionevent.getRawY();
                return flag;

            case 2: // '\002'
            default:
                return flag;
            }
        }

        public void show()
        {
            super.show();
            if (SystemClock.uptimeMillis() - TextView.LAST_CUT_OR_COPY_TIME < 15000L)
                showActionPopupWindow(0);
            hideAfterDelay();
        }

        public void showWithActionPopup()
        {
            show();
            showActionPopupWindow(0);
        }

        public void updatePosition(float f, float f1)
        {
            positionAtCursorOffset(mTextView.getOffsetForPosition(f, f1), false);
        }

        public void updateSelection(int i)
        {
            Selection.setSelection((Spannable)mTextView.getText(), i);
        }

        public InsertionHandleView(Drawable drawable)
        {
            this$0 = Editor.this;
            super(drawable, drawable);
        }
    }

    private class InsertionPointCursorController
        implements CursorController
    {

        private InsertionHandleView mHandle;
        final Editor this$0;

        private InsertionHandleView getHandle()
        {
            if (mSelectHandleCenter == null)
                mSelectHandleCenter = mTextView.getResources().getDrawable(mTextView.mTextSelectHandleRes);
            if (mHandle == null)
                mHandle = new InsertionHandleView(mSelectHandleCenter);
            return mHandle;
        }

        public void hide()
        {
            if (mHandle != null)
                mHandle.hide();
        }

        public boolean isShowing()
        {
            if (mHandle != null)
                return mHandle.isShowing();
            else
                return false;
        }

        public void onDetached()
        {
            mTextView.getViewTreeObserver().removeOnTouchModeChangeListener(this);
            if (mHandle != null)
                mHandle.onDetached();
        }

        public void onTouchModeChanged(boolean flag)
        {
            if (!flag)
                hide();
        }

        public void show()
        {
            getHandle().show();
        }

        public void showWithActionPopup()
        {
            getHandle().showWithActionPopup();
        }

        private InsertionPointCursorController()
        {
            this$0 = Editor.this;
            super();
        }

    }

    private abstract class PinnedPopupWindow
        implements TextViewPositionListener
    {

        protected ViewGroup mContentView;
        protected PopupWindow mPopupWindow;
        int mPositionX;
        int mPositionY;
        final Editor this$0;

        private void computeLocalPosition()
        {
            measureContent();
            int i = mContentView.getMeasuredWidth();
            int j = getTextOffset();
            mPositionX = (int)(mTextView.getLayout().getPrimaryHorizontal(j) - (float)i / 2.0F);
            mPositionX = mPositionX + mTextView.viewportToContentHorizontalOffset();
            mPositionY = getVerticalLocalPosition(mTextView.getLayout().getLineForOffset(j));
            mPositionY = mPositionY + mTextView.viewportToContentVerticalOffset();
        }

        private void updatePosition(int i, int j)
        {
            int k = i + mPositionX;
            int l = clipVertically(j + mPositionY);
            DisplayMetrics displaymetrics = mTextView.getResources().getDisplayMetrics();
            int i1 = mContentView.getMeasuredWidth();
            int j1 = Math.max(0, Math.min(displaymetrics.widthPixels - i1, k));
            if (isShowing())
            {
                mPopupWindow.update(j1, l, -1, -1);
                return;
            } else
            {
                mPopupWindow.showAtLocation(mTextView, 0, j1, l);
                return;
            }
        }

        protected abstract int clipVertically(int i);

        protected abstract void createPopupWindow();

        protected abstract int getTextOffset();

        protected abstract int getVerticalLocalPosition(int i);

        public void hide()
        {
            mPopupWindow.dismiss();
            getPositionListener().removeSubscriber(this);
        }

        protected abstract void initContentView();

        public boolean isShowing()
        {
            return mPopupWindow.isShowing();
        }

        protected void measureContent()
        {
            DisplayMetrics displaymetrics = mTextView.getResources().getDisplayMetrics();
            mContentView.measure(android.view.View.MeasureSpec.makeMeasureSpec(displaymetrics.widthPixels, 0x80000000), android.view.View.MeasureSpec.makeMeasureSpec(displaymetrics.heightPixels, 0x80000000));
        }

        public void show()
        {
            getPositionListener().addSubscriber(this, false);
            computeLocalPosition();
            PositionListener positionlistener = getPositionListener();
            updatePosition(positionlistener.getPositionX(), positionlistener.getPositionY());
        }

        public void updatePosition(int i, int j, boolean flag, boolean flag1)
        {
            if (isShowing() && isOffsetVisible(getTextOffset()))
            {
                if (flag1)
                    computeLocalPosition();
                updatePosition(i, j);
                return;
            } else
            {
                hide();
                return;
            }
        }

        public PinnedPopupWindow()
        {
            this$0 = Editor.this;
            super();
            createPopupWindow();
            mPopupWindow.setWindowLayoutType(1002);
            mPopupWindow.setWidth(-2);
            mPopupWindow.setHeight(-2);
            initContentView();
            android.view.ViewGroup.LayoutParams layoutparams = new android.view.ViewGroup.LayoutParams(-2, -2);
            mContentView.setLayoutParams(layoutparams);
            mPopupWindow.setContentView(mContentView);
        }
    }

    private class PositionListener
        implements android.view.ViewTreeObserver.OnPreDrawListener
    {

        private final int MAXIMUM_NUMBER_OF_LISTENERS;
        private boolean mCanMove[];
        private int mNumberOfListeners;
        private boolean mPositionHasChanged;
        private TextViewPositionListener mPositionListeners[];
        private int mPositionX;
        private int mPositionY;
        private boolean mScrollHasChanged;
        final int mTempCoords[];
        final Editor this$0;

        private void updatePosition()
        {
            mTextView.getLocationInWindow(mTempCoords);
            boolean flag;
            if (mTempCoords[0] == mPositionX && mTempCoords[1] == mPositionY)
                flag = false;
            else
                flag = true;
            mPositionHasChanged = flag;
            mPositionX = mTempCoords[0];
            mPositionY = mTempCoords[1];
        }

        public void addSubscriber(TextViewPositionListener textviewpositionlistener, boolean flag)
        {
            if (mNumberOfListeners == 0)
            {
                updatePosition();
                mTextView.getViewTreeObserver().addOnPreDrawListener(this);
            }
            int i = -1;
            for (int j = 0; j < 6; j++)
            {
                TextViewPositionListener textviewpositionlistener1 = mPositionListeners[j];
                if (textviewpositionlistener1 == textviewpositionlistener)
                    return;
                if (i < 0 && textviewpositionlistener1 == null)
                    i = j;
            }

            mPositionListeners[i] = textviewpositionlistener;
            mCanMove[i] = flag;
            mNumberOfListeners = 1 + mNumberOfListeners;
        }

        public int getPositionX()
        {
            return mPositionX;
        }

        public int getPositionY()
        {
            return mPositionY;
        }

        public boolean onPreDraw()
        {
            updatePosition();
            for (int i = 0; i < 6; i++)
            {
                if (!mPositionHasChanged && !mScrollHasChanged && !mCanMove[i])
                    continue;
                TextViewPositionListener textviewpositionlistener = mPositionListeners[i];
                if (textviewpositionlistener != null)
                    textviewpositionlistener.updatePosition(mPositionX, mPositionY, mPositionHasChanged, mScrollHasChanged);
            }

            mScrollHasChanged = false;
            return true;
        }

        public void onScrollChanged()
        {
            mScrollHasChanged = true;
        }

        public void removeSubscriber(TextViewPositionListener textviewpositionlistener)
        {
            int i = 0;
            do
            {
label0:
                {
                    if (i < 6)
                    {
                        if (mPositionListeners[i] != textviewpositionlistener)
                            break label0;
                        mPositionListeners[i] = null;
                        mNumberOfListeners = -1 + mNumberOfListeners;
                    }
                    if (mNumberOfListeners == 0)
                        mTextView.getViewTreeObserver().removeOnPreDrawListener(this);
                    return;
                }
                i++;
            } while (true);
        }

        private PositionListener()
        {
            this$0 = Editor.this;
            super();
            MAXIMUM_NUMBER_OF_LISTENERS = 6;
            mPositionListeners = new TextViewPositionListener[6];
            mCanMove = new boolean[6];
            mPositionHasChanged = true;
            mTempCoords = new int[2];
        }

    }

    private class SelectionActionModeCallback
        implements android.view.ActionMode.Callback
    {

        final Editor this$0;

        public boolean onActionItemClicked(ActionMode actionmode, MenuItem menuitem)
        {
            if (mCustomSelectionActionModeCallback != null && mCustomSelectionActionModeCallback.onActionItemClicked(actionmode, menuitem))
                return true;
            else
                return mTextView.onTextContextMenuItem(menuitem.getItemId());
        }

        public boolean onCreateActionMode(ActionMode actionmode, Menu menu)
        {
            TypedArray typedarray = mTextView.getContext().obtainStyledAttributes(com.android.internal.R.styleable.SelectionModeDrawables);
            boolean flag = mTextView.getContext().getResources().getBoolean(0x111003e);
            actionmode.setTitle(mTextView.getContext().getString(0x10403c3));
            actionmode.setSubtitle(null);
            actionmode.setTitleOptionalHint(true);
            int i = 0;
            if (!flag)
                i = typedarray.getResourceId(3, 0);
            menu.add(0, 0x102001f, 0, 0x104000d).setIcon(i).setAlphabeticShortcut('a').setShowAsAction(6);
            if (mTextView.canCut())
                menu.add(0, 0x1020020, 0, 0x1040003).setIcon(typedarray.getResourceId(0, 0)).setAlphabeticShortcut('x').setShowAsAction(6);
            if (mTextView.canCopy())
                menu.add(0, 0x1020021, 0, 0x1040001).setIcon(typedarray.getResourceId(1, 0)).setAlphabeticShortcut('c').setShowAsAction(6);
            if (mTextView.canPaste())
                menu.add(0, 0x1020022, 0, 0x104000b).setIcon(typedarray.getResourceId(2, 0)).setAlphabeticShortcut('v').setShowAsAction(6);
            typedarray.recycle();
            if ((mCustomSelectionActionModeCallback == null || mCustomSelectionActionModeCallback.onCreateActionMode(actionmode, menu)) && (menu.hasVisibleItems() || actionmode.getCustomView() != null))
            {
                getSelectionController().show();
                mTextView.setHasTransientState(true);
                return true;
            } else
            {
                return false;
            }
        }

        public void onDestroyActionMode(ActionMode actionmode)
        {
            if (mCustomSelectionActionModeCallback != null)
                mCustomSelectionActionModeCallback.onDestroyActionMode(actionmode);
            if (!mPreserveDetachedSelection)
            {
                Selection.setSelection((Spannable)mTextView.getText(), mTextView.getSelectionEnd());
                mTextView.setHasTransientState(false);
            }
            if (mSelectionModifierCursorController != null)
                mSelectionModifierCursorController.hide();
            mSelectionActionMode = null;
        }

        public boolean onPrepareActionMode(ActionMode actionmode, Menu menu)
        {
            if (mCustomSelectionActionModeCallback != null)
                return mCustomSelectionActionModeCallback.onPrepareActionMode(actionmode, menu);
            else
                return true;
        }

        private SelectionActionModeCallback()
        {
            this$0 = Editor.this;
            super();
        }

    }

    private class SelectionEndHandleView extends HandleView
    {

        private boolean dragDownOrientation;
        final Editor this$0;

        public int getCurrentCursorOffset()
        {
            return mTextView.getSelectionEnd();
        }

        protected int getHotspotX(Drawable drawable, boolean flag)
        {
            if (flag)
                return (3 * drawable.getIntrinsicWidth()) / 4;
            else
                return drawable.getIntrinsicWidth() / 4;
        }

        boolean isDragOrientationDown()
        {
            return dragDownOrientation;
        }

        public void setActionPopupWindow(ActionPopupWindow actionpopupwindow)
        {
            super.mActionPopupWindow = actionpopupwindow;
        }

        public void updatePosition(float f, float f1)
        {
            mTextView.getSelectionEnd();
            int i = mTextView.getOffsetForPosition(f, f1);
            int j = mTextView.getText().length();
            int k = mTextView.getSelectionStart();
            if (i <= k)
                if (TextUtils.hasReplacement(mTextView.getText().subSequence(k, j)))
                    i = k + TextUtils.getNextTransition(mTextView.getText().subSequence(k, j));
                else
                    i = k + 1;
            positionAtCursorOffset(Math.min(i, j), false);
        }

        public void updateSelection(int i)
        {
            Selection.setSelection((Spannable)mTextView.getText(), mTextView.getSelectionStart(), i);
            updateDrawable();
        }

        public SelectionEndHandleView(Drawable drawable, Drawable drawable1)
        {
            this$0 = Editor.this;
            super(drawable, drawable1);
            dragDownOrientation = false;
        }
    }

    class SelectionModifierCursorController
        implements CursorController
    {

        private static final int DELAY_BEFORE_REPLACE_ACTION = 200;
        private float mDownPositionX;
        private float mDownPositionY;
        private SelectionEndHandleView mEndHandle;
        private boolean mGestureStayedInTapRegion;
        private boolean mIsShowing;
        private int mMaxTouchOffset;
        private int mMinTouchOffset;
        private long mPreviousTapUpTime;
        private SelectionStartHandleView mStartHandle;
        final Editor this$0;

        private void initDrawables()
        {
            if (mSelectHandleLeft == null)
                mSelectHandleLeft = mTextView.getContext().getResources().getDrawable(mTextView.mTextSelectHandleLeftRes);
            if (mSelectHandleRight == null)
                mSelectHandleRight = mTextView.getContext().getResources().getDrawable(mTextView.mTextSelectHandleRightRes);
        }

        private void initHandles()
        {
            if (mStartHandle == null)
                mStartHandle = new SelectionStartHandleView(mSelectHandleLeft, mSelectHandleRight);
            if (mEndHandle == null)
                mEndHandle = new SelectionEndHandleView(mSelectHandleRight, mSelectHandleLeft);
            mStartHandle.show();
            mEndHandle.show();
            mStartHandle.showActionPopupWindow(200);
            mEndHandle.setActionPopupWindow(mStartHandle.getActionPopupWindow());
            hideInsertionPointCursorController();
        }

        private void updateMinAndMaxOffsets(MotionEvent motionevent)
        {
            int i = motionevent.getPointerCount();
            for (int j = 0; j < i; j++)
            {
                int k = mTextView.getOffsetForPosition(motionevent.getX(j), motionevent.getY(j));
                if (k < mMinTouchOffset)
                    mMinTouchOffset = k;
                if (k > mMaxTouchOffset)
                    mMaxTouchOffset = k;
            }

        }

        public int getMaxTouchOffset()
        {
            return mMaxTouchOffset;
        }

        public int getMinTouchOffset()
        {
            return mMinTouchOffset;
        }

        public void hide()
        {
            if (mStartHandle != null)
                mStartHandle.hide();
            if (mEndHandle != null)
                mEndHandle.hide();
        }

        boolean isSelectionEndDragDown()
        {
            if (mEndHandle != null)
                return mEndHandle.isDragOrientationDown();
            else
                return true;
        }

        public boolean isSelectionEndDragged()
        {
            if (mEndHandle != null)
                return mEndHandle.isDragging();
            else
                return false;
        }

        boolean isSelectionStartDragDown()
        {
            if (mStartHandle != null)
                return mStartHandle.isDragOrientationDown();
            else
                return false;
        }

        public boolean isSelectionStartDragged()
        {
            return mStartHandle != null && mStartHandle.isDragging();
        }

        public boolean isShowing()
        {
            return mIsShowing;
        }

        public void onDetached()
        {
            mTextView.getViewTreeObserver().removeOnTouchModeChangeListener(this);
            if (mStartHandle != null)
                mStartHandle.onDetached();
            if (mEndHandle != null)
                mEndHandle.onDetached();
        }

        public void onTouchEvent(MotionEvent motionevent)
        {
label0:
            {
                switch (motionevent.getActionMasked())
                {
                case 3: // '\003'
                case 4: // '\004'
                default:
                    break;

                case 0: // '\0'
                    break label0;

                case 1: // '\001'
                    mPreviousTapUpTime = SystemClock.uptimeMillis();
                    return;

                case 2: // '\002'
                    if (mGestureStayedInTapRegion)
                    {
                        float f5 = motionevent.getX() - mDownPositionX;
                        float f6 = motionevent.getY() - mDownPositionY;
                        float f7 = f5 * f5 + f6 * f6;
                        int k = ViewConfiguration.get(mTextView.getContext()).getScaledDoubleTapTouchSlop();
                        if (f7 > (float)(k * k))
                        {
                            mGestureStayedInTapRegion = false;
                            return;
                        }
                    }
                    break;

                case 5: // '\005'
                case 6: // '\006'
                    if (mTextView.getContext().getPackageManager().hasSystemFeature("android.hardware.touchscreen.multitouch.distinct"))
                    {
                        updateMinAndMaxOffsets(motionevent);
                        return;
                    }
                    break;
                }
                return;
            }
            float f = motionevent.getX();
            float f1 = motionevent.getY();
            int i = mTextView.getOffsetForPosition(f, f1);
            mMaxTouchOffset = i;
            mMinTouchOffset = i;
            if (mGestureStayedInTapRegion && SystemClock.uptimeMillis() - mPreviousTapUpTime <= (long)ViewConfiguration.getDoubleTapTimeout())
            {
                float f2 = f - mDownPositionX;
                float f3 = f1 - mDownPositionY;
                float f4 = f2 * f2 + f3 * f3;
                int j = ViewConfiguration.get(mTextView.getContext()).getScaledDoubleTapSlop();
                boolean flag;
                if (f4 < (float)(j * j))
                    flag = true;
                else
                    flag = false;
                if (flag && isPositionOnText(f, f1))
                {
                    startSelectionActionMode();
                    mDiscardNextActionUp = true;
                }
            }
            mDownPositionX = f;
            mDownPositionY = f1;
            mGestureStayedInTapRegion = true;
        }

        public void onTouchModeChanged(boolean flag)
        {
            if (!flag)
                hide();
        }

        public void resetTouchOffsets()
        {
            mMaxTouchOffset = -1;
            mMinTouchOffset = -1;
        }

        public void show()
        {
            if (mTextView.isInBatchEditMode())
            {
                return;
            } else
            {
                initDrawables();
                initHandles();
                hideInsertionPointCursorController();
                return;
            }
        }

        SelectionModifierCursorController()
        {
            this$0 = Editor.this;
            super();
            mPreviousTapUpTime = 0L;
            resetTouchOffsets();
        }
    }

    private class SelectionStartHandleView extends HandleView
    {

        private boolean dragDownOrientation;
        final Editor this$0;

        public ActionPopupWindow getActionPopupWindow()
        {
            return super.mActionPopupWindow;
        }

        public int getCurrentCursorOffset()
        {
            return mTextView.getSelectionStart();
        }

        protected int getHotspotX(Drawable drawable, boolean flag)
        {
            if (flag)
                return drawable.getIntrinsicWidth() / 4;
            else
                return (3 * drawable.getIntrinsicWidth()) / 4;
        }

        boolean isDragOrientationDown()
        {
            return dragDownOrientation;
        }

        public void updatePosition(float f, float f1)
        {
            mTextView.getSelectionStart();
            int i = mTextView.getOffsetForPosition(f, f1);
            int j = mTextView.getText().length();
            int k = mTextView.getSelectionStart();
            int l = mTextView.getSelectionEnd();
            if (i >= l)
                if (TextUtils.hasReplacement(mTextView.getText().subSequence(k, j)))
                    i = l - TextUtils.getNextTransition(mTextView.getText().subSequence(k, j));
                else
                    i = l - 1;
            positionAtCursorOffset(Math.max(0, i), false);
        }

        public void updateSelection(int i)
        {
            Selection.setSelection((Spannable)mTextView.getText(), i, mTextView.getSelectionEnd());
            updateDrawable();
        }

        public SelectionStartHandleView(Drawable drawable, Drawable drawable1)
        {
            this$0 = Editor.this;
            super(drawable, drawable1);
            dragDownOrientation = false;
        }
    }

    private class SuggestionsPopupWindow extends PinnedPopupWindow
        implements AdapterView.OnItemClickListener
    {

        private static final int ADD_TO_DICTIONARY = -1;
        private static final int DELETE_TEXT = -2;
        private static final int MAX_NUMBER_SUGGESTIONS = 5;
        private boolean mCursorWasVisibleBeforeSuggestions;
        private boolean mIsShowingUp;
        private int mNumberOfSuggestions;
        private final HashMap mSpansLengths = new HashMap();
        private SuggestionInfo mSuggestionInfos[];
        private final Comparator mSuggestionSpanComparator = new SuggestionSpanComparator();
        private SuggestionAdapter mSuggestionsAdapter;
        final Editor this$0;

        private SuggestionSpan[] getSuggestionSpans()
        {
            int i = mTextView.getSelectionStart();
            Spannable spannable = (Spannable)mTextView.getText();
            SuggestionSpan asuggestionspan[] = (SuggestionSpan[])spannable.getSpans(i, i, android/text/style/SuggestionSpan);
            mSpansLengths.clear();
            int j = asuggestionspan.length;
            for (int k = 0; k < j; k++)
            {
                SuggestionSpan suggestionspan = asuggestionspan[k];
                int l = spannable.getSpanStart(suggestionspan);
                int i1 = spannable.getSpanEnd(suggestionspan);
                mSpansLengths.put(suggestionspan, Integer.valueOf(i1 - l));
            }

            Arrays.sort(asuggestionspan, mSuggestionSpanComparator);
            return asuggestionspan;
        }

        private void highlightTextDifferences(SuggestionInfo suggestioninfo, int i, int j)
        {
            Spannable spannable = (Spannable)mTextView.getText();
            int k = spannable.getSpanStart(suggestioninfo.suggestionSpan);
            int l = spannable.getSpanEnd(suggestioninfo.suggestionSpan);
            suggestioninfo.suggestionStart = k - i;
            suggestioninfo.suggestionEnd = suggestioninfo.suggestionStart + suggestioninfo.text.length();
            suggestioninfo.text.setSpan(suggestioninfo.highlightSpan, 0, suggestioninfo.text.length(), 33);
            String s = spannable.toString();
            suggestioninfo.text.insert(0, s.substring(i, k));
            suggestioninfo.text.append(s.substring(l, j));
        }

        private boolean updateSuggestions()
        {
            Spannable spannable;
            SuggestionSpan asuggestionspan[];
            int i;
            int j;
            int k;
            SuggestionSpan suggestionspan;
            int l;
            int i1;
            spannable = (Spannable)mTextView.getText();
            asuggestionspan = getSuggestionSpans();
            i = asuggestionspan.length;
            if (i == 0)
                return false;
            mNumberOfSuggestions = 0;
            j = mTextView.getText().length();
            k = 0;
            suggestionspan = null;
            l = 0;
            i1 = 0;
_L9:
            SuggestionSpan suggestionspan1;
            int j2;
            int k2;
            String as[];
            int l2;
            int i3;
            if (i1 >= i)
                break MISSING_BLOCK_LABEL_345;
            suggestionspan1 = asuggestionspan[i1];
            j2 = spannable.getSpanStart(suggestionspan1);
            k2 = spannable.getSpanEnd(suggestionspan1);
            j = Math.min(j2, j);
            k = Math.max(k2, k);
            if ((2 & suggestionspan1.getFlags()) != 0)
                suggestionspan = suggestionspan1;
            if (i1 == 0)
                l = suggestionspan1.getUnderlineColor();
            as = suggestionspan1.getSuggestions();
            l2 = as.length;
            i3 = 0;
_L6:
            if (i3 >= l2) goto _L2; else goto _L1
_L1:
            String s;
            int j3;
            s = as[i3];
            j3 = 0;
_L7:
            boolean flag;
            int k3 = mNumberOfSuggestions;
            flag = false;
            if (j3 < k3)
            {
                if (!mSuggestionInfos[j3].text.toString().equals(s))
                    break MISSING_BLOCK_LABEL_339;
                SuggestionSpan suggestionspan2 = mSuggestionInfos[j3].suggestionSpan;
                int l3 = spannable.getSpanStart(suggestionspan2);
                int i4 = spannable.getSpanEnd(suggestionspan2);
                if (j2 != l3 || k2 != i4)
                    break MISSING_BLOCK_LABEL_339;
                flag = true;
            }
            if (flag) goto _L4; else goto _L3
_L3:
            SuggestionInfo suggestioninfo2 = mSuggestionInfos[mNumberOfSuggestions];
            suggestioninfo2.suggestionSpan = suggestionspan1;
            suggestioninfo2.suggestionIndex = i3;
            suggestioninfo2.text.replace(0, suggestioninfo2.text.length(), s);
            mNumberOfSuggestions = 1 + mNumberOfSuggestions;
            if (mNumberOfSuggestions != 5) goto _L4; else goto _L5
_L5:
            i1 = i;
_L2:
            i1++;
            continue; /* Loop/switch isn't completed */
_L4:
            i3++;
              goto _L6
            j3++;
              goto _L7
            for (int j1 = 0; j1 < mNumberOfSuggestions; j1++)
                highlightTextDifferences(mSuggestionInfos[j1], j, k);

            if (suggestionspan != null)
            {
                int l1 = spannable.getSpanStart(suggestionspan);
                int i2 = spannable.getSpanEnd(suggestionspan);
                if (l1 >= 0 && i2 > l1)
                {
                    SuggestionInfo suggestioninfo1 = mSuggestionInfos[mNumberOfSuggestions];
                    suggestioninfo1.suggestionSpan = suggestionspan;
                    suggestioninfo1.suggestionIndex = -1;
                    suggestioninfo1.text.replace(0, suggestioninfo1.text.length(), mTextView.getContext().getString(0x10403c4));
                    suggestioninfo1.text.setSpan(suggestioninfo1.highlightSpan, 0, 0, 33);
                    mNumberOfSuggestions = 1 + mNumberOfSuggestions;
                }
            }
            SuggestionInfo suggestioninfo = mSuggestionInfos[mNumberOfSuggestions];
            suggestioninfo.suggestionSpan = null;
            suggestioninfo.suggestionIndex = -2;
            suggestioninfo.text.replace(0, suggestioninfo.text.length(), mTextView.getContext().getString(0x10403c5));
            suggestioninfo.text.setSpan(suggestioninfo.highlightSpan, 0, 0, 33);
            mNumberOfSuggestions = 1 + mNumberOfSuggestions;
            if (mSuggestionRangeSpan == null)
                mSuggestionRangeSpan = new SuggestionRangeSpan();
            if (l == 0)
            {
                mSuggestionRangeSpan.setBackgroundColor(mTextView.mHighlightColor);
            } else
            {
                int k1 = (int)(0.4F * (float)Color.alpha(l));
                mSuggestionRangeSpan.setBackgroundColor((0xffffff & l) + (k1 << 24));
            }
            spannable.setSpan(mSuggestionRangeSpan, j, k, 33);
            mSuggestionsAdapter.notifyDataSetChanged();
            return true;
            if (true) goto _L9; else goto _L8
_L8:
        }

        protected int clipVertically(int i)
        {
            int j = super.mContentView.getMeasuredHeight();
            return Math.min(i, mTextView.getResources().getDisplayMetrics().heightPixels - j);
        }

        protected void createPopupWindow()
        {
            super.mPopupWindow = new CustomPopupWindow(mTextView.getContext(), 0x1010373);
            super.mPopupWindow.setInputMethodMode(2);
            super.mPopupWindow.setFocusable(true);
            super.mPopupWindow.setClippingEnabled(false);
        }

        protected int getTextOffset()
        {
            return mTextView.getSelectionStart();
        }

        protected int getVerticalLocalPosition(int i)
        {
            return mTextView.getLayout().getLineBottom(i);
        }

        public void hide()
        {
            super.hide();
        }

        protected void initContentView()
        {
            ListView listview = new ListView(mTextView.getContext());
            mSuggestionsAdapter = new SuggestionAdapter();
            listview.setAdapter(mSuggestionsAdapter);
            listview.setOnItemClickListener(this);
            super.mContentView = listview;
            mSuggestionInfos = new SuggestionInfo[7];
            for (int i = 0; i < mSuggestionInfos.length; i++)
                mSuggestionInfos[i] = new SuggestionInfo();

        }

        public boolean isShowingUp()
        {
            return mIsShowingUp;
        }

        protected void measureContent()
        {
            DisplayMetrics displaymetrics = mTextView.getResources().getDisplayMetrics();
            int i = android.view.View.MeasureSpec.makeMeasureSpec(displaymetrics.widthPixels, 0x80000000);
            int j = android.view.View.MeasureSpec.makeMeasureSpec(displaymetrics.heightPixels, 0x80000000);
            int k = 0;
            View view = null;
            for (int l = 0; l < mNumberOfSuggestions; l++)
            {
                view = mSuggestionsAdapter.getView(l, view, super.mContentView);
                view.getLayoutParams().width = -2;
                view.measure(i, j);
                k = Math.max(k, view.getMeasuredWidth());
            }

            super.mContentView.measure(android.view.View.MeasureSpec.makeMeasureSpec(k, 0x40000000), j);
            Drawable drawable = super.mPopupWindow.getBackground();
            if (drawable != null)
            {
                if (mTempRect == null)
                    mTempRect = new Rect();
                drawable.getPadding(mTempRect);
                k += mTempRect.left + mTempRect.right;
            }
            super.mPopupWindow.setWidth(k);
        }

        public void onItemClick(AdapterView adapterview, View view, int i, long l)
        {
            Editable editable = (Editable)mTextView.getText();
            SuggestionInfo suggestioninfo = mSuggestionInfos[i];
            if (suggestioninfo.suggestionIndex == -2)
            {
                int i3 = editable.getSpanStart(mSuggestionRangeSpan);
                int j3 = editable.getSpanEnd(mSuggestionRangeSpan);
                if (i3 >= 0 && j3 > i3)
                {
                    if (j3 < editable.length() && Character.isSpaceChar(editable.charAt(j3)) && (i3 == 0 || Character.isSpaceChar(editable.charAt(i3 - 1))))
                        j3++;
                    mTextView.deleteText_internal(i3, j3);
                }
                hide();
                return;
            }
            int j = editable.getSpanStart(suggestioninfo.suggestionSpan);
            int k = editable.getSpanEnd(suggestioninfo.suggestionSpan);
            if (j >= 0 && k > j)
            {
                String s = editable.toString().substring(j, k);
                if (suggestioninfo.suggestionIndex == -1)
                {
                    Intent intent = new Intent("com.android.settings.USER_DICTIONARY_INSERT");
                    intent.putExtra("word", s);
                    intent.putExtra("locale", mTextView.getTextServicesLocale().toString());
                    mUserDictionaryListener.waitForUserDictionaryAdded(mTextView, s, j, k);
                    intent.putExtra("listener", new Messenger(mUserDictionaryListener));
                    intent.setFlags(0x10000000 | intent.getFlags());
                    mTextView.getContext().startActivity(intent);
                    editable.removeSpan(suggestioninfo.suggestionSpan);
                    Selection.setSelection(editable, k);
                    updateSpellCheckSpans(j, k, false);
                } else
                {
                    SuggestionSpan asuggestionspan[] = (SuggestionSpan[])editable.getSpans(j, k, android/text/style/SuggestionSpan);
                    int i1 = asuggestionspan.length;
                    int ai[] = new int[i1];
                    int ai1[] = new int[i1];
                    int ai2[] = new int[i1];
                    for (int j1 = 0; j1 < i1; j1++)
                    {
                        SuggestionSpan suggestionspan = asuggestionspan[j1];
                        ai[j1] = editable.getSpanStart(suggestionspan);
                        ai1[j1] = editable.getSpanEnd(suggestionspan);
                        ai2[j1] = editable.getSpanFlags(suggestionspan);
                        int l2 = suggestionspan.getFlags();
                        if ((l2 & 2) > 0)
                            suggestionspan.setFlags(-2 & (l2 & -3));
                    }

                    int k1 = suggestioninfo.suggestionStart;
                    int l1 = suggestioninfo.suggestionEnd;
                    String s1 = suggestioninfo.text.subSequence(k1, l1).toString();
                    mTextView.replaceText_internal(j, k, s1);
                    if (!TextUtils.isEmpty(suggestioninfo.suggestionSpan.getNotificationTargetClassName()))
                    {
                        InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
                        if (inputmethodmanager != null)
                            inputmethodmanager.notifySuggestionPicked(suggestioninfo.suggestionSpan, s, suggestioninfo.suggestionIndex);
                    }
                    suggestioninfo.suggestionSpan.getSuggestions()[suggestioninfo.suggestionIndex] = s;
                    int i2 = s1.length() - (k - j);
                    for (int j2 = 0; j2 < i1; j2++)
                        if (ai[j2] <= j && ai1[j2] >= k)
                            mTextView.setSpan_internal(asuggestionspan[j2], ai[j2], i2 + ai1[j2], ai2[j2]);

                    int k2 = k + i2;
                    mTextView.setCursorPosition_internal(k2, k2);
                }
                hide();
                return;
            } else
            {
                hide();
                return;
            }
        }

        public void onParentLostFocus()
        {
            mIsShowingUp = false;
        }

        public void show()
        {
            if ((mTextView.getText() instanceof Editable) && updateSuggestions())
            {
                mCursorWasVisibleBeforeSuggestions = mCursorVisible;
                mTextView.setCursorVisible(false);
                mIsShowingUp = true;
                super.show();
                return;
            } else
            {
                return;
            }
        }





        public SuggestionsPopupWindow()
        {
            this$0 = Editor.this;
            super();
            mIsShowingUp = false;
            mCursorWasVisibleBeforeSuggestions = mCursorVisible;
        }
    }

    private class SuggestionsPopupWindow.CustomPopupWindow extends PopupWindow
    {

        final SuggestionsPopupWindow this$1;

        public void dismiss()
        {
            super.dismiss();
            getPositionListener().removeSubscriber(SuggestionsPopupWindow.this);
            ((Spannable)mTextView.getText()).removeSpan(mSuggestionRangeSpan);
            mTextView.setCursorVisible(mCursorWasVisibleBeforeSuggestions);
            if (hasInsertionController())
                getInsertionController().show();
        }

        public SuggestionsPopupWindow.CustomPopupWindow(Context context, int i)
        {
            this$1 = SuggestionsPopupWindow.this;
            super(context, null, i);
        }
    }

    private class SuggestionsPopupWindow.SuggestionAdapter extends BaseAdapter
    {

        private LayoutInflater mInflater;
        final SuggestionsPopupWindow this$1;

        public int getCount()
        {
            return mNumberOfSuggestions;
        }

        public Object getItem(int i)
        {
            return mSuggestionInfos[i];
        }

        public long getItemId(int i)
        {
            return (long)i;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            TextView textview = (TextView)view;
            if (textview == null)
                textview = (TextView)mInflater.inflate(mTextView.mTextEditSuggestionItemLayout, viewgroup, false);
            SuggestionsPopupWindow.SuggestionInfo suggestioninfo = mSuggestionInfos[i];
            textview.setText(suggestioninfo.text);
            if (suggestioninfo.suggestionIndex != -1 && suggestioninfo.suggestionIndex != -2)
            {
                textview.setBackgroundColor(-1);
                return textview;
            } else
            {
                textview.setBackgroundColor(0);
                return textview;
            }
        }

        private SuggestionsPopupWindow.SuggestionAdapter()
        {
            this$1 = SuggestionsPopupWindow.this;
            super();
            mInflater = (LayoutInflater)mTextView.getContext().getSystemService("layout_inflater");
        }

    }

    private class SuggestionsPopupWindow.SuggestionInfo
    {

        TextAppearanceSpan highlightSpan;
        int suggestionEnd;
        int suggestionIndex;
        SuggestionSpan suggestionSpan;
        int suggestionStart;
        SpannableStringBuilder text;
        final SuggestionsPopupWindow this$1;

        private SuggestionsPopupWindow.SuggestionInfo()
        {
            this$1 = SuggestionsPopupWindow.this;
            super();
            text = new SpannableStringBuilder();
            highlightSpan = new TextAppearanceSpan(mTextView.getContext(), 0x1030118);
        }

    }

    private class SuggestionsPopupWindow.SuggestionSpanComparator
        implements Comparator
    {

        final SuggestionsPopupWindow this$1;

        public int compare(SuggestionSpan suggestionspan, SuggestionSpan suggestionspan1)
        {
label0:
            {
                int i = suggestionspan.getFlags();
                int j = suggestionspan1.getFlags();
                if (i != j)
                {
                    boolean flag;
                    if ((i & 1) != 0)
                        flag = true;
                    else
                        flag = false;
                    boolean flag1;
                    if ((j & 1) != 0)
                        flag1 = true;
                    else
                        flag1 = false;
                    boolean flag2;
                    if ((i & 2) != 0)
                        flag2 = true;
                    else
                        flag2 = false;
                    int k = j & 2;
                    boolean flag3 = false;
                    if (k != 0)
                        flag3 = true;
                    if (flag && !flag2)
                        break label0;
                    if (flag1 && !flag3)
                        return 1;
                    if (flag2)
                        break label0;
                    if (flag3)
                        return 1;
                }
                return ((Integer)mSpansLengths.get(suggestionspan)).intValue() - ((Integer)mSpansLengths.get(suggestionspan1)).intValue();
            }
            return -1;
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((SuggestionSpan)obj, (SuggestionSpan)obj1);
        }

        private SuggestionsPopupWindow.SuggestionSpanComparator()
        {
            this$1 = SuggestionsPopupWindow.this;
            super();
        }

    }

    private static interface TextViewPositionListener
    {

        public abstract void updatePosition(int i, int j, boolean flag, boolean flag1);
    }

    public static class UserDictionaryListener extends Handler
    {

        public String mOriginalWord;
        public TextView mTextView;
        public int mWordEnd;
        public int mWordStart;

        private void onUserDictionaryAdded(String s, String s1)
        {
            if (!TextUtils.isEmpty(mOriginalWord) && !TextUtils.isEmpty(s1) && mWordStart >= 0 && mWordEnd < mTextView.length() && mOriginalWord.equals(s) && !s.equals(s1) && ((Editable)mTextView.getText()).toString().substring(mWordStart, mWordEnd).equals(s))
            {
                mTextView.replaceText_internal(mWordStart, mWordEnd, s1);
                int i = mWordStart + s1.length();
                mTextView.setCursorPosition_internal(i, i);
                return;
            } else
            {
                return;
            }
        }

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 0: // '\0'
            case 2: // '\002'
                if (!(message.obj instanceof Bundle))
                {
                    Log.w("Editor", "Illegal message. Abort handling onUserDictionaryAdded.");
                    return;
                } else
                {
                    Bundle bundle = (Bundle)message.obj;
                    onUserDictionaryAdded(bundle.getString("originalWord"), bundle.getString("word"));
                    return;
                }

            case 1: // '\001'
            default:
                return;
            }
        }

        public void waitForUserDictionaryAdded(TextView textview, String s, int i, int j)
        {
            mTextView = textview;
            mOriginalWord = s;
            mWordStart = i;
            mWordEnd = j;
        }

    }


    static final int BLINK = 500;
    private static int DRAG_SHADOW_MAX_TEXT_LENGTH = 0;
    static final int EXTRACT_NOTHING = -2;
    static final int EXTRACT_UNKNOWN = -1;
    private static final String TAG = "Editor";
    private static final float TEMP_POSITION[] = new float[2];
    Blink mBlink;
    CorrectionHighlighter mCorrectionHighlighter;
    boolean mCreatedWithASelection;
    int mCursorCount;
    final Drawable mCursorDrawable[] = new Drawable[2];
    boolean mCursorVisible;
    android.view.ActionMode.Callback mCustomSelectionActionModeCallback;
    boolean mDiscardNextActionUp;
    private EasyEditSpanController mEasyEditSpanController;
    CharSequence mError;
    ErrorPopup mErrorPopup;
    boolean mErrorWasChanged;
    boolean mFrozenWithFocus;
    boolean mIgnoreActionUpEvent;
    boolean mInBatchEditControllers;
    InputContentType mInputContentType;
    InputMethodState mInputMethodState;
    int mInputType;
    boolean mInsertionControllerEnabled;
    InsertionPointCursorController mInsertionPointCursorController;
    KeyListener mKeyListener;
    float mLastDownPositionX;
    float mLastDownPositionY;
    int mLastLayoutHeight;
    private PositionListener mPositionListener;
    boolean mPreserveDetachedSelection;
    boolean mSelectAllOnFocus;
    private Drawable mSelectHandleCenter;
    private Drawable mSelectHandleLeft;
    private Drawable mSelectHandleRight;
    ActionMode mSelectionActionMode;
    boolean mSelectionControllerEnabled;
    SelectionModifierCursorController mSelectionModifierCursorController;
    boolean mSelectionMoved;
    long mShowCursor;
    boolean mShowErrorAfterAttach;
    boolean mShowSoftInputOnFocus;
    Runnable mShowSuggestionRunnable;
    SpellChecker mSpellChecker;
    SuggestionRangeSpan mSuggestionRangeSpan;
    SuggestionsPopupWindow mSuggestionsPopupWindow;
    private Rect mTempRect;
    boolean mTemporaryDetach;
    DisplayList mTextDisplayLists[];
    boolean mTextIsSelectable;
    private TextView mTextView;
    boolean mTouchFocusSelected;
    private final UserDictionaryListener mUserDictionaryListener = new UserDictionaryListener();
    WordIterator mWordIterator;

    Editor(TextView textview)
    {
        mInputType = 0;
        mCursorVisible = true;
        mShowSoftInputOnFocus = true;
        mTextView = textview;
    }

    private boolean canSelectText()
    {
        return hasSelectionController() && mTextView.getText().length() != 0;
    }

    private void chooseSize(PopupWindow popupwindow, CharSequence charsequence, TextView textview)
    {
        int i = textview.getPaddingLeft() + textview.getPaddingRight();
        int j = textview.getPaddingTop() + textview.getPaddingBottom();
        int k = mTextView.getResources().getDimensionPixelSize(0x105004c);
        StaticLayout staticlayout = new StaticLayout(charsequence, textview.getPaint(), k, android.text.Layout.Alignment.ALIGN_NORMAL, 1.0F, 0.0F, true);
        float f = 0.0F;
        for (int l = 0; l < staticlayout.getLineCount(); l++)
            f = Math.max(f, staticlayout.getLineWidth(l));

        popupwindow.setWidth(i + (int)Math.ceil(f));
        popupwindow.setHeight(j + staticlayout.getHeight());
    }

    private void downgradeEasyCorrectionSpans()
    {
        CharSequence charsequence = mTextView.getText();
        if (charsequence instanceof Spannable)
        {
            Spannable spannable = (Spannable)charsequence;
            SuggestionSpan asuggestionspan[] = (SuggestionSpan[])spannable.getSpans(0, spannable.length(), android/text/style/SuggestionSpan);
            for (int i = 0; i < asuggestionspan.length; i++)
            {
                int j = asuggestionspan[i].getFlags();
                if ((j & 1) != 0 && (j & 2) == 0)
                {
                    int k = j & -2;
                    asuggestionspan[i].setFlags(k);
                }
            }

        }
    }

    private void drawCursor(Canvas canvas, int i)
    {
        boolean flag;
        if (i != 0)
            flag = true;
        else
            flag = false;
        if (flag)
            canvas.translate(0.0F, i);
        for (int j = 0; j < mCursorCount; j++)
            mCursorDrawable[j].draw(canvas);

        if (flag)
            canvas.translate(0.0F, -i);
    }

    private void drawHardwareAccelerated(Canvas canvas, Layout layout, Path path, Paint paint, int i)
    {
        int j;
        int k;
        long l = layout.getLineRangeForDraw(canvas);
        j = TextUtils.unpackRangeStartFromLong(l);
        k = TextUtils.unpackRangeEndFromLong(l);
        if (k >= 0) goto _L2; else goto _L1
_L1:
        return;
_L2:
        int ai[];
        int ai1[];
        int j1;
        int k1;
        int l1;
        int i2;
        layout.drawBackground(canvas, path, paint, i, j, k);
        if (!(layout instanceof DynamicLayout))
            break MISSING_BLOCK_LABEL_542;
        if (mTextDisplayLists == null)
            mTextDisplayLists = new DisplayList[ArrayUtils.idealObjectArraySize(0)];
        int i1 = layout.getHeight();
        if (mLastLayoutHeight != i1)
        {
            invalidateTextDisplayList();
            mLastLayoutHeight = i1;
        }
        DynamicLayout dynamiclayout = (DynamicLayout)layout;
        ai = dynamiclayout.getBlockEndLines();
        ai1 = dynamiclayout.getBlockIndices();
        j1 = dynamiclayout.getNumberOfBlocks();
        k1 = -1;
        l1 = 0;
        i2 = 0;
_L4:
        int j2;
        DisplayList displaylist;
        int l2;
        int i3;
        int j3;
        int k3;
        int l3;
        HardwareCanvas hardwarecanvas;
        int i4;
        int j4;
        if (i2 >= j1)
            break; /* Loop/switch isn't completed */
        j2 = ai[i2];
        int k2 = ai1[i2];
        boolean flag;
        boolean flag1;
        if (k2 == -1)
            flag = true;
        else
            flag = false;
        if (flag)
        {
            k2 = getAvailableDisplayListIndex(ai1, j1, l1);
            ai1[i2] = k2;
            l1 = k2 + 1;
        }
        displaylist = mTextDisplayLists[k2];
        if (displaylist == null)
        {
            DisplayList adisplaylist[] = mTextDisplayLists;
            displaylist = mTextView.getHardwareRenderer().createDisplayList((new StringBuilder()).append("Text ").append(k2).toString());
            adisplaylist[k2] = displaylist;
        } else
        if (flag)
            displaylist.invalidate();
        if (displaylist.isValid())
            break MISSING_BLOCK_LABEL_486;
        l2 = k1 + 1;
        i3 = layout.getLineTop(l2);
        j3 = layout.getLineBottom(j2);
        k3 = mTextView.getWidth();
        flag1 = mTextView.getHorizontallyScrolling();
        l3 = 0;
        if (flag1)
        {
            float f = 3.402823E+038F;
            float f1 = 1.401298E-045F;
            for (int k4 = l2; k4 <= j2; k4++)
            {
                float f2 = layout.getLineLeft(k4);
                f = Math.min(f, f2);
                float f3 = layout.getLineRight(k4);
                f1 = Math.max(f1, f3);
            }

            l3 = (int)f;
            k3 = (int)(0.5F + f1);
        }
        hardwarecanvas = displaylist.start();
        i4 = k3 - l3;
        j4 = j3 - i3;
        hardwarecanvas.setViewport(i4, j4);
        hardwarecanvas.onPreDraw(null);
        hardwarecanvas.translate(-l3, -i3);
        layout.drawText(hardwarecanvas, l2, j2);
        hardwarecanvas.onPostDraw();
        displaylist.end();
        displaylist.setLeftTopRightBottom(l3, i3, k3, j3);
        displaylist.setClipChildren(false);
        ((HardwareCanvas)canvas).drawDisplayList(displaylist, null, 0);
        k1 = j2;
        i2++;
        if (true) goto _L4; else goto _L3
_L3:
        if (true) goto _L1; else goto _L5
_L5:
        Exception exception;
        exception;
        hardwarecanvas.onPostDraw();
        displaylist.end();
        displaylist.setLeftTopRightBottom(l3, i3, k3, j3);
        displaylist.setClipChildren(false);
        throw exception;
        layout.drawText(canvas, j, k);
        return;
    }

    private boolean extractTextInternal(ExtractedTextRequest extractedtextrequest, int i, int j, int k, ExtractedText extractedtext)
    {
        CharSequence charsequence = mTextView.getText();
        boolean flag = false;
        if (charsequence != null)
        {
            if (i != -2)
            {
                int l = charsequence.length();
                int i1;
                if (i < 0)
                {
                    extractedtext.partialEndOffset = -1;
                    extractedtext.partialStartOffset = -1;
                    i = 0;
                    i1 = l;
                } else
                {
                    i1 = j + k;
                    if (charsequence instanceof Spanned)
                    {
                        Spanned spanned = (Spanned)charsequence;
                        Object aobj[] = spanned.getSpans(i, i1, android/text/ParcelableSpan);
                        int j1 = aobj.length;
                        do
                        {
                            if (j1 <= 0)
                                break;
                            j1--;
                            int k1 = spanned.getSpanStart(aobj[j1]);
                            if (k1 < i)
                                i = k1;
                            int l1 = spanned.getSpanEnd(aobj[j1]);
                            if (l1 > i1)
                                i1 = l1;
                        } while (true);
                    }
                    extractedtext.partialStartOffset = i;
                    extractedtext.partialEndOffset = i1 - k;
                    if (i > l)
                        i = l;
                    else
                    if (i < 0)
                        i = 0;
                    if (i1 > l)
                        i1 = l;
                    else
                    if (i1 < 0)
                        i1 = 0;
                }
                if ((1 & extractedtextrequest.flags) != 0)
                    extractedtext.text = charsequence.subSequence(i, i1);
                else
                    extractedtext.text = TextUtils.substring(charsequence, i, i1);
            } else
            {
                extractedtext.partialStartOffset = 0;
                extractedtext.partialEndOffset = 0;
                extractedtext.text = "";
            }
            extractedtext.flags = 0;
            if (MetaKeyKeyListener.getMetaState(charsequence, 2048) != 0)
                extractedtext.flags = 2 | extractedtext.flags;
            if (mTextView.isSingleLine())
                extractedtext.flags = 1 | extractedtext.flags;
            extractedtext.startOffset = 0;
            extractedtext.selectionStart = mTextView.getSelectionStart();
            extractedtext.selectionEnd = mTextView.getSelectionEnd();
            flag = true;
        }
        return flag;
    }

    private boolean extractedTextModeWillBeStarted()
    {
        boolean flag = mTextView instanceof ExtractEditText;
        boolean flag1 = false;
        if (!flag)
        {
            InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
            flag1 = false;
            if (inputmethodmanager != null)
            {
                boolean flag2 = inputmethodmanager.isFullscreenMode();
                flag1 = false;
                if (flag2)
                    flag1 = true;
            }
        }
        return flag1;
    }

    private int getAvailableDisplayListIndex(int ai[], int i, int j)
    {
        int k = mTextDisplayLists.length;
        int l = j;
label0:
        do
        {
            if (l < k)
            {
                int i1 = 0;
label1:
                do
                {
label2:
                    {
                        boolean flag = false;
                        if (i1 < i)
                        {
                            if (ai[i1] != l)
                                break label2;
                            flag = true;
                        }
                        if (!flag)
                            break label1;
                        l++;
                        continue label0;
                    }
                    i1++;
                } while (true);
            } else
            {
                DisplayList adisplaylist[] = new DisplayList[ArrayUtils.idealIntArraySize(k + 1)];
                System.arraycopy(mTextDisplayLists, 0, adisplaylist, 0, k);
                mTextDisplayLists = adisplaylist;
                l = k;
            }
            return l;
        } while (true);
    }

    private long getCharRange(int i)
    {
        int j = mTextView.getText().length();
        if (i + 1 < j && Character.isSurrogatePair(mTextView.getText().charAt(i), mTextView.getText().charAt(i + 1)))
            return TextUtils.packRangeInLong(i, i + 2);
        if (i < j)
            if (TextUtils.hasReplacement(mTextView.getText().subSequence(i, j)))
                return TextUtils.packRangeInLong(i, i + TextUtils.getNextTransition(mTextView.getText().subSequence(i, j)));
            else
                return TextUtils.packRangeInLong(i, i + 1);
        if (i - 2 >= 0)
        {
            char c = mTextView.getText().charAt(i - 1);
            if (Character.isSurrogatePair(mTextView.getText().charAt(i - 2), c))
                return TextUtils.packRangeInLong(i - 2, i);
        }
        if (i - 1 >= 0)
            return TextUtils.packRangeInLong(i - 1, i);
        else
            return TextUtils.packRangeInLong(i, i);
    }

    private int getErrorX()
    {
        float f = mTextView.getResources().getDisplayMetrics().density;
        TextView.Drawables drawables = mTextView.mDrawables;
        switch (mTextView.getLayoutDirection())
        {
        case 1: // '\001'
            int j = 0;
            if (drawables != null)
                j = drawables.mDrawableSizeLeft;
            return (j / 2 - (int)(0.5F + 25F * f)) + mTextView.getPaddingLeft();
        }
        int i = 0;
        if (drawables != null)
            i = drawables.mDrawableSizeRight;
        return -i / 2 + (int)(0.5F + 25F * f) + (mTextView.getWidth() - mErrorPopup.getWidth() - mTextView.getPaddingRight());
    }

    private int getErrorY()
    {
        int i = mTextView.getCompoundPaddingTop();
        int j = mTextView.getBottom() - mTextView.getTop() - mTextView.getCompoundPaddingBottom() - i;
        TextView.Drawables drawables = mTextView.mDrawables;
        int k;
        switch (mTextView.getLayoutDirection())
        {
        case 1: // '\001'
            k = 0;
            if (drawables != null)
                k = drawables.mDrawableHeightLeft;
            break;

        default:
            k = 0;
            if (drawables != null)
                k = drawables.mDrawableHeightRight;
            break;
        }
        int l = i + (j - k) / 2;
        float f = mTextView.getResources().getDisplayMetrics().density;
        return (l + k) - mTextView.getHeight() - (int)(0.5F + 2.0F * f);
    }

    private int getInputLengthFilterMax(android.text.InputFilter.LengthFilter lengthfilter)
    {
        int i;
        try
        {
            Field field = Class.forName("android.text.InputFilter$LengthFilter").getDeclaredField("mMax");
            field.setAccessible(true);
            i = ((Integer)field.get(lengthfilter)).intValue();
        }
        catch (Exception exception)
        {
            exception.printStackTrace();
            return -1;
        }
        return i;
    }

    private int getLastTapPosition()
    {
        if (mSelectionModifierCursorController != null)
        {
            int i = mSelectionModifierCursorController.getMinTouchOffset();
            if (i >= 0)
            {
                if (i > mTextView.getText().length())
                    i = mTextView.getText().length();
                return i;
            }
        }
        return -1;
    }

    private long getLastTouchOffsets()
    {
        SelectionModifierCursorController selectionmodifiercursorcontroller = getSelectionController();
        return TextUtils.packRangeInLong(selectionmodifiercursorcontroller.getMinTouchOffset(), selectionmodifiercursorcontroller.getMaxTouchOffset());
    }

    private PositionListener getPositionListener()
    {
        if (mPositionListener == null)
            mPositionListener = new PositionListener();
        return mPositionListener;
    }

    private float getPrimaryHorizontal(Layout layout, Layout layout1, int i)
    {
        if (TextUtils.isEmpty(layout.getText()) && layout1 != null && !TextUtils.isEmpty(layout1.getText()))
            return layout1.getPrimaryHorizontal(i);
        else
            return layout.getPrimaryHorizontal(i);
    }

    private android.view.View.DragShadowBuilder getTextThumbnailBuilder(CharSequence charsequence)
    {
        TextView textview = (TextView)View.inflate(mTextView.getContext(), 0x10900d3, null);
        if (textview == null)
            throw new IllegalArgumentException("Unable to inflate text drag thumbnail");
        if (charsequence.length() > DRAG_SHADOW_MAX_TEXT_LENGTH)
            charsequence = charsequence.subSequence(0, DRAG_SHADOW_MAX_TEXT_LENGTH);
        textview.setText(charsequence);
        textview.setTextColor(mTextView.getTextColors());
        textview.setTextAppearance(mTextView.getContext(), 16);
        textview.setGravity(17);
        textview.setLayoutParams(new android.view.ViewGroup.LayoutParams(-2, -2));
        int i = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
        textview.measure(i, i);
        textview.layout(0, 0, textview.getMeasuredWidth(), textview.getMeasuredHeight());
        textview.invalidate();
        return new android.view.View.DragShadowBuilder(textview);
    }

    private boolean hasPasswordTransformationMethod()
    {
        return mTextView.getTransformationMethod() instanceof PasswordTransformationMethod;
    }

    private void hideCursorControllers()
    {
        if (mSuggestionsPopupWindow != null && !mSuggestionsPopupWindow.isShowingUp())
            mSuggestionsPopupWindow.hide();
        hideInsertionPointCursorController();
        stopSelectionActionMode();
    }

    private void hideError()
    {
        if (mErrorPopup != null && mErrorPopup.isShowing())
            mErrorPopup.dismiss();
        mShowErrorAfterAttach = false;
    }

    private void hideInsertionPointCursorController()
    {
        if (mInsertionPointCursorController != null)
            mInsertionPointCursorController.hide();
    }

    private void hideSpanControllers()
    {
        if (mEasyEditSpanController != null)
            mEasyEditSpanController.hide();
    }

    private boolean isCursorInsideEasyCorrectionSpan()
    {
        SuggestionSpan asuggestionspan[] = (SuggestionSpan[])((Spannable)mTextView.getText()).getSpans(mTextView.getSelectionStart(), mTextView.getSelectionEnd(), android/text/style/SuggestionSpan);
        for (int i = 0; i < asuggestionspan.length; i++)
            if ((1 & asuggestionspan[i].getFlags()) != 0)
                return true;

        return false;
    }

    private boolean isCursorInsideSuggestionSpan()
    {
        CharSequence charsequence = mTextView.getText();
        return (charsequence instanceof Spannable) && ((SuggestionSpan[])((Spannable)charsequence).getSpans(mTextView.getSelectionStart(), mTextView.getSelectionEnd(), android/text/style/SuggestionSpan)).length > 0;
    }

    private boolean isOffsetVisible(int i)
    {
        Layout layout = mTextView.getLayout();
        int j = layout.getLineBottom(layout.getLineForOffset(i));
        return isPositionVisible((int)layout.getPrimaryHorizontal(i) + mTextView.viewportToContentHorizontalOffset(), j + mTextView.viewportToContentVerticalOffset());
    }

    private boolean isPositionOnText(float f, float f1)
    {
        Layout layout = mTextView.getLayout();
        if (layout != null)
        {
            int i = mTextView.getLineAtCoordinate(f1);
            float f2 = mTextView.convertToLocalHorizontalCoordinate(f);
            if (f2 >= layout.getLineLeft(i) && f2 <= layout.getLineRight(i))
                return true;
        }
        return false;
    }

    private boolean isPositionVisible(int i, int j)
    {
        float af[] = TEMP_POSITION;
        af;
        JVM INSTR monitorenter ;
        float af1[];
        Object obj;
        af1 = TEMP_POSITION;
        af1[0] = i;
        af1[1] = j;
        obj = mTextView;
_L2:
        if (obj == null)
            break MISSING_BLOCK_LABEL_199;
        if (obj != mTextView)
        {
            af1[0] = af1[0] - (float)((View) (obj)).getScrollX();
            af1[1] = af1[1] - (float)((View) (obj)).getScrollY();
        }
        if (af1[0] >= 0.0F && af1[1] >= 0.0F && af1[0] <= (float)((View) (obj)).getWidth() && af1[1] <= (float)((View) (obj)).getHeight())
            break MISSING_BLOCK_LABEL_123;
        af;
        JVM INSTR monitorexit ;
        return false;
        if (!((View) (obj)).getMatrix().isIdentity())
            ((View) (obj)).getMatrix().mapPoints(af1);
        af1[0] = af1[0] + (float)((View) (obj)).getLeft();
        af1[1] = af1[1] + (float)((View) (obj)).getTop();
        android.view.ViewParent viewparent = ((View) (obj)).getParent();
        if (viewparent instanceof View)
        {
            obj = (View)viewparent;
            continue; /* Loop/switch isn't completed */
        }
        break MISSING_BLOCK_LABEL_210;
        af;
        JVM INSTR monitorexit ;
        return true;
        Exception exception;
        exception;
        af;
        JVM INSTR monitorexit ;
        throw exception;
        obj = null;
        if (true) goto _L2; else goto _L1
_L1:
    }

    private boolean isSelectionActionModeOverflowMenuShowing()
    {
        if (mSelectionActionMode != null && (mSelectionActionMode instanceof StandaloneActionMode))
            return ((StandaloneActionMode)mSelectionActionMode).isOverflowMenuShowing();
        else
            return false;
    }

    private void resumeBlink()
    {
        if (mBlink != null)
        {
            mBlink.uncancel();
            makeBlink();
        }
    }

    private boolean selectCurrentWord()
    {
        if (!canSelectText())
            return false;
        if (hasPasswordTransformationMethod())
            return mTextView.selectAllText();
        int i = mTextView.getInputType();
        int j = i & 0xf;
        int k = i & 0xff0;
        if (j != 2 && j != 3 && j != 4 && k != 16 && k != 32 && k != 208 && k != 176)
        {
            long l = getLastTouchOffsets();
            int i1 = TextUtils.unpackRangeStartFromLong(l);
            int j1 = TextUtils.unpackRangeEndFromLong(l);
            if (i1 >= 0 && i1 < mTextView.getText().length())
            {
                if (j1 >= 0 && j1 < mTextView.getText().length())
                {
                    URLSpan aurlspan[] = (URLSpan[])((Spanned)mTextView.getText()).getSpans(i1, j1, android/text/style/URLSpan);
                    int l1;
                    int i2;
                    if (aurlspan.length >= 1)
                    {
                        URLSpan urlspan = aurlspan[0];
                        l1 = ((Spanned)mTextView.getText()).getSpanStart(urlspan);
                        i2 = ((Spanned)mTextView.getText()).getSpanEnd(urlspan);
                    } else
                    {
                        int k1 = mTextView.getText().length();
                        if (TextUtils.hasReplacement(mTextView.getText().subSequence(i1, k1)))
                        {
                            long l3 = getCharRange(i1);
                            l1 = TextUtils.unpackRangeStartFromLong(l3);
                            i2 = TextUtils.unpackRangeEndFromLong(l3);
                            Log.v("TextView", (new StringBuilder()).append("here1-").append(Integer.toString(l1)).append(",").append(Integer.toString(i2)).toString());
                        } else
                        {
                            WordIterator worditerator = getWordIterator();
                            worditerator.setCharSequence(mTextView.getText(), i1, j1);
                            l1 = worditerator.getBeginning(i1);
                            i2 = worditerator.getEnd(j1);
                            if (l1 == -1 || i2 == -1 || l1 == i2)
                            {
                                long l2 = getCharRange(i1);
                                l1 = TextUtils.unpackRangeStartFromLong(l2);
                                i2 = TextUtils.unpackRangeEndFromLong(l2);
                            }
                            Log.v("TextView", (new StringBuilder()).append("here2-").append(Integer.toString(l1)).append(",").append(Integer.toString(i2)).toString());
                        }
                    }
                    Selection.setSelection((Spannable)mTextView.getText(), l1, i2);
                    return i2 > l1;
                } else
                {
                    return false;
                }
            } else
            {
                return false;
            }
        } else
        {
            return mTextView.selectAllText();
        }
    }

    private boolean selectCurrentWordOnMenu()
    {
label0:
        {
            if (canSelectText())
            {
                if (hasPasswordTransformationMethod())
                    return mTextView.selectAllText();
                int i = mTextView.getInputType();
                int j = i & 0xf;
                int k = i & 0xff0;
                if (j == 2 || j == 3 || j == 4 || k == 16 || k == 32 || k == 208 || k == 176)
                    break label0;
                int l = mTextView.getSelectionStart();
                int i1 = mTextView.getSelectionEnd();
                int j1 = mTextView.length();
                if (l <= j1 && i1 <= j1 && (l <= 0 || i1 <= 0 || l == i1))
                {
                    int k1 = i1 - 1;
                    if (k1 < 0)
                    {
                        k1 = 0;
                        i1 = 0 + 1;
                    }
                    Selection.setSelection((Spannable)mTextView.getText(), k1, i1);
                    boolean flag;
                    if (i1 >= k1)
                        flag = true;
                    else
                        flag = false;
                    return flag;
                }
            }
            return false;
        }
        return mTextView.selectAllText();
    }

    private void setErrorIcon(Drawable drawable)
    {
        TextView.Drawables drawables = mTextView.mDrawables;
        if (drawables == null)
        {
            TextView textview = mTextView;
            drawables = new TextView.Drawables();
            textview.mDrawables = drawables;
        }
        drawables.setErrorDrawable(drawable, mTextView);
        mTextView.resetResolvedDrawables();
        mTextView.invalidate();
        mTextView.requestLayout();
    }

    private boolean shouldBlink()
    {
        if (isCursorVisible() && mTextView.isFocused())
        {
            int i = mTextView.getSelectionStart();
            if (i >= 0)
            {
                int j = mTextView.getSelectionEnd();
                if (j >= 0 && i == j)
                    return true;
            }
        }
        return false;
    }

    private void showError()
    {
        if (mTextView.getWindowToken() == null)
        {
            mShowErrorAfterAttach = true;
            return;
        }
        if (mErrorPopup == null)
        {
            TextView textview1 = (TextView)LayoutInflater.from(mTextView.getContext()).inflate(0x10900db, null);
            float f = mTextView.getResources().getDisplayMetrics().density;
            mErrorPopup = new ErrorPopup(textview1, (int)(0.5F + 200F * f), (int)(0.5F + 50F * f));
            mErrorPopup.setFocusable(false);
            mErrorPopup.setInputMethodMode(1);
        }
        TextView textview = (TextView)mErrorPopup.getContentView();
        chooseSize(mErrorPopup, mError, textview);
        textview.setText(mError);
        mErrorPopup.showAsDropDown(mTextView, getErrorX(), getErrorY());
        mErrorPopup.fixDirection(mErrorPopup.isAboveAnchor());
    }

    private void suspendBlink()
    {
        if (mBlink != null)
            mBlink.cancel();
    }

    private boolean touchPositionIsInSelection()
    {
        int i = mTextView.getSelectionStart();
        int j = mTextView.getSelectionEnd();
        if (i == j)
            return false;
        if (i > j)
        {
            int i1 = i;
            i = j;
            j = i1;
            Selection.setSelection((Spannable)mTextView.getText(), i, j);
        }
        SelectionModifierCursorController selectionmodifiercursorcontroller = getSelectionController();
        int k = selectionmodifiercursorcontroller.getMinTouchOffset();
        int l = selectionmodifiercursorcontroller.getMaxTouchOffset();
        boolean flag;
        if (k >= i && l < j)
            flag = true;
        else
            flag = false;
        return flag;
    }

    private void updateCursorPosition(int i, int j, int k, float f)
    {
        if (mCursorDrawable[i] == null)
            mCursorDrawable[i] = mTextView.getResources().getDrawable(mTextView.mCursorDrawableRes);
        if (mTempRect == null)
            mTempRect = new Rect();
        mCursorDrawable[i].getPadding(mTempRect);
        int l = mCursorDrawable[i].getIntrinsicWidth();
        int i1 = (int)Math.max(0.5F, f - 0.5F) - mTempRect.left;
        mCursorDrawable[i].setBounds(i1, j - mTempRect.top, i1 + l, k + mTempRect.bottom);
    }

    private void updateSpellCheckSpans(int i, int j, boolean flag)
    {
        if (mTextView.isTextEditable() && mTextView.isSuggestionsEnabled() && !(mTextView instanceof ExtractEditText))
        {
            if (mSpellChecker == null && flag)
                mSpellChecker = new SpellChecker(mTextView);
            if (mSpellChecker != null)
                mSpellChecker.spellCheck(i, j);
        }
    }

    public void addSpanWatchers(Spannable spannable)
    {
        int i = spannable.length();
        if (mKeyListener != null)
            spannable.setSpan(mKeyListener, 0, i, 18);
        if (mEasyEditSpanController == null)
            mEasyEditSpanController = new EasyEditSpanController();
        spannable.setSpan(mEasyEditSpanController, 0, i, 18);
    }

    void adjustInputType(boolean flag, boolean flag1, boolean flag2, boolean flag3)
    {
        if ((0xf & mInputType) == 1)
        {
            if (flag || flag1)
                mInputType = 0x80 | 0xfffff00f & mInputType;
            if (flag2)
                mInputType = 0xe0 | 0xfffff00f & mInputType;
        } else
        if ((0xf & mInputType) == 2 && flag3)
        {
            mInputType = 0x10 | 0xfffff00f & mInputType;
            return;
        }
    }

    boolean areSuggestionsShown()
    {
        return mSuggestionsPopupWindow != null && mSuggestionsPopupWindow.isShowing();
    }

    public void beginBatchEdit()
    {
        mInBatchEditControllers = true;
        InputMethodState inputmethodstate = mInputMethodState;
        if (inputmethodstate != null)
        {
            int i = 1 + inputmethodstate.mBatchEditNesting;
            inputmethodstate.mBatchEditNesting = i;
            if (i == 1)
            {
                inputmethodstate.mCursorChanged = false;
                inputmethodstate.mChangedDelta = 0;
                if (inputmethodstate.mContentChanged)
                {
                    inputmethodstate.mChangedStart = 0;
                    inputmethodstate.mChangedEnd = mTextView.getText().length();
                } else
                {
                    inputmethodstate.mChangedStart = -1;
                    inputmethodstate.mChangedEnd = -1;
                    inputmethodstate.mContentChanged = false;
                }
                mTextView.onBeginBatchEdit();
            }
        }
    }

    void createInputContentTypeIfNeeded()
    {
        if (mInputContentType == null)
            mInputContentType = new InputContentType();
    }

    void createInputMethodStateIfNeeded()
    {
        if (mInputMethodState == null)
            mInputMethodState = new InputMethodState();
    }

    public void endBatchEdit()
    {
        mInBatchEditControllers = false;
        InputMethodState inputmethodstate = mInputMethodState;
        if (inputmethodstate != null)
        {
            int i = -1 + inputmethodstate.mBatchEditNesting;
            inputmethodstate.mBatchEditNesting = i;
            if (i == 0)
                finishBatchEdit(inputmethodstate);
        }
    }

    void ensureEndedBatchEdit()
    {
        InputMethodState inputmethodstate = mInputMethodState;
        if (inputmethodstate != null && inputmethodstate.mBatchEditNesting != 0)
        {
            inputmethodstate.mBatchEditNesting = 0;
            finishBatchEdit(inputmethodstate);
        }
    }

    boolean extractText(ExtractedTextRequest extractedtextrequest, ExtractedText extractedtext)
    {
        return extractTextInternal(extractedtextrequest, -1, -1, -1, extractedtext);
    }

    void finishBatchEdit(InputMethodState inputmethodstate)
    {
        mTextView.onEndBatchEdit();
        if (!inputmethodstate.mContentChanged && !inputmethodstate.mSelectionModeChanged)
        {
            if (inputmethodstate.mCursorChanged)
            {
                mTextView.invalidateCursor();
                return;
            }
        } else
        {
            mTextView.updateAfterEdit();
            reportExtractedText();
        }
    }

    InsertionPointCursorController getInsertionController()
    {
        if (!mInsertionControllerEnabled)
            return null;
        if (mInsertionPointCursorController == null)
        {
            mInsertionPointCursorController = new InsertionPointCursorController();
            mTextView.getViewTreeObserver().addOnTouchModeChangeListener(mInsertionPointCursorController);
        }
        return mInsertionPointCursorController;
    }

    SelectionModifierCursorController getSelectionController()
    {
        if (!mSelectionControllerEnabled)
            return null;
        if (mSelectionModifierCursorController == null)
        {
            mSelectionModifierCursorController = new SelectionModifierCursorController();
            mTextView.getViewTreeObserver().addOnTouchModeChangeListener(mSelectionModifierCursorController);
        }
        return mSelectionModifierCursorController;
    }

    public WordIterator getWordIterator()
    {
        if (mWordIterator == null)
            mWordIterator = new WordIterator(mTextView.getTextServicesLocale());
        return mWordIterator;
    }

    boolean hasInsertionController()
    {
        return mInsertionControllerEnabled;
    }

    boolean hasSelectionController()
    {
        return mSelectionControllerEnabled;
    }

    void hideControllers()
    {
        hideCursorControllers();
        hideSpanControllers();
    }

    void hideInsertionPointCursorControllerP()
    {
        if (mInsertionPointCursorController != null && mInsertionPointCursorController.isShowing())
            mInsertionPointCursorController.hide();
    }

    void invalidateTextDisplayList()
    {
        if (mTextDisplayLists != null)
        {
            for (int i = 0; i < mTextDisplayLists.length; i++)
                if (mTextDisplayLists[i] != null)
                    mTextDisplayLists[i].invalidate();

        }
    }

    void invalidateTextDisplayList(Layout layout, int i, int j)
    {
        if (mTextDisplayLists != null && (layout instanceof DynamicLayout))
        {
            int k = layout.getLineForOffset(i);
            int l = layout.getLineForOffset(j);
            DynamicLayout dynamiclayout = (DynamicLayout)layout;
            int ai[] = dynamiclayout.getBlockEndLines();
            int ai1[] = dynamiclayout.getBlockIndices();
            int i1 = dynamiclayout.getNumberOfBlocks();
            int j1;
            for (j1 = 0; j1 < i1 && ai[j1] < k; j1++);
            do
            {
                if (j1 >= i1)
                    break;
                int k1 = ai1[j1];
                if (k1 != -1)
                    mTextDisplayLists[k1].invalidate();
                if (ai[j1] >= l)
                    break;
                j1++;
            } while (true);
        }
    }

    boolean isCursorVisible()
    {
        return mCursorVisible && mTextView.isTextEditable();
    }

    void makeBlink()
    {
        if (shouldBlink())
        {
            mShowCursor = SystemClock.uptimeMillis();
            if (mBlink == null)
                mBlink = new Blink();
            mBlink.removeCallbacks(mBlink);
            mBlink.postAtTime(mBlink, 500L + mShowCursor);
        } else
        if (mBlink != null)
        {
            mBlink.removeCallbacks(mBlink);
            return;
        }
    }

    void onAttachedToWindow()
    {
        if (mShowErrorAfterAttach)
        {
            showError();
            mShowErrorAfterAttach = false;
        }
        mTemporaryDetach = false;
        ViewTreeObserver viewtreeobserver = mTextView.getViewTreeObserver();
        if (mInsertionPointCursorController != null)
            viewtreeobserver.addOnTouchModeChangeListener(mInsertionPointCursorController);
        if (mSelectionModifierCursorController != null)
        {
            mSelectionModifierCursorController.resetTouchOffsets();
            viewtreeobserver.addOnTouchModeChangeListener(mSelectionModifierCursorController);
        }
        updateSpellCheckSpans(0, mTextView.getText().length(), true);
        if (mTextView.hasTransientState() && mTextView.getSelectionStart() != mTextView.getSelectionEnd())
        {
            mTextView.setHasTransientState(false);
            startSelectionActionMode();
        }
    }

    public void onCommitCorrection(CorrectionInfo correctioninfo)
    {
        if (mCorrectionHighlighter == null)
            mCorrectionHighlighter = new CorrectionHighlighter();
        else
            mCorrectionHighlighter.invalidate(false);
        mCorrectionHighlighter.highlight(correctioninfo);
    }

    void onDetachedFromWindow()
    {
        if (mError != null)
            hideError();
        if (mBlink != null)
            mBlink.removeCallbacks(mBlink);
        if (mInsertionPointCursorController != null)
            mInsertionPointCursorController.onDetached();
        if (mSelectionModifierCursorController != null)
            mSelectionModifierCursorController.onDetached();
        if (mShowSuggestionRunnable != null)
            mTextView.removeCallbacks(mShowSuggestionRunnable);
        invalidateTextDisplayList();
        if (mSpellChecker != null)
        {
            mSpellChecker.closeSession();
            mSpellChecker = null;
        }
        mPreserveDetachedSelection = true;
        hideControllers();
        mPreserveDetachedSelection = false;
        mTemporaryDetach = false;
    }

    void onDraw(Canvas canvas, Layout layout, Path path, Paint paint, int i)
    {
        int j;
        int k;
label0:
        {
            InputMethodState inputmethodstate;
            InputMethodManager inputmethodmanager;
label1:
            {
                boolean flag;
label2:
                {
                    j = mTextView.getSelectionStart();
                    k = mTextView.getSelectionEnd();
                    inputmethodstate = mInputMethodState;
                    if (inputmethodstate == null || inputmethodstate.mBatchEditNesting != 0)
                        break label0;
                    inputmethodmanager = InputMethodManager.peekInstance();
                    if (inputmethodmanager == null)
                        break label0;
                    if (!inputmethodmanager.isActive(mTextView))
                        break label1;
                    if (!inputmethodstate.mContentChanged)
                    {
                        boolean flag1 = inputmethodstate.mSelectionModeChanged;
                        flag = false;
                        if (!flag1)
                            break label2;
                    }
                    flag = reportExtractedText();
                }
                if (!flag && path != null)
                {
                    int l = -1;
                    int i1 = -1;
                    if (mTextView.getText() instanceof Spannable)
                    {
                        Spannable spannable = (Spannable)mTextView.getText();
                        l = EditableInputConnection.getComposingSpanStart(spannable);
                        i1 = EditableInputConnection.getComposingSpanEnd(spannable);
                    }
                    inputmethodmanager.updateSelection(mTextView, j, k, l, i1);
                }
            }
            if (inputmethodmanager.isWatchingCursor(mTextView) && path != null)
            {
                RectF rectf = inputmethodstate.mTmpRectF;
                path.computeBounds(rectf, true);
                float af[] = inputmethodstate.mTmpOffset;
                inputmethodstate.mTmpOffset[1] = 0.0F;
                af[0] = 0.0F;
                canvas.getMatrix().mapPoints(inputmethodstate.mTmpOffset);
                inputmethodstate.mTmpRectF.offset(inputmethodstate.mTmpOffset[0], inputmethodstate.mTmpOffset[1]);
                inputmethodstate.mTmpRectF.offset(0.0F, i);
                inputmethodstate.mCursorRectInWindow.set((int)(0.5D + (double)inputmethodstate.mTmpRectF.left), (int)(0.5D + (double)inputmethodstate.mTmpRectF.top), (int)(0.5D + (double)inputmethodstate.mTmpRectF.right), (int)(0.5D + (double)inputmethodstate.mTmpRectF.bottom));
                inputmethodmanager.updateCursor(mTextView, inputmethodstate.mCursorRectInWindow.left, inputmethodstate.mCursorRectInWindow.top, inputmethodstate.mCursorRectInWindow.right, inputmethodstate.mCursorRectInWindow.bottom);
            }
        }
        if (mCorrectionHighlighter != null)
            mCorrectionHighlighter.draw(canvas, i);
        if (path != null && j == k && mCursorCount > 0)
        {
            drawCursor(canvas, i);
            path = null;
        }
        if (mTextView.canHaveDisplayList() && canvas.isHardwareAccelerated())
        {
            drawHardwareAccelerated(canvas, layout, path, paint, i);
            return;
        } else
        {
            layout.draw(canvas, path, paint, i);
            return;
        }
    }

    void onDrop(DragEvent dragevent)
    {
        StringBuilder stringbuilder = new StringBuilder("");
        ClipData clipdata = dragevent.getClipData();
        int i = clipdata.getItemCount();
        for (int j = 0; j < i; j++)
            stringbuilder.append(clipdata.getItemAt(j).coerceToStyledText(mTextView.getContext()));

        int k = mTextView.getOffsetForPosition(dragevent.getX(), dragevent.getY());
        Object obj = dragevent.getLocalState();
        boolean flag = obj instanceof DragLocalState;
        DragLocalState draglocalstate = null;
        if (flag)
            draglocalstate = (DragLocalState)obj;
        boolean flag1;
        if (draglocalstate != null && draglocalstate.sourceTextView == mTextView)
            flag1 = true;
        else
            flag1 = false;
        if (!flag1 || k < draglocalstate.start || k >= draglocalstate.end)
        {
            int l = mTextView.getText().length();
            long l1 = mTextView.prepareSpacesAroundPaste(k, k, stringbuilder);
            int i1 = TextUtils.unpackRangeStartFromLong(l1);
            int j1 = TextUtils.unpackRangeEndFromLong(l1);
            Selection.setSelection((Spannable)mTextView.getText(), j1);
            mTextView.replaceText_internal(i1, j1, stringbuilder);
            if (flag1)
            {
                int k1 = draglocalstate.start;
                int i2 = draglocalstate.end;
                if (j1 <= k1)
                {
                    int l2 = mTextView.getText().length() - l;
                    k1 += l2;
                    i2 += l2;
                }
                mTextView.deleteText_internal(k1, i2);
                if (k1 == 0)
                    k1++;
                else
                if (k1 == mTextView.length())
                    k1--;
                int j2 = Math.max(0, k1 - 1);
                int k2 = Math.min(mTextView.getText().length(), k1 + 1);
                if (k2 > j2 + 1)
                {
                    CharSequence charsequence = mTextView.getTransformedText(j2, k2);
                    if (Character.isSpaceChar(charsequence.charAt(0)) && Character.isSpaceChar(charsequence.charAt(1)))
                    {
                        mTextView.deleteText_internal(j2, j2 + 1);
                        return;
                    }
                }
            }
        }
    }

    void onFocusChanged(boolean flag, int i)
    {
        mShowCursor = SystemClock.uptimeMillis();
        ensureEndedBatchEdit();
        if (flag)
        {
            int l = mTextView.getSelectionStart();
            int i1 = mTextView.getSelectionEnd();
            boolean flag1;
            if (mSelectAllOnFocus && l == 0 && i1 == mTextView.getText().length())
                flag1 = true;
            else
                flag1 = false;
            boolean flag2;
            if (mFrozenWithFocus && mTextView.hasSelection() && !flag1)
                flag2 = true;
            else
                flag2 = false;
            mCreatedWithASelection = flag2;
            if (!mFrozenWithFocus || l < 0 || i1 < 0)
            {
                int j1 = getLastTapPosition();
                if (j1 >= 0)
                    Selection.setSelection((Spannable)mTextView.getText(), j1);
                MovementMethod movementmethod = mTextView.getMovementMethod();
                if (movementmethod != null)
                    movementmethod.onTakeFocus(mTextView, (Spannable)mTextView.getText(), i);
                if (((mTextView instanceof ExtractEditText) || mSelectionMoved) && l >= 0 && i1 >= 0)
                    Selection.setSelection((Spannable)mTextView.getText(), l, i1);
                if (mSelectAllOnFocus)
                    mTextView.selectAllText();
                mTouchFocusSelected = true;
            }
            mFrozenWithFocus = false;
            mSelectionMoved = false;
            if (mError != null)
                showError();
            makeBlink();
        } else
        {
            if (mError != null)
                hideError();
            mTextView.onEndBatchEdit();
            if (mTextView instanceof ExtractEditText)
            {
                int j = mTextView.getSelectionStart();
                int k = mTextView.getSelectionEnd();
                hideControllers();
                Selection.setSelection((Spannable)mTextView.getText(), j, k);
            } else
            {
                if (mTemporaryDetach)
                    mPreserveDetachedSelection = true;
                hideControllers();
                if (mTemporaryDetach)
                    mPreserveDetachedSelection = false;
                downgradeEasyCorrectionSpans();
            }
            if (mSelectionModifierCursorController != null)
            {
                mSelectionModifierCursorController.resetTouchOffsets();
                return;
            }
        }
    }

    void onLocaleChanged()
    {
        mWordIterator = null;
    }

    void onScreenStateChanged(int i)
    {
        switch (i)
        {
        case 0: // '\0'
            suspendBlink();
            return;

        case 1: // '\001'
            resumeBlink();
            return;
        }
    }

    void onScrollChanged()
    {
        if (mPositionListener != null)
            mPositionListener.onScrollChanged();
    }

    void onTouchEvent(MotionEvent motionevent)
    {
        if (hasSelectionController())
            getSelectionController().onTouchEvent(motionevent);
        if (mShowSuggestionRunnable != null)
        {
            mTextView.removeCallbacks(mShowSuggestionRunnable);
            mShowSuggestionRunnable = null;
        }
        if (motionevent.getActionMasked() == 0)
        {
            mLastDownPositionX = motionevent.getX();
            mLastDownPositionY = motionevent.getY();
            mTouchFocusSelected = false;
            mIgnoreActionUpEvent = false;
        }
    }

    void onTouchUpEvent(MotionEvent motionevent)
    {
        boolean flag;
        if (mSelectAllOnFocus && mTextView.didTouchFocusSelect())
            flag = true;
        else
            flag = false;
        hideControllers();
        CharSequence charsequence = mTextView.getText();
        if (!flag && charsequence.length() > 0)
        {
            int i = mTextView.getOffsetForPosition(motionevent.getX(), motionevent.getY());
            Selection.setSelection((Spannable)charsequence, i);
            if (mSpellChecker != null)
                mSpellChecker.onSelectionChanged();
            if (!extractedTextModeWillBeStarted())
                if (isCursorInsideEasyCorrectionSpan())
                {
                    mShowSuggestionRunnable = new Runnable() {

                        final Editor this$0;

                        public void run()
                        {
                            showSuggestions();
                        }

            
            {
                this$0 = Editor.this;
                super();
            }
                    }
;
                    mTextView.postDelayed(mShowSuggestionRunnable, ViewConfiguration.getDoubleTapTimeout());
                } else
                if (hasInsertionController())
                {
                    getInsertionController().show();
                    return;
                }
        }
    }

    void onWindowFocusChanged(boolean flag)
    {
        if (flag)
        {
            if (mBlink != null)
            {
                mBlink.uncancel();
                makeBlink();
            }
            return;
        }
        if (mBlink != null)
            mBlink.cancel();
        if (mInputContentType != null)
            mInputContentType.enterDown = false;
        if (!isSelectionActionModeOverflowMenuShowing())
            hideControllers();
        if (mSuggestionsPopupWindow != null)
            mSuggestionsPopupWindow.onParentLostFocus();
        ensureEndedBatchEdit();
    }

    public boolean performLongClick(boolean flag)
    {
        if (!flag && !isPositionOnText(mLastDownPositionX, mLastDownPositionY) && mInsertionControllerEnabled)
        {
            int k = mTextView.getOffsetForPosition(mLastDownPositionX, mLastDownPositionY);
            stopSelectionActionMode();
            Selection.setSelection((Spannable)mTextView.getText(), k);
            getInsertionController().showWithActionPopup();
            flag = true;
        }
        if (!flag && mSelectionActionMode != null)
        {
            if (touchPositionIsInSelection())
            {
                int i = mTextView.getSelectionStart();
                int j = mTextView.getSelectionEnd();
                CharSequence charsequence = mTextView.getTransformedText(i, j);
                ClipData clipdata = ClipData.newPlainText(null, charsequence);
                DragLocalState draglocalstate = new DragLocalState(mTextView, i, j);
                mTextView.startDrag(clipdata, getTextThumbnailBuilder(charsequence), draglocalstate, 0);
                stopSelectionActionMode();
            } else
            {
                getSelectionController().hide();
                selectCurrentWord();
                getSelectionController().show();
            }
            flag = true;
        }
        if (!flag)
            flag = startSelectionActionMode();
        return flag;
    }

    void prepareCursorControllers()
    {
        boolean flag = true;
        android.view.ViewGroup.LayoutParams layoutparams = mTextView.getRootView().getLayoutParams();
        boolean flag1 = layoutparams instanceof android.view.WindowManager.LayoutParams;
        boolean flag2 = false;
        if (flag1)
        {
            android.view.WindowManager.LayoutParams layoutparams1 = (android.view.WindowManager.LayoutParams)layoutparams;
            if (layoutparams1.type >= 1000 && layoutparams1.type <= 1999)
                flag2 = false;
            else
                flag2 = flag;
        }
        boolean flag3;
        if (flag2 && mTextView.getLayout() != null)
            flag3 = flag;
        else
            flag3 = false;
        boolean flag4;
        if (flag3 && isCursorVisible())
            flag4 = flag;
        else
            flag4 = false;
        mInsertionControllerEnabled = flag4;
        if (!flag3 || !mTextView.textCanBeSelected())
            flag = false;
        mSelectionControllerEnabled = flag;
        if (!mInsertionControllerEnabled)
        {
            hideInsertionPointCursorController();
            if (mInsertionPointCursorController != null)
            {
                mInsertionPointCursorController.onDetached();
                mInsertionPointCursorController = null;
            }
        }
        if (!mSelectionControllerEnabled)
        {
            stopSelectionActionMode();
            if (mSelectionModifierCursorController != null)
            {
                mSelectionModifierCursorController.onDetached();
                mSelectionModifierCursorController = null;
            }
        }
    }

    boolean reportExtractedText()
    {
        InputMethodState inputmethodstate = mInputMethodState;
        if (inputmethodstate != null)
        {
            boolean flag = inputmethodstate.mContentChanged;
            if (flag || inputmethodstate.mSelectionModeChanged)
            {
                inputmethodstate.mContentChanged = false;
                inputmethodstate.mSelectionModeChanged = false;
                ExtractedTextRequest extractedtextrequest = inputmethodstate.mExtractedTextRequest;
                if (extractedtextrequest != null)
                {
                    InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
                    if (inputmethodmanager != null)
                    {
                        if (inputmethodstate.mChangedStart < 0 && !flag)
                            inputmethodstate.mChangedStart = -2;
                        if (extractTextInternal(extractedtextrequest, inputmethodstate.mChangedStart, inputmethodstate.mChangedEnd, inputmethodstate.mChangedDelta, inputmethodstate.mExtractedText))
                        {
                            inputmethodmanager.updateExtractedText(mTextView, extractedtextrequest.token, inputmethodstate.mExtractedText);
                            inputmethodstate.mChangedStart = -1;
                            inputmethodstate.mChangedEnd = -1;
                            inputmethodstate.mChangedDelta = 0;
                            inputmethodstate.mContentChanged = false;
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }

    boolean selectCurrentWordP()
    {
        return selectCurrentWord();
    }

    void sendOnTextChanged(int i, int j)
    {
        updateSpellCheckSpans(i, i + j, false);
        hideCursorControllers();
    }

    public void setError(CharSequence charsequence, Drawable drawable)
    {
        mError = TextUtils.stringOrSpannedString(charsequence);
        mErrorWasChanged = true;
        if (mError == null)
        {
            setErrorIcon(null);
            if (mErrorPopup != null)
            {
                if (mErrorPopup.isShowing())
                    mErrorPopup.dismiss();
                mErrorPopup = null;
            }
        } else
        {
            setErrorIcon(drawable);
            if (mTextView.isFocused())
            {
                showError();
                return;
            }
        }
    }

    void setFrame()
    {
        if (mErrorPopup != null)
        {
            TextView textview = (TextView)mErrorPopup.getContentView();
            chooseSize(mErrorPopup, mError, textview);
            mErrorPopup.update(mTextView, getErrorX(), getErrorY(), mErrorPopup.getWidth(), mErrorPopup.getHeight());
        }
    }

    void showSuggestions()
    {
        if (mSuggestionsPopupWindow == null)
            mSuggestionsPopupWindow = new SuggestionsPopupWindow();
        hideControllers();
        mSuggestionsPopupWindow.show();
    }

    boolean startSelectionActionMode()
    {
label0:
        {
            boolean flag1;
            if (mSelectionActionMode != null)
            {
                flag1 = false;
            } else
            {
                if (!canSelectText() || !mTextView.requestFocus())
                    break label0;
                if (!mTextView.hasSelection() && !selectCurrentWord())
                    return false;
                boolean flag = extractedTextModeWillBeStarted();
                if (!flag)
                {
                    SelectionActionModeCallback selectionactionmodecallback = new SelectionActionModeCallback();
                    mSelectionActionMode = mTextView.startActionMode(selectionactionmodecallback);
                }
                if (mSelectionActionMode == null && !flag)
                    flag1 = false;
                else
                    flag1 = true;
                if (flag1 && !mTextView.isTextSelectable() && mShowSoftInputOnFocus)
                {
                    InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
                    if (inputmethodmanager != null)
                    {
                        inputmethodmanager.showSoftInput(mTextView, 0, null);
                        return flag1;
                    }
                }
            }
            return flag1;
        }
        Log.w("TextView", "TextView does not support text selection. Action mode cancelled.");
        return false;
    }

    boolean startSelectionActionModeOnMenu()
    {
label0:
        {
            boolean flag1;
            if (mSelectionActionMode != null)
            {
                flag1 = false;
            } else
            {
                if (mTextView.mNotStartSelectionMode)
                    return false;
                if (!canSelectText() || !mTextView.requestFocus())
                    break label0;
                if (!mTextView.hasSelection() && !selectCurrentWordOnMenu())
                    return false;
                boolean flag = extractedTextModeWillBeStarted();
                if (!flag)
                {
                    SelectionActionModeCallback selectionactionmodecallback = new SelectionActionModeCallback();
                    mSelectionActionMode = mTextView.startActionMode(selectionactionmodecallback);
                }
                if (mSelectionActionMode == null && !flag)
                    flag1 = false;
                else
                    flag1 = true;
                if (flag1 && !mTextView.isTextSelectable() && mShowSoftInputOnFocus)
                {
                    InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
                    if (inputmethodmanager != null)
                    {
                        inputmethodmanager.showSoftInput(mTextView, 0, null);
                        return flag1;
                    }
                }
            }
            return flag1;
        }
        Log.w("TextView", "TextView does not support text selection. Action mode cancelled.");
        return false;
    }

    protected void stopSelectionActionMode()
    {
        if (mSelectionActionMode != null)
            mSelectionActionMode.finish();
    }

    void updateCursorsPositions()
    {
        if (mTextView.mCursorDrawableRes == 0)
        {
            mCursorCount = 0;
        } else
        {
            Layout layout = mTextView.getLayout();
            Layout layout1 = mTextView.getHintLayout();
            int i = mTextView.getSelectionStart();
            int j = layout.getLineForOffset(i);
            int k = layout.getLineTop(j);
            int l = layout.getLineTop(j + 1);
            int i1;
            if (layout.isLevelBoundary(i))
                i1 = 2;
            else
                i1 = 1;
            mCursorCount = i1;
            int j1 = l;
            if (mCursorCount == 2)
                j1 = k + l >> 1;
            updateCursorPosition(0, k, j1, getPrimaryHorizontal(layout, layout1, i));
            if (mCursorCount == 2)
            {
                updateCursorPosition(1, j1, l, layout.getSecondaryHorizontal(i));
                return;
            }
        }
    }

    static 
    {
        DRAG_SHADOW_MAX_TEXT_LENGTH = 20;
    }





/*
    static Rect access$1902(Editor editor, Rect rect)
    {
        editor.mTempRect = rect;
        return rect;
    }

*/







/*
    static Drawable access$2502(Editor editor, Drawable drawable)
    {
        editor.mSelectHandleCenter = drawable;
        return drawable;
    }

*/




/*
    static Drawable access$2702(Editor editor, Drawable drawable)
    {
        editor.mSelectHandleLeft = drawable;
        return drawable;
    }

*/



/*
    static Drawable access$2802(Editor editor, Drawable drawable)
    {
        editor.mSelectHandleRight = drawable;
        return drawable;
    }

*/




}
