// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.avrcp;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.*;
import android.util.Log;
import android.widget.Toast;

// Referenced classes of package com.mediatek.bluetooth.avrcp:
//            BTAvrcpBrowserSearch, BTAvrcpBrowseAlbum, BluetoothAvrcpService

public class BTAvrcpBrowserAdapter extends Thread
{

    private static final int ACTION_CHANGE_PATH_DOWN = 18;
    private static final int ACTION_CHANGE_PATH_UP = 17;
    private static final int ACTION_GET_ATTR = 19;
    private static final int ACTION_GET_FILELIST = 21;
    private static final int ACTION_NONE = 16;
    private static final int ACTION_SEARCH = 20;
    private static final long ALBUM_FOLDER_ID = 258L;
    private static final long ARTIST_FOLDER_ID = 257L;
    private static final int DELAY_TIME = 0;
    private static final byte FAIL = 1;
    private static final long NO_EXIST_FOLDER = 3855L;
    private static final byte OK = 0;
    private static final long ROOT_FOLDER_ID = 256L;
    public static final byte STATUS_FAIL = 1;
    public static final byte STATUS_OK = 4;
    public static final String TAG = "BWS_AVRCP";
    private static final long TEST_FOLDER_ID = 259L;
    private static final short UNAWARE_UIDCOUNTER = 0;
    private static final short UTF8_CHARSET = 106;
    BTAvrcpBrowseAlbum mAlbumCategory;
    BTAvrcpBrowseAlbum mAllCategory;
    BTAvrcpBrowseAlbum mArtistCategory;
    private BluetoothAvrcpService mAvrcpServ;
    BTAvrcpBrowseAlbum mCategory[];
    BTAvrcpBrowseAlbum mCurCategory;
    private long mCurFakeFolderID;
    private long mCurFolderID;
    private int mCurPathItemNum;
    private String mCurPaths[];
    private boolean mDebug;
    private byte mDepth;
    BTAvrcpBrowseAlbum mEmptyCategory;
    private int mGetFileAttr[];
    private int mGetFileAttrCount;
    private Handler mHandler;
    private boolean mInsideFakeFolder;
    private boolean mIsSearch;
    private String mNowAlbum;
    private String mNowArtist;
    private long mNowId;
    private String mNowTtitle;
    private long mParentID;
    private BTAvrcpBrowserSearch mSearchAdapter;
    private String mSearchAlbum;
    private String mSearchArtist;
    private long mSearchId;
    private long mSearchResultList[];
    private String mSearchText;
    private String mSearchTtitle;
    private volatile Looper mServiceLooper;
    private short mUidCounter;

    BTAvrcpBrowserAdapter(BluetoothAvrcpService bluetoothavrcpservice)
    {
        mInsideFakeFolder = true;
        mParentID = 256L;
        mCurFakeFolderID = 256L;
        mCurFolderID = 256L;
        mUidCounter = 0;
        mCurPathItemNum = 2;
        mDepth = 1;
        mIsSearch = false;
        mNowId = 0L;
        mNowTtitle = null;
        mNowAlbum = null;
        mNowArtist = null;
        mSearchId = 0L;
        mSearchTtitle = null;
        mSearchAlbum = null;
        mSearchArtist = null;
        mCurCategory = null;
        mGetFileAttrCount = 0;
        mGetFileAttr = null;
        mServiceLooper = null;
        mDebug = false;
        mAvrcpServ = bluetoothavrcpservice;
        mIsSearch = false;
        mSearchAdapter = new BTAvrcpBrowserSearch(bluetoothavrcpservice);
        setName("BTAvrcpBrowserAdapterThread");
        mAlbumCategory = new BTAvrcpBrowseAlbum(4097L, mAvrcpServ, (byte)2);
        mArtistCategory = new BTAvrcpBrowseAlbum(4098L, mAvrcpServ, (byte)3);
        mEmptyCategory = new BTAvrcpBrowseAlbum(4099L, mAvrcpServ, (byte)15);
        mAllCategory = new BTAvrcpBrowseAlbum(4100L, mAvrcpServ, (byte)14);
        if (checkPTSMode())
        {
            mCategory = new BTAvrcpBrowseAlbum[4];
            mCategory[0] = mAllCategory;
            mCategory[1] = mArtistCategory;
            mCategory[2] = mAlbumCategory;
            mCategory[3] = mEmptyCategory;
        } else
        {
            mCategory = new BTAvrcpBrowseAlbum[2];
            mCategory[0] = mArtistCategory;
            mCategory[1] = mAlbumCategory;
        }
        mCurCategory = null;
        if (BluetoothAvrcpService.isSupportBrowse())
        {
            start();
            Log.v("BWS_AVRCP", "[BT][AVRCP] AvrcpBrowse start looper");
            return;
        } else
        {
            Log.v("BWS_AVRCP", "[BT][AVRCP] No AvrcpBrowse debug looper");
            return;
        }
    }

    private boolean checkPTSMode()
    {
        return true;
    }

    private static Cursor getCursorById(Context context, long l)
    {
        String as[] = {
            "title", "artist", "album"
        };
        String s = (new StringBuilder()).append("_id=").append(l).append(" AND ").append("is_music").append("=1").toString();
        return query(context, android.provider.MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, as, s, null, "track");
    }

    private void handleChangePath(short word0, byte byte0, long l)
    {
        byte byte1 = 0;
        Log.i("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP] handleChangePath uid_counter:").append(word0).append(" dir:").append(byte0).append(" uid:").append(l).toString());
        boolean flag;
        if (byte0 == 0)
        {
            if (mCurCategory != null)
            {
                if (mCurCategory.isCategoryRoot())
                {
                    mCurCategory = null;
                    mCurPathItemNum = mCategory.length;
                    Log.v("BWS_AVRCP", "[BT][AVRCP][BWS] handleChangePath goUp to catagory");
                    flag = true;
                } else
                {
                    mCurCategory.goUp();
                    if (mCurCategory != null)
                        mCurPathItemNum = mCurCategory.getCurPathItems();
                    else
                        mCurPathItemNum = 0;
                    Log.v("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP][BWS] handleChangePath goUp ok num-of-items:").append(mCurPathItemNum).toString());
                    flag = true;
                    byte1 = 0;
                }
            } else
            {
                byte1 = 7;
                flag = false;
            }
        } else
        if (byte0 == 1)
        {
            if (mCurCategory != null)
            {
                if (mCurCategory.goDown(l))
                {
                    mCurPathItemNum = mCurCategory.getCurPathItems();
                    Log.v("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP][BWS] handleChangePath goDown ok:").append(l).append(" num-of-items:").append(mCurPathItemNum).toString());
                    flag = true;
                    byte1 = 0;
                } else
                {
                    byte1 = 8;
                    Log.w("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP][BWS] handleChangePath mCurCategory.goDown fail uid").append(l).toString());
                    flag = false;
                }
            } else
            {
                int i = 0;
label0:
                do
                {
label1:
                    {
                        int j = mCategory.length;
                        flag = false;
                        if (i < j)
                        {
                            if (l != mCategory[i].getPresentId())
                                break label1;
                            mCurCategory = mCategory[i];
                            mCurCategory.resetSubFolder();
                            mCurCategory.buildSubFolder();
                            if (mCurCategory != null)
                                mCurPathItemNum = mCurCategory.getCurPathItems();
                            else
                                mCurPathItemNum = 0;
                            flag = true;
                            Log.v("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP][BWS] handleChangePath down to category ok:").append(l).append(" num:").append(mCurPathItemNum).toString());
                        }
                        byte1 = 0;
                        if (!flag)
                        {
                            Log.e("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP][BWS] handleChangePath down to ").append(l).append(" fail! cannot found ").toString());
                            byte1 = 9;
                            flag = false;
                        }
                        break label0;
                    }
                    i++;
                } while (true);
            }
        } else
        {
            byte1 = 9;
            flag = false;
        }
        Log.i("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP] changePath final bRet:").append(Boolean.toString(flag)).toString());
        if (flag)
        {
            mAvrcpServ.changePathRspNative((byte)0, byte1, mCurPathItemNum);
            return;
        }
        switch (byte1)
        {
        case 7: // '\007'
        case 8: // '\b'
        case 9: // '\t'
            mAvrcpServ.changePathRspNative(byte1, byte1, mCurPathItemNum);
            return;
        }
        mAvrcpServ.changePathRspNative((byte)9, byte1, mCurPathItemNum);
    }

    private void handleGetFileList(int i, int j, int k, int ai[])
    {
        Log.v("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP][BWS] handleGetFileList start:").append(i).append(" end:").append(j).toString());
        mAvrcpServ.getFileSystemItemStartRspNative();
        if (mCurCategory != null)
        {
            long al[] = mCurCategory.getCurrentList();
            int l1 = 0;
            if (al != null)
                l1 = al.length;
            if (al != null && i < l1)
            {
                if (al.length == 0)
                {
                    mAvrcpServ.getFileSystemItemEndRspNative((byte)1, (byte)11, mUidCounter);
                    return;
                }
                Object aobj3[] = new Object[3];
                aobj3[0] = Integer.valueOf(i);
                aobj3[1] = Integer.valueOf(j);
                aobj3[2] = Integer.valueOf(l1);
                Log.v("BWS_AVRCP", String.format("[BT][AVRCP] handleGetFileList start:%d end:%d list.length:%d", aobj3));
                if (j >= l1)
                    j = l1 - 1;
                switch (mCurCategory.getType())
                {
                case 3: // '\003'
                    int k2 = 1 + (j - i);
                    for (int l2 = i; l2 <= j; l2++)
                    {
                        byte byte0 = 0;
                        for (int i3 = 0; i3 < k; i3++)
                        {
                            BTAvrcpBrowseAlbum btavrcpbrowsealbum = mCurCategory;
                            int j3 = ai[i3];
                            String s3 = btavrcpbrowsealbum.getAttributeByIndex(l2, j3);
                            if (s3 != null)
                            {
                                short word3 = (short)s3.length();
                                mAvrcpServ.getFileSystemItemFileAttrRspNative((byte)0, (byte)(l2 - i), byte0, ai[i3], (short)106, word3, s3);
                                byte0++;
                            }
                        }

                        String s2 = mCurCategory.getNameByIndex(l2);
                        short word2;
                        if (s2 != null)
                            word2 = (short)s2.length();
                        else
                            word2 = 0;
                        mAvrcpServ.getFileSystemItemFileRspNative((byte)0, (byte)(l2 - i), (byte)k2, al[l2], (byte)0, (short)106, word2, s2);
                    }

                    mAvrcpServ.getFileSystemItemEndRspNative((byte)0, (byte)0, mUidCounter);
                    return;

                case 2: // '\002'
                    int i2 = 1 + (j - i);
                    for (int j2 = i; j2 <= j; j2++)
                    {
                        String s1 = mCurCategory.getNameByIndex(j2);
                        short word1;
                        if (s1 != null)
                            word1 = (short)s1.length();
                        else
                            word1 = 0;
                        mAvrcpServ.getFileSystemItemFolderRspNative((byte)0, (byte)(j2 - i), (byte)i2, al[j2], mCurCategory.getFolderType(), (byte)0, (short)106, word1, s1);
                    }

                    mAvrcpServ.getFileSystemItemEndRspNative((byte)0, (byte)0, mUidCounter);
                    return;
                }
                Log.e("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP]  mCurCategory.getType Wrong ").append(mCurCategory.getType()).toString());
                mAvrcpServ.getFileSystemItemEndRspNative((byte)1, (byte)1, mUidCounter);
                return;
            } else
            {
                Object aobj2[] = new Object[2];
                aobj2[0] = Integer.valueOf(i);
                aobj2[1] = Integer.valueOf(l1);
                Log.v("BWS_AVRCP", String.format("[BT][AVRCP] handleGetFileList  out-of-bound start:%d list.length:%d", aobj2));
                mAvrcpServ.getFileSystemItemEndRspNative((byte)1, (byte)11, mUidCounter);
                return;
            }
        }
        if (i > mCategory.length)
        {
            Object aobj1[] = new Object[2];
            aobj1[0] = Integer.valueOf(i);
            aobj1[1] = Integer.valueOf(mCategory.length);
            Log.e("BWS_AVRCP", String.format("[BT][AVRCP] handleGetFileList out-of-bound start:%d mCategory.length:%d", aobj1));
            mAvrcpServ.getFileSystemItemEndRspNative((byte)1, (byte)11, mUidCounter);
            return;
        }
        int l = mCategory.length;
        if (j >= l)
            j = -1 + mCategory.length;
        int i1 = 1 + (j - i);
        for (int j1 = i; j1 <= j; j1++)
        {
            int k1 = mCategory.length;
            if (j1 >= k1)
            {
                Object aobj[] = new Object[2];
                aobj[0] = Integer.valueOf(j1);
                aobj[1] = Integer.valueOf(mCategory.length);
                Log.e("BWS_AVRCP", String.format("[BT][AVRCP][ERR] Out-of-Array mCategory.length:%d", aobj));
                mAvrcpServ.getFileSystemItemEndRspNative((byte)1, (byte)11, mUidCounter);
                return;
            }
            String s = mCategory[j1].getCategoryName();
            short word0 = (short)s.length();
            mAvrcpServ.getFileSystemItemFolderRspNative((byte)0, (byte)(j1 - i), (byte)i1, mCategory[j1].getPresentId(), (byte)2, (byte)0, (short)106, word0, s);
        }

        mAvrcpServ.getFileSystemItemEndRspNative((byte)0, (byte)0, mUidCounter);
    }

    private void handleSearch(String s)
    {
        int i = 3;
        Log.i("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP] handleSearch ").append(s).toString());
        if (!mIsSearch)
        {
            Log.i("BWS_AVRCP", "[BT][AVRCP] isSearch false. No return result ");
            return;
        }
        if (s.length() == 0)
        {
            Log.e("BWS_AVRCP", "[BT][AVRCP][WRN] handleSearch request empty string !");
            mAvrcpServ.searchRspNative((byte)0, (byte)4, (short)0, 0);
            mIsSearch = false;
            return;
        }
        if (mSearchAdapter != null)
            i = mSearchAdapter.search(s);
        mIsSearch = false;
        mAvrcpServ.searchRspNative((byte)0, (byte)4, (short)0, i);
    }

    private static Cursor query(Context context, Uri uri, String as[], String s, String as1[], String s1)
    {
        return query(context, uri, as, s, as1, s1, 0);
    }

    private static Cursor query(Context context, Uri uri, String as[], String s, String as1[], String s1, int i)
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
            break MISSING_BLOCK_LABEL_53;
        uri = uri.buildUpon().appendQueryParameter("limit", (new StringBuilder()).append("").append(i).toString()).build();
        cursor = contentresolver.query(uri, as, s, as1, s1);
        return cursor;
    }

    private boolean sendMyselfMsg(int i, int j, int k)
    {
        if (mHandler == null)
        {
            return false;
        } else
        {
            Message message = mHandler.obtainMessage();
            message.what = i;
            message.arg1 = j;
            message.arg2 = k;
            return mHandler.sendMessageDelayed(message, 0L);
        }
    }

    private boolean sendMyselfMsg(int i, String s)
    {
        if (mHandler != null)
        {
            Message message = mHandler.obtainMessage();
            message.what = i;
            message.obj = s;
            return mHandler.sendMessageDelayed(message, 0L);
        } else
        {
            return false;
        }
    }

    private boolean updateNowSongId(long l)
    {
        Cursor cursor;
        cursor = getCursorById(mAvrcpServ, l);
        Log.v("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP][BWS] updateNowSongId ").append(l).toString());
        if (cursor != null) goto _L2; else goto _L1
_L1:
        Log.w("BWS_AVRCP", "[BT][AVRCP] updateNowSongId got null");
_L4:
        return false;
_L2:
        if (cursor == null)
            continue; /* Loop/switch isn't completed */
        if (cursor.getCount() <= 0)
            break MISSING_BLOCK_LABEL_196;
        cursor.moveToNext();
        mNowTtitle = null;
        mNowArtist = null;
        mNowAlbum = null;
        mNowTtitle = cursor.getString(0);
        mNowArtist = cursor.getString(1);
        mNowAlbum = cursor.getString(2);
        mNowId = l;
        Log.v("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP] updateNowSongId '").append(mNowTtitle).append("' '").append(mNowArtist).append("' '").append(mNowAlbum).append("'").toString());
        if (cursor != null)
            cursor.close();
        return true;
        Log.e("BWS_AVRCP", "[BT][AVRCP] query and get empty result !");
        if (cursor == null) goto _L4; else goto _L3
_L3:
        cursor.close();
        return false;
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
    }

    private boolean updateSearchSongId(long l)
    {
        Cursor cursor;
        cursor = getCursorById(mAvrcpServ, l);
        Log.v("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP][BWS] updateSearchSongId ").append(l).toString());
        if (cursor != null) goto _L2; else goto _L1
_L1:
        Log.w("BWS_AVRCP", "[BT][AVRCP] updateSearchSongId got null");
_L4:
        return false;
_L2:
        if (cursor == null)
            continue; /* Loop/switch isn't completed */
        if (cursor.getCount() <= 0)
            break MISSING_BLOCK_LABEL_196;
        cursor.moveToNext();
        mSearchTtitle = null;
        mSearchArtist = null;
        mSearchAlbum = null;
        mSearchTtitle = cursor.getString(0);
        mSearchArtist = cursor.getString(1);
        mSearchAlbum = cursor.getString(2);
        mSearchId = l;
        Log.v("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP] updateSearchSongId '").append(mSearchTtitle).append("' '").append(mSearchArtist).append("' '").append(mSearchAlbum).append("'").toString());
        if (cursor != null)
            cursor.close();
        return true;
        Log.e("BWS_AVRCP", "[BT][AVRCP] query and get empty result !");
        if (cursor == null) goto _L4; else goto _L3
_L3:
        cursor.close();
        return false;
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
    }

    public boolean changePath(short word0, byte byte0, long l)
    {
        if (word0 != 0)
        {
            Log.i("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP] changePath fail to  uid_counter:").append(word0).toString());
        } else
        {
            if (word0 == 0 && l == 0L && byte0 != 0)
            {
                Log.i("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP] changePath fail  uid_counter:").append(word0).append(" dir:").append(byte0).append(" uid:").append(l).toString());
                return false;
            }
            if (byte0 == 1)
            {
                sendMyselfMsg(18, Long.toString(l));
                return true;
            }
            if (byte0 == 0)
            {
                sendMyselfMsg(17, Long.toString(l));
                return true;
            }
        }
        return false;
    }

    public boolean checkSongIdExisted(long l)
    {
        Cursor cursor = getCursorById(mAvrcpServ, l);
        boolean flag;
        if (l == 0L)
            flag = true;
        else
        if (cursor == null)
        {
            flag = false;
        } else
        {
            int i = cursor.getCount();
            flag = false;
            if (i > 0)
                flag = true;
        }
        if (cursor != null)
            cursor.close();
        return flag;
    }

    public void deinit()
    {
        if (mServiceLooper != null)
        {
            mServiceLooper.quit();
            mServiceLooper = null;
        }
        if (mHandler == null)
            break MISSING_BLOCK_LABEL_46;
        Log.v("BWS_AVRCP", "[BT][AVRCP] mHandler is existed. call join");
        interrupt();
        join(100L);
        return;
        InterruptedException interruptedexception;
        interruptedexception;
        Log.v("BWS_AVRCP", "[BT][AVRCP] join fail");
        return;
    }

    public byte getCurPathDepth()
    {
        if (mCurCategory == null)
            mDepth = 1;
        else
            mDepth = (byte)(1 + mCurCategory.getCurPathDepth());
        Log.v("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP] getCurPathDepth mDepth:").append(mDepth).toString());
        return mDepth;
    }

    public int getCurPathItems()
    {
        if (mCurCategory == null)
            mCurPathItemNum = mCategory.length;
        else
            mCurPathItemNum = mCurCategory.getCurPathItems();
        Log.v("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP] getCurPathItems mCurPathItemNum:").append(mCurPathItemNum).toString());
        return mCurPathItemNum;
    }

    public String[] getCurPaths()
    {
        if (mCurCategory != null)
            return mCurCategory.getCurPaths();
        if (mCurPaths == null)
        {
            mCurPaths = new String[1];
            mCurPaths[0] = "root";
        }
        return mCurPaths;
    }

    public boolean getFileSystemitemsList(int i, int j, byte byte0, int ai[])
    {
        mGetFileAttrCount = byte0;
        mGetFileAttr = ai;
        sendMyselfMsg(21, i, j);
        return true;
    }

    String getItemAttribute(byte byte0, long l, short word0, int i)
    {
        String s;
label0:
        {
label1:
            {
label2:
                {
                    if (word0 != 0)
                        Log.e("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP] getItemAttribute wrong uid_counter").append(word0).toString());
                    else
                        switch (byte0)
                        {
                        default:
                            break label1;

                        case 0: // '\0'
                            break label2;

                        case 2: // '\002'
                            if (l == mSearchId)
                            {
                                s = null;
                                switch (i)
                                {
                                case 3: // '\003'
                                    s = mSearchAlbum;
                                    break;

                                case 2: // '\002'
                                    s = mSearchArtist;
                                    break;

                                case 1: // '\001'
                                    s = mSearchTtitle;
                                    break;
                                }
                                Log.i("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP] getItemAttribute ret:").append(s).toString());
                            } else
                            {
                                Log.e("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP] fail to updateSearchSongId ! id:").append(l).toString());
                                s = null;
                            }
                            break label0;

                        case 1: // '\001'
                            if (mCurCategory != null)
                                return mCurCategory.getItemAttribute(byte0, l, word0, i);
                            break;
                        }
                    return null;
                }
                return "Player";
            }
            if (l != mNowId)
                updateNowSongId(l);
            if (l == mNowId)
            {
                s = null;
                switch (i)
                {
                case 3: // '\003'
                    s = mNowAlbum;
                    break;

                case 2: // '\002'
                    s = mNowArtist;
                    break;

                case 1: // '\001'
                    s = mNowTtitle;
                    break;
                }
            } else
            {
                Log.e("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP] fail to updateNowSongId ! id:").append(l).toString());
                s = null;
            }
        }
        return s;
    }

    String getSearchedItemAttribute(int i, int j)
    {
        switch (j)
        {
        case 3: // '\003'
            return mSearchAdapter.getSearchedAlbumString(i);

        case 2: // '\002'
            return mSearchAdapter.getSearchedArtistString(i);

        case 1: // '\001'
            return mSearchAdapter.getSearchedTitleString(i);
        }
        return null;
    }

    public long[] getSearchedList()
    {
        mSearchResultList = mSearchAdapter.getSearchedList();
        return mSearchResultList;
    }

    public short getUidCounter()
    {
        return mUidCounter;
    }

    public boolean isItemExist(byte byte0, long l, short word0)
    {
        return word0 == 0;
    }

    public boolean isSearch()
    {
        return mIsSearch;
    }

    public void onConnect()
    {
        Log.v("BWS_AVRCP", "[BT][AVRCP] onConnect");
        if (mCurCategory != null)
        {
            mCurCategory.resetSubFolder();
            mCurCategory = null;
        }
        if (!BluetoothAvrcpService.sSupportBrowse)
            Log.v("BWS_AVRCP", "[BT][AVRCP] No Support Avrcp Browse feature");
        mIsSearch = false;
    }

    public void onDisconnect()
    {
        Log.v("BWS_AVRCP", "[BT][AVRCP] onDisconnect");
    }

    public void onSelect()
    {
        Log.v("BWS_AVRCP", "[BT][AVRCP] OnSelect ");
    }

    public void onUnselect()
    {
        Log.v("BWS_AVRCP", "[BT][AVRCP] OnUnselect ");
    }

    public void passToHandleMessage(Message message)
    {
        Object aobj[] = new Object[3];
        aobj[0] = Integer.valueOf(message.what);
        aobj[1] = Integer.valueOf(message.arg1);
        aobj[2] = Integer.valueOf(message.arg2);
        String s = String.format("[BT][AVRCP] AVRCPBrowser Receive a msg.what:%d msg.arg1:%d msg.arg2:%d ", aobj);
        Object aobj1[] = new Object[1];
        aobj1[0] = Integer.valueOf(message.what);
        Log.i("BWS_AVRCP", String.format("[BT][AVRCP] AVRCPBWS passToHandleMessage what:%d", aobj1));
        if (BluetoothAvrcpService.sDebugMsg)
            Toast.makeText(mAvrcpServ, s, 1).show();
        switch (message.what)
        {
        case 21: // '\025'
            handleGetFileList(message.arg1, message.arg2, mGetFileAttrCount, mGetFileAttr);
            return;

        case 20: // '\024'
            handleSearch(mSearchText);
            return;

        case 18: // '\022'
            long l1 = Long.valueOf((String)message.obj).longValue();
            Log.i("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP] compose down id:").append(l1).toString());
            handleChangePath((short)0, (byte)1, l1);
            return;

        case 17: // '\021'
            long l = Long.valueOf((String)message.obj).longValue();
            Log.i("BWS_AVRCP", (new StringBuilder()).append("[BT][AVRCP] compose up id:").append(l).toString());
            handleChangePath((short)0, (byte)0, l);
            return;

        case 19: // '\023'
        default:
            Toast.makeText(mAvrcpServ, "[BT][AVRCP][BWS]no Handle msg !", 1).show();
            // fall through

        case 16: // '\020'
            return;
        }
    }

    public boolean registerNotification(byte byte0, int i)
    {
        return false;
    }

    public void run()
    {
        Log.v("BWS_AVRCP", "[BT][AVRCP] browse run");
        Looper.prepare();
        Log.v("BWS_AVRCP", "[BT][AVRCP] browse run prepare ");
        mServiceLooper = Looper.myLooper();
        mHandler = new Handler() {

            final BTAvrcpBrowserAdapter this$0;

            public void handleMessage(Message message)
            {
                passToHandleMessage(message);
            }

            
            {
                this$0 = BTAvrcpBrowserAdapter.this;
                super();
            }
        }
;
        Looper.loop();
        mHandler = null;
    }

    public boolean search(String s)
    {
        Log.i("BWS_AVRCP", "[BT][AVRCP] search");
        if (s == null || "".equals(s))
            return false;
        if (mIsSearch)
        {
            Log.i("BWS_AVRCP", "[BT][AVRCP] search is in progress");
            return false;
        }
        if (BluetoothAvrcpService.sSupportBrowse)
        {
            if (isAlive())
            {
                Log.v("BWS_AVRCP", "[BT][AVRCP] check isAlive");
            } else
            {
                yield();
                try
                {
                    sleep(10000L);
                }
                catch (InterruptedException interruptedexception)
                {
                    Log.v("BWS_AVRCP", "[BT][AVRCP] sleep fail");
                }
                Log.i("BWS_AVRCP", "[BT][AVRCP] delay search 10000");
            }
            if (isAlive())
            {
                mIsSearch = true;
                mSearchText = s;
                sendMyselfMsg(20, 0, 0);
                return true;
            } else
            {
                Log.i("BWS_AVRCP", "[BT][AVRCP] Thread not start yets!");
                return false;
            }
        } else
        {
            Log.i("BWS_AVRCP", "[BT][AVRCP] search fail because bSupportBrowse is false");
            return false;
        }
    }
}
