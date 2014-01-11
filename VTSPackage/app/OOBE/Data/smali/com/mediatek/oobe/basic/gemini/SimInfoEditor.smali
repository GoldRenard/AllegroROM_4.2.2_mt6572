.class public Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;
.super Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;
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

.field private static final TAG:Ljava/lang/String; = "SimInfoEditor"


# instance fields
.field private mArrayNumFormat:[Ljava/lang/String;

.field private mIntentFilter:Landroid/content/IntentFilter;

.field private mNotSet:Ljava/lang/String;

.field private mReceiver:Landroid/content/BroadcastReceiver;

.field private mSimColor:Lcom/mediatek/oobe/basic/gemini/ColorPickerPreference;

.field private mSimID:J

.field private mSimName:Landroid/preference/EditTextPreference;

.field private mSimNumber:Landroid/preference/EditTextPreference;

.field private mSimNumberFormat:Landroid/preference/ListPreference;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;-><init>()V

    .line 90
    new-instance v0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor$1;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor$1;-><init>(Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 67
    iget-wide v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimID:J

    return-wide v0
.end method

.method private turnNumformatValuetoIndex(I)I
    .locals 1
    .parameter "value"

    .prologue
    .line 223
    if-nez p1, :cond_0

    .line 224
    const/4 v0, 0x2

    .line 226
    :goto_0
    return v0

    :cond_0
    add-int/lit8 v0, p1, -0x1

    goto :goto_0
.end method

.method private updateInfo()V
    .locals 4

    .prologue
    .line 189
    iget-wide v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimID:J

    invoke-static {p0, v2, v3}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoById(Landroid/content/Context;J)Landroid/provider/Telephony$SIMInfo;

    move-result-object v1

    .line 190
    .local v1, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v1, :cond_0

    .line 192
    iget-object v2, v1, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    if-nez v2, :cond_1

    .line 193
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mNotSet:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 199
    :goto_0
    iget-object v2, v1, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-object v2, v1, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_2

    .line 201
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    iget-object v3, v1, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 202
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    iget-object v3, v1, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 210
    :goto_1
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimColor:Lcom/mediatek/oobe/basic/gemini/ColorPickerPreference;

    iget v3, v1, Landroid/provider/Telephony$SIMInfo;->mColor:I

    invoke-virtual {v2, v3}, Lcom/mediatek/oobe/basic/gemini/ColorPickerPreference;->setInitValue(I)V

    .line 211
    iget v2, v1, Landroid/provider/Telephony$SIMInfo;->mDispalyNumberFormat:I

    invoke-direct {p0, v2}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->turnNumformatValuetoIndex(I)I

    move-result v0

    .line 212
    .local v0, nIndex:I
    if-gez v0, :cond_3

    .line 219
    .end local v0           #nIndex:I
    :cond_0
    :goto_2
    return-void

    .line 195
    :cond_1
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    iget-object v3, v1, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 196
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    iget-object v3, v1, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    goto :goto_0

    .line 205
    :cond_2
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mNotSet:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 206
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    goto :goto_1

    .line 215
    .restart local v0       #nIndex:I
    :cond_3
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimNumberFormat:Landroid/preference/ListPreference;

    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 216
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimNumberFormat:Landroid/preference/ListPreference;

    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mArrayNumFormat:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_2
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .parameter "arg0"

    .prologue
    .line 366
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "count"
    .parameter "after"

    .prologue
    .line 372
    return-void
.end method

.method protected finishActivityByResultCode(I)V
    .locals 3
    .parameter "resultCode"

    .prologue
    .line 357
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->finish()V

    .line 358
    const/high16 v0, 0x7f04

    const v1, 0x7f040003

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->overridePendingTransition(II)V

    .line 359
    const-string v0, "SimInfoEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SimInfoEditor Finish "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 360
    return-void
.end method

.method protected getStepSpecialTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 110
    const-string v0, "SimInfoEditor"

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    .line 115
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 116
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f090019

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mNotSet:Ljava/lang/String;

    .line 118
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 120
    .local v1, intent:Landroid/content/Intent;
    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 121
    .local v0, extras:Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 122
    const-string v3, "simid"

    const-wide/16 v4, -0x1

    invoke-virtual {v0, v3, v4, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimID:J

    .line 124
    :cond_0
    const-string v3, "SimInfoEditor"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "simid is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimID:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f060003

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mArrayNumFormat:[Ljava/lang/String;

    .line 128
    const v3, 0x7f090057

    const v4, 0x7f090058

    invoke-virtual {p0, v3, v4}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->initSpecialLayout(II)V

    .line 129
    const v3, 0x7f050007

    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->addPreferencesFromResource(I)V

    .line 131
    const-string v3, "sim_number_format"

    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/ListPreference;

    iput-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimNumberFormat:Landroid/preference/ListPreference;

    .line 132
    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimNumberFormat:Landroid/preference/ListPreference;

    invoke-virtual {v3, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 134
    const-string v3, "sim_name"

    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/EditTextPreference;

    iput-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    .line 135
    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    invoke-virtual {v3, p0}, Landroid/preference/EditTextPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 137
    const-string v3, "sim_number"

    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/EditTextPreference;

    iput-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    .line 138
    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    invoke-virtual {v3, p0}, Landroid/preference/EditTextPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 140
    const-string v3, "sim_color"

    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Lcom/mediatek/oobe/basic/gemini/ColorPickerPreference;

    iput-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimColor:Lcom/mediatek/oobe/basic/gemini/ColorPickerPreference;

    .line 141
    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimColor:Lcom/mediatek/oobe/basic/gemini/ColorPickerPreference;

    iget-wide v4, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimID:J

    invoke-virtual {v3, v4, v5}, Lcom/mediatek/oobe/basic/gemini/ColorPickerPreference;->setSimID(J)V

    .line 143
    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimColor:Lcom/mediatek/oobe/basic/gemini/ColorPickerPreference;

    invoke-virtual {v3, p0}, Lcom/mediatek/oobe/basic/gemini/ColorPickerPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 145
    const v3, 0x7f0b000d

    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Spinner;

    .line 146
    .local v2, spinner:Landroid/widget/Spinner;
    if-eqz v2, :cond_1

    .line 147
    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setVisibility(I)V

    .line 149
    :cond_1
    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "android.intent.action.SIM_INFO_UPDATE"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mIntentFilter:Landroid/content/IntentFilter;

    .line 150
    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 4
    .parameter "id"

    .prologue
    .line 387
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 390
    .local v1, builder:Landroid/app/AlertDialog$Builder;
    packed-switch p1, :pswitch_data_0

    .line 406
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 392
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f09001f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 393
    const v2, 0x1080027

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 394
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f090020

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 395
    const v2, 0x104000a

    new-instance v3, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor$2;

    invoke-direct {v3, p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor$2;-><init>(Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 402
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 403
    .local v0, alertDlg:Landroid/app/AlertDialog;
    goto :goto_0

    .line 390
    :pswitch_data_0
    .packed-switch 0x3f2
        :pswitch_0
    .end packed-switch
.end method

.method public onNextStep(Z)V
    .locals 2
    .parameter "isNext"

    .prologue
    .line 347
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->finish()V

    .line 348
    if-eqz p1, :cond_0

    .line 349
    const v0, 0x7f040002

    const v1, 0x7f040001

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->overridePendingTransition(II)V

    .line 353
    :goto_0
    return-void

    .line 351
    :cond_0
    const/high16 v0, 0x7f04

    const v1, 0x7f040003

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->overridePendingTransition(II)V

    goto :goto_0
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 163
    invoke-super {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onPause()V

    .line 164
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 165
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 15
    .parameter "preference"
    .parameter "objValue"

    .prologue
    .line 231
    invoke-virtual/range {p1 .. p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    .line 233
    .local v2, key:Ljava/lang/String;
    const-string v12, "sim_name"

    invoke-virtual {v12, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 234
    iget-object v12, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    invoke-virtual {v12}, Landroid/preference/EditTextPreference;->getEditText()Landroid/widget/EditText;

    move-result-object v12

    invoke-virtual {v12}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v9

    .line 236
    .local v9, textName:Landroid/text/Editable;
    if-eqz v9, :cond_1

    .line 237
    iget-object v12, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    invoke-virtual {v12}, Landroid/preference/EditTextPreference;->getEditText()Landroid/widget/EditText;

    move-result-object v12

    invoke-virtual {v12}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 238
    .local v4, name:Ljava/lang/String;
    iget-wide v12, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimID:J

    invoke-static {p0, v12, v13}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoById(Landroid/content/Context;J)Landroid/provider/Telephony$SIMInfo;

    move-result-object v8

    .line 239
    .local v8, siminfo:Landroid/provider/Telephony$SIMInfo;
    const-string v12, "SimInfoEditor"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "name is "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    if-eqz v8, :cond_0

    if-eqz v4, :cond_0

    .line 241
    iget-object v12, v8, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v4, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 242
    const/4 v12, 0x0

    .line 342
    .end local v4           #name:Ljava/lang/String;
    .end local v8           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v9           #textName:Landroid/text/Editable;
    .end local p2
    :goto_0
    return v12

    .line 247
    .restart local v4       #name:Ljava/lang/String;
    .restart local v8       #siminfo:Landroid/provider/Telephony$SIMInfo;
    .restart local v9       #textName:Landroid/text/Editable;
    .restart local p2
    :cond_0
    iget-wide v12, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimID:J

    invoke-static {p0, v4, v12, v13}, Landroid/provider/Telephony$SIMInfo;->setDisplayName(Landroid/content/Context;Ljava/lang/String;J)I

    move-result v6

    .line 249
    .local v6, result:I
    const-string v12, "SimInfoEditor"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "result is "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    if-lez v6, :cond_2

    .line 252
    iget-object v12, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    invoke-virtual {v12, v4}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 253
    new-instance v1, Landroid/content/Intent;

    const-string v12, "android.intent.action.SIM_SETTING_INFO_CHANGED"

    invoke-direct {v1, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 254
    .local v1, intent:Landroid/content/Intent;
    const-string v12, "simid"

    iget-wide v13, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimID:J

    invoke-virtual {v1, v12, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 255
    const-string v12, "type"

    const/4 v13, 0x0

    invoke-virtual {v1, v12, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 256
    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->sendBroadcast(Landroid/content/Intent;)V

    .line 342
    .end local v1           #intent:Landroid/content/Intent;
    .end local v4           #name:Ljava/lang/String;
    .end local v6           #result:I
    .end local v8           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v9           #textName:Landroid/text/Editable;
    .end local p2
    :cond_1
    :goto_1
    const/4 v12, 0x1

    goto :goto_0

    .line 259
    .restart local v4       #name:Ljava/lang/String;
    .restart local v6       #result:I
    .restart local v8       #siminfo:Landroid/provider/Telephony$SIMInfo;
    .restart local v9       #textName:Landroid/text/Editable;
    .restart local p2
    :cond_2
    const/4 v12, -0x2

    if-ne v6, v12, :cond_3

    .line 260
    const/16 v12, 0x3f2

    invoke-virtual {p0, v12}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->showDialog(I)V

    .line 263
    :cond_3
    if-eqz v8, :cond_4

    iget-object v12, v8, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    if-eqz v12, :cond_4

    .line 264
    iget-object v12, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    iget-object v13, v8, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v12, v13}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 267
    :cond_4
    const/4 v12, 0x0

    goto :goto_0

    .line 271
    .end local v4           #name:Ljava/lang/String;
    .end local v6           #result:I
    .end local v8           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v9           #textName:Landroid/text/Editable;
    :cond_5
    const-string v12, "sim_color"

    invoke-virtual {v12, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_6

    move-object/from16 v12, p2

    .line 273
    check-cast v12, Ljava/lang/Integer;

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    iget-wide v13, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimID:J

    invoke-static {p0, v12, v13, v14}, Landroid/provider/Telephony$SIMInfo;->setColor(Landroid/content/Context;IJ)I

    move-result v12

    if-lez v12, :cond_1

    .line 274
    const-string v12, "SimInfoEditor"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "set color succeed "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    new-instance v1, Landroid/content/Intent;

    const-string v12, "android.intent.action.SIM_SETTING_INFO_CHANGED"

    invoke-direct {v1, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 276
    .restart local v1       #intent:Landroid/content/Intent;
    const-string v12, "simid"

    iget-wide v13, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimID:J

    invoke-virtual {v1, v12, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 277
    const-string v12, "type"

    const/4 v13, 0x1

    invoke-virtual {v1, v12, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 278
    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_1

    .line 281
    .end local v1           #intent:Landroid/content/Intent;
    :cond_6
    const-string v12, "sim_number"

    invoke-virtual {v12, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_b

    .line 283
    iget-object v12, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    invoke-virtual {v12}, Landroid/preference/EditTextPreference;->getEditText()Landroid/widget/EditText;

    move-result-object v12

    invoke-virtual {v12}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v10

    .line 284
    .local v10, textNumber:Landroid/text/Editable;
    if-eqz v10, :cond_1

    .line 285
    const-string v12, "SimInfoEditor"

    const-string v13, "textNumber != null "

    invoke-static {v12, v13}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 287
    .local v5, number:Ljava/lang/String;
    iget-wide v12, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimID:J

    invoke-static {p0, v5, v12, v13}, Landroid/provider/Telephony$SIMInfo;->setNumber(Landroid/content/Context;Ljava/lang/String;J)I

    move-result v12

    if-lez v12, :cond_8

    .line 289
    const-string v12, "SimInfoEditor"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "set number succeed "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    if-eqz v5, :cond_7

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v12

    if-eqz v12, :cond_7

    .line 291
    iget-object v12, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    invoke-virtual {v12, v5}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 296
    :goto_2
    new-instance v1, Landroid/content/Intent;

    const-string v12, "android.intent.action.SIM_SETTING_INFO_CHANGED"

    invoke-direct {v1, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 297
    .restart local v1       #intent:Landroid/content/Intent;
    const-string v12, "simid"

    iget-wide v13, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimID:J

    invoke-virtual {v1, v12, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 298
    const-string v12, "type"

    const/4 v13, 0x2

    invoke-virtual {v1, v12, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 299
    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_1

    .line 293
    .end local v1           #intent:Landroid/content/Intent;
    :cond_7
    iget-object v12, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    iget-object v13, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mNotSet:Ljava/lang/String;

    invoke-virtual {v12, v13}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 301
    :cond_8
    iget-wide v12, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimID:J

    invoke-static {p0, v12, v13}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoById(Landroid/content/Context;J)Landroid/provider/Telephony$SIMInfo;

    move-result-object v8

    .line 302
    .restart local v8       #siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v8, :cond_9

    .line 303
    iget-object v12, v8, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    if-eqz v12, :cond_a

    iget-object v12, v8, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    if-eqz v12, :cond_a

    .line 305
    iget-object v12, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    iget-object v13, v8, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v12, v13}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 314
    :cond_9
    :goto_3
    const/4 v12, 0x0

    goto/16 :goto_0

    .line 309
    :cond_a
    iget-object v12, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimNumber:Landroid/preference/EditTextPreference;

    const-string v13, ""

    invoke-virtual {v12, v13}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    goto :goto_3

    .line 319
    .end local v5           #number:Ljava/lang/String;
    .end local v8           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v10           #textNumber:Landroid/text/Editable;
    :cond_b
    const-string v12, "sim_number_format"

    invoke-virtual {v12, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 321
    check-cast p2, Ljava/lang/String;

    .end local p2
    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    .line 322
    .local v11, value:I
    const-string v12, "SimInfoEditor"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "KEY_SIM_NUMBER_FORMAT is "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    if-gez v11, :cond_c

    .line 325
    const/4 v12, 0x0

    goto/16 :goto_0

    .line 328
    :cond_c
    iget-wide v12, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimID:J

    invoke-static {p0, v11, v12, v13}, Landroid/provider/Telephony$SIMInfo;->setDispalyNumberFormat(Landroid/content/Context;IJ)I

    move-result v12

    if-lez v12, :cond_1

    .line 330
    const-string v12, "SimInfoEditor"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "set format succeed "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 331
    const/4 v7, 0x3

    .line 332
    .local v7, simNumType:I
    invoke-direct {p0, v11}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->turnNumformatValuetoIndex(I)I

    move-result v3

    .line 334
    .local v3, nIndex:I
    iget-object v12, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimNumberFormat:Landroid/preference/ListPreference;

    iget-object v13, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mArrayNumFormat:[Ljava/lang/String;

    aget-object v13, v13, v3

    invoke-virtual {v12, v13}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 335
    new-instance v1, Landroid/content/Intent;

    const-string v12, "android.intent.action.SIM_SETTING_INFO_CHANGED"

    invoke-direct {v1, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 336
    .restart local v1       #intent:Landroid/content/Intent;
    const-string v12, "simid"

    iget-wide v13, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimID:J

    invoke-virtual {v1, v12, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 337
    const-string v12, "type"

    const/4 v13, 0x3

    invoke-virtual {v1, v12, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 338
    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_1
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 6
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v5, 0x0

    .line 170
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    const-string v3, "status_info"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 172
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 173
    .local v0, it:Landroid/content/Intent;
    const-string v2, "com.android.settings"

    const-string v3, "com.android.settings.deviceinfo.SimStatusGemini"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 175
    iget-wide v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimID:J

    invoke-static {p0, v2, v3}, Landroid/provider/Telephony$SIMInfo;->getSlotById(Landroid/content/Context;J)I

    move-result v1

    .line 177
    .local v1, slot:I
    if-gez v1, :cond_1

    .line 185
    .end local v0           #it:Landroid/content/Intent;
    .end local v1           #slot:I
    :cond_0
    :goto_0
    return v5

    .line 180
    .restart local v0       #it:Landroid/content/Intent;
    .restart local v1       #slot:I
    :cond_1
    const-string v2, "slotid"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 181
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

    .line 183
    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 154
    invoke-super {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onResume()V

    .line 156
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->updateInfo()V

    .line 158
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    invoke-virtual {v0}, Landroid/preference/EditTextPreference;->getEditText()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 159
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 160
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 3
    .parameter "s"
    .parameter "start"
    .parameter "before"
    .parameter "count"

    .prologue
    .line 377
    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;->mSimName:Landroid/preference/EditTextPreference;

    invoke-virtual {v1}, Landroid/preference/EditTextPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 378
    .local v0, d:Landroid/app/Dialog;
    instance-of v1, v0, Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    .line 379
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

    .line 382
    :cond_0
    return-void

    .line 379
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
