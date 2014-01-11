.class Lcom/mediatek/settings/OthersSettings$1;
.super Landroid/content/BroadcastReceiver;
.source "OthersSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/OthersSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/OthersSettings;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/OthersSettings;)V
    .locals 0
    .parameter

    .prologue
    .line 54
    iput-object p1, p0, Lcom/mediatek/settings/OthersSettings$1;->this$0:Lcom/mediatek/settings/OthersSettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 57
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 58
    .local v0, action:Ljava/lang/String;
    const-string v1, "Settings/OthersSettings"

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

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 60
    iget-object v1, p0, Lcom/mediatek/settings/OthersSettings$1;->this$0:Lcom/mediatek/settings/OthersSettings;

    #calls: Lcom/mediatek/settings/OthersSettings;->setScreenEnabled()V
    invoke-static {v1}, Lcom/mediatek/settings/OthersSettings;->access$000(Lcom/mediatek/settings/OthersSettings;)V

    .line 66
    :cond_0
    :goto_0
    return-void

    .line 61
    :cond_1
    const-string v1, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 62
    iget-object v1, p0, Lcom/mediatek/settings/OthersSettings$1;->this$0:Lcom/mediatek/settings/OthersSettings;

    #calls: Lcom/mediatek/settings/OthersSettings;->setScreenEnabled()V
    invoke-static {v1}, Lcom/mediatek/settings/OthersSettings;->access$000(Lcom/mediatek/settings/OthersSettings;)V

    goto :goto_0

    .line 63
    :cond_2
    const-string v1, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 64
    iget-object v1, p0, Lcom/mediatek/settings/OthersSettings$1;->this$0:Lcom/mediatek/settings/OthersSettings;

    #calls: Lcom/mediatek/settings/OthersSettings;->setScreenEnabled()V
    invoke-static {v1}, Lcom/mediatek/settings/OthersSettings;->access$000(Lcom/mediatek/settings/OthersSettings;)V

    goto :goto_0
.end method
