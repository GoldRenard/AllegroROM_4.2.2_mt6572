.class Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;
.super Landroid/widget/FrameLayout;
.source "QuickSettingsTileView.java"


# instance fields
.field private mCellWidth:I

.field private mColSpan:I

.field private mRowSpan:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v0, 0x1

    .line 34
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
    iput v0, p0, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;->mColSpan:I

    .line 37
    iput v0, p0, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;->mRowSpan:I

    .line 38
    return-void
.end method


# virtual methods
.method getColumnSpan()I
    .locals 1

    .prologue
    .line 45
    iget v0, p0, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;->mColSpan:I

    return v0
.end method

.method setColumnSpan(I)V
    .locals 0
    .parameter "span"

    .prologue
    .line 41
    iput p1, p0, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;->mColSpan:I

    .line 42
    return-void
.end method

.method setContent(ILandroid/view/LayoutInflater;)V
    .locals 0
    .parameter "layoutId"
    .parameter "inflater"

    .prologue
    .line 49
    invoke-virtual {p2, p1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 50
    return-void
.end method
