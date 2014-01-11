.class public Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;
.super Landroid/widget/FrameLayout$LayoutParams;
.source "DragLayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/DragLayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation


# instance fields
.field public customPosition:Z

.field public x:I

.field public y:I


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .parameter "width"
    .parameter "height"

    .prologue
    .line 330
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 324
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->customPosition:Z

    .line 331
    return-void
.end method


# virtual methods
.method public getHeight()I
    .locals 1

    .prologue
    .line 346
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->height:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 338
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->width:I

    return v0
.end method

.method public getX()I
    .locals 1

    .prologue
    .line 354
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->x:I

    return v0
.end method

.method public getY()I
    .locals 1

    .prologue
    .line 362
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->y:I

    return v0
.end method

.method public setHeight(I)V
    .locals 0
    .parameter "height"

    .prologue
    .line 342
    iput p1, p0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->height:I

    .line 343
    return-void
.end method

.method public setWidth(I)V
    .locals 0
    .parameter "width"

    .prologue
    .line 334
    iput p1, p0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->width:I

    .line 335
    return-void
.end method

.method public setX(I)V
    .locals 0
    .parameter "x"

    .prologue
    .line 350
    iput p1, p0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->x:I

    .line 351
    return-void
.end method

.method public setY(I)V
    .locals 0
    .parameter "y"

    .prologue
    .line 358
    iput p1, p0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->y:I

    .line 359
    return-void
.end method
