.class public Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;
.super Lcom/mediatek/activity/CancelableActivity;
.source "OppServerActivity.java"


# static fields
.field private static final DIALOG_PUSH_CONFIRMATION:I = 0x0

.field private static final IS_ACTIVE:Ljava/lang/String; = "is_active"


# instance fields
.field private mIsActive:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/mediatek/activity/CancelableActivity;-><init>()V

    .line 66
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->mIsActive:Z

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->finishPushActivity(Z)V

    return-void
.end method

.method private declared-synchronized finishPushActivity(Z)V
    .locals 3
    .parameter "success"

    .prologue
    .line 226
    monitor-enter p0

    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "OppServerActivity.finishPushActivity()[+]: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 228
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->mIsActive:Z

    .line 229
    if-eqz p1, :cond_0

    const/4 v0, 0x1

    .line 230
    .local v0, state:I
    :goto_0
    invoke-static {p0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->getInstance(Landroid/content/Context;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppsSubmitTask(I)V

    .line 231
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->finish()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 232
    monitor-exit p0

    return-void

    .line 229
    .end local v0           #state:I
    :cond_0
    const/4 v0, 0x2

    goto :goto_0

    .line 226
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method


# virtual methods
.method protected onActivityCancel(I)V
    .locals 4
    .parameter "id"

    .prologue
    .line 72
    const v1, -0x9a9c3

    if-ne p1, v1, :cond_1

    .line 75
    const-string v1, "cancel OppServerActivity by NullCancelId broadcast."

    invoke-static {v1}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 88
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->mIsActive:Z

    .line 89
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->finish()V

    .line 90
    :goto_0
    return-void

    .line 79
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "com.mediatek.bluetooth.opp.extra.TASK_ID"

    const/4 v3, -0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 80
    .local v0, taskId:I
    if-eq v0, p1, :cond_0

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 95
    const-string v3, "OppServerActivity.onCreate()[+]"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 97
    invoke-super {p0, p1}, Lcom/mediatek/activity/CancelableActivity;->onCreate(Landroid/os/Bundle;)V

    .line 100
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 101
    .local v2, intent:Landroid/content/Intent;
    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 104
    .local v0, action:Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 106
    const-string v3, "is_active"

    invoke-virtual {p1, v3, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->mIsActive:Z

    .line 110
    :cond_0
    invoke-virtual {v2}, Landroid/content/Intent;->getFlags()I

    move-result v3

    const/high16 v4, 0x10

    and-int/2addr v3, v4

    if-eqz v3, :cond_2

    iget-boolean v3, p0, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->mIsActive:Z

    if-nez v3, :cond_2

    .line 112
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->finish()V

    .line 141
    :cond_1
    :goto_0
    return-void

    .line 117
    :cond_2
    const-string v3, "com.mediatek.bluetooth.opp.action.PUSH_REQUEST"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 119
    const-string v3, "opps puah request start..."

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 121
    iput-boolean v6, p0, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->mIsActive:Z

    .line 123
    invoke-static {p0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->getInstance(Landroid/content/Context;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppsCheckCurrentTask()Ljava/lang/String;

    move-result-object v1

    .line 124
    .local v1, errMessage:Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 126
    invoke-static {p0, v1, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 127
    invoke-direct {p0, v5}, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->finishPushActivity(Z)V

    goto :goto_0

    .line 131
    .end local v1           #errMessage:Ljava/lang/String;
    :cond_3
    const-string v3, "com.mediatek.activity.CancelableActivity.action.CANCEL_ACTIVITY"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 134
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->finish()V

    goto :goto_0

    .line 136
    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "unsupported OppsAccessRequest action: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    .line 139
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->finish()V

    goto :goto_0
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 10
    .parameter "id"

    .prologue
    .line 180
    packed-switch p1, :pswitch_data_0

    .line 216
    const/4 v5, 0x0

    :goto_0
    return-object v5

    .line 183
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 184
    .local v0, intent:Landroid/content/Intent;
    const-string v5, "com.mediatek.bluetooth.opp.extra.PEER_NAME"

    invoke-virtual {v0, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 185
    .local v2, peerName:Ljava/lang/String;
    const-string v5, "com.mediatek.bluetooth.opp.extra.OBJECT_NAME"

    invoke-virtual {v0, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 186
    .local v1, objectName:Ljava/lang/String;
    const-string v5, "com.mediatek.bluetooth.opp.extra.TOTAL_BYTES"

    const-wide/16 v6, 0x0

    invoke-virtual {v0, v5, v6, v7}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v3

    .line 189
    .local v3, totalBytes:J
    new-instance v5, Landroid/app/AlertDialog$Builder;

    invoke-direct {v5, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v6, 0x7f050032

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x7f050033

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v1, v7, v8

    const/4 v8, 0x1

    invoke-static {p0, v3, v4}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x2

    aput-object v2, v7, v8

    invoke-virtual {p0, v6, v7}, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x7f050034

    new-instance v7, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity$3;

    invoke-direct {v7, p0}, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity$3;-><init>(Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;)V

    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x7f050035

    new-instance v7, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity$2;

    invoke-direct {v7, p0}, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity$2;-><init>(Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;)V

    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    new-instance v6, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity$1;

    invoke-direct {v6, p0}, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity$1;-><init>(Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;)V

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v5

    goto :goto_0

    .line 180
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method protected onResume()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 146
    invoke-super {p0}, Lcom/mediatek/activity/CancelableActivity;->onResume()V

    .line 147
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->setVisible(Z)V

    .line 148
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->showDialog(I)V

    .line 149
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 170
    invoke-super {p0, p1}, Lcom/mediatek/activity/CancelableActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 171
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->mIsActive:Z

    if-eqz v0, :cond_0

    .line 173
    const-string v0, "is_active"

    iget-boolean v1, p0, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->mIsActive:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 175
    :cond_0
    return-void
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 154
    invoke-super {p0}, Lcom/mediatek/activity/CancelableActivity;->onStop()V

    .line 158
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->mIsActive:Z

    if-eqz v0, :cond_0

    .line 160
    invoke-static {p0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->getInstance(Landroid/content/Context;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppsSendCurrentIncomingNotification()V

    .line 162
    :cond_0
    return-void
.end method
