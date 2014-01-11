.class public Lcom/mediatek/oobe/advanced/ProviderPreference;
.super Landroid/preference/Preference;
.source "ProviderPreference.java"


# instance fields
.field private mAccountType:Ljava/lang/String;

.field private mProviderIcon:Landroid/graphics/drawable/Drawable;

.field private mProviderIconView:Landroid/widget/ImageView;

.field private mProviderName:Ljava/lang/CharSequence;

.field private mTapAdd:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;)V
    .locals 4
    .parameter "context"
    .parameter "accountType"
    .parameter "icon"
    .parameter "providerName"

    .prologue
    const/4 v3, 0x0

    .line 74
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 75
    iput-object p2, p0, Lcom/mediatek/oobe/advanced/ProviderPreference;->mAccountType:Ljava/lang/String;

    .line 76
    iput-object p3, p0, Lcom/mediatek/oobe/advanced/ProviderPreference;->mProviderIcon:Landroid/graphics/drawable/Drawable;

    .line 77
    iput-object p4, p0, Lcom/mediatek/oobe/advanced/ProviderPreference;->mProviderName:Ljava/lang/CharSequence;

    .line 78
    const v0, 0x7f030015

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/advanced/ProviderPreference;->setLayoutResource(I)V

    .line 79
    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/advanced/ProviderPreference;->setPersistent(Z)V

    .line 80
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/ProviderPreference;->mProviderName:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/advanced/ProviderPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 81
    const v0, 0x7f090081

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/mediatek/oobe/advanced/ProviderPreference;->mProviderName:Ljava/lang/CharSequence;

    aput-object v2, v1, v3

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/oobe/advanced/ProviderPreference;->mTapAdd:Ljava/lang/String;

    .line 82
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/ProviderPreference;->mTapAdd:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/advanced/ProviderPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 83
    return-void
.end method


# virtual methods
.method public getAccountType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/ProviderPreference;->mAccountType:Ljava/lang/String;

    return-object v0
.end method

.method protected onBindView(Landroid/view/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 87
    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    .line 88
    const/high16 v0, 0x7f0b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/mediatek/oobe/advanced/ProviderPreference;->mProviderIconView:Landroid/widget/ImageView;

    .line 89
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/ProviderPreference;->mProviderIconView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/mediatek/oobe/advanced/ProviderPreference;->mProviderIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 92
    return-void
.end method
