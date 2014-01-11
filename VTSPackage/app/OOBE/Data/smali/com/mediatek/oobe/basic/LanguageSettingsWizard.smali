.class public Lcom/mediatek/oobe/basic/LanguageSettingsWizard;
.super Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;
.source "LanguageSettingsWizard.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;
    }
.end annotation


# static fields
.field private static final DIALOG_WAITING_SWITCHING:I = 0x2711

.field private static final TAG:Ljava/lang/String; = "OOBE"


# instance fields
.field private mAdapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentLocale:Ljava/util/Locale;

.field private mEmergencyButtonClickListener:Landroid/view/View$OnClickListener;

.field private mEmergencybtn:Landroid/widget/Button;

.field protected mLangSelectListener:Landroid/widget/AdapterView$OnItemSelectedListener;

.field private mLocales:[Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;

.field private mSelectedLoc:Ljava/util/Locale;

.field private mShowEmergencycall:Z

.field private mSimStateChangedListener:Landroid/content/BroadcastReceiver;

.field private mSimStateIntentFilter:Landroid/content/IntentFilter;

.field private mSpecialLocaleCodes:[Ljava/lang/String;

.field private mSpecialLocaleNames:[Ljava/lang/String;

.field private mSpinner:Landroid/widget/Spinner;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 82
    invoke-direct {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;-><init>()V

    .line 88
    iput-object v0, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSpinner:Landroid/widget/Spinner;

    .line 90
    iput-object v0, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mAdapter:Landroid/widget/ArrayAdapter;

    .line 124
    new-instance v0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$1;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$1;-><init>(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSimStateChangedListener:Landroid/content/BroadcastReceiver;

    .line 232
    new-instance v0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$2;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$2;-><init>(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mLangSelectListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    .line 248
    new-instance v0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$3;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$3;-><init>(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mEmergencyButtonClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 82
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mShowEmergencycall:Z

    return v0
.end method

.method static synthetic access$002(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 82
    iput-boolean p1, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mShowEmergencycall:Z

    return p1
.end method

.method static synthetic access$100(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;)Landroid/widget/Button;
    .locals 1
    .parameter "x0"

    .prologue
    .line 82
    iget-object v0, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mEmergencybtn:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 82
    invoke-direct {p0, p1}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->updateEmergencycallButton(Z)V

    return-void
.end method

.method static synthetic access$302(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;Ljava/util/Locale;)Ljava/util/Locale;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 82
    iput-object p1, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSelectedLoc:Ljava/util/Locale;

    return-object p1
.end method

.method static synthetic access$400(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;)[Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;
    .locals 1
    .parameter "x0"

    .prologue
    .line 82
    iget-object v0, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mLocales:[Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;

    return-object v0
.end method

.method private getDisplayName(Ljava/util/Locale;)Ljava/lang/String;
    .locals 3
    .parameter "l"

    .prologue
    .line 346
    invoke-virtual {p1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    .line 348
    .local v0, code:Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v2, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSpecialLocaleCodes:[Ljava/lang/String;

    array-length v2, v2

    if-ge v1, v2, :cond_1

    .line 349
    iget-object v2, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSpecialLocaleCodes:[Ljava/lang/String;

    aget-object v2, v2, v1

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 350
    iget-object v2, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSpecialLocaleNames:[Ljava/lang/String;

    aget-object v2, v2, v1

    .line 354
    :goto_1
    return-object v2

    .line 348
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 354
    :cond_1
    invoke-virtual {p1, p1}, Ljava/util/Locale;->getDisplayName(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1
.end method

.method private getLanguage()Ljava/util/Locale;
    .locals 5

    .prologue
    .line 423
    const-string v3, "OOBE"

    const-string v4, "Get Language"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 425
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v0

    .line 426
    .local v0, am:Landroid/app/IActivityManager;
    invoke-interface {v0}, Landroid/app/IActivityManager;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    .line 428
    .local v1, config:Landroid/content/res/Configuration;
    iget-object v3, v1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 435
    .end local v0           #am:Landroid/app/IActivityManager;
    .end local v1           #config:Landroid/content/res/Configuration;
    :goto_0
    return-object v3

    .line 430
    :catch_0
    move-exception v2

    .line 431
    .local v2, e:Landroid/os/RemoteException;
    const-string v3, "OOBE"

    const-string v4, "Excetpion"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 432
    invoke-virtual {v2}, Landroid/os/RemoteException;->printStackTrace()V

    .line 435
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private initLanguageSettings()V
    .locals 19

    .prologue
    .line 261
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    const/high16 v18, 0x7f06

    invoke-virtual/range {v17 .. v18}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSpecialLocaleCodes:[Ljava/lang/String;

    .line 262
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    const v18, 0x7f060001

    invoke-virtual/range {v17 .. v18}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSpecialLocaleNames:[Ljava/lang/String;

    .line 264
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/content/res/AssetManager;->getLocales()[Ljava/lang/String;

    move-result-object v13

    .line 265
    .local v13, locales:[Ljava/lang/String;
    invoke-static {v13}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 267
    array-length v14, v13

    .line 268
    .local v14, origSize:I
    const/4 v12, 0x5

    .line 269
    .local v12, localeStringLength:I
    const/4 v10, 0x2

    .line 270
    .local v10, languageIndexEnd:I
    new-array v15, v14, [Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;

    .line 271
    .local v15, preprocess:[Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;
    const/4 v4, 0x0

    .line 272
    .local v4, finalSize:I
    const/4 v6, 0x0

    .local v6, i:I
    move v5, v4

    .end local v4           #finalSize:I
    .local v5, finalSize:I
    :goto_0
    if-ge v6, v14, :cond_3

    .line 273
    aget-object v16, v13, v6

    .line 274
    .local v16, s:Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v11

    .line 275
    .local v11, len:I
    const/16 v17, 0x5

    move/from16 v0, v17

    if-ne v11, v0, :cond_7

    .line 276
    const/16 v17, 0x0

    const/16 v18, 0x2

    invoke-virtual/range {v16 .. v18}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 277
    .local v9, language:Ljava/lang/String;
    const/16 v17, 0x3

    const/16 v18, 0x5

    invoke-virtual/range {v16 .. v18}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 278
    .local v2, country:Ljava/lang/String;
    new-instance v8, Ljava/util/Locale;

    invoke-direct {v8, v9, v2}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    .local v8, l:Ljava/util/Locale;
    if-nez v5, :cond_0

    .line 284
    add-int/lit8 v4, v5, 0x1

    .end local v5           #finalSize:I
    .restart local v4       #finalSize:I
    new-instance v17, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;

    invoke-virtual {v8, v8}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->toTitleCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v8}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    aput-object v17, v15, v5

    .line 272
    .end local v2           #country:Ljava/lang/String;
    .end local v8           #l:Ljava/util/Locale;
    .end local v9           #language:Ljava/lang/String;
    :goto_1
    add-int/lit8 v6, v6, 0x1

    move v5, v4

    .end local v4           #finalSize:I
    .restart local v5       #finalSize:I
    goto :goto_0

    .line 290
    .restart local v2       #country:Ljava/lang/String;
    .restart local v8       #l:Ljava/util/Locale;
    .restart local v9       #language:Ljava/lang/String;
    :cond_0
    add-int/lit8 v17, v5, -0x1

    aget-object v17, v15, v17

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;->mLocale:Ljava/util/Locale;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_1

    .line 295
    add-int/lit8 v17, v5, -0x1

    aget-object v17, v15, v17

    add-int/lit8 v18, v5, -0x1

    aget-object v18, v15, v18

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;->mLocale:Ljava/util/Locale;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->getDisplayName(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->toTitleCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    iput-object v0, v1, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;->mLabel:Ljava/lang/String;

    .line 299
    add-int/lit8 v4, v5, 0x1

    .end local v5           #finalSize:I
    .restart local v4       #finalSize:I
    new-instance v17, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;

    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->getDisplayName(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->toTitleCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v8}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    aput-object v17, v15, v5

    goto :goto_1

    .line 302
    .end local v4           #finalSize:I
    .restart local v5       #finalSize:I
    :cond_1
    const-string v17, "zz_ZZ"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_2

    .line 303
    const-string v3, "Pseudo..."

    .line 310
    .local v3, displayName:Ljava/lang/String;
    :goto_2
    add-int/lit8 v4, v5, 0x1

    .end local v5           #finalSize:I
    .restart local v4       #finalSize:I
    new-instance v17, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;

    move-object/from16 v0, v17

    invoke-direct {v0, v3, v8}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    aput-object v17, v15, v5

    goto :goto_1

    .line 305
    .end local v3           #displayName:Ljava/lang/String;
    .end local v4           #finalSize:I
    .restart local v5       #finalSize:I
    :cond_2
    invoke-virtual {v8, v8}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->toTitleCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .restart local v3       #displayName:Ljava/lang/String;
    goto :goto_2

    .line 316
    .end local v2           #country:Ljava/lang/String;
    .end local v3           #displayName:Ljava/lang/String;
    .end local v8           #l:Ljava/util/Locale;
    .end local v9           #language:Ljava/lang/String;
    .end local v11           #len:I
    .end local v16           #s:Ljava/lang/String;
    :cond_3
    new-array v0, v5, [Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mLocales:[Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;

    .line 317
    const/4 v6, 0x0

    :goto_3
    if-ge v6, v5, :cond_4

    .line 318
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mLocales:[Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;

    move-object/from16 v17, v0

    aget-object v18, v15, v6

    aput-object v18, v17, v6

    .line 317
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 320
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mLocales:[Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 322
    invoke-direct/range {p0 .. p0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->getLanguage()Ljava/util/Locale;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mCurrentLocale:Ljava/util/Locale;

    .line 323
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mAdapter:Landroid/widget/ArrayAdapter;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/widget/ArrayAdapter;->clear()V

    .line 326
    const/4 v7, 0x0

    .local v7, j:I
    :goto_4
    if-ge v7, v5, :cond_6

    .line 328
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mAdapter:Landroid/widget/ArrayAdapter;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mLocales:[Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;

    move-object/from16 v18, v0

    aget-object v18, v18, v7

    invoke-virtual/range {v18 .. v18}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 331
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mCurrentLocale:Ljava/util/Locale;

    move-object/from16 v17, v0

    if-eqz v17, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mCurrentLocale:Ljava/util/Locale;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mLocales:[Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;

    move-object/from16 v18, v0

    aget-object v18, v18, v7

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;->mLocale:Ljava/util/Locale;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_5

    .line 332
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSpinner:Landroid/widget/Spinner;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v0, v7, v1}, Landroid/widget/Spinner;->setSelection(IZ)V

    .line 326
    :cond_5
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 335
    :cond_6
    return-void

    .end local v7           #j:I
    .restart local v11       #len:I
    .restart local v16       #s:Ljava/lang/String;
    :cond_7
    move v4, v5

    .end local v5           #finalSize:I
    .restart local v4       #finalSize:I
    goto/16 :goto_1
.end method

.method private isEmergencycallShow()Z
    .locals 11

    .prologue
    const/4 v10, 0x5

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 186
    const-string v7, "OOBE"

    const-string v8, "LanuageSettingsWizard getEmergencycallAvialiable() function"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    invoke-static {}, Lcom/mediatek/telephony/TelephonyManagerEx;->getDefault()Lcom/mediatek/telephony/TelephonyManagerEx;

    move-result-object v3

    .line 189
    .local v3, telManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;
    invoke-static {}, Lcom/mediatek/oobe/utils/Utils;->isGemini()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 190
    invoke-virtual {v3, v6}, Lcom/mediatek/telephony/TelephonyManagerEx;->getSimState(I)I

    move-result v0

    .line 192
    .local v0, sim1State:I
    invoke-virtual {v3, v5}, Lcom/mediatek/telephony/TelephonyManagerEx;->getSimState(I)I

    move-result v1

    .line 193
    .local v1, sim2State:I
    const-string v7, "OOBE"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "LanuageSettingsWizard isGemini true"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    if-eq v0, v10, :cond_1

    if-eq v1, v10, :cond_1

    .line 200
    .end local v0           #sim1State:I
    .end local v1           #sim2State:I
    :cond_0
    :goto_0
    return v5

    .restart local v0       #sim1State:I
    .restart local v1       #sim2State:I
    :cond_1
    move v5, v6

    .line 194
    goto :goto_0

    .line 197
    .end local v0           #sim1State:I
    .end local v1           #sim2State:I
    :cond_2
    const-string v7, "phone"

    invoke-virtual {p0, v7}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/TelephonyManager;

    .line 198
    .local v4, telephonyManager:Landroid/telephony/TelephonyManager;
    const-string v7, "OOBE"

    const-string v8, "LanuageSettingsWizard isGemini false"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v2

    .line 200
    .local v2, simState:I
    if-ne v2, v10, :cond_0

    move v5, v6

    goto :goto_0
.end method

.method private setLanguage(Ljava/util/Locale;)V
    .locals 6
    .parameter "lang"

    .prologue
    .line 403
    const-string v3, "OOBE"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "------Set Language: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v0

    .line 406
    .local v0, am:Landroid/app/IActivityManager;
    invoke-interface {v0}, Landroid/app/IActivityManager;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    .line 408
    .local v1, config:Landroid/content/res/Configuration;
    iput-object p1, v1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 409
    const/4 v3, 0x1

    iput-boolean v3, v1, Landroid/content/res/Configuration;->userSetLocale:Z

    .line 411
    invoke-interface {v0, v1}, Landroid/app/IActivityManager;->updateConfiguration(Landroid/content/res/Configuration;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 416
    .end local v0           #am:Landroid/app/IActivityManager;
    .end local v1           #config:Landroid/content/res/Configuration;
    :goto_0
    const-string v3, "OOBE"

    const-string v4, "------Set Language: updateHourFormat"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 417
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->updateHourFormat()V

    .line 419
    const-string v3, "com.android.providers.settings"

    invoke-static {v3}, Landroid/app/backup/BackupManager;->dataChanged(Ljava/lang/String;)V

    .line 420
    return-void

    .line 412
    :catch_0
    move-exception v2

    .line 413
    .local v2, e:Landroid/os/RemoteException;
    const-string v3, "OOBE"

    const-string v4, "Excetpion"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 414
    invoke-virtual {v2}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method private static toTitleCase(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "s"

    .prologue
    .line 338
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 342
    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method private updateEmergencycallButton(Z)V
    .locals 4
    .parameter "showEmergencycall"

    .prologue
    .line 160
    const-string v1, "OOBE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mShowEmergencycall:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mShowEmergencycall:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    const/4 v0, 0x0

    .line 163
    .local v0, toShow:Z
    invoke-static {p0}, Lcom/mediatek/oobe/utils/Utils;->isWifiOnly(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 164
    const/4 v0, 0x0

    .line 169
    :goto_0
    const-string v1, "OOBE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[updateEmergencycallButton] toShow:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    if-eqz v0, :cond_1

    .line 171
    iget-object v1, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mEmergencybtn:Landroid/widget/Button;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 172
    iget-object v1, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mEmergencybtn:Landroid/widget/Button;

    iget-object v2, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mEmergencyButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 178
    :goto_1
    return-void

    .line 166
    :cond_0
    move v0, p1

    goto :goto_0

    .line 174
    :cond_1
    iget-object v1, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mEmergencybtn:Landroid/widget/Button;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 175
    iget-object v1, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mEmergencybtn:Landroid/widget/Button;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1
.end method

.method private updateHourFormat()V
    .locals 5

    .prologue
    .line 392
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v0

    .line 393
    .local v0, is24Hour:Z
    if-nez v0, :cond_0

    .line 394
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x1040030

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 395
    .local v1, pattern:Ljava/lang/String;
    const/16 v2, 0x48

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ltz v2, :cond_0

    .line 396
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "time_12_24"

    const-string v4, "24"

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 399
    .end local v1           #pattern:Ljava/lang/String;
    :cond_0
    return-void
.end method


# virtual methods
.method protected getStepSpecialTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 440
    const-string v0, "LanguageSetupActivity"

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .parameter "savedInstanceState"

    .prologue
    const/4 v5, 0x0

    .line 208
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 210
    const-string v2, "OOBE"

    const-string v3, "OnCreate LanguageSettingsWizard"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.SIM_STATE_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSimStateIntentFilter:Landroid/content/IntentFilter;

    .line 213
    const v2, 0x7f0b000d

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Spinner;

    iput-object v2, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSpinner:Landroid/widget/Spinner;

    .line 214
    iget-object v2, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSpinner:Landroid/widget/Spinner;

    invoke-virtual {v2, v5}, Landroid/widget/Spinner;->setVisibility(I)V

    .line 215
    new-instance v2, Landroid/widget/ArrayAdapter;

    const v3, 0x7f030008

    const v4, 0x7f0b0019

    invoke-direct {v2, p0, v3, v4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;II)V

    iput-object v2, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mAdapter:Landroid/widget/ArrayAdapter;

    .line 216
    iget-object v2, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSpinner:Landroid/widget/Spinner;

    iget-object v3, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 217
    iget-object v2, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSpinner:Landroid/widget/Spinner;

    iget-object v3, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mLangSelectListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 219
    const v2, 0x7f0b000f

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 220
    .local v1, welcomeView:Landroid/view/View;
    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 221
    const v2, 0x102000a

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 222
    .local v0, prefView:Landroid/view/View;
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 224
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->isEmergencycallShow()Z

    move-result v2

    iput-boolean v2, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mShowEmergencycall:Z

    .line 226
    const v2, 0x7f0b000e

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mEmergencybtn:Landroid/widget/Button;

    .line 227
    iget-boolean v2, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mShowEmergencycall:Z

    invoke-direct {p0, v2}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->updateEmergencycallButton(Z)V

    .line 229
    const v2, 0x7f09004d

    const v3, 0x7f09004e

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->initSpecialLayout(II)V

    .line 230
    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 3
    .parameter "id"

    .prologue
    .line 359
    const/16 v1, 0x2711

    if-ne p1, v1, :cond_0

    .line 360
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 361
    .local v0, dialog:Landroid/app/ProgressDialog;
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f090060

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 362
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 363
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 366
    .end local v0           #dialog:Landroid/app/ProgressDialog;
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 371
    const-string v0, "OOBE"

    const-string v1, "LanguageSetupActivity onDestroy"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 372
    const/16 v0, 0x2711

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->removeDialog(I)V

    .line 373
    invoke-super {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onDestroy()V

    .line 374
    return-void
.end method

.method public onNextStep(Z)V
    .locals 2
    .parameter "isNext"

    .prologue
    .line 446
    if-nez p1, :cond_0

    .line 447
    const-string v0, "OOBE"

    const-string v1, "Back to former settings"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 448
    const/16 v0, 0x15

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->finishActivityByResultCode(I)V

    .line 463
    :goto_0
    return-void

    .line 450
    :cond_0
    const-string v0, "OOBE"

    const-string v1, "Forward to next settings"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 451
    iget-boolean v0, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mLastStep:Z

    if-eqz v0, :cond_1

    .line 452
    const/16 v0, 0x16

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->finishActivityByResultCode(I)V

    goto :goto_0

    .line 454
    :cond_1
    iget-object v0, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSelectedLoc:Ljava/util/Locale;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSelectedLoc:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mCurrentLocale:Ljava/util/Locale;

    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 455
    const-string v0, "OOBE"

    const-string v1, "Set Language"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 456
    const/16 v0, 0x2711

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->showDialog(I)V

    .line 457
    iget-object v0, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSelectedLoc:Ljava/util/Locale;

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->setLanguage(Ljava/util/Locale;)V

    .line 459
    :cond_2
    const-string v0, "OOBE"

    const-string v1, "------RESULT_CODE_NEXT"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 460
    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->finishActivityByResultCode(I)V

    goto :goto_0
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 379
    invoke-super {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onPause()V

    .line 380
    iget-object v0, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSimStateChangedListener:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 381
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 386
    invoke-super {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onResume()V

    .line 387
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->initLanguageSettings()V

    .line 388
    iget-object v0, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSimStateChangedListener:Landroid/content/BroadcastReceiver;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSimStateIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 389
    return-void
.end method
