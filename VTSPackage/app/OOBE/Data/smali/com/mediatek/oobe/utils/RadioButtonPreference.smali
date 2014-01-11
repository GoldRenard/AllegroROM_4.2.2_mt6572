.class public Lcom/mediatek/oobe/utils/RadioButtonPreference;
.super Landroid/preference/Preference;
.source "RadioButtonPreference.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "OOBE"


# instance fields
.field private mIsChecked:Z

.field private mNote:Ljava/lang/String;

.field private mRadioButton:Landroid/widget/RadioButton;

.field private mSummary:Ljava/lang/String;

.field private mTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 62
    const-string v0, "title"

    const-string v1, "summary"

    invoke-direct {p0, p1, v0, v1}, Lcom/mediatek/oobe/utils/RadioButtonPreference;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 71
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 72
    const v0, 0x7f03000f

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->setLayoutResource(I)V

    .line 73
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "context"
    .parameter "title"
    .parameter "summary"

    .prologue
    .line 82
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/mediatek/oobe/utils/RadioButtonPreference;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 83
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1
    .parameter "context"
    .parameter "title"
    .parameter "summary"
    .parameter "isChecked"

    .prologue
    .line 93
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 94
    iput-object p2, p0, Lcom/mediatek/oobe/utils/RadioButtonPreference;->mTitle:Ljava/lang/String;

    .line 95
    iput-object p3, p0, Lcom/mediatek/oobe/utils/RadioButtonPreference;->mSummary:Ljava/lang/String;

    .line 96
    iput-boolean p4, p0, Lcom/mediatek/oobe/utils/RadioButtonPreference;->mIsChecked:Z

    .line 97
    const v0, 0x7f03000f

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->setLayoutResource(I)V

    .line 99
    iget-object v0, p0, Lcom/mediatek/oobe/utils/RadioButtonPreference;->mTitle:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 100
    iget-object v0, p0, Lcom/mediatek/oobe/utils/RadioButtonPreference;->mTitle:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 102
    :cond_0
    iget-object v0, p0, Lcom/mediatek/oobe/utils/RadioButtonPreference;->mSummary:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 103
    iget-object v0, p0, Lcom/mediatek/oobe/utils/RadioButtonPreference;->mSummary:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 105
    :cond_1
    return-void
.end method


# virtual methods
.method public getNote()Ljava/lang/String;
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lcom/mediatek/oobe/utils/RadioButtonPreference;->mNote:Ljava/lang/String;

    return-object v0
.end method

.method protected onBindView(Landroid/view/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 110
    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    .line 111
    const/high16 v0, 0x101

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/mediatek/oobe/utils/RadioButtonPreference;->mRadioButton:Landroid/widget/RadioButton;

    .line 112
    iget-object v0, p0, Lcom/mediatek/oobe/utils/RadioButtonPreference;->mRadioButton:Landroid/widget/RadioButton;

    iget-boolean v1, p0, Lcom/mediatek/oobe/utils/RadioButtonPreference;->mIsChecked:Z

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 113
    return-void
.end method

.method public setChecked(Z)V
    .locals 0
    .parameter "newCheckStatus"

    .prologue
    .line 120
    iput-boolean p1, p0, Lcom/mediatek/oobe/utils/RadioButtonPreference;->mIsChecked:Z

    .line 121
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->notifyChanged()V

    .line 122
    return-void
.end method

.method public setNote(Ljava/lang/String;)V
    .locals 0
    .parameter "note"

    .prologue
    .line 129
    iput-object p1, p0, Lcom/mediatek/oobe/utils/RadioButtonPreference;->mNote:Ljava/lang/String;

    .line 130
    return-void
.end method
