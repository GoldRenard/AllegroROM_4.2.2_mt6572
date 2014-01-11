.class Lcom/cyanogenmod/trebuchet/Launcher$21;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


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

.field final synthetic val$stateAnimation:Landroid/animation/Animator;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/animation/Animator;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 3027
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$21;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Launcher$21;->val$stateAnimation:Landroid/animation/Animator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 3029
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$21;->val$stateAnimation:Landroid/animation/Animator;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$21;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->access$1900(Lcom/cyanogenmod/trebuchet/Launcher;)Landroid/animation/AnimatorSet;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 3032
    :goto_0
    return-void

    .line 3031
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$21;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$1900(Lcom/cyanogenmod/trebuchet/Launcher;)Landroid/animation/AnimatorSet;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    goto :goto_0
.end method
