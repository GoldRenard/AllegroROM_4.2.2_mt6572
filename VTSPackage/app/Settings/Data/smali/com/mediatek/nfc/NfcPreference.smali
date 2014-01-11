.class public Lcom/mediatek/nfc/NfcPreference;
.super Landroid/preference/Preference;
.source "NfcPreference.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "NfcPreference"


# instance fields
.field private mChecked:Z

.field private mContext:Landroid/content/Context;

.field private mInflater:Landroid/view/LayoutInflater;

.field private mPreferenceSwitch:Landroid/widget/Switch;

.field private mPreferenceTitle:Landroid/widget/TextView;

.field private mTitleValue:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mediatek/nfc/NfcPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 59
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/mediatek/nfc/NfcPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v0, 0x0

    .line 46
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 37
    iput-object v0, p0, Lcom/mediatek/nfc/NfcPreference;->mPreferenceTitle:Landroid/widget/TextView;

    .line 38
    iput-object v0, p0, Lcom/mediatek/nfc/NfcPreference;->mPreferenceSwitch:Landroid/widget/Switch;

    .line 40
    const-string v0, ""

    iput-object v0, p0, Lcom/mediatek/nfc/NfcPreference;->mTitleValue:Ljava/lang/CharSequence;

    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/nfc/NfcPreference;->mChecked:Z

    .line 47
    iput-object p1, p0, Lcom/mediatek/nfc/NfcPreference;->mContext:Landroid/content/Context;

    .line 49
    invoke-super {p0}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 50
    invoke-super {p0}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/nfc/NfcPreference;->mTitleValue:Ljava/lang/CharSequence;

    .line 52
    :cond_0
    return-void
.end method


# virtual methods
.method public getSwitch()Landroid/widget/Switch;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/mediatek/nfc/NfcPreference;->mPreferenceSwitch:Landroid/widget/Switch;

    return-object v0
.end method

.method public isChecked()Z
    .locals 1

    .prologue
    .line 79
    iget-boolean v0, p0, Lcom/mediatek/nfc/NfcPreference;->mChecked:Z

    return v0
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 3
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 84
    const-string v0, "NfcPreference"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "oncheckChanged to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    invoke-virtual {p0, p2}, Lcom/mediatek/nfc/NfcPreference;->setChecked(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/nfc/NfcPreference;->callChangeListener(Ljava/lang/Object;)Z

    .line 88
    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .parameter "parent"

    .prologue
    .line 64
    const-string v1, "NfcPreference"

    const-string v2, "onCreateView"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    iget-object v1, p0, Lcom/mediatek/nfc/NfcPreference;->mContext:Landroid/content/Context;

    const-string v2, "layout_inflater"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    iput-object v1, p0, Lcom/mediatek/nfc/NfcPreference;->mInflater:Landroid/view/LayoutInflater;

    .line 68
    iget-object v1, p0, Lcom/mediatek/nfc/NfcPreference;->mInflater:Landroid/view/LayoutInflater;

    const v2, 0x7f04006b

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 70
    .local v0, view:Landroid/view/View;
    const v1, 0x7f080106

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/mediatek/nfc/NfcPreference;->mPreferenceTitle:Landroid/widget/TextView;

    .line 71
    iget-object v1, p0, Lcom/mediatek/nfc/NfcPreference;->mPreferenceTitle:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mediatek/nfc/NfcPreference;->mTitleValue:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    const v1, 0x7f080107

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Switch;

    iput-object v1, p0, Lcom/mediatek/nfc/NfcPreference;->mPreferenceSwitch:Landroid/widget/Switch;

    .line 73
    iget-object v1, p0, Lcom/mediatek/nfc/NfcPreference;->mPreferenceSwitch:Landroid/widget/Switch;

    invoke-virtual {v1, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 74
    iget-object v1, p0, Lcom/mediatek/nfc/NfcPreference;->mPreferenceSwitch:Landroid/widget/Switch;

    iget-boolean v2, p0, Lcom/mediatek/nfc/NfcPreference;->mChecked:Z

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 75
    return-object v0
.end method

.method public setChecked(Z)Z
    .locals 3
    .parameter "checked"

    .prologue
    const/4 v0, 0x0

    .line 97
    iget-object v1, p0, Lcom/mediatek/nfc/NfcPreference;->mPreferenceSwitch:Landroid/widget/Switch;

    if-nez v1, :cond_1

    .line 98
    const-string v1, "NfcPreference"

    const-string v2, "setChecked return"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    iput-boolean p1, p0, Lcom/mediatek/nfc/NfcPreference;->mChecked:Z

    .line 108
    :cond_0
    :goto_0
    return v0

    .line 103
    :cond_1
    iget-boolean v1, p0, Lcom/mediatek/nfc/NfcPreference;->mChecked:Z

    if-eq v1, p1, :cond_0

    .line 104
    iget-object v0, p0, Lcom/mediatek/nfc/NfcPreference;->mPreferenceSwitch:Landroid/widget/Switch;

    invoke-virtual {v0, p1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 105
    iput-boolean p1, p0, Lcom/mediatek/nfc/NfcPreference;->mChecked:Z

    .line 106
    const/4 v0, 0x1

    goto :goto_0
.end method
