.class public Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;
.super Ljava/lang/Object;
.source "DropTarget.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/DropTarget;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DragObject"
.end annotation


# instance fields
.field public cancelled:Z

.field public deferDragViewCleanupPostAnimation:Z

.field public dragComplete:Z

.field public dragInfo:Ljava/lang/Object;

.field public dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

.field public dragView:Lcom/cyanogenmod/trebuchet/DragView;

.field public postAnimationRunnable:Ljava/lang/Runnable;

.field public x:I

.field public xOffset:I

.field public y:I

.field public yOffset:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput v0, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->x:I

    .line 33
    iput v0, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->y:I

    .line 36
    iput v0, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->xOffset:I

    .line 39
    iput v0, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->yOffset:I

    .line 45
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragComplete:Z

    .line 48
    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    .line 51
    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    .line 54
    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

    .line 57
    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->postAnimationRunnable:Ljava/lang/Runnable;

    .line 60
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->cancelled:Z

    .line 63
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->deferDragViewCleanupPostAnimation:Z

    .line 66
    return-void
.end method
