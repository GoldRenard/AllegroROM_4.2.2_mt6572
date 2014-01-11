// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableList, Iterators, ObjectArrays, Collections2, 
//            UnmodifiableIterator, UnmodifiableListIterator, AbstractIndexedListIterator

class RegularImmutableList extends ImmutableList
{

    private final transient Object array[];
    private final transient int offset;
    private final transient int size;

    RegularImmutableList(Object aobj[])
    {
        this(aobj, 0, aobj.length);
    }

    RegularImmutableList(Object aobj[], int i, int j)
    {
        offset = i;
        size = j;
        array = aobj;
    }

    public boolean contains(Object obj)
    {
        return indexOf(obj) != -1;
    }

    public boolean equals(Object obj)
    {
        if (obj != this)
        {
            if (!(obj instanceof List))
                return false;
            List list = (List)obj;
            if (size() != list.size())
                return false;
            int i = offset;
            if (obj instanceof RegularImmutableList)
            {
                RegularImmutableList regularimmutablelist = (RegularImmutableList)obj;
                for (int k = regularimmutablelist.offset; k < regularimmutablelist.offset + regularimmutablelist.size;)
                {
                    Object aobj1[] = array;
                    int l = i + 1;
                    if (!aobj1[i].equals(regularimmutablelist.array[k]))
                        return false;
                    k++;
                    i = l;
                }

            } else
            {
                for (Iterator iterator1 = list.iterator(); iterator1.hasNext();)
                {
                    Object obj1 = iterator1.next();
                    Object aobj[] = array;
                    int j = i + 1;
                    if (!aobj[i].equals(obj1))
                        return false;
                    i = j;
                }

            }
        }
        return true;
    }

    public Object get(int i)
    {
        Preconditions.checkElementIndex(i, size);
        return array[i + offset];
    }

    public int hashCode()
    {
        int i = 1;
        for (int j = offset; j < offset + size; j++)
            i = i * 31 + array[j].hashCode();

        return i;
    }

    public int indexOf(Object obj)
    {
        if (obj != null)
        {
            for (int i = offset; i < offset + size; i++)
                if (array[i].equals(obj))
                    return i - offset;

        }
        return -1;
    }

    public boolean isEmpty()
    {
        return false;
    }

    boolean isPartialView()
    {
        return offset != 0 || size != array.length;
    }

    public UnmodifiableIterator iterator()
    {
        return Iterators.forArray(array, offset, size);
    }

    public volatile Iterator iterator()
    {
        return iterator();
    }

    public int lastIndexOf(Object obj)
    {
        if (obj != null)
        {
            for (int i = -1 + (offset + size); i >= offset; i--)
                if (array[i].equals(obj))
                    return i - offset;

        }
        return -1;
    }

    public UnmodifiableListIterator listIterator(int i)
    {
        return new AbstractIndexedListIterator(size, i) {

            final RegularImmutableList this$0;

            protected Object get(int j)
            {
                return array[j + offset];
            }

            
            {
                this$0 = RegularImmutableList.this;
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
        return size;
    }

    public ImmutableList subList(int i, int j)
    {
        Preconditions.checkPositionIndexes(i, j, size);
        if (i == j)
            return ImmutableList.of();
        else
            return new RegularImmutableList(array, i + offset, j - i);
    }

    public volatile List subList(int i, int j)
    {
        return subList(i, j);
    }

    public Object[] toArray()
    {
        Object aobj[] = new Object[size()];
        System.arraycopy(((Object) (array)), offset, ((Object) (aobj)), 0, size);
        return aobj;
    }

    public Object[] toArray(Object aobj[])
    {
        if (aobj.length < size)
            aobj = ObjectArrays.newArray(aobj, size);
        else
        if (aobj.length > size)
            aobj[size] = null;
        System.arraycopy(((Object) (array)), offset, ((Object) (aobj)), 0, size);
        return aobj;
    }

    public String toString()
    {
        StringBuilder stringbuilder = Collections2.newStringBuilderForCollection(size()).append('[').append(array[offset]);
        for (int i = 1 + offset; i < offset + size; i++)
            stringbuilder.append(", ").append(array[i]);

        return stringbuilder.append(']').toString();
    }


}
