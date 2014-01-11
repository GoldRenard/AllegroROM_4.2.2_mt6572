.class Lcom/android/launcher2/Launcher$14$1;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Launcher$14;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/launcher2/Launcher$14;


# direct methods
.method constructor <init>(Lcom/android/launcher2/Launcher$14;)V
    .locals 0
    .parameter

    .prologue
    .line 3003
    iput-object p1, p0, Lcom/android/launcher2/Launcher$14$1;->this$1:Lcom/android/launcher2/Launcher$14;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 3007
    iget-object v0, p0, Lcom/android/launcher2/Launcher$14$1;->this$1:Lcom/android/launcher2/Launcher$14;

    iget-object v0, v0, Lcom/android/launcher2/Launcher$14;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;
    invoke-static {v0}, Lcom/android/launcher2/Launcher;->access$2400(Lcom/android/launcher2/Launcher;)Landroid/animation/AnimatorSet;

    move-result-object v0

    iget-object v1, p0, Lcom/android/launcher2/Launcher$14$1;->this$1:Lcom/android/launcher2/Launcher$14;

    iget-object v1, v1, Lcom/android/launcher2/Launcher$14;->val$stateAnimation:Landroid/animation/AnimatorSet;

    if-eq v0, v1, :cond_0

    .line 3010
    :goto_0
    return-void

    .line 3009
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Launcher$14$1;->this$1:Lcom/android/launcher2/Launcher$14;

    iget-object v0, v0, Lcom/android/launcher2/Launcher$14;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;
    invoke-static {v0}, Lcom/android/launcher2/Launcher;->access$2400(Lcom/android/launcher2/Launcher;)Landroid/animation/AnimatorSet;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    goto :goto_0
.end method
