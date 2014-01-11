.class public Lcom/android/bluetooth/pbap/BluetoothVCardComposer;
.super Ljava/lang/Object;
.source "BluetoothVCardComposer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;,
        Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;
    }
.end annotation


# static fields
.field private static final CALLER_NAME_COLUMN_INDEX:I = 0x3

.field private static final CALLER_NUMBERLABEL_COLUMN_INDEX:I = 0x5

.field private static final CALLER_NUMBERTYPE_COLUMN_INDEX:I = 0x4

.field private static final CALL_LOG_PROJECTION:[Ljava/lang/String; = null

.field private static final CALL_TYPE_COLUMN_INDEX:I = 0x2

.field private static final CONTACTS_PROJECTION:[Ljava/lang/String; = null

.field public static final COUNT_NO_LIMIT:I = -0x1

.field private static final DATA_REQUEST_URI:Landroid/net/Uri; = null

.field private static final DATE_COLUMN_INDEX:I = 0x1

.field private static final DEFAULT_EMAIL_TYPE:Ljava/lang/String; = "INTERNET"

.field public static final FAILURE_REASON_FAILED_TO_GET_DATABASE_INFO:Ljava/lang/String; = "Failed to get database information"

.field public static final FAILURE_REASON_NOT_INITIALIZED:Ljava/lang/String; = "The vCard composer object is not correctly initialized"

.field public static final FAILURE_REASON_NO_ENTRY:Ljava/lang/String; = "There\'s no exportable in the database"

.field private static final FLAG_TIMEZONE_UTC:Ljava/lang/String; = "Z"

.field private static final IM_MAP:Ljava/util/Map; = null
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

.field private static final LOG_TAG:Ljava/lang/String; = "BluetoothVCardComposer"

.field public static final NO_ERROR:Ljava/lang/String; = "No error"

.field private static final NUMBER_COLUMN_INDEX:I = 0x0

.field private static final SHIFT_JIS:Ljava/lang/String; = "SHIFT_JIS"

.field public static final VCARD_ATTRIB_ADR:I = 0x20

.field public static final VCARD_ATTRIB_AGENT:I = 0x8000

.field public static final VCARD_ATTRIB_BDAY:I = 0x10

.field public static final VCARD_ATTRIB_CATEGORIES:I = 0x1000000

.field public static final VCARD_ATTRIB_CLASS:I = 0x4000000

.field public static final VCARD_ATTRIB_EMAIL:I = 0x100

.field public static final VCARD_ATTRIB_FN:I = 0x2

.field public static final VCARD_ATTRIB_GEO:I = 0x800

.field public static final VCARD_ATTRIB_KEY:I = 0x400000

.field public static final VCARD_ATTRIB_LABEL:I = 0x40

.field public static final VCARD_ATTRIB_LOGO:I = 0x4000

.field public static final VCARD_ATTRIB_MAILER:I = 0x200

.field public static final VCARD_ATTRIB_N:I = 0x4

.field public static final VCARD_ATTRIB_NICKNAME:I = 0x800000

.field public static final VCARD_ATTRIB_NOTE:I = 0x20000

.field public static final VCARD_ATTRIB_ORG:I = 0x10000

.field public static final VCARD_ATTRIB_PHOTO:I = 0x8

.field public static final VCARD_ATTRIB_PROID:I = 0x2000000

.field public static final VCARD_ATTRIB_REV:I = 0x40000

.field public static final VCARD_ATTRIB_ROLE:I = 0x2000

.field public static final VCARD_ATTRIB_SORTSTRING:I = 0x8000000

.field public static final VCARD_ATTRIB_SOUND:I = 0x80000

.field public static final VCARD_ATTRIB_TEL:I = 0x80

.field public static final VCARD_ATTRIB_TITLE:I = 0x1000

.field public static final VCARD_ATTRIB_TZ:I = 0x400

.field public static final VCARD_ATTRIB_UID:I = 0x200000

.field public static final VCARD_ATTRIB_URL:I = 0x100000

.field public static final VCARD_ATTRIB_VERSION:I = 0x1

.field public static final VCARD_ATTRIB_XIRMCCALLDATETIME:I = 0x10000000

.field private static final VCARD_ATTR_ENCODING_BASE64_V21:Ljava/lang/String; = "ENCODING=BASE64"

.field private static final VCARD_ATTR_ENCODING_BASE64_V30:Ljava/lang/String; = "ENCODING=b"

.field private static final VCARD_ATTR_ENCODING_QP:Ljava/lang/String; = "ENCODING=QUOTED-PRINTABLE"

.field private static final VCARD_ATTR_EQUAL:Ljava/lang/String; = "="

.field private static final VCARD_ATTR_SEPARATOR:Ljava/lang/String; = ";"

.field private static final VCARD_COL_SEPARATOR:Ljava/lang/String; = "\r\n"

.field private static final VCARD_DATA_PUBLIC:Ljava/lang/String; = "PUBLIC"

.field private static final VCARD_DATA_SEPARATOR:Ljava/lang/String; = ":"

.field private static final VCARD_DATA_VCARD:Ljava/lang/String; = "VCARD"

.field private static final VCARD_ITEM_SEPARATOR:Ljava/lang/String; = ";"

.field private static final VCARD_PROPERTY_ADR:Ljava/lang/String; = "ADR"

.field private static final VCARD_PROPERTY_BEGIN:Ljava/lang/String; = "BEGIN"

.field private static final VCARD_PROPERTY_BIRTHDAY:Ljava/lang/String; = "BDAY"

.field private static final VCARD_PROPERTY_CALLTYPE_INCOMING:Ljava/lang/String; = "RECEIVED"

.field private static final VCARD_PROPERTY_CALLTYPE_MISSED:Ljava/lang/String; = "MISSED"

.field private static final VCARD_PROPERTY_CALLTYPE_OUTGOING:Ljava/lang/String; = "DIALED"

.field private static final VCARD_PROPERTY_EMAIL:Ljava/lang/String; = "EMAIL"

.field private static final VCARD_PROPERTY_END:Ljava/lang/String; = "END"

.field private static final VCARD_PROPERTY_FULL_NAME:Ljava/lang/String; = "FN"

.field private static final VCARD_PROPERTY_NAME:Ljava/lang/String; = "N"

.field private static final VCARD_PROPERTY_NICKNAME:Ljava/lang/String; = "NICKNAME"

.field private static final VCARD_PROPERTY_NOTE:Ljava/lang/String; = "NOTE"

.field private static final VCARD_PROPERTY_ORG:Ljava/lang/String; = "ORG"

.field private static final VCARD_PROPERTY_PHOTO:Ljava/lang/String; = "PHOTO"

.field private static final VCARD_PROPERTY_SORT_STRING:Ljava/lang/String; = "SORT-STRING"

.field private static final VCARD_PROPERTY_SOUND:Ljava/lang/String; = "SOUND"

.field private static final VCARD_PROPERTY_TEL:Ljava/lang/String; = "TEL"

.field private static final VCARD_PROPERTY_TITLE:Ljava/lang/String; = "TITLE"

.field private static final VCARD_PROPERTY_URL:Ljava/lang/String; = "URL"

.field private static final VCARD_PROPERTY_VERSION:Ljava/lang/String; = "VERSION"

.field private static final VCARD_PROPERTY_X_CLASS:Ljava/lang/String; = "X-CLASS"

.field private static final VCARD_PROPERTY_X_DCM_HMN_MODE:Ljava/lang/String; = "X-DCM-HMN-MODE"

.field private static final VCARD_PROPERTY_X_NICKNAME:Ljava/lang/String; = "X-NICKNAME"

.field private static final VCARD_PROPERTY_X_NO:Ljava/lang/String; = "X-NO"

.field private static final VCARD_PROPERTY_X_PHONETIC_FIRST_NAME:Ljava/lang/String; = "X-PHONETIC-FIRST-NAME"

.field private static final VCARD_PROPERTY_X_PHONETIC_LAST_NAME:Ljava/lang/String; = "X-PHONETIC-LAST-NAME"

.field private static final VCARD_PROPERTY_X_PHONETIC_MIDDLE_NAME:Ljava/lang/String; = "X-PHONETIC-MIDDLE-NAME"

.field private static final VCARD_PROPERTY_X_REDUCTION:Ljava/lang/String; = "X-REDUCTION"

.field private static final VCARD_PROPERTY_X_TIMESTAMP:Ljava/lang/String; = "X-IRMC-CALL-DATETIME"

.field public static final VCARD_TYPE_STRING_DOCOMO:Ljava/lang/String; = "docomo"

.field private static final VCARD_WS:Ljava/lang/String; = " "


# instance fields
.field private final mCareHandlerErrors:Z

.field private final mCharsetString:Ljava/lang/String;

.field private final mContentResolver:Landroid/content/ContentResolver;

.field private final mContext:Landroid/content/Context;

.field private mCursor:Landroid/database/Cursor;

.field private mErrorReason:Ljava/lang/String;

.field private mFilter:J

.field private final mHandlerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;",
            ">;"
        }
    .end annotation
.end field

.field private mIdColumn:I

.field private mIsCallLogComposer:Z

.field private final mIsDoCoMo:Z

.field private final mIsJapaneseMobilePhone:Z

.field private final mIsV30:Z

.field private mMaxCount:I

.field private mNeedPhotoForVCard:Z

.field private mOffset:I

.field private final mOnlyOneNoteFieldIsAvailable:Z

.field private mTerminateIsCalled:Z

.field private mUsePbapNameImprove:Z

.field private final mUsesAndroidProperty:Z

.field private final mUsesDefactProperty:Z

.field private final mUsesQPToPrimaryProperties:Z

.field private final mUsesQuotedPrintable:Z

.field private final mUsesShiftJis:Z

.field private final mUsesUtf8:Z

.field private final mVCardAttributeCharset:Ljava/lang/String;

.field private final mVCardType:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x6

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 118
    sget-object v1, Landroid/provider/ContactsContract$RawContactsEntity;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 119
    .local v0, builder:Landroid/net/Uri$Builder;
    const-string v1, "for_export_only"

    const-string v2, "1"

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 120
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    sput-object v1, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->DATA_REQUEST_URI:Landroid/net/Uri;

    .line 358
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sput-object v1, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->IM_MAP:Ljava/util/Map;

    .line 359
    sget-object v1, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->IM_MAP:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "X-AIM"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    sget-object v1, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->IM_MAP:Ljava/util/Map;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "X-MSN"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    sget-object v1, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->IM_MAP:Ljava/util/Map;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "X-YAHOO"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 362
    sget-object v1, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->IM_MAP:Ljava/util/Map;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "X-ICQ"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 363
    sget-object v1, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->IM_MAP:Ljava/util/Map;

    const/4 v2, 0x7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "X-JABBER"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 364
    sget-object v1, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->IM_MAP:Ljava/util/Map;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "X-SKYPE-USERNAME"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 374
    new-array v1, v5, [Ljava/lang/String;

    const-string v2, "_id"

    aput-object v2, v1, v4

    sput-object v1, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->CONTACTS_PROJECTION:[Ljava/lang/String;

    .line 379
    new-array v1, v8, [Ljava/lang/String;

    const-string v2, "number"

    aput-object v2, v1, v4

    const-string v2, "date"

    aput-object v2, v1, v5

    const-string v2, "type"

    aput-object v2, v1, v6

    const-string v2, "name"

    aput-object v2, v1, v7

    const/4 v2, 0x4

    const-string v3, "numbertype"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "numberlabel"

    aput-object v3, v1, v2

    sput-object v1, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->CALL_LOG_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 6
    .parameter "context"

    .prologue
    const/4 v3, 0x1

    .line 398
    const/high16 v2, -0x4000

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v5, v3

    invoke-direct/range {v0 .. v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;-><init>(Landroid/content/Context;IZZZ)V

    .line 399
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IZ)V
    .locals 6
    .parameter "context"
    .parameter "vcardType"
    .parameter "careHandlerErrors"

    .prologue
    .line 406
    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;-><init>(Landroid/content/Context;IZZZ)V

    .line 407
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IZZZ)V
    .locals 3
    .parameter "context"
    .parameter "vcardType"
    .parameter "careHandlerErrors"
    .parameter "isCallLogComposer"
    .parameter "needPhotoInVCard"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 415
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 353
    const-string v0, "No error"

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mErrorReason:Ljava/lang/String;

    .line 368
    iput-boolean v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsCallLogComposer:Z

    .line 370
    iput-boolean v2, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mNeedPhotoForVCard:Z

    .line 372
    iput-boolean v2, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsePbapNameImprove:Z

    .line 2202
    iput v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mOffset:I

    .line 2204
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mMaxCount:I

    .line 2206
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mFilter:J

    .line 416
    iput-object p1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mContext:Landroid/content/Context;

    .line 417
    iput p2, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardType:I

    .line 418
    iput-boolean p3, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCareHandlerErrors:Z

    .line 419
    iput-boolean p4, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsCallLogComposer:Z

    .line 420
    iput-boolean p5, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mNeedPhotoForVCard:Z

    .line 421
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mContentResolver:Landroid/content/ContentResolver;

    .line 423
    invoke-static {p2}, Lcom/android/bluetooth/pbap/VCardConfig;->isV30(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsV30:Z

    .line 424
    invoke-static {p2}, Lcom/android/bluetooth/pbap/VCardConfig;->usesQuotedPrintable(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesQuotedPrintable:Z

    .line 425
    invoke-static {p2}, Lcom/android/bluetooth/pbap/VCardConfig;->isDoCoMo(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsDoCoMo:Z

    .line 426
    invoke-static {p2}, Lcom/android/bluetooth/pbap/VCardConfig;->needsToConvertPhoneticString(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsJapaneseMobilePhone:Z

    .line 427
    invoke-static {p2}, Lcom/android/bluetooth/pbap/VCardConfig;->onlyOneNoteFieldIsAvailable(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mOnlyOneNoteFieldIsAvailable:Z

    .line 428
    invoke-static {p2}, Lcom/android/bluetooth/pbap/VCardConfig;->usesAndroidSpecificProperty(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesAndroidProperty:Z

    .line 429
    invoke-static {p2}, Lcom/android/bluetooth/pbap/VCardConfig;->usesDefactProperty(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesDefactProperty:Z

    .line 430
    invoke-static {p2}, Lcom/android/bluetooth/pbap/VCardConfig;->usesUtf8(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesUtf8:Z

    .line 431
    invoke-static {p2}, Lcom/android/bluetooth/pbap/VCardConfig;->usesShiftJis(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesShiftJis:Z

    .line 432
    invoke-static {p2}, Lcom/android/bluetooth/pbap/VCardConfig;->usesQPToPrimaryProperties(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesQPToPrimaryProperties:Z

    .line 433
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mHandlerList:Ljava/util/List;

    .line 435
    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsDoCoMo:Z

    if-eqz v0, :cond_0

    .line 436
    const-string v0, "SHIFT_JIS"

    const-string v1, "docomo"

    invoke-static {v0, v1}, Landroid/util/CharsetUtils;->charsetForVendor(Ljava/lang/String;Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCharsetString:Ljava/lang/String;

    .line 442
    const-string v0, "CHARSET=SHIFT_JIS"

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardAttributeCharset:Ljava/lang/String;

    .line 450
    :goto_0
    return-void

    .line 443
    :cond_0
    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesShiftJis:Z

    if-eqz v0, :cond_1

    .line 444
    const-string v0, "SHIFT_JIS"

    invoke-static {v0}, Landroid/util/CharsetUtils;->charsetForVendor(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCharsetString:Ljava/lang/String;

    .line 445
    const-string v0, "CHARSET=SHIFT_JIS"

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardAttributeCharset:Ljava/lang/String;

    goto :goto_0

    .line 447
    :cond_1
    const-string v0, "UTF-8"

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCharsetString:Ljava/lang/String;

    .line 448
    const-string v0, "CHARSET=UTF-8"

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardAttributeCharset:Ljava/lang/String;

    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 6
    .parameter "context"
    .parameter "vcardTypeStr"
    .parameter "careHandlerErrors"

    .prologue
    .line 402
    invoke-static {p2}, Lcom/android/bluetooth/pbap/VCardConfig;->getVCardTypeFromString(Ljava/lang/String;)I

    move-result v2

    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;-><init>(Landroid/content/Context;IZZZ)V

    .line 403
    return-void
.end method

.method static synthetic access$000(Lcom/android/bluetooth/pbap/BluetoothVCardComposer;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 102
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCharsetString:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$102(Lcom/android/bluetooth/pbap/BluetoothVCardComposer;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 102
    iput-object p1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mErrorReason:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/android/bluetooth/pbap/BluetoothVCardComposer;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 102
    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsDoCoMo:Z

    return v0
.end method

.method static synthetic access$300(Lcom/android/bluetooth/pbap/BluetoothVCardComposer;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 102
    invoke-direct {p0, p1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->createOneEntryInternal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private appendBirthday(Ljava/lang/StringBuilder;Ljava/util/Map;)V
    .locals 6
    .parameter "builder"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .local p2, contentValuesListMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Landroid/content/ContentValues;>;>;"
    const/4 v5, 0x0

    .line 1480
    const-string v3, "vnd.android.cursor.item/contact_event"

    invoke-interface {p2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 1481
    .local v1, contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 1482
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/ContentValues;

    const-string v4, "data2"

    invoke-virtual {v3, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    .line 1483
    .local v2, eventType:Ljava/lang/Integer;
    if-eqz v2, :cond_0

    const/4 v3, 0x3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1498
    .end local v2           #eventType:Ljava/lang/Integer;
    :cond_0
    :goto_0
    return-void

    .line 1490
    .restart local v2       #eventType:Ljava/lang/Integer;
    :cond_1
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/ContentValues;

    const-string v4, "data1"

    invoke-virtual {v3, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1491
    .local v0, birthday:Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 1492
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 1494
    :cond_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1495
    const-string v3, "BDAY"

    invoke-direct {p0, p1, v3, v0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private appendEmails(Ljava/lang/StringBuilder;Ljava/util/Map;)V
    .locals 12
    .parameter "builder"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 1352
    .local p2, contentValuesListMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Landroid/content/ContentValues;>;>;"
    const-string v9, "vnd.android.cursor.item/email_v2"

    invoke-interface {p2, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 1353
    .local v2, contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    const/4 v4, 0x0

    .line 1354
    .local v4, emailAddressExists:Z
    if-eqz v2, :cond_3

    .line 1355
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 1356
    .local v0, addressSet:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ContentValues;

    .line 1357
    .local v1, contentValues:Landroid/content/ContentValues;
    const-string v9, "data2"

    invoke-virtual {v1, v9}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    .line 1358
    .local v8, typeAsObject:Ljava/lang/Integer;
    if-eqz v8, :cond_2

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 1359
    .local v7, type:I
    :goto_1
    const-string v9, "data3"

    invoke-virtual {v1, v9}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1360
    .local v6, label:Ljava/lang/String;
    const-string v9, "data1"

    invoke-virtual {v1, v9}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1361
    .local v3, emailAddress:Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 1362
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 1364
    :cond_1
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 1367
    const/4 v4, 0x1

    .line 1368
    invoke-interface {v0, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 1369
    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1370
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-direct {p0, p1, v9, v6, v3}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardEmailLine(Ljava/lang/StringBuilder;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1358
    .end local v3           #emailAddress:Ljava/lang/String;
    .end local v6           #label:Ljava/lang/String;
    .end local v7           #type:I
    :cond_2
    const/4 v7, 0x3

    goto :goto_1

    .line 1375
    .end local v0           #addressSet:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    .end local v1           #contentValues:Landroid/content/ContentValues;
    .end local v5           #i$:Ljava/util/Iterator;
    .end local v8           #typeAsObject:Ljava/lang/Integer;
    :cond_3
    if-nez v4, :cond_4

    iget-boolean v9, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsDoCoMo:Z

    if-eqz v9, :cond_4

    .line 1376
    const/4 v9, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, ""

    const-string v11, ""

    invoke-direct {p0, p1, v9, v10, v11}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardEmailLine(Ljava/lang/StringBuilder;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    .line 1378
    :cond_4
    return-void
.end method

.method private appendIms(Ljava/lang/StringBuilder;Ljava/util/Map;)V
    .locals 7
    .parameter "builder"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 1442
    .local p2, contentValuesListMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Landroid/content/ContentValues;>;>;"
    const-string v5, "vnd.android.cursor.item/im"

    invoke-interface {p2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 1443
    .local v1, contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    if-eqz v1, :cond_1

    .line 1444
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentValues;

    .line 1445
    .local v0, contentValues:Landroid/content/ContentValues;
    const-string v5, "data5"

    invoke-virtual {v0, v5}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    .line 1446
    .local v4, protocol:Ljava/lang/Integer;
    const-string v5, "data1"

    invoke-virtual {v0, v5}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1447
    .local v2, data:Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 1448
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 1449
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 1453
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v6, 0x5

    if-ne v5, v6, :cond_0

    .line 1454
    iget v5, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardType:I

    invoke-static {v5}, Lcom/android/bluetooth/pbap/VCardConfig;->usesAndroidSpecificProperty(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1455
    const-string v5, "X-GOOGLE-TALK"

    invoke-direct {p0, p1, v5, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1462
    .end local v0           #contentValues:Landroid/content/ContentValues;
    .end local v2           #data:Ljava/lang/String;
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v4           #protocol:Ljava/lang/Integer;
    :cond_1
    return-void
.end method

.method private appendNickNames(Ljava/lang/StringBuilder;Ljava/util/Map;)V
    .locals 8
    .parameter "builder"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 1222
    .local p2, contentValuesListMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Landroid/content/ContentValues;>;>;"
    const-string v7, "vnd.android.cursor.item/nickname"

    invoke-interface {p2, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 1223
    .local v1, contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    if-eqz v1, :cond_6

    .line 1225
    iget-boolean v7, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsV30:Z

    if-eqz v7, :cond_3

    .line 1226
    const-string v5, "NICKNAME"

    .line 1234
    .local v5, propertyNickname:Ljava/lang/String;
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentValues;

    .line 1235
    .local v0, contentValues:Landroid/content/ContentValues;
    const-string v7, "data1"

    invoke-virtual {v0, v7}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1236
    .local v4, nickname:Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 1241
    iget-boolean v7, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesQuotedPrintable:Z

    if-eqz v7, :cond_4

    invoke-static {v4}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_4

    const/4 v6, 0x1

    .line 1243
    .local v6, reallyUseQuotedPrintable:Z
    :goto_2
    if-eqz v6, :cond_5

    .line 1244
    invoke-direct {p0, v4}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->encodeQuotedPrintable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1249
    .local v2, encodedNickname:Ljava/lang/String;
    :goto_3
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1250
    invoke-direct {p0, v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->shouldAppendCharsetAttribute(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1251
    const-string v7, ";"

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1252
    iget-object v7, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardAttributeCharset:Ljava/lang/String;

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1254
    :cond_1
    if-eqz v6, :cond_2

    .line 1255
    const-string v7, ";"

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1256
    const-string v7, "ENCODING=QUOTED-PRINTABLE"

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1258
    :cond_2
    const-string v7, ":"

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1259
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1260
    const-string v7, "\r\n"

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1227
    .end local v0           #contentValues:Landroid/content/ContentValues;
    .end local v2           #encodedNickname:Ljava/lang/String;
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v4           #nickname:Ljava/lang/String;
    .end local v5           #propertyNickname:Ljava/lang/String;
    .end local v6           #reallyUseQuotedPrintable:Z
    :cond_3
    iget-boolean v7, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesAndroidProperty:Z

    if-eqz v7, :cond_6

    .line 1228
    const-string v5, "X-NICKNAME"

    .restart local v5       #propertyNickname:Ljava/lang/String;
    goto :goto_0

    .line 1241
    .restart local v0       #contentValues:Landroid/content/ContentValues;
    .restart local v3       #i$:Ljava/util/Iterator;
    .restart local v4       #nickname:Ljava/lang/String;
    :cond_4
    const/4 v6, 0x0

    goto :goto_2

    .line 1246
    .restart local v6       #reallyUseQuotedPrintable:Z
    :cond_5
    invoke-direct {p0, v4}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->escapeCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .restart local v2       #encodedNickname:Ljava/lang/String;
    goto :goto_3

    .line 1263
    .end local v0           #contentValues:Landroid/content/ContentValues;
    .end local v2           #encodedNickname:Ljava/lang/String;
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v4           #nickname:Ljava/lang/String;
    .end local v5           #propertyNickname:Ljava/lang/String;
    .end local v6           #reallyUseQuotedPrintable:Z
    :cond_6
    return-void
.end method

.method private appendNotes(Ljava/lang/StringBuilder;Ljava/util/Map;)V
    .locals 12
    .parameter "builder"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 1568
    .local p2, contentValuesListMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Landroid/content/ContentValues;>;>;"
    const-string v0, "vnd.android.cursor.item/note"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 1569
    .local v7, contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    if-eqz v7, :cond_4

    .line 1570
    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mOnlyOneNoteFieldIsAvailable:Z

    if-eqz v0, :cond_7

    .line 1571
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 1572
    .local v11, noteBuilder:Ljava/lang/StringBuilder;
    const/4 v8, 0x1

    .line 1573
    .local v8, first:Z
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/ContentValues;

    .line 1574
    .local v6, contentValues:Landroid/content/ContentValues;
    const-string v0, "data1"

    invoke-virtual {v6, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 1575
    .local v10, note:Ljava/lang/String;
    if-nez v10, :cond_1

    .line 1576
    const-string v10, ""

    .line 1578
    :cond_1
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 1579
    if-eqz v8, :cond_2

    .line 1580
    const/4 v8, 0x0

    .line 1584
    :goto_1
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 1582
    :cond_2
    const/16 v0, 0xa

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1587
    .end local v6           #contentValues:Landroid/content/ContentValues;
    .end local v10           #note:Ljava/lang/String;
    :cond_3
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1591
    .local v3, noteStr:Ljava/lang/String;
    invoke-static {v3}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyPrintableAscii(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    const/4 v4, 0x1

    .line 1592
    .local v4, shouldAppendCharsetInfo:Z
    :goto_2
    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesQuotedPrintable:Z

    if-eqz v0, :cond_6

    invoke-static {v3}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_6

    const/4 v5, 0x1

    .line 1594
    .local v5, reallyUseQuotedPrintable:Z
    :goto_3
    const-string v2, "NOTE"

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 1608
    .end local v3           #noteStr:Ljava/lang/String;
    .end local v4           #shouldAppendCharsetInfo:Z
    .end local v5           #reallyUseQuotedPrintable:Z
    .end local v8           #first:Z
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v11           #noteBuilder:Ljava/lang/StringBuilder;
    :cond_4
    return-void

    .line 1591
    .restart local v3       #noteStr:Ljava/lang/String;
    .restart local v8       #first:Z
    .restart local v9       #i$:Ljava/util/Iterator;
    .restart local v11       #noteBuilder:Ljava/lang/StringBuilder;
    :cond_5
    const/4 v4, 0x0

    goto :goto_2

    .line 1592
    .restart local v4       #shouldAppendCharsetInfo:Z
    :cond_6
    const/4 v5, 0x0

    goto :goto_3

    .line 1596
    .end local v3           #noteStr:Ljava/lang/String;
    .end local v4           #shouldAppendCharsetInfo:Z
    .end local v8           #first:Z
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v11           #noteBuilder:Ljava/lang/StringBuilder;
    :cond_7
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .restart local v9       #i$:Ljava/util/Iterator;
    :cond_8
    :goto_4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/ContentValues;

    .line 1597
    .restart local v6       #contentValues:Landroid/content/ContentValues;
    const-string v0, "data1"

    invoke-virtual {v6, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1598
    .restart local v3       #noteStr:Ljava/lang/String;
    if-eqz v3, :cond_8

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 1599
    invoke-static {v3}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyPrintableAscii(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_9

    const/4 v4, 0x1

    .line 1600
    .restart local v4       #shouldAppendCharsetInfo:Z
    :goto_5
    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesQuotedPrintable:Z

    if-eqz v0, :cond_a

    invoke-static {v3}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_a

    const/4 v5, 0x1

    .line 1602
    .restart local v5       #reallyUseQuotedPrintable:Z
    :goto_6
    const-string v2, "NOTE"

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;ZZ)V

    goto :goto_4

    .line 1599
    .end local v4           #shouldAppendCharsetInfo:Z
    .end local v5           #reallyUseQuotedPrintable:Z
    :cond_9
    const/4 v4, 0x0

    goto :goto_5

    .line 1600
    .restart local v4       #shouldAppendCharsetInfo:Z
    :cond_a
    const/4 v5, 0x0

    goto :goto_6
.end method

.method private appendOrganizations(Ljava/lang/StringBuilder;Ljava/util/Map;)V
    .locals 11
    .parameter "builder"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .local p2, contentValuesListMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Landroid/content/ContentValues;>;>;"
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 1502
    const-string v0, "vnd.android.cursor.item/organization"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 1503
    .local v7, contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    if-eqz v7, :cond_4

    .line 1504
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/ContentValues;

    .line 1505
    .local v6, contentValues:Landroid/content/ContentValues;
    const-string v0, "data1"

    invoke-virtual {v6, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1506
    .local v3, company:Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 1507
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 1516
    :cond_1
    if-eqz v3, :cond_0

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1517
    const-string v2, "ORG"

    invoke-static {v3}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyPrintableAscii(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    move v4, v9

    :goto_1
    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesQuotedPrintable:Z

    if-eqz v0, :cond_3

    invoke-static {v3}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    move v5, v9

    :goto_2
    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;ZZ)V

    goto :goto_0

    :cond_2
    move v4, v10

    goto :goto_1

    :cond_3
    move v5, v10

    goto :goto_2

    .line 1529
    .end local v3           #company:Ljava/lang/String;
    .end local v6           #contentValues:Landroid/content/ContentValues;
    .end local v8           #i$:Ljava/util/Iterator;
    :cond_4
    return-void
.end method

.method private appendPhones(Ljava/lang/StringBuilder;Ljava/util/Map;)V
    .locals 23
    .parameter "builder"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 1266
    .local p2, contentValuesListMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Landroid/content/ContentValues;>;>;"
    const-string v20, "vnd.android.cursor.item/phone_v2"

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 1267
    .local v7, contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    const/4 v13, 0x0

    .line 1268
    .local v13, phoneLineExists:Z
    if-eqz v7, :cond_5

    .line 1269
    new-instance v16, Ljava/util/HashSet;

    invoke-direct/range {v16 .. v16}, Ljava/util/HashSet;-><init>()V

    .line 1270
    .local v16, phoneSet:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_0
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_5

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/ContentValues;

    .line 1271
    .local v6, contentValues:Landroid/content/ContentValues;
    const-string v20, "data2"

    move-object/from16 v0, v20

    invoke-virtual {v6, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v19

    .line 1272
    .local v19, typeAsObject:Ljava/lang/Integer;
    const-string v20, "data3"

    move-object/from16 v0, v20

    invoke-virtual {v6, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 1273
    .local v12, label:Ljava/lang/String;
    const-string v20, "data1"

    move-object/from16 v0, v20

    invoke-virtual {v6, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 1274
    .local v14, phoneNumber:Ljava/lang/String;
    if-eqz v14, :cond_1

    .line 1275
    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    .line 1277
    :cond_1
    if-eqz v14, :cond_0

    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v20

    if-nez v20, :cond_0

    .line 1280
    if-eqz v19, :cond_2

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v18

    .line 1282
    .local v18, type:I
    :goto_1
    const/4 v13, 0x1

    .line 1283
    const/16 v20, 0x6

    move/from16 v0, v18

    move/from16 v1, v20

    if-ne v0, v1, :cond_3

    .line 1284
    const/4 v13, 0x1

    .line 1285
    move-object/from16 v0, v16

    invoke-interface {v0, v14}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_0

    .line 1286
    move-object/from16 v0, v16

    invoke-interface {v0, v14}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1287
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2, v12, v14}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardTelephoneLine(Ljava/lang/StringBuilder;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1280
    .end local v18           #type:I
    :cond_2
    const/16 v18, 0x1

    goto :goto_1

    .line 1299
    .restart local v18       #type:I
    :cond_3
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->splitIfSeveralPhoneNumbersExist(Ljava/lang/String;)Ljava/util/List;

    move-result-object v15

    .line 1300
    .local v15, phoneNumberList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v15}, Ljava/util/List;->isEmpty()Z

    move-result v20

    if-nez v20, :cond_0

    .line 1303
    const/4 v13, 0x1

    .line 1304
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, i$:Ljava/util/Iterator;
    :cond_4
    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_0

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 1305
    .local v5, actualPhoneNumber:Ljava/lang/String;
    move-object/from16 v0, v16

    invoke-interface {v0, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_4

    .line 1306
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardType:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/android/bluetooth/pbap/VCardUtils;->getPhoneNumberFormat(I)I

    move-result v8

    .line 1307
    .local v8, format:I
    new-instance v17, Landroid/text/SpannableStringBuilder;

    move-object/from16 v0, v17

    invoke-direct {v0, v5}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1308
    .local v17, tmpBuilder:Landroid/text/SpannableStringBuilder;
    move-object/from16 v0, v17

    invoke-static {v0, v8}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Landroid/text/Editable;I)V

    .line 1309
    invoke-virtual/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 1310
    .local v9, formattedPhoneNumber:Ljava/lang/String;
    move-object/from16 v0, v16

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1311
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2, v12, v9}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardTelephoneLine(Ljava/lang/StringBuilder;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 1318
    .end local v5           #actualPhoneNumber:Ljava/lang/String;
    .end local v6           #contentValues:Landroid/content/ContentValues;
    .end local v8           #format:I
    .end local v9           #formattedPhoneNumber:Ljava/lang/String;
    .end local v11           #i$:Ljava/util/Iterator;
    .end local v12           #label:Ljava/lang/String;
    .end local v14           #phoneNumber:Ljava/lang/String;
    .end local v15           #phoneNumberList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .end local v16           #phoneSet:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    .end local v17           #tmpBuilder:Landroid/text/SpannableStringBuilder;
    .end local v18           #type:I
    .end local v19           #typeAsObject:Ljava/lang/Integer;
    :cond_5
    if-nez v13, :cond_6

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsDoCoMo:Z

    move/from16 v20, v0

    if-eqz v20, :cond_6

    .line 1319
    const/16 v20, 0x1

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    const-string v21, ""

    const-string v22, ""

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v20

    move-object/from16 v3, v21

    move-object/from16 v4, v22

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardTelephoneLine(Ljava/lang/StringBuilder;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    .line 1321
    :cond_6
    return-void
.end method

.method private appendPhotos(Ljava/lang/StringBuilder;Ljava/util/Map;)V
    .locals 13
    .parameter "builder"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .local p2, contentValuesListMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Landroid/content/ContentValues;>;>;"
    const/16 v12, 0x47

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 1532
    const-string v6, "vnd.android.cursor.item/photo"

    invoke-interface {p2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 1533
    .local v1, contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    if-eqz v1, :cond_4

    .line 1534
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentValues;

    .line 1535
    .local v0, contentValues:Landroid/content/ContentValues;
    const-string v6, "data15"

    invoke-virtual {v0, v6}, Landroid/content/ContentValues;->getAsByteArray(Ljava/lang/String;)[B

    move-result-object v2

    .line 1536
    .local v2, data:[B
    if-eqz v2, :cond_0

    .line 1543
    array-length v6, v2

    if-lt v6, v11, :cond_1

    aget-byte v6, v2, v8

    if-ne v6, v12, :cond_1

    aget-byte v6, v2, v9

    const/16 v7, 0x49

    if-ne v6, v7, :cond_1

    aget-byte v6, v2, v10

    const/16 v7, 0x46

    if-ne v6, v7, :cond_1

    .line 1544
    const-string v5, "GIF"

    .line 1559
    .local v5, photoType:Ljava/lang/String;
    :goto_1
    invoke-static {v2}, Lcom/android/bluetooth/pbap/VCardUtils;->encodeBase64([B)Ljava/lang/String;

    move-result-object v4

    .line 1560
    .local v4, photoString:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_0

    .line 1561
    invoke-direct {p0, p1, v4, v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardPhotoLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1545
    .end local v4           #photoString:Ljava/lang/String;
    .end local v5           #photoType:Ljava/lang/String;
    :cond_1
    array-length v6, v2

    const/4 v7, 0x4

    if-lt v6, v7, :cond_2

    aget-byte v6, v2, v8

    const/16 v7, -0x77

    if-ne v6, v7, :cond_2

    aget-byte v6, v2, v9

    const/16 v7, 0x50

    if-ne v6, v7, :cond_2

    aget-byte v6, v2, v10

    const/16 v7, 0x4e

    if-ne v6, v7, :cond_2

    aget-byte v6, v2, v11

    if-ne v6, v12, :cond_2

    .line 1552
    const-string v5, "PNG"

    .restart local v5       #photoType:Ljava/lang/String;
    goto :goto_1

    .line 1553
    .end local v5           #photoType:Ljava/lang/String;
    :cond_2
    array-length v6, v2

    if-lt v6, v10, :cond_3

    aget-byte v6, v2, v8

    const/4 v7, -0x1

    if-ne v6, v7, :cond_3

    aget-byte v6, v2, v9

    const/16 v7, -0x28

    if-ne v6, v7, :cond_3

    .line 1554
    const-string v5, "JPEG"

    .restart local v5       #photoType:Ljava/lang/String;
    goto :goto_1

    .line 1556
    .end local v5           #photoType:Ljava/lang/String;
    :cond_3
    const-string v6, "BluetoothVCardComposer"

    const-string v7, "Unknown photo type. Ignore."

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1565
    .end local v0           #contentValues:Landroid/content/ContentValues;
    .end local v2           #data:[B
    .end local v3           #i$:Ljava/util/Iterator;
    :cond_4
    return-void
.end method

.method private appendPostals(Ljava/lang/StringBuilder;Ljava/util/Map;)V
    .locals 2
    .parameter "builder"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 1381
    .local p2, contentValuesListMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Landroid/content/ContentValues;>;>;"
    const-string v1, "vnd.android.cursor.item/postal-address_v2"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1382
    .local v0, contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    if-eqz v0, :cond_2

    .line 1383
    iget-boolean v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsDoCoMo:Z

    if-eqz v1, :cond_1

    .line 1384
    invoke-direct {p0, p1, v0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendPostalsForDoCoMo(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 1395
    :cond_0
    :goto_0
    return-void

    .line 1386
    :cond_1
    invoke-direct {p0, p1, v0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendPostalsForGeneric(Ljava/lang/StringBuilder;Ljava/util/List;)V

    goto :goto_0

    .line 1388
    :cond_2
    iget-boolean v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsDoCoMo:Z

    if-eqz v1, :cond_0

    .line 1389
    const-string v1, "ADR"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1390
    const-string v1, ";"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1391
    const-string v1, "HOME"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1392
    const-string v1, ":"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1393
    const-string v1, "\r\n"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method private appendPostalsForDoCoMo(Ljava/lang/StringBuilder;Ljava/util/List;)V
    .locals 2
    .parameter "builder"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1402
    .local p2, contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendPostalsForDoCoMoInternal(Ljava/lang/StringBuilder;Ljava/util/List;Ljava/lang/Integer;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1416
    :cond_0
    :goto_0
    return-void

    .line 1405
    :cond_1
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendPostalsForDoCoMoInternal(Ljava/lang/StringBuilder;Ljava/util/List;Ljava/lang/Integer;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1408
    const/4 v0, 0x3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendPostalsForDoCoMoInternal(Ljava/lang/StringBuilder;Ljava/util/List;Ljava/lang/Integer;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1411
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendPostalsForDoCoMoInternal(Ljava/lang/StringBuilder;Ljava/util/List;Ljava/lang/Integer;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1415
    const-string v0, "BluetoothVCardComposer"

    const-string v1, "Should not come here. Must have at least one postal data."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private appendPostalsForDoCoMoInternal(Ljava/lang/StringBuilder;Ljava/util/List;Ljava/lang/Integer;)Z
    .locals 5
    .parameter "builder"
    .parameter
    .parameter "preferedType"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;",
            "Ljava/lang/Integer;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 1420
    .local p2, contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentValues;

    .line 1421
    .local v0, contentValues:Landroid/content/ContentValues;
    const-string v4, "data2"

    invoke-virtual {v0, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    .line 1422
    .local v3, type:Ljava/lang/Integer;
    const-string v4, "data3"

    invoke-virtual {v0, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1423
    .local v2, label:Ljava/lang/String;
    if-ne v3, p3, :cond_0

    .line 1424
    invoke-direct {p0, p1, v3, v2, v0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardPostalLine(Ljava/lang/StringBuilder;Ljava/lang/Integer;Ljava/lang/String;Landroid/content/ContentValues;)V

    .line 1425
    const/4 v4, 0x1

    .line 1428
    .end local v0           #contentValues:Landroid/content/ContentValues;
    .end local v2           #label:Ljava/lang/String;
    .end local v3           #type:Ljava/lang/Integer;
    :goto_0
    return v4

    :cond_1
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private appendPostalsForGeneric(Ljava/lang/StringBuilder;Ljava/util/List;)V
    .locals 5
    .parameter "builder"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1432
    .local p2, contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentValues;

    .line 1433
    .local v0, contentValues:Landroid/content/ContentValues;
    const-string v4, "data2"

    invoke-virtual {v0, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    .line 1434
    .local v3, type:Ljava/lang/Integer;
    const-string v4, "data3"

    invoke-virtual {v0, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1435
    .local v2, label:Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 1436
    invoke-direct {p0, p1, v3, v2, v0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardPostalLine(Ljava/lang/StringBuilder;Ljava/lang/Integer;Ljava/lang/String;Landroid/content/ContentValues;)V

    goto :goto_0

    .line 1439
    .end local v0           #contentValues:Landroid/content/ContentValues;
    .end local v2           #label:Ljava/lang/String;
    .end local v3           #type:Ljava/lang/Integer;
    :cond_1
    return-void
.end method

.method private appendStructuredNames(Ljava/lang/StringBuilder;Ljava/util/Map;)V
    .locals 3
    .parameter "builder"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 845
    .local p2, contentValuesListMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Landroid/content/ContentValues;>;>;"
    const-string v1, "vnd.android.cursor.item/name"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 846
    .local v0, contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 847
    invoke-direct {p0, p1, v0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendStructuredNamesInternal(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 859
    :goto_0
    return-void

    .line 848
    :cond_0
    iget-boolean v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsDoCoMo:Z

    if-eqz v1, :cond_1

    .line 849
    const-string v1, "N"

    const-string v2, ""

    invoke-direct {p0, p1, v1, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 850
    :cond_1
    iget-boolean v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsV30:Z

    if-eqz v1, :cond_2

    .line 852
    const-string v1, "N"

    const-string v2, ""

    invoke-direct {p0, p1, v1, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 853
    const-string v1, "FN"

    const-string v2, ""

    invoke-direct {p0, p1, v1, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 856
    :cond_2
    const-string v1, "N"

    const-string v2, ""

    invoke-direct {p0, p1, v1, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private appendStructuredNamesInternal(Ljava/lang/StringBuilder;Ljava/util/List;)V
    .locals 37
    .parameter "builder"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 878
    .local p2, contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    const/16 v28, 0x0

    .line 879
    .local v28, primaryContentValues:Landroid/content/ContentValues;
    const/16 v34, 0x0

    .line 880
    .local v34, subprimaryContentValues:Landroid/content/ContentValues;
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v20

    .local v20, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/content/ContentValues;

    .line 881
    .local v9, contentValues:Landroid/content/ContentValues;
    if-eqz v9, :cond_0

    .line 884
    const-string v3, "is_super_primary"

    invoke-virtual {v9, v3}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v22

    .line 885
    .local v22, isSuperPrimary:Ljava/lang/Integer;
    if-eqz v22, :cond_17

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-lez v3, :cond_17

    .line 887
    move-object/from16 v28, v9

    .line 904
    .end local v9           #contentValues:Landroid/content/ContentValues;
    .end local v22           #isSuperPrimary:Ljava/lang/Integer;
    :cond_1
    if-nez v28, :cond_2

    .line 905
    if-eqz v34, :cond_19

    .line 908
    move-object/from16 v28, v34

    .line 915
    :cond_2
    :goto_1
    const-string v3, "data3"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 916
    .local v17, familyName:Ljava/lang/String;
    const-string v3, "data5"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    .line 917
    .local v23, middleName:Ljava/lang/String;
    const-string v3, "data2"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 918
    .local v19, givenName:Ljava/lang/String;
    const-string v3, "data4"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 919
    .local v27, prefix:Ljava/lang/String;
    const-string v3, "data6"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v35

    .line 920
    .local v35, suffix:Ljava/lang/String;
    const-string v3, "data1"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 922
    .local v10, displayName:Ljava/lang/String;
    invoke-static/range {v17 .. v17}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_23

    .line 929
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesQPToPrimaryProperties:Z

    if-eqz v3, :cond_1a

    invoke-static/range {v17 .. v17}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-static/range {v19 .. v19}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-static/range {v23 .. v23}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-static/range {v27 .. v27}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-static/range {v35 .. v35}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1a

    :cond_4
    const/16 v32, 0x1

    .line 936
    .local v32, reallyUseQuotedPrintableToName:Z
    :goto_2
    if-eqz v32, :cond_1b

    .line 937
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->encodeQuotedPrintable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 938
    .local v4, encodedFamily:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->encodeQuotedPrintable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 939
    .local v6, encodedGiven:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->encodeQuotedPrintable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 940
    .local v5, encodedMiddle:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->encodeQuotedPrintable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 941
    .local v7, encodedPrefix:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v35

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->encodeQuotedPrintable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 955
    .local v8, encodedSuffix:Ljava/lang/String;
    :goto_3
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsePbapNameImprove:Z

    if-eqz v3, :cond_1e

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1e

    .line 956
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesQPToPrimaryProperties:Z

    if-eqz v3, :cond_1c

    invoke-static {v10}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1c

    const/16 v30, 0x1

    .line 958
    .local v30, reallyUseQuotedPrintableToDisplayName:Z
    :goto_4
    if-eqz v30, :cond_1d

    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->encodeQuotedPrintable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 961
    .local v11, encodedDisplayName:Ljava/lang/String;
    :goto_5
    const-string v3, "N"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 962
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->shouldAppendCharsetAttribute(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 963
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 964
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardAttributeCharset:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 966
    :cond_5
    if-eqz v30, :cond_6

    .line 967
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 968
    const-string v3, "ENCODING=QUOTED-PRINTABLE"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 970
    :cond_6
    const-string v3, ":"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 971
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 972
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 973
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 974
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 975
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 976
    const-string v3, "\r\n"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1002
    .end local v11           #encodedDisplayName:Ljava/lang/String;
    .end local v30           #reallyUseQuotedPrintableToDisplayName:Z
    :goto_6
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardType:I

    invoke-static {v3}, Lcom/android/bluetooth/pbap/VCardConfig;->getNameOrderType(I)I

    move-result v3

    invoke-static/range {v3 .. v8}, Lcom/android/bluetooth/pbap/VCardUtils;->constructNameFromElements(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 1004
    .local v18, fullname:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesQPToPrimaryProperties:Z

    if-eqz v3, :cond_21

    invoke-static/range {v18 .. v18}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_21

    const/16 v31, 0x1

    .line 1007
    .local v31, reallyUseQuotedPrintableToFullname:Z
    :goto_7
    if-eqz v31, :cond_22

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->encodeQuotedPrintable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 1011
    .local v12, encodedFullname:Ljava/lang/String;
    :goto_8
    const-string v3, "FN"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1012
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->shouldAppendCharsetAttribute(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 1013
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1014
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardAttributeCharset:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1016
    :cond_7
    if-eqz v31, :cond_8

    .line 1017
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1018
    const-string v3, "ENCODING=QUOTED-PRINTABLE"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1020
    :cond_8
    const-string v3, ":"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1021
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1022
    const-string v3, "\r\n"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1069
    .end local v4           #encodedFamily:Ljava/lang/String;
    .end local v5           #encodedMiddle:Ljava/lang/String;
    .end local v6           #encodedGiven:Ljava/lang/String;
    .end local v7           #encodedPrefix:Ljava/lang/String;
    .end local v8           #encodedSuffix:Ljava/lang/String;
    .end local v12           #encodedFullname:Ljava/lang/String;
    .end local v18           #fullname:Ljava/lang/String;
    .end local v31           #reallyUseQuotedPrintableToFullname:Z
    .end local v32           #reallyUseQuotedPrintableToName:Z
    :cond_9
    :goto_9
    const-string v3, "data9"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 1070
    .local v24, phoneticFamilyName:Ljava/lang/String;
    const-string v3, "data8"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 1071
    .local v26, phoneticMiddleName:Ljava/lang/String;
    const-string v3, "data7"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 1072
    .local v25, phoneticGivenName:Ljava/lang/String;
    invoke-static/range {v24 .. v24}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-static/range {v26 .. v26}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-static/range {v25 .. v25}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_31

    .line 1074
    :cond_a
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsJapaneseMobilePhone:Z

    if-eqz v3, :cond_b

    .line 1075
    invoke-static/range {v24 .. v24}, Lcom/android/bluetooth/pbap/VCardUtils;->toHalfWidthString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 1076
    invoke-static/range {v26 .. v26}, Lcom/android/bluetooth/pbap/VCardUtils;->toHalfWidthString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 1077
    invoke-static/range {v25 .. v25}, Lcom/android/bluetooth/pbap/VCardUtils;->toHalfWidthString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 1080
    :cond_b
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsV30:Z

    if-eqz v3, :cond_2c

    .line 1081
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardType:I

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    move-object/from16 v2, v25

    invoke-static {v3, v0, v1, v2}, Lcom/android/bluetooth/pbap/VCardUtils;->constructNameFromElements(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    .line 1083
    .local v33, sortString:Ljava/lang/String;
    const-string v3, "SORT-STRING"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1087
    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->escapeCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 1088
    .local v16, encodedSortString:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->shouldAppendCharsetAttribute(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 1089
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1090
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardAttributeCharset:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1092
    :cond_c
    const-string v3, ":"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1093
    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1094
    const-string v3, "\r\n"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1151
    .end local v16           #encodedSortString:Ljava/lang/String;
    .end local v33           #sortString:Ljava/lang/String;
    :cond_d
    :goto_a
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesDefactProperty:Z

    if-eqz v3, :cond_16

    .line 1152
    invoke-static/range {v25 .. v25}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_10

    .line 1153
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesQPToPrimaryProperties:Z

    if-eqz v3, :cond_32

    invoke-static/range {v25 .. v25}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_32

    const/16 v29, 0x1

    .line 1156
    .local v29, reallyUseQuotedPrintable:Z
    :goto_b
    if-eqz v29, :cond_33

    .line 1157
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->encodeQuotedPrintable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 1161
    .local v14, encodedPhoneticGivenName:Ljava/lang/String;
    :goto_c
    const-string v3, "X-PHONETIC-FIRST-NAME"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1162
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->shouldAppendCharsetAttribute(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 1163
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1164
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardAttributeCharset:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1166
    :cond_e
    if-eqz v29, :cond_f

    .line 1167
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1168
    const-string v3, "ENCODING=QUOTED-PRINTABLE"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1170
    :cond_f
    const-string v3, ":"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1171
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1172
    const-string v3, "\r\n"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1174
    .end local v14           #encodedPhoneticGivenName:Ljava/lang/String;
    .end local v29           #reallyUseQuotedPrintable:Z
    :cond_10
    invoke-static/range {v26 .. v26}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_13

    .line 1175
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesQPToPrimaryProperties:Z

    if-eqz v3, :cond_34

    invoke-static/range {v26 .. v26}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_34

    const/16 v29, 0x1

    .line 1178
    .restart local v29       #reallyUseQuotedPrintable:Z
    :goto_d
    if-eqz v29, :cond_35

    .line 1179
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->encodeQuotedPrintable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 1183
    .local v15, encodedPhoneticMiddleName:Ljava/lang/String;
    :goto_e
    const-string v3, "X-PHONETIC-MIDDLE-NAME"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1184
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->shouldAppendCharsetAttribute(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 1185
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1186
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardAttributeCharset:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1188
    :cond_11
    if-eqz v29, :cond_12

    .line 1189
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1190
    const-string v3, "ENCODING=QUOTED-PRINTABLE"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1192
    :cond_12
    const-string v3, ":"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1193
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1194
    const-string v3, "\r\n"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1196
    .end local v15           #encodedPhoneticMiddleName:Ljava/lang/String;
    .end local v29           #reallyUseQuotedPrintable:Z
    :cond_13
    invoke-static/range {v24 .. v24}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_16

    .line 1197
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesQPToPrimaryProperties:Z

    if-eqz v3, :cond_36

    invoke-static/range {v24 .. v24}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_36

    const/16 v29, 0x1

    .line 1200
    .restart local v29       #reallyUseQuotedPrintable:Z
    :goto_f
    if-eqz v29, :cond_37

    .line 1201
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->encodeQuotedPrintable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1205
    .local v13, encodedPhoneticFamilyName:Ljava/lang/String;
    :goto_10
    const-string v3, "X-PHONETIC-LAST-NAME"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1206
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->shouldAppendCharsetAttribute(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 1207
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1208
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardAttributeCharset:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1210
    :cond_14
    if-eqz v29, :cond_15

    .line 1211
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1212
    const-string v3, "ENCODING=QUOTED-PRINTABLE"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1214
    :cond_15
    const-string v3, ":"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1215
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1216
    const-string v3, "\r\n"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1219
    .end local v13           #encodedPhoneticFamilyName:Ljava/lang/String;
    .end local v29           #reallyUseQuotedPrintable:Z
    :cond_16
    return-void

    .line 889
    .end local v10           #displayName:Ljava/lang/String;
    .end local v17           #familyName:Ljava/lang/String;
    .end local v19           #givenName:Ljava/lang/String;
    .end local v23           #middleName:Ljava/lang/String;
    .end local v24           #phoneticFamilyName:Ljava/lang/String;
    .end local v25           #phoneticGivenName:Ljava/lang/String;
    .end local v26           #phoneticMiddleName:Ljava/lang/String;
    .end local v27           #prefix:Ljava/lang/String;
    .end local v35           #suffix:Ljava/lang/String;
    .restart local v9       #contentValues:Landroid/content/ContentValues;
    .restart local v22       #isSuperPrimary:Ljava/lang/Integer;
    :cond_17
    if-nez v28, :cond_0

    .line 892
    const-string v3, "is_primary"

    invoke-virtual {v9, v3}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v21

    .line 893
    .local v21, isPrimary:Ljava/lang/Integer;
    if-eqz v21, :cond_18

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-lez v3, :cond_18

    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->containsNonEmptyName(Landroid/content/ContentValues;)Z

    move-result v3

    if-eqz v3, :cond_18

    .line 894
    move-object/from16 v28, v9

    goto/16 :goto_0

    .line 898
    :cond_18
    if-nez v34, :cond_0

    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->containsNonEmptyName(Landroid/content/ContentValues;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 899
    move-object/from16 v34, v9

    goto/16 :goto_0

    .line 910
    .end local v9           #contentValues:Landroid/content/ContentValues;
    .end local v21           #isPrimary:Ljava/lang/Integer;
    .end local v22           #isSuperPrimary:Ljava/lang/Integer;
    :cond_19
    const-string v3, "BluetoothVCardComposer"

    const-string v36, "All ContentValues given from database is empty."

    move-object/from16 v0, v36

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 911
    new-instance v28, Landroid/content/ContentValues;

    .end local v28           #primaryContentValues:Landroid/content/ContentValues;
    invoke-direct/range {v28 .. v28}, Landroid/content/ContentValues;-><init>()V

    .restart local v28       #primaryContentValues:Landroid/content/ContentValues;
    goto/16 :goto_1

    .line 929
    .restart local v10       #displayName:Ljava/lang/String;
    .restart local v17       #familyName:Ljava/lang/String;
    .restart local v19       #givenName:Ljava/lang/String;
    .restart local v23       #middleName:Ljava/lang/String;
    .restart local v27       #prefix:Ljava/lang/String;
    .restart local v35       #suffix:Ljava/lang/String;
    :cond_1a
    const/16 v32, 0x0

    goto/16 :goto_2

    .line 943
    .restart local v32       #reallyUseQuotedPrintableToName:Z
    :cond_1b
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->escapeCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 944
    .restart local v4       #encodedFamily:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->escapeCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 945
    .restart local v6       #encodedGiven:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->escapeCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 946
    .restart local v5       #encodedMiddle:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->escapeCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 947
    .restart local v7       #encodedPrefix:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v35

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->escapeCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .restart local v8       #encodedSuffix:Ljava/lang/String;
    goto/16 :goto_3

    .line 956
    :cond_1c
    const/16 v30, 0x0

    goto/16 :goto_4

    .line 958
    .restart local v30       #reallyUseQuotedPrintableToDisplayName:Z
    :cond_1d
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->escapeCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    goto/16 :goto_5

    .line 979
    .end local v30           #reallyUseQuotedPrintableToDisplayName:Z
    :cond_1e
    const-string v3, "N"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 980
    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/String;

    const/16 v36, 0x0

    aput-object v17, v3, v36

    const/16 v36, 0x1

    aput-object v19, v3, v36

    const/16 v36, 0x2

    aput-object v23, v3, v36

    const/16 v36, 0x3

    aput-object v27, v3, v36

    const/16 v36, 0x4

    aput-object v35, v3, v36

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->shouldAppendCharsetAttribute(Ljava/util/List;)Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 981
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 982
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardAttributeCharset:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 984
    :cond_1f
    if-eqz v32, :cond_20

    .line 985
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 986
    const-string v3, "ENCODING=QUOTED-PRINTABLE"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 989
    :cond_20
    const-string v3, ":"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 990
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 991
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 992
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 993
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 994
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 995
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 996
    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 997
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 998
    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 999
    const-string v3, "\r\n"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_6

    .line 1004
    .restart local v18       #fullname:Ljava/lang/String;
    :cond_21
    const/16 v31, 0x0

    goto/16 :goto_7

    .line 1007
    .restart local v31       #reallyUseQuotedPrintableToFullname:Z
    :cond_22
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->escapeCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    goto/16 :goto_8

    .line 1023
    .end local v4           #encodedFamily:Ljava/lang/String;
    .end local v5           #encodedMiddle:Ljava/lang/String;
    .end local v6           #encodedGiven:Ljava/lang/String;
    .end local v7           #encodedPrefix:Ljava/lang/String;
    .end local v8           #encodedSuffix:Ljava/lang/String;
    .end local v18           #fullname:Ljava/lang/String;
    .end local v31           #reallyUseQuotedPrintableToFullname:Z
    .end local v32           #reallyUseQuotedPrintableToName:Z
    :cond_23
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2a

    .line 1024
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesQPToPrimaryProperties:Z

    if-eqz v3, :cond_28

    invoke-static {v10}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_28

    const/16 v30, 0x1

    .line 1026
    .restart local v30       #reallyUseQuotedPrintableToDisplayName:Z
    :goto_11
    if-eqz v30, :cond_29

    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->encodeQuotedPrintable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1029
    .restart local v11       #encodedDisplayName:Ljava/lang/String;
    :goto_12
    const-string v3, "N"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1030
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->shouldAppendCharsetAttribute(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_24

    .line 1031
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1032
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardAttributeCharset:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1034
    :cond_24
    if-eqz v30, :cond_25

    .line 1035
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1036
    const-string v3, "ENCODING=QUOTED-PRINTABLE"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1038
    :cond_25
    const-string v3, ":"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1039
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1040
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1041
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1042
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1043
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1044
    const-string v3, "\r\n"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1047
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsV30:Z

    if-eqz v3, :cond_9

    .line 1048
    const-string v3, "FN"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1050
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->shouldAppendCharsetAttribute(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_26

    .line 1051
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1052
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardAttributeCharset:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1054
    :cond_26
    if-eqz v30, :cond_27

    .line 1055
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1056
    const-string v3, "ENCODING=QUOTED-PRINTABLE"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1058
    :cond_27
    const-string v3, ":"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1059
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1060
    const-string v3, "\r\n"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_9

    .line 1024
    .end local v11           #encodedDisplayName:Ljava/lang/String;
    .end local v30           #reallyUseQuotedPrintableToDisplayName:Z
    :cond_28
    const/16 v30, 0x0

    goto/16 :goto_11

    .line 1026
    .restart local v30       #reallyUseQuotedPrintableToDisplayName:Z
    :cond_29
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->escapeCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    goto/16 :goto_12

    .line 1062
    .end local v30           #reallyUseQuotedPrintableToDisplayName:Z
    :cond_2a
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsDoCoMo:Z

    if-eqz v3, :cond_2b

    .line 1063
    const-string v3, "N"

    const-string v36, ""

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v36

    invoke-direct {v0, v1, v3, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_9

    .line 1064
    :cond_2b
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsV30:Z

    if-eqz v3, :cond_9

    .line 1065
    const-string v3, "N"

    const-string v36, ""

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v36

    invoke-direct {v0, v1, v3, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 1066
    const-string v3, "FN"

    const-string v36, ""

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v36

    invoke-direct {v0, v1, v3, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_9

    .line 1102
    .restart local v24       #phoneticFamilyName:Ljava/lang/String;
    .restart local v25       #phoneticGivenName:Ljava/lang/String;
    .restart local v26       #phoneticMiddleName:Ljava/lang/String;
    :cond_2c
    const-string v3, "SOUND"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1103
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1104
    const-string v3, "X-IRMC-N"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1106
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesQPToPrimaryProperties:Z

    if-eqz v3, :cond_2f

    invoke-static/range {v24 .. v24}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2d

    invoke-static/range {v26 .. v26}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2d

    invoke-static/range {v25 .. v25}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2f

    :cond_2d
    const/16 v29, 0x1

    .line 1114
    .restart local v29       #reallyUseQuotedPrintable:Z
    :goto_13
    if-eqz v29, :cond_30

    .line 1115
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->encodeQuotedPrintable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1116
    .restart local v13       #encodedPhoneticFamilyName:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->encodeQuotedPrintable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 1117
    .restart local v15       #encodedPhoneticMiddleName:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->encodeQuotedPrintable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 1124
    .restart local v14       #encodedPhoneticGivenName:Ljava/lang/String;
    :goto_14
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/String;

    const/16 v36, 0x0

    aput-object v13, v3, v36

    const/16 v36, 0x1

    aput-object v15, v3, v36

    const/16 v36, 0x2

    aput-object v14, v3, v36

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->shouldAppendCharsetAttribute(Ljava/util/List;)Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 1126
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1127
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardAttributeCharset:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1129
    :cond_2e
    const-string v3, ":"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1130
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1131
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1132
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1133
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1134
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1135
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1136
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1137
    const-string v3, "\r\n"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_a

    .line 1106
    .end local v13           #encodedPhoneticFamilyName:Ljava/lang/String;
    .end local v14           #encodedPhoneticGivenName:Ljava/lang/String;
    .end local v15           #encodedPhoneticMiddleName:Ljava/lang/String;
    .end local v29           #reallyUseQuotedPrintable:Z
    :cond_2f
    const/16 v29, 0x0

    goto/16 :goto_13

    .line 1119
    .restart local v29       #reallyUseQuotedPrintable:Z
    :cond_30
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->escapeCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1120
    .restart local v13       #encodedPhoneticFamilyName:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->escapeCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 1121
    .restart local v15       #encodedPhoneticMiddleName:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->escapeCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .restart local v14       #encodedPhoneticGivenName:Ljava/lang/String;
    goto/16 :goto_14

    .line 1139
    .end local v13           #encodedPhoneticFamilyName:Ljava/lang/String;
    .end local v14           #encodedPhoneticGivenName:Ljava/lang/String;
    .end local v15           #encodedPhoneticMiddleName:Ljava/lang/String;
    .end local v29           #reallyUseQuotedPrintable:Z
    :cond_31
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsDoCoMo:Z

    if-eqz v3, :cond_d

    .line 1140
    const-string v3, "SOUND"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1141
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1142
    const-string v3, "X-IRMC-N"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1143
    const-string v3, ":"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1144
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1145
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1146
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1147
    const-string v3, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1148
    const-string v3, "\r\n"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_a

    .line 1153
    :cond_32
    const/16 v29, 0x0

    goto/16 :goto_b

    .line 1159
    .restart local v29       #reallyUseQuotedPrintable:Z
    :cond_33
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->escapeCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .restart local v14       #encodedPhoneticGivenName:Ljava/lang/String;
    goto/16 :goto_c

    .line 1175
    .end local v14           #encodedPhoneticGivenName:Ljava/lang/String;
    .end local v29           #reallyUseQuotedPrintable:Z
    :cond_34
    const/16 v29, 0x0

    goto/16 :goto_d

    .line 1181
    .restart local v29       #reallyUseQuotedPrintable:Z
    :cond_35
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->escapeCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .restart local v15       #encodedPhoneticMiddleName:Ljava/lang/String;
    goto/16 :goto_e

    .line 1197
    .end local v15           #encodedPhoneticMiddleName:Ljava/lang/String;
    .end local v29           #reallyUseQuotedPrintable:Z
    :cond_36
    const/16 v29, 0x0

    goto/16 :goto_f

    .line 1203
    .restart local v29       #reallyUseQuotedPrintable:Z
    :cond_37
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->escapeCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .restart local v13       #encodedPhoneticFamilyName:Ljava/lang/String;
    goto/16 :goto_10
.end method

.method private appendTitles(Ljava/lang/StringBuilder;Ljava/util/Map;)V
    .locals 11
    .parameter "builder"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .local p2, contentValuesListMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Landroid/content/ContentValues;>;>;"
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 2221
    const-string v0, "vnd.android.cursor.item/organization"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 2222
    .local v7, contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    if-eqz v7, :cond_3

    .line 2223
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/ContentValues;

    .line 2224
    .local v6, contentValues:Landroid/content/ContentValues;
    const-string v0, "data4"

    invoke-virtual {v6, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 2225
    .local v3, title:Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 2226
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 2227
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2228
    const-string v2, "TITLE"

    invoke-static {v3}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyPrintableAscii(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    move v4, v9

    :goto_1
    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesQuotedPrintable:Z

    if-eqz v0, :cond_2

    invoke-static {v3}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    move v5, v9

    :goto_2
    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;ZZ)V

    goto :goto_0

    :cond_1
    move v4, v10

    goto :goto_1

    :cond_2
    move v5, v10

    goto :goto_2

    .line 2234
    .end local v3           #title:Ljava/lang/String;
    .end local v6           #contentValues:Landroid/content/ContentValues;
    .end local v8           #i$:Ljava/util/Iterator;
    :cond_3
    return-void
.end method

.method private appendTypeAttribute(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 2
    .parameter "builder"
    .parameter "type"

    .prologue
    .line 2035
    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsV30:Z

    if-eqz v0, :cond_0

    .line 2036
    const-string v0, "TYPE"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2038
    :cond_0
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2039
    return-void
.end method

.method private appendTypeAttributes(Ljava/lang/StringBuilder;Ljava/util/List;)V
    .locals 4
    .parameter "builder"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2021
    .local p2, types:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x1

    .line 2022
    .local v0, first:Z
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 2023
    .local v2, type:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 2024
    const/4 v0, 0x0

    .line 2028
    :goto_1
    invoke-direct {p0, p1, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendTypeAttribute(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto :goto_0

    .line 2026
    :cond_0
    const-string v3, ";"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 2030
    .end local v2           #type:Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private appendUncommonPhoneType(Ljava/lang/StringBuilder;Ljava/lang/Integer;)V
    .locals 4
    .parameter "builder"
    .parameter "type"

    .prologue
    .line 1973
    iget-boolean v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsDoCoMo:Z

    if-eqz v1, :cond_0

    .line 1976
    const-string v1, "VOICE"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1985
    :goto_0
    return-void

    .line 1978
    :cond_0
    invoke-static {p2}, Lcom/android/bluetooth/pbap/VCardUtils;->getPhoneAttributeString(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v0

    .line 1979
    .local v0, phoneAttribute:Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 1980
    invoke-direct {p0, p1, v0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendTypeAttribute(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto :goto_0

    .line 1982
    :cond_1
    const-string v1, "BluetoothVCardComposer"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown or unsupported (by vCard) Phone type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private appendVCardEmailLine(Ljava/lang/StringBuilder;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .parameter "builder"
    .parameter "typeAsObject"
    .parameter "label"
    .parameter "data"

    .prologue
    .line 1853
    const-string v2, "EMAIL"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1856
    if-nez p2, :cond_0

    .line 1857
    const/4 v0, 0x3

    .line 1862
    .local v0, typeAsPrimitive:I
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 1896
    const-string v2, "BluetoothVCardComposer"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown Email type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1897
    const-string v1, "INTERNET"

    .line 1901
    .local v1, typeAsString:Ljava/lang/String;
    :goto_1
    const-string v2, ";"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1902
    invoke-direct {p0, p1, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendTypeAttribute(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 1903
    const-string v2, ":"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1904
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1905
    const-string v2, "\r\n"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1906
    return-void

    .line 1859
    .end local v0           #typeAsPrimitive:I
    .end local v1           #typeAsString:Ljava/lang/String;
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .restart local v0       #typeAsPrimitive:I
    goto :goto_0

    .line 1869
    :pswitch_0
    const-string v2, "_AUTO_CELL"

    invoke-virtual {v2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1870
    const-string v1, "CELL"

    .restart local v1       #typeAsString:Ljava/lang/String;
    goto :goto_1

    .line 1871
    .end local v1           #typeAsString:Ljava/lang/String;
    :cond_1
    iget-boolean v2, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesAndroidProperty:Z

    if-eqz v2, :cond_2

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-static {p3}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyAlphaDigitHyphen(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1873
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "X-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .restart local v1       #typeAsString:Ljava/lang/String;
    goto :goto_1

    .line 1875
    .end local v1           #typeAsString:Ljava/lang/String;
    :cond_2
    const-string v1, "INTERNET"

    .line 1877
    .restart local v1       #typeAsString:Ljava/lang/String;
    goto :goto_1

    .line 1880
    .end local v1           #typeAsString:Ljava/lang/String;
    :pswitch_1
    const-string v1, "HOME"

    .line 1881
    .restart local v1       #typeAsString:Ljava/lang/String;
    goto :goto_1

    .line 1884
    .end local v1           #typeAsString:Ljava/lang/String;
    :pswitch_2
    const-string v1, "WORK"

    .line 1885
    .restart local v1       #typeAsString:Ljava/lang/String;
    goto :goto_1

    .line 1888
    .end local v1           #typeAsString:Ljava/lang/String;
    :pswitch_3
    const-string v1, "INTERNET"

    .line 1889
    .restart local v1       #typeAsString:Ljava/lang/String;
    goto :goto_1

    .line 1892
    .end local v1           #typeAsString:Ljava/lang/String;
    :pswitch_4
    const-string v1, "CELL"

    .line 1893
    .restart local v1       #typeAsString:Ljava/lang/String;
    goto :goto_1

    .line 1862
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .parameter "builder"
    .parameter "propertyName"
    .parameter "rawData"

    .prologue
    const/4 v4, 0x0

    .line 1988
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 1989
    return-void
.end method

.method private appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 2
    .parameter "builder"
    .parameter "field"
    .parameter "rawData"
    .parameter "needCharset"
    .parameter "needQuotedPrintable"

    .prologue
    .line 1993
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1994
    if-eqz p4, :cond_0

    .line 1995
    const-string v1, ";"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1996
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardAttributeCharset:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2000
    :cond_0
    if-eqz p5, :cond_1

    .line 2001
    const-string v1, ";"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2002
    const-string v1, "ENCODING=QUOTED-PRINTABLE"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2003
    invoke-direct {p0, p3}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->encodeQuotedPrintable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2011
    .local v0, encodedData:Ljava/lang/String;
    :goto_0
    const-string v1, ":"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2012
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2013
    const-string v1, "\r\n"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2014
    return-void

    .line 2008
    .end local v0           #encodedData:Ljava/lang/String;
    :cond_1
    invoke-direct {p0, p3}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->escapeCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .restart local v0       #encodedData:Ljava/lang/String;
    goto :goto_0
.end method

.method private appendVCardPhotoLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .parameter "builder"
    .parameter "encodedData"
    .parameter "photoType"

    .prologue
    .line 1688
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 1689
    .local v3, tmpBuilder:Ljava/lang/StringBuilder;
    const-string v5, "PHOTO"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1690
    const-string v5, ";"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1691
    iget-boolean v5, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsV30:Z

    if-eqz v5, :cond_1

    .line 1692
    const-string v5, "ENCODING=b"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1696
    :goto_0
    const-string v5, ";"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1697
    invoke-direct {p0, v3, p3}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendTypeAttribute(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 1698
    const-string v5, ":"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1699
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1701
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1702
    .local v4, tmpStr:Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    .end local v3           #tmpBuilder:Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 1703
    .restart local v3       #tmpBuilder:Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 1704
    .local v2, lineCount:I
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v1

    .line 1705
    .local v1, length:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-ge v0, v1, :cond_2

    .line 1706
    invoke-virtual {v4, v0}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1707
    add-int/lit8 v2, v2, 0x1

    .line 1708
    const/16 v5, 0x48

    if-le v2, v5, :cond_0

    .line 1709
    const-string v5, "\r\n"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1710
    const-string v5, " "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1711
    const/4 v2, 0x0

    .line 1705
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1694
    .end local v0           #i:I
    .end local v1           #length:I
    .end local v2           #lineCount:I
    .end local v4           #tmpStr:Ljava/lang/String;
    :cond_1
    const-string v5, "ENCODING=BASE64"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 1714
    .restart local v0       #i:I
    .restart local v1       #length:I
    .restart local v2       #lineCount:I
    .restart local v4       #tmpStr:Ljava/lang/String;
    :cond_2
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1715
    const-string v5, "\r\n"

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1716
    const-string v5, "\r\n"

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1717
    return-void
.end method

.method private appendVCardPostalLine(Ljava/lang/StringBuilder;Ljava/lang/Integer;Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 18
    .parameter "builder"
    .parameter "typeAsObject"
    .parameter "label"
    .parameter "contentValues"

    .prologue
    .line 1721
    const-string v15, "ADR"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1722
    const-string v15, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1728
    const/4 v6, 0x0

    .line 1729
    .local v6, dataExists:Z
    invoke-static/range {p4 .. p4}, Lcom/android/bluetooth/pbap/VCardUtils;->getVCardPostalElements(Landroid/content/ContentValues;)[Ljava/lang/String;

    move-result-object v5

    .line 1730
    .local v5, dataArray:[Ljava/lang/String;
    const/4 v2, 0x0

    .line 1731
    .local v2, actuallyUseQuotedPrintable:Z
    const/4 v12, 0x0

    .line 1732
    .local v12, shouldAppendCharset:Z
    move-object v3, v5

    .local v3, arr$:[Ljava/lang/String;
    array-length v9, v3

    .local v9, len$:I
    const/4 v8, 0x0

    .local v8, i$:I
    :goto_0
    if-ge v8, v9, :cond_1

    aget-object v4, v3, v8

    .line 1733
    .local v4, data:Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    if-nez v15, :cond_3

    .line 1734
    const/4 v6, 0x1

    .line 1735
    if-nez v12, :cond_0

    invoke-static {v4}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyPrintableAscii(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_0

    .line 1736
    const/4 v12, 0x1

    .line 1738
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesQuotedPrintable:Z

    if-eqz v15, :cond_3

    invoke-static {v4}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyNonCrLfPrintableAscii(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_3

    .line 1739
    const/4 v2, 0x1

    .line 1745
    .end local v4           #data:Ljava/lang/String;
    :cond_1
    array-length v10, v5

    .line 1746
    .local v10, length:I
    const/4 v7, 0x0

    .local v7, i:I
    :goto_1
    if-ge v7, v10, :cond_5

    .line 1747
    aget-object v4, v5, v7

    .line 1748
    .restart local v4       #data:Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    if-nez v15, :cond_2

    .line 1749
    if-eqz v2, :cond_4

    .line 1750
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->encodeQuotedPrintable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    aput-object v15, v5, v7

    .line 1746
    :cond_2
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 1732
    .end local v7           #i:I
    .end local v10           #length:I
    :cond_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 1752
    .restart local v7       #i:I
    .restart local v10       #length:I
    :cond_4
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->escapeCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    aput-object v15, v5, v7

    goto :goto_2

    .line 1758
    .end local v4           #data:Ljava/lang/String;
    :cond_5
    if-nez p2, :cond_d

    .line 1759
    const/4 v13, 0x3

    .line 1764
    .local v13, typeAsPrimitive:I
    :goto_3
    const/4 v14, 0x0

    .line 1765
    .local v14, typeAsString:Ljava/lang/String;
    packed-switch v13, :pswitch_data_0

    .line 1792
    const-string v15, "BluetoothVCardComposer"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Unknown StructuredPostal type: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1798
    :cond_6
    :goto_4
    :pswitch_0
    const/4 v11, 0x0

    .line 1799
    .local v11, shouldAppendAttrSeparator:Z
    if-eqz v14, :cond_7

    .line 1800
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v14}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendTypeAttribute(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 1801
    const/4 v11, 0x1

    .line 1803
    :cond_7
    if-eqz v6, :cond_b

    .line 1804
    if-eqz v12, :cond_9

    .line 1812
    if-eqz v11, :cond_8

    .line 1813
    const-string v15, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1815
    :cond_8
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mVCardAttributeCharset:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1816
    const/4 v11, 0x1

    .line 1819
    :cond_9
    if-eqz v2, :cond_b

    .line 1820
    if-eqz v11, :cond_a

    .line 1821
    const-string v15, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1823
    :cond_a
    const-string v15, "ENCODING=QUOTED-PRINTABLE"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1824
    const/4 v11, 0x1

    .line 1827
    :cond_b
    const-string v15, ":"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1828
    if-eqz v6, :cond_c

    .line 1834
    const/4 v15, 0x0

    aget-object v15, v5, v15

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1835
    const-string v15, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1836
    const/4 v15, 0x1

    aget-object v15, v5, v15

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1837
    const-string v15, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1838
    const/4 v15, 0x2

    aget-object v15, v5, v15

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1839
    const-string v15, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1840
    const/4 v15, 0x3

    aget-object v15, v5, v15

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1841
    const-string v15, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1842
    const/4 v15, 0x4

    aget-object v15, v5, v15

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1843
    const-string v15, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1844
    const/4 v15, 0x5

    aget-object v15, v5, v15

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1845
    const-string v15, ";"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1846
    const/4 v15, 0x6

    aget-object v15, v5, v15

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1848
    :cond_c
    const-string v15, "\r\n"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1849
    return-void

    .line 1761
    .end local v11           #shouldAppendAttrSeparator:Z
    .end local v13           #typeAsPrimitive:I
    .end local v14           #typeAsString:Ljava/lang/String;
    :cond_d
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Integer;->intValue()I

    move-result v13

    .restart local v13       #typeAsPrimitive:I
    goto/16 :goto_3

    .line 1767
    .restart local v14       #typeAsString:Ljava/lang/String;
    :pswitch_1
    const-string v14, "HOME"

    .line 1768
    goto/16 :goto_4

    .line 1771
    :pswitch_2
    const-string v14, "WORK"

    .line 1772
    goto/16 :goto_4

    .line 1775
    :pswitch_3
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesAndroidProperty:Z

    if-eqz v15, :cond_6

    if-eqz p3, :cond_6

    invoke-static/range {p3 .. p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    if-nez v15, :cond_6

    invoke-static/range {p3 .. p3}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyAlphaDigitHyphen(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_6

    .line 1782
    const-string v15, "X-"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1783
    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1784
    const-string v15, ":"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_4

    .line 1765
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method private appendVCardTelephoneLine(Ljava/lang/StringBuilder;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .parameter "builder"
    .parameter "typeAsObject"
    .parameter "label"
    .parameter "encodedData"

    .prologue
    const/4 v2, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1910
    const-string v1, "TEL"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1911
    const-string v1, ";"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1914
    if-nez p2, :cond_0

    .line 1915
    const/4 v0, 0x7

    .line 1920
    .local v0, typeAsPrimitive:I
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 1960
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendUncommonPhoneType(Ljava/lang/StringBuilder;Ljava/lang/Integer;)V

    .line 1964
    :goto_1
    const-string v1, ":"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1965
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1966
    const-string v1, "\r\n"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1967
    return-void

    .line 1917
    .end local v0           #typeAsPrimitive:I
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .restart local v0       #typeAsPrimitive:I
    goto :goto_0

    .line 1922
    :pswitch_0
    new-array v1, v2, [Ljava/lang/String;

    const-string v2, "HOME"

    aput-object v2, v1, v3

    const-string v2, "VOICE"

    aput-object v2, v1, v4

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendTypeAttributes(Ljava/lang/StringBuilder;Ljava/util/List;)V

    goto :goto_1

    .line 1925
    :pswitch_1
    new-array v1, v2, [Ljava/lang/String;

    const-string v2, "WORK"

    aput-object v2, v1, v3

    const-string v2, "VOICE"

    aput-object v2, v1, v4

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendTypeAttributes(Ljava/lang/StringBuilder;Ljava/util/List;)V

    goto :goto_1

    .line 1928
    :pswitch_2
    new-array v1, v2, [Ljava/lang/String;

    const-string v2, "HOME"

    aput-object v2, v1, v3

    const-string v2, "FAX"

    aput-object v2, v1, v4

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendTypeAttributes(Ljava/lang/StringBuilder;Ljava/util/List;)V

    goto :goto_1

    .line 1931
    :pswitch_3
    new-array v1, v2, [Ljava/lang/String;

    const-string v2, "WORK"

    aput-object v2, v1, v3

    const-string v2, "FAX"

    aput-object v2, v1, v4

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendTypeAttributes(Ljava/lang/StringBuilder;Ljava/util/List;)V

    goto :goto_1

    .line 1934
    :pswitch_4
    const-string v1, "CELL"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1937
    :pswitch_5
    iget-boolean v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsDoCoMo:Z

    if-eqz v1, :cond_1

    .line 1943
    const-string v1, "VOICE"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1945
    :cond_1
    const-string v1, "PAGER"

    invoke-direct {p0, p1, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendTypeAttribute(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto :goto_1

    .line 1949
    :pswitch_6
    const-string v1, "VOICE"

    invoke-direct {p0, p1, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendTypeAttribute(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto :goto_1

    .line 1952
    :pswitch_7
    iget-boolean v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesAndroidProperty:Z

    if-eqz v1, :cond_2

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-static {p3}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyAlphaDigitHyphen(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1953
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "X-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendTypeAttribute(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1956
    :cond_2
    const-string v1, "VOICE"

    invoke-direct {p0, p1, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendTypeAttribute(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1920
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_0
        :pswitch_4
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method private appendWebsites(Ljava/lang/StringBuilder;Ljava/util/Map;)V
    .locals 5
    .parameter "builder"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 1465
    .local p2, contentValuesListMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Landroid/content/ContentValues;>;>;"
    const-string v4, "vnd.android.cursor.item/website"

    invoke-interface {p2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 1466
    .local v1, contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    if-eqz v1, :cond_2

    .line 1467
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentValues;

    .line 1468
    .local v0, contentValues:Landroid/content/ContentValues;
    const-string v4, "data1"

    invoke-virtual {v0, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1469
    .local v3, website:Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 1470
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 1472
    :cond_1
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 1473
    const-string v4, "URL"

    invoke-direct {p0, p1, v4, v3}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1477
    .end local v0           #contentValues:Landroid/content/ContentValues;
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #website:Ljava/lang/String;
    :cond_2
    return-void
.end method

.method private containsNonEmptyName(Landroid/content/ContentValues;)Z
    .locals 7
    .parameter "contentValues"

    .prologue
    .line 862
    const-string v6, "data3"

    invoke-virtual {p1, v6}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 863
    .local v1, familyName:Ljava/lang/String;
    const-string v6, "data5"

    invoke-virtual {p1, v6}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 864
    .local v3, middleName:Ljava/lang/String;
    const-string v6, "data2"

    invoke-virtual {p1, v6}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 865
    .local v2, givenName:Ljava/lang/String;
    const-string v6, "data4"

    invoke-virtual {p1, v6}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 866
    .local v4, prefix:Ljava/lang/String;
    const-string v6, "data6"

    invoke-virtual {p1, v6}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 867
    .local v5, suffix:Ljava/lang/String;
    const-string v6, "data1"

    invoke-virtual {p1, v6}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 868
    .local v0, displayName:Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1

    :cond_0
    const/4 v6, 0x1

    :goto_0
    return v6

    :cond_1
    const/4 v6, 0x0

    goto :goto_0
.end method

.method private createOneCallLogEntryInternal()Ljava/lang/String;
    .locals 9

    .prologue
    const/4 v5, 0x0

    .line 654
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 655
    .local v1, builder:Ljava/lang/StringBuilder;
    const-string v0, "BEGIN"

    const-string v2, "VCARD"

    invoke-direct {p0, v1, v0, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 656
    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsV30:Z

    if-eqz v0, :cond_2

    .line 657
    const-string v0, "VERSION"

    const-string v2, "3.0"

    invoke-direct {p0, v1, v0, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 661
    :goto_0
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    const/4 v2, 0x3

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 662
    .local v3, name:Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 663
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 665
    :cond_0
    invoke-static {v3}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyPrintableAscii(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    const/4 v4, 0x1

    .line 668
    .local v4, needCharset:Z
    :goto_1
    const-string v2, "FN"

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 669
    const-string v2, "N"

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 671
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 672
    .local v7, number:Ljava/lang/String;
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    const/4 v2, 0x4

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    .line 673
    .local v8, type:I
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    const/4 v2, 0x5

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 674
    .local v6, label:Ljava/lang/String;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 675
    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    .line 677
    :cond_1
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, v1, v0, v6, v7}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardTelephoneLine(Ljava/lang/StringBuilder;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    .line 678
    invoke-direct {p0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->tryAppendCallHistoryTimeStampField(Ljava/lang/StringBuilder;)V

    .line 679
    const-string v0, "END"

    const-string v2, "VCARD"

    invoke-direct {p0, v1, v0, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 680
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 659
    .end local v3           #name:Ljava/lang/String;
    .end local v4           #needCharset:Z
    .end local v6           #label:Ljava/lang/String;
    .end local v7           #number:Ljava/lang/String;
    .end local v8           #type:I
    :cond_2
    const-string v0, "VERSION"

    const-string v2, "2.1"

    invoke-direct {p0, v1, v0, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .restart local v3       #name:Ljava/lang/String;
    :cond_3
    move v4, v5

    .line 665
    goto :goto_1
.end method

.method private createOneEntryInternal(Ljava/lang/String;)Ljava/lang/String;
    .locals 19
    .parameter "contactId"

    .prologue
    .line 684
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 685
    .local v11, contentValuesListMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Landroid/content/ContentValues;>;>;"
    const-string v18, "contact_id=?"

    .line 686
    .local v18, selection:Ljava/lang/String;
    const/4 v1, 0x1

    new-array v5, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v5, v1

    .line 695
    .local v5, selectionArgs:[Ljava/lang/String;
    const/4 v12, 0x0

    .line 696
    .local v12, dataExists:Z
    const/4 v14, 0x0

    .line 700
    .local v14, entityIterator:Landroid/content/EntityIterator;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v2, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->DATA_REQUEST_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    const-string v4, "contact_id=?"

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 701
    .local v8, c:Landroid/database/Cursor;
    if-eqz v8, :cond_4

    .line 702
    invoke-static {v8}, Landroid/provider/ContactsContract$RawContacts;->newEntityIterator(Landroid/database/Cursor;)Landroid/content/EntityIterator;

    move-result-object v14

    .line 704
    invoke-interface {v14}, Landroid/content/EntityIterator;->hasNext()Z

    move-result v12

    .line 705
    :cond_0
    invoke-interface {v14}, Landroid/content/EntityIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 706
    invoke-interface {v14}, Landroid/content/EntityIterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/content/Entity;

    .line 707
    .local v13, entity:Landroid/content/Entity;
    invoke-virtual {v13}, Landroid/content/Entity;->getSubValues()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .local v15, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Landroid/content/Entity$NamedContentValues;

    .line 708
    .local v17, namedContentValues:Landroid/content/Entity$NamedContentValues;
    move-object/from16 v0, v17

    iget-object v9, v0, Landroid/content/Entity$NamedContentValues;->values:Landroid/content/ContentValues;

    .line 709
    .local v9, contentValues:Landroid/content/ContentValues;
    const-string v1, "mimetype"

    invoke-virtual {v9, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 710
    .local v16, key:Ljava/lang/String;
    if-eqz v16, :cond_1

    .line 711
    move-object/from16 v0, v16

    invoke-interface {v11, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    .line 712
    .local v10, contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    if-nez v10, :cond_2

    .line 713
    new-instance v10, Ljava/util/ArrayList;

    .end local v10           #contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 714
    .restart local v10       #contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    move-object/from16 v0, v16

    invoke-interface {v11, v0, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 716
    :cond_2
    invoke-interface {v10, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 722
    .end local v8           #c:Landroid/database/Cursor;
    .end local v9           #contentValues:Landroid/content/ContentValues;
    .end local v10           #contentValuesList:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    .end local v13           #entity:Landroid/content/Entity;
    .end local v15           #i$:Ljava/util/Iterator;
    .end local v16           #key:Ljava/lang/String;
    .end local v17           #namedContentValues:Landroid/content/Entity$NamedContentValues;
    :catchall_0
    move-exception v1

    if-eqz v14, :cond_3

    .line 723
    invoke-interface {v14}, Landroid/content/EntityIterator;->close()V

    :cond_3
    throw v1

    .line 722
    .restart local v8       #c:Landroid/database/Cursor;
    :cond_4
    if-eqz v14, :cond_5

    .line 723
    invoke-interface {v14}, Landroid/content/EntityIterator;->close()V

    .line 727
    :cond_5
    if-nez v12, :cond_6

    .line 728
    const-string v1, ""

    .line 795
    :goto_1
    return-object v1

    .line 731
    :cond_6
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 732
    .local v7, builder:Ljava/lang/StringBuilder;
    const-string v1, "BEGIN"

    const-string v2, "VCARD"

    move-object/from16 v0, p0

    invoke-direct {v0, v7, v1, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 733
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsV30:Z

    if-eqz v1, :cond_11

    .line 734
    const-string v1, "VERSION"

    const-string v2, "3.0"

    move-object/from16 v0, p0

    invoke-direct {v0, v7, v1, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 739
    :goto_2
    move-object/from16 v0, p0

    invoke-direct {v0, v7, v11}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendStructuredNames(Ljava/lang/StringBuilder;Ljava/util/Map;)V

    .line 741
    move-object/from16 v0, p0

    iget-wide v1, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mFilter:J

    const-wide/32 v3, 0x800000

    and-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_7

    .line 742
    const-string v1, "BluetoothVCardComposer"

    const-string v2, "appendNickName"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 743
    move-object/from16 v0, p0

    invoke-direct {v0, v7, v11}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendNickNames(Ljava/lang/StringBuilder;Ljava/util/Map;)V

    .line 745
    :cond_7
    move-object/from16 v0, p0

    invoke-direct {v0, v7, v11}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendPhones(Ljava/lang/StringBuilder;Ljava/util/Map;)V

    .line 747
    move-object/from16 v0, p0

    iget-wide v1, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mFilter:J

    const-wide/16 v3, 0x100

    and-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_8

    .line 748
    const-string v1, "BluetoothVCardComposer"

    const-string v2, "appendEmails"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 749
    move-object/from16 v0, p0

    invoke-direct {v0, v7, v11}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendEmails(Ljava/lang/StringBuilder;Ljava/util/Map;)V

    .line 752
    :cond_8
    move-object/from16 v0, p0

    iget-wide v1, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mFilter:J

    const-wide/16 v3, 0x20

    and-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_9

    .line 753
    const-string v1, "BluetoothVCardComposer"

    const-string v2, "appendPostals"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 754
    move-object/from16 v0, p0

    invoke-direct {v0, v7, v11}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendPostals(Ljava/lang/StringBuilder;Ljava/util/Map;)V

    .line 761
    :cond_9
    move-object/from16 v0, p0

    iget-wide v1, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mFilter:J

    const-wide/32 v3, 0x100000

    and-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_a

    .line 762
    move-object/from16 v0, p0

    invoke-direct {v0, v7, v11}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendWebsites(Ljava/lang/StringBuilder;Ljava/util/Map;)V

    .line 765
    :cond_a
    move-object/from16 v0, p0

    iget-wide v1, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mFilter:J

    const-wide/16 v3, 0x10

    and-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_b

    .line 766
    move-object/from16 v0, p0

    invoke-direct {v0, v7, v11}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendBirthday(Ljava/lang/StringBuilder;Ljava/util/Map;)V

    .line 769
    :cond_b
    move-object/from16 v0, p0

    iget-wide v1, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mFilter:J

    const-wide/32 v3, 0x10000

    and-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_c

    .line 770
    move-object/from16 v0, p0

    invoke-direct {v0, v7, v11}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendOrganizations(Ljava/lang/StringBuilder;Ljava/util/Map;)V

    .line 773
    :cond_c
    move-object/from16 v0, p0

    iget-wide v1, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mFilter:J

    const-wide/16 v3, 0x1000

    and-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_d

    .line 774
    move-object/from16 v0, p0

    invoke-direct {v0, v7, v11}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendTitles(Ljava/lang/StringBuilder;Ljava/util/Map;)V

    .line 777
    :cond_d
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mNeedPhotoForVCard:Z

    if-eqz v1, :cond_e

    move-object/from16 v0, p0

    iget-wide v1, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mFilter:J

    const-wide/16 v3, 0x8

    and-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_e

    .line 778
    move-object/from16 v0, p0

    invoke-direct {v0, v7, v11}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendPhotos(Ljava/lang/StringBuilder;Ljava/util/Map;)V

    .line 781
    :cond_e
    move-object/from16 v0, p0

    iget-wide v1, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mFilter:J

    const-wide/32 v3, 0x20000

    and-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_f

    .line 782
    move-object/from16 v0, p0

    invoke-direct {v0, v7, v11}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendNotes(Ljava/lang/StringBuilder;Ljava/util/Map;)V

    .line 786
    :cond_f
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsDoCoMo:Z

    if-eqz v1, :cond_10

    .line 787
    const-string v1, "X-CLASS"

    const-string v2, "PUBLIC"

    move-object/from16 v0, p0

    invoke-direct {v0, v7, v1, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 788
    const-string v1, "X-REDUCTION"

    const-string v2, ""

    move-object/from16 v0, p0

    invoke-direct {v0, v7, v1, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 789
    const-string v1, "X-NO"

    const-string v2, ""

    move-object/from16 v0, p0

    invoke-direct {v0, v7, v1, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 790
    const-string v1, "X-DCM-HMN-MODE"

    const-string v2, ""

    move-object/from16 v0, p0

    invoke-direct {v0, v7, v1, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 793
    :cond_10
    const-string v1, "END"

    const-string v2, "VCARD"

    move-object/from16 v0, p0

    invoke-direct {v0, v7, v1, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 795
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_1

    .line 736
    :cond_11
    const-string v1, "VERSION"

    const-string v2, "2.1"

    move-object/from16 v0, p0

    invoke-direct {v0, v7, v1, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2
.end method

.method private encodeQuotedPrintable(Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .parameter "str"

    .prologue
    const/16 v10, 0xa

    .line 2064
    if-eqz p1, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 2065
    :cond_0
    const-string v9, ""

    .line 2113
    :goto_0
    return-object v9

    .line 2068
    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 2069
    .local v7, tempBuilder:Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 2070
    .local v4, length:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    if-ge v2, v4, :cond_5

    .line 2071
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 2072
    .local v0, ch:C
    const/16 v9, 0xd

    if-ne v0, v9, :cond_3

    .line 2073
    add-int/lit8 v9, v2, 0x1

    if-ge v9, v4, :cond_2

    add-int/lit8 v9, v2, 0x1

    invoke-virtual {p1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v9, v10, :cond_2

    .line 2074
    add-int/lit8 v2, v2, 0x1

    .line 2076
    :cond_2
    const-string v9, "\r\n"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2070
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 2077
    :cond_3
    if-ne v0, v10, :cond_4

    .line 2078
    const-string v9, "\r\n"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 2080
    :cond_4
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 2083
    .end local v0           #ch:C
    :cond_5
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 2084
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 2085
    .local v8, tmpBuilder:Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    .line 2086
    .local v3, index:I
    const/4 v5, 0x0

    .line 2087
    .local v5, lineCount:I
    const/4 v6, 0x0

    .line 2090
    .local v6, strArray:[B
    :try_start_0
    iget-object v9, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCharsetString:Ljava/lang/String;

    invoke-virtual {p1, v9}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 2095
    :cond_6
    :goto_3
    array-length v9, v6

    if-ge v3, v9, :cond_7

    .line 2096
    const-string v9, "=%02X"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aget-byte v12, v6, v3

    invoke-static {v12}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2097
    add-int/lit8 v3, v3, 0x1

    .line 2098
    add-int/lit8 v5, v5, 0x3

    .line 2100
    const/16 v9, 0x43

    if-lt v5, v9, :cond_6

    .line 2108
    const-string v9, "=\r\n"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2109
    const/4 v5, 0x0

    goto :goto_3

    .line 2091
    :catch_0
    move-exception v1

    .line 2092
    .local v1, e:Ljava/io/UnsupportedEncodingException;
    const-string v9, "BluetoothVCardComposer"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Charset "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCharsetString:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " cannot be used. "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "Try default charset"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2093
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    goto :goto_3

    .line 2113
    .end local v1           #e:Ljava/io/UnsupportedEncodingException;
    :cond_7
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_0
.end method

.method private escapeCharacters(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .parameter "unescaped"

    .prologue
    const/16 v6, 0x5c

    .line 1616
    if-eqz p1, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1617
    :cond_0
    const-string v5, ""

    .line 1684
    :goto_0
    return-object v5

    .line 1620
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 1621
    .local v4, tmpBuilder:Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 1622
    .local v2, length:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v2, :cond_7

    .line 1623
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1624
    .local v0, ch:C
    sparse-switch v0, :sswitch_data_0

    .line 1679
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1622
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1626
    :sswitch_0
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1627
    const/16 v5, 0x3b

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 1631
    :sswitch_1
    add-int/lit8 v5, v1, 0x1

    if-ge v5, v2, :cond_3

    .line 1632
    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 1633
    .local v3, nextChar:C
    const/16 v5, 0xa

    if-eq v3, v5, :cond_2

    .line 1648
    .end local v3           #nextChar:C
    :cond_3
    :sswitch_2
    const-string v5, "\\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 1652
    :sswitch_3
    iget-boolean v5, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsV30:Z

    if-eqz v5, :cond_4

    .line 1653
    const-string v5, "\\\\"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 1662
    :cond_4
    :sswitch_4
    iget-boolean v5, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsDoCoMo:Z

    if-eqz v5, :cond_5

    .line 1663
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1664
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 1666
    :cond_5
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 1671
    :sswitch_5
    iget-boolean v5, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsV30:Z

    if-eqz v5, :cond_6

    .line 1672
    const-string v5, "\\,"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 1674
    :cond_6
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 1684
    .end local v0           #ch:C
    :cond_7
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 1624
    nop

    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_2
        0xd -> :sswitch_1
        0x2c -> :sswitch_5
        0x3b -> :sswitch_0
        0x3c -> :sswitch_4
        0x3e -> :sswitch_4
        0x5c -> :sswitch_3
    .end sparse-switch
.end method

.method private shouldAppendCharsetAttribute(Ljava/lang/String;)Z
    .locals 1
    .parameter "propertyValue"

    .prologue
    .line 2049
    invoke-static {p1}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyPrintableAscii(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsV30:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesUtf8:Z

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private shouldAppendCharsetAttribute(Ljava/util/List;)Z
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 2053
    .local p1, propertyValueList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .line 2054
    .local v2, shouldAppendBasically:Z
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 2055
    .local v1, propertyValue:Ljava/lang/String;
    invoke-static {v1}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyPrintableAscii(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2056
    const/4 v2, 0x1

    .line 2060
    .end local v1           #propertyValue:Ljava/lang/String;
    :cond_1
    if-eqz v2, :cond_3

    iget-boolean v3, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsV30:Z

    if-eqz v3, :cond_2

    iget-boolean v3, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mUsesUtf8:Z

    if-nez v3, :cond_3

    :cond_2
    const/4 v3, 0x1

    :goto_0
    return v3

    :cond_3
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private splitIfSeveralPhoneNumbersExist(Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .parameter "phoneNumber"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1324
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1325
    .local v5, phoneList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x1

    .line 1327
    .local v2, first:Z
    if-eqz p1, :cond_5

    .line 1328
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1329
    .local v0, builder:Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 1330
    .local v4, length:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v4, :cond_4

    .line 1331
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1332
    .local v1, ch:C
    if-eqz v2, :cond_1

    const/16 v6, 0x2b

    if-ne v1, v6, :cond_1

    .line 1333
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1334
    const/4 v2, 0x0

    .line 1330
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1335
    :cond_1
    invoke-static {v1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1336
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1337
    const/4 v2, 0x0

    goto :goto_1

    .line 1338
    :cond_2
    const/16 v6, 0x3b

    if-eq v1, v6, :cond_3

    const/16 v6, 0xa

    if-ne v1, v6, :cond_0

    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_0

    .line 1339
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1340
    new-instance v0, Ljava/lang/StringBuilder;

    .end local v0           #builder:Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1341
    .restart local v0       #builder:Ljava/lang/StringBuilder;
    const/4 v2, 0x1

    goto :goto_1

    .line 1344
    .end local v1           #ch:C
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_5

    .line 1345
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1348
    .end local v0           #builder:Ljava/lang/StringBuilder;
    .end local v3           #i:I
    .end local v4           #length:I
    :cond_5
    return-object v5
.end method

.method private toRfc2455Format(J)Ljava/lang/String;
    .locals 4
    .parameter "millSecs"

    .prologue
    .line 605
    new-instance v1, Landroid/text/format/Time;

    invoke-direct {v1}, Landroid/text/format/Time;-><init>()V

    .line 606
    .local v1, startDate:Landroid/text/format/Time;
    invoke-virtual {v1, p1, p2}, Landroid/text/format/Time;->set(J)V

    .line 607
    invoke-virtual {v1}, Landroid/text/format/Time;->format2445()Ljava/lang/String;

    move-result-object v0

    .line 608
    .local v0, date:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "Z"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private tryAppendCallHistoryTimeStampField(Ljava/lang/StringBuilder;)V
    .locals 6
    .parameter "builder"

    .prologue
    .line 624
    iget-object v4, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    const/4 v5, 0x2

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    .line 626
    .local v0, callLogType:I
    packed-switch v0, :pswitch_data_0

    .line 640
    const-string v4, "BluetoothVCardComposer"

    const-string v5, "Call log type not correct."

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 651
    :goto_0
    return-void

    .line 628
    :pswitch_0
    const-string v1, "RECEIVED"

    .line 644
    .local v1, callLogTypeStr:Ljava/lang/String;
    :goto_1
    iget-object v4, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    const/4 v5, 0x1

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    .line 645
    .local v2, dateAsLong:J
    const-string v4, "X-IRMC-CALL-DATETIME"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 646
    const-string v4, ";"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 647
    invoke-direct {p0, p1, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendTypeAttribute(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 648
    const-string v4, ":"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 649
    invoke-direct {p0, v2, v3}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->toRfc2455Format(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 650
    const-string v4, "\r\n"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 632
    .end local v1           #callLogTypeStr:Ljava/lang/String;
    .end local v2           #dateAsLong:J
    :pswitch_1
    const-string v1, "DIALED"

    .line 633
    .restart local v1       #callLogTypeStr:Ljava/lang/String;
    goto :goto_1

    .line 636
    .end local v1           #callLogTypeStr:Ljava/lang/String;
    :pswitch_2
    const-string v1, "MISSED"

    .line 637
    .restart local v1       #callLogTypeStr:Ljava/lang/String;
    goto :goto_1

    .line 626
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public addHandler(Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;)V
    .locals 1
    .parameter "handler"

    .prologue
    .line 487
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mHandlerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 488
    return-void
.end method

.method public composeVCardForPhoneOwnNumber(ILjava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 7
    .parameter "phonetype"
    .parameter "phoneName"
    .parameter "phoneNumber"
    .parameter "vcardVer21"

    .prologue
    const/4 v5, 0x0

    .line 456
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 457
    .local v1, builder:Ljava/lang/StringBuilder;
    const-string v0, "BEGIN"

    const-string v2, "VCARD"

    invoke-direct {p0, v1, v0, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 458
    if-nez p4, :cond_2

    .line 459
    const-string v0, "VERSION"

    const-string v2, "3.0"

    invoke-direct {p0, v1, v0, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 464
    :goto_0
    const/4 v4, 0x0

    .line 465
    .local v4, needCharset:Z
    invoke-static {p2}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyPrintableAscii(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 466
    const/4 v4, 0x1

    .line 470
    :cond_0
    const-string v2, "FN"

    move-object v0, p0

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 471
    const-string v2, "N"

    move-object v0, p0

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 473
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 474
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    .line 475
    .local v6, label:Ljava/lang/String;
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, v1, v0, v6, p3}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardTelephoneLine(Ljava/lang/StringBuilder;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    .line 478
    .end local v6           #label:Ljava/lang/String;
    :cond_1
    const-string v0, "END"

    const-string v2, "VCARD"

    invoke-direct {p0, v1, v0, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 480
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 461
    .end local v4           #needCharset:Z
    :cond_2
    const-string v0, "VERSION"

    const-string v2, "2.1"

    invoke-direct {p0, v1, v0, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->appendVCardLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public createOneEntry()Z
    .locals 10

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 555
    iget-object v8, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    if-eqz v8, :cond_0

    iget-object v8, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    invoke-interface {v8}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 556
    :cond_0
    const-string v6, "The vCard composer object is not correctly initialized"

    iput-object v6, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mErrorReason:Ljava/lang/String;

    move v6, v7

    .line 598
    :cond_1
    :goto_0
    return v6

    .line 559
    :cond_2
    const/4 v4, 0x0

    .line 562
    .local v4, name:Ljava/lang/String;
    :try_start_0
    iget-boolean v8, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsCallLogComposer:Z

    if-eqz v8, :cond_4

    .line 563
    invoke-direct {p0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->createOneCallLogEntryInternal()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 580
    .local v5, vcard:Ljava/lang/String;
    :goto_1
    iget-object v8, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    .line 585
    iget-boolean v8, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCareHandlerErrors:Z

    if-eqz v8, :cond_6

    .line 586
    new-instance v1, Ljava/util/ArrayList;

    iget-object v8, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mHandlerList:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-direct {v1, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 587
    .local v1, finishedList:Ljava/util/List;,"Ljava/util/List<Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;>;"
    iget-object v8, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mHandlerList:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;

    .line 588
    .local v2, handler:Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;
    invoke-interface {v2, v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;->onEntryCreated(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_3

    move v6, v7

    .line 589
    goto :goto_0

    .line 565
    .end local v1           #finishedList:Ljava/util/List;,"Ljava/util/List<Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;>;"
    .end local v2           #handler:Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v5           #vcard:Ljava/lang/String;
    :cond_4
    :try_start_1
    iget v8, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIdColumn:I

    if-ltz v8, :cond_5

    .line 566
    iget-object v8, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    iget v9, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIdColumn:I

    invoke-interface {v8, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->createOneEntryInternal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .restart local v5       #vcard:Ljava/lang/String;
    goto :goto_1

    .line 568
    .end local v5           #vcard:Ljava/lang/String;
    :cond_5
    const-string v7, "BluetoothVCardComposer"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Incorrect mIdColumn: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIdColumn:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_0

    .line 580
    iget-object v7, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 572
    :catch_0
    move-exception v0

    .line 575
    .local v0, error:Ljava/lang/OutOfMemoryError;
    :try_start_2
    const-string v7, "BluetoothVCardComposer"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "OutOfMemoryError occured. Ignore the entry: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 576
    invoke-static {}, Ljava/lang/System;->gc()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 580
    iget-object v7, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    goto/16 :goto_0

    .end local v0           #error:Ljava/lang/OutOfMemoryError;
    :catchall_0
    move-exception v6

    iget-object v7, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    throw v6

    .line 593
    .restart local v5       #vcard:Ljava/lang/String;
    :cond_6
    iget-object v7, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mHandlerList:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3       #i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;

    .line 594
    .restart local v2       #handler:Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;
    invoke-interface {v2, v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;->onEntryCreated(Ljava/lang/String;)Z

    goto :goto_2
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 823
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    if-nez v0, :cond_0

    .line 824
    const/4 v0, 0x0

    .line 826
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    goto :goto_0
.end method

.method public getErrorReason()Ljava/lang/String;
    .locals 1

    .prologue
    .line 840
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mErrorReason:Ljava/lang/String;

    return-object v0
.end method

.method public init()Z
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 491
    invoke-virtual {p0, v0, v0, v0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->init(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public init(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Z
    .locals 11
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "orderBy"

    .prologue
    .line 499
    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCareHandlerErrors:Z

    if-eqz v0, :cond_2

    .line 500
    new-instance v8, Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mHandlerList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {v8, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 501
    .local v8, finishedList:Ljava/util/List;,"Ljava/util/List<Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;>;"
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mHandlerList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;

    .line 502
    .local v9, handler:Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mContext:Landroid/content/Context;

    invoke-interface {v9, v0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;->onInit(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 503
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;

    .line 504
    .local v7, finished:Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;
    invoke-interface {v7}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;->onTerminate()V

    goto :goto_0

    .line 506
    .end local v7           #finished:Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;
    :cond_1
    const/4 v0, 0x0

    .line 551
    .end local v8           #finishedList:Ljava/util/List;,"Ljava/util/List<Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;>;"
    .end local v9           #handler:Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;
    :goto_1
    return v0

    .line 511
    .end local v10           #i$:Ljava/util/Iterator;
    :cond_2
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mHandlerList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .restart local v10       #i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;

    .line 512
    .restart local v9       #handler:Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mContext:Landroid/content/Context;

    invoke-interface {v9, v0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;->onInit(Landroid/content/Context;)Z

    goto :goto_2

    .line 515
    .end local v9           #handler:Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;
    :cond_3
    const-string v0, "BluetoothVCardComposer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mIsCallLogComposer="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsCallLogComposer:Z

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 516
    const-string v0, "BluetoothVCardComposer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "init("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 517
    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsCallLogComposer:Z

    if-eqz v0, :cond_4

    .line 518
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Landroid/provider/CallLog$Calls;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->CALL_LOG_PROJECTION:[Ljava/lang/String;

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    .line 526
    :goto_3
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    if-nez v0, :cond_5

    .line 527
    const-string v0, "BluetoothVCardComposer"

    const-string v1, "mCursor == null"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    const-string v0, "Failed to get database information"

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mErrorReason:Ljava/lang/String;

    .line 529
    const/4 v0, 0x0

    goto/16 :goto_1

    .line 521
    :cond_4
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->CONTACTS_PROJECTION:[Ljava/lang/String;

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    goto :goto_3

    .line 532
    :cond_5
    invoke-virtual {p0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->getCount()I

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_7

    .line 533
    :cond_6
    const-string v0, "BluetoothVCardComposer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getCount()="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->getCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 535
    :try_start_0
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 539
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    .line 540
    const-string v0, "There\'s no exportable in the database"

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mErrorReason:Ljava/lang/String;

    .line 542
    :goto_4
    const/4 v0, 0x0

    goto/16 :goto_1

    .line 536
    :catch_0
    move-exception v6

    .line 537
    .local v6, e:Landroid/database/sqlite/SQLiteException;
    :try_start_1
    const-string v0, "BluetoothVCardComposer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SQLiteException on Cursor#close(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 539
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    .line 540
    const-string v0, "There\'s no exportable in the database"

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mErrorReason:Ljava/lang/String;

    goto :goto_4

    .line 539
    .end local v6           #e:Landroid/database/sqlite/SQLiteException;
    :catchall_0
    move-exception v0

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    .line 540
    const-string v1, "There\'s no exportable in the database"

    iput-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mErrorReason:Ljava/lang/String;

    throw v0

    .line 545
    :cond_7
    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsCallLogComposer:Z

    if-eqz v0, :cond_8

    .line 546
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIdColumn:I

    .line 551
    :goto_5
    const/4 v0, 0x1

    goto/16 :goto_1

    .line 548
    :cond_8
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    const-string v1, "_id"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIdColumn:I

    goto :goto_5
.end method

.method public isAfterLast()Z
    .locals 1

    .prologue
    .line 830
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    if-nez v0, :cond_0

    .line 831
    const/4 v0, 0x0

    .line 833
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    goto :goto_0
.end method

.method public movePosition(I)Z
    .locals 1
    .parameter "position"

    .prologue
    .line 2209
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 2210
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v0

    .line 2212
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setVCardAttribFilter(J)V
    .locals 3
    .parameter "filter"

    .prologue
    .line 2216
    const-string v0, "BluetoothVCardComposer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[API] setVCardAttribFilter("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2217
    iput-wide p1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mFilter:J

    .line 2218
    return-void
.end method

.method public terminate()V
    .locals 6

    .prologue
    .line 799
    iget-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mHandlerList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;

    .line 800
    .local v1, handler:Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;
    invoke-interface {v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;->onTerminate()V

    goto :goto_0

    .line 803
    .end local v1           #handler:Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;
    :cond_0
    iget-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    if-eqz v3, :cond_1

    .line 805
    :try_start_0
    iget-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 809
    :goto_1
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCursor:Landroid/database/Cursor;

    .line 812
    :cond_1
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mTerminateIsCalled:Z

    .line 813
    return-void

    .line 806
    :catch_0
    move-exception v0

    .line 807
    .local v0, e:Landroid/database/sqlite/SQLiteException;
    const-string v3, "BluetoothVCardComposer"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SQLiteException on Cursor#close(): "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method
