.class Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator$4;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FolderIcon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->animateToNaturalState()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;)V
    .locals 0
    .parameter

    .prologue
    .line 237
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator$4;->this$0:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 240
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator$4;->this$0:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    #getter for: Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->access$100(Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 241
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator$4;->this$0:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    #getter for: Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->access$100(Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator$4;->this$0:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->hideFolderAccept(Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;)V

    .line 243
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator$4;->this$0:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->mFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

    if-eqz v0, :cond_1

    .line 244
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator$4;->this$0:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->mFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

    #getter for: Lcom/cyanogenmod/trebuchet/FolderIcon;->mPreviewBackground:Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->access$200(Lcom/cyanogenmod/trebuchet/FolderIcon;)Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 246
    :cond_1
    return-void
.end method
