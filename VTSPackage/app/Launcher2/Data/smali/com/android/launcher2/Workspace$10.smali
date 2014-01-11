.class Lcom/android/launcher2/Workspace$10;
.super Ljava/lang/Object;
.source "Workspace.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Workspace;->animateWidgetDrop(Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/DragView;Ljava/lang/Runnable;ILandroid/view/View;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Workspace;

.field final synthetic val$finalView:Landroid/view/View;

.field final synthetic val$onCompleteRunnable:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/android/launcher2/Workspace;Landroid/view/View;Ljava/lang/Runnable;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 3491
    iput-object p1, p0, Lcom/android/launcher2/Workspace$10;->this$0:Lcom/android/launcher2/Workspace;

    iput-object p2, p0, Lcom/android/launcher2/Workspace$10;->val$finalView:Landroid/view/View;

    iput-object p3, p0, Lcom/android/launcher2/Workspace$10;->val$onCompleteRunnable:Ljava/lang/Runnable;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 3494
    iget-object v0, p0, Lcom/android/launcher2/Workspace$10;->val$finalView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 3495
    iget-object v0, p0, Lcom/android/launcher2/Workspace$10;->val$finalView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 3497
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Workspace$10;->val$onCompleteRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_1

    .line 3498
    iget-object v0, p0, Lcom/android/launcher2/Workspace$10;->val$onCompleteRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 3500
    :cond_1
    return-void
.end method
