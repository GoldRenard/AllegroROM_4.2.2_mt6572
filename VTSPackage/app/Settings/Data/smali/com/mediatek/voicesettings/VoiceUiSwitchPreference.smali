.class public Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;
.super Landroid/preference/Preference;
.source "VoiceUiSwitchPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$OnCheckedChangeListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VoiceUiSwitchPreference"

.field private static final VOICE_CONTROL_ENABLED:Ljava/lang/String; = "voice_control_enabled"


# instance fields
.field private mChecked:Z

.field private mSwitchButtonListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field private mSwitchChangeListener:Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$OnCheckedChangeListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 106
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->mChecked:Z

    .line 55
    new-instance v0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$1;

    invoke-direct {v0, p0}, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$1;-><init>(Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;)V

    iput-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->mSwitchButtonListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 107
    const v0, 0x7f040024

    invoke-virtual {p0, v0}, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->setLayoutResource(I)V

    .line 109
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 96
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->mChecked:Z

    .line 55
    new-instance v0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$1;

    invoke-direct {v0, p0}, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$1;-><init>(Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;)V

    iput-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->mSwitchButtonListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 97
    const v0, 0x7f040024

    invoke-virtual {p0, v0}, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->setLayoutResource(I)V

    .line 98
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 48
    iget-boolean v0, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->mChecked:Z

    return v0
.end method


# virtual methods
.method public isChecked()Z
    .locals 1

    .prologue
    .line 153
    iget-boolean v0, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->mChecked:Z

    return v0
.end method

.method protected onBindView(Landroid/view/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 113
    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    .line 114
    const v1, 0x7f080047

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    .line 115
    .local v0, actionSwitch:Landroid/widget/Switch;
    iget-object v1, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->mSwitchButtonListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 116
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setClickable(Z)V

    .line 117
    iget-object v1, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->mSwitchButtonListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 118
    iget-boolean v1, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->mChecked:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 120
    :cond_0
    return-void
.end method

.method public setChecked(Z)V
    .locals 2
    .parameter "checked"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->mSwitchChangeListener:Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$OnCheckedChangeListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->mSwitchChangeListener:Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$OnCheckedChangeListener;

    invoke-interface {v0, p1}, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$OnCheckedChangeListener;->onBeforeCheckedChanged(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 129
    iput-boolean p1, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->mChecked:Z

    .line 130
    iget-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->mSwitchChangeListener:Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$OnCheckedChangeListener;

    iget-boolean v1, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->mChecked:Z

    invoke-interface {v0, v1}, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$OnCheckedChangeListener;->onCheckedChanged(Z)V

    .line 132
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->notifyChanged()V

    .line 133
    return-void
.end method

.method public setChecked(ZZ)V
    .locals 0
    .parameter "checked"
    .parameter "isCallback"

    .prologue
    .line 141
    if-nez p2, :cond_0

    .line 142
    iput-boolean p1, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->mChecked:Z

    .line 144
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->notifyChanged()V

    .line 145
    return-void
.end method

.method public setOnCheckedChangeListener(Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$OnCheckedChangeListener;)V
    .locals 2
    .parameter "listener"

    .prologue
    .line 162
    const-string v0, "VoiceUiSwitchPreference"

    const-string v1, "setOnCheckedChangeListener"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    if-eqz p1, :cond_0

    .line 164
    iput-object p1, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->mSwitchChangeListener:Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$OnCheckedChangeListener;

    .line 166
    :cond_0
    return-void
.end method
