.class Lcom/android/browser/view/PieMenu$5$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PieMenu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/view/PieMenu$5;->onAnimationEnd(Landroid/animation/Animator;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/browser/view/PieMenu$5;


# direct methods
.method constructor <init>(Lcom/android/browser/view/PieMenu$5;)V
    .locals 0
    .parameter

    .prologue
    .line 581
    iput-object p1, p0, Lcom/android/browser/view/PieMenu$5$1;->this$1:Lcom/android/browser/view/PieMenu$5;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 5
    .parameter "a"

    .prologue
    const/4 v4, 0x0

    .line 583
    iget-object v2, p0, Lcom/android/browser/view/PieMenu$5$1;->this$1:Lcom/android/browser/view/PieMenu$5;

    iget-object v2, v2, Lcom/android/browser/view/PieMenu$5;->this$0:Lcom/android/browser/view/PieMenu;

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

    .line 584
    .local v1, item:Lcom/android/browser/view/PieItem;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/browser/view/PieItem;->setAnimationAngle(F)V

    goto :goto_0

    .line 586
    .end local v1           #item:Lcom/android/browser/view/PieItem;
    :cond_0
    iget-object v2, p0, Lcom/android/browser/view/PieMenu$5$1;->this$1:Lcom/android/browser/view/PieMenu$5;

    iget-object v2, v2, Lcom/android/browser/view/PieMenu$5;->this$0:Lcom/android/browser/view/PieMenu;

    const/4 v3, 0x0

    #setter for: Lcom/android/browser/view/PieMenu;->mAnimating:Z
    invoke-static {v2, v3}, Lcom/android/browser/view/PieMenu;->access$302(Lcom/android/browser/view/PieMenu;Z)Z

    .line 587
    iget-object v2, p0, Lcom/android/browser/view/PieMenu$5$1;->this$1:Lcom/android/browser/view/PieMenu$5;

    iget-object v2, v2, Lcom/android/browser/view/PieMenu$5;->this$0:Lcom/android/browser/view/PieMenu;

    #setter for: Lcom/android/browser/view/PieMenu;->mOpenItem:Lcom/android/browser/view/PieItem;
    invoke-static {v2, v4}, Lcom/android/browser/view/PieMenu;->access$602(Lcom/android/browser/view/PieMenu;Lcom/android/browser/view/PieItem;)Lcom/android/browser/view/PieItem;

    .line 588
    iget-object v2, p0, Lcom/android/browser/view/PieMenu$5$1;->this$1:Lcom/android/browser/view/PieMenu$5;

    iget-object v2, v2, Lcom/android/browser/view/PieMenu$5;->this$0:Lcom/android/browser/view/PieMenu;

    #setter for: Lcom/android/browser/view/PieMenu;->mCurrentItem:Lcom/android/browser/view/PieItem;
    invoke-static {v2, v4}, Lcom/android/browser/view/PieMenu;->access$702(Lcom/android/browser/view/PieMenu;Lcom/android/browser/view/PieItem;)Lcom/android/browser/view/PieItem;

    .line 589
    return-void
.end method
