// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.gemini;

import android.content.*;
import android.database.Cursor;
import android.net.Uri;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.mediatek.gemini:
//            GeminiSIMTetherItem

public class GeminiSIMTetherMamager
{

    private static final int BGCOLOR_SIM_ABSENT = 10;
    public static final String COLUMN_DISPLAY_NAME = "display_name";
    public static final String COLUMN_ID = "_id";
    public static final String COLUMN_MIME_TYPE = "mimetype";
    public static final String COLUMN_PHONE_NUM = "data1";
    public static final String COLUMN_PHONE_NUM_TYPE = "data2";
    public static final String COLUMN_SIM_ID = "sim_id";
    public static final String COLUMN_SIM_SOURCE_TYPE = "indicate_phone_or_sim_contact";
    public static final Uri GEMINI_TETHER_URI;
    public static final String PHONE_NUM_MIME_TYPE = "vnd.android.cursor.item/phone_v2";
    private static final String TAG = "GeminiSIMTetherManager";
    private static Context sContext;
    private static GeminiSIMTetherMamager sManager;
    private static HashMap sSimInfoMap = new HashMap();
    private String mCurrSIMID;
    private String mDataColumnArr[] = {
        "_id", "display_name", "data1", "data2", "sim_id"
    };

    private GeminiSIMTetherMamager(Context context)
    {
        mCurrSIMID = "1";
        sContext = context;
    }

    public static GeminiSIMTetherMamager getInstance(Context context)
    {
        if (sManager == null)
            sManager = new GeminiSIMTetherMamager(context);
        sContext = context;
        return sManager;
    }

    public ArrayList getAllContactData()
    {
        String as[];
        Cursor cursor;
        ArrayList arraylist;
        Xlog.i("GeminiSIMTetherManager", "getAllContactData(), begin");
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(sContext);
        as = new String[0];
        if (list != null && list.size() > 0)
        {
            int l = list.size();
            Xlog.i("GeminiSIMTetherManager", (new StringBuilder()).append("current inserted sim num = ").append(l).toString());
            as = new String[l];
            for (int i1 = 0; i1 < list.size(); i1++)
            {
                long l1 = ((android.provider.Telephony.SIMInfo)list.get(i1)).mSimId;
                Xlog.i("GeminiSIMTetherManager", (new StringBuilder()).append("Inserted sim id at ").append(i1).append(" is ").append(l1).toString());
                as[i1] = String.valueOf(l1);
            }

        }
        cursor = null;
        arraylist = new ArrayList();
        Xlog.i("GeminiSIMTetherManager", "getAllContactData(), get all contact cursor begin");
        cursor = sContext.getContentResolver().query(GEMINI_TETHER_URI, null, "mimetype='vnd.android.cursor.item/phone_v2' and sim_id='-1' and indicate_phone_or_sim_contact < 0", null, "display_name asc");
        Xlog.i("GeminiSIMTetherManager", "getAllContactData(), get all contact cursor end");
        sSimInfoMap.clear();
        if (cursor == null) goto _L2; else goto _L1
_L1:
        cursor.moveToFirst();
        Xlog.i("GeminiSIMTetherManager", "getAllContactData(), loop cursor begin");
_L5:
        if (cursor.isAfterLast()) goto _L4; else goto _L3
_L3:
        String s;
        int i;
        s = "";
        i = -1;
        String s1 = cursor.getString(cursor.getColumnIndex("display_name"));
        if (s1 == null)
            break MISSING_BLOCK_LABEL_279;
        if (!s1.equals(""))
            break MISSING_BLOCK_LABEL_307;
        cursor.moveToNext();
          goto _L5
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
        GeminiSIMTetherItem geminisimtetheritem;
        String s3;
        geminisimtetheritem = new GeminiSIMTetherItem();
        geminisimtetheritem.setContactId(cursor.getInt(cursor.getColumnIndex("_id")));
        geminisimtetheritem.setName(s1);
        int j = cursor.getInt(cursor.getColumnIndex("data2"));
        String s2 = android.provider.ContactsContract.CommonDataKinds.Phone.getTypeLabel(sContext.getResources(), j, null).toString();
        geminisimtetheritem.setPhoneNum((new StringBuilder()).append(s2).append(": ").append(cursor.getString(cursor.getColumnIndex("data1"))).toString());
        s3 = cursor.getString(cursor.getColumnIndex("sim_id"));
        if (s3 == null) goto _L7; else goto _L6
_L6:
        if (s3.equals("")) goto _L7; else goto _L8
_L8:
        if (!sSimInfoMap.containsKey(s3)) goto _L10; else goto _L9
_L9:
        android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)sSimInfoMap.get(s3);
_L16:
        if (siminfo == null) goto _L7; else goto _L11
_L11:
        s = siminfo.mDisplayName;
        i = 10;
        if (as == null) goto _L7; else goto _L12
_L12:
        if (as.length <= 0) goto _L7; else goto _L13
_L13:
        int k = 0;
_L18:
        if (k < as.length)
        {
            if (!s3.equals(as[k]))
                break MISSING_BLOCK_LABEL_730;
            i = siminfo.mColor;
        }
_L7:
        if (mCurrSIMID == null || !mCurrSIMID.equals(s3)) goto _L15; else goto _L14
_L14:
        geminisimtetheritem.setCheckedStatus(1);
_L17:
        geminisimtetheritem.setSimName(s);
        geminisimtetheritem.setSimColor(i);
        if (geminisimtetheritem.getCheckedStatus() == 0)
            arraylist.add(geminisimtetheritem);
        cursor.moveToNext();
          goto _L5
        IllegalStateException illegalstateexception;
        illegalstateexception;
        Xlog.d("GeminiSIMTetherManager", "getAllContactData---java.lang.IllegalStateException happen");
        cursor.close();
        cursor = sContext.getContentResolver().query(GEMINI_TETHER_URI, null, "mimetype='vnd.android.cursor.item/phone_v2' and sim_id='-1' and indicate_phone_or_sim_contact < 0", null, "display_name asc");
        sSimInfoMap.clear();
        arraylist.clear();
        cursor.moveToFirst();
          goto _L5
_L10:
        siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(sContext, Integer.parseInt(s3));
        sSimInfoMap.put(s3, siminfo);
          goto _L16
_L15:
        geminisimtetheritem.setCheckedStatus(0);
          goto _L17
_L4:
        Xlog.i("GeminiSIMTetherManager", "getAllContactData(), loop cursor end");
_L2:
        if (cursor != null)
            cursor.close();
        Xlog.i("GeminiSIMTetherManager", "getAllContactData(), end");
        return arraylist;
        k++;
          goto _L18
    }

    public String getCurrSIMID()
    {
        return mCurrSIMID;
    }

    public ArrayList getCurrSimData()
    {
        String s;
        int i;
        Cursor cursor;
        ArrayList arraylist;
        String s1;
        String s2;
        Xlog.i("GeminiSIMTetherManager", "getCurrSimData() begin");
        s = "";
        i = -1;
        cursor = null;
        sSimInfoMap.clear();
        android.provider.Telephony.SIMInfo siminfo;
        Exception exception;
        if (sSimInfoMap.containsKey(mCurrSIMID))
        {
            siminfo = (android.provider.Telephony.SIMInfo)sSimInfoMap.get(mCurrSIMID);
        } else
        {
            siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(sContext, Integer.parseInt(mCurrSIMID));
            sSimInfoMap.put(mCurrSIMID, siminfo);
        }
        if (siminfo != null)
        {
            s = siminfo.mDisplayName;
            i = siminfo.mColor;
        }
        arraylist = new ArrayList();
        s1 = (new StringBuilder()).append("mimetype='vnd.android.cursor.item/phone_v2' and sim_id='").append(mCurrSIMID).append("' and ").append("indicate_phone_or_sim_contact").append(" < 0").toString();
        Xlog.i("GeminiSIMTetherManager", (new StringBuilder()).append("query data from data table, uri=").append(GEMINI_TETHER_URI).toString());
        cursor = sContext.getContentResolver().query(GEMINI_TETHER_URI, null, s1, null, "display_name asc");
        if (cursor == null)
            break MISSING_BLOCK_LABEL_490;
        cursor.moveToFirst();
_L1:
        if (cursor.isAfterLast())
            break MISSING_BLOCK_LABEL_490;
        s2 = cursor.getString(cursor.getColumnIndex("display_name"));
        if (s2 == null)
            break MISSING_BLOCK_LABEL_223;
        if (!s2.equals(""))
            break MISSING_BLOCK_LABEL_283;
        cursor.moveToNext();
          goto _L1
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
        GeminiSIMTetherItem geminisimtetheritem = new GeminiSIMTetherItem();
        geminisimtetheritem.setContactId(cursor.getInt(cursor.getColumnIndex("_id")));
        geminisimtetheritem.setName(s2);
        int j = cursor.getInt(cursor.getColumnIndex("data2"));
        String s3 = android.provider.ContactsContract.CommonDataKinds.Phone.getTypeLabel(sContext.getResources(), j, null).toString();
        geminisimtetheritem.setPhoneNum((new StringBuilder()).append(s3).append(": ").append(cursor.getString(cursor.getColumnIndex("data1"))).toString());
        geminisimtetheritem.setSimName(s);
        geminisimtetheritem.setSimColor(i);
        geminisimtetheritem.setCheckedStatus(0);
        arraylist.add(geminisimtetheritem);
        cursor.moveToNext();
          goto _L1
        IllegalStateException illegalstateexception;
        illegalstateexception;
        Xlog.d("GeminiSIMTetherManager", "getCurrSimData---java.lang.IllegalStateException happen");
        cursor.close();
        cursor = sContext.getContentResolver().query(GEMINI_TETHER_URI, null, s1, null, "display_name asc");
        cursor.moveToFirst();
        arraylist.clear();
          goto _L1
        if (cursor != null)
            cursor.close();
        Xlog.i("GeminiSIMTetherManager", (new StringBuilder()).append("==getCurrSimData== size=").append(arraylist.size()).toString());
        return arraylist;
    }

    public int getTotalContactNum()
    {
        Cursor cursor;
        Xlog.i("GeminiSIMTetherManager", "getTotalContactNum(), begin");
        cursor = null;
        int i;
        cursor = sContext.getContentResolver().query(GEMINI_TETHER_URI, null, "mimetype='vnd.android.cursor.item/phone_v2' and indicate_phone_or_sim_contact < 0", null, "display_name asc");
        i = cursor.getCount();
        cursor.close();
        Xlog.i("GeminiSIMTetherManager", (new StringBuilder()).append("getTotalContactNum() = ").append(i).toString());
        return i;
        Exception exception;
        exception;
        cursor.close();
        throw exception;
    }

    public void setCurrSIMID(String s)
    {
        mCurrSIMID = s;
    }

    public void setCurrTetheredNum(ArrayList arraylist, boolean flag)
    {
        Xlog.i("GeminiSIMTetherManager", "setCurrTetheredNum(), begin");
        String s = (new StringBuilder()).append("mimetype='vnd.android.cursor.item/phone_v2' and sim_id= '").append(mCurrSIMID).append("'").toString();
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("sim_id", "-1");
        if (flag)
        {
            Xlog.i("GeminiSIMTetherManager", "setCurrTetheredNum(), clear all tether begin");
            sContext.getContentResolver().update(GEMINI_TETHER_URI, contentvalues, s, null);
            Xlog.i("GeminiSIMTetherManager", "setCurrTetheredNum(), clear all tether end");
        }
        String s1 = "";
        int i = arraylist.size();
        Xlog.i("GeminiSIMTetherManager", (new StringBuilder()).append("setCurrTetheredNum(), tethered contact num = ").append(i).toString());
        for (int j = 0; j < i; j++)
        {
            if (j > 0)
                s1 = (new StringBuilder()).append(s1).append(", ").toString();
            s1 = (new StringBuilder()).append(s1).append(((Integer)arraylist.get(j)).toString()).toString();
        }

        Xlog.i("GeminiSIMTetherManager", (new StringBuilder()).append("setCurrTetheredNum(), bindSelectStr=[").append(s1).append("]").toString());
        String s2 = (new StringBuilder()).append("_id in (").append(s1).append(") ").toString();
        contentvalues.put("sim_id", mCurrSIMID);
        Xlog.i("GeminiSIMTetherManager", "setCurrTetheredNum(), reset all tether begin");
        sContext.getContentResolver().update(GEMINI_TETHER_URI, contentvalues, s2, null);
        Xlog.i("GeminiSIMTetherManager", "setCurrTetheredNum(), reset all tether end");
    }

    static 
    {
        GEMINI_TETHER_URI = android.provider.ContactsContract.Data.CONTENT_URI;
    }
}
