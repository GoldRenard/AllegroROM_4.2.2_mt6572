// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.Map;

public interface ClassToInstanceMap
    extends Map
{

    public abstract Object getInstance(Class class1);

    public abstract Object putInstance(Class class1, Object obj);
}
