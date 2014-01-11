// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package javax.annotation;

import java.lang.annotation.Annotation;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.meta.TypeQualifierValidator;
import javax.annotation.meta.When;

public interface MatchesPattern
    extends Annotation
{
    public static class Checker
        implements TypeQualifierValidator
    {

        public volatile When forConstantValue(Annotation annotation, Object obj)
        {
            return forConstantValue((MatchesPattern)annotation, obj);
        }

        public When forConstantValue(MatchesPattern matchespattern, Object obj)
        {
            if (Pattern.compile(matchespattern.value(), matchespattern.flags()).matcher((String)obj).matches())
                return When.ALWAYS;
            else
                return When.NEVER;
        }

    }


    public abstract int flags();

    public abstract String value();
}
