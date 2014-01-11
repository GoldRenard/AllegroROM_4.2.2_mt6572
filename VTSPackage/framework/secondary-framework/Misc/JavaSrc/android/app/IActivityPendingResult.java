// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.os.*;

public interface IActivityPendingResult
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IActivityPendingResult
    {

        private static final String DESCRIPTOR = "android.app.IActivityPendingResult";
        static final int TRANSACTION_sendResult = 1;

        public static IActivityPendingResult asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.app.IActivityPendingResult");
            if (iinterface != null && (iinterface instanceof IActivityPendingResult))
                return (IActivityPendingResult)iinterface;
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
            case 1: // '\001'
                parcel.enforceInterface("android.app.IActivityPendingResult");
                int k = parcel.readInt();
                String s = parcel.readString();
                Bundle bundle;
                if (parcel.readInt() != 0)
                    bundle = (Bundle)Bundle.CREATOR.createFromParcel(parcel);
                else
                    bundle = null;
                boolean flag = sendResult(k, s, bundle);
                parcel1.writeNoException();
                int l;
                if (flag)
                    l = 1;
                else
                    l = 0;
                parcel1.writeInt(l);
                return true;

            case 1598968902: 
                parcel1.writeString("android.app.IActivityPendingResult");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.app.IActivityPendingResult");
        }
    }

    private static class Stub.Proxy
        implements IActivityPendingResult
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public String getInterfaceDescriptor()
        {
            return "android.app.IActivityPendingResult";
        }

        public boolean sendResult(int i, String s, Bundle bundle)
            throws RemoteException
        {
            boolean flag;
            Parcel parcel;
            Parcel parcel1;
            flag = true;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IActivityPendingResult");
            parcel.writeInt(i);
            parcel.writeString(s);
            if (bundle == null)
                break MISSING_BLOCK_LABEL_95;
            parcel.writeInt(1);
            bundle.writeToParcel(parcel, 0);
_L1:
            int j;
            mRemote.transact(1, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            Exception exception;
            if (j == 0)
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

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract boolean sendResult(int i, String s, Bundle bundle)
        throws RemoteException;
}
