// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.mmi;

import android.content.Context;
import android.net.Uri;
import android.util.Patterns;
import com.mediatek.bluetooth.util.BtLog;
import com.mediatek.bluetooth.util.SystemUtils;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Utils
{

    private static final SimpleDateFormat TIME_FILENAME_FORMATER = new SimpleDateFormat("yyyyMMdd_HHmmss");


    public static Uri createContextFileForText(Context context, CharSequence charsequence, CharSequence charsequence1)
    {
        if (charsequence1 != null) goto _L2; else goto _L1
_L1:
        Uri uri = null;
_L9:
        return uri;
_L2:
        FileOutputStream fileoutputstream;
        BtLog.w((new StringBuilder()).append("[URL pattern match begin, text: ").append(charsequence1.toString()).toString());
        if (charsequence != null)
            BtLog.w((new StringBuilder()).append("[URL pattern match begin, subject: ").append(charsequence.toString()).toString());
        fileoutputstream = null;
        String s;
        Matcher matcher;
        s = context.getString(0x7f050025);
        context.deleteFile(s);
        matcher = Patterns.WEB_URL.matcher(charsequence1);
        int i = 0;
        StringBuffer stringbuffer = new StringBuffer();
_L5:
        boolean flag = matcher.find();
        fileoutputstream = null;
        if (!flag)
            break; /* Loop/switch isn't completed */
        String s1;
        int j;
        s1 = matcher.group();
        BtLog.w((new StringBuilder()).append("URL pattern match result, link: ").append(s1).toString());
        BtLog.w((new StringBuilder()).append("URL pattern match result, link.length: ").append(s1.length()).toString());
        j = matcher.start();
        BtLog.w((new StringBuilder()).append("URL pattern  current start index - ").append(i).toString());
        BtLog.w((new StringBuilder()).append("URL pattern  current match index - ").append(j).toString());
        if (charsequence1.length() <= s1.length())
            break MISSING_BLOCK_LABEL_455;
        fileoutputstream = null;
        if (j <= i) goto _L4; else goto _L3
_L3:
        stringbuffer.append(charsequence1.toString().substring(i, j));
        stringbuffer.append((new StringBuilder()).append("<a href=\"").append(s1).append("\">").toString());
        stringbuffer.append(s1);
        stringbuffer.append("</a></p>");
_L7:
        i = j + s1.length();
          goto _L5
_L4:
        fileoutputstream = null;
        if (j != i) goto _L7; else goto _L6
_L6:
        stringbuffer.append((new StringBuilder()).append("<a href=\"").append(s1).append("\">").toString());
        stringbuffer.append(s1);
        stringbuffer.append("</a></p>");
          goto _L7
        IOException ioexception1;
        ioexception1;
        BtLog.e((new StringBuilder()).append("createContextFileForText() error:").append(ioexception1.toString()).toString());
        uri = null;
        if (fileoutputstream != null)
        {
            try
            {
                fileoutputstream.close();
            }
            catch (IOException ioexception2)
            {
                BtLog.w((new StringBuilder()).append("createContextFileForText() closing file output stream fail: ").append(ioexception2.toString()).toString());
                return null;
            }
            return null;
        }
        if (true) goto _L9; else goto _L8
        if (charsequence != null)
            break MISSING_BLOCK_LABEL_806;
        stringbuffer.append((new StringBuilder()).append("<a href=\"").append(s1).append("\">").toString());
        stringbuffer.append(s1);
        stringbuffer.append("</a></p>");
_L11:
        i = charsequence1.length();
_L8:
        int k;
        BtLog.w((new StringBuilder()).append("After match currentStartIdx - ").append(i).toString());
        BtLog.w((new StringBuilder()).append("After match current body:").append(stringbuffer.toString()).toString());
        k = stringbuffer.length();
        fileoutputstream = null;
        if (k == 0)
            break MISSING_BLOCK_LABEL_615;
        int l = charsequence1.length();
        fileoutputstream = null;
        if (i >= l)
            break MISSING_BLOCK_LABEL_615;
        stringbuffer.append(charsequence1.toString().substring(i, charsequence1.length()));
        if (stringbuffer.length() == 0)
            stringbuffer.append(charsequence1);
        String s2 = (new StringBuilder()).append("<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/></head><body>").append(stringbuffer.toString()).toString();
        String s3 = (new StringBuilder()).append(s2).append("</body></html>").toString();
        BtLog.w((new StringBuilder()).append("URL final compose content: ").append(s3).toString());
        byte abyte0[] = s3.getBytes();
        fileoutputstream = context.openFileOutput(s, 0);
        fileoutputstream.write(abyte0, 0, abyte0.length);
        fileoutputstream.flush();
        uri = Uri.fromFile(new File(context.getFilesDir(), s));
        if (uri != null)
            continue; /* Loop/switch isn't completed */
        BtLog.w("createContextFileForText() - can't get Uri for created file.");
        context.deleteFile(s);
        if (fileoutputstream == null) goto _L9; else goto _L10
_L10:
        try
        {
            fileoutputstream.close();
        }
        catch (IOException ioexception3)
        {
            BtLog.w((new StringBuilder()).append("createContextFileForText() closing file output stream fail: ").append(ioexception3.toString()).toString());
            return uri;
        }
        return uri;
        stringbuffer.append((new StringBuilder()).append("<a href=\"").append(s1).append("\">").toString());
        stringbuffer.append(charsequence);
        stringbuffer.append("</a></p>");
          goto _L11
        Exception exception;
        exception;
        if (fileoutputstream != null)
            try
            {
                fileoutputstream.close();
            }
            catch (IOException ioexception)
            {
                BtLog.w((new StringBuilder()).append("createContextFileForText() closing file output stream fail: ").append(ioexception.toString()).toString());
            }
        throw exception;
    }

    public static String getGoepResponseCodeString(String s)
    {
        int i = Integer.parseInt(s);
        if (i > 128)
            i -= 128;
        switch (i)
        {
        case 97: // 'a'
            return "Database Locked";

        case 96: // '`'
            return "Database Full";

        case 85: // 'U'
            return "HTTP version not supported";

        case 84: // 'T'
            return "Gateway Timeout";

        case 83: // 'S'
            return "Service Unavailable";

        case 82: // 'R'
            return "Bad Gateway";

        case 81: // 'Q'
            return "Not Implemented";

        case 80: // 'P'
            return "Internal Server Error";

        case 79: // 'O'
            return "Unsupported media type";

        case 78: // 'N'
            return "Request URL too large";

        case 77: // 'M'
            return "Requested entity too large";

        case 76: // 'L'
            return "Precondition failed";

        case 75: // 'K'
            return "Length Required";

        case 74: // 'J'
            return "Gone";

        case 73: // 'I'
            return "Conflict";

        case 72: // 'H'
            return "Request Time Out";

        case 71: // 'G'
            return "Proxy Authentication required";

        case 70: // 'F'
            return "Not Acceptable";

        case 69: // 'E'
            return "Method not allowed";

        case 68: // 'D'
            return "Not Found";

        case 67: // 'C'
            return "Forbidden - operation is understood but refused";

        case 66: // 'B'
            return "Payment required";

        case 65: // 'A'
            return "Unauthorized";

        case 64: // '@'
            return "Bad Request - server couldn't understand request";

        case 53: // '5'
            return "Use Proxy";

        case 52: // '4'
            return "Not modified";

        case 51: // '3'
            return "See Other";

        case 50: // '2'
            return "Moved temporarily";

        case 49: // '1'
            return "Moved Permanently";

        case 48: // '0'
            return "Multiple Choices";

        case 38: // '&'
            return "Partial Content";

        case 37: // '%'
            return "Reset Content";

        case 36: // '$'
            return "No Content";

        case 35: // '#'
            return "Non-Authoritative Information";

        case 34: // '"'
            return "Accepted";

        case 33: // '!'
            return "Created";

        case 32: // ' '
            return "OK, Success";

        case 16: // '\020'
            return "Continue";

        case 1: // '\001'
            return "Failed";

        case 0: // '\0'
            return "Success";

        case 2: // '\002'
        case 3: // '\003'
        case 4: // '\004'
        case 5: // '\005'
        case 6: // '\006'
        case 7: // '\007'
        case 8: // '\b'
        case 9: // '\t'
        case 10: // '\n'
        case 11: // '\013'
        case 12: // '\f'
        case 13: // '\r'
        case 14: // '\016'
        case 15: // '\017'
        case 17: // '\021'
        case 18: // '\022'
        case 19: // '\023'
        case 20: // '\024'
        case 21: // '\025'
        case 22: // '\026'
        case 23: // '\027'
        case 24: // '\030'
        case 25: // '\031'
        case 26: // '\032'
        case 27: // '\033'
        case 28: // '\034'
        case 29: // '\035'
        case 30: // '\036'
        case 31: // '\037'
        case 39: // '\''
        case 40: // '('
        case 41: // ')'
        case 42: // '*'
        case 43: // '+'
        case 44: // ','
        case 45: // '-'
        case 46: // '.'
        case 47: // '/'
        case 54: // '6'
        case 55: // '7'
        case 56: // '8'
        case 57: // '9'
        case 58: // ':'
        case 59: // ';'
        case 60: // '<'
        case 61: // '='
        case 62: // '>'
        case 63: // '?'
        case 86: // 'V'
        case 87: // 'W'
        case 88: // 'X'
        case 89: // 'Y'
        case 90: // 'Z'
        case 91: // '['
        case 92: // '\\'
        case 93: // ']'
        case 94: // '^'
        case 95: // '_'
        default:
            return (new StringBuilder()).append("").append(s).toString();
        }
    }

    public static String getValidStoragePath(Context context, String s)
    {
        String s1 = SystemUtils.getReceivedFilePath(context);
        File file = new File(s1);
        if (!file.exists())
            file.mkdirs();
        String s2 = isValidFilename(file, s);
        if (s2 != null)
            return s2;
        BtLog.i((new StringBuilder()).append("invalid filename hint:[").append(s).append("]").toString());
        String s3 = TIME_FILENAME_FORMATER.format(Calendar.getInstance().getTime());
        int i = s.lastIndexOf(".");
        if (i > -1)
        {
            String s4 = isValidFilename(file, (new StringBuilder()).append(s3).append(s.substring(i)).toString());
            if (s4 != null)
                return s4;
        }
        return (new StringBuilder()).append(s1).append("/").append(s3).toString();
    }

    private static String isValidFilename(File file, String s)
    {
        if (file != null && s != null) goto _L2; else goto _L1
_L1:
        return null;
_L2:
        File file1;
        file1 = new File(file, s);
        if (file1.exists())
            continue; /* Loop/switch isn't completed */
        if (!file1.createNewFile()) goto _L1; else goto _L3
_L3:
        file1.delete();
        if (!file1.getParent().equals(file.getPath())) goto _L1; else goto _L4
_L4:
        String s1 = file1.getAbsolutePath();
        return s1;
        IOException ioexception;
        ioexception;
        return null;
        if (!file1.getParent().equals(file.getPath())) goto _L1; else goto _L5
_L5:
        return file1.getAbsolutePath();
    }

}
