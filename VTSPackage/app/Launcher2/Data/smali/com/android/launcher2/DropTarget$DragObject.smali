.class public Lcom/android/launcher2/DropTarget$DragObject;
.super Ljava/lang/Object;
.source "DropTarget.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/DropTarget;
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

.field public dragSource:Lcom/android/launcher2/DragSource;

.field public dragView:Lcom/android/launcher2/DragView;

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

    .line 66
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput v0, p0, Lcom/android/launcher2/DropTarget$DragObject;->x:I

    .line 34
    iput v0, p0, Lcom/android/launcher2/DropTarget$DragObject;->y:I

    .line 37
    iput v0, p0, Lcom/android/launcher2/DropTarget$DragObject;->xOffset:I

    .line 40
    iput v0, p0, Lcom/android/launcher2/DropTarget$DragObject;->yOffset:I

    .line 46
    iput-boolean v2, p0, Lcom/android/launcher2/DropTarget$DragObject;->dragComplete:Z

    .line 49
    iput-object v1, p0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    .line 52
    iput-object v1, p0, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    .line 55
    iput-object v1, p0, Lcom/android/launcher2/DropTarget$DragObject;->dragSource:Lcom/android/launcher2/DragSource;

    .line 58
    iput-object v1, p0, Lcom/android/launcher2/DropTarget$DragObject;->postAnimationRunnable:Ljava/lang/Runnable;

    .line 61
    iput-boolean v2, p0, Lcom/android/launcher2/DropTarget$DragObject;->cancelled:Z

    .line 64
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/DropTarget$DragObject;->deferDragViewCleanupPostAnimation:Z

    .line 67
    return-void
.end method
