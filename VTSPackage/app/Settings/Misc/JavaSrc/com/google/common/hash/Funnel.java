// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.hash;


// Referenced classes of package com.google.common.hash:
//            Sink

public interface Funnel
{

    public abstract void funnel(Object obj, Sink sink);
}
