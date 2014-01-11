// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.ComponentName;
import android.os.*;

// Referenced classes of package android.app:
//            IWallpaperManagerCallback, WallpaperInfo

public interface IWallpaperManager
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IWallpaperManager
    {

        private static final String DESCRIPTOR = "android.app.IWallpaperManager";
        static final int TRANSACTION_clearWallpaper = 5;
        static final int TRANSACTION_getHeightHint = 9;
        static final int TRANSACTION_getWallpaper = 3;
        static final int TRANSACTION_getWallpaperInfo = 4;
        static final int TRANSACTION_getWidthHint = 8;
        static final int TRANSACTION_hasNamedWallpaper = 6;
        static final int TRANSACTION_setDimensionHints = 7;
        static final int TRANSACTION_setWallpaper = 1;
        static final int TRANSACTION_setWallpaperComponent = 2;

        public static IWallpaperManager asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.app.IWallpaperManager");
            if (iinterface != null && (iinterface instanceof IWallpaperManager))
                return (IWallpaperManager)iinterface;
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
            case 9: // '\t'
                parcel.enforceInterface("android.app.IWallpaperManager");
                int i1 = getHeightHint();
                parcel1.writeNoException();
                parcel1.writeInt(i1);
                return true;

            case 8: // '\b'
                parcel.enforceInterface("android.app.IWallpaperManager");
                int l = getWidthHint();
                parcel1.writeNoException();
                parcel1.writeInt(l);
                return true;

            case 7: // '\007'
                parcel.enforceInterface("android.app.IWallpaperManager");
                setDimensionHints(parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 6: // '\006'
                parcel.enforceInterface("android.app.IWallpaperManager");
                boolean flag = hasNamedWallpaper(parcel.readString());
                parcel1.writeNoException();
                int k = 0;
                if (flag)
                    k = 1;
                parcel1.writeInt(k);
                return true;

            case 5: // '\005'
                parcel.enforceInterface("android.app.IWallpaperManager");
                clearWallpaper();
                parcel1.writeNoException();
                return true;

            case 4: // '\004'
                parcel.enforceInterface("android.app.IWallpaperManager");
                WallpaperInfo wallpaperinfo = getWallpaperInfo();
                parcel1.writeNoException();
                if (wallpaperinfo != null)
                {
                    parcel1.writeInt(1);
                    wallpaperinfo.writeToParcel(parcel1, 1);
                    return true;
                } else
                {
                    parcel1.writeInt(0);
                    return true;
                }

            case 3: // '\003'
                parcel.enforceInterface("android.app.IWallpaperManager");
                IWallpaperManagerCallback iwallpapermanagercallback = IWallpaperManagerCallback.Stub.asInterface(parcel.readStrongBinder());
                Bundle bundle = new Bundle();
                ParcelFileDescriptor parcelfiledescriptor1 = getWallpaper(iwallpapermanagercallback, bundle);
                parcel1.writeNoException();
                if (parcelfiledescriptor1 != null)
                {
                    parcel1.writeInt(1);
                    parcelfiledescriptor1.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                if (bundle != null)
                {
                    parcel1.writeInt(1);
                    bundle.writeToParcel(parcel1, 1);
                    return true;
                } else
                {
                    parcel1.writeInt(0);
                    return true;
                }

            case 2: // '\002'
                parcel.enforceInterface("android.app.IWallpaperManager");
                ComponentName componentname;
                if (parcel.readInt() != 0)
                    componentname = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname = null;
                setWallpaperComponent(componentname);
                parcel1.writeNoException();
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.app.IWallpaperManager");
                ParcelFileDescriptor parcelfiledescriptor = setWallpaper(parcel.readString());
                parcel1.writeNoException();
                if (parcelfiledescriptor != null)
                {
                    parcel1.writeInt(1);
                    parcelfiledescriptor.writeToParcel(parcel1, 1);
                    return true;
                } else
                {
                    parcel1.writeInt(0);
                    return true;
                }

            case 1598968902: 
                parcel1.writeString("android.app.IWallpaperManager");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.app.IWallpaperManager");
        }
    }

    private static class Stub.Proxy
        implements IWallpaperManager
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public void clearWallpaper()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IWallpaperManager");
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

        public int getHeightHint()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.app.IWallpaperManager");
            mRemote.transact(9, parcel, parcel1, 0);
            parcel1.readException();
            i = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return i;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public String getInterfaceDescriptor()
        {
            return "android.app.IWallpaperManager";
        }

        public ParcelFileDescriptor getWallpaper(IWallpaperManagerCallback iwallpapermanagercallback, Bundle bundle)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IWallpaperManager");
            if (iwallpapermanagercallback == null) goto _L2; else goto _L1
_L1:
            IBinder ibinder = iwallpapermanagercallback.asBinder();
_L5:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(3, parcel, parcel1, 0);
            parcel1.readException();
            if (parcel1.readInt() == 0) goto _L4; else goto _L3
_L3:
            ParcelFileDescriptor parcelfiledescriptor = (ParcelFileDescriptor)ParcelFileDescriptor.CREATOR.createFromParcel(parcel1);
_L6:
            if (parcel1.readInt() != 0)
                bundle.readFromParcel(parcel1);
            parcel1.recycle();
            parcel.recycle();
            return parcelfiledescriptor;
_L2:
            ibinder = null;
              goto _L5
_L4:
            parcelfiledescriptor = null;
              goto _L6
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
              goto _L5
        }

        public WallpaperInfo getWallpaperInfo()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IWallpaperManager");
            mRemote.transact(4, parcel, parcel1, 0);
            parcel1.readException();
            if (parcel1.readInt() == 0) goto _L2; else goto _L1
_L1:
            WallpaperInfo wallpaperinfo = (WallpaperInfo)WallpaperInfo.CREATOR.createFromParcel(parcel1);
_L4:
            parcel1.recycle();
            parcel.recycle();
            return wallpaperinfo;
_L2:
            wallpaperinfo = null;
            if (true) goto _L4; else goto _L3
_L3:
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int getWidthHint()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.app.IWallpaperManager");
            mRemote.transact(8, parcel, parcel1, 0);
            parcel1.readException();
            i = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return i;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public boolean hasNamedWallpaper(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.app.IWallpaperManager");
            parcel.writeString(s);
            mRemote.transact(6, parcel, parcel1, 0);
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

        public void setDimensionHints(int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IWallpaperManager");
            parcel.writeInt(i);
            parcel.writeInt(j);
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

        public ParcelFileDescriptor setWallpaper(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IWallpaperManager");
            parcel.writeString(s);
            mRemote.transact(1, parcel, parcel1, 0);
            parcel1.readException();
            if (parcel1.readInt() == 0) goto _L2; else goto _L1
_L1:
            ParcelFileDescriptor parcelfiledescriptor = (ParcelFileDescriptor)ParcelFileDescriptor.CREATOR.createFromParcel(parcel1);
_L4:
            parcel1.recycle();
            parcel.recycle();
            return parcelfiledescriptor;
_L2:
            parcelfiledescriptor = null;
            if (true) goto _L4; else goto _L3
_L3:
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void setWallpaperComponent(ComponentName componentname)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IWallpaperManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_56;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
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

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract void clearWallpaper()
        throws RemoteException;

    public abstract int getHeightHint()
        throws RemoteException;

    public abstract ParcelFileDescriptor getWallpaper(IWallpaperManagerCallback iwallpapermanagercallback, Bundle bundle)
        throws RemoteException;

    public abstract WallpaperInfo getWallpaperInfo()
        throws RemoteException;

    public abstract int getWidthHint()
        throws RemoteException;

    public abstract boolean hasNamedWallpaper(String s)
        throws RemoteException;

    public abstract void setDimensionHints(int i, int j)
        throws RemoteException;

    public abstract ParcelFileDescriptor setWallpaper(String s)
        throws RemoteException;

    public abstract void setWallpaperComponent(ComponentName componentname)
        throws RemoteException;
}
