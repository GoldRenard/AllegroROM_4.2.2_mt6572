// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.*;
import android.content.res.*;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Printer;
import android.util.Xml;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParserException;

public final class WallpaperInfo
    implements Parcelable
{

    public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

        public WallpaperInfo createFromParcel(Parcel parcel)
        {
            return new WallpaperInfo(parcel);
        }

        public volatile Object createFromParcel(Parcel parcel)
        {
            return createFromParcel(parcel);
        }

        public WallpaperInfo[] newArray(int i)
        {
            return new WallpaperInfo[i];
        }

        public volatile Object[] newArray(int i)
        {
            return newArray(i);
        }

    }
;
    static final String TAG = "WallpaperInfo";
    final int mAuthorResource;
    final int mDescriptionResource;
    final ResolveInfo mService;
    final String mSettingsActivityName;
    final int mThumbnailResource;

    public WallpaperInfo(Context context, ResolveInfo resolveinfo)
        throws XmlPullParserException, IOException
    {
        ServiceInfo serviceinfo;
        PackageManager packagemanager;
        XmlResourceParser xmlresourceparser;
        mService = resolveinfo;
        serviceinfo = resolveinfo.serviceInfo;
        packagemanager = context.getPackageManager();
        xmlresourceparser = null;
        xmlresourceparser = serviceinfo.loadXmlMetaData(packagemanager, "android.service.wallpaper");
        if (xmlresourceparser != null)
            break MISSING_BLOCK_LABEL_97;
        try
        {
            throw new XmlPullParserException("No android.service.wallpaper meta-data");
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception) { }
        throw new XmlPullParserException((new StringBuilder()).append("Unable to create context for: ").append(serviceinfo.packageName).toString());
        Exception exception;
        exception;
        if (xmlresourceparser != null)
            xmlresourceparser.close();
        throw exception;
        Resources resources;
        android.util.AttributeSet attributeset;
        resources = packagemanager.getResourcesForApplication(((ComponentInfo) (serviceinfo)).applicationInfo);
        attributeset = Xml.asAttributeSet(xmlresourceparser);
        int i;
        do
            i = xmlresourceparser.next();
        while (i != 1 && i != 2);
        String s;
        int j;
        int k;
        int l;
        if (!"wallpaper".equals(xmlresourceparser.getName()))
            throw new XmlPullParserException("Meta-data does not start with wallpaper tag");
        TypedArray typedarray = resources.obtainAttributes(attributeset, com.android.internal.R.styleable.Wallpaper);
        s = typedarray.getString(1);
        j = typedarray.getResourceId(2, -1);
        k = typedarray.getResourceId(3, -1);
        l = typedarray.getResourceId(0, -1);
        typedarray.recycle();
        if (xmlresourceparser != null)
            xmlresourceparser.close();
        mSettingsActivityName = s;
        mThumbnailResource = j;
        mAuthorResource = k;
        mDescriptionResource = l;
        return;
    }

    WallpaperInfo(Parcel parcel)
    {
        mSettingsActivityName = parcel.readString();
        mThumbnailResource = parcel.readInt();
        mAuthorResource = parcel.readInt();
        mDescriptionResource = parcel.readInt();
        mService = (ResolveInfo)ResolveInfo.CREATOR.createFromParcel(parcel);
    }

    public int describeContents()
    {
        return 0;
    }

    public void dump(Printer printer, String s)
    {
        printer.println((new StringBuilder()).append(s).append("Service:").toString());
        mService.dump(printer, (new StringBuilder()).append(s).append("  ").toString());
        printer.println((new StringBuilder()).append(s).append("mSettingsActivityName=").append(mSettingsActivityName).toString());
    }

    public ComponentName getComponent()
    {
        return new ComponentName(mService.serviceInfo.packageName, ((ComponentInfo) (mService.serviceInfo)).name);
    }

    public String getPackageName()
    {
        return mService.serviceInfo.packageName;
    }

    public ServiceInfo getServiceInfo()
    {
        return mService.serviceInfo;
    }

    public String getServiceName()
    {
        return ((ComponentInfo) (mService.serviceInfo)).name;
    }

    public String getSettingsActivity()
    {
        return mSettingsActivityName;
    }

    public CharSequence loadAuthor(PackageManager packagemanager)
        throws android.content.res.Resources.NotFoundException
    {
        if (mAuthorResource <= 0)
            throw new android.content.res.Resources.NotFoundException();
        String s = mService.resolvePackageName;
        android.content.pm.ApplicationInfo applicationinfo = null;
        if (s == null)
        {
            s = mService.serviceInfo.packageName;
            applicationinfo = ((ComponentInfo) (mService.serviceInfo)).applicationInfo;
        }
        return packagemanager.getText(s, mAuthorResource, applicationinfo);
    }

    public CharSequence loadDescription(PackageManager packagemanager)
        throws android.content.res.Resources.NotFoundException
    {
        String s = mService.resolvePackageName;
        android.content.pm.ApplicationInfo applicationinfo = null;
        if (s == null)
        {
            s = mService.serviceInfo.packageName;
            applicationinfo = ((ComponentInfo) (mService.serviceInfo)).applicationInfo;
        }
        if (mService.serviceInfo.descriptionRes != 0)
            return packagemanager.getText(s, mService.serviceInfo.descriptionRes, applicationinfo);
        if (mDescriptionResource <= 0)
            throw new android.content.res.Resources.NotFoundException();
        else
            return packagemanager.getText(s, mDescriptionResource, ((ComponentInfo) (mService.serviceInfo)).applicationInfo);
    }

    public Drawable loadIcon(PackageManager packagemanager)
    {
        return mService.loadIcon(packagemanager);
    }

    public CharSequence loadLabel(PackageManager packagemanager)
    {
        return mService.loadLabel(packagemanager);
    }

    public Drawable loadThumbnail(PackageManager packagemanager)
    {
        if (mThumbnailResource < 0)
            return null;
        else
            return packagemanager.getDrawable(mService.serviceInfo.packageName, mThumbnailResource, ((ComponentInfo) (mService.serviceInfo)).applicationInfo);
    }

    public String toString()
    {
        return (new StringBuilder()).append("WallpaperInfo{").append(((ComponentInfo) (mService.serviceInfo)).name).append(", settings: ").append(mSettingsActivityName).append("}").toString();
    }

    public void writeToParcel(Parcel parcel, int i)
    {
        parcel.writeString(mSettingsActivityName);
        parcel.writeInt(mThumbnailResource);
        parcel.writeInt(mAuthorResource);
        parcel.writeInt(mDescriptionResource);
        mService.writeToParcel(parcel, i);
    }

}
