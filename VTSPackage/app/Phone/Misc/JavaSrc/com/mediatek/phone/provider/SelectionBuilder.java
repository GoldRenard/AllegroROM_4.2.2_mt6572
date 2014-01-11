// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.provider;

import android.text.TextUtils;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package com.mediatek.phone.provider:
//            DbQueryUtils

public class SelectionBuilder
{

    private static final String EMPTY_STRING_ARRAY[] = new String[0];
    private final List mWhereClauses = new ArrayList();

    public SelectionBuilder(String s)
    {
        addClause(s);
    }

    public SelectionBuilder addClause(String s)
    {
        if (!TextUtils.isEmpty(s))
            mWhereClauses.add(s);
        return this;
    }

    public String build()
    {
        if (mWhereClauses.size() == 0)
            return null;
        else
            return DbQueryUtils.concatenateClauses((String[])mWhereClauses.toArray(EMPTY_STRING_ARRAY));
    }

}
