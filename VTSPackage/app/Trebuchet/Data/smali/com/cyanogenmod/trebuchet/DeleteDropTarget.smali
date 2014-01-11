.class public Lcom/cyanogenmod/trebuchet/DeleteDropTarget;
.super Lcom/cyanogenmod/trebuchet/ButtonDropTarget;
.source "DeleteDropTarget.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;
    }
.end annotation


# static fields
.field private static final DELETE_ANIMATION_DURATION:I = 0x11d

.field private static final FLING_DELETE_ANIMATION_DURATION:I = 0x15e

.field private static final FLING_TO_DELETE_FRICTION:F = 0.035f

.field private static final MODE_DELETE:I = 0x0

.field private static final MODE_FLING_DELETE_ALONG_VECTOR:I = 0x1

.field private static final MODE_FLING_DELETE_TO_TRASH:I = 0x0

.field private static final MODE_UNINSTALL:I = 0x1


# instance fields
.field private mCurrentDrawable:Landroid/graphics/drawable/Drawable;

.field private final mFlingDeleteMode:I

.field private final mHandler:Landroid/os/Handler;

.field private mMode:I

.field private mOriginalTextColor:Landroid/content/res/ColorStateList;

.field private mRemoveActiveDrawable:Landroid/graphics/drawable/Drawable;

.field private mRemoveNormalDrawable:Landroid/graphics/drawable/Drawable;

.field private final mShowUninstaller:Ljava/lang/Runnable;

.field private mUninstall:Z

.field private mUninstallActiveDrawable:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 64
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 65
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 68
    invoke-direct {p0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 48
    const/4 v0, 0x1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mFlingDeleteMode:I

    .line 52
    const/4 v0, 0x0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mMode:I

    .line 61
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mHandler:Landroid/os/Handler;

    .line 71
    new-instance v0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$1;

    invoke-direct {v0, p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$1;-><init>(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mShowUninstaller:Ljava/lang/Runnable;

    .line 69
    return-void
.end method

.method static synthetic access$000(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->switchToUninstallTarget()V

    return-void
.end method

.method static synthetic access$100(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->completeDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    return-void
.end method

.method private animateToTrashAndCompleteDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 17
    .parameter "d"

    .prologue
    .line 260
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v2

    .line 261
    .local v2, dragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 262
    .local v4, from:Landroid/graphics/Rect;
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v2, v3, v4}, Lcom/cyanogenmod/trebuchet/DragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 263
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredWidth()I

    move-result v3

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredHeight()I

    move-result v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v9

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v7, v8, v9}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->getIconRect(IIII)Landroid/graphics/Rect;

    move-result-object v5

    .line 265
    .local v5, to:Landroid/graphics/Rect;
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v7

    int-to-float v7, v7

    div-float v6, v3, v7

    .line 267
    .local v6, scale:F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->deferOnDragEnd()V

    .line 268
    new-instance v14, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$2;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v14, v0, v1}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$2;-><init>(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 276
    .local v14, onAnimationEndRunnable:Ljava/lang/Runnable;
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    const/high16 v7, 0x3f80

    const/high16 v8, 0x3f80

    const v9, 0x3dcccccd

    const v10, 0x3dcccccd

    const/16 v11, 0x11d

    new-instance v12, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v13, 0x4000

    invoke-direct {v12, v13}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    new-instance v13, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v13}, Landroid/view/animation/LinearInterpolator;-><init>()V

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-virtual/range {v2 .. v16}, Lcom/cyanogenmod/trebuchet/DragLayer;->animateView(Lcom/cyanogenmod/trebuchet/DragView;Landroid/graphics/Rect;Landroid/graphics/Rect;FFFFFILandroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;Ljava/lang/Runnable;ILandroid/view/View;)V

    .line 280
    return-void
.end method

.method private completeDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 6
    .parameter "d"

    .prologue
    .line 283
    iget-object v2, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v2, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 285
    .local v2, item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    iget v4, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mMode:I

    packed-switch v4, :pswitch_data_0

    .line 322
    .end local v2           #item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    :cond_0
    :goto_0
    return-void

    .line 287
    .restart local v2       #item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    :pswitch_0
    iget-object v4, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

    invoke-direct {p0, v4, v2}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->isWorkspaceOrFolderApplication(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 288
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-static {v4, v2}, Lcom/cyanogenmod/trebuchet/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    goto :goto_0

    .line 289
    :cond_1
    iget-object v4, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

    iget-object v5, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    invoke-direct {p0, v4, v5}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->isWorkspaceFolder(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    move-object v1, v2

    .line 291
    check-cast v1, Lcom/cyanogenmod/trebuchet/FolderInfo;

    .line 292
    .local v1, folderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->removeFolder(Lcom/cyanogenmod/trebuchet/FolderInfo;)V

    .line 293
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-static {v4, v1}, Lcom/cyanogenmod/trebuchet/LauncherModel;->deleteFolderContentsFromDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/FolderInfo;)V

    goto :goto_0

    .line 294
    .end local v1           #folderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;
    :cond_2
    iget-object v4, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

    invoke-direct {p0, v4, v2}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->isWorkspaceWidget(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 296
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object v4, v2

    check-cast v4, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    invoke-virtual {v5, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->removeAppWidget(Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;)V

    .line 297
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-static {v4, v2}, Lcom/cyanogenmod/trebuchet/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    move-object v3, v2

    .line 299
    check-cast v3, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    .line 300
    .local v3, launcherAppWidgetInfo:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getAppWidgetHost()Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    move-result-object v0

    .line 301
    .local v0, appWidgetHost:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;
    if-eqz v0, :cond_0

    .line 304
    new-instance v4, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$3;

    const-string v5, "deleteAppWidgetId"

    invoke-direct {v4, p0, v5, v0, v3}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$3;-><init>(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;Ljava/lang/String;Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;)V

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$3;->start()V

    goto :goto_0

    .line 313
    .end local v0           #appWidgetHost:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;
    .end local v3           #launcherAppWidgetInfo:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;
    :pswitch_1
    iget-object v4, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

    invoke-direct {p0, v4, v2}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->isAllAppsApplication(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 315
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    check-cast v2, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    .end local v2           #item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    invoke-virtual {v4, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->startApplicationUninstallActivity(Lcom/cyanogenmod/trebuchet/ApplicationInfo;)V

    goto :goto_0

    .line 316
    .restart local v2       #item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    :cond_3
    iget-object v4, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

    invoke-direct {p0, v4, v2}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->isWorkspaceOrFolderApplication(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 318
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    check-cast v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .end local v2           #item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    invoke-virtual {v4, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->startShortcutUninstallActivity(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    goto :goto_0

    .line 285
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private createFlingAlongVectorAnimatorListener(Lcom/cyanogenmod/trebuchet/DragLayer;Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;Landroid/graphics/PointF;J)Landroid/animation/ValueAnimator$AnimatorUpdateListener;
    .locals 7
    .parameter "dragLayer"
    .parameter "d"
    .parameter "vel"
    .parameter "startTime"

    .prologue
    .line 436
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 437
    .local v3, from:Landroid/graphics/Rect;
    iget-object v0, p2, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {p1, v0, v3}, Lcom/cyanogenmod/trebuchet/DragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 439
    new-instance v0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;

    const v6, 0x3d0f5c29

    move-object v1, p1

    move-object v2, p3

    move-wide v4, p4

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;-><init>(Lcom/cyanogenmod/trebuchet/DragLayer;Landroid/graphics/PointF;Landroid/graphics/Rect;JF)V

    return-object v0
.end method

.method private createFlingToTrashAnimatorListener(Lcom/cyanogenmod/trebuchet/DragLayer;Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;Landroid/graphics/PointF;Landroid/view/ViewConfiguration;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;
    .locals 19
    .parameter "dragLayer"
    .parameter "d"
    .parameter "vel"
    .parameter "config"

    .prologue
    .line 333
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredWidth()I

    move-result v2

    move-object/from16 v0, p2

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredHeight()I

    move-result v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v2, v3, v4, v1}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->getIconRect(IIII)Landroid/graphics/Rect;

    move-result-object v15

    .line 335
    .local v15, to:Landroid/graphics/Rect;
    new-instance v12, Landroid/graphics/Rect;

    invoke-direct {v12}, Landroid/graphics/Rect;-><init>()V

    .line 336
    .local v12, from:Landroid/graphics/Rect;
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v12}, Lcom/cyanogenmod/trebuchet/DragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 340
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/PointF;->length()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v16

    .line 341
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

    .line 342
    .local v17, vp:F
    iget v2, v12, Landroid/graphics/Rect;->top:I

    neg-int v2, v2

    int-to-float v2, v2

    mul-float v2, v2, v17

    float-to-int v14, v2

    .line 343
    .local v14, offsetY:I
    int-to-float v2, v14

    move-object/from16 v0, p3

    iget v3, v0, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p3

    iget v4, v0, Landroid/graphics/PointF;->x:F

    div-float/2addr v3, v4

    div-float/2addr v2, v3

    float-to-int v13, v2

    .line 344
    .local v13, offsetX:I
    iget v2, v12, Landroid/graphics/Rect;->top:I

    add-int/2addr v2, v14

    int-to-float v10, v2

    .line 345
    .local v10, y2:F
    iget v2, v12, Landroid/graphics/Rect;->left:I

    add-int/2addr v2, v13

    int-to-float v7, v2

    .line 346
    .local v7, x2:F
    iget v2, v12, Landroid/graphics/Rect;->left:I

    int-to-float v6, v2

    .line 347
    .local v6, x1:F
    iget v2, v12, Landroid/graphics/Rect;->top:I

    int-to-float v9, v2

    .line 348
    .local v9, y1:F
    iget v2, v15, Landroid/graphics/Rect;->left:I

    int-to-float v8, v2

    .line 349
    .local v8, x3:F
    iget v2, v15, Landroid/graphics/Rect;->top:I

    int-to-float v11, v2

    .line 351
    .local v11, y3:F
    new-instance v5, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$4;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$4;-><init>(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;)V

    .line 357
    .local v5, scaleAlphaInterpolator:Landroid/animation/TimeInterpolator;
    new-instance v2, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    invoke-direct/range {v2 .. v11}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;-><init>(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;Lcom/cyanogenmod/trebuchet/DragLayer;Landroid/animation/TimeInterpolator;FFFFFF)V

    return-object v2
.end method

.method private isAllAppsApplication(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z
    .locals 1
    .parameter "source"
    .parameter "info"

    .prologue
    .line 106
    instance-of v0, p1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    if-eqz v0, :cond_0

    instance-of v0, p2, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isAllAppsItem(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z
    .locals 1
    .parameter "source"
    .parameter "info"

    .prologue
    .line 103
    invoke-direct {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->isAllAppsApplication(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->isAllAppsWidget(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isAllAppsWidget(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z
    .locals 2
    .parameter "source"
    .parameter "info"

    .prologue
    .line 109
    instance-of v1, p1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    if-eqz v1, :cond_0

    .line 110
    instance-of v1, p2, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;

    if-eqz v1, :cond_0

    move-object v0, p2

    .line 111
    check-cast v0, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;

    .line 112
    .local v0, addInfo:Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;
    iget v1, v0, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->itemType:I

    packed-switch v1, :pswitch_data_0

    .line 120
    .end local v0           #addInfo:Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;
    :cond_0
    :pswitch_0
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 116
    .restart local v0       #addInfo:Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;
    :pswitch_1
    const/4 v1, 0x1

    goto :goto_0

    .line 112
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private isDragSourceWorkspaceOrFolder(Lcom/cyanogenmod/trebuchet/DragSource;)Z
    .locals 1
    .parameter "source"

    .prologue
    .line 123
    instance-of v0, p1, Lcom/cyanogenmod/trebuchet/Workspace;

    if-nez v0, :cond_0

    instance-of v0, p1, Lcom/cyanogenmod/trebuchet/Folder;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isWorkspaceFolder(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z
    .locals 1
    .parameter "source"
    .parameter "info"

    .prologue
    .line 132
    instance-of v0, p1, Lcom/cyanogenmod/trebuchet/Workspace;

    if-eqz v0, :cond_0

    instance-of v0, p2, Lcom/cyanogenmod/trebuchet/FolderInfo;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isWorkspaceOrFolderApplication(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z
    .locals 1
    .parameter "source"
    .parameter "info"

    .prologue
    .line 126
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->isDragSourceWorkspaceOrFolder(Lcom/cyanogenmod/trebuchet/DragSource;)Z

    move-result v0

    if-eqz v0, :cond_0

    instance-of v0, p2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isWorkspaceWidget(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z
    .locals 1
    .parameter "source"
    .parameter "info"

    .prologue
    .line 129
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->isDragSourceWorkspaceOrFolder(Lcom/cyanogenmod/trebuchet/DragSource;)Z

    move-result v0

    if-eqz v0, :cond_0

    instance-of v0, p2, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

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
    .line 139
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mOriginalTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 140
    return-void
.end method

.method private setHoverColor()V
    .locals 1

    .prologue
    .line 136
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mHoverColor:I

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->setTextColor(I)V

    .line 137
    return-void
.end method

.method private switchToUninstallTarget()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 199
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mUninstall:Z

    if-nez v0, :cond_0

    .line 211
    :goto_0
    return-void

    .line 203
    :cond_0
    const/4 v0, 0x1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mMode:I

    .line 205
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 206
    const v0, 0x7f0900a1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->setText(I)V

    .line 209
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mUninstallActiveDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0, v1, v1, v1}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 210
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_0
.end method


# virtual methods
.method public acceptDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)Z
    .locals 3
    .parameter "d"

    .prologue
    const/4 v1, 0x0

    .line 144
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v0, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->itemType:I

    const/4 v2, 0x3

    if-ne v0, v2, :cond_0

    .line 146
    iput-boolean v1, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->deferDragViewCleanupPostAnimation:Z

    move v0, v1

    .line 150
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public onDragEnd()V
    .locals 1

    .prologue
    .line 215
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;->onDragEnd()V

    .line 217
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mActive:Z

    .line 218
    return-void
.end method

.method public onDragEnter(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 5
    .parameter "d"

    .prologue
    const/4 v4, 0x0

    .line 221
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;->onDragEnter(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 223
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mUninstall:Z

    if-eqz v0, :cond_0

    .line 224
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mShowUninstaller:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 225
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mShowUninstaller:Ljava/lang/Runnable;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 228
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mRemoveActiveDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0, v4, v4, v4}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 229
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    .line 231
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->setHoverColor()V

    .line 232
    return-void
.end method

.method public onDragExit(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 4
    .parameter "d"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 235
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;->onDragExit(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 237
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mShowUninstaller:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 239
    iget-boolean v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragComplete:Z

    if-nez v0, :cond_2

    .line 240
    iput v3, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mMode:I

    .line 242
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 243
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    invoke-direct {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->isAllAppsItem(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 244
    const v0, 0x7f090003

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->setText(I)V

    .line 250
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mRemoveNormalDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0, v2, v2, v2}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 251
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    aget-object v0, v0, v3

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    .line 252
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->resetHoverColor()V

    .line 257
    :goto_1
    return-void

    .line 246
    :cond_1
    const v0, 0x7f0900a0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->setText(I)V

    goto :goto_0

    .line 255
    :cond_2
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mHoverColor:I

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/DragView;->setColor(I)V

    goto :goto_1
.end method

.method public onDragStart(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;I)V
    .locals 10
    .parameter "source"
    .parameter "info"
    .parameter "dragAction"

    .prologue
    const/4 v9, 0x0

    const/4 v7, 0x0

    .line 155
    const/4 v1, 0x0

    .line 156
    .local v1, isUninstall:Z
    const/4 v2, 0x1

    .line 160
    .local v2, isVisible:Z
    invoke-direct {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->isAllAppsApplication(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    move-object v0, p2

    .line 161
    check-cast v0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    .line 162
    .local v0, appInfo:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    iget v6, v0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->flags:I

    and-int/lit8 v6, v6, 0x1

    if-eqz v6, :cond_0

    .line 163
    const/4 v1, 0x1

    .line 179
    .end local v0           #appInfo:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    :cond_0
    :goto_0
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mRemoveNormalDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v6, v9, v9, v9}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 180
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v6

    aget-object v6, v6, v7

    iput-object v6, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    .line 182
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mUninstall:Z

    .line 183
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mActive:Z

    .line 184
    iput v7, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mMode:I

    .line 186
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mOriginalTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v6}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 187
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->resetHoverColor()V

    .line 188
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    if-eqz v2, :cond_4

    :goto_1
    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 189
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v6

    if-lez v6, :cond_1

    .line 190
    invoke-direct {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->isAllAppsItem(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 191
    const v6, 0x7f090003

    invoke-virtual {p0, v6}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->setText(I)V

    .line 196
    :cond_1
    :goto_2
    return-void

    .line 165
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->isWorkspaceOrFolderApplication(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    move-object v5, p2

    .line 166
    check-cast v5, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 167
    .local v5, shortcutInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 168
    .local v3, pm:Landroid/content/pm/PackageManager;
    iget v6, v5, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->itemType:I

    const/4 v8, 0x3

    if-eq v6, v8, :cond_3

    .line 169
    iget-object v6, v5, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v3, v6, v7}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v4

    .line 170
    .local v4, resolveInfo:Landroid/content/pm/ResolveInfo;
    if-eqz v4, :cond_0

    iget-object v6, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v6, v6, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v6, v6, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v6, v6, 0x1

    if-nez v6, :cond_0

    .line 172
    const/4 v1, 0x1

    goto :goto_0

    .line 175
    .end local v4           #resolveInfo:Landroid/content/pm/ResolveInfo;
    :cond_3
    const/4 v2, 0x0

    goto :goto_0

    .line 188
    .end local v3           #pm:Landroid/content/pm/PackageManager;
    .end local v5           #shortcutInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_4
    const/16 v7, 0x8

    goto :goto_1

    .line 193
    :cond_5
    const v6, 0x7f0900a0

    invoke-virtual {p0, v6}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->setText(I)V

    goto :goto_2
.end method

.method public onDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 0
    .parameter "d"

    .prologue
    .line 325
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->animateToTrashAndCompleteDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 326
    return-void
.end method

.method protected onFinishInflate()V
    .locals 5

    .prologue
    .line 80
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;->onFinishInflate()V

    .line 83
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mOriginalTextColor:Landroid/content/res/ColorStateList;

    .line 86
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 87
    .local v1, r:Landroid/content/res/Resources;
    const/high16 v3, 0x7f0a

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iput v3, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mHoverColor:I

    .line 88
    const v3, 0x7f020027

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mUninstallActiveDrawable:Landroid/graphics/drawable/Drawable;

    .line 89
    const v3, 0x7f020020

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mRemoveActiveDrawable:Landroid/graphics/drawable/Drawable;

    .line 90
    const v3, 0x7f020021

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mRemoveNormalDrawable:Landroid/graphics/drawable/Drawable;

    .line 93
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v0, v3, Landroid/content/res/Configuration;->orientation:I

    .line 94
    .local v0, orientation:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0b000a

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 95
    .local v2, transposeLayout:Z
    const/4 v3, 0x2

    if-ne v0, v3, :cond_0

    .line 96
    if-eqz v2, :cond_0

    .line 97
    const-string v3, ""

    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->setText(Ljava/lang/CharSequence;)V

    .line 100
    :cond_0
    return-void
.end method

.method public onFlingToDelete(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;IILandroid/graphics/PointF;)V
    .locals 20
    .parameter "d"
    .parameter "x"
    .parameter "y"
    .parameter "vel"

    .prologue
    .line 444
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

    instance-of v0, v3, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    move/from16 v19, v0

    .line 447
    .local v19, isAllApps:Z
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Lcom/cyanogenmod/trebuchet/DragView;->setColor(I)V

    .line 448
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/DragView;->updateInitialScaleToCurrentScale()V

    .line 450
    if-eqz v19, :cond_0

    .line 451
    invoke-direct/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->resetHoverColor()V

    .line 460
    :cond_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-static {v3}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v17

    .line 461
    .local v17, config:Landroid/view/ViewConfiguration;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v4

    .line 462
    .local v4, dragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;
    const/16 v18, 0x15e

    .line 463
    .local v18, duration:I
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v7

    .line 470
    .local v7, startTime:J
    new-instance v13, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$6;

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v7, v8}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$6;-><init>(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;J)V

    .line 486
    .local v13, tInterpolator:Landroid/animation/TimeInterpolator;
    const/4 v11, 0x0

    .local v11, updateCb:Landroid/animation/ValueAnimator$AnimatorUpdateListener;
    move-object/from16 v3, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p4

    .line 490
    invoke-direct/range {v3 .. v8}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->createFlingAlongVectorAnimatorListener(Lcom/cyanogenmod/trebuchet/DragLayer;Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;Landroid/graphics/PointF;J)Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    move-result-object v11

    .line 492
    new-instance v14, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$7;

    move-object/from16 v0, p0

    move/from16 v1, v19

    move-object/from16 v2, p1

    invoke-direct {v14, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$7;-><init>(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;ZLcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 506
    .local v14, onAnimationEndRunnable:Ljava/lang/Runnable;
    move-object/from16 v0, p1

    iget-object v10, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    const/16 v12, 0x15e

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object v9, v4

    invoke-virtual/range {v9 .. v16}, Lcom/cyanogenmod/trebuchet/DragLayer;->animateView(Lcom/cyanogenmod/trebuchet/DragView;Landroid/animation/ValueAnimator$AnimatorUpdateListener;ILandroid/animation/TimeInterpolator;Ljava/lang/Runnable;ILandroid/view/View;)V

    .line 508
    return-void
.end method
