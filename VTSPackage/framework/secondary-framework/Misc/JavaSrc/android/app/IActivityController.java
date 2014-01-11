// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.Intent;
import android.os.*;

public interface IActivityController
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IActivityController
    {

        private static final String DESCRIPTOR = "android.app.IActivityController";
        static final int TRANSACTION_activityResuming = 2;
        static final int TRANSACTION_activityStarting = 1;
        static final int TRANSACTION_appCrashed = 3;
        static final int TRANSACTION_appEarlyNotResponding = 4;
        static final int TRANSACTION_appNotResponding = 5;

        public static IActivityController asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.app.IActivityController");
            if (iinterface != null && (iinterface instanceof IActivityController))
                return (IActivityController)iinterface;
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
            case 5: // '\005'
                parcel.enforceInterface("android.app.IActivityController");
                int k1 = appNotResponding(parcel.readString(), parcel.readInt(), parcel.readString());
                parcel1.writeNoException();
                parcel1.writeInt(k1);
                return true;

            case 4: // '\004'
                parcel.enforceInterface("android.app.IActivityController");
                int j1 = appEarlyNotResponding(parcel.readString(), parcel.readInt(), parcel.readString());
                parcel1.writeNoException();
                parcel1.writeInt(j1);
                return true;

            case 3: // '\003'
                parcel.enforceInterface("android.app.IActivityController");
                boolean flag2 = appCrashed(parcel.readString(), parcel.readInt(), parcel.readString(), parcel.readString(), parcel.readLong(), parcel.readString());
                parcel1.writeNoException();
                int i1 = 0;
                if (flag2)
                    i1 = 1;
                parcel1.writeInt(i1);
                return true;

            case 2: // '\002'
                parcel.enforceInterface("android.app.IActivityController");
                boolean flag1 = activityResuming(parcel.readString());
                parcel1.writeNoException();
                int l = 0;
                if (flag1)
                    l = 1;
                parcel1.writeInt(l);
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.app.IActivityController");
                Intent intent;
                if (parcel.readInt() != 0)
                    intent = (Intent)Intent.CREATOR.createFromParcel(parcel);
                else
                    intent = null;
                boolean flag = activityStarting(intent, parcel.readString());
                parcel1.writeNoException();
                int k;
                if (flag)
                    k = 1;
                else
                    k = 0;
                parcel1.writeInt(k);
                return true;

            case 1598968902: 
                parcel1.writeString("android.app.IActivityController");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.app.IActivityController");
        }
    }

    private static class Stub.Proxy
        implements IActivityController
    {

        private IBinder mRemote;

        public boolean activityResuming(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.app.IActivityController");
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

        public boolean activityStarting(Intent intent, String s)
            throws RemoteException
        {
            boolean flag;
            Parcel parcel;
            Parcel parcel1;
            flag = true;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IActivityController");
            if (intent == null)
                break MISSING_BLOCK_LABEL_87;
            parcel.writeInt(1);
            intent.writeToParcel(parcel, 0);
_L1:
            int i;
            parcel.writeString(s);
            mRemote.transact(1, parcel, parcel1, 0);
            parcel1.readException();
            i = parcel1.readInt();
            Exception exception;
            if (i == 0)
                flag = false;
            parcel1.recycle();
            parcel.recycle();
            return flag;
            parcel.writeInt(0);
              goto _L1
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public boolean appCrashed(String s, int i, String s1, String s2, long l, String s3)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int j;
            parcel.writeInterfaceToken("android.app.IActivityController");
            parcel.writeString(s);
            parcel.writeInt(i);
            parcel.writeString(s1);
            parcel.writeString(s2);
            parcel.writeLong(l);
            parcel.writeString(s3);
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

        public int appEarlyNotResponding(String s, int i, String s1)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int j;
            parcel.writeInterfaceToken("android.app.IActivityController");
            parcel.writeString(s);
            parcel.writeInt(i);
            parcel.writeString(s1);
            mRemote.transact(4, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return j;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int appNotResponding(String s, int i, String s1)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int j;
            parcel.writeInterfaceToken("android.app.IActivityController");
            parcel.writeString(s);
            parcel.writeInt(i);
            parcel.writeString(s1);
            mRemote.transact(5, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return j;
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

        public String getInterfaceDescriptor()
        {
            return "android.app.IActivityController";
        }

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract boolean activityResuming(String s)
        throws RemoteException;

    public abstract boolean activityStarting(Intent intent, String s)
        throws RemoteException;

    public abstract boolean appCrashed(String s, int i, String s1, String s2, long l, String s3)
        throws RemoteException;

    public abstract int appEarlyNotResponding(String s, int i, String s1)
        throws RemoteException;

    public abstract int appNotResponding(String s, int i, String s1)
        throws RemoteException;
}
