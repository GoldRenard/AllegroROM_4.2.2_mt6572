// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.graphics.Rect;
import android.os.*;

// Referenced classes of package android.view:
//            WindowInfo

public interface IDisplayContentChangeListener
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IDisplayContentChangeListener
    {

        private static final String DESCRIPTOR = "android.view.IDisplayContentChangeListener";
        static final int TRANSACTION_onRectangleOnScreenRequested = 2;
        static final int TRANSACTION_onRotationChanged = 4;
        static final int TRANSACTION_onWindowLayersChanged = 3;
        static final int TRANSACTION_onWindowTransition = 1;

        public static IDisplayContentChangeListener asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.view.IDisplayContentChangeListener");
            if (iinterface != null && (iinterface instanceof IDisplayContentChangeListener))
                return (IDisplayContentChangeListener)iinterface;
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
            case 4: // '\004'
                parcel.enforceInterface("android.view.IDisplayContentChangeListener");
                onRotationChanged(parcel.readInt());
                return true;

            case 3: // '\003'
                parcel.enforceInterface("android.view.IDisplayContentChangeListener");
                onWindowLayersChanged(parcel.readInt());
                return true;

            case 2: // '\002'
                parcel.enforceInterface("android.view.IDisplayContentChangeListener");
                int i1 = parcel.readInt();
                Rect rect;
                if (parcel.readInt() != 0)
                    rect = (Rect)Rect.CREATOR.createFromParcel(parcel);
                else
                    rect = null;
                boolean flag;
                if (parcel.readInt() != 0)
                    flag = true;
                else
                    flag = false;
                onRectangleOnScreenRequested(i1, rect, flag);
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.view.IDisplayContentChangeListener");
                int k = parcel.readInt();
                int l = parcel.readInt();
                WindowInfo windowinfo;
                if (parcel.readInt() != 0)
                    windowinfo = (WindowInfo)WindowInfo.CREATOR.createFromParcel(parcel);
                else
                    windowinfo = null;
                onWindowTransition(k, l, windowinfo);
                return true;

            case 1598968902: 
                parcel1.writeString("android.view.IDisplayContentChangeListener");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.view.IDisplayContentChangeListener");
        }
    }

    private static class Stub.Proxy
        implements IDisplayContentChangeListener
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public String getInterfaceDescriptor()
        {
            return "android.view.IDisplayContentChangeListener";
        }

        public void onRectangleOnScreenRequested(int i, Rect rect, boolean flag)
            throws RemoteException
        {
            int j;
            Parcel parcel;
            j = 1;
            parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IDisplayContentChangeListener");
            parcel.writeInt(i);
            if (rect == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            rect.writeToParcel(parcel, 0);
              goto _L3
_L5:
            parcel.writeInt(j);
            mRemote.transact(2, parcel, null, 1);
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
            j = 0;
            if (true) goto _L4; else goto _L3
_L4:
            break; /* Loop/switch isn't completed */
_L3:
            if (!flag) goto _L6; else goto _L5
        }

        public void onRotationChanged(int i)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IDisplayContentChangeListener");
            parcel.writeInt(i);
            mRemote.transact(4, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void onWindowLayersChanged(int i)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IDisplayContentChangeListener");
            parcel.writeInt(i);
            mRemote.transact(3, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void onWindowTransition(int i, int j, WindowInfo windowinfo)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IDisplayContentChangeListener");
            parcel.writeInt(i);
            parcel.writeInt(j);
            if (windowinfo == null)
                break MISSING_BLOCK_LABEL_62;
            parcel.writeInt(1);
            windowinfo.writeToParcel(parcel, 0);
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

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract void onRectangleOnScreenRequested(int i, Rect rect, boolean flag)
        throws RemoteException;

    public abstract void onRotationChanged(int i)
        throws RemoteException;

    public abstract void onWindowLayersChanged(int i)
        throws RemoteException;

    public abstract void onWindowTransition(int i, int j, WindowInfo windowinfo)
        throws RemoteException;
}
