.class public Lcom/mediatek/vt/VTSettings;
.super Ljava/lang/Object;
.source "VTSettings.java"


# static fields
.field static final CAMERA_ZOOM_SCALE_LEVELS:I = 0x10

.field private static final DEBUG:Z = true

.field static final KEY_CAMERA:Ljava/lang/String; = "camera"

.field static final KEY_IS_MUTE:Ljava/lang/String; = "microphone_is_mute"

.field static final KEY_LOCAL_IMAGE_PATH:Ljava/lang/String; = "KEY_LOCAL_IMAGE_PATH"

.field static final KEY_LOCAL_IMAGE_TYPE:Ljava/lang/String; = "KEY_LOCAL_IMAGE_TYPE"

.field static final KEY_LOCAL_VIDEO_TYPE:Ljava/lang/String; = "KEY_LOCAL_VIDEO_TYPE"

.field static final KEY_SPEAKER_IS_ON:Ljava/lang/String; = "SPEAKER_IS_ON"

.field static final KEY_VIDEO_QUALITY:Ljava/lang/String; = "video_quality"

.field public static final OFF:I = 0x0

.field public static final ON:I = 0x1

.field private static final TAG:Ljava/lang/String; = "VTSettings"

.field static final VTSETTING_FILE:Ljava/lang/String; = "vt_settings"


# instance fields
.field mCameraParamters:Lcom/mediatek/vt/CameraParamters;

.field mCameraZoomIncVal:I

.field mContext:Landroid/content/Context;

.field mImagePath:Ljava/lang/String;

.field mIsSwitch:Z

.field mLocalSurface:Landroid/view/SurfaceHolder;

.field mPeerSurface:Landroid/view/SurfaceHolder;

.field mVideoQuality:I

.field mVideoType:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public canDecBrightness()Z
    .locals 4

    .prologue
    .line 179
    const-string v2, "VTSettings"

    const-string v3, "canDecBrightness"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    iget-object v2, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v2}, Lcom/mediatek/vt/CameraParamters;->getExposureCompensation()I

    move-result v1

    .line 181
    .local v1, value:I
    iget-object v2, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v2}, Lcom/mediatek/vt/CameraParamters;->getMinExposureCompensation()I

    move-result v0

    .line 182
    .local v0, min:I
    if-le v1, v0, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public canDecContrast()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 289
    const-string v2, "VTSettings"

    const-string v3, "canDecContrast"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    iget-object v2, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v2}, Lcom/mediatek/vt/CameraParamters;->getSupportedContrastMode()Ljava/util/List;

    move-result-object v0

    .line 291
    .local v0, list:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_1

    .line 295
    :cond_0
    :goto_0
    return v1

    :cond_1
    const-string v2, "low"

    invoke-virtual {p0}, Lcom/mediatek/vt/VTSettings;->getContrastMode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public canDecZoom()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 239
    const-string v1, "VTSettings"

    const-string v2, "canDecZoom"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    iget-object v1, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v1}, Lcom/mediatek/vt/CameraParamters;->isZoomSupported()Z

    move-result v1

    if-nez v1, :cond_1

    .line 243
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/vt/VTSettings;->getZoom()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public canIncBrightness()Z
    .locals 4

    .prologue
    .line 159
    const-string v2, "VTSettings"

    const-string v3, "getBrightnessMode"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    iget-object v2, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v2}, Lcom/mediatek/vt/CameraParamters;->getExposureCompensation()I

    move-result v1

    .line 161
    .local v1, value:I
    iget-object v2, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v2}, Lcom/mediatek/vt/CameraParamters;->getMaxExposureCompensation()I

    move-result v0

    .line 162
    .local v0, max:I
    if-ge v1, v0, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public canIncContrast()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 263
    const-string v2, "VTSettings"

    const-string v3, "canIncContrast"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    iget-object v2, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v2}, Lcom/mediatek/vt/CameraParamters;->getSupportedContrastMode()Ljava/util/List;

    move-result-object v0

    .line 265
    .local v0, list:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_1

    .line 269
    :cond_0
    :goto_0
    return v1

    :cond_1
    const-string v2, "high"

    invoke-virtual {p0}, Lcom/mediatek/vt/VTSettings;->getContrastMode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public canIncZoom()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 221
    const-string v1, "VTSettings"

    const-string v2, "canIncZoom"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    iget-object v1, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v1}, Lcom/mediatek/vt/CameraParamters;->isZoomSupported()Z

    move-result v1

    if-nez v1, :cond_1

    .line 225
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/vt/VTSettings;->getZoom()I

    move-result v1

    iget-object v2, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v2}, Lcom/mediatek/vt/CameraParamters;->getMaxZoom()I

    move-result v2

    if-ge v1, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public decBrightness()Z
    .locals 5

    .prologue
    .line 166
    const-string v3, "VTSettings"

    const-string v4, "decBrightness"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    iget-object v3, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v3}, Lcom/mediatek/vt/CameraParamters;->getExposureCompensation()I

    move-result v2

    .line 168
    .local v2, value:I
    iget-object v3, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v3}, Lcom/mediatek/vt/CameraParamters;->getMinExposureCompensation()I

    move-result v0

    .line 169
    .local v0, min:I
    iget-object v3, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v3}, Lcom/mediatek/vt/CameraParamters;->getExposureCompensationStep()F

    move-result v1

    .line 170
    .local v1, step:F
    int-to-float v3, v2

    sub-float/2addr v3, v1

    float-to-int v2, v3

    .line 171
    if-ge v2, v0, :cond_0

    .line 172
    move v2, v0

    .line 174
    :cond_0
    iget-object v3, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v3, v2}, Lcom/mediatek/vt/CameraParamters;->setExposureCompensation(I)V

    .line 175
    const/4 v3, 0x1

    return v3
.end method

.method public decContrast()Z
    .locals 3

    .prologue
    .line 273
    const-string v1, "VTSettings"

    const-string v2, "decContrast"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 274
    invoke-virtual {p0}, Lcom/mediatek/vt/VTSettings;->getContrastMode()Ljava/lang/String;

    move-result-object v0

    .line 275
    .local v0, value:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 276
    iget-object v1, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    const-string v2, "low"

    invoke-virtual {v1, v2}, Lcom/mediatek/vt/CameraParamters;->setContrastMode(Ljava/lang/String;)V

    .line 285
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1

    .line 277
    :cond_0
    const-string v1, "high"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 278
    iget-object v1, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    const-string v2, "middle"

    invoke-virtual {v1, v2}, Lcom/mediatek/vt/CameraParamters;->setContrastMode(Ljava/lang/String;)V

    goto :goto_0

    .line 279
    :cond_1
    const-string v1, "middle"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 280
    iget-object v1, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    const-string v2, "low"

    invoke-virtual {v1, v2}, Lcom/mediatek/vt/CameraParamters;->setContrastMode(Ljava/lang/String;)V

    goto :goto_0

    .line 282
    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public decZoom()Z
    .locals 3

    .prologue
    .line 229
    const-string v1, "VTSettings"

    const-string v2, "decZoom"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    invoke-virtual {p0}, Lcom/mediatek/vt/VTSettings;->getZoom()I

    move-result v1

    iget v2, p0, Lcom/mediatek/vt/VTSettings;->mCameraZoomIncVal:I

    sub-int v0, v1, v2

    .line 231
    .local v0, value:I
    if-gez v0, :cond_0

    .line 232
    const/4 v0, 0x0

    .line 234
    :cond_0
    iget-object v1, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v1, v0}, Lcom/mediatek/vt/CameraParamters;->setZoom(I)V

    .line 235
    const/4 v1, 0x1

    return v1
.end method

.method deinit()V
    .locals 1

    .prologue
    .line 99
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    .line 100
    return-void
.end method

.method public getBrightnessMode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    if-nez v0, :cond_0

    .line 188
    const/4 v0, 0x0

    .line 190
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v0}, Lcom/mediatek/vt/CameraParamters;->getExposure()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method getCameraSettings()V
    .locals 1

    .prologue
    .line 104
    invoke-static {}, Lcom/mediatek/vt/VTelProvider;->getParameters()Lcom/mediatek/vt/CameraParamters;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    .line 105
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v0}, Lcom/mediatek/vt/CameraParamters;->isZoomSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 106
    const/4 v0, 0x1

    iput v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraZoomIncVal:I

    .line 112
    :cond_0
    return-void
.end method

.method public getCameraSettingsForTest()Lcom/mediatek/vt/CameraParamters;
    .locals 2

    .prologue
    .line 466
    const-string v0, "VTSettings"

    const-string v1, "call function getCameraSettings()"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 467
    invoke-virtual {p0}, Lcom/mediatek/vt/VTSettings;->getCameraSettings()V

    .line 468
    const-string v0, "VTSettings"

    const-string v1, "call function getCameraSettings() finished"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 469
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    return-object v0
.end method

.method public getColorEffect()Ljava/lang/String;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    if-nez v0, :cond_0

    .line 132
    const/4 v0, 0x0

    .line 134
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v0}, Lcom/mediatek/vt/CameraParamters;->getColorEffect()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getContrastMode()Ljava/lang/String;
    .locals 4

    .prologue
    .line 370
    iget-object v1, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    if-nez v1, :cond_0

    .line 371
    const/4 v0, 0x0

    .line 375
    :goto_0
    return-object v0

    .line 373
    :cond_0
    iget-object v1, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v1}, Lcom/mediatek/vt/CameraParamters;->getContrastMode()Ljava/lang/String;

    move-result-object v0

    .line 374
    .local v0, value:Ljava/lang/String;
    const-string v1, "VTSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getContrastMode ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method getDefaultSettings()V
    .locals 1

    .prologue
    .line 116
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    .line 121
    return-void
.end method

.method public getImagePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 424
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mImagePath:Ljava/lang/String;

    return-object v0
.end method

.method public getIsSwitch()Z
    .locals 1

    .prologue
    .line 432
    iget-boolean v0, p0, Lcom/mediatek/vt/VTSettings;->mIsSwitch:Z

    return v0
.end method

.method public getLocalSurface()Landroid/view/SurfaceHolder;
    .locals 1

    .prologue
    .line 440
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mLocalSurface:Landroid/view/SurfaceHolder;

    return-object v0
.end method

.method public getNightMode()Z
    .locals 2

    .prologue
    .line 356
    invoke-virtual {p0}, Lcom/mediatek/vt/VTSettings;->getSceneMode()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 357
    const/4 v0, 0x0

    .line 359
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/vt/VTSettings;->getSceneMode()Ljava/lang/String;

    move-result-object v0

    const-string v1, "night"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public getPeerSurface()Landroid/view/SurfaceHolder;
    .locals 1

    .prologue
    .line 448
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mPeerSurface:Landroid/view/SurfaceHolder;

    return-object v0
.end method

.method public getSceneMode()Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 394
    iget-object v1, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    if-nez v1, :cond_0

    .line 403
    :goto_0
    return-object v0

    .line 397
    :cond_0
    iget-object v1, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v1}, Lcom/mediatek/vt/CameraParamters;->getSceneMode()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    .line 398
    const-string v1, "VTSettings"

    const-string v2, "mCameraParamters.getSceneMode() is null"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 401
    :cond_1
    const-string v0, "VTSettings"

    iget-object v1, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v1}, Lcom/mediatek/vt/CameraParamters;->getSceneMode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 403
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v0}, Lcom/mediatek/vt/CameraParamters;->getSceneMode()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getSupportedBrightnessMode()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 203
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    if-nez v0, :cond_0

    .line 204
    const/4 v0, 0x0

    .line 206
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v0}, Lcom/mediatek/vt/CameraParamters;->getSupportedExposure()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public getSupportedColorEffects()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 138
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    if-nez v0, :cond_0

    .line 139
    const/4 v0, 0x0

    .line 141
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v0}, Lcom/mediatek/vt/CameraParamters;->getSupportedColorEffects()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public getSupportedContrastMode()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 387
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    if-nez v0, :cond_0

    .line 388
    const/4 v0, 0x0

    .line 390
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v0}, Lcom/mediatek/vt/CameraParamters;->getSupportedContrastMode()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public getSupportedSceneModes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 363
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    if-nez v0, :cond_0

    .line 364
    const/4 v0, 0x0

    .line 366
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v0}, Lcom/mediatek/vt/CameraParamters;->getSupportedSceneModes()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public getVideoQuality()I
    .locals 1

    .prologue
    .line 456
    iget v0, p0, Lcom/mediatek/vt/VTSettings;->mVideoQuality:I

    return v0
.end method

.method public getVideoType()I
    .locals 1

    .prologue
    .line 416
    iget v0, p0, Lcom/mediatek/vt/VTSettings;->mVideoType:I

    return v0
.end method

.method public getZoom()I
    .locals 2

    .prologue
    .line 325
    const-string v0, "VTSettings"

    const-string v1, "getZoom"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    if-nez v0, :cond_0

    .line 327
    const/4 v0, 0x0

    .line 329
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v0}, Lcom/mediatek/vt/CameraParamters;->getZoom()I

    move-result v0

    goto :goto_0
.end method

.method public getZoomRatios()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 310
    const-string v0, "VTSettings"

    const-string v1, "getZoomRatios"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 311
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    if-nez v0, :cond_0

    .line 312
    const/4 v0, 0x0

    .line 314
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v0}, Lcom/mediatek/vt/CameraParamters;->getZoomRatios()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public incBrightness()Z
    .locals 5

    .prologue
    .line 146
    const-string v3, "VTSettings"

    const-string v4, "incBrightness"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    iget-object v3, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v3}, Lcom/mediatek/vt/CameraParamters;->getExposureCompensation()I

    move-result v2

    .line 148
    .local v2, value:I
    iget-object v3, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v3}, Lcom/mediatek/vt/CameraParamters;->getMaxExposureCompensation()I

    move-result v0

    .line 149
    .local v0, max:I
    iget-object v3, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v3}, Lcom/mediatek/vt/CameraParamters;->getExposureCompensationStep()F

    move-result v1

    .line 150
    .local v1, step:F
    int-to-float v3, v2

    add-float/2addr v3, v1

    float-to-int v2, v3

    .line 151
    if-le v2, v0, :cond_0

    .line 152
    move v2, v0

    .line 154
    :cond_0
    iget-object v3, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v3, v2}, Lcom/mediatek/vt/CameraParamters;->setExposureCompensation(I)V

    .line 155
    const/4 v3, 0x1

    return v3
.end method

.method public incContrast()Z
    .locals 3

    .prologue
    .line 247
    const-string v1, "VTSettings"

    const-string v2, "incContrast"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    invoke-virtual {p0}, Lcom/mediatek/vt/VTSettings;->getContrastMode()Ljava/lang/String;

    move-result-object v0

    .line 249
    .local v0, value:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 250
    iget-object v1, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    const-string v2, "high"

    invoke-virtual {v1, v2}, Lcom/mediatek/vt/CameraParamters;->setContrastMode(Ljava/lang/String;)V

    .line 259
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1

    .line 251
    :cond_0
    const-string v1, "low"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 252
    iget-object v1, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    const-string v2, "middle"

    invoke-virtual {v1, v2}, Lcom/mediatek/vt/CameraParamters;->setContrastMode(Ljava/lang/String;)V

    goto :goto_0

    .line 253
    :cond_1
    const-string v1, "middle"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 254
    iget-object v1, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    const-string v2, "high"

    invoke-virtual {v1, v2}, Lcom/mediatek/vt/CameraParamters;->setContrastMode(Ljava/lang/String;)V

    goto :goto_0

    .line 256
    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public incZoom()Z
    .locals 4

    .prologue
    .line 210
    const-string v2, "VTSettings"

    const-string v3, "incZoom"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    invoke-virtual {p0}, Lcom/mediatek/vt/VTSettings;->getZoom()I

    move-result v2

    iget v3, p0, Lcom/mediatek/vt/VTSettings;->mCameraZoomIncVal:I

    add-int v1, v2, v3

    .line 212
    .local v1, value:I
    iget-object v2, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v2}, Lcom/mediatek/vt/CameraParamters;->getMaxZoom()I

    move-result v0

    .line 213
    .local v0, maxZoom:I
    if-le v1, v0, :cond_0

    .line 214
    move v1, v0

    .line 216
    :cond_0
    iget-object v2, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v2, v1}, Lcom/mediatek/vt/CameraParamters;->setZoom(I)V

    .line 217
    const/4 v2, 0x1

    return v2
.end method

.method init(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 85
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    if-eqz v0, :cond_0

    .line 86
    const-string v0, "VTSettings"

    const-string v1, "init error"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    :goto_0
    return-void

    .line 89
    :cond_0
    iput-object p1, p0, Lcom/mediatek/vt/VTSettings;->mContext:Landroid/content/Context;

    .line 90
    iput v1, p0, Lcom/mediatek/vt/VTSettings;->mVideoType:I

    .line 91
    iput-object v2, p0, Lcom/mediatek/vt/VTSettings;->mImagePath:Ljava/lang/String;

    .line 92
    iput-boolean v1, p0, Lcom/mediatek/vt/VTSettings;->mIsSwitch:Z

    .line 93
    const/4 v0, 0x1

    iput v0, p0, Lcom/mediatek/vt/VTSettings;->mVideoQuality:I

    .line 94
    iput v1, p0, Lcom/mediatek/vt/VTSettings;->mCameraZoomIncVal:I

    .line 95
    iput-object v2, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    goto :goto_0
.end method

.method public isSupportNightMode()Z
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 333
    invoke-virtual {p0}, Lcom/mediatek/vt/VTSettings;->getSupportedSceneModes()Ljava/util/List;

    move-result-object v1

    .line 334
    .local v1, list:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    if-nez v1, :cond_1

    .line 342
    :cond_0
    :goto_0
    return v3

    .line 337
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 338
    .local v2, str:Ljava/lang/String;
    const-string v4, "night"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 339
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public isZoomSupported()Z
    .locals 1

    .prologue
    .line 318
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    if-nez v0, :cond_0

    .line 319
    const/4 v0, 0x0

    .line 321
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v0}, Lcom/mediatek/vt/CameraParamters;->isZoomSupported()Z

    move-result v0

    goto :goto_0
.end method

.method public setBrightnessMode(Ljava/lang/String;)V
    .locals 1
    .parameter "value"

    .prologue
    .line 195
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    if-nez v0, :cond_0

    .line 199
    :goto_0
    return-void

    .line 198
    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v0, p1}, Lcom/mediatek/vt/CameraParamters;->setExposure(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setColorEffect(Ljava/lang/String;)V
    .locals 1
    .parameter "value"

    .prologue
    .line 124
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    if-nez v0, :cond_0

    .line 128
    :goto_0
    return-void

    .line 127
    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v0, p1}, Lcom/mediatek/vt/CameraParamters;->setColorEffect(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setContrastMode(Ljava/lang/String;)V
    .locals 3
    .parameter "value"

    .prologue
    .line 379
    const-string v0, "VTSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setContrastMode ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 380
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    if-nez v0, :cond_0

    .line 384
    :goto_0
    return-void

    .line 383
    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v0, p1}, Lcom/mediatek/vt/CameraParamters;->setContrastMode(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setImagePath(Ljava/lang/String;)V
    .locals 0
    .parameter "imagePath"

    .prologue
    .line 428
    iput-object p1, p0, Lcom/mediatek/vt/VTSettings;->mImagePath:Ljava/lang/String;

    .line 429
    return-void
.end method

.method public setIsSwitch(Z)V
    .locals 0
    .parameter "isSwitch"

    .prologue
    .line 436
    iput-boolean p1, p0, Lcom/mediatek/vt/VTSettings;->mIsSwitch:Z

    .line 437
    return-void
.end method

.method public setLocalSurface(Landroid/view/SurfaceHolder;)V
    .locals 0
    .parameter "localSurface"

    .prologue
    .line 444
    iput-object p1, p0, Lcom/mediatek/vt/VTSettings;->mLocalSurface:Landroid/view/SurfaceHolder;

    .line 445
    return-void
.end method

.method public setNightMode(Z)V
    .locals 1
    .parameter "isOn"

    .prologue
    .line 350
    if-eqz p1, :cond_0

    const-string v0, "night"

    .line 351
    .local v0, value:Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, p1}, Lcom/mediatek/vt/VTSettings;->setNightModeFrameRate(Z)V

    .line 352
    invoke-virtual {p0, v0}, Lcom/mediatek/vt/VTSettings;->setSceneMode(Ljava/lang/String;)V

    .line 353
    return-void

    .line 350
    .end local v0           #value:Ljava/lang/String;
    :cond_0
    const-string v0, "auto"

    goto :goto_0
.end method

.method public setNightModeFrameRate(Z)V
    .locals 2
    .parameter "isNightMode"

    .prologue
    .line 346
    iget-object v1, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    if-eqz p1, :cond_0

    const/16 v0, 0xf

    :goto_0
    invoke-virtual {v1, v0}, Lcom/mediatek/vt/CameraParamters;->setPreviewFrameRate(I)V

    .line 347
    return-void

    .line 346
    :cond_0
    const/16 v0, 0x1e

    goto :goto_0
.end method

.method public setPeerSurface(Landroid/view/SurfaceHolder;)V
    .locals 0
    .parameter "peerSurface"

    .prologue
    .line 452
    iput-object p1, p0, Lcom/mediatek/vt/VTSettings;->mPeerSurface:Landroid/view/SurfaceHolder;

    .line 453
    return-void
.end method

.method public setSceneMode(Ljava/lang/String;)V
    .locals 2
    .parameter "value"

    .prologue
    .line 407
    const-string v0, "VTSettings"

    const-string v1, "setSceneMode"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 408
    const-string v0, "VTSettings"

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 409
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    if-nez v0, :cond_0

    .line 413
    :goto_0
    return-void

    .line 412
    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v0, p1}, Lcom/mediatek/vt/CameraParamters;->setSceneMode(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setVideoQuality(I)V
    .locals 0
    .parameter "videoQuality"

    .prologue
    .line 460
    iput p1, p0, Lcom/mediatek/vt/VTSettings;->mVideoQuality:I

    .line 461
    return-void
.end method

.method public setVideoType(I)V
    .locals 0
    .parameter "videoType"

    .prologue
    .line 420
    iput p1, p0, Lcom/mediatek/vt/VTSettings;->mVideoType:I

    .line 421
    return-void
.end method

.method public setZoom(I)V
    .locals 2
    .parameter "value"

    .prologue
    .line 299
    const-string v0, "VTSettings"

    const-string v1, "setZoom"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    if-nez v0, :cond_0

    .line 307
    :goto_0
    return-void

    .line 303
    :cond_0
    if-gez p1, :cond_1

    .line 304
    const/4 p1, 0x0

    .line 306
    :cond_1
    iget-object v0, p0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-virtual {v0, p1}, Lcom/mediatek/vt/CameraParamters;->setZoom(I)V

    goto :goto_0
.end method
