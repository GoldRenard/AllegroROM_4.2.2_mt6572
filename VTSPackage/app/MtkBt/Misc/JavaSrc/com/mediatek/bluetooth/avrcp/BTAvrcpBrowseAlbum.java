// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.avrcp;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;

public class BTAvrcpBrowseAlbum
{

    public static final byte ALBUM_TYPE = 2;
    public static final byte ALL_TYPE = 14;
    public static final byte ARTIST_TYPE = 3;
    public static final byte EMPTY_TYPE = 15;
    public static final byte GENRES_TYPE = 4;
    public static final byte MIX_TYPE = 0;
    public static final byte PLAYLIST_TYPE = 5;
    public static final String TAG = "AVRCP_ALBUM";
    public static final byte TITLE_TYPE = 1;
    public static final byte YEAR_TYPE = 6;
    private Context mContext;
    private long mId;
    private long mIdList[];
    private long mIdSubList[];
    private String mNameList[];
    private String mPathArray[];
    private long mSelectId;
    private String mSubAlbumLis[];
    private String mSubArtistLis[];
    private String mSubPathArray[];
    private String mSubTitleLis[];
    private byte mType;

    BTAvrcpBrowseAlbum(long l, Context context, byte byte0)
    {
        mId = 1L;
        mIdList = null;
        mNameList = null;
        mSelectId = 0L;
        mIdSubList = null;
        mSubTitleLis = null;
        mSubArtistLis = null;
        mSubAlbumLis = null;
        mType = 2;
        mId = l;
        mContext = context;
        resetSubFolder();
        mType = byte0;
        mPathArray = new String[2];
        mSubPathArray = new String[3];
        mPathArray[0] = "root";
        mSubPathArray[0] = "root";
        switch (byte0)
        {
        case 0: // '\0'
        case 14: // '\016'
            mPathArray[1] = "All";
            mSubPathArray[1] = "All";
            break;

        case 15: // '\017'
            mPathArray[1] = "Empty";
            mSubPathArray[1] = "Empty";
            break;

        case 2: // '\002'
            mPathArray[1] = "Album";
            mSubPathArray[1] = "Album";
            break;

        case 3: // '\003'
            mPathArray[1] = "Artist";
            mSubPathArray[1] = "Artist";
            break;

        default:
            mPathArray[1] = (new StringBuilder()).append("").append(byte0).toString();
            mSubPathArray[1] = (new StringBuilder()).append("").append(byte0).toString();
            break;
        }
        if (0L == mId)
            Log.e("AVRCP_ALBUM", "[BT][AVRCP] Should not use 0 as Id ");
    }

    private void destroySubFolder()
    {
        mIdList = null;
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

    private long[] updateSongs(Context context)
    {
        mType;
        JVM INSTR lookupswitch 3: default 40
    //                   3: 154
    //                   14: 122
    //                   15: 102;
           goto _L1 _L2 _L3 _L4
_L1:
        Cursor cursor;
        String as2[] = {
            "_id", "album"
        };
        cursor = query(context, android.provider.MediaStore.Audio.Albums.EXTERNAL_CONTENT_URI, as2, null, null, null);
_L14:
        if (cursor == null) goto _L6; else goto _L5
_L5:
        int i = cursor.getCount();
        if (i != 0) goto _L7; else goto _L6
_L6:
        long al[];
        al = null;
        if (cursor != null)
            cursor.close();
_L12:
        return al;
_L4:
        mIdList = new long[0];
        mNameList = new String[0];
        return mIdList;
_L3:
        String as1[] = {
            "_id", "artist"
        };
        cursor = query(context, android.provider.MediaStore.Audio.Artists.EXTERNAL_CONTENT_URI, as1, null, null, null);
        continue; /* Loop/switch isn't completed */
_L2:
        String as[] = {
            "_id", "artist"
        };
        cursor = query(context, android.provider.MediaStore.Audio.Artists.EXTERNAL_CONTENT_URI, as, null, null, null);
        continue; /* Loop/switch isn't completed */
_L7:
        int j = cursor.getCount();
        if (j <= 0) goto _L9; else goto _L8
_L8:
        mIdList = new long[j];
        mNameList = new String[j];
        int k = 0;
_L10:
        if (k >= j)
            break; /* Loop/switch isn't completed */
        cursor.moveToNext();
        mIdList[k] = cursor.getLong(0);
        mNameList[k] = cursor.getString(1);
        k++;
        if (true) goto _L10; else goto _L9
_L9:
        al = mIdList;
        if (cursor == null) goto _L12; else goto _L11
_L11:
        cursor.close();
        return al;
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
        if (true) goto _L14; else goto _L13
_L13:
    }

    private long[] updateSubSongs(Context context, long l)
    {
        String as[] = {
            "_id", "title", "artist", "album"
        };
        mType;
        JVM INSTR lookupswitch 3: default 64
    //                   3: 172
    //                   14: 165
    //                   15: 153;
           goto _L1 _L2 _L3 _L4
_L1:
        String s = (new StringBuilder()).append("album_id=").append(l).append(" AND ").append("is_music").append("=1").toString();
_L8:
        Cursor cursor = query(context, android.provider.MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, as, s, null, "track");
        if (cursor == null) goto _L6; else goto _L5
_L5:
        int i = cursor.getCount();
        if (i != 0) goto _L7; else goto _L6
_L6:
        long al[];
        al = null;
        if (cursor != null)
            cursor.close();
_L13:
        return al;
_L4:
        mIdSubList = new long[0];
        return mIdSubList;
_L3:
        s = "is_music=1";
          goto _L8
_L2:
        s = (new StringBuilder()).append("artist_id=").append(l).append(" AND ").append("is_music").append("=1").toString();
          goto _L8
_L7:
        int j = cursor.getCount();
        if (j <= 0) goto _L10; else goto _L9
_L9:
        mIdSubList = new long[j];
        mSubTitleLis = new String[j];
        mSubArtistLis = new String[j];
        mSubAlbumLis = new String[j];
        int k = 0;
_L14:
        if (k >= j) goto _L10; else goto _L11
_L11:
        cursor.moveToNext();
        mIdSubList[k] = cursor.getLong(0);
        mSubTitleLis[k] = cursor.getString(1);
        mSubArtistLis[k] = cursor.getString(2);
        mSubAlbumLis[k] = cursor.getString(3);
        if (false)
            break MISSING_BLOCK_LABEL_453;
        Object aobj[] = new Object[4];
        aobj[0] = Long.valueOf(cursor.getLong(0));
        aobj[1] = cursor.getString(1);
        aobj[2] = cursor.getString(2);
        aobj[3] = cursor.getString(3);
        Log.v("AVRCP_ALBUM", String.format("[AVRCP][UTIL] id:%d title:%s artist:%s album:%s", aobj));
        break MISSING_BLOCK_LABEL_453;
_L10:
        al = mIdSubList;
        if (cursor == null) goto _L13; else goto _L12
_L12:
        cursor.close();
        return al;
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
        k++;
          goto _L14
    }

    public void buildSubFolder()
    {
        if (mType == 14)
        {
            mSelectId = 1L;
            mIdList = updateSubSongs(mContext, 0L);
            return;
        } else
        {
            mIdList = updateSongs(mContext);
            return;
        }
    }

    public String getAttributeByIndex(int i, int j)
    {
        String s;
        if (0L == mSelectId)
        {
            int l = mIdList.length;
            s = null;
            if (i < l)
                s = mNameList[i];
        } else
        {
            int k = mIdSubList.length;
            s = null;
            if (i < k)
            {
                switch (j)
                {
                case 3: // '\003'
                    return mSubAlbumLis[i];

                case 2: // '\002'
                    return mSubArtistLis[i];

                case 1: // '\001'
                    return mSubTitleLis[i];
                }
                return null;
            }
        }
        return s;
    }

    public String getCategoryName()
    {
        if (mPathArray != null)
            return mPathArray[1];
        else
            return "<unknow>";
    }

    public int getCurPathDepth()
    {
        return mType == 14 || 0L == mSelectId ? 1 : 2;
    }

    public int getCurPathItems()
    {
        if (0L == mSelectId)
        {
            if (mIdList != null)
                return mIdList.length;
        } else
        if (mIdSubList != null)
            return mIdSubList.length;
        return 0;
    }

    public String[] getCurPaths()
    {
        if (0L == mSelectId)
        {
            return mPathArray;
        } else
        {
            mSubPathArray[2] = (new StringBuilder()).append("").append(mSelectId).toString();
            return mSubPathArray;
        }
    }

    public long[] getCurrentList()
    {
        if (0L == mSelectId)
        {
            return mIdList;
        } else
        {
            mSubPathArray[2] = (new StringBuilder()).append("").append(mSelectId).toString();
            return mIdSubList;
        }
    }

    public byte getFolderType()
    {
        return mType;
    }

    public String getItemAttribute(byte byte0, long l, short word0, int i)
    {
        if (i >= 1 && i <= 3)
            if (0L != mSelectId)
            {
                int i1 = 0;
                do
                {
                    if (i1 >= mIdSubList.length)
                        break;
                    if (mIdSubList[i1] == l)
                    {
                        int j1 = i1;
                        switch (i)
                        {
                        case 3: // '\003'
                            return mSubAlbumLis[j1];

                        case 2: // '\002'
                            return mSubArtistLis[j1];

                        case 1: // '\001'
                            return mSubTitleLis[j1];
                        }
                    }
                    i1++;
                } while (true);
            } else
            {
                for (int j = 0; j < mIdList.length; j++)
                    if (mIdList[j] == l)
                    {
                        int k = j;
                        return mNameList[k];
                    }

            }
        return null;
    }

    public String getNameByIndex(int i)
    {
        if (0L == mSelectId)
        {
            if (i < mIdList.length)
                return mNameList[i];
        } else
        {
            switch (mType)
            {
            case 3: // '\003'
                if (i < mIdSubList.length)
                    return mSubArtistLis[i];
                break;

            case 14: // '\016'
                if (i < mIdSubList.length)
                    return mSubTitleLis[i];
                break;

            default:
                if (i < mIdSubList.length)
                    return mSubAlbumLis[i];
                break;
            }
        }
        return null;
    }

    public long getPresentId()
    {
        return mId;
    }

    public byte getType()
    {
        return ((byte)(mType == 14 || 0L != mSelectId ? 3 : 2));
    }

    boolean goDown(long l)
    {
        if (0L != mSelectId)
        {
            Log.v("AVRCP_ALBUM", (new StringBuilder()).append("[BT][AVRCP] goDown reject because has mSelectId:").append(mSelectId).toString());
            return false;
        }
        for (int i = 0; i < mIdList.length; i++)
            if (mIdList[i] == l)
            {
                mSelectId = l;
                updateSubSongs(mContext, l);
                return true;
            }

        Log.v("AVRCP_ALBUM", (new StringBuilder()).append("[BT][AVRCP] goDown fail because not found id:").append(l).toString());
        return false;
    }

    boolean goUp()
    {
        if (0L == mSelectId)
        {
            return false;
        } else
        {
            resetSubFolder();
            return true;
        }
    }

    public boolean isCategoryRoot()
    {
        return mType == 14 || 0L == mSelectId;
    }

    public void resetSubFolder()
    {
        mSelectId = 0L;
        mIdSubList = null;
        mSubTitleLis = null;
        mSubArtistLis = null;
        mSubAlbumLis = null;
        if (mType == 14)
            mSelectId = 1L;
    }
}
