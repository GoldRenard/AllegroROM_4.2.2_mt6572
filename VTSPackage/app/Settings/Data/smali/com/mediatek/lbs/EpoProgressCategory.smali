.class public Lcom/mediatek/lbs/EpoProgressCategory;
.super Lcom/android/settings/ProgressCategoryBase;
.source "EpoProgressCategory.java"


# instance fields
.field private mProgress:Z

.field private mText:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Lcom/android/settings/ProgressCategoryBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/lbs/EpoProgressCategory;->mProgress:Z

    .line 42
    const v0, 0x7f04006e

    invoke-virtual {p0, v0}, Lcom/mediatek/lbs/EpoProgressCategory;->setLayoutResource(I)V

    .line 43
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b02dc

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/lbs/EpoProgressCategory;->mText:Ljava/lang/String;

    .line 44
    return-void
.end method


# virtual methods
.method public onBindView(Landroid/view/View;)V
    .locals 4
    .parameter "view"

    .prologue
    .line 48
    invoke-super {p0, p1}, Lcom/android/settings/ProgressCategoryBase;->onBindView(Landroid/view/View;)V

    .line 49
    const v3, 0x7f08010c

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 50
    .local v1, textView:Landroid/widget/TextView;
    const v3, 0x7f08010b

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 52
    .local v0, progressBar:Landroid/view/View;
    iget-boolean v3, p0, Lcom/mediatek/lbs/EpoProgressCategory;->mProgress:Z

    if-eqz v3, :cond_0

    const/4 v2, 0x0

    .line 53
    .local v2, visibility:I
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 54
    iget-object v3, p0, Lcom/mediatek/lbs/EpoProgressCategory;->mText:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 56
    return-void

    .line 52
    .end local v2           #visibility:I
    :cond_0
    const/4 v2, 0x4

    goto :goto_0
.end method

.method public setProgress(Z)V
    .locals 0
    .parameter "progressOn"

    .prologue
    .line 65
    iput-boolean p1, p0, Lcom/mediatek/lbs/EpoProgressCategory;->mProgress:Z

    .line 66
    invoke-virtual {p0}, Lcom/mediatek/lbs/EpoProgressCategory;->notifyChanged()V

    .line 67
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0
    .parameter "text"

    .prologue
    .line 76
    iput-object p1, p0, Lcom/mediatek/lbs/EpoProgressCategory;->mText:Ljava/lang/String;

    .line 77
    return-void
.end method
