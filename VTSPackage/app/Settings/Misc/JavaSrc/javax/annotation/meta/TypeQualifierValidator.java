// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package javax.annotation.meta;

import java.lang.annotation.Annotation;

// Referenced classes of package javax.annotation.meta:
//            When

public interface TypeQualifierValidator
{

    public abstract When forConstantValue(Annotation annotation, Object obj);
}
