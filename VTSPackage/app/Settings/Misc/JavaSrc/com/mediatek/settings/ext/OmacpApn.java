// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.content.*;
import android.database.Cursor;
import android.database.SQLException;
import android.net.Uri;
import android.util.Log;
import java.util.*;

public class OmacpApn
{

    protected static final int APN_ID_INDEX = 17;
    protected static final int APN_INDEX = 2;
    protected static final int AUTH_TYPE_INDEX = 14;
    protected static final int ID_INDEX = 0;
    protected static final int MCC_INDEX = 9;
    protected static final int MMSC_INDEX = 8;
    protected static final int MMSPORT_INDEX = 13;
    protected static final int MMSPROXY_INDEX = 12;
    protected static final int MNC_INDEX = 10;
    protected static final int NAME_INDEX = 1;
    protected static final int NAP_ID_INDEX = 18;
    protected static final int NUMERIC_INDEX = 11;
    protected static final int PASSWORD_INDEX = 7;
    protected static final int PORT_INDEX = 4;
    protected static final String PROJECTION[] = {
        "_id", "name", "apn", "proxy", "port", "user", "server", "password", "mmsc", "mcc", 
        "mnc", "numeric", "mmsproxy", "mmsport", "authtype", "type", "sourcetype", "omacpid", "napid", "proxyid"
    };
    protected static final int PROXY_ID_INDEX = 19;
    protected static final int PROXY_INDEX = 3;
    protected static final int SERVER_INDEX = 6;
    private static final int SIM_CARD_1 = 0;
    private static final int SIM_CARD_2 = 1;
    private static final int SIM_CARD_SINGLE = 2;
    protected static final int SOURCE_TYPE_INDEX = 16;
    private static final String TAG = "omacp";
    protected static final int TYPE_INDEX = 15;
    protected static final int USER_INDEX = 5;
    private ContentResolver mContentResolver;
    private Context mContext;
    private String mNumeric;
    private int mSimId;
    private Uri mUri;

    public OmacpApn(Context context, int i)
    {
        mContentResolver = context.getContentResolver();
        mSimId = i;
    }

    public OmacpApn(Context context, int i, Uri uri, String s)
    {
        mContentResolver = context.getContentResolver();
        mSimId = i;
        mUri = uri;
        mNumeric = s;
    }

    public boolean bulkInsert(Context context, ContentValues acontentvalues[])
    {
        int i = mContentResolver.bulkInsert(mUri, acontentvalues);
        boolean flag;
        flag = false;
        if (i > 0)
            flag = true;
        if (false)
            null.close();
_L2:
        return flag;
        SQLException sqlexception;
        sqlexception;
        Log.d("omacp", "Database operation: bulkInsert() failed!");
        flag = false;
        if (true) goto _L2; else goto _L1
_L1:
        null.close();
        return false;
        Exception exception;
        exception;
        if (false)
            null.close();
        throw exception;
    }

    public ArrayList getExistOmacpId()
    {
        ArrayList arraylist = new ArrayList();
        HashMap hashmap = new HashMap();
        String s = (new StringBuilder()).append("numeric=\"").append(mNumeric).append("\"").append(" and omacpid<>''").toString();
        Cursor cursor = mContentResolver.query(mUri, new String[] {
            "_id", "omacpid"
        }, s, null, "name ASC");
        if (cursor != null)
        {
            cursor.moveToFirst();
            for (; !cursor.isAfterLast(); cursor.moveToNext())
            {
                hashmap.put(cursor.getString(1), cursor.getString(0));
                arraylist.add(hashmap);
            }

            cursor.close();
        }
        return arraylist;
    }

    public long insert(Context context, ContentValues contentvalues)
    {
        Uri uri = mContentResolver.insert(mUri, contentvalues);
        String s;
        s = null;
        if (uri == null)
            break MISSING_BLOCK_LABEL_80;
        int i;
        Log.d("omacp", (new StringBuilder()).append("uri = ").append(uri).toString());
        i = uri.getPathSegments().size();
        s = null;
        if (i != 2)
            break MISSING_BLOCK_LABEL_80;
        String s1 = uri.getLastPathSegment();
        s = s1;
        if (false)
            null.close();
_L1:
        Exception exception;
        SQLException sqlexception;
        if (s != null)
            return Long.parseLong(s);
        else
            return -1L;
        sqlexception;
        Log.d("omacp", "insert SQLException happened!");
        s = null;
        if (false)
        {
            null.close();
            s = null;
        }
          goto _L1
        exception;
        if (false)
            null.close();
        throw exception;
    }

    public ArrayList query()
    {
        String s = (new StringBuilder()).append("numeric=\"").append(mNumeric).append("\"").toString();
        Cursor cursor = mContentResolver.query(mUri, PROJECTION, s, null, "name ASC");
        ArrayList arraylist = new ArrayList();
        if (cursor != null)
        {
            cursor.moveToFirst();
            for (; !cursor.isAfterLast(); cursor.moveToNext())
            {
                HashMap hashmap = new HashMap();
                hashmap.put(PROJECTION[1], cursor.getString(1));
                hashmap.put(PROJECTION[2], cursor.getString(2));
                hashmap.put(PROJECTION[3], cursor.getString(3));
                hashmap.put(PROJECTION[4], cursor.getString(4));
                hashmap.put(PROJECTION[5], cursor.getString(5));
                hashmap.put(PROJECTION[6], cursor.getString(6));
                hashmap.put(PROJECTION[7], cursor.getString(7));
                hashmap.put(PROJECTION[12], cursor.getString(12));
                hashmap.put(PROJECTION[13], cursor.getString(13));
                hashmap.put(PROJECTION[8], cursor.getString(8));
                hashmap.put(PROJECTION[9], cursor.getString(10));
                hashmap.put(PROJECTION[14], cursor.getString(14));
                hashmap.put(PROJECTION[15], cursor.getString(15));
                arraylist.add(hashmap);
            }

            cursor.close();
        }
        return arraylist;
    }

    public int setCurrentApn(Context context, int i, Uri uri)
    {
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("apn_id", Integer.valueOf(i));
        int j;
        try
        {
            j = mContentResolver.update(uri, contentvalues, null, null);
        }
        catch (SQLException sqlexception)
        {
            Log.d("omacp", "setCurrentApn SQLException happened!");
            return 0;
        }
        return j;
    }

}
