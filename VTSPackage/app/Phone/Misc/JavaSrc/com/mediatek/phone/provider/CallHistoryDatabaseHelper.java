// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.provider;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

public class CallHistoryDatabaseHelper extends SQLiteOpenHelper
{
    public static interface Tables
    {

        public static final String CALLS = "calls";
        public static final String SEQUENCE_TABLES[] = {
            "calls"
        };

    }


    private static final String DATABASE_NAME = "phone.db";
    private static final int DATABASE_VERSION = 1;
    private static final String TAG = "CallHistoryDatabaseHelper";
    private static CallHistoryDatabaseHelper sSingleton = null;

    protected CallHistoryDatabaseHelper(Context context, String s, boolean flag)
    {
        super(context, s, null, 1);
    }

    public static CallHistoryDatabaseHelper getInstance(Context context)
    {
        com/mediatek/phone/provider/CallHistoryDatabaseHelper;
        JVM INSTR monitorenter ;
        CallHistoryDatabaseHelper callhistorydatabasehelper;
        if (sSingleton == null)
            sSingleton = new CallHistoryDatabaseHelper(context, "phone.db", true);
        callhistorydatabasehelper = sSingleton;
        com/mediatek/phone/provider/CallHistoryDatabaseHelper;
        JVM INSTR monitorexit ;
        return callhistorydatabasehelper;
        Exception exception;
        exception;
        throw exception;
    }

    static CallHistoryDatabaseHelper getNewInstanceForTest(Context context)
    {
        return new CallHistoryDatabaseHelper(context, null, false);
    }

    public void initDatabase()
    {
        getReadableDatabase();
    }

    public void onCreate(SQLiteDatabase sqlitedatabase)
    {
        Log.i("CallHistoryDatabaseHelper", "Bootstrapping database version: 1");
        sqlitedatabase.execSQL("CREATE TABLE calls (_id INTEGER PRIMARY KEY AUTOINCREMENT,number TEXT,date INTEGER,country_iso TEXT,area_code TEXT DEFAULT NULL,confirm INTEGER NOT NULL DEFAULT 0);");
    }

    public void onUpgrade(SQLiteDatabase sqlitedatabase, int i, int j)
    {
    }

}
