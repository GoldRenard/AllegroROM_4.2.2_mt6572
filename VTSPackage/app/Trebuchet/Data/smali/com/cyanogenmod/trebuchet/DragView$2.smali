.class Lcom/cyanogenmod/trebuchet/DragView$2;
.super Ljava/lang/Object;
.source "DragView.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/DragView;->crossFade(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/DragView;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/DragView;)V
    .locals 0
    .parameter

    .prologue
    .line 209
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DragView$2;->this$0:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 212
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragView$2;->this$0:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result v1

    #setter for: Lcom/cyanogenmod/trebuchet/DragView;->mCrossFadeProgress:F
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/DragView;->access$302(Lcom/cyanogenmod/trebuchet/DragView;F)F

    .line 213
    return-void
.end method
