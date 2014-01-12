// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.*;
import android.content.pm.*;
import android.content.res.*;
import android.graphics.drawable.Drawable;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.service.dreams.IDreamManager;
import android.util.Log;
import android.util.Xml;
import java.io.IOException;
import java.util.*;
import org.xmlpull.v1.XmlPullParserException;

// Referenced classes of package com.android.settings:
//            DreamSettings

public class DreamBackend
{
    public static class DreamInfo
    {

        CharSequence caption;
        public ComponentName componentName;
        Drawable icon;
        boolean isActive;
        public ComponentName settingsComponentName;

        public String toString()
        {
            StringBuilder stringbuilder = new StringBuilder(com/android/settings/DreamBackend$DreamInfo.getSimpleName());
            stringbuilder.append('[').append(caption);
            if (isActive)
                stringbuilder.append(",active");
            stringbuilder.append(',').append(componentName);
            if (settingsComponentName != null)
                stringbuilder.append("settings=").append(settingsComponentName);
            return stringbuilder.append(']').toString();
        }

    }

    private static class DreamInfoComparator
        implements Comparator
    {

        private final ComponentName mDefaultDream;

        private String sortKey(DreamInfo dreaminfo)
        {
            StringBuilder stringbuilder = new StringBuilder();
            char c;
            if (dreaminfo.componentName.equals(mDefaultDream))
                c = '0';
            else
                c = '1';
            stringbuilder.append(c);
            stringbuilder.append(dreaminfo.caption);
            return stringbuilder.toString();
        }

        public int compare(DreamInfo dreaminfo, DreamInfo dreaminfo1)
        {
            return sortKey(dreaminfo).compareTo(sortKey(dreaminfo1));
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((DreamInfo)obj, (DreamInfo)obj1);
        }

        public DreamInfoComparator(ComponentName componentname)
        {
            mDefaultDream = componentname;
        }
    }


    private static final String TAG = (new StringBuilder()).append(com/android/settings/DreamSettings.getSimpleName()).append(".Backend").toString();
    private final DreamInfoComparator mComparator = new DreamInfoComparator(getDefaultDream());
    private final Context mContext;
    private final IDreamManager mDreamManager = android.service.dreams.IDreamManager.Stub.asInterface(ServiceManager.getService("dreams"));
    private final boolean mDreamsActivatedOnDockByDefault;
    private final boolean mDreamsActivatedOnSleepByDefault;
    private final boolean mDreamsEnabledByDefault;

    public DreamBackend(Context context)
    {
        mContext = context;
        mDreamsEnabledByDefault = context.getResources().getBoolean(0x1110041);
        mDreamsActivatedOnSleepByDefault = context.getResources().getBoolean(0x1110043);
        mDreamsActivatedOnDockByDefault = context.getResources().getBoolean(0x1110042);
    }

    private boolean getBoolean(String s, boolean flag)
    {
        android.content.ContentResolver contentresolver = mContext.getContentResolver();
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        return android.provider.Settings.Secure.getInt(contentresolver, s, i) == 1;
    }

    private static ComponentName getDreamComponentName(ResolveInfo resolveinfo)
    {
        if (resolveinfo != null && resolveinfo.serviceInfo != null)
            return new ComponentName(((PackageItemInfo) (resolveinfo.serviceInfo)).packageName, resolveinfo.serviceInfo.name);
        else
            return null;
    }

    private static ComponentName getSettingsComponentName(PackageManager packagemanager, ResolveInfo resolveinfo)
    {
        if (resolveinfo != null && resolveinfo.serviceInfo != null && resolveinfo.serviceInfo.metaData != null) goto _L2; else goto _L1
_L1:
        return null;
_L2:
        String s;
        XmlResourceParser xmlresourceparser;
        s = null;
        xmlresourceparser = null;
        xmlresourceparser = resolveinfo.serviceInfo.loadXmlMetaData(packagemanager, "android.service.dream");
        s = null;
        if (xmlresourceparser != null)
            break MISSING_BLOCK_LABEL_65;
        Log.w(TAG, "No android.service.dream meta-data");
        if (xmlresourceparser == null) goto _L1; else goto _L3
_L3:
        xmlresourceparser.close();
        return null;
        Resources resources;
        android.util.AttributeSet attributeset;
        resources = packagemanager.getResourcesForApplication(resolveinfo.serviceInfo.applicationInfo);
        attributeset = Xml.asAttributeSet(xmlresourceparser);
        int i;
        do
            i = xmlresourceparser.next();
        while (i != 1 && i != 2);
        boolean flag = "dream".equals(xmlresourceparser.getName());
        s = null;
        if (flag)
            break MISSING_BLOCK_LABEL_145;
        Log.w(TAG, "Meta-data does not start with dream tag");
        if (xmlresourceparser == null) goto _L1; else goto _L4
_L4:
        xmlresourceparser.close();
        return null;
        TypedArray typedarray = resources.obtainAttributes(attributeset, com.android.internal.R.styleable.Dream);
        s = typedarray.getString(0);
        typedarray.recycle();
        Object obj;
        obj = null;
        if (xmlresourceparser != null)
            xmlresourceparser.close();
_L6:
        if (obj != null)
        {
            Log.w(TAG, (new StringBuilder()).append("Error parsing : ").append(((PackageItemInfo) (resolveinfo.serviceInfo)).packageName).toString(), ((Throwable) (obj)));
            return null;
        }
        continue; /* Loop/switch isn't completed */
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        obj = namenotfoundexception;
        if (xmlresourceparser != null)
            xmlresourceparser.close();
        continue; /* Loop/switch isn't completed */
        IOException ioexception;
        ioexception;
        obj = ioexception;
        if (xmlresourceparser != null)
            xmlresourceparser.close();
        continue; /* Loop/switch isn't completed */
        XmlPullParserException xmlpullparserexception;
        xmlpullparserexception;
        obj = xmlpullparserexception;
        if (xmlresourceparser != null)
            xmlresourceparser.close();
        if (true) goto _L6; else goto _L5
_L5:
        Exception exception;
        exception;
        if (xmlresourceparser != null)
            xmlresourceparser.close();
        throw exception;
        if (s == null) goto _L1; else goto _L7
_L7:
        return ComponentName.unflattenFromString(s);
    }

    private static transient void logd(String s, Object aobj[])
    {
    }

    private void setBoolean(String s, boolean flag)
    {
        android.content.ContentResolver contentresolver = mContext.getContentResolver();
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        android.provider.Settings.Secure.putInt(contentresolver, s, i);
    }

    public ComponentName getActiveDream()
    {
        if (mDreamManager != null) goto _L2; else goto _L1
_L1:
        ComponentName acomponentname[];
        return null;
_L2:
        if ((acomponentname = mDreamManager.getDreamComponents()) == null) goto _L1; else goto _L3
_L3:
        if (acomponentname.length <= 0) goto _L1; else goto _L4
_L4:
        ComponentName componentname = acomponentname[0];
        return componentname;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed to get active dream", remoteexception);
        return null;
    }

    public CharSequence getActiveDreamName()
    {
        ComponentName componentname = getActiveDream();
        CharSequence charsequence = null;
        if (componentname == null)
            break MISSING_BLOCK_LABEL_45;
        PackageManager packagemanager = mContext.getPackageManager();
        ServiceInfo serviceinfo;
        CharSequence charsequence1;
        try
        {
            serviceinfo = packagemanager.getServiceInfo(componentname, 0);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            return null;
        }
        charsequence = null;
        if (serviceinfo == null)
            break MISSING_BLOCK_LABEL_45;
        charsequence1 = serviceinfo.loadLabel(packagemanager);
        charsequence = charsequence1;
        return charsequence;
    }

    public ComponentName getDefaultDream()
    {
        if (mDreamManager == null)
            return null;
        ComponentName componentname;
        try
        {
            componentname = mDreamManager.getDefaultDreamComponent();
        }
        catch (RemoteException remoteexception)
        {
            Log.w(TAG, "Failed to get default dream", remoteexception);
            return null;
        }
        return componentname;
    }

    public List getDreamInfos()
    {
        logd("getDreamInfos()", new Object[0]);
        ComponentName componentname = getActiveDream();
        PackageManager packagemanager = mContext.getPackageManager();
        List list = packagemanager.queryIntentServices(new Intent("android.service.dreams.DreamService"), 128);
        ArrayList arraylist = new ArrayList(list.size());
        Iterator iterator = list.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            ResolveInfo resolveinfo = (ResolveInfo)iterator.next();
            if (resolveinfo.serviceInfo != null)
            {
                DreamInfo dreaminfo = new DreamInfo();
                dreaminfo.caption = resolveinfo.loadLabel(packagemanager);
                dreaminfo.icon = resolveinfo.loadIcon(packagemanager);
                dreaminfo.componentName = getDreamComponentName(resolveinfo);
                dreaminfo.isActive = dreaminfo.componentName.equals(componentname);
                dreaminfo.settingsComponentName = getSettingsComponentName(packagemanager, resolveinfo);
                arraylist.add(dreaminfo);
            }
        } while (true);
        Collections.sort(arraylist, mComparator);
        return arraylist;
    }

    public boolean isActivatedOnDock()
    {
        return getBoolean("screensaver_activate_on_dock", mDreamsActivatedOnDockByDefault);
    }

    public boolean isActivatedOnSleep()
    {
        return getBoolean("screensaver_activate_on_sleep", mDreamsActivatedOnSleepByDefault);
    }

    public boolean isEnabled()
    {
        return getBoolean("screensaver_enabled", mDreamsEnabledByDefault);
    }

    public void launchSettings(DreamInfo dreaminfo)
    {
        logd("launchSettings(%s)", new Object[] {
            dreaminfo
        });
        if (dreaminfo != null && dreaminfo.settingsComponentName != null)
        {
            mContext.startActivity((new Intent()).setComponent(dreaminfo.settingsComponentName));
            return;
        } else
        {
            return;
        }
    }

    public void preview(DreamInfo dreaminfo)
    {
        logd("preview(%s)", new Object[] {
            dreaminfo
        });
        if (mDreamManager == null || dreaminfo == null || dreaminfo.componentName == null)
            return;
        try
        {
            mDreamManager.testDream(dreaminfo.componentName);
            return;
        }
        catch (RemoteException remoteexception)
        {
            Log.w(TAG, (new StringBuilder()).append("Failed to preview ").append(dreaminfo).toString(), remoteexception);
        }
    }

    public void setActivatedOnDock(boolean flag)
    {
        Object aobj[] = new Object[1];
        aobj[0] = Boolean.valueOf(flag);
        logd("setActivatedOnDock(%s)", aobj);
        setBoolean("screensaver_activate_on_dock", flag);
    }

    public void setActivatedOnSleep(boolean flag)
    {
        Object aobj[] = new Object[1];
        aobj[0] = Boolean.valueOf(flag);
        logd("setActivatedOnSleep(%s)", aobj);
        setBoolean("screensaver_activate_on_sleep", flag);
    }

    public void setActiveDream(ComponentName componentname)
    {
        logd("setActiveDream(%s)", new Object[] {
            componentname
        });
        if (mDreamManager == null)
            return;
        ComponentName acomponentname[];
        IDreamManager idreammanager;
        acomponentname = (new ComponentName[] {
            componentname
        });
        idreammanager = mDreamManager;
        if (componentname == null)
            acomponentname = null;
        try
        {
            idreammanager.setDreamComponents(acomponentname);
            return;
        }
        catch (RemoteException remoteexception)
        {
            Log.w(TAG, (new StringBuilder()).append("Failed to set active dream to ").append(componentname).toString(), remoteexception);
        }
        return;
    }

    public void setEnabled(boolean flag)
    {
        Object aobj[] = new Object[1];
        aobj[0] = Boolean.valueOf(flag);
        logd("setEnabled(%s)", aobj);
        setBoolean("screensaver_enabled", flag);
    }

    public void startDreaming()
    {
        logd("startDreaming()", new Object[0]);
        if (mDreamManager == null)
            return;
        try
        {
            mDreamManager.dream();
            return;
        }
        catch (RemoteException remoteexception)
        {
            Log.w(TAG, "Failed to dream", remoteexception);
        }
    }

}
