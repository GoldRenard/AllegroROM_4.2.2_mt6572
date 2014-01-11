// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.recording;

import android.os.*;

public interface IPhoneRecordStateListener
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IPhoneRecordStateListener
    {

        private static final String DESCRIPTOR = "com.mediatek.phone.recording.IPhoneRecordStateListener";
        static final int TRANSACTION_onError = 2;
        static final int TRANSACTION_onStateChange = 1;

        public static IPhoneRecordStateListener asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("com.mediatek.phone.recording.IPhoneRecordStateListener");
            if (iinterface != null && (iinterface instanceof IPhoneRecordStateListener))
                return (IPhoneRecordStateListener)iinterface;
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
                parcel.enforceInterface("com.mediatek.phone.recording.IPhoneRecordStateListener");
                onError(parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 1: // '\001'
                parcel.enforceInterface("com.mediatek.phone.recording.IPhoneRecordStateListener");
                onStateChange(parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 1598968902: 
                parcel1.writeString("com.mediatek.phone.recording.IPhoneRecordStateListener");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "com.mediatek.phone.recording.IPhoneRecordStateListener");
        }
    }

    private static class Stub.Proxy
        implements IPhoneRecordStateListener
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public String getInterfaceDescriptor()
        {
            return "com.mediatek.phone.recording.IPhoneRecordStateListener";
        }

        public void onError(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.phone.recording.IPhoneRecordStateListener");
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

        public void onStateChange(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.phone.recording.IPhoneRecordStateListener");
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

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract void onError(int i)
        throws RemoteException;

    public abstract void onStateChange(int i)
        throws RemoteException;
}
