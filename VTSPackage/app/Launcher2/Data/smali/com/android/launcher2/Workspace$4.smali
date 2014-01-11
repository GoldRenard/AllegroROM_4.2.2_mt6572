.class Lcom/android/launcher2/Workspace$4;
.super Lcom/android/launcher2/LauncherAnimatorUpdateListener;
.source "Workspace.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Workspace;->getChangeStateAnimation(Lcom/android/launcher2/Workspace$State;ZI)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Workspace;

.field final synthetic val$cl:Lcom/android/launcher2/CellLayout;

.field final synthetic val$i:I


# direct methods
.method constructor <init>(Lcom/android/launcher2/Workspace;Lcom/android/launcher2/CellLayout;I)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1762
    iput-object p1, p0, Lcom/android/launcher2/Workspace$4;->this$0:Lcom/android/launcher2/Workspace;

    iput-object p2, p0, Lcom/android/launcher2/Workspace$4;->val$cl:Lcom/android/launcher2/CellLayout;

    iput p3, p0, Lcom/android/launcher2/Workspace$4;->val$i:I

    invoke-direct {p0}, Lcom/android/launcher2/LauncherAnimatorUpdateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(FF)V
    .locals 4
    .parameter "a"
    .parameter "b"

    .prologue
    .line 1764
    iget-object v0, p0, Lcom/android/launcher2/Workspace$4;->val$cl:Lcom/android/launcher2/CellLayout;

    iget-object v1, p0, Lcom/android/launcher2/Workspace$4;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mOldBackgroundAlphas:[F
    invoke-static {v1}, Lcom/android/launcher2/Workspace;->access$300(Lcom/android/launcher2/Workspace;)[F

    move-result-object v1

    iget v2, p0, Lcom/android/launcher2/Workspace$4;->val$i:I

    aget v1, v1, v2

    mul-float/2addr v1, p1

    iget-object v2, p0, Lcom/android/launcher2/Workspace$4;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mNewBackgroundAlphas:[F
    invoke-static {v2}, Lcom/android/launcher2/Workspace;->access$400(Lcom/android/launcher2/Workspace;)[F

    move-result-object v2

    iget v3, p0, Lcom/android/launcher2/Workspace$4;->val$i:I

    aget v2, v2, v3

    mul-float/2addr v2, p2

    add-float/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/android/launcher2/CellLayout;->setBackgroundAlpha(F)V

    .line 1767
    return-void
.end method
