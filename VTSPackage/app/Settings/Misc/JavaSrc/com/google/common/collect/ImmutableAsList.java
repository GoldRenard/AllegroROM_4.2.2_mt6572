// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.io.*;

// Referenced classes of package com.google.common.collect:
//            RegularImmutableList, ImmutableCollection

final class ImmutableAsList extends RegularImmutableList
{
    static class SerializedForm
        implements Serializable
    {

        private static final long serialVersionUID;
        final ImmutableCollection collection;

        Object readResolve()
        {
            return collection.asList();
        }

        SerializedForm(ImmutableCollection immutablecollection)
        {
            collection = immutablecollection;
        }
    }


    private final transient ImmutableCollection collection;

    ImmutableAsList(Object aobj[], ImmutableCollection immutablecollection)
    {
        super(aobj, 0, aobj.length);
        collection = immutablecollection;
    }

    private void readObject(ObjectInputStream objectinputstream)
        throws InvalidObjectException
    {
        throw new InvalidObjectException("Use SerializedForm");
    }

    public boolean contains(Object obj)
    {
        return collection.contains(obj);
    }

    Object writeReplace()
    {
        return new SerializedForm(collection);
    }
}
