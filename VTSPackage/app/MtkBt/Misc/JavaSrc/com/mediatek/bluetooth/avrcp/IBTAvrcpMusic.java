// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.avrcp;

import android.os.*;

// Referenced classes of package com.mediatek.bluetooth.avrcp:
//            IBTAvrcpMusicCallback

public interface IBTAvrcpMusic
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IBTAvrcpMusic
    {

        private static final String DESCRIPTOR = "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic";
        static final int TRANSACTION_duration = 26;
        static final int TRANSACTION_enqueue = 32;
        static final int TRANSACTION_getAlbumId = 30;
        static final int TRANSACTION_getAlbumName = 29;
        static final int TRANSACTION_getArtistName = 31;
        static final int TRANSACTION_getAudioId = 27;
        static final int TRANSACTION_getCapabilities = 5;
        static final int TRANSACTION_getEqualizeMode = 15;
        static final int TRANSACTION_getNowPlaying = 33;
        static final int TRANSACTION_getNowPlayingItemName = 34;
        static final int TRANSACTION_getPlayStatus = 24;
        static final int TRANSACTION_getQueuePosition = 36;
        static final int TRANSACTION_getRepeatMode = 19;
        static final int TRANSACTION_getScanMode = 21;
        static final int TRANSACTION_getShuffleMode = 17;
        static final int TRANSACTION_getTrackName = 28;
        static final int TRANSACTION_informBatteryStatusOfCT = 23;
        static final int TRANSACTION_informDisplayableCharacterSet = 22;
        static final int TRANSACTION_next = 11;
        static final int TRANSACTION_nextGroup = 13;
        static final int TRANSACTION_open = 35;
        static final int TRANSACTION_pause = 8;
        static final int TRANSACTION_play = 6;
        static final int TRANSACTION_position = 25;
        static final int TRANSACTION_prev = 10;
        static final int TRANSACTION_prevGroup = 12;
        static final int TRANSACTION_regNotificationEvent = 3;
        static final int TRANSACTION_registerCallback = 1;
        static final int TRANSACTION_resume = 9;
        static final int TRANSACTION_setEqualizeMode = 14;
        static final int TRANSACTION_setPlayerApplicationSettingValue = 4;
        static final int TRANSACTION_setQueuePosition = 37;
        static final int TRANSACTION_setRepeatMode = 18;
        static final int TRANSACTION_setScanMode = 20;
        static final int TRANSACTION_setShuffleMode = 16;
        static final int TRANSACTION_stop = 7;
        static final int TRANSACTION_unregisterCallback = 2;

        public static IBTAvrcpMusic asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            if (iinterface != null && (iinterface instanceof IBTAvrcpMusic))
                return (IBTAvrcpMusic)iinterface;
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
            case 37: // '%'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                setQueuePosition(parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 36: // '$'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                int k3 = getQueuePosition();
                parcel1.writeNoException();
                parcel1.writeInt(k3);
                return true;

            case 35: // '#'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                open(parcel.createLongArray(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 34: // '"'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                String s3 = getNowPlayingItemName(parcel.readLong());
                parcel1.writeNoException();
                parcel1.writeString(s3);
                return true;

            case 33: // '!'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                long al[] = getNowPlaying();
                parcel1.writeNoException();
                parcel1.writeLongArray(al);
                return true;

            case 32: // ' '
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                enqueue(parcel.createLongArray(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 31: // '\037'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                String s2 = getArtistName();
                parcel1.writeNoException();
                parcel1.writeString(s2);
                return true;

            case 30: // '\036'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                long l6 = getAlbumId();
                parcel1.writeNoException();
                parcel1.writeLong(l6);
                return true;

            case 29: // '\035'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                String s1 = getAlbumName();
                parcel1.writeNoException();
                parcel1.writeString(s1);
                return true;

            case 28: // '\034'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                String s = getTrackName();
                parcel1.writeNoException();
                parcel1.writeString(s);
                return true;

            case 27: // '\033'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                long l5 = getAudioId();
                parcel1.writeNoException();
                parcel1.writeLong(l5);
                return true;

            case 26: // '\032'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                long l4 = duration();
                parcel1.writeNoException();
                parcel1.writeLong(l4);
                return true;

            case 25: // '\031'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                long l3 = position();
                parcel1.writeNoException();
                parcel1.writeLong(l3);
                return true;

            case 24: // '\030'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                byte byte0 = getPlayStatus();
                parcel1.writeNoException();
                parcel1.writeByte(byte0);
                return true;

            case 23: // '\027'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                boolean flag7 = informBatteryStatusOfCT();
                parcel1.writeNoException();
                int j3 = 0;
                if (flag7)
                    j3 = 1;
                parcel1.writeInt(j3);
                return true;

            case 22: // '\026'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                boolean flag6 = informDisplayableCharacterSet(parcel.readInt());
                parcel1.writeNoException();
                int i3 = 0;
                if (flag6)
                    i3 = 1;
                parcel1.writeInt(i3);
                return true;

            case 21: // '\025'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                int l2 = getScanMode();
                parcel1.writeNoException();
                parcel1.writeInt(l2);
                return true;

            case 20: // '\024'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                boolean flag5 = setScanMode(parcel.readInt());
                parcel1.writeNoException();
                int k2 = 0;
                if (flag5)
                    k2 = 1;
                parcel1.writeInt(k2);
                return true;

            case 19: // '\023'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                int j2 = getRepeatMode();
                parcel1.writeNoException();
                parcel1.writeInt(j2);
                return true;

            case 18: // '\022'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                boolean flag4 = setRepeatMode(parcel.readInt());
                parcel1.writeNoException();
                int i2 = 0;
                if (flag4)
                    i2 = 1;
                parcel1.writeInt(i2);
                return true;

            case 17: // '\021'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                int l1 = getShuffleMode();
                parcel1.writeNoException();
                parcel1.writeInt(l1);
                return true;

            case 16: // '\020'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                boolean flag3 = setShuffleMode(parcel.readInt());
                parcel1.writeNoException();
                int k1 = 0;
                if (flag3)
                    k1 = 1;
                parcel1.writeInt(k1);
                return true;

            case 15: // '\017'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                int j1 = getEqualizeMode();
                parcel1.writeNoException();
                parcel1.writeInt(j1);
                return true;

            case 14: // '\016'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                boolean flag2 = setEqualizeMode(parcel.readInt());
                parcel1.writeNoException();
                int i1 = 0;
                if (flag2)
                    i1 = 1;
                parcel1.writeInt(i1);
                return true;

            case 13: // '\r'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                nextGroup();
                parcel1.writeNoException();
                return true;

            case 12: // '\f'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                prevGroup();
                parcel1.writeNoException();
                return true;

            case 11: // '\013'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                next();
                parcel1.writeNoException();
                return true;

            case 10: // '\n'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                prev();
                parcel1.writeNoException();
                return true;

            case 9: // '\t'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                resume();
                parcel1.writeNoException();
                return true;

            case 8: // '\b'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                pause();
                parcel1.writeNoException();
                return true;

            case 7: // '\007'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                stop();
                parcel1.writeNoException();
                return true;

            case 6: // '\006'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                play();
                parcel1.writeNoException();
                return true;

            case 5: // '\005'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                byte abyte0[] = getCapabilities();
                parcel1.writeNoException();
                parcel1.writeByteArray(abyte0);
                return true;

            case 4: // '\004'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                boolean flag1 = setPlayerApplicationSettingValue(parcel.readByte(), parcel.readByte());
                parcel1.writeNoException();
                int l = 0;
                if (flag1)
                    l = 1;
                parcel1.writeInt(l);
                return true;

            case 3: // '\003'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                boolean flag = regNotificationEvent(parcel.readByte(), parcel.readInt());
                parcel1.writeNoException();
                int k = 0;
                if (flag)
                    k = 1;
                parcel1.writeInt(k);
                return true;

            case 2: // '\002'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                unregisterCallback(IBTAvrcpMusicCallback.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                return true;

            case 1: // '\001'
                parcel.enforceInterface("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                registerCallback(IBTAvrcpMusicCallback.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                return true;

            case 1598968902: 
                parcel1.writeString("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
        }
    }

    private static class Stub.Proxy
        implements IBTAvrcpMusic
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public long duration()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            long l;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            mRemote.transact(26, parcel, parcel1, 0);
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

        public void enqueue(long al[], int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            parcel.writeLongArray(al);
            parcel.writeInt(i);
            mRemote.transact(32, parcel, parcel1, 0);
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

        public long getAlbumId()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            long l;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            mRemote.transact(30, parcel, parcel1, 0);
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

        public String getAlbumName()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            String s;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            mRemote.transact(29, parcel, parcel1, 0);
            parcel1.readException();
            s = parcel1.readString();
            parcel1.recycle();
            parcel.recycle();
            return s;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public String getArtistName()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            String s;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            mRemote.transact(31, parcel, parcel1, 0);
            parcel1.readException();
            s = parcel1.readString();
            parcel1.recycle();
            parcel.recycle();
            return s;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public long getAudioId()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            long l;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            mRemote.transact(27, parcel, parcel1, 0);
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

        public byte[] getCapabilities()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            byte abyte0[];
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            mRemote.transact(5, parcel, parcel1, 0);
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

        public int getEqualizeMode()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            mRemote.transact(15, parcel, parcel1, 0);
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
            return "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic";
        }

        public long[] getNowPlaying()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            long al[];
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            mRemote.transact(33, parcel, parcel1, 0);
            parcel1.readException();
            al = parcel1.createLongArray();
            parcel1.recycle();
            parcel.recycle();
            return al;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public String getNowPlayingItemName(long l)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            String s;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            parcel.writeLong(l);
            mRemote.transact(34, parcel, parcel1, 0);
            parcel1.readException();
            s = parcel1.readString();
            parcel1.recycle();
            parcel.recycle();
            return s;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public byte getPlayStatus()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            byte byte0;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            mRemote.transact(24, parcel, parcel1, 0);
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

        public int getQueuePosition()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            mRemote.transact(36, parcel, parcel1, 0);
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

        public int getRepeatMode()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            mRemote.transact(19, parcel, parcel1, 0);
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

        public int getScanMode()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            mRemote.transact(21, parcel, parcel1, 0);
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

        public int getShuffleMode()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            mRemote.transact(17, parcel, parcel1, 0);
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

        public String getTrackName()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            String s;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            mRemote.transact(28, parcel, parcel1, 0);
            parcel1.readException();
            s = parcel1.readString();
            parcel1.recycle();
            parcel.recycle();
            return s;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public boolean informBatteryStatusOfCT()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            mRemote.transact(23, parcel, parcel1, 0);
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

        public boolean informDisplayableCharacterSet(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int j;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            parcel.writeInt(i);
            mRemote.transact(22, parcel, parcel1, 0);
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

        public void next()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
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

        public void nextGroup()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            mRemote.transact(13, parcel, parcel1, 0);
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

        public void open(long al[], int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            parcel.writeLongArray(al);
            parcel.writeInt(i);
            mRemote.transact(35, parcel, parcel1, 0);
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

        public void pause()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
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

        public void play()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
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

        public long position()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            long l;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            mRemote.transact(25, parcel, parcel1, 0);
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

        public void prev()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
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

        public void prevGroup()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
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

        public boolean regNotificationEvent(byte byte0, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int j;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            parcel.writeByte(byte0);
            parcel.writeInt(i);
            mRemote.transact(3, parcel, parcel1, 0);
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

        public void registerCallback(IBTAvrcpMusicCallback ibtavrcpmusiccallback)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            if (ibtavrcpmusiccallback == null)
                break MISSING_BLOCK_LABEL_59;
            IBinder ibinder = ibtavrcpmusiccallback.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(1, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            ibinder = null;
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void resume()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
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

        public boolean setEqualizeMode(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int j;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            parcel.writeInt(i);
            mRemote.transact(14, parcel, parcel1, 0);
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

        public boolean setPlayerApplicationSettingValue(byte byte0, byte byte1)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            parcel.writeByte(byte0);
            parcel.writeByte(byte1);
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

        public void setQueuePosition(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            parcel.writeInt(i);
            mRemote.transact(37, parcel, parcel1, 0);
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

        public boolean setRepeatMode(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int j;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            parcel.writeInt(i);
            mRemote.transact(18, parcel, parcel1, 0);
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

        public boolean setScanMode(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int j;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            parcel.writeInt(i);
            mRemote.transact(20, parcel, parcel1, 0);
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

        public boolean setShuffleMode(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int j;
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            parcel.writeInt(i);
            mRemote.transact(16, parcel, parcel1, 0);
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

        public void stop()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
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

        public void unregisterCallback(IBTAvrcpMusicCallback ibtavrcpmusiccallback)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.bluetooth.avrcp.IBTAvrcpMusic");
            if (ibtavrcpmusiccallback == null)
                break MISSING_BLOCK_LABEL_59;
            IBinder ibinder = ibtavrcpmusiccallback.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(2, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            ibinder = null;
              goto _L1
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


    public abstract long duration()
        throws RemoteException;

    public abstract void enqueue(long al[], int i)
        throws RemoteException;

    public abstract long getAlbumId()
        throws RemoteException;

    public abstract String getAlbumName()
        throws RemoteException;

    public abstract String getArtistName()
        throws RemoteException;

    public abstract long getAudioId()
        throws RemoteException;

    public abstract byte[] getCapabilities()
        throws RemoteException;

    public abstract int getEqualizeMode()
        throws RemoteException;

    public abstract long[] getNowPlaying()
        throws RemoteException;

    public abstract String getNowPlayingItemName(long l)
        throws RemoteException;

    public abstract byte getPlayStatus()
        throws RemoteException;

    public abstract int getQueuePosition()
        throws RemoteException;

    public abstract int getRepeatMode()
        throws RemoteException;

    public abstract int getScanMode()
        throws RemoteException;

    public abstract int getShuffleMode()
        throws RemoteException;

    public abstract String getTrackName()
        throws RemoteException;

    public abstract boolean informBatteryStatusOfCT()
        throws RemoteException;

    public abstract boolean informDisplayableCharacterSet(int i)
        throws RemoteException;

    public abstract void next()
        throws RemoteException;

    public abstract void nextGroup()
        throws RemoteException;

    public abstract void open(long al[], int i)
        throws RemoteException;

    public abstract void pause()
        throws RemoteException;

    public abstract void play()
        throws RemoteException;

    public abstract long position()
        throws RemoteException;

    public abstract void prev()
        throws RemoteException;

    public abstract void prevGroup()
        throws RemoteException;

    public abstract boolean regNotificationEvent(byte byte0, int i)
        throws RemoteException;

    public abstract void registerCallback(IBTAvrcpMusicCallback ibtavrcpmusiccallback)
        throws RemoteException;

    public abstract void resume()
        throws RemoteException;

    public abstract boolean setEqualizeMode(int i)
        throws RemoteException;

    public abstract boolean setPlayerApplicationSettingValue(byte byte0, byte byte1)
        throws RemoteException;

    public abstract void setQueuePosition(int i)
        throws RemoteException;

    public abstract boolean setRepeatMode(int i)
        throws RemoteException;

    public abstract boolean setScanMode(int i)
        throws RemoteException;

    public abstract boolean setShuffleMode(int i)
        throws RemoteException;

    public abstract void stop()
        throws RemoteException;

    public abstract void unregisterCallback(IBTAvrcpMusicCallback ibtavrcpmusiccallback)
        throws RemoteException;
}
