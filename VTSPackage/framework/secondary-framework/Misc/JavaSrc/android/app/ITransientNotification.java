// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.os.*;

public interface ITransientNotification
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements ITransientNotification
    {

        private static final String DESCRIPTOR = "android.app.ITransientNotification";
        static final int TRANSACTION_hide = 2;
        static final int TRANSACTION_show = 1;

        public static ITransientNotification asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.app.ITransientNotification");
            if (iinterface != null && (iinterface instanceof ITransientNotification))
                return (ITransientNotification)iinterface;
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
                parcel.enforceInterface("android.app.ITransientNotification");
                hide();
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.app.ITransientNotification");
                show();
                return true;

            case 1598968902: 
                parcel1.writeString("android.app.ITransientNotification");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.app.ITransientNotification");
        }
    }

    private static class Stub.Proxy
        implements ITransientNotification
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public String getInterfaceDescriptor()
        {
            return "android.app.ITransientNotification";
        }

        public void hide()
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.ITransientNotification");
            mRemote.transact(2, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void show()
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.ITransientNotification");
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


    public abstract void hide()
        throws RemoteException;

    public abstract void show()
        throws RemoteException;
}
