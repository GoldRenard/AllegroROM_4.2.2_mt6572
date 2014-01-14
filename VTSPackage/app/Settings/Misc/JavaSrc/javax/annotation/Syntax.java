// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package javax.annotation;

import java.lang.annotation.Annotation;
import javax.annotation.meta.When;

public interface Syntax
    extends Annotation
{

    public abstract String value();

    public abstract When when();
}
