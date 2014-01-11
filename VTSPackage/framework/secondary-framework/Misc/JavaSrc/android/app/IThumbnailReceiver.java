// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.graphics.Bitmap;
import android.os.*;
import android.text.TextUtils;

public interface IThumbnailReceiver
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IThumbnailReceiver
    {

        private static final String DESCRIPTOR = "android.app.IThumbnailReceiver";
        static final int TRANSACTION_finished = 2;
        static final int TRANSACTION_newThumbnail = 1;

        public static IThumbnailReceiver asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.app.IThumbnailReceiver");
            if (iinterface != null && (iinterface instanceof IThumbnailReceiver))
                return (IThumbnailReceiver)iinterface;
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
            case 2: // '\002'
                parcel.enforceInterface("android.app.IThumbnailReceiver");
                finished();
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.app.IThumbnailReceiver");
                int k = parcel.readInt();
                Bitmap bitmap;
                if (parcel.readInt() != 0)
                    bitmap = (Bitmap)Bitmap.CREATOR.createFromParcel(parcel);
                else
                    bitmap = null;
                CharSequence charsequence;
                if (parcel.readInt() != 0)
                    charsequence = (CharSequence)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
                else
                    charsequence = null;
                newThumbnail(k, bitmap, charsequence);
                return true;

            case 1598968902: 
                parcel1.writeString("android.app.IThumbnailReceiver");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.app.IThumbnailReceiver");
        }
    }

    private static class Stub.Proxy
        implements IThumbnailReceiver
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public void finished()
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IThumbnailReceiver");
            mRemote.transact(2, parcel, null, 1);
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
        }

        public String getInterfaceDescriptor()
        {
            return "android.app.IThumbnailReceiver";
        }

        public void newThumbnail(int i, Bitmap bitmap, CharSequence charsequence)
            throws RemoteException
        {
            Parcel parcel = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.IThumbnailReceiver");
            parcel.writeInt(i);
            if (bitmap == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            bitmap.writeToParcel(parcel, 0);
_L3:
            if (charsequence == null)
                break MISSING_BLOCK_LABEL_92;
            parcel.writeInt(1);
            TextUtils.writeToParcel(charsequence, parcel, 0);
_L4:
            mRemote.transact(1, parcel, null, 1);
            parcel.recycle();
            return;
_L2:
            parcel.writeInt(0);
              goto _L3
            Exception exception;
            exception;
            parcel.recycle();
            throw exception;
            parcel.writeInt(0);
              goto _L4
        }

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract void finished()
        throws RemoteException;

    public abstract void newThumbnail(int i, Bitmap bitmap, CharSequence charsequence)
        throws RemoteException;
}
