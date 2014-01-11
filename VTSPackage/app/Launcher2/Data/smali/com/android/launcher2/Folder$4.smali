.class Lcom/android/launcher2/Folder$4;
.super Landroid/animation/AnimatorListenerAdapter;
.source "Folder.java"


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


# direct methods
.method constructor <init>(Lcom/android/launcher2/Folder;)V
    .locals 0
    .parameter

    .prologue
    .line 512
    iput-object p1, p0, Lcom/android/launcher2/Folder$4;->this$0:Lcom/android/launcher2/Folder;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3
    .parameter "animation"

    .prologue
    const/4 v2, 0x0

    .line 516
    iget-object v0, p0, Lcom/android/launcher2/Folder$4;->this$0:Lcom/android/launcher2/Folder;

    const/4 v1, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/android/launcher2/Folder;->setLayerType(ILandroid/graphics/Paint;)V

    .line 517
    iget-object v0, p0, Lcom/android/launcher2/Folder$4;->this$0:Lcom/android/launcher2/Folder;

    #setter for: Lcom/android/launcher2/Folder;->mState:I
    invoke-static {v0, v2}, Lcom/android/launcher2/Folder;->access$102(Lcom/android/launcher2/Folder;I)I

    .line 518
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 4
    .parameter "animation"

    .prologue
    .line 521
    iget-object v0, p0, Lcom/android/launcher2/Folder$4;->this$0:Lcom/android/launcher2/Folder;

    const/16 v1, 0x20

    iget-object v2, p0, Lcom/android/launcher2/Folder$4;->this$0:Lcom/android/launcher2/Folder;

    invoke-virtual {v2}, Lcom/android/launcher2/Folder;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0d0066

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/android/launcher2/Folder;->sendCustomAccessibilityEvent(ILjava/lang/String;)V
    invoke-static {v0, v1, v2}, Lcom/android/launcher2/Folder;->access$000(Lcom/android/launcher2/Folder;ILjava/lang/String;)V

    .line 523
    iget-object v0, p0, Lcom/android/launcher2/Folder$4;->this$0:Lcom/android/launcher2/Folder;

    const/4 v1, 0x1

    #setter for: Lcom/android/launcher2/Folder;->mState:I
    invoke-static {v0, v1}, Lcom/android/launcher2/Folder;->access$102(Lcom/android/launcher2/Folder;I)I

    .line 524
    return-void
.end method
