.class public Lcom/mediatek/vt/CameraParamters$Size;
.super Ljava/lang/Object;
.source "CameraParamters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/vt/CameraParamters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Size"
.end annotation


# instance fields
.field public height:I

.field public width:I


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .parameter "w"
    .parameter "h"

    .prologue
    .line 238
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 239
    iput p1, p0, Lcom/mediatek/vt/CameraParamters$Size;->width:I

    .line 240
    iput p2, p0, Lcom/mediatek/vt/CameraParamters$Size;->height:I

    .line 241
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .parameter "obj"

    .prologue
    const/4 v1, 0x0

    .line 252
    instance-of v2, p1, Lcom/mediatek/vt/CameraParamters$Size;

    if-nez v2, :cond_1

    .line 256
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 255
    check-cast v0, Lcom/mediatek/vt/CameraParamters$Size;

    .line 256
    .local v0, s:Lcom/mediatek/vt/CameraParamters$Size;
    iget v2, p0, Lcom/mediatek/vt/CameraParamters$Size;->width:I

    iget v3, v0, Lcom/mediatek/vt/CameraParamters$Size;->width:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Lcom/mediatek/vt/CameraParamters$Size;->height:I

    iget v3, v0, Lcom/mediatek/vt/CameraParamters$Size;->height:I

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 261
    iget v0, p0, Lcom/mediatek/vt/CameraParamters$Size;->width:I

    mul-int/lit16 v0, v0, 0x7fc9

    iget v1, p0, Lcom/mediatek/vt/CameraParamters$Size;->height:I

    add-int/2addr v0, v1

    return v0
.end method
