.class Lcom/mediatek/settings/VTAdvancedSetting$6;
.super Ljava/lang/Object;
.source "VTAdvancedSetting.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/settings/VTAdvancedSetting;->showDialogMyPic(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/VTAdvancedSetting;

.field final synthetic val$mBitmap2:Landroid/graphics/Bitmap;

.field final synthetic val$mImg2:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/VTAdvancedSetting;Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 388
    iput-object p1, p0, Lcom/mediatek/settings/VTAdvancedSetting$6;->this$0:Lcom/mediatek/settings/VTAdvancedSetting;

    iput-object p2, p0, Lcom/mediatek/settings/VTAdvancedSetting$6;->val$mImg2:Landroid/widget/ImageView;

    iput-object p3, p0, Lcom/mediatek/settings/VTAdvancedSetting$6;->val$mBitmap2:Landroid/graphics/Bitmap;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .parameter "dialog"

    .prologue
    .line 391
    iget-object v0, p0, Lcom/mediatek/settings/VTAdvancedSetting$6;->val$mImg2:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 392
    iget-object v0, p0, Lcom/mediatek/settings/VTAdvancedSetting$6;->val$mBitmap2:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 393
    iget-object v0, p0, Lcom/mediatek/settings/VTAdvancedSetting$6;->val$mBitmap2:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 395
    :cond_0
    return-void
.end method
