// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.eventbus;

import com.google.common.collect.Multimap;

interface HandlerFindingStrategy
{

    public abstract Multimap findAllHandlers(Object obj);
}
