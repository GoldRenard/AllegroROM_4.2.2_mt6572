.class public Lcom/mediatek/gemini/SimInfoEditor;
.super Lcom/android/settings/SettingsPreferenceFragment;
.source "SimInfoEditor.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;
.implements Landroid/text/TextWatcher;


# static fields
.field private static final DIALOG_SIM_NAME_DUP:I = 0x3f2

.field private static final KEY_SIM_COLOR:Ljava/lang/String; = "sim_color"

.field private static final KEY_SIM_NAME:Ljava/lang/String; = "sim_name"

.field private static final KEY_SIM_NUMBER:Ljava/lang/String; = "sim_number"

.field private static final KEY_SIM_NUMBER_FORMAT:Ljava/lang/String; = "sim_number_format"

.field private static final KEY_SIM_STATUS:Ljava/lang/String; = "status_info"

.field private static final NAME_EXISTED:I = -0x2

.field private static final TAG:Ljava/lang/String; = "SimInfoEditor"

.field private static final TYPE_COLOR:I = 0x1

.field private static final TYPE_FORMAT:I = 0x3

.field private static final TYPE_NAME:I = 0x0

.field private static final TYPE_NUMBER:I = 0x2

.field private static sArrayNumFormat:[Ljava/lang/String;

.field private static sNotSet:Ljava/lang/String;


# instance fields
.field private mExt:Lcom/mediatek/settings/ext/ISimManagementExt;

.field private mIntentFilter:Landroid/content/IntentFilter;

.field private mReceiver:Landroid/content/BroadcastReceiver;

.field private mSimColor:Lcom/mediatek/gemini/ColorPickerPreference;

.field private mSimID:J

.field private mSimName:Landroid/preference/EditTextPreference;

.field private mSimNumber:Landroid/preference/EditTextPreference;

.field private mSimNumberFormat:Landroid/preference/ListPreference;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/android/settings/SettingsPreferenceFragment;-><init>()V

    .line 59
    new-instance v0, Lcom/mediatek/gemini/SimInfoEditor$1;

    invoke-direct {v0, p0}, Lcom/mediatek/gemini/SimInfoEditor$1;-><init>(Lcom/mediatek/gemini/SimInfoEditor;)V

    iput-object v0, p0, Lcom/mediatek/gemini/SimInfoEditor;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/gemini/SimInfoEditor;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/mediatek/gemini/SimInfoEditor;->updateStatusUiState()V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/gemini/SimInfoEditor;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/mediatek/gemini/SimInfoEditor;->goBackSettings()V

    return-void
.end method

.method static synthetic access$200(Lcom/mediatek/gemini/SimInfoEditor;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 34
    iget-wide v0, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimID:J

    return-wide v0
.end method

.method private goBackSettings()V
    .locals 3

    .prologue
    .line 360
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoEditor;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/android/settings/Settings;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 362
    .local v0, intent:Landroid/content/Intent;
    const/high16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 363
    invoke-virtual {p0, v0}, Lcom/mediatek/gemini/SimInfoEditor;->startActivity(Landroid/content/Intent;)V

    .line 364
    return-void
.end method

.method private turnNumformatValuetoIndex(I)I
    .locals 1
    .parameter "value"

    .prologue
    .line 189
    if-nez p1, :cond_0

    .line 190
    const/4 v0, 0x2

    .line 192
    :goto_0
    return v0

    :cond_0
    add-int/lit8 v0, p1, -0x1

    goto :goto_0
.end method

.method private updateInfo()V
    .locals 5

    .prologue
    .line 163
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoEditor;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-wide v3, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimID:J

    invoke-static {v2, v3, v4}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoById(Landroid/content/Context;J)Landroid/provider/Telephony$SIMInfo;

    move-result-object v1

    .line 164
    .local v1, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v1, :cond_0

    .line 165
    iget-object v2, v1, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    if-nez v2, :cond_1

    .line 166
    iget-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    sget-object v3, Lcom/mediatek/gemini/SimInfoEditor;->sNotSet:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 171
    :goto_0
    iget-object v2, v1, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-object v2, v1, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_2

    .line 172
    iget-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    iget-object v3, v1, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 173
    iget-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    iget-object v3, v1, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 178
    :goto_1
    iget-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimColor:Lcom/mediatek/gemini/ColorPickerPreference;

    iget v3, v1, Landroid/provider/Telephony$SIMInfo;->mColor:I

    invoke-virtual {v2, v3}, Lcom/mediatek/gemini/ColorPickerPreference;->setInitValue(I)V

    .line 179
    iget v2, v1, Landroid/provider/Telephony$SIMInfo;->mDispalyNumberFormat:I

    invoke-direct {p0, v2}, Lcom/mediatek/gemini/SimInfoEditor;->turnNumformatValuetoIndex(I)I

    move-result v0

    .line 180
    .local v0, nIndex:I
    if-gez v0, :cond_3

    .line 186
    .end local v0           #nIndex:I
    :cond_0
    :goto_2
    return-void

    .line 168
    :cond_1
    iget-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    iget-object v3, v1, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 169
    iget-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    iget-object v3, v1, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    goto :goto_0

    .line 175
    :cond_2
    iget-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    sget-object v3, Lcom/mediatek/gemini/SimInfoEditor;->sNotSet:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 176
    iget-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    goto :goto_1

    .line 183
    .restart local v0       #nIndex:I
    :cond_3
    iget-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimNumberFormat:Landroid/preference/ListPreference;

    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 184
    iget-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimNumberFormat:Landroid/preference/ListPreference;

    sget-object v3, Lcom/mediatek/gemini/SimInfoEditor;->sArrayNumFormat:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_2
.end method

.method private updateStatusUiState()V
    .locals 7

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 131
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoEditor;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "airplane_mode_on"

    const/4 v6, -0x1

    invoke-static {v4, v5, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v2, :cond_1

    move v0, v2

    .line 133
    .local v0, isAirplaneModeOn:Z
    :goto_0
    const-string v4, "status_info"

    invoke-virtual {p0, v4}, Lcom/mediatek/gemini/SimInfoEditor;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 134
    .local v1, pref:Landroid/preference/Preference;
    if-eqz v1, :cond_0

    .line 135
    if-eqz v0, :cond_2

    .line 136
    invoke-virtual {v1, v3}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 141
    :cond_0
    :goto_1
    return-void

    .end local v0           #isAirplaneModeOn:Z
    .end local v1           #pref:Landroid/preference/Preference;
    :cond_1
    move v0, v3

    .line 131
    goto :goto_0

    .line 138
    .restart local v0       #isAirplaneModeOn:Z
    .restart local v1       #pref:Landroid/preference/Preference;
    :cond_2
    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setEnabled(Z)V

    goto :goto_1
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .parameter "arg0"

    .prologue
    .line 310
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "count"
    .parameter "after"

    .prologue
    .line 317
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .parameter "savedInstanceState"

    .prologue
    .line 86
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 87
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b058e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/mediatek/gemini/SimInfoEditor;->sNotSet:Ljava/lang/String;

    .line 88
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoEditor;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 89
    .local v0, extras:Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 90
    const-string v2, "simid"

    const-wide/16 v3, -0x1

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimID:J

    .line 92
    :cond_0
    const-string v2, "SimInfoEditor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "simid is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimID:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070047

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/mediatek/gemini/SimInfoEditor;->sArrayNumFormat:[Ljava/lang/String;

    .line 95
    const v2, 0x7f050034

    invoke-virtual {p0, v2}, Lcom/mediatek/gemini/SimInfoEditor;->addPreferencesFromResource(I)V

    .line 96
    const-string v2, "sim_number_format"

    invoke-virtual {p0, v2}, Lcom/mediatek/gemini/SimInfoEditor;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/ListPreference;

    iput-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimNumberFormat:Landroid/preference/ListPreference;

    .line 97
    iget-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimNumberFormat:Landroid/preference/ListPreference;

    invoke-virtual {v2, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 98
    const-string v2, "sim_name"

    invoke-virtual {p0, v2}, Lcom/mediatek/gemini/SimInfoEditor;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/EditTextPreference;

    iput-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    .line 99
    iget-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    invoke-virtual {v2, p0}, Landroid/preference/EditTextPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 100
    const-string v2, "sim_number"

    invoke-virtual {p0, v2}, Lcom/mediatek/gemini/SimInfoEditor;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/EditTextPreference;

    iput-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    .line 101
    iget-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    invoke-virtual {v2, p0}, Landroid/preference/EditTextPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 102
    const-string v2, "sim_color"

    invoke-virtual {p0, v2}, Lcom/mediatek/gemini/SimInfoEditor;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Lcom/mediatek/gemini/ColorPickerPreference;

    iput-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimColor:Lcom/mediatek/gemini/ColorPickerPreference;

    .line 103
    iget-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimColor:Lcom/mediatek/gemini/ColorPickerPreference;

    iget-wide v3, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimID:J

    invoke-virtual {v2, v3, v4}, Lcom/mediatek/gemini/ColorPickerPreference;->setSimID(J)V

    .line 104
    iget-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimColor:Lcom/mediatek/gemini/ColorPickerPreference;

    invoke-virtual {v2, p0}, Lcom/mediatek/gemini/ColorPickerPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 106
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoEditor;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    .line 107
    .local v1, parent:Landroid/preference/PreferenceGroup;
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoEditor;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/android/settings/Utils;->getSimManagmentExtPlugin(Landroid/content/Context;)Lcom/mediatek/settings/ext/ISimManagementExt;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mExt:Lcom/mediatek/settings/ext/ISimManagementExt;

    .line 108
    iget-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mExt:Lcom/mediatek/settings/ext/ISimManagementExt;

    invoke-interface {v2, v1}, Lcom/mediatek/settings/ext/ISimManagementExt;->updateSimManagementPref(Landroid/preference/PreferenceGroup;)V

    .line 109
    iget-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mExt:Lcom/mediatek/settings/ext/ISimManagementExt;

    invoke-interface {v2, p0}, Lcom/mediatek/settings/ext/ISimManagementExt;->updateSimEditorPref(Landroid/preference/PreferenceFragment;)V

    .line 110
    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 4
    .parameter "id"

    .prologue
    .line 333
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoEditor;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 335
    .local v1, builder:Landroid/app/AlertDialog$Builder;
    packed-switch p1, :pswitch_data_0

    .line 354
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 337
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b00ec

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 339
    const v2, 0x1080027

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 340
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b00ed

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 342
    const v2, 0x104000a

    new-instance v3, Lcom/mediatek/gemini/SimInfoEditor$2;

    invoke-direct {v3, p0}, Lcom/mediatek/gemini/SimInfoEditor$2;-><init>(Lcom/mediatek/gemini/SimInfoEditor;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 350
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 351
    .local v0, alertDlg:Landroid/app/AlertDialog;
    goto :goto_0

    .line 335
    :pswitch_data_0
    .packed-switch 0x3f2
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 125
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onPause()V

    .line 126
    const-string v0, "SimInfoEditor"

    const-string v1, "OnPause()"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoEditor;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/gemini/SimInfoEditor;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 128
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 16
    .parameter "preference"
    .parameter "objValue"

    .prologue
    .line 197
    invoke-virtual/range {p1 .. p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v8

    .line 198
    .local v8, key:Ljava/lang/String;
    const-string v1, "sim_name"

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 199
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    invoke-virtual {v1}, Landroid/preference/EditTextPreference;->getEditText()Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v13

    .line 200
    .local v13, textName:Landroid/text/Editable;
    if-eqz v13, :cond_1

    .line 201
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    invoke-virtual {v1}, Landroid/preference/EditTextPreference;->getEditText()Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 202
    .local v2, name:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/gemini/SimInfoEditor;->getActivity()Landroid/app/Activity;

    move-result-object v1

    move-object/from16 v0, p0

    iget-wide v3, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimID:J

    invoke-static {v1, v3, v4}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoById(Landroid/content/Context;J)Landroid/provider/Telephony$SIMInfo;

    move-result-object v12

    .line 203
    .local v12, siminfo:Landroid/provider/Telephony$SIMInfo;
    const-string v1, "SimInfoEditor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "name is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    if-eqz v12, :cond_0

    if-eqz v2, :cond_0

    .line 205
    iget-object v1, v12, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 206
    const/4 v1, 0x0

    .line 304
    .end local v2           #name:Ljava/lang/String;
    .end local v12           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v13           #textName:Landroid/text/Editable;
    .end local p2
    :goto_0
    return v1

    .line 209
    .restart local v2       #name:Ljava/lang/String;
    .restart local v12       #siminfo:Landroid/provider/Telephony$SIMInfo;
    .restart local v13       #textName:Landroid/text/Editable;
    .restart local p2
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/gemini/SimInfoEditor;->getActivity()Landroid/app/Activity;

    move-result-object v1

    move-object/from16 v0, p0

    iget-wide v3, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimID:J

    const-wide/16 v5, 0x2

    invoke-static/range {v1 .. v6}, Landroid/provider/Telephony$SIMInfo;->setDisplayNameEx(Landroid/content/Context;Ljava/lang/String;JJ)I

    move-result v11

    .line 212
    .local v11, result:I
    const-string v1, "SimInfoEditor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "result is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    if-lez v11, :cond_2

    .line 215
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    invoke-virtual {v1, v2}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 216
    new-instance v7, Landroid/content/Intent;

    const-string v1, "android.intent.action.SIM_SETTING_INFO_CHANGED"

    invoke-direct {v7, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 217
    .local v7, intent:Landroid/content/Intent;
    const-string v1, "simid"

    move-object/from16 v0, p0

    iget-wide v3, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimID:J

    invoke-virtual {v7, v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 218
    const-string v1, "type"

    const/4 v3, 0x0

    invoke-virtual {v7, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 219
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/gemini/SimInfoEditor;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 304
    .end local v2           #name:Ljava/lang/String;
    .end local v7           #intent:Landroid/content/Intent;
    .end local v11           #result:I
    .end local v12           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v13           #textName:Landroid/text/Editable;
    .end local p2
    :cond_1
    :goto_1
    const/4 v1, 0x1

    goto :goto_0

    .line 222
    .restart local v2       #name:Ljava/lang/String;
    .restart local v11       #result:I
    .restart local v12       #siminfo:Landroid/provider/Telephony$SIMInfo;
    .restart local v13       #textName:Landroid/text/Editable;
    .restart local p2
    :cond_2
    const/4 v1, -0x2

    if-ne v11, v1, :cond_3

    .line 223
    const/16 v1, 0x3f2

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/mediatek/gemini/SimInfoEditor;->showDialog(I)V

    .line 226
    :cond_3
    if-eqz v12, :cond_4

    iget-object v1, v12, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    if-eqz v1, :cond_4

    .line 227
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    iget-object v3, v12, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 230
    :cond_4
    const/4 v1, 0x0

    goto :goto_0

    .line 234
    .end local v2           #name:Ljava/lang/String;
    .end local v11           #result:I
    .end local v12           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v13           #textName:Landroid/text/Editable;
    :cond_5
    const-string v1, "sim_color"

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 235
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/gemini/SimInfoEditor;->getActivity()Landroid/app/Activity;

    move-result-object v3

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimID:J

    invoke-static {v3, v1, v4, v5}, Landroid/provider/Telephony$SIMInfo;->setColor(Landroid/content/Context;IJ)I

    move-result v1

    if-lez v1, :cond_1

    .line 237
    const-string v1, "SimInfoEditor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "set color succeed "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    new-instance v7, Landroid/content/Intent;

    const-string v1, "android.intent.action.SIM_SETTING_INFO_CHANGED"

    invoke-direct {v7, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 239
    .restart local v7       #intent:Landroid/content/Intent;
    const-string v1, "simid"

    move-object/from16 v0, p0

    iget-wide v3, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimID:J

    invoke-virtual {v7, v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 240
    const-string v1, "type"

    const/4 v3, 0x1

    invoke-virtual {v7, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 241
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/gemini/SimInfoEditor;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_1

    .line 243
    .end local v7           #intent:Landroid/content/Intent;
    :cond_6
    const-string v1, "sim_number"

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 244
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    invoke-virtual {v1}, Landroid/preference/EditTextPreference;->getEditText()Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v14

    .line 245
    .local v14, textNumber:Landroid/text/Editable;
    if-eqz v14, :cond_1

    .line 246
    const-string v1, "SimInfoEditor"

    const-string v3, "textNumber != null "

    invoke-static {v1, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    invoke-virtual {v14}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    .line 248
    .local v10, number:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/gemini/SimInfoEditor;->getActivity()Landroid/app/Activity;

    move-result-object v1

    move-object/from16 v0, p0

    iget-wide v3, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimID:J

    invoke-static {v1, v10, v3, v4}, Landroid/provider/Telephony$SIMInfo;->setNumber(Landroid/content/Context;Ljava/lang/String;J)I

    move-result v1

    if-lez v1, :cond_8

    .line 250
    const-string v1, "SimInfoEditor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "set number succeed "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    if-eqz v10, :cond_7

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_7

    .line 252
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    invoke-virtual {v1, v10}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 257
    :goto_2
    new-instance v7, Landroid/content/Intent;

    const-string v1, "android.intent.action.SIM_SETTING_INFO_CHANGED"

    invoke-direct {v7, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 258
    .restart local v7       #intent:Landroid/content/Intent;
    const-string v1, "simid"

    move-object/from16 v0, p0

    iget-wide v3, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimID:J

    invoke-virtual {v7, v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 259
    const-string v1, "type"

    const/4 v3, 0x2

    invoke-virtual {v7, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 260
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/gemini/SimInfoEditor;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_1

    .line 254
    .end local v7           #intent:Landroid/content/Intent;
    :cond_7
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    sget-object v3, Lcom/mediatek/gemini/SimInfoEditor;->sNotSet:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 262
    :cond_8
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/gemini/SimInfoEditor;->getActivity()Landroid/app/Activity;

    move-result-object v1

    move-object/from16 v0, p0

    iget-wide v3, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimID:J

    invoke-static {v1, v3, v4}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoById(Landroid/content/Context;J)Landroid/provider/Telephony$SIMInfo;

    move-result-object v12

    .line 264
    .restart local v12       #siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v12, :cond_9

    .line 265
    iget-object v1, v12, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    if-eqz v1, :cond_a

    iget-object v1, v12, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_a

    .line 268
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    iget-object v3, v12, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 277
    :cond_9
    :goto_3
    const/4 v1, 0x0

    goto/16 :goto_0

    .line 272
    :cond_a
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    const-string v3, ""

    invoke-virtual {v1, v3}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    goto :goto_3

    .line 282
    .end local v10           #number:Ljava/lang/String;
    .end local v12           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v14           #textNumber:Landroid/text/Editable;
    :cond_b
    const-string v1, "sim_number_format"

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 284
    check-cast p2, Ljava/lang/String;

    .end local p2
    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v15

    .line 285
    .local v15, value:I
    const-string v1, "SimInfoEditor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "KEY_SIM_NUMBER_FORMAT is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    if-gez v15, :cond_c

    .line 288
    const/4 v1, 0x0

    goto/16 :goto_0

    .line 290
    :cond_c
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/gemini/SimInfoEditor;->getActivity()Landroid/app/Activity;

    move-result-object v1

    move-object/from16 v0, p0

    iget-wide v3, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimID:J

    invoke-static {v1, v15, v3, v4}, Landroid/provider/Telephony$SIMInfo;->setDispalyNumberFormat(Landroid/content/Context;IJ)I

    move-result v1

    if-lez v1, :cond_1

    .line 292
    const-string v1, "SimInfoEditor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "set format succeed "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/mediatek/gemini/SimInfoEditor;->turnNumformatValuetoIndex(I)I

    move-result v9

    .line 296
    .local v9, nIndex:I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimNumberFormat:Landroid/preference/ListPreference;

    sget-object v3, Lcom/mediatek/gemini/SimInfoEditor;->sArrayNumFormat:[Ljava/lang/String;

    aget-object v3, v3, v9

    invoke-virtual {v1, v3}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 297
    new-instance v7, Landroid/content/Intent;

    const-string v1, "android.intent.action.SIM_SETTING_INFO_CHANGED"

    invoke-direct {v7, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 298
    .restart local v7       #intent:Landroid/content/Intent;
    const-string v1, "simid"

    move-object/from16 v0, p0

    iget-wide v3, v0, Lcom/mediatek/gemini/SimInfoEditor;->mSimID:J

    invoke-virtual {v7, v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 299
    const-string v1, "type"

    const/4 v3, 0x3

    invoke-virtual {v7, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 300
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/gemini/SimInfoEditor;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_1
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 6
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v5, 0x0

    .line 146
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    const-string v3, "status_info"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 147
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 148
    .local v0, it:Landroid/content/Intent;
    const-string v2, "com.android.settings"

    const-string v3, "com.android.settings.deviceinfo.SimStatusGemini"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 150
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoEditor;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-wide v3, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimID:J

    invoke-static {v2, v3, v4}, Landroid/provider/Telephony$SIMInfo;->getSlotById(Landroid/content/Context;J)I

    move-result v1

    .line 152
    .local v1, slot:I
    if-gez v1, :cond_1

    .line 159
    .end local v0           #it:Landroid/content/Intent;
    .end local v1           #slot:I
    :cond_0
    :goto_0
    return v5

    .line 155
    .restart local v0       #it:Landroid/content/Intent;
    .restart local v1       #slot:I
    :cond_1
    const-string v2, "slotid"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 156
    const-string v2, "SimInfoEditor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "slotid is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    invoke-virtual {p0, v0}, Lcom/mediatek/gemini/SimInfoEditor;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 114
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onResume()V

    .line 115
    invoke-direct {p0}, Lcom/mediatek/gemini/SimInfoEditor;->updateInfo()V

    .line 116
    iget-object v0, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    invoke-virtual {v0}, Landroid/preference/EditTextPreference;->getEditText()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 117
    invoke-direct {p0}, Lcom/mediatek/gemini/SimInfoEditor;->updateStatusUiState()V

    .line 118
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mediatek/gemini/SimInfoEditor;->mIntentFilter:Landroid/content/IntentFilter;

    .line 119
    iget-object v0, p0, Lcom/mediatek/gemini/SimInfoEditor;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 120
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoEditor;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/gemini/SimInfoEditor;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Lcom/mediatek/gemini/SimInfoEditor;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 121
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 3
    .parameter "s"
    .parameter "start"
    .parameter "before"
    .parameter "count"

    .prologue
    .line 322
    iget-object v1, p0, Lcom/mediatek/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    invoke-virtual {v1}, Landroid/preference/EditTextPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 323
    .local v0, d:Landroid/app/Dialog;
    instance-of v1, v0, Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    .line 324
    check-cast v0, Landroid/app/AlertDialog;

    .end local v0           #d:Landroid/app/Dialog;
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v2

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-lez v1, :cond_1

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v2, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 328
    :cond_0
    return-void

    .line 324
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
