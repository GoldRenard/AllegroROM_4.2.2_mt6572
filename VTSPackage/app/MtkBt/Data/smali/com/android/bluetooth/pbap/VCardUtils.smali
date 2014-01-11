.class public Lcom/android/bluetooth/pbap/VCardUtils;
.super Ljava/lang/Object;
.source "VCardUtils.java"


# static fields
.field private static final ENCODE64:[C

.field private static final KNOWN_PHONE_TYPES_MAP_STOI:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final KNOWN_PHONE_TYPE_MAP_ITOS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final PHONE_TYPE_SET_UNKNOWN_TO_CONTACTS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sPad:C


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/16 v5, 0xb

    const/16 v4, 0x9

    const/4 v3, 0x6

    .line 89
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPE_MAP_ITOS:Ljava/util/Map;

    .line 90
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPES_MAP_STOI:Ljava/util/Map;

    .line 92
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPE_MAP_ITOS:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "CAR"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPES_MAP_STOI:Ljava/util/Map;

    const-string v1, "CAR"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPE_MAP_ITOS:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "PAGER"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPES_MAP_STOI:Ljava/util/Map;

    const-string v1, "PAGER"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPE_MAP_ITOS:Ljava/util/Map;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ISDN"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPES_MAP_STOI:Ljava/util/Map;

    const-string v1, "ISDN"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPES_MAP_STOI:Ljava/util/Map;

    const-string v1, "HOME"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPES_MAP_STOI:Ljava/util/Map;

    const-string v1, "WORK"

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPES_MAP_STOI:Ljava/util/Map;

    const-string v1, "CELL"

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPES_MAP_STOI:Ljava/util/Map;

    const-string v1, "OTHER"

    const/4 v2, 0x7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPES_MAP_STOI:Ljava/util/Map;

    const-string v1, "CALLBACK"

    const/16 v2, 0x8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPES_MAP_STOI:Ljava/util/Map;

    const-string v1, "COMPANY-MAIN"

    const/16 v2, 0xa

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPES_MAP_STOI:Ljava/util/Map;

    const-string v1, "RADIO"

    const/16 v2, 0xe

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPES_MAP_STOI:Ljava/util/Map;

    const-string v1, "TELEX"

    const/16 v2, 0xf

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPES_MAP_STOI:Ljava/util/Map;

    const-string v1, "TTY-TDD"

    const/16 v2, 0x10

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPES_MAP_STOI:Ljava/util/Map;

    const-string v1, "ASSISTANT"

    const/16 v2, 0x13

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->PHONE_TYPE_SET_UNKNOWN_TO_CONTACTS:Ljava/util/Set;

    .line 114
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->PHONE_TYPE_SET_UNKNOWN_TO_CONTACTS:Ljava/util/Set;

    const-string v1, "MODEM"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 115
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->PHONE_TYPE_SET_UNKNOWN_TO_CONTACTS:Ljava/util/Set;

    const-string v1, "MSG"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 116
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->PHONE_TYPE_SET_UNKNOWN_TO_CONTACTS:Ljava/util/Set;

    const-string v1, "BBS"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 117
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->PHONE_TYPE_SET_UNKNOWN_TO_CONTACTS:Ljava/util/Set;

    const-string v1, "VIDEO"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 405
    const/16 v0, 0x3d

    sput-char v0, Lcom/android/bluetooth/pbap/VCardUtils;->sPad:C

    .line 407
    const/16 v0, 0x40

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->ENCODE64:[C

    return-void

    :array_0
    .array-data 0x2
        0x41t 0x0t
        0x42t 0x0t
        0x43t 0x0t
        0x44t 0x0t
        0x45t 0x0t
        0x46t 0x0t
        0x47t 0x0t
        0x48t 0x0t
        0x49t 0x0t
        0x4at 0x0t
        0x4bt 0x0t
        0x4ct 0x0t
        0x4dt 0x0t
        0x4et 0x0t
        0x4ft 0x0t
        0x50t 0x0t
        0x51t 0x0t
        0x52t 0x0t
        0x53t 0x0t
        0x54t 0x0t
        0x55t 0x0t
        0x56t 0x0t
        0x57t 0x0t
        0x58t 0x0t
        0x59t 0x0t
        0x5at 0x0t
        0x61t 0x0t
        0x62t 0x0t
        0x63t 0x0t
        0x64t 0x0t
        0x65t 0x0t
        0x66t 0x0t
        0x67t 0x0t
        0x68t 0x0t
        0x69t 0x0t
        0x6at 0x0t
        0x6bt 0x0t
        0x6ct 0x0t
        0x6dt 0x0t
        0x6et 0x0t
        0x6ft 0x0t
        0x70t 0x0t
        0x71t 0x0t
        0x72t 0x0t
        0x73t 0x0t
        0x74t 0x0t
        0x75t 0x0t
        0x76t 0x0t
        0x77t 0x0t
        0x78t 0x0t
        0x79t 0x0t
        0x7at 0x0t
        0x30t 0x0t
        0x31t 0x0t
        0x32t 0x0t
        0x33t 0x0t
        0x34t 0x0t
        0x35t 0x0t
        0x36t 0x0t
        0x37t 0x0t
        0x38t 0x0t
        0x39t 0x0t
        0x2bt 0x0t
        0x2ft 0x0t
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 472
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 473
    return-void
.end method

.method public static constructNameFromElements(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .parameter "nameOrderType"
    .parameter "familyName"
    .parameter "middleName"
    .parameter "givenName"

    .prologue
    const/4 v4, 0x0

    .line 301
    move v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, v4

    invoke-static/range {v0 .. v5}, Lcom/android/bluetooth/pbap/VCardUtils;->constructNameFromElements(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static constructNameFromElements(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .parameter "nameOrderType"
    .parameter "familyName"
    .parameter "middleName"
    .parameter "givenName"
    .parameter "prefix"
    .parameter "suffix"

    .prologue
    const/16 v8, 0x20

    .line 307
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 308
    .local v1, builder:Ljava/lang/StringBuilder;
    invoke-static {p0, p1, p2, p3}, Lcom/android/bluetooth/pbap/VCardUtils;->sortNameElements(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 309
    .local v5, nameList:[Ljava/lang/String;
    const/4 v2, 0x1

    .line 310
    .local v2, first:Z
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 311
    const/4 v2, 0x0

    .line 312
    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    :cond_0
    move-object v0, v5

    .local v0, arr$:[Ljava/lang/String;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_3

    aget-object v6, v0, v3

    .line 315
    .local v6, namePart:Ljava/lang/String;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 316
    if-eqz v2, :cond_2

    .line 317
    const/4 v2, 0x0

    .line 321
    :goto_1
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 319
    :cond_2
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 324
    .end local v6           #namePart:Ljava/lang/String;
    :cond_3
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 325
    if-nez v2, :cond_4

    .line 326
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 328
    :cond_4
    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    :cond_5
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7
.end method

.method public static containsOnlyAlphaDigitHyphen(Ljava/lang/String;)Z
    .locals 12
    .parameter "str"

    .prologue
    const/4 v10, 0x1

    .line 381
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 401
    :cond_0
    :goto_0
    return v10

    .line 385
    :cond_1
    const/16 v6, 0x41

    .line 386
    .local v6, lowerAlphabetFirst:I
    const/16 v7, 0x5b

    .line 387
    .local v7, lowerAlphabetLast:I
    const/16 v8, 0x61

    .line 388
    .local v8, upperAlphabetFirst:I
    const/16 v9, 0x7b

    .line 389
    .local v9, upperAlphabetLast:I
    const/16 v1, 0x30

    .line 390
    .local v1, digitFirst:I
    const/16 v2, 0x39

    .line 391
    .local v2, digitLast:I
    const/16 v3, 0x2d

    .line 392
    .local v3, hyphen:I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 393
    .local v5, length:I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_1
    if-ge v4, v5, :cond_0

    .line 394
    invoke-virtual {p0, v4}, Ljava/lang/String;->codePointAt(I)I

    move-result v0

    .line 395
    .local v0, codepoint:I
    const/16 v11, 0x41

    if-gt v11, v0, :cond_2

    const/16 v11, 0x5b

    if-lt v0, v11, :cond_5

    :cond_2
    const/16 v11, 0x61

    if-gt v11, v0, :cond_3

    const/16 v11, 0x7b

    if-lt v0, v11, :cond_5

    :cond_3
    const/16 v11, 0x30

    if-gt v11, v0, :cond_4

    const/16 v11, 0x39

    if-lt v0, v11, :cond_5

    :cond_4
    const/16 v11, 0x2d

    if-eq v0, v11, :cond_5

    .line 398
    const/4 v10, 0x0

    goto :goto_0

    .line 393
    :cond_5
    invoke-virtual {p0, v4, v10}, Ljava/lang/String;->offsetByCodePoints(II)I

    move-result v4

    goto :goto_1
.end method

.method public static containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z
    .locals 7
    .parameter "str"

    .prologue
    const/4 v5, 0x1

    .line 356
    if-eqz p0, :cond_0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 369
    :cond_0
    :goto_0
    return v5

    .line 360
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 361
    .local v4, length:I
    const/16 v0, 0x20

    .line 362
    .local v0, asciiFirst:I
    const/16 v1, 0x126

    .line 363
    .local v1, asciiLast:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    if-ge v3, v4, :cond_0

    .line 364
    invoke-virtual {p0, v3}, Ljava/lang/String;->codePointAt(I)I

    move-result v2

    .line 365
    .local v2, c:I
    const/16 v6, 0x20

    if-lt v2, v6, :cond_2

    const/16 v6, 0x126

    if-lt v6, v2, :cond_2

    const/16 v6, 0xa

    if-eq v2, v6, :cond_2

    const/16 v6, 0xd

    if-ne v2, v6, :cond_3

    .line 366
    :cond_2
    const/4 v5, 0x0

    goto :goto_0

    .line 363
    :cond_3
    invoke-virtual {p0, v3, v5}, Ljava/lang/String;->offsetByCodePoints(II)I

    move-result v3

    goto :goto_1
.end method

.method public static containsOnlyPrintableAscii(Ljava/lang/String;)Z
    .locals 7
    .parameter "str"

    .prologue
    const/4 v5, 0x1

    .line 334
    if-eqz p0, :cond_0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 347
    :cond_0
    :goto_0
    return v5

    .line 338
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 339
    .local v4, length:I
    const/16 v0, 0x20

    .line 340
    .local v0, asciiFirst:I
    const/16 v1, 0x126

    .line 341
    .local v1, asciiLast:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    if-ge v3, v4, :cond_0

    .line 342
    invoke-virtual {p0, v3}, Ljava/lang/String;->codePointAt(I)I

    move-result v2

    .line 343
    .local v2, c:I
    const/16 v6, 0x20

    if-lt v2, v6, :cond_2

    const/16 v6, 0x126

    if-ge v6, v2, :cond_3

    .line 344
    :cond_2
    const/4 v5, 0x0

    goto :goto_0

    .line 341
    :cond_3
    invoke-virtual {p0, v3, v5}, Ljava/lang/String;->offsetByCodePoints(II)I

    move-result v3

    goto :goto_1
.end method

.method public static encodeBase64([B)Ljava/lang/String;
    .locals 7
    .parameter "data"

    .prologue
    .line 415
    if-nez p0, :cond_0

    .line 416
    const-string v5, ""

    .line 449
    :goto_0
    return-object v5

    .line 419
    :cond_0
    array-length v5, p0

    add-int/lit8 v5, v5, 0x2

    div-int/lit8 v5, v5, 0x3

    mul-int/lit8 v5, v5, 0x4

    new-array v0, v5, [C

    .line 420
    .local v0, charBuffer:[C
    const/4 v2, 0x0

    .line 421
    .local v2, position:I
    const/4 v4, 0x0

    .line 422
    .local v4, threeBytes:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v5, p0

    add-int/lit8 v5, v5, -0x2

    if-ge v1, v5, :cond_1

    .line 423
    aget-byte v5, p0, v1

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x10

    add-int/lit8 v6, v1, 0x1

    aget-byte v6, p0, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    add-int/2addr v5, v6

    add-int/lit8 v6, v1, 0x2

    aget-byte v6, p0, v6

    and-int/lit16 v6, v6, 0xff

    add-int v4, v5, v6

    .line 424
    add-int/lit8 v3, v2, 0x1

    .end local v2           #position:I
    .local v3, position:I
    sget-object v5, Lcom/android/bluetooth/pbap/VCardUtils;->ENCODE64:[C

    shr-int/lit8 v6, v4, 0x12

    aget-char v5, v5, v6

    aput-char v5, v0, v2

    .line 425
    add-int/lit8 v2, v3, 0x1

    .end local v3           #position:I
    .restart local v2       #position:I
    sget-object v5, Lcom/android/bluetooth/pbap/VCardUtils;->ENCODE64:[C

    shr-int/lit8 v6, v4, 0xc

    and-int/lit8 v6, v6, 0x3f

    aget-char v5, v5, v6

    aput-char v5, v0, v3

    .line 426
    add-int/lit8 v3, v2, 0x1

    .end local v2           #position:I
    .restart local v3       #position:I
    sget-object v5, Lcom/android/bluetooth/pbap/VCardUtils;->ENCODE64:[C

    shr-int/lit8 v6, v4, 0x6

    and-int/lit8 v6, v6, 0x3f

    aget-char v5, v5, v6

    aput-char v5, v0, v2

    .line 427
    add-int/lit8 v2, v3, 0x1

    .end local v3           #position:I
    .restart local v2       #position:I
    sget-object v5, Lcom/android/bluetooth/pbap/VCardUtils;->ENCODE64:[C

    and-int/lit8 v6, v4, 0x3f

    aget-char v5, v5, v6

    aput-char v5, v0, v3

    .line 422
    add-int/lit8 v1, v1, 0x3

    goto :goto_1

    .line 429
    :cond_1
    array-length v5, p0

    rem-int/lit8 v5, v5, 0x3

    packed-switch v5, :pswitch_data_0

    .line 449
    :goto_2
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v0}, Ljava/lang/String;-><init>([C)V

    goto :goto_0

    .line 431
    :pswitch_0
    array-length v5, p0

    add-int/lit8 v5, v5, -0x1

    aget-byte v5, p0, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v4, v5, 0x10

    .line 432
    add-int/lit8 v3, v2, 0x1

    .end local v2           #position:I
    .restart local v3       #position:I
    sget-object v5, Lcom/android/bluetooth/pbap/VCardUtils;->ENCODE64:[C

    shr-int/lit8 v6, v4, 0x12

    aget-char v5, v5, v6

    aput-char v5, v0, v2

    .line 433
    add-int/lit8 v2, v3, 0x1

    .end local v3           #position:I
    .restart local v2       #position:I
    sget-object v5, Lcom/android/bluetooth/pbap/VCardUtils;->ENCODE64:[C

    shr-int/lit8 v6, v4, 0xc

    and-int/lit8 v6, v6, 0x3f

    aget-char v5, v5, v6

    aput-char v5, v0, v3

    .line 434
    add-int/lit8 v3, v2, 0x1

    .end local v2           #position:I
    .restart local v3       #position:I
    sget-char v5, Lcom/android/bluetooth/pbap/VCardUtils;->sPad:C

    aput-char v5, v0, v2

    .line 435
    add-int/lit8 v2, v3, 0x1

    .end local v3           #position:I
    .restart local v2       #position:I
    sget-char v5, Lcom/android/bluetooth/pbap/VCardUtils;->sPad:C

    aput-char v5, v0, v3

    goto :goto_2

    .line 438
    :pswitch_1
    array-length v5, p0

    add-int/lit8 v5, v5, -0x2

    aget-byte v5, p0, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x10

    array-length v6, p0

    add-int/lit8 v6, v6, -0x1

    aget-byte v6, p0, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    add-int v4, v5, v6

    .line 440
    add-int/lit8 v3, v2, 0x1

    .end local v2           #position:I
    .restart local v3       #position:I
    sget-object v5, Lcom/android/bluetooth/pbap/VCardUtils;->ENCODE64:[C

    shr-int/lit8 v6, v4, 0x12

    aget-char v5, v5, v6

    aput-char v5, v0, v2

    .line 441
    add-int/lit8 v2, v3, 0x1

    .end local v3           #position:I
    .restart local v2       #position:I
    sget-object v5, Lcom/android/bluetooth/pbap/VCardUtils;->ENCODE64:[C

    shr-int/lit8 v6, v4, 0xc

    and-int/lit8 v6, v6, 0x3f

    aget-char v5, v5, v6

    aput-char v5, v0, v3

    .line 442
    add-int/lit8 v3, v2, 0x1

    .end local v2           #position:I
    .restart local v3       #position:I
    sget-object v5, Lcom/android/bluetooth/pbap/VCardUtils;->ENCODE64:[C

    shr-int/lit8 v6, v4, 0x6

    and-int/lit8 v6, v6, 0x3f

    aget-char v5, v5, v6

    aput-char v5, v0, v2

    .line 443
    add-int/lit8 v2, v3, 0x1

    .end local v3           #position:I
    .restart local v2       #position:I
    sget-char v5, Lcom/android/bluetooth/pbap/VCardUtils;->sPad:C

    aput-char v5, v0, v3

    goto :goto_2

    .line 429
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static getPhoneAttributeString(Ljava/lang/Integer;)Ljava/lang/String;
    .locals 1
    .parameter "type"

    .prologue
    .line 121
    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPE_MAP_ITOS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getPhoneNumberFormat(I)I
    .locals 1
    .parameter "vcardType"

    .prologue
    .line 214
    invoke-static {p0}, Lcom/android/bluetooth/pbap/VCardConfig;->isJapaneseDevice(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 215
    const/4 v0, 0x2

    .line 217
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static getPhoneTypeFromStrings(Ljava/util/Collection;)Ljava/lang/Object;
    .locals 8
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 129
    .local p0, types:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    const/4 v5, -0x1

    .line 130
    .local v5, type:I
    const/4 v3, 0x0

    .line 131
    .local v3, label:Ljava/lang/String;
    const/4 v2, 0x0

    .line 132
    .local v2, isFax:Z
    const/4 v0, 0x0

    .line 134
    .local v0, hasPref:Z
    if-eqz p0, :cond_5

    .line 135
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 136
    .local v6, typeString:Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v6

    .line 137
    const-string v7, "PREF"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 138
    const/4 v0, 0x1

    goto :goto_0

    .line 139
    :cond_1
    const-string v7, "FAX"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 140
    const/4 v2, 0x1

    goto :goto_0

    .line 142
    :cond_2
    const-string v7, "X-"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    if-gez v5, :cond_3

    .line 143
    const/4 v7, 0x2

    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 145
    :cond_3
    sget-object v7, Lcom/android/bluetooth/pbap/VCardUtils;->KNOWN_PHONE_TYPES_MAP_STOI:Ljava/util/Map;

    invoke-interface {v7, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 146
    .local v4, tmp:Ljava/lang/Integer;
    if-eqz v4, :cond_4

    .line 147
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v5

    goto :goto_0

    .line 148
    :cond_4
    if-gez v5, :cond_0

    .line 149
    const/4 v5, 0x0

    .line 150
    move-object v3, v6

    goto :goto_0

    .line 155
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v4           #tmp:Ljava/lang/Integer;
    .end local v6           #typeString:Ljava/lang/String;
    :cond_5
    if-gez v5, :cond_6

    .line 156
    if-eqz v0, :cond_8

    .line 157
    const/16 v5, 0xc

    .line 163
    :cond_6
    :goto_1
    if-eqz v2, :cond_7

    .line 164
    const/4 v7, 0x1

    if-ne v5, v7, :cond_9

    .line 165
    const/4 v5, 0x5

    .line 172
    :cond_7
    :goto_2
    if-nez v5, :cond_b

    .line 175
    .end local v3           #label:Ljava/lang/String;
    :goto_3
    return-object v3

    .line 160
    .restart local v3       #label:Ljava/lang/String;
    :cond_8
    const/4 v5, 0x1

    goto :goto_1

    .line 166
    :cond_9
    const/4 v7, 0x3

    if-ne v5, v7, :cond_a

    .line 167
    const/4 v5, 0x4

    goto :goto_2

    .line 168
    :cond_a
    const/4 v7, 0x7

    if-ne v5, v7, :cond_7

    .line 169
    const/16 v5, 0xd

    goto :goto_2

    .line 175
    :cond_b
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_3
.end method

.method public static getVCardPostalElements(Landroid/content/ContentValues;)[Ljava/lang/String;
    .locals 8
    .parameter "contentValues"

    .prologue
    const/4 v7, 0x6

    const/4 v6, 0x5

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x0

    .line 265
    const/4 v2, 0x7

    new-array v0, v2, [Ljava/lang/String;

    .line 266
    .local v0, dataArray:[Ljava/lang/String;
    const-string v2, "data5"

    invoke-virtual {p0, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v3

    .line 267
    aget-object v2, v0, v3

    if-nez v2, :cond_0

    .line 268
    const-string v2, ""

    aput-object v2, v0, v3

    .line 271
    :cond_0
    const/4 v2, 0x1

    const-string v3, ""

    aput-object v3, v0, v2

    .line 272
    const-string v2, "data4"

    invoke-virtual {p0, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v4

    .line 273
    aget-object v2, v0, v4

    if-nez v2, :cond_1

    .line 274
    const-string v2, ""

    aput-object v2, v0, v4

    .line 277
    :cond_1
    const-string v2, "data7"

    invoke-virtual {p0, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v5

    .line 278
    aget-object v2, v0, v5

    if-nez v2, :cond_2

    .line 279
    const-string v2, ""

    aput-object v2, v0, v5

    .line 281
    :cond_2
    const-string v2, "data8"

    invoke-virtual {p0, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 282
    .local v1, region:Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 283
    const/4 v2, 0x4

    aput-object v1, v0, v2

    .line 287
    :goto_0
    const-string v2, "data9"

    invoke-virtual {p0, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v6

    .line 288
    aget-object v2, v0, v6

    if-nez v2, :cond_3

    .line 289
    const-string v2, ""

    aput-object v2, v0, v6

    .line 291
    :cond_3
    const-string v2, "data10"

    invoke-virtual {p0, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v7

    .line 292
    aget-object v2, v0, v7

    if-nez v2, :cond_4

    .line 293
    const-string v2, ""

    aput-object v2, v0, v7

    .line 296
    :cond_4
    return-object v0

    .line 285
    :cond_5
    const/4 v2, 0x4

    const-string v3, ""

    aput-object v3, v0, v2

    goto :goto_0
.end method

.method public static insertStructuredPostalDataUsingContactsStruct(ILandroid/content/ContentProviderOperation$Builder;Lcom/android/bluetooth/pbap/ContactStruct$PostalData;)V
    .locals 2
    .parameter "vcardType"
    .parameter "builder"
    .parameter "postalData"

    .prologue
    .line 230
    const-string v0, "raw_contact_id"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 231
    const-string v0, "mimetype"

    const-string v1, "vnd.android.cursor.item/postal-address_v2"

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 233
    const-string v0, "data2"

    iget v1, p2, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->type:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 234
    iget v0, p2, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->type:I

    if-nez v0, :cond_0

    .line 235
    const-string v0, "data3"

    iget-object v1, p2, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->label:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 238
    :cond_0
    const-string v0, "data5"

    iget-object v1, p2, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->pobox:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 241
    const-string v0, "data4"

    iget-object v1, p2, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->street:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 242
    const-string v0, "data7"

    iget-object v1, p2, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->localty:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 243
    const-string v0, "data8"

    iget-object v1, p2, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->region:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 244
    const-string v0, "data9"

    iget-object v1, p2, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->postalCode:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 245
    const-string v0, "data10"

    iget-object v1, p2, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->country:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 247
    const-string v0, "data1"

    invoke-virtual {p2, p0}, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->getFormattedAddress(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 249
    iget-boolean v0, p2, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->isPrimary:Z

    if-eqz v0, :cond_1

    .line 250
    const-string v0, "is_primary"

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 252
    :cond_1
    return-void
.end method

.method public static isAllowablePhoneNumberChar(C)Z
    .locals 2
    .parameter "ch"

    .prologue
    .line 484
    const/4 v0, 0x0

    .line 486
    .local v0, ret:Z
    invoke-static {p0}, Ljava/lang/Character;->isDigit(C)Z

    move-result v1

    if-nez v1, :cond_0

    const/16 v1, 0x28

    if-eq p0, v1, :cond_0

    const/16 v1, 0x2f

    if-eq p0, v1, :cond_0

    const/16 v1, 0x29

    if-eq p0, v1, :cond_0

    const/16 v1, 0x2d

    if-eq p0, v1, :cond_0

    const/16 v1, 0x4e

    if-eq p0, v1, :cond_0

    const/16 v1, 0x2c

    if-eq p0, v1, :cond_0

    const/16 v1, 0x2e

    if-eq p0, v1, :cond_0

    const/16 v1, 0x2a

    if-eq p0, v1, :cond_0

    const/16 v1, 0x23

    if-eq p0, v1, :cond_0

    const/16 v1, 0x2b

    if-eq p0, v1, :cond_0

    const/16 v1, 0x20

    if-ne p0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 489
    :goto_0
    return v0

    .line 486
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isValidPhoneAttribute(Ljava/lang/String;I)Z
    .locals 1
    .parameter "phoneAttribute"
    .parameter "vcardType"

    .prologue
    .line 185
    const-string v0, "X-"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "x-"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/android/bluetooth/pbap/VCardUtils;->PHONE_TYPE_SET_UNKNOWN_TO_CONTACTS:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static sortNameElements(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 5
    .parameter "vcardType"
    .parameter "familyName"
    .parameter "middleName"
    .parameter "givenName"

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 191
    const/4 v1, 0x3

    new-array v0, v1, [Ljava/lang/String;

    .line 192
    .local v0, list:[Ljava/lang/String;
    invoke-static {p0}, Lcom/android/bluetooth/pbap/VCardConfig;->getNameOrderType(I)I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 205
    aput-object p3, v0, v2

    .line 206
    aput-object p2, v0, v3

    .line 207
    aput-object p1, v0, v4

    .line 210
    :goto_0
    return-object v0

    .line 195
    :sswitch_0
    aput-object p1, v0, v2

    .line 196
    aput-object p2, v0, v3

    .line 197
    aput-object p3, v0, v4

    goto :goto_0

    .line 200
    :sswitch_1
    aput-object p2, v0, v2

    .line 201
    aput-object p3, v0, v3

    .line 202
    aput-object p1, v0, v4

    goto :goto_0

    .line 192
    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_1
        0x8 -> :sswitch_0
    .end sparse-switch
.end method

.method public static toHalfWidthString(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .parameter "orgString"

    .prologue
    .line 453
    if-eqz p0, :cond_0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 454
    :cond_0
    const/4 v5, 0x0

    .line 469
    :goto_0
    return-object v5

    .line 456
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 457
    .local v0, builder:Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 458
    .local v4, length:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    if-ge v3, v4, :cond_3

    .line 461
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 462
    .local v1, ch:C
    invoke-static {v1}, Lcom/android/bluetooth/pbap/JapaneseUtils;->tryGetHalfWidthText(C)Ljava/lang/CharSequence;

    move-result-object v2

    .line 463
    .local v2, halfWidthText:Ljava/lang/CharSequence;
    if-eqz v2, :cond_2

    .line 464
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 458
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 466
    :cond_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 469
    .end local v1           #ch:C
    .end local v2           #halfWidthText:Ljava/lang/CharSequence;
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0
.end method
