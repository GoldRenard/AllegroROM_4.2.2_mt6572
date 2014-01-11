.class Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;
.super Ljava/lang/Object;
.source "EcoGallery.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/widget/EcoGallery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FlingRunnable"
.end annotation


# instance fields
.field private mLastFlingX:I

.field private mScroller:Landroid/widget/Scroller;

.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;


# direct methods
.method public constructor <init>(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;)V
    .locals 2
    .parameter

    .prologue
    .line 1251
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1252
    new-instance v0, Landroid/widget/Scroller;

    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->mScroller:Landroid/widget/Scroller;

    .line 1253
    return-void
.end method

.method static synthetic access$100(Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1240
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->endFling(Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;)Landroid/widget/Scroller;
    .locals 1
    .parameter "x0"

    .prologue
    .line 1240
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->mScroller:Landroid/widget/Scroller;

    return-object v0
.end method

.method private endFling(Z)V
    .locals 2
    .parameter "scrollIntoSlots"

    .prologue
    .line 1292
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->mScroller:Landroid/widget/Scroller;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 1294
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    #calls: Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->scrollIntoSlots()V
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->access$500(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;)V

    .line 1295
    :cond_0
    return-void
.end method

.method private startCommon()V
    .locals 1

    .prologue
    .line 1257
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-virtual {v0, p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1258
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    .line 1299
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    iget v5, v5, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mItemCount:I

    if-nez v5, :cond_0

    .line 1300
    invoke-direct {p0, v7}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->endFling(Z)V

    .line 1338
    :goto_0
    return-void

    .line 1304
    :cond_0
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    const/4 v6, 0x0

    #setter for: Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mShouldStopFling:Z
    invoke-static {v5, v6}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->access$602(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;Z)Z

    .line 1306
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->mScroller:Landroid/widget/Scroller;

    .line 1307
    .local v3, scroller:Landroid/widget/Scroller;
    invoke-virtual {v3}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v1

    .line 1308
    .local v1, more:Z
    invoke-virtual {v3}, Landroid/widget/Scroller;->getCurrX()I

    move-result v4

    .line 1312
    .local v4, x:I
    iget v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->mLastFlingX:I

    sub-int v0, v5, v4

    .line 1315
    .local v0, delta:I
    if-lez v0, :cond_1

    .line 1317
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    iget v6, v6, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    #setter for: Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchPosition:I
    invoke-static {v5, v6}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->access$702(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;I)I

    .line 1320
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getWidth()I

    move-result v5

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getPaddingLeft()I

    move-result v6

    sub-int/2addr v5, v6

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getPaddingRight()I

    move-result v6

    sub-int/2addr v5, v6

    add-int/lit8 v5, v5, -0x1

    invoke-static {v5, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1330
    :goto_1
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-virtual {v5, v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->trackMotionScroll(I)V

    .line 1332
    if-eqz v1, :cond_2

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    #getter for: Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mShouldStopFling:Z
    invoke-static {v5}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->access$600(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 1333
    iput v4, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->mLastFlingX:I

    .line 1334
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-virtual {v5, p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 1323
    :cond_1
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildCount()I

    move-result v5

    add-int/lit8 v2, v5, -0x1

    .line 1324
    .local v2, offsetToLast:I
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    iget v6, v6, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    add-int/2addr v6, v2

    #setter for: Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchPosition:I
    invoke-static {v5, v6}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->access$702(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;I)I

    .line 1327
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getWidth()I

    move-result v5

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getPaddingRight()I

    move-result v6

    sub-int/2addr v5, v6

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getPaddingLeft()I

    move-result v6

    sub-int/2addr v5, v6

    add-int/lit8 v5, v5, -0x1

    neg-int v5, v5

    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_1

    .line 1336
    .end local v2           #offsetToLast:I
    :cond_2
    invoke-direct {p0, v7}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->endFling(Z)V

    goto/16 :goto_0
.end method

.method public startUsingDistance(I)V
    .locals 6
    .parameter "distance"

    .prologue
    const/4 v1, 0x0

    .line 1273
    if-nez p1, :cond_0

    .line 1280
    :goto_0
    return-void

    .line 1275
    :cond_0
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->startCommon()V

    .line 1277
    iput v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->mLastFlingX:I

    .line 1278
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->mScroller:Landroid/widget/Scroller;

    neg-int v3, p1

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    #getter for: Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mAnimationDuration:I
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->access$400(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;)I

    move-result v5

    move v2, v1

    move v4, v1

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 1279
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-virtual {v0, p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public startUsingVelocity(I)V
    .locals 9
    .parameter "initialVelocity"

    .prologue
    const v6, 0x7fffffff

    const/4 v2, 0x0

    .line 1261
    if-nez p1, :cond_0

    .line 1270
    :goto_0
    return-void

    .line 1263
    :cond_0
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->startCommon()V

    .line 1265
    if-gez p1, :cond_1

    move v1, v6

    .line 1266
    .local v1, initialX:I
    :goto_1
    iput v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->mLastFlingX:I

    .line 1267
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->mScroller:Landroid/widget/Scroller;

    move v3, p1

    move v4, v2

    move v5, v2

    move v7, v2

    move v8, v6

    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    .line 1269
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-virtual {v0, p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .end local v1           #initialX:I
    :cond_1
    move v1, v2

    .line 1265
    goto :goto_1
.end method

.method public stop(Z)V
    .locals 1
    .parameter "scrollIntoSlots"

    .prologue
    .line 1283
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-virtual {v0, p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1284
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->endFling(Z)V

    .line 1285
    return-void
.end method
