.class public Lcom/mediatek/lbs/CustomSwitchPreference;
.super Landroid/preference/Preference;
.source "CustomSwitchPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/lbs/CustomSwitchPreference$1;,
        Lcom/mediatek/lbs/CustomSwitchPreference$Listener;
    }
.end annotation


# instance fields
.field private mChecked:Z

.field private mSwitchChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 70
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 51
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/lbs/CustomSwitchPreference;->mChecked:Z

    .line 52
    new-instance v0, Lcom/mediatek/lbs/CustomSwitchPreference$Listener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mediatek/lbs/CustomSwitchPreference$Listener;-><init>(Lcom/mediatek/lbs/CustomSwitchPreference;Lcom/mediatek/lbs/CustomSwitchPreference$1;)V

    iput-object v0, p0, Lcom/mediatek/lbs/CustomSwitchPreference;->mSwitchChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 71
    const v0, 0x7f040024

    invoke-virtual {p0, v0}, Lcom/mediatek/lbs/CustomSwitchPreference;->setLayoutResource(I)V

    .line 73
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 65
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 51
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/lbs/CustomSwitchPreference;->mChecked:Z

    .line 52
    new-instance v0, Lcom/mediatek/lbs/CustomSwitchPreference$Listener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mediatek/lbs/CustomSwitchPreference$Listener;-><init>(Lcom/mediatek/lbs/CustomSwitchPreference;Lcom/mediatek/lbs/CustomSwitchPreference$1;)V

    iput-object v0, p0, Lcom/mediatek/lbs/CustomSwitchPreference;->mSwitchChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 66
    const v0, 0x7f040024

    invoke-virtual {p0, v0}, Lcom/mediatek/lbs/CustomSwitchPreference;->setLayoutResource(I)V

    .line 67
    return-void
.end method


# virtual methods
.method public isChecked()Z
    .locals 1

    .prologue
    .line 92
    iget-boolean v0, p0, Lcom/mediatek/lbs/CustomSwitchPreference;->mChecked:Z

    return v0
.end method

.method protected onBindView(Landroid/view/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 77
    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    .line 78
    const v1, 0x7f080047

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    .line 79
    .local v0, switchbutton:Landroid/widget/Switch;
    iget-object v1, p0, Lcom/mediatek/lbs/CustomSwitchPreference;->mSwitchChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 80
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setClickable(Z)V

    .line 81
    iget-boolean v1, p0, Lcom/mediatek/lbs/CustomSwitchPreference;->mChecked:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 82
    iget-object v1, p0, Lcom/mediatek/lbs/CustomSwitchPreference;->mSwitchChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 84
    :cond_0
    return-void
.end method

.method public setChecked(Z)V
    .locals 0
    .parameter "checked"

    .prologue
    .line 87
    iput-boolean p1, p0, Lcom/mediatek/lbs/CustomSwitchPreference;->mChecked:Z

    .line 88
    invoke-virtual {p0}, Lcom/mediatek/lbs/CustomSwitchPreference;->notifyChanged()V

    .line 89
    return-void
.end method
