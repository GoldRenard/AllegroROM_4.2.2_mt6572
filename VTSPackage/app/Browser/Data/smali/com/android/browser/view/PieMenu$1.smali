.class Lcom/android/browser/view/PieMenu$1;
.super Ljava/lang/Object;
.source "PieMenu.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/view/PieMenu;->animateOpen()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/view/PieMenu;


# direct methods
.method constructor <init>(Lcom/android/browser/view/PieMenu;)V
    .locals 0
    .parameter

    .prologue
    .line 229
    iput-object p1, p0, Lcom/android/browser/view/PieMenu$1;->this$0:Lcom/android/browser/view/PieMenu;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 4
    .parameter "animation"

    .prologue
    .line 232
    iget-object v2, p0, Lcom/android/browser/view/PieMenu$1;->this$0:Lcom/android/browser/view/PieMenu;

    #getter for: Lcom/android/browser/view/PieMenu;->mCurrentItems:Ljava/util/List;
    invoke-static {v2}, Lcom/android/browser/view/PieMenu;->access$000(Lcom/android/browser/view/PieMenu;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/browser/view/PieItem;

    .line 233
    .local v1, item:Lcom/android/browser/view/PieItem;
    const/high16 v2, 0x3f80

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result v3

    sub-float/2addr v2, v3

    invoke-virtual {v1}, Lcom/android/browser/view/PieItem;->getStart()F

    move-result v3

    neg-float v3, v3

    mul-float/2addr v2, v3

    invoke-virtual {v1, v2}, Lcom/android/browser/view/PieItem;->setAnimationAngle(F)V

    goto :goto_0

    .line 235
    .end local v1           #item:Lcom/android/browser/view/PieItem;
    :cond_0
    iget-object v2, p0, Lcom/android/browser/view/PieMenu$1;->this$0:Lcom/android/browser/view/PieMenu;

    invoke-virtual {v2}, Lcom/android/browser/view/PieMenu;->invalidate()V

    .line 236
    return-void
.end method
