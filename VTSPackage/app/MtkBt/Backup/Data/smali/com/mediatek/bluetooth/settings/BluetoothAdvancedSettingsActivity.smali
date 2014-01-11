.class public Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity;
.super Lcom/mediatek/activity/AssembledPreferenceActivity;
.source "BluetoothAdvancedSettingsActivity.java"


# static fields
.field private static registeredPreferences:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private filter:Landroid/content/IntentFilter;

.field private receiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 60
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    sput-object v0, Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity;->registeredPreferences:Ljava/util/ArrayList;

    .line 63
    const-string v0, "com.mediatek.bluetooth.ftp.BluetoothFtpServerAdvSettings"

    invoke-static {v0}, Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity;->registerProfile(Ljava/lang/String;)V

    .line 64
    const-string v0, "com.mediatek.bluetooth.simap.BluetoothSimapSettings"

    invoke-static {v0}, Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity;->registerProfile(Ljava/lang/String;)V

    .line 65
    const-string v0, "com.mediatek.bluetooth.pan.BluetoothPanSettings"

    invoke-static {v0}, Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity;->registerProfile(Ljava/lang/String;)V

    .line 66
    const-string v0, "com.mediatek.bluetooth.prx.reporter.PrxrBluetoothSettings"

    invoke-static {v0}, Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity;->registerProfile(Ljava/lang/String;)V

    .line 67
    const-string v0, "com.mediatek.bluetooth.map.BluetoothMapServerSettings"

    invoke-static {v0}, Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity;->registerProfile(Ljava/lang/String;)V

    .line 68
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 85
    sget-object v0, Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity;->registeredPreferences:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/mediatek/activity/AssembledPreferenceActivity;-><init>(Ljava/util/List;)V

    .line 88
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity;->filter:Landroid/content/IntentFilter;

    .line 90
    new-instance v0, Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity$1;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity$1;-><init>(Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity;->receiver:Landroid/content/BroadcastReceiver;

    .line 86
    return-void
.end method

.method private static registerProfile(Ljava/lang/String;)V
    .locals 3
    .parameter "className"

    .prologue
    const/4 v1, 0x0

    .line 72
    invoke-static {p0, v1, v1}, Lcom/mediatek/bluetooth/util/ClassUtils;->newObject(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;

    .line 73
    .local v0, pref:Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;
    if-eqz v0, :cond_0

    .line 75
    sget-object v1, Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity;->registeredPreferences:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 81
    :goto_0
    return-void

    .line 79
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BluetoothAdvancedSettingsActivity: fail to register profile["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 106
    invoke-super {p0, p1}, Lcom/mediatek/activity/AssembledPreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 108
    iget-object v0, p0, Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity;->receiver:Landroid/content/BroadcastReceiver;

    iget-object v1, p0, Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity;->filter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 109
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 116
    :try_start_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/settings/BluetoothAdvancedSettingsActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    :goto_0
    invoke-super {p0}, Lcom/mediatek/activity/AssembledPreferenceActivity;->onDestroy()V

    .line 123
    return-void

    .line 118
    :catch_0
    move-exception v0

    goto :goto_0
.end method
