.class Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$3;
.super Ljava/lang/Thread;
.source "VTInCallScreenLoopback.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTSwitchCameraClick()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;


# direct methods
.method constructor <init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V
    .locals 0
    .parameter

    .prologue
    .line 1254
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$3;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1256
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInSwitchCamera:Z

    .line 1257
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->switchCamera()Z

    .line 1258
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInSwitchCamera:Z

    .line 1259
    return-void
.end method
