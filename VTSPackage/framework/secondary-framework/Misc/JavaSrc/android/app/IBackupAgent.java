// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.app.backup.IBackupManager;
import android.os.*;

public interface IBackupAgent
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IBackupAgent
    {

        private static final String DESCRIPTOR = "android.app.IBackupAgent";
        static final int TRANSACTION_doBackup = 1;
        static final int TRANSACTION_doFullBackup = 3;
        static final int TRANSACTION_doRestore = 2;
        static final int TRANSACTION_doRestoreFile = 4;

        public static IBackupAgent asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.app.IBackupAgent");
            if (iinterface != null && (iinterface instanceof IBackupAgent))
                return (IBackupAgent)iinterface;
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
                parcel.enforceInterface("android.app.IBackupAgent");
                ParcelFileDescriptor parcelfiledescriptor6;
                if (parcel.readInt() != 0)
                    parcelfiledescriptor6 = (ParcelFileDescriptor)ParcelFileDescriptor.CREATOR.createFromParcel(parcel);
                else
                    parcelfiledescriptor6 = null;
                long l = parcel.readLong();
                int i1 = parcel.readInt();
                String s = parcel.readString();
                String s1 = parcel.readString();
                long l1 = parcel.readLong();
                long l2 = parcel.readLong();
                int j1 = parcel.readInt();
                IBackupManager ibackupmanager = android.app.backup.IBackupManager.Stub.asInterface(parcel.readStrongBinder());
                doRestoreFile(parcelfiledescriptor6, l, i1, s, s1, l1, l2, j1, ibackupmanager);
                return true;

            case 3: // '\003'
                parcel.enforceInterface("android.app.IBackupAgent");
                ParcelFileDescriptor parcelfiledescriptor5;
                if (parcel.readInt() != 0)
                    parcelfiledescriptor5 = (ParcelFileDescriptor)ParcelFileDescriptor.CREATOR.createFromParcel(parcel);
                else
                    parcelfiledescriptor5 = null;
                doFullBackup(parcelfiledescriptor5, parcel.readInt(), android.app.backup.IBackupManager.Stub.asInterface(parcel.readStrongBinder()));
                return true;

            case 2: // '\002'
                parcel.enforceInterface("android.app.IBackupAgent");
                ParcelFileDescriptor parcelfiledescriptor3;
                if (parcel.readInt() != 0)
                    parcelfiledescriptor3 = (ParcelFileDescriptor)ParcelFileDescriptor.CREATOR.createFromParcel(parcel);
                else
                    parcelfiledescriptor3 = null;
                int k = parcel.readInt();
                ParcelFileDescriptor parcelfiledescriptor4;
                if (parcel.readInt() != 0)
                    parcelfiledescriptor4 = (ParcelFileDescriptor)ParcelFileDescriptor.CREATOR.createFromParcel(parcel);
                else
                    parcelfiledescriptor4 = null;
                doRestore(parcelfiledescriptor3, k, parcelfiledescriptor4, parcel.readInt(), android.app.backup.IBackupManager.Stub.asInterface(parcel.readStrongBinder()));
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.app.IBackupAgent");
                ParcelFileDescriptor parcelfiledescriptor;
                if (parcel.readInt() != 0)
                    parcelfiledescriptor = (ParcelFileDescriptor)ParcelFileDescriptor.CREATOR.createFromParcel(parcel);
                else
                    parcelfiledescriptor = null;
                ParcelFileDescriptor parcelfiledescriptor1;
                if (parcel.readInt() != 0)
                    parcelfiledescriptor1 = (ParcelFileDescriptor)ParcelFileDescriptor.CREATOR.createFromParcel(parcel);
                else
                    parcelfiledescriptor1 = null;
                ParcelFileDescriptor parcelfiledescriptor2;
                if (parcel.readInt() != 0)
                    parcelfiledescriptor2 = (ParcelFileDescriptor)ParcelFileDescriptor.CREATOR.createFromParcel(parcel);
                else
                    parcelfiledescriptor2 = null;
                doBackup(parcelfiledescriptor, parcelfiledescriptor1, parcelfiledescriptor2, parcel.readInt(), android.app.backup.IBackupManager.Stub.asInterface(parcel.readStrongBinder()));
                return true;

            case 1598968902: 
                parcel1.writeString("android.app.IBackupAgent");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.app.IBackupAgent");
        }
    }

    private static class Stub.Proxy
        implements IBackupAgent
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public void doBackup(ParcelFileDescriptor parcelfiledescriptor, ParcelFileDescriptor parcelfiledescriptor1, ParcelFileDescriptor parcelfiledescriptor2, int i, IBackupManager ibackupmanager)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IBackupAgent");
            if (parcelfiledescriptor == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            parcelfiledescriptor.writeToParcel(parcel, 0);
_L5:
            if (parcelfiledescriptor1 == null) goto _L4; else goto _L3
_L3:
            parcel.writeInt(1);
            parcelfiledescriptor1.writeToParcel(parcel, 0);
_L6:
            if (parcelfiledescriptor2 == null)
                break MISSING_BLOCK_LABEL_143;
            parcel.writeInt(1);
            parcelfiledescriptor2.writeToParcel(parcel, 0);
_L7:
            parcel.writeInt(i);
            IBinder ibinder;
            ibinder = null;
            if (ibackupmanager == null)
                break MISSING_BLOCK_LABEL_87;
            ibinder = ibackupmanager.asBinder();
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(1, parcel, null, 1);
            parcel.recycle();
            return;
_L2:
            parcel.writeInt(0);
              goto _L5
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
_L4:
            parcel.writeInt(0);
              goto _L6
            parcel.writeInt(0);
              goto _L7
        }

        public void doFullBackup(ParcelFileDescriptor parcelfiledescriptor, int i, IBackupManager ibackupmanager)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IBackupAgent");
            if (parcelfiledescriptor == null)
                break MISSING_BLOCK_LABEL_78;
            parcel.writeInt(1);
            parcelfiledescriptor.writeToParcel(parcel, 0);
_L1:
            parcel.writeInt(i);
            IBinder ibinder;
            ibinder = null;
            if (ibackupmanager == null)
                break MISSING_BLOCK_LABEL_50;
            ibinder = ibackupmanager.asBinder();
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(3, parcel, null, 1);
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void doRestore(ParcelFileDescriptor parcelfiledescriptor, int i, ParcelFileDescriptor parcelfiledescriptor1, int j, IBackupManager ibackupmanager)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IBackupAgent");
            if (parcelfiledescriptor == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            parcelfiledescriptor.writeToParcel(parcel, 0);
_L3:
            parcel.writeInt(i);
            if (parcelfiledescriptor1 == null)
                break MISSING_BLOCK_LABEL_123;
            parcel.writeInt(1);
            parcelfiledescriptor1.writeToParcel(parcel, 0);
_L4:
            parcel.writeInt(j);
            IBinder ibinder;
            ibinder = null;
            if (ibackupmanager == null)
                break MISSING_BLOCK_LABEL_76;
            ibinder = ibackupmanager.asBinder();
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(2, parcel, null, 1);
            parcel.recycle();
            return;
_L2:
            parcel.writeInt(0);
              goto _L3
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
            parcel.writeInt(0);
              goto _L4
        }

        public void doRestoreFile(ParcelFileDescriptor parcelfiledescriptor, long l, int i, String s, String s1, long l1, long l2, int j, IBackupManager ibackupmanager)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IBackupAgent");
            if (parcelfiledescriptor == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            parcelfiledescriptor.writeToParcel(parcel, 0);
_L3:
            parcel.writeLong(l);
            parcel.writeInt(i);
            parcel.writeString(s);
            parcel.writeString(s1);
            parcel.writeLong(l1);
            parcel.writeLong(l2);
            parcel.writeInt(j);
            if (ibackupmanager == null)
                break MISSING_BLOCK_LABEL_138;
            IBinder ibinder = ibackupmanager.asBinder();
_L4:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(4, parcel, null, 1);
            parcel.recycle();
            return;
_L2:
            parcel.writeInt(0);
              goto _L3
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
            ibinder = null;
              goto _L4
        }

        public String getInterfaceDescriptor()
        {
            return "android.app.IBackupAgent";
        }

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract void doBackup(ParcelFileDescriptor parcelfiledescriptor, ParcelFileDescriptor parcelfiledescriptor1, ParcelFileDescriptor parcelfiledescriptor2, int i, IBackupManager ibackupmanager)
        throws RemoteException;

    public abstract void doFullBackup(ParcelFileDescriptor parcelfiledescriptor, int i, IBackupManager ibackupmanager)
        throws RemoteException;

    public abstract void doRestore(ParcelFileDescriptor parcelfiledescriptor, int i, ParcelFileDescriptor parcelfiledescriptor1, int j, IBackupManager ibackupmanager)
        throws RemoteException;

    public abstract void doRestoreFile(ParcelFileDescriptor parcelfiledescriptor, long l, int i, String s, String s1, long l1, long l2, int j, IBackupManager ibackupmanager)
        throws RemoteException;
}
