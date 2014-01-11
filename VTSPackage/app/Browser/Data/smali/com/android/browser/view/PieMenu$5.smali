.class Lcom/android/browser/view/PieMenu$5;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PieMenu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/view/PieMenu;->closeSub()V
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
    .line 574
    iput-object p1, p0, Lcom/android/browser/view/PieMenu$5;->this$0:Lcom/android/browser/view/PieMenu;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 5
    .parameter "a"

    .prologue
    .line 576
    iget-object v2, p0, Lcom/android/browser/view/PieMenu$5;->this$0:Lcom/android/browser/view/PieMenu;

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

    .line 577
    .local v1, item:Lcom/android/browser/view/PieItem;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/browser/view/PieItem;->setAnimationAngle(F)V

    goto :goto_0

    .line 579
    .end local v1           #item:Lcom/android/browser/view/PieItem;
    :cond_0
    iget-object v2, p0, Lcom/android/browser/view/PieMenu$5;->this$0:Lcom/android/browser/view/PieMenu;

    iget-object v3, p0, Lcom/android/browser/view/PieMenu$5;->this$0:Lcom/android/browser/view/PieMenu;

    #getter for: Lcom/android/browser/view/PieMenu;->mItems:Ljava/util/List;
    invoke-static {v3}, Lcom/android/browser/view/PieMenu;->access$100(Lcom/android/browser/view/PieMenu;)Ljava/util/List;

    move-result-object v3

    #setter for: Lcom/android/browser/view/PieMenu;->mCurrentItems:Ljava/util/List;
    invoke-static {v2, v3}, Lcom/android/browser/view/PieMenu;->access$002(Lcom/android/browser/view/PieMenu;Ljava/util/List;)Ljava/util/List;

    .line 580
    iget-object v2, p0, Lcom/android/browser/view/PieMenu$5;->this$0:Lcom/android/browser/view/PieMenu;

    const/4 v3, 0x0

    #setter for: Lcom/android/browser/view/PieMenu;->mPieView:Lcom/android/browser/view/PieMenu$PieView;
    invoke-static {v2, v3}, Lcom/android/browser/view/PieMenu;->access$502(Lcom/android/browser/view/PieMenu;Lcom/android/browser/view/PieMenu$PieView;)Lcom/android/browser/view/PieMenu$PieView;

    .line 581
    iget-object v2, p0, Lcom/android/browser/view/PieMenu$5;->this$0:Lcom/android/browser/view/PieMenu;

    iget-object v3, p0, Lcom/android/browser/view/PieMenu$5;->this$0:Lcom/android/browser/view/PieMenu;

    #getter for: Lcom/android/browser/view/PieMenu;->mOpenItem:Lcom/android/browser/view/PieItem;
    invoke-static {v3}, Lcom/android/browser/view/PieMenu;->access$600(Lcom/android/browser/view/PieMenu;)Lcom/android/browser/view/PieItem;

    move-result-object v3

    new-instance v4, Lcom/android/browser/view/PieMenu$5$1;

    invoke-direct {v4, p0}, Lcom/android/browser/view/PieMenu$5$1;-><init>(Lcom/android/browser/view/PieMenu$5;)V

    #calls: Lcom/android/browser/view/PieMenu;->animateIn(Lcom/android/browser/view/PieItem;Landroid/animation/Animator$AnimatorListener;)V
    invoke-static {v2, v3, v4}, Lcom/android/browser/view/PieMenu;->access$400(Lcom/android/browser/view/PieMenu;Lcom/android/browser/view/PieItem;Landroid/animation/Animator$AnimatorListener;)V

    .line 591
    return-void
.end method
