.class Lcom/android/launcher2/Launcher$28;
.super Landroid/animation/AnimatorListenerAdapter;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Launcher;->dismissCling(Lcom/android/launcher2/Cling;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Launcher;

.field final synthetic val$cling:Lcom/android/launcher2/Cling;

.field final synthetic val$flag:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/launcher2/Launcher;Lcom/android/launcher2/Cling;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 4278
    iput-object p1, p0, Lcom/android/launcher2/Launcher$28;->this$0:Lcom/android/launcher2/Launcher;

    iput-object p2, p0, Lcom/android/launcher2/Launcher$28;->val$cling:Lcom/android/launcher2/Cling;

    iput-object p3, p0, Lcom/android/launcher2/Launcher$28;->val$flag:Ljava/lang/String;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 4280
    iget-object v0, p0, Lcom/android/launcher2/Launcher$28;->val$cling:Lcom/android/launcher2/Cling;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Cling;->setVisibility(I)V

    .line 4281
    iget-object v0, p0, Lcom/android/launcher2/Launcher$28;->val$cling:Lcom/android/launcher2/Cling;

    invoke-virtual {v0}, Lcom/android/launcher2/Cling;->cleanup()V

    .line 4283
    new-instance v0, Lcom/android/launcher2/Launcher$28$1;

    const-string v1, "dismissClingThread"

    invoke-direct {v0, p0, v1}, Lcom/android/launcher2/Launcher$28$1;-><init>(Lcom/android/launcher2/Launcher$28;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher$28$1;->start()V

    .line 4290
    return-void
.end method
