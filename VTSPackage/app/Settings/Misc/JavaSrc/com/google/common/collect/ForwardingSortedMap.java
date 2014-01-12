// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ForwardingMap

public abstract class ForwardingSortedMap extends ForwardingMap
    implements SortedMap
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

    protected volatile Map _mthdelegate()
    {
        return _mthdelegate();
    }

    protected abstract SortedMap _mthdelegate();

    public Object firstKey()
    {
        return _mthdelegate().firstKey();
    }

    public SortedMap headMap(Object obj)
    {
        return _mthdelegate().headMap(obj);
    }

    public Object lastKey()
    {
        return _mthdelegate().lastKey();
    }

    protected boolean standardContainsKey(Object obj)
    {
        int i;
        boolean flag;
        try
        {
            i = unsafeCompare(tailMap(obj).firstKey(), obj);
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

    protected Object standardRemove(Object obj)
    {
label0:
        {
            Object obj1;
            try
            {
                Iterator iterator = tailMap(obj).entrySet().iterator();
                if (!iterator.hasNext())
                    break label0;
                java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
                if (unsafeCompare(entry.getKey(), obj) != 0)
                    break label0;
                obj1 = entry.getValue();
                iterator.remove();
            }
            catch (ClassCastException classcastexception)
            {
                return null;
            }
            catch (NullPointerException nullpointerexception)
            {
                return null;
            }
            return obj1;
        }
        return null;
    }

    protected SortedMap standardSubMap(Object obj, Object obj1)
    {
        return tailMap(obj).headMap(obj1);
    }

    public SortedMap subMap(Object obj, Object obj1)
    {
        return _mthdelegate().subMap(obj, obj1);
    }

    public SortedMap tailMap(Object obj)
    {
        return _mthdelegate().tailMap(obj);
    }
}
