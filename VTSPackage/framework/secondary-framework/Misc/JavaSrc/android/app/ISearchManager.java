// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.ComponentName;
import android.content.pm.ResolveInfo;
import android.os.*;
import java.util.List;

// Referenced classes of package android.app:
//            SearchableInfo

public interface ISearchManager
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements ISearchManager
    {

        private static final String DESCRIPTOR = "android.app.ISearchManager";
        static final int TRANSACTION_getAssistIntent = 6;
        static final int TRANSACTION_getGlobalSearchActivities = 3;
        static final int TRANSACTION_getGlobalSearchActivity = 4;
        static final int TRANSACTION_getSearchableInfo = 1;
        static final int TRANSACTION_getSearchablesInGlobalSearch = 2;
        static final int TRANSACTION_getWebSearchActivity = 5;

        public static ISearchManager asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.app.ISearchManager");
            if (iinterface != null && (iinterface instanceof ISearchManager))
                return (ISearchManager)iinterface;
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
                parcel.enforceInterface("android.app.ISearchManager");
                ComponentName componentname3 = getAssistIntent(parcel.readInt());
                parcel1.writeNoException();
                if (componentname3 != null)
                {
                    parcel1.writeInt(1);
                    componentname3.writeToParcel(parcel1, 1);
                    return true;
                } else
                {
                    parcel1.writeInt(0);
                    return true;
                }

            case 5: // '\005'
                parcel.enforceInterface("android.app.ISearchManager");
                ComponentName componentname2 = getWebSearchActivity();
                parcel1.writeNoException();
                if (componentname2 != null)
                {
                    parcel1.writeInt(1);
                    componentname2.writeToParcel(parcel1, 1);
                    return true;
                } else
                {
                    parcel1.writeInt(0);
                    return true;
                }

            case 4: // '\004'
                parcel.enforceInterface("android.app.ISearchManager");
                ComponentName componentname1 = getGlobalSearchActivity();
                parcel1.writeNoException();
                if (componentname1 != null)
                {
                    parcel1.writeInt(1);
                    componentname1.writeToParcel(parcel1, 1);
                    return true;
                } else
                {
                    parcel1.writeInt(0);
                    return true;
                }

            case 3: // '\003'
                parcel.enforceInterface("android.app.ISearchManager");
                List list1 = getGlobalSearchActivities();
                parcel1.writeNoException();
                parcel1.writeTypedList(list1);
                return true;

            case 2: // '\002'
                parcel.enforceInterface("android.app.ISearchManager");
                List list = getSearchablesInGlobalSearch();
                parcel1.writeNoException();
                parcel1.writeTypedList(list);
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.app.ISearchManager");
                ComponentName componentname;
                if (parcel.readInt() != 0)
                    componentname = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname = null;
                SearchableInfo searchableinfo = getSearchableInfo(componentname);
                parcel1.writeNoException();
                if (searchableinfo != null)
                {
                    parcel1.writeInt(1);
                    searchableinfo.writeToParcel(parcel1, 1);
                    return true;
                } else
                {
                    parcel1.writeInt(0);
                    return true;
                }

            case 1598968902: 
                parcel1.writeString("android.app.ISearchManager");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.app.ISearchManager");
        }
    }

    private static class Stub.Proxy
        implements ISearchManager
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public ComponentName getAssistIntent(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.ISearchManager");
            parcel.writeInt(i);
            mRemote.transact(6, parcel, parcel1, 0);
            parcel1.readException();
            if (parcel1.readInt() == 0) goto _L2; else goto _L1
_L1:
            ComponentName componentname = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel1);
_L4:
            parcel1.recycle();
            parcel.recycle();
            return componentname;
_L2:
            componentname = null;
            if (true) goto _L4; else goto _L3
_L3:
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public List getGlobalSearchActivities()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            java.util.ArrayList arraylist;
            parcel.writeInterfaceToken("android.app.ISearchManager");
            mRemote.transact(3, parcel, parcel1, 0);
            parcel1.readException();
            arraylist = parcel1.createTypedArrayList(ResolveInfo.CREATOR);
            parcel1.recycle();
            parcel.recycle();
            return arraylist;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public ComponentName getGlobalSearchActivity()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.ISearchManager");
            mRemote.transact(4, parcel, parcel1, 0);
            parcel1.readException();
            if (parcel1.readInt() == 0) goto _L2; else goto _L1
_L1:
            ComponentName componentname = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel1);
_L4:
            parcel1.recycle();
            parcel.recycle();
            return componentname;
_L2:
            componentname = null;
            if (true) goto _L4; else goto _L3
_L3:
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public String getInterfaceDescriptor()
        {
            return "android.app.ISearchManager";
        }

        public SearchableInfo getSearchableInfo(ComponentName componentname)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.ISearchManager");
            if (componentname == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L3:
            SearchableInfo searchableinfo;
            mRemote.transact(1, parcel, parcel1, 0);
            parcel1.readException();
            if (parcel1.readInt() == 0)
                break MISSING_BLOCK_LABEL_100;
            searchableinfo = (SearchableInfo)SearchableInfo.CREATOR.createFromParcel(parcel1);
_L4:
            parcel1.recycle();
            parcel.recycle();
            return searchableinfo;
_L2:
            parcel.writeInt(0);
              goto _L3
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
            searchableinfo = null;
              goto _L4
        }

        public List getSearchablesInGlobalSearch()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            java.util.ArrayList arraylist;
            parcel.writeInterfaceToken("android.app.ISearchManager");
            mRemote.transact(2, parcel, parcel1, 0);
            parcel1.readException();
            arraylist = parcel1.createTypedArrayList(SearchableInfo.CREATOR);
            parcel1.recycle();
            parcel.recycle();
            return arraylist;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public ComponentName getWebSearchActivity()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.ISearchManager");
            mRemote.transact(5, parcel, parcel1, 0);
            parcel1.readException();
            if (parcel1.readInt() == 0) goto _L2; else goto _L1
_L1:
            ComponentName componentname = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel1);
_L4:
            parcel1.recycle();
            parcel.recycle();
            return componentname;
_L2:
            componentname = null;
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


    public abstract ComponentName getAssistIntent(int i)
        throws RemoteException;

    public abstract List getGlobalSearchActivities()
        throws RemoteException;

    public abstract ComponentName getGlobalSearchActivity()
        throws RemoteException;

    public abstract SearchableInfo getSearchableInfo(ComponentName componentname)
        throws RemoteException;

    public abstract List getSearchablesInGlobalSearch()
        throws RemoteException;

    public abstract ComponentName getWebSearchActivity()
        throws RemoteException;
}
