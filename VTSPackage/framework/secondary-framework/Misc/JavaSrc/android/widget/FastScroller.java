// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.*;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.NinePatchDrawable;
import android.os.Handler;
import android.os.SystemClock;
import android.view.*;

// Referenced classes of package android.widget:
//            AbsListView, SectionIndexer, HeaderViewListAdapter, ExpandableListConnector, 
//            BaseAdapter, ExpandableListView, ListView

class FastScroller
{
    public class ScrollFade
        implements Runnable
    {

        static final int ALPHA_MAX = 208;
        static final long FADE_DURATION = 200L;
        long mFadeDuration;
        long mStartTime;
        final FastScroller this$0;

        int getAlpha()
        {
            if (getState() != 4)
                return 208;
            long l = SystemClock.uptimeMillis();
            if (l > mStartTime + mFadeDuration)
                return 0;
            else
                return (int)(208L - (208L * (l - mStartTime)) / mFadeDuration);
        }

        public void run()
        {
            if (getState() != 4)
            {
                startFade();
                return;
            }
            if (getAlpha() > 0)
            {
                mList.invalidate();
                return;
            } else
            {
                setState(0);
                return;
            }
        }

        void startFade()
        {
            mFadeDuration = 200L;
            mStartTime = SystemClock.uptimeMillis();
            setState(4);
        }

        public ScrollFade()
        {
            this$0 = FastScroller.this;
            super();
        }
    }


    private static final int ATTRS[] = {
        0x1010359, 0x1010336, 0x1010339, 0x1010337, 0x1010338, 0x101033a
    };
    private static final int DEFAULT_STATES[] = new int[0];
    private static final int FADE_TIMEOUT = 1500;
    private static int MIN_PAGES = 0;
    private static final int OVERLAY_AT_THUMB = 1;
    private static final int OVERLAY_FLOATING = 0;
    private static final int OVERLAY_POSITION = 5;
    private static final int PENDING_DRAG_DELAY = 180;
    private static final int PRESSED_STATES[] = {
        0x10100a7
    };
    private static final int PREVIEW_BACKGROUND_LEFT = 3;
    private static final int PREVIEW_BACKGROUND_RIGHT = 4;
    private static final int STATE_DRAGGING = 3;
    private static final int STATE_ENTER = 1;
    private static final int STATE_EXIT = 4;
    private static final int STATE_NONE = 0;
    private static final int STATE_VISIBLE = 2;
    private static final String TAG = "FastScroller";
    private static final int TEXT_COLOR = 0;
    private static final int THUMB_DRAWABLE = 1;
    private static final int TRACK_DRAWABLE = 2;
    private boolean mAlwaysShow;
    private boolean mChangedBounds;
    private final Runnable mDeferStartDrag = new Runnable() {

        final FastScroller this$0;

        public void run()
        {
            if (mList.mIsAttached)
            {
                beginDrag();
                int i = mList.getHeight();
                int j = 10 + ((int)mInitialTouchY - mThumbH);
                if (j < 0)
                    j = 0;
                else
                if (j + mThumbH > i)
                    j = i - mThumbH;
                mThumbY = j;
                scrollTo((float)mThumbY / (float)(i - mThumbH));
            }
            mPendingDrag = false;
        }

            
            {
                this$0 = FastScroller.this;
                super();
            }
    }
;
    private boolean mDrawOverlay;
    private Handler mHandler;
    float mInitialTouchY;
    private int mItemCount;
    AbsListView mList;
    BaseAdapter mListAdapter;
    private int mListOffset;
    private boolean mLongList;
    private boolean mMatchDragPosition;
    private Drawable mOverlayDrawable;
    private Drawable mOverlayDrawableLeft;
    private Drawable mOverlayDrawableRight;
    private int mOverlayHeight;
    private RectF mOverlayPos;
    private int mOverlayPosition;
    private int mOverlaySize;
    private int mOverlayWidth;
    private Paint mPaint;
    boolean mPendingDrag;
    private int mPosition;
    private int mScaledTouchSlop;
    boolean mScrollCompleted;
    private ScrollFade mScrollFade;
    private SectionIndexer mSectionIndexer;
    private String mSectionText;
    private Object mSections[];
    private int mState;
    private Drawable mThumbDrawable;
    int mThumbH;
    int mThumbW;
    int mThumbY;
    private final Rect mTmpRect = new Rect();
    private Drawable mTrackDrawable;
    private boolean mUseDeviceDefaultTheme;
    private int mVisibleItem;

    public FastScroller(Context context, AbsListView abslistview)
    {
        mItemCount = -1;
        mHandler = new Handler();
        mList = abslistview;
        init(context);
    }

    private void cancelFling()
    {
        MotionEvent motionevent = MotionEvent.obtain(0L, 0L, 3, 0.0F, 0.0F, 0);
        mList.onTouchEvent(motionevent);
        motionevent.recycle();
    }

    private int getThumbPositionForListPosition(int i, int j, int k)
    {
        if (mSectionIndexer == null || mListAdapter == null)
            getSectionsFromIndexer();
        int l;
        if (mSectionIndexer != null && mMatchDragPosition)
        {
            int i1 = i - mListOffset;
            if (i1 < 0)
                return 0;
            int j1 = k - mListOffset;
            int k1 = mList.getHeight() - mThumbH;
            int l1 = mSectionIndexer.getSectionForPosition(i1);
            int i2 = mSectionIndexer.getPositionForSection(l1);
            int j2 = mSectionIndexer.getPositionForSection(l1 + 1);
            int k2 = mSections.length;
            int l2 = j2 - i2;
            View view = mList.getChildAt(0);
            float f;
            if (view == null)
                f = 0.0F;
            else
                f = (float)i1 + (float)(mList.getPaddingTop() - view.getTop()) / (float)view.getHeight();
            float f1 = (f - (float)i2) / (float)l2 + (float)l1;
            if (f1 > (float)k2)
                f1 = k2;
            l = (int)((f1 / (float)k2) * (float)k1);
            if (i1 > 0 && i1 + j == j1)
            {
                View view1 = mList.getChildAt(j - 1);
                float f2 = (float)(mList.getHeight() - mList.getPaddingBottom() - view1.getTop()) / (float)view1.getHeight();
                return (int)((float)l + f2 * (float)(k1 - l));
            }
        } else
        {
            l = (i * (mList.getHeight() - mThumbH)) / (k - j);
        }
        return l;
    }

    private void init(Context context)
    {
        boolean flag = true;
        if (context != null && context.getThemeResId() == 0x103012b)
            mUseDeviceDefaultTheme = flag;
        TypedArray typedarray = context.getTheme().obtainStyledAttributes(ATTRS);
        useThumbDrawable(context, typedarray.getDrawable(flag));
        mTrackDrawable = typedarray.getDrawable(2);
        mOverlayDrawableLeft = typedarray.getDrawable(3);
        mOverlayDrawableRight = typedarray.getDrawable(4);
        mOverlayPosition = typedarray.getInt(5, 0);
        mScrollCompleted = flag;
        getSectionsFromIndexer();
        mOverlaySize = context.getResources().getDimensionPixelSize(0x1050015);
        mOverlayWidth = mOverlaySize;
        mOverlayHeight = mOverlaySize;
        mOverlayPos = new RectF();
        mScrollFade = new ScrollFade();
        mPaint = new Paint();
        mPaint.setAntiAlias(flag);
        mPaint.setTextAlign(android.graphics.Paint.Align.CENTER);
        mPaint.setTextSize(mOverlaySize / 2);
        int i = typedarray.getColorStateList(0).getDefaultColor();
        mPaint.setColor(i);
        mPaint.setStyle(android.graphics.Paint.Style.FILL_AND_STROKE);
        if (mList.getWidth() > 0 && mList.getHeight() > 0)
            onSizeChanged(mList.getWidth(), mList.getHeight(), 0, 0);
        mState = 0;
        refreshDrawableState();
        typedarray.recycle();
        mScaledTouchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        if (context.getApplicationInfo().targetSdkVersion < 11)
            flag = false;
        mMatchDragPosition = flag;
        setScrollbarPosition(mList.getVerticalScrollbarPosition());
    }

    private void refreshDrawableState()
    {
        int ai[];
        if (mState == 3)
            ai = PRESSED_STATES;
        else
            ai = DEFAULT_STATES;
        if (mThumbDrawable != null && mThumbDrawable.isStateful())
            mThumbDrawable.setState(ai);
        if (mTrackDrawable != null && mTrackDrawable.isStateful())
            mTrackDrawable.setState(ai);
    }

    private void resetDraggingState()
    {
        if (mList != null)
        {
            mList.requestDisallowInterceptTouchEvent(false);
            mList.reportScrollStateChange(0);
        }
        setState(2);
        Handler handler = mHandler;
        handler.removeCallbacks(mScrollFade);
        if (!mAlwaysShow)
            handler.postDelayed(mScrollFade, 1000L);
        if (mList != null)
            mList.invalidate();
    }

    private void resetThumbPos()
    {
        int i = mList.getWidth();
        switch (mPosition)
        {
        case 1: // '\001'
            mThumbDrawable.setBounds(0, 0, mThumbW, mThumbH);
            break;

        case 2: // '\002'
            mThumbDrawable.setBounds(i - mThumbW, 0, i, mThumbH);
            break;
        }
        mThumbDrawable.setAlpha(208);
    }

    private void useThumbDrawable(Context context, Drawable drawable)
    {
        mThumbDrawable = drawable;
        if (drawable instanceof NinePatchDrawable)
        {
            mThumbW = context.getResources().getDimensionPixelSize(0x1050016);
            mThumbH = context.getResources().getDimensionPixelSize(0x1050017);
        } else
        {
            mThumbW = drawable.getIntrinsicWidth();
            mThumbH = drawable.getIntrinsicHeight();
        }
        mChangedBounds = true;
    }

    void beginDrag()
    {
        setState(3);
        if (mListAdapter == null && mList != null)
            getSectionsFromIndexer();
        if (mList != null)
        {
            mList.requestDisallowInterceptTouchEvent(true);
            mList.reportScrollStateChange(1);
        }
        cancelFling();
    }

    void cancelPendingDrag()
    {
        mList.removeCallbacks(mDeferStartDrag);
        mPendingDrag = false;
    }

    public void draw(Canvas canvas)
    {
        if (mState != 0)
        {
            int i = mThumbY;
            int j = mList.getWidth();
            ScrollFade scrollfade = mScrollFade;
            int k = -1;
            if (mState == 4)
            {
                k = scrollfade.getAlpha();
                if (k < 104)
                    mThumbDrawable.setAlpha(k * 2);
                int l2 = mPosition;
                int i3 = 0;
                switch (l2)
                {
                case 1: // '\001'
                    i3 = -mThumbW + (k * mThumbW) / 208;
                    break;

                case 2: // '\002'
                    i3 = j - (k * mThumbW) / 208;
                    break;
                }
                mThumbDrawable.setBounds(i3, 0, i3 + mThumbW, mThumbH);
                mChangedBounds = true;
            }
            if (mTrackDrawable != null)
            {
                Rect rect1 = mThumbDrawable.getBounds();
                int l1 = rect1.left;
                int i2 = (rect1.bottom - rect1.top) / 2;
                int j2 = mTrackDrawable.getIntrinsicWidth();
                int k2 = (l1 + mThumbW / 2) - j2 / 2;
                mTrackDrawable.setBounds(k2, i2, k2 + j2, mList.getHeight() - i2);
                mTrackDrawable.draw(canvas);
            }
            canvas.translate(0.0F, i);
            mThumbDrawable.draw(canvas);
            canvas.translate(0.0F, -i);
            if (mState == 3 && mDrawOverlay)
            {
                if (mOverlayPosition == 1)
                {
                    int j1;
                    switch (mPosition)
                    {
                    case 1: // '\001'
                        j1 = Math.min(mThumbDrawable.getBounds().right + mThumbW, mList.getWidth() - mOverlayWidth);
                        break;

                    default:
                        j1 = Math.max(0, mThumbDrawable.getBounds().left - mThumbW - mOverlayWidth);
                        break;
                    }
                    int k1 = Math.max(0, Math.min(i + (mThumbH - mOverlayWidth) / 2, mList.getHeight() - mOverlayHeight));
                    RectF rectf1 = mOverlayPos;
                    rectf1.left = j1;
                    rectf1.right = rectf1.left + (float)mOverlayWidth;
                    rectf1.top = k1;
                    rectf1.bottom = rectf1.top + (float)mOverlayHeight;
                    if (mOverlayDrawable != null)
                        mOverlayDrawable.setBounds((int)rectf1.left, (int)rectf1.top, (int)rectf1.right, (int)rectf1.bottom);
                }
                mOverlayDrawable.draw(canvas);
                Paint paint = mPaint;
                float f = paint.descent();
                float f1 = paint.ascent();
                RectF rectf = mOverlayPos;
                Rect rect = mTmpRect;
                mOverlayDrawable.getPadding(rect);
                int l = (rect.right - rect.left) / 2;
                int i1 = (rect.bottom - rect.top) / 2;
                canvas.drawText(mSectionText, (int)(rectf.left + rectf.right) / 2 - l, (float)((int)(rectf.bottom + rectf.top) / 2) - (f1 + f) / 2.0F - (float)i1, paint);
                return;
            }
            if (mState == 4)
            {
                if (k == 0)
                {
                    setState(0);
                    return;
                }
                if (mTrackDrawable != null)
                {
                    mList.invalidate(j - mThumbW, 0, j, mList.getHeight());
                    return;
                } else
                {
                    mList.invalidate(j - mThumbW, i, j, i + mThumbH);
                    return;
                }
            }
        }
    }

    SectionIndexer getSectionIndexer()
    {
        return mSectionIndexer;
    }

    Object[] getSections()
    {
        if (mListAdapter == null && mList != null)
            getSectionsFromIndexer();
        return mSections;
    }

    void getSectionsFromIndexer()
    {
        Object obj;
label0:
        {
            obj = mList.getAdapter();
            mSectionIndexer = null;
            if (obj instanceof HeaderViewListAdapter)
            {
                mListOffset = ((HeaderViewListAdapter)obj).getHeadersCount();
                obj = ((HeaderViewListAdapter)obj).getWrappedAdapter();
            }
            if (obj instanceof ExpandableListConnector)
            {
                ExpandableListAdapter expandablelistadapter = ((ExpandableListConnector)obj).getAdapter();
                if (expandablelistadapter instanceof SectionIndexer)
                {
                    mSectionIndexer = (SectionIndexer)expandablelistadapter;
                    mListAdapter = (BaseAdapter)obj;
                    mSections = mSectionIndexer.getSections();
                }
            } else
            {
                if (!(obj instanceof SectionIndexer))
                    break label0;
                mListAdapter = (BaseAdapter)obj;
                mSectionIndexer = (SectionIndexer)obj;
                mSections = mSectionIndexer.getSections();
                if (mSections == null)
                {
                    mSections = (new String[] {
                        " "
                    });
                    return;
                }
            }
            return;
        }
        mListAdapter = (BaseAdapter)obj;
        mSections = (new String[] {
            " "
        });
    }

    public int getState()
    {
        return mState;
    }

    public int getWidth()
    {
        return mThumbW;
    }

    public boolean isAlwaysShowEnabled()
    {
        return mAlwaysShow;
    }

    boolean isPointInside(float f, float f1)
    {
        boolean flag;
        switch (mPosition)
        {
        case 1: // '\001'
            if (f < (float)mThumbW)
                flag = true;
            else
                flag = false;
            break;

        default:
            if (f > (float)(mList.getWidth() - mThumbW))
                flag = true;
            else
                flag = false;
            break;
        }
        return flag && (mTrackDrawable != null || f1 >= (float)mThumbY && f1 <= (float)(mThumbY + mThumbH));
    }

    boolean isVisible()
    {
        return mState != 0;
    }

    boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        switch (motionevent.getActionMasked())
        {
        case 2: // '\002'
        default:
            break;

        case 1: // '\001'
        case 3: // '\003'
            cancelPendingDrag();
            break;

        case 0: // '\0'
            if (mState <= 0 || !isPointInside(motionevent.getX(), motionevent.getY()))
                break;
            if (!mList.isInScrollingContainer())
            {
                beginDrag();
                return true;
            }
            mInitialTouchY = motionevent.getY();
            startPendingDrag();
            break;
        }
        return false;
    }

    void onItemCountChanged(int i, int j)
    {
        if (mAlwaysShow)
            mLongList = true;
    }

    void onScroll(AbsListView abslistview, int i, int j, int k)
    {
        if (mItemCount != k && j > 0)
        {
            mItemCount = k;
            boolean flag;
            if (mItemCount / j >= MIN_PAGES)
                flag = true;
            else
                flag = false;
            mLongList = flag;
        }
        if (mAlwaysShow)
            mLongList = true;
        if (!mLongList)
        {
            if (mState != 0)
                setState(0);
        } else
        {
            if (k - j > 0 && mState != 3)
            {
                mThumbY = getThumbPositionForListPosition(i, j, k);
                if (mChangedBounds)
                {
                    resetThumbPos();
                    mChangedBounds = false;
                }
            }
            mScrollCompleted = true;
            if (i != mVisibleItem)
            {
                mVisibleItem = i;
                if (mState != 3)
                {
                    setState(2);
                    if (!mAlwaysShow)
                    {
                        mHandler.postDelayed(mScrollFade, 1500L);
                        return;
                    }
                }
            }
        }
    }

    public void onSectionsChanged()
    {
        mListAdapter = null;
    }

    void onSizeChanged(int i, int j, int k, int l)
    {
        if (mThumbDrawable != null)
            switch (mPosition)
            {
            case 1: // '\001'
                mThumbDrawable.setBounds(0, 0, mThumbW, mThumbH);
                break;

            default:
                mThumbDrawable.setBounds(i - mThumbW, 0, i, mThumbH);
                break;
            }
        if (mOverlayPosition == 0)
        {
            RectF rectf = mOverlayPos;
            rectf.left = (i - mOverlayWidth) / 2;
            rectf.right = rectf.left + (float)mOverlayWidth;
            rectf.top = j / 10;
            rectf.bottom = rectf.top + (float)mOverlayHeight;
            if (mOverlayDrawable != null)
                mOverlayDrawable.setBounds((int)rectf.left, (int)rectf.top, (int)rectf.right, (int)rectf.bottom);
        }
    }

    boolean onTouchEvent(MotionEvent motionevent)
    {
        if (mState != 0)
        {
            int i = motionevent.getAction();
            if (i == 0)
            {
                if (isPointInside(motionevent.getX(), motionevent.getY()))
                    if (!mList.isInScrollingContainer())
                    {
                        beginDrag();
                        return true;
                    } else
                    {
                        mInitialTouchY = motionevent.getY();
                        startPendingDrag();
                        return false;
                    }
            } else
            if (i == 1)
            {
                if (mPendingDrag)
                {
                    beginDrag();
                    int l = mList.getHeight();
                    int i1 = 10 + ((int)motionevent.getY() - mThumbH);
                    if (i1 < 0)
                        i1 = 0;
                    else
                    if (i1 + mThumbH > l)
                        i1 = l - mThumbH;
                    mThumbY = i1;
                    scrollTo((float)mThumbY / (float)(l - mThumbH));
                    cancelPendingDrag();
                }
                if (mState == 3)
                {
                    if (mList != null)
                    {
                        mList.requestDisallowInterceptTouchEvent(false);
                        mList.reportScrollStateChange(0);
                    }
                    setState(2);
                    Handler handler = mHandler;
                    handler.removeCallbacks(mScrollFade);
                    if (!mAlwaysShow)
                        handler.postDelayed(mScrollFade, 1000L);
                    mList.invalidate();
                    return true;
                }
            } else
            if (i == 2)
            {
                if (mPendingDrag && Math.abs(motionevent.getY() - mInitialTouchY) > (float)mScaledTouchSlop)
                {
                    setState(3);
                    if (mListAdapter == null && mList != null)
                        getSectionsFromIndexer();
                    if (mList != null)
                    {
                        mList.requestDisallowInterceptTouchEvent(true);
                        mList.reportScrollStateChange(1);
                    }
                    cancelFling();
                    cancelPendingDrag();
                }
                if (mState == 3)
                {
                    int j = mList.getHeight();
                    int k = 10 + ((int)motionevent.getY() - mThumbH);
                    if (k < 0)
                        k = 0;
                    else
                    if (k + mThumbH > j)
                        k = j - mThumbH;
                    if (Math.abs(mThumbY - k) < 2)
                        return true;
                    mThumbY = k;
                    if (mScrollCompleted)
                        scrollTo((float)mThumbY / (float)(j - mThumbH));
                    return true;
                }
            } else
            if (i == 3)
            {
                cancelPendingDrag();
                return false;
            }
        }
        return false;
    }

    void resetDraggingStateIfNecessary()
    {
        if (mState == 3)
            resetDraggingState();
    }

    void scrollTo(float f)
    {
label0:
        {
            boolean flag;
label1:
            {
                int i = mList.getCount();
                mScrollCompleted = false;
                float f1 = 1.0F / (float)i / 8F;
                Object aobj[] = mSections;
                int k;
                if (aobj != null && aobj.length > 1)
                {
                    int i1 = aobj.length;
                    int j1 = (int)(f * (float)i1);
                    if (j1 >= i1)
                        j1 = i1 - 1;
                    int k1 = j1;
                    k = j1;
                    int l1 = mSectionIndexer.getPositionForSection(j1);
                    int i2 = i;
                    int j2 = l1;
                    int k2 = j1;
                    int l2 = j1 + 1;
                    if (j1 < i1 - 1)
                        i2 = mSectionIndexer.getPositionForSection(j1 + 1);
                    if (i2 == l1)
                        do
                        {
                            if (j1 <= 0)
                                break;
                            j1--;
                            j2 = mSectionIndexer.getPositionForSection(j1);
                            if (j2 != l1)
                            {
                                k2 = j1;
                                k = j1;
                                break;
                            }
                            if (j1 != 0)
                                continue;
                            k = 0;
                            break;
                        } while (true);
                    for (int i3 = l2 + 1; i3 < i1 && mSectionIndexer.getPositionForSection(i3) == i2;)
                    {
                        i3++;
                        l2++;
                    }

                    float f2 = (float)k2 / (float)i1;
                    float f3 = (float)l2 / (float)i1;
                    int j3;
                    if (k2 == k1 && f - f2 < f1)
                        j3 = j2;
                    else
                        j3 = j2 + (int)(((float)(i2 - j2) * (f - f2)) / (f3 - f2));
                    if (j3 > i - 1)
                        j3 = i - 1;
                    if (mList instanceof ExpandableListView)
                    {
                        ExpandableListView expandablelistview1 = (ExpandableListView)mList;
                        expandablelistview1.setSelectionFromTop(expandablelistview1.getFlatListPosition(ExpandableListView.getPackedPositionForGroup(j3 + mListOffset)), 0);
                    } else
                    if (mList instanceof ListView)
                        ((ListView)mList).setSelectionFromTop(j3 + mListOffset, 0);
                    else
                        mList.setSelection(j3 + mListOffset);
                } else
                {
                    int j = (int)(f * (float)i);
                    if (j > i - 1)
                        j = i - 1;
                    if (mList instanceof ExpandableListView)
                    {
                        ExpandableListView expandablelistview = (ExpandableListView)mList;
                        expandablelistview.setSelectionFromTop(expandablelistview.getFlatListPosition(ExpandableListView.getPackedPositionForGroup(j + mListOffset)), 0);
                    } else
                    if (mList instanceof ListView)
                        ((ListView)mList).setSelectionFromTop(j + mListOffset, 0);
                    else
                        mList.setSelection(j + mListOffset);
                    k = -1;
                }
                if (k < 0)
                    break label0;
                String s = aobj[k].toString();
                mSectionText = s;
                if (s.length() != 1 || s.charAt(0) != ' ')
                {
                    int l = aobj.length;
                    if (k < l)
                    {
                        flag = true;
                        break label1;
                    }
                }
                flag = false;
            }
            mDrawOverlay = flag;
            return;
        }
        mDrawOverlay = false;
    }

    public void setAlwaysShow(boolean flag)
    {
        mAlwaysShow = flag;
        if (flag)
        {
            mHandler.removeCallbacks(mScrollFade);
            setState(2);
        } else
        if (mState == 2)
        {
            mHandler.postDelayed(mScrollFade, 1500L);
            return;
        }
    }

    void setOverlayDrawableSize(int i, int j)
    {
        if (i == -1)
            mOverlayWidth = mOverlaySize;
        else
            mOverlayWidth = i;
        if (j == -1)
        {
            mOverlayHeight = mOverlaySize;
            return;
        } else
        {
            mOverlayHeight = j;
            return;
        }
    }

    public void setScrollbarPosition(int i)
    {
        if (i == 0)
            if (mList.isLayoutRtl())
                i = 1;
            else
                i = 2;
        mPosition = i;
        switch (i)
        {
        case 1: // '\001'
            mOverlayDrawable = mOverlayDrawableLeft;
            return;
        }
        mOverlayDrawable = mOverlayDrawableRight;
    }

    public void setState(int i)
    {
        switch (i)
        {
        case 1: // '\001'
        default:
            break;

        case 4: // '\004'
            int j = mList.getWidth();
            mList.invalidate(j - mThumbW, mThumbY, j, mThumbY + mThumbH);
            break;

        case 2: // '\002'
            if (mState != 2)
                resetThumbPos();
            // fall through

        case 3: // '\003'
            mHandler.removeCallbacks(mScrollFade);
            break;

        case 0: // '\0'
            mHandler.removeCallbacks(mScrollFade);
            mList.invalidate();
            break;
        }
        mState = i;
        refreshDrawableState();
    }

    void setTextPaintColor(int i)
    {
        mPaint.setColor(i);
    }

    void setTextPaintSize(int i)
    {
        mPaint.setTextSize(i);
    }

    void startPendingDrag()
    {
        mPendingDrag = true;
        mList.postDelayed(mDeferStartDrag, 180L);
    }

    void stop()
    {
        setState(0);
    }

    static 
    {
        MIN_PAGES = 4;
    }
}
