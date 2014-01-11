.class public Lcom/android/systemui/statusbar/policy/LocationController;
.super Landroid/content/BroadcastReceiver;
.source "LocationController.java"


# static fields
.field private static final GPS_NOTIFICATION_ID:I = 0x3d8d7

.field private static final TAG:Ljava/lang/String; = "StatusBar.LocationController"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mNotificationService:Landroid/app/INotificationManager;

.field private mPrivacy:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .parameter "context"

    .prologue
    .line 54
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 52
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/systemui/statusbar/policy/LocationController;->mPrivacy:Z

    .line 55
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/LocationController;->mContext:Landroid/content/Context;

    .line 57
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 58
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v2, "android.location.GPS_ENABLED_CHANGE"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 59
    const-string v2, "android.location.GPS_FIX_CHANGE"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 61
    const-string v2, "android.location.PRIVACY_OVERWRITE"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 62
    invoke-virtual {p1, p0, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 64
    const-string v2, "notification"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    .line 66
    .local v1, nm:Landroid/app/NotificationManager;
    invoke-static {}, Landroid/app/NotificationManager;->getService()Landroid/app/INotificationManager;

    move-result-object v2

    iput-object v2, p0, Lcom/android/systemui/statusbar/policy/LocationController;->mNotificationService:Landroid/app/INotificationManager;

    .line 67
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 22
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 71
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v11

    .line 72
    .local v11, action:Ljava/lang/String;
    const-string v1, "enabled"

    const/4 v2, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v12

    .line 77
    .local v12, enabled:Z
    const-string v1, "android.location.GPS_FIX_CHANGE"

    invoke-virtual {v11, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_87

    if-eqz v12, :cond_87

    .line 79
    const v13, 0x108054e

    .line 80
    .local v13, iconId:I
    const v17, 0x7f0b00aa

    .line 81
    .local v17, textResId:I
    const/16 v18, 0x1

    .line 105
    .local v18, visible:Z
    :goto_1f
    if-eqz v18, :cond_ca

    .line 106
    :try_start_21
    new-instance v3, Landroid/content/Intent;

    const-string v1, "android.settings.LOCATION_SOURCE_SETTINGS"

    invoke-direct {v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 107
    .local v3, gpsIntent:Landroid/content/Intent;
    const/high16 v1, 0x1000

    invoke-virtual {v3, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 109
    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    sget-object v6, Landroid/os/UserHandle;->CURRENT:Landroid/os/UserHandle;

    move-object/from16 v1, p1

    invoke-static/range {v1 .. v6}, Landroid/app/PendingIntent;->getActivityAsUser(Landroid/content/Context;ILandroid/content/Intent;ILandroid/os/Bundle;Landroid/os/UserHandle;)Landroid/app/PendingIntent;

    move-result-object v15

    .line 111
    .local v15, pendingIntent:Landroid/app/PendingIntent;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/systemui/statusbar/policy/LocationController;->mContext:Landroid/content/Context;

    move/from16 v0, v17

    invoke-virtual {v1, v0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v16

    .line 113
    .local v16, text:Ljava/lang/String;
    new-instance v1, Landroid/app/Notification$Builder;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/statusbar/policy/LocationController;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v13}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v1

    move-object/from16 v0, v16

    invoke-virtual {v1, v0}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v1

    invoke-virtual {v1, v15}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v8

    .line 121
    .local v8, n:Landroid/app/Notification;
    const/4 v1, 0x0

    iput-object v1, v8, Landroid/app/Notification;->tickerView:Landroid/widget/RemoteViews;

    .line 122
    const/4 v1, 0x0

    iput-object v1, v8, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 124
    const/4 v1, 0x1

    iput v1, v8, Landroid/app/Notification;->priority:I

    .line 126
    const/4 v1, 0x1

    new-array v9, v1, [I

    .line 127
    .local v9, idOut:[I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/systemui/statusbar/policy/LocationController;->mNotificationService:Landroid/app/INotificationManager;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/systemui/statusbar/policy/LocationController;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const v7, 0x3d8d7

    const/4 v10, -0x1

    invoke-interface/range {v4 .. v10}, Landroid/app/INotificationManager;->enqueueNotificationWithTag(Ljava/lang/String;Ljava/lang/String;ILandroid/app/Notification;[II)V
    :try_end_86
    .catch Landroid/os/RemoteException; {:try_start_21 .. :try_end_86} :catch_ef

    .line 148
    .end local v3           #gpsIntent:Landroid/content/Intent;
    .end local v8           #n:Landroid/app/Notification;
    .end local v9           #idOut:[I
    .end local v13           #iconId:I
    .end local v15           #pendingIntent:Landroid/app/PendingIntent;
    .end local v16           #text:Ljava/lang/String;
    .end local v17           #textResId:I
    .end local v18           #visible:Z
    :goto_86
    return-void

    .line 82
    :cond_87
    const-string v1, "android.location.GPS_ENABLED_CHANGE"

    invoke-virtual {v11, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_98

    if-nez v12, :cond_98

    .line 84
    const/16 v18, 0x0

    .line 85
    .restart local v18       #visible:Z
    const/16 v17, 0x0

    .restart local v17       #textResId:I
    move/from16 v13, v17

    .restart local v13       #iconId:I
    goto :goto_1f

    .line 87
    .end local v13           #iconId:I
    .end local v17           #textResId:I
    .end local v18           #visible:Z
    :cond_98
    const-string v1, "android.location.PRIVACY_OVERWRITE"

    invoke-virtual {v11, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_ad

    .line 88
    const-string v1, "StatusBar.LocationController"

    const-string v2, "[MtkAgpsManagerService] recv android.location.PRIVACY_OVERWRITE"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    const/4 v1, 0x1

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/android/systemui/statusbar/policy/LocationController;->mPrivacy:Z

    goto :goto_86

    .line 92
    :cond_ad
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/android/systemui/statusbar/policy/LocationController;->mPrivacy:Z

    if-eqz v1, :cond_c0

    .line 93
    const-string v1, "StatusBar.LocationController"

    const-string v2, "[MtkAgpsManagerService] This session is privacy overwrite, don\'t show the GPS icon in status bar"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/android/systemui/statusbar/policy/LocationController;->mPrivacy:Z

    goto :goto_86

    .line 99
    :cond_c0
    const v13, 0x7f0201f2

    .line 100
    .restart local v13       #iconId:I
    const v17, 0x7f0b00a9

    .line 101
    .restart local v17       #textResId:I
    const/16 v18, 0x1

    .restart local v18       #visible:Z
    goto/16 :goto_1f

    .line 135
    :cond_ca
    :try_start_ca
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/systemui/statusbar/policy/LocationController;->mNotificationService:Landroid/app/INotificationManager;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/statusbar/policy/LocationController;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    const v5, 0x3d8d7

    const/4 v6, -0x1

    invoke-interface {v1, v2, v4, v5, v6}, Landroid/app/INotificationManager;->cancelNotificationWithTag(Ljava/lang/String;Ljava/lang/String;II)V

    .line 139
    const-string v1, "notification"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/app/NotificationManager;

    .line 142
    .local v14, nm:Landroid/app/NotificationManager;
    const v1, 0x3d8d7

    invoke-virtual {v14, v1}, Landroid/app/NotificationManager;->cancel(I)V
    :try_end_ee
    .catch Landroid/os/RemoteException; {:try_start_ca .. :try_end_ee} :catch_ef

    goto :goto_86

    .line 145
    .end local v14           #nm:Landroid/app/NotificationManager;
    :catch_ef
    move-exception v1

    goto :goto_86
.end method
