.class public Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;
.super Landroid/view/ViewGroup$MarginLayoutParams;
.source "PagedViewCellLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation


# instance fields
.field public cellHSpan:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
    .end annotation
.end field

.field public cellVSpan:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
    .end annotation
.end field

.field public cellX:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
    .end annotation
.end field

.field public cellY:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
    .end annotation
.end field

.field public isDragging:Z

.field private mTag:Ljava/lang/Object;

.field x:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
    .end annotation
.end field

.field y:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    const/4 v0, -0x1

    .line 438
    invoke-direct {p0, v0, v0}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 439
    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellHSpan:I

    .line 440
    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellVSpan:I

    .line 441
    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 1
    .parameter "cellX"
    .parameter "cellY"
    .parameter "cellHSpan"
    .parameter "cellVSpan"

    .prologue
    const/4 v0, -0x1

    .line 464
    invoke-direct {p0, v0, v0}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 465
    iput p1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellX:I

    .line 466
    iput p2, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellY:I

    .line 467
    iput p3, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellHSpan:I

    .line 468
    iput p4, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellVSpan:I

    .line 469
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "c"
    .parameter "attrs"

    .prologue
    const/4 v0, 0x1

    .line 444
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 445
    iput v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellHSpan:I

    .line 446
    iput v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellVSpan:I

    .line 447
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .locals 1
    .parameter "source"

    .prologue
    const/4 v0, 0x1

    .line 450
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 451
    iput v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellHSpan:I

    .line 452
    iput v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellVSpan:I

    .line 453
    return-void
.end method

.method public constructor <init>(Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;)V
    .locals 1
    .parameter "source"

    .prologue
    .line 456
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 457
    iget v0, p1, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellX:I

    iput v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellX:I

    .line 458
    iget v0, p1, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellY:I

    iput v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellY:I

    .line 459
    iget v0, p1, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellHSpan:I

    iput v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellHSpan:I

    .line 460
    iget v0, p1, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellVSpan:I

    iput v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellVSpan:I

    .line 461
    return-void
.end method


# virtual methods
.method public getTag()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 494
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->mTag:Ljava/lang/Object;

    return-object v0
.end method

.method public setTag(Ljava/lang/Object;)V
    .locals 0
    .parameter "tag"

    .prologue
    .line 498
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->mTag:Ljava/lang/Object;

    .line 499
    return-void
.end method

.method public setup(IIIIII)V
    .locals 6
    .parameter "cellWidth"
    .parameter "cellHeight"
    .parameter "widthGap"
    .parameter "heightGap"
    .parameter "hStartPadding"
    .parameter "vStartPadding"

    .prologue
    .line 474
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellHSpan:I

    .line 475
    .local v0, myCellHSpan:I
    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellVSpan:I

    .line 476
    .local v1, myCellVSpan:I
    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellX:I

    .line 477
    .local v2, myCellX:I
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellY:I

    .line 479
    .local v3, myCellY:I
    mul-int v4, v0, p1

    add-int/lit8 v5, v0, -0x1

    mul-int/2addr v5, p3

    add-int/2addr v4, v5

    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->leftMargin:I

    sub-int/2addr v4, v5

    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->rightMargin:I

    sub-int/2addr v4, v5

    iput v4, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->width:I

    .line 481
    mul-int v4, v1, p2

    add-int/lit8 v5, v1, -0x1

    mul-int/2addr v5, p4

    add-int/2addr v4, v5

    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->topMargin:I

    sub-int/2addr v4, v5

    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->bottomMargin:I

    sub-int/2addr v4, v5

    iput v4, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->height:I

    .line 484
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 485
    add-int v4, p1, p3

    mul-int/2addr v4, v2

    add-int/2addr v4, p5

    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->leftMargin:I

    add-int/2addr v4, v5

    iput v4, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->x:I

    .line 486
    add-int v4, p2, p4

    mul-int/2addr v4, v3

    add-int/2addr v4, p6

    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->topMargin:I

    add-int/2addr v4, v5

    iput v4, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->y:I

    .line 491
    :goto_0
    return-void

    .line 488
    :cond_0
    add-int v4, p1, p3

    mul-int/2addr v4, v2

    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->leftMargin:I

    add-int/2addr v4, v5

    iput v4, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->x:I

    .line 489
    add-int v4, p2, p4

    mul-int/2addr v4, v3

    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->topMargin:I

    add-int/2addr v4, v5

    iput v4, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->y:I

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 502
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellX:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellY:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellHSpan:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellVSpan:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
