// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            Ordering, Lists

final class SortedLists
{
    public static abstract class KeyAbsentBehavior extends Enum
    {

        private static final KeyAbsentBehavior $VALUES[];
        public static final KeyAbsentBehavior INVERTED_INSERTION_INDEX;
        public static final KeyAbsentBehavior NEXT_HIGHER;
        public static final KeyAbsentBehavior NEXT_LOWER;

        public static KeyAbsentBehavior valueOf(String s)
        {
            return (KeyAbsentBehavior)Enum.valueOf(com/google/common/collect/SortedLists$KeyAbsentBehavior, s);
        }

        public static KeyAbsentBehavior[] values()
        {
            return (KeyAbsentBehavior[])$VALUES.clone();
        }

        abstract int resultIndex(int i);

        static 
        {
            NEXT_LOWER = new KeyAbsentBehavior("NEXT_LOWER", 0) {

                int resultIndex(int i)
                {
                    return i - 1;
                }

            }
;
            NEXT_HIGHER = new KeyAbsentBehavior("NEXT_HIGHER", 1) {

                public int resultIndex(int i)
                {
                    return i;
                }

            }
;
            INVERTED_INSERTION_INDEX = new KeyAbsentBehavior("INVERTED_INSERTION_INDEX", 2) {

                public int resultIndex(int i)
                {
                    return ~i;
                }

            }
;
            KeyAbsentBehavior akeyabsentbehavior[] = new KeyAbsentBehavior[3];
            akeyabsentbehavior[0] = NEXT_LOWER;
            akeyabsentbehavior[1] = NEXT_HIGHER;
            akeyabsentbehavior[2] = INVERTED_INSERTION_INDEX;
            $VALUES = akeyabsentbehavior;
        }

        private KeyAbsentBehavior(String s, int i)
        {
            super(s, i);
        }

    }

    public static abstract class KeyPresentBehavior extends Enum
    {

        private static final KeyPresentBehavior $VALUES[];
        public static final KeyPresentBehavior ANY_PRESENT;
        public static final KeyPresentBehavior FIRST_AFTER;
        public static final KeyPresentBehavior FIRST_PRESENT;
        public static final KeyPresentBehavior LAST_BEFORE;
        public static final KeyPresentBehavior LAST_PRESENT;

        public static KeyPresentBehavior valueOf(String s)
        {
            return (KeyPresentBehavior)Enum.valueOf(com/google/common/collect/SortedLists$KeyPresentBehavior, s);
        }

        public static KeyPresentBehavior[] values()
        {
            return (KeyPresentBehavior[])$VALUES.clone();
        }

        abstract int resultIndex(Comparator comparator, Object obj, List list, int i);

        static 
        {
            ANY_PRESENT = new KeyPresentBehavior("ANY_PRESENT", 0) {

                int resultIndex(Comparator comparator, Object obj, List list, int i)
                {
                    return i;
                }

            }
;
            LAST_PRESENT = new KeyPresentBehavior("LAST_PRESENT", 1) {

                int resultIndex(Comparator comparator, Object obj, List list, int i)
                {
                    int j = i;
                    for (int k = -1 + list.size(); j < k;)
                    {
                        int l = 1 + (j + k) >>> 1;
                        if (comparator.compare(list.get(l), obj) > 0)
                            k = l - 1;
                        else
                            j = l;
                    }

                    return j;
                }

            }
;
            FIRST_PRESENT = new KeyPresentBehavior("FIRST_PRESENT", 2) {

                int resultIndex(Comparator comparator, Object obj, List list, int i)
                {
                    int j = 0;
                    for (int k = i; j < k;)
                    {
                        int l = j + k >>> 1;
                        if (comparator.compare(list.get(l), obj) < 0)
                            j = l + 1;
                        else
                            k = l;
                    }

                    return j;
                }

            }
;
            FIRST_AFTER = new KeyPresentBehavior("FIRST_AFTER", 3) {

                public int resultIndex(Comparator comparator, Object obj, List list, int i)
                {
                    return 1 + LAST_PRESENT.resultIndex(comparator, obj, list, i);
                }

            }
;
            LAST_BEFORE = new KeyPresentBehavior("LAST_BEFORE", 4) {

                public int resultIndex(Comparator comparator, Object obj, List list, int i)
                {
                    return -1 + FIRST_PRESENT.resultIndex(comparator, obj, list, i);
                }

            }
;
            KeyPresentBehavior akeypresentbehavior[] = new KeyPresentBehavior[5];
            akeypresentbehavior[0] = ANY_PRESENT;
            akeypresentbehavior[1] = LAST_PRESENT;
            akeypresentbehavior[2] = FIRST_PRESENT;
            akeypresentbehavior[3] = FIRST_AFTER;
            akeypresentbehavior[4] = LAST_BEFORE;
            $VALUES = akeypresentbehavior;
        }

        private KeyPresentBehavior(String s, int i)
        {
            super(s, i);
        }

    }


    private SortedLists()
    {
    }

    public static int binarySearch(List list, Function function, Comparable comparable, KeyPresentBehavior keypresentbehavior, KeyAbsentBehavior keyabsentbehavior)
    {
        return binarySearch(list, function, comparable, ((Comparator) (Ordering.natural())), keypresentbehavior, keyabsentbehavior);
    }

    public static int binarySearch(List list, Function function, Object obj, Comparator comparator, KeyPresentBehavior keypresentbehavior, KeyAbsentBehavior keyabsentbehavior)
    {
        return binarySearch(Lists.transform(list, function), obj, comparator, keypresentbehavior, keyabsentbehavior);
    }

    public static int binarySearch(List list, Comparable comparable, KeyPresentBehavior keypresentbehavior, KeyAbsentBehavior keyabsentbehavior)
    {
        Preconditions.checkNotNull(comparable);
        return binarySearch(list, Preconditions.checkNotNull(comparable), ((Comparator) (Ordering.natural())), keypresentbehavior, keyabsentbehavior);
    }

    public static int binarySearch(List list, Object obj, Comparator comparator, KeyPresentBehavior keypresentbehavior, KeyAbsentBehavior keyabsentbehavior)
    {
        Preconditions.checkNotNull(comparator);
        Preconditions.checkNotNull(list);
        Preconditions.checkNotNull(keypresentbehavior);
        Preconditions.checkNotNull(keyabsentbehavior);
        if (!(list instanceof RandomAccess))
            list = Lists.newArrayList(list);
        int i = 0;
        for (int j = -1 + list.size(); i <= j;)
        {
            int k = i + j >>> 1;
            int l = comparator.compare(obj, list.get(k));
            if (l < 0)
                j = k - 1;
            else
            if (l > 0)
                i = k + 1;
            else
                return i + keypresentbehavior.resultIndex(comparator, obj, list.subList(i, j + 1), k - i);
        }

        return keyabsentbehavior.resultIndex(i);
    }
}
