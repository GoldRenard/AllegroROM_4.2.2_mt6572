.class public Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;
.super Ljava/lang/Object;
.source "BluetoothPbapSimAdn.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn$AdnComparator;
    }
.end annotation


# static fields
.field public static final DEBUG:Z = true

.field static final ICC_URI:Landroid/net/Uri; = null

.field static final ICC_URI1:Landroid/net/Uri; = null

.field static final ICC_URI2:Landroid/net/Uri; = null

.field static final ICC_USIM1_URI:Landroid/net/Uri; = null

.field static final ICC_USIM2_URI:Landroid/net/Uri; = null

.field static final ICC_USIM_URI:Landroid/net/Uri; = null

.field private static final TAG:Ljava/lang/String; = "BluetoothPbapSimAdn"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mErrCode:I

.field private mListAdn:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/AdnRecord;",
            ">;"
        }
    .end annotation
.end field

.field private final mTel:Lcom/android/internal/telephony/ITelephony;

.field private mVCardPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 77
    const-string v0, "content://icc/adn/"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->ICC_URI:Landroid/net/Uri;

    .line 79
    const-string v0, "content://icc/adn1/"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->ICC_URI1:Landroid/net/Uri;

    .line 81
    const-string v0, "content://icc/adn2/"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->ICC_URI2:Landroid/net/Uri;

    .line 83
    const-string v0, "content://icc/pbr"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->ICC_USIM_URI:Landroid/net/Uri;

    .line 86
    const-string v0, "content://icc/pbr1/"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->ICC_USIM1_URI:Landroid/net/Uri;

    .line 88
    const-string v0, "content://icc/pbr2/"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->ICC_USIM2_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    .line 101
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mVCardPath:Ljava/lang/String;

    .line 92
    const-string v0, "phone"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v0

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mTel:Lcom/android/internal/telephony/ITelephony;

    .line 95
    iput-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mContext:Landroid/content/Context;

    .line 97
    iput-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mListAdn:Ljava/util/List;

    .line 99
    const/16 v0, 0xa0

    iput v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mErrCode:I

    .line 102
    iput-object p1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mContext:Landroid/content/Context;

    .line 103
    return-void
.end method

.method private appendEmails(Lcom/android/internal/telephony/AdnRecord;Ljava/util/List;)V
    .locals 7
    .parameter "adn"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/internal/telephony/AdnRecord;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 351
    .local p2, list:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    invoke-virtual {p1}, Lcom/android/internal/telephony/AdnRecord;->getEmails()[Ljava/lang/String;

    move-result-object v2

    .line 352
    .local v2, emails:[Ljava/lang/String;
    if-eqz p2, :cond_1

    if-eqz v2, :cond_1

    .line 353
    move-object v0, v2

    .local v0, arr$:[Ljava/lang/String;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v1, v0, v3

    .line 354
    .local v1, email:Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 355
    new-instance v5, Landroid/content/ContentValues;

    const/4 v6, 0x1

    invoke-direct {v5, v6}, Landroid/content/ContentValues;-><init>(I)V

    .line 356
    .local v5, values:Landroid/content/ContentValues;
    const-string v6, "data1"

    invoke-virtual {v5, v6, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 357
    invoke-interface {p2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 353
    .end local v5           #values:Landroid/content/ContentValues;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 361
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v1           #email:Ljava/lang/String;
    .end local v3           #i$:I
    .end local v4           #len$:I
    :cond_1
    return-void
.end method

.method private appendName(Lcom/android/internal/telephony/AdnRecord;Ljava/util/List;)V
    .locals 4
    .parameter "adn"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/internal/telephony/AdnRecord;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 316
    .local p2, list:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    invoke-virtual {p1}, Lcom/android/internal/telephony/AdnRecord;->getAlphaTag()Ljava/lang/String;

    move-result-object v0

    .line 317
    .local v0, name:Ljava/lang/String;
    if-eqz p2, :cond_1

    .line 318
    if-nez v0, :cond_0

    .line 319
    const-string v0, ""

    .line 321
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "appendName : name="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 322
    new-instance v1, Landroid/content/ContentValues;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(I)V

    .line 323
    .local v1, valuse:Landroid/content/ContentValues;
    const-string v2, "data1"

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 324
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 326
    .end local v1           #valuse:Landroid/content/ContentValues;
    :cond_1
    return-void
.end method

.method private appendNumber(Lcom/android/internal/telephony/AdnRecord;Ljava/util/List;)V
    .locals 5
    .parameter "adn"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/internal/telephony/AdnRecord;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, list:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    const/4 v4, 0x1

    .line 330
    invoke-virtual {p1}, Lcom/android/internal/telephony/AdnRecord;->getNumber()Ljava/lang/String;

    move-result-object v0

    .line 331
    .local v0, number:Ljava/lang/String;
    if-eqz p2, :cond_0

    .line 332
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 333
    new-instance v1, Landroid/content/ContentValues;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(I)V

    .line 334
    .local v1, values:Landroid/content/ContentValues;
    const-string v2, "data1"

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "appendNumber : number="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 336
    const-string v2, "is_primary"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 337
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 338
    invoke-virtual {p1}, Lcom/android/internal/telephony/AdnRecord;->getAdditionalNumber()Ljava/lang/String;

    move-result-object v0

    .line 339
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 340
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Put additional number = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 341
    new-instance v1, Landroid/content/ContentValues;

    .end local v1           #values:Landroid/content/ContentValues;
    invoke-direct {v1, v4}, Landroid/content/ContentValues;-><init>(I)V

    .line 342
    .restart local v1       #values:Landroid/content/ContentValues;
    const-string v2, "data1"

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 343
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 347
    .end local v1           #values:Landroid/content/ContentValues;
    :cond_0
    return-void
.end method

.method private errorLog(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 471
    const-string v0, "BluetoothPbapSimAdn"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 472
    return-void
.end method

.method private getDefaultSIM()I
    .locals 8

    .prologue
    const-wide/16 v6, -0x5

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 434
    iget-object v4, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "voice_call_sim_setting"

    invoke-static {v4, v5, v6, v7}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v4

    long-to-int v1, v4

    .line 436
    .local v1, slotId:I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getDefaultSIM : SIM ID="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 437
    int-to-long v4, v1

    cmp-long v4, v4, v6

    if-eqz v4, :cond_0

    int-to-long v4, v1

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-nez v4, :cond_3

    .line 439
    :cond_0
    const-string v4, "No default SIM, get first inserted SIM"

    invoke-direct {p0, v4}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 441
    :try_start_0
    iget-object v4, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mTel:Lcom/android/internal/telephony/ITelephony;

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Lcom/android/internal/telephony/ITelephony;->isSimInsert(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 442
    const-string v3, "getDefaultSim is sim1"

    invoke-direct {p0, v3}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 461
    :goto_0
    return v2

    .line 445
    :cond_1
    iget-object v4, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mTel:Lcom/android/internal/telephony/ITelephony;

    const/4 v5, 0x1

    invoke-interface {v4, v5}, Lcom/android/internal/telephony/ITelephony;->isSimInsert(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 446
    const-string v4, "getDefaultSim is sim2"

    invoke-direct {p0, v4}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    move v2, v3

    .line 447
    goto :goto_0

    .line 449
    :cond_2
    const-string v3, "getDefaultSim is no sim"

    invoke-direct {p0, v3}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 453
    :catch_0
    move-exception v0

    .line 454
    .local v0, ex:Landroid/os/RemoteException;
    goto :goto_0

    .line 457
    .end local v0           #ex:Landroid/os/RemoteException;
    :cond_3
    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mContext:Landroid/content/Context;

    int-to-long v3, v1

    invoke-static {v2, v3, v4}, Landroid/provider/Telephony$SIMInfo;->getSlotById(Landroid/content/Context;J)I

    move-result v1

    .line 458
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getDefaultSIM : slot ID="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    move v2, v1

    .line 461
    goto :goto_0
.end method

.method private getOwnerRecord(Lcom/android/vcard/VCardBuilder;)Ljava/lang/String;
    .locals 9
    .parameter "builder"

    .prologue
    const/4 v8, 0x1

    .line 364
    const/4 v1, 0x0

    .line 365
    .local v1, ownName:Ljava/lang/String;
    const/4 v2, 0x0

    .line 367
    .local v2, ownNumber:Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/telephony/TelephonyManagerEx;->getDefault()Lcom/mediatek/telephony/TelephonyManagerEx;

    move-result-object v4

    .line 368
    .local v4, tmEx:Lcom/mediatek/telephony/TelephonyManagerEx;
    invoke-direct {p0}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->getDefaultSIM()I

    move-result v3

    .line 369
    .local v3, slotId:I
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    .line 370
    .local v5, values:Landroid/content/ContentValues;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 373
    .local v0, list:Ljava/util/ArrayList;
    invoke-virtual {v4, v3}, Lcom/mediatek/telephony/TelephonyManagerEx;->getLine1AlphaTag(I)Ljava/lang/String;

    move-result-object v1

    .line 374
    if-nez v1, :cond_0

    .line 375
    const-string v1, ""

    .line 378
    :cond_0
    invoke-virtual {v4, v3}, Lcom/mediatek/telephony/TelephonyManagerEx;->getLine1Number(I)Ljava/lang/String;

    move-result-object v2

    .line 379
    if-nez v2, :cond_1

    .line 380
    const-string v2, ""

    .line 382
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "getOwnerRecord : name="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", number="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 383
    invoke-virtual {p1}, Lcom/android/vcard/VCardBuilder;->clear()V

    .line 384
    const-string v6, "data1"

    invoke-virtual {v5, v6, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 385
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 386
    invoke-virtual {p1, v0}, Lcom/android/vcard/VCardBuilder;->appendNameProperties(Ljava/util/List;)Lcom/android/vcard/VCardBuilder;

    .line 387
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 388
    new-instance v5, Landroid/content/ContentValues;

    .end local v5           #values:Landroid/content/ContentValues;
    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    .line 389
    .restart local v5       #values:Landroid/content/ContentValues;
    const-string v6, "data1"

    invoke-virtual {v5, v6, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 390
    const-string v6, "data2"

    const/4 v7, 0x2

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 391
    const-string v6, "is_primary"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 392
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 393
    const/4 v6, 0x0

    invoke-virtual {p1, v0, v6}, Lcom/android/vcard/VCardBuilder;->appendPhones(Ljava/util/List;Lcom/android/vcard/VCardPhoneNumberTranslationCallback;)Lcom/android/vcard/VCardBuilder;

    .line 395
    :cond_2
    invoke-virtual {p1}, Lcom/android/vcard/VCardBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method private getSIMUri()Landroid/net/Uri;
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 401
    :try_start_0
    invoke-direct {p0}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->getDefaultSIM()I

    move-result v1

    .line 402
    .local v1, slotId:I
    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mTel:Lcom/android/internal/telephony/ITelephony;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mTel:Lcom/android/internal/telephony/ITelephony;

    invoke-interface {v2, v1}, Lcom/android/internal/telephony/ITelephony;->getIccCardTypeGemini(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "USIM"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 403
    if-ne v1, v4, :cond_0

    .line 404
    sget-object v2, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->ICC_USIM2_URI:Landroid/net/Uri;

    .line 425
    .end local v1           #slotId:I
    :goto_0
    return-object v2

    .line 406
    .restart local v1       #slotId:I
    :cond_0
    sget-object v2, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->ICC_USIM1_URI:Landroid/net/Uri;

    goto :goto_0

    .line 409
    :cond_1
    if-ne v1, v4, :cond_2

    .line 410
    sget-object v2, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->ICC_URI2:Landroid/net/Uri;

    goto :goto_0

    .line 412
    :cond_2
    sget-object v2, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->ICC_URI1:Landroid/net/Uri;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 422
    .end local v1           #slotId:I
    :catch_0
    move-exception v0

    .line 423
    .local v0, ex:Landroid/os/RemoteException;
    const/16 v2, 0xc4

    iput v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mErrCode:I

    .line 424
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getSIMUri : caught exception "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 425
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private listSIMColumns()V
    .locals 9

    .prologue
    .line 475
    invoke-direct {p0}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->getSIMUri()Landroid/net/Uri;

    move-result-object v1

    .line 476
    .local v1, uri:Landroid/net/Uri;
    const/4 v7, 0x0

    .line 478
    .local v7, cursor:Landroid/database/Cursor;
    if-eqz v1, :cond_0

    .line 479
    :try_start_0
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 480
    if-nez v7, :cond_2

    .line 481
    const-string v0, "listSIMColumns : query SIM failed"

    invoke-direct {p0, v0}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 491
    :cond_0
    if-eqz v7, :cond_1

    .line 492
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 495
    :cond_1
    return-void

    .line 483
    :cond_2
    :try_start_1
    invoke-interface {v7}, Landroid/database/Cursor;->getColumnCount()I

    move-result v6

    .line 484
    .local v6, count:I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "listSIMColumns : column count = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v7}, Landroid/database/Cursor;->getColumnCount()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 485
    const/4 v8, 0x0

    .local v8, i:I
    :goto_0
    if-ge v8, v6, :cond_0

    .line 486
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "column "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " : "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v7, v8}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 485
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 491
    .end local v6           #count:I
    .end local v8           #i:I
    :catchall_0
    move-exception v0

    if-eqz v7, :cond_3

    .line 492
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0
.end method

.method private log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 466
    const-string v0, "BluetoothPbapSimAdn"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 468
    return-void
.end method


# virtual methods
.method public composeVCard(ZIIZZ)I
    .locals 9
    .parameter "vcard21"
    .parameter "listOffset"
    .parameter "maxListCount"
    .parameter "email"
    .parameter "incOwner"

    .prologue
    .line 235
    const/16 v4, 0xa0

    .line 236
    .local v4, ret:I
    const/4 v1, 0x0

    .line 237
    .local v1, builder:Lcom/android/vcard/VCardBuilder;
    const/4 v6, 0x0

    .line 238
    .local v6, writer:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;
    const/4 v5, 0x0

    .line 242
    .local v5, values:Landroid/content/ContentValues;
    const/4 v2, 0x0

    .line 244
    .local v2, iterator:Ljava/util/ListIterator;,"Ljava/util/ListIterator<Lcom/android/internal/telephony/AdnRecord;>;"
    const-string v7, "composeVCard"

    invoke-direct {p0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 246
    new-instance v6, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    .end local v6           #writer:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;
    invoke-direct {v6}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;-><init>()V

    .line 247
    .restart local v6       #writer:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;
    iget-object v7, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->init(Landroid/content/Context;)Z

    .line 248
    new-instance v1, Lcom/android/vcard/VCardBuilder;

    .end local v1           #builder:Lcom/android/vcard/VCardBuilder;
    if-eqz p1, :cond_3

    const/high16 v7, -0x4000

    :goto_0
    const-string v8, "UTF-8"

    invoke-direct {v1, v7, v8}, Lcom/android/vcard/VCardBuilder;-><init>(ILjava/lang/String;)V

    .line 250
    .restart local v1       #builder:Lcom/android/vcard/VCardBuilder;
    if-eqz p5, :cond_0

    .line 251
    if-nez p2, :cond_4

    .line 252
    if-lez p3, :cond_0

    .line 253
    invoke-direct {p0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->getOwnerRecord(Lcom/android/vcard/VCardBuilder;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->write(Ljava/lang/String;)Z

    .line 254
    add-int/lit8 p3, p3, -0x1

    .line 261
    :cond_0
    :goto_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "listOffset="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", maxListCount = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 263
    iget-object v7, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mListAdn:Ljava/util/List;

    if-eqz v7, :cond_7

    .line 264
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mListAdn.size = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mListAdn:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 265
    iget-object v7, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mListAdn:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-le v7, p2, :cond_5

    .line 266
    iget-object v7, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mListAdn:Ljava/util/List;

    invoke-interface {v7, p2}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v2

    .line 267
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 268
    .local v3, list:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Landroid/content/ContentValues;>;"
    iget-object v7, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mListAdn:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    sub-int/2addr v7, p2

    if-le p3, v7, :cond_1

    .line 269
    iget-object v7, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mListAdn:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    sub-int p3, v7, p2

    .line 271
    :cond_1
    :goto_2
    if-lez p3, :cond_6

    invoke-interface {v2}, Ljava/util/ListIterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 272
    invoke-interface {v2}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/AdnRecord;

    .line 273
    .local v0, adn:Lcom/android/internal/telephony/AdnRecord;
    invoke-virtual {v1}, Lcom/android/vcard/VCardBuilder;->clear()V

    .line 274
    invoke-direct {p0, v0, v3}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->appendName(Lcom/android/internal/telephony/AdnRecord;Ljava/util/List;)V

    .line 275
    invoke-virtual {v1, v3}, Lcom/android/vcard/VCardBuilder;->appendNameProperties(Ljava/util/List;)Lcom/android/vcard/VCardBuilder;

    .line 276
    invoke-virtual {v3}, Ljava/util/LinkedList;->clear()V

    .line 277
    invoke-direct {p0, v0, v3}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->appendNumber(Lcom/android/internal/telephony/AdnRecord;Ljava/util/List;)V

    .line 278
    const/4 v7, 0x0

    invoke-virtual {v1, v3, v7}, Lcom/android/vcard/VCardBuilder;->appendPhones(Ljava/util/List;Lcom/android/vcard/VCardPhoneNumberTranslationCallback;)Lcom/android/vcard/VCardBuilder;

    .line 279
    invoke-virtual {v3}, Ljava/util/LinkedList;->clear()V

    .line 280
    if-eqz p4, :cond_2

    .line 281
    invoke-direct {p0, v0, v3}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->appendEmails(Lcom/android/internal/telephony/AdnRecord;Ljava/util/List;)V

    .line 282
    invoke-virtual {v1, v3}, Lcom/android/vcard/VCardBuilder;->appendEmails(Ljava/util/List;)Lcom/android/vcard/VCardBuilder;

    .line 283
    invoke-virtual {v3}, Ljava/util/LinkedList;->clear()V

    .line 285
    :cond_2
    invoke-virtual {v1}, Lcom/android/vcard/VCardBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->write(Ljava/lang/String;)Z

    .line 286
    add-int/lit8 p3, p3, -0x1

    goto :goto_2

    .line 248
    .end local v0           #adn:Lcom/android/internal/telephony/AdnRecord;
    .end local v1           #builder:Lcom/android/vcard/VCardBuilder;
    .end local v3           #list:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Landroid/content/ContentValues;>;"
    :cond_3
    const v7, -0x3fffffff

    goto/16 :goto_0

    .line 257
    .restart local v1       #builder:Lcom/android/vcard/VCardBuilder;
    :cond_4
    add-int/lit8 p2, p2, -0x1

    goto/16 :goto_1

    .line 289
    :cond_5
    const/16 v4, 0xc4

    .line 294
    :cond_6
    :goto_3
    invoke-virtual {v6}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->getPath()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mVCardPath:Ljava/lang/String;

    .line 295
    invoke-virtual {v6}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->terminate()V

    .line 296
    return v4

    .line 292
    :cond_7
    const/16 v4, 0xd0

    goto :goto_3
.end method

.method public getAdnList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/AdnRecord;",
            ">;"
        }
    .end annotation

    .prologue
    .line 226
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mListAdn:Ljava/util/List;

    return-object v0
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mListAdn:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 220
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mListAdn:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 222
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getLastError()I
    .locals 1

    .prologue
    .line 430
    iget v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mErrCode:I

    return v0
.end method

.method public getOwnerName()Ljava/lang/String;
    .locals 4

    .prologue
    .line 300
    const/4 v0, 0x0

    .line 302
    .local v0, ownName:Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/telephony/TelephonyManagerEx;->getDefault()Lcom/mediatek/telephony/TelephonyManagerEx;

    move-result-object v2

    .line 303
    .local v2, tmEx:Lcom/mediatek/telephony/TelephonyManagerEx;
    invoke-direct {p0}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->getDefaultSIM()I

    move-result v1

    .line 305
    .local v1, slotId:I
    invoke-virtual {v2, v1}, Lcom/mediatek/telephony/TelephonyManagerEx;->getLine1AlphaTag(I)Ljava/lang/String;

    move-result-object v0

    .line 306
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 308
    invoke-virtual {v2, v1}, Lcom/mediatek/telephony/TelephonyManagerEx;->getLine1Number(I)Ljava/lang/String;

    move-result-object v0

    .line 310
    :cond_0
    if-nez v0, :cond_1

    const-string v0, ""

    .end local v0           #ownName:Ljava/lang/String;
    :cond_1
    return-object v0
.end method

.method public getVCardFilePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 230
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mVCardPath:Ljava/lang/String;

    return-object v0
.end method

.method public searchAdn(Ljava/lang/String;Z)V
    .locals 5
    .parameter "search"
    .parameter "searchNnumber"

    .prologue
    .line 186
    if-eqz p1, :cond_4

    iget-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mListAdn:Ljava/util/List;

    if-eqz v3, :cond_4

    .line 187
    iget-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mListAdn:Ljava/util/List;

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v1

    .line 188
    .local v1, iterator:Ljava/util/ListIterator;,"Ljava/util/ListIterator<Lcom/android/internal/telephony/AdnRecord;>;"
    if-eqz v1, :cond_4

    .line 189
    if-nez p2, :cond_2

    .line 190
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    .line 191
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 192
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/AdnRecord;

    .line 193
    .local v0, adn:Lcom/android/internal/telephony/AdnRecord;
    invoke-virtual {v0}, Lcom/android/internal/telephony/AdnRecord;->getAlphaTag()Ljava/lang/String;

    move-result-object v2

    .line 194
    .local v2, name:Ljava/lang/String;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 196
    :cond_1
    invoke-interface {v1}, Ljava/util/ListIterator;->remove()V

    goto :goto_0

    .line 200
    .end local v0           #adn:Lcom/android/internal/telephony/AdnRecord;
    .end local v2           #name:Ljava/lang/String;
    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 201
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/AdnRecord;

    .line 202
    .restart local v0       #adn:Lcom/android/internal/telephony/AdnRecord;
    invoke-virtual {v0}, Lcom/android/internal/telephony/AdnRecord;->getNumber()Ljava/lang/String;

    move-result-object v2

    .line 203
    .restart local v2       #name:Ljava/lang/String;
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 204
    :cond_3
    invoke-interface {v1}, Ljava/util/ListIterator;->remove()V

    goto :goto_1

    .line 210
    .end local v0           #adn:Lcom/android/internal/telephony/AdnRecord;
    .end local v1           #iterator:Ljava/util/ListIterator;,"Ljava/util/ListIterator<Lcom/android/internal/telephony/AdnRecord;>;"
    .end local v2           #name:Ljava/lang/String;
    :cond_4
    return-void
.end method

.method public sortAdn()V
    .locals 2

    .prologue
    .line 213
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mListAdn:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 214
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mListAdn:Ljava/util/List;

    new-instance v1, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn$AdnComparator;

    invoke-direct {v1, p0}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn$AdnComparator;-><init>(Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 216
    :cond_0
    return-void
.end method

.method public updateAdn()Z
    .locals 20

    .prologue
    .line 122
    const/4 v13, 0x0

    .line 123
    .local v13, cursor:Landroid/database/Cursor;
    const/4 v2, 0x0

    .line 131
    .local v2, uri:Landroid/net/Uri;
    const/16 v1, 0xa0

    move-object/from16 v0, p0

    iput v1, v0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mErrCode:I

    .line 132
    invoke-direct/range {p0 .. p0}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->getSIMUri()Landroid/net/Uri;

    move-result-object v2

    .line 133
    if-nez v2, :cond_1

    .line 134
    const/4 v1, 0x0

    .line 177
    :cond_0
    :goto_0
    return v1

    .line 136
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "uri="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 138
    :try_start_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 139
    if-eqz v13, :cond_4

    .line 141
    invoke-interface {v13}, Landroid/database/Cursor;->getCount()I

    move-result v12

    .line 142
    .local v12, count:I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ADN count == "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 143
    const-string v1, "index"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v17

    .line 144
    .local v17, indexColIdx:I
    const-string v1, "name"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v18

    .line 145
    .local v18, nameColIdx:I
    const-string v1, "number"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v19

    .line 146
    .local v19, numberColIdx:I
    const-string v1, "emails"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v15

    .line 147
    .local v15, emailsColIdx:I
    const-string v1, "additionalNumber"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v11

    .line 148
    .local v11, anrColIdx:I
    const-string v1, "groupIds"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v16

    .line 149
    .local v16, groupColIdx:I
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mListAdn:Ljava/util/List;

    .line 151
    invoke-interface {v13}, Landroid/database/Cursor;->moveToFirst()Z

    .line 152
    :goto_1
    invoke-interface {v13}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_5

    .line 153
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cursor.getString(name) = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v0, v18

    invoke-interface {v13, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 154
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cursor.getString(number) = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v0, v19

    invoke-interface {v13, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 155
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cursor.getString(emailsColIdx) = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v13, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 156
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cursor.getString(additionalNumber) = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v13, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 157
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cursor.getString(groupIds) = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v0, v16

    invoke-interface {v13, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 158
    invoke-interface {v13, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 159
    .local v14, email:Ljava/lang/String;
    const/4 v9, 0x0

    .line 160
    .local v9, emails:[Ljava/lang/String;
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 161
    const-string v1, ","

    invoke-virtual {v14, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 162
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "emails.length = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v3, v9

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->log(Ljava/lang/String;)V

    .line 164
    :cond_2
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mListAdn:Ljava/util/List;

    new-instance v3, Lcom/android/internal/telephony/AdnRecord;

    const/4 v4, 0x0

    move/from16 v0, v17

    invoke-interface {v13, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    move/from16 v0, v18

    invoke-interface {v13, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    move/from16 v0, v19

    invoke-interface {v13, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v13, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    const/4 v10, 0x0

    invoke-direct/range {v3 .. v10}, Lcom/android/internal/telephony/AdnRecord;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    invoke-interface {v13}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_1

    .line 176
    .end local v9           #emails:[Ljava/lang/String;
    .end local v11           #anrColIdx:I
    .end local v12           #count:I
    .end local v14           #email:Ljava/lang/String;
    .end local v15           #emailsColIdx:I
    .end local v16           #groupColIdx:I
    .end local v17           #indexColIdx:I
    .end local v18           #nameColIdx:I
    .end local v19           #numberColIdx:I
    :catchall_0
    move-exception v1

    if-eqz v13, :cond_3

    .line 177
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v1

    .line 170
    :cond_4
    const/16 v1, 0xc3

    :try_start_1
    move-object/from16 v0, p0

    iput v1, v0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->mErrCode:I

    .line 171
    const-string v1, "query ADN failed."

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;->errorLog(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 172
    const/4 v1, 0x0

    .line 176
    if-eqz v13, :cond_0

    .line 177
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    .line 174
    .restart local v11       #anrColIdx:I
    .restart local v12       #count:I
    .restart local v15       #emailsColIdx:I
    .restart local v16       #groupColIdx:I
    .restart local v17       #indexColIdx:I
    .restart local v18       #nameColIdx:I
    .restart local v19       #numberColIdx:I
    :cond_5
    const/4 v1, 0x1

    .line 176
    if-eqz v13, :cond_0

    .line 177
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0
.end method
