.class Lcom/android/browser/view/PieMenu$4;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PieMenu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/view/PieMenu;->openSub(Lcom/android/browser/view/PieItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/view/PieMenu;

.field final synthetic val$item:Lcom/android/browser/view/PieItem;


# direct methods
.method constructor <init>(Lcom/android/browser/view/PieMenu;Lcom/android/browser/view/PieItem;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 541
    iput-object p1, p0, Lcom/android/browser/view/PieMenu$4;->this$0:Lcom/android/browser/view/PieMenu;

    iput-object p2, p0, Lcom/android/browser/view/PieMenu$4;->val$item:Lcom/android/browser/view/PieItem;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 8
    .parameter "a"

    .prologue
    .line 543
    iget-object v5, p0, Lcom/android/browser/view/PieMenu$4;->this$0:Lcom/android/browser/view/PieMenu;

    #getter for: Lcom/android/browser/view/PieMenu;->mCurrentItems:Ljava/util/List;
    invoke-static {v5}, Lcom/android/browser/view/PieMenu;->access$000(Lcom/android/browser/view/PieMenu;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/browser/view/PieItem;

    .line 544
    .local v2, item:Lcom/android/browser/view/PieItem;
    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Lcom/android/browser/view/PieItem;->setAnimationAngle(F)V

    goto :goto_0

    .line 546
    .end local v2           #item:Lcom/android/browser/view/PieItem;
    :cond_0
    iget-object v5, p0, Lcom/android/browser/view/PieMenu$4;->this$0:Lcom/android/browser/view/PieMenu;

    new-instance v6, Ljava/util/ArrayList;

    iget-object v7, p0, Lcom/android/browser/view/PieMenu$4;->this$0:Lcom/android/browser/view/PieMenu;

    #getter for: Lcom/android/browser/view/PieMenu;->mItems:Ljava/util/List;
    invoke-static {v7}, Lcom/android/browser/view/PieMenu;->access$100(Lcom/android/browser/view/PieMenu;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    #setter for: Lcom/android/browser/view/PieMenu;->mCurrentItems:Ljava/util/List;
    invoke-static {v5, v6}, Lcom/android/browser/view/PieMenu;->access$002(Lcom/android/browser/view/PieMenu;Ljava/util/List;)Ljava/util/List;

    .line 547
    const/4 v0, 0x0

    .local v0, i:I
    const/4 v3, 0x0

    .line 548
    .local v3, j:I
    :goto_1
    iget-object v5, p0, Lcom/android/browser/view/PieMenu$4;->this$0:Lcom/android/browser/view/PieMenu;

    #getter for: Lcom/android/browser/view/PieMenu;->mItems:Ljava/util/List;
    invoke-static {v5}, Lcom/android/browser/view/PieMenu;->access$100(Lcom/android/browser/view/PieMenu;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v0, v5, :cond_2

    .line 549
    iget-object v5, p0, Lcom/android/browser/view/PieMenu$4;->this$0:Lcom/android/browser/view/PieMenu;

    #getter for: Lcom/android/browser/view/PieMenu;->mItems:Ljava/util/List;
    invoke-static {v5}, Lcom/android/browser/view/PieMenu;->access$100(Lcom/android/browser/view/PieMenu;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    iget-object v6, p0, Lcom/android/browser/view/PieMenu$4;->val$item:Lcom/android/browser/view/PieItem;

    if-ne v5, v6, :cond_1

    .line 550
    iget-object v5, p0, Lcom/android/browser/view/PieMenu$4;->this$0:Lcom/android/browser/view/PieMenu;

    #getter for: Lcom/android/browser/view/PieMenu;->mCurrentItems:Ljava/util/List;
    invoke-static {v5}, Lcom/android/browser/view/PieMenu;->access$000(Lcom/android/browser/view/PieMenu;)Ljava/util/List;

    move-result-object v5

    iget-object v6, p0, Lcom/android/browser/view/PieMenu$4;->val$item:Lcom/android/browser/view/PieItem;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 554
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 552
    :cond_1
    iget-object v5, p0, Lcom/android/browser/view/PieMenu$4;->this$0:Lcom/android/browser/view/PieMenu;

    #getter for: Lcom/android/browser/view/PieMenu;->mCurrentItems:Ljava/util/List;
    invoke-static {v5}, Lcom/android/browser/view/PieMenu;->access$000(Lcom/android/browser/view/PieMenu;)Ljava/util/List;

    move-result-object v5

    iget-object v6, p0, Lcom/android/browser/view/PieMenu$4;->val$item:Lcom/android/browser/view/PieItem;

    invoke-virtual {v6}, Lcom/android/browser/view/PieItem;->getItems()Ljava/util/List;

    move-result-object v6

    add-int/lit8 v4, v3, 0x1

    .end local v3           #j:I
    .local v4, j:I
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v3, v4

    .end local v4           #j:I
    .restart local v3       #j:I
    goto :goto_2

    .line 556
    :cond_2
    iget-object v5, p0, Lcom/android/browser/view/PieMenu$4;->this$0:Lcom/android/browser/view/PieMenu;

    #calls: Lcom/android/browser/view/PieMenu;->layoutPie()V
    invoke-static {v5}, Lcom/android/browser/view/PieMenu;->access$200(Lcom/android/browser/view/PieMenu;)V

    .line 557
    iget-object v5, p0, Lcom/android/browser/view/PieMenu$4;->this$0:Lcom/android/browser/view/PieMenu;

    iget-object v6, p0, Lcom/android/browser/view/PieMenu$4;->val$item:Lcom/android/browser/view/PieItem;

    new-instance v7, Lcom/android/browser/view/PieMenu$4$1;

    invoke-direct {v7, p0}, Lcom/android/browser/view/PieMenu$4$1;-><init>(Lcom/android/browser/view/PieMenu$4;)V

    #calls: Lcom/android/browser/view/PieMenu;->animateIn(Lcom/android/browser/view/PieItem;Landroid/animation/Animator$AnimatorListener;)V
    invoke-static {v5, v6, v7}, Lcom/android/browser/view/PieMenu;->access$400(Lcom/android/browser/view/PieMenu;Lcom/android/browser/view/PieItem;Landroid/animation/Animator$AnimatorListener;)V

    .line 565
    return-void
.end method
