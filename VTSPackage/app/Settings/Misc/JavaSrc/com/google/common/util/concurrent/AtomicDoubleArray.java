// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import java.io.*;
import java.util.concurrent.atomic.AtomicLongArray;

public class AtomicDoubleArray
    implements Serializable
{

    private static final long serialVersionUID;
    private transient AtomicLongArray longs;

    public AtomicDoubleArray(int i)
    {
        longs = new AtomicLongArray(i);
    }

    public AtomicDoubleArray(double ad[])
    {
        int i = ad.length;
        long al[] = new long[i];
        for (int j = 0; j < i; j++)
            al[j] = Double.doubleToRawLongBits(ad[j]);

        longs = new AtomicLongArray(al);
    }

    private void readObject(ObjectInputStream objectinputstream)
        throws IOException, ClassNotFoundException
    {
        objectinputstream.defaultReadObject();
        int i = objectinputstream.readInt();
        longs = new AtomicLongArray(i);
        for (int j = 0; j < i; j++)
            set(j, objectinputstream.readDouble());

    }

    private void writeObject(ObjectOutputStream objectoutputstream)
        throws IOException
    {
        objectoutputstream.defaultWriteObject();
        int i = length();
        objectoutputstream.writeInt(i);
        for (int j = 0; j < i; j++)
            objectoutputstream.writeDouble(get(j));

    }

    public double addAndGet(int i, double d)
    {
        long l;
        double d1;
        long l1;
        do
        {
            l = longs.get(i);
            d1 = d + Double.longBitsToDouble(l);
            l1 = Double.doubleToRawLongBits(d1);
        } while (!longs.compareAndSet(i, l, l1));
        return d1;
    }

    public final boolean compareAndSet(int i, double d, double d1)
    {
        return longs.compareAndSet(i, Double.doubleToRawLongBits(d), Double.doubleToRawLongBits(d1));
    }

    public final double get(int i)
    {
        return Double.longBitsToDouble(longs.get(i));
    }

    public final double getAndAdd(int i, double d)
    {
        long l;
        double d1;
        long l1;
        do
        {
            l = longs.get(i);
            d1 = Double.longBitsToDouble(l);
            l1 = Double.doubleToRawLongBits(d1 + d);
        } while (!longs.compareAndSet(i, l, l1));
        return d1;
    }

    public final double getAndSet(int i, double d)
    {
        long l = Double.doubleToRawLongBits(d);
        return Double.longBitsToDouble(longs.getAndSet(i, l));
    }

    public final void lazySet(int i, double d)
    {
        set(i, d);
    }

    public final int length()
    {
        return longs.length();
    }

    public final void set(int i, double d)
    {
        long l = Double.doubleToRawLongBits(d);
        longs.set(i, l);
    }

    public String toString()
    {
        int i = -1 + length();
        if (i == -1)
            return "[]";
        StringBuilder stringbuilder = new StringBuilder(19 * (i + 1));
        stringbuilder.append('[');
        int j = 0;
        do
        {
            stringbuilder.append(Double.longBitsToDouble(longs.get(j)));
            if (j == i)
                return stringbuilder.append(']').toString();
            stringbuilder.append(',').append(' ');
            j++;
        } while (true);
    }

    public final boolean weakCompareAndSet(int i, double d, double d1)
    {
        return longs.weakCompareAndSet(i, Double.doubleToRawLongBits(d), Double.doubleToRawLongBits(d1));
    }
}
