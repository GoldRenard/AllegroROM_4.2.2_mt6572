// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.provider;

import android.content.*;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import java.util.HashMap;

// Referenced classes of package com.mediatek.phone.provider:
//            SelectionBuilder, CallHistoryDatabaseHelper

public class CallHistoryContentProvider extends ContentProvider
{

    private static final int CALLS = 1;
    private static final HashMap CALLSPROJECTIONMAP;
    private static final int COUNTRY_ISOS = 2;
    private static final UriMatcher URIMATCHER;
    private CallHistoryDatabaseHelper mDbHelper;


    public int delete(Uri uri, String s, String as[])
    {
        SelectionBuilder selectionbuilder = new SelectionBuilder(s);
        SQLiteDatabase sqlitedatabase = mDbHelper.getWritableDatabase();
        switch (URIMATCHER.match(uri))
        {
        case 1: // '\001'
            return sqlitedatabase.delete("calls", selectionbuilder.build(), as);
        }
        throw new UnsupportedOperationException((new StringBuilder()).append("Cannot delete that URL: ").append(uri).toString());
    }

    protected CallHistoryDatabaseHelper getDatabaseHelperInstance(Context context)
    {
        return CallHistoryDatabaseHelper.getInstance(context);
    }

    public String getType(Uri uri)
    {
        switch (URIMATCHER.match(uri))
        {
        case 1: // '\001'
        case 2: // '\002'
            return "vnd.android.cursor.dir/calls";
        }
        throw new IllegalArgumentException((new StringBuilder()).append("Unknown URI: ").append(uri).toString());
    }

    public Uri insert(Uri uri, ContentValues contentvalues)
    {
        return ContentUris.withAppendedId(uri, mDbHelper.getWritableDatabase().insert("calls", null, contentvalues));
    }

    public boolean onCreate()
    {
        mDbHelper = getDatabaseHelperInstance(getContext());
        return true;
    }

    public Cursor query(Uri uri, String as[], String s, String as1[], String s1)
    {
        SelectionBuilder selectionbuilder = new SelectionBuilder(s);
        int i = URIMATCHER.match(uri);
        boolean flag = false;
        switch (i)
        {
        case 2: // '\002'
            flag = true;
            // fall through

        case 1: // '\001'
            return mDbHelper.getReadableDatabase().query(flag, "calls", as, selectionbuilder.build(), as1, null, null, s1, null);

        default:
            throw new IllegalArgumentException((new StringBuilder()).append("Unknown URL ").append(uri).toString());
        }
    }

    public int update(Uri uri, ContentValues contentvalues, String s, String as[])
    {
        SelectionBuilder selectionbuilder = new SelectionBuilder(s);
        SQLiteDatabase sqlitedatabase = mDbHelper.getWritableDatabase();
        switch (URIMATCHER.match(uri))
        {
        case 1: // '\001'
            return sqlitedatabase.update("calls", contentvalues, selectionbuilder.build(), as);
        }
        throw new UnsupportedOperationException((new StringBuilder()).append("Cannot update URL: ").append(uri).toString());
    }

    static 
    {
        URIMATCHER = new UriMatcher(-1);
        URIMATCHER.addURI("call_history", "calls", 1);
        URIMATCHER.addURI("call_history", "country_isos", 2);
        CALLSPROJECTIONMAP = new HashMap();
        CALLSPROJECTIONMAP.put("_id", "_id");
        CALLSPROJECTIONMAP.put("number", "number");
        CALLSPROJECTIONMAP.put("date", "date");
        CALLSPROJECTIONMAP.put("country_iso", "country_iso");
        CALLSPROJECTIONMAP.put("area_code", "area_code");
        CALLSPROJECTIONMAP.put("confirm", "confirm");
    }
}
