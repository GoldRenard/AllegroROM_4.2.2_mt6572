// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.beam;

import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.provider.BaseColumns;
import java.util.Iterator;
import java.util.Set;

public class BeamShareTask
{
    public static interface BeamShareTaskMetaData
        extends BaseColumns
    {

        public static final String CONTENT_ITEM_TYPE = "vnd.android.cursor.item/vnd.mtkbeam.share.task";
        public static final String CONTENT_TYPE = "vnd.android.cursor.dir/vnd.mtkbeam.share.task";
        public static final Uri CONTENT_URI = Uri.parse("content://com.android.settings.provider.beam.share/share_tasks");
        public static final String DEFAULT_SORT_ORDER = "modified DESC";
        public static final String TABLE_NAME = "share_tasks";
        public static final String TASK_DONE_BYTES = "done";
        public static final String TASK_MIMETYPE = "mime";
        public static final String TASK_MODIFIED_DATE = "modified";
        public static final String TASK_OBJECT_FILE = "data";
        public static final String TASK_STATE = "state";
        public static final String TASK_TOTAL_BYTES = "total";
        public static final String TASK_TYPE = "type";

    }

    public static final class Direction extends Enum
    {

        private static final Direction $VALUES[];
        public static final Direction in;
        public static final Direction out;

        public static Direction valueOf(String s)
        {
            return (Direction)Enum.valueOf(com/mediatek/beam/BeamShareTask$Direction, s);
        }

        public static Direction[] values()
        {
            return (Direction[])$VALUES.clone();
        }

        static 
        {
            in = new Direction("in", 0);
            out = new Direction("out", 1);
            Direction adirection[] = new Direction[2];
            adirection[0] = in;
            adirection[1] = out;
            $VALUES = adirection;
        }

        private Direction(String s, int i)
        {
            super(s, i);
        }
    }


    public static final int ID_NULL = -1;
    public static final String SC_INCOMING_TASK = "type in (0,2)";
    public static final String SC_OUTGOING_TASK = "type in (1,3)";
    public static final int STATE_FAILURE = 0;
    public static final int STATE_SUCCESS = 1;
    public static final int TYPE_BLUETOOTH_INCOMING = 0;
    public static final int TYPE_BLUETOOTH_OUTGOING = 1;
    public static final int TYPE_WIFI_DIRECT_INCOMING = 2;
    public static final int TYPE_WIFI_DIRECT_OUTGOING = 3;
    private String mData;
    private long mDoneBytes;
    private int mId;
    private String mMimeType;
    private long mModifiedDate;
    private int mState;
    private long mTotalBytes;
    private int mType;

    public BeamShareTask(int i)
    {
        mId = -1;
        mModifiedDate = 0L;
        mType = i;
    }

    public BeamShareTask(Cursor cursor)
    {
        mId = -1;
        mModifiedDate = 0L;
        mId = cursor.getInt(cursor.getColumnIndexOrThrow("_id"));
        mType = cursor.getInt(cursor.getColumnIndexOrThrow("type"));
        mState = cursor.getInt(cursor.getColumnIndexOrThrow("state"));
        mData = cursor.getString(cursor.getColumnIndexOrThrow("data"));
        mMimeType = cursor.getString(cursor.getColumnIndexOrThrow("mime"));
        mTotalBytes = cursor.getLong(cursor.getColumnIndexOrThrow("total"));
        mDoneBytes = cursor.getLong(cursor.getColumnIndexOrThrow("done"));
        mModifiedDate = cursor.getLong(cursor.getColumnIndexOrThrow("modified"));
    }

    public ContentValues getContentValues()
    {
        ContentValues contentvalues = new ContentValues();
        if (mId != -1)
            contentvalues.put("_id", Integer.valueOf(mId));
        if (mModifiedDate != 0L)
            contentvalues.put("modified", Long.valueOf(mModifiedDate));
        contentvalues.put("type", Integer.valueOf(mType));
        contentvalues.put("state", Integer.valueOf(mState));
        contentvalues.put("data", mData);
        contentvalues.put("mime", mMimeType);
        contentvalues.put("total", Long.valueOf(mTotalBytes));
        contentvalues.put("done", Long.valueOf(mDoneBytes));
        return contentvalues;
    }

    public String getData()
    {
        return mData;
    }

    public Direction getDirection()
    {
        switch (mType)
        {
        case 1: // '\001'
        case 3: // '\003'
            return Direction.out;

        case 0: // '\0'
        case 2: // '\002'
            return Direction.in;
        }
        return Direction.out;
    }

    public long getDoneBytes()
    {
        return mDoneBytes;
    }

    public int getId()
    {
        return mId;
    }

    public String getMimeType()
    {
        return mMimeType;
    }

    public long getModifiedDate()
    {
        return mModifiedDate;
    }

    public String getPrintableString()
    {
        StringBuilder stringbuilder = new StringBuilder();
        java.util.Map.Entry entry;
        for (Iterator iterator = getContentValues().valueSet().iterator(); iterator.hasNext(); stringbuilder.append("[").append((String)entry.getKey()).append("=").append(entry.getValue()).append("]"))
            entry = (java.util.Map.Entry)iterator.next();

        return stringbuilder.toString();
    }

    public int getState()
    {
        return mState;
    }

    public Uri getTaskUri()
    {
        if (mId == -1)
            throw new IllegalStateException("null id task can't get uri");
        else
            return Uri.withAppendedPath(BeamShareTaskMetaData.CONTENT_URI, Integer.toString(mId));
    }

    public long getTotalBytes()
    {
        return mTotalBytes;
    }

    public int getType()
    {
        return mType;
    }

    public void setData(String s)
    {
        mData = s;
    }

    public void setDoneBytes(long l)
    {
        mDoneBytes = l;
    }

    public void setId(int i)
    {
        mId = i;
    }

    public void setMimeType(String s)
    {
        if (s != null)
        {
            mMimeType = s.toLowerCase();
            return;
        } else
        {
            mMimeType = s;
            return;
        }
    }

    public void setModifiedDate(long l)
    {
        mModifiedDate = l;
    }

    public void setState(int i)
    {
        mState = i;
    }

    public void setTotalBytes(long l)
    {
        mTotalBytes = l;
    }
}
