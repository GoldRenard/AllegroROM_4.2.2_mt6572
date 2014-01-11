// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.os.*;
import android.util.Singleton;

// Referenced classes of package android.app:
//            IANRManager, ANRManagerProxy

public abstract class ANRManagerNative extends Binder
    implements IANRManager
{

    private static final Singleton gDefault = new Singleton() {

        protected IANRManager create()
        {
            return ANRManagerNative.asInterface(ServiceManager.getService("anrmanager"));
        }

        protected volatile Object create()
        {
            return create();
        }

    }
;

    public ANRManagerNative()
    {
        attachInterface(this, "android.app.IANRManager");
    }

    public static IANRManager asInterface(IBinder ibinder)
    {
        IANRManager ianrmanager;
        if (ibinder == null)
        {
            ianrmanager = null;
        } else
        {
            ianrmanager = (IANRManager)ibinder.queryLocalInterface("android.app.IANRManager");
            if (ianrmanager == null)
                return new ANRManagerProxy(ibinder);
        }
        return ianrmanager;
    }

    public static IANRManager getDefault()
    {
        return (IANRManager)gDefault.get();
    }

    public IBinder asBinder()
    {
        return this;
    }

    public boolean onTransact(int i, Parcel parcel, Parcel parcel1, int j)
        throws RemoteException
    {
        switch (i)
        {
        case 3: // '\003'
            parcel.enforceInterface("android.app.IActivityManager");
            notifyLightWeightANR(parcel.readInt(), parcel.readString(), parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 2: // '\002'
            parcel.enforceInterface("android.app.IANRManager");
            boolean flag = notifyWNR(parcel.readInt(), parcel.readString());
            parcel1.writeNoException();
            int k;
            if (flag)
                k = 1;
            else
                k = 0;
            parcel1.writeInt(k);
            return true;
        }
        return super.onTransact(i, parcel, parcel1, j);
    }

}
