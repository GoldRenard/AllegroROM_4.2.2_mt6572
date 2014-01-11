// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.vcard;

import android.util.Log;
import java.util.*;

public class VCardConfig
{

    public static final String DEFAULT_EXPORT_CHARSET = "UTF-8";
    public static final String DEFAULT_IMPORT_CHARSET = "UTF-8";
    public static final String DEFAULT_INTERMEDIATE_CHARSET = "ISO-8859-1";
    public static final int FLAG_APPEND_TYPE_PARAM = 0x4000000;
    public static final int FLAG_CONVERT_PHONETIC_NAME_STRINGS = 0x8000000;
    private static final int FLAG_DOCOMO = 0x20000000;
    public static final int FLAG_REFRAIN_IMAGE_EXPORT = 0x800000;
    public static final int FLAG_REFRAIN_PHONE_NUMBER_FORMATTING = 0x2000000;
    public static final int FLAG_REFRAIN_QP_TO_NAME_PROPERTIES = 0x10000000;
    private static final int FLAG_USE_ANDROID_PROPERTY = 0x80000000;
    private static final int FLAG_USE_DEFACT_PROPERTY = 0x40000000;
    static final int LOG_LEVEL = 0;
    static final int LOG_LEVEL_NONE = 0;
    static final int LOG_LEVEL_PERFORMANCE_MEASUREMENT = 1;
    static final int LOG_LEVEL_SHOW_WARNING = 2;
    static final int LOG_LEVEL_VERBOSE = 3;
    private static final String LOG_TAG = "vCard";
    public static final int NAME_ORDER_DEFAULT = 0;
    public static final int NAME_ORDER_EUROPE = 4;
    public static final int NAME_ORDER_JAPANESE = 8;
    private static final int NAME_ORDER_MASK = 12;
    public static int VCARD_TYPE_DEFAULT = 0;
    public static final int VCARD_TYPE_DOCOMO = 0x38000008;
    static final String VCARD_TYPE_DOCOMO_STR = "docomo";
    public static final int VCARD_TYPE_UNKNOWN = 0;
    public static final int VCARD_TYPE_V21_EUROPE = 0xc0000004;
    static final String VCARD_TYPE_V21_EUROPE_STR = "v21_europe";
    public static final int VCARD_TYPE_V21_GENERIC = 0xc0000000;
    static String VCARD_TYPE_V21_GENERIC_STR;
    public static final int VCARD_TYPE_V21_JAPANESE = 0xc0000008;
    public static final int VCARD_TYPE_V21_JAPANESE_MOBILE = 0x18000008;
    static final String VCARD_TYPE_V21_JAPANESE_MOBILE_STR = "v21_japanese_mobile";
    static final String VCARD_TYPE_V21_JAPANESE_STR = "v21_japanese_utf8";
    public static final int VCARD_TYPE_V30_EUROPE = 0xc0000005;
    static final String VCARD_TYPE_V30_EUROPE_STR = "v30_europe";
    public static final int VCARD_TYPE_V30_GENERIC = 0xc0000001;
    static final String VCARD_TYPE_V30_GENERIC_STR = "v30_generic";
    public static final int VCARD_TYPE_V30_JAPANESE = 0xc0000009;
    static final String VCARD_TYPE_V30_JAPANESE_STR = "v30_japanese_utf8";
    public static final int VCARD_TYPE_V40_GENERIC = 0xc0000002;
    static final String VCARD_TYPE_V40_GENERIC_STR = "v40_generic";
    public static final int VERSION_21 = 0;
    public static final int VERSION_30 = 1;
    public static final int VERSION_40 = 2;
    public static final int VERSION_MASK = 3;
    private static final Set sJapaneseMobileTypeSet;
    private static final Map sVCardTypeMap;

    private VCardConfig()
    {
    }

    public static boolean appendTypeParamName(int i)
    {
        return isVersion30(i) || (0x4000000 & i) != 0;
    }

    public static int getNameOrderType(int i)
    {
        return i & 0xc;
    }

    public static int getVCardTypeFromString(String s)
    {
        String s1 = s.toLowerCase();
        if (sVCardTypeMap.containsKey(s1))
            return ((Integer)sVCardTypeMap.get(s1)).intValue();
        if ("default".equalsIgnoreCase(s))
        {
            return VCARD_TYPE_DEFAULT;
        } else
        {
            Log.e("vCard", (new StringBuilder()).append("Unknown vCard type String: \"").append(s).append("\"").toString());
            return VCARD_TYPE_DEFAULT;
        }
    }

    public static boolean isDoCoMo(int i)
    {
        return (0x20000000 & i) != 0;
    }

    public static boolean isJapaneseDevice(int i)
    {
        return sJapaneseMobileTypeSet.contains(Integer.valueOf(i));
    }

    public static boolean isVersion21(int i)
    {
        return (i & 3) == 0;
    }

    public static boolean isVersion30(int i)
    {
        return (i & 3) == 1;
    }

    public static boolean isVersion40(int i)
    {
        return (i & 3) == 2;
    }

    public static boolean needsToConvertPhoneticString(int i)
    {
        return (0x8000000 & i) != 0;
    }

    public static boolean onlyOneNoteFieldIsAvailable(int i)
    {
        return i == 0x38000008;
    }

    static boolean refrainPhoneNumberFormatting(int i)
    {
        return (0x2000000 & i) != 0;
    }

    public static boolean shouldRefrainQPToNameProperties(int i)
    {
        return !shouldUseQuotedPrintable(i) || (0x10000000 & i) != 0;
    }

    public static boolean shouldUseQuotedPrintable(int i)
    {
        return !isVersion30(i);
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

    static 
    {
        VCARD_TYPE_V21_GENERIC_STR = "v21_generic";
        VCARD_TYPE_DEFAULT = 0xc0000000;
        sVCardTypeMap = new HashMap();
        sVCardTypeMap.put(VCARD_TYPE_V21_GENERIC_STR, Integer.valueOf(0xc0000000));
        sVCardTypeMap.put("v30_generic", Integer.valueOf(0xc0000001));
        sVCardTypeMap.put("v21_europe", Integer.valueOf(0xc0000004));
        sVCardTypeMap.put("v30_europe", Integer.valueOf(0xc0000005));
        sVCardTypeMap.put("v21_japanese_utf8", Integer.valueOf(0xc0000008));
        sVCardTypeMap.put("v30_japanese_utf8", Integer.valueOf(0xc0000009));
        sVCardTypeMap.put("v21_japanese_mobile", Integer.valueOf(0x18000008));
        sVCardTypeMap.put("docomo", Integer.valueOf(0x38000008));
        sJapaneseMobileTypeSet = new HashSet();
        sJapaneseMobileTypeSet.add(Integer.valueOf(0xc0000008));
        sJapaneseMobileTypeSet.add(Integer.valueOf(0xc0000009));
        sJapaneseMobileTypeSet.add(Integer.valueOf(0x18000008));
        sJapaneseMobileTypeSet.add(Integer.valueOf(0x38000008));
    }
}
