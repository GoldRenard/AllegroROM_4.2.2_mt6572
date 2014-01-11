// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ForwardingSet

public abstract class ForwardingSortedSet extends ForwardingSet
    implements SortedSet
{


    private int unsafeCompare(Object obj, Object obj1)
    {
        Comparator comparator1 = comparator();
        if (comparator1 == null)
            return ((Comparable)obj).compareTo(obj1);
        else
            return comparator1.compare(obj, obj1);
    }

    public Comparator comparator()
    {
        return _mthdelegate().comparator();
    }

    protected volatile Object _mthdelegate()
    {
        return _mthdelegate();
    }

    protected volatile Collection _mthdelegate()
    {
        return _mthdelegate();
    }

    protected volatile Set _mthdelegate()
    {
        return _mthdelegate();
    }

    protected abstract SortedSet _mthdelegate();

    public Object first()
    {
        return _mthdelegate().first();
    }

    public SortedSet headSet(Object obj)
    {
        return _mthdelegate().headSet(obj);
    }

    public Object last()
    {
        return _mthdelegate().last();
    }

    protected boolean standardContains(Object obj)
    {
        int i;
        boolean flag;
        try
        {
            i = unsafeCompare(tailSet(obj).first(), obj);
        }
        catch (ClassCastException classcastexception)
        {
            return false;
        }
        catch (NoSuchElementException nosuchelementexception)
        {
            return false;
        }
        catch (NullPointerException nullpointerexception)
        {
            return false;
        }
        flag = false;
        if (i == 0)
            flag = true;
        return flag;
    }

    protected boolean standardRemove(Object obj)
    {
        Iterator iterator;
        boolean flag;
        boolean flag1;
        int i;
        try
        {
            iterator = tailSet(obj).iterator();
            flag = iterator.hasNext();
        }
        catch (ClassCastException classcastexception)
        {
            return false;
        }
        catch (NullPointerException nullpointerexception)
        {
            return false;
        }
        flag1 = false;
        if (!flag)
            break MISSING_BLOCK_LABEL_63;
        i = unsafeCompare(iterator.next(), obj);
        flag1 = false;
        if (i != 0)
            break MISSING_BLOCK_LABEL_63;
        iterator.remove();
        flag1 = true;
        return flag1;
    }

    protected SortedSet standardSubSet(Object obj, Object obj1)
    {
        return tailSet(obj).headSet(obj1);
    }

    public SortedSet subSet(Object obj, Object obj1)
    {
        return _mthdelegate().subSet(obj, obj1);
    }

    public SortedSet tailSet(Object obj)
    {
        return _mthdelegate().tailSet(obj);
    }
}
