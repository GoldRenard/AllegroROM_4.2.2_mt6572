// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.os.*;

// Referenced classes of package android.app:
//            ITransientNotification, Notification

public interface INotificationManager
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements INotificationManager
    {

        private static final String DESCRIPTOR = "android.app.INotificationManager";
        static final int TRANSACTION_areNotificationsEnabledForPackage = 7;
        static final int TRANSACTION_cancelAllNotifications = 1;
        static final int TRANSACTION_cancelNotificationWithTag = 5;
        static final int TRANSACTION_cancelToast = 3;
        static final int TRANSACTION_enqueueNotificationWithTag = 4;
        static final int TRANSACTION_enqueueToast = 2;
        static final int TRANSACTION_setNotificationsEnabledForPackage = 6;

        public static INotificationManager asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.app.INotificationManager");
            if (iinterface != null && (iinterface instanceof INotificationManager))
                return (INotificationManager)iinterface;
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
            case 7: // '\007'
                parcel.enforceInterface("android.app.INotificationManager");
                boolean flag1 = areNotificationsEnabledForPackage(parcel.readString());
                parcel1.writeNoException();
                int i1 = 0;
                if (flag1)
                    i1 = 1;
                parcel1.writeInt(i1);
                return true;

            case 6: // '\006'
                parcel.enforceInterface("android.app.INotificationManager");
                String s2 = parcel.readString();
                int l = parcel.readInt();
                boolean flag = false;
                if (l != 0)
                    flag = true;
                setNotificationsEnabledForPackage(s2, flag);
                parcel1.writeNoException();
                return true;

            case 5: // '\005'
                parcel.enforceInterface("android.app.INotificationManager");
                cancelNotificationWithTag(parcel.readString(), parcel.readString(), parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 4: // '\004'
                parcel.enforceInterface("android.app.INotificationManager");
                String s = parcel.readString();
                String s1 = parcel.readString();
                int k = parcel.readInt();
                Notification notification;
                if (parcel.readInt() != 0)
                    notification = (Notification)Notification.CREATOR.createFromParcel(parcel);
                else
                    notification = null;
                int ai[] = parcel.createIntArray();
                enqueueNotificationWithTag(s, s1, k, notification, ai, parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeIntArray(ai);
                return true;

            case 3: // '\003'
                parcel.enforceInterface("android.app.INotificationManager");
                cancelToast(parcel.readString(), ITransientNotification.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                return true;

            case 2: // '\002'
                parcel.enforceInterface("android.app.INotificationManager");
                enqueueToast(parcel.readString(), ITransientNotification.Stub.asInterface(parcel.readStrongBinder()), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.app.INotificationManager");
                cancelAllNotifications(parcel.readString(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 1598968902: 
                parcel1.writeString("android.app.INotificationManager");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.app.INotificationManager");
        }
    }

    private static class Stub.Proxy
        implements INotificationManager
    {

        private IBinder mRemote;

        public boolean areNotificationsEnabledForPackage(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.app.INotificationManager");
            parcel.writeString(s);
            mRemote.transact(7, parcel, parcel1, 0);
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

        public IBinder asBinder()
        {
            return mRemote;
        }

        public void cancelAllNotifications(String s, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.INotificationManager");
            parcel.writeString(s);
            parcel.writeInt(i);
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

        public void cancelNotificationWithTag(String s, String s1, int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.INotificationManager");
            parcel.writeString(s);
            parcel.writeString(s1);
            parcel.writeInt(i);
            parcel.writeInt(j);
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

        public void cancelToast(String s, ITransientNotification itransientnotification)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.INotificationManager");
            parcel.writeString(s);
            if (itransientnotification == null)
                break MISSING_BLOCK_LABEL_68;
            IBinder ibinder = itransientnotification.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(3, parcel, parcel1, 0);
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

        public void enqueueNotificationWithTag(String s, String s1, int i, Notification notification, int ai[], int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.INotificationManager");
            parcel.writeString(s);
            parcel.writeString(s1);
            parcel.writeInt(i);
            if (notification == null)
                break MISSING_BLOCK_LABEL_107;
            parcel.writeInt(1);
            notification.writeToParcel(parcel, 0);
_L1:
            parcel.writeIntArray(ai);
            parcel.writeInt(j);
            mRemote.transact(4, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.readIntArray(ai);
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

        public void enqueueToast(String s, ITransientNotification itransientnotification, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.INotificationManager");
            parcel.writeString(s);
            if (itransientnotification == null)
                break MISSING_BLOCK_LABEL_80;
            IBinder ibinder = itransientnotification.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(i);
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

        public String getInterfaceDescriptor()
        {
            return "android.app.INotificationManager";
        }

        public void setNotificationsEnabledForPackage(String s, boolean flag)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.INotificationManager");
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

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract boolean areNotificationsEnabledForPackage(String s)
        throws RemoteException;

    public abstract void cancelAllNotifications(String s, int i)
        throws RemoteException;

    public abstract void cancelNotificationWithTag(String s, String s1, int i, int j)
        throws RemoteException;

    public abstract void cancelToast(String s, ITransientNotification itransientnotification)
        throws RemoteException;

    public abstract void enqueueNotificationWithTag(String s, String s1, int i, Notification notification, int ai[], int j)
        throws RemoteException;

    public abstract void enqueueToast(String s, ITransientNotification itransientnotification, int i)
        throws RemoteException;

    public abstract void setNotificationsEnabledForPackage(String s, boolean flag)
        throws RemoteException;
}
