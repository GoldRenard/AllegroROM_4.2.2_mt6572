// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.accessibility;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.accessibilityservice.IAccessibilityServiceClient;
import android.content.ComponentName;
import android.os.*;
import android.view.IWindow;
import java.util.List;

// Referenced classes of package android.view.accessibility:
//            IAccessibilityInteractionConnection, IAccessibilityManagerClient, AccessibilityEvent

public interface IAccessibilityManager
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IAccessibilityManager
    {

        private static final String DESCRIPTOR = "android.view.accessibility.IAccessibilityManager";
        static final int TRANSACTION_addAccessibilityInteractionConnection = 6;
        static final int TRANSACTION_addClient = 1;
        static final int TRANSACTION_getEnabledAccessibilityServiceList = 4;
        static final int TRANSACTION_getInstalledAccessibilityServiceList = 3;
        static final int TRANSACTION_interrupt = 5;
        static final int TRANSACTION_registerUiTestAutomationService = 8;
        static final int TRANSACTION_removeAccessibilityInteractionConnection = 7;
        static final int TRANSACTION_sendAccessibilityEvent = 2;
        static final int TRANSACTION_temporaryEnableAccessibilityStateUntilKeyguardRemoved = 10;
        static final int TRANSACTION_unregisterUiTestAutomationService = 9;

        public static IAccessibilityManager asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.view.accessibility.IAccessibilityManager");
            if (iinterface != null && (iinterface instanceof IAccessibilityManager))
                return (IAccessibilityManager)iinterface;
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
            case 10: // '\n'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityManager");
                ComponentName componentname;
                if (parcel.readInt() != 0)
                    componentname = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname = null;
                boolean flag1;
                if (parcel.readInt() != 0)
                    flag1 = true;
                else
                    flag1 = false;
                temporaryEnableAccessibilityStateUntilKeyguardRemoved(componentname, flag1);
                parcel1.writeNoException();
                return true;

            case 9: // '\t'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityManager");
                unregisterUiTestAutomationService(android.accessibilityservice.IAccessibilityServiceClient.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                return true;

            case 8: // '\b'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityManager");
                IAccessibilityServiceClient iaccessibilityserviceclient = android.accessibilityservice.IAccessibilityServiceClient.Stub.asInterface(parcel.readStrongBinder());
                AccessibilityServiceInfo accessibilityserviceinfo;
                if (parcel.readInt() != 0)
                    accessibilityserviceinfo = (AccessibilityServiceInfo)AccessibilityServiceInfo.CREATOR.createFromParcel(parcel);
                else
                    accessibilityserviceinfo = null;
                registerUiTestAutomationService(iaccessibilityserviceclient, accessibilityserviceinfo);
                parcel1.writeNoException();
                return true;

            case 7: // '\007'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityManager");
                removeAccessibilityInteractionConnection(android.view.IWindow.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                return true;

            case 6: // '\006'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityManager");
                int i1 = addAccessibilityInteractionConnection(android.view.IWindow.Stub.asInterface(parcel.readStrongBinder()), IAccessibilityInteractionConnection.Stub.asInterface(parcel.readStrongBinder()), parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeInt(i1);
                return true;

            case 5: // '\005'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityManager");
                interrupt(parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 4: // '\004'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityManager");
                List list1 = getEnabledAccessibilityServiceList(parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeTypedList(list1);
                return true;

            case 3: // '\003'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityManager");
                List list = getInstalledAccessibilityServiceList(parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeTypedList(list);
                return true;

            case 2: // '\002'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityManager");
                AccessibilityEvent accessibilityevent;
                if (parcel.readInt() != 0)
                    accessibilityevent = (AccessibilityEvent)AccessibilityEvent.CREATOR.createFromParcel(parcel);
                else
                    accessibilityevent = null;
                boolean flag = sendAccessibilityEvent(accessibilityevent, parcel.readInt());
                parcel1.writeNoException();
                int l = 0;
                if (flag)
                    l = 1;
                parcel1.writeInt(l);
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.view.accessibility.IAccessibilityManager");
                int k = addClient(IAccessibilityManagerClient.Stub.asInterface(parcel.readStrongBinder()), parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeInt(k);
                return true;

            case 1598968902: 
                parcel1.writeString("android.view.accessibility.IAccessibilityManager");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.view.accessibility.IAccessibilityManager");
        }
    }

    private static class Stub.Proxy
        implements IAccessibilityManager
    {

        private IBinder mRemote;

        public int addAccessibilityInteractionConnection(IWindow iwindow, IAccessibilityInteractionConnection iaccessibilityinteractionconnection, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityManager");
            if (iwindow == null)
                break MISSING_BLOCK_LABEL_106;
            IBinder ibinder = iwindow.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            IBinder ibinder1;
            ibinder1 = null;
            if (iaccessibilityinteractionconnection == null)
                break MISSING_BLOCK_LABEL_51;
            ibinder1 = iaccessibilityinteractionconnection.asBinder();
            int j;
            parcel.writeStrongBinder(ibinder1);
            parcel.writeInt(i);
            mRemote.transact(6, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return j;
            ibinder = null;
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int addClient(IAccessibilityManagerClient iaccessibilitymanagerclient, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityManager");
            if (iaccessibilitymanagerclient == null)
                break MISSING_BLOCK_LABEL_77;
            IBinder ibinder = iaccessibilitymanagerclient.asBinder();
_L1:
            int j;
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(i);
            mRemote.transact(1, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return j;
            ibinder = null;
              goto _L1
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

        public List getEnabledAccessibilityServiceList(int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            java.util.ArrayList arraylist;
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityManager");
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(4, parcel, parcel1, 0);
            parcel1.readException();
            arraylist = parcel1.createTypedArrayList(AccessibilityServiceInfo.CREATOR);
            parcel1.recycle();
            parcel.recycle();
            return arraylist;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public List getInstalledAccessibilityServiceList(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            java.util.ArrayList arraylist;
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityManager");
            parcel.writeInt(i);
            mRemote.transact(3, parcel, parcel1, 0);
            parcel1.readException();
            arraylist = parcel1.createTypedArrayList(AccessibilityServiceInfo.CREATOR);
            parcel1.recycle();
            parcel.recycle();
            return arraylist;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public String getInterfaceDescriptor()
        {
            return "android.view.accessibility.IAccessibilityManager";
        }

        public void interrupt(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityManager");
            parcel.writeInt(i);
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

        public void registerUiTestAutomationService(IAccessibilityServiceClient iaccessibilityserviceclient, AccessibilityServiceInfo accessibilityserviceinfo)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityManager");
            if (iaccessibilityserviceclient == null) goto _L2; else goto _L1
_L1:
            IBinder ibinder = iaccessibilityserviceclient.asBinder();
_L5:
            parcel.writeStrongBinder(ibinder);
            if (accessibilityserviceinfo == null) goto _L4; else goto _L3
_L3:
            parcel.writeInt(1);
            accessibilityserviceinfo.writeToParcel(parcel, 0);
_L6:
            mRemote.transact(8, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
_L2:
            ibinder = null;
              goto _L5
_L4:
            parcel.writeInt(0);
              goto _L6
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
              goto _L5
        }

        public void removeAccessibilityInteractionConnection(IWindow iwindow)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityManager");
            if (iwindow == null)
                break MISSING_BLOCK_LABEL_60;
            IBinder ibinder = iwindow.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(7, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            ibinder = null;
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public boolean sendAccessibilityEvent(AccessibilityEvent accessibilityevent, int i)
            throws RemoteException
        {
            boolean flag;
            Parcel parcel;
            Parcel parcel1;
            flag = true;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityManager");
            if (accessibilityevent == null)
                break MISSING_BLOCK_LABEL_87;
            parcel.writeInt(1);
            accessibilityevent.writeToParcel(parcel, 0);
_L1:
            int j;
            parcel.writeInt(i);
            mRemote.transact(2, parcel, parcel1, 0);
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

        public void temporaryEnableAccessibilityStateUntilKeyguardRemoved(ComponentName componentname, boolean flag)
            throws RemoteException
        {
            int i;
            Parcel parcel;
            Parcel parcel1;
            i = 1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityManager");
            if (componentname == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
              goto _L3
_L5:
            parcel.writeInt(i);
            mRemote.transact(10, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
_L2:
            parcel.writeInt(0);
            break; /* Loop/switch isn't completed */
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
_L6:
            i = 0;
            if (true) goto _L4; else goto _L3
_L4:
            break; /* Loop/switch isn't completed */
_L3:
            if (!flag) goto _L6; else goto _L5
        }

        public void unregisterUiTestAutomationService(IAccessibilityServiceClient iaccessibilityserviceclient)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.accessibility.IAccessibilityManager");
            if (iaccessibilityserviceclient == null)
                break MISSING_BLOCK_LABEL_60;
            IBinder ibinder = iaccessibilityserviceclient.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(9, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
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


    public abstract int addAccessibilityInteractionConnection(IWindow iwindow, IAccessibilityInteractionConnection iaccessibilityinteractionconnection, int i)
        throws RemoteException;

    public abstract int addClient(IAccessibilityManagerClient iaccessibilitymanagerclient, int i)
        throws RemoteException;

    public abstract List getEnabledAccessibilityServiceList(int i, int j)
        throws RemoteException;

    public abstract List getInstalledAccessibilityServiceList(int i)
        throws RemoteException;

    public abstract void interrupt(int i)
        throws RemoteException;

    public abstract void registerUiTestAutomationService(IAccessibilityServiceClient iaccessibilityserviceclient, AccessibilityServiceInfo accessibilityserviceinfo)
        throws RemoteException;

    public abstract void removeAccessibilityInteractionConnection(IWindow iwindow)
        throws RemoteException;

    public abstract boolean sendAccessibilityEvent(AccessibilityEvent accessibilityevent, int i)
        throws RemoteException;

    public abstract void temporaryEnableAccessibilityStateUntilKeyguardRemoved(ComponentName componentname, boolean flag)
        throws RemoteException;

    public abstract void unregisterUiTestAutomationService(IAccessibilityServiceClient iaccessibilityserviceclient)
        throws RemoteException;
}
