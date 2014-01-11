// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.os.*;

// Referenced classes of package android.view:
//            InputEvent, IInputFilterHost

public interface IInputFilter
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IInputFilter
    {

        private static final String DESCRIPTOR = "android.view.IInputFilter";
        static final int TRANSACTION_filterInputEvent = 3;
        static final int TRANSACTION_install = 1;
        static final int TRANSACTION_uninstall = 2;

        public static IInputFilter asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.view.IInputFilter");
            if (iinterface != null && (iinterface instanceof IInputFilter))
                return (IInputFilter)iinterface;
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
                parcel.enforceInterface("android.view.IInputFilter");
                InputEvent inputevent;
                if (parcel.readInt() != 0)
                    inputevent = (InputEvent)InputEvent.CREATOR.createFromParcel(parcel);
                else
                    inputevent = null;
                filterInputEvent(inputevent, parcel.readInt());
                return true;

            case 2: // '\002'
                parcel.enforceInterface("android.view.IInputFilter");
                uninstall();
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.view.IInputFilter");
                install(IInputFilterHost.Stub.asInterface(parcel.readStrongBinder()));
                return true;

            case 1598968902: 
                parcel1.writeString("android.view.IInputFilter");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.view.IInputFilter");
        }
    }

    private static class Stub.Proxy
        implements IInputFilter
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public void filterInputEvent(InputEvent inputevent, int i)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IInputFilter");
            if (inputevent == null)
                break MISSING_BLOCK_LABEL_49;
            parcel.writeInt(1);
            inputevent.writeToParcel(parcel, 0);
_L1:
            parcel.writeInt(i);
            mRemote.transact(3, parcel, null, 1);
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
            return "android.view.IInputFilter";
        }

        public void install(IInputFilterHost iinputfilterhost)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IInputFilter");
            IBinder ibinder;
            ibinder = null;
            if (iinputfilterhost == null)
                break MISSING_BLOCK_LABEL_25;
            ibinder = iinputfilterhost.asBinder();
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(1, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public void uninstall()
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IInputFilter");
            mRemote.transact(2, parcel, null, 1);
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


    public abstract void filterInputEvent(InputEvent inputevent, int i)
        throws RemoteException;

    public abstract void install(IInputFilterHost iinputfilterhost)
        throws RemoteException;

    public abstract void uninstall()
        throws RemoteException;
}
