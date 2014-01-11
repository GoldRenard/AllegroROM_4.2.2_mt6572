// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.music;

import android.os.*;

public interface IMediaPlaybackService
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IMediaPlaybackService
    {

        private static final String DESCRIPTOR = "com.android.music.IMediaPlaybackService";
        static final int TRANSACTION_duration = 10;
        static final int TRANSACTION_enqueue = 19;
        static final int TRANSACTION_getAlbumId = 15;
        static final int TRANSACTION_getAlbumName = 14;
        static final int TRANSACTION_getArtistId = 17;
        static final int TRANSACTION_getArtistName = 16;
        static final int TRANSACTION_getAudioId = 24;
        static final int TRANSACTION_getAudioSessionId = 32;
        static final int TRANSACTION_getMIMEType = 18;
        static final int TRANSACTION_getMediaMountedCount = 31;
        static final int TRANSACTION_getPath = 23;
        static final int TRANSACTION_getQueue = 20;
        static final int TRANSACTION_getQueuePosition = 3;
        static final int TRANSACTION_getRepeatMode = 30;
        static final int TRANSACTION_getShuffleMode = 26;
        static final int TRANSACTION_getTrackName = 13;
        static final int TRANSACTION_isPlaying = 4;
        static final int TRANSACTION_moveQueueItem = 21;
        static final int TRANSACTION_next = 9;
        static final int TRANSACTION_open = 2;
        static final int TRANSACTION_openFile = 1;
        static final int TRANSACTION_pause = 6;
        static final int TRANSACTION_play = 7;
        static final int TRANSACTION_position = 11;
        static final int TRANSACTION_prev = 8;
        static final int TRANSACTION_removeTrack = 28;
        static final int TRANSACTION_removeTracks = 27;
        static final int TRANSACTION_seek = 12;
        static final int TRANSACTION_setQueuePosition = 22;
        static final int TRANSACTION_setRepeatMode = 29;
        static final int TRANSACTION_setShuffleMode = 25;
        static final int TRANSACTION_stop = 5;

        public static IMediaPlaybackService asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("com.android.music.IMediaPlaybackService");
            if (iinterface != null && (iinterface instanceof IMediaPlaybackService))
                return (IMediaPlaybackService)iinterface;
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
            case 32: // ' '
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                int k2 = getAudioSessionId();
                parcel1.writeNoException();
                parcel1.writeInt(k2);
                return true;

            case 31: // '\037'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                int j2 = getMediaMountedCount();
                parcel1.writeNoException();
                parcel1.writeInt(j2);
                return true;

            case 30: // '\036'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                int i2 = getRepeatMode();
                parcel1.writeNoException();
                parcel1.writeInt(i2);
                return true;

            case 29: // '\035'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                setRepeatMode(parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 28: // '\034'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                int k1 = removeTrack(parcel.readLong());
                parcel1.writeNoException();
                parcel1.writeInt(k1);
                return true;

            case 27: // '\033'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                int j1 = removeTracks(parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeInt(j1);
                return true;

            case 26: // '\032'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                int i1 = getShuffleMode();
                parcel1.writeNoException();
                parcel1.writeInt(i1);
                return true;

            case 25: // '\031'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                setShuffleMode(parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 24: // '\030'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                long l6 = getAudioId();
                parcel1.writeNoException();
                parcel1.writeLong(l6);
                return true;

            case 23: // '\027'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                String s4 = getPath();
                parcel1.writeNoException();
                parcel1.writeString(s4);
                return true;

            case 22: // '\026'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                setQueuePosition(parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 21: // '\025'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                moveQueueItem(parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 20: // '\024'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                long al[] = getQueue();
                parcel1.writeNoException();
                parcel1.writeLongArray(al);
                return true;

            case 19: // '\023'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                enqueue(parcel.createLongArray(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 18: // '\022'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                String s3 = getMIMEType();
                parcel1.writeNoException();
                parcel1.writeString(s3);
                return true;

            case 17: // '\021'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                long l5 = getArtistId();
                parcel1.writeNoException();
                parcel1.writeLong(l5);
                return true;

            case 16: // '\020'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                String s2 = getArtistName();
                parcel1.writeNoException();
                parcel1.writeString(s2);
                return true;

            case 15: // '\017'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                long l4 = getAlbumId();
                parcel1.writeNoException();
                parcel1.writeLong(l4);
                return true;

            case 14: // '\016'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                String s1 = getAlbumName();
                parcel1.writeNoException();
                parcel1.writeString(s1);
                return true;

            case 13: // '\r'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                String s = getTrackName();
                parcel1.writeNoException();
                parcel1.writeString(s);
                return true;

            case 12: // '\f'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                long l3 = seek(parcel.readLong());
                parcel1.writeNoException();
                parcel1.writeLong(l3);
                return true;

            case 11: // '\013'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                long l2 = position();
                parcel1.writeNoException();
                parcel1.writeLong(l2);
                return true;

            case 10: // '\n'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                long l1 = duration();
                parcel1.writeNoException();
                parcel1.writeLong(l1);
                return true;

            case 9: // '\t'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                next();
                parcel1.writeNoException();
                return true;

            case 8: // '\b'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                prev();
                parcel1.writeNoException();
                return true;

            case 7: // '\007'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                play();
                parcel1.writeNoException();
                return true;

            case 6: // '\006'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                pause();
                parcel1.writeNoException();
                return true;

            case 5: // '\005'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                stop();
                parcel1.writeNoException();
                return true;

            case 4: // '\004'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                boolean flag = isPlaying();
                parcel1.writeNoException();
                int l;
                if (flag)
                    l = 1;
                else
                    l = 0;
                parcel1.writeInt(l);
                return true;

            case 3: // '\003'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                int k = getQueuePosition();
                parcel1.writeNoException();
                parcel1.writeInt(k);
                return true;

            case 2: // '\002'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                open(parcel.createLongArray(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 1: // '\001'
                parcel.enforceInterface("com.android.music.IMediaPlaybackService");
                openFile(parcel.readString());
                parcel1.writeNoException();
                return true;

            case 1598968902: 
                parcel1.writeString("com.android.music.IMediaPlaybackService");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "com.android.music.IMediaPlaybackService");
        }
    }

    private static class Stub.Proxy
        implements IMediaPlaybackService
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
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            mRemote.transact(10, parcel, parcel1, 0);
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
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            parcel.writeLongArray(al);
            parcel.writeInt(i);
            mRemote.transact(19, parcel, parcel1, 0);
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
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            mRemote.transact(15, parcel, parcel1, 0);
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
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            mRemote.transact(14, parcel, parcel1, 0);
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

        public long getArtistId()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            long l;
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            mRemote.transact(17, parcel, parcel1, 0);
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

        public String getArtistName()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            String s;
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            mRemote.transact(16, parcel, parcel1, 0);
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
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            mRemote.transact(24, parcel, parcel1, 0);
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

        public int getAudioSessionId()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            mRemote.transact(32, parcel, parcel1, 0);
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
            return "com.android.music.IMediaPlaybackService";
        }

        public String getMIMEType()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            String s;
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            mRemote.transact(18, parcel, parcel1, 0);
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

        public int getMediaMountedCount()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            mRemote.transact(31, parcel, parcel1, 0);
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

        public String getPath()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            String s;
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            mRemote.transact(23, parcel, parcel1, 0);
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

        public long[] getQueue()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            long al[];
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            mRemote.transact(20, parcel, parcel1, 0);
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

        public int getQueuePosition()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            mRemote.transact(3, parcel, parcel1, 0);
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
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            mRemote.transact(30, parcel, parcel1, 0);
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
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            mRemote.transact(26, parcel, parcel1, 0);
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
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            mRemote.transact(13, parcel, parcel1, 0);
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

        public boolean isPlaying()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
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

        public void moveQueueItem(int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(21, parcel, parcel1, 0);
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

        public void next()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
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

        public void open(long al[], int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            parcel.writeLongArray(al);
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

        public void openFile(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            parcel.writeString(s);
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

        public void pause()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
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

        public void play()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
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

        public long position()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            long l;
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            mRemote.transact(11, parcel, parcel1, 0);
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
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
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

        public int removeTrack(long l)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            parcel.writeLong(l);
            mRemote.transact(28, parcel, parcel1, 0);
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

        public int removeTracks(int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int k;
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(27, parcel, parcel1, 0);
            parcel1.readException();
            k = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return k;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public long seek(long l)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            long l1;
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            parcel.writeLong(l);
            mRemote.transact(12, parcel, parcel1, 0);
            parcel1.readException();
            l1 = parcel1.readLong();
            parcel1.recycle();
            parcel.recycle();
            return l1;
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
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            parcel.writeInt(i);
            mRemote.transact(22, parcel, parcel1, 0);
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

        public void setRepeatMode(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            parcel.writeInt(i);
            mRemote.transact(29, parcel, parcel1, 0);
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

        public void setShuffleMode(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
            parcel.writeInt(i);
            mRemote.transact(25, parcel, parcel1, 0);
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

        public void stop()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.android.music.IMediaPlaybackService");
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


    public abstract long duration()
        throws RemoteException;

    public abstract void enqueue(long al[], int i)
        throws RemoteException;

    public abstract long getAlbumId()
        throws RemoteException;

    public abstract String getAlbumName()
        throws RemoteException;

    public abstract long getArtistId()
        throws RemoteException;

    public abstract String getArtistName()
        throws RemoteException;

    public abstract long getAudioId()
        throws RemoteException;

    public abstract int getAudioSessionId()
        throws RemoteException;

    public abstract String getMIMEType()
        throws RemoteException;

    public abstract int getMediaMountedCount()
        throws RemoteException;

    public abstract String getPath()
        throws RemoteException;

    public abstract long[] getQueue()
        throws RemoteException;

    public abstract int getQueuePosition()
        throws RemoteException;

    public abstract int getRepeatMode()
        throws RemoteException;

    public abstract int getShuffleMode()
        throws RemoteException;

    public abstract String getTrackName()
        throws RemoteException;

    public abstract boolean isPlaying()
        throws RemoteException;

    public abstract void moveQueueItem(int i, int j)
        throws RemoteException;

    public abstract void next()
        throws RemoteException;

    public abstract void open(long al[], int i)
        throws RemoteException;

    public abstract void openFile(String s)
        throws RemoteException;

    public abstract void pause()
        throws RemoteException;

    public abstract void play()
        throws RemoteException;

    public abstract long position()
        throws RemoteException;

    public abstract void prev()
        throws RemoteException;

    public abstract int removeTrack(long l)
        throws RemoteException;

    public abstract int removeTracks(int i, int j)
        throws RemoteException;

    public abstract long seek(long l)
        throws RemoteException;

    public abstract void setQueuePosition(int i)
        throws RemoteException;

    public abstract void setRepeatMode(int i)
        throws RemoteException;

    public abstract void setShuffleMode(int i)
        throws RemoteException;

    public abstract void stop()
        throws RemoteException;
}
