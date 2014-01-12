// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.avrcp;

import android.os.*;

public interface IBTAvrcpService
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IBTAvrcpService
    {

        private static final String DESCRIPTOR = "com.mediatek.bluetooth.avrcp.IBTAvrcpService";
        static final int TRANSACTION_connect = 2;
        static final int TRANSACTION_connectBrowse = 4;
        static final int TRANSACTION_debugPTSAttributes = 8;
        static final int TRANSACTION_disconnect = 3;
        static final int TRANSACTION_disconnectBrowse = 5;
        static final int TRANSACTION_getStatus = 1;
        static final int TRANSACTION_selectPlayerId = 7;
        static final int TRANSACTION_setDebugElementAttribute = 6;

        public static IBTAvrcpService asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpService");
            if (iinterface != null && (iinterface instanceof IBTAvrcpService))
                return (IBTAvrcpService)iinterface;
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
            case 8: // '\b'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpService");
                boolean flag6 = debugPTSAttributes(parcel.readInt());
                parcel1.writeNoException();
                int i2 = 0;
                if (flag6)
                    i2 = 1;
                parcel1.writeInt(i2);
                return true;

            case 7: // '\007'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpService");
                boolean flag5 = selectPlayerId(parcel.readInt());
                parcel1.writeNoException();
                int l1 = 0;
                if (flag5)
                    l1 = 1;
                parcel1.writeInt(l1);
                return true;

            case 6: // '\006'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpService");
                boolean flag4 = setDebugElementAttribute();
                parcel1.writeNoException();
                int k1 = 0;
                if (flag4)
                    k1 = 1;
                parcel1.writeInt(k1);
                return true;

            case 5: // '\005'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpService");
                boolean flag3 = disconnectBrowse();
                parcel1.writeNoException();
                int j1 = 0;
                if (flag3)
                    j1 = 1;
                parcel1.writeInt(j1);
                return true;

            case 4: // '\004'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpService");
                boolean flag2 = connectBrowse();
                parcel1.writeNoException();
                int i1 = 0;
                if (flag2)
                    i1 = 1;
                parcel1.writeInt(i1);
                return true;

            case 3: // '\003'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpService");
                boolean flag1 = disconnect();
                parcel1.writeNoException();
                int l = 0;
                if (flag1)
                    l = 1;
                parcel1.writeInt(l);
                return true;

            case 2: // '\002'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpService");
                boolean flag = connect(parcel.readString());
                parcel1.writeNoException();
                int k = 0;
                if (flag)
                    k = 1;
                parcel1.writeInt(k);
                return true;

            case 1: // '\001'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpService");
                byte byte0 = getStatus();
                parcel1.writeNoException();
                parcel1.writeByte(byte0);
                return true;

            case 1598968902: 
                parcel1.writeString("com.mediatek.bluetooth.avrcp.IBTAvrcpService");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "com.mediatek.bluetooth.avrcp.IBTAvrcpService");
        }
    }

    private static class Stub.Proxy
        implements IBTAvrcpService
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public boolean connect(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpService");
            parcel.writeString(s);
            mRemote.transact(2, parcel, parcel1, 0);
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

        public boolean connectBrowse()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpService");
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

        public boolean debugPTSAttributes(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int j;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpService");
            parcel.writeInt(i);
            mRemote.transact(8, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            boolean flag = false;
            if (j != 0)
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

        public boolean disconnect()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpService");
            mRemote.transact(3, parcel, parcel1, 0);
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

        public boolean disconnectBrowse()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpService");
            mRemote.transact(5, parcel, parcel1, 0);
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

        public String getInterfaceDescriptor()
        {
            return "com.mediatek.bluetooth.avrcp.IBTAvrcpService";
        }

        public byte getStatus()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            byte byte0;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpService");
            mRemote.transact(1, parcel, parcel1, 0);
            parcel1.readException();
            byte0 = parcel1.readByte();
            parcel1.recycle();
            parcel.recycle();
            return byte0;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public boolean selectPlayerId(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int j;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpService");
            parcel.writeInt(i);
            mRemote.transact(7, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            boolean flag = false;
            if (j != 0)
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

        public boolean setDebugElementAttribute()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpService");
            mRemote.transact(6, parcel, parcel1, 0);
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

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract boolean connect(String s)
        throws RemoteException;

    public abstract boolean connectBrowse()
        throws RemoteException;

    public abstract boolean debugPTSAttributes(int i)
        throws RemoteException;

    public abstract boolean disconnect()
        throws RemoteException;

    public abstract boolean disconnectBrowse()
        throws RemoteException;

    public abstract byte getStatus()
        throws RemoteException;

    public abstract boolean selectPlayerId(int i)
        throws RemoteException;

    public abstract boolean setDebugElementAttribute()
        throws RemoteException;
}
