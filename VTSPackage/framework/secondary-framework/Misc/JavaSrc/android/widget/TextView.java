// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.*;
import android.content.res.*;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.inputmethodservice.ExtractEditText;
import android.os.*;
import android.text.*;
import android.text.method.*;
import android.text.style.*;
import android.text.util.Linkify;
import android.util.*;
import android.view.*;
import android.view.accessibility.*;
import android.view.animation.AnimationUtils;
import android.view.inputmethod.*;
import android.view.textservice.SpellCheckerSubtype;
import android.view.textservice.TextServicesManager;
import com.android.internal.util.FastMath;
import com.android.internal.widget.EditableInputConnection;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.*;
import java.util.concurrent.locks.ReentrantLock;
import org.xmlpull.v1.XmlPullParserException;

// Referenced classes of package android.widget:
//            Editor, Scroller, SpellChecker

public class TextView extends View
    implements android.view.ViewTreeObserver.OnPreDrawListener
{
    public static final class BufferType extends Enum
    {

        private static final BufferType $VALUES[];
        public static final BufferType EDITABLE;
        public static final BufferType NORMAL;
        public static final BufferType SPANNABLE;

        public static BufferType valueOf(String s)
        {
            return (BufferType)Enum.valueOf(android/widget/TextView$BufferType, s);
        }

        public static BufferType[] values()
        {
            return (BufferType[])$VALUES.clone();
        }

        static 
        {
            NORMAL = new BufferType("NORMAL", 0);
            SPANNABLE = new BufferType("SPANNABLE", 1);
            EDITABLE = new BufferType("EDITABLE", 2);
            BufferType abuffertype[] = new BufferType[3];
            abuffertype[0] = NORMAL;
            abuffertype[1] = SPANNABLE;
            abuffertype[2] = EDITABLE;
            $VALUES = abuffertype;
        }

        private BufferType(String s, int i)
        {
            super(s, i);
        }
    }

    private static class CharWrapper
        implements CharSequence, GetChars, GraphicsOperations
    {

        private char mChars[];
        private int mLength;
        private int mStart;

        public char charAt(int i)
        {
            return mChars[i + mStart];
        }

        public void drawText(Canvas canvas, int i, int j, float f, float f1, Paint paint)
        {
            canvas.drawText(mChars, i + mStart, j - i, f, f1, paint);
        }

        public void drawTextRun(Canvas canvas, int i, int j, int k, int l, float f, float f1, 
                int i1, Paint paint)
        {
            int j1 = j - i;
            int k1 = l - k;
            canvas.drawTextRun(mChars, i + mStart, j1, k + mStart, k1, f, f1, i1, paint);
        }

        public void getChars(int i, int j, char ac[], int k)
        {
            if (i >= 0 && j >= 0 && i <= mLength && j <= mLength)
            {
                System.arraycopy(mChars, i + mStart, ac, k, j - i);
                return;
            } else
            {
                throw new IndexOutOfBoundsException((new StringBuilder()).append(i).append(", ").append(j).toString());
            }
        }

        public float getTextRunAdvances(int i, int j, int k, int l, int i1, float af[], int j1, 
                Paint paint)
        {
            int k1 = j - i;
            int l1 = l - k;
            return paint.getTextRunAdvances(mChars, i + mStart, k1, k + mStart, l1, i1, af, j1);
        }

        public float getTextRunAdvances(int i, int j, int k, int l, int i1, float af[], int j1, 
                Paint paint, int k1)
        {
            int l1 = j - i;
            int i2 = l - k;
            return paint.getTextRunAdvances(mChars, i + mStart, l1, k + mStart, i2, i1, af, j1, k1);
        }

        public int getTextRunCursor(int i, int j, int k, int l, int i1, Paint paint)
        {
            int j1 = j - i;
            return paint.getTextRunCursor(mChars, i + mStart, j1, k, l + mStart, i1);
        }

        public int getTextWidths(int i, int j, float af[], Paint paint)
        {
            return paint.getTextWidths(mChars, i + mStart, j - i, af);
        }

        public int length()
        {
            return mLength;
        }

        public float measureText(int i, int j, Paint paint)
        {
            return paint.measureText(mChars, i + mStart, j - i);
        }

        void set(char ac[], int i, int j)
        {
            mChars = ac;
            mStart = i;
            mLength = j;
        }

        public CharSequence subSequence(int i, int j)
        {
            if (i >= 0 && j >= 0 && i <= mLength && j <= mLength)
                return new String(mChars, i + mStart, j - i);
            else
                throw new IndexOutOfBoundsException((new StringBuilder()).append(i).append(", ").append(j).toString());
        }

        public String toString()
        {
            return new String(mChars, mStart, mLength);
        }


/*
        static char[] access$002(CharWrapper charwrapper, char ac[])
        {
            charwrapper.mChars = ac;
            return ac;
        }

*/

        public CharWrapper(char ac[], int i, int j)
        {
            mChars = ac;
            mStart = i;
            mLength = j;
        }
    }

    static class Drawables
    {

        static final int DRAWABLE_LEFT = 1;
        static final int DRAWABLE_NONE = -1;
        static final int DRAWABLE_RIGHT;
        final Rect mCompoundRect = new Rect();
        Drawable mDrawableBottom;
        Drawable mDrawableEnd;
        Drawable mDrawableError;
        int mDrawableHeightEnd;
        int mDrawableHeightError;
        int mDrawableHeightLeft;
        int mDrawableHeightRight;
        int mDrawableHeightStart;
        int mDrawableHeightTemp;
        Drawable mDrawableLeft;
        int mDrawablePadding;
        Drawable mDrawableRight;
        int mDrawableSaved;
        int mDrawableSizeBottom;
        int mDrawableSizeEnd;
        int mDrawableSizeError;
        int mDrawableSizeLeft;
        int mDrawableSizeRight;
        int mDrawableSizeStart;
        int mDrawableSizeTemp;
        int mDrawableSizeTop;
        Drawable mDrawableStart;
        Drawable mDrawableTemp;
        Drawable mDrawableTop;
        int mDrawableWidthBottom;
        int mDrawableWidthTop;

        private void applyErrorDrawableIfNeeded(int i)
        {
            switch (mDrawableSaved)
            {
            case 0: // '\0'
                mDrawableRight = mDrawableTemp;
                mDrawableSizeRight = mDrawableSizeTemp;
                mDrawableHeightRight = mDrawableHeightTemp;
                break;

            case 1: // '\001'
                mDrawableLeft = mDrawableTemp;
                mDrawableSizeLeft = mDrawableSizeTemp;
                mDrawableHeightLeft = mDrawableHeightTemp;
                break;
            }
            if (mDrawableError != null)
                switch (i)
                {
                case 1: // '\001'
                    mDrawableSaved = 1;
                    mDrawableTemp = mDrawableLeft;
                    mDrawableSizeTemp = mDrawableSizeLeft;
                    mDrawableHeightTemp = mDrawableHeightLeft;
                    mDrawableLeft = mDrawableError;
                    mDrawableSizeLeft = mDrawableSizeError;
                    mDrawableHeightLeft = mDrawableHeightError;
                    return;

                default:
                    mDrawableSaved = 0;
                    mDrawableTemp = mDrawableRight;
                    mDrawableSizeTemp = mDrawableSizeRight;
                    mDrawableHeightTemp = mDrawableHeightRight;
                    mDrawableRight = mDrawableError;
                    mDrawableSizeRight = mDrawableSizeError;
                    mDrawableHeightRight = mDrawableHeightError;
                    break;
                }
        }

        private void updateDrawablesLayoutDirection(int i)
        {
            if (mDrawableLeft != null)
                mDrawableLeft.setLayoutDirection(i);
            if (mDrawableRight != null)
                mDrawableRight.setLayoutDirection(i);
            if (mDrawableTop != null)
                mDrawableTop.setLayoutDirection(i);
            if (mDrawableBottom != null)
                mDrawableBottom.setLayoutDirection(i);
        }

        public void resolveWithLayoutDirection(int i)
        {
            switch (i)
            {
            case 1: // '\001'
                if (mDrawableStart != null)
                {
                    mDrawableRight = mDrawableStart;
                    mDrawableSizeRight = mDrawableSizeStart;
                    mDrawableHeightRight = mDrawableHeightStart;
                }
                if (mDrawableEnd != null)
                {
                    mDrawableLeft = mDrawableEnd;
                    mDrawableSizeLeft = mDrawableSizeEnd;
                    mDrawableHeightLeft = mDrawableHeightEnd;
                }
                break;

            default:
                if (mDrawableStart != null)
                {
                    mDrawableLeft = mDrawableStart;
                    mDrawableSizeLeft = mDrawableSizeStart;
                    mDrawableHeightLeft = mDrawableHeightStart;
                }
                if (mDrawableEnd != null)
                {
                    mDrawableRight = mDrawableEnd;
                    mDrawableSizeRight = mDrawableSizeEnd;
                    mDrawableHeightRight = mDrawableHeightEnd;
                }
                break;
            }
            applyErrorDrawableIfNeeded(i);
            updateDrawablesLayoutDirection(i);
        }

        public void setErrorDrawable(Drawable drawable, TextView textview)
        {
            if (mDrawableError != drawable && mDrawableError != null)
                mDrawableError.setCallback(null);
            mDrawableError = drawable;
            Rect rect = mCompoundRect;
            int ai[] = textview.getDrawableState();
            if (mDrawableError != null)
            {
                mDrawableError.setState(ai);
                mDrawableError.copyBounds(rect);
                mDrawableError.setCallback(textview);
                mDrawableSizeError = rect.width();
                mDrawableHeightError = rect.height();
                return;
            } else
            {
                mDrawableHeightError = 0;
                mDrawableSizeError = 0;
                return;
            }
        }

        Drawables()
        {
            mDrawableSaved = -1;
        }
    }

    private static final class Marquee extends Handler
    {

        private static final int MARQUEE_DELAY = 1200;
        private static final float MARQUEE_DELTA_MAX = 0.07F;
        private static final int MARQUEE_PIXELS_PER_SECOND = 30;
        private static final int MARQUEE_RESOLUTION = 33;
        private static final int MARQUEE_RESTART_DELAY = 1200;
        private static final byte MARQUEE_RUNNING = 2;
        private static final byte MARQUEE_STARTING = 1;
        private static final byte MARQUEE_STOPPED = 0;
        private static final int MESSAGE_RESTART = 3;
        private static final int MESSAGE_START = 1;
        private static final int MESSAGE_TICK = 2;
        private float mFadeStop;
        private float mGhostOffset;
        private float mGhostStart;
        private float mMaxFadeScroll;
        private float mMaxScroll;
        private int mRepeatLimit;
        private float mScroll;
        private final float mScrollUnit;
        private byte mStatus;
        private final WeakReference mView;

        private void resetScroll()
        {
            mScroll = 0.0F;
            TextView textview = (TextView)mView.get();
            if (textview != null)
                textview.invalidate();
        }

        float getGhostOffset()
        {
            return mGhostOffset;
        }

        float getMaxFadeScroll()
        {
            return mMaxFadeScroll;
        }

        float getScroll()
        {
            return mScroll;
        }

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 3: // '\003'
                if (mStatus == 2)
                {
                    if (mRepeatLimit >= 0)
                        mRepeatLimit = -1 + mRepeatLimit;
                    start(mRepeatLimit);
                    return;
                }
                // fall through

            default:
                return;

            case 2: // '\002'
                tick();
                return;

            case 1: // '\001'
                mStatus = 2;
                tick();
                return;
            }
        }

        boolean isRunning()
        {
            return mStatus == 2;
        }

        boolean isStopped()
        {
            return mStatus == 0;
        }

        boolean shouldDrawGhost()
        {
            return mStatus == 2 && mScroll > mGhostStart;
        }

        boolean shouldDrawLeftFade()
        {
            return mScroll <= mFadeStop;
        }

        void start(int i)
        {
            if (i == 0)
            {
                stop();
            } else
            {
                mRepeatLimit = i;
                TextView textview = (TextView)mView.get();
                if (textview != null && textview.mLayout != null)
                {
                    mStatus = 1;
                    mScroll = 0.0F;
                    int j = textview.getWidth() - textview.getCompoundPaddingLeft() - textview.getCompoundPaddingRight();
                    float f = textview.mLayout.getLineWidth(0);
                    float f1 = (float)j / 3F;
                    mGhostStart = f1 + (f - (float)j);
                    mMaxScroll = mGhostStart + (float)j;
                    mGhostOffset = f + f1;
                    mFadeStop = f + (float)j / 6F;
                    mMaxFadeScroll = f + (f + mGhostStart);
                    if ((7 & textview.getGravity()) == 5)
                        mGhostStart = f1;
                    textview.invalidate();
                    sendEmptyMessageDelayed(1, 1200L);
                    return;
                }
            }
        }

        void stop()
        {
            mStatus = 0;
            removeMessages(1);
            removeMessages(3);
            removeMessages(2);
            resetScroll();
        }

        void tick()
        {
            if (mStatus == 2)
            {
                removeMessages(2);
                TextView textview = (TextView)mView.get();
                if (textview != null && (textview.isFocused() || textview.isSelected()))
                {
                    mScroll = mScroll + mScrollUnit;
                    if (mScroll > mMaxScroll)
                    {
                        mScroll = mMaxScroll;
                        sendEmptyMessageDelayed(3, 1200L);
                    } else
                    {
                        sendEmptyMessageDelayed(2, 33L);
                    }
                    textview.invalidate();
                    return;
                }
            }
        }

        Marquee(TextView textview)
        {
            mStatus = 0;
            mScrollUnit = (30F * textview.getContext().getResources().getDisplayMetrics().density) / 33F;
            mView = new WeakReference(textview);
        }
    }

    public static interface OnEditorActionListener
    {

        public abstract boolean onEditorAction(TextView textview, int i, KeyEvent keyevent);
    }

    public static class SavedState extends android.view.View.BaseSavedState
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
        CharSequence error;
        boolean frozenWithFocus;
        int selEnd;
        int selStart;
        CharSequence text;

        public String toString()
        {
            String s = (new StringBuilder()).append("TextView.SavedState{").append(Integer.toHexString(System.identityHashCode(this))).append(" start=").append(selStart).append(" end=").append(selEnd).toString();
            if (text != null)
                s = (new StringBuilder()).append(s).append(" text=").append(text).toString();
            return (new StringBuilder()).append(s).append("}").toString();
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            writeToParcel(parcel, i);
            parcel.writeInt(selStart);
            parcel.writeInt(selEnd);
            int j;
            if (frozenWithFocus)
                j = 1;
            else
                j = 0;
            parcel.writeInt(j);
            TextUtils.writeToParcel(text, parcel, i);
            if (error == null)
            {
                parcel.writeInt(0);
                return;
            } else
            {
                parcel.writeInt(1);
                TextUtils.writeToParcel(error, parcel, i);
                return;
            }
        }


        private SavedState(Parcel parcel)
        {
            super(parcel);
            selStart = parcel.readInt();
            selEnd = parcel.readInt();
            boolean flag;
            if (parcel.readInt() != 0)
                flag = true;
            else
                flag = false;
            frozenWithFocus = flag;
            text = (CharSequence)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
            if (parcel.readInt() != 0)
                error = (CharSequence)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        }


        SavedState(Parcelable parcelable)
        {
            super(parcelable);
        }
    }


    private static final int ANIMATED_SCROLL_GAP = 250;
    private static final int CHANGE_WATCHER_PRIORITY = 100;
    static final boolean DEBUG_EXTRACT = false;
    private static final int DECIMAL = 4;
    private static final Spanned EMPTY_SPANNED = new SpannedString("");
    private static final int EMS = 1;
    private static final int HIGHLIGHT_COLOR_DEFAULT = 0x6633b5e5;
    static final int ID_COPY = 0x1020021;
    static final int ID_CUT = 0x1020020;
    static final int ID_PASTE = 0x1020022;
    private static final int ID_SELECTION_MODE = 0x102002d;
    static final int ID_SELECT_ALL = 0x102001f;
    static long LAST_CUT_OR_COPY_TIME = 0L;
    private static final int LINES = 1;
    static final String LOG_TAG = "TextView";
    private static final int MARQUEE_FADE_NORMAL = 0;
    private static final int MARQUEE_FADE_SWITCH_SHOW_ELLIPSIS = 1;
    private static final int MARQUEE_FADE_SWITCH_SHOW_FADE = 2;
    private static final int MONOSPACE = 3;
    private static final int MULTILINE_STATE_SET[] = {
        0x101034d
    };
    private static final InputFilter NO_FILTERS[] = new InputFilter[0];
    private static final int PIXELS = 2;
    private static final int SANS = 1;
    private static final int SERIF = 2;
    private static final int SIGNED = 2;
    private static final RectF TEMP_RECTF = new RectF();
    private static final android.text.BoringLayout.Metrics UNKNOWN_BORING = new android.text.BoringLayout.Metrics();
    private static final int VERY_WIDE = 0x100000;
    private boolean mAllowTransformationLengthChange;
    private int mAutoLinkMask;
    private android.text.BoringLayout.Metrics mBoring;
    private BufferType mBufferType;
    private ChangeWatcher mChangeWatcher;
    private CharWrapper mCharWrapper;
    private int mCurHintTextColor;
    private int mCurTextColor;
    private volatile Locale mCurrentTextServicesLocaleCache;
    private final ReentrantLock mCurrentTextServicesLocaleLock;
    int mCursorDrawableRes;
    private int mDeferScroll;
    private int mDesiredHeightAtMeasure;
    private boolean mDispatchTemporaryDetach;
    Drawables mDrawables;
    private android.text.Editable.Factory mEditableFactory;
    private Editor mEditor;
    private android.text.TextUtils.TruncateAt mEllipsize;
    private InputFilter mFilters[];
    private boolean mFreezesText;
    private int mGravity;
    int mHighlightColor;
    private final Paint mHighlightPaint;
    private Path mHighlightPath;
    private boolean mHighlightPathBogus;
    private CharSequence mHint;
    private android.text.BoringLayout.Metrics mHintBoring;
    private Layout mHintLayout;
    private ColorStateList mHintTextColor;
    private boolean mHorizontallyScrolling;
    private boolean mIncludePad;
    private boolean mInternalDiscardNextActionUp;
    private int mLastLayoutDirection;
    private long mLastScroll;
    private Layout mLayout;
    private android.text.Layout.Alignment mLayoutAlignment;
    private ColorStateList mLinkTextColor;
    private boolean mLinksClickable;
    private ArrayList mListeners;
    private Marquee mMarquee;
    private int mMarqueeFadeMode;
    private int mMarqueeRepeatLimit;
    private int mMaxMode;
    private int mMaxWidth;
    private int mMaxWidthMode;
    private int mMaximum;
    private int mMinMode;
    private int mMinWidth;
    private int mMinWidthMode;
    private int mMinimum;
    private MovementMethod mMovement;
    boolean mNotStartSelectionMode;
    private int mOldMaxMode;
    private int mOldMaximum;
    boolean mPopupMenuShow;
    private boolean mPreDrawRegistered;
    private int mResolvedTextAlignment;
    private boolean mRestartMarquee;
    private BoringLayout mSavedHintLayout;
    private BoringLayout mSavedLayout;
    private Layout mSavedMarqueeModeLayout;
    private Scroller mScroller;
    private final int mSelectionDraggedOfffset;
    private float mShadowDx;
    private float mShadowDy;
    private float mShadowRadius;
    boolean mShowInputMethodActionPopup;
    private boolean mSingleLine;
    private float mSpacingAdd;
    private float mSpacingMult;
    private android.text.Spannable.Factory mSpannableFactory;
    private Rect mTempRect;
    private boolean mTemporaryDetach;
    private CharSequence mText;
    android.view.View.OnClickListener mTextClickListener;
    private ColorStateList mTextColor;
    private TextDirectionHeuristic mTextDir;
    int mTextEditSuggestionItemLayout;
    private final TextPaint mTextPaint;
    int mTextSelectHandleLeftRes;
    int mTextSelectHandleRes;
    int mTextSelectHandleRightRes;
    private boolean mTextViewDiscardNextActionUp;
    private TransformationMethod mTransformation;
    private CharSequence mTransformed;
    boolean mUseYlSelectionMode;
    private boolean mUserSetTextScaleX;
    boolean mYlCursorVisible;
    boolean mYlHandWriteOpened;

    public TextView(Context context)
    {
        TextView(context, null);
    }

    public TextView(Context context, AttributeSet attributeset)
    {
        TextView(context, attributeset, 0x1010084);
    }

    public TextView(Context context, AttributeSet attributeset, int i)
    {
        int j;
        int k;
        int l;
        android.content.res.Resources.Theme theme;
        TypedArray typedarray1;
        boolean flag;
        String s;
        ColorStateList colorstatelist;
        int j1;
        ColorStateList colorstatelist1;
        ColorStateList colorstatelist2;
        int k6;
        int l6;
        View(context, attributeset, i);
        mEditableFactory = android.text.Editable.Factory.getInstance();
        mSpannableFactory = android.text.Spannable.Factory.getInstance();
        mMarqueeRepeatLimit = 3;
        mLastLayoutDirection = -1;
        mMarqueeFadeMode = 0;
        mBufferType = BufferType.NORMAL;
        mGravity = 0x800033;
        mLinksClickable = true;
        mSpacingMult = 1.0F;
        mSpacingAdd = 0.0F;
        mMaximum = 0x7fffffff;
        mMaxMode = 1;
        mMinimum = 0;
        mMinMode = 1;
        mOldMaximum = mMaximum;
        mOldMaxMode = mMaxMode;
        mMaxWidth = 0x7fffffff;
        mMaxWidthMode = 2;
        mMinWidth = 0;
        mMinWidthMode = 2;
        mDesiredHeightAtMeasure = -1;
        mIncludePad = true;
        mDeferScroll = -1;
        mFilters = NO_FILTERS;
        mCurrentTextServicesLocaleLock = new ReentrantLock();
        mHighlightColor = 0x6633b5e5;
        mHighlightPathBogus = true;
        mPopupMenuShow = false;
        mInternalDiscardNextActionUp = false;
        mTextViewDiscardNextActionUp = false;
        mUseYlSelectionMode = false;
        mYlCursorVisible = false;
        mNotStartSelectionMode = false;
        mShowInputMethodActionPopup = true;
        mYlHandWriteOpened = false;
        mSelectionDraggedOfffset = 150;
        mText = "";
        Resources resources = getResources();
        CompatibilityInfo compatibilityinfo = resources.getCompatibilityInfo();
        mTextPaint = new TextPaint(1);
        mTextPaint.density = resources.getDisplayMetrics().density;
        mTextPaint.setCompatibilityScaling(compatibilityinfo.applicationScale);
        mHighlightPaint = new Paint(1);
        mHighlightPaint.setCompatibilityScaling(compatibilityinfo.applicationScale);
        mMovement = getDefaultMovementMethod();
        mTransformation = null;
        j = 15;
        k = -1;
        l = -1;
        theme = context.getTheme();
        TypedArray typedarray = theme.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.TextViewAppearance, i, 0);
        int i1 = typedarray.getResourceId(0, -1);
        typedarray.recycle();
        typedarray1 = null;
        if (i1 != -1)
            typedarray1 = theme.obtainStyledAttributes(i1, com.android.internal.R.styleable.TextAppearance);
        flag = false;
        s = null;
        colorstatelist = null;
        j1 = 0;
        colorstatelist1 = null;
        colorstatelist2 = null;
        if (typedarray1 == null)
            break MISSING_BLOCK_LABEL_602;
        k6 = typedarray1.getIndexCount();
        l6 = 0;
_L12:
        int i7;
        if (l6 >= k6)
            break MISSING_BLOCK_LABEL_597;
        i7 = typedarray1.getIndex(l6);
        i7;
        JVM INSTR tableswitch 0 8: default 476
    //                   0 532
    //                   1 546
    //                   2 571
    //                   3 496
    //                   4 482
    //                   5 508
    //                   6 520
    //                   7 584
    //                   8 559;
           goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8 _L9 _L10
_L9:
        break MISSING_BLOCK_LABEL_584;
_L1:
        break; /* Loop/switch isn't completed */
_L6:
        break; /* Loop/switch isn't completed */
_L13:
        l6++;
        if (true) goto _L12; else goto _L11
_L11:
        j1 = typedarray1.getColor(i7, j1);
          goto _L13
_L5:
        colorstatelist = typedarray1.getColorStateList(i7);
          goto _L13
_L7:
        colorstatelist1 = typedarray1.getColorStateList(i7);
          goto _L13
_L8:
        colorstatelist2 = typedarray1.getColorStateList(i7);
          goto _L13
_L2:
        j = typedarray1.getDimensionPixelSize(i7, j);
          goto _L13
_L3:
        k = typedarray1.getInt(i7, -1);
          goto _L13
_L10:
        s = typedarray1.getString(i7);
          goto _L13
_L4:
        l = typedarray1.getInt(i7, -1);
          goto _L13
        flag = typedarray1.getBoolean(i7, false);
          goto _L13
        typedarray1.recycle();
        boolean flag1;
        CharSequence charsequence;
        int k1;
        CharSequence charsequence1;
        boolean flag2;
        boolean flag3;
        int l1;
        int i2;
        boolean flag4;
        Drawable drawable;
        Drawable drawable1;
        Drawable drawable2;
        Drawable drawable3;
        Drawable drawable4;
        Drawable drawable5;
        int j2;
        int k2;
        boolean flag5;
        int l2;
        Object obj;
        CharSequence charsequence2;
        int i3;
        float f;
        float f1;
        float f2;
        boolean flag6;
        int j3;
        TypedArray typedarray2;
        int k3;
        int l3;
        flag1 = getDefaultEditable();
        charsequence = null;
        k1 = 0;
        charsequence1 = null;
        flag2 = false;
        flag3 = false;
        l1 = -1;
        i2 = 0;
        flag4 = false;
        drawable = null;
        drawable1 = null;
        drawable2 = null;
        drawable3 = null;
        drawable4 = null;
        drawable5 = null;
        j2 = 0;
        k2 = -1;
        flag5 = false;
        l2 = -1;
        obj = "";
        charsequence2 = null;
        i3 = 0;
        f = 0.0F;
        f1 = 0.0F;
        f2 = 0.0F;
        flag6 = false;
        j3 = 0;
        typedarray2 = theme.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.TextView, i, 0);
        k3 = typedarray2.getIndexCount();
        l3 = 0;
_L87:
        int j6;
        if (l3 >= k3)
            break MISSING_BLOCK_LABEL_2173;
        j6 = typedarray2.getIndex(l3);
        j6;
        JVM INSTR tableswitch 0 75: default 1048
    //                   0 1709
    //                   1 1048
    //                   2 1777
    //                   3 1791
    //                   4 1805
    //                   5 1741
    //                   6 1727
    //                   7 1753
    //                   8 1765
    //                   9 1544
    //                   10 1472
    //                   11 1176
    //                   12 1191
    //                   13 1397
    //                   14 1307
    //                   15 1457
    //                   16 1367
    //                   17 1148
    //                   18 1499
    //                   19 1487
    //                   20 1627
    //                   21 1595
    //                   22 1292
    //                   23 1322
    //                   24 1337
    //                   25 1352
    //                   26 1382
    //                   27 1412
    //                   28 1427
    //                   29 1442
    //                   30 1511
    //                   31 1831
    //                   32 1530
    //                   33 1162
    //                   34 1576
    //                   35 1614
    //                   36 1657
    //                   37 1670
    //                   38 1683
    //                   39 1696
    //                   40 1080
    //                   41 1094
    //                   42 1106
    //                   43 1068
    //                   44 1134
    //                   45 1120
    //                   46 1054
    //                   47 1642
    //                   48 1218
    //                   49 1242
    //                   50 1206
    //                   51 1230
    //                   52 1278
    //                   53 1845
    //                   54 1865
    //                   55 1558
    //                   56 1883
    //                   57 2009
    //                   58 2023
    //                   59 1896
    //                   60 1937
    //                   61 1968
    //                   62 2085
    //                   63 2100
    //                   64 2115
    //                   65 1048
    //                   66 1048
    //                   67 2145
    //                   68 1048
    //                   69 1048
    //                   70 2070
    //                   71 2130
    //                   72 2160
    //                   73 1254
    //                   74 1266
    //                   75 1819;
           goto _L14 _L15 _L14 _L16 _L17 _L18 _L19 _L20 _L21 _L22 _L23 _L24 _L25 _L26 _L27 _L28 _L29 _L30 _L31 _L32 _L33 _L34 _L35 _L36 _L37 _L38 _L39 _L40 _L41 _L42 _L43 _L44 _L45 _L46 _L47 _L48 _L49 _L50 _L51 _L52 _L53 _L54 _L55 _L56 _L57 _L58 _L59 _L60 _L61 _L62 _L63 _L64 _L65 _L66 _L67 _L68 _L69 _L70 _L71 _L72 _L73 _L74 _L75 _L76 _L77 _L78 _L14 _L14 _L79 _L14 _L14 _L80 _L81 _L82 _L83 _L84 _L85
_L82:
        break MISSING_BLOCK_LABEL_2160;
_L14:
        break; /* Loop/switch isn't completed */
_L60:
        break; /* Loop/switch isn't completed */
_L88:
        l3++;
        if (true) goto _L87; else goto _L86
_L86:
        flag1 = typedarray2.getBoolean(j6, flag1);
          goto _L88
_L57:
        charsequence = typedarray2.getText(j6);
          goto _L88
_L54:
        k1 = typedarray2.getInt(j6, k1);
          goto _L88
_L55:
        charsequence1 = typedarray2.getText(j6);
          goto _L88
_L56:
        flag2 = typedarray2.getBoolean(j6, flag2);
          goto _L88
_L59:
        flag3 = typedarray2.getBoolean(j6, flag3);
          goto _L88
_L58:
        l1 = typedarray2.getInt(j6, l1);
          goto _L88
_L31:
        i2 = typedarray2.getInt(j6, i2);
          goto _L88
_L47:
        flag4 = typedarray2.getBoolean(j6, flag4);
          goto _L88
_L25:
        mAutoLinkMask = typedarray2.getInt(j6, 0);
          goto _L88
_L26:
        mLinksClickable = typedarray2.getBoolean(j6, true);
          goto _L88
_L64:
        drawable = typedarray2.getDrawable(j6);
          goto _L88
_L62:
        drawable1 = typedarray2.getDrawable(j6);
          goto _L88
_L65:
        drawable2 = typedarray2.getDrawable(j6);
          goto _L88
_L63:
        drawable3 = typedarray2.getDrawable(j6);
          goto _L88
_L83:
        drawable4 = typedarray2.getDrawable(j6);
          goto _L88
_L84:
        drawable5 = typedarray2.getDrawable(j6);
          goto _L88
_L66:
        j2 = typedarray2.getDimensionPixelSize(j6, j2);
          goto _L88
_L36:
        setMaxLines(typedarray2.getInt(j6, -1));
          goto _L88
_L28:
        setMaxHeight(typedarray2.getDimensionPixelSize(j6, -1));
          goto _L88
_L37:
        setLines(typedarray2.getInt(j6, -1));
          goto _L88
_L38:
        setHeight(typedarray2.getDimensionPixelSize(j6, -1));
          goto _L88
_L39:
        setMinLines(typedarray2.getInt(j6, -1));
          goto _L88
_L30:
        setMinHeight(typedarray2.getDimensionPixelSize(j6, -1));
          goto _L88
_L40:
        setMaxEms(typedarray2.getInt(j6, -1));
          goto _L88
_L27:
        setMaxWidth(typedarray2.getDimensionPixelSize(j6, -1));
          goto _L88
_L41:
        setEms(typedarray2.getInt(j6, -1));
          goto _L88
_L42:
        setWidth(typedarray2.getDimensionPixelSize(j6, -1));
          goto _L88
_L43:
        setMinEms(typedarray2.getInt(j6, -1));
          goto _L88
_L29:
        setMinWidth(typedarray2.getDimensionPixelSize(j6, -1));
          goto _L88
_L24:
        setGravity(typedarray2.getInt(j6, -1));
          goto _L88
_L33:
        charsequence2 = typedarray2.getText(j6);
          goto _L88
_L32:
        obj = typedarray2.getText(j6);
          goto _L88
_L44:
        if (typedarray2.getBoolean(j6, false))
            setHorizontallyScrolling(true);
          goto _L88
_L46:
        flag5 = typedarray2.getBoolean(j6, flag5);
          goto _L88
_L23:
        k2 = typedarray2.getInt(j6, k2);
          goto _L88
_L69:
        setMarqueeRepeatLimit(typedarray2.getInt(j6, mMarqueeRepeatLimit));
          goto _L88
_L48:
        if (!typedarray2.getBoolean(j6, true))
            setIncludeFontPadding(false);
          goto _L88
_L35:
        if (!typedarray2.getBoolean(j6, true))
            setCursorVisible(false);
          goto _L88
_L49:
        l2 = typedarray2.getInt(j6, -1);
          goto _L88
_L34:
        setTextScaleX(typedarray2.getFloat(j6, 1.0F));
          goto _L88
_L61:
        mFreezesText = typedarray2.getBoolean(j6, false);
          goto _L88
_L50:
        i3 = typedarray2.getInt(j6, 0);
          goto _L88
_L51:
        f = typedarray2.getFloat(j6, 0.0F);
          goto _L88
_L52:
        f1 = typedarray2.getFloat(j6, 0.0F);
          goto _L88
_L53:
        f2 = typedarray2.getFloat(j6, 0.0F);
          goto _L88
_L15:
        setEnabled(typedarray2.getBoolean(j6, isEnabled()));
          goto _L88
_L20:
        j1 = typedarray2.getColor(j6, j1);
          goto _L88
_L19:
        colorstatelist = typedarray2.getColorStateList(j6);
          goto _L88
_L21:
        colorstatelist1 = typedarray2.getColorStateList(j6);
          goto _L88
_L22:
        colorstatelist2 = typedarray2.getColorStateList(j6);
          goto _L88
_L16:
        j = typedarray2.getDimensionPixelSize(j6, j);
          goto _L88
_L17:
        k = typedarray2.getInt(j6, k);
          goto _L88
_L18:
        l = typedarray2.getInt(j6, l);
          goto _L88
_L85:
        s = typedarray2.getString(j6);
          goto _L88
_L45:
        flag6 = typedarray2.getBoolean(j6, flag6);
          goto _L88
_L67:
        mSpacingAdd = typedarray2.getDimensionPixelSize(j6, (int)mSpacingAdd);
          goto _L88
_L68:
        mSpacingMult = typedarray2.getFloat(j6, mSpacingMult);
          goto _L88
_L70:
        j3 = typedarray2.getInt(j6, 0);
          goto _L88
_L73:
        createEditorIfNeeded();
        mEditor.createInputContentTypeIfNeeded();
        mEditor.mInputContentType.imeOptions = typedarray2.getInt(j6, mEditor.mInputContentType.imeOptions);
          goto _L88
_L74:
        createEditorIfNeeded();
        mEditor.createInputContentTypeIfNeeded();
        mEditor.mInputContentType.imeActionLabel = typedarray2.getText(j6);
          goto _L88
_L75:
        createEditorIfNeeded();
        mEditor.createInputContentTypeIfNeeded();
        mEditor.mInputContentType.imeActionId = typedarray2.getInt(j6, mEditor.mInputContentType.imeActionId);
          goto _L88
_L71:
        setPrivateImeOptions(typedarray2.getString(j6));
          goto _L88
_L72:
        try
        {
            setInputExtras(typedarray2.getResourceId(j6, 0));
        }
        catch (XmlPullParserException xmlpullparserexception)
        {
            Log.w("TextView", "Failure reading input extras", xmlpullparserexception);
        }
        catch (IOException ioexception)
        {
            Log.w("TextView", "Failure reading input extras", ioexception);
        }
          goto _L88
_L80:
        mCursorDrawableRes = typedarray2.getResourceId(j6, 0);
          goto _L88
_L76:
        mTextSelectHandleLeftRes = typedarray2.getResourceId(j6, 0);
          goto _L88
_L77:
        mTextSelectHandleRightRes = typedarray2.getResourceId(j6, 0);
          goto _L88
_L78:
        mTextSelectHandleRes = typedarray2.getResourceId(j6, 0);
          goto _L88
_L81:
        mTextEditSuggestionItemLayout = typedarray2.getResourceId(j6, 0);
          goto _L88
_L79:
        setTextIsSelectable(typedarray2.getBoolean(j6, false));
          goto _L88
        flag = typedarray2.getBoolean(j6, false);
          goto _L88
        BufferType buffertype;
        TypedArray typedarray3;
        boolean flag10;
        boolean flag11;
        boolean flag12;
        int i5;
        int i6;
        typedarray2.recycle();
        buffertype = BufferType.EDITABLE;
        int i4 = 0xfff & j3;
        boolean flag7;
        boolean flag8;
        boolean flag9;
        int k4;
        int l4;
        InputFilter ainputfilter[];
        android.text.InputFilter.LengthFilter lengthfilter;
        Class class1;
        Editor editor2;
        if (i4 == 129)
            flag7 = true;
        else
            flag7 = false;
        if (i4 == 225)
            flag8 = true;
        else
            flag8 = false;
        if (i4 == 18)
            flag9 = true;
        else
            flag9 = false;
        if (charsequence == null) goto _L90; else goto _L89
_L89:
        try
        {
            class1 = Class.forName(charsequence.toString());
        }
        catch (ClassNotFoundException classnotfoundexception)
        {
            RuntimeException runtimeexception = new RuntimeException(classnotfoundexception);
            throw runtimeexception;
        }
        try
        {
            createEditorIfNeeded();
            mEditor.mKeyListener = (KeyListener)class1.newInstance();
        }
        catch (InstantiationException instantiationexception)
        {
            RuntimeException runtimeexception2 = new RuntimeException(instantiationexception);
            throw runtimeexception2;
        }
        catch (IllegalAccessException illegalaccessexception)
        {
            RuntimeException runtimeexception1 = new RuntimeException(illegalaccessexception);
            throw runtimeexception1;
        }
        editor2 = mEditor;
        if (j3 == 0) goto _L92; else goto _L91
_L91:
        i6 = j3;
_L105:
        try
        {
            editor2.mInputType = i6;
        }
        catch (IncompatibleClassChangeError incompatibleclasschangeerror)
        {
            mEditor.mInputType = 1;
        }
_L114:
        if (mEditor != null)
            mEditor.adjustInputType(flag6, flag7, flag8, flag9);
        if (flag4)
        {
            createEditorIfNeeded();
            mEditor.mSelectAllOnFocus = true;
            if (buffertype == BufferType.NORMAL)
                buffertype = BufferType.SPANNABLE;
        }
        setCompoundDrawablesWithIntrinsicBounds(drawable, drawable1, drawable2, drawable3);
        setRelativeDrawablesIfNeeded(drawable4, drawable5);
        setCompoundDrawablePadding(j2);
        setInputTypeSingleLine(flag5);
        applySingleLine(flag5, flag5, flag5);
        if (flag5 && getKeyListener() == null && k2 < 0)
            k2 = 3;
        k2;
        JVM INSTR tableswitch 1 4: default 2424
    //                   1 3291
    //                   2 3301
    //                   3 3311
    //                   4 3321;
           goto _L93 _L94 _L95 _L96 _L97
_L93:
        int j4;
        android.text.method.TextKeyListener.Capitalize capitalize;
        Editor editor;
        boolean flag13;
        boolean flag14;
        int j5;
        Editor editor1;
        int k5;
        int l5;
        if (colorstatelist == null)
            colorstatelist = ColorStateList.valueOf(0xff000000);
        setTextColor(colorstatelist);
        setHintTextColor(colorstatelist1);
        setLinkTextColor(colorstatelist2);
        if (j1 != 0)
            setThemeHighlightColor(j1);
        setRawTextSize(j);
        if (flag)
            setTransformationMethod(new AllCapsTransformationMethod(getContext()));
        if (flag6 || flag7 || flag8 || flag9)
        {
            setTransformationMethod(PasswordTransformationMethod.getInstance());
            k = 3;
        } else
        if (mEditor != null && (0xfff & mEditor.mInputType) == 129)
            k = 3;
        setTypefaceFromAttrs(s, k, l);
        if (i3 != 0)
            setShadowLayer(f2, f, f1, i3);
        if (l2 >= 0)
        {
            ainputfilter = new InputFilter[1];
            lengthfilter = new LengthFilter(l2);
            ainputfilter[0] = lengthfilter;
            setFilters(ainputfilter);
        } else
        {
            setFilters(NO_FILTERS);
        }
        setText(((CharSequence) (obj)), buffertype);
        if (charsequence2 != null)
            setHint(charsequence2);
        typedarray3 = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.View, i, 0);
        if (mMovement != null || getKeyListener() != null)
            flag10 = true;
        else
            flag10 = false;
        flag11 = flag10;
        flag12 = flag10;
        k4 = typedarray3.getIndexCount();
        l4 = 0;
_L104:
        if (l4 >= k4) goto _L99; else goto _L98
_L98:
        i5 = typedarray3.getIndex(l4);
        i5;
        JVM INSTR lookupswitch 3: default 2696
    //                   18: 3421
    //                   29: 3435
    //                   30: 3449;
           goto _L100 _L101 _L102 _L103
_L100:
        l4++;
          goto _L104
_L92:
        l5 = mEditor.mKeyListener.getInputType();
        i6 = l5;
          goto _L105
_L90:
        if (charsequence1 != null)
        {
            createEditorIfNeeded();
            mEditor.mKeyListener = DigitsKeyListener.getInstance(charsequence1.toString());
            editor1 = mEditor;
            if (j3 != 0)
                k5 = j3;
            else
                k5 = 1;
            editor1.mInputType = k5;
            continue; /* Loop/switch isn't completed */
        }
        if (j3 != 0)
        {
            setInputType(j3, true);
            if (!isMultilineInputType(j3))
                flag5 = true;
            else
                flag5 = false;
            continue; /* Loop/switch isn't completed */
        }
        if (flag2)
        {
            createEditorIfNeeded();
            mEditor.mKeyListener = DialerKeyListener.getInstance();
            mEditor.mInputType = 3;
            continue; /* Loop/switch isn't completed */
        }
        if (k1 != 0)
        {
            createEditorIfNeeded();
            editor = mEditor;
            if ((k1 & 2) != 0)
                flag13 = true;
            else
                flag13 = false;
            if ((k1 & 4) != 0)
                flag14 = true;
            else
                flag14 = false;
            editor.mKeyListener = DigitsKeyListener.getInstance(flag13, flag14);
            j5 = 2;
            if ((k1 & 2) != 0)
                j5 = 0x1000 | j5;
            if ((k1 & 4) != 0)
                j5 = 0x2000 | j5;
            mEditor.mInputType = j5;
            continue; /* Loop/switch isn't completed */
        }
        if (!flag3 && l1 == -1) goto _L107; else goto _L106
_L106:
        j4 = 1;
        l1;
        JVM INSTR tableswitch 1 3: default 3064
    //                   1 3099
    //                   2 3115
    //                   3 3131;
           goto _L108 _L109 _L110 _L111
_L108:
        capitalize = android.text.method.TextKeyListener.Capitalize.NONE;
_L112:
        createEditorIfNeeded();
        mEditor.mKeyListener = TextKeyListener.getInstance(flag3, capitalize);
        mEditor.mInputType = j4;
        continue; /* Loop/switch isn't completed */
_L109:
        capitalize = android.text.method.TextKeyListener.Capitalize.SENTENCES;
        j4 = 0x4000 | j4;
        continue; /* Loop/switch isn't completed */
_L110:
        capitalize = android.text.method.TextKeyListener.Capitalize.WORDS;
        j4 = 0x2000 | j4;
        continue; /* Loop/switch isn't completed */
_L111:
        capitalize = android.text.method.TextKeyListener.Capitalize.CHARACTERS;
        j4 = 0x1000 | j4;
        if (true) goto _L112; else goto _L107
_L107:
        if (isTextSelectable())
        {
            if (mEditor != null)
            {
                mEditor.mKeyListener = null;
                mEditor.mInputType = 0;
            }
            buffertype = BufferType.SPANNABLE;
            setMovementMethod(ArrowKeyMovementMethod.getInstance());
        } else
        if (flag1)
        {
            createEditorIfNeeded();
            mEditor.mKeyListener = TextKeyListener.getInstance();
            mEditor.mInputType = 1;
        } else
        {
            if (mEditor != null)
                mEditor.mKeyListener = null;
            switch (i2)
            {
            case 0: // '\0'
                buffertype = BufferType.NORMAL;
                break;

            case 1: // '\001'
                buffertype = BufferType.SPANNABLE;
                break;

            case 2: // '\002'
                buffertype = BufferType.EDITABLE;
                break;
            }
        }
        continue; /* Loop/switch isn't completed */
_L94:
        setEllipsize(android.text.TextUtils.TruncateAt.START);
          goto _L93
_L95:
        setEllipsize(android.text.TextUtils.TruncateAt.MIDDLE);
          goto _L93
_L96:
        setEllipsize(android.text.TextUtils.TruncateAt.END);
          goto _L93
_L97:
        if (ViewConfiguration.get(context).isFadingMarqueeEnabled())
        {
            setHorizontalFadingEdgeEnabled(true);
            mMarqueeFadeMode = 0;
        } else
        {
            setHorizontalFadingEdgeEnabled(false);
            mMarqueeFadeMode = 1;
        }
        setEllipsize(android.text.TextUtils.TruncateAt.MARQUEE);
          goto _L93
_L101:
        flag10 = typedarray3.getBoolean(i5, flag10);
          goto _L100
_L102:
        flag11 = typedarray3.getBoolean(i5, flag11);
          goto _L100
_L103:
        flag12 = typedarray3.getBoolean(i5, flag12);
          goto _L100
_L99:
        typedarray3.recycle();
        setFocusable(flag10);
        setClickable(flag11);
        setLongClickable(flag12);
        if (mEditor != null)
            mEditor.prepareCursorControllers();
        if (getImportantForAccessibility() == 0)
            setImportantForAccessibility(1);
        break; /* Loop/switch isn't completed */
        if (true) goto _L114; else goto _L113
_L113:
    }

    private void applySingleLine(boolean flag, boolean flag1, boolean flag2)
    {
        mSingleLine = flag;
        if (flag)
        {
            setLines(1);
            setHorizontallyScrolling(true);
            if (flag1)
                setTransformationMethod(SingleLineTransformationMethod.getInstance());
        } else
        {
            if (flag2)
                setMaxLines(0x7fffffff);
            setHorizontallyScrolling(false);
            if (flag1)
            {
                setTransformationMethod(null);
                return;
            }
        }
    }

    private void assumeLayout()
    {
        int i = super.mRight - super.mLeft - getCompoundPaddingLeft() - getCompoundPaddingRight();
        if (i < 1)
            i = 0;
        int j = i;
        if (mHorizontallyScrolling)
            i = 0x100000;
        makeNewLayout(i, j, UNKNOWN_BORING, UNKNOWN_BORING, j, false);
    }

    private boolean bringTextIntoView()
    {
        Layout layout;
        if (isShowingHint())
            layout = mHintLayout;
        else
            layout = mLayout;
        int i = 0x70 & mGravity;
        int j = 0;
        if (i == 80)
            j = -1 + layout.getLineCount();
        android.text.Layout.Alignment alignment = layout.getParagraphAlignment(j);
        int k = layout.getParagraphDirection(j);
        int l = super.mRight - super.mLeft - getCompoundPaddingLeft() - getCompoundPaddingRight();
        int i1 = super.mBottom - super.mTop - getExtendedPaddingTop() - getExtendedPaddingBottom();
        int j1 = layout.getHeight();
        if (alignment == android.text.Layout.Alignment.ALIGN_NORMAL)
        {
            if (k == 1)
                alignment = android.text.Layout.Alignment.ALIGN_LEFT;
            else
                alignment = android.text.Layout.Alignment.ALIGN_RIGHT;
        } else
        if (alignment == android.text.Layout.Alignment.ALIGN_OPPOSITE)
            if (k == 1)
                alignment = android.text.Layout.Alignment.ALIGN_RIGHT;
            else
                alignment = android.text.Layout.Alignment.ALIGN_LEFT;
        int k1;
        if (alignment == android.text.Layout.Alignment.ALIGN_CENTER)
        {
            int i2 = (int)FloatMath.floor(layout.getLineLeft(j));
            int j2 = (int)FloatMath.ceil(layout.getLineRight(j));
            if (j2 - i2 < l)
                k1 = (j2 + i2) / 2 - l / 2;
            else
            if (k < 0)
                k1 = j2 - l;
            else
                k1 = i2;
        } else
        if (alignment == android.text.Layout.Alignment.ALIGN_RIGHT)
            k1 = (int)FloatMath.ceil(layout.getLineRight(j)) - l;
        else
            k1 = (int)FloatMath.floor(layout.getLineLeft(j));
        int l1;
        if (j1 < i1)
            l1 = 0;
        else
        if ((0x70 & mGravity) == 80)
            l1 = j1 - i1;
        else
            l1 = 0;
        if (k1 == super.mScrollX && l1 == super.mScrollY)
        {
            return false;
        } else
        {
            scrollTo(k1, l1);
            return true;
        }
    }

    private boolean canMarquee()
    {
        boolean flag;
label0:
        {
            int i = super.mRight - super.mLeft - getCompoundPaddingLeft() - getCompoundPaddingRight();
            flag = false;
            if (i <= 0)
                break label0;
            if (mLayout.getLineWidth(0) <= (float)i)
            {
                int j = mMarqueeFadeMode;
                flag = false;
                if (j == 0)
                    break label0;
                Layout layout = mSavedMarqueeModeLayout;
                flag = false;
                if (layout == null)
                    break label0;
                int k = mSavedMarqueeModeLayout.getLineWidth(0) != (float)i;
                flag = false;
                if (k <= 0)
                    break label0;
            }
            flag = true;
        }
        return flag;
    }

    private boolean canSelectText()
    {
        return mText.length() != 0 && mEditor != null && mEditor.hasSelectionController();
    }

    private void checkForRelayout()
    {
label0:
        {
label1:
            {
                if (super.mLayoutParams.width == -2 && (mMaxWidthMode != mMinWidthMode || mMaxWidth != mMinWidth) || mHint != null && mHintLayout == null || super.mRight - super.mLeft - getCompoundPaddingLeft() - getCompoundPaddingRight() <= 0)
                    break label0;
                int i = mLayout.getHeight();
                int j = mLayout.getWidth();
                int k;
                if (mHintLayout == null)
                    k = 0;
                else
                    k = mHintLayout.getWidth();
                makeNewLayout(j, k, UNKNOWN_BORING, UNKNOWN_BORING, super.mRight - super.mLeft - getCompoundPaddingLeft() - getCompoundPaddingRight(), true);
                if (mEllipsize != android.text.TextUtils.TruncateAt.MARQUEE)
                {
                    if (super.mLayoutParams.height != -2 && super.mLayoutParams.height != -1)
                    {
                        invalidate();
                        return;
                    }
                    if (mLayout.getHeight() == i && (mHintLayout == null || mHintLayout.getHeight() == i))
                        break label1;
                }
                requestLayout();
                invalidate();
                return;
            }
            invalidate();
            return;
        }
        nullLayouts();
        requestLayout();
        invalidate();
    }

    private void checkForResize()
    {
        Layout layout = mLayout;
        boolean flag = false;
        if (layout != null)
        {
            int i = super.mLayoutParams.width;
            flag = false;
            if (i == -2)
            {
                flag = true;
                invalidate();
            }
            if (super.mLayoutParams.height == -2)
            {
                if (getDesiredHeight() != getHeight())
                    flag = true;
            } else
            if (super.mLayoutParams.height == -1 && mDesiredHeightAtMeasure >= 0 && getDesiredHeight() != mDesiredHeightAtMeasure)
                flag = true;
        }
        if (flag)
            requestLayout();
    }

    private boolean compressText(float f)
    {
        if (!isHardwareAccelerated() && f > 0.0F && mLayout != null && getLineCount() == 1 && !mUserSetTextScaleX && mTextPaint.getTextScaleX() == 1.0F)
        {
            float f1 = ((1.0F + mLayout.getLineWidth(0)) - f) / f;
            if (f1 > 0.0F && f1 <= 0.07F)
            {
                mTextPaint.setTextScaleX(1.0F - f1 - 0.005F);
                post(new Runnable() {

                    final TextView this$0;

                    public void run()
                    {
                        requestLayout();
                    }

            
            {
                this$0 = TextView.this;
                super();
            }
                }
);
                return true;
            }
        }
        return false;
    }

    private void convertFromViewportToContentCoordinates(Rect rect)
    {
        int i = viewportToContentHorizontalOffset();
        rect.left = i + rect.left;
        rect.right = i + rect.right;
        int j = viewportToContentVerticalOffset();
        rect.top = j + rect.top;
        rect.bottom = j + rect.bottom;
    }

    private void createEditorIfNeeded()
    {
        if (mEditor == null)
            mEditor = new Editor(this);
    }

    private static int desired(Layout layout)
    {
        int i = layout.getLineCount();
        CharSequence charsequence = layout.getText();
        float f = 0.0F;
        for (int j = 0; j < i - 1; j++)
            if (charsequence.charAt(-1 + layout.getLineEnd(j)) != '\n')
                return -1;

        for (int k = 0; k < i; k++)
            f = Math.max(f, layout.getLineWidth(k));

        return (int)FloatMath.ceil(f);
    }

    private int doKeyDown(int i, KeyEvent keyevent, KeyEvent keyevent1)
    {
        if (!isEnabled())
            return 0;
        i;
        JVM INSTR lookupswitch 4: default 52
    //                   4: 264
    //                   23: 224
    //                   61: 240
    //                   66: 125;
           goto _L1 _L2 _L3 _L4 _L5
_L1:
        if (mEditor == null || mEditor.mKeyListener == null) goto _L7; else goto _L6
_L6:
        boolean flag2;
        resetErrorChangedFlag();
        flag2 = true;
        if (keyevent1 == null) goto _L9; else goto _L8
_L8:
        boolean flag4;
        beginBatchEdit();
        flag4 = mEditor.mKeyListener.onKeyOther(this, (Editable)mText, keyevent1);
        hideErrorIfUnchanged();
        flag2 = false;
        if (flag4)
        {
            endBatchEdit();
            return -1;
        }
          goto _L10
_L5:
        if (!keyevent.hasNoModifiers()) goto _L1; else goto _L11
_L11:
        if (mEditor != null && mEditor.mInputContentType != null && mEditor.mInputContentType.onEditorActionListener != null && mEditor.mInputContentType.onEditorActionListener.onEditorAction(this, 0, keyevent))
        {
            mEditor.mInputContentType.enterDown = true;
            return -1;
        }
        if ((0x10 & keyevent.getFlags()) == 0 && !shouldAdvanceFocusOnEnter()) goto _L1; else goto _L12
_L12:
        return !hasOnClickListeners() ? -1 : 0;
_L3:
        if (!keyevent.hasNoModifiers() || !shouldAdvanceFocusOnEnter()) goto _L1; else goto _L13
_L13:
        return 0;
_L4:
        if (!keyevent.hasNoModifiers() && !keyevent.hasModifiers(1) || !shouldAdvanceFocusOnTab()) goto _L1; else goto _L14
_L14:
        return 0;
_L2:
        if (mEditor == null || mEditor.mSelectionActionMode == null) goto _L1; else goto _L15
_L15:
        stopSelectionActionMode();
        return -1;
        Exception exception;
        exception;
        endBatchEdit();
        throw exception;
        AbstractMethodError abstractmethoderror1;
        abstractmethoderror1;
_L10:
        endBatchEdit();
_L9:
        if (flag2)
        {
            beginBatchEdit();
            boolean flag3 = mEditor.mKeyListener.onKeyDown(this, (Editable)mText, i, keyevent);
            endBatchEdit();
            hideErrorIfUnchanged();
            if (flag3)
                return 1;
        }
_L7:
        if (mMovement == null || mLayout == null) goto _L17; else goto _L16
_L16:
        boolean flag;
        flag = true;
        if (keyevent1 == null)
            break MISSING_BLOCK_LABEL_403;
        boolean flag1 = mMovement.onKeyOther(this, (Spannable)mText, keyevent1);
        flag = false;
        if (flag1)
            return -1;
        break MISSING_BLOCK_LABEL_403;
        AbstractMethodError abstractmethoderror;
        abstractmethoderror;
        if (flag && mMovement.onKeyDown(this, (Spannable)mText, i, keyevent))
            return 2;
_L17:
        return 0;
    }

    private void fixFocusableAndClickableSettings()
    {
        if (mMovement == null && (mEditor == null || mEditor.mKeyListener == null))
        {
            setFocusable(false);
            setClickable(false);
            setLongClickable(false);
            return;
        } else
        {
            setFocusable(true);
            setClickable(true);
            setLongClickable(true);
            return;
        }
    }

    private int getBottomVerticalOffset(boolean flag)
    {
        int k;
        int l;
label0:
        {
            int i = 0x70 & mGravity;
            Layout layout = mLayout;
            if (!flag && mText.length() == 0 && mHintLayout != null)
                layout = mHintLayout;
            int j = 0;
            if (i != 80)
            {
                if (layout == mHintLayout)
                    k = getMeasuredHeight() - getCompoundPaddingTop() - getCompoundPaddingBottom();
                else
                    k = getMeasuredHeight() - getExtendedPaddingTop() - getExtendedPaddingBottom();
                l = layout.getHeight();
                j = 0;
                if (l < k)
                {
                    if (i != 48)
                        break label0;
                    j = k - l;
                }
            }
            return j;
        }
        return k - l >> 1;
    }

    private int getDesiredHeight()
    {
        boolean flag = true;
        int i = getDesiredHeight(mLayout, flag);
        Layout layout = mHintLayout;
        if (mEllipsize == null)
            flag = false;
        return Math.max(i, getDesiredHeight(layout, flag));
    }

    private int getDesiredHeight(Layout layout, boolean flag)
    {
        if (layout == null)
            return 0;
        int i = layout.getLineCount();
        int j = getCompoundPaddingTop() + getCompoundPaddingBottom();
        int k = layout.getLineTop(i);
        Drawables drawables = mDrawables;
        if (drawables != null)
            k = Math.max(Math.max(k, drawables.mDrawableHeightLeft), drawables.mDrawableHeightRight);
        int l = k + j;
        if (mMaxMode == 1)
        {
            if (flag && i > mMaximum)
            {
                int i1 = layout.getLineTop(mMaximum);
                if (drawables != null)
                    i1 = Math.max(Math.max(i1, drawables.mDrawableHeightLeft), drawables.mDrawableHeightRight);
                l = i1 + j;
                i = mMaximum;
            }
        } else
        {
            l = Math.min(l, mMaximum);
        }
        if (mMinMode == 1)
        {
            if (i < mMinimum)
                l += getLineHeight() * (mMinimum - i);
        } else
        {
            l = Math.max(l, mMinimum);
        }
        return Math.max(l, getSuggestedMinimumHeight());
    }

    private void getInterestingRect(Rect rect, int i)
    {
        convertFromViewportToContentCoordinates(rect);
        if (i == 0)
            rect.top = rect.top - getExtendedPaddingTop();
        if (i == -1 + mLayout.getLineCount())
            rect.bottom = rect.bottom + getExtendedPaddingBottom();
    }

    private android.text.Layout.Alignment getLayoutAlignment()
    {
        if (mLayoutAlignment == null)
        {
            mResolvedTextAlignment = getTextAlignment();
            switch (mResolvedTextAlignment)
            {
            case 6: // '\006'
                android.text.Layout.Alignment alignment1;
                if (getLayoutDirection() == 1)
                    alignment1 = android.text.Layout.Alignment.ALIGN_LEFT;
                else
                    alignment1 = android.text.Layout.Alignment.ALIGN_RIGHT;
                mLayoutAlignment = alignment1;
                break;

            case 5: // '\005'
                android.text.Layout.Alignment alignment;
                if (getLayoutDirection() == 1)
                    alignment = android.text.Layout.Alignment.ALIGN_RIGHT;
                else
                    alignment = android.text.Layout.Alignment.ALIGN_LEFT;
                mLayoutAlignment = alignment;
                break;

            case 4: // '\004'
                mLayoutAlignment = android.text.Layout.Alignment.ALIGN_CENTER;
                break;

            case 3: // '\003'
                mLayoutAlignment = android.text.Layout.Alignment.ALIGN_OPPOSITE;
                break;

            case 2: // '\002'
                mLayoutAlignment = android.text.Layout.Alignment.ALIGN_NORMAL;
                break;

            case 1: // '\001'
                switch (0x800007 & mGravity)
                {
                case 1: // '\001'
                    mLayoutAlignment = android.text.Layout.Alignment.ALIGN_CENTER;
                    break;

                case 5: // '\005'
                    mLayoutAlignment = android.text.Layout.Alignment.ALIGN_RIGHT;
                    break;

                case 3: // '\003'
                    mLayoutAlignment = android.text.Layout.Alignment.ALIGN_LEFT;
                    break;

                case 8388613: 
                    mLayoutAlignment = android.text.Layout.Alignment.ALIGN_OPPOSITE;
                    break;

                case 8388611: 
                    mLayoutAlignment = android.text.Layout.Alignment.ALIGN_NORMAL;
                    break;

                default:
                    mLayoutAlignment = android.text.Layout.Alignment.ALIGN_NORMAL;
                    break;
                }
                break;

            default:
                mLayoutAlignment = android.text.Layout.Alignment.ALIGN_NORMAL;
                break;
            }
        }
        return mLayoutAlignment;
    }

    private int getOffsetAtCoordinate(int i, float f)
    {
        float f1 = convertToLocalHorizontalCoordinate(f);
        return getLayout().getOffsetForHorizontal(i, f1);
    }

    public static int getTextColor(Context context, TypedArray typedarray, int i)
    {
        ColorStateList colorstatelist = getTextColors(context, typedarray);
        if (colorstatelist == null)
            return i;
        else
            return colorstatelist.getDefaultColor();
    }

    public static ColorStateList getTextColors(Context context, TypedArray typedarray)
    {
        ColorStateList colorstatelist = typedarray.getColorStateList(5);
        if (colorstatelist == null)
        {
            int i = typedarray.getResourceId(1, -1);
            if (i != -1)
            {
                TypedArray typedarray1 = context.obtainStyledAttributes(i, com.android.internal.R.styleable.TextAppearance);
                colorstatelist = typedarray1.getColorStateList(3);
                typedarray1.recycle();
            }
        }
        return colorstatelist;
    }

    private Path getUpdatedHighlightPath()
    {
        Paint paint;
        int i;
        int j;
label0:
        {
            Path path;
label1:
            {
                paint = mHighlightPaint;
                i = getSelectionStart();
                j = getSelectionEnd();
                MovementMethod movementmethod = mMovement;
                path = null;
                if (movementmethod == null)
                    break label1;
                if (!isFocused())
                {
                    boolean flag = isPressed();
                    path = null;
                    if (!flag)
                        break label1;
                }
                path = null;
                if (i < 0)
                    break label1;
                if (i != j)
                    break label0;
                boolean _tmp = mYlCursorVisible;
                Editor editor = mEditor;
                path = null;
                if (editor == null)
                    break label1;
                if (!mEditor.isCursorVisible())
                {
                    path = null;
                    if (false)
                        break label1;
                }
                int k = (SystemClock.uptimeMillis() - mEditor.mShowCursor) % 1000L != 500L;
                path = null;
                if (k < 0)
                {
                    if (mHighlightPathBogus)
                    {
                        if (mHighlightPath == null)
                            mHighlightPath = new Path();
                        mHighlightPath.reset();
                        mLayout.getCursorPath(i, mHighlightPath, mText);
                        mEditor.updateCursorsPositions();
                        mHighlightPathBogus = false;
                    }
                    paint.setColor(mCurTextColor);
                    paint.setStyle(android.graphics.Paint.Style.STROKE);
                    path = mHighlightPath;
                }
            }
            return path;
        }
        if (mHighlightPathBogus)
        {
            if (mHighlightPath == null)
                mHighlightPath = new Path();
            mHighlightPath.reset();
            mLayout.getSelectionPath(i, j, mHighlightPath);
            mHighlightPathBogus = false;
        }
        paint.setColor(mHighlightColor);
        paint.setStyle(android.graphics.Paint.Style.FILL);
        return mHighlightPath;
    }

    private boolean hasPasswordTransformationMethod()
    {
        return mTransformation instanceof PasswordTransformationMethod;
    }

    private void invalidateCursor(int i, int j, int k)
    {
        if (i >= 0 || j >= 0 || k >= 0)
            invalidateRegion(Math.min(Math.min(i, j), k), Math.max(Math.max(i, j), k), true);
    }

    private boolean isBringIntoView()
    {
        Layout layout = mLayout;
        boolean flag = false;
        if (layout != null)
        {
            CharSequence charsequence = mText;
            flag = false;
            if (charsequence != null)
            {
                boolean flag1 = isSingleLine();
                flag = false;
                if (flag1)
                {
                    boolean flag2 = mLayout.isSingleLineRtoL();
                    boolean flag3 = mLayout.getTextDirectionHeuristic().isRtl(mText.toString().toCharArray(), 0, mText.length());
                    flag = false;
                    if (flag2 != flag3)
                        flag = true;
                }
            }
        }
        return flag;
    }

    private static boolean isMultilineInputType(int i)
    {
        return (0x2000f & i) == 0x20001;
    }

    private static boolean isPasswordInputType(int i)
    {
        int j = i & 0xfff;
        return j == 129 || j == 225 || j == 18;
    }

    private boolean isShowingHint()
    {
        return TextUtils.isEmpty(mText) && !TextUtils.isEmpty(mHint);
    }

    private static boolean isVisiblePasswordInputType(int i)
    {
        return (i & 0xfff) == 145;
    }

    private Layout makeSingleLayout(int i, android.text.BoringLayout.Metrics metrics, int j, android.text.Layout.Alignment alignment, boolean flag, android.text.TextUtils.TruncateAt truncateat, boolean flag1)
    {
label0:
        {
            Object obj;
            if (mText instanceof Spannable)
            {
                CharSequence charsequence6 = mText;
                CharSequence charsequence7 = mTransformed;
                TextPaint textpaint6 = mTextPaint;
                TextDirectionHeuristic textdirectionheuristic2 = mTextDir;
                float f12 = mSpacingMult;
                float f13 = mSpacingAdd;
                boolean flag8 = mIncludePad;
                android.text.TextUtils.TruncateAt truncateat1;
                if (getKeyListener() == null)
                    truncateat1 = truncateat;
                else
                    truncateat1 = null;
                obj = new DynamicLayout(charsequence6, charsequence7, textpaint6, i, alignment, textdirectionheuristic2, f12, f13, flag8, truncateat1, j);
            } else
            {
                android.text.BoringLayout.Metrics metrics1 = UNKNOWN_BORING;
                if (metrics == metrics1)
                {
                    metrics = BoringLayout.isBoring(mTransformed, mTextPaint, mTextDir, mBoring);
                    if (metrics != null)
                        mBoring = metrics;
                }
                if (metrics == null)
                    break label0;
                if (metrics.width > i || truncateat != null && metrics.width > j)
                {
                    if (flag && metrics.width <= i)
                        if (flag1 && mSavedLayout != null)
                        {
                            BoringLayout boringlayout = mSavedLayout;
                            CharSequence charsequence3 = mTransformed;
                            TextPaint textpaint3 = mTextPaint;
                            float f6 = mSpacingMult;
                            float f7 = mSpacingAdd;
                            boolean flag5 = mIncludePad;
                            return boringlayout.replaceOrMake(charsequence3, textpaint3, i, alignment, f6, f7, metrics, flag5, truncateat, j);
                        } else
                        {
                            CharSequence charsequence2 = mTransformed;
                            TextPaint textpaint2 = mTextPaint;
                            float f4 = mSpacingMult;
                            float f5 = mSpacingAdd;
                            boolean flag4 = mIncludePad;
                            return BoringLayout.make(charsequence2, textpaint2, i, alignment, f4, f5, metrics, flag4, truncateat, j);
                        }
                    if (flag)
                    {
                        CharSequence charsequence1 = mTransformed;
                        int i1 = mTransformed.length();
                        TextPaint textpaint1 = mTextPaint;
                        TextDirectionHeuristic textdirectionheuristic1 = mTextDir;
                        float f2 = mSpacingMult;
                        float f3 = mSpacingAdd;
                        boolean flag3 = mIncludePad;
                        int j1;
                        if (mMaxMode == 1)
                            j1 = mMaximum;
                        else
                            j1 = 0x7fffffff;
                        return new StaticLayout(charsequence1, 0, i1, textpaint1, i, alignment, textdirectionheuristic1, f2, f3, flag3, truncateat, j, j1);
                    } else
                    {
                        return new StaticLayout(mTransformed, mTextPaint, i, alignment, mTextDir, mSpacingMult, mSpacingAdd, mIncludePad);
                    }
                }
                if (flag1 && mSavedLayout != null)
                {
                    BoringLayout boringlayout1 = mSavedLayout;
                    CharSequence charsequence5 = mTransformed;
                    TextPaint textpaint5 = mTextPaint;
                    float f10 = mSpacingMult;
                    float f11 = mSpacingAdd;
                    boolean flag7 = mIncludePad;
                    obj = boringlayout1.replaceOrMake(charsequence5, textpaint5, i, alignment, f10, f11, metrics, flag7);
                } else
                {
                    CharSequence charsequence4 = mTransformed;
                    TextPaint textpaint4 = mTextPaint;
                    float f8 = mSpacingMult;
                    float f9 = mSpacingAdd;
                    boolean flag6 = mIncludePad;
                    obj = BoringLayout.make(charsequence4, textpaint4, i, alignment, f8, f9, metrics, flag6);
                }
                if (flag1)
                {
                    mSavedLayout = (BoringLayout)obj;
                    return ((Layout) (obj));
                }
            }
            return ((Layout) (obj));
        }
        if (flag)
        {
            CharSequence charsequence = mTransformed;
            int k = mTransformed.length();
            TextPaint textpaint = mTextPaint;
            TextDirectionHeuristic textdirectionheuristic = mTextDir;
            float f = mSpacingMult;
            float f1 = mSpacingAdd;
            boolean flag2 = mIncludePad;
            int l;
            if (mMaxMode == 1)
                l = mMaximum;
            else
                l = 0x7fffffff;
            return new StaticLayout(charsequence, 0, k, textpaint, i, alignment, textdirectionheuristic, f, f1, flag2, truncateat, j, l);
        } else
        {
            return new StaticLayout(mTransformed, mTextPaint, i, alignment, mTextDir, mSpacingMult, mSpacingAdd, mIncludePad);
        }
    }

    private void nullLayouts()
    {
        if ((mLayout instanceof BoringLayout) && mSavedLayout == null)
            mSavedLayout = (BoringLayout)mLayout;
        if ((mHintLayout instanceof BoringLayout) && mSavedHintLayout == null)
            mSavedHintLayout = (BoringLayout)mHintLayout;
        mHintLayout = null;
        mLayout = null;
        mSavedMarqueeModeLayout = null;
        mHintBoring = null;
        mBoring = null;
        if (mEditor != null)
            mEditor.prepareCursorControllers();
    }

    private void paste(int i, int j)
    {
        ClipData clipdata = ((ClipboardManager)getContext().getSystemService("clipboard")).getPrimaryClip();
        if (clipdata != null)
        {
            boolean flag = false;
            for (int k = 0; k < clipdata.getItemCount(); k++)
            {
                CharSequence charsequence = clipdata.getItemAt(k).coerceToStyledText(getContext());
                if (charsequence == null)
                    continue;
                if (!flag)
                {
                    long l = prepareSpacesAroundPaste(i, j, charsequence);
                    i = TextUtils.unpackRangeStartFromLong(l);
                    j = TextUtils.unpackRangeEndFromLong(l);
                    Selection.setSelection((Spannable)mText, j);
                    ((Editable)mText).replace(i, j, charsequence);
                    flag = true;
                } else
                {
                    ((Editable)mText).insert(getSelectionEnd(), "\n");
                    ((Editable)mText).insert(getSelectionEnd(), charsequence);
                }
            }

            stopSelectionActionMode();
            LAST_CUT_OR_COPY_TIME = 0L;
        }
    }

    private void registerForPreDraw()
    {
        if (!mPreDrawRegistered)
        {
            getViewTreeObserver().addOnPreDrawListener(this);
            mPreDrawRegistered = true;
        }
    }

    private void removeIntersectingSpans(int i, int j, Class class1)
    {
        if (mText instanceof Editable)
        {
            Editable editable = (Editable)mText;
            Object aobj[] = editable.getSpans(i, j, class1);
            int k = aobj.length;
            int l = 0;
            do
            {
                if (l >= k)
                    break;
                int i1 = editable.getSpanStart(aobj[l]);
                if (editable.getSpanEnd(aobj[l]) == i || i1 == j)
                    break;
                editable.removeSpan(aobj[l]);
                l++;
            } while (true);
        }
    }

    static void removeParcelableSpans(Spannable spannable, int i, int j)
    {
        Object aobj[] = spannable.getSpans(i, j, android/text/ParcelableSpan);
        for (int k = aobj.length; k > 0;)
        {
            k--;
            spannable.removeSpan(aobj[k]);
        }

    }

    private void restartMarqueeIfNeeded()
    {
        if (mRestartMarquee && mEllipsize == android.text.TextUtils.TruncateAt.MARQUEE)
        {
            mRestartMarquee = false;
            startMarquee();
        }
    }

    private void sendBeforeTextChanged(CharSequence charsequence, int i, int j, int k)
    {
        if (mListeners != null)
        {
            ArrayList arraylist = mListeners;
            int l = arraylist.size();
            for (int i1 = 0; i1 < l; i1++)
                ((TextWatcher)arraylist.get(i1)).beforeTextChanged(charsequence, i, j, k);

        }
        removeIntersectingSpans(i, i + j, android/text/style/SpellCheckSpan);
        removeIntersectingSpans(i, i + j, android/text/style/SuggestionSpan);
    }

    private void setFilters(Editable editable, InputFilter ainputfilter[])
    {
        if (mEditor != null && (mEditor.mKeyListener instanceof InputFilter))
        {
            InputFilter ainputfilter1[] = new InputFilter[1 + ainputfilter.length];
            System.arraycopy(ainputfilter, 0, ainputfilter1, 0, ainputfilter.length);
            ainputfilter1[ainputfilter.length] = (InputFilter)mEditor.mKeyListener;
            editable.setFilters(ainputfilter1);
            return;
        } else
        {
            editable.setFilters(ainputfilter);
            return;
        }
    }

    private void setInputType(int i, boolean flag)
    {
        boolean flag1 = true;
        int j = i & 0xf;
        Object obj;
        if (j == flag1)
        {
            boolean flag3;
            if ((0x8000 & i) != 0)
                flag3 = flag1;
            else
                flag3 = false;
            android.text.method.TextKeyListener.Capitalize capitalize;
            if ((i & 0x1000) != 0)
                capitalize = android.text.method.TextKeyListener.Capitalize.CHARACTERS;
            else
            if ((i & 0x2000) != 0)
                capitalize = android.text.method.TextKeyListener.Capitalize.WORDS;
            else
            if ((i & 0x4000) != 0)
                capitalize = android.text.method.TextKeyListener.Capitalize.SENTENCES;
            else
                capitalize = android.text.method.TextKeyListener.Capitalize.NONE;
            obj = TextKeyListener.getInstance(flag3, capitalize);
        } else
        if (j == 2)
        {
            boolean flag2;
            if ((i & 0x1000) != 0)
                flag2 = flag1;
            else
                flag2 = false;
            if ((i & 0x2000) == 0)
                flag1 = false;
            obj = DigitsKeyListener.getInstance(flag2, flag1);
        } else
        if (j == 4)
            switch (i & 0xff0)
            {
            case 32: // ' '
                obj = TimeKeyListener.getInstance();
                break;

            case 16: // '\020'
                obj = DateKeyListener.getInstance();
                break;

            default:
                obj = DateTimeKeyListener.getInstance();
                break;
            }
        else
        if (j == 3)
            obj = DialerKeyListener.getInstance();
        else
            obj = TextKeyListener.getInstance();
        setRawInputType(i);
        if (flag)
        {
            createEditorIfNeeded();
            mEditor.mKeyListener = ((KeyListener) (obj));
            return;
        } else
        {
            setKeyListenerOnly(((KeyListener) (obj)));
            return;
        }
    }

    private void setInputTypeSingleLine(boolean flag)
    {
label0:
        {
            if (mEditor != null && (0xf & mEditor.mInputType) == 1)
            {
                if (!flag)
                    break label0;
                Editor editor1 = mEditor;
                editor1.mInputType = 0xfffdffff & editor1.mInputType;
            }
            return;
        }
        Editor editor = mEditor;
        editor.mInputType = 0x20000 | editor.mInputType;
    }

    private void setKeyListenerOnly(KeyListener keylistener)
    {
        if (mEditor != null || keylistener != null)
        {
            createEditorIfNeeded();
            if (mEditor.mKeyListener != keylistener)
            {
                mEditor.mKeyListener = keylistener;
                if (keylistener != null && !(mText instanceof Editable))
                    setText(mText);
                setFilters((Editable)mText, mFilters);
                return;
            }
        }
    }

    private void setOnTextClickListener(android.view.View.OnClickListener onclicklistener)
    {
        mTextClickListener = onclicklistener;
    }

    private void setPrimaryClip(ClipData clipdata)
    {
        ((ClipboardManager)getContext().getSystemService("clipboard")).setPrimaryClip(clipdata);
        LAST_CUT_OR_COPY_TIME = SystemClock.uptimeMillis();
    }

    private void setRawTextSize(float f)
    {
        if (f != mTextPaint.getTextSize())
        {
            mTextPaint.setTextSize(f);
            if (mLayout != null)
            {
                nullLayouts();
                requestLayout();
                invalidate();
            }
        }
    }

    private void setRelativeDrawablesIfNeeded(Drawable drawable, Drawable drawable1)
    {
        Drawables drawables;
label0:
        {
            boolean flag;
            if (drawable == null && drawable1 == null)
                flag = false;
            else
                flag = true;
            if (flag)
            {
                drawables = mDrawables;
                if (drawables == null)
                {
                    drawables = new Drawables();
                    mDrawables = drawables;
                }
                Rect rect = drawables.mCompoundRect;
                int ai[] = getDrawableState();
                if (drawable != null)
                {
                    drawable.setBounds(0, 0, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight());
                    drawable.setState(ai);
                    drawable.copyBounds(rect);
                    drawable.setCallback(this);
                    drawables.mDrawableStart = drawable;
                    drawables.mDrawableSizeStart = rect.width();
                    drawables.mDrawableHeightStart = rect.height();
                } else
                {
                    drawables.mDrawableHeightStart = 0;
                    drawables.mDrawableSizeStart = 0;
                }
                if (drawable1 == null)
                    break label0;
                drawable1.setBounds(0, 0, drawable1.getIntrinsicWidth(), drawable1.getIntrinsicHeight());
                drawable1.setState(ai);
                drawable1.copyBounds(rect);
                drawable1.setCallback(this);
                drawables.mDrawableEnd = drawable1;
                drawables.mDrawableSizeEnd = rect.width();
                drawables.mDrawableHeightEnd = rect.height();
            }
            return;
        }
        drawables.mDrawableHeightEnd = 0;
        drawables.mDrawableSizeEnd = 0;
    }

    private void setText(CharSequence charsequence, BufferType buffertype, boolean flag, int i)
    {
        if (charsequence == null)
            charsequence = "";
        if (!isSuggestionsEnabled())
            charsequence = removeSuggestionSpans(charsequence);
        if (!mUserSetTextScaleX)
            mTextPaint.setTextScaleX(1.0F);
        if ((charsequence instanceof Spanned) && ((Spanned)charsequence).getSpanStart(android.text.TextUtils.TruncateAt.MARQUEE) >= 0)
        {
            if (ViewConfiguration.get(super.mContext).isFadingMarqueeEnabled())
            {
                setHorizontalFadingEdgeEnabled(true);
                mMarqueeFadeMode = 0;
            } else
            {
                setHorizontalFadingEdgeEnabled(false);
                mMarqueeFadeMode = 1;
            }
            setEllipsize(android.text.TextUtils.TruncateAt.MARQUEE);
        }
        int j = mFilters.length;
        for (int k = 0; k < j; k++)
        {
            InputFilter inputfilter = mFilters[k];
            int j2 = charsequence.length();
            Spanned spanned = EMPTY_SPANNED;
            CharSequence charsequence2 = inputfilter.filter(charsequence, 0, j2, spanned, 0, 0);
            if (charsequence2 != null)
                charsequence = charsequence2;
        }

        if (flag)
            if (mText != null)
            {
                i = mText.length();
                CharSequence charsequence1 = mText;
                int i2 = charsequence.length();
                sendBeforeTextChanged(charsequence1, 0, i, i2);
            } else
            {
                sendBeforeTextChanged("", 0, 0, charsequence.length());
            }
        ArrayList arraylist = mListeners;
        boolean flag1 = false;
        if (arraylist != null)
        {
            int l1 = mListeners.size();
            flag1 = false;
            if (l1 != 0)
                flag1 = true;
        }
        BufferType buffertype1 = BufferType.EDITABLE;
        if (buffertype != buffertype1 && getKeyListener() == null && !flag1)
        {
            BufferType buffertype4 = BufferType.SPANNABLE;
            if (buffertype != buffertype4 && mMovement == null)
            {
                if (!(charsequence instanceof CharWrapper))
                    charsequence = TextUtils.stringOrSpannedString(charsequence);
            } else
            {
                charsequence = mSpannableFactory.newSpannable(charsequence);
            }
        } else
        {
            createEditorIfNeeded();
            Editable editable = mEditableFactory.newEditable(charsequence);
            charsequence = editable;
            setFilters(editable, mFilters);
            InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
            if (inputmethodmanager != null)
                inputmethodmanager.restartInput(this);
        }
        if (mAutoLinkMask != 0)
        {
            BufferType buffertype2 = BufferType.EDITABLE;
            Spannable spannable1;
            if (buffertype != buffertype2 && !(charsequence instanceof Spannable))
                spannable1 = mSpannableFactory.newSpannable(charsequence);
            else
                spannable1 = (Spannable)charsequence;
            int k1 = mAutoLinkMask;
            if (Linkify.addLinks(spannable1, k1))
            {
                charsequence = spannable1;
                BufferType buffertype3 = BufferType.EDITABLE;
                if (buffertype == buffertype3)
                    buffertype = BufferType.EDITABLE;
                else
                    buffertype = BufferType.SPANNABLE;
                mText = charsequence;
                if (mLinksClickable && !textCanBeSelected())
                    setMovementMethod(LinkMovementMethod.getInstance());
            }
        }
        mBufferType = buffertype;
        mText = charsequence;
        if (mTransformation == null)
            mTransformed = charsequence;
        else
            mTransformed = mTransformation.getTransformation(charsequence, this);
        int l = charsequence.length();
        if ((charsequence instanceof Spannable) && !mAllowTransformationLengthChange)
        {
            Spannable spannable = (Spannable)charsequence;
            ChangeWatcher achangewatcher[] = (ChangeWatcher[])spannable.getSpans(0, spannable.length(), android/widget/TextView$ChangeWatcher);
            int i1 = achangewatcher.length;
            for (int j1 = 0; j1 < i1; j1++)
                spannable.removeSpan(achangewatcher[j1]);

            if (mChangeWatcher == null)
                mChangeWatcher = new ChangeWatcher();
            spannable.setSpan(mChangeWatcher, 0, l, 0x640012);
            if (mEditor != null)
                mEditor.addSpanWatchers(spannable);
            if (mTransformation != null)
                spannable.setSpan(mTransformation, 0, l, 18);
            if (mMovement != null)
            {
                mMovement.initialize(this, (Spannable)charsequence);
                if (mEditor != null)
                    mEditor.mSelectionMoved = false;
            }
        }
        if (mLayout != null)
            checkForRelayout();
        sendOnTextChanged(charsequence, 0, i, l);
        onTextChanged(charsequence, 0, i, l);
        if (flag1)
            sendAfterTextChanged((Editable)charsequence);
        if (mEditor != null)
            mEditor.prepareCursorControllers();
    }

    private void setThemeHighlightColor(int i)
    {
        int j = super.mContext.getResources().getThemeHighlightColor();
        if (i == 0x6633b5e5 && j != 0)
        {
            setHighlightColor(j);
            return;
        } else
        {
            setHighlightColor(i);
            return;
        }
    }

    private void setTypefaceFromAttrs(String s, int i, int j)
    {
        Typeface typeface = null;
        if (s != null)
        {
            typeface = Typeface.create(s, j);
            if (typeface != null)
            {
                setTypeface(typeface);
                return;
            }
        }
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
        setTypeface(typeface, j);
    }

    private boolean shouldAdvanceFocusOnEnter()
    {
        if (getKeyListener() != null)
        {
            if (mSingleLine)
                return true;
            if (mEditor != null && (0xf & mEditor.mInputType) == 1)
            {
                int i = 0xff0 & mEditor.mInputType;
                if (i == 32 || i == 48)
                    return true;
            }
        }
        return false;
    }

    private boolean shouldAdvanceFocusOnTab()
    {
        boolean flag = true;
        if (getKeyListener() != null && !mSingleLine && mEditor != null && (0xf & mEditor.mInputType) == flag)
        {
            int i = 0xff0 & mEditor.mInputType;
            if (i == 0x40000 || i == 0x20000)
                flag = false;
        }
        return flag;
    }

    private boolean shouldSpeakPasswordsForAccessibility()
    {
        return android.provider.Settings.Secure.getInt(super.mContext.getContentResolver(), "speak_password", 0) == 1;
    }

    private void startMarquee()
    {
        if (getKeyListener() == null && !compressText(getWidth() - getCompoundPaddingLeft() - getCompoundPaddingRight()) && (mMarquee == null || mMarquee.isStopped()) && (isFocused() || isSelected()) && getLineCount() == 1 && canMarquee())
        {
            if (mMarqueeFadeMode == 1)
            {
                mMarqueeFadeMode = 2;
                Layout layout = mLayout;
                mLayout = mSavedMarqueeModeLayout;
                mSavedMarqueeModeLayout = layout;
                setHorizontalFadingEdgeEnabled(true);
                requestLayout();
                invalidate();
            }
            if (mMarquee == null)
                mMarquee = new Marquee(this);
            mMarquee.start(mMarqueeRepeatLimit);
            return;
        } else
        {
            return;
        }
    }

    private void startStopMarquee(boolean flag)
    {
label0:
        {
            if (mEllipsize == android.text.TextUtils.TruncateAt.MARQUEE)
            {
                if (!flag)
                    break label0;
                startMarquee();
            }
            return;
        }
        stopMarquee();
    }

    private void stopMarquee()
    {
        if (mMarquee != null && !mMarquee.isStopped())
            mMarquee.stop();
        if (mMarqueeFadeMode == 2)
        {
            mMarqueeFadeMode = 1;
            Layout layout = mSavedMarqueeModeLayout;
            mSavedMarqueeModeLayout = mLayout;
            mLayout = layout;
            setHorizontalFadingEdgeEnabled(false);
            requestLayout();
            invalidate();
        }
    }

    private void updateTextColors()
    {
        int i = mTextColor.getColorForState(getDrawableState(), 0);
        int j = mCurTextColor;
        boolean flag = false;
        if (i != j)
        {
            mCurTextColor = i;
            flag = true;
        }
        if (mLinkTextColor != null)
        {
            int l = mLinkTextColor.getColorForState(getDrawableState(), 0);
            if (l != mTextPaint.linkColor)
            {
                mTextPaint.linkColor = l;
                flag = true;
            }
        }
        if (mHintTextColor != null)
        {
            int k = mHintTextColor.getColorForState(getDrawableState(), 0);
            if (k != mCurHintTextColor && mText.length() == 0)
            {
                mCurHintTextColor = k;
                flag = true;
            }
        }
        if (flag)
        {
            if (mEditor != null)
                mEditor.invalidateTextDisplayList();
            invalidate();
        }
    }

    private void updateTextServicesLocaleAsync()
    {
        AsyncTask.execute(new Runnable() {

            final TextView this$0;

            public void run()
            {
                if (!mCurrentTextServicesLocaleLock.tryLock())
                    break MISSING_BLOCK_LABEL_30;
                updateTextServicesLocaleLocked();
                mCurrentTextServicesLocaleLock.unlock();
                return;
                Exception exception;
                exception;
                mCurrentTextServicesLocaleLock.unlock();
                throw exception;
            }

            
            {
                this$0 = TextView.this;
                super();
            }
        }
);
    }

    private void updateTextServicesLocaleLocked()
    {
        Locale locale = Locale.getDefault();
        SpellCheckerSubtype spellcheckersubtype = ((TextServicesManager)super.mContext.getSystemService("textservices")).getCurrentSpellCheckerSubtype(true);
        if (spellcheckersubtype != null)
            locale = SpellCheckerSubtype.constructLocaleFromString(spellcheckersubtype.getLocale());
        mCurrentTextServicesLocaleCache = locale;
    }

    public void addTextChangedListener(TextWatcher textwatcher)
    {
        if (mListeners == null)
            mListeners = new ArrayList();
        mListeners.add(textwatcher);
    }

    public final void append(CharSequence charsequence)
    {
        append(charsequence, 0, charsequence.length());
    }

    public void append(CharSequence charsequence, int i, int j)
    {
        if (!(mText instanceof Editable))
            setText(mText, BufferType.EDITABLE);
        ((Editable)mText).append(charsequence, i, j);
    }

    public void beginBatchEdit()
    {
        if (mEditor != null)
            mEditor.beginBatchEdit();
    }

    public boolean bringPointIntoView(int i)
    {
        boolean flag;
label0:
        {
            int j;
            int k;
            int l;
            int i1;
label1:
            {
                if (isLayoutRequested())
                {
                    mDeferScroll = i;
                    flag = false;
                    break label0;
                }
                Layout layout;
                if (isShowingHint())
                    layout = mHintLayout;
                else
                    layout = mLayout;
                flag = false;
                if (layout == null)
                    break label0;
                j = layout.getLineForOffset(i);
                k = (int)layout.getPrimaryHorizontal(i);
                l = layout.getLineTop(j);
                i1 = layout.getLineTop(j + 1);
                int j1 = (int)FloatMath.floor(layout.getLineLeft(j));
                int k1 = (int)FloatMath.ceil(layout.getLineRight(j));
                int l1 = layout.getHeight();
                static class _cls4
                {

                    static final int $SwitchMap$android$text$Layout$Alignment[];

                    static 
                    {
                        $SwitchMap$android$text$Layout$Alignment = new int[android.text.Layout.Alignment.values().length];
                        try
                        {
                            $SwitchMap$android$text$Layout$Alignment[android.text.Layout.Alignment.ALIGN_LEFT.ordinal()] = 1;
                        }
                        catch (NoSuchFieldError nosuchfielderror) { }
                        try
                        {
                            $SwitchMap$android$text$Layout$Alignment[android.text.Layout.Alignment.ALIGN_RIGHT.ordinal()] = 2;
                        }
                        catch (NoSuchFieldError nosuchfielderror1) { }
                        try
                        {
                            $SwitchMap$android$text$Layout$Alignment[android.text.Layout.Alignment.ALIGN_NORMAL.ordinal()] = 3;
                        }
                        catch (NoSuchFieldError nosuchfielderror2) { }
                        try
                        {
                            $SwitchMap$android$text$Layout$Alignment[android.text.Layout.Alignment.ALIGN_OPPOSITE.ordinal()] = 4;
                        }
                        catch (NoSuchFieldError nosuchfielderror3) { }
                        try
                        {
                            $SwitchMap$android$text$Layout$Alignment[android.text.Layout.Alignment.ALIGN_CENTER.ordinal()] = 5;
                        }
                        catch (NoSuchFieldError nosuchfielderror4)
                        {
                            return;
                        }
                    }
                }

                int i2;
                switch (_cls4..SwitchMap.android.text.Layout.Alignment[layout.getParagraphAlignment(j).ordinal()])
                {
                case 4: // '\004'
                    i2 = -layout.getParagraphDirection(j);
                    break;

                case 3: // '\003'
                    i2 = layout.getParagraphDirection(j);
                    break;

                case 2: // '\002'
                    i2 = -1;
                    break;

                case 1: // '\001'
                    i2 = 1;
                    break;

                default:
                    i2 = 0;
                    break;
                }
                int j2 = super.mRight - super.mLeft - getCompoundPaddingLeft() - getCompoundPaddingRight();
                int k2 = super.mBottom - super.mTop - getExtendedPaddingTop() - getExtendedPaddingBottom();
                int l2 = (i1 - l) / 2;
                int i3 = l2;
                int j3 = k2 / 4;
                if (i3 > j3)
                    i3 = k2 / 4;
                if (l2 > j2 / 4)
                    l2 = j2 / 4;
                int k3 = super.mScrollX;
                int l3 = super.mScrollY;
                if (l - l3 < i3)
                    l3 = l - i3;
                if (i1 - l3 > k2 - i3)
                    l3 = i1 - (k2 - i3);
                if (l1 - l3 < k2)
                    l3 = l1 - k2;
                if (0 - l3 > 0)
                    l3 = 0;
                if (i2 != 0)
                {
                    if (k - k3 < l2)
                        k3 = k - l2;
                    if (k - k3 > j2 - l2)
                        k3 = k - (j2 - l2);
                }
                if (i2 < 0)
                {
                    if (j1 - k3 > 0)
                        k3 = j1;
                    if (k1 - k3 < j2)
                        k3 = k1 - j2;
                } else
                if (i2 > 0)
                {
                    if (k1 - k3 < j2)
                        k3 = k1 - j2;
                    if (j1 - k3 > 0)
                        k3 = j1;
                } else
                if (k1 - j1 <= j2)
                    k3 = j1 - (j2 - (k1 - j1)) / 2;
                else
                if (k > k1 - l2)
                    k3 = k1 - j2;
                else
                if (k < j1 + l2)
                    k3 = j1;
                else
                if (j1 > k3)
                    k3 = j1;
                else
                if (k1 < k3 + j2)
                {
                    k3 = k1 - j2;
                } else
                {
                    if (k - k3 < l2)
                        k3 = k - l2;
                    if (k - k3 > j2 - l2)
                        k3 = k - (j2 - l2);
                }
                if (k3 == super.mScrollX)
                {
                    int k4 = super.mScrollY;
                    int i5 = l3;
                    flag = false;
                    if (i5 == k4)
                        break label1;
                }
                if (mScroller == null)
                {
                    scrollTo(k3, l3);
                } else
                {
                    long l4 = AnimationUtils.currentAnimationTimeMillis() - mLastScroll;
                    int i4 = k3 - super.mScrollX;
                    int j4 = l3 - super.mScrollY;
                    if (l4 > 250L)
                    {
                        mScroller.startScroll(super.mScrollX, super.mScrollY, i4, j4);
                        awakenScrollBars(mScroller.getDuration());
                        invalidate();
                    } else
                    {
                        if (!mScroller.isFinished())
                            mScroller.abortAnimation();
                        scrollBy(i4, j4);
                    }
                    mLastScroll = AnimationUtils.currentAnimationTimeMillis();
                }
                flag = true;
            }
            if (isFocused())
            {
                if (mTempRect == null)
                    mTempRect = new Rect();
                mTempRect.set(k - 2, l, k + 2, i1);
                getInterestingRect(mTempRect, j);
                mTempRect.offset(super.mScrollX, super.mScrollY);
                if (requestRectangleOnScreen(mTempRect))
                    return true;
            }
        }
        return flag;
    }

    boolean canCopy()
    {
        return !hasPasswordTransformationMethod() && mText.length() > 0 && hasSelection();
    }

    boolean canCut()
    {
        return !hasPasswordTransformationMethod() && mText.length() > 0 && hasSelection() && (mText instanceof Editable) && mEditor != null && mEditor.mKeyListener != null;
    }

    boolean canPaste()
    {
        return (mText instanceof Editable) && mEditor != null && mEditor.mKeyListener != null && getSelectionStart() >= 0 && getSelectionEnd() >= 0 && ((ClipboardManager)getContext().getSystemService("clipboard")).hasPrimaryClip();
    }

    public void cancelLongPress()
    {
        super.cancelLongPress();
        if (mEditor != null)
            mEditor.mIgnoreActionUpEvent = true;
    }

    public void clearComposingText()
    {
        if (mText instanceof Spannable)
            BaseInputConnection.removeComposingSpans((Spannable)mText);
    }

    protected int computeHorizontalScrollRange()
    {
        if (mLayout != null)
        {
            if (mSingleLine && (7 & mGravity) == 3)
                return (int)mLayout.getLineWidth(0);
            else
                return mLayout.getWidth();
        } else
        {
            return super.computeHorizontalScrollRange();
        }
    }

    public void computeScroll()
    {
        if (mScroller != null && mScroller.computeScrollOffset())
        {
            super.mScrollX = mScroller.getCurrX();
            super.mScrollY = mScroller.getCurrY();
            invalidateParentCaches();
            postInvalidate();
        }
    }

    protected int computeVerticalScrollExtent()
    {
        return getHeight() - getCompoundPaddingTop() - getCompoundPaddingBottom();
    }

    protected int computeVerticalScrollRange()
    {
        if (mLayout != null)
            return mLayout.getHeight();
        else
            return super.computeVerticalScrollRange();
    }

    float convertToLocalHorizontalCoordinate(float f)
    {
        float f1 = Math.max(0.0F, f - (float)getTotalPaddingLeft());
        return Math.min(-1 + (getWidth() - getTotalPaddingRight()), f1) + (float)getScrollX();
    }

    public void debug(int i)
    {
        super.debug(i);
        String s = debugIndent(i);
        String s1 = (new StringBuilder()).append(s).append("frame={").append(super.mLeft).append(", ").append(super.mTop).append(", ").append(super.mRight).append(", ").append(super.mBottom).append("} scroll={").append(super.mScrollX).append(", ").append(super.mScrollY).append("} ").toString();
        String s2;
        if (mText != null)
        {
            s2 = (new StringBuilder()).append(s1).append("mText=\"").append(mText).append("\" ").toString();
            if (mLayout != null)
                s2 = (new StringBuilder()).append(s2).append("mLayout width=").append(mLayout.getWidth()).append(" height=").append(mLayout.getHeight()).toString();
        } else
        {
            s2 = (new StringBuilder()).append(s1).append("mText=NULL").toString();
        }
        Log.d("View", s2);
    }

    protected void deleteText_internal(int i, int j)
    {
        ((Editable)mText).delete(i, j);
    }

    public boolean didTouchFocusSelect()
    {
        return mEditor != null && mEditor.mTouchFocusSelected;
    }

    public void dispatchFinishTemporaryDetach()
    {
        mDispatchTemporaryDetach = true;
        super.dispatchFinishTemporaryDetach();
        mDispatchTemporaryDetach = false;
    }

    protected boolean dispatchPointerToPopupWindow(MotionEvent motionevent)
    {
        return false;
    }

    protected void drawableStateChanged()
    {
        super.drawableStateChanged();
        if (mTextColor != null && mTextColor.isStateful() || mHintTextColor != null && mHintTextColor.isStateful() || mLinkTextColor != null && mLinkTextColor.isStateful())
            updateTextColors();
        Drawables drawables = mDrawables;
        if (drawables != null)
        {
            int ai[] = getDrawableState();
            if (drawables.mDrawableTop != null && drawables.mDrawableTop.isStateful())
                drawables.mDrawableTop.setState(ai);
            if (drawables.mDrawableBottom != null && drawables.mDrawableBottom.isStateful())
                drawables.mDrawableBottom.setState(ai);
            if (drawables.mDrawableLeft != null && drawables.mDrawableLeft.isStateful())
                drawables.mDrawableLeft.setState(ai);
            if (drawables.mDrawableRight != null && drawables.mDrawableRight.isStateful())
                drawables.mDrawableRight.setState(ai);
            if (drawables.mDrawableStart != null && drawables.mDrawableStart.isStateful())
                drawables.mDrawableStart.setState(ai);
            if (drawables.mDrawableEnd != null && drawables.mDrawableEnd.isStateful())
                drawables.mDrawableEnd.setState(ai);
        }
    }

    public void endBatchEdit()
    {
        if (mEditor != null)
            mEditor.endBatchEdit();
    }

    public boolean extractText(ExtractedTextRequest extractedtextrequest, ExtractedText extractedtext)
    {
        createEditorIfNeeded();
        return mEditor.extractText(extractedtextrequest, extractedtext);
    }

    public void findViewsWithText(ArrayList arraylist, CharSequence charsequence, int i)
    {
        super.findViewsWithText(arraylist, charsequence, i);
        if (!arraylist.contains(this) && (i & 1) != 0 && !TextUtils.isEmpty(charsequence) && !TextUtils.isEmpty(mText))
        {
            String s = charsequence.toString().toLowerCase();
            if (mText.toString().toLowerCase().contains(s))
                arraylist.add(this);
        }
    }

    public int getAccessibilityCursorPosition()
    {
        if (TextUtils.isEmpty(getContentDescription()))
        {
            int i = getSelectionEnd();
            if (i >= 0)
                return i;
        }
        return super.getAccessibilityCursorPosition();
    }

    public final int getAutoLinkMask()
    {
        return mAutoLinkMask;
    }

    public int getBaseline()
    {
        if (mLayout == null)
            return super.getBaseline();
        int i = 0x70 & mGravity;
        int j = 0;
        if (i != 48)
            j = getVerticalOffset(true);
        return j + getExtendedPaddingTop() + mLayout.getLineBaseline(0);
    }

    protected int getBottomPaddingOffset()
    {
        return (int)Math.max(0.0F, mShadowDy + mShadowRadius);
    }

    public int getCompoundDrawablePadding()
    {
        Drawables drawables = mDrawables;
        if (drawables != null)
            return drawables.mDrawablePadding;
        else
            return 0;
    }

    public Drawable[] getCompoundDrawables()
    {
        Drawables drawables = mDrawables;
        if (drawables != null)
        {
            Drawable adrawable[] = new Drawable[4];
            adrawable[0] = drawables.mDrawableLeft;
            adrawable[1] = drawables.mDrawableTop;
            adrawable[2] = drawables.mDrawableRight;
            adrawable[3] = drawables.mDrawableBottom;
            return adrawable;
        } else
        {
            return (new Drawable[] {
                null, null, null, null
            });
        }
    }

    public Drawable[] getCompoundDrawablesRelative()
    {
        Drawables drawables = mDrawables;
        if (drawables != null)
        {
            Drawable adrawable[] = new Drawable[4];
            adrawable[0] = drawables.mDrawableStart;
            adrawable[1] = drawables.mDrawableTop;
            adrawable[2] = drawables.mDrawableEnd;
            adrawable[3] = drawables.mDrawableBottom;
            return adrawable;
        } else
        {
            return (new Drawable[] {
                null, null, null, null
            });
        }
    }

    public int getCompoundPaddingBottom()
    {
        Drawables drawables = mDrawables;
        if (drawables != null && drawables.mDrawableBottom != null)
            return super.mPaddingBottom + drawables.mDrawablePadding + drawables.mDrawableSizeBottom;
        else
            return super.mPaddingBottom;
    }

    public int getCompoundPaddingEnd()
    {
        resolveDrawables();
        switch (getLayoutDirection())
        {
        case 1: // '\001'
            return getCompoundPaddingLeft();
        }
        return getCompoundPaddingRight();
    }

    public int getCompoundPaddingLeft()
    {
        Drawables drawables = mDrawables;
        if (drawables != null && drawables.mDrawableLeft != null)
            return super.mPaddingLeft + drawables.mDrawablePadding + drawables.mDrawableSizeLeft;
        else
            return super.mPaddingLeft;
    }

    public int getCompoundPaddingRight()
    {
        Drawables drawables = mDrawables;
        if (drawables != null && drawables.mDrawableRight != null)
            return super.mPaddingRight + drawables.mDrawablePadding + drawables.mDrawableSizeRight;
        else
            return super.mPaddingRight;
    }

    public int getCompoundPaddingStart()
    {
        resolveDrawables();
        switch (getLayoutDirection())
        {
        case 1: // '\001'
            return getCompoundPaddingRight();
        }
        return getCompoundPaddingLeft();
    }

    public int getCompoundPaddingTop()
    {
        Drawables drawables = mDrawables;
        if (drawables != null && drawables.mDrawableTop != null)
            return super.mPaddingTop + drawables.mDrawablePadding + drawables.mDrawableSizeTop;
        else
            return super.mPaddingTop;
    }

    public final int getCurrentHintTextColor()
    {
        if (mHintTextColor != null)
            return mCurHintTextColor;
        else
            return mCurTextColor;
    }

    public final int getCurrentTextColor()
    {
        return mCurTextColor;
    }

    public android.view.ActionMode.Callback getCustomSelectionActionModeCallback()
    {
        if (mEditor == null)
            return null;
        else
            return mEditor.mCustomSelectionActionModeCallback;
    }

    protected boolean getDefaultEditable()
    {
        return false;
    }

    protected MovementMethod getDefaultMovementMethod()
    {
        return null;
    }

    public Editable getEditableText()
    {
        if (mText instanceof Editable)
            return (Editable)mText;
        else
            return null;
    }

    public android.text.TextUtils.TruncateAt getEllipsize()
    {
        return mEllipsize;
    }

    public CharSequence getError()
    {
        if (mEditor == null)
            return null;
        else
            return mEditor.mError;
    }

    public int getExtendedPaddingBottom()
    {
        int j;
        if (mMaxMode != 1)
        {
            j = getCompoundPaddingBottom();
        } else
        {
            if (mLayout.getLineCount() <= mMaximum)
                return getCompoundPaddingBottom();
            int i = getCompoundPaddingTop();
            j = getCompoundPaddingBottom();
            int k = getHeight() - i - j;
            int l = mLayout.getLineTop(mMaximum);
            if (l < k)
            {
                int i1 = 0x70 & mGravity;
                if (i1 == 48)
                    return (j + k) - l;
                if (i1 != 80)
                    return j + (k - l) / 2;
            }
        }
        return j;
    }

    public int getExtendedPaddingTop()
    {
        int i;
        if (mMaxMode != 1)
        {
            i = getCompoundPaddingTop();
        } else
        {
            if (mLayout.getLineCount() <= mMaximum)
                return getCompoundPaddingTop();
            i = getCompoundPaddingTop();
            int j = getCompoundPaddingBottom();
            int k = getHeight() - i - j;
            int l = mLayout.getLineTop(mMaximum);
            if (l < k)
            {
                int i1 = 0x70 & mGravity;
                if (i1 != 48)
                    if (i1 == 80)
                        return (i + k) - l;
                    else
                        return i + (k - l) / 2;
            }
        }
        return i;
    }

    protected int getFadeHeight(boolean flag)
    {
        if (mLayout != null)
            return mLayout.getHeight();
        else
            return 0;
    }

    protected int getFadeTop(boolean flag)
    {
        if (mLayout == null)
            return 0;
        int i = 0x70 & mGravity;
        int j = 0;
        if (i != 48)
            j = getVerticalOffset(true);
        if (flag)
            j += getTopPaddingOffset();
        return j + getExtendedPaddingTop();
    }

    public InputFilter[] getFilters()
    {
        return mFilters;
    }

    public void getFocusedRect(Rect rect)
    {
        if (mLayout == null)
        {
            super.getFocusedRect(rect);
            return;
        }
        int i = getSelectionEnd();
        if (i < 0)
        {
            super.getFocusedRect(rect);
            return;
        }
        int j = getSelectionStart();
        int l;
        int i1;
        if (j < 0 || j >= i)
        {
            int k = mLayout.getLineForOffset(i);
            rect.top = mLayout.getLineTop(k);
            rect.bottom = mLayout.getLineBottom(k);
            rect.left = -2 + (int)mLayout.getPrimaryHorizontal(i);
            rect.right = 4 + rect.left;
        } else
        {
            int j1 = mLayout.getLineForOffset(j);
            int k1 = mLayout.getLineForOffset(i);
            rect.top = mLayout.getLineTop(j1);
            rect.bottom = mLayout.getLineBottom(k1);
            if (j1 == k1)
            {
                rect.left = (int)mLayout.getPrimaryHorizontal(j);
                rect.right = (int)mLayout.getPrimaryHorizontal(i);
            } else
            {
                if (mHighlightPathBogus)
                {
                    if (mHighlightPath == null)
                        mHighlightPath = new Path();
                    mHighlightPath.reset();
                    mLayout.getSelectionPath(j, i, mHighlightPath);
                    mHighlightPathBogus = false;
                }
                synchronized (TEMP_RECTF)
                {
                    mHighlightPath.computeBounds(TEMP_RECTF, true);
                    rect.left = -1 + (int)TEMP_RECTF.left;
                    rect.right = 1 + (int)TEMP_RECTF.right;
                }
            }
        }
        l = getCompoundPaddingLeft();
        i1 = getExtendedPaddingTop();
        if ((0x70 & mGravity) != 48)
            i1 += getVerticalOffset(false);
        rect.offset(l, i1);
        rect.bottom = getExtendedPaddingBottom() + rect.bottom;
        return;
        exception;
        rectf;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean getFreezesText()
    {
        return mFreezesText;
    }

    public int getGravity()
    {
        return mGravity;
    }

    public int getHighlightColor()
    {
        return mHighlightColor;
    }

    public CharSequence getHint()
    {
        return mHint;
    }

    final Layout getHintLayout()
    {
        return mHintLayout;
    }

    public final ColorStateList getHintTextColors()
    {
        return mHintTextColor;
    }

    public int getHorizontalOffsetForDrawables()
    {
        return 0;
    }

    public boolean getHorizontallyScrolling()
    {
        return mHorizontallyScrolling;
    }

    public int getImeActionId()
    {
        if (mEditor != null && mEditor.mInputContentType != null)
            return mEditor.mInputContentType.imeActionId;
        else
            return 0;
    }

    public CharSequence getImeActionLabel()
    {
        if (mEditor != null && mEditor.mInputContentType != null)
            return mEditor.mInputContentType.imeActionLabel;
        else
            return null;
    }

    public int getImeOptions()
    {
        if (mEditor != null && mEditor.mInputContentType != null)
            return mEditor.mInputContentType.imeOptions;
        else
            return 0;
    }

    public boolean getIncludeFontPadding()
    {
        return mIncludePad;
    }

    public Bundle getInputExtras(boolean flag)
    {
label0:
        {
            if (mEditor == null && !flag)
                break label0;
            createEditorIfNeeded();
            if (mEditor.mInputContentType == null)
            {
                if (!flag)
                    break label0;
                mEditor.createInputContentTypeIfNeeded();
            }
            if (mEditor.mInputContentType.extras == null)
            {
                if (!flag)
                    break label0;
                mEditor.mInputContentType.extras = new Bundle();
            }
            return mEditor.mInputContentType.extras;
        }
        return null;
    }

    public int getInputType()
    {
        if (mEditor == null)
            return 0;
        else
            return mEditor.mInputType;
    }

    public CharSequence getIterableTextForAccessibility()
    {
        if (!TextUtils.isEmpty(mText))
        {
            if (!(mText instanceof Spannable))
                setText(mText, BufferType.SPANNABLE);
            return mText;
        } else
        {
            return super.getIterableTextForAccessibility();
        }
    }

    public android.view.AccessibilityIterators.TextSegmentIterator getIteratorForGranularity(int i)
    {
        switch (i)
        {
        default:
            break;

        case 16: // '\020'
            if (!TextUtils.isEmpty((Spannable)getIterableTextForAccessibility()) && getLayout() != null)
            {
                AccessibilityIterators.PageTextSegmentIterator pagetextsegmentiterator = AccessibilityIterators.PageTextSegmentIterator.getInstance();
                pagetextsegmentiterator.initialize(this);
                return pagetextsegmentiterator;
            }
            break;

        case 4: // '\004'
            Spannable spannable = (Spannable)getIterableTextForAccessibility();
            if (!TextUtils.isEmpty(spannable) && getLayout() != null)
            {
                AccessibilityIterators.LineTextSegmentIterator linetextsegmentiterator = AccessibilityIterators.LineTextSegmentIterator.getInstance();
                linetextsegmentiterator.initialize(spannable, getLayout());
                return linetextsegmentiterator;
            }
            break;
        }
        return super.getIteratorForGranularity(i);
    }

    public final KeyListener getKeyListener()
    {
        if (mEditor == null)
            return null;
        else
            return mEditor.mKeyListener;
    }

    public final Layout getLayout()
    {
        return mLayout;
    }

    protected float getLeftFadingEdgeStrength()
    {
        if (mEllipsize != android.text.TextUtils.TruncateAt.MARQUEE || mMarqueeFadeMode == 1) goto _L2; else goto _L1
_L1:
        if (mMarquee == null || mMarquee.isStopped()) goto _L4; else goto _L3
_L3:
        float f;
        Marquee marquee = mMarquee;
        boolean flag = marquee.shouldDrawLeftFade();
        f = 0.0F;
        if (flag)
            f = marquee.getScroll() / (float)getHorizontalFadingEdgeLength();
          goto _L5
_L4:
        if (getLineCount() != 1) goto _L2; else goto _L6
_L6:
        int j;
        int i = getLayoutDirection();
        j = 7 & Gravity.getAbsoluteGravity(mGravity, i);
        f = 0.0F;
        j;
        JVM INSTR tableswitch 1 5: default 179
    //                   1 184
    //                   2 179
    //                   3 184
    //                   4 179
    //                   5 132;
           goto _L2 _L5 _L2 _L5 _L2 _L7
_L7:
        return (mLayout.getLineRight(0) - (float)(super.mRight - super.mLeft) - (float)getCompoundPaddingLeft() - (float)getCompoundPaddingRight() - mLayout.getLineLeft(0)) / (float)getHorizontalFadingEdgeLength();
_L2:
        return super.getLeftFadingEdgeStrength();
_L5:
        return f;
    }

    protected int getLeftPaddingOffset()
    {
        return (getCompoundPaddingLeft() - super.mPaddingLeft) + (int)Math.min(0.0F, mShadowDx - mShadowRadius);
    }

    int getLineAtCoordinate(float f)
    {
        float f1 = Math.max(0.0F, f - (float)getTotalPaddingTop());
        float f2 = Math.min(-1 + (getHeight() - getTotalPaddingBottom()), f1) + (float)getScrollY();
        return getLayout().getLineForVertical((int)f2);
    }

    public int getLineBounds(int i, Rect rect)
    {
        if (mLayout == null)
        {
            if (rect != null)
                rect.set(0, 0, 0, 0);
            return 0;
        }
        int j = mLayout.getLineBounds(i, rect);
        int k = getExtendedPaddingTop();
        if ((0x70 & mGravity) != 48)
            k += getVerticalOffset(true);
        if (rect != null)
            rect.offset(getCompoundPaddingLeft(), k);
        return j + k;
    }

    public int getLineCount()
    {
        if (mLayout != null)
            return mLayout.getLineCount();
        else
            return 0;
    }

    public int getLineHeight()
    {
        return FastMath.round((float)mTextPaint.getFontMetricsInt(mText, new android.graphics.Paint.FontMetricsInt()) * mSpacingMult + mSpacingAdd);
    }

    public float getLineSpacingExtra()
    {
        return mSpacingAdd;
    }

    public float getLineSpacingMultiplier()
    {
        return mSpacingMult;
    }

    public final ColorStateList getLinkTextColors()
    {
        return mLinkTextColor;
    }

    public final boolean getLinksClickable()
    {
        return mLinksClickable;
    }

    public int getMarqueeRepeatLimit()
    {
        return mMarqueeRepeatLimit;
    }

    public int getMaxEms()
    {
        if (mMaxWidthMode == 1)
            return mMaxWidth;
        else
            return -1;
    }

    public int getMaxHeight()
    {
        if (mMaxMode == 2)
            return mMaximum;
        else
            return -1;
    }

    public int getMaxLines()
    {
        if (mMaxMode == 1)
            return mMaximum;
        else
            return -1;
    }

    public int getMaxWidth()
    {
        if (mMaxWidthMode == 2)
            return mMaxWidth;
        else
            return -1;
    }

    public int getMinEms()
    {
        if (mMinWidthMode == 1)
            return mMinWidth;
        else
            return -1;
    }

    public int getMinHeight()
    {
        if (mMinMode == 2)
            return mMinimum;
        else
            return -1;
    }

    public int getMinLines()
    {
        if (mMinMode == 1)
            return mMinimum;
        else
            return -1;
    }

    public int getMinWidth()
    {
        if (mMinWidthMode == 2)
            return mMinWidth;
        else
            return -1;
    }

    public final MovementMethod getMovementMethod()
    {
        return mMovement;
    }

    public int getOffsetForPosition(float f, float f1)
    {
        if (getLayout() == null)
            return -1;
        else
            return getOffsetAtCoordinate(getLineAtCoordinate(f1), f);
    }

    public TextPaint getPaint()
    {
        return mTextPaint;
    }

    public int getPaintFlags()
    {
        return mTextPaint.getFlags();
    }

    public String getPrivateImeOptions()
    {
        if (mEditor != null && mEditor.mInputContentType != null)
            return mEditor.mInputContentType.privateImeOptions;
        else
            return null;
    }

    protected float getRightFadingEdgeStrength()
    {
        if (mEllipsize == android.text.TextUtils.TruncateAt.MARQUEE && mMarqueeFadeMode != 1)
        {
            if (mMarquee != null && !mMarquee.isStopped())
            {
                Marquee marquee = mMarquee;
                return (marquee.getMaxFadeScroll() - marquee.getScroll()) / (float)getHorizontalFadingEdgeLength();
            }
            if (getLineCount() == 1)
            {
                int i = getLayoutDirection();
                switch (7 & Gravity.getAbsoluteGravity(mGravity, i))
                {
                case 1: // '\001'
                case 7: // '\007'
                    return (mLayout.getLineWidth(0) - (float)(super.mRight - super.mLeft - getCompoundPaddingLeft() - getCompoundPaddingRight())) / (float)getHorizontalFadingEdgeLength();

                case 5: // '\005'
                    return 0.0F;

                case 3: // '\003'
                    int j = super.mRight - super.mLeft - getCompoundPaddingLeft() - getCompoundPaddingRight();
                    return (mLayout.getLineWidth(0) - (float)j) / (float)getHorizontalFadingEdgeLength();
                }
            }
        }
        return super.getRightFadingEdgeStrength();
    }

    protected int getRightPaddingOffset()
    {
        return -(getCompoundPaddingRight() - super.mPaddingRight) + (int)Math.max(0.0F, mShadowDx + mShadowRadius);
    }

    public int getSelectionEnd()
    {
        return Selection.getSelectionEnd(getText());
    }

    public int getSelectionStart()
    {
        return Selection.getSelectionStart(getText());
    }

    public int getShadowColor()
    {
        return ((Paint) (mTextPaint)).shadowColor;
    }

    public float getShadowDx()
    {
        return mShadowDx;
    }

    public float getShadowDy()
    {
        return mShadowDy;
    }

    public float getShadowRadius()
    {
        return mShadowRadius;
    }

    public final boolean getShowSoftInputOnFocus()
    {
        return mEditor == null || mEditor.mShowSoftInputOnFocus;
    }

    public CharSequence getText()
    {
        return mText;
    }

    public final ColorStateList getTextColors()
    {
        return mTextColor;
    }

    TextDirectionHeuristic getTextDirectionHeuristic()
    {
        int i = 1;
        if (hasPasswordTransformationMethod())
            return TextDirectionHeuristics.LTR;
        if (getLayoutDirection() != i)
            i = 0;
        switch (getTextDirection())
        {
        case 5: // '\005'
            return TextDirectionHeuristics.LOCALE;

        case 4: // '\004'
            return TextDirectionHeuristics.RTL;

        case 3: // '\003'
            return TextDirectionHeuristics.LTR;

        case 2: // '\002'
            return TextDirectionHeuristics.ANYRTL_LTR;
        }
        if (i != 0)
            return TextDirectionHeuristics.FIRSTSTRONG_RTL;
        else
            return TextDirectionHeuristics.FIRSTSTRONG_LTR;
    }

    public CharSequence getTextForAccessibility()
    {
        CharSequence charsequence = getText();
        if (TextUtils.isEmpty(charsequence))
            charsequence = getHint();
        return charsequence;
    }

    public Locale getTextLocale()
    {
        return mTextPaint.getTextLocale();
    }

    public float getTextScaleX()
    {
        return mTextPaint.getTextScaleX();
    }

    public Locale getTextServicesLocale()
    {
        if (mCurrentTextServicesLocaleCache == null)
            mCurrentTextServicesLocaleCache = Locale.getDefault();
        updateTextServicesLocaleAsync();
        return mCurrentTextServicesLocaleCache;
    }

    public float getTextSize()
    {
        return mTextPaint.getTextSize();
    }

    protected int getTopPaddingOffset()
    {
        return (int)Math.min(0.0F, mShadowDy - mShadowRadius);
    }

    public int getTotalPaddingBottom()
    {
        return getExtendedPaddingBottom() + getBottomVerticalOffset(true);
    }

    public int getTotalPaddingEnd()
    {
        return getCompoundPaddingEnd();
    }

    public int getTotalPaddingLeft()
    {
        return getCompoundPaddingLeft();
    }

    public int getTotalPaddingRight()
    {
        return getCompoundPaddingRight();
    }

    public int getTotalPaddingStart()
    {
        return getCompoundPaddingStart();
    }

    public int getTotalPaddingTop()
    {
        return getExtendedPaddingTop() + getVerticalOffset(true);
    }

    public final TransformationMethod getTransformationMethod()
    {
        return mTransformation;
    }

    CharSequence getTransformedText(int i, int j)
    {
        return removeSuggestionSpans(mTransformed.subSequence(i, j));
    }

    public Typeface getTypeface()
    {
        return mTextPaint.getTypeface();
    }

    public URLSpan[] getUrls()
    {
        if (mText instanceof Spanned)
            return (URLSpan[])((Spanned)mText).getSpans(0, mText.length(), android/text/style/URLSpan);
        else
            return new URLSpan[0];
    }

    int getVerticalOffset(boolean flag)
    {
        int k;
        int l;
label0:
        {
            int i = 0x70 & mGravity;
            Layout layout = mLayout;
            if (!flag && mText.length() == 0 && mHintLayout != null)
                layout = mHintLayout;
            int j = 0;
            if (i != 48)
            {
                if (layout == mHintLayout)
                    k = getMeasuredHeight() - getCompoundPaddingTop() - getCompoundPaddingBottom();
                else
                    k = getMeasuredHeight() - getExtendedPaddingTop() - getExtendedPaddingBottom();
                l = layout.getHeight();
                j = 0;
                if (l < k)
                {
                    if (i != 80)
                        break label0;
                    j = k - l;
                }
            }
            return j;
        }
        return k - l >> 1;
    }

    public WordIterator getWordIterator()
    {
        if (mEditor != null)
            return mEditor.getWordIterator();
        else
            return null;
    }

    void handleTextChanged(CharSequence charsequence, int i, int j, int k)
    {
        Editor.InputMethodState inputmethodstate;
        if (mEditor == null)
            inputmethodstate = null;
        else
            inputmethodstate = mEditor.mInputMethodState;
        if (inputmethodstate == null || inputmethodstate.mBatchEditNesting == 0)
            updateAfterEdit();
        if (inputmethodstate != null)
        {
            inputmethodstate.mContentChanged = true;
            if (inputmethodstate.mChangedStart < 0)
            {
                inputmethodstate.mChangedStart = i;
                inputmethodstate.mChangedEnd = i + j;
            } else
            {
                inputmethodstate.mChangedStart = Math.min(inputmethodstate.mChangedStart, i);
                inputmethodstate.mChangedEnd = Math.max(inputmethodstate.mChangedEnd, (i + j) - inputmethodstate.mChangedDelta);
            }
            inputmethodstate.mChangedDelta = inputmethodstate.mChangedDelta + (k - j);
        }
        sendOnTextChanged(charsequence, i, j, k);
        onTextChanged(charsequence, i, j, k);
    }

    public boolean hasOverlappingRendering()
    {
        return getBackground() != null || (mText instanceof Spannable) || hasSelection();
    }

    public boolean hasSelection()
    {
        int i = getSelectionStart();
        int j = getSelectionEnd();
        return i >= 0 && i != j;
    }

    boolean hasTextInClipboardList()
    {
        boolean flag;
        boolean flag1;
        ClipboardManager clipboardmanager;
        Method method;
        boolean flag2;
        if ((mText instanceof Editable) && mEditor != null && mEditor.mKeyListener != null && getSelectionStart() >= 0 && getSelectionEnd() >= 0)
            flag = true;
        else
            flag = false;
        clipboardmanager = (ClipboardManager)getContext().getSystemService("clipboard");
        method = clipboardmanager.getClass().getDeclaredMethod("hasTextInClipboardList", null);
        method.setAccessible(true);
        flag2 = ((Boolean)method.invoke(clipboardmanager, new Object[0])).booleanValue();
        flag1 = flag2;
_L1:
        Exception exception;
        return flag1 && flag;
        exception;
        exception.printStackTrace();
        flag1 = false;
          goto _L1
    }

    public void hideClipBoard()
    {
    }

    public void hideErrorIfUnchanged()
    {
        if (mEditor != null && mEditor.mError != null && !mEditor.mErrorWasChanged)
            setError(null, null);
    }

    void invalidateCursor()
    {
        int i = getSelectionEnd();
        invalidateCursor(i, i, i);
    }

    void invalidateCursorPath()
    {
        if (!mHighlightPathBogus) goto _L2; else goto _L1
_L1:
        invalidateCursor();
_L4:
        return;
_L2:
        int i;
        int j;
        i = getCompoundPaddingLeft();
        j = getExtendedPaddingTop() + getVerticalOffset(true);
        if (mEditor.mCursorCount != 0)
            break MISSING_BLOCK_LABEL_165;
        RectF rectf = TEMP_RECTF;
        rectf;
        JVM INSTR monitorenter ;
        float f = FloatMath.ceil(mTextPaint.getStrokeWidth());
        if (f < 1.0F)
            f = 1.0F;
        float f1 = f / 2.0F;
        mHighlightPath.computeBounds(TEMP_RECTF, false);
        invalidate((int)FloatMath.floor(((float)i + TEMP_RECTF.left) - f1), (int)FloatMath.floor(((float)j + TEMP_RECTF.top) - f1), (int)FloatMath.ceil(f1 + ((float)i + TEMP_RECTF.right)), (int)FloatMath.ceil(f1 + ((float)j + TEMP_RECTF.bottom)));
        rectf;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        rectf;
        JVM INSTR monitorexit ;
        throw exception;
        int k = 0;
        while (k < mEditor.mCursorCount) 
        {
            Rect rect = mEditor.mCursorDrawable[k].getBounds();
            invalidate(i + rect.left, j + rect.top, i + rect.right, j + rect.bottom);
            k++;
        }
        if (true) goto _L4; else goto _L3
_L3:
    }

    public void invalidateDrawable(Drawable drawable)
    {
        if (verifyDrawable(drawable))
        {
            Rect rect = drawable.getBounds();
            int i = super.mScrollX;
            int j = super.mScrollY;
            Drawables drawables = mDrawables;
            if (drawables != null)
                if (drawable == drawables.mDrawableLeft)
                {
                    int j2 = getCompoundPaddingTop();
                    int k2 = getCompoundPaddingBottom();
                    int l2 = super.mBottom - super.mTop - k2 - j2;
                    i += super.mPaddingLeft;
                    j += j2 + (l2 - drawables.mDrawableHeightLeft) / 2;
                } else
                if (drawable == drawables.mDrawableRight)
                {
                    int k1 = getCompoundPaddingTop();
                    int l1 = getCompoundPaddingBottom();
                    int i2 = super.mBottom - super.mTop - l1 - k1;
                    i += super.mRight - super.mLeft - super.mPaddingRight - drawables.mDrawableSizeRight;
                    j += k1 + (i2 - drawables.mDrawableHeightRight) / 2;
                } else
                if (drawable == drawables.mDrawableTop)
                {
                    int i1 = getCompoundPaddingLeft();
                    int j1 = getCompoundPaddingRight();
                    i += i1 + (super.mRight - super.mLeft - j1 - i1 - drawables.mDrawableWidthTop) / 2;
                    j += super.mPaddingTop;
                } else
                if (drawable == drawables.mDrawableBottom)
                {
                    int k = getCompoundPaddingLeft();
                    int l = getCompoundPaddingRight();
                    i += k + (super.mRight - super.mLeft - l - k - drawables.mDrawableWidthBottom) / 2;
                    j += super.mBottom - super.mTop - super.mPaddingBottom - drawables.mDrawableSizeBottom;
                }
            invalidate(i + rect.left, j + rect.top, i + rect.right, j + rect.bottom);
        }
    }

    void invalidateRegion(int i, int j, boolean flag)
    {
        if (mLayout == null)
        {
            invalidate();
            return;
        }
        int k = mLayout.getLineForOffset(i);
        int l = mLayout.getLineTop(k);
        if (k > 0)
            l -= mLayout.getLineDescent(k - 1);
        int i1;
        if (i == j)
            i1 = k;
        else
            i1 = mLayout.getLineForOffset(j);
        int j1 = mLayout.getLineBottom(i1);
        if (flag && mEditor != null)
        {
            for (int i3 = 0; i3 < mEditor.mCursorCount; i3++)
            {
                Rect rect = mEditor.mCursorDrawable[i3].getBounds();
                l = Math.min(l, rect.top);
                j1 = Math.max(j1, rect.bottom);
            }

        }
        int k1 = getCompoundPaddingLeft();
        int l1 = getExtendedPaddingTop() + getVerticalOffset(true);
        int i2;
        int j2;
        if (k == i1 && !flag)
        {
            int k2 = (int)mLayout.getPrimaryHorizontal(i);
            int l2 = (int)(1.0D + (double)mLayout.getPrimaryHorizontal(j));
            i2 = k2 + k1;
            j2 = l2 + k1;
        } else
        {
            i2 = k1;
            j2 = getWidth() - getCompoundPaddingRight();
        }
        invalidate(i2 + super.mScrollX, l1 + l, j2 + super.mScrollX, l1 + j1);
    }

    public boolean isClipBoardShowing()
    {
        return false;
    }

    public boolean isCursorVisible()
    {
        if (mEditor == null)
            return true;
        else
            return mEditor.mCursorVisible;
    }

    boolean isInBatchEditMode()
    {
label0:
        {
            if (mEditor != null)
            {
                Editor.InputMethodState inputmethodstate = mEditor.mInputMethodState;
                if (inputmethodstate == null)
                    break label0;
                if (inputmethodstate.mBatchEditNesting > 0)
                    return true;
            }
            return false;
        }
        return mEditor.mInBatchEditControllers;
    }

    public boolean isInputMethodTarget()
    {
        InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
        return inputmethodmanager != null && inputmethodmanager.isActive(this);
    }

    public boolean isInsertImageMode()
    {
        return false;
    }

    protected boolean isPaddingOffsetRequired()
    {
        return mShadowRadius != 0.0F || mDrawables != null;
    }

    boolean isSingleLine()
    {
        return mSingleLine;
    }

    public boolean isSuggestionsEnabled()
    {
        if (mEditor != null && (0xf & mEditor.mInputType) == 1 && (0x80000 & mEditor.mInputType) <= 0)
        {
            int i = 0xff0 & mEditor.mInputType;
            if (i == 0 || i == 48 || i == 80 || i == 64 || i == 160)
                return true;
        }
        return false;
    }

    boolean isTextEditable()
    {
        return (mText instanceof Editable) && onCheckIsTextEditor() && isEnabled();
    }

    public boolean isTextSelectable()
    {
        if (mEditor == null)
            return false;
        else
            return mEditor.mTextIsSelectable;
    }

    public void jumpDrawablesToCurrentState()
    {
        super.jumpDrawablesToCurrentState();
        if (mDrawables != null)
        {
            if (mDrawables.mDrawableLeft != null)
                mDrawables.mDrawableLeft.jumpToCurrentState();
            if (mDrawables.mDrawableTop != null)
                mDrawables.mDrawableTop.jumpToCurrentState();
            if (mDrawables.mDrawableRight != null)
                mDrawables.mDrawableRight.jumpToCurrentState();
            if (mDrawables.mDrawableBottom != null)
                mDrawables.mDrawableBottom.jumpToCurrentState();
            if (mDrawables.mDrawableStart != null)
                mDrawables.mDrawableStart.jumpToCurrentState();
            if (mDrawables.mDrawableEnd != null)
                mDrawables.mDrawableEnd.jumpToCurrentState();
        }
    }

    public int length()
    {
        return mText.length();
    }

    protected void makeNewLayout(int i, int j, android.text.BoringLayout.Metrics metrics, android.text.BoringLayout.Metrics metrics1, int k, boolean flag)
    {
        stopMarquee();
        mOldMaximum = mMaximum;
        mOldMaxMode = mMaxMode;
        mHighlightPathBogus = true;
        if (i < 0)
            i = 0;
        if (j < 0)
            j = 0;
        android.text.Layout.Alignment alignment = getLayoutAlignment();
        boolean flag1;
        if (mEllipsize != null && getKeyListener() == null)
            flag1 = true;
        else
            flag1 = false;
        boolean flag2;
        if (mEllipsize == android.text.TextUtils.TruncateAt.MARQUEE && mMarqueeFadeMode != 0)
            flag2 = true;
        else
            flag2 = false;
        android.text.TextUtils.TruncateAt truncateat = mEllipsize;
        if (mEllipsize == android.text.TextUtils.TruncateAt.MARQUEE && mMarqueeFadeMode == 1)
            truncateat = android.text.TextUtils.TruncateAt.END_SMALL;
        if (mTextDir == null)
            mTextDir = getTextDirectionHeuristic();
        boolean flag3;
        if (truncateat == mEllipsize)
            flag3 = true;
        else
            flag3 = false;
        mLayout = makeSingleLayout(i, metrics, k, alignment, flag1, truncateat, flag3);
        if (flag2)
        {
            android.text.TextUtils.TruncateAt truncateat5;
            if (truncateat == android.text.TextUtils.TruncateAt.MARQUEE)
                truncateat5 = android.text.TextUtils.TruncateAt.END;
            else
                truncateat5 = android.text.TextUtils.TruncateAt.MARQUEE;
            boolean flag13;
            if (truncateat != mEllipsize)
                flag13 = true;
            else
                flag13 = false;
            mSavedMarqueeModeLayout = makeSingleLayout(i, metrics, k, alignment, flag1, truncateat5, flag13);
        }
        boolean flag4;
        if (mEllipsize != null)
            flag4 = true;
        else
            flag4 = false;
        mHintLayout = null;
        if (mHint != null)
        {
            if (flag4)
                j = i;
            android.text.BoringLayout.Metrics metrics2 = UNKNOWN_BORING;
            if (metrics1 == metrics2)
            {
                metrics1 = BoringLayout.isBoring(mHint, mTextPaint, mTextDir, mHintBoring);
                if (metrics1 != null)
                    mHintBoring = metrics1;
            }
            if (metrics1 != null)
            {
                if (metrics1.width > j || flag4 && metrics1.width > k)
                {
                    if (flag4 && metrics1.width <= j)
                    {
                        if (mSavedHintLayout != null)
                        {
                            BoringLayout boringlayout = mSavedHintLayout;
                            CharSequence charsequence5 = mHint;
                            TextPaint textpaint5 = mTextPaint;
                            float f10 = mSpacingMult;
                            float f11 = mSpacingAdd;
                            boolean flag10 = mIncludePad;
                            android.text.TextUtils.TruncateAt truncateat4 = mEllipsize;
                            mHintLayout = boringlayout.replaceOrMake(charsequence5, textpaint5, j, alignment, f10, f11, metrics1, flag10, truncateat4, k);
                        } else
                        {
                            CharSequence charsequence4 = mHint;
                            TextPaint textpaint4 = mTextPaint;
                            float f8 = mSpacingMult;
                            float f9 = mSpacingAdd;
                            boolean flag9 = mIncludePad;
                            android.text.TextUtils.TruncateAt truncateat3 = mEllipsize;
                            mHintLayout = BoringLayout.make(charsequence4, textpaint4, j, alignment, f8, f9, metrics1, flag9, truncateat3, k);
                        }
                    } else
                    if (flag4)
                    {
                        CharSequence charsequence3 = mHint;
                        int k1 = mHint.length();
                        TextPaint textpaint3 = mTextPaint;
                        TextDirectionHeuristic textdirectionheuristic3 = mTextDir;
                        float f6 = mSpacingMult;
                        float f7 = mSpacingAdd;
                        boolean flag8 = mIncludePad;
                        android.text.TextUtils.TruncateAt truncateat2 = mEllipsize;
                        int l1;
                        if (mMaxMode == 1)
                            l1 = mMaximum;
                        else
                            l1 = 0x7fffffff;
                        mHintLayout = new StaticLayout(charsequence3, 0, k1, textpaint3, j, alignment, textdirectionheuristic3, f6, f7, flag8, truncateat2, k, l1);
                    } else
                    {
                        CharSequence charsequence2 = mHint;
                        TextPaint textpaint2 = mTextPaint;
                        TextDirectionHeuristic textdirectionheuristic2 = mTextDir;
                        float f4 = mSpacingMult;
                        float f5 = mSpacingAdd;
                        boolean flag7 = mIncludePad;
                        mHintLayout = new StaticLayout(charsequence2, textpaint2, j, alignment, textdirectionheuristic2, f4, f5, flag7);
                    }
                } else
                {
                    if (mSavedHintLayout != null)
                    {
                        BoringLayout boringlayout1 = mSavedHintLayout;
                        CharSequence charsequence7 = mHint;
                        TextPaint textpaint7 = mTextPaint;
                        float f14 = mSpacingMult;
                        float f15 = mSpacingAdd;
                        boolean flag12 = mIncludePad;
                        mHintLayout = boringlayout1.replaceOrMake(charsequence7, textpaint7, j, alignment, f14, f15, metrics1, flag12);
                    } else
                    {
                        CharSequence charsequence6 = mHint;
                        TextPaint textpaint6 = mTextPaint;
                        float f12 = mSpacingMult;
                        float f13 = mSpacingAdd;
                        boolean flag11 = mIncludePad;
                        mHintLayout = BoringLayout.make(charsequence6, textpaint6, j, alignment, f12, f13, metrics1, flag11);
                    }
                    mSavedHintLayout = (BoringLayout)mHintLayout;
                }
            } else
            if (flag4)
            {
                CharSequence charsequence1 = mHint;
                int i1 = mHint.length();
                TextPaint textpaint1 = mTextPaint;
                TextDirectionHeuristic textdirectionheuristic1 = mTextDir;
                float f2 = mSpacingMult;
                float f3 = mSpacingAdd;
                boolean flag6 = mIncludePad;
                android.text.TextUtils.TruncateAt truncateat1 = mEllipsize;
                int j1;
                if (mMaxMode == 1)
                    j1 = mMaximum;
                else
                    j1 = 0x7fffffff;
                mHintLayout = new StaticLayout(charsequence1, 0, i1, textpaint1, j, alignment, textdirectionheuristic1, f2, f3, flag6, truncateat1, k, j1);
            } else
            {
                CharSequence charsequence = mHint;
                TextPaint textpaint = mTextPaint;
                TextDirectionHeuristic textdirectionheuristic = mTextDir;
                float f = mSpacingMult;
                float f1 = mSpacingAdd;
                boolean flag5 = mIncludePad;
                mHintLayout = new StaticLayout(charsequence, textpaint, j, alignment, textdirectionheuristic, f, f1, flag5);
            }
        }
        if (flag)
            registerForPreDraw();
        if (mEllipsize == android.text.TextUtils.TruncateAt.MARQUEE && !compressText(k))
        {
            int l = super.mLayoutParams.height;
            if (l != -2 && l != -1)
                startMarquee();
            else
                mRestartMarquee = true;
        }
        if (mEditor != null)
            mEditor.prepareCursorControllers();
    }

    public boolean moveCursorToVisibleOffset()
    {
        if (!(mText instanceof Spannable))
            return false;
        int i = getSelectionStart();
        if (i != getSelectionEnd())
            return false;
        int j = mLayout.getLineForOffset(i);
        int k = mLayout.getLineTop(j);
        int l = mLayout.getLineTop(j + 1);
        int i1 = super.mBottom - super.mTop - getExtendedPaddingTop() - getExtendedPaddingBottom();
        int j1 = (l - k) / 2;
        if (j1 > i1 / 4)
            j1 = i1 / 4;
        int k1 = super.mScrollY;
        if (k < k1 + j1)
            j = mLayout.getLineForVertical(k1 + j1 + (l - k));
        else
        if (l > (i1 + k1) - j1)
            j = mLayout.getLineForVertical((i1 + k1) - j1 - (l - k));
        int l1 = super.mRight - super.mLeft - getCompoundPaddingLeft() - getCompoundPaddingRight();
        int i2 = super.mScrollX;
        int j2 = mLayout.getOffsetForHorizontal(j, i2);
        int k2 = mLayout.getOffsetForHorizontal(j, l1 + i2);
        int l2;
        if (j2 < k2)
            l2 = j2;
        else
            l2 = k2;
        int i3;
        if (j2 > k2)
            i3 = j2;
        else
            i3 = k2;
        int j3 = i;
        if (j3 < l2)
            j3 = l2;
        else
        if (j3 > i3)
            j3 = i3;
        if (j3 != i)
        {
            Selection.setSelection((Spannable)mText, j3);
            return true;
        } else
        {
            return false;
        }
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        mTemporaryDetach = false;
        if (mEditor != null)
            mEditor.onAttachedToWindow();
    }

    public void onBeginBatchEdit()
    {
    }

    public boolean onCheckIsTextEditor()
    {
        return mEditor != null && mEditor.mInputType != 0;
    }

    public void onCommitCompletion(CompletionInfo completioninfo)
    {
    }

    public void onCommitCorrection(CorrectionInfo correctioninfo)
    {
        if (mEditor != null)
            mEditor.onCommitCorrection(correctioninfo);
    }

    public void onCopyClipboardContent(CharSequence charsequence)
    {
    }

    protected int[] onCreateDrawableState(int i)
    {
        int ai[];
        if (mSingleLine)
        {
            ai = super.onCreateDrawableState(i);
        } else
        {
            ai = super.onCreateDrawableState(i + 1);
            mergeDrawableStates(ai, MULTILINE_STATE_SET);
        }
        if (isTextSelectable())
        {
            int j = ai.length;
            for (int k = 0; k < j; k++)
                if (ai[k] == 0x10100a7)
                {
                    int ai1[] = new int[j - 1];
                    System.arraycopy(ai, 0, ai1, 0, k);
                    System.arraycopy(ai, k + 1, ai1, k, -1 + (j - k));
                    return ai1;
                }

        }
        return ai;
    }

    public InputConnection onCreateInputConnection(EditorInfo editorinfo)
    {
        if (onCheckIsTextEditor() && isEnabled())
        {
            mEditor.createInputMethodStateIfNeeded();
            editorinfo.inputType = getInputType();
            if (mEditor.mInputContentType != null)
            {
                editorinfo.imeOptions = mEditor.mInputContentType.imeOptions;
                editorinfo.privateImeOptions = mEditor.mInputContentType.privateImeOptions;
                editorinfo.actionLabel = mEditor.mInputContentType.imeActionLabel;
                editorinfo.actionId = mEditor.mInputContentType.imeActionId;
                editorinfo.extras = mEditor.mInputContentType.extras;
            } else
            {
                editorinfo.imeOptions = 0;
            }
            if (focusSearch(130) != null)
                editorinfo.imeOptions = 0x8000000 | editorinfo.imeOptions;
            if (focusSearch(33) != null)
                editorinfo.imeOptions = 0x4000000 | editorinfo.imeOptions;
            if ((0xff & editorinfo.imeOptions) == 0)
            {
                if ((0x8000000 & editorinfo.imeOptions) != 0)
                    editorinfo.imeOptions = 5 | editorinfo.imeOptions;
                else
                    editorinfo.imeOptions = 6 | editorinfo.imeOptions;
                if (!shouldAdvanceFocusOnEnter())
                    editorinfo.imeOptions = 0x40000000 | editorinfo.imeOptions;
            }
            if (isMultilineInputType(editorinfo.inputType))
                editorinfo.imeOptions = 0x40000000 | editorinfo.imeOptions;
            editorinfo.hintText = mHint;
            if (mText instanceof Editable)
            {
                EditableInputConnection editableinputconnection = new EditableInputConnection(this);
                editorinfo.initialSelStart = getSelectionStart();
                editorinfo.initialSelEnd = getSelectionEnd();
                editorinfo.initialCapsMode = editableinputconnection.getCursorCapsMode(getInputType());
                return editableinputconnection;
            }
        }
        return null;
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        if (mPreDrawRegistered)
        {
            getViewTreeObserver().removeOnPreDrawListener(this);
            mPreDrawRegistered = false;
        }
        resetResolvedDrawables();
        if (mEditor != null)
            mEditor.onDetachedFromWindow();
    }

    public boolean onDragEvent(DragEvent dragevent)
    {
        switch (dragevent.getAction())
        {
        case 3: // '\003'
            if (mEditor != null)
            {
                mEditor.onDrop(dragevent);
                return true;
            }
            // fall through

        case 4: // '\004'
        default:
            return true;

        case 2: // '\002'
            int i = getOffsetForPosition(dragevent.getX(), dragevent.getY());
            Selection.setSelection((Spannable)mText, i);
            return true;

        case 5: // '\005'
            requestFocus();
            return true;

        case 1: // '\001'
            break;
        }
        boolean flag;
        if (mEditor != null && mEditor.hasInsertionController())
            flag = true;
        else
            flag = false;
        return flag;
    }

    protected void onDraw(Canvas canvas)
    {
        restartMarqueeIfNeeded();
        super.onDraw(canvas);
        int i = getCompoundPaddingLeft();
        int j = getCompoundPaddingTop();
        int k = getCompoundPaddingRight();
        int l = getCompoundPaddingBottom();
        int i1 = super.mScrollX;
        int j1 = super.mScrollY;
        int k1 = super.mRight;
        int l1 = super.mLeft;
        int i2 = super.mBottom;
        int j2 = super.mTop;
        boolean flag = isLayoutRtl();
        int k2 = getHorizontalOffsetForDrawables();
        int l2;
        if (flag)
            l2 = 0;
        else
            l2 = k2;
        int i3;
        if (flag)
            i3 = k2;
        else
            i3 = 0;
        Drawables drawables = mDrawables;
        if (drawables != null)
        {
            int i7 = i2 - j2 - l - j;
            int j7 = k1 - l1 - k - i;
            if (drawables.mDrawableLeft != null)
            {
                canvas.save();
                canvas.translate(l2 + (i1 + super.mPaddingLeft), j1 + j + (i7 - drawables.mDrawableHeightLeft) / 2);
                drawables.mDrawableLeft.draw(canvas);
                canvas.restore();
            }
            if (drawables.mDrawableRight != null)
            {
                canvas.save();
                canvas.translate((i1 + k1) - l1 - super.mPaddingRight - drawables.mDrawableSizeRight - i3, j1 + j + (i7 - drawables.mDrawableHeightRight) / 2);
                drawables.mDrawableRight.draw(canvas);
                canvas.restore();
            }
            if (drawables.mDrawableTop != null)
            {
                canvas.save();
                canvas.translate(i1 + i + (j7 - drawables.mDrawableWidthTop) / 2, j1 + super.mPaddingTop);
                drawables.mDrawableTop.draw(canvas);
                canvas.restore();
            }
            if (drawables.mDrawableBottom != null)
            {
                canvas.save();
                canvas.translate(i1 + i + (j7 - drawables.mDrawableWidthBottom) / 2, (j1 + i2) - j2 - super.mPaddingBottom - drawables.mDrawableSizeBottom);
                drawables.mDrawableBottom.draw(canvas);
                canvas.restore();
            }
        }
        int j3 = mCurTextColor;
        if (mLayout == null)
            assumeLayout();
        Layout layout = mLayout;
        if (mHint != null && mText.length() == 0)
        {
            if (mHintTextColor != null)
                j3 = mCurHintTextColor;
            layout = mHintLayout;
        }
        mTextPaint.setColor(j3);
        mTextPaint.drawableState = getDrawableState();
        canvas.save();
        int k3 = getExtendedPaddingTop();
        int l3 = getExtendedPaddingBottom();
        int i4 = super.mBottom - super.mTop - l - j;
        int j4 = mLayout.getHeight() - i4;
        float f = i + i1;
        float f1;
        if (j1 == 0)
            f1 = 0.0F;
        else
            f1 = k3 + j1;
        float f2 = i1 + (k1 - l1 - k);
        int k4 = j1 + (i2 - j2);
        if (j1 == j4)
            l3 = 0;
        float f3 = k4 - l3;
        if (mShadowRadius != 0.0F)
        {
            f += Math.min(0.0F, mShadowDx - mShadowRadius);
            f2 += Math.max(0.0F, mShadowDx + mShadowRadius);
            f1 += Math.min(0.0F, mShadowDy - mShadowRadius);
            f3 += Math.max(0.0F, mShadowDy + mShadowRadius);
        }
        canvas.clipRect(f, f1, f2, f3);
        int l4 = 0x70 & mGravity;
        int i5 = 0;
        int j5 = 0;
        if (l4 != 48)
        {
            j5 = getVerticalOffset(false);
            i5 = getVerticalOffset(true);
        }
        canvas.translate(i, k3 + j5);
        int k5 = getLayoutDirection();
        int l5 = Gravity.getAbsoluteGravity(mGravity, k5);
        if (mEllipsize == android.text.TextUtils.TruncateAt.MARQUEE && mMarqueeFadeMode != 1)
        {
            if (!mSingleLine && getLineCount() == 1 && canMarquee() && (l5 & 7) != 3)
            {
                int k6 = super.mRight - super.mLeft;
                int l6 = getCompoundPaddingLeft() + getCompoundPaddingRight();
                float f6 = mLayout.getLineRight(0) - (float)(k6 - l6);
                if (flag)
                    f6 = -f6;
                canvas.translate(f6, 0.0F);
            }
            if (mMarquee != null && mMarquee.isRunning())
            {
                float f5 = -mMarquee.getScroll();
                if (flag)
                    f5 = -f5;
                canvas.translate(f5, 0.0F);
            }
        }
        int i6 = i5 - j5;
        Path path = getUpdatedHighlightPath();
        if (mEditor != null)
            mEditor.onDraw(canvas, layout, path, mHighlightPaint, i6);
        else
            layout.draw(canvas, path, mHighlightPaint, i6);
        if (mMarquee != null && mMarquee.shouldDrawGhost())
        {
            int j6 = (int)mMarquee.getGhostOffset();
            float f4;
            if (flag)
                f4 = -j6;
            else
                f4 = j6;
            canvas.translate(f4, 0.0F);
            layout.draw(canvas, path, mHighlightPaint, i6);
        }
        canvas.restore();
    }

    public void onEditorAction(int i)
    {
label0:
        {
            Editor.InputContentType inputcontenttype;
            if (mEditor == null)
                inputcontenttype = null;
            else
                inputcontenttype = mEditor.mInputContentType;
            if (inputcontenttype != null)
            {
                if (inputcontenttype.onEditorActionListener != null && inputcontenttype.onEditorActionListener.onEditorAction(this, i, null))
                    break label0;
                if (i == 5)
                {
                    View view1 = focusSearch(2);
                    if (view1 != null && !view1.requestFocus(2))
                        throw new IllegalStateException("focus search returned a view that wasn't able to take focus!");
                    break label0;
                }
                if (i == 7)
                {
                    View view = focusSearch(1);
                    if (view != null && !view.requestFocus(1))
                        throw new IllegalStateException("focus search returned a view that wasn't able to take focus!");
                    break label0;
                }
                if (i == 6)
                {
                    InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
                    if (inputmethodmanager != null && inputmethodmanager.isActive(this))
                    {
                        inputmethodmanager.hideSoftInputFromWindow(getWindowToken(), 0);
                        return;
                    }
                    break label0;
                }
            }
            ViewRootImpl viewrootimpl = getViewRootImpl();
            if (viewrootimpl != null)
            {
                long l = SystemClock.uptimeMillis();
                viewrootimpl.dispatchKeyFromIme(new KeyEvent(l, l, 0, 66, 0, 0, -1, 0, 22));
                viewrootimpl.dispatchKeyFromIme(new KeyEvent(SystemClock.uptimeMillis(), l, 1, 66, 0, 0, -1, 0, 22));
                return;
            }
        }
    }

    public void onEndBatchEdit()
    {
    }

    public void onFinishTemporaryDetach()
    {
        super.onFinishTemporaryDetach();
        if (!mDispatchTemporaryDetach)
            mTemporaryDetach = false;
        if (mEditor != null)
            mEditor.mTemporaryDetach = false;
    }

    protected void onFocusChanged(boolean flag, int i, Rect rect)
    {
        if (mTemporaryDetach)
        {
            super.onFocusChanged(flag, i, rect);
            return;
        }
        if (mEditor != null)
            mEditor.onFocusChanged(flag, i);
        if (flag && (mText instanceof Spannable))
            MetaKeyKeyListener.resetMetaState((Spannable)mText);
        startStopMarquee(flag);
        if (mTransformation != null)
            mTransformation.onFocusChanged(this, mText, flag, i, rect);
        super.onFocusChanged(flag, i, rect);
    }

    public boolean onGenericMotionEvent(MotionEvent motionevent)
    {
        if (mMovement == null || !(mText instanceof Spannable) || mLayout == null)
            break MISSING_BLOCK_LABEL_50;
        boolean flag = mMovement.onGenericMotionEvent(this, (Spannable)mText, motionevent);
        if (flag)
            return true;
        break MISSING_BLOCK_LABEL_50;
        AbstractMethodError abstractmethoderror;
        abstractmethoderror;
        return super.onGenericMotionEvent(motionevent);
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/TextView.getName());
        accessibilityevent.setPassword(hasPasswordTransformationMethod());
        if (accessibilityevent.getEventType() == 8192)
        {
            accessibilityevent.setFromIndex(Selection.getSelectionStart(mText));
            accessibilityevent.setToIndex(Selection.getSelectionEnd(mText));
            accessibilityevent.setItemCount(mText.length());
        }
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/TextView.getName());
        boolean flag = hasPasswordTransformationMethod();
        accessibilitynodeinfo.setPassword(flag);
        if (!flag)
            accessibilitynodeinfo.setText(getTextForAccessibility());
        if (TextUtils.isEmpty(getContentDescription()) && !TextUtils.isEmpty(mText))
        {
            accessibilitynodeinfo.addAction(256);
            accessibilitynodeinfo.addAction(512);
            accessibilitynodeinfo.setMovementGranularities(31);
        }
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        if (doKeyDown(i, keyevent, null) == 0)
            return super.onKeyDown(i, keyevent);
        else
            return true;
    }

    public boolean onKeyMultiple(int i, int j, KeyEvent keyevent)
    {
        KeyEvent keyevent1 = KeyEvent.changeAction(keyevent, 0);
        int k = doKeyDown(i, keyevent1, keyevent);
        if (k == 0)
            return super.onKeyMultiple(i, j, keyevent);
        if (k == -1)
            return true;
        int l = j - 1;
        KeyEvent keyevent2 = KeyEvent.changeAction(keyevent, 1);
        if (k == 1)
        {
            mEditor.mKeyListener.onKeyUp(this, (Editable)mText, i, keyevent2);
            while (--l > 0) 
            {
                mEditor.mKeyListener.onKeyDown(this, (Editable)mText, i, keyevent1);
                mEditor.mKeyListener.onKeyUp(this, (Editable)mText, i, keyevent2);
            }
            hideErrorIfUnchanged();
        } else
        if (k == 2)
        {
            mMovement.onKeyUp(this, (Spannable)mText, i, keyevent2);
            while (--l > 0) 
            {
                mMovement.onKeyDown(this, (Spannable)mText, i, keyevent1);
                mMovement.onKeyUp(this, (Spannable)mText, i, keyevent2);
            }
        }
        return true;
    }

    public boolean onKeyPreIme(int i, KeyEvent keyevent)
    {
        if (i == 4)
        {
            boolean flag;
            if (mEditor != null && mEditor.mSelectionActionMode != null)
                flag = true;
            else
                flag = false;
            if (flag)
            {
                if (keyevent.getAction() == 0 && keyevent.getRepeatCount() == 0)
                {
                    android.view.KeyEvent.DispatcherState dispatcherstate1 = getKeyDispatcherState();
                    if (dispatcherstate1 != null)
                        dispatcherstate1.startTracking(keyevent, this);
                    return true;
                }
                if (keyevent.getAction() == 1)
                {
                    android.view.KeyEvent.DispatcherState dispatcherstate = getKeyDispatcherState();
                    if (dispatcherstate != null)
                        dispatcherstate.handleUpEvent(keyevent);
                    if (keyevent.isTracking() && !keyevent.isCanceled())
                    {
                        stopSelectionActionMode();
                        return true;
                    }
                }
            }
        }
        return super.onKeyPreIme(i, keyevent);
    }

    public boolean onKeyShortcut(int i, KeyEvent keyevent)
    {
        if (KeyEvent.metaStateHasNoModifiers(0xffff8fff & keyevent.getMetaState()))
            switch (i)
            {
            default:
                break;

            case 50: // '2'
                if (canPaste())
                    return onTextContextMenuItem(0x1020022);
                break;

            case 31: // '\037'
                if (canCopy())
                    return onTextContextMenuItem(0x1020021);
                break;

            case 52: // '4'
                if (canCut())
                    return onTextContextMenuItem(0x1020020);
                break;

            case 29: // '\035'
                if (canSelectText())
                    return onTextContextMenuItem(0x102001f);
                break;
            }
        return super.onKeyShortcut(i, keyevent);
    }

    public boolean onKeyUp(int i, KeyEvent keyevent)
    {
        if (!isEnabled())
            return super.onKeyUp(i, keyevent);
        switch (i)
        {
        case 66: // 'B'
            if (keyevent.hasNoModifiers())
            {
                if (mEditor != null && mEditor.mInputContentType != null && mEditor.mInputContentType.onEditorActionListener != null && mEditor.mInputContentType.enterDown)
                {
                    mEditor.mInputContentType.enterDown = false;
                    if (mEditor.mInputContentType.onEditorActionListener.onEditorAction(this, 0, keyevent))
                        return true;
                }
                if (((0x10 & keyevent.getFlags()) != 0 || shouldAdvanceFocusOnEnter()) && !hasOnClickListeners())
                {
                    View view = focusSearch(130);
                    if (view != null)
                        if (!view.requestFocus(130))
                        {
                            throw new IllegalStateException("focus search returned a view that wasn't able to take focus!");
                        } else
                        {
                            super.onKeyUp(i, keyevent);
                            return true;
                        }
                    if ((0x10 & keyevent.getFlags()) != 0)
                    {
                        InputMethodManager inputmethodmanager1 = InputMethodManager.peekInstance();
                        if (inputmethodmanager1 != null && inputmethodmanager1.isActive(this))
                            inputmethodmanager1.hideSoftInputFromWindow(getWindowToken(), 0);
                    }
                }
                return super.onKeyUp(i, keyevent);
            }
            // fall through

        default:
            if (mEditor != null && mEditor.mKeyListener != null && mEditor.mKeyListener.onKeyUp(this, (Editable)mText, i, keyevent))
                return true;
            if (mMovement != null && mLayout != null && mMovement.onKeyUp(this, (Spannable)mText, i, keyevent))
                return true;
            else
                return super.onKeyUp(i, keyevent);

        case 23: // '\027'
            break;
        }
        if (keyevent.hasNoModifiers() && !hasOnClickListeners() && mMovement != null && (mText instanceof Editable) && mLayout != null && onCheckIsTextEditor())
        {
            InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
            viewClicked(inputmethodmanager);
            if (inputmethodmanager != null && getShowSoftInputOnFocus())
                inputmethodmanager.showSoftInput(this, 0);
        }
        return super.onKeyUp(i, keyevent);
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
        if (mDeferScroll >= 0)
        {
            int i1 = mDeferScroll;
            mDeferScroll = -1;
            bringPointIntoView(Math.min(i1, mText.length()));
        }
        if (flag && mEditor != null)
            mEditor.invalidateTextDisplayList();
    }

    void onLocaleChanged()
    {
        mEditor.mWordIterator = null;
    }

    protected void onMeasure(int i, int j)
    {
        int k = android.view.View.MeasureSpec.getMode(i);
        int l = android.view.View.MeasureSpec.getMode(j);
        int i1 = android.view.View.MeasureSpec.getSize(i);
        int j1 = android.view.View.MeasureSpec.getSize(j);
        android.text.BoringLayout.Metrics metrics = UNKNOWN_BORING;
        android.text.BoringLayout.Metrics metrics1 = UNKNOWN_BORING;
        if (mTextDir == null)
            getTextDirectionHeuristic();
        int k1 = -1;
        boolean flag = false;
        int j3;
        if (k == 0x40000000)
        {
            j3 = i1;
        } else
        {
            if (mLayout != null && mEllipsize == null)
                k1 = desired(mLayout);
            if (k1 < 0)
            {
                metrics = BoringLayout.isBoring(mTransformed, mTextPaint, mTextDir, mBoring);
                flag = false;
                if (metrics != null)
                    mBoring = metrics;
            } else
            {
                flag = true;
            }
            int l1;
            if (metrics != null && metrics != UNKNOWN_BORING)
            {
                l1 = metrics.width;
            } else
            {
                if (k1 < 0)
                    k1 = (int)FloatMath.ceil(Layout.getDesiredWidth(mTransformed, mTextPaint));
                l1 = k1;
            }
            Drawables drawables = mDrawables;
            if (drawables != null)
            {
                int j6 = drawables.mDrawableWidthTop;
                l1 = Math.max(Math.max(l1, j6), drawables.mDrawableWidthBottom);
            }
            if (mHint != null)
            {
                int l5 = -1;
                if (mHintLayout != null && mEllipsize == null)
                    l5 = desired(mHintLayout);
                if (l5 < 0)
                {
                    metrics1 = BoringLayout.isBoring(mHint, mTextPaint, mTextDir, mHintBoring);
                    if (metrics1 != null)
                        mHintBoring = metrics1;
                }
                int i6;
                if (metrics1 != null && metrics1 != UNKNOWN_BORING)
                {
                    i6 = metrics1.width;
                } else
                {
                    if (l5 < 0)
                        l5 = (int)FloatMath.ceil(Layout.getDesiredWidth(mHint, mTextPaint));
                    i6 = l5;
                }
                if (i6 > l1)
                    l1 = i6;
            }
            int i2 = l1 + (getCompoundPaddingLeft() + getCompoundPaddingRight());
            int j2;
            if (mMaxWidthMode == 1)
                j2 = Math.min(i2, mMaxWidth * getLineHeight());
            else
                j2 = Math.min(i2, mMaxWidth);
            int l2;
            if (mMinWidthMode == 1)
            {
                int k5 = mMinWidth * getLineHeight();
                l2 = Math.max(j2, k5);
            } else
            {
                int k2 = mMinWidth;
                l2 = Math.max(j2, k2);
            }
            int i3 = getSuggestedMinimumWidth();
            j3 = Math.max(l2, i3);
            if (k == 0x80000000)
                j3 = Math.min(i1, j3);
        }
        int k3 = j3 - getCompoundPaddingLeft() - getCompoundPaddingRight();
        int l3 = k3;
        if (mHorizontallyScrolling)
            k3 = 0x100000;
        int i4 = k3;
        int j4;
        if (mHintLayout == null)
            j4 = i4;
        else
            j4 = mHintLayout.getWidth();
        if (mLayout == null)
        {
            makeNewLayout(k3, i4, metrics, metrics1, j3 - getCompoundPaddingLeft() - getCompoundPaddingRight(), false);
        } else
        {
            boolean flag1;
            if (mLayout.getWidth() == k3 && j4 == i4 && mLayout.getEllipsizedWidth() == j3 - getCompoundPaddingLeft() - getCompoundPaddingRight())
                flag1 = false;
            else
                flag1 = true;
            boolean flag2;
            if (mHint != null || mEllipsize != null || k3 <= mLayout.getWidth() || !(mLayout instanceof BoringLayout) && (!flag || k1 < 0 || k1 > k3))
                flag2 = false;
            else
                flag2 = true;
            boolean flag3;
            if (mMaxMode == mOldMaxMode && mMaximum == mOldMaximum)
                flag3 = false;
            else
                flag3 = true;
            if (flag1 || flag3)
                if (!flag3 && flag2)
                    mLayout.increaseWidthTo(k3);
                else
                    makeNewLayout(k3, i4, metrics, metrics1, j3 - getCompoundPaddingLeft() - getCompoundPaddingRight(), false);
        }
        int l4;
        if (l == 0x40000000)
        {
            l4 = j1;
            mDesiredHeightAtMeasure = -1;
        } else
        {
            int k4 = getDesiredHeight();
            l4 = k4;
            mDesiredHeightAtMeasure = k4;
            if (l == 0x80000000)
                l4 = Math.min(k4, j1);
        }
        int i5 = l4 - getCompoundPaddingTop() - getCompoundPaddingBottom();
        if (mMaxMode == 1 && mLayout.getLineCount() > mMaximum)
        {
            int j5 = mLayout.getLineTop(mMaximum);
            i5 = Math.min(i5, j5);
        }
        if (mMovement == null && mLayout.getWidth() <= l3 && mLayout.getHeight() <= i5)
            scrollTo(0, 0);
        else
            registerForPreDraw();
        setMeasuredDimension(j3, l4);
    }

    public void onPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onPopulateAccessibilityEvent(accessibilityevent);
        if (!hasPasswordTransformationMethod() || shouldSpeakPasswordsForAccessibility())
        {
            CharSequence charsequence = getTextForAccessibility();
            if (!TextUtils.isEmpty(charsequence))
                accessibilityevent.getText().add(charsequence);
        }
    }

    public boolean onPreDraw()
    {
        if (mLayout == null)
            assumeLayout();
        boolean flag;
        if (mMovement != null)
        {
            int i = getSelectionEnd();
            if (mEditor != null && mEditor.mSelectionModifierCursorController != null && mEditor.mSelectionModifierCursorController.isSelectionStartDragged())
                i = getSelectionStart();
            if (i < 0 && (0x70 & mGravity) == 80)
                i = mText.length();
            flag = false;
            if (i >= 0)
                flag = bringPointIntoView(i);
        } else
        {
            flag = bringTextIntoView();
        }
        if (mEditor != null && mEditor.mCreatedWithASelection)
        {
            mEditor.startSelectionActionMode();
            mEditor.mCreatedWithASelection = false;
        }
        if ((this instanceof ExtractEditText) && hasSelection() && mEditor != null)
            mEditor.startSelectionActionMode();
        getViewTreeObserver().removeOnPreDrawListener(this);
        mPreDrawRegistered = false;
        boolean flag1 = false;
        if (!flag)
            flag1 = true;
        return flag1;
    }

    public boolean onPrivateIMECommand(String s, Bundle bundle)
    {
        if (s.equals("YULONG_IME_SEND_TOUCH_EVENT"))
        {
            View view = getRootView();
            if (view != null)
            {
                Log.d("TextView", "onPrivateIMECommand ViewRoot YULONG_IME_SEND_TOUCH_EVENT");
                android.view.ViewParent viewparent = view.getParent();
                boolean flag = viewparent instanceof ViewRootImpl;
                ViewRootImpl viewrootimpl = null;
                if (flag)
                    viewrootimpl = (ViewRootImpl)viewparent;
                MotionEvent motionevent = null;
                if (bundle != null)
                    motionevent = (MotionEvent)bundle.getParcelable("YULONG_IME_SEND_TOUCH_EVENT");
                if (motionevent != null && viewrootimpl != null)
                {
                    Rect rect = viewrootimpl.getYLWindowFrame();
                    motionevent.setLocation(motionevent.getX(), motionevent.getY());
                    motionevent.offsetLocation(-(float)rect.left, -(float)rect.top);
                    motionevent.setSource(4098);
                    viewrootimpl.dispatchPointer(motionevent, false);
                }
                return true;
            }
        }
        return false;
    }

    public void onResolveDrawables(int i)
    {
        if (mLastLayoutDirection != i)
        {
            mLastLayoutDirection = i;
            if (mDrawables != null)
            {
                mDrawables.resolveWithLayoutDirection(i);
                return;
            }
        }
    }

    public void onRestoreInstanceState(Parcelable parcelable)
    {
        if (!(parcelable instanceof SavedState))
        {
            super.onRestoreInstanceState(parcelable);
        } else
        {
            SavedState savedstate = (SavedState)parcelable;
            super.onRestoreInstanceState(savedstate.getSuperState());
            if (savedstate.text != null)
                setText(savedstate.text);
            if (savedstate.selStart >= 0 && savedstate.selEnd >= 0 && (mText instanceof Spannable))
            {
                int i = mText.length();
                if (savedstate.selStart <= i && savedstate.selEnd <= i)
                {
                    Selection.setSelection((Spannable)mText, savedstate.selStart, savedstate.selEnd);
                    if (savedstate.frozenWithFocus)
                    {
                        createEditorIfNeeded();
                        mEditor.mFrozenWithFocus = true;
                    }
                } else
                {
                    String s = "";
                    if (savedstate.text != null)
                        s = "(restored) ";
                    Log.e("TextView", (new StringBuilder()).append("Saved cursor position ").append(savedstate.selStart).append("/").append(savedstate.selEnd).append(" out of range for ").append(s).append("text ").append(mText).toString());
                }
            }
            if (savedstate.error != null)
            {
                post(new Runnable() {

                    final TextView this$0;
                    final CharSequence val$error;

                    public void run()
                    {
                        setError(error);
                    }

            
            {
                this$0 = TextView.this;
                error = charsequence;
                super();
            }
                }
);
                return;
            }
        }
    }

    public void onRtlPropertiesChanged(int i)
    {
        if (mLayoutAlignment != null && (mResolvedTextAlignment == 5 || mResolvedTextAlignment == 6))
            mLayoutAlignment = null;
    }

    public Parcelable onSaveInstanceState()
    {
        Parcelable parcelable = super.onSaveInstanceState();
        boolean flag = mFreezesText;
        CharSequence charsequence = mText;
        int i = 0;
        int j = 0;
        if (charsequence != null)
        {
            j = getSelectionStart();
            i = getSelectionEnd();
            if (j >= 0 || i >= 0)
                flag = true;
        }
        if (flag)
        {
            SavedState savedstate = new SavedState(parcelable);
            savedstate.selStart = j;
            savedstate.selEnd = i;
            if (mText instanceof Spanned)
            {
                SpannableString spannablestring = new SpannableString(mText);
                ChangeWatcher achangewatcher[] = (ChangeWatcher[])spannablestring.getSpans(0, spannablestring.length(), android/widget/TextView$ChangeWatcher);
                int k = achangewatcher.length;
                for (int l = 0; l < k; l++)
                    spannablestring.removeSpan(achangewatcher[l]);

                if (mEditor != null)
                {
                    removeMisspelledSpans(spannablestring);
                    spannablestring.removeSpan(mEditor.mSuggestionRangeSpan);
                }
                savedstate.text = spannablestring;
            } else
            {
                savedstate.text = mText.toString();
            }
            if (isFocused() && j >= 0 && i >= 0)
                savedstate.frozenWithFocus = true;
            savedstate.error = getError();
            return savedstate;
        } else
        {
            return parcelable;
        }
    }

    public void onScreenStateChanged(int i)
    {
        super.onScreenStateChanged(i);
        if (mEditor != null)
            mEditor.onScreenStateChanged(i);
    }

    protected void onScrollChanged(int i, int j, int k, int l)
    {
        super.onScrollChanged(i, j, k, l);
        if (mEditor != null)
            mEditor.onScrollChanged();
    }

    protected void onSelectionChanged(int i, int j)
    {
        sendAccessibilityEvent(8192);
    }

    public void onStartTemporaryDetach()
    {
        super.onStartTemporaryDetach();
        if (!mDispatchTemporaryDetach)
            mTemporaryDetach = true;
        if (mEditor != null)
            mEditor.mTemporaryDetach = true;
    }

    protected void onTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    public boolean onTextContextMenuItem(int i)
    {
        boolean flag = true;
        int j = mText.length();
        boolean flag1 = isFocused();
        int k = 0;
        if (flag1)
        {
            int l = getSelectionStart();
            int i1 = getSelectionEnd();
            k = Math.max(0, Math.min(l, i1));
            j = Math.max(0, Math.max(l, i1));
        }
        switch (i)
        {
        case 16908321: 
            setPrimaryClip(ClipData.newPlainText(null, getTransformedText(k, j)));
            stopSelectionActionMode();
            return flag;

        case 16908320: 
            setPrimaryClip(ClipData.newPlainText(null, getTransformedText(k, j)));
            deleteText_internal(k, j);
            stopSelectionActionMode();
            return flag;

        case 16908322: 
            paste(k, j);
            return flag;

        case 16908319: 
            selectAllText();
            return flag;

        case 16908333: 
            if (mEditor != null && mEditor.hasSelectionController())
                mEditor.hideInsertionPointCursorControllerP();
            if (mEditor != null && mEditor.selectCurrentWordP() && mEditor.hasSelectionController())
            {
                mEditor.getSelectionController().show();
                return flag;
            }
            break;

        default:
            flag = false;
            break;
        }
        return flag;
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        int i = motionevent.getActionMasked();
        if (mEditor != null)
            mEditor.onTouchEvent(motionevent);
        boolean flag = super.onTouchEvent(motionevent);
        if (mEditor != null && mEditor.mDiscardNextActionUp && i == 1)
        {
            mEditor.mDiscardNextActionUp = false;
            mTextViewDiscardNextActionUp = false;
        } else
        {
            if (mEditor == null && mTextViewDiscardNextActionUp && i == 1)
            {
                mTextViewDiscardNextActionUp = false;
                return flag;
            }
            boolean flag1;
            if (i == 1 && (mEditor == null || !mEditor.mIgnoreActionUpEvent) && isFocused())
                flag1 = true;
            else
                flag1 = false;
            if ((mMovement != null || onCheckIsTextEditor()) && isEnabled() && (mText instanceof Spannable) && mLayout != null)
            {
                MovementMethod movementmethod = mMovement;
                boolean flag2 = false;
                if (movementmethod != null)
                    flag2 = false | mMovement.onTouchEvent(this, (Spannable)mText, motionevent);
                boolean flag3 = isTextSelectable();
                if (flag1 && mLinksClickable && mAutoLinkMask != 0 && flag3)
                {
                    ClickableSpan aclickablespan[] = (ClickableSpan[])((Spannable)mText).getSpans(getSelectionStart(), getSelectionEnd(), android/text/style/ClickableSpan);
                    if (aclickablespan.length > 0)
                    {
                        aclickablespan[0].onClick(this);
                        flag2 = true;
                    }
                }
                if (flag1 && (isTextEditable() || flag3))
                {
                    InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
                    viewClicked(inputmethodmanager);
                    if (!flag3 && mEditor.mShowSoftInputOnFocus)
                    {
                        boolean flag4 = false;
                        if (inputmethodmanager != null)
                        {
                            boolean flag5 = inputmethodmanager.showSoftInput(this, 0);
                            flag4 = false;
                            if (flag5)
                                flag4 = true;
                        }
                        boolean _tmp = flag2 | flag4;
                    }
                    mEditor.onTouchUpEvent(motionevent);
                    flag2 = true;
                }
                if (flag2)
                    return true;
            }
        }
        return flag;
    }

    public boolean onTrackballEvent(MotionEvent motionevent)
    {
        if (mMovement != null && (mText instanceof Spannable) && mLayout != null && mMovement.onTrackballEvent(this, (Spannable)mText, motionevent))
            return true;
        else
            return super.onTrackballEvent(motionevent);
    }

    protected void onVisibilityChanged(View view, int i)
    {
        super.onVisibilityChanged(view, i);
        if (mEditor != null && i != 0)
            mEditor.hideControllers();
    }

    public void onWindowFocusChanged(boolean flag)
    {
        super.onWindowFocusChanged(flag);
        if (mEditor != null)
            mEditor.onWindowFocusChanged(flag);
        startStopMarquee(flag);
    }

    protected void onYlContextMenuClick(int i)
    {
    }

    protected boolean onYlCusorControllerTouchEvent(MotionEvent motionevent)
    {
        return false;
    }

    public boolean onYlPrivateIMECommand(String s, Bundle bundle)
    {
        if (s.equals("YULONG_IME_SEND_TOUCH_EVENT"))
        {
            View view = getRootView();
            if (view != null)
            {
                android.view.ViewParent viewparent = view.getParent();
                boolean flag = viewparent instanceof ViewRootImpl;
                ViewRootImpl viewrootimpl = null;
                if (flag)
                    viewrootimpl = (ViewRootImpl)viewparent;
                MotionEvent motionevent = null;
                if (bundle != null)
                    motionevent = (MotionEvent)bundle.getParcelable("YULONG_IME_SEND_TOUCH_EVENT");
                if (motionevent != null && viewrootimpl != null)
                {
                    if (motionevent.getPointerCount() > 1 && mEditor != null)
                        mEditor.hideInsertionPointCursorControllerP();
                    Rect rect = viewrootimpl.getYLWindowFrame();
                    motionevent.setLocation(motionevent.getX(), motionevent.getY());
                    motionevent.offsetLocation(-(float)rect.left, -(float)rect.top);
                    motionevent.setSource(4098);
                    if (dispatchPointerToPopupWindow(motionevent))
                        return true;
                    viewrootimpl.enqueueInputEvent(motionevent);
                }
                return true;
            }
        } else
        {
            if (s.equals("YULONG_IME_SEND_BEGIN_INPUT_EVENT"))
            {
                if (mEditor != null)
                    mEditor.hideInsertionPointCursorControllerP();
                return true;
            }
            if (s.equals("YULONG_IME_SEND_BEGIN_HANDWRITE_EVENT"))
            {
                mYlHandWriteOpened = true;
                return true;
            }
            if (s.equals("YULONG_IME_SEND_END_HANDWRITE_EVENT"))
            {
                mYlHandWriteOpened = false;
                return true;
            }
            if (s.equals("YULONG_IME_SEND_OPEN_EDITMENU_EVENT"))
            {
                if (mEditor != null)
                    mEditor.startSelectionActionModeOnMenu();
                return true;
            }
        }
        return false;
    }

    public boolean performLongClick()
    {
        boolean flag = super.performLongClick();
        boolean flag1 = false;
        if (flag)
        {
            mTextViewDiscardNextActionUp = true;
            flag1 = true;
        }
        if (mEditor != null)
            flag1 |= mEditor.performLongClick(flag1);
        if (flag1)
        {
            performHapticFeedback(0);
            if (mEditor != null)
                mEditor.mDiscardNextActionUp = true;
            mTextViewDiscardNextActionUp = true;
        }
        return flag1;
    }

    long prepareSpacesAroundPaste(int i, int j, CharSequence charsequence)
    {
        if (charsequence.length() > 0)
        {
            if (i > 0)
            {
                char c2 = mTransformed.charAt(i - 1);
                char c3 = charsequence.charAt(0);
                if (Character.isSpaceChar(c2) && Character.isSpaceChar(c3))
                {
                    int i1 = mText.length();
                    deleteText_internal(i - 1, i);
                    int j1 = mText.length() - i1;
                    i += j1;
                    j += j1;
                } else
                if (!Character.isSpaceChar(c2) && c2 != '\n' && !Character.isSpaceChar(c3) && c3 != '\n')
                {
                    int k = mText.length();
                    replaceText_internal(i, i, " ");
                    int l = mText.length() - k;
                    i += l;
                    j += l;
                }
            }
            if (j < mText.length())
            {
                char c = charsequence.charAt(-1 + charsequence.length());
                char c1 = mTransformed.charAt(j);
                if (Character.isSpaceChar(c) && Character.isSpaceChar(c1))
                    deleteText_internal(j, j + 1);
                else
                if (!Character.isSpaceChar(c) && c != '\n' && !Character.isSpaceChar(c1) && c1 != '\n')
                    replaceText_internal(j, j, " ");
            }
        }
        return TextUtils.packRangeInLong(i, j);
    }

    void removeMisspelledSpans(Spannable spannable)
    {
        SuggestionSpan asuggestionspan[] = (SuggestionSpan[])spannable.getSpans(0, spannable.length(), android/text/style/SuggestionSpan);
        for (int i = 0; i < asuggestionspan.length; i++)
        {
            int j = asuggestionspan[i].getFlags();
            if ((j & 1) != 0 && (j & 2) != 0)
                spannable.removeSpan(asuggestionspan[i]);
        }

    }

    CharSequence removeSuggestionSpans(CharSequence charsequence)
    {
        if (charsequence instanceof Spanned)
        {
            Object obj;
            if (charsequence instanceof Spannable)
            {
                obj = (Spannable)charsequence;
            } else
            {
                obj = new SpannableString(charsequence);
                charsequence = ((CharSequence) (obj));
            }
            SuggestionSpan asuggestionspan[] = (SuggestionSpan[])((Spannable) (obj)).getSpans(0, charsequence.length(), android/text/style/SuggestionSpan);
            for (int i = 0; i < asuggestionspan.length; i++)
                ((Spannable) (obj)).removeSpan(asuggestionspan[i]);

        }
        return charsequence;
    }

    public void removeTextChangedListener(TextWatcher textwatcher)
    {
        if (mListeners != null)
        {
            int i = mListeners.indexOf(textwatcher);
            if (i >= 0)
                mListeners.remove(i);
        }
    }

    protected void replaceText_internal(int i, int j, CharSequence charsequence)
    {
        ((Editable)mText).replace(i, j, charsequence);
    }

    public void resetErrorChangedFlag()
    {
        if (mEditor != null)
            mEditor.mErrorWasChanged = false;
    }

    protected void resetResolvedDrawables()
    {
        super.resetResolvedDrawables();
        mLastLayoutDirection = -1;
    }

    boolean selectAllText()
    {
        int i = mText.length();
        Selection.setSelection((Spannable)mText, 0, i);
        return i > 0;
    }

    public void sendAccessibilityEvent(int i)
    {
        if (i == 4096)
        {
            return;
        } else
        {
            super.sendAccessibilityEvent(i);
            return;
        }
    }

    void sendAccessibilityEventTypeViewTextChanged(CharSequence charsequence, int i, int j, int k)
    {
        AccessibilityEvent accessibilityevent = AccessibilityEvent.obtain(16);
        accessibilityevent.setFromIndex(i);
        accessibilityevent.setRemovedCount(j);
        accessibilityevent.setAddedCount(k);
        accessibilityevent.setBeforeText(charsequence);
        sendAccessibilityEventUnchecked(accessibilityevent);
    }

    void sendAfterTextChanged(Editable editable)
    {
        if (mListeners != null)
        {
            ArrayList arraylist = mListeners;
            int i = arraylist.size();
            for (int j = 0; j < i; j++)
                ((TextWatcher)arraylist.get(j)).afterTextChanged(editable);

        }
    }

    void sendOnTextChanged(CharSequence charsequence, int i, int j, int k)
    {
        if (mListeners != null)
        {
            ArrayList arraylist = mListeners;
            int l = arraylist.size();
            for (int i1 = 0; i1 < l; i1++)
                ((TextWatcher)arraylist.get(i1)).onTextChanged(charsequence, i, j, k);

        }
        if (mEditor != null)
            mEditor.sendOnTextChanged(i, k);
    }

    public void setAccessibilityCursorPosition(int i)
    {
        if (getAccessibilityCursorPosition() == i)
            return;
        if (TextUtils.isEmpty(getContentDescription()))
        {
            if (i >= 0 && i <= mText.length())
            {
                Selection.setSelection((Spannable)mText, i);
                return;
            } else
            {
                Selection.removeSelection((Spannable)mText);
                return;
            }
        } else
        {
            super.setAccessibilityCursorPosition(i);
            return;
        }
    }

    protected void setActionModePopupMenuShow(boolean flag)
    {
        mPopupMenuShow = flag;
    }

    public void setAllCaps(boolean flag)
    {
        if (flag)
        {
            setTransformationMethod(new AllCapsTransformationMethod(getContext()));
            return;
        } else
        {
            setTransformationMethod(null);
            return;
        }
    }

    public final void setAutoLinkMask(int i)
    {
        mAutoLinkMask = i;
    }

    public void setCompoundDrawablePadding(int i)
    {
        Drawables drawables = mDrawables;
        if (i == 0)
        {
            if (drawables != null)
                drawables.mDrawablePadding = i;
        } else
        {
            if (drawables == null)
            {
                drawables = new Drawables();
                mDrawables = drawables;
            }
            drawables.mDrawablePadding = i;
        }
        invalidate();
        requestLayout();
    }

    public void setCompoundDrawables(Drawable drawable, Drawable drawable1, Drawable drawable2, Drawable drawable3)
    {
        Drawables drawables = mDrawables;
        boolean flag;
        if (drawable == null && drawable1 == null && drawable2 == null && drawable3 == null)
            flag = false;
        else
            flag = true;
        if (!flag)
        {
            if (drawables != null)
                if (drawables.mDrawablePadding == 0)
                {
                    mDrawables = null;
                } else
                {
                    if (drawables.mDrawableLeft != null)
                        drawables.mDrawableLeft.setCallback(null);
                    drawables.mDrawableLeft = null;
                    if (drawables.mDrawableTop != null)
                        drawables.mDrawableTop.setCallback(null);
                    drawables.mDrawableTop = null;
                    if (drawables.mDrawableRight != null)
                        drawables.mDrawableRight.setCallback(null);
                    drawables.mDrawableRight = null;
                    if (drawables.mDrawableBottom != null)
                        drawables.mDrawableBottom.setCallback(null);
                    drawables.mDrawableBottom = null;
                    drawables.mDrawableHeightLeft = 0;
                    drawables.mDrawableSizeLeft = 0;
                    drawables.mDrawableHeightRight = 0;
                    drawables.mDrawableSizeRight = 0;
                    drawables.mDrawableWidthTop = 0;
                    drawables.mDrawableSizeTop = 0;
                    drawables.mDrawableWidthBottom = 0;
                    drawables.mDrawableSizeBottom = 0;
                }
        } else
        {
            if (drawables == null)
            {
                drawables = new Drawables();
                mDrawables = drawables;
            }
            if (drawables.mDrawableLeft != drawable && drawables.mDrawableLeft != null)
                drawables.mDrawableLeft.setCallback(null);
            drawables.mDrawableLeft = drawable;
            if (drawables.mDrawableTop != drawable1 && drawables.mDrawableTop != null)
                drawables.mDrawableTop.setCallback(null);
            drawables.mDrawableTop = drawable1;
            if (drawables.mDrawableRight != drawable2 && drawables.mDrawableRight != null)
                drawables.mDrawableRight.setCallback(null);
            drawables.mDrawableRight = drawable2;
            if (drawables.mDrawableBottom != drawable3 && drawables.mDrawableBottom != null)
                drawables.mDrawableBottom.setCallback(null);
            drawables.mDrawableBottom = drawable3;
            Rect rect = drawables.mCompoundRect;
            int ai[] = getDrawableState();
            if (drawable != null)
            {
                drawable.setState(ai);
                drawable.copyBounds(rect);
                drawable.setCallback(this);
                drawables.mDrawableSizeLeft = rect.width();
                drawables.mDrawableHeightLeft = rect.height();
            } else
            {
                drawables.mDrawableHeightLeft = 0;
                drawables.mDrawableSizeLeft = 0;
            }
            if (drawable2 != null)
            {
                drawable2.setState(ai);
                drawable2.copyBounds(rect);
                drawable2.setCallback(this);
                drawables.mDrawableSizeRight = rect.width();
                drawables.mDrawableHeightRight = rect.height();
            } else
            {
                drawables.mDrawableHeightRight = 0;
                drawables.mDrawableSizeRight = 0;
            }
            if (drawable1 != null)
            {
                drawable1.setState(ai);
                drawable1.copyBounds(rect);
                drawable1.setCallback(this);
                drawables.mDrawableSizeTop = rect.height();
                drawables.mDrawableWidthTop = rect.width();
            } else
            {
                drawables.mDrawableWidthTop = 0;
                drawables.mDrawableSizeTop = 0;
            }
            if (drawable3 != null)
            {
                drawable3.setState(ai);
                drawable3.copyBounds(rect);
                drawable3.setCallback(this);
                drawables.mDrawableSizeBottom = rect.height();
                drawables.mDrawableWidthBottom = rect.width();
            } else
            {
                drawables.mDrawableWidthBottom = 0;
                drawables.mDrawableSizeBottom = 0;
            }
        }
        invalidate();
        requestLayout();
    }

    public void setCompoundDrawablesRelative(Drawable drawable, Drawable drawable1, Drawable drawable2, Drawable drawable3)
    {
        Drawables drawables = mDrawables;
        boolean flag;
        if (drawable == null && drawable1 == null && drawable2 == null && drawable3 == null)
            flag = false;
        else
            flag = true;
        if (!flag)
        {
            if (drawables != null)
                if (drawables.mDrawablePadding == 0)
                {
                    mDrawables = null;
                } else
                {
                    if (drawables.mDrawableStart != null)
                        drawables.mDrawableStart.setCallback(null);
                    drawables.mDrawableStart = null;
                    if (drawables.mDrawableTop != null)
                        drawables.mDrawableTop.setCallback(null);
                    drawables.mDrawableTop = null;
                    if (drawables.mDrawableEnd != null)
                        drawables.mDrawableEnd.setCallback(null);
                    drawables.mDrawableEnd = null;
                    if (drawables.mDrawableBottom != null)
                        drawables.mDrawableBottom.setCallback(null);
                    drawables.mDrawableBottom = null;
                    drawables.mDrawableHeightStart = 0;
                    drawables.mDrawableSizeStart = 0;
                    drawables.mDrawableHeightEnd = 0;
                    drawables.mDrawableSizeEnd = 0;
                    drawables.mDrawableWidthTop = 0;
                    drawables.mDrawableSizeTop = 0;
                    drawables.mDrawableWidthBottom = 0;
                    drawables.mDrawableSizeBottom = 0;
                }
        } else
        {
            if (drawables == null)
            {
                drawables = new Drawables();
                mDrawables = drawables;
            }
            if (drawables.mDrawableStart != drawable && drawables.mDrawableStart != null)
                drawables.mDrawableStart.setCallback(null);
            drawables.mDrawableStart = drawable;
            if (drawables.mDrawableTop != drawable1 && drawables.mDrawableTop != null)
                drawables.mDrawableTop.setCallback(null);
            drawables.mDrawableTop = drawable1;
            if (drawables.mDrawableEnd != drawable2 && drawables.mDrawableEnd != null)
                drawables.mDrawableEnd.setCallback(null);
            drawables.mDrawableEnd = drawable2;
            if (drawables.mDrawableBottom != drawable3 && drawables.mDrawableBottom != null)
                drawables.mDrawableBottom.setCallback(null);
            drawables.mDrawableBottom = drawable3;
            Rect rect = drawables.mCompoundRect;
            int ai[] = getDrawableState();
            if (drawable != null)
            {
                drawable.setState(ai);
                drawable.copyBounds(rect);
                drawable.setCallback(this);
                drawables.mDrawableSizeStart = rect.width();
                drawables.mDrawableHeightStart = rect.height();
            } else
            {
                drawables.mDrawableHeightStart = 0;
                drawables.mDrawableSizeStart = 0;
            }
            if (drawable2 != null)
            {
                drawable2.setState(ai);
                drawable2.copyBounds(rect);
                drawable2.setCallback(this);
                drawables.mDrawableSizeEnd = rect.width();
                drawables.mDrawableHeightEnd = rect.height();
            } else
            {
                drawables.mDrawableHeightEnd = 0;
                drawables.mDrawableSizeEnd = 0;
            }
            if (drawable1 != null)
            {
                drawable1.setState(ai);
                drawable1.copyBounds(rect);
                drawable1.setCallback(this);
                drawables.mDrawableSizeTop = rect.height();
                drawables.mDrawableWidthTop = rect.width();
            } else
            {
                drawables.mDrawableWidthTop = 0;
                drawables.mDrawableSizeTop = 0;
            }
            if (drawable3 != null)
            {
                drawable3.setState(ai);
                drawable3.copyBounds(rect);
                drawable3.setCallback(this);
                drawables.mDrawableSizeBottom = rect.height();
                drawables.mDrawableWidthBottom = rect.width();
            } else
            {
                drawables.mDrawableWidthBottom = 0;
                drawables.mDrawableSizeBottom = 0;
            }
        }
        resolveDrawables();
        invalidate();
        requestLayout();
    }

    public void setCompoundDrawablesRelativeWithIntrinsicBounds(int i, int j, int k, int l)
    {
        resetResolvedDrawables();
        Resources resources = getContext().getResources();
        Drawable drawable;
        if (i != 0)
            drawable = resources.getDrawable(i);
        else
            drawable = null;
        Drawable drawable1;
        if (j != 0)
            drawable1 = resources.getDrawable(j);
        else
            drawable1 = null;
        Drawable drawable2;
        if (k != 0)
            drawable2 = resources.getDrawable(k);
        else
            drawable2 = null;
        Drawable drawable3 = null;
        if (l != 0)
            drawable3 = resources.getDrawable(l);
        setCompoundDrawablesRelativeWithIntrinsicBounds(drawable, drawable1, drawable2, drawable3);
    }

    public void setCompoundDrawablesRelativeWithIntrinsicBounds(Drawable drawable, Drawable drawable1, Drawable drawable2, Drawable drawable3)
    {
        resetResolvedDrawables();
        if (drawable != null)
            drawable.setBounds(0, 0, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight());
        if (drawable2 != null)
            drawable2.setBounds(0, 0, drawable2.getIntrinsicWidth(), drawable2.getIntrinsicHeight());
        if (drawable1 != null)
            drawable1.setBounds(0, 0, drawable1.getIntrinsicWidth(), drawable1.getIntrinsicHeight());
        if (drawable3 != null)
            drawable3.setBounds(0, 0, drawable3.getIntrinsicWidth(), drawable3.getIntrinsicHeight());
        setCompoundDrawablesRelative(drawable, drawable1, drawable2, drawable3);
    }

    public void setCompoundDrawablesWithIntrinsicBounds(int i, int j, int k, int l)
    {
        Resources resources = getContext().getResources();
        Drawable drawable;
        if (i != 0)
            drawable = resources.getDrawable(i);
        else
            drawable = null;
        Drawable drawable1;
        if (j != 0)
            drawable1 = resources.getDrawable(j);
        else
            drawable1 = null;
        Drawable drawable2;
        if (k != 0)
            drawable2 = resources.getDrawable(k);
        else
            drawable2 = null;
        Drawable drawable3 = null;
        if (l != 0)
            drawable3 = resources.getDrawable(l);
        setCompoundDrawablesWithIntrinsicBounds(drawable, drawable1, drawable2, drawable3);
    }

    public void setCompoundDrawablesWithIntrinsicBounds(Drawable drawable, Drawable drawable1, Drawable drawable2, Drawable drawable3)
    {
        if (drawable != null)
            drawable.setBounds(0, 0, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight());
        if (drawable2 != null)
            drawable2.setBounds(0, 0, drawable2.getIntrinsicWidth(), drawable2.getIntrinsicHeight());
        if (drawable1 != null)
            drawable1.setBounds(0, 0, drawable1.getIntrinsicWidth(), drawable1.getIntrinsicHeight());
        if (drawable3 != null)
            drawable3.setBounds(0, 0, drawable3.getIntrinsicWidth(), drawable3.getIntrinsicHeight());
        setCompoundDrawables(drawable, drawable1, drawable2, drawable3);
    }

    public void setCursorHeight(int i, int j)
    {
    }

    protected void setCursorPosition_internal(int i, int j)
    {
        Selection.setSelection((Editable)mText, i, j);
    }

    public void setCursorVisible(boolean flag)
    {
        if (!flag || mEditor != null)
        {
            createEditorIfNeeded();
            if (mEditor.mCursorVisible != flag)
            {
                mEditor.mCursorVisible = flag;
                invalidate();
                mEditor.makeBlink();
                mEditor.prepareCursorControllers();
                return;
            }
        }
    }

    public void setCustomSelectionActionModeCallback(android.view.ActionMode.Callback callback)
    {
        createEditorIfNeeded();
        mEditor.mCustomSelectionActionModeCallback = callback;
    }

    public final void setEditableFactory(android.text.Editable.Factory factory)
    {
        mEditableFactory = factory;
        setText(mText);
    }

    public void setEllipsize(android.text.TextUtils.TruncateAt truncateat)
    {
        if (mEllipsize != truncateat)
        {
            mEllipsize = truncateat;
            if (mLayout != null)
            {
                nullLayouts();
                requestLayout();
                invalidate();
            }
        }
    }

    public void setEms(int i)
    {
        mMinWidth = i;
        mMaxWidth = i;
        mMinWidthMode = 1;
        mMaxWidthMode = 1;
        requestLayout();
        invalidate();
    }

    public void setEnabled(boolean flag)
    {
        if (flag != isEnabled())
        {
            if (!flag)
            {
                InputMethodManager inputmethodmanager1 = InputMethodManager.peekInstance();
                if (inputmethodmanager1 != null && inputmethodmanager1.isActive(this))
                    inputmethodmanager1.hideSoftInputFromWindow(getWindowToken(), 0);
            }
            super.setEnabled(flag);
            if (flag)
            {
                InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
                if (inputmethodmanager != null)
                    inputmethodmanager.restartInput(this);
            }
            if (mEditor != null)
            {
                mEditor.invalidateTextDisplayList();
                mEditor.prepareCursorControllers();
                mEditor.makeBlink();
                return;
            }
        }
    }

    public void setError(CharSequence charsequence)
    {
        if (charsequence == null)
        {
            setError(null, null);
            return;
        } else
        {
            Drawable drawable = getContext().getResources().getDrawable(0x1080378);
            drawable.setBounds(0, 0, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight());
            setError(charsequence, drawable);
            return;
        }
    }

    public void setError(CharSequence charsequence, Drawable drawable)
    {
        createEditorIfNeeded();
        mEditor.setError(charsequence, drawable);
    }

    public void setExtractedText(ExtractedText extractedtext)
    {
        Editable editable = getEditableText();
        if (extractedtext.text != null)
            if (editable == null)
                setText(extractedtext.text, BufferType.EDITABLE);
            else
            if (extractedtext.partialStartOffset < 0)
            {
                removeParcelableSpans(editable, 0, editable.length());
                editable.replace(0, editable.length(), extractedtext.text);
            } else
            {
                int l = editable.length();
                int i1 = extractedtext.partialStartOffset;
                if (i1 > l)
                    i1 = l;
                int j1 = extractedtext.partialEndOffset;
                if (j1 > l)
                    j1 = l;
                removeParcelableSpans(editable, i1, j1);
                editable.replace(i1, j1, extractedtext.text);
            }
        Spannable spannable = (Spannable)getText();
        int i = spannable.length();
        int j = extractedtext.selectionStart;
        if (j < 0)
            j = 0;
        else
        if (j > i)
            j = i;
        int k = extractedtext.selectionEnd;
        if (k < 0)
            k = 0;
        else
        if (k > i)
            k = i;
        Selection.setSelection(spannable, j, k);
        if ((2 & extractedtext.flags) != 0)
        {
            MetaKeyKeyListener.startSelecting(this, spannable);
            return;
        } else
        {
            MetaKeyKeyListener.stopSelecting(this, spannable);
            return;
        }
    }

    public void setExtracting(ExtractedTextRequest extractedtextrequest)
    {
        if (mEditor.mInputMethodState != null)
            mEditor.mInputMethodState.mExtractedTextRequest = extractedtextrequest;
        mEditor.hideControllers();
    }

    public void setFilters(InputFilter ainputfilter[])
    {
        if (ainputfilter == null)
            throw new IllegalArgumentException();
        mFilters = ainputfilter;
        if (mText instanceof Editable)
            setFilters((Editable)mText, ainputfilter);
    }

    protected boolean setFrame(int i, int j, int k, int l)
    {
        boolean flag = super.setFrame(i, j, k, l);
        if (mEditor != null)
            mEditor.setFrame();
        restartMarqueeIfNeeded();
        return flag;
    }

    public void setFreezesText(boolean flag)
    {
        mFreezesText = flag;
    }

    public void setGravity(int i)
    {
        if ((i & 0x800007) == 0)
            i |= 0x800003;
        if ((i & 0x70) == 0)
            i |= 0x30;
        int j = i & 0x800007;
        int k = 0x800007 & mGravity;
        boolean flag = false;
        if (j != k)
            flag = true;
        if (i != mGravity)
        {
            invalidate();
            mLayoutAlignment = null;
        }
        mGravity = i;
        if (mLayout != null && flag)
        {
            int l = mLayout.getWidth();
            int i1;
            if (mHintLayout == null)
                i1 = 0;
            else
                i1 = mHintLayout.getWidth();
            makeNewLayout(l, i1, UNKNOWN_BORING, UNKNOWN_BORING, super.mRight - super.mLeft - getCompoundPaddingLeft() - getCompoundPaddingRight(), true);
        }
    }

    public void setHeight(int i)
    {
        mMinimum = i;
        mMaximum = i;
        mMinMode = 2;
        mMaxMode = 2;
        requestLayout();
        invalidate();
    }

    public void setHighlightColor(int i)
    {
        if (mHighlightColor != i)
        {
            mHighlightColor = i;
            invalidate();
        }
    }

    public final void setHint(int i)
    {
        setHint(getContext().getResources().getText(i));
    }

    public final void setHint(CharSequence charsequence)
    {
        mHint = TextUtils.stringOrSpannedString(charsequence);
        if (mLayout != null)
            checkForRelayout();
        if (mText.length() == 0)
            invalidate();
        if (mEditor != null && mText.length() == 0 && mHint != null)
            mEditor.invalidateTextDisplayList();
    }

    public final void setHintTextColor(int i)
    {
        mHintTextColor = ColorStateList.valueOf(i);
        updateTextColors();
    }

    public final void setHintTextColor(ColorStateList colorstatelist)
    {
        mHintTextColor = colorstatelist;
        updateTextColors();
    }

    public void setHorizontallyScrolling(boolean flag)
    {
        if (mHorizontallyScrolling != flag)
        {
            mHorizontallyScrolling = flag;
            if (mLayout != null)
            {
                nullLayouts();
                requestLayout();
                invalidate();
            }
        }
    }

    public void setImeActionLabel(CharSequence charsequence, int i)
    {
        createEditorIfNeeded();
        mEditor.createInputContentTypeIfNeeded();
        mEditor.mInputContentType.imeActionLabel = charsequence;
        mEditor.mInputContentType.imeActionId = i;
    }

    public void setImeOptions(int i)
    {
        createEditorIfNeeded();
        mEditor.createInputContentTypeIfNeeded();
        mEditor.mInputContentType.imeOptions = i;
    }

    public void setIncludeFontPadding(boolean flag)
    {
        if (mIncludePad != flag)
        {
            mIncludePad = flag;
            if (mLayout != null)
            {
                nullLayouts();
                requestLayout();
                invalidate();
            }
        }
    }

    public void setInputExtras(int i)
        throws XmlPullParserException, IOException
    {
        createEditorIfNeeded();
        android.content.res.XmlResourceParser xmlresourceparser = getResources().getXml(i);
        mEditor.createInputContentTypeIfNeeded();
        mEditor.mInputContentType.extras = new Bundle();
        getResources().parseBundleExtras(xmlresourceparser, mEditor.mInputContentType.extras);
    }

    protected void setInputMethodActionPopupShow(boolean flag)
    {
        mShowInputMethodActionPopup = flag;
    }

    public void setInputType(int i)
    {
        boolean flag2;
        boolean flag4;
label0:
        {
            boolean flag = isPasswordInputType(getInputType());
            boolean flag1 = isVisiblePasswordInputType(getInputType());
            setInputType(i, false);
            flag2 = isPasswordInputType(i);
            boolean flag3 = isVisiblePasswordInputType(i);
            flag4 = false;
            if (flag2)
            {
                setTransformationMethod(PasswordTransformationMethod.getInstance());
                setTypefaceFromAttrs(null, 3, 0);
                break label0;
            }
            if (flag3)
            {
                TransformationMethod transformationmethod1 = mTransformation;
                PasswordTransformationMethod passwordtransformationmethod1 = PasswordTransformationMethod.getInstance();
                flag4 = false;
                if (transformationmethod1 == passwordtransformationmethod1)
                    flag4 = true;
                setTypefaceFromAttrs(null, 3, 0);
                break label0;
            }
            if (!flag)
            {
                flag4 = false;
                if (!flag1)
                    break label0;
            }
            setTypefaceFromAttrs(null, -1, -1);
            TransformationMethod transformationmethod = mTransformation;
            PasswordTransformationMethod passwordtransformationmethod = PasswordTransformationMethod.getInstance();
            flag4 = false;
            if (transformationmethod == passwordtransformationmethod)
                flag4 = true;
        }
        boolean flag5;
        if (!isMultilineInputType(i))
            flag5 = true;
        else
            flag5 = false;
        if (mSingleLine != flag5 || flag4)
        {
            boolean flag6 = false;
            if (!flag2)
                flag6 = true;
            applySingleLine(flag5, flag6, true);
        }
        if (!isSuggestionsEnabled())
            mText = removeSuggestionSpans(mText);
        InputMethodManager inputmethodmanager = InputMethodManager.peekInstance();
        if (inputmethodmanager != null)
            inputmethodmanager.restartInput(this);
    }

    public void setKeyListener(KeyListener keylistener)
    {
        setKeyListenerOnly(keylistener);
        fixFocusableAndClickableSettings();
        if (keylistener == null) goto _L2; else goto _L1
_L1:
        createEditorIfNeeded();
        InputMethodManager inputmethodmanager;
        try
        {
            mEditor.mInputType = mEditor.mKeyListener.getInputType();
        }
        catch (IncompatibleClassChangeError incompatibleclasschangeerror)
        {
            mEditor.mInputType = 1;
        }
        setInputTypeSingleLine(mSingleLine);
_L4:
        inputmethodmanager = InputMethodManager.peekInstance();
        if (inputmethodmanager != null)
            inputmethodmanager.restartInput(this);
        return;
_L2:
        if (mEditor != null)
            mEditor.mInputType = 0;
        if (true) goto _L4; else goto _L3
_L3:
    }

    public void setLineSpacing(float f, float f1)
    {
        if (mSpacingAdd != f || mSpacingMult != f1)
        {
            mSpacingAdd = f;
            mSpacingMult = f1;
            if (mLayout != null)
            {
                nullLayouts();
                requestLayout();
                invalidate();
            }
        }
    }

    public void setLines(int i)
    {
        mMinimum = i;
        mMaximum = i;
        mMinMode = 1;
        mMaxMode = 1;
        requestLayout();
        invalidate();
    }

    public final void setLinkTextColor(int i)
    {
        mLinkTextColor = ColorStateList.valueOf(i);
        updateTextColors();
    }

    public final void setLinkTextColor(ColorStateList colorstatelist)
    {
        mLinkTextColor = colorstatelist;
        updateTextColors();
    }

    public final void setLinksClickable(boolean flag)
    {
        mLinksClickable = flag;
    }

    public void setMarqueeRepeatLimit(int i)
    {
        mMarqueeRepeatLimit = i;
    }

    public void setMaxEms(int i)
    {
        mMaxWidth = i;
        mMaxWidthMode = 1;
        requestLayout();
        invalidate();
    }

    public void setMaxHeight(int i)
    {
        mMaximum = i;
        mMaxMode = 2;
        requestLayout();
        invalidate();
    }

    public void setMaxLines(int i)
    {
        mMaximum = i;
        mMaxMode = 1;
        requestLayout();
        invalidate();
    }

    public void setMaxWidth(int i)
    {
        mMaxWidth = i;
        mMaxWidthMode = 2;
        requestLayout();
        invalidate();
    }

    public void setMinEms(int i)
    {
        mMinWidth = i;
        mMinWidthMode = 1;
        requestLayout();
        invalidate();
    }

    public void setMinHeight(int i)
    {
        mMinimum = i;
        mMinMode = 2;
        requestLayout();
        invalidate();
    }

    public void setMinLines(int i)
    {
        mMinimum = i;
        mMinMode = 1;
        requestLayout();
        invalidate();
    }

    public void setMinWidth(int i)
    {
        mMinWidth = i;
        mMinWidthMode = 2;
        requestLayout();
        invalidate();
    }

    public final void setMovementMethod(MovementMethod movementmethod)
    {
        if (mMovement != movementmethod)
        {
            mMovement = movementmethod;
            if (movementmethod != null && !(mText instanceof Spannable))
                setText(mText);
            fixFocusableAndClickableSettings();
            if (mEditor != null)
                mEditor.prepareCursorControllers();
        }
    }

    public void setOnEditorActionListener(OnEditorActionListener oneditoractionlistener)
    {
        createEditorIfNeeded();
        mEditor.createInputContentTypeIfNeeded();
        mEditor.mInputContentType.onEditorActionListener = oneditoractionlistener;
    }

    public void setPadding(int i, int j, int k, int l)
    {
        if (i != super.mPaddingLeft || k != super.mPaddingRight || j != super.mPaddingTop || l != super.mPaddingBottom)
            nullLayouts();
        super.setPadding(i, j, k, l);
        invalidate();
    }

    public void setPaddingRelative(int i, int j, int k, int l)
    {
        if (i != getPaddingStart() || k != getPaddingEnd() || j != super.mPaddingTop || l != super.mPaddingBottom)
            nullLayouts();
        super.setPaddingRelative(i, j, k, l);
        invalidate();
    }

    public void setPaintFlags(int i)
    {
        if (mTextPaint.getFlags() != i)
        {
            mTextPaint.setFlags(i);
            if (mLayout != null)
            {
                nullLayouts();
                requestLayout();
                invalidate();
            }
        }
    }

    public void setPrivateImeOptions(String s)
    {
        createEditorIfNeeded();
        mEditor.createInputContentTypeIfNeeded();
        mEditor.mInputContentType.privateImeOptions = s;
    }

    public void setRawInputType(int i)
    {
        if (i == 0 && mEditor == null)
        {
            return;
        } else
        {
            createEditorIfNeeded();
            mEditor.mInputType = i;
            return;
        }
    }

    public void setScroller(Scroller scroller)
    {
        mScroller = scroller;
    }

    public void setSelectAllOnFocus(boolean flag)
    {
        createEditorIfNeeded();
        mEditor.mSelectAllOnFocus = flag;
        if (flag && !(mText instanceof Spannable))
            setText(mText, BufferType.SPANNABLE);
    }

    public void setSelected(boolean flag)
    {
label0:
        {
            boolean flag1 = isSelected();
            super.setSelected(flag);
            if (flag != flag1 && mEllipsize == android.text.TextUtils.TruncateAt.MARQUEE)
            {
                if (!flag)
                    break label0;
                startMarquee();
            }
            return;
        }
        stopMarquee();
    }

    public void setShadowLayer(float f, float f1, float f2, int i)
    {
        mTextPaint.setShadowLayer(f, f1, f2, i);
        mShadowRadius = f;
        mShadowDx = f1;
        mShadowDy = f2;
        if (mEditor != null)
            mEditor.invalidateTextDisplayList();
        invalidate();
    }

    public final void setShowSoftInputOnFocus(boolean flag)
    {
        createEditorIfNeeded();
        mEditor.mShowSoftInputOnFocus = flag;
    }

    public void setSingleLine()
    {
        setSingleLine(true);
    }

    public void setSingleLine(boolean flag)
    {
        setInputTypeSingleLine(flag);
        applySingleLine(flag, true, true);
    }

    protected void setSpan_internal(Object obj, int i, int j, int k)
    {
        ((Editable)mText).setSpan(obj, i, j, k);
    }

    public final void setSpannableFactory(android.text.Spannable.Factory factory)
    {
        mSpannableFactory = factory;
        setText(mText);
    }

    public final void setText(int i)
    {
        setText(getContext().getResources().getText(i));
    }

    public final void setText(int i, BufferType buffertype)
    {
        setText(getContext().getResources().getText(i), buffertype);
    }

    public final void setText(CharSequence charsequence)
    {
        setText(charsequence, mBufferType);
    }

    public void setText(CharSequence charsequence, BufferType buffertype)
    {
        setText(charsequence, buffertype, true, 0);
        if (mCharWrapper != null)
            mCharWrapper.mChars = null;
    }

    public final void setText(char ac[], int i, int j)
    {
        if (i >= 0 && j >= 0 && i + j <= ac.length)
        {
            int k;
            if (mText != null)
            {
                k = mText.length();
                sendBeforeTextChanged(mText, 0, k, j);
            } else
            {
                sendBeforeTextChanged("", 0, 0, j);
                k = 0;
            }
            if (mCharWrapper == null)
                mCharWrapper = new CharWrapper(ac, i, j);
            else
                mCharWrapper.set(ac, i, j);
            setText(((CharSequence) (mCharWrapper)), mBufferType, false, k);
            return;
        } else
        {
            throw new IndexOutOfBoundsException((new StringBuilder()).append(i).append(", ").append(j).toString());
        }
    }

    public void setTextAppearance(Context context, int i)
    {
        TypedArray typedarray = context.obtainStyledAttributes(i, com.android.internal.R.styleable.TextAppearance);
        int j = typedarray.getColor(4, 0);
        if (j != 0)
            setThemeHighlightColor(j);
        ColorStateList colorstatelist = typedarray.getColorStateList(3);
        if (colorstatelist != null)
            setTextColor(colorstatelist);
        int k = typedarray.getDimensionPixelSize(0, 0);
        if (k != 0)
            setRawTextSize(k);
        ColorStateList colorstatelist1 = typedarray.getColorStateList(5);
        if (colorstatelist1 != null)
            setHintTextColor(colorstatelist1);
        ColorStateList colorstatelist2 = typedarray.getColorStateList(6);
        if (colorstatelist2 != null)
            setLinkTextColor(colorstatelist2);
        setTypefaceFromAttrs(typedarray.getString(8), typedarray.getInt(1, -1), typedarray.getInt(2, -1));
        if (typedarray.getBoolean(7, false))
            setTransformationMethod(new AllCapsTransformationMethod(getContext()));
        typedarray.recycle();
    }

    public void setTextColor(int i)
    {
        mTextColor = ColorStateList.valueOf(i);
        updateTextColors();
    }

    public void setTextColor(ColorStateList colorstatelist)
    {
        if (colorstatelist == null)
        {
            throw new NullPointerException();
        } else
        {
            mTextColor = colorstatelist;
            updateTextColors();
            return;
        }
    }

    public void setTextIsSelectable(boolean flag)
    {
        if (flag || mEditor != null)
        {
            createEditorIfNeeded();
            if (mEditor.mTextIsSelectable != flag)
            {
                mEditor.mTextIsSelectable = flag;
                setFocusableInTouchMode(flag);
                setFocusable(flag);
                setClickable(flag);
                setLongClickable(flag);
                MovementMethod movementmethod;
                if (flag)
                    movementmethod = ArrowKeyMovementMethod.getInstance();
                else
                    movementmethod = null;
                setMovementMethod(movementmethod);
                CharSequence charsequence = mText;
                BufferType buffertype;
                if (flag)
                    buffertype = BufferType.SPANNABLE;
                else
                    buffertype = BufferType.NORMAL;
                setText(charsequence, buffertype);
                mEditor.prepareCursorControllers();
                return;
            }
        }
    }

    public final void setTextKeepState(CharSequence charsequence)
    {
        setTextKeepState(charsequence, mBufferType);
    }

    public final void setTextKeepState(CharSequence charsequence, BufferType buffertype)
    {
        int i = getSelectionStart();
        int j = getSelectionEnd();
        int k = charsequence.length();
        setText(charsequence, buffertype);
        if ((i >= 0 || j >= 0) && (mText instanceof Spannable))
            Selection.setSelection((Spannable)mText, Math.max(0, Math.min(i, k)), Math.max(0, Math.min(j, k)));
    }

    public void setTextLocale(Locale locale)
    {
        mTextPaint.setTextLocale(locale);
    }

    public void setTextScaleX(float f)
    {
        if (f != mTextPaint.getTextScaleX())
        {
            mUserSetTextScaleX = true;
            mTextPaint.setTextScaleX(f);
            if (mLayout != null)
            {
                nullLayouts();
                requestLayout();
                invalidate();
            }
        }
    }

    public void setTextSize(float f)
    {
        setTextSize(2, f);
    }

    public void setTextSize(int i, float f)
    {
        Context context = getContext();
        Resources resources;
        if (context == null)
            resources = Resources.getSystem();
        else
            resources = context.getResources();
        setRawTextSize(TypedValue.applyDimension(i, f, resources.getDisplayMetrics()));
    }

    public final void setTransformationMethod(TransformationMethod transformationmethod)
    {
        if (transformationmethod != mTransformation)
        {
            if (mTransformation != null && (mText instanceof Spannable))
                ((Spannable)mText).removeSpan(mTransformation);
            mTransformation = transformationmethod;
            if (transformationmethod instanceof TransformationMethod2)
            {
                TransformationMethod2 transformationmethod2 = (TransformationMethod2)transformationmethod;
                boolean flag;
                if (!isTextSelectable() && !(mText instanceof Editable))
                    flag = true;
                else
                    flag = false;
                mAllowTransformationLengthChange = flag;
                transformationmethod2.setLengthChangesAllowed(mAllowTransformationLengthChange);
            } else
            {
                mAllowTransformationLengthChange = false;
            }
            setText(mText);
            if (hasPasswordTransformationMethod())
            {
                notifyAccessibilityStateChanged();
                return;
            }
        }
    }

    public void setTypeface(Typeface typeface)
    {
        if (mTextPaint.getTypeface() != typeface)
        {
            mTextPaint.setTypeface(typeface);
            if (mLayout != null)
            {
                nullLayouts();
                requestLayout();
                invalidate();
            }
        }
    }

    public void setTypeface(Typeface typeface, int i)
    {
        if (i > 0)
        {
            Typeface typeface1;
            if (typeface == null)
                typeface1 = Typeface.defaultFromStyle(i);
            else
                typeface1 = Typeface.create(typeface, i);
            setTypeface(typeface1);
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
            setTypeface(typeface);
            return;
        }
    }

    public void setWidth(int i)
    {
        mMinWidth = i;
        mMaxWidth = i;
        mMinWidthMode = 2;
        mMaxWidthMode = 2;
        requestLayout();
        invalidate();
    }

    public void setYlCursorVisible(boolean flag)
    {
        if (mYlCursorVisible != flag)
        {
            mYlCursorVisible = flag;
            invalidate();
            if (mEditor != null)
            {
                mEditor.makeBlink();
                mEditor.prepareCursorControllers();
            }
        }
    }

    protected void showClipBoard()
    {
    }

    void spanChange(Spanned spanned, Object obj, int i, int j, int k, int l)
    {
        int i1 = -1;
        int j1 = -1;
        Editor.InputMethodState inputmethodstate;
        if (mEditor == null)
            inputmethodstate = null;
        else
            inputmethodstate = mEditor.mInputMethodState;
        Object obj1 = Selection.SELECTION_END;
        boolean flag = false;
        if (obj == obj1)
        {
            flag = true;
            j1 = j;
            if (i >= 0 || j >= 0)
            {
                invalidateCursor(Selection.getSelectionStart(spanned), i, j);
                checkForResize();
                registerForPreDraw();
                if (mEditor != null)
                    mEditor.makeBlink();
            }
        }
        if (obj == Selection.SELECTION_START)
        {
            flag = true;
            i1 = j;
            if (i >= 0 || j >= 0)
                invalidateCursor(Selection.getSelectionEnd(spanned), i, j);
        }
        if (flag)
        {
            mHighlightPathBogus = true;
            if (mEditor != null && !isFocused())
                mEditor.mSelectionMoved = true;
            if ((0x200 & spanned.getSpanFlags(obj)) == 0)
            {
                if (i1 < 0)
                    i1 = Selection.getSelectionStart(spanned);
                if (j1 < 0)
                    j1 = Selection.getSelectionEnd(spanned);
                onSelectionChanged(i1, j1);
            }
        }
        if ((obj instanceof UpdateAppearance) || (obj instanceof ParagraphStyle) || (obj instanceof CharacterStyle))
        {
            if (inputmethodstate != null && inputmethodstate.mBatchEditNesting != 0)
            {
                inputmethodstate.mContentChanged = true;
            } else
            {
                invalidate();
                mHighlightPathBogus = true;
                checkForResize();
            }
            if (mEditor != null)
            {
                if (i >= 0)
                    mEditor.invalidateTextDisplayList(mLayout, i, k);
                if (j >= 0)
                    mEditor.invalidateTextDisplayList(mLayout, j, l);
            }
        }
        if (MetaKeyKeyListener.isMetaTracker(spanned, obj))
        {
            mHighlightPathBogus = true;
            if (inputmethodstate != null && MetaKeyKeyListener.isSelectingMetaTracker(spanned, obj))
                inputmethodstate.mSelectionModeChanged = true;
            if (Selection.getSelectionStart(spanned) >= 0)
                if (inputmethodstate != null && inputmethodstate.mBatchEditNesting != 0)
                    inputmethodstate.mCursorChanged = true;
                else
                    invalidateCursor();
        }
        if ((obj instanceof ParcelableSpan) && inputmethodstate != null && inputmethodstate.mExtractedTextRequest != null)
            if (inputmethodstate.mBatchEditNesting != 0)
            {
                if (i >= 0)
                {
                    if (inputmethodstate.mChangedStart > i)
                        inputmethodstate.mChangedStart = i;
                    if (inputmethodstate.mChangedStart > k)
                        inputmethodstate.mChangedStart = k;
                }
                if (j >= 0)
                {
                    if (inputmethodstate.mChangedStart > j)
                        inputmethodstate.mChangedStart = j;
                    if (inputmethodstate.mChangedStart > l)
                        inputmethodstate.mChangedStart = l;
                }
            } else
            {
                inputmethodstate.mContentChanged = true;
            }
        if (mEditor != null && mEditor.mSpellChecker != null && j < 0 && (obj instanceof SpellCheckSpan))
            mEditor.mSpellChecker.onSpellCheckSpanRemoved((SpellCheckSpan)obj);
    }

    protected void stopSelectionActionMode()
    {
        mEditor.stopSelectionActionMode();
    }

    protected void stopTextSelectionModeP()
    {
        Selection.setSelection((Spannable)mText, getSelectionEnd());
        if (mEditor != null && mEditor.mSelectionModifierCursorController != null)
            mEditor.mSelectionModifierCursorController.hide();
        if (mEditor != null)
            mEditor.mDiscardNextActionUp = false;
        mInternalDiscardNextActionUp = false;
    }

    public void switchInputMethod()
    {
        InputMethodManager inputmethodmanager = (InputMethodManager)getContext().getSystemService("input_method");
        if (inputmethodmanager != null)
            inputmethodmanager.showInputMethodPicker();
    }

    boolean textCanBeSelected()
    {
        return mMovement != null && mMovement.canSelectArbitrarily() && (isTextEditable() || isTextSelectable() && (mText instanceof Spannable) && isEnabled());
    }

    void updateAfterEdit()
    {
        invalidate();
        int i = getSelectionStart();
        if (i >= 0 || (0x70 & mGravity) == 80)
            registerForPreDraw();
        checkForResize();
        if (i >= 0)
        {
            mHighlightPathBogus = true;
            if (mEditor != null)
                mEditor.makeBlink();
            bringPointIntoView(i);
        }
    }

    protected boolean verifyDrawable(Drawable drawable)
    {
        boolean flag = super.verifyDrawable(drawable);
        if (!flag && mDrawables != null)
            return drawable == mDrawables.mDrawableLeft || drawable == mDrawables.mDrawableTop || drawable == mDrawables.mDrawableRight || drawable == mDrawables.mDrawableBottom || drawable == mDrawables.mDrawableStart || drawable == mDrawables.mDrawableEnd;
        else
            return flag;
    }

    protected void viewClicked(InputMethodManager inputmethodmanager)
    {
        if (inputmethodmanager != null)
            inputmethodmanager.viewClicked(this);
    }

    int viewportToContentHorizontalOffset()
    {
        return getCompoundPaddingLeft() - super.mScrollX;
    }

    int viewportToContentVerticalOffset()
    {
        int i = getExtendedPaddingTop() - super.mScrollY;
        if ((0x70 & mGravity) != 48)
            i += getVerticalOffset(false);
        return i;
    }

    static 
    {
        Paint paint = new Paint();
        paint.setAntiAlias(true);
        paint.measureText("H");
    }









}
