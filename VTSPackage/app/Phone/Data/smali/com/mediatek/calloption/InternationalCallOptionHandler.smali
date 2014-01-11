.class public abstract Lcom/mediatek/calloption/InternationalCallOptionHandler;
.super Lcom/mediatek/calloption/CallOptionBaseHandler;
.source "InternationalCallOptionHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/content/DialogInterface$OnDismissListener;
.implements Landroid/content/DialogInterface$OnCancelListener;


# static fields
.field private static final COUNTRY_ISO_CHINA:Ljava/lang/String; = "CN"

.field private static final COUNTRY_ISO_TAIWAN:Ljava/lang/String; = "TW"

.field private static final COUNTRY_ISO_USA:Ljava/lang/String; = "US"

.field private static final INTERNATIONAL_DIALING_PREFERENCE_KEY:Ljava/lang/String; = "international_dialing_key"

.field private static final TAG:Ljava/lang/String; = "InternationalCallOptionHandler"


# instance fields
.field protected mDialogHandler:Lcom/mediatek/calloption/InternationalDialogHandler;

.field private mRequest:Lcom/mediatek/calloption/Request;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 62
    invoke-direct {p0}, Lcom/mediatek/calloption/CallOptionBaseHandler;-><init>()V

    return-void
.end method

.method private addValidCountryISOFromCallHistory(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;)V
    .locals 3
    .parameter "context"
    .parameter "number"
    .parameter
    .parameter "onlyFirstOne"
    .parameter "deniedCountryISO"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 498
    .local p3, validCountryISOList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {p1}, Lcom/mediatek/phone/provider/CallHistory$Calls;->getAllCountryISO(Landroid/content/Context;)Landroid/database/Cursor;

    move-result-object v1

    .line 499
    .local v1, cursor:Landroid/database/Cursor;
    const/4 v0, 0x0

    .line 500
    .local v0, countryISO:Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 501
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 502
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v2

    if-nez v2, :cond_4

    .line 503
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 504
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 505
    :cond_0
    invoke-static {p1, p2, v0}, Lcom/mediatek/calloption/CallOptionUtils;->isValidNumberForCountryISO(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 506
    if-eqz p4, :cond_2

    .line 507
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 508
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 521
    :cond_1
    :goto_1
    return-void

    .line 511
    :cond_2
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 512
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 517
    :cond_3
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 519
    :cond_4
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_1
.end method

.method private findValidCountryISO(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;
    .locals 16
    .parameter "context"
    .parameter "number"
    .parameter "preferCountryISO"
    .parameter "deniedCountryISO"
    .parameter "onlyFirstOne"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 435
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 436
    .local v5, validCountryISOList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static/range {p3 .. p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 437
    invoke-static/range {p1 .. p3}, Lcom/mediatek/calloption/CallOptionUtils;->isValidNumberForCountryISO(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 438
    move-object/from16 v0, p3

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 439
    if-eqz p5, :cond_0

    .line 492
    :goto_0
    return-object v5

    .line 444
    :cond_0
    invoke-static/range {p1 .. p1}, Lcom/mediatek/calloption/CallOptionUtils;->getCurrentCountryISO(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    .line 445
    .local v9, currentCountryISO:Ljava/lang/String;
    invoke-static/range {p4 .. p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    move-object/from16 v0, p4

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 446
    :cond_1
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v1, v9}, Lcom/mediatek/calloption/CallOptionUtils;->isValidNumberForCountryISO(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 447
    if-eqz p5, :cond_2

    .line 448
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 451
    :cond_2
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 452
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 457
    :cond_3
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v15

    .line 458
    .local v15, telephonyManager:Landroid/telephony/TelephonyManager;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/calloption/InternationalCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v2}, Lcom/mediatek/calloption/Request;->isMultipleSim()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 459
    sget-object v8, Lcom/mediatek/phone/GeminiConstants;->SLOTS:[I

    .local v8, arr$:[I
    array-length v11, v8

    .local v11, len$:I
    const/4 v10, 0x0

    .local v10, i$:I
    :goto_1
    if-ge v10, v11, :cond_a

    aget v14, v8, v10

    .line 460
    .local v14, slot:I
    invoke-virtual {v15, v14}, Landroid/telephony/TelephonyManager;->getSimCountryIsoGemini(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v12

    .line 461
    .local v12, sim1CountryISO:Ljava/lang/String;
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6

    invoke-static/range {p4 .. p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    move-object/from16 v0, p4

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 463
    :cond_4
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v1, v12}, Lcom/mediatek/calloption/CallOptionUtils;->isValidNumberForCountryISO(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 464
    if-eqz p5, :cond_5

    .line 465
    invoke-virtual {v5, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 468
    :cond_5
    invoke-virtual {v5, v12}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 469
    invoke-virtual {v5, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 459
    :cond_6
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 476
    .end local v8           #arr$:[I
    .end local v10           #i$:I
    .end local v11           #len$:I
    .end local v12           #sim1CountryISO:Ljava/lang/String;
    .end local v14           #slot:I
    :cond_7
    invoke-virtual {v15}, Landroid/telephony/TelephonyManager;->getSimCountryIso()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v13

    .line 477
    .local v13, simCountryISO:Ljava/lang/String;
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_a

    invoke-static/range {p4 .. p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_8

    move-object/from16 v0, p4

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    .line 479
    :cond_8
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v1, v13}, Lcom/mediatek/calloption/CallOptionUtils;->isValidNumberForCountryISO(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 480
    if-eqz p5, :cond_9

    .line 481
    invoke-virtual {v5, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 484
    :cond_9
    invoke-virtual {v5, v13}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    .line 485
    invoke-virtual {v5, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .end local v13           #simCountryISO:Ljava/lang/String;
    :cond_a
    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move/from16 v6, p5

    move-object/from16 v7, p4

    .line 491
    invoke-direct/range {v2 .. v7}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->addValidCountryISOFromCallHistory(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;)V

    goto/16 :goto_0
.end method

.method private findValidCountryISOFromDefaultCountry(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "context"
    .parameter "number"

    .prologue
    .line 524
    const-string v0, ""

    .line 525
    .local v0, validCountryISO:Ljava/lang/String;
    invoke-static {p1}, Lcom/mediatek/calloption/CallOptionUtils;->getCurrentCountryISO(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "CN"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "CN"

    invoke-static {p1, p2, v1}, Lcom/mediatek/calloption/CallOptionUtils;->isValidNumberForCountryISO(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 527
    const-string v0, "CN"

    .line 539
    :cond_0
    :goto_0
    return-object v0

    .line 529
    :cond_1
    invoke-static {p1}, Lcom/mediatek/calloption/CallOptionUtils;->getCurrentCountryISO(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "TW"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "TW"

    invoke-static {p1, p2, v1}, Lcom/mediatek/calloption/CallOptionUtils;->isValidNumberForCountryISO(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 531
    const-string v0, "TW"

    goto :goto_0

    .line 533
    :cond_2
    invoke-static {p1}, Lcom/mediatek/calloption/CallOptionUtils;->getCurrentCountryISO(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "US"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "US"

    invoke-static {p1, p2, v1}, Lcom/mediatek/calloption/CallOptionUtils;->isValidNumberForCountryISO(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 535
    const-string v0, "US"

    goto :goto_0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 551
    const-string v0, "InternationalCallOptionHandler"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 552
    return-void
.end method


# virtual methods
.method public dismissDialog()V
    .locals 1

    .prologue
    .line 543
    const-string v0, "dismissDialog()"

    invoke-static {v0}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 544
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalCallOptionHandler;->mDialogHandler:Lcom/mediatek/calloption/InternationalDialogHandler;

    if-eqz v0, :cond_0

    .line 545
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalCallOptionHandler;->mDialogHandler:Lcom/mediatek/calloption/InternationalDialogHandler;

    invoke-virtual {v0}, Lcom/mediatek/calloption/InternationalDialogHandler;->onHandledDialogDismiss()V

    .line 547
    :cond_0
    invoke-super {p0}, Lcom/mediatek/calloption/CallOptionBaseHandler;->dismissDialog()V

    .line 548
    return-void
.end method

.method public handleRequest(Lcom/mediatek/calloption/Request;)V
    .locals 65
    .parameter "request"

    .prologue
    .line 80
    const-string v5, "handleRequest()"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 82
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/calloption/InternationalCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    .line 84
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/calloption/CallOptionUtils;->getInitialNumber(Landroid/content/Context;Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v12

    .line 88
    .local v12, number:Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "international_dialing_key"

    const/4 v9, 0x0

    invoke-static {v5, v6, v9}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v57

    .line 90
    .local v57, internationalDialingSetting:I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "internationalDialingSetting = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v57

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 91
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "com.android.phone.extra.international"

    const/4 v9, 0x0

    invoke-virtual {v5, v6, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v17

    .line 93
    .local v17, internationalDialOption:I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "internationalDialOption = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 94
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    const-string v5, "+"

    invoke-virtual {v12, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    const-string v5, "#"

    invoke-virtual {v12, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "com.android.phone.extra.ip"

    const/4 v9, 0x0

    invoke-virtual {v5, v6, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_1

    const/4 v5, 0x2

    move/from16 v0, v17

    if-eq v5, v0, :cond_1

    const/4 v5, 0x1

    move/from16 v0, v57

    if-eq v5, v0, :cond_0

    const/4 v5, 0x1

    move/from16 v0, v17

    if-ne v5, v0, :cond_1

    :cond_0
    invoke-static {}, Lcom/mediatek/phone/SIMInfoWrapper;->getDefault()Lcom/mediatek/phone/SIMInfoWrapper;

    move-result-object v5

    invoke-virtual {v5}, Lcom/mediatek/phone/SIMInfoWrapper;->getInsertedSimCount()I

    move-result v5

    if-eqz v5, :cond_1

    invoke-static {v12}, Landroid/telephony/PhoneNumberUtils;->isEmergencyNumber(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 101
    :cond_1
    const-string v5, "number beging with + or international dialing setting is off or some other conditions, dial directly"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 102
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    if-eqz v5, :cond_2

    .line 103
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Lcom/mediatek/calloption/CallOptionBaseHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    .line 379
    :cond_2
    :goto_0
    return-void

    .line 107
    :cond_3
    const/16 v60, 0x0

    .line 109
    .local v60, isOffhook:Z
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getTelephonyInterface()Lcom/android/internal/telephony/ITelephony;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/telephony/ITelephony;->isOffhook()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v60

    .line 113
    :goto_1
    if-eqz v60, :cond_4

    .line 114
    const-string v5, "is offhook"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 115
    const/4 v5, 0x6

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getActivityContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/mediatek/calloption/CallOptionUtils;->getCurrentCountryISO(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v12}, Lcom/mediatek/telephony/PhoneNumberUtilsEx;->isValidNumber(Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    if-ne v5, v6, :cond_4

    .line 117
    const-string v5, "current phone state is offhook and number is valid when call exists, so call directly"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 118
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    if-eqz v5, :cond_2

    .line 119
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Lcom/mediatek/calloption/CallOptionBaseHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    goto :goto_0

    .line 110
    :catch_0
    move-exception v55

    .line 111
    .local v55, e:Landroid/os/RemoteException;
    const-string v5, "Remote exception happen when call ITelephony::isOffhook()"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 125
    .end local v55           #e:Landroid/os/RemoteException;
    :cond_4
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/calloption/CallOptionUtils;->getCurrentCountryISO(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    .line 126
    .local v8, currentCountryISO:Ljava/lang/String;
    move-object/from16 v26, v12

    .line 127
    .local v26, number2:Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "CallHistory getCallInfo start, number2 = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v26

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 128
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    move-object/from16 v0, v26

    invoke-static {v5, v0}, Lcom/mediatek/phone/provider/CallHistory$Calls;->getCallInfo(Landroid/content/Context;Ljava/lang/String;)Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;

    move-result-object v51

    .line 129
    .local v51, callInfo:Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;
    const/4 v5, 0x1

    move/from16 v0, v17

    if-eq v5, v0, :cond_f

    if-eqz v51, :cond_f

    .line 130
    const-string v5, "CallHistory getCallInfo end, get same call history!"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 131
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "number = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", number2 = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v26

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", country iso = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v51

    iget-object v6, v0, Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;->mCountryISO:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " area code = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v51

    iget-object v6, v0, Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;->mAreaCode:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", confirm = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v51

    iget-wide v9, v0, Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;->mConfirm:J

    invoke-virtual {v5, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 133
    move-object/from16 v0, v51

    iget-object v7, v0, Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;->mCountryISO:Ljava/lang/String;

    .line 134
    .local v7, countryISORecorded:Ljava/lang/String;
    move-object/from16 v0, v51

    iget-object v0, v0, Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;->mAreaCode:Ljava/lang/String;

    move-object/from16 v23, v0

    .line 135
    .local v23, areaCodeRecorded:Ljava/lang/String;
    move-object/from16 v0, v51

    iget-wide v0, v0, Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;->mConfirm:J

    move-wide/from16 v52, v0

    .line 138
    .local v52, confirm:J
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 140
    const-string v5, "find same call history, and call history\'s country iso is same as current one, dial directly"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 141
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    if-eqz v5, :cond_2

    .line 142
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Lcom/mediatek/calloption/CallOptionBaseHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    goto/16 :goto_0

    .line 146
    :cond_5
    const-string v5, "The current country ISO is different with recorded one"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 149
    invoke-static {v7}, Lcom/mediatek/telephony/PhoneNumberUtilsEx;->getInternationalPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v59

    .line 150
    .local v59, internationlPrefixRecorded:Ljava/lang/String;
    invoke-static/range {v59 .. v59}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v64

    .line 151
    .local v64, pattern:Ljava/util/regex/Pattern;
    move-object/from16 v0, v64

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v62

    .line 152
    .local v62, matcher:Ljava/util/regex/Matcher;
    invoke-virtual/range {v62 .. v62}, Ljava/util/regex/Matcher;->matches()Z

    move-result v5

    if-nez v5, :cond_8

    invoke-virtual/range {v62 .. v62}, Ljava/util/regex/Matcher;->lookingAt()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 155
    const-string v5, "The dialed number starts with recorded country ISO\'s international prefix"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 156
    invoke-static {v8}, Lcom/mediatek/telephony/PhoneNumberUtilsEx;->getInternationalPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v58

    .line 157
    .local v58, internationlPrefixCurrent:Ljava/lang/String;
    invoke-virtual/range {v58 .. v59}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_7

    .line 159
    const-string v5, "Current country ISO\'s international prefix is different with that of recorded one"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 160
    const-string v5, "+"

    move-object/from16 v0, v62

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->replaceFirst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 162
    .local v13, formatNumber:Ljava/lang/String;
    const-wide/16 v5, 0x1

    cmp-long v5, v5, v52

    if-nez v5, :cond_6

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "com.android.phone.extra.forbid_dialog"

    const/4 v9, 0x0

    invoke-virtual {v5, v6, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_6

    .line 163
    const-string v5, "confirm is 1, pop up internation prefix confirm dialog"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 166
    new-instance v61, Ljava/util/Locale;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v61

    invoke-direct {v0, v5, v8}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    .local v61, locale:Ljava/util/Locale;
    new-instance v4, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    const/4 v5, 0x0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v6

    move-object/from16 v0, v61

    invoke-virtual {v0, v6}, Ljava/util/Locale;->getDisplayCountry(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-direct/range {v4 .. v16}, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 170
    .local v4, prefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getActivityContext()Landroid/content/Context;

    move-result-object v15

    const/16 v16, 0x0

    move-object/from16 v14, p0

    move-object/from16 v18, v4

    move-object/from16 v19, p0

    move-object/from16 v20, p0

    move-object/from16 v21, p0

    invoke-virtual/range {v14 .. v21}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->showDialog(Landroid/content/Context;IILcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V

    .line 173
    new-instance v5, Lcom/mediatek/phone/provider/CallHistoryAsync;

    invoke-direct {v5}, Lcom/mediatek/phone/provider/CallHistoryAsync;-><init>()V

    new-instance v6, Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    const-wide/16 v10, 0x0

    invoke-direct {v6, v9, v12, v10, v11}, Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;-><init>(Landroid/content/Context;Ljava/lang/String;J)V

    invoke-virtual {v5, v6}, Lcom/mediatek/phone/provider/CallHistoryAsync;->updateConfirmFlag(Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;)Landroid/os/AsyncTask;

    goto/16 :goto_0

    .line 179
    .end local v4           #prefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;
    .end local v61           #locale:Ljava/util/Locale;
    :cond_6
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "android.phone.extra.ACTUAL_NUMBER_TO_DIAL"

    invoke-virtual {v5, v6, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 182
    .end local v13           #formatNumber:Ljava/lang/String;
    :cond_7
    const-string v5, "Current country ISO\'s international prefix is same as that of recorded one, dial directly"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 183
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    if-eqz v5, :cond_2

    .line 184
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Lcom/mediatek/calloption/CallOptionBaseHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    goto/16 :goto_0

    .line 188
    .end local v58           #internationlPrefixCurrent:Ljava/lang/String;
    :cond_8
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "number2 = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v26

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", countryISORecorded = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 190
    const-wide/16 v5, 0x1

    cmp-long v5, v5, v52

    if-nez v5, :cond_d

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "com.android.phone.extra.forbid_dialog"

    const/4 v9, 0x0

    invoke-virtual {v5, v6, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_d

    .line 191
    const-string v5, "confirm == 1, show confirm dialog"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 192
    new-instance v61, Ljava/util/Locale;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v61

    invoke-direct {v0, v5, v7}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    .restart local v61       #locale:Ljava/util/Locale;
    invoke-static {}, Lcom/android/i18n/phonenumbers/PhoneNumberUtil;->getInstance()Lcom/android/i18n/phonenumbers/PhoneNumberUtil;

    move-result-object v5

    invoke-virtual {v5, v7}, Lcom/android/i18n/phonenumbers/PhoneNumberUtil;->getCountryCodeForRegion(Ljava/lang/String;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v19

    .line 195
    .local v19, countryCode:Ljava/lang/String;
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Ljava/util/Locale;->getDisplayCountry(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v20

    .line 197
    .local v20, defaultCountryName:Ljava/lang/String;
    move-object/from16 v0, v26

    invoke-static {v0, v7}, Lcom/mediatek/calloption/CallOptionUtils;->getNumberInfo(Ljava/lang/String;Ljava/lang/String;)Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;

    move-result-object v63

    .line 199
    .local v63, numberInfo:Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;
    move-object/from16 v0, v26

    invoke-static {v7, v0}, Lcom/mediatek/telephony/PhoneNumberUtilsEx;->isAreaCodeNeeded(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_9

    .line 201
    const-string v5, "The number with recorded country prefix can be dialed directly, pop up country single select dialog"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 203
    new-instance v4, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    move-object/from16 v0, v63

    iget-object v0, v0, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mAreaCode:Ljava/lang/String;

    move-object/from16 v23, v0

    .end local v23           #areaCodeRecorded:Ljava/lang/String;
    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v63

    iget-object v0, v0, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mSubscriber:Ljava/lang/String;

    move-object/from16 v28, v0

    move-object/from16 v0, v63

    iget-object v0, v0, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mAreaCodePrefix:Ljava/lang/String;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v18, v4

    move-object/from16 v21, v7

    move-object/from16 v22, v8

    invoke-direct/range {v18 .. v30}, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 206
    .restart local v4       #prefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getActivityContext()Landroid/content/Context;

    move-result-object v28

    const/16 v29, 0x2

    move-object/from16 v27, p0

    move/from16 v30, v17

    move-object/from16 v31, v4

    move-object/from16 v32, p0

    move-object/from16 v33, p0

    move-object/from16 v34, p0

    invoke-virtual/range {v27 .. v34}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->showDialog(Landroid/content/Context;IILcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V

    goto/16 :goto_0

    .line 212
    .end local v4           #prefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;
    .restart local v23       #areaCodeRecorded:Ljava/lang/String;
    :cond_9
    invoke-static/range {v23 .. v23}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_a

    .line 213
    const-string v5, "area code recorded is not empty"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 215
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v26

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v61

    invoke-static {v5, v7, v0}, Lcom/mediatek/calloption/CallOptionUtils;->getCityGeoDescription(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v24

    .line 218
    .local v24, geoDescriptionOfCity:Ljava/lang/String;
    new-instance v4, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    const/16 v25, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v63

    iget-object v0, v0, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mAreaCodePrefix:Ljava/lang/String;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v18, v4

    move-object/from16 v21, v7

    move-object/from16 v22, v8

    move-object/from16 v28, v26

    invoke-direct/range {v18 .. v30}, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 221
    .restart local v4       #prefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getActivityContext()Landroid/content/Context;

    move-result-object v28

    const/16 v29, 0x1

    move-object/from16 v27, p0

    move/from16 v30, v17

    move-object/from16 v31, v4

    move-object/from16 v32, p0

    move-object/from16 v33, p0

    move-object/from16 v34, p0

    invoke-virtual/range {v27 .. v34}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->showDialog(Landroid/content/Context;IILcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V

    goto/16 :goto_0

    .line 225
    .end local v4           #prefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;
    .end local v24           #geoDescriptionOfCity:Ljava/lang/String;
    :cond_a
    const-string v5, "area code recorded is empty"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 228
    if-eqz v63, :cond_b

    move-object/from16 v0, v63

    iget-object v5, v0, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mAreaCode:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_b

    .line 229
    const-string v5, "The number already has area code"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 233
    move-object/from16 v0, v26

    move-object/from16 v1, v61

    invoke-static {v0, v7, v1}, Lcom/mediatek/calloption/CallOptionUtils;->getCityGeoDescription(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v24

    .line 236
    .restart local v24       #geoDescriptionOfCity:Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "area name is "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 237
    new-instance v4, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    move-object/from16 v0, v63

    iget-object v0, v0, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mAreaCode:Ljava/lang/String;

    move-object/from16 v32, v0

    const/16 v34, 0x0

    const/16 v36, 0x0

    move-object/from16 v0, v63

    iget-object v0, v0, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mSubscriber:Ljava/lang/String;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    const/16 v39, 0x0

    move-object/from16 v27, v4

    move-object/from16 v28, v19

    move-object/from16 v29, v20

    move-object/from16 v30, v7

    move-object/from16 v31, v8

    move-object/from16 v33, v24

    move-object/from16 v35, v26

    invoke-direct/range {v27 .. v39}, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 240
    .restart local v4       #prefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getActivityContext()Landroid/content/Context;

    move-result-object v28

    const/16 v29, 0x1

    move-object/from16 v27, p0

    move/from16 v30, v17

    move-object/from16 v31, v4

    move-object/from16 v32, p0

    move-object/from16 v33, p0

    move-object/from16 v34, p0

    invoke-virtual/range {v27 .. v34}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->showDialog(Landroid/content/Context;IILcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V

    goto/16 :goto_0

    .line 244
    .end local v4           #prefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;
    .end local v24           #geoDescriptionOfCity:Ljava/lang/String;
    :cond_b
    const-string v5, "The number do not include area code"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 245
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/calloption/InternationalCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v5}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5, v7}, Lcom/mediatek/phone/provider/CallHistory$Calls;->getLatestAreaCode(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    .line 247
    .local v32, latestAreaCode:Ljava/lang/String;
    invoke-static/range {v32 .. v32}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_c

    .line 248
    const-string v5, "can get latest area code from other recorded number"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 249
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v32

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v61

    invoke-static {v5, v7, v0}, Lcom/mediatek/calloption/CallOptionUtils;->getCityGeoDescription(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v24

    .line 252
    .restart local v24       #geoDescriptionOfCity:Ljava/lang/String;
    new-instance v4, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    const/16 v34, 0x1

    const/16 v36, 0x0

    move-object/from16 v0, v63

    iget-object v0, v0, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mSubscriber:Ljava/lang/String;

    move-object/from16 v37, v0

    move-object/from16 v0, v63

    iget-object v0, v0, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mAreaCodePrefix:Ljava/lang/String;

    move-object/from16 v38, v0

    const/16 v39, 0x0

    move-object/from16 v27, v4

    move-object/from16 v28, v19

    move-object/from16 v29, v20

    move-object/from16 v30, v7

    move-object/from16 v31, v8

    move-object/from16 v33, v24

    move-object/from16 v35, v12

    invoke-direct/range {v27 .. v39}, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 255
    .restart local v4       #prefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getActivityContext()Landroid/content/Context;

    move-result-object v34

    const/16 v35, 0x7

    move-object/from16 v33, p0

    move/from16 v36, v17

    move-object/from16 v37, v4

    move-object/from16 v38, p0

    move-object/from16 v39, p0

    move-object/from16 v40, p0

    invoke-virtual/range {v33 .. v40}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->showDialog(Landroid/content/Context;IILcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V

    goto/16 :goto_0

    .line 259
    .end local v4           #prefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;
    .end local v24           #geoDescriptionOfCity:Ljava/lang/String;
    :cond_c
    const-string v5, "can NOT get latest area code from other recorded number"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 260
    new-instance v4, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    const/16 v38, 0x0

    const/16 v39, 0x0

    const/16 v40, 0x1

    const/16 v42, 0x0

    move-object/from16 v0, v63

    iget-object v0, v0, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mSubscriber:Ljava/lang/String;

    move-object/from16 v43, v0

    move-object/from16 v0, v63

    iget-object v0, v0, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mAreaCodePrefix:Ljava/lang/String;

    move-object/from16 v44, v0

    const/16 v45, 0x0

    move-object/from16 v33, v4

    move-object/from16 v34, v19

    move-object/from16 v35, v20

    move-object/from16 v36, v7

    move-object/from16 v37, v8

    move-object/from16 v41, v12

    invoke-direct/range {v33 .. v45}, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 263
    .restart local v4       #prefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getActivityContext()Landroid/content/Context;

    move-result-object v34

    const/16 v35, 0x6

    move-object/from16 v33, p0

    move/from16 v36, v17

    move-object/from16 v37, v4

    move-object/from16 v38, p0

    move-object/from16 v39, p0

    move-object/from16 v40, p0

    invoke-virtual/range {v33 .. v40}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->showDialog(Landroid/content/Context;IILcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V

    goto/16 :goto_0

    .line 271
    .end local v4           #prefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;
    .end local v19           #countryCode:Ljava/lang/String;
    .end local v20           #defaultCountryName:Ljava/lang/String;
    .end local v32           #latestAreaCode:Ljava/lang/String;
    .end local v61           #locale:Ljava/util/Locale;
    .end local v63           #numberInfo:Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;
    :cond_d
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v26

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v7}, Landroid/telephony/PhoneNumberUtils;->formatNumberToE164(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v56

    .line 272
    .local v56, finalNumber:Ljava/lang/String;
    if-nez v56, :cond_e

    .line 273
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "android.phone.extra.ACTUAL_NUMBER_TO_DIAL"

    move-object/from16 v0, v26

    invoke-virtual {v5, v6, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 376
    :goto_2
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    if-eqz v5, :cond_2

    .line 377
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Lcom/mediatek/calloption/CallOptionBaseHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    goto/16 :goto_0

    .line 275
    :cond_e
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "android.phone.extra.ACTUAL_NUMBER_TO_DIAL"

    move-object/from16 v0, v56

    invoke-virtual {v5, v6, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_2

    .line 282
    .end local v7           #countryISORecorded:Ljava/lang/String;
    .end local v23           #areaCodeRecorded:Ljava/lang/String;
    .end local v52           #confirm:J
    .end local v56           #finalNumber:Ljava/lang/String;
    .end local v59           #internationlPrefixRecorded:Ljava/lang/String;
    .end local v62           #matcher:Ljava/util/regex/Matcher;
    .end local v64           #pattern:Ljava/util/regex/Pattern;
    :cond_f
    const-string v5, "CallHistory getCallInfo end, do not find same call history!"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 283
    const-string v36, ""

    .line 284
    .local v36, preferCountryISO:Ljava/lang/String;
    const-string v37, ""

    .line 285
    .local v37, deniedCountryISO:Ljava/lang/String;
    const/4 v5, 0x1

    move/from16 v0, v17

    if-ne v5, v0, :cond_11

    .line 286
    if-eqz v51, :cond_10

    .line 287
    move-object/from16 v0, v51

    iget-object v0, v0, Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;->mCountryISO:Ljava/lang/String;

    move-object/from16 v36, v0

    .line 289
    :cond_10
    move-object/from16 v37, v8

    .line 292
    :cond_11
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v34

    const/16 v38, 0x1

    move-object/from16 v33, p0

    move-object/from16 v35, v12

    invoke-direct/range {v33 .. v38}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->findValidCountryISO(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v50

    .line 294
    .local v50, validCountryISOList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v50, :cond_12

    invoke-virtual/range {v50 .. v50}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_13

    :cond_12
    const-string v41, ""

    .line 297
    .local v41, validCountryISO:Ljava/lang/String;
    :goto_3
    const/4 v5, 0x1

    move/from16 v0, v17

    if-eq v5, v0, :cond_16

    .line 298
    invoke-static/range {v41 .. v41}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_14

    .line 299
    const-string v5, "can not find valid country iso, show invalid number dialog"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 300
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getActivityContext()Landroid/content/Context;

    move-result-object v5

    move-object/from16 v0, p0

    move-object/from16 v1, p0

    move-object/from16 v2, p0

    move-object/from16 v3, p0

    invoke-virtual {v0, v5, v1, v2, v3}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->showInvalidNumberDialog(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V

    goto/16 :goto_0

    .line 294
    .end local v41           #validCountryISO:Ljava/lang/String;
    :cond_13
    const/4 v5, 0x0

    move-object/from16 v0, v50

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    move-object/from16 v41, v5

    goto :goto_3

    .line 304
    .restart local v41       #validCountryISO:Ljava/lang/String;
    :cond_14
    move-object/from16 v0, v41

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_15

    .line 305
    const-string v5, "The number is valid for current country ISO, dial directly"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 307
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    if-eqz v5, :cond_2

    .line 308
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Lcom/mediatek/calloption/CallOptionBaseHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    goto/16 :goto_0

    .line 312
    :cond_15
    const-string v5, "The number is NOT valid for current country ISO"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 315
    :cond_16
    const/4 v5, 0x1

    move/from16 v0, v17

    if-ne v5, v0, :cond_18

    invoke-static/range {v41 .. v41}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_18

    .line 317
    const-string v5, "can not find valid country iso, set default country ISO"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 318
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5, v12}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->findValidCountryISOFromDefaultCountry(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v54

    .line 320
    .local v54, defaultValidCountryISO:Ljava/lang/String;
    invoke-static/range {v54 .. v54}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_17

    .line 321
    const-string v5, "default valid country ISO is null"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 332
    .end local v54           #defaultValidCountryISO:Ljava/lang/String;
    :goto_4
    move-object/from16 v0, v41

    invoke-static {v12, v0}, Lcom/mediatek/calloption/CallOptionUtils;->getNumberInfo(Ljava/lang/String;Ljava/lang/String;)Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;

    move-result-object v63

    .line 334
    .restart local v63       #numberInfo:Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "valid country ISO = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v41

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 335
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "number info = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v63

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 337
    new-instance v61, Ljava/util/Locale;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v61

    move-object/from16 v1, v41

    invoke-direct {v0, v5, v1}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 338
    .restart local v61       #locale:Ljava/util/Locale;
    invoke-static {}, Lcom/android/i18n/phonenumbers/PhoneNumberUtil;->getInstance()Lcom/android/i18n/phonenumbers/PhoneNumberUtil;

    move-result-object v5

    move-object/from16 v0, v41

    invoke-virtual {v5, v0}, Lcom/android/i18n/phonenumbers/PhoneNumberUtil;->getCountryCodeForRegion(Ljava/lang/String;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v19

    .line 340
    .restart local v19       #countryCode:Ljava/lang/String;
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Ljava/util/Locale;->getDisplayCountry(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v40

    .line 341
    .local v40, countryName:Ljava/lang/String;
    move-object/from16 v0, v41

    invoke-static {v0, v12}, Lcom/mediatek/telephony/PhoneNumberUtilsEx;->isAreaCodeNeeded(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_19

    .line 343
    const-string v5, "the number can be dialed directly, just show dialog for country selection"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 345
    new-instance v4, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    move-object/from16 v0, v63

    iget-object v0, v0, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mAreaCode:Ljava/lang/String;

    move-object/from16 v43, v0

    const/16 v44, 0x0

    const/16 v45, 0x0

    const/16 v47, 0x0

    move-object/from16 v0, v63

    iget-object v0, v0, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mSubscriber:Ljava/lang/String;

    move-object/from16 v48, v0

    move-object/from16 v0, v63

    iget-object v0, v0, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mAreaCodePrefix:Ljava/lang/String;

    move-object/from16 v49, v0

    move-object/from16 v38, v4

    move-object/from16 v39, v19

    move-object/from16 v42, v8

    move-object/from16 v46, v12

    invoke-direct/range {v38 .. v50}, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 348
    .restart local v4       #prefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getActivityContext()Landroid/content/Context;

    move-result-object v43

    const/16 v44, 0x3

    move-object/from16 v42, p0

    move/from16 v45, v17

    move-object/from16 v46, v4

    move-object/from16 v47, p0

    move-object/from16 v48, p0

    move-object/from16 v49, p0

    invoke-virtual/range {v42 .. v49}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->showDialog(Landroid/content/Context;IILcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V

    goto/16 :goto_0

    .line 323
    .end local v4           #prefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;
    .end local v19           #countryCode:Ljava/lang/String;
    .end local v40           #countryName:Ljava/lang/String;
    .end local v61           #locale:Ljava/util/Locale;
    .end local v63           #numberInfo:Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;
    .restart local v54       #defaultValidCountryISO:Ljava/lang/String;
    :cond_17
    move-object/from16 v0, v50

    move-object/from16 v1, v54

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 324
    move-object/from16 v41, v54

    goto/16 :goto_4

    .line 327
    .end local v54           #defaultValidCountryISO:Ljava/lang/String;
    :cond_18
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v34

    const/16 v38, 0x0

    move-object/from16 v33, p0

    move-object/from16 v35, v12

    invoke-direct/range {v33 .. v38}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->findValidCountryISO(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v50

    goto/16 :goto_4

    .line 352
    .restart local v19       #countryCode:Ljava/lang/String;
    .restart local v40       #countryName:Ljava/lang/String;
    .restart local v61       #locale:Ljava/util/Locale;
    .restart local v63       #numberInfo:Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;
    :cond_19
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/calloption/InternationalCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v5}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    move-object/from16 v0, v41

    invoke-static {v5, v0}, Lcom/mediatek/phone/provider/CallHistory$Calls;->getLatestAreaCode(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    .line 353
    .restart local v32       #latestAreaCode:Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "latest area code = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v32

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 354
    invoke-static/range {v32 .. v32}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1a

    .line 355
    const-string v5, "can get latest area code from records"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 356
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v32

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v41

    move-object/from16 v1, v61

    invoke-static {v5, v0, v1}, Lcom/mediatek/calloption/CallOptionUtils;->getCityGeoDescription(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v24

    .line 358
    .restart local v24       #geoDescriptionOfCity:Ljava/lang/String;
    new-instance v4, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    const/16 v45, 0x1

    const/16 v47, 0x0

    move-object/from16 v0, v63

    iget-object v0, v0, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mAreaCodePrefix:Ljava/lang/String;

    move-object/from16 v49, v0

    move-object/from16 v38, v4

    move-object/from16 v39, v19

    move-object/from16 v42, v8

    move-object/from16 v43, v32

    move-object/from16 v44, v24

    move-object/from16 v46, v12

    move-object/from16 v48, v12

    invoke-direct/range {v38 .. v50}, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 361
    .restart local v4       #prefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getActivityContext()Landroid/content/Context;

    move-result-object v43

    const/16 v44, 0x5

    move-object/from16 v42, p0

    move/from16 v45, v17

    move-object/from16 v46, v4

    move-object/from16 v47, p0

    move-object/from16 v48, p0

    move-object/from16 v49, p0

    invoke-virtual/range {v42 .. v49}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->showDialog(Landroid/content/Context;IILcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V

    goto/16 :goto_0

    .line 365
    .end local v4           #prefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;
    .end local v24           #geoDescriptionOfCity:Ljava/lang/String;
    :cond_1a
    const-string v5, "can NOT get latest area code from records"

    invoke-static {v5}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 366
    new-instance v4, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    const/16 v43, 0x0

    const/16 v44, 0x0

    const/16 v45, 0x1

    const/16 v47, 0x0

    move-object/from16 v0, v63

    iget-object v0, v0, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mAreaCodePrefix:Ljava/lang/String;

    move-object/from16 v49, v0

    move-object/from16 v38, v4

    move-object/from16 v39, v19

    move-object/from16 v42, v8

    move-object/from16 v46, v12

    move-object/from16 v48, v12

    invoke-direct/range {v38 .. v50}, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 369
    .restart local v4       #prefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getActivityContext()Landroid/content/Context;

    move-result-object v43

    const/16 v44, 0x4

    move-object/from16 v42, p0

    move/from16 v45, v17

    move-object/from16 v46, v4

    move-object/from16 v47, p0

    move-object/from16 v48, p0

    move-object/from16 v49, p0

    invoke-virtual/range {v42 .. v49}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->showDialog(Landroid/content/Context;IILcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V

    goto/16 :goto_0
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .parameter "dialog"

    .prologue
    .line 418
    const-string v0, "onCancel()"

    invoke-static {v0}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 419
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v0}, Lcom/mediatek/calloption/Request;->getResultHandler()Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;

    move-result-object v0

    invoke-interface {v0}, Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;->onHandlingFinish()V

    .line 420
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 382
    const/4 v2, -0x1

    if-ne p2, v2, :cond_4

    .line 383
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalCallOptionHandler;->mDialogHandler:Lcom/mediatek/calloption/InternationalDialogHandler;

    if-nez v2, :cond_1

    .line 385
    iget-object v2, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    if-eqz v2, :cond_0

    .line 386
    iget-object v2, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    iget-object v3, p0, Lcom/mediatek/calloption/InternationalCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v2, v3}, Lcom/mediatek/calloption/CallOptionBaseHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    .line 411
    :cond_0
    :goto_0
    return-void

    .line 390
    :cond_1
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalCallOptionHandler;->mDialogHandler:Lcom/mediatek/calloption/InternationalDialogHandler;

    invoke-virtual {v2}, Lcom/mediatek/calloption/InternationalDialogHandler;->getSelectResult()Ljava/lang/String;

    move-result-object v1

    .line 391
    .local v1, numberSelect:Ljava/lang/String;
    if-eqz v1, :cond_3

    .line 392
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v2}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/calloption/InternationalCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v3}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/calloption/CallOptionUtils;->getInitialNumber(Landroid/content/Context;Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v0

    .line 394
    .local v0, number:Ljava/lang/String;
    invoke-static {v0}, Landroid/telephony/PhoneNumberUtils;->stripSeparators(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1}, Landroid/telephony/PhoneNumberUtils;->stripSeparators(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 397
    new-instance v2, Lcom/mediatek/phone/provider/CallHistoryAsync;

    invoke-direct {v2}, Lcom/mediatek/phone/provider/CallHistoryAsync;-><init>()V

    new-instance v3, Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallArgs;

    iget-object v4, p0, Lcom/mediatek/calloption/InternationalCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v4}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallArgs;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/mediatek/phone/provider/CallHistoryAsync;->deleteCall(Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallArgs;)Landroid/os/AsyncTask;

    .line 405
    .end local v0           #number:Ljava/lang/String;
    :goto_1
    iget-object v2, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    if-eqz v2, :cond_0

    .line 406
    iget-object v2, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    iget-object v3, p0, Lcom/mediatek/calloption/InternationalCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v2, v3}, Lcom/mediatek/calloption/CallOptionBaseHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    goto :goto_0

    .line 400
    .restart local v0       #number:Ljava/lang/String;
    :cond_2
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v2}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "android.phone.extra.ACTUAL_NUMBER_TO_DIAL"

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1

    .line 403
    .end local v0           #number:Ljava/lang/String;
    :cond_3
    const-string v2, "no select from alert dialog, something wrong"

    invoke-static {v2}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 408
    .end local v1           #numberSelect:Ljava/lang/String;
    :cond_4
    const/4 v2, -0x2

    if-ne p2, v2, :cond_0

    .line 409
    iget-object v2, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->cancel()V

    goto :goto_0
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .parameter "dialog"

    .prologue
    .line 414
    const-string v0, "onDismiss()"

    invoke-static {v0}, Lcom/mediatek/calloption/InternationalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 415
    return-void
.end method

.method protected abstract showDialog(Landroid/content/Context;IILcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V
.end method

.method protected abstract showInvalidNumberDialog(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V
.end method
