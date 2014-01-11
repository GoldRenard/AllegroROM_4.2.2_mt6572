// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.deviceinfo;

import android.app.*;
import android.content.*;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.hardware.usb.UsbManager;
import android.os.*;
import android.os.storage.*;
import android.preference.*;
import android.util.Log;
import android.view.*;
import android.widget.Toast;
import com.android.settings.SettingsPreferenceFragment;
import com.android.settings.Utils;
import com.google.common.collect.Lists;
import com.mediatek.storage.StorageManagerEx;
import java.io.File;
import java.util.*;

// Referenced classes of package com.android.settings.deviceinfo:
//            StorageVolumePreferenceCategory, RadioButtonPreference, UsbSettings

public class Memory extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceChangeListener
{
    private static class ClearCacheObserver extends android.content.pm.IPackageDataObserver.Stub
    {

        private int mRemaining;
        private final Memory mTarget;

        public void onRemoveCompleted(String s, boolean flag)
        {
            this;
            JVM INSTR monitorenter ;
            int i;
            i = -1 + mRemaining;
            mRemaining = i;
            if (i != 0)
                break MISSING_BLOCK_LABEL_28;
            mTarget.onCacheCleared();
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public ClearCacheObserver(Memory memory, int i)
        {
            mTarget = memory;
            mRemaining = i;
        }
    }

    public static class ConfirmClearCacheFragment extends DialogFragment
    {

        public static void show(Memory memory)
        {
            if (!memory.isAdded())
            {
                return;
            } else
            {
                ConfirmClearCacheFragment confirmclearcachefragment = new ConfirmClearCacheFragment();
                confirmclearcachefragment.setTargetFragment(memory, 0);
                confirmclearcachefragment.show(memory.getFragmentManager(), "confirmClearCache");
                return;
            }
        }

        public Dialog onCreateDialog(Bundle bundle)
        {
            Activity activity = getActivity();
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(activity);
            builder.setTitle(0x7f0b0575);
            builder.setMessage(getString(0x7f0b0576));
            builder.setPositiveButton(0x104000a, activity. new android.content.DialogInterface.OnClickListener() {

                final ConfirmClearCacheFragment this$0;
                final Context val$context;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    Memory memory = (Memory)getTargetFragment();
                    PackageManager packagemanager = context.getPackageManager();
                    List list = packagemanager.getInstalledPackages(0);
                    ClearCacheObserver clearcacheobserver = new ClearCacheObserver(memory, list.size());
                    for (Iterator iterator = list.iterator(); iterator.hasNext(); packagemanager.deleteApplicationCacheFiles(((PackageInfo)iterator.next()).packageName, clearcacheobserver));
                }

            
            {
                this$0 = final_confirmclearcachefragment;
                context = Context.this;
                super();
            }
            }
);
            builder.setNegativeButton(0x1040000, null);
            return builder.create();
        }

    }


    private static final String ACTION_DYNAMIC_SD_SWAP = "com.mediatek.SD_SWAP";
    private static final int APP_INSTALL_AUTO = 0;
    private static final String APP_INSTALL_AUTO_ID = "auto";
    private static final int APP_INSTALL_DEVICE = 1;
    private static final String APP_INSTALL_DEVICE_ID = "device";
    private static final int APP_INSTALL_SDCARD = 2;
    private static final String APP_INSTALL_SDCARD_ID = "sdcard";
    private static final String DEFAULT_WRITE_CATEGORY_KEY = "memory_select";
    private static final int DLG_CONFIRM_MOUNT = 3;
    private static final int DLG_CONFIRM_UNMOUNT = 1;
    private static final int DLG_ERROR_UNMOUNT = 2;
    private static final String EXTERNAL_STORAGE_PATH = "/storage/sdcard1";
    public static final int H_UNMOUNT_ERROR = 11;
    private static final String KEY_APK_INSTALLER = "apk_installer";
    private static final String KEY_APP_INSTALL_LOCATION = "app_install_location";
    private static final int MESSAGE_DELAY_TIME = 200;
    private static final int ORDER_PHONE_STORAGE = -3;
    private static final int ORDER_SD_CARD = -2;
    private static final int ORDER_USB_OTG = -1;
    private static final String SD_EXIST = "SD_EXIST";
    private static final int SD_INDEX = 1;
    private static final String TAG = "MemorySettings";
    private static final String TAG_CONFIRM_CLEAR_CACHE = "confirmClearCache";
    private static final String USB_STORAGE_PATH = "/mnt/usbotg";
    private static String sClickedMountPoint;
    private static Preference sLastClickedMountToggle;
    private Preference mApkInstallePref;
    private ArrayList mCategories;
    private RadioButtonPreference mDeafultWritePathPref;
    private PreferenceCategory mDefaultWriteCategory;
    private boolean mDefaultWriteDiskCategoryIsPresent;
    private String mDefaultWritePath;
    private boolean mDefaultWritePathAdded[];
    BroadcastReceiver mDynSwapReceiver;
    private ListPreference mInstallLocation;
    private boolean mIsApkInstallerExist;
    private boolean mIsInstLocSupport;
    private boolean mIsRemovableVolume;
    private boolean mIsUnmountingUsb;
    private final BroadcastReceiver mMediaScannerReceiver = new BroadcastReceiver() {

        final Memory this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            if (s.equals("android.hardware.usb.action.USB_STATE"))
            {
                boolean flag = intent.getBooleanExtra("connected", false);
                String s1 = mUsbManager.getDefaultFunction();
                for (Iterator iterator1 = mCategories.iterator(); iterator1.hasNext(); ((StorageVolumePreferenceCategory)iterator1.next()).onUsbStateChanged(flag, s1));
            } else
            if (s.equals("android.intent.action.MEDIA_SCANNER_FINISHED"))
            {
                for (Iterator iterator = mCategories.iterator(); iterator.hasNext(); ((StorageVolumePreferenceCategory)iterator.next()).onMediaScannerFinished());
            }
        }

            
            {
                this$0 = Memory.this;
                super();
            }
    }
;
    private IMountService mMountService;
    private Resources mResources;
    StorageEventListener mStorageListener;
    private StorageManager mStorageManager;
    private RadioButtonPreference mStorageWritePathGroup[];
    private Handler mUiHandler;
    private Handler mUnMountErrorHandler;
    private final Runnable mUpdateRunnable = new Runnable() {

        final Memory this$0;

        public void run()
        {
            dynamicShowDefaultWriteCategory();
        }

            
            {
                this$0 = Memory.this;
                super();
            }
    }
;
    private UsbManager mUsbManager;
    private StorageVolumePreferenceCategory mVolumePrefCategory;

    public Memory()
    {
        mIsUnmountingUsb = false;
        mCategories = Lists.newArrayList();
        mDynSwapReceiver = new BroadcastReceiver() {

            final Memory this$0;

            public void onReceive(Context context, Intent intent)
            {
                Log.d("MemorySettings", "Receive dynamic sd swap broadcast");
                StorageVolume astoragevolume[] = mStorageManager.getVolumeList();
                int i = astoragevolume.length;
                for (int j = 0; j < i; j++)
                {
                    StorageVolume storagevolume = astoragevolume[j];
                    Iterator iterator = mCategories.iterator();
                    do
                    {
                        if (!iterator.hasNext())
                            break;
                        StorageVolumePreferenceCategory storagevolumepreferencecategory = (StorageVolumePreferenceCategory)iterator.next();
                        if (storagevolume != null && storagevolumepreferencecategory.getStorageVolume() != null && storagevolume.getPath().equals(storagevolumepreferencecategory.getStorageVolume().getPath()))
                        {
                            storagevolumepreferencecategory.setStorageVolume(storagevolume);
                            storagevolumepreferencecategory.updateStorageVolumePrefCategory();
                        }
                    } while (true);
                    RadioButtonPreference aradiobuttonpreference[] = mStorageWritePathGroup;
                    int k = aradiobuttonpreference.length;
                    for (int l = 0; l < k; l++)
                    {
                        RadioButtonPreference radiobuttonpreference = aradiobuttonpreference[l];
                        if (storagevolume.getPath().equals(radiobuttonpreference.getPath()))
                            radiobuttonpreference.setTitle(storagevolume.getDescription(getActivity()));
                    }

                }

                dynamicShowDefaultWriteCategory();
                resetInstallLocation(intent, astoragevolume);
            }

            
            {
                this$0 = Memory.this;
                super();
            }
        }
;
        mDefaultWriteDiskCategoryIsPresent = true;
        mIsApkInstallerExist = false;
        mIsInstLocSupport = false;
        mUnMountErrorHandler = new Handler() {

            final Memory this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 11: // '\013'
                    showDialogInner(2);
                    return;
                }
            }

            
            {
                this$0 = Memory.this;
                super();
            }
        }
;
        mStorageListener = new StorageEventListener() {

            final Memory this$0;

            public void onStorageStateChanged(String s, String s1, String s2)
            {
                Log.i("MemorySettings", "onStorageStateChanged");
                mUiHandler.removeCallbacks(mUpdateRunnable);
                mUiHandler.postDelayed(mUpdateRunnable, 200L);
                Log.i("MemorySettings", (new StringBuilder()).append("Received storage state changed notification that ").append(s).append(" changed state from ").append(s1).append(" to ").append(s2).toString());
                Iterator iterator = mCategories.iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    StorageVolumePreferenceCategory storagevolumepreferencecategory = (StorageVolumePreferenceCategory)iterator.next();
                    StorageVolume storagevolume = storagevolumepreferencecategory.getStorageVolume();
                    if (storagevolume == null || !s.equals(storagevolume.getPath()))
                        continue;
                    storagevolumepreferencecategory.onStorageStateChanged();
                    break;
                } while (true);
                Log.d("MemorySettings", "Dynamic Update Install Location in storage listener");
                dynamicUpdateInstallLocation();
                dynamicUpdateAPKInstaller();
            }

            
            {
                this$0 = Memory.this;
                super();
            }
        }
;
    }

    private void addCategory(StorageVolumePreferenceCategory storagevolumepreferencecategory)
    {
        mCategories.add(storagevolumepreferencecategory);
        getPreferenceScreen().addPreference(storagevolumepreferencecategory);
        storagevolumepreferencecategory.init();
    }

    private void doMount()
    {
        (new Thread() {

            final Memory this$0;
            final IMountService val$mountService;

            public void run()
            {
                try
                {
                    if (mountService != null)
                    {
                        Log.d("MemorySettings", (new StringBuilder()).append("mountVolume").append(Memory.sClickedMountPoint).toString());
                        mountService.mountVolume(Memory.sClickedMountPoint);
                        return;
                    }
                }
                catch (RemoteException remoteexception)
                {
                    return;
                }
                Log.e("MemorySettings", "Mount service is null, can't mount");
                return;
            }

            
            {
                this$0 = Memory.this;
                mountService = imountservice;
                super();
            }
        }
).start();
    }

    private void doUnmount()
    {
        if (mIsUnmountingUsb)
            Toast.makeText(getActivity(), 0x7f0b0012, 0).show();
        else
            Toast.makeText(getActivity(), 0x7f0b057c, 0).show();
        final IMountService mountService = getMountService();
        sLastClickedMountToggle.setEnabled(false);
        sLastClickedMountToggle.setTitle(mResources.getString(0x7f0b057d));
        sLastClickedMountToggle.setSummary(mResources.getString(0x7f0b057e));
        (new Thread() {

            final Memory this$0;
            final IMountService val$mountService;

            public void run()
            {
                Log.d("MemorySettings", (new StringBuilder()).append("unmountVolume").append(Memory.sClickedMountPoint).toString());
                try
                {
                    mountService.unmountVolume(Memory.sClickedMountPoint, true, false);
                    return;
                }
                catch (RemoteException remoteexception)
                {
                    mUnMountErrorHandler.sendEmptyMessage(11);
                }
            }

            
            {
                this$0 = Memory.this;
                mountService = imountservice;
                super();
            }
        }
).start();
    }

    private void dynamicShowDefaultWriteCategory()
    {
        Log.d("MemorySettings", "dynamicShowDefaultWriteCategory()");
        String s = StorageManagerEx.getExternalStoragePath();
        Log.d("MemorySettings", (new StringBuilder()).append("external storage path= ").append(s).toString());
        for (int i = 0; i < mStorageWritePathGroup.length; i++)
        {
            String s1 = mStorageWritePathGroup[i].getPath();
            String s2 = mStorageManager.getVolumeState(s1);
            Log.d("MemorySettings", (new StringBuilder()).append("Path ").append(s1).append(" volume state is ").append(s2).toString());
            if (s1.equals(s))
            {
                Log.d("MemorySettings", "set the pref sd card order");
                mStorageWritePathGroup[i].setOrder(-2);
            } else
            if (s1.equals("/mnt/usbotg"))
            {
                Log.d("MemorySettings", "set the pref usb otg order");
                mStorageWritePathGroup[i].setOrder(-1);
            } else
            {
                Log.d("MemorySettings", "set the pref phone storage order");
                mStorageWritePathGroup[i].setOrder(-3);
            }
            if ("mounted".equals(s2))
            {
                if (!mDefaultWritePathAdded[i])
                {
                    mDefaultWriteCategory.addPreference(mStorageWritePathGroup[i]);
                    mDefaultWritePathAdded[i] = true;
                }
                continue;
            }
            if (mDefaultWritePathAdded[i])
            {
                mStorageWritePathGroup[i].setChecked(false);
                mDefaultWriteCategory.removePreference(mStorageWritePathGroup[i]);
                mDefaultWritePathAdded[i] = false;
            }
        }

        int j = mDefaultWriteCategory.getPreferenceCount();
        Log.d("MemorySettings", (new StringBuilder()).append("numberOfWriteDisk : ").append(j).toString());
        if (mDefaultWriteDiskCategoryIsPresent && j == 0)
        {
            getPreferenceScreen().removePreference(mDefaultWriteCategory);
            mDefaultWriteDiskCategoryIsPresent = false;
        } else
        if (!mDefaultWriteDiskCategoryIsPresent && j > 0)
        {
            getPreferenceScreen().addPreference(mDefaultWriteCategory);
            mDefaultWriteDiskCategoryIsPresent = true;
        }
        mDefaultWritePath = StorageManagerEx.getDefaultPath();
        Log.d("MemorySettings", (new StringBuilder()).append("get default path").append(mDefaultWritePath).toString());
        for (int k = 0; k < mStorageWritePathGroup.length; k++)
            if (mStorageWritePathGroup[k].getPath().equals(mDefaultWritePath))
            {
                mStorageWritePathGroup[k].setChecked(true);
                mDeafultWritePathPref = mStorageWritePathGroup[k];
            } else
            {
                mStorageWritePathGroup[k].setChecked(false);
            }

    }

    private void dynamicUpdateUnmountDlg()
    {
        Log.d("MemorySettings", "dynamicUpdateUnmountDlg()");
        for (int i = 0; i < mStorageWritePathGroup.length; i++)
        {
            String s = mStorageWritePathGroup[i].getPath();
            String s1 = mStorageManager.getVolumeState(s);
            Log.d("MemorySettings", (new StringBuilder()).append("Path ").append(s).append(" volume state is ").append(s1).toString());
            if ("shared".equals(s1))
            {
                Log.d("MemorySettings", "current status is UMS");
                removeDialog(1);
                return;
            }
        }

        Log.d("MemorySettings", "current status is MTP");
    }

    private String getAppInstallLocation()
    {
        int i = android.provider.Settings.Global.getInt(getContentResolver(), "default_install_location", 0);
        if (i == 1)
            return "device";
        if (i == 2)
            return "sdcard";
        if (i == 0)
            return "auto";
        else
            return "auto";
    }

    private IMountService getMountService()
    {
        this;
        JVM INSTR monitorenter ;
        android.os.IBinder ibinder;
        if (mMountService != null)
            break MISSING_BLOCK_LABEL_28;
        ibinder = ServiceManager.getService("mount");
        if (ibinder == null)
            break MISSING_BLOCK_LABEL_37;
        mMountService = android.os.storage.IMountService.Stub.asInterface(ibinder);
_L1:
        IMountService imountservice = mMountService;
        this;
        JVM INSTR monitorexit ;
        return imountservice;
        Log.e("MemorySettings", "Can't get mount service");
          goto _L1
        Exception exception;
        exception;
        throw exception;
    }

    private boolean hasAppsAccessingStorage()
        throws RemoteException
    {
        int ai[] = getMountService().getStorageUsers(sClickedMountPoint);
        if (ai != null)
            if (ai.length <= 0);
        return true;
    }

    private void initApkInstallerPreference()
    {
        mIsApkInstallerExist = isPkgInstalled("com.mediatek.apkinstaller");
        if (mIsApkInstallerExist)
        {
            mApkInstallePref = findPreference("apk_installer");
            Intent intent = new Intent();
            intent.setClassName("com.mediatek.apkinstaller", "com.mediatek.apkinstaller.APKInstaller");
            intent.setFlags(0x800000);
            mApkInstallePref.setIntent(intent);
            return;
        } else
        {
            getPreferenceScreen().removePreference(findPreference("apk_installer"));
            return;
        }
    }

    private void initInstallLocationPreference(StorageVolume astoragevolume[])
    {
        int i = android.provider.Settings.Global.getInt(getContentResolver(), "set_install_location", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        mIsInstLocSupport = flag;
        if (mIsInstLocSupport)
        {
            mInstallLocation = (ListPreference)findPreference("app_install_location");
            String s = "";
            int j = 0;
            do
            {
label0:
                {
                    if (j < astoragevolume.length)
                    {
                        if (!astoragevolume[j].getPath().equals(Environment.getLegacyExternalStorageDirectory().getPath()))
                            break label0;
                        s = astoragevolume[j].getDescription(getActivity());
                    }
                    CharSequence acharsequence[] = mInstallLocation.getEntries();
                    acharsequence[1] = s;
                    mInstallLocation.setEntries(acharsequence);
                    mInstallLocation.setValue(getAppInstallLocation());
                    mInstallLocation.setOnPreferenceChangeListener(new android.preference.Preference.OnPreferenceChangeListener() {

                        final Memory this$0;

                        public boolean onPreferenceChange(Preference preference, Object obj)
                        {
                            String s1 = (String)obj;
                            handleUpdateAppInstallLocation(s1);
                            return false;
                        }

            
            {
                this$0 = Memory.this;
                super();
            }
                    }
);
                    return;
                }
                j++;
            } while (true);
        } else
        {
            getPreferenceScreen().removePreference(findPreference("app_install_location"));
            return;
        }
    }

    private boolean isMassStorageEnabled()
    {
        StorageVolume storagevolume = StorageManager.getPrimaryVolume(mStorageManager.getVolumeList());
        return storagevolume != null && storagevolume.allowMassStorage();
    }

    private boolean isPkgInstalled(String s)
    {
        if (s != null)
        {
            PackageManager packagemanager = getPackageManager();
            try
            {
                packagemanager.getPackageInfo(s, 0);
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
            {
                namenotfoundexception.printStackTrace();
                return false;
            }
            return true;
        } else
        {
            Log.i("MemorySettings", "the package name cannot be null!!");
            return false;
        }
    }

    private void mount()
    {
        doMount();
    }

    private void onCacheCleared()
    {
        for (Iterator iterator = mCategories.iterator(); iterator.hasNext(); ((StorageVolumePreferenceCategory)iterator.next()).onCacheCleared());
    }

    private void resetInstallLocation(Intent intent, StorageVolume astoragevolume[])
    {
        if (mIsInstLocSupport)
        {
            Log.d("MemorySettings", "resetInstallLocation()");
            boolean flag = intent.getBooleanExtra("SD_EXIST", false);
            mInstallLocation.setEnabled(flag);
            if (flag)
            {
                String s = "";
                int i = 0;
                do
                {
label0:
                    {
                        if (i < astoragevolume.length)
                        {
                            if (!astoragevolume[i].getPath().equals(Environment.getLegacyExternalStorageDirectory().getPath()))
                                break label0;
                            s = astoragevolume[i].getDescription(getActivity());
                        }
                        CharSequence acharsequence[] = mInstallLocation.getEntries();
                        acharsequence[1] = s;
                        mInstallLocation.setEntries(acharsequence);
                        return;
                    }
                    i++;
                } while (true);
            }
        }
    }

    private void showDialogInner(int i)
    {
        removeDialog(i);
        showDialog(i);
    }

    private void unmount()
    {
        if (hasAppsAccessingStorage())
        {
            showDialogInner(1);
            return;
        }
        try
        {
            doUnmount();
            return;
        }
        catch (RemoteException remoteexception)
        {
            Log.e("MemorySettings", "Is MountService running?");
        }
        showDialogInner(2);
        return;
    }

    public void dynamicUpdateAPKInstaller()
    {
        if (!mIsApkInstallerExist)
            return;
        boolean flag = false;
        Log.d("MemorySettings", "dynamicUpdateAPKInstaller()");
        for (int i = 0; i < mStorageWritePathGroup.length; i++)
        {
            String s = mStorageWritePathGroup[i].getPath();
            String s1 = mStorageManager.getVolumeState(s);
            Log.d("MemorySettings", (new StringBuilder()).append("Path ").append(s).append(" volume state is ").append(s1).toString());
            if (!flag && !"mounted".equals(s1))
                flag = false;
            else
                flag = true;
        }

        mApkInstallePref.setEnabled(flag);
    }

    public void dynamicUpdateInstallLocation()
    {
        if (!mIsInstLocSupport)
            return;
        Log.d("MemorySettings", "dynamicUpdateInstallLocation()");
        for (int i = 0; i < mStorageWritePathGroup.length; i++)
        {
            String s = mStorageWritePathGroup[i].getPath();
            String s1 = mStorageManager.getVolumeState(s);
            Log.d("MemorySettings", (new StringBuilder()).append("Path ").append(s).append(" volume state is ").append(s1).toString());
            if ("shared".equals(s1))
            {
                Log.d("MemorySettings", "current status is UMS");
                mInstallLocation.setEnabled(false);
                return;
            }
        }

        Log.d("MemorySettings", "current status is not UMS");
        mInstallLocation.setEnabled(true);
    }

    protected void handleUpdateAppInstallLocation(String s)
    {
        if ("device".equals(s))
            android.provider.Settings.Global.putInt(getContentResolver(), "default_install_location", 1);
        else
        if ("sdcard".equals(s))
            android.provider.Settings.Global.putInt(getContentResolver(), "default_install_location", 2);
        else
        if ("auto".equals(s))
            android.provider.Settings.Global.putInt(getContentResolver(), "default_install_location", 0);
        else
            android.provider.Settings.Global.putInt(getContentResolver(), "default_install_location", 0);
        mInstallLocation.setValue(s);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Activity activity = getActivity();
        mUsbManager = (UsbManager)getSystemService("usb");
        mStorageManager = StorageManager.from(activity);
        mStorageManager.registerListener(mStorageListener);
        addPreferencesFromResource(0x7f050010);
        mUiHandler = new Handler();
        mDefaultWriteCategory = (PreferenceCategory)findPreference("memory_select");
        mResources = getResources();
        Log.d("MemorySettings", "not sd + swap, add internal storage");
        addCategory(StorageVolumePreferenceCategory.buildForInternal(activity));
        String as[] = mStorageManager.getVolumePaths();
        StorageVolume astoragevolume[] = mStorageManager.getVolumeList();
        ArrayList arraylist = new ArrayList();
        ArrayList arraylist1 = new ArrayList();
        for (int i = 0; i < as.length; i++)
        {
            Log.d("MemorySettings", (new StringBuilder()).append("Volume: ").append(astoragevolume[i].getDescription(getActivity())).append(" ,state is: ").append(mStorageManager.getVolumeState(as[i])).append(" ,emulated is: ").append(astoragevolume[i].isEmulated()).append(", path is ").append(astoragevolume[i].getPath()).toString());
            if (!"not_present".equals(mStorageManager.getVolumeState(as[i])))
            {
                arraylist.add(as[i]);
                arraylist1.add(astoragevolume[i]);
            }
        }

        int j = arraylist1.size();
        Log.d("MemorySettings", (new StringBuilder()).append("default path group length = ").append(j).toString());
        mStorageWritePathGroup = new RadioButtonPreference[j];
        mDefaultWritePathAdded = new boolean[j];
        for (int k = 0; k < arraylist1.size(); k++)
        {
            StorageVolume storagevolume = (StorageVolume)arraylist1.get(k);
            mStorageWritePathGroup[k] = new RadioButtonPreference(getActivity());
            mStorageWritePathGroup[k].setKey((String)arraylist.get(k));
            mStorageWritePathGroup[k].setTitle(storagevolume.getDescription(getActivity()));
            mStorageWritePathGroup[k].setPath((String)arraylist.get(k));
            mStorageWritePathGroup[k].setOnPreferenceChangeListener(this);
            if (!storagevolume.isEmulated())
            {
                Log.d("MemorySettings", "no share + swap, add non-emulated category");
                addCategory(StorageVolumePreferenceCategory.buildForPhysical(activity, storagevolume));
            }
        }

        setHasOptionsMenu(true);
        initApkInstallerPreference();
        initInstallLocationPreference(astoragevolume);
    }

    public Dialog onCreateDialog(int i)
    {
        switch (i)
        {
        case 3: // '\003'
            return (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b0150).setPositiveButton(0x7f0b066b, new android.content.DialogInterface.OnClickListener() {

                final Memory this$0;

                public void onClick(DialogInterface dialoginterface, int j1)
                {
                    doMount();
                }

            
            {
                this$0 = Memory.this;
                super();
            }
            }
).setNegativeButton(0x7f0b034b, null).setMessage(0x7f0b0151).create();

        case 2: // '\002'
            android.app.AlertDialog.Builder builder2 = new android.app.AlertDialog.Builder(getActivity());
            int l;
            if (mIsUnmountingUsb)
                l = 0x7f0b0010;
            else
                l = 0x7f0b057a;
            android.app.AlertDialog.Builder builder3 = builder2.setTitle(l).setNeutralButton(0x7f0b066b, null);
            int i1;
            if (mIsUnmountingUsb)
                i1 = 0x7f0b0011;
            else
                i1 = 0x7f0b057b;
            return builder3.setMessage(i1).create();

        case 1: // '\001'
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(getActivity());
            int j;
            if (mIsUnmountingUsb)
                j = 0x7f0b000e;
            else
                j = 0x7f0b0578;
            android.app.AlertDialog.Builder builder1 = builder.setTitle(j).setPositiveButton(0x7f0b066b, new android.content.DialogInterface.OnClickListener() {

                final Memory this$0;

                public void onClick(DialogInterface dialoginterface, int j1)
                {
                    doUnmount();
                }

            
            {
                this$0 = Memory.this;
                super();
            }
            }
).setNegativeButton(0x7f0b034b, null);
            int k;
            if (mIsUnmountingUsb)
                k = 0x7f0b000f;
            else
                k = 0x7f0b0579;
            return builder1.setMessage(k).create();
        }
        return null;
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        menuinflater.inflate(0x7f100003, menu);
    }

    public void onDestroy()
    {
        mUiHandler.removeCallbacks(mUpdateRunnable);
        if (mStorageManager != null && mStorageListener != null)
            mStorageManager.unregisterListener(mStorageListener);
        super.onDestroy();
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 2131231346: 
            if (getActivity() instanceof PreferenceActivity)
                ((PreferenceActivity)getActivity()).startPreferencePanel(com/android/settings/deviceinfo/UsbSettings.getCanonicalName(), null, 0x7f0b0582, null, this, 0);
            else
                startFragment(this, com/android/settings/deviceinfo/UsbSettings.getCanonicalName(), -1, null);
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public void onPause()
    {
        super.onPause();
        getActivity().unregisterReceiver(mMediaScannerReceiver);
        for (Iterator iterator = mCategories.iterator(); iterator.hasNext(); ((StorageVolumePreferenceCategory)iterator.next()).onPause());
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        boolean flag = false;
        if (preference != null)
        {
            boolean flag1 = preference instanceof RadioButtonPreference;
            flag = false;
            if (flag1)
            {
                if (mDeafultWritePathPref != null)
                    mDeafultWritePathPref.setChecked(false);
                StorageManagerEx.setDefaultPath(preference.getKey());
                mDeafultWritePathPref = (RadioButtonPreference)preference;
                flag = true;
            }
        }
        return flag;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (!"cache".equals(preference.getKey())) goto _L2; else goto _L1
_L1:
        ConfirmClearCacheFragment.show(this);
_L4:
        return true;
_L2:
        Iterator iterator = mCategories.iterator();
_L5:
        StorageVolumePreferenceCategory storagevolumepreferencecategory;
        Intent intent;
        if (!iterator.hasNext())
            break MISSING_BLOCK_LABEL_221;
        storagevolumepreferencecategory = (StorageVolumePreferenceCategory)iterator.next();
        intent = storagevolumepreferencecategory.intentForClick(preference);
        if (intent == null)
            break MISSING_BLOCK_LABEL_90;
        if (Utils.isMonkeyRunning()) goto _L4; else goto _L3
_L3:
        startActivity(intent);
        return true;
        ActivityNotFoundException activitynotfoundexception;
        activitynotfoundexception;
        Toast.makeText(getActivity(), 0x7f0b000d, 0).show();
        StorageVolume storagevolume = storagevolumepreferencecategory.getStorageVolume();
        if (storagevolume != null && storagevolumepreferencecategory.mountToggleClicked(preference))
        {
            sLastClickedMountToggle = preference;
            mIsRemovableVolume = storagevolume.isRemovable();
            Log.d("MemorySettings", (new StringBuilder()).append("onPreferenceTreeClick, mIsRemovableVolume is ").append(mIsRemovableVolume).toString());
            sClickedMountPoint = storagevolume.getPath();
            mIsUnmountingUsb = sClickedMountPoint.equals("/mnt/usbotg");
            String s = mStorageManager.getVolumeState(storagevolume.getPath());
            if ("mounted".equals(s) || "mounted_ro".equals(s))
            {
                unmount();
                return true;
            } else
            {
                mount();
                return true;
            }
        }
          goto _L5
        return false;
    }

    public void onPrepareOptionsMenu(Menu menu)
    {
        MenuItem menuitem = menu.findItem(0x7f080272);
        boolean flag;
        if (!isMassStorageEnabled())
            flag = true;
        else
            flag = false;
        menuitem.setVisible(flag);
    }

    public void onResume()
    {
        super.onResume();
        Log.d("MemorySettings", "onResume");
        IntentFilter intentfilter = new IntentFilter("android.intent.action.MEDIA_SCANNER_STARTED");
        intentfilter.addAction("android.intent.action.MEDIA_SCANNER_FINISHED");
        intentfilter.addDataScheme("file");
        getActivity().registerReceiver(mMediaScannerReceiver, intentfilter);
        IntentFilter intentfilter1 = new IntentFilter();
        intentfilter1.addAction("android.hardware.usb.action.USB_STATE");
        getActivity().registerReceiver(mMediaScannerReceiver, intentfilter1);
        dynamicUpdateUnmountDlg();
        Log.d("MemorySettings", "Dynamic Update Install Location in OnResume()");
        dynamicUpdateInstallLocation();
        dynamicUpdateAPKInstaller();
        dynamicShowDefaultWriteCategory();
        for (Iterator iterator = mCategories.iterator(); iterator.hasNext(); ((StorageVolumePreferenceCategory)iterator.next()).onResume());
    }














}
