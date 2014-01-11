// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.os.*;

public interface IApplicationToken
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IApplicationToken
    {

        private static final String DESCRIPTOR = "android.view.IApplicationToken";
        static final int TRANSACTION_getFocusAppPid = 6;
        static final int TRANSACTION_getKeyDispatchingTimeout = 5;
        static final int TRANSACTION_keyDispatchingTimedOut = 4;
        static final int TRANSACTION_windowsDrawn = 1;
        static final int TRANSACTION_windowsGone = 3;
        static final int TRANSACTION_windowsVisible = 2;

        public static IApplicationToken asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.view.IApplicationToken");
            if (iinterface != null && (iinterface instanceof IApplicationToken))
                return (IApplicationToken)iinterface;
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
            case 6: // '\006'
                parcel.enforceInterface("android.view.IApplicationToken");
                int i1 = getFocusAppPid();
                parcel1.writeNoException();
                parcel1.writeInt(i1);
                return true;

            case 5: // '\005'
                parcel.enforceInterface("android.view.IApplicationToken");
                long l = getKeyDispatchingTimeout();
                parcel1.writeNoException();
                parcel1.writeLong(l);
                return true;

            case 4: // '\004'
                parcel.enforceInterface("android.view.IApplicationToken");
                boolean flag = keyDispatchingTimedOut();
                parcel1.writeNoException();
                int k;
                if (flag)
                    k = 1;
                else
                    k = 0;
                parcel1.writeInt(k);
                return true;

            case 3: // '\003'
                parcel.enforceInterface("android.view.IApplicationToken");
                windowsGone();
                parcel1.writeNoException();
                return true;

            case 2: // '\002'
                parcel.enforceInterface("android.view.IApplicationToken");
                windowsVisible();
                parcel1.writeNoException();
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.view.IApplicationToken");
                windowsDrawn();
                parcel1.writeNoException();
                return true;

            case 1598968902: 
                parcel1.writeString("android.view.IApplicationToken");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.view.IApplicationToken");
        }
    }

    private static class Stub.Proxy
        implements IApplicationToken
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public int getFocusAppPid()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.view.IApplicationToken");
            mRemote.transact(6, parcel, parcel1, 0);
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
            return "android.view.IApplicationToken";
        }

        public long getKeyDispatchingTimeout()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            long l;
            parcel.writeInterfaceToken("android.view.IApplicationToken");
            mRemote.transact(5, parcel, parcel1, 0);
            parcel1.readException();
            l = parcel1.readLong();
            parcel1.recycle();
            parcel.recycle();
            return l;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public boolean keyDispatchingTimedOut()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.view.IApplicationToken");
            mRemote.transact(4, parcel, parcel1, 0);
            parcel1.readException();
            i = parcel1.readInt();
            boolean flag = false;
            if (i != 0)
                flag = true;
            parcel1.recycle();
            parcel.recycle();
            return flag;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void windowsDrawn()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IApplicationToken");
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

        public void windowsGone()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IApplicationToken");
            mRemote.transact(3, parcel, parcel1, 0);
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

        public void windowsVisible()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IApplicationToken");
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

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract int getFocusAppPid()
        throws RemoteException;

    public abstract long getKeyDispatchingTimeout()
        throws RemoteException;

    public abstract boolean keyDispatchingTimedOut()
        throws RemoteException;

    public abstract void windowsDrawn()
        throws RemoteException;

    public abstract void windowsGone()
        throws RemoteException;

    public abstract void windowsVisible()
        throws RemoteException;
}
