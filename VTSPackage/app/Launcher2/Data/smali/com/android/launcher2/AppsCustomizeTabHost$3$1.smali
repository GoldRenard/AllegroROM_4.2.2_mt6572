.class Lcom/android/launcher2/AppsCustomizeTabHost$3$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AppsCustomizeTabHost.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/AppsCustomizeTabHost$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/launcher2/AppsCustomizeTabHost$3;


# direct methods
.method constructor <init>(Lcom/android/launcher2/AppsCustomizeTabHost$3;)V
    .locals 0
    .parameter

    .prologue
    .line 294
    iput-object p1, p0, Lcom/android/launcher2/AppsCustomizeTabHost$3$1;->this$1:Lcom/android/launcher2/AppsCustomizeTabHost$3;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 302
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizeTabHost$3$1;->this$1:Lcom/android/launcher2/AppsCustomizeTabHost$3;

    iget-object v0, v0, Lcom/android/launcher2/AppsCustomizeTabHost$3;->this$0:Lcom/android/launcher2/AppsCustomizeTabHost;

    #getter for: Lcom/android/launcher2/AppsCustomizeTabHost;->mAnimationBuffer:Landroid/widget/FrameLayout;
    invoke-static {v0}, Lcom/android/launcher2/AppsCustomizeTabHost;->access$400(Lcom/android/launcher2/AppsCustomizeTabHost;)Landroid/widget/FrameLayout;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 303
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizeTabHost$3$1;->this$1:Lcom/android/launcher2/AppsCustomizeTabHost$3;

    iget-object v0, v0, Lcom/android/launcher2/AppsCustomizeTabHost$3;->this$0:Lcom/android/launcher2/AppsCustomizeTabHost;

    #getter for: Lcom/android/launcher2/AppsCustomizeTabHost;->mAnimationBuffer:Landroid/widget/FrameLayout;
    invoke-static {v0}, Lcom/android/launcher2/AppsCustomizeTabHost;->access$400(Lcom/android/launcher2/AppsCustomizeTabHost;)Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 304
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 297
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizeTabHost$3$1;->this$1:Lcom/android/launcher2/AppsCustomizeTabHost$3;

    iget-object v0, v0, Lcom/android/launcher2/AppsCustomizeTabHost$3;->this$0:Lcom/android/launcher2/AppsCustomizeTabHost;

    #getter for: Lcom/android/launcher2/AppsCustomizeTabHost;->mAnimationBuffer:Landroid/widget/FrameLayout;
    invoke-static {v0}, Lcom/android/launcher2/AppsCustomizeTabHost;->access$400(Lcom/android/launcher2/AppsCustomizeTabHost;)Landroid/widget/FrameLayout;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 298
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizeTabHost$3$1;->this$1:Lcom/android/launcher2/AppsCustomizeTabHost$3;

    iget-object v0, v0, Lcom/android/launcher2/AppsCustomizeTabHost$3;->this$0:Lcom/android/launcher2/AppsCustomizeTabHost;

    #getter for: Lcom/android/launcher2/AppsCustomizeTabHost;->mAnimationBuffer:Landroid/widget/FrameLayout;
    invoke-static {v0}, Lcom/android/launcher2/AppsCustomizeTabHost;->access$400(Lcom/android/launcher2/AppsCustomizeTabHost;)Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 299
    return-void
.end method
