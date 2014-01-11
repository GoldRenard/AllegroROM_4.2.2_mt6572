.class public Lcom/android/providers/settings/SettingsBackupAgent;
.super Landroid/app/backup/BackupAgentHelper;
.source "SettingsBackupAgent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;,
        Lcom/android/providers/settings/SettingsBackupAgent$WifiNetworkSettings;,
        Lcom/android/providers/settings/SettingsBackupAgent$Network;
    }
.end annotation


# static fields
.field private static final COLUMN_NAME:I = 0x1

.field private static final COLUMN_VALUE:I = 0x2

.field private static final DEBUG:Z = false

.field private static final DEBUG_BACKUP:Z = false

.field private static final EMPTY_DATA:[B = null

.field private static final FILE_WIFI_SUPPLICANT:Ljava/lang/String; = "/data/misc/wifi/wpa_supplicant.conf"

.field private static final FILE_WIFI_SUPPLICANT_TEMPLATE:Ljava/lang/String; = "/system/etc/wifi/wpa_supplicant.conf"

.field private static final FULL_BACKUP_ADDED_GLOBAL:I = 0x2

.field private static final FULL_BACKUP_VERSION:I = 0x2

.field private static final INTEGER_BYTE_COUNT:I = 0x4

.field private static final KEY_GLOBAL:Ljava/lang/String; = "global"

.field private static final KEY_LOCALE:Ljava/lang/String; = "locale"

.field private static final KEY_SECURE:Ljava/lang/String; = "secure"

.field private static final KEY_SYSTEM:Ljava/lang/String; = "system"

.field private static final KEY_WIFI_CONFIG:Ljava/lang/String; = "\uffedCONFIG_WIFI"

.field private static final KEY_WIFI_SUPPLICANT:Ljava/lang/String; = "\uffedWIFI"

.field private static final PROJECTION:[Ljava/lang/String; = null

.field private static final STAGE_FILE:Ljava/lang/String; = "flattened-data"

.field private static final STATE_GLOBAL:I = 0x5

.field private static final STATE_LOCALE:I = 0x2

.field private static final STATE_SECURE:I = 0x1

.field private static final STATE_SIZE:I = 0x6

.field private static final STATE_SIZES:[I = null

.field private static final STATE_SYSTEM:I = 0x0

.field private static final STATE_VERSION:I = 0x3

.field private static final STATE_WIFI_CONFIG:I = 0x4

.field private static final STATE_WIFI_SUPPLICANT:I = 0x3

.field private static final TAG:Ljava/lang/String; = "SettingsBackupAgent"

.field private static final WIFI_BOUNCE_DELAY_MILLIS:J = 0xea60L

.field private static mWifiConfigFile:Ljava/lang/String;


# instance fields
.field private mSettingsHelper:Lcom/android/providers/settings/SettingsHelper;

.field private mWfm:Landroid/net/wifi/WifiManager;

.field mWifiRestore:Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 86
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/providers/settings/SettingsBackupAgent;->STATE_SIZES:[I

    .line 99
    new-array v0, v2, [B

    sput-object v0, Lcom/android/providers/settings/SettingsBackupAgent;->EMPTY_DATA:[B

    .line 106
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v2

    const/4 v1, 0x1

    const-string v2, "name"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "value"

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/providers/settings/SettingsBackupAgent;->PROJECTION:[Ljava/lang/String;

    return-void

    .line 86
    nop

    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x4t 0x0t 0x0t 0x0t
        0x5t 0x0t 0x0t 0x0t
        0x6t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 61
    invoke-direct {p0}, Landroid/app/backup/BackupAgentHelper;-><init>()V

    .line 133
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/providers/settings/SettingsBackupAgent;->mWifiRestore:Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;

    .line 301
    return-void
.end method

.method static synthetic access$000(Lcom/android/providers/settings/SettingsBackupAgent;Z)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 61
    invoke-direct {p0, p1}, Lcom/android/providers/settings/SettingsBackupAgent;->enableWifi(Z)I

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/android/providers/settings/SettingsBackupAgent;Ljava/lang/String;[BI)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 61
    invoke-direct {p0, p1, p2, p3}, Lcom/android/providers/settings/SettingsBackupAgent;->restoreWifiSupplicant(Ljava/lang/String;[BI)V

    return-void
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lcom/android/providers/settings/SettingsBackupAgent;->mWifiConfigFile:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/providers/settings/SettingsBackupAgent;Ljava/lang/String;[BI)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 61
    invoke-direct {p0, p1, p2, p3}, Lcom/android/providers/settings/SettingsBackupAgent;->restoreFileData(Ljava/lang/String;[BI)V

    return-void
.end method

.method private copyWifiSupplicantTemplate(Ljava/io/BufferedWriter;)V
    .locals 6
    .parameter "bw"

    .prologue
    .line 888
    :try_start_0
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/FileReader;

    const-string v5, "/system/etc/wifi/wpa_supplicant.conf"

    invoke-direct {v4, v5}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 889
    .local v0, br:Ljava/io/BufferedReader;
    const/16 v4, 0x400

    new-array v3, v4, [C

    .line 891
    .local v3, temp:[C
    :goto_0
    invoke-virtual {v0, v3}, Ljava/io/BufferedReader;->read([C)I

    move-result v2

    .local v2, size:I
    if-lez v2, :cond_0

    .line 892
    const/4 v4, 0x0

    invoke-virtual {p1, v3, v4, v2}, Ljava/io/BufferedWriter;->write([CII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 895
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v2           #size:I
    .end local v3           #temp:[C
    :catch_0
    move-exception v1

    .line 896
    .local v1, ioe:Ljava/io/IOException;
    const-string v4, "SettingsBackupAgent"

    const-string v5, "Couldn\'t copy wpa_supplicant file"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 898
    .end local v1           #ioe:Ljava/io/IOException;
    :goto_1
    return-void

    .line 894
    .restart local v0       #br:Ljava/io/BufferedReader;
    .restart local v2       #size:I
    .restart local v3       #temp:[C
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private enableWifi(Z)I
    .locals 3
    .parameter "enable"

    .prologue
    .line 930
    iget-object v1, p0, Lcom/android/providers/settings/SettingsBackupAgent;->mWfm:Landroid/net/wifi/WifiManager;

    if-nez v1, :cond_0

    .line 931
    const-string v1, "wifi"

    invoke-virtual {p0, v1}, Lcom/android/providers/settings/SettingsBackupAgent;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiManager;

    iput-object v1, p0, Lcom/android/providers/settings/SettingsBackupAgent;->mWfm:Landroid/net/wifi/WifiManager;

    .line 933
    :cond_0
    iget-object v1, p0, Lcom/android/providers/settings/SettingsBackupAgent;->mWfm:Landroid/net/wifi/WifiManager;

    if-eqz v1, :cond_1

    .line 934
    iget-object v1, p0, Lcom/android/providers/settings/SettingsBackupAgent;->mWfm:Landroid/net/wifi/WifiManager;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->getWifiState()I

    move-result v0

    .line 935
    .local v0, state:I
    iget-object v1, p0, Lcom/android/providers/settings/SettingsBackupAgent;->mWfm:Landroid/net/wifi/WifiManager;

    invoke-virtual {v1, p1}, Landroid/net/wifi/WifiManager;->setWifiEnabled(Z)Z

    .line 940
    .end local v0           #state:I
    :goto_0
    return v0

    .line 938
    :cond_1
    const-string v1, "SettingsBackupAgent"

    const-string v2, "Failed to fetch WifiManager instance"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 940
    const/4 v0, 0x4

    goto :goto_0
.end method

.method private extractRelevantValues(Landroid/database/Cursor;[Ljava/lang/String;)[B
    .locals 19
    .parameter "cursor"
    .parameter "settings"

    .prologue
    .line 698
    move-object/from16 v0, p2

    array-length v12, v0

    .line 699
    .local v12, settingsCount:I
    mul-int/lit8 v17, v12, 0x2

    move/from16 v0, v17

    new-array v0, v0, [[B

    move-object/from16 v16, v0

    .line 700
    .local v16, values:[[B
    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v17

    if-nez v17, :cond_1

    .line 701
    const-string v17, "SettingsBackupAgent"

    const-string v18, "Couldn\'t read from the cursor"

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 702
    const/16 v17, 0x0

    move/from16 v0, v17

    new-array v11, v0, [B

    .line 755
    :cond_0
    return-object v11

    .line 706
    :cond_1
    const/4 v13, 0x0

    .line 707
    .local v13, totalSize:I
    const/4 v2, 0x0

    .line 708
    .local v2, backedUpSettingIndex:I
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 709
    .local v3, cachedEntries:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v6, 0x0

    .local v6, i:I
    :goto_0
    if-ge v6, v12, :cond_5

    .line 710
    aget-object v7, p2, v6

    .line 711
    .local v7, key:Ljava/lang/String;
    invoke-interface {v3, v7}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    .line 714
    .local v14, value:Ljava/lang/String;
    if-nez v14, :cond_2

    .line 715
    :goto_1
    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v17

    if-nez v17, :cond_2

    .line 716
    const/16 v17, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 717
    .local v4, cursorKey:Ljava/lang/String;
    const/16 v17, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 718
    .local v5, cursorValue:Ljava/lang/String;
    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->moveToNext()Z

    .line 719
    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_3

    .line 720
    move-object v14, v5

    .line 727
    .end local v4           #cursorKey:Ljava/lang/String;
    .end local v5           #cursorValue:Ljava/lang/String;
    :cond_2
    if-nez v14, :cond_4

    .line 709
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 723
    .restart local v4       #cursorKey:Ljava/lang/String;
    .restart local v5       #cursorValue:Ljava/lang/String;
    :cond_3
    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 732
    .end local v4           #cursorKey:Ljava/lang/String;
    .end local v5           #cursorValue:Ljava/lang/String;
    :cond_4
    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    .line 733
    .local v8, keyBytes:[B
    array-length v0, v8

    move/from16 v17, v0

    add-int/lit8 v17, v17, 0x4

    add-int v13, v13, v17

    .line 734
    mul-int/lit8 v17, v2, 0x2

    aput-object v8, v16, v17

    .line 736
    invoke-virtual {v14}, Ljava/lang/String;->getBytes()[B

    move-result-object v15

    .line 737
    .local v15, valueBytes:[B
    array-length v0, v15

    move/from16 v17, v0

    add-int/lit8 v17, v17, 0x4

    add-int v13, v13, v17

    .line 738
    mul-int/lit8 v17, v2, 0x2

    add-int/lit8 v17, v17, 0x1

    aput-object v15, v16, v17

    .line 740
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 748
    .end local v7           #key:Ljava/lang/String;
    .end local v8           #keyBytes:[B
    .end local v14           #value:Ljava/lang/String;
    .end local v15           #valueBytes:[B
    :cond_5
    new-array v11, v13, [B

    .line 749
    .local v11, result:[B
    const/4 v10, 0x0

    .line 750
    .local v10, pos:I
    mul-int/lit8 v9, v2, 0x2

    .line 751
    .local v9, keyValuePairCount:I
    const/4 v6, 0x0

    :goto_3
    if-ge v6, v9, :cond_0

    .line 752
    aget-object v17, v16, v6

    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v17, v0

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v11, v10, v1}, Lcom/android/providers/settings/SettingsBackupAgent;->writeInt([BII)I

    move-result v10

    .line 753
    aget-object v17, v16, v6

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v11, v10, v1}, Lcom/android/providers/settings/SettingsBackupAgent;->writeBytes([BI[B)I

    move-result v10

    .line 751
    add-int/lit8 v6, v6, 0x1

    goto :goto_3
.end method

.method private getFileData(Ljava/lang/String;)[B
    .locals 10
    .parameter "filename"

    .prologue
    .line 759
    const/4 v3, 0x0

    .line 761
    .local v3, is:Ljava/io/InputStream;
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 762
    .local v1, file:Ljava/io/File;
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 766
    .end local v3           #is:Ljava/io/InputStream;
    .local v4, is:Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v7

    long-to-int v7, v7

    new-array v0, v7, [B

    .line 768
    .local v0, bytes:[B
    const/4 v6, 0x0

    .line 769
    .local v6, offset:I
    const/4 v5, 0x0

    .line 771
    .local v5, numRead:I
    :goto_0
    array-length v7, v0

    if-ge v6, v7, :cond_0

    array-length v7, v0

    sub-int/2addr v7, v6

    invoke-virtual {v4, v0, v6, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    if-ltz v5, :cond_0

    .line 772
    add-int/2addr v6, v5

    goto :goto_0

    .line 776
    :cond_0
    array-length v7, v0

    if-ge v6, v7, :cond_3

    .line 777
    const-string v7, "SettingsBackupAgent"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Couldn\'t backup "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 778
    sget-object v0, Lcom/android/providers/settings/SettingsBackupAgent;->EMPTY_DATA:[B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5

    .line 785
    .end local v0           #bytes:[B
    if-eqz v4, :cond_1

    .line 787
    :try_start_2
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    :cond_1
    :goto_1
    move-object v3, v4

    .line 789
    .end local v1           #file:Ljava/io/File;
    .end local v4           #is:Ljava/io/InputStream;
    .end local v5           #numRead:I
    .end local v6           #offset:I
    .restart local v3       #is:Ljava/io/InputStream;
    :cond_2
    :goto_2
    return-object v0

    .line 785
    .end local v3           #is:Ljava/io/InputStream;
    .restart local v0       #bytes:[B
    .restart local v1       #file:Ljava/io/File;
    .restart local v4       #is:Ljava/io/InputStream;
    .restart local v5       #numRead:I
    .restart local v6       #offset:I
    :cond_3
    if-eqz v4, :cond_4

    .line 787
    :try_start_3
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    :cond_4
    :goto_3
    move-object v3, v4

    .line 789
    .end local v4           #is:Ljava/io/InputStream;
    .restart local v3       #is:Ljava/io/InputStream;
    goto :goto_2

    .line 781
    .end local v0           #bytes:[B
    .end local v1           #file:Ljava/io/File;
    .end local v5           #numRead:I
    .end local v6           #offset:I
    :catch_0
    move-exception v2

    .line 782
    .local v2, ioe:Ljava/io/IOException;
    :goto_4
    :try_start_4
    const-string v7, "SettingsBackupAgent"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Couldn\'t backup "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 783
    sget-object v0, Lcom/android/providers/settings/SettingsBackupAgent;->EMPTY_DATA:[B
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 785
    if-eqz v3, :cond_2

    .line 787
    :try_start_5
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_2

    .line 788
    :catch_1
    move-exception v7

    goto :goto_2

    .line 785
    .end local v2           #ioe:Ljava/io/IOException;
    :catchall_0
    move-exception v7

    :goto_5
    if-eqz v3, :cond_5

    .line 787
    :try_start_6
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 789
    :cond_5
    :goto_6
    throw v7

    .line 788
    .end local v3           #is:Ljava/io/InputStream;
    .restart local v1       #file:Ljava/io/File;
    .restart local v4       #is:Ljava/io/InputStream;
    .restart local v5       #numRead:I
    .restart local v6       #offset:I
    :catch_2
    move-exception v7

    goto :goto_1

    .restart local v0       #bytes:[B
    :catch_3
    move-exception v7

    goto :goto_3

    .end local v0           #bytes:[B
    .end local v1           #file:Ljava/io/File;
    .end local v4           #is:Ljava/io/InputStream;
    .end local v5           #numRead:I
    .end local v6           #offset:I
    .restart local v3       #is:Ljava/io/InputStream;
    :catch_4
    move-exception v8

    goto :goto_6

    .line 785
    .end local v3           #is:Ljava/io/InputStream;
    .restart local v1       #file:Ljava/io/File;
    .restart local v4       #is:Ljava/io/InputStream;
    :catchall_1
    move-exception v7

    move-object v3, v4

    .end local v4           #is:Ljava/io/InputStream;
    .restart local v3       #is:Ljava/io/InputStream;
    goto :goto_5

    .line 781
    .end local v3           #is:Ljava/io/InputStream;
    .restart local v4       #is:Ljava/io/InputStream;
    :catch_5
    move-exception v2

    move-object v3, v4

    .end local v4           #is:Ljava/io/InputStream;
    .restart local v3       #is:Ljava/io/InputStream;
    goto :goto_4
.end method

.method private getGlobalSettings()[B
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 598
    invoke-virtual {p0}, Lcom/android/providers/settings/SettingsBackupAgent;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/Settings$Global;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/android/providers/settings/SettingsBackupAgent;->PROJECTION:[Ljava/lang/String;

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 601
    .local v6, cursor:Landroid/database/Cursor;
    :try_start_0
    sget-object v0, Landroid/provider/Settings$Global;->SETTINGS_TO_BACKUP:[Ljava/lang/String;

    invoke-direct {p0, v6, v0}, Lcom/android/providers/settings/SettingsBackupAgent;->extractRelevantValues(Landroid/database/Cursor;[Ljava/lang/String;)[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 603
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method private getSecureSettings()[B
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 588
    invoke-virtual {p0}, Lcom/android/providers/settings/SettingsBackupAgent;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/Settings$Secure;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/android/providers/settings/SettingsBackupAgent;->PROJECTION:[Ljava/lang/String;

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 591
    .local v6, cursor:Landroid/database/Cursor;
    :try_start_0
    sget-object v0, Landroid/provider/Settings$Secure;->SETTINGS_TO_BACKUP:[Ljava/lang/String;

    invoke-direct {p0, v6, v0}, Lcom/android/providers/settings/SettingsBackupAgent;->extractRelevantValues(Landroid/database/Cursor;[Ljava/lang/String;)[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 593
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method private getSystemSettings()[B
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 578
    invoke-virtual {p0}, Lcom/android/providers/settings/SettingsBackupAgent;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/Settings$System;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/android/providers/settings/SettingsBackupAgent;->PROJECTION:[Ljava/lang/String;

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 581
    .local v6, cursor:Landroid/database/Cursor;
    :try_start_0
    sget-object v0, Landroid/provider/Settings$System;->SETTINGS_TO_BACKUP:[Ljava/lang/String;

    invoke-direct {p0, v6, v0}, Lcom/android/providers/settings/SettingsBackupAgent;->extractRelevantValues(Landroid/database/Cursor;[Ljava/lang/String;)[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 583
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method private getWifiSupplicant(Ljava/lang/String;)[B
    .locals 10
    .parameter "filename"

    .prologue
    .line 810
    const/4 v0, 0x0

    .line 812
    .local v0, br:Ljava/io/BufferedReader;
    :try_start_0
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 813
    .local v2, file:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 814
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/FileReader;

    invoke-direct {v7, v2}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_6

    .line 815
    .end local v0           #br:Ljava/io/BufferedReader;
    .local v1, br:Ljava/io/BufferedReader;
    :try_start_1
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 816
    .local v5, relevantLines:Ljava/lang/StringBuffer;
    const/4 v6, 0x0

    .line 818
    .local v6, started:Z
    :cond_0
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .local v4, line:Ljava/lang/String;
    if-eqz v4, :cond_3

    .line 819
    if-nez v6, :cond_1

    const-string v7, "network"

    invoke-virtual {v4, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 820
    const/4 v6, 0x1

    .line 822
    :cond_1
    if-eqz v6, :cond_0

    .line 823
    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 834
    .end local v4           #line:Ljava/lang/String;
    .end local v5           #relevantLines:Ljava/lang/StringBuffer;
    .end local v6           #started:Z
    :catch_0
    move-exception v3

    move-object v0, v1

    .line 835
    .end local v1           #br:Ljava/io/BufferedReader;
    .end local v2           #file:Ljava/io/File;
    .restart local v0       #br:Ljava/io/BufferedReader;
    .local v3, ioe:Ljava/io/IOException;
    :goto_1
    :try_start_2
    const-string v7, "SettingsBackupAgent"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Couldn\'t backup "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 836
    sget-object v7, Lcom/android/providers/settings/SettingsBackupAgent;->EMPTY_DATA:[B
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 838
    if-eqz v0, :cond_2

    .line 840
    :try_start_3
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4

    .line 842
    .end local v3           #ioe:Ljava/io/IOException;
    :cond_2
    :goto_2
    return-object v7

    .line 826
    .end local v0           #br:Ljava/io/BufferedReader;
    .restart local v1       #br:Ljava/io/BufferedReader;
    .restart local v2       #file:Ljava/io/File;
    .restart local v4       #line:Ljava/lang/String;
    .restart local v5       #relevantLines:Ljava/lang/StringBuffer;
    .restart local v6       #started:Z
    :cond_3
    :try_start_4
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v7

    if-lez v7, :cond_5

    .line 827
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    move-result-object v7

    .line 838
    if-eqz v1, :cond_4

    .line 840
    :try_start_5
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    :cond_4
    :goto_3
    move-object v0, v1

    .line 842
    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    goto :goto_2

    .line 829
    .end local v0           #br:Ljava/io/BufferedReader;
    .restart local v1       #br:Ljava/io/BufferedReader;
    :cond_5
    :try_start_6
    sget-object v7, Lcom/android/providers/settings/SettingsBackupAgent;->EMPTY_DATA:[B
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    .line 838
    if-eqz v1, :cond_6

    .line 840
    :try_start_7
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    :cond_6
    :goto_4
    move-object v0, v1

    .line 842
    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    goto :goto_2

    .line 832
    .end local v4           #line:Ljava/lang/String;
    .end local v5           #relevantLines:Ljava/lang/StringBuffer;
    .end local v6           #started:Z
    :cond_7
    :try_start_8
    sget-object v7, Lcom/android/providers/settings/SettingsBackupAgent;->EMPTY_DATA:[B
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6

    .line 838
    if-eqz v0, :cond_2

    .line 840
    :try_start_9
    throw v0
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_1

    goto :goto_2

    .line 841
    :catch_1
    move-exception v8

    goto :goto_2

    .line 838
    .end local v2           #file:Ljava/io/File;
    :catchall_0
    move-exception v7

    :goto_5
    if-eqz v0, :cond_8

    .line 840
    :try_start_a
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_5

    .line 842
    :cond_8
    :goto_6
    throw v7

    .line 841
    .end local v0           #br:Ljava/io/BufferedReader;
    .restart local v1       #br:Ljava/io/BufferedReader;
    .restart local v2       #file:Ljava/io/File;
    .restart local v4       #line:Ljava/lang/String;
    .restart local v5       #relevantLines:Ljava/lang/StringBuffer;
    .restart local v6       #started:Z
    :catch_2
    move-exception v8

    goto :goto_3

    :catch_3
    move-exception v8

    goto :goto_4

    .end local v1           #br:Ljava/io/BufferedReader;
    .end local v2           #file:Ljava/io/File;
    .end local v4           #line:Ljava/lang/String;
    .end local v5           #relevantLines:Ljava/lang/StringBuffer;
    .end local v6           #started:Z
    .restart local v0       #br:Ljava/io/BufferedReader;
    .restart local v3       #ioe:Ljava/io/IOException;
    :catch_4
    move-exception v8

    goto :goto_2

    .end local v3           #ioe:Ljava/io/IOException;
    :catch_5
    move-exception v8

    goto :goto_6

    .line 838
    .end local v0           #br:Ljava/io/BufferedReader;
    .restart local v1       #br:Ljava/io/BufferedReader;
    .restart local v2       #file:Ljava/io/File;
    :catchall_1
    move-exception v7

    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    goto :goto_5

    .line 834
    .end local v2           #file:Ljava/io/File;
    :catch_6
    move-exception v3

    goto :goto_1
.end method

.method private readInt([BI)I
    .locals 3
    .parameter "in"
    .parameter "pos"

    .prologue
    .line 921
    aget-byte v1, p1, p2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    add-int/lit8 v2, p2, 0x1

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x10

    or-int/2addr v1, v2

    add-int/lit8 v2, p2, 0x2

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v1, v2

    add-int/lit8 v2, p2, 0x3

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x0

    or-int v0, v1, v2

    .line 926
    .local v0, result:I
    return v0
.end method

.method private readOldChecksums(Landroid/os/ParcelFileDescriptor;)[J
    .locals 6
    .parameter "oldState"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 530
    const/4 v4, 0x6

    new-array v2, v4, [J

    .line 532
    .local v2, stateChecksums:[J
    new-instance v0, Ljava/io/DataInputStream;

    new-instance v4, Ljava/io/FileInputStream;

    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    invoke-direct {v0, v4}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 536
    .local v0, dataInput:Ljava/io/DataInputStream;
    :try_start_0
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v3

    .line 537
    .local v3, stateVersion:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    sget-object v4, Lcom/android/providers/settings/SettingsBackupAgent;->STATE_SIZES:[I

    aget v4, v4, v3

    if-ge v1, v4, :cond_0

    .line 538
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v4

    aput-wide v4, v2, v1
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 537
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 540
    .end local v1           #i:I
    .end local v3           #stateVersion:I
    :catch_0
    move-exception v4

    .line 544
    :cond_0
    invoke-virtual {v0}, Ljava/io/DataInputStream;->close()V

    .line 545
    return-object v2
.end method

.method private restoreFileData(Ljava/lang/String;[BI)V
    .locals 6
    .parameter "filename"
    .parameter "bytes"
    .parameter "size"

    .prologue
    .line 797
    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 798
    .local v0, file:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 800
    :cond_0
    new-instance v2, Ljava/io/BufferedOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    const/4 v4, 0x1

    invoke-direct {v3, p1, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    invoke-direct {v2, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 801
    .local v2, os:Ljava/io/OutputStream;
    const/4 v3, 0x0

    invoke-virtual {v2, p2, v3, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 802
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 806
    .end local v0           #file:Ljava/io/File;
    .end local v2           #os:Ljava/io/OutputStream;
    :goto_0
    return-void

    .line 803
    :catch_0
    move-exception v1

    .line 804
    .local v1, ioe:Ljava/io/IOException;
    const-string v3, "SettingsBackupAgent"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Couldn\'t restore "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private restoreSettings(Landroid/app/backup/BackupDataInput;Landroid/net/Uri;Ljava/util/HashSet;)V
    .locals 4
    .parameter "data"
    .parameter "contentUri"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/backup/BackupDataInput;",
            "Landroid/net/Uri;",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 609
    .local p3, movedToGlobal:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {p1}, Landroid/app/backup/BackupDataInput;->getDataSize()I

    move-result v2

    new-array v1, v2, [B

    .line 611
    .local v1, settings:[B
    const/4 v2, 0x0

    :try_start_0
    array-length v3, v1

    invoke-virtual {p1, v1, v2, v3}, Landroid/app/backup/BackupDataInput;->readEntityData([BII)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 616
    array-length v2, v1

    invoke-direct {p0, v1, v2, p2, p3}, Lcom/android/providers/settings/SettingsBackupAgent;->restoreSettings([BILandroid/net/Uri;Ljava/util/HashSet;)V

    .line 617
    :goto_0
    return-void

    .line 612
    :catch_0
    move-exception v0

    .line 613
    .local v0, ioe:Ljava/io/IOException;
    const-string v2, "SettingsBackupAgent"

    const-string v3, "Couldn\'t read entity data"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private restoreSettings([BILandroid/net/Uri;Ljava/util/HashSet;)V
    .locals 18
    .parameter "settings"
    .parameter "bytes"
    .parameter "contentUri"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BI",
            "Landroid/net/Uri;",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 626
    .local p4, movedToGlobal:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    const/4 v14, 0x0

    .line 627
    .local v14, whitelist:[Ljava/lang/String;
    sget-object v15, Landroid/provider/Settings$Secure;->CONTENT_URI:Landroid/net/Uri;

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_2

    .line 628
    sget-object v14, Landroid/provider/Settings$Secure;->SETTINGS_TO_BACKUP:[Ljava/lang/String;

    .line 638
    :goto_0
    const/4 v10, 0x0

    .line 639
    .local v10, pos:I
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 640
    .local v2, cachedEntries:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v3, Landroid/content/ContentValues;

    const/4 v15, 0x2

    invoke-direct {v3, v15}, Landroid/content/ContentValues;-><init>(I)V

    .line 641
    .local v3, contentValues:Landroid/content/ContentValues;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/providers/settings/SettingsBackupAgent;->mSettingsHelper:Lcom/android/providers/settings/SettingsHelper;

    .line 643
    .local v11, settingsHelper:Lcom/android/providers/settings/SettingsHelper;
    array-length v13, v14

    .line 644
    .local v13, whiteListSize:I
    const/4 v7, 0x0

    .local v7, i:I
    :goto_1
    if-ge v7, v13, :cond_a

    .line 645
    aget-object v8, v14, v7

    .line 646
    .local v8, key:Ljava/lang/String;
    invoke-interface {v2, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 649
    .local v12, value:Ljava/lang/String;
    if-nez v12, :cond_0

    .line 650
    :goto_2
    move/from16 v0, p2

    if-ge v10, v0, :cond_0

    .line 651
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v10}, Lcom/android/providers/settings/SettingsBackupAgent;->readInt([BI)I

    move-result v9

    .line 652
    .local v9, length:I
    add-int/lit8 v10, v10, 0x4

    .line 653
    if-lez v9, :cond_5

    new-instance v4, Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-direct {v4, v0, v10, v9}, Ljava/lang/String;-><init>([BII)V

    .line 654
    .local v4, dataKey:Ljava/lang/String;
    :goto_3
    add-int/2addr v10, v9

    .line 655
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v10}, Lcom/android/providers/settings/SettingsBackupAgent;->readInt([BI)I

    move-result v9

    .line 656
    add-int/lit8 v10, v10, 0x4

    .line 657
    if-lez v9, :cond_6

    new-instance v5, Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-direct {v5, v0, v10, v9}, Ljava/lang/String;-><init>([BII)V

    .line 658
    .local v5, dataValue:Ljava/lang/String;
    :goto_4
    add-int/2addr v10, v9

    .line 659
    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_7

    .line 660
    move-object v12, v5

    .line 667
    .end local v4           #dataKey:Ljava/lang/String;
    .end local v5           #dataValue:Ljava/lang/String;
    .end local v9           #length:I
    :cond_0
    if-nez v12, :cond_8

    .line 644
    :cond_1
    :goto_5
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 629
    .end local v2           #cachedEntries:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3           #contentValues:Landroid/content/ContentValues;
    .end local v7           #i:I
    .end local v8           #key:Ljava/lang/String;
    .end local v10           #pos:I
    .end local v11           #settingsHelper:Lcom/android/providers/settings/SettingsHelper;
    .end local v12           #value:Ljava/lang/String;
    .end local v13           #whiteListSize:I
    :cond_2
    sget-object v15, Landroid/provider/Settings$System;->CONTENT_URI:Landroid/net/Uri;

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_3

    .line 630
    sget-object v14, Landroid/provider/Settings$System;->SETTINGS_TO_BACKUP:[Ljava/lang/String;

    goto :goto_0

    .line 631
    :cond_3
    sget-object v15, Landroid/provider/Settings$Global;->CONTENT_URI:Landroid/net/Uri;

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_4

    .line 632
    sget-object v14, Landroid/provider/Settings$Global;->SETTINGS_TO_BACKUP:[Ljava/lang/String;

    goto :goto_0

    .line 634
    :cond_4
    new-instance v15, Ljava/lang/IllegalArgumentException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Unknown URI: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 653
    .restart local v2       #cachedEntries:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v3       #contentValues:Landroid/content/ContentValues;
    .restart local v7       #i:I
    .restart local v8       #key:Ljava/lang/String;
    .restart local v9       #length:I
    .restart local v10       #pos:I
    .restart local v11       #settingsHelper:Lcom/android/providers/settings/SettingsHelper;
    .restart local v12       #value:Ljava/lang/String;
    .restart local v13       #whiteListSize:I
    :cond_5
    const/4 v4, 0x0

    goto :goto_3

    .line 657
    .restart local v4       #dataKey:Ljava/lang/String;
    :cond_6
    const/4 v5, 0x0

    goto :goto_4

    .line 663
    .restart local v5       #dataValue:Ljava/lang/String;
    :cond_7
    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 671
    .end local v4           #dataKey:Ljava/lang/String;
    .end local v5           #dataValue:Ljava/lang/String;
    .end local v9           #length:I
    :cond_8
    if-eqz p4, :cond_9

    move-object/from16 v0, p4

    invoke-virtual {v0, v8}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_9

    sget-object v6, Landroid/provider/Settings$Global;->CONTENT_URI:Landroid/net/Uri;

    .line 676
    .local v6, destination:Landroid/net/Uri;
    :goto_6
    invoke-virtual {v11, v8, v12}, Lcom/android/providers/settings/SettingsHelper;->restoreValue(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_1

    .line 677
    invoke-virtual {v3}, Landroid/content/ContentValues;->clear()V

    .line 678
    const-string v15, "name"

    invoke-virtual {v3, v15, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 679
    const-string v15, "value"

    invoke-virtual {v3, v15, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 680
    invoke-virtual/range {p0 .. p0}, Lcom/android/providers/settings/SettingsBackupAgent;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v15

    invoke-virtual {v15, v6, v3}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    goto :goto_5

    .end local v6           #destination:Landroid/net/Uri;
    :cond_9
    move-object/from16 v6, p3

    .line 671
    goto :goto_6

    .line 687
    .end local v8           #key:Ljava/lang/String;
    .end local v12           #value:Ljava/lang/String;
    :cond_a
    return-void
.end method

.method private restoreWifiSupplicant(Ljava/lang/String;[BI)V
    .locals 10
    .parameter "filename"
    .parameter "bytes"
    .parameter "size"

    .prologue
    .line 849
    :try_start_0
    new-instance v6, Lcom/android/providers/settings/SettingsBackupAgent$WifiNetworkSettings;

    invoke-direct {v6, p0}, Lcom/android/providers/settings/SettingsBackupAgent$WifiNetworkSettings;-><init>(Lcom/android/providers/settings/SettingsBackupAgent;)V

    .line 851
    .local v6, supplicantImage:Lcom/android/providers/settings/SettingsBackupAgent$WifiNetworkSettings;
    new-instance v5, Ljava/io/File;

    const-string v7, "/data/misc/wifi/wpa_supplicant.conf"

    invoke-direct {v5, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 852
    .local v5, supplicantFile:Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 854
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/FileReader;

    const-string v8, "/data/misc/wifi/wpa_supplicant.conf"

    invoke-direct {v7, v8}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 855
    .local v2, in:Ljava/io/BufferedReader;
    invoke-virtual {v6, v2}, Lcom/android/providers/settings/SettingsBackupAgent$WifiNetworkSettings;->readNetworks(Ljava/io/BufferedReader;)V

    .line 856
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 858
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 862
    .end local v2           #in:Ljava/io/BufferedReader;
    :cond_0
    if-lez p3, :cond_2

    .line 863
    new-array v4, p3, [C

    .line 864
    .local v4, restoredAsBytes:[C
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, p3, :cond_1

    aget-byte v7, p2, v1

    int-to-char v7, v7

    aput-char v7, v4, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 865
    :cond_1
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/CharArrayReader;

    invoke-direct {v7, v4}, Ljava/io/CharArrayReader;-><init>([C)V

    invoke-direct {v2, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 866
    .restart local v2       #in:Ljava/io/BufferedReader;
    invoke-virtual {v6, v2}, Lcom/android/providers/settings/SettingsBackupAgent$WifiNetworkSettings;->readNetworks(Ljava/io/BufferedReader;)V

    .line 875
    .end local v1           #i:I
    .end local v2           #in:Ljava/io/BufferedReader;
    .end local v4           #restoredAsBytes:[C
    :cond_2
    new-instance v0, Ljava/io/BufferedWriter;

    new-instance v7, Ljava/io/FileWriter;

    const-string v8, "/data/misc/wifi/wpa_supplicant.conf"

    invoke-direct {v7, v8}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v7}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 876
    .local v0, bw:Ljava/io/BufferedWriter;
    invoke-direct {p0, v0}, Lcom/android/providers/settings/SettingsBackupAgent;->copyWifiSupplicantTemplate(Ljava/io/BufferedWriter;)V

    .line 879
    invoke-virtual {v6, v0}, Lcom/android/providers/settings/SettingsBackupAgent$WifiNetworkSettings;->write(Ljava/io/Writer;)V

    .line 880
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 884
    .end local v0           #bw:Ljava/io/BufferedWriter;
    .end local v5           #supplicantFile:Ljava/io/File;
    .end local v6           #supplicantImage:Lcom/android/providers/settings/SettingsBackupAgent$WifiNetworkSettings;
    :goto_1
    return-void

    .line 881
    :catch_0
    move-exception v3

    .line 882
    .local v3, ioe:Ljava/io/IOException;
    const-string v7, "SettingsBackupAgent"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Couldn\'t restore "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private writeBytes([BI[B)I
    .locals 2
    .parameter "out"
    .parameter "pos"
    .parameter "value"

    .prologue
    .line 916
    const/4 v0, 0x0

    array-length v1, p3

    invoke-static {p3, v0, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 917
    array-length v0, p3

    add-int/2addr v0, p2

    return v0
.end method

.method private writeIfChanged(JLjava/lang/String;[BLandroid/app/backup/BackupDataOutput;)J
    .locals 4
    .parameter "oldChecksum"
    .parameter "key"
    .parameter "data"
    .parameter "output"

    .prologue
    .line 562
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    .line 563
    .local v0, checkSummer:Ljava/util/zip/CRC32;
    invoke-virtual {v0, p4}, Ljava/util/zip/CRC32;->update([B)V

    .line 564
    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v1

    .line 565
    .local v1, newChecksum:J
    cmp-long v3, p1, v1

    if-nez v3, :cond_0

    .line 574
    .end local p1
    :goto_0
    return-wide p1

    .line 569
    .restart local p1
    :cond_0
    :try_start_0
    array-length v3, p4

    invoke-virtual {p5, p3, v3}, Landroid/app/backup/BackupDataOutput;->writeEntityHeader(Ljava/lang/String;I)I

    .line 570
    array-length v3, p4

    invoke-virtual {p5, p4, v3}, Landroid/app/backup/BackupDataOutput;->writeEntityData([BI)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    move-wide p1, v1

    .line 574
    goto :goto_0

    .line 571
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method private writeInt([BII)I
    .locals 2
    .parameter "out"
    .parameter "pos"
    .parameter "value"

    .prologue
    .line 908
    add-int/lit8 v0, p2, 0x0

    shr-int/lit8 v1, p3, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 909
    add-int/lit8 v0, p2, 0x1

    shr-int/lit8 v1, p3, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 910
    add-int/lit8 v0, p2, 0x2

    shr-int/lit8 v1, p3, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 911
    add-int/lit8 v0, p2, 0x3

    shr-int/lit8 v1, p3, 0x0

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 912
    add-int/lit8 v0, p2, 0x4

    return v0
.end method

.method private writeNewChecksums([JLandroid/os/ParcelFileDescriptor;)V
    .locals 4
    .parameter "checksums"
    .parameter "newState"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 550
    new-instance v0, Ljava/io/DataOutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-virtual {p2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V

    invoke-direct {v0, v2}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 553
    .local v0, dataOutput:Ljava/io/DataOutputStream;
    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 554
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    const/4 v2, 0x6

    if-ge v1, v2, :cond_0

    .line 555
    aget-wide v2, p1, v1

    invoke-virtual {v0, v2, v3}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 554
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 557
    :cond_0
    invoke-virtual {v0}, Ljava/io/DataOutputStream;->close()V

    .line 558
    return-void
.end method


# virtual methods
.method initWifiRestoreIfNecessary()V
    .locals 1

    .prologue
    .line 356
    iget-object v0, p0, Lcom/android/providers/settings/SettingsBackupAgent;->mWifiRestore:Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;

    if-nez v0, :cond_0

    .line 357
    new-instance v0, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;

    invoke-direct {v0, p0}, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;-><init>(Lcom/android/providers/settings/SettingsBackupAgent;)V

    iput-object v0, p0, Lcom/android/providers/settings/SettingsBackupAgent;->mWifiRestore:Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;

    .line 359
    :cond_0
    return-void
.end method

.method public onBackup(Landroid/os/ParcelFileDescriptor;Landroid/app/backup/BackupDataOutput;Landroid/os/ParcelFileDescriptor;)V
    .locals 35
    .parameter "oldState"
    .parameter "data"
    .parameter "newState"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 274
    invoke-direct/range {p0 .. p0}, Lcom/android/providers/settings/SettingsBackupAgent;->getSystemSettings()[B

    move-result-object v7

    .line 275
    .local v7, systemSettingsData:[B
    invoke-direct/range {p0 .. p0}, Lcom/android/providers/settings/SettingsBackupAgent;->getSecureSettings()[B

    move-result-object v12

    .line 276
    .local v12, secureSettingsData:[B
    invoke-direct/range {p0 .. p0}, Lcom/android/providers/settings/SettingsBackupAgent;->getGlobalSettings()[B

    move-result-object v17

    .line 277
    .local v17, globalSettingsData:[B
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/providers/settings/SettingsBackupAgent;->mSettingsHelper:Lcom/android/providers/settings/SettingsHelper;

    invoke-virtual {v3}, Lcom/android/providers/settings/SettingsHelper;->getLocaleData()[B

    move-result-object v22

    .line 278
    .local v22, locale:[B
    const-string v3, "/data/misc/wifi/wpa_supplicant.conf"

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/android/providers/settings/SettingsBackupAgent;->getWifiSupplicant(Ljava/lang/String;)[B

    move-result-object v27

    .line 279
    .local v27, wifiSupplicantData:[B
    sget-object v3, Lcom/android/providers/settings/SettingsBackupAgent;->mWifiConfigFile:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/android/providers/settings/SettingsBackupAgent;->getFileData(Ljava/lang/String;)[B

    move-result-object v32

    .line 281
    .local v32, wifiConfigData:[B
    invoke-direct/range {p0 .. p1}, Lcom/android/providers/settings/SettingsBackupAgent;->readOldChecksums(Landroid/os/ParcelFileDescriptor;)[J

    move-result-object v34

    .line 283
    .local v34, stateChecksums:[J
    const/4 v9, 0x0

    const/4 v3, 0x0

    aget-wide v4, v34, v3

    const-string v6, "system"

    move-object/from16 v3, p0

    move-object/from16 v8, p2

    invoke-direct/range {v3 .. v8}, Lcom/android/providers/settings/SettingsBackupAgent;->writeIfChanged(JLjava/lang/String;[BLandroid/app/backup/BackupDataOutput;)J

    move-result-wide v3

    aput-wide v3, v34, v9

    .line 285
    const/4 v3, 0x1

    const/4 v4, 0x1

    aget-wide v9, v34, v4

    const-string v11, "secure"

    move-object/from16 v8, p0

    move-object/from16 v13, p2

    invoke-direct/range {v8 .. v13}, Lcom/android/providers/settings/SettingsBackupAgent;->writeIfChanged(JLjava/lang/String;[BLandroid/app/backup/BackupDataOutput;)J

    move-result-wide v4

    aput-wide v4, v34, v3

    .line 287
    const/4 v3, 0x5

    const/4 v4, 0x5

    aget-wide v14, v34, v4

    const-string v16, "global"

    move-object/from16 v13, p0

    move-object/from16 v18, p2

    invoke-direct/range {v13 .. v18}, Lcom/android/providers/settings/SettingsBackupAgent;->writeIfChanged(JLjava/lang/String;[BLandroid/app/backup/BackupDataOutput;)J

    move-result-wide v4

    aput-wide v4, v34, v3

    .line 289
    const/4 v3, 0x2

    const/4 v4, 0x2

    aget-wide v19, v34, v4

    const-string v21, "locale"

    move-object/from16 v18, p0

    move-object/from16 v23, p2

    invoke-direct/range {v18 .. v23}, Lcom/android/providers/settings/SettingsBackupAgent;->writeIfChanged(JLjava/lang/String;[BLandroid/app/backup/BackupDataOutput;)J

    move-result-wide v4

    aput-wide v4, v34, v3

    .line 291
    const/4 v3, 0x3

    const/4 v4, 0x3

    aget-wide v24, v34, v4

    const-string v26, "\uffedWIFI"

    move-object/from16 v23, p0

    move-object/from16 v28, p2

    invoke-direct/range {v23 .. v28}, Lcom/android/providers/settings/SettingsBackupAgent;->writeIfChanged(JLjava/lang/String;[BLandroid/app/backup/BackupDataOutput;)J

    move-result-wide v4

    aput-wide v4, v34, v3

    .line 294
    const/4 v3, 0x4

    const/4 v4, 0x4

    aget-wide v29, v34, v4

    const-string v31, "\uffedCONFIG_WIFI"

    move-object/from16 v28, p0

    move-object/from16 v33, p2

    invoke-direct/range {v28 .. v33}, Lcom/android/providers/settings/SettingsBackupAgent;->writeIfChanged(JLjava/lang/String;[BLandroid/app/backup/BackupDataOutput;)J

    move-result-wide v4

    aput-wide v4, v34, v3

    .line 298
    move-object/from16 v0, p0

    move-object/from16 v1, v34

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lcom/android/providers/settings/SettingsBackupAgent;->writeNewChecksums([JLandroid/os/ParcelFileDescriptor;)V

    .line 299
    return-void
.end method

.method public onCreate()V
    .locals 2

    .prologue
    .line 263
    new-instance v1, Lcom/android/providers/settings/SettingsHelper;

    invoke-direct {v1, p0}, Lcom/android/providers/settings/SettingsHelper;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/providers/settings/SettingsBackupAgent;->mSettingsHelper:Lcom/android/providers/settings/SettingsHelper;

    .line 264
    invoke-super {p0}, Landroid/app/backup/BackupAgentHelper;->onCreate()V

    .line 266
    const-string v1, "wifi"

    invoke-virtual {p0, v1}, Lcom/android/providers/settings/SettingsBackupAgent;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    .line 267
    .local v0, mWfm:Landroid/net/wifi/WifiManager;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getConfigFile()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/android/providers/settings/SettingsBackupAgent;->mWifiConfigFile:Ljava/lang/String;

    .line 268
    :cond_0
    return-void
.end method

.method public onFullBackup(Landroid/app/backup/FullBackupDataOutput;)V
    .locals 12
    .parameter "data"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 403
    invoke-direct {p0}, Lcom/android/providers/settings/SettingsBackupAgent;->getSystemSettings()[B

    move-result-object v8

    .line 404
    .local v8, systemSettingsData:[B
    invoke-direct {p0}, Lcom/android/providers/settings/SettingsBackupAgent;->getSecureSettings()[B

    move-result-object v6

    .line 405
    .local v6, secureSettingsData:[B
    invoke-direct {p0}, Lcom/android/providers/settings/SettingsBackupAgent;->getGlobalSettings()[B

    move-result-object v2

    .line 406
    .local v2, globalSettingsData:[B
    iget-object v11, p0, Lcom/android/providers/settings/SettingsBackupAgent;->mSettingsHelper:Lcom/android/providers/settings/SettingsHelper;

    invoke-virtual {v11}, Lcom/android/providers/settings/SettingsHelper;->getLocaleData()[B

    move-result-object v3

    .line 407
    .local v3, locale:[B
    const-string v11, "/data/misc/wifi/wpa_supplicant.conf"

    invoke-direct {p0, v11}, Lcom/android/providers/settings/SettingsBackupAgent;->getWifiSupplicant(Ljava/lang/String;)[B

    move-result-object v10

    .line 408
    .local v10, wifiSupplicantData:[B
    sget-object v11, Lcom/android/providers/settings/SettingsBackupAgent;->mWifiConfigFile:Ljava/lang/String;

    invoke-direct {p0, v11}, Lcom/android/providers/settings/SettingsBackupAgent;->getFileData(Ljava/lang/String;)[B

    move-result-object v9

    .line 412
    .local v9, wifiConfigData:[B
    invoke-virtual {p0}, Lcom/android/providers/settings/SettingsBackupAgent;->getFilesDir()Ljava/io/File;

    move-result-object v11

    invoke-virtual {v11}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    .line 413
    .local v5, root:Ljava/lang/String;
    new-instance v7, Ljava/io/File;

    const-string v11, "flattened-data"

    invoke-direct {v7, v5, v11}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 415
    .local v7, stage:Ljava/io/File;
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 416
    .local v1, filestream:Ljava/io/FileOutputStream;
    new-instance v0, Ljava/io/BufferedOutputStream;

    invoke-direct {v0, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 417
    .local v0, bufstream:Ljava/io/BufferedOutputStream;
    new-instance v4, Ljava/io/DataOutputStream;

    invoke-direct {v4, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 420
    .local v4, out:Ljava/io/DataOutputStream;
    const/4 v11, 0x2

    invoke-virtual {v4, v11}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 423
    array-length v11, v8

    invoke-virtual {v4, v11}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 424
    invoke-virtual {v4, v8}, Ljava/io/DataOutputStream;->write([B)V

    .line 426
    array-length v11, v6

    invoke-virtual {v4, v11}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 427
    invoke-virtual {v4, v6}, Ljava/io/DataOutputStream;->write([B)V

    .line 429
    array-length v11, v2

    invoke-virtual {v4, v11}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 430
    invoke-virtual {v4, v2}, Ljava/io/DataOutputStream;->write([B)V

    .line 432
    array-length v11, v3

    invoke-virtual {v4, v11}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 433
    invoke-virtual {v4, v3}, Ljava/io/DataOutputStream;->write([B)V

    .line 435
    array-length v11, v10

    invoke-virtual {v4, v11}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 436
    invoke-virtual {v4, v10}, Ljava/io/DataOutputStream;->write([B)V

    .line 438
    array-length v11, v9

    invoke-virtual {v4, v11}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 439
    invoke-virtual {v4, v9}, Ljava/io/DataOutputStream;->write([B)V

    .line 441
    invoke-virtual {v4}, Ljava/io/DataOutputStream;->flush()V

    .line 444
    invoke-virtual {p0, v7, p1}, Lcom/android/providers/settings/SettingsBackupAgent;->fullBackupFile(Ljava/io/File;Landroid/app/backup/FullBackupDataOutput;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 446
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 448
    return-void

    .line 446
    .end local v0           #bufstream:Ljava/io/BufferedOutputStream;
    .end local v1           #filestream:Ljava/io/FileOutputStream;
    .end local v4           #out:Ljava/io/DataOutputStream;
    :catchall_0
    move-exception v11

    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    throw v11
.end method

.method public onRestore(Landroid/app/backup/BackupDataInput;ILandroid/os/ParcelFileDescriptor;)V
    .locals 8
    .parameter "data"
    .parameter "appVersionCode"
    .parameter "newState"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 365
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 366
    .local v2, movedToGlobal:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-static {v2}, Landroid/provider/Settings$System;->getMovedKeys(Ljava/util/HashSet;)V

    .line 367
    invoke-static {v2}, Landroid/provider/Settings$Secure;->getMovedKeys(Ljava/util/HashSet;)V

    .line 369
    :goto_0
    invoke-virtual {p1}, Landroid/app/backup/BackupDataInput;->readNextHeader()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 370
    invoke-virtual {p1}, Landroid/app/backup/BackupDataInput;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 371
    .local v0, key:Ljava/lang/String;
    invoke-virtual {p1}, Landroid/app/backup/BackupDataInput;->getDataSize()I

    move-result v3

    .line 372
    .local v3, size:I
    const-string v4, "system"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 373
    sget-object v4, Landroid/provider/Settings$System;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, p1, v4, v2}, Lcom/android/providers/settings/SettingsBackupAgent;->restoreSettings(Landroid/app/backup/BackupDataInput;Landroid/net/Uri;Ljava/util/HashSet;)V

    .line 374
    iget-object v4, p0, Lcom/android/providers/settings/SettingsBackupAgent;->mSettingsHelper:Lcom/android/providers/settings/SettingsHelper;

    invoke-virtual {v4}, Lcom/android/providers/settings/SettingsHelper;->applyAudioSettings()V

    goto :goto_0

    .line 375
    :cond_0
    const-string v4, "secure"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 376
    sget-object v4, Landroid/provider/Settings$Secure;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, p1, v4, v2}, Lcom/android/providers/settings/SettingsBackupAgent;->restoreSettings(Landroid/app/backup/BackupDataInput;Landroid/net/Uri;Ljava/util/HashSet;)V

    goto :goto_0

    .line 377
    :cond_1
    const-string v4, "global"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 378
    sget-object v4, Landroid/provider/Settings$Global;->CONTENT_URI:Landroid/net/Uri;

    const/4 v5, 0x0

    invoke-direct {p0, p1, v4, v5}, Lcom/android/providers/settings/SettingsBackupAgent;->restoreSettings(Landroid/app/backup/BackupDataInput;Landroid/net/Uri;Ljava/util/HashSet;)V

    goto :goto_0

    .line 379
    :cond_2
    const-string v4, "\uffedWIFI"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 380
    invoke-virtual {p0}, Lcom/android/providers/settings/SettingsBackupAgent;->initWifiRestoreIfNecessary()V

    .line 381
    iget-object v4, p0, Lcom/android/providers/settings/SettingsBackupAgent;->mWifiRestore:Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;

    invoke-virtual {v4, p1}, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->incorporateWifiSupplicant(Landroid/app/backup/BackupDataInput;)V

    goto :goto_0

    .line 382
    :cond_3
    const-string v4, "locale"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 383
    new-array v1, v3, [B

    .line 384
    .local v1, localeData:[B
    const/4 v4, 0x0

    invoke-virtual {p1, v1, v4, v3}, Landroid/app/backup/BackupDataInput;->readEntityData([BII)I

    .line 385
    iget-object v4, p0, Lcom/android/providers/settings/SettingsBackupAgent;->mSettingsHelper:Lcom/android/providers/settings/SettingsHelper;

    invoke-virtual {v4, v1, v3}, Lcom/android/providers/settings/SettingsHelper;->setLocaleData([BI)V

    goto :goto_0

    .line 386
    .end local v1           #localeData:[B
    :cond_4
    const-string v4, "\uffedCONFIG_WIFI"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 387
    invoke-virtual {p0}, Lcom/android/providers/settings/SettingsBackupAgent;->initWifiRestoreIfNecessary()V

    .line 388
    iget-object v4, p0, Lcom/android/providers/settings/SettingsBackupAgent;->mWifiRestore:Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;

    invoke-virtual {v4, p1}, Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;->incorporateWifiConfigFile(Landroid/app/backup/BackupDataInput;)V

    goto :goto_0

    .line 390
    :cond_5
    invoke-virtual {p1}, Landroid/app/backup/BackupDataInput;->skipEntityData()V

    goto :goto_0

    .line 396
    .end local v0           #key:Ljava/lang/String;
    .end local v3           #size:I
    :cond_6
    iget-object v4, p0, Lcom/android/providers/settings/SettingsBackupAgent;->mWifiRestore:Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;

    if-eqz v4, :cond_7

    .line 397
    new-instance v4, Landroid/os/Handler;

    invoke-virtual {p0}, Lcom/android/providers/settings/SettingsBackupAgent;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iget-object v5, p0, Lcom/android/providers/settings/SettingsBackupAgent;->mWifiRestore:Lcom/android/providers/settings/SettingsBackupAgent$WifiRestoreRunnable;

    const-wide/32 v6, 0xea60

    invoke-virtual {v4, v5, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 399
    :cond_7
    return-void
.end method

.method public onRestoreFile(Landroid/os/ParcelFileDescriptor;JILjava/lang/String;Ljava/lang/String;JJ)V
    .locals 11
    .parameter "data"
    .parameter "size"
    .parameter "type"
    .parameter "domain"
    .parameter "relpath"
    .parameter "mode"
    .parameter "mtime"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 458
    new-instance v2, Ljava/io/FileInputStream;

    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v7

    invoke-direct {v2, v7}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    .line 459
    .local v2, instream:Ljava/io/FileInputStream;
    new-instance v1, Ljava/io/DataInputStream;

    invoke-direct {v1, v2}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 461
    .local v1, in:Ljava/io/DataInputStream;
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v6

    .line 463
    .local v6, version:I
    const/4 v7, 0x2

    if-gt v6, v7, :cond_8

    .line 465
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 466
    .local v3, movedToGlobal:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-static {v3}, Landroid/provider/Settings$System;->getMovedKeys(Ljava/util/HashSet;)V

    .line 467
    invoke-static {v3}, Landroid/provider/Settings$Secure;->getMovedKeys(Ljava/util/HashSet;)V

    .line 470
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    .line 472
    .local v4, nBytes:I
    new-array v0, v4, [B

    .line 473
    .local v0, buffer:[B
    const/4 v7, 0x0

    invoke-virtual {v1, v0, v7, v4}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 474
    sget-object v7, Landroid/provider/Settings$System;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v0, v4, v7, v3}, Lcom/android/providers/settings/SettingsBackupAgent;->restoreSettings([BILandroid/net/Uri;Ljava/util/HashSet;)V

    .line 477
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    .line 479
    array-length v7, v0

    if-le v4, v7, :cond_0

    new-array v0, v4, [B

    .line 480
    :cond_0
    const/4 v7, 0x0

    invoke-virtual {v1, v0, v7, v4}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 481
    sget-object v7, Landroid/provider/Settings$Secure;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v0, v4, v7, v3}, Lcom/android/providers/settings/SettingsBackupAgent;->restoreSettings([BILandroid/net/Uri;Ljava/util/HashSet;)V

    .line 484
    const/4 v7, 0x2

    if-lt v6, v7, :cond_2

    .line 485
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    .line 487
    array-length v7, v0

    if-le v4, v7, :cond_1

    new-array v0, v4, [B

    .line 488
    :cond_1
    const/4 v7, 0x0

    invoke-virtual {v1, v0, v7, v4}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 489
    invoke-virtual {v3}, Ljava/util/HashSet;->clear()V

    .line 490
    sget-object v7, Landroid/provider/Settings$Global;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v0, v4, v7, v3}, Lcom/android/providers/settings/SettingsBackupAgent;->restoreSettings([BILandroid/net/Uri;Ljava/util/HashSet;)V

    .line 494
    :cond_2
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    .line 496
    array-length v7, v0

    if-le v4, v7, :cond_3

    new-array v0, v4, [B

    .line 497
    :cond_3
    const/4 v7, 0x0

    invoke-virtual {v1, v0, v7, v4}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 498
    iget-object v7, p0, Lcom/android/providers/settings/SettingsBackupAgent;->mSettingsHelper:Lcom/android/providers/settings/SettingsHelper;

    invoke-virtual {v7, v0, v4}, Lcom/android/providers/settings/SettingsHelper;->setLocaleData([BI)V

    .line 501
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    .line 503
    array-length v7, v0

    if-le v4, v7, :cond_4

    new-array v0, v4, [B

    .line 504
    :cond_4
    const/4 v7, 0x0

    invoke-virtual {v1, v0, v7, v4}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 505
    const/4 v7, 0x0

    invoke-direct {p0, v7}, Lcom/android/providers/settings/SettingsBackupAgent;->enableWifi(Z)I

    move-result v5

    .line 506
    .local v5, retainedWifiState:I
    const-string v7, "/data/misc/wifi/wpa_supplicant.conf"

    invoke-direct {p0, v7, v0, v4}, Lcom/android/providers/settings/SettingsBackupAgent;->restoreWifiSupplicant(Ljava/lang/String;[BI)V

    .line 507
    const-string v7, "/data/misc/wifi/wpa_supplicant.conf"

    const/16 v8, 0x1b0

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v9

    const/16 v10, 0x3f2

    invoke-static {v7, v8, v9, v10}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I

    .line 512
    const/4 v7, 0x3

    if-eq v5, v7, :cond_5

    const/4 v7, 0x2

    if-ne v5, v7, :cond_7

    :cond_5
    const/4 v7, 0x1

    :goto_0
    invoke-direct {p0, v7}, Lcom/android/providers/settings/SettingsBackupAgent;->enableWifi(Z)I

    .line 516
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    .line 518
    array-length v7, v0

    if-le v4, v7, :cond_6

    new-array v0, v4, [B

    .line 519
    :cond_6
    const/4 v7, 0x0

    invoke-virtual {v1, v0, v7, v4}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 520
    sget-object v7, Lcom/android/providers/settings/SettingsBackupAgent;->mWifiConfigFile:Ljava/lang/String;

    invoke-direct {p0, v7, v0, v4}, Lcom/android/providers/settings/SettingsBackupAgent;->restoreFileData(Ljava/lang/String;[BI)V

    .line 527
    return-void

    .line 512
    :cond_7
    const/4 v7, 0x0

    goto :goto_0

    .line 524
    .end local v0           #buffer:[B
    .end local v3           #movedToGlobal:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v4           #nBytes:I
    .end local v5           #retainedWifiState:I
    :cond_8
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->close()V

    .line 525
    new-instance v7, Ljava/io/IOException;

    const-string v8, "Invalid file schema"

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7
.end method
