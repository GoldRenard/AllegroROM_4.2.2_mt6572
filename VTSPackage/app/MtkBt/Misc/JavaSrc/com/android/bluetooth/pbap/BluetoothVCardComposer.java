// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.bluetooth.pbap;

import android.content.*;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import android.net.Uri;
import android.telephony.PhoneNumberUtils;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.format.Time;
import android.util.CharsetUtils;
import android.util.Log;
import java.io.*;
import java.nio.charset.Charset;
import java.util.*;

// Referenced classes of package com.android.bluetooth.pbap:
//            VCardConfig, VCardUtils

public class BluetoothVCardComposer
{
    public class HandlerForOutputStream
        implements OneEntryHandler
    {

        private static final String LOG_TAG = "vcard.VCardComposer.HandlerForOutputStream";
        private boolean mOnTerminateIsCalled;
        private final OutputStream mOutputStream;
        private Writer mWriter;
        final BluetoothVCardComposer this$0;

        public boolean onEntryCreated(String s)
        {
            try
            {
                mWriter.write(s);
            }
            catch (IOException ioexception)
            {
                Log.e("vcard.VCardComposer.HandlerForOutputStream", (new StringBuilder()).append("IOException occurred during exportOneContactData: ").append(ioexception.getMessage()).toString());
                mErrorReason = (new StringBuilder()).append("IOException occurred: ").append(ioexception.getMessage()).toString();
                return false;
            }
            return true;
        }

        public boolean onInit(Context context)
        {
            try
            {
                mWriter = new BufferedWriter(new OutputStreamWriter(mOutputStream, mCharsetString));
            }
            catch (UnsupportedEncodingException unsupportedencodingexception)
            {
                Log.e("vcard.VCardComposer.HandlerForOutputStream", (new StringBuilder()).append("Unsupported charset: ").append(mCharsetString).toString());
                mErrorReason = (new StringBuilder()).append("Encoding is not supported (usually this does not happen!): ").append(mCharsetString).toString();
                return false;
            }
            if (mIsDoCoMo)
                try
                {
                    mWriter.write(createOneEntryInternal("-1"));
                }
                catch (IOException ioexception)
                {
                    Log.e("vcard.VCardComposer.HandlerForOutputStream", (new StringBuilder()).append("IOException occurred during exportOneContactData: ").append(ioexception.getMessage()).toString());
                    mErrorReason = (new StringBuilder()).append("IOException occurred: ").append(ioexception.getMessage()).toString();
                    return false;
                }
            return true;
        }

        public void onTerminate()
        {
            mOnTerminateIsCalled = true;
            if (mWriter == null)
                break MISSING_BLOCK_LABEL_56;
            mWriter.flush();
            if (mOutputStream != null && (mOutputStream instanceof FileOutputStream))
                ((FileOutputStream)mOutputStream).getFD().sync();
            mWriter.close();
            return;
            IOException ioexception3;
            ioexception3;
            Log.d("vcard.VCardComposer.HandlerForOutputStream", (new StringBuilder()).append("onTerminate,").append(ioexception3.getMessage()).toString());
            return;
            IOException ioexception1;
            ioexception1;
            Log.d("vcard.VCardComposer.HandlerForOutputStream", (new StringBuilder()).append("IOException during closing the output stream: ").append(ioexception1.getMessage()).toString());
            try
            {
                mWriter.close();
                return;
            }
            catch (IOException ioexception2)
            {
                Log.d("vcard.VCardComposer.HandlerForOutputStream", (new StringBuilder()).append("onTerminate,").append(ioexception2.getMessage()).toString());
            }
            return;
            Exception exception;
            exception;
            try
            {
                mWriter.close();
            }
            catch (IOException ioexception)
            {
                Log.d("vcard.VCardComposer.HandlerForOutputStream", (new StringBuilder()).append("onTerminate,").append(ioexception.getMessage()).toString());
            }
            throw exception;
        }

        public HandlerForOutputStream(OutputStream outputstream)
        {
            this$0 = BluetoothVCardComposer.this;
            super();
            mOnTerminateIsCalled = false;
            mOutputStream = outputstream;
        }
    }

    public static interface OneEntryHandler
    {

        public abstract boolean onEntryCreated(String s);

        public abstract boolean onInit(Context context);

        public abstract void onTerminate();
    }


    private static final int CALLER_NAME_COLUMN_INDEX = 3;
    private static final int CALLER_NUMBERLABEL_COLUMN_INDEX = 5;
    private static final int CALLER_NUMBERTYPE_COLUMN_INDEX = 4;
    private static final String CALL_LOG_PROJECTION[] = {
        "number", "date", "type", "name", "numbertype", "numberlabel"
    };
    private static final int CALL_TYPE_COLUMN_INDEX = 2;
    private static final String CONTACTS_PROJECTION[] = {
        "_id"
    };
    public static final int COUNT_NO_LIMIT = -1;
    private static final Uri DATA_REQUEST_URI;
    private static final int DATE_COLUMN_INDEX = 1;
    private static final String DEFAULT_EMAIL_TYPE = "INTERNET";
    public static final String FAILURE_REASON_FAILED_TO_GET_DATABASE_INFO = "Failed to get database information";
    public static final String FAILURE_REASON_NOT_INITIALIZED = "The vCard composer object is not correctly initialized";
    public static final String FAILURE_REASON_NO_ENTRY = "There's no exportable in the database";
    private static final String FLAG_TIMEZONE_UTC = "Z";
    private static final Map IM_MAP;
    private static final String LOG_TAG = "BluetoothVCardComposer";
    public static final String NO_ERROR = "No error";
    private static final int NUMBER_COLUMN_INDEX = 0;
    private static final String SHIFT_JIS = "SHIFT_JIS";
    public static final int VCARD_ATTRIB_ADR = 32;
    public static final int VCARD_ATTRIB_AGENT = 32768;
    public static final int VCARD_ATTRIB_BDAY = 16;
    public static final int VCARD_ATTRIB_CATEGORIES = 0x1000000;
    public static final int VCARD_ATTRIB_CLASS = 0x4000000;
    public static final int VCARD_ATTRIB_EMAIL = 256;
    public static final int VCARD_ATTRIB_FN = 2;
    public static final int VCARD_ATTRIB_GEO = 2048;
    public static final int VCARD_ATTRIB_KEY = 0x400000;
    public static final int VCARD_ATTRIB_LABEL = 64;
    public static final int VCARD_ATTRIB_LOGO = 16384;
    public static final int VCARD_ATTRIB_MAILER = 512;
    public static final int VCARD_ATTRIB_N = 4;
    public static final int VCARD_ATTRIB_NICKNAME = 0x800000;
    public static final int VCARD_ATTRIB_NOTE = 0x20000;
    public static final int VCARD_ATTRIB_ORG = 0x10000;
    public static final int VCARD_ATTRIB_PHOTO = 8;
    public static final int VCARD_ATTRIB_PROID = 0x2000000;
    public static final int VCARD_ATTRIB_REV = 0x40000;
    public static final int VCARD_ATTRIB_ROLE = 8192;
    public static final int VCARD_ATTRIB_SORTSTRING = 0x8000000;
    public static final int VCARD_ATTRIB_SOUND = 0x80000;
    public static final int VCARD_ATTRIB_TEL = 128;
    public static final int VCARD_ATTRIB_TITLE = 4096;
    public static final int VCARD_ATTRIB_TZ = 1024;
    public static final int VCARD_ATTRIB_UID = 0x200000;
    public static final int VCARD_ATTRIB_URL = 0x100000;
    public static final int VCARD_ATTRIB_VERSION = 1;
    public static final int VCARD_ATTRIB_XIRMCCALLDATETIME = 0x10000000;
    private static final String VCARD_ATTR_ENCODING_BASE64_V21 = "ENCODING=BASE64";
    private static final String VCARD_ATTR_ENCODING_BASE64_V30 = "ENCODING=b";
    private static final String VCARD_ATTR_ENCODING_QP = "ENCODING=QUOTED-PRINTABLE";
    private static final String VCARD_ATTR_EQUAL = "=";
    private static final String VCARD_ATTR_SEPARATOR = ";";
    private static final String VCARD_COL_SEPARATOR = "\r\n";
    private static final String VCARD_DATA_PUBLIC = "PUBLIC";
    private static final String VCARD_DATA_SEPARATOR = ":";
    private static final String VCARD_DATA_VCARD = "VCARD";
    private static final String VCARD_ITEM_SEPARATOR = ";";
    private static final String VCARD_PROPERTY_ADR = "ADR";
    private static final String VCARD_PROPERTY_BEGIN = "BEGIN";
    private static final String VCARD_PROPERTY_BIRTHDAY = "BDAY";
    private static final String VCARD_PROPERTY_CALLTYPE_INCOMING = "RECEIVED";
    private static final String VCARD_PROPERTY_CALLTYPE_MISSED = "MISSED";
    private static final String VCARD_PROPERTY_CALLTYPE_OUTGOING = "DIALED";
    private static final String VCARD_PROPERTY_EMAIL = "EMAIL";
    private static final String VCARD_PROPERTY_END = "END";
    private static final String VCARD_PROPERTY_FULL_NAME = "FN";
    private static final String VCARD_PROPERTY_NAME = "N";
    private static final String VCARD_PROPERTY_NICKNAME = "NICKNAME";
    private static final String VCARD_PROPERTY_NOTE = "NOTE";
    private static final String VCARD_PROPERTY_ORG = "ORG";
    private static final String VCARD_PROPERTY_PHOTO = "PHOTO";
    private static final String VCARD_PROPERTY_SORT_STRING = "SORT-STRING";
    private static final String VCARD_PROPERTY_SOUND = "SOUND";
    private static final String VCARD_PROPERTY_TEL = "TEL";
    private static final String VCARD_PROPERTY_TITLE = "TITLE";
    private static final String VCARD_PROPERTY_URL = "URL";
    private static final String VCARD_PROPERTY_VERSION = "VERSION";
    private static final String VCARD_PROPERTY_X_CLASS = "X-CLASS";
    private static final String VCARD_PROPERTY_X_DCM_HMN_MODE = "X-DCM-HMN-MODE";
    private static final String VCARD_PROPERTY_X_NICKNAME = "X-NICKNAME";
    private static final String VCARD_PROPERTY_X_NO = "X-NO";
    private static final String VCARD_PROPERTY_X_PHONETIC_FIRST_NAME = "X-PHONETIC-FIRST-NAME";
    private static final String VCARD_PROPERTY_X_PHONETIC_LAST_NAME = "X-PHONETIC-LAST-NAME";
    private static final String VCARD_PROPERTY_X_PHONETIC_MIDDLE_NAME = "X-PHONETIC-MIDDLE-NAME";
    private static final String VCARD_PROPERTY_X_REDUCTION = "X-REDUCTION";
    private static final String VCARD_PROPERTY_X_TIMESTAMP = "X-IRMC-CALL-DATETIME";
    public static final String VCARD_TYPE_STRING_DOCOMO = "docomo";
    private static final String VCARD_WS = " ";
    private final boolean mCareHandlerErrors;
    private final String mCharsetString;
    private final ContentResolver mContentResolver;
    private final Context mContext;
    private Cursor mCursor;
    private String mErrorReason;
    private long mFilter;
    private final List mHandlerList;
    private int mIdColumn;
    private boolean mIsCallLogComposer;
    private final boolean mIsDoCoMo;
    private final boolean mIsJapaneseMobilePhone;
    private final boolean mIsV30;
    private int mMaxCount;
    private boolean mNeedPhotoForVCard;
    private int mOffset;
    private final boolean mOnlyOneNoteFieldIsAvailable;
    private boolean mTerminateIsCalled;
    private boolean mUsePbapNameImprove;
    private final boolean mUsesAndroidProperty;
    private final boolean mUsesDefactProperty;
    private final boolean mUsesQPToPrimaryProperties;
    private final boolean mUsesQuotedPrintable;
    private final boolean mUsesShiftJis;
    private final boolean mUsesUtf8;
    private final String mVCardAttributeCharset;
    private final int mVCardType;

    public BluetoothVCardComposer(Context context)
    {
        this(context, 0xc0000000, true, false, true);
    }

    public BluetoothVCardComposer(Context context, int i, boolean flag)
    {
        this(context, i, flag, false, true);
    }

    public BluetoothVCardComposer(Context context, int i, boolean flag, boolean flag1, boolean flag2)
    {
        mErrorReason = "No error";
        mIsCallLogComposer = false;
        mNeedPhotoForVCard = true;
        mUsePbapNameImprove = true;
        mOffset = 0;
        mMaxCount = -1;
        mFilter = 0L;
        mContext = context;
        mVCardType = i;
        mCareHandlerErrors = flag;
        mIsCallLogComposer = flag1;
        mNeedPhotoForVCard = flag2;
        mContentResolver = context.getContentResolver();
        mIsV30 = VCardConfig.isV30(i);
        mUsesQuotedPrintable = VCardConfig.usesQuotedPrintable(i);
        mIsDoCoMo = VCardConfig.isDoCoMo(i);
        mIsJapaneseMobilePhone = VCardConfig.needsToConvertPhoneticString(i);
        mOnlyOneNoteFieldIsAvailable = VCardConfig.onlyOneNoteFieldIsAvailable(i);
        mUsesAndroidProperty = VCardConfig.usesAndroidSpecificProperty(i);
        mUsesDefactProperty = VCardConfig.usesDefactProperty(i);
        mUsesUtf8 = VCardConfig.usesUtf8(i);
        mUsesShiftJis = VCardConfig.usesShiftJis(i);
        mUsesQPToPrimaryProperties = VCardConfig.usesQPToPrimaryProperties(i);
        mHandlerList = new ArrayList();
        if (mIsDoCoMo)
        {
            mCharsetString = CharsetUtils.charsetForVendor("SHIFT_JIS", "docomo").name();
            mVCardAttributeCharset = "CHARSET=SHIFT_JIS";
            return;
        }
        if (mUsesShiftJis)
        {
            mCharsetString = CharsetUtils.charsetForVendor("SHIFT_JIS").name();
            mVCardAttributeCharset = "CHARSET=SHIFT_JIS";
            return;
        } else
        {
            mCharsetString = "UTF-8";
            mVCardAttributeCharset = "CHARSET=UTF-8";
            return;
        }
    }

    public BluetoothVCardComposer(Context context, String s, boolean flag)
    {
        this(context, VCardConfig.getVCardTypeFromString(s), flag, false, true);
    }

    private void appendBirthday(StringBuilder stringbuilder, Map map)
    {
        List list = (List)map.get("vnd.android.cursor.item/contact_event");
        if (list != null && list.size() > 0)
        {
            Integer integer = ((ContentValues)list.get(0)).getAsInteger("data2");
            if (integer != null && integer.equals(Integer.valueOf(3)))
            {
                String s = ((ContentValues)list.get(0)).getAsString("data1");
                if (s != null)
                    s = s.trim();
                if (!TextUtils.isEmpty(s))
                {
                    appendVCardLine(stringbuilder, "BDAY", s);
                    return;
                }
            }
        }
    }

    private void appendEmails(StringBuilder stringbuilder, Map map)
    {
        List list = (List)map.get("vnd.android.cursor.item/email_v2");
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
                Integer integer = contentvalues.getAsInteger("data2");
                int i;
                if (integer != null)
                    i = integer.intValue();
                else
                    i = 3;
                String s = contentvalues.getAsString("data3");
                String s1 = contentvalues.getAsString("data1");
                if (s1 != null)
                    s1 = s1.trim();
                if (!TextUtils.isEmpty(s1))
                {
                    flag = true;
                    if (!hashset.contains(s1))
                    {
                        hashset.add(s1);
                        appendVCardEmailLine(stringbuilder, Integer.valueOf(i), s, s1);
                    }
                }
            } while (true);
        }
        if (!flag && mIsDoCoMo)
            appendVCardEmailLine(stringbuilder, Integer.valueOf(1), "", "");
    }

    private void appendIms(StringBuilder stringbuilder, Map map)
    {
        List list = (List)map.get("vnd.android.cursor.item/im");
        if (list != null)
        {
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                ContentValues contentvalues = (ContentValues)iterator.next();
                Integer integer = contentvalues.getAsInteger("data5");
                String s = contentvalues.getAsString("data1");
                if (s != null)
                {
                    String s1 = s.trim();
                    if (!TextUtils.isEmpty(s1) && integer != null && integer.intValue() == 5 && VCardConfig.usesAndroidSpecificProperty(mVCardType))
                        appendVCardLine(stringbuilder, "X-GOOGLE-TALK", s1);
                }
            } while (true);
        }
    }

    private void appendNickNames(StringBuilder stringbuilder, Map map)
    {
label0:
        {
            List list = (List)map.get("vnd.android.cursor.item/nickname");
            if (list == null)
                break label0;
            String s;
            if (mIsV30)
            {
                s = "NICKNAME";
            } else
            {
                if (!mUsesAndroidProperty)
                    break label0;
                s = "X-NICKNAME";
            }
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                String s1 = ((ContentValues)iterator.next()).getAsString("data1");
                if (!TextUtils.isEmpty(s1))
                {
                    boolean flag;
                    if (mUsesQuotedPrintable && !VCardUtils.containsOnlyNonCrLfPrintableAscii(s1))
                        flag = true;
                    else
                        flag = false;
                    String s2;
                    if (flag)
                        s2 = encodeQuotedPrintable(s1);
                    else
                        s2 = escapeCharacters(s1);
                    stringbuilder.append(s);
                    if (shouldAppendCharsetAttribute(s))
                    {
                        stringbuilder.append(";");
                        stringbuilder.append(mVCardAttributeCharset);
                    }
                    if (flag)
                    {
                        stringbuilder.append(";");
                        stringbuilder.append("ENCODING=QUOTED-PRINTABLE");
                    }
                    stringbuilder.append(":");
                    stringbuilder.append(s2);
                    stringbuilder.append("\r\n");
                }
            } while (true);
        }
    }

    private void appendNotes(StringBuilder stringbuilder, Map map)
    {
        List list = (List)map.get("vnd.android.cursor.item/note");
        if (list != null)
            if (mOnlyOneNoteFieldIsAvailable)
            {
                StringBuilder stringbuilder1 = new StringBuilder();
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
                            stringbuilder1.append('\n');
                        stringbuilder1.append(s2);
                    }
                } while (true);
                String s1 = stringbuilder1.toString();
                boolean flag3;
                if (!VCardUtils.containsOnlyPrintableAscii(s1))
                    flag3 = true;
                else
                    flag3 = false;
                boolean flag4;
                if (mUsesQuotedPrintable && !VCardUtils.containsOnlyNonCrLfPrintableAscii(s1))
                    flag4 = true;
                else
                    flag4 = false;
                appendVCardLine(stringbuilder, "NOTE", s1, flag3, flag4);
            } else
            {
                Iterator iterator = list.iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    String s = ((ContentValues)iterator.next()).getAsString("data1");
                    if (s != null && !TextUtils.isEmpty(s))
                    {
                        boolean flag;
                        if (!VCardUtils.containsOnlyPrintableAscii(s))
                            flag = true;
                        else
                            flag = false;
                        boolean flag1;
                        if (mUsesQuotedPrintable && !VCardUtils.containsOnlyNonCrLfPrintableAscii(s))
                            flag1 = true;
                        else
                            flag1 = false;
                        appendVCardLine(stringbuilder, "NOTE", s, flag, flag1);
                    }
                } while (true);
            }
    }

    private void appendOrganizations(StringBuilder stringbuilder, Map map)
    {
        List list = (List)map.get("vnd.android.cursor.item/organization");
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
                if (s != null && !TextUtils.isEmpty(s))
                {
                    boolean flag;
                    if (!VCardUtils.containsOnlyPrintableAscii(s))
                        flag = true;
                    else
                        flag = false;
                    boolean flag1;
                    if (mUsesQuotedPrintable && !VCardUtils.containsOnlyNonCrLfPrintableAscii(s))
                        flag1 = true;
                    else
                        flag1 = false;
                    appendVCardLine(stringbuilder, "ORG", s, flag, flag1);
                }
            } while (true);
        }
    }

    private void appendPhones(StringBuilder stringbuilder, Map map)
    {
        List list = (List)map.get("vnd.android.cursor.item/phone_v2");
        boolean flag = false;
        if (list != null)
        {
            HashSet hashset = new HashSet();
            for (Iterator iterator = list.iterator(); iterator.hasNext();)
            {
                ContentValues contentvalues = (ContentValues)iterator.next();
                Integer integer = contentvalues.getAsInteger("data2");
                String s = contentvalues.getAsString("data3");
                String s1 = contentvalues.getAsString("data1");
                if (s1 != null)
                    s1 = s1.trim();
                if (s1 != null && !TextUtils.isEmpty(s1))
                {
                    int i;
                    if (integer != null)
                        i = integer.intValue();
                    else
                        i = 1;
                    flag = true;
                    if (i == 6)
                    {
                        flag = true;
                        if (!hashset.contains(s1))
                        {
                            hashset.add(s1);
                            appendVCardTelephoneLine(stringbuilder, Integer.valueOf(i), s, s1);
                        }
                    } else
                    {
                        List list1 = splitIfSeveralPhoneNumbersExist(s1);
                        if (!list1.isEmpty())
                        {
                            flag = true;
                            Iterator iterator1 = list1.iterator();
                            while (iterator1.hasNext()) 
                            {
                                String s2 = (String)iterator1.next();
                                if (!hashset.contains(s2))
                                {
                                    int j = VCardUtils.getPhoneNumberFormat(mVCardType);
                                    SpannableStringBuilder spannablestringbuilder = new SpannableStringBuilder(s2);
                                    PhoneNumberUtils.formatNumber(spannablestringbuilder, j);
                                    String s3 = spannablestringbuilder.toString();
                                    hashset.add(s2);
                                    appendVCardTelephoneLine(stringbuilder, Integer.valueOf(i), s, s3);
                                }
                            }
                        }
                    }
                }
            }

        }
        if (!flag && mIsDoCoMo)
            appendVCardTelephoneLine(stringbuilder, Integer.valueOf(1), "", "");
    }

    private void appendPhotos(StringBuilder stringbuilder, Map map)
    {
        List list = (List)map.get("vnd.android.cursor.item/photo");
        if (list != null)
        {
            Iterator iterator = list.iterator();
label0:
            do
            {
label1:
                {
                    if (!iterator.hasNext())
                        break label0;
                    byte abyte0[] = ((ContentValues)iterator.next()).getAsByteArray("data15");
                    if (abyte0 == null)
                        continue;
                    String s;
                    if (abyte0.length >= 3 && abyte0[0] == 71 && abyte0[1] == 73 && abyte0[2] == 70)
                        s = "GIF";
                    else
                    if (abyte0.length >= 4 && abyte0[0] == -119 && abyte0[1] == 80 && abyte0[2] == 78 && abyte0[3] == 71)
                    {
                        s = "PNG";
                    } else
                    {
                        if (abyte0.length < 2 || abyte0[0] != -1 || abyte0[1] != -40)
                            break label1;
                        s = "JPEG";
                    }
                    String s1 = VCardUtils.encodeBase64(abyte0);
                    if (s1.length() > 0)
                        appendVCardPhotoLine(stringbuilder, s1, s);
                    continue;
                }
                Log.d("BluetoothVCardComposer", "Unknown photo type. Ignore.");
            } while (true);
        }
    }

    private void appendPostals(StringBuilder stringbuilder, Map map)
    {
        List list = (List)map.get("vnd.android.cursor.item/postal-address_v2");
        if (list != null)
        {
            if (mIsDoCoMo)
            {
                appendPostalsForDoCoMo(stringbuilder, list);
            } else
            {
                appendPostalsForGeneric(stringbuilder, list);
                return;
            }
        } else
        if (mIsDoCoMo)
        {
            stringbuilder.append("ADR");
            stringbuilder.append(";");
            stringbuilder.append("HOME");
            stringbuilder.append(":");
            stringbuilder.append("\r\n");
            return;
        }
    }

    private void appendPostalsForDoCoMo(StringBuilder stringbuilder, List list)
    {
        if (!appendPostalsForDoCoMoInternal(stringbuilder, list, Integer.valueOf(1)) && !appendPostalsForDoCoMoInternal(stringbuilder, list, Integer.valueOf(2)) && !appendPostalsForDoCoMoInternal(stringbuilder, list, Integer.valueOf(3)) && !appendPostalsForDoCoMoInternal(stringbuilder, list, Integer.valueOf(0)))
        {
            Log.w("BluetoothVCardComposer", "Should not come here. Must have at least one postal data.");
            return;
        } else
        {
            return;
        }
    }

    private boolean appendPostalsForDoCoMoInternal(StringBuilder stringbuilder, List list, Integer integer)
    {
        for (Iterator iterator = list.iterator(); iterator.hasNext();)
        {
            ContentValues contentvalues = (ContentValues)iterator.next();
            Integer integer1 = contentvalues.getAsInteger("data2");
            String s = contentvalues.getAsString("data3");
            if (integer1 == integer)
            {
                appendVCardPostalLine(stringbuilder, integer1, s, contentvalues);
                return true;
            }
        }

        return false;
    }

    private void appendPostalsForGeneric(StringBuilder stringbuilder, List list)
    {
        Iterator iterator = list.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            ContentValues contentvalues = (ContentValues)iterator.next();
            Integer integer = contentvalues.getAsInteger("data2");
            String s = contentvalues.getAsString("data3");
            if (integer != null)
                appendVCardPostalLine(stringbuilder, integer, s, contentvalues);
        } while (true);
    }

    private void appendStructuredNames(StringBuilder stringbuilder, Map map)
    {
        List list = (List)map.get("vnd.android.cursor.item/name");
        if (list != null && list.size() > 0)
        {
            appendStructuredNamesInternal(stringbuilder, list);
            return;
        }
        if (mIsDoCoMo)
        {
            appendVCardLine(stringbuilder, "N", "");
            return;
        }
        if (mIsV30)
        {
            appendVCardLine(stringbuilder, "N", "");
            appendVCardLine(stringbuilder, "FN", "");
            return;
        } else
        {
            appendVCardLine(stringbuilder, "N", "");
            return;
        }
    }

    private void appendStructuredNamesInternal(StringBuilder stringbuilder, List list)
    {
        ContentValues contentvalues = null;
        ContentValues contentvalues1 = null;
        Iterator iterator = list.iterator();
        do
        {
            ContentValues contentvalues2;
label0:
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
                    if (contentvalues1 != null)
                    {
                        contentvalues = contentvalues1;
                    } else
                    {
                        Log.e("BluetoothVCardComposer", "All ContentValues given from database is empty.");
                        contentvalues = new ContentValues();
                    }
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
                        boolean flag7;
                        if (mUsesQPToPrimaryProperties && !VCardUtils.containsOnlyNonCrLfPrintableAscii(s5))
                            flag7 = true;
                        else
                            flag7 = false;
                        String s25;
                        if (flag7)
                            s25 = encodeQuotedPrintable(s5);
                        else
                            s25 = escapeCharacters(s5);
                        stringbuilder.append("N");
                        if (shouldAppendCharsetAttribute(s25))
                        {
                            stringbuilder.append(";");
                            stringbuilder.append(mVCardAttributeCharset);
                        }
                        if (flag7)
                        {
                            stringbuilder.append(";");
                            stringbuilder.append("ENCODING=QUOTED-PRINTABLE");
                        }
                        stringbuilder.append(":");
                        stringbuilder.append(";");
                        stringbuilder.append(s25);
                        stringbuilder.append(";");
                        stringbuilder.append(";");
                        stringbuilder.append(";");
                        stringbuilder.append("\r\n");
                        if (mIsV30)
                        {
                            stringbuilder.append("FN");
                            if (shouldAppendCharsetAttribute(s25))
                            {
                                stringbuilder.append(";");
                                stringbuilder.append(mVCardAttributeCharset);
                            }
                            if (flag7)
                            {
                                stringbuilder.append(";");
                                stringbuilder.append("ENCODING=QUOTED-PRINTABLE");
                            }
                            stringbuilder.append(":");
                            stringbuilder.append(s25);
                            stringbuilder.append("\r\n");
                        }
                    } else
                    if (mIsDoCoMo)
                        appendVCardLine(stringbuilder, "N", "");
                    else
                    if (mIsV30)
                    {
                        appendVCardLine(stringbuilder, "N", "");
                        appendVCardLine(stringbuilder, "FN", "");
                    }
                } else
                {
                    boolean flag;
                    if (!mUsesQPToPrimaryProperties || VCardUtils.containsOnlyNonCrLfPrintableAscii(s) && VCardUtils.containsOnlyNonCrLfPrintableAscii(s2) && VCardUtils.containsOnlyNonCrLfPrintableAscii(s1) && VCardUtils.containsOnlyNonCrLfPrintableAscii(s3) && VCardUtils.containsOnlyNonCrLfPrintableAscii(s4))
                        flag = false;
                    else
                        flag = true;
                    String s6;
                    String s7;
                    String s8;
                    String s9;
                    String s10;
                    if (flag)
                    {
                        s6 = encodeQuotedPrintable(s);
                        s7 = encodeQuotedPrintable(s2);
                        s8 = encodeQuotedPrintable(s1);
                        s9 = encodeQuotedPrintable(s3);
                        s10 = encodeQuotedPrintable(s4);
                    } else
                    {
                        s6 = escapeCharacters(s);
                        s7 = escapeCharacters(s2);
                        s8 = escapeCharacters(s1);
                        s9 = escapeCharacters(s3);
                        s10 = escapeCharacters(s4);
                    }
                    if (mUsePbapNameImprove && !TextUtils.isEmpty(s5))
                    {
                        boolean flag6;
                        if (mUsesQPToPrimaryProperties && !VCardUtils.containsOnlyNonCrLfPrintableAscii(s5))
                            flag6 = true;
                        else
                            flag6 = false;
                        String s24;
                        if (flag6)
                            s24 = encodeQuotedPrintable(s5);
                        else
                            s24 = escapeCharacters(s5);
                        stringbuilder.append("N");
                        if (shouldAppendCharsetAttribute(s24))
                        {
                            stringbuilder.append(";");
                            stringbuilder.append(mVCardAttributeCharset);
                        }
                        if (flag6)
                        {
                            stringbuilder.append(";");
                            stringbuilder.append("ENCODING=QUOTED-PRINTABLE");
                        }
                        stringbuilder.append(":");
                        stringbuilder.append(";");
                        stringbuilder.append(s24);
                        stringbuilder.append(";");
                        stringbuilder.append(";");
                        stringbuilder.append(";");
                        stringbuilder.append("\r\n");
                    } else
                    {
                        stringbuilder.append("N");
                        if (shouldAppendCharsetAttribute(Arrays.asList(new String[] {
    s, s2, s1, s3, s4
})))
                        {
                            stringbuilder.append(";");
                            stringbuilder.append(mVCardAttributeCharset);
                        }
                        if (flag)
                        {
                            stringbuilder.append(";");
                            stringbuilder.append("ENCODING=QUOTED-PRINTABLE");
                        }
                        stringbuilder.append(":");
                        stringbuilder.append(s6);
                        stringbuilder.append(";");
                        stringbuilder.append(s7);
                        stringbuilder.append(";");
                        stringbuilder.append(s8);
                        stringbuilder.append(";");
                        stringbuilder.append(s9);
                        stringbuilder.append(";");
                        stringbuilder.append(s10);
                        stringbuilder.append("\r\n");
                    }
                    String s11 = VCardUtils.constructNameFromElements(VCardConfig.getNameOrderType(mVCardType), s6, s8, s7, s9, s10);
                    boolean flag1;
                    if (mUsesQPToPrimaryProperties && !VCardUtils.containsOnlyNonCrLfPrintableAscii(s11))
                        flag1 = true;
                    else
                        flag1 = false;
                    String s12;
                    if (flag1)
                        s12 = encodeQuotedPrintable(s11);
                    else
                        s12 = escapeCharacters(s11);
                    stringbuilder.append("FN");
                    if (shouldAppendCharsetAttribute(s12))
                    {
                        stringbuilder.append(";");
                        stringbuilder.append(mVCardAttributeCharset);
                    }
                    if (flag1)
                    {
                        stringbuilder.append(";");
                        stringbuilder.append("ENCODING=QUOTED-PRINTABLE");
                    }
                    stringbuilder.append(":");
                    stringbuilder.append(s12);
                    stringbuilder.append("\r\n");
                }
                String s13 = contentvalues.getAsString("data9");
                String s14 = contentvalues.getAsString("data8");
                String s15 = contentvalues.getAsString("data7");
                if (TextUtils.isEmpty(s13) && TextUtils.isEmpty(s14) && TextUtils.isEmpty(s15))
                {
                    if (mIsDoCoMo)
                    {
                        stringbuilder.append("SOUND");
                        stringbuilder.append(";");
                        stringbuilder.append("X-IRMC-N");
                        stringbuilder.append(":");
                        stringbuilder.append(";");
                        stringbuilder.append(";");
                        stringbuilder.append(";");
                        stringbuilder.append(";");
                        stringbuilder.append("\r\n");
                    }
                } else
                {
                    if (mIsJapaneseMobilePhone)
                    {
                        s13 = VCardUtils.toHalfWidthString(s13);
                        s14 = VCardUtils.toHalfWidthString(s14);
                        s15 = VCardUtils.toHalfWidthString(s15);
                    }
                    if (mIsV30)
                    {
                        String s22 = VCardUtils.constructNameFromElements(mVCardType, s13, s14, s15);
                        stringbuilder.append("SORT-STRING");
                        String s23 = escapeCharacters(s22);
                        if (shouldAppendCharsetAttribute(s23))
                        {
                            stringbuilder.append(";");
                            stringbuilder.append(mVCardAttributeCharset);
                        }
                        stringbuilder.append(":");
                        stringbuilder.append(s23);
                        stringbuilder.append("\r\n");
                    } else
                    {
                        stringbuilder.append("SOUND");
                        stringbuilder.append(";");
                        stringbuilder.append("X-IRMC-N");
                        boolean flag2;
                        if (!mUsesQPToPrimaryProperties || VCardUtils.containsOnlyNonCrLfPrintableAscii(s13) && VCardUtils.containsOnlyNonCrLfPrintableAscii(s14) && VCardUtils.containsOnlyNonCrLfPrintableAscii(s15))
                            flag2 = false;
                        else
                            flag2 = true;
                        String s16;
                        String s17;
                        String s18;
                        if (flag2)
                        {
                            s16 = encodeQuotedPrintable(s13);
                            s17 = encodeQuotedPrintable(s14);
                            s18 = encodeQuotedPrintable(s15);
                        } else
                        {
                            s16 = escapeCharacters(s13);
                            s17 = escapeCharacters(s14);
                            s18 = escapeCharacters(s15);
                        }
                        if (shouldAppendCharsetAttribute(Arrays.asList(new String[] {
    s16, s17, s18
})))
                        {
                            stringbuilder.append(";");
                            stringbuilder.append(mVCardAttributeCharset);
                        }
                        stringbuilder.append(":");
                        stringbuilder.append(s16);
                        stringbuilder.append(";");
                        stringbuilder.append(s18);
                        stringbuilder.append(";");
                        stringbuilder.append(s17);
                        stringbuilder.append(";");
                        stringbuilder.append(";");
                        stringbuilder.append("\r\n");
                    }
                }
                if (mUsesDefactProperty)
                {
                    if (!TextUtils.isEmpty(s15))
                    {
                        boolean flag5;
                        if (mUsesQPToPrimaryProperties && !VCardUtils.containsOnlyNonCrLfPrintableAscii(s15))
                            flag5 = true;
                        else
                            flag5 = false;
                        String s21;
                        if (flag5)
                            s21 = encodeQuotedPrintable(s15);
                        else
                            s21 = escapeCharacters(s15);
                        stringbuilder.append("X-PHONETIC-FIRST-NAME");
                        if (shouldAppendCharsetAttribute(s21))
                        {
                            stringbuilder.append(";");
                            stringbuilder.append(mVCardAttributeCharset);
                        }
                        if (flag5)
                        {
                            stringbuilder.append(";");
                            stringbuilder.append("ENCODING=QUOTED-PRINTABLE");
                        }
                        stringbuilder.append(":");
                        stringbuilder.append(s21);
                        stringbuilder.append("\r\n");
                    }
                    if (!TextUtils.isEmpty(s14))
                    {
                        boolean flag4;
                        if (mUsesQPToPrimaryProperties && !VCardUtils.containsOnlyNonCrLfPrintableAscii(s14))
                            flag4 = true;
                        else
                            flag4 = false;
                        String s20;
                        if (flag4)
                            s20 = encodeQuotedPrintable(s14);
                        else
                            s20 = escapeCharacters(s14);
                        stringbuilder.append("X-PHONETIC-MIDDLE-NAME");
                        if (shouldAppendCharsetAttribute(s20))
                        {
                            stringbuilder.append(";");
                            stringbuilder.append(mVCardAttributeCharset);
                        }
                        if (flag4)
                        {
                            stringbuilder.append(";");
                            stringbuilder.append("ENCODING=QUOTED-PRINTABLE");
                        }
                        stringbuilder.append(":");
                        stringbuilder.append(s20);
                        stringbuilder.append("\r\n");
                    }
                    if (!TextUtils.isEmpty(s13))
                    {
                        boolean flag3;
                        if (mUsesQPToPrimaryProperties && !VCardUtils.containsOnlyNonCrLfPrintableAscii(s13))
                            flag3 = true;
                        else
                            flag3 = false;
                        String s19;
                        if (flag3)
                            s19 = encodeQuotedPrintable(s13);
                        else
                            s19 = escapeCharacters(s13);
                        stringbuilder.append("X-PHONETIC-LAST-NAME");
                        if (shouldAppendCharsetAttribute(s19))
                        {
                            stringbuilder.append(";");
                            stringbuilder.append(mVCardAttributeCharset);
                        }
                        if (flag3)
                        {
                            stringbuilder.append(";");
                            stringbuilder.append("ENCODING=QUOTED-PRINTABLE");
                        }
                        stringbuilder.append(":");
                        stringbuilder.append(s19);
                        stringbuilder.append("\r\n");
                    }
                }
                return;
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

    private void appendTitles(StringBuilder stringbuilder, Map map)
    {
        List list = (List)map.get("vnd.android.cursor.item/organization");
        if (list != null)
        {
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                String s = ((ContentValues)iterator.next()).getAsString("data4");
                if (s != null)
                {
                    String s1 = s.trim();
                    if (!TextUtils.isEmpty(s1))
                    {
                        boolean flag;
                        if (!VCardUtils.containsOnlyPrintableAscii(s1))
                            flag = true;
                        else
                            flag = false;
                        boolean flag1;
                        if (mUsesQuotedPrintable && !VCardUtils.containsOnlyNonCrLfPrintableAscii(s1))
                            flag1 = true;
                        else
                            flag1 = false;
                        appendVCardLine(stringbuilder, "TITLE", s1, flag, flag1);
                    }
                }
            } while (true);
        }
    }

    private void appendTypeAttribute(StringBuilder stringbuilder, String s)
    {
        if (mIsV30)
            stringbuilder.append("TYPE").append("=");
        stringbuilder.append(s);
    }

    private void appendTypeAttributes(StringBuilder stringbuilder, List list)
    {
        boolean flag = true;
        String s;
        for (Iterator iterator = list.iterator(); iterator.hasNext(); appendTypeAttribute(stringbuilder, s))
        {
            s = (String)iterator.next();
            if (flag)
                flag = false;
            else
                stringbuilder.append(";");
        }

    }

    private void appendUncommonPhoneType(StringBuilder stringbuilder, Integer integer)
    {
        if (mIsDoCoMo)
        {
            stringbuilder.append("VOICE");
            return;
        }
        String s = VCardUtils.getPhoneAttributeString(integer);
        if (s != null)
        {
            appendTypeAttribute(stringbuilder, s);
            return;
        } else
        {
            Log.e("BluetoothVCardComposer", (new StringBuilder()).append("Unknown or unsupported (by vCard) Phone type: ").append(integer).toString());
            return;
        }
    }

    private void appendVCardEmailLine(StringBuilder stringbuilder, Integer integer, String s, String s1)
    {
        stringbuilder.append("EMAIL");
        int i;
        if (integer == null)
            i = 3;
        else
            i = integer.intValue();
        String s2;
        switch (i)
        {
        case 4: // '\004'
            s2 = "CELL";
            break;

        case 3: // '\003'
            s2 = "INTERNET";
            break;

        case 2: // '\002'
            s2 = "WORK";
            break;

        case 1: // '\001'
            s2 = "HOME";
            break;

        case 0: // '\0'
            if ("_AUTO_CELL".equals(s))
            {
                s2 = "CELL";
                break;
            }
            if (mUsesAndroidProperty && !TextUtils.isEmpty(s) && VCardUtils.containsOnlyAlphaDigitHyphen(s))
                s2 = (new StringBuilder()).append("X-").append(s).toString();
            else
                s2 = "INTERNET";
            break;

        default:
            Log.e("BluetoothVCardComposer", (new StringBuilder()).append("Unknown Email type: ").append(i).toString());
            s2 = "INTERNET";
            break;
        }
        stringbuilder.append(";");
        appendTypeAttribute(stringbuilder, s2);
        stringbuilder.append(":");
        stringbuilder.append(s1);
        stringbuilder.append("\r\n");
    }

    private void appendVCardLine(StringBuilder stringbuilder, String s, String s1)
    {
        appendVCardLine(stringbuilder, s, s1, false, false);
    }

    private void appendVCardLine(StringBuilder stringbuilder, String s, String s1, boolean flag, boolean flag1)
    {
        stringbuilder.append(s);
        if (flag)
        {
            stringbuilder.append(";");
            stringbuilder.append(mVCardAttributeCharset);
        }
        String s2;
        if (flag1)
        {
            stringbuilder.append(";");
            stringbuilder.append("ENCODING=QUOTED-PRINTABLE");
            s2 = encodeQuotedPrintable(s1);
        } else
        {
            s2 = escapeCharacters(s1);
        }
        stringbuilder.append(":");
        stringbuilder.append(s2);
        stringbuilder.append("\r\n");
    }

    private void appendVCardPhotoLine(StringBuilder stringbuilder, String s, String s1)
    {
        StringBuilder stringbuilder1 = new StringBuilder();
        stringbuilder1.append("PHOTO");
        stringbuilder1.append(";");
        if (mIsV30)
            stringbuilder1.append("ENCODING=b");
        else
            stringbuilder1.append("ENCODING=BASE64");
        stringbuilder1.append(";");
        appendTypeAttribute(stringbuilder1, s1);
        stringbuilder1.append(":");
        stringbuilder1.append(s);
        String s2 = stringbuilder1.toString();
        StringBuilder stringbuilder2 = new StringBuilder();
        int i = 0;
        int j = s2.length();
        for (int k = 0; k < j; k++)
        {
            stringbuilder2.append(s2.charAt(k));
            if (++i > 72)
            {
                stringbuilder2.append("\r\n");
                stringbuilder2.append(" ");
                i = 0;
            }
        }

        stringbuilder.append(stringbuilder2.toString());
        stringbuilder.append("\r\n");
        stringbuilder.append("\r\n");
    }

    private void appendVCardPostalLine(StringBuilder stringbuilder, Integer integer, String s, ContentValues contentvalues)
    {
        stringbuilder.append("ADR");
        stringbuilder.append(";");
        boolean flag = false;
        String as[] = VCardUtils.getVCardPostalElements(contentvalues);
        boolean flag1 = false;
        int i = as.length;
        int j = 0;
        do
        {
label0:
            {
                boolean flag2 = false;
                if (j < i)
                {
                    String s3 = as[j];
                    if (TextUtils.isEmpty(s3))
                        break label0;
                    flag = true;
                    if (!flag1 && !VCardUtils.containsOnlyPrintableAscii(s3))
                        flag1 = true;
                    if (!mUsesQuotedPrintable || VCardUtils.containsOnlyNonCrLfPrintableAscii(s3))
                        break label0;
                    flag2 = true;
                }
                int k = as.length;
                for (int l = 0; l < k; l++)
                {
                    String s2 = as[l];
                    if (TextUtils.isEmpty(s2))
                        continue;
                    if (flag2)
                        as[l] = encodeQuotedPrintable(s2);
                    else
                        as[l] = escapeCharacters(s2);
                }

                int i1;
                if (integer == null)
                    i1 = 3;
                else
                    i1 = integer.intValue();
                String s1 = null;
                switch (i1)
                {
                case 0: // '\0'
                    boolean flag4 = mUsesAndroidProperty;
                    s1 = null;
                    if (!flag4)
                        break;
                    s1 = null;
                    if (s == null)
                        break;
                    boolean flag5 = TextUtils.isEmpty(s);
                    s1 = null;
                    if (flag5)
                        break;
                    boolean flag6 = VCardUtils.containsOnlyAlphaDigitHyphen(s);
                    s1 = null;
                    if (flag6)
                    {
                        stringbuilder.append("X-");
                        stringbuilder.append(s);
                        stringbuilder.append(":");
                        s1 = null;
                    }
                    break;

                case 3: // '\003'
                    break;

                case 2: // '\002'
                    s1 = "WORK";
                    break;

                case 1: // '\001'
                    s1 = "HOME";
                    break;

                default:
                    Log.e("BluetoothVCardComposer", (new StringBuilder()).append("Unknown StructuredPostal type: ").append(i1).toString());
                    break;
                }
                boolean flag3 = false;
                if (s1 != null)
                {
                    appendTypeAttribute(stringbuilder, s1);
                    flag3 = true;
                }
                if (flag)
                {
                    if (flag1)
                    {
                        if (flag3)
                            stringbuilder.append(";");
                        stringbuilder.append(mVCardAttributeCharset);
                        flag3 = true;
                    }
                    if (flag2)
                    {
                        if (flag3)
                            stringbuilder.append(";");
                        stringbuilder.append("ENCODING=QUOTED-PRINTABLE");
                    }
                }
                stringbuilder.append(":");
                if (flag)
                {
                    stringbuilder.append(as[0]);
                    stringbuilder.append(";");
                    stringbuilder.append(as[1]);
                    stringbuilder.append(";");
                    stringbuilder.append(as[2]);
                    stringbuilder.append(";");
                    stringbuilder.append(as[3]);
                    stringbuilder.append(";");
                    stringbuilder.append(as[4]);
                    stringbuilder.append(";");
                    stringbuilder.append(as[5]);
                    stringbuilder.append(";");
                    stringbuilder.append(as[6]);
                }
                stringbuilder.append("\r\n");
                return;
            }
            j++;
        } while (true);
    }

    private void appendVCardTelephoneLine(StringBuilder stringbuilder, Integer integer, String s, String s1)
    {
        stringbuilder.append("TEL");
        stringbuilder.append(";");
        int i;
        if (integer == null)
            i = 7;
        else
            i = integer.intValue();
        switch (i)
        {
        case 0: // '\0'
            if (mUsesAndroidProperty && !TextUtils.isEmpty(s) && VCardUtils.containsOnlyAlphaDigitHyphen(s))
                appendTypeAttribute(stringbuilder, (new StringBuilder()).append("X-").append(s).toString());
            else
                appendTypeAttribute(stringbuilder, "VOICE");
            break;

        case 7: // '\007'
            appendTypeAttribute(stringbuilder, "VOICE");
            break;

        case 6: // '\006'
            if (mIsDoCoMo)
                stringbuilder.append("VOICE");
            else
                appendTypeAttribute(stringbuilder, "PAGER");
            break;

        case 2: // '\002'
            stringbuilder.append("CELL");
            break;

        case 4: // '\004'
            appendTypeAttributes(stringbuilder, Arrays.asList(new String[] {
                "WORK", "FAX"
            }));
            break;

        case 5: // '\005'
            appendTypeAttributes(stringbuilder, Arrays.asList(new String[] {
                "HOME", "FAX"
            }));
            break;

        case 3: // '\003'
            appendTypeAttributes(stringbuilder, Arrays.asList(new String[] {
                "WORK", "VOICE"
            }));
            break;

        case 1: // '\001'
            appendTypeAttributes(stringbuilder, Arrays.asList(new String[] {
                "HOME", "VOICE"
            }));
            break;

        default:
            appendUncommonPhoneType(stringbuilder, Integer.valueOf(i));
            break;
        }
        stringbuilder.append(":");
        stringbuilder.append(s1);
        stringbuilder.append("\r\n");
    }

    private void appendWebsites(StringBuilder stringbuilder, Map map)
    {
        List list = (List)map.get("vnd.android.cursor.item/website");
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
                    appendVCardLine(stringbuilder, "URL", s);
            } while (true);
        }
    }

    private boolean containsNonEmptyName(ContentValues contentvalues)
    {
        String s = contentvalues.getAsString("data3");
        String s1 = contentvalues.getAsString("data5");
        String s2 = contentvalues.getAsString("data2");
        String s3 = contentvalues.getAsString("data4");
        String s4 = contentvalues.getAsString("data6");
        String s5 = contentvalues.getAsString("data1");
        return !TextUtils.isEmpty(s) || !TextUtils.isEmpty(s1) || !TextUtils.isEmpty(s2) || !TextUtils.isEmpty(s3) || !TextUtils.isEmpty(s4) || !TextUtils.isEmpty(s5);
    }

    private String createOneCallLogEntryInternal()
    {
        StringBuilder stringbuilder = new StringBuilder();
        appendVCardLine(stringbuilder, "BEGIN", "VCARD");
        if (mIsV30)
            appendVCardLine(stringbuilder, "VERSION", "3.0");
        else
            appendVCardLine(stringbuilder, "VERSION", "2.1");
        String s = mCursor.getString(3);
        if (TextUtils.isEmpty(s))
            s = mCursor.getString(0);
        boolean flag;
        if (!VCardUtils.containsOnlyPrintableAscii(s))
            flag = true;
        else
            flag = false;
        appendVCardLine(stringbuilder, "FN", s, flag, false);
        appendVCardLine(stringbuilder, "N", s, flag, false);
        String s1 = mCursor.getString(0);
        int i = mCursor.getInt(4);
        String s2 = mCursor.getString(5);
        if (TextUtils.isEmpty(s2))
            s2 = Integer.toString(i);
        appendVCardTelephoneLine(stringbuilder, Integer.valueOf(i), s2, s1);
        tryAppendCallHistoryTimeStampField(stringbuilder);
        appendVCardLine(stringbuilder, "END", "VCARD");
        return stringbuilder.toString();
    }

    private String createOneEntryInternal(String s)
    {
        HashMap hashmap;
        String as[];
        EntityIterator entityiterator;
        hashmap = new HashMap();
        as = (new String[] {
            s
        });
        entityiterator = null;
        Cursor cursor = mContentResolver.query(DATA_REQUEST_URI, null, "contact_id=?", as, null);
        boolean flag;
        flag = false;
        entityiterator = null;
        if (cursor == null)
            break MISSING_BLOCK_LABEL_201;
        entityiterator = android.provider.ContactsContract.RawContacts.newEntityIterator(cursor);
        flag = entityiterator.hasNext();
_L4:
        Iterator iterator;
        if (!entityiterator.hasNext())
            break MISSING_BLOCK_LABEL_201;
        iterator = ((Entity)entityiterator.next()).getSubValues().iterator();
_L2:
        ContentValues contentvalues;
        String s1;
        if (!iterator.hasNext())
            break; /* Loop/switch isn't completed */
        contentvalues = ((android.content.Entity.NamedContentValues)iterator.next()).values;
        s1 = contentvalues.getAsString("mimetype");
        if (s1 == null)
            continue; /* Loop/switch isn't completed */
        Object obj = (List)hashmap.get(s1);
        if (obj != null)
            break MISSING_BLOCK_LABEL_171;
        obj = new ArrayList();
        hashmap.put(s1, obj);
        ((List) (obj)).add(contentvalues);
        if (true) goto _L2; else goto _L1
_L1:
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        if (entityiterator != null)
            entityiterator.close();
        throw exception;
        if (entityiterator != null)
            entityiterator.close();
        if (!flag)
            return "";
        StringBuilder stringbuilder = new StringBuilder();
        appendVCardLine(stringbuilder, "BEGIN", "VCARD");
        if (mIsV30)
            appendVCardLine(stringbuilder, "VERSION", "3.0");
        else
            appendVCardLine(stringbuilder, "VERSION", "2.1");
        appendStructuredNames(stringbuilder, hashmap);
        if ((0x800000L & mFilter) != 0L)
        {
            Log.d("BluetoothVCardComposer", "appendNickName");
            appendNickNames(stringbuilder, hashmap);
        }
        appendPhones(stringbuilder, hashmap);
        if ((256L & mFilter) != 0L)
        {
            Log.d("BluetoothVCardComposer", "appendEmails");
            appendEmails(stringbuilder, hashmap);
        }
        if ((32L & mFilter) != 0L)
        {
            Log.d("BluetoothVCardComposer", "appendPostals");
            appendPostals(stringbuilder, hashmap);
        }
        if ((0x100000L & mFilter) != 0L)
            appendWebsites(stringbuilder, hashmap);
        if ((16L & mFilter) != 0L)
            appendBirthday(stringbuilder, hashmap);
        if ((0x10000L & mFilter) != 0L)
            appendOrganizations(stringbuilder, hashmap);
        if ((4096L & mFilter) != 0L)
            appendTitles(stringbuilder, hashmap);
        if (mNeedPhotoForVCard && (8L & mFilter) != 0L)
            appendPhotos(stringbuilder, hashmap);
        if ((0x20000L & mFilter) != 0L)
            appendNotes(stringbuilder, hashmap);
        if (mIsDoCoMo)
        {
            appendVCardLine(stringbuilder, "X-CLASS", "PUBLIC");
            appendVCardLine(stringbuilder, "X-REDUCTION", "");
            appendVCardLine(stringbuilder, "X-NO", "");
            appendVCardLine(stringbuilder, "X-DCM-HMN-MODE", "");
        }
        appendVCardLine(stringbuilder, "END", "VCARD");
        return stringbuilder.toString();
    }

    private String encodeQuotedPrintable(String s)
    {
        String s1;
        StringBuilder stringbuilder1;
        int k;
        int l;
        if (s == null || TextUtils.isEmpty(s))
            return "";
        StringBuilder stringbuilder = new StringBuilder();
        int i = s.length();
        int j = 0;
        while (j < i) 
        {
            char c = s.charAt(j);
            if (c == '\r')
            {
                if (j + 1 < i && s.charAt(j + 1) == '\n')
                    j++;
                stringbuilder.append("\r\n");
            } else
            if (c == '\n')
                stringbuilder.append("\r\n");
            else
                stringbuilder.append(c);
            j++;
        }
        s1 = stringbuilder.toString();
        stringbuilder1 = new StringBuilder();
        k = 0;
        l = 0;
        byte abyte1[] = s1.getBytes(mCharsetString);
        byte abyte0[] = abyte1;
_L2:
        if (k >= abyte0.length)
            break; /* Loop/switch isn't completed */
        Object aobj[] = new Object[1];
        aobj[0] = Byte.valueOf(abyte0[k]);
        stringbuilder1.append(String.format("=%02X", aobj));
        k++;
        if ((l += 3) >= 67)
        {
            stringbuilder1.append("=\r\n");
            l = 0;
        }
        continue; /* Loop/switch isn't completed */
        UnsupportedEncodingException unsupportedencodingexception;
        unsupportedencodingexception;
        Log.e("BluetoothVCardComposer", (new StringBuilder()).append("Charset ").append(mCharsetString).append(" cannot be used. ").append("Try default charset").toString());
        abyte0 = s1.getBytes();
        k = 0;
        l = 0;
        if (true) goto _L2; else goto _L1
_L1:
        return stringbuilder1.toString();
    }

    private String escapeCharacters(String s)
    {
        if (s != null && !TextUtils.isEmpty(s))
        {
            StringBuilder stringbuilder = new StringBuilder();
            int i = s.length();
            for (int j = 0; j < i; j++)
            {
                char c = s.charAt(j);
                switch (c)
                {
                case 44: // ','
                    if (mIsV30)
                        stringbuilder.append("\\,");
                    else
                        stringbuilder.append(c);
                    break;

                case 92: // '\\'
                    if (mIsV30)
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
                    if (j + 1 < i && s.charAt(j + 1) == '\n')
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
        } else
        {
            return "";
        }
    }

    private boolean shouldAppendCharsetAttribute(String s)
    {
        return !VCardUtils.containsOnlyPrintableAscii(s) && (!mIsV30 || !mUsesUtf8);
    }

    private boolean shouldAppendCharsetAttribute(List list)
    {
        Iterator iterator = list.iterator();
        boolean flag1;
        do
        {
            boolean flag = iterator.hasNext();
            flag1 = false;
            if (!flag)
                break;
            if (VCardUtils.containsOnlyPrintableAscii((String)iterator.next()))
                continue;
            flag1 = true;
            break;
        } while (true);
        return flag1 && (!mIsV30 || !mUsesUtf8);
    }

    private List splitIfSeveralPhoneNumbersExist(String s)
    {
        ArrayList arraylist = new ArrayList();
        boolean flag = true;
        if (s != null)
        {
            StringBuilder stringbuilder = new StringBuilder();
            int i = s.length();
            for (int j = 0; j < i; j++)
            {
                char c = s.charAt(j);
                if (flag && c == '+')
                {
                    stringbuilder.append(c);
                    flag = false;
                    continue;
                }
                if (Character.isDigit(c))
                {
                    stringbuilder.append(c);
                    flag = false;
                    continue;
                }
                if ((c == ';' || c == '\n') && stringbuilder.length() > 0)
                {
                    arraylist.add(stringbuilder.toString());
                    stringbuilder = new StringBuilder();
                    flag = true;
                }
            }

            if (stringbuilder.length() > 0)
                arraylist.add(stringbuilder.toString());
        }
        return arraylist;
    }

    private String toRfc2455Format(long l)
    {
        Time time = new Time();
        time.set(l);
        String s = time.format2445();
        return (new StringBuilder()).append(s).append("Z").toString();
    }

    private void tryAppendCallHistoryTimeStampField(StringBuilder stringbuilder)
    {
label0:
        {
            String s;
            switch (mCursor.getInt(2))
            {
            default:
                break label0;

            case 3: // '\003'
                s = "MISSED";
                break;

            case 2: // '\002'
                s = "DIALED";
                break;

            case 1: // '\001'
                s = "RECEIVED";
                break;
            }
            long l = mCursor.getLong(1);
            stringbuilder.append("X-IRMC-CALL-DATETIME");
            stringbuilder.append(";");
            appendTypeAttribute(stringbuilder, s);
            stringbuilder.append(":");
            stringbuilder.append(toRfc2455Format(l));
            stringbuilder.append("\r\n");
            return;
        }
        Log.w("BluetoothVCardComposer", "Call log type not correct.");
    }

    public void addHandler(OneEntryHandler oneentryhandler)
    {
        mHandlerList.add(oneentryhandler);
    }

    public String composeVCardForPhoneOwnNumber(int i, String s, String s1, boolean flag)
    {
        StringBuilder stringbuilder = new StringBuilder();
        appendVCardLine(stringbuilder, "BEGIN", "VCARD");
        if (!flag)
            appendVCardLine(stringbuilder, "VERSION", "3.0");
        else
            appendVCardLine(stringbuilder, "VERSION", "2.1");
        boolean flag1 = VCardUtils.containsOnlyPrintableAscii(s);
        boolean flag2 = false;
        if (!flag1)
            flag2 = true;
        appendVCardLine(stringbuilder, "FN", s, flag2, false);
        appendVCardLine(stringbuilder, "N", s, flag2, false);
        if (!TextUtils.isEmpty(s1))
        {
            String s2 = Integer.toString(i);
            appendVCardTelephoneLine(stringbuilder, Integer.valueOf(i), s2, s1);
        }
        appendVCardLine(stringbuilder, "END", "VCARD");
        return stringbuilder.toString();
    }

    public boolean createOneEntry()
    {
        boolean flag = true;
        if (mCursor != null && !mCursor.isAfterLast()) goto _L2; else goto _L1
_L1:
        mErrorReason = "The vCard composer object is not correctly initialized";
        flag = false;
_L5:
        return flag;
_L2:
        String s1;
        if (!mIsCallLogComposer)
            break MISSING_BLOCK_LABEL_125;
        s1 = createOneCallLogEntryInternal();
        String s = s1;
_L3:
        mCursor.moveToNext();
        if (mCareHandlerErrors)
        {
            new ArrayList(mHandlerList.size());
            Iterator iterator = mHandlerList.iterator();
            do
                if (!iterator.hasNext())
                    continue; /* Loop/switch isn't completed */
            while (((OneEntryHandler)iterator.next()).onEntryCreated(s));
            return false;
        }
        break MISSING_BLOCK_LABEL_251;
label0:
        {
            if (mIdColumn < 0)
                break label0;
            s = createOneEntryInternal(mCursor.getString(mIdColumn));
        }
          goto _L3
        Log.e("BluetoothVCardComposer", (new StringBuilder()).append("Incorrect mIdColumn: ").append(mIdColumn).toString());
        mCursor.moveToNext();
        return flag;
        OutOfMemoryError outofmemoryerror;
        outofmemoryerror;
        Log.e("BluetoothVCardComposer", (new StringBuilder()).append("OutOfMemoryError occured. Ignore the entry: ").append(null).toString());
        System.gc();
        mCursor.moveToNext();
        return flag;
        Exception exception;
        exception;
        mCursor.moveToNext();
        throw exception;
        Iterator iterator1 = mHandlerList.iterator();
        while (iterator1.hasNext()) 
            ((OneEntryHandler)iterator1.next()).onEntryCreated(s);
        if (true) goto _L5; else goto _L4
_L4:
    }

    public int getCount()
    {
        if (mCursor == null)
            return 0;
        else
            return mCursor.getCount();
    }

    public String getErrorReason()
    {
        return mErrorReason;
    }

    public boolean init()
    {
        return init(null, null, null);
    }

    public boolean init(String s, String as[], String s1)
    {
label0:
        {
            if (mCareHandlerErrors)
            {
                ArrayList arraylist = new ArrayList(mHandlerList.size());
                Iterator iterator = mHandlerList.iterator();
                do
                    if (!iterator.hasNext())
                        break label0;
                while (((OneEntryHandler)iterator.next()).onInit(mContext));
                for (Iterator iterator1 = arraylist.iterator(); iterator1.hasNext(); ((OneEntryHandler)iterator1.next()).onTerminate());
                return false;
            }
            for (Iterator iterator2 = mHandlerList.iterator(); iterator2.hasNext(); ((OneEntryHandler)iterator2.next()).onInit(mContext));
        }
        Log.d("BluetoothVCardComposer", (new StringBuilder()).append("mIsCallLogComposer=").append(String.valueOf(mIsCallLogComposer)).toString());
        Log.d("BluetoothVCardComposer", (new StringBuilder()).append("init(").append(s).append(",").append(as).append(",").append(s1).append(")").toString());
        if (mIsCallLogComposer)
            mCursor = mContentResolver.query(android.provider.CallLog.Calls.CONTENT_URI, CALL_LOG_PROJECTION, s, as, s1);
        else
            mCursor = mContentResolver.query(android.provider.ContactsContract.Contacts.CONTENT_URI, CONTACTS_PROJECTION, s, as, s1);
        if (mCursor == null)
        {
            Log.d("BluetoothVCardComposer", "mCursor == null");
            mErrorReason = "Failed to get database information";
            return false;
        }
        if (getCount() != 0 && mCursor.moveToFirst())
            break MISSING_BLOCK_LABEL_441;
        Log.d("BluetoothVCardComposer", (new StringBuilder()).append("getCount()=").append(getCount()).toString());
        mCursor.close();
        mCursor = null;
        mErrorReason = "There's no exportable in the database";
_L2:
        return false;
        SQLiteException sqliteexception;
        sqliteexception;
        Log.e("BluetoothVCardComposer", (new StringBuilder()).append("SQLiteException on Cursor#close(): ").append(sqliteexception.getMessage()).toString());
        mCursor = null;
        mErrorReason = "There's no exportable in the database";
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        mCursor = null;
        mErrorReason = "There's no exportable in the database";
        throw exception;
        if (mIsCallLogComposer)
            mIdColumn = -1;
        else
            mIdColumn = mCursor.getColumnIndex("_id");
        return true;
    }

    public boolean isAfterLast()
    {
        if (mCursor == null)
            return false;
        else
            return mCursor.isAfterLast();
    }

    public boolean movePosition(int i)
    {
        if (mCursor != null && i >= 0 && i < mCursor.getCount())
            return mCursor.moveToPosition(i);
        else
            return false;
    }

    public void setVCardAttribFilter(long l)
    {
        Log.d("BluetoothVCardComposer", (new StringBuilder()).append("[API] setVCardAttribFilter(").append(l).append(")").toString());
        mFilter = l;
    }

    public void terminate()
    {
        for (Iterator iterator = mHandlerList.iterator(); iterator.hasNext(); ((OneEntryHandler)iterator.next()).onTerminate());
        if (mCursor != null)
        {
            try
            {
                mCursor.close();
            }
            catch (SQLiteException sqliteexception)
            {
                Log.e("BluetoothVCardComposer", (new StringBuilder()).append("SQLiteException on Cursor#close(): ").append(sqliteexception.getMessage()).toString());
            }
            mCursor = null;
        }
        mTerminateIsCalled = true;
    }

    static 
    {
        android.net.Uri.Builder builder = android.provider.ContactsContract.RawContactsEntity.CONTENT_URI.buildUpon();
        builder.appendQueryParameter("for_export_only", "1");
        DATA_REQUEST_URI = builder.build();
        IM_MAP = new HashMap();
        IM_MAP.put(Integer.valueOf(0), "X-AIM");
        IM_MAP.put(Integer.valueOf(1), "X-MSN");
        IM_MAP.put(Integer.valueOf(2), "X-YAHOO");
        IM_MAP.put(Integer.valueOf(6), "X-ICQ");
        IM_MAP.put(Integer.valueOf(7), "X-JABBER");
        IM_MAP.put(Integer.valueOf(3), "X-SKYPE-USERNAME");
    }



/*
    static String access$102(BluetoothVCardComposer bluetoothvcardcomposer, String s)
    {
        bluetoothvcardcomposer.mErrorReason = s;
        return s;
    }

*/


}
