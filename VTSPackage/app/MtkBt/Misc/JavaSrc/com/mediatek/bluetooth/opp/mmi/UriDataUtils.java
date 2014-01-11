// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.mmi;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import com.mediatek.bluetooth.util.BtLog;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

// Referenced classes of package com.mediatek.bluetooth.opp.mmi:
//            UriData, Utils

public class UriDataUtils
{

    private static final String CALENDAR_AUTHORITY = "com.mediatek.calendarimporter";
    private static final String OPPC_PUSH_TEMP_FILENAME = "__OPPC_PuSH_";


    public static void closeUriData(Context context, Uri uri)
    {
        if ("content".equals(uri.getScheme()))
        {
            String s = uri.getAuthority();
            if ("com.android.contacts".equals(s) || "com.mediatek.calendarimporter".equals(s))
                context.getApplicationContext().deleteFile("__OPPC_PuSH_");
        }
    }

    public static long copyStreamContent(InputStream inputstream, OutputStream outputstream)
        throws IOException
    {
        long l = 0L;
        byte abyte0[] = new byte[512];
        do
        {
            int i = inputstream.read(abyte0);
            if (i != -1)
            {
                outputstream.write(abyte0, 0, i);
                l += i;
            } else
            {
                inputstream.close();
                outputstream.close();
                return l;
            }
        } while (true);
    }

    public static String getPushTempFileName(String s)
    {
        String s1 = (new SimpleDateFormat("yyyyMMdd_hhmmss")).format(new Date(System.currentTimeMillis()));
        if ("com.android.contacts".equals(s))
            return (new StringBuilder()).append(s1).append(".vcf").toString();
        if ("com.mediatek.calendarimporter".equals(s))
            return (new StringBuilder()).append(s1).append(".vcs").toString();
        else
            return s1;
    }

    public static UriData getUriData(Context context, Uri uri)
    {
        Cursor cursor;
        String s;
        cursor = null;
        s = uri.getScheme();
        if (!"file".equals(s)) goto _L2; else goto _L1
_L1:
        UriData uridata1;
        BtLog.d((new StringBuilder()).append("getUriData() - File: ").append(uri).toString());
        UriData uridata3 = new UriData(uri);
        uridata3.setData(uri.getPath());
        uridata3.setName(uri.getLastPathSegment());
        uridata3.setSize((new File(uri.getPath())).length());
        uridata1 = uridata3;
_L6:
        return uridata1;
_L2:
        if (!"content".equals(s)) goto _L4; else goto _L3
_L3:
        String s2;
        BtLog.d((new StringBuilder()).append("getUriData() - Content: ").append(uri).toString());
        s2 = uri.getAuthority();
        String as[];
        if ("com.android.contacts".equals(s2) || "com.mediatek.calendarimporter".equals(s2))
            as = (new String[] {
                "_size", "_display_name"
            });
        else
            as = (new String[] {
                "_size", "_display_name", "_data"
            });
        cursor = context.getContentResolver().query(uri, as, null, null, null);
        if (cursor == null)
            break MISSING_BLOCK_LABEL_192;
        if (cursor.moveToFirst())
            break MISSING_BLOCK_LABEL_253;
        BtLog.w((new StringBuilder()).append("getUriData() - no query result for content uri: ").append(uri).toString());
        uridata1 = null;
        if (cursor == null) goto _L6; else goto _L5
_L5:
        cursor.close();
        return null;
        UriData uridata2 = new UriData(uri);
        uridata2.setName(cursor.getString(cursor.getColumnIndex("_display_name")));
        uridata2.setSize(cursor.getLong(cursor.getColumnIndex("_size")));
        if (!"com.android.contacts".equals(s2) && !"com.mediatek.calendarimporter".equals(s2)) goto _L8; else goto _L7
_L7:
        long l;
        uridata2.setName(getPushTempFileName(s2));
        uridata2.setData(context.getApplicationContext().getFileStreamPath("__OPPC_PuSH_").getPath());
        l = uridata2.getSize();
        InputStream inputstream;
        if (l != 0L)
            break MISSING_BLOCK_LABEL_401;
        inputstream = null;
        inputstream = context.getContentResolver().openInputStream(uri);
        if (inputstream == null)
            break MISSING_BLOCK_LABEL_391;
        uridata2.setSize(inputstream.available());
        if (inputstream == null)
            break MISSING_BLOCK_LABEL_401;
        inputstream.close();
_L9:
        if (cursor != null)
            cursor.close();
        return uridata2;
        IOException ioexception4;
        ioexception4;
        BtLog.e((new StringBuilder()).append("getUriData() - fail to close input-stream for uri[").append(uri).append("]").toString());
          goto _L9
        Exception exception;
        exception;
_L13:
        if (cursor != null)
            cursor.close();
        throw exception;
        FileNotFoundException filenotfoundexception;
        filenotfoundexception;
        BtLog.e((new StringBuilder()).append("getUriData() - get Contact vCard fail: ").append(filenotfoundexception.getMessage()).toString());
        if (inputstream == null) goto _L9; else goto _L10
_L10:
        inputstream.close();
          goto _L9
        IOException ioexception3;
        ioexception3;
        BtLog.e((new StringBuilder()).append("getUriData() - fail to close input-stream for uri[").append(uri).append("]").toString());
          goto _L9
        IOException ioexception1;
        ioexception1;
        BtLog.e((new StringBuilder()).append("getUriData() - get Contact vCard fail: ").append(ioexception1.getMessage()).toString());
        if (inputstream == null) goto _L9; else goto _L11
_L11:
        inputstream.close();
          goto _L9
        IOException ioexception2;
        ioexception2;
        BtLog.e((new StringBuilder()).append("getUriData() - fail to close input-stream for uri[").append(uri).append("]").toString());
          goto _L9
        Exception exception1;
        exception1;
        if (inputstream == null)
            break MISSING_BLOCK_LABEL_619;
        inputstream.close();
_L12:
        throw exception1;
        IOException ioexception;
        ioexception;
        BtLog.e((new StringBuilder()).append("getUriData() - fail to close input-stream for uri[").append(uri).append("]").toString());
          goto _L12
_L8:
        uridata2.setData(cursor.getString(cursor.getColumnIndex("_data")));
          goto _L9
_L4:
        if ("btlink".equals(s))
        {
            BtLog.d((new StringBuilder()).append("getUriData() - LinkShare: ").append(uri).toString());
            String s1 = uri.getSchemeSpecificPart();
            Uri uri1 = Utils.createContextFileForText(context, uri.getFragment(), s1);
            UriData uridata = null;
            if (uri1 != null)
            {
                uridata = new UriData(uri);
                uridata.setData(uri1.getPath());
                uridata.setName(uri1.getLastPathSegment());
                uridata.setSize((new File(uri1.getPath())).length());
            }
            return uridata;
        } else
        {
            BtLog.e((new StringBuilder()).append("getUriData() - unsupported uri: ").append(uri).toString());
            return null;
        }
        exception;
          goto _L13
    }

    public static boolean openUriData(Context context, Uri uri)
    {
        boolean flag;
        String s;
        flag = true;
        s = uri.getScheme();
        if ("file".equals(s))
            return flag;
        if (!"content".equals(s))
            break MISSING_BLOCK_LABEL_185;
        String s2 = uri.getAuthority();
        if ("media".equals(s2))
            return flag;
        if (!"com.android.contacts".equals(s2) && !"com.mediatek.calendarimporter".equals(s2))
            break MISSING_BLOCK_LABEL_161;
        InputStream inputstream;
        try
        {
            inputstream = context.getContentResolver().openInputStream(uri);
        }
        catch (FileNotFoundException filenotfoundexception)
        {
            BtLog.e((new StringBuilder()).append("openUriData() - open Contact file fail: ").append(filenotfoundexception.getMessage()).toString());
            return false;
        }
        catch (IOException ioexception)
        {
            return false;
        }
        if (inputstream != null)
            break MISSING_BLOCK_LABEL_139;
        BtLog.e((new StringBuilder()).append("openUriData() - open Contact file fail: openInputStream(").append(uri).append(") return null").toString());
        return false;
        copyStreamContent(inputstream, context.getApplicationContext().openFileOutput("__OPPC_PuSH_", 0));
        return flag;
        BtLog.w((new StringBuilder()).append("openUriData() - unsupported content uri: ").append(uri).toString());
        return false;
        if ("btlink".equals(s))
        {
            BtLog.d((new StringBuilder()).append("getUriData() - LinkShare: ").append(uri).toString());
            String s1 = uri.getSchemeSpecificPart();
            if (Utils.createContextFileForText(context, uri.getFragment(), s1) == null)
                flag = false;
            return flag;
        } else
        {
            BtLog.w((new StringBuilder()).append("openUriData() - unsupported uri: ").append(uri).toString());
            return false;
        }
    }
}
