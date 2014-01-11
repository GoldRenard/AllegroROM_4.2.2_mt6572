// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.support.v4.util;


public class SparseArrayCompat
{

    private static final Object DELETED = new Object();
    private boolean mGarbage;
    private int mKeys[];
    private int mSize;
    private Object mValues[];

    public SparseArrayCompat()
    {
        this(10);
    }

    public SparseArrayCompat(int i)
    {
        mGarbage = false;
        int j = idealIntArraySize(i);
        mKeys = new int[j];
        mValues = new Object[j];
        mSize = 0;
    }

    private static int binarySearch(int ai[], int i, int j, int k)
    {
        int l = i + j;
        for (int i1 = i - 1; l - i1 > 1;)
        {
            int j1 = (l + i1) / 2;
            if (ai[j1] < k)
                i1 = j1;
            else
                l = j1;
        }

        if (l == i + j)
            l = -1 ^ i + j;
        else
        if (ai[l] != k)
            return ~l;
        return l;
    }

    private void gc()
    {
        int i = mSize;
        int j = 0;
        int ai[] = mKeys;
        Object aobj[] = mValues;
        for (int k = 0; k < i; k++)
        {
            Object obj = aobj[k];
            if (obj == DELETED)
                continue;
            if (k != j)
            {
                ai[j] = ai[k];
                aobj[j] = obj;
            }
            j++;
        }

        mGarbage = false;
        mSize = j;
    }

    static int idealByteArraySize(int i)
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

    static int idealIntArraySize(int i)
    {
        return idealByteArraySize(i * 4) / 4;
    }

    public void append(int i, Object obj)
    {
        if (mSize != 0 && i <= mKeys[-1 + mSize])
        {
            put(i, obj);
            return;
        }
        if (mGarbage && mSize >= mKeys.length)
            gc();
        int j = mSize;
        if (j >= mKeys.length)
        {
            int k = idealIntArraySize(j + 1);
            int ai[] = new int[k];
            Object aobj[] = new Object[k];
            System.arraycopy(mKeys, 0, ai, 0, mKeys.length);
            System.arraycopy(((Object) (mValues)), 0, ((Object) (aobj)), 0, mValues.length);
            mKeys = ai;
            mValues = aobj;
        }
        mKeys[j] = i;
        mValues[j] = obj;
        mSize = j + 1;
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

    public void delete(int i)
    {
        int j = binarySearch(mKeys, 0, mSize, i);
        if (j >= 0 && mValues[j] != DELETED)
        {
            mValues[j] = DELETED;
            mGarbage = true;
        }
    }

    public Object get(int i)
    {
        return get(i, null);
    }

    public Object get(int i, Object obj)
    {
        int j = binarySearch(mKeys, 0, mSize, i);
        if (j >= 0 && mValues[j] != DELETED)
            return mValues[j];
        else
            return obj;
    }

    public int indexOfKey(int i)
    {
        if (mGarbage)
            gc();
        return binarySearch(mKeys, 0, mSize, i);
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

    public int keyAt(int i)
    {
        if (mGarbage)
            gc();
        return mKeys[i];
    }

    public void put(int i, Object obj)
    {
        int j = binarySearch(mKeys, 0, mSize, i);
        if (j >= 0)
        {
            mValues[j] = obj;
            return;
        }
        int k = ~j;
        if (k < mSize && mValues[k] == DELETED)
        {
            mKeys[k] = i;
            mValues[k] = obj;
            return;
        }
        if (mGarbage && mSize >= mKeys.length)
        {
            gc();
            k = -1 ^ binarySearch(mKeys, 0, mSize, i);
        }
        if (mSize >= mKeys.length)
        {
            int l = idealIntArraySize(1 + mSize);
            int ai[] = new int[l];
            Object aobj[] = new Object[l];
            System.arraycopy(mKeys, 0, ai, 0, mKeys.length);
            System.arraycopy(((Object) (mValues)), 0, ((Object) (aobj)), 0, mValues.length);
            mKeys = ai;
            mValues = aobj;
        }
        if (mSize - k != 0)
        {
            System.arraycopy(mKeys, k, mKeys, k + 1, mSize - k);
            System.arraycopy(((Object) (mValues)), k, ((Object) (mValues)), k + 1, mSize - k);
        }
        mKeys[k] = i;
        mValues[k] = obj;
        mSize = 1 + mSize;
    }

    public void remove(int i)
    {
        delete(i);
    }

    public void removeAt(int i)
    {
        if (mValues[i] != DELETED)
        {
            mValues[i] = DELETED;
            mGarbage = true;
        }
    }

    public void removeAtRange(int i, int j)
    {
        int k = Math.min(mSize, i + j);
        for (int l = i; l < k; l++)
            removeAt(l);

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
