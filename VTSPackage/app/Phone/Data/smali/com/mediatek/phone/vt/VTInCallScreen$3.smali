.class Lcom/mediatek/phone/vt/VTInCallScreen$3;
.super Ljava/lang/Thread;
.source "VTInCallScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/phone/vt/VTInCallScreen;->onVTSwitchCameraClick()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/phone/vt/VTInCallScreen;


# direct methods
.method constructor <init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V
    .locals 0
    .parameter

    .prologue
    .line 1263
    iput-object p1, p0, Lcom/mediatek/phone/vt/VTInCallScreen$3;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1265
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInSwitchCamera:Z

    .line 1266
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->switchCamera()Z

    .line 1267
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInSwitchCamera:Z

    .line 1268
    return-void
.end method
