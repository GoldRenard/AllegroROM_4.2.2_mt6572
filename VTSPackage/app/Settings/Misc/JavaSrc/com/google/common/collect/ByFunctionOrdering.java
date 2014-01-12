// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.*;
import java.io.Serializable;

// Referenced classes of package com.google.common.collect:
//            Ordering

final class ByFunctionOrdering extends Ordering
    implements Serializable
{

    private static final long serialVersionUID;
    final Function function;
    final Ordering ordering;

    ByFunctionOrdering(Function function1, Ordering ordering1)
    {
        function = (Function)Preconditions.checkNotNull(function1);
        ordering = (Ordering)Preconditions.checkNotNull(ordering1);
    }

    public int compare(Object obj, Object obj1)
    {
        return ordering.compare(function.apply(obj), function.apply(obj1));
    }

    public boolean equals(Object obj)
    {
label0:
        {
            if (obj != this)
            {
                if (!(obj instanceof ByFunctionOrdering))
                    break label0;
                ByFunctionOrdering byfunctionordering = (ByFunctionOrdering)obj;
                if (!function.equals(byfunctionordering.function) || !ordering.equals(byfunctionordering.ordering))
                    return false;
            }
            return true;
        }
        return false;
    }

    public int hashCode()
    {
        Object aobj[] = new Object[2];
        aobj[0] = function;
        aobj[1] = ordering;
        return Objects.hashCode(aobj);
    }

    public String toString()
    {
        return (new StringBuilder()).append(ordering).append(".onResultOf(").append(function).append(")").toString();
    }
}
