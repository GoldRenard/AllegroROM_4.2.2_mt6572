.class Lcom/android/browser/NavigationBarTablet$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "NavigationBarTablet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/NavigationBarTablet;->hideNavButtons()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/NavigationBarTablet;


# direct methods
.method constructor <init>(Lcom/android/browser/NavigationBarTablet;)V
    .locals 0
    .parameter

    .prologue
    .line 279
    iput-object p1, p0, Lcom/android/browser/NavigationBarTablet$1;->this$0:Lcom/android/browser/NavigationBarTablet;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 282
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet$1;->this$0:Lcom/android/browser/NavigationBarTablet;

    #getter for: Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;
    invoke-static {v0}, Lcom/android/browser/NavigationBarTablet;->access$000(Lcom/android/browser/NavigationBarTablet;)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 283
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet$1;->this$0:Lcom/android/browser/NavigationBarTablet;

    const/4 v1, 0x0

    #setter for: Lcom/android/browser/NavigationBarTablet;->mAnimation:Landroid/animation/AnimatorSet;
    invoke-static {v0, v1}, Lcom/android/browser/NavigationBarTablet;->access$102(Lcom/android/browser/NavigationBarTablet;Landroid/animation/AnimatorSet;)Landroid/animation/AnimatorSet;

    .line 284
    return-void
.end method
