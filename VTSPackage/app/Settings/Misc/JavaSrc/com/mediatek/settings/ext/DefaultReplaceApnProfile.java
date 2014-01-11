// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.content.*;
import android.database.Cursor;
import android.net.Uri;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.settings.ext:
//            IReplaceApnProfileExt

public class DefaultReplaceApnProfile
    implements IReplaceApnProfileExt
{

    private static final long APN_EXIST = 0L;
    private static final long APN_NO_UPDATE = -1L;
    private static final String TAG = "DefaultReplaceApnProfileExt";


    public long replaceApn(Context context, Uri uri, String s, String s1, String s2, ContentValues contentvalues, String s3)
    {
        long l;
        String s4;
        Cursor cursor;
        l = -1L;
        s4 = (new StringBuilder()).append("numeric=\"").append(s3).append("\"").append(" and omacpid<>''").toString();
        Xlog.d("DefaultReplaceApnProfileExt", (new StringBuilder()).append("name ").append(s2).append(" numeric = ").append(s3).append(" apnId = ").append(s1).toString());
        cursor = null;
        cursor = context.getContentResolver().query(uri, new String[] {
            "_id", "omacpid"
        }, s4, null, "name ASC");
        if (cursor == null)
            break MISSING_BLOCK_LABEL_130;
        if (cursor.getCount() != 0)
            break MISSING_BLOCK_LABEL_154;
        Xlog.d("DefaultReplaceApnProfileExt", "cursor is null , or cursor.getCount() == 0 return");
        if (cursor != null)
            cursor.close();
        return -1L;
        cursor.moveToFirst();
_L3:
        if (cursor.isAfterLast()) goto _L2; else goto _L1
_L1:
        boolean flag;
        Xlog.d("DefaultReplaceApnProfileExt", (new StringBuilder()).append("apnId ").append(s1).append(" getApnId = ").append(cursor.getString(1)).toString());
        flag = s1.equals(cursor.getString(1));
        if (!flag)
            break MISSING_BLOCK_LABEL_252;
        l = 0L;
_L2:
        if (cursor != null)
            cursor.close();
        return l;
        cursor.moveToNext();
          goto _L3
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
    }
}
