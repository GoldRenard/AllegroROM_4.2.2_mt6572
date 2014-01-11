// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.deviceinfo;

import android.app.*;
import android.content.Context;
import android.content.Intent;
import android.content.pm.IPackageManager;
import android.content.pm.UserInfo;
import android.content.res.Resources;
import android.os.*;
import android.os.storage.StorageManager;
import android.os.storage.StorageVolume;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.text.format.Formatter;
import android.util.Log;
import android.util.SparseLongArray;
import com.android.settings.MediaFormat;
import com.android.settings.Utils;
import com.google.android.collect.Lists;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.android.settings.deviceinfo:
//            StorageMeasurement, StorageItemPreference, UsageBarPreference, MiscFilesHandler

public class StorageVolumePreferenceCategory extends PreferenceCategory
{
    public static class PreferenceHeader extends Preference
    {

        public boolean isEnabled()
        {
            return false;
        }

        public PreferenceHeader(Context context, int i)
        {
            super(context, null, 0x101008c);
            setTitle(i);
        }

        public PreferenceHeader(Context context, CharSequence charsequence)
        {
            super(context, null, 0x101008c);
            setTitle(charsequence);
        }
    }


    public static final String KEY_CACHE = "cache";
    private static final int MSG_UI_UPDATE_APPROXIMATE = 1;
    private static final int MSG_UI_UPDATE_DETAILS = 2;
    private static final int ORDER_STORAGE_LOW = -1;
    private static final int ORDER_USAGE_BAR = -2;
    private static final String TAG = "StorageVolumePreferenceCategory";
    private static final String USB_STORAGE_PATH = "/mnt/usbotg";
    private static final String VOLUME_IS_SWAPPING = "1";
    private Preference mFormatPreference;
    private boolean mIsInternalSD;
    private boolean mIsPrimary;
    private boolean mIsUsbStorage;
    private StorageItemPreference mItemApps;
    private StorageItemPreference mItemAvailable;
    private StorageItemPreference mItemCache;
    private StorageItemPreference mItemDcim;
    private StorageItemPreference mItemDownloads;
    private StorageItemPreference mItemMisc;
    private StorageItemPreference mItemMusic;
    private StorageItemPreference mItemTotal;
    private List mItemUsers;
    private final StorageMeasurement mMeasure;
    private Preference mMountTogglePreference;
    private StorageMeasurement.MeasurementReceiver mReceiver;
    private final Resources mResources;
    private Preference mStorageLow;
    private final StorageManager mStorageManager;
    private long mTotalSize;
    private Handler mUpdateHandler;
    private UsageBarPreference mUsageBarPreference;
    private boolean mUsbConnected;
    private String mUsbFunction;
    private final UserManager mUserManager;
    private StorageVolume mVolume;
    private String mVolumeDescription;

    public StorageVolumePreferenceCategory(Context context, StorageVolume storagevolume)
    {
        super(context);
        mItemUsers = Lists.newArrayList();
        mUpdateHandler = new Handler() {

            final StorageVolumePreferenceCategory this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 2: // '\002'
                    StorageMeasurement.MeasurementDetails measurementdetails = (StorageMeasurement.MeasurementDetails)message.obj;
                    updateDetails(measurementdetails);
                    return;

                case 1: // '\001'
                    long al[] = (long[])(long[])message.obj;
                    updateApproximate(al[0], al[1]);
                    return;
                }
            }

            
            {
                this$0 = StorageVolumePreferenceCategory.this;
                super();
            }
        }
;
        mReceiver = new StorageMeasurement.MeasurementReceiver() {

            final StorageVolumePreferenceCategory this$0;

            public void updateApproximate(StorageMeasurement storagemeasurement, long l, long l1)
            {
                mUpdateHandler.obtainMessage(1, new long[] {
                    l, l1
                }).sendToTarget();
            }

            public void updateDetails(StorageMeasurement storagemeasurement, StorageMeasurement.MeasurementDetails measurementdetails)
            {
                mUpdateHandler.obtainMessage(2, measurementdetails).sendToTarget();
            }

            
            {
                this$0 = StorageVolumePreferenceCategory.this;
                super();
            }
        }
;
        mVolume = storagevolume;
        mMeasure = StorageMeasurement.getInstance(context, storagevolume);
        mResources = context.getResources();
        mStorageManager = StorageManager.from(context);
        mUserManager = (UserManager)context.getSystemService("user");
        if (storagevolume == null)
            setTitle(context.getText(0x7f0b0666));
        else
            setTitle(storagevolume.getDescription(context));
        if (storagevolume != null)
        {
            mIsUsbStorage = "/mnt/usbotg".equals(storagevolume.getPath());
            mVolumeDescription = storagevolume.getDescription(context);
            boolean flag;
            if (!storagevolume.isRemovable())
                flag = true;
            else
                flag = false;
            mIsInternalSD = flag;
            Xlog.d("StorageVolumePreferenceCategory", (new StringBuilder()).append("Storage description:").append(mVolumeDescription).append(", isEmulated: ").append(storagevolume.isEmulated()).append(", isRemovable ").append(storagevolume.isRemovable()).toString());
        }
    }

    public static StorageVolumePreferenceCategory buildForInternal(Context context)
    {
        return new StorageVolumePreferenceCategory(context, null);
    }

    public static StorageVolumePreferenceCategory buildForPhysical(Context context, StorageVolume storagevolume)
    {
        return new StorageVolumePreferenceCategory(context, storagevolume);
    }

    private StorageItemPreference buildItem(int i, int j)
    {
        return new StorageItemPreference(getContext(), i, j);
    }

    private String formatSize(long l)
    {
        return Formatter.formatFileSize(getContext(), l);
    }

    private boolean getSwappingState()
    {
        String s = "0";
        boolean flag;
        try
        {
            s = SystemProperties.get("is_swap_ongoing");
            Log.i("StorageVolumePreferenceCategory", (new StringBuilder()).append("getSwappingState from Property path=").append(s).toString());
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            Log.e("StorageVolumePreferenceCategory", (new StringBuilder()).append("IllegalArgumentException when get is_swapping:").append(illegalargumentexception).toString());
        }
        flag = "1".equals(s);
        Log.i("StorageVolumePreferenceCategory", (new StringBuilder()).append("isSwapping = ").append(flag).toString());
        return flag;
    }

    private List getUsersExcluding(UserInfo userinfo)
    {
        List list = mUserManager.getUsers();
        Iterator iterator = list.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            if (((UserInfo)iterator.next()).id == userinfo.id)
                iterator.remove();
        } while (true);
        return list;
    }

    private String getVolumeString(int i, String s)
    {
        String s1;
        if (s != null && (mIsInternalSD || mIsUsbStorage))
        {
            String s2 = mResources.getString(0x7f0b029a);
            s1 = mResources.getString(i).replace(s2, s);
            if (s1 != null && s1.equals(mResources.getString(i)))
            {
                String s3 = s2.toLowerCase().replace("sd", "SD");
                s1 = mResources.getString(i).replace(s3, s);
            }
            if (s1 != null && s1.equals(mResources.getString(i)))
            {
                s1 = mResources.getString(i).replace("SD", s);
                Xlog.d("StorageVolumePreferenceCategory", (new StringBuilder()).append("Can not replace SD card, Replace SD, str is ").append(s1).toString());
            }
            Locale locale = Locale.getDefault();
            if (locale.getCountry().equals(Locale.CHINA.getCountry()) || locale.getCountry().equals(Locale.TAIWAN.getCountry()))
                return s1.replace((new StringBuilder()).append(" ").append(s).toString(), s);
        } else
        {
            s1 = mResources.getString(i);
        }
        return s1;
    }

    private void measure()
    {
        mMeasure.invalidate();
        mMeasure.measure();
    }

    private void resetPreferences()
    {
        if (mUsageBarPreference != null)
            removePreference(mUsageBarPreference);
        if (mItemTotal != null)
            removePreference(mItemTotal);
        if (mItemAvailable != null)
            removePreference(mItemAvailable);
        if (mItemApps != null)
            removePreference(mItemApps);
        if (mItemDcim != null)
            removePreference(mItemDcim);
        if (mItemMusic != null)
            removePreference(mItemMusic);
        if (mItemDownloads != null)
            removePreference(mItemDownloads);
        if (mItemCache != null)
            removePreference(mItemCache);
        if (mItemMisc != null)
            removePreference(mItemMisc);
        removePreference(mMountTogglePreference);
        if (mFormatPreference != null)
            removePreference(mFormatPreference);
        addPreference(mUsageBarPreference);
        addPreference(mItemTotal);
        addPreference(mItemAvailable);
        addPreference(mItemApps);
        addPreference(mItemDcim);
        addPreference(mItemMusic);
        addPreference(mItemDownloads);
        addPreference(mItemCache);
        addPreference(mItemMisc);
        addPreference(mMountTogglePreference);
        if (mFormatPreference != null)
            addPreference(mFormatPreference);
        mMountTogglePreference.setEnabled(true);
    }

    private static transient long totalValues(HashMap hashmap, String as[])
    {
        long l = 0L;
        int i = as.length;
        for (int j = 0; j < i; j++)
            l += ((Long)hashmap.get(as[j])).longValue();

        return l;
    }

    private void updateLowStoragePreference()
    {
        IPackageManager ipackagemanager;
        if (mVolume != null && (!Utils.isSomeStorageEmulated() || !mIsInternalSD))
            break MISSING_BLOCK_LABEL_109;
        ipackagemanager = ActivityThread.getPackageManager();
        if (ipackagemanager.isStorageLow())
        {
            mStorageLow = new Preference(getContext());
            mStorageLow.setOrder(-1);
            mStorageLow.setTitle(0x7f0b057f);
            mStorageLow.setSummary(0x7f0b0580);
            addPreference(mStorageLow);
            return;
        }
        try
        {
            if (mStorageLow != null)
            {
                removePreference(mStorageLow);
                mStorageLow = null;
                return;
            }
        }
        catch (RemoteException remoteexception) { }
    }

    private void updatePreference(StorageItemPreference storageitempreference, long l)
    {
        if (l > 0L)
        {
            storageitempreference.setSummary(formatSize(l));
            int i = storageitempreference.getOrder();
            mUsageBarPreference.addEntry(i, (float)l / (float)mTotalSize, storageitempreference.color);
            return;
        } else
        {
            removePreference(storageitempreference);
            return;
        }
    }

    private void updatePreferencesFromState()
    {
        if (mVolume == null)
        {
            if (mMountTogglePreference != null)
                removePreference(mMountTogglePreference);
        } else
        {
            resetPreferences();
            String s = mStorageManager.getVolumeState(mVolume.getPath());
            Log.d("StorageVolumePreferenceCategory", (new StringBuilder()).append("updatePreferencesFromState, state is ").append(s).toString());
            if ("mounted_ro".equals(s))
            {
                mItemAvailable.setTitle(0x7f0b0564);
                if (mFormatPreference != null)
                    removePreference(mFormatPreference);
            } else
            {
                mItemAvailable.setTitle(0x7f0b0563);
            }
            if (!mVolume.isRemovable() && !"unmounted".equals(s))
                removePreference(mMountTogglePreference);
            if (!"mounted".equals(s) && !"mounted_ro".equals(s))
            {
                if (!"unmounted".equals(s) && !"nofs".equals(s) && !"unmountable".equals(s))
                {
                    mMountTogglePreference.setEnabled(false);
                    if (mIsUsbStorage)
                    {
                        mMountTogglePreference.setTitle(mResources.getString(0x7f0b0015));
                        mMountTogglePreference.setSummary(mResources.getString(0x7f0b0016));
                    } else
                    {
                        mMountTogglePreference.setTitle(getVolumeString(0x7f0b0571, mVolumeDescription));
                        mMountTogglePreference.setSummary(getVolumeString(0x7f0b0570, mVolumeDescription));
                    }
                } else
                {
                    mMountTogglePreference.setEnabled(true);
                    if (mIsUsbStorage)
                    {
                        mMountTogglePreference.setTitle(mResources.getString(0x7f0b0015));
                        mMountTogglePreference.setSummary(mResources.getString(0x7f0b0572));
                    } else
                    {
                        mMountTogglePreference.setTitle(getVolumeString(0x7f0b0571, mVolumeDescription));
                        mMountTogglePreference.setSummary(getVolumeString(0x7f0b0572, mVolumeDescription));
                    }
                }
                removePreference(mUsageBarPreference);
                removePreference(mItemTotal);
                removePreference(mItemAvailable);
                if (mFormatPreference != null)
                    removePreference(mFormatPreference);
            } else
            {
                mMountTogglePreference.setEnabled(true);
                if (mIsUsbStorage)
                {
                    mMountTogglePreference.setTitle(mResources.getString(0x7f0b0013));
                    mMountTogglePreference.setSummary(mResources.getString(0x7f0b0014));
                } else
                {
                    mMountTogglePreference.setTitle(getVolumeString(0x7f0b056e, mVolumeDescription));
                    mMountTogglePreference.setSummary(getVolumeString(0x7f0b056f, mVolumeDescription));
                }
            }
            if (!mUsbConnected || !"mtp".equals(mUsbFunction) && !"ptp".equals(mUsbFunction))
            {
                if (mFormatPreference != null)
                {
                    mFormatPreference.setEnabled(true);
                    mFormatPreference.setSummary(getVolumeString(0x7f0b0574, mVolumeDescription));
                    return;
                }
            } else
            {
                mMountTogglePreference.setEnabled(false);
                if ("mounted".equals(s) || "mounted_ro".equals(s))
                    mMountTogglePreference.setSummary(mResources.getString(0x7f0b0577));
                if (mFormatPreference != null)
                {
                    mFormatPreference.setEnabled(false);
                    mFormatPreference.setSummary(mResources.getString(0x7f0b0577));
                    return;
                }
            }
        }
    }

    public StorageVolume getStorageVolume()
    {
        return mVolume;
    }

    public void init()
    {
        Context context = getContext();
        UserInfo userinfo;
        List list;
        boolean flag;
        UsageBarPreference usagebarpreference;
        boolean flag1;
        try
        {
            userinfo = ActivityManagerNative.getDefault().getCurrentUser();
        }
        catch (RemoteException remoteexception)
        {
            throw new RuntimeException("Failed to get current user");
        }
        list = getUsersExcluding(userinfo);
        if (mVolume == null && list.size() > 0)
            flag = true;
        else
            flag = false;
        usagebarpreference = new UsageBarPreference(context);
        mUsageBarPreference = usagebarpreference;
        mUsageBarPreference.setOrder(-2);
        addPreference(mUsageBarPreference);
        mItemTotal = buildItem(0x7f0b0565, 0);
        mItemAvailable = buildItem(0x7f0b0563, 0x7f0a0007);
        addPreference(mItemTotal);
        addPreference(mItemAvailable);
        mItemApps = buildItem(0x7f0b0567, 0x7f0a0008);
        mItemDcim = buildItem(0x7f0b056a, 0x7f0a000a);
        mItemMusic = buildItem(0x7f0b056b, 0x7f0a000b);
        mItemDownloads = buildItem(0x7f0b0569, 0x7f0a0009);
        mItemCache = buildItem(0x7f0b056d, 0x7f0a000c);
        mItemMisc = buildItem(0x7f0b056c, 0x7f0a000d);
        mItemCache.setKey("cache");
        if (mVolume == null || mVolume.isPrimary())
            flag1 = true;
        else
            flag1 = false;
        if (flag1)
        {
            if (flag)
            {
                PreferenceHeader preferenceheader = new PreferenceHeader(context, userinfo.name);
                addPreference(preferenceheader);
            }
            addPreference(mItemApps);
            addPreference(mItemDcim);
            addPreference(mItemMusic);
            addPreference(mItemDownloads);
            addPreference(mItemCache);
            addPreference(mItemMisc);
            if (flag)
            {
                PreferenceHeader preferenceheader1 = new PreferenceHeader(context, 0x7f0b0589);
                addPreference(preferenceheader1);
                int i = 0;
                Iterator iterator = list.iterator();
                while (iterator.hasNext()) 
                {
                    UserInfo userinfo1 = (UserInfo)iterator.next();
                    int j = i + 1;
                    int k;
                    StorageItemPreference storageitempreference;
                    if (i % 2 == 0)
                        k = 0x7f0a000e;
                    else
                        k = 0x7f0a000f;
                    storageitempreference = new StorageItemPreference(getContext(), userinfo1.name, k, userinfo1.id);
                    mItemUsers.add(storageitempreference);
                    addPreference(storageitempreference);
                    i = j;
                }
            }
        }
        Preference preference = new Preference(context);
        mMountTogglePreference = preference;
        mMountTogglePreference.setTitle(getVolumeString(0x7f0b056e, mVolumeDescription));
        mMountTogglePreference.setSummary(getVolumeString(0x7f0b056f, mVolumeDescription));
        addPreference(mMountTogglePreference);
        boolean flag2;
        if (mVolume != null && !mVolume.isEmulated())
            flag2 = true;
        else
            flag2 = false;
        if (flag2)
        {
            mFormatPreference = new Preference(getContext());
            if (mIsUsbStorage)
            {
                mFormatPreference.setTitle(getVolumeString(0x7f0b0573, mResources.getString(0x7f0b0017)));
                mFormatPreference.setSummary(getVolumeString(0x7f0b0574, mResources.getString(0x7f0b0017)));
            } else
            {
                mFormatPreference.setTitle(getVolumeString(0x7f0b0573, mVolumeDescription));
                mFormatPreference.setSummary(getVolumeString(0x7f0b0574, mVolumeDescription));
            }
            addPreference(mFormatPreference);
        }
        updateLowStoragePreference();
    }

    public Intent intentForClick(Preference preference)
    {
        preference.getKey();
        Intent intent;
        if (preference == mFormatPreference)
        {
            intent = new Intent("android.intent.action.VIEW");
            intent.setClass(getContext(), com/android/settings/MediaFormat);
            Bundle bundle = new Bundle();
            bundle.putParcelable("volume", mVolume);
            bundle.putBoolean("IsUsbStorage", mIsUsbStorage);
            intent.putExtras(bundle);
        } else
        {
            if (preference == mItemApps)
            {
                Intent intent4 = new Intent("android.intent.action.MANAGE_PACKAGE_STORAGE");
                intent4.setClass(getContext(), com/android/settings/Settings$ManageApplicationsActivity);
                return intent4;
            }
            if (preference == mItemDownloads)
                return (new Intent("android.intent.action.VIEW_DOWNLOADS")).putExtra("android.app.DownloadManager.extra_sortBySize", true);
            if (preference == mItemMusic)
            {
                Intent intent3 = new Intent("android.intent.action.GET_CONTENT");
                intent3.setType("audio/mp3");
                return intent3;
            }
            if (preference == mItemDcim)
            {
                Intent intent2 = new Intent("android.intent.action.VIEW");
                intent2.putExtra("android.intent.extra.LOCAL_ONLY", true);
                intent2.setType("vnd.android.cursor.dir/image");
                return intent2;
            }
            StorageItemPreference storageitempreference = mItemMisc;
            intent = null;
            if (preference == storageitempreference)
            {
                Intent intent1 = new Intent(getContext().getApplicationContext(), com/android/settings/deviceinfo/MiscFilesHandler);
                intent1.putExtra("storage_volume", mVolume);
                return intent1;
            }
        }
        return intent;
    }

    public boolean mountToggleClicked(Preference preference)
    {
        return preference == mMountTogglePreference;
    }

    public void onCacheCleared()
    {
        measure();
    }

    public void onMediaScannerFinished()
    {
        Log.d("StorageVolumePreferenceCategory", "onMediaScannerFinished");
        measure();
    }

    public void onPause()
    {
        mMeasure.cleanUp();
    }

    public void onResume()
    {
        Log.d("StorageVolumePreferenceCategory", "onResume");
        mMeasure.setReceiver(mReceiver);
        measure();
        updatePreferencesFromState();
    }

    public void onStorageStateChanged()
    {
        Log.d("StorageVolumePreferenceCategory", "onStorageStateChanged");
        measure();
        updatePreferencesFromState();
    }

    public void onUsbStateChanged(boolean flag, String s)
    {
        Log.d("StorageVolumePreferenceCategory", "onUsbStateChanged");
        mUsbConnected = flag;
        mUsbFunction = s;
        measure();
        updatePreferencesFromState();
    }

    public void setStorageVolume(StorageVolume storagevolume)
    {
        mVolume = storagevolume;
    }

    public void updateApproximate(long l, long l1)
    {
        Xlog.d("StorageVolumePreferenceCategory", (new StringBuilder()).append(mVolumeDescription).append(" : total size is ").append(l).append(", avail size is ").append(l1).toString());
        mItemTotal.setSummary(formatSize(l));
        mItemAvailable.setSummary(formatSize(l1));
        mTotalSize = l;
        long l2 = l - l1;
        mUsageBarPreference.clear();
        mUsageBarPreference.addEntry(0, (float)l2 / (float)l, 0xff888888);
        mUsageBarPreference.commit();
        updatePreferencesFromState();
    }

    public void updateDetails(StorageMeasurement.MeasurementDetails measurementdetails)
    {
        if (mVolume != null)
            Xlog.d("StorageVolumePreferenceCategory", (new StringBuilder()).append("updateDetails, ").append(mVolume.getDescription(getContext())).append(", isPrimary is ").append(mVolume.isPrimary()).toString());
        else
            Xlog.d("StorageVolumePreferenceCategory", "updateDetails, mVolume is null");
        boolean flag;
        if (mVolume != null && !mVolume.isPrimary())
            flag = false;
        else
            flag = true;
        if (!flag)
        {
            if (mItemApps != null)
                removePreference(mItemApps);
            if (mItemDcim != null)
                removePreference(mItemDcim);
            if (mItemMusic != null)
                removePreference(mItemMusic);
            if (mItemDownloads != null)
                removePreference(mItemDownloads);
            if (mItemCache != null)
                removePreference(mItemCache);
            if (mItemMisc != null)
                removePreference(mItemMisc);
            return;
        }
        mItemTotal.setSummary(formatSize(measurementdetails.totalSize));
        mItemAvailable.setSummary(formatSize(measurementdetails.availSize));
        mUsageBarPreference.clear();
        updatePreference(mItemApps, measurementdetails.appsSize);
        boolean flag1;
        if ((mVolume != null || !Environment.isExternalStorageEmulated()) && (mVolume == null || !mVolume.isPrimary()))
            flag1 = false;
        else
            flag1 = true;
        Xlog.d("StorageVolumePreferenceCategory", (new StringBuilder()).append("measureMedia is ").append(flag1).toString());
        if (flag1)
        {
            HashMap hashmap = measurementdetails.mediaSize;
            String as[] = new String[3];
            as[0] = Environment.DIRECTORY_DCIM;
            as[1] = Environment.DIRECTORY_MOVIES;
            as[2] = Environment.DIRECTORY_PICTURES;
            long l = totalValues(hashmap, as);
            Xlog.d("StorageVolumePreferenceCategory", (new StringBuilder()).append("mDcim size is ").append(mItemDcim).toString());
            updatePreference(mItemDcim, l);
            HashMap hashmap1 = measurementdetails.mediaSize;
            String as1[] = new String[5];
            as1[0] = Environment.DIRECTORY_MUSIC;
            as1[1] = Environment.DIRECTORY_ALARMS;
            as1[2] = Environment.DIRECTORY_NOTIFICATIONS;
            as1[3] = Environment.DIRECTORY_RINGTONES;
            as1[4] = Environment.DIRECTORY_PODCASTS;
            long l1 = totalValues(hashmap1, as1);
            Xlog.d("StorageVolumePreferenceCategory", (new StringBuilder()).append("music size is ").append(l1).toString());
            updatePreference(mItemMusic, l1);
            HashMap hashmap2 = measurementdetails.mediaSize;
            String as2[] = new String[1];
            as2[0] = Environment.DIRECTORY_DOWNLOADS;
            long l2 = totalValues(hashmap2, as2);
            Xlog.d("StorageVolumePreferenceCategory", (new StringBuilder()).append("downloads size is ").append(l2).toString());
            updatePreference(mItemDownloads, l2);
        } else
        {
            updatePreference(mItemDcim, 0L);
            updatePreference(mItemMusic, 0L);
            updatePreference(mItemDownloads, 0L);
        }
        updatePreference(mItemCache, measurementdetails.cacheSize);
        updatePreference(mItemMisc, measurementdetails.miscSize);
        StorageItemPreference storageitempreference;
        for (Iterator iterator = mItemUsers.iterator(); iterator.hasNext(); updatePreference(storageitempreference, measurementdetails.usersSize.get(storageitempreference.userHandle)))
            storageitempreference = (StorageItemPreference)iterator.next();

        mUsageBarPreference.commit();
    }

    public void updateStorageVolumePrefCategory()
    {
        Xlog.d("StorageVolumePreferenceCategory", "sd swap ---- updateStorageVolumePrefCategory");
        Object obj;
        if (mVolume != null)
            obj = mVolume.getDescription(getContext());
        else
            obj = mResources.getText(0x7f0b0666);
        setTitle(((CharSequence) (obj)));
        measure();
        if (mVolume != null)
        {
            mVolumeDescription = mVolume.getDescription(getContext());
            Xlog.d("StorageVolumePreferenceCategory", (new StringBuilder()).append("mVolumeDescription is ").append(mVolumeDescription).toString());
            boolean flag2;
            if (!mVolume.isRemovable())
                flag2 = true;
            else
                flag2 = false;
            mIsInternalSD = flag2;
            Xlog.d("StorageVolumePreferenceCategory", (new StringBuilder()).append("mIsInternalSD is ").append(mIsInternalSD).toString());
        }
        if (mStorageLow != null)
        {
            removePreference(mStorageLow);
            mStorageLow = null;
        }
        updateLowStoragePreference();
        boolean flag;
        if (mVolume != null)
            flag = mVolume.isRemovable();
        else
            flag = false;
        if (flag && mMountTogglePreference == null)
        {
            mMountTogglePreference = new Preference(getContext());
            mMountTogglePreference.setTitle(getVolumeString(0x7f0b056e, mVolumeDescription));
            mMountTogglePreference.setSummary(getVolumeString(0x7f0b056f, mVolumeDescription));
            addPreference(mMountTogglePreference);
        }
        boolean flag1;
        if (mVolume != null && !mVolume.isEmulated())
            flag1 = true;
        else
            flag1 = false;
        if (flag1)
        {
            if (mFormatPreference == null)
                mFormatPreference = new Preference(getContext());
            mFormatPreference.setTitle(getVolumeString(0x7f0b0573, mVolumeDescription));
            mFormatPreference.setSummary(getVolumeString(0x7f0b0574, mVolumeDescription));
        } else
        if (mFormatPreference != null)
        {
            removePreference(mFormatPreference);
            mFormatPreference = null;
        }
        updatePreferencesFromState();
    }

}
