// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.*;

// Referenced classes of package android.view:
//            DragEvent

public interface IWindow
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IWindow
    {

        private static final String DESCRIPTOR = "android.view.IWindow";
        static final int TRANSACTION_closeSystemDialogs = 8;
        static final int TRANSACTION_dispatchAppVisibility = 4;
        static final int TRANSACTION_dispatchDragEvent = 11;
        static final int TRANSACTION_dispatchGetNewSurface = 5;
        static final int TRANSACTION_dispatchPositionChanged = 15;
        static final int TRANSACTION_dispatchScreenState = 6;
        static final int TRANSACTION_dispatchSystemUiVisibilityChanged = 12;
        static final int TRANSACTION_dispatchWallpaperCommand = 10;
        static final int TRANSACTION_dispatchWallpaperOffsets = 9;
        static final int TRANSACTION_doneAnimating = 13;
        static final int TRANSACTION_dumpInputDispatchingStatus = 16;
        static final int TRANSACTION_enableLog = 14;
        static final int TRANSACTION_executeCommand = 1;
        static final int TRANSACTION_moved = 3;
        static final int TRANSACTION_resized = 2;
        static final int TRANSACTION_windowFocusChanged = 7;

        public static IWindow asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.view.IWindow");
            if (iinterface != null && (iinterface instanceof IWindow))
                return (IWindow)iinterface;
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
            case 16: // '\020'
                parcel.enforceInterface("android.view.IWindow");
                dumpInputDispatchingStatus();
                return true;

            case 15: // '\017'
                parcel.enforceInterface("android.view.IWindow");
                dispatchPositionChanged(parcel.readInt(), parcel.readInt());
                return true;

            case 14: // '\016'
                parcel.enforceInterface("android.view.IWindow");
                boolean flag7;
                if (parcel.readInt() != 0)
                    flag7 = true;
                else
                    flag7 = false;
                enableLog(flag7);
                return true;

            case 13: // '\r'
                parcel.enforceInterface("android.view.IWindow");
                doneAnimating();
                return true;

            case 12: // '\f'
                parcel.enforceInterface("android.view.IWindow");
                dispatchSystemUiVisibilityChanged(parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt());
                return true;

            case 11: // '\013'
                parcel.enforceInterface("android.view.IWindow");
                DragEvent dragevent;
                if (parcel.readInt() != 0)
                    dragevent = (DragEvent)DragEvent.CREATOR.createFromParcel(parcel);
                else
                    dragevent = null;
                dispatchDragEvent(dragevent);
                return true;

            case 10: // '\n'
                parcel.enforceInterface("android.view.IWindow");
                String s2 = parcel.readString();
                int k = parcel.readInt();
                int l = parcel.readInt();
                int i1 = parcel.readInt();
                Bundle bundle;
                if (parcel.readInt() != 0)
                    bundle = (Bundle)Bundle.CREATOR.createFromParcel(parcel);
                else
                    bundle = null;
                boolean flag6;
                if (parcel.readInt() != 0)
                    flag6 = true;
                else
                    flag6 = false;
                dispatchWallpaperCommand(s2, k, l, i1, bundle, flag6);
                return true;

            case 9: // '\t'
                parcel.enforceInterface("android.view.IWindow");
                float f = parcel.readFloat();
                float f1 = parcel.readFloat();
                float f2 = parcel.readFloat();
                float f3 = parcel.readFloat();
                boolean flag5;
                if (parcel.readInt() != 0)
                    flag5 = true;
                else
                    flag5 = false;
                dispatchWallpaperOffsets(f, f1, f2, f3, flag5);
                return true;

            case 8: // '\b'
                parcel.enforceInterface("android.view.IWindow");
                closeSystemDialogs(parcel.readString());
                return true;

            case 7: // '\007'
                parcel.enforceInterface("android.view.IWindow");
                boolean flag3;
                if (parcel.readInt() != 0)
                    flag3 = true;
                else
                    flag3 = false;
                boolean flag4;
                if (parcel.readInt() != 0)
                    flag4 = true;
                else
                    flag4 = false;
                windowFocusChanged(flag3, flag4);
                return true;

            case 6: // '\006'
                parcel.enforceInterface("android.view.IWindow");
                boolean flag2;
                if (parcel.readInt() != 0)
                    flag2 = true;
                else
                    flag2 = false;
                dispatchScreenState(flag2);
                return true;

            case 5: // '\005'
                parcel.enforceInterface("android.view.IWindow");
                dispatchGetNewSurface();
                return true;

            case 4: // '\004'
                parcel.enforceInterface("android.view.IWindow");
                boolean flag1;
                if (parcel.readInt() != 0)
                    flag1 = true;
                else
                    flag1 = false;
                dispatchAppVisibility(flag1);
                return true;

            case 3: // '\003'
                parcel.enforceInterface("android.view.IWindow");
                moved(parcel.readInt(), parcel.readInt());
                return true;

            case 2: // '\002'
                parcel.enforceInterface("android.view.IWindow");
                Rect rect;
                if (parcel.readInt() != 0)
                    rect = (Rect)Rect.CREATOR.createFromParcel(parcel);
                else
                    rect = null;
                Rect rect1;
                if (parcel.readInt() != 0)
                    rect1 = (Rect)Rect.CREATOR.createFromParcel(parcel);
                else
                    rect1 = null;
                Rect rect2;
                if (parcel.readInt() != 0)
                    rect2 = (Rect)Rect.CREATOR.createFromParcel(parcel);
                else
                    rect2 = null;
                boolean flag;
                if (parcel.readInt() != 0)
                    flag = true;
                else
                    flag = false;
                Configuration configuration;
                if (parcel.readInt() != 0)
                    configuration = (Configuration)Configuration.CREATOR.createFromParcel(parcel);
                else
                    configuration = null;
                resized(rect, rect1, rect2, flag, configuration);
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.view.IWindow");
                String s = parcel.readString();
                String s1 = parcel.readString();
                ParcelFileDescriptor parcelfiledescriptor;
                if (parcel.readInt() != 0)
                    parcelfiledescriptor = (ParcelFileDescriptor)ParcelFileDescriptor.CREATOR.createFromParcel(parcel);
                else
                    parcelfiledescriptor = null;
                executeCommand(s, s1, parcelfiledescriptor);
                return true;

            case 1598968902: 
                parcel1.writeString("android.view.IWindow");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.view.IWindow");
        }
    }

    private static class Stub.Proxy
        implements IWindow
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public void closeSystemDialogs(String s)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindow");
            parcel.writeString(s);
            mRemote.transact(8, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void dispatchAppVisibility(boolean flag)
            throws RemoteException
        {
            int i;
            Parcel parcel;
            i = 1;
            parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindow");
            if (!flag)
                i = 0;
            parcel.writeInt(i);
            mRemote.transact(4, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void dispatchDragEvent(DragEvent dragevent)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindow");
            if (dragevent == null)
                break MISSING_BLOCK_LABEL_45;
            parcel.writeInt(1);
            dragevent.writeToParcel(parcel, 0);
_L1:
            mRemote.transact(11, parcel, null, 1);
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void dispatchGetNewSurface()
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindow");
            mRemote.transact(5, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void dispatchPositionChanged(int i, int j)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindow");
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(15, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void dispatchScreenState(boolean flag)
            throws RemoteException
        {
            int i;
            Parcel parcel;
            i = 1;
            parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindow");
            if (!flag)
                i = 0;
            parcel.writeInt(i);
            mRemote.transact(6, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void dispatchSystemUiVisibilityChanged(int i, int j, int k, int l)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindow");
            parcel.writeInt(i);
            parcel.writeInt(j);
            parcel.writeInt(k);
            parcel.writeInt(l);
            mRemote.transact(12, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void dispatchWallpaperCommand(String s, int i, int j, int k, Bundle bundle, boolean flag)
            throws RemoteException
        {
            int l;
            Parcel parcel;
            l = 1;
            parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindow");
            parcel.writeString(s);
            parcel.writeInt(i);
            parcel.writeInt(j);
            parcel.writeInt(k);
            if (bundle == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            bundle.writeToParcel(parcel, 0);
              goto _L3
_L5:
            parcel.writeInt(l);
            mRemote.transact(10, parcel, null, 1);
            parcel.recycle();
            return;
_L2:
            parcel.writeInt(0);
            break; /* Loop/switch isn't completed */
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
_L6:
            l = 0;
            if (true) goto _L4; else goto _L3
_L4:
            break; /* Loop/switch isn't completed */
_L3:
            if (!flag) goto _L6; else goto _L5
        }

        public void dispatchWallpaperOffsets(float f, float f1, float f2, float f3, boolean flag)
            throws RemoteException
        {
            int i;
            Parcel parcel;
            i = 1;
            parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindow");
            parcel.writeFloat(f);
            parcel.writeFloat(f1);
            parcel.writeFloat(f2);
            parcel.writeFloat(f3);
            if (!flag)
                i = 0;
            parcel.writeInt(i);
            mRemote.transact(9, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void doneAnimating()
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindow");
            mRemote.transact(13, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void dumpInputDispatchingStatus()
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindow");
            mRemote.transact(16, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void enableLog(boolean flag)
            throws RemoteException
        {
            int i;
            Parcel parcel;
            i = 1;
            parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindow");
            if (!flag)
                i = 0;
            parcel.writeInt(i);
            mRemote.transact(14, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void executeCommand(String s, String s1, ParcelFileDescriptor parcelfiledescriptor)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindow");
            parcel.writeString(s);
            parcel.writeString(s1);
            if (parcelfiledescriptor == null)
                break MISSING_BLOCK_LABEL_62;
            parcel.writeInt(1);
            parcelfiledescriptor.writeToParcel(parcel, 0);
_L1:
            mRemote.transact(1, parcel, null, 1);
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public String getInterfaceDescriptor()
        {
            return "android.view.IWindow";
        }

        public void moved(int i, int j)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindow");
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(3, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void resized(Rect rect, Rect rect1, Rect rect2, boolean flag, Configuration configuration)
            throws RemoteException
        {
            int i;
            Parcel parcel;
            i = 1;
            parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindow");
            if (rect == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            rect.writeToParcel(parcel, 0);
_L10:
            if (rect1 == null) goto _L4; else goto _L3
_L3:
            parcel.writeInt(1);
            rect1.writeToParcel(parcel, 0);
_L11:
            if (rect2 == null) goto _L6; else goto _L5
_L5:
            parcel.writeInt(1);
            rect2.writeToParcel(parcel, 0);
              goto _L7
_L13:
            parcel.writeInt(i);
            if (configuration == null) goto _L9; else goto _L8
_L8:
            parcel.writeInt(1);
            configuration.writeToParcel(parcel, 0);
_L12:
            mRemote.transact(2, parcel, null, 1);
            parcel.recycle();
            return;
_L2:
            parcel.writeInt(0);
              goto _L10
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
_L4:
            parcel.writeInt(0);
              goto _L11
_L6:
            parcel.writeInt(0);
              goto _L7
_L9:
            parcel.writeInt(0);
              goto _L12
_L7:
            if (!flag) goto _L14; else goto _L13
_L14:
            i = 0;
              goto _L13
        }

        public void windowFocusChanged(boolean flag, boolean flag1)
            throws RemoteException
        {
            int i;
            Parcel parcel;
            i = 1;
            parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindow");
            int j;
            if (flag)
                j = i;
            else
                j = 0;
            parcel.writeInt(j);
            if (!flag1)
                i = 0;
            parcel.writeInt(i);
            mRemote.transact(7, parcel, null, 1);
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


    public abstract void closeSystemDialogs(String s)
        throws RemoteException;

    public abstract void dispatchAppVisibility(boolean flag)
        throws RemoteException;

    public abstract void dispatchDragEvent(DragEvent dragevent)
        throws RemoteException;

    public abstract void dispatchGetNewSurface()
        throws RemoteException;

    public abstract void dispatchPositionChanged(int i, int j)
        throws RemoteException;

    public abstract void dispatchScreenState(boolean flag)
        throws RemoteException;

    public abstract void dispatchSystemUiVisibilityChanged(int i, int j, int k, int l)
        throws RemoteException;

    public abstract void dispatchWallpaperCommand(String s, int i, int j, int k, Bundle bundle, boolean flag)
        throws RemoteException;

    public abstract void dispatchWallpaperOffsets(float f, float f1, float f2, float f3, boolean flag)
        throws RemoteException;

    public abstract void doneAnimating()
        throws RemoteException;

    public abstract void dumpInputDispatchingStatus()
        throws RemoteException;

    public abstract void enableLog(boolean flag)
        throws RemoteException;

    public abstract void executeCommand(String s, String s1, ParcelFileDescriptor parcelfiledescriptor)
        throws RemoteException;

    public abstract void moved(int i, int j)
        throws RemoteException;

    public abstract void resized(Rect rect, Rect rect1, Rect rect2, boolean flag, Configuration configuration)
        throws RemoteException;

    public abstract void windowFocusChanged(boolean flag, boolean flag1)
        throws RemoteException;
}
