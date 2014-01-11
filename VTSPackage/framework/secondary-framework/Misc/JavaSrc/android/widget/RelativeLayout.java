// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.util.*;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import java.util.*;

public class RelativeLayout extends ViewGroup
{
    private static class DependencyGraph
    {

        private SparseArray mKeyNodes;
        private ArrayList mNodes;
        private ArrayDeque mRoots;

        private static void appendViewId(Resources resources, Node node, StringBuilder stringbuilder)
        {
            if (node.view.getId() != -1)
            {
                stringbuilder.append(resources.getResourceEntryName(node.view.getId()));
                return;
            } else
            {
                stringbuilder.append("NO_ID");
                return;
            }
        }

        private ArrayDeque findRoots(int ai[])
        {
            SparseArray sparsearray = mKeyNodes;
            ArrayList arraylist = mNodes;
            int i = arraylist.size();
            for (int j = 0; j < i; j++)
            {
                Node node3 = (Node)arraylist.get(j);
                node3.dependents.clear();
                node3.dependencies.clear();
            }

            for (int k = 0; k < i; k++)
            {
                Node node1 = (Node)arraylist.get(k);
                int ai1[] = ((LayoutParams)node1.view.getLayoutParams()).mRules;
                int i1 = ai.length;
                for (int j1 = 0; j1 < i1; j1++)
                {
                    int k1 = ai1[ai[j1]];
                    if (k1 <= 0)
                        continue;
                    Node node2 = (Node)sparsearray.get(k1);
                    if (node2 != null && node2 != node1)
                    {
                        node2.dependents.put(node1, this);
                        node1.dependencies.put(k1, node2);
                    }
                }

            }

            ArrayDeque arraydeque = mRoots;
            arraydeque.clear();
            for (int l = 0; l < i; l++)
            {
                Node node = (Node)arraylist.get(l);
                if (node.dependencies.size() == 0)
                    arraydeque.addLast(node);
            }

            return arraydeque;
        }

        private static void printNode(Resources resources, Node node)
        {
            if (node.dependents.size() == 0)
            {
                printViewId(resources, node.view);
            } else
            {
                Node node1;
                StringBuilder stringbuilder;
                for (Iterator iterator = node.dependents.keySet().iterator(); iterator.hasNext(); printdependents(resources, node1, stringbuilder))
                {
                    node1 = (Node)iterator.next();
                    stringbuilder = new StringBuilder();
                    appendViewId(resources, node, stringbuilder);
                }

            }
        }

        static void printViewId(Resources resources, View view)
        {
            if (view.getId() != -1)
            {
                Log.d("RelativeLayout", resources.getResourceEntryName(view.getId()));
                return;
            } else
            {
                Log.d("RelativeLayout", "NO_ID");
                return;
            }
        }

        private static void printdependents(Resources resources, Node node, StringBuilder stringbuilder)
        {
            stringbuilder.append(" -> ");
            appendViewId(resources, node, stringbuilder);
            if (node.dependents.size() == 0)
            {
                Log.d("RelativeLayout", stringbuilder.toString());
            } else
            {
                for (Iterator iterator = node.dependents.keySet().iterator(); iterator.hasNext(); printdependents(resources, (Node)iterator.next(), new StringBuilder(stringbuilder)));
            }
        }

        void add(View view)
        {
            int i = view.getId();
            Node node = Node.acquire(view);
            if (i != -1)
                mKeyNodes.put(i, node);
            mNodes.add(node);
        }

        void clear()
        {
            ArrayList arraylist = mNodes;
            int i = arraylist.size();
            for (int j = 0; j < i; j++)
                ((Node)arraylist.get(j)).release();

            arraylist.clear();
            mKeyNodes.clear();
            mRoots.clear();
        }

        transient void getSortedViews(View aview[], int ai[])
        {
            ArrayDeque arraydeque = findRoots(ai);
            int i = 0;
            do
            {
                Node node = (Node)arraydeque.pollLast();
                if (node == null)
                    break;
                View view = node.view;
                int j = view.getId();
                int k = i + 1;
                aview[i] = view;
                Iterator iterator = node.dependents.keySet().iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    Node node1 = (Node)iterator.next();
                    SparseArray sparsearray = node1.dependencies;
                    sparsearray.remove(j);
                    if (sparsearray.size() == 0)
                        arraydeque.add(node1);
                } while (true);
                i = k;
            } while (true);
            if (i < aview.length)
                throw new IllegalStateException("Circular dependencies cannot exist in RelativeLayout");
            else
                return;
        }

        transient void log(Resources resources, int ai[])
        {
            for (Iterator iterator = findRoots(ai).iterator(); iterator.hasNext(); printNode(resources, (Node)iterator.next()));
        }


        private DependencyGraph()
        {
            mNodes = new ArrayList();
            mKeyNodes = new SparseArray();
            mRoots = new ArrayDeque();
        }

    }

    static class DependencyGraph.Node
        implements Poolable
    {

        private static final int POOL_LIMIT = 100;
        private static final Pool sPool = Pools.synchronizedPool(Pools.finitePool(new PoolableManager() {

            public volatile Poolable newInstance()
            {
                return newInstance();
            }

            public DependencyGraph.Node newInstance()
            {
                return new DependencyGraph.Node();
            }

            public volatile void onAcquired(Poolable poolable)
            {
                onAcquired((DependencyGraph.Node)poolable);
            }

            public void onAcquired(DependencyGraph.Node node)
            {
            }

            public volatile void onReleased(Poolable poolable)
            {
                onReleased((DependencyGraph.Node)poolable);
            }

            public void onReleased(DependencyGraph.Node node)
            {
            }

        }
, 100));
        final SparseArray dependencies = new SparseArray();
        final HashMap dependents = new HashMap();
        private boolean mIsPooled;
        private DependencyGraph.Node mNext;
        View view;

        static DependencyGraph.Node acquire(View view1)
        {
            DependencyGraph.Node node = (DependencyGraph.Node)sPool.acquire();
            node.view = view1;
            return node;
        }

        public DependencyGraph.Node getNextPoolable()
        {
            return mNext;
        }

        public volatile Object getNextPoolable()
        {
            return getNextPoolable();
        }

        public boolean isPooled()
        {
            return mIsPooled;
        }

        void release()
        {
            view = null;
            dependents.clear();
            dependencies.clear();
            sPool.release(this);
        }

        public void setNextPoolable(DependencyGraph.Node node)
        {
            mNext = node;
        }

        public volatile void setNextPoolable(Object obj)
        {
            setNextPoolable((DependencyGraph.Node)obj);
        }

        public void setPooled(boolean flag)
        {
            mIsPooled = flag;
        }


    }

    public static class LayoutParams extends android.view.ViewGroup.MarginLayoutParams
    {

        public boolean alignWithParent;
        private int mBottom;
        private int mEnd;
        private int mInitialRules[];
        private int mLeft;
        private int mRight;
        private int mRules[];
        private boolean mRulesChanged;
        private int mStart;
        private int mTop;

        private boolean hasRelativeRules()
        {
            return mInitialRules[16] != 0 || mInitialRules[17] != 0 || mInitialRules[18] != 0 || mInitialRules[19] != 0 || mInitialRules[20] != 0 || mInitialRules[21] != 0;
        }

        private void resolveRules(int i)
        {
            byte byte0 = 9;
            byte byte1 = 5;
            int j = 1;
            int k;
            if (i == j)
                k = j;
            else
                k = 0;
            for (int l = 0; l < 22; l++)
                mRules[l] = mInitialRules[l];

            if (mRules[18] != 0)
            {
                int ai5[] = mRules;
                byte byte3;
                if (k != 0)
                    byte3 = 7;
                else
                    byte3 = byte1;
                ai5[byte3] = mRules[18];
            }
            if (mRules[19] != 0)
            {
                int ai4[] = mRules;
                if (k == 0)
                    byte1 = 7;
                ai4[byte1] = mRules[19];
            }
            if (mRules[16] != 0)
            {
                int ai3[] = mRules;
                int i1;
                if (k != 0)
                    i1 = j;
                else
                    i1 = 0;
                ai3[i1] = mRules[16];
            }
            if (mRules[17] != 0)
            {
                int ai2[] = mRules;
                if (k != 0)
                    j = 0;
                ai2[j] = mRules[17];
            }
            if (mRules[20] != 0)
            {
                int ai1[] = mRules;
                byte byte2;
                if (k != 0)
                    byte2 = 11;
                else
                    byte2 = byte0;
                ai1[byte2] = mRules[20];
            }
            if (mRules[21] != 0)
            {
                int ai[] = mRules;
                if (k == 0)
                    byte0 = 11;
                ai[byte0] = mRules[21];
            }
            mRulesChanged = false;
        }

        public void addRule(int i)
        {
            mRules[i] = -1;
            mInitialRules[i] = -1;
            mRulesChanged = true;
        }

        public void addRule(int i, int j)
        {
            mRules[i] = j;
            mInitialRules[i] = j;
            mRulesChanged = true;
        }

        public String debug(String s)
        {
            return (new StringBuilder()).append(s).append("ViewGroup.LayoutParams={ width=").append(sizeToString(super.width)).append(", height=").append(sizeToString(super.height)).append(" }").toString();
        }

        public int[] getRules()
        {
            return mRules;
        }

        public int[] getRules(int i)
        {
            if (hasRelativeRules() && (mRulesChanged || i != getLayoutDirection()))
            {
                resolveRules(i);
                if (i != getLayoutDirection())
                    setLayoutDirection(i);
            }
            return mRules;
        }

        public void removeRule(int i)
        {
            mRules[i] = 0;
            mInitialRules[i] = 0;
            mRulesChanged = true;
        }

        public void resolveLayoutDirection(int i)
        {
            if (isLayoutRtl())
            {
                if (mStart != 0x80000000)
                    mRight = mStart;
                if (mEnd != 0x80000000)
                    mLeft = mEnd;
            } else
            {
                if (mStart != 0x80000000)
                    mLeft = mStart;
                if (mEnd != 0x80000000)
                    mRight = mEnd;
            }
            if (hasRelativeRules() && i != getLayoutDirection())
                resolveRules(i);
            super.resolveLayoutDirection(i);
        }



/*
        static int access$102(LayoutParams layoutparams, int i)
        {
            layoutparams.mRight = i;
            return i;
        }

*/


/*
        static int access$112(LayoutParams layoutparams, int i)
        {
            int j = i + layoutparams.mRight;
            layoutparams.mRight = j;
            return j;
        }

*/



/*
        static int access$202(LayoutParams layoutparams, int i)
        {
            layoutparams.mBottom = i;
            return i;
        }

*/


/*
        static int access$212(LayoutParams layoutparams, int i)
        {
            int j = i + layoutparams.mBottom;
            layoutparams.mBottom = j;
            return j;
        }

*/



/*
        static int access$302(LayoutParams layoutparams, int i)
        {
            layoutparams.mLeft = i;
            return i;
        }

*/


/*
        static int access$312(LayoutParams layoutparams, int i)
        {
            int j = i + layoutparams.mLeft;
            layoutparams.mLeft = j;
            return j;
        }

*/



/*
        static int access$402(LayoutParams layoutparams, int i)
        {
            layoutparams.mTop = i;
            return i;
        }

*/


/*
        static int access$412(LayoutParams layoutparams, int i)
        {
            int j = i + layoutparams.mTop;
            layoutparams.mTop = j;
            return j;
        }

*/


        public LayoutParams(int i, int j)
        {
            super(i, j);
            mRules = new int[22];
            mInitialRules = new int[22];
            mStart = 0x80000000;
            mEnd = 0x80000000;
            mRulesChanged = false;
        }

        public LayoutParams(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
            mRules = new int[22];
            mInitialRules = new int[22];
            mStart = 0x80000000;
            mEnd = 0x80000000;
            mRulesChanged = false;
            TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.RelativeLayout_Layout);
            int ai[] = mRules;
            int ai1[] = mInitialRules;
            int i = typedarray.getIndexCount();
            for (int j = 0; j < i; j++)
            {
                int l = typedarray.getIndex(j);
                switch (l)
                {
                default:
                    break;

                case 22: // '\026'
                    byte byte8;
                    if (typedarray.getBoolean(l, false))
                        byte8 = -1;
                    else
                        byte8 = 0;
                    ai[21] = byte8;
                    break;

                case 21: // '\025'
                    byte byte7;
                    if (typedarray.getBoolean(l, false))
                        byte7 = -1;
                    else
                        byte7 = 0;
                    ai[20] = byte7;
                    break;

                case 20: // '\024'
                    ai[19] = typedarray.getResourceId(l, 0);
                    break;

                case 19: // '\023'
                    ai[18] = typedarray.getResourceId(l, 0);
                    break;

                case 18: // '\022'
                    ai[17] = typedarray.getResourceId(l, 0);
                    break;

                case 17: // '\021'
                    ai[16] = typedarray.getResourceId(l, 0);
                    break;

                case 15: // '\017'
                    byte byte6;
                    if (typedarray.getBoolean(l, false))
                        byte6 = -1;
                    else
                        byte6 = 0;
                    ai[15] = byte6;
                    break;

                case 14: // '\016'
                    byte byte5;
                    if (typedarray.getBoolean(l, false))
                        byte5 = -1;
                    else
                        byte5 = 0;
                    ai[14] = byte5;
                    break;

                case 13: // '\r'
                    byte byte4;
                    if (typedarray.getBoolean(l, false))
                        byte4 = -1;
                    else
                        byte4 = 0;
                    ai[13] = byte4;
                    break;

                case 12: // '\f'
                    byte byte3;
                    if (typedarray.getBoolean(l, false))
                        byte3 = -1;
                    else
                        byte3 = 0;
                    ai[12] = byte3;
                    break;

                case 11: // '\013'
                    byte byte2;
                    if (typedarray.getBoolean(l, false))
                        byte2 = -1;
                    else
                        byte2 = 0;
                    ai[11] = byte2;
                    break;

                case 10: // '\n'
                    byte byte1;
                    if (typedarray.getBoolean(l, false))
                        byte1 = -1;
                    else
                        byte1 = 0;
                    ai[10] = byte1;
                    break;

                case 9: // '\t'
                    byte byte0;
                    if (typedarray.getBoolean(l, false))
                        byte0 = -1;
                    else
                        byte0 = 0;
                    ai[9] = byte0;
                    break;

                case 8: // '\b'
                    ai[8] = typedarray.getResourceId(l, 0);
                    break;

                case 7: // '\007'
                    ai[7] = typedarray.getResourceId(l, 0);
                    break;

                case 6: // '\006'
                    ai[6] = typedarray.getResourceId(l, 0);
                    break;

                case 5: // '\005'
                    ai[5] = typedarray.getResourceId(l, 0);
                    break;

                case 4: // '\004'
                    ai[4] = typedarray.getResourceId(l, 0);
                    break;

                case 3: // '\003'
                    ai[3] = typedarray.getResourceId(l, 0);
                    break;

                case 2: // '\002'
                    ai[2] = typedarray.getResourceId(l, 0);
                    break;

                case 1: // '\001'
                    ai[1] = typedarray.getResourceId(l, 0);
                    break;

                case 0: // '\0'
                    ai[0] = typedarray.getResourceId(l, 0);
                    break;

                case 16: // '\020'
                    alignWithParent = typedarray.getBoolean(l, false);
                    break;
                }
            }

            for (int k = 0; k < 22; k++)
                ai1[k] = ai[k];

            typedarray.recycle();
        }

        public LayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
        {
            super(layoutparams);
            mRules = new int[22];
            mInitialRules = new int[22];
            mStart = 0x80000000;
            mEnd = 0x80000000;
            mRulesChanged = false;
        }

        public LayoutParams(android.view.ViewGroup.MarginLayoutParams marginlayoutparams)
        {
            super(marginlayoutparams);
            mRules = new int[22];
            mInitialRules = new int[22];
            mStart = 0x80000000;
            mEnd = 0x80000000;
            mRulesChanged = false;
        }
    }

    private class TopToBottomLeftToRightComparator
        implements Comparator
    {

        final RelativeLayout this$0;

        public int compare(View view, View view1)
        {
            int i = view.getTop() - view1.getTop();
            if (i != 0)
                return i;
            int j = view.getLeft() - view1.getLeft();
            if (j != 0)
                return j;
            int k = view.getHeight() - view1.getHeight();
            if (k != 0)
                return k;
            int l = view.getWidth() - view1.getWidth();
            if (l != 0)
                return l;
            else
                return 0;
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((View)obj, (View)obj1);
        }

        private TopToBottomLeftToRightComparator()
        {
            this$0 = RelativeLayout.this;
            super();
        }

    }


    public static final int ABOVE = 2;
    public static final int ALIGN_BASELINE = 4;
    public static final int ALIGN_BOTTOM = 8;
    public static final int ALIGN_END = 19;
    public static final int ALIGN_LEFT = 5;
    public static final int ALIGN_PARENT_BOTTOM = 12;
    public static final int ALIGN_PARENT_END = 21;
    public static final int ALIGN_PARENT_LEFT = 9;
    public static final int ALIGN_PARENT_RIGHT = 11;
    public static final int ALIGN_PARENT_START = 20;
    public static final int ALIGN_PARENT_TOP = 10;
    public static final int ALIGN_RIGHT = 7;
    public static final int ALIGN_START = 18;
    public static final int ALIGN_TOP = 6;
    public static final int BELOW = 3;
    public static final int CENTER_HORIZONTAL = 14;
    public static final int CENTER_IN_PARENT = 13;
    public static final int CENTER_VERTICAL = 15;
    private static final boolean DEBUG_GRAPH = false;
    public static final int END_OF = 17;
    public static final int LEFT_OF = 0;
    private static final String LOG_TAG = "RelativeLayout";
    public static final int RIGHT_OF = 1;
    private static final int RULES_HORIZONTAL[] = {
        0, 1, 5, 7, 16, 17, 18, 19
    };
    private static final int RULES_VERTICAL[] = {
        2, 3, 4, 6, 8
    };
    public static final int START_OF = 16;
    public static final int TRUE = -1;
    private static final int VERB_COUNT = 22;
    private View mBaselineView;
    private final Rect mContentBounds;
    private boolean mDirtyHierarchy;
    private final DependencyGraph mGraph;
    private int mGravity;
    private boolean mHasBaselineAlignedChild;
    private int mIgnoreGravity;
    private final Rect mSelfBounds;
    private View mSortedHorizontalChildren[];
    private View mSortedVerticalChildren[];
    private SortedSet mTopToBottomLeftToRightSet;

    public RelativeLayout(Context context)
    {
        super(context);
        mBaselineView = null;
        mGravity = 0x800033;
        mContentBounds = new Rect();
        mSelfBounds = new Rect();
        mTopToBottomLeftToRightSet = null;
        mSortedHorizontalChildren = new View[0];
        mSortedVerticalChildren = new View[0];
        mGraph = new DependencyGraph();
    }

    public RelativeLayout(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mBaselineView = null;
        mGravity = 0x800033;
        mContentBounds = new Rect();
        mSelfBounds = new Rect();
        mTopToBottomLeftToRightSet = null;
        mSortedHorizontalChildren = new View[0];
        mSortedVerticalChildren = new View[0];
        mGraph = new DependencyGraph();
        initFromAttributes(context, attributeset);
    }

    public RelativeLayout(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mBaselineView = null;
        mGravity = 0x800033;
        mContentBounds = new Rect();
        mSelfBounds = new Rect();
        mTopToBottomLeftToRightSet = null;
        mSortedHorizontalChildren = new View[0];
        mSortedVerticalChildren = new View[0];
        mGraph = new DependencyGraph();
        initFromAttributes(context, attributeset);
    }

    private void alignBaseline(View view, LayoutParams layoutparams)
    {
        int ai[] = layoutparams.getRules(getLayoutDirection());
        int i = getRelatedViewBaseline(ai, 4);
        if (i != -1)
        {
            LayoutParams layoutparams2 = getRelatedViewParams(ai, 4);
            if (layoutparams2 != null)
            {
                int j = i + layoutparams2.mTop;
                int k = view.getBaseline();
                if (k != -1)
                    j -= k;
                int l = layoutparams.mBottom - layoutparams.mTop;
                layoutparams.mTop = j;
                layoutparams.mBottom = l + layoutparams.mTop;
            }
        }
        if (mBaselineView == null)
        {
            mBaselineView = view;
        } else
        {
            LayoutParams layoutparams1 = (LayoutParams)mBaselineView.getLayoutParams();
            if (layoutparams.mTop < layoutparams1.mTop || layoutparams.mTop == layoutparams1.mTop && layoutparams.mLeft < layoutparams1.mLeft)
            {
                mBaselineView = view;
                return;
            }
        }
    }

    private void applyHorizontalSizeRules(LayoutParams layoutparams, int i)
    {
        int ai[] = layoutparams.getRules(getLayoutDirection());
        layoutparams.mLeft = -1;
        layoutparams.mRight = -1;
        LayoutParams layoutparams1 = getRelatedViewParams(ai, 0);
        if (layoutparams1 != null)
            layoutparams.mRight = layoutparams1.mLeft - (((android.view.ViewGroup.MarginLayoutParams) (layoutparams1)).leftMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin);
        else
        if (layoutparams.alignWithParent && ai[0] != 0 && i >= 0)
            layoutparams.mRight = i - super.mPaddingRight - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin;
        LayoutParams layoutparams2 = getRelatedViewParams(ai, 1);
        if (layoutparams2 != null)
            layoutparams.mLeft = layoutparams2.mRight + (((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).rightMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin);
        else
        if (layoutparams.alignWithParent && ai[1] != 0)
            layoutparams.mLeft = super.mPaddingLeft + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin;
        LayoutParams layoutparams3 = getRelatedViewParams(ai, 5);
        if (layoutparams3 != null)
            layoutparams.mLeft = layoutparams3.mLeft + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin;
        else
        if (layoutparams.alignWithParent && ai[5] != 0)
            layoutparams.mLeft = super.mPaddingLeft + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin;
        LayoutParams layoutparams4 = getRelatedViewParams(ai, 7);
        if (layoutparams4 != null)
            layoutparams.mRight = layoutparams4.mRight - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin;
        else
        if (layoutparams.alignWithParent && ai[7] != 0 && i >= 0)
            layoutparams.mRight = i - super.mPaddingRight - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin;
        if (ai[9] != 0)
            layoutparams.mLeft = super.mPaddingLeft + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin;
        if (ai[11] != 0 && i >= 0)
            layoutparams.mRight = i - super.mPaddingRight - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin;
    }

    private void applyVerticalSizeRules(LayoutParams layoutparams, int i)
    {
        int ai[] = layoutparams.getRules();
        layoutparams.mTop = -1;
        layoutparams.mBottom = -1;
        LayoutParams layoutparams1 = getRelatedViewParams(ai, 2);
        if (layoutparams1 != null)
            layoutparams.mBottom = layoutparams1.mTop - (((android.view.ViewGroup.MarginLayoutParams) (layoutparams1)).topMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).bottomMargin);
        else
        if (layoutparams.alignWithParent && ai[2] != 0 && i >= 0)
            layoutparams.mBottom = i - super.mPaddingBottom - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).bottomMargin;
        LayoutParams layoutparams2 = getRelatedViewParams(ai, 3);
        if (layoutparams2 != null)
            layoutparams.mTop = layoutparams2.mBottom + (((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).bottomMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin);
        else
        if (layoutparams.alignWithParent && ai[3] != 0)
            layoutparams.mTop = super.mPaddingTop + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin;
        LayoutParams layoutparams3 = getRelatedViewParams(ai, 6);
        if (layoutparams3 != null)
            layoutparams.mTop = layoutparams3.mTop + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin;
        else
        if (layoutparams.alignWithParent && ai[6] != 0)
            layoutparams.mTop = super.mPaddingTop + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin;
        LayoutParams layoutparams4 = getRelatedViewParams(ai, 8);
        if (layoutparams4 != null)
            layoutparams.mBottom = layoutparams4.mBottom - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).bottomMargin;
        else
        if (layoutparams.alignWithParent && ai[8] != 0 && i >= 0)
            layoutparams.mBottom = i - super.mPaddingBottom - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).bottomMargin;
        if (ai[10] != 0)
            layoutparams.mTop = super.mPaddingTop + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin;
        if (ai[12] != 0 && i >= 0)
            layoutparams.mBottom = i - super.mPaddingBottom - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).bottomMargin;
        if (ai[4] != 0)
            mHasBaselineAlignedChild = true;
    }

    private void centerHorizontal(View view, LayoutParams layoutparams, int i)
    {
        int j = view.getMeasuredWidth();
        int k = (i - j) / 2;
        layoutparams.mLeft = k;
        layoutparams.mRight = k + j;
    }

    private void centerVertical(View view, LayoutParams layoutparams, int i)
    {
        int j = view.getMeasuredHeight();
        int k = (i - j) / 2;
        layoutparams.mTop = k;
        layoutparams.mBottom = k + j;
    }

    private int getChildMeasureSpec(int i, int j, int k, int l, int i1, int j1, int k1, 
            int l1)
    {
        int i2 = i;
        int j2 = j;
        if (i2 < 0)
            i2 = j1 + l;
        if (j2 < 0)
            j2 = l1 - k1 - i1;
        int k2 = j2 - i2;
        int l2;
        int i3;
        if (i >= 0 && j >= 0)
        {
            l2 = 0x40000000;
            i3 = k2;
        } else
        if (k >= 0)
        {
            l2 = 0x40000000;
            if (k2 >= 0)
                i3 = Math.min(k2, k);
            else
                i3 = k;
        } else
        if (k == -1)
        {
            l2 = 0x40000000;
            i3 = k2;
        } else
        {
            l2 = 0;
            i3 = 0;
            if (k == -2)
                if (k2 >= 0)
                {
                    l2 = 0x80000000;
                    i3 = k2;
                } else
                {
                    l2 = 0;
                    i3 = 0;
                }
        }
        return android.view.View.MeasureSpec.makeMeasureSpec(i3, l2);
    }

    private View getRelatedView(int ai[], int i)
    {
        int j = ai[i];
        if (j != 0)
        {
            DependencyGraph.Node node = (DependencyGraph.Node)mGraph.mKeyNodes.get(j);
            View view;
            if (node == null)
            {
                view = null;
            } else
            {
                DependencyGraph.Node node1;
                for (view = node.view; view.getVisibility() == 8; view = node1.view)
                {
                    int ai1[] = ((LayoutParams)view.getLayoutParams()).getRules(view.getLayoutDirection());
                    node1 = (DependencyGraph.Node)mGraph.mKeyNodes.get(ai1[i]);
                    if (node1 == null)
                        return null;
                }

            }
            return view;
        } else
        {
            return null;
        }
    }

    private int getRelatedViewBaseline(int ai[], int i)
    {
        View view = getRelatedView(ai, i);
        if (view != null)
            return view.getBaseline();
        else
            return -1;
    }

    private LayoutParams getRelatedViewParams(int ai[], int i)
    {
        View view = getRelatedView(ai, i);
        if (view != null && (view.getLayoutParams() instanceof LayoutParams))
            return (LayoutParams)view.getLayoutParams();
        else
            return null;
    }

    private void initFromAttributes(Context context, AttributeSet attributeset)
    {
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.RelativeLayout);
        mIgnoreGravity = typedarray.getResourceId(1, -1);
        mGravity = typedarray.getInt(0, mGravity);
        typedarray.recycle();
    }

    private void measureChild(View view, LayoutParams layoutparams, int i, int j)
    {
        view.measure(getChildMeasureSpec(layoutparams.mLeft, layoutparams.mRight, ((android.view.ViewGroup.LayoutParams) (layoutparams)).width, ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin, ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin, super.mPaddingLeft, super.mPaddingRight, i), getChildMeasureSpec(layoutparams.mTop, layoutparams.mBottom, ((android.view.ViewGroup.LayoutParams) (layoutparams)).height, ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin, ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).bottomMargin, super.mPaddingTop, super.mPaddingBottom, j));
    }

    private void measureChildHorizontal(View view, LayoutParams layoutparams, int i, int j)
    {
        int k = getChildMeasureSpec(layoutparams.mLeft, layoutparams.mRight, ((android.view.ViewGroup.LayoutParams) (layoutparams)).width, ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin, ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin, super.mPaddingLeft, super.mPaddingRight, i);
        int l;
        if (((android.view.ViewGroup.LayoutParams) (layoutparams)).width == -1)
            l = android.view.View.MeasureSpec.makeMeasureSpec(j, 0x40000000);
        else
            l = android.view.View.MeasureSpec.makeMeasureSpec(j, 0x80000000);
        view.measure(k, l);
    }

    private boolean positionChildHorizontal(View view, LayoutParams layoutparams, int i, boolean flag)
    {
label0:
        {
            int ai[] = layoutparams.getRules(getLayoutDirection());
            if (layoutparams.mLeft < 0 && layoutparams.mRight >= 0)
                layoutparams.mLeft = layoutparams.mRight - view.getMeasuredWidth();
            else
            if (layoutparams.mLeft >= 0 && layoutparams.mRight < 0)
                layoutparams.mRight = layoutparams.mLeft + view.getMeasuredWidth();
            else
            if (layoutparams.mLeft < 0 && layoutparams.mRight < 0)
            {
                if (ai[13] != 0 || ai[14] != 0)
                    break label0;
                if (isLayoutRtl())
                {
                    layoutparams.mRight = i - super.mPaddingRight - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin;
                    layoutparams.mLeft = layoutparams.mRight - view.getMeasuredWidth();
                } else
                {
                    layoutparams.mLeft = super.mPaddingLeft + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin;
                    layoutparams.mRight = layoutparams.mLeft + view.getMeasuredWidth();
                }
            }
            return ai[21] != 0;
        }
        if (!flag)
        {
            centerHorizontal(view, layoutparams, i);
            return true;
        } else
        {
            layoutparams.mLeft = super.mPaddingLeft + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin;
            layoutparams.mRight = layoutparams.mLeft + view.getMeasuredWidth();
            return true;
        }
    }

    private boolean positionChildVertical(View view, LayoutParams layoutparams, int i, boolean flag)
    {
label0:
        {
            int ai[] = layoutparams.getRules();
            if (layoutparams.mTop < 0 && layoutparams.mBottom >= 0)
                layoutparams.mTop = layoutparams.mBottom - view.getMeasuredHeight();
            else
            if (layoutparams.mTop >= 0 && layoutparams.mBottom < 0)
                layoutparams.mBottom = layoutparams.mTop + view.getMeasuredHeight();
            else
            if (layoutparams.mTop < 0 && layoutparams.mBottom < 0)
            {
                if (ai[13] != 0 || ai[15] != 0)
                    break label0;
                layoutparams.mTop = super.mPaddingTop + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin;
                layoutparams.mBottom = layoutparams.mTop + view.getMeasuredHeight();
            }
            return ai[12] != 0;
        }
        if (!flag)
        {
            centerVertical(view, layoutparams, i);
            return true;
        } else
        {
            layoutparams.mTop = super.mPaddingTop + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin;
            layoutparams.mBottom = layoutparams.mTop + view.getMeasuredHeight();
            return true;
        }
    }

    private void sortChildren()
    {
        int i = getChildCount();
        if (mSortedVerticalChildren.length != i)
            mSortedVerticalChildren = new View[i];
        if (mSortedHorizontalChildren.length != i)
            mSortedHorizontalChildren = new View[i];
        DependencyGraph dependencygraph = mGraph;
        dependencygraph.clear();
        for (int j = 0; j < i; j++)
            dependencygraph.add(getChildAt(j));

        dependencygraph.getSortedViews(mSortedVerticalChildren, RULES_VERTICAL);
        dependencygraph.getSortedViews(mSortedHorizontalChildren, RULES_HORIZONTAL);
    }

    protected boolean checkLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return layoutparams instanceof LayoutParams;
    }

    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        if (mTopToBottomLeftToRightSet == null)
            mTopToBottomLeftToRightSet = new TreeSet(new TopToBottomLeftToRightComparator());
        int i = 0;
        for (int j = getChildCount(); i < j; i++)
            mTopToBottomLeftToRightSet.add(getChildAt(i));

        for (Iterator iterator = mTopToBottomLeftToRightSet.iterator(); iterator.hasNext();)
        {
            View view = (View)iterator.next();
            if (view.getVisibility() == 0 && view.dispatchPopulateAccessibilityEvent(accessibilityevent))
            {
                mTopToBottomLeftToRightSet.clear();
                return true;
            }
        }

        mTopToBottomLeftToRightSet.clear();
        return false;
    }

    protected android.view.ViewGroup.LayoutParams generateDefaultLayoutParams()
    {
        return new LayoutParams(-2, -2);
    }

    public volatile android.view.ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return generateLayoutParams(attributeset);
    }

    protected android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return new LayoutParams(layoutparams);
    }

    public LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return new LayoutParams(getContext(), attributeset);
    }

    public int getBaseline()
    {
        if (mBaselineView != null)
            return mBaselineView.getBaseline();
        else
            return super.getBaseline();
    }

    public int getGravity()
    {
        return mGravity;
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/RelativeLayout.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/RelativeLayout.getName());
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        int i1 = getChildCount();
        for (int j1 = 0; j1 < i1; j1++)
        {
            View view = getChildAt(j1);
            if (view.getVisibility() != 8)
            {
                LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
                view.layout(layoutparams.mLeft, layoutparams.mTop, layoutparams.mRight, layoutparams.mBottom);
            }
        }

    }

    protected void onMeasure(int i, int j)
    {
        int k;
        int l;
        int i1;
        int j1;
        int i2;
        int j2;
        boolean flag;
        boolean flag1;
        int i3;
        int j3;
        int k3;
        int l3;
        boolean flag2;
        boolean flag3;
        View view;
label0:
        {
            if (mDirtyHierarchy)
            {
                mDirtyHierarchy = false;
                sortChildren();
            }
            k = -1;
            l = -1;
            i1 = android.view.View.MeasureSpec.getMode(i);
            j1 = android.view.View.MeasureSpec.getMode(j);
            int k1 = android.view.View.MeasureSpec.getSize(i);
            int l1 = android.view.View.MeasureSpec.getSize(j);
            if (i1 != 0)
                k = k1;
            if (j1 != 0)
                l = l1;
            i2 = 0;
            if (i1 == 0x40000000)
                i2 = k;
            j2 = 0;
            if (j1 == 0x40000000)
                j2 = l;
            mHasBaselineAlignedChild = false;
            int k2 = 0x800007 & mGravity;
            if (k2 != 0x800003 && k2 != 0)
                flag = true;
            else
                flag = false;
            int l2 = 0x70 & mGravity;
            if (l2 != 48 && l2 != 0)
                flag1 = true;
            else
                flag1 = false;
            i3 = 0x7fffffff;
            j3 = 0x7fffffff;
            k3 = 0x80000000;
            l3 = 0x80000000;
            flag2 = false;
            flag3 = false;
            if (!flag)
            {
                view = null;
                if (!flag1)
                    break label0;
            }
            int i4 = mIgnoreGravity;
            view = null;
            if (i4 != -1)
                view = findViewById(mIgnoreGravity);
        }
        boolean flag4;
        if (i1 != 0x40000000)
            flag4 = true;
        else
            flag4 = false;
        boolean flag5;
        if (j1 != 0x40000000)
            flag5 = true;
        else
            flag5 = false;
        View aview[] = mSortedHorizontalChildren;
        int j4 = aview.length;
        if (isLayoutRtl() && (k == -1 || flag4))
        {
            int i11 = getPaddingStart() + getPaddingEnd();
            int j11 = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
            for (int k11 = 0; k11 < j4; k11++)
            {
                View view7 = aview[k11];
                if (view7.getVisibility() == 8)
                    continue;
                LayoutParams layoutparams6 = (LayoutParams)view7.getLayoutParams();
                int l11;
                if (((android.view.ViewGroup.LayoutParams) (layoutparams6)).width == -1)
                    l11 = android.view.View.MeasureSpec.makeMeasureSpec(l, 0x40000000);
                else
                    l11 = android.view.View.MeasureSpec.makeMeasureSpec(l, 0x80000000);
                view7.measure(j11, l11);
                i11 = i11 + view7.getMeasuredWidth() + (((android.view.ViewGroup.MarginLayoutParams) (layoutparams6)).leftMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams6)).rightMargin);
            }

            if (k == -1)
                k = i11;
            else
            if (i11 > 0)
                k = Math.min(k, i11);
        }
        for (int k4 = 0; k4 < j4; k4++)
        {
            View view6 = aview[k4];
            if (view6.getVisibility() == 8)
                continue;
            LayoutParams layoutparams5 = (LayoutParams)view6.getLayoutParams();
            applyHorizontalSizeRules(layoutparams5, k);
            measureChildHorizontal(view6, layoutparams5, k, l);
            if (positionChildHorizontal(view6, layoutparams5, k, flag4))
                flag2 = true;
        }

        View aview1[] = mSortedVerticalChildren;
        int l4 = aview1.length;
        for (int i5 = 0; i5 < l4; i5++)
        {
            View view5 = aview1[i5];
            if (view5.getVisibility() == 8)
                continue;
            LayoutParams layoutparams4 = (LayoutParams)view5.getLayoutParams();
            applyVerticalSizeRules(layoutparams4, l);
            measureChild(view5, layoutparams4, k, l);
            if (positionChildVertical(view5, layoutparams4, l, flag5))
                flag3 = true;
            if (flag4)
            {
                int l10 = layoutparams4.mRight;
                i2 = Math.max(i2, l10);
            }
            if (flag5)
            {
                int k10 = layoutparams4.mBottom;
                j2 = Math.max(j2, k10);
            }
            if (view5 != view || flag1)
            {
                int l9 = layoutparams4.mLeft - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams4)).leftMargin;
                i3 = Math.min(i3, l9);
                int i10 = layoutparams4.mTop - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams4)).topMargin;
                j3 = Math.min(j3, i10);
            }
            if (view5 != view || flag)
            {
                int j10 = layoutparams4.mRight + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams4)).rightMargin;
                k3 = Math.max(k3, j10);
                l3 = Math.max(l3, layoutparams4.mBottom + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams4)).bottomMargin);
            }
        }

        if (mHasBaselineAlignedChild)
        {
            for (int l8 = 0; l8 < l4; l8++)
            {
                View view4 = getChildAt(l8);
                if (view4.getVisibility() == 8)
                    continue;
                LayoutParams layoutparams3 = (LayoutParams)view4.getLayoutParams();
                alignBaseline(view4, layoutparams3);
                if (view4 != view || flag1)
                {
                    int i9 = layoutparams3.mLeft - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams3)).leftMargin;
                    i3 = Math.min(i3, i9);
                    int j9 = layoutparams3.mTop - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams3)).topMargin;
                    j3 = Math.min(j3, j9);
                }
                if (view4 != view || flag)
                {
                    int k9 = layoutparams3.mRight + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams3)).rightMargin;
                    k3 = Math.max(k3, k9);
                    l3 = Math.max(l3, layoutparams3.mBottom + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams3)).bottomMargin);
                }
            }

        }
        int j5 = getLayoutDirection();
        if (flag4)
        {
            int k7 = i2 + super.mPaddingRight;
            if (super.mLayoutParams.width >= 0)
            {
                int k8 = super.mLayoutParams.width;
                k7 = Math.max(k7, k8);
            }
            int l7 = getSuggestedMinimumWidth();
            i2 = resolveSize(Math.max(k7, l7), i);
            if (flag2)
            {
                for (int i8 = 0; i8 < l4; i8++)
                {
                    View view3 = getChildAt(i8);
                    if (view3.getVisibility() == 8)
                        continue;
                    LayoutParams layoutparams2 = (LayoutParams)view3.getLayoutParams();
                    int ai1[] = layoutparams2.getRules(j5);
                    if (ai1[13] == 0 && ai1[14] == 0)
                    {
                        if (ai1[11] != 0)
                        {
                            int j8 = view3.getMeasuredWidth();
                            layoutparams2.mLeft = i2 - super.mPaddingRight - j8;
                            layoutparams2.mRight = j8 + layoutparams2.mLeft;
                        }
                    } else
                    {
                        centerHorizontal(view3, layoutparams2, i2);
                    }
                }

            }
        }
        if (flag5)
        {
            int j6 = j2 + super.mPaddingBottom;
            if (super.mLayoutParams.height >= 0)
            {
                int j7 = super.mLayoutParams.height;
                j6 = Math.max(j6, j7);
            }
            int k6 = getSuggestedMinimumHeight();
            j2 = resolveSize(Math.max(j6, k6), j);
            if (flag3)
            {
                for (int l6 = 0; l6 < l4; l6++)
                {
                    View view2 = getChildAt(l6);
                    if (view2.getVisibility() == 8)
                        continue;
                    LayoutParams layoutparams1 = (LayoutParams)view2.getLayoutParams();
                    int ai[] = layoutparams1.getRules(j5);
                    if (ai[13] == 0 && ai[15] == 0)
                    {
                        if (ai[12] != 0)
                        {
                            int i7 = view2.getMeasuredHeight();
                            layoutparams1.mTop = j2 - super.mPaddingBottom - i7;
                            layoutparams1.mBottom = i7 + layoutparams1.mTop;
                        }
                    } else
                    {
                        centerVertical(view2, layoutparams1, j2);
                    }
                }

            }
        }
        if (flag || flag1)
        {
            Rect rect = mSelfBounds;
            rect.set(super.mPaddingLeft, super.mPaddingTop, i2 - super.mPaddingRight, j2 - super.mPaddingBottom);
            Rect rect1 = mContentBounds;
            Gravity.apply(mGravity, k3 - i3, l3 - j3, rect, rect1, j5);
            int k5 = rect1.left - i3;
            int l5 = rect1.top - j3;
            if (k5 != 0 || l5 != 0)
            {
                for (int i6 = 0; i6 < l4; i6++)
                {
                    View view1 = getChildAt(i6);
                    if (view1.getVisibility() == 8 || view1 == view)
                        continue;
                    LayoutParams layoutparams = (LayoutParams)view1.getLayoutParams();
                    if (flag)
                    {
                        int j = i + ((RelativeLayout) (this)).getRelatedViewParams;
                        int j = i + 
// JavaClassFileOutputException: get_constant: invalid tag

    public void requestLayout()
    {
        requestLayout();
        mDirtyHierarchy = true;
    }

    public void setGravity(int i)
    {
        if (mGravity != i)
        {
            if ((0x800007 & i) == 0)
                i |= 0x800003;
            if ((i & 0x70) == 0)
                i |= 0x30;
            mGravity = i;
            requestLayout();
        }
    }

    public void setHorizontalGravity(int i)
    {
        int j = i & 0x800007;
        if ((0x800007 & mGravity) != j)
        {
            mGravity = j | 0xff7ffff8 & mGravity;
            requestLayout();
        }
    }

    public void setIgnoreGravity(int i)
    {
        mIgnoreGravity = i;
    }

    public void setVerticalGravity(int i)
    {
        int j = i & 0x70;
        if ((0x70 & mGravity) != j)
        {
            mGravity = j | 0xffffff8f & mGravity;
            requestLayout();
        }
    }

    public boolean shouldDelayChildPressedState()
    {
        return false;
    }

}
