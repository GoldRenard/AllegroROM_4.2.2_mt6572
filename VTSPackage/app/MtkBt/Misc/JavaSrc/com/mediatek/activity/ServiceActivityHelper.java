// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.activity;

import android.app.*;
import android.content.*;
import android.os.IBinder;
import android.widget.Toast;
import com.mediatek.bluetooth.util.BtLog;

public class ServiceActivityHelper
{
    public static interface ServiceActivity
    {

        public abstract Object asInterface(IBinder ibinder);

        public abstract String getServiceAction();

        public abstract void onServiceConnected();

        public abstract void onServiceDisconnected();

        public abstract void refreshActivityUi();
    }


    public static final int DIALOG_BUSY = -55158;
    protected ProgressDialog busyDialog;
    protected Boolean isServiceAvailable;
    public Object service;
    protected ServiceActivity serviceActivity;
    private ServiceConnection serviceConn;

    public ServiceActivityHelper(ServiceActivity serviceactivity)
    {
        isServiceAvailable = Boolean.valueOf(false);
        serviceConn = new ServiceConnection() {

            final ServiceActivityHelper this$0;

            public void onServiceConnected(ComponentName componentname, IBinder ibinder)
            {
                BtLog.i("onServiceConnected()[+]");
                service = serviceActivity.asInterface(ibinder);
                serviceActivity.onServiceConnected();
            }

            public void onServiceDisconnected(ComponentName componentname)
            {
                BtLog.w((new StringBuilder()).append("onServiceDisconnected()[+] component[").append(componentname).append("]").toString());
                serviceActivity.onServiceDisconnected();
                service = null;
                if (serviceActivity instanceof Activity)
                {
                    Activity activity = (Activity)serviceActivity;
                    Toast.makeText(activity, 0x7f05007a, 1);
                    activity.finish();
                }
            }

            
            {
                this$0 = ServiceActivityHelper.this;
                super();
            }
        }
;
        serviceActivity = serviceactivity;
    }

    public void acquireServiceLock()
    {
        synchronized (isServiceAvailable)
        {
            isServiceAvailable = Boolean.valueOf(false);
        }
        return;
        exception;
        boolean1;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean bindService(Context context)
    {
        BtLog.d("bindService()[+]");
        isServiceAvailable = Boolean.valueOf(false);
        boolean flag = context.bindService(new Intent(serviceActivity.getServiceAction()), serviceConn, 5);
        if (!flag)
            BtLog.e((new StringBuilder()).append("bind service failed: action[").append(serviceActivity.getServiceAction()).append("]").toString());
        return flag;
    }

    public Dialog createBusyDialog(int i, Context context)
    {
        BtLog.d("createBusyDialog()[+]");
        if (i != -55158)
        {
            return null;
        } else
        {
            busyDialog = new ProgressDialog(context);
            busyDialog.setMessage(context.getString(0x7f050079));
            busyDialog.setIndeterminate(true);
            busyDialog.setCancelable(false);
            return busyDialog;
        }
    }

    public void refreshUi(Activity activity)
    {
        Boolean boolean1 = isServiceAvailable;
        boolean1;
        JVM INSTR monitorenter ;
        if (isServiceAvailable.booleanValue())
            break MISSING_BLOCK_LABEL_26;
        activity.showDialog(-55158);
_L2:
        return;
        serviceActivity.refreshActivityUi();
        if (busyDialog != null && busyDialog.isShowing())
            activity.dismissDialog(-55158);
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        boolean1;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void releaseServiceLock()
    {
        synchronized (isServiceAvailable)
        {
            isServiceAvailable = Boolean.valueOf(true);
        }
        return;
        exception;
        boolean1;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void unbindService(Context context)
    {
        BtLog.d("unbindService()[+]");
        context.unbindService(serviceConn);
        service = null;
        busyDialog = null;
    }
}
