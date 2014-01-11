// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app.backup;

import android.content.Context;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.util.Log;

// Referenced classes of package android.app.backup:
//            IBackupManager, RestoreSession, RestoreObserver

public class BackupManager
{

    private static final String TAG = "BackupManager";
    private static IBackupManager sService;
    private Context mContext;

    public BackupManager(Context context)
    {
        mContext = context;
    }

    private static void checkServiceBinder()
    {
        if (sService == null)
            sService = IBackupManager.Stub.asInterface(ServiceManager.getService("backup"));
    }

    public static void dataChanged(String s)
    {
        checkServiceBinder();
        if (sService == null)
            break MISSING_BLOCK_LABEL_18;
        sService.dataChanged(s);
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.d("BackupManager", "dataChanged(pkg) couldn't connect");
        return;
    }

    public RestoreSession beginRestoreSession()
    {
        checkServiceBinder();
        IBackupManager ibackupmanager = sService;
        RestoreSession restoresession = null;
        if (ibackupmanager == null)
            break MISSING_BLOCK_LABEL_50;
        IRestoreSession irestoresession;
        RestoreSession restoresession1;
        try
        {
            irestoresession = sService.beginRestoreSession(null, null);
        }
        catch (RemoteException remoteexception)
        {
            Log.w("BackupManager", "beginRestoreSession() couldn't connect");
            return null;
        }
        restoresession = null;
        if (irestoresession == null)
            break MISSING_BLOCK_LABEL_50;
        restoresession1 = new RestoreSession(mContext, irestoresession);
        restoresession = restoresession1;
        return restoresession;
    }

    public void dataChanged()
    {
        checkServiceBinder();
        if (sService == null)
            break MISSING_BLOCK_LABEL_24;
        sService.dataChanged(mContext.getPackageName());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.d("BackupManager", "dataChanged() couldn't connect");
        return;
    }

    public int requestRestore(RestoreObserver restoreobserver)
    {
        int i;
        i = -1;
        checkServiceBinder();
        if (sService == null) goto _L2; else goto _L1
_L1:
        RestoreSession restoresession = null;
        IRestoreSession irestoresession = sService.beginRestoreSession(mContext.getPackageName(), null);
        restoresession = null;
        if (irestoresession == null)
            break MISSING_BLOCK_LABEL_74;
        RestoreSession restoresession1 = new RestoreSession(mContext, irestoresession);
        int j = restoresession1.restorePackage(mContext.getPackageName(), restoreobserver);
        i = j;
        restoresession = restoresession1;
        if (restoresession == null) goto _L2; else goto _L3
_L3:
        restoresession.endRestoreSession();
_L2:
        return i;
        RemoteException remoteexception;
        remoteexception;
_L6:
        Log.w("BackupManager", "restoreSelf() unable to contact service");
        if (restoresession == null) goto _L2; else goto _L3
        Exception exception;
        exception;
_L5:
        if (restoresession != null)
            restoresession.endRestoreSession();
        throw exception;
        exception;
        restoresession = restoresession1;
        if (true) goto _L5; else goto _L4
_L4:
        RemoteException remoteexception1;
        remoteexception1;
        restoresession = restoresession1;
          goto _L6
    }
}
