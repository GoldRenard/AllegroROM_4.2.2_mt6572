// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.graphics.Bitmap;
import android.os.*;

public interface IThumbnailRetriever
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IThumbnailRetriever
    {

        private static final String DESCRIPTOR = "android.app.IThumbnailRetriever";
        static final int TRANSACTION_getThumbnail = 1;

        public static IThumbnailRetriever asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.app.IThumbnailRetriever");
            if (iinterface != null && (iinterface instanceof IThumbnailRetriever))
                return (IThumbnailRetriever)iinterface;
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
                parcel.enforceInterface("android.app.IThumbnailRetriever");
                Bitmap bitmap = getThumbnail(parcel.readInt());
                parcel1.writeNoException();
                if (bitmap != null)
                {
                    parcel1.writeInt(1);
                    bitmap.writeToParcel(parcel1, 1);
                    return true;
                } else
                {
                    parcel1.writeInt(0);
                    return true;
                }

            case 1598968902: 
                parcel1.writeString("android.app.IThumbnailRetriever");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.app.IThumbnailRetriever");
        }
    }

    private static class Stub.Proxy
        implements IThumbnailRetriever
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public String getInterfaceDescriptor()
        {
            return "android.app.IThumbnailRetriever";
        }

        public Bitmap getThumbnail(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IThumbnailRetriever");
            parcel.writeInt(i);
            mRemote.transact(1, parcel, parcel1, 0);
            parcel1.readException();
            if (parcel1.readInt() == 0) goto _L2; else goto _L1
_L1:
            Bitmap bitmap = (Bitmap)Bitmap.CREATOR.createFromParcel(parcel1);
_L4:
            parcel1.recycle();
            parcel.recycle();
            return bitmap;
_L2:
            bitmap = null;
            if (true) goto _L4; else goto _L3
_L3:
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


    public abstract Bitmap getThumbnail(int i)
        throws RemoteException;
}
