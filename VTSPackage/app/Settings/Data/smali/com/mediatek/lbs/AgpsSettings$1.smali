.class Lcom/mediatek/lbs/AgpsSettings$1;
.super Landroid/content/BroadcastReceiver;
.source "AgpsSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/lbs/AgpsSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/lbs/AgpsSettings;


# direct methods
.method constructor <init>(Lcom/mediatek/lbs/AgpsSettings;)V
    .locals 0
    .parameter

    .prologue
    .line 123
    iput-object p1, p0, Lcom/mediatek/lbs/AgpsSettings$1;->this$0:Lcom/mediatek/lbs/AgpsSettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 128
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings$1;->this$0:Lcom/mediatek/lbs/AgpsSettings;

    #calls: Lcom/mediatek/lbs/AgpsSettings;->updateDataConnStatus()V
    invoke-static {v0}, Lcom/mediatek/lbs/AgpsSettings;->access$000(Lcom/mediatek/lbs/AgpsSettings;)V

    .line 131
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings$1;->this$0:Lcom/mediatek/lbs/AgpsSettings;

    #calls: Lcom/mediatek/lbs/AgpsSettings;->initSlpProfileList()V
    invoke-static {v0}, Lcom/mediatek/lbs/AgpsSettings;->access$100(Lcom/mediatek/lbs/AgpsSettings;)V

    .line 132
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings$1;->this$0:Lcom/mediatek/lbs/AgpsSettings;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mDataConnReceiver "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/lbs/AgpsSettings$1;->this$0:Lcom/mediatek/lbs/AgpsSettings;

    #getter for: Lcom/mediatek/lbs/AgpsSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;
    invoke-static {v2}, Lcom/mediatek/lbs/AgpsSettings;->access$200(Lcom/mediatek/lbs/AgpsSettings;)Lcom/mediatek/common/agps/MtkAgpsManager;

    move-result-object v2

    invoke-interface {v2}, Lcom/mediatek/common/agps/MtkAgpsManager;->getProfile()Lcom/mediatek/common/agps/MtkAgpsProfile;

    move-result-object v2

    iget-object v2, v2, Lcom/mediatek/common/agps/MtkAgpsProfile;->code:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/lbs/AgpsSettings$1;->this$0:Lcom/mediatek/lbs/AgpsSettings;

    #getter for: Lcom/mediatek/lbs/AgpsSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;
    invoke-static {v2}, Lcom/mediatek/lbs/AgpsSettings;->access$200(Lcom/mediatek/lbs/AgpsSettings;)Lcom/mediatek/common/agps/MtkAgpsManager;

    move-result-object v2

    invoke-interface {v2}, Lcom/mediatek/common/agps/MtkAgpsManager;->getProfile()Lcom/mediatek/common/agps/MtkAgpsProfile;

    move-result-object v2

    iget-object v2, v2, Lcom/mediatek/common/agps/MtkAgpsProfile;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/lbs/AgpsSettings;->access$300(Lcom/mediatek/lbs/AgpsSettings;Ljava/lang/String;)V

    .line 133
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings$1;->this$0:Lcom/mediatek/lbs/AgpsSettings;

    iget-object v1, p0, Lcom/mediatek/lbs/AgpsSettings$1;->this$0:Lcom/mediatek/lbs/AgpsSettings;

    #getter for: Lcom/mediatek/lbs/AgpsSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;
    invoke-static {v1}, Lcom/mediatek/lbs/AgpsSettings;->access$200(Lcom/mediatek/lbs/AgpsSettings;)Lcom/mediatek/common/agps/MtkAgpsManager;

    move-result-object v1

    invoke-interface {v1}, Lcom/mediatek/common/agps/MtkAgpsManager;->getProfile()Lcom/mediatek/common/agps/MtkAgpsProfile;

    move-result-object v1

    #calls: Lcom/mediatek/lbs/AgpsSettings;->updateSlpProfile(Lcom/mediatek/common/agps/MtkAgpsProfile;)V
    invoke-static {v0, v1}, Lcom/mediatek/lbs/AgpsSettings;->access$400(Lcom/mediatek/lbs/AgpsSettings;Lcom/mediatek/common/agps/MtkAgpsProfile;)V

    .line 135
    return-void
.end method
