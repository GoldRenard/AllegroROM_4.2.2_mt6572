.class public Lcom/android/bluetooth/pbap/VCardConfig;
.super Ljava/lang/Object;
.source "VCardConfig.java"


# static fields
.field public static final DEFAULT_CHARSET:Ljava/lang/String; = "iso-8859-1"

.field private static final FLAG_CHARSET_SHIFT_JIS:I = 0x20

.field private static final FLAG_CHARSET_UTF8:I = 0x0

.field private static final FLAG_DOCOMO:I = 0x20000000

.field private static final FLAG_USE_ANDROID_PROPERTY:I = -0x80000000

.field private static final FLAG_USE_DEFACT_PROPERTY:I = 0x40000000

.field public static final FLAG_USE_QP_TO_PRIMARY_PROPERTIES:I = 0x10000000

.field private static final FLAG_V21:I = 0x0

.field private static final FLAG_V30:I = 0x1

.field public static final IGNORE_CASE_EXCEPT_VALUE:Z = true

.field static final LOG_LEVEL:I = 0x0

.field static final LOG_LEVEL_NONE:I = 0x0

.field static final LOG_LEVEL_PERFORMANCE_MEASUREMENT:I = 0x1

.field static final LOG_LEVEL_SHOW_WARNING:I = 0x2

.field static final LOG_LEVEL_VERBOSE:I = 0x3

.field public static final NAME_ORDER_DEFAULT:I = 0x0

.field public static final NAME_ORDER_EUROPE:I = 0x4

.field public static final NAME_ORDER_JAPANESE:I = 0x8

.field private static final NAME_ORDER_MASK:I = 0xc

.field private static final VCARD_TYPES_MAP:Ljava/util/Map; = null
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

.field public static final VCARD_TYPE_DEFAULT:I = -0x40000000

.field public static final VCARD_TYPE_DOCOMO:I = 0x20000028

.field private static final VCARD_TYPE_DOCOMO_STR:Ljava/lang/String; = "docomo"

.field public static final VCARD_TYPE_V21_EUROPE:I = -0x3ffffffc

.field static final VCARD_TYPE_V21_EUROPE_STR:Ljava/lang/String; = "v21_europe"

.field public static final VCARD_TYPE_V21_GENERIC:I = -0x40000000

.field public static final VCARD_TYPE_V21_JAPANESE:I = -0x3fffffd8

.field static final VCARD_TYPE_V21_JAPANESE_STR:Ljava/lang/String; = "v21_japanese"

.field public static final VCARD_TYPE_V21_JAPANESE_UTF8:I = -0x3ffffff8

.field static final VCARD_TYPE_V21_JAPANESE_UTF8_STR:Ljava/lang/String; = "v21_japanese_utf8"

.field public static final VCARD_TYPE_V30_EUROPE:I = -0x3ffffffb

.field static final VCARD_TYPE_V30_EUROPE_STR:Ljava/lang/String; = "v30_europe"

.field public static final VCARD_TYPE_V30_GENERIC:I = -0x3fffffff

.field static final VCARD_TYPE_V30_GENERIC_STR:Ljava/lang/String; = "v30_generic"

.field public static final VCARD_TYPE_V30_JAPANESE:I = -0x3fffffd7

.field static final VCARD_TYPE_V30_JAPANESE_STR:Ljava/lang/String; = "v30_japanese"

.field public static final VCARD_TYPE_V30_JAPANESE_UTF8:I = -0x3ffffff7

.field static final VCARD_TYPE_V30_JAPANESE_UTF8_STR:Ljava/lang/String; = "v30_japanese_utf8"

.field static sVcardTypeV21GenericStr:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 168
    const-string v0, "v21_generic"

    sput-object v0, Lcom/android/bluetooth/pbap/VCardConfig;->sVcardTypeV21GenericStr:Ljava/lang/String;

    .line 252
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/bluetooth/pbap/VCardConfig;->VCARD_TYPES_MAP:Ljava/util/Map;

    .line 253
    sget-object v0, Lcom/android/bluetooth/pbap/VCardConfig;->VCARD_TYPES_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/bluetooth/pbap/VCardConfig;->sVcardTypeV21GenericStr:Ljava/lang/String;

    const/high16 v2, -0x4000

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    sget-object v0, Lcom/android/bluetooth/pbap/VCardConfig;->VCARD_TYPES_MAP:Ljava/util/Map;

    const-string v1, "v30_generic"

    const v2, -0x3fffffff

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    sget-object v0, Lcom/android/bluetooth/pbap/VCardConfig;->VCARD_TYPES_MAP:Ljava/util/Map;

    const-string v1, "v21_europe"

    const v2, -0x3ffffffc

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    sget-object v0, Lcom/android/bluetooth/pbap/VCardConfig;->VCARD_TYPES_MAP:Ljava/util/Map;

    const-string v1, "v30_europe"

    const v2, -0x3ffffffb

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    sget-object v0, Lcom/android/bluetooth/pbap/VCardConfig;->VCARD_TYPES_MAP:Ljava/util/Map;

    const-string v1, "v21_japanese"

    const v2, -0x3fffffd8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    sget-object v0, Lcom/android/bluetooth/pbap/VCardConfig;->VCARD_TYPES_MAP:Ljava/util/Map;

    const-string v1, "v21_japanese_utf8"

    const v2, -0x3ffffff8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    sget-object v0, Lcom/android/bluetooth/pbap/VCardConfig;->VCARD_TYPES_MAP:Ljava/util/Map;

    const-string v1, "v30_japanese"

    const v2, -0x3fffffd7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    sget-object v0, Lcom/android/bluetooth/pbap/VCardConfig;->VCARD_TYPES_MAP:Ljava/util/Map;

    const-string v1, "v30_japanese_utf8"

    const v2, -0x3ffffff7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    sget-object v0, Lcom/android/bluetooth/pbap/VCardConfig;->VCARD_TYPES_MAP:Ljava/util/Map;

    const-string v1, "docomo"

    const v2, 0x20000028

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 344
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 345
    return-void
.end method

.method public static getNameOrderType(I)I
    .locals 1
    .parameter "vcardType"

    .prologue
    .line 318
    and-int/lit8 v0, p0, 0xc

    return v0
.end method

.method public static getVCardTypeFromString(Ljava/lang/String;)I
    .locals 2
    .parameter "vcardTypeString"

    .prologue
    .line 265
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 266
    .local v0, loweredKey:Ljava/lang/String;
    sget-object v1, Lcom/android/bluetooth/pbap/VCardConfig;->VCARD_TYPES_MAP:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 267
    sget-object v1, Lcom/android/bluetooth/pbap/VCardConfig;->VCARD_TYPES_MAP:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 270
    :goto_0
    return v1

    :cond_0
    const/high16 v1, -0x4000

    goto :goto_0
.end method

.method public static isDoCoMo(I)Z
    .locals 1
    .parameter "vcardType"

    .prologue
    .line 283
    const/high16 v0, 0x2000

    and-int/2addr v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isJapaneseDevice(I)Z
    .locals 1
    .parameter "vcardType"

    .prologue
    .line 291
    const v0, -0x3fffffd8

    if-eq p0, v0, :cond_0

    const v0, -0x3ffffff8

    if-eq p0, v0, :cond_0

    const v0, -0x3fffffd7

    if-eq p0, v0, :cond_0

    const v0, -0x3ffffff7

    if-eq p0, v0, :cond_0

    const v0, 0x20000028

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isV30(I)Z
    .locals 1
    .parameter "vcardType"

    .prologue
    .line 275
    and-int/lit8 v0, p0, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static needsToConvertPhoneticString(I)Z
    .locals 1
    .parameter "vcardType"

    .prologue
    .line 314
    const v0, 0x20000028

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static onlyOneNoteFieldIsAvailable(I)Z
    .locals 1
    .parameter "vcardType"

    .prologue
    .line 330
    const v0, 0x20000028

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static showPerformanceLog()Z
    .locals 1

    .prologue
    .line 334
    const/4 v0, 0x0

    return v0
.end method

.method public static usesAndroidSpecificProperty(I)Z
    .locals 1
    .parameter "vcardType"

    .prologue
    .line 322
    const/high16 v0, -0x8000

    and-int/2addr v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static usesDefactProperty(I)Z
    .locals 1
    .parameter "vcardType"

    .prologue
    .line 326
    const/high16 v0, 0x4000

    and-int/2addr v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static usesQPToPrimaryProperties(I)Z
    .locals 1
    .parameter "vcardType"

    .prologue
    .line 341
    invoke-static {p0}, Lcom/android/bluetooth/pbap/VCardConfig;->usesQuotedPrintable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/high16 v0, 0x1000

    and-int/2addr v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static usesQuotedPrintable(I)Z
    .locals 1
    .parameter "vcardType"

    .prologue
    .line 279
    invoke-static {p0}, Lcom/android/bluetooth/pbap/VCardConfig;->isV30(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static usesShiftJis(I)Z
    .locals 1
    .parameter "vcardType"

    .prologue
    .line 302
    and-int/lit8 v0, p0, 0x20

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static usesUtf8(I)Z
    .locals 1
    .parameter "vcardType"

    .prologue
    .line 298
    and-int/lit8 v0, p0, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
