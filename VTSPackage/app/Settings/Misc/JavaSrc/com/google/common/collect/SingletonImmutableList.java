// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableList, Iterators, ObjectArrays, UnmodifiableIterator, 
//            UnmodifiableListIterator

final class SingletonImmutableList extends ImmutableList
{

    final transient Object element;

    SingletonImmutableList(Object obj)
    {
        element = Preconditions.checkNotNull(obj);
    }

    public boolean contains(Object obj)
    {
        return element.equals(obj);
    }

    public boolean equals(Object obj)
    {
label0:
        {
            if (obj != this)
            {
                if (!(obj instanceof List))
                    break label0;
                List list = (List)obj;
                if (list.size() != 1 || !element.equals(list.get(0)))
                    return false;
            }
            return true;
        }
        return false;
    }

    public Object get(int i)
    {
        Preconditions.checkElementIndex(i, 1);
        return element;
    }

    public int hashCode()
    {
        return 31 + element.hashCode();
    }

    public int indexOf(Object obj)
    {
        return !element.equals(obj) ? -1 : 0;
    }

    public boolean isEmpty()
    {
        return false;
    }

    boolean isPartialView()
    {
        return false;
    }

    public UnmodifiableIterator iterator()
    {
        return Iterators.singletonIterator(element);
    }

    public volatile Iterator iterator()
    {
        return iterator();
    }

    public int lastIndexOf(Object obj)
    {
        return !element.equals(obj) ? -1 : 0;
    }

    public UnmodifiableListIterator listIterator(final int start)
    {
        Preconditions.checkPositionIndex(start, 1);
        return new UnmodifiableListIterator() {

            boolean hasNext;
            final SingletonImmutableList this$0;
            final int val$start;

            public boolean hasNext()
            {
                return hasNext;
            }

            public boolean hasPrevious()
            {
                return !hasNext;
            }

            public Object next()
            {
                if (!hasNext)
                {
                    throw new NoSuchElementException();
                } else
                {
                    hasNext = false;
                    return element;
                }
            }

            public int nextIndex()
            {
                return !hasNext ? 1 : 0;
            }

            public Object previous()
            {
                if (hasNext)
                {
                    throw new NoSuchElementException();
                } else
                {
                    hasNext = true;
                    return element;
                }
            }

            public int previousIndex()
            {
                return !hasNext ? 0 : -1;
            }

            
            {
                this$0 = SingletonImmutableList.this;
                start = i;
                super();
                boolean flag;
                if (start == 0)
                    flag = true;
                else
                    flag = false;
                hasNext = flag;
            }
        }
;
    }

    public volatile ListIterator listIterator(int i)
    {
        return listIterator(i);
    }

    public ImmutableList reverse()
    {
        return this;
    }

    public int size()
    {
        return 1;
    }

    public ImmutableList subList(int i, int j)
    {
        Preconditions.checkPositionIndexes(i, j, 1);
        if (i == j)
            this = ImmutableList.of();
        return this;
    }

    public volatile List subList(int i, int j)
    {
        return subList(i, j);
    }

    public Object[] toArray()
    {
        Object aobj[] = new Object[1];
        aobj[0] = element;
        return aobj;
    }

    public Object[] toArray(Object aobj[])
    {
        if (aobj.length == 0)
            aobj = ObjectArrays.newArray(aobj, 1);
        else
        if (aobj.length > 1)
            aobj[1] = null;
        aobj[0] = element;
        return aobj;
    }

    public String toString()
    {
        String s = element.toString();
        return (new StringBuilder(2 + s.length())).append('[').append(s).append(']').toString();
    }
}
