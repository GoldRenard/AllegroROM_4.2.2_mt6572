// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.recording;

import android.os.*;

// Referenced classes of package com.mediatek.phone.recording:
//            IPhoneRecordStateListener

public interface IPhoneRecorder
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IPhoneRecorder
    {

        private static final String DESCRIPTOR = "com.mediatek.phone.recording.IPhoneRecorder";
        static final int TRANSACTION_listen = 1;
        static final int TRANSACTION_remove = 2;
        static final int TRANSACTION_startRecord = 3;
        static final int TRANSACTION_stopRecord = 4;

        public static IPhoneRecorder asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("com.mediatek.phone.recording.IPhoneRecorder");
            if (iinterface != null && (iinterface instanceof IPhoneRecorder))
                return (IPhoneRecorder)iinterface;
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
            case 4: // '\004'
                parcel.enforceInterface("com.mediatek.phone.recording.IPhoneRecorder");
                boolean flag;
                if (parcel.readInt() != 0)
                    flag = true;
                else
                    flag = false;
                stopRecord(flag);
                parcel1.writeNoException();
                return true;

            case 3: // '\003'
                parcel.enforceInterface("com.mediatek.phone.recording.IPhoneRecorder");
                startRecord();
                parcel1.writeNoException();
                return true;

            case 2: // '\002'
                parcel.enforceInterface("com.mediatek.phone.recording.IPhoneRecorder");
                remove();
                parcel1.writeNoException();
                return true;

            case 1: // '\001'
                parcel.enforceInterface("com.mediatek.phone.recording.IPhoneRecorder");
                listen(IPhoneRecordStateListener.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                return true;

            case 1598968902: 
                parcel1.writeString("com.mediatek.phone.recording.IPhoneRecorder");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "com.mediatek.phone.recording.IPhoneRecorder");
        }
    }

    private static class Stub.Proxy
        implements IPhoneRecorder
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public String getInterfaceDescriptor()
        {
            return "com.mediatek.phone.recording.IPhoneRecorder";
        }

        public void listen(IPhoneRecordStateListener iphonerecordstatelistener)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.phone.recording.IPhoneRecorder");
            if (iphonerecordstatelistener == null)
                break MISSING_BLOCK_LABEL_59;
            IBinder ibinder = iphonerecordstatelistener.asBinder();
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

        public void remove()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.phone.recording.IPhoneRecorder");
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

        public void startRecord()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.phone.recording.IPhoneRecorder");
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

        public void stopRecord(boolean flag)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.phone.recording.IPhoneRecorder");
            int i;
            i = 0;
            if (flag)
                i = 1;
            parcel.writeInt(i);
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

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract void listen(IPhoneRecordStateListener iphonerecordstatelistener)
        throws RemoteException;

    public abstract void remove()
        throws RemoteException;

    public abstract void startRecord()
        throws RemoteException;

    public abstract void stopRecord(boolean flag)
        throws RemoteException;
}
