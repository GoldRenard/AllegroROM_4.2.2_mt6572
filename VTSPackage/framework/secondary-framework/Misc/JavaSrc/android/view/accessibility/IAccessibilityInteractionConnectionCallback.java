// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.accessibility;

import android.os.*;
import java.util.List;

// Referenced classes of package android.view.accessibility:
//            AccessibilityNodeInfo

public interface IAccessibilityInteractionConnectionCallback
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IAccessibilityInteractionConnectionCallback
    {

        private static final String DESCRIPTOR = "android.view.accessibility.IAccessibilityInteractionConnectionCallback";
        static final int TRANSACTION_setFindAccessibilityNodeInfoResult = 1;
        static final int TRANSACTION_setFindAccessibilityNodeInfosResult = 2;
        static final int TRANSACTION_setPerformAccessibilityActionResult = 3;

        public static IAccessibilityInteractionConnectionCallback asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.view.accessibility.IAccessibilityInteractionConnectionCallback");
            if (iinterface != null && (iinterface instanceof IAccessibilityInteractionConnectionCallback))
                return (IAccessibilityInteractionConnectionCallback)iinterface;
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
            case 3: // '\003'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityInteractionConnectionCallback");
                boolean flag;
                if (parcel.readInt() != 0)
                    flag = true;
                else
                    flag = false;
                setPerformAccessibilityActionResult(flag, parcel.readInt());
                return true;

            case 2: // '\002'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityInteractionConnectionCallback");
                setFindAccessibilityNodeInfosResult(parcel.createTypedArrayList(AccessibilityNodeInfo.CREATOR), parcel.readInt());
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityInteractionConnectionCallback");
                AccessibilityNodeInfo accessibilitynodeinfo;
                if (parcel.readInt() != 0)
                    accessibilitynodeinfo = (AccessibilityNodeInfo)AccessibilityNodeInfo.CREATOR.createFromParcel(parcel);
                else
                    accessibilitynodeinfo = null;
                setFindAccessibilityNodeInfoResult(accessibilitynodeinfo, parcel.readInt());
                return true;

            case 1598968902: 
                parcel1.writeString("android.view.accessibility.IAccessibilityInteractionConnectionCallback");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.view.accessibility.IAccessibilityInteractionConnectionCallback");
        }
    }

    private static class Stub.Proxy
        implements IAccessibilityInteractionConnectionCallback
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public String getInterfaceDescriptor()
        {
            return "android.view.accessibility.IAccessibilityInteractionConnectionCallback";
        }

        public void setFindAccessibilityNodeInfoResult(AccessibilityNodeInfo accessibilitynodeinfo, int i)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityInteractionConnectionCallback");
            if (accessibilitynodeinfo == null)
                break MISSING_BLOCK_LABEL_49;
            parcel.writeInt(1);
            accessibilitynodeinfo.writeToParcel(parcel, 0);
_L1:
            parcel.writeInt(i);
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

        public void setFindAccessibilityNodeInfosResult(List list, int i)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityInteractionConnectionCallback");
            parcel.writeTypedList(list);
            parcel.writeInt(i);
            mRemote.transact(2, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void setPerformAccessibilityActionResult(boolean flag, int i)
            throws RemoteException
        {
            int j;
            Parcel parcel;
            j = 1;
            parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityInteractionConnectionCallback");
            if (!flag)
                j = 0;
            parcel.writeInt(j);
            parcel.writeInt(i);
            mRemote.transact(3, parcel, null, 1);
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


    public abstract void setFindAccessibilityNodeInfoResult(AccessibilityNodeInfo accessibilitynodeinfo, int i)
        throws RemoteException;

    public abstract void setFindAccessibilityNodeInfosResult(List list, int i)
        throws RemoteException;

    public abstract void setPerformAccessibilityActionResult(boolean flag, int i)
        throws RemoteException;
}
