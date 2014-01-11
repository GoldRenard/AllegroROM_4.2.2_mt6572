.class Lcom/android/launcher2/Launcher$16;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Launcher;->hideAppsCustomizeHelper(Lcom/android/launcher2/Launcher$State;ZZLjava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Launcher;

.field final synthetic val$fromView:Landroid/view/View;

.field final synthetic val$toView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/launcher2/Launcher;Landroid/view/View;Landroid/view/View;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 3116
    iput-object p1, p0, Lcom/android/launcher2/Launcher$16;->this$0:Lcom/android/launcher2/Launcher;

    iput-object p2, p0, Lcom/android/launcher2/Launcher$16;->val$fromView:Landroid/view/View;

    iput-object p3, p0, Lcom/android/launcher2/Launcher$16;->val$toView:Landroid/view/View;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3
    .parameter "animation"

    .prologue
    .line 3119
    const/high16 v2, 0x3f80

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    sub-float v0, v2, v1

    .line 3120
    .local v0, t:F
    iget-object v1, p0, Lcom/android/launcher2/Launcher$16;->this$0:Lcom/android/launcher2/Launcher;

    iget-object v2, p0, Lcom/android/launcher2/Launcher$16;->val$fromView:Landroid/view/View;

    #calls: Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionStep(Landroid/view/View;F)V
    invoke-static {v1, v2, v0}, Lcom/android/launcher2/Launcher;->access$2100(Lcom/android/launcher2/Launcher;Landroid/view/View;F)V

    .line 3121
    iget-object v1, p0, Lcom/android/launcher2/Launcher$16;->this$0:Lcom/android/launcher2/Launcher;

    iget-object v2, p0, Lcom/android/launcher2/Launcher$16;->val$toView:Landroid/view/View;

    #calls: Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionStep(Landroid/view/View;F)V
    invoke-static {v1, v2, v0}, Lcom/android/launcher2/Launcher;->access$2100(Lcom/android/launcher2/Launcher;Landroid/view/View;F)V

    .line 3122
    return-void
.end method
