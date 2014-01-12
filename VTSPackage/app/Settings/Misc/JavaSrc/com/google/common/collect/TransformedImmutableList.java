// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableList, Iterators, ObjectArrays, UnmodifiableListIterator, 
//            AbstractIndexedListIterator

abstract class TransformedImmutableList extends ImmutableList
{
    private class TransformedView extends TransformedImmutableList
    {

        final TransformedImmutableList this$0;

        public volatile ListIterator listIterator(int i)
        {
            return listIterator(i);
        }

        public volatile List subList(int i, int j)
        {
            return subList(i, j);
        }

        Object transform(Object obj)
        {
            return TransformedImmutableList.this.transform(obj);
        }

        TransformedView(ImmutableList immutablelist)
        {
            this$0 = TransformedImmutableList.this;
            super(immutablelist);
        }
    }


    private final transient ImmutableList backingList;

    TransformedImmutableList(ImmutableList immutablelist)
    {
        backingList = (ImmutableList)Preconditions.checkNotNull(immutablelist);
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
                if (size() != list.size() || !Iterators.elementsEqual(iterator(), list.iterator()))
                    return false;
            }
            return true;
        }
        return false;
    }

    public Object get(int i)
    {
        return transform(backingList.get(i));
    }

    public int hashCode()
    {
        int i = 1;
        for (Iterator iterator = iterator(); iterator.hasNext();)
        {
            Object obj = iterator.next();
            int j = i * 31;
            int k;
            if (obj == null)
                k = 0;
            else
                k = obj.hashCode();
            i = j + k;
        }

        return i;
    }

    public int indexOf(Object obj)
    {
label0:
        {
            int i;
            if (obj == null)
            {
                i = -1;
            } else
            {
                i = 0;
                do
                {
                    if (i >= size())
                        break label0;
                    if (get(i).equals(obj))
                        break;
                    i++;
                } while (true);
            }
            return i;
        }
        return -1;
    }

    boolean isPartialView()
    {
        return true;
    }

    public int lastIndexOf(Object obj)
    {
label0:
        {
            int i;
            if (obj == null)
            {
                i = -1;
            } else
            {
                i = -1 + size();
                do
                {
                    if (i < 0)
                        break label0;
                    if (get(i).equals(obj))
                        break;
                    i--;
                } while (true);
            }
            return i;
        }
        return -1;
    }

    public UnmodifiableListIterator listIterator(int i)
    {
        return new AbstractIndexedListIterator(size(), i) {

            final TransformedImmutableList this$0;

            protected Object get(int j)
            {
                return TransformedImmutableList.this.get(j);
            }

            
            {
                this$0 = TransformedImmutableList.this;
                super(i, j);
            }
        }
;
    }

    public volatile ListIterator listIterator(int i)
    {
        return listIterator(i);
    }

    public int size()
    {
        return backingList.size();
    }

    public ImmutableList subList(int i, int j)
    {
        return new TransformedView(backingList.subList(i, j));
    }

    public volatile List subList(int i, int j)
    {
        return subList(i, j);
    }

    public Object[] toArray()
    {
        return ObjectArrays.toArrayImpl(this);
    }

    public Object[] toArray(Object aobj[])
    {
        return ObjectArrays.toArrayImpl(this, aobj);
    }

    abstract Object transform(Object obj);
}
