// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.*;
import android.content.pm.*;
import android.content.res.Resources;
import android.content.res.XmlResourceParser;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Process;
import android.os.RemoteException;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.*;

// Referenced classes of package android.app:
//            ActivityThread, ContextImpl

final class ApplicationPackageManager extends PackageManager
{
    private static final class ResourceName
    {

        final int iconId;
        final String packageName;

        public boolean equals(Object obj)
        {
label0:
            {
label1:
                {
                    ResourceName resourcename;
label2:
                    {
                        if (this != obj)
                        {
                            if (obj == null || getClass() != obj.getClass())
                                break label0;
                            resourcename = (ResourceName)obj;
                            if (iconId != resourcename.iconId)
                                return false;
                            if (packageName == null)
                                break label2;
                            if (!packageName.equals(resourcename.packageName))
                                break label1;
                        }
                        return true;
                    }
                    if (resourcename.packageName == null)
                        return true;
                }
                return false;
            }
            return false;
        }

        public int hashCode()
        {
            return 31 * packageName.hashCode() + iconId;
        }

        public String toString()
        {
            return (new StringBuilder()).append("{ResourceName ").append(packageName).append(" / ").append(iconId).append("}").toString();
        }

        ResourceName(ApplicationInfo applicationinfo, int i)
        {
            this(applicationinfo.packageName, i);
        }

        ResourceName(ComponentInfo componentinfo, int i)
        {
            this(componentinfo.applicationInfo.packageName, i);
        }

        ResourceName(ResolveInfo resolveinfo, int i)
        {
            this(((ComponentInfo) (resolveinfo.activityInfo)).applicationInfo.packageName, i);
        }

        ResourceName(String s, int i)
        {
            packageName = s;
            iconId = i;
        }
    }


    private static final boolean DEBUG = false;
    private static final boolean DEBUG_ICONS = false;
    private static final String TAG = "ApplicationPackageManager";
    private static HashMap sIconCache = new HashMap();
    private static HashMap sStringCache = new HashMap();
    private static final Object sSync = new Object();
    int mCachedSafeMode;
    private final ContextImpl mContext;
    private final IPackageManager mPM;

    ApplicationPackageManager(ContextImpl contextimpl, IPackageManager ipackagemanager)
    {
        mCachedSafeMode = -1;
        mContext = contextimpl;
        mPM = ipackagemanager;
    }

    static void configurationChanged()
    {
        synchronized (sSync)
        {
            sIconCache.clear();
            sStringCache.clear();
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private Drawable getCachedIcon(ResourceName resourcename)
    {
        Object obj = sSync;
        obj;
        JVM INSTR monitorenter ;
        WeakReference weakreference = (WeakReference)sIconCache.get(resourcename);
        if (weakreference == null)
            break MISSING_BLOCK_LABEL_58;
        android.graphics.drawable.Drawable.ConstantState constantstate = (android.graphics.drawable.Drawable.ConstantState)weakreference.get();
        if (constantstate == null)
            break MISSING_BLOCK_LABEL_50;
        Drawable drawable = constantstate.newDrawable();
        obj;
        JVM INSTR monitorexit ;
        return drawable;
        sIconCache.remove(resourcename);
        obj;
        JVM INSTR monitorexit ;
        return null;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private CharSequence getCachedString(ResourceName resourcename)
    {
        Object obj = sSync;
        obj;
        JVM INSTR monitorenter ;
        WeakReference weakreference = (WeakReference)sStringCache.get(resourcename);
        if (weakreference == null)
            break MISSING_BLOCK_LABEL_51;
        CharSequence charsequence = (CharSequence)weakreference.get();
        if (charsequence == null)
            break MISSING_BLOCK_LABEL_43;
        obj;
        JVM INSTR monitorexit ;
        return charsequence;
        sStringCache.remove(resourcename);
        obj;
        JVM INSTR monitorexit ;
        return null;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    static void handlePackageBroadcast(int i, String as[], boolean flag)
    {
        boolean flag1;
        boolean flag2;
        int j;
        int k;
        flag1 = false;
        if (i == 1)
            flag1 = true;
        if (as == null || as.length <= 0)
            break MISSING_BLOCK_LABEL_217;
        flag2 = false;
        j = as.length;
        k = 0;
_L4:
        String s;
        if (k >= j)
            break; /* Loop/switch isn't completed */
        s = as[k];
        Object obj = sSync;
        obj;
        JVM INSTR monitorenter ;
        Iterator iterator1;
        if (sIconCache.size() <= 0)
            break MISSING_BLOCK_LABEL_115;
        iterator1 = sIconCache.keySet().iterator();
_L1:
        do
            if (!iterator1.hasNext())
                break MISSING_BLOCK_LABEL_115;
        while (!((ResourceName)iterator1.next()).packageName.equals(s));
        iterator1.remove();
        flag2 = true;
          goto _L1
        Iterator iterator;
        if (sStringCache.size() <= 0)
            break MISSING_BLOCK_LABEL_181;
        iterator = sStringCache.keySet().iterator();
_L2:
        do
            if (!iterator.hasNext())
                break MISSING_BLOCK_LABEL_181;
        while (!((ResourceName)iterator.next()).packageName.equals(s));
        iterator.remove();
        flag2 = true;
          goto _L2
        obj;
        JVM INSTR monitorexit ;
        k++;
        if (true) goto _L4; else goto _L3
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
_L3:
        if (flag2 || flag)
        {
            if (!flag1)
                break MISSING_BLOCK_LABEL_218;
            Runtime.getRuntime().gc();
        }
        return;
        ActivityThread.currentActivityThread().scheduleGcIdler();
        return;
    }

    private void putCachedIcon(ResourceName resourcename, Drawable drawable)
    {
        synchronized (sSync)
        {
            sIconCache.put(resourcename, new WeakReference(drawable.getConstantState()));
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void putCachedString(ResourceName resourcename, CharSequence charsequence)
    {
        synchronized (sSync)
        {
            sStringCache.put(resourcename, new WeakReference(charsequence));
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void addPackageToPreferred(String s)
    {
        try
        {
            mPM.addPackageToPreferred(s);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public boolean addPermission(PermissionInfo permissioninfo)
    {
        boolean flag;
        try
        {
            flag = mPM.addPermission(permissioninfo);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return flag;
    }

    public boolean addPermissionAsync(PermissionInfo permissioninfo)
    {
        boolean flag;
        try
        {
            flag = mPM.addPermissionAsync(permissioninfo);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return flag;
    }

    public void addPreferredActivity(IntentFilter intentfilter, int i, ComponentName acomponentname[], ComponentName componentname)
    {
        try
        {
            mPM.addPreferredActivity(intentfilter, i, acomponentname, componentname, mContext.getUserId());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void addPreferredActivity(IntentFilter intentfilter, int i, ComponentName acomponentname[], ComponentName componentname, int j)
    {
        try
        {
            mPM.addPreferredActivity(intentfilter, i, acomponentname, componentname, j);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public String[] canonicalToCurrentPackageNames(String as[])
    {
        String as1[];
        try
        {
            as1 = mPM.canonicalToCurrentPackageNames(as);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return as1;
    }

    public int checkAPKSignatures(String s)
    {
        int i;
        try
        {
            i = mPM.checkAPKSignatures(s);
        }
        catch (RemoteException remoteexception)
        {
            return 0;
        }
        return i;
    }

    public int checkPermission(String s, String s1)
    {
        int i;
        try
        {
            i = mPM.checkPermission(s, s1);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return i;
    }

    public int checkSignatures(int i, int j)
    {
        int k;
        try
        {
            k = mPM.checkUidSignatures(i, j);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return k;
    }

    public int checkSignatures(String s, String s1)
    {
        int i;
        try
        {
            i = mPM.checkSignatures(s, s1);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return i;
    }

    public void clearApplicationUserData(String s, IPackageDataObserver ipackagedataobserver)
    {
        try
        {
            mPM.clearApplicationUserData(s, ipackagedataobserver, mContext.getUserId());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void clearPackagePreferredActivities(String s)
    {
        try
        {
            mPM.clearPackagePreferredActivities(s);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public String[] currentToCanonicalPackageNames(String as[])
    {
        String as1[];
        try
        {
            as1 = mPM.currentToCanonicalPackageNames(as);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return as1;
    }

    public void deleteApplicationCacheFiles(String s, IPackageDataObserver ipackagedataobserver)
    {
        try
        {
            mPM.deleteApplicationCacheFiles(s, ipackagedataobserver);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void deletePackage(String s, IPackageDeleteObserver ipackagedeleteobserver, int i)
    {
        try
        {
            mPM.deletePackage(s, ipackagedeleteobserver, i);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void extendVerificationTimeout(int i, int j, long l)
    {
        try
        {
            mPM.extendVerificationTimeout(i, j, l);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void freeStorage(long l, IntentSender intentsender)
    {
        try
        {
            mPM.freeStorage(l, intentsender);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void freeStorageAndNotify(long l, IPackageDataObserver ipackagedataobserver)
    {
        try
        {
            mPM.freeStorageAndNotify(l, ipackagedataobserver);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public Drawable getActivityIcon(ComponentName componentname)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        return getActivityInfo(componentname, 0).loadIcon(this);
    }

    public Drawable getActivityIcon(Intent intent)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        if (intent.getComponent() != null)
            return getActivityIcon(intent.getComponent());
        ResolveInfo resolveinfo = resolveActivity(intent, 0x10000);
        if (resolveinfo != null)
            return resolveinfo.activityInfo.loadIcon(this);
        else
            throw new android.content.pm.PackageManager.NameNotFoundException(intent.toUri(0));
    }

    public ActivityInfo getActivityInfo(ComponentName componentname, int i)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        ActivityInfo activityinfo;
        try
        {
            activityinfo = mPM.getActivityInfo(componentname, i, mContext.getUserId());
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        if (activityinfo != null)
            return activityinfo;
        else
            throw new android.content.pm.PackageManager.NameNotFoundException(componentname.toString());
    }

    public Drawable getActivityLogo(ComponentName componentname)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        return getActivityInfo(componentname, 0).loadLogo(this);
    }

    public Drawable getActivityLogo(Intent intent)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        if (intent.getComponent() != null)
            return getActivityLogo(intent.getComponent());
        ResolveInfo resolveinfo = resolveActivity(intent, 0x10000);
        if (resolveinfo != null)
            return resolveinfo.activityInfo.loadLogo(this);
        else
            throw new android.content.pm.PackageManager.NameNotFoundException(intent.toUri(0));
    }

    public List getAllPermissionGroups(int i)
    {
        List list;
        try
        {
            list = mPM.getAllPermissionGroups(i);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return list;
    }

    public int getApplicationEnabledSetting(String s)
    {
        int i;
        try
        {
            i = mPM.getApplicationEnabledSetting(s, mContext.getUserId());
        }
        catch (RemoteException remoteexception)
        {
            return 0;
        }
        return i;
    }

    public Drawable getApplicationIcon(ApplicationInfo applicationinfo)
    {
        return applicationinfo.loadIcon(this);
    }

    public Drawable getApplicationIcon(String s)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        return getApplicationIcon(getApplicationInfo(s, 0));
    }

    public ApplicationInfo getApplicationInfo(String s, int i)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        ApplicationInfo applicationinfo;
        try
        {
            applicationinfo = mPM.getApplicationInfo(s, i, mContext.getUserId());
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        if (applicationinfo != null)
            return applicationinfo;
        else
            throw new android.content.pm.PackageManager.NameNotFoundException(s);
    }

    public CharSequence getApplicationLabel(ApplicationInfo applicationinfo)
    {
        return applicationinfo.loadLabel(this);
    }

    public Drawable getApplicationLogo(ApplicationInfo applicationinfo)
    {
        return applicationinfo.loadLogo(this);
    }

    public Drawable getApplicationLogo(String s)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        return getApplicationLogo(getApplicationInfo(s, 0));
    }

    public int getComponentEnabledSetting(ComponentName componentname)
    {
        int i;
        try
        {
            i = mPM.getComponentEnabledSetting(componentname, mContext.getUserId());
        }
        catch (RemoteException remoteexception)
        {
            return 0;
        }
        return i;
    }

    public Drawable getDefaultActivityIcon()
    {
        return Resources.getSystem().getDrawable(0x1080093);
    }

    public Drawable getDrawable(String s, int i, ApplicationInfo applicationinfo)
    {
        ResourceName resourcename = new ResourceName(s, i);
        Drawable drawable = getCachedIcon(resourcename);
        if (drawable != null)
            return drawable;
        if (applicationinfo == null)
        {
            Drawable drawable1;
            ApplicationInfo applicationinfo1;
            try
            {
                applicationinfo1 = getApplicationInfo(s, 0);
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception1)
            {
                return null;
            }
            applicationinfo = applicationinfo1;
        }
        try
        {
            drawable1 = getResourcesForApplication(applicationinfo).getDrawable(i);
            putCachedIcon(resourcename, drawable1);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            Log.w("PackageManager", (new StringBuilder()).append("Failure retrieving resources for").append(applicationinfo.packageName).toString());
            return null;
        }
        catch (android.content.res.Resources.NotFoundException notfoundexception)
        {
            Log.w("PackageManager", (new StringBuilder()).append("Failure retrieving resources for").append(applicationinfo.packageName).append(": ").append(notfoundexception.getMessage()).toString());
            return null;
        }
        catch (RuntimeException runtimeexception)
        {
            Log.w("PackageManager", (new StringBuilder()).append("Failure retrieving icon 0x").append(Integer.toHexString(i)).append(" in package ").append(s).toString(), runtimeexception);
            return null;
        }
        return drawable1;
    }

    public List getInstalledApplications(int i)
    {
        int j = mContext.getUserId();
        ArrayList arraylist;
        ApplicationInfo applicationinfo;
        String s;
        ParceledListSlice parceledlistslice;
        boolean flag;
        try
        {
            arraylist = new ArrayList();
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        applicationinfo = null;
        if (applicationinfo == null)
            break MISSING_BLOCK_LABEL_74;
        s = applicationinfo.packageName;
_L1:
        parceledlistslice = mPM.getInstalledApplications(i, s, j);
        applicationinfo = (ApplicationInfo)parceledlistslice.populateList(arraylist, ApplicationInfo.CREATOR);
        flag = parceledlistslice.isLastSlice();
        if (flag)
            return arraylist;
        break MISSING_BLOCK_LABEL_19;
        s = null;
          goto _L1
    }

    public List getInstalledPackages(int i)
    {
        return getInstalledPackages(i, mContext.getUserId());
    }

    public List getInstalledPackages(int i, int j)
    {
        ArrayList arraylist;
        PackageInfo packageinfo;
        String s;
        ParceledListSlice parceledlistslice;
        boolean flag;
        try
        {
            arraylist = new ArrayList();
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        packageinfo = null;
        if (packageinfo == null)
            break MISSING_BLOCK_LABEL_66;
        s = packageinfo.packageName;
_L1:
        parceledlistslice = mPM.getInstalledPackages(i, s, j);
        packageinfo = (PackageInfo)parceledlistslice.populateList(arraylist, PackageInfo.CREATOR);
        flag = parceledlistslice.isLastSlice();
        if (flag)
            return arraylist;
        break MISSING_BLOCK_LABEL_11;
        s = null;
          goto _L1
    }

    public String getInstallerPackageName(String s)
    {
        String s1;
        try
        {
            s1 = mPM.getInstallerPackageName(s);
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return s1;
    }

    public InstrumentationInfo getInstrumentationInfo(ComponentName componentname, int i)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        InstrumentationInfo instrumentationinfo;
        try
        {
            instrumentationinfo = mPM.getInstrumentationInfo(componentname, i);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        if (instrumentationinfo != null)
            return instrumentationinfo;
        else
            throw new android.content.pm.PackageManager.NameNotFoundException(componentname.toString());
    }

    public Intent getLaunchIntentForPackage(String s)
    {
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.addCategory("android.intent.category.INFO");
        intent.setPackage(s);
        List list = queryIntentActivities(intent, 0);
        if (list == null || list.size() <= 0)
        {
            intent.removeCategory("android.intent.category.INFO");
            intent.addCategory("android.intent.category.LAUNCHER");
            intent.setPackage(s);
            list = queryIntentActivities(intent, 0);
        }
        if (list != null && list.size() > 0)
        {
            Intent intent1 = new Intent(intent);
            intent1.setFlags(0x10000000);
            intent1.setClassName(((ResolveInfo)list.get(0)).activityInfo.packageName, ((ComponentInfo) (((ResolveInfo)list.get(0)).activityInfo)).name);
            return intent1;
        } else
        {
            return null;
        }
    }

    public String getNameForUid(int i)
    {
        String s;
        try
        {
            s = mPM.getNameForUid(i);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return s;
    }

    public int[] getPackageGids(String s)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        int ai[];
        int i;
        try
        {
            ai = mPM.getPackageGids(s);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        if (ai == null)
            break MISSING_BLOCK_LABEL_24;
        i = ai.length;
        if (i <= 0)
            break MISSING_BLOCK_LABEL_38;
        return ai;
        throw new android.content.pm.PackageManager.NameNotFoundException(s);
    }

    public PackageInfo getPackageInfo(String s, int i)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        PackageInfo packageinfo;
        try
        {
            packageinfo = mPM.getPackageInfo(s, i, mContext.getUserId());
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        if (packageinfo != null)
            return packageinfo;
        else
            throw new android.content.pm.PackageManager.NameNotFoundException(s);
    }

    public void getPackageSizeInfo(String s, int i, IPackageStatsObserver ipackagestatsobserver)
    {
        try
        {
            mPM.getPackageSizeInfo(s, i, ipackagestatsobserver);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public String[] getPackagesForUid(int i)
    {
        String as[];
        try
        {
            as = mPM.getPackagesForUid(i);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return as;
    }

    public PermissionGroupInfo getPermissionGroupInfo(String s, int i)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        PermissionGroupInfo permissiongroupinfo;
        try
        {
            permissiongroupinfo = mPM.getPermissionGroupInfo(s, i);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        if (permissiongroupinfo != null)
            return permissiongroupinfo;
        else
            throw new android.content.pm.PackageManager.NameNotFoundException(s);
    }

    public PermissionInfo getPermissionInfo(String s, int i)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        PermissionInfo permissioninfo;
        try
        {
            permissioninfo = mPM.getPermissionInfo(s, i);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        if (permissioninfo != null)
            return permissioninfo;
        else
            throw new android.content.pm.PackageManager.NameNotFoundException(s);
    }

    public int getPreferredActivities(List list, List list1, String s)
    {
        int i;
        try
        {
            i = mPM.getPreferredActivities(list, list1, s);
        }
        catch (RemoteException remoteexception)
        {
            return 0;
        }
        return i;
    }

    public List getPreferredPackages(int i)
    {
        List list;
        try
        {
            list = mPM.getPreferredPackages(i);
        }
        catch (RemoteException remoteexception)
        {
            return new ArrayList();
        }
        return list;
    }

    public ProviderInfo getProviderInfo(ComponentName componentname, int i)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        ProviderInfo providerinfo;
        try
        {
            providerinfo = mPM.getProviderInfo(componentname, i, mContext.getUserId());
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        if (providerinfo != null)
            return providerinfo;
        else
            throw new android.content.pm.PackageManager.NameNotFoundException(componentname.toString());
    }

    public ActivityInfo getReceiverInfo(ComponentName componentname, int i)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        ActivityInfo activityinfo;
        try
        {
            activityinfo = mPM.getReceiverInfo(componentname, i, mContext.getUserId());
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        if (activityinfo != null)
            return activityinfo;
        else
            throw new android.content.pm.PackageManager.NameNotFoundException(componentname.toString());
    }

    public Resources getResourcesForActivity(ComponentName componentname)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        return getResourcesForApplication(((ComponentInfo) (getActivityInfo(componentname, 0))).applicationInfo);
    }

    public Resources getResourcesForApplication(ApplicationInfo applicationinfo)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        Resources resources;
        if (applicationinfo.packageName.equals("system"))
        {
            resources = mContext.mMainThread.getSystemContext().getResources();
        } else
        {
            ActivityThread activitythread = mContext.mMainThread;
            String s;
            if (applicationinfo.uid == Process.myUid())
                s = applicationinfo.sourceDir;
            else
                s = applicationinfo.publicSourceDir;
            resources = activitythread.getTopLevelResources(s, 0, null, mContext.mPackageInfo);
            if (resources == null)
                throw new android.content.pm.PackageManager.NameNotFoundException((new StringBuilder()).append("Unable to open ").append(applicationinfo.publicSourceDir).toString());
        }
        return resources;
    }

    public Resources getResourcesForApplication(String s)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        return getResourcesForApplication(getApplicationInfo(s, 0));
    }

    public Resources getResourcesForApplicationAsUser(String s, int i)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        if (i < 0)
            throw new IllegalArgumentException((new StringBuilder()).append("Call does not support special user #").append(i).toString());
        if ("system".equals(s))
            return mContext.mMainThread.getSystemContext().getResources();
        ApplicationInfo applicationinfo;
        Resources resources;
        try
        {
            applicationinfo = mPM.getApplicationInfo(s, 0, i);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        if (applicationinfo == null)
            break MISSING_BLOCK_LABEL_98;
        resources = getResourcesForApplication(applicationinfo);
        return resources;
        throw new android.content.pm.PackageManager.NameNotFoundException((new StringBuilder()).append("Package ").append(s).append(" doesn't exist").toString());
    }

    public ServiceInfo getServiceInfo(ComponentName componentname, int i)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        ServiceInfo serviceinfo;
        try
        {
            serviceinfo = mPM.getServiceInfo(componentname, i, mContext.getUserId());
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        if (serviceinfo != null)
            return serviceinfo;
        else
            throw new android.content.pm.PackageManager.NameNotFoundException(componentname.toString());
    }

    public FeatureInfo[] getSystemAvailableFeatures()
    {
        FeatureInfo afeatureinfo[];
        try
        {
            afeatureinfo = mPM.getSystemAvailableFeatures();
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return afeatureinfo;
    }

    public String[] getSystemSharedLibraryNames()
    {
        String as[];
        try
        {
            as = mPM.getSystemSharedLibraryNames();
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return as;
    }

    public CharSequence getText(String s, int i, ApplicationInfo applicationinfo)
    {
        ResourceName resourcename = new ResourceName(s, i);
        CharSequence charsequence = getCachedString(resourcename);
        if (charsequence != null)
            return charsequence;
        if (applicationinfo == null)
        {
            CharSequence charsequence1;
            ApplicationInfo applicationinfo1;
            try
            {
                applicationinfo1 = getApplicationInfo(s, 0);
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception1)
            {
                return null;
            }
            applicationinfo = applicationinfo1;
        }
        try
        {
            charsequence1 = getResourcesForApplication(applicationinfo).getText(i);
            putCachedString(resourcename, charsequence1);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            Log.w("PackageManager", (new StringBuilder()).append("Failure retrieving resources for").append(applicationinfo.packageName).toString());
            return null;
        }
        catch (RuntimeException runtimeexception)
        {
            Log.w("PackageManager", (new StringBuilder()).append("Failure retrieving text 0x").append(Integer.toHexString(i)).append(" in package ").append(s).toString(), runtimeexception);
            return null;
        }
        return charsequence1;
    }

    public int getUidForSharedUser(String s)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        int i;
        try
        {
            i = mPM.getUidForSharedUser(s);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        if (i != -1)
            return i;
        else
            throw new android.content.pm.PackageManager.NameNotFoundException((new StringBuilder()).append("No shared userid for user:").append(s).toString());
    }

    public VerifierDeviceIdentity getVerifierDeviceIdentity()
    {
        VerifierDeviceIdentity verifierdeviceidentity;
        try
        {
            verifierdeviceidentity = mPM.getVerifierDeviceIdentity();
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return verifierdeviceidentity;
    }

    public XmlResourceParser getXml(String s, int i, ApplicationInfo applicationinfo)
    {
        if (applicationinfo == null)
        {
            XmlResourceParser xmlresourceparser;
            ApplicationInfo applicationinfo1;
            try
            {
                applicationinfo1 = getApplicationInfo(s, 0);
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception1)
            {
                return null;
            }
            applicationinfo = applicationinfo1;
        }
        try
        {
            xmlresourceparser = getResourcesForApplication(applicationinfo).getXml(i);
        }
        catch (RuntimeException runtimeexception)
        {
            Log.w("PackageManager", (new StringBuilder()).append("Failure retrieving xml 0x").append(Integer.toHexString(i)).append(" in package ").append(s).toString(), runtimeexception);
            return null;
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            Log.w("PackageManager", (new StringBuilder()).append("Failure retrieving resources for ").append(applicationinfo.packageName).toString());
            return null;
        }
        return xmlresourceparser;
    }

    public void grantPermission(String s, String s1)
    {
        try
        {
            mPM.grantPermission(s, s1);
            return;
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
    }

    public boolean hasSystemFeature(String s)
    {
        boolean flag;
        try
        {
            flag = mPM.hasSystemFeature(s);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return flag;
    }

    public int installExistingPackage(String s)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        int i;
        try
        {
            i = mPM.installExistingPackage(s);
        }
        catch (RemoteException remoteexception)
        {
            throw new android.content.pm.PackageManager.NameNotFoundException((new StringBuilder()).append("Package ").append(s).append(" doesn't exist").toString());
        }
        if (i != -3)
            break MISSING_BLOCK_LABEL_86;
        throw new android.content.pm.PackageManager.NameNotFoundException((new StringBuilder()).append("Package ").append(s).append(" doesn't exist").toString());
        return i;
    }

    public void installPackage(Uri uri, IPackageInstallObserver ipackageinstallobserver, int i, String s)
    {
        try
        {
            mPM.installPackage(uri, ipackageinstallobserver, i, s);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void installPackageWithVerification(Uri uri, IPackageInstallObserver ipackageinstallobserver, int i, String s, Uri uri1, ManifestDigest manifestdigest, ContainerEncryptionParams containerencryptionparams)
    {
        try
        {
            mPM.installPackageWithVerification(uri, ipackageinstallobserver, i, s, uri1, manifestdigest, containerencryptionparams);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void installPackageWithVerificationAndEncryption(Uri uri, IPackageInstallObserver ipackageinstallobserver, int i, String s, VerificationParams verificationparams, ContainerEncryptionParams containerencryptionparams)
    {
        try
        {
            mPM.installPackageWithVerificationAndEncryption(uri, ipackageinstallobserver, i, s, verificationparams, containerencryptionparams);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public boolean isSafeMode()
    {
        if (mCachedSafeMode >= 0)
            break MISSING_BLOCK_LABEL_26;
        int i;
        int j;
        if (mPM.isSafeMode())
            j = 1;
        else
            j = 0;
        mCachedSafeMode = j;
        i = mCachedSafeMode;
        return i != 0;
        RemoteException remoteexception;
        remoteexception;
        throw new RuntimeException("Package manager has died", remoteexception);
    }

    public void movePackage(String s, IPackageMoveObserver ipackagemoveobserver, int i)
    {
        try
        {
            mPM.movePackage(s, ipackagemoveobserver, i);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public List queryBroadcastReceivers(Intent intent, int i)
    {
        return queryBroadcastReceivers(intent, i, mContext.getUserId());
    }

    public List queryBroadcastReceivers(Intent intent, int i, int j)
    {
        List list;
        try
        {
            list = mPM.queryIntentReceivers(intent, intent.resolveTypeIfNeeded(mContext.getContentResolver()), i, j);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return list;
    }

    public List queryContentProviders(String s, int i, int j)
    {
        List list;
        try
        {
            list = mPM.queryContentProviders(s, i, j);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return list;
    }

    public List queryInstrumentation(String s, int i)
    {
        List list;
        try
        {
            list = mPM.queryInstrumentation(s, i);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return list;
    }

    public List queryIntentActivities(Intent intent, int i)
    {
        return queryIntentActivitiesAsUser(intent, i, mContext.getUserId());
    }

    public List queryIntentActivitiesAsUser(Intent intent, int i, int j)
    {
        List list;
        try
        {
            list = mPM.queryIntentActivities(intent, intent.resolveTypeIfNeeded(mContext.getContentResolver()), i, j);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return list;
    }

    public List queryIntentActivityOptions(ComponentName componentname, Intent aintent[], Intent intent, int i)
    {
        android.content.ContentResolver contentresolver = mContext.getContentResolver();
        String as[] = null;
        if (aintent != null)
        {
            int j = aintent.length;
            for (int k = 0; k < j; k++)
            {
                Intent intent1 = aintent[k];
                if (intent1 == null)
                    continue;
                String s = intent1.resolveTypeIfNeeded(contentresolver);
                if (s == null)
                    continue;
                if (as == null)
                    as = new String[j];
                as[k] = s;
            }

        }
        List list;
        try
        {
            list = mPM.queryIntentActivityOptions(componentname, aintent, as, intent, intent.resolveTypeIfNeeded(contentresolver), i, mContext.getUserId());
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return list;
    }

    public List queryIntentServices(Intent intent, int i)
    {
        return queryIntentServicesAsUser(intent, i, mContext.getUserId());
    }

    public List queryIntentServicesAsUser(Intent intent, int i, int j)
    {
        List list;
        try
        {
            list = mPM.queryIntentServices(intent, intent.resolveTypeIfNeeded(mContext.getContentResolver()), i, j);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return list;
    }

    public List queryPermissionsByGroup(String s, int i)
        throws android.content.pm.PackageManager.NameNotFoundException
    {
        List list;
        try
        {
            list = mPM.queryPermissionsByGroup(s, i);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        if (list != null)
            return list;
        else
            throw new android.content.pm.PackageManager.NameNotFoundException(s);
    }

    public void removePackageFromPreferred(String s)
    {
        try
        {
            mPM.removePackageFromPreferred(s);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void removePermission(String s)
    {
        try
        {
            mPM.removePermission(s);
            return;
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
    }

    public void replacePreferredActivity(IntentFilter intentfilter, int i, ComponentName acomponentname[], ComponentName componentname)
    {
        try
        {
            mPM.replacePreferredActivity(intentfilter, i, acomponentname, componentname);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public ResolveInfo resolveActivity(Intent intent, int i)
    {
        return resolveActivityAsUser(intent, i, mContext.getUserId());
    }

    public ResolveInfo resolveActivityAsUser(Intent intent, int i, int j)
    {
        ResolveInfo resolveinfo;
        try
        {
            resolveinfo = mPM.resolveIntent(intent, intent.resolveTypeIfNeeded(mContext.getContentResolver()), i, j);
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return resolveinfo;
    }

    public ProviderInfo resolveContentProvider(String s, int i)
    {
        ProviderInfo providerinfo;
        try
        {
            providerinfo = mPM.resolveContentProvider(s, i, mContext.getUserId());
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return providerinfo;
    }

    public ResolveInfo resolveService(Intent intent, int i)
    {
        ResolveInfo resolveinfo;
        try
        {
            resolveinfo = mPM.resolveService(intent, intent.resolveTypeIfNeeded(mContext.getContentResolver()), i, mContext.getUserId());
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
        return resolveinfo;
    }

    public void revokePermission(String s, String s1)
    {
        try
        {
            mPM.revokePermission(s, s1);
            return;
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Package manager has died", remoteexception);
        }
    }

    public void setApplicationEnabledSetting(String s, int i, int j)
    {
        try
        {
            mPM.setApplicationEnabledSetting(s, i, j, mContext.getUserId());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void setComponentEnabledSetting(ComponentName componentname, int i, int j)
    {
        try
        {
            mPM.setComponentEnabledSetting(componentname, i, j, mContext.getUserId());
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void setInstallerPackageName(String s, String s1)
    {
        try
        {
            mPM.setInstallerPackageName(s, s1);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void verifyPendingInstall(int i, int j)
    {
        try
        {
            mPM.verifyPendingInstall(i, j);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

}
