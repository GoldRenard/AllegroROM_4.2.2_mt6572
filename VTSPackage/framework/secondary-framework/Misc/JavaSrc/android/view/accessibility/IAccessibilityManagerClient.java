// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.accessibility;

import android.os.*;

public interface IAccessibilityManagerClient
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IAccessibilityManagerClient
    {

        private static final String DESCRIPTOR = "android.view.accessibility.IAccessibilityManagerClient";
        static final int TRANSACTION_setState = 1;

        public static IAccessibilityManagerClient asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.view.accessibility.IAccessibilityManagerClient");
            if (iinterface != null && (iinterface instanceof IAccessibilityManagerClient))
                return (IAccessibilityManagerClient)iinterface;
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
                parcel.enforceInterface("android.view.accessibility.IAccessibilityManagerClient");
                setState(parcel.readInt());
                return true;

            case 1598968902: 
                parcel1.writeString("android.view.accessibility.IAccessibilityManagerClient");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.view.accessibility.IAccessibilityManagerClient");
        }
    }

    private static class Stub.Proxy
        implements IAccessibilityManagerClient
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public String getInterfaceDescriptor()
        {
            return "android.view.accessibility.IAccessibilityManagerClient";
        }

        public void setState(int i)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityManagerClient");
            parcel.writeInt(i);
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


    public abstract void setState(int i)
        throws RemoteException;
}
