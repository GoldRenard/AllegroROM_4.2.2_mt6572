// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.app.AlertDialog;
import android.content.Context;
import android.content.pm.*;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.util.*;
import android.view.LayoutInflater;
import android.view.View;
import java.text.Collator;
import java.util.*;

// Referenced classes of package android.widget:
//            LinearLayout, TextView, ImageView

public class AppSecurityPermissions
{
    static class MyPermissionGroupInfo extends PermissionGroupInfo
    {

        final ArrayList mAllPermissions;
        final ArrayList mDevicePermissions;
        CharSequence mLabel;
        final ArrayList mNewPermissions;
        final ArrayList mPersonalPermissions;

        public Drawable loadGroupIcon(PackageManager packagemanager)
        {
            if (icon != 0)
                return loadIcon(packagemanager);
            Drawable drawable;
            try
            {
                drawable = packagemanager.getApplicationInfo(packageName, 0).loadIcon(packagemanager);
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
            {
                return null;
            }
            return drawable;
        }

        MyPermissionGroupInfo(PermissionGroupInfo permissiongroupinfo)
        {
            super(permissiongroupinfo);
            mNewPermissions = new ArrayList();
            mPersonalPermissions = new ArrayList();
            mDevicePermissions = new ArrayList();
            mAllPermissions = new ArrayList();
        }

        MyPermissionGroupInfo(PermissionInfo permissioninfo)
        {
            mNewPermissions = new ArrayList();
            mPersonalPermissions = new ArrayList();
            mDevicePermissions = new ArrayList();
            mAllPermissions = new ArrayList();
            name = permissioninfo.packageName;
            packageName = permissioninfo.packageName;
        }
    }

    static class MyPermissionInfo extends PermissionInfo
    {

        int mExistingReqFlags;
        CharSequence mLabel;
        boolean mNew;
        int mNewReqFlags;


        MyPermissionInfo(PermissionInfo permissioninfo)
        {
            super(permissioninfo);
        }

        MyPermissionInfo(MyPermissionInfo mypermissioninfo)
        {
            super(mypermissioninfo);
            mNewReqFlags = mypermissioninfo.mNewReqFlags;
            mExistingReqFlags = mypermissioninfo.mExistingReqFlags;
            mNew = mypermissioninfo.mNew;
        }
    }

    private static class PermissionGroupInfoComparator
        implements Comparator
    {

        private final Collator sCollator = Collator.getInstance();

        public final int compare(MyPermissionGroupInfo mypermissiongroupinfo, MyPermissionGroupInfo mypermissiongroupinfo1)
        {
label0:
            {
                if ((1 & (mypermissiongroupinfo.flags ^ mypermissiongroupinfo1.flags)) != 0)
                {
                    if ((1 & mypermissiongroupinfo.flags) == 0)
                        return 1;
                } else
                {
                    if (mypermissiongroupinfo.priority == mypermissiongroupinfo1.priority)
                        break label0;
                    if (mypermissiongroupinfo.priority <= mypermissiongroupinfo1.priority)
                        return 1;
                }
                return -1;
            }
            return sCollator.compare(mypermissiongroupinfo.mLabel, mypermissiongroupinfo1.mLabel);
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((MyPermissionGroupInfo)obj, (MyPermissionGroupInfo)obj1);
        }

    }

    private static class PermissionInfoComparator
        implements Comparator
    {

        private final Collator sCollator = Collator.getInstance();

        public final int compare(MyPermissionInfo mypermissioninfo, MyPermissionInfo mypermissioninfo1)
        {
            return sCollator.compare(mypermissioninfo.mLabel, mypermissioninfo1.mLabel);
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((MyPermissionInfo)obj, (MyPermissionInfo)obj1);
        }

    }

    public static class PermissionItemView extends LinearLayout
        implements android.view.View.OnClickListener
    {

        AlertDialog mDialog;
        MyPermissionGroupInfo mGroup;
        MyPermissionInfo mPerm;

        public void onClick(View view)
        {
            if (mGroup == null || mPerm == null) goto _L2; else goto _L1
_L1:
            PackageManager packagemanager;
            android.app.AlertDialog.Builder builder;
            if (mDialog != null)
                mDialog.dismiss();
            packagemanager = getContext().getPackageManager();
            builder = new android.app.AlertDialog.Builder(getContext());
            builder.setTitle(mGroup.mLabel);
            if (mPerm.descriptionRes == 0) goto _L4; else goto _L3
_L3:
            builder.setMessage(mPerm.loadDescription(packagemanager));
_L6:
            builder.setCancelable(true);
            builder.setIcon(mGroup.loadGroupIcon(packagemanager));
            mDialog = builder.show();
            mDialog.setCanceledOnTouchOutside(true);
_L2:
            return;
_L4:
            CharSequence charsequence = packagemanager.getApplicationInfo(((PermissionInfo) (mPerm)).packageName, 0).loadLabel(packagemanager);
            Object obj = charsequence;
_L7:
            StringBuilder stringbuilder = new StringBuilder(128);
            stringbuilder.append(getContext().getString(0x1040434, new Object[] {
                obj
            }));
            stringbuilder.append("\n\n");
            stringbuilder.append(mPerm.name);
            builder.setMessage(stringbuilder.toString());
            if (true) goto _L6; else goto _L5
_L5:
            android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
            namenotfoundexception;
            obj = ((PermissionInfo) (mPerm)).packageName;
              goto _L7
        }

        protected void onDetachedFromWindow()
        {
            super.onDetachedFromWindow();
            if (mDialog != null)
                mDialog.dismiss();
        }

        public void setPermission(MyPermissionGroupInfo mypermissiongroupinfo, MyPermissionInfo mypermissioninfo, boolean flag, CharSequence charsequence)
        {
            mGroup = mypermissiongroupinfo;
            mPerm = mypermissioninfo;
            ImageView imageview = (ImageView)findViewById(0x102026b);
            TextView textview = (TextView)findViewById(0x102026c);
            PackageManager packagemanager = getContext().getPackageManager();
            Drawable drawable = null;
            if (flag)
                drawable = mypermissiongroupinfo.loadGroupIcon(packagemanager);
            Object obj = mypermissioninfo.mLabel;
            if (mypermissioninfo.mNew && charsequence != null)
            {
                SpannableStringBuilder spannablestringbuilder = new SpannableStringBuilder();
                Parcel parcel = Parcel.obtain();
                TextUtils.writeToParcel(charsequence, parcel, 0);
                parcel.setDataPosition(0);
                CharSequence charsequence1 = (CharSequence)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
                parcel.recycle();
                spannablestringbuilder.append(charsequence1);
                spannablestringbuilder.append(((CharSequence) (obj)));
                obj = spannablestringbuilder;
            }
            imageview.setImageDrawable(drawable);
            textview.setText(((CharSequence) (obj)));
            setOnClickListener(this);
        }

        public PermissionItemView(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
            setClickable(true);
        }
    }


    private static final String TAG = "AppSecurityPermissions";
    public static final int WHICH_ALL = 65535;
    public static final int WHICH_DEVICE = 2;
    public static final int WHICH_NEW = 4;
    public static final int WHICH_PERSONAL = 1;
    private static final boolean localLOGV;
    private Context mContext;
    private Drawable mDangerousIcon;
    private LayoutInflater mInflater;
    private PackageInfo mInstalledPackageInfo;
    private CharSequence mNewPermPrefix;
    private Drawable mNormalIcon;
    private final PermissionInfoComparator mPermComparator;
    private final PermissionGroupInfoComparator mPermGroupComparator;
    private final Map mPermGroups;
    private final List mPermGroupsList;
    private List mPermsList;
    private PackageManager mPm;

    public AppSecurityPermissions(Context context, PackageInfo packageinfo)
    {
        HashSet hashset;
        mPermGroups = new HashMap();
        mPermGroupsList = new ArrayList();
        mContext = context;
        mPm = mContext.getPackageManager();
        loadResources();
        mPermComparator = new PermissionInfoComparator();
        mPermGroupComparator = new PermissionGroupInfoComparator();
        mPermsList = new ArrayList();
        hashset = new HashSet();
        if (packageinfo == null)
            return;
        if (packageinfo.requestedPermissions == null) goto _L2; else goto _L1
_L1:
        PackageInfo packageinfo2 = mPm.getPackageInfo(packageinfo.packageName, 4096);
        PackageInfo packageinfo1 = packageinfo2;
_L4:
        extractPerms(packageinfo, hashset, packageinfo1);
_L2:
        Iterator iterator;
        MyPermissionInfo mypermissioninfo;
        if (packageinfo.sharedUserId != null)
            try
            {
                getAllUsedPermissions(mPm.getUidForSharedUser(packageinfo.sharedUserId), hashset);
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
            {
                Log.w("AppSecurityPermissions", (new StringBuilder()).append("Could'nt retrieve shared user id for:").append(packageinfo.packageName).toString());
            }
        for (iterator = hashset.iterator(); iterator.hasNext(); mPermsList.add(mypermissioninfo))
            mypermissioninfo = (MyPermissionInfo)iterator.next();

        setPermissions(mPermsList);
        return;
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception1;
        namenotfoundexception1;
        packageinfo1 = null;
        if (true) goto _L4; else goto _L3
_L3:
    }

    public AppSecurityPermissions(Context context, String s)
    {
        mPermGroups = new HashMap();
        mPermGroupsList = new ArrayList();
        mContext = context;
        mPm = mContext.getPackageManager();
        loadResources();
        mPermComparator = new PermissionInfoComparator();
        mPermGroupComparator = new PermissionGroupInfoComparator();
        mPermsList = new ArrayList();
        HashSet hashset = new HashSet();
        PackageInfo packageinfo;
        try
        {
            packageinfo = mPm.getPackageInfo(s, 4096);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            Log.w("AppSecurityPermissions", (new StringBuilder()).append("Couldn't retrieve permissions for package:").append(s).toString());
            return;
        }
        if (packageinfo.applicationInfo != null && packageinfo.applicationInfo.uid != -1)
            getAllUsedPermissions(packageinfo.applicationInfo.uid, hashset);
        MyPermissionInfo mypermissioninfo;
        for (Iterator iterator = hashset.iterator(); iterator.hasNext(); mPermsList.add(mypermissioninfo))
            mypermissioninfo = (MyPermissionInfo)iterator.next();

        setPermissions(mPermsList);
    }

    public AppSecurityPermissions(Context context, List list)
    {
        mPermGroups = new HashMap();
        mPermGroupsList = new ArrayList();
        mContext = context;
        mPm = mContext.getPackageManager();
        loadResources();
        mPermComparator = new PermissionInfoComparator();
        mPermGroupComparator = new PermissionGroupInfoComparator();
        PermissionInfo permissioninfo;
        for (Iterator iterator = list.iterator(); iterator.hasNext(); mPermsList.add(new MyPermissionInfo(permissioninfo)))
            permissioninfo = (PermissionInfo)iterator.next();

        setPermissions(mPermsList);
    }

    private void addPermToList(List list, MyPermissionInfo mypermissioninfo)
    {
        if (mypermissioninfo.mLabel == null)
            mypermissioninfo.mLabel = mypermissioninfo.loadLabel(mPm);
        int i = Collections.binarySearch(list, mypermissioninfo, mPermComparator);
        if (i < 0)
            list.add(-1 + -i, mypermissioninfo);
    }

    private void displayPermissions(List list, LinearLayout linearlayout, int i)
    {
        linearlayout.removeAllViews();
        int j = (int)(8F * mContext.getResources().getDisplayMetrics().density);
        for (int k = 0; k < list.size(); k++)
        {
            MyPermissionGroupInfo mypermissiongroupinfo = (MyPermissionGroupInfo)list.get(k);
            List list1 = getPermissionList(mypermissiongroupinfo, i);
            for (int l = 0; l < list1.size(); l++)
            {
                MyPermissionInfo mypermissioninfo = (MyPermissionInfo)list1.get(l);
                boolean flag;
                if (l == 0)
                    flag = true;
                else
                    flag = false;
                CharSequence charsequence;
                if (i != 4)
                    charsequence = mNewPermPrefix;
                else
                    charsequence = null;
                PermissionItemView permissionitemview = getPermissionItemView(mypermissiongroupinfo, mypermissioninfo, flag, charsequence);
                LinearLayout.LayoutParams layoutparams = new LinearLayout.LayoutParams(-1, -2);
                if (l == 0)
                    layoutparams.topMargin = j;
                if (l == -1 + mypermissiongroupinfo.mAllPermissions.size())
                    layoutparams.bottomMargin = j;
                if (linearlayout.getChildCount() == 0)
                    layoutparams.topMargin = 2 * ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin;
                linearlayout.addView(permissionitemview, layoutparams);
            }

        }

    }

    private void extractPerms(PackageInfo packageinfo, Set set, PackageInfo packageinfo1)
    {
        String as[];
        int ai[];
        as = packageinfo.requestedPermissions;
        ai = packageinfo.requestedPermissionsFlags;
        if (as != null && as.length != 0) goto _L2; else goto _L1
_L1:
        return;
_L2:
        int i;
        mInstalledPackageInfo = packageinfo1;
        i = 0;
_L6:
        if (i >= as.length) goto _L1; else goto _L3
_L3:
        String s = as[i];
        if (packageinfo1 == null || packageinfo != packageinfo1 || (2 & ai[i]) != 0) goto _L5; else goto _L4
_L4:
        i++;
          goto _L6
_L5:
        PermissionInfo permissioninfo = mPm.getPermissionInfo(s, 0);
        if (permissioninfo == null) goto _L4; else goto _L7
_L7:
        int j = -1;
        if (packageinfo1 == null) goto _L9; else goto _L8
_L8:
        if (packageinfo1.requestedPermissions == null) goto _L9; else goto _L10
_L10:
        int k = 0;
_L21:
        if (k >= packageinfo1.requestedPermissions.length) goto _L9; else goto _L11
_L11:
        if (!s.equals(packageinfo1.requestedPermissions[k])) goto _L13; else goto _L12
_L12:
        j = k;
_L9:
        if (j < 0) goto _L15; else goto _L14
_L14:
        int l = packageinfo1.requestedPermissionsFlags[j];
_L22:
        if (!isDisplayablePermission(permissioninfo, ai[i], l)) goto _L4; else goto _L16
_L16:
        String s1 = permissioninfo.group;
        String s2;
        s2 = s1;
        if (s2 != null)
            break MISSING_BLOCK_LABEL_195;
        s2 = permissioninfo.packageName;
        permissioninfo.group = s2;
        if ((MyPermissionGroupInfo)mPermGroups.get(s2) != null) goto _L18; else goto _L17
_L17:
        PermissionGroupInfo permissiongroupinfo;
        permissiongroupinfo = null;
        if (s1 == null)
            break MISSING_BLOCK_LABEL_232;
        permissiongroupinfo = mPm.getPermissionGroupInfo(s1, 0);
        if (permissiongroupinfo == null) goto _L20; else goto _L19
_L19:
        MyPermissionGroupInfo mypermissiongroupinfo = new MyPermissionGroupInfo(permissiongroupinfo);
_L23:
        mPermGroups.put(permissioninfo.group, mypermissiongroupinfo);
          goto _L18
_L24:
        boolean flag;
        try
        {
            MyPermissionInfo mypermissioninfo = new MyPermissionInfo(permissioninfo);
            mypermissioninfo.mNewReqFlags = ai[i];
            mypermissioninfo.mExistingReqFlags = l;
            mypermissioninfo.mNew = flag;
            set.add(mypermissioninfo);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            Log.i("AppSecurityPermissions", (new StringBuilder()).append("Ignoring unknown permission:").append(s).toString());
        }
          goto _L4
_L13:
        k++;
          goto _L21
_L15:
        l = 0;
          goto _L22
_L20:
        permissioninfo.group = permissioninfo.packageName;
        if ((MyPermissionGroupInfo)mPermGroups.get(permissioninfo.group) == null)
            new MyPermissionGroupInfo(permissioninfo);
        mypermissiongroupinfo = new MyPermissionGroupInfo(permissioninfo);
          goto _L23
_L26:
        flag = false;
          goto _L24
_L18:
        if (packageinfo1 == null || (l & 2) != 0) goto _L26; else goto _L25
_L25:
        flag = true;
          goto _L24
    }

    private void getAllUsedPermissions(int i, Set set)
    {
        String as[] = mPm.getPackagesForUid(i);
        if (as != null && as.length != 0)
        {
            int j = as.length;
            for (int k = 0; k < j; k++)
                getPermissionsForPackage(as[k], set);

        }
    }

    public static View getPermissionItemView(Context context, CharSequence charsequence, CharSequence charsequence1, boolean flag)
    {
        LayoutInflater layoutinflater = (LayoutInflater)context.getSystemService("layout_inflater");
        Resources resources = context.getResources();
        int i;
        if (flag)
            i = 0x10802af;
        else
            i = 0x1080360;
        return getPermissionItemViewOld(context, layoutinflater, charsequence, charsequence1, flag, resources.getDrawable(i));
    }

    private static PermissionItemView getPermissionItemView(Context context, LayoutInflater layoutinflater, MyPermissionGroupInfo mypermissiongroupinfo, MyPermissionInfo mypermissioninfo, boolean flag, CharSequence charsequence)
    {
        int i;
        if ((1 & mypermissioninfo.flags) != 0)
            i = 0x109002b;
        else
            i = 0x109002a;
        PermissionItemView permissionitemview = (PermissionItemView)layoutinflater.inflate(i, null);
        permissionitemview.setPermission(mypermissiongroupinfo, mypermissioninfo, flag, charsequence);
        return permissionitemview;
    }

    private PermissionItemView getPermissionItemView(MyPermissionGroupInfo mypermissiongroupinfo, MyPermissionInfo mypermissioninfo, boolean flag, CharSequence charsequence)
    {
        return getPermissionItemView(mContext, mInflater, mypermissiongroupinfo, mypermissioninfo, flag, charsequence);
    }

    private static View getPermissionItemViewOld(Context context, LayoutInflater layoutinflater, CharSequence charsequence, CharSequence charsequence1, boolean flag, Drawable drawable)
    {
        View view = layoutinflater.inflate(0x109002c, null);
        TextView textview = (TextView)view.findViewById(0x102026f);
        TextView textview1 = (TextView)view.findViewById(0x1020270);
        ((ImageView)view.findViewById(0x102026b)).setImageDrawable(drawable);
        if (charsequence != null)
        {
            textview.setText(charsequence);
            textview1.setText(charsequence1);
            return view;
        } else
        {
            textview.setText(charsequence1);
            textview1.setVisibility(8);
            return view;
        }
    }

    private List getPermissionList(MyPermissionGroupInfo mypermissiongroupinfo, int i)
    {
        if (i == 4)
            return mypermissiongroupinfo.mNewPermissions;
        if (i == 1)
            return mypermissiongroupinfo.mPersonalPermissions;
        if (i == 2)
            return mypermissiongroupinfo.mDevicePermissions;
        else
            return mypermissiongroupinfo.mAllPermissions;
    }

    private void getPermissionsForPackage(String s, Set set)
    {
        PackageInfo packageinfo;
        try
        {
            packageinfo = mPm.getPackageInfo(s, 4096);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            Log.w("AppSecurityPermissions", (new StringBuilder()).append("Couldn't retrieve permissions for package:").append(s).toString());
            return;
        }
        if (packageinfo != null && packageinfo.requestedPermissions != null)
            extractPerms(packageinfo, set, packageinfo);
    }

    private boolean isDisplayablePermission(PermissionInfo permissioninfo, int i, int j)
    {
        int k = 0xf & permissioninfo.protectionLevel;
        return k == 1 || k == 0 || (j & 2) != 0 && (0x20 & permissioninfo.protectionLevel) != 0;
    }

    private void loadResources()
    {
        mNewPermPrefix = mContext.getText(0x1040433);
        mNormalIcon = mContext.getResources().getDrawable(0x1080360);
        mDangerousIcon = mContext.getResources().getDrawable(0x10802af);
    }

    private void setPermissions(List list)
    {
        if (list != null)
        {
            Iterator iterator1 = list.iterator();
            do
            {
                if (!iterator1.hasNext())
                    break;
                MyPermissionInfo mypermissioninfo = (MyPermissionInfo)iterator1.next();
                if (isDisplayablePermission(mypermissioninfo, mypermissioninfo.mNewReqFlags, mypermissioninfo.mExistingReqFlags))
                {
                    MyPermissionGroupInfo mypermissiongroupinfo1 = (MyPermissionGroupInfo)mPermGroups.get(((PermissionInfo) (mypermissioninfo)).group);
                    if (mypermissiongroupinfo1 != null)
                    {
                        mypermissioninfo.mLabel = mypermissioninfo.loadLabel(mPm);
                        addPermToList(mypermissiongroupinfo1.mAllPermissions, mypermissioninfo);
                        if (mypermissioninfo.mNew)
                            addPermToList(mypermissiongroupinfo1.mNewPermissions, mypermissioninfo);
                        if ((1 & mypermissiongroupinfo1.flags) != 0)
                            addPermToList(mypermissiongroupinfo1.mPersonalPermissions, mypermissioninfo);
                        else
                            addPermToList(mypermissiongroupinfo1.mDevicePermissions, mypermissioninfo);
                    }
                }
            } while (true);
        }
        Iterator iterator = mPermGroups.values().iterator();
        while (iterator.hasNext()) 
        {
            MyPermissionGroupInfo mypermissiongroupinfo = (MyPermissionGroupInfo)iterator.next();
            if (mypermissiongroupinfo.labelRes != 0 || mypermissiongroupinfo.nonLocalizedLabel != null)
                mypermissiongroupinfo.mLabel = mypermissiongroupinfo.loadLabel(mPm);
            else
                try
                {
                    mypermissiongroupinfo.mLabel = mPm.getApplicationInfo(mypermissiongroupinfo.packageName, 0).loadLabel(mPm);
                }
                catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
                {
                    mypermissiongroupinfo.mLabel = mypermissiongroupinfo.loadLabel(mPm);
                }
            mPermGroupsList.add(mypermissiongroupinfo);
        }
        Collections.sort(mPermGroupsList, mPermGroupComparator);
    }

    public PackageInfo getInstalledPackageInfo()
    {
        return mInstalledPackageInfo;
    }

    public int getPermissionCount()
    {
        return getPermissionCount(65535);
    }

    public int getPermissionCount(int i)
    {
        int j = 0;
        for (int k = 0; k < mPermGroupsList.size(); k++)
            j += getPermissionList((MyPermissionGroupInfo)mPermGroupsList.get(k), i).size();

        return j;
    }

    public View getPermissionsView()
    {
        return getPermissionsView(65535);
    }

    public View getPermissionsView(int i)
    {
        mInflater = (LayoutInflater)mContext.getSystemService("layout_inflater");
        LinearLayout linearlayout = (LinearLayout)mInflater.inflate(0x109002d, null);
        LinearLayout linearlayout1 = (LinearLayout)linearlayout.findViewById(0x1020272);
        View view = linearlayout.findViewById(0x1020271);
        displayPermissions(mPermGroupsList, linearlayout1, i);
        if (linearlayout1.getChildCount() <= 0)
            view.setVisibility(0);
        return linearlayout;
    }
}
