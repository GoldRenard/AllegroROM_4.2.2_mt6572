// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.database.Cursor;
import android.database.DataSetObserver;
import android.util.SparseIntArray;
import java.text.Collator;

// Referenced classes of package android.widget:
//            SectionIndexer

public class AlphabetIndexer extends DataSetObserver
    implements SectionIndexer
{

    private SparseIntArray mAlphaMap;
    protected CharSequence mAlphabet;
    private String mAlphabetArray[];
    private int mAlphabetLength;
    private Collator mCollator;
    protected int mColumnIndex;
    protected Cursor mDataCursor;

    public AlphabetIndexer(Cursor cursor, int i, CharSequence charsequence)
    {
        mDataCursor = cursor;
        mColumnIndex = i;
        mAlphabet = charsequence;
        mAlphabetLength = charsequence.length();
        mAlphabetArray = new String[mAlphabetLength];
        for (int j = 0; j < mAlphabetLength; j++)
            mAlphabetArray[j] = Character.toString(mAlphabet.charAt(j));

        mAlphaMap = new SparseIntArray(mAlphabetLength);
        if (cursor != null)
            cursor.registerDataSetObserver(this);
        mCollator = Collator.getInstance();
        mCollator.setStrength(0);
    }

    protected int compare(String s, String s1)
    {
        String s2;
        if (s.length() == 0)
            s2 = " ";
        else
            s2 = s.substring(0, 1);
        return mCollator.compare(s2, s1);
    }

    public int getPositionForSection(int i)
    {
        int j;
label0:
        {
            SparseIntArray sparseintarray = mAlphaMap;
            Cursor cursor = mDataCursor;
            if (cursor != null && mAlphabet != null)
            {
                if (i <= 0)
                    return 0;
                int k = mAlphabetLength;
                if (i >= k)
                    i = -1 + mAlphabetLength;
                int l = cursor.getPosition();
                int i1 = cursor.getCount();
                int j1 = i1;
                char c = mAlphabet.charAt(i);
                String s = Character.toString(c);
                j = sparseintarray.get(c, 0x80000000);
                if (0x80000000 != j)
                {
                    if (j >= 0)
                        break label0;
                    j1 = -j;
                }
                int k1 = 0;
                if (i > 0)
                {
                    int j2 = sparseintarray.get(mAlphabet.charAt(i - 1), 0x80000000);
                    k1 = 0;
                    if (j2 != 0x80000000)
                        k1 = Math.abs(j2);
                }
                int l1 = (j1 + k1) / 2;
                do
                {
                    if (l1 >= j1)
                        break;
                    cursor.moveToPosition(l1);
                    String s1 = cursor.getString(mColumnIndex);
                    if (s1 == null)
                    {
                        if (l1 == 0)
                            break;
                        l1--;
                        continue;
                    }
                    int i2 = compare(s1, s);
                    if (i2 != 0)
                    {
                        if (i2 < 0)
                        {
                            k1 = l1 + 1;
                            if (k1 >= i1)
                            {
                                l1 = i1;
                                break;
                            }
                        } else
                        {
                            j1 = l1;
                        }
                    } else
                    {
                        if (k1 == l1)
                            break;
                        j1 = l1;
                    }
                    l1 = (k1 + j1) / 2;
                } while (true);
                sparseintarray.put(c, l1);
                cursor.moveToPosition(l);
                return l1;
            }
            j = 0;
        }
        return j;
    }

    public int getSectionForPosition(int i)
    {
        int j = mDataCursor.getPosition();
        mDataCursor.moveToPosition(i);
        String s = mDataCursor.getString(mColumnIndex);
        mDataCursor.moveToPosition(j);
        for (int k = 0; k < mAlphabetLength; k++)
            if (compare(s, Character.toString(mAlphabet.charAt(k))) == 0)
                return k;

        return 0;
    }

    public Object[] getSections()
    {
        return mAlphabetArray;
    }

    public void onChanged()
    {
        super.onChanged();
        mAlphaMap.clear();
    }

    public void onInvalidated()
    {
        super.onInvalidated();
        mAlphaMap.clear();
    }

    public void setCursor(Cursor cursor)
    {
        if (mDataCursor != null)
            mDataCursor.unregisterDataSetObserver(this);
        mDataCursor = cursor;
        if (cursor != null)
            mDataCursor.registerDataSetObserver(this);
        mAlphaMap.clear();
    }
}
