.class Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;
.super Ljava/lang/Object;
.source "FolderIcon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/FolderIcon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PreviewItemDrawingParams"
.end annotation


# instance fields
.field drawable:Landroid/graphics/drawable/Drawable;

.field overlayAlpha:I

.field scale:F

.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/FolderIcon;

.field transX:F

.field transY:F


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/FolderIcon;FFFI)V
    .locals 0
    .parameter
    .parameter "transX"
    .parameter "transY"
    .parameter "scale"
    .parameter "overlayAlpha"

    .prologue
    .line 450
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->this$0:Lcom/cyanogenmod/trebuchet/FolderIcon;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 451
    iput p2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->transX:F

    .line 452
    iput p3, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->transY:F

    .line 453
    iput p4, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->scale:F

    .line 454
    iput p5, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->overlayAlpha:I

    .line 455
    return-void
.end method
