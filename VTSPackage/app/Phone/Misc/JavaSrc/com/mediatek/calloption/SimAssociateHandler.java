// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;

import android.content.*;
import android.database.ContentObserver;
import android.database.Cursor;
import android.os.*;
import android.telephony.PhoneNumberUtils;
import android.util.Log;
import java.util.ArrayList;
import java.util.HashMap;

public final class SimAssociateHandler extends HandlerThread
{
    protected class ContactContentObserver extends ContentObserver
    {

        final SimAssociateHandler this$0;

        public void onChange(boolean flag)
        {
            log("ContactContentObserver: ");
            if (!mCacheDirty)
            {
                mCacheDirty = true;
                log((new StringBuilder()).append("ContactContentObserver: ").append(mCacheDirty).toString());
            }
        }

        public ContactContentObserver()
        {
            this$0 = SimAssociateHandler.this;
            super(new Handler());
        }
    }

    class MyHandler extends Handler
    {

        final SimAssociateHandler this$0;

        public void handleMessage(Message message)
        {
            message.what;
            JVM INSTR tableswitch 0 2: default 32
        //                       0 33
        //                       1 411
        //                       2 428;
               goto _L1 _L2 _L3 _L4
_L1:
            return;
_L2:
            Cursor cursor;
            log("+MSG_LOAD");
            cursor = mContext.getContentResolver().query(android.provider.ContactsContract.Data.CONTENT_URI, new String[] {
                "data1", "sim_id"
            }, "mimetype='vnd.android.cursor.item/phone_v2' AND (sim_id>0)", null, null);
            mSimAssociationMaps.clear();
            if (cursor == null || !cursor.moveToFirst()) goto _L6; else goto _L5
_L5:
            int i;
            ArrayList arraylist;
            int j;
            String s = cursor.getString(0);
            i = cursor.getInt(1);
            log((new StringBuilder()).append("number = ").append(s).append(" id = ").append(i).toString());
            String s1 = PhoneNumberUtils.stripSeparators(s);
            if (s1 != null && s1.length() > 7)
                s1 = s1.substring(-7 + s1.length());
            log((new StringBuilder()).append("strNumber = ").append(s1).toString());
            arraylist = (ArrayList)mSimAssociationMaps.get(s1);
            if (arraylist == null)
            {
                arraylist = new ArrayList();
                mSimAssociationMaps.put(s1, arraylist);
            }
            j = 0;
_L11:
            int k;
            boolean flag;
            k = arraylist.size();
            flag = false;
            if (j >= k) goto _L8; else goto _L7
_L7:
            if (((Integer)arraylist.get(j)).intValue() != i) goto _L10; else goto _L9
_L9:
            flag = true;
_L8:
            if (!flag)
                arraylist.add(Integer.valueOf(i));
            log((new StringBuilder()).append("associateSims = ").append(arraylist).toString());
            if (cursor.moveToNext()) goto _L5; else goto _L6
_L6:
            if (cursor != null)
                cursor.close();
            this;
            JVM INSTR monitorenter ;
            mLoading = false;
            this;
            JVM INSTR monitorexit ;
            mCacheDirty = false;
            log("-MSG_LOADs");
            return;
_L10:
            j++;
              goto _L11
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
_L3:
            log("MSG_EXIT");
            getLooper().quit();
            return;
_L4:
            load();
            return;
        }

        public MyHandler(Looper looper)
        {
            this$0 = SimAssociateHandler.this;
            super(looper);
        }
    }


    public static final String ASSOCIATE_CHANGED = "com.android.contacts.associate_changed";
    private static final int MIN_MATCH = 7;
    private static final int MSG_LOAD = 0;
    private static final int MSG_QUIT = 1;
    private static final int MSG_REFRESH = 2;
    private static final String TAG = "SimAssociateHandler";
    private static SimAssociateHandler sMe;
    private boolean mCacheDirty;
    ContactContentObserver mContactContentObserver;
    protected Context mContext;
    private boolean mLoading;
    protected MyHandler mMyHandler;
    protected BroadcastReceiver mMyReceiver;
    protected HashMap mSimAssociationMaps;
    private boolean mStarted;

    private SimAssociateHandler(Context context)
    {
        super("SimAssociateHandler");
        mSimAssociationMaps = new HashMap();
        mMyReceiver = new BroadcastReceiver() {

            final SimAssociateHandler this$0;

            public void onReceive(Context context1, Intent intent)
            {
                if ("com.android.contacts.associate_changed".equals(intent.getAction()))
                {
                    log("RCV associated sim changed!");
                    mMyHandler.sendEmptyMessage(2);
                }
            }

            
            {
                this$0 = SimAssociateHandler.this;
                super();
            }
        }
;
        mContext = context;
        IntentFilter intentfilter = new IntentFilter("com.android.contacts.associate_changed");
        mContactContentObserver = new ContactContentObserver();
        mContext.registerReceiver(mMyReceiver, intentfilter);
        mContext.getContentResolver().registerContentObserver(android.provider.ContactsContract.Data.CONTENT_URI, true, mContactContentObserver);
        mCacheDirty = true;
    }

    public static SimAssociateHandler getInstance(Context context)
    {
        com/mediatek/calloption/SimAssociateHandler;
        JVM INSTR monitorenter ;
        SimAssociateHandler simassociatehandler;
        if (sMe == null)
            sMe = new SimAssociateHandler(context);
        simassociatehandler = sMe;
        com/mediatek/calloption/SimAssociateHandler;
        JVM INSTR monitorexit ;
        return simassociatehandler;
        Exception exception;
        exception;
        throw exception;
    }

    public void load()
    {
        this;
        JVM INSTR monitorenter ;
        log("load");
        if (!mLoading && mCacheDirty)
            break MISSING_BLOCK_LABEL_25;
        this;
        JVM INSTR monitorexit ;
        return;
        mLoading = true;
        if (!mMyHandler.hasMessages(0))
            break MISSING_BLOCK_LABEL_55;
        log("duplicate MSG_LOAD");
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        mMyHandler.sendEmptyMessage(0);
          goto _L1
    }

    void log(String s)
    {
        Log.d("SimAssociateHandler", s);
    }

    public void prepair()
    {
        start();
        mMyHandler = new MyHandler(getLooper());
    }

    public ArrayList query(String s)
    {
        String s1 = PhoneNumberUtils.stripSeparators(s);
        if (s1 != null && s1.length() > 7)
            s1 = s1.substring(-7 + s1.length());
        return (ArrayList)mSimAssociationMaps.get(s1);
    }

    public void relase()
    {
        if (mMyHandler != null)
            mMyHandler.sendEmptyMessage(1);
        mContext.unregisterReceiver(mMyReceiver);
        mContext.getContentResolver().unregisterContentObserver(mContactContentObserver);
    }



/*
    static boolean access$002(SimAssociateHandler simassociatehandler, boolean flag)
    {
        simassociatehandler.mCacheDirty = flag;
        return flag;
    }

*/


/*
    static boolean access$102(SimAssociateHandler simassociatehandler, boolean flag)
    {
        simassociatehandler.mLoading = flag;
        return flag;
    }

*/
}
