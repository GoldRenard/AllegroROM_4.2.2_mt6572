// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.CellConnService;

import android.os.*;

public interface IPhoneStatesCallback
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IPhoneStatesCallback
    {

        private static final String DESCRIPTOR = "com.mediatek.CellConnService.IPhoneStatesCallback";
        static final int TRANSACTION_onComplete = 1;
        static final int TRANSACTION_onCompleteWithPrefer = 2;

        public static IPhoneStatesCallback asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("com.mediatek.CellConnService.IPhoneStatesCallback");
            if (iinterface != null && (iinterface instanceof IPhoneStatesCallback))
                return (IPhoneStatesCallback)iinterface;
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
                parcel.enforceInterface("com.mediatek.CellConnService.IPhoneStatesCallback");
                onCompleteWithPrefer(parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 1: // '\001'
                parcel.enforceInterface("com.mediatek.CellConnService.IPhoneStatesCallback");
                onComplete(parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 1598968902: 
                parcel1.writeString("com.mediatek.CellConnService.IPhoneStatesCallback");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "com.mediatek.CellConnService.IPhoneStatesCallback");
        }
    }

    private static class Stub.Proxy
        implements IPhoneStatesCallback
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public String getInterfaceDescriptor()
        {
            return "com.mediatek.CellConnService.IPhoneStatesCallback";
        }

        public void onComplete(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.CellConnService.IPhoneStatesCallback");
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

        public void onCompleteWithPrefer(int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.CellConnService.IPhoneStatesCallback");
            parcel.writeInt(i);
            parcel.writeInt(j);
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


    public abstract void onComplete(int i)
        throws RemoteException;

    public abstract void onCompleteWithPrefer(int i, int j)
        throws RemoteException;
}
