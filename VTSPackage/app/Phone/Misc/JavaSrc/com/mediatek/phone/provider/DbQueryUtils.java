// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.provider;

import android.content.ContentValues;
import android.database.DatabaseUtils;
import android.text.TextUtils;
import java.util.*;

public class DbQueryUtils
{

    private DbQueryUtils()
    {
    }

    public static void checkForSupportedColumns(HashMap hashmap, ContentValues contentvalues)
    {
        for (Iterator iterator = contentvalues.keySet().iterator(); iterator.hasNext();)
        {
            String s = (String)iterator.next();
            if (!hashmap.keySet().contains(s))
                throw new IllegalArgumentException((new StringBuilder()).append("Column '").append(s).append("' is invalid.").toString());
        }

    }

    public static transient String concatenateClauses(String as[])
    {
        StringBuilder stringbuilder = new StringBuilder();
        int i = as.length;
        for (int j = 0; j < i; j++)
        {
            String s = as[j];
            if (TextUtils.isEmpty(s))
                continue;
            if (stringbuilder.length() > 0)
                stringbuilder.append(" AND ");
            stringbuilder.append("(");
            stringbuilder.append(s);
            stringbuilder.append(")");
        }

        return stringbuilder.toString();
    }

    private static String getClauseWithOperator(String s, String s1, long l)
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append("(");
        stringbuilder.append(s);
        stringbuilder.append(" ").append(s1).append(" ");
        stringbuilder.append(l);
        stringbuilder.append(")");
        return stringbuilder.toString();
    }

    private static String getClauseWithOperator(String s, String s1, String s2)
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append("(");
        stringbuilder.append(s);
        stringbuilder.append(" ").append(s1).append(" ");
        DatabaseUtils.appendEscapedSQLString(stringbuilder, s2);
        stringbuilder.append(")");
        return stringbuilder.toString();
    }

    public static String getEqualityClause(String s, long l)
    {
        return getClauseWithOperator(s, "=", l);
    }

    public static String getEqualityClause(String s, String s1)
    {
        return getClauseWithOperator(s, "=", s1);
    }

    public static String getInequalityClause(String s, long l)
    {
        return getClauseWithOperator(s, "!=", l);
    }
}
