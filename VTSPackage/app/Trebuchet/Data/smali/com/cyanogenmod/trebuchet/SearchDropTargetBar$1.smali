.class Lcom/cyanogenmod/trebuchet/SearchDropTargetBar$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SearchDropTargetBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->setupAnimation(Landroid/animation/ObjectAnimator;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;Landroid/view/View;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 95
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar$1;->this$0:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar$1;->val$v:Landroid/view/View;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3
    .parameter "animation"

    .prologue
    .line 98
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar$1;->val$v:Landroid/view/View;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 99
    return-void
.end method
