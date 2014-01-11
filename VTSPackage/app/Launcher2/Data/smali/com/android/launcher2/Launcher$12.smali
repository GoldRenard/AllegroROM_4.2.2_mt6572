.class Lcom/android/launcher2/Launcher$12;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Launcher;->showAppsCustomizeHelper(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Launcher;

.field final synthetic val$fromView:Landroid/view/View;

.field final synthetic val$toView:Lcom/android/launcher2/AppsCustomizeTabHost;


# direct methods
.method constructor <init>(Lcom/android/launcher2/Launcher;Landroid/view/View;Lcom/android/launcher2/AppsCustomizeTabHost;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 2910
    iput-object p1, p0, Lcom/android/launcher2/Launcher$12;->this$0:Lcom/android/launcher2/Launcher;

    iput-object p2, p0, Lcom/android/launcher2/Launcher$12;->val$fromView:Landroid/view/View;

    iput-object p3, p0, Lcom/android/launcher2/Launcher$12;->val$toView:Lcom/android/launcher2/AppsCustomizeTabHost;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3
    .parameter "animation"

    .prologue
    .line 2913
    if-nez p1, :cond_0

    .line 2914
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "animation is null"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2916
    :cond_0
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 2917
    .local v0, t:F
    iget-object v1, p0, Lcom/android/launcher2/Launcher$12;->this$0:Lcom/android/launcher2/Launcher;

    iget-object v2, p0, Lcom/android/launcher2/Launcher$12;->val$fromView:Landroid/view/View;

    #calls: Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionStep(Landroid/view/View;F)V
    invoke-static {v1, v2, v0}, Lcom/android/launcher2/Launcher;->access$2100(Lcom/android/launcher2/Launcher;Landroid/view/View;F)V

    .line 2918
    iget-object v1, p0, Lcom/android/launcher2/Launcher$12;->this$0:Lcom/android/launcher2/Launcher;

    iget-object v2, p0, Lcom/android/launcher2/Launcher$12;->val$toView:Lcom/android/launcher2/AppsCustomizeTabHost;

    #calls: Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionStep(Landroid/view/View;F)V
    invoke-static {v1, v2, v0}, Lcom/android/launcher2/Launcher;->access$2100(Lcom/android/launcher2/Launcher;Landroid/view/View;F)V

    .line 2919
    return-void
.end method
