// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.providers.settings;

import android.app.ActivityManager;
import android.app.backup.BackupManager;
import android.content.*;
import android.content.res.AssetFileDescriptor;
import android.content.res.Resources;
import android.database.AbstractCursor;
import android.database.Cursor;
import android.database.sqlite.*;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.*;
import android.provider.DrmStore;
import android.text.TextUtils;
import android.util.*;
import com.mediatek.xlog.Xlog;
import java.io.FileNotFoundException;
import java.security.SecureRandom;
import java.util.HashSet;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

// Referenced classes of package com.android.providers.settings:
//            DatabaseHelper

public class SettingsProvider extends ContentProvider
{
    class CachePrefetchThread extends Thread
    {

        private int mUserHandle;
        final SettingsProvider this$0;

        public void run()
        {
            fullyPopulateCaches(mUserHandle);
        }

        CachePrefetchThread(int i)
        {
            this$0 = SettingsProvider.this;
            super("populate-settings-caches");
            mUserHandle = i;
        }
    }

    private static final class SettingsCache extends LruCache
    {

        private boolean mCacheFullyMatchesDisk;
        private final String mCacheName;

        public static boolean isRedundantSetValue(SettingsCache settingscache, String s, String s1)
        {
            boolean flag;
            flag = true;
            if (settingscache == null)
                return false;
            settingscache;
            JVM INSTR monitorenter ;
            Bundle bundle = (Bundle)settingscache.get(s);
            if (bundle != null)
                break MISSING_BLOCK_LABEL_36;
            settingscache;
            JVM INSTR monitorexit ;
            return false;
            Exception exception;
            exception;
            settingscache;
            JVM INSTR monitorexit ;
            throw exception;
            String s2;
            s2 = bundle.getPairValue();
            Xlog.d("SettingsProvider", (new StringBuilder()).append("redundant, old Value: ").append(String.valueOf(s2)).append(" new value: ").append(String.valueOf(s1)).toString());
            if (s2 != null || s1 != null) goto _L2; else goto _L1
_L1:
            settingscache;
            JVM INSTR monitorexit ;
            return flag;
_L4:
            boolean flag1;
            if (flag1 == flag)
                break MISSING_BLOCK_LABEL_107;
            settingscache;
            JVM INSTR monitorexit ;
            return false;
            boolean flag2 = s2.equals(s1);
            settingscache;
            JVM INSTR monitorexit ;
            return flag2;
_L2:
            if (s2 == null)
                flag1 = flag;
            else
                flag1 = false;
            if (s1 != null)
                flag = false;
            if (true) goto _L4; else goto _L3
_L3:
        }

        public static void populate(SettingsCache settingscache, ContentValues contentvalues)
        {
            if (settingscache == null)
                return;
            String s = contentvalues.getAsString("name");
            if (s == null)
            {
                Log.w("SettingsProvider", "null name populating settings cache.");
                return;
            } else
            {
                settingscache.populate(s, contentvalues.getAsString("value"));
                return;
            }
        }

        protected volatile void entryRemoved(boolean flag, Object obj, Object obj1, Object obj2)
        {
            entryRemoved(flag, (String)obj, (Bundle)obj1, (Bundle)obj2);
        }

        protected void entryRemoved(boolean flag, String s, Bundle bundle, Bundle bundle1)
        {
            if (flag)
                mCacheFullyMatchesDisk = false;
        }

        public boolean fullyMatchesDisk()
        {
            this;
            JVM INSTR monitorenter ;
            boolean flag = mCacheFullyMatchesDisk;
            this;
            JVM INSTR monitorexit ;
            return flag;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void populate(String s, String s1)
        {
            this;
            JVM INSTR monitorenter ;
            if (s1 == null)
                break MISSING_BLOCK_LABEL_16;
            if (s1.length() > 500)
                break MISSING_BLOCK_LABEL_31;
            put(s, Bundle.forPair("value", s1));
_L2:
            this;
            JVM INSTR monitorexit ;
            return;
            put(s, SettingsProvider.TOO_LARGE_TO_CACHE_MARKER);
            if (true) goto _L2; else goto _L1
_L1:
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Bundle putIfAbsent(String s, String s1)
        {
            Bundle bundle;
            if (s1 == null)
                bundle = SettingsProvider.NULL_SETTING;
            else
                bundle = Bundle.forPair("value", s1);
            if (s1 != null && s1.length() > 500) goto _L2; else goto _L1
_L1:
            this;
            JVM INSTR monitorenter ;
            if (get(s) == null)
                put(s, bundle);
            this;
            JVM INSTR monitorexit ;
_L2:
            return bundle;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void setFullyMatchesDisk(boolean flag)
        {
            this;
            JVM INSTR monitorenter ;
            mCacheFullyMatchesDisk = flag;
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }


/*
        static boolean access$202(SettingsCache settingscache, boolean flag)
        {
            settingscache.mCacheFullyMatchesDisk = flag;
            return flag;
        }

*/

        public SettingsCache(String s)
        {
            super(200);
            mCacheFullyMatchesDisk = false;
            mCacheName = s;
        }
    }

    private class SettingsFileObserver extends FileObserver
    {

        private final AtomicBoolean mIsDirty = new AtomicBoolean(false);
        private final String mPath;
        private final int mUserHandle;
        final SettingsProvider this$0;

        public void onEvent(int i, String s)
        {
            if (SettingsProvider.sKnownMutationsInFlight.get(mUserHandle) == null)
                Log.d("SettingsProvider", (new StringBuilder()).append("UserHandle ").append(mUserHandle).append(" null ").toString());
            else
            if (((AtomicInteger)SettingsProvider.sKnownMutationsInFlight.get(mUserHandle)).get() <= 0)
            {
                Log.d("SettingsProvider", (new StringBuilder()).append("User ").append(mUserHandle).append(" external modification to ").append(mPath).append("; event=").append(i).toString());
                if (mIsDirty.compareAndSet(false, true))
                {
                    Log.d("SettingsProvider", (new StringBuilder()).append("User ").append(mUserHandle).append(" updating our caches for ").append(mPath).toString());
                    fullyPopulateCaches(mUserHandle);
                    mIsDirty.set(false);
                    return;
                }
            }
        }

        public SettingsFileObserver(int i, String s)
        {
            this$0 = SettingsProvider.this;
            super(s, 906);
            mUserHandle = i;
            mPath = s;
        }
    }

    private static class SqlArguments
    {

        public final String args[];
        public String table;
        public final String where;

        SqlArguments(Uri uri)
        {
            if (uri.getPathSegments().size() == 1)
            {
                table = (String)uri.getPathSegments().get(0);
                if (!DatabaseHelper.isValidTable(table))
                {
                    throw new IllegalArgumentException((new StringBuilder()).append("Bad root path: ").append(table).toString());
                } else
                {
                    where = null;
                    args = null;
                    return;
                }
            } else
            {
                throw new IllegalArgumentException((new StringBuilder()).append("Invalid URI: ").append(uri).toString());
            }
        }

        SqlArguments(Uri uri, String s, String as[])
        {
            if (uri.getPathSegments().size() == 1)
            {
                table = (String)uri.getPathSegments().get(0);
                if (!DatabaseHelper.isValidTable(table))
                    throw new IllegalArgumentException((new StringBuilder()).append("Bad root path: ").append(table).toString());
                where = s;
                args = as;
            } else
            {
                if (uri.getPathSegments().size() != 2)
                    throw new IllegalArgumentException((new StringBuilder()).append("Invalid URI: ").append(uri).toString());
                if (!TextUtils.isEmpty(s))
                    throw new UnsupportedOperationException((new StringBuilder()).append("WHERE clause not supported: ").append(uri).toString());
                table = (String)uri.getPathSegments().get(0);
                if (!DatabaseHelper.isValidTable(table))
                    throw new IllegalArgumentException((new StringBuilder()).append("Bad root path: ").append(table).toString());
                if (!"system".equals(table) && !"secure".equals(table) && !"global".equals(table))
                {
                    where = (new StringBuilder()).append("_id=").append(ContentUris.parseId(uri)).toString();
                    args = null;
                    return;
                }
                where = "name=?";
                String s1 = (String)uri.getPathSegments().get(1);
                args = (new String[] {
                    s1
                });
                if (("system".equals(table) || "secure".equals(table)) && (SettingsProvider.sSecureGlobalKeys.contains(s1) || SettingsProvider.sSystemGlobalKeys.contains(s1)))
                {
                    table = "global";
                    return;
                }
            }
        }
    }


    private static final String COLUMN_VALUE[] = {
        "value"
    };
    private static final boolean LOCAL_LOGV = true;
    private static final int MAX_CACHE_ENTRIES = 200;
    private static final int MAX_CACHE_ENTRY_SIZE = 500;
    private static final Bundle NULL_SETTING = Bundle.forPair("value", null);
    private static final String TABLE_FAVORITES = "favorites";
    private static final String TABLE_GLOBAL = "global";
    private static final String TABLE_OLD_FAVORITES = "old_favorites";
    private static final String TABLE_SECURE = "secure";
    private static final String TABLE_SYSTEM = "system";
    private static final String TAG = "SettingsProvider";
    private static final Bundle TOO_LARGE_TO_CACHE_MARKER = Bundle.forPair("_dummy", null);
    private static final SettingsCache sGlobalCache = new SettingsCache("global");
    private static final SparseArray sKnownMutationsInFlight = new SparseArray();
    private static SparseArray sObserverInstances = new SparseArray();
    private static final SparseArray sSecureCaches = new SparseArray();
    static final HashSet sSecureGlobalKeys;
    private static final SparseArray sSystemCaches = new SparseArray();
    static final HashSet sSystemGlobalKeys;
    private BackupManager mBackupManager;
    protected final SparseArray mOpenHelpers = new SparseArray();
    private UserManager mUserManager;


    private void checkWritePermissions(SqlArguments sqlarguments)
    {
        if (("secure".equals(sqlarguments.table) || "global".equals(sqlarguments.table)) && getContext().checkCallingOrSelfPermission("android.permission.WRITE_SECURE_SETTINGS") != 0)
            throw new SecurityException(String.format("Permission denial: writing to secure settings requires %1$s", new Object[] {
                "android.permission.WRITE_SECURE_SETTINGS"
            }));
        else
            return;
    }

    private boolean ensureAndroidIdIsSet(int i)
    {
        Cursor cursor = queryForUser(android.provider.Settings.Secure.CONTENT_URI, new String[] {
            "value"
        }, "name=?", new String[] {
            "android_id"
        }, null, i);
        if (!cursor.moveToNext()) goto _L2; else goto _L1
_L1:
        String s = cursor.getString(0);
_L6:
        if (s != null)
            break MISSING_BLOCK_LABEL_285;
        SecureRandom securerandom;
        String s1;
        securerandom = new SecureRandom();
        s1 = Long.toHexString(securerandom.nextLong());
        String s2;
        boolean flag;
        int j;
        s2 = s1;
        flag = false;
        j = 10;
_L4:
        if (j <= 0 || flag)
            break; /* Loop/switch isn't completed */
        j--;
        try
        {
            Float.parseFloat(s2);
            s2 = Long.toHexString(securerandom.nextLong());
            Xlog.d("SettingsProvider", (new StringBuilder()).append("create random again: ").append(s2).toString());
            continue; /* Loop/switch isn't completed */
        }
        catch (NumberFormatException numberformatexception) { }
        Xlog.d("SettingsProvider", (new StringBuilder()).append("NumberFormatException e ,  android_id ").append(s2).toString());
        flag = true;
        if (true) goto _L4; else goto _L3
_L3:
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("name", "android_id");
        contentvalues.put("value", s2);
        if (insertForUser(android.provider.Settings.Secure.CONTENT_URI, contentvalues, i) != null)
            break MISSING_BLOCK_LABEL_248;
        Slog.e("SettingsProvider", (new StringBuilder()).append("Unable to generate new ANDROID_ID for user ").append(i).toString());
        cursor.close();
        return false;
        Slog.d("SettingsProvider", (new StringBuilder()).append("Generated and saved new ANDROID_ID [").append(s2).append("] for user ").append(i).toString());
        cursor.close();
        return true;
        Exception exception;
        exception;
        cursor.close();
        throw exception;
_L2:
        s = null;
        if (true) goto _L6; else goto _L5
_L5:
    }

    private void establishDbTracking(int i)
    {
        Slog.i("SettingsProvider", (new StringBuilder()).append("Installing settings db helper and caches for user ").append(i).toString());
        this;
        JVM INSTR monitorenter ;
        DatabaseHelper databasehelper = (DatabaseHelper)mOpenHelpers.get(i);
        if (databasehelper != null)
            break MISSING_BLOCK_LABEL_117;
        databasehelper = new DatabaseHelper(getContext(), i);
        mOpenHelpers.append(i, databasehelper);
        sSystemCaches.append(i, new SettingsCache("system"));
        sSecureCaches.append(i, new SettingsCache("secure"));
        sKnownMutationsInFlight.append(i, new AtomicInteger(0));
        this;
        JVM INSTR monitorexit ;
        SQLiteDatabase sqlitedatabase = databasehelper.getWritableDatabase();
        synchronized (sObserverInstances)
        {
            if (sObserverInstances.get(i) == null)
            {
                SettingsFileObserver settingsfileobserver = new SettingsFileObserver(i, sqlitedatabase.getPath());
                sObserverInstances.append(i, settingsfileobserver);
                settingsfileobserver.startWatching();
            }
        }
        ensureAndroidIdIsSet(i);
        initDialogSequenceValue(i);
        initOobeValue(i);
        startAsyncCachePopulation(i);
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        exception1;
        sparsearray;
        JVM INSTR monitorexit ;
        throw exception1;
    }

    private void fullyPopulateCache(DatabaseHelper databasehelper, String s, SettingsCache settingscache)
    {
        Cursor cursor = databasehelper.getReadableDatabase().query(s, new String[] {
            "name", "value"
        }, null, null, null, null, null, "201");
        settingscache;
        JVM INSTR monitorenter ;
        settingscache.evictAll();
        settingscache.setFullyMatchesDisk(true);
        int i = 0;
_L1:
        if (!cursor.moveToNext())
            break MISSING_BLOCK_LABEL_101;
        i++;
        settingscache.populate(cursor.getString(0), cursor.getString(1));
          goto _L1
        Exception exception1;
        exception1;
        settingscache;
        JVM INSTR monitorexit ;
        throw exception1;
        Exception exception;
        exception;
        cursor.close();
        throw exception;
        if (i <= 200)
            break MISSING_BLOCK_LABEL_140;
        settingscache.setFullyMatchesDisk(false);
        Log.d("SettingsProvider", (new StringBuilder()).append("row count exceeds max cache entries for table ").append(s).toString());
        Log.d("SettingsProvider", (new StringBuilder()).append("cache for settings table '").append(s).append("' rows=").append(i).append("; fullycached=").append(settingscache.fullyMatchesDisk()).toString());
        settingscache;
        JVM INSTR monitorexit ;
        cursor.close();
        return;
    }

    private void fullyPopulateCaches(int i)
    {
        if (i != -1 && mOpenHelpers.get(i) != null)
        {
            DatabaseHelper databasehelper = (DatabaseHelper)mOpenHelpers.get(i);
            if (i == 0)
                fullyPopulateCache(databasehelper, "global", sGlobalCache);
            fullyPopulateCache(databasehelper, "secure", (SettingsCache)sSecureCaches.get(i));
            fullyPopulateCache(databasehelper, "system", (SettingsCache)sSystemCaches.get(i));
            return;
        } else
        {
            Log.d("SettingsProvider", (new StringBuilder()).append("userHandle  ").append(i).append("dbHelper ").append(mOpenHelpers.get(i)).toString());
            return;
        }
    }

    private Uri getDefaultUri(Context context, int i)
    {
label0:
        {
            String s;
            if (i == 2)
                s = android.provider.Settings.System.getString(context.getContentResolver(), "mtk_audioprofile_default_notification");
            else
            if (i == 1)
            {
                s = android.provider.Settings.System.getString(context.getContentResolver(), "mtk_audioprofile_default_ringtone");
            } else
            {
                if (i != 8)
                    break label0;
                s = android.provider.Settings.System.getString(context.getContentResolver(), "mtk_audioprofile_default_video_call");
            }
            if (s == null)
                return null;
            else
                return Uri.parse(s);
        }
        Xlog.d("SettingsProvider", (new StringBuilder()).append("getDefaultUri: unexpectedType = ").append(i).toString());
        return null;
    }

    private SettingsCache getOrConstructCache(int i, SparseArray sparsearray)
    {
        getOrEstablishDatabase(i);
        return (SettingsCache)sparsearray.get(i);
    }

    private DatabaseHelper getOrEstablishDatabase(int i)
    {
        long l = Binder.clearCallingIdentity();
        DatabaseHelper databasehelper = (DatabaseHelper)mOpenHelpers.get(i);
        if (databasehelper != null)
            break MISSING_BLOCK_LABEL_40;
        establishDbTracking(i);
        databasehelper = (DatabaseHelper)mOpenHelpers.get(i);
        Binder.restoreCallingIdentity(l);
        return databasehelper;
        Exception exception;
        exception;
        Binder.restoreCallingIdentity(l);
        throw exception;
    }

    private Uri getUriFor(Uri uri, ContentValues contentvalues, long l)
    {
        if (uri.getPathSegments().size() != 1)
            throw new IllegalArgumentException((new StringBuilder()).append("Invalid URI: ").append(uri).toString());
        String s = (String)uri.getPathSegments().get(0);
        if (!"system".equals(s) && !"secure".equals(s) && !"global".equals(s))
            return ContentUris.withAppendedId(uri, l);
        else
            return Uri.withAppendedPath(uri, contentvalues.getAsString("name"));
    }

    private boolean initDialogSequenceValue(int i)
    {
        Cursor cursor = queryForUser(android.provider.Settings.System.CONTENT_URI, new String[] {
            "value"
        }, "name=?", new String[] {
            "dialog_sequence_settings"
        }, null, i);
        if (!cursor.moveToNext()) goto _L2; else goto _L1
_L1:
        String s = cursor.getString(0);
_L4:
        if (s == null)
            break; /* Loop/switch isn't completed */
        Uri uri;
        Xlog.d("SettingsProvider", "reset DIALOG_SEQUENCE_SETTINGS to default");
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("name", "dialog_sequence_settings");
        contentvalues.put("value", Integer.valueOf(0));
        uri = insertForUser(android.provider.Settings.System.CONTENT_URI, contentvalues, i);
        if (uri == null)
        {
            cursor.close();
            return false;
        }
        break; /* Loop/switch isn't completed */
_L2:
        s = null;
        if (true) goto _L4; else goto _L3
_L3:
        cursor.close();
        return true;
        Exception exception;
        exception;
        cursor.close();
        throw exception;
    }

    private boolean initOobeValue(int i)
    {
        Cursor cursor = queryForUser(android.provider.Settings.System.CONTENT_URI, new String[] {
            "value"
        }, "name=?", new String[] {
            "oobe_display"
        }, null, i);
        if (!cursor.moveToNext()) goto _L2; else goto _L1
_L1:
        String s = cursor.getString(0);
_L4:
        if (s == null)
            break; /* Loop/switch isn't completed */
        Uri uri;
        Xlog.d("SettingsProvider", "reset OOBE_DISPLAY to default");
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("name", "oobe_display");
        contentvalues.put("value", Integer.valueOf(0));
        uri = insertForUser(android.provider.Settings.System.CONTENT_URI, contentvalues, i);
        if (uri == null)
        {
            cursor.close();
            return false;
        }
        break; /* Loop/switch isn't completed */
_L2:
        s = null;
        if (true) goto _L4; else goto _L3
_L3:
        cursor.close();
        return true;
        Exception exception;
        exception;
        cursor.close();
        throw exception;
    }

    private Uri insertForUser(Uri uri, ContentValues contentvalues, int i)
    {
        int j = UserHandle.getCallingUserId();
        if (j != i)
            getContext().enforceCallingOrSelfPermission("android.permission.INTERACT_ACROSS_USERS_FULL", "Not permitted to access settings for other users");
        Slog.v("SettingsProvider", (new StringBuilder()).append("insert(").append(uri).append(") for user ").append(i).append(" by ").append(j).toString());
        Xlog.d("SettingsProvider", (new StringBuilder()).append("insert(").append(uri).append(") for user ").append(i).append(" by ").append(j).toString());
        SqlArguments sqlarguments = new SqlArguments(uri);
        if ("favorites".equals(sqlarguments.table))
        {
            Xlog.d("SettingsProvider", "table favorites , return null");
            return null;
        }
        String s = contentvalues.getAsString("name");
        if ("location_providers_allowed".equals(s) && !parseProviderList(uri, contentvalues))
        {
            Xlog.d("SettingsProvider", "location_providers_allowed, and parseProviderList fail, return null");
            return null;
        }
        if (s != null && (sSecureGlobalKeys.contains(s) || sSystemGlobalKeys.contains(s)))
        {
            if (!"global".equals(sqlarguments.table))
                Slog.i("SettingsProvider", (new StringBuilder()).append("Rewrite of insert() of now-global key ").append(s).toString());
            sqlarguments.table = "global";
        }
        checkWritePermissions(sqlarguments);
        if ("global".equals(sqlarguments.table))
            i = 0;
        String s1 = sqlarguments.table;
        SettingsCache settingscache = cacheForTable(i, s1);
        if (SettingsCache.isRedundantSetValue(settingscache, s, contentvalues.getAsString("value")))
            return Uri.withAppendedPath(uri, s);
        AtomicInteger atomicinteger = (AtomicInteger)sKnownMutationsInFlight.get(i);
        atomicinteger.incrementAndGet();
        long l = getOrEstablishDatabase(i).getWritableDatabase().insert(sqlarguments.table, null, contentvalues);
        atomicinteger.decrementAndGet();
        if (l <= 0L)
        {
            return null;
        } else
        {
            SettingsCache.populate(settingscache, contentvalues);
            Log.v("SettingsProvider", (new StringBuilder()).append(sqlarguments.table).append(" <- ").append(contentvalues).append(" for user ").append(i).toString());
            Uri uri1 = getUriFor(uri, contentvalues, l);
            sendNotify(uri1, i);
            return uri1;
        }
    }

    private Bundle lookupValue(DatabaseHelper databasehelper, String s, SettingsCache settingscache, String s1)
    {
        if (settingscache != null) goto _L2; else goto _L1
_L1:
        Bundle bundle1;
        Slog.e("SettingsProvider", (new StringBuilder()).append("cache is null for user ").append(UserHandle.getCallingUserId()).append(" : key=").append(s1).toString());
        bundle1 = null;
_L4:
        return bundle1;
_L2:
        settingscache;
        JVM INSTR monitorenter ;
        Bundle bundle;
        bundle = (Bundle)settingscache.get(s1);
        Xlog.d("SettingsProvider", (new StringBuilder()).append("lookupValue table ").append(s).append(" cache contains Key ").append(s1).append(" , value = ").append(bundle).toString());
        if (bundle == null)
            break MISSING_BLOCK_LABEL_135;
        if (bundle == TOO_LARGE_TO_CACHE_MARKER)
            break MISSING_BLOCK_LABEL_189;
        settingscache;
        JVM INSTR monitorexit ;
        return bundle;
        Exception exception;
        exception;
        settingscache;
        JVM INSTR monitorexit ;
        throw exception;
        Bundle bundle3;
        if (!settingscache.fullyMatchesDisk())
            break MISSING_BLOCK_LABEL_189;
        Xlog.d("SettingsProvider", (new StringBuilder()).append("lookupValue table ").append(s).append(" cache.fullyMatchesDisk() ").append(s1).toString());
        bundle3 = NULL_SETTING;
        settingscache;
        JVM INSTR monitorexit ;
        return bundle3;
        settingscache;
        JVM INSTR monitorexit ;
        SQLiteDatabase sqlitedatabase;
        Cursor cursor;
        Xlog.d("SettingsProvider", (new StringBuilder()).append("lookupValue table ").append(s).append(" Not get value from cache ").append(s1).toString());
        sqlitedatabase = databasehelper.getReadableDatabase();
        cursor = null;
        cursor = sqlitedatabase.query(s, COLUMN_VALUE, "name=?", new String[] {
            s1
        }, null, null, null, null);
        if (cursor == null)
            break; /* Loop/switch isn't completed */
        Bundle bundle2;
        if (cursor.getCount() != 1)
            break; /* Loop/switch isn't completed */
        cursor.moveToFirst();
        bundle2 = settingscache.putIfAbsent(s1, cursor.getString(0));
        bundle1 = bundle2;
        if (cursor != null)
        {
            cursor.close();
            return bundle1;
        }
        if (true) goto _L4; else goto _L3
_L3:
        if (cursor != null)
            cursor.close();
        settingscache.putIfAbsent(s1, null);
        return NULL_SETTING;
        SQLiteException sqliteexception;
        sqliteexception;
        Log.w("SettingsProvider", "settings lookup error", sqliteexception);
        bundle1 = null;
        if (cursor == null) goto _L4; else goto _L5
_L5:
        cursor.close();
        return null;
        Exception exception1;
        exception1;
        if (cursor != null)
            cursor.close();
        throw exception1;
    }

    private boolean parseProviderList(Uri uri, ContentValues contentvalues)
    {
        String s = contentvalues.getAsString("value");
        if (s == null || s.length() <= 1) goto _L2; else goto _L1
_L1:
        char c = s.charAt(0);
        if (c != '+' && c != '-') goto _L2; else goto _L3
_L3:
        String s1;
        String s2;
        Cursor cursor;
        s1 = s.substring(1);
        s2 = "";
        cursor = query(uri, new String[] {
            "value"
        }, "name='location_providers_allowed'", null, null);
        if (cursor == null || cursor.getCount() != 1)
            break MISSING_BLOCK_LABEL_118;
        String s4;
        cursor.moveToFirst();
        s4 = cursor.getString(0);
        s2 = s4;
        cursor.close();
        int i;
        int j;
        i = s2.indexOf(s1);
        j = i + s1.length();
        if (i > 0 && s2.charAt(i - 1) != ',')
            i = -1;
        if (j < s2.length() && s2.charAt(j) != ',')
            i = -1;
        if (c != '+' || i >= 0) goto _L5; else goto _L4
_L4:
        String s3;
        Exception exception;
        if (s2.length() == 0)
            s3 = s1;
        else
            s3 = (new StringBuilder()).append(s2).append(',').append(s1).toString();
_L12:
        if (s3 != null)
            contentvalues.put("value", s3);
_L2:
        return true;
        exception;
        cursor.close();
        throw exception;
_L5:
        if (c != '-' || i < 0) goto _L7; else goto _L6
_L6:
        if (i <= 0) goto _L9; else goto _L8
_L8:
        i--;
_L10:
        s3 = s2.substring(0, i);
        if (j < s2.length())
            s3 = (new StringBuilder()).append(s3).append(s2.substring(j)).toString();
        continue; /* Loop/switch isn't completed */
_L9:
        if (j < s2.length())
            j++;
        if (true) goto _L10; else goto _L7
_L7:
        return false;
        if (true) goto _L12; else goto _L11
_L11:
    }

    private Cursor queryForUser(Uri uri, String as[], String s, String as1[], String s1, int i)
    {
        Slog.v("SettingsProvider", (new StringBuilder()).append("query(").append(uri).append(") for user ").append(i).toString());
        SqlArguments sqlarguments = new SqlArguments(uri, s, as1);
        int j;
        SQLiteDatabase sqlitedatabase;
        if ("global".equals(sqlarguments.table))
            j = 0;
        else
            j = i;
        sqlitedatabase = getOrEstablishDatabase(j).getReadableDatabase();
        if ("favorites".equals(sqlarguments.table))
            return null;
        if ("old_favorites".equals(sqlarguments.table))
        {
            sqlarguments.table = "favorites";
            Cursor cursor1 = sqlitedatabase.rawQuery("PRAGMA table_info(favorites);", null);
            if (cursor1 != null)
            {
                boolean flag;
                if (cursor1.getCount() > 0)
                    flag = true;
                else
                    flag = false;
                cursor1.close();
                if (!flag)
                    return null;
            } else
            {
                return null;
            }
        }
        SQLiteQueryBuilder sqlitequerybuilder = new SQLiteQueryBuilder();
        sqlitequerybuilder.setTables(sqlarguments.table);
        Cursor cursor = sqlitequerybuilder.query(sqlitedatabase, as, sqlarguments.where, sqlarguments.args, null, null, s1);
        try
        {
            ((AbstractCursor)cursor).setNotificationUri(getContext().getContentResolver(), uri, i);
        }
        catch (ClassCastException classcastexception)
        {
            Log.wtf("SettingsProvider", "Incompatible cursor derivation!");
            throw classcastexception;
        }
        return cursor;
    }

    private void sendNotify(Uri uri, int i)
    {
        String s;
        boolean flag;
        s = (String)uri.getPathSegments().get(0);
        flag = s.equals("global");
        if (!s.equals("system")) goto _L2; else goto _L1
_L1:
        boolean flag1;
        String s1;
        s1 = "sys.settings_system_version";
        flag1 = true;
_L4:
        long l;
        if (s1 != null)
        {
            long l1 = 1L + SystemProperties.getLong(s1, 0L);
            Log.v("SettingsProvider", (new StringBuilder()).append("property: ").append(s1).append("=").append(l1).toString());
            SystemProperties.set(s1, Long.toString(l1));
        }
        if (flag1)
            mBackupManager.dataChanged();
        String s2 = uri.getQueryParameter("notify");
        if (s2 != null && !"true".equals(s2))
            break; /* Loop/switch isn't completed */
        int j;
        if (flag)
            j = -1;
        else
            j = i;
        l = Binder.clearCallingIdentity();
        getContext().getContentResolver().notifyChange(uri, null, true, j);
        Binder.restoreCallingIdentity(l);
        Log.v("SettingsProvider", (new StringBuilder()).append("notifying for ").append(j).append(": ").append(uri).toString());
        return;
_L2:
        if (s.equals("secure"))
        {
            s1 = "sys.settings_secure_version";
            flag1 = true;
        } else
        {
            flag1 = false;
            s1 = null;
            if (flag)
            {
                s1 = "sys.settings_global_version";
                flag1 = true;
            }
        }
        if (true) goto _L4; else goto _L3
        Exception exception;
        exception;
        Binder.restoreCallingIdentity(l);
        throw exception;
_L3:
        Log.v("SettingsProvider", (new StringBuilder()).append("notification suppressed: ").append(uri).toString());
        return;
    }

    private boolean settingMovedToGlobal(String s)
    {
        return sSecureGlobalKeys.contains(s) || sSystemGlobalKeys.contains(s);
    }

    private void startAsyncCachePopulation(int i)
    {
        (new CachePrefetchThread(i)).start();
    }

    public int bulkInsert(Uri uri, ContentValues acontentvalues[])
    {
        int i;
        SqlArguments sqlarguments;
        SettingsCache settingscache;
        AtomicInteger atomicinteger;
        SQLiteDatabase sqlitedatabase;
        int l;
        i = UserHandle.getCallingUserId();
        Slog.v("SettingsProvider", (new StringBuilder()).append("bulkInsert() for user ").append(i).toString());
        sqlarguments = new SqlArguments(uri);
        if ("favorites".equals(sqlarguments.table))
            return 0;
        checkWritePermissions(sqlarguments);
        settingscache = cacheForTable(i, sqlarguments.table);
        atomicinteger = (AtomicInteger)sKnownMutationsInFlight.get(i);
        atomicinteger.incrementAndGet();
        int j;
        int k;
        long l1;
        if ("global".equals(sqlarguments.table))
            j = 0;
        else
            j = i;
        sqlitedatabase = getOrEstablishDatabase(j).getWritableDatabase();
        sqlitedatabase.beginTransaction();
        k = acontentvalues.length;
        l = 0;
_L2:
        if (l >= k)
            break; /* Loop/switch isn't completed */
        l1 = sqlitedatabase.insert(sqlarguments.table, null, acontentvalues[l]);
        if (l1 < 0L)
        {
            sqlitedatabase.endTransaction();
            atomicinteger.decrementAndGet();
            return 0;
        }
        SettingsCache.populate(settingscache, acontentvalues[l]);
        Log.v("SettingsProvider", (new StringBuilder()).append(sqlarguments.table).append(" <- ").append(acontentvalues[l]).toString());
        l++;
        if (true) goto _L2; else goto _L1
_L1:
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        atomicinteger.decrementAndGet();
        sendNotify(uri, i);
        return acontentvalues.length;
        Exception exception;
        exception;
        sqlitedatabase.endTransaction();
        atomicinteger.decrementAndGet();
        throw exception;
    }

    public SettingsCache cacheForTable(int i, String s)
    {
        if ("system".equals(s))
            return getOrConstructCache(i, sSystemCaches);
        if ("secure".equals(s))
            return getOrConstructCache(i, sSecureCaches);
        if ("global".equals(s))
            return sGlobalCache;
        else
            return null;
    }

    public Bundle call(String s, String s1, Bundle bundle)
    {
        int i = UserHandle.getCallingUserId();
        if (bundle != null)
        {
            int j = bundle.getInt("_user", i);
            if (j != i)
            {
                i = ActivityManager.handleIncomingUser(Binder.getCallingPid(), Binder.getCallingUid(), j, false, true, "get/set setting for user", null);
                Slog.v("SettingsProvider", (new StringBuilder()).append("   access setting for user ").append(i).toString());
            }
        }
        Xlog.d("SettingsProvider", (new StringBuilder()).append("call request for ").append(i).toString());
        if ("GET_system".equals(s))
        {
            Slog.v("SettingsProvider", (new StringBuilder()).append("call(system:").append(s1).append(") for ").append(i).toString());
            return lookupValue(getOrEstablishDatabase(i), "system", (SettingsCache)sSystemCaches.get(i), s1);
        }
        if ("GET_secure".equals(s))
        {
            Slog.v("SettingsProvider", (new StringBuilder()).append("call(secure:").append(s1).append(") for ").append(i).toString());
            return lookupValue(getOrEstablishDatabase(i), "secure", (SettingsCache)sSecureCaches.get(i), s1);
        }
        if ("GET_global".equals(s))
        {
            Slog.v("SettingsProvider", (new StringBuilder()).append("call(global:").append(s1).append(") for ").append(i).toString());
            return lookupValue(getOrEstablishDatabase(0), "global", sGlobalCache, s1);
        }
        String s2;
        if (bundle == null)
            s2 = null;
        else
            s2 = bundle.getString("value");
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("name", s1);
        contentvalues.put("value", s2);
        if ("PUT_system".equals(s))
        {
            Slog.v("SettingsProvider", (new StringBuilder()).append("call_put(system:").append(s1).append("=").append(s2).append(") for ").append(i).toString());
            insertForUser(android.provider.Settings.System.CONTENT_URI, contentvalues, i);
            return null;
        }
        if ("PUT_secure".equals(s))
        {
            Slog.v("SettingsProvider", (new StringBuilder()).append("call_put(secure:").append(s1).append("=").append(s2).append(") for ").append(i).toString());
            insertForUser(android.provider.Settings.Secure.CONTENT_URI, contentvalues, i);
            return null;
        }
        if ("PUT_global".equals(s))
        {
            Slog.v("SettingsProvider", (new StringBuilder()).append("call_put(global:").append(s1).append("=").append(s2).append(") for ").append(i).toString());
            insertForUser(android.provider.Settings.Global.CONTENT_URI, contentvalues, i);
            return null;
        } else
        {
            Slog.w("SettingsProvider", (new StringBuilder()).append("call() with invalid method: ").append(s).toString());
            return null;
        }
    }

    public int delete(Uri uri, String s, String as[])
    {
        int i = UserHandle.getCallingUserId();
        Slog.v("SettingsProvider", (new StringBuilder()).append("delete() for user ").append(i).toString());
        SqlArguments sqlarguments = new SqlArguments(uri, s, as);
        if ("favorites".equals(sqlarguments.table))
            return 0;
        if ("old_favorites".equals(sqlarguments.table))
            sqlarguments.table = "favorites";
        else
        if ("global".equals(sqlarguments.table))
            i = 0;
        checkWritePermissions(sqlarguments);
        AtomicInteger atomicinteger = (AtomicInteger)sKnownMutationsInFlight.get(i);
        atomicinteger.incrementAndGet();
        int j = getOrEstablishDatabase(i).getWritableDatabase().delete(sqlarguments.table, sqlarguments.where, sqlarguments.args);
        atomicinteger.decrementAndGet();
        Xlog.d("SettingsProvider", (new StringBuilder()).append(sqlarguments.table).append(" delete ").append(sqlarguments.where).append(" ").append(sqlarguments.args).append(" count ").append(j).toString());
        if (j > 0)
        {
            invalidateCache(i, sqlarguments.table);
            sendNotify(uri, i);
        }
        startAsyncCachePopulation(i);
        Log.v("SettingsProvider", (new StringBuilder()).append(sqlarguments.table).append(": ").append(j).append(" row(s) deleted").toString());
        return j;
    }

    public String getType(Uri uri)
    {
        SqlArguments sqlarguments = new SqlArguments(uri, null, null);
        if (TextUtils.isEmpty(sqlarguments.where))
            return (new StringBuilder()).append("vnd.android.cursor.dir/").append(sqlarguments.table).toString();
        else
            return (new StringBuilder()).append("vnd.android.cursor.item/").append(sqlarguments.table).toString();
    }

    public Uri insert(Uri uri, ContentValues contentvalues)
    {
        return insertForUser(uri, contentvalues, UserHandle.getCallingUserId());
    }

    public void invalidateCache(int i, String s)
    {
        SettingsCache settingscache;
        settingscache = cacheForTable(i, s);
        if (settingscache == null)
            return;
        settingscache;
        JVM INSTR monitorenter ;
        settingscache.evictAll();
        settingscache.mCacheFullyMatchesDisk = false;
        settingscache;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        settingscache;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean onCreate()
    {
        mBackupManager = new BackupManager(getContext());
        mUserManager = (UserManager)getContext().getSystemService("user");
        establishDbTracking(0);
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.USER_REMOVED");
        getContext().registerReceiver(new BroadcastReceiver() {

            final SettingsProvider this$0;

            public void onReceive(Context context, Intent intent)
            {
                if (intent.getAction().equals("android.intent.action.USER_REMOVED"))
                {
                    int i = intent.getIntExtra("android.intent.extra.user_handle", 0);
                    if (i != 0)
                        onUserRemoved(i);
                }
            }

            
            {
                this$0 = SettingsProvider.this;
                super();
            }
        }
, intentfilter);
        return true;
    }

    void onUserRemoved(int i)
    {
        this;
        JVM INSTR monitorenter ;
        FileObserver fileobserver = (FileObserver)sObserverInstances.get(i);
        if (fileobserver == null)
            break MISSING_BLOCK_LABEL_28;
        fileobserver.stopWatching();
        sObserverInstances.delete(i);
        mOpenHelpers.delete(i);
        sSystemCaches.delete(i);
        sSecureCaches.delete(i);
        sKnownMutationsInFlight.delete(i);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public AssetFileDescriptor openAssetFile(Uri uri, String s)
        throws FileNotFoundException
    {
        int i;
        Context context;
        Uri uri1;
        i = RingtoneManager.getDefaultType(uri);
        if (i == -1)
            break MISSING_BLOCK_LABEL_249;
        context = getContext();
        uri1 = RingtoneManager.getActualDefaultRingtoneUri(context, i);
        if (uri1 == null)
            break MISSING_BLOCK_LABEL_241;
        String s1 = uri1.getAuthority();
        boolean flag = s1.equals("drm");
        if (!flag && !s1.equals("media"))
            break MISSING_BLOCK_LABEL_205;
        AssetFileDescriptor assetfiledescriptor;
        if (flag)
            try
            {
                DrmStore.enforceAccessDrmPermission(context);
            }
            catch (SecurityException securityexception)
            {
                throw new FileNotFoundException(securityexception.getMessage());
            }
        assetfiledescriptor = new AssetFileDescriptor(context.getContentResolver().openFileDescriptor(uri1, s), 0L, -1L);
        return assetfiledescriptor;
        FileNotFoundException filenotfoundexception;
        filenotfoundexception;
        Uri uri2 = getDefaultUri(context, i);
        StringBuilder stringbuilder = (new StringBuilder()).append("openAssetFile: defaultUri = ");
        String s2;
        AssetFileDescriptor assetfiledescriptor1;
        AssetFileDescriptor assetfiledescriptor2;
        Exception exception;
        if (uri2 == null)
            s2 = "null";
        else
            s2 = uri2.toString();
        Xlog.d("SettingsProvider", stringbuilder.append(s2).toString());
        if (uri2 == null)
            break MISSING_BLOCK_LABEL_205;
        assetfiledescriptor2 = new AssetFileDescriptor(context.getContentResolver().openFileDescriptor(uri2, s), 0L, -1L);
        return assetfiledescriptor2;
        exception;
        exception.printStackTrace();
        try
        {
            assetfiledescriptor1 = super.openAssetFile(uri1, s);
        }
        catch (FileNotFoundException filenotfoundexception1)
        {
            return context.getResources().openRawResourceFd(0x1100001);
        }
        return assetfiledescriptor1;
        throw new FileNotFoundException();
        return super.openAssetFile(uri, s);
    }

    public ParcelFileDescriptor openFile(Uri uri, String s)
        throws FileNotFoundException
    {
        int i = RingtoneManager.getDefaultType(uri);
        if (i != -1)
        {
            Context context = getContext();
            Uri uri1 = RingtoneManager.getActualDefaultRingtoneUri(context, i);
            if (uri1 != null)
            {
                String s1 = uri1.getAuthority();
                boolean flag = s1.equals("drm");
                if (flag || s1.equals("media"))
                {
                    if (flag)
                        try
                        {
                            DrmStore.enforceAccessDrmPermission(context);
                        }
                        catch (SecurityException securityexception)
                        {
                            throw new FileNotFoundException(securityexception.getMessage());
                        }
                    return context.getContentResolver().openFileDescriptor(uri1, s);
                }
            }
        }
        return super.openFile(uri, s);
    }

    public Cursor query(Uri uri, String as[], String s, String as1[], String s1)
    {
        return queryForUser(uri, as, s, as1, s1, UserHandle.getCallingUserId());
    }

    public int update(Uri uri, ContentValues contentvalues, String s, String as[])
    {
        int i = UserHandle.getCallingUserId();
        Slog.v("SettingsProvider", (new StringBuilder()).append("update() for user ").append(i).toString());
        SqlArguments sqlarguments = new SqlArguments(uri, s, as);
        if ("favorites".equals(sqlarguments.table))
            return 0;
        if ("global".equals(sqlarguments.table))
            i = 0;
        checkWritePermissions(sqlarguments);
        AtomicInteger atomicinteger = (AtomicInteger)sKnownMutationsInFlight.get(i);
        atomicinteger.incrementAndGet();
        int j = getOrEstablishDatabase(i).getWritableDatabase().update(sqlarguments.table, contentvalues, sqlarguments.where, sqlarguments.args);
        atomicinteger.decrementAndGet();
        if (j > 0)
        {
            invalidateCache(i, sqlarguments.table);
            sendNotify(uri, i);
        }
        startAsyncCachePopulation(i);
        Log.v("SettingsProvider", (new StringBuilder()).append(sqlarguments.table).append(": ").append(j).append(" row(s) <- ").append(contentvalues).toString());
        return j;
    }

    static 
    {
        sSecureGlobalKeys = new HashSet();
        android.provider.Settings.Secure.getMovedKeys(sSecureGlobalKeys);
        sSystemGlobalKeys = new HashSet();
        android.provider.Settings.System.getNonLegacyMovedKeys(sSystemGlobalKeys);
    }




}
