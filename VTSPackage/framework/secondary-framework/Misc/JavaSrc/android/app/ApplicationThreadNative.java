// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.*;
import android.content.res.CompatibilityInfo;
import android.content.res.Configuration;
import android.os.*;
import java.io.IOException;

// Referenced classes of package android.app:
//            IApplicationThread, ApplicationThreadProxy, ResultInfo

public abstract class ApplicationThreadNative extends Binder
    implements IApplicationThread
{

    public ApplicationThreadNative()
    {
        attachInterface(this, "android.app.IApplicationThread");
    }

    public static IApplicationThread asInterface(IBinder ibinder)
    {
        IApplicationThread iapplicationthread;
        if (ibinder == null)
        {
            iapplicationthread = null;
        } else
        {
            iapplicationthread = (IApplicationThread)ibinder.queryLocalInterface("android.app.IApplicationThread");
            if (iapplicationthread == null)
                return new ApplicationThreadProxy(ibinder);
        }
        return iapplicationthread;
    }

    public IBinder asBinder()
    {
        return this;
    }

    public boolean onTransact(int i, Parcel parcel, Parcel parcel1, int j)
        throws RemoteException
    {
        i;
        JVM INSTR tableswitch 1 51: default 220
    //                   1 230
    //                   2 220
    //                   3 294
    //                   4 340
    //                   5 416
    //                   6 454
    //                   7 477
    //                   8 780
    //                   9 803
    //                   10 849
    //                   11 955
    //                   12 1160
    //                   13 1176
    //                   14 1425
    //                   15 1449
    //                   16 1465
    //                   17 1077
    //                   18 1489
    //                   19 1537
    //                   20 995
    //                   21 1049
    //                   22 1549
    //                   23 1647
    //                   24 1750
    //                   25 1786
    //                   26 682
    //                   27 378
    //                   28 1802
    //                   29 1869
    //                   30 1885
    //                   31 1925
    //                   32 1961
    //                   33 1437
    //                   34 1995
    //                   35 2015
    //                   36 2031
    //                   37 2090
    //                   38 1501
    //                   39 1513
    //                   40 2147
    //                   41 2163
    //                   42 2191
    //                   43 2207
    //                   44 2314
    //                   45 1598
    //                   46 2369
    //                   47 2424
    //                   48 2444
    //                   49 2454
    //                   50 1762
    //                   51 1774;
           goto _L1 _L2 _L1 _L3 _L4 _L5 _L6 _L7 _L8 _L9 _L10 _L11 _L12 _L13 _L14 _L15 _L16 _L17 _L18 _L19 _L20 _L21 _L22 _L23 _L24 _L25 _L26 _L27 _L28 _L29 _L30 _L31 _L32 _L33 _L34 _L35 _L36 _L37 _L38 _L39 _L40 _L41 _L42 _L43 _L44 _L45 _L46 _L47 _L48 _L49 _L50 _L51
_L1:
        return super.onTransact(i, parcel, parcel1, j);
_L2:
        parcel.enforceInterface("android.app.IApplicationThread");
        IBinder ibinder12 = parcel.readStrongBinder();
        boolean flag22;
        boolean flag23;
        int j3;
        if (parcel.readInt() != 0)
            flag22 = true;
        else
            flag22 = false;
        if (parcel.readInt() != 0)
            flag23 = true;
        else
            flag23 = false;
        j3 = parcel.readInt();
        schedulePauseActivity(ibinder12, flag22, flag23, j3);
        return true;
_L3:
        parcel.enforceInterface("android.app.IApplicationThread");
        IBinder ibinder11 = parcel.readStrongBinder();
        boolean flag21;
        int i3;
        if (parcel.readInt() != 0)
            flag21 = true;
        else
            flag21 = false;
        i3 = parcel.readInt();
        scheduleStopActivity(ibinder11, flag21, i3);
        return true;
_L4:
        parcel.enforceInterface("android.app.IApplicationThread");
        IBinder ibinder10 = parcel.readStrongBinder();
        boolean flag20;
        if (parcel.readInt() != 0)
            flag20 = true;
        else
            flag20 = false;
        scheduleWindowVisibility(ibinder10, flag20);
        return true;
_L27:
        parcel.enforceInterface("android.app.IApplicationThread");
        IBinder ibinder9 = parcel.readStrongBinder();
        boolean flag19;
        if (parcel.readInt() != 0)
            flag19 = true;
        else
            flag19 = false;
        scheduleSleeping(ibinder9, flag19);
        return true;
_L5:
        parcel.enforceInterface("android.app.IApplicationThread");
        IBinder ibinder8 = parcel.readStrongBinder();
        boolean flag18;
        if (parcel.readInt() != 0)
            flag18 = true;
        else
            flag18 = false;
        scheduleResumeActivity(ibinder8, flag18);
        return true;
_L6:
        parcel.enforceInterface("android.app.IApplicationThread");
        scheduleSendResult(parcel.readStrongBinder(), parcel.createTypedArrayList(ResultInfo.CREATOR));
        return true;
_L7:
        parcel.enforceInterface("android.app.IApplicationThread");
        Intent intent4 = (Intent)Intent.CREATOR.createFromParcel(parcel);
        IBinder ibinder7 = parcel.readStrongBinder();
        int l2 = parcel.readInt();
        ActivityInfo activityinfo1 = (ActivityInfo)ActivityInfo.CREATOR.createFromParcel(parcel);
        Configuration configuration2 = (Configuration)Configuration.CREATOR.createFromParcel(parcel);
        CompatibilityInfo compatibilityinfo2 = (CompatibilityInfo)CompatibilityInfo.CREATOR.createFromParcel(parcel);
        android.os.Bundle bundle4 = parcel.readBundle();
        java.util.ArrayList arraylist3 = parcel.createTypedArrayList(ResultInfo.CREATOR);
        java.util.ArrayList arraylist4 = parcel.createTypedArrayList(Intent.CREATOR);
        boolean flag15;
        boolean flag16;
        String s7;
        ParcelFileDescriptor parcelfiledescriptor9;
        boolean flag17;
        if (parcel.readInt() != 0)
            flag15 = true;
        else
            flag15 = false;
        if (parcel.readInt() != 0)
            flag16 = true;
        else
            flag16 = false;
        s7 = parcel.readString();
        if (parcel.readInt() != 0)
            parcelfiledescriptor9 = parcel.readFileDescriptor();
        else
            parcelfiledescriptor9 = null;
        if (parcel.readInt() != 0)
            flag17 = true;
        else
            flag17 = false;
        scheduleLaunchActivity(intent4, ibinder7, l2, activityinfo1, configuration2, compatibilityinfo2, bundle4, arraylist3, arraylist4, flag15, flag16, s7, parcelfiledescriptor9, flag17);
        return true;
_L26:
        parcel.enforceInterface("android.app.IApplicationThread");
        IBinder ibinder6 = parcel.readStrongBinder();
        java.util.ArrayList arraylist1 = parcel.createTypedArrayList(ResultInfo.CREATOR);
        java.util.ArrayList arraylist2 = parcel.createTypedArrayList(Intent.CREATOR);
        int j2 = parcel.readInt();
        boolean flag14;
        int k2;
        Configuration configuration1;
        if (parcel.readInt() != 0)
            flag14 = true;
        else
            flag14 = false;
        k2 = parcel.readInt();
        configuration1 = null;
        if (k2 != 0)
            configuration1 = (Configuration)Configuration.CREATOR.createFromParcel(parcel);
        scheduleRelaunchActivity(ibinder6, arraylist1, arraylist2, j2, flag14, configuration1);
        return true;
_L8:
        parcel.enforceInterface("android.app.IApplicationThread");
        scheduleNewIntent(parcel.createTypedArrayList(Intent.CREATOR), parcel.readStrongBinder());
        return true;
_L9:
        parcel.enforceInterface("android.app.IApplicationThread");
        IBinder ibinder5 = parcel.readStrongBinder();
        boolean flag13;
        int i2;
        if (parcel.readInt() != 0)
            flag13 = true;
        else
            flag13 = false;
        i2 = parcel.readInt();
        scheduleDestroyActivity(ibinder5, flag13, i2);
        return true;
_L10:
        parcel.enforceInterface("android.app.IApplicationThread");
        Intent intent3 = (Intent)Intent.CREATOR.createFromParcel(parcel);
        ActivityInfo activityinfo = (ActivityInfo)ActivityInfo.CREATOR.createFromParcel(parcel);
        CompatibilityInfo compatibilityinfo1 = (CompatibilityInfo)CompatibilityInfo.CREATOR.createFromParcel(parcel);
        int l1 = parcel.readInt();
        String s6 = parcel.readString();
        android.os.Bundle bundle3 = parcel.readBundle();
        boolean flag12;
        if (parcel.readInt() != 0)
            flag12 = true;
        else
            flag12 = false;
        scheduleReceiver(intent3, activityinfo, compatibilityinfo1, l1, s6, bundle3, flag12, parcel.readInt());
        return true;
_L11:
        parcel.enforceInterface("android.app.IApplicationThread");
        scheduleCreateService(parcel.readStrongBinder(), (ServiceInfo)ServiceInfo.CREATOR.createFromParcel(parcel), (CompatibilityInfo)CompatibilityInfo.CREATOR.createFromParcel(parcel));
        return true;
_L20:
        parcel.enforceInterface("android.app.IApplicationThread");
        IBinder ibinder4 = parcel.readStrongBinder();
        Intent intent2 = (Intent)Intent.CREATOR.createFromParcel(parcel);
        boolean flag11;
        if (parcel.readInt() != 0)
            flag11 = true;
        else
            flag11 = false;
        scheduleBindService(ibinder4, intent2, flag11);
        return true;
_L21:
        parcel.enforceInterface("android.app.IApplicationThread");
        scheduleUnbindService(parcel.readStrongBinder(), (Intent)Intent.CREATOR.createFromParcel(parcel));
        return true;
_L17:
        parcel.enforceInterface("android.app.IApplicationThread");
        IBinder ibinder3 = parcel.readStrongBinder();
        boolean flag10;
        int j1;
        int k1;
        Intent intent1;
        if (parcel.readInt() != 0)
            flag10 = true;
        else
            flag10 = false;
        j1 = parcel.readInt();
        k1 = parcel.readInt();
        if (parcel.readInt() != 0)
            intent1 = (Intent)Intent.CREATOR.createFromParcel(parcel);
        else
            intent1 = null;
        scheduleServiceArgs(ibinder3, flag10, j1, k1, intent1);
        return true;
_L12:
        parcel.enforceInterface("android.app.IApplicationThread");
        scheduleStopService(parcel.readStrongBinder());
        return true;
_L13:
        parcel.enforceInterface("android.app.IApplicationThread");
        String s4 = parcel.readString();
        ApplicationInfo applicationinfo = (ApplicationInfo)ApplicationInfo.CREATOR.createFromParcel(parcel);
        java.util.ArrayList arraylist = parcel.createTypedArrayList(ProviderInfo.CREATOR);
        ComponentName componentname;
        String s5;
        ParcelFileDescriptor parcelfiledescriptor8;
        boolean flag6;
        android.os.Bundle bundle1;
        IInstrumentationWatcher iinstrumentationwatcher;
        int i1;
        boolean flag7;
        boolean flag8;
        boolean flag9;
        Configuration configuration;
        CompatibilityInfo compatibilityinfo;
        java.util.HashMap hashmap;
        android.os.Bundle bundle2;
        if (parcel.readInt() != 0)
            componentname = new ComponentName(parcel);
        else
            componentname = null;
        s5 = parcel.readString();
        if (parcel.readInt() != 0)
            parcelfiledescriptor8 = parcel.readFileDescriptor();
        else
            parcelfiledescriptor8 = null;
        if (parcel.readInt() != 0)
            flag6 = true;
        else
            flag6 = false;
        bundle1 = parcel.readBundle();
        iinstrumentationwatcher = IInstrumentationWatcher.Stub.asInterface(parcel.readStrongBinder());
        i1 = parcel.readInt();
        if (parcel.readInt() != 0)
            flag7 = true;
        else
            flag7 = false;
        if (parcel.readInt() != 0)
            flag8 = true;
        else
            flag8 = false;
        if (parcel.readInt() != 0)
            flag9 = true;
        else
            flag9 = false;
        configuration = (Configuration)Configuration.CREATOR.createFromParcel(parcel);
        compatibilityinfo = (CompatibilityInfo)CompatibilityInfo.CREATOR.createFromParcel(parcel);
        hashmap = parcel.readHashMap(null);
        bundle2 = parcel.readBundle();
        bindApplication(s4, applicationinfo, arraylist, componentname, s5, parcelfiledescriptor8, flag6, bundle1, iinstrumentationwatcher, i1, flag7, flag8, flag9, configuration, compatibilityinfo, hashmap, bundle2);
        return true;
_L14:
        parcel.enforceInterface("android.app.IApplicationThread");
        scheduleExit();
        return true;
_L33:
        parcel.enforceInterface("android.app.IApplicationThread");
        scheduleSuicide();
        return true;
_L15:
        parcel.enforceInterface("android.app.IApplicationThread");
        requestThumbnail(parcel.readStrongBinder());
        return true;
_L16:
        parcel.enforceInterface("android.app.IApplicationThread");
        scheduleConfigurationChanged((Configuration)Configuration.CREATOR.createFromParcel(parcel));
        return true;
_L18:
        parcel.enforceInterface("android.app.IApplicationThread");
        updateTimeZone();
        return true;
_L38:
        parcel.enforceInterface("android.app.IApplicationThread");
        clearDnsCache();
        return true;
_L39:
        parcel.enforceInterface("android.app.IApplicationThread");
        setHttpProxy(parcel.readString(), parcel.readString(), parcel.readString());
        return true;
_L19:
        parcel.enforceInterface("android.app.IApplicationThread");
        processInBackground();
        return true;
_L22:
        parcel.enforceInterface("android.app.IApplicationThread");
        ParcelFileDescriptor parcelfiledescriptor7 = parcel.readFileDescriptor();
        IBinder ibinder2 = parcel.readStrongBinder();
        String as5[] = parcel.readStringArray();
        if (parcelfiledescriptor7 != null)
        {
            dumpService(parcelfiledescriptor7.getFileDescriptor(), ibinder2, as5);
            ParcelFileDescriptor parcelfiledescriptor;
            String as[];
            Exception exception;
            ParcelFileDescriptor parcelfiledescriptor1;
            String as1[];
            Exception exception1;
            ParcelFileDescriptor parcelfiledescriptor2;
            boolean flag;
            boolean flag1;
            String as2[];
            android.os.Debug.MemoryInfo memoryinfo;
            Exception exception2;
            android.os.Debug.MemoryInfo memoryinfo1;
            ParcelFileDescriptor parcelfiledescriptor3;
            IBinder ibinder;
            String s;
            String as3[];
            boolean flag2;
            String s1;
            ParcelFileDescriptor parcelfiledescriptor4;
            android.os.Debug.MemoryInfo memoryinfo2;
            boolean flag3;
            int k;
            String s2;
            ParcelFileDescriptor parcelfiledescriptor5;
            android.content.IIntentReceiver iintentreceiver;
            Intent intent;
            int l;
            String s3;
            android.os.Bundle bundle;
            boolean flag4;
            boolean flag5;
            ParcelFileDescriptor parcelfiledescriptor6;
            IBinder ibinder1;
            String as4[];
            try
            {
                parcelfiledescriptor7.close();
            }
            catch (IOException ioexception8) { }
        }
        return true;
_L45:
        parcel.enforceInterface("android.app.IApplicationThread");
        parcelfiledescriptor6 = parcel.readFileDescriptor();
        ibinder1 = parcel.readStrongBinder();
        as4 = parcel.readStringArray();
        if (parcelfiledescriptor6 != null)
        {
            dumpProvider(parcelfiledescriptor6.getFileDescriptor(), ibinder1, as4);
            try
            {
                parcelfiledescriptor6.close();
            }
            catch (IOException ioexception7) { }
        }
        return true;
_L23:
        parcel.enforceInterface("android.app.IApplicationThread");
        iintentreceiver = android.content.IIntentReceiver.Stub.asInterface(parcel.readStrongBinder());
        intent = (Intent)Intent.CREATOR.createFromParcel(parcel);
        l = parcel.readInt();
        s3 = parcel.readString();
        bundle = parcel.readBundle();
        if (parcel.readInt() != 0)
            flag4 = true;
        else
            flag4 = false;
        if (parcel.readInt() != 0)
            flag5 = true;
        else
            flag5 = false;
        scheduleRegisteredReceiver(iintentreceiver, intent, l, s3, bundle, flag4, flag5, parcel.readInt());
        return true;
_L24:
        parcel.enforceInterface("android.app.IApplicationThread");
        scheduleLowMemory();
        return true;
_L50:
        parcel.enforceInterface("android.app.IApplicationThread");
        setTrimMemoryFlagEx();
        return true;
_L51:
        parcel.enforceInterface("android.app.IApplicationThread");
        ResetSL();
        return true;
_L25:
        parcel.enforceInterface("android.app.IApplicationThread");
        scheduleActivityConfigurationChanged(parcel.readStrongBinder());
        return true;
_L28:
        parcel.enforceInterface("android.app.IApplicationThread");
        if (parcel.readInt() != 0)
            flag3 = true;
        else
            flag3 = false;
        k = parcel.readInt();
        s2 = parcel.readString();
        if (parcel.readInt() != 0)
            parcelfiledescriptor5 = parcel.readFileDescriptor();
        else
            parcelfiledescriptor5 = null;
        profilerControl(flag3, s2, parcelfiledescriptor5, k);
        return true;
_L29:
        parcel.enforceInterface("android.app.IApplicationThread");
        setSchedulingGroup(parcel.readInt());
        return true;
_L30:
        parcel.enforceInterface("android.app.IApplicationThread");
        scheduleCreateBackupAgent((ApplicationInfo)ApplicationInfo.CREATOR.createFromParcel(parcel), (CompatibilityInfo)CompatibilityInfo.CREATOR.createFromParcel(parcel), parcel.readInt());
        return true;
_L31:
        parcel.enforceInterface("android.app.IApplicationThread");
        scheduleDestroyBackupAgent((ApplicationInfo)ApplicationInfo.CREATOR.createFromParcel(parcel), (CompatibilityInfo)CompatibilityInfo.CREATOR.createFromParcel(parcel));
        return true;
_L32:
        parcel.enforceInterface("android.app.IApplicationThread");
        memoryinfo2 = new android.os.Debug.MemoryInfo();
        getMemoryInfo(memoryinfo2);
        parcel1.writeNoException();
        memoryinfo2.writeToParcel(parcel1, 0);
        return true;
_L34:
        parcel.enforceInterface("android.app.IApplicationThread");
        dispatchPackageBroadcast(parcel.readInt(), parcel.readStringArray());
        return true;
_L35:
        parcel.enforceInterface("android.app.IApplicationThread");
        scheduleCrash(parcel.readString());
        return true;
_L36:
        parcel.enforceInterface("android.app.IApplicationThread");
        if (parcel.readInt() != 0)
            flag2 = true;
        else
            flag2 = false;
        s1 = parcel.readString();
        if (parcel.readInt() != 0)
            parcelfiledescriptor4 = parcel.readFileDescriptor();
        else
            parcelfiledescriptor4 = null;
        dumpHeap(flag2, s1, parcelfiledescriptor4);
        return true;
_L37:
        parcel.enforceInterface("android.app.IApplicationThread");
        parcelfiledescriptor3 = parcel.readFileDescriptor();
        ibinder = parcel.readStrongBinder();
        s = parcel.readString();
        as3 = parcel.readStringArray();
        if (parcelfiledescriptor3 != null)
        {
            dumpActivity(parcelfiledescriptor3.getFileDescriptor(), ibinder, s, as3);
            try
            {
                parcelfiledescriptor3.close();
            }
            catch (IOException ioexception6) { }
        }
        return true;
_L40:
        parcel.enforceInterface("android.app.IApplicationThread");
        setCoreSettings(parcel.readBundle());
        return true;
_L41:
        parcel.enforceInterface("android.app.IApplicationThread");
        updatePackageCompatibilityInfo(parcel.readString(), (CompatibilityInfo)CompatibilityInfo.CREATOR.createFromParcel(parcel));
        return true;
_L42:
        parcel.enforceInterface("android.app.IApplicationThread");
        scheduleTrimMemory(parcel.readInt());
        return true;
_L43:
        parcel.enforceInterface("android.app.IApplicationThread");
        parcelfiledescriptor2 = parcel.readFileDescriptor();
        if (parcel.readInt() != 0)
            flag = true;
        else
            flag = false;
        if (parcel.readInt() != 0)
            flag1 = true;
        else
            flag1 = false;
        as2 = parcel.readStringArray();
        memoryinfo = null;
        if (parcelfiledescriptor2 == null) goto _L53; else goto _L52
_L52:
        memoryinfo1 = dumpMemInfo(parcelfiledescriptor2.getFileDescriptor(), flag, flag1, as2);
        memoryinfo = memoryinfo1;
        IOException ioexception4;
        try
        {
            parcelfiledescriptor2.close();
        }
        catch (IOException ioexception5) { }
_L53:
        parcel1.writeNoException();
        memoryinfo.writeToParcel(parcel1, 0);
        return true;
        exception2;
        try
        {
            parcelfiledescriptor2.close();
        }
        // Misplaced declaration of an exception variable
        catch (IOException ioexception4) { }
        throw exception2;
_L44:
        parcel.enforceInterface("android.app.IApplicationThread");
        parcelfiledescriptor1 = parcel.readFileDescriptor();
        as1 = parcel.readStringArray();
        if (parcelfiledescriptor1 == null) goto _L55; else goto _L54
_L54:
        dumpGfxInfo(parcelfiledescriptor1.getFileDescriptor(), as1);
        try
        {
            parcelfiledescriptor1.close();
        }
        catch (IOException ioexception3) { }
_L55:
        parcel1.writeNoException();
        return true;
        exception1;
        try
        {
            parcelfiledescriptor1.close();
        }
        catch (IOException ioexception2) { }
        throw exception1;
_L46:
        parcel.enforceInterface("android.app.IApplicationThread");
        parcelfiledescriptor = parcel.readFileDescriptor();
        as = parcel.readStringArray();
        if (parcelfiledescriptor == null) goto _L57; else goto _L56
_L56:
        dumpDbInfo(parcelfiledescriptor.getFileDescriptor(), as);
        try
        {
            parcelfiledescriptor.close();
        }
        catch (IOException ioexception1) { }
_L57:
        parcel1.writeNoException();
        return true;
        exception;
        try
        {
            parcelfiledescriptor.close();
        }
        catch (IOException ioexception) { }
        throw exception;
_L47:
        parcel.enforceInterface("android.app.IApplicationThread");
        unstableProviderDied(parcel.readStrongBinder());
        parcel1.writeNoException();
        return true;
_L48:
        parcel1.writeString(dumpMessageHistory());
        return true;
_L49:
        enableLooperLog();
        return true;
    }
}
