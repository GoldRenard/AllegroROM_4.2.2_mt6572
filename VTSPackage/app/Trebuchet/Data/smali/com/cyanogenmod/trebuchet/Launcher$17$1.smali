.class Lcom/cyanogenmod/trebuchet/Launcher$17$1;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher$17;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cyanogenmod/trebuchet/Launcher$17;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher$17;)V
    .locals 0
    .parameter

    .prologue
    .line 2890
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$17$1;->this$1:Lcom/cyanogenmod/trebuchet/Launcher$17;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 2894
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$17$1;->this$1:Lcom/cyanogenmod/trebuchet/Launcher$17;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Launcher$17;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$1900(Lcom/cyanogenmod/trebuchet/Launcher;)Landroid/animation/AnimatorSet;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$17$1;->this$1:Lcom/cyanogenmod/trebuchet/Launcher$17;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Launcher$17;->val$stateAnimation:Landroid/animation/AnimatorSet;

    if-eq v0, v1, :cond_0

    .line 2897
    :goto_0
    return-void

    .line 2896
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$17$1;->this$1:Lcom/cyanogenmod/trebuchet/Launcher$17;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Launcher$17;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$1900(Lcom/cyanogenmod/trebuchet/Launcher;)Landroid/animation/AnimatorSet;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    goto :goto_0
.end method
