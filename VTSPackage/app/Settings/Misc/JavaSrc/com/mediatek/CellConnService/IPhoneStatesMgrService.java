// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.CellConnService;

import android.os.*;

// Referenced classes of package com.mediatek.CellConnService:
//            IPhoneStatesCallback

public interface IPhoneStatesMgrService
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IPhoneStatesMgrService
    {

        private static final String DESCRIPTOR = "com.mediatek.CellConnService.IPhoneStatesMgrService";
        static final int TRANSACTION_verifyPhoneState = 1;

        public static IPhoneStatesMgrService asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("com.mediatek.CellConnService.IPhoneStatesMgrService");
            if (iinterface != null && (iinterface instanceof IPhoneStatesMgrService))
                return (IPhoneStatesMgrService)iinterface;
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
                parcel.enforceInterface("com.mediatek.CellConnService.IPhoneStatesMgrService");
                int k = verifyPhoneState(parcel.readInt(), parcel.readInt(), IPhoneStatesCallback.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                parcel1.writeInt(k);
                return true;

            case 1598968902: 
                parcel1.writeString("com.mediatek.CellConnService.IPhoneStatesMgrService");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "com.mediatek.CellConnService.IPhoneStatesMgrService");
        }
    }

    private static class Stub.Proxy
        implements IPhoneStatesMgrService
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public String getInterfaceDescriptor()
        {
            return "com.mediatek.CellConnService.IPhoneStatesMgrService";
        }

        public int verifyPhoneState(int i, int j, IPhoneStatesCallback iphonestatescallback)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("com.mediatek.CellConnService.IPhoneStatesMgrService");
            parcel.writeInt(i);
            parcel.writeInt(j);
            if (iphonestatescallback == null)
                break MISSING_BLOCK_LABEL_89;
            IBinder ibinder = iphonestatescallback.asBinder();
_L1:
            int k;
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(1, parcel, parcel1, 0);
            parcel1.readException();
            k = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return k;
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


    public abstract int verifyPhoneState(int i, int j, IPhoneStatesCallback iphonestatescallback)
        throws RemoteException;
}
