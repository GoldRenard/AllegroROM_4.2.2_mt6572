// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.os.*;

public interface IUserSwitchObserver
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IUserSwitchObserver
    {

        private static final String DESCRIPTOR = "android.app.IUserSwitchObserver";
        static final int TRANSACTION_onUserSwitchComplete = 2;
        static final int TRANSACTION_onUserSwitching = 1;

        public static IUserSwitchObserver asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.app.IUserSwitchObserver");
            if (iinterface != null && (iinterface instanceof IUserSwitchObserver))
                return (IUserSwitchObserver)iinterface;
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
            case 2: // '\002'
                parcel.enforceInterface("android.app.IUserSwitchObserver");
                onUserSwitchComplete(parcel.readInt());
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.app.IUserSwitchObserver");
                onUserSwitching(parcel.readInt(), android.os.IRemoteCallback.Stub.asInterface(parcel.readStrongBinder()));
                return true;

            case 1598968902: 
                parcel1.writeString("android.app.IUserSwitchObserver");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.app.IUserSwitchObserver");
        }
    }

    private static class Stub.Proxy
        implements IUserSwitchObserver
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public String getInterfaceDescriptor()
        {
            return "android.app.IUserSwitchObserver";
        }

        public void onUserSwitchComplete(int i)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IUserSwitchObserver");
            parcel.writeInt(i);
            mRemote.transact(2, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void onUserSwitching(int i, IRemoteCallback iremotecallback)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IUserSwitchObserver");
            parcel.writeInt(i);
            IBinder ibinder;
            ibinder = null;
            if (iremotecallback == null)
                break MISSING_BLOCK_LABEL_30;
            ibinder = iremotecallback.asBinder();
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(1, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract void onUserSwitchComplete(int i)
        throws RemoteException;

    public abstract void onUserSwitching(int i, IRemoteCallback iremotecallback)
        throws RemoteException;
}
