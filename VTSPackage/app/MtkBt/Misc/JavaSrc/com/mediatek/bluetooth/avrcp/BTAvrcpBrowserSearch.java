// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.avrcp;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;
import android.widget.EditText;

public class BTAvrcpBrowserSearch
{

    private static final long EMPTY_LIST[] = new long[0];
    public static final String TAG = "AVRCP_UTIL";
    public static int sNum = 0;
    private EditText mAddrET;
    private Context mContext;
    private String mSearchAlbum[];
    private String mSearchArtist[];
    private long mSearchIDList[];
    private String mSearchTitle[];
    private EditText mToAddrET;

    BTAvrcpBrowserSearch(Context context)
    {
        mContext = context;
    }

    public static long[] getAllSongs(Context context)
    {
        Cursor cursor;
        String as[] = {
            "_id", "album", "artist", "title"
        };
        cursor = query(context, android.provider.MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, as, "is_music=1", null, null);
        if (cursor == null) goto _L2; else goto _L1
_L1:
        int i = cursor.getCount();
        if (i != 0) goto _L3; else goto _L2
_L2:
        long al[];
        al = null;
        if (cursor != null)
            cursor.close();
_L8:
        return al;
_L3:
        int j;
        j = cursor.getCount();
        al = new long[j];
        int k = 0;
_L6:
        if (k >= j) goto _L5; else goto _L4
_L4:
        cursor.moveToNext();
        al[k] = cursor.getLong(0);
        if (false)
            continue; /* Loop/switch isn't completed */
        Object aobj[] = new Object[4];
        aobj[0] = Long.valueOf(cursor.getLong(0));
        aobj[1] = cursor.getString(2);
        aobj[2] = cursor.getString(3);
        aobj[3] = cursor.getString(1);
        Log.v("AVRCP_UTIL", String.format("[UTIL] id:%d album:'%s' artist:'%s' title:'%s' ", aobj));
        k++;
          goto _L6
_L5:
        if (cursor == null) goto _L8; else goto _L7
_L7:
        cursor.close();
        return al;
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
    }

    public static String getSongData(Context context, long l)
    {
        String s;
        Cursor cursor;
        String as[] = {
            "album", "artist", "title"
        };
        s = "";
        String s1 = (new StringBuilder()).append("_id=").append(l).append(" AND ").append("is_music").append("=1").toString();
        cursor = query(context, android.provider.MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, as, s1, null, "track");
        if (cursor == null)
            break MISSING_BLOCK_LABEL_272;
        int i;
        int k;
        int j1;
        i = cursor.getColumnIndexOrThrow("album");
        k = cursor.getColumnIndexOrThrow("artist");
        j1 = cursor.getColumnIndexOrThrow("title");
        int j = j1;
_L1:
        if (k != j)
        {
            IllegalArgumentException illegalargumentexception;
            int i1;
            if (cursor.getCount() > 0)
            {
                cursor.moveToNext();
                s = cursor.getString(i);
            } else
            {
                Log.e("AVRCP_UTIL", "[UTIL] query and get empty result !");
            }
            for (i1 = 0; i1 < cursor.getCount(); i1++)
            {
                Object aobj[] = new Object[3];
                aobj[0] = cursor.getString(i);
                aobj[1] = cursor.getString(j);
                aobj[2] = cursor.getString(i);
                Log.v("AVRCP_UTIL", String.format("[UTIL] found: album:'%s' artist:'%s' title:'%s' ", aobj));
                cursor.moveToNext();
            }

        }
        break MISSING_BLOCK_LABEL_265;
        illegalargumentexception;
        i = 0;
        j = 0;
        k = 0;
          goto _L1
        cursor.close();
        return s;
    }

    public static long[] getSongListForAlbum(Context context, long l)
    {
        String as[] = {
            "_id"
        };
        String s = (new StringBuilder()).append("album_id=").append(l).append(" AND ").append("is_music").append("=1").toString();
        Cursor cursor = query(context, android.provider.MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, as, s, null, "track");
        if (cursor != null)
        {
            long al[] = getSongListForCursor(cursor);
            cursor.close();
            return al;
        } else
        {
            return EMPTY_LIST;
        }
    }

    public static long[] getSongListForArtist(Context context, long l)
    {
        String as[] = {
            "_id"
        };
        String s = (new StringBuilder()).append("artist_id=").append(l).append(" AND ").append("is_music").append("=1").toString();
        Cursor cursor = query(context, android.provider.MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, as, s, null, "album_key,track");
        if (cursor != null)
        {
            long al[] = getSongListForCursor(cursor);
            cursor.close();
            return al;
        } else
        {
            return EMPTY_LIST;
        }
    }

    public static long[] getSongListForCursor(Cursor cursor)
    {
        if (cursor != null) goto _L2; else goto _L1
_L1:
        long al[] = EMPTY_LIST;
_L4:
        return al;
_L2:
        int i;
        i = cursor.getCount();
        al = new long[i];
        cursor.moveToFirst();
        int l = cursor.getColumnIndexOrThrow("audio_id");
        int j = l;
_L5:
        int k = 0;
        while (k < i) 
        {
            al[k] = cursor.getLong(j);
            cursor.moveToNext();
            k++;
        }
        if (true) goto _L4; else goto _L3
_L3:
        IllegalArgumentException illegalargumentexception;
        illegalargumentexception;
        j = cursor.getColumnIndexOrThrow("_id");
          goto _L5
    }

    public static long[] getSongListForPlaylist(Context context, long l)
    {
        String as[] = {
            "audio_id"
        };
        Cursor cursor = query(context, android.provider.MediaStore.Audio.Playlists.Members.getContentUri("external", l), as, null, null, "play_order");
        if (cursor != null)
        {
            long al[] = getSongListForCursor(cursor);
            cursor.close();
            return al;
        } else
        {
            return EMPTY_LIST;
        }
    }

    private void listAllMusic()
    {
        long al[] = getAllSongs(mContext);
        for (int i = 0; al != null && i < al.length; i++)
        {
            long l1 = al[i];
            Log.v("AVRCP_UTIL", (new StringBuilder()).append("find id:").append(l1).toString());
        }

        int j;
        if (al != null)
            j = al.length;
        else
            j = 0;
        int k = j / 2;
        getSongData(mContext, k);
        Log.v("AVRCP_UTIL", "Search empty data ");
        mSearchIDList = getSearchSongs(mContext, "fdsafsfasfasd");
        for (int l = 0; mSearchTitle != null && l < mSearchTitle.length; l++)
            Log.v("AVRCP_UTIL", (new StringBuilder()).append("Search Result ").append(l).append(" ").append(mSearchTitle[l]).toString());

        Log.v("AVRCP_UTIL", "Search es data ");
        mSearchIDList = getSearchSongs(mContext, "es");
        for (int i1 = 0; mSearchTitle != null && i1 < mSearchTitle.length; i1++)
            Log.v("AVRCP_UTIL", (new StringBuilder()).append("Search Result ").append(i1).append(" ").append(mSearchTitle[i1]).toString());

    }

    public static Cursor query(Context context, Uri uri, String as[], String s, String as1[], String s1)
    {
        return query(context, uri, as, s, as1, s1, 0);
    }

    public static Cursor query(Context context, Uri uri, String as[], String s, String as1[], String s1, int i)
    {
        ContentResolver contentresolver;
        Cursor cursor;
        try
        {
            contentresolver = context.getContentResolver();
        }
        catch (UnsupportedOperationException unsupportedoperationexception)
        {
            return null;
        }
        if (contentresolver == null)
            return null;
        if (i <= 0)
            break MISSING_BLOCK_LABEL_51;
        uri = uri.buildUpon().appendQueryParameter("limit", (new StringBuilder()).append("").append(i).toString()).build();
        cursor = contentresolver.query(uri, as, s, as1, s1);
        return cursor;
    }

    public long[] getSearchSongs(Context context, String s)
    {
        int i;
        Cursor cursor;
        i = 0;
        String as[] = {
            "_id", "album", "artist", "title"
        };
        cursor = query(context, android.provider.MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, as, "is_music=1", null, null);
        if (s != null && s.length() != 0) goto _L2; else goto _L1
_L1:
        long al[];
        Log.e("AVRCP_UTIL", "[UTIL] getSearchSongs wrong parameter");
        if (cursor != null)
            cursor.close();
        al = EMPTY_LIST;
_L4:
        return al;
_L2:
        Log.v("AVRCP_UTIL", "[AVRCP] search getSearchSongs");
        if (cursor == null)
            break MISSING_BLOCK_LABEL_109;
        int j = cursor.getCount();
        if (j != 0)
            break MISSING_BLOCK_LABEL_126;
        al = null;
        if (cursor == null) goto _L4; else goto _L3
_L3:
        cursor.close();
        return null;
        int k = cursor.getCount();
        Exception exception;
        Object aobj[];
        int i1;
        int j1;
        for (int l = 0; l >= k; l++)
            break MISSING_BLOCK_LABEL_249;

        cursor.moveToNext();
        if (cursor.getString(3).indexOf(s) == -1)
            break MISSING_BLOCK_LABEL_461;
        i++;
        if (false)
            break MISSING_BLOCK_LABEL_461;
        aobj = new Object[4];
        aobj[0] = Long.valueOf(cursor.getLong(0));
        aobj[1] = cursor.getString(3);
        aobj[2] = cursor.getString(2);
        aobj[3] = cursor.getString(1);
        Log.v("AVRCP_UTIL", String.format("[UTIL] id:%d album:'%s' artist:'%s' title:'%s' ", aobj));
        break MISSING_BLOCK_LABEL_461;
        al = new long[i];
        mSearchTitle = new String[i];
        mSearchArtist = new String[i];
        mSearchAlbum = new String[i];
        if (i <= 0) goto _L6; else goto _L5
_L5:
        cursor.moveToFirst();
        i1 = 0;
        j1 = 0;
_L8:
        if (j1 >= k)
            break; /* Loop/switch isn't completed */
        if (cursor.getString(3).indexOf(s) == -1)
            break MISSING_BLOCK_LABEL_380;
        al[i1] = cursor.getLong(0);
        mSearchTitle[i1] = cursor.getString(3);
        mSearchArtist[i1] = cursor.getString(2);
        mSearchAlbum[i1] = cursor.getString(1);
        i1++;
        cursor.moveToNext();
        j1++;
        if (true) goto _L8; else goto _L7
_L6:
        Log.w("AVRCP_UTIL", "[BT][AVRCP][WRN] found 0 result !");
_L7:
        Log.w("AVRCP_UTIL", (new StringBuilder()).append("[BT][AVRCP] found result list.length:").append(al.length).toString());
        if (cursor == null) goto _L4; else goto _L9
_L9:
        cursor.close();
        return al;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
    }

    public String getSearchedAlbumString(int i)
    {
        return mSearchAlbum[i];
    }

    public String getSearchedArtistString(int i)
    {
        return mSearchArtist[i];
    }

    public long[] getSearchedList()
    {
        if (mSearchIDList == null)
        {
            Log.v("AVRCP_UTIL", "[BT][AVRCP] getSearchedList mSearchIDList is null");
            return EMPTY_LIST;
        } else
        {
            return mSearchIDList;
        }
    }

    public String getSearchedTitleString(int i)
    {
        return mSearchTitle[i];
    }

    public int search(String s)
    {
        Log.v("AVRCP_UTIL", (new StringBuilder()).append("Search data ").append(s).toString());
        mSearchIDList = getSearchSongs(mContext, s);
        for (int i = 0; mSearchTitle != null && i < mSearchTitle.length; i++)
            if (mSearchIDList != null && i < mSearchIDList.length)
                Log.v("AVRCP_UTIL", (new StringBuilder()).append("Search Result ").append(i).append(" id:").append(mSearchIDList[i]).append(" title:").append(mSearchTitle[i]).toString());
            else
                Log.v("AVRCP_UTIL", "Search Result mSearchIDList[j] is not exist!");

        if (mSearchIDList == null)
            return 0;
        else
            return mSearchIDList.length;
    }

}
