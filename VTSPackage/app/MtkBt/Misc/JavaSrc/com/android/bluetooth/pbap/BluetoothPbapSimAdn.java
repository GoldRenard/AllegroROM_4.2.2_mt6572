// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.bluetooth.pbap;

import android.content.*;
import android.database.Cursor;
import android.net.Uri;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.text.TextUtils;
import android.util.Log;
import com.android.internal.telephony.AdnRecord;
import com.android.internal.telephony.ITelephony;
import com.android.vcard.VCardBuilder;
import com.mediatek.telephony.TelephonyManagerEx;
import java.util.*;

// Referenced classes of package com.android.bluetooth.pbap:
//            BluetoothPbapWriter

public class BluetoothPbapSimAdn
{
    public class AdnComparator
        implements Comparator
    {

        private final String mEmpty = "";
        final BluetoothPbapSimAdn this$0;

        public int compare(AdnRecord adnrecord, AdnRecord adnrecord1)
        {
            String s = adnrecord.getAlphaTag();
            String s1 = adnrecord1.getAlphaTag();
            if (s == null)
                s = "";
            if (s1 == null)
                s1 = "";
            return s.compareToIgnoreCase(s1);
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((AdnRecord)obj, (AdnRecord)obj1);
        }

        public AdnComparator()
        {
            this$0 = BluetoothPbapSimAdn.this;
            super();
        }
    }


    public static final boolean DEBUG = true;
    static final Uri ICC_URI = Uri.parse("content://icc/adn/");
    static final Uri ICC_URI1 = Uri.parse("content://icc/adn1/");
    static final Uri ICC_URI2 = Uri.parse("content://icc/adn2/");
    static final Uri ICC_USIM1_URI = Uri.parse("content://icc/pbr1/");
    static final Uri ICC_USIM2_URI = Uri.parse("content://icc/pbr2/");
    static final Uri ICC_USIM_URI = Uri.parse("content://icc/pbr");
    private static final String TAG = "BluetoothPbapSimAdn";
    private Context mContext;
    private int mErrCode;
    private List mListAdn;
    private final ITelephony mTel = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
    private String mVCardPath;

    public BluetoothPbapSimAdn(Context context)
    {
        mVCardPath = null;
        mContext = null;
        mListAdn = null;
        mErrCode = 160;
        mContext = context;
    }

    private void appendEmails(AdnRecord adnrecord, List list)
    {
        String as[] = adnrecord.getEmails();
        if (list != null && as != null)
        {
            int i = as.length;
            for (int j = 0; j < i; j++)
            {
                String s = as[j];
                if (!TextUtils.isEmpty(s))
                {
                    ContentValues contentvalues = new ContentValues(1);
                    contentvalues.put("data1", s);
                    list.add(contentvalues);
                }
            }

        }
    }

    private void appendName(AdnRecord adnrecord, List list)
    {
        String s = adnrecord.getAlphaTag();
        if (list != null)
        {
            if (s == null)
                s = "";
            log((new StringBuilder()).append("appendName : name=").append(s).toString());
            ContentValues contentvalues = new ContentValues(1);
            contentvalues.put("data1", s);
            list.add(contentvalues);
        }
    }

    private void appendNumber(AdnRecord adnrecord, List list)
    {
        String s = adnrecord.getNumber();
        if (list != null && !TextUtils.isEmpty(s))
        {
            ContentValues contentvalues = new ContentValues(2);
            contentvalues.put("data1", s);
            log((new StringBuilder()).append("appendNumber : number=").append(s).toString());
            contentvalues.put("is_primary", Integer.valueOf(1));
            list.add(contentvalues);
            String s1 = adnrecord.getAdditionalNumber();
            if (!TextUtils.isEmpty(s1))
            {
                log((new StringBuilder()).append("Put additional number = ").append(s1).toString());
                ContentValues contentvalues1 = new ContentValues(1);
                contentvalues1.put("data1", s1);
                list.add(contentvalues1);
            }
        }
    }

    private void errorLog(String s)
    {
        Log.e("BluetoothPbapSimAdn", s);
    }

    private int getDefaultSIM()
    {
        int i;
        i = (int)android.provider.Settings.System.getLong(mContext.getContentResolver(), "voice_call_sim_setting", -5L);
        log((new StringBuilder()).append("getDefaultSIM : SIM ID=").append(i).toString());
        if ((long)i != -5L && (long)i != -1L)
            break MISSING_BLOCK_LABEL_117;
        log("No default SIM, get first inserted SIM");
        if (!mTel.isSimInsert(0))
            break MISSING_BLOCK_LABEL_85;
        log("getDefaultSim is sim1");
        return 0;
        if (!mTel.isSimInsert(1))
            break MISSING_BLOCK_LABEL_106;
        log("getDefaultSim is sim2");
        return 1;
        try
        {
            log("getDefaultSim is no sim");
        }
        catch (RemoteException remoteexception)
        {
            return 0;
        }
        return 0;
        int j = android.provider.Telephony.SIMInfo.getSlotById(mContext, i);
        log((new StringBuilder()).append("getDefaultSIM : slot ID=").append(j).toString());
        return j;
    }

    private String getOwnerRecord(VCardBuilder vcardbuilder)
    {
        TelephonyManagerEx telephonymanagerex = TelephonyManagerEx.getDefault();
        int i = getDefaultSIM();
        ContentValues contentvalues = new ContentValues();
        ArrayList arraylist = new ArrayList(1);
        String s = telephonymanagerex.getLine1AlphaTag(i);
        if (s == null)
            s = "";
        String s1 = telephonymanagerex.getLine1Number(i);
        if (s1 == null)
            s1 = "";
        log((new StringBuilder()).append("getOwnerRecord : name=").append(s).append(", number=").append(s1).toString());
        vcardbuilder.clear();
        contentvalues.put("data1", s);
        arraylist.add(contentvalues);
        vcardbuilder.appendNameProperties(arraylist);
        if (!TextUtils.isEmpty(s1))
        {
            ContentValues contentvalues1 = new ContentValues();
            contentvalues1.put("data1", s1);
            contentvalues1.put("data2", Integer.valueOf(2));
            contentvalues1.put("is_primary", Integer.valueOf(1));
            arraylist.add(contentvalues1);
            vcardbuilder.appendPhones(arraylist, null);
        }
        return vcardbuilder.toString();
    }

    private Uri getSIMUri()
    {
        int i;
        Uri uri;
        try
        {
            i = getDefaultSIM();
            if (mTel == null || !mTel.getIccCardTypeGemini(i).equals("USIM"))
                break MISSING_BLOCK_LABEL_44;
        }
        catch (RemoteException remoteexception)
        {
            mErrCode = 196;
            log((new StringBuilder()).append("getSIMUri : caught exception ").append(remoteexception.toString()).toString());
            return null;
        }
        if (i != 1)
            break MISSING_BLOCK_LABEL_40;
        return ICC_USIM2_URI;
        return ICC_USIM1_URI;
        if (i != 1)
            break MISSING_BLOCK_LABEL_53;
        return ICC_URI2;
        uri = ICC_URI1;
        return uri;
    }

    private void listSIMColumns()
    {
        Uri uri;
        Cursor cursor;
        uri = getSIMUri();
        cursor = null;
        if (uri == null) goto _L2; else goto _L1
_L1:
        cursor = mContext.getContentResolver().query(uri, null, null, null, null);
        if (cursor != null) goto _L4; else goto _L3
_L3:
        log("listSIMColumns : query SIM failed");
_L2:
        if (cursor != null)
            cursor.close();
        return;
_L4:
        int i;
        i = cursor.getColumnCount();
        log((new StringBuilder()).append("listSIMColumns : column count = ").append(cursor.getColumnCount()).toString());
        int j = 0;
_L6:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        log((new StringBuilder()).append("column ").append(j).append(" : ").append(cursor.getColumnName(j)).toString());
        j++;
        if (true) goto _L6; else goto _L5
_L5:
        if (true) goto _L2; else goto _L7
_L7:
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
    }

    private void log(String s)
    {
        Log.d("BluetoothPbapSimAdn", s);
    }

    public int composeVCard(boolean flag, int i, int j, boolean flag1, boolean flag2)
    {
        char c = '\240';
        log("composeVCard");
        BluetoothPbapWriter bluetoothpbapwriter = new BluetoothPbapWriter();
        bluetoothpbapwriter.init(mContext);
        int k;
        if (flag)
            k = 0xc0000000;
        else
            k = 0xc0000001;
        VCardBuilder vcardbuilder = new VCardBuilder(k, "UTF-8");
        if (flag2)
            if (i == 0)
            {
                if (j > 0)
                {
                    bluetoothpbapwriter.write(getOwnerRecord(vcardbuilder));
                    j--;
                }
            } else
            {
                i--;
            }
        log((new StringBuilder()).append("listOffset=").append(i).append(", maxListCount = ").append(j).toString());
        if (mListAdn != null)
        {
            log((new StringBuilder()).append("mListAdn.size = ").append(mListAdn.size()).toString());
            if (mListAdn.size() > i)
            {
                ListIterator listiterator = mListAdn.listIterator(i);
                LinkedList linkedlist = new LinkedList();
                if (j > mListAdn.size() - i)
                    j = mListAdn.size() - i;
                for (; j > 0 && listiterator.hasNext(); j--)
                {
                    AdnRecord adnrecord = (AdnRecord)listiterator.next();
                    vcardbuilder.clear();
                    appendName(adnrecord, linkedlist);
                    vcardbuilder.appendNameProperties(linkedlist);
                    linkedlist.clear();
                    appendNumber(adnrecord, linkedlist);
                    vcardbuilder.appendPhones(linkedlist, null);
                    linkedlist.clear();
                    if (flag1)
                    {
                        appendEmails(adnrecord, linkedlist);
                        vcardbuilder.appendEmails(linkedlist);
                        linkedlist.clear();
                    }
                    bluetoothpbapwriter.write(vcardbuilder.toString());
                }

            } else
            {
                c = '\304';
            }
        } else
        {
            c = '\320';
        }
        mVCardPath = bluetoothpbapwriter.getPath();
        bluetoothpbapwriter.terminate();
        return c;
    }

    public List getAdnList()
    {
        return mListAdn;
    }

    public int getCount()
    {
        if (mListAdn != null)
            return mListAdn.size();
        else
            return 0;
    }

    public int getLastError()
    {
        return mErrCode;
    }

    public String getOwnerName()
    {
        TelephonyManagerEx telephonymanagerex = TelephonyManagerEx.getDefault();
        int i = getDefaultSIM();
        String s = telephonymanagerex.getLine1AlphaTag(i);
        if (TextUtils.isEmpty(s))
            s = telephonymanagerex.getLine1Number(i);
        if (s == null)
            s = "";
        return s;
    }

    public String getVCardFilePath()
    {
        return mVCardPath;
    }

    public void searchAdn(String s, boolean flag)
    {
        if (s != null && mListAdn != null)
        {
            ListIterator listiterator = mListAdn.listIterator(0);
            if (listiterator != null)
                if (!flag)
                {
                    String s2 = s.toUpperCase();
                    do
                    {
                        if (!listiterator.hasNext())
                            break;
                        String s3 = ((AdnRecord)listiterator.next()).getAlphaTag();
                        if (s3 == null || !s3.toUpperCase().contains(s2))
                            listiterator.remove();
                    } while (true);
                } else
                {
                    do
                    {
                        if (!listiterator.hasNext())
                            break;
                        String s1 = ((AdnRecord)listiterator.next()).getNumber();
                        if (s1 == null || !s1.toUpperCase().contains(s))
                            listiterator.remove();
                    } while (true);
                }
        }
    }

    public void sortAdn()
    {
        if (mListAdn != null)
            Collections.sort(mListAdn, new AdnComparator());
    }

    public boolean updateAdn()
    {
        Cursor cursor;
        Uri uri;
        cursor = null;
        mErrCode = 160;
        uri = getSIMUri();
        if (uri != null) goto _L2; else goto _L1
_L1:
        boolean flag = false;
_L5:
        return flag;
_L2:
        log((new StringBuilder()).append("uri=").append(uri.toString()).toString());
        cursor = mContext.getContentResolver().query(uri, null, null, null, null);
        if (cursor == null)
            break MISSING_BLOCK_LABEL_489;
        int j;
        int k;
        int l;
        int i1;
        int j1;
        int k1;
        int i = cursor.getCount();
        log((new StringBuilder()).append("ADN count == ").append(i).toString());
        j = cursor.getColumnIndex("index");
        k = cursor.getColumnIndex("name");
        l = cursor.getColumnIndex("number");
        i1 = cursor.getColumnIndex("emails");
        j1 = cursor.getColumnIndex("additionalNumber");
        k1 = cursor.getColumnIndex("groupIds");
        mListAdn = new LinkedList();
        cursor.moveToFirst();
_L3:
        String s;
        boolean flag1;
        if (cursor.isAfterLast())
            break; /* Loop/switch isn't completed */
        log((new StringBuilder()).append("cursor.getString(name) = ").append(cursor.getString(k)).toString());
        log((new StringBuilder()).append("cursor.getString(number) = ").append(cursor.getString(l)).toString());
        log((new StringBuilder()).append("cursor.getString(emailsColIdx) = ").append(cursor.getString(i1)).toString());
        log((new StringBuilder()).append("cursor.getString(additionalNumber) = ").append(cursor.getString(j1)).toString());
        log((new StringBuilder()).append("cursor.getString(groupIds) = ").append(cursor.getString(k1)).toString());
        s = cursor.getString(i1);
        flag1 = TextUtils.isEmpty(s);
        String as[];
        as = null;
        if (flag1)
            break MISSING_BLOCK_LABEL_413;
        as = s.split(",");
        log((new StringBuilder()).append("emails.length = ").append(as.length).toString());
        mListAdn.add(new AdnRecord(0, cursor.getInt(j), cursor.getString(k), cursor.getString(l), cursor.getString(j1), as, null));
        cursor.moveToNext();
          goto _L3
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
        mErrCode = 195;
        errorLog("query ADN failed.");
        flag = false;
        if (cursor != null)
        {
            cursor.close();
            return false;
        }
        if (true) goto _L5; else goto _L4
_L4:
        flag = true;
        if (cursor != null)
        {
            cursor.close();
            return flag;
        }
        if (true) goto _L5; else goto _L6
_L6:
    }

}
