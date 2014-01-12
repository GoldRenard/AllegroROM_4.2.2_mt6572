// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.vcard;

import android.text.TextUtils;
import android.util.Log;
import java.util.*;

// Referenced classes of package com.android.vcard:
//            VCardInterpreter, VCardProperty

public class VCardSourceDetector
    implements VCardInterpreter
{

    private static Set APPLE_SIGNS = new HashSet(Arrays.asList(new String[] {
        "X-PHONETIC-FIRST-NAME", "X-PHONETIC-MIDDLE-NAME", "X-PHONETIC-LAST-NAME", "X-ABADR", "X-ABUID"
    }));
    private static Set FOMA_SIGNS = new HashSet(Arrays.asList(new String[] {
        "X-SD-VERN", "X-SD-FORMAT_VER", "X-SD-CATEGORIES", "X-SD-CLASS", "X-SD-DCREATED", "X-SD-DESCRIPTION"
    }));
    private static Set JAPANESE_MOBILE_PHONE_SIGNS = new HashSet(Arrays.asList(new String[] {
        "X-GNO", "X-GN", "X-REDUCTION"
    }));
    private static final String LOG_TAG = "vCard";
    private static final int PARSE_TYPE_APPLE = 1;
    private static final int PARSE_TYPE_DOCOMO_FOMA = 3;
    private static final int PARSE_TYPE_MOBILE_PHONE_JP = 2;
    public static final int PARSE_TYPE_UNKNOWN = 0;
    private static final int PARSE_TYPE_WINDOWS_MOBILE_V65_JP = 4;
    private static String TYPE_FOMA_CHARSET_SIGN = "X-SD-CHAR_CODE";
    private static Set WINDOWS_MOBILE_PHONE_SIGNS = new HashSet(Arrays.asList(new String[] {
        "X-MICROSOFT-ASST_TEL", "X-MICROSOFT-ASSISTANT", "X-MICROSOFT-OFFICELOC"
    }));
    private int mParseType;
    private String mSpecifiedCharset;
    private int mVersion;

    public VCardSourceDetector()
    {
        mParseType = 0;
        mVersion = -1;
    }

    public String getEstimatedCharset()
    {
        if (TextUtils.isEmpty(mSpecifiedCharset))
            return mSpecifiedCharset;
        switch (mParseType)
        {
        case 1: // '\001'
            return "UTF-8";

        case 2: // '\002'
        case 3: // '\003'
        case 4: // '\004'
            return "SHIFT_JIS";
        }
        return null;
    }

    public int getEstimatedType()
    {
        switch (mParseType)
        {
        case 2: // '\002'
            return 0x18000008;

        case 3: // '\003'
            return 0x38000008;
        }
        if (mVersion == 0)
            return 0xc0000000;
        if (mVersion == 1)
            return 0xc0000001;
        return mVersion != 2 ? 0 : 0xc0000002;
    }

    public void onEntryEnded()
    {
    }

    public void onEntryStarted()
    {
    }

    public void onPropertyCreated(VCardProperty vcardproperty)
    {
        String s = vcardproperty.getName();
        List list = vcardproperty.getValueList();
        if (s.equalsIgnoreCase("VERSION") && list.size() > 0)
        {
            String s1 = (String)list.get(0);
            if (s1.equals("2.1"))
                mVersion = 0;
            else
            if (s1.equals("3.0"))
                mVersion = 1;
            else
            if (s1.equals("4.0"))
                mVersion = 2;
            else
                Log.w("vCard", (new StringBuilder()).append("Invalid version string: ").append(s1).toString());
        } else
        if (s.equalsIgnoreCase(TYPE_FOMA_CHARSET_SIGN))
        {
            mParseType = 3;
            if (list.size() > 0)
                mSpecifiedCharset = (String)list.get(0);
        }
        if (mParseType == 0)
        {
            if (WINDOWS_MOBILE_PHONE_SIGNS.contains(s))
            {
                mParseType = 4;
                return;
            }
            if (FOMA_SIGNS.contains(s))
            {
                mParseType = 3;
                return;
            }
            if (JAPANESE_MOBILE_PHONE_SIGNS.contains(s))
            {
                mParseType = 2;
                return;
            }
            if (APPLE_SIGNS.contains(s))
            {
                mParseType = 1;
                return;
            }
        }
    }

    public void onVCardEnded()
    {
    }

    public void onVCardStarted()
    {
    }

}
