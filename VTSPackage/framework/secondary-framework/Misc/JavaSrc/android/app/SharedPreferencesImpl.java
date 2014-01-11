// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.SharedPreferences;
import android.os.*;
import android.util.Log;
import com.android.internal.util.XmlUtils;
import com.google.android.collect.Maps;
import dalvik.system.BlockGuard;
import java.io.*;
import java.util.*;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import libcore.io.*;
import org.xmlpull.v1.XmlPullParserException;

// Referenced classes of package android.app:
//            QueuedWork, ContextImpl, ActivityThread

final class SharedPreferencesImpl
    implements SharedPreferences
{
    public final class EditorImpl
        implements android.content.SharedPreferences.Editor
    {

        private boolean mClear;
        private final Map mModified = Maps.newHashMap();
        final SharedPreferencesImpl this$0;

        private MemoryCommitResult commitToMemory()
        {
            boolean flag;
            MemoryCommitResult memorycommitresult;
            flag = true;
            memorycommitresult = new MemoryCommitResult();
            SharedPreferencesImpl sharedpreferencesimpl = SharedPreferencesImpl.this;
            sharedpreferencesimpl;
            JVM INSTR monitorenter ;
            if (mDiskWritesInFlight > 0)
                mMap = new HashMap(mMap);
            memorycommitresult.mapToWriteToDisk = mMap;
            int i = ((<init>) (this)).<init>;
            String s;
            Object obj;
            Exception exception;
            Exception exception1;
            Iterator iterator;
            java.util.Map.Entry entry;
            if (mListeners.size() <= 0)
                flag = false;
            if (!flag)
                break MISSING_BLOCK_LABEL_118;
            memorycommitresult.keysModified = new ArrayList();
            memorycommitresult.listeners = new HashSet(mListeners.keySet());
            this;
            JVM INSTR monitorenter ;
            if (mClear)
            {
                if (!mMap.isEmpty())
                {
                    memorycommitresult.changesMade = true;
                    mMap.clear();
                }
                mClear = false;
            }
            iterator = mModified.entrySet().iterator();
_L7:
            if (!iterator.hasNext()) goto _L2; else goto _L1
_L1:
            entry = (java.util.Map.Entry)iterator.next();
            s = (String)entry.getKey();
            obj = entry.getValue();
            if (obj != this) goto _L4; else goto _L3
_L3:
            if (!mMap.containsKey(s))
                continue; /* Loop/switch isn't completed */
            mMap.remove(s);
_L5:
            memorycommitresult.changesMade = true;
            if (!flag)
                continue; /* Loop/switch isn't completed */
            memorycommitresult.keysModified.add(s);
            continue; /* Loop/switch isn't completed */
            exception1;
            this;
            JVM INSTR monitorexit ;
            throw exception1;
            exception;
            sharedpreferencesimpl;
            JVM INSTR monitorexit ;
            throw exception;
_L4:
            Object obj1;
            if (!mMap.containsKey(s))
                break MISSING_BLOCK_LABEL_352;
            obj1 = mMap.get(s);
            if (obj1 == null)
                break MISSING_BLOCK_LABEL_352;
            if (obj1.equals(obj))
                continue; /* Loop/switch isn't completed */
            mMap.put(s, obj);
              goto _L5
_L2:
            mModified.clear();
            this;
            JVM INSTR monitorexit ;
            sharedpreferencesimpl;
            JVM INSTR monitorexit ;
            return memorycommitresult;
            if (true) goto _L7; else goto _L6
_L6:
        }

        private void notifyListeners(MemoryCommitResult memorycommitresult)
        {
label0:
            {
                if (memorycommitresult.listeners != null && memorycommitresult.keysModified != null && memorycommitresult.keysModified.size() != 0)
                {
                    if (Looper.myLooper() != Looper.getMainLooper())
                        break label0;
label1:
                    for (int i = -1 + memorycommitresult.keysModified.size(); i >= 0; i--)
                    {
                        String s = (String)memorycommitresult.keysModified.get(i);
                        Iterator iterator = memorycommitresult.listeners.iterator();
                        do
                        {
                            if (!iterator.hasNext())
                                continue label1;
                            android.content.SharedPreferences.OnSharedPreferenceChangeListener onsharedpreferencechangelistener = (android.content.SharedPreferences.OnSharedPreferenceChangeListener)iterator.next();
                            if (onsharedpreferencechangelistener != null)
                                onsharedpreferencechangelistener.onSharedPreferenceChanged(SharedPreferencesImpl.this, s);
                        } while (true);
                    }

                }
                return;
            }
            ActivityThread.sMainThreadHandler.post(memorycommitresult. new Runnable() {

                final EditorImpl this$1;
                final MemoryCommitResult val$mcr;

                public void run()
                {
                    notifyListeners(mcr);
                }

            
            {
                this$1 = final_editorimpl;
                mcr = MemoryCommitResult.this;
                super();
            }
            }
);
        }

        public void apply()
        {
            MemoryCommitResult memorycommitresult = commitToMemory();
            Runnable runnable = memorycommitresult. new Runnable() {

                final EditorImpl this$1;
                final MemoryCommitResult val$mcr;

                public void run()
                {
                    try
                    {
                        mcr.writtenToDiskLatch.await();
                        return;
                    }
                    catch (InterruptedException interruptedexception)
                    {
                        return;
                    }
                }

            
            {
                this$1 = final_editorimpl;
                mcr = MemoryCommitResult.this;
                super();
            }
            }
;
            QueuedWork.add(runnable);
            Runnable runnable1 = runnable. new Runnable() {

                final EditorImpl this$1;
                final Runnable val$awaitCommit;

                public void run()
                {
                    awaitCommit.run();
                    QueuedWork.remove(awaitCommit);
                }

            
            {
                this$1 = final_editorimpl;
                awaitCommit = Runnable.this;
                super();
            }
            }
;
            enqueueDiskWrite(memorycommitresult, runnable1);
            notifyListeners(memorycommitresult);
        }

        public android.content.SharedPreferences.Editor clear()
        {
            this;
            JVM INSTR monitorenter ;
            mClear = true;
            this;
            JVM INSTR monitorexit ;
            return this;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean commit()
        {
            MemoryCommitResult memorycommitresult = commitToMemory();
            enqueueDiskWrite(memorycommitresult, null);
            try
            {
                memorycommitresult.writtenToDiskLatch.await();
            }
            catch (InterruptedException interruptedexception)
            {
                return false;
            }
            notifyListeners(memorycommitresult);
            return memorycommitresult.writeToDiskResult;
        }

        public android.content.SharedPreferences.Editor putBoolean(String s, boolean flag)
        {
            this;
            JVM INSTR monitorenter ;
            mModified.put(s, Boolean.valueOf(flag));
            this;
            JVM INSTR monitorexit ;
            return this;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public android.content.SharedPreferences.Editor putFloat(String s, float f)
        {
            this;
            JVM INSTR monitorenter ;
            mModified.put(s, Float.valueOf(f));
            this;
            JVM INSTR monitorexit ;
            return this;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public android.content.SharedPreferences.Editor putInt(String s, int i)
        {
            this;
            JVM INSTR monitorenter ;
            mModified.put(s, Integer.valueOf(i));
            this;
            JVM INSTR monitorexit ;
            return this;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public android.content.SharedPreferences.Editor putLong(String s, long l)
        {
            this;
            JVM INSTR monitorenter ;
            mModified.put(s, Long.valueOf(l));
            this;
            JVM INSTR monitorexit ;
            return this;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public android.content.SharedPreferences.Editor putString(String s, String s1)
        {
            this;
            JVM INSTR monitorenter ;
            mModified.put(s, s1);
            this;
            JVM INSTR monitorexit ;
            return this;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public android.content.SharedPreferences.Editor putStringSet(String s, Set set)
        {
            this;
            JVM INSTR monitorenter ;
            Map map = mModified;
            if (set != null) goto _L2; else goto _L1
_L1:
            HashSet hashset = null;
_L4:
            map.put(s, hashset);
            this;
            JVM INSTR monitorexit ;
            return this;
_L2:
            hashset = new HashSet(set);
            if (true) goto _L4; else goto _L3
_L3:
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public android.content.SharedPreferences.Editor remove(String s)
        {
            this;
            JVM INSTR monitorenter ;
            mModified.put(s, this);
            this;
            JVM INSTR monitorexit ;
            return this;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }


        public EditorImpl()
        {
            this$0 = SharedPreferencesImpl.this;
            super();
            mClear = false;
        }
    }

    private static class MemoryCommitResult
    {

        public boolean changesMade;
        public List keysModified;
        public Set listeners;
        public Map mapToWriteToDisk;
        public volatile boolean writeToDiskResult;
        public final CountDownLatch writtenToDiskLatch;

        public void setDiskWriteResult(boolean flag)
        {
            writeToDiskResult = flag;
            writtenToDiskLatch.countDown();
        }

        private MemoryCommitResult()
        {
            writtenToDiskLatch = new CountDownLatch(1);
            writeToDiskResult = false;
        }

    }


    private static final boolean DEBUG = false;
    private static final String TAG = "SharedPreferencesImpl";
    private static final Object mContent = new Object();
    private final File mBackupFile;
    private int mDiskWritesInFlight;
    private final File mFile;
    private final WeakHashMap mListeners = new WeakHashMap();
    private boolean mLoaded;
    private Map mMap;
    private final int mMode;
    private long mStatSize;
    private long mStatTimestamp;
    private final Object mWritingToDiskLock = new Object();

    SharedPreferencesImpl(File file, int i)
    {
        mDiskWritesInFlight = 0;
        mLoaded = false;
        mFile = file;
        mBackupFile = makeBackupFile(file);
        mMode = i;
        mLoaded = false;
        mMap = null;
        startLoadFromDisk();
    }

    private void awaitLoadedLocked()
    {
        if (!mLoaded)
            BlockGuard.getThreadPolicy().onReadFromDisk();
        while (!mLoaded) 
            try
            {
                wait();
            }
            catch (InterruptedException interruptedexception) { }
    }

    private static FileOutputStream createFileOutputStream(File file)
    {
        FileOutputStream fileoutputstream = new FileOutputStream(file);
        FileOutputStream fileoutputstream1 = fileoutputstream;
_L2:
        return fileoutputstream1;
        FileNotFoundException filenotfoundexception;
        filenotfoundexception;
        File file1 = file.getParentFile();
        if (!file1.mkdir())
        {
            Log.e("SharedPreferencesImpl", (new StringBuilder()).append("Couldn't create directory for SharedPreferences file ").append(file).toString());
            return null;
        }
        FileUtils.setPermissions(file1.getPath(), 505, -1, -1);
        FileOutputStream fileoutputstream2 = new FileOutputStream(file);
        fileoutputstream1 = fileoutputstream2;
        continue; /* Loop/switch isn't completed */
        FileNotFoundException filenotfoundexception1;
        filenotfoundexception1;
        Log.e("SharedPreferencesImpl", (new StringBuilder()).append("Couldn't create SharedPreferences file ").append(file).toString(), filenotfoundexception1);
        fileoutputstream1 = null;
        if (true) goto _L2; else goto _L1
_L1:
    }

    private void enqueueDiskWrite(final MemoryCommitResult mcr, final Runnable postWriteRunnable)
    {
        Runnable runnable;
        boolean flag1;
        runnable = new Runnable() {

            final SharedPreferencesImpl this$0;
            final MemoryCommitResult val$mcr;
            final Runnable val$postWriteRunnable;

            public void run()
            {
                synchronized (mWritingToDiskLock)
                {
                    writeToFile(mcr);
                }
                synchronized (SharedPreferencesImpl.this)
                {
                    int i = ((run) (this)).run;
                }
                if (postWriteRunnable != null)
                    postWriteRunnable.run();
                return;
                exception1;
                obj;
                JVM INSTR monitorexit ;
                throw exception1;
                exception2;
                sharedpreferencesimpl;
                JVM INSTR monitorexit ;
                throw exception2;
            }

            
            {
                this$0 = SharedPreferencesImpl.this;
                mcr = memorycommitresult;
                postWriteRunnable = runnable;
                super();
            }
        }
;
        boolean flag;
        if (postWriteRunnable == null)
            flag = true;
        else
            flag = false;
        if (!flag)
            break MISSING_BLOCK_LABEL_69;
        this;
        JVM INSTR monitorenter ;
        if (mDiskWritesInFlight == 1)
            flag1 = true;
        else
            flag1 = false;
        this;
        JVM INSTR monitorexit ;
        if (flag1)
        {
            runnable.run();
            return;
        }
        break MISSING_BLOCK_LABEL_69;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        QueuedWork.singleThreadExecutor().execute(runnable);
        return;
    }

    private boolean hasFileChangedUnexpectedly()
    {
        this;
        JVM INSTR monitorenter ;
        if (mDiskWritesInFlight <= 0)
            break MISSING_BLOCK_LABEL_13;
        this;
        JVM INSTR monitorexit ;
        return false;
        this;
        JVM INSTR monitorexit ;
        BlockGuard.getThreadPolicy().onReadFromDisk();
        StructStat structstat = Libcore.os.stat(mFile.getPath());
        this;
        JVM INSTR monitorenter ;
        if (mStatTimestamp != structstat.st_mtime) goto _L2; else goto _L1
_L1:
        int i = mStatSize != structstat.st_size;
        boolean flag = false;
        if (i == 0) goto _L3; else goto _L2
_L3:
        this;
        JVM INSTR monitorexit ;
        return flag;
        Exception exception1;
        exception1;
        this;
        JVM INSTR monitorexit ;
        throw exception1;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        ErrnoException errnoexception;
        errnoexception;
        return true;
_L2:
        flag = true;
        if (true) goto _L3; else goto _L4
_L4:
    }

    private void loadFromDiskLocked()
    {
        HashMap hashmap;
        StructStat structstat;
        if (mLoaded)
            return;
        if (mBackupFile.exists())
        {
            mFile.delete();
            mBackupFile.renameTo(mFile);
        }
        if (mFile.exists() && !mFile.canRead())
            Log.w("SharedPreferencesImpl", (new StringBuilder()).append("Attempt to read preferences file ").append(mFile).append(" without permission").toString());
        hashmap = null;
        structstat = null;
        boolean flag;
        structstat = Libcore.os.stat(mFile.getPath());
        flag = mFile.canRead();
        Object obj;
        hashmap = null;
        if (!flag)
            break MISSING_BLOCK_LABEL_168;
        obj = null;
        BufferedInputStream bufferedinputstream = new BufferedInputStream(new FileInputStream(mFile), 16384);
        HashMap hashmap1 = XmlUtils.readMapXml(bufferedinputstream);
        XmlPullParserException xmlpullparserexception;
        hashmap = hashmap1;
        try
        {
            IoUtils.closeQuietly(bufferedinputstream);
        }
        catch (ErrnoException errnoexception) { }
_L1:
        Exception exception;
        FileNotFoundException filenotfoundexception;
        IOException ioexception;
        ArrayIndexOutOfBoundsException arrayindexoutofboundsexception;
        mLoaded = true;
        if (hashmap != null)
        {
            mMap = hashmap;
            mStatTimestamp = structstat.st_mtime;
            mStatSize = structstat.st_size;
        } else
        {
            mMap = new HashMap();
        }
        notifyAll();
        return;
        xmlpullparserexception;
_L6:
        Log.w("SharedPreferencesImpl", "getSharedPreferences", xmlpullparserexception);
        IoUtils.closeQuietly(((AutoCloseable) (obj)));
        hashmap = null;
        break MISSING_BLOCK_LABEL_168;
        filenotfoundexception;
_L5:
        Log.w("SharedPreferencesImpl", "getSharedPreferences", filenotfoundexception);
        IoUtils.closeQuietly(((AutoCloseable) (obj)));
        hashmap = null;
          goto _L1
        ioexception;
_L4:
        Log.w("SharedPreferencesImpl", "getSharedPreferences", ioexception);
        IoUtils.closeQuietly(((AutoCloseable) (obj)));
        hashmap = null;
          goto _L1
        arrayindexoutofboundsexception;
_L3:
        Log.w("SharedPreferencesImpl", "getSharedPreferences", arrayindexoutofboundsexception);
        IoUtils.closeQuietly(((AutoCloseable) (obj)));
        hashmap = null;
          goto _L1
_L2:
        IoUtils.closeQuietly(((AutoCloseable) (obj)));
        throw exception;
        exception;
        obj = bufferedinputstream;
          goto _L2
        arrayindexoutofboundsexception;
        obj = bufferedinputstream;
          goto _L3
        ioexception;
        obj = bufferedinputstream;
          goto _L4
        filenotfoundexception;
        obj = bufferedinputstream;
          goto _L5
        xmlpullparserexception;
        obj = bufferedinputstream;
          goto _L6
        exception;
          goto _L2
    }

    private static File makeBackupFile(File file)
    {
        return new File((new StringBuilder()).append(file.getPath()).append(".bak").toString());
    }

    private void startLoadFromDisk()
    {
        this;
        JVM INSTR monitorenter ;
        mLoaded = false;
        this;
        JVM INSTR monitorexit ;
        (new Thread("SharedPreferencesImpl-load") {

            final SharedPreferencesImpl this$0;

            public void run()
            {
                synchronized (SharedPreferencesImpl.this)
                {
                    loadFromDiskLocked();
                }
                return;
                exception1;
                sharedpreferencesimpl;
                JVM INSTR monitorexit ;
                throw exception1;
            }

            
            {
                this$0 = SharedPreferencesImpl.this;
                super(s);
            }
        }
).start();
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void writeToFile(MemoryCommitResult memorycommitresult)
    {
        if (mFile.exists())
        {
            if (!memorycommitresult.changesMade)
            {
                memorycommitresult.setDiskWriteResult(true);
                return;
            }
            if (!mBackupFile.exists())
            {
                if (!mFile.renameTo(mBackupFile))
                {
                    Log.e("SharedPreferencesImpl", (new StringBuilder()).append("Couldn't rename file ").append(mFile).append(" to backup file ").append(mBackupFile).toString());
                    memorycommitresult.setDiskWriteResult(false);
                    return;
                }
            } else
            {
                mFile.delete();
            }
        }
        FileOutputStream fileoutputstream = createFileOutputStream(mFile);
        if (fileoutputstream == null)
        {
            StructStat structstat;
            try
            {
                memorycommitresult.setDiskWriteResult(false);
                return;
            }
            catch (XmlPullParserException xmlpullparserexception)
            {
                Log.w("SharedPreferencesImpl", "writeToFile: Got exception:", xmlpullparserexception);
            }
            catch (IOException ioexception)
            {
                Log.w("SharedPreferencesImpl", "writeToFile: Got exception:", ioexception);
            }
            if (mFile.exists() && !mFile.delete())
                Log.e("SharedPreferencesImpl", (new StringBuilder()).append("Couldn't clean up partially-written file ").append(mFile).toString());
            memorycommitresult.setDiskWriteResult(false);
            return;
        }
        XmlUtils.writeMapXml(memorycommitresult.mapToWriteToDisk, fileoutputstream);
        FileUtils.sync(fileoutputstream);
        fileoutputstream.close();
        ContextImpl.setFilePermissionsFromMode(mFile.getPath(), mMode, 0);
        structstat = Libcore.os.stat(mFile.getPath());
        this;
        JVM INSTR monitorenter ;
        mStatTimestamp = structstat.st_mtime;
        mStatSize = structstat.st_size;
        this;
        JVM INSTR monitorexit ;
_L2:
        mBackupFile.delete();
        memorycommitresult.setDiskWriteResult(true);
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        ErrnoException errnoexception;
        errnoexception;
        if (true) goto _L2; else goto _L1
_L1:
    }

    public boolean contains(String s)
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag;
        awaitLoadedLocked();
        flag = mMap.containsKey(s);
        this;
        JVM INSTR monitorexit ;
        return flag;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public android.content.SharedPreferences.Editor edit()
    {
        this;
        JVM INSTR monitorenter ;
        awaitLoadedLocked();
        this;
        JVM INSTR monitorexit ;
        return new EditorImpl();
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public Map getAll()
    {
        this;
        JVM INSTR monitorenter ;
        HashMap hashmap;
        awaitLoadedLocked();
        hashmap = new HashMap(mMap);
        this;
        JVM INSTR monitorexit ;
        return hashmap;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean getBoolean(String s, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        Boolean boolean1;
        awaitLoadedLocked();
        boolean1 = (Boolean)mMap.get(s);
        if (boolean1 == null)
            break MISSING_BLOCK_LABEL_32;
        flag = boolean1.booleanValue();
        this;
        JVM INSTR monitorexit ;
        return flag;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public float getFloat(String s, float f)
    {
        this;
        JVM INSTR monitorenter ;
        Float float1;
        awaitLoadedLocked();
        float1 = (Float)mMap.get(s);
        if (float1 == null)
            break MISSING_BLOCK_LABEL_32;
        f = float1.floatValue();
        this;
        JVM INSTR monitorexit ;
        return f;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int getInt(String s, int i)
    {
        this;
        JVM INSTR monitorenter ;
        Integer integer;
        awaitLoadedLocked();
        integer = (Integer)mMap.get(s);
        if (integer == null)
            break MISSING_BLOCK_LABEL_32;
        i = integer.intValue();
        this;
        JVM INSTR monitorexit ;
        return i;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public long getLong(String s, long l)
    {
        this;
        JVM INSTR monitorenter ;
        Long long1;
        awaitLoadedLocked();
        long1 = (Long)mMap.get(s);
        if (long1 == null)
            break MISSING_BLOCK_LABEL_32;
        l = long1.longValue();
        this;
        JVM INSTR monitorexit ;
        return l;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public String getString(String s, String s1)
    {
        this;
        JVM INSTR monitorenter ;
        String s2;
        awaitLoadedLocked();
        s2 = (String)mMap.get(s);
        Exception exception;
        if (s2 == null)
            s2 = s1;
        this;
        JVM INSTR monitorexit ;
        return s2;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public Set getStringSet(String s, Set set)
    {
        this;
        JVM INSTR monitorenter ;
        Set set1;
        awaitLoadedLocked();
        set1 = (Set)mMap.get(s);
        Exception exception;
        if (set1 == null)
            set1 = set;
        this;
        JVM INSTR monitorexit ;
        return set1;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void registerOnSharedPreferenceChangeListener(android.content.SharedPreferences.OnSharedPreferenceChangeListener onsharedpreferencechangelistener)
    {
        this;
        JVM INSTR monitorenter ;
        mListeners.put(onsharedpreferencechangelistener, mContent);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void startReloadIfChangedUnexpectedly()
    {
        this;
        JVM INSTR monitorenter ;
        if (hasFileChangedUnexpectedly())
            break MISSING_BLOCK_LABEL_12;
        this;
        JVM INSTR monitorexit ;
        return;
        startLoadFromDisk();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void unregisterOnSharedPreferenceChangeListener(android.content.SharedPreferences.OnSharedPreferenceChangeListener onsharedpreferencechangelistener)
    {
        this;
        JVM INSTR monitorenter ;
        mListeners.remove(onsharedpreferencechangelistener);
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
    static int access$308(SharedPreferencesImpl sharedpreferencesimpl)
    {
        int i = sharedpreferencesimpl.mDiskWritesInFlight;
        sharedpreferencesimpl.mDiskWritesInFlight = i + 1;
        return i;
    }

*/


/*
    static int access$310(SharedPreferencesImpl sharedpreferencesimpl)
    {
        int i = sharedpreferencesimpl.mDiskWritesInFlight;
        sharedpreferencesimpl.mDiskWritesInFlight = i - 1;
        return i;
    }

*/



/*
    static Map access$402(SharedPreferencesImpl sharedpreferencesimpl, Map map)
    {
        sharedpreferencesimpl.mMap = map;
        return map;
    }

*/



}
