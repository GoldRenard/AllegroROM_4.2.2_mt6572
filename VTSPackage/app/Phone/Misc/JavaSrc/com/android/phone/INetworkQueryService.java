// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.os.*;

// Referenced classes of package com.android.phone:
//            INetworkQueryServiceCallback

public interface INetworkQueryService
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements INetworkQueryService
    {

        private static final String DESCRIPTOR = "com.android.phone.INetworkQueryService";
        static final int TRANSACTION_startNetworkQuery = 1;
        static final int TRANSACTION_stopNetworkQuery = 2;

        public static INetworkQueryService asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("com.android.phone.INetworkQueryService");
            if (iinterface != null && (iinterface instanceof INetworkQueryService))
                return (INetworkQueryService)iinterface;
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
                parcel.enforceInterface("com.android.phone.INetworkQueryService");
                stopNetworkQuery(INetworkQueryServiceCallback.Stub.asInterface(parcel.readStrongBinder()));
                return true;

            case 1: // '\001'
                parcel.enforceInterface("com.android.phone.INetworkQueryService");
                startNetworkQuery(INetworkQueryServiceCallback.Stub.asInterface(parcel.readStrongBinder()));
                return true;

            case 1598968902: 
                parcel1.writeString("com.android.phone.INetworkQueryService");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "com.android.phone.INetworkQueryService");
        }
    }

    private static class Stub.Proxy
        implements INetworkQueryService
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public String getInterfaceDescriptor()
        {
            return "com.android.phone.INetworkQueryService";
        }

        public void startNetworkQuery(INetworkQueryServiceCallback inetworkqueryservicecallback)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("com.android.phone.INetworkQueryService");
            IBinder ibinder;
            ibinder = null;
            if (inetworkqueryservicecallback == null)
                break MISSING_BLOCK_LABEL_25;
            ibinder = inetworkqueryservicecallback.asBinder();
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(1, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void stopNetworkQuery(INetworkQueryServiceCallback inetworkqueryservicecallback)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("com.android.phone.INetworkQueryService");
            IBinder ibinder;
            ibinder = null;
            if (inetworkqueryservicecallback == null)
                break MISSING_BLOCK_LABEL_25;
            ibinder = inetworkqueryservicecallback.asBinder();
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(2, parcel, null, 1);
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


    public abstract void startNetworkQuery(INetworkQueryServiceCallback inetworkqueryservicecallback)
        throws RemoteException;

    public abstract void stopNetworkQuery(INetworkQueryServiceCallback inetworkqueryservicecallback)
        throws RemoteException;
}
