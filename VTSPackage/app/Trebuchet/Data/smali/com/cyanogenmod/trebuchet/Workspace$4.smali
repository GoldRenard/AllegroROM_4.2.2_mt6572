.class Lcom/cyanogenmod/trebuchet/Workspace$4;
.super Lcom/cyanogenmod/trebuchet/LauncherAnimatorUpdateListener;
.source "Workspace.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Workspace;->getChangeStateAnimation(Lcom/cyanogenmod/trebuchet/Workspace$State;ZI)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Workspace;

.field final synthetic val$cl:Lcom/cyanogenmod/trebuchet/CellLayout;

.field final synthetic val$i:I


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Workspace;Lcom/cyanogenmod/trebuchet/CellLayout;I)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 2412
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Workspace$4;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Workspace$4;->val$cl:Lcom/cyanogenmod/trebuchet/CellLayout;

    iput p3, p0, Lcom/cyanogenmod/trebuchet/Workspace$4;->val$i:I

    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/LauncherAnimatorUpdateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(FF)V
    .locals 4
    .parameter "a"
    .parameter "b"

    .prologue
    .line 2414
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$4;->val$cl:Lcom/cyanogenmod/trebuchet/CellLayout;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace$4;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mOldBackgroundAlphas:[F
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->access$300(Lcom/cyanogenmod/trebuchet/Workspace;)[F

    move-result-object v1

    iget v2, p0, Lcom/cyanogenmod/trebuchet/Workspace$4;->val$i:I

    aget v1, v1, v2

    mul-float/2addr v1, p1

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace$4;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mNewBackgroundAlphas:[F
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/Workspace;->access$400(Lcom/cyanogenmod/trebuchet/Workspace;)[F

    move-result-object v2

    iget v3, p0, Lcom/cyanogenmod/trebuchet/Workspace$4;->val$i:I

    aget v2, v2, v3

    mul-float/2addr v2, p2

    add-float/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->setBackgroundAlpha(F)V

    .line 2417
    return-void
.end method
