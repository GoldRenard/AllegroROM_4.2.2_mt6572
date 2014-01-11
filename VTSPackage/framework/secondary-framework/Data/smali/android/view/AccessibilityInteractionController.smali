.class final Landroid/view/AccessibilityInteractionController;
.super Ljava/lang/Object;
.source "AccessibilityInteractionController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/view/AccessibilityInteractionController$1;,
        Landroid/view/AccessibilityInteractionController$PrivateHandler;,
        Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;
    }
.end annotation


# instance fields
.field private final mHandler:Landroid/os/Handler;

.field private final mMyLooperThreadId:J

.field private final mMyProcessId:I

.field private final mPrefetcher:Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;

.field private mTempAccessibilityNodeInfoList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mTempArrayList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final mTempRect:Landroid/graphics/Rect;

.field private final mViewRootImpl:Landroid/view/ViewRootImpl;


# direct methods
.method public constructor <init>(Landroid/view/ViewRootImpl;)V
    .locals 3
    .parameter "viewRootImpl"

    .prologue
    .line 67
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroid/view/AccessibilityInteractionController;->mTempAccessibilityNodeInfoList:Ljava/util/ArrayList;

    .line 63
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroid/view/AccessibilityInteractionController;->mTempArrayList:Ljava/util/ArrayList;

    .line 65
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Landroid/view/AccessibilityInteractionController;->mTempRect:Landroid/graphics/Rect;

    .line 68
    iget-object v1, p1, Landroid/view/ViewRootImpl;->mHandler:Landroid/view/ViewRootImpl$ViewRootHandler;

    invoke-virtual {v1}, Landroid/view/ViewRootImpl$ViewRootHandler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    .line 69
    .local v0, looper:Landroid/os/Looper;
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v1

    iput-wide v1, p0, Landroid/view/AccessibilityInteractionController;->mMyLooperThreadId:J

    .line 70
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v1

    iput v1, p0, Landroid/view/AccessibilityInteractionController;->mMyProcessId:I

    .line 71
    new-instance v1, Landroid/view/AccessibilityInteractionController$PrivateHandler;

    invoke-direct {v1, p0, v0}, Landroid/view/AccessibilityInteractionController$PrivateHandler;-><init>(Landroid/view/AccessibilityInteractionController;Landroid/os/Looper;)V

    iput-object v1, p0, Landroid/view/AccessibilityInteractionController;->mHandler:Landroid/os/Handler;

    .line 72
    iput-object p1, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    .line 73
    new-instance v1, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;-><init>(Landroid/view/AccessibilityInteractionController;Landroid/view/AccessibilityInteractionController$1;)V

    iput-object v1, p0, Landroid/view/AccessibilityInteractionController;->mPrefetcher:Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;

    .line 74
    return-void
.end method

.method static synthetic access$100(Landroid/view/AccessibilityInteractionController;Landroid/view/View;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 48
    invoke-direct {p0, p1}, Landroid/view/AccessibilityInteractionController;->isShown(Landroid/view/View;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Landroid/view/AccessibilityInteractionController;Landroid/os/Message;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 48
    invoke-direct {p0, p1}, Landroid/view/AccessibilityInteractionController;->findAccessibilityNodeInfoByAccessibilityIdUiThread(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$300(Landroid/view/AccessibilityInteractionController;Landroid/os/Message;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 48
    invoke-direct {p0, p1}, Landroid/view/AccessibilityInteractionController;->perfromAccessibilityActionUiThread(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$400(Landroid/view/AccessibilityInteractionController;Landroid/os/Message;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 48
    invoke-direct {p0, p1}, Landroid/view/AccessibilityInteractionController;->findAccessibilityNodeInfoByViewIdUiThread(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$500(Landroid/view/AccessibilityInteractionController;Landroid/os/Message;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 48
    invoke-direct {p0, p1}, Landroid/view/AccessibilityInteractionController;->findAccessibilityNodeInfosByTextUiThread(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$600(Landroid/view/AccessibilityInteractionController;Landroid/os/Message;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 48
    invoke-direct {p0, p1}, Landroid/view/AccessibilityInteractionController;->findFocusUiThread(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$700(Landroid/view/AccessibilityInteractionController;Landroid/os/Message;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 48
    invoke-direct {p0, p1}, Landroid/view/AccessibilityInteractionController;->focusSearchUiThread(Landroid/os/Message;)V

    return-void
.end method

.method private applyApplicationScaleIfNeeded(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 3
    .parameter "info"

    .prologue
    .line 590
    if-nez p1, :cond_1

    .line 605
    :cond_0
    :goto_0
    return-void

    .line 593
    :cond_1
    iget-object v2, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v2, v2, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    iget v0, v2, Landroid/view/View$AttachInfo;->mApplicationScale:F

    .line 594
    .local v0, applicationScale:F
    const/high16 v2, 0x3f80

    cmpl-float v2, v0, v2

    if-eqz v2, :cond_0

    .line 595
    iget-object v1, p0, Landroid/view/AccessibilityInteractionController;->mTempRect:Landroid/graphics/Rect;

    .line 597
    .local v1, bounds:Landroid/graphics/Rect;
    invoke-virtual {p1, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInParent(Landroid/graphics/Rect;)V

    .line 598
    invoke-virtual {v1, v0}, Landroid/graphics/Rect;->scale(F)V

    .line 599
    invoke-virtual {p1, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setBoundsInParent(Landroid/graphics/Rect;)V

    .line 601
    invoke-virtual {p1, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    .line 602
    invoke-virtual {v1, v0}, Landroid/graphics/Rect;->scale(F)V

    .line 603
    invoke-virtual {p1, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setBoundsInScreen(Landroid/graphics/Rect;)V

    goto :goto_0
.end method

.method private applyApplicationScaleIfNeeded(Ljava/util/List;)V
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 576
    .local p1, infos:Ljava/util/List;,"Ljava/util/List<Landroid/view/accessibility/AccessibilityNodeInfo;>;"
    if-nez p1, :cond_1

    .line 587
    :cond_0
    return-void

    .line 579
    :cond_1
    iget-object v4, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v4, v4, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    iget v0, v4, Landroid/view/View$AttachInfo;->mApplicationScale:F

    .line 580
    .local v0, applicationScale:F
    const/high16 v4, 0x3f80

    cmpl-float v4, v0, v4

    if-eqz v4, :cond_0

    .line 581
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    .line 582
    .local v3, infoCount:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 583
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 584
    .local v2, info:Landroid/view/accessibility/AccessibilityNodeInfo;
    invoke-direct {p0, v2}, Landroid/view/AccessibilityInteractionController;->applyApplicationScaleIfNeeded(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 582
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private findAccessibilityNodeInfoByAccessibilityIdUiThread(Landroid/os/Message;)V
    .locals 11
    .parameter "message"

    .prologue
    const/4 v8, 0x0

    .line 114
    iget v3, p1, Landroid/os/Message;->arg1:I

    .line 116
    .local v3, flags:I
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/android/internal/os/SomeArgs;

    .line 117
    .local v1, args:Lcom/android/internal/os/SomeArgs;
    iget v0, v1, Lcom/android/internal/os/SomeArgs;->argi1:I

    .line 118
    .local v0, accessibilityViewId:I
    iget v7, v1, Lcom/android/internal/os/SomeArgs;->argi2:I

    .line 119
    .local v7, virtualDescendantId:I
    iget v5, v1, Lcom/android/internal/os/SomeArgs;->argi3:I

    .line 120
    .local v5, interactionId:I
    iget-object v2, v1, Lcom/android/internal/os/SomeArgs;->arg1:Ljava/lang/Object;

    check-cast v2, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;

    .line 123
    .local v2, callback:Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;
    invoke-virtual {v1}, Lcom/android/internal/os/SomeArgs;->recycle()V

    .line 125
    iget-object v4, p0, Landroid/view/AccessibilityInteractionController;->mTempAccessibilityNodeInfoList:Ljava/util/ArrayList;

    .line 126
    .local v4, infos:Ljava/util/List;,"Ljava/util/List<Landroid/view/accessibility/AccessibilityNodeInfo;>;"
    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 128
    :try_start_0
    iget-object v9, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v9, v9, Landroid/view/ViewRootImpl;->mView:Landroid/view/View;

    if-eqz v9, :cond_0

    iget-object v9, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v9, v9, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v9, :cond_1

    .line 144
    :cond_0
    :try_start_1
    iget-object v8, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v8, v8, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    const/4 v9, 0x0

    iput-boolean v9, v8, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 145
    invoke-direct {p0, v4}, Landroid/view/AccessibilityInteractionController;->applyApplicationScaleIfNeeded(Ljava/util/List;)V

    .line 146
    invoke-interface {v2, v4, v5}, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;->setFindAccessibilityNodeInfosResult(Ljava/util/List;I)V

    .line 147
    invoke-interface {v4}, Ljava/util/List;->clear()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 152
    :goto_0
    return-void

    .line 131
    :cond_1
    :try_start_2
    iget-object v9, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v9, v9, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    and-int/lit8 v10, v3, 0x8

    if-eqz v10, :cond_2

    const/4 v8, 0x1

    :cond_2
    iput-boolean v8, v9, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 133
    const/4 v6, 0x0

    .line 134
    .local v6, root:Landroid/view/View;
    const/4 v8, -0x1

    if-ne v0, v8, :cond_4

    .line 135
    iget-object v8, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v6, v8, Landroid/view/ViewRootImpl;->mView:Landroid/view/View;

    .line 139
    :goto_1
    if-eqz v6, :cond_3

    invoke-direct {p0, v6}, Landroid/view/AccessibilityInteractionController;->isShown(Landroid/view/View;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 140
    iget-object v8, p0, Landroid/view/AccessibilityInteractionController;->mPrefetcher:Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;

    invoke-virtual {v8, v6, v7, v3, v4}, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;->prefetchAccessibilityNodeInfos(Landroid/view/View;IILjava/util/List;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 144
    :cond_3
    :try_start_3
    iget-object v8, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v8, v8, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    const/4 v9, 0x0

    iput-boolean v9, v8, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 145
    invoke-direct {p0, v4}, Landroid/view/AccessibilityInteractionController;->applyApplicationScaleIfNeeded(Ljava/util/List;)V

    .line 146
    invoke-interface {v2, v4, v5}, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;->setFindAccessibilityNodeInfosResult(Ljava/util/List;I)V

    .line 147
    invoke-interface {v4}, Ljava/util/List;->clear()V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 148
    .end local v6           #root:Landroid/view/View;
    :catch_0
    move-exception v8

    goto :goto_0

    .line 137
    .restart local v6       #root:Landroid/view/View;
    :cond_4
    :try_start_4
    invoke-direct {p0, v0}, Landroid/view/AccessibilityInteractionController;->findViewByAccessibilityId(I)Landroid/view/View;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v6

    goto :goto_1

    .line 143
    .end local v6           #root:Landroid/view/View;
    :catchall_0
    move-exception v8

    .line 144
    :try_start_5
    iget-object v9, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v9, v9, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    const/4 v10, 0x0

    iput-boolean v10, v9, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 145
    invoke-direct {p0, v4}, Landroid/view/AccessibilityInteractionController;->applyApplicationScaleIfNeeded(Ljava/util/List;)V

    .line 146
    invoke-interface {v2, v4, v5}, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;->setFindAccessibilityNodeInfosResult(Ljava/util/List;I)V

    .line 147
    invoke-interface {v4}, Ljava/util/List;->clear()V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_1

    .line 143
    :goto_2
    throw v8

    .line 148
    :catch_1
    move-exception v9

    goto :goto_2
.end method

.method private findAccessibilityNodeInfoByViewIdUiThread(Landroid/os/Message;)V
    .locals 12
    .parameter "message"

    .prologue
    const/4 v9, 0x0

    .line 182
    iget v3, p1, Landroid/os/Message;->arg1:I

    .line 183
    .local v3, flags:I
    iget v0, p1, Landroid/os/Message;->arg2:I

    .line 185
    .local v0, accessibilityViewId:I
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/android/internal/os/SomeArgs;

    .line 186
    .local v1, args:Lcom/android/internal/os/SomeArgs;
    iget v8, v1, Lcom/android/internal/os/SomeArgs;->argi1:I

    .line 187
    .local v8, viewId:I
    iget v5, v1, Lcom/android/internal/os/SomeArgs;->argi2:I

    .line 188
    .local v5, interactionId:I
    iget-object v2, v1, Lcom/android/internal/os/SomeArgs;->arg1:Ljava/lang/Object;

    check-cast v2, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;

    .line 191
    .local v2, callback:Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;
    invoke-virtual {v1}, Lcom/android/internal/os/SomeArgs;->recycle()V

    .line 193
    const/4 v4, 0x0

    .line 195
    .local v4, info:Landroid/view/accessibility/AccessibilityNodeInfo;
    :try_start_0
    iget-object v10, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v10, v10, Landroid/view/ViewRootImpl;->mView:Landroid/view/View;

    if-eqz v10, :cond_0

    iget-object v10, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v10, v10, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v10, :cond_1

    .line 214
    :cond_0
    :try_start_1
    iget-object v9, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v9, v9, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    const/4 v10, 0x0

    iput-boolean v10, v9, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 215
    invoke-direct {p0, v4}, Landroid/view/AccessibilityInteractionController;->applyApplicationScaleIfNeeded(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 216
    invoke-interface {v2, v4, v5}, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;->setFindAccessibilityNodeInfoResult(Landroid/view/accessibility/AccessibilityNodeInfo;I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 221
    :goto_0
    return-void

    .line 198
    :cond_1
    :try_start_2
    iget-object v10, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v10, v10, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    and-int/lit8 v11, v3, 0x8

    if-eqz v11, :cond_2

    const/4 v9, 0x1

    :cond_2
    iput-boolean v9, v10, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 200
    const/4 v6, 0x0

    .line 201
    .local v6, root:Landroid/view/View;
    const/4 v9, -0x1

    if-eq v0, v9, :cond_4

    .line 202
    invoke-direct {p0, v0}, Landroid/view/AccessibilityInteractionController;->findViewByAccessibilityId(I)Landroid/view/View;

    move-result-object v6

    .line 206
    :goto_1
    if-eqz v6, :cond_3

    .line 207
    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .line 208
    .local v7, target:Landroid/view/View;
    if-eqz v7, :cond_3

    invoke-direct {p0, v7}, Landroid/view/AccessibilityInteractionController;->isShown(Landroid/view/View;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 209
    invoke-virtual {v7}, Landroid/view/View;->createAccessibilityNodeInfo()Landroid/view/accessibility/AccessibilityNodeInfo;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v4

    .line 214
    .end local v7           #target:Landroid/view/View;
    :cond_3
    :try_start_3
    iget-object v9, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v9, v9, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    const/4 v10, 0x0

    iput-boolean v10, v9, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 215
    invoke-direct {p0, v4}, Landroid/view/AccessibilityInteractionController;->applyApplicationScaleIfNeeded(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 216
    invoke-interface {v2, v4, v5}, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;->setFindAccessibilityNodeInfoResult(Landroid/view/accessibility/AccessibilityNodeInfo;I)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 217
    .end local v6           #root:Landroid/view/View;
    :catch_0
    move-exception v9

    goto :goto_0

    .line 204
    .restart local v6       #root:Landroid/view/View;
    :cond_4
    :try_start_4
    iget-object v9, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v6, v9, Landroid/view/ViewRootImpl;->mView:Landroid/view/View;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 213
    .end local v6           #root:Landroid/view/View;
    :catchall_0
    move-exception v9

    .line 214
    :try_start_5
    iget-object v10, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v10, v10, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    const/4 v11, 0x0

    iput-boolean v11, v10, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 215
    invoke-direct {p0, v4}, Landroid/view/AccessibilityInteractionController;->applyApplicationScaleIfNeeded(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 216
    invoke-interface {v2, v4, v5}, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;->setFindAccessibilityNodeInfoResult(Landroid/view/accessibility/AccessibilityNodeInfo;I)V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_1

    .line 213
    :goto_2
    throw v9

    .line 217
    :catch_1
    move-exception v10

    goto :goto_2
.end method

.method private findAccessibilityNodeInfosByTextUiThread(Landroid/os/Message;)V
    .locals 20
    .parameter "message"

    .prologue
    .line 252
    move-object/from16 v0, p1

    iget v5, v0, Landroid/os/Message;->arg1:I

    .line 254
    .local v5, flags:I
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Lcom/android/internal/os/SomeArgs;

    .line 255
    .local v3, args:Lcom/android/internal/os/SomeArgs;
    iget-object v14, v3, Lcom/android/internal/os/SomeArgs;->arg1:Ljava/lang/Object;

    check-cast v14, Ljava/lang/String;

    .line 256
    .local v14, text:Ljava/lang/String;
    iget-object v4, v3, Lcom/android/internal/os/SomeArgs;->arg2:Ljava/lang/Object;

    check-cast v4, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;

    .line 258
    .local v4, callback:Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;
    iget v2, v3, Lcom/android/internal/os/SomeArgs;->argi1:I

    .line 259
    .local v2, accessibilityViewId:I
    iget v0, v3, Lcom/android/internal/os/SomeArgs;->argi2:I

    move/from16 v16, v0

    .line 260
    .local v16, virtualDescendantId:I
    iget v11, v3, Lcom/android/internal/os/SomeArgs;->argi3:I

    .line 261
    .local v11, interactionId:I
    invoke-virtual {v3}, Lcom/android/internal/os/SomeArgs;->recycle()V

    .line 263
    const/4 v9, 0x0

    .line 265
    .local v9, infos:Ljava/util/List;,"Ljava/util/List<Landroid/view/accessibility/AccessibilityNodeInfo;>;"
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/view/ViewRootImpl;->mView:Landroid/view/View;

    move-object/from16 v17, v0

    if-eqz v17, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    move-object/from16 v17, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v17, :cond_1

    .line 312
    :cond_0
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, v17

    iput-boolean v0, v1, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 313
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Landroid/view/AccessibilityInteractionController;->applyApplicationScaleIfNeeded(Ljava/util/List;)V

    .line 314
    invoke-interface {v4, v9, v11}, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;->setFindAccessibilityNodeInfosResult(Ljava/util/List;I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 319
    :goto_0
    return-void

    .line 268
    :cond_1
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    move-object/from16 v18, v0

    and-int/lit8 v17, v5, 0x8

    if-eqz v17, :cond_3

    const/16 v17, 0x1

    :goto_1
    move/from16 v0, v17

    move-object/from16 v1, v18

    iput-boolean v0, v1, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 270
    const/4 v13, 0x0

    .line 271
    .local v13, root:Landroid/view/View;
    const/16 v17, -0x1

    move/from16 v0, v17

    if-eq v2, v0, :cond_4

    .line 272
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Landroid/view/AccessibilityInteractionController;->findViewByAccessibilityId(I)Landroid/view/View;

    move-result-object v13

    .line 276
    :goto_2
    if-eqz v13, :cond_2

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Landroid/view/AccessibilityInteractionController;->isShown(Landroid/view/View;)Z

    move-result v17

    if-eqz v17, :cond_2

    .line 277
    invoke-virtual {v13}, Landroid/view/View;->getAccessibilityNodeProvider()Landroid/view/accessibility/AccessibilityNodeProvider;

    move-result-object v12

    .line 278
    .local v12, provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    if-eqz v12, :cond_5

    .line 279
    move/from16 v0, v16

    invoke-virtual {v12, v14, v0}, Landroid/view/accessibility/AccessibilityNodeProvider;->findAccessibilityNodeInfosByText(Ljava/lang/String;I)Ljava/util/List;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v9

    .line 312
    .end local v12           #provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    :cond_2
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, v17

    iput-boolean v0, v1, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 313
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Landroid/view/AccessibilityInteractionController;->applyApplicationScaleIfNeeded(Ljava/util/List;)V

    .line 314
    invoke-interface {v4, v9, v11}, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;->setFindAccessibilityNodeInfosResult(Ljava/util/List;I)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 315
    .end local v13           #root:Landroid/view/View;
    :catch_0
    move-exception v17

    goto :goto_0

    .line 268
    :cond_3
    const/16 v17, 0x0

    goto :goto_1

    .line 274
    .restart local v13       #root:Landroid/view/View;
    :cond_4
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v13, v0, Landroid/view/ViewRootImpl;->mView:Landroid/view/View;

    goto :goto_2

    .line 281
    .restart local v12       #provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    :cond_5
    const/16 v17, -0x1

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_2

    .line 282
    move-object/from16 v0, p0

    iget-object v7, v0, Landroid/view/AccessibilityInteractionController;->mTempArrayList:Ljava/util/ArrayList;

    .line 283
    .local v7, foundViews:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    .line 284
    const/16 v17, 0x7

    move/from16 v0, v17

    invoke-virtual {v13, v7, v14, v0}, Landroid/view/View;->findViewsWithText(Ljava/util/ArrayList;Ljava/lang/CharSequence;I)V

    .line 287
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v17

    if-nez v17, :cond_2

    .line 288
    move-object/from16 v0, p0

    iget-object v9, v0, Landroid/view/AccessibilityInteractionController;->mTempAccessibilityNodeInfoList:Ljava/util/ArrayList;

    .line 289
    invoke-interface {v9}, Ljava/util/List;->clear()V

    .line 290
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v15

    .line 291
    .local v15, viewCount:I
    const/4 v8, 0x0

    .local v8, i:I
    :goto_3
    if-ge v8, v15, :cond_2

    .line 292
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/View;

    .line 293
    .local v6, foundView:Landroid/view/View;
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Landroid/view/AccessibilityInteractionController;->isShown(Landroid/view/View;)Z

    move-result v17

    if-eqz v17, :cond_6

    .line 294
    invoke-virtual {v6}, Landroid/view/View;->getAccessibilityNodeProvider()Landroid/view/accessibility/AccessibilityNodeProvider;

    move-result-object v12

    .line 295
    if-eqz v12, :cond_7

    .line 296
    const/16 v17, -0x1

    move/from16 v0, v17

    invoke-virtual {v12, v14, v0}, Landroid/view/accessibility/AccessibilityNodeProvider;->findAccessibilityNodeInfosByText(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v10

    .line 299
    .local v10, infosFromProvider:Ljava/util/List;,"Ljava/util/List<Landroid/view/accessibility/AccessibilityNodeInfo;>;"
    if-eqz v10, :cond_6

    .line 300
    invoke-interface {v9, v10}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 291
    .end local v10           #infosFromProvider:Ljava/util/List;,"Ljava/util/List<Landroid/view/accessibility/AccessibilityNodeInfo;>;"
    :cond_6
    :goto_4
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 303
    :cond_7
    invoke-virtual {v6}, Landroid/view/View;->createAccessibilityNodeInfo()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_4

    .line 311
    .end local v6           #foundView:Landroid/view/View;
    .end local v7           #foundViews:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v8           #i:I
    .end local v12           #provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    .end local v13           #root:Landroid/view/View;
    .end local v15           #viewCount:I
    :catchall_0
    move-exception v17

    .line 312
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput-boolean v0, v1, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 313
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Landroid/view/AccessibilityInteractionController;->applyApplicationScaleIfNeeded(Ljava/util/List;)V

    .line 314
    invoke-interface {v4, v9, v11}, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;->setFindAccessibilityNodeInfosResult(Ljava/util/List;I)V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_1

    .line 311
    :goto_5
    throw v17

    .line 315
    :catch_1
    move-exception v18

    goto :goto_5
.end method

.method private findFocusUiThread(Landroid/os/Message;)V
    .locals 16
    .parameter "message"

    .prologue
    .line 350
    move-object/from16 v0, p1

    iget v4, v0, Landroid/os/Message;->arg1:I

    .line 351
    .local v4, flags:I
    move-object/from16 v0, p1

    iget v5, v0, Landroid/os/Message;->arg2:I

    .line 353
    .local v5, focusType:I
    move-object/from16 v0, p1

    iget-object v2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Lcom/android/internal/os/SomeArgs;

    .line 354
    .local v2, args:Lcom/android/internal/os/SomeArgs;
    iget v8, v2, Lcom/android/internal/os/SomeArgs;->argi1:I

    .line 355
    .local v8, interactionId:I
    iget v1, v2, Lcom/android/internal/os/SomeArgs;->argi2:I

    .line 356
    .local v1, accessibilityViewId:I
    iget v12, v2, Lcom/android/internal/os/SomeArgs;->argi3:I

    .line 357
    .local v12, virtualDescendantId:I
    iget-object v3, v2, Lcom/android/internal/os/SomeArgs;->arg1:Ljava/lang/Object;

    check-cast v3, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;

    .line 360
    .local v3, callback:Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;
    invoke-virtual {v2}, Lcom/android/internal/os/SomeArgs;->recycle()V

    .line 362
    const/4 v6, 0x0

    .line 364
    .local v6, focused:Landroid/view/accessibility/AccessibilityNodeInfo;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v13, v13, Landroid/view/ViewRootImpl;->mView:Landroid/view/View;

    if-eqz v13, :cond_0

    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v13, v13, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v13, :cond_1

    .line 409
    :cond_0
    :try_start_1
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v13, v13, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    const/4 v14, 0x0

    iput-boolean v14, v13, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 410
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Landroid/view/AccessibilityInteractionController;->applyApplicationScaleIfNeeded(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 411
    invoke-interface {v3, v6, v8}, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;->setFindAccessibilityNodeInfoResult(Landroid/view/accessibility/AccessibilityNodeInfo;I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 416
    :goto_0
    return-void

    .line 367
    :cond_1
    :try_start_2
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v14, v13, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    and-int/lit8 v13, v4, 0x8

    if-eqz v13, :cond_2

    const/4 v13, 0x1

    :goto_1
    iput-boolean v13, v14, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 369
    const/4 v10, 0x0

    .line 370
    .local v10, root:Landroid/view/View;
    const/4 v13, -0x1

    if-eq v1, v13, :cond_3

    .line 371
    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Landroid/view/AccessibilityInteractionController;->findViewByAccessibilityId(I)Landroid/view/View;

    move-result-object v10

    .line 375
    :goto_2
    if-eqz v10, :cond_4

    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Landroid/view/AccessibilityInteractionController;->isShown(Landroid/view/View;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 376
    packed-switch v5, :pswitch_data_0

    .line 404
    new-instance v13, Ljava/lang/IllegalArgumentException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Unknown focus type: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v13
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 408
    .end local v10           #root:Landroid/view/View;
    :catchall_0
    move-exception v13

    .line 409
    :try_start_3
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v14, v14, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    const/4 v15, 0x0

    iput-boolean v15, v14, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 410
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Landroid/view/AccessibilityInteractionController;->applyApplicationScaleIfNeeded(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 411
    invoke-interface {v3, v6, v8}, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;->setFindAccessibilityNodeInfoResult(Landroid/view/accessibility/AccessibilityNodeInfo;I)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_1

    .line 408
    :goto_3
    throw v13

    .line 367
    :cond_2
    const/4 v13, 0x0

    goto :goto_1

    .line 373
    .restart local v10       #root:Landroid/view/View;
    :cond_3
    :try_start_4
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v10, v13, Landroid/view/ViewRootImpl;->mView:Landroid/view/View;

    goto :goto_2

    .line 378
    :pswitch_0
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v7, v13, Landroid/view/ViewRootImpl;->mAccessibilityFocusedHost:Landroid/view/View;

    .line 381
    .local v7, host:Landroid/view/View;
    if-eqz v7, :cond_4

    invoke-static {v7, v10}, Landroid/view/ViewRootImpl;->isViewDescendantOf(Landroid/view/View;Landroid/view/View;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result v13

    if-nez v13, :cond_5

    .line 409
    .end local v7           #host:Landroid/view/View;
    :cond_4
    :goto_4
    :try_start_5
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v13, v13, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    const/4 v14, 0x0

    iput-boolean v14, v13, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 410
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Landroid/view/AccessibilityInteractionController;->applyApplicationScaleIfNeeded(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 411
    invoke-interface {v3, v6, v8}, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;->setFindAccessibilityNodeInfoResult(Landroid/view/accessibility/AccessibilityNodeInfo;I)V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_0

    .line 412
    .end local v10           #root:Landroid/view/View;
    :catch_0
    move-exception v13

    goto :goto_0

    .line 386
    .restart local v7       #host:Landroid/view/View;
    .restart local v10       #root:Landroid/view/View;
    :cond_5
    :try_start_6
    invoke-virtual {v7}, Landroid/view/View;->getAccessibilityNodeProvider()Landroid/view/accessibility/AccessibilityNodeProvider;

    move-result-object v9

    .line 387
    .local v9, provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    if-eqz v9, :cond_6

    .line 388
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v13, v13, Landroid/view/ViewRootImpl;->mAccessibilityFocusedVirtualView:Landroid/view/accessibility/AccessibilityNodeInfo;

    if-eqz v13, :cond_4

    .line 389
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v13, v13, Landroid/view/ViewRootImpl;->mAccessibilityFocusedVirtualView:Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-static {v13}, Landroid/view/accessibility/AccessibilityNodeInfo;->obtain(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v6

    goto :goto_4

    .line 392
    :cond_6
    const/4 v13, -0x1

    if-ne v12, v13, :cond_4

    .line 393
    invoke-virtual {v7}, Landroid/view/View;->createAccessibilityNodeInfo()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v6

    goto :goto_4

    .line 398
    .end local v7           #host:Landroid/view/View;
    .end local v9           #provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    :pswitch_1
    invoke-virtual {v10}, Landroid/view/View;->findFocus()Landroid/view/View;

    move-result-object v11

    .line 399
    .local v11, target:Landroid/view/View;
    if-eqz v11, :cond_4

    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Landroid/view/AccessibilityInteractionController;->isShown(Landroid/view/View;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 400
    invoke-virtual {v11}, Landroid/view/View;->createAccessibilityNodeInfo()Landroid/view/accessibility/AccessibilityNodeInfo;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result-object v6

    goto :goto_4

    .line 412
    .end local v10           #root:Landroid/view/View;
    .end local v11           #target:Landroid/view/View;
    :catch_1
    move-exception v14

    goto :goto_3

    .line 376
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private findViewByAccessibilityId(I)Landroid/view/View;
    .locals 4
    .parameter "accessibilityId"

    .prologue
    const/4 v2, 0x0

    .line 564
    iget-object v3, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v1, v3, Landroid/view/ViewRootImpl;->mView:Landroid/view/View;

    .line 565
    .local v1, root:Landroid/view/View;
    if-nez v1, :cond_1

    move-object v0, v2

    .line 572
    :cond_0
    :goto_0
    return-object v0

    .line 568
    :cond_1
    invoke-virtual {v1, p1}, Landroid/view/View;->findViewByAccessibilityId(I)Landroid/view/View;

    move-result-object v0

    .line 569
    .local v0, foundView:Landroid/view/View;
    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Landroid/view/AccessibilityInteractionController;->isShown(Landroid/view/View;)Z

    move-result v3

    if-nez v3, :cond_0

    move-object v0, v2

    .line 570
    goto :goto_0
.end method

.method private focusSearchUiThread(Landroid/os/Message;)V
    .locals 12
    .parameter "message"

    .prologue
    const/4 v9, 0x0

    .line 446
    iget v4, p1, Landroid/os/Message;->arg1:I

    .line 447
    .local v4, flags:I
    iget v0, p1, Landroid/os/Message;->arg2:I

    .line 449
    .local v0, accessibilityViewId:I
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/android/internal/os/SomeArgs;

    .line 450
    .local v1, args:Lcom/android/internal/os/SomeArgs;
    iget v3, v1, Lcom/android/internal/os/SomeArgs;->argi2:I

    .line 451
    .local v3, direction:I
    iget v5, v1, Lcom/android/internal/os/SomeArgs;->argi3:I

    .line 452
    .local v5, interactionId:I
    iget-object v2, v1, Lcom/android/internal/os/SomeArgs;->arg1:Ljava/lang/Object;

    check-cast v2, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;

    .line 455
    .local v2, callback:Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;
    invoke-virtual {v1}, Lcom/android/internal/os/SomeArgs;->recycle()V

    .line 457
    const/4 v6, 0x0

    .line 459
    .local v6, next:Landroid/view/accessibility/AccessibilityNodeInfo;
    :try_start_0
    iget-object v10, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v10, v10, Landroid/view/ViewRootImpl;->mView:Landroid/view/View;

    if-eqz v10, :cond_0

    iget-object v10, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v10, v10, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v10, :cond_1

    .line 478
    :cond_0
    :try_start_1
    iget-object v9, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v9, v9, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    const/4 v10, 0x0

    iput-boolean v10, v9, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 479
    invoke-direct {p0, v6}, Landroid/view/AccessibilityInteractionController;->applyApplicationScaleIfNeeded(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 480
    invoke-interface {v2, v6, v5}, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;->setFindAccessibilityNodeInfoResult(Landroid/view/accessibility/AccessibilityNodeInfo;I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 485
    :goto_0
    return-void

    .line 462
    :cond_1
    :try_start_2
    iget-object v10, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v10, v10, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    and-int/lit8 v11, v4, 0x8

    if-eqz v11, :cond_2

    const/4 v9, 0x1

    :cond_2
    iput-boolean v9, v10, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 464
    const/4 v8, 0x0

    .line 465
    .local v8, root:Landroid/view/View;
    const/4 v9, -0x1

    if-eq v0, v9, :cond_4

    .line 466
    invoke-direct {p0, v0}, Landroid/view/AccessibilityInteractionController;->findViewByAccessibilityId(I)Landroid/view/View;

    move-result-object v8

    .line 470
    :goto_1
    if-eqz v8, :cond_3

    invoke-direct {p0, v8}, Landroid/view/AccessibilityInteractionController;->isShown(Landroid/view/View;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 471
    invoke-virtual {v8, v3}, Landroid/view/View;->focusSearch(I)Landroid/view/View;

    move-result-object v7

    .line 472
    .local v7, nextView:Landroid/view/View;
    if-eqz v7, :cond_3

    .line 473
    invoke-virtual {v7}, Landroid/view/View;->createAccessibilityNodeInfo()Landroid/view/accessibility/AccessibilityNodeInfo;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v6

    .line 478
    .end local v7           #nextView:Landroid/view/View;
    :cond_3
    :try_start_3
    iget-object v9, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v9, v9, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    const/4 v10, 0x0

    iput-boolean v10, v9, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 479
    invoke-direct {p0, v6}, Landroid/view/AccessibilityInteractionController;->applyApplicationScaleIfNeeded(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 480
    invoke-interface {v2, v6, v5}, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;->setFindAccessibilityNodeInfoResult(Landroid/view/accessibility/AccessibilityNodeInfo;I)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 481
    .end local v8           #root:Landroid/view/View;
    :catch_0
    move-exception v9

    goto :goto_0

    .line 468
    .restart local v8       #root:Landroid/view/View;
    :cond_4
    :try_start_4
    iget-object v9, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v8, v9, Landroid/view/ViewRootImpl;->mView:Landroid/view/View;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 477
    .end local v8           #root:Landroid/view/View;
    :catchall_0
    move-exception v9

    .line 478
    :try_start_5
    iget-object v10, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v10, v10, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    const/4 v11, 0x0

    iput-boolean v11, v10, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 479
    invoke-direct {p0, v6}, Landroid/view/AccessibilityInteractionController;->applyApplicationScaleIfNeeded(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 480
    invoke-interface {v2, v6, v5}, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;->setFindAccessibilityNodeInfoResult(Landroid/view/accessibility/AccessibilityNodeInfo;I)V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_1

    .line 477
    :goto_2
    throw v9

    .line 481
    :catch_1
    move-exception v10

    goto :goto_2
.end method

.method private isShown(Landroid/view/View;)Z
    .locals 1
    .parameter "view"

    .prologue
    .line 81
    iget-object v0, p1, Landroid/view/View;->mAttachInfo:Landroid/view/View$AttachInfo;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/view/View;->mAttachInfo:Landroid/view/View$AttachInfo;

    iget v0, v0, Landroid/view/View$AttachInfo;->mWindowVisibility:I

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private perfromAccessibilityActionUiThread(Landroid/os/Message;)V
    .locals 14
    .parameter "message"

    .prologue
    .line 518
    iget v5, p1, Landroid/os/Message;->arg1:I

    .line 519
    .local v5, flags:I
    iget v0, p1, Landroid/os/Message;->arg2:I

    .line 521
    .local v0, accessibilityViewId:I
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Lcom/android/internal/os/SomeArgs;

    .line 522
    .local v2, args:Lcom/android/internal/os/SomeArgs;
    iget v10, v2, Lcom/android/internal/os/SomeArgs;->argi1:I

    .line 523
    .local v10, virtualDescendantId:I
    iget v1, v2, Lcom/android/internal/os/SomeArgs;->argi2:I

    .line 524
    .local v1, action:I
    iget v6, v2, Lcom/android/internal/os/SomeArgs;->argi3:I

    .line 525
    .local v6, interactionId:I
    iget-object v4, v2, Lcom/android/internal/os/SomeArgs;->arg1:Ljava/lang/Object;

    check-cast v4, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;

    .line 527
    .local v4, callback:Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;
    iget-object v3, v2, Lcom/android/internal/os/SomeArgs;->arg2:Ljava/lang/Object;

    check-cast v3, Landroid/os/Bundle;

    .line 529
    .local v3, arguments:Landroid/os/Bundle;
    invoke-virtual {v2}, Lcom/android/internal/os/SomeArgs;->recycle()V

    .line 531
    const/4 v8, 0x0

    .line 533
    .local v8, succeeded:Z
    :try_start_0
    iget-object v11, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v11, v11, Landroid/view/ViewRootImpl;->mView:Landroid/view/View;

    if-eqz v11, :cond_0

    iget-object v11, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v11, v11, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v11, :cond_1

    .line 555
    :cond_0
    :try_start_1
    iget-object v11, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v11, v11, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    const/4 v12, 0x0

    iput-boolean v12, v11, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 556
    invoke-interface {v4, v8, v6}, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;->setPerformAccessibilityActionResult(ZI)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 561
    :goto_0
    return-void

    .line 536
    :cond_1
    :try_start_2
    iget-object v11, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v12, v11, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    and-int/lit8 v11, v5, 0x8

    if-eqz v11, :cond_3

    const/4 v11, 0x1

    :goto_1
    iput-boolean v11, v12, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 538
    const/4 v9, 0x0

    .line 539
    .local v9, target:Landroid/view/View;
    const/4 v11, -0x1

    if-eq v0, v11, :cond_4

    .line 540
    invoke-direct {p0, v0}, Landroid/view/AccessibilityInteractionController;->findViewByAccessibilityId(I)Landroid/view/View;

    move-result-object v9

    .line 544
    :goto_2
    if-eqz v9, :cond_2

    invoke-direct {p0, v9}, Landroid/view/AccessibilityInteractionController;->isShown(Landroid/view/View;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 545
    invoke-virtual {v9}, Landroid/view/View;->getAccessibilityNodeProvider()Landroid/view/accessibility/AccessibilityNodeProvider;

    move-result-object v7

    .line 546
    .local v7, provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    if-eqz v7, :cond_5

    .line 547
    invoke-virtual {v7, v10, v1, v3}, Landroid/view/accessibility/AccessibilityNodeProvider;->performAction(IILandroid/os/Bundle;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v8

    .line 555
    .end local v7           #provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    :cond_2
    :goto_3
    :try_start_3
    iget-object v11, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v11, v11, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    const/4 v12, 0x0

    iput-boolean v12, v11, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 556
    invoke-interface {v4, v8, v6}, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;->setPerformAccessibilityActionResult(ZI)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 557
    .end local v9           #target:Landroid/view/View;
    :catch_0
    move-exception v11

    goto :goto_0

    .line 536
    :cond_3
    const/4 v11, 0x0

    goto :goto_1

    .line 542
    .restart local v9       #target:Landroid/view/View;
    :cond_4
    :try_start_4
    iget-object v11, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v9, v11, Landroid/view/ViewRootImpl;->mView:Landroid/view/View;

    goto :goto_2

    .line 549
    .restart local v7       #provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    :cond_5
    const/4 v11, -0x1

    if-ne v10, v11, :cond_2

    .line 550
    invoke-virtual {v9, v1, v3}, Landroid/view/View;->performAccessibilityAction(ILandroid/os/Bundle;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result v8

    goto :goto_3

    .line 554
    .end local v7           #provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    .end local v9           #target:Landroid/view/View;
    :catchall_0
    move-exception v11

    .line 555
    :try_start_5
    iget-object v12, p0, Landroid/view/AccessibilityInteractionController;->mViewRootImpl:Landroid/view/ViewRootImpl;

    iget-object v12, v12, Landroid/view/ViewRootImpl;->mAttachInfo:Landroid/view/View$AttachInfo;

    const/4 v13, 0x0

    iput-boolean v13, v12, Landroid/view/View$AttachInfo;->mIncludeNotImportantViews:Z

    .line 556
    invoke-interface {v4, v8, v6}, Landroid/view/accessibility/IAccessibilityInteractionConnectionCallback;->setPerformAccessibilityActionResult(ZI)V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_1

    .line 554
    :goto_4
    throw v11

    .line 557
    :catch_1
    move-exception v12

    goto :goto_4
.end method


# virtual methods
.method public findAccessibilityNodeInfoByAccessibilityIdClientThread(JILandroid/view/accessibility/IAccessibilityInteractionConnectionCallback;IIJ)V
    .locals 4
    .parameter "accessibilityNodeId"
    .parameter "interactionId"
    .parameter "callback"
    .parameter "flags"
    .parameter "interrogatingPid"
    .parameter "interrogatingTid"

    .prologue
    .line 90
    iget-object v2, p0, Landroid/view/AccessibilityInteractionController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 91
    .local v1, message:Landroid/os/Message;
    const/4 v2, 0x2

    iput v2, v1, Landroid/os/Message;->what:I

    .line 92
    iput p5, v1, Landroid/os/Message;->arg1:I

    .line 94
    invoke-static {}, Lcom/android/internal/os/SomeArgs;->obtain()Lcom/android/internal/os/SomeArgs;

    move-result-object v0

    .line 95
    .local v0, args:Lcom/android/internal/os/SomeArgs;
    invoke-static {p1, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getAccessibilityViewId(J)I

    move-result v2

    iput v2, v0, Lcom/android/internal/os/SomeArgs;->argi1:I

    .line 96
    invoke-static {p1, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getVirtualDescendantId(J)I

    move-result v2

    iput v2, v0, Lcom/android/internal/os/SomeArgs;->argi2:I

    .line 97
    iput p3, v0, Lcom/android/internal/os/SomeArgs;->argi3:I

    .line 98
    iput-object p4, v0, Lcom/android/internal/os/SomeArgs;->arg1:Ljava/lang/Object;

    .line 99
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 105
    iget v2, p0, Landroid/view/AccessibilityInteractionController;->mMyProcessId:I

    if-ne p6, v2, :cond_0

    iget-wide v2, p0, Landroid/view/AccessibilityInteractionController;->mMyLooperThreadId:J

    cmp-long v2, p7, v2

    if-nez v2, :cond_0

    .line 106
    invoke-static {p7, p8}, Landroid/view/accessibility/AccessibilityInteractionClient;->getInstanceForThread(J)Landroid/view/accessibility/AccessibilityInteractionClient;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/accessibility/AccessibilityInteractionClient;->setSameThreadMessage(Landroid/os/Message;)V

    .line 111
    :goto_0
    return-void

    .line 109
    :cond_0
    iget-object v2, p0, Landroid/view/AccessibilityInteractionController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method

.method public findAccessibilityNodeInfoByViewIdClientThread(JIILandroid/view/accessibility/IAccessibilityInteractionConnectionCallback;IIJ)V
    .locals 4
    .parameter "accessibilityNodeId"
    .parameter "viewId"
    .parameter "interactionId"
    .parameter "callback"
    .parameter "flags"
    .parameter "interrogatingPid"
    .parameter "interrogatingTid"

    .prologue
    .line 157
    iget-object v2, p0, Landroid/view/AccessibilityInteractionController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 158
    .local v1, message:Landroid/os/Message;
    const/4 v2, 0x3

    iput v2, v1, Landroid/os/Message;->what:I

    .line 159
    iput p6, v1, Landroid/os/Message;->arg1:I

    .line 160
    invoke-static {p1, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getAccessibilityViewId(J)I

    move-result v2

    iput v2, v1, Landroid/os/Message;->arg2:I

    .line 162
    invoke-static {}, Lcom/android/internal/os/SomeArgs;->obtain()Lcom/android/internal/os/SomeArgs;

    move-result-object v0

    .line 163
    .local v0, args:Lcom/android/internal/os/SomeArgs;
    iput p3, v0, Lcom/android/internal/os/SomeArgs;->argi1:I

    .line 164
    iput p4, v0, Lcom/android/internal/os/SomeArgs;->argi2:I

    .line 165
    iput-object p5, v0, Lcom/android/internal/os/SomeArgs;->arg1:Ljava/lang/Object;

    .line 167
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 173
    iget v2, p0, Landroid/view/AccessibilityInteractionController;->mMyProcessId:I

    if-ne p7, v2, :cond_0

    iget-wide v2, p0, Landroid/view/AccessibilityInteractionController;->mMyLooperThreadId:J

    cmp-long v2, p8, v2

    if-nez v2, :cond_0

    .line 174
    invoke-static {p8, p9}, Landroid/view/accessibility/AccessibilityInteractionClient;->getInstanceForThread(J)Landroid/view/accessibility/AccessibilityInteractionClient;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/accessibility/AccessibilityInteractionClient;->setSameThreadMessage(Landroid/os/Message;)V

    .line 179
    :goto_0
    return-void

    .line 177
    :cond_0
    iget-object v2, p0, Landroid/view/AccessibilityInteractionController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method

.method public findAccessibilityNodeInfosByTextClientThread(JLjava/lang/String;ILandroid/view/accessibility/IAccessibilityInteractionConnectionCallback;IIJ)V
    .locals 4
    .parameter "accessibilityNodeId"
    .parameter "text"
    .parameter "interactionId"
    .parameter "callback"
    .parameter "flags"
    .parameter "interrogatingPid"
    .parameter "interrogatingTid"

    .prologue
    .line 226
    iget-object v2, p0, Landroid/view/AccessibilityInteractionController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 227
    .local v1, message:Landroid/os/Message;
    const/4 v2, 0x4

    iput v2, v1, Landroid/os/Message;->what:I

    .line 228
    iput p6, v1, Landroid/os/Message;->arg1:I

    .line 230
    invoke-static {}, Lcom/android/internal/os/SomeArgs;->obtain()Lcom/android/internal/os/SomeArgs;

    move-result-object v0

    .line 231
    .local v0, args:Lcom/android/internal/os/SomeArgs;
    iput-object p3, v0, Lcom/android/internal/os/SomeArgs;->arg1:Ljava/lang/Object;

    .line 232
    iput-object p5, v0, Lcom/android/internal/os/SomeArgs;->arg2:Ljava/lang/Object;

    .line 233
    invoke-static {p1, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getAccessibilityViewId(J)I

    move-result v2

    iput v2, v0, Lcom/android/internal/os/SomeArgs;->argi1:I

    .line 234
    invoke-static {p1, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getVirtualDescendantId(J)I

    move-result v2

    iput v2, v0, Lcom/android/internal/os/SomeArgs;->argi2:I

    .line 235
    iput p4, v0, Lcom/android/internal/os/SomeArgs;->argi3:I

    .line 237
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 243
    iget v2, p0, Landroid/view/AccessibilityInteractionController;->mMyProcessId:I

    if-ne p7, v2, :cond_0

    iget-wide v2, p0, Landroid/view/AccessibilityInteractionController;->mMyLooperThreadId:J

    cmp-long v2, p8, v2

    if-nez v2, :cond_0

    .line 244
    invoke-static {p8, p9}, Landroid/view/accessibility/AccessibilityInteractionClient;->getInstanceForThread(J)Landroid/view/accessibility/AccessibilityInteractionClient;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/accessibility/AccessibilityInteractionClient;->setSameThreadMessage(Landroid/os/Message;)V

    .line 249
    :goto_0
    return-void

    .line 247
    :cond_0
    iget-object v2, p0, Landroid/view/AccessibilityInteractionController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method

.method public findFocusClientThread(JIILandroid/view/accessibility/IAccessibilityInteractionConnectionCallback;IIJ)V
    .locals 4
    .parameter "accessibilityNodeId"
    .parameter "focusType"
    .parameter "interactionId"
    .parameter "callback"
    .parameter "flags"
    .parameter "interogatingPid"
    .parameter "interrogatingTid"

    .prologue
    .line 324
    iget-object v2, p0, Landroid/view/AccessibilityInteractionController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 325
    .local v1, message:Landroid/os/Message;
    const/4 v2, 0x5

    iput v2, v1, Landroid/os/Message;->what:I

    .line 326
    iput p6, v1, Landroid/os/Message;->arg1:I

    .line 327
    iput p3, v1, Landroid/os/Message;->arg2:I

    .line 329
    invoke-static {}, Lcom/android/internal/os/SomeArgs;->obtain()Lcom/android/internal/os/SomeArgs;

    move-result-object v0

    .line 330
    .local v0, args:Lcom/android/internal/os/SomeArgs;
    iput p4, v0, Lcom/android/internal/os/SomeArgs;->argi1:I

    .line 331
    invoke-static {p1, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getAccessibilityViewId(J)I

    move-result v2

    iput v2, v0, Lcom/android/internal/os/SomeArgs;->argi2:I

    .line 332
    invoke-static {p1, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getVirtualDescendantId(J)I

    move-result v2

    iput v2, v0, Lcom/android/internal/os/SomeArgs;->argi3:I

    .line 333
    iput-object p5, v0, Lcom/android/internal/os/SomeArgs;->arg1:Ljava/lang/Object;

    .line 335
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 341
    iget v2, p0, Landroid/view/AccessibilityInteractionController;->mMyProcessId:I

    if-ne p7, v2, :cond_0

    iget-wide v2, p0, Landroid/view/AccessibilityInteractionController;->mMyLooperThreadId:J

    cmp-long v2, p8, v2

    if-nez v2, :cond_0

    .line 342
    invoke-static {p8, p9}, Landroid/view/accessibility/AccessibilityInteractionClient;->getInstanceForThread(J)Landroid/view/accessibility/AccessibilityInteractionClient;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/accessibility/AccessibilityInteractionClient;->setSameThreadMessage(Landroid/os/Message;)V

    .line 347
    :goto_0
    return-void

    .line 345
    :cond_0
    iget-object v2, p0, Landroid/view/AccessibilityInteractionController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method

.method public focusSearchClientThread(JIILandroid/view/accessibility/IAccessibilityInteractionConnectionCallback;IIJ)V
    .locals 4
    .parameter "accessibilityNodeId"
    .parameter "direction"
    .parameter "interactionId"
    .parameter "callback"
    .parameter "flags"
    .parameter "interogatingPid"
    .parameter "interrogatingTid"

    .prologue
    .line 421
    iget-object v2, p0, Landroid/view/AccessibilityInteractionController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 422
    .local v1, message:Landroid/os/Message;
    const/4 v2, 0x6

    iput v2, v1, Landroid/os/Message;->what:I

    .line 423
    iput p6, v1, Landroid/os/Message;->arg1:I

    .line 424
    invoke-static {p1, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getAccessibilityViewId(J)I

    move-result v2

    iput v2, v1, Landroid/os/Message;->arg2:I

    .line 426
    invoke-static {}, Lcom/android/internal/os/SomeArgs;->obtain()Lcom/android/internal/os/SomeArgs;

    move-result-object v0

    .line 427
    .local v0, args:Lcom/android/internal/os/SomeArgs;
    iput p3, v0, Lcom/android/internal/os/SomeArgs;->argi2:I

    .line 428
    iput p4, v0, Lcom/android/internal/os/SomeArgs;->argi3:I

    .line 429
    iput-object p5, v0, Lcom/android/internal/os/SomeArgs;->arg1:Ljava/lang/Object;

    .line 431
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 437
    iget v2, p0, Landroid/view/AccessibilityInteractionController;->mMyProcessId:I

    if-ne p7, v2, :cond_0

    iget-wide v2, p0, Landroid/view/AccessibilityInteractionController;->mMyLooperThreadId:J

    cmp-long v2, p8, v2

    if-nez v2, :cond_0

    .line 438
    invoke-static {p8, p9}, Landroid/view/accessibility/AccessibilityInteractionClient;->getInstanceForThread(J)Landroid/view/accessibility/AccessibilityInteractionClient;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/accessibility/AccessibilityInteractionClient;->setSameThreadMessage(Landroid/os/Message;)V

    .line 443
    :goto_0
    return-void

    .line 441
    :cond_0
    iget-object v2, p0, Landroid/view/AccessibilityInteractionController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method

.method public performAccessibilityActionClientThread(JILandroid/os/Bundle;ILandroid/view/accessibility/IAccessibilityInteractionConnectionCallback;IIJ)V
    .locals 4
    .parameter "accessibilityNodeId"
    .parameter "action"
    .parameter "arguments"
    .parameter "interactionId"
    .parameter "callback"
    .parameter "flags"
    .parameter "interogatingPid"
    .parameter "interrogatingTid"

    .prologue
    .line 491
    iget-object v2, p0, Landroid/view/AccessibilityInteractionController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 492
    .local v1, message:Landroid/os/Message;
    const/4 v2, 0x1

    iput v2, v1, Landroid/os/Message;->what:I

    .line 493
    iput p7, v1, Landroid/os/Message;->arg1:I

    .line 494
    invoke-static {p1, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getAccessibilityViewId(J)I

    move-result v2

    iput v2, v1, Landroid/os/Message;->arg2:I

    .line 496
    invoke-static {}, Lcom/android/internal/os/SomeArgs;->obtain()Lcom/android/internal/os/SomeArgs;

    move-result-object v0

    .line 497
    .local v0, args:Lcom/android/internal/os/SomeArgs;
    invoke-static {p1, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getVirtualDescendantId(J)I

    move-result v2

    iput v2, v0, Lcom/android/internal/os/SomeArgs;->argi1:I

    .line 498
    iput p3, v0, Lcom/android/internal/os/SomeArgs;->argi2:I

    .line 499
    iput p5, v0, Lcom/android/internal/os/SomeArgs;->argi3:I

    .line 500
    iput-object p6, v0, Lcom/android/internal/os/SomeArgs;->arg1:Ljava/lang/Object;

    .line 501
    iput-object p4, v0, Lcom/android/internal/os/SomeArgs;->arg2:Ljava/lang/Object;

    .line 503
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 509
    iget v2, p0, Landroid/view/AccessibilityInteractionController;->mMyProcessId:I

    if-ne p8, v2, :cond_0

    iget-wide v2, p0, Landroid/view/AccessibilityInteractionController;->mMyLooperThreadId:J

    cmp-long v2, p9, v2

    if-nez v2, :cond_0

    .line 510
    invoke-static {p9, p10}, Landroid/view/accessibility/AccessibilityInteractionClient;->getInstanceForThread(J)Landroid/view/accessibility/AccessibilityInteractionClient;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/accessibility/AccessibilityInteractionClient;->setSameThreadMessage(Landroid/os/Message;)V

    .line 515
    :goto_0
    return-void

    .line 513
    :cond_0
    iget-object v2, p0, Landroid/view/AccessibilityInteractionController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method
