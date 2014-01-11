// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.hid;

import android.os.*;

public interface IBluetoothHidServerNotify
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IBluetoothHidServerNotify
    {

        private static final String DESCRIPTOR = "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify";
        static final int TRANSACTION_activateReq = 1;
        static final int TRANSACTION_authorizeReq = 15;
        static final int TRANSACTION_clearService = 14;
        static final int TRANSACTION_connectReq = 3;
        static final int TRANSACTION_deactivateReq = 2;
        static final int TRANSACTION_disconnectReq = 4;
        static final int TRANSACTION_finishActionReq = 16;
        static final int TRANSACTION_getIdleReq = 12;
        static final int TRANSACTION_getProtocolReq = 10;
        static final int TRANSACTION_getReportReq = 8;
        static final int TRANSACTION_getStateByAddr = 13;
        static final int TRANSACTION_sendReportReq = 6;
        static final int TRANSACTION_setIdleReq = 11;
        static final int TRANSACTION_setProtocolReq = 9;
        static final int TRANSACTION_setReportReq = 7;
        static final int TRANSACTION_unplugReq = 5;

        public static IBluetoothHidServerNotify asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
            if (iinterface != null && (iinterface instanceof IBluetoothHidServerNotify))
                return (IBluetoothHidServerNotify)iinterface;
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
            case 16: // '\020'
                parcel.enforceInterface("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
                finishActionReq();
                parcel1.writeNoException();
                return true;

            case 15: // '\017'
                parcel.enforceInterface("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
                String s2 = parcel.readString();
                int l = parcel.readInt();
                boolean flag1 = false;
                if (l != 0)
                    flag1 = true;
                authorizeReq(s2, flag1);
                parcel1.writeNoException();
                return true;

            case 14: // '\016'
                parcel.enforceInterface("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
                clearService();
                parcel1.writeNoException();
                return true;

            case 13: // '\r'
                parcel.enforceInterface("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
                String s1 = getStateByAddr(parcel.readString());
                parcel1.writeNoException();
                parcel1.writeString(s1);
                return true;

            case 12: // '\f'
                parcel.enforceInterface("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
                getIdleReq(parcel.readString());
                parcel1.writeNoException();
                return true;

            case 11: // '\013'
                parcel.enforceInterface("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
                setIdleReq(parcel.readString());
                parcel1.writeNoException();
                return true;

            case 10: // '\n'
                parcel.enforceInterface("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
                getProtocolReq(parcel.readString());
                parcel1.writeNoException();
                return true;

            case 9: // '\t'
                parcel.enforceInterface("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
                setProtocolReq(parcel.readString());
                parcel1.writeNoException();
                return true;

            case 8: // '\b'
                parcel.enforceInterface("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
                getReportReq(parcel.readString());
                parcel1.writeNoException();
                return true;

            case 7: // '\007'
                parcel.enforceInterface("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
                setReportReq(parcel.readString());
                parcel1.writeNoException();
                return true;

            case 6: // '\006'
                parcel.enforceInterface("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
                String s = parcel.readString();
                int k = parcel.readInt();
                boolean flag = false;
                if (k != 0)
                    flag = true;
                sendReportReq(s, flag);
                parcel1.writeNoException();
                return true;

            case 5: // '\005'
                parcel.enforceInterface("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
                unplugReq(parcel.readString());
                parcel1.writeNoException();
                return true;

            case 4: // '\004'
                parcel.enforceInterface("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
                disconnectReq(parcel.readString());
                parcel1.writeNoException();
                return true;

            case 3: // '\003'
                parcel.enforceInterface("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
                connectReq(parcel.readString());
                parcel1.writeNoException();
                return true;

            case 2: // '\002'
                parcel.enforceInterface("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
                deactivateReq();
                parcel1.writeNoException();
                return true;

            case 1: // '\001'
                parcel.enforceInterface("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
                activateReq();
                parcel1.writeNoException();
                return true;

            case 1598968902: 
                parcel1.writeString("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
        }
    }

    private static class Stub.Proxy
        implements IBluetoothHidServerNotify
    {

        private IBinder mRemote;

        public void activateReq()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
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

        public IBinder asBinder()
        {
            return mRemote;
        }

        public void authorizeReq(String s, boolean flag)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
            parcel.writeString(s);
            int i;
            i = 0;
            if (flag)
                i = 1;
            parcel.writeInt(i);
            mRemote.transact(15, parcel, parcel1, 0);
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

        public void clearService()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
            mRemote.transact(14, parcel, parcel1, 0);
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

        public void connectReq(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
            parcel.writeString(s);
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

        public void deactivateReq()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
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

        public void disconnectReq(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
            parcel.writeString(s);
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

        public void finishActionReq()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
            mRemote.transact(16, parcel, parcel1, 0);
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

        public void getIdleReq(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
            parcel.writeString(s);
            mRemote.transact(12, parcel, parcel1, 0);
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

        public String getInterfaceDescriptor()
        {
            return "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify";
        }

        public void getProtocolReq(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
            parcel.writeString(s);
            mRemote.transact(10, parcel, parcel1, 0);
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

        public void getReportReq(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
            parcel.writeString(s);
            mRemote.transact(8, parcel, parcel1, 0);
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

        public String getStateByAddr(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            String s1;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
            parcel.writeString(s);
            mRemote.transact(13, parcel, parcel1, 0);
            parcel1.readException();
            s1 = parcel1.readString();
            parcel1.recycle();
            parcel.recycle();
            return s1;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void sendReportReq(String s, boolean flag)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
            parcel.writeString(s);
            int i;
            i = 0;
            if (flag)
                i = 1;
            parcel.writeInt(i);
            mRemote.transact(6, parcel, parcel1, 0);
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

        public void setIdleReq(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
            parcel.writeString(s);
            mRemote.transact(11, parcel, parcel1, 0);
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

        public void setProtocolReq(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
            parcel.writeString(s);
            mRemote.transact(9, parcel, parcel1, 0);
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

        public void setReportReq(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
            parcel.writeString(s);
            mRemote.transact(7, parcel, parcel1, 0);
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

        public void unplugReq(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.hid.IBluetoothHidServerNotify");
            parcel.writeString(s);
            mRemote.transact(5, parcel, parcel1, 0);
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


    public abstract void activateReq()
        throws RemoteException;

    public abstract void authorizeReq(String s, boolean flag)
        throws RemoteException;

    public abstract void clearService()
        throws RemoteException;

    public abstract void connectReq(String s)
        throws RemoteException;

    public abstract void deactivateReq()
        throws RemoteException;

    public abstract void disconnectReq(String s)
        throws RemoteException;

    public abstract void finishActionReq()
        throws RemoteException;

    public abstract void getIdleReq(String s)
        throws RemoteException;

    public abstract void getProtocolReq(String s)
        throws RemoteException;

    public abstract void getReportReq(String s)
        throws RemoteException;

    public abstract String getStateByAddr(String s)
        throws RemoteException;

    public abstract void sendReportReq(String s, boolean flag)
        throws RemoteException;

    public abstract void setIdleReq(String s)
        throws RemoteException;

    public abstract void setProtocolReq(String s)
        throws RemoteException;

    public abstract void setReportReq(String s)
        throws RemoteException;

    public abstract void unplugReq(String s)
        throws RemoteException;
}
