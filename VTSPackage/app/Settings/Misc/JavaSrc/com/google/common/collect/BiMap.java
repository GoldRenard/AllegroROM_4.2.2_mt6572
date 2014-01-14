// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.Map;
import java.util.Set;

public interface BiMap
    extends Map
{

    public abstract Object forcePut(Object obj, Object obj1);

    public abstract BiMap inverse();

    public abstract Object put(Object obj, Object obj1);

    public abstract void putAll(Map map);

    public abstract Set values();
}
