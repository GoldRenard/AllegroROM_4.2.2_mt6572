// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.bluetooth.pbap;

import android.accounts.Account;
import android.content.*;
import android.database.Cursor;
import android.os.RemoteException;
import android.telephony.PhoneNumberUtils;
import android.text.TextUtils;
import android.util.Log;
import java.util.*;

// Referenced classes of package com.android.bluetooth.pbap:
//            VCardUtils, VCardConfig

public class ContactStruct
{
    public static class EmailData
    {

        public final String data;
        public boolean isPrimary;
        public final String label;
        public final int type;

        public boolean equals(Object obj)
        {
            if (this != obj)
            {
                if (obj == null)
                    return false;
                if (!(obj instanceof EmailData))
                    return false;
                EmailData emaildata = (EmailData)obj;
                if (data == null)
                {
                    if (emaildata.data != null)
                        return false;
                } else
                if (!data.equals(emaildata.data))
                    return false;
                if (isPrimary != emaildata.isPrimary)
                    return false;
                if (label == null)
                {
                    if (emaildata.label != null)
                        return false;
                } else
                if (!label.equals(emaildata.label))
                    return false;
                if (type != emaildata.type)
                    return false;
            }
            return true;
        }

        public int hashCode()
        {
            int i;
            if (data == null)
                i = 0;
            else
                i = data.hashCode();
            int j = 31 * (i + 31);
            char c;
            if (isPrimary)
                c = '\u04CF';
            else
                c = '\u04D5';
            int k = 31 * (j + c);
            String s = label;
            int l = 0;
            if (s != null)
                l = label.hashCode();
            return 31 * (k + l) + type;
        }

        public String toString()
        {
            Object aobj[] = new Object[4];
            aobj[0] = Integer.valueOf(type);
            aobj[1] = data;
            aobj[2] = label;
            aobj[3] = Boolean.valueOf(isPrimary);
            return String.format("type: %d, data: %s, label: %s, isPrimary: %s", aobj);
        }

        public EmailData(int i, String s, String s1, boolean flag)
        {
            type = i;
            data = s;
            label = s1;
            isPrimary = flag;
        }
    }

    public static class ImData
    {

        public final String data;
        public final boolean isPrimary;
        public final String label;
        public final int type;

        public boolean equals(Object obj)
        {
            if (this != obj)
            {
                if (obj == null)
                    return false;
                if (!(obj instanceof ImData))
                    return false;
                ImData imdata = (ImData)obj;
                if (data == null)
                {
                    if (imdata.data != null)
                        return false;
                } else
                if (!data.equals(imdata.data))
                    return false;
                if (isPrimary != imdata.isPrimary)
                    return false;
                if (label == null)
                {
                    if (imdata.label != null)
                        return false;
                } else
                if (!label.equals(imdata.label))
                    return false;
                if (type != imdata.type)
                    return false;
            }
            return true;
        }

        public int hashCode()
        {
            int i;
            if (data == null)
                i = 0;
            else
                i = data.hashCode();
            int j = 31 * (i + 31);
            char c;
            if (isPrimary)
                c = '\u04CF';
            else
                c = '\u04D5';
            int k = 31 * (j + c);
            String s = label;
            int l = 0;
            if (s != null)
                l = label.hashCode();
            return 31 * (k + l) + type;
        }

        public String toString()
        {
            Object aobj[] = new Object[4];
            aobj[0] = Integer.valueOf(type);
            aobj[1] = data;
            aobj[2] = label;
            aobj[3] = Boolean.valueOf(isPrimary);
            return String.format("type: %d, data: %s, label: %s, isPrimary: %s", aobj);
        }

        public ImData(int i, String s, String s1, boolean flag)
        {
            type = i;
            data = s;
            label = s1;
            isPrimary = flag;
        }
    }

    public static class OrganizationData
    {

        public final String companyName;
        public boolean isPrimary;
        public String positionName;
        public final int type;

        public boolean equals(Object obj)
        {
            if (this != obj)
            {
                if (obj == null)
                    return false;
                if (!(obj instanceof OrganizationData))
                    return false;
                OrganizationData organizationdata = (OrganizationData)obj;
                if (companyName == null)
                {
                    if (organizationdata.companyName != null)
                        return false;
                } else
                if (!companyName.equals(organizationdata.companyName))
                    return false;
                if (isPrimary != organizationdata.isPrimary)
                    return false;
                if (positionName == null)
                {
                    if (organizationdata.positionName != null)
                        return false;
                } else
                if (!positionName.equals(organizationdata.positionName))
                    return false;
                if (type != organizationdata.type)
                    return false;
            }
            return true;
        }

        public int hashCode()
        {
            int i;
            if (companyName == null)
                i = 0;
            else
                i = companyName.hashCode();
            int j = 31 * (i + 31);
            char c;
            if (isPrimary)
                c = '\u04CF';
            else
                c = '\u04D5';
            int k = 31 * (j + c);
            String s = positionName;
            int l = 0;
            if (s != null)
                l = positionName.hashCode();
            return 31 * (k + l) + type;
        }

        public String toString()
        {
            Object aobj[] = new Object[4];
            aobj[0] = Integer.valueOf(type);
            aobj[1] = companyName;
            aobj[2] = positionName;
            aobj[3] = Boolean.valueOf(isPrimary);
            return String.format("type: %d, company: %s, position: %s, isPrimary: %s", aobj);
        }

        public OrganizationData(int i, String s, String s1, boolean flag)
        {
            type = i;
            companyName = s;
            positionName = s1;
            isPrimary = flag;
        }
    }

    public static class PhoneData
    {

        public final String data;
        public boolean isPrimary;
        public final String label;
        public final int type;

        public boolean equals(Object obj)
        {
            if (this != obj)
            {
                if (obj == null)
                    return false;
                if (!(obj instanceof PhoneData))
                    return false;
                PhoneData phonedata = (PhoneData)obj;
                if (data == null)
                {
                    if (phonedata.data != null)
                        return false;
                } else
                if (!data.equals(phonedata.data))
                    return false;
                if (isPrimary != phonedata.isPrimary)
                    return false;
                if (label == null)
                {
                    if (phonedata.label != null)
                        return false;
                } else
                if (!label.equals(phonedata.label))
                    return false;
                if (type != phonedata.type)
                    return false;
            }
            return true;
        }

        public int hashCode()
        {
            int i;
            if (data == null)
                i = 0;
            else
                i = data.hashCode();
            int j = 31 * (i + 31);
            char c;
            if (isPrimary)
                c = '\u04CF';
            else
                c = '\u04D5';
            int k = 31 * (j + c);
            String s = label;
            int l = 0;
            if (s != null)
                l = label.hashCode();
            return 31 * (k + l) + type;
        }

        public String toString()
        {
            Object aobj[] = new Object[4];
            aobj[0] = Integer.valueOf(type);
            aobj[1] = data;
            aobj[2] = label;
            aobj[3] = Boolean.valueOf(isPrimary);
            return String.format("type: %d, data: %s, label: %s, isPrimary: %s", aobj);
        }

        public PhoneData(int i, String s, String s1, boolean flag)
        {
            type = i;
            data = s;
            label = s1;
            isPrimary = flag;
        }
    }

    public static class PhotoData
    {

        public static final String FORMAT_FLASH = "SWF";
        public final String formatName;
        public final byte photoBytes[];
        public final int type;

        public PhotoData(int i, String s, byte abyte0[])
        {
            type = i;
            formatName = s;
            photoBytes = abyte0;
        }
    }

    public static class PostalData
    {

        public static final int ADDR_MAX_DATA_SIZE = 7;
        public final String country;
        public final String extendedAddress;
        public boolean isPrimary;
        public final String label;
        public final String localty;
        private final String mDataArray[];
        public final String pobox;
        public final String postalCode;
        public final String region;
        public final String street;
        public final int type;

        public boolean equals(Object obj)
        {
            if (this != obj)
            {
                if (obj == null)
                    return false;
                if (!(obj instanceof PostalData))
                    return false;
                PostalData postaldata = (PostalData)obj;
                if (country == null)
                {
                    if (postaldata.country != null)
                        return false;
                } else
                if (!country.equals(postaldata.country))
                    return false;
                if (extendedAddress == null)
                {
                    if (postaldata.extendedAddress != null)
                        return false;
                } else
                if (!extendedAddress.equals(postaldata.extendedAddress))
                    return false;
                if (isPrimary != postaldata.isPrimary)
                    return false;
                if (label == null)
                {
                    if (postaldata.label != null)
                        return false;
                } else
                if (!label.equals(postaldata.label))
                    return false;
                if (localty == null)
                {
                    if (postaldata.localty != null)
                        return false;
                } else
                if (!localty.equals(postaldata.localty))
                    return false;
                if (!Arrays.equals(mDataArray, postaldata.mDataArray))
                    return false;
                if (pobox == null)
                {
                    if (postaldata.pobox != null)
                        return false;
                } else
                if (!pobox.equals(postaldata.pobox))
                    return false;
                if (postalCode == null)
                {
                    if (postaldata.postalCode != null)
                        return false;
                } else
                if (!postalCode.equals(postaldata.postalCode))
                    return false;
                if (region == null)
                {
                    if (postaldata.region != null)
                        return false;
                } else
                if (!region.equals(postaldata.region))
                    return false;
                if (street == null)
                {
                    if (postaldata.street != null)
                        return false;
                } else
                if (!street.equals(postaldata.street))
                    return false;
                if (type != postaldata.type)
                    return false;
            }
            return true;
        }

        public String getFormattedAddress(int i)
        {
            StringBuilder stringbuilder = new StringBuilder();
            boolean flag = true;
            if (VCardConfig.isJapaneseDevice(i))
            {
                for (int k = 6; k >= 0; k--)
                {
                    String s1 = mDataArray[k];
                    if (!TextUtils.isEmpty(s1))
                    {
                        if (!flag)
                            stringbuilder.append(' ');
                        stringbuilder.append(s1);
                        flag = false;
                    }
                }

            } else
            {
                for (int j = 0; j < 7; j++)
                {
                    String s = mDataArray[j];
                    if (TextUtils.isEmpty(s))
                        continue;
                    if (!flag)
                        stringbuilder.append(' ');
                    stringbuilder.append(s);
                    flag = false;
                }

            }
            return stringbuilder.toString().trim();
        }

        public int hashCode()
        {
            int i;
            if (country == null)
                i = 0;
            else
                i = country.hashCode();
            int j = 31 * (i + 31);
            int k;
            if (extendedAddress == null)
                k = 0;
            else
                k = extendedAddress.hashCode();
            int l = 31 * (j + k);
            char c;
            if (isPrimary)
                c = '\u04CF';
            else
                c = '\u04D5';
            int i1 = 31 * (l + c);
            int j1;
            if (label == null)
                j1 = 0;
            else
                j1 = label.hashCode();
            int k1 = 31 * (i1 + j1);
            int l1;
            if (localty == null)
                l1 = 0;
            else
                l1 = localty.hashCode();
            int i2 = 31 * (31 * (k1 + l1) + Arrays.hashCode(mDataArray));
            int j2;
            if (pobox == null)
                j2 = 0;
            else
                j2 = pobox.hashCode();
            int k2 = 31 * (i2 + j2);
            int l2;
            if (postalCode == null)
                l2 = 0;
            else
                l2 = postalCode.hashCode();
            int i3 = 31 * (k2 + l2);
            int j3;
            if (region == null)
                j3 = 0;
            else
                j3 = region.hashCode();
            int k3 = 31 * (i3 + j3);
            String s = street;
            int l3 = 0;
            if (s != null)
                l3 = street.hashCode();
            return 31 * (k3 + l3) + type;
        }

        public String toString()
        {
            Object aobj[] = new Object[3];
            aobj[0] = Integer.valueOf(type);
            aobj[1] = label;
            aobj[2] = Boolean.valueOf(isPrimary);
            return String.format("type: %d, label: %s, isPrimary: %s", aobj);
        }

        public PostalData(int i, List list, String s, boolean flag)
        {
            int j;
            int k;
            Iterator iterator;
            type = i;
            mDataArray = new String[7];
            j = list.size();
            if (j > 7)
                j = 7;
            k = 0;
            iterator = list.iterator();
_L4:
            if (!iterator.hasNext()) goto _L2; else goto _L1
_L1:
            String s1 = (String)iterator.next();
            mDataArray[k] = s1;
            if (++k < j) goto _L4; else goto _L3
_L2:
            l = k;
_L3:
            int i1;
            for (int l = k; l < 7; l = i1)
            {
                String as[] = mDataArray;
                i1 = l + 1;
                as[l] = null;
            }

            pobox = mDataArray[0];
            extendedAddress = mDataArray[1];
            street = mDataArray[2];
            localty = mDataArray[3];
            region = mDataArray[4];
            postalCode = mDataArray[5];
            country = mDataArray[6];
            label = s;
            isPrimary = flag;
            return;
        }
    }

    static class Property
    {

        private Map mParameterMap;
        private byte mPropertyBytes[];
        private String mPropertyName;
        private List mPropertyValueList;

        public void addParameter(String s, String s1)
        {
            Object obj;
            if (!mParameterMap.containsKey(s))
            {
                if (s.equals("TYPE"))
                    obj = new HashSet();
                else
                    obj = new ArrayList();
                mParameterMap.put(s, obj);
            } else
            {
                obj = (Collection)mParameterMap.get(s);
            }
            ((Collection) (obj)).add(s1);
        }

        public void addToPropertyValueList(String s)
        {
            mPropertyValueList.add(s);
        }

        public void clear()
        {
            mPropertyName = null;
            mParameterMap.clear();
            mPropertyValueList.clear();
        }

        public final Collection getParameters(String s)
        {
            return (Collection)mParameterMap.get(s);
        }

        public final List getPropertyValueList()
        {
            return mPropertyValueList;
        }

        public void setPropertyBytes(byte abyte0[])
        {
            mPropertyBytes = abyte0;
        }

        public void setPropertyName(String s)
        {
            mPropertyName = s;
        }





        public Property()
        {
            mParameterMap = new HashMap();
            mPropertyValueList = new ArrayList();
            clear();
        }
    }


    private static final String ACCOUNT_TYPE_GOOGLE = "com.google";
    private static final String GOOGLE_MY_CONTACTS_GROUP = "System Group: My Contacts";
    private static final Map IM_MAP;
    private static final String LOG_TAG = "vcard.ContactStruct";
    private final Account mAccount;
    private String mBirthday;
    private String mDisplayName;
    private List mEmailList;
    private String mFamilyName;
    private String mFullName;
    private String mGivenName;
    private List mImList;
    private String mMiddleName;
    private List mNickNameList;
    private List mNoteList;
    private List mOrganizationList;
    private List mPhoneList;
    private String mPhoneticFamilyName;
    private String mPhoneticFullName;
    private String mPhoneticGivenName;
    private String mPhoneticMiddleName;
    private List mPhotoList;
    private List mPostalList;
    private boolean mPrefIsSetAddress;
    private boolean mPrefIsSetEmail;
    private boolean mPrefIsSetOrganization;
    private boolean mPrefIsSetPhone;
    private String mPrefix;
    private String mSuffix;
    private final int mVCardType;
    private List mWebsiteList;

    public ContactStruct()
    {
        this(0xc0000000);
    }

    public ContactStruct(int i)
    {
        this(i, null);
    }

    public ContactStruct(int i, Account account)
    {
        mVCardType = i;
        mAccount = account;
    }

    public ContactStruct(String s, String s1, String s2, String s3, String s4, String s5, String s6, 
            String s7, List list, List list1, List list2, List list3, List list4, List list5, 
            List list6, List list7)
    {
        this(0xc0000000);
        mGivenName = s;
        mFamilyName = s1;
        mPrefix = s3;
        mSuffix = s4;
        mPhoneticGivenName = s;
        mPhoneticFamilyName = s1;
        mPhoneticMiddleName = s2;
        mEmailList = list3;
        mPostalList = list4;
        mOrganizationList = list5;
        mPhotoList = list6;
        mWebsiteList = list7;
    }

    private void addEmail(int i, String s, String s1, boolean flag)
    {
        if (mEmailList == null)
            mEmailList = new ArrayList();
        mEmailList.add(new EmailData(i, s, s1, flag));
    }

    private void addIm(int i, String s, String s1, boolean flag)
    {
        if (mImList == null)
            mImList = new ArrayList();
        mImList.add(new ImData(i, s, s1, flag));
    }

    private void addNickName(String s)
    {
        if (mNickNameList == null)
            mNickNameList = new ArrayList();
        mNickNameList.add(s);
    }

    private void addNote(String s)
    {
        if (mNoteList == null)
            mNoteList = new ArrayList(1);
        mNoteList.add(s);
    }

    private void addOrganization(int i, String s, String s1, boolean flag)
    {
        if (mOrganizationList == null)
            mOrganizationList = new ArrayList();
        mOrganizationList.add(new OrganizationData(i, s, s1, flag));
    }

    private void addPhone(int i, String s, String s1, boolean flag)
    {
        if (mPhoneList == null)
            mPhoneList = new ArrayList();
        StringBuilder stringbuilder = new StringBuilder();
        String s2 = s.trim();
        int j = s2.length();
        for (int k = 0; k < j; k++)
        {
            char c = s2.charAt(k);
            if (VCardUtils.isAllowablePhoneNumberChar(c) || k == 0 && c == '+')
                stringbuilder.append(c);
        }

        PhoneData phonedata = new PhoneData(i, PhoneNumberUtils.formatNumber(stringbuilder.toString()), s1, flag);
        mPhoneList.add(phonedata);
    }

    private void addPhotoBytes(String s, byte abyte0[])
    {
        if (mPhotoList == null)
            mPhotoList = new ArrayList(1);
        PhotoData photodata = new PhotoData(0, null, abyte0);
        mPhotoList.add(photodata);
    }

    private void addPostal(int i, List list, String s, boolean flag)
    {
        if (mPostalList == null)
            mPostalList = new ArrayList();
        mPostalList.add(new PostalData(i, list, s, flag));
    }

    private void constructDisplayName()
    {
        if (TextUtils.isEmpty(mFamilyName) && TextUtils.isEmpty(mGivenName))
        {
            if (!TextUtils.isEmpty(mFullName))
                mDisplayName = mFullName;
            else
            if (TextUtils.isEmpty(mPhoneticFamilyName) && TextUtils.isEmpty(mPhoneticGivenName))
            {
                if (mEmailList != null && mEmailList.size() > 0)
                    mDisplayName = ((EmailData)mEmailList.get(0)).data;
                else
                if (mPhoneList != null && mPhoneList.size() > 0)
                    mDisplayName = ((PhoneData)mPhoneList.get(0)).data;
                else
                if (mPostalList != null && mPostalList.size() > 0)
                    mDisplayName = ((PostalData)mPostalList.get(0)).getFormattedAddress(mVCardType);
            } else
            {
                mDisplayName = VCardUtils.constructNameFromElements(mVCardType, mPhoneticFamilyName, mPhoneticMiddleName, mPhoneticGivenName);
            }
        } else
        {
            StringBuilder stringbuilder = new StringBuilder();
            List list;
            switch (VCardConfig.getNameOrderType(mVCardType))
            {
            case 4: // '\004'
                String as3[] = new String[5];
                as3[0] = mPrefix;
                as3[1] = mMiddleName;
                as3[2] = mGivenName;
                as3[3] = mFamilyName;
                as3[4] = mSuffix;
                list = Arrays.asList(as3);
                break;

            case 8: // '\b'
                if (VCardUtils.containsOnlyPrintableAscii(mFamilyName) && VCardUtils.containsOnlyPrintableAscii(mGivenName))
                {
                    String as2[] = new String[5];
                    as2[0] = mPrefix;
                    as2[1] = mGivenName;
                    as2[2] = mMiddleName;
                    as2[3] = mFamilyName;
                    as2[4] = mSuffix;
                    list = Arrays.asList(as2);
                } else
                {
                    String as1[] = new String[5];
                    as1[0] = mPrefix;
                    as1[1] = mFamilyName;
                    as1[2] = mMiddleName;
                    as1[3] = mGivenName;
                    as1[4] = mSuffix;
                    list = Arrays.asList(as1);
                }
                break;

            default:
                String as[] = new String[5];
                as[0] = mPrefix;
                as[1] = mGivenName;
                as[2] = mMiddleName;
                as[3] = mFamilyName;
                as[4] = mSuffix;
                list = Arrays.asList(as);
                break;
            }
            boolean flag = true;
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                String s = (String)iterator.next();
                if (!TextUtils.isEmpty(s))
                {
                    if (flag)
                        flag = false;
                    else
                        stringbuilder.append(' ');
                    stringbuilder.append(s);
                }
            } while (true);
            mDisplayName = stringbuilder.toString();
        }
        if (mDisplayName == null)
            mDisplayName = "";
    }

    private void handleNProperty(List list)
    {
        if (list != null)
        {
            int i = list.size();
            if (i >= 1)
            {
                if (i > 5)
                    i = 5;
                switch (i)
                {
                case 2: // '\002'
                    mGivenName = (String)list.get(1);
                    mFamilyName = (String)list.get(0);
                    return;

                case 3: // '\003'
                    mMiddleName = (String)list.get(2);
                    mGivenName = (String)list.get(1);
                    mFamilyName = (String)list.get(0);
                    return;

                case 4: // '\004'
                    mPrefix = (String)list.get(3);
                    mMiddleName = (String)list.get(2);
                    mGivenName = (String)list.get(1);
                    mFamilyName = (String)list.get(0);
                    return;

                case 5: // '\005'
                    mSuffix = (String)list.get(4);
                    mPrefix = (String)list.get(3);
                    mMiddleName = (String)list.get(2);
                    mGivenName = (String)list.get(1);
                    mFamilyName = (String)list.get(0);
                    return;
                }
                mFamilyName = (String)list.get(0);
                return;
            }
        }
    }

    private void handlePhoneticNameFromSound(List list)
    {
        if (list != null)
        {
            int i = list.size();
            if (i >= 1)
            {
                if (i > 3)
                    i = 3;
                switch (i)
                {
                case 2: // '\002'
                    mPhoneticGivenName = (String)list.get(1);
                    mPhoneticFamilyName = (String)list.get(0);
                    return;

                case 3: // '\003'
                    mPhoneticMiddleName = (String)list.get(2);
                    mPhoneticGivenName = (String)list.get(1);
                    mPhoneticFamilyName = (String)list.get(0);
                    return;
                }
                mPhoneticFamilyName = (String)list.get(0);
                return;
            }
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

    private void setPosition(String s)
    {
        if (mOrganizationList == null)
            mOrganizationList = new ArrayList();
        int i = mOrganizationList.size();
        if (i == 0)
        {
            addOrganization(2, "", null, false);
            i = 1;
        }
        ((OrganizationData)mOrganizationList.get(i - 1)).positionName = s;
    }

    public void addProperty(Property property)
    {
        String s1;
label0:
        {
            String s;
            Map map;
            List list;
            byte abyte0[];
label1:
            {
                s = property.mPropertyName;
                map = property.mParameterMap;
                list = property.mPropertyValueList;
                abyte0 = property.mPropertyBytes;
                if (list.size() != 0)
                {
                    s1 = listToString(list).trim();
                    if (s.equals("VERSION"))
                    {
                        Log.d("vcard.ContactStruct", "addProperty,propName equals VERSION");
                        return;
                    }
                    if (s.equals("FN"))
                    {
                        mFullName = s1;
                        return;
                    }
                    if (s.equals("NAME") && mFullName == null)
                    {
                        mFullName = s1;
                        return;
                    }
                    if (s.equals("N"))
                    {
                        handleNProperty(list);
                        return;
                    }
                    if (s.equals("SORT-STRING"))
                    {
                        mPhoneticFullName = s1;
                        return;
                    }
                    if (s.equals("NICKNAME") || s.equals("X-NICKNAME"))
                        break label0;
                    if (s.equals("SOUND"))
                    {
                        Collection collection8 = (Collection)map.get("TYPE");
                        if (collection8 != null && collection8.contains("X-IRMC-N"))
                        {
                            handlePhoneticNameFromSound(list);
                            return;
                        } else
                        {
                            Log.d("vcard.ContactStruct", (new StringBuilder()).append("addProperty,typeCollection is null,or typeCollection doesn't contains").append("X-IRMC-N".toString()).toString());
                            return;
                        }
                    }
                    if (!s.equals("ADR"))
                        break label1;
                    boolean flag5 = true;
                    Iterator iterator4 = list.iterator();
                    do
                    {
                        if (!iterator4.hasNext())
                            break;
                        if (((String)iterator4.next()).length() <= 0)
                            continue;
                        flag5 = false;
                        break;
                    } while (true);
                    if (!flag5)
                    {
                        byte byte1 = -1;
                        String s7 = "";
                        Collection collection7 = (Collection)map.get("TYPE");
                        boolean flag6 = false;
                        if (collection7 != null)
                        {
                            for (Iterator iterator5 = collection7.iterator(); iterator5.hasNext();)
                            {
                                String s8 = ((String)iterator5.next()).toUpperCase();
                                if (s8.equals("PREF") && !mPrefIsSetAddress)
                                {
                                    mPrefIsSetAddress = true;
                                    flag6 = true;
                                } else
                                if (s8.equals("HOME"))
                                {
                                    byte1 = 1;
                                    s7 = "";
                                } else
                                if (!s8.equals("WORK") && !s8.equalsIgnoreCase("COMPANY"))
                                {
                                    if (!s8.equals("PARCEL") && !s8.equals("DOM") && !s8.equals("INTL"))
                                    {
                                        if (s8.startsWith("X-") && byte1 < 0)
                                            s8 = s8.substring(2);
                                        s7 = s8;
                                        byte1 = 0;
                                    } else
                                    {
                                        Log.d("vcard.ContactStruct", "addProperty,typeString equals PARCEL or DOM or INTL");
                                    }
                                } else
                                {
                                    byte1 = 2;
                                    s7 = "";
                                }
                            }

                        }
                        if (byte1 < 0)
                            byte1 = 1;
                        addPostal(byte1, list, s7, flag6);
                        return;
                    }
                }
                return;
            }
            if (s.equals("EMAIL"))
            {
                byte byte0 = -1;
                Collection collection6 = (Collection)map.get("TYPE");
                boolean flag4 = false;
                String s5 = null;
                if (collection6 != null)
                {
                    for (Iterator iterator3 = collection6.iterator(); iterator3.hasNext();)
                    {
                        String s6 = ((String)iterator3.next()).toUpperCase();
                        if (s6.equals("PREF") && !mPrefIsSetEmail)
                        {
                            mPrefIsSetEmail = true;
                            flag4 = true;
                        } else
                        if (s6.equals("HOME"))
                            byte0 = 1;
                        else
                        if (s6.equals("WORK"))
                            byte0 = 2;
                        else
                        if (s6.equals("CELL"))
                        {
                            byte0 = 4;
                        } else
                        {
                            if (s6.startsWith("X-") && byte0 < 0)
                                s6 = s6.substring(2);
                            s5 = s6;
                            byte0 = 0;
                        }
                    }

                }
                if (byte0 < 0)
                    byte0 = 3;
                addEmail(byte0, s1, s5, flag4);
                return;
            }
            if (s.equals("ORG"))
            {
                Collection collection5 = (Collection)map.get("TYPE");
                boolean flag3 = false;
                if (collection5 != null)
                {
                    Iterator iterator2 = collection5.iterator();
                    do
                    {
                        if (!iterator2.hasNext())
                            break;
                        if (((String)iterator2.next()).equals("PREF") && !mPrefIsSetOrganization)
                        {
                            mPrefIsSetOrganization = true;
                            flag3 = true;
                        }
                    } while (true);
                }
                StringBuilder stringbuilder = new StringBuilder();
                Iterator iterator1 = list.iterator();
                do
                {
                    if (!iterator1.hasNext())
                        break;
                    stringbuilder.append((String)iterator1.next());
                    if (iterator1.hasNext())
                        stringbuilder.append(' ');
                } while (true);
                addOrganization(1, stringbuilder.toString(), "", flag3);
                return;
            }
            if (s.equals("TITLE"))
            {
                setPosition(s1);
                return;
            }
            if (s.equals("ROLE"))
            {
                setPosition(s1);
                return;
            }
            if (!s.equals("PHOTO") && !s.equals("LOGO"))
            {
                if (s.equals("TEL"))
                {
                    Collection collection4 = (Collection)map.get("TYPE");
                    Object obj = VCardUtils.getPhoneTypeFromStrings(collection4);
                    String s4;
                    int j;
                    if (obj instanceof Integer)
                    {
                        j = ((Integer)obj).intValue();
                        s4 = null;
                    } else
                    {
                        if (obj != null)
                            s4 = obj.toString();
                        else
                            s4 = "";
                        j = 0;
                    }
                    boolean flag2;
                    if (!mPrefIsSetPhone && collection4 != null && collection4.contains("PREF"))
                    {
                        mPrefIsSetPhone = true;
                        flag2 = true;
                    } else
                    {
                        flag2 = false;
                    }
                    addPhone(j, s1, s4, flag2);
                    return;
                }
                if (s.equals("X-SKYPE-PSTNNUMBER"))
                {
                    Collection collection3 = (Collection)map.get("TYPE");
                    boolean flag1;
                    if (!mPrefIsSetPhone && collection3 != null && collection3.contains("PREF"))
                    {
                        mPrefIsSetPhone = true;
                        flag1 = true;
                    } else
                    {
                        flag1 = false;
                    }
                    addPhone(7, s1, null, flag1);
                    return;
                }
                if (IM_MAP.containsKey(s))
                {
                    int i = ((Integer)IM_MAP.get(s)).intValue();
                    Collection collection2 = (Collection)map.get("TYPE");
                    boolean flag = false;
                    if (collection2 != null)
                    {
                        Iterator iterator = collection2.iterator();
                        do
                        {
                            if (!iterator.hasNext())
                                break;
                            String s3 = (String)iterator.next();
                            if (s3.equals("PREF"))
                                flag = true;
                            else
                            if (s3.equalsIgnoreCase("HOME"))
                                i = 1;
                            else
                            if (s3.equalsIgnoreCase("WORK"))
                                i = 3;
                        } while (true);
                    }
                    if (i < 0)
                        i = 1;
                    addIm(i, s1, null, flag);
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
                    mWebsiteList.add(s1);
                    return;
                }
                if (s.equals("X-PHONETIC-FIRST-NAME"))
                {
                    mPhoneticGivenName = s1;
                    return;
                }
                if (s.equals("X-PHONETIC-MIDDLE-NAME"))
                {
                    mPhoneticMiddleName = s1;
                    return;
                }
                if (s.equals("X-PHONETIC-LAST-NAME"))
                {
                    mPhoneticFamilyName = s1;
                    return;
                }
                if (s.equals("BDAY"))
                {
                    mBirthday = s1;
                    return;
                } else
                {
                    Log.d("vcard.ContactStruct", "addProperty,propName is unknown");
                    return;
                }
            }
            Collection collection = (Collection)map.get("TYPE");
            String s2 = null;
            if (collection != null)
                s2 = (String)collection.iterator().next();
            Collection collection1 = (Collection)map.get("VALUE");
            if (collection1 != null && collection1.contains("URL"))
            {
                Log.d("vcard.ContactStruct", "addProperty,paramMapValue is null, or paramMapValue doesn't contains URL");
                return;
            } else
            {
                addPhotoBytes(s2, abyte0);
                return;
            }
        }
        addNickName(s1);
    }

    public void consolidateFields()
    {
        constructDisplayName();
        if (mPhoneticFullName != null)
            mPhoneticFullName = mPhoneticFullName.trim();
        if (!mPrefIsSetPhone && mPhoneList != null && mPhoneList.size() > 0)
            ((PhoneData)mPhoneList.get(0)).isPrimary = true;
        if (!mPrefIsSetAddress && mPostalList != null && mPostalList.size() > 0)
            ((PostalData)mPostalList.get(0)).isPrimary = true;
        if (!mPrefIsSetEmail && mEmailList != null && mEmailList.size() > 0)
            ((EmailData)mEmailList.get(0)).isPrimary = true;
        if (!mPrefIsSetOrganization && mOrganizationList != null && mOrganizationList.size() > 0)
            ((OrganizationData)mOrganizationList.get(0)).isPrimary = true;
    }

    public String getBirthday()
    {
        return mBirthday;
    }

    public String getDisplayName()
    {
        if (mDisplayName == null)
            constructDisplayName();
        return mDisplayName;
    }

    public final List getEmailList()
    {
        return mEmailList;
    }

    public String getFamilyName()
    {
        return mFamilyName;
    }

    public String getFullName()
    {
        return mFullName;
    }

    public String getGivenName()
    {
        return mGivenName;
    }

    public String getMiddleName()
    {
        return mMiddleName;
    }

    public final List getNickNameList()
    {
        return mNickNameList;
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

    public String getPhoneticFamilyName()
    {
        return mPhoneticFamilyName;
    }

    public String getPhoneticFullName()
    {
        return mPhoneticFullName;
    }

    public String getPhoneticGivenName()
    {
        return mPhoneticGivenName;
    }

    public String getPhoneticMiddleName()
    {
        return mPhoneticMiddleName;
    }

    public final List getPhotoList()
    {
        return mPhotoList;
    }

    public final List getPostalList()
    {
        return mPostalList;
    }

    public String getPrefix()
    {
        return mPrefix;
    }

    public String getSuffix()
    {
        return mSuffix;
    }

    public boolean isIgnorable()
    {
        return getDisplayName().length() == 0;
    }

    public void pushIntoContentResolver(ContentResolver contentresolver)
    {
        ArrayList arraylist;
        android.content.ContentProviderOperation.Builder builder;
        arraylist = new ArrayList();
        builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.RawContacts.CONTENT_URI);
        if (mAccount == null) goto _L2; else goto _L1
_L1:
        String s;
        Cursor cursor;
        builder.withValue("account_name", mAccount.name);
        builder.withValue("account_type", mAccount.type);
        boolean flag2 = "com.google".equals(mAccount.type);
        s = null;
        if (!flag2)
            break MISSING_BLOCK_LABEL_157;
        cursor = contentresolver.query(android.provider.ContactsContract.Groups.CONTENT_URI, new String[] {
            "sourceid"
        }, "title=?", new String[] {
            "System Group: My Contacts"
        }, null);
        s = null;
        if (cursor == null)
            break MISSING_BLOCK_LABEL_145;
        boolean flag3 = cursor.moveToFirst();
        s = null;
        if (!flag3)
            break MISSING_BLOCK_LABEL_145;
        String s4 = cursor.getString(0);
        s = s4;
        if (cursor != null)
            cursor.close();
_L4:
        arraylist.add(builder.build());
        android.content.ContentProviderOperation.Builder builder1 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
        builder1.withValueBackReference("raw_contact_id", 0);
        builder1.withValue("mimetype", "vnd.android.cursor.item/name");
        builder1.withValue("data2", mGivenName);
        builder1.withValue("data3", mFamilyName);
        builder1.withValue("data5", mMiddleName);
        builder1.withValue("data4", mPrefix);
        builder1.withValue("data6", mSuffix);
        builder1.withValue("data7", mPhoneticGivenName);
        builder1.withValue("data9", mPhoneticFamilyName);
        builder1.withValue("data8", mPhoneticMiddleName);
        builder1.withValue("data1", getDisplayName());
        arraylist.add(builder1.build());
        if (mNickNameList != null && mNickNameList.size() > 0)
        {
            boolean flag1 = true;
            android.content.ContentProviderOperation.Builder builder12;
            for (Iterator iterator8 = mNickNameList.iterator(); iterator8.hasNext(); arraylist.add(builder12.build()))
            {
                String s3 = (String)iterator8.next();
                builder12 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
                builder12.withValueBackReference("raw_contact_id", 0);
                builder12.withValue("mimetype", "vnd.android.cursor.item/nickname");
                builder12.withValue("data2", Integer.valueOf(1));
                builder12.withValue("data1", s3);
                if (flag1)
                {
                    builder12.withValue("is_primary", Integer.valueOf(1));
                    flag1 = false;
                }
            }

        }
        break; /* Loop/switch isn't completed */
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
_L2:
        builder.withValue("account_name", null);
        builder.withValue("account_type", null);
        s = null;
        if (true) goto _L4; else goto _L3
_L3:
        if (mPhoneList != null)
        {
            android.content.ContentProviderOperation.Builder builder11;
            for (Iterator iterator7 = mPhoneList.iterator(); iterator7.hasNext(); arraylist.add(builder11.build()))
            {
                PhoneData phonedata = (PhoneData)iterator7.next();
                builder11 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
                builder11.withValueBackReference("raw_contact_id", 0);
                builder11.withValue("mimetype", "vnd.android.cursor.item/phone_v2");
                builder11.withValue("data2", Integer.valueOf(phonedata.type));
                if (phonedata.type == 0)
                    builder11.withValue("data3", phonedata.label);
                builder11.withValue("data1", phonedata.data);
                if (phonedata.isPrimary)
                    builder11.withValue("is_primary", Integer.valueOf(1));
            }

        }
        if (mOrganizationList != null)
        {
            android.content.ContentProviderOperation.Builder builder10;
            for (Iterator iterator6 = mOrganizationList.iterator(); iterator6.hasNext(); arraylist.add(builder10.build()))
            {
                OrganizationData organizationdata = (OrganizationData)iterator6.next();
                builder10 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
                builder10.withValueBackReference("raw_contact_id", 0);
                builder10.withValue("mimetype", "vnd.android.cursor.item/organization");
                builder10.withValue("data2", Integer.valueOf(organizationdata.type));
                builder10.withValue("data1", organizationdata.companyName);
                builder10.withValue("data4", organizationdata.positionName);
                if (true)
                    builder10.withValue("is_primary", Integer.valueOf(1));
            }

        }
        if (mEmailList != null)
        {
            android.content.ContentProviderOperation.Builder builder9;
            for (Iterator iterator5 = mEmailList.iterator(); iterator5.hasNext(); arraylist.add(builder9.build()))
            {
                EmailData emaildata = (EmailData)iterator5.next();
                builder9 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
                builder9.withValueBackReference("raw_contact_id", 0);
                builder9.withValue("mimetype", "vnd.android.cursor.item/email_v2");
                builder9.withValue("data2", Integer.valueOf(emaildata.type));
                if (emaildata.type == 0)
                    builder9.withValue("data3", emaildata.label);
                builder9.withValue("data1", emaildata.data);
                if (emaildata.isPrimary)
                    builder9.withValue("is_primary", Integer.valueOf(1));
            }

        }
        if (mPostalList != null)
        {
            android.content.ContentProviderOperation.Builder builder8;
            for (Iterator iterator4 = mPostalList.iterator(); iterator4.hasNext(); arraylist.add(builder8.build()))
            {
                PostalData postaldata = (PostalData)iterator4.next();
                builder8 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
                VCardUtils.insertStructuredPostalDataUsingContactsStruct(mVCardType, builder8, postaldata);
            }

        }
        if (mImList != null)
        {
            Iterator iterator3 = mImList.iterator();
            do
            {
                if (!iterator3.hasNext())
                    break;
                ImData imdata = (ImData)iterator3.next();
                android.content.ContentProviderOperation.Builder builder7 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
                builder7.withValueBackReference("raw_contact_id", 0);
                builder7.withValue("mimetype", "vnd.android.cursor.item/im");
                builder7.withValue("data2", Integer.valueOf(imdata.type));
                if (imdata.type == 0)
                    builder7.withValue("data3", imdata.label);
                builder7.withValue("data1", imdata.data);
                if (imdata.isPrimary)
                    builder7.withValue("is_primary", Integer.valueOf(1));
            } while (true);
        }
        if (mNoteList != null)
        {
            android.content.ContentProviderOperation.Builder builder6;
            for (Iterator iterator2 = mNoteList.iterator(); iterator2.hasNext(); arraylist.add(builder6.build()))
            {
                String s2 = (String)iterator2.next();
                builder6 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
                builder6.withValueBackReference("raw_contact_id", 0);
                builder6.withValue("mimetype", "vnd.android.cursor.item/note");
                builder6.withValue("data1", s2);
            }

        }
        if (mPhotoList != null)
        {
            boolean flag = true;
            android.content.ContentProviderOperation.Builder builder5;
            for (Iterator iterator1 = mPhotoList.iterator(); iterator1.hasNext(); arraylist.add(builder5.build()))
            {
                PhotoData photodata = (PhotoData)iterator1.next();
                builder5 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
                builder5.withValueBackReference("raw_contact_id", 0);
                builder5.withValue("mimetype", "vnd.android.cursor.item/photo");
                builder5.withValue("data15", photodata.photoBytes);
                if (flag)
                {
                    builder5.withValue("is_primary", Integer.valueOf(1));
                    flag = false;
                }
            }

        }
        if (mWebsiteList != null)
        {
            android.content.ContentProviderOperation.Builder builder4;
            for (Iterator iterator = mWebsiteList.iterator(); iterator.hasNext(); arraylist.add(builder4.build()))
            {
                String s1 = (String)iterator.next();
                builder4 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
                builder4.withValueBackReference("raw_contact_id", 0);
                builder4.withValue("mimetype", "vnd.android.cursor.item/website");
                builder4.withValue("data1", s1);
                builder4.withValue("data2", Integer.valueOf(4));
            }

        }
        if (!TextUtils.isEmpty(mBirthday))
        {
            android.content.ContentProviderOperation.Builder builder3 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
            builder3.withValueBackReference("raw_contact_id", 0);
            builder3.withValue("mimetype", "vnd.android.cursor.item/contact_event");
            builder3.withValue("data1", mBirthday);
            builder3.withValue("data2", Integer.valueOf(3));
            arraylist.add(builder3.build());
        }
        if (s != null)
        {
            android.content.ContentProviderOperation.Builder builder2 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
            builder2.withValueBackReference("raw_contact_id", 0);
            builder2.withValue("mimetype", "vnd.android.cursor.item/group_membership");
            builder2.withValue("group_sourceid", s);
            arraylist.add(builder2.build());
        }
        try
        {
            contentresolver.applyBatch("com.android.contacts", arraylist);
            return;
        }
        catch (RemoteException remoteexception)
        {
            Object aobj1[] = new Object[2];
            aobj1[0] = remoteexception.toString();
            aobj1[1] = remoteexception.getMessage();
            Log.e("vcard.ContactStruct", String.format("%s: %s", aobj1));
            return;
        }
        catch (OperationApplicationException operationapplicationexception)
        {
            Object aobj[] = new Object[2];
            aobj[0] = operationapplicationexception.toString();
            aobj[1] = operationapplicationexception.getMessage();
            Log.e("vcard.ContactStruct", String.format("%s: %s", aobj));
            return;
        }
    }

    static 
    {
        IM_MAP = new HashMap();
        IM_MAP.put("X-AIM", Integer.valueOf(0));
        IM_MAP.put("X-MSN", Integer.valueOf(1));
        IM_MAP.put("X-YAHOO", Integer.valueOf(2));
        IM_MAP.put("X-ICQ", Integer.valueOf(6));
        IM_MAP.put("X-JABBER", Integer.valueOf(7));
        IM_MAP.put("X-SKYPE-USERNAME", Integer.valueOf(3));
        IM_MAP.put("X-GOOGLE-TALK", Integer.valueOf(5));
        IM_MAP.put("X-GOOGLE TALK", Integer.valueOf(5));
    }
}
