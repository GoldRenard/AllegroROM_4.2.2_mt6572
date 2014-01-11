// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.*;
import android.database.Cursor;
import android.os.*;
import android.telephony.PhoneNumberUtils;
import android.text.TextUtils;
import android.util.Log;
import java.util.HashMap;

// Referenced classes of package com.android.phone:
//            CallerInfoCacheUpdateReceiver

public class CallerInfoCache
{
    private class CacheAsyncTask extends AsyncTask
    {

        private android.os.PowerManager.WakeLock mWakeLock;
        final CallerInfoCache this$0;

        private void releaseWakeLock()
        {
            if (mWakeLock != null && mWakeLock.isHeld())
                mWakeLock.release();
        }

        public void acquireWakeLockAndExecute()
        {
            mWakeLock = ((PowerManager)mContext.getSystemService("power")).newWakeLock(1, CallerInfoCache.LOG_TAG);
            mWakeLock.acquire();
            execute(new Void[0]);
        }

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((Void[])aobj);
        }

        protected transient Void doInBackground(Void avoid[])
        {
            if (CallerInfoCache.DBG)
                CallerInfoCache.log("Start refreshing cache.");
            refreshCacheEntry();
            return null;
        }

        protected volatile void onCancelled(Object obj)
        {
            onCancelled((Void)obj);
        }

        protected void onCancelled(Void void1)
        {
            super.onCancelled(void1);
            releaseWakeLock();
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((Void)obj);
        }

        protected void onPostExecute(Void void1)
        {
            super.onPostExecute(void1);
            releaseWakeLock();
        }

        private CacheAsyncTask()
        {
            this$0 = CallerInfoCache.this;
            super();
        }

    }

    public static class CacheEntry
    {

        public final String customRingtone;
        public final boolean sendToVoicemail;

        public String toString()
        {
            return (new StringBuilder()).append("ringtone: ").append(customRingtone).append(", ").append(sendToVoicemail).toString();
        }

        public CacheEntry(String s, boolean flag)
        {
            customRingtone = s;
            sendToVoicemail = flag;
        }
    }


    private static final int CACHE_REFRESH_INTERVAL = 0x1b77400;
    private static final boolean DBG = false;
    private static final int INDEX_CUSTOM_RINGTONE = 2;
    private static final int INDEX_NORMALIZED_NUMBER = 1;
    private static final int INDEX_NUMBER = 0;
    private static final int INDEX_SEND_TO_VOICEMAIL = 3;
    private static final String LOG_TAG = com/android/phone/CallerInfoCache.getSimpleName();
    public static final int MESSAGE_UPDATE_CACHE = 0;
    private static final String PROJECTION[] = {
        "data1", "data4", "custom_ringtone", "send_to_voicemail"
    };
    private static final String SELECTION = "((custom_ringtone IS NOT NULL OR send_to_voicemail=1) AND data1 IS NOT NULL)";
    private static final boolean VDBG;
    private CacheAsyncTask mCacheAsyncTask;
    private final Context mContext;
    private volatile HashMap mNumberToEntry;

    private CallerInfoCache(Context context)
    {
        mContext = context;
        mNumberToEntry = new HashMap();
    }

    public static CallerInfoCache init(Context context)
    {
        if (DBG)
            log("init()");
        CallerInfoCache callerinfocache = new CallerInfoCache(context);
        callerinfocache.startAsyncCache();
        callerinfocache.setRepeatingCacheUpdateAlarm();
        return callerinfocache;
    }

    private static void log(String s)
    {
        Log.d(LOG_TAG, s);
    }

    private void putNewEntryWhenAppropriate(HashMap hashmap, String s, String s1, boolean flag)
    {
        if (hashmap.containsKey(s))
        {
            if (!((CacheEntry)hashmap.get(s)).sendToVoicemail && flag)
                hashmap.put(s, new CacheEntry(s1, flag));
            return;
        } else
        {
            hashmap.put(s, new CacheEntry(s1, flag));
            return;
        }
    }

    private void refreshCacheEntry()
    {
        Cursor cursor = null;
        cursor = mContext.getContentResolver().query(android.provider.ContactsContract.CommonDataKinds.Callable.CONTENT_URI, PROJECTION, "((custom_ringtone IS NOT NULL OR send_to_voicemail=1) AND data1 IS NOT NULL)", null, null);
        if (cursor == null) goto _L2; else goto _L1
_L1:
        HashMap hashmap = new HashMap(cursor.getCount());
_L7:
        if (!cursor.moveToNext()) goto _L4; else goto _L3
_L3:
        String s;
        String s1;
        s = cursor.getString(0);
        s1 = cursor.getString(1);
        if (s1 != null)
            break MISSING_BLOCK_LABEL_80;
        s1 = PhoneNumberUtils.normalizeNumber(s);
        String s2 = cursor.getString(2);
        Exception exception;
        boolean flag;
        if (cursor.getInt(3) == 1)
            flag = true;
        else
            flag = false;
        if (!PhoneNumberUtils.isUriNumber(s)) goto _L6; else goto _L5
_L5:
        putNewEntryWhenAppropriate(hashmap, s, s2, flag);
          goto _L7
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
_L6:
        if (TextUtils.isEmpty(s1)) goto _L7; else goto _L8
_L8:
        int i = s1.length();
        if (i <= 7) goto _L10; else goto _L9
_L9:
        String s3 = s1.substring(i - 7, i);
_L12:
        putNewEntryWhenAppropriate(hashmap, s3, s2, flag);
          goto _L7
_L4:
        mNumberToEntry = hashmap;
        if (DBG)
            log((new StringBuilder()).append("Caching entries are done. Total: ").append(hashmap.size()).toString());
_L11:
        if (cursor != null)
            cursor.close();
        return;
_L2:
        Log.w(LOG_TAG, "cursor is null");
        if (true) goto _L11; else goto _L10
_L10:
        s3 = s1;
          goto _L12
    }

    private void setRepeatingCacheUpdateAlarm()
    {
        if (DBG)
            log("setRepeatingCacheUpdateAlarm");
        Intent intent = new Intent("com.android.phone.UPDATE_CALLER_INFO_CACHE");
        intent.setClass(mContext, com/android/phone/CallerInfoCacheUpdateReceiver);
        PendingIntent pendingintent = PendingIntent.getBroadcast(mContext, 0, intent, 0x10000000);
        ((AlarmManager)mContext.getSystemService("alarm")).setInexactRepeating(3, 0x1b77400L + SystemClock.uptimeMillis(), 0x1b77400L, pendingintent);
    }

    public CacheEntry getCacheEntry(String s)
    {
        if (mNumberToEntry == null)
        {
            Log.w(LOG_TAG, "Fallback cache isn't ready.");
        } else
        {
            if (PhoneNumberUtils.isUriNumber(s))
                return (CacheEntry)mNumberToEntry.get(s);
            String s1 = PhoneNumberUtils.normalizeNumber(s);
            if (!TextUtils.isEmpty(s1))
            {
                int i = s1.length();
                String s2;
                if (i > 7)
                    s2 = s1.substring(i - 7, i);
                else
                    s2 = s1;
                return (CacheEntry)mNumberToEntry.get(s2);
            }
        }
        return null;
    }

    void startAsyncCache()
    {
        if (DBG)
            log("startAsyncCache");
        if (mCacheAsyncTask != null)
        {
            Log.w(LOG_TAG, "Previous cache task is remaining.");
            mCacheAsyncTask.cancel(true);
        }
        mCacheAsyncTask = new CacheAsyncTask();
        mCacheAsyncTask.acquireWakeLockAndExecute();
    }

    static 
    {
        boolean flag;
        if (SystemProperties.getInt("ro.debuggable", 0) == 1)
            flag = true;
        else
            flag = false;
        DBG = flag;
    }





}
