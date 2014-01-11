// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.voicesettings;

import android.util.Log;
import android.util.Xml;
import com.android.internal.util.XmlUtils;
import java.io.*;
import java.util.*;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

public class VoiceUiUtils
{

    public static final String TAG = "VoiceUiUtils";
    private final int mAlarmId = 3;
    private List mAlarmKeywords;
    private final String mAlarmProcessName = "com.android.deskclock";
    private String mKeyId;
    private String mKeyWord;
    private String mVoiceProcessName;

    public VoiceUiUtils()
    {
        mKeyWord = "KeyWord";
        mKeyId = "ID";
        mVoiceProcessName = "ProcessName";
        mAlarmKeywords = new ArrayList();
        Log.v("VoiceUiUtils", "VoiceUiUtils constructor ");
    }

    public void readKeyWordFromXml(HashMap hashmap, String s)
    {
        FileReader filereader;
        XmlPullParser xmlpullparser;
        File file = new File(s);
        int i;
        try
        {
            filereader = new FileReader(file);
        }
        catch (FileNotFoundException filenotfoundexception)
        {
            Log.v("VoiceUiUtils", (new StringBuilder()).append("Couldn't find or open file ").append(file).toString());
            return;
        }
        xmlpullparser = Xml.newPullParser();
        xmlpullparser.setInput(filereader);
        XmlUtils.beginDocument(xmlpullparser, "KeyWordInfos");
_L4:
        XmlUtils.nextElement(xmlpullparser);
        i = xmlpullparser.getEventType();
        if (i != 1) goto _L2; else goto _L1
_L1:
        filereader.close();
_L5:
        return;
_L2:
        if (!"KeyWordInfo".equals(xmlpullparser.getName())) goto _L4; else goto _L3
_L3:
        String s1;
        String s2;
        String s3;
        s1 = xmlpullparser.getAttributeValue(null, mVoiceProcessName);
        s2 = xmlpullparser.getAttributeValue(null, mKeyId);
        s3 = xmlpullparser.getAttributeValue(null, mKeyWord);
        if (s1 == null || s3 == null)
            break MISSING_BLOCK_LABEL_358;
        String as[];
        Log.v("VoiceUiUtils", (new StringBuilder()).append("readEnglishKeyWordFromXml id = ").append(s2).append(" processName   = ").append(s1).append("  KeyWord =").append(s3).toString());
        as = s3.split(",");
        if (Integer.parseInt(s2) != 3)
            break MISSING_BLOCK_LABEL_311;
        mAlarmKeywords.addAll(Arrays.asList(as));
        Log.v("VoiceUiUtils", mAlarmKeywords.toString());
        hashmap.put("com.android.deskclock", ((Object) (mAlarmKeywords.toArray(new String[0]))));
          goto _L4
        XmlPullParserException xmlpullparserexception;
        xmlpullparserexception;
        Log.v("VoiceUiUtils", "Got execption parsing permissions.", xmlpullparserexception);
        try
        {
            filereader.close();
        }
        catch (IOException ioexception4)
        {
            Log.v("VoiceUiUtils", "Got execption parsing permissions.", ioexception4);
        }
          goto _L5
        hashmap.put(s1, as);
          goto _L4
        IOException ioexception2;
        ioexception2;
        Log.v("VoiceUiUtils", "Got execption parsing permissions.", ioexception2);
        try
        {
            filereader.close();
        }
        catch (IOException ioexception3)
        {
            Log.v("VoiceUiUtils", "Got execption parsing permissions.", ioexception3);
        }
          goto _L5
        Log.v("VoiceUiUtils", (new StringBuilder()).append("Error processName or keyWord ").append(s3).toString());
          goto _L4
        NumberFormatException numberformatexception;
        numberformatexception;
        Log.v("VoiceUiUtils", "Got NumberFormatException parsing number error.", numberformatexception);
        try
        {
            filereader.close();
        }
        catch (IOException ioexception1)
        {
            Log.v("VoiceUiUtils", "Got execption parsing permissions.", ioexception1);
        }
          goto _L5
        IOException ioexception5;
        ioexception5;
        Log.v("VoiceUiUtils", "Got execption parsing permissions.", ioexception5);
          goto _L5
        Exception exception;
        exception;
        try
        {
            filereader.close();
        }
        catch (IOException ioexception)
        {
            Log.v("VoiceUiUtils", "Got execption parsing permissions.", ioexception);
        }
        throw exception;
          goto _L4
    }
}
