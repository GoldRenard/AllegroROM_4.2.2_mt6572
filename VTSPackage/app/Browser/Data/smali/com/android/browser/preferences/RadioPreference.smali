.class public Lcom/android/browser/preferences/RadioPreference;
.super Landroid/preference/Preference;
.source "RadioPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/preferences/RadioPreference$SavedState;
    }
.end annotation


# instance fields
.field private mAccessibilityManager:Landroid/view/accessibility/AccessibilityManager;

.field private mChecked:Z

.field private mDisableDependentsState:Z

.field private mSendAccessibilityEventViewClickedType:Z

.field private mSummaryOff:Ljava/lang/CharSequence;

.field private mSummaryOn:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 75
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 76
    invoke-virtual {p0}, Lcom/android/browser/preferences/RadioPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "accessibility"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    iput-object v0, p0, Lcom/android/browser/preferences/RadioPreference;->mAccessibilityManager:Landroid/view/accessibility/AccessibilityManager;

    .line 78
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 69
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 70
    invoke-virtual {p0}, Lcom/android/browser/preferences/RadioPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "accessibility"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    iput-object v0, p0, Lcom/android/browser/preferences/RadioPreference;->mAccessibilityManager:Landroid/view/accessibility/AccessibilityManager;

    .line 72
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 63
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 64
    invoke-virtual {p0}, Lcom/android/browser/preferences/RadioPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "accessibility"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    iput-object v0, p0, Lcom/android/browser/preferences/RadioPreference;->mAccessibilityManager:Landroid/view/accessibility/AccessibilityManager;

    .line 66
    return-void
.end method


# virtual methods
.method public getDisableDependentsState()Z
    .locals 1

    .prologue
    .line 215
    iget-boolean v0, p0, Lcom/android/browser/preferences/RadioPreference;->mDisableDependentsState:Z

    return v0
.end method

.method public getSummaryOff()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 204
    iget-object v0, p0, Lcom/android/browser/preferences/RadioPreference;->mSummaryOff:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getSummaryOn()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lcom/android/browser/preferences/RadioPreference;->mSummaryOn:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public isChecked()Z
    .locals 1

    .prologue
    .line 136
    iget-boolean v0, p0, Lcom/android/browser/preferences/RadioPreference;->mChecked:Z

    return v0
.end method

.method public isPersistent()Z
    .locals 1

    .prologue
    .line 82
    const/4 v0, 0x0

    return v0
.end method

.method protected onBindView(Landroid/view/View;)V
    .locals 4
    .parameter "view"

    .prologue
    .line 87
    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    .line 88
    const v2, 0x7f0d006f

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 89
    .local v0, checkboxView:Landroid/view/View;
    if-eqz v0, :cond_0

    instance-of v2, v0, Landroid/widget/Checkable;

    if-eqz v2, :cond_0

    move-object v2, v0

    .line 90
    check-cast v2, Landroid/widget/Checkable;

    iget-boolean v3, p0, Lcom/android/browser/preferences/RadioPreference;->mChecked:Z

    invoke-interface {v2, v3}, Landroid/widget/Checkable;->setChecked(Z)V

    .line 91
    iget-boolean v2, p0, Lcom/android/browser/preferences/RadioPreference;->mSendAccessibilityEventViewClickedType:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/browser/preferences/RadioPreference;->mAccessibilityManager:Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 94
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/browser/preferences/RadioPreference;->mSendAccessibilityEventViewClickedType:Z

    .line 96
    const/4 v1, 0x1

    .line 97
    .local v1, eventType:I
    invoke-static {v1}, Landroid/view/accessibility/AccessibilityEvent;->obtain(I)Landroid/view/accessibility/AccessibilityEvent;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/view/View;->sendAccessibilityEventUnchecked(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 101
    .end local v1           #eventType:I
    :cond_0
    return-void
.end method

.method protected onClick()V
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 105
    invoke-super {p0}, Landroid/preference/Preference;->onClick()V

    .line 106
    invoke-virtual {p0}, Lcom/android/browser/preferences/RadioPreference;->isChecked()Z

    move-result v2

    if-nez v2, :cond_0

    move v0, v1

    .line 107
    .local v0, newValue:Z
    :goto_0
    iput-boolean v1, p0, Lcom/android/browser/preferences/RadioPreference;->mSendAccessibilityEventViewClickedType:Z

    .line 109
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/browser/preferences/RadioPreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 113
    :goto_1
    return-void

    .line 106
    .end local v0           #newValue:Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 112
    .restart local v0       #newValue:Z
    :cond_1
    invoke-virtual {p0, v0}, Lcom/android/browser/preferences/RadioPreference;->setChecked(Z)V

    goto :goto_1
.end method

.method protected onGetDefaultValue(Landroid/content/res/TypedArray;I)Ljava/lang/Object;
    .locals 1
    .parameter "a"
    .parameter "index"

    .prologue
    .line 231
    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 3
    .parameter "state"

    .prologue
    .line 255
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/android/browser/preferences/RadioPreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 257
    :cond_0
    invoke-super {p0, p1}, Landroid/preference/Preference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 264
    :goto_0
    return-void

    :cond_1
    move-object v0, p1

    .line 261
    check-cast v0, Lcom/android/browser/preferences/RadioPreference$SavedState;

    .line 262
    .local v0, myState:Lcom/android/browser/preferences/RadioPreference$SavedState;
    invoke-virtual {v0}, Lcom/android/browser/preferences/RadioPreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/preference/Preference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 263
    iget-boolean v1, v0, Lcom/android/browser/preferences/RadioPreference$SavedState;->mSaveStateChecked:Z

    invoke-virtual {p0, v1}, Lcom/android/browser/preferences/RadioPreference;->setChecked(Z)V

    goto :goto_0
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 3

    .prologue
    .line 242
    invoke-super {p0}, Landroid/preference/Preference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 243
    .local v1, superState:Landroid/os/Parcelable;
    invoke-virtual {p0}, Lcom/android/browser/preferences/RadioPreference;->isPersistent()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 250
    .end local v1           #superState:Landroid/os/Parcelable;
    :goto_0
    return-object v1

    .line 248
    .restart local v1       #superState:Landroid/os/Parcelable;
    :cond_0
    new-instance v0, Lcom/android/browser/preferences/RadioPreference$SavedState;

    invoke-direct {v0, v1}, Lcom/android/browser/preferences/RadioPreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 249
    .local v0, myState:Lcom/android/browser/preferences/RadioPreference$SavedState;
    invoke-virtual {p0}, Lcom/android/browser/preferences/RadioPreference;->isChecked()Z

    move-result v2

    iput-boolean v2, v0, Lcom/android/browser/preferences/RadioPreference$SavedState;->mSaveStateChecked:Z

    move-object v1, v0

    .line 250
    goto :goto_0
.end method

.method protected onSetInitialValue(ZLjava/lang/Object;)V
    .locals 1
    .parameter "restoreValue"
    .parameter "defaultValue"

    .prologue
    .line 236
    if-eqz p1, :cond_0

    iget-boolean v0, p0, Lcom/android/browser/preferences/RadioPreference;->mChecked:Z

    invoke-virtual {p0, v0}, Lcom/android/browser/preferences/RadioPreference;->getPersistedBoolean(Z)Z

    move-result v0

    .end local p2
    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/browser/preferences/RadioPreference;->setChecked(Z)V

    .line 238
    return-void

    .line 236
    .restart local p2
    :cond_0
    check-cast p2, Ljava/lang/Boolean;

    .end local p2
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_0
.end method

.method public setChecked(Z)V
    .locals 1
    .parameter "checked"

    .prologue
    .line 122
    iget-boolean v0, p0, Lcom/android/browser/preferences/RadioPreference;->mChecked:Z

    if-eq v0, p1, :cond_0

    .line 123
    iput-boolean p1, p0, Lcom/android/browser/preferences/RadioPreference;->mChecked:Z

    .line 124
    invoke-virtual {p0, p1}, Lcom/android/browser/preferences/RadioPreference;->persistBoolean(Z)Z

    .line 125
    invoke-virtual {p0}, Lcom/android/browser/preferences/RadioPreference;->shouldDisableDependents()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/browser/preferences/RadioPreference;->notifyDependencyChange(Z)V

    .line 126
    invoke-virtual {p0}, Lcom/android/browser/preferences/RadioPreference;->notifyChanged()V

    .line 128
    :cond_0
    return-void
.end method

.method public setDisableDependentsState(Z)V
    .locals 0
    .parameter "disableDependentsState"

    .prologue
    .line 226
    iput-boolean p1, p0, Lcom/android/browser/preferences/RadioPreference;->mDisableDependentsState:Z

    .line 227
    return-void
.end method

.method public setSummaryOff(I)V
    .locals 1
    .parameter "summaryResId"

    .prologue
    .line 195
    invoke-virtual {p0}, Lcom/android/browser/preferences/RadioPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/browser/preferences/RadioPreference;->setSummaryOff(Ljava/lang/CharSequence;)V

    .line 196
    return-void
.end method

.method public setSummaryOff(Ljava/lang/CharSequence;)V
    .locals 1
    .parameter "summary"

    .prologue
    .line 183
    iput-object p1, p0, Lcom/android/browser/preferences/RadioPreference;->mSummaryOff:Ljava/lang/CharSequence;

    .line 184
    invoke-virtual {p0}, Lcom/android/browser/preferences/RadioPreference;->isChecked()Z

    move-result v0

    if-nez v0, :cond_0

    .line 185
    invoke-virtual {p0}, Lcom/android/browser/preferences/RadioPreference;->notifyChanged()V

    .line 187
    :cond_0
    return-void
.end method

.method public setSummaryOn(I)V
    .locals 1
    .parameter "summaryResId"

    .prologue
    .line 164
    invoke-virtual {p0}, Lcom/android/browser/preferences/RadioPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/browser/preferences/RadioPreference;->setSummaryOn(Ljava/lang/CharSequence;)V

    .line 165
    return-void
.end method

.method public setSummaryOn(Ljava/lang/CharSequence;)V
    .locals 1
    .parameter "summary"

    .prologue
    .line 152
    iput-object p1, p0, Lcom/android/browser/preferences/RadioPreference;->mSummaryOn:Ljava/lang/CharSequence;

    .line 153
    invoke-virtual {p0}, Lcom/android/browser/preferences/RadioPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 154
    invoke-virtual {p0}, Lcom/android/browser/preferences/RadioPreference;->notifyChanged()V

    .line 156
    :cond_0
    return-void
.end method

.method public shouldDisableDependents()Z
    .locals 4

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 141
    iget-boolean v3, p0, Lcom/android/browser/preferences/RadioPreference;->mDisableDependentsState:Z

    if-eqz v3, :cond_2

    iget-boolean v0, p0, Lcom/android/browser/preferences/RadioPreference;->mChecked:Z

    .line 142
    .local v0, shouldDisable:Z
    :goto_0
    if-nez v0, :cond_0

    invoke-super {p0}, Landroid/preference/Preference;->shouldDisableDependents()Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    move v1, v2

    :cond_1
    return v1

    .line 141
    .end local v0           #shouldDisable:Z
    :cond_2
    iget-boolean v3, p0, Lcom/android/browser/preferences/RadioPreference;->mChecked:Z

    if-nez v3, :cond_3

    move v0, v2

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method
