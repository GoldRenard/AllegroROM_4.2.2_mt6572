// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.support.v4.util;


public class LongSparseArray
    implements Cloneable
{

    private static final Object DELETED = new Object();
    private boolean mGarbage;
    private long mKeys[];
    private int mSize;
    private Object mValues[];

    public LongSparseArray()
    {
        this(10);
    }

    public LongSparseArray(int i)
    {
        mGarbage = false;
        int j = idealLongArraySize(i);
        mKeys = new long[j];
        mValues = new Object[j];
        mSize = 0;
    }

    private static int binarySearch(long al[], int i, int j, long l)
    {
        int k = i + j;
        for (int i1 = i - 1; k - i1 > 1;)
        {
            int j1 = (k + i1) / 2;
            if (al[j1] < l)
                i1 = j1;
            else
                k = j1;
        }

        if (k == i + j)
            k = -1 ^ i + j;
        else
        if (al[k] != l)
            return ~k;
        return k;
    }

    private void gc()
    {
        int i = mSize;
        int j = 0;
        long al[] = mKeys;
        Object aobj[] = mValues;
        for (int k = 0; k < i; k++)
        {
            Object obj = aobj[k];
            if (obj == DELETED)
                continue;
            if (k != j)
            {
                al[j] = al[k];
                aobj[j] = obj;
                aobj[k] = null;
            }
            j++;
        }

        mGarbage = false;
        mSize = j;
    }

    public static int idealByteArraySize(int i)
    {
        int j = 4;
        do
        {
label0:
            {
                if (j < 32)
                {
                    if (i > -12 + (1 << j))
                        break label0;
                    i = -12 + (1 << j);
                }
                return i;
            }
            j++;
        } while (true);
    }

    public static int idealLongArraySize(int i)
    {
        return idealByteArraySize(i * 8) / 8;
    }

    public void append(long l, Object obj)
    {
        if (mSize != 0 && l <= mKeys[-1 + mSize])
        {
            put(l, obj);
            return;
        }
        if (mGarbage && mSize >= mKeys.length)
            gc();
        int i = mSize;
        if (i >= mKeys.length)
        {
            int j = idealLongArraySize(i + 1);
            long al[] = new long[j];
            Object aobj[] = new Object[j];
            System.arraycopy(mKeys, 0, al, 0, mKeys.length);
            System.arraycopy(((Object) (mValues)), 0, ((Object) (aobj)), 0, mValues.length);
            mKeys = al;
            mValues = aobj;
        }
        mKeys[i] = l;
        mValues[i] = obj;
        mSize = i + 1;
    }

    public void clear()
    {
        int i = mSize;
        Object aobj[] = mValues;
        for (int j = 0; j < i; j++)
            aobj[j] = null;

        mSize = 0;
        mGarbage = false;
    }

    public LongSparseArray clone()
    {
        LongSparseArray longsparsearray = null;
        try
        {
            longsparsearray = (LongSparseArray)super.clone();
            longsparsearray.mKeys = (long[])mKeys.clone();
            longsparsearray.mValues = (Object[])((Object []) (mValues)).clone();
        }
        catch (CloneNotSupportedException clonenotsupportedexception)
        {
            return longsparsearray;
        }
        return longsparsearray;
    }

    public volatile Object clone()
        throws CloneNotSupportedException
    {
        return clone();
    }

    public void delete(long l)
    {
        int i = binarySearch(mKeys, 0, mSize, l);
        if (i >= 0 && mValues[i] != DELETED)
        {
            mValues[i] = DELETED;
            mGarbage = true;
        }
    }

    public Object get(long l)
    {
        return get(l, null);
    }

    public Object get(long l, Object obj)
    {
        int i = binarySearch(mKeys, 0, mSize, l);
        if (i >= 0 && mValues[i] != DELETED)
            return mValues[i];
        else
            return obj;
    }

    public int indexOfKey(long l)
    {
        if (mGarbage)
            gc();
        return binarySearch(mKeys, 0, mSize, l);
    }

    public int indexOfValue(Object obj)
    {
        if (mGarbage)
            gc();
        for (int i = 0; i < mSize; i++)
            if (mValues[i] == obj)
                return i;

        return -1;
    }

    public long keyAt(int i)
    {
        if (mGarbage)
            gc();
        return mKeys[i];
    }

    public void put(long l, Object obj)
    {
        int i = binarySearch(mKeys, 0, mSize, l);
        if (i >= 0)
        {
            mValues[i] = obj;
            return;
        }
        int j = ~i;
        if (j < mSize && mValues[j] == DELETED)
        {
            mKeys[j] = l;
            mValues[j] = obj;
            return;
        }
        if (mGarbage && mSize >= mKeys.length)
        {
            gc();
            j = -1 ^ binarySearch(mKeys, 0, mSize, l);
        }
        if (mSize >= mKeys.length)
        {
            int k = idealLongArraySize(1 + mSize);
            long al[] = new long[k];
            Object aobj[] = new Object[k];
            System.arraycopy(mKeys, 0, al, 0, mKeys.length);
            System.arraycopy(((Object) (mValues)), 0, ((Object) (aobj)), 0, mValues.length);
            mKeys = al;
            mValues = aobj;
        }
        if (mSize - j != 0)
        {
            System.arraycopy(mKeys, j, mKeys, j + 1, mSize - j);
            System.arraycopy(((Object) (mValues)), j, ((Object) (mValues)), j + 1, mSize - j);
        }
        mKeys[j] = l;
        mValues[j] = obj;
        mSize = 1 + mSize;
    }

    public void remove(long l)
    {
        delete(l);
    }

    public void removeAt(int i)
    {
        if (mValues[i] != DELETED)
        {
            mValues[i] = DELETED;
            mGarbage = true;
        }
    }

    public void setValueAt(int i, Object obj)
    {
        if (mGarbage)
            gc();
        mValues[i] = obj;
    }

    public int size()
    {
        if (mGarbage)
            gc();
        return mSize;
    }

    public Object valueAt(int i)
    {
        if (mGarbage)
            gc();
        return mValues[i];
    }

}
