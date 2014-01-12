// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.support.v4.database;

import android.text.TextUtils;

public class DatabaseUtilsCompat
{

    private DatabaseUtilsCompat()
    {
    }

    public static String[] appendSelectionArgs(String as[], String as1[])
    {
        if (as != null && as.length != 0)
        {
            String as2[] = new String[as.length + as1.length];
            System.arraycopy(as, 0, as2, 0, as.length);
            System.arraycopy(as1, 0, as2, as.length, as1.length);
            return as2;
        } else
        {
            return as1;
        }
    }

    public static String concatenateWhere(String s, String s1)
    {
        if (TextUtils.isEmpty(s))
            return s1;
        if (TextUtils.isEmpty(s1))
            return s;
        else
            return (new StringBuilder()).append("(").append(s).append(") AND (").append(s1).append(")").toString();
    }
}
