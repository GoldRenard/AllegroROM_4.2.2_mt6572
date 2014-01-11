.class Lcom/cyanogenmod/trebuchet/DeleteDropTarget$6;
.super Ljava/lang/Object;
.source "DeleteDropTarget.java"

# interfaces
.implements Landroid/animation/TimeInterpolator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->onFlingToDelete(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;IILandroid/graphics/PointF;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mCount:I

.field private mOffset:F

.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

.field final synthetic val$startTime:J


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;J)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 470
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$6;->this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

    iput-wide p2, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$6;->val$startTime:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 471
    const/4 v0, -0x1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$6;->mCount:I

    .line 472
    const/4 v0, 0x0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$6;->mOffset:F

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 5
    .parameter "t"

    .prologue
    .line 476
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$6;->mCount:I

    if-gez v0, :cond_1

    .line 477
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$6;->mCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$6;->mCount:I

    .line 483
    :cond_0
    :goto_0
    const/high16 v0, 0x3f80

    iget v1, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$6;->mOffset:F

    add-float/2addr v1, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0

    .line 478
    :cond_1
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$6;->mCount:I

    if-nez v0, :cond_0

    .line 479
    const/high16 v0, 0x3f00

    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$6;->val$startTime:J

    sub-long/2addr v1, v3

    long-to-float v1, v1

    const/high16 v2, 0x43af

    div-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$6;->mOffset:F

    .line 481
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$6;->mCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$6;->mCount:I

    goto :goto_0
.end method
