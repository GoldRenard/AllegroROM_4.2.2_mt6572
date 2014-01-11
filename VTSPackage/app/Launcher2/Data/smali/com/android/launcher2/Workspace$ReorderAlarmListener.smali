.class Lcom/android/launcher2/Workspace$ReorderAlarmListener;
.super Ljava/lang/Object;
.source "Workspace.java"

# interfaces
.implements Lcom/android/launcher2/OnAlarmListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/Workspace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ReorderAlarmListener"
.end annotation


# instance fields
.field child:Landroid/view/View;

.field dragView:Lcom/android/launcher2/DragView;

.field dragViewCenter:[F

.field minSpanX:I

.field minSpanY:I

.field spanX:I

.field spanY:I

.field final synthetic this$0:Lcom/android/launcher2/Workspace;


# direct methods
.method public constructor <init>(Lcom/android/launcher2/Workspace;[FIIIILcom/android/launcher2/DragView;Landroid/view/View;)V
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
    .line 3136
    iput-object p1, p0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 3137
    iput-object p2, p0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->dragViewCenter:[F

    .line 3138
    iput p3, p0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->minSpanX:I

    .line 3139
    iput p4, p0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->minSpanY:I

    .line 3140
    iput p5, p0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->spanX:I

    .line 3141
    iput p6, p0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->spanY:I

    .line 3142
    iput-object p8, p0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->child:Landroid/view/View;

    .line 3143
    iput-object p7, p0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->dragView:Lcom/android/launcher2/DragView;

    .line 3144
    return-void
.end method


# virtual methods
.method public onAlarm(Lcom/android/launcher2/Alarm;)V
    .locals 23
    .parameter "alarm"

    .prologue
    .line 3147
    const/4 v1, 0x2

    new-array v10, v1, [I

    .line 3148
    .local v10, resultSpan:[I
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F
    invoke-static {v2}, Lcom/android/launcher2/Workspace;->access$900(Lcom/android/launcher2/Workspace;)[F

    move-result-object v2

    const/4 v3, 0x0

    aget v2, v2, v3

    float-to-int v2, v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F
    invoke-static {v3}, Lcom/android/launcher2/Workspace;->access$900(Lcom/android/launcher2/Workspace;)[F

    move-result-object v3

    const/4 v4, 0x1

    aget v3, v3, v4

    float-to-int v3, v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->spanX:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->spanY:I

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;
    invoke-static {v6}, Lcom/android/launcher2/Workspace;->access$1000(Lcom/android/launcher2/Workspace;)Lcom/android/launcher2/CellLayout;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mTargetCell:[I
    invoke-static {v7}, Lcom/android/launcher2/Workspace;->access$800(Lcom/android/launcher2/Workspace;)[I

    move-result-object v7

    #calls: Lcom/android/launcher2/Workspace;->findNearestArea(IIIILcom/android/launcher2/CellLayout;[I)[I
    invoke-static/range {v1 .. v7}, Lcom/android/launcher2/Workspace;->access$1100(Lcom/android/launcher2/Workspace;IIIILcom/android/launcher2/CellLayout;[I)[I

    move-result-object v1

    #setter for: Lcom/android/launcher2/Workspace;->mTargetCell:[I
    invoke-static {v8, v1}, Lcom/android/launcher2/Workspace;->access$802(Lcom/android/launcher2/Workspace;[I)[I

    .line 3150
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mTargetCell:[I
    invoke-static {v2}, Lcom/android/launcher2/Workspace;->access$800(Lcom/android/launcher2/Workspace;)[I

    move-result-object v2

    const/4 v3, 0x0

    aget v2, v2, v3

    #setter for: Lcom/android/launcher2/Workspace;->mLastReorderX:I
    invoke-static {v1, v2}, Lcom/android/launcher2/Workspace;->access$1202(Lcom/android/launcher2/Workspace;I)I

    .line 3151
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mTargetCell:[I
    invoke-static {v2}, Lcom/android/launcher2/Workspace;->access$800(Lcom/android/launcher2/Workspace;)[I

    move-result-object v2

    const/4 v3, 0x1

    aget v2, v2, v3

    #setter for: Lcom/android/launcher2/Workspace;->mLastReorderY:I
    invoke-static {v1, v2}, Lcom/android/launcher2/Workspace;->access$1302(Lcom/android/launcher2/Workspace;I)I

    .line 3153
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;
    invoke-static {v1}, Lcom/android/launcher2/Workspace;->access$1000(Lcom/android/launcher2/Workspace;)Lcom/android/launcher2/CellLayout;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F
    invoke-static {v2}, Lcom/android/launcher2/Workspace;->access$900(Lcom/android/launcher2/Workspace;)[F

    move-result-object v2

    const/4 v3, 0x0

    aget v2, v2, v3

    float-to-int v2, v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F
    invoke-static {v3}, Lcom/android/launcher2/Workspace;->access$900(Lcom/android/launcher2/Workspace;)[F

    move-result-object v3

    const/4 v4, 0x1

    aget v3, v3, v4

    float-to-int v3, v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->minSpanX:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->minSpanY:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->spanX:I

    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->spanY:I

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->child:Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mTargetCell:[I
    invoke-static {v9}, Lcom/android/launcher2/Workspace;->access$800(Lcom/android/launcher2/Workspace;)[I

    move-result-object v9

    const/4 v11, 0x0

    invoke-virtual/range {v1 .. v11}, Lcom/android/launcher2/CellLayout;->createArea(IIIIIILandroid/view/View;[I[II)[I

    move-result-object v1

    #setter for: Lcom/android/launcher2/Workspace;->mTargetCell:[I
    invoke-static {v12, v1}, Lcom/android/launcher2/Workspace;->access$802(Lcom/android/launcher2/Workspace;[I)[I

    .line 3157
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mTargetCell:[I
    invoke-static {v1}, Lcom/android/launcher2/Workspace;->access$800(Lcom/android/launcher2/Workspace;)[I

    move-result-object v1

    const/4 v2, 0x0

    aget v1, v1, v2

    if-ltz v1, :cond_0

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mTargetCell:[I
    invoke-static {v1}, Lcom/android/launcher2/Workspace;->access$800(Lcom/android/launcher2/Workspace;)[I

    move-result-object v1

    const/4 v2, 0x1

    aget v1, v1, v2

    if-gez v1, :cond_2

    .line 3158
    :cond_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;
    invoke-static {v1}, Lcom/android/launcher2/Workspace;->access$1000(Lcom/android/launcher2/Workspace;)Lcom/android/launcher2/CellLayout;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/launcher2/CellLayout;->revertTempState()V

    .line 3163
    :goto_0
    const/4 v1, 0x0

    aget v1, v10, v1

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->spanX:I

    if-ne v1, v2, :cond_1

    const/4 v1, 0x1

    aget v1, v10, v1

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->spanY:I

    if-eq v1, v2, :cond_3

    :cond_1
    const/16 v20, 0x1

    .line 3164
    .local v20, resize:Z
    :goto_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;
    invoke-static {v1}, Lcom/android/launcher2/Workspace;->access$1000(Lcom/android/launcher2/Workspace;)Lcom/android/launcher2/CellLayout;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->child:Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mDragOutline:Landroid/graphics/Bitmap;
    invoke-static {v1}, Lcom/android/launcher2/Workspace;->access$1400(Lcom/android/launcher2/Workspace;)Landroid/graphics/Bitmap;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F
    invoke-static {v1}, Lcom/android/launcher2/Workspace;->access$900(Lcom/android/launcher2/Workspace;)[F

    move-result-object v1

    const/4 v2, 0x0

    aget v1, v1, v2

    float-to-int v14, v1

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F
    invoke-static {v1}, Lcom/android/launcher2/Workspace;->access$900(Lcom/android/launcher2/Workspace;)[F

    move-result-object v1

    const/4 v2, 0x1

    aget v1, v1, v2

    float-to-int v15, v1

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mTargetCell:[I
    invoke-static {v1}, Lcom/android/launcher2/Workspace;->access$800(Lcom/android/launcher2/Workspace;)[I

    move-result-object v1

    const/4 v2, 0x0

    aget v16, v1, v2

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mTargetCell:[I
    invoke-static {v1}, Lcom/android/launcher2/Workspace;->access$800(Lcom/android/launcher2/Workspace;)[I

    move-result-object v1

    const/4 v2, 0x1

    aget v17, v1, v2

    const/4 v1, 0x0

    aget v18, v10, v1

    const/4 v1, 0x1

    aget v19, v10, v1

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->dragView:Lcom/android/launcher2/DragView;

    invoke-virtual {v1}, Lcom/android/launcher2/DragView;->getDragVisualizeOffset()Landroid/graphics/Point;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->dragView:Lcom/android/launcher2/DragView;

    invoke-virtual {v1}, Lcom/android/launcher2/DragView;->getDragRegion()Landroid/graphics/Rect;

    move-result-object v22

    invoke-virtual/range {v11 .. v22}, Lcom/android/launcher2/CellLayout;->visualizeDropLocation(Landroid/view/View;Landroid/graphics/Bitmap;IIIIIIZLandroid/graphics/Point;Landroid/graphics/Rect;)V

    .line 3168
    return-void

    .line 3160
    .end local v20           #resize:Z
    :cond_2
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/launcher2/Workspace$ReorderAlarmListener;->this$0:Lcom/android/launcher2/Workspace;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lcom/android/launcher2/Workspace;->setDragMode(I)V

    goto :goto_0

    .line 3163
    :cond_3
    const/16 v20, 0x0

    goto :goto_1
.end method
