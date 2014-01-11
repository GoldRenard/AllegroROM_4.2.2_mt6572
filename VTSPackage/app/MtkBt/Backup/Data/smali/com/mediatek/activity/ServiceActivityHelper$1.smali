.class Lcom/mediatek/activity/ServiceActivityHelper$1;
.super Ljava/lang/Object;
.source "ServiceActivityHelper.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/activity/ServiceActivityHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/activity/ServiceActivityHelper;


# direct methods
.method constructor <init>(Lcom/mediatek/activity/ServiceActivityHelper;)V
    .locals 0
    .parameter

    .prologue
    .line 146
    .local p0, this:Lcom/mediatek/activity/ServiceActivityHelper$1;,"Lcom/mediatek/activity/ServiceActivityHelper.1;"
    iput-object p1, p0, Lcom/mediatek/activity/ServiceActivityHelper$1;->this$0:Lcom/mediatek/activity/ServiceActivityHelper;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .parameter "className"
    .parameter "service"

    .prologue
    .line 150
    .local p0, this:Lcom/mediatek/activity/ServiceActivityHelper$1;,"Lcom/mediatek/activity/ServiceActivityHelper.1;"
    const-string v0, "onServiceConnected()[+]"

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->i(Ljava/lang/String;)V

    .line 151
    iget-object v0, p0, Lcom/mediatek/activity/ServiceActivityHelper$1;->this$0:Lcom/mediatek/activity/ServiceActivityHelper;

    iget-object v1, p0, Lcom/mediatek/activity/ServiceActivityHelper$1;->this$0:Lcom/mediatek/activity/ServiceActivityHelper;

    iget-object v1, v1, Lcom/mediatek/activity/ServiceActivityHelper;->serviceActivity:Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;

    invoke-interface {v1, p2}, Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;->asInterface(Landroid/os/IBinder;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v0, Lcom/mediatek/activity/ServiceActivityHelper;->service:Ljava/lang/Object;

    .line 152
    iget-object v0, p0, Lcom/mediatek/activity/ServiceActivityHelper$1;->this$0:Lcom/mediatek/activity/ServiceActivityHelper;

    iget-object v0, v0, Lcom/mediatek/activity/ServiceActivityHelper;->serviceActivity:Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;

    invoke-interface {v0}, Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;->onServiceConnected()V

    .line 153
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 3
    .parameter "className"

    .prologue
    .line 159
    .local p0, this:Lcom/mediatek/activity/ServiceActivityHelper$1;,"Lcom/mediatek/activity/ServiceActivityHelper.1;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onServiceDisconnected()[+] component["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/util/BtLog;->w(Ljava/lang/String;)V

    .line 160
    iget-object v1, p0, Lcom/mediatek/activity/ServiceActivityHelper$1;->this$0:Lcom/mediatek/activity/ServiceActivityHelper;

    iget-object v1, v1, Lcom/mediatek/activity/ServiceActivityHelper;->serviceActivity:Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;

    invoke-interface {v1}, Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;->onServiceDisconnected()V

    .line 161
    iget-object v1, p0, Lcom/mediatek/activity/ServiceActivityHelper$1;->this$0:Lcom/mediatek/activity/ServiceActivityHelper;

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/mediatek/activity/ServiceActivityHelper;->service:Ljava/lang/Object;

    .line 164
    iget-object v1, p0, Lcom/mediatek/activity/ServiceActivityHelper$1;->this$0:Lcom/mediatek/activity/ServiceActivityHelper;

    iget-object v1, v1, Lcom/mediatek/activity/ServiceActivityHelper;->serviceActivity:Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;

    instance-of v1, v1, Landroid/app/Activity;

    if-eqz v1, :cond_0

    .line 166
    iget-object v1, p0, Lcom/mediatek/activity/ServiceActivityHelper$1;->this$0:Lcom/mediatek/activity/ServiceActivityHelper;

    iget-object v0, v1, Lcom/mediatek/activity/ServiceActivityHelper;->serviceActivity:Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;

    check-cast v0, Landroid/app/Activity;

    .line 167
    .local v0, activity:Landroid/app/Activity;
    const v1, 0x7f05007a

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 168
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 170
    .end local v0           #activity:Landroid/app/Activity;
    :cond_0
    return-void
.end method
