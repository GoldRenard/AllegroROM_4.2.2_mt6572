.class Lcom/cyanogenmod/trebuchet/CellLayout$3;
.super Ljava/lang/Object;
.source "CellLayout.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/CellLayout;->animateChildToPosition(Landroid/view/View;IIIIZZ)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

.field final synthetic val$child:Landroid/view/View;

.field final synthetic val$lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

.field final synthetic val$newX:I

.field final synthetic val$newY:I

.field final synthetic val$oldX:I

.field final synthetic val$oldY:I


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;IIIILandroid/view/View;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1153
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$3;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$3;->val$lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    iput p3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$3;->val$oldX:I

    iput p4, p0, Lcom/cyanogenmod/trebuchet/CellLayout$3;->val$newX:I

    iput p5, p0, Lcom/cyanogenmod/trebuchet/CellLayout$3;->val$oldY:I

    iput p6, p0, Lcom/cyanogenmod/trebuchet/CellLayout$3;->val$newY:I

    iput-object p7, p0, Lcom/cyanogenmod/trebuchet/CellLayout$3;->val$child:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 5
    .parameter "animation"

    .prologue
    const/high16 v4, 0x3f80

    .line 1156
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 1157
    .local v0, r:F
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$3;->val$lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    sub-float v2, v4, v0

    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$3;->val$oldX:I

    int-to-float v3, v3

    mul-float/2addr v2, v3

    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$3;->val$newX:I

    int-to-float v3, v3

    mul-float/2addr v3, v0

    add-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, v1, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->x:I

    .line 1158
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$3;->val$lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    sub-float v2, v4, v0

    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$3;->val$oldY:I

    int-to-float v3, v3

    mul-float/2addr v2, v3

    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$3;->val$newY:I

    int-to-float v3, v3

    mul-float/2addr v3, v0

    add-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, v1, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->y:I

    .line 1159
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$3;->val$child:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->requestLayout()V

    .line 1160
    return-void
.end method
