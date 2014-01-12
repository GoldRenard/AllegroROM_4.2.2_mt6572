// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.vcard;

import android.telephony.PhoneNumberUtils;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.util.Log;
import com.android.vcard.exception.VCardException;
import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.util.*;

// Referenced classes of package com.android.vcard:
//            VCardConfig, VCardParserImpl_V40, VCardParserImpl_V30, VCardParserImpl_V21, 
//            VCardParser_V21, VCardParser_V30, VCardParser_V40, JapaneseUtils, 
//            VCardParser

public class VCardUtils
{
    private static class DecoderException extends Exception
    {

        public DecoderException(String s)
        {
            super(s);
        }
    }

    public static class PhoneNumberUtilsPort
    {

        public static String formatNumber(String s, int i)
        {
            SpannableStringBuilder spannablestringbuilder = new SpannableStringBuilder(s);
            PhoneNumberUtils.formatNumber(spannablestringbuilder, i);
            return spannablestringbuilder.toString();
        }

    }

    private static class QuotedPrintableCodecPort
    {

        private static byte ESCAPE_CHAR = 61;

        public static final byte[] decodeQuotedPrintable(byte abyte0[])
            throws DecoderException
        {
            ByteArrayOutputStream bytearrayoutputstream;
            int i;
            if (abyte0 == null)
                return null;
            bytearrayoutputstream = new ByteArrayOutputStream();
            i = 0;
_L7:
            if (i >= abyte0.length) goto _L2; else goto _L1
_L1:
            byte byte0 = abyte0[i];
            if (byte0 != ESCAPE_CHAR) goto _L4; else goto _L3
_L3:
            int k;
            int l;
            int j = i + 1;
            try
            {
                k = Character.digit((char)abyte0[j], 16);
            }
            catch (ArrayIndexOutOfBoundsException arrayindexoutofboundsexception)
            {
                throw new DecoderException("Invalid quoted-printable encoding");
            }
            i = j + 1;
            l = Character.digit((char)abyte0[i], 16);
            if (k != -1 && l != -1)
                break MISSING_BLOCK_LABEL_100;
            throw new DecoderException("Invalid quoted-printable encoding");
            char c = (char)(l + (k << 4));
            bytearrayoutputstream.write(c);
_L5:
            i++;
            continue; /* Loop/switch isn't completed */
_L4:
            bytearrayoutputstream.write(byte0);
            if (true) goto _L5; else goto _L2
_L2:
            return bytearrayoutputstream.toByteArray();
            if (true) goto _L7; else goto _L6
_L6:
        }


        private QuotedPrintableCodecPort()
        {
        }
    }

    public static class TextUtilsPort
    {

        public static boolean isPrintableAscii(char c)
        {
            return ' ' <= c && c <= '~' || c == '\r' || c == '\n';
        }

        public static boolean isPrintableAsciiOnly(CharSequence charsequence)
        {
            int i = charsequence.length();
            for (int j = 0; j < i; j++)
                if (!isPrintableAscii(charsequence.charAt(j)))
                    return false;

            return true;
        }

    }


    private static final String LOG_TAG = "vCard";
    private static final int sEscapeIndicatorsV30[] = {
        58, 59, 44, 32
    };
    private static final int sEscapeIndicatorsV40[] = {
        59, 58
    };
    private static final Map sKnownCombinationTypeMap;
    private static final Map sKnownImPropNameMap_ItoS;
    private static final Map sKnownPhoneTypeMap_StoI;
    private static final Map sKnownPhoneTypesMap_ItoS;
    private static final Set sMobilePhoneLabelSet = new HashSet(Arrays.asList(new String[] {
        "MOBILE", "\u643A\u5E2F\u96FB\u8A71", "\u643A\u5E2F", "\u30B1\u30A4\u30BF\u30A4", "\uFF79\uFF72\uFF80\uFF72"
    }));
    private static final Set sPhoneTypesUnknownToContactsSet;
    private static final Set sUnAcceptableAsciiInV21WordSet;

    private VCardUtils()
    {
    }

    public static boolean appearsLikeAndroidVCardQuotedPrintable(String s)
    {
label0:
        {
            int i = s.length() % 3;
            if (s.length() >= 2 && (i == 1 || i == 0))
            {
                int j = 0;
                do
                {
                    if (j >= s.length())
                        break label0;
                    if (s.charAt(j) != '=')
                        break;
                    j += 3;
                } while (true);
            }
            return false;
        }
        return true;
    }

    public static transient boolean areAllEmpty(String as[])
    {
        if (as != null)
        {
            int i = as.length;
            for (int j = 0; j < i; j++)
                if (!TextUtils.isEmpty(as[j]))
                    return false;

        }
        return true;
    }

    public static List constructListFromValue(String s, int i)
    {
        ArrayList arraylist = new ArrayList();
        StringBuilder stringbuilder = new StringBuilder();
        int j = s.length();
        for (int k = 0; k < j; k++)
        {
            char c = s.charAt(k);
            if (c == '\\' && k < j - 1)
            {
                char c1 = s.charAt(k + 1);
                String s1;
                if (VCardConfig.isVersion40(i))
                    s1 = VCardParserImpl_V40.unescapeCharacter(c1);
                else
                if (VCardConfig.isVersion30(i))
                {
                    s1 = VCardParserImpl_V30.unescapeCharacter(c1);
                } else
                {
                    if (!VCardConfig.isVersion21(i))
                        Log.w("vCard", "Unknown vCard type");
                    s1 = VCardParserImpl_V21.unescapeCharacter(c1);
                }
                if (s1 != null)
                {
                    stringbuilder.append(s1);
                    k++;
                } else
                {
                    stringbuilder.append(c);
                }
                continue;
            }
            if (c == ';')
            {
                arraylist.add(stringbuilder.toString());
                stringbuilder = new StringBuilder();
            } else
            {
                stringbuilder.append(c);
            }
        }

        arraylist.add(stringbuilder.toString());
        return arraylist;
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

    public static boolean containsOnlyAlphaDigitHyphen(Collection collection)
    {
        if (collection != null)
        {
            Iterator iterator = collection.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                String s = (String)iterator.next();
                if (!TextUtils.isEmpty(s))
                {
                    int i = s.length();
                    int j = 0;
                    while (j < i) 
                    {
                        int k = s.codePointAt(j);
                        if ((97 > k || k >= 123) && (65 > k || k >= 91) && (48 > k || k >= 58) && k != 45)
                            return false;
                        j = s.offsetByCodePoints(j, 1);
                    }
                }
            } while (true);
        }
        return true;
    }

    public static transient boolean containsOnlyAlphaDigitHyphen(String as[])
    {
        if (as == null)
            return true;
        else
            return containsOnlyAlphaDigitHyphen(((Collection) (Arrays.asList(as))));
    }

    public static boolean containsOnlyNonCrLfPrintableAscii(Collection collection)
    {
        if (collection != null)
        {
            Iterator iterator = collection.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                String s = (String)iterator.next();
                if (!TextUtils.isEmpty(s))
                {
                    int i = s.length();
                    int j = 0;
                    while (j < i) 
                    {
                        int k = s.codePointAt(j);
                        if (32 <= k && k <= 126)
                            j = s.offsetByCodePoints(j, 1);
                        else
                            return false;
                    }
                }
            } while (true);
        }
        return true;
    }

    public static transient boolean containsOnlyNonCrLfPrintableAscii(String as[])
    {
        if (as == null)
            return true;
        else
            return containsOnlyNonCrLfPrintableAscii(((Collection) (Arrays.asList(as))));
    }

    public static boolean containsOnlyPrintableAscii(Collection collection)
    {
label0:
        {
            if (collection == null)
                break label0;
            Iterator iterator = collection.iterator();
            String s;
            do
            {
                if (!iterator.hasNext())
                    break label0;
                s = (String)iterator.next();
            } while (TextUtils.isEmpty(s) || TextUtilsPort.isPrintableAsciiOnly(s));
            return false;
        }
        return true;
    }

    public static transient boolean containsOnlyPrintableAscii(String as[])
    {
        if (as == null)
            return true;
        else
            return containsOnlyPrintableAscii(((Collection) (Arrays.asList(as))));
    }

    public static boolean containsOnlyWhiteSpaces(Collection collection)
    {
        if (collection != null)
        {
            Iterator iterator = collection.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                String s = (String)iterator.next();
                if (!TextUtils.isEmpty(s))
                {
                    int i = s.length();
                    int j = 0;
                    while (j < i) 
                    {
                        if (!Character.isWhitespace(s.codePointAt(j)))
                            return false;
                        j = s.offsetByCodePoints(j, 1);
                    }
                }
            } while (true);
        }
        return true;
    }

    public static transient boolean containsOnlyWhiteSpaces(String as[])
    {
        if (as == null)
            return true;
        else
            return containsOnlyWhiteSpaces(((Collection) (Arrays.asList(as))));
    }

    public static final String convertStringCharset(String s, String s1, String s2)
    {
        if (s1.equalsIgnoreCase(s2))
            return s;
        ByteBuffer bytebuffer = Charset.forName(s1).encode(s);
        byte abyte0[] = new byte[bytebuffer.remaining()];
        bytebuffer.get(abyte0);
        String s3;
        try
        {
            s3 = new String(abyte0, s2);
        }
        catch (UnsupportedEncodingException unsupportedencodingexception)
        {
            Log.e("vCard", (new StringBuilder()).append("Failed to encode: charset=").append(s2).toString());
            return null;
        }
        return s3;
    }

    public static final VCardParser getAppropriateParser(int i)
        throws VCardException
    {
        if (VCardConfig.isVersion21(i))
            return new VCardParser_V21();
        if (VCardConfig.isVersion30(i))
            return new VCardParser_V30();
        if (VCardConfig.isVersion40(i))
            return new VCardParser_V40();
        else
            throw new VCardException("Version is not specified");
    }

    public static int getPhoneNumberFormat(int i)
    {
        return !VCardConfig.isJapaneseDevice(i) ? 1 : 2;
    }

    public static Object getPhoneTypeFromStrings(Collection collection, String s)
    {
        int i;
        boolean flag;
        boolean flag1;
        String s1;
label0:
        {
label1:
            {
                if (s == null)
                    s = "";
                i = -1;
                flag = false;
                flag1 = false;
                s1 = null;
                if (collection == null)
                    break label0;
                if (collection.size() < 2)
                    break label1;
                Iterator iterator1 = sKnownCombinationTypeMap.keySet().iterator();
                String s5;
                boolean flag2;
label2:
                do
                {
                    if (!iterator1.hasNext())
                        break label1;
                    s5 = (String)iterator1.next();
                    flag2 = true;
                    Iterator iterator2 = collection.iterator();
                    do
                        if (!iterator2.hasNext())
                            continue label2;
                    while (s5.indexOf((String)iterator2.next()) >= 0);
                    flag2 = false;
                } while (!flag2);
                return Integer.valueOf(((Integer)sKnownCombinationTypeMap.get(s5)).intValue());
            }
            Iterator iterator = collection.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                String s2 = (String)iterator.next();
                if (s2 != null)
                {
                    String s3 = s2.toUpperCase();
                    if (s3.equals("PREF"))
                        flag = true;
                    else
                    if (s3.equals("FAX"))
                    {
                        flag1 = true;
                    } else
                    {
                        String s4;
                        if (s3.startsWith("X-") && i < 0)
                            s4 = s2.substring(2);
                        else
                            s4 = s2;
                        if (s4.length() != 0)
                        {
                            Integer integer = (Integer)sKnownPhoneTypeMap_StoI.get(s4.toUpperCase());
                            if (integer != null)
                            {
                                int j = integer.intValue();
                                int k = s.indexOf("@");
                                if (j == 6 && k > 0 && k < -1 + s.length() || i < 0 || i == 0 || i == 7)
                                    i = integer.intValue();
                            } else
                            if (i < 0)
                            {
                                s1 = s4;
                                i = 0;
                            }
                        }
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
            return s1;
        else
            return Integer.valueOf(i);
    }

    public static String getPhoneTypeString(Integer integer)
    {
        return (String)sKnownPhoneTypesMap_ItoS.get(integer);
    }

    public static String getPropertyNameForIm(int i)
    {
        return (String)sKnownImPropNameMap_ItoS.get(Integer.valueOf(i));
    }

    public static String guessImageType(byte abyte0[])
    {
        if (abyte0 == null)
            return null;
        if (abyte0.length >= 3 && abyte0[0] == 71 && abyte0[1] == 73 && abyte0[2] == 70)
            return "GIF";
        if (abyte0.length >= 4 && abyte0[0] == -119 && abyte0[1] == 80 && abyte0[2] == 78 && abyte0[3] == 71)
            return "PNG";
        if (abyte0.length >= 2 && abyte0[0] == -1 && abyte0[1] == -40)
            return "JPEG";
        else
            return null;
    }

    public static boolean isMobilePhoneLabel(String s)
    {
        return "_AUTO_CELL".equals(s) || sMobilePhoneLabelSet.contains(s);
    }

    public static boolean isV21Word(String s)
    {
        if (!TextUtils.isEmpty(s))
        {
            int i = s.length();
            for (int j = 0; j < i;)
            {
                int k = s.codePointAt(j);
                if (32 <= k && k <= 126 && !sUnAcceptableAsciiInV21WordSet.contains(Character.valueOf((char)k)))
                    j = s.offsetByCodePoints(j, 1);
                else
                    return false;
            }

        }
        return true;
    }

    public static boolean isValidInV21ButUnknownToContactsPhoteType(String s)
    {
        return sPhoneTypesUnknownToContactsSet.contains(s);
    }

    public static String parseQuotedPrintable(String s, boolean flag, String s1, String s2)
    {
        StringBuilder stringbuilder;
        int i;
        int j;
        stringbuilder = new StringBuilder();
        i = s.length();
        j = 0;
_L2:
        char c1;
        if (j >= i)
            break MISSING_BLOCK_LABEL_101;
        c1 = s.charAt(j);
        if (c1 != '=' || j >= i - 1)
            break; /* Loop/switch isn't completed */
        char c2 = s.charAt(j + 1);
        if (c2 != ' ' && c2 != '\t')
            break; /* Loop/switch isn't completed */
        stringbuilder.append(c2);
        j++;
_L3:
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        stringbuilder.append(c1);
          goto _L3
        if (true) goto _L2; else goto _L4
_L4:
        String s3 = stringbuilder.toString();
        if (!flag) goto _L6; else goto _L5
_L5:
        String as[] = s3.split("\r\n");
_L8:
        StringBuilder stringbuilder2;
        stringbuilder2 = new StringBuilder();
        String as1[] = as;
        int i1 = as1.length;
        for (int j1 = 0; j1 < i1; j1++)
        {
            String s8 = as1[j1];
            if (s8.endsWith("="))
                s8 = s8.substring(0, -1 + s8.length());
            stringbuilder2.append(s8);
        }

        break; /* Loop/switch isn't completed */
_L6:
        StringBuilder stringbuilder1 = new StringBuilder();
        int k = s3.length();
        ArrayList arraylist = new ArrayList();
        int l = 0;
        while (l < k) 
        {
            char c = s3.charAt(l);
            if (c == '\n')
            {
                arraylist.add(stringbuilder1.toString());
                stringbuilder1 = new StringBuilder();
            } else
            if (c == '\r')
            {
                arraylist.add(stringbuilder1.toString());
                stringbuilder1 = new StringBuilder();
                if (l < k - 1 && s3.charAt(l + 1) == '\n')
                    l++;
            } else
            {
                stringbuilder1.append(c);
            }
            l++;
        }
        String s4 = stringbuilder1.toString();
        if (s4.length() > 0)
            arraylist.add(s4);
        as = (String[])arraylist.toArray(new String[0]);
        if (true) goto _L8; else goto _L7
_L7:
        byte abyte0[];
        byte abyte1[];
        String s5 = stringbuilder2.toString();
        if (TextUtils.isEmpty(s5))
            Log.w("vCard", "Given raw string is empty.");
        String s6;
        byte abyte2[];
        byte abyte3[];
        try
        {
            abyte3 = s5.getBytes(s1);
        }
        catch (UnsupportedEncodingException unsupportedencodingexception)
        {
            Log.w("vCard", (new StringBuilder()).append("Failed to decode: ").append(s1).toString());
            abyte0 = s5.getBytes();
            continue; /* Loop/switch isn't completed */
        }
        abyte0 = abyte3;
_L12:
        abyte2 = QuotedPrintableCodecPort.decodeQuotedPrintable(abyte0);
        abyte1 = abyte2;
_L10:
        s6 = new String(abyte1, s2);
        return s6;
        DecoderException decoderexception;
        decoderexception;
        Log.e("vCard", "DecoderException is thrown.");
        abyte1 = abyte0;
        if (true) goto _L10; else goto _L9
_L9:
        UnsupportedEncodingException unsupportedencodingexception1;
        unsupportedencodingexception1;
        Log.e("vCard", (new StringBuilder()).append("Failed to encode: charset=").append(s2).toString());
        String s7 = new String(abyte1);
        return s7;
        if (true) goto _L12; else goto _L11
_L11:
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
            if (containsOnlyPrintableAscii(new String[] {
    s
}) && containsOnlyPrintableAscii(new String[] {
    s2
}))
            {
                as[0] = s2;
                as[1] = s1;
                as[2] = s;
                return as;
            } else
            {
                as[0] = s;
                as[1] = s1;
                as[2] = s2;
                return as;
            }
        }
        as[0] = s2;
        as[1] = s1;
        as[2] = s;
        return as;
    }

    public static String toHalfWidthString(String s)
    {
        if (TextUtils.isEmpty(s))
            return null;
        StringBuilder stringbuilder = new StringBuilder();
        int i = s.length();
        for (int j = 0; j < i; j = s.offsetByCodePoints(j, 1))
        {
            char c = s.charAt(j);
            String s1 = JapaneseUtils.tryGetHalfWidthText(c);
            if (s1 != null)
                stringbuilder.append(s1);
            else
                stringbuilder.append(c);
        }

        return stringbuilder.toString();
    }

    private static String toStringAsParamValue(String s, int ai[])
    {
        StringBuilder stringbuilder;
        int i;
        boolean flag;
        int j;
        if (TextUtils.isEmpty(s))
            s = "";
        stringbuilder = new StringBuilder();
        i = s.length();
        flag = false;
        j = 0;
_L10:
        if (j >= i) goto _L2; else goto _L1
_L1:
        int k = s.codePointAt(j);
        if (k < 32 || k == 34) goto _L4; else goto _L3
_L3:
        int l;
        int i1;
        stringbuilder.appendCodePoint(k);
        l = ai.length;
        i1 = 0;
_L8:
        if (i1 >= l) goto _L4; else goto _L5
_L5:
        if (k != ai[i1]) goto _L7; else goto _L6
_L6:
        flag = true;
_L4:
        j = s.offsetByCodePoints(j, 1);
        continue; /* Loop/switch isn't completed */
_L7:
        i1++;
        if (true) goto _L8; else goto _L2
_L2:
        String s1 = stringbuilder.toString();
        if (!s1.isEmpty() && !containsOnlyWhiteSpaces(new String[] {
    s1
}))
        {
            if (flag)
                return (new StringBuilder()).append('"').append(s1).append('"').toString();
        } else
        {
            s1 = "";
        }
        return s1;
        if (true) goto _L10; else goto _L9
_L9:
    }

    public static String toStringAsV30ParamValue(String s)
    {
        return toStringAsParamValue(s, sEscapeIndicatorsV30);
    }

    public static String toStringAsV40ParamValue(String s)
    {
        return toStringAsParamValue(s, sEscapeIndicatorsV40);
    }

    static 
    {
        sKnownPhoneTypesMap_ItoS = new HashMap();
        sKnownPhoneTypeMap_StoI = new HashMap();
        sKnownPhoneTypesMap_ItoS.put(Integer.valueOf(9), "CAR");
        sKnownPhoneTypeMap_StoI.put("CAR", Integer.valueOf(9));
        sKnownPhoneTypesMap_ItoS.put(Integer.valueOf(6), "PAGER");
        sKnownPhoneTypeMap_StoI.put("PAGER", Integer.valueOf(6));
        sKnownPhoneTypesMap_ItoS.put(Integer.valueOf(11), "ISDN");
        sKnownPhoneTypeMap_StoI.put("ISDN", Integer.valueOf(11));
        sKnownPhoneTypeMap_StoI.put("HOME", Integer.valueOf(1));
        sKnownPhoneTypeMap_StoI.put("WORK", Integer.valueOf(3));
        sKnownPhoneTypeMap_StoI.put("CELL", Integer.valueOf(2));
        sKnownPhoneTypeMap_StoI.put("OTHER", Integer.valueOf(7));
        sKnownPhoneTypeMap_StoI.put("CALLBACK", Integer.valueOf(8));
        sKnownPhoneTypeMap_StoI.put("COMPANY-MAIN", Integer.valueOf(10));
        sKnownPhoneTypeMap_StoI.put("RADIO", Integer.valueOf(14));
        sKnownPhoneTypeMap_StoI.put("TTY-TDD", Integer.valueOf(16));
        sKnownPhoneTypeMap_StoI.put("ASSISTANT", Integer.valueOf(19));
        sKnownPhoneTypeMap_StoI.put("OTHER-FAX", Integer.valueOf(13));
        sKnownPhoneTypeMap_StoI.put("TLX", Integer.valueOf(15));
        sKnownPhoneTypeMap_StoI.put("MSG", Integer.valueOf(20));
        sKnownPhoneTypeMap_StoI.put("VOICE", Integer.valueOf(7));
        sPhoneTypesUnknownToContactsSet = new HashSet();
        sPhoneTypesUnknownToContactsSet.add("MODEM");
        sPhoneTypesUnknownToContactsSet.add("MSG");
        sPhoneTypesUnknownToContactsSet.add("BBS");
        sPhoneTypesUnknownToContactsSet.add("VIDEO");
        sKnownImPropNameMap_ItoS = new HashMap();
        sKnownImPropNameMap_ItoS.put(Integer.valueOf(0), "X-AIM");
        sKnownImPropNameMap_ItoS.put(Integer.valueOf(1), "X-MSN");
        sKnownImPropNameMap_ItoS.put(Integer.valueOf(2), "X-YAHOO");
        sKnownImPropNameMap_ItoS.put(Integer.valueOf(3), "X-SKYPE-USERNAME");
        sKnownImPropNameMap_ItoS.put(Integer.valueOf(5), "X-GOOGLE-TALK");
        sKnownImPropNameMap_ItoS.put(Integer.valueOf(6), "X-ICQ");
        sKnownImPropNameMap_ItoS.put(Integer.valueOf(7), "X-JABBER");
        sKnownImPropNameMap_ItoS.put(Integer.valueOf(4), "X-QQ");
        sKnownImPropNameMap_ItoS.put(Integer.valueOf(8), "X-NETMEETING");
        sKnownImPropNameMap_ItoS.put(Integer.valueOf(-1), "X-CUSTOM-IM");
        sKnownCombinationTypeMap = new HashMap();
        sKnownCombinationTypeMap.put("WORK;PAGER", Integer.valueOf(18));
        sKnownCombinationTypeMap.put("WORK;CELL", Integer.valueOf(17));
        Character acharacter[] = new Character[7];
        acharacter[0] = Character.valueOf('[');
        acharacter[1] = Character.valueOf(']');
        acharacter[2] = Character.valueOf('=');
        acharacter[3] = Character.valueOf(':');
        acharacter[4] = Character.valueOf('.');
        acharacter[5] = Character.valueOf(',');
        acharacter[6] = Character.valueOf(' ');
        sUnAcceptableAsciiInV21WordSet = new HashSet(Arrays.asList(acharacter));
    }
}
