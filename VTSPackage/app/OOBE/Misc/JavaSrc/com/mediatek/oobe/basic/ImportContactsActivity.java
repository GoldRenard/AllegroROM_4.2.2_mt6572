// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic;

import android.app.*;
import android.content.*;
import android.database.Cursor;
import android.net.Uri;
import android.os.*;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.View;
import android.widget.*;
import com.android.internal.telephony.ITelephony;
import com.android.internal.telephony.PhoneConstants;
import com.mediatek.CellConnService.CellConnMgr;
import com.mediatek.oobe.basic.gemini.SimInfoPreference;
import com.mediatek.oobe.utils.OOBEStepPreferenceActivity;
import com.mediatek.oobe.utils.Utils;
import com.mediatek.telephony.PhoneNumberFormatUtilEx;
import com.mediatek.xlog.Xlog;
import java.lang.ref.WeakReference;
import java.util.*;

public class ImportContactsActivity extends OOBEStepPreferenceActivity
    implements android.view.View.OnClickListener
{
    private class ClockHandler extends Handler
    {

        final ImportContactsActivity this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 1: // '\001'
                Xlog.d("ClockHandler", "Time out");
                startQuery();
                return;
            }
        }

        private ClockHandler()
        {
            this$0 = ImportContactsActivity.this;
            super();
        }
    }

    private class CopyHandler extends Handler
    {

        final ImportContactsActivity this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 2: // '\002'
                dealWithCancel();
                updateUI(4);
                return;

            case 1: // '\001'
                for (int j = 0; j < ImportContactsActivity.SLOT_TOTAL_NUMBER; j++)
                    if (mSimSlotStatus[j].mIsSelected)
                    {
                        Xlog.v("OOBE", (new StringBuilder()).append(getStepSpecialTag()).append("slot ").append(j).append(" finish importing").toString());
                        finishProgressBar(j);
                    }

                updateUI(3);
                return;

            case 0: // '\0'
                int i = message.arg1;
                Xlog.v("OOBE", (new StringBuilder()).append(getStepSpecialTag()).append("CopyHandler, simIndex=").append(i).append(", mTotalCount=").append(mSimSlotStatus[i].mTotalCount).append(", success count=").append(mSimSlotStatus[i].mSuccessCount).toString());
                if (mSimSlotStatus[i].mSuccessCount >= mSimSlotStatus[i].mTotalCount)
                {
                    finishProgressBar(i);
                    return;
                } else
                {
                    incrementProgressTo(i, mSimSlotStatus[i].mSuccessCount);
                    return;
                }
            }
        }

        private CopyHandler()
        {
            this$0 = ImportContactsActivity.this;
            super();
        }

    }

    private class CopyThread extends Thread
    {

        private ContentResolver mResolver;
        android.os.PowerManager.WakeLock mWakeLock;
        final ImportContactsActivity this$0;

        private void insertToDb(String s, String s1, int i)
        {
            Xlog.v("OOBE", (new StringBuilder()).append("name is ").append(s).append(" number is ").append(s1).toString());
            ContentValues contentvalues = new ContentValues();
            ArrayList arraylist = new ArrayList();
            android.content.ContentProviderOperation.Builder builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.RawContacts.CONTENT_URI);
            contentvalues.put("indicate_phone_or_sim_contact", Integer.valueOf(-1));
            builder.withValues(contentvalues);
            arraylist.add(builder.build());
            if (!TextUtils.isEmpty(s1))
            {
                Xlog.i("OOBE", (new StringBuilder()).append("PhoneNumberFormatUtilEx.formatNumber(number) is ").append(s1).toString());
                String s2 = PhoneNumberFormatUtilEx.formatNumber(s1);
                android.content.ContentProviderOperation.Builder builder2 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
                builder2.withValueBackReference("raw_contact_id", 0);
                builder2.withValue("mimetype", "vnd.android.cursor.item/phone_v2");
                builder2.withValue("data1", s2);
                builder2.withValue("data2", Integer.valueOf(2));
                arraylist.add(builder2.build());
            }
            if (!TextUtils.isEmpty(s))
            {
                android.content.ContentProviderOperation.Builder builder1 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
                builder1.withValueBackReference("raw_contact_id", 0);
                builder1.withValue("mimetype", "vnd.android.cursor.item/name");
                builder1.withValue("data2", s);
                arraylist.add(builder1.build());
            }
            try
            {
                mResolver.applyBatch("com.android.contacts", arraylist);
                return;
            }
            catch (RemoteException remoteexception)
            {
                Object aobj1[] = new Object[2];
                aobj1[0] = remoteexception.toString();
                aobj1[1] = remoteexception.getMessage();
                Xlog.e("OOBE", String.format("%s: %s", aobj1));
                return;
            }
            catch (OperationApplicationException operationapplicationexception)
            {
                Object aobj[] = new Object[2];
                aobj[0] = operationapplicationexception.toString();
                aobj[1] = operationapplicationexception.getMessage();
                Xlog.e("OOBE", String.format("%s: %s", aobj));
                return;
            }
        }

        private Cursor queryPhoneNumbers(long l)
        {
            Uri uri = Uri.withAppendedPath(ContentUris.withAppendedId(android.provider.ContactsContract.Contacts.CONTENT_URI, l), "data");
            Cursor cursor = getContentResolver().query(uri, new String[] {
                "_id", "data1", "is_super_primary", "account_type", "data2", "data3", "data15"
            }, "mimetype=?", new String[] {
                "vnd.android.cursor.item/phone_v2"
            }, null);
            if (cursor != null && cursor.moveToFirst())
                return cursor;
            if (cursor != null)
                cursor.close();
            return null;
        }

        public void insertToDB(String s, String s1, String s2, String s3, ContentResolver contentresolver, long l, 
                String s4)
        {
            ArrayList arraylist = new ArrayList();
            android.content.ContentProviderOperation.Builder builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.RawContacts.CONTENT_URI);
            ContentValues contentvalues = new ContentValues();
            contentvalues.put("indicate_phone_or_sim_contact", Long.valueOf(l));
            contentvalues.put("aggregation_mode", Integer.valueOf(3));
            builder.withValues(contentvalues);
            arraylist.add(builder.build());
            String s5 = "";
            if (!TextUtils.isEmpty(s))
            {
                NamePhoneTypePair namephonetypepair = new NamePhoneTypePair(s);
                s = namephonetypepair.mName;
                int _tmp = namephonetypepair.mPhoneType;
                s5 = namephonetypepair.mPhoneTypeSuffix;
            }
            if (!TextUtils.isEmpty(s1))
            {
                String s7 = PhoneNumberFormatUtilEx.formatNumber(s1);
                android.content.ContentProviderOperation.Builder builder4 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
                builder4.withValueBackReference("raw_contact_id", 0);
                builder4.withValue("mimetype", "vnd.android.cursor.item/phone_v2");
                builder4.withValue("data1", s7);
                builder4.withValue("data2", Integer.valueOf(2));
                if (!TextUtils.isEmpty(s5))
                    builder4.withValue("data15", s5);
                arraylist.add(builder4.build());
            }
            if (!TextUtils.isEmpty(s))
            {
                android.content.ContentProviderOperation.Builder builder3 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
                builder3.withValueBackReference("raw_contact_id", 0);
                builder3.withValue("mimetype", "vnd.android.cursor.item/name");
                builder3.withValue("data2", s);
                arraylist.add(builder3.build());
            }
            if (s4.equals("USIM"))
            {
                if (!TextUtils.isEmpty(s2))
                {
                    Xlog.i("OOBE", (new StringBuilder()).append("In actuallyImportOneSimContact email is ").append(s2).toString());
                    android.content.ContentProviderOperation.Builder builder2 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
                    builder2.withValueBackReference("raw_contact_id", 0);
                    builder2.withValue("mimetype", "vnd.android.cursor.item/email_v2");
                    builder2.withValue("data2", Integer.valueOf(4));
                    builder2.withValue("data1", s2);
                    arraylist.add(builder2.build());
                }
                if (!TextUtils.isEmpty(s3))
                {
                    String s6 = PhoneNumberFormatUtilEx.formatNumber(s3);
                    Xlog.i("OOBE", (new StringBuilder()).append("additionalNumber is ").append(s6).toString());
                    android.content.ContentProviderOperation.Builder builder1 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
                    builder1.withValueBackReference("raw_contact_id", 0);
                    builder1.withValue("mimetype", "vnd.android.cursor.item/phone_v2");
                    builder1.withValue("data2", Integer.valueOf(7));
                    builder1.withValue("data1", s6);
                    builder1.withValue("is_additional_number", Integer.valueOf(1));
                    arraylist.add(builder1.build());
                }
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
                Xlog.e("OOBE", String.format("%s: %s", aobj1));
                return;
            }
            catch (OperationApplicationException operationapplicationexception)
            {
                Object aobj[] = new Object[2];
                aobj[0] = operationapplicationexception.toString();
                aobj[1] = operationapplicationexception.getMessage();
                Xlog.e("OOBE", String.format("%s: %s", aobj));
                return;
            }
        }

        public long queryForRawContactId(ContentResolver contentresolver, long l)
        {
            Cursor cursor;
            long l1;
            cursor = null;
            l1 = -1L;
            cursor = contentresolver.query(android.provider.ContactsContract.RawContacts.CONTENT_URI, new String[] {
                "_id"
            }, (new StringBuilder()).append("contact_id=").append(l).toString(), null, null);
            if (cursor == null)
                break MISSING_BLOCK_LABEL_77;
            long l2;
            if (!cursor.moveToFirst())
                break MISSING_BLOCK_LABEL_77;
            l2 = cursor.getLong(0);
            l1 = l2;
            if (cursor != null)
                cursor.close();
            return l1;
            Exception exception;
            exception;
            if (cursor != null)
                cursor.close();
            throw exception;
        }

        public void run()
        {
            String s;
            String s1;
            Cursor cursor;
            Cursor cursor1;
            int i;
            if (mBeingCopied)
                return;
            mWakeLock.acquire();
            ImportContactsActivity.sCanceled = false;
            mBeingCopied = true;
            s = null;
            s1 = null;
            cursor = null;
            cursor1 = null;
            Xlog.i("OOBE", "copy from sim to phone");
            i = 0;
_L2:
            int j = ImportContactsActivity.SLOT_TOTAL_NUMBER;
            if (i >= j || ImportContactsActivity.sCanceled)
                break; /* Loop/switch isn't completed */
            Xlog.i("OOBE", (new StringBuilder()).append("copy thread, mSimSlotStatus[i].mIsSelected=").append(mSimSlotStatus[i].mIsSelected).toString());
            if (!mSimSlotStatus[i].mIsSelected)
            {
                Xlog.i("OOBE", (new StringBuilder()).append("SIM in slot ").append(i).append(" is not selected for contact import").toString());
            } else
            {
label0:
                {
                    if (!mSimSlotStatus[i].mCopyFinished)
                        break label0;
                    Xlog.w("OOBE", (new StringBuilder()).append(getStepSpecialTag()).append("contact in SIM ").append(i).append(" have already been imported, ignore").toString());
                }
            }
_L3:
            i++;
            if (true) goto _L2; else goto _L1
            cursor = mCursorQuerySims[i];
            if (cursor == null)
                break MISSING_BLOCK_LABEL_255;
            if (!cursor.isClosed())
                break MISSING_BLOCK_LABEL_307;
            Xlog.w("OOBE", (new StringBuilder()).append("simCursor==null, simIndex=").append(i).toString());
            if (cursor != null && !cursor.isClosed())
                cursor.close();
              goto _L3
            if (cursor.getCount() != 0)
                break MISSING_BLOCK_LABEL_376;
            Xlog.w("OOBE", (new StringBuilder()).append("Get 0 contacts from SIM ").append(i).toString());
            cursor.close();
            if (cursor != null && !cursor.isClosed())
                cursor.close();
              goto _L3
            cursor.moveToFirst();
            if (mSimSlotStatus[i].mIsSrcSimUSIM) goto _L5; else goto _L4
_L4:
            if (ImportContactsActivity.sCanceled) goto _L7; else goto _L6
_L6:
            long l;
            l = cursor.getLong(0);
            s = cursor.getString(1);
            Xlog.i("OOBE", (new StringBuilder()).append("Name is: ").append(s).toString());
            cursor1 = queryPhoneNumbers(l);
            int k;
            s1 = "";
            k = -1;
            if (cursor1 == null)
                break MISSING_BLOCK_LABEL_529;
            int k1;
            if (!cursor1.moveToFirst())
                break MISSING_BLOCK_LABEL_529;
            int i1 = cursor1.getColumnIndex("data1");
            s1 = cursor1.getString(i1);
            int j1 = cursor1.getColumnIndex("data2");
            k1 = cursor1.getInt(j1);
            k = k1;
            if (cursor1 == null)
                break MISSING_BLOCK_LABEL_541;
            cursor1.close();
            ContentValues contentvalues;
            contentvalues = new ContentValues();
            if (!TextUtils.isEmpty(s1))
                s1 = s1.replaceAll("-", "");
            if (TextUtils.isEmpty(s) || !s.equals(s1)) goto _L9; else goto _L8
_L8:
            contentvalues.put("tag", "");
            contentvalues.put("number", s1);
            s = null;
_L13:
            boolean flag;
            insertToDb(s, s1, k);
            SIMSlotStatus simslotstatus = mSimSlotStatus[i];
            simslotstatus.mSuccessCount = 1 + simslotstatus.mSuccessCount;
            Message message = Message.obtain();
            message.what = 0;
            message.arg1 = i;
            mCopyHandler.sendMessage(message);
            flag = cursor.moveToNext();
            if (flag) goto _L10; else goto _L7
_L7:
            if (cursor != null && !cursor.isClosed())
                cursor.close();
              goto _L3
            Exception exception1;
            exception1;
            if (cursor1 == null)
                break MISSING_BLOCK_LABEL_725;
            cursor1.close();
            throw exception1;
            Exception exception;
            exception;
_L19:
            if (cursor != null && !cursor.isClosed())
                cursor.close();
            throw exception;
_L9:
            if (0 <= 0) goto _L12; else goto _L11
_L11:
            String s2 = (new StringBuilder()).append(s).append(0).toString();
_L23:
            contentvalues.put("tag", s2);
            contentvalues.put("number", s1);
              goto _L13
_L10:
            Xlog.i("dwz", "wait a few second for import");
            sleep(2000L);
              goto _L4
            InterruptedException interruptedexception;
            interruptedexception;
            interruptedexception.printStackTrace();
              goto _L4
_L18:
            String s3;
            String s4;
            s3 = s1;
            s4 = s;
_L22:
            if (ImportContactsActivity.sCanceled) goto _L15; else goto _L14
_L14:
            long l1;
            Cursor cursor2;
            l1 = cursor.getLong(0);
            long l2 = queryForRawContactId(getContentResolver(), l1);
            Xlog.i("OOBE", (new StringBuilder()).append("copy from usim to phone rawContactId is ").append(l2).toString());
            cursor2 = getContentResolver().query(android.provider.ContactsContract.Data.CONTENT_URI, new String[] {
                "mimetype", "data1", "is_additional_number"
            }, (new StringBuilder()).append("raw_contact_id=").append(l2).toString(), null, null);
            if (cursor2 == null) goto _L17; else goto _L16
_L16:
            String s5;
            String s6;
            s6 = null;
            s5 = null;
            s = s4;
            do
            {
                if (!cursor2.moveToNext())
                    break;
                Xlog.i("OOBE", (new StringBuilder()).append("copy from usim to phone c.getCount() is ").append(cursor2.getCount()).append(" mimeType is ").append(cursor2.getString(0)).append(" data1 is").append(cursor2.getString(1)).append(" is_additional_number is ").append(cursor2.getString(2)).toString());
                if (cursor2.getString(0).equals("vnd.android.cursor.item/phone_v2") && cursor2.getString(2).equals("1"))
                {
                    s6 = cursor2.getString(1);
                    Xlog.i("OOBE", (new StringBuilder()).append("copy from usim to phone additionalNumber is ").append(s6).toString());
                }
                if (cursor2.getString(0).equals("vnd.android.cursor.item/name"))
                {
                    s = cursor2.getString(1);
                    Xlog.i("OOBE", (new StringBuilder()).append("In run name is ").append(s).toString());
                }
                if (cursor2.getString(0).equals("vnd.android.cursor.item/email_v2"))
                {
                    s5 = cursor2.getString(1);
                    Xlog.i("OOBE", (new StringBuilder()).append("copy from usim to phone email is ").append(s5).toString());
                }
            } while (true);
            cursor2.close();
_L21:
            cursor1 = queryPhoneNumbers(l1);
            s1 = "";
            if (cursor1 == null)
                break MISSING_BLOCK_LABEL_1316;
            if (cursor1.moveToFirst())
            {
                int i2 = cursor1.getColumnIndex("data1");
                s1 = cursor1.getString(i2);
                int j2 = cursor1.getColumnIndex("data2");
                cursor1.getInt(j2);
            }
            if (cursor1 == null)
                break MISSING_BLOCK_LABEL_1328;
            cursor1.close();
            Xlog.i("OOBE", (new StringBuilder()).append("copy from usim to phone name is ").append(s).toString());
            Xlog.i("OOBE", (new StringBuilder()).append("copy from usim to phone number is ").append(s1).toString());
            insertToDB(s, s1, s5, s6, mResolver, -1L, "USIM");
            SIMSlotStatus simslotstatus1 = mSimSlotStatus[i];
            simslotstatus1.mSuccessCount = 1 + simslotstatus1.mSuccessCount;
            Message message1 = Message.obtain();
            message1.what = 0;
            message1.arg1 = i;
            mCopyHandler.sendMessage(message1);
            if (cursor.moveToNext()) goto _L18; else goto _L7
_L20:
            if (cursor1 == null)
                break MISSING_BLOCK_LABEL_1482;
            cursor1.close();
            Exception exception2;
            throw exception2;
_L1:
            mBeingCopied = false;
            if (ImportContactsActivity.sCanceled)
                mCopyHandler.sendEmptyMessage(2);
            else
                mCopyHandler.sendEmptyMessage(1);
            mWakeLock.release();
            return;
            exception;
            s3;
            s4;
              goto _L19
            exception2;
              goto _L20
_L17:
            s = s4;
            s5 = null;
            s6 = null;
              goto _L21
_L15:
            s1 = s3;
            s = s4;
              goto _L7
_L5:
            s3 = s1;
            s4 = s;
              goto _L22
_L12:
            s2 = s;
              goto _L23
            exception;
            s3;
              goto _L19
            exception2;
            s3;
              goto _L20
        }

        public CopyThread()
        {
            this$0 = ImportContactsActivity.this;
            super();
            mResolver = getContentResolver();
            mWakeLock = ((PowerManager)getSystemService("power")).newWakeLock(0x20000006, "OOBE");
        }
    }

    public static class NamePhoneTypePair
    {

        public String mName;
        public int mPhoneType;
        public String mPhoneTypeSuffix;

        public NamePhoneTypePair(String s)
        {
            int i = s.length();
            if (i - 2 >= 0 && s.charAt(i - 2) == '/')
            {
                char c = Character.toUpperCase(s.charAt(i - 1));
                mPhoneTypeSuffix = String.valueOf(s.charAt(i - 1));
                if (c == 'W')
                    mPhoneType = 3;
                else
                if (c != 'M' && c != 'O')
                {
                    if (c == 'H')
                        mPhoneType = 1;
                    else
                        mPhoneType = 7;
                } else
                {
                    mPhoneType = 2;
                }
                mName = s.substring(0, i - 2);
                return;
            } else
            {
                mPhoneTypeSuffix = "";
                mPhoneType = 7;
                mName = s;
                return;
            }
        }
    }

    public static class SIMSlotStatus
    {

        public boolean mCopyFinished;
        public boolean mIsCopying;
        public boolean mIsSelected;
        public boolean mIsSrcSimUSIM;
        public boolean mQuerySimDone;
        public int mSuccessCount;
        public int mTotalCount;

        public SIMSlotStatus()
        {
            mCopyFinished = false;
            mIsCopying = false;
            mSuccessCount = 0;
            mTotalCount = 0;
            mIsSelected = false;
            mQuerySimDone = false;
            mIsSrcSimUSIM = false;
        }
    }


    private static final String CLAUSE_ONLY_VISIBLE = "in_visible_group=1";
    private static final int COPYING_DIALOG_ID = 101;
    private static final int ID_CANCEL_COPY = 2;
    private static final int ID_END_COPY = 1;
    private static final int ID_IN_COPY = 0;
    private static final String IMPORT_CONTACTS_STATE = "is_import_state";
    static final int MESSAGE_TIME_OUT = 1;
    private static final int NOTIFICATION_ID = 17;
    private static final int QUERY_TOKEN = 1;
    private static final int SIM_STATE_ABSENT = 3;
    private static final int SIM_STATE_LOCK = 2;
    private static final int SIM_STATE_NORMAL = 1;
    private static final String SIM_SUCCESS_COPYCOUNT = "sim_success_copycount";
    private static final String SIM_TOTAL_CONTACTS = "sim_total";
    private static final int SLOT_INDEX_1 = 0;
    private static final int SLOT_INDEX_2 = 1;
    private static final int SLOT_INDEX_3 = 2;
    private static final int SLOT_INDEX_4 = 3;
    private static final int SLOT_TOTAL_NUMBER = 0;
    private static final int SUMMARY_DISPLAY_NAME_ALTERNATIVE_COLUMN_INDEX = 2;
    private static final int SUMMARY_DISPLAY_NAME_PRIMARY_COLUMN_INDEX = 1;
    private static final int SUMMARY_HAS_PHONE_COLUMN_INDEX = 10;
    private static final int SUMMARY_ID_COLUMN_INDEX = 0;
    private static final int SUMMARY_LOOKUP_KEY_COLUMN_INDEX = 8;
    private static final int SUMMARY_PHONETIC_NAME_COLUMN_INDEX = 9;
    private static final int SUMMARY_PHOTO_ID_COLUMN_INDEX = 7;
    private static final int SUMMARY_PRESENCE_STATUS_COLUMN_INDEX = 6;
    private static final int SUMMARY_SNIPPET_DATA1_COLUMN_INDEX = 12;
    private static final int SUMMARY_SNIPPET_DATA4_COLUMN_INDEX = 13;
    private static final int SUMMARY_SNIPPET_MIMETYPE_COLUMN_INDEX = 11;
    private static final int SUMMARY_SORT_KEY_PRIMARY_COLUMN_INDEX = 3;
    private static final int SUMMARY_STARRED_COLUMN_INDEX = 4;
    private static final int SUMMARY_TIMES_CONTACTED_COLUMN_INDEX = 5;
    private static final String TAG = "OOBE";
    static final String TAG_CANCEL = "cancel";
    static final String TAG_IMPORT = "import";
    private static final int UI_CANCEL_COPY = 4;
    private static final int UI_FINISH_QUERY = 2;
    private static final int UI_FNISH_COPY = 3;
    private static final int UI_START_COPY = 2;
    private static final int UI_START_QUERY = 1;
    private static boolean sCanceled = false;
    private static boolean sCopying = false;
    private static boolean sFirstRunning = false;
    private boolean mBeingCopied;
    private boolean mBeingQuery;
    private CellConnMgr mCellMgr;
    private final String mContactsProjection[] = {
        "_id", "display_name", "display_name_alt", "sort_key", "starred", "times_contacted", "contact_presence", "photo_id", "lookup", "phonetic_name", 
        "has_phone_number", "indicate_phone_or_sim_contact"
    };
    private Handler mCopyHandler;
    private CopyThread mCopyThread;
    private Cursor mCursorQuerySims[];
    private ITelephony mITelephony;
    private Button mImportBtn;
    private boolean mIsSlot1Insert;
    private boolean mIsSlot2Insert;
    private ListView mListView;
    private Map mMapSlot2SimInfo;
    private Notification mNotification;
    private NotificationManager mNotificationManager;
    private boolean mProgressBeenInitFlag;
    private QueryHandler mQueryHandler;
    private Integer mResultSimLock;
    private boolean mSelfChangeFlag;
    private Runnable mServiceComplete;
    private Thread mServiceCompleteThread;
    private SIMSlotStatus mSimSlotStatus[];
    BroadcastReceiver mSimStateListener;
    private SimInfoPreference mSlot1SimPref;
    private SimInfoPreference mSlot2SimPref;
    private SimInfoPreference mSlot3SimPref;
    private SimInfoPreference mSlot4SimPref;
    private SimInfoPreference mSlotSimPref[];
    final ITelephony mTelephonyService = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
    private TextView mTextCopyNote;

    public ImportContactsActivity()
    {
        mIsSlot1Insert = false;
        mIsSlot2Insert = false;
        mSimSlotStatus = new SIMSlotStatus[SLOT_TOTAL_NUMBER];
        mSlotSimPref = new SimInfoPreference[SLOT_TOTAL_NUMBER];
        mCursorQuerySims = new Cursor[SLOT_TOTAL_NUMBER];
        mBeingCopied = false;
        mBeingQuery = false;
        mSelfChangeFlag = false;
        mProgressBeenInitFlag = false;
        mCopyHandler = new CopyHandler();
        mResultSimLock = Integer.valueOf(-1);
        mSimStateListener = new BroadcastReceiver() {

            final ImportContactsActivity this$0;

            public void onReceive(Context context, Intent intent)
            {
                String s = intent.getAction();
                Xlog.d("OOBE", (new StringBuilder()).append("ImportContactsActivity receive:").append(s).toString());
                if (!s.equals("android.intent.action.SIM_STATE_CHANGED") && !s.equals("android.intent.action.SIM_INDICATOR_STATE_CHANGED"))
                {
                    if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
                    {
                        disableSimPreference();
                        return;
                    }
                } else
                {
                    updateSimPreference();
                }
            }

            
            {
                this$0 = ImportContactsActivity.this;
                super();
            }
        }
;
        mServiceComplete = new Runnable() {

            final ImportContactsActivity this$0;

            public void run()
            {
                mResultSimLock = Integer.valueOf(mCellMgr.getResult());
                Xlog.d("OOBE", (new StringBuilder()).append("serviceComplete result: ").append(mResultSimLock).toString());
            }

            
            {
                this$0 = ImportContactsActivity.this;
                super();
            }
        }
;
        mServiceCompleteThread = new Thread(mServiceComplete);
        mCellMgr = new CellConnMgr(mServiceCompleteThread);
    }

    private void addGeminiSimInfoPreference()
    {
        PreferenceScreen preferencescreen;
        mMapSlot2SimInfo.clear();
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        Xlog.i("OOBE", (new StringBuilder()).append("sim number is ").append(list.size()).toString());
        android.provider.Telephony.SIMInfo siminfo1;
        for (Iterator iterator = list.iterator(); iterator.hasNext(); mMapSlot2SimInfo.put(Integer.valueOf(siminfo1.mSlot), siminfo1))
        {
            siminfo1 = (android.provider.Telephony.SIMInfo)iterator.next();
            Xlog.i("OOBE", (new StringBuilder()).append("siminfo.mSlot ").append(Integer.valueOf(siminfo1.mSlot)).toString());
        }

        preferencescreen = getPreferenceScreen();
        if (preferencescreen != null) goto _L2; else goto _L1
_L1:
        Xlog.d("OOBE", "simPrefScreen is null");
_L4:
        return;
_L2:
        Iterator iterator1;
        preferencescreen.removeAll();
        iterator1 = mMapSlot2SimInfo.keySet().iterator();
_L5:
        if (!iterator1.hasNext()) goto _L4; else goto _L3
_L3:
        int i;
        android.provider.Telephony.SIMInfo siminfo;
        int j;
        i = ((Integer)iterator1.next()).intValue();
        siminfo = (android.provider.Telephony.SIMInfo)mMapSlot2SimInfo.get(Integer.valueOf(i));
        if (siminfo == null)
        {
            Xlog.d("OOBE", "siminfo is null");
            mSimSlotStatus[i].mIsSelected = false;
            return;
        }
        j = -1;
        int k = mITelephony.getSimIndicatorStateGemini(siminfo.mSlot);
        j = k;
_L6:
        SimInfoPreference siminfopreference = new SimInfoPreference(this, siminfo.mDisplayName, siminfo.mNumber, siminfo.mSlot, j, siminfo.mColor, siminfo.mDispalyNumberFormat, siminfo.mSimId, true);
        if (sFirstRunning)
            mSimSlotStatus[i].mIsSelected = true;
        siminfopreference.setCheck(mSimSlotStatus[i].mIsSelected);
        siminfopreference.setImporting(mSimSlotStatus[i].mIsCopying);
        siminfopreference.setFinishImporting(mSimSlotStatus[i].mCopyFinished);
        Xlog.i("OOBE", (new StringBuilder()).append("simid status is  ").append(j).toString());
        RemoteException remoteexception;
        if (siminfopreference != null)
            if (siminfo.mSlot == 0)
            {
                mIsSlot1Insert = true;
                mSlot1SimPref = siminfopreference;
                mSlotSimPref[0] = siminfopreference;
                preferencescreen.addPreference(mSlot1SimPref);
            } else
            if (siminfo.mSlot == 1)
            {
                mIsSlot2Insert = true;
                mSlot2SimPref = siminfopreference;
                mSlotSimPref[1] = siminfopreference;
                preferencescreen.addPreference(mSlot2SimPref);
            } else
            if (siminfo.mSlot == 2)
            {
                mSlot3SimPref = siminfopreference;
                mSlotSimPref[2] = siminfopreference;
                preferencescreen.addPreference(mSlot3SimPref);
            } else
            if (siminfo.mSlot == 3)
            {
                mSlot4SimPref = siminfopreference;
                mSlotSimPref[3] = siminfopreference;
                preferencescreen.addPreference(mSlot4SimPref);
            }
          goto _L5
          goto _L4
        remoteexception;
        Xlog.i("OOBE", (new StringBuilder()).append("RemoteException ").append(remoteexception.getMessage()).toString());
          goto _L6
    }

    private void addSingleSimPrefrence()
    {
        PreferenceScreen preferencescreen = getPreferenceScreen();
        if (preferencescreen != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        List list;
        preferencescreen.removeAll();
        list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        if (list.size() == 0) goto _L1; else goto _L3
_L3:
        android.provider.Telephony.SIMInfo siminfo;
        int i;
        siminfo = (android.provider.Telephony.SIMInfo)list.get(0);
        i = -1;
        int j = mITelephony.getSimIndicatorState();
        i = j;
_L5:
        SimInfoPreference siminfopreference = new SimInfoPreference(this, siminfo.mDisplayName, siminfo.mNumber, siminfo.mSlot, i, siminfo.mColor, siminfo.mDispalyNumberFormat, siminfo.mSimId, true);
        mMapSlot2SimInfo.put(Integer.valueOf(siminfo.mSlot), siminfo);
        if (sFirstRunning)
            mSimSlotStatus[0].mIsSelected = true;
        siminfopreference.setCheck(mSimSlotStatus[0].mIsSelected);
        siminfopreference.setImporting(mSimSlotStatus[0].mIsCopying);
        siminfopreference.setFinishImporting(mSimSlotStatus[0].mCopyFinished);
        mIsSlot1Insert = true;
        mSlot1SimPref = siminfopreference;
        mSlotSimPref[0] = siminfopreference;
        getPreferenceScreen().addPreference(mSlot1SimPref);
        return;
        RemoteException remoteexception;
        remoteexception;
        Xlog.e("OOBE", (new StringBuilder()).append("RemoteException ").append(remoteexception.getMessage()).toString());
        if (true) goto _L5; else goto _L4
_L4:
    }

    private void cancelImporting()
    {
        sCanceled = true;
        mImportBtn.setEnabled(false);
        for (int i = 0; i < SLOT_TOTAL_NUMBER; i++)
            mSimSlotStatus[i].mSuccessCount = 0;

    }

    private boolean checkSimState()
    {
        Xlog.v("OOBE", "checkSimState() begin ");
        if (!Utils.isGemini()) goto _L2; else goto _L1
_L1:
        List list;
        int j;
        list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        j = 0;
_L6:
        int k;
        int l;
        if (j >= list.size())
            break; /* Loop/switch isn't completed */
        k = ((android.provider.Telephony.SIMInfo)list.get(j)).mSlot;
        l = -1;
        int i1 = mITelephony.getSimIndicatorStateGemini(k);
        l = i1;
_L4:
        if (mSimSlotStatus[k].mIsSelected && (l == 2 || l == 1))
        {
            mCellMgr.handleCellConn(k, 302);
            return false;
        }
        break; /* Loop/switch isn't completed */
        RemoteException remoteexception;
        remoteexception;
        Xlog.i("OOBE", (new StringBuilder()).append("RemoteException ").append(remoteexception.getMessage()).toString());
        if (true) goto _L4; else goto _L3
_L3:
        j++;
        if (true) goto _L6; else goto _L5
_L2:
        if (mSimSlotStatus[0].mIsSelected)
        {
            int i = ((TelephonyManager)getSystemService("phone")).getSimState();
            if (i == 2 || i == 3)
            {
                mCellMgr.handleCellConn(0, 302);
                return false;
            }
        }
_L5:
        return true;
    }

    private void createProgressNotificationBar()
    {
        mNotificationManager = (NotificationManager)getSystemService("notification");
        mNotification = new Notification(0x7f020009, getString(0x7f090051), System.currentTimeMillis());
        RemoteViews remoteviews = new RemoteViews(getPackageName(), 0x7f030007);
        remoteviews.setImageViewResource(0x7f0b0016, 0x7f02000a);
        remoteviews.setTextViewText(0x7f0b0017, getString(0x7f090051));
        mNotification.contentView = remoteviews;
        Intent intent = new Intent(this, com/mediatek/oobe/basic/ImportContactsActivity);
        intent.setFlags(0x20000000);
        PendingIntent.getActivity(this, 0, intent, 0);
        int i = 0;
        for (int j = 0; j < SLOT_TOTAL_NUMBER; j++)
            i += mSimSlotStatus[j].mTotalCount;

        mNotification.contentView.setProgressBar(0x7f0b0018, i, 0, false);
        mNotificationManager.notify(17, mNotification);
    }

    private void dealWithCancel()
    {
        for (int i = 0; i < SLOT_TOTAL_NUMBER; i++)
        {
            if (!mSimSlotStatus[i].mIsSelected)
            {
                Xlog.w("OOBE", (new StringBuilder()).append(getStepSpecialTag()).append("dealWithCancel(), slot ").append(i).append(" is not selected, so no need to cancel, just jump").toString());
                continue;
            }
            mSimSlotStatus[i].mCopyFinished = false;
            mSimSlotStatus[i].mIsCopying = false;
            SimInfoPreference siminfopreference = mSlotSimPref[i];
            if (siminfopreference != null)
            {
                Xlog.v("OOBE", (new StringBuilder()).append("dealWithCancel(), slot=").append(i).toString());
                siminfopreference.dealWithCancel();
            }
        }

        mNotificationManager.cancel(17);
    }

    private void disableSimPreference()
    {
        if (mSlot1SimPref != null)
            mSlot1SimPref.setEnabled(false);
        if (mSlot2SimPref != null)
            mSlot2SimPref.setEnabled(false);
        if (mSlot3SimPref != null)
            mSlot3SimPref.setEnabled(false);
        if (mSlot4SimPref != null)
            mSlot4SimPref.setEnabled(false);
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        Xlog.i("hotswapdbg", (new StringBuilder()).append("sim number is ").append(list.size()).toString());
        Iterator iterator = list.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
            if (siminfo.mSlot == 0)
            {
                if (mSlot1SimPref != null)
                    mSlot1SimPref.setEnabled(true);
            } else
            if (siminfo.mSlot == 1)
            {
                if (mSlot2SimPref != null)
                    mSlot2SimPref.setEnabled(true);
            } else
            if (siminfo.mSlot == 2)
            {
                if (mSlot3SimPref != null)
                    mSlot3SimPref.setEnabled(true);
            } else
            if (siminfo.mSlot == 3 && mSlot4SimPref != null)
                mSlot4SimPref.setEnabled(true);
        } while (true);
    }

    private void finishProgressBar(int i)
    {
        mSimSlotStatus[i].mCopyFinished = true;
        Xlog.v("OOBE", (new StringBuilder()).append(getStepSpecialTag()).append("finishProgressBar() for SIM ").append(i).append(", mFinishImporting=").append(mSlotSimPref[i].isFinishImporting()).toString());
        mSlotSimPref[i].finishProgressBar();
        mNotificationManager.cancel(17);
    }

    private int getSimStatus(int i)
    {
        int j = -1;
        if (PhoneConstants.GEMINI_SIM_NUM <= 1) goto _L2; else goto _L1
_L1:
        int l = mITelephony.getSimIndicatorStateGemini(i);
        j = l;
_L4:
        Xlog.d("OOBE", (new StringBuilder()).append("getSimStatus: ").append(j).toString());
        return j;
_L2:
        int k = mITelephony.getSimIndicatorState();
        j = k;
        continue; /* Loop/switch isn't completed */
        RemoteException remoteexception;
        remoteexception;
        Xlog.e("OOBE", (new StringBuilder()).append("RemoteException ").append(remoteexception.getMessage()).toString());
        if (true) goto _L4; else goto _L3
_L3:
    }

    private void importContacts()
    {
        boolean flag = true;
        int i = 0;
        while (i < SLOT_TOTAL_NUMBER) 
        {
            if (flag && !mSimSlotStatus[i].mIsSelected)
                flag = true;
            else
                flag = false;
            i++;
        }
        if (flag)
        {
            Xlog.v("OOBE", "No SIM is selected");
            return;
        }
        if (sCopying)
        {
            Xlog.d("OOBE", "onClick() importing already, return");
            showDialog(101);
            return;
        }
        if (!checkSimState())
        {
            Xlog.v("OOBE", "SIM Locked");
            return;
        }
        if (!Utils.isGemini()) goto _L2; else goto _L1
_L1:
        int j = 0;
_L7:
        if (j >= SLOT_TOTAL_NUMBER) goto _L4; else goto _L3
_L3:
        if (mSimSlotStatus[j].mIsSelected && mTelephonyService.getIccCardTypeGemini(j).equals("USIM"))
            mSimSlotStatus[j].mIsSrcSimUSIM = true;
          goto _L5
_L2:
        try
        {
            if (mTelephonyService != null && mTelephonyService.getIccCardType().equals("USIM"))
                mSimSlotStatus[0].mIsSrcSimUSIM = true;
        }
        catch (RemoteException remoteexception)
        {
            remoteexception.printStackTrace();
        }
_L4:
        updateUI(1);
        startQuery();
        return;
_L5:
        j++;
        if (true) goto _L7; else goto _L6
_L6:
    }

    private void incrementProgressTo(int i, int j)
    {
        Xlog.v("OOBE", (new StringBuilder()).append(getStepSpecialTag()).append("SIM ").append(i).append(" incrementProgressTo ").append(j).toString());
        mSlotSimPref[i].incrementProgressTo(j);
        updateProgressNotification(j);
    }

    private void initProgressBar()
    {
        for (int i = 0; i < SLOT_TOTAL_NUMBER; i++)
        {
            if (!mSimSlotStatus[i].mIsSelected)
            {
                Xlog.w("OOBE", (new StringBuilder()).append("ImportContacts.initProgressBar(), slot ").append(i).append(" is not selected to import, jump").toString());
                continue;
            }
            SimInfoPreference siminfopreference = mSlotSimPref[i];
            if (siminfopreference != null)
            {
                Xlog.w("OOBE", (new StringBuilder()).append("ImportContacts.initProgressBar(), slot=").append(i).append(", mTotalCount=").append(mSimSlotStatus[i].mTotalCount).toString());
                siminfopreference.initProgressBar(mSimSlotStatus[i].mTotalCount);
            }
        }

        createProgressNotificationBar();
    }

    private void initSim()
    {
        mITelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        mMapSlot2SimInfo = new HashMap();
        mQueryHandler = new QueryHandler(this);
        mCellMgr.register(this);
    }

    private static void setFirstRunning(boolean flag)
    {
        sFirstRunning = flag;
    }

    private void startCopy()
    {
        updateUI(2);
        mCopyThread = new CopyThread();
        mCopyThread.start();
    }

    private void startQuery()
    {
        Xlog.i("OOBE", (new StringBuilder()).append(" slot number =").append(mMapSlot2SimInfo.size()).append("  ").append(mMapSlot2SimInfo.toString()).toString());
        Xlog.i("OOBE", (new StringBuilder()).append(" slot number =").append(mMapSlot2SimInfo.size()).append("  ").append(mMapSlot2SimInfo.toString()).toString());
        for (int i = 0; i < SLOT_TOTAL_NUMBER; i++)
        {
            if (!mSimSlotStatus[i].mIsSelected)
                continue;
            if (!mSimSlotStatus[i].mIsSrcSimUSIM)
                mQueryHandler.startQuery(i, null, android.provider.ContactsContract.Contacts.CONTENT_URI, mContactsProjection, (new StringBuilder()).append("indicate_phone_or_sim_contact = ").append(((android.provider.Telephony.SIMInfo)mMapSlot2SimInfo.get(Integer.valueOf(i))).mSimId).append(" AND ").append("in_visible_group=1").toString(), null, "sort_key");
            else
                mQueryHandler.startQuery(i, null, android.provider.ContactsContract.Contacts.CONTENT_URI, mContactsProjection, (new StringBuilder()).append("indicate_phone_or_sim_contact = ").append(((android.provider.Telephony.SIMInfo)mMapSlot2SimInfo.get(Integer.valueOf(i))).mSimId).toString(), null, "sort_key");
        }

    }

    private void updateCopyNote()
    {
        boolean flag = true;
        boolean flag1 = true;
        boolean flag2 = true;
        for (int i = 0; i < SLOT_TOTAL_NUMBER; i++)
        {
            if (flag && mSimSlotStatus[0].mIsCopying)
                flag = true;
            else
                flag = false;
            if (!flag1 || mSimSlotStatus[i].mIsCopying && !mSimSlotStatus[i].mCopyFinished)
                flag1 = false;
            else
                flag1 = true;
            if (!flag2 || mSlotSimPref[i] != null && !mSimSlotStatus[i].mCopyFinished)
                flag2 = false;
            else
                flag2 = true;
        }

        if (flag)
        {
            if (flag1)
            {
                if (flag2)
                {
                    mImportBtn.setVisibility(4);
                } else
                {
                    mImportBtn.setTag("import");
                    mImportBtn.setText(0x7f090068);
                }
                mTextCopyNote.setText(0x7f09006c);
            } else
            if (!flag2)
            {
                mImportBtn.setTag("cancel");
                mImportBtn.setEnabled(true);
                mImportBtn.setText(0x7f090069);
                mTextCopyNote.setVisibility(0);
                mTextCopyNote.setText(0x7f09006b);
            }
            if (mNextBtn != null)
                mNextBtn.setText(0x7f090048);
            return;
        } else
        {
            mNextBtn.setText(0x7f09004b);
            return;
        }
    }

    private void updateProgressNotification(int i)
    {
        if (mNotification != null)
        {
            int j = 0;
            for (int k = 0; k < SLOT_TOTAL_NUMBER; k++)
                j += mSimSlotStatus[k].mTotalCount;

            mNotification.contentView.setProgressBar(0x7f0b0018, j, i, false);
            mNotificationManager.notify(17, mNotification);
        }
    }

    private void updateSimPreference()
    {
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        Xlog.d("OOBE", (new StringBuilder()).append("updateSimPreference(), sim number:").append(list.size()).toString());
label0:
        for (int i = -1 + getPreferenceScreen().getPreferenceCount(); i >= 0; i--)
        {
            SimInfoPreference siminfopreference = (SimInfoPreference)getPreferenceScreen().getPreference(i);
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    continue label0;
                android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
                if (siminfo.mSlot == siminfopreference.getSlotIndex())
                    siminfopreference.setStatus(getSimStatus(siminfo.mSlot));
            } while (true);
        }

    }

    private void updateUI(int i)
    {
        if (i == 1)
        {
            mBeingQuery = true;
            mImportBtn.setTag("cancel");
            mImportBtn.setEnabled(false);
            mImportBtn.setText(0x7f090069);
            mBackBtn.setEnabled(false);
            mNextBtn.setEnabled(false);
            mTextCopyNote.setVisibility(0);
            mTextCopyNote.setText(0x7f09006a);
        } else
        {
            if (i == 2)
            {
                mBeingQuery = false;
                mImportBtn.setEnabled(true);
                initProgressBar();
                mBackBtn.setEnabled(true);
                mNextBtn.setEnabled(true);
                mNextBtn.setText(0x7f090048);
                mTextCopyNote.setText(0x7f09006b);
                sCopying = true;
                return;
            }
            if (i == 3)
            {
                boolean flag = true;
                for (int j = 0; j < SLOT_TOTAL_NUMBER; j++)
                    if (!flag || mSlotSimPref[j] != null && !mSimSlotStatus[j].mCopyFinished)
                        flag = false;
                    else
                        flag = true;

                if (flag)
                {
                    mImportBtn.setVisibility(4);
                } else
                {
                    mImportBtn.setText(0x7f090068);
                    mImportBtn.setTag("import");
                }
                mTextCopyNote.setText(0x7f09006c);
                sCopying = false;
                return;
            }
            if (i == 4)
            {
                mImportBtn.setEnabled(true);
                mImportBtn.setText(0x7f090068);
                mImportBtn.setTag("import");
                mBackBtn.setEnabled(true);
                mNextBtn.setEnabled(true);
                mNextBtn.setText(0x7f09004b);
                mTextCopyNote.setText(0x7f09006d);
                sCopying = false;
                return;
            }
        }
    }

    protected String getStepSpecialTag()
    {
        return "ImportContactsActivity";
    }

    public void initSimSlotStatus()
    {
        for (int i = 0; i < SLOT_TOTAL_NUMBER; i++)
            mSimSlotStatus[i] = new SIMSlotStatus();

        setFirstRunning(true);
    }

    protected void initSpecialLayout()
    {
        super.initSpecialLayout(0x7f090051, 0x7f090052);
        mImportBtn = (Button)findViewById(0x7f0b0014);
        mTextCopyNote = (TextView)findViewById(0x7f0b0015);
        mImportBtn.setOnClickListener(this);
        mListView = (ListView)findViewById(0x102000a);
        mImportBtn.setTag("import");
    }

    public void onClick(View view)
    {
        if (view == mImportBtn)
        {
            if (mImportBtn.getTag().toString().equalsIgnoreCase("import"))
            {
                Xlog.d("OOBE", "onClick() importContacts()");
                mSelfChangeFlag = true;
                importContacts();
                return;
            } else
            {
                Xlog.d("OOBE", "onClick() cancelImporting()");
                mSelfChangeFlag = true;
                cancelImporting();
                return;
            }
        } else
        {
            super.onClick(view);
            return;
        }
    }

    public void onCreate(Bundle bundle)
    {
        Xlog.d("OOBE", (new StringBuilder()).append("OnCreate ImportContactsActivity, isFirstRunning?").append(sFirstRunning).toString());
        super.onCreate(bundle);
        setContentView(0x7f030006);
        addPreferencesFromResource(0x7f050002);
        initSimSlotStatus();
        initLayout();
        initSpecialLayout();
        initSim();
        SimInfoPreference.registerCallback(this);
    }

    public Dialog onCreateDialog(int i)
    {
        switch (i)
        {
        case 101: // 'e'
            return (new android.app.AlertDialog.Builder(this)).setIcon(0x1080027).setTitle(0x1040014).setMessage(getString(0x7f090022)).setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

                final ImportContactsActivity this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                }

            
            {
                this$0 = ImportContactsActivity.this;
                super();
            }
            }
).create();
        }
        return super.onCreateDialog(i);
    }

    public void onDestroy()
    {
        mCellMgr.unregister();
        SimInfoPreference.unregisterCallback(this);
        setFirstRunning(true);
        super.onDestroy();
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        switch (i)
        {
        case 4: // '\004'
            if (mBeingQuery || mBeingCopied)
            {
                Xlog.i("OOBE", "Being queried or copied");
                return true;
            }
            break;
        }
        return super.onKeyDown(i, keyevent);
    }

    public void onPause()
    {
        super.onPause();
        unregisterReceiver(mSimStateListener);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference instanceof SimInfoPreference)
        {
            int i = ((SimInfoPreference)preference).getSlotIndex();
            if (mSimSlotStatus[i].mCopyFinished)
            {
                Xlog.w("OOBE", "Importing contact, SIM contact has already been imported, can not be unchecked, jump");
            } else
            {
                if (mSimSlotStatus[i].mIsCopying)
                {
                    Xlog.w("OOBE", (new StringBuilder()).append("Importing contact, SIM contact in SIM ").append(i).append(" is being copy, can not be clicked, jump").toString());
                    return true;
                }
                if (((SimInfoPreference)preference).getCheck())
                {
                    ((SimInfoPreference)preference).setCheck(false);
                    Xlog.i("OOBE", (new StringBuilder()).append("Slot ").append(i).append(" is unselected").toString());
                    if (i > -1 && i < SLOT_TOTAL_NUMBER)
                    {
                        mSimSlotStatus[i].mIsSelected = false;
                        return true;
                    }
                } else
                {
                    ((SimInfoPreference)preference).setCheck(true);
                    Xlog.i("OOBE", (new StringBuilder()).append("Slot ").append(i).append(" is selected").toString());
                    if (i > -1 && i < SLOT_TOTAL_NUMBER)
                    {
                        mSimSlotStatus[i].mIsSelected = true;
                        return true;
                    }
                }
            }
        }
        return true;
    }

    public void onRestoreInstanceState(Bundle bundle)
    {
        super.onRestoreInstanceState(bundle);
    }

    public void onResume()
    {
        super.onResume();
        Xlog.d("OOBE", "onResume");
        for (int i = 0; i < SLOT_TOTAL_NUMBER; i++)
            mSlotSimPref[i] = null;

        if (SLOT_TOTAL_NUMBER > 1)
            addGeminiSimInfoPreference();
        else
            addSingleSimPrefrence();
        if (mMapSlot2SimInfo.size() > 0)
            mImportBtn.setVisibility(0);
        else
            mImportBtn.setVisibility(8);
        IntentFilter intentfilter = new IntentFilter("android.intent.action.SIM_STATE_CHANGED");
        intentfilter.addAction("android.intent.action.PHB_STATE_CHANGED");
        intentfilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        intentfilter.addAction("android.intent.action.SIM_INDICATOR_STATE_CHANGED");
        registerReceiver(mSimStateListener, intentfilter);
        setListViewHeightBasedOnChildren(mListView);
        updateCopyNote();
    }

    public void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
    }

    public void refreshCancel()
    {
        mImportBtn.setEnabled(true);
        mImportBtn.setText(0x7f090068);
        dealWithCancel();
        updateUI(4);
    }

    public void refreshProgress()
    {
        Xlog.i("OOBE", (new StringBuilder()).append("ImportContacts===========refreshProgress()==========selfChangeFlag=").append(mSelfChangeFlag).toString());
        if (!mSelfChangeFlag)
        {
            for (int i = 0; i < SLOT_TOTAL_NUMBER; i++)
            {
                if (!mSimSlotStatus[i].mIsSelected)
                {
                    Xlog.i("OOBE", (new StringBuilder()).append("SIM in slot ").append(i).append(" is not selected for contact import, so do not refresh it").toString());
                    continue;
                }
                if (!mSimSlotStatus[i].mIsCopying && !mSimSlotStatus[i].mCopyFinished)
                    continue;
                if (!mProgressBeenInitFlag)
                {
                    mProgressBeenInitFlag = true;
                    updateUI(2);
                }
                if (mSimSlotStatus[i].mCopyFinished)
                {
                    finishProgressBar(i);
                    updateCopyNote();
                } else
                {
                    incrementProgressTo(i, mSimSlotStatus[i].mSuccessCount);
                }
            }

        }
    }

    public void setListViewHeightBasedOnChildren(ListView listview)
    {
        ListAdapter listadapter = getPreferenceScreen().getRootAdapter();
        if (listadapter == null)
            return;
        int i = 0;
        int j = 0;
        for (int k = listadapter.getCount(); j < k; j++)
        {
            View view = listadapter.getView(j, null, listview);
            view.measure(0, 0);
            i += 1 + view.getMeasuredHeight();
        }

        android.view.ViewGroup.LayoutParams layoutparams = listview.getLayoutParams();
        layoutparams.height = i + listview.getDividerHeight() * (-1 + listadapter.getCount());
        Xlog.i("OOBE", (new StringBuilder()).append("Total height: ").append(i).append(" and height: ").append(layoutparams.height).append(" Divider Height is :").append(listview.getDividerHeight()).toString());
        listview.setLayoutParams(layoutparams);
    }

    static 
    {
        SLOT_TOTAL_NUMBER = PhoneConstants.GEMINI_SIM_NUM;
    }











/*
    static boolean access$1702(ImportContactsActivity importcontactsactivity, boolean flag)
    {
        importcontactsactivity.mBeingCopied = flag;
        return flag;
    }

*/



/*
    static boolean access$1802(boolean flag)
    {
        sCanceled = flag;
        return flag;
    }

*/





/*
    static Integer access$302(ImportContactsActivity importcontactsactivity, Integer integer)
    {
        importcontactsactivity.mResultSimLock = integer;
        return integer;
    }

*/






}
