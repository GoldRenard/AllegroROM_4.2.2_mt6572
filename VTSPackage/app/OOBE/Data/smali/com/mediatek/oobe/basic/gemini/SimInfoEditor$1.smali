.class Lcom/mediatek/oobe/basic/gemini/SimInfoEditor$1;
.super Landroid/content/BroadcastReceiver;
.source "SimInfoEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;)V
    .locals 0
    .parameter

    .prologue
    .line 90
    iput-object p1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor$1;->this$0:Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 93
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 94
    .local v0, action:Ljava/lang/String;
    const-string v2, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 96
    const-string v2, "SimInfoEditor"

    const-string v3, "ACTION_SIM_INFO_UPDATE received"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor$1;->this$0:Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;

    invoke-static {v2}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 98
    .local v1, temp:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/provider/Telephony$SIMInfo;

    iget-wide v2, v2, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor$1;->this$0:Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimID:J
    invoke-static {v4}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->access$000(Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;)J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1

    .line 99
    :cond_0
    const-string v2, "SimInfoEditor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sim card number is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor$1;->this$0:Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;

    invoke-virtual {v2}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->finish()V

    .line 104
    .end local v1           #temp:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    :cond_1
    return-void
.end method
