.class public Lcom/mediatek/settings/NetworkEditor;
.super Landroid/preference/PreferenceActivity;
.source "NetworkEditor.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;
.implements Landroid/text/TextWatcher;


# static fields
.field private static final BUTTON_NETWORK_ID_KEY:Ljava/lang/String; = "network_id_key"

.field private static final BUTTON_NEWWORK_MODE_KEY:Ljava/lang/String; = "network_mode_key"

.field private static final BUTTON_PRIORITY_KEY:Ljava/lang/String; = "priority_key"

.field private static final DIALOG_NETWORK_ID:I = 0x0

.field private static final DUAL_MODE:I = 0x2

.field private static final GSM:I = 0x0

.field private static final MENU_DELETE:I = 0x1

.field private static final MENU_DISCARD:I = 0x3

.field private static final MENU_SAVE:I = 0x2

.field public static final MODEM_MASK_TDSCDMA:I = 0x8

.field public static final PLMN_ADD:Ljava/lang/String; = "plmn_add"

.field public static final PLMN_CODE:Ljava/lang/String; = "plmn_code"

.field public static final PLMN_NAME:Ljava/lang/String; = "plmn_name"

.field public static final PLMN_PRIORITY:Ljava/lang/String; = "plmn_priority"

.field public static final PLMN_SERVICE:Ljava/lang/String; = "plmn_service"

.field public static final PLMN_SIZE:Ljava/lang/String; = "plmn_size"

.field public static final PLMN_SLOT:Ljava/lang/String; = "plmn_slot"

.field public static final PROPERTY_KEY:Ljava/lang/String; = "gsm.baseband.capability"

.field public static final RESULT_DELETE:I = 0xc8

.field public static final RESULT_MODIFY:I = 0x64

.field private static final RIL_2G:I = 0x1

.field private static final RIL_2G_3G:I = 0x5

.field private static final RIL_3G:I = 0x4

.field private static final TAG:Ljava/lang/String; = "NetworkEditor"

.field private static final WCDMA_TDSCDMA:I = 0x1


# instance fields
.field private mActSupport:Z

.field private mAirplaneModeEnabled:Z

.field private mDualSimMode:I

.field private mIdDialog:Landroid/app/AlertDialog;

.field private mIntentFilter:Landroid/content/IntentFilter;

.field private mNetworkId:Landroid/preference/Preference;

.field private mNetworkIdListener:Landroid/content/DialogInterface$OnClickListener;

.field private mNetworkIdText:Landroid/widget/EditText;

.field private mNetworkMode:Landroid/preference/ListPreference;

.field private mNotSet:Ljava/lang/String;

.field private mPLMNName:Ljava/lang/String;

.field private mPhoneStateListener:Landroid/telephony/PhoneStateListener;

.field private mPriority:Landroid/preference/EditTextPreference;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mSlotId:I

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 36
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 58
    iput-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkId:Landroid/preference/Preference;

    .line 59
    iput-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mPriority:Landroid/preference/EditTextPreference;

    .line 60
    iput-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkMode:Landroid/preference/ListPreference;

    .line 68
    iput-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mNotSet:Ljava/lang/String;

    .line 71
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/settings/NetworkEditor;->mAirplaneModeEnabled:Z

    .line 72
    const/4 v0, -0x1

    iput v0, p0, Lcom/mediatek/settings/NetworkEditor;->mDualSimMode:I

    .line 84
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/settings/NetworkEditor;->mActSupport:Z

    .line 86
    iput-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mIdDialog:Landroid/app/AlertDialog;

    .line 88
    new-instance v0, Lcom/mediatek/settings/NetworkEditor$1;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/NetworkEditor$1;-><init>(Lcom/mediatek/settings/NetworkEditor;)V

    iput-object v0, p0, Lcom/mediatek/settings/NetworkEditor;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    .line 102
    new-instance v0, Lcom/mediatek/settings/NetworkEditor$2;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/NetworkEditor$2;-><init>(Lcom/mediatek/settings/NetworkEditor;)V

    iput-object v0, p0, Lcom/mediatek/settings/NetworkEditor;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 125
    new-instance v0, Lcom/mediatek/settings/NetworkEditor$3;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/NetworkEditor$3;-><init>(Lcom/mediatek/settings/NetworkEditor;)V

    iput-object v0, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkIdListener:Landroid/content/DialogInterface$OnClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/settings/NetworkEditor;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/mediatek/settings/NetworkEditor;->setScreenEnabled()V

    return-void
.end method

.method static synthetic access$102(Lcom/mediatek/settings/NetworkEditor;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    iput-boolean p1, p0, Lcom/mediatek/settings/NetworkEditor;->mAirplaneModeEnabled:Z

    return p1
.end method

.method static synthetic access$202(Lcom/mediatek/settings/NetworkEditor;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    iput p1, p0, Lcom/mediatek/settings/NetworkEditor;->mDualSimMode:I

    return p1
.end method

.method static synthetic access$300(Lcom/mediatek/settings/NetworkEditor;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget v0, p0, Lcom/mediatek/settings/NetworkEditor;->mSlotId:I

    return v0
.end method

.method static synthetic access$400(Lcom/mediatek/settings/NetworkEditor;)Landroid/widget/EditText;
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-object v0, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkIdText:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mediatek/settings/NetworkEditor;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/mediatek/settings/NetworkEditor;->checkNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/mediatek/settings/NetworkEditor;)Landroid/preference/Preference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-object v0, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkId:Landroid/preference/Preference;

    return-object v0
.end method

.method private checkNotSet(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "value"

    .prologue
    .line 357
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/mediatek/settings/NetworkEditor;->mNotSet:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 358
    :cond_0
    const-string p1, ""

    .line 360
    .end local p1
    :cond_1
    return-object p1
.end method

.method private checkNull(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "value"

    .prologue
    .line 365
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 366
    :cond_0
    iget-object p1, p0, Lcom/mediatek/settings/NetworkEditor;->mNotSet:Ljava/lang/String;

    .line 368
    .end local p1
    :cond_1
    return-object p1
.end method

.method public static covertApNW2Ril(I)I
    .locals 2
    .parameter "mode"

    .prologue
    .line 311
    const/4 v0, 0x0

    .line 312
    .local v0, result:I
    const/4 v1, 0x2

    if-ne p0, v1, :cond_0

    .line 313
    const/4 v0, 0x5

    .line 319
    :goto_0
    return v0

    .line 314
    :cond_0
    const/4 v1, 0x1

    if-ne p0, v1, :cond_1

    .line 315
    const/4 v0, 0x4

    goto :goto_0

    .line 317
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static covertRilNW2Ap(I)I
    .locals 2
    .parameter "mode"

    .prologue
    .line 299
    const/4 v0, 0x0

    .line 300
    .local v0, result:I
    const/4 v1, 0x5

    if-lt p0, v1, :cond_0

    .line 301
    const/4 v0, 0x2

    .line 307
    :goto_0
    return v0

    .line 302
    :cond_0
    and-int/lit8 v1, p0, 0x4

    if-eqz v1, :cond_1

    .line 303
    const/4 v0, 0x1

    goto :goto_0

    .line 305
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private createNetworkInfo(Landroid/content/Intent;)V
    .locals 10
    .parameter "intent"

    .prologue
    const v9, 0x7f07001c

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 323
    const-string v6, "plmn_name"

    invoke-virtual {p1, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/mediatek/settings/NetworkEditor;->mPLMNName:Ljava/lang/String;

    .line 324
    const-string v6, "plmn_code"

    invoke-virtual {p1, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 325
    .local v1, number:Ljava/lang/String;
    iget-object v6, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkId:Landroid/preference/Preference;

    invoke-direct {p0, v1}, Lcom/mediatek/settings/NetworkEditor;->checkNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 326
    const-string v6, "plmn_priority"

    invoke-virtual {p1, v6, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 327
    .local v2, priority:I
    iget-object v6, p0, Lcom/mediatek/settings/NetworkEditor;->mPriority:Landroid/preference/EditTextPreference;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 328
    iget-object v6, p0, Lcom/mediatek/settings/NetworkEditor;->mPriority:Landroid/preference/EditTextPreference;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 329
    const-string v6, "plmn_service"

    invoke-virtual {p1, v6, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 332
    .local v0, act:I
    const-string v6, "NetworkEditor"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "act = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "plmn_add"

    invoke-virtual {v6, v7, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    if-nez v6, :cond_0

    .line 334
    if-eqz v0, :cond_3

    :goto_0
    iput-boolean v4, p0, Lcom/mediatek/settings/NetworkEditor;->mActSupport:Z

    .line 336
    :cond_0
    const-string v4, "NetworkEditor"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mActSupport = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-boolean v6, p0, Lcom/mediatek/settings/NetworkEditor;->mActSupport:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 337
    invoke-static {v0}, Lcom/mediatek/settings/NetworkEditor;->covertRilNW2Ap(I)I

    move-result v0

    .line 338
    if-ltz v0, :cond_1

    const/4 v4, 0x2

    if-le v0, v4, :cond_2

    .line 339
    :cond_1
    const/4 v0, 0x0

    .line 341
    :cond_2
    const-string v3, ""

    .line 342
    .local v3, summary:Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/settings/NetworkEditor;->getBaseBand()I

    move-result v4

    and-int/lit8 v4, v4, 0x8

    if-nez v4, :cond_4

    .line 344
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f07001b

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v4

    aget-object v3, v4, v0

    .line 351
    :goto_1
    iget-object v4, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v4, v3}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 352
    iget-object v4, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 353
    const-string v4, "plmn_slot"

    const/4 v5, -0x1

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    iput v4, p0, Lcom/mediatek/settings/NetworkEditor;->mSlotId:I

    .line 354
    return-void

    .end local v3           #summary:Ljava/lang/String;
    :cond_3
    move v4, v5

    .line 334
    goto :goto_0

    .line 346
    .restart local v3       #summary:Ljava/lang/String;
    :cond_4
    iget-object v4, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 348
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v9}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v4

    aget-object v3, v4, v0

    goto :goto_1
.end method

.method private genNetworkInfo(Landroid/content/Intent;)V
    .locals 6
    .parameter "intent"

    .prologue
    const/4 v5, 0x0

    .line 265
    const-string v3, "plmn_name"

    iget-object v4, p0, Lcom/mediatek/settings/NetworkEditor;->mPLMNName:Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/mediatek/settings/NetworkEditor;->checkNotSet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 266
    const-string v3, "plmn_code"

    iget-object v4, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkId:Landroid/preference/Preference;

    invoke-virtual {v4}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 267
    const/4 v1, 0x0

    .line 268
    .local v1, priority:I
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "plmn_size"

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 270
    .local v2, size:I
    :try_start_0
    iget-object v3, p0, Lcom/mediatek/settings/NetworkEditor;->mPriority:Landroid/preference/EditTextPreference;

    invoke-virtual {v3}, Landroid/preference/EditTextPreference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 274
    :goto_0
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "plmn_add"

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 275
    if-le v1, v2, :cond_0

    .line 276
    move v1, v2

    .line 283
    :cond_0
    :goto_1
    const-string v3, "plmn_priority"

    invoke-virtual {p1, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 285
    :try_start_1
    const-string v3, "plmn_service"

    iget-object v4, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v4}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Lcom/mediatek/settings/NetworkEditor;->covertApNW2Ril(I)I

    move-result v4

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 290
    :goto_2
    return-void

    .line 271
    :catch_0
    move-exception v0

    .line 272
    .local v0, e:Ljava/lang/NumberFormatException;
    const-string v3, "NetworkEditor"

    const-string v4, "parse value of basband error"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 279
    .end local v0           #e:Ljava/lang/NumberFormatException;
    :cond_1
    if-lt v1, v2, :cond_0

    .line 280
    add-int/lit8 v1, v2, -0x1

    goto :goto_1

    .line 287
    :catch_1
    move-exception v0

    .line 288
    .restart local v0       #e:Ljava/lang/NumberFormatException;
    const-string v3, "plmn_service"

    invoke-static {v5}, Lcom/mediatek/settings/NetworkEditor;->covertApNW2Ril(I)I

    move-result v4

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto :goto_2
.end method

.method static getBaseBand()I
    .locals 5

    .prologue
    .line 382
    const/4 v2, 0x0

    .line 383
    .local v2, value:I
    const/4 v0, 0x0

    .line 385
    .local v0, capability:Ljava/lang/String;
    const-string v3, "gsm.baseband.capability"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 386
    if-eqz v0, :cond_0

    const-string v3, ""

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 395
    :cond_0
    :goto_0
    return v2

    .line 391
    :cond_1
    const/16 v3, 0x10

    :try_start_0
    invoke-static {v0, v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    goto :goto_0

    .line 392
    :catch_0
    move-exception v1

    .line 393
    .local v1, ne:Ljava/lang/NumberFormatException;
    const-string v3, "NetworkEditor"

    const-string v4, "parse value of basband error"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private setRemovedNetwork()V
    .locals 2

    .prologue
    .line 293
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/settings/PLMNListPreference;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 294
    .local v0, intent:Landroid/content/Intent;
    const/16 v1, 0xc8

    invoke-virtual {p0, v1, v0}, Lcom/mediatek/settings/NetworkEditor;->setResult(ILandroid/content/Intent;)V

    .line 295
    invoke-direct {p0, v0}, Lcom/mediatek/settings/NetworkEditor;->genNetworkInfo(Landroid/content/Intent;)V

    .line 296
    return-void
.end method

.method private setScreenEnabled()V
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 373
    const/4 v1, 0x0

    .line 374
    .local v1, isShouldEnabled:Z
    iget-object v4, p0, Lcom/mediatek/settings/NetworkEditor;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v4

    if-nez v4, :cond_0

    move v0, v2

    .line 375
    .local v0, isIdle:Z
    :goto_0
    if-eqz v0, :cond_1

    iget-boolean v4, p0, Lcom/mediatek/settings/NetworkEditor;->mAirplaneModeEnabled:Z

    if-nez v4, :cond_1

    iget v4, p0, Lcom/mediatek/settings/NetworkEditor;->mDualSimMode:I

    if-eqz v4, :cond_1

    move v1, v2

    .line 376
    :goto_1
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    .line 377
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->invalidateOptionsMenu()V

    .line 378
    iget-object v4, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkMode:Landroid/preference/ListPreference;

    iget-boolean v5, p0, Lcom/mediatek/settings/NetworkEditor;->mActSupport:Z

    if-eqz v5, :cond_2

    if-eqz v1, :cond_2

    :goto_2
    invoke-virtual {v4, v2}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 379
    return-void

    .end local v0           #isIdle:Z
    :cond_0
    move v0, v3

    .line 374
    goto :goto_0

    .restart local v0       #isIdle:Z
    :cond_1
    move v1, v3

    .line 375
    goto :goto_1

    :cond_2
    move v2, v3

    .line 378
    goto :goto_2
.end method

.method private validateAndSetResult()V
    .locals 2

    .prologue
    .line 259
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/settings/PLMNListPreference;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 260
    .local v0, intent:Landroid/content/Intent;
    const/16 v1, 0x64

    invoke-virtual {p0, v1, v0}, Lcom/mediatek/settings/NetworkEditor;->setResult(ILandroid/content/Intent;)V

    .line 261
    invoke-direct {p0, v0}, Lcom/mediatek/settings/NetworkEditor;->genNetworkInfo(Landroid/content/Intent;)V

    .line 262
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .parameter "s"

    .prologue
    .line 442
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->validate()V

    .line 443
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "count"
    .parameter "after"

    .prologue
    .line 449
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "icicle"

    .prologue
    .line 137
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 138
    const v1, 0x7f060018

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/NetworkEditor;->addPreferencesFromResource(I)V

    .line 139
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0171

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mNotSet:Ljava/lang/String;

    .line 141
    const-string v1, "network_id_key"

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/NetworkEditor;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkId:Landroid/preference/Preference;

    .line 142
    const-string v1, "priority_key"

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/NetworkEditor;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/EditTextPreference;

    iput-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mPriority:Landroid/preference/EditTextPreference;

    .line 143
    const-string v1, "network_mode_key"

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/NetworkEditor;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/ListPreference;

    iput-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkMode:Landroid/preference/ListPreference;

    .line 144
    iget-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mPriority:Landroid/preference/EditTextPreference;

    invoke-virtual {v1, p0}, Landroid/preference/EditTextPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 145
    iget-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v1, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 148
    const-string v1, "phone"

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/NetworkEditor;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    iput-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 149
    iget-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v2, p0, Lcom/mediatek/settings/NetworkEditor;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/16 v3, 0x20

    invoke-virtual {v1, v2, v3}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 150
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mIntentFilter:Landroid/content/IntentFilter;

    .line 151
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 152
    iget-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.DUAL_SIM_MODE"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 154
    :cond_0
    iget-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 155
    iget-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Lcom/mediatek/settings/NetworkEditor;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v1, v2}, Lcom/mediatek/settings/NetworkEditor;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 157
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 158
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_1

    .line 160
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 162
    :cond_1
    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 4
    .parameter "id"

    .prologue
    const/4 v0, 0x0

    .line 410
    if-nez p1, :cond_1

    .line 411
    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkIdText:Landroid/widget/EditText;

    .line 412
    iget-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mNotSet:Ljava/lang/String;

    iget-object v2, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkId:Landroid/preference/Preference;

    invoke-virtual {v2}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 413
    iget-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkIdText:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkId:Landroid/preference/Preference;

    invoke-virtual {v2}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 415
    :cond_0
    iget-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkIdText:Landroid/widget/EditText;

    invoke-virtual {v1, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 416
    iget-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkIdText:Landroid/widget/EditText;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 417
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0121

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkIdText:Landroid/widget/EditText;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x104000a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkIdListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/high16 v3, 0x104

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/settings/NetworkEditor;->mIdDialog:Landroid/app/AlertDialog;

    .line 423
    iget-object v0, p0, Lcom/mediatek/settings/NetworkEditor;->mIdDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 424
    iget-object v0, p0, Lcom/mediatek/settings/NetworkEditor;->mIdDialog:Landroid/app/AlertDialog;

    .line 426
    :cond_1
    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 4
    .parameter "menu"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 210
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 211
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "plmn_add"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 212
    const v0, 0x10403c2

    invoke-interface {p1, v2, v3, v2, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 214
    :cond_0
    const/4 v0, 0x2

    const v1, 0x7f0d0286

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 215
    const/4 v0, 0x3

    const/high16 v1, 0x104

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 216
    return v3
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    .line 178
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 179
    iget-object v0, p0, Lcom/mediatek/settings/NetworkEditor;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/NetworkEditor;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 180
    iget-object v0, p0, Lcom/mediatek/settings/NetworkEditor;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/mediatek/settings/NetworkEditor;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/mediatek/settings/NetworkEditor;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 184
    :cond_0
    return-void
.end method

.method public onMenuOpened(ILandroid/view/Menu;)Z
    .locals 7
    .parameter "featureId"
    .parameter "menu"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 221
    invoke-super {p0, p1, p2}, Landroid/preference/PreferenceActivity;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 222
    const/4 v2, 0x0

    .line 223
    .local v2, isShouldEnabled:Z
    iget-object v5, p0, Lcom/mediatek/settings/NetworkEditor;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v5}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v5

    if-nez v5, :cond_3

    move v1, v3

    .line 224
    .local v1, isIdle:Z
    :goto_0
    if-eqz v1, :cond_4

    iget-boolean v5, p0, Lcom/mediatek/settings/NetworkEditor;->mAirplaneModeEnabled:Z

    if-nez v5, :cond_4

    iget v5, p0, Lcom/mediatek/settings/NetworkEditor;->mDualSimMode:I

    if-eqz v5, :cond_4

    move v2, v3

    .line 225
    :goto_1
    iget-object v5, p0, Lcom/mediatek/settings/NetworkEditor;->mNotSet:Ljava/lang/String;

    iget-object v6, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkId:Landroid/preference/Preference;

    invoke-virtual {v6}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    iget-object v5, p0, Lcom/mediatek/settings/NetworkEditor;->mNotSet:Ljava/lang/String;

    iget-object v6, p0, Lcom/mediatek/settings/NetworkEditor;->mPriority:Landroid/preference/EditTextPreference;

    invoke-virtual {v6}, Landroid/preference/EditTextPreference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    :cond_0
    move v0, v3

    .line 226
    .local v0, isEmpty:Z
    :goto_2
    if-eqz p2, :cond_2

    .line 227
    invoke-interface {p2, v4, v2}, Landroid/view/Menu;->setGroupEnabled(IZ)V

    .line 228
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "plmn_add"

    invoke-virtual {v5, v6, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 229
    invoke-interface {p2, v4}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v5

    if-eqz v2, :cond_1

    if-nez v0, :cond_1

    move v4, v3

    :cond_1
    invoke-interface {v5, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 234
    :cond_2
    :goto_3
    return v3

    .end local v0           #isEmpty:Z
    .end local v1           #isIdle:Z
    :cond_3
    move v1, v4

    .line 223
    goto :goto_0

    .restart local v1       #isIdle:Z
    :cond_4
    move v2, v4

    .line 224
    goto :goto_1

    :cond_5
    move v0, v4

    .line 225
    goto :goto_2

    .line 231
    .restart local v0       #isEmpty:Z
    :cond_6
    invoke-interface {p2, v3}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v5

    if-eqz v2, :cond_7

    if-nez v0, :cond_7

    move v4, v3

    :cond_7
    invoke-interface {v5, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_3
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 239
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 254
    :goto_0
    :sswitch_0
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->finish()V

    .line 255
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_1
    return v0

    .line 241
    :sswitch_1
    invoke-direct {p0}, Lcom/mediatek/settings/NetworkEditor;->setRemovedNetwork()V

    goto :goto_0

    .line 244
    :sswitch_2
    invoke-direct {p0}, Lcom/mediatek/settings/NetworkEditor;->validateAndSetResult()V

    goto :goto_0

    .line 249
    :sswitch_3
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->finish()V

    .line 250
    const/4 v0, 0x1

    goto :goto_1

    .line 239
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_0
        0x102002c -> :sswitch_3
    .end sparse-switch
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 5
    .parameter "preference"
    .parameter "objValue"

    .prologue
    .line 187
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 188
    .local v2, value:Ljava/lang/String;
    iget-object v3, p0, Lcom/mediatek/settings/NetworkEditor;->mPriority:Landroid/preference/EditTextPreference;

    if-ne p1, v3, :cond_1

    .line 189
    iget-object v3, p0, Lcom/mediatek/settings/NetworkEditor;->mPriority:Landroid/preference/EditTextPreference;

    invoke-direct {p0, v2}, Lcom/mediatek/settings/NetworkEditor;->checkNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 205
    :cond_0
    :goto_0
    const/4 v3, 0x1

    return v3

    .line 190
    :cond_1
    iget-object v3, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkMode:Landroid/preference/ListPreference;

    if-ne p1, v3, :cond_0

    .line 191
    iget-object v3, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v3, v2}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 192
    const-string v1, ""

    .line 193
    .local v1, summary:Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 194
    .local v0, index:I
    invoke-static {}, Lcom/mediatek/settings/NetworkEditor;->getBaseBand()I

    move-result v3

    and-int/lit8 v3, v3, 0x8

    if-nez v3, :cond_2

    .line 196
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f07001b

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    aget-object v1, v3, v0

    .line 203
    :goto_1
    iget-object v3, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v3, v1}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 200
    :cond_2
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f07001c

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    aget-object v1, v3, v0

    goto :goto_1
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 2
    .parameter "screen"
    .parameter "preference"

    .prologue
    const/4 v1, 0x0

    .line 400
    iget-object v0, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkId:Landroid/preference/Preference;

    if-ne p2, v0, :cond_0

    .line 401
    invoke-virtual {p0, v1}, Lcom/mediatek/settings/NetworkEditor;->removeDialog(I)V

    .line 402
    invoke-virtual {p0, v1}, Lcom/mediatek/settings/NetworkEditor;->showDialog(I)V

    .line 403
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->validate()V

    .line 405
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/preference/PreferenceActivity;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v0

    return v0
.end method

.method protected onResume()V
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v3, -0x1

    .line 165
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 166
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/settings/NetworkEditor;->createNetworkInfo(Landroid/content/Intent;)V

    .line 167
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_on"

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-ne v1, v0, :cond_1

    :goto_0
    iput-boolean v0, p0, Lcom/mediatek/settings/NetworkEditor;->mAirplaneModeEnabled:Z

    .line 169
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 170
    invoke-virtual {p0}, Lcom/mediatek/settings/NetworkEditor;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "dual_sim_mode_setting"

    invoke-static {v0, v1, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/settings/NetworkEditor;->mDualSimMode:I

    .line 173
    :cond_0
    invoke-direct {p0}, Lcom/mediatek/settings/NetworkEditor;->setScreenEnabled()V

    .line 174
    return-void

    .line 167
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "before"
    .parameter "count"

    .prologue
    .line 454
    return-void
.end method

.method public validate()V
    .locals 4

    .prologue
    .line 430
    iget-object v2, p0, Lcom/mediatek/settings/NetworkEditor;->mNetworkIdText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    .line 431
    .local v0, len:I
    const/4 v1, 0x1

    .line 432
    .local v1, state:Z
    const/4 v2, 0x5

    if-lt v0, v2, :cond_0

    const/4 v2, 0x6

    if-le v0, v2, :cond_1

    .line 433
    :cond_0
    const/4 v1, 0x0

    .line 435
    :cond_1
    iget-object v2, p0, Lcom/mediatek/settings/NetworkEditor;->mIdDialog:Landroid/app/AlertDialog;

    if-eqz v2, :cond_2

    .line 436
    iget-object v2, p0, Lcom/mediatek/settings/NetworkEditor;->mIdDialog:Landroid/app/AlertDialog;

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 438
    :cond_2
    return-void
.end method
