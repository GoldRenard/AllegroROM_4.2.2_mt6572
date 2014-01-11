.class Lcom/mediatek/activity/CancelableActivity$1;
.super Landroid/content/BroadcastReceiver;
.source "CancelableActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/activity/CancelableActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/activity/CancelableActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/activity/CancelableActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 60
    iput-object p1, p0, Lcom/mediatek/activity/CancelableActivity$1;->this$0:Lcom/mediatek/activity/CancelableActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "CancelableActivity.onReceive()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 69
    const-string v1, "com.mediatek.activity.CancelableActivity.action.CANCEL_ACTIVITY"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 71
    const-string v1, "com.mediatek.activity.CancelableActivity.extra.ID"

    const v2, -0x9a9c3

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 73
    .local v0, id:I
    iget-object v1, p0, Lcom/mediatek/activity/CancelableActivity$1;->this$0:Lcom/mediatek/activity/CancelableActivity;

    invoke-virtual {v1, v0}, Lcom/mediatek/activity/CancelableActivity;->onActivityCancel(I)V

    .line 75
    .end local v0           #id:I
    :cond_0
    return-void
.end method
