.class Lcom/mediatek/oobe/basic/MainActivity$1;
.super Landroid/os/Handler;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/MainActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/MainActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 131
    iput-object p1, p0, Lcom/mediatek/oobe/basic/MainActivity$1;->this$0:Lcom/mediatek/oobe/basic/MainActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 134
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 143
    const-string v0, "OOBE"

    const-string v1, "MainActivity handler unknown message"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    :goto_0
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sIsRunning="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/mediatek/oobe/basic/MainActivity;->access$100()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ";mIsStepInitiated="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/oobe/basic/MainActivity$1;->this$0:Lcom/mediatek/oobe/basic/MainActivity;

    #getter for: Lcom/mediatek/oobe/basic/MainActivity;->mIsStepInitiated:Z
    invoke-static {v2}, Lcom/mediatek/oobe/basic/MainActivity;->access$200(Lcom/mediatek/oobe/basic/MainActivity;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    invoke-static {}, Lcom/mediatek/oobe/basic/MainActivity;->access$100()Z

    move-result v0

    if-nez v0, :cond_0

    .line 148
    iget-object v0, p0, Lcom/mediatek/oobe/basic/MainActivity$1;->this$0:Lcom/mediatek/oobe/basic/MainActivity;

    #calls: Lcom/mediatek/oobe/basic/MainActivity;->initStep()V
    invoke-static {v0}, Lcom/mediatek/oobe/basic/MainActivity;->access$300(Lcom/mediatek/oobe/basic/MainActivity;)V

    .line 149
    iget-object v0, p0, Lcom/mediatek/oobe/basic/MainActivity$1;->this$0:Lcom/mediatek/oobe/basic/MainActivity;

    const/16 v1, 0xbb9

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/MainActivity;->removeDialog(I)V

    .line 151
    :cond_0
    return-void

    .line 136
    :pswitch_0
    const-string v0, "OOBE"

    const-string v1, "MainActivity handler wait SIM time out"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 139
    :pswitch_1
    const-string v0, "OOBE"

    const-string v1, "MainActivity handler SIM initialization finish"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    iget-object v0, p0, Lcom/mediatek/oobe/basic/MainActivity$1;->this$0:Lcom/mediatek/oobe/basic/MainActivity;

    #getter for: Lcom/mediatek/oobe/basic/MainActivity;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/mediatek/oobe/basic/MainActivity;->access$000(Lcom/mediatek/oobe/basic/MainActivity;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x7d1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_0

    .line 134
    :pswitch_data_0
    .packed-switch 0x7d1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
