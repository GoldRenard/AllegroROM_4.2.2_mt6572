.class Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CellLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->animate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;)V
    .locals 0
    .parameter

    .prologue
    .line 2358
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation$2;->this$1:Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    const/4 v1, 0x0

    .line 2361
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation$2;->this$1:Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;

    iput v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->initDeltaX:F

    .line 2362
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation$2;->this$1:Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;

    iput v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->initDeltaY:F

    .line 2363
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation$2;->this$1:Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation$2;->this$1:Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildrenScale()F

    move-result v1

    iput v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->initScale:F

    .line 2364
    return-void
.end method
