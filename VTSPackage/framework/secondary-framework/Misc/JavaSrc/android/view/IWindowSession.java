// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.content.ClipData;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.graphics.Region;
import android.os.*;

// Referenced classes of package android.view:
//            IWindow, InputChannel, Surface

public interface IWindowSession
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IWindowSession
    {

        private static final String DESCRIPTOR = "android.view.IWindowSession";
        static final int TRANSACTION_add = 1;
        static final int TRANSACTION_addToDisplay = 2;
        static final int TRANSACTION_addToDisplayWithoutInputChannel = 4;
        static final int TRANSACTION_addWithoutInputChannel = 3;
        static final int TRANSACTION_dragRecipientEntered = 19;
        static final int TRANSACTION_dragRecipientExited = 20;
        static final int TRANSACTION_finishDrawing = 12;
        static final int TRANSACTION_getDisplayFrame = 11;
        static final int TRANSACTION_getInTouchMode = 14;
        static final int TRANSACTION_getYLWindowFrame = 27;
        static final int TRANSACTION_onRectangleOnScreenRequested = 26;
        static final int TRANSACTION_outOfMemory = 8;
        static final int TRANSACTION_performDeferredDestroy = 7;
        static final int TRANSACTION_performDrag = 17;
        static final int TRANSACTION_performHapticFeedback = 15;
        static final int TRANSACTION_prepareDrag = 16;
        static final int TRANSACTION_relayout = 6;
        static final int TRANSACTION_remove = 5;
        static final int TRANSACTION_reportDropResult = 18;
        static final int TRANSACTION_sendWallpaperCommand = 23;
        static final int TRANSACTION_setInTouchMode = 13;
        static final int TRANSACTION_setInsets = 10;
        static final int TRANSACTION_setTransparentRegion = 9;
        static final int TRANSACTION_setUniverseTransform = 25;
        static final int TRANSACTION_setWallpaperPosition = 21;
        static final int TRANSACTION_wallpaperCommandComplete = 24;
        static final int TRANSACTION_wallpaperOffsetsComplete = 22;

        public static IWindowSession asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.view.IWindowSession");
            if (iinterface != null && (iinterface instanceof IWindowSession))
                return (IWindowSession)iinterface;
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
            case 27: // '\033'
                parcel.enforceInterface("android.view.IWindowSession");
                IWindow iwindow12 = IWindow.Stub.asInterface(parcel.readStrongBinder());
                Rect rect11 = new Rect();
                getYLWindowFrame(iwindow12, rect11);
                parcel1.writeNoException();
                if (rect11 != null)
                {
                    parcel1.writeInt(1);
                    rect11.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                return true;

            case 26: // '\032'
                parcel.enforceInterface("android.view.IWindowSession");
                IBinder ibinder4 = parcel.readStrongBinder();
                Rect rect10;
                if (parcel.readInt() != 0)
                    rect10 = (Rect)Rect.CREATOR.createFromParcel(parcel);
                else
                    rect10 = null;
                boolean flag8;
                if (parcel.readInt() != 0)
                    flag8 = true;
                else
                    flag8 = false;
                onRectangleOnScreenRequested(ibinder4, rect10, flag8);
                parcel1.writeNoException();
                return true;

            case 25: // '\031'
                parcel.enforceInterface("android.view.IWindowSession");
                setUniverseTransform(parcel.readStrongBinder(), parcel.readFloat(), parcel.readFloat(), parcel.readFloat(), parcel.readFloat(), parcel.readFloat(), parcel.readFloat(), parcel.readFloat());
                parcel1.writeNoException();
                return true;

            case 24: // '\030'
                parcel.enforceInterface("android.view.IWindowSession");
                IBinder ibinder3 = parcel.readStrongBinder();
                Bundle bundle2;
                if (parcel.readInt() != 0)
                    bundle2 = (Bundle)Bundle.CREATOR.createFromParcel(parcel);
                else
                    bundle2 = null;
                wallpaperCommandComplete(ibinder3, bundle2);
                parcel1.writeNoException();
                return true;

            case 23: // '\027'
                parcel.enforceInterface("android.view.IWindowSession");
                IBinder ibinder2 = parcel.readStrongBinder();
                String s = parcel.readString();
                int l7 = parcel.readInt();
                int i8 = parcel.readInt();
                int j8 = parcel.readInt();
                Bundle bundle;
                if (parcel.readInt() != 0)
                    bundle = (Bundle)Bundle.CREATOR.createFromParcel(parcel);
                else
                    bundle = null;
                boolean flag7;
                if (parcel.readInt() != 0)
                    flag7 = true;
                else
                    flag7 = false;
                Bundle bundle1 = sendWallpaperCommand(ibinder2, s, l7, i8, j8, bundle, flag7);
                parcel1.writeNoException();
                if (bundle1 != null)
                {
                    parcel1.writeInt(1);
                    bundle1.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                return true;

            case 22: // '\026'
                parcel.enforceInterface("android.view.IWindowSession");
                wallpaperOffsetsComplete(parcel.readStrongBinder());
                parcel1.writeNoException();
                return true;

            case 21: // '\025'
                parcel.enforceInterface("android.view.IWindowSession");
                setWallpaperPosition(parcel.readStrongBinder(), parcel.readFloat(), parcel.readFloat(), parcel.readFloat(), parcel.readFloat());
                parcel1.writeNoException();
                return true;

            case 20: // '\024'
                parcel.enforceInterface("android.view.IWindowSession");
                dragRecipientExited(IWindow.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                return true;

            case 19: // '\023'
                parcel.enforceInterface("android.view.IWindowSession");
                dragRecipientEntered(IWindow.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                return true;

            case 18: // '\022'
                parcel.enforceInterface("android.view.IWindowSession");
                IWindow iwindow11 = IWindow.Stub.asInterface(parcel.readStrongBinder());
                boolean flag6;
                if (parcel.readInt() != 0)
                    flag6 = true;
                else
                    flag6 = false;
                reportDropResult(iwindow11, flag6);
                parcel1.writeNoException();
                return true;

            case 17: // '\021'
                parcel.enforceInterface("android.view.IWindowSession");
                IWindow iwindow10 = IWindow.Stub.asInterface(parcel.readStrongBinder());
                IBinder ibinder1 = parcel.readStrongBinder();
                float f = parcel.readFloat();
                float f1 = parcel.readFloat();
                float f2 = parcel.readFloat();
                float f3 = parcel.readFloat();
                ClipData clipdata;
                if (parcel.readInt() != 0)
                    clipdata = (ClipData)ClipData.CREATOR.createFromParcel(parcel);
                else
                    clipdata = null;
                boolean flag5 = performDrag(iwindow10, ibinder1, f, f1, f2, f3, clipdata);
                parcel1.writeNoException();
                int k7;
                if (flag5)
                    k7 = 1;
                else
                    k7 = 0;
                parcel1.writeInt(k7);
                return true;

            case 16: // '\020'
                parcel.enforceInterface("android.view.IWindowSession");
                IWindow iwindow9 = IWindow.Stub.asInterface(parcel.readStrongBinder());
                int l6 = parcel.readInt();
                int i7 = parcel.readInt();
                int j7 = parcel.readInt();
                Surface surface1 = new Surface();
                IBinder ibinder = prepareDrag(iwindow9, l6, i7, j7, surface1);
                parcel1.writeNoException();
                parcel1.writeStrongBinder(ibinder);
                if (surface1 != null)
                {
                    parcel1.writeInt(1);
                    surface1.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                return true;

            case 15: // '\017'
                parcel.enforceInterface("android.view.IWindowSession");
                IWindow iwindow8 = IWindow.Stub.asInterface(parcel.readStrongBinder());
                int j6 = parcel.readInt();
                boolean flag3;
                if (parcel.readInt() != 0)
                    flag3 = true;
                else
                    flag3 = false;
                boolean flag4 = performHapticFeedback(iwindow8, j6, flag3);
                parcel1.writeNoException();
                int k6;
                if (flag4)
                    k6 = 1;
                else
                    k6 = 0;
                parcel1.writeInt(k6);
                return true;

            case 14: // '\016'
                parcel.enforceInterface("android.view.IWindowSession");
                boolean flag2 = getInTouchMode();
                parcel1.writeNoException();
                int i6;
                if (flag2)
                    i6 = 1;
                else
                    i6 = 0;
                parcel1.writeInt(i6);
                return true;

            case 13: // '\r'
                parcel.enforceInterface("android.view.IWindowSession");
                boolean flag1;
                if (parcel.readInt() != 0)
                    flag1 = true;
                else
                    flag1 = false;
                setInTouchMode(flag1);
                parcel1.writeNoException();
                return true;

            case 12: // '\f'
                parcel.enforceInterface("android.view.IWindowSession");
                finishDrawing(IWindow.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                return true;

            case 11: // '\013'
                parcel.enforceInterface("android.view.IWindowSession");
                IWindow iwindow7 = IWindow.Stub.asInterface(parcel.readStrongBinder());
                Rect rect9 = new Rect();
                getDisplayFrame(iwindow7, rect9);
                parcel1.writeNoException();
                if (rect9 != null)
                {
                    parcel1.writeInt(1);
                    rect9.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                return true;

            case 10: // '\n'
                parcel.enforceInterface("android.view.IWindowSession");
                IWindow iwindow6 = IWindow.Stub.asInterface(parcel.readStrongBinder());
                int l5 = parcel.readInt();
                Rect rect7;
                if (parcel.readInt() != 0)
                    rect7 = (Rect)Rect.CREATOR.createFromParcel(parcel);
                else
                    rect7 = null;
                Rect rect8;
                if (parcel.readInt() != 0)
                    rect8 = (Rect)Rect.CREATOR.createFromParcel(parcel);
                else
                    rect8 = null;
                Region region1;
                if (parcel.readInt() != 0)
                    region1 = (Region)Region.CREATOR.createFromParcel(parcel);
                else
                    region1 = null;
                setInsets(iwindow6, l5, rect7, rect8, region1);
                parcel1.writeNoException();
                return true;

            case 9: // '\t'
                parcel.enforceInterface("android.view.IWindowSession");
                IWindow iwindow5 = IWindow.Stub.asInterface(parcel.readStrongBinder());
                Region region;
                if (parcel.readInt() != 0)
                    region = (Region)Region.CREATOR.createFromParcel(parcel);
                else
                    region = null;
                setTransparentRegion(iwindow5, region);
                parcel1.writeNoException();
                return true;

            case 8: // '\b'
                parcel.enforceInterface("android.view.IWindowSession");
                boolean flag = outOfMemory(IWindow.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                int k5;
                if (flag)
                    k5 = 1;
                else
                    k5 = 0;
                parcel1.writeInt(k5);
                return true;

            case 7: // '\007'
                parcel.enforceInterface("android.view.IWindowSession");
                performDeferredDestroy(IWindow.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                return true;

            case 6: // '\006'
                parcel.enforceInterface("android.view.IWindowSession");
                IWindow iwindow4 = IWindow.Stub.asInterface(parcel.readStrongBinder());
                int i4 = parcel.readInt();
                WindowManager.LayoutParams layoutparams4;
                if (parcel.readInt() != 0)
                    layoutparams4 = (WindowManager.LayoutParams)WindowManager.LayoutParams.CREATOR.createFromParcel(parcel);
                else
                    layoutparams4 = null;
                int j4 = parcel.readInt();
                int k4 = parcel.readInt();
                int l4 = parcel.readInt();
                int i5 = parcel.readInt();
                Rect rect4 = new Rect();
                Rect rect5 = new Rect();
                Rect rect6 = new Rect();
                Configuration configuration = new Configuration();
                Surface surface = new Surface();
                int j5 = relayout(iwindow4, i4, layoutparams4, j4, k4, l4, i5, rect4, rect5, rect6, configuration, surface);
                parcel1.writeNoException();
                parcel1.writeInt(j5);
                if (rect4 != null)
                {
                    parcel1.writeInt(1);
                    rect4.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                if (rect5 != null)
                {
                    parcel1.writeInt(1);
                    rect5.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                if (rect6 != null)
                {
                    parcel1.writeInt(1);
                    rect6.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                if (configuration != null)
                {
                    parcel1.writeInt(1);
                    configuration.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                if (surface != null)
                {
                    parcel1.writeInt(1);
                    surface.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                return true;

            case 5: // '\005'
                parcel.enforceInterface("android.view.IWindowSession");
                remove(IWindow.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                return true;

            case 4: // '\004'
                parcel.enforceInterface("android.view.IWindowSession");
                IWindow iwindow3 = IWindow.Stub.asInterface(parcel.readStrongBinder());
                int i3 = parcel.readInt();
                WindowManager.LayoutParams layoutparams3;
                if (parcel.readInt() != 0)
                    layoutparams3 = (WindowManager.LayoutParams)WindowManager.LayoutParams.CREATOR.createFromParcel(parcel);
                else
                    layoutparams3 = null;
                int j3 = parcel.readInt();
                int k3 = parcel.readInt();
                Rect rect3 = new Rect();
                int l3 = addToDisplayWithoutInputChannel(iwindow3, i3, layoutparams3, j3, k3, rect3);
                parcel1.writeNoException();
                parcel1.writeInt(l3);
                if (rect3 != null)
                {
                    parcel1.writeInt(1);
                    rect3.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                return true;

            case 3: // '\003'
                parcel.enforceInterface("android.view.IWindowSession");
                IWindow iwindow2 = IWindow.Stub.asInterface(parcel.readStrongBinder());
                int j2 = parcel.readInt();
                WindowManager.LayoutParams layoutparams2;
                if (parcel.readInt() != 0)
                    layoutparams2 = (WindowManager.LayoutParams)WindowManager.LayoutParams.CREATOR.createFromParcel(parcel);
                else
                    layoutparams2 = null;
                int k2 = parcel.readInt();
                Rect rect2 = new Rect();
                int l2 = addWithoutInputChannel(iwindow2, j2, layoutparams2, k2, rect2);
                parcel1.writeNoException();
                parcel1.writeInt(l2);
                if (rect2 != null)
                {
                    parcel1.writeInt(1);
                    rect2.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                return true;

            case 2: // '\002'
                parcel.enforceInterface("android.view.IWindowSession");
                IWindow iwindow1 = IWindow.Stub.asInterface(parcel.readStrongBinder());
                int j1 = parcel.readInt();
                WindowManager.LayoutParams layoutparams1;
                if (parcel.readInt() != 0)
                    layoutparams1 = (WindowManager.LayoutParams)WindowManager.LayoutParams.CREATOR.createFromParcel(parcel);
                else
                    layoutparams1 = null;
                int k1 = parcel.readInt();
                int l1 = parcel.readInt();
                Rect rect1 = new Rect();
                InputChannel inputchannel1 = new InputChannel();
                int i2 = addToDisplay(iwindow1, j1, layoutparams1, k1, l1, rect1, inputchannel1);
                parcel1.writeNoException();
                parcel1.writeInt(i2);
                if (rect1 != null)
                {
                    parcel1.writeInt(1);
                    rect1.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                if (inputchannel1 != null)
                {
                    parcel1.writeInt(1);
                    inputchannel1.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.view.IWindowSession");
                IWindow iwindow = IWindow.Stub.asInterface(parcel.readStrongBinder());
                int k = parcel.readInt();
                WindowManager.LayoutParams layoutparams;
                if (parcel.readInt() != 0)
                    layoutparams = (WindowManager.LayoutParams)WindowManager.LayoutParams.CREATOR.createFromParcel(parcel);
                else
                    layoutparams = null;
                int l = parcel.readInt();
                Rect rect = new Rect();
                InputChannel inputchannel = new InputChannel();
                int i1 = add(iwindow, k, layoutparams, l, rect, inputchannel);
                parcel1.writeNoException();
                parcel1.writeInt(i1);
                if (rect != null)
                {
                    parcel1.writeInt(1);
                    rect.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                if (inputchannel != null)
                {
                    parcel1.writeInt(1);
                    inputchannel.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                return true;

            case 1598968902: 
                parcel1.writeString("android.view.IWindowSession");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.view.IWindowSession");
        }
    }

    private static class Stub.Proxy
        implements IWindowSession
    {

        private IBinder mRemote;

        public int add(IWindow iwindow, int i, WindowManager.LayoutParams layoutparams, int j, Rect rect, InputChannel inputchannel)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            if (iwindow == null) goto _L2; else goto _L1
_L1:
            IBinder ibinder = iwindow.asBinder();
_L5:
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(i);
            if (layoutparams == null) goto _L4; else goto _L3
_L3:
            parcel.writeInt(1);
            layoutparams.writeToParcel(parcel, 0);
_L6:
            int k;
            parcel.writeInt(j);
            mRemote.transact(1, parcel, parcel1, 0);
            parcel1.readException();
            k = parcel1.readInt();
            if (parcel1.readInt() != 0)
                rect.readFromParcel(parcel1);
            if (parcel1.readInt() != 0)
                inputchannel.readFromParcel(parcel1);
            parcel1.recycle();
            parcel.recycle();
            return k;
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

        public int addToDisplay(IWindow iwindow, int i, WindowManager.LayoutParams layoutparams, int j, int k, Rect rect, InputChannel inputchannel)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            if (iwindow == null) goto _L2; else goto _L1
_L1:
            IBinder ibinder = iwindow.asBinder();
_L5:
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(i);
            if (layoutparams == null) goto _L4; else goto _L3
_L3:
            parcel.writeInt(1);
            layoutparams.writeToParcel(parcel, 0);
_L6:
            int l;
            parcel.writeInt(j);
            parcel.writeInt(k);
            mRemote.transact(2, parcel, parcel1, 0);
            parcel1.readException();
            l = parcel1.readInt();
            if (parcel1.readInt() != 0)
                rect.readFromParcel(parcel1);
            if (parcel1.readInt() != 0)
                inputchannel.readFromParcel(parcel1);
            parcel1.recycle();
            parcel.recycle();
            return l;
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

        public int addToDisplayWithoutInputChannel(IWindow iwindow, int i, WindowManager.LayoutParams layoutparams, int j, int k, Rect rect)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            if (iwindow == null) goto _L2; else goto _L1
_L1:
            IBinder ibinder = iwindow.asBinder();
_L5:
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(i);
            if (layoutparams == null) goto _L4; else goto _L3
_L3:
            parcel.writeInt(1);
            layoutparams.writeToParcel(parcel, 0);
_L6:
            int l;
            parcel.writeInt(j);
            parcel.writeInt(k);
            mRemote.transact(4, parcel, parcel1, 0);
            parcel1.readException();
            l = parcel1.readInt();
            if (parcel1.readInt() != 0)
                rect.readFromParcel(parcel1);
            parcel1.recycle();
            parcel.recycle();
            return l;
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

        public int addWithoutInputChannel(IWindow iwindow, int i, WindowManager.LayoutParams layoutparams, int j, Rect rect)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            if (iwindow == null) goto _L2; else goto _L1
_L1:
            IBinder ibinder = iwindow.asBinder();
_L5:
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(i);
            if (layoutparams == null) goto _L4; else goto _L3
_L3:
            parcel.writeInt(1);
            layoutparams.writeToParcel(parcel, 0);
_L6:
            int k;
            parcel.writeInt(j);
            mRemote.transact(3, parcel, parcel1, 0);
            parcel1.readException();
            k = parcel1.readInt();
            if (parcel1.readInt() != 0)
                rect.readFromParcel(parcel1);
            parcel1.recycle();
            parcel.recycle();
            return k;
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

        public IBinder asBinder()
        {
            return mRemote;
        }

        public void dragRecipientEntered(IWindow iwindow)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            if (iwindow == null)
                break MISSING_BLOCK_LABEL_60;
            IBinder ibinder = iwindow.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(19, parcel, parcel1, 0);
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

        public void dragRecipientExited(IWindow iwindow)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            if (iwindow == null)
                break MISSING_BLOCK_LABEL_60;
            IBinder ibinder = iwindow.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(20, parcel, parcel1, 0);
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

        public void finishDrawing(IWindow iwindow)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            if (iwindow == null)
                break MISSING_BLOCK_LABEL_60;
            IBinder ibinder = iwindow.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(12, parcel, parcel1, 0);
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

        public void getDisplayFrame(IWindow iwindow, Rect rect)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            if (iwindow == null)
                break MISSING_BLOCK_LABEL_78;
            IBinder ibinder = iwindow.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(11, parcel, parcel1, 0);
            parcel1.readException();
            if (parcel1.readInt() != 0)
                rect.readFromParcel(parcel1);
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

        public boolean getInTouchMode()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.view.IWindowSession");
            mRemote.transact(14, parcel, parcel1, 0);
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

        public String getInterfaceDescriptor()
        {
            return "android.view.IWindowSession";
        }

        public void getYLWindowFrame(IWindow iwindow, Rect rect)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            if (iwindow == null)
                break MISSING_BLOCK_LABEL_78;
            IBinder ibinder = iwindow.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(27, parcel, parcel1, 0);
            parcel1.readException();
            if (parcel1.readInt() != 0)
                rect.readFromParcel(parcel1);
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

        public void onRectangleOnScreenRequested(IBinder ibinder, Rect rect, boolean flag)
            throws RemoteException
        {
            int i;
            Parcel parcel;
            Parcel parcel1;
            i = 1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            parcel.writeStrongBinder(ibinder);
            if (rect == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            rect.writeToParcel(parcel, 0);
              goto _L3
_L5:
            parcel.writeInt(i);
            mRemote.transact(26, parcel, parcel1, 0);
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

        public boolean outOfMemory(IWindow iwindow)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            if (iwindow == null)
                break MISSING_BLOCK_LABEL_79;
            IBinder ibinder = iwindow.asBinder();
_L1:
            int i;
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(8, parcel, parcel1, 0);
            parcel1.readException();
            i = parcel1.readInt();
            boolean flag = false;
            if (i != 0)
                flag = true;
            parcel1.recycle();
            parcel.recycle();
            return flag;
            ibinder = null;
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void performDeferredDestroy(IWindow iwindow)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
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

        public boolean performDrag(IWindow iwindow, IBinder ibinder, float f, float f1, float f2, float f3, ClipData clipdata)
            throws RemoteException
        {
            boolean flag;
            Parcel parcel;
            Parcel parcel1;
            flag = true;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            if (iwindow == null) goto _L2; else goto _L1
_L1:
            IBinder ibinder1 = iwindow.asBinder();
_L5:
            parcel.writeStrongBinder(ibinder1);
            parcel.writeStrongBinder(ibinder);
            parcel.writeFloat(f);
            parcel.writeFloat(f1);
            parcel.writeFloat(f2);
            parcel.writeFloat(f3);
            if (clipdata == null) goto _L4; else goto _L3
_L3:
            parcel.writeInt(1);
            clipdata.writeToParcel(parcel, 0);
_L6:
            int i;
            mRemote.transact(17, parcel, parcel1, 0);
            parcel1.readException();
            i = parcel1.readInt();
            Exception exception;
            if (i == 0)
                flag = false;
            parcel1.recycle();
            parcel.recycle();
            return flag;
_L2:
            ibinder1 = null;
              goto _L5
_L4:
            parcel.writeInt(0);
              goto _L6
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
              goto _L5
        }

        public boolean performHapticFeedback(IWindow iwindow, int i, boolean flag)
            throws RemoteException
        {
            boolean flag1;
            Parcel parcel;
            Parcel parcel1;
            flag1 = true;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            if (iwindow == null)
                break MISSING_BLOCK_LABEL_107;
            IBinder ibinder = iwindow.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(i);
            int j;
            int k;
            if (flag)
                j = ((flag1) ? 1 : 0);
            else
                j = 0;
            parcel.writeInt(j);
            mRemote.transact(15, parcel, parcel1, 0);
            parcel1.readException();
            k = parcel1.readInt();
            if (k == 0)
                flag1 = false;
            parcel1.recycle();
            parcel.recycle();
            return flag1;
            ibinder = null;
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public IBinder prepareDrag(IWindow iwindow, int i, int j, int k, Surface surface)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            if (iwindow == null)
                break MISSING_BLOCK_LABEL_112;
            IBinder ibinder = iwindow.asBinder();
_L1:
            IBinder ibinder1;
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(i);
            parcel.writeInt(j);
            parcel.writeInt(k);
            mRemote.transact(16, parcel, parcel1, 0);
            parcel1.readException();
            ibinder1 = parcel1.readStrongBinder();
            if (parcel1.readInt() != 0)
                surface.readFromParcel(parcel1);
            parcel1.recycle();
            parcel.recycle();
            return ibinder1;
            ibinder = null;
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int relayout(IWindow iwindow, int i, WindowManager.LayoutParams layoutparams, int j, int k, int l, int i1, 
                Rect rect, Rect rect1, Rect rect2, Configuration configuration, Surface surface)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            if (iwindow == null) goto _L2; else goto _L1
_L1:
            IBinder ibinder = iwindow.asBinder();
_L5:
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(i);
            if (layoutparams == null) goto _L4; else goto _L3
_L3:
            parcel.writeInt(1);
            layoutparams.writeToParcel(parcel, 0);
_L6:
            int j1;
            parcel.writeInt(j);
            parcel.writeInt(k);
            parcel.writeInt(l);
            parcel.writeInt(i1);
            mRemote.transact(6, parcel, parcel1, 0);
            parcel1.readException();
            j1 = parcel1.readInt();
            if (parcel1.readInt() != 0)
                rect.readFromParcel(parcel1);
            if (parcel1.readInt() != 0)
                rect1.readFromParcel(parcel1);
            if (parcel1.readInt() != 0)
                rect2.readFromParcel(parcel1);
            if (parcel1.readInt() != 0)
                configuration.readFromParcel(parcel1);
            if (parcel1.readInt() != 0)
                surface.readFromParcel(parcel1);
            parcel1.recycle();
            parcel.recycle();
            return j1;
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

        public void remove(IWindow iwindow)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            if (iwindow == null)
                break MISSING_BLOCK_LABEL_59;
            IBinder ibinder = iwindow.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(5, parcel, parcel1, 0);
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

        public void reportDropResult(IWindow iwindow, boolean flag)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            if (iwindow == null)
                break MISSING_BLOCK_LABEL_80;
            IBinder ibinder = iwindow.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            int i;
            i = 0;
            if (flag)
                i = 1;
            parcel.writeInt(i);
            mRemote.transact(18, parcel, parcel1, 0);
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

        public Bundle sendWallpaperCommand(IBinder ibinder, String s, int i, int j, int k, Bundle bundle, boolean flag)
            throws RemoteException
        {
            int l;
            Parcel parcel;
            Parcel parcel1;
            l = 1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            parcel.writeStrongBinder(ibinder);
            parcel.writeString(s);
            parcel.writeInt(i);
            parcel.writeInt(j);
            parcel.writeInt(k);
            if (bundle == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            bundle.writeToParcel(parcel, 0);
              goto _L3
_L7:
            parcel.writeInt(l);
            mRemote.transact(23, parcel, parcel1, 0);
            parcel1.readException();
            if (parcel1.readInt() == 0) goto _L5; else goto _L4
_L4:
            Bundle bundle1 = (Bundle)Bundle.CREATOR.createFromParcel(parcel1);
_L6:
            parcel1.recycle();
            parcel.recycle();
            return bundle1;
_L2:
            parcel.writeInt(0);
              goto _L3
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
_L8:
            l = 0;
            break; /* Loop/switch isn't completed */
_L5:
            bundle1 = null;
              goto _L6
_L3:
            if (!flag) goto _L8; else goto _L7
        }

        public void setInTouchMode(boolean flag)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            int i;
            i = 0;
            if (flag)
                i = 1;
            parcel.writeInt(i);
            mRemote.transact(13, parcel, parcel1, 0);
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

        public void setInsets(IWindow iwindow, int i, Rect rect, Rect rect1, Region region)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            if (iwindow == null) goto _L2; else goto _L1
_L1:
            IBinder ibinder = iwindow.asBinder();
_L7:
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(i);
            if (rect == null) goto _L4; else goto _L3
_L3:
            parcel.writeInt(1);
            rect.writeToParcel(parcel, 0);
_L8:
            if (rect1 == null) goto _L6; else goto _L5
_L5:
            parcel.writeInt(1);
            rect1.writeToParcel(parcel, 0);
_L9:
            if (region == null)
                break MISSING_BLOCK_LABEL_169;
            parcel.writeInt(1);
            region.writeToParcel(parcel, 0);
_L10:
            mRemote.transact(10, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
_L2:
            ibinder = null;
              goto _L7
_L4:
            parcel.writeInt(0);
              goto _L8
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
_L6:
            parcel.writeInt(0);
              goto _L9
            parcel.writeInt(0);
              goto _L10
        }

        public void setTransparentRegion(IWindow iwindow, Region region)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            if (iwindow == null) goto _L2; else goto _L1
_L1:
            IBinder ibinder = iwindow.asBinder();
_L5:
            parcel.writeStrongBinder(ibinder);
            if (region == null) goto _L4; else goto _L3
_L3:
            parcel.writeInt(1);
            region.writeToParcel(parcel, 0);
_L6:
            mRemote.transact(9, parcel, parcel1, 0);
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

        public void setUniverseTransform(IBinder ibinder, float f, float f1, float f2, float f3, float f4, float f5, 
                float f6)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            parcel.writeStrongBinder(ibinder);
            parcel.writeFloat(f);
            parcel.writeFloat(f1);
            parcel.writeFloat(f2);
            parcel.writeFloat(f3);
            parcel.writeFloat(f4);
            parcel.writeFloat(f5);
            parcel.writeFloat(f6);
            mRemote.transact(25, parcel, parcel1, 0);
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

        public void setWallpaperPosition(IBinder ibinder, float f, float f1, float f2, float f3)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            parcel.writeStrongBinder(ibinder);
            parcel.writeFloat(f);
            parcel.writeFloat(f1);
            parcel.writeFloat(f2);
            parcel.writeFloat(f3);
            mRemote.transact(21, parcel, parcel1, 0);
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

        public void wallpaperCommandComplete(IBinder ibinder, Bundle bundle)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            parcel.writeStrongBinder(ibinder);
            if (bundle == null)
                break MISSING_BLOCK_LABEL_66;
            parcel.writeInt(1);
            bundle.writeToParcel(parcel, 0);
_L1:
            mRemote.transact(24, parcel, parcel1, 0);
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

        public void wallpaperOffsetsComplete(IBinder ibinder)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowSession");
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(22, parcel, parcel1, 0);
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

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract int add(IWindow iwindow, int i, WindowManager.LayoutParams layoutparams, int j, Rect rect, InputChannel inputchannel)
        throws RemoteException;

    public abstract int addToDisplay(IWindow iwindow, int i, WindowManager.LayoutParams layoutparams, int j, int k, Rect rect, InputChannel inputchannel)
        throws RemoteException;

    public abstract int addToDisplayWithoutInputChannel(IWindow iwindow, int i, WindowManager.LayoutParams layoutparams, int j, int k, Rect rect)
        throws RemoteException;

    public abstract int addWithoutInputChannel(IWindow iwindow, int i, WindowManager.LayoutParams layoutparams, int j, Rect rect)
        throws RemoteException;

    public abstract void dragRecipientEntered(IWindow iwindow)
        throws RemoteException;

    public abstract void dragRecipientExited(IWindow iwindow)
        throws RemoteException;

    public abstract void finishDrawing(IWindow iwindow)
        throws RemoteException;

    public abstract void getDisplayFrame(IWindow iwindow, Rect rect)
        throws RemoteException;

    public abstract boolean getInTouchMode()
        throws RemoteException;

    public abstract void getYLWindowFrame(IWindow iwindow, Rect rect)
        throws RemoteException;

    public abstract void onRectangleOnScreenRequested(IBinder ibinder, Rect rect, boolean flag)
        throws RemoteException;

    public abstract boolean outOfMemory(IWindow iwindow)
        throws RemoteException;

    public abstract void performDeferredDestroy(IWindow iwindow)
        throws RemoteException;

    public abstract boolean performDrag(IWindow iwindow, IBinder ibinder, float f, float f1, float f2, float f3, ClipData clipdata)
        throws RemoteException;

    public abstract boolean performHapticFeedback(IWindow iwindow, int i, boolean flag)
        throws RemoteException;

    public abstract IBinder prepareDrag(IWindow iwindow, int i, int j, int k, Surface surface)
        throws RemoteException;

    public abstract int relayout(IWindow iwindow, int i, WindowManager.LayoutParams layoutparams, int j, int k, int l, int i1, 
            Rect rect, Rect rect1, Rect rect2, Configuration configuration, Surface surface)
        throws RemoteException;

    public abstract void remove(IWindow iwindow)
        throws RemoteException;

    public abstract void reportDropResult(IWindow iwindow, boolean flag)
        throws RemoteException;

    public abstract Bundle sendWallpaperCommand(IBinder ibinder, String s, int i, int j, int k, Bundle bundle, boolean flag)
        throws RemoteException;

    public abstract void setInTouchMode(boolean flag)
        throws RemoteException;

    public abstract void setInsets(IWindow iwindow, int i, Rect rect, Rect rect1, Region region)
        throws RemoteException;

    public abstract void setTransparentRegion(IWindow iwindow, Region region)
        throws RemoteException;

    public abstract void setUniverseTransform(IBinder ibinder, float f, float f1, float f2, float f3, float f4, float f5, 
            float f6)
        throws RemoteException;

    public abstract void setWallpaperPosition(IBinder ibinder, float f, float f1, float f2, float f3)
        throws RemoteException;

    public abstract void wallpaperCommandComplete(IBinder ibinder, Bundle bundle)
        throws RemoteException;

    public abstract void wallpaperOffsetsComplete(IBinder ibinder)
        throws RemoteException;
}
