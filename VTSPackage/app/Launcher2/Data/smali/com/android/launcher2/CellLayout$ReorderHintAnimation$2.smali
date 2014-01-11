.class Lcom/android/launcher2/CellLayout$ReorderHintAnimation$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CellLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/CellLayout$ReorderHintAnimation;->animate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/launcher2/CellLayout$ReorderHintAnimation;


# direct methods
.method constructor <init>(Lcom/android/launcher2/CellLayout$ReorderHintAnimation;)V
    .locals 0
    .parameter

    .prologue
    .line 2349
    iput-object p1, p0, Lcom/android/launcher2/CellLayout$ReorderHintAnimation$2;->this$1:Lcom/android/launcher2/CellLayout$ReorderHintAnimation;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    const/4 v1, 0x0

    .line 2352
    iget-object v0, p0, Lcom/android/launcher2/CellLayout$ReorderHintAnimation$2;->this$1:Lcom/android/launcher2/CellLayout$ReorderHintAnimation;

    iput v1, v0, Lcom/android/launcher2/CellLayout$ReorderHintAnimation;->initDeltaX:F

    .line 2353
    iget-object v0, p0, Lcom/android/launcher2/CellLayout$ReorderHintAnimation$2;->this$1:Lcom/android/launcher2/CellLayout$ReorderHintAnimation;

    iput v1, v0, Lcom/android/launcher2/CellLayout$ReorderHintAnimation;->initDeltaY:F

    .line 2354
    iget-object v0, p0, Lcom/android/launcher2/CellLayout$ReorderHintAnimation$2;->this$1:Lcom/android/launcher2/CellLayout$ReorderHintAnimation;

    iget-object v1, p0, Lcom/android/launcher2/CellLayout$ReorderHintAnimation$2;->this$1:Lcom/android/launcher2/CellLayout$ReorderHintAnimation;

    iget-object v1, v1, Lcom/android/launcher2/CellLayout$ReorderHintAnimation;->this$0:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v1}, Lcom/android/launcher2/CellLayout;->getChildrenScale()F

    move-result v1

    iput v1, v0, Lcom/android/launcher2/CellLayout$ReorderHintAnimation;->initScale:F

    .line 2355
    return-void
.end method
