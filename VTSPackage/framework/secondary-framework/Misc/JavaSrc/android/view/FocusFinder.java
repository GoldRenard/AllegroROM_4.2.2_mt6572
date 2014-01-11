// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.graphics.Rect;
import java.util.*;

// Referenced classes of package android.view:
//            ViewGroup, View, ViewConfiguration

public class FocusFinder
{
    private static final class SequentialFocusComparator
        implements Comparator
    {

        private final Rect mFirstRect;
        private ViewGroup mRoot;
        private final Rect mSecondRect;

        private void getRect(View view, Rect rect)
        {
            view.getDrawingRect(rect);
            mRoot.offsetDescendantRectToMyCoords(view, rect);
        }

        public int compare(View view, View view1)
        {
            if (view != view1)
            {
                getRect(view, mFirstRect);
                getRect(view1, mSecondRect);
                if (mFirstRect.top < mSecondRect.top)
                    return -1;
                if (mFirstRect.top > mSecondRect.top)
                    return 1;
                if (mFirstRect.left < mSecondRect.left)
                    return -1;
                if (mFirstRect.left > mSecondRect.left)
                    return 1;
                if (mFirstRect.bottom < mSecondRect.bottom)
                    return -1;
                if (mFirstRect.bottom > mSecondRect.bottom)
                    return 1;
                if (mFirstRect.right < mSecondRect.right)
                    return -1;
                if (mFirstRect.right > mSecondRect.right)
                    return 1;
            }
            return 0;
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((View)obj, (View)obj1);
        }

        public void recycle()
        {
            mRoot = null;
        }

        public void setRoot(ViewGroup viewgroup)
        {
            mRoot = viewgroup;
        }

        private SequentialFocusComparator()
        {
            mFirstRect = new Rect();
            mSecondRect = new Rect();
        }

    }


    private static final ThreadLocal tlFocusFinder = new ThreadLocal() {

        protected FocusFinder initialValue()
        {
            return new FocusFinder();
        }

        protected volatile Object initialValue()
        {
            return initialValue();
        }

    }
;
    final Rect mBestCandidateRect;
    final Rect mFocusedRect;
    final Rect mOtherRect;
    final SequentialFocusComparator mSequentialFocusComparator;
    private final ArrayList mTempList;

    private FocusFinder()
    {
        mFocusedRect = new Rect();
        mOtherRect = new Rect();
        mBestCandidateRect = new Rect();
        mSequentialFocusComparator = new SequentialFocusComparator();
        mTempList = new ArrayList();
    }


    private View findNextFocus(ViewGroup viewgroup, View view, Rect rect, int i)
    {
        View view1;
        ArrayList arraylist;
        view1 = null;
        if (view != null)
            view1 = findNextUserSpecifiedFocus(viewgroup, view, i);
        if (view1 != null)
            return view1;
        arraylist = mTempList;
        View view2;
        arraylist.clear();
        viewgroup.addFocusables(arraylist, i);
        if (arraylist.isEmpty())
            break MISSING_BLOCK_LABEL_69;
        view2 = findNextFocus(viewgroup, view, rect, i, arraylist);
        view1 = view2;
        arraylist.clear();
        return view1;
        Exception exception;
        exception;
        arraylist.clear();
        throw exception;
    }

    private View findNextFocus(ViewGroup viewgroup, View view, Rect rect, int i, ArrayList arraylist)
    {
        if (view != null)
        {
            if (rect == null)
                rect = mFocusedRect;
            view.getFocusedRect(rect);
            viewgroup.offsetDescendantRectToMyCoords(view, rect);
        } else
        if (rect == null)
        {
            rect = mFocusedRect;
            switch (i)
            {
            case 17: // '\021'
            case 33: // '!'
                setFocusBottomRight(viewgroup, rect);
                break;

            case 2: // '\002'
                if (viewgroup.isLayoutRtl())
                    setFocusBottomRight(viewgroup, rect);
                else
                    setFocusTopLeft(viewgroup, rect);
                break;

            case 66: // 'B'
            case 130: 
                setFocusTopLeft(viewgroup, rect);
                break;

            case 1: // '\001'
                if (viewgroup.isLayoutRtl())
                    setFocusTopLeft(viewgroup, rect);
                else
                    setFocusBottomRight(viewgroup, rect);
                break;
            }
        }
        switch (i)
        {
        case 17: // '\021'
        case 33: // '!'
        case 66: // 'B'
        case 130: 
            return findNextFocusInAbsoluteDirection(arraylist, viewgroup, view, rect, i);

        case 1: // '\001'
        case 2: // '\002'
            return findNextFocusInRelativeDirection(arraylist, viewgroup, view, rect, i);
        }
        throw new IllegalArgumentException((new StringBuilder()).append("Unknown direction: ").append(i).toString());
    }

    private View findNextFocusInRelativeDirection(ArrayList arraylist, ViewGroup viewgroup, View view, Rect rect, int i)
    {
        mSequentialFocusComparator.setRoot(viewgroup);
        Collections.sort(arraylist, mSequentialFocusComparator);
        mSequentialFocusComparator.recycle();
        int j = arraylist.size();
        Exception exception;
        switch (i)
        {
        default:
            return (View)arraylist.get(j - 1);

        case 2: // '\002'
            return getForwardFocusable(viewgroup, view, arraylist, j);

        case 1: // '\001'
            return getBackwardFocusable(viewgroup, view, arraylist, j);
        }
        exception;
        mSequentialFocusComparator.recycle();
        throw exception;
    }

    private View findNextUserSpecifiedFocus(ViewGroup viewgroup, View view, int i)
    {
        View view1 = view.findUserSetNextFocus(viewgroup, i);
        if (view1 == null || !view1.isFocusable() || view1.isInTouchMode() && !view1.isFocusableInTouchMode())
            return null;
        else
            return view1;
    }

    private static View getBackwardFocusable(ViewGroup viewgroup, View view, ArrayList arraylist, int i)
    {
        if (viewgroup.isLayoutRtl())
            return getNextFocusable(view, arraylist, i);
        else
            return getPreviousFocusable(view, arraylist, i);
    }

    private static View getForwardFocusable(ViewGroup viewgroup, View view, ArrayList arraylist, int i)
    {
        if (viewgroup.isLayoutRtl())
            return getPreviousFocusable(view, arraylist, i);
        else
            return getNextFocusable(view, arraylist, i);
    }

    public static FocusFinder getInstance()
    {
        return (FocusFinder)tlFocusFinder.get();
    }

    private static View getNextFocusable(View view, ArrayList arraylist, int i)
    {
        if (view != null)
        {
            int j = arraylist.lastIndexOf(view);
            if (j >= 0 && j + 1 < i)
                return (View)arraylist.get(j + 1);
        }
        if (!arraylist.isEmpty())
            return (View)arraylist.get(0);
        else
            return null;
    }

    private static View getPreviousFocusable(View view, ArrayList arraylist, int i)
    {
        if (view != null)
        {
            int j = arraylist.indexOf(view);
            if (j > 0)
                return (View)arraylist.get(j - 1);
        }
        if (!arraylist.isEmpty())
            return (View)arraylist.get(i - 1);
        else
            return null;
    }

    private boolean isTouchCandidate(int i, int j, Rect rect, int k)
    {
label0:
        {
            switch (k)
            {
            default:
                break label0;

            case 130: 
                if (rect.top < j || rect.left > i || i > rect.right)
                    return false;
                break;

            case 33: // '!'
                if (rect.top > j || rect.left > i || i > rect.right)
                    return false;
                break;

            case 66: // 'B'
                if (rect.left < i || rect.top > j || j > rect.bottom)
                    return false;
                break;

            case 17: // '\021'
                if (rect.left > i || rect.top > j || j > rect.bottom)
                    return false;
                break;
            }
            return true;
        }
        throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}.");
    }

    static int majorAxisDistance(int i, Rect rect, Rect rect1)
    {
        return Math.max(0, majorAxisDistanceRaw(i, rect, rect1));
    }

    static int majorAxisDistanceRaw(int i, Rect rect, Rect rect1)
    {
        switch (i)
        {
        case 130: 
            return rect1.top - rect.bottom;

        case 33: // '!'
            return rect.top - rect1.bottom;

        case 66: // 'B'
            return rect1.left - rect.right;

        case 17: // '\021'
            return rect.left - rect1.right;
        }
        throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}.");
    }

    static int majorAxisDistanceToFarEdge(int i, Rect rect, Rect rect1)
    {
        return Math.max(1, majorAxisDistanceToFarEdgeRaw(i, rect, rect1));
    }

    static int majorAxisDistanceToFarEdgeRaw(int i, Rect rect, Rect rect1)
    {
        switch (i)
        {
        case 130: 
            return rect1.bottom - rect.bottom;

        case 33: // '!'
            return rect.top - rect1.top;

        case 66: // 'B'
            return rect1.right - rect.right;

        case 17: // '\021'
            return rect.left - rect1.left;
        }
        throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}.");
    }

    static int minorAxisDistance(int i, Rect rect, Rect rect1)
    {
        switch (i)
        {
        case 33: // '!'
        case 130: 
            return Math.abs((rect.left + rect.width() / 2) - (rect1.left + rect1.width() / 2));

        case 17: // '\021'
        case 66: // 'B'
            return Math.abs((rect.top + rect.height() / 2) - (rect1.top + rect1.height() / 2));
        }
        throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}.");
    }

    private void setFocusBottomRight(ViewGroup viewgroup, Rect rect)
    {
        int i = viewgroup.getScrollY() + viewgroup.getHeight();
        int j = viewgroup.getScrollX() + viewgroup.getWidth();
        rect.set(j, i, j, i);
    }

    private void setFocusTopLeft(ViewGroup viewgroup, Rect rect)
    {
        int i = viewgroup.getScrollY();
        int j = viewgroup.getScrollX();
        rect.set(j, i, j, i);
    }

    boolean beamBeats(int i, Rect rect, Rect rect1, Rect rect2)
    {
        boolean flag = true;
        boolean flag1 = beamsOverlap(i, rect, rect1);
        if (!beamsOverlap(i, rect, rect2) && flag1)
        {
            if (isToDirectionOf(i, rect, rect2) && i != 17 && i != 66 && majorAxisDistance(i, rect, rect1) >= majorAxisDistanceToFarEdge(i, rect, rect2))
                return false;
        } else
        {
            flag = false;
        }
        return flag;
    }

    boolean beamsOverlap(int i, Rect rect, Rect rect1)
    {
label0:
        {
            switch (i)
            {
            default:
                break label0;

            case 33: // '!'
            case 130: 
                if (rect1.right < rect.left || rect1.left > rect.right)
                    return false;
                break;

            case 17: // '\021'
            case 66: // 'B'
                if (rect1.bottom < rect.top || rect1.top > rect.bottom)
                    return false;
                break;
            }
            return true;
        }
        throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}.");
    }

    public View findNearestTouchable(ViewGroup viewgroup, int i, int j, int k, int ai[])
    {
        ArrayList arraylist = viewgroup.getTouchables();
        int l = 0x7fffffff;
        View view = null;
        int i1 = arraylist.size();
        int j1 = ViewConfiguration.get(((View) (viewgroup)).mContext).getScaledEdgeSlop();
        Rect rect = new Rect();
        Rect rect1 = mOtherRect;
        for (int k1 = 0; k1 < i1; k1++)
        {
            View view1 = (View)arraylist.get(k1);
            view1.getDrawingRect(rect1);
            viewgroup.offsetRectBetweenParentAndChild(view1, rect1, true, true);
            if (!isTouchCandidate(i, j, rect1, k))
                continue;
            int l1 = 0x7fffffff;
            switch (k)
            {
            case 130: 
                l1 = rect1.top;
                break;

            case 33: // '!'
                l1 = 1 + (j - rect1.bottom);
                break;

            case 66: // 'B'
                l1 = rect1.left;
                break;

            case 17: // '\021'
                l1 = 1 + (i - rect1.right);
                break;
            }
            if (l1 < j1 && (view == null || rect.contains(rect1) || !rect1.contains(rect) && l1 < l))
            {
                l = l1;
                view = view1;
                rect.set(rect1);
                switch (k)
                {
                case 130: 
                    ai[1] = l1;
                    break;

                case 33: // '!'
                    ai[1] = -l1;
                    break;

                case 66: // 'B'
                    ai[0] = l1;
                    break;

                case 17: // '\021'
                    ai[0] = -l1;
                    break;
                }
            }
        }

        return view;
    }

    public final View findNextFocus(ViewGroup viewgroup, View view, int i)
    {
        return findNextFocus(viewgroup, view, null, i);
    }

    public View findNextFocusFromRect(ViewGroup viewgroup, Rect rect, int i)
    {
        mFocusedRect.set(rect);
        return findNextFocus(viewgroup, null, mFocusedRect, i);
    }

    View findNextFocusInAbsoluteDirection(ArrayList arraylist, ViewGroup viewgroup, View view, Rect rect, int i)
    {
        mBestCandidateRect.set(rect);
        switch (i)
        {
        case 130: 
            mBestCandidateRect.offset(0, -(1 + rect.height()));
            break;

        case 33: // '!'
            mBestCandidateRect.offset(0, 1 + rect.height());
            break;

        case 66: // 'B'
            mBestCandidateRect.offset(-(1 + rect.width()), 0);
            break;

        case 17: // '\021'
            mBestCandidateRect.offset(1 + rect.width(), 0);
            break;
        }
        View view1 = null;
        int j = arraylist.size();
        for (int k = 0; k < j; k++)
        {
            View view2 = (View)arraylist.get(k);
            if (view2 == view || view2 == viewgroup)
                continue;
            view2.getFocusedRect(mOtherRect);
            viewgroup.offsetDescendantRectToMyCoords(view2, mOtherRect);
            if (isBetterCandidate(i, rect, mOtherRect, mBestCandidateRect))
            {
                mBestCandidateRect.set(mOtherRect);
                view1 = view2;
            }
        }

        return view1;
    }

    int getWeightedDistanceFor(int i, int j)
    {
        return i * (i * 13) + j * j;
    }

    boolean isBetterCandidate(int i, Rect rect, Rect rect1, Rect rect2)
    {
        boolean flag = true;
        if (!isCandidate(rect, rect1, i))
            flag = false;
        else
        if (isCandidate(rect, rect2, i) && !beamBeats(i, rect, rect1, rect2))
        {
            if (beamBeats(i, rect, rect2, rect1))
                return false;
            if (getWeightedDistanceFor(majorAxisDistance(i, rect, rect1), minorAxisDistance(i, rect, rect1)) >= getWeightedDistanceFor(majorAxisDistance(i, rect, rect2), minorAxisDistance(i, rect, rect2)))
                return false;
        }
        return flag;
    }

    boolean isCandidate(Rect rect, Rect rect1, int i)
    {
label0:
        {
            switch (i)
            {
            default:
                break label0;

            case 130: 
                if (rect.top >= rect1.top && rect.bottom > rect1.top || rect.bottom >= rect1.bottom)
                    return false;
                break;

            case 33: // '!'
                if (rect.bottom <= rect1.bottom && rect.top < rect1.bottom || rect.top <= rect1.top)
                    return false;
                break;

            case 66: // 'B'
                if (rect.left >= rect1.left && rect.right > rect1.left || rect.right >= rect1.right)
                    return false;
                break;

            case 17: // '\021'
                if (rect.right <= rect1.right && rect.left < rect1.right || rect.left <= rect1.left)
                    return false;
                break;
            }
            return true;
        }
        throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}.");
    }

    boolean isToDirectionOf(int i, Rect rect, Rect rect1)
    {
label0:
        {
            switch (i)
            {
            default:
                break label0;

            case 130: 
                if (rect.bottom > rect1.top)
                    return false;
                break;

            case 33: // '!'
                if (rect.top < rect1.bottom)
                    return false;
                break;

            case 66: // 'B'
                if (rect.right > rect1.left)
                    return false;
                break;

            case 17: // '\021'
                if (rect.left < rect1.right)
                    return false;
                break;
            }
            return true;
        }
        throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}.");
    }

}
