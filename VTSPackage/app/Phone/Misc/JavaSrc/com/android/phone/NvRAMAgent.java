// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.os.*;

public interface NvRAMAgent
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements NvRAMAgent
    {

        private static final String DESCRIPTOR = "NvRAMAgent";
        static final int TRANSACTION_readFile = 1;
        static final int TRANSACTION_writeFile = 2;

        public static NvRAMAgent asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("NvRAMAgent");
            if (iinterface != null && (iinterface instanceof NvRAMAgent))
                return (NvRAMAgent)iinterface;
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
                parcel.enforceInterface("NvRAMAgent");
                int k = writeFile(parcel.readInt(), parcel.createByteArray());
                parcel1.writeNoException();
                parcel1.writeInt(k);
                return true;

            case 1: // '\001'
                parcel.enforceInterface("NvRAMAgent");
                byte abyte0[] = readFile(parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeByteArray(abyte0);
                return true;

            case 1598968902: 
                parcel1.writeString("NvRAMAgent");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "NvRAMAgent");
        }
    }

    private static class Stub.Proxy
        implements NvRAMAgent
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public String getInterfaceDescriptor()
        {
            return "NvRAMAgent";
        }

        public byte[] readFile(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            byte abyte0[];
            parcel.writeInterfaceToken("NvRAMAgent");
            parcel.writeInt(i);
            mRemote.transact(1, parcel, parcel1, 0);
            parcel1.readException();
            abyte0 = parcel1.createByteArray();
            parcel1.recycle();
            parcel.recycle();
            return abyte0;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int writeFile(int i, byte abyte0[])
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int j;
            parcel.writeInterfaceToken("NvRAMAgent");
            parcel.writeInt(i);
            parcel.writeByteArray(abyte0);
            mRemote.transact(2, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return j;
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


    public abstract byte[] readFile(int i)
        throws RemoteException;

    public abstract int writeFile(int i, byte abyte0[])
        throws RemoteException;
}
