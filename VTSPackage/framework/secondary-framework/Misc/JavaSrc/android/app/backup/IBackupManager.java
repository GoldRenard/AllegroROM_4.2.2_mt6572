// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app.backup;

import android.content.Intent;
import android.os.*;

// Referenced classes of package android.app.backup:
//            IFullBackupRestoreObserver, IRestoreSession

public interface IBackupManager
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IBackupManager
    {

        private static final String DESCRIPTOR = "android.app.backup.IBackupManager";
        static final int TRANSACTION_acknowledgeFullBackupOrRestore = 15;
        static final int TRANSACTION_agentConnected = 3;
        static final int TRANSACTION_agentDisconnected = 4;
        static final int TRANSACTION_backupNow = 12;
        static final int TRANSACTION_beginRestoreSession = 21;
        static final int TRANSACTION_clearBackupData = 2;
        static final int TRANSACTION_dataChanged = 1;
        static final int TRANSACTION_fullBackup = 13;
        static final int TRANSACTION_fullRestore = 14;
        static final int TRANSACTION_getConfigurationIntent = 19;
        static final int TRANSACTION_getCurrentTransport = 16;
        static final int TRANSACTION_getDestinationString = 20;
        static final int TRANSACTION_hasBackupPassword = 11;
        static final int TRANSACTION_isBackupEnabled = 9;
        static final int TRANSACTION_listAllTransports = 17;
        static final int TRANSACTION_opComplete = 22;
        static final int TRANSACTION_restoreAtInstall = 5;
        static final int TRANSACTION_selectBackupTransport = 18;
        static final int TRANSACTION_setAutoRestore = 7;
        static final int TRANSACTION_setBackupEnabled = 6;
        static final int TRANSACTION_setBackupPassword = 10;
        static final int TRANSACTION_setBackupProvisioned = 8;

        public static IBackupManager asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.app.backup.IBackupManager");
            if (iinterface != null && (iinterface instanceof IBackupManager))
                return (IBackupManager)iinterface;
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
            case 22: // '\026'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                opComplete(parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 21: // '\025'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                IRestoreSession irestoresession = beginRestoreSession(parcel.readString(), parcel.readString());
                parcel1.writeNoException();
                IBinder ibinder;
                if (irestoresession != null)
                    ibinder = irestoresession.asBinder();
                else
                    ibinder = null;
                parcel1.writeStrongBinder(ibinder);
                return true;

            case 20: // '\024'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                String s2 = getDestinationString(parcel.readString());
                parcel1.writeNoException();
                parcel1.writeString(s2);
                return true;

            case 19: // '\023'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                Intent intent = getConfigurationIntent(parcel.readString());
                parcel1.writeNoException();
                if (intent != null)
                {
                    parcel1.writeInt(1);
                    intent.writeToParcel(parcel1, 1);
                    return true;
                } else
                {
                    parcel1.writeInt(0);
                    return true;
                }

            case 18: // '\022'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                String s1 = selectBackupTransport(parcel.readString());
                parcel1.writeNoException();
                parcel1.writeString(s1);
                return true;

            case 17: // '\021'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                String as[] = listAllTransports();
                parcel1.writeNoException();
                parcel1.writeStringArray(as);
                return true;

            case 16: // '\020'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                String s = getCurrentTransport();
                parcel1.writeNoException();
                parcel1.writeString(s);
                return true;

            case 15: // '\017'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                int j1 = parcel.readInt();
                boolean flag10;
                if (parcel.readInt() != 0)
                    flag10 = true;
                else
                    flag10 = false;
                acknowledgeFullBackupOrRestore(j1, flag10, parcel.readString(), parcel.readString(), IFullBackupRestoreObserver.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                return true;

            case 14: // '\016'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                ParcelFileDescriptor parcelfiledescriptor1;
                if (parcel.readInt() != 0)
                    parcelfiledescriptor1 = (ParcelFileDescriptor)ParcelFileDescriptor.CREATOR.createFromParcel(parcel);
                else
                    parcelfiledescriptor1 = null;
                fullRestore(parcelfiledescriptor1);
                parcel1.writeNoException();
                return true;

            case 13: // '\r'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                ParcelFileDescriptor parcelfiledescriptor;
                if (parcel.readInt() != 0)
                    parcelfiledescriptor = (ParcelFileDescriptor)ParcelFileDescriptor.CREATOR.createFromParcel(parcel);
                else
                    parcelfiledescriptor = null;
                boolean flag6;
                if (parcel.readInt() != 0)
                    flag6 = true;
                else
                    flag6 = false;
                boolean flag7;
                if (parcel.readInt() != 0)
                    flag7 = true;
                else
                    flag7 = false;
                boolean flag8;
                if (parcel.readInt() != 0)
                    flag8 = true;
                else
                    flag8 = false;
                boolean flag9;
                if (parcel.readInt() != 0)
                    flag9 = true;
                else
                    flag9 = false;
                fullBackup(parcelfiledescriptor, flag6, flag7, flag8, flag9, parcel.createStringArray());
                parcel1.writeNoException();
                return true;

            case 12: // '\f'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                backupNow();
                parcel1.writeNoException();
                return true;

            case 11: // '\013'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                boolean flag5 = hasBackupPassword();
                parcel1.writeNoException();
                int i1 = 0;
                if (flag5)
                    i1 = 1;
                parcel1.writeInt(i1);
                return true;

            case 10: // '\n'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                boolean flag4 = setBackupPassword(parcel.readString(), parcel.readString());
                parcel1.writeNoException();
                int l = 0;
                if (flag4)
                    l = 1;
                parcel1.writeInt(l);
                return true;

            case 9: // '\t'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                boolean flag3 = isBackupEnabled();
                parcel1.writeNoException();
                int k = 0;
                if (flag3)
                    k = 1;
                parcel1.writeInt(k);
                return true;

            case 8: // '\b'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                boolean flag2;
                if (parcel.readInt() != 0)
                    flag2 = true;
                else
                    flag2 = false;
                setBackupProvisioned(flag2);
                parcel1.writeNoException();
                return true;

            case 7: // '\007'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                boolean flag1;
                if (parcel.readInt() != 0)
                    flag1 = true;
                else
                    flag1 = false;
                setAutoRestore(flag1);
                parcel1.writeNoException();
                return true;

            case 6: // '\006'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                boolean flag;
                if (parcel.readInt() != 0)
                    flag = true;
                else
                    flag = false;
                setBackupEnabled(flag);
                parcel1.writeNoException();
                return true;

            case 5: // '\005'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                restoreAtInstall(parcel.readString(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 4: // '\004'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                agentDisconnected(parcel.readString());
                parcel1.writeNoException();
                return true;

            case 3: // '\003'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                agentConnected(parcel.readString(), parcel.readStrongBinder());
                parcel1.writeNoException();
                return true;

            case 2: // '\002'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                clearBackupData(parcel.readString());
                parcel1.writeNoException();
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.app.backup.IBackupManager");
                dataChanged(parcel.readString());
                parcel1.writeNoException();
                return true;

            case 1598968902: 
                parcel1.writeString("android.app.backup.IBackupManager");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.app.backup.IBackupManager");
        }
    }

    private static class Stub.Proxy
        implements IBackupManager
    {

        private IBinder mRemote;

        public void acknowledgeFullBackupOrRestore(int i, boolean flag, String s, String s1, IFullBackupRestoreObserver ifullbackuprestoreobserver)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
            parcel.writeInt(i);
            int j;
            j = 0;
            if (flag)
                j = 1;
            parcel.writeInt(j);
            parcel.writeString(s);
            parcel.writeString(s1);
            if (ifullbackuprestoreobserver == null)
                break MISSING_BLOCK_LABEL_107;
            IBinder ibinder = ifullbackuprestoreobserver.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(15, parcel, parcel1, 0);
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

        public void agentConnected(String s, IBinder ibinder)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
            parcel.writeString(s);
            parcel.writeStrongBinder(ibinder);
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

        public void agentDisconnected(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
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

        public IBinder asBinder()
        {
            return mRemote;
        }

        public void backupNow()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
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

        public IRestoreSession beginRestoreSession(String s, String s1)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            IRestoreSession irestoresession;
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
            parcel.writeString(s);
            parcel.writeString(s1);
            mRemote.transact(21, parcel, parcel1, 0);
            parcel1.readException();
            irestoresession = IRestoreSession.Stub.asInterface(parcel1.readStrongBinder());
            parcel1.recycle();
            parcel.recycle();
            return irestoresession;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void clearBackupData(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
            parcel.writeString(s);
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

        public void dataChanged(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
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

        public void fullBackup(ParcelFileDescriptor parcelfiledescriptor, boolean flag, boolean flag1, boolean flag2, boolean flag3, String as[])
            throws RemoteException
        {
            int i;
            Parcel parcel;
            Parcel parcel1;
            i = 1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
            if (parcelfiledescriptor == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            parcelfiledescriptor.writeToParcel(parcel, 0);
              goto _L3
_L5:
            int j;
            parcel.writeInt(j);
            Exception exception;
            int k;
            int l;
            if (flag1)
                k = i;
            else
                k = 0;
            parcel.writeInt(k);
            if (flag2)
                l = i;
            else
                l = 0;
            parcel.writeInt(l);
            if (!flag3)
                i = 0;
            parcel.writeInt(i);
            parcel.writeStringArray(as);
            mRemote.transact(13, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
_L2:
            parcel.writeInt(0);
              goto _L3
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
_L3:
            while (!flag) 
            {
                j = 0;
                continue; /* Loop/switch isn't completed */
            }
            j = i;
            if (true) goto _L5; else goto _L4
_L4:
        }

        public void fullRestore(ParcelFileDescriptor parcelfiledescriptor)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
            if (parcelfiledescriptor == null)
                break MISSING_BLOCK_LABEL_57;
            parcel.writeInt(1);
            parcelfiledescriptor.writeToParcel(parcel, 0);
_L1:
            mRemote.transact(14, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public Intent getConfigurationIntent(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
            parcel.writeString(s);
            mRemote.transact(19, parcel, parcel1, 0);
            parcel1.readException();
            if (parcel1.readInt() == 0) goto _L2; else goto _L1
_L1:
            Intent intent = (Intent)Intent.CREATOR.createFromParcel(parcel1);
_L4:
            parcel1.recycle();
            parcel.recycle();
            return intent;
_L2:
            intent = null;
            if (true) goto _L4; else goto _L3
_L3:
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public String getCurrentTransport()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            String s;
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
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

        public String getDestinationString(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            String s1;
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
            parcel.writeString(s);
            mRemote.transact(20, parcel, parcel1, 0);
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

        public String getInterfaceDescriptor()
        {
            return "android.app.backup.IBackupManager";
        }

        public boolean hasBackupPassword()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
            mRemote.transact(11, parcel, parcel1, 0);
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

        public boolean isBackupEnabled()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
            mRemote.transact(9, parcel, parcel1, 0);
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

        public String[] listAllTransports()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            String as[];
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
            mRemote.transact(17, parcel, parcel1, 0);
            parcel1.readException();
            as = parcel1.createStringArray();
            parcel1.recycle();
            parcel.recycle();
            return as;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void opComplete(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
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

        public void restoreAtInstall(String s, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
            parcel.writeString(s);
            parcel.writeInt(i);
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

        public String selectBackupTransport(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            String s1;
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
            parcel.writeString(s);
            mRemote.transact(18, parcel, parcel1, 0);
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

        public void setAutoRestore(boolean flag)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
            int i;
            i = 0;
            if (flag)
                i = 1;
            parcel.writeInt(i);
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

        public void setBackupEnabled(boolean flag)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
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

        public boolean setBackupPassword(String s, String s1)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
            parcel.writeString(s);
            parcel.writeString(s1);
            mRemote.transact(10, parcel, parcel1, 0);
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

        public void setBackupProvisioned(boolean flag)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.backup.IBackupManager");
            int i;
            i = 0;
            if (flag)
                i = 1;
            parcel.writeInt(i);
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


    public abstract void acknowledgeFullBackupOrRestore(int i, boolean flag, String s, String s1, IFullBackupRestoreObserver ifullbackuprestoreobserver)
        throws RemoteException;

    public abstract void agentConnected(String s, IBinder ibinder)
        throws RemoteException;

    public abstract void agentDisconnected(String s)
        throws RemoteException;

    public abstract void backupNow()
        throws RemoteException;

    public abstract IRestoreSession beginRestoreSession(String s, String s1)
        throws RemoteException;

    public abstract void clearBackupData(String s)
        throws RemoteException;

    public abstract void dataChanged(String s)
        throws RemoteException;

    public abstract void fullBackup(ParcelFileDescriptor parcelfiledescriptor, boolean flag, boolean flag1, boolean flag2, boolean flag3, String as[])
        throws RemoteException;

    public abstract void fullRestore(ParcelFileDescriptor parcelfiledescriptor)
        throws RemoteException;

    public abstract Intent getConfigurationIntent(String s)
        throws RemoteException;

    public abstract String getCurrentTransport()
        throws RemoteException;

    public abstract String getDestinationString(String s)
        throws RemoteException;

    public abstract boolean hasBackupPassword()
        throws RemoteException;

    public abstract boolean isBackupEnabled()
        throws RemoteException;

    public abstract String[] listAllTransports()
        throws RemoteException;

    public abstract void opComplete(int i)
        throws RemoteException;

    public abstract void restoreAtInstall(String s, int i)
        throws RemoteException;

    public abstract String selectBackupTransport(String s)
        throws RemoteException;

    public abstract void setAutoRestore(boolean flag)
        throws RemoteException;

    public abstract void setBackupEnabled(boolean flag)
        throws RemoteException;

    public abstract boolean setBackupPassword(String s, String s1)
        throws RemoteException;

    public abstract void setBackupProvisioned(boolean flag)
        throws RemoteException;
}
