.class public Lcom/mediatek/vt/VTelProvider;
.super Ljava/lang/Object;
.source "VTelProvider.java"


# static fields
.field private static final DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "VTelProvider"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const-string v0, "mtk_vt_client"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 45
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native closeVTService()I
.end method

.method public static native enableAlwaysAskSettings(I)I
.end method

.method public static native enableHideMe(I)I
.end method

.method public static native enableHideYou(I)I
.end method

.method public static native getCameraSensorCount()I
.end method

.method public static getParameters()Lcom/mediatek/vt/CameraParamters;
    .locals 2

    .prologue
    .line 136
    new-instance v0, Lcom/mediatek/vt/CameraParamters;

    invoke-direct {v0}, Lcom/mediatek/vt/CameraParamters;-><init>()V

    .line 137
    .local v0, p:Lcom/mediatek/vt/CameraParamters;
    invoke-static {}, Lcom/mediatek/vt/VTelProvider;->nativeGetParameters()Ljava/lang/String;

    move-result-object v1

    .line 138
    .local v1, s:Ljava/lang/String;
    invoke-virtual {v0, v1}, Lcom/mediatek/vt/CameraParamters;->unflatten(Ljava/lang/String;)V

    .line 139
    invoke-virtual {v0}, Lcom/mediatek/vt/CameraParamters;->dump()V

    .line 140
    return-object v0
.end method

.method public static native incomingVTCall(I)I
.end method

.method public static native incomingVideoDispaly(I)I
.end method

.method public static native initVTService(Landroid/view/Surface;Landroid/view/Surface;)I
.end method

.method public static native isMicrophoneOn()I
.end method

.method public static native isSpeakerOn()I
.end method

.method public static native lockPeerVideo()I
.end method

.method private static native nativeGetParameters()Ljava/lang/String;
.end method

.method private static native nativeSetParameters(Ljava/lang/String;)V
.end method

.method public static native onUserInput(Ljava/lang/String;)V
.end method

.method public static final native openVTService(I)I
.end method

.method public static postEventFromNative(IIILjava/lang/Object;)V
    .locals 1
    .parameter "msg"
    .parameter "arg1"
    .parameter "arg2"
    .parameter "obj"

    .prologue
    .line 155
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/mediatek/vt/VTManager;->postEventFromNative(IIILjava/lang/Object;)V

    .line 156
    return-void
.end method

.method public static native replacePeerVideoSettings(ILjava/lang/String;)I
.end method

.method public static native setEM(III)V
.end method

.method public static native setEndCallFlag()V
.end method

.method public static native setInvokeLockPeerVideoBeforeOpen(I)I
.end method

.method public static native setLocalVideoType(ILjava/lang/String;)V
.end method

.method public static setParameters(Lcom/mediatek/vt/CameraParamters;)V
    .locals 2
    .parameter "params"

    .prologue
    .line 122
    if-nez p0, :cond_0

    .line 123
    const-string v0, "VTelProvider"

    const-string v1, "setParameters: params == null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    :goto_0
    return-void

    .line 127
    :cond_0
    const-string v0, "VTelProvider"

    invoke-virtual {p0}, Lcom/mediatek/vt/CameraParamters;->flatten()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    invoke-virtual {p0}, Lcom/mediatek/vt/CameraParamters;->flatten()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/vt/VTelProvider;->nativeSetParameters(Ljava/lang/String;)V

    .line 129
    const-string v0, "VTelProvider"

    const-string v1, "setParameters ok"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static native setPeerVideo(I)V
.end method

.method public static native setVTVisible(ILandroid/view/Surface;Landroid/view/Surface;)I
.end method

.method public static native snapshot(ILjava/lang/String;)I
.end method

.method public static native startRecording(ILjava/lang/String;J)I
.end method

.method public static final native startVTService()I
.end method

.method public static native stopRecording(I)I
.end method

.method public static native stopVTService()I
.end method

.method public static native switchCamera()I
.end method

.method public static native turnOnMicrophone(I)V
.end method

.method public static native turnOnSpeaker(I)V
.end method

.method public static native unlockPeerVideo()I
.end method

.method public static updateParameters(Lcom/mediatek/vt/CameraParamters;)Lcom/mediatek/vt/CameraParamters;
    .locals 3
    .parameter "p"

    .prologue
    .line 144
    if-nez p0, :cond_0

    .line 145
    const-string v1, "VTelProvider"

    const-string v2, "updateParameters: p == null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    :goto_0
    return-object p0

    .line 149
    :cond_0
    invoke-static {}, Lcom/mediatek/vt/VTelProvider;->nativeGetParameters()Ljava/lang/String;

    move-result-object v0

    .line 150
    .local v0, s:Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/mediatek/vt/CameraParamters;->unflatten(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static native userSelectYes(I)I
.end method
