.class Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FolderIcon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->animateToAcceptState()V
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
    .line 208
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator$2;->this$0:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 211
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator$2;->this$0:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->mFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

    if-eqz v0, :cond_0

    .line 212
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator$2;->this$0:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->mFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

    #getter for: Lcom/cyanogenmod/trebuchet/FolderIcon;->mPreviewBackground:Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->access$200(Lcom/cyanogenmod/trebuchet/FolderIcon;)Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 214
    :cond_0
    return-void
.end method
