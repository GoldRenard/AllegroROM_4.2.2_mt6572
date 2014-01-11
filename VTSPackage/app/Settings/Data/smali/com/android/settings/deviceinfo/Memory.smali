.class public Lcom/android/settings/deviceinfo/Memory;
.super Lcom/android/settings/SettingsPreferenceFragment;
.source "Memory.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings/deviceinfo/Memory$ConfirmClearCacheFragment;,
        Lcom/android/settings/deviceinfo/Memory$ClearCacheObserver;
    }
.end annotation


# static fields
.field private static final ACTION_DYNAMIC_SD_SWAP:Ljava/lang/String; = "com.mediatek.SD_SWAP"

.field private static final APP_INSTALL_AUTO:I = 0x0

.field private static final APP_INSTALL_AUTO_ID:Ljava/lang/String; = "auto"

.field private static final APP_INSTALL_DEVICE:I = 0x1

.field private static final APP_INSTALL_DEVICE_ID:Ljava/lang/String; = "device"

.field private static final APP_INSTALL_SDCARD:I = 0x2

.field private static final APP_INSTALL_SDCARD_ID:Ljava/lang/String; = "sdcard"

.field private static final DEFAULT_WRITE_CATEGORY_KEY:Ljava/lang/String; = "memory_select"

.field private static final DLG_CONFIRM_MOUNT:I = 0x3

.field private static final DLG_CONFIRM_UNMOUNT:I = 0x1

.field private static final DLG_ERROR_UNMOUNT:I = 0x2

.field private static final EXTERNAL_STORAGE_PATH:Ljava/lang/String; = "/storage/sdcard1"

.field public static final H_UNMOUNT_ERROR:I = 0xb

.field private static final KEY_APK_INSTALLER:Ljava/lang/String; = "apk_installer"

.field private static final KEY_APP_INSTALL_LOCATION:Ljava/lang/String; = "app_install_location"

.field private static final MESSAGE_DELAY_TIME:I = 0xc8

.field private static final ORDER_PHONE_STORAGE:I = -0x3

.field private static final ORDER_SD_CARD:I = -0x2

.field private static final ORDER_USB_OTG:I = -0x1

.field private static final SD_EXIST:Ljava/lang/String; = "SD_EXIST"

.field private static final SD_INDEX:I = 0x1

.field private static final TAG:Ljava/lang/String; = "MemorySettings"

.field private static final TAG_CONFIRM_CLEAR_CACHE:Ljava/lang/String; = "confirmClearCache"

.field private static final USB_STORAGE_PATH:Ljava/lang/String; = "/mnt/usbotg"

.field private static sClickedMountPoint:Ljava/lang/String;

.field private static sLastClickedMountToggle:Landroid/preference/Preference;


# instance fields
.field private mApkInstallePref:Landroid/preference/Preference;

.field private mCategories:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;",
            ">;"
        }
    .end annotation
.end field

.field private mDeafultWritePathPref:Lcom/android/settings/deviceinfo/RadioButtonPreference;

.field private mDefaultWriteCategory:Landroid/preference/PreferenceCategory;

.field private mDefaultWriteDiskCategoryIsPresent:Z

.field private mDefaultWritePath:Ljava/lang/String;

.field private mDefaultWritePathAdded:[Z

.field mDynSwapReceiver:Landroid/content/BroadcastReceiver;

.field private mInstallLocation:Landroid/preference/ListPreference;

.field private mIsApkInstallerExist:Z

.field private mIsInstLocSupport:Z

.field private mIsRemovableVolume:Z

.field private mIsUnmountingUsb:Z

.field private final mMediaScannerReceiver:Landroid/content/BroadcastReceiver;

.field private mMountService:Landroid/os/storage/IMountService;

.field private mResources:Landroid/content/res/Resources;

.field mStorageListener:Landroid/os/storage/StorageEventListener;

.field private mStorageManager:Landroid/os/storage/StorageManager;

.field private mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

.field private mUiHandler:Landroid/os/Handler;

.field private mUnMountErrorHandler:Landroid/os/Handler;

.field private final mUpdateRunnable:Ljava/lang/Runnable;

.field private mUsbManager:Landroid/hardware/usb/UsbManager;

.field private mVolumePrefCategory:Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 71
    invoke-direct {p0}, Lcom/android/settings/SettingsPreferenceFragment;-><init>()V

    .line 94
    iput-boolean v1, p0, Lcom/android/settings/deviceinfo/Memory;->mIsUnmountingUsb:Z

    .line 103
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mCategories:Ljava/util/ArrayList;

    .line 143
    new-instance v0, Lcom/android/settings/deviceinfo/Memory$1;

    invoke-direct {v0, p0}, Lcom/android/settings/deviceinfo/Memory$1;-><init>(Lcom/android/settings/deviceinfo/Memory;)V

    iput-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mDynSwapReceiver:Landroid/content/BroadcastReceiver;

    .line 176
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWriteDiskCategoryIsPresent:Z

    .line 177
    iput-boolean v1, p0, Lcom/android/settings/deviceinfo/Memory;->mIsApkInstallerExist:Z

    .line 178
    iput-boolean v1, p0, Lcom/android/settings/deviceinfo/Memory;->mIsInstLocSupport:Z

    .line 269
    new-instance v0, Lcom/android/settings/deviceinfo/Memory$2;

    invoke-direct {v0, p0}, Lcom/android/settings/deviceinfo/Memory$2;-><init>(Lcom/android/settings/deviceinfo/Memory;)V

    iput-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mUnMountErrorHandler:Landroid/os/Handler;

    .line 341
    new-instance v0, Lcom/android/settings/deviceinfo/Memory$3;

    invoke-direct {v0, p0}, Lcom/android/settings/deviceinfo/Memory$3;-><init>(Lcom/android/settings/deviceinfo/Memory;)V

    iput-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageListener:Landroid/os/storage/StorageEventListener;

    .line 478
    new-instance v0, Lcom/android/settings/deviceinfo/Memory$4;

    invoke-direct {v0, p0}, Lcom/android/settings/deviceinfo/Memory$4;-><init>(Lcom/android/settings/deviceinfo/Memory;)V

    iput-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mMediaScannerReceiver:Landroid/content/BroadcastReceiver;

    .line 727
    new-instance v0, Lcom/android/settings/deviceinfo/Memory$9;

    invoke-direct {v0, p0}, Lcom/android/settings/deviceinfo/Memory$9;-><init>(Lcom/android/settings/deviceinfo/Memory;)V

    iput-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mUpdateRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/android/settings/deviceinfo/Memory;)Landroid/os/storage/StorageManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 71
    iget-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageManager:Landroid/os/storage/StorageManager;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/settings/deviceinfo/Memory;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 71
    iget-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mCategories:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/android/settings/deviceinfo/Memory;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/android/settings/deviceinfo/Memory;->doMount()V

    return-void
.end method

.method static synthetic access$1100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 71
    sget-object v0, Lcom/android/settings/deviceinfo/Memory;->sClickedMountPoint:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/android/settings/deviceinfo/Memory;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 71
    iget-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mUnMountErrorHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/android/settings/deviceinfo/Memory;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/android/settings/deviceinfo/Memory;->onCacheCleared()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/settings/deviceinfo/Memory;)[Lcom/android/settings/deviceinfo/RadioButtonPreference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 71
    iget-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/settings/deviceinfo/Memory;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/android/settings/deviceinfo/Memory;->dynamicShowDefaultWriteCategory()V

    return-void
.end method

.method static synthetic access$400(Lcom/android/settings/deviceinfo/Memory;Landroid/content/Intent;[Landroid/os/storage/StorageVolume;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 71
    invoke-direct {p0, p1, p2}, Lcom/android/settings/deviceinfo/Memory;->resetInstallLocation(Landroid/content/Intent;[Landroid/os/storage/StorageVolume;)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/settings/deviceinfo/Memory;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lcom/android/settings/deviceinfo/Memory;->showDialogInner(I)V

    return-void
.end method

.method static synthetic access$600(Lcom/android/settings/deviceinfo/Memory;)Ljava/lang/Runnable;
    .locals 1
    .parameter "x0"

    .prologue
    .line 71
    iget-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mUpdateRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/settings/deviceinfo/Memory;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 71
    iget-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mUiHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/settings/deviceinfo/Memory;)Landroid/hardware/usb/UsbManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 71
    iget-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mUsbManager:Landroid/hardware/usb/UsbManager;

    return-object v0
.end method

.method static synthetic access$900(Lcom/android/settings/deviceinfo/Memory;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/android/settings/deviceinfo/Memory;->doUnmount()V

    return-void
.end method

.method private addCategory(Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;)V
    .locals 1
    .parameter "category"

    .prologue
    .line 282
    iget-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 283
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 284
    invoke-virtual {p1}, Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;->init()V

    .line 285
    return-void
.end method

.method private doMount()V
    .locals 2

    .prologue
    .line 627
    invoke-direct {p0}, Lcom/android/settings/deviceinfo/Memory;->getMountService()Landroid/os/storage/IMountService;

    move-result-object v0

    .line 628
    .local v0, mountService:Landroid/os/storage/IMountService;
    new-instance v1, Lcom/android/settings/deviceinfo/Memory$8;

    invoke-direct {v1, p0, v0}, Lcom/android/settings/deviceinfo/Memory$8;-><init>(Lcom/android/settings/deviceinfo/Memory;Landroid/os/storage/IMountService;)V

    invoke-virtual {v1}, Lcom/android/settings/deviceinfo/Memory$8;->start()V

    .line 645
    return-void
.end method

.method private doUnmount()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 543
    iget-boolean v1, p0, Lcom/android/settings/deviceinfo/Memory;->mIsUnmountingUsb:Z

    if-eqz v1, :cond_0

    .line 544
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f0b0012

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 550
    :goto_0
    invoke-direct {p0}, Lcom/android/settings/deviceinfo/Memory;->getMountService()Landroid/os/storage/IMountService;

    move-result-object v0

    .line 552
    .local v0, mountService:Landroid/os/storage/IMountService;
    sget-object v1, Lcom/android/settings/deviceinfo/Memory;->sLastClickedMountToggle:Landroid/preference/Preference;

    invoke-virtual {v1, v3}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 553
    sget-object v1, Lcom/android/settings/deviceinfo/Memory;->sLastClickedMountToggle:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/android/settings/deviceinfo/Memory;->mResources:Landroid/content/res/Resources;

    const v3, 0x7f0b057d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 555
    sget-object v1, Lcom/android/settings/deviceinfo/Memory;->sLastClickedMountToggle:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/android/settings/deviceinfo/Memory;->mResources:Landroid/content/res/Resources;

    const v3, 0x7f0b057e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 558
    new-instance v1, Lcom/android/settings/deviceinfo/Memory$7;

    invoke-direct {v1, p0, v0}, Lcom/android/settings/deviceinfo/Memory$7;-><init>(Lcom/android/settings/deviceinfo/Memory;Landroid/os/storage/IMountService;)V

    invoke-virtual {v1}, Lcom/android/settings/deviceinfo/Memory$7;->start()V

    .line 571
    return-void

    .line 547
    .end local v0           #mountService:Landroid/os/storage/IMountService;
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f0b057c

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method private dynamicShowDefaultWriteCategory()V
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 734
    const-string v5, "MemorySettings"

    const-string v6, "dynamicShowDefaultWriteCategory()"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 735
    invoke-static {}, Lcom/mediatek/storage/StorageManagerEx;->getExternalStoragePath()Ljava/lang/String;

    move-result-object v0

    .line 736
    .local v0, externalStoragePath:Ljava/lang/String;
    const-string v5, "MemorySettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "external storage path= "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 738
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    array-length v5, v5

    if-ge v1, v5, :cond_4

    .line 739
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    aget-object v5, v5, v1

    invoke-virtual {v5}, Lcom/android/settings/deviceinfo/RadioButtonPreference;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 740
    .local v4, writePath:Ljava/lang/String;
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v5, v4}, Landroid/os/storage/StorageManager;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 741
    .local v3, volumeState:Ljava/lang/String;
    const-string v5, "MemorySettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Path "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " volume state is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 744
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 745
    const-string v5, "MemorySettings"

    const-string v6, "set the pref sd card order"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 746
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    aget-object v5, v5, v1

    const/4 v6, -0x2

    invoke-virtual {v5, v6}, Lcom/android/settings/deviceinfo/RadioButtonPreference;->setOrder(I)V

    .line 755
    :goto_1
    const-string v5, "mounted"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 756
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWritePathAdded:[Z

    aget-boolean v5, v5, v1

    if-nez v5, :cond_0

    .line 757
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWriteCategory:Landroid/preference/PreferenceCategory;

    iget-object v6, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    aget-object v6, v6, v1

    invoke-virtual {v5, v6}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 759
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWritePathAdded:[Z

    aput-boolean v9, v5, v1

    .line 738
    :cond_0
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 747
    :cond_1
    const-string v5, "/mnt/usbotg"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 748
    const-string v5, "MemorySettings"

    const-string v6, "set the pref usb otg order"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 749
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    aget-object v5, v5, v1

    const/4 v6, -0x1

    invoke-virtual {v5, v6}, Lcom/android/settings/deviceinfo/RadioButtonPreference;->setOrder(I)V

    goto :goto_1

    .line 751
    :cond_2
    const-string v5, "MemorySettings"

    const-string v6, "set the pref phone storage order"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 752
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    aget-object v5, v5, v1

    const/4 v6, -0x3

    invoke-virtual {v5, v6}, Lcom/android/settings/deviceinfo/RadioButtonPreference;->setOrder(I)V

    goto :goto_1

    .line 762
    :cond_3
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWritePathAdded:[Z

    aget-boolean v5, v5, v1

    if-eqz v5, :cond_0

    .line 763
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    aget-object v5, v5, v1

    invoke-virtual {v5, v8}, Lcom/android/settings/deviceinfo/RadioButtonPreference;->setChecked(Z)Z

    .line 764
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWriteCategory:Landroid/preference/PreferenceCategory;

    iget-object v6, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    aget-object v6, v6, v1

    invoke-virtual {v5, v6}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 766
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWritePathAdded:[Z

    aput-boolean v8, v5, v1

    goto :goto_2

    .line 770
    .end local v3           #volumeState:Ljava/lang/String;
    .end local v4           #writePath:Ljava/lang/String;
    :cond_4
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWriteCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v5}, Landroid/preference/PreferenceCategory;->getPreferenceCount()I

    move-result v2

    .line 771
    .local v2, numberOfWriteDisk:I
    const-string v5, "MemorySettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "numberOfWriteDisk : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 772
    iget-boolean v5, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWriteDiskCategoryIsPresent:Z

    if-eqz v5, :cond_6

    if-nez v2, :cond_6

    .line 773
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v5

    iget-object v6, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWriteCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v5, v6}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 774
    iput-boolean v8, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWriteDiskCategoryIsPresent:Z

    .line 780
    :cond_5
    :goto_3
    invoke-static {}, Lcom/mediatek/storage/StorageManagerEx;->getDefaultPath()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWritePath:Ljava/lang/String;

    .line 781
    const-string v5, "MemorySettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "get default path"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWritePath:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 782
    const/4 v1, 0x0

    :goto_4
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    array-length v5, v5

    if-ge v1, v5, :cond_8

    .line 783
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    aget-object v5, v5, v1

    invoke-virtual {v5}, Lcom/android/settings/deviceinfo/RadioButtonPreference;->getPath()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWritePath:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 784
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    aget-object v5, v5, v1

    invoke-virtual {v5, v9}, Lcom/android/settings/deviceinfo/RadioButtonPreference;->setChecked(Z)Z

    .line 785
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    aget-object v5, v5, v1

    iput-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mDeafultWritePathPref:Lcom/android/settings/deviceinfo/RadioButtonPreference;

    .line 782
    :goto_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 775
    :cond_6
    iget-boolean v5, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWriteDiskCategoryIsPresent:Z

    if-nez v5, :cond_5

    if-lez v2, :cond_5

    .line 776
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v5

    iget-object v6, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWriteCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v5, v6}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 777
    iput-boolean v9, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWriteDiskCategoryIsPresent:Z

    goto :goto_3

    .line 787
    :cond_7
    iget-object v5, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    aget-object v5, v5, v1

    invoke-virtual {v5, v8}, Lcom/android/settings/deviceinfo/RadioButtonPreference;->setChecked(Z)Z

    goto :goto_5

    .line 790
    :cond_8
    return-void
.end method

.method private dynamicUpdateUnmountDlg()V
    .locals 6

    .prologue
    .line 326
    const-string v3, "MemorySettings"

    const-string v4, "dynamicUpdateUnmountDlg()"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v3, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    array-length v3, v3

    if-ge v0, v3, :cond_1

    .line 329
    iget-object v3, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    aget-object v3, v3, v0

    invoke-virtual {v3}, Lcom/android/settings/deviceinfo/RadioButtonPreference;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 330
    .local v2, writePath:Ljava/lang/String;
    iget-object v3, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v3, v2}, Landroid/os/storage/StorageManager;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 331
    .local v1, volumeState:Ljava/lang/String;
    const-string v3, "MemorySettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Path "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " volume state is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    const-string v3, "shared"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 333
    const-string v3, "MemorySettings"

    const-string v4, "current status is UMS"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 334
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/android/settings/deviceinfo/Memory;->removeDialog(I)V

    .line 339
    .end local v1           #volumeState:Ljava/lang/String;
    .end local v2           #writePath:Ljava/lang/String;
    :goto_1
    return-void

    .line 328
    .restart local v1       #volumeState:Ljava/lang/String;
    .restart local v2       #writePath:Ljava/lang/String;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 338
    .end local v1           #volumeState:Ljava/lang/String;
    .end local v2           #writePath:Ljava/lang/String;
    :cond_1
    const-string v3, "MemorySettings"

    const-string v4, "current status is MTP"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private getAppInstallLocation()Ljava/lang/String;
    .locals 4

    .prologue
    .line 869
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "default_install_location"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 871
    .local v0, selectedLocation:I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 872
    const-string v1, "device"

    .line 879
    :goto_0
    return-object v1

    .line 873
    :cond_0
    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 874
    const-string v1, "sdcard"

    goto :goto_0

    .line 875
    :cond_1
    if-nez v0, :cond_2

    .line 876
    const-string v1, "auto"

    goto :goto_0

    .line 879
    :cond_2
    const-string v1, "auto"

    goto :goto_0
.end method

.method private declared-synchronized getMountService()Landroid/os/storage/IMountService;
    .locals 3

    .prologue
    .line 423
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/settings/deviceinfo/Memory;->mMountService:Landroid/os/storage/IMountService;

    if-nez v1, :cond_0

    .line 424
    const-string v1, "mount"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 425
    .local v0, service:Landroid/os/IBinder;
    if-eqz v0, :cond_1

    .line 426
    invoke-static {v0}, Landroid/os/storage/IMountService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/storage/IMountService;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/deviceinfo/Memory;->mMountService:Landroid/os/storage/IMountService;

    .line 431
    .end local v0           #service:Landroid/os/IBinder;
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/android/settings/deviceinfo/Memory;->mMountService:Landroid/os/storage/IMountService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v1

    .line 428
    .restart local v0       #service:Landroid/os/IBinder;
    :cond_1
    :try_start_1
    const-string v1, "MemorySettings"

    const-string v2, "Can\'t get mount service"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 423
    .end local v0           #service:Landroid/os/IBinder;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private hasAppsAccessingStorage()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 579
    invoke-direct {p0}, Lcom/android/settings/deviceinfo/Memory;->getMountService()Landroid/os/storage/IMountService;

    move-result-object v0

    .line 580
    .local v0, mountService:Landroid/os/storage/IMountService;
    sget-object v2, Lcom/android/settings/deviceinfo/Memory;->sClickedMountPoint:Ljava/lang/String;

    invoke-interface {v0, v2}, Landroid/os/storage/IMountService;->getStorageUsers(Ljava/lang/String;)[I

    move-result-object v1

    .line 581
    .local v1, stUsers:[I
    if-eqz v1, :cond_0

    array-length v2, v1

    if-lez v2, :cond_0

    .line 595
    :cond_0
    return v3
.end method

.method private initApkInstallerPreference()V
    .locals 3

    .prologue
    .line 796
    const-string v1, "com.mediatek.apkinstaller"

    invoke-direct {p0, v1}, Lcom/android/settings/deviceinfo/Memory;->isPkgInstalled(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/settings/deviceinfo/Memory;->mIsApkInstallerExist:Z

    .line 797
    iget-boolean v1, p0, Lcom/android/settings/deviceinfo/Memory;->mIsApkInstallerExist:Z

    if-eqz v1, :cond_0

    .line 798
    const-string v1, "apk_installer"

    invoke-virtual {p0, v1}, Lcom/android/settings/deviceinfo/Memory;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/deviceinfo/Memory;->mApkInstallePref:Landroid/preference/Preference;

    .line 799
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 800
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "com.mediatek.apkinstaller"

    const-string v2, "com.mediatek.apkinstaller.APKInstaller"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 802
    const/high16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 803
    iget-object v1, p0, Lcom/android/settings/deviceinfo/Memory;->mApkInstallePref:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setIntent(Landroid/content/Intent;)V

    .line 808
    .end local v0           #intent:Landroid/content/Intent;
    :goto_0
    return-void

    .line 805
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    const-string v2, "apk_installer"

    invoke-virtual {p0, v2}, Lcom/android/settings/deviceinfo/Memory;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_0
.end method

.method private initInstallLocationPreference([Landroid/os/storage/StorageVolume;)V
    .locals 7
    .parameter "volumes"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 887
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "set_install_location"

    invoke-static {v5, v6, v3}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v5

    if-eqz v5, :cond_0

    move v3, v4

    :cond_0
    iput-boolean v3, p0, Lcom/android/settings/deviceinfo/Memory;->mIsInstLocSupport:Z

    .line 889
    iget-boolean v3, p0, Lcom/android/settings/deviceinfo/Memory;->mIsInstLocSupport:Z

    if-eqz v3, :cond_3

    .line 890
    const-string v3, "app_install_location"

    invoke-virtual {p0, v3}, Lcom/android/settings/deviceinfo/Memory;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/ListPreference;

    iput-object v3, p0, Lcom/android/settings/deviceinfo/Memory;->mInstallLocation:Landroid/preference/ListPreference;

    .line 891
    const-string v2, ""

    .line 892
    .local v2, whereStr:Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, p1

    if-ge v1, v3, :cond_1

    .line 893
    aget-object v3, p1, v1

    invoke-virtual {v3}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Landroid/os/Environment;->getLegacyExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 895
    aget-object v3, p1, v1

    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/os/storage/StorageVolume;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 899
    :cond_1
    iget-object v3, p0, Lcom/android/settings/deviceinfo/Memory;->mInstallLocation:Landroid/preference/ListPreference;

    invoke-virtual {v3}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v0

    .line 900
    .local v0, entries:[Ljava/lang/CharSequence;
    aput-object v2, v0, v4

    .line 901
    iget-object v3, p0, Lcom/android/settings/deviceinfo/Memory;->mInstallLocation:Landroid/preference/ListPreference;

    invoke-virtual {v3, v0}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 902
    iget-object v3, p0, Lcom/android/settings/deviceinfo/Memory;->mInstallLocation:Landroid/preference/ListPreference;

    invoke-direct {p0}, Lcom/android/settings/deviceinfo/Memory;->getAppInstallLocation()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 903
    iget-object v3, p0, Lcom/android/settings/deviceinfo/Memory;->mInstallLocation:Landroid/preference/ListPreference;

    new-instance v4, Lcom/android/settings/deviceinfo/Memory$10;

    invoke-direct {v4, p0}, Lcom/android/settings/deviceinfo/Memory$10;-><init>(Lcom/android/settings/deviceinfo/Memory;)V

    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 916
    .end local v0           #entries:[Ljava/lang/CharSequence;
    .end local v1           #i:I
    .end local v2           #whereStr:Ljava/lang/String;
    :goto_1
    return-void

    .line 892
    .restart local v1       #i:I
    .restart local v2       #whereStr:Ljava/lang/String;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 913
    .end local v1           #i:I
    .end local v2           #whereStr:Ljava/lang/String;
    :cond_3
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    const-string v4, "app_install_location"

    invoke-virtual {p0, v4}, Lcom/android/settings/deviceinfo/Memory;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_1
.end method

.method private isMassStorageEnabled()Z
    .locals 3

    .prologue
    .line 289
    iget-object v2, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v2}, Landroid/os/storage/StorageManager;->getVolumeList()[Landroid/os/storage/StorageVolume;

    move-result-object v1

    .line 290
    .local v1, volumes:[Landroid/os/storage/StorageVolume;
    invoke-static {v1}, Landroid/os/storage/StorageManager;->getPrimaryVolume([Landroid/os/storage/StorageVolume;)Landroid/os/storage/StorageVolume;

    move-result-object v0

    .line 291
    .local v0, primary:Landroid/os/storage/StorageVolume;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/os/storage/StorageVolume;->allowMassStorage()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private isPkgInstalled(Ljava/lang/String;)Z
    .locals 5
    .parameter "packageName"

    .prologue
    const/4 v2, 0x0

    .line 832
    if-eqz p1, :cond_0

    .line 833
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 835
    .local v1, pm:Landroid/content/pm/PackageManager;
    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {v1, p1, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 845
    const/4 v2, 0x1

    .end local v1           #pm:Landroid/content/pm/PackageManager;
    :goto_0
    return v2

    .line 836
    .restart local v1       #pm:Landroid/content/pm/PackageManager;
    :catch_0
    move-exception v0

    .line 837
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 841
    .end local v0           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v1           #pm:Landroid/content/pm/PackageManager;
    :cond_0
    const-string v3, "MemorySettings"

    const-string v4, "the package name cannot be null!!"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private mount()V
    .locals 0

    .prologue
    .line 622
    invoke-direct {p0}, Lcom/android/settings/deviceinfo/Memory;->doMount()V

    .line 624
    return-void
.end method

.method private onCacheCleared()V
    .locals 3

    .prologue
    .line 648
    iget-object v2, p0, Lcom/android/settings/deviceinfo/Memory;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;

    .line 649
    .local v0, category:Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;
    invoke-virtual {v0}, Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;->onCacheCleared()V

    goto :goto_0

    .line 651
    .end local v0           #category:Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;
    :cond_0
    return-void
.end method

.method private resetInstallLocation(Landroid/content/Intent;[Landroid/os/storage/StorageVolume;)V
    .locals 6
    .parameter "intent"
    .parameter "newVolumes"

    .prologue
    .line 923
    iget-boolean v4, p0, Lcom/android/settings/deviceinfo/Memory;->mIsInstLocSupport:Z

    if-nez v4, :cond_1

    .line 947
    :cond_0
    :goto_0
    return-void

    .line 925
    :cond_1
    const-string v4, "MemorySettings"

    const-string v5, "resetInstallLocation()"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 927
    const-string v4, "SD_EXIST"

    const/4 v5, 0x0

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    .line 928
    .local v2, isExternalSD:Z
    iget-object v4, p0, Lcom/android/settings/deviceinfo/Memory;->mInstallLocation:Landroid/preference/ListPreference;

    invoke-virtual {v4, v2}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 931
    if-eqz v2, :cond_0

    .line 933
    const-string v3, ""

    .line 934
    .local v3, sdDescription:Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v4, p2

    if-ge v1, v4, :cond_2

    .line 935
    aget-object v4, p2, v1

    invoke-virtual {v4}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Landroid/os/Environment;->getLegacyExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 938
    aget-object v4, p2, v1

    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/os/storage/StorageVolume;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 943
    :cond_2
    iget-object v4, p0, Lcom/android/settings/deviceinfo/Memory;->mInstallLocation:Landroid/preference/ListPreference;

    invoke-virtual {v4}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v0

    .line 944
    .local v0, entries:[Ljava/lang/CharSequence;
    const/4 v4, 0x1

    aput-object v3, v0, v4

    .line 945
    iget-object v4, p0, Lcom/android/settings/deviceinfo/Memory;->mInstallLocation:Landroid/preference/ListPreference;

    invoke-virtual {v4, v0}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 934
    .end local v0           #entries:[Ljava/lang/CharSequence;
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private showDialogInner(I)V
    .locals 0
    .parameter "id"

    .prologue
    .line 574
    invoke-virtual {p0, p1}, Lcom/android/settings/deviceinfo/Memory;->removeDialog(I)V

    .line 575
    invoke-virtual {p0, p1}, Lcom/android/settings/deviceinfo/Memory;->showDialog(I)V

    .line 576
    return-void
.end method

.method private unmount()V
    .locals 3

    .prologue
    .line 601
    :try_start_0
    invoke-direct {p0}, Lcom/android/settings/deviceinfo/Memory;->hasAppsAccessingStorage()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 603
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/android/settings/deviceinfo/Memory;->showDialogInner(I)V

    .line 612
    :goto_0
    return-void

    .line 605
    :cond_0
    invoke-direct {p0}, Lcom/android/settings/deviceinfo/Memory;->doUnmount()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 607
    :catch_0
    move-exception v0

    .line 609
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "MemorySettings"

    const-string v2, "Is MountService running?"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 610
    const/4 v1, 0x2

    invoke-direct {p0, v1}, Lcom/android/settings/deviceinfo/Memory;->showDialogInner(I)V

    goto :goto_0
.end method


# virtual methods
.method public dynamicUpdateAPKInstaller()V
    .locals 7

    .prologue
    .line 814
    iget-boolean v4, p0, Lcom/android/settings/deviceinfo/Memory;->mIsApkInstallerExist:Z

    if-nez v4, :cond_0

    .line 826
    :goto_0
    return-void

    .line 816
    :cond_0
    const/4 v0, 0x0

    .line 817
    .local v0, flag:Z
    const-string v4, "MemorySettings"

    const-string v5, "dynamicUpdateAPKInstaller()"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 818
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    iget-object v4, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    array-length v4, v4

    if-ge v1, v4, :cond_3

    .line 819
    iget-object v4, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    aget-object v4, v4, v1

    invoke-virtual {v4}, Lcom/android/settings/deviceinfo/RadioButtonPreference;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 820
    .local v3, writePath:Ljava/lang/String;
    iget-object v4, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v4, v3}, Landroid/os/storage/StorageManager;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 821
    .local v2, volumeState:Ljava/lang/String;
    const-string v4, "MemorySettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Path "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " volume state is "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 822
    if-nez v0, :cond_1

    const-string v4, "mounted"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    :cond_1
    const/4 v0, 0x1

    .line 818
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 822
    :cond_2
    const/4 v0, 0x0

    goto :goto_2

    .line 825
    .end local v2           #volumeState:Ljava/lang/String;
    .end local v3           #writePath:Ljava/lang/String;
    :cond_3
    iget-object v4, p0, Lcom/android/settings/deviceinfo/Memory;->mApkInstallePref:Landroid/preference/Preference;

    invoke-virtual {v4, v0}, Landroid/preference/Preference;->setEnabled(Z)V

    goto :goto_0
.end method

.method public dynamicUpdateInstallLocation()V
    .locals 6

    .prologue
    .line 953
    iget-boolean v3, p0, Lcom/android/settings/deviceinfo/Memory;->mIsInstLocSupport:Z

    if-nez v3, :cond_0

    .line 978
    :goto_0
    return-void

    .line 955
    :cond_0
    const-string v3, "MemorySettings"

    const-string v4, "dynamicUpdateInstallLocation()"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 956
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget-object v3, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    array-length v3, v3

    if-ge v0, v3, :cond_2

    .line 957
    iget-object v3, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    aget-object v3, v3, v0

    invoke-virtual {v3}, Lcom/android/settings/deviceinfo/RadioButtonPreference;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 958
    .local v2, writePath:Ljava/lang/String;
    iget-object v3, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v3, v2}, Landroid/os/storage/StorageManager;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 959
    .local v1, volumeState:Ljava/lang/String;
    const-string v3, "MemorySettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Path "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " volume state is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 961
    const-string v3, "shared"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 962
    const-string v3, "MemorySettings"

    const-string v4, "current status is UMS"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 963
    iget-object v3, p0, Lcom/android/settings/deviceinfo/Memory;->mInstallLocation:Landroid/preference/ListPreference;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setEnabled(Z)V

    goto :goto_0

    .line 956
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 967
    .end local v1           #volumeState:Ljava/lang/String;
    .end local v2           #writePath:Ljava/lang/String;
    :cond_2
    const-string v3, "MemorySettings"

    const-string v4, "current status is not UMS"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 968
    iget-object v3, p0, Lcom/android/settings/deviceinfo/Memory;->mInstallLocation:Landroid/preference/ListPreference;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setEnabled(Z)V

    goto :goto_0
.end method

.method protected handleUpdateAppInstallLocation(Ljava/lang/String;)V
    .locals 3
    .parameter "value"

    .prologue
    const/4 v2, 0x0

    .line 849
    const-string v0, "device"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 850
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "default_install_location"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 865
    :goto_0
    iget-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mInstallLocation:Landroid/preference/ListPreference;

    invoke-virtual {v0, p1}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 866
    return-void

    .line 853
    :cond_0
    const-string v0, "sdcard"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 854
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "default_install_location"

    const/4 v2, 0x2

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_0

    .line 857
    :cond_1
    const-string v0, "auto"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 858
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "default_install_location"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_0

    .line 862
    :cond_2
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "default_install_location"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 12
    .parameter "icicle"

    .prologue
    .line 183
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 185
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 187
    .local v0, context:Landroid/content/Context;
    const-string v8, "usb"

    invoke-virtual {p0, v8}, Lcom/android/settings/deviceinfo/Memory;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/hardware/usb/UsbManager;

    iput-object v8, p0, Lcom/android/settings/deviceinfo/Memory;->mUsbManager:Landroid/hardware/usb/UsbManager;

    .line 189
    invoke-static {v0}, Landroid/os/storage/StorageManager;->from(Landroid/content/Context;)Landroid/os/storage/StorageManager;

    move-result-object v8

    iput-object v8, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageManager:Landroid/os/storage/StorageManager;

    .line 190
    iget-object v8, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageManager:Landroid/os/storage/StorageManager;

    iget-object v9, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageListener:Landroid/os/storage/StorageEventListener;

    invoke-virtual {v8, v9}, Landroid/os/storage/StorageManager;->registerListener(Landroid/os/storage/StorageEventListener;)V

    .line 192
    const v8, 0x7f050010

    invoke-virtual {p0, v8}, Lcom/android/settings/deviceinfo/Memory;->addPreferencesFromResource(I)V

    .line 194
    new-instance v8, Landroid/os/Handler;

    invoke-direct {v8}, Landroid/os/Handler;-><init>()V

    iput-object v8, p0, Lcom/android/settings/deviceinfo/Memory;->mUiHandler:Landroid/os/Handler;

    .line 196
    const-string v8, "memory_select"

    invoke-virtual {p0, v8}, Lcom/android/settings/deviceinfo/Memory;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v8

    check-cast v8, Landroid/preference/PreferenceCategory;

    iput-object v8, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWriteCategory:Landroid/preference/PreferenceCategory;

    .line 197
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    iput-object v8, p0, Lcom/android/settings/deviceinfo/Memory;->mResources:Landroid/content/res/Resources;

    .line 200
    const-string v8, "MemorySettings"

    const-string v9, "not sd + swap, add internal storage"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    invoke-static {v0}, Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;->buildForInternal(Landroid/content/Context;)Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/settings/deviceinfo/Memory;->addCategory(Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;)V

    .line 205
    iget-object v8, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v8}, Landroid/os/storage/StorageManager;->getVolumePaths()[Ljava/lang/String;

    move-result-object v3

    .line 206
    .local v3, mPathList:[Ljava/lang/String;
    iget-object v8, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v8}, Landroid/os/storage/StorageManager;->getVolumeList()[Landroid/os/storage/StorageVolume;

    move-result-object v7

    .line 210
    .local v7, volumes:[Landroid/os/storage/StorageVolume;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 211
    .local v4, mVolumePathList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 213
    .local v5, storageVolumes:Ljava/util/List;,"Ljava/util/List<Landroid/os/storage/StorageVolume;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v8, v3

    if-ge v1, v8, :cond_1

    .line 214
    const-string v8, "MemorySettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Volume: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v7, v1

    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getActivity()Landroid/app/Activity;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/os/storage/StorageVolume;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " ,state is: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageManager:Landroid/os/storage/StorageManager;

    aget-object v11, v3, v1

    invoke-virtual {v10, v11}, Landroid/os/storage/StorageManager;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " ,emulated is: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v7, v1

    invoke-virtual {v10}, Landroid/os/storage/StorageVolume;->isEmulated()Z

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", path is "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v7, v1

    invoke-virtual {v10}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    const-string v8, "not_present"

    iget-object v9, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageManager:Landroid/os/storage/StorageManager;

    aget-object v10, v3, v1

    invoke-virtual {v9, v10}, Landroid/os/storage/StorageManager;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 219
    aget-object v8, v3, v1

    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 220
    aget-object v8, v7, v1

    invoke-interface {v5, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 213
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 224
    :cond_1
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v2

    .line 225
    .local v2, length:I
    const-string v8, "MemorySettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "default path group length = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    new-array v8, v2, [Lcom/android/settings/deviceinfo/RadioButtonPreference;

    iput-object v8, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    .line 228
    new-array v8, v2, [Z

    iput-object v8, p0, Lcom/android/settings/deviceinfo/Memory;->mDefaultWritePathAdded:[Z

    .line 230
    const/4 v1, 0x0

    :goto_1
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-ge v1, v8, :cond_3

    .line 231
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/os/storage/StorageVolume;

    .line 232
    .local v6, volume:Landroid/os/storage/StorageVolume;
    iget-object v8, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    new-instance v9, Lcom/android/settings/deviceinfo/RadioButtonPreference;

    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/android/settings/deviceinfo/RadioButtonPreference;-><init>(Landroid/content/Context;)V

    aput-object v9, v8, v1

    .line 233
    iget-object v8, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    aget-object v9, v8, v1

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Lcom/android/settings/deviceinfo/RadioButtonPreference;->setKey(Ljava/lang/String;)V

    .line 234
    iget-object v8, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    aget-object v8, v8, v1

    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-virtual {v6, v9}, Landroid/os/storage/StorageVolume;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/android/settings/deviceinfo/RadioButtonPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 236
    iget-object v8, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    aget-object v9, v8, v1

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Lcom/android/settings/deviceinfo/RadioButtonPreference;->setPath(Ljava/lang/String;)V

    .line 237
    iget-object v8, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    aget-object v8, v8, v1

    invoke-virtual {v8, p0}, Lcom/android/settings/deviceinfo/RadioButtonPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 243
    invoke-virtual {v6}, Landroid/os/storage/StorageVolume;->isEmulated()Z

    move-result v8

    if-nez v8, :cond_2

    .line 244
    const-string v8, "MemorySettings"

    const-string v9, "no share + swap, add non-emulated category"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    invoke-static {v0, v6}, Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;->buildForPhysical(Landroid/content/Context;Landroid/os/storage/StorageVolume;)Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/settings/deviceinfo/Memory;->addCategory(Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;)V

    .line 230
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 250
    .end local v6           #volume:Landroid/os/storage/StorageVolume;
    :cond_3
    const/4 v8, 0x1

    invoke-virtual {p0, v8}, Lcom/android/settings/deviceinfo/Memory;->setHasOptionsMenu(Z)V

    .line 253
    invoke-direct {p0}, Lcom/android/settings/deviceinfo/Memory;->initApkInstallerPreference()V

    .line 256
    invoke-direct {p0, v7}, Lcom/android/settings/deviceinfo/Memory;->initInstallLocationPreference([Landroid/os/storage/StorageVolume;)V

    .line 264
    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 5
    .parameter "id"

    .prologue
    const v4, 0x7f0b034b

    const v3, 0x7f0b066b

    const/4 v1, 0x0

    .line 498
    packed-switch p1, :pswitch_data_0

    move-object v0, v1

    .line 538
    :goto_0
    return-object v0

    .line 500
    :pswitch_0
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-boolean v0, p0, Lcom/android/settings/deviceinfo/Memory;->mIsUnmountingUsb:Z

    if-eqz v0, :cond_0

    const v0, 0x7f0b000e

    :goto_1
    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v2, Lcom/android/settings/deviceinfo/Memory$5;

    invoke-direct {v2, p0}, Lcom/android/settings/deviceinfo/Memory$5;-><init>(Lcom/android/settings/deviceinfo/Memory;)V

    invoke-virtual {v0, v3, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v4, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-boolean v0, p0, Lcom/android/settings/deviceinfo/Memory;->mIsUnmountingUsb:Z

    if-eqz v0, :cond_1

    const v0, 0x7f0b000f

    :goto_2
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto :goto_0

    :cond_0
    const v0, 0x7f0b0578

    goto :goto_1

    :cond_1
    const v0, 0x7f0b0579

    goto :goto_2

    .line 517
    :pswitch_1
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-boolean v0, p0, Lcom/android/settings/deviceinfo/Memory;->mIsUnmountingUsb:Z

    if-eqz v0, :cond_2

    const v0, 0x7f0b0010

    :goto_3
    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v3, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-boolean v0, p0, Lcom/android/settings/deviceinfo/Memory;->mIsUnmountingUsb:Z

    if-eqz v0, :cond_3

    const v0, 0x7f0b0011

    :goto_4
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto :goto_0

    :cond_2
    const v0, 0x7f0b057a

    goto :goto_3

    :cond_3
    const v0, 0x7f0b057b

    goto :goto_4

    .line 526
    :pswitch_2
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0b0150

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v2, Lcom/android/settings/deviceinfo/Memory$6;

    invoke-direct {v2, p0}, Lcom/android/settings/deviceinfo/Memory$6;-><init>(Lcom/android/settings/deviceinfo/Memory;)V

    invoke-virtual {v0, v3, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v4, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0b0151

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto/16 :goto_0

    .line 498
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1
    .parameter "menu"
    .parameter "inflater"

    .prologue
    .line 395
    const v0, 0x7f100003

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 396
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 382
    iget-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mUiHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/settings/deviceinfo/Memory;->mUpdateRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 383
    iget-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageManager:Landroid/os/storage/StorageManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageListener:Landroid/os/storage/StorageEventListener;

    if-eqz v0, :cond_0

    .line 384
    iget-object v0, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageManager:Landroid/os/storage/StorageManager;

    iget-object v1, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageListener:Landroid/os/storage/StorageEventListener;

    invoke-virtual {v0, v1}, Landroid/os/storage/StorageManager;->unregisterListener(Landroid/os/storage/StorageEventListener;)V

    .line 390
    :cond_0
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onDestroy()V

    .line 391
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 7
    .parameter "item"

    .prologue
    const/4 v2, 0x0

    .line 406
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 419
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 408
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v0, v0, Landroid/preference/PreferenceActivity;

    if-eqz v0, :cond_0

    .line 409
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    const-class v1, Lcom/android/settings/deviceinfo/UsbSettings;

    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    const v3, 0x7f0b0582

    const/4 v6, 0x0

    move-object v4, v2

    move-object v5, p0

    invoke-virtual/range {v0 .. v6}, Landroid/preference/PreferenceActivity;->startPreferencePanel(Ljava/lang/String;Landroid/os/Bundle;ILjava/lang/CharSequence;Landroid/app/Fragment;I)V

    .line 417
    :goto_1
    const/4 v0, 0x1

    goto :goto_0

    .line 415
    :cond_0
    const-class v0, Lcom/android/settings/deviceinfo/UsbSettings;

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, -0x1

    invoke-virtual {p0, p0, v0, v1, v2}, Lcom/android/settings/deviceinfo/Memory;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ILandroid/os/Bundle;)Z

    goto :goto_1

    .line 406
    nop

    :pswitch_data_0
    .packed-switch 0x7f080272
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 4

    .prologue
    .line 372
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onPause()V

    .line 373
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/android/settings/deviceinfo/Memory;->mMediaScannerReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v3}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 375
    iget-object v2, p0, Lcom/android/settings/deviceinfo/Memory;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;

    .line 376
    .local v0, category:Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;
    invoke-virtual {v0}, Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;->onPause()V

    goto :goto_0

    .line 378
    .end local v0           #category:Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;
    :cond_0
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 2
    .parameter "preference"
    .parameter "newValue"

    .prologue
    const/4 v0, 0x0

    .line 716
    if-eqz p1, :cond_1

    instance-of v1, p1, Lcom/android/settings/deviceinfo/RadioButtonPreference;

    if-eqz v1, :cond_1

    .line 717
    iget-object v1, p0, Lcom/android/settings/deviceinfo/Memory;->mDeafultWritePathPref:Lcom/android/settings/deviceinfo/RadioButtonPreference;

    if-eqz v1, :cond_0

    .line 718
    iget-object v1, p0, Lcom/android/settings/deviceinfo/Memory;->mDeafultWritePathPref:Lcom/android/settings/deviceinfo/RadioButtonPreference;

    invoke-virtual {v1, v0}, Lcom/android/settings/deviceinfo/RadioButtonPreference;->setChecked(Z)Z

    .line 720
    :cond_0
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/storage/StorageManagerEx;->setDefaultPath(Ljava/lang/String;)V

    .line 721
    check-cast p1, Lcom/android/settings/deviceinfo/RadioButtonPreference;

    .end local p1
    iput-object p1, p0, Lcom/android/settings/deviceinfo/Memory;->mDeafultWritePathPref:Lcom/android/settings/deviceinfo/RadioButtonPreference;

    .line 722
    const/4 v0, 0x1

    .line 724
    :cond_1
    return v0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 10
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 437
    const-string v8, "cache"

    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 438
    invoke-static {p0}, Lcom/android/settings/deviceinfo/Memory$ConfirmClearCacheFragment;->show(Lcom/android/settings/deviceinfo/Memory;)V

    .line 475
    :cond_0
    :goto_0
    return v6

    .line 442
    :cond_1
    iget-object v8, p0, Lcom/android/settings/deviceinfo/Memory;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;

    .line 443
    .local v0, category:Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;
    invoke-virtual {v0, p2}, Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;->intentForClick(Landroid/preference/Preference;)Landroid/content/Intent;

    move-result-object v3

    .line 445
    .local v3, intent:Landroid/content/Intent;
    if-eqz v3, :cond_3

    .line 447
    :try_start_0
    invoke-static {}, Lcom/android/settings/Utils;->isMonkeyRunning()Z

    move-result v8

    if-nez v8, :cond_0

    .line 448
    invoke-virtual {p0, v3}, Lcom/android/settings/deviceinfo/Memory;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 452
    :catch_0
    move-exception v1

    .line 453
    .local v1, e:Landroid/content/ActivityNotFoundException;
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const v9, 0x7f0b000d

    invoke-static {v8, v9, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    .line 457
    .end local v1           #e:Landroid/content/ActivityNotFoundException;
    :cond_3
    invoke-virtual {v0}, Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;->getStorageVolume()Landroid/os/storage/StorageVolume;

    move-result-object v5

    .line 458
    .local v5, volume:Landroid/os/storage/StorageVolume;
    if-eqz v5, :cond_2

    invoke-virtual {v0, p2}, Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;->mountToggleClicked(Landroid/preference/Preference;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 459
    sput-object p2, Lcom/android/settings/deviceinfo/Memory;->sLastClickedMountToggle:Landroid/preference/Preference;

    .line 460
    invoke-virtual {v5}, Landroid/os/storage/StorageVolume;->isRemovable()Z

    move-result v7

    iput-boolean v7, p0, Lcom/android/settings/deviceinfo/Memory;->mIsRemovableVolume:Z

    .line 461
    const-string v7, "MemorySettings"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "onPreferenceTreeClick, mIsRemovableVolume is "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-boolean v9, p0, Lcom/android/settings/deviceinfo/Memory;->mIsRemovableVolume:Z

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 462
    invoke-virtual {v5}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v7

    sput-object v7, Lcom/android/settings/deviceinfo/Memory;->sClickedMountPoint:Ljava/lang/String;

    .line 463
    sget-object v7, Lcom/android/settings/deviceinfo/Memory;->sClickedMountPoint:Ljava/lang/String;

    const-string v8, "/mnt/usbotg"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    iput-boolean v7, p0, Lcom/android/settings/deviceinfo/Memory;->mIsUnmountingUsb:Z

    .line 464
    iget-object v7, p0, Lcom/android/settings/deviceinfo/Memory;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v5}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/os/storage/StorageManager;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 465
    .local v4, state:Ljava/lang/String;
    const-string v7, "mounted"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    const-string v7, "mounted_ro"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 467
    :cond_4
    invoke-direct {p0}, Lcom/android/settings/deviceinfo/Memory;->unmount()V

    goto/16 :goto_0

    .line 469
    :cond_5
    invoke-direct {p0}, Lcom/android/settings/deviceinfo/Memory;->mount()V

    goto/16 :goto_0

    .end local v0           #category:Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;
    .end local v3           #intent:Landroid/content/Intent;
    .end local v4           #state:Ljava/lang/String;
    .end local v5           #volume:Landroid/os/storage/StorageVolume;
    :cond_6
    move v6, v7

    .line 475
    goto/16 :goto_0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 2
    .parameter "menu"

    .prologue
    .line 400
    const v1, 0x7f080272

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 401
    .local v0, usb:Landroid/view/MenuItem;
    invoke-direct {p0}, Lcom/android/settings/deviceinfo/Memory;->isMassStorageEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 402
    return-void

    .line 401
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onResume()V
    .locals 5

    .prologue
    .line 296
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onResume()V

    .line 297
    const-string v3, "MemorySettings"

    const-string v4, "onResume"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.MEDIA_SCANNER_STARTED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 299
    .local v2, intentFilter:Landroid/content/IntentFilter;
    const-string v3, "android.intent.action.MEDIA_SCANNER_FINISHED"

    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 300
    const-string v3, "file"

    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 301
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getActivity()Landroid/app/Activity;

    move-result-object v3

    iget-object v4, p0, Lcom/android/settings/deviceinfo/Memory;->mMediaScannerReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, v4, v2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 303
    new-instance v2, Landroid/content/IntentFilter;

    .end local v2           #intentFilter:Landroid/content/IntentFilter;
    invoke-direct {v2}, Landroid/content/IntentFilter;-><init>()V

    .line 304
    .restart local v2       #intentFilter:Landroid/content/IntentFilter;
    const-string v3, "android.hardware.usb.action.USB_STATE"

    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 305
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->getActivity()Landroid/app/Activity;

    move-result-object v3

    iget-object v4, p0, Lcom/android/settings/deviceinfo/Memory;->mMediaScannerReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, v4, v2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 308
    invoke-direct {p0}, Lcom/android/settings/deviceinfo/Memory;->dynamicUpdateUnmountDlg()V

    .line 311
    const-string v3, "MemorySettings"

    const-string v4, "Dynamic Update Install Location in OnResume()"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->dynamicUpdateInstallLocation()V

    .line 315
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/Memory;->dynamicUpdateAPKInstaller()V

    .line 317
    invoke-direct {p0}, Lcom/android/settings/deviceinfo/Memory;->dynamicShowDefaultWriteCategory()V

    .line 319
    iget-object v3, p0, Lcom/android/settings/deviceinfo/Memory;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;

    .line 320
    .local v0, category:Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;
    invoke-virtual {v0}, Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;->onResume()V

    goto :goto_0

    .line 323
    .end local v0           #category:Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;
    :cond_0
    return-void
.end method
