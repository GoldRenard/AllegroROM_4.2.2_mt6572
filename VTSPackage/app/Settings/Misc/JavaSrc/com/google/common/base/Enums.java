// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.base;

import java.io.Serializable;

// Referenced classes of package com.google.common.base:
//            Function, Preconditions

public final class Enums
{
    private static final class ValueOfFunction
        implements Function, Serializable
    {

        private static final long serialVersionUID;
        private final Class enumClass;

        public Enum apply(String s)
        {
            Enum enum;
            try
            {
                enum = Enum.valueOf(enumClass, s);
            }
            catch (IllegalArgumentException illegalargumentexception)
            {
                return null;
            }
            return enum;
        }

        public volatile Object apply(Object obj)
        {
            return apply((String)obj);
        }

        public boolean equals(Object obj)
        {
            return (obj instanceof ValueOfFunction) && enumClass.equals(((ValueOfFunction)obj).enumClass);
        }

        public int hashCode()
        {
            return enumClass.hashCode();
        }

        public String toString()
        {
            return (new StringBuilder()).append("Enums.valueOf(").append(enumClass).append(")").toString();
        }

        private ValueOfFunction(Class class1)
        {
            enumClass = (Class)Preconditions.checkNotNull(class1);
        }

    }


    private Enums()
    {
    }

    public static Function valueOfFunction(Class class1)
    {
        return new ValueOfFunction(class1);
    }
}
