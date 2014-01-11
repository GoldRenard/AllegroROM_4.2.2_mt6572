// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.vcard;

import android.accounts.Account;
import android.content.ContentProviderOperation;
import android.content.ContentResolver;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import java.util.*;

// Referenced classes of package com.android.vcard:
//            VCardConfig, VCardUtils, VCardProperty

public class VCardEntry
{
    public static class AndroidCustomData
        implements EntryElement
    {

        private final List mDataList;
        private final String mMimeType;

        public static AndroidCustomData constructAndroidCustomData(List list)
        {
            int i = 16;
            String s;
            List list1;
            if (list == null)
            {
                s = null;
                list1 = null;
            } else
            if (list.size() < 2)
            {
                s = (String)list.get(0);
                list1 = null;
            } else
            {
                if (list.size() < i)
                    i = list.size();
                s = (String)list.get(0);
                list1 = list.subList(1, i);
            }
            return new AndroidCustomData(s, list1);
        }

        public void constructInsertOperation(List list, int i)
        {
            android.content.ContentProviderOperation.Builder builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
            builder.withValueBackReference("raw_contact_id", i);
            builder.withValue("mimetype", mMimeType);
            for (int j = 0; j < mDataList.size(); j++)
            {
                String s = (String)mDataList.get(j);
                if (!TextUtils.isEmpty(s))
                    builder.withValue((new StringBuilder()).append("data").append(j + 1).toString(), s);
            }

            list.add(builder.build());
        }

        public boolean equals(Object obj)
        {
label0:
            {
                boolean flag1;
                if (this == obj)
                {
                    flag1 = true;
                } else
                {
                    boolean flag = obj instanceof AndroidCustomData;
                    flag1 = false;
                    if (flag)
                    {
                        AndroidCustomData androidcustomdata = (AndroidCustomData)obj;
                        boolean flag2 = TextUtils.equals(mMimeType, androidcustomdata.mMimeType);
                        flag1 = false;
                        if (flag2)
                        {
                            if (mDataList == null)
                            {
                                boolean flag4;
                                if (androidcustomdata.mDataList == null)
                                    flag4 = true;
                                else
                                    flag4 = false;
                                return flag4;
                            }
                            int i = mDataList.size();
                            int j = androidcustomdata.mDataList.size();
                            flag1 = false;
                            if (i == j)
                            {
                                int k = 0;
                                do
                                {
                                    if (k >= i)
                                        break label0;
                                    boolean flag3 = TextUtils.equals((CharSequence)mDataList.get(k), (CharSequence)androidcustomdata.mDataList.get(k));
                                    flag1 = false;
                                    if (!flag3)
                                        break;
                                    k++;
                                } while (true);
                            }
                        }
                    }
                }
                return flag1;
            }
            return true;
        }

        public List getDataList()
        {
            return mDataList;
        }

        public EntryLabel getEntryLabel()
        {
            return EntryLabel.ANDROID_CUSTOM;
        }

        public String getMimeType()
        {
            return mMimeType;
        }

        public int hashCode()
        {
            int i;
            if (mMimeType != null)
                i = mMimeType.hashCode();
            else
                i = 0;
            if (mDataList != null)
            {
                for (Iterator iterator = mDataList.iterator(); iterator.hasNext();)
                {
                    String s = (String)iterator.next();
                    int j = i * 31;
                    int k;
                    if (s != null)
                        k = s.hashCode();
                    else
                        k = 0;
                    i = j + k;
                }

            }
            return i;
        }

        public boolean isEmpty()
        {
            return TextUtils.isEmpty(mMimeType) || mDataList == null || mDataList.size() == 0;
        }

        public String toString()
        {
            StringBuilder stringbuilder = new StringBuilder();
            stringbuilder.append((new StringBuilder()).append("android-custom: ").append(mMimeType).append(", data: ").toString());
            String s;
            if (mDataList == null)
                s = "null";
            else
                s = Arrays.toString(mDataList.toArray());
            stringbuilder.append(s);
            return stringbuilder.toString();
        }

        public AndroidCustomData(String s, List list)
        {
            mMimeType = s;
            mDataList = list;
        }
    }

    public static class AnniversaryData
        implements EntryElement
    {

        private final String mAnniversary;

        public void constructInsertOperation(List list, int i)
        {
            android.content.ContentProviderOperation.Builder builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
            builder.withValueBackReference("raw_contact_id", i);
            builder.withValue("mimetype", "vnd.android.cursor.item/contact_event");
            builder.withValue("data1", mAnniversary);
            builder.withValue("data2", Integer.valueOf(1));
            list.add(builder.build());
        }

        public boolean equals(Object obj)
        {
            if (this == obj)
                return true;
            if (!(obj instanceof AnniversaryData))
            {
                return false;
            } else
            {
                AnniversaryData anniversarydata = (AnniversaryData)obj;
                return TextUtils.equals(mAnniversary, anniversarydata.mAnniversary);
            }
        }

        public String getAnniversary()
        {
            return mAnniversary;
        }

        public EntryLabel getEntryLabel()
        {
            return EntryLabel.ANNIVERSARY;
        }

        public int hashCode()
        {
            if (mAnniversary != null)
                return mAnniversary.hashCode();
            else
                return 0;
        }

        public boolean isEmpty()
        {
            return TextUtils.isEmpty(mAnniversary);
        }

        public String toString()
        {
            return (new StringBuilder()).append("anniversary: ").append(mAnniversary).toString();
        }

        public AnniversaryData(String s)
        {
            mAnniversary = s;
        }
    }

    public static class BirthdayData
        implements EntryElement
    {

        private final String mBirthday;

        public void constructInsertOperation(List list, int i)
        {
            android.content.ContentProviderOperation.Builder builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
            builder.withValueBackReference("raw_contact_id", i);
            builder.withValue("mimetype", "vnd.android.cursor.item/contact_event");
            builder.withValue("data1", mBirthday);
            builder.withValue("data2", Integer.valueOf(3));
            list.add(builder.build());
        }

        public boolean equals(Object obj)
        {
            if (this == obj)
                return true;
            if (!(obj instanceof BirthdayData))
            {
                return false;
            } else
            {
                BirthdayData birthdaydata = (BirthdayData)obj;
                return TextUtils.equals(mBirthday, birthdaydata.mBirthday);
            }
        }

        public String getBirthday()
        {
            return mBirthday;
        }

        public EntryLabel getEntryLabel()
        {
            return EntryLabel.BIRTHDAY;
        }

        public int hashCode()
        {
            if (mBirthday != null)
                return mBirthday.hashCode();
            else
                return 0;
        }

        public boolean isEmpty()
        {
            return TextUtils.isEmpty(mBirthday);
        }

        public String toString()
        {
            return (new StringBuilder()).append("birthday: ").append(mBirthday).toString();
        }


        public BirthdayData(String s)
        {
            mBirthday = s;
        }
    }

    public static class EmailData
        implements EntryElement
    {

        private final String mAddress;
        private final boolean mIsPrimary;
        private final String mLabel;
        private final int mType;

        public void constructInsertOperation(List list, int i)
        {
            android.content.ContentProviderOperation.Builder builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
            builder.withValueBackReference("raw_contact_id", i);
            builder.withValue("mimetype", "vnd.android.cursor.item/email_v2");
            builder.withValue("data2", Integer.valueOf(mType));
            if (mType == 0)
                builder.withValue("data3", mLabel);
            builder.withValue("data1", mAddress);
            if (mIsPrimary)
                builder.withValue("is_primary", Integer.valueOf(1));
            list.add(builder.build());
        }

        public boolean equals(Object obj)
        {
            if (this != obj)
            {
                if (!(obj instanceof EmailData))
                    return false;
                EmailData emaildata = (EmailData)obj;
                if (mType != emaildata.mType || !TextUtils.equals(mAddress, emaildata.mAddress) || !TextUtils.equals(mLabel, emaildata.mLabel) || mIsPrimary != emaildata.mIsPrimary)
                    return false;
            }
            return true;
        }

        public String getAddress()
        {
            return mAddress;
        }

        public final EntryLabel getEntryLabel()
        {
            return EntryLabel.EMAIL;
        }

        public String getLabel()
        {
            return mLabel;
        }

        public int getType()
        {
            return mType;
        }

        public int hashCode()
        {
            int i = 31 * mType;
            int j;
            if (mAddress != null)
                j = mAddress.hashCode();
            else
                j = 0;
            int k = 31 * (i + j);
            String s = mLabel;
            int l = 0;
            if (s != null)
                l = mLabel.hashCode();
            int i1 = 31 * (k + l);
            char c;
            if (mIsPrimary)
                c = '\u04CF';
            else
                c = '\u04D5';
            return i1 + c;
        }

        public boolean isEmpty()
        {
            return TextUtils.isEmpty(mAddress);
        }

        public boolean isPrimary()
        {
            return mIsPrimary;
        }

        public String toString()
        {
            Object aobj[] = new Object[4];
            aobj[0] = Integer.valueOf(mType);
            aobj[1] = mAddress;
            aobj[2] = mLabel;
            aobj[3] = Boolean.valueOf(mIsPrimary);
            return String.format("type: %d, data: %s, label: %s, isPrimary: %s", aobj);
        }


        public EmailData(String s, int i, String s1, boolean flag)
        {
            mType = i;
            mAddress = s;
            mLabel = s1;
            mIsPrimary = flag;
        }
    }

    public static interface EntryElement
    {

        public abstract void constructInsertOperation(List list, int i);

        public abstract EntryLabel getEntryLabel();

        public abstract boolean isEmpty();
    }

    public static interface EntryElementIterator
    {

        public abstract boolean onElement(EntryElement entryelement);

        public abstract void onElementGroupEnded();

        public abstract void onElementGroupStarted(EntryLabel entrylabel);

        public abstract void onIterationEnded();

        public abstract void onIterationStarted();
    }

    public static final class EntryLabel extends Enum
    {

        private static final EntryLabel $VALUES[];
        public static final EntryLabel ANDROID_CUSTOM;
        public static final EntryLabel ANNIVERSARY;
        public static final EntryLabel BIRTHDAY;
        public static final EntryLabel EMAIL;
        public static final EntryLabel IM;
        public static final EntryLabel NAME;
        public static final EntryLabel NICKNAME;
        public static final EntryLabel NOTE;
        public static final EntryLabel ORGANIZATION;
        public static final EntryLabel PHONE;
        public static final EntryLabel PHOTO;
        public static final EntryLabel POSTAL_ADDRESS;
        public static final EntryLabel SIP;
        public static final EntryLabel WEBSITE;

        public static EntryLabel valueOf(String s)
        {
            return (EntryLabel)Enum.valueOf(com/android/vcard/VCardEntry$EntryLabel, s);
        }

        public static EntryLabel[] values()
        {
            return (EntryLabel[])$VALUES.clone();
        }

        static 
        {
            NAME = new EntryLabel("NAME", 0);
            PHONE = new EntryLabel("PHONE", 1);
            EMAIL = new EntryLabel("EMAIL", 2);
            POSTAL_ADDRESS = new EntryLabel("POSTAL_ADDRESS", 3);
            ORGANIZATION = new EntryLabel("ORGANIZATION", 4);
            IM = new EntryLabel("IM", 5);
            PHOTO = new EntryLabel("PHOTO", 6);
            WEBSITE = new EntryLabel("WEBSITE", 7);
            SIP = new EntryLabel("SIP", 8);
            NICKNAME = new EntryLabel("NICKNAME", 9);
            NOTE = new EntryLabel("NOTE", 10);
            BIRTHDAY = new EntryLabel("BIRTHDAY", 11);
            ANNIVERSARY = new EntryLabel("ANNIVERSARY", 12);
            ANDROID_CUSTOM = new EntryLabel("ANDROID_CUSTOM", 13);
            EntryLabel aentrylabel[] = new EntryLabel[14];
            aentrylabel[0] = NAME;
            aentrylabel[1] = PHONE;
            aentrylabel[2] = EMAIL;
            aentrylabel[3] = POSTAL_ADDRESS;
            aentrylabel[4] = ORGANIZATION;
            aentrylabel[5] = IM;
            aentrylabel[6] = PHOTO;
            aentrylabel[7] = WEBSITE;
            aentrylabel[8] = SIP;
            aentrylabel[9] = NICKNAME;
            aentrylabel[10] = NOTE;
            aentrylabel[11] = BIRTHDAY;
            aentrylabel[12] = ANNIVERSARY;
            aentrylabel[13] = ANDROID_CUSTOM;
            $VALUES = aentrylabel;
        }

        private EntryLabel(String s, int i)
        {
            super(s, i);
        }
    }

    public static class ImData
        implements EntryElement
    {

        private final String mAddress;
        private final String mCustomProtocol;
        private final boolean mIsPrimary;
        private final int mProtocol;
        private final int mType;

        public void constructInsertOperation(List list, int i)
        {
            android.content.ContentProviderOperation.Builder builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
            builder.withValueBackReference("raw_contact_id", i);
            builder.withValue("mimetype", "vnd.android.cursor.item/im");
            builder.withValue("data2", Integer.valueOf(mType));
            builder.withValue("data5", Integer.valueOf(mProtocol));
            builder.withValue("data1", mAddress);
            if (mProtocol == -1)
                builder.withValue("data6", mCustomProtocol);
            if (mIsPrimary)
                builder.withValue("is_primary", Integer.valueOf(1));
            list.add(builder.build());
        }

        public boolean equals(Object obj)
        {
            if (this != obj)
            {
                if (!(obj instanceof ImData))
                    return false;
                ImData imdata = (ImData)obj;
                if (mType != imdata.mType || mProtocol != imdata.mProtocol || !TextUtils.equals(mCustomProtocol, imdata.mCustomProtocol) || !TextUtils.equals(mAddress, imdata.mAddress) || mIsPrimary != imdata.mIsPrimary)
                    return false;
            }
            return true;
        }

        public String getAddress()
        {
            return mAddress;
        }

        public String getCustomProtocol()
        {
            return mCustomProtocol;
        }

        public final EntryLabel getEntryLabel()
        {
            return EntryLabel.IM;
        }

        public int getProtocol()
        {
            return mProtocol;
        }

        public int getType()
        {
            return mType;
        }

        public int hashCode()
        {
            int i = 31 * (31 * mType + mProtocol);
            int j;
            if (mCustomProtocol != null)
                j = mCustomProtocol.hashCode();
            else
                j = 0;
            int k = 31 * (i + j);
            String s = mAddress;
            int l = 0;
            if (s != null)
                l = mAddress.hashCode();
            int i1 = 31 * (k + l);
            char c;
            if (mIsPrimary)
                c = '\u04CF';
            else
                c = '\u04D5';
            return i1 + c;
        }

        public boolean isEmpty()
        {
            return TextUtils.isEmpty(mAddress);
        }

        public boolean isPrimary()
        {
            return mIsPrimary;
        }

        public String toString()
        {
            Object aobj[] = new Object[5];
            aobj[0] = Integer.valueOf(mType);
            aobj[1] = Integer.valueOf(mProtocol);
            aobj[2] = mCustomProtocol;
            aobj[3] = mAddress;
            aobj[4] = Boolean.valueOf(mIsPrimary);
            return String.format("type: %d, protocol: %d, custom_protcol: %s, data: %s, isPrimary: %s", aobj);
        }

        public ImData(int i, String s, String s1, int j, boolean flag)
        {
            mProtocol = i;
            mCustomProtocol = s;
            mType = j;
            mAddress = s1;
            mIsPrimary = flag;
        }
    }

    private class InsertOperationConstrutor
        implements EntryElementIterator
    {

        private final int mBackReferenceIndex;
        private final List mOperationList;
        final VCardEntry this$0;

        public boolean onElement(EntryElement entryelement)
        {
            if (!entryelement.isEmpty())
                entryelement.constructInsertOperation(mOperationList, mBackReferenceIndex);
            return true;
        }

        public void onElementGroupEnded()
        {
        }

        public void onElementGroupStarted(EntryLabel entrylabel)
        {
        }

        public void onIterationEnded()
        {
        }

        public void onIterationStarted()
        {
        }

        public InsertOperationConstrutor(List list, int i)
        {
            this$0 = VCardEntry.this;
            super();
            mOperationList = list;
            mBackReferenceIndex = i;
        }
    }

    private class IsIgnorableIterator
        implements EntryElementIterator
    {

        private boolean mEmpty;
        final VCardEntry this$0;

        public boolean getResult()
        {
            return mEmpty;
        }

        public boolean onElement(EntryElement entryelement)
        {
            if (!entryelement.isEmpty())
            {
                mEmpty = false;
                return false;
            } else
            {
                return true;
            }
        }

        public void onElementGroupEnded()
        {
        }

        public void onElementGroupStarted(EntryLabel entrylabel)
        {
        }

        public void onIterationEnded()
        {
        }

        public void onIterationStarted()
        {
        }

        private IsIgnorableIterator()
        {
            this$0 = VCardEntry.this;
            super();
            mEmpty = true;
        }

    }

    public static class NameData
        implements EntryElement
    {

        public String displayName;
        private String mFamily;
        private String mFormatted;
        private String mGiven;
        private String mMiddle;
        private String mPhoneticFamily;
        private String mPhoneticGiven;
        private String mPhoneticMiddle;
        private String mPrefix;
        private String mSortString;
        private String mSuffix;

        public void constructInsertOperation(List list, int i)
        {
            android.content.ContentProviderOperation.Builder builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
            builder.withValueBackReference("raw_contact_id", i);
            builder.withValue("mimetype", "vnd.android.cursor.item/name");
            if (!TextUtils.isEmpty(mGiven))
                builder.withValue("data2", mGiven);
            if (!TextUtils.isEmpty(mFamily))
                builder.withValue("data3", mFamily);
            if (!TextUtils.isEmpty(mMiddle))
                builder.withValue("data5", mMiddle);
            if (!TextUtils.isEmpty(mPrefix))
                builder.withValue("data4", mPrefix);
            if (!TextUtils.isEmpty(mSuffix))
                builder.withValue("data6", mSuffix);
            boolean flag = TextUtils.isEmpty(mPhoneticGiven);
            boolean flag1 = false;
            if (!flag)
            {
                builder.withValue("data7", mPhoneticGiven);
                flag1 = true;
            }
            if (!TextUtils.isEmpty(mPhoneticFamily))
            {
                builder.withValue("data9", mPhoneticFamily);
                flag1 = true;
            }
            if (!TextUtils.isEmpty(mPhoneticMiddle))
            {
                builder.withValue("data8", mPhoneticMiddle);
                flag1 = true;
            }
            if (!flag1)
                builder.withValue("data7", mSortString);
            builder.withValue("data1", displayName);
            list.add(builder.build());
        }

        public boolean emptyPhoneticStructuredName()
        {
            return TextUtils.isEmpty(mPhoneticFamily) && TextUtils.isEmpty(mPhoneticGiven) && TextUtils.isEmpty(mPhoneticMiddle);
        }

        public boolean emptyStructuredName()
        {
            return TextUtils.isEmpty(mFamily) && TextUtils.isEmpty(mGiven) && TextUtils.isEmpty(mMiddle) && TextUtils.isEmpty(mPrefix) && TextUtils.isEmpty(mSuffix);
        }

        public boolean equals(Object obj)
        {
            if (this != obj)
            {
                if (!(obj instanceof NameData))
                    return false;
                NameData namedata = (NameData)obj;
                if (!TextUtils.equals(mFamily, namedata.mFamily) || !TextUtils.equals(mMiddle, namedata.mMiddle) || !TextUtils.equals(mGiven, namedata.mGiven) || !TextUtils.equals(mPrefix, namedata.mPrefix) || !TextUtils.equals(mSuffix, namedata.mSuffix) || !TextUtils.equals(mFormatted, namedata.mFormatted) || !TextUtils.equals(mPhoneticFamily, namedata.mPhoneticFamily) || !TextUtils.equals(mPhoneticMiddle, namedata.mPhoneticMiddle) || !TextUtils.equals(mPhoneticGiven, namedata.mPhoneticGiven) || !TextUtils.equals(mSortString, namedata.mSortString))
                    return false;
            }
            return true;
        }

        public final EntryLabel getEntryLabel()
        {
            return EntryLabel.NAME;
        }

        public String getFamily()
        {
            return mFamily;
        }

        public String getFormatted()
        {
            return mFormatted;
        }

        public String getGiven()
        {
            return mGiven;
        }

        public String getMiddle()
        {
            return mMiddle;
        }

        public String getPrefix()
        {
            return mPrefix;
        }

        public String getSortString()
        {
            return mSortString;
        }

        public String getSuffix()
        {
            return mSuffix;
        }

        public int hashCode()
        {
            String as[] = new String[10];
            as[0] = mFamily;
            as[1] = mMiddle;
            as[2] = mGiven;
            as[3] = mPrefix;
            as[4] = mSuffix;
            as[5] = mFormatted;
            as[6] = mPhoneticFamily;
            as[7] = mPhoneticMiddle;
            as[8] = mPhoneticGiven;
            as[9] = mSortString;
            int i = 0;
            int j = as.length;
            for (int k = 0; k < j; k++)
            {
                String s = as[k];
                int l = i * 31;
                int i1;
                if (s != null)
                    i1 = s.hashCode();
                else
                    i1 = 0;
                i = l + i1;
            }

            return i;
        }

        public boolean isEmpty()
        {
            return TextUtils.isEmpty(mFamily) && TextUtils.isEmpty(mMiddle) && TextUtils.isEmpty(mGiven) && TextUtils.isEmpty(mPrefix) && TextUtils.isEmpty(mSuffix) && TextUtils.isEmpty(mFormatted) && TextUtils.isEmpty(mPhoneticFamily) && TextUtils.isEmpty(mPhoneticMiddle) && TextUtils.isEmpty(mPhoneticGiven) && TextUtils.isEmpty(mSortString);
        }

        public void setFamily(String s)
        {
            mFamily = s;
        }

        public void setGiven(String s)
        {
            mGiven = s;
        }

        public void setMiddle(String s)
        {
            mMiddle = s;
        }

        public void setPrefix(String s)
        {
            mPrefix = s;
        }

        public void setSuffix(String s)
        {
            mSuffix = s;
        }

        public String toString()
        {
            Object aobj[] = new Object[5];
            aobj[0] = mFamily;
            aobj[1] = mGiven;
            aobj[2] = mMiddle;
            aobj[3] = mPrefix;
            aobj[4] = mSuffix;
            return String.format("family: %s, given: %s, middle: %s, prefix: %s, suffix: %s", aobj);
        }



/*
        static String access$1002(NameData namedata, String s)
        {
            namedata.mMiddle = s;
            return s;
        }

*/



/*
        static String access$1102(NameData namedata, String s)
        {
            namedata.mGiven = s;
            return s;
        }

*/



/*
        static String access$1202(NameData namedata, String s)
        {
            namedata.mFamily = s;
            return s;
        }

*/



/*
        static String access$1302(NameData namedata, String s)
        {
            namedata.mFormatted = s;
            return s;
        }

*/


/*
        static String access$1402(NameData namedata, String s)
        {
            namedata.mSortString = s;
            return s;
        }

*/



/*
        static String access$502(NameData namedata, String s)
        {
            namedata.mPhoneticFamily = s;
            return s;
        }

*/



/*
        static String access$602(NameData namedata, String s)
        {
            namedata.mPhoneticMiddle = s;
            return s;
        }

*/



/*
        static String access$702(NameData namedata, String s)
        {
            namedata.mPhoneticGiven = s;
            return s;
        }

*/



/*
        static String access$802(NameData namedata, String s)
        {
            namedata.mSuffix = s;
            return s;
        }

*/



/*
        static String access$902(NameData namedata, String s)
        {
            namedata.mPrefix = s;
            return s;
        }

*/

    }

    public static class NicknameData
        implements EntryElement
    {

        private final String mNickname;

        public void constructInsertOperation(List list, int i)
        {
            android.content.ContentProviderOperation.Builder builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
            builder.withValueBackReference("raw_contact_id", i);
            builder.withValue("mimetype", "vnd.android.cursor.item/nickname");
            builder.withValue("data2", Integer.valueOf(1));
            builder.withValue("data1", mNickname);
            list.add(builder.build());
        }

        public boolean equals(Object obj)
        {
            if (!(obj instanceof NicknameData))
            {
                return false;
            } else
            {
                NicknameData nicknamedata = (NicknameData)obj;
                return TextUtils.equals(mNickname, nicknamedata.mNickname);
            }
        }

        public EntryLabel getEntryLabel()
        {
            return EntryLabel.NICKNAME;
        }

        public String getNickname()
        {
            return mNickname;
        }

        public int hashCode()
        {
            if (mNickname != null)
                return mNickname.hashCode();
            else
                return 0;
        }

        public boolean isEmpty()
        {
            return TextUtils.isEmpty(mNickname);
        }

        public String toString()
        {
            return (new StringBuilder()).append("nickname: ").append(mNickname).toString();
        }

        public NicknameData(String s)
        {
            mNickname = s;
        }
    }

    public static class NoteData
        implements EntryElement
    {

        public final String mNote;

        public void constructInsertOperation(List list, int i)
        {
            android.content.ContentProviderOperation.Builder builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
            builder.withValueBackReference("raw_contact_id", i);
            builder.withValue("mimetype", "vnd.android.cursor.item/note");
            builder.withValue("data1", mNote);
            list.add(builder.build());
        }

        public boolean equals(Object obj)
        {
            if (this == obj)
                return true;
            if (!(obj instanceof NoteData))
            {
                return false;
            } else
            {
                NoteData notedata = (NoteData)obj;
                return TextUtils.equals(mNote, notedata.mNote);
            }
        }

        public EntryLabel getEntryLabel()
        {
            return EntryLabel.NOTE;
        }

        public String getNote()
        {
            return mNote;
        }

        public int hashCode()
        {
            if (mNote != null)
                return mNote.hashCode();
            else
                return 0;
        }

        public boolean isEmpty()
        {
            return TextUtils.isEmpty(mNote);
        }

        public String toString()
        {
            return (new StringBuilder()).append("note: ").append(mNote).toString();
        }

        public NoteData(String s)
        {
            mNote = s;
        }
    }

    public static class OrganizationData
        implements EntryElement
    {

        private String mDepartmentName;
        private boolean mIsPrimary;
        private String mOrganizationName;
        private final String mPhoneticName;
        private String mTitle;
        private final int mType;

        public void constructInsertOperation(List list, int i)
        {
            android.content.ContentProviderOperation.Builder builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
            builder.withValueBackReference("raw_contact_id", i);
            builder.withValue("mimetype", "vnd.android.cursor.item/organization");
            builder.withValue("data2", Integer.valueOf(mType));
            if (mOrganizationName != null)
                builder.withValue("data1", mOrganizationName);
            if (mDepartmentName != null)
                builder.withValue("data5", mDepartmentName);
            if (mTitle != null)
                builder.withValue("data4", mTitle);
            if (mPhoneticName != null)
                builder.withValue("data8", mPhoneticName);
            if (mIsPrimary)
                builder.withValue("is_primary", Integer.valueOf(1));
            list.add(builder.build());
        }

        public boolean equals(Object obj)
        {
            if (this != obj)
            {
                if (!(obj instanceof OrganizationData))
                    return false;
                OrganizationData organizationdata = (OrganizationData)obj;
                if (mType != organizationdata.mType || !TextUtils.equals(mOrganizationName, organizationdata.mOrganizationName) || !TextUtils.equals(mDepartmentName, organizationdata.mDepartmentName) || !TextUtils.equals(mTitle, organizationdata.mTitle) || mIsPrimary != organizationdata.mIsPrimary)
                    return false;
            }
            return true;
        }

        public String getDepartmentName()
        {
            return mDepartmentName;
        }

        public final EntryLabel getEntryLabel()
        {
            return EntryLabel.ORGANIZATION;
        }

        public String getFormattedString()
        {
            StringBuilder stringbuilder = new StringBuilder();
            if (!TextUtils.isEmpty(mOrganizationName))
                stringbuilder.append(mOrganizationName);
            if (!TextUtils.isEmpty(mDepartmentName))
            {
                if (stringbuilder.length() > 0)
                    stringbuilder.append(", ");
                stringbuilder.append(mDepartmentName);
            }
            if (!TextUtils.isEmpty(mTitle))
            {
                if (stringbuilder.length() > 0)
                    stringbuilder.append(", ");
                stringbuilder.append(mTitle);
            }
            return stringbuilder.toString();
        }

        public String getOrganizationName()
        {
            return mOrganizationName;
        }

        public String getPhoneticName()
        {
            return mPhoneticName;
        }

        public String getTitle()
        {
            return mTitle;
        }

        public int getType()
        {
            return mType;
        }

        public int hashCode()
        {
            int i = 31 * mType;
            int j;
            if (mOrganizationName != null)
                j = mOrganizationName.hashCode();
            else
                j = 0;
            int k = 31 * (i + j);
            int l;
            if (mDepartmentName != null)
                l = mDepartmentName.hashCode();
            else
                l = 0;
            int i1 = 31 * (k + l);
            String s = mTitle;
            int j1 = 0;
            if (s != null)
                j1 = mTitle.hashCode();
            int k1 = 31 * (i1 + j1);
            char c;
            if (mIsPrimary)
                c = '\u04CF';
            else
                c = '\u04D5';
            return k1 + c;
        }

        public boolean isEmpty()
        {
            return TextUtils.isEmpty(mOrganizationName) && TextUtils.isEmpty(mDepartmentName) && TextUtils.isEmpty(mTitle) && TextUtils.isEmpty(mPhoneticName);
        }

        public boolean isPrimary()
        {
            return mIsPrimary;
        }

        public String toString()
        {
            Object aobj[] = new Object[5];
            aobj[0] = Integer.valueOf(mType);
            aobj[1] = mOrganizationName;
            aobj[2] = mDepartmentName;
            aobj[3] = mTitle;
            aobj[4] = Boolean.valueOf(mIsPrimary);
            return String.format("type: %d, organization: %s, department: %s, title: %s, isPrimary: %s", aobj);
        }



/*
        static String access$102(OrganizationData organizationdata, String s)
        {
            organizationdata.mOrganizationName = s;
            return s;
        }

*/



/*
        static String access$202(OrganizationData organizationdata, String s)
        {
            organizationdata.mDepartmentName = s;
            return s;
        }

*/


/*
        static boolean access$302(OrganizationData organizationdata, boolean flag)
        {
            organizationdata.mIsPrimary = flag;
            return flag;
        }

*/



/*
        static String access$402(OrganizationData organizationdata, String s)
        {
            organizationdata.mTitle = s;
            return s;
        }

*/

        public OrganizationData(String s, String s1, String s2, String s3, int i, boolean flag)
        {
            mType = i;
            mOrganizationName = s;
            mDepartmentName = s1;
            mTitle = s2;
            mPhoneticName = s3;
            mIsPrimary = flag;
        }
    }

    public static class PhoneData
        implements EntryElement
    {

        private boolean mIsPrimary;
        private final String mLabel;
        private final String mNumber;
        private final int mType;

        public void constructInsertOperation(List list, int i)
        {
            android.content.ContentProviderOperation.Builder builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
            builder.withValueBackReference("raw_contact_id", i);
            builder.withValue("mimetype", "vnd.android.cursor.item/phone_v2");
            builder.withValue("data2", Integer.valueOf(mType));
            if (mType == 0)
                builder.withValue("data3", mLabel);
            builder.withValue("data1", mNumber);
            if (mIsPrimary)
                builder.withValue("is_primary", Integer.valueOf(1));
            list.add(builder.build());
        }

        public boolean equals(Object obj)
        {
            if (this != obj)
            {
                if (!(obj instanceof PhoneData))
                    return false;
                PhoneData phonedata = (PhoneData)obj;
                if (mType != phonedata.mType || !TextUtils.equals(mNumber, phonedata.mNumber) || !TextUtils.equals(mLabel, phonedata.mLabel) || mIsPrimary != phonedata.mIsPrimary)
                    return false;
            }
            return true;
        }

        public final EntryLabel getEntryLabel()
        {
            return EntryLabel.PHONE;
        }

        public String getLabel()
        {
            return mLabel;
        }

        public String getNumber()
        {
            return mNumber;
        }

        public int getType()
        {
            return mType;
        }

        public int hashCode()
        {
            int i = 31 * mType;
            int j;
            if (mNumber != null)
                j = mNumber.hashCode();
            else
                j = 0;
            int k = 31 * (i + j);
            String s = mLabel;
            int l = 0;
            if (s != null)
                l = mLabel.hashCode();
            int i1 = 31 * (k + l);
            char c;
            if (mIsPrimary)
                c = '\u04CF';
            else
                c = '\u04D5';
            return i1 + c;
        }

        public boolean isEmpty()
        {
            return TextUtils.isEmpty(mNumber);
        }

        public boolean isPrimary()
        {
            return mIsPrimary;
        }

        public String toString()
        {
            Object aobj[] = new Object[4];
            aobj[0] = Integer.valueOf(mType);
            aobj[1] = mNumber;
            aobj[2] = mLabel;
            aobj[3] = Boolean.valueOf(mIsPrimary);
            return String.format("type: %d, data: %s, label: %s, isPrimary: %s", aobj);
        }


        public PhoneData(String s, int i, String s1, boolean flag)
        {
            mNumber = s;
            mType = i;
            mLabel = s1;
            mIsPrimary = flag;
        }
    }

    public static class PhotoData
        implements EntryElement
    {

        private final byte mBytes[];
        private final String mFormat;
        private Integer mHashCode;
        private final boolean mIsPrimary;

        public void constructInsertOperation(List list, int i)
        {
            android.content.ContentProviderOperation.Builder builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
            builder.withValueBackReference("raw_contact_id", i);
            builder.withValue("mimetype", "vnd.android.cursor.item/photo");
            builder.withValue("data15", mBytes);
            if (mIsPrimary)
                builder.withValue("is_primary", Integer.valueOf(1));
            list.add(builder.build());
        }

        public boolean equals(Object obj)
        {
            if (this != obj)
            {
                if (!(obj instanceof PhotoData))
                    return false;
                PhotoData photodata = (PhotoData)obj;
                if (!TextUtils.equals(mFormat, photodata.mFormat) || !Arrays.equals(mBytes, photodata.mBytes) || mIsPrimary != photodata.mIsPrimary)
                    return false;
            }
            return true;
        }

        public byte[] getBytes()
        {
            return mBytes;
        }

        public final EntryLabel getEntryLabel()
        {
            return EntryLabel.PHOTO;
        }

        public String getFormat()
        {
            return mFormat;
        }

        public int hashCode()
        {
            if (mHashCode != null)
                return mHashCode.intValue();
            int i;
            if (mFormat != null)
                i = mFormat.hashCode();
            else
                i = 0;
            int j = i * 31;
            if (mBytes != null)
            {
                byte abyte0[] = mBytes;
                int i1 = abyte0.length;
                for (int j1 = 0; j1 < i1; j1++)
                    j += abyte0[j1];

            }
            int k = j * 31;
            char c;
            if (mIsPrimary)
                c = '\u04CF';
            else
                c = '\u04D5';
            int l = k + c;
            mHashCode = Integer.valueOf(l);
            return l;
        }

        public boolean isEmpty()
        {
            return mBytes == null || mBytes.length == 0;
        }

        public boolean isPrimary()
        {
            return mIsPrimary;
        }

        public String toString()
        {
            Object aobj[] = new Object[3];
            aobj[0] = mFormat;
            aobj[1] = Integer.valueOf(mBytes.length);
            aobj[2] = Boolean.valueOf(mIsPrimary);
            return String.format("format: %s: size: %d, isPrimary: %s", aobj);
        }

        public PhotoData(String s, byte abyte0[], boolean flag)
        {
            mHashCode = null;
            mFormat = s;
            mBytes = abyte0;
            mIsPrimary = flag;
        }
    }

    public static class PostalData
        implements EntryElement
    {

        private static final int ADDR_MAX_DATA_SIZE = 7;
        private final String mCountry;
        private final String mExtendedAddress;
        private boolean mIsPrimary;
        private final String mLabel;
        private final String mLocalty;
        private final String mPobox;
        private final String mPostalCode;
        private final String mRegion;
        private final String mStreet;
        private final int mType;
        private int mVCardType;

        public static PostalData constructPostalData(List list, int i, String s, boolean flag, int j)
        {
            String as[];
            int k;
            int l;
            Iterator iterator;
            as = new String[7];
            k = list.size();
            if (k > 7)
                k = 7;
            l = 0;
            iterator = list.iterator();
_L4:
            if (!iterator.hasNext()) goto _L2; else goto _L1
_L1:
            as[l] = (String)iterator.next();
            if (++l < k) goto _L4; else goto _L3
_L2:
            i1 = l;
_L3:
            int j1;
            for (int i1 = l; i1 < 7; i1 = j1)
            {
                j1 = i1 + 1;
                as[i1] = null;
            }

            return new PostalData(as[0], as[1], as[2], as[3], as[4], as[5], as[6], i, s, flag, j);
        }

        public void constructInsertOperation(List list, int i)
        {
            android.content.ContentProviderOperation.Builder builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
            builder.withValueBackReference("raw_contact_id", i);
            builder.withValue("mimetype", "vnd.android.cursor.item/postal-address_v2");
            builder.withValue("data2", Integer.valueOf(mType));
            if (mType == 0)
                builder.withValue("data3", mLabel);
            builder.withValue("data5", mPobox);
            builder.withValue("data6", mExtendedAddress);
            builder.withValue("data4", mStreet);
            builder.withValue("data7", mLocalty);
            builder.withValue("data8", mRegion);
            builder.withValue("data9", mPostalCode);
            builder.withValue("data10", mCountry);
            if (mIsPrimary)
                builder.withValue("is_primary", Integer.valueOf(1));
            list.add(builder.build());
        }

        public boolean equals(Object obj)
        {
            if (this != obj)
            {
                if (!(obj instanceof PostalData))
                    return false;
                PostalData postaldata = (PostalData)obj;
                if (mType != postaldata.mType || mType == 0 && !TextUtils.equals(mLabel, postaldata.mLabel) || mIsPrimary != postaldata.mIsPrimary || !TextUtils.equals(mPobox, postaldata.mPobox) || !TextUtils.equals(mExtendedAddress, postaldata.mExtendedAddress) || !TextUtils.equals(mStreet, postaldata.mStreet) || !TextUtils.equals(mLocalty, postaldata.mLocalty) || !TextUtils.equals(mRegion, postaldata.mRegion) || !TextUtils.equals(mPostalCode, postaldata.mPostalCode) || !TextUtils.equals(mCountry, postaldata.mCountry))
                    return false;
            }
            return true;
        }

        public String getCountry()
        {
            return mCountry;
        }

        public final EntryLabel getEntryLabel()
        {
            return EntryLabel.POSTAL_ADDRESS;
        }

        public String getExtendedAddress()
        {
            return mExtendedAddress;
        }

        public String getFormattedAddress(int i)
        {
            StringBuilder stringbuilder = new StringBuilder();
            boolean flag = true;
            String as[] = new String[7];
            as[0] = mPobox;
            as[1] = mExtendedAddress;
            as[2] = mStreet;
            as[3] = mLocalty;
            as[4] = mRegion;
            as[5] = mPostalCode;
            as[6] = mCountry;
            if (VCardConfig.isJapaneseDevice(i))
            {
                for (int k = 6; k >= 0; k--)
                {
                    String s1 = as[k];
                    if (!TextUtils.isEmpty(s1))
                    {
                        if (!flag)
                            stringbuilder.append(' ');
                        else
                            flag = false;
                        stringbuilder.append(s1);
                    }
                }

            } else
            {
                for (int j = 0; j < 7; j++)
                {
                    String s = as[j];
                    if (TextUtils.isEmpty(s))
                        continue;
                    if (!flag)
                        stringbuilder.append(' ');
                    else
                        flag = false;
                    stringbuilder.append(s);
                }

            }
            return stringbuilder.toString().trim();
        }

        public String getLabel()
        {
            return mLabel;
        }

        public String getLocalty()
        {
            return mLocalty;
        }

        public String getPobox()
        {
            return mPobox;
        }

        public String getPostalCode()
        {
            return mPostalCode;
        }

        public String getRegion()
        {
            return mRegion;
        }

        public String getStreet()
        {
            return mStreet;
        }

        public int getType()
        {
            return mType;
        }

        public int hashCode()
        {
            int i = 31 * mType;
            int j;
            if (mLabel != null)
                j = mLabel.hashCode();
            else
                j = 0;
            int k = 31 * (i + j);
            char c;
            if (mIsPrimary)
                c = '\u04CF';
            else
                c = '\u04D5';
            int l = k + c;
            String as[] = new String[7];
            as[0] = mPobox;
            as[1] = mExtendedAddress;
            as[2] = mStreet;
            as[3] = mLocalty;
            as[4] = mRegion;
            as[5] = mPostalCode;
            as[6] = mCountry;
            int i1 = as.length;
            for (int j1 = 0; j1 < i1; j1++)
            {
                String s = as[j1];
                int k1 = l * 31;
                int l1;
                if (s != null)
                    l1 = s.hashCode();
                else
                    l1 = 0;
                l = k1 + l1;
            }

            return l;
        }

        public boolean isEmpty()
        {
            return TextUtils.isEmpty(mPobox) && TextUtils.isEmpty(mExtendedAddress) && TextUtils.isEmpty(mStreet) && TextUtils.isEmpty(mLocalty) && TextUtils.isEmpty(mRegion) && TextUtils.isEmpty(mPostalCode) && TextUtils.isEmpty(mCountry);
        }

        public boolean isPrimary()
        {
            return mIsPrimary;
        }

        public String toString()
        {
            Object aobj[] = new Object[10];
            aobj[0] = Integer.valueOf(mType);
            aobj[1] = mLabel;
            aobj[2] = Boolean.valueOf(mIsPrimary);
            aobj[3] = mPobox;
            aobj[4] = mExtendedAddress;
            aobj[5] = mStreet;
            aobj[6] = mLocalty;
            aobj[7] = mRegion;
            aobj[8] = mPostalCode;
            aobj[9] = mCountry;
            return String.format("type: %d, label: %s, isPrimary: %s, pobox: %s, extendedAddress: %s, street: %s, localty: %s, region: %s, postalCode %s, country: %s", aobj);
        }

        public PostalData(String s, String s1, String s2, String s3, String s4, String s5, String s6, 
                int i, String s7, boolean flag, int j)
        {
            mType = i;
            mPobox = s;
            mExtendedAddress = s1;
            mStreet = s2;
            mLocalty = s3;
            mRegion = s4;
            mPostalCode = s5;
            mCountry = s6;
            mLabel = s7;
            mIsPrimary = flag;
            mVCardType = j;
        }
    }

    public static class SipData
        implements EntryElement
    {

        private final String mAddress;
        private final boolean mIsPrimary;
        private final String mLabel;
        private final int mType;

        public void constructInsertOperation(List list, int i)
        {
            android.content.ContentProviderOperation.Builder builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
            builder.withValueBackReference("raw_contact_id", i);
            builder.withValue("mimetype", "vnd.android.cursor.item/sip_address");
            builder.withValue("data1", mAddress);
            builder.withValue("data2", Integer.valueOf(mType));
            if (mType == 0)
                builder.withValue("data3", mLabel);
            if (mIsPrimary)
                builder.withValue("is_primary", Boolean.valueOf(mIsPrimary));
            list.add(builder.build());
        }

        public boolean equals(Object obj)
        {
            if (this != obj)
            {
                if (!(obj instanceof SipData))
                    return false;
                SipData sipdata = (SipData)obj;
                if (mType != sipdata.mType || !TextUtils.equals(mLabel, sipdata.mLabel) || !TextUtils.equals(mAddress, sipdata.mAddress) || mIsPrimary != sipdata.mIsPrimary)
                    return false;
            }
            return true;
        }

        public String getAddress()
        {
            return mAddress;
        }

        public EntryLabel getEntryLabel()
        {
            return EntryLabel.SIP;
        }

        public String getLabel()
        {
            return mLabel;
        }

        public int getType()
        {
            return mType;
        }

        public int hashCode()
        {
            int i = 31 * mType;
            int j;
            if (mLabel != null)
                j = mLabel.hashCode();
            else
                j = 0;
            int k = 31 * (i + j);
            String s = mAddress;
            int l = 0;
            if (s != null)
                l = mAddress.hashCode();
            int i1 = 31 * (k + l);
            char c;
            if (mIsPrimary)
                c = '\u04CF';
            else
                c = '\u04D5';
            return i1 + c;
        }

        public boolean isEmpty()
        {
            return TextUtils.isEmpty(mAddress);
        }

        public String toString()
        {
            return (new StringBuilder()).append("sip: ").append(mAddress).toString();
        }

        public SipData(String s, int i, String s1, boolean flag)
        {
            if (s.startsWith("sip:"))
                mAddress = s.substring(4);
            else
                mAddress = s;
            mType = i;
            mLabel = s1;
            mIsPrimary = flag;
        }
    }

    private class ToStringIterator
        implements EntryElementIterator
    {

        private StringBuilder mBuilder;
        private boolean mFirstElement;
        final VCardEntry this$0;

        public boolean onElement(EntryElement entryelement)
        {
            if (!mFirstElement)
            {
                mBuilder.append(", ");
                mFirstElement = false;
            }
            mBuilder.append("[").append(entryelement.toString()).append("]");
            return true;
        }

        public void onElementGroupEnded()
        {
            mBuilder.append("\n");
        }

        public void onElementGroupStarted(EntryLabel entrylabel)
        {
            mBuilder.append((new StringBuilder()).append(entrylabel.toString()).append(": ").toString());
            mFirstElement = true;
        }

        public void onIterationEnded()
        {
            mBuilder.append("]]\n");
        }

        public void onIterationStarted()
        {
            mBuilder = new StringBuilder();
            mBuilder.append((new StringBuilder()).append("[[hash: ").append(hashCode()).append("\n").toString());
        }

        public String toString()
        {
            return mBuilder.toString();
        }

        private ToStringIterator()
        {
            this$0 = VCardEntry.this;
            super();
        }

    }

    public static class WebsiteData
        implements EntryElement
    {

        private final String mWebsite;

        public void constructInsertOperation(List list, int i)
        {
            android.content.ContentProviderOperation.Builder builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
            builder.withValueBackReference("raw_contact_id", i);
            builder.withValue("mimetype", "vnd.android.cursor.item/website");
            builder.withValue("data1", mWebsite);
            builder.withValue("data2", Integer.valueOf(1));
            list.add(builder.build());
        }

        public boolean equals(Object obj)
        {
            if (this == obj)
                return true;
            if (!(obj instanceof WebsiteData))
            {
                return false;
            } else
            {
                WebsiteData websitedata = (WebsiteData)obj;
                return TextUtils.equals(mWebsite, websitedata.mWebsite);
            }
        }

        public EntryLabel getEntryLabel()
        {
            return EntryLabel.WEBSITE;
        }

        public String getWebsite()
        {
            return mWebsite;
        }

        public int hashCode()
        {
            if (mWebsite != null)
                return mWebsite.hashCode();
            else
                return 0;
        }

        public boolean isEmpty()
        {
            return TextUtils.isEmpty(mWebsite);
        }

        public String toString()
        {
            return (new StringBuilder()).append("website: ").append(mWebsite).toString();
        }

        public WebsiteData(String s)
        {
            mWebsite = s;
        }
    }


    private static final int DEFAULT_ORGANIZATION_TYPE = 1;
    private static final String LOG_TAG = "vCard";
    private static final List sEmptyList = Collections.unmodifiableList(new ArrayList(0));
    private static final Map sImMap;
    private final Account mAccount;
    private List mAndroidCustomDataList;
    private AnniversaryData mAnniversary;
    private BirthdayData mBirthday;
    private List mChildren;
    private List mEmailList;
    private List mImList;
    private final NameData mNameData;
    private List mNicknameList;
    private List mNoteList;
    private List mOrganizationList;
    private List mPhoneList;
    private List mPhotoList;
    private List mPostalList;
    private List mSipList;
    private final int mVCardType;
    private List mWebsiteList;

    public VCardEntry()
    {
        this(0xc0000000);
    }

    public VCardEntry(int i)
    {
        this(i, null);
    }

    public VCardEntry(int i, Account account)
    {
        mNameData = new NameData();
        mVCardType = i;
        mAccount = account;
    }

    private void addEmail(int i, String s, String s1, boolean flag)
    {
        if (mEmailList == null)
            mEmailList = new ArrayList();
        mEmailList.add(new EmailData(s, i, s1, flag));
    }

    private void addIm(int i, String s, String s1, int j, boolean flag)
    {
        if (mImList == null)
            mImList = new ArrayList();
        mImList.add(new ImData(i, s, s1, j, flag));
    }

    private void addNewOrganization(String s, String s1, String s2, String s3, int i, boolean flag)
    {
        if (mOrganizationList == null)
            mOrganizationList = new ArrayList();
        mOrganizationList.add(new OrganizationData(s, s1, s2, s3, i, flag));
    }

    private void addNickName(String s)
    {
        if (mNicknameList == null)
            mNicknameList = new ArrayList();
        mNicknameList.add(new NicknameData(s));
    }

    private void addNote(String s)
    {
        if (mNoteList == null)
            mNoteList = new ArrayList(1);
        mNoteList.add(new NoteData(s));
    }

    private void addPhone(int i, String s, String s1, boolean flag)
    {
        if (mPhoneList == null)
            mPhoneList = new ArrayList();
        StringBuilder stringbuilder = new StringBuilder();
        String s2 = s.trim();
        String s3;
        if (i != 6 && !VCardConfig.refrainPhoneNumberFormatting(mVCardType))
        {
            boolean flag1 = false;
            int j = s2.length();
            for (int k = 0; k < j; k++)
            {
                char c = s2.charAt(k);
                if (c != 'p' && c != 'P')
                {
                    if (c != 'w' && c != 'W')
                    {
                        if ('0' <= c && c <= '9' || k == 0 && c == '+' || c == ' ' || c == ';' || c == ',')
                            stringbuilder.append(c);
                    } else
                    {
                        stringbuilder.append(c);
                        flag1 = true;
                    }
                } else
                {
                    stringbuilder.append(c);
                    flag1 = true;
                }
            }

            if (!flag1)
            {
                VCardUtils.getPhoneNumberFormat(mVCardType);
                s3 = VCardUtils.PhoneNumberUtilsPort.formatNumber(stringbuilder.toString(), 0);
            } else
            {
                s3 = stringbuilder.toString();
            }
        } else
        {
            s3 = s2;
        }
        PhoneData phonedata = new PhoneData(s3, i, s1, flag);
        mPhoneList.add(phonedata);
    }

    private void addPhotoBytes(String s, byte abyte0[], boolean flag)
    {
        if (mPhotoList == null)
            mPhotoList = new ArrayList(1);
        PhotoData photodata = new PhotoData(s, abyte0, flag);
        mPhotoList.add(photodata);
    }

    private void addPostal(int i, List list, String s, boolean flag)
    {
        if (mPostalList == null)
            mPostalList = new ArrayList(0);
        mPostalList.add(PostalData.constructPostalData(list, i, s, flag, mVCardType));
    }

    private void addSip(String s, int i, String s1, boolean flag)
    {
        if (mSipList == null)
            mSipList = new ArrayList();
        mSipList.add(new SipData(s, i, s1, flag));
    }

    public static VCardEntry buildFromResolver(ContentResolver contentresolver)
    {
        return buildFromResolver(contentresolver, android.provider.ContactsContract.Contacts.CONTENT_URI);
    }

    public static VCardEntry buildFromResolver(ContentResolver contentresolver, Uri uri)
    {
        return null;
    }

    private String buildSinglePhoneticNameFromSortAsParam(Map map)
    {
        Collection collection = (Collection)map.get("SORT-AS");
        if (collection != null && collection.size() != 0)
        {
            if (collection.size() > 1)
                Log.w("vCard", (new StringBuilder()).append("Incorrect multiple SORT_AS parameters detected: ").append(Arrays.toString(collection.toArray())).toString());
            List list = VCardUtils.constructListFromValue((String)collection.iterator().next(), mVCardType);
            StringBuilder stringbuilder = new StringBuilder();
            for (Iterator iterator = list.iterator(); iterator.hasNext(); stringbuilder.append((String)iterator.next()));
            return stringbuilder.toString();
        } else
        {
            return null;
        }
    }

    private String constructDisplayName()
    {
        String s;
        if (!TextUtils.isEmpty(mNameData.mFormatted))
            s = mNameData.mFormatted;
        else
        if (!mNameData.emptyStructuredName())
            s = VCardUtils.constructNameFromElements(mVCardType, mNameData.mFamily, mNameData.mMiddle, mNameData.mGiven, mNameData.mPrefix, mNameData.mSuffix);
        else
        if (!mNameData.emptyPhoneticStructuredName())
            s = VCardUtils.constructNameFromElements(mVCardType, mNameData.mPhoneticFamily, mNameData.mPhoneticMiddle, mNameData.mPhoneticGiven);
        else
        if (mEmailList != null && mEmailList.size() > 0)
            s = ((EmailData)mEmailList.get(0)).mAddress;
        else
        if (mPhoneList != null && mPhoneList.size() > 0)
            s = ((PhoneData)mPhoneList.get(0)).mNumber;
        else
        if (mPostalList != null && mPostalList.size() > 0)
        {
            s = ((PostalData)mPostalList.get(0)).getFormattedAddress(mVCardType);
        } else
        {
            List list = mOrganizationList;
            s = null;
            if (list != null)
            {
                int i = mOrganizationList.size();
                s = null;
                if (i > 0)
                    s = ((OrganizationData)mOrganizationList.get(0)).getFormattedString();
            }
        }
        if (s == null)
            s = "";
        return s;
    }

    private void handleAndroidCustomProperty(List list)
    {
        if (mAndroidCustomDataList == null)
            mAndroidCustomDataList = new ArrayList();
        mAndroidCustomDataList.add(AndroidCustomData.constructAndroidCustomData(list));
    }

    private void handleNProperty(List list, Map map)
    {
        tryHandleSortAsName(map);
        if (list != null)
        {
            int i = list.size();
            if (i >= 1)
            {
                if (i > 5)
                    i = 5;
                switch (i)
                {
                case 5: // '\005'
                    mNameData.mSuffix = (String)list.get(4);
                    // fall through

                case 4: // '\004'
                    mNameData.mPrefix = (String)list.get(3);
                    // fall through

                case 3: // '\003'
                    mNameData.mMiddle = (String)list.get(2);
                    // fall through

                case 2: // '\002'
                    mNameData.mGiven = (String)list.get(1);
                    // fall through

                default:
                    mNameData.mFamily = (String)list.get(0);
                    break;
                }
                return;
            }
        }
    }

    private void handleOrgValue(int i, List list, Map map, boolean flag)
    {
        String s = buildSinglePhoneticNameFromSortAsParam(map);
        if (list == null)
            list = sEmptyList;
        int j = list.size();
        String s1;
        String s2;
        switch (j)
        {
        case 1: // '\001'
            s1 = (String)list.get(0);
            s2 = null;
            break;

        case 0: // '\0'
            s1 = "";
            s2 = null;
            break;

        default:
            s1 = (String)list.get(0);
            StringBuilder stringbuilder = new StringBuilder();
            for (int k = 1; k < j; k++)
            {
                if (k > 1)
                    stringbuilder.append(' ');
                stringbuilder.append((String)list.get(k));
            }

            s2 = stringbuilder.toString();
            break;
        }
        if (mOrganizationList == null)
        {
            addNewOrganization(s1, s2, null, s, i, flag);
            return;
        }
        for (Iterator iterator = mOrganizationList.iterator(); iterator.hasNext();)
        {
            OrganizationData organizationdata = (OrganizationData)iterator.next();
            if (organizationdata.mOrganizationName == null && organizationdata.mDepartmentName == null)
            {
                organizationdata.mOrganizationName = s1;
                organizationdata.mDepartmentName = s2;
                organizationdata.mIsPrimary = flag;
                return;
            }
        }

        addNewOrganization(s1, s2, null, s, i, flag);
    }

    private void handlePhoneticNameFromSound(List list)
    {
        if (!TextUtils.isEmpty(mNameData.mPhoneticFamily) || !TextUtils.isEmpty(mNameData.mPhoneticMiddle) || !TextUtils.isEmpty(mNameData.mPhoneticGiven) || list == null) goto _L2; else goto _L1
_L1:
        int i = list.size();
        if (i < 1) goto _L2; else goto _L3
_L3:
        if (i > 3)
            i = 3;
        if (((String)list.get(0)).length() <= 0) goto _L5; else goto _L4
_L4:
        boolean flag;
        int j;
        flag = true;
        j = 1;
_L10:
        if (j >= i) goto _L7; else goto _L6
_L6:
        if (((String)list.get(j)).length() <= 0) goto _L9; else goto _L8
_L8:
        flag = false;
_L7:
        if (flag)
        {
            String as[] = ((String)list.get(0)).split(" ");
            int k = as.length;
            if (k == 3)
            {
                mNameData.mPhoneticFamily = as[0];
                mNameData.mPhoneticMiddle = as[1];
                mNameData.mPhoneticGiven = as[2];
                return;
            }
            if (k == 2)
            {
                mNameData.mPhoneticFamily = as[0];
                mNameData.mPhoneticGiven = as[1];
                return;
            } else
            {
                mNameData.mPhoneticGiven = (String)list.get(0);
                return;
            }
        }
_L5:
        switch (i)
        {
        case 3: // '\003'
            mNameData.mPhoneticMiddle = (String)list.get(2);
            // fall through

        case 2: // '\002'
            mNameData.mPhoneticGiven = (String)list.get(1);
            // fall through

        default:
            mNameData.mPhoneticFamily = (String)list.get(0);
            break;
        }
        return;
_L9:
        j++;
        if (true) goto _L10; else goto _L2
_L2:
    }

    private void handleSipCase(String s, Collection collection)
    {
label0:
        {
            if (TextUtils.isEmpty(s))
                break label0;
            if (s.startsWith("sip:"))
            {
                s = s.substring(4);
                if (s.length() == 0)
                    break label0;
            }
            byte byte0 = -1;
            boolean flag = false;
            String s1 = null;
            if (collection != null)
            {
                Iterator iterator = collection.iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    String s2 = (String)iterator.next();
                    String s3 = s2.toUpperCase();
                    if (s3.equals("PREF"))
                        flag = true;
                    else
                    if (s3.equals("HOME"))
                        byte0 = 1;
                    else
                    if (s3.equals("WORK"))
                        byte0 = 2;
                    else
                    if (byte0 < 0)
                    {
                        if (s3.startsWith("X-"))
                            s1 = s2.substring(2);
                        else
                            s1 = s2;
                        byte0 = 0;
                    }
                } while (true);
            }
            if (byte0 < 0)
                byte0 = 3;
            addSip(s, byte0, s1, flag);
            return;
        }
    }

    private void handleTitleValue(String s)
    {
        if (mOrganizationList == null)
        {
            addNewOrganization(null, null, s, null, 1, false);
            return;
        }
        for (Iterator iterator = mOrganizationList.iterator(); iterator.hasNext();)
        {
            OrganizationData organizationdata = (OrganizationData)iterator.next();
            if (organizationdata.mTitle == null)
            {
                organizationdata.mTitle = s;
                return;
            }
        }

        addNewOrganization(null, null, s, null, 1, false);
    }

    private void iterateOneList(List list, EntryElementIterator entryelementiterator)
    {
        if (list != null && list.size() > 0)
        {
            entryelementiterator.onElementGroupStarted(((EntryElement)list.get(0)).getEntryLabel());
            for (Iterator iterator = list.iterator(); iterator.hasNext(); entryelementiterator.onElement((EntryElement)iterator.next()));
            entryelementiterator.onElementGroupEnded();
        }
    }

    private String listToString(List list)
    {
        int i = list.size();
        if (i > 1)
        {
            StringBuilder stringbuilder = new StringBuilder();
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                stringbuilder.append((String)iterator.next());
                if (i - 1 < 0)
                    stringbuilder.append(";");
            } while (true);
            return stringbuilder.toString();
        }
        if (i == 1)
            return (String)list.get(0);
        else
            return "";
    }

    private void tryHandleSortAsName(Map map)
    {
        if (!VCardConfig.isVersion30(mVCardType) || TextUtils.isEmpty(mNameData.mPhoneticFamily) && TextUtils.isEmpty(mNameData.mPhoneticMiddle) && TextUtils.isEmpty(mNameData.mPhoneticGiven))
        {
            Collection collection = (Collection)map.get("SORT-AS");
            if (collection != null && collection.size() != 0)
            {
                if (collection.size() > 1)
                    Log.w("vCard", (new StringBuilder()).append("Incorrect multiple SORT_AS parameters detected: ").append(Arrays.toString(collection.toArray())).toString());
                List list = VCardUtils.constructListFromValue((String)collection.iterator().next(), mVCardType);
                int i = list.size();
                if (i > 3)
                    i = 3;
                switch (i)
                {
                case 3: // '\003'
                    mNameData.mPhoneticMiddle = (String)list.get(2);
                    // fall through

                case 2: // '\002'
                    mNameData.mPhoneticGiven = (String)list.get(1);
                    // fall through

                default:
                    mNameData.mPhoneticFamily = (String)list.get(0);
                    break;
                }
                return;
            }
        }
    }

    public void addChild(VCardEntry vcardentry)
    {
        if (mChildren == null)
            mChildren = new ArrayList();
        mChildren.add(vcardentry);
    }

    public void addProperty(VCardProperty vcardproperty)
    {
        String s1;
label0:
        {
            String s = vcardproperty.getName();
            Map map = vcardproperty.getParameterMap();
            List list = vcardproperty.getValueList();
            byte abyte0[] = vcardproperty.getByteValue();
            if (list != null && list.size() != 0 || abyte0 != null)
            {
                if (list != null)
                    s1 = listToString(list).trim();
                else
                    s1 = null;
                if (!s.equals("VERSION"))
                {
                    if (s.equals("FN"))
                    {
                        mNameData.mFormatted = s1;
                        return;
                    }
                    if (s.equals("NAME"))
                    {
                        if (TextUtils.isEmpty(mNameData.mFormatted))
                        {
                            mNameData.mFormatted = s1;
                            return;
                        }
                    } else
                    {
                        if (s.equals("N"))
                        {
                            handleNProperty(list, map);
                            return;
                        }
                        if (s.equals("SORT-STRING"))
                        {
                            mNameData.mSortString = s1;
                            return;
                        }
                        if (s.equals("NICKNAME") || s.equals("X-NICKNAME"))
                            break label0;
                        if (s.equals("SOUND"))
                        {
                            Collection collection8 = (Collection)map.get("TYPE");
                            if (collection8 != null && collection8.contains("X-IRMC-N"))
                            {
                                handlePhoneticNameFromSound(VCardUtils.constructListFromValue(s1, mVCardType));
                                return;
                            }
                        } else
                        if (s.equals("ADR"))
                        {
                            boolean flag7 = true;
                            Iterator iterator5 = list.iterator();
                            do
                            {
                                if (!iterator5.hasNext())
                                    break;
                                if (TextUtils.isEmpty((String)iterator5.next()))
                                    continue;
                                flag7 = false;
                                break;
                            } while (true);
                            if (!flag7)
                            {
                                byte byte2 = -1;
                                Collection collection7 = (Collection)map.get("TYPE");
                                boolean flag8 = false;
                                String s11 = null;
                                if (collection7 != null)
                                {
                                    Iterator iterator6 = collection7.iterator();
                                    do
                                    {
                                        if (!iterator6.hasNext())
                                            break;
                                        String s12 = (String)iterator6.next();
                                        String s13 = s12.toUpperCase();
                                        if (s13.equals("PREF"))
                                            flag8 = true;
                                        else
                                        if (s13.equals("HOME"))
                                        {
                                            byte2 = 1;
                                            s11 = null;
                                        } else
                                        if (!s13.equals("WORK") && !s13.equalsIgnoreCase("COMPANY"))
                                        {
                                            if (!s13.equals("PARCEL") && !s13.equals("DOM") && !s13.equals("INTL"))
                                                if (s13.equals("OTHER"))
                                                {
                                                    byte2 = 3;
                                                    s11 = null;
                                                } else
                                                if (byte2 < 0)
                                                    if (s13.startsWith("X-"))
                                                    {
                                                        s11 = s12.substring(2);
                                                        byte2 = 0;
                                                    } else
                                                    {
                                                        s11 = s12;
                                                        byte2 = 0;
                                                    }
                                        } else
                                        {
                                            byte2 = 2;
                                            s11 = null;
                                        }
                                    } while (true);
                                }
                                if (byte2 < 0)
                                    byte2 = 1;
                                addPostal(byte2, list, s11, flag8);
                                return;
                            }
                        } else
                        {
                            if (s.equals("EMAIL"))
                            {
                                byte byte1 = -1;
                                Collection collection6 = (Collection)map.get("TYPE");
                                boolean flag6 = false;
                                String s8 = null;
                                if (collection6 != null)
                                {
                                    Iterator iterator4 = collection6.iterator();
                                    do
                                    {
                                        if (!iterator4.hasNext())
                                            break;
                                        String s9 = (String)iterator4.next();
                                        String s10 = s9.toUpperCase();
                                        if (s10.equals("PREF"))
                                            flag6 = true;
                                        else
                                        if (s10.equals("HOME"))
                                            byte1 = 1;
                                        else
                                        if (s10.equals("WORK"))
                                            byte1 = 2;
                                        else
                                        if (s10.equals("CELL"))
                                            byte1 = 4;
                                        else
                                        if (byte1 < 0)
                                        {
                                            if (s10.startsWith("X-"))
                                                s8 = s9.substring(2);
                                            else
                                                s8 = s9;
                                            byte1 = 0;
                                        }
                                    } while (true);
                                }
                                if (byte1 < 0)
                                    byte1 = 3;
                                addEmail(byte1, s1, s8, flag6);
                                return;
                            }
                            if (s.equals("ORG"))
                            {
                                Collection collection5 = (Collection)map.get("TYPE");
                                boolean flag5 = false;
                                if (collection5 != null)
                                {
                                    Iterator iterator3 = collection5.iterator();
                                    do
                                    {
                                        if (!iterator3.hasNext())
                                            break;
                                        if (((String)iterator3.next()).equals("PREF"))
                                            flag5 = true;
                                    } while (true);
                                }
                                handleOrgValue(1, list, map, flag5);
                                return;
                            }
                            if (s.equals("TITLE"))
                            {
                                handleTitleValue(s1);
                                return;
                            }
                            if (!s.equals("ROLE"))
                                if (!s.equals("PHOTO") && !s.equals("LOGO"))
                                {
                                    if (s.equals("TEL"))
                                    {
                                        String s6 = null;
                                        boolean flag3;
                                        if (VCardConfig.isVersion40(mVCardType))
                                        {
                                            if (s1.startsWith("sip:"))
                                                flag3 = true;
                                            else
                                            if (s1.startsWith("tel:"))
                                            {
                                                s6 = s1.substring(4);
                                                flag3 = false;
                                            } else
                                            {
                                                s6 = s1;
                                                flag3 = false;
                                            }
                                        } else
                                        {
                                            s6 = s1;
                                            flag3 = false;
                                        }
                                        if (flag3)
                                        {
                                            handleSipCase(s1, (Collection)map.get("TYPE"));
                                            return;
                                        }
                                        if (s1.length() != 0)
                                        {
                                            Collection collection4 = (Collection)map.get("TYPE");
                                            Object obj = VCardUtils.getPhoneTypeFromStrings(collection4, s6);
                                            String s7;
                                            int k;
                                            if (obj instanceof Integer)
                                            {
                                                k = ((Integer)obj).intValue();
                                                s7 = null;
                                            } else
                                            {
                                                s7 = obj.toString();
                                                k = 0;
                                            }
                                            boolean flag4;
                                            if (collection4 != null && collection4.contains("PREF"))
                                                flag4 = true;
                                            else
                                                flag4 = false;
                                            addPhone(k, s6, s7, flag4);
                                            return;
                                        }
                                    } else
                                    {
                                        if (s.equals("X-SKYPE-PSTNNUMBER"))
                                        {
                                            Collection collection3 = (Collection)map.get("TYPE");
                                            boolean flag2;
                                            if (collection3 != null && collection3.contains("PREF"))
                                                flag2 = true;
                                            else
                                                flag2 = false;
                                            addPhone(7, s1, null, flag2);
                                            return;
                                        }
                                        if (sImMap.containsKey(s))
                                        {
                                            int i = ((Integer)sImMap.get(s)).intValue();
                                            byte byte0 = -1;
                                            Collection collection2 = (Collection)map.get("TYPE");
                                            boolean flag1 = false;
                                            if (collection2 != null)
                                            {
                                                Iterator iterator2 = collection2.iterator();
                                                do
                                                {
                                                    if (!iterator2.hasNext())
                                                        break;
                                                    String s5 = (String)iterator2.next();
                                                    if (s5.equals("PREF"))
                                                        flag1 = true;
                                                    else
                                                    if (byte0 < 0)
                                                        if (s5.equalsIgnoreCase("HOME"))
                                                            byte0 = 1;
                                                        else
                                                        if (s5.equalsIgnoreCase("WORK"))
                                                            byte0 = 2;
                                                } while (true);
                                            }
                                            if (byte0 < 0)
                                                byte0 = 1;
                                            String s4 = null;
                                            if (collection2 != null)
                                            {
                                                s4 = null;
                                                if (i == -1)
                                                {
                                                    int j = collection2.size();
                                                    s4 = null;
                                                    if (j > 0)
                                                    {
                                                        StringBuilder stringbuilder = new StringBuilder();
                                                        for (Iterator iterator1 = collection2.iterator(); iterator1.hasNext(); stringbuilder.append((String)iterator1.next()));
                                                        s4 = stringbuilder.toString();
                                                    }
                                                }
                                            }
                                            addIm(i, s4, s1, byte0, flag1);
                                            return;
                                        }
                                        if (s.equals("NOTE"))
                                        {
                                            addNote(s1);
                                            return;
                                        }
                                        if (s.equals("URL"))
                                        {
                                            if (mWebsiteList == null)
                                                mWebsiteList = new ArrayList(1);
                                            List list1 = mWebsiteList;
                                            WebsiteData websitedata = new WebsiteData(s1);
                                            list1.add(websitedata);
                                            return;
                                        }
                                        if (s.equals("BDAY"))
                                        {
                                            mBirthday = new BirthdayData(s1);
                                            return;
                                        }
                                        if (s.equals("ANNIVERSARY"))
                                        {
                                            mAnniversary = new AnniversaryData(s1);
                                            return;
                                        }
                                        if (s.equals("X-PHONETIC-FIRST-NAME"))
                                        {
                                            mNameData.mPhoneticGiven = s1;
                                            return;
                                        }
                                        if (s.equals("X-PHONETIC-MIDDLE-NAME"))
                                        {
                                            mNameData.mPhoneticMiddle = s1;
                                            return;
                                        }
                                        if (s.equals("X-PHONETIC-LAST-NAME"))
                                        {
                                            mNameData.mPhoneticFamily = s1;
                                            return;
                                        }
                                        if (s.equals("IMPP"))
                                        {
                                            if (s1.startsWith("sip:"))
                                            {
                                                handleSipCase(s1, (Collection)map.get("TYPE"));
                                                return;
                                            }
                                        } else
                                        if (s.equals("X-SIP"))
                                        {
                                            if (!TextUtils.isEmpty(s1))
                                            {
                                                handleSipCase(s1, (Collection)map.get("TYPE"));
                                                return;
                                            }
                                        } else
                                        if (s.equals("X-ANDROID-CUSTOM"))
                                        {
                                            handleAndroidCustomProperty(VCardUtils.constructListFromValue(s1, mVCardType));
                                            return;
                                        }
                                    }
                                } else
                                {
                                    Collection collection = (Collection)map.get("VALUE");
                                    if (collection == null || !collection.contains("URL"))
                                    {
                                        Collection collection1 = (Collection)map.get("TYPE");
                                        boolean flag = false;
                                        String s2 = null;
                                        if (collection1 != null)
                                        {
                                            Iterator iterator = collection1.iterator();
                                            do
                                            {
                                                if (!iterator.hasNext())
                                                    break;
                                                String s3 = (String)iterator.next();
                                                if ("PREF".equals(s3))
                                                    flag = true;
                                                else
                                                if (s2 == null)
                                                    s2 = s3;
                                            } while (true);
                                        }
                                        addPhotoBytes(s2, abyte0, flag);
                                        return;
                                    }
                                }
                        }
                    }
                }
            }
            return;
        }
        addNickName(s1);
    }

    public void consolidateFields()
    {
        mNameData.displayName = constructDisplayName();
    }

    public ArrayList constructInsertOperations(ContentResolver contentresolver, ArrayList arraylist)
    {
        if (arraylist == null)
            arraylist = new ArrayList();
        if (isIgnorable())
            return arraylist;
        int i = arraylist.size();
        android.content.ContentProviderOperation.Builder builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.RawContacts.CONTENT_URI);
        if (mAccount != null)
        {
            builder.withValue("account_name", mAccount.name);
            builder.withValue("account_type", mAccount.type);
        } else
        {
            builder.withValue("account_name", null);
            builder.withValue("account_type", null);
        }
        builder.withValue("aggregation_mode", Integer.valueOf(3));
        arraylist.add(builder.build());
        arraylist.size();
        iterateAllData(new InsertOperationConstrutor(arraylist, i));
        arraylist.size();
        return arraylist;
    }

    public final String getBirthday()
    {
        if (mBirthday != null)
            return mBirthday.mBirthday;
        else
            return null;
    }

    public final List getChildlen()
    {
        return mChildren;
    }

    public String getDisplayName()
    {
        if (mNameData.displayName == null)
            mNameData.displayName = constructDisplayName();
        return mNameData.displayName;
    }

    public final List getEmailList()
    {
        return mEmailList;
    }

    public final List getImList()
    {
        return mImList;
    }

    public final NameData getNameData()
    {
        return mNameData;
    }

    public final List getNickNameList()
    {
        return mNicknameList;
    }

    public final List getNotes()
    {
        return mNoteList;
    }

    public final List getOrganizationList()
    {
        return mOrganizationList;
    }

    public final List getPhoneList()
    {
        return mPhoneList;
    }

    public final List getPhotoList()
    {
        return mPhotoList;
    }

    public final List getPostalList()
    {
        return mPostalList;
    }

    public final List getWebsiteList()
    {
        return mWebsiteList;
    }

    public boolean isIgnorable()
    {
        IsIgnorableIterator isignorableiterator = new IsIgnorableIterator();
        iterateAllData(isignorableiterator);
        return isignorableiterator.getResult();
    }

    public final void iterateAllData(EntryElementIterator entryelementiterator)
    {
        entryelementiterator.onIterationStarted();
        entryelementiterator.onElementGroupStarted(mNameData.getEntryLabel());
        entryelementiterator.onElement(mNameData);
        entryelementiterator.onElementGroupEnded();
        iterateOneList(mPhoneList, entryelementiterator);
        iterateOneList(mEmailList, entryelementiterator);
        iterateOneList(mPostalList, entryelementiterator);
        iterateOneList(mOrganizationList, entryelementiterator);
        iterateOneList(mImList, entryelementiterator);
        iterateOneList(mPhotoList, entryelementiterator);
        iterateOneList(mWebsiteList, entryelementiterator);
        iterateOneList(mSipList, entryelementiterator);
        iterateOneList(mNicknameList, entryelementiterator);
        iterateOneList(mNoteList, entryelementiterator);
        iterateOneList(mAndroidCustomDataList, entryelementiterator);
        if (mBirthday != null)
        {
            entryelementiterator.onElementGroupStarted(mBirthday.getEntryLabel());
            entryelementiterator.onElement(mBirthday);
            entryelementiterator.onElementGroupEnded();
        }
        if (mAnniversary != null)
        {
            entryelementiterator.onElementGroupStarted(mAnniversary.getEntryLabel());
            entryelementiterator.onElement(mAnniversary);
            entryelementiterator.onElementGroupEnded();
        }
        entryelementiterator.onIterationEnded();
    }

    public String toString()
    {
        ToStringIterator tostringiterator = new ToStringIterator();
        iterateAllData(tostringiterator);
        return tostringiterator.toString();
    }

    static 
    {
        sImMap = new HashMap();
        sImMap.put("X-AIM", Integer.valueOf(0));
        sImMap.put("X-MSN", Integer.valueOf(1));
        sImMap.put("X-YAHOO", Integer.valueOf(2));
        sImMap.put("X-ICQ", Integer.valueOf(6));
        sImMap.put("X-JABBER", Integer.valueOf(7));
        sImMap.put("X-SKYPE-USERNAME", Integer.valueOf(3));
        sImMap.put("X-GOOGLE-TALK", Integer.valueOf(5));
        sImMap.put("X-GOOGLE TALK", Integer.valueOf(5));
        sImMap.put("X-QQ", Integer.valueOf(4));
        sImMap.put("X-CUSTOM-IM", Integer.valueOf(-1));
    }
}
