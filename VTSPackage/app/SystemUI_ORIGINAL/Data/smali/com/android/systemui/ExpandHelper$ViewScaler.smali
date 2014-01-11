.class Lcom/android/systemui/ExpandHelper$ViewScaler;
.super Ljava/lang/Object;
.source "ExpandHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/ExpandHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewScaler"
.end annotation


# instance fields
.field mView:Landroid/view/View;

.field final synthetic this$0:Lcom/android/systemui/ExpandHelper;


# direct methods
.method public constructor <init>(Lcom/android/systemui/ExpandHelper;)V
    .locals 0
    .parameter

    .prologue
    .line 141
    iput-object p1, p0, Lcom/android/systemui/ExpandHelper$ViewScaler;->this$0:Lcom/android/systemui/ExpandHelper;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getHeight()F
    .locals 2

    .prologue
    .line 153
    iget-object v1, p0, Lcom/android/systemui/ExpandHelper$ViewScaler;->mView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 154
    .local v0, height:I
    if-gez v0, :cond_0

    .line 155
    iget-object v1, p0, Lcom/android/systemui/ExpandHelper$ViewScaler;->mView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    .line 157
    :cond_0
    int-to-float v1, v0

    return v1
.end method

.method public getNaturalHeight(I)I
    .locals 5
    .parameter "maximum"

    .prologue
    .line 160
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper$ViewScaler;->mView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 163
    .local v0, lp:Landroid/view/ViewGroup$LayoutParams;
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 164
    .local v1, oldHeight:I
    const/4 v2, -0x2

    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 165
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper$ViewScaler;->mView:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 166
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper$ViewScaler;->mView:Landroid/view/View;

    iget-object v3, p0, Lcom/android/systemui/ExpandHelper$ViewScaler;->mView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    const/high16 v4, 0x4000

    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    const/high16 v4, -0x8000

    invoke-static {p1, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/view/View;->measure(II)V

    .line 171
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 172
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper$ViewScaler;->mView:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper$ViewScaler;->mView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    return v2
.end method

.method public setHeight(F)V
    .locals 2
    .parameter "h"

    .prologue
    .line 147
    iget-object v1, p0, Lcom/android/systemui/ExpandHelper$ViewScaler;->mView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 148
    .local v0, lp:Landroid/view/ViewGroup$LayoutParams;
    float-to-int v1, p1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 149
    iget-object v1, p0, Lcom/android/systemui/ExpandHelper$ViewScaler;->mView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 150
    iget-object v1, p0, Lcom/android/systemui/ExpandHelper$ViewScaler;->mView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->requestLayout()V

    .line 151
    return-void
.end method

.method public setView(Landroid/view/View;)V
    .locals 0
    .parameter "v"

    .prologue
    .line 143
    iput-object p1, p0, Lcom/android/systemui/ExpandHelper$ViewScaler;->mView:Landroid/view/View;

    .line 144
    return-void
.end method
