.class Lcom/android/launcher2/CellLayout$4;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CellLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/CellLayout;->animateChildToPosition(Landroid/view/View;IIIIZZ)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field cancelled:Z

.field final synthetic this$0:Lcom/android/launcher2/CellLayout;

.field final synthetic val$child:Landroid/view/View;

.field final synthetic val$lp:Lcom/android/launcher2/CellLayout$LayoutParams;


# direct methods
.method constructor <init>(Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/CellLayout$LayoutParams;Landroid/view/View;)V
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1147
    iput-object p1, p0, Lcom/android/launcher2/CellLayout$4;->this$0:Lcom/android/launcher2/CellLayout;

    iput-object p2, p0, Lcom/android/launcher2/CellLayout$4;->val$lp:Lcom/android/launcher2/CellLayout$LayoutParams;

    iput-object p3, p0, Lcom/android/launcher2/CellLayout$4;->val$child:Landroid/view/View;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 1148
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/launcher2/CellLayout$4;->cancelled:Z

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1
    .parameter "animation"

    .prologue
    .line 1162
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/CellLayout$4;->cancelled:Z

    .line 1163
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 1153
    iget-boolean v0, p0, Lcom/android/launcher2/CellLayout$4;->cancelled:Z

    if-nez v0, :cond_0

    .line 1154
    iget-object v0, p0, Lcom/android/launcher2/CellLayout$4;->val$lp:Lcom/android/launcher2/CellLayout$LayoutParams;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/android/launcher2/CellLayout$LayoutParams;->isLockedToGrid:Z

    .line 1155
    iget-object v0, p0, Lcom/android/launcher2/CellLayout$4;->val$child:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 1157
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/CellLayout$4;->this$0:Lcom/android/launcher2/CellLayout;

    #getter for: Lcom/android/launcher2/CellLayout;->mReorderAnimators:Ljava/util/HashMap;
    invoke-static {v0}, Lcom/android/launcher2/CellLayout;->access$200(Lcom/android/launcher2/CellLayout;)Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lcom/android/launcher2/CellLayout$4;->val$lp:Lcom/android/launcher2/CellLayout$LayoutParams;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1158
    iget-object v0, p0, Lcom/android/launcher2/CellLayout$4;->this$0:Lcom/android/launcher2/CellLayout;

    #getter for: Lcom/android/launcher2/CellLayout;->mReorderAnimators:Ljava/util/HashMap;
    invoke-static {v0}, Lcom/android/launcher2/CellLayout;->access$200(Lcom/android/launcher2/CellLayout;)Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lcom/android/launcher2/CellLayout$4;->val$lp:Lcom/android/launcher2/CellLayout$LayoutParams;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1160
    :cond_1
    return-void
.end method
