// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.*;
import android.util.*;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import java.lang.reflect.Array;
import java.util.*;

// Referenced classes of package android.widget:
//            Space

public class GridLayout extends ViewGroup
{
    public static abstract class Alignment
    {

        abstract int getAlignmentValue(View view, int i, int j);

        Bounds getBounds()
        {
            return new Bounds();
        }

        abstract int getGravityOffset(View view, int i);

        int getSizeInCell(View view, int i, int j)
        {
            return i;
        }

    }

    static final class Arc
    {

        public final Interval span;
        public boolean valid;
        public final MutableInt value;

        public String toString()
        {
            StringBuilder stringbuilder = (new StringBuilder()).append(span).append(" ");
            String s;
            if (!valid)
                s = "+>";
            else
                s = "->";
            return stringbuilder.append(s).append(" ").append(value).toString();
        }

        public Arc(Interval interval, MutableInt mutableint)
        {
            valid = true;
            span = interval;
            value = mutableint;
        }
    }

    static final class Assoc extends ArrayList
    {

        private final Class keyType;
        private final Class valueType;

        public static Assoc of(Class class1, Class class2)
        {
            return new Assoc(class1, class2);
        }

        public PackedMap pack()
        {
            int i = size();
            Object aobj[] = (Object[])(Object[])Array.newInstance(keyType, i);
            Object aobj1[] = (Object[])(Object[])Array.newInstance(valueType, i);
            for (int j = 0; j < i; j++)
            {
                aobj[j] = ((Pair)get(j)).first;
                aobj1[j] = ((Pair)get(j)).second;
            }

            return new PackedMap(aobj, aobj1);
        }

        public void put(Object obj, Object obj1)
        {
            add(Pair.create(obj, obj1));
        }

        private Assoc(Class class1, Class class2)
        {
            keyType = class1;
            valueType = class2;
        }
    }

    final class Axis
    {

        static final boolean $assertionsDisabled = false;
        private static final int COMPLETE = 2;
        private static final int NEW = 0;
        private static final int PENDING = 1;
        public Arc arcs[];
        public boolean arcsValid;
        PackedMap backwardLinks;
        public boolean backwardLinksValid;
        public int definedCount;
        PackedMap forwardLinks;
        public boolean forwardLinksValid;
        PackedMap groupBounds;
        public boolean groupBoundsValid;
        public final boolean horizontal;
        public int leadingMargins[];
        public boolean leadingMarginsValid;
        public int locations[];
        public boolean locationsValid;
        private int maxIndex;
        boolean orderPreserved;
        private MutableInt parentMax;
        private MutableInt parentMin;
        final GridLayout this$0;
        public int trailingMargins[];
        public boolean trailingMarginsValid;

        private void addComponentSizes(List list, PackedMap packedmap)
        {
            for (int i = 0; i < ((Interval[])packedmap.keys).length; i++)
                include(list, ((Interval[])packedmap.keys)[i], ((MutableInt[])packedmap.values)[i], false);

        }

        private String arcsToString(List list)
        {
            String s;
            if (horizontal)
                s = "x";
            else
                s = "y";
            StringBuilder stringbuilder = new StringBuilder();
            boolean flag = true;
            String s1;
            for (Iterator iterator = list.iterator(); iterator.hasNext(); stringbuilder.append(s1))
            {
                Arc arc = (Arc)iterator.next();
                if (flag)
                    flag = false;
                else
                    stringbuilder = stringbuilder.append(", ");
                int i = arc.span.min;
                int j = arc.span.max;
                int k = arc.value.value;
                if (i < j)
                    s1 = (new StringBuilder()).append(s).append(j).append("-").append(s).append(i).append(">=").append(k).toString();
                else
                    s1 = (new StringBuilder()).append(s).append(i).append("-").append(s).append(j).append("<=").append(-k).toString();
            }

            return stringbuilder.toString();
        }

        private int calculateMaxIndex()
        {
            int i = -1;
            int j = 0;
            for (int k = getChildCount(); j < k; j++)
            {
                View view = getChildAt(j);
                LayoutParams layoutparams = getLayoutParams(view);
                Spec spec1;
                if (horizontal)
                    spec1 = layoutparams.columnSpec;
                else
                    spec1 = layoutparams.rowSpec;
                Interval interval = spec1.span;
                i = Math.max(Math.max(Math.max(i, interval.min), interval.max), interval.size());
            }

            if (i == -1)
                i = 0x80000000;
            return i;
        }

        private void computeArcs()
        {
            getForwardLinks();
            getBackwardLinks();
        }

        private void computeGroupBounds()
        {
            Bounds abounds[] = (Bounds[])groupBounds.values;
            for (int i = 0; i < abounds.length; i++)
                abounds[i].reset();

            int j = 0;
            for (int k = getChildCount(); j < k; j++)
            {
                View view = getChildAt(j);
                LayoutParams layoutparams = getLayoutParams(view);
                Spec spec1;
                if (horizontal)
                    spec1 = layoutparams.columnSpec;
                else
                    spec1 = layoutparams.rowSpec;
                ((Bounds)groupBounds.getValue(j)).include(GridLayout.this, view, spec1, this);
            }

        }

        private void computeLinks(PackedMap packedmap, boolean flag)
        {
            MutableInt amutableint[] = (MutableInt[])packedmap.values;
            for (int i = 0; i < amutableint.length; i++)
                amutableint[i].reset();

            Bounds abounds[] = (Bounds[])getGroupBounds().values;
            for (int j = 0; j < abounds.length; j++)
            {
                int k = abounds[j].size(flag);
                MutableInt mutableint = (MutableInt)packedmap.getValue(j);
                int l = mutableint.value;
                if (!flag)
                    k = -k;
                mutableint.value = Math.max(l, k);
            }

        }

        private void computeLocations(int ai[])
        {
            solve(getArcs(), ai);
            if (!orderPreserved)
            {
                int i = ai[0];
                int j = 0;
                for (int k = ai.length; j < k; j++)
                    ai[j] = ai[j] - i;

            }
        }

        private void computeMargins(boolean flag)
        {
            int ai[];
            if (flag)
                ai = leadingMargins;
            else
                ai = trailingMargins;
            int i = 0;
            for (int j = getChildCount(); i < j; i++)
            {
                View view = getChildAt(i);
                if (view.getVisibility() == 8)
                    continue;
                LayoutParams layoutparams = getLayoutParams(view);
                Spec spec1;
                if (horizontal)
                    spec1 = layoutparams.columnSpec;
                else
                    spec1 = layoutparams.rowSpec;
                Interval interval = spec1.span;
                int k;
                if (flag)
                    k = interval.min;
                else
                    k = interval.max;
                ai[k] = Math.max(ai[k], getMargin1(view, horizontal, flag));
            }

        }

        private Arc[] createArcs()
        {
            ArrayList arraylist = new ArrayList();
            ArrayList arraylist1 = new ArrayList();
            addComponentSizes(arraylist, getForwardLinks());
            addComponentSizes(arraylist1, getBackwardLinks());
            if (orderPreserved)
            {
                for (int j = 0; j < getCount(); j++)
                    include(arraylist, new Interval(j, j + 1), new MutableInt(0));

            }
            int i = getCount();
            include(arraylist, new Interval(0, i), parentMin, false);
            include(arraylist1, new Interval(i, 0), parentMax, false);
            return (Arc[])GridLayout.append(topologicalSort(arraylist), topologicalSort(arraylist1));
        }

        private PackedMap createGroupBounds()
        {
            Assoc assoc = Assoc.of(android/widget/GridLayout$Spec, android/widget/GridLayout$Bounds);
            int i = 0;
            for (int j = getChildCount(); i < j; i++)
            {
                View view = getChildAt(i);
                LayoutParams layoutparams = getLayoutParams(view);
                Spec spec1;
                if (horizontal)
                    spec1 = layoutparams.columnSpec;
                else
                    spec1 = layoutparams.rowSpec;
                assoc.put(spec1, getAlignment(spec1.alignment, horizontal).getBounds());
            }

            return assoc.pack();
        }

        private PackedMap createLinks(boolean flag)
        {
            Assoc assoc = Assoc.of(android/widget/GridLayout$Interval, android/widget/GridLayout$MutableInt);
            Spec aspec[] = (Spec[])getGroupBounds().keys;
            int i = 0;
            for (int j = aspec.length; i < j; i++)
            {
                Interval interval;
                if (flag)
                    interval = aspec[i].span;
                else
                    interval = aspec[i].span.inverse();
                assoc.put(interval, new MutableInt());
            }

            return assoc.pack();
        }

        private PackedMap getBackwardLinks()
        {
            if (backwardLinks == null)
                backwardLinks = createLinks(false);
            if (!backwardLinksValid)
            {
                computeLinks(backwardLinks, false);
                backwardLinksValid = true;
            }
            return backwardLinks;
        }

        private PackedMap getForwardLinks()
        {
            if (forwardLinks == null)
                forwardLinks = createLinks(true);
            if (!forwardLinksValid)
            {
                computeLinks(forwardLinks, true);
                forwardLinksValid = true;
            }
            return forwardLinks;
        }

        private int getMaxIndex()
        {
            if (maxIndex == 0x80000000)
                maxIndex = Math.max(0, calculateMaxIndex());
            return maxIndex;
        }

        private int getMeasure(int i, int j)
        {
            setParentConstraints(i, j);
            return size(getLocations());
        }

        private void include(List list, Interval interval, MutableInt mutableint)
        {
            include(list, interval, mutableint, true);
        }

        private void include(List list, Interval interval, MutableInt mutableint, boolean flag)
        {
label0:
            {
                if (interval.size() == 0)
                    return;
                if (!flag)
                    break label0;
                Iterator iterator = list.iterator();
                do
                    if (!iterator.hasNext())
                        break label0;
                while (!((Arc)iterator.next()).span.equals(interval));
                return;
            }
            list.add(new Arc(interval, mutableint));
        }

        private void init(int ai[])
        {
            Arrays.fill(ai, 0);
        }

        private void logError(String s, Arc aarc[], boolean aflag[])
        {
            ArrayList arraylist = new ArrayList();
            ArrayList arraylist1 = new ArrayList();
            for (int i = 0; i < aarc.length; i++)
            {
                Arc arc = aarc[i];
                if (aflag[i])
                    arraylist.add(arc);
                if (!arc.valid)
                    arraylist1.add(arc);
            }

            Log.d(GridLayout.TAG, (new StringBuilder()).append(s).append(" constraints: ").append(arcsToString(arraylist)).append(" are inconsistent; ").append("permanently removing: ").append(arcsToString(arraylist1)).append(". ").toString());
        }

        private boolean relax(int ai[], Arc arc)
        {
            if (arc.valid)
            {
                Interval interval = arc.span;
                int i = interval.min;
                int j = interval.max;
                int k = arc.value.value + ai[i];
                if (k > ai[j])
                {
                    ai[j] = k;
                    return true;
                }
            }
            return false;
        }

        private void setParentConstraints(int i, int j)
        {
            parentMin.value = i;
            parentMax.value = -j;
            locationsValid = false;
        }

        private int size(int ai[])
        {
            return ai[getCount()];
        }

        private void solve(Arc aarc[], int ai[])
        {
            String s;
            int i;
            boolean aflag[];
            int j;
            if (horizontal)
                s = "horizontal";
            else
                s = "vertical";
            i = 1 + getCount();
            aflag = null;
            j = 0;
_L8:
            if (j >= aarc.length) goto _L2; else goto _L1
_L1:
            int k;
            init(ai);
            k = 0;
_L6:
            boolean flag;
            if (k >= i)
                break; /* Loop/switch isn't completed */
            flag = false;
            int l1 = 0;
            for (int i2 = aarc.length; l1 < i2; l1++)
                flag |= relax(ai, aarc[l1]);

            if (flag) goto _L4; else goto _L3
_L3:
            if (aflag != null)
                logError(s, aarc, aflag);
_L2:
            return;
_L4:
            k++;
            if (true) goto _L6; else goto _L5
_L5:
            boolean aflag1[] = new boolean[aarc.length];
            for (int l = 0; l < i; l++)
            {
                int j1 = 0;
                for (int k1 = aarc.length; j1 < k1; j1++)
                    aflag1[j1] = aflag1[j1] | relax(ai, aarc[j1]);

            }

            if (j == 0)
                aflag = aflag1;
            int i1 = 0;
            do
            {
label0:
                {
                    if (i1 < aarc.length)
                    {
                        if (!aflag1[i1])
                            break label0;
                        Arc arc = aarc[i1];
                        if (arc.span.min < arc.span.max)
                            break label0;
                        arc.valid = false;
                    }
                    j++;
                }
                if (true)
                    continue;
                i1++;
            } while (true);
            if (true) goto _L8; else goto _L7
_L7:
        }

        private Arc[] topologicalSort(List list)
        {
            return topologicalSort((Arc[])list.toArray(new Arc[list.size()]));
        }

        private Arc[] topologicalSort(Arc aarc[])
        {
            return (aarc. new Object() {

                static final boolean $assertionsDisabled;
                Arc arcsByVertex[][];
                int cursor;
                Arc result[];
                final Axis this$1;
                final Arc val$arcs[];
                int visited[];

                Arc[] sort()
                {
                    int i = 0;
                    for (int j = arcsByVertex.length; i < j; i++)
                        walk(i);

                    if (!$assertionsDisabled && cursor != -1)
                        throw new AssertionError();
                    else
                        return result;
                }

                void walk(int i)
                {
                    Arc aarc[];
                    int j;
                    int k;
                    switch (visited[i])
                    {
                    case 1: // '\001'
                        if (!$assertionsDisabled)
                            throw new AssertionError();
                        // fall through

                    default:
                        return;

                    case 0: // '\0'
                        visited[i] = 1;
                        aarc = arcsByVertex[i];
                        j = aarc.length;
                        k = 0;
                        break;
                    }
                    for (; k < j; k++)
                    {
                        Arc arc = aarc[k];
                        walk(arc.span.max);
                        Arc aarc1[] = result;
                        int l = cursor;
                        cursor = l - 1;
                        aarc1[l] = arc;
                    }

                    visited[i] = 2;
                }

                static 
                {
                    boolean flag;
                    if (!android/widget/GridLayout.desiredAssertionStatus())
                        flag = true;
                    else
                        flag = false;
                    $assertionsDisabled = flag;
                }

            
            {
                this$1 = final_axis;
                arcs = _5B_Landroid.widget.Arc_3B_.this;
                super();
                result = new Arc[arcs.length];
                cursor = -1 + result.length;
                arcsByVertex = groupArcsByFirstVertex(arcs);
                visited = new int[1 + getCount()];
            }
            }
).sort();
        }

        public Arc[] getArcs()
        {
            if (arcs == null)
                arcs = createArcs();
            if (!arcsValid)
            {
                computeArcs();
                arcsValid = true;
            }
            return arcs;
        }

        public int getCount()
        {
            return Math.max(definedCount, getMaxIndex());
        }

        public PackedMap getGroupBounds()
        {
            if (groupBounds == null)
                groupBounds = createGroupBounds();
            if (!groupBoundsValid)
            {
                computeGroupBounds();
                groupBoundsValid = true;
            }
            return groupBounds;
        }

        public int[] getLeadingMargins()
        {
            if (leadingMargins == null)
                leadingMargins = new int[1 + getCount()];
            if (!leadingMarginsValid)
            {
                computeMargins(true);
                leadingMarginsValid = true;
            }
            return leadingMargins;
        }

        public int[] getLocations()
        {
            if (locations == null)
                locations = new int[1 + getCount()];
            if (!locationsValid)
            {
                computeLocations(locations);
                locationsValid = true;
            }
            return locations;
        }

        public int getMeasure(int i)
        {
            int j = android.view.View.MeasureSpec.getMode(i);
            int k = android.view.View.MeasureSpec.getSize(i);
            int l;
            switch (j)
            {
            case -2147483648: 
                return getMeasure(0, k);

            case 1073741824: 
                return getMeasure(k, k);

            case 0: // '\0'
                l = getMeasure(0, 0x186a0);
                break;

            default:
                boolean flag = $assertionsDisabled;
                l = 0;
                if (!flag)
                    throw new AssertionError();
                break;
            }
            return l;
        }

        public int[] getTrailingMargins()
        {
            if (trailingMargins == null)
                trailingMargins = new int[1 + getCount()];
            if (!trailingMarginsValid)
            {
                computeMargins(false);
                trailingMarginsValid = true;
            }
            return trailingMargins;
        }

        Arc[][] groupArcsByFirstVertex(Arc aarc[])
        {
            int i = 1 + getCount();
            Arc aarc1[][] = new Arc[i][];
            int ai[] = new int[i];
            int j = aarc.length;
            for (int k = 0; k < j; k++)
            {
                int i2 = aarc[k].span.min;
                ai[i2] = 1 + ai[i2];
            }

            for (int l = 0; l < ai.length; l++)
                aarc1[l] = new Arc[ai[l]];

            Arrays.fill(ai, 0);
            int i1 = aarc.length;
            for (int j1 = 0; j1 < i1; j1++)
            {
                Arc arc = aarc[j1];
                int k1 = arc.span.min;
                Arc aarc2[] = aarc1[k1];
                int l1 = ai[k1];
                ai[k1] = l1 + 1;
                aarc2[l1] = arc;
            }

            return aarc1;
        }

        public void invalidateStructure()
        {
            maxIndex = 0x80000000;
            groupBounds = null;
            forwardLinks = null;
            backwardLinks = null;
            leadingMargins = null;
            trailingMargins = null;
            arcs = null;
            locations = null;
            invalidateValues();
        }

        public void invalidateValues()
        {
            groupBoundsValid = false;
            forwardLinksValid = false;
            backwardLinksValid = false;
            leadingMarginsValid = false;
            trailingMarginsValid = false;
            arcsValid = false;
            locationsValid = false;
        }

        public boolean isOrderPreserved()
        {
            return orderPreserved;
        }

        public void layout(int i)
        {
            setParentConstraints(i, i);
            getLocations();
        }

        public void setCount(int i)
        {
            if (i != 0x80000000 && i < getMaxIndex())
            {
                StringBuilder stringbuilder = new StringBuilder();
                String s;
                if (horizontal)
                    s = "column";
                else
                    s = "row";
                GridLayout.handleInvalidParams(stringbuilder.append(s).append("Count must be greater than or equal to the maximum of all grid indices ").append("(and spans) defined in the LayoutParams of each child").toString());
            }
            definedCount = i;
        }

        public void setOrderPreserved(boolean flag)
        {
            orderPreserved = flag;
            invalidateStructure();
        }

        static 
        {
            boolean flag;
            if (!android/widget/GridLayout.desiredAssertionStatus())
                flag = true;
            else
                flag = false;
            $assertionsDisabled = flag;
        }

        private Axis(boolean flag)
        {
            this$0 = GridLayout.this;
            super();
            definedCount = 0x80000000;
            maxIndex = 0x80000000;
            groupBoundsValid = false;
            forwardLinksValid = false;
            backwardLinksValid = false;
            leadingMarginsValid = false;
            trailingMarginsValid = false;
            arcsValid = false;
            locationsValid = false;
            orderPreserved = true;
            parentMin = new MutableInt(0);
            parentMax = new MutableInt(0xfffe7960);
            horizontal = flag;
        }

    }

    static class Bounds
    {

        public int after;
        public int before;
        public int flexibility;

        protected int getOffset(GridLayout gridlayout, View view, Alignment alignment, int i, boolean flag)
        {
            return before - alignment.getAlignmentValue(view, i, gridlayout.getLayoutMode());
        }

        protected void include(int i, int j)
        {
            before = Math.max(before, i);
            after = Math.max(after, j);
        }

        protected final void include(GridLayout gridlayout, View view, Spec spec1, Axis axis)
        {
            flexibility = flexibility & spec1.getFlexibility();
            boolean flag = axis.horizontal;
            int i = gridlayout.getMeasurementIncludingMargin(view, flag);
            int j = gridlayout.getAlignment(spec1.alignment, flag).getAlignmentValue(view, i, gridlayout.getLayoutMode());
            include(j, i - j);
        }

        protected void reset()
        {
            before = 0x80000000;
            after = 0x80000000;
            flexibility = 2;
        }

        protected int size(boolean flag)
        {
            if (!flag && GridLayout.canStretch(flexibility))
                return 0x186a0;
            else
                return before + after;
        }

        public String toString()
        {
            return (new StringBuilder()).append("Bounds{before=").append(before).append(", after=").append(after).append('}').toString();
        }

        private Bounds()
        {
            reset();
        }

    }

    static final class Interval
    {

        public final int max;
        public final int min;

        public boolean equals(Object obj)
        {
label0:
            {
                if (this != obj)
                {
                    if (obj == null || getClass() != obj.getClass())
                        break label0;
                    Interval interval = (Interval)obj;
                    if (max != interval.max)
                        return false;
                    if (min != interval.min)
                        return false;
                }
                return true;
            }
            return false;
        }

        public int hashCode()
        {
            return 31 * min + max;
        }

        Interval inverse()
        {
            return new Interval(max, min);
        }

        int size()
        {
            return max - min;
        }

        public String toString()
        {
            return (new StringBuilder()).append("[").append(min).append(", ").append(max).append("]").toString();
        }

        public Interval(int i, int j)
        {
            min = i;
            max = j;
        }
    }

    public static class LayoutParams extends android.view.ViewGroup.MarginLayoutParams
    {

        private static final int BOTTOM_MARGIN = 6;
        private static final int COLUMN = 1;
        private static final int COLUMN_SPAN = 4;
        private static final int DEFAULT_COLUMN = 0x80000000;
        private static final int DEFAULT_HEIGHT = -2;
        private static final int DEFAULT_MARGIN = 0x80000000;
        private static final int DEFAULT_ROW = 0x80000000;
        private static final Interval DEFAULT_SPAN;
        private static final int DEFAULT_SPAN_SIZE = 0;
        private static final int DEFAULT_WIDTH = -2;
        private static final int GRAVITY = 0;
        private static final int LEFT_MARGIN = 3;
        private static final int MARGIN = 2;
        private static final int RIGHT_MARGIN = 5;
        private static final int ROW = 2;
        private static final int ROW_SPAN = 3;
        private static final int TOP_MARGIN = 4;
        public Spec columnSpec;
        public Spec rowSpec;

        private void init(Context context, AttributeSet attributeset)
        {
            TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.GridLayout_Layout);
            int i = typedarray.getInt(0, 0);
            columnSpec = GridLayout.spec(typedarray.getInt(1, 0x80000000), typedarray.getInt(4, DEFAULT_SPAN_SIZE), GridLayout.getAlignment(i, true));
            rowSpec = GridLayout.spec(typedarray.getInt(2, 0x80000000), typedarray.getInt(3, DEFAULT_SPAN_SIZE), GridLayout.getAlignment(i, false));
            typedarray.recycle();
            return;
            Exception exception;
            exception;
            typedarray.recycle();
            throw exception;
        }

        private void reInitSuper(Context context, AttributeSet attributeset)
        {
            TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.ViewGroup_MarginLayout);
            int i = typedarray.getDimensionPixelSize(2, 0x80000000);
            super.leftMargin = typedarray.getDimensionPixelSize(3, i);
            super.topMargin = typedarray.getDimensionPixelSize(4, i);
            super.rightMargin = typedarray.getDimensionPixelSize(5, i);
            super.bottomMargin = typedarray.getDimensionPixelSize(6, i);
            typedarray.recycle();
            return;
            Exception exception;
            exception;
            typedarray.recycle();
            throw exception;
        }

        public boolean equals(Object obj)
        {
label0:
            {
                if (this != obj)
                {
                    if (obj == null || getClass() != obj.getClass())
                        break label0;
                    LayoutParams layoutparams = (LayoutParams)obj;
                    if (!columnSpec.equals(layoutparams.columnSpec))
                        return false;
                    if (!rowSpec.equals(layoutparams.rowSpec))
                        return false;
                }
                return true;
            }
            return false;
        }

        public int hashCode()
        {
            return 31 * rowSpec.hashCode() + columnSpec.hashCode();
        }

        protected void setBaseAttributes(TypedArray typedarray, int i, int j)
        {
            super.width = typedarray.getLayoutDimension(i, -2);
            super.height = typedarray.getLayoutDimension(j, -2);
        }

        final void setColumnSpecSpan(Interval interval)
        {
            columnSpec = columnSpec.copyWriteSpan(interval);
        }

        public void setGravity(int i)
        {
            rowSpec = rowSpec.copyWriteAlignment(GridLayout.getAlignment(i, false));
            columnSpec = columnSpec.copyWriteAlignment(GridLayout.getAlignment(i, true));
        }

        final void setRowSpecSpan(Interval interval)
        {
            rowSpec = rowSpec.copyWriteSpan(interval);
        }

        static 
        {
            DEFAULT_SPAN = new Interval(0x80000000, 0x80000001);
            DEFAULT_SPAN_SIZE = DEFAULT_SPAN.size();
        }

        public LayoutParams()
        {
            this(Spec.UNDEFINED, Spec.UNDEFINED);
        }

        private LayoutParams(int i, int j, int k, int l, int i1, int j1, Spec spec1, 
                Spec spec2)
        {
            super(i, j);
            rowSpec = Spec.UNDEFINED;
            columnSpec = Spec.UNDEFINED;
            setMargins(k, l, i1, j1);
            rowSpec = spec1;
            columnSpec = spec2;
        }

        public LayoutParams(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
            rowSpec = Spec.UNDEFINED;
            columnSpec = Spec.UNDEFINED;
            reInitSuper(context, attributeset);
            init(context, attributeset);
        }

        public LayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
        {
            super(layoutparams);
            rowSpec = Spec.UNDEFINED;
            columnSpec = Spec.UNDEFINED;
        }

        public LayoutParams(android.view.ViewGroup.MarginLayoutParams marginlayoutparams)
        {
            super(marginlayoutparams);
            rowSpec = Spec.UNDEFINED;
            columnSpec = Spec.UNDEFINED;
        }

        public LayoutParams(LayoutParams layoutparams)
        {
            super(layoutparams);
            rowSpec = Spec.UNDEFINED;
            columnSpec = Spec.UNDEFINED;
            rowSpec = layoutparams.rowSpec;
            columnSpec = layoutparams.columnSpec;
        }

        public LayoutParams(Spec spec1, Spec spec2)
        {
            this(-2, -2, 0x80000000, 0x80000000, 0x80000000, 0x80000000, spec1, spec2);
        }
    }

    static final class MutableInt
    {

        public int value;

        public void reset()
        {
            value = 0x80000000;
        }

        public String toString()
        {
            return Integer.toString(value);
        }

        public MutableInt()
        {
            reset();
        }

        public MutableInt(int i)
        {
            value = i;
        }
    }

    static final class PackedMap
    {

        public final int index[];
        public final Object keys[];
        public final Object values[];

        private static Object[] compact(Object aobj[], int ai[])
        {
            int i = aobj.length;
            Object aobj1[] = (Object[])(Object[])Array.newInstance(((Object) (aobj)).getClass().getComponentType(), 1 + GridLayout.max2(ai, -1));
            for (int j = 0; j < i; j++)
                aobj1[ai[j]] = aobj[j];

            return aobj1;
        }

        private static int[] createIndex(Object aobj[])
        {
            int i = aobj.length;
            int ai[] = new int[i];
            HashMap hashmap = new HashMap();
            for (int j = 0; j < i; j++)
            {
                Object obj = aobj[j];
                Integer integer = (Integer)hashmap.get(obj);
                if (integer == null)
                {
                    integer = Integer.valueOf(hashmap.size());
                    hashmap.put(obj, integer);
                }
                ai[j] = integer.intValue();
            }

            return ai;
        }

        public Object getValue(int i)
        {
            return values[index[i]];
        }

        private PackedMap(Object aobj[], Object aobj1[])
        {
            index = createIndex(aobj);
            keys = compact(aobj, index);
            values = compact(aobj1, index);
        }

    }

    public static class Spec
    {

        static final Spec UNDEFINED = GridLayout.spec(0x80000000);
        final Alignment alignment;
        final Interval span;
        final boolean startDefined;

        final Spec copyWriteAlignment(Alignment alignment1)
        {
            return new Spec(startDefined, span, alignment1);
        }

        final Spec copyWriteSpan(Interval interval)
        {
            return new Spec(startDefined, interval, alignment);
        }

        public boolean equals(Object obj)
        {
label0:
            {
                if (this != obj)
                {
                    if (obj == null || getClass() != obj.getClass())
                        break label0;
                    Spec spec1 = (Spec)obj;
                    if (!alignment.equals(spec1.alignment))
                        return false;
                    if (!span.equals(spec1.span))
                        return false;
                }
                return true;
            }
            return false;
        }

        final int getFlexibility()
        {
            return alignment != GridLayout.UNDEFINED_ALIGNMENT ? 2 : 0;
        }

        public int hashCode()
        {
            return 31 * span.hashCode() + alignment.hashCode();
        }


        private Spec(boolean flag, int i, int j, Alignment alignment1)
        {
            this(flag, new Interval(i, i + j), alignment1);
        }


        private Spec(boolean flag, Interval interval, Alignment alignment1)
        {
            startDefined = flag;
            span = interval;
            alignment = alignment1;
        }
    }


    private static final int ALIGNMENT_MODE = 6;
    public static final int ALIGN_BOUNDS = 0;
    public static final int ALIGN_MARGINS = 1;
    public static final Alignment BASELINE = new Alignment() {

        public int getAlignmentValue(View view, int i, int j)
        {
            int k = view.getBaseline();
            if (k == -1)
                k = 0x80000000;
            else
            if (j == 1)
                return k - view.getOpticalInsets().top;
            return k;
        }

        public Bounds getBounds()
        {
            return new Bounds() {

                private int size;
                final _cls6 this$0;

                protected int getOffset(GridLayout gridlayout, View view, Alignment alignment, int i, boolean flag)
                {
                    return Math.max(0, super.getOffset(gridlayout, view, alignment, i, flag));
                }

                protected void include(int i, int j)
                {
                    super.include(i, j);
                    size = Math.max(size, i + j);
                }

                protected void reset()
                {
                    super.reset();
                    size = 0x80000000;
                }

                protected int size(boolean flag)
                {
                    return Math.max(super.size(flag), size);
                }

            
            {
                this$0 = _cls6.this;
                super();
            }
            }
;
        }

        int getGravityOffset(View view, int i)
        {
            return 0;
        }

    }
;
    public static final Alignment BOTTOM;
    private static final int CAN_STRETCH = 2;
    public static final Alignment CENTER = new Alignment() {

        public int getAlignmentValue(View view, int i, int j)
        {
            return i >> 1;
        }

        int getGravityOffset(View view, int i)
        {
            return i >> 1;
        }

    }
;
    private static final int COLUMN_COUNT = 3;
    private static final int COLUMN_ORDER_PRESERVED = 4;
    private static final int DEFAULT_ALIGNMENT_MODE = 1;
    static final int DEFAULT_CONTAINER_MARGIN = 0;
    private static final int DEFAULT_COUNT = 0x80000000;
    private static final boolean DEFAULT_ORDER_PRESERVED = true;
    private static final int DEFAULT_ORIENTATION = 0;
    private static final boolean DEFAULT_USE_DEFAULT_MARGINS = false;
    public static final Alignment END;
    public static final Alignment FILL = new Alignment() {

        public int getAlignmentValue(View view, int i, int j)
        {
            return 0x80000000;
        }

        int getGravityOffset(View view, int i)
        {
            return 0;
        }

        public int getSizeInCell(View view, int i, int j)
        {
            return j;
        }

    }
;
    public static final int HORIZONTAL = 0;
    private static final int INFLEXIBLE = 0;
    private static final Alignment LEADING;
    public static final Alignment LEFT;
    static final int MAX_SIZE = 0x186a0;
    private static final int ORIENTATION = 0;
    public static final Alignment RIGHT;
    private static final int ROW_COUNT = 1;
    private static final int ROW_ORDER_PRESERVED = 2;
    public static final Alignment START;
    static final String TAG = android/widget/GridLayout.getName();
    public static final Alignment TOP;
    private static final Alignment TRAILING;
    public static final int UNDEFINED = 0x80000000;
    static final Alignment UNDEFINED_ALIGNMENT = new Alignment() {

        public int getAlignmentValue(View view, int i, int j)
        {
            return 0x80000000;
        }

        int getGravityOffset(View view, int i)
        {
            return 0x80000000;
        }

    }
;
    static final int UNINITIALIZED_HASH = 0;
    private static final int USE_DEFAULT_MARGINS = 5;
    public static final int VERTICAL = 1;
    int alignmentMode;
    int defaultGap;
    final Axis horizontalAxis;
    int lastLayoutParamsHashCode;
    int orientation;
    boolean useDefaultMargins;
    final Axis verticalAxis;

    public GridLayout(Context context)
    {
        this(context, null);
    }

    public GridLayout(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public GridLayout(Context context, AttributeSet attributeset, int i)
    {
        TypedArray typedarray;
        super(context, attributeset, i);
        horizontalAxis = new Axis(true);
        verticalAxis = new Axis(false);
        orientation = 0;
        useDefaultMargins = false;
        alignmentMode = 1;
        lastLayoutParamsHashCode = 0;
        defaultGap = context.getResources().getDimensionPixelOffset(0x1050048);
        typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.GridLayout);
        setRowCount(typedarray.getInt(1, 0x80000000));
        setColumnCount(typedarray.getInt(3, 0x80000000));
        setOrientation(typedarray.getInt(0, 0));
        setUseDefaultMargins(typedarray.getBoolean(5, false));
        setAlignmentMode(typedarray.getInt(6, 1));
        setRowOrderPreserved(typedarray.getBoolean(2, true));
        setColumnOrderPreserved(typedarray.getBoolean(4, true));
        typedarray.recycle();
        return;
        Exception exception;
        exception;
        typedarray.recycle();
        throw exception;
    }

    static Object[] append(Object aobj[], Object aobj1[])
    {
        Object aobj2[] = (Object[])(Object[])Array.newInstance(((Object) (aobj)).getClass().getComponentType(), aobj.length + aobj1.length);
        System.arraycopy(((Object) (aobj)), 0, ((Object) (aobj2)), 0, aobj.length);
        System.arraycopy(((Object) (aobj1)), 0, ((Object) (aobj2)), aobj.length, aobj1.length);
        return aobj2;
    }

    static boolean canStretch(int i)
    {
        return (i & 2) != 0;
    }

    private void checkLayoutParams(LayoutParams layoutparams, boolean flag)
    {
        String s;
        if (flag)
            s = "column";
        else
            s = "row";
        Spec spec1;
        if (flag)
            spec1 = layoutparams.columnSpec;
        else
            spec1 = layoutparams.rowSpec;
        Interval interval = spec1.span;
        if (interval.min != 0x80000000 && interval.min < 0)
            handleInvalidParams((new StringBuilder()).append(s).append(" indices must be positive").toString());
        Axis axis;
        if (flag)
            axis = horizontalAxis;
        else
            axis = verticalAxis;
        int i = axis.definedCount;
        if (i != 0x80000000)
        {
            if (interval.max > i)
                handleInvalidParams((new StringBuilder()).append(s).append(" indices (start + span) mustn't exceed the ").append(s).append(" count").toString());
            if (interval.size() > i)
                handleInvalidParams((new StringBuilder()).append(s).append(" span mustn't exceed the ").append(s).append(" count").toString());
        }
    }

    private static int clip(Interval interval, boolean flag, int i)
    {
        int j = interval.size();
        if (i == 0)
            return j;
        int k;
        if (flag)
            k = Math.min(interval.min, i);
        else
            k = 0;
        return Math.min(j, i - k);
    }

    private int computeLayoutParamsHashCode()
    {
        int i = 1;
        int j = 0;
        for (int k = getChildCount(); j < k; j++)
        {
            View view = getChildAt(j);
            if (view.getVisibility() != 8)
            {
                LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
                i = i * 31 + layoutparams.hashCode();
            }
        }

        return i;
    }

    private void consistencyCheck()
    {
        if (lastLayoutParamsHashCode == 0)
        {
            validateLayoutParams();
            lastLayoutParamsHashCode = computeLayoutParamsHashCode();
        } else
        if (lastLayoutParamsHashCode != computeLayoutParamsHashCode())
        {
            Log.w(TAG, "The fields of some layout parameters were modified in between layout operations. Check the javadoc for GridLayout.LayoutParams#rowSpec.");
            invalidateStructure();
            consistencyCheck();
            return;
        }
    }

    private static Alignment createSwitchingAlignment(Alignment alignment, Alignment alignment1)
    {
        return new Alignment(alignment, alignment1) {

            final Alignment val$ltr;
            final Alignment val$rtl;

            public int getAlignmentValue(View view, int i, int j)
            {
                Alignment alignment2;
                if (!view.isLayoutRtl())
                    alignment2 = ltr;
                else
                    alignment2 = rtl;
                return alignment2.getAlignmentValue(view, i, j);
            }

            int getGravityOffset(View view, int i)
            {
                Alignment alignment2;
                if (!view.isLayoutRtl())
                    alignment2 = ltr;
                else
                    alignment2 = rtl;
                return alignment2.getGravityOffset(view, i);
            }

            
            {
                ltr = alignment;
                rtl = alignment1;
                super();
            }
        }
;
    }

    private void drawLine(Canvas canvas, int i, int j, int k, int l, Paint paint)
    {
        int i1 = getPaddingLeft();
        int j1 = getPaddingTop();
        if (isLayoutRtl())
        {
            int k1 = getWidth();
            canvas.drawLine(k1 - i1 - i, j1 + j, k1 - i1 - k, j1 + l, paint);
            return;
        } else
        {
            canvas.drawLine(i1 + i, j1 + j, i1 + k, j1 + l, paint);
            return;
        }
    }

    private static boolean fits(int ai[], int i, int j, int k)
    {
label0:
        {
            if (k <= ai.length)
            {
                int l = j;
                do
                {
                    if (l >= k)
                        break label0;
                    if (ai[l] > i)
                        break;
                    l++;
                } while (true);
            }
            return false;
        }
        return true;
    }

    static Alignment getAlignment(int i, boolean flag)
    {
        byte byte0;
        if (flag)
            byte0 = 7;
        else
            byte0 = 112;
        byte byte1;
        if (flag)
            byte1 = 0;
        else
            byte1 = 4;
        switch ((i & byte0) >> byte1)
        {
        case 8388613: 
            return END;

        case 8388611: 
            return START;

        case 1: // '\001'
            return CENTER;

        case 7: // '\007'
            return FILL;

        case 5: // '\005'
            if (flag)
                return RIGHT;
            else
                return BOTTOM;

        case 3: // '\003'
            if (flag)
                return LEFT;
            else
                return TOP;
        }
        return UNDEFINED_ALIGNMENT;
    }

    private int getDefaultMargin(View view, LayoutParams layoutparams, boolean flag, boolean flag1)
    {
        boolean flag2 = true;
        if (!useDefaultMargins)
            return 0;
        Spec spec1;
        if (flag)
            spec1 = layoutparams.columnSpec;
        else
            spec1 = layoutparams.rowSpec;
        Axis axis;
        if (flag)
            axis = horizontalAxis;
        else
            axis = verticalAxis;
        Interval interval = spec1.span;
        boolean flag3;
        if (flag && isLayoutRtl())
        {
            if (!flag1)
                flag3 = flag2;
            else
                flag3 = false;
        } else
        {
            flag3 = flag1;
        }
        if (flag3)
        {
            if (interval.min != 0)
                flag2 = false;
        } else
        if (interval.max != axis.getCount())
            flag2 = false;
        return getDefaultMargin(view, flag2, flag, flag1);
    }

    private int getDefaultMargin(View view, boolean flag, boolean flag1)
    {
        if (view.getClass() == android/widget/Space)
            return 0;
        else
            return defaultGap / 2;
    }

    private int getDefaultMargin(View view, boolean flag, boolean flag1, boolean flag2)
    {
        if (flag)
            return 0;
        else
            return getDefaultMargin(view, flag1, flag2);
    }

    private int getMargin(View view, boolean flag, boolean flag1)
    {
        if (alignmentMode == 1)
            return getMargin1(view, flag, flag1);
        Axis axis;
        if (flag)
            axis = horizontalAxis;
        else
            axis = verticalAxis;
        int ai[];
        if (flag1)
            ai = axis.getLeadingMargins();
        else
            ai = axis.getTrailingMargins();
        LayoutParams layoutparams = getLayoutParams(view);
        Spec spec1;
        if (flag)
            spec1 = layoutparams.columnSpec;
        else
            spec1 = layoutparams.rowSpec;
        int i;
        if (flag1)
            i = spec1.span.min;
        else
            i = spec1.span.max;
        return ai[i];
    }

    private int getMeasurement(View view, boolean flag)
    {
        int i;
        if (flag)
            i = view.getMeasuredWidth();
        else
            i = view.getMeasuredHeight();
        if (getLayoutMode() == 1)
        {
            Insets insets = view.getOpticalInsets();
            int j;
            if (flag)
                j = insets.left + insets.right;
            else
                j = insets.top + insets.bottom;
            i -= j;
        }
        return i;
    }

    private int getTotalMargin(View view, boolean flag)
    {
        return getMargin(view, flag, true) + getMargin(view, flag, false);
    }

    private static void handleInvalidParams(String s)
    {
        throw new IllegalArgumentException((new StringBuilder()).append(s).append(". ").toString());
    }

    private void invalidateStructure()
    {
        lastLayoutParamsHashCode = 0;
        horizontalAxis.invalidateStructure();
        verticalAxis.invalidateStructure();
        invalidateValues();
    }

    private void invalidateValues()
    {
        if (horizontalAxis != null && verticalAxis != null)
        {
            horizontalAxis.invalidateValues();
            verticalAxis.invalidateValues();
        }
    }

    static int max2(int ai[], int i)
    {
        int j = i;
        int k = 0;
        for (int l = ai.length; k < l; k++)
            j = Math.max(j, ai[k]);

        return j;
    }

    private void measureChildWithMargins2(View view, int i, int j, int k, int l)
    {
        view.measure(getChildMeasureSpec(i, super.mPaddingLeft + super.mPaddingRight + getTotalMargin(view, true), k), getChildMeasureSpec(j, super.mPaddingTop + super.mPaddingBottom + getTotalMargin(view, false), l));
    }

    private void measureChildrenWithMargins(int i, int j, boolean flag)
    {
        int k = 0;
        for (int l = getChildCount(); k < l; k++)
        {
            View view = getChildAt(k);
            if (view.getVisibility() == 8)
                continue;
            LayoutParams layoutparams = getLayoutParams(view);
            if (flag)
            {
                measureChildWithMargins2(view, i, j, ((android.view.ViewGroup.LayoutParams) (layoutparams)).width, ((android.view.ViewGroup.LayoutParams) (layoutparams)).height);
                continue;
            }
            boolean flag1;
            if (orientation == 0)
                flag1 = true;
            else
                flag1 = false;
            Spec spec1;
            if (flag1)
                spec1 = layoutparams.columnSpec;
            else
                spec1 = layoutparams.rowSpec;
            if (spec1.alignment != FILL)
                continue;
            Interval interval = spec1.span;
            Axis axis;
            if (flag1)
                axis = horizontalAxis;
            else
                axis = verticalAxis;
            int ai[] = axis.getLocations();
            int i1 = ai[interval.max] - ai[interval.min] - getTotalMargin(view, flag1);
            if (flag1)
                measureChildWithMargins2(view, i, j, i1, ((android.view.ViewGroup.LayoutParams) (layoutparams)).height);
            else
                measureChildWithMargins2(view, i, j, ((android.view.ViewGroup.LayoutParams) (layoutparams)).width, i1);
        }

    }

    private static void procrusteanFill(int ai[], int i, int j, int k)
    {
        int l = ai.length;
        Arrays.fill(ai, Math.min(i, l), Math.min(j, l), k);
    }

    private static void setCellGroup(LayoutParams layoutparams, int i, int j, int k, int l)
    {
        layoutparams.setRowSpecSpan(new Interval(i, i + j));
        layoutparams.setColumnSpecSpan(new Interval(k, k + l));
    }

    public static Spec spec(int i)
    {
        return spec(i, 1);
    }

    public static Spec spec(int i, int j)
    {
        return spec(i, j, UNDEFINED_ALIGNMENT);
    }

    public static Spec spec(int i, int j, Alignment alignment)
    {
        boolean flag;
        if (i != 0x80000000)
            flag = true;
        else
            flag = false;
        return new Spec(flag, i, j, alignment);
    }

    public static Spec spec(int i, Alignment alignment)
    {
        return spec(i, 1, alignment);
    }

    private void validateLayoutParams()
    {
        boolean flag;
        if (orientation == 0)
            flag = true;
        else
            flag = false;
        Axis axis;
        if (flag)
            axis = horizontalAxis;
        else
            axis = verticalAxis;
        int i;
        if (axis.definedCount != 0x80000000)
            i = axis.definedCount;
        else
            i = 0;
        int j = 0;
        int k = 0;
        int ai[] = new int[i];
        int l = 0;
        for (int i1 = getChildCount(); l < i1; l++)
        {
            LayoutParams layoutparams = (LayoutParams)getChildAt(l).getLayoutParams();
            Spec spec1;
            if (flag)
                spec1 = layoutparams.rowSpec;
            else
                spec1 = layoutparams.columnSpec;
            Interval interval = spec1.span;
            boolean flag1 = spec1.startDefined;
            int j1 = interval.size();
            if (flag1)
                j = interval.min;
            Spec spec2;
            if (flag)
                spec2 = layoutparams.columnSpec;
            else
                spec2 = layoutparams.rowSpec;
            Interval interval1 = spec2.span;
            boolean flag2 = spec2.startDefined;
            int k1 = clip(interval1, flag2, i);
            if (flag2)
                k = interval1.min;
            if (i != 0)
            {
                if (!flag1 || !flag2)
                    while (!fits(ai, j, k, k + k1)) 
                        if (flag2)
                            j++;
                        else
                        if (k + k1 <= i)
                        {
                            k++;
                        } else
                        {
                            j++;
                            k = 0;
                        }
                procrusteanFill(ai, k, k + k1, j + j1);
            }
            if (flag)
                setCellGroup(layoutparams, j, j1, k, k1);
            else
                setCellGroup(layoutparams, k, k1, j, j1);
            k += k1;
        }

    }

    protected boolean checkLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        if (!(layoutparams instanceof LayoutParams))
        {
            return false;
        } else
        {
            LayoutParams layoutparams1 = (LayoutParams)layoutparams;
            checkLayoutParams(layoutparams1, true);
            checkLayoutParams(layoutparams1, false);
            return true;
        }
    }

    protected volatile android.view.ViewGroup.LayoutParams generateDefaultLayoutParams()
    {
        return generateDefaultLayoutParams();
    }

    protected LayoutParams generateDefaultLayoutParams()
    {
        return new LayoutParams();
    }

    public volatile android.view.ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return generateLayoutParams(attributeset);
    }

    protected volatile android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return generateLayoutParams(layoutparams);
    }

    public LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return new LayoutParams(getContext(), attributeset);
    }

    protected LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return new LayoutParams(layoutparams);
    }

    final Alignment getAlignment(Alignment alignment, boolean flag)
    {
        if (alignment != UNDEFINED_ALIGNMENT)
            return alignment;
        if (flag)
            return START;
        else
            return BASELINE;
    }

    public int getAlignmentMode()
    {
        return alignmentMode;
    }

    public int getColumnCount()
    {
        return horizontalAxis.getCount();
    }

    final LayoutParams getLayoutParams(View view)
    {
        return (LayoutParams)view.getLayoutParams();
    }

    int getMargin1(View view, boolean flag, boolean flag1)
    {
        LayoutParams layoutparams = getLayoutParams(view);
        int i;
        if (flag)
        {
            if (flag1)
                i = ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin;
            else
                i = ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin;
        } else
        if (flag1)
            i = ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin;
        else
            i = ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).bottomMargin;
        if (i == 0x80000000)
            i = getDefaultMargin(view, layoutparams, flag, flag1);
        return i;
    }

    final int getMeasurementIncludingMargin(View view, boolean flag)
    {
        if (view.getVisibility() == 8)
            return 0;
        else
            return getMeasurement(view, flag) + getTotalMargin(view, flag);
    }

    public int getOrientation()
    {
        return orientation;
    }

    public int getRowCount()
    {
        return verticalAxis.getCount();
    }

    public boolean getUseDefaultMargins()
    {
        return useDefaultMargins;
    }

    public boolean isColumnOrderPreserved()
    {
        return horizontalAxis.isOrderPreserved();
    }

    public boolean isRowOrderPreserved()
    {
        return verticalAxis.isOrderPreserved();
    }

    protected void onChildVisibilityChanged(View view, int i, int j)
    {
        super.onChildVisibilityChanged(view, i, j);
        if (i == 8 || j == 8)
            invalidateStructure();
    }

    protected void onDebugDraw(Canvas canvas)
    {
        int i = getHeight() - getPaddingTop() - getPaddingBottom();
        int j = getWidth() - getPaddingLeft() - getPaddingRight();
        Paint paint = new Paint();
        paint.setStyle(android.graphics.Paint.Style.STROKE);
        paint.setColor(Color.argb(50, 255, 255, 255));
        int ai[] = horizontalAxis.locations;
        if (ai != null)
        {
            int j1 = 0;
            for (int k1 = ai.length; j1 < k1; j1++)
            {
                int l1 = ai[j1];
                drawLine(canvas, l1, 0, l1, i - 1, paint);
            }

        }
        int ai1[] = verticalAxis.locations;
        if (ai1 != null)
        {
            int k = 0;
            for (int l = ai1.length; k < l; k++)
            {
                int i1 = ai1[k];
                drawLine(canvas, 0, i1, j - 1, i1, paint);
            }

        }
        super.onDebugDraw(canvas);
    }

    protected void onDebugDrawMargins(Canvas canvas)
    {
        LayoutParams layoutparams = new LayoutParams();
        for (int i = 0; i < getChildCount(); i++)
        {
            View view = getChildAt(i);
            Insets insets;
            if (getLayoutMode() == 1)
                insets = view.getOpticalInsets();
            else
                insets = Insets.NONE;
            layoutparams.setMargins(getMargin1(view, true, true) - insets.left, getMargin1(view, false, true) - insets.top, getMargin1(view, true, false) - insets.right, getMargin1(view, false, false) - insets.bottom);
            layoutparams.onDebugDraw(view, canvas);
        }

    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/GridLayout.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/GridLayout.getName());
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        consistencyCheck();
        int i1 = k - i;
        int j1 = l - j;
        int k1 = getPaddingLeft();
        int l1 = getPaddingTop();
        int i2 = getPaddingRight();
        int j2 = getPaddingBottom();
        horizontalAxis.layout(i1 - k1 - i2);
        verticalAxis.layout(j1 - l1 - j2);
        int ai[] = horizontalAxis.getLocations();
        int ai1[] = verticalAxis.getLocations();
        int k2 = 0;
        for (int l2 = getChildCount(); k2 < l2; k2++)
        {
            View view;
            int k7;
            int l7;
            int j8;
            int k8;
label0:
            {
                view = getChildAt(k2);
                if (view.getVisibility() == 8)
                    continue;
                LayoutParams layoutparams = getLayoutParams(view);
                Spec spec1 = layoutparams.columnSpec;
                Spec spec2 = layoutparams.rowSpec;
                Interval interval = spec1.span;
                Interval interval1 = spec2.span;
                int i3 = ai[interval.min];
                int j3 = ai1[interval1.min];
                int k3 = ai[interval.max];
                int l3 = ai1[interval1.max];
                int i4 = k3 - i3;
                int j4 = l3 - j3;
                int k4 = getMeasurement(view, true);
                int l4 = getMeasurement(view, false);
                Alignment alignment = getAlignment(spec1.alignment, true);
                Alignment alignment1 = getAlignment(spec2.alignment, false);
                Bounds bounds = (Bounds)horizontalAxis.getGroupBounds().getValue(k2);
                Bounds bounds1 = (Bounds)verticalAxis.getGroupBounds().getValue(k2);
                int i5 = alignment.getGravityOffset(view, i4 - bounds.size(true));
                int j5 = alignment1.getGravityOffset(view, j4 - bounds1.size(true));
                int k5 = getMargin(view, true, true);
                int l5 = getMargin(view, false, true);
                int i6 = getMargin(view, true, false);
                int j6 = getMargin(view, false, false);
                int k6 = k5 + i6;
                int l6 = l5 + j6;
                int i7 = bounds.getOffset(this, view, alignment, k4 + k6, true);
                int j7 = bounds1.getOffset(this, view, alignment1, l4 + l6, false);
                k7 = alignment.getSizeInCell(view, k4, i4 - k6);
                l7 = alignment1.getSizeInCell(view, l4, j4 - l6);
                int i8 = i7 + (i3 + i5);
                if (!isLayoutRtl())
                    j8 = i8 + (k1 + k5);
                else
                    j8 = i1 - k7 - i2 - i6 - i8;
                k8 = l5 + (j7 + (j5 + (l1 + j3)));
                boolean flag1;
                if (getLayoutMode() == 1)
                    flag1 = true;
                else
                    flag1 = false;
                if (flag1)
                {
                    Insets insets = view.getOpticalInsets();
                    j8 -= insets.left;
                    k8 -= insets.top;
                    k7 += insets.left + insets.right;
                    l7 += insets.top + insets.bottom;
                }
                int l8 = view.getMeasuredWidth();
                if (k7 == l8)
                {
                    int k9 = view.getMeasuredHeight();
                    if (l7 == k9)
                        break label0;
                }
                view.measure(android.view.View.MeasureSpec.makeMeasureSpec(k7, 0x40000000), android.view.View.MeasureSpec.makeMeasureSpec(l7, 0x40000000));
            }
            int i9 = j8 + k7;
            int j9 = k8 + l7;
            view.layout(j8, k8, i9, j9);
        }

    }

    protected void onMeasure(int i, int j)
    {
        consistencyCheck();
        invalidateValues();
        measureChildrenWithMargins(i, j, true);
        int k;
        int l;
        if (orientation == 0)
        {
            l = horizontalAxis.getMeasure(i);
            measureChildrenWithMargins(i, j, false);
            k = verticalAxis.getMeasure(j);
        } else
        {
            k = verticalAxis.getMeasure(j);
            measureChildrenWithMargins(i, j, false);
            l = horizontalAxis.getMeasure(i);
        }
        int i1 = getPaddingLeft() + getPaddingRight();
        int j1 = getPaddingTop() + getPaddingBottom();
        int k1 = Math.max(i1 + l, getSuggestedMinimumWidth());
        int l1 = Math.max(j1 + k, getSuggestedMinimumHeight());
        setMeasuredDimension(resolveSizeAndState(k1, i, 0), resolveSizeAndState(l1, j, 0));
    }

    protected void onSetLayoutParams(View view, android.view.ViewGroup.LayoutParams layoutparams)
    {
        super.onSetLayoutParams(view, layoutparams);
        if (!checkLayoutParams(layoutparams))
            handleInvalidParams("supplied LayoutParams are of the wrong type");
        invalidateStructure();
    }

    protected void onViewAdded(View view)
    {
        super.onViewAdded(view);
        invalidateStructure();
    }

    protected void onViewRemoved(View view)
    {
        super.onViewRemoved(view);
        invalidateStructure();
    }

    public void requestLayout()
    {
        super.requestLayout();
        invalidateValues();
    }

    public void setAlignmentMode(int i)
    {
        alignmentMode = i;
        requestLayout();
    }

    public void setColumnCount(int i)
    {
        horizontalAxis.setCount(i);
        invalidateStructure();
        requestLayout();
    }

    public void setColumnOrderPreserved(boolean flag)
    {
        horizontalAxis.setOrderPreserved(flag);
        invalidateStructure();
        requestLayout();
    }

    public void setOrientation(int i)
    {
        if (orientation != i)
        {
            orientation = i;
            invalidateStructure();
            requestLayout();
        }
    }

    public void setRowCount(int i)
    {
        verticalAxis.setCount(i);
        invalidateStructure();
        requestLayout();
    }

    public void setRowOrderPreserved(boolean flag)
    {
        verticalAxis.setOrderPreserved(flag);
        invalidateStructure();
        requestLayout();
    }

    public void setUseDefaultMargins(boolean flag)
    {
        useDefaultMargins = flag;
        requestLayout();
    }

    static 
    {
        LEADING = new Alignment() {

            public int getAlignmentValue(View view, int i, int j)
            {
                return 0;
            }

            int getGravityOffset(View view, int i)
            {
                return 0;
            }

        }
;
        TRAILING = new Alignment() {

            public int getAlignmentValue(View view, int i, int j)
            {
                return i;
            }

            int getGravityOffset(View view, int i)
            {
                return i;
            }

        }
;
        TOP = LEADING;
        BOTTOM = TRAILING;
        START = LEADING;
        END = TRAILING;
        LEFT = createSwitchingAlignment(START, END);
        RIGHT = createSwitchingAlignment(END, START);
    }

}
