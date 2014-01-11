// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Objects;

// Referenced classes of package com.google.common.collect:
//            ForwardingObject

public abstract class ForwardingMapEntry extends ForwardingObject
    implements java.util.Map.Entry
{


    protected volatile Object _mthdelegate()
    {
        return _mthdelegate();
    }

    protected abstract java.util.Map.Entry _mthdelegate();

    public boolean equals(Object obj)
    {
        return _mthdelegate().equals(obj);
    }

    public Object getKey()
    {
        return _mthdelegate().getKey();
    }

    public Object getValue()
    {
        return _mthdelegate().getValue();
    }

    public int hashCode()
    {
        return _mthdelegate().hashCode();
    }

    public Object setValue(Object obj)
    {
        return _mthdelegate().setValue(obj);
    }

    protected boolean standardEquals(Object obj)
    {
        boolean flag = obj instanceof java.util.Map.Entry;
        boolean flag1 = false;
        if (flag)
        {
            java.util.Map.Entry entry = (java.util.Map.Entry)obj;
            boolean flag2 = Objects.equal(getKey(), entry.getKey());
            flag1 = false;
            if (flag2)
            {
                boolean flag3 = Objects.equal(getValue(), entry.getValue());
                flag1 = false;
                if (flag3)
                    flag1 = true;
            }
        }
        return flag1;
    }

    protected int standardHashCode()
    {
        Object obj = getKey();
        Object obj1 = getValue();
        int i;
        if (obj == null)
            i = 0;
        else
            i = obj.hashCode();
        int j = 0;
        if (obj1 != null)
            j = obj1.hashCode();
        return j ^ i;
    }

    protected String standardToString()
    {
        return (new StringBuilder()).append(getKey()).append("=").append(getValue()).toString();
    }
}
