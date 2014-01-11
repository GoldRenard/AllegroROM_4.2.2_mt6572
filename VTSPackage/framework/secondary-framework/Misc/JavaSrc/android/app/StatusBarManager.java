// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.ComponentName;
import android.content.Context;
import android.os.*;
import android.util.Slog;
import com.android.internal.statusbar.IStatusBarService;
import com.mediatek.xlog.Xlog;

public class StatusBarManager
{

    public static final int DISABLE_BACK = 0x400000;
    public static final int DISABLE_CLOCK = 0x800000;
    public static final int DISABLE_EXPAND = 0x10000;
    public static final int DISABLE_HOME = 0x200000;
    public static final int DISABLE_MASK = 0x3ff0000;
    public static final int DISABLE_NAVIGATION = 0x1200000;
    public static final int DISABLE_NONE = 0;
    public static final int DISABLE_NOTIFICATION_ALERTS = 0x40000;
    public static final int DISABLE_NOTIFICATION_ICONS = 0x20000;
    public static final int DISABLE_NOTIFICATION_TICKER = 0x80000;
    public static final int DISABLE_RECENT = 0x1000000;
    public static final int DISABLE_SEARCH = 0x2000000;
    public static final int DISABLE_SYSTEM_INFO = 0x100000;
    public static final int NAVIGATION_HINT_BACK_ALT = 8;
    public static final int NAVIGATION_HINT_BACK_NOP = 1;
    public static final int NAVIGATION_HINT_HOME_NOP = 2;
    public static final int NAVIGATION_HINT_RECENT_NOP = 4;
    private static final String TAG = "StatusBarManager";
    private Context mContext;
    private IStatusBarService mService;
    private IBinder mToken;

    StatusBarManager(Context context)
    {
        mToken = new Binder();
        mContext = context;
    }

    private IStatusBarService getService()
    {
        this;
        JVM INSTR monitorenter ;
        IStatusBarService istatusbarservice;
        if (mService == null)
        {
            mService = com.android.internal.statusbar.IStatusBarService.Stub.asInterface(ServiceManager.getService("statusbar"));
            if (mService == null)
                Slog.w("StatusBarManager", "warning: no STATUS_BAR_SERVICE");
        }
        istatusbarservice = mService;
        this;
        JVM INSTR monitorexit ;
        return istatusbarservice;
        Exception exception;
        exception;
        throw exception;
    }

    public void collapsePanels()
    {
        IStatusBarService istatusbarservice;
        try
        {
            istatusbarservice = getService();
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
        if (istatusbarservice == null)
            break MISSING_BLOCK_LABEL_15;
        istatusbarservice.collapsePanels();
    }

    public void disable(int i)
    {
        IStatusBarService istatusbarservice;
        try
        {
            istatusbarservice = getService();
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
        if (istatusbarservice == null)
            break MISSING_BLOCK_LABEL_27;
        istatusbarservice.disable(i, mToken, mContext.getPackageName());
    }

    public void expandNotificationsPanel()
    {
        IStatusBarService istatusbarservice;
        try
        {
            istatusbarservice = getService();
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
        if (istatusbarservice == null)
            break MISSING_BLOCK_LABEL_15;
        istatusbarservice.expandNotificationsPanel();
    }

    public void expandSettingsPanel()
    {
        IStatusBarService istatusbarservice;
        try
        {
            istatusbarservice = getService();
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
        if (istatusbarservice == null)
            break MISSING_BLOCK_LABEL_15;
        istatusbarservice.expandSettingsPanel();
    }

    public void hideSimIndicator(ComponentName componentname)
    {
        String s;
        if (componentname == null)
            s = "null";
        else
            s = componentname.getPackageName();
        try
        {
            Xlog.d("StatusBarManager", (new StringBuilder()).append("Hide SIM indicator from ").append(s).append(".").toString());
            if (getService() != null)
                mService.hideSimIndicator();
            return;
        }
        catch (RemoteException remoteexception)
        {
            Xlog.d("StatusBarManager", (new StringBuilder()).append("Hide SIM indicator from ").append(s).append(" occurs exception.").toString());
            throw new RuntimeException(remoteexception);
        }
    }

    public void removeIcon(String s)
    {
        IStatusBarService istatusbarservice;
        try
        {
            istatusbarservice = getService();
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
        if (istatusbarservice == null)
            break MISSING_BLOCK_LABEL_16;
        istatusbarservice.removeIcon(s);
    }

    public void setIcon(String s, int i, int j, String s1)
    {
        IStatusBarService istatusbarservice;
        try
        {
            istatusbarservice = getService();
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
        if (istatusbarservice == null)
            break MISSING_BLOCK_LABEL_30;
        istatusbarservice.setIcon(s, mContext.getPackageName(), i, j, s1);
    }

    public void setIconVisibility(String s, boolean flag)
    {
        IStatusBarService istatusbarservice;
        try
        {
            istatusbarservice = getService();
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
        if (istatusbarservice == null)
            break MISSING_BLOCK_LABEL_20;
        istatusbarservice.setIconVisibility(s, flag);
    }

    public void showApplicationGuide(String s)
    {
        try
        {
            Xlog.d("StatusBarManager", (new StringBuilder()).append("show application guide from ").append(s).append(".").toString());
            if (getService() != null)
                mService.showApplicationGuide(s);
            return;
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException(remoteexception);
        }
    }

    public void showSimIndicator(ComponentName componentname, String s)
    {
        String s1;
        IStatusBarService istatusbarservice;
        if (componentname == null)
            s1 = "null";
        else
            s1 = componentname.getPackageName();
        try
        {
            Xlog.d("StatusBarManager", (new StringBuilder()).append("Show SIM indicator from ").append(s1).append(", businiss is ").append(s).append(".").toString());
            istatusbarservice = getService();
        }
        catch (RemoteException remoteexception)
        {
            Xlog.d("StatusBarManager", (new StringBuilder()).append("Show SIM indicator from ").append(s1).append(" occurs exception.").toString());
            throw new RuntimeException(remoteexception);
        }
        if (istatusbarservice == null)
            break MISSING_BLOCK_LABEL_65;
        istatusbarservice.showSimIndicator(s);
    }
}
