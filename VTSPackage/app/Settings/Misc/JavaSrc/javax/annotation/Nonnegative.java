// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package javax.annotation;

import java.lang.annotation.Annotation;
import javax.annotation.meta.TypeQualifierValidator;
import javax.annotation.meta.When;

public interface Nonnegative
    extends Annotation
{
    public static class Checker
        implements TypeQualifierValidator
    {

        public volatile When forConstantValue(Annotation annotation, Object obj)
        {
            return forConstantValue((Nonnegative)annotation, obj);
        }

        public When forConstantValue(Nonnegative nonnegative, Object obj)
        {
            boolean flag = true;
            if (!(obj instanceof Number))
                return When.NEVER;
            Number number = (Number)obj;
            if (number instanceof Long)
            {
                if (number.longValue() >= 0L)
                    flag = false;
            } else
            if (number instanceof Double)
            {
                if (number.doubleValue() >= 0.0D)
                    flag = false;
            } else
            if (number instanceof Float)
            {
                if (number.floatValue() >= 0.0F)
                    flag = false;
            } else
            if (number.intValue() >= 0)
                flag = false;
            if (flag)
                return When.NEVER;
            else
                return When.ALWAYS;
        }

    }


    public abstract When when();
}
