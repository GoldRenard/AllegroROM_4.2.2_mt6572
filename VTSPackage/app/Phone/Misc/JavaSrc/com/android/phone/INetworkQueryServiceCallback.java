// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.os.*;
import com.android.internal.telephony.OperatorInfo;
import java.util.List;

public interface INetworkQueryServiceCallback
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements INetworkQueryServiceCallback
    {

        private static final String DESCRIPTOR = "com.android.phone.INetworkQueryServiceCallback";
        static final int TRANSACTION_onQueryComplete = 1;

        public static INetworkQueryServiceCallback asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("com.android.phone.INetworkQueryServiceCallback");
            if (iinterface != null && (iinterface instanceof INetworkQueryServiceCallback))
                return (INetworkQueryServiceCallback)iinterface;
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
                parcel.enforceInterface("com.android.phone.INetworkQueryServiceCallback");
                onQueryComplete(parcel.createTypedArrayList(OperatorInfo.CREATOR), parcel.readInt());
                return true;

            case 1598968902: 
                parcel1.writeString("com.android.phone.INetworkQueryServiceCallback");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "com.android.phone.INetworkQueryServiceCallback");
        }
    }

    private static class Stub.Proxy
        implements INetworkQueryServiceCallback
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public String getInterfaceDescriptor()
        {
            return "com.android.phone.INetworkQueryServiceCallback";
        }

        public void onQueryComplete(List list, int i)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("com.android.phone.INetworkQueryServiceCallback");
            parcel.writeTypedList(list);
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


    public abstract void onQueryComplete(List list, int i)
        throws RemoteException;
}
