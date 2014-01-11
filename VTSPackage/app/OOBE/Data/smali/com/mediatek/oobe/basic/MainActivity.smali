.class public Lcom/mediatek/oobe/basic/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;
    }
.end annotation


# static fields
.field private static final BOOT_MODE_ADV_META:I = 0x5

.field private static final BOOT_MODE_INFO_FILE:Ljava/lang/String; = "/sys/class/BOOT/BOOT/boot/boot_mode"

.field private static final BOOT_MODE_META:I = 0x1

.field private static final BOOT_MODE_NORMAL:I = 0x0

.field private static final BOOT_MODE_STR_LEN:I = 0x1

.field private static final DIALOG_WAITING_SIM:I = 0xbb9

.field private static final EVENT_MONITOR_SIM_TIME_OUT:I = 0x7d1

.field private static final EVENT_SIM_DETECTING_READY:I = 0x7d2

.field private static final QUICK_START_GUIDE_CODE:I = 0xfa1

.field private static final REQUEST_CODE_ADVANCED_SETTINGS:I = 0x3e9

.field private static final TAG:Ljava/lang/String; = "OOBE"

.field private static final TIME_MONITOR_SIM:I = 0x7530

.field private static sDeviceInfo:Ljava/lang/String;

.field private static sIsRunning:Z

.field private static sIsTablet:Z


# instance fields
.field private mBootMode:I

.field private mCurrentStep:I

.field private mEndTime:J

.field private mExecutingActivityList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private mIsFirstRun:Z

.field private mIsGoToNextStep:Z

.field private mIsStepInitiated:Z

.field private mProgressbarMaxSize:I

.field private mSIMIntentFilter:Landroid/content/IntentFilter;

.field mSIMStateReceiver:Landroid/content/BroadcastReceiver;

.field private mSimExist:Z

.field private mStartTime:J

.field private mStatusBarDisabled:Z

.field private mStepActivities:[Ljava/lang/String;

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 86
    sput-boolean v0, Lcom/mediatek/oobe/basic/MainActivity;->sIsRunning:Z

    .line 120
    sput-boolean v0, Lcom/mediatek/oobe/basic/MainActivity;->sIsTablet:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 79
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 87
    iput-boolean v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mIsStepInitiated:Z

    .line 93
    iput-boolean v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mStatusBarDisabled:Z

    .line 100
    iput v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mBootMode:I

    .line 103
    iput v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mProgressbarMaxSize:I

    .line 104
    const/4 v0, -0x1

    iput v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    .line 105
    iput-boolean v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mSimExist:Z

    .line 107
    iput-boolean v3, p0, Lcom/mediatek/oobe/basic/MainActivity;->mIsGoToNextStep:Z

    .line 110
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "1/com.mediatek.oobe.basic.OOBE_LANGUAGE_SETTING"

    aput-object v1, v0, v2

    const-string v1, "2/com.mediatek.oobe.basic.DATE_TIME_SETTINGS_WIZARD"

    aput-object v1, v0, v3

    const/4 v1, 0x2

    const-string v2, "3/com.mediatek.oobe.basic.SIM_MANAGEMENT_SETTINGS_WIZARD"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "4/com.mediatek.oobe.basic.DEFAULT_SIM_SETTINGS_WIZARD"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "5/com.mediatek.oobe.basic.OOBE_IMPORT_CONTACTS"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "6/com.mediatek.oobe.basic.OOBE_INTERNET_CONNECTION"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "7/com.mediatek.oobe.basic.WIFI_SETTINGS_WIZARD"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mStepActivities:[Ljava/lang/String;

    .line 131
    new-instance v0, Lcom/mediatek/oobe/basic/MainActivity$1;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/MainActivity$1;-><init>(Lcom/mediatek/oobe/basic/MainActivity;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mHandler:Landroid/os/Handler;

    .line 154
    new-instance v0, Lcom/mediatek/oobe/basic/MainActivity$2;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/MainActivity$2;-><init>(Lcom/mediatek/oobe/basic/MainActivity;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mSIMStateReceiver:Landroid/content/BroadcastReceiver;

    .line 606
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/oobe/basic/MainActivity;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$100()Z
    .locals 1

    .prologue
    .line 79
    sget-boolean v0, Lcom/mediatek/oobe/basic/MainActivity;->sIsRunning:Z

    return v0
.end method

.method static synthetic access$200(Lcom/mediatek/oobe/basic/MainActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mIsStepInitiated:Z

    return v0
.end method

.method static synthetic access$300(Lcom/mediatek/oobe/basic/MainActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/MainActivity;->initStep()V

    return-void
.end method

.method static synthetic access$402(Lcom/mediatek/oobe/basic/MainActivity;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 79
    iput-boolean p1, p0, Lcom/mediatek/oobe/basic/MainActivity;->mSimExist:Z

    return p1
.end method

.method static synthetic access$500(Lcom/mediatek/oobe/basic/MainActivity;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 79
    iget-wide v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mEndTime:J

    return-wide v0
.end method

.method static synthetic access$502(Lcom/mediatek/oobe/basic/MainActivity;J)J
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 79
    iput-wide p1, p0, Lcom/mediatek/oobe/basic/MainActivity;->mEndTime:J

    return-wide p1
.end method

.method static synthetic access$600(Lcom/mediatek/oobe/basic/MainActivity;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 79
    iget-wide v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mStartTime:J

    return-wide v0
.end method

.method private disableStatusBar(Z)V
    .locals 4
    .parameter "disable"

    .prologue
    .line 583
    const-string v1, "OOBE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "disable status bar "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 584
    const-string v1, "statusbar"

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/StatusBarManager;

    .line 585
    .local v0, statusBarManager:Landroid/app/StatusBarManager;
    if-eqz v0, :cond_1

    .line 586
    iput-boolean p1, p0, Lcom/mediatek/oobe/basic/MainActivity;->mStatusBarDisabled:Z

    .line 587
    if-eqz p1, :cond_0

    const/high16 v1, 0x1

    :goto_0
    invoke-virtual {v0, v1}, Landroid/app/StatusBarManager;->disable(I)V

    .line 591
    :goto_1
    return-void

    .line 587
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 589
    :cond_1
    const-string v1, "OOBE"

    const-string v2, "Fail to get status bar instance"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private finishOOBE()V
    .locals 11

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 539
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "oobe_has_run"

    invoke-static {v5, v6, v8}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    .line 540
    .local v2, oobeHasRun:I
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 541
    .local v3, pm:Landroid/content/pm/PackageManager;
    new-instance v1, Landroid/content/ComponentName;

    const-class v5, Lcom/mediatek/oobe/WizardActivity;

    invoke-direct {v1, p0, v5}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 542
    .local v1, name:Landroid/content/ComponentName;
    invoke-virtual {v3, v1}, Landroid/content/pm/PackageManager;->getComponentEnabledSetting(Landroid/content/ComponentName;)I

    move-result v4

    .line 543
    .local v4, wizardDisabledState:I
    const-string v5, "OOBE"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Finish settigns, if OOBE has been configured once, disable it. oobeHasRun="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "wizardDisabledState="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 546
    if-eqz v2, :cond_0

    if-eq v4, v10, :cond_2

    .line 547
    :cond_0
    const-string v5, "OOBE"

    const-string v6, "Here we go, MainActivity.finishOOBE(), set oobe_has_run flag to 1 , start launcher now"

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 548
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "oobe_has_run"

    invoke-static {v5, v6, v9}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 551
    sget-boolean v5, Lcom/mediatek/oobe/basic/MainActivity;->sIsTablet:Z

    if-nez v5, :cond_3

    .line 552
    new-instance v0, Landroid/content/Intent;

    const-string v5, "com.mediatek.oobe.QUICK_START_GUIDE"

    invoke-direct {v0, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 553
    .local v0, intent:Landroid/content/Intent;
    const/high16 v5, 0x1000

    invoke-virtual {v0, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 554
    const/high16 v5, 0x80

    invoke-virtual {v0, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 555
    const-string v5, "mIsFirstRun"

    invoke-virtual {v0, v5, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 556
    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 562
    .end local v0           #intent:Landroid/content/Intent;
    :cond_1
    :goto_0
    const-string v5, "OOBE"

    const-string v6, "Try to disable WizardActivity, MainActivity.finishOOBE() is expected"

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 563
    invoke-virtual {v3, v1, v10, v9}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    .line 567
    iget-boolean v5, p0, Lcom/mediatek/oobe/basic/MainActivity;->mStatusBarDisabled:Z

    if-eqz v5, :cond_2

    .line 568
    invoke-direct {p0, v8}, Lcom/mediatek/oobe/basic/MainActivity;->disableStatusBar(Z)V

    .line 572
    :cond_2
    const-string v5, "OOBE"

    const-string v6, "finishOOBE MainActivity finished"

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 573
    invoke-static {v8}, Lcom/mediatek/oobe/basic/MainActivity;->setRunning(Z)V

    .line 574
    const/4 v5, -0x1

    iput v5, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    .line 575
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/MainActivity;->finish()V

    .line 577
    return-void

    .line 557
    :cond_3
    iget-boolean v5, p0, Lcom/mediatek/oobe/basic/MainActivity;->mIsFirstRun:Z

    if-eqz v5, :cond_1

    .line 558
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "oobe_display"

    invoke-static {v5, v6, v8}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 560
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "device_provisioned"

    invoke-static {v5, v6, v9}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_0
.end method

.method private getBootMode()I
    .locals 10

    .prologue
    .line 655
    const/4 v5, -0x1

    .line 656
    .local v5, mode:I
    const/4 v3, 0x0

    .line 657
    .local v3, fr:Ljava/io/FileReader;
    const/4 v0, 0x0

    .line 659
    .local v0, br:Ljava/io/BufferedReader;
    :try_start_0
    new-instance v4, Ljava/io/FileReader;

    const-string v7, "/sys/class/BOOT/BOOT/boot/boot_mode"

    invoke-direct {v4, v7}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_8

    .line 660
    .end local v3           #fr:Ljava/io/FileReader;
    .local v4, fr:Ljava/io/FileReader;
    :try_start_1
    new-instance v1, Ljava/io/BufferedReader;

    invoke-direct {v1, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_11
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_f
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_d

    .line 661
    .end local v0           #br:Ljava/io/BufferedReader;
    .local v1, br:Ljava/io/BufferedReader;
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .line 662
    .local v6, readMode:Ljava/lang/String;
    if-eqz v6, :cond_0

    .line 663
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_12
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_10
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_e

    move-result v5

    .line 673
    :cond_0
    if-eqz v1, :cond_1

    .line 674
    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 680
    :cond_1
    :goto_0
    if-eqz v4, :cond_2

    .line 681
    :try_start_4
    invoke-virtual {v4}, Ljava/io/FileReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    :cond_2
    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    move-object v3, v4

    .line 687
    .end local v4           #fr:Ljava/io/FileReader;
    .end local v6           #readMode:Ljava/lang/String;
    .restart local v3       #fr:Ljava/io/FileReader;
    :cond_3
    :goto_1
    const-string v7, "OOBE"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "read mode;"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 688
    return v5

    .line 676
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v3           #fr:Ljava/io/FileReader;
    .restart local v1       #br:Ljava/io/BufferedReader;
    .restart local v4       #fr:Ljava/io/FileReader;
    .restart local v6       #readMode:Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 677
    .local v2, e:Ljava/io/IOException;
    const-string v7, "OOBE"

    const-string v8, "br file close error; /sys/class/BOOT/BOOT/boot/boot_mode"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 683
    .end local v2           #e:Ljava/io/IOException;
    :catch_1
    move-exception v2

    .line 684
    .restart local v2       #e:Ljava/io/IOException;
    const-string v7, "OOBE"

    const-string v8, "fr file close error; /sys/class/BOOT/BOOT/boot/boot_mode"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    move-object v3, v4

    .line 686
    .end local v4           #fr:Ljava/io/FileReader;
    .restart local v3       #fr:Ljava/io/FileReader;
    goto :goto_1

    .line 665
    .end local v2           #e:Ljava/io/IOException;
    .end local v6           #readMode:Ljava/lang/String;
    :catch_2
    move-exception v2

    .line 666
    .local v2, e:Ljava/io/FileNotFoundException;
    :goto_2
    :try_start_5
    const-string v7, "OOBE"

    const-string v8, "file not found; /sys/class/BOOT/BOOT/boot/boot_mode"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 673
    if-eqz v0, :cond_4

    .line 674
    :try_start_6
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 680
    .end local v2           #e:Ljava/io/FileNotFoundException;
    :cond_4
    :goto_3
    if-eqz v3, :cond_3

    .line 681
    :try_start_7
    invoke-virtual {v3}, Ljava/io/FileReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    goto :goto_1

    .line 683
    :catch_3
    move-exception v2

    .line 684
    .local v2, e:Ljava/io/IOException;
    const-string v7, "OOBE"

    const-string v8, "fr file close error; /sys/class/BOOT/BOOT/boot/boot_mode"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 676
    .local v2, e:Ljava/io/FileNotFoundException;
    :catch_4
    move-exception v2

    .line 677
    .local v2, e:Ljava/io/IOException;
    const-string v7, "OOBE"

    const-string v8, "br file close error; /sys/class/BOOT/BOOT/boot/boot_mode"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 667
    .end local v2           #e:Ljava/io/IOException;
    :catch_5
    move-exception v2

    .line 668
    .restart local v2       #e:Ljava/io/IOException;
    :goto_4
    :try_start_8
    const-string v7, "OOBE"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "read file error; "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 673
    if-eqz v0, :cond_5

    .line 674
    :try_start_9
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_7

    .line 680
    :cond_5
    :goto_5
    if-eqz v3, :cond_3

    .line 681
    :try_start_a
    invoke-virtual {v3}, Ljava/io/FileReader;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_6

    goto :goto_1

    .line 683
    :catch_6
    move-exception v2

    .line 684
    const-string v7, "OOBE"

    const-string v8, "fr file close error; /sys/class/BOOT/BOOT/boot/boot_mode"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 676
    :catch_7
    move-exception v2

    .line 677
    const-string v7, "OOBE"

    const-string v8, "br file close error; /sys/class/BOOT/BOOT/boot/boot_mode"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    .line 669
    .end local v2           #e:Ljava/io/IOException;
    :catch_8
    move-exception v2

    .line 670
    .local v2, e:Ljava/lang/NumberFormatException;
    :goto_6
    :try_start_b
    const-string v7, "OOBE"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "NumberFormatException e ="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 673
    if-eqz v0, :cond_6

    .line 674
    :try_start_c
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_a

    .line 680
    .end local v2           #e:Ljava/lang/NumberFormatException;
    :cond_6
    :goto_7
    if-eqz v3, :cond_3

    .line 681
    :try_start_d
    invoke-virtual {v3}, Ljava/io/FileReader;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_9

    goto/16 :goto_1

    .line 683
    :catch_9
    move-exception v2

    .line 684
    .local v2, e:Ljava/io/IOException;
    const-string v7, "OOBE"

    const-string v8, "fr file close error; /sys/class/BOOT/BOOT/boot/boot_mode"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 676
    .local v2, e:Ljava/lang/NumberFormatException;
    :catch_a
    move-exception v2

    .line 677
    .local v2, e:Ljava/io/IOException;
    const-string v7, "OOBE"

    const-string v8, "br file close error; /sys/class/BOOT/BOOT/boot/boot_mode"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7

    .line 672
    .end local v2           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v7

    .line 673
    :goto_8
    if-eqz v0, :cond_7

    .line 674
    :try_start_e
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_b

    .line 680
    :cond_7
    :goto_9
    if-eqz v3, :cond_8

    .line 681
    :try_start_f
    invoke-virtual {v3}, Ljava/io/FileReader;->close()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_c

    .line 685
    :cond_8
    :goto_a
    throw v7

    .line 676
    :catch_b
    move-exception v2

    .line 677
    .restart local v2       #e:Ljava/io/IOException;
    const-string v8, "OOBE"

    const-string v9, "br file close error; /sys/class/BOOT/BOOT/boot/boot_mode"

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    .line 683
    .end local v2           #e:Ljava/io/IOException;
    :catch_c
    move-exception v2

    .line 684
    .restart local v2       #e:Ljava/io/IOException;
    const-string v8, "OOBE"

    const-string v9, "fr file close error; /sys/class/BOOT/BOOT/boot/boot_mode"

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a

    .line 672
    .end local v2           #e:Ljava/io/IOException;
    .end local v3           #fr:Ljava/io/FileReader;
    .restart local v4       #fr:Ljava/io/FileReader;
    :catchall_1
    move-exception v7

    move-object v3, v4

    .end local v4           #fr:Ljava/io/FileReader;
    .restart local v3       #fr:Ljava/io/FileReader;
    goto :goto_8

    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v3           #fr:Ljava/io/FileReader;
    .restart local v1       #br:Ljava/io/BufferedReader;
    .restart local v4       #fr:Ljava/io/FileReader;
    :catchall_2
    move-exception v7

    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    move-object v3, v4

    .end local v4           #fr:Ljava/io/FileReader;
    .restart local v3       #fr:Ljava/io/FileReader;
    goto :goto_8

    .line 669
    .end local v3           #fr:Ljava/io/FileReader;
    .restart local v4       #fr:Ljava/io/FileReader;
    :catch_d
    move-exception v2

    move-object v3, v4

    .end local v4           #fr:Ljava/io/FileReader;
    .restart local v3       #fr:Ljava/io/FileReader;
    goto :goto_6

    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v3           #fr:Ljava/io/FileReader;
    .restart local v1       #br:Ljava/io/BufferedReader;
    .restart local v4       #fr:Ljava/io/FileReader;
    :catch_e
    move-exception v2

    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    move-object v3, v4

    .end local v4           #fr:Ljava/io/FileReader;
    .restart local v3       #fr:Ljava/io/FileReader;
    goto :goto_6

    .line 667
    .end local v3           #fr:Ljava/io/FileReader;
    .restart local v4       #fr:Ljava/io/FileReader;
    :catch_f
    move-exception v2

    move-object v3, v4

    .end local v4           #fr:Ljava/io/FileReader;
    .restart local v3       #fr:Ljava/io/FileReader;
    goto/16 :goto_4

    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v3           #fr:Ljava/io/FileReader;
    .restart local v1       #br:Ljava/io/BufferedReader;
    .restart local v4       #fr:Ljava/io/FileReader;
    :catch_10
    move-exception v2

    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    move-object v3, v4

    .end local v4           #fr:Ljava/io/FileReader;
    .restart local v3       #fr:Ljava/io/FileReader;
    goto/16 :goto_4

    .line 665
    .end local v3           #fr:Ljava/io/FileReader;
    .restart local v4       #fr:Ljava/io/FileReader;
    :catch_11
    move-exception v2

    move-object v3, v4

    .end local v4           #fr:Ljava/io/FileReader;
    .restart local v3       #fr:Ljava/io/FileReader;
    goto/16 :goto_2

    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v3           #fr:Ljava/io/FileReader;
    .restart local v1       #br:Ljava/io/BufferedReader;
    .restart local v4       #fr:Ljava/io/FileReader;
    :catch_12
    move-exception v2

    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    move-object v3, v4

    .end local v4           #fr:Ljava/io/FileReader;
    .restart local v3       #fr:Ljava/io/FileReader;
    goto/16 :goto_2
.end method

.method private initStep()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 299
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mIsStepInitiated:Z

    if-eqz v0, :cond_1

    .line 300
    const-string v0, "OOBE"

    const-string v1, "MainActivity have already init step list"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    :cond_0
    :goto_0
    return-void

    .line 303
    :cond_1
    iput-boolean v3, p0, Lcom/mediatek/oobe/basic/MainActivity;->mIsStepInitiated:Z

    .line 304
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/MainActivity;->setActivityList()V

    .line 305
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initStep sIsRunning?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lcom/mediatek/oobe/basic/MainActivity;->sIsRunning:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    sget-boolean v0, Lcom/mediatek/oobe/basic/MainActivity;->sIsRunning:Z

    if-nez v0, :cond_0

    .line 307
    invoke-static {v3}, Lcom/mediatek/oobe/basic/MainActivity;->setRunning(Z)V

    .line 308
    iget v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 309
    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/basic/MainActivity;->nextActivity(Z)V

    goto :goto_0
.end method

.method private isSimExist()Z
    .locals 10

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 374
    const-string v4, "OOBE"

    const-string v7, "MainActivity isSimExist() function"

    invoke-static {v4, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    const-string v4, "phone"

    invoke-virtual {p0, v4}, Lcom/mediatek/oobe/basic/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/TelephonyManager;

    iput-object v4, p0, Lcom/mediatek/oobe/basic/MainActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 377
    invoke-static {}, Lcom/mediatek/oobe/utils/Utils;->isGemini()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 378
    const-string v4, "OOBE"

    const-string v7, "MainActivity isGemini true"

    invoke-static {v4, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    iget-object v4, p0, Lcom/mediatek/oobe/basic/MainActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v4, v5}, Landroid/telephony/TelephonyManager;->hasIccCardGemini(I)Z

    move-result v0

    .line 381
    .local v0, sim1State:Z
    iget-object v4, p0, Lcom/mediatek/oobe/basic/MainActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v4, v6}, Landroid/telephony/TelephonyManager;->hasIccCardGemini(I)Z

    move-result v1

    .line 382
    .local v1, sim2State:Z
    if-nez v0, :cond_0

    if-eqz v1, :cond_2

    :cond_0
    move v4, v6

    :goto_0
    move v5, v4

    .line 399
    .end local v0           #sim1State:Z
    .end local v1           #sim2State:Z
    :cond_1
    :goto_1
    return v5

    .restart local v0       #sim1State:Z
    .restart local v1       #sim2State:Z
    :cond_2
    move v4, v5

    .line 382
    goto :goto_0

    .line 384
    .end local v0           #sim1State:Z
    .end local v1           #sim2State:Z
    :cond_3
    sget v4, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    if-ne v4, v9, :cond_5

    .line 385
    const-string v4, "OOBE"

    const-string v7, "MainActivity isSimExist, 3 cards"

    invoke-static {v4, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 386
    iget-object v4, p0, Lcom/mediatek/oobe/basic/MainActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v4, v5}, Landroid/telephony/TelephonyManager;->hasIccCardGemini(I)Z

    move-result v0

    .line 387
    .restart local v0       #sim1State:Z
    iget-object v4, p0, Lcom/mediatek/oobe/basic/MainActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v4, v6}, Landroid/telephony/TelephonyManager;->hasIccCardGemini(I)Z

    move-result v1

    .line 388
    .restart local v1       #sim2State:Z
    iget-object v4, p0, Lcom/mediatek/oobe/basic/MainActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v4, v8}, Landroid/telephony/TelephonyManager;->hasIccCardGemini(I)Z

    move-result v2

    .line 389
    .local v2, sim3State:Z
    if-nez v0, :cond_4

    if-nez v1, :cond_4

    if-eqz v2, :cond_1

    :cond_4
    move v5, v6

    goto :goto_1

    .line 390
    .end local v0           #sim1State:Z
    .end local v1           #sim2State:Z
    .end local v2           #sim3State:Z
    :cond_5
    sget v4, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    const/4 v7, 0x4

    if-ne v4, v7, :cond_7

    .line 391
    const-string v4, "OOBE"

    const-string v7, "MainActivity isSimExist, 4 cards"

    invoke-static {v4, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 392
    iget-object v4, p0, Lcom/mediatek/oobe/basic/MainActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v4, v5}, Landroid/telephony/TelephonyManager;->hasIccCardGemini(I)Z

    move-result v0

    .line 393
    .restart local v0       #sim1State:Z
    iget-object v4, p0, Lcom/mediatek/oobe/basic/MainActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v4, v6}, Landroid/telephony/TelephonyManager;->hasIccCardGemini(I)Z

    move-result v1

    .line 394
    .restart local v1       #sim2State:Z
    iget-object v4, p0, Lcom/mediatek/oobe/basic/MainActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v4, v8}, Landroid/telephony/TelephonyManager;->hasIccCardGemini(I)Z

    move-result v2

    .line 395
    .restart local v2       #sim3State:Z
    iget-object v4, p0, Lcom/mediatek/oobe/basic/MainActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v4, v9}, Landroid/telephony/TelephonyManager;->hasIccCardGemini(I)Z

    move-result v3

    .line 396
    .local v3, sim4State:Z
    if-nez v0, :cond_6

    if-nez v1, :cond_6

    if-nez v2, :cond_6

    if-eqz v3, :cond_1

    :cond_6
    move v5, v6

    goto :goto_1

    .line 398
    .end local v0           #sim1State:Z
    .end local v1           #sim2State:Z
    .end local v2           #sim3State:Z
    .end local v3           #sim4State:Z
    :cond_7
    const-string v4, "OOBE"

    const-string v5, "MainActivity isGemini false"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 399
    iget-object v4, p0, Lcom/mediatek/oobe/basic/MainActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->hasIccCard()Z

    move-result v5

    goto :goto_1
.end method

.method private isTablet()Z
    .locals 2

    .prologue
    .line 123
    const-string v0, "ro.build.characteristics"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/mediatek/oobe/basic/MainActivity;->sDeviceInfo:Ljava/lang/String;

    .line 124
    const-string v0, "OOBE"

    sget-object v1, Lcom/mediatek/oobe/basic/MainActivity;->sDeviceInfo:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    sget-object v0, Lcom/mediatek/oobe/basic/MainActivity;->sDeviceInfo:Ljava/lang/String;

    const-string v1, "tablet"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 126
    const/4 v0, 0x1

    sput-boolean v0, Lcom/mediatek/oobe/basic/MainActivity;->sIsTablet:Z

    .line 128
    :cond_0
    sget-boolean v0, Lcom/mediatek/oobe/basic/MainActivity;->sIsTablet:Z

    return v0
.end method

.method public static setRunning(Z)V
    .locals 0
    .parameter "running"

    .prologue
    .line 211
    sput-boolean p0, Lcom/mediatek/oobe/basic/MainActivity;->sIsRunning:Z

    .line 212
    return-void
.end method

.method private startAdvancedSettings()V
    .locals 3

    .prologue
    .line 494
    const-string v1, "OOBE"

    const-string v2, "startAdvancedSettings()"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 495
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.mediatek.oobe.advanced.AdvanceSettings"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 496
    .local v0, intent:Landroid/content/Intent;
    const/16 v1, 0x3e9

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/oobe/basic/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 497
    const v1, 0x7f040002

    const v2, 0x7f040001

    invoke-virtual {p0, v1, v2}, Lcom/mediatek/oobe/basic/MainActivity;->overridePendingTransition(II)V

    .line 501
    return-void
.end method


# virtual methods
.method protected nextActivity(Z)V
    .locals 3
    .parameter "bNextStep"

    .prologue
    .line 435
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MainActivity.nextActivity(), next = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mCurrentStep = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "mProgressbarMaxSize ="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mProgressbarMaxSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 437
    iput-boolean p1, p0, Lcom/mediatek/oobe/basic/MainActivity;->mIsGoToNextStep:Z

    .line 438
    if-eqz p1, :cond_1

    .line 439
    iget v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    .line 443
    :goto_0
    iget v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    iget v1, p0, Lcom/mediatek/oobe/basic/MainActivity;->mProgressbarMaxSize:I

    if-lt v0, v1, :cond_2

    .line 444
    const-string v0, "OOBE"

    const-string v1, "start advance activity"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 445
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/MainActivity;->startAdvancedSettings()V

    .line 456
    :cond_0
    :goto_1
    return-void

    .line 441
    :cond_1
    iget v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    goto :goto_0

    .line 449
    :cond_2
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MainActivity.nextActivity(), mCurrentStep = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mExecutingActivityList size = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mExecutingActivityList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 452
    iget v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    iget-object v1, p0, Lcom/mediatek/oobe/basic/MainActivity;->mExecutingActivityList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 453
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MainActivity.nextActivity(), step index = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 454
    iget-object v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mExecutingActivityList:Ljava/util/List;

    iget v1, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;->startStepActivity()V

    goto :goto_1
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "intent"

    .prologue
    const/16 v5, 0x15

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 506
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onActivityResult: requestCode = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", resultCode = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 508
    iget v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    if-ne p1, v4, :cond_2

    .line 509
    iput v3, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    .line 510
    const-string v0, "OOBE"

    const-string v1, "onActivityResult: mCurrentStep is -1, set to 0"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 511
    sget-boolean v0, Lcom/mediatek/oobe/basic/MainActivity;->sIsRunning:Z

    if-nez v0, :cond_0

    .line 512
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/MainActivity;->initStep()V

    .line 514
    :cond_0
    iget v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mProgressbarMaxSize:I

    if-nez v0, :cond_2

    .line 535
    :cond_1
    :goto_0
    return-void

    .line 519
    :cond_2
    iget v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    if-nez v0, :cond_3

    if-ne v5, p2, :cond_3

    .line 520
    const-string v0, "OOBE"

    const-string v1, "Finished by first activity"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 521
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/MainActivity;->finishOOBE()V

    goto :goto_0

    .line 525
    :cond_3
    if-ne v5, p2, :cond_4

    .line 526
    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/basic/MainActivity;->nextActivity(Z)V

    goto :goto_0

    .line 527
    :cond_4
    const/16 v0, 0x14

    if-ne v0, p2, :cond_5

    .line 528
    invoke-virtual {p0, v4}, Lcom/mediatek/oobe/basic/MainActivity;->nextActivity(Z)V

    goto :goto_0

    .line 529
    :cond_5
    const/16 v0, 0x16

    if-ne v0, p2, :cond_1

    .line 530
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MainActivity onActivityResult, cur step="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", total step="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mProgressbarMaxSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 531
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/MainActivity;->finishOOBE()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 12
    .parameter "savedInstanceState"

    .prologue
    const/4 v11, 0x2

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 222
    const-string v6, "OOBE"

    const-string v9, "onCreate OOBE 2.0"

    invoke-static {v6, v9}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 224
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    iput-wide v9, p0, Lcom/mediatek/oobe/basic/MainActivity;->mStartTime:J

    .line 225
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/MainActivity;->isSimExist()Z

    move-result v6

    iput-boolean v6, p0, Lcom/mediatek/oobe/basic/MainActivity;->mSimExist:Z

    .line 226
    const-string v6, "OOBE"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "MainActivity onCreate mSimExist="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-boolean v10, p0, Lcom/mediatek/oobe/basic/MainActivity;->mSimExist:Z

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    if-eqz p1, :cond_0

    .line 229
    const-string v6, "currentStep"

    invoke-virtual {p1, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    iput v6, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    .line 230
    const-string v6, "totalSteps"

    invoke-virtual {p1, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    iput v6, p0, Lcom/mediatek/oobe/basic/MainActivity;->mProgressbarMaxSize:I

    .line 231
    const-string v6, "OOBE"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "restore saved instance state mCurrentStep="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "mProgressbarMaxSize="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/mediatek/oobe/basic/MainActivity;->mProgressbarMaxSize:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/MainActivity;->setActivityList()V

    .line 235
    :cond_0
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/MainActivity;->isTablet()Z

    .line 236
    sget-boolean v6, Lcom/mediatek/oobe/basic/MainActivity;->sIsTablet:Z

    if-nez v6, :cond_1

    .line 237
    const-string v6, "OOBE"

    const-string v9, "It\'s phone anyway"

    invoke-static {v6, v9}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    :try_start_0
    const-string v6, "window"

    invoke-static {v6}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v6

    invoke-static {v6}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v5

    .line 240
    .local v5, wm:Landroid/view/IWindowManager;
    const/4 v6, 0x0

    invoke-interface {v5, v6}, Landroid/view/IWindowManager;->freezeRotation(I)V

    .line 241
    const-string v6, "OOBE"

    const-string v9, "Can\'t be rotated"

    invoke-static {v6, v9}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 248
    .end local v5           #wm:Landroid/view/IWindowManager;
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v9, "oobe_has_run"

    invoke-static {v6, v9, v8}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    .line 249
    .local v2, oobeHasRun:I
    if-nez v2, :cond_5

    move v6, v7

    :goto_1
    iput-boolean v6, p0, Lcom/mediatek/oobe/basic/MainActivity;->mIsFirstRun:Z

    .line 250
    iget-boolean v6, p0, Lcom/mediatek/oobe/basic/MainActivity;->mIsFirstRun:Z

    if-eqz v6, :cond_2

    .line 251
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v9, "oobe_display"

    invoke-static {v6, v9, v7}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 253
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v9, "device_provisioned"

    invoke-static {v6, v9, v8}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 256
    :cond_2
    if-nez v2, :cond_3

    .line 258
    invoke-direct {p0, v7}, Lcom/mediatek/oobe/basic/MainActivity;->disableStatusBar(Z)V

    .line 262
    :cond_3
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 263
    .local v3, pm:Landroid/content/pm/PackageManager;
    new-instance v1, Landroid/content/ComponentName;

    const-class v6, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    invoke-direct {v1, p0, v6}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 264
    .local v1, name:Landroid/content/ComponentName;
    invoke-virtual {v3, v1}, Landroid/content/pm/PackageManager;->getComponentEnabledSetting(Landroid/content/ComponentName;)I

    move-result v4

    .line 265
    .local v4, qsgDisabledState:I
    const-string v6, "OOBE"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "disable QSG on tablet qsgDisabledState"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    sget-boolean v6, Lcom/mediatek/oobe/basic/MainActivity;->sIsTablet:Z

    if-eqz v6, :cond_6

    .line 267
    if-eq v4, v11, :cond_4

    .line 268
    const-string v6, "OOBE"

    const-string v8, "tablet disable qsg"

    invoke-static {v6, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    invoke-virtual {v3, v1, v11, v7}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    .line 280
    :cond_4
    :goto_2
    new-instance v6, Landroid/content/IntentFilter;

    const-string v7, "android.intent.action.SIM_STATE_CHANGED"

    invoke-direct {v6, v7}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v6, p0, Lcom/mediatek/oobe/basic/MainActivity;->mSIMIntentFilter:Landroid/content/IntentFilter;

    .line 281
    iget-object v6, p0, Lcom/mediatek/oobe/basic/MainActivity;->mSIMIntentFilter:Landroid/content/IntentFilter;

    const-string v7, "android.intent.action.PHB_STATE_CHANGED"

    invoke-virtual {v6, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 282
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/MainActivity;->getBootMode()I

    move-result v6

    iput v6, p0, Lcom/mediatek/oobe/basic/MainActivity;->mBootMode:I

    .line 285
    iget-boolean v6, p0, Lcom/mediatek/oobe/basic/MainActivity;->mSimExist:Z

    if-nez v6, :cond_7

    iget-boolean v6, p0, Lcom/mediatek/oobe/basic/MainActivity;->mIsFirstRun:Z

    if-eqz v6, :cond_7

    iget v6, p0, Lcom/mediatek/oobe/basic/MainActivity;->mBootMode:I

    const/4 v7, 0x5

    if-eq v6, v7, :cond_7

    invoke-static {p0}, Lcom/mediatek/oobe/utils/Utils;->isWifiOnly(Landroid/content/Context;)Z

    move-result v6

    if-nez v6, :cond_7

    .line 286
    iget-object v6, p0, Lcom/mediatek/oobe/basic/MainActivity;->mHandler:Landroid/os/Handler;

    const/16 v7, 0x7d1

    const-wide/16 v8, 0x7530

    invoke-virtual {v6, v7, v8, v9}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 287
    const/16 v6, 0xbb9

    invoke-virtual {p0, v6}, Lcom/mediatek/oobe/basic/MainActivity;->showDialog(I)V

    .line 292
    :goto_3
    iget-object v6, p0, Lcom/mediatek/oobe/basic/MainActivity;->mSIMStateReceiver:Landroid/content/BroadcastReceiver;

    iget-object v7, p0, Lcom/mediatek/oobe/basic/MainActivity;->mSIMIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v6, v7}, Lcom/mediatek/oobe/basic/MainActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 293
    return-void

    .line 242
    .end local v1           #name:Landroid/content/ComponentName;
    .end local v2           #oobeHasRun:I
    .end local v3           #pm:Landroid/content/pm/PackageManager;
    .end local v4           #qsgDisabledState:I
    :catch_0
    move-exception v0

    .line 243
    .local v0, exc:Landroid/os/RemoteException;
    const-string v6, "OOBE"

    const-string v9, "Still enable to rotate the orientation"

    invoke-static {v6, v9}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .end local v0           #exc:Landroid/os/RemoteException;
    .restart local v2       #oobeHasRun:I
    :cond_5
    move v6, v8

    .line 249
    goto/16 :goto_1

    .line 273
    .restart local v1       #name:Landroid/content/ComponentName;
    .restart local v3       #pm:Landroid/content/pm/PackageManager;
    .restart local v4       #qsgDisabledState:I
    :cond_6
    if-ne v4, v11, :cond_4

    .line 274
    const-string v6, "OOBE"

    const-string v9, "phone enable qsg"

    invoke-static {v6, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    invoke-virtual {v3, v1, v8, v7}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    goto :goto_2

    .line 290
    :cond_7
    iget-object v6, p0, Lcom/mediatek/oobe/basic/MainActivity;->mHandler:Landroid/os/Handler;

    const/16 v7, 0x7d2

    invoke-virtual {v6, v7}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_3
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 3
    .parameter "id"

    .prologue
    .line 330
    const/16 v1, 0xbb9

    if-ne p1, v1, :cond_0

    .line 331
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 332
    .local v0, dialog:Landroid/app/ProgressDialog;
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f090062

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 333
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 334
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 337
    .end local v0           #dialog:Landroid/app/ProgressDialog;
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 343
    const-string v2, "OOBE"

    const-string v3, "MainActivity.onDestroy()"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    iget-object v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mSIMStateReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/basic/MainActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 345
    iget-boolean v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mSimExist:Z

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mIsFirstRun:Z

    if-eqz v2, :cond_0

    iget v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mBootMode:I

    const/4 v3, 0x5

    if-eq v2, v3, :cond_0

    .line 346
    iget-object v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mHandler:Landroid/os/Handler;

    const/16 v3, 0x7d1

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 347
    const/16 v2, 0xbb9

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/basic/MainActivity;->removeDialog(I)V

    .line 350
    :cond_0
    iput-boolean v4, p0, Lcom/mediatek/oobe/basic/MainActivity;->mIsStepInitiated:Z

    .line 351
    invoke-static {v4}, Lcom/mediatek/oobe/basic/MainActivity;->setRunning(Z)V

    .line 353
    iget-boolean v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mStatusBarDisabled:Z

    if-eqz v2, :cond_1

    .line 354
    invoke-direct {p0, v4}, Lcom/mediatek/oobe/basic/MainActivity;->disableStatusBar(Z)V

    .line 357
    :cond_1
    sget-boolean v2, Lcom/mediatek/oobe/basic/MainActivity;->sIsTablet:Z

    if-nez v2, :cond_2

    .line 358
    const-string v2, "OOBE"

    const-string v3, "It\'s phone anyway, prepare to get out of this"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    :try_start_0
    const-string v2, "window"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v1

    .line 362
    .local v1, wm:Landroid/view/IWindowManager;
    invoke-interface {v1}, Landroid/view/IWindowManager;->thawRotation()V

    .line 363
    const-string v2, "OOBE"

    const-string v3, "Can be rotated again"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 370
    .end local v1           #wm:Landroid/view/IWindowManager;
    :cond_2
    :goto_0
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 371
    return-void

    .line 364
    :catch_0
    move-exception v0

    .line 365
    .local v0, exc:Landroid/os/RemoteException;
    const-string v2, "OOBE"

    const-string v3, "Still enable to rotate the orientation"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 325
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 326
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 317
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 318
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " onResume() mIsStepInitiated="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mIsStepInitiated:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 319
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " onResume() sIsRunning="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lcom/mediatek/oobe/basic/MainActivity;->sIsRunning:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3
    .parameter "outState"

    .prologue
    .line 600
    const-string v0, "currentStep"

    iget v1, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 601
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mCurrentStep = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 602
    const-string v0, "totalSteps"

    iget v1, p0, Lcom/mediatek/oobe/basic/MainActivity;->mProgressbarMaxSize:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 603
    return-void
.end method

.method protected setActivityList()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 407
    const-string v2, "OOBE"

    const-string v3, "setActivityList()"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 408
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mExecutingActivityList:Ljava/util/List;

    .line 409
    const/4 v2, 0x0

    iput v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mProgressbarMaxSize:I

    .line 411
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mStepActivities:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_5

    .line 412
    const-string v2, "OOBE"

    iget-object v3, p0, Lcom/mediatek/oobe/basic/MainActivity;->mStepActivities:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 413
    iget-object v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mStepActivities:[Ljava/lang/String;

    aget-object v2, v2, v0

    const-string v3, "com.mediatek.oobe.basic.SIM_MANAGEMENT_SETTINGS_WIZARD"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mStepActivities:[Ljava/lang/String;

    aget-object v2, v2, v0

    const-string v3, "com.mediatek.oobe.basic.DEFAULT_SIM_SETTINGS_WIZARD"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 415
    :cond_0
    iget-boolean v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mSimExist:Z

    if-eqz v2, :cond_1

    sget v2, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    if-ne v2, v4, :cond_3

    .line 411
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 418
    :cond_2
    iget-object v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mStepActivities:[Ljava/lang/String;

    aget-object v2, v2, v0

    const-string v3, "com.mediatek.oobe.basic.OOBE_IMPORT_CONTACTS"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 419
    iget-boolean v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mSimExist:Z

    if-eqz v2, :cond_1

    .line 428
    :cond_3
    new-instance v1, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;

    iget-object v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mStepActivities:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-direct {v1, p0, v2}, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;-><init>(Lcom/mediatek/oobe/basic/MainActivity;Ljava/lang/String;)V

    .line 429
    .local v1, localStepSetting:Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;
    iget-object v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mExecutingActivityList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 430
    iget v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mProgressbarMaxSize:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mProgressbarMaxSize:I

    goto :goto_1

    .line 422
    .end local v1           #localStepSetting:Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;
    :cond_4
    iget-object v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mStepActivities:[Ljava/lang/String;

    aget-object v2, v2, v0

    const-string v3, "com.mediatek.oobe.basic.OOBE_INTERNET_CONNECTION"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 423
    sget v2, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    if-gt v2, v4, :cond_1

    invoke-static {p0}, Lcom/mediatek/oobe/utils/Utils;->isWifiOnly(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_1

    .line 432
    :cond_5
    return-void
.end method

.method public startNextActivity(Landroid/content/Intent;I)V
    .locals 4
    .parameter "intent"
    .parameter "nRequestCode"

    .prologue
    const/4 v3, -0x1

    .line 468
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MainActivity.startNextActivity(), startActivityForResult nRequestCode == "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mCurrentStep == "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    if-ne p2, v3, :cond_0

    .line 472
    const-string v0, "OOBE"

    const-string v1, "should not come here, request code == -1, finish it now"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 473
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/MainActivity;->finish()V

    .line 474
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/mediatek/oobe/basic/MainActivity;->setRunning(Z)V

    .line 475
    iput v3, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    .line 491
    :goto_0
    return-void

    .line 479
    :cond_0
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MainActivity.startNextActivity(), action="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "total_step="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mProgressbarMaxSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", current_step="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 482
    const-string v0, "oobe_step_total"

    iget v1, p0, Lcom/mediatek/oobe/basic/MainActivity;->mProgressbarMaxSize:I

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 483
    const-string v0, "oobe_step_index"

    iget v1, p0, Lcom/mediatek/oobe/basic/MainActivity;->mCurrentStep:I

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 484
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 486
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/MainActivity;->mIsGoToNextStep:Z

    if-eqz v0, :cond_1

    .line 487
    const v0, 0x7f040002

    const v1, 0x7f040001

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/oobe/basic/MainActivity;->overridePendingTransition(II)V

    goto :goto_0

    .line 489
    :cond_1
    const/high16 v0, 0x7f04

    const v1, 0x7f040003

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/oobe/basic/MainActivity;->overridePendingTransition(II)V

    goto :goto_0
.end method
