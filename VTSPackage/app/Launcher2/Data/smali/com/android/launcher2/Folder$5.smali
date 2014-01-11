.class Lcom/android/launcher2/Folder$5;
.super Ljava/lang/Object;
.source "Folder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Folder;->animateClosed()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Folder;

.field final synthetic val$oa:Landroid/animation/ObjectAnimator;


# direct methods
.method constructor <init>(Lcom/android/launcher2/Folder;Landroid/animation/ObjectAnimator;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 529
    iput-object p1, p0, Lcom/android/launcher2/Folder$5;->this$0:Lcom/android/launcher2/Folder;

    iput-object p2, p0, Lcom/android/launcher2/Folder$5;->val$oa:Landroid/animation/ObjectAnimator;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 532
    iget-object v0, p0, Lcom/android/launcher2/Folder$5;->val$oa:Landroid/animation/ObjectAnimator;

    iget-object v1, p0, Lcom/android/launcher2/Folder$5;->this$0:Lcom/android/launcher2/Folder;

    #getter for: Lcom/android/launcher2/Folder;->mOpenCloseAnimator:Landroid/animation/ObjectAnimator;
    invoke-static {v1}, Lcom/android/launcher2/Folder;->access$300(Lcom/android/launcher2/Folder;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 535
    :goto_0
    return-void

    .line 534
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Folder$5;->val$oa:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_0
.end method
