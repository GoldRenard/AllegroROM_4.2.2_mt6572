.class Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;
.super Ljava/lang/Object;
.source "Workspace.java"

# interfaces
.implements Lcom/cyanogenmod/trebuchet/OnAlarmListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/Workspace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ReorderAlarmListener"
.end annotation


# instance fields
.field child:Landroid/view/View;

.field dragView:Lcom/cyanogenmod/trebuchet/DragView;

.field dragViewCenter:[F

.field minSpanX:I

.field minSpanY:I

.field spanX:I

.field spanY:I

.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Workspace;


# direct methods
.method public constructor <init>(Lcom/cyanogenmod/trebuchet/Workspace;[FIIIILcom/cyanogenmod/trebuchet/DragView;Landroid/view/View;)V
    .locals 0
    .parameter
    .parameter "dragViewCenter"
    .parameter "minSpanX"
    .parameter "minSpanY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "dragView"
    .parameter "child"

    .prologue
    .line 3617
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3618
    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->dragViewCenter:[F

    .line 3619
    iput p3, p0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->minSpanX:I

    .line 3620
    iput p4, p0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->minSpanY:I

    .line 3621
    iput p5, p0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->spanX:I

    .line 3622
    iput p6, p0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->spanY:I

    .line 3623
    iput-object p8, p0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->child:Landroid/view/View;

    .line 3624
    iput-object p7, p0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    .line 3625
    return-void
.end method


# virtual methods
.method public onAlarm(Lcom/cyanogenmod/trebuchet/Alarm;)V
    .locals 23
    .parameter "alarm"

    .prologue
    .line 3628
    const/4 v1, 0x2

    new-array v10, v1, [I

    .line 3629
    .local v10, resultSpan:[I
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/Workspace;->access$900(Lcom/cyanogenmod/trebuchet/Workspace;)[F

    move-result-object v2

    const/4 v3, 0x0

    aget v2, v2, v3

    float-to-int v2, v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/Workspace;->access$900(Lcom/cyanogenmod/trebuchet/Workspace;)[F

    move-result-object v3

    const/4 v4, 0x1

    aget v3, v3, v4

    float-to-int v3, v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->spanX:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->spanY:I

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-static {v6}, Lcom/cyanogenmod/trebuchet/Workspace;->access$1000(Lcom/cyanogenmod/trebuchet/Workspace;)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I
    invoke-static {v7}, Lcom/cyanogenmod/trebuchet/Workspace;->access$800(Lcom/cyanogenmod/trebuchet/Workspace;)[I

    move-result-object v7

    #calls: Lcom/cyanogenmod/trebuchet/Workspace;->findNearestArea(IIIILcom/cyanogenmod/trebuchet/CellLayout;[I)[I
    invoke-static/range {v1 .. v7}, Lcom/cyanogenmod/trebuchet/Workspace;->access$1100(Lcom/cyanogenmod/trebuchet/Workspace;IIIILcom/cyanogenmod/trebuchet/CellLayout;[I)[I

    move-result-object v1

    #setter for: Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I
    invoke-static {v8, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->access$802(Lcom/cyanogenmod/trebuchet/Workspace;[I)[I

    .line 3631
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/Workspace;->access$800(Lcom/cyanogenmod/trebuchet/Workspace;)[I

    move-result-object v2

    const/4 v3, 0x0

    aget v2, v2, v3

    #setter for: Lcom/cyanogenmod/trebuchet/Workspace;->mLastReorderX:I
    invoke-static {v1, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->access$1202(Lcom/cyanogenmod/trebuchet/Workspace;I)I

    .line 3632
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/Workspace;->access$800(Lcom/cyanogenmod/trebuchet/Workspace;)[I

    move-result-object v2

    const/4 v3, 0x1

    aget v2, v2, v3

    #setter for: Lcom/cyanogenmod/trebuchet/Workspace;->mLastReorderY:I
    invoke-static {v1, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->access$1302(Lcom/cyanogenmod/trebuchet/Workspace;I)I

    .line 3634
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->access$1000(Lcom/cyanogenmod/trebuchet/Workspace;)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/Workspace;->access$900(Lcom/cyanogenmod/trebuchet/Workspace;)[F

    move-result-object v2

    const/4 v3, 0x0

    aget v2, v2, v3

    float-to-int v2, v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/Workspace;->access$900(Lcom/cyanogenmod/trebuchet/Workspace;)[F

    move-result-object v3

    const/4 v4, 0x1

    aget v3, v3, v4

    float-to-int v3, v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->minSpanX:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->minSpanY:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->spanX:I

    move-object/from16 v0, p0

    iget v7, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->spanY:I

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->child:Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I
    invoke-static {v9}, Lcom/cyanogenmod/trebuchet/Workspace;->access$800(Lcom/cyanogenmod/trebuchet/Workspace;)[I

    move-result-object v9

    const/4 v11, 0x0

    invoke-virtual/range {v1 .. v11}, Lcom/cyanogenmod/trebuchet/CellLayout;->createArea(IIIIIILandroid/view/View;[I[II)[I

    move-result-object v1

    #setter for: Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I
    invoke-static {v12, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->access$802(Lcom/cyanogenmod/trebuchet/Workspace;[I)[I

    .line 3638
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->access$800(Lcom/cyanogenmod/trebuchet/Workspace;)[I

    move-result-object v1

    const/4 v2, 0x0

    aget v1, v1, v2

    if-ltz v1, :cond_0

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->access$800(Lcom/cyanogenmod/trebuchet/Workspace;)[I

    move-result-object v1

    const/4 v2, 0x1

    aget v1, v1, v2

    if-gez v1, :cond_2

    .line 3639
    :cond_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->access$1000(Lcom/cyanogenmod/trebuchet/Workspace;)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v1

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->revertTempState()V

    .line 3644
    :goto_0
    const/4 v1, 0x0

    aget v1, v10, v1

    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->spanX:I

    if-ne v1, v2, :cond_1

    const/4 v1, 0x1

    aget v1, v10, v1

    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->spanY:I

    if-eq v1, v2, :cond_3

    :cond_1
    const/16 v20, 0x1

    .line 3645
    .local v20, resize:Z
    :goto_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->access$1000(Lcom/cyanogenmod/trebuchet/Workspace;)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->child:Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mDragOutline:Landroid/graphics/Bitmap;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->access$1400(Lcom/cyanogenmod/trebuchet/Workspace;)Landroid/graphics/Bitmap;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->access$900(Lcom/cyanogenmod/trebuchet/Workspace;)[F

    move-result-object v1

    const/4 v2, 0x0

    aget v1, v1, v2

    float-to-int v14, v1

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->access$900(Lcom/cyanogenmod/trebuchet/Workspace;)[F

    move-result-object v1

    const/4 v2, 0x1

    aget v1, v1, v2

    float-to-int v15, v1

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->access$800(Lcom/cyanogenmod/trebuchet/Workspace;)[I

    move-result-object v1

    const/4 v2, 0x0

    aget v16, v1, v2

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->access$800(Lcom/cyanogenmod/trebuchet/Workspace;)[I

    move-result-object v1

    const/4 v2, 0x1

    aget v17, v1, v2

    const/4 v1, 0x0

    aget v18, v10, v1

    const/4 v1, 0x1

    aget v19, v10, v1

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/DragView;->getDragVisualizeOffset()Landroid/graphics/Point;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/DragView;->getDragRegion()Landroid/graphics/Rect;

    move-result-object v22

    invoke-virtual/range {v11 .. v22}, Lcom/cyanogenmod/trebuchet/CellLayout;->visualizeDropLocation(Landroid/view/View;Landroid/graphics/Bitmap;IIIIIIZLandroid/graphics/Point;Landroid/graphics/Rect;)V

    .line 3649
    return-void

    .line 3641
    .end local v20           #resize:Z
    :cond_2
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->setDragMode(I)V

    goto :goto_0

    .line 3644
    :cond_3
    const/16 v20, 0x0

    goto :goto_1
.end method
