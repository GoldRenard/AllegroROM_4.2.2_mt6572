// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.*;
import android.content.pm.*;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.*;
import android.text.TextUtils;
import android.util.Singleton;
import java.util.List;

// Referenced classes of package android.app:
//            IActivityManager, ActivityManagerProxy, PendingIntent, ApplicationThreadNative, 
//            Notification

public abstract class ActivityManagerNative extends Binder
    implements IActivityManager
{

    private static final Singleton gDefault = new Singleton() {

        protected IActivityManager create()
        {
            return ActivityManagerNative.asInterface(ServiceManager.getService("activity"));
        }

        protected volatile Object create()
        {
            return create();
        }

    }
;
    static boolean sSystemReady = false;

    public ActivityManagerNative()
    {
        attachInterface(this, "android.app.IActivityManager");
    }

    public static IActivityManager asInterface(IBinder ibinder)
    {
        IActivityManager iactivitymanager;
        if (ibinder == null)
        {
            iactivitymanager = null;
        } else
        {
            iactivitymanager = (IActivityManager)ibinder.queryLocalInterface("android.app.IActivityManager");
            if (iactivitymanager == null)
                return new ActivityManagerProxy(ibinder);
        }
        return iactivitymanager;
    }

    public static void broadcastStickyIntent(Intent intent, String s, int i)
    {
        try
        {
            getDefault().broadcastIntent(null, intent, null, null, -1, null, null, null, false, true, i);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public static IActivityManager getDefault()
    {
        return (IActivityManager)gDefault.get();
    }

    public static boolean isSystemReady()
    {
        if (!sSystemReady)
            sSystemReady = getDefault().testIsSystemReady();
        return sSystemReady;
    }

    public static void noteWakeupAlarm(PendingIntent pendingintent)
    {
        try
        {
            getDefault().noteWakeupAlarm(pendingintent.getTarget());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
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
        case 166: 
            parcel.enforceInterface("android.app.IActivityManager");
            applicationBinded(parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 164: 
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag56 = restoreActivityResuming();
            parcel1.writeNoException();
            int i26;
            if (flag56)
                i26 = 1;
            else
                i26 = 0;
            parcel1.writeInt(i26);
            return true;

        case 163: 
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag55 = haltActivityResuming(parcel.readInt());
            parcel1.writeNoException();
            int k25;
            if (flag55)
                k25 = 1;
            else
                k25 = 0;
            parcel1.writeInt(k25);
            return true;

        case 162: 
            parcel.enforceInterface("android.app.IActivityManager");
            notifyWindowTimeout();
            parcel1.writeNoException();
            return true;

        case 159: 
            parcel.enforceInterface("android.app.IActivityManager");
            int j25 = parcel.readInt();
            boolean flag54;
            if (parcel.readInt() != 0)
                flag54 = true;
            else
                flag54 = false;
            long l25 = inputDispatchingTimedOut(j25, flag54);
            parcel1.writeNoException();
            parcel1.writeLong(l25);
            return true;

        case 158: 
            parcel.enforceInterface("android.app.IActivityManager");
            requestBugReport();
            parcel1.writeNoException();
            return true;

        case 156: 
            parcel.enforceInterface("android.app.IActivityManager");
            unregisterUserSwitchObserver(IUserSwitchObserver.Stub.asInterface(parcel.readStrongBinder()));
            parcel1.writeNoException();
            return true;

        case 155: 
            parcel.enforceInterface("android.app.IActivityManager");
            registerUserSwitchObserver(IUserSwitchObserver.Stub.asInterface(parcel.readStrongBinder()));
            parcel1.writeNoException();
            return true;

        case 150: 
            parcel.enforceInterface("android.app.IActivityManager");
            int i25 = getLaunchedFromUid(parcel.readStrongBinder());
            parcel1.writeNoException();
            parcel1.writeInt(i25);
            return true;

        case 147: 
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder38 = parcel.readStrongBinder();
            Intent intent12 = (Intent)Intent.CREATOR.createFromParcel(parcel);
            int j24 = parcel.readInt();
            int k24 = parcel.readInt();
            Intent intent13 = null;
            if (k24 != 0)
                intent13 = (Intent)Intent.CREATOR.createFromParcel(parcel);
            boolean flag53 = navigateUpTo(ibinder38, intent12, j24, intent13);
            parcel1.writeNoException();
            int l24;
            if (flag53)
                l24 = 1;
            else
                l24 = 0;
            parcel1.writeInt(l24);
            return true;

        case 146: 
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag52 = targetTaskAffinityMatchesActivity(parcel.readStrongBinder(), parcel.readString());
            parcel1.writeNoException();
            int i24;
            if (flag52)
                i24 = 1;
            else
                i24 = 0;
            parcel1.writeInt(i24);
            return true;

        case 139: 
            parcel.enforceInterface("android.app.IActivityManager");
            dismissKeyguardOnNextActivity();
            parcel1.writeNoException();
            return true;

        case 138: 
            parcel.enforceInterface("android.app.IActivityManager");
            CharSequence charsequence2 = (CharSequence)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
            boolean flag51;
            if (parcel.readInt() != 0)
                flag51 = true;
            else
                flag51 = false;
            showBootMessage(charsequence2, flag51);
            parcel1.writeNoException();
            return true;

        case 165: 
            parcel.enforceInterface("android.app.IActivityManager");
            long al1[] = getProcessPswap(parcel.createIntArray());
            parcel1.writeNoException();
            parcel1.writeLongArray(al1);
            return true;

        case 137: 
            parcel.enforceInterface("android.app.IActivityManager");
            long al[] = getProcessPss(parcel.createIntArray());
            parcel1.writeNoException();
            parcel1.writeLongArray(al);
            return true;

        case 136: 
            parcel.enforceInterface("android.app.IActivityManager");
            updatePersistentConfiguration((Configuration)Configuration.CREATOR.createFromParcel(parcel));
            parcel1.writeNoException();
            return true;

        case 161: 
            parcel.enforceInterface("android.app.IActivityManager");
            Intent intent11 = getIntentForIntentSender(android.content.IIntentSender.Stub.asInterface(parcel.readStrongBinder()));
            parcel1.writeNoException();
            if (intent11 != null)
            {
                parcel1.writeInt(1);
                intent11.writeToParcel(parcel1, 1);
            } else
            {
                parcel1.writeInt(0);
            }
            return true;

        case 152: 
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag50 = isIntentSenderAnActivity(android.content.IIntentSender.Stub.asInterface(parcel.readStrongBinder()));
            parcel1.writeNoException();
            int l23;
            if (flag50)
                l23 = 1;
            else
                l23 = 0;
            parcel1.writeInt(l23);
            return true;

        case 135: 
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag49 = isIntentSenderTargetedToPackage(android.content.IIntentSender.Stub.asInterface(parcel.readStrongBinder()));
            parcel1.writeNoException();
            int k23;
            if (flag49)
                k23 = 1;
            else
                k23 = 0;
            parcel1.writeInt(k23);
            return true;

        case 129: 
            parcel.enforceInterface("android.app.IActivityManager");
            String s33 = parcel.readString();
            boolean flag48;
            if (parcel.readInt() != 0)
                flag48 = true;
            else
                flag48 = false;
            setPackageAskScreenCompat(s33, flag48);
            parcel1.writeNoException();
            return true;

        case 128: 
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag47 = getPackageAskScreenCompat(parcel.readString());
            parcel1.writeNoException();
            int j23;
            if (flag47)
                j23 = 1;
            else
                j23 = 0;
            parcel1.writeInt(j23);
            return true;

        case 134: 
            parcel.enforceInterface("android.app.IActivityManager");
            unregisterProcessObserver(IProcessObserver.Stub.asInterface(parcel.readStrongBinder()));
            return true;

        case 133: 
            parcel.enforceInterface("android.app.IActivityManager");
            registerProcessObserver(IProcessObserver.Stub.asInterface(parcel.readStrongBinder()));
            return true;

        case 132: 
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag46 = removeTask(parcel.readInt(), parcel.readInt());
            parcel1.writeNoException();
            int i23;
            if (flag46)
                i23 = 1;
            else
                i23 = 0;
            parcel1.writeInt(i23);
            return true;

        case 131: 
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag45 = removeSubTask(parcel.readInt(), parcel.readInt());
            parcel1.writeNoException();
            int l22;
            if (flag45)
                l22 = 1;
            else
                l22 = 0;
            parcel1.writeInt(l22);
            return true;

        case 157: 
            parcel.enforceInterface("android.app.IActivityManager");
            int ai1[] = getRunningUserIds();
            parcel1.writeNoException();
            parcel1.writeIntArray(ai1);
            return true;

        case 122: // 'z'
            parcel.enforceInterface("android.app.IActivityManager");
            int j22 = parcel.readInt();
            boolean flag43;
            if (parcel.readInt() != 0)
                flag43 = true;
            else
                flag43 = false;
            boolean flag44 = isUserRunning(j22, flag43);
            parcel1.writeNoException();
            int k22;
            if (flag44)
                k22 = 1;
            else
                k22 = 0;
            parcel1.writeInt(k22);
            return true;

        case 145: 
            parcel.enforceInterface("android.app.IActivityManager");
            UserInfo userinfo = getCurrentUser();
            parcel1.writeNoException();
            userinfo.writeToParcel(parcel1, 0);
            return true;

        case 154: 
            parcel.enforceInterface("android.app.IActivityManager");
            int i22 = stopUser(parcel.readInt(), IStopUserCallback.Stub.asInterface(parcel.readStrongBinder()));
            parcel1.writeNoException();
            parcel1.writeInt(i22);
            return true;

        case 130: 
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag42 = switchUser(parcel.readInt());
            parcel1.writeNoException();
            int l21;
            if (flag42)
                l21 = 1;
            else
                l21 = 0;
            parcel1.writeInt(l21);
            return true;

        case 127: // '\177'
            parcel.enforceInterface("android.app.IActivityManager");
            setPackageScreenCompatMode(parcel.readString(), parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 126: // '~'
            parcel.enforceInterface("android.app.IActivityManager");
            int k21 = getPackageScreenCompatMode(parcel.readString());
            parcel1.writeNoException();
            parcel1.writeInt(k21);
            return true;

        case 125: // '}'
            parcel.enforceInterface("android.app.IActivityManager");
            int j21 = parcel.readInt();
            setFrontActivityScreenCompatMode(j21);
            parcel1.writeNoException();
            parcel1.writeInt(j21);
            return true;

        case 124: // '|'
            parcel.enforceInterface("android.app.IActivityManager");
            int i21 = getFrontActivityScreenCompatMode();
            parcel1.writeNoException();
            parcel1.writeInt(i21);
            return true;

        case 121: // 'y'
            parcel.enforceInterface("android.app.IActivityManager");
            IApplicationThread iapplicationthread12 = ApplicationThreadNative.asInterface(parcel.readStrongBinder());
            Intent aintent1[] = (Intent[])parcel.createTypedArray(Intent.CREATOR);
            String as1[] = parcel.createStringArray();
            IBinder ibinder37 = parcel.readStrongBinder();
            Bundle bundle11;
            if (parcel.readInt() != 0)
                bundle11 = (Bundle)Bundle.CREATOR.createFromParcel(parcel);
            else
                bundle11 = null;
            int k20 = parcel.readInt();
            int l20 = startActivities(iapplicationthread12, aintent1, as1, ibinder37, bundle11, k20);
            parcel1.writeNoException();
            parcel1.writeInt(l20);
            return true;

        case 120: // 'x'
            parcel.enforceInterface("android.app.IActivityManager");
            String s31 = parcel.readString();
            int i20 = parcel.readInt();
            boolean flag40;
            if (parcel.readInt() != 0)
                flag40 = true;
            else
                flag40 = false;
            String s32 = parcel.readString();
            ParcelFileDescriptor parcelfiledescriptor5;
            if (parcel.readInt() != 0)
                parcelfiledescriptor5 = parcel.readFileDescriptor();
            else
                parcelfiledescriptor5 = null;
            boolean flag41 = dumpHeap(s31, i20, flag40, s32, parcelfiledescriptor5);
            parcel1.writeNoException();
            int j20;
            if (flag41)
                j20 = 1;
            else
                j20 = 0;
            parcel1.writeInt(j20);
            return true;

        case 119: // 'w'
            parcel.enforceInterface("android.app.IActivityManager");
            int l19 = checkGrantUriPermission(parcel.readInt(), parcel.readString(), (Uri)Uri.CREATOR.createFromParcel(parcel), parcel.readInt());
            parcel1.writeNoException();
            parcel1.writeInt(l19);
            return true;

        case 118: // 'v'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder36 = parcel.readStrongBinder();
            if (parcel.readInt() != 0)
                Uri.CREATOR.createFromParcel(parcel);
            revokeUriPermissionFromOwner(ibinder36, null, parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 117: // 'u'
            parcel.enforceInterface("android.app.IActivityManager");
            grantUriPermissionFromOwner(parcel.readStrongBinder(), parcel.readInt(), parcel.readString(), (Uri)Uri.CREATOR.createFromParcel(parcel), parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 116: // 't'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder35 = newUriPermissionOwner(parcel.readString());
            parcel1.writeNoException();
            parcel1.writeStrongBinder(ibinder35);
            return true;

        case 115: // 's'
            parcel.enforceInterface("android.app.IActivityManager");
            String s30 = getProviderMimeType((Uri)Uri.CREATOR.createFromParcel(parcel), parcel.readInt());
            parcel1.writeNoException();
            parcel1.writeString(s30);
            return true;

        case 114: // 'r'
            parcel.enforceInterface("android.app.IActivityManager");
            crashApplication(parcel.readInt(), parcel.readInt(), parcel.readString(), parcel.readString());
            parcel1.writeNoException();
            return true;

        case 113: // 'q'
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag39 = isTopActivityImmersive();
            parcel1.writeNoException();
            int k19;
            if (flag39)
                k19 = 1;
            else
                k19 = 0;
            parcel1.writeInt(k19);
            return true;

        case 112: // 'p'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder34 = parcel.readStrongBinder();
            boolean flag38;
            if (parcel.readInt() == 1)
                flag38 = true;
            else
                flag38 = false;
            setImmersive(ibinder34, flag38);
            parcel1.writeNoException();
            return true;

        case 111: // 'o'
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag37 = isImmersive(parcel.readStrongBinder());
            parcel1.writeNoException();
            int j19;
            if (flag37)
                j19 = 1;
            else
                j19 = 0;
            parcel1.writeInt(j19);
            return true;

        case 109: // 'm'
            parcel.enforceInterface("android.app.IActivityManager");
            finishHeavyWeightApp();
            parcel1.writeNoException();
            return true;

        case 104: // 'h'
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag36 = isUserAMonkey();
            parcel1.writeNoException();
            int i19;
            if (flag36)
                i19 = 1;
            else
                i19 = 0;
            parcel1.writeInt(i19);
            return true;

        case 101: // 'e'
            parcel.enforceInterface("android.app.IActivityManager");
            overridePendingTransition(parcel.readStrongBinder(), parcel.readString(), parcel.readInt(), parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 99: // 'c'
            parcel.enforceInterface("android.app.IActivityManager");
            killApplicationProcess(parcel.readString(), parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 98: // 'b'
            parcel.enforceInterface("android.app.IActivityManager");
            android.os.Debug.MemoryInfo amemoryinfo[] = getProcessMemoryInfo(parcel.createIntArray());
            parcel1.writeNoException();
            parcel1.writeTypedArray(amemoryinfo, 1);
            return true;

        case 97: // 'a'
            parcel.enforceInterface("android.app.IActivityManager");
            closeSystemDialogs(parcel.readString());
            parcel1.writeNoException();
            return true;

        case 96: // '`'
            parcel.enforceInterface("android.app.IActivityManager");
            killApplicationWithAppId(parcel.readString(), parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 92: // '\\'
            parcel.enforceInterface("android.app.IActivityManager");
            unbindBackupAgent((ApplicationInfo)ApplicationInfo.CREATOR.createFromParcel(parcel));
            parcel1.writeNoException();
            return true;

        case 91: // '['
            parcel.enforceInterface("android.app.IActivityManager");
            backupAgentCreated(parcel.readString(), parcel.readStrongBinder());
            parcel1.writeNoException();
            return true;

        case 90: // 'Z'
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag35 = bindBackupAgent((ApplicationInfo)ApplicationInfo.CREATOR.createFromParcel(parcel), parcel.readInt());
            parcel1.writeNoException();
            int l18;
            if (flag35)
                l18 = 1;
            else
                l18 = 0;
            parcel1.writeInt(l18);
            return true;

        case 85: // 'U'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder33 = peekService((Intent)Intent.CREATOR.createFromParcel(parcel), parcel.readString());
            parcel1.writeNoException();
            parcel1.writeStrongBinder(ibinder33);
            return true;

        case 89: // 'Y'
            parcel.enforceInterface("android.app.IActivityManager");
            resumeAppSwitches();
            parcel1.writeNoException();
            return true;

        case 88: // 'X'
            parcel.enforceInterface("android.app.IActivityManager");
            stopAppSwitches();
            parcel1.writeNoException();
            return true;

        case 87: // 'W'
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag34 = shutdown(parcel.readInt());
            parcel1.writeNoException();
            int k18;
            if (flag34)
                k18 = 1;
            else
                k18 = 0;
            parcel1.writeInt(k18);
            return true;

        case 86: // 'V'
            parcel.enforceInterface("android.app.IActivityManager");
            String s28 = parcel.readString();
            int l17 = parcel.readInt();
            boolean flag32;
            if (parcel.readInt() != 0)
                flag32 = true;
            else
                flag32 = false;
            int i18 = parcel.readInt();
            String s29 = parcel.readString();
            ParcelFileDescriptor parcelfiledescriptor4;
            if (parcel.readInt() != 0)
                parcelfiledescriptor4 = parcel.readFileDescriptor();
            else
                parcelfiledescriptor4 = null;
            boolean flag33 = profileControl(s28, l17, flag32, s29, parcelfiledescriptor4, i18);
            parcel1.writeNoException();
            int j18;
            if (flag33)
                j18 = 1;
            else
                j18 = 0;
            parcel1.writeInt(j18);
            return true;

        case 84: // 'T'
            parcel.enforceInterface("android.app.IActivityManager");
            ConfigurationInfo configurationinfo = getDeviceConfigurationInfo();
            parcel1.writeNoException();
            configurationinfo.writeToParcel(parcel1, 0);
            return true;

        case 143: 
            parcel.enforceInterface("android.app.IActivityManager");
            ActivityManager.RunningAppProcessInfo runningappprocessinfo = new ActivityManager.RunningAppProcessInfo();
            getMyMemoryState(runningappprocessinfo);
            parcel1.writeNoException();
            runningappprocessinfo.writeToParcel(parcel1, 0);
            return true;

        case 79: // 'O'
            parcel.enforceInterface("android.app.IActivityManager");
            forceStopPackage(parcel.readString(), parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 140: 
            parcel.enforceInterface("android.app.IActivityManager");
            killAllBackgroundProcesses();
            parcel1.writeNoException();
            return true;

        case 103: // 'g'
            parcel.enforceInterface("android.app.IActivityManager");
            killBackgroundProcesses(parcel.readString(), parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 59: // ';'
            parcel.enforceInterface("android.app.IActivityManager");
            signalPersistentProcesses(parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 110: // 'n'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder32 = parcel.readStrongBinder();
            int k17 = parcel.readInt();
            android.os.StrictMode.ViolationInfo violationinfo = new android.os.StrictMode.ViolationInfo(parcel);
            handleApplicationStrictModeViolation(ibinder32, k17, violationinfo);
            parcel1.writeNoException();
            return true;

        case 102: // 'f'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder31 = parcel.readStrongBinder();
            String s27 = parcel.readString();
            ApplicationErrorReport.CrashInfo crashinfo1 = new ApplicationErrorReport.CrashInfo(parcel);
            boolean flag31 = handleApplicationWtf(ibinder31, s27, crashinfo1);
            parcel1.writeNoException();
            int j17;
            if (flag31)
                j17 = 1;
            else
                j17 = 0;
            parcel1.writeInt(j17);
            return true;

        case 2: // '\002'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder30 = parcel.readStrongBinder();
            ApplicationErrorReport.CrashInfo crashinfo = new ApplicationErrorReport.CrashInfo(parcel);
            handleApplicationCrash(ibinder30, crashinfo);
            parcel1.writeNoException();
            return true;

        case 1: // '\001'
            parcel.enforceInterface("android.app.IActivityManager");
            startRunning(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString());
            parcel1.writeNoException();
            return true;

        case 144: 
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag30 = killProcessesBelowForeground(parcel.readString());
            parcel1.writeNoException();
            int i17;
            if (flag30)
                i17 = 1;
            else
                i17 = 0;
            parcel1.writeInt(i17);
            return true;

        case 80: // 'P'
            parcel.enforceInterface("android.app.IActivityManager");
            int ai[] = parcel.createIntArray();
            String s26 = parcel.readString();
            boolean flag28;
            if (parcel.readInt() != 0)
                flag28 = true;
            else
                flag28 = false;
            boolean flag29 = killPids(ai, s26, flag28);
            parcel1.writeNoException();
            int l16;
            if (flag29)
                l16 = 1;
            else
                l16 = 0;
            parcel1.writeInt(l16);
            return true;

        case 68: // 'D'
            parcel.enforceInterface("android.app.IActivityManager");
            noteWakeupAlarm(android.content.IIntentSender.Stub.asInterface(parcel.readStrongBinder()));
            parcel1.writeNoException();
            return true;

        case 66: // 'B'
            parcel.enforceInterface("android.app.IActivityManager");
            enterSafeMode();
            parcel1.writeNoException();
            return true;

        case 57: // '9'
            parcel.enforceInterface("android.app.IActivityManager");
            setActivityController(IActivityController.Stub.asInterface(parcel.readStrongBinder()));
            return true;

        case 43: // '+'
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag27;
            if (parcel.readInt() != 0)
                flag27 = true;
            else
                flag27 = false;
            setAlwaysFinish(flag27);
            parcel1.writeNoException();
            return true;

        case 42: // '*'
            parcel.enforceInterface("android.app.IActivityManager");
            String s25 = parcel.readString();
            boolean flag25;
            if (parcel.readInt() != 0)
                flag25 = true;
            else
                flag25 = false;
            boolean flag26;
            if (parcel.readInt() != 0)
                flag26 = true;
            else
                flag26 = false;
            setDebugApp(s25, flag25, flag26);
            parcel1.writeNoException();
            return true;

        case 148: 
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag24;
            if (parcel.readInt() != 0)
                flag24 = true;
            else
                flag24 = false;
            setLockScreenShown(flag24);
            parcel1.writeNoException();
            return true;

        case 41: // ')'
            parcel.enforceInterface("android.app.IActivityManager");
            wakingUp();
            parcel1.writeNoException();
            return true;

        case 40: // '('
            parcel.enforceInterface("android.app.IActivityManager");
            goingToSleep();
            parcel1.writeNoException();
            return true;

        case 5: // '\005'
            parcel.enforceInterface("android.app.IActivityManager");
            ParcelFileDescriptor parcelfiledescriptor3 = openContentUri(Uri.parse(parcel.readString()));
            parcel1.writeNoException();
            if (parcelfiledescriptor3 != null)
            {
                parcel1.writeInt(1);
                parcelfiledescriptor3.writeToParcel(parcel1, 1);
            } else
            {
                parcel1.writeInt(0);
            }
            return true;

        case 4: // '\004'
            parcel.enforceInterface("android.app.IActivityManager");
            unhandledBack();
            parcel1.writeNoException();
            return true;

        case 76: // 'L'
            parcel.enforceInterface("android.app.IActivityManager");
            ActivityManager.MemoryInfo memoryinfo = new ActivityManager.MemoryInfo();
            getMemoryInfo(memoryinfo);
            parcel1.writeNoException();
            memoryinfo.writeToParcel(parcel1, 0);
            return true;

        case 58: // ':'
            parcel.enforceInterface("android.app.IActivityManager");
            IApplicationThread iapplicationthread11 = ApplicationThreadNative.asInterface(parcel.readStrongBinder());
            boolean flag23;
            if (parcel.readInt() != 0)
                flag23 = true;
            else
                flag23 = false;
            showWaitingForDebugger(iapplicationthread11, flag23);
            parcel1.writeNoException();
            return true;

        case 56: // '8'
            parcel.enforceInterface("android.app.IActivityManager");
            revokeUriPermission(ApplicationThreadNative.asInterface(parcel.readStrongBinder()), (Uri)Uri.CREATOR.createFromParcel(parcel), parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 55: // '7'
            parcel.enforceInterface("android.app.IActivityManager");
            grantUriPermission(ApplicationThreadNative.asInterface(parcel.readStrongBinder()), parcel.readString(), (Uri)Uri.CREATOR.createFromParcel(parcel), parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 78: // 'N'
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag22 = clearApplicationUserData(parcel.readString(), android.content.pm.IPackageDataObserver.Stub.asInterface(parcel.readStrongBinder()), parcel.readInt());
            parcel1.writeNoException();
            int k16;
            if (flag22)
                k16 = 1;
            else
                k16 = 0;
            parcel1.writeInt(k16);
            return true;

        case 54: // '6'
            parcel.enforceInterface("android.app.IActivityManager");
            int j16 = checkUriPermission((Uri)Uri.CREATOR.createFromParcel(parcel), parcel.readInt(), parcel.readInt(), parcel.readInt());
            parcel1.writeNoException();
            parcel1.writeInt(j16);
            return true;

        case 53: // '5'
            parcel.enforceInterface("android.app.IActivityManager");
            int i16 = checkPermission(parcel.readString(), parcel.readInt(), parcel.readInt());
            parcel1.writeNoException();
            parcel1.writeInt(i16);
            return true;

        case 73: // 'I'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder29 = parcel.readStrongBinder();
            int l15 = parcel.readInt();
            boolean flag21;
            if (parcel.readInt() != 0)
                flag21 = true;
            else
                flag21 = false;
            setProcessForeground(ibinder29, l15, flag21);
            parcel1.writeNoException();
            return true;

        case 52: // '4'
            parcel.enforceInterface("android.app.IActivityManager");
            int k15 = getProcessLimit();
            parcel1.writeNoException();
            parcel1.writeInt(k15);
            return true;

        case 51: // '3'
            parcel.enforceInterface("android.app.IActivityManager");
            setProcessLimit(parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 94: // '^'
            parcel.enforceInterface("android.app.IActivityManager");
            int k14 = parcel.readInt();
            int l14 = parcel.readInt();
            int i15 = parcel.readInt();
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
            int j15 = handleIncomingUser(k14, l14, i15, flag19, flag20, parcel.readString(), parcel.readString());
            parcel1.writeNoException();
            parcel1.writeInt(j15);
            return true;

        case 93: // ']'
            parcel.enforceInterface("android.app.IActivityManager");
            int j14 = getUidForIntentSender(android.content.IIntentSender.Stub.asInterface(parcel.readStrongBinder()));
            parcel1.writeNoException();
            parcel1.writeInt(j14);
            return true;

        case 65: // 'A'
            parcel.enforceInterface("android.app.IActivityManager");
            String s24 = getPackageForIntentSender(android.content.IIntentSender.Stub.asInterface(parcel.readStrongBinder()));
            parcel1.writeNoException();
            parcel1.writeString(s24);
            return true;

        case 64: // '@'
            parcel.enforceInterface("android.app.IActivityManager");
            cancelIntentSender(android.content.IIntentSender.Stub.asInterface(parcel.readStrongBinder()));
            parcel1.writeNoException();
            return true;

        case 63: // '?'
            parcel.enforceInterface("android.app.IActivityManager");
            int j13 = parcel.readInt();
            String s22 = parcel.readString();
            IBinder ibinder27 = parcel.readStrongBinder();
            String s23 = parcel.readString();
            int k13 = parcel.readInt();
            Intent aintent[];
            String as[];
            if (parcel.readInt() != 0)
            {
                aintent = (Intent[])parcel.createTypedArray(Intent.CREATOR);
                as = parcel.createStringArray();
            } else
            {
                aintent = null;
                as = null;
            }
            int l13 = parcel.readInt();
            Bundle bundle10;
            if (parcel.readInt() != 0)
                bundle10 = (Bundle)Bundle.CREATOR.createFromParcel(parcel);
            else
                bundle10 = null;
            int i14 = parcel.readInt();
            IIntentSender iintentsender = getIntentSender(j13, s22, ibinder27, s23, k13, aintent, as, l13, bundle10, i14);
            parcel1.writeNoException();
            IBinder ibinder28;
            if (iintentsender != null)
                ibinder28 = iintentsender.asBinder();
            else
                ibinder28 = null;
            parcel1.writeStrongBinder(ibinder28);
            return true;

        case 50: // '2'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder26 = parcel.readStrongBinder();
            parcel1.writeNoException();
            parcel1.writeString(getPackageForToken(ibinder26));
            return true;

        case 49: // '1'
            parcel.enforceInterface("android.app.IActivityManager");
            ComponentName componentname3 = getActivityClassForToken(parcel.readStrongBinder());
            parcel1.writeNoException();
            ComponentName.writeToParcel(componentname3, parcel1);
            return true;

        case 71: // 'G'
            parcel.enforceInterface("android.app.IActivityManager");
            int i13 = getRequestedOrientation(parcel.readStrongBinder());
            parcel1.writeNoException();
            parcel1.writeInt(i13);
            return true;

        case 70: // 'F'
            parcel.enforceInterface("android.app.IActivityManager");
            setRequestedOrientation(parcel.readStrongBinder(), parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 47: // '/'
            parcel.enforceInterface("android.app.IActivityManager");
            updateConfiguration((Configuration)Configuration.CREATOR.createFromParcel(parcel));
            parcel1.writeNoException();
            return true;

        case 46: // '.'
            parcel.enforceInterface("android.app.IActivityManager");
            Configuration configuration2 = getConfiguration();
            parcel1.writeNoException();
            configuration2.writeToParcel(parcel1, 0);
            return true;

        case 45: // '-'
            parcel.enforceInterface("android.app.IActivityManager");
            finishInstrumentation(ApplicationThreadNative.asInterface(parcel.readStrongBinder()), parcel.readInt(), parcel.readBundle());
            parcel1.writeNoException();
            return true;

        case 44: // ','
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag18 = startInstrumentation(ComponentName.readFromParcel(parcel), parcel.readString(), parcel.readInt(), parcel.readBundle(), IInstrumentationWatcher.Stub.asInterface(parcel.readStrongBinder()), parcel.readInt());
            parcel1.writeNoException();
            int l12;
            if (flag18)
                l12 = 1;
            else
                l12 = 0;
            parcel1.writeInt(l12);
            return true;

        case 61: // '='
            parcel.enforceInterface("android.app.IActivityManager");
            serviceDoneExecuting(parcel.readStrongBinder(), parcel.readInt(), parcel.readInt(), parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 72: // 'H'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder25 = parcel.readStrongBinder();
            Intent intent10 = (Intent)Intent.CREATOR.createFromParcel(parcel);
            boolean flag17;
            if (parcel.readInt() != 0)
                flag17 = true;
            else
                flag17 = false;
            unbindFinished(ibinder25, intent10, flag17);
            parcel1.writeNoException();
            return true;

        case 38: // '&'
            parcel.enforceInterface("android.app.IActivityManager");
            publishService(parcel.readStrongBinder(), (Intent)Intent.CREATOR.createFromParcel(parcel), parcel.readStrongBinder());
            parcel1.writeNoException();
            return true;

        case 37: // '%'
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag16 = unbindService(IServiceConnection.Stub.asInterface(parcel.readStrongBinder()));
            parcel1.writeNoException();
            int k12;
            if (flag16)
                k12 = 1;
            else
                k12 = 0;
            parcel1.writeInt(k12);
            return true;

        case 36: // '$'
            parcel.enforceInterface("android.app.IActivityManager");
            IApplicationThread iapplicationthread10 = ApplicationThreadNative.asInterface(parcel.readStrongBinder());
            IBinder ibinder23 = parcel.readStrongBinder();
            Intent intent9 = (Intent)Intent.CREATOR.createFromParcel(parcel);
            String s21 = parcel.readString();
            IBinder ibinder24 = parcel.readStrongBinder();
            int l11 = parcel.readInt();
            int i12 = parcel.readInt();
            int j12 = bindService(iapplicationthread10, ibinder23, intent9, s21, IServiceConnection.Stub.asInterface(ibinder24), l11, i12);
            parcel1.writeNoException();
            parcel1.writeInt(j12);
            return true;

        case 74: // 'J'
            parcel.enforceInterface("android.app.IActivityManager");
            ComponentName componentname2 = ComponentName.readFromParcel(parcel);
            IBinder ibinder22 = parcel.readStrongBinder();
            int j11 = parcel.readInt();
            int k11 = parcel.readInt();
            Notification notification = null;
            if (k11 != 0)
                notification = (Notification)Notification.CREATOR.createFromParcel(parcel);
            boolean flag15;
            if (parcel.readInt() != 0)
                flag15 = true;
            else
                flag15 = false;
            setServiceForeground(componentname2, ibinder22, j11, notification, flag15);
            parcel1.writeNoException();
            return true;

        case 48: // '0'
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag14 = stopServiceToken(ComponentName.readFromParcel(parcel), parcel.readStrongBinder(), parcel.readInt());
            parcel1.writeNoException();
            int i11;
            if (flag14)
                i11 = 1;
            else
                i11 = 0;
            parcel1.writeInt(i11);
            return true;

        case 35: // '#'
            parcel.enforceInterface("android.app.IActivityManager");
            int l10 = stopService(ApplicationThreadNative.asInterface(parcel.readStrongBinder()), (Intent)Intent.CREATOR.createFromParcel(parcel), parcel.readString(), parcel.readInt());
            parcel1.writeNoException();
            parcel1.writeInt(l10);
            return true;

        case 34: // '"'
            parcel.enforceInterface("android.app.IActivityManager");
            ComponentName componentname1 = startService(ApplicationThreadNative.asInterface(parcel.readStrongBinder()), (Intent)Intent.CREATOR.createFromParcel(parcel), parcel.readString(), parcel.readInt());
            parcel1.writeNoException();
            ComponentName.writeToParcel(componentname1, parcel1);
            return true;

        case 33: // '!'
            parcel.enforceInterface("android.app.IActivityManager");
            PendingIntent pendingintent = getRunningServiceControlPanel((ComponentName)ComponentName.CREATOR.createFromParcel(parcel));
            parcel1.writeNoException();
            PendingIntent.writePendingIntentOrNullToParcel(pendingintent, parcel1);
            return true;

        case 142: 
            parcel.enforceInterface("android.app.IActivityManager");
            removeContentProviderExternal(parcel.readString(), parcel.readStrongBinder());
            parcel1.writeNoException();
            return true;

        case 69: // 'E'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder21 = parcel.readStrongBinder();
            boolean flag13;
            if (parcel.readInt() != 0)
                flag13 = true;
            else
                flag13 = false;
            removeContentProvider(ibinder21, flag13);
            parcel1.writeNoException();
            return true;

        case 151: 
            parcel.enforceInterface("android.app.IActivityManager");
            unstableProviderDied(parcel.readStrongBinder());
            parcel1.writeNoException();
            return true;

        case 31: // '\037'
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag12 = refContentProvider(parcel.readStrongBinder(), parcel.readInt(), parcel.readInt());
            parcel1.writeNoException();
            int k10;
            if (flag12)
                k10 = 1;
            else
                k10 = 0;
            parcel1.writeInt(k10);
            return true;

        case 30: // '\036'
            parcel.enforceInterface("android.app.IActivityManager");
            publishContentProviders(ApplicationThreadNative.asInterface(parcel.readStrongBinder()), parcel.createTypedArrayList(IActivityManager.ContentProviderHolder.CREATOR));
            parcel1.writeNoException();
            return true;

        case 141: 
            parcel.enforceInterface("android.app.IActivityManager");
            IActivityManager.ContentProviderHolder contentproviderholder1 = getContentProviderExternal(parcel.readString(), parcel.readInt(), parcel.readStrongBinder());
            parcel1.writeNoException();
            if (contentproviderholder1 != null)
            {
                parcel1.writeInt(1);
                contentproviderholder1.writeToParcel(parcel1, 0);
            } else
            {
                parcel1.writeInt(0);
            }
            return true;

        case 29: // '\035'
            parcel.enforceInterface("android.app.IActivityManager");
            IApplicationThread iapplicationthread9 = ApplicationThreadNative.asInterface(parcel.readStrongBinder());
            String s20 = parcel.readString();
            int j10 = parcel.readInt();
            boolean flag11;
            if (parcel.readInt() != 0)
                flag11 = true;
            else
                flag11 = false;
            IActivityManager.ContentProviderHolder contentproviderholder = getContentProvider(iapplicationthread9, s20, j10, flag11);
            parcel1.writeNoException();
            if (contentproviderholder != null)
            {
                parcel1.writeInt(1);
                contentproviderholder.writeToParcel(parcel1, 0);
            } else
            {
                parcel1.writeInt(0);
            }
            return true;

        case 28: // '\034'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder20 = parcel.readStrongBinder();
            Bitmap bitmap2;
            if (parcel.readInt() != 0)
                bitmap2 = (Bitmap)Bitmap.CREATOR.createFromParcel(parcel);
            else
                bitmap2 = null;
            CharSequence charsequence1 = (CharSequence)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
            reportThumbnail(ibinder20, bitmap2, charsequence1);
            parcel1.writeNoException();
            return true;

        case 27: // '\033'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder19 = parcel.readStrongBinder();
            boolean flag10;
            if (parcel.readInt() != 0)
                flag10 = true;
            else
                flag10 = false;
            int i10;
            if (ibinder19 != null)
                i10 = getTaskForActivity(ibinder19, flag10);
            else
                i10 = -1;
            parcel1.writeNoException();
            parcel1.writeInt(i10);
            return true;

        case 26: // '\032'
            parcel.enforceInterface("android.app.IActivityManager");
            moveTaskBackwards(parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 75: // 'K'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder18 = parcel.readStrongBinder();
            boolean flag8;
            if (parcel.readInt() != 0)
                flag8 = true;
            else
                flag8 = false;
            boolean flag9 = moveActivityTaskToBack(ibinder18, flag8);
            parcel1.writeNoException();
            int l9;
            if (flag9)
                l9 = 1;
            else
                l9 = 0;
            parcel1.writeInt(l9);
            return true;

        case 25: // '\031'
            parcel.enforceInterface("android.app.IActivityManager");
            moveTaskToBack(parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 24: // '\030'
            parcel.enforceInterface("android.app.IActivityManager");
            int j9 = parcel.readInt();
            int k9 = parcel.readInt();
            Bundle bundle9;
            if (parcel.readInt() != 0)
                bundle9 = (Bundle)Bundle.CREATOR.createFromParcel(parcel);
            else
                bundle9 = null;
            moveTaskToFront(j9, k9, bundle9);
            parcel1.writeNoException();
            return true;

        case 108: // 'l'
            parcel.enforceInterface("android.app.IActivityManager");
            List list5 = getRunningExternalApplications();
            parcel1.writeNoException();
            parcel1.writeTypedList(list5);
            return true;

        case 83: // 'S'
            parcel.enforceInterface("android.app.IActivityManager");
            List list4 = getRunningAppProcesses();
            parcel1.writeNoException();
            parcel1.writeTypedList(list4);
            return true;

        case 77: // 'M'
            parcel.enforceInterface("android.app.IActivityManager");
            List list3 = getProcessesInErrorState();
            parcel1.writeNoException();
            parcel1.writeTypedList(list3);
            return true;

        case 81: // 'Q'
            parcel.enforceInterface("android.app.IActivityManager");
            List list2 = getServices(parcel.readInt(), parcel.readInt());
            parcel1.writeNoException();
            int l8;
            if (list2 != null)
                l8 = list2.size();
            else
                l8 = -1;
            parcel1.writeInt(l8);
            for (int i9 = 0; i9 < l8; i9++)
                ((ActivityManager.RunningServiceInfo)list2.get(i9)).writeToParcel(parcel1, 0);

            return true;

        case 95: // '_'
            parcel.enforceInterface("android.app.IActivityManager");
            Bitmap bitmap1 = getTaskTopThumbnail(parcel.readInt());
            parcel1.writeNoException();
            if (bitmap1 != null)
            {
                parcel1.writeInt(1);
                bitmap1.writeToParcel(parcel1, 0);
            } else
            {
                parcel1.writeInt(0);
            }
            return true;

        case 82: // 'R'
            parcel.enforceInterface("android.app.IActivityManager");
            ActivityManager.TaskThumbnails taskthumbnails = getTaskThumbnails(parcel.readInt());
            parcel1.writeNoException();
            if (taskthumbnails != null)
            {
                parcel1.writeInt(1);
                taskthumbnails.writeToParcel(parcel1, 0);
            } else
            {
                parcel1.writeInt(0);
            }
            return true;

        case 60: // '<'
            parcel.enforceInterface("android.app.IActivityManager");
            List list1 = getRecentTasks(parcel.readInt(), parcel.readInt(), parcel.readInt());
            parcel1.writeNoException();
            parcel1.writeTypedList(list1);
            return true;

        case 23: // '\027'
            parcel.enforceInterface("android.app.IActivityManager");
            int l7 = parcel.readInt();
            int i8 = parcel.readInt();
            IBinder ibinder17 = parcel.readStrongBinder();
            IThumbnailReceiver ithumbnailreceiver;
            if (ibinder17 != null)
                ithumbnailreceiver = IThumbnailReceiver.Stub.asInterface(ibinder17);
            else
                ithumbnailreceiver = null;
            List list = getTasks(l7, i8, ithumbnailreceiver);
            parcel1.writeNoException();
            int j8;
            if (list != null)
                j8 = list.size();
            else
                j8 = -1;
            parcel1.writeInt(j8);
            for (int k8 = 0; k8 < j8; k8++)
                ((ActivityManager.RunningTaskInfo)list.get(k8)).writeToParcel(parcel1, 0);

            return true;

        case 22: // '\026'
            parcel.enforceInterface("android.app.IActivityManager");
            ComponentName componentname = getCallingActivity(parcel.readStrongBinder());
            parcel1.writeNoException();
            ComponentName.writeToParcel(componentname, parcel1);
            return true;

        case 21: // '\025'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder16 = parcel.readStrongBinder();
            String s19;
            if (ibinder16 != null)
                s19 = getCallingPackage(ibinder16);
            else
                s19 = null;
            parcel1.writeNoException();
            parcel1.writeString(s19);
            return true;

        case 62: // '>'
            parcel.enforceInterface("android.app.IActivityManager");
            activityDestroyed(parcel.readStrongBinder());
            parcel1.writeNoException();
            return true;

        case 123: // '{'
            parcel.enforceInterface("android.app.IActivityManager");
            activitySlept(parcel.readStrongBinder());
            parcel1.writeNoException();
            return true;

        case 20: // '\024'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder15 = parcel.readStrongBinder();
            Bundle bundle8 = parcel.readBundle();
            Bitmap bitmap;
            if (parcel.readInt() != 0)
                bitmap = (Bitmap)Bitmap.CREATOR.createFromParcel(parcel);
            else
                bitmap = null;
            CharSequence charsequence = (CharSequence)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
            activityStopped(ibinder15, bundle8, bitmap, charsequence);
            parcel1.writeNoException();
            return true;

        case 19: // '\023'
            parcel.enforceInterface("android.app.IActivityManager");
            activityPaused(parcel.readStrongBinder());
            parcel1.writeNoException();
            return true;

        case 39: // '\''
            parcel.enforceInterface("android.app.IActivityManager");
            activityResumed(parcel.readStrongBinder());
            parcel1.writeNoException();
            return true;

        case 18: // '\022'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder14 = parcel.readStrongBinder();
            int k7 = parcel.readInt();
            Configuration configuration1 = null;
            if (k7 != 0)
                configuration1 = (Configuration)Configuration.CREATOR.createFromParcel(parcel);
            boolean flag7;
            if (parcel.readInt() != 0)
                flag7 = true;
            else
                flag7 = false;
            if (ibinder14 != null)
                activityIdle(ibinder14, configuration1, flag7);
            parcel1.writeNoException();
            return true;

        case 17: // '\021'
            parcel.enforceInterface("android.app.IActivityManager");
            IApplicationThread iapplicationthread8 = ApplicationThreadNative.asInterface(parcel.readStrongBinder());
            if (iapplicationthread8 != null)
                attachApplication(iapplicationthread8);
            parcel1.writeNoException();
            return true;

        case 16: // '\020'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder13 = parcel.readStrongBinder();
            int j7 = parcel.readInt();
            String s18 = parcel.readString();
            Bundle bundle7 = parcel.readBundle();
            boolean flag6;
            if (parcel.readInt() != 0)
                flag6 = true;
            else
                flag6 = false;
            if (ibinder13 != null)
                finishReceiver(ibinder13, j7, s18, bundle7, flag6);
            parcel1.writeNoException();
            return true;

        case 15: // '\017'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder12 = parcel.readStrongBinder();
            IApplicationThread iapplicationthread7;
            if (ibinder12 != null)
                iapplicationthread7 = ApplicationThreadNative.asInterface(ibinder12);
            else
                iapplicationthread7 = null;
            unbroadcastIntent(iapplicationthread7, (Intent)Intent.CREATOR.createFromParcel(parcel), parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 14: // '\016'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder10 = parcel.readStrongBinder();
            IApplicationThread iapplicationthread6;
            if (ibinder10 != null)
                iapplicationthread6 = ApplicationThreadNative.asInterface(ibinder10);
            else
                iapplicationthread6 = null;
            Intent intent8 = (Intent)Intent.CREATOR.createFromParcel(parcel);
            String s15 = parcel.readString();
            IBinder ibinder11 = parcel.readStrongBinder();
            android.content.IIntentReceiver iintentreceiver1;
            if (ibinder11 != null)
                iintentreceiver1 = android.content.IIntentReceiver.Stub.asInterface(ibinder11);
            else
                iintentreceiver1 = null;
            int k6 = parcel.readInt();
            String s16 = parcel.readString();
            Bundle bundle6 = parcel.readBundle();
            String s17 = parcel.readString();
            boolean flag4;
            if (parcel.readInt() != 0)
                flag4 = true;
            else
                flag4 = false;
            boolean flag5;
            if (parcel.readInt() != 0)
                flag5 = true;
            else
                flag5 = false;
            int l6 = parcel.readInt();
            int i7 = broadcastIntent(iapplicationthread6, intent8, s15, iintentreceiver1, k6, s16, bundle6, s17, flag4, flag5, l6);
            parcel1.writeNoException();
            parcel1.writeInt(i7);
            return true;

        case 13: // '\r'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder9 = parcel.readStrongBinder();
            if (ibinder9 == null)
            {
                return true;
            } else
            {
                unregisterReceiver(android.content.IIntentReceiver.Stub.asInterface(ibinder9));
                parcel1.writeNoException();
                return true;
            }

        case 12: // '\f'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder7 = parcel.readStrongBinder();
            IApplicationThread iapplicationthread5;
            if (ibinder7 != null)
                iapplicationthread5 = ApplicationThreadNative.asInterface(ibinder7);
            else
                iapplicationthread5 = null;
            String s13 = parcel.readString();
            IBinder ibinder8 = parcel.readStrongBinder();
            android.content.IIntentReceiver iintentreceiver;
            if (ibinder8 != null)
                iintentreceiver = android.content.IIntentReceiver.Stub.asInterface(ibinder8);
            else
                iintentreceiver = null;
            IntentFilter intentfilter = (IntentFilter)IntentFilter.CREATOR.createFromParcel(parcel);
            String s14 = parcel.readString();
            int j6 = parcel.readInt();
            Intent intent7 = registerReceiver(iapplicationthread5, s13, iintentreceiver, intentfilter, s14, j6);
            parcel1.writeNoException();
            if (intent7 != null)
            {
                parcel1.writeInt(1);
                intent7.writeToParcel(parcel1, 0);
            } else
            {
                parcel1.writeInt(0);
            }
            return true;

        case 106: // 'j'
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag3 = willActivityBeVisible(parcel.readStrongBinder());
            parcel1.writeNoException();
            int i6;
            if (flag3)
                i6 = 1;
            else
                i6 = 0;
            parcel1.writeInt(i6);
            return true;

        case 149: 
            parcel.enforceInterface("android.app.IActivityManager");
            boolean flag2 = finishActivityAffinity(parcel.readStrongBinder());
            parcel1.writeNoException();
            int l5;
            if (flag2)
                l5 = 1;
            else
                l5 = 0;
            parcel1.writeInt(l5);
            return true;

        case 32: // ' '
            parcel.enforceInterface("android.app.IActivityManager");
            finishSubActivity(parcel.readStrongBinder(), parcel.readString(), parcel.readInt());
            parcel1.writeNoException();
            return true;

        case 11: // '\013'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder6 = parcel.readStrongBinder();
            int i5 = parcel.readInt();
            int j5 = parcel.readInt();
            Intent intent6 = null;
            if (j5 != 0)
                intent6 = (Intent)Intent.CREATOR.createFromParcel(parcel);
            boolean flag1 = finishActivity(ibinder6, i5, intent6);
            parcel1.writeNoException();
            int k5;
            if (flag1)
                k5 = 1;
            else
                k5 = 0;
            parcel1.writeInt(k5);
            return true;

        case 67: // 'C'
            parcel.enforceInterface("android.app.IActivityManager");
            IBinder ibinder5 = parcel.readStrongBinder();
            Intent intent5 = (Intent)Intent.CREATOR.createFromParcel(parcel);
            Bundle bundle5;
            if (parcel.readInt() != 0)
                bundle5 = (Bundle)Bundle.CREATOR.createFromParcel(parcel);
            else
                bundle5 = null;
            boolean flag = startNextMatchingActivity(ibinder5, intent5, bundle5);
            parcel1.writeNoException();
            int l4;
            if (flag)
                l4 = 1;
            else
                l4 = 0;
            parcel1.writeInt(l4);
            return true;

        case 100: // 'd'
            parcel.enforceInterface("android.app.IActivityManager");
            IApplicationThread iapplicationthread4 = ApplicationThreadNative.asInterface(parcel.readStrongBinder());
            IntentSender intentsender = (IntentSender)IntentSender.CREATOR.createFromParcel(parcel);
            int k3 = parcel.readInt();
            Intent intent4 = null;
            if (k3 != 0)
                intent4 = (Intent)Intent.CREATOR.createFromParcel(parcel);
            String s11 = parcel.readString();
            IBinder ibinder4 = parcel.readStrongBinder();
            String s12 = parcel.readString();
            int l3 = parcel.readInt();
            int i4 = parcel.readInt();
            int j4 = parcel.readInt();
            Bundle bundle4;
            if (parcel.readInt() != 0)
                bundle4 = (Bundle)Bundle.CREATOR.createFromParcel(parcel);
            else
                bundle4 = null;
            int k4 = startActivityIntentSender(iapplicationthread4, intentsender, intent4, s11, ibinder4, s12, l3, i4, j4, bundle4);
            parcel1.writeNoException();
            parcel1.writeInt(k4);
            return true;

        case 107: // 'k'
            parcel.enforceInterface("android.app.IActivityManager");
            IApplicationThread iapplicationthread3 = ApplicationThreadNative.asInterface(parcel.readStrongBinder());
            Intent intent3 = (Intent)Intent.CREATOR.createFromParcel(parcel);
            String s9 = parcel.readString();
            IBinder ibinder3 = parcel.readStrongBinder();
            String s10 = parcel.readString();
            int k2 = parcel.readInt();
            int l2 = parcel.readInt();
            Configuration configuration = (Configuration)Configuration.CREATOR.createFromParcel(parcel);
            Bundle bundle3;
            if (parcel.readInt() != 0)
                bundle3 = (Bundle)Bundle.CREATOR.createFromParcel(parcel);
            else
                bundle3 = null;
            int i3 = parcel.readInt();
            int j3 = startActivityWithConfig(iapplicationthread3, intent3, s9, ibinder3, s10, k2, l2, configuration, bundle3, i3);
            parcel1.writeNoException();
            parcel1.writeInt(j3);
            return true;

        case 105: // 'i'
            parcel.enforceInterface("android.app.IActivityManager");
            IApplicationThread iapplicationthread2 = ApplicationThreadNative.asInterface(parcel.readStrongBinder());
            Intent intent2 = (Intent)Intent.CREATOR.createFromParcel(parcel);
            String s6 = parcel.readString();
            IBinder ibinder2 = parcel.readStrongBinder();
            String s7 = parcel.readString();
            int i2 = parcel.readInt();
            int j2 = parcel.readInt();
            String s8 = parcel.readString();
            ParcelFileDescriptor parcelfiledescriptor2;
            if (parcel.readInt() != 0)
                parcelfiledescriptor2 = parcel.readFileDescriptor();
            else
                parcelfiledescriptor2 = null;
            Bundle bundle2;
            if (parcel.readInt() != 0)
                bundle2 = (Bundle)Bundle.CREATOR.createFromParcel(parcel);
            else
                bundle2 = null;
            IActivityManager.WaitResult waitresult = startActivityAndWait(iapplicationthread2, intent2, s6, ibinder2, s7, i2, j2, s8, parcelfiledescriptor2, bundle2, parcel.readInt());
            parcel1.writeNoException();
            waitresult.writeToParcel(parcel1, 0);
            return true;

        case 153: 
            parcel.enforceInterface("android.app.IActivityManager");
            IApplicationThread iapplicationthread1 = ApplicationThreadNative.asInterface(parcel.readStrongBinder());
            Intent intent1 = (Intent)Intent.CREATOR.createFromParcel(parcel);
            String s3 = parcel.readString();
            IBinder ibinder1 = parcel.readStrongBinder();
            String s4 = parcel.readString();
            int j1 = parcel.readInt();
            int k1 = parcel.readInt();
            String s5 = parcel.readString();
            ParcelFileDescriptor parcelfiledescriptor1;
            if (parcel.readInt() != 0)
                parcelfiledescriptor1 = parcel.readFileDescriptor();
            else
                parcelfiledescriptor1 = null;
            Bundle bundle1;
            if (parcel.readInt() != 0)
                bundle1 = (Bundle)Bundle.CREATOR.createFromParcel(parcel);
            else
                bundle1 = null;
            int l1 = startActivityAsUser(iapplicationthread1, intent1, s3, ibinder1, s4, j1, k1, s5, parcelfiledescriptor1, bundle1, parcel.readInt());
            parcel1.writeNoException();
            parcel1.writeInt(l1);
            return true;

        case 3: // '\003'
            parcel.enforceInterface("android.app.IActivityManager");
            IApplicationThread iapplicationthread = ApplicationThreadNative.asInterface(parcel.readStrongBinder());
            Intent intent = (Intent)Intent.CREATOR.createFromParcel(parcel);
            String s = parcel.readString();
            IBinder ibinder = parcel.readStrongBinder();
            String s1 = parcel.readString();
            int k = parcel.readInt();
            int l = parcel.readInt();
            String s2 = parcel.readString();
            ParcelFileDescriptor parcelfiledescriptor;
            if (parcel.readInt() != 0)
                parcelfiledescriptor = parcel.readFileDescriptor();
            else
                parcelfiledescriptor = null;
            Bundle bundle;
            if (parcel.readInt() != 0)
                bundle = (Bundle)Bundle.CREATOR.createFromParcel(parcel);
            else
                bundle = null;
            int i1 = startActivity(iapplicationthread, intent, s, ibinder, s1, k, l, s2, parcelfiledescriptor, bundle);
            parcel1.writeNoException();
            parcel1.writeInt(i1);
            return true;

        case 6: // '\006'
        case 7: // '\007'
        case 8: // '\b'
        case 9: // '\t'
        case 10: // '\n'
        case 160: 
        default:
            return super.onTransact(i, parcel, parcel1, j);
        }
    }

}
