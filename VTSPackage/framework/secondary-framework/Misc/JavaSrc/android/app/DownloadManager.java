// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.*;
import android.database.Cursor;
import android.database.CursorWrapper;
import android.net.Uri;
import android.os.Environment;
import android.os.ParcelFileDescriptor;
import android.text.TextUtils;
import android.util.Pair;
import com.mediatek.xlog.Xlog;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;

public class DownloadManager
{
    private static class CursorTranslator extends CursorWrapper
    {

        static final boolean $assertionsDisabled;
        private Uri mBaseUri;

        private long getErrorCode(int i)
        {
            if ((400 > i || i >= 488) && (500 > i || i >= 600))
            {
                switch (i)
                {
                case 498: 
                    return 1010L;

                case 488: 
                    return 1009L;

                case 489: 
                    return 1008L;

                case 199: 
                    return 1007L;

                case 198: 
                    return 1006L;

                case 497: 
                    return 1005L;

                case 495: 
                    return 1004L;

                case 493: 
                case 494: 
                    return 1002L;

                case 492: 
                    return 1001L;
                }
                return 1000L;
            } else
            {
                return (long)i;
            }
        }

        private String getLocalUri()
        {
            long l = getLong(getColumnIndex("destination"));
            if (l != 4L && l != 0L && l != 6L)
            {
                long l1 = getLong(getColumnIndex("_id"));
                return ContentUris.withAppendedId(mBaseUri, l1).toString();
            }
            String s = getString(getColumnIndex("local_filename"));
            if (s == null)
                return null;
            else
                return Uri.fromFile(new File(s)).toString();
        }

        private long getPausedReason(int i)
        {
            switch (i)
            {
            case 193: 
                return 5L;

            case 196: 
                return 3L;

            case 195: 
                return 2L;

            case 194: 
                return 1L;
            }
            return 4L;
        }

        private long getReason(int i)
        {
            switch (translateStatus(i))
            {
            case 4: // '\004'
                return getPausedReason(i);

            case 16: // '\020'
                return getErrorCode(i);
            }
            return 0L;
        }

        private int translateStatus(int i)
        {
            switch (i)
            {
            case 200: 
                return 8;

            case 193: 
            case 194: 
            case 195: 
            case 196: 
                return 4;

            case 192: 
                return 2;

            case 190: 
                return 1;
            }
            if (!$assertionsDisabled && !android.provider.Downloads.Impl.isStatusError(i))
                throw new AssertionError();
            else
                return 16;
        }

        public int getInt(int i)
        {
            return (int)getLong(i);
        }

        public long getLong(int i)
        {
            if (getColumnName(i).equals("reason"))
                return getReason(super.getInt(getColumnIndex("status")));
            if (getColumnName(i).equals("status"))
                return (long)translateStatus(super.getInt(getColumnIndex("status")));
            else
                return super.getLong(i);
        }

        public String getString(int i)
        {
            if (getColumnName(i).equals("local_uri"))
                return getLocalUri();
            else
                return super.getString(i);
        }

        static 
        {
            boolean flag;
            if (!android/app/DownloadManager.desiredAssertionStatus())
                flag = true;
            else
                flag = false;
            $assertionsDisabled = flag;
        }

        public CursorTranslator(Cursor cursor, Uri uri)
        {
            super(cursor);
            mBaseUri = uri;
        }
    }

    public static class Query
    {

        public static final int ORDER_ASCENDING = 1;
        public static final int ORDER_DESCENDING = 2;
        private long mIds[];
        private boolean mOnlyIncludeVisibleInDownloadsUi;
        private String mOrderByColumn;
        private int mOrderDirection;
        private Integer mStatusFlags;

        private String joinStrings(String s, Iterable iterable)
        {
            StringBuilder stringbuilder = new StringBuilder();
            boolean flag = true;
            for (Iterator iterator = iterable.iterator(); iterator.hasNext();)
            {
                String s1 = (String)iterator.next();
                if (!flag)
                    stringbuilder.append(s);
                stringbuilder.append(s1);
                flag = false;
            }

            return stringbuilder.toString();
        }

        private String statusClause(String s, int i)
        {
            return (new StringBuilder()).append("status").append(s).append("'").append(i).append("'").toString();
        }

        public Query orderBy(String s, int i)
        {
label0:
            {
                if (i != 1 && i != 2)
                    throw new IllegalArgumentException((new StringBuilder()).append("Invalid direction: ").append(i).toString());
                if (s.equals("last_modified_timestamp"))
                {
                    mOrderByColumn = "lastmod";
                } else
                {
                    if (!s.equals("total_size"))
                        break label0;
                    mOrderByColumn = "total_bytes";
                }
                mOrderDirection = i;
                return this;
            }
            throw new IllegalArgumentException((new StringBuilder()).append("Cannot order by ").append(s).toString());
        }

        Cursor runQuery(ContentResolver contentresolver, String as[], Uri uri)
        {
            ArrayList arraylist = new ArrayList();
            long al[] = mIds;
            String as1[] = null;
            if (al != null)
            {
                arraylist.add(DownloadManager.getWhereClauseForIds(mIds));
                as1 = DownloadManager.getWhereArgsForIds(mIds);
            }
            if (mStatusFlags != null)
            {
                ArrayList arraylist1 = new ArrayList();
                if ((1 & mStatusFlags.intValue()) != 0)
                    arraylist1.add(statusClause("=", 190));
                if ((2 & mStatusFlags.intValue()) != 0)
                    arraylist1.add(statusClause("=", 192));
                if ((4 & mStatusFlags.intValue()) != 0)
                {
                    arraylist1.add(statusClause("=", 193));
                    arraylist1.add(statusClause("=", 194));
                    arraylist1.add(statusClause("=", 195));
                    arraylist1.add(statusClause("=", 196));
                }
                if ((8 & mStatusFlags.intValue()) != 0)
                    arraylist1.add(statusClause("=", 200));
                if ((0x10 & mStatusFlags.intValue()) != 0)
                    arraylist1.add((new StringBuilder()).append("(").append(statusClause(">=", 400)).append(" AND ").append(statusClause("<", 600)).append(")").toString());
                arraylist.add(joinStrings(" OR ", arraylist1));
            }
            if (mOnlyIncludeVisibleInDownloadsUi)
                arraylist.add("is_visible_in_downloads_ui != '0'");
            arraylist.add("deleted != '1'");
            String s = joinStrings(" AND ", arraylist);
            String s1;
            if (mOrderDirection == 1)
                s1 = "ASC";
            else
                s1 = "DESC";
            return contentresolver.query(uri, as, s, as1, (new StringBuilder()).append(mOrderByColumn).append(" ").append(s1).toString());
        }

        public transient Query setFilterById(long al[])
        {
            mIds = al;
            return this;
        }

        public Query setFilterByStatus(int i)
        {
            mStatusFlags = Integer.valueOf(i);
            return this;
        }

        public Query setOnlyIncludeVisibleInDownloadsUi(boolean flag)
        {
            mOnlyIncludeVisibleInDownloadsUi = flag;
            return this;
        }

        public Query()
        {
            mIds = null;
            mStatusFlags = null;
            mOrderByColumn = "lastmod";
            mOrderDirection = 2;
            mOnlyIncludeVisibleInDownloadsUi = false;
        }
    }

    public static class Request
    {

        static final boolean $assertionsDisabled = false;
        public static final int NETWORK_BLUETOOTH = 4;
        public static final int NETWORK_MOBILE = 1;
        public static final int NETWORK_WIFI = 2;
        private static final int SCANNABLE_VALUE_NO = 2;
        private static final int SCANNABLE_VALUE_YES = 0;
        public static final int VISIBILITY_HIDDEN = 2;
        public static final int VISIBILITY_VISIBLE = 0;
        public static final int VISIBILITY_VISIBLE_NOTIFY_COMPLETED = 1;
        public static final int VISIBILITY_VISIBLE_NOTIFY_ONLY_COMPLETION = 3;
        private int mAllowedNetworkTypes;
        private CharSequence mDescription;
        private Uri mDestinationUri;
        private boolean mIsVisibleInDownloadsUi;
        private boolean mMeteredAllowed;
        private String mMimeType;
        private int mNotificationVisibility;
        private List mRequestHeaders;
        private boolean mRoamingAllowed;
        private boolean mScannable;
        private CharSequence mTitle;
        private Uri mUri;
        private boolean mUseSystemCache;
        private String mUserAgent;

        private void encodeHttpHeaders(ContentValues contentvalues)
        {
            int i = 0;
            for (Iterator iterator = mRequestHeaders.iterator(); iterator.hasNext();)
            {
                Pair pair = (Pair)iterator.next();
                String s = (new StringBuilder()).append((String)pair.first).append(": ").append((String)pair.second).toString();
                contentvalues.put((new StringBuilder()).append("http_header_").append(i).toString(), s);
                i++;
            }

        }

        private void putIfNonNull(ContentValues contentvalues, String s, Object obj)
        {
            if (obj != null)
                contentvalues.put(s, obj.toString());
        }

        private void setDestinationFromBase(File file, String s)
        {
            if (s == null)
            {
                throw new NullPointerException("subPath cannot be null");
            } else
            {
                mDestinationUri = Uri.withAppendedPath(Uri.fromFile(file), s);
                Xlog.v("DownloadManager/Framework", (new StringBuilder()).append("setDestinationFromBase: mDestinationUri ").append(mDestinationUri).toString());
                return;
            }
        }

        public Request addRequestHeader(String s, String s1)
        {
            if (s == null)
                throw new NullPointerException("header cannot be null");
            if (s.contains(":"))
                throw new IllegalArgumentException("header may not contain ':'");
            if (s1 == null)
                s1 = "";
            mRequestHeaders.add(Pair.create(s, s1));
            return this;
        }

        public void allowScanningByMediaScanner()
        {
            mScannable = true;
        }

        public Request setAllowedNetworkTypes(int i)
        {
            mAllowedNetworkTypes = i;
            return this;
        }

        public Request setAllowedOverMetered(boolean flag)
        {
            mMeteredAllowed = flag;
            return this;
        }

        public Request setAllowedOverRoaming(boolean flag)
        {
            mRoamingAllowed = flag;
            return this;
        }

        public Request setDescription(CharSequence charsequence)
        {
            mDescription = charsequence;
            return this;
        }

        public Request setDestinationInExternalFilesDir(Context context, String s, String s1)
        {
            setDestinationFromBase(context.getExternalFilesDir(s), s1);
            return this;
        }

        public Request setDestinationInExternalPublicDir(String s, String s1)
        {
            File file = Environment.getExternalStoragePublicDirectory(s);
            Xlog.v("DownloadManager/Framework", (new StringBuilder()).append("setExternalPublicDir: dirType ").append(s).append(" subPath ").append(s1).append("file").append(file).toString());
            if (file.exists())
            {
                if (!file.isDirectory())
                    throw new IllegalStateException((new StringBuilder()).append(file.getAbsolutePath()).append(" already exists and is not a directory").toString());
            } else
            if (!file.mkdir())
                throw new IllegalStateException((new StringBuilder()).append("Unable to create directory: ").append(file.getAbsolutePath()).toString());
            setDestinationFromBase(file, s1);
            return this;
        }

        public Request setDestinationToSystemCache()
        {
            mUseSystemCache = true;
            return this;
        }

        public Request setDestinationUri(Uri uri)
        {
            mDestinationUri = uri;
            Xlog.v("DownloadManager/Framework", (new StringBuilder()).append("setDestinationUri: mDestinationUri ").append(mDestinationUri).toString());
            return this;
        }

        public Request setMimeType(String s)
        {
            mMimeType = s;
            return this;
        }

        public Request setNotificationVisibility(int i)
        {
            mNotificationVisibility = i;
            return this;
        }

        public Request setShowRunningNotification(boolean flag)
        {
            if (flag)
                return setNotificationVisibility(0);
            else
                return setNotificationVisibility(2);
        }

        public Request setTitle(CharSequence charsequence)
        {
            mTitle = charsequence;
            return this;
        }

        public Request setUserAgent(String s)
        {
            mUserAgent = s;
            Xlog.v("DownloadManager/Framework", (new StringBuilder()).append("setUserAgent: userAgent is: ").append(s).toString());
            return this;
        }

        public Request setVisibleInDownloadsUi(boolean flag)
        {
            mIsVisibleInDownloadsUi = flag;
            return this;
        }

        ContentValues toContentValues(String s)
        {
            byte byte0 = 2;
            ContentValues contentvalues = new ContentValues();
            if (!$assertionsDisabled && mUri == null)
                throw new AssertionError();
            contentvalues.put("uri", mUri.toString());
            contentvalues.put("is_public_api", Boolean.valueOf(true));
            contentvalues.put("notificationpackage", s);
            if (mDestinationUri != null)
            {
                contentvalues.put("destination", Integer.valueOf(4));
                contentvalues.put("hint", mDestinationUri.toString());
            } else
            {
                byte byte1;
                if (mUseSystemCache)
                    byte1 = 5;
                else
                    byte1 = byte0;
                contentvalues.put("destination", Integer.valueOf(byte1));
            }
            if (mScannable)
                byte0 = 0;
            contentvalues.put("scanned", Integer.valueOf(byte0));
            if (!mRequestHeaders.isEmpty())
                encodeHttpHeaders(contentvalues);
            putIfNonNull(contentvalues, "title", mTitle);
            putIfNonNull(contentvalues, "description", mDescription);
            putIfNonNull(contentvalues, "mimetype", mMimeType);
            contentvalues.put("visibility", Integer.valueOf(mNotificationVisibility));
            contentvalues.put("allowed_network_types", Integer.valueOf(mAllowedNetworkTypes));
            contentvalues.put("allow_roaming", Boolean.valueOf(mRoamingAllowed));
            contentvalues.put("allow_metered", Boolean.valueOf(mMeteredAllowed));
            contentvalues.put("is_visible_in_downloads_ui", Boolean.valueOf(mIsVisibleInDownloadsUi));
            if (mUserAgent != null)
                contentvalues.put("useragent", mUserAgent);
            return contentvalues;
        }

        static 
        {
            boolean flag;
            if (!android/app/DownloadManager.desiredAssertionStatus())
                flag = true;
            else
                flag = false;
            $assertionsDisabled = flag;
        }

        public Request(Uri uri)
        {
            mRequestHeaders = new ArrayList();
            mAllowedNetworkTypes = -1;
            mRoamingAllowed = true;
            mMeteredAllowed = true;
            mIsVisibleInDownloadsUi = true;
            mScannable = false;
            mUseSystemCache = false;
            mNotificationVisibility = 0;
            if (uri == null)
                throw new NullPointerException();
            String s = uri.getScheme();
            if (s != null && (s.equals("http") || s.equals("https")))
            {
                mUri = uri;
                return;
            } else
            {
                throw new IllegalArgumentException((new StringBuilder()).append("Can only download HTTP/HTTPS URIs: ").append(uri).toString());
            }
        }

        Request(String s)
        {
            mRequestHeaders = new ArrayList();
            mAllowedNetworkTypes = -1;
            mRoamingAllowed = true;
            mMeteredAllowed = true;
            mIsVisibleInDownloadsUi = true;
            mScannable = false;
            mUseSystemCache = false;
            mNotificationVisibility = 0;
            mUri = Uri.parse(s);
        }
    }


    public static final String ACTION_DOWNLOAD_COMPLETE = "android.intent.action.DOWNLOAD_COMPLETE";
    public static final String ACTION_NOTIFICATION_CLICKED = "android.intent.action.DOWNLOAD_NOTIFICATION_CLICKED";
    public static final String ACTION_VIEW_DOWNLOADS = "android.intent.action.VIEW_DOWNLOADS";
    public static final String COLUMN_BYTES_DOWNLOADED_SO_FAR = "bytes_so_far";
    public static final String COLUMN_DESCRIPTION = "description";
    public static final String COLUMN_ID = "_id";
    public static final String COLUMN_LAST_MODIFIED_TIMESTAMP = "last_modified_timestamp";
    public static final String COLUMN_LOCAL_FILENAME = "local_filename";
    public static final String COLUMN_LOCAL_URI = "local_uri";
    public static final String COLUMN_MEDIAPROVIDER_URI = "mediaprovider_uri";
    public static final String COLUMN_MEDIA_TYPE = "media_type";
    public static final String COLUMN_REASON = "reason";
    public static final String COLUMN_STATUS = "status";
    public static final String COLUMN_TITLE = "title";
    public static final String COLUMN_TOTAL_SIZE_BYTES = "total_size";
    public static final String COLUMN_URI = "uri";
    public static final int ERROR_BLOCKED = 1010;
    public static final int ERROR_CANNOT_RESUME = 1008;
    public static final int ERROR_DEVICE_NOT_FOUND = 1007;
    public static final int ERROR_FILE_ALREADY_EXISTS = 1009;
    public static final int ERROR_FILE_ERROR = 1001;
    public static final int ERROR_HTTP_DATA_ERROR = 1004;
    public static final int ERROR_INSUFFICIENT_SPACE = 1006;
    public static final int ERROR_INVALID_DESCRIPTOR = 1011;
    public static final int ERROR_TOO_MANY_REDIRECTS = 1005;
    public static final int ERROR_UNHANDLED_HTTP_CODE = 1002;
    public static final int ERROR_UNKNOWN = 1000;
    public static final String EXTRA_DOWNLOAD_ID = "extra_download_id";
    public static final String EXTRA_NOTIFICATION_CLICK_DOWNLOAD_IDS = "extra_click_download_ids";
    public static final String INTENT_EXTRAS_SORT_BY_SIZE = "android.app.DownloadManager.extra_sortBySize";
    public static final String MEDIA_SCANNED = "scanned";
    private static final String NON_DOWNLOADMANAGER_DOWNLOAD = "non-dwnldmngr-download-dont-retry2download";
    public static final int PAUSED_BY_APP = 5;
    public static final int PAUSED_QUEUED_FOR_WIFI = 3;
    public static final int PAUSED_UNKNOWN = 4;
    public static final int PAUSED_WAITING_FOR_NETWORK = 2;
    public static final int PAUSED_WAITING_TO_RETRY = 1;
    public static final int STATUS_FAILED = 16;
    public static final int STATUS_FAILED_INSUFFICIENT_MEMORY = 32;
    public static final int STATUS_FAILED_INVALID_DESCRIPTOR = 64;
    public static final int STATUS_PAUSED = 4;
    public static final int STATUS_PENDING = 1;
    public static final int STATUS_RUNNING = 2;
    public static final int STATUS_SUCCESSFUL = 8;
    public static final String UNDERLYING_COLUMNS[] = {
        "_id", "_data AS local_filename", "mediaprovider_uri", "destination", "title", "description", "uri", "status", "hint", "mimetype AS media_type", 
        "total_bytes AS total_size", "lastmod AS last_modified_timestamp", "current_bytes AS bytes_so_far", "'placeholder' AS local_uri", "'placeholder' AS reason"
    };
    private static final String XLOGTAG = "DownloadManager/Framework";
    private Uri mBaseUri;
    private String mPackageName;
    private ContentResolver mResolver;

    public DownloadManager(ContentResolver contentresolver, String s)
    {
        mBaseUri = android.provider.Downloads.Impl.CONTENT_URI;
        mResolver = contentresolver;
        mPackageName = s;
    }

    public static long getActiveNetworkWarningBytes(Context context)
    {
        return -1L;
    }

    public static Long getMaxBytesOverMobile(Context context)
    {
        Long long1;
        try
        {
            long1 = Long.valueOf(android.provider.Settings.Global.getLong(context.getContentResolver(), "download_manager_max_bytes_over_mobile"));
        }
        catch (android.provider.Settings.SettingNotFoundException settingnotfoundexception)
        {
            return null;
        }
        return long1;
    }

    public static Long getRecommendedMaxBytesOverMobile(Context context)
    {
        Long long1;
        try
        {
            long1 = Long.valueOf(android.provider.Settings.Global.getLong(context.getContentResolver(), "download_manager_recommended_max_bytes_over_mobile"));
        }
        catch (android.provider.Settings.SettingNotFoundException settingnotfoundexception)
        {
            return null;
        }
        return long1;
    }

    static String[] getWhereArgsForIds(long al[])
    {
        String as[] = new String[al.length];
        for (int i = 0; i < al.length; i++)
            as[i] = Long.toString(al[i]);

        return as;
    }

    static String getWhereClauseForIds(long al[])
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append("(");
        for (int i = 0; i < al.length; i++)
        {
            if (i > 0)
                stringbuilder.append("OR ");
            stringbuilder.append("_id");
            stringbuilder.append(" = ? ");
        }

        stringbuilder.append(")");
        return stringbuilder.toString();
    }

    public static boolean isActiveNetworkExpensive(Context context)
    {
        return false;
    }

    private static void validateArgumentIsNonEmpty(String s, String s1)
    {
        if (TextUtils.isEmpty(s1))
            throw new IllegalArgumentException((new StringBuilder()).append(s).append(" can't be null").toString());
        else
            return;
    }

    public long addCompletedDownload(String s, String s1, boolean flag, String s2, String s3, long l, 
            boolean flag1)
    {
        byte byte0 = 2;
        validateArgumentIsNonEmpty("title", s);
        validateArgumentIsNonEmpty("description", s1);
        validateArgumentIsNonEmpty("path", s3);
        validateArgumentIsNonEmpty("mimeType", s2);
        if (l <= 0L)
            throw new IllegalArgumentException(" invalid value for param: totalBytes");
        ContentValues contentvalues = (new Request("non-dwnldmngr-download-dont-retry2download")).setTitle(s).setDescription(s1).setMimeType(s2).toContentValues(null);
        contentvalues.put("destination", Integer.valueOf(6));
        contentvalues.put("_data", s3);
        contentvalues.put("status", Integer.valueOf(200));
        contentvalues.put("total_bytes", Long.valueOf(l));
        byte byte1;
        if (flag)
            byte1 = 0;
        else
            byte1 = byte0;
        contentvalues.put("scanned", Integer.valueOf(byte1));
        if (flag1)
            byte0 = 3;
        contentvalues.put("visibility", Integer.valueOf(byte0));
        Uri uri = mResolver.insert(android.provider.Downloads.Impl.CONTENT_URI, contentvalues);
        if (uri == null)
            return -1L;
        else
            return Long.parseLong(uri.getLastPathSegment());
    }

    public long enqueue(Request request)
    {
        ContentValues contentvalues = request.toContentValues(mPackageName);
        Uri uri = mResolver.insert(android.provider.Downloads.Impl.CONTENT_URI, contentvalues);
        if (uri != null)
            return Long.parseLong(uri.getLastPathSegment());
        else
            return -1L;
    }

    Uri getDownloadUri(long l)
    {
        return ContentUris.withAppendedId(mBaseUri, l);
    }

    public String getMimeTypeForDownloadedFile(long l)
    {
        Query query1;
        Cursor cursor;
        query1 = (new Query()).setFilterById(new long[] {
            l
        });
        cursor = null;
        Cursor cursor1 = query(query1);
        cursor = cursor1;
        if (cursor != null) goto _L2; else goto _L1
_L1:
        String s = null;
        if (cursor == null) goto _L4; else goto _L3
_L3:
        cursor.close();
_L4:
        return s;
_L2:
        String s1;
        if (!cursor.moveToFirst())
            break MISSING_BLOCK_LABEL_112;
        s1 = cursor.getString(cursor.getColumnIndexOrThrow("media_type"));
        s = s1;
        if (cursor == null) goto _L4; else goto _L5
_L5:
        continue; /* Loop/switch isn't completed */
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
        s = null;
        if (cursor == null) goto _L4; else goto _L6
_L6:
        s = null;
        if (true) goto _L3; else goto _L7
_L7:
    }

    public Uri getUriForDownloadedFile(long l)
    {
        Query query1;
        Cursor cursor;
        query1 = (new Query()).setFilterById(new long[] {
            l
        });
        cursor = null;
        Cursor cursor1 = query(query1);
        cursor = cursor1;
        if (cursor != null) goto _L2; else goto _L1
_L1:
        Uri uri = null;
        if (cursor == null) goto _L4; else goto _L3
_L3:
        cursor.close();
_L4:
        return uri;
_L2:
        int i;
        if (!cursor.moveToFirst() || 8 != cursor.getInt(cursor.getColumnIndexOrThrow("status")))
            break MISSING_BLOCK_LABEL_202;
        i = cursor.getInt(cursor.getColumnIndexOrThrow("destination"));
        if (i != 1 && i != 5 && i != 3 && i != 2)
            break MISSING_BLOCK_LABEL_145;
        uri = ContentUris.withAppendedId(android.provider.Downloads.Impl.CONTENT_URI, l);
        if (cursor == null) goto _L4; else goto _L5
_L5:
        break; /* Loop/switch isn't completed */
        Uri uri1 = Uri.fromFile(new File(cursor.getString(cursor.getColumnIndexOrThrow("local_filename"))));
        uri = uri1;
        if (cursor == null) goto _L4; else goto _L6
_L6:
        continue; /* Loop/switch isn't completed */
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
        uri = null;
        if (cursor == null) goto _L4; else goto _L7
_L7:
        uri = null;
        if (true) goto _L3; else goto _L8
_L8:
    }

    public transient int markRowDeleted(long al[])
    {
        if (al != null && al.length != 0)
        {
            ContentValues contentvalues = new ContentValues();
            contentvalues.put("deleted", Integer.valueOf(1));
            if (al.length == 1)
                return mResolver.update(ContentUris.withAppendedId(mBaseUri, al[0]), contentvalues, null, null);
            else
                return mResolver.update(mBaseUri, contentvalues, getWhereClauseForIds(al), getWhereArgsForIds(al));
        } else
        {
            throw new IllegalArgumentException("input param 'ids' can't be null");
        }
    }

    public ParcelFileDescriptor openDownloadedFile(long l)
        throws FileNotFoundException
    {
        return mResolver.openFileDescriptor(getDownloadUri(l), "r");
    }

    public Cursor query(Query query1)
    {
        Cursor cursor = query1.runQuery(mResolver, UNDERLYING_COLUMNS, mBaseUri);
        if (cursor == null)
            return null;
        else
            return new CursorTranslator(cursor, mBaseUri);
    }

    public transient int remove(long al[])
    {
        return markRowDeleted(al);
    }

    public transient void restartDownload(long al[])
    {
        Cursor cursor = query((new Query()).setFilterById(al));
        cursor.moveToFirst();
_L1:
        int i;
        if (cursor.isAfterLast())
            break MISSING_BLOCK_LABEL_122;
        i = cursor.getInt(cursor.getColumnIndex("status"));
        if (i == 8 || i == 16)
            break MISSING_BLOCK_LABEL_112;
        throw new IllegalArgumentException((new StringBuilder()).append("Cannot restart incomplete download: ").append(cursor.getLong(cursor.getColumnIndex("_id"))).toString());
        Exception exception;
        exception;
        cursor.close();
        throw exception;
        cursor.moveToNext();
          goto _L1
        cursor.close();
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("current_bytes", Integer.valueOf(0));
        contentvalues.put("total_bytes", Integer.valueOf(-1));
        contentvalues.putNull("_data");
        contentvalues.put("status", Integer.valueOf(190));
        contentvalues.put("scanned", Integer.valueOf(0));
        mResolver.update(mBaseUri, contentvalues, getWhereClauseForIds(al), getWhereArgsForIds(al));
        return;
    }

    public void setAccessAllDownloads(boolean flag)
    {
        if (flag)
        {
            mBaseUri = android.provider.Downloads.Impl.ALL_DOWNLOADS_CONTENT_URI;
            return;
        } else
        {
            mBaseUri = android.provider.Downloads.Impl.CONTENT_URI;
            return;
        }
    }

}
