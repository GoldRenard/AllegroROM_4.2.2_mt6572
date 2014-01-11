.class public Lcom/mediatek/oobe/utils/ButtonPreference;
.super Landroid/preference/Preference;
.source "ButtonPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/oobe/utils/ButtonPreference$PrefButtonClickedListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "OOBE/ButtonPreference"


# instance fields
.field private mAddNetworkButton:Landroid/widget/Button;

.field public mButtonClickListener:Landroid/view/View$OnClickListener;

.field private mPrefButtonClickedListener:Lcom/mediatek/oobe/utils/ButtonPreference$PrefButtonClickedListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 77
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 61
    new-instance v0, Lcom/mediatek/oobe/utils/ButtonPreference$1;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/utils/ButtonPreference$1;-><init>(Lcom/mediatek/oobe/utils/ButtonPreference;)V

    iput-object v0, p0, Lcom/mediatek/oobe/utils/ButtonPreference;->mButtonClickListener:Landroid/view/View$OnClickListener;

    .line 78
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 86
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 61
    new-instance v0, Lcom/mediatek/oobe/utils/ButtonPreference$1;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/utils/ButtonPreference$1;-><init>(Lcom/mediatek/oobe/utils/ButtonPreference;)V

    iput-object v0, p0, Lcom/mediatek/oobe/utils/ButtonPreference;->mButtonClickListener:Landroid/view/View$OnClickListener;

    .line 87
    const v0, 0x7f03000a

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/utils/ButtonPreference;->setLayoutResource(I)V

    .line 88
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/oobe/utils/ButtonPreference;)Landroid/widget/Button;
    .locals 1
    .parameter "x0"

    .prologue
    .line 49
    iget-object v0, p0, Lcom/mediatek/oobe/utils/ButtonPreference;->mAddNetworkButton:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mediatek/oobe/utils/ButtonPreference;)Lcom/mediatek/oobe/utils/ButtonPreference$PrefButtonClickedListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 49
    iget-object v0, p0, Lcom/mediatek/oobe/utils/ButtonPreference;->mPrefButtonClickedListener:Lcom/mediatek/oobe/utils/ButtonPreference$PrefButtonClickedListener;

    return-object v0
.end method


# virtual methods
.method protected onBindView(Landroid/view/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 94
    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    .line 95
    const v0, 0x7f0b001b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mediatek/oobe/utils/ButtonPreference;->mAddNetworkButton:Landroid/widget/Button;

    .line 96
    iget-object v0, p0, Lcom/mediatek/oobe/utils/ButtonPreference;->mAddNetworkButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/mediatek/oobe/utils/ButtonPreference;->mButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    return-void
.end method

.method public setPrefButtonCallback(Lcom/mediatek/oobe/utils/ButtonPreference$PrefButtonClickedListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 105
    iput-object p1, p0, Lcom/mediatek/oobe/utils/ButtonPreference;->mPrefButtonClickedListener:Lcom/mediatek/oobe/utils/ButtonPreference$PrefButtonClickedListener;

    .line 106
    return-void
.end method
