// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.base;

import java.lang.ref.PhantomReference;

// Referenced classes of package com.google.common.base:
//            FinalizableReference, FinalizableReferenceQueue

public abstract class FinalizablePhantomReference extends PhantomReference
    implements FinalizableReference
{

    protected FinalizablePhantomReference(Object obj, FinalizableReferenceQueue finalizablereferencequeue)
    {
        super(obj, finalizablereferencequeue.queue);
        finalizablereferencequeue.cleanUp();
    }
}
