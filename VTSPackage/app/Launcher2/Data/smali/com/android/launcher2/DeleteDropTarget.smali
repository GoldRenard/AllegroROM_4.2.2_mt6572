.class public Lcom/android/launcher2/DeleteDropTarget;
.super Lcom/android/launcher2/ButtonDropTarget;
.source "DeleteDropTarget.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;
    }
.end annotation


# static fields
.field private static DELETE_ANIMATION_DURATION:I = 0x0

.field private static FLING_DELETE_ANIMATION_DURATION:I = 0x0

.field private static FLING_TO_DELETE_FRICTION:F = 0.0f

.field private static MODE_FLING_DELETE_ALONG_VECTOR:I = 0x0

.field private static MODE_FLING_DELETE_TO_TRASH:I = 0x0

.field private static final TAG:Ljava/lang/String; = "DeleteDropTarget"


# instance fields
.field private mCurrentDrawable:Landroid/graphics/drawable/TransitionDrawable;

.field private final mFlingDeleteMode:I

.field private mOriginalTextColor:Landroid/content/res/ColorStateList;

.field private mRemoveDrawable:Landroid/graphics/drawable/TransitionDrawable;

.field private mUninstallDrawable:Landroid/graphics/drawable/TransitionDrawable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    const/16 v0, 0x11d

    sput v0, Lcom/android/launcher2/DeleteDropTarget;->DELETE_ANIMATION_DURATION:I

    .line 43
    const/16 v0, 0x15e

    sput v0, Lcom/android/launcher2/DeleteDropTarget;->FLING_DELETE_ANIMATION_DURATION:I

    .line 44
    const v0, 0x3d0f5c29

    sput v0, Lcom/android/launcher2/DeleteDropTarget;->FLING_TO_DELETE_FRICTION:F

    .line 45
    const/4 v0, 0x0

    sput v0, Lcom/android/launcher2/DeleteDropTarget;->MODE_FLING_DELETE_TO_TRASH:I

    .line 46
    const/4 v0, 0x1

    sput v0, Lcom/android/launcher2/DeleteDropTarget;->MODE_FLING_DELETE_ALONG_VECTOR:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 56
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher2/DeleteDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 60
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher2/ButtonDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 48
    sget v0, Lcom/android/launcher2/DeleteDropTarget;->MODE_FLING_DELETE_ALONG_VECTOR:I

    iput v0, p0, Lcom/android/launcher2/DeleteDropTarget;->mFlingDeleteMode:I

    .line 61
    return-void
.end method

.method static synthetic access$000(Lcom/android/launcher2/DeleteDropTarget;Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/android/launcher2/DeleteDropTarget;->completeDrop(Lcom/android/launcher2/DropTarget$DragObject;)V

    return-void
.end method

.method private animateToTrashAndCompleteDrop(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 17
    .parameter "d"

    .prologue
    .line 202
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/ButtonDropTarget;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v3}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v2

    .line 203
    .local v2, dragLayer:Lcom/android/launcher2/DragLayer;
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 204
    .local v4, from:Landroid/graphics/Rect;
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    invoke-virtual {v2, v3, v4}, Lcom/android/launcher2/DragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 205
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    invoke-virtual {v3}, Lcom/android/launcher2/DragView;->getMeasuredWidth()I

    move-result v3

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    invoke-virtual {v7}, Lcom/android/launcher2/DragView;->getMeasuredHeight()I

    move-result v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/launcher2/DeleteDropTarget;->mCurrentDrawable:Landroid/graphics/drawable/TransitionDrawable;

    invoke-virtual {v8}, Landroid/graphics/drawable/TransitionDrawable;->getIntrinsicWidth()I

    move-result v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/launcher2/DeleteDropTarget;->mCurrentDrawable:Landroid/graphics/drawable/TransitionDrawable;

    invoke-virtual {v9}, Landroid/graphics/drawable/TransitionDrawable;->getIntrinsicHeight()I

    move-result v9

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v7, v8, v9}, Lcom/android/launcher2/DeleteDropTarget;->getIconRect(IIII)Landroid/graphics/Rect;

    move-result-object v5

    .line 207
    .local v5, to:Landroid/graphics/Rect;
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v7

    int-to-float v7, v7

    div-float v6, v3, v7

    .line 209
    .local v6, scale:F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/ButtonDropTarget;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    invoke-virtual {v3}, Lcom/android/launcher2/SearchDropTargetBar;->deferOnDragEnd()V

    .line 210
    new-instance v14, Lcom/android/launcher2/DeleteDropTarget$1;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v14, v0, v1}, Lcom/android/launcher2/DeleteDropTarget$1;-><init>(Lcom/android/launcher2/DeleteDropTarget;Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 218
    .local v14, onAnimationEndRunnable:Ljava/lang/Runnable;
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    const/high16 v7, 0x3f80

    const/high16 v8, 0x3f80

    const v9, 0x3dcccccd

    const v10, 0x3dcccccd

    sget v11, Lcom/android/launcher2/DeleteDropTarget;->DELETE_ANIMATION_DURATION:I

    new-instance v12, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v13, 0x4000

    invoke-direct {v12, v13}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    new-instance v13, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v13}, Landroid/view/animation/LinearInterpolator;-><init>()V

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-virtual/range {v2 .. v16}, Lcom/android/launcher2/DragLayer;->animateView(Lcom/android/launcher2/DragView;Landroid/graphics/Rect;Landroid/graphics/Rect;FFFFFILandroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;Ljava/lang/Runnable;ILandroid/view/View;)V

    .line 222
    return-void
.end method

.method private completeDrop(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 7
    .parameter "d"

    .prologue
    .line 225
    iget-object v2, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v2, Lcom/android/launcher2/ItemInfo;

    .line 227
    .local v2, item:Lcom/android/launcher2/ItemInfo;
    const-string v4, "DeleteDropTarget"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "completeDrop: item = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", d = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 230
    iget-object v4, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragSource:Lcom/android/launcher2/DragSource;

    invoke-direct {p0, v4, v2}, Lcom/android/launcher2/DeleteDropTarget;->isAllAppsApplication(Lcom/android/launcher2/DragSource;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 232
    iget-object v4, p0, Lcom/android/launcher2/ButtonDropTarget;->mLauncher:Lcom/android/launcher2/Launcher;

    check-cast v2, Lcom/android/launcher2/ApplicationInfo;

    .end local v2           #item:Lcom/android/launcher2/ItemInfo;
    invoke-virtual {v4, v2}, Lcom/android/launcher2/Launcher;->startApplicationUninstallActivity(Lcom/android/launcher2/ApplicationInfo;)V

    .line 257
    :cond_0
    :goto_0
    return-void

    .line 233
    .restart local v2       #item:Lcom/android/launcher2/ItemInfo;
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/launcher2/DeleteDropTarget;->isWorkspaceOrFolderApplication(Lcom/android/launcher2/DropTarget$DragObject;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 234
    iget-object v4, p0, Lcom/android/launcher2/ButtonDropTarget;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-static {v4, v2}, Lcom/android/launcher2/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;)V

    goto :goto_0

    .line 235
    :cond_2
    invoke-direct {p0, p1}, Lcom/android/launcher2/DeleteDropTarget;->isWorkspaceFolder(Lcom/android/launcher2/DropTarget$DragObject;)Z

    move-result v4

    if-eqz v4, :cond_3

    move-object v1, v2

    .line 237
    check-cast v1, Lcom/android/launcher2/FolderInfo;

    .line 238
    .local v1, folderInfo:Lcom/android/launcher2/FolderInfo;
    iget-object v4, p0, Lcom/android/launcher2/ButtonDropTarget;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v4, v1}, Lcom/android/launcher2/Launcher;->removeFolder(Lcom/android/launcher2/FolderInfo;)V

    .line 239
    iget-object v4, p0, Lcom/android/launcher2/ButtonDropTarget;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-static {v4, v1}, Lcom/android/launcher2/LauncherModel;->deleteFolderContentsFromDatabase(Landroid/content/Context;Lcom/android/launcher2/FolderInfo;)V

    goto :goto_0

    .line 240
    .end local v1           #folderInfo:Lcom/android/launcher2/FolderInfo;
    :cond_3
    invoke-direct {p0, p1}, Lcom/android/launcher2/DeleteDropTarget;->isWorkspaceOrFolderWidget(Lcom/android/launcher2/DropTarget$DragObject;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 242
    iget-object v5, p0, Lcom/android/launcher2/ButtonDropTarget;->mLauncher:Lcom/android/launcher2/Launcher;

    move-object v4, v2

    check-cast v4, Lcom/android/launcher2/LauncherAppWidgetInfo;

    invoke-virtual {v5, v4}, Lcom/android/launcher2/Launcher;->removeAppWidget(Lcom/android/launcher2/LauncherAppWidgetInfo;)V

    .line 243
    iget-object v4, p0, Lcom/android/launcher2/ButtonDropTarget;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-static {v4, v2}, Lcom/android/launcher2/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;)V

    move-object v3, v2

    .line 245
    check-cast v3, Lcom/android/launcher2/LauncherAppWidgetInfo;

    .line 246
    .local v3, launcherAppWidgetInfo:Lcom/android/launcher2/LauncherAppWidgetInfo;
    iget-object v4, p0, Lcom/android/launcher2/ButtonDropTarget;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v4}, Lcom/android/launcher2/Launcher;->getAppWidgetHost()Lcom/android/launcher2/LauncherAppWidgetHost;

    move-result-object v0

    .line 247
    .local v0, appWidgetHost:Lcom/android/launcher2/LauncherAppWidgetHost;
    if-eqz v0, :cond_0

    .line 250
    new-instance v4, Lcom/android/launcher2/DeleteDropTarget$2;

    const-string v5, "deleteAppWidgetId"

    invoke-direct {v4, p0, v5, v0, v3}, Lcom/android/launcher2/DeleteDropTarget$2;-><init>(Lcom/android/launcher2/DeleteDropTarget;Ljava/lang/String;Lcom/android/launcher2/LauncherAppWidgetHost;Lcom/android/launcher2/LauncherAppWidgetInfo;)V

    invoke-virtual {v4}, Lcom/android/launcher2/DeleteDropTarget$2;->start()V

    goto :goto_0
.end method

.method private createFlingAlongVectorAnimatorListener(Lcom/android/launcher2/DragLayer;Lcom/android/launcher2/DropTarget$DragObject;Landroid/graphics/PointF;JILandroid/view/ViewConfiguration;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;
    .locals 7
    .parameter "dragLayer"
    .parameter "d"
    .parameter "vel"
    .parameter "startTime"
    .parameter "duration"
    .parameter "config"

    .prologue
    .line 375
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 376
    .local v3, from:Landroid/graphics/Rect;
    iget-object v0, p2, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    invoke-virtual {p1, v0, v3}, Lcom/android/launcher2/DragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 378
    new-instance v0, Lcom/android/launcher2/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;

    sget v6, Lcom/android/launcher2/DeleteDropTarget;->FLING_TO_DELETE_FRICTION:F

    move-object v1, p1

    move-object v2, p3

    move-wide v4, p4

    invoke-direct/range {v0 .. v6}, Lcom/android/launcher2/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;-><init>(Lcom/android/launcher2/DragLayer;Landroid/graphics/PointF;Landroid/graphics/Rect;JF)V

    return-object v0
.end method

.method private createFlingToTrashAnimatorListener(Lcom/android/launcher2/DragLayer;Lcom/android/launcher2/DropTarget$DragObject;Landroid/graphics/PointF;Landroid/view/ViewConfiguration;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;
    .locals 19
    .parameter "dragLayer"
    .parameter "d"
    .parameter "vel"
    .parameter "config"

    .prologue
    .line 271
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    invoke-virtual {v2}, Lcom/android/launcher2/DragView;->getMeasuredWidth()I

    move-result v2

    move-object/from16 v0, p2

    iget-object v3, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    invoke-virtual {v3}, Lcom/android/launcher2/DragView;->getMeasuredHeight()I

    move-result v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/DeleteDropTarget;->mCurrentDrawable:Landroid/graphics/drawable/TransitionDrawable;

    invoke-virtual {v4}, Landroid/graphics/drawable/TransitionDrawable;->getIntrinsicWidth()I

    move-result v4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/DeleteDropTarget;->mCurrentDrawable:Landroid/graphics/drawable/TransitionDrawable;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/graphics/drawable/TransitionDrawable;->getIntrinsicHeight()I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v2, v3, v4, v1}, Lcom/android/launcher2/DeleteDropTarget;->getIconRect(IIII)Landroid/graphics/Rect;

    move-result-object v15

    .line 273
    .local v15, to:Landroid/graphics/Rect;
    new-instance v12, Landroid/graphics/Rect;

    invoke-direct {v12}, Landroid/graphics/Rect;-><init>()V

    .line 274
    .local v12, from:Landroid/graphics/Rect;
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v12}, Lcom/android/launcher2/DragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 278
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/PointF;->length()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v16

    .line 279
    .local v16, velocity:F
    const/high16 v2, 0x3f80

    invoke-virtual/range {p4 .. p4}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x4000

    div-float/2addr v3, v4

    div-float v3, v16, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v17

    .line 280
    .local v17, vp:F
    iget v2, v12, Landroid/graphics/Rect;->top:I

    neg-int v2, v2

    int-to-float v2, v2

    mul-float v2, v2, v17

    float-to-int v14, v2

    .line 281
    .local v14, offsetY:I
    int-to-float v2, v14

    move-object/from16 v0, p3

    iget v3, v0, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p3

    iget v4, v0, Landroid/graphics/PointF;->x:F

    div-float/2addr v3, v4

    div-float/2addr v2, v3

    float-to-int v13, v2

    .line 282
    .local v13, offsetX:I
    iget v2, v12, Landroid/graphics/Rect;->top:I

    add-int/2addr v2, v14

    int-to-float v10, v2

    .line 283
    .local v10, y2:F
    iget v2, v12, Landroid/graphics/Rect;->left:I

    add-int/2addr v2, v13

    int-to-float v7, v2

    .line 284
    .local v7, x2:F
    iget v2, v12, Landroid/graphics/Rect;->left:I

    int-to-float v6, v2

    .line 285
    .local v6, x1:F
    iget v2, v12, Landroid/graphics/Rect;->top:I

    int-to-float v9, v2

    .line 286
    .local v9, y1:F
    iget v2, v15, Landroid/graphics/Rect;->left:I

    int-to-float v8, v2

    .line 287
    .local v8, x3:F
    iget v2, v15, Landroid/graphics/Rect;->top:I

    int-to-float v11, v2

    .line 289
    .local v11, y3:F
    new-instance v5, Lcom/android/launcher2/DeleteDropTarget$3;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/android/launcher2/DeleteDropTarget$3;-><init>(Lcom/android/launcher2/DeleteDropTarget;)V

    .line 295
    .local v5, scaleAlphaInterpolator:Landroid/animation/TimeInterpolator;
    new-instance v2, Lcom/android/launcher2/DeleteDropTarget$4;

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    invoke-direct/range {v2 .. v11}, Lcom/android/launcher2/DeleteDropTarget$4;-><init>(Lcom/android/launcher2/DeleteDropTarget;Lcom/android/launcher2/DragLayer;Landroid/animation/TimeInterpolator;FFFFFF)V

    return-object v2
.end method

.method private isAllAppsApplication(Lcom/android/launcher2/DragSource;Ljava/lang/Object;)Z
    .locals 1
    .parameter "source"
    .parameter "info"

    .prologue
    .line 94
    instance-of v0, p1, Lcom/android/launcher2/AppsCustomizePagedView;

    if-eqz v0, :cond_0

    instance-of v0, p2, Lcom/android/launcher2/ApplicationInfo;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isAllAppsWidget(Lcom/android/launcher2/DragSource;Ljava/lang/Object;)Z
    .locals 2
    .parameter "source"
    .parameter "info"

    .prologue
    .line 97
    instance-of v1, p1, Lcom/android/launcher2/AppsCustomizePagedView;

    if-eqz v1, :cond_0

    .line 98
    instance-of v1, p2, Lcom/android/launcher2/PendingAddItemInfo;

    if-eqz v1, :cond_0

    move-object v0, p2

    .line 99
    check-cast v0, Lcom/android/launcher2/PendingAddItemInfo;

    .line 100
    .local v0, addInfo:Lcom/android/launcher2/PendingAddItemInfo;
    iget v1, v0, Lcom/android/launcher2/ItemInfo;->itemType:I

    packed-switch v1, :pswitch_data_0

    .line 107
    .end local v0           #addInfo:Lcom/android/launcher2/PendingAddItemInfo;
    :cond_0
    :pswitch_0
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 103
    .restart local v0       #addInfo:Lcom/android/launcher2/PendingAddItemInfo;
    :pswitch_1
    const/4 v1, 0x1

    goto :goto_0

    .line 100
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private isDragSourceWorkspaceOrFolder(Lcom/android/launcher2/DropTarget$DragObject;)Z
    .locals 1
    .parameter "d"

    .prologue
    .line 110
    iget-object v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragSource:Lcom/android/launcher2/DragSource;

    instance-of v0, v0, Lcom/android/launcher2/Workspace;

    if-nez v0, :cond_0

    iget-object v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragSource:Lcom/android/launcher2/DragSource;

    instance-of v0, v0, Lcom/android/launcher2/Folder;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isWorkspaceFolder(Lcom/android/launcher2/DropTarget$DragObject;)Z
    .locals 1
    .parameter "d"

    .prologue
    .line 119
    iget-object v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragSource:Lcom/android/launcher2/DragSource;

    instance-of v0, v0, Lcom/android/launcher2/Workspace;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v0, v0, Lcom/android/launcher2/FolderInfo;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isWorkspaceOrFolderApplication(Lcom/android/launcher2/DropTarget$DragObject;)Z
    .locals 1
    .parameter "d"

    .prologue
    .line 113
    invoke-direct {p0, p1}, Lcom/android/launcher2/DeleteDropTarget;->isDragSourceWorkspaceOrFolder(Lcom/android/launcher2/DropTarget$DragObject;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v0, v0, Lcom/android/launcher2/ShortcutInfo;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isWorkspaceOrFolderWidget(Lcom/android/launcher2/DropTarget$DragObject;)Z
    .locals 1
    .parameter "d"

    .prologue
    .line 116
    invoke-direct {p0, p1}, Lcom/android/launcher2/DeleteDropTarget;->isDragSourceWorkspaceOrFolder(Lcom/android/launcher2/DropTarget$DragObject;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v0, v0, Lcom/android/launcher2/LauncherAppWidgetInfo;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private resetHoverColor()V
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lcom/android/launcher2/DeleteDropTarget;->mCurrentDrawable:Landroid/graphics/drawable/TransitionDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/TransitionDrawable;->resetTransition()V

    .line 128
    iget-object v0, p0, Lcom/android/launcher2/DeleteDropTarget;->mOriginalTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v0}, Lcom/android/launcher2/DeleteDropTarget;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 129
    return-void
.end method

.method private setHoverColor()V
    .locals 2

    .prologue
    .line 123
    iget-object v0, p0, Lcom/android/launcher2/DeleteDropTarget;->mCurrentDrawable:Landroid/graphics/drawable/TransitionDrawable;

    iget v1, p0, Lcom/android/launcher2/ButtonDropTarget;->mTransitionDuration:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V

    .line 124
    iget v0, p0, Lcom/android/launcher2/ButtonDropTarget;->mHoverColor:I

    invoke-virtual {p0, v0}, Lcom/android/launcher2/DeleteDropTarget;->setTextColor(I)V

    .line 125
    return-void
.end method


# virtual methods
.method public acceptDrop(Lcom/android/launcher2/DropTarget$DragObject;)Z
    .locals 1
    .parameter "d"

    .prologue
    .line 134
    const/4 v0, 0x1

    return v0
.end method

.method public onDragEnd()V
    .locals 1

    .prologue
    .line 180
    invoke-super {p0}, Lcom/android/launcher2/ButtonDropTarget;->onDragEnd()V

    .line 181
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/launcher2/ButtonDropTarget;->mActive:Z

    .line 182
    return-void
.end method

.method public onDragEnter(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 0
    .parameter "d"

    .prologue
    .line 185
    invoke-super {p0, p1}, Lcom/android/launcher2/ButtonDropTarget;->onDragEnter(Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 187
    invoke-direct {p0}, Lcom/android/launcher2/DeleteDropTarget;->setHoverColor()V

    .line 188
    return-void
.end method

.method public onDragExit(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 2
    .parameter "d"

    .prologue
    .line 191
    invoke-super {p0, p1}, Lcom/android/launcher2/ButtonDropTarget;->onDragExit(Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 193
    iget-boolean v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragComplete:Z

    if-nez v0, :cond_0

    .line 194
    invoke-direct {p0}, Lcom/android/launcher2/DeleteDropTarget;->resetHoverColor()V

    .line 199
    :goto_0
    return-void

    .line 197
    :cond_0
    iget-object v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    iget v1, p0, Lcom/android/launcher2/ButtonDropTarget;->mHoverColor:I

    invoke-virtual {v0, v1}, Lcom/android/launcher2/DragView;->setColor(I)V

    goto :goto_0
.end method

.method public onDragStart(Lcom/android/launcher2/DragSource;Ljava/lang/Object;I)V
    .locals 6
    .parameter "source"
    .parameter "info"
    .parameter "dragAction"

    .prologue
    const/4 v4, 0x0

    .line 139
    const/4 v2, 0x1

    .line 140
    .local v2, isVisible:Z
    const/4 v1, 0x0

    .line 143
    .local v1, isUninstall:Z
    invoke-direct {p0, p1, p2}, Lcom/android/launcher2/DeleteDropTarget;->isAllAppsWidget(Lcom/android/launcher2/DragSource;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 144
    const/4 v2, 0x0

    .line 149
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/launcher2/DeleteDropTarget;->isAllAppsApplication(Lcom/android/launcher2/DragSource;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v0, p2

    .line 150
    check-cast v0, Lcom/android/launcher2/ApplicationInfo;

    .line 151
    .local v0, appInfo:Lcom/android/launcher2/ApplicationInfo;
    iget v3, v0, Lcom/android/launcher2/ApplicationInfo;->flags:I

    and-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_3

    .line 152
    const/4 v1, 0x1

    .line 158
    .end local v0           #appInfo:Lcom/android/launcher2/ApplicationInfo;
    :cond_1
    :goto_0
    if-eqz v1, :cond_4

    .line 159
    iget-object v3, p0, Lcom/android/launcher2/DeleteDropTarget;->mUninstallDrawable:Landroid/graphics/drawable/TransitionDrawable;

    invoke-virtual {p0, v3, v4, v4, v4}, Lcom/android/launcher2/DeleteDropTarget;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 163
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher2/DeleteDropTarget;->getCurrentDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/TransitionDrawable;

    iput-object v3, p0, Lcom/android/launcher2/DeleteDropTarget;->mCurrentDrawable:Landroid/graphics/drawable/TransitionDrawable;

    .line 165
    iput-boolean v2, p0, Lcom/android/launcher2/ButtonDropTarget;->mActive:Z

    .line 166
    invoke-direct {p0}, Lcom/android/launcher2/DeleteDropTarget;->resetHoverColor()V

    .line 167
    invoke-virtual {p0}, Lcom/android/launcher2/DeleteDropTarget;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    if-eqz v2, :cond_5

    const/4 v4, 0x0

    :goto_2
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 168
    invoke-virtual {p0}, Lcom/android/launcher2/DeleteDropTarget;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-lez v3, :cond_2

    .line 169
    if-eqz v1, :cond_6

    const v3, 0x7f0d0033

    :goto_3
    invoke-virtual {p0, v3}, Lcom/android/launcher2/DeleteDropTarget;->setText(I)V

    .line 173
    :cond_2
    const-string v3, "DeleteDropTarget"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onDragStart: isUninstall = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", isVisible = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", info = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    return-void

    .line 154
    .restart local v0       #appInfo:Lcom/android/launcher2/ApplicationInfo;
    :cond_3
    const/4 v2, 0x0

    goto :goto_0

    .line 161
    .end local v0           #appInfo:Lcom/android/launcher2/ApplicationInfo;
    :cond_4
    iget-object v3, p0, Lcom/android/launcher2/DeleteDropTarget;->mRemoveDrawable:Landroid/graphics/drawable/TransitionDrawable;

    invoke-virtual {p0, v3, v4, v4, v4}, Lcom/android/launcher2/DeleteDropTarget;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    .line 167
    :cond_5
    const/16 v4, 0x8

    goto :goto_2

    .line 169
    :cond_6
    const v3, 0x7f0d0032

    goto :goto_3
.end method

.method public onDrop(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 3
    .parameter "d"

    .prologue
    .line 261
    const-string v0, "DeleteDropTarget"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDrop: d = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    invoke-direct {p0, p1}, Lcom/android/launcher2/DeleteDropTarget;->animateToTrashAndCompleteDrop(Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 264
    return-void
.end method

.method protected onFinishInflate()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 65
    invoke-super {p0}, Lcom/android/launcher2/ButtonDropTarget;->onFinishInflate()V

    .line 68
    invoke-virtual {p0}, Lcom/android/launcher2/DeleteDropTarget;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v2

    iput-object v2, p0, Lcom/android/launcher2/DeleteDropTarget;->mOriginalTextColor:Landroid/content/res/ColorStateList;

    .line 71
    invoke-virtual {p0}, Lcom/android/launcher2/DeleteDropTarget;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 72
    .local v1, r:Landroid/content/res/Resources;
    const/high16 v2, 0x7f08

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher2/ButtonDropTarget;->mHoverColor:I

    .line 73
    const v2, 0x7f020059

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/TransitionDrawable;

    iput-object v2, p0, Lcom/android/launcher2/DeleteDropTarget;->mUninstallDrawable:Landroid/graphics/drawable/TransitionDrawable;

    .line 75
    const v2, 0x7f02004c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/TransitionDrawable;

    iput-object v2, p0, Lcom/android/launcher2/DeleteDropTarget;->mRemoveDrawable:Landroid/graphics/drawable/TransitionDrawable;

    .line 77
    iget-object v2, p0, Lcom/android/launcher2/DeleteDropTarget;->mRemoveDrawable:Landroid/graphics/drawable/TransitionDrawable;

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/TransitionDrawable;->setCrossFadeEnabled(Z)V

    .line 78
    iget-object v2, p0, Lcom/android/launcher2/DeleteDropTarget;->mUninstallDrawable:Landroid/graphics/drawable/TransitionDrawable;

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/TransitionDrawable;->setCrossFadeEnabled(Z)V

    .line 82
    invoke-virtual {p0}, Lcom/android/launcher2/DeleteDropTarget;->getCurrentDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/TransitionDrawable;

    iput-object v2, p0, Lcom/android/launcher2/DeleteDropTarget;->mCurrentDrawable:Landroid/graphics/drawable/TransitionDrawable;

    .line 85
    invoke-virtual {p0}, Lcom/android/launcher2/DeleteDropTarget;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v0, v2, Landroid/content/res/Configuration;->orientation:I

    .line 86
    .local v0, orientation:I
    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    .line 87
    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->isScreenLarge()Z

    move-result v2

    if-nez v2, :cond_0

    .line 88
    const-string v2, ""

    invoke-virtual {p0, v2}, Lcom/android/launcher2/DeleteDropTarget;->setText(Ljava/lang/CharSequence;)V

    .line 91
    :cond_0
    return-void
.end method

.method public onFlingToDelete(Lcom/android/launcher2/DropTarget$DragObject;IILandroid/graphics/PointF;)V
    .locals 21
    .parameter "d"
    .parameter "x"
    .parameter "y"
    .parameter "vel"

    .prologue
    .line 384
    const-string v4, "DeleteDropTarget"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onFlingToDelete: d = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 387
    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragSource:Lcom/android/launcher2/DragSource;

    instance-of v0, v4, Lcom/android/launcher2/AppsCustomizePagedView;

    move/from16 v20, v0

    .line 390
    .local v20, isAllApps:Z
    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Lcom/android/launcher2/DragView;->setColor(I)V

    .line 391
    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    invoke-virtual {v4}, Lcom/android/launcher2/DragView;->updateInitialScaleToCurrentScale()V

    .line 393
    if-eqz v20, :cond_0

    .line 394
    invoke-direct/range {p0 .. p0}, Lcom/android/launcher2/DeleteDropTarget;->resetHoverColor()V

    .line 397
    :cond_0
    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/launcher2/DeleteDropTarget;->mFlingDeleteMode:I

    sget v6, Lcom/android/launcher2/DeleteDropTarget;->MODE_FLING_DELETE_TO_TRASH:I

    if-ne v4, v6, :cond_1

    .line 399
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/ButtonDropTarget;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    invoke-virtual {v4}, Lcom/android/launcher2/SearchDropTargetBar;->deferOnDragEnd()V

    .line 400
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/ButtonDropTarget;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    invoke-virtual {v4}, Lcom/android/launcher2/SearchDropTargetBar;->finishAnimations()V

    .line 403
    :cond_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/ButtonDropTarget;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-static {v4}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v11

    .line 404
    .local v11, config:Landroid/view/ViewConfiguration;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/ButtonDropTarget;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v4}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v5

    .line 405
    .local v5, dragLayer:Lcom/android/launcher2/DragLayer;
    sget v10, Lcom/android/launcher2/DeleteDropTarget;->FLING_DELETE_ANIMATION_DURATION:I

    .line 406
    .local v10, duration:I
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v8

    .line 413
    .local v8, startTime:J
    new-instance v16, Lcom/android/launcher2/DeleteDropTarget$5;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v8, v9, v10}, Lcom/android/launcher2/DeleteDropTarget$5;-><init>(Lcom/android/launcher2/DeleteDropTarget;JI)V

    .line 429
    .local v16, tInterpolator:Landroid/animation/TimeInterpolator;
    const/4 v14, 0x0

    .line 430
    .local v14, updateCb:Landroid/animation/ValueAnimator$AnimatorUpdateListener;
    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/launcher2/DeleteDropTarget;->mFlingDeleteMode:I

    sget v6, Lcom/android/launcher2/DeleteDropTarget;->MODE_FLING_DELETE_TO_TRASH:I

    if-ne v4, v6, :cond_3

    .line 431
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    invoke-direct {v0, v5, v1, v2, v11}, Lcom/android/launcher2/DeleteDropTarget;->createFlingToTrashAnimatorListener(Lcom/android/launcher2/DragLayer;Lcom/android/launcher2/DropTarget$DragObject;Landroid/graphics/PointF;Landroid/view/ViewConfiguration;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    move-result-object v14

    .line 436
    :cond_2
    :goto_0
    new-instance v17, Lcom/android/launcher2/DeleteDropTarget$6;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move/from16 v2, v20

    move-object/from16 v3, p1

    invoke-direct {v0, v1, v2, v3}, Lcom/android/launcher2/DeleteDropTarget$6;-><init>(Lcom/android/launcher2/DeleteDropTarget;ZLcom/android/launcher2/DropTarget$DragObject;)V

    .line 450
    .local v17, onAnimationEndRunnable:Ljava/lang/Runnable;
    move-object/from16 v0, p1

    iget-object v13, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object v12, v5

    move v15, v10

    invoke-virtual/range {v12 .. v19}, Lcom/android/launcher2/DragLayer;->animateView(Lcom/android/launcher2/DragView;Landroid/animation/ValueAnimator$AnimatorUpdateListener;ILandroid/animation/TimeInterpolator;Ljava/lang/Runnable;ILandroid/view/View;)V

    .line 452
    return-void

    .line 432
    .end local v17           #onAnimationEndRunnable:Ljava/lang/Runnable;
    :cond_3
    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/launcher2/DeleteDropTarget;->mFlingDeleteMode:I

    sget v6, Lcom/android/launcher2/DeleteDropTarget;->MODE_FLING_DELETE_ALONG_VECTOR:I

    if-ne v4, v6, :cond_2

    move-object/from16 v4, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p4

    .line 433
    invoke-direct/range {v4 .. v11}, Lcom/android/launcher2/DeleteDropTarget;->createFlingAlongVectorAnimatorListener(Lcom/android/launcher2/DragLayer;Lcom/android/launcher2/DropTarget$DragObject;Landroid/graphics/PointF;JILandroid/view/ViewConfiguration;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    move-result-object v14

    goto :goto_0
.end method
