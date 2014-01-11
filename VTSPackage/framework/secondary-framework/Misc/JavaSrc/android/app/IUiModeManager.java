// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.os.*;

public interface IUiModeManager
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IUiModeManager
    {

        private static final String DESCRIPTOR = "android.app.IUiModeManager";
        static final int TRANSACTION_disableCarMode = 2;
        static final int TRANSACTION_enableCarMode = 1;
        static final int TRANSACTION_getCurrentModeType = 3;
        static final int TRANSACTION_getNightMode = 5;
        static final int TRANSACTION_setNightMode = 4;

        public static IUiModeManager asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.app.IUiModeManager");
            if (iinterface != null && (iinterface instanceof IUiModeManager))
                return (IUiModeManager)iinterface;
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
            case 5: // '\005'
                parcel.enforceInterface("android.app.IUiModeManager");
                int l = getNightMode();
                parcel1.writeNoException();
                parcel1.writeInt(l);
                return true;

            case 4: // '\004'
                parcel.enforceInterface("android.app.IUiModeManager");
                setNightMode(parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 3: // '\003'
                parcel.enforceInterface("android.app.IUiModeManager");
                int k = getCurrentModeType();
                parcel1.writeNoException();
                parcel1.writeInt(k);
                return true;

            case 2: // '\002'
                parcel.enforceInterface("android.app.IUiModeManager");
                disableCarMode(parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.app.IUiModeManager");
                enableCarMode(parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 1598968902: 
                parcel1.writeString("android.app.IUiModeManager");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.app.IUiModeManager");
        }
    }

    private static class Stub.Proxy
        implements IUiModeManager
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public void disableCarMode(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IUiModeManager");
            parcel.writeInt(i);
            mRemote.transact(2, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void enableCarMode(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IUiModeManager");
            parcel.writeInt(i);
            mRemote.transact(1, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int getCurrentModeType()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.app.IUiModeManager");
            mRemote.transact(3, parcel, parcel1, 0);
            parcel1.readException();
            i = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return i;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public String getInterfaceDescriptor()
        {
            return "android.app.IUiModeManager";
        }

        public int getNightMode()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.app.IUiModeManager");
            mRemote.transact(5, parcel, parcel1, 0);
            parcel1.readException();
            i = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return i;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void setNightMode(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IUiModeManager");
            parcel.writeInt(i);
            mRemote.transact(4, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract void disableCarMode(int i)
        throws RemoteException;

    public abstract void enableCarMode(int i)
        throws RemoteException;

    public abstract int getCurrentModeType()
        throws RemoteException;

    public abstract int getNightMode()
        throws RemoteException;

    public abstract void setNightMode(int i)
        throws RemoteException;
}
