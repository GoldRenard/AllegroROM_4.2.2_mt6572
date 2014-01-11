.class public Lcom/android/browser/view/PieItem;
.super Ljava/lang/Object;
.source "PieItem.java"


# instance fields
.field private animate:F

.field private inner:I

.field private level:I

.field private mEnabled:Z

.field private mItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/browser/view/PieItem;",
            ">;"
        }
    .end annotation
.end field

.field private mPieView:Lcom/android/browser/view/PieMenu$PieView;

.field private mSelected:Z

.field private mView:Landroid/view/View;

.field private outer:I

.field private start:F

.field private sweep:F


# direct methods
.method public constructor <init>(Landroid/view/View;I)V
    .locals 1
    .parameter "view"
    .parameter "level"

    .prologue
    .line 43
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/android/browser/view/PieItem;->mView:Landroid/view/View;

    .line 45
    iput p2, p0, Lcom/android/browser/view/PieItem;->level:I

    .line 46
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/browser/view/PieItem;->mEnabled:Z

    .line 47
    invoke-virtual {p0}, Lcom/android/browser/view/PieItem;->getAnimationAngle()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/browser/view/PieItem;->setAnimationAngle(F)V

    .line 48
    invoke-virtual {p0}, Lcom/android/browser/view/PieItem;->getAlpha()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/browser/view/PieItem;->setAlpha(F)V

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/view/View;ILcom/android/browser/view/PieMenu$PieView;)V
    .locals 1
    .parameter "view"
    .parameter "level"
    .parameter "sym"

    .prologue
    .line 51
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/android/browser/view/PieItem;->mView:Landroid/view/View;

    .line 53
    iput p2, p0, Lcom/android/browser/view/PieItem;->level:I

    .line 54
    iput-object p3, p0, Lcom/android/browser/view/PieItem;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/view/PieItem;->mEnabled:Z

    .line 56
    return-void
.end method


# virtual methods
.method public addItem(Lcom/android/browser/view/PieItem;)V
    .locals 1
    .parameter "item"

    .prologue
    .line 67
    iget-object v0, p0, Lcom/android/browser/view/PieItem;->mItems:Ljava/util/List;

    if-nez v0, :cond_0

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/browser/view/PieItem;->mItems:Ljava/util/List;

    .line 70
    :cond_0
    iget-object v0, p0, Lcom/android/browser/view/PieItem;->mItems:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    return-void
.end method

.method public getAlpha()F
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/android/browser/view/PieItem;->mView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/android/browser/view/PieItem;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    move-result v0

    .line 83
    :goto_0
    return v0

    :cond_0
    const/high16 v0, 0x3f80

    goto :goto_0
.end method

.method public getAnimationAngle()F
    .locals 1

    .prologue
    .line 91
    iget v0, p0, Lcom/android/browser/view/PieItem;->animate:F

    return v0
.end method

.method public getInnerRadius()I
    .locals 1

    .prologue
    .line 133
    iget v0, p0, Lcom/android/browser/view/PieItem;->inner:I

    return v0
.end method

.method public getItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/browser/view/PieItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 63
    iget-object v0, p0, Lcom/android/browser/view/PieItem;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getLevel()I
    .locals 1

    .prologue
    .line 110
    iget v0, p0, Lcom/android/browser/view/PieItem;->level:I

    return v0
.end method

.method public getOuterRadius()I
    .locals 1

    .prologue
    .line 137
    iget v0, p0, Lcom/android/browser/view/PieItem;->outer:I

    return v0
.end method

.method public getPieView()Lcom/android/browser/view/PieMenu$PieView;
    .locals 1

    .prologue
    .line 153
    iget-boolean v0, p0, Lcom/android/browser/view/PieItem;->mEnabled:Z

    if-eqz v0, :cond_0

    .line 154
    iget-object v0, p0, Lcom/android/browser/view/PieItem;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    .line 156
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getStart()F
    .locals 1

    .prologue
    .line 121
    iget v0, p0, Lcom/android/browser/view/PieItem;->start:F

    return v0
.end method

.method public getStartAngle()F
    .locals 2

    .prologue
    .line 125
    iget v0, p0, Lcom/android/browser/view/PieItem;->start:F

    iget v1, p0, Lcom/android/browser/view/PieItem;->animate:F

    add-float/2addr v0, v1

    return v0
.end method

.method public getSweep()F
    .locals 1

    .prologue
    .line 129
    iget v0, p0, Lcom/android/browser/view/PieItem;->sweep:F

    return v0
.end method

.method public getView()Landroid/view/View;
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lcom/android/browser/view/PieItem;->mView:Landroid/view/View;

    return-object v0
.end method

.method public hasItems()Z
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/android/browser/view/PieItem;->mItems:Ljava/util/List;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPieView()Z
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lcom/android/browser/view/PieItem;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSelected()Z
    .locals 1

    .prologue
    .line 106
    iget-boolean v0, p0, Lcom/android/browser/view/PieItem;->mSelected:Z

    return v0
.end method

.method public setAlpha(F)V
    .locals 1
    .parameter "alpha"

    .prologue
    .line 74
    iget-object v0, p0, Lcom/android/browser/view/PieItem;->mView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lcom/android/browser/view/PieItem;->mView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 77
    :cond_0
    return-void
.end method

.method public setAnimationAngle(F)V
    .locals 0
    .parameter "a"

    .prologue
    .line 87
    iput p1, p0, Lcom/android/browser/view/PieItem;->animate:F

    .line 88
    return-void
.end method

.method public setEnabled(Z)V
    .locals 0
    .parameter "enabled"

    .prologue
    .line 95
    iput-boolean p1, p0, Lcom/android/browser/view/PieItem;->mEnabled:Z

    .line 96
    return-void
.end method

.method public setGeometry(FFII)V
    .locals 0
    .parameter "st"
    .parameter "sw"
    .parameter "inside"
    .parameter "outside"

    .prologue
    .line 114
    iput p1, p0, Lcom/android/browser/view/PieItem;->start:F

    .line 115
    iput p2, p0, Lcom/android/browser/view/PieItem;->sweep:F

    .line 116
    iput p3, p0, Lcom/android/browser/view/PieItem;->inner:I

    .line 117
    iput p4, p0, Lcom/android/browser/view/PieItem;->outer:I

    .line 118
    return-void
.end method

.method public setPieView(Lcom/android/browser/view/PieMenu$PieView;)V
    .locals 0
    .parameter "sym"

    .prologue
    .line 149
    iput-object p1, p0, Lcom/android/browser/view/PieItem;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    .line 150
    return-void
.end method

.method public setSelected(Z)V
    .locals 1
    .parameter "s"

    .prologue
    .line 99
    iput-boolean p1, p0, Lcom/android/browser/view/PieItem;->mSelected:Z

    .line 100
    iget-object v0, p0, Lcom/android/browser/view/PieItem;->mView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 101
    iget-object v0, p0, Lcom/android/browser/view/PieItem;->mView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 103
    :cond_0
    return-void
.end method
