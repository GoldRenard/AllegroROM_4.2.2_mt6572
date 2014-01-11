// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.os.*;

public interface IWallpaperManagerCallback
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IWallpaperManagerCallback
    {

        private static final String DESCRIPTOR = "android.app.IWallpaperManagerCallback";
        static final int TRANSACTION_onWallpaperChanged = 1;

        public static IWallpaperManagerCallback asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.app.IWallpaperManagerCallback");
            if (iinterface != null && (iinterface instanceof IWallpaperManagerCallback))
                return (IWallpaperManagerCallback)iinterface;
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
                parcel.enforceInterface("android.app.IWallpaperManagerCallback");
                onWallpaperChanged();
                return true;

            case 1598968902: 
                parcel1.writeString("android.app.IWallpaperManagerCallback");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.app.IWallpaperManagerCallback");
        }
    }

    private static class Stub.Proxy
        implements IWallpaperManagerCallback
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public String getInterfaceDescriptor()
        {
            return "android.app.IWallpaperManagerCallback";
        }

        public void onWallpaperChanged()
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IWallpaperManagerCallback");
            mRemote.transact(1, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract void onWallpaperChanged()
        throws RemoteException;
}
