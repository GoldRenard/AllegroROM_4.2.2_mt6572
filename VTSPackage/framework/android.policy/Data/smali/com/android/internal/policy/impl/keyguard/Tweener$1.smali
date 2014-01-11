.class final Lcom/android/internal/policy/impl/keyguard/Tweener$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "Tweener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard/Tweener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 141
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0
    .parameter "animation"

    .prologue
    .line 150
    #calls: Lcom/android/internal/policy/impl/keyguard/Tweener;->remove(Landroid/animation/Animator;)V
    invoke-static {p1}, Lcom/android/internal/policy/impl/keyguard/Tweener;->access$000(Landroid/animation/Animator;)V

    .line 151
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0
    .parameter "animation"

    .prologue
    .line 145
    #calls: Lcom/android/internal/policy/impl/keyguard/Tweener;->remove(Landroid/animation/Animator;)V
    invoke-static {p1}, Lcom/android/internal/policy/impl/keyguard/Tweener;->access$000(Landroid/animation/Animator;)V

    .line 146
    return-void
.end method
