.class Lcom/android/launcher2/FolderIcon$PreviewItemDrawingParams;
.super Ljava/lang/Object;
.source "FolderIcon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/FolderIcon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PreviewItemDrawingParams"
.end annotation


# instance fields
.field drawable:Landroid/graphics/drawable/Drawable;

.field overlayAlpha:I

.field scale:F

.field final synthetic this$0:Lcom/android/launcher2/FolderIcon;

.field transX:F

.field transY:F


# direct methods
.method constructor <init>(Lcom/android/launcher2/FolderIcon;FFFI)V
    .locals 0
    .parameter
    .parameter "transX"
    .parameter "transY"
    .parameter "scale"
    .parameter "overlayAlpha"

    .prologue
    .line 473
    iput-object p1, p0, Lcom/android/launcher2/FolderIcon$PreviewItemDrawingParams;->this$0:Lcom/android/launcher2/FolderIcon;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 474
    iput p2, p0, Lcom/android/launcher2/FolderIcon$PreviewItemDrawingParams;->transX:F

    .line 475
    iput p3, p0, Lcom/android/launcher2/FolderIcon$PreviewItemDrawingParams;->transY:F

    .line 476
    iput p4, p0, Lcom/android/launcher2/FolderIcon$PreviewItemDrawingParams;->scale:F

    .line 477
    iput p5, p0, Lcom/android/launcher2/FolderIcon$PreviewItemDrawingParams;->overlayAlpha:I

    .line 478
    return-void
.end method
