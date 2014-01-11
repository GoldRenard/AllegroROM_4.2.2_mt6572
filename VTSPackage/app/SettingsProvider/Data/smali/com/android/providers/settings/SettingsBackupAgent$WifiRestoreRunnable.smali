.class Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;
.super Ljava/lang/Object;
.source "SettingsBackupAgent.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/providers/settings/SettingsBackupAgent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "WifiRestoreRunnable"
.end annotation


# instance fields
.field private restoredSupplicantData:[B

.field private restoredWifiConfigFile:[B

.field final synthetic this$0:Lcom/android/providers/settings/SettingsBackupAgent;


# direct methods
.method constructor <init>(Lcom/android/providers/settings/SettingsBackupAgent;)V
    .locals 0
    .parameter

    .prologue
    .line 301
    iput-object p1, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->this$0:Lcom/android/providers/settings/SettingsBackupAgent;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method incorporateWifiConfigFile(Landroid/app/backup/BackupDataInput;)V
    .locals 4
    .parameter "data"

    .prologue
    .line 317
    invoke-virtual {p1}, Landroid/app/backup/BackupDataInput;->getDataSize()I

    move-result v1

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->restoredWifiConfigFile:[B

    .line 318
    iget-object v1, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->restoredWifiConfigFile:[B

    array-length v1, v1

    if-gtz v1, :cond_0

    .line 325
    :goto_0
    return-void

    .line 320
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->restoredWifiConfigFile:[B

    const/4 v2, 0x0

    invoke-virtual {p1}, Landroid/app/backup/BackupDataInput;->getDataSize()I

    move-result v3

    invoke-virtual {p1, v1, v2, v3}, Landroid/app/backup/BackupDataInput;->readEntityData([BII)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 321
    :catch_0
    move-exception v0

    .line 322
    .local v0, e:Ljava/io/IOException;
    const-string v1, "SettingsBackupAgent"

    const-string v2, "Unable to read config file"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 323
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->restoredWifiConfigFile:[B

    goto :goto_0
.end method

.method incorporateWifiSupplicant(Landroid/app/backup/BackupDataInput;)V
    .locals 4
    .parameter "data"

    .prologue
    .line 306
    invoke-virtual {p1}, Landroid/app/backup/BackupDataInput;->getDataSize()I

    move-result v1

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->restoredSupplicantData:[B

    .line 307
    iget-object v1, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->restoredSupplicantData:[B

    array-length v1, v1

    if-gtz v1, :cond_0

    .line 314
    :goto_0
    return-void

    .line 309
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->restoredSupplicantData:[B

    const/4 v2, 0x0

    invoke-virtual {p1}, Landroid/app/backup/BackupDataInput;->getDataSize()I

    move-result v3

    invoke-virtual {p1, v1, v2, v3}, Landroid/app/backup/BackupDataInput;->readEntityData([BII)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 310
    :catch_0
    move-exception v0

    .line 311
    .local v0, e:Ljava/io/IOException;
    const-string v1, "SettingsBackupAgent"

    const-string v2, "Unable to read supplicant data"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->restoredSupplicantData:[B

    goto :goto_0
.end method

.method public run()V
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 329
    iget-object v2, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->restoredSupplicantData:[B

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->restoredWifiConfigFile:[B

    if-eqz v2, :cond_5

    .line 333
    :cond_0
    iget-object v2, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->this$0:Lcom/android/providers/settings/SettingsBackupAgent;

    #calls: Lcom/android/providers/settings/SettingsBackupAgent;->enableWifi(Z)I
    invoke-static {v2, v1}, Lcom/android/providers/settings/SettingsBackupAgent;->access$000(Lcom/android/providers/settings/SettingsBackupAgent;Z)I

    move-result v0

    .line 334
    .local v0, retainedWifiState:I
    iget-object v2, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->restoredSupplicantData:[B

    if-eqz v2, :cond_1

    .line 335
    iget-object v2, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->this$0:Lcom/android/providers/settings/SettingsBackupAgent;

    const-string v3, "/data/misc/wifi/wpa_supplicant.conf"

    iget-object v4, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->restoredSupplicantData:[B

    iget-object v5, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->restoredSupplicantData:[B

    array-length v5, v5

    #calls: Lcom/android/providers/settings/SettingsBackupAgent;->restoreWifiSupplicant(Ljava/lang/String;[BI)V
    invoke-static {v2, v3, v4, v5}, Lcom/android/providers/settings/SettingsBackupAgent;->access$100(Lcom/android/providers/settings/SettingsBackupAgent;Ljava/lang/String;[BI)V

    .line 337
    const-string v2, "/data/misc/wifi/wpa_supplicant.conf"

    const/16 v3, 0x1b0

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v4

    const/16 v5, 0x3f2

    invoke-static {v2, v3, v4, v5}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I

    .line 342
    :cond_1
    iget-object v2, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->restoredWifiConfigFile:[B

    if-eqz v2, :cond_2

    .line 343
    iget-object v2, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->this$0:Lcom/android/providers/settings/SettingsBackupAgent;

    invoke-static {}, Lcom/android/providers/settings/SettingsBackupAgent;->access$200()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->restoredWifiConfigFile:[B

    iget-object v5, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->restoredWifiConfigFile:[B

    array-length v5, v5

    #calls: Lcom/android/providers/settings/SettingsBackupAgent;->restoreFileData(Ljava/lang/String;[BI)V
    invoke-static {v2, v3, v4, v5}, Lcom/android/providers/settings/SettingsBackupAgent;->access$300(Lcom/android/providers/settings/SettingsBackupAgent;Ljava/lang/String;[BI)V

    .line 347
    :cond_2
    iget-object v2, p0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->this$0:Lcom/android/providers/settings/SettingsBackupAgent;

    const/4 v3, 0x3

    if-eq v0, v3, :cond_3

    const/4 v3, 0x2

    if-ne v0, v3, :cond_4

    :cond_3
    const/4 v1, 0x1

    :cond_4
    #calls: Lcom/android/providers/settings/SettingsBackupAgent;->enableWifi(Z)I
    invoke-static {v2, v1}, Lcom/android/providers/settings/SettingsBackupAgent;->access$000(Lcom/android/providers/settings/SettingsBackupAgent;Z)I

    .line 350
    .end local v0           #retainedWifiState:I
    :cond_5
    return-void
.end method
