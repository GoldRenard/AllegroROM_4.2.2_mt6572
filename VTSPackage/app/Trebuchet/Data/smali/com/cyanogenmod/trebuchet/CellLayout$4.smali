.class Lcom/cyanogenmod/trebuchet/CellLayout$4;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CellLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/CellLayout;->animateChildToPosition(Landroid/view/View;IIIIZZ)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field cancelled:Z

.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

.field final synthetic val$child:Landroid/view/View;

.field final synthetic val$lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;Landroid/view/View;)V
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1162
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$4;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$4;->val$lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$4;->val$child:Landroid/view/View;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 1163
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$4;->cancelled:Z

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1
    .parameter "animation"

    .prologue
    .line 1177
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$4;->cancelled:Z

    .line 1178
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 1168
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$4;->cancelled:Z

    if-nez v0, :cond_0

    .line 1169
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$4;->val$lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->isLockedToGrid:Z

    .line 1170
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$4;->val$child:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 1172
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$4;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mReorderAnimators:Ljava/util/HashMap;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$200(Lcom/cyanogenmod/trebuchet/CellLayout;)Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$4;->val$lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1173
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$4;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mReorderAnimators:Ljava/util/HashMap;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$200(Lcom/cyanogenmod/trebuchet/CellLayout;)Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$4;->val$lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1175
    :cond_1
    return-void
.end method
