// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone.sip;

import android.content.Context;
import android.net.sip.SipProfile;
import android.util.Log;
import com.android.internal.os.AtomicFile;
import java.io.*;
import java.util.*;

// Referenced classes of package com.android.phone.sip:
//            SipSharedPreferences

public class SipProfileDb
{

    private static final String PROFILES_DIR = "/profiles/";
    private static final String PROFILE_OBJ_FILE = ".pobj";
    private static final String TAG = com/android/phone/sip/SipProfileDb.getSimpleName();
    private int mProfilesCount;
    private String mProfilesDirectory;
    private SipSharedPreferences mSipSharedPreferences;

    public SipProfileDb(Context context)
    {
        mProfilesCount = -1;
        mProfilesDirectory = (new StringBuilder()).append(context.getFilesDir().getAbsolutePath()).append("/profiles/").toString();
        mSipSharedPreferences = new SipSharedPreferences(context);
    }

    private void deleteProfile(File file)
    {
        if (file.isDirectory())
        {
            File afile[] = file.listFiles();
            int i = afile.length;
            for (int j = 0; j < i; j++)
                deleteProfile(afile[j]);

        }
        file.delete();
    }

    private SipProfile deserialize(File file)
        throws IOException
    {
        AtomicFile atomicfile;
        ObjectInputStream objectinputstream;
        atomicfile = new AtomicFile(file);
        objectinputstream = null;
        ObjectInputStream objectinputstream1 = new ObjectInputStream(atomicfile.openRead());
        SipProfile sipprofile = (SipProfile)objectinputstream1.readObject();
        if (objectinputstream1 != null)
            objectinputstream1.close();
        return sipprofile;
        ClassNotFoundException classnotfoundexception;
        classnotfoundexception;
_L4:
        Log.w(TAG, (new StringBuilder()).append("deserialize a profile: ").append(classnotfoundexception).toString());
        if (objectinputstream != null)
            objectinputstream.close();
        return null;
        Exception exception;
        exception;
_L2:
        if (objectinputstream != null)
            objectinputstream.close();
        throw exception;
        exception;
        objectinputstream = objectinputstream1;
        if (true) goto _L2; else goto _L1
_L1:
        classnotfoundexception;
        objectinputstream = objectinputstream1;
        if (true) goto _L4; else goto _L3
_L3:
    }

    private List retrieveSipProfileListInternal()
    {
        List list;
        File file;
        String as[];
        int i;
        int j;
        list = Collections.synchronizedList(new ArrayList());
        file = new File(mProfilesDirectory);
        as = file.list();
        if (as == null)
            return list;
        i = as.length;
        j = 0;
_L2:
        String s;
        File file1;
        if (j >= i)
            break MISSING_BLOCK_LABEL_143;
        s = as[j];
        file1 = new File(new File(file, s), ".pobj");
        if (file1.exists())
            break; /* Loop/switch isn't completed */
_L4:
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        SipProfile sipprofile = deserialize(file1);
        if (sipprofile == null) goto _L4; else goto _L3
_L3:
        if (!s.equals(sipprofile.getProfileName())) goto _L4; else goto _L5
_L5:
        list.add(sipprofile);
          goto _L4
        IOException ioexception;
        ioexception;
        Log.e(TAG, "retrieveProfileListFromStorage()", ioexception);
          goto _L4
        mProfilesCount = list.size();
        mSipSharedPreferences.setProfilesCount(mProfilesCount);
        return list;
    }

    public void deleteProfile(SipProfile sipprofile)
    {
        com/android/phone/sip/SipProfileDb;
        JVM INSTR monitorenter ;
        deleteProfile(new File((new StringBuilder()).append(mProfilesDirectory).append(sipprofile.getProfileName()).toString()));
        if (mProfilesCount < 0)
            retrieveSipProfileListInternal();
        SipSharedPreferences sipsharedpreferences = mSipSharedPreferences;
        int i = -1 + mProfilesCount;
        mProfilesCount = i;
        sipsharedpreferences.setProfilesCount(i);
        com/android/phone/sip/SipProfileDb;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        com/android/phone/sip/SipProfileDb;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int getProfilesCount()
    {
        if (mProfilesCount < 0)
            return mSipSharedPreferences.getProfilesCount();
        else
            return mProfilesCount;
    }

    public List retrieveSipProfileList()
    {
        com/android/phone/sip/SipProfileDb;
        JVM INSTR monitorenter ;
        List list = retrieveSipProfileListInternal();
        com/android/phone/sip/SipProfileDb;
        JVM INSTR monitorexit ;
        return list;
        Exception exception;
        exception;
        com/android/phone/sip/SipProfileDb;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void saveProfile(SipProfile sipprofile)
        throws IOException
    {
        com/android/phone/sip/SipProfileDb;
        JVM INSTR monitorenter ;
        AtomicFile atomicfile;
        if (mProfilesCount < 0)
            retrieveSipProfileListInternal();
        File file = new File((new StringBuilder()).append(mProfilesDirectory).append(sipprofile.getProfileName()).toString());
        if (!file.exists())
            file.mkdirs();
        atomicfile = new AtomicFile(new File(file, ".pobj"));
        java.io.FileOutputStream fileoutputstream;
        ObjectOutputStream objectoutputstream;
        fileoutputstream = null;
        objectoutputstream = null;
        ObjectOutputStream objectoutputstream1;
        fileoutputstream = atomicfile.startWrite();
        objectoutputstream1 = new ObjectOutputStream(fileoutputstream);
        objectoutputstream1.writeObject(sipprofile);
        objectoutputstream1.flush();
        SipSharedPreferences sipsharedpreferences = mSipSharedPreferences;
        int i = 1 + mProfilesCount;
        mProfilesCount = i;
        sipsharedpreferences.setProfilesCount(i);
        atomicfile.finishWrite(fileoutputstream);
        if (objectoutputstream1 == null)
            break MISSING_BLOCK_LABEL_157;
        objectoutputstream1.close();
        com/android/phone/sip/SipProfileDb;
        JVM INSTR monitorexit ;
        return;
        IOException ioexception;
        ioexception;
_L4:
        atomicfile.failWrite(fileoutputstream);
        throw ioexception;
        Exception exception1;
        exception1;
_L2:
        if (objectoutputstream == null)
            break MISSING_BLOCK_LABEL_185;
        objectoutputstream.close();
        throw exception1;
        Exception exception;
        exception;
        com/android/phone/sip/SipProfileDb;
        JVM INSTR monitorexit ;
        throw exception;
        exception1;
        objectoutputstream = objectoutputstream1;
        if (true) goto _L2; else goto _L1
_L1:
        ioexception;
        objectoutputstream = objectoutputstream1;
        if (true) goto _L4; else goto _L3
_L3:
    }

}
