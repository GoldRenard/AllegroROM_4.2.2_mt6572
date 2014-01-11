// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.primitives.Primitives;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ForwardingMap, ClassToInstanceMap, ImmutableMap

public final class ImmutableClassToInstanceMap extends ForwardingMap
    implements ClassToInstanceMap
{
    public static final class Builder
    {

        private final ImmutableMap.Builder mapBuilder = ImmutableMap.builder();

        private static Object cast(Class class1, Object obj)
        {
            return Primitives.wrap(class1).cast(obj);
        }

        public ImmutableClassToInstanceMap build()
        {
            return new ImmutableClassToInstanceMap(mapBuilder.build());
        }

        public Builder put(Class class1, Object obj)
        {
            mapBuilder.put(class1, obj);
            return this;
        }

        public Builder putAll(Map map)
        {
            Class class1;
            Object obj;
            for (Iterator iterator = map.entrySet().iterator(); iterator.hasNext(); mapBuilder.put(class1, cast(class1, obj)))
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
                class1 = (Class)entry.getKey();
                obj = entry.getValue();
            }

            return this;
        }

    }


    private final ImmutableMap _flddelegate;

    private ImmutableClassToInstanceMap(ImmutableMap immutablemap)
    {
        _flddelegate = immutablemap;
    }


    public static Builder builder()
    {
        return new Builder();
    }

    public static ImmutableClassToInstanceMap copyOf(Map map)
    {
        if (map instanceof ImmutableClassToInstanceMap)
            return (ImmutableClassToInstanceMap)map;
        else
            return (new Builder()).putAll(map).build();
    }

    protected volatile Object _mthdelegate()
    {
        return _mthdelegate();
    }

    protected Map _mthdelegate()
    {
        return _flddelegate;
    }

    public Object getInstance(Class class1)
    {
        return _flddelegate.get(class1);
    }

    public Object putInstance(Class class1, Object obj)
    {
        throw new UnsupportedOperationException();
    }
}
