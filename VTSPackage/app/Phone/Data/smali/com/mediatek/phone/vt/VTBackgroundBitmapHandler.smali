.class public Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;
.super Ljava/lang/Object;
.source "VTBackgroundBitmapHandler.java"


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public forceUpdateBitmapBySetting()V
    .locals 2

    .prologue
    .line 62
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;->recycle()V

    .line 63
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-object v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mPicToReplacePeer:Ljava/lang/String;

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 65
    invoke-static {}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathDefault2()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;->mBitmap:Landroid/graphics/Bitmap;

    .line 71
    :cond_0
    :goto_0
    return-void

    .line 66
    :cond_1
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-object v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mPicToReplacePeer:Ljava/lang/String;

    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 68
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSlotId:I

    invoke-static {v0}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect2(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;->mBitmap:Landroid/graphics/Bitmap;

    goto :goto_0
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;->mBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public recycle()V
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 53
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 55
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;->mBitmap:Landroid/graphics/Bitmap;

    .line 56
    return-void
.end method

.method public updateBitmapBySetting()V
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 81
    :goto_0
    return-void

    .line 80
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;->forceUpdateBitmapBySetting()V

    goto :goto_0
.end method
