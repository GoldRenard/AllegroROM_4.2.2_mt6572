// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.content.res.CompatibilityInfo;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.os.*;
import android.text.TextUtils;
import com.android.internal.view.IInputContext;
import com.android.internal.view.IInputMethodClient;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package android.view:
//            IApplicationToken, IDisplayContentChangeListener, IOnKeyguardExitResult, WindowInfo, 
//            IWindowSession, IInputFilter, IRotationWatcher

public interface IWindowManager
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IWindowManager
    {

        private static final String DESCRIPTOR = "android.view.IWindowManager";
        static final int TRANSACTION_IsImTargetWindowFullScreen = 76;
        static final int TRANSACTION_addAppToken = 16;
        static final int TRANSACTION_addDisplayContentChangeListener = 70;
        static final int TRANSACTION_addWindowToken = 14;
        static final int TRANSACTION_clearForcedDisplayDensity = 9;
        static final int TRANSACTION_clearForcedDisplaySize = 7;
        static final int TRANSACTION_closeSystemDialogs = 47;
        static final int TRANSACTION_disableKeyguard = 40;
        static final int TRANSACTION_dismissKeyguard = 46;
        static final int TRANSACTION_enableGuiLog = 77;
        static final int TRANSACTION_executeAppTransition = 26;
        static final int TRANSACTION_exitKeyguardSecurely = 42;
        static final int TRANSACTION_freezeRotation = 59;
        static final int TRANSACTION_getAnimationScale = 48;
        static final int TRANSACTION_getAnimationScales = 49;
        static final int TRANSACTION_getAppOrientation = 19;
        static final int TRANSACTION_getFocusedWindowToken = 66;
        static final int TRANSACTION_getPendingAppTransition = 22;
        static final int TRANSACTION_getPreferredOptionsPanelGravity = 58;
        static final int TRANSACTION_getRotation = 56;
        static final int TRANSACTION_getVisibleWindowsForDisplay = 73;
        static final int TRANSACTION_getWindowCompatibilityScale = 67;
        static final int TRANSACTION_getWindowInfo = 72;
        static final int TRANSACTION_hasNavigationBar = 64;
        static final int TRANSACTION_hasSystemNavBar = 10;
        static final int TRANSACTION_inKeyguardRestrictedInputMode = 45;
        static final int TRANSACTION_inputMethodClientHasFocus = 5;
        static final int TRANSACTION_isKeyguardLocked = 43;
        static final int TRANSACTION_isKeyguardSecure = 44;
        static final int TRANSACTION_isSafeModeEnabled = 74;
        static final int TRANSACTION_isViewServerRunning = 3;
        static final int TRANSACTION_lockNow = 65;
        static final int TRANSACTION_magnifyDisplay = 69;
        static final int TRANSACTION_moveAppToken = 33;
        static final int TRANSACTION_moveAppTokensToBottom = 35;
        static final int TRANSACTION_moveAppTokensToTop = 34;
        static final int TRANSACTION_openSession = 4;
        static final int TRANSACTION_overridePendingAppTransition = 23;
        static final int TRANSACTION_overridePendingAppTransitionScaleUp = 24;
        static final int TRANSACTION_overridePendingAppTransitionThumb = 25;
        static final int TRANSACTION_pauseKeyDispatching = 11;
        static final int TRANSACTION_prepareAppTransition = 21;
        static final int TRANSACTION_reenableKeyguard = 41;
        static final int TRANSACTION_removeAppToken = 32;
        static final int TRANSACTION_removeDisplayContentChangeListener = 71;
        static final int TRANSACTION_removeWindowToken = 15;
        static final int TRANSACTION_resumeKeyDispatching = 12;
        static final int TRANSACTION_screenshotApplications = 61;
        static final int TRANSACTION_setAnimationScale = 50;
        static final int TRANSACTION_setAnimationScales = 51;
        static final int TRANSACTION_setAppGroupId = 17;
        static final int TRANSACTION_setAppOrientation = 18;
        static final int TRANSACTION_setAppStartingWindow = 27;
        static final int TRANSACTION_setAppVisibility = 29;
        static final int TRANSACTION_setAppWillBeHidden = 28;
        static final int TRANSACTION_setEventDispatching = 13;
        static final int TRANSACTION_setFocusedApp = 20;
        static final int TRANSACTION_setForcedDisplayDensity = 8;
        static final int TRANSACTION_setForcedDisplaySize = 6;
        static final int TRANSACTION_setInTouchMode = 52;
        static final int TRANSACTION_setInputFilter = 68;
        static final int TRANSACTION_setNewConfiguration = 37;
        static final int TRANSACTION_setStrictModeVisualIndicatorPreference = 54;
        static final int TRANSACTION_showAssistant = 75;
        static final int TRANSACTION_showStrictModeViolation = 53;
        static final int TRANSACTION_startAppFreezingScreen = 30;
        static final int TRANSACTION_startFreezingScreen = 38;
        static final int TRANSACTION_startViewServer = 1;
        static final int TRANSACTION_statusBarVisibilityChanged = 62;
        static final int TRANSACTION_stopAppFreezingScreen = 31;
        static final int TRANSACTION_stopFreezingScreen = 39;
        static final int TRANSACTION_stopViewServer = 2;
        static final int TRANSACTION_thawRotation = 60;
        static final int TRANSACTION_updateOrientationFromAppTokens = 36;
        static final int TRANSACTION_updateRotation = 55;
        static final int TRANSACTION_waitForWindowDrawn = 63;
        static final int TRANSACTION_watchRotation = 57;

        public static IWindowManager asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.view.IWindowManager");
            if (iinterface != null && (iinterface instanceof IWindowManager))
                return (IWindowManager)iinterface;
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
            case 77: // 'M'
                parcel.enforceInterface("android.view.IWindowManager");
                boolean flag25;
                if (parcel.readInt() != 0)
                    flag25 = true;
                else
                    flag25 = false;
                boolean flag26 = enableGuiLog(flag25);
                parcel1.writeNoException();
                int l7;
                if (flag26)
                    l7 = 1;
                else
                    l7 = 0;
                parcel1.writeInt(l7);
                return true;

            case 76: // 'L'
                parcel.enforceInterface("android.view.IWindowManager");
                boolean flag24 = IsImTargetWindowFullScreen();
                parcel1.writeNoException();
                int k7;
                if (flag24)
                    k7 = 1;
                else
                    k7 = 0;
                parcel1.writeInt(k7);
                return true;

            case 75: // 'K'
                parcel.enforceInterface("android.view.IWindowManager");
                showAssistant();
                parcel1.writeNoException();
                return true;

            case 74: // 'J'
                parcel.enforceInterface("android.view.IWindowManager");
                boolean flag23 = isSafeModeEnabled();
                parcel1.writeNoException();
                int j7;
                if (flag23)
                    j7 = 1;
                else
                    j7 = 0;
                parcel1.writeInt(j7);
                return true;

            case 73: // 'I'
                parcel.enforceInterface("android.view.IWindowManager");
                int i7 = parcel.readInt();
                ArrayList arraylist = new ArrayList();
                getVisibleWindowsForDisplay(i7, arraylist);
                parcel1.writeNoException();
                parcel1.writeTypedList(arraylist);
                return true;

            case 72: // 'H'
                parcel.enforceInterface("android.view.IWindowManager");
                WindowInfo windowinfo = getWindowInfo(parcel.readStrongBinder());
                parcel1.writeNoException();
                if (windowinfo != null)
                {
                    parcel1.writeInt(1);
                    windowinfo.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                return true;

            case 71: // 'G'
                parcel.enforceInterface("android.view.IWindowManager");
                removeDisplayContentChangeListener(parcel.readInt(), IDisplayContentChangeListener.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                return true;

            case 70: // 'F'
                parcel.enforceInterface("android.view.IWindowManager");
                addDisplayContentChangeListener(parcel.readInt(), IDisplayContentChangeListener.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                return true;

            case 69: // 'E'
                parcel.enforceInterface("android.view.IWindowManager");
                magnifyDisplay(parcel.readInt(), parcel.readFloat(), parcel.readFloat(), parcel.readFloat());
                parcel1.writeNoException();
                return true;

            case 68: // 'D'
                parcel.enforceInterface("android.view.IWindowManager");
                setInputFilter(IInputFilter.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                return true;

            case 67: // 'C'
                parcel.enforceInterface("android.view.IWindowManager");
                float f1 = getWindowCompatibilityScale(parcel.readStrongBinder());
                parcel1.writeNoException();
                parcel1.writeFloat(f1);
                return true;

            case 66: // 'B'
                parcel.enforceInterface("android.view.IWindowManager");
                IBinder ibinder6 = getFocusedWindowToken();
                parcel1.writeNoException();
                parcel1.writeStrongBinder(ibinder6);
                return true;

            case 65: // 'A'
                parcel.enforceInterface("android.view.IWindowManager");
                Bundle bundle;
                if (parcel.readInt() != 0)
                    bundle = (Bundle)Bundle.CREATOR.createFromParcel(parcel);
                else
                    bundle = null;
                lockNow(bundle);
                parcel1.writeNoException();
                return true;

            case 64: // '@'
                parcel.enforceInterface("android.view.IWindowManager");
                boolean flag22 = hasNavigationBar();
                parcel1.writeNoException();
                int l6;
                if (flag22)
                    l6 = 1;
                else
                    l6 = 0;
                parcel1.writeInt(l6);
                return true;

            case 63: // '?'
                parcel.enforceInterface("android.view.IWindowManager");
                boolean flag21 = waitForWindowDrawn(parcel.readStrongBinder(), android.os.IRemoteCallback.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                int k6;
                if (flag21)
                    k6 = 1;
                else
                    k6 = 0;
                parcel1.writeInt(k6);
                return true;

            case 62: // '>'
                parcel.enforceInterface("android.view.IWindowManager");
                statusBarVisibilityChanged(parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 61: // '='
                parcel.enforceInterface("android.view.IWindowManager");
                Bitmap bitmap1 = screenshotApplications(parcel.readStrongBinder(), parcel.readInt(), parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                if (bitmap1 != null)
                {
                    parcel1.writeInt(1);
                    bitmap1.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                return true;

            case 60: // '<'
                parcel.enforceInterface("android.view.IWindowManager");
                thawRotation();
                parcel1.writeNoException();
                return true;

            case 59: // ';'
                parcel.enforceInterface("android.view.IWindowManager");
                freezeRotation(parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 58: // ':'
                parcel.enforceInterface("android.view.IWindowManager");
                int j6 = getPreferredOptionsPanelGravity();
                parcel1.writeNoException();
                parcel1.writeInt(j6);
                return true;

            case 57: // '9'
                parcel.enforceInterface("android.view.IWindowManager");
                int i6 = watchRotation(IRotationWatcher.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                parcel1.writeInt(i6);
                return true;

            case 56: // '8'
                parcel.enforceInterface("android.view.IWindowManager");
                int l5 = getRotation();
                parcel1.writeNoException();
                parcel1.writeInt(l5);
                return true;

            case 55: // '7'
                parcel.enforceInterface("android.view.IWindowManager");
                boolean flag19;
                if (parcel.readInt() != 0)
                    flag19 = true;
                else
                    flag19 = false;
                boolean flag20;
                if (parcel.readInt() != 0)
                    flag20 = true;
                else
                    flag20 = false;
                updateRotation(flag19, flag20);
                parcel1.writeNoException();
                return true;

            case 54: // '6'
                parcel.enforceInterface("android.view.IWindowManager");
                setStrictModeVisualIndicatorPreference(parcel.readString());
                parcel1.writeNoException();
                return true;

            case 53: // '5'
                parcel.enforceInterface("android.view.IWindowManager");
                boolean flag18;
                if (parcel.readInt() != 0)
                    flag18 = true;
                else
                    flag18 = false;
                showStrictModeViolation(flag18);
                parcel1.writeNoException();
                return true;

            case 52: // '4'
                parcel.enforceInterface("android.view.IWindowManager");
                boolean flag17;
                if (parcel.readInt() != 0)
                    flag17 = true;
                else
                    flag17 = false;
                setInTouchMode(flag17);
                parcel1.writeNoException();
                return true;

            case 51: // '3'
                parcel.enforceInterface("android.view.IWindowManager");
                setAnimationScales(parcel.createFloatArray());
                parcel1.writeNoException();
                return true;

            case 50: // '2'
                parcel.enforceInterface("android.view.IWindowManager");
                setAnimationScale(parcel.readInt(), parcel.readFloat());
                parcel1.writeNoException();
                return true;

            case 49: // '1'
                parcel.enforceInterface("android.view.IWindowManager");
                float af[] = getAnimationScales();
                parcel1.writeNoException();
                parcel1.writeFloatArray(af);
                return true;

            case 48: // '0'
                parcel.enforceInterface("android.view.IWindowManager");
                float f = getAnimationScale(parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeFloat(f);
                return true;

            case 47: // '/'
                parcel.enforceInterface("android.view.IWindowManager");
                closeSystemDialogs(parcel.readString());
                parcel1.writeNoException();
                return true;

            case 46: // '.'
                parcel.enforceInterface("android.view.IWindowManager");
                dismissKeyguard();
                parcel1.writeNoException();
                return true;

            case 45: // '-'
                parcel.enforceInterface("android.view.IWindowManager");
                boolean flag16 = inKeyguardRestrictedInputMode();
                parcel1.writeNoException();
                int k5;
                if (flag16)
                    k5 = 1;
                else
                    k5 = 0;
                parcel1.writeInt(k5);
                return true;

            case 44: // ','
                parcel.enforceInterface("android.view.IWindowManager");
                boolean flag15 = isKeyguardSecure();
                parcel1.writeNoException();
                int j5;
                if (flag15)
                    j5 = 1;
                else
                    j5 = 0;
                parcel1.writeInt(j5);
                return true;

            case 43: // '+'
                parcel.enforceInterface("android.view.IWindowManager");
                boolean flag14 = isKeyguardLocked();
                parcel1.writeNoException();
                int i5;
                if (flag14)
                    i5 = 1;
                else
                    i5 = 0;
                parcel1.writeInt(i5);
                return true;

            case 42: // '*'
                parcel.enforceInterface("android.view.IWindowManager");
                exitKeyguardSecurely(IOnKeyguardExitResult.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                return true;

            case 41: // ')'
                parcel.enforceInterface("android.view.IWindowManager");
                reenableKeyguard(parcel.readStrongBinder());
                parcel1.writeNoException();
                return true;

            case 40: // '('
                parcel.enforceInterface("android.view.IWindowManager");
                disableKeyguard(parcel.readStrongBinder(), parcel.readString());
                parcel1.writeNoException();
                return true;

            case 39: // '\''
                parcel.enforceInterface("android.view.IWindowManager");
                stopFreezingScreen();
                parcel1.writeNoException();
                return true;

            case 38: // '&'
                parcel.enforceInterface("android.view.IWindowManager");
                startFreezingScreen(parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 37: // '%'
                parcel.enforceInterface("android.view.IWindowManager");
                Configuration configuration2;
                if (parcel.readInt() != 0)
                    configuration2 = (Configuration)Configuration.CREATOR.createFromParcel(parcel);
                else
                    configuration2 = null;
                setNewConfiguration(configuration2);
                parcel1.writeNoException();
                return true;

            case 36: // '$'
                parcel.enforceInterface("android.view.IWindowManager");
                Configuration configuration;
                if (parcel.readInt() != 0)
                    configuration = (Configuration)Configuration.CREATOR.createFromParcel(parcel);
                else
                    configuration = null;
                Configuration configuration1 = updateOrientationFromAppTokens(configuration, parcel.readStrongBinder());
                parcel1.writeNoException();
                if (configuration1 != null)
                {
                    parcel1.writeInt(1);
                    configuration1.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                return true;

            case 35: // '#'
                parcel.enforceInterface("android.view.IWindowManager");
                moveAppTokensToBottom(parcel.createBinderArrayList());
                parcel1.writeNoException();
                return true;

            case 34: // '"'
                parcel.enforceInterface("android.view.IWindowManager");
                moveAppTokensToTop(parcel.createBinderArrayList());
                parcel1.writeNoException();
                return true;

            case 33: // '!'
                parcel.enforceInterface("android.view.IWindowManager");
                moveAppToken(parcel.readInt(), parcel.readStrongBinder());
                parcel1.writeNoException();
                return true;

            case 32: // ' '
                parcel.enforceInterface("android.view.IWindowManager");
                removeAppToken(parcel.readStrongBinder());
                parcel1.writeNoException();
                return true;

            case 31: // '\037'
                parcel.enforceInterface("android.view.IWindowManager");
                IBinder ibinder5 = parcel.readStrongBinder();
                boolean flag13;
                if (parcel.readInt() != 0)
                    flag13 = true;
                else
                    flag13 = false;
                stopAppFreezingScreen(ibinder5, flag13);
                parcel1.writeNoException();
                return true;

            case 30: // '\036'
                parcel.enforceInterface("android.view.IWindowManager");
                startAppFreezingScreen(parcel.readStrongBinder(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 29: // '\035'
                parcel.enforceInterface("android.view.IWindowManager");
                IBinder ibinder4 = parcel.readStrongBinder();
                boolean flag12;
                if (parcel.readInt() != 0)
                    flag12 = true;
                else
                    flag12 = false;
                setAppVisibility(ibinder4, flag12);
                parcel1.writeNoException();
                return true;

            case 28: // '\034'
                parcel.enforceInterface("android.view.IWindowManager");
                setAppWillBeHidden(parcel.readStrongBinder());
                parcel1.writeNoException();
                return true;

            case 27: // '\033'
                parcel.enforceInterface("android.view.IWindowManager");
                IBinder ibinder2 = parcel.readStrongBinder();
                String s = parcel.readString();
                int i4 = parcel.readInt();
                CompatibilityInfo compatibilityinfo;
                if (parcel.readInt() != 0)
                    compatibilityinfo = (CompatibilityInfo)CompatibilityInfo.CREATOR.createFromParcel(parcel);
                else
                    compatibilityinfo = null;
                CharSequence charsequence;
                if (parcel.readInt() != 0)
                    charsequence = (CharSequence)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
                else
                    charsequence = null;
                int j4 = parcel.readInt();
                int k4 = parcel.readInt();
                int l4 = parcel.readInt();
                IBinder ibinder3 = parcel.readStrongBinder();
                boolean flag11;
                if (parcel.readInt() != 0)
                    flag11 = true;
                else
                    flag11 = false;
                setAppStartingWindow(ibinder2, s, i4, compatibilityinfo, charsequence, j4, k4, l4, ibinder3, flag11);
                parcel1.writeNoException();
                return true;

            case 26: // '\032'
                parcel.enforceInterface("android.view.IWindowManager");
                executeAppTransition();
                parcel1.writeNoException();
                return true;

            case 25: // '\031'
                parcel.enforceInterface("android.view.IWindowManager");
                Bitmap bitmap;
                if (parcel.readInt() != 0)
                    bitmap = (Bitmap)Bitmap.CREATOR.createFromParcel(parcel);
                else
                    bitmap = null;
                int k3 = parcel.readInt();
                int l3 = parcel.readInt();
                IRemoteCallback iremotecallback = android.os.IRemoteCallback.Stub.asInterface(parcel.readStrongBinder());
                boolean flag10;
                if (parcel.readInt() != 0)
                    flag10 = true;
                else
                    flag10 = false;
                overridePendingAppTransitionThumb(bitmap, k3, l3, iremotecallback, flag10);
                parcel1.writeNoException();
                return true;

            case 24: // '\030'
                parcel.enforceInterface("android.view.IWindowManager");
                overridePendingAppTransitionScaleUp(parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 23: // '\027'
                parcel.enforceInterface("android.view.IWindowManager");
                overridePendingAppTransition(parcel.readString(), parcel.readInt(), parcel.readInt(), android.os.IRemoteCallback.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                return true;

            case 22: // '\026'
                parcel.enforceInterface("android.view.IWindowManager");
                int j3 = getPendingAppTransition();
                parcel1.writeNoException();
                parcel1.writeInt(j3);
                return true;

            case 21: // '\025'
                parcel.enforceInterface("android.view.IWindowManager");
                int i3 = parcel.readInt();
                boolean flag9;
                if (parcel.readInt() != 0)
                    flag9 = true;
                else
                    flag9 = false;
                prepareAppTransition(i3, flag9);
                parcel1.writeNoException();
                return true;

            case 20: // '\024'
                parcel.enforceInterface("android.view.IWindowManager");
                IBinder ibinder1 = parcel.readStrongBinder();
                boolean flag8;
                if (parcel.readInt() != 0)
                    flag8 = true;
                else
                    flag8 = false;
                setFocusedApp(ibinder1, flag8);
                parcel1.writeNoException();
                return true;

            case 19: // '\023'
                parcel.enforceInterface("android.view.IWindowManager");
                int l2 = getAppOrientation(IApplicationToken.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                parcel1.writeInt(l2);
                return true;

            case 18: // '\022'
                parcel.enforceInterface("android.view.IWindowManager");
                setAppOrientation(IApplicationToken.Stub.asInterface(parcel.readStrongBinder()), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 17: // '\021'
                parcel.enforceInterface("android.view.IWindowManager");
                setAppGroupId(parcel.readStrongBinder(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 16: // '\020'
                parcel.enforceInterface("android.view.IWindowManager");
                int l1 = parcel.readInt();
                int i2 = parcel.readInt();
                IApplicationToken iapplicationtoken = IApplicationToken.Stub.asInterface(parcel.readStrongBinder());
                int j2 = parcel.readInt();
                int k2 = parcel.readInt();
                boolean flag6;
                if (parcel.readInt() != 0)
                    flag6 = true;
                else
                    flag6 = false;
                boolean flag7;
                if (parcel.readInt() != 0)
                    flag7 = true;
                else
                    flag7 = false;
                addAppToken(l1, i2, iapplicationtoken, j2, k2, flag6, flag7);
                parcel1.writeNoException();
                return true;

            case 15: // '\017'
                parcel.enforceInterface("android.view.IWindowManager");
                removeWindowToken(parcel.readStrongBinder());
                parcel1.writeNoException();
                return true;

            case 14: // '\016'
                parcel.enforceInterface("android.view.IWindowManager");
                addWindowToken(parcel.readStrongBinder(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 13: // '\r'
                parcel.enforceInterface("android.view.IWindowManager");
                boolean flag5;
                if (parcel.readInt() != 0)
                    flag5 = true;
                else
                    flag5 = false;
                setEventDispatching(flag5);
                parcel1.writeNoException();
                return true;

            case 12: // '\f'
                parcel.enforceInterface("android.view.IWindowManager");
                resumeKeyDispatching(parcel.readStrongBinder());
                parcel1.writeNoException();
                return true;

            case 11: // '\013'
                parcel.enforceInterface("android.view.IWindowManager");
                pauseKeyDispatching(parcel.readStrongBinder());
                parcel1.writeNoException();
                return true;

            case 10: // '\n'
                parcel.enforceInterface("android.view.IWindowManager");
                boolean flag4 = hasSystemNavBar();
                parcel1.writeNoException();
                int k1;
                if (flag4)
                    k1 = 1;
                else
                    k1 = 0;
                parcel1.writeInt(k1);
                return true;

            case 9: // '\t'
                parcel.enforceInterface("android.view.IWindowManager");
                clearForcedDisplayDensity(parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 8: // '\b'
                parcel.enforceInterface("android.view.IWindowManager");
                setForcedDisplayDensity(parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 7: // '\007'
                parcel.enforceInterface("android.view.IWindowManager");
                clearForcedDisplaySize(parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 6: // '\006'
                parcel.enforceInterface("android.view.IWindowManager");
                setForcedDisplaySize(parcel.readInt(), parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 5: // '\005'
                parcel.enforceInterface("android.view.IWindowManager");
                boolean flag3 = inputMethodClientHasFocus(com.android.internal.view.IInputMethodClient.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                int j1;
                if (flag3)
                    j1 = 1;
                else
                    j1 = 0;
                parcel1.writeInt(j1);
                return true;

            case 4: // '\004'
                parcel.enforceInterface("android.view.IWindowManager");
                IWindowSession iwindowsession = openSession(com.android.internal.view.IInputMethodClient.Stub.asInterface(parcel.readStrongBinder()), com.android.internal.view.IInputContext.Stub.asInterface(parcel.readStrongBinder()));
                parcel1.writeNoException();
                IBinder ibinder;
                if (iwindowsession != null)
                    ibinder = iwindowsession.asBinder();
                else
                    ibinder = null;
                parcel1.writeStrongBinder(ibinder);
                return true;

            case 3: // '\003'
                parcel.enforceInterface("android.view.IWindowManager");
                boolean flag2 = isViewServerRunning();
                parcel1.writeNoException();
                int i1;
                if (flag2)
                    i1 = 1;
                else
                    i1 = 0;
                parcel1.writeInt(i1);
                return true;

            case 2: // '\002'
                parcel.enforceInterface("android.view.IWindowManager");
                boolean flag1 = stopViewServer();
                parcel1.writeNoException();
                int l;
                if (flag1)
                    l = 1;
                else
                    l = 0;
                parcel1.writeInt(l);
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.view.IWindowManager");
                boolean flag = startViewServer(parcel.readInt());
                parcel1.writeNoException();
                int k;
                if (flag)
                    k = 1;
                else
                    k = 0;
                parcel1.writeInt(k);
                return true;

            case 1598968902: 
                parcel1.writeString("android.view.IWindowManager");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.view.IWindowManager");
        }
    }

    private static class Stub.Proxy
        implements IWindowManager
    {

        private IBinder mRemote;

        public boolean IsImTargetWindowFullScreen()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(76, parcel, parcel1, 0);
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

        public void addAppToken(int i, int j, IApplicationToken iapplicationtoken, int k, int l, boolean flag, boolean flag1)
            throws RemoteException
        {
            int i1;
            Parcel parcel;
            Parcel parcel1;
            i1 = 1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeInt(i);
            parcel.writeInt(j);
            if (iapplicationtoken == null)
                break MISSING_BLOCK_LABEL_126;
            IBinder ibinder = iapplicationtoken.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(k);
            parcel.writeInt(l);
            int j1;
            if (flag)
                j1 = i1;
            else
                j1 = 0;
            parcel.writeInt(j1);
            if (!flag1)
                i1 = 0;
            parcel.writeInt(i1);
            mRemote.transact(16, parcel, parcel1, 0);
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

        public void addDisplayContentChangeListener(int i, IDisplayContentChangeListener idisplaycontentchangelistener)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeInt(i);
            if (idisplaycontentchangelistener == null)
                break MISSING_BLOCK_LABEL_69;
            IBinder ibinder = idisplaycontentchangelistener.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(70, parcel, parcel1, 0);
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

        public void addWindowToken(IBinder ibinder, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(i);
            mRemote.transact(14, parcel, parcel1, 0);
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

        public IBinder asBinder()
        {
            return mRemote;
        }

        public void clearForcedDisplayDensity(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeInt(i);
            mRemote.transact(9, parcel, parcel1, 0);
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

        public void clearForcedDisplaySize(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeInt(i);
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

        public void closeSystemDialogs(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeString(s);
            mRemote.transact(47, parcel, parcel1, 0);
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

        public void disableKeyguard(IBinder ibinder, String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeStrongBinder(ibinder);
            parcel.writeString(s);
            mRemote.transact(40, parcel, parcel1, 0);
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

        public void dismissKeyguard()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(46, parcel, parcel1, 0);
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

        public boolean enableGuiLog(boolean flag)
            throws RemoteException
        {
            boolean flag1;
            Parcel parcel;
            Parcel parcel1;
            flag1 = true;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            int i;
            int j;
            if (flag)
                i = ((flag1) ? 1 : 0);
            else
                i = 0;
            parcel.writeInt(i);
            mRemote.transact(77, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            if (j == 0)
                flag1 = false;
            parcel1.recycle();
            parcel.recycle();
            return flag1;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void executeAppTransition()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(26, parcel, parcel1, 0);
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

        public void exitKeyguardSecurely(IOnKeyguardExitResult ionkeyguardexitresult)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            if (ionkeyguardexitresult == null)
                break MISSING_BLOCK_LABEL_60;
            IBinder ibinder = ionkeyguardexitresult.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(42, parcel, parcel1, 0);
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

        public void freezeRotation(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeInt(i);
            mRemote.transact(59, parcel, parcel1, 0);
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

        public float getAnimationScale(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            float f;
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeInt(i);
            mRemote.transact(48, parcel, parcel1, 0);
            parcel1.readException();
            f = parcel1.readFloat();
            parcel1.recycle();
            parcel.recycle();
            return f;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public float[] getAnimationScales()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            float af[];
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(49, parcel, parcel1, 0);
            parcel1.readException();
            af = parcel1.createFloatArray();
            parcel1.recycle();
            parcel.recycle();
            return af;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int getAppOrientation(IApplicationToken iapplicationtoken)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            if (iapplicationtoken == null)
                break MISSING_BLOCK_LABEL_68;
            IBinder ibinder = iapplicationtoken.asBinder();
_L1:
            int i;
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(19, parcel, parcel1, 0);
            parcel1.readException();
            i = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return i;
            ibinder = null;
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public IBinder getFocusedWindowToken()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            IBinder ibinder;
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(66, parcel, parcel1, 0);
            parcel1.readException();
            ibinder = parcel1.readStrongBinder();
            parcel1.recycle();
            parcel.recycle();
            return ibinder;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public String getInterfaceDescriptor()
        {
            return "android.view.IWindowManager";
        }

        public int getPendingAppTransition()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(22, parcel, parcel1, 0);
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

        public int getPreferredOptionsPanelGravity()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(58, parcel, parcel1, 0);
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

        public int getRotation()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(56, parcel, parcel1, 0);
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

        public void getVisibleWindowsForDisplay(int i, List list)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeInt(i);
            mRemote.transact(73, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.readTypedList(list, WindowInfo.CREATOR);
            parcel1.recycle();
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public float getWindowCompatibilityScale(IBinder ibinder)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            float f;
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(67, parcel, parcel1, 0);
            parcel1.readException();
            f = parcel1.readFloat();
            parcel1.recycle();
            parcel.recycle();
            return f;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public WindowInfo getWindowInfo(IBinder ibinder)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(72, parcel, parcel1, 0);
            parcel1.readException();
            if (parcel1.readInt() == 0) goto _L2; else goto _L1
_L1:
            WindowInfo windowinfo = (WindowInfo)WindowInfo.CREATOR.createFromParcel(parcel1);
_L4:
            parcel1.recycle();
            parcel.recycle();
            return windowinfo;
_L2:
            windowinfo = null;
            if (true) goto _L4; else goto _L3
_L3:
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public boolean hasNavigationBar()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(64, parcel, parcel1, 0);
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

        public boolean hasSystemNavBar()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(10, parcel, parcel1, 0);
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

        public boolean inKeyguardRestrictedInputMode()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(45, parcel, parcel1, 0);
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

        public boolean inputMethodClientHasFocus(IInputMethodClient iinputmethodclient)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            if (iinputmethodclient == null)
                break MISSING_BLOCK_LABEL_78;
            IBinder ibinder = iinputmethodclient.asBinder();
_L1:
            int i;
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(5, parcel, parcel1, 0);
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

        public boolean isKeyguardLocked()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(43, parcel, parcel1, 0);
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

        public boolean isKeyguardSecure()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(44, parcel, parcel1, 0);
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

        public boolean isSafeModeEnabled()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(74, parcel, parcel1, 0);
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

        public boolean isViewServerRunning()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(3, parcel, parcel1, 0);
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

        public void lockNow(Bundle bundle)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            if (bundle == null)
                break MISSING_BLOCK_LABEL_57;
            parcel.writeInt(1);
            bundle.writeToParcel(parcel, 0);
_L1:
            mRemote.transact(65, parcel, parcel1, 0);
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

        public void magnifyDisplay(int i, float f, float f1, float f2)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeInt(i);
            parcel.writeFloat(f);
            parcel.writeFloat(f1);
            parcel.writeFloat(f2);
            mRemote.transact(69, parcel, parcel1, 0);
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

        public void moveAppToken(int i, IBinder ibinder)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeInt(i);
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(33, parcel, parcel1, 0);
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

        public void moveAppTokensToBottom(List list)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeBinderList(list);
            mRemote.transact(35, parcel, parcel1, 0);
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

        public void moveAppTokensToTop(List list)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeBinderList(list);
            mRemote.transact(34, parcel, parcel1, 0);
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

        public IWindowSession openSession(IInputMethodClient iinputmethodclient, IInputContext iinputcontext)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            if (iinputmethodclient == null)
                break MISSING_BLOCK_LABEL_96;
            IBinder ibinder = iinputmethodclient.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            IBinder ibinder1;
            ibinder1 = null;
            if (iinputcontext == null)
                break MISSING_BLOCK_LABEL_48;
            ibinder1 = iinputcontext.asBinder();
            IWindowSession iwindowsession;
            parcel.writeStrongBinder(ibinder1);
            mRemote.transact(4, parcel, parcel1, 0);
            parcel1.readException();
            iwindowsession = IWindowSession.Stub.asInterface(parcel1.readStrongBinder());
            parcel1.recycle();
            parcel.recycle();
            return iwindowsession;
            ibinder = null;
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void overridePendingAppTransition(String s, int i, int j, IRemoteCallback iremotecallback)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeString(s);
            parcel.writeInt(i);
            parcel.writeInt(j);
            if (iremotecallback == null)
                break MISSING_BLOCK_LABEL_89;
            IBinder ibinder = iremotecallback.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(23, parcel, parcel1, 0);
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

        public void overridePendingAppTransitionScaleUp(int i, int j, int k, int l)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeInt(i);
            parcel.writeInt(j);
            parcel.writeInt(k);
            parcel.writeInt(l);
            mRemote.transact(24, parcel, parcel1, 0);
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

        public void overridePendingAppTransitionThumb(Bitmap bitmap, int i, int j, IRemoteCallback iremotecallback, boolean flag)
            throws RemoteException
        {
            int k;
            Parcel parcel;
            Parcel parcel1;
            k = 1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            if (bitmap == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            bitmap.writeToParcel(parcel, 0);
_L3:
            parcel.writeInt(i);
            parcel.writeInt(j);
            if (iremotecallback == null)
                break MISSING_BLOCK_LABEL_139;
            IBinder ibinder = iremotecallback.asBinder();
_L4:
            parcel.writeStrongBinder(ibinder);
            Exception exception;
            if (!flag)
                k = 0;
            parcel.writeInt(k);
            mRemote.transact(25, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
_L2:
            parcel.writeInt(0);
              goto _L3
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
            ibinder = null;
              goto _L4
        }

        public void pauseKeyDispatching(IBinder ibinder)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(11, parcel, parcel1, 0);
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

        public void prepareAppTransition(int i, boolean flag)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeInt(i);
            int j;
            j = 0;
            if (flag)
                j = 1;
            parcel.writeInt(j);
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

        public void reenableKeyguard(IBinder ibinder)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(41, parcel, parcel1, 0);
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

        public void removeAppToken(IBinder ibinder)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(32, parcel, parcel1, 0);
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

        public void removeDisplayContentChangeListener(int i, IDisplayContentChangeListener idisplaycontentchangelistener)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeInt(i);
            if (idisplaycontentchangelistener == null)
                break MISSING_BLOCK_LABEL_69;
            IBinder ibinder = idisplaycontentchangelistener.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(71, parcel, parcel1, 0);
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

        public void removeWindowToken(IBinder ibinder)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(15, parcel, parcel1, 0);
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

        public void resumeKeyDispatching(IBinder ibinder)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(12, parcel, parcel1, 0);
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

        public Bitmap screenshotApplications(IBinder ibinder, int i, int j, int k)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(i);
            parcel.writeInt(j);
            parcel.writeInt(k);
            mRemote.transact(61, parcel, parcel1, 0);
            parcel1.readException();
            if (parcel1.readInt() == 0) goto _L2; else goto _L1
_L1:
            Bitmap bitmap = (Bitmap)Bitmap.CREATOR.createFromParcel(parcel1);
_L4:
            parcel1.recycle();
            parcel.recycle();
            return bitmap;
_L2:
            bitmap = null;
            if (true) goto _L4; else goto _L3
_L3:
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void setAnimationScale(int i, float f)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeInt(i);
            parcel.writeFloat(f);
            mRemote.transact(50, parcel, parcel1, 0);
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

        public void setAnimationScales(float af[])
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeFloatArray(af);
            mRemote.transact(51, parcel, parcel1, 0);
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

        public void setAppGroupId(IBinder ibinder, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(i);
            mRemote.transact(17, parcel, parcel1, 0);
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

        public void setAppOrientation(IApplicationToken iapplicationtoken, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            if (iapplicationtoken == null)
                break MISSING_BLOCK_LABEL_69;
            IBinder ibinder = iapplicationtoken.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
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

        public void setAppStartingWindow(IBinder ibinder, String s, int i, CompatibilityInfo compatibilityinfo, CharSequence charsequence, int j, int k, 
                int l, IBinder ibinder1, boolean flag)
            throws RemoteException
        {
            int i1;
            Parcel parcel;
            Parcel parcel1;
            i1 = 1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeStrongBinder(ibinder);
            parcel.writeString(s);
            parcel.writeInt(i);
            if (compatibilityinfo == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            compatibilityinfo.writeToParcel(parcel, 0);
_L3:
            if (charsequence == null)
                break MISSING_BLOCK_LABEL_173;
            parcel.writeInt(1);
            TextUtils.writeToParcel(charsequence, parcel, 0);
_L4:
            parcel.writeInt(j);
            parcel.writeInt(k);
            parcel.writeInt(l);
            parcel.writeStrongBinder(ibinder1);
            Exception exception;
            if (!flag)
                i1 = 0;
            parcel.writeInt(i1);
            mRemote.transact(27, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
_L2:
            parcel.writeInt(0);
              goto _L3
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
            parcel.writeInt(0);
              goto _L4
        }

        public void setAppVisibility(IBinder ibinder, boolean flag)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeStrongBinder(ibinder);
            int i;
            i = 0;
            if (flag)
                i = 1;
            parcel.writeInt(i);
            mRemote.transact(29, parcel, parcel1, 0);
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

        public void setAppWillBeHidden(IBinder ibinder)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(28, parcel, parcel1, 0);
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

        public void setEventDispatching(boolean flag)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
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

        public void setFocusedApp(IBinder ibinder, boolean flag)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeStrongBinder(ibinder);
            int i;
            i = 0;
            if (flag)
                i = 1;
            parcel.writeInt(i);
            mRemote.transact(20, parcel, parcel1, 0);
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

        public void setForcedDisplayDensity(int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(8, parcel, parcel1, 0);
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

        public void setForcedDisplaySize(int i, int j, int k)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeInt(i);
            parcel.writeInt(j);
            parcel.writeInt(k);
            mRemote.transact(6, parcel, parcel1, 0);
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

        public void setInTouchMode(boolean flag)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            int i;
            i = 0;
            if (flag)
                i = 1;
            parcel.writeInt(i);
            mRemote.transact(52, parcel, parcel1, 0);
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

        public void setInputFilter(IInputFilter iinputfilter)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            if (iinputfilter == null)
                break MISSING_BLOCK_LABEL_60;
            IBinder ibinder = iinputfilter.asBinder();
_L1:
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(68, parcel, parcel1, 0);
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

        public void setNewConfiguration(Configuration configuration)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            if (configuration == null)
                break MISSING_BLOCK_LABEL_57;
            parcel.writeInt(1);
            configuration.writeToParcel(parcel, 0);
_L1:
            mRemote.transact(37, parcel, parcel1, 0);
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

        public void setStrictModeVisualIndicatorPreference(String s)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeString(s);
            mRemote.transact(54, parcel, parcel1, 0);
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

        public void showAssistant()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(75, parcel, parcel1, 0);
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

        public void showStrictModeViolation(boolean flag)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            int i;
            i = 0;
            if (flag)
                i = 1;
            parcel.writeInt(i);
            mRemote.transact(53, parcel, parcel1, 0);
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

        public void startAppFreezingScreen(IBinder ibinder, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeStrongBinder(ibinder);
            parcel.writeInt(i);
            mRemote.transact(30, parcel, parcel1, 0);
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

        public void startFreezingScreen(int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(38, parcel, parcel1, 0);
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

        public boolean startViewServer(int i)
            throws RemoteException
        {
            boolean flag;
            Parcel parcel;
            Parcel parcel1;
            flag = true;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int j;
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeInt(i);
            mRemote.transact(1, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            if (j == 0)
                flag = false;
            parcel1.recycle();
            parcel.recycle();
            return flag;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void statusBarVisibilityChanged(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeInt(i);
            mRemote.transact(62, parcel, parcel1, 0);
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

        public void stopAppFreezingScreen(IBinder ibinder, boolean flag)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeStrongBinder(ibinder);
            int i;
            i = 0;
            if (flag)
                i = 1;
            parcel.writeInt(i);
            mRemote.transact(31, parcel, parcel1, 0);
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

        public void stopFreezingScreen()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(39, parcel, parcel1, 0);
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

        public boolean stopViewServer()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int i;
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(2, parcel, parcel1, 0);
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

        public void thawRotation()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            mRemote.transact(60, parcel, parcel1, 0);
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

        public Configuration updateOrientationFromAppTokens(Configuration configuration, IBinder ibinder)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            if (configuration == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            configuration.writeToParcel(parcel, 0);
_L3:
            Configuration configuration1;
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(36, parcel, parcel1, 0);
            parcel1.readException();
            if (parcel1.readInt() == 0)
                break MISSING_BLOCK_LABEL_113;
            configuration1 = (Configuration)Configuration.CREATOR.createFromParcel(parcel1);
_L4:
            parcel1.recycle();
            parcel.recycle();
            return configuration1;
_L2:
            parcel.writeInt(0);
              goto _L3
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
            configuration1 = null;
              goto _L4
        }

        public void updateRotation(boolean flag, boolean flag1)
            throws RemoteException
        {
            int i;
            Parcel parcel;
            Parcel parcel1;
            i = 1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            int j;
            if (flag)
                j = i;
            else
                j = 0;
            parcel.writeInt(j);
            if (!flag1)
                i = 0;
            parcel.writeInt(i);
            mRemote.transact(55, parcel, parcel1, 0);
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

        public boolean waitForWindowDrawn(IBinder ibinder, IRemoteCallback iremotecallback)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            parcel.writeStrongBinder(ibinder);
            if (iremotecallback == null)
                break MISSING_BLOCK_LABEL_89;
            IBinder ibinder1 = iremotecallback.asBinder();
_L1:
            int i;
            parcel.writeStrongBinder(ibinder1);
            mRemote.transact(63, parcel, parcel1, 0);
            parcel1.readException();
            i = parcel1.readInt();
            boolean flag = false;
            if (i != 0)
                flag = true;
            parcel1.recycle();
            parcel.recycle();
            return flag;
            ibinder1 = null;
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int watchRotation(IRotationWatcher irotationwatcher)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.view.IWindowManager");
            if (irotationwatcher == null)
                break MISSING_BLOCK_LABEL_68;
            IBinder ibinder = irotationwatcher.asBinder();
_L1:
            int i;
            parcel.writeStrongBinder(ibinder);
            mRemote.transact(57, parcel, parcel1, 0);
            parcel1.readException();
            i = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return i;
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


    public abstract boolean IsImTargetWindowFullScreen()
        throws RemoteException;

    public abstract void addAppToken(int i, int j, IApplicationToken iapplicationtoken, int k, int l, boolean flag, boolean flag1)
        throws RemoteException;

    public abstract void addDisplayContentChangeListener(int i, IDisplayContentChangeListener idisplaycontentchangelistener)
        throws RemoteException;

    public abstract void addWindowToken(IBinder ibinder, int i)
        throws RemoteException;

    public abstract void clearForcedDisplayDensity(int i)
        throws RemoteException;

    public abstract void clearForcedDisplaySize(int i)
        throws RemoteException;

    public abstract void closeSystemDialogs(String s)
        throws RemoteException;

    public abstract void disableKeyguard(IBinder ibinder, String s)
        throws RemoteException;

    public abstract void dismissKeyguard()
        throws RemoteException;

    public abstract boolean enableGuiLog(boolean flag)
        throws RemoteException;

    public abstract void executeAppTransition()
        throws RemoteException;

    public abstract void exitKeyguardSecurely(IOnKeyguardExitResult ionkeyguardexitresult)
        throws RemoteException;

    public abstract void freezeRotation(int i)
        throws RemoteException;

    public abstract float getAnimationScale(int i)
        throws RemoteException;

    public abstract float[] getAnimationScales()
        throws RemoteException;

    public abstract int getAppOrientation(IApplicationToken iapplicationtoken)
        throws RemoteException;

    public abstract IBinder getFocusedWindowToken()
        throws RemoteException;

    public abstract int getPendingAppTransition()
        throws RemoteException;

    public abstract int getPreferredOptionsPanelGravity()
        throws RemoteException;

    public abstract int getRotation()
        throws RemoteException;

    public abstract void getVisibleWindowsForDisplay(int i, List list)
        throws RemoteException;

    public abstract float getWindowCompatibilityScale(IBinder ibinder)
        throws RemoteException;

    public abstract WindowInfo getWindowInfo(IBinder ibinder)
        throws RemoteException;

    public abstract boolean hasNavigationBar()
        throws RemoteException;

    public abstract boolean hasSystemNavBar()
        throws RemoteException;

    public abstract boolean inKeyguardRestrictedInputMode()
        throws RemoteException;

    public abstract boolean inputMethodClientHasFocus(IInputMethodClient iinputmethodclient)
        throws RemoteException;

    public abstract boolean isKeyguardLocked()
        throws RemoteException;

    public abstract boolean isKeyguardSecure()
        throws RemoteException;

    public abstract boolean isSafeModeEnabled()
        throws RemoteException;

    public abstract boolean isViewServerRunning()
        throws RemoteException;

    public abstract void lockNow(Bundle bundle)
        throws RemoteException;

    public abstract void magnifyDisplay(int i, float f, float f1, float f2)
        throws RemoteException;

    public abstract void moveAppToken(int i, IBinder ibinder)
        throws RemoteException;

    public abstract void moveAppTokensToBottom(List list)
        throws RemoteException;

    public abstract void moveAppTokensToTop(List list)
        throws RemoteException;

    public abstract IWindowSession openSession(IInputMethodClient iinputmethodclient, IInputContext iinputcontext)
        throws RemoteException;

    public abstract void overridePendingAppTransition(String s, int i, int j, IRemoteCallback iremotecallback)
        throws RemoteException;

    public abstract void overridePendingAppTransitionScaleUp(int i, int j, int k, int l)
        throws RemoteException;

    public abstract void overridePendingAppTransitionThumb(Bitmap bitmap, int i, int j, IRemoteCallback iremotecallback, boolean flag)
        throws RemoteException;

    public abstract void pauseKeyDispatching(IBinder ibinder)
        throws RemoteException;

    public abstract void prepareAppTransition(int i, boolean flag)
        throws RemoteException;

    public abstract void reenableKeyguard(IBinder ibinder)
        throws RemoteException;

    public abstract void removeAppToken(IBinder ibinder)
        throws RemoteException;

    public abstract void removeDisplayContentChangeListener(int i, IDisplayContentChangeListener idisplaycontentchangelistener)
        throws RemoteException;

    public abstract void removeWindowToken(IBinder ibinder)
        throws RemoteException;

    public abstract void resumeKeyDispatching(IBinder ibinder)
        throws RemoteException;

    public abstract Bitmap screenshotApplications(IBinder ibinder, int i, int j, int k)
        throws RemoteException;

    public abstract void setAnimationScale(int i, float f)
        throws RemoteException;

    public abstract void setAnimationScales(float af[])
        throws RemoteException;

    public abstract void setAppGroupId(IBinder ibinder, int i)
        throws RemoteException;

    public abstract void setAppOrientation(IApplicationToken iapplicationtoken, int i)
        throws RemoteException;

    public abstract void setAppStartingWindow(IBinder ibinder, String s, int i, CompatibilityInfo compatibilityinfo, CharSequence charsequence, int j, int k, 
            int l, IBinder ibinder1, boolean flag)
        throws RemoteException;

    public abstract void setAppVisibility(IBinder ibinder, boolean flag)
        throws RemoteException;

    public abstract void setAppWillBeHidden(IBinder ibinder)
        throws RemoteException;

    public abstract void setEventDispatching(boolean flag)
        throws RemoteException;

    public abstract void setFocusedApp(IBinder ibinder, boolean flag)
        throws RemoteException;

    public abstract void setForcedDisplayDensity(int i, int j)
        throws RemoteException;

    public abstract void setForcedDisplaySize(int i, int j, int k)
        throws RemoteException;

    public abstract void setInTouchMode(boolean flag)
        throws RemoteException;

    public abstract void setInputFilter(IInputFilter iinputfilter)
        throws RemoteException;

    public abstract void setNewConfiguration(Configuration configuration)
        throws RemoteException;

    public abstract void setStrictModeVisualIndicatorPreference(String s)
        throws RemoteException;

    public abstract void showAssistant()
        throws RemoteException;

    public abstract void showStrictModeViolation(boolean flag)
        throws RemoteException;

    public abstract void startAppFreezingScreen(IBinder ibinder, int i)
        throws RemoteException;

    public abstract void startFreezingScreen(int i, int j)
        throws RemoteException;

    public abstract boolean startViewServer(int i)
        throws RemoteException;

    public abstract void statusBarVisibilityChanged(int i)
        throws RemoteException;

    public abstract void stopAppFreezingScreen(IBinder ibinder, boolean flag)
        throws RemoteException;

    public abstract void stopFreezingScreen()
        throws RemoteException;

    public abstract boolean stopViewServer()
        throws RemoteException;

    public abstract void thawRotation()
        throws RemoteException;

    public abstract Configuration updateOrientationFromAppTokens(Configuration configuration, IBinder ibinder)
        throws RemoteException;

    public abstract void updateRotation(boolean flag, boolean flag1)
        throws RemoteException;

    public abstract boolean waitForWindowDrawn(IBinder ibinder, IRemoteCallback iremotecallback)
        throws RemoteException;

    public abstract int watchRotation(IRotationWatcher irotationwatcher)
        throws RemoteException;
}
