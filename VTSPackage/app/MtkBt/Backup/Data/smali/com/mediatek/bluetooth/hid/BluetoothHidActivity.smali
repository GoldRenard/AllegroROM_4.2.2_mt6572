.class public Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;
.super Landroid/preference/PreferenceActivity;
.source "BluetoothHidActivity.java"


# static fields
.field public static final ACTION_DEVICE_ADDED:Ljava/lang/String; = "com.mediatek.bluetooth.BluetoothHidActivity.ACTION_DEVICE_ADDED"

.field public static final ACTION_SUMMARY_CHANGED:Ljava/lang/String; = "com.mediatek.bluetooth.BluetoothHidActivity.ACTION_SUMMARY_CHANGED"

.field private static final ADD_NEW_DEVICE:Ljava/lang/String; = "add_new_device"

.field public static final BT_HID_NOT_FOUNT:Ljava/lang/String; = "BT_HID_NOT_FOUNT"

.field public static final BT_HID_SETTING_INFO:Ljava/lang/String; = "BT_HID_SETTING_INFO"

.field private static final CONTEXT_ITEM_CONNECT:I = 0x2

.field private static final CONTEXT_ITEM_DISCONNECT:I = 0x3

.field private static final CONTEXT_ITEM_GET_IDLE:I = 0xa

.field private static final CONTEXT_ITEM_GET_PROTOCOL:I = 0x6

.field private static final CONTEXT_ITEM_GET_REPORT:I = 0x8

.field private static final CONTEXT_ITEM_SEND_REPORT_LONG:I = 0xc

.field private static final CONTEXT_ITEM_SEND_REPORT_SHORT:I = 0xb

.field private static final CONTEXT_ITEM_SET_IDLE:I = 0x9

.field private static final CONTEXT_ITEM_SET_PROTOCOL:I = 0x5

.field private static final CONTEXT_ITEM_SET_REPORT:I = 0x7

.field private static final CONTEXT_ITEM_UNPLUG:I = 0x4

.field private static final DEBUG:Z = true

.field public static final EXTRA_DEVICE:Ljava/lang/String; = "com.mediatek.bluetooth.BluetoothHidActivity.extra.EXTRA_DEVICE"

.field public static final EXTRA_ENABLE:Ljava/lang/String; = "com.mediatek.bluetooth.BluetoothHidActivity.extra.EXTRA_ENABLE"

.field public static final EXTRA_FILTER_TYPE:Ljava/lang/String; = "android.bluetooth.devicepicker.extra.FILTER_TYPE"

.field public static final EXTRA_LAUNCH_CLASS:Ljava/lang/String; = "android.bluetooth.devicepicker.extra.DEVICE_PICKER_LAUNCH_CLASS"

.field public static final EXTRA_LAUNCH_PACKAGE:Ljava/lang/String; = "android.bluetooth.devicepicker.extra.LAUNCH_PACKAGE"

.field public static final EXTRA_NEED_AUTH:Ljava/lang/String; = "android.bluetooth.devicepicker.extra.NEED_AUTH"

.field public static final EXTRA_SUMMARY:Ljava/lang/String; = "com.mediatek.bluetooth.BluetoothHidActivity.extra.EXTRA_SUMMARY"

.field private static final HID_DEVICE_LIST:Ljava/lang/String; = "hid_device_list"

.field public static final INTENT:Ljava/lang/String; = "android.bluetooth.devicepicker.action.LAUNCH"

.field private static final REQUEST_ENABLE_BT:I = 0x2

.field private static final TAG:Ljava/lang/String; = "[BT][HID][BluetoothHidActivity]"

.field public static final THIS_PACKAGE_NAME:Ljava/lang/String; = "com.mediatek.bluetooth"

.field private static sBluetoothHidPts:Z

.field static sDeviceList:Landroid/preference/PreferenceCategory;

.field private static sEnableBT:Z

.field private static sServiceBinded:Z


# instance fields
.field private mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

.field mCt:Landroid/content/Context;

.field private mHidServerNotifyConn:Landroid/content/ServiceConnection;

.field mIntentToDevicePicker:Landroid/content/Intent;

.field private mReceiver:Landroid/content/BroadcastReceiver;

.field private mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 108
    sput-boolean v0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sBluetoothHidPts:Z

    .line 110
    sput-boolean v0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sEnableBT:Z

    .line 112
    sput-boolean v0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sServiceBinded:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 70
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 106
    iput-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    .line 140
    iput-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 142
    iput-object p0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mCt:Landroid/content/Context;

    .line 146
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.bluetooth.devicepicker.action.LAUNCH"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mIntentToDevicePicker:Landroid/content/Intent;

    .line 417
    new-instance v0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$1;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$1;-><init>(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mHidServerNotifyConn:Landroid/content/ServiceConnection;

    .line 755
    new-instance v0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$2;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$2;-><init>(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;)Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    return-object v0
.end method

.method static synthetic access$102(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;)Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 70
    iput-object p1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    return-object p1
.end method

.method static synthetic access$200(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getPreferenceList()V

    return-void
.end method

.method static synthetic access$300()Z
    .locals 1

    .prologue
    .line 70
    sget-boolean v0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sServiceBinded:Z

    return v0
.end method

.method static synthetic access$302(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 70
    sput-boolean p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sServiceBinded:Z

    return p0
.end method

.method static synthetic access$400(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->restorePreferenceList()V

    return-void
.end method

.method static synthetic access$500(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;)Landroid/content/ServiceConnection;
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mHidServerNotifyConn:Landroid/content/ServiceConnection;

    return-object v0
.end method

.method static synthetic access$600()Z
    .locals 1

    .prologue
    .line 70
    sget-boolean v0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sEnableBT:Z

    return v0
.end method

.method private debugLog(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 550
    const-string v0, "[BT][HID][BluetoothHidActivity]"

    invoke-static {v0, p1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 552
    return-void
.end method

.method private getDeviceFromMenuInfo(Landroid/view/ContextMenu$ContextMenuInfo;)Landroid/preference/Preference;
    .locals 5
    .parameter "menuInfo"

    .prologue
    const/4 v2, 0x0

    .line 728
    if-eqz p1, :cond_0

    instance-of v3, p1, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    if-nez v3, :cond_2

    :cond_0
    move-object v1, v2

    .line 738
    :cond_1
    :goto_0
    return-object v1

    :cond_2
    move-object v0, p1

    .line 732
    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 733
    .local v0, adapterMenuInfo:Landroid/widget/AdapterView$AdapterContextMenuInfo;
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    invoke-virtual {v3}, Landroid/preference/PreferenceScreen;->getRootAdapter()Landroid/widget/ListAdapter;

    move-result-object v3

    iget v4, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-interface {v3, v4}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/preference/Preference;

    .line 734
    .local v1, pref:Landroid/preference/Preference;
    if-nez v1, :cond_1

    move-object v1, v2

    .line 735
    goto :goto_0
.end method

.method public static getDeviceList()Landroid/preference/PreferenceCategory;
    .locals 1

    .prologue
    .line 545
    sget-object v0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sDeviceList:Landroid/preference/PreferenceCategory;

    return-object v0
.end method

.method private getPreferenceList()V
    .locals 15

    .prologue
    .line 438
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v13

    invoke-virtual {v13}, Landroid/bluetooth/BluetoothAdapter;->getBondedDevices()Ljava/util/Set;

    move-result-object v4

    .line 439
    .local v4, pairedDevices:Ljava/util/Set;,"Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    if-nez v4, :cond_1

    .line 542
    :cond_0
    return-void

    .line 443
    :cond_1
    const-string v13, "BT_HID_SETTING_INFO"

    const/4 v14, 0x0

    invoke-virtual {p0, v13, v14}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 444
    .local v7, settings:Landroid/content/SharedPreferences;
    const/4 v5, 0x0

    .line 445
    .local v5, preIndex:I
    const-string v13, "preferenceCount"

    const/4 v14, 0x0

    invoke-interface {v7, v13, v14}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    .line 447
    .local v6, preferenceCount:I
    new-instance v8, Ljava/lang/String;

    invoke-direct {v8}, Ljava/lang/String;-><init>()V

    .line 449
    .local v8, state:Ljava/lang/String;
    const/4 v5, 0x0

    :goto_0
    if-ge v5, v6, :cond_10

    .line 450
    new-instance v12, Landroid/preference/Preference;

    iget-object v13, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mCt:Landroid/content/Context;

    invoke-direct {v12, v13}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 451
    .local v12, tmpPre:Landroid/preference/Preference;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "deviceAddr"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const-string v14, "BT_HID_NOT_FOUNT"

    invoke-interface {v7, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 452
    .local v9, tmpAddr:Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "newAdd"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const-string v14, "BT_HID_NOT_FOUNT"

    invoke-interface {v7, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 454
    .local v3, newAdd:Ljava/lang/String;
    new-instance v11, Ljava/lang/String;

    invoke-direct {v11}, Ljava/lang/String;-><init>()V

    .line 456
    .local v11, tmpName:Ljava/lang/String;
    invoke-virtual {v12, v9}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 457
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v13

    invoke-virtual {v13, v9}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v2

    .line 458
    .local v2, mBD:Landroid/bluetooth/BluetoothDevice;
    if-eqz v2, :cond_2

    .line 459
    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v11

    .line 461
    :cond_2
    invoke-virtual {v12, v11}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 462
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "in getPreferenceList "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ":"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {p0, v13}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 464
    :try_start_0
    iget-object v13, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    if-eqz v13, :cond_8

    .line 465
    iget-object v13, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    invoke-interface {v13, v9}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->getStateByAddr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 471
    :goto_1
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "in getPreferenceList "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ":"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {p0, v13}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 472
    if-eqz v8, :cond_3

    const-string v13, "disconnect"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_3

    const-string v13, "unplug_disconnect"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9

    .line 474
    :cond_3
    const v13, 0x7f05000d

    invoke-virtual {v12, v13}, Landroid/preference/Preference;->setSummary(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 492
    :cond_4
    :goto_2
    sget-object v13, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sDeviceList:Landroid/preference/PreferenceCategory;

    invoke-virtual {v13, v9}, Landroid/preference/PreferenceCategory;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v13

    if-nez v13, :cond_6

    .line 493
    if-eqz v8, :cond_6

    .line 494
    const-string v13, "connected"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_5

    const-string v13, "connecting"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_6

    .line 496
    :cond_5
    sget-object v13, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sDeviceList:Landroid/preference/PreferenceCategory;

    invoke-virtual {v13, v12}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 501
    :cond_6
    sget-object v13, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sDeviceList:Landroid/preference/PreferenceCategory;

    invoke-virtual {v13, v9}, Landroid/preference/PreferenceCategory;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v13

    if-nez v13, :cond_7

    .line 502
    if-eqz v8, :cond_e

    .line 503
    const-string v13, "unplug_disconnect"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_e

    const-string v13, "FALSE"

    invoke-virtual {v3, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_e

    .line 449
    :cond_7
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 467
    :cond_8
    :try_start_1
    const-string v13, "in getPreferenceList mServerNotify == null"

    invoke-direct {p0, v13}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 468
    const/4 v8, 0x0

    goto :goto_1

    .line 475
    :cond_9
    const-string v13, "connected"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_a

    .line 476
    const v13, 0x7f05000b

    invoke-virtual {v12, v13}, Landroid/preference/Preference;->setSummary(I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 486
    :catch_0
    move-exception v0

    .line 487
    .local v0, e:Landroid/os/RemoteException;
    const-string v13, "hid retrieve preferences error"

    invoke-direct {p0, v13}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 488
    const v13, 0x7f05000d

    invoke-virtual {v12, v13}, Landroid/preference/Preference;->setSummary(I)V

    .line 489
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_2

    .line 477
    .end local v0           #e:Landroid/os/RemoteException;
    :cond_a
    :try_start_2
    const-string v13, "disconnecting"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_b

    const-string v13, "unplug"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_c

    .line 479
    :cond_b
    const v13, 0x7f05001f

    invoke-virtual {v12, v13}, Landroid/preference/Preference;->setSummary(I)V

    .line 480
    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/preference/Preference;->setEnabled(Z)V

    goto :goto_2

    .line 481
    :cond_c
    const-string v13, "connecting"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_d

    const-string v13, "authorize"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 483
    :cond_d
    const v13, 0x7f05000c

    invoke-virtual {v12, v13}, Landroid/preference/Preference;->setSummary(I)V

    .line 484
    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/preference/Preference;->setEnabled(Z)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_2

    .line 507
    :cond_e
    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v13

    if-lez v13, :cond_7

    .line 508
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "in getPreferenceList pairedDevices.size="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {p0, v13}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 509
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_f
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/bluetooth/BluetoothDevice;

    .line 510
    .local v10, tmpDevice:Landroid/bluetooth/BluetoothDevice;
    invoke-virtual {v10}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_f

    .line 511
    sget-object v13, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sDeviceList:Landroid/preference/PreferenceCategory;

    invoke-virtual {v13, v12}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    goto :goto_3

    .line 518
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #mBD:Landroid/bluetooth/BluetoothDevice;
    .end local v3           #newAdd:Ljava/lang/String;
    .end local v9           #tmpAddr:Ljava/lang/String;
    .end local v10           #tmpDevice:Landroid/bluetooth/BluetoothDevice;
    .end local v11           #tmpName:Ljava/lang/String;
    .end local v12           #tmpPre:Landroid/preference/Preference;
    :cond_10
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_11
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/bluetooth/BluetoothDevice;

    .line 520
    .restart local v10       #tmpDevice:Landroid/bluetooth/BluetoothDevice;
    :try_start_3
    iget-object v13, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    if-eqz v13, :cond_12

    .line 521
    iget-object v13, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    invoke-virtual {v10}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->getStateByAddr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 523
    :cond_12
    if-eqz v8, :cond_11

    .line 524
    const-string v13, "connected"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 525
    new-instance v12, Landroid/preference/Preference;

    iget-object v13, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mCt:Landroid/content/Context;

    invoke-direct {v12, v13}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 526
    .restart local v12       #tmpPre:Landroid/preference/Preference;
    invoke-virtual {v10}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 527
    invoke-virtual {v10}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 528
    const v13, 0x7f05000b

    invoke-virtual {v12, v13}, Landroid/preference/Preference;->setSummary(I)V

    .line 529
    sget-object v13, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sDeviceList:Landroid/preference/PreferenceCategory;

    invoke-virtual {v10}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/preference/PreferenceCategory;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v13

    if-nez v13, :cond_11

    .line 530
    sget-object v13, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sDeviceList:Landroid/preference/PreferenceCategory;

    invoke-virtual {v13, v12}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_4

    .line 535
    .end local v12           #tmpPre:Landroid/preference/Preference;
    :catch_1
    move-exception v0

    .line 536
    .restart local v0       #e:Landroid/os/RemoteException;
    const-string v13, "hid retrieve preferences error"

    invoke-direct {p0, v13}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 537
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_4
.end method

.method private restorePreferenceList()V
    .locals 7

    .prologue
    .line 366
    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    if-nez v4, :cond_1

    .line 380
    :cond_0
    return-void

    .line 369
    :cond_1
    const-string v4, "BT_HID_SETTING_INFO"

    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 370
    .local v2, settings:Landroid/content/SharedPreferences;
    sget-object v4, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sDeviceList:Landroid/preference/PreferenceCategory;

    invoke-virtual {v4}, Landroid/preference/PreferenceCategory;->getPreferenceCount()I

    move-result v0

    .line 371
    .local v0, preferenceCount:I
    const/4 v1, 0x0

    .line 372
    .local v1, preferenceIndex:I
    new-instance v3, Landroid/preference/Preference;

    invoke-direct {v3, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 373
    .local v3, tmpPre:Landroid/preference/Preference;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "In restorePreferenceList,preferenceCount="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 374
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "preferenceCount"

    invoke-interface {v4, v5, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 375
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 376
    sget-object v4, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sDeviceList:Landroid/preference/PreferenceCategory;

    invoke-virtual {v4, v1}, Landroid/preference/PreferenceCategory;->getPreference(I)Landroid/preference/Preference;

    move-result-object v3

    .line 377
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "deviceAddr"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "newAdd"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "FALSE"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 375
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public getmServerNotify()Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;
    .locals 1

    .prologue
    .line 752
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    return-object v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 237
    invoke-super {p0, p1, p2, p3}, Landroid/preference/PreferenceActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 238
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onActivityResult, resultCode = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 239
    packed-switch p1, :pswitch_data_0

    .line 286
    :goto_0
    return-void

    .line 241
    :pswitch_0
    const/4 v0, -0x1

    if-ne p2, v0, :cond_2

    .line 242
    const v0, 0x7f050006

    invoke-static {p0, v0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 243
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 245
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->getState()I

    move-result v0

    const/16 v1, 0xd

    if-eq v0, v1, :cond_1

    .line 246
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mHidServerNotifyConn:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0, v1, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 249
    sput-boolean v2, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sServiceBinded:Z

    .line 250
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->finish()V

    .line 257
    :cond_0
    :goto_1
    const-string v0, "hid success bind service in onActivityResult"

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 258
    sput-boolean v2, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sEnableBT:Z

    goto :goto_0

    .line 255
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->finish()V

    goto :goto_1

    .line 269
    :cond_2
    if-nez p2, :cond_3

    .line 271
    sput-boolean v2, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sEnableBT:Z

    goto :goto_0

    .line 276
    :cond_3
    sput-boolean v2, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sEnableBT:Z

    .line 277
    const v0, 0x7f050007

    invoke-static {p0, v0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 239
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 9
    .parameter "item"

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 557
    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getDeviceFromMenuInfo(Landroid/view/ContextMenu$ContextMenuInfo;)Landroid/preference/Preference;

    move-result-object v1

    .line 558
    .local v1, pre:Landroid/preference/Preference;
    if-nez v1, :cond_0

    .line 683
    :goto_0
    return v4

    .line 561
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    packed-switch v6, :pswitch_data_0

    goto :goto_0

    .line 564
    :pswitch_0
    :try_start_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "hid connect "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 565
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getmServerNotify()Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    move-result-object v6

    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->connectReq(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move v4, v5

    .line 566
    goto :goto_0

    .line 567
    :catch_0
    move-exception v0

    .line 568
    .local v0, e:Landroid/os/RemoteException;
    const-string v5, "hid connect error"

    invoke-direct {p0, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 569
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 574
    .end local v0           #e:Landroid/os/RemoteException;
    :pswitch_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "hid disconnect "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 576
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 577
    .local v2, tmpIntent:Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-class v6, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v4, v6}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    const-string v6, "device_addr"

    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    const-string v6, "action"

    const-string v7, "disconnect"

    invoke-virtual {v4, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 580
    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->startActivity(Landroid/content/Intent;)V

    move v4, v5

    .line 581
    goto/16 :goto_0

    .line 584
    .end local v2           #tmpIntent:Landroid/content/Intent;
    :pswitch_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "hid unplug "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 586
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 587
    .local v3, tmpIntent2:Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-class v6, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v6}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    const-string v6, "device_addr"

    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    const-string v6, "action"

    const-string v7, "unplug"

    invoke-virtual {v4, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 590
    invoke-virtual {p0, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->startActivity(Landroid/content/Intent;)V

    move v4, v5

    .line 591
    goto/16 :goto_0

    .line 595
    .end local v3           #tmpIntent2:Landroid/content/Intent;
    :pswitch_3
    :try_start_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "hid SET_IDLE "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 596
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getmServerNotify()Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    move-result-object v6

    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->setIdleReq(Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    move v4, v5

    .line 597
    goto/16 :goto_0

    .line 598
    :catch_1
    move-exception v0

    .line 599
    .restart local v0       #e:Landroid/os/RemoteException;
    const-string v5, "hid SET_IDLE error"

    invoke-direct {p0, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 600
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 606
    .end local v0           #e:Landroid/os/RemoteException;
    :pswitch_4
    :try_start_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "hid GET_IDLE "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 607
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getmServerNotify()Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    move-result-object v6

    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->getIdleReq(Ljava/lang/String;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_2

    move v4, v5

    .line 608
    goto/16 :goto_0

    .line 609
    :catch_2
    move-exception v0

    .line 610
    .restart local v0       #e:Landroid/os/RemoteException;
    const-string v5, "hid GET_IDLE error"

    invoke-direct {p0, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 611
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 617
    .end local v0           #e:Landroid/os/RemoteException;
    :pswitch_5
    :try_start_3
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "hid SET_REPORT "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 618
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getmServerNotify()Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    move-result-object v6

    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->setReportReq(Ljava/lang/String;)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_3

    move v4, v5

    .line 619
    goto/16 :goto_0

    .line 620
    :catch_3
    move-exception v0

    .line 621
    .restart local v0       #e:Landroid/os/RemoteException;
    const-string v5, "hid SET_REPORT error"

    invoke-direct {p0, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 622
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 628
    .end local v0           #e:Landroid/os/RemoteException;
    :pswitch_6
    :try_start_4
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "hid GET_REPORT "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 629
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getmServerNotify()Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    move-result-object v6

    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->getReportReq(Ljava/lang/String;)V
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_4

    move v4, v5

    .line 630
    goto/16 :goto_0

    .line 631
    :catch_4
    move-exception v0

    .line 632
    .restart local v0       #e:Landroid/os/RemoteException;
    const-string v5, "hid GET_REPORT error"

    invoke-direct {p0, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 633
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 639
    .end local v0           #e:Landroid/os/RemoteException;
    :pswitch_7
    :try_start_5
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "hid SET_PROTOCOL "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 640
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getmServerNotify()Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    move-result-object v6

    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->setProtocolReq(Ljava/lang/String;)V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_5

    move v4, v5

    .line 641
    goto/16 :goto_0

    .line 642
    :catch_5
    move-exception v0

    .line 643
    .restart local v0       #e:Landroid/os/RemoteException;
    const-string v5, "hid SET_PROTOCOL error"

    invoke-direct {p0, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 644
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 650
    .end local v0           #e:Landroid/os/RemoteException;
    :pswitch_8
    :try_start_6
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "hid GET_PROTOCOL "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 651
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getmServerNotify()Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    move-result-object v6

    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->getProtocolReq(Ljava/lang/String;)V
    :try_end_6
    .catch Landroid/os/RemoteException; {:try_start_6 .. :try_end_6} :catch_6

    move v4, v5

    .line 652
    goto/16 :goto_0

    .line 653
    :catch_6
    move-exception v0

    .line 654
    .restart local v0       #e:Landroid/os/RemoteException;
    const-string v5, "hid GET_PROTOCOL error"

    invoke-direct {p0, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 655
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 661
    .end local v0           #e:Landroid/os/RemoteException;
    :pswitch_9
    :try_start_7
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "hid SEND_REPORT_SHORT "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 662
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getmServerNotify()Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    move-result-object v6

    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v6, v7, v8}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->sendReportReq(Ljava/lang/String;Z)V
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_7

    move v4, v5

    .line 663
    goto/16 :goto_0

    .line 664
    :catch_7
    move-exception v0

    .line 665
    .restart local v0       #e:Landroid/os/RemoteException;
    const-string v5, "hid SEND_REPORT error"

    invoke-direct {p0, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 666
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 671
    .end local v0           #e:Landroid/os/RemoteException;
    :pswitch_a
    :try_start_8
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "hid SEND_REPORT_LONG "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 672
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getmServerNotify()Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    move-result-object v6

    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    invoke-interface {v6, v7, v8}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->sendReportReq(Ljava/lang/String;Z)V
    :try_end_8
    .catch Landroid/os/RemoteException; {:try_start_8 .. :try_end_8} :catch_8

    move v4, v5

    .line 673
    goto/16 :goto_0

    .line 674
    :catch_8
    move-exception v0

    .line 675
    .restart local v0       #e:Landroid/os/RemoteException;
    const-string v5, "hid SEND_REPORT error"

    invoke-direct {p0, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 676
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 561
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_7
        :pswitch_8
        :pswitch_5
        :pswitch_6
        :pswitch_3
        :pswitch_4
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    const/4 v4, 0x1

    .line 195
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 197
    const-string v2, "onCreate"

    invoke-direct {p0, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 199
    const v2, 0x7f040001

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->addPreferencesFromResource(I)V

    .line 200
    const/high16 v2, 0x7f05

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->setTitle(I)V

    .line 201
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 202
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-nez v2, :cond_1

    .line 203
    const-string v2, "Bluetooth is not available"

    invoke-static {p0, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 204
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->finish()V

    .line 233
    :cond_0
    :goto_0
    return-void

    .line 207
    :cond_1
    const-string v2, "hid_device_list"

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/PreferenceCategory;

    sput-object v2, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sDeviceList:Landroid/preference/PreferenceCategory;

    .line 208
    sget-object v2, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sDeviceList:Landroid/preference/PreferenceCategory;

    if-eqz v2, :cond_2

    .line 209
    sget-object v2, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sDeviceList:Landroid/preference/PreferenceCategory;

    invoke-virtual {v2, v4}, Landroid/preference/PreferenceCategory;->setOrderingAsAdded(Z)V

    .line 211
    :cond_2
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getListView()Landroid/widget/ListView;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->registerForContextMenu(Landroid/view/View;)V

    .line 213
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 214
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v2, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 215
    const-string v2, "com.mediatek.bluetooth.BluetoothHidActivity.ACTION_SUMMARY_CHANGED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 216
    const-string v2, "com.mediatek.bluetooth.BluetoothHidActivity.ACTION_DEVICE_ADDED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 217
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 219
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v2

    if-nez v2, :cond_0

    sget-boolean v2, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sEnableBT:Z

    if-nez v2, :cond_0

    .line 222
    const-string v2, "[BT][HID][BluetoothHidActivity]"

    const-string v3, "bluetooth is not available! "

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    const-string v2, "[BT][HID][BluetoothHidActivity]"

    const-string v3, "turning on bluetooth......"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    sput-boolean v4, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sEnableBT:Z

    .line 227
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.bluetooth.adapter.action.REQUEST_ENABLE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 228
    .local v1, intentEnable:Landroid/content/Intent;
    const/high16 v2, 0x2000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 229
    const/4 v2, 0x2

    invoke-virtual {p0, v1, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 7
    .parameter "menu"
    .parameter "v"
    .parameter "menuInfo"

    .prologue
    .line 688
    invoke-super {p0, p1, p2, p3}, Landroid/preference/PreferenceActivity;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    .line 690
    :try_start_0
    invoke-direct {p0, p3}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getDeviceFromMenuInfo(Landroid/view/ContextMenu$ContextMenuInfo;)Landroid/preference/Preference;

    move-result-object v1

    .line 691
    .local v1, pre:Landroid/preference/Preference;
    if-nez v1, :cond_1

    .line 725
    .end local v1           #pre:Landroid/preference/Preference;
    :cond_0
    :goto_0
    return-void

    .line 694
    .restart local v1       #pre:Landroid/preference/Preference;
    :cond_1
    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v3

    const-string v4, "add_new_device"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 695
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getmServerNotify()Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    move-result-object v3

    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->getStateByAddr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 696
    .local v2, state:Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "device state="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 698
    invoke-virtual {v1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {p1, v3}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 699
    if-nez v2, :cond_2

    .line 700
    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x0

    const v6, 0x7f050001

    invoke-interface {p1, v3, v4, v5, v6}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 720
    .end local v1           #pre:Landroid/preference/Preference;
    .end local v2           #state:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 721
    .local v0, e:Landroid/os/RemoteException;
    const-string v3, "hid getStateByAddr error"

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 722
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 701
    .end local v0           #e:Landroid/os/RemoteException;
    .restart local v1       #pre:Landroid/preference/Preference;
    .restart local v2       #state:Ljava/lang/String;
    :cond_2
    :try_start_1
    const-string v3, "disconnect"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "unplug_disconnect"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 703
    :cond_3
    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x0

    const v6, 0x7f050001

    invoke-interface {p1, v3, v4, v5, v6}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    goto :goto_0

    .line 704
    :cond_4
    const-string v3, "connected"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 705
    const/4 v3, 0x0

    const/4 v4, 0x3

    const/4 v5, 0x0

    const v6, 0x7f050002

    invoke-interface {p1, v3, v4, v5, v6}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 706
    const/4 v3, 0x0

    const/4 v4, 0x4

    const/4 v5, 0x0

    const v6, 0x7f050003

    invoke-interface {p1, v3, v4, v5, v6}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 707
    sget-boolean v3, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sBluetoothHidPts:Z

    if-eqz v3, :cond_0

    .line 708
    const/4 v3, 0x0

    const/16 v4, 0xa

    const/4 v5, 0x0

    const-string v6, "Get_idle"

    invoke-interface {p1, v3, v4, v5, v6}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 709
    const/4 v3, 0x0

    const/16 v4, 0x9

    const/4 v5, 0x0

    const-string v6, "Set_idle"

    invoke-interface {p1, v3, v4, v5, v6}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 710
    const/4 v3, 0x0

    const/16 v4, 0x8

    const/4 v5, 0x0

    const-string v6, "Get_report"

    invoke-interface {p1, v3, v4, v5, v6}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 711
    const/4 v3, 0x0

    const/4 v4, 0x7

    const/4 v5, 0x0

    const-string v6, "Set_report"

    invoke-interface {p1, v3, v4, v5, v6}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 712
    const/4 v3, 0x0

    const/4 v4, 0x6

    const/4 v5, 0x0

    const-string v6, "Get_protocol"

    invoke-interface {p1, v3, v4, v5, v6}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 713
    const/4 v3, 0x0

    const/4 v4, 0x5

    const/4 v5, 0x0

    const-string v6, "Set_protocol"

    invoke-interface {p1, v3, v4, v5, v6}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 714
    const/4 v3, 0x0

    const/16 v4, 0xb

    const/4 v5, 0x0

    const-string v6, "Send_report(short)"

    invoke-interface {p1, v3, v4, v5, v6}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 715
    const/4 v3, 0x0

    const/16 v4, 0xc

    const/4 v5, 0x0

    const-string v6, "Send_report(long)"

    invoke-interface {p1, v3, v4, v5, v6}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 410
    const-string v0, "onDestroy"

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 411
    const/4 v0, 0x0

    sput-boolean v0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sBluetoothHidPts:Z

    .line 412
    const-string v0, "onDestroy: unregister broadcastReceiver"

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 413
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 414
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 415
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 328
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onPause()V

    .line 329
    const-string v0, "onPause"

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 330
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 7
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v3, 0x1

    .line 149
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v4

    const-string v5, "add_new_device"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 150
    const-string v4, "Add New Devices"

    invoke-direct {p0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 151
    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mIntentToDevicePicker:Landroid/content/Intent;

    const-string v5, "android.bluetooth.devicepicker.extra.NEED_AUTH"

    invoke-virtual {v4, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 152
    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mIntentToDevicePicker:Landroid/content/Intent;

    const-string v5, "android.bluetooth.devicepicker.extra.FILTER_TYPE"

    const/4 v6, 0x7

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 154
    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mIntentToDevicePicker:Landroid/content/Intent;

    const-string v5, "android.bluetooth.devicepicker.extra.LAUNCH_PACKAGE"

    const-string v6, "com.mediatek.bluetooth"

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 155
    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mIntentToDevicePicker:Landroid/content/Intent;

    const-string v5, "android.bluetooth.devicepicker.extra.DEVICE_PICKER_LAUNCH_CLASS"

    const-class v6, Lcom/mediatek/bluetooth/hid/BluetoothHidReceiver;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 158
    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mIntentToDevicePicker:Landroid/content/Intent;

    invoke-virtual {p0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->startActivity(Landroid/content/Intent;)V

    .line 190
    :goto_0
    return v3

    .line 161
    :cond_0
    instance-of v4, p2, Landroid/preference/Preference;

    if-eqz v4, :cond_2

    .line 163
    :try_start_0
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getmServerNotify()Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    move-result-object v4

    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->getStateByAddr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 164
    .local v1, state:Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "device state="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 166
    if-eqz v1, :cond_1

    const-string v4, "disconnect"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "unplug_disconnect"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "authorize"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 170
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "hid connect "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 172
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getmServerNotify()Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    move-result-object v4

    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->connectReq(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 185
    .end local v1           #state:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 186
    .local v0, e:Landroid/os/RemoteException;
    const-string v3, "hid connect error"

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 187
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 190
    .end local v0           #e:Landroid/os/RemoteException;
    :cond_2
    invoke-super {p0, p1, p2}, Landroid/preference/PreferenceActivity;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v3

    goto :goto_0

    .line 174
    .restart local v1       #state:Ljava/lang/String;
    :cond_3
    :try_start_1
    const-string v4, "connected"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 175
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "hid disconnect "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 178
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 179
    .local v2, tmpIntent:Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-class v5, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    const-string v5, "device_addr"

    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    const-string v5, "action"

    const-string v6, "disconnect"

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 182
    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method protected onRestart()V
    .locals 2

    .prologue
    .line 334
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onRestart()V

    .line 335
    const-string v0, "onRestart"

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 336
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sEnableBT:Z

    if-nez v0, :cond_0

    .line 339
    const-string v0, "[BT][HID][BluetoothHidActivity]"

    const-string v1, "bluetooth is not available! "

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    const-string v0, "[BT][HID][BluetoothHidActivity]"

    const-string v1, "turning on bluetooth......"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 342
    const/4 v0, 0x1

    sput-boolean v0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sEnableBT:Z

    .line 348
    :cond_0
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .parameter "state"

    .prologue
    .line 743
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 744
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 354
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 355
    const-string v0, "onResume"

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 356
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sEnableBT:Z

    if-nez v0, :cond_0

    .line 359
    const-string v0, "[BT][HID][BluetoothHidActivity]"

    const-string v1, "bluetooth is not available! "

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->finish()V

    .line 363
    :cond_0
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .parameter "outState"

    .prologue
    .line 749
    return-void
.end method

.method protected onStart()V
    .locals 6

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 290
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onStart()V

    .line 291
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onStart, enableBT="

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-boolean v5, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sEnableBT:Z

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 292
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 293
    .local v1, data:Landroid/os/Bundle;
    if-eqz v1, :cond_0

    .line 294
    const-string v2, "check BLUETOOTH_HID_PTS in onStart"

    invoke-direct {p0, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 295
    const-string v2, "BLUETOOTH_HID_PTS"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 296
    .local v0, action:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 297
    const-string v2, "TRUE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    move v2, v3

    :goto_0
    sput-boolean v2, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sBluetoothHidPts:Z

    .line 301
    .end local v0           #action:Ljava/lang/String;
    :cond_0
    sget-boolean v2, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sEnableBT:Z

    if-nez v2, :cond_2

    .line 302
    new-instance v2, Landroid/content/Intent;

    const-class v5, Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    invoke-direct {v2, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 303
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothAdapter;->getState()I

    move-result v2

    const/16 v5, 0xd

    if-eq v2, v5, :cond_4

    .line 304
    new-instance v2, Landroid/content/Intent;

    const-class v5, Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    invoke-direct {v2, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v5, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mHidServerNotifyConn:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v2, v5, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 306
    sput-boolean v4, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sServiceBinded:Z

    .line 307
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->finish()V

    .line 314
    :cond_1
    :goto_1
    const-string v2, "hid success bind service in onStart"

    invoke-direct {p0, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 324
    :cond_2
    return-void

    .restart local v0       #action:Ljava/lang/String;
    :cond_3
    move v2, v4

    .line 297
    goto :goto_0

    .line 312
    .end local v0           #action:Ljava/lang/String;
    :cond_4
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->finish()V

    goto :goto_1
.end method

.method protected onStop()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 384
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onStop()V

    .line 386
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 387
    invoke-direct {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->restorePreferenceList()V

    .line 389
    :try_start_0
    sget-boolean v1, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sServiceBinded:Z

    if-eqz v1, :cond_0

    .line 390
    const/4 v1, 0x0

    sput-boolean v1, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sServiceBinded:Z

    .line 391
    const-string v1, "onStop,unbindservice"

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 392
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mHidServerNotifyConn:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v1}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 400
    :cond_0
    :goto_0
    sget-object v1, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sDeviceList:Landroid/preference/PreferenceCategory;

    invoke-virtual {v1}, Landroid/preference/PreferenceCategory;->removeAll()V

    .line 404
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onStop:, enable="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sEnableBT:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V

    .line 405
    sput-boolean v3, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sEnableBT:Z

    .line 406
    return-void

    .line 394
    :catch_0
    move-exception v0

    .line 396
    .local v0, e:Ljava/lang/IllegalArgumentException;
    const-string v1, "[BT][HID][BluetoothHidActivity]"

    const-string v2, "onStop,unbindservice error"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 398
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->finish()V

    goto :goto_0
.end method
