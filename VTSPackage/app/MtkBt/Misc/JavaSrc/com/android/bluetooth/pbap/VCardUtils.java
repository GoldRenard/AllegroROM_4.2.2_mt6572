// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.bluetooth.pbap;

import android.content.ContentValues;
import android.text.TextUtils;
import java.util.*;

// Referenced classes of package com.android.bluetooth.pbap:
//            VCardConfig, JapaneseUtils

public class VCardUtils
{

    private static final char ENCODE64[] = {
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
        'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
        'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 
        'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 
        'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 
        'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', 
        '8', '9', '+', '/'
    };
    private static final Map KNOWN_PHONE_TYPES_MAP_STOI;
    private static final Map KNOWN_PHONE_TYPE_MAP_ITOS;
    private static final Set PHONE_TYPE_SET_UNKNOWN_TO_CONTACTS;
    private static char sPad = '=';

    private VCardUtils()
    {
    }

    public static String constructNameFromElements(int i, String s, String s1, String s2)
    {
        return constructNameFromElements(i, s, s1, s2, null, null);
    }

    public static String constructNameFromElements(int i, String s, String s1, String s2, String s3, String s4)
    {
        StringBuilder stringbuilder = new StringBuilder();
        String as[] = sortNameElements(i, s, s1, s2);
        boolean flag = true;
        if (!TextUtils.isEmpty(s3))
        {
            flag = false;
            stringbuilder.append(s3);
        }
        int j = as.length;
        for (int k = 0; k < j; k++)
        {
            String s5 = as[k];
            if (TextUtils.isEmpty(s5))
                continue;
            if (flag)
                flag = false;
            else
                stringbuilder.append(' ');
            stringbuilder.append(s5);
        }

        if (!TextUtils.isEmpty(s4))
        {
            if (!flag)
                stringbuilder.append(' ');
            stringbuilder.append(s4);
        }
        return stringbuilder.toString();
    }

    public static boolean containsOnlyAlphaDigitHyphen(String s)
    {
        if (!TextUtils.isEmpty(s))
        {
            int i = s.length();
            for (int j = 0; j < i; j = s.offsetByCodePoints(j, 1))
            {
                int k = s.codePointAt(j);
                if ((65 > k || k >= 91) && (97 > k || k >= 123) && (48 > k || k >= 57) && k != 45)
                    return false;
            }

        }
        return true;
    }

    public static boolean containsOnlyNonCrLfPrintableAscii(String s)
    {
        if (s != null && !TextUtils.isEmpty(s))
        {
            int i = s.length();
            for (int j = 0; j < i;)
            {
                int k = s.codePointAt(j);
                if (k >= 32 && 294 >= k && k != 10 && k != 13)
                    j = s.offsetByCodePoints(j, 1);
                else
                    return false;
            }

        }
        return true;
    }

    public static boolean containsOnlyPrintableAscii(String s)
    {
        if (s != null && !TextUtils.isEmpty(s))
        {
            int i = s.length();
            for (int j = 0; j < i;)
            {
                int k = s.codePointAt(j);
                if (k >= 32 && 294 >= k)
                    j = s.offsetByCodePoints(j, 1);
                else
                    return false;
            }

        }
        return true;
    }

    public static String encodeBase64(byte abyte0[])
    {
        if (abyte0 == null)
            return "";
        char ac[] = new char[4 * ((2 + abyte0.length) / 3)];
        int i = 0;
        for (int j = 0; j < -2 + abyte0.length; j += 3)
        {
            int k2 = ((0xff & abyte0[j]) << 16) + ((0xff & abyte0[j + 1]) << 8) + (0xff & abyte0[j + 2]);
            int l2 = i + 1;
            ac[i] = ENCODE64[k2 >> 18];
            int i3 = l2 + 1;
            ac[l2] = ENCODE64[0x3f & k2 >> 12];
            int j3 = i3 + 1;
            ac[i3] = ENCODE64[0x3f & k2 >> 6];
            i = j3 + 1;
            ac[j3] = ENCODE64[k2 & 0x3f];
        }

        switch (abyte0.length % 3)
        {
        case 2: // '\002'
            int k1 = ((0xff & abyte0[-2 + abyte0.length]) << 16) + ((0xff & abyte0[-1 + abyte0.length]) << 8);
            int l1 = i + 1;
            ac[i] = ENCODE64[k1 >> 18];
            int i2 = l1 + 1;
            ac[l1] = ENCODE64[0x3f & k1 >> 12];
            int j2 = i2 + 1;
            ac[i2] = ENCODE64[0x3f & k1 >> 6];
            int _tmp = j2 + 1;
            ac[j2] = sPad;
            break;

        case 1: // '\001'
            int k = (0xff & abyte0[-1 + abyte0.length]) << 16;
            int l = i + 1;
            ac[i] = ENCODE64[k >> 18];
            int i1 = l + 1;
            ac[l] = ENCODE64[0x3f & k >> 12];
            int j1 = i1 + 1;
            ac[i1] = sPad;
            int _tmp1 = j1 + 1;
            ac[j1] = sPad;
            break;
        }
        return new String(ac);
    }

    public static String getPhoneAttributeString(Integer integer)
    {
        return (String)KNOWN_PHONE_TYPE_MAP_ITOS.get(integer);
    }

    public static int getPhoneNumberFormat(int i)
    {
        return !VCardConfig.isJapaneseDevice(i) ? 1 : 2;
    }

    public static Object getPhoneTypeFromStrings(Collection collection)
    {
        int i = -1;
        boolean flag = false;
        boolean flag1 = false;
        String s = null;
        if (collection != null)
        {
            Iterator iterator = collection.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                String s1 = ((String)iterator.next()).toUpperCase();
                if (s1.equals("PREF"))
                    flag = true;
                else
                if (s1.equals("FAX"))
                {
                    flag1 = true;
                } else
                {
                    if (s1.startsWith("X-") && i < 0)
                        s1 = s1.substring(2);
                    Integer integer = (Integer)KNOWN_PHONE_TYPES_MAP_STOI.get(s1);
                    if (integer != null)
                        i = integer.intValue();
                    else
                    if (i < 0)
                    {
                        s = s1;
                        i = 0;
                    }
                }
            } while (true);
        }
        if (i < 0)
            if (flag)
                i = 12;
            else
                i = 1;
        if (flag1)
            if (i == 1)
                i = 5;
            else
            if (i == 3)
                i = 4;
            else
            if (i == 7)
                i = 13;
        if (i == 0)
            return s;
        else
            return Integer.valueOf(i);
    }

    public static String[] getVCardPostalElements(ContentValues contentvalues)
    {
        String as[] = new String[7];
        as[0] = contentvalues.getAsString("data5");
        if (as[0] == null)
            as[0] = "";
        as[1] = "";
        as[2] = contentvalues.getAsString("data4");
        if (as[2] == null)
            as[2] = "";
        as[3] = contentvalues.getAsString("data7");
        if (as[3] == null)
            as[3] = "";
        String s = contentvalues.getAsString("data8");
        if (!TextUtils.isEmpty(s))
            as[4] = s;
        else
            as[4] = "";
        as[5] = contentvalues.getAsString("data9");
        if (as[5] == null)
            as[5] = "";
        as[6] = contentvalues.getAsString("data10");
        if (as[6] == null)
            as[6] = "";
        return as;
    }

    public static void insertStructuredPostalDataUsingContactsStruct(int i, android.content.ContentProviderOperation.Builder builder, ContactStruct.PostalData postaldata)
    {
        builder.withValueBackReference("raw_contact_id", 0);
        builder.withValue("mimetype", "vnd.android.cursor.item/postal-address_v2");
        builder.withValue("data2", Integer.valueOf(postaldata.type));
        if (postaldata.type == 0)
            builder.withValue("data3", postaldata.label);
        builder.withValue("data5", postaldata.pobox);
        builder.withValue("data4", postaldata.street);
        builder.withValue("data7", postaldata.localty);
        builder.withValue("data8", postaldata.region);
        builder.withValue("data9", postaldata.postalCode);
        builder.withValue("data10", postaldata.country);
        builder.withValue("data1", postaldata.getFormattedAddress(i));
        if (postaldata.isPrimary)
            builder.withValue("is_primary", Integer.valueOf(1));
    }

    public static boolean isAllowablePhoneNumberChar(char c)
    {
        return Character.isDigit(c) || c == '(' || c == '/' || c == ')' || c == '-' || c == 'N' || c == ',' || c == '.' || c == '*' || c == '#' || c == '+' || c == ' ';
    }

    public static boolean isValidPhoneAttribute(String s, int i)
    {
        return s.startsWith("X-") || s.startsWith("x-") || PHONE_TYPE_SET_UNKNOWN_TO_CONTACTS.contains(s);
    }

    public static String[] sortNameElements(int i, String s, String s1, String s2)
    {
        String as[] = new String[3];
        switch (VCardConfig.getNameOrderType(i))
        {
        case 4: // '\004'
            as[0] = s1;
            as[1] = s2;
            as[2] = s;
            return as;

        case 8: // '\b'
            as[0] = s;
            as[1] = s1;
            as[2] = s2;
            return as;
        }
        as[0] = s2;
        as[1] = s1;
        as[2] = s;
        return as;
    }

    public static String toHalfWidthString(String s)
    {
        if (s != null && !TextUtils.isEmpty(s))
        {
            StringBuilder stringbuilder = new StringBuilder();
            int i = s.length();
            for (int j = 0; j < i; j++)
            {
                char c = s.charAt(j);
                CharSequence charsequence = JapaneseUtils.tryGetHalfWidthText(c);
                if (charsequence != null)
                    stringbuilder.append(charsequence);
                else
                    stringbuilder.append(c);
            }

            return stringbuilder.toString();
        } else
        {
            return null;
        }
    }

    static 
    {
        KNOWN_PHONE_TYPE_MAP_ITOS = new HashMap();
        KNOWN_PHONE_TYPES_MAP_STOI = new HashMap();
        KNOWN_PHONE_TYPE_MAP_ITOS.put(Integer.valueOf(9), "CAR");
        KNOWN_PHONE_TYPES_MAP_STOI.put("CAR", Integer.valueOf(9));
        KNOWN_PHONE_TYPE_MAP_ITOS.put(Integer.valueOf(6), "PAGER");
        KNOWN_PHONE_TYPES_MAP_STOI.put("PAGER", Integer.valueOf(6));
        KNOWN_PHONE_TYPE_MAP_ITOS.put(Integer.valueOf(11), "ISDN");
        KNOWN_PHONE_TYPES_MAP_STOI.put("ISDN", Integer.valueOf(11));
        KNOWN_PHONE_TYPES_MAP_STOI.put("HOME", Integer.valueOf(1));
        KNOWN_PHONE_TYPES_MAP_STOI.put("WORK", Integer.valueOf(3));
        KNOWN_PHONE_TYPES_MAP_STOI.put("CELL", Integer.valueOf(2));
        KNOWN_PHONE_TYPES_MAP_STOI.put("OTHER", Integer.valueOf(7));
        KNOWN_PHONE_TYPES_MAP_STOI.put("CALLBACK", Integer.valueOf(8));
        KNOWN_PHONE_TYPES_MAP_STOI.put("COMPANY-MAIN", Integer.valueOf(10));
        KNOWN_PHONE_TYPES_MAP_STOI.put("RADIO", Integer.valueOf(14));
        KNOWN_PHONE_TYPES_MAP_STOI.put("TELEX", Integer.valueOf(15));
        KNOWN_PHONE_TYPES_MAP_STOI.put("TTY-TDD", Integer.valueOf(16));
        KNOWN_PHONE_TYPES_MAP_STOI.put("ASSISTANT", Integer.valueOf(19));
        PHONE_TYPE_SET_UNKNOWN_TO_CONTACTS = new HashSet();
        PHONE_TYPE_SET_UNKNOWN_TO_CONTACTS.add("MODEM");
        PHONE_TYPE_SET_UNKNOWN_TO_CONTACTS.add("MSG");
        PHONE_TYPE_SET_UNKNOWN_TO_CONTACTS.add("BBS");
        PHONE_TYPE_SET_UNKNOWN_TO_CONTACTS.add("VIDEO");
    }
}
