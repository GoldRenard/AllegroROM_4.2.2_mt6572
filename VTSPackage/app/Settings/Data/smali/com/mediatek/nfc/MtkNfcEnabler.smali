.class public Lcom/mediatek/nfc/MtkNfcEnabler;
.super Ljava/lang/Object;
.source "MtkNfcEnabler.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "MtkNfcEnabler"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mIntentFilter:Landroid/content/IntentFilter;

.field private final mNfcAdapter:Landroid/nfc/NfcAdapter;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private final mSwitchButton:Landroid/widget/Switch;

.field private final mSwitchPreference:Lcom/mediatek/nfc/NfcPreference;

.field private mUpdateSwitchButtonOnly:Z

.field private mUpdateSwitchPrefOnly:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/mediatek/nfc/NfcPreference;Landroid/widget/Switch;Landroid/nfc/NfcAdapter;)V
    .locals 2
    .parameter "context"
    .parameter "switchpref"
    .parameter "switchButton"
    .parameter "adapter"

    .prologue
    .line 63
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Lcom/mediatek/nfc/MtkNfcEnabler$1;

    invoke-direct {v0, p0}, Lcom/mediatek/nfc/MtkNfcEnabler$1;-><init>(Lcom/mediatek/nfc/MtkNfcEnabler;)V

    iput-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 64
    iput-object p1, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mContext:Landroid/content/Context;

    .line 65
    iput-object p2, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchPreference:Lcom/mediatek/nfc/NfcPreference;

    .line 66
    iput-object p3, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchButton:Landroid/widget/Switch;

    .line 67
    iput-object p4, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mNfcAdapter:Landroid/nfc/NfcAdapter;

    .line 78
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.nfc.action.ADAPTER_STATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mIntentFilter:Landroid/content/IntentFilter;

    .line 80
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/nfc/MtkNfcEnabler;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/mediatek/nfc/MtkNfcEnabler;->handleNfcStateChanged(I)V

    return-void
.end method

.method private handleNfcStateChanged(I)V
    .locals 0
    .parameter "newState"

    .prologue
    .line 188
    invoke-direct {p0, p1}, Lcom/mediatek/nfc/MtkNfcEnabler;->updateSwitch(I)V

    .line 189
    invoke-direct {p0, p1}, Lcom/mediatek/nfc/MtkNfcEnabler;->updateSwitchPref(I)V

    .line 190
    return-void
.end method

.method private setSwitchButtonChecked(Z)V
    .locals 1
    .parameter "checked"

    .prologue
    .line 124
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchButton:Landroid/widget/Switch;

    invoke-virtual {v0}, Landroid/widget/Switch;->isChecked()Z

    move-result v0

    if-eq p1, v0, :cond_0

    .line 125
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mUpdateSwitchButtonOnly:Z

    .line 126
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchButton:Landroid/widget/Switch;

    invoke-virtual {v0, p1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 127
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mUpdateSwitchButtonOnly:Z

    .line 129
    :cond_0
    return-void
.end method

.method private setSwitchPrefChecked(Z)V
    .locals 1
    .parameter "checked"

    .prologue
    .line 138
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchPreference:Lcom/mediatek/nfc/NfcPreference;

    invoke-virtual {v0}, Lcom/mediatek/nfc/NfcPreference;->isChecked()Z

    move-result v0

    if-eq p1, v0, :cond_0

    .line 139
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mUpdateSwitchPrefOnly:Z

    .line 140
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchPreference:Lcom/mediatek/nfc/NfcPreference;

    invoke-virtual {v0, p1}, Lcom/mediatek/nfc/NfcPreference;->setChecked(Z)Z

    .line 141
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mUpdateSwitchPrefOnly:Z

    .line 143
    :cond_0
    return-void
.end method

.method private updateSwitch(I)V
    .locals 3
    .parameter "state"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 197
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchButton:Landroid/widget/Switch;

    if-nez v0, :cond_0

    .line 221
    :goto_0
    return-void

    .line 200
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 218
    invoke-direct {p0, v1}, Lcom/mediatek/nfc/MtkNfcEnabler;->setSwitchButtonChecked(Z)V

    goto :goto_0

    .line 202
    :pswitch_0
    invoke-direct {p0, v1}, Lcom/mediatek/nfc/MtkNfcEnabler;->setSwitchButtonChecked(Z)V

    .line 203
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchButton:Landroid/widget/Switch;

    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setEnabled(Z)V

    goto :goto_0

    .line 206
    :pswitch_1
    invoke-direct {p0, v2}, Lcom/mediatek/nfc/MtkNfcEnabler;->setSwitchButtonChecked(Z)V

    .line 207
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchButton:Landroid/widget/Switch;

    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setEnabled(Z)V

    goto :goto_0

    .line 210
    :pswitch_2
    invoke-direct {p0, v2}, Lcom/mediatek/nfc/MtkNfcEnabler;->setSwitchButtonChecked(Z)V

    .line 211
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchButton:Landroid/widget/Switch;

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setEnabled(Z)V

    goto :goto_0

    .line 214
    :pswitch_3
    invoke-direct {p0, v1}, Lcom/mediatek/nfc/MtkNfcEnabler;->setSwitchButtonChecked(Z)V

    .line 215
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchButton:Landroid/widget/Switch;

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setEnabled(Z)V

    goto :goto_0

    .line 200
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method private updateSwitchPref(I)V
    .locals 3
    .parameter "state"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 228
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchPreference:Lcom/mediatek/nfc/NfcPreference;

    if-nez v0, :cond_0

    .line 252
    :goto_0
    return-void

    .line 231
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 249
    invoke-direct {p0, v1}, Lcom/mediatek/nfc/MtkNfcEnabler;->setSwitchPrefChecked(Z)V

    goto :goto_0

    .line 233
    :pswitch_0
    invoke-direct {p0, v1}, Lcom/mediatek/nfc/MtkNfcEnabler;->setSwitchPrefChecked(Z)V

    .line 234
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchPreference:Lcom/mediatek/nfc/NfcPreference;

    invoke-virtual {v0, v2}, Lcom/mediatek/nfc/NfcPreference;->setEnabled(Z)V

    goto :goto_0

    .line 237
    :pswitch_1
    invoke-direct {p0, v2}, Lcom/mediatek/nfc/MtkNfcEnabler;->setSwitchPrefChecked(Z)V

    .line 238
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchPreference:Lcom/mediatek/nfc/NfcPreference;

    invoke-virtual {v0, v2}, Lcom/mediatek/nfc/NfcPreference;->setEnabled(Z)V

    goto :goto_0

    .line 241
    :pswitch_2
    invoke-direct {p0, v2}, Lcom/mediatek/nfc/MtkNfcEnabler;->setSwitchPrefChecked(Z)V

    .line 242
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchPreference:Lcom/mediatek/nfc/NfcPreference;

    invoke-virtual {v0, v1}, Lcom/mediatek/nfc/NfcPreference;->setEnabled(Z)V

    goto :goto_0

    .line 245
    :pswitch_3
    invoke-direct {p0, v1}, Lcom/mediatek/nfc/MtkNfcEnabler;->setSwitchPrefChecked(Z)V

    .line 246
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchPreference:Lcom/mediatek/nfc/NfcPreference;

    invoke-virtual {v0, v1}, Lcom/mediatek/nfc/NfcPreference;->setEnabled(Z)V

    goto :goto_0

    .line 231
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 5
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    const/4 v4, 0x4

    const/4 v3, 0x0

    .line 170
    const-string v0, "MtkNfcEnabler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCheckedChanged "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchButton:Landroid/widget/Switch;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mUpdateSwitchButtonOnly:Z

    if-nez v0, :cond_0

    .line 172
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchButton:Landroid/widget/Switch;

    invoke-virtual {v0, v3}, Landroid/widget/Switch;->setEnabled(Z)V

    .line 173
    if-eqz p2, :cond_1

    .line 174
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mNfcAdapter:Landroid/nfc/NfcAdapter;

    const/4 v1, 0x1

    invoke-virtual {v0, v4, v1}, Landroid/nfc/NfcAdapter;->setModeFlag(II)V

    .line 175
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mNfcAdapter:Landroid/nfc/NfcAdapter;

    invoke-virtual {v0}, Landroid/nfc/NfcAdapter;->enable()Z

    .line 181
    :cond_0
    :goto_0
    return-void

    .line 177
    :cond_1
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mNfcAdapter:Landroid/nfc/NfcAdapter;

    invoke-virtual {v0, v4, v3}, Landroid/nfc/NfcAdapter;->setModeFlag(II)V

    .line 178
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mNfcAdapter:Landroid/nfc/NfcAdapter;

    invoke-virtual {v0}, Landroid/nfc/NfcAdapter;->disable()Z

    goto :goto_0
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 7
    .parameter "preference"
    .parameter "value"

    .prologue
    const/4 v6, 0x4

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 146
    check-cast p2, Ljava/lang/Boolean;

    .end local p2
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 147
    .local v0, desiredState:Z
    const-string v3, "MtkNfcEnabler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onPreferenceChange "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    iget-object v3, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchPreference:Lcom/mediatek/nfc/NfcPreference;

    if-nez v3, :cond_0

    .line 166
    :goto_0
    return v1

    .line 152
    :cond_0
    iget-boolean v3, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mUpdateSwitchPrefOnly:Z

    if-eqz v3, :cond_1

    move v1, v2

    .line 153
    goto :goto_0

    .line 155
    :cond_1
    iget-object v3, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchPreference:Lcom/mediatek/nfc/NfcPreference;

    invoke-virtual {v3, v1}, Lcom/mediatek/nfc/NfcPreference;->setEnabled(Z)V

    .line 159
    if-eqz v0, :cond_2

    .line 160
    iget-object v1, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mNfcAdapter:Landroid/nfc/NfcAdapter;

    invoke-virtual {v1, v6, v2}, Landroid/nfc/NfcAdapter;->setModeFlag(II)V

    .line 161
    iget-object v1, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mNfcAdapter:Landroid/nfc/NfcAdapter;

    invoke-virtual {v1}, Landroid/nfc/NfcAdapter;->enable()Z

    :goto_1
    move v1, v2

    .line 166
    goto :goto_0

    .line 163
    :cond_2
    iget-object v3, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mNfcAdapter:Landroid/nfc/NfcAdapter;

    invoke-virtual {v3, v6, v1}, Landroid/nfc/NfcAdapter;->setModeFlag(II)V

    .line 164
    iget-object v1, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mNfcAdapter:Landroid/nfc/NfcAdapter;

    invoke-virtual {v1}, Landroid/nfc/NfcAdapter;->disable()Z

    goto :goto_1
.end method

.method public pause()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 104
    const-string v0, "MtkNfcEnabler"

    const-string v1, "Pause"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mNfcAdapter:Landroid/nfc/NfcAdapter;

    if-nez v0, :cond_1

    .line 115
    :cond_0
    :goto_0
    return-void

    .line 108
    :cond_1
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 109
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchPreference:Lcom/mediatek/nfc/NfcPreference;

    if-eqz v0, :cond_2

    .line 110
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchPreference:Lcom/mediatek/nfc/NfcPreference;

    invoke-virtual {v0, v2}, Lcom/mediatek/nfc/NfcPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 112
    :cond_2
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchButton:Landroid/widget/Switch;

    if-eqz v0, :cond_0

    .line 113
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchButton:Landroid/widget/Switch;

    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    goto :goto_0
.end method

.method public resume()V
    .locals 3

    .prologue
    .line 86
    const-string v0, "MtkNfcEnabler"

    const-string v1, "Resume"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mNfcAdapter:Landroid/nfc/NfcAdapter;

    if-nez v0, :cond_1

    .line 98
    :cond_0
    :goto_0
    return-void

    .line 90
    :cond_1
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mNfcAdapter:Landroid/nfc/NfcAdapter;

    invoke-virtual {v0}, Landroid/nfc/NfcAdapter;->getAdapterState()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/mediatek/nfc/MtkNfcEnabler;->handleNfcStateChanged(I)V

    .line 91
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 92
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchPreference:Lcom/mediatek/nfc/NfcPreference;

    if-eqz v0, :cond_2

    .line 93
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchPreference:Lcom/mediatek/nfc/NfcPreference;

    invoke-virtual {v0, p0}, Lcom/mediatek/nfc/NfcPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 95
    :cond_2
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchButton:Landroid/widget/Switch;

    if-eqz v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/mediatek/nfc/MtkNfcEnabler;->mSwitchButton:Landroid/widget/Switch;

    invoke-virtual {v0, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    goto :goto_0
.end method
