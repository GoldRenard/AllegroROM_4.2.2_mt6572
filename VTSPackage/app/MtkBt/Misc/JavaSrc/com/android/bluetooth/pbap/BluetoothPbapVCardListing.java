// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.bluetooth.pbap;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import java.util.ArrayList;
import java.util.HashSet;

// Referenced classes of package com.android.bluetooth.pbap:
//            BluetoothPbapSimAdn, BluetoothPbapWriter

public class BluetoothPbapVCardListing
{

    public static final boolean DEBUG = true;
    private static final String PB_NAME_PROJECTION[] = {
        "display_name"
    };
    static final String PB_NUMBER_PROJECTION[] = {
        "contact_id", "display_name"
    };
    private static final String PB_PROJECTION[] = {
        "_id", "display_name"
    };
    private static final String TAG = "BluetoothPbapVCardListing";
    private static final String VCARD_LISTING_BEGIN = "<?xml version=\"1.0\"?><!DOCTYPE vcard-listing SYSTEM \"vcard-listing.dtd\"><vCard-listing version=\"1.0\">";
    private static final String VCARD_LISTING_END = "</vCard-listing>";
    public static final int VCARD_ORDER_ALPHA = 0;
    public static final int VCARD_ORDER_DEFAULT = 0;
    public static final int VCARD_ORDER_INDEX = 1;
    public static final int VCARD_ORDER_PHONETICAL = 2;
    public static final int VCARD_SEARCH_DEFAULT = 0;
    public static final int VCARD_SEARCH_NAME = 0;
    public static final int VCARD_SEARCH_NUMBER = 1;
    public static final int VCARD_SEARCH_SOUND = 2;
    private Context mContext;
    private Cursor mCursor;
    private boolean mDirty;
    private Long mIDList[];
    private boolean mIOTSolutionOn;
    private String mLocalName;
    private String mLocalNum;
    private String mResultPath;
    private int mSearchAttrib;
    private String mSearchValue;
    private BluetoothPbapSimAdn mSimAdn;
    private boolean mSimDirty;
    private Long mSimIDList[];
    private BluetoothPbapWriter mWriter;

    public BluetoothPbapVCardListing(Context context, String s, String s1, boolean flag)
    {
        mLocalName = null;
        mLocalNum = null;
        mCursor = null;
        mContext = null;
        mWriter = null;
        mResultPath = null;
        mDirty = true;
        mIDList = null;
        mSimDirty = true;
        mSimIDList = null;
        mSearchAttrib = 0;
        mSearchValue = null;
        mSimAdn = null;
        mIOTSolutionOn = false;
        printLog((new StringBuilder()).append("BluetoothPbapVCardListing : localName=").append(s).append(", localNum=").append(s1).toString());
        mLocalName = s;
        mLocalNum = s1;
        mContext = context;
        mSimAdn = new BluetoothPbapSimAdn(context);
        mIOTSolutionOn = flag;
    }

    private void errorLog(String s)
    {
        Log.e("BluetoothPbapVCardListing", s);
    }

    private String genIDList(int i, int j)
    {
        Long along[] = mIDList;
        String s = null;
        if (along != null)
        {
            int k = mIDList.length;
            int l = i + j;
            s = null;
            if (k >= l)
            {
                String s1 = new String("(");
                for (int i1 = 0; i1 < j; i1++)
                {
                    String s2 = (new StringBuilder()).append(s1).append(mIDList[i1 + i]).toString();
                    s1 = (new StringBuilder()).append(s2).append(",").toString();
                }

                if (s1.charAt(-1 + s1.length()) == ',')
                    s1 = s1.substring(0, -1 + s1.length());
                s = (new StringBuilder()).append(s1).append(")").toString();
            }
        }
        printLog((new StringBuilder()).append("[API] genIDList(").append(i).append(",").append(j).append(") = ").append(s).toString());
        return s;
    }

    private String genSimIDList(int i, int j)
    {
        Long along[] = mSimIDList;
        String s = null;
        if (along != null)
        {
            int k = mSimIDList.length;
            int l = i + j;
            s = null;
            if (k >= l)
            {
                String s1 = new String("(");
                for (int i1 = 0; i1 < j; i1++)
                {
                    String s2 = (new StringBuilder()).append(s1).append(mSimIDList[i1 + i]).toString();
                    s1 = (new StringBuilder()).append(s2).append(",").toString();
                }

                if (s1.charAt(-1 + s1.length()) == ',')
                    s1 = s1.substring(0, -1 + s1.length());
                s = (new StringBuilder()).append(s1).append(")").toString();
            }
        }
        printLog((new StringBuilder()).append("[API] genSimIDList(").append(i).append(",").append(j).append(") = ").append(s).toString());
        return s;
    }

    private String getOwnerName()
    {
        if (!TextUtils.isEmpty(mLocalName))
            return mLocalName;
        if (!TextUtils.isEmpty(mLocalNum))
        {
            return mLocalNum;
        } else
        {
            printLog((new StringBuilder()).append("getOwnerName : name=").append(mLocalName).append(", num=").append(mLocalNum).toString());
            return new String("");
        }
    }

    private boolean isSameAttribute(int i, String s)
    {
        boolean flag = true;
        if ((!TextUtils.isEmpty(s) || !TextUtils.isEmpty(mSearchValue)) && (i != mSearchAttrib || !TextUtils.equals(s, mSearchValue)))
            flag = false;
        return flag;
    }

    private int listCallLog(int i, int j, int k, int l, String s, ArrayList arraylist)
    {
        char c;
        Uri uri;
        Cursor cursor;
        String as[];
        String s1;
        c = '\240';
        uri = android.provider.CallLog.Calls.CONTENT_URI;
        cursor = null;
        as = (new String[] {
            "name", "number"
        });
        printLog("[API] listCallLog");
        s1 = null;
        i;
        JVM INSTR tableswitch 1 4: default 68
    //                   1 76
    //                   2 262
    //                   3 269
    //                   4 80;
           goto _L1 _L2 _L3 _L4 _L5
_L5:
        break; /* Loop/switch isn't completed */
_L1:
        char c1 = '\300';
_L17:
        return c1;
_L2:
        s1 = "type=1";
_L10:
        if (!TextUtils.isEmpty(s))
        {
            int i1;
            String s3;
            if (s1 != null)
                s3 = (new StringBuilder()).append(s1).append(" AND ").toString();
            else
                s3 = new String();
            if (l != 1)
                s1 = (new StringBuilder()).append(s3).append("name LIKE '%").append(s).append("%'").toString();
            else
                s1 = (new StringBuilder()).append(s3).append("number LIKE '%").append(s).append("%'").toString();
        }
        printLog((new StringBuilder()).append("selection is ").append(s1).toString());
        cursor = mContext.getContentResolver().query(uri, as, s1, null, "date DESC");
        if (cursor == null) goto _L7; else goto _L6
_L6:
        i1 = cursor.getCount();
        printLog((new StringBuilder()).append("callSize==").append(i1).toString());
        if (i1 > j) goto _L9; else goto _L8
_L8:
        c = '\304';
_L12:
        if (cursor != null)
            cursor.close();
        return c;
_L3:
        s1 = "type=2";
          goto _L10
_L4:
        s1 = "type=3";
          goto _L10
_L9:
        cursor.moveToPosition(j);
_L14:
        if (k <= 0) goto _L12; else goto _L11
_L11:
        if (cursor.isAfterLast()) goto _L12; else goto _L13
_L13:
        String s2;
        s2 = cursor.getString(0);
        if (TextUtils.isEmpty(s2))
            s2 = cursor.getString(1);
        if (s2 == null)
            break MISSING_BLOCK_LABEL_401;
        arraylist.add(s2);
_L15:
        cursor.moveToNext();
        k--;
          goto _L14
        arraylist.add(new String());
          goto _L15
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
_L7:
        c1 = '\320';
        if (cursor != null)
        {
            cursor.close();
            return c1;
        }
        if (true) goto _L17; else goto _L16
_L16:
    }

    private int listPb(boolean flag, int i, int j, ArrayList arraylist)
    {
        ContentResolver contentresolver;
        Cursor cursor;
        boolean flag1;
        contentresolver = mContext.getContentResolver();
        cursor = null;
        flag1 = TextUtils.isEmpty(mSearchValue);
        printLog((new StringBuilder()).append("[API] listPb(").append(String.valueOf(flag)).append(",").append(i).append(",").append(j).append(")").toString());
        printLog((new StringBuilder()).append("SearchVal=").append(mSearchValue).append(", mSearchAttrib=").append(mSearchAttrib).toString());
        if (contentresolver != null) goto _L2; else goto _L1
_L1:
        errorLog("[ERR] resolver is null");
        char c;
        c = '\320';
        if (false)
            null.close();
_L20:
        return c;
_L2:
        if (!flag1)
            break MISSING_BLOCK_LABEL_193;
        if (i != 0)
            break MISSING_BLOCK_LABEL_916;
        printLog((new StringBuilder()).append("Add owner name : ").append(getOwnerName()).toString());
        arraylist.add(getOwnerName());
        j--;
        break MISSING_BLOCK_LABEL_916;
_L24:
        if (!flag) goto _L4; else goto _L3
_L3:
        Exception exception;
        String s;
        Uri uri;
        String as[];
        HashSet hashset;
        ArrayList arraylist1;
        int k;
        if (!mIOTSolutionOn)
            s = "indicate_phone_or_sim_contact=-1";
        else
            s = "";
        mIDList = null;
        if (TextUtils.isEmpty(mSearchValue)) goto _L6; else goto _L5
_L5:
        k = mSearchAttrib;
        cursor = null;
        if (k == 1) goto _L8; else goto _L7
_L7:
        uri = Uri.withAppendedPath(android.provider.ContactsContract.Contacts.CONTENT_FILTER_URI, Uri.encode(mSearchValue));
        as = PB_PROJECTION;
_L18:
        printLog((new StringBuilder()).append("selection=").append(s).toString());
        cursor = contentresolver.query(uri, as, s, null, "upper(display_name)");
        if (cursor == null) goto _L10; else goto _L9
_L9:
        printLog((new StringBuilder()).append("get cursor successfully. count=").append(cursor.getCount()).toString());
        cursor.moveToFirst();
        hashset = new HashSet();
        arraylist1 = new ArrayList();
        printLog((new StringBuilder()).append("Retrieve data : listOffset=").append(i).append(", maxListCount=").append(j).toString());
_L17:
        if (cursor.isAfterLast()) goto _L12; else goto _L11
_L11:
        if (!hashset.add(Long.valueOf(cursor.getLong(0)))) goto _L14; else goto _L13
_L13:
        arraylist1.add(Long.valueOf(cursor.getLong(0)));
        if (j <= 0) goto _L14; else goto _L15
_L15:
        if (arraylist1.size() <= i) goto _L14; else goto _L16
_L16:
        printLog((new StringBuilder()).append("Add one record : ").append(cursor.getString(1)).append(",ID:").append(cursor.getLong(0)).toString());
        arraylist.add(cursor.getString(1));
        j--;
_L14:
        cursor.moveToNext();
          goto _L17
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
_L8:
        boolean flag2;
        uri = android.provider.ContactsContract.CommonDataKinds.Phone.CONTENT_URI;
        as = PB_NUMBER_PROJECTION;
        flag2 = mIOTSolutionOn;
        cursor = null;
        if (flag2)
            break MISSING_BLOCK_LABEL_617;
        s = (new StringBuilder()).append(s).append(" AND data1 LIKE '%").append(mSearchValue).append("%'").toString();
          goto _L18
        s = (new StringBuilder()).append(s).append("data1 LIKE '%").append(mSearchValue).append("%'").toString();
          goto _L18
_L6:
        uri = android.provider.ContactsContract.Contacts.CONTENT_URI;
        as = PB_PROJECTION;
          goto _L18
_L12:
        mIDList = (Long[])arraylist1.toArray(new Long[0]);
_L21:
        c = '\240';
        if (cursor == null) goto _L20; else goto _L19
_L19:
        cursor.close();
        return c;
_L10:
        errorLog("Query id list failed");
          goto _L21
_L4:
        if (mIDList.length - i < j)
        {
            if (mIDList.length - i <= 0)
                break MISSING_BLOCK_LABEL_843;
            j = mIDList.length - i;
        }
_L23:
        cursor = null;
        if (j == 0) goto _L21; else goto _L22
_L22:
        String s1 = genIDList(i, j);
        cursor = null;
        if (s1 == null)
            break MISSING_BLOCK_LABEL_898;
        cursor = contentresolver.query(android.provider.ContactsContract.Contacts.CONTENT_URI, PB_NAME_PROJECTION, (new StringBuilder()).append("_id IN ").append(s1).toString(), null, "display_name");
        if (cursor == null)
            break MISSING_BLOCK_LABEL_823;
        int l = cursor.getCount();
        if (l == j)
            break MISSING_BLOCK_LABEL_848;
        c = '\320';
        if (cursor != null)
        {
            cursor.close();
            return c;
        }
          goto _L20
        j = 0;
          goto _L23
        cursor.moveToFirst();
        while (!cursor.isAfterLast()) 
        {
            printLog("Get record!!");
            arraylist.add(cursor.getString(0));
            cursor.moveToNext();
        }
          goto _L21
        c = '\300';
        if (false)
        {
            null.close();
            return c;
        }
          goto _L20
        if (i > 0)
            i--;
          goto _L24
    }

    private int listSimPb(boolean flag, int i, int j, ArrayList arraylist)
    {
        ContentResolver contentresolver;
        Cursor cursor;
        boolean flag1;
        contentresolver = mContext.getContentResolver();
        cursor = null;
        flag1 = TextUtils.isEmpty(mSearchValue);
        printLog((new StringBuilder()).append("[API] listSimPb(").append(String.valueOf(flag)).append(",").append(i).append(",").append(j).append(")").toString());
        printLog((new StringBuilder()).append("SearchVal=").append(mSearchValue).append(", mSearchAttrib=").append(mSearchAttrib).toString());
        if (contentresolver != null) goto _L2; else goto _L1
_L1:
        errorLog("[ERR] resolver is null");
        char c;
        c = '\320';
        if (false)
            null.close();
_L20:
        return c;
_L2:
        if (!flag1)
            break MISSING_BLOCK_LABEL_193;
        if (i != 0)
            break MISSING_BLOCK_LABEL_865;
        printLog((new StringBuilder()).append("Add owner name : ").append(getOwnerName()).toString());
        arraylist.add(getOwnerName());
        j--;
        break MISSING_BLOCK_LABEL_865;
_L24:
        if (!flag) goto _L4; else goto _L3
_L3:
        Exception exception;
        String s;
        Uri uri;
        String as[];
        HashSet hashset;
        ArrayList arraylist1;
        int k;
        if (!mIOTSolutionOn)
            s = "indicate_phone_or_sim_contact>-1";
        else
            s = "in_visible_group=1000";
        mSimIDList = null;
        if (TextUtils.isEmpty(mSearchValue)) goto _L6; else goto _L5
_L5:
        k = mSearchAttrib;
        cursor = null;
        if (k == 1) goto _L8; else goto _L7
_L7:
        uri = Uri.withAppendedPath(android.provider.ContactsContract.Contacts.CONTENT_FILTER_URI, Uri.encode(mSearchValue));
        as = PB_PROJECTION;
_L18:
        printLog((new StringBuilder()).append("selection=").append(s).toString());
        cursor = contentresolver.query(uri, as, s, null, "upper(display_name)");
        if (cursor == null) goto _L10; else goto _L9
_L9:
        printLog((new StringBuilder()).append("get cursor successfully. count=").append(cursor.getCount()).toString());
        cursor.moveToFirst();
        hashset = new HashSet();
        arraylist1 = new ArrayList();
        printLog((new StringBuilder()).append("Retrieve data : listOffset=").append(i).append(", maxListCount=").append(j).toString());
_L17:
        if (cursor.isAfterLast()) goto _L12; else goto _L11
_L11:
        if (!hashset.add(Long.valueOf(cursor.getLong(0)))) goto _L14; else goto _L13
_L13:
        arraylist1.add(Long.valueOf(cursor.getLong(0)));
        if (j <= 0) goto _L14; else goto _L15
_L15:
        if (arraylist1.size() <= i) goto _L14; else goto _L16
_L16:
        printLog((new StringBuilder()).append("Add one record : ").append(cursor.getString(1)).append(",ID:").append(cursor.getLong(0)).toString());
        arraylist.add(cursor.getString(1));
        j--;
_L14:
        cursor.moveToNext();
          goto _L17
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
_L8:
        uri = android.provider.ContactsContract.CommonDataKinds.Phone.CONTENT_URI;
        as = PB_NUMBER_PROJECTION;
        s = (new StringBuilder()).append(s).append(" AND data1 LIKE '%").append(mSearchValue).append("%'").toString();
          goto _L18
_L6:
        uri = android.provider.ContactsContract.Contacts.CONTENT_URI;
        as = PB_PROJECTION;
          goto _L18
_L12:
        mSimIDList = (Long[])arraylist1.toArray(new Long[0]);
_L21:
        c = '\240';
        if (cursor == null) goto _L20; else goto _L19
_L19:
        cursor.close();
        return c;
_L10:
        errorLog("Query id list failed");
          goto _L21
_L4:
        if (mSimIDList.length - i < j)
        {
            if (mSimIDList.length - i <= 0)
                break MISSING_BLOCK_LABEL_792;
            j = mSimIDList.length - i;
        }
_L23:
        cursor = null;
        if (j == 0) goto _L21; else goto _L22
_L22:
        String s1 = genSimIDList(i, j);
        cursor = null;
        if (s1 == null)
            break MISSING_BLOCK_LABEL_847;
        cursor = contentresolver.query(android.provider.ContactsContract.Contacts.CONTENT_URI, PB_NAME_PROJECTION, (new StringBuilder()).append("_id IN ").append(s1).toString(), null, "display_name");
        if (cursor == null)
            break MISSING_BLOCK_LABEL_772;
        int l = cursor.getCount();
        if (l == j)
            break MISSING_BLOCK_LABEL_797;
        c = '\320';
        if (cursor != null)
        {
            cursor.close();
            return c;
        }
          goto _L20
        j = 0;
          goto _L23
        cursor.moveToFirst();
        while (!cursor.isAfterLast()) 
        {
            printLog("Get record!!");
            arraylist.add(cursor.getString(0));
            cursor.moveToNext();
        }
          goto _L21
        c = '\300';
        if (false)
        {
            null.close();
            return c;
        }
          goto _L20
        if (i > 0)
            i--;
          goto _L24
    }

    private boolean openWriter()
    {
        boolean flag = true;
        printLog("[API] openWriter");
        if (mWriter != null)
            mWriter.terminate();
        else
            mWriter = new BluetoothPbapWriter();
        if (mWriter != null)
        {
            if (!mWriter.init(mContext))
            {
                mWriter = null;
                flag = false;
            }
        } else
        {
            flag = false;
        }
        if (!flag)
            errorLog("Failed to open PbapWriter");
        return flag;
    }

    private void printLog(String s)
    {
        Log.d("BluetoothPbapVCardListing", s);
    }

    public String getPath()
    {
        return mResultPath;
    }

    public int list(int i, int j, int k, String s, int l, int i1)
    {
        int j1 = 1;
        printLog((new StringBuilder()).append("init(").append(i).append(",").append(j).append(",").append(k).append(",").append(s).append(",").append(l).append(",").append(i1).append(")").toString());
        if (!openWriter())
            return 208;
        ArrayList arraylist = new ArrayList();
        if (arraylist == null)
        {
            errorLog("Alloc result failed");
            return 208;
        }
        int k1;
        switch (i)
        {
        case 5: // '\005'
            if (TextUtils.isEmpty(s))
                j1 = 0;
            if (!mSimDirty && isSameAttribute(k, s))
            {
                k1 = listSimPb(false, l, i1, arraylist);
            } else
            {
                mSearchAttrib = k;
                mSearchValue = s;
                k1 = listSimPb(true, l, i1, arraylist);
                if (k1 == 160)
                    mSimDirty = false;
                else
                    mSimDirty = true;
            }
            break;

        case 1: // '\001'
        case 2: // '\002'
        case 3: // '\003'
        case 4: // '\004'
            k1 = listCallLog(i, l, i1, k, s, arraylist);
            break;

        case 0: // '\0'
            if (TextUtils.isEmpty(s))
                j1 = 0;
            if (!mDirty && isSameAttribute(k, s))
            {
                k1 = listPb(false, l, i1, arraylist);
            } else
            {
                mSearchAttrib = k;
                mSearchValue = s;
                k1 = listPb(true, l, i1, arraylist);
                if (k1 == 160)
                    mDirty = false;
                else
                    mDirty = true;
            }
            break;

        default:
            errorLog((new StringBuilder()).append("unsupported type=").append(i).toString());
            k1 = 192;
            break;
        }
        if (mWriter == null)
            k1 = 208;
        else
        if (k1 == 160)
        {
            boolean flag = mWriter.write("<?xml version=\"1.0\"?><!DOCTYPE vcard-listing SYSTEM \"vcard-listing.dtd\"><vCard-listing version=\"1.0\">");
            for (int l1 = 0; flag && l1 < arraylist.size(); l1++)
                flag = mWriter.write((new StringBuilder()).append("<card handle=\"").append(j1 + (l + l1)).append(".vcf\" name=\"").append((String)arraylist.get(l1)).append("\"").append("/>").toString());

            if (flag)
                flag = mWriter.write("</vCard-listing>");
            mWriter.terminate();
            if (flag)
                mResultPath = mWriter.getPath();
            else
                k1 = 208;
        } else
        {
            mWriter.terminate();
        }
        mWriter = null;
        return k1;
    }

    public long queryPbID(int i)
    {
        printLog((new StringBuilder()).append("[API] queryPbID(").append(i).append(")").toString());
        if (mDirty)
            listPb(true, 1, 0, null);
        if (mIDList != null && mIDList.length > i)
            return mIDList[i].longValue();
        StringBuilder stringbuilder = (new StringBuilder()).append("ERR] can not found id for index ").append(i).append(". mIDList.length = ");
        Long along[] = mIDList;
        int j = 0;
        if (along != null)
            j = mIDList.length;
        errorLog(stringbuilder.append(j).toString());
        return -1L;
    }

    public long querySimPbID(int i)
    {
        printLog((new StringBuilder()).append("[API] querySimPbID(").append(i).append(")").toString());
        if (mSimDirty)
            listSimPb(true, 1, 0, null);
        if (mSimIDList != null && mSimIDList.length > i)
            return mSimIDList[i].longValue();
        StringBuilder stringbuilder = (new StringBuilder()).append("ERR] can not found id for index ").append(i).append(". mSimIDList.length = ");
        Long along[] = mSimIDList;
        int j = 0;
        if (along != null)
            j = mSimIDList.length;
        errorLog(stringbuilder.append(j).toString());
        return -1L;
    }

}
