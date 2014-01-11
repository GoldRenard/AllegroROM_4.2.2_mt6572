.class Lcom/cyanogenmod/trebuchet/Launcher$14;
.super Landroid/animation/AnimatorListenerAdapter;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->shrinkAndFadeInFolderIcon(Lcom/cyanogenmod/trebuchet/FolderIcon;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;

.field final synthetic val$cl:Lcom/cyanogenmod/trebuchet/CellLayout;

.field final synthetic val$fi:Lcom/cyanogenmod/trebuchet/FolderIcon;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/FolderIcon;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 2496
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$14;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Launcher$14;->val$cl:Lcom/cyanogenmod/trebuchet/CellLayout;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/Launcher$14;->val$fi:Lcom/cyanogenmod/trebuchet/FolderIcon;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 2499
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$14;->val$cl:Lcom/cyanogenmod/trebuchet/CellLayout;

    if-eqz v0, :cond_0

    .line 2500
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$14;->val$cl:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->clearFolderLeaveBehind()V

    .line 2502
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$14;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$1200(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$14;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2400(Lcom/cyanogenmod/trebuchet/Launcher;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/DragLayer;->removeView(Landroid/view/View;)V

    .line 2503
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$14;->val$fi:Lcom/cyanogenmod/trebuchet/FolderIcon;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->setVisibility(I)V

    .line 2505
    :cond_0
    return-void
.end method
