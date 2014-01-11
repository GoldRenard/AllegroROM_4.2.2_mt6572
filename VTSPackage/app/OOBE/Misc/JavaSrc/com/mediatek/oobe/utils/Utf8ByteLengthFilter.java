// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.utils;

import android.text.InputFilter;
import android.text.Spanned;

public class Utf8ByteLengthFilter
    implements InputFilter
{

    private static final int CHINESE_CHAR_LENGTH = 3;
    private static final int CHINESE_UFT8 = 2048;
    private static final int ENGLISH_CHAR_LENGTH = 1;
    private static final int ENGLISH_UTF8 = 128;
    private static final int OTHER_CHAR_LENGTH = 2;
    private final int mMaxBytes;

    public Utf8ByteLengthFilter(int i)
    {
        mMaxBytes = i;
    }

    public CharSequence filter(CharSequence charsequence, int i, int j, Spanned spanned, int k, int l)
    {
        int i1 = 0;
        for (int j1 = i; j1 < j; j1++)
        {
            char c2 = charsequence.charAt(j1);
            byte byte2;
            if (c2 < '\200')
                byte2 = 1;
            else
            if (c2 < '\u0800')
                byte2 = 2;
            else
                byte2 = 3;
            i1 += byte2;
        }

        int k1 = spanned.length();
        int l1 = 0;
        for (int i2 = 0; i2 < k1; i2++)
        {
            if (i2 >= k && i2 < l)
                continue;
            char c1 = spanned.charAt(i2);
            byte byte1;
            if (c1 < '\200')
                byte1 = 1;
            else
            if (c1 < '\u0800')
                byte1 = 2;
            else
                byte1 = 3;
            l1 += byte1;
        }

        int j2 = mMaxBytes - l1;
        if (j2 <= 0)
            return "";
        if (j2 >= i1)
            return null;
        for (int k2 = i; k2 < j; k2++)
        {
            char c = charsequence.charAt(k2);
            byte byte0;
            if (c < '\200')
                byte0 = 1;
            else
            if (c < '\u0800')
                byte0 = 2;
            else
                byte0 = 3;
            j2 -= byte0;
            if (j2 < 0)
                return charsequence.subSequence(i, k2);
        }

        return null;
    }
}
