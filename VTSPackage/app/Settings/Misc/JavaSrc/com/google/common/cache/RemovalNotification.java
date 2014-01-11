// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.cache;

import com.google.common.base.Objects;
import com.google.common.base.Preconditions;

// Referenced classes of package com.google.common.cache:
//            RemovalCause

public final class RemovalNotification
    implements java.util.Map.Entry
{

    private static final long serialVersionUID;
    private final RemovalCause cause;
    private final Object key;
    private final Object value;

    RemovalNotification(Object obj, Object obj1, RemovalCause removalcause)
    {
        key = obj;
        value = obj1;
        cause = (RemovalCause)Preconditions.checkNotNull(removalcause);
    }

    public boolean equals(Object obj)
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

    public RemovalCause getCause()
    {
        return cause;
    }

    public Object getKey()
    {
        return key;
    }

    public Object getValue()
    {
        return value;
    }

    public int hashCode()
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

    public final Object setValue(Object obj)
    {
        throw new UnsupportedOperationException();
    }

    public String toString()
    {
        return (new StringBuilder()).append(getKey()).append("=").append(getValue()).toString();
    }

    public boolean wasEvicted()
    {
        return cause.wasEvicted();
    }
}
