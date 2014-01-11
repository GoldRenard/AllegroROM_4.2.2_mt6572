.class Lcom/cyanogenmod/trebuchet/Launcher$26;
.super Landroid/animation/AnimatorListenerAdapter;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->runNewAppsAnimation(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;)V
    .locals 0
    .parameter

    .prologue
    .line 3828
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$26;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4
    .parameter "animation"

    .prologue
    .line 3831
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$26;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$100(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 3832
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$26;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$100(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$26;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mBuildLayersRunnable:Ljava/lang/Runnable;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->access$1500(Lcom/cyanogenmod/trebuchet/Launcher;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 3834
    :cond_0
    return-void
.end method
