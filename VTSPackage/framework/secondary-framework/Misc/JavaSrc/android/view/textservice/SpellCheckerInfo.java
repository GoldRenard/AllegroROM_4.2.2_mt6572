// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.textservice;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.*;
import android.content.res.*;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Slog;
import android.util.Xml;
import java.io.IOException;
import java.util.ArrayList;
import org.xmlpull.v1.XmlPullParserException;

// Referenced classes of package android.view.textservice:
//            SpellCheckerSubtype

public final class SpellCheckerInfo
    implements Parcelable
{

    public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

        public SpellCheckerInfo createFromParcel(Parcel parcel)
        {
            return new SpellCheckerInfo(parcel);
        }

        public volatile Object createFromParcel(Parcel parcel)
        {
            return createFromParcel(parcel);
        }

        public SpellCheckerInfo[] newArray(int i)
        {
            return new SpellCheckerInfo[i];
        }

        public volatile Object[] newArray(int i)
        {
            return newArray(i);
        }

    }
;
    private static final String TAG = android/view/textservice/SpellCheckerInfo.getSimpleName();
    private final String mId;
    private final int mLabel;
    private final ResolveInfo mService;
    private final String mSettingsActivityName;
    private final ArrayList mSubtypes;

    public SpellCheckerInfo(Context context, ResolveInfo resolveinfo)
        throws XmlPullParserException, IOException
    {
        ServiceInfo serviceinfo;
        PackageManager packagemanager;
        XmlResourceParser xmlresourceparser;
        mSubtypes = new ArrayList();
        mService = resolveinfo;
        serviceinfo = resolveinfo.serviceInfo;
        mId = (new ComponentName(serviceinfo.packageName, ((ComponentInfo) (serviceinfo)).name)).flattenToShortString();
        packagemanager = context.getPackageManager();
        xmlresourceparser = null;
        xmlresourceparser = serviceinfo.loadXmlMetaData(packagemanager, "android.view.textservice.scs");
        if (xmlresourceparser != null)
            break MISSING_BLOCK_LABEL_157;
        throw new XmlPullParserException("No android.view.textservice.scs meta-data");
        Exception exception1;
        exception1;
        Slog.e(TAG, (new StringBuilder()).append("Caught exception: ").append(exception1).toString());
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
        int j;
        String s;
        int k;
        if (!"spell-checker".equals(xmlresourceparser.getName()))
            throw new XmlPullParserException("Meta-data does not start with spell-checker tag");
        TypedArray typedarray = resources.obtainAttributes(attributeset, com.android.internal.R.styleable.SpellChecker);
        j = typedarray.getResourceId(0, 0);
        s = typedarray.getString(1);
        typedarray.recycle();
        k = xmlresourceparser.getDepth();
_L2:
        int l = xmlresourceparser.next();
        if (l != 3)
            break MISSING_BLOCK_LABEL_291;
        if (xmlresourceparser.getDepth() <= k)
            break MISSING_BLOCK_LABEL_381;
        if (l == 1)
            break MISSING_BLOCK_LABEL_381;
        if (l != 2) goto _L2; else goto _L1
_L1:
        if (!"subtype".equals(xmlresourceparser.getName()))
            throw new XmlPullParserException("Meta-data in spell-checker does not start with subtype tag");
        TypedArray typedarray1 = resources.obtainAttributes(attributeset, com.android.internal.R.styleable.SpellChecker_Subtype);
        SpellCheckerSubtype spellcheckersubtype = new SpellCheckerSubtype(typedarray1.getResourceId(0, 0), typedarray1.getString(1), typedarray1.getString(2));
        mSubtypes.add(spellcheckersubtype);
          goto _L2
        if (xmlresourceparser != null)
            xmlresourceparser.close();
        mLabel = j;
        mSettingsActivityName = s;
        return;
    }

    public SpellCheckerInfo(Parcel parcel)
    {
        mSubtypes = new ArrayList();
        mLabel = parcel.readInt();
        mId = parcel.readString();
        mSettingsActivityName = parcel.readString();
        mService = (ResolveInfo)ResolveInfo.CREATOR.createFromParcel(parcel);
        parcel.readTypedList(mSubtypes, SpellCheckerSubtype.CREATOR);
    }

    public int describeContents()
    {
        return 0;
    }

    public ComponentName getComponent()
    {
        return new ComponentName(mService.serviceInfo.packageName, ((ComponentInfo) (mService.serviceInfo)).name);
    }

    public String getId()
    {
        return mId;
    }

    public String getPackageName()
    {
        return mService.serviceInfo.packageName;
    }

    public ServiceInfo getServiceInfo()
    {
        return mService.serviceInfo;
    }

    public String getSettingsActivity()
    {
        return mSettingsActivityName;
    }

    public SpellCheckerSubtype getSubtypeAt(int i)
    {
        return (SpellCheckerSubtype)mSubtypes.get(i);
    }

    public int getSubtypeCount()
    {
        return mSubtypes.size();
    }

    public Drawable loadIcon(PackageManager packagemanager)
    {
        return mService.loadIcon(packagemanager);
    }

    public CharSequence loadLabel(PackageManager packagemanager)
    {
        if (mLabel != 0 && packagemanager != null)
            return packagemanager.getText(getPackageName(), mLabel, ((ComponentInfo) (mService.serviceInfo)).applicationInfo);
        else
            return "";
    }

    public void writeToParcel(Parcel parcel, int i)
    {
        parcel.writeInt(mLabel);
        parcel.writeString(mId);
        parcel.writeString(mSettingsActivityName);
        mService.writeToParcel(parcel, i);
        parcel.writeTypedList(mSubtypes);
    }

}
