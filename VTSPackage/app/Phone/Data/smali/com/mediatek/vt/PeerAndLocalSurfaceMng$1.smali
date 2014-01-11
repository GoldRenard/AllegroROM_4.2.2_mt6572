.class Lcom/mediatek/vt/PeerAndLocalSurfaceMng$1;
.super Ljava/lang/Object;
.source "PeerAndLocalSurfaceMng.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/vt/PeerAndLocalSurfaceMng;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/vt/PeerAndLocalSurfaceMng;


# direct methods
.method constructor <init>(Lcom/mediatek/vt/PeerAndLocalSurfaceMng;)V
    .locals 0
    .parameter

    .prologue
    .line 59
    iput-object p1, p0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng$1;->this$0:Lcom/mediatek/vt/PeerAndLocalSurfaceMng;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 3
    .parameter "holder"
    .parameter "format"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 73
    iget-object v1, p0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng$1;->this$0:Lcom/mediatek/vt/PeerAndLocalSurfaceMng;

    iget-object v1, v1, Lcom/mediatek/vt/PeerAndLocalSurfaceMng;->camera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 76
    .local v0, parameters:Landroid/hardware/Camera$Parameters;
    const/16 v1, 0xb0

    const/16 v2, 0x90

    invoke-virtual {v0, v1, v2}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 77
    const/16 v1, 0x100

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setPictureFormat(I)V

    .line 78
    iget-object v1, p0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng$1;->this$0:Lcom/mediatek/vt/PeerAndLocalSurfaceMng;

    iget-object v1, v1, Lcom/mediatek/vt/PeerAndLocalSurfaceMng;->camera:Landroid/hardware/Camera;

    invoke-virtual {v1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 79
    iget-object v1, p0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng$1;->this$0:Lcom/mediatek/vt/PeerAndLocalSurfaceMng;

    iget-object v1, v1, Lcom/mediatek/vt/PeerAndLocalSurfaceMng;->camera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->startPreview()V

    .line 80
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 3
    .parameter "holder"

    .prologue
    .line 61
    iget-object v1, p0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng$1;->this$0:Lcom/mediatek/vt/PeerAndLocalSurfaceMng;

    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    move-result-object v2

    iput-object v2, v1, Lcom/mediatek/vt/PeerAndLocalSurfaceMng;->camera:Landroid/hardware/Camera;

    .line 62
    iget-object v1, p0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng$1;->this$0:Lcom/mediatek/vt/PeerAndLocalSurfaceMng;

    iget-object v1, v1, Lcom/mediatek/vt/PeerAndLocalSurfaceMng;->camera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->flatten()Ljava/lang/String;

    .line 64
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng$1;->this$0:Lcom/mediatek/vt/PeerAndLocalSurfaceMng;

    iget-object v1, v1, Lcom/mediatek/vt/PeerAndLocalSurfaceMng;->camera:Landroid/hardware/Camera;

    invoke-virtual {v1, p1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    :goto_0
    return-void

    .line 65
    :catch_0
    move-exception v0

    .line 66
    .local v0, t:Ljava/io/IOException;
    const-string v1, "PictureDemo-surfaceCallback"

    const-string v2, "Exception in setPreviewDisplay()"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2
    .parameter "holder"

    .prologue
    .line 83
    iget-object v0, p0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng$1;->this$0:Lcom/mediatek/vt/PeerAndLocalSurfaceMng;

    iget-object v0, v0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 84
    iget-object v0, p0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng$1;->this$0:Lcom/mediatek/vt/PeerAndLocalSurfaceMng;

    iget-object v0, v0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 85
    iget-object v0, p0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng$1;->this$0:Lcom/mediatek/vt/PeerAndLocalSurfaceMng;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng;->camera:Landroid/hardware/Camera;

    .line 86
    return-void
.end method
