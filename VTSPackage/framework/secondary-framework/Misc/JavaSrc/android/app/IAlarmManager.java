// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.os.*;

// Referenced classes of package android.app:
//            PendingIntent

public interface IAlarmManager
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IAlarmManager
    {

        private static final String DESCRIPTOR = "android.app.IAlarmManager";
        static final int TRANSACTION_bootFromPoweroffAlarm = 8;
        static final int TRANSACTION_cancelPoweroffAlarm = 7;
        static final int TRANSACTION_lookForPackageFromAms = 10;
        static final int TRANSACTION_remove = 6;
        static final int TRANSACTION_removeFromAms = 9;
        static final int TRANSACTION_set = 1;
        static final int TRANSACTION_setInexactRepeating = 3;
        static final int TRANSACTION_setRepeating = 2;
        static final int TRANSACTION_setTime = 4;
        static final int TRANSACTION_setTimeZone = 5;

        public static IAlarmManager asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.app.IAlarmManager");
            if (iinterface != null && (iinterface instanceof IAlarmManager))
                return (IAlarmManager)iinterface;
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
            case 10: // '\n'
                parcel.enforceInterface("android.app.IAlarmManager");
                boolean flag1 = lookForPackageFromAms(parcel.readString());
                parcel1.writeNoException();
                int i2;
                if (flag1)
                    i2 = 1;
                else
                    i2 = 0;
                parcel1.writeInt(i2);
                return true;

            case 9: // '\t'
                parcel.enforceInterface("android.app.IAlarmManager");
                removeFromAms(parcel.readString());
                parcel1.writeNoException();
                return true;

            case 8: // '\b'
                parcel.enforceInterface("android.app.IAlarmManager");
                boolean flag = bootFromPoweroffAlarm();
                parcel1.writeNoException();
                int k1;
                if (flag)
                    k1 = 1;
                else
                    k1 = 0;
                parcel1.writeInt(k1);
                return true;

            case 7: // '\007'
                parcel.enforceInterface("android.app.IAlarmManager");
                cancelPoweroffAlarm(parcel.readString());
                parcel1.writeNoException();
                return true;

            case 6: // '\006'
                parcel.enforceInterface("android.app.IAlarmManager");
                PendingIntent pendingintent3;
                if (parcel.readInt() != 0)
                    pendingintent3 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(parcel);
                else
                    pendingintent3 = null;
                remove(pendingintent3);
                parcel1.writeNoException();
                return true;

            case 5: // '\005'
                parcel.enforceInterface("android.app.IAlarmManager");
                setTimeZone(parcel.readString());
                parcel1.writeNoException();
                return true;

            case 4: // '\004'
                parcel.enforceInterface("android.app.IAlarmManager");
                setTime(parcel.readLong());
                parcel1.writeNoException();
                return true;

            case 3: // '\003'
                parcel.enforceInterface("android.app.IAlarmManager");
                int j1 = parcel.readInt();
                long l3 = parcel.readLong();
                long l4 = parcel.readLong();
                PendingIntent pendingintent2;
                if (parcel.readInt() != 0)
                    pendingintent2 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(parcel);
                else
                    pendingintent2 = null;
                setInexactRepeating(j1, l3, l4, pendingintent2);
                parcel1.writeNoException();
                return true;

            case 2: // '\002'
                parcel.enforceInterface("android.app.IAlarmManager");
                int i1 = parcel.readInt();
                long l1 = parcel.readLong();
                long l2 = parcel.readLong();
                PendingIntent pendingintent1;
                if (parcel.readInt() != 0)
                    pendingintent1 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(parcel);
                else
                    pendingintent1 = null;
                setRepeating(i1, l1, l2, pendingintent1);
                parcel1.writeNoException();
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.app.IAlarmManager");
                int k = parcel.readInt();
                long l = parcel.readLong();
                PendingIntent pendingintent;
                if (parcel.readInt() != 0)
                    pendingintent = (PendingIntent)PendingIntent.CREATOR.createFromParcel(parcel);
                else
                    pendingintent = null;
                set(k, l, pendingintent);
                parcel1.writeNoException();
                return true;

            case 1598968902: 
                parcel1.writeString("android.app.IAlarmManager");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.app.IAlarmManager");
        }
    }

    private static class Stub.Proxy
        implements IAlarmManager
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public boolean bootFromPoweroffAlarm()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.app.IAlarmManager");
            mRemote.transact(8, parcel, parcel1, 0);
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

        public void cancelPoweroffAlarm(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IAlarmManager");
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

        public String getInterfaceDescriptor()
        {
            return "android.app.IAlarmManager";
        }

        public boolean lookForPackageFromAms(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.app.IAlarmManager");
            parcel.writeString(s);
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

        public void remove(PendingIntent pendingintent)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IAlarmManager");
            if (pendingintent == null)
                break MISSING_BLOCK_LABEL_57;
            parcel.writeInt(1);
            pendingintent.writeToParcel(parcel, 0);
_L1:
            mRemote.transact(6, parcel, parcel1, 0);
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

        public void removeFromAms(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IAlarmManager");
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

        public void set(int i, long l, PendingIntent pendingintent)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IAlarmManager");
            parcel.writeInt(i);
            parcel.writeLong(l);
            if (pendingintent == null)
                break MISSING_BLOCK_LABEL_80;
            parcel.writeInt(1);
            pendingintent.writeToParcel(parcel, 0);
_L1:
            mRemote.transact(1, parcel, parcel1, 0);
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

        public void setInexactRepeating(int i, long l, long l1, PendingIntent pendingintent)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IAlarmManager");
            parcel.writeInt(i);
            parcel.writeLong(l);
            parcel.writeLong(l1);
            if (pendingintent == null)
                break MISSING_BLOCK_LABEL_87;
            parcel.writeInt(1);
            pendingintent.writeToParcel(parcel, 0);
_L1:
            mRemote.transact(3, parcel, parcel1, 0);
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

        public void setRepeating(int i, long l, long l1, PendingIntent pendingintent)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IAlarmManager");
            parcel.writeInt(i);
            parcel.writeLong(l);
            parcel.writeLong(l1);
            if (pendingintent == null)
                break MISSING_BLOCK_LABEL_87;
            parcel.writeInt(1);
            pendingintent.writeToParcel(parcel, 0);
_L1:
            mRemote.transact(2, parcel, parcel1, 0);
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

        public void setTime(long l)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IAlarmManager");
            parcel.writeLong(l);
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

        public void setTimeZone(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IAlarmManager");
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


    public abstract boolean bootFromPoweroffAlarm()
        throws RemoteException;

    public abstract void cancelPoweroffAlarm(String s)
        throws RemoteException;

    public abstract boolean lookForPackageFromAms(String s)
        throws RemoteException;

    public abstract void remove(PendingIntent pendingintent)
        throws RemoteException;

    public abstract void removeFromAms(String s)
        throws RemoteException;

    public abstract void set(int i, long l, PendingIntent pendingintent)
        throws RemoteException;

    public abstract void setInexactRepeating(int i, long l, long l1, PendingIntent pendingintent)
        throws RemoteException;

    public abstract void setRepeating(int i, long l, long l1, PendingIntent pendingintent)
        throws RemoteException;

    public abstract void setTime(long l)
        throws RemoteException;

    public abstract void setTimeZone(String s)
        throws RemoteException;
}
