// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.ComponentName;
import android.os.*;

public interface IServiceConnection
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IServiceConnection
    {

        private static final String DESCRIPTOR = "android.app.IServiceConnection";
        static final int TRANSACTION_connected = 1;

        public static IServiceConnection asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.app.IServiceConnection");
            if (iinterface != null && (iinterface instanceof IServiceConnection))
                return (IServiceConnection)iinterface;
            else
                return new Proxy(ibinder);
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
            case 1: // '\001'
                parcel.enforceInterface("android.app.IServiceConnection");
                ComponentName componentname;
                if (parcel.readInt() != 0)
                    componentname = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname = null;
                connected(componentname, parcel.readStrongBinder());
                return true;

            case 1598968902: 
                parcel1.writeString("android.app.IServiceConnection");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.app.IServiceConnection");
        }
    }

    private static class Stub.Proxy
        implements IServiceConnection
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public void connected(ComponentName componentname, IBinder ibinder)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IServiceConnection");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_49;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(1, parcel, null, 1);
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public String getInterfaceDescriptor()
        {
            return "android.app.IServiceConnection";
        }

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract void connected(ComponentName componentname, IBinder ibinder)
        throws RemoteException;
}
