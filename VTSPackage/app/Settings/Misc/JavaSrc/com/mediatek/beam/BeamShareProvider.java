// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.beam;

import android.content.*;
import android.database.Cursor;
import android.database.sqlite.*;
import android.net.Uri;
import android.text.TextUtils;
import com.mediatek.xlog.Xlog;
import java.util.HashMap;
import java.util.List;

public class BeamShareProvider extends ContentProvider
{
    private static class DatabaseHelper extends SQLiteOpenHelper
    {

        public void onCreate(SQLiteDatabase sqlitedatabase)
        {
            sqlitedatabase.execSQL("CREATE TABLE share_tasks (_id INTEGER PRIMARY KEY,type INTEGER,state INTEGER,data TEXT,mime TEXT,total INTEGER,done INTEGER,modified INTEGER);");
        }

        public void onUpgrade(SQLiteDatabase sqlitedatabase, int i, int j)
        {
            Xlog.d("BeamShareProvider", (new StringBuilder()).append("Upgrading database from version ").append(i).append(" to ").append(j).append(" (will destroy all old data)!").toString());
            sqlitedatabase.execSQL("DROP TABLE IF EXISTS share_tasks");
            onCreate(sqlitedatabase);
        }

        DatabaseHelper(Context context)
        {
            super(context, "share.db", null, 1);
        }
    }


    public static final String AUTHORITY = "com.android.settings.provider.beam.share";
    public static final String DATABASE_NAME = "share.db";
    public static final int DATABASE_VERSION = 1;
    private static final int MULTIPLE_TASK_URI = 1;
    private static final int SINGLE_TASK_URI = 2;
    private static final String TAG = "BeamShareProvider";
    private static final UriMatcher URI_MATCHER;
    private static HashMap sProjectionMap;
    private SQLiteDatabase mDb;
    private DatabaseHelper mDbHelper;


    private void checkWritePermissions()
    {
        if (getContext().checkCallingOrSelfPermission("android.permission.WRITE_SECURE_SETTINGS") != 0)
            throw new SecurityException(String.format("Permission denial: writing to secure settings requires %1$s", new Object[] {
                "android.permission.WRITE_SECURE_SETTINGS"
            }));
        else
            return;
    }

    private void sendNotify(Uri uri)
    {
        String s = uri.getQueryParameter("notify");
        if (s != null && !"true".equals(s))
        {
            Xlog.v("BeamShareProvider", (new StringBuilder()).append("notification suppressed: ").append(uri).toString());
            return;
        } else
        {
            getContext().getContentResolver().notifyChange(uri, null);
            Xlog.v("BeamShareProvider", (new StringBuilder()).append("notifying: ").append(uri).toString());
            return;
        }
    }

    public int delete(Uri uri, String s, String as[])
    {
label0:
        {
            checkWritePermissions();
            mDb = mDbHelper.getWritableDatabase();
            int i;
            switch (URI_MATCHER.match(uri))
            {
            default:
                break label0;

            case 2: // '\002'
                String s1 = (String)uri.getPathSegments().get(1);
                SQLiteDatabase sqlitedatabase = mDb;
                StringBuilder stringbuilder = (new StringBuilder()).append("_id=").append(s1);
                String s2;
                if (!TextUtils.isEmpty(s))
                    s2 = (new StringBuilder()).append(" AND (").append(s).append(')').toString();
                else
                    s2 = "";
                i = sqlitedatabase.delete("share_tasks", stringbuilder.append(s2).toString(), as);
                break;

            case 1: // '\001'
                i = mDb.delete("share_tasks", s, as);
                break;
            }
            sendNotify(uri);
            return i;
        }
        throw new IllegalArgumentException((new StringBuilder()).append("Unknown URI ").append(uri).toString());
    }

    public String getType(Uri uri)
    {
        switch (URI_MATCHER.match(uri))
        {
        case 2: // '\002'
            return "vnd.android.cursor.item/vnd.mtkbeam.share.task";

        case 1: // '\001'
            return "vnd.android.cursor.dir/vnd.mtkbeam.share.task";
        }
        throw new IllegalArgumentException((new StringBuilder()).append("Unknown URI ").append(uri).toString());
    }

    public Uri insert(Uri uri, ContentValues contentvalues)
    {
        if (URI_MATCHER.match(uri) != 1)
            throw new IllegalArgumentException((new StringBuilder()).append("Invalid URI: ").append(uri).toString());
        checkWritePermissions();
        long l = mDbHelper.getWritableDatabase().insert("share_tasks", null, contentvalues);
        if (l <= 0L)
        {
            return null;
        } else
        {
            Xlog.v("BeamShareProvider", (new StringBuilder()).append("share_tasks <- ").append(contentvalues).toString());
            Uri uri1 = ContentUris.withAppendedId(BeamShareTask.BeamShareTaskMetaData.CONTENT_URI, l);
            getContext().getContentResolver().notifyChange(BeamShareTask.BeamShareTaskMetaData.CONTENT_URI, null);
            sendNotify(uri1);
            return uri1;
        }
    }

    public boolean onCreate()
    {
        mDbHelper = new DatabaseHelper(getContext());
        mDb = mDbHelper.getWritableDatabase();
        return true;
    }

    public Cursor query(Uri uri, String as[], String s, String as1[], String s1)
    {
        mDb = mDbHelper.getReadableDatabase();
        SQLiteQueryBuilder sqlitequerybuilder;
        String s2;
        Cursor cursor;
        try
        {
            sqlitequerybuilder = new SQLiteQueryBuilder();
            sqlitequerybuilder.setTables("share_tasks");
            sqlitequerybuilder.setProjectionMap(sProjectionMap);
            if (URI_MATCHER.match(uri) == 2)
                sqlitequerybuilder.appendWhere((new StringBuilder()).append("_id=").append((String)uri.getPathSegments().get(1)).toString());
        }
        catch (SQLiteDiskIOException sqlitediskioexception)
        {
            Xlog.e("BeamShareProvider", sqlitediskioexception.toString());
            return null;
        }
        s2 = s1;
        if (TextUtils.isEmpty(s1))
            s2 = "modified DESC";
        cursor = sqlitequerybuilder.query(mDb, as, s, as1, null, null, s2);
        if (cursor == null)
            break MISSING_BLOCK_LABEL_138;
        cursor.setNotificationUri(getContext().getContentResolver(), uri);
        return cursor;
    }

    public int update(Uri uri, ContentValues contentvalues, String s, String as[])
    {
label0:
        {
            checkWritePermissions();
            mDb = mDbHelper.getWritableDatabase();
            int i;
            switch (URI_MATCHER.match(uri))
            {
            default:
                break label0;

            case 2: // '\002'
                String s1 = (String)uri.getPathSegments().get(1);
                SQLiteDatabase sqlitedatabase = mDb;
                StringBuilder stringbuilder = (new StringBuilder()).append("_id=").append(s1);
                String s2;
                if (!TextUtils.isEmpty(s))
                    s2 = (new StringBuilder()).append(" AND (").append(s).append(')').toString();
                else
                    s2 = "";
                i = sqlitedatabase.update("share_tasks", contentvalues, stringbuilder.append(s2).toString(), as);
                break;

            case 1: // '\001'
                i = mDb.update("share_tasks", contentvalues, s, as);
                break;
            }
            sendNotify(uri);
            return i;
        }
        throw new IllegalArgumentException((new StringBuilder()).append("Unknown URI ").append(uri).toString());
    }

    static 
    {
        sProjectionMap = new HashMap();
        sProjectionMap.put("_id", "_id");
        sProjectionMap.put("type", "type");
        sProjectionMap.put("state", "state");
        sProjectionMap.put("data", "data");
        sProjectionMap.put("mime", "mime");
        sProjectionMap.put("total", "total");
        sProjectionMap.put("done", "done");
        sProjectionMap.put("modified", "modified");
        URI_MATCHER = new UriMatcher(-1);
        URI_MATCHER.addURI("com.android.settings.provider.beam.share", "share_tasks", 1);
        URI_MATCHER.addURI("com.android.settings.provider.beam.share", "share_tasks/#", 2);
    }
}
