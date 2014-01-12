// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.vcard;

import android.content.ContentValues;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import java.io.UnsupportedEncodingException;
import java.util.*;

// Referenced classes of package com.android.vcard:
//            VCardConfig, VCardUtils, VCardPhoneNumberTranslationCallback

public class VCardBuilder
{
    private static class PostalStruct
    {

        final String addressData;
        final boolean appendCharset;
        final boolean reallyUseQuotedPrintable;

        public PostalStruct(boolean flag, boolean flag1, String s)
        {
            reallyUseQuotedPrintable = flag;
            appendCharset = flag1;
            addressData = s;
        }
    }


    public static final int DEFAULT_EMAIL_TYPE = 3;
    public static final int DEFAULT_PHONE_TYPE = 1;
    public static final int DEFAULT_POSTAL_TYPE = 1;
    private static final String LOG_TAG = "vCard";
    private static final String SHIFT_JIS = "SHIFT_JIS";
    private static final String VCARD_DATA_PUBLIC = "PUBLIC";
    private static final String VCARD_DATA_SEPARATOR = ":";
    private static final String VCARD_DATA_VCARD = "VCARD";
    public static final String VCARD_END_OF_LINE = "\r\n";
    private static final String VCARD_ITEM_SEPARATOR = ";";
    private static final String VCARD_PARAM_ENCODING_BASE64_AS_B = "ENCODING=B";
    private static final String VCARD_PARAM_ENCODING_BASE64_V21 = "ENCODING=BASE64";
    private static final String VCARD_PARAM_ENCODING_QP = "ENCODING=QUOTED-PRINTABLE";
    private static final String VCARD_PARAM_EQUAL = "=";
    private static final String VCARD_PARAM_SEPARATOR = ";";
    private static final String VCARD_WS = " ";
    private static final Set sAllowedAndroidPropertySet = Collections.unmodifiableSet(new HashSet(Arrays.asList(new String[] {
        "vnd.android.cursor.item/nickname", "vnd.android.cursor.item/contact_event", "vnd.android.cursor.item/relation"
    })));
    private static final Map sPostalTypePriorityMap;
    private final boolean mAppendTypeParamName;
    private StringBuilder mBuilder;
    private final String mCharset;
    private boolean mEndAppended;
    private final boolean mIsDoCoMo;
    private final boolean mIsJapaneseMobilePhone;
    private final boolean mIsV30OrV40;
    private final boolean mNeedsToConvertPhoneticString;
    private final boolean mOnlyOneNoteFieldIsAvailable;
    private final boolean mRefrainsQPToNameProperties;
    private final boolean mShouldAppendCharsetParam;
    private final boolean mShouldUseQuotedPrintable;
    private final boolean mUsesAndroidProperty;
    private final boolean mUsesDefactProperty;
    private final String mVCardCharsetParameter;
    private final int mVCardType;

    public VCardBuilder(int i)
    {
        this(i, null);
    }

    public VCardBuilder(int i, String s)
    {
        boolean flag1;
label0:
        {
            super();
            mVCardType = i;
            if (VCardConfig.isVersion40(i))
                Log.w("vCard", "Should not use vCard 4.0 when building vCard. It is not officially published yet.");
            boolean flag;
            if (!VCardConfig.isVersion30(i) && !VCardConfig.isVersion40(i))
                flag = false;
            else
                flag = true;
            mIsV30OrV40 = flag;
            mShouldUseQuotedPrintable = VCardConfig.shouldUseQuotedPrintable(i);
            mIsDoCoMo = VCardConfig.isDoCoMo(i);
            mIsJapaneseMobilePhone = VCardConfig.needsToConvertPhoneticString(i);
            mOnlyOneNoteFieldIsAvailable = VCardConfig.onlyOneNoteFieldIsAvailable(i);
            mUsesAndroidProperty = VCardConfig.usesAndroidSpecificProperty(i);
            mUsesDefactProperty = VCardConfig.usesDefactProperty(i);
            mRefrainsQPToNameProperties = VCardConfig.shouldRefrainQPToNameProperties(i);
            mAppendTypeParamName = VCardConfig.appendTypeParamName(i);
            mNeedsToConvertPhoneticString = VCardConfig.needsToConvertPhoneticString(i);
            if (VCardConfig.isVersion30(i))
            {
                boolean flag2 = "UTF-8".equalsIgnoreCase(s);
                flag1 = false;
                if (flag2)
                    break label0;
            }
            flag1 = true;
        }
        mShouldAppendCharsetParam = flag1;
        if (VCardConfig.isDoCoMo(i))
        {
            if (!"SHIFT_JIS".equalsIgnoreCase(s))
            {
                if (TextUtils.isEmpty(s))
                    mCharset = "SHIFT_JIS";
                else
                    mCharset = s;
            } else
            {
                mCharset = s;
            }
            mVCardCharsetParameter = "CHARSET=SHIFT_JIS";
        } else
        if (TextUtils.isEmpty(s))
        {
            Log.i("vCard", "Use the charset \"UTF-8\" for export.");
            mCharset = "UTF-8";
            mVCardCharsetParameter = "CHARSET=UTF-8";
        } else
        {
            mCharset = s;
            mVCardCharsetParameter = (new StringBuilder()).append("CHARSET=").append(s).toString();
        }
        clear();
    }

    private VCardBuilder appendNamePropertiesV40(List list)
    {
        if (mIsDoCoMo || mNeedsToConvertPhoneticString)
            Log.w("vCard", "Invalid flag is used in vCard 4.0 construction. Ignored.");
        if (list != null && !list.isEmpty())
        {
            ContentValues contentvalues = getPrimaryContentValueWithStructuredName(list);
            String s = contentvalues.getAsString("data3");
            String s1 = contentvalues.getAsString("data5");
            String s2 = contentvalues.getAsString("data2");
            String s3 = contentvalues.getAsString("data4");
            String s4 = contentvalues.getAsString("data6");
            String s5 = contentvalues.getAsString("data1");
            if (TextUtils.isEmpty(s) && TextUtils.isEmpty(s2) && TextUtils.isEmpty(s1) && TextUtils.isEmpty(s3) && TextUtils.isEmpty(s4))
            {
                if (TextUtils.isEmpty(s5))
                {
                    appendLine("FN", "");
                    return this;
                }
                s = s5;
            }
            String s6 = contentvalues.getAsString("data9");
            String s7 = contentvalues.getAsString("data8");
            String s8 = contentvalues.getAsString("data7");
            String s9 = escapeCharacters(s);
            String s10 = escapeCharacters(s2);
            String s11 = escapeCharacters(s1);
            String s12 = escapeCharacters(s3);
            String s13 = escapeCharacters(s4);
            mBuilder.append("N");
            if (!TextUtils.isEmpty(s6) || !TextUtils.isEmpty(s7) || !TextUtils.isEmpty(s8))
            {
                mBuilder.append(";");
                String s14 = (new StringBuilder()).append(escapeCharacters(s6)).append(';').append(escapeCharacters(s8)).append(';').append(escapeCharacters(s7)).toString();
                mBuilder.append("SORT-AS=").append(VCardUtils.toStringAsV40ParamValue(s14));
            }
            mBuilder.append(":");
            mBuilder.append(s9);
            mBuilder.append(";");
            mBuilder.append(s10);
            mBuilder.append(";");
            mBuilder.append(s11);
            mBuilder.append(";");
            mBuilder.append(s12);
            mBuilder.append(";");
            mBuilder.append(s13);
            mBuilder.append("\r\n");
            if (TextUtils.isEmpty(s5))
            {
                Log.w("vCard", "DISPLAY_NAME is empty.");
                appendLine("FN", escapeCharacters(VCardUtils.constructNameFromElements(VCardConfig.getNameOrderType(mVCardType), s, s1, s2, s3, s4)));
            } else
            {
                String s15 = escapeCharacters(s5);
                mBuilder.append("FN");
                mBuilder.append(":");
                mBuilder.append(s15);
                mBuilder.append("\r\n");
            }
            appendPhoneticNameFields(contentvalues);
            return this;
        } else
        {
            appendLine("FN", "");
            return this;
        }
    }

    private void appendPhoneticNameFields(ContentValues contentvalues)
    {
        String s = contentvalues.getAsString("data9");
        String s1 = contentvalues.getAsString("data8");
        String s2 = contentvalues.getAsString("data7");
        String s3;
        String s4;
        String s5;
        if (mNeedsToConvertPhoneticString)
        {
            s3 = VCardUtils.toHalfWidthString(s);
            s4 = VCardUtils.toHalfWidthString(s1);
            s5 = VCardUtils.toHalfWidthString(s2);
        } else
        {
            s3 = s;
            s4 = s1;
            s5 = s2;
        }
        if (TextUtils.isEmpty(s3) && TextUtils.isEmpty(s4) && TextUtils.isEmpty(s5))
        {
            if (mIsDoCoMo)
            {
                mBuilder.append("SOUND");
                mBuilder.append(";");
                mBuilder.append("X-IRMC-N");
                mBuilder.append(":");
                mBuilder.append(";");
                mBuilder.append(";");
                mBuilder.append(";");
                mBuilder.append(";");
                mBuilder.append("\r\n");
            }
        } else
        {
            if (!VCardConfig.isVersion40(mVCardType))
                if (VCardConfig.isVersion30(mVCardType))
                {
                    String s12 = VCardUtils.constructNameFromElements(mVCardType, s3, s4, s5);
                    mBuilder.append("SORT-STRING");
                    if (VCardConfig.isVersion30(mVCardType) && shouldAppendCharsetParam(new String[] {
    s12
}))
                    {
                        mBuilder.append(";");
                        mBuilder.append(mVCardCharsetParameter);
                    }
                    mBuilder.append(":");
                    mBuilder.append(escapeCharacters(s12));
                    mBuilder.append("\r\n");
                } else
                if (mIsJapaneseMobilePhone)
                {
                    mBuilder.append("SOUND");
                    mBuilder.append(";");
                    mBuilder.append("X-IRMC-N");
                    boolean flag3;
                    if (mRefrainsQPToNameProperties || VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s3
}) && VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s4
}) && VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s5
}))
                        flag3 = false;
                    else
                        flag3 = true;
                    String s9;
                    String s10;
                    String s11;
                    if (flag3)
                    {
                        s9 = encodeQuotedPrintable(s3);
                        s10 = encodeQuotedPrintable(s4);
                        s11 = encodeQuotedPrintable(s5);
                    } else
                    {
                        s9 = escapeCharacters(s3);
                        s10 = escapeCharacters(s4);
                        s11 = escapeCharacters(s5);
                    }
                    if (shouldAppendCharsetParam(new String[] {
    s9, s10, s11
}))
                    {
                        mBuilder.append(";");
                        mBuilder.append(mVCardCharsetParameter);
                    }
                    mBuilder.append(":");
                    boolean flag4 = true;
                    if (!TextUtils.isEmpty(s9))
                    {
                        mBuilder.append(s9);
                        flag4 = false;
                    }
                    if (!TextUtils.isEmpty(s10))
                    {
                        if (flag4)
                            flag4 = false;
                        else
                            mBuilder.append(' ');
                        mBuilder.append(s10);
                    }
                    if (!TextUtils.isEmpty(s11))
                    {
                        if (!flag4)
                            mBuilder.append(' ');
                        mBuilder.append(s11);
                    }
                    mBuilder.append(";");
                    mBuilder.append(";");
                    mBuilder.append(";");
                    mBuilder.append(";");
                    mBuilder.append("\r\n");
                }
            if (mUsesDefactProperty)
            {
                if (!TextUtils.isEmpty(s5))
                {
                    boolean flag2;
                    if (mShouldUseQuotedPrintable && !VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s5
}))
                        flag2 = true;
                    else
                        flag2 = false;
                    String s8;
                    if (flag2)
                        s8 = encodeQuotedPrintable(s5);
                    else
                        s8 = escapeCharacters(s5);
                    mBuilder.append("X-PHONETIC-FIRST-NAME");
                    if (shouldAppendCharsetParam(new String[] {
    s5
}))
                    {
                        mBuilder.append(";");
                        mBuilder.append(mVCardCharsetParameter);
                    }
                    if (flag2)
                    {
                        mBuilder.append(";");
                        mBuilder.append("ENCODING=QUOTED-PRINTABLE");
                    }
                    mBuilder.append(":");
                    mBuilder.append(s8);
                    mBuilder.append("\r\n");
                }
                if (!TextUtils.isEmpty(s4))
                {
                    boolean flag1;
                    if (mShouldUseQuotedPrintable && !VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s4
}))
                        flag1 = true;
                    else
                        flag1 = false;
                    String s7;
                    if (flag1)
                        s7 = encodeQuotedPrintable(s4);
                    else
                        s7 = escapeCharacters(s4);
                    mBuilder.append("X-PHONETIC-MIDDLE-NAME");
                    if (shouldAppendCharsetParam(new String[] {
    s4
}))
                    {
                        mBuilder.append(";");
                        mBuilder.append(mVCardCharsetParameter);
                    }
                    if (flag1)
                    {
                        mBuilder.append(";");
                        mBuilder.append("ENCODING=QUOTED-PRINTABLE");
                    }
                    mBuilder.append(":");
                    mBuilder.append(s7);
                    mBuilder.append("\r\n");
                }
                if (!TextUtils.isEmpty(s3))
                {
                    boolean flag;
                    if (mShouldUseQuotedPrintable && !VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s3
}))
                        flag = true;
                    else
                        flag = false;
                    String s6;
                    if (flag)
                        s6 = encodeQuotedPrintable(s3);
                    else
                        s6 = escapeCharacters(s3);
                    mBuilder.append("X-PHONETIC-LAST-NAME");
                    if (shouldAppendCharsetParam(new String[] {
    s3
}))
                    {
                        mBuilder.append(";");
                        mBuilder.append(mVCardCharsetParameter);
                    }
                    if (flag)
                    {
                        mBuilder.append(";");
                        mBuilder.append("ENCODING=QUOTED-PRINTABLE");
                    }
                    mBuilder.append(":");
                    mBuilder.append(s6);
                    mBuilder.append("\r\n");
                    return;
                }
            }
        }
    }

    private void appendPostalsForDoCoMo(List list)
    {
        int i = 0x7fffffff;
        int j = 0x7fffffff;
        ContentValues contentvalues = null;
        Iterator iterator = list.iterator();
        int k;
label0:
        do
        {
            ContentValues contentvalues1;
            Integer integer;
            do
            {
                do
                {
                    if (!iterator.hasNext())
                        break label0;
                    contentvalues1 = (ContentValues)iterator.next();
                } while (contentvalues1 == null);
                integer = contentvalues1.getAsInteger("data2");
                Integer integer1 = (Integer)sPostalTypePriorityMap.get(integer);
                if (integer1 != null)
                    k = integer1.intValue();
                else
                    k = 0x7fffffff;
            } while (k >= i);
            i = k;
            j = integer.intValue();
            contentvalues = contentvalues1;
        } while (k != 0);
        if (contentvalues == null)
        {
            Log.w("vCard", "Should not come here. Must have at least one postal data.");
            return;
        } else
        {
            appendPostalLine(j, contentvalues.getAsString("data3"), contentvalues, false, true);
            return;
        }
    }

    private void appendPostalsForGeneric(List list)
    {
        Iterator iterator = list.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            ContentValues contentvalues = (ContentValues)iterator.next();
            if (contentvalues != null)
            {
                Integer integer = contentvalues.getAsInteger("data2");
                int i;
                if (integer != null)
                    i = integer.intValue();
                else
                    i = 1;
                String s = contentvalues.getAsString("data3");
                Integer integer1 = contentvalues.getAsInteger("is_primary");
                boolean flag;
                if (integer1 != null)
                {
                    if (integer1.intValue() > 0)
                        flag = true;
                    else
                        flag = false;
                } else
                {
                    flag = false;
                }
                appendPostalLine(i, s, contentvalues, flag, false);
            }
        } while (true);
    }

    private void appendTypeParameter(String s)
    {
        appendTypeParameter(mBuilder, s);
    }

    private void appendTypeParameter(StringBuilder stringbuilder, String s)
    {
        if (VCardConfig.isVersion40(mVCardType) || (VCardConfig.isVersion30(mVCardType) || mAppendTypeParamName) && !mIsDoCoMo)
            stringbuilder.append("TYPE").append("=");
        stringbuilder.append(s);
    }

    private void appendTypeParameters(List list)
    {
        boolean flag = true;
        Iterator iterator = list.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            String s = (String)iterator.next();
            if (!VCardConfig.isVersion30(mVCardType) && !VCardConfig.isVersion40(mVCardType))
            {
                if (VCardUtils.isV21Word(s))
                {
                    if (flag)
                        flag = false;
                    else
                        mBuilder.append(";");
                    appendTypeParameter(s);
                }
            } else
            {
                String s1;
                if (VCardConfig.isVersion40(mVCardType))
                    s1 = VCardUtils.toStringAsV40ParamValue(s);
                else
                    s1 = VCardUtils.toStringAsV30ParamValue(s);
                if (!TextUtils.isEmpty(s1))
                {
                    if (flag)
                        flag = false;
                    else
                        mBuilder.append(";");
                    appendTypeParameter(s1);
                }
            }
        } while (true);
    }

    private void appendUncommonPhoneType(StringBuilder stringbuilder, Integer integer)
    {
        if (mIsDoCoMo)
        {
            stringbuilder.append("VOICE");
            return;
        }
        String s = VCardUtils.getPhoneTypeString(integer);
        if (s != null)
        {
            appendTypeParameter(s);
            return;
        } else
        {
            Log.e("vCard", (new StringBuilder()).append("Unknown or unsupported (by vCard) Phone type: ").append(integer).toString());
            return;
        }
    }

    private void buildSinglePartNameField(String s, String s1)
    {
        boolean flag;
        if (!mRefrainsQPToNameProperties && !VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s1
}))
            flag = true;
        else
            flag = false;
        String s2;
        if (flag)
            s2 = encodeQuotedPrintable(s1);
        else
            s2 = escapeCharacters(s1);
        mBuilder.append(s);
        if (shouldAppendCharsetParam(new String[] {
    s1
}))
        {
            mBuilder.append(";");
            mBuilder.append(mVCardCharsetParameter);
        }
        if (flag)
        {
            mBuilder.append(";");
            mBuilder.append("ENCODING=QUOTED-PRINTABLE");
        }
        mBuilder.append(":");
        mBuilder.append(s2);
    }

    private boolean containsNonEmptyName(ContentValues contentvalues)
    {
        String s = contentvalues.getAsString("data3");
        String s1 = contentvalues.getAsString("data5");
        String s2 = contentvalues.getAsString("data2");
        String s3 = contentvalues.getAsString("data4");
        String s4 = contentvalues.getAsString("data6");
        String s5 = contentvalues.getAsString("data9");
        String s6 = contentvalues.getAsString("data8");
        String s7 = contentvalues.getAsString("data7");
        String s8 = contentvalues.getAsString("data1");
        return !TextUtils.isEmpty(s) || !TextUtils.isEmpty(s1) || !TextUtils.isEmpty(s2) || !TextUtils.isEmpty(s3) || !TextUtils.isEmpty(s4) || !TextUtils.isEmpty(s5) || !TextUtils.isEmpty(s6) || !TextUtils.isEmpty(s7) || !TextUtils.isEmpty(s8);
    }

    private String encodeQuotedPrintable(String s)
    {
        StringBuilder stringbuilder;
        int i;
        int j;
        if (TextUtils.isEmpty(s))
            return "";
        stringbuilder = new StringBuilder();
        i = 0;
        j = 0;
        byte abyte1[] = s.getBytes(mCharset);
        byte abyte0[] = abyte1;
_L2:
        if (i >= abyte0.length)
            break; /* Loop/switch isn't completed */
        Object aobj[] = new Object[1];
        aobj[0] = Byte.valueOf(abyte0[i]);
        stringbuilder.append(String.format("=%02X", aobj));
        i++;
        if ((j += 3) >= 67)
        {
            stringbuilder.append("=\r\n");
            j = 0;
        }
        continue; /* Loop/switch isn't completed */
        UnsupportedEncodingException unsupportedencodingexception;
        unsupportedencodingexception;
        Log.e("vCard", (new StringBuilder()).append("Charset ").append(mCharset).append(" cannot be used. ").append("Try default charset").toString());
        abyte0 = s.getBytes();
        i = 0;
        j = 0;
        if (true) goto _L2; else goto _L1
_L1:
        return stringbuilder.toString();
    }

    private String escapeCharacters(String s)
    {
        if (TextUtils.isEmpty(s))
            return "";
        StringBuilder stringbuilder = new StringBuilder();
        int i = s.length();
        for (int j = 0; j < i; j++)
        {
            char c = s.charAt(j);
            switch (c)
            {
            case 44: // ','
                if (mIsV30OrV40)
                    stringbuilder.append("\\,");
                else
                    stringbuilder.append(c);
                break;

            case 92: // '\\'
                if (mIsV30OrV40)
                {
                    stringbuilder.append("\\\\");
                    break;
                }
                // fall through

            case 60: // '<'
            case 62: // '>'
                if (mIsDoCoMo)
                {
                    stringbuilder.append('\\');
                    stringbuilder.append(c);
                } else
                {
                    stringbuilder.append(c);
                }
                break;

            case 13: // '\r'
                if (j + 1 < i && s.charAt(j) == '\n')
                    break;
                // fall through

            case 10: // '\n'
                stringbuilder.append("\\n");
                break;

            case 59: // ';'
                stringbuilder.append('\\');
                stringbuilder.append(';');
                break;

            default:
                stringbuilder.append(c);
                break;
            }
        }

        return stringbuilder.toString();
    }

    private ContentValues getPrimaryContentValueWithStructuredName(List list)
    {
        ContentValues contentvalues = null;
        ContentValues contentvalues1 = null;
        Iterator iterator = list.iterator();
        do
        {
            ContentValues contentvalues2;
label0:
            {
label1:
                {
                    if (iterator.hasNext())
                    {
                        contentvalues2 = (ContentValues)iterator.next();
                        if (contentvalues2 == null)
                            continue;
                        Integer integer = contentvalues2.getAsInteger("is_super_primary");
                        if (integer == null || integer.intValue() <= 0)
                            break label0;
                        contentvalues = contentvalues2;
                    }
                    if (contentvalues == null)
                    {
                        if (contentvalues1 == null)
                            break label1;
                        contentvalues = contentvalues1;
                    }
                    return contentvalues;
                }
                return new ContentValues();
            }
            if (contentvalues == null)
            {
                Integer integer1 = contentvalues2.getAsInteger("is_primary");
                if (integer1 != null && integer1.intValue() > 0 && containsNonEmptyName(contentvalues2))
                    contentvalues = contentvalues2;
                else
                if (contentvalues1 == null && containsNonEmptyName(contentvalues2))
                    contentvalues1 = contentvalues2;
            }
        } while (true);
    }

    private transient boolean shouldAppendCharsetParam(String as[])
    {
        if (mShouldAppendCharsetParam)
        {
            int i = as.length;
            for (int j = 0; j < i; j++)
                if (!VCardUtils.containsOnlyPrintableAscii(new String[] {
    as[j]
}))
                    return true;

        }
        return false;
    }

    private List splitPhoneNumbers(String s)
    {
        ArrayList arraylist = new ArrayList();
        StringBuilder stringbuilder = new StringBuilder();
        int i = s.length();
        for (int j = 0; j < i; j++)
        {
            char c = s.charAt(j);
            if (c == '\n' && stringbuilder.length() > 0)
            {
                arraylist.add(stringbuilder.toString());
                stringbuilder = new StringBuilder();
            } else
            {
                stringbuilder.append(c);
            }
        }

        if (stringbuilder.length() > 0)
            arraylist.add(stringbuilder.toString());
        return arraylist;
    }

    private PostalStruct tryConstructPostalStruct(ContentValues contentvalues)
    {
        String s = contentvalues.getAsString("data5");
        String s1 = contentvalues.getAsString("data6");
        String s2 = contentvalues.getAsString("data4");
        String s3 = contentvalues.getAsString("data7");
        String s4 = contentvalues.getAsString("data8");
        String s5 = contentvalues.getAsString("data9");
        String s6 = contentvalues.getAsString("data10");
        String as[] = {
            s, s1, s2, s3, s4, s5, s6
        };
        if (!VCardUtils.areAllEmpty(as))
        {
            boolean flag2;
            if (mShouldUseQuotedPrintable && !VCardUtils.containsOnlyNonCrLfPrintableAscii(as))
                flag2 = true;
            else
                flag2 = false;
            boolean flag3;
            if (!VCardUtils.containsOnlyPrintableAscii(as))
                flag3 = true;
            else
                flag3 = false;
            String s10;
            String s11;
            String s12;
            String s13;
            String s14;
            String s15;
            String s16;
            if (flag2)
            {
                s10 = encodeQuotedPrintable(s);
                s11 = encodeQuotedPrintable(s2);
                s12 = encodeQuotedPrintable(s3);
                s13 = encodeQuotedPrintable(s4);
                s14 = encodeQuotedPrintable(s5);
                s15 = encodeQuotedPrintable(s6);
                s16 = encodeQuotedPrintable(s1);
            } else
            {
                s10 = escapeCharacters(s);
                s11 = escapeCharacters(s2);
                s12 = escapeCharacters(s3);
                s13 = escapeCharacters(s4);
                s14 = escapeCharacters(s5);
                s15 = escapeCharacters(s6);
                s16 = escapeCharacters(s1);
            }
            StringBuilder stringbuilder1 = new StringBuilder();
            stringbuilder1.append(s10);
            stringbuilder1.append(";");
            if (!TextUtils.isEmpty(s16))
                stringbuilder1.append(s16);
            stringbuilder1.append(";");
            stringbuilder1.append(s11);
            stringbuilder1.append(";");
            stringbuilder1.append(s12);
            stringbuilder1.append(";");
            stringbuilder1.append(s13);
            stringbuilder1.append(";");
            stringbuilder1.append(s14);
            stringbuilder1.append(";");
            stringbuilder1.append(s15);
            String s17 = stringbuilder1.toString();
            PostalStruct postalstruct1 = new PostalStruct(flag2, flag3, s17);
            return postalstruct1;
        }
        String s7 = contentvalues.getAsString("data1");
        if (TextUtils.isEmpty(s7))
            return null;
        boolean flag;
        if (mShouldUseQuotedPrintable && !VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s7
}))
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (!VCardUtils.containsOnlyPrintableAscii(new String[] {
    s7
}))
            flag1 = true;
        else
            flag1 = false;
        String s8;
        if (flag)
            s8 = encodeQuotedPrintable(s7);
        else
            s8 = escapeCharacters(s7);
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append(";");
        stringbuilder.append(s8);
        stringbuilder.append(";");
        stringbuilder.append(";");
        stringbuilder.append(";");
        stringbuilder.append(";");
        stringbuilder.append(";");
        String s9 = stringbuilder.toString();
        PostalStruct postalstruct = new PostalStruct(flag, flag1, s9);
        return postalstruct;
    }

    public void appendAndroidSpecificProperty(String s, ContentValues contentvalues)
    {
        if (!sAllowedAndroidPropertySet.contains(s))
            return;
        ArrayList arraylist = new ArrayList();
        for (int i = 1; i <= 15; i++)
        {
            String s3 = contentvalues.getAsString((new StringBuilder()).append("data").append(i).toString());
            if (s3 == null)
                s3 = "";
            arraylist.add(s3);
        }

        boolean flag;
        if (mShouldAppendCharsetParam && !VCardUtils.containsOnlyNonCrLfPrintableAscii(arraylist))
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (mShouldUseQuotedPrintable && !VCardUtils.containsOnlyNonCrLfPrintableAscii(arraylist))
            flag1 = true;
        else
            flag1 = false;
        mBuilder.append("X-ANDROID-CUSTOM");
        if (flag)
        {
            mBuilder.append(";");
            mBuilder.append(mVCardCharsetParameter);
        }
        if (flag1)
        {
            mBuilder.append(";");
            mBuilder.append("ENCODING=QUOTED-PRINTABLE");
        }
        mBuilder.append(":");
        mBuilder.append(s);
        String s2;
        for (Iterator iterator = arraylist.iterator(); iterator.hasNext(); mBuilder.append(s2))
        {
            String s1 = (String)iterator.next();
            if (flag1)
                s2 = encodeQuotedPrintable(s1);
            else
                s2 = escapeCharacters(s1);
            mBuilder.append(";");
        }

        mBuilder.append("\r\n");
    }

    public void appendEmailLine(int i, String s, String s1, boolean flag)
    {
        String s2;
        switch (i)
        {
        case 4: // '\004'
            s2 = "CELL";
            break;

        case 3: // '\003'
            s2 = null;
            break;

        case 2: // '\002'
            s2 = "WORK";
            break;

        case 1: // '\001'
            s2 = "HOME";
            break;

        case 0: // '\0'
            if (VCardUtils.isMobilePhoneLabel(s))
            {
                s2 = "CELL";
                break;
            }
            if (!TextUtils.isEmpty(s) && VCardUtils.containsOnlyAlphaDigitHyphen(new String[] {
    s
}))
                s2 = (new StringBuilder()).append("X-").append(s).toString();
            else
                s2 = null;
            break;

        default:
            Log.e("vCard", (new StringBuilder()).append("Unknown Email type: ").append(i).toString());
            s2 = null;
            break;
        }
        ArrayList arraylist = new ArrayList();
        if (flag)
            arraylist.add("PREF");
        if (!TextUtils.isEmpty(s2))
            arraylist.add(s2);
        appendLineWithCharsetAndQPDetection("EMAIL", arraylist, s1);
    }

    public VCardBuilder appendEmails(List list)
    {
        boolean flag = false;
        if (list != null)
        {
            HashSet hashset = new HashSet();
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                ContentValues contentvalues = (ContentValues)iterator.next();
                String s = contentvalues.getAsString("data1");
                if (s != null)
                    s = s.trim();
                if (!TextUtils.isEmpty(s))
                {
                    Integer integer = contentvalues.getAsInteger("data2");
                    int i;
                    if (integer != null)
                        i = integer.intValue();
                    else
                        i = 3;
                    String s1 = contentvalues.getAsString("data3");
                    Integer integer1 = contentvalues.getAsInteger("is_primary");
                    boolean flag1;
                    if (integer1 != null)
                    {
                        if (integer1.intValue() > 0)
                            flag1 = true;
                        else
                            flag1 = false;
                    } else
                    {
                        flag1 = false;
                    }
                    flag = true;
                    if (!hashset.contains(s))
                    {
                        hashset.add(s);
                        appendEmailLine(i, s1, s, flag1);
                    }
                }
            } while (true);
        }
        if (!flag && mIsDoCoMo)
            appendEmailLine(1, "", "", false);
        return this;
    }

    public VCardBuilder appendEvents(List list)
    {
        if (list == null) goto _L2; else goto _L1
_L1:
        String s;
        String s1;
        Iterator iterator;
        s = null;
        s1 = null;
        iterator = list.iterator();
_L10:
        if (!iterator.hasNext()) goto _L4; else goto _L3
_L3:
        ContentValues contentvalues;
        int i;
        contentvalues = (ContentValues)iterator.next();
        if (contentvalues == null)
            continue; /* Loop/switch isn't completed */
        Integer integer = contentvalues.getAsInteger("data2");
        if (integer != null)
            i = integer.intValue();
        else
            i = 2;
        if (i != 3) goto _L6; else goto _L5
_L5:
        String s2;
        boolean flag;
        s2 = contentvalues.getAsString("data1");
        if (s2 == null)
            continue; /* Loop/switch isn't completed */
        Integer integer1 = contentvalues.getAsInteger("is_super_primary");
        if (integer1 != null)
        {
            if (integer1.intValue() > 0)
                flag = true;
            else
                flag = false;
        } else
        {
            flag = false;
        }
        if (!flag) goto _L8; else goto _L7
_L7:
        s = s2;
_L4:
        if (s != null)
            appendLineWithCharsetAndQPDetection("BDAY", s.trim());
        else
        if (s1 != null)
        {
            appendLineWithCharsetAndQPDetection("BDAY", s1.trim());
            return this;
        }
_L2:
        return this;
_L8:
        Integer integer2 = contentvalues.getAsInteger("is_primary");
        boolean flag1;
        if (integer2 != null)
        {
            if (integer2.intValue() > 0)
                flag1 = true;
            else
                flag1 = false;
        } else
        {
            flag1 = false;
        }
        if (flag1)
            s = s2;
        else
        if (s1 == null)
            s1 = s2;
        continue; /* Loop/switch isn't completed */
_L6:
        if (mUsesAndroidProperty)
            appendAndroidSpecificProperty("vnd.android.cursor.item/contact_event", contentvalues);
        if (true) goto _L10; else goto _L9
_L9:
    }

    public VCardBuilder appendIms(List list)
    {
        if (list != null)
        {
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                ContentValues contentvalues = (ContentValues)iterator.next();
                Integer integer = contentvalues.getAsInteger("data5");
                if (integer != null)
                    if (-1 == integer.intValue())
                    {
                        String s4 = contentvalues.getAsString("data6");
                        ArrayList arraylist1 = new ArrayList();
                        if (s4 != null && !s4.isEmpty())
                            arraylist1.add(s4);
                        appendLineWithCharsetAndQPDetection("X-CUSTOM-IM", arraylist1, contentvalues.getAsString("data1"));
                    } else
                    {
                        String s = VCardUtils.getPropertyNameForIm(integer.intValue());
                        if (s != null)
                        {
                            String s1 = contentvalues.getAsString("data1");
                            if (s1 != null)
                                s1 = s1.trim();
                            if (!TextUtils.isEmpty(s1))
                            {
                                Integer integer1 = contentvalues.getAsInteger("data2");
                                int i;
                                if (integer1 != null)
                                    i = integer1.intValue();
                                else
                                    i = 3;
                                String s2;
                                switch (i)
                                {
                                case 0: // '\0'
                                    String s3 = contentvalues.getAsString("data3");
                                    if (s3 != null)
                                        s2 = (new StringBuilder()).append("X-").append(s3).toString();
                                    else
                                        s2 = null;
                                    break;

                                case 2: // '\002'
                                    s2 = "WORK";
                                    break;

                                case 1: // '\001'
                                    s2 = "HOME";
                                    break;

                                default:
                                    s2 = null;
                                    break;
                                }
                                ArrayList arraylist = new ArrayList();
                                if (!TextUtils.isEmpty(s2))
                                    arraylist.add(s2);
                                Integer integer2 = contentvalues.getAsInteger("is_primary");
                                boolean flag;
                                if (integer2 != null)
                                {
                                    if (integer2.intValue() > 0)
                                        flag = true;
                                    else
                                        flag = false;
                                } else
                                {
                                    flag = false;
                                }
                                if (flag)
                                    arraylist.add("PREF");
                                appendLineWithCharsetAndQPDetection(s, arraylist, s1);
                            }
                        }
                    }
            } while (true);
        }
        return this;
    }

    public void appendLine(String s, String s1)
    {
        appendLine(s, s1, false, false);
    }

    public void appendLine(String s, String s1, boolean flag, boolean flag1)
    {
        appendLine(s, null, s1, flag, flag1);
    }

    public void appendLine(String s, List list)
    {
        appendLine(s, list, false, false);
    }

    public void appendLine(String s, List list, String s1)
    {
        appendLine(s, list, s1, false, false);
    }

    public void appendLine(String s, List list, String s1, boolean flag, boolean flag1)
    {
        mBuilder.append(s);
        if (list != null && list.size() > 0)
        {
            mBuilder.append(";");
            appendTypeParameters(list);
        }
        if (flag)
        {
            mBuilder.append(";");
            mBuilder.append(mVCardCharsetParameter);
        }
        String s2;
        if (flag1)
        {
            mBuilder.append(";");
            mBuilder.append("ENCODING=QUOTED-PRINTABLE");
            s2 = encodeQuotedPrintable(s1);
        } else
        {
            s2 = escapeCharacters(s1);
        }
        mBuilder.append(":");
        mBuilder.append(s2);
        mBuilder.append("\r\n");
    }

    public void appendLine(String s, List list, List list1, boolean flag, boolean flag1)
    {
        mBuilder.append(s);
        if (list != null && list.size() > 0)
        {
            mBuilder.append(";");
            appendTypeParameters(list);
        }
        if (flag)
        {
            mBuilder.append(";");
            mBuilder.append(mVCardCharsetParameter);
        }
        if (flag1)
        {
            mBuilder.append(";");
            mBuilder.append("ENCODING=QUOTED-PRINTABLE");
        }
        mBuilder.append(":");
        boolean flag2 = true;
        String s2;
        for (Iterator iterator = list1.iterator(); iterator.hasNext(); mBuilder.append(s2))
        {
            String s1 = (String)iterator.next();
            if (flag1)
                s2 = encodeQuotedPrintable(s1);
            else
                s2 = escapeCharacters(s1);
            if (flag2)
                flag2 = false;
            else
                mBuilder.append(";");
        }

        mBuilder.append("\r\n");
    }

    public void appendLine(String s, List list, boolean flag, boolean flag1)
    {
        appendLine(s, null, list, flag, flag1);
    }

    public void appendLineWithCharsetAndQPDetection(String s, String s1)
    {
        appendLineWithCharsetAndQPDetection(s, null, s1);
    }

    public void appendLineWithCharsetAndQPDetection(String s, List list)
    {
        appendLineWithCharsetAndQPDetection(s, null, list);
    }

    public void appendLineWithCharsetAndQPDetection(String s, List list, String s1)
    {
        boolean flag;
        if (!VCardUtils.containsOnlyPrintableAscii(new String[] {
    s1
}))
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (mShouldUseQuotedPrintable && !VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s1
}))
            flag1 = true;
        else
            flag1 = false;
        appendLine(s, list, s1, flag, flag1);
    }

    public void appendLineWithCharsetAndQPDetection(String s, List list, List list1)
    {
        boolean flag;
        if (mShouldAppendCharsetParam && !VCardUtils.containsOnlyNonCrLfPrintableAscii(list1))
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (mShouldUseQuotedPrintable && !VCardUtils.containsOnlyNonCrLfPrintableAscii(list1))
            flag1 = true;
        else
            flag1 = false;
        appendLine(s, list, list1, flag, flag1);
    }

    public VCardBuilder appendNameProperties(List list)
    {
        if (VCardConfig.isVersion40(mVCardType))
        {
            this = appendNamePropertiesV40(list);
        } else
        {
            if (list != null && !list.isEmpty())
            {
                ContentValues contentvalues = getPrimaryContentValueWithStructuredName(list);
                String s = contentvalues.getAsString("data3");
                String s1 = contentvalues.getAsString("data5");
                String s2 = contentvalues.getAsString("data2");
                String s3 = contentvalues.getAsString("data4");
                String s4 = contentvalues.getAsString("data6");
                String s5 = contentvalues.getAsString("data1");
                if (TextUtils.isEmpty(s) && TextUtils.isEmpty(s2))
                {
                    if (!TextUtils.isEmpty(s5))
                    {
                        buildSinglePartNameField("N", s5);
                        mBuilder.append(";");
                        mBuilder.append(";");
                        mBuilder.append(";");
                        mBuilder.append(";");
                        mBuilder.append("\r\n");
                        buildSinglePartNameField("FN", s5);
                        mBuilder.append("\r\n");
                    } else
                    if (VCardConfig.isVersion30(mVCardType))
                    {
                        appendLine("N", "");
                        appendLine("FN", "");
                    } else
                    if (mIsDoCoMo)
                        appendLine("N", "");
                } else
                {
                    String as[] = {
                        s, s2, s1, s3, s4
                    };
                    boolean flag = shouldAppendCharsetParam(as);
                    boolean flag1;
                    if (mRefrainsQPToNameProperties || VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s
}) && VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s2
}) && VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s1
}) && VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s3
}) && VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s4
}))
                        flag1 = false;
                    else
                        flag1 = true;
                    String s6;
                    if (!TextUtils.isEmpty(s5))
                        s6 = s5;
                    else
                        s6 = VCardUtils.constructNameFromElements(VCardConfig.getNameOrderType(mVCardType), s, s1, s2, s3, s4);
                    String as1[] = {
                        s6
                    };
                    boolean flag2 = shouldAppendCharsetParam(as1);
                    boolean flag3;
                    if (!mRefrainsQPToNameProperties && !VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s6
}))
                        flag3 = true;
                    else
                        flag3 = false;
                    String s7;
                    String s8;
                    String s9;
                    String s10;
                    String s11;
                    if (flag1)
                    {
                        s7 = encodeQuotedPrintable(s);
                        s8 = encodeQuotedPrintable(s2);
                        s9 = encodeQuotedPrintable(s1);
                        s10 = encodeQuotedPrintable(s3);
                        s11 = encodeQuotedPrintable(s4);
                    } else
                    {
                        s7 = escapeCharacters(s);
                        s8 = escapeCharacters(s2);
                        s9 = escapeCharacters(s1);
                        s10 = escapeCharacters(s3);
                        s11 = escapeCharacters(s4);
                    }
                    String s12;
                    if (flag3)
                        s12 = encodeQuotedPrintable(s6);
                    else
                        s12 = escapeCharacters(s6);
                    mBuilder.append("N");
                    if (mIsDoCoMo)
                    {
                        if (flag)
                        {
                            mBuilder.append(";");
                            mBuilder.append(mVCardCharsetParameter);
                        }
                        if (flag1)
                        {
                            mBuilder.append(";");
                            mBuilder.append("ENCODING=QUOTED-PRINTABLE");
                        }
                        mBuilder.append(":");
                        mBuilder.append(s6);
                        mBuilder.append(";");
                        mBuilder.append(";");
                        mBuilder.append(";");
                        mBuilder.append(";");
                    } else
                    {
                        if (flag)
                        {
                            mBuilder.append(";");
                            mBuilder.append(mVCardCharsetParameter);
                        }
                        if (flag1)
                        {
                            mBuilder.append(";");
                            mBuilder.append("ENCODING=QUOTED-PRINTABLE");
                        }
                        mBuilder.append(":");
                        mBuilder.append(s7);
                        mBuilder.append(";");
                        mBuilder.append(s8);
                        mBuilder.append(";");
                        mBuilder.append(s9);
                        mBuilder.append(";");
                        mBuilder.append(s10);
                        mBuilder.append(";");
                        mBuilder.append(s11);
                    }
                    mBuilder.append("\r\n");
                    mBuilder.append("FN");
                    if (flag2)
                    {
                        mBuilder.append(";");
                        mBuilder.append(mVCardCharsetParameter);
                    }
                    if (flag3)
                    {
                        mBuilder.append(";");
                        mBuilder.append("ENCODING=QUOTED-PRINTABLE");
                    }
                    mBuilder.append(":");
                    mBuilder.append(s12);
                    mBuilder.append("\r\n");
                }
                appendPhoneticNameFields(contentvalues);
                return this;
            }
            if (VCardConfig.isVersion30(mVCardType))
            {
                appendLine("N", "");
                appendLine("FN", "");
                return this;
            }
            if (mIsDoCoMo)
            {
                appendLine("N", "");
                return this;
            }
        }
        return this;
    }

    public VCardBuilder appendNickNames(List list)
    {
label0:
        {
            boolean flag;
            if (mIsV30OrV40)
            {
                flag = false;
            } else
            {
                if (!mUsesAndroidProperty)
                    break label0;
                flag = true;
            }
            if (list != null)
            {
                Iterator iterator = list.iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    ContentValues contentvalues = (ContentValues)iterator.next();
                    String s = contentvalues.getAsString("data1");
                    if (!TextUtils.isEmpty(s))
                        if (flag)
                            appendAndroidSpecificProperty("vnd.android.cursor.item/nickname", contentvalues);
                        else
                            appendLineWithCharsetAndQPDetection("NICKNAME", s);
                } while (true);
            }
        }
        return this;
    }

    public VCardBuilder appendNotes(List list)
    {
        if (list != null)
            if (mOnlyOneNoteFieldIsAvailable)
            {
                StringBuilder stringbuilder = new StringBuilder();
                boolean flag2 = true;
                Iterator iterator1 = list.iterator();
                do
                {
                    if (!iterator1.hasNext())
                        break;
                    String s2 = ((ContentValues)iterator1.next()).getAsString("data1");
                    if (s2 == null)
                        s2 = "";
                    if (s2.length() > 0)
                    {
                        if (flag2)
                            flag2 = false;
                        else
                            stringbuilder.append('\n');
                        stringbuilder.append(s2);
                    }
                } while (true);
                String s1 = stringbuilder.toString();
                boolean flag3;
                if (!VCardUtils.containsOnlyPrintableAscii(new String[] {
    s1
}))
                    flag3 = true;
                else
                    flag3 = false;
                boolean flag4;
                if (mShouldUseQuotedPrintable && !VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s1
}))
                    flag4 = true;
                else
                    flag4 = false;
                appendLine("NOTE", s1, flag3, flag4);
            } else
            {
                Iterator iterator = list.iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    String s = ((ContentValues)iterator.next()).getAsString("data1");
                    if (!TextUtils.isEmpty(s))
                    {
                        boolean flag;
                        if (!VCardUtils.containsOnlyPrintableAscii(new String[] {
    s
}))
                            flag = true;
                        else
                            flag = false;
                        boolean flag1;
                        if (mShouldUseQuotedPrintable && !VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s
}))
                            flag1 = true;
                        else
                            flag1 = false;
                        appendLine("NOTE", s, flag, flag1);
                    }
                } while (true);
            }
        return this;
    }

    public VCardBuilder appendOrganizations(List list)
    {
        if (list != null)
        {
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                ContentValues contentvalues = (ContentValues)iterator.next();
                String s = contentvalues.getAsString("data1");
                if (s != null)
                    s = s.trim();
                String s1 = contentvalues.getAsString("data5");
                if (s1 != null)
                    s1 = s1.trim();
                String s2 = contentvalues.getAsString("data4");
                if (s2 != null)
                    s2 = s2.trim();
                StringBuilder stringbuilder = new StringBuilder();
                if (!TextUtils.isEmpty(s))
                    stringbuilder.append(s);
                if (!TextUtils.isEmpty(s1))
                {
                    if (stringbuilder.length() > 0)
                        stringbuilder.append(';');
                    stringbuilder.append(s1);
                }
                String s3 = stringbuilder.toString();
                boolean flag;
                if (!VCardUtils.containsOnlyPrintableAscii(new String[] {
    s3
}))
                    flag = true;
                else
                    flag = false;
                boolean flag1;
                if (mShouldUseQuotedPrintable && !VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s3
}))
                    flag1 = true;
                else
                    flag1 = false;
                appendLine("ORG", s3, flag, flag1);
                if (!TextUtils.isEmpty(s2))
                {
                    boolean flag2;
                    if (!VCardUtils.containsOnlyPrintableAscii(new String[] {
    s2
}))
                        flag2 = true;
                    else
                        flag2 = false;
                    boolean flag3;
                    if (mShouldUseQuotedPrintable && !VCardUtils.containsOnlyNonCrLfPrintableAscii(new String[] {
    s2
}))
                        flag3 = true;
                    else
                        flag3 = false;
                    appendLine("TITLE", s2, flag2, flag3);
                }
            } while (true);
        }
        return this;
    }

    public VCardBuilder appendPhones(List list, VCardPhoneNumberTranslationCallback vcardphonenumbertranslationcallback)
    {
        boolean flag = false;
        if (list != null)
        {
            HashSet hashset = new HashSet();
            Iterator iterator = list.iterator();
label0:
            do
            {
                if (!iterator.hasNext())
                    break;
                ContentValues contentvalues = (ContentValues)iterator.next();
                Integer integer = contentvalues.getAsInteger("data2");
                String s = contentvalues.getAsString("data3");
                Integer integer1 = contentvalues.getAsInteger("is_primary");
                boolean flag1;
                if (integer1 != null)
                {
                    if (integer1.intValue() > 0)
                        flag1 = true;
                    else
                        flag1 = false;
                } else
                {
                    flag1 = false;
                }
                String s1 = contentvalues.getAsString("data1");
                if (s1 != null)
                    s1 = s1.trim();
                if (TextUtils.isEmpty(s1))
                    continue;
                int i;
                if (integer != null)
                    i = integer.intValue();
                else
                    i = 1;
                if (vcardphonenumbertranslationcallback != null)
                {
                    String s4 = vcardphonenumbertranslationcallback.onValueReceived(s1, i, s, flag1);
                    if (!hashset.contains(s4))
                    {
                        hashset.add(s4);
                        appendTelLine(Integer.valueOf(i), s, s4, flag1);
                    }
                    continue;
                }
                if (i != 6 && !VCardConfig.refrainPhoneNumberFormatting(mVCardType))
                {
                    List list1 = splitPhoneNumbers(s1);
                    if (list1.isEmpty())
                        continue;
                    flag = true;
                    Iterator iterator1 = list1.iterator();
                    do
                    {
                        String s2;
                        do
                        {
                            if (!iterator1.hasNext())
                                continue label0;
                            s2 = (String)iterator1.next();
                        } while (hashset.contains(s2));
                        String s3;
                        if (TextUtils.equals(s2, s2))
                        {
                            StringBuilder stringbuilder = new StringBuilder();
                            int j = s2.length();
                            for (int k = 0; k < j; k++)
                            {
                                char c = s2.charAt(k);
                                if (Character.isDigit(c) || c == '+' || c == 'p' || c == 'w' || c == 'P' || c == 'W' || c == ' ' || c == ',' || c == ';')
                                    stringbuilder.append(c);
                            }

                            VCardUtils.getPhoneNumberFormat(mVCardType);
                            s3 = stringbuilder.toString();
                        } else
                        {
                            s3 = s2;
                        }
                        if (VCardConfig.isVersion40(mVCardType) && !TextUtils.isEmpty(s3) && !s3.startsWith("tel:"))
                            s3 = (new StringBuilder()).append("tel:").append(s3).toString();
                        hashset.add(s2);
                        appendTelLine(Integer.valueOf(i), s, s3, flag1);
                    } while (true);
                }
                flag = true;
                if (!hashset.contains(s1))
                {
                    hashset.add(s1);
                    appendTelLine(Integer.valueOf(i), s, s1, flag1);
                }
            } while (true);
        }
        if (!flag && mIsDoCoMo)
            appendTelLine(Integer.valueOf(1), "", "", false);
        return this;
    }

    public void appendPhotoLine(String s, String s1)
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append("PHOTO");
        stringbuilder.append(";");
        if (mIsV30OrV40)
            stringbuilder.append("ENCODING=B");
        else
            stringbuilder.append("ENCODING=BASE64");
        stringbuilder.append(";");
        appendTypeParameter(stringbuilder, s1);
        stringbuilder.append(":");
        stringbuilder.append(s);
        String s2 = stringbuilder.toString();
        StringBuilder stringbuilder1 = new StringBuilder();
        int i = 0;
        int j = s2.length();
        int k = 75 - "\r\n".length();
        int l = k - " ".length();
        int i1 = k;
        for (int j1 = 0; j1 < j; j1++)
        {
            stringbuilder1.append(s2.charAt(j1));
            if (++i > i1)
            {
                stringbuilder1.append("\r\n");
                stringbuilder1.append(" ");
                i1 = l;
                i = 0;
            }
        }

        mBuilder.append(stringbuilder1.toString());
        mBuilder.append("\r\n");
        mBuilder.append("\r\n");
    }

    public VCardBuilder appendPhotos(List list)
    {
        if (list != null)
        {
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                ContentValues contentvalues = (ContentValues)iterator.next();
                if (contentvalues != null)
                {
                    byte abyte0[] = contentvalues.getAsByteArray("data15");
                    if (abyte0 != null)
                    {
                        String s = VCardUtils.guessImageType(abyte0);
                        if (s == null)
                        {
                            Log.d("vCard", "Unknown photo type. Ignored.");
                        } else
                        {
                            String s1 = new String(Base64.encode(abyte0, 2));
                            if (!TextUtils.isEmpty(s1))
                                appendPhotoLine(s1, s);
                        }
                    }
                }
            } while (true);
        }
        return this;
    }

    public void appendPostalLine(int i, String s, ContentValues contentvalues, boolean flag, boolean flag1)
    {
label0:
        {
            PostalStruct postalstruct = tryConstructPostalStruct(contentvalues);
            boolean flag2;
            boolean flag3;
            String s1;
            if (postalstruct == null)
            {
                if (!flag1)
                    break label0;
                flag2 = false;
                flag3 = false;
                s1 = "";
            } else
            {
                flag2 = postalstruct.reallyUseQuotedPrintable;
                flag3 = postalstruct.appendCharset;
                s1 = postalstruct.addressData;
            }
            ArrayList arraylist = new ArrayList();
            if (flag)
                arraylist.add("PREF");
            switch (i)
            {
            case 3: // '\003'
                arraylist.add("OTHER");
                break;

            case 0: // '\0'
                if (!TextUtils.isEmpty(s) && VCardUtils.containsOnlyAlphaDigitHyphen(new String[] {
    s
}))
                    arraylist.add((new StringBuilder()).append("X-").append(s).toString());
                break;

            case 2: // '\002'
                arraylist.add("WORK");
                break;

            case 1: // '\001'
                arraylist.add("HOME");
                break;

            default:
                Log.e("vCard", (new StringBuilder()).append("Unknown StructuredPostal type: ").append(i).toString());
                break;
            }
            mBuilder.append("ADR");
            if (!arraylist.isEmpty())
            {
                mBuilder.append(";");
                appendTypeParameters(arraylist);
            }
            if (flag3)
            {
                mBuilder.append(";");
                mBuilder.append(mVCardCharsetParameter);
            }
            if (flag2)
            {
                mBuilder.append(";");
                mBuilder.append("ENCODING=QUOTED-PRINTABLE");
            }
            mBuilder.append(":");
            mBuilder.append(s1);
            mBuilder.append("\r\n");
        }
    }

    public VCardBuilder appendPostals(List list)
    {
        if (list != null && !list.isEmpty())
            if (mIsDoCoMo)
            {
                appendPostalsForDoCoMo(list);
                return this;
            } else
            {
                appendPostalsForGeneric(list);
                return this;
            }
        if (mIsDoCoMo)
        {
            mBuilder.append("ADR");
            mBuilder.append(";");
            mBuilder.append("HOME");
            mBuilder.append(":");
            mBuilder.append("\r\n");
        }
        return this;
    }

    public VCardBuilder appendRelation(List list)
    {
        if (mUsesAndroidProperty && list != null)
        {
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                ContentValues contentvalues = (ContentValues)iterator.next();
                if (contentvalues != null)
                    appendAndroidSpecificProperty("vnd.android.cursor.item/relation", contentvalues);
            } while (true);
        }
        return this;
    }

    public VCardBuilder appendSipAddresses(List list)
    {
label0:
        {
            boolean flag;
            if (mIsV30OrV40)
            {
                flag = false;
            } else
            {
                if (!mUsesDefactProperty)
                    break label0;
                flag = true;
            }
            if (list != null)
            {
                Iterator iterator = list.iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    String s = ((ContentValues)iterator.next()).getAsString("data1");
                    if (TextUtils.isEmpty(s))
                        continue;
                    if (flag)
                    {
                        if (s.startsWith("sip:"))
                        {
                            if (s.length() == 4)
                                continue;
                            s = s.substring(4);
                        }
                        appendLineWithCharsetAndQPDetection("X-SIP", s);
                    } else
                    {
                        if (!s.startsWith("sip:"))
                            s = (new StringBuilder()).append("sip:").append(s).toString();
                        String s1;
                        if (VCardConfig.isVersion40(mVCardType))
                            s1 = "TEL";
                        else
                            s1 = "IMPP";
                        appendLineWithCharsetAndQPDetection(s1, s);
                    }
                } while (true);
            }
        }
        return this;
    }

    public void appendTelLine(Integer integer, String s, String s1, boolean flag)
    {
        mBuilder.append("TEL");
        mBuilder.append(";");
        int i;
        if (integer == null)
            i = 7;
        else
            i = integer.intValue();
        ArrayList arraylist = new ArrayList();
        switch (i)
        {
        case 19: // '\023'
            arraylist.add("ASSISTANT");
            break;

        case 16: // '\020'
            arraylist.add("TTY-TDD");
            break;

        case 14: // '\016'
            arraylist.add("RADIO");
            break;

        case 0: // '\0'
            if (TextUtils.isEmpty(s))
                arraylist.add("VOICE");
            else
            if (VCardUtils.isMobilePhoneLabel(s))
                arraylist.add("CELL");
            else
            if (mIsV30OrV40)
            {
                arraylist.add(s);
            } else
            {
                String s2 = s.toUpperCase();
                if (VCardUtils.isValidInV21ButUnknownToContactsPhoteType(s2))
                    arraylist.add(s2);
                else
                if (VCardUtils.containsOnlyAlphaDigitHyphen(new String[] {
    s
}))
                    arraylist.add((new StringBuilder()).append("X-").append(s).toString());
            }
            break;

        case 20: // '\024'
            arraylist.add("MSG");
            break;

        case 18: // '\022'
            arraylist.add("WORK");
            if (mIsDoCoMo)
                arraylist.add("VOICE");
            else
                arraylist.add("PAGER");
            break;

        case 17: // '\021'
            arraylist.addAll(Arrays.asList(new String[] {
                "WORK", "CELL"
            }));
            break;

        case 15: // '\017'
            arraylist.add("TLX");
            break;

        case 13: // '\r'
            arraylist.add("OTHER-FAX");
            break;

        case 12: // '\f'
            flag = true;
            break;

        case 11: // '\013'
            arraylist.add("ISDN");
            break;

        case 10: // '\n'
            arraylist.add("COMPANY-MAIN");
            flag = true;
            break;

        case 9: // '\t'
            arraylist.add("CAR");
            break;

        case 8: // '\b'
            arraylist.add("CALLBACK");
            break;

        case 7: // '\007'
            arraylist.add("OTHER");
            break;

        case 6: // '\006'
            if (mIsDoCoMo)
                arraylist.add("VOICE");
            else
                arraylist.add("PAGER");
            break;

        case 2: // '\002'
            arraylist.add("CELL");
            break;

        case 4: // '\004'
            arraylist.addAll(Arrays.asList(new String[] {
                "WORK", "FAX"
            }));
            break;

        case 5: // '\005'
            arraylist.addAll(Arrays.asList(new String[] {
                "HOME", "FAX"
            }));
            break;

        case 3: // '\003'
            arraylist.addAll(Arrays.asList(new String[] {
                "WORK"
            }));
            break;

        case 1: // '\001'
            arraylist.addAll(Arrays.asList(new String[] {
                "HOME"
            }));
            break;
        }
        if (flag)
            arraylist.add("PREF");
        if (arraylist.isEmpty())
            appendUncommonPhoneType(mBuilder, Integer.valueOf(i));
        else
            appendTypeParameters(arraylist);
        mBuilder.append(":");
        mBuilder.append(s1);
        mBuilder.append("\r\n");
    }

    public VCardBuilder appendWebsites(List list)
    {
        if (list != null)
        {
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                String s = ((ContentValues)iterator.next()).getAsString("data1");
                if (s != null)
                    s = s.trim();
                if (!TextUtils.isEmpty(s))
                    appendLineWithCharsetAndQPDetection("URL", s);
            } while (true);
        }
        return this;
    }

    public void clear()
    {
        mBuilder = new StringBuilder();
        mEndAppended = false;
        appendLine("BEGIN", "VCARD");
        if (VCardConfig.isVersion40(mVCardType))
        {
            appendLine("VERSION", "4.0");
            return;
        }
        if (VCardConfig.isVersion30(mVCardType))
        {
            appendLine("VERSION", "3.0");
            return;
        }
        if (!VCardConfig.isVersion21(mVCardType))
            Log.w("vCard", "Unknown vCard version detected.");
        appendLine("VERSION", "2.1");
    }

    public String toString()
    {
        if (!mEndAppended)
        {
            if (mIsDoCoMo)
            {
                appendLine("X-CLASS", "PUBLIC");
                appendLine("X-REDUCTION", "");
                appendLine("X-NO", "");
                appendLine("X-DCM-HMN-MODE", "");
            }
            appendLine("END", "VCARD");
            mEndAppended = true;
        }
        return mBuilder.toString();
    }

    static 
    {
        sPostalTypePriorityMap = new HashMap();
        sPostalTypePriorityMap.put(Integer.valueOf(1), Integer.valueOf(0));
        sPostalTypePriorityMap.put(Integer.valueOf(2), Integer.valueOf(1));
        sPostalTypePriorityMap.put(Integer.valueOf(3), Integer.valueOf(2));
        sPostalTypePriorityMap.put(Integer.valueOf(0), Integer.valueOf(3));
    }
}
