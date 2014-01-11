// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui;

import android.app.Service;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Slog;
import android.view.IWindowManager;
import android.view.WindowManagerGlobal;
import android.view.accessibility.AccessibilityManager;
import com.android.systemui.media.RingtonePlayer;
import com.android.systemui.power.PowerUI;
import java.io.FileDescriptor;
import java.io.PrintWriter;

// Referenced classes of package com.android.systemui:
//            SystemUI

public class SystemUIService extends Service
{

    static final String TAG = "SystemUIService";
    final Object SERVICES[];
    SystemUI mServices[];

    public SystemUIService()
    {
        Object aobj[] = new Object[3];
        aobj[0] = Integer.valueOf(0);
        aobj[1] = com/android/systemui/power/PowerUI;
        aobj[2] = com/android/systemui/media/RingtonePlayer;
        SERVICES = aobj;
    }

    private Class chooseClass(Object obj)
    {
        if (obj instanceof Integer)
        {
            String s = getString(((Integer)obj).intValue());
            Class class1;
            try
            {
                class1 = getClassLoader().loadClass(s);
            }
            catch (ClassNotFoundException classnotfoundexception)
            {
                throw new RuntimeException(classnotfoundexception);
            }
            return class1;
        }
        if (obj instanceof Class)
            return (Class)obj;
        else
            throw new RuntimeException((new StringBuilder()).append("Unknown system ui service: ").append(obj).toString());
    }

    protected void dump(FileDescriptor filedescriptor, PrintWriter printwriter, String as[])
    {
        if (as != null && as.length != 0)
        {
            String s = as[0];
            SystemUI asystemui1[] = mServices;
            int k = asystemui1.length;
            for (int l = 0; l < k; l++)
            {
                SystemUI systemui1 = asystemui1[l];
                if (systemui1.getClass().getName().endsWith(s))
                    systemui1.dump(filedescriptor, printwriter, as);
            }

        } else
        {
            SystemUI asystemui[] = mServices;
            int i = asystemui.length;
            for (int j = 0; j < i; j++)
            {
                SystemUI systemui = asystemui[j];
                printwriter.println((new StringBuilder()).append("dumping service: ").append(systemui.getClass().getName()).toString());
                systemui.dump(filedescriptor, printwriter, as);
            }

        }
    }

    public IBinder onBind(Intent intent)
    {
        return null;
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        SystemUI asystemui[] = mServices;
        int i = asystemui.length;
        for (int j = 0; j < i; j++)
            asystemui[j].onConfigurationChanged(configuration);

    }

    public void onCreate()
    {
        IWindowManager iwindowmanager;
        AccessibilityManager.createAsSharedAcrossUsers(this);
        iwindowmanager = WindowManagerGlobal.getWindowManagerService();
        Object aobj[] = SERVICES;
        int i;
        int j;
        int k;
        if (iwindowmanager.hasSystemNavBar())
            k = 0x7f0b0001;
        else
            k = 0x7f0b0000;
        try
        {
            aobj[0] = Integer.valueOf(k);
        }
        catch (RemoteException remoteexception)
        {
            Slog.w("SystemUIService", "Failing checking whether status bar can hide", remoteexception);
        }
        i = SERVICES.length;
        mServices = new SystemUI[i];
        j = 0;
        while (j < i) 
        {
            Class class1 = chooseClass(SERVICES[j]);
            Slog.d("SystemUIService", (new StringBuilder()).append("loading: ").append(class1).toString());
            try
            {
                mServices[j] = (SystemUI)class1.newInstance();
            }
            catch (IllegalAccessException illegalaccessexception)
            {
                throw new RuntimeException(illegalaccessexception);
            }
            catch (InstantiationException instantiationexception)
            {
                throw new RuntimeException(instantiationexception);
            }
            mServices[j].mContext = this;
            Slog.d("SystemUIService", (new StringBuilder()).append("running: ").append(mServices[j]).toString());
            mServices[j].start();
            j++;
        }
        return;
    }
}
