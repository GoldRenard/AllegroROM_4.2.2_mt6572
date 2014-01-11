.class public Lcom/mediatek/upgradeforschepower/UpgradeReceiver;
.super Landroid/content/BroadcastReceiver;
.source "UpgradeReceiver.java"


# static fields
.field private static final SCHPWRS_DB_PATH:Ljava/lang/String; = "data/data/com.android.settings/databases/schpwrs.db"

.field private static final TAG:Ljava/lang/String; = "UpgradeReceiver"

.field private static final TEMP_DB_PATH:Ljava/lang/String; = "/data/schpwrs.db"


# instance fields
.field private mSettingSchPwrsDbFile:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private copyDbFileToPhoneStorage()V
    .locals 12

    .prologue
    .line 39
    const-string v9, "UpgradeReceiver"

    const-string v10, "copyDbFileToPhoneStorage()"

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    new-instance v8, Ljava/io/File;

    const-string v9, "/data/schpwrs.db"

    invoke-direct {v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 41
    .local v8, tempDbFile:Ljava/io/File;
    const/4 v3, 0x0

    .line 42
    .local v3, fis:Ljava/io/FileInputStream;
    const/4 v5, 0x0

    .line 44
    .local v5, fos:Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v4, Ljava/io/FileInputStream;

    iget-object v9, p0, Lcom/mediatek/upgradeforschepower/UpgradeReceiver;->mSettingSchPwrsDbFile:Ljava/io/File;

    invoke-direct {v4, v9}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_8
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    .line 45
    .end local v3           #fis:Ljava/io/FileInputStream;
    .local v4, fis:Ljava/io/FileInputStream;
    :try_start_1
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_9
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6

    .line 46
    .end local v5           #fos:Ljava/io/FileOutputStream;
    .local v6, fos:Ljava/io/FileOutputStream;
    const/16 v9, 0x400

    :try_start_2
    new-array v0, v9, [B

    .line 47
    .local v0, buffer:[B
    const/4 v7, 0x0

    .line 48
    .local v7, length:I
    :goto_0
    invoke-virtual {v4, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v7

    if-lez v7, :cond_2

    .line 49
    const/4 v9, 0x0

    invoke-virtual {v6, v0, v9, v7}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_7

    goto :goto_0

    .line 51
    .end local v0           #buffer:[B
    .end local v7           #length:I
    :catch_0
    move-exception v1

    move-object v5, v6

    .end local v6           #fos:Ljava/io/FileOutputStream;
    .restart local v5       #fos:Ljava/io/FileOutputStream;
    move-object v3, v4

    .line 52
    .end local v4           #fis:Ljava/io/FileInputStream;
    .local v1, e:Ljava/io/FileNotFoundException;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    :goto_1
    :try_start_3
    const-string v9, "UpgradeReceiver"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "FileNotFoundException "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 59
    if-eqz v5, :cond_0

    .line 60
    :try_start_4
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->flush()V

    .line 61
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 63
    :cond_0
    if-eqz v3, :cond_1

    .line 64
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 72
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :cond_1
    :goto_2
    return-void

    .line 59
    .end local v3           #fis:Ljava/io/FileInputStream;
    .end local v5           #fos:Ljava/io/FileOutputStream;
    .restart local v0       #buffer:[B
    .restart local v4       #fis:Ljava/io/FileInputStream;
    .restart local v6       #fos:Ljava/io/FileOutputStream;
    .restart local v7       #length:I
    :cond_2
    if-eqz v6, :cond_3

    .line 60
    :try_start_5
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->flush()V

    .line 61
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V

    .line 63
    :cond_3
    if-eqz v4, :cond_4

    .line 64
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 71
    :cond_4
    const-string v9, "UpgradeReceiver"

    const-string v10, "Copy done return true"

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-object v5, v6

    .end local v6           #fos:Ljava/io/FileOutputStream;
    .restart local v5       #fos:Ljava/io/FileOutputStream;
    move-object v3, v4

    .line 72
    .end local v4           #fis:Ljava/io/FileInputStream;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    goto :goto_2

    .line 66
    .end local v3           #fis:Ljava/io/FileInputStream;
    .end local v5           #fos:Ljava/io/FileOutputStream;
    .restart local v4       #fis:Ljava/io/FileInputStream;
    .restart local v6       #fos:Ljava/io/FileOutputStream;
    :catch_1
    move-exception v2

    .line 67
    .local v2, e2:Ljava/io/IOException;
    const-string v9, "UpgradeReceiver"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "IOException "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v5, v6

    .end local v6           #fos:Ljava/io/FileOutputStream;
    .restart local v5       #fos:Ljava/io/FileOutputStream;
    move-object v3, v4

    .line 68
    .end local v4           #fis:Ljava/io/FileInputStream;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    goto :goto_2

    .line 66
    .end local v0           #buffer:[B
    .end local v2           #e2:Ljava/io/IOException;
    .end local v7           #length:I
    .restart local v1       #e:Ljava/io/FileNotFoundException;
    :catch_2
    move-exception v2

    .line 67
    .restart local v2       #e2:Ljava/io/IOException;
    const-string v9, "UpgradeReceiver"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "IOException "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 54
    .end local v1           #e:Ljava/io/FileNotFoundException;
    .end local v2           #e2:Ljava/io/IOException;
    :catch_3
    move-exception v1

    .line 55
    .local v1, e:Ljava/io/IOException;
    :goto_3
    :try_start_6
    const-string v9, "UpgradeReceiver"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "IOException "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 59
    if-eqz v5, :cond_5

    .line 60
    :try_start_7
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->flush()V

    .line 61
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 63
    :cond_5
    if-eqz v3, :cond_1

    .line 64
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    goto :goto_2

    .line 66
    :catch_4
    move-exception v2

    .line 67
    .restart local v2       #e2:Ljava/io/IOException;
    const-string v9, "UpgradeReceiver"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "IOException "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 58
    .end local v1           #e:Ljava/io/IOException;
    .end local v2           #e2:Ljava/io/IOException;
    :catchall_0
    move-exception v9

    .line 59
    :goto_4
    if-eqz v5, :cond_6

    .line 60
    :try_start_8
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->flush()V

    .line 61
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 63
    :cond_6
    if-eqz v3, :cond_7

    .line 64
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    .line 68
    :cond_7
    throw v9

    .line 66
    :catch_5
    move-exception v2

    .line 67
    .restart local v2       #e2:Ljava/io/IOException;
    const-string v9, "UpgradeReceiver"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "IOException "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 58
    .end local v2           #e2:Ljava/io/IOException;
    .end local v3           #fis:Ljava/io/FileInputStream;
    .restart local v4       #fis:Ljava/io/FileInputStream;
    :catchall_1
    move-exception v9

    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileInputStream;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    goto :goto_4

    .end local v3           #fis:Ljava/io/FileInputStream;
    .end local v5           #fos:Ljava/io/FileOutputStream;
    .restart local v4       #fis:Ljava/io/FileInputStream;
    .restart local v6       #fos:Ljava/io/FileOutputStream;
    :catchall_2
    move-exception v9

    move-object v5, v6

    .end local v6           #fos:Ljava/io/FileOutputStream;
    .restart local v5       #fos:Ljava/io/FileOutputStream;
    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileInputStream;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    goto :goto_4

    .line 54
    .end local v3           #fis:Ljava/io/FileInputStream;
    .restart local v4       #fis:Ljava/io/FileInputStream;
    :catch_6
    move-exception v1

    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileInputStream;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    goto :goto_3

    .end local v3           #fis:Ljava/io/FileInputStream;
    .end local v5           #fos:Ljava/io/FileOutputStream;
    .restart local v4       #fis:Ljava/io/FileInputStream;
    .restart local v6       #fos:Ljava/io/FileOutputStream;
    :catch_7
    move-exception v1

    move-object v5, v6

    .end local v6           #fos:Ljava/io/FileOutputStream;
    .restart local v5       #fos:Ljava/io/FileOutputStream;
    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileInputStream;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    goto/16 :goto_3

    .line 51
    :catch_8
    move-exception v1

    goto/16 :goto_1

    .end local v3           #fis:Ljava/io/FileInputStream;
    .restart local v4       #fis:Ljava/io/FileInputStream;
    :catch_9
    move-exception v1

    move-object v3, v4

    .end local v4           #fis:Ljava/io/FileInputStream;
    .restart local v3       #fis:Ljava/io/FileInputStream;
    goto/16 :goto_1
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 24
    const-string v0, "UpgradeReceiver"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onReceive = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    new-instance v0, Ljava/io/File;

    const-string v1, "data/data/com.android.settings/databases/schpwrs.db"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mediatek/upgradeforschepower/UpgradeReceiver;->mSettingSchPwrsDbFile:Ljava/io/File;

    .line 26
    iget-object v0, p0, Lcom/mediatek/upgradeforschepower/UpgradeReceiver;->mSettingSchPwrsDbFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 27
    invoke-direct {p0}, Lcom/mediatek/upgradeforschepower/UpgradeReceiver;->copyDbFileToPhoneStorage()V

    .line 30
    iget-object v0, p0, Lcom/mediatek/upgradeforschepower/UpgradeReceiver;->mSettingSchPwrsDbFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_0

    .line 31
    const-string v0, "UpgradeReceiver"

    const-string v1, "delete settings db file failed."

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    :cond_0
    :goto_0
    return-void

    .line 34
    :cond_1
    const-string v0, "UpgradeReceiver"

    const-string v1, "com.android.settings/databases/schpwrs.db does not exist"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
