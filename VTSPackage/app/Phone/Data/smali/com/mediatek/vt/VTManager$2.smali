.class Lcom/mediatek/vt/VTManager$2;
.super Ljava/lang/Thread;
.source "VTManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/vt/VTManager;->createThreads()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/vt/VTManager;


# direct methods
.method constructor <init>(Lcom/mediatek/vt/VTManager;)V
    .locals 0
    .parameter

    .prologue
    .line 205
    iput-object p1, p0, Lcom/mediatek/vt/VTManager$2;->this$0:Lcom/mediatek/vt/VTManager;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 208
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 209
    monitor-enter p0

    .line 210
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/vt/VTManager$2;->this$0:Lcom/mediatek/vt/VTManager;

    new-instance v2, Lcom/mediatek/vt/VTManager$TelMsgHandler;

    iget-object v3, p0, Lcom/mediatek/vt/VTManager$2;->this$0:Lcom/mediatek/vt/VTManager;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lcom/mediatek/vt/VTManager$TelMsgHandler;-><init>(Lcom/mediatek/vt/VTManager;Lcom/mediatek/vt/VTManager$1;)V

    iput-object v2, v1, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    .line 211
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 212
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 214
    const-string v1, "VTManager"

    const-string v2, "register TelMsg, notify--sync"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget v1, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    if-ge v0, v1, :cond_0

    .line 217
    iget-object v1, p0, Lcom/mediatek/vt/VTManager$2;->this$0:Lcom/mediatek/vt/VTManager;

    iget-object v1, v1, Lcom/mediatek/vt/VTManager;->mCallManager:Ljava/lang/Object;

    check-cast v1, Lcom/android/internal/telephony/gemini/MTKCallManager;

    iget-object v2, p0, Lcom/mediatek/vt/VTManager$2;->this$0:Lcom/mediatek/vt/VTManager;

    iget-object v2, v2, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    const/4 v3, 0x6

    iget-object v4, p0, Lcom/mediatek/vt/VTManager$2;->this$0:Lcom/mediatek/vt/VTManager;

    #getter for: Lcom/mediatek/vt/VTManager;->simSN:[I
    invoke-static {v4}, Lcom/mediatek/vt/VTManager;->access$200(Lcom/mediatek/vt/VTManager;)[I

    move-result-object v4

    aget v4, v4, v0

    invoke-virtual {v1, v2, v3, v5, v4}, Lcom/android/internal/telephony/gemini/MTKCallManager;->registerForVtStatusInfoGemini(Landroid/os/Handler;ILjava/lang/Object;I)V

    .line 218
    iget-object v1, p0, Lcom/mediatek/vt/VTManager$2;->this$0:Lcom/mediatek/vt/VTManager;

    iget-object v1, v1, Lcom/mediatek/vt/VTManager;->mCallManager:Ljava/lang/Object;

    check-cast v1, Lcom/android/internal/telephony/gemini/MTKCallManager;

    iget-object v2, p0, Lcom/mediatek/vt/VTManager$2;->this$0:Lcom/mediatek/vt/VTManager;

    iget-object v2, v2, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    const/4 v3, 0x7

    iget-object v4, p0, Lcom/mediatek/vt/VTManager$2;->this$0:Lcom/mediatek/vt/VTManager;

    #getter for: Lcom/mediatek/vt/VTManager;->simSN:[I
    invoke-static {v4}, Lcom/mediatek/vt/VTManager;->access$200(Lcom/mediatek/vt/VTManager;)[I

    move-result-object v4

    aget v4, v4, v0

    invoke-virtual {v1, v2, v3, v5, v4}, Lcom/android/internal/telephony/gemini/MTKCallManager;->registerForVtRingInfoGemini(Landroid/os/Handler;ILjava/lang/Object;I)V

    .line 216
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 212
    .end local v0           #i:I
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 231
    .restart local v0       #i:I
    :cond_0
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 232
    return-void
.end method
