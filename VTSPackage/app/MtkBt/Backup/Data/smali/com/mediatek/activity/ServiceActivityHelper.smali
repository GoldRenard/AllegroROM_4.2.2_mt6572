.class public Lcom/mediatek/activity/ServiceActivityHelper;
.super Ljava/lang/Object;
.source "ServiceActivityHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ServiceInterface:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final DIALOG_BUSY:I = -0xd776


# instance fields
.field protected busyDialog:Landroid/app/ProgressDialog;

.field protected isServiceAvailable:Ljava/lang/Boolean;

.field public service:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TServiceInterface;"
        }
    .end annotation
.end field

.field protected serviceActivity:Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity",
            "<TServiceInterface;>;"
        }
    .end annotation
.end field

.field private serviceConn:Landroid/content/ServiceConnection;


# direct methods
.method public constructor <init>(Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity",
            "<TServiceInterface;>;)V"
        }
    .end annotation

    .prologue
    .line 89
    .local p0, this:Lcom/mediatek/activity/ServiceActivityHelper;,"Lcom/mediatek/activity/ServiceActivityHelper<TServiceInterface;>;"
    .local p1, serviceActivity:Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;,"Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity<TServiceInterface;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 81
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/activity/ServiceActivityHelper;->isServiceAvailable:Ljava/lang/Boolean;

    .line 146
    new-instance v0, Lcom/mediatek/activity/ServiceActivityHelper$1;

    invoke-direct {v0, p0}, Lcom/mediatek/activity/ServiceActivityHelper$1;-><init>(Lcom/mediatek/activity/ServiceActivityHelper;)V

    iput-object v0, p0, Lcom/mediatek/activity/ServiceActivityHelper;->serviceConn:Landroid/content/ServiceConnection;

    .line 91
    iput-object p1, p0, Lcom/mediatek/activity/ServiceActivityHelper;->serviceActivity:Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;

    .line 92
    return-void
.end method


# virtual methods
.method public acquireServiceLock()V
    .locals 2

    .prologue
    .line 99
    .local p0, this:Lcom/mediatek/activity/ServiceActivityHelper;,"Lcom/mediatek/activity/ServiceActivityHelper<TServiceInterface;>;"
    iget-object v1, p0, Lcom/mediatek/activity/ServiceActivityHelper;->isServiceAvailable:Ljava/lang/Boolean;

    monitor-enter v1

    .line 101
    const/4 v0, 0x0

    :try_start_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/activity/ServiceActivityHelper;->isServiceAvailable:Ljava/lang/Boolean;

    .line 102
    monitor-exit v1

    .line 103
    return-void

    .line 102
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public bindService(Landroid/content/Context;)Z
    .locals 4
    .parameter "context"

    .prologue
    .line 180
    .local p0, this:Lcom/mediatek/activity/ServiceActivityHelper;,"Lcom/mediatek/activity/ServiceActivityHelper<TServiceInterface;>;"
    const-string v1, "bindService()[+]"

    invoke-static {v1}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 182
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/activity/ServiceActivityHelper;->isServiceAvailable:Ljava/lang/Boolean;

    .line 183
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/mediatek/activity/ServiceActivityHelper;->serviceActivity:Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;

    invoke-interface {v2}, Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;->getServiceAction()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/mediatek/activity/ServiceActivityHelper;->serviceConn:Landroid/content/ServiceConnection;

    const/4 v3, 0x5

    invoke-virtual {p1, v1, v2, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    .line 185
    .local v0, res:Z
    if-nez v0, :cond_0

    .line 186
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bind service failed: action["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/activity/ServiceActivityHelper;->serviceActivity:Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;

    invoke-interface {v2}, Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;->getServiceAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V

    .line 188
    :cond_0
    return v0
.end method

.method public createBusyDialog(ILandroid/content/Context;)Landroid/app/Dialog;
    .locals 2
    .parameter "id"
    .parameter "context"

    .prologue
    .line 215
    .local p0, this:Lcom/mediatek/activity/ServiceActivityHelper;,"Lcom/mediatek/activity/ServiceActivityHelper<TServiceInterface;>;"
    const-string v0, "createBusyDialog()[+]"

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 218
    const v0, -0xd776

    if-eq p1, v0, :cond_0

    const/4 v0, 0x0

    .line 225
    :goto_0
    return-object v0

    .line 221
    :cond_0
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p2}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mediatek/activity/ServiceActivityHelper;->busyDialog:Landroid/app/ProgressDialog;

    .line 222
    iget-object v0, p0, Lcom/mediatek/activity/ServiceActivityHelper;->busyDialog:Landroid/app/ProgressDialog;

    const v1, 0x7f050079

    invoke-virtual {p2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 223
    iget-object v0, p0, Lcom/mediatek/activity/ServiceActivityHelper;->busyDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 224
    iget-object v0, p0, Lcom/mediatek/activity/ServiceActivityHelper;->busyDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 225
    iget-object v0, p0, Lcom/mediatek/activity/ServiceActivityHelper;->busyDialog:Landroid/app/ProgressDialog;

    goto :goto_0
.end method

.method public refreshUi(Landroid/app/Activity;)V
    .locals 2
    .parameter "activity"

    .prologue
    .line 123
    .local p0, this:Lcom/mediatek/activity/ServiceActivityHelper;,"Lcom/mediatek/activity/ServiceActivityHelper<TServiceInterface;>;"
    iget-object v1, p0, Lcom/mediatek/activity/ServiceActivityHelper;->isServiceAvailable:Ljava/lang/Boolean;

    monitor-enter v1

    .line 125
    :try_start_0
    iget-object v0, p0, Lcom/mediatek/activity/ServiceActivityHelper;->isServiceAvailable:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    .line 128
    const v0, -0xd776

    invoke-virtual {p1, v0}, Landroid/app/Activity;->showDialog(I)V

    .line 140
    :cond_0
    :goto_0
    monitor-exit v1

    .line 141
    return-void

    .line 132
    :cond_1
    iget-object v0, p0, Lcom/mediatek/activity/ServiceActivityHelper;->serviceActivity:Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;

    invoke-interface {v0}, Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;->refreshActivityUi()V

    .line 135
    iget-object v0, p0, Lcom/mediatek/activity/ServiceActivityHelper;->busyDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/activity/ServiceActivityHelper;->busyDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    const v0, -0xd776

    invoke-virtual {p1, v0}, Landroid/app/Activity;->dismissDialog(I)V

    goto :goto_0

    .line 140
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public releaseServiceLock()V
    .locals 2

    .prologue
    .line 110
    .local p0, this:Lcom/mediatek/activity/ServiceActivityHelper;,"Lcom/mediatek/activity/ServiceActivityHelper<TServiceInterface;>;"
    iget-object v1, p0, Lcom/mediatek/activity/ServiceActivityHelper;->isServiceAvailable:Ljava/lang/Boolean;

    monitor-enter v1

    .line 112
    const/4 v0, 0x1

    :try_start_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/activity/ServiceActivityHelper;->isServiceAvailable:Ljava/lang/Boolean;

    .line 113
    monitor-exit v1

    .line 114
    return-void

    .line 113
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public unbindService(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .local p0, this:Lcom/mediatek/activity/ServiceActivityHelper;,"Lcom/mediatek/activity/ServiceActivityHelper<TServiceInterface;>;"
    const/4 v1, 0x0

    .line 198
    const-string v0, "unbindService()[+]"

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 201
    iget-object v0, p0, Lcom/mediatek/activity/ServiceActivityHelper;->serviceConn:Landroid/content/ServiceConnection;

    invoke-virtual {p1, v0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 202
    iput-object v1, p0, Lcom/mediatek/activity/ServiceActivityHelper;->service:Ljava/lang/Object;

    .line 203
    iput-object v1, p0, Lcom/mediatek/activity/ServiceActivityHelper;->busyDialog:Landroid/app/ProgressDialog;

    .line 204
    return-void
.end method
