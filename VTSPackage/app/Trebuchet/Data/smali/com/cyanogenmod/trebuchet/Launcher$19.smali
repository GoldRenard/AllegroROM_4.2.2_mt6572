.class Lcom/cyanogenmod/trebuchet/Launcher$19;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->hideAppsCustomizeHelper(Lcom/cyanogenmod/trebuchet/Launcher$State;ZLjava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;

.field final synthetic val$fromView:Landroid/view/View;

.field final synthetic val$toView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/View;Landroid/view/View;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 2987
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$19;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Launcher$19;->val$fromView:Landroid/view/View;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/Launcher$19;->val$toView:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3
    .parameter "animation"

    .prologue
    .line 2990
    const/high16 v2, 0x3f80

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    sub-float v0, v2, v1

    .line 2991
    .local v0, t:F
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$19;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher$19;->val$fromView:Landroid/view/View;

    #calls: Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionStep(Landroid/view/View;F)V
    invoke-static {v1, v2, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2500(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/View;F)V

    .line 2992
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$19;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher$19;->val$toView:Landroid/view/View;

    #calls: Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionStep(Landroid/view/View;F)V
    invoke-static {v1, v2, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2500(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/View;F)V

    .line 2993
    return-void
.end method
