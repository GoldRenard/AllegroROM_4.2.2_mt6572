// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.os.RemoteException;
import android.os.ServiceManager;
import android.util.Log;

// Referenced classes of package android.app:
//            IUiModeManager

public class UiModeManager
{

    public static String ACTION_ENTER_CAR_MODE = "android.app.action.ENTER_CAR_MODE";
    public static String ACTION_ENTER_DESK_MODE = "android.app.action.ENTER_DESK_MODE";
    public static String ACTION_EXIT_CAR_MODE = "android.app.action.EXIT_CAR_MODE";
    public static String ACTION_EXIT_DESK_MODE = "android.app.action.EXIT_DESK_MODE";
    public static final int DISABLE_CAR_MODE_GO_HOME = 1;
    public static final int ENABLE_CAR_MODE_GO_CAR_HOME = 1;
    public static final int MODE_NIGHT_AUTO = 0;
    public static final int MODE_NIGHT_NO = 1;
    public static final int MODE_NIGHT_YES = 2;
    private static final String TAG = "UiModeManager";
    private IUiModeManager mService;

    UiModeManager()
    {
        mService = IUiModeManager.Stub.asInterface(ServiceManager.getService("uimode"));
    }

    public void disableCarMode(int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_17;
        mService.disableCarMode(i);
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.e("UiModeManager", "disableCarMode: RemoteException", remoteexception);
        return;
    }

    public void enableCarMode(int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_17;
        mService.enableCarMode(i);
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.e("UiModeManager", "disableCarMode: RemoteException", remoteexception);
        return;
    }

    public int getCurrentModeType()
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_29;
        int i = mService.getCurrentModeType();
        return i;
        RemoteException remoteexception;
        remoteexception;
        Log.e("UiModeManager", "getCurrentModeType: RemoteException", remoteexception);
        return 1;
    }

    public int getNightMode()
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_29;
        int i = mService.getNightMode();
        return i;
        RemoteException remoteexception;
        remoteexception;
        Log.e("UiModeManager", "getNightMode: RemoteException", remoteexception);
        return -1;
    }

    public void setNightMode(int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_17;
        mService.setNightMode(i);
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.e("UiModeManager", "setNightMode: RemoteException", remoteexception);
        return;
    }

}
