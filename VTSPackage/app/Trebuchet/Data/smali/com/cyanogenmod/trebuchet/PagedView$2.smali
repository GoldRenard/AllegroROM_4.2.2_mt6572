.class Lcom/cyanogenmod/trebuchet/PagedView$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PagedView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/PagedView;->hideScrollingIndicator(ZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private cancelled:Z

.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/PagedView;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/PagedView;)V
    .locals 1
    .parameter

    .prologue
    .line 2095
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/PagedView$2;->this$0:Lcom/cyanogenmod/trebuchet/PagedView;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 2096
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView$2;->cancelled:Z

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1
    .parameter "animation"

    .prologue
    .line 2099
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView$2;->cancelled:Z

    .line 2100
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 2103
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView$2;->cancelled:Z

    if-nez v0, :cond_0

    .line 2104
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView$2;->this$0:Lcom/cyanogenmod/trebuchet/PagedView;

    #getter for: Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/PagedView;->access$100(Lcom/cyanogenmod/trebuchet/PagedView;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 2106
    :cond_0
    return-void
.end method
