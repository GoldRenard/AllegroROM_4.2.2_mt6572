// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.os.IInterface;
import android.os.RemoteException;

public interface IANRManager
    extends IInterface
{

    public static final int NOTIFY_LIGHTWEIGHT_ANR_TRANSACTION = 3;
    public static final int NOTIFY_WNR_TRANSACTION = 2;
    public static final String descriptor = "android.app.IANRManager";

    public abstract void notifyLightWeightANR(int i, String s, int j)
        throws RemoteException;

    public abstract boolean notifyWNR(int i, String s)
        throws RemoteException;
}
