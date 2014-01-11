.class Lcom/mediatek/settings/VTAdvancedSetting$1;
.super Landroid/content/BroadcastReceiver;
.source "VTAdvancedSetting.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/VTAdvancedSetting;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/VTAdvancedSetting;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/VTAdvancedSetting;)V
    .locals 0
    .parameter

    .prologue
    .line 133
    iput-object p1, p0, Lcom/mediatek/settings/VTAdvancedSetting$1;->this$0:Lcom/mediatek/settings/VTAdvancedSetting;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 136
    const-string v1, "Settings/VTAdvancedSetting"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[action = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 138
    .local v0, action:Ljava/lang/String;
    const-string v1, "Settings/VTAdvancedSetting"

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

    .line 139
    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 140
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSetting$1;->this$0:Lcom/mediatek/settings/VTAdvancedSetting;

    #calls: Lcom/mediatek/settings/VTAdvancedSetting;->setScreenEnabled()V
    invoke-static {v1}, Lcom/mediatek/settings/VTAdvancedSetting;->access$000(Lcom/mediatek/settings/VTAdvancedSetting;)V

    .line 147
    :cond_0
    :goto_0
    return-void

    .line 141
    :cond_1
    const-string v1, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 142
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSetting$1;->this$0:Lcom/mediatek/settings/VTAdvancedSetting;

    #calls: Lcom/mediatek/settings/VTAdvancedSetting;->setScreenEnabled()V
    invoke-static {v1}, Lcom/mediatek/settings/VTAdvancedSetting;->access$000(Lcom/mediatek/settings/VTAdvancedSetting;)V

    goto :goto_0

    .line 143
    :cond_2
    const-string v1, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 144
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSetting$1;->this$0:Lcom/mediatek/settings/VTAdvancedSetting;

    #calls: Lcom/mediatek/settings/VTAdvancedSetting;->findSimId()V
    invoke-static {v1}, Lcom/mediatek/settings/VTAdvancedSetting;->access$100(Lcom/mediatek/settings/VTAdvancedSetting;)V

    .line 145
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSetting$1;->this$0:Lcom/mediatek/settings/VTAdvancedSetting;

    #calls: Lcom/mediatek/settings/VTAdvancedSetting;->setScreenEnabled()V
    invoke-static {v1}, Lcom/mediatek/settings/VTAdvancedSetting;->access$000(Lcom/mediatek/settings/VTAdvancedSetting;)V

    goto :goto_0
.end method
