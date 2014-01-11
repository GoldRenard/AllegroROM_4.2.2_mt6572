.class Lcom/mediatek/settings/NoNetworkPopUpService$2;
.super Landroid/content/BroadcastReceiver;
.source "NoNetworkPopUpService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/NoNetworkPopUpService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/NoNetworkPopUpService;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/NoNetworkPopUpService;)V
    .locals 0
    .parameter

    .prologue
    .line 94
    iput-object p1, p0, Lcom/mediatek/settings/NoNetworkPopUpService$2;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 97
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 98
    .local v0, action:Ljava/lang/String;
    iget-object v1, p0, Lcom/mediatek/settings/NoNetworkPopUpService$2;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[action = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/mediatek/settings/NoNetworkPopUpService;->log(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$000(Lcom/mediatek/settings/NoNetworkPopUpService;Ljava/lang/String;)V

    .line 99
    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 100
    iget-object v1, p0, Lcom/mediatek/settings/NoNetworkPopUpService$2;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    const-string v2, "state"

    const/4 v3, 0x0

    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    #setter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mAirplaneModeEnabled:Z
    invoke-static {v1, v2}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$502(Lcom/mediatek/settings/NoNetworkPopUpService;Z)Z

    .line 104
    :cond_0
    :goto_0
    return-void

    .line 101
    :cond_1
    const-string v1, "android.intent.action.DUAL_SIM_MODE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 102
    iget-object v1, p0, Lcom/mediatek/settings/NoNetworkPopUpService$2;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    const-string v2, "mode"

    const/4 v3, -0x1

    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    #setter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mDualSimMode:I
    invoke-static {v1, v2}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$602(Lcom/mediatek/settings/NoNetworkPopUpService;I)I

    goto :goto_0
.end method
