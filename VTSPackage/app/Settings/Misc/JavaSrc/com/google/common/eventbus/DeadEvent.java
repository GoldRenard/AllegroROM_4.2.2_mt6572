// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.eventbus;


public class DeadEvent
{

    private final Object event;
    private final Object source;

    public DeadEvent(Object obj, Object obj1)
    {
        source = obj;
        event = obj1;
    }

    public Object getEvent()
    {
        return event;
    }

    public Object getSource()
    {
        return source;
    }
}
