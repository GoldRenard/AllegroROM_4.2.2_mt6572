.class Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;
.super Ljava/lang/Object;
.source "AppsCustomizeTabHost.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->onTabChanged(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

.field final synthetic val$duration:I

.field final synthetic val$type:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;I)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 232
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->val$type:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    iput p3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->val$duration:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .prologue
    .line 235
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$200(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    move-result-object v8

    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getMeasuredWidth()I

    move-result v8

    if-lez v8, :cond_0

    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$200(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    move-result-object v8

    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getMeasuredHeight()I

    move-result v8

    if-gtz v8, :cond_1

    .line 237
    :cond_0
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #calls: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->reloadCurrentPage()V
    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$300(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)V

    .line 313
    :goto_0
    return-void

    .line 242
    :cond_1
    const/4 v8, 0x2

    new-array v6, v8, [I

    .line 243
    .local v6, visiblePageRange:[I
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$200(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    move-result-object v8

    invoke-virtual {v8, v6}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getVisiblePages([I)V

    .line 244
    const/4 v8, 0x0

    aget v8, v6, v8

    const/4 v9, -0x1

    if-ne v8, v9, :cond_2

    const/4 v8, 0x1

    aget v8, v6, v8

    const/4 v9, -0x1

    if-ne v8, v9, :cond_2

    .line 246
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #calls: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->reloadCurrentPage()V
    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$300(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)V

    goto :goto_0

    .line 249
    :cond_2
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 250
    .local v7, visiblePages:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    const/4 v8, 0x0

    aget v2, v6, v8

    .local v2, i:I
    :goto_1
    const/4 v8, 0x1

    aget v8, v6, v8

    if-gt v2, v8, :cond_3

    .line 251
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$200(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    move-result-object v8

    invoke-virtual {v8, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 250
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 257
    :cond_3
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAnimationBuffer:Landroid/widget/FrameLayout;
    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$400(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Landroid/widget/FrameLayout;

    move-result-object v8

    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
    invoke-static {v9}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$200(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    move-result-object v9

    invoke-virtual {v9}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getScrollX()I

    move-result v9

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Landroid/widget/FrameLayout;->scrollTo(II)V

    .line 261
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v8

    add-int/lit8 v2, v8, -0x1

    :goto_2
    if-ltz v2, :cond_6

    .line 262
    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 263
    .local v1, child:Landroid/view/View;
    instance-of v8, v1, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    if-eqz v8, :cond_5

    move-object v8, v1

    .line 264
    check-cast v8, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->resetChildrenOnKeyListeners()V

    .line 268
    :cond_4
    :goto_3
    const/4 v8, 0x0

    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->setDeletePreviewsWhenDetachedFromWindow(Z)V

    .line 269
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$200(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    move-result-object v8

    invoke-virtual {v8, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->removeView(Landroid/view/View;)V

    .line 270
    const/4 v8, 0x1

    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->setDeletePreviewsWhenDetachedFromWindow(Z)V

    .line 271
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAnimationBuffer:Landroid/widget/FrameLayout;
    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$400(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Landroid/widget/FrameLayout;

    move-result-object v8

    const/high16 v9, 0x3f80

    invoke-virtual {v8, v9}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 272
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAnimationBuffer:Landroid/widget/FrameLayout;
    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$400(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Landroid/widget/FrameLayout;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 273
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    invoke-direct {v5, v8, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 275
    .local v5, p:Landroid/widget/FrameLayout$LayoutParams;
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v8

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v9

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {v5, v8, v9, v10, v11}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 276
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAnimationBuffer:Landroid/widget/FrameLayout;
    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$400(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Landroid/widget/FrameLayout;

    move-result-object v8

    invoke-virtual {v8, v1, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 261
    add-int/lit8 v2, v2, -0x1

    goto :goto_2

    .line 265
    .end local v5           #p:Landroid/widget/FrameLayout$LayoutParams;
    :cond_5
    instance-of v8, v1, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

    if-eqz v8, :cond_4

    move-object v8, v1

    .line 266
    check-cast v8, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->resetChildrenOnKeyListeners()V

    goto :goto_3

    .line 280
    .end local v1           #child:Landroid/view/View;
    :cond_6
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #calls: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->onTabChangedStart()V
    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$500(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)V

    .line 281
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->val$type:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    #calls: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->onTabChangedEnd(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)V
    invoke-static {v8, v9}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$600(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)V

    .line 284
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAnimationBuffer:Landroid/widget/FrameLayout;
    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$400(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Landroid/widget/FrameLayout;

    move-result-object v8

    const-string v9, "alpha"

    const/4 v10, 0x1

    new-array v10, v10, [F

    const/4 v11, 0x0

    const/4 v12, 0x0

    aput v12, v10, v11

    invoke-static {v8, v9, v10}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 285
    .local v4, outAnim:Landroid/animation/ObjectAnimator;
    new-instance v8, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$1;

    invoke-direct {v8, p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$1;-><init>(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;)V

    invoke-virtual {v4, v8}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 297
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$200(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    move-result-object v8

    const-string v9, "alpha"

    const/4 v10, 0x1

    new-array v10, v10, [F

    const/4 v11, 0x0

    const/high16 v12, 0x3f80

    aput v12, v10, v11

    invoke-static {v8, v9, v10}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    .line 298
    .local v3, inAnim:Landroid/animation/ObjectAnimator;
    new-instance v8, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$2;

    invoke-direct {v8, p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$2;-><init>(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;)V

    invoke-virtual {v3, v8}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 305
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v0

    .line 306
    .local v0, animSet:Landroid/animation/AnimatorSet;
    const/4 v8, 0x2

    new-array v8, v8, [Landroid/animation/Animator;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    const/4 v9, 0x1

    aput-object v3, v8, v9

    invoke-virtual {v0, v8}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 307
    iget v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->val$duration:I

    int-to-long v8, v8

    invoke-virtual {v0, v8, v9}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 308
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    new-instance v9, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$3;

    invoke-direct {v9, p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$3;-><init>(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;Landroid/animation/AnimatorSet;)V

    invoke-virtual {v8, v9}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_0
.end method
