// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.avrcp;

import android.os.*;

public interface IBTAvrcpMusicCallback
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IBTAvrcpMusicCallback
    {

        private static final String DESCRIPTOR = "com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback";
        static final int TRANSACTION_notifyAppSettingChanged = 6;
        static final int TRANSACTION_notifyNowPlayingContentChanged = 7;
        static final int TRANSACTION_notifyPlaybackPosChanged = 5;
        static final int TRANSACTION_notifyPlaybackStatus = 1;
        static final int TRANSACTION_notifyTrackChanged = 2;
        static final int TRANSACTION_notifyTrackReachEnd = 4;
        static final int TRANSACTION_notifyTrackReachStart = 3;
        static final int TRANSACTION_notifyVolumehanged = 8;

        public static IBTAvrcpMusicCallback asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
            if (iinterface != null && (iinterface instanceof IBTAvrcpMusicCallback))
                return (IBTAvrcpMusicCallback)iinterface;
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
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
                notifyVolumehanged(parcel.readByte());
                parcel1.writeNoException();
                return true;

            case 7: // '\007'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
                notifyNowPlayingContentChanged();
                parcel1.writeNoException();
                return true;

            case 6: // '\006'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
                notifyAppSettingChanged();
                parcel1.writeNoException();
                return true;

            case 5: // '\005'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
                notifyPlaybackPosChanged();
                parcel1.writeNoException();
                return true;

            case 4: // '\004'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
                notifyTrackReachEnd();
                parcel1.writeNoException();
                return true;

            case 3: // '\003'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
                notifyTrackReachStart();
                parcel1.writeNoException();
                return true;

            case 2: // '\002'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
                notifyTrackChanged(parcel.readLong());
                parcel1.writeNoException();
                return true;

            case 1: // '\001'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
                notifyPlaybackStatus(parcel.readByte());
                parcel1.writeNoException();
                return true;

            case 1598968902: 
                parcel1.writeString("com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
        }
    }

    private static class Stub.Proxy
        implements IBTAvrcpMusicCallback
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public String getInterfaceDescriptor()
        {
            return "com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback";
        }

        public void notifyAppSettingChanged()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
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

        public void notifyNowPlayingContentChanged()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
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

        public void notifyPlaybackPosChanged()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
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

        public void notifyPlaybackStatus(byte byte0)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
            parcel.writeByte(byte0);
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

        public void notifyTrackChanged(long l)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
            parcel.writeLong(l);
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

        public void notifyTrackReachEnd()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
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

        public void notifyTrackReachStart()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
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

        public void notifyVolumehanged(byte byte0)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback");
            parcel.writeByte(byte0);
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

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract void notifyAppSettingChanged()
        throws RemoteException;

    public abstract void notifyNowPlayingContentChanged()
        throws RemoteException;

    public abstract void notifyPlaybackPosChanged()
        throws RemoteException;

    public abstract void notifyPlaybackStatus(byte byte0)
        throws RemoteException;

    public abstract void notifyTrackChanged(long l)
        throws RemoteException;

    public abstract void notifyTrackReachEnd()
        throws RemoteException;

    public abstract void notifyTrackReachStart()
        throws RemoteException;

    public abstract void notifyVolumehanged(byte byte0)
        throws RemoteException;
}
