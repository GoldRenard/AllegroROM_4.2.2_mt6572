.class Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AppsCustomizeTabHost.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;)V
    .locals 0
    .parameter

    .prologue
    .line 285
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$1;->this$1:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 293
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$1;->this$1:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAnimationBuffer:Landroid/widget/FrameLayout;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$400(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Landroid/widget/FrameLayout;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 294
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$1;->this$1:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAnimationBuffer:Landroid/widget/FrameLayout;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$400(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 295
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 288
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$1;->this$1:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAnimationBuffer:Landroid/widget/FrameLayout;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$400(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Landroid/widget/FrameLayout;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 289
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$1;->this$1:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAnimationBuffer:Landroid/widget/FrameLayout;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$400(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 290
    return-void
.end method
