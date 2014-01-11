.class public Lcom/mediatek/vt/test/VTTestActivity;
.super Landroid/app/Activity;
.source "VTTestActivity.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "VTTestActivity"


# instance fields
.field private mCamera:Landroid/hardware/Camera;

.field private mLocalSurfaceView:Landroid/view/SurfaceView;

.field private mPeerSurfaceView:Landroid/view/SurfaceView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public getCamera()Landroid/hardware/Camera;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/mediatek/vt/test/VTTestActivity;->mCamera:Landroid/hardware/Camera;

    return-object v0
.end method

.method public getLocalSurfaceHolder()Landroid/view/SurfaceHolder;
    .locals 1

    .prologue
    .line 62
    const-string v0, "getLocalSurfaceHolder()"

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/test/VTTestActivity;->log(Ljava/lang/String;)V

    .line 63
    iget-object v0, p0, Lcom/mediatek/vt/test/VTTestActivity;->mLocalSurfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    return-object v0
.end method

.method public getPeerSurfaceHolder()Landroid/view/SurfaceHolder;
    .locals 1

    .prologue
    .line 57
    const-string v0, "getPeerSurfaceHolder()"

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/test/VTTestActivity;->log(Ljava/lang/String;)V

    .line 58
    iget-object v0, p0, Lcom/mediatek/vt/test/VTTestActivity;->mPeerSurfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    return-object v0
.end method

.method log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 26
    const-string v0, "VTTestActivity"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 31
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 32
    const v0, 0x7f040043

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/test/VTTestActivity;->setContentView(I)V

    .line 33
    const-string v0, "VTTestActivity onCreate()"

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/test/VTTestActivity;->log(Ljava/lang/String;)V

    .line 35
    const v0, 0x7f080122

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/test/VTTestActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/SurfaceView;

    iput-object v0, p0, Lcom/mediatek/vt/test/VTTestActivity;->mPeerSurfaceView:Landroid/view/SurfaceView;

    .line 36
    const v0, 0x7f080128

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/test/VTTestActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/SurfaceView;

    iput-object v0, p0, Lcom/mediatek/vt/test/VTTestActivity;->mLocalSurfaceView:Landroid/view/SurfaceView;

    .line 44
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 48
    const-string v0, "CameraActivity onDestroy()"

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/test/VTTestActivity;->log(Ljava/lang/String;)V

    .line 49
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 50
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 2
    .parameter "holder"
    .parameter "format"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 70
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/vt/test/VTTestActivity;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 71
    .local v0, p:Landroid/hardware/Camera$Parameters;
    invoke-virtual {v0, p3, p4}, Landroid/hardware/Camera$Parameters;->setPictureSize(II)V

    .line 72
    iget-object v1, p0, Lcom/mediatek/vt/test/VTTestActivity;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 73
    iget-object v1, p0, Lcom/mediatek/vt/test/VTTestActivity;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1, p1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 74
    iget-object v1, p0, Lcom/mediatek/vt/test/VTTestActivity;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->startPreview()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    .end local v0           #p:Landroid/hardware/Camera$Parameters;
    :goto_0
    return-void

    .line 75
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1
    .parameter "holder"

    .prologue
    .line 82
    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/vt/test/VTTestActivity;->mCamera:Landroid/hardware/Camera;

    .line 83
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1
    .parameter "holder"

    .prologue
    .line 87
    iget-object v0, p0, Lcom/mediatek/vt/test/VTTestActivity;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 88
    iget-object v0, p0, Lcom/mediatek/vt/test/VTTestActivity;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 89
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/vt/test/VTTestActivity;->mCamera:Landroid/hardware/Camera;

    .line 90
    return-void
.end method
