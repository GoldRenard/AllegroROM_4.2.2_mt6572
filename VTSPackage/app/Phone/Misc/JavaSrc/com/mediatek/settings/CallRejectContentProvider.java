// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.content.*;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.text.TextUtils;

// Referenced classes of package com.mediatek.settings:
//            CallRejectDBOpenHelper

public class CallRejectContentProvider extends ContentProvider
{

    private CallRejectDBOpenHelper mDbOpenHelper;

    public CallRejectContentProvider()
    {
        mDbOpenHelper = null;
    }

    public int delete(Uri uri, String s, String as[])
    {
label0:
        {
            SQLiteDatabase sqlitedatabase = mDbOpenHelper.getWritableDatabase();
            int i;
            switch (CallRejectContentData.UserTableData.URIMATCHER.match(uri))
            {
            default:
                break label0;

            case 2: // '\002'
                long l = ContentUris.parseId(uri);
                String s1 = (new StringBuilder()).append("_ID=").append(l).toString();
                StringBuilder stringbuilder = (new StringBuilder()).append(s1);
                String s2;
                if (!TextUtils.isEmpty(s))
                    s2 = (new StringBuilder()).append(" and (").append(s).append(")").toString();
                else
                    s2 = "";
                i = sqlitedatabase.delete("list", stringbuilder.append(s2).toString(), as);
                break;

            case 1: // '\001'
                i = sqlitedatabase.delete("list", s, as);
                break;
            }
            sqlitedatabase.close();
            return i;
        }
        throw new IllegalArgumentException((new StringBuilder()).append("Unknown URI ").append(uri).toString());
    }

    public String getType(Uri uri)
    {
        switch (CallRejectContentData.UserTableData.URIMATCHER.match(uri))
        {
        case 2: // '\002'
            return "vnd.android.cursor.item/com.android.reject";

        case 1: // '\001'
            return "vnd.android.cursor.dir/com.android.rejects";
        }
        throw new IllegalArgumentException((new StringBuilder()).append("Unknown URI ").append(uri).toString());
    }

    public Uri insert(Uri uri, ContentValues contentvalues)
    {
        SQLiteDatabase sqlitedatabase = mDbOpenHelper.getWritableDatabase();
        switch (CallRejectContentData.UserTableData.URIMATCHER.match(uri))
        {
        case 2: // '\002'
            long l = sqlitedatabase.insert("list", null, contentvalues);
            String s = uri.toString();
            return Uri.parse((new StringBuilder()).append(s.substring(0, s.lastIndexOf("/"))).append(l).toString());

        case 1: // '\001'
            return ContentUris.withAppendedId(uri, sqlitedatabase.insert("list", null, contentvalues));
        }
        throw new IllegalArgumentException((new StringBuilder()).append("Unknown URI ").append(uri).toString());
    }

    public boolean onCreate()
    {
        mDbOpenHelper = new CallRejectDBOpenHelper(getContext(), "reject.db", 4);
        return true;
    }

    public Cursor query(Uri uri, String as[], String s, String as1[], String s1)
    {
        SQLiteDatabase sqlitedatabase = mDbOpenHelper.getReadableDatabase();
        switch (CallRejectContentData.UserTableData.URIMATCHER.match(uri))
        {
        case 2: // '\002'
            long l = ContentUris.parseId(uri);
            String s2 = (new StringBuilder()).append("_ID=").append(l).toString();
            StringBuilder stringbuilder = (new StringBuilder()).append(s2);
            String s3;
            if (!TextUtils.isEmpty(s))
                s3 = (new StringBuilder()).append(" and (").append(s).append(")").toString();
            else
                s3 = "";
            return sqlitedatabase.query("list", as, stringbuilder.append(s3).toString(), as1, null, null, s1);

        case 1: // '\001'
            return sqlitedatabase.query("list", as, s, as1, null, null, s1);
        }
        throw new IllegalArgumentException((new StringBuilder()).append("Unknown URI ").append(uri).toString());
    }

    public int update(Uri uri, ContentValues contentvalues, String s, String as[])
    {
label0:
        {
            SQLiteDatabase sqlitedatabase = mDbOpenHelper.getWritableDatabase();
            int i;
            switch (CallRejectContentData.UserTableData.URIMATCHER.match(uri))
            {
            default:
                break label0;

            case 2: // '\002'
                long l = ContentUris.parseId(uri);
                String s1 = (new StringBuilder()).append("_ID=").append(l).toString();
                StringBuilder stringbuilder = (new StringBuilder()).append(s1);
                String s2;
                if (!TextUtils.isEmpty(s))
                    s2 = (new StringBuilder()).append(" and (").append(s).append(")").toString();
                else
                    s2 = "";
                i = sqlitedatabase.update("list", contentvalues, stringbuilder.append(s2).toString(), as);
                break;

            case 1: // '\001'
                i = sqlitedatabase.update("list", contentvalues, s, as);
                break;
            }
            sqlitedatabase.close();
            return i;
        }
        throw new IllegalArgumentException((new StringBuilder()).append("Unknown URI ").append(uri).toString());
    }
}
