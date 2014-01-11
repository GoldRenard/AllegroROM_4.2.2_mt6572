.class Lcom/mediatek/bluetooth/opp/adp/OppService$1;
.super Landroid/content/BroadcastReceiver;
.source "OppService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/bluetooth/opp/adp/OppService;->registerSdcardBroadcastReceiver()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/opp/adp/OppService;)V
    .locals 0
    .parameter

    .prologue
    .line 91
    iput-object p1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$1;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 96
    const-string v3, "OppService.BroadcastReceiver.onReceive()[+]"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 98
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    .line 99
    .local v2, path:Landroid/net/Uri;
    if-eqz v2, :cond_1

    .line 101
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "OppService: path["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "], oppc["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$1;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppcCurrentStoragePath:Ljava/lang/String;
    invoke-static {v4}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$000(Lcom/mediatek/bluetooth/opp/adp/OppService;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "], opps["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$1;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppsCurrentStoragePath:Ljava/lang/String;
    invoke-static {v4}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$100(Lcom/mediatek/bluetooth/opp/adp/OppService;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 104
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$1;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppcCurrentStoragePath:Ljava/lang/String;
    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$000(Lcom/mediatek/bluetooth/opp/adp/OppService;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3}, Lcom/mediatek/bluetooth/util/SystemUtils;->getExternalStorageDirectory(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 106
    .local v0, oppcCurStorage:Ljava/io/File;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 108
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$1;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppcDisconnectNative()Z

    .line 110
    :cond_0
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$1;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppsCurrentStoragePath:Ljava/lang/String;
    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$100(Lcom/mediatek/bluetooth/opp/adp/OppService;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3}, Lcom/mediatek/bluetooth/util/SystemUtils;->getExternalStorageDirectory(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 112
    .local v1, oppsCurStorage:Ljava/io/File;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 114
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$1;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppsDisconnectNative()Z

    .line 117
    .end local v0           #oppcCurStorage:Ljava/io/File;
    .end local v1           #oppsCurStorage:Ljava/io/File;
    :cond_1
    return-void
.end method
