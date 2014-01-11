.class public Lcom/android/launcher2/CellLayout$LayoutParams;
.super Landroid/view/ViewGroup$MarginLayoutParams;
.source "CellLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/CellLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation


# instance fields
.field public canReorder:Z

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

.field dropped:Z

.field public isLockedToGrid:Z

.field public tmpCellX:I

.field public tmpCellY:I

.field public useTmpCoords:Z

.field x:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
    .end annotation
.end field

.field y:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
    .end annotation
.end field


# direct methods
.method public constructor <init>(IIII)V
    .locals 2
    .parameter "cellX"
    .parameter "cellY"
    .parameter "cellHSpan"
    .parameter "cellVSpan"

    .prologue
    const/4 v1, 0x1

    const/4 v0, -0x1

    .line 3253
    invoke-direct {p0, v0, v0}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 3215
    iput-boolean v1, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->isLockedToGrid:Z

    .line 3221
    iput-boolean v1, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->canReorder:Z

    .line 3254
    iput p1, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    .line 3255
    iput p2, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    .line 3256
    iput p3, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    .line 3257
    iput p4, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    .line 3258
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "c"
    .parameter "attrs"

    .prologue
    const/4 v0, 0x1

    .line 3233
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3215
    iput-boolean v0, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->isLockedToGrid:Z

    .line 3221
    iput-boolean v0, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->canReorder:Z

    .line 3234
    iput v0, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    .line 3235
    iput v0, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    .line 3236
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .locals 1
    .parameter "source"

    .prologue
    const/4 v0, 0x1

    .line 3239
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 3215
    iput-boolean v0, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->isLockedToGrid:Z

    .line 3221
    iput-boolean v0, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->canReorder:Z

    .line 3240
    iput v0, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    .line 3241
    iput v0, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    .line 3242
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher2/CellLayout$LayoutParams;)V
    .locals 1
    .parameter "source"

    .prologue
    const/4 v0, 0x1

    .line 3245
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 3215
    iput-boolean v0, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->isLockedToGrid:Z

    .line 3221
    iput-boolean v0, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->canReorder:Z

    .line 3246
    iget v0, p1, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    iput v0, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    .line 3247
    iget v0, p1, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    iput v0, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    .line 3248
    iget v0, p1, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    iput v0, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    .line 3249
    iget v0, p1, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    iput v0, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    .line 3250
    return-void
.end method


# virtual methods
.method public getHeight()I
    .locals 1

    .prologue
    .line 3293
    iget v0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 3285
    iget v0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    return v0
.end method

.method public getX()I
    .locals 1

    .prologue
    .line 3301
    iget v0, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->x:I

    return v0
.end method

.method public getY()I
    .locals 1

    .prologue
    .line 3309
    iget v0, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->y:I

    return v0
.end method

.method public setHeight(I)V
    .locals 0
    .parameter "height"

    .prologue
    .line 3289
    iput p1, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 3290
    return-void
.end method

.method public setWidth(I)V
    .locals 0
    .parameter "width"

    .prologue
    .line 3281
    iput p1, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 3282
    return-void
.end method

.method public setX(I)V
    .locals 0
    .parameter "x"

    .prologue
    .line 3297
    iput p1, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->x:I

    .line 3298
    return-void
.end method

.method public setY(I)V
    .locals 0
    .parameter "y"

    .prologue
    .line 3305
    iput p1, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->y:I

    .line 3306
    return-void
.end method

.method public setup(IIII)V
    .locals 6
    .parameter "cellWidth"
    .parameter "cellHeight"
    .parameter "widthGap"
    .parameter "heightGap"

    .prologue
    .line 3261
    iget-boolean v4, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->isLockedToGrid:Z

    if-eqz v4, :cond_0

    .line 3262
    iget v0, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    .line 3263
    .local v0, myCellHSpan:I
    iget v1, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    .line 3264
    .local v1, myCellVSpan:I
    iget-boolean v4, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->useTmpCoords:Z

    if-eqz v4, :cond_1

    iget v2, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellX:I

    .line 3265
    .local v2, myCellX:I
    :goto_0
    iget-boolean v4, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->useTmpCoords:Z

    if-eqz v4, :cond_2

    iget v3, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellY:I

    .line 3267
    .local v3, myCellY:I
    :goto_1
    mul-int v4, v0, p1

    add-int/lit8 v5, v0, -0x1

    mul-int/2addr v5, p3

    add-int/2addr v4, v5

    iget v5, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int/2addr v4, v5

    iget v5, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->rightMargin:I

    sub-int/2addr v4, v5

    iput v4, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 3269
    mul-int v4, v1, p2

    add-int/lit8 v5, v1, -0x1

    mul-int/2addr v5, p4

    add-int/2addr v4, v5

    iget v5, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    sub-int/2addr v4, v5

    iget v5, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->bottomMargin:I

    sub-int/2addr v4, v5

    iput v4, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 3271
    add-int v4, p1, p3

    mul-int/2addr v4, v2

    iget v5, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v4, v5

    iput v4, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->x:I

    .line 3272
    add-int v4, p2, p4

    mul-int/2addr v4, v3

    iget v5, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v4, v5

    iput v4, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->y:I

    .line 3274
    .end local v0           #myCellHSpan:I
    .end local v1           #myCellVSpan:I
    .end local v2           #myCellX:I
    .end local v3           #myCellY:I
    :cond_0
    return-void

    .line 3264
    .restart local v0       #myCellHSpan:I
    .restart local v1       #myCellVSpan:I
    :cond_1
    iget v2, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    goto :goto_0

    .line 3265
    .restart local v2       #myCellX:I
    :cond_2
    iget v3, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    goto :goto_1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 3277
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
