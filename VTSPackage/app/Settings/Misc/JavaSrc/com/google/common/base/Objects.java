// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.base;

import java.util.Arrays;

// Referenced classes of package com.google.common.base:
//            Preconditions

public final class Objects
{
    public static final class ToStringHelper
    {

        private final StringBuilder builder;
        private boolean needsSeparator;

        private StringBuilder checkNameAndAppend(String s)
        {
            Preconditions.checkNotNull(s);
            return maybeAppendSeparator().append(s).append('=');
        }

        private StringBuilder maybeAppendSeparator()
        {
            if (needsSeparator)
            {
                return builder.append(", ");
            } else
            {
                needsSeparator = true;
                return builder;
            }
        }

        public ToStringHelper add(String s, char c)
        {
            checkNameAndAppend(s).append(c);
            return this;
        }

        public ToStringHelper add(String s, double d)
        {
            checkNameAndAppend(s).append(d);
            return this;
        }

        public ToStringHelper add(String s, float f)
        {
            checkNameAndAppend(s).append(f);
            return this;
        }

        public ToStringHelper add(String s, int i)
        {
            checkNameAndAppend(s).append(i);
            return this;
        }

        public ToStringHelper add(String s, long l)
        {
            checkNameAndAppend(s).append(l);
            return this;
        }

        public ToStringHelper add(String s, Object obj)
        {
            checkNameAndAppend(s).append(obj);
            return this;
        }

        public ToStringHelper add(String s, boolean flag)
        {
            checkNameAndAppend(s).append(flag);
            return this;
        }

        public ToStringHelper addValue(char c)
        {
            maybeAppendSeparator().append(c);
            return this;
        }

        public ToStringHelper addValue(double d)
        {
            maybeAppendSeparator().append(d);
            return this;
        }

        public ToStringHelper addValue(float f)
        {
            maybeAppendSeparator().append(f);
            return this;
        }

        public ToStringHelper addValue(int i)
        {
            maybeAppendSeparator().append(i);
            return this;
        }

        public ToStringHelper addValue(long l)
        {
            maybeAppendSeparator().append(l);
            return this;
        }

        public ToStringHelper addValue(Object obj)
        {
            maybeAppendSeparator().append(obj);
            return this;
        }

        public ToStringHelper addValue(boolean flag)
        {
            maybeAppendSeparator().append(flag);
            return this;
        }

        public String toString()
        {
            String s = builder.append('}').toString();
            builder.setLength(-1 + builder.length());
            return s;
            Exception exception;
            exception;
            builder.setLength(-1 + builder.length());
            throw exception;
        }

        private ToStringHelper(String s)
        {
            needsSeparator = false;
            Preconditions.checkNotNull(s);
            builder = (new StringBuilder(32)).append(s).append('{');
        }

    }


    private Objects()
    {
    }

    public static boolean equal(Object obj, Object obj1)
    {
        return obj == obj1 || obj != null && obj.equals(obj1);
    }

    public static Object firstNonNull(Object obj, Object obj1)
    {
        if (obj != null)
            return obj;
        else
            return Preconditions.checkNotNull(obj1);
    }

    public static transient int hashCode(Object aobj[])
    {
        return Arrays.hashCode(aobj);
    }

    private static String simpleName(Class class1)
    {
        String s = class1.getName().replaceAll("\\$[0-9]+", "\\$");
        int i = s.lastIndexOf('$');
        if (i == -1)
            i = s.lastIndexOf('.');
        return s.substring(i + 1);
    }

    public static ToStringHelper toStringHelper(Class class1)
    {
        return new ToStringHelper(simpleName(class1));
    }

    public static ToStringHelper toStringHelper(Object obj)
    {
        return new ToStringHelper(simpleName(obj.getClass()));
    }

    public static ToStringHelper toStringHelper(String s)
    {
        return new ToStringHelper(s);
    }
}
