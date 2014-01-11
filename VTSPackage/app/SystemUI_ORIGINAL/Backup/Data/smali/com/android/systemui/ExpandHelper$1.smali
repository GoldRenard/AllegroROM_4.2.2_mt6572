.class Lcom/android/systemui/ExpandHelper$1;
.super Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;
.source "ExpandHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/ExpandHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/ExpandHelper;


# direct methods
.method constructor <init>(Lcom/android/systemui/ExpandHelper;)V
    .locals 0
    .parameter

    .prologue
    .line 113
    iput-object p1, p0, Lcom/android/systemui/ExpandHelper$1;->this$0:Lcom/android/systemui/ExpandHelper;

    invoke-direct {p0}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 1
    .parameter "detector"

    .prologue
    .line 130
    const/4 v0, 0x1

    return v0
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 5
    .parameter "detector"

    .prologue
    .line 117
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v0

    .line 118
    .local v0, focusX:F
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v1

    .line 120
    .local v1, focusY:F
    iget-object v3, p0, Lcom/android/systemui/ExpandHelper$1;->this$0:Lcom/android/systemui/ExpandHelper;

    #calls: Lcom/android/systemui/ExpandHelper;->findView(FF)Landroid/view/View;
    invoke-static {v3, v0, v1}, Lcom/android/systemui/ExpandHelper;->access$000(Lcom/android/systemui/ExpandHelper;FF)Landroid/view/View;

    move-result-object v2

    .line 121
    .local v2, underFocus:Landroid/view/View;
    if-eqz v2, :cond_0

    .line 122
    iget-object v3, p0, Lcom/android/systemui/ExpandHelper$1;->this$0:Lcom/android/systemui/ExpandHelper;

    const/4 v4, 0x4

    #calls: Lcom/android/systemui/ExpandHelper;->startExpanding(Landroid/view/View;I)V
    invoke-static {v3, v2, v4}, Lcom/android/systemui/ExpandHelper;->access$100(Lcom/android/systemui/ExpandHelper;Landroid/view/View;I)V

    .line 124
    :cond_0
    iget-object v3, p0, Lcom/android/systemui/ExpandHelper$1;->this$0:Lcom/android/systemui/ExpandHelper;

    #getter for: Lcom/android/systemui/ExpandHelper;->mExpanding:Z
    invoke-static {v3}, Lcom/android/systemui/ExpandHelper;->access$200(Lcom/android/systemui/ExpandHelper;)Z

    move-result v3

    return v3
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 0
    .parameter "detector"

    .prologue
    .line 135
    return-void
.end method
