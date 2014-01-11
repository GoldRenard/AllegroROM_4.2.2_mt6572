// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.accessibility;

import android.os.*;

// Referenced classes of package android.view.accessibility:
//            IAccessibilityInteractionConnectionCallback

public interface IAccessibilityInteractionConnection
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IAccessibilityInteractionConnection
    {

        private static final String DESCRIPTOR = "android.view.accessibility.IAccessibilityInteractionConnection";
        static final int TRANSACTION_findAccessibilityNodeInfoByAccessibilityId = 1;
        static final int TRANSACTION_findAccessibilityNodeInfoByViewId = 2;
        static final int TRANSACTION_findAccessibilityNodeInfosByText = 3;
        static final int TRANSACTION_findFocus = 4;
        static final int TRANSACTION_focusSearch = 5;
        static final int TRANSACTION_performAccessibilityAction = 6;

        public static IAccessibilityInteractionConnection asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.view.accessibility.IAccessibilityInteractionConnection");
            if (iinterface != null && (iinterface instanceof IAccessibilityInteractionConnection))
                return (IAccessibilityInteractionConnection)iinterface;
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
            case 6: // '\006'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityInteractionConnection");
                long l = parcel.readLong();
                int k = parcel.readInt();
                Bundle bundle;
                if (parcel.readInt() != 0)
                    bundle = (Bundle)Bundle.CREATOR.createFromParcel(parcel);
                else
                    bundle = null;
                int i1 = parcel.readInt();
                IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback = IAccessibilityInteractionConnectionCallback.Stub.asInterface(parcel.readStrongBinder());
                int j1 = parcel.readInt();
                int k1 = parcel.readInt();
                long l1 = parcel.readLong();
                performAccessibilityAction(l, k, bundle, i1, iaccessibilityinteractionconnectioncallback, j1, k1, l1);
                return true;

            case 5: // '\005'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityInteractionConnection");
                focusSearch(parcel.readLong(), parcel.readInt(), parcel.readInt(), IAccessibilityInteractionConnectionCallback.Stub.asInterface(parcel.readStrongBinder()), parcel.readInt(), parcel.readInt(), parcel.readLong());
                return true;

            case 4: // '\004'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityInteractionConnection");
                findFocus(parcel.readLong(), parcel.readInt(), parcel.readInt(), IAccessibilityInteractionConnectionCallback.Stub.asInterface(parcel.readStrongBinder()), parcel.readInt(), parcel.readInt(), parcel.readLong());
                return true;

            case 3: // '\003'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityInteractionConnection");
                findAccessibilityNodeInfosByText(parcel.readLong(), parcel.readString(), parcel.readInt(), IAccessibilityInteractionConnectionCallback.Stub.asInterface(parcel.readStrongBinder()), parcel.readInt(), parcel.readInt(), parcel.readLong());
                return true;

            case 2: // '\002'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityInteractionConnection");
                findAccessibilityNodeInfoByViewId(parcel.readLong(), parcel.readInt(), parcel.readInt(), IAccessibilityInteractionConnectionCallback.Stub.asInterface(parcel.readStrongBinder()), parcel.readInt(), parcel.readInt(), parcel.readLong());
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityInteractionConnection");
                findAccessibilityNodeInfoByAccessibilityId(parcel.readLong(), parcel.readInt(), IAccessibilityInteractionConnectionCallback.Stub.asInterface(parcel.readStrongBinder()), parcel.readInt(), parcel.readInt(), parcel.readLong());
                return true;

            case 1598968902: 
                parcel1.writeString("android.view.accessibility.IAccessibilityInteractionConnection");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.view.accessibility.IAccessibilityInteractionConnection");
        }
    }

    private static class Stub.Proxy
        implements IAccessibilityInteractionConnection
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public void findAccessibilityNodeInfoByAccessibilityId(long l, int i, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int j, int k, long l1)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityInteractionConnection");
            parcel.writeLong(l);
            parcel.writeInt(i);
            IBinder ibinder;
            ibinder = null;
            if (iaccessibilityinteractionconnectioncallback == null)
                break MISSING_BLOCK_LABEL_41;
            ibinder = iaccessibilityinteractionconnectioncallback.asBinder();
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(j);
            parcel.writeInt(k);
            parcel.writeLong(l1);
            mRemote.transact(1, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void findAccessibilityNodeInfoByViewId(long l, int i, int j, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int k, int i1, 
                long l1)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityInteractionConnection");
            parcel.writeLong(l);
            parcel.writeInt(i);
            parcel.writeInt(j);
            IBinder ibinder;
            ibinder = null;
            if (iaccessibilityinteractionconnectioncallback == null)
                break MISSING_BLOCK_LABEL_48;
            ibinder = iaccessibilityinteractionconnectioncallback.asBinder();
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(k);
            parcel.writeInt(i1);
            parcel.writeLong(l1);
            mRemote.transact(2, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void findAccessibilityNodeInfosByText(long l, String s, int i, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int j, int k, 
                long l1)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityInteractionConnection");
            parcel.writeLong(l);
            parcel.writeString(s);
            parcel.writeInt(i);
            IBinder ibinder;
            ibinder = null;
            if (iaccessibilityinteractionconnectioncallback == null)
                break MISSING_BLOCK_LABEL_48;
            ibinder = iaccessibilityinteractionconnectioncallback.asBinder();
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(j);
            parcel.writeInt(k);
            parcel.writeLong(l1);
            mRemote.transact(3, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void findFocus(long l, int i, int j, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int k, int i1, 
                long l1)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityInteractionConnection");
            parcel.writeLong(l);
            parcel.writeInt(i);
            parcel.writeInt(j);
            IBinder ibinder;
            ibinder = null;
            if (iaccessibilityinteractionconnectioncallback == null)
                break MISSING_BLOCK_LABEL_48;
            ibinder = iaccessibilityinteractionconnectioncallback.asBinder();
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(k);
            parcel.writeInt(i1);
            parcel.writeLong(l1);
            mRemote.transact(4, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void focusSearch(long l, int i, int j, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int k, int i1, 
                long l1)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityInteractionConnection");
            parcel.writeLong(l);
            parcel.writeInt(i);
            parcel.writeInt(j);
            IBinder ibinder;
            ibinder = null;
            if (iaccessibilityinteractionconnectioncallback == null)
                break MISSING_BLOCK_LABEL_48;
            ibinder = iaccessibilityinteractionconnectioncallback.asBinder();
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(k);
            parcel.writeInt(i1);
            parcel.writeLong(l1);
            mRemote.transact(5, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public String getInterfaceDescriptor()
        {
            return "android.view.accessibility.IAccessibilityInteractionConnection";
        }

        public void performAccessibilityAction(long l, int i, Bundle bundle, int j, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int k, 
                int i1, long l1)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityInteractionConnection");
            parcel.writeLong(l);
            parcel.writeInt(i);
            if (bundle == null)
                break MISSING_BLOCK_LABEL_117;
            parcel.writeInt(1);
            bundle.writeToParcel(parcel, 0);
_L1:
            parcel.writeInt(j);
            IBinder ibinder;
            ibinder = null;
            if (iaccessibilityinteractionconnectioncallback == null)
                break MISSING_BLOCK_LABEL_67;
            ibinder = iaccessibilityinteractionconnectioncallback.asBinder();
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(k);
            parcel.writeInt(i1);
            parcel.writeLong(l1);
            mRemote.transact(6, parcel, null, 1);
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


    public abstract void findAccessibilityNodeInfoByAccessibilityId(long l, int i, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int j, int k, long l1)
        throws RemoteException;

    public abstract void findAccessibilityNodeInfoByViewId(long l, int i, int j, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int k, int i1, 
            long l1)
        throws RemoteException;

    public abstract void findAccessibilityNodeInfosByText(long l, String s, int i, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int j, int k, 
            long l1)
        throws RemoteException;

    public abstract void findFocus(long l, int i, int j, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int k, int i1, 
            long l1)
        throws RemoteException;

    public abstract void focusSearch(long l, int i, int j, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int k, int i1, 
            long l1)
        throws RemoteException;

    public abstract void performAccessibilityAction(long l, int i, Bundle bundle, int j, IAccessibilityInteractionConnectionCallback iaccessibilityinteractionconnectioncallback, int k, 
            int i1, long l1)
        throws RemoteException;
}
