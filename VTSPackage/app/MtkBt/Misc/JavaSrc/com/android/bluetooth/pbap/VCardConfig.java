// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.bluetooth.pbap;

import java.util.HashMap;
import java.util.Map;

public class VCardConfig
{

    public static final String DEFAULT_CHARSET = "iso-8859-1";
    private static final int FLAG_CHARSET_SHIFT_JIS = 32;
    private static final int FLAG_CHARSET_UTF8 = 0;
    private static final int FLAG_DOCOMO = 0x20000000;
    private static final int FLAG_USE_ANDROID_PROPERTY = 0x80000000;
    private static final int FLAG_USE_DEFACT_PROPERTY = 0x40000000;
    public static final int FLAG_USE_QP_TO_PRIMARY_PROPERTIES = 0x10000000;
    private static final int FLAG_V21 = 0;
    private static final int FLAG_V30 = 1;
    public static final boolean IGNORE_CASE_EXCEPT_VALUE = true;
    static final int LOG_LEVEL = 0;
    static final int LOG_LEVEL_NONE = 0;
    static final int LOG_LEVEL_PERFORMANCE_MEASUREMENT = 1;
    static final int LOG_LEVEL_SHOW_WARNING = 2;
    static final int LOG_LEVEL_VERBOSE = 3;
    public static final int NAME_ORDER_DEFAULT = 0;
    public static final int NAME_ORDER_EUROPE = 4;
    public static final int NAME_ORDER_JAPANESE = 8;
    private static final int NAME_ORDER_MASK = 12;
    private static final Map VCARD_TYPES_MAP;
    public static final int VCARD_TYPE_DEFAULT = 0xc0000000;
    public static final int VCARD_TYPE_DOCOMO = 0x20000028;
    private static final String VCARD_TYPE_DOCOMO_STR = "docomo";
    public static final int VCARD_TYPE_V21_EUROPE = 0xc0000004;
    static final String VCARD_TYPE_V21_EUROPE_STR = "v21_europe";
    public static final int VCARD_TYPE_V21_GENERIC = 0xc0000000;
    public static final int VCARD_TYPE_V21_JAPANESE = 0xc0000028;
    static final String VCARD_TYPE_V21_JAPANESE_STR = "v21_japanese";
    public static final int VCARD_TYPE_V21_JAPANESE_UTF8 = 0xc0000008;
    static final String VCARD_TYPE_V21_JAPANESE_UTF8_STR = "v21_japanese_utf8";
    public static final int VCARD_TYPE_V30_EUROPE = 0xc0000005;
    static final String VCARD_TYPE_V30_EUROPE_STR = "v30_europe";
    public static final int VCARD_TYPE_V30_GENERIC = 0xc0000001;
    static final String VCARD_TYPE_V30_GENERIC_STR = "v30_generic";
    public static final int VCARD_TYPE_V30_JAPANESE = 0xc0000029;
    static final String VCARD_TYPE_V30_JAPANESE_STR = "v30_japanese";
    public static final int VCARD_TYPE_V30_JAPANESE_UTF8 = 0xc0000009;
    static final String VCARD_TYPE_V30_JAPANESE_UTF8_STR = "v30_japanese_utf8";
    static String sVcardTypeV21GenericStr;

    private VCardConfig()
    {
    }

    public static int getNameOrderType(int i)
    {
        return i & 0xc;
    }

    public static int getVCardTypeFromString(String s)
    {
        String s1 = s.toLowerCase();
        if (VCARD_TYPES_MAP.containsKey(s1))
            return ((Integer)VCARD_TYPES_MAP.get(s1)).intValue();
        else
            return 0xc0000000;
    }

    public static boolean isDoCoMo(int i)
    {
        return (0x20000000 & i) != 0;
    }

    public static boolean isJapaneseDevice(int i)
    {
        return i == 0xc0000028 || i == 0xc0000008 || i == 0xc0000029 || i == 0xc0000009 || i == 0x20000028;
    }

    public static boolean isV30(int i)
    {
        return (i & 1) != 0;
    }

    public static boolean needsToConvertPhoneticString(int i)
    {
        return i == 0x20000028;
    }

    public static boolean onlyOneNoteFieldIsAvailable(int i)
    {
        return i == 0x20000028;
    }

    public static boolean showPerformanceLog()
    {
        return false;
    }

    public static boolean usesAndroidSpecificProperty(int i)
    {
        return (0x80000000 & i) != 0;
    }

    public static boolean usesDefactProperty(int i)
    {
        return (0x40000000 & i) != 0;
    }

    public static boolean usesQPToPrimaryProperties(int i)
    {
        return usesQuotedPrintable(i) && (0x10000000 & i) != 0;
    }

    public static boolean usesQuotedPrintable(int i)
    {
        return !isV30(i);
    }

    public static boolean usesShiftJis(int i)
    {
        return (i & 0x20) != 0;
    }

    public static boolean usesUtf8(int i)
    {
        return (i & 0) != 0;
    }

    static 
    {
        sVcardTypeV21GenericStr = "v21_generic";
        VCARD_TYPES_MAP = new HashMap();
        VCARD_TYPES_MAP.put(sVcardTypeV21GenericStr, Integer.valueOf(0xc0000000));
        VCARD_TYPES_MAP.put("v30_generic", Integer.valueOf(0xc0000001));
        VCARD_TYPES_MAP.put("v21_europe", Integer.valueOf(0xc0000004));
        VCARD_TYPES_MAP.put("v30_europe", Integer.valueOf(0xc0000005));
        VCARD_TYPES_MAP.put("v21_japanese", Integer.valueOf(0xc0000028));
        VCARD_TYPES_MAP.put("v21_japanese_utf8", Integer.valueOf(0xc0000008));
        VCARD_TYPES_MAP.put("v30_japanese", Integer.valueOf(0xc0000029));
        VCARD_TYPES_MAP.put("v30_japanese_utf8", Integer.valueOf(0xc0000009));
        VCARD_TYPES_MAP.put("docomo", Integer.valueOf(0x20000028));
    }
}
