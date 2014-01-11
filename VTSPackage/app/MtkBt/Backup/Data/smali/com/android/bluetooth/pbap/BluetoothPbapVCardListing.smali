.class public Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;
.super Ljava/lang/Object;
.source "BluetoothPbapVCardListing.java"


# static fields
.field public static final DEBUG:Z = true

.field private static final PB_NAME_PROJECTION:[Ljava/lang/String; = null

.field static final PB_NUMBER_PROJECTION:[Ljava/lang/String; = null

.field private static final PB_PROJECTION:[Ljava/lang/String; = null

.field private static final TAG:Ljava/lang/String; = "BluetoothPbapVCardListing"

.field private static final VCARD_LISTING_BEGIN:Ljava/lang/String; = "<?xml version=\"1.0\"?><!DOCTYPE vcard-listing SYSTEM \"vcard-listing.dtd\"><vCard-listing version=\"1.0\">"

.field private static final VCARD_LISTING_END:Ljava/lang/String; = "</vCard-listing>"

.field public static final VCARD_ORDER_ALPHA:I = 0x0

.field public static final VCARD_ORDER_DEFAULT:I = 0x0

.field public static final VCARD_ORDER_INDEX:I = 0x1

.field public static final VCARD_ORDER_PHONETICAL:I = 0x2

.field public static final VCARD_SEARCH_DEFAULT:I = 0x0

.field public static final VCARD_SEARCH_NAME:I = 0x0

.field public static final VCARD_SEARCH_NUMBER:I = 0x1

.field public static final VCARD_SEARCH_SOUND:I = 0x2


# instance fields
.field private mContext:Landroid/content/Context;

.field private mCursor:Landroid/database/Cursor;

.field private mDirty:Z

.field private mIDList:[Ljava/lang/Long;

.field private mIOTSolutionOn:Z

.field private mLocalName:Ljava/lang/String;

.field private mLocalNum:Ljava/lang/String;

.field private mResultPath:Ljava/lang/String;

.field private mSearchAttrib:I

.field private mSearchValue:Ljava/lang/String;

.field private mSimAdn:Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;

.field private mSimDirty:Z

.field private mSimIDList:[Ljava/lang/Long;

.field private mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 87
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v2

    const-string v1, "display_name"

    aput-object v1, v0, v3

    sput-object v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->PB_PROJECTION:[Ljava/lang/String;

    .line 92
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "contact_id"

    aput-object v1, v0, v2

    const-string v1, "display_name"

    aput-object v1, v0, v3

    sput-object v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->PB_NUMBER_PROJECTION:[Ljava/lang/String;

    .line 97
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "display_name"

    aput-object v1, v0, v2

    sput-object v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->PB_NAME_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 3
    .parameter "context"
    .parameter "localName"
    .parameter "localNum"
    .parameter "iotSolutionOn"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 137
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 102
    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mLocalName:Ljava/lang/String;

    .line 104
    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mLocalNum:Ljava/lang/String;

    .line 106
    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mCursor:Landroid/database/Cursor;

    .line 108
    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mContext:Landroid/content/Context;

    .line 110
    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    .line 112
    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mResultPath:Ljava/lang/String;

    .line 114
    iput-boolean v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mDirty:Z

    .line 117
    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIDList:[Ljava/lang/Long;

    .line 120
    iput-boolean v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimDirty:Z

    .line 123
    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimIDList:[Ljava/lang/Long;

    .line 127
    iput v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchAttrib:I

    .line 129
    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchValue:Ljava/lang/String;

    .line 133
    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimAdn:Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;

    .line 135
    iput-boolean v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIOTSolutionOn:Z

    .line 138
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BluetoothPbapVCardListing : localName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", localNum="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 139
    iput-object p2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mLocalName:Ljava/lang/String;

    .line 140
    iput-object p3, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mLocalNum:Ljava/lang/String;

    .line 141
    iput-object p1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mContext:Landroid/content/Context;

    .line 142
    new-instance v0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;

    invoke-direct {v0, p1}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimAdn:Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;

    .line 143
    iput-boolean p4, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIOTSolutionOn:Z

    .line 144
    return-void
.end method

.method private errorLog(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 740
    const-string v0, "BluetoothPbapVCardListing"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 741
    return-void
.end method

.method private genIDList(II)Ljava/lang/String;
    .locals 5
    .parameter "offset"
    .parameter "count"

    .prologue
    .line 333
    const/4 v1, 0x0

    .line 334
    .local v1, idList:Ljava/lang/String;
    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIDList:[Ljava/lang/Long;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIDList:[Ljava/lang/Long;

    array-length v2, v2

    add-int v3, p1, p2

    if-lt v2, v3, :cond_2

    .line 335
    new-instance v1, Ljava/lang/String;

    .end local v1           #idList:Ljava/lang/String;
    const-string v2, "("

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 337
    .restart local v1       #idList:Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, p2, :cond_0

    .line 338
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIDList:[Ljava/lang/Long;

    add-int v4, v0, p1

    aget-object v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 339
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 337
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 341
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2c

    if-ne v2, v3, :cond_1

    .line 342
    const/4 v2, 0x0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 344
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 346
    .end local v0           #i:I
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[API] genIDList("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 347
    return-object v1
.end method

.method private genSimIDList(II)Ljava/lang/String;
    .locals 5
    .parameter "offset"
    .parameter "count"

    .prologue
    .line 351
    const/4 v1, 0x0

    .line 352
    .local v1, idList:Ljava/lang/String;
    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimIDList:[Ljava/lang/Long;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimIDList:[Ljava/lang/Long;

    array-length v2, v2

    add-int v3, p1, p2

    if-lt v2, v3, :cond_2

    .line 353
    new-instance v1, Ljava/lang/String;

    .end local v1           #idList:Ljava/lang/String;
    const-string v2, "("

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 355
    .restart local v1       #idList:Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, p2, :cond_0

    .line 356
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimIDList:[Ljava/lang/Long;

    add-int v4, v0, p1

    aget-object v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 357
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 355
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 359
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2c

    if-ne v2, v3, :cond_1

    .line 360
    const/4 v2, 0x0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 362
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 364
    .end local v0           #i:I
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[API] genSimIDList("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 365
    return-object v1
.end method

.method private getOwnerName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 322
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mLocalName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 323
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mLocalName:Ljava/lang/String;

    .line 328
    :goto_0
    return-object v0

    .line 324
    :cond_0
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mLocalNum:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 325
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mLocalNum:Ljava/lang/String;

    goto :goto_0

    .line 327
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getOwnerName : name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mLocalName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", num="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mLocalNum:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 328
    new-instance v0, Ljava/lang/String;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private isSameAttribute(ILjava/lang/String;)Z
    .locals 2
    .parameter "searchAttr"
    .parameter "searchVal"

    .prologue
    .line 715
    const/4 v0, 0x1

    .line 717
    .local v0, b:Z
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchValue:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 718
    :cond_0
    iget v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchAttrib:I

    if-ne p1, v1, :cond_1

    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchValue:Ljava/lang/String;

    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 719
    :cond_1
    const/4 v0, 0x0

    .line 722
    :cond_2
    return v0
.end method

.method private listCallLog(IIIILjava/lang/String;Ljava/util/ArrayList;)I
    .locals 11
    .parameter "type"
    .parameter "listOffset"
    .parameter "maxListCount"
    .parameter "searchAttrib"
    .parameter "searchVal"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 610
    .local p6, result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/16 v10, 0xa0

    .line 611
    .local v10, ret:I
    sget-object v2, Landroid/provider/CallLog$Calls;->CONTENT_URI:Landroid/net/Uri;

    .line 612
    .local v2, myUri:Landroid/net/Uri;
    const/4 v8, 0x0

    .line 613
    .local v8, cursor:Landroid/database/Cursor;
    const/4 v4, 0x0

    .line 614
    .local v4, selection:Ljava/lang/String;
    const/4 v1, 0x2

    new-array v3, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v5, "name"

    aput-object v5, v3, v1

    const/4 v1, 0x1

    const-string v5, "number"

    aput-object v5, v3, v1

    .line 619
    .local v3, projection:[Ljava/lang/String;
    const-string v1, "[API] listCallLog"

    invoke-direct {p0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 620
    packed-switch p1, :pswitch_data_0

    .line 633
    const/16 v1, 0xc0

    .line 687
    :cond_0
    :goto_0
    return v1

    .line 622
    :pswitch_0
    const-string v4, "type=1"

    .line 636
    :goto_1
    :pswitch_1
    invoke-static/range {p5 .. p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 637
    if-eqz v4, :cond_4

    .line 638
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, " AND "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 642
    :goto_2
    const/4 v1, 0x1

    if-eq p4, v1, :cond_5

    .line 643
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "name LIKE \'%"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p5

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "%\'"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 648
    :cond_1
    :goto_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "selection is "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 650
    const/4 v9, 0x0

    .line 651
    .local v9, num:Ljava/lang/String;
    const/4 v7, 0x0

    .line 652
    .local v7, callSize:I
    :try_start_0
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v5, 0x0

    const-string v6, "date DESC"

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 654
    if-eqz v8, :cond_a

    .line 655
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v7

    .line 656
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "callSize=="

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 657
    if-gt v7, p2, :cond_6

    .line 658
    const/16 v10, 0xc4

    .line 683
    :cond_2
    if-eqz v8, :cond_3

    .line 684
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_3
    move v1, v10

    .line 687
    goto/16 :goto_0

    .line 625
    .end local v7           #callSize:I
    .end local v9           #num:Ljava/lang/String;
    :pswitch_2
    const-string v4, "type=2"

    .line 626
    goto/16 :goto_1

    .line 628
    :pswitch_3
    const-string v4, "type=3"

    .line 629
    goto/16 :goto_1

    .line 640
    :cond_4
    new-instance v4, Ljava/lang/String;

    .end local v4           #selection:Ljava/lang/String;
    invoke-direct {v4}, Ljava/lang/String;-><init>()V

    .restart local v4       #selection:Ljava/lang/String;
    goto :goto_2

    .line 645
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "number LIKE \'%"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p5

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "%\'"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_3

    .line 664
    .restart local v7       #callSize:I
    .restart local v9       #num:Ljava/lang/String;
    :cond_6
    :try_start_1
    invoke-interface {v8, p2}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 665
    :goto_4
    if-lez p3, :cond_2

    invoke-interface {v8}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_2

    .line 666
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 667
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 668
    const/4 v1, 0x1

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 670
    :cond_7
    if-eqz v9, :cond_8

    .line 671
    move-object/from16 v0, p6

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 675
    :goto_5
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    .line 676
    add-int/lit8 p3, p3, -0x1

    goto :goto_4

    .line 673
    :cond_8
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1}, Ljava/lang/String;-><init>()V

    move-object/from16 v0, p6

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_5

    .line 683
    :catchall_0
    move-exception v1

    if-eqz v8, :cond_9

    .line 684
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_9
    throw v1

    .line 680
    :cond_a
    const/16 v1, 0xd0

    .line 683
    if-eqz v8, :cond_0

    .line 684
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    .line 620
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_1
    .end packed-switch
.end method

.method private listPb(ZIILjava/util/ArrayList;)I
    .locals 18
    .parameter "relist"
    .parameter "listOffset"
    .parameter "maxListCount"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZII",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 370
    .local p4, result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 371
    .local v4, uri:Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    .line 372
    .local v3, resolver:Landroid/content/ContentResolver;
    const/4 v13, 0x0

    .line 373
    .local v13, cursor:Landroid/database/Cursor;
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchValue:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v17

    .line 374
    .local v17, ownerInc:Z
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "[API] listPb("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, p2

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, p3

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 376
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "SearchVal="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchValue:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", mSearchAttrib="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p0

    iget v8, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchAttrib:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 378
    if-nez v3, :cond_1

    .line 379
    :try_start_0
    const-string v7, "[ERR] resolver is null"

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->errorLog(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 380
    const/16 v7, 0xd0

    .line 483
    if-eqz v13, :cond_0

    .line 484
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    :cond_0
    :goto_0
    return v7

    .line 382
    :cond_1
    if-eqz v17, :cond_3

    .line 384
    if-nez p2, :cond_2

    .line 386
    :try_start_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Add owner name : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-direct/range {p0 .. p0}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->getOwnerName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 387
    invoke-direct/range {p0 .. p0}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->getOwnerName()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p4

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 388
    add-int/lit8 p3, p3, -0x1

    .line 390
    :cond_2
    if-lez p2, :cond_3

    .line 391
    add-int/lit8 p2, p2, -0x1

    .line 394
    :cond_3
    if-eqz p1, :cond_d

    .line 395
    const/4 v6, 0x0

    .line 396
    .local v6, selection:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIOTSolutionOn:Z

    if-nez v7, :cond_6

    .line 397
    const-string v6, "indicate_phone_or_sim_contact=-1"

    .line 401
    :goto_1
    const/4 v5, 0x0

    .line 402
    .local v5, projection:[Ljava/lang/String;
    const/16 v16, 0x0

    .line 403
    .local v16, idSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    const/4 v15, 0x0

    .line 405
    .local v15, idList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    const/4 v7, 0x0

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIDList:[Ljava/lang/Long;

    .line 406
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchValue:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_9

    .line 407
    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchAttrib:I

    const/4 v8, 0x1

    if-eq v7, v8, :cond_7

    .line 408
    sget-object v7, Landroid/provider/ContactsContract$Contacts;->CONTENT_FILTER_URI:Landroid/net/Uri;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchValue:Ljava/lang/String;

    invoke-static {v8}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 410
    sget-object v5, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->PB_PROJECTION:[Ljava/lang/String;

    .line 424
    :goto_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "selection="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 425
    const/4 v7, 0x0

    const-string v8, "upper(display_name)"

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 427
    if-eqz v13, :cond_c

    .line 428
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "get cursor successfully. count="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v13}, Landroid/database/Cursor;->getCount()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 430
    invoke-interface {v13}, Landroid/database/Cursor;->moveToFirst()Z

    .line 431
    new-instance v16, Ljava/util/HashSet;

    .end local v16           #idSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    invoke-direct/range {v16 .. v16}, Ljava/util/HashSet;-><init>()V

    .line 432
    .restart local v16       #idSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    new-instance v15, Ljava/util/ArrayList;

    .end local v15           #idList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 433
    .restart local v15       #idList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Retrieve data : listOffset="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, p2

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", maxListCount="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, p3

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 435
    :goto_3
    invoke-interface {v13}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v7

    if-nez v7, :cond_a

    .line 436
    const/4 v7, 0x0

    invoke-interface {v13, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 438
    const/4 v7, 0x0

    invoke-interface {v13, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v15, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 439
    if-lez p3, :cond_4

    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v7

    move/from16 v0, p2

    if-le v7, v0, :cond_4

    .line 440
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Add one record : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x1

    invoke-interface {v13, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ",ID:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v13, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 442
    const/4 v7, 0x1

    invoke-interface {v13, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p4

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 443
    add-int/lit8 p3, p3, -0x1

    .line 446
    :cond_4
    invoke-interface {v13}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    .line 483
    .end local v5           #projection:[Ljava/lang/String;
    .end local v6           #selection:Ljava/lang/String;
    .end local v15           #idList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .end local v16           #idSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    :catchall_0
    move-exception v7

    if-eqz v13, :cond_5

    .line 484
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    :cond_5
    throw v7

    .line 399
    .restart local v6       #selection:Ljava/lang/String;
    :cond_6
    :try_start_2
    const-string v6, ""

    goto/16 :goto_1

    .line 412
    .restart local v5       #projection:[Ljava/lang/String;
    .restart local v15       #idList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .restart local v16       #idSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    :cond_7
    sget-object v4, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    .line 413
    sget-object v5, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->PB_NUMBER_PROJECTION:[Ljava/lang/String;

    .line 414
    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIOTSolutionOn:Z

    if-nez v7, :cond_8

    .line 415
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " AND data1 LIKE \'%"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchValue:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "%\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_2

    .line 417
    :cond_8
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "data1 LIKE \'%"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchValue:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "%\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_2

    .line 421
    :cond_9
    sget-object v4, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 422
    sget-object v5, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->PB_PROJECTION:[Ljava/lang/String;

    goto/16 :goto_2

    .line 448
    :cond_a
    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Long;

    invoke-virtual {v15, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/Long;

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIDList:[Ljava/lang/Long;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 449
    const/16 v16, 0x0

    .line 450
    const/4 v15, 0x0

    .line 480
    .end local v5           #projection:[Ljava/lang/String;
    .end local v6           #selection:Ljava/lang/String;
    .end local v15           #idList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .end local v16           #idSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    :cond_b
    :goto_4
    const/16 v7, 0xa0

    .line 483
    if-eqz v13, :cond_0

    .line 484
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    .line 452
    .restart local v5       #projection:[Ljava/lang/String;
    .restart local v6       #selection:Ljava/lang/String;
    .restart local v15       #idList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .restart local v16       #idSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    :cond_c
    :try_start_3
    const-string v7, "Query id list failed"

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->errorLog(Ljava/lang/String;)V

    goto :goto_4

    .line 455
    .end local v5           #projection:[Ljava/lang/String;
    .end local v6           #selection:Ljava/lang/String;
    .end local v15           #idList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .end local v16           #idSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    :cond_d
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIDList:[Ljava/lang/Long;

    array-length v7, v7

    sub-int v7, v7, p2

    move/from16 v0, p3

    if-ge v7, v0, :cond_e

    .line 456
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIDList:[Ljava/lang/Long;

    array-length v7, v7

    sub-int v7, v7, p2

    if-lez v7, :cond_10

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIDList:[Ljava/lang/Long;

    array-length v7, v7

    sub-int p3, v7, p2

    .line 458
    :cond_e
    :goto_5
    if-eqz p3, :cond_b

    .line 459
    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->genIDList(II)Ljava/lang/String;

    move-result-object v14

    .line 460
    .local v14, idList:Ljava/lang/String;
    if-eqz v14, :cond_12

    .line 461
    sget-object v4, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 462
    sget-object v9, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->PB_NAME_PROJECTION:[Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "_id IN "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    const-string v12, "display_name"

    move-object v7, v3

    move-object v8, v4

    invoke-virtual/range {v7 .. v12}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 464
    if-eqz v13, :cond_f

    invoke-interface {v13}, Landroid/database/Cursor;->getCount()I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v7

    move/from16 v0, p3

    if-eq v7, v0, :cond_11

    .line 465
    :cond_f
    const/16 v7, 0xd0

    .line 483
    if-eqz v13, :cond_0

    .line 484
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    .line 456
    .end local v14           #idList:Ljava/lang/String;
    :cond_10
    const/16 p3, 0x0

    goto :goto_5

    .line 468
    .restart local v14       #idList:Ljava/lang/String;
    :cond_11
    :try_start_4
    invoke-interface {v13}, Landroid/database/Cursor;->moveToFirst()Z

    .line 469
    :goto_6
    invoke-interface {v13}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v7

    if-nez v7, :cond_b

    .line 470
    const-string v7, "Get record!!"

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 471
    const/4 v7, 0x0

    invoke-interface {v13, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p4

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 472
    invoke-interface {v13}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_6

    .line 476
    :cond_12
    const/16 v7, 0xc0

    .line 483
    if-eqz v13, :cond_0

    .line 484
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0
.end method

.method private listSimPb(ZIILjava/util/ArrayList;)I
    .locals 18
    .parameter "relist"
    .parameter "listOffset"
    .parameter "maxListCount"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZII",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 492
    .local p4, result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 493
    .local v4, uri:Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    .line 494
    .local v3, resolver:Landroid/content/ContentResolver;
    const/4 v13, 0x0

    .line 495
    .local v13, cursor:Landroid/database/Cursor;
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchValue:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v17

    .line 496
    .local v17, ownerInc:Z
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "[API] listSimPb("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, p2

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, p3

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 498
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "SearchVal="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchValue:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", mSearchAttrib="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p0

    iget v8, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchAttrib:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 500
    if-nez v3, :cond_1

    .line 501
    :try_start_0
    const-string v7, "[ERR] resolver is null"

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->errorLog(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 502
    const/16 v7, 0xd0

    .line 601
    if-eqz v13, :cond_0

    .line 602
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    :cond_0
    :goto_0
    return v7

    .line 504
    :cond_1
    if-eqz v17, :cond_3

    .line 506
    if-nez p2, :cond_2

    .line 508
    :try_start_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Add owner name : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-direct/range {p0 .. p0}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->getOwnerName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 509
    invoke-direct/range {p0 .. p0}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->getOwnerName()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p4

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 510
    add-int/lit8 p3, p3, -0x1

    .line 512
    :cond_2
    if-lez p2, :cond_3

    .line 513
    add-int/lit8 p2, p2, -0x1

    .line 516
    :cond_3
    if-eqz p1, :cond_c

    .line 517
    const/4 v6, 0x0

    .line 518
    .local v6, selection:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIOTSolutionOn:Z

    if-nez v7, :cond_6

    .line 519
    const-string v6, "indicate_phone_or_sim_contact>-1"

    .line 523
    :goto_1
    const/4 v5, 0x0

    .line 524
    .local v5, projection:[Ljava/lang/String;
    const/16 v16, 0x0

    .line 525
    .local v16, idSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    const/4 v15, 0x0

    .line 527
    .local v15, idList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    const/4 v7, 0x0

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimIDList:[Ljava/lang/Long;

    .line 528
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchValue:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_8

    .line 529
    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchAttrib:I

    const/4 v8, 0x1

    if-eq v7, v8, :cond_7

    .line 530
    sget-object v7, Landroid/provider/ContactsContract$Contacts;->CONTENT_FILTER_URI:Landroid/net/Uri;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchValue:Ljava/lang/String;

    invoke-static {v8}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 532
    sget-object v5, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->PB_PROJECTION:[Ljava/lang/String;

    .line 542
    :goto_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "selection="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 543
    const/4 v7, 0x0

    const-string v8, "upper(display_name)"

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 545
    if-eqz v13, :cond_b

    .line 546
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "get cursor successfully. count="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v13}, Landroid/database/Cursor;->getCount()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 548
    invoke-interface {v13}, Landroid/database/Cursor;->moveToFirst()Z

    .line 549
    new-instance v16, Ljava/util/HashSet;

    .end local v16           #idSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    invoke-direct/range {v16 .. v16}, Ljava/util/HashSet;-><init>()V

    .line 550
    .restart local v16       #idSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    new-instance v15, Ljava/util/ArrayList;

    .end local v15           #idList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 551
    .restart local v15       #idList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Retrieve data : listOffset="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, p2

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", maxListCount="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, p3

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 553
    :goto_3
    invoke-interface {v13}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v7

    if-nez v7, :cond_9

    .line 554
    const/4 v7, 0x0

    invoke-interface {v13, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 556
    const/4 v7, 0x0

    invoke-interface {v13, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v15, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 557
    if-lez p3, :cond_4

    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v7

    move/from16 v0, p2

    if-le v7, v0, :cond_4

    .line 558
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Add one record : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x1

    invoke-interface {v13, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ",ID:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v13, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 560
    const/4 v7, 0x1

    invoke-interface {v13, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p4

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 561
    add-int/lit8 p3, p3, -0x1

    .line 564
    :cond_4
    invoke-interface {v13}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    .line 601
    .end local v5           #projection:[Ljava/lang/String;
    .end local v6           #selection:Ljava/lang/String;
    .end local v15           #idList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .end local v16           #idSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    :catchall_0
    move-exception v7

    if-eqz v13, :cond_5

    .line 602
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    :cond_5
    throw v7

    .line 521
    .restart local v6       #selection:Ljava/lang/String;
    :cond_6
    :try_start_2
    const-string v6, "in_visible_group=1000"

    goto/16 :goto_1

    .line 534
    .restart local v5       #projection:[Ljava/lang/String;
    .restart local v15       #idList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .restart local v16       #idSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    :cond_7
    sget-object v4, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    .line 535
    sget-object v5, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->PB_NUMBER_PROJECTION:[Ljava/lang/String;

    .line 536
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " AND data1 LIKE \'%"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchValue:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "%\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_2

    .line 539
    :cond_8
    sget-object v4, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 540
    sget-object v5, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->PB_PROJECTION:[Ljava/lang/String;

    goto/16 :goto_2

    .line 566
    :cond_9
    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Long;

    invoke-virtual {v15, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/Long;

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimIDList:[Ljava/lang/Long;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 567
    const/16 v16, 0x0

    .line 568
    const/4 v15, 0x0

    .line 598
    .end local v5           #projection:[Ljava/lang/String;
    .end local v6           #selection:Ljava/lang/String;
    .end local v15           #idList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .end local v16           #idSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    :cond_a
    :goto_4
    const/16 v7, 0xa0

    .line 601
    if-eqz v13, :cond_0

    .line 602
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    .line 570
    .restart local v5       #projection:[Ljava/lang/String;
    .restart local v6       #selection:Ljava/lang/String;
    .restart local v15       #idList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .restart local v16       #idSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    :cond_b
    :try_start_3
    const-string v7, "Query id list failed"

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->errorLog(Ljava/lang/String;)V

    goto :goto_4

    .line 573
    .end local v5           #projection:[Ljava/lang/String;
    .end local v6           #selection:Ljava/lang/String;
    .end local v15           #idList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .end local v16           #idSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    :cond_c
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimIDList:[Ljava/lang/Long;

    array-length v7, v7

    sub-int v7, v7, p2

    move/from16 v0, p3

    if-ge v7, v0, :cond_d

    .line 574
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimIDList:[Ljava/lang/Long;

    array-length v7, v7

    sub-int v7, v7, p2

    if-lez v7, :cond_f

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimIDList:[Ljava/lang/Long;

    array-length v7, v7

    sub-int p3, v7, p2

    .line 576
    :cond_d
    :goto_5
    if-eqz p3, :cond_a

    .line 577
    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->genSimIDList(II)Ljava/lang/String;

    move-result-object v14

    .line 578
    .local v14, idList:Ljava/lang/String;
    if-eqz v14, :cond_11

    .line 579
    sget-object v4, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 580
    sget-object v9, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->PB_NAME_PROJECTION:[Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "_id IN "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    const-string v12, "display_name"

    move-object v7, v3

    move-object v8, v4

    invoke-virtual/range {v7 .. v12}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 582
    if-eqz v13, :cond_e

    invoke-interface {v13}, Landroid/database/Cursor;->getCount()I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v7

    move/from16 v0, p3

    if-eq v7, v0, :cond_10

    .line 583
    :cond_e
    const/16 v7, 0xd0

    .line 601
    if-eqz v13, :cond_0

    .line 602
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    .line 574
    .end local v14           #idList:Ljava/lang/String;
    :cond_f
    const/16 p3, 0x0

    goto :goto_5

    .line 586
    .restart local v14       #idList:Ljava/lang/String;
    :cond_10
    :try_start_4
    invoke-interface {v13}, Landroid/database/Cursor;->moveToFirst()Z

    .line 587
    :goto_6
    invoke-interface {v13}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v7

    if-nez v7, :cond_a

    .line 588
    const-string v7, "Get record!!"

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 589
    const/4 v7, 0x0

    invoke-interface {v13, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p4

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 590
    invoke-interface {v13}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_6

    .line 594
    :cond_11
    const/16 v7, 0xc0

    .line 601
    if-eqz v13, :cond_0

    .line 602
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0
.end method

.method private openWriter()Z
    .locals 3

    .prologue
    .line 297
    const/4 v0, 0x1

    .line 298
    .local v0, ret:Z
    const-string v1, "[API] openWriter"

    invoke-direct {p0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 300
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    if-eqz v1, :cond_2

    .line 301
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    invoke-virtual {v1}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->terminate()V

    .line 306
    :goto_0
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    if-eqz v1, :cond_3

    .line 307
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->init(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 308
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    .line 309
    const/4 v0, 0x0

    .line 315
    :cond_0
    :goto_1
    if-nez v0, :cond_1

    .line 316
    const-string v1, "Failed to open PbapWriter"

    invoke-direct {p0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->errorLog(Ljava/lang/String;)V

    .line 318
    :cond_1
    return v0

    .line 303
    :cond_2
    new-instance v1, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    invoke-direct {v1}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;-><init>()V

    iput-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    goto :goto_0

    .line 312
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private printLog(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 735
    const-string v0, "BluetoothPbapVCardListing"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 737
    return-void
.end method


# virtual methods
.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mResultPath:Ljava/lang/String;

    return-object v0
.end method

.method public list(IIILjava/lang/String;II)I
    .locals 13
    .parameter "type"
    .parameter "order"
    .parameter "searchAttr"
    .parameter "searchVal"
    .parameter "listOffset"
    .parameter "maxListCount"

    .prologue
    .line 152
    const/4 v10, 0x1

    .line 153
    .local v10, ownerNotInc:I
    const/16 v12, 0xcc

    .line 154
    .local v12, ret:I
    const/4 v8, 0x0

    .line 156
    .local v8, result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "init("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p3

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p5

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p6

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 160
    invoke-direct {p0}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->openWriter()Z

    move-result v2

    if-nez v2, :cond_0

    .line 161
    const/16 v2, 0xd0

    .line 249
    :goto_0
    return v2

    .line 164
    :cond_0
    new-instance v8, Ljava/util/ArrayList;

    .end local v8           #result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 165
    .restart local v8       #result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-nez v8, :cond_1

    .line 166
    const-string v2, "Alloc result failed"

    invoke-direct {p0, v2}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->errorLog(Ljava/lang/String;)V

    .line 167
    const/16 v2, 0xd0

    goto :goto_0

    .line 171
    :cond_1
    packed-switch p1, :pswitch_data_0

    .line 221
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unsupported type="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->errorLog(Ljava/lang/String;)V

    .line 222
    const/16 v12, 0xc0

    .line 227
    :goto_1
    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    if-nez v2, :cond_a

    .line 228
    const/16 v12, 0xd0

    .line 248
    :goto_2
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    move v2, v12

    .line 249
    goto :goto_0

    .line 177
    :pswitch_0
    invoke-static/range {p4 .. p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 178
    const/4 v10, 0x0

    .line 180
    :cond_2
    iget-boolean v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mDirty:Z

    if-nez v2, :cond_3

    move/from16 v0, p3

    move-object/from16 v1, p4

    invoke-direct {p0, v0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->isSameAttribute(ILjava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 181
    :cond_3
    move/from16 v0, p3

    iput v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchAttrib:I

    .line 182
    move-object/from16 v0, p4

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchValue:Ljava/lang/String;

    .line 183
    const/4 v2, 0x1

    move/from16 v0, p5

    move/from16 v1, p6

    invoke-direct {p0, v2, v0, v1, v8}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->listPb(ZIILjava/util/ArrayList;)I

    move-result v12

    .line 184
    const/16 v2, 0xa0

    if-ne v12, v2, :cond_4

    .line 185
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mDirty:Z

    goto :goto_1

    .line 187
    :cond_4
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mDirty:Z

    goto :goto_1

    .line 190
    :cond_5
    const/4 v2, 0x0

    move/from16 v0, p5

    move/from16 v1, p6

    invoke-direct {p0, v2, v0, v1, v8}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->listPb(ZIILjava/util/ArrayList;)I

    move-result v12

    .line 192
    goto :goto_1

    :pswitch_1
    move-object v2, p0

    move v3, p1

    move/from16 v4, p5

    move/from16 v5, p6

    move/from16 v6, p3

    move-object/from16 v7, p4

    .line 197
    invoke-direct/range {v2 .. v8}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->listCallLog(IIIILjava/lang/String;Ljava/util/ArrayList;)I

    move-result v12

    .line 198
    goto :goto_1

    .line 204
    :pswitch_2
    invoke-static/range {p4 .. p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 205
    const/4 v10, 0x0

    .line 207
    :cond_6
    iget-boolean v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimDirty:Z

    if-nez v2, :cond_7

    move/from16 v0, p3

    move-object/from16 v1, p4

    invoke-direct {p0, v0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->isSameAttribute(ILjava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_9

    .line 208
    :cond_7
    move/from16 v0, p3

    iput v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchAttrib:I

    .line 209
    move-object/from16 v0, p4

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSearchValue:Ljava/lang/String;

    .line 210
    const/4 v2, 0x1

    move/from16 v0, p5

    move/from16 v1, p6

    invoke-direct {p0, v2, v0, v1, v8}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->listSimPb(ZIILjava/util/ArrayList;)I

    move-result v12

    .line 211
    const/16 v2, 0xa0

    if-ne v12, v2, :cond_8

    .line 212
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimDirty:Z

    goto/16 :goto_1

    .line 214
    :cond_8
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimDirty:Z

    goto/16 :goto_1

    .line 217
    :cond_9
    const/4 v2, 0x0

    move/from16 v0, p5

    move/from16 v1, p6

    invoke-direct {p0, v2, v0, v1, v8}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->listSimPb(ZIILjava/util/ArrayList;)I

    move-result v12

    .line 219
    goto/16 :goto_1

    .line 229
    :cond_a
    const/16 v2, 0xa0

    if-ne v12, v2, :cond_e

    .line 231
    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    const-string v3, "<?xml version=\"1.0\"?><!DOCTYPE vcard-listing SYSTEM \"vcard-listing.dtd\"><vCard-listing version=\"1.0\">"

    invoke-virtual {v2, v3}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->write(Ljava/lang/String;)Z

    move-result v11

    .line 232
    .local v11, r:Z
    const/4 v9, 0x0

    .local v9, i:I
    :goto_3
    if-eqz v11, :cond_b

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v9, v2, :cond_b

    .line 233
    iget-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "<card handle=\""

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    add-int v4, p5, v9

    add-int/2addr v4, v10

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ".vcf\" name=\""

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "\""

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "/>"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->write(Ljava/lang/String;)Z

    move-result v11

    .line 232
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 236
    :cond_b
    if-eqz v11, :cond_c

    .line 237
    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    const-string v3, "</vCard-listing>"

    invoke-virtual {v2, v3}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->write(Ljava/lang/String;)Z

    move-result v11

    .line 239
    :cond_c
    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    invoke-virtual {v2}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->terminate()V

    .line 240
    if-eqz v11, :cond_d

    .line 241
    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    invoke-virtual {v2}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->getPath()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mResultPath:Ljava/lang/String;

    goto/16 :goto_2

    .line 243
    :cond_d
    const/16 v12, 0xd0

    goto/16 :goto_2

    .line 246
    .end local v9           #i:I
    .end local v11           #r:Z
    :cond_e
    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    invoke-virtual {v2}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->terminate()V

    goto/16 :goto_2

    .line 171
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public queryPbID(I)J
    .locals 4
    .parameter "index"

    .prologue
    const/4 v3, 0x1

    const/4 v0, 0x0

    .line 257
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[API] queryPbID("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 258
    iget-boolean v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mDirty:Z

    if-eqz v1, :cond_0

    .line 263
    const/4 v1, 0x0

    invoke-direct {p0, v3, v3, v0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->listPb(ZIILjava/util/ArrayList;)I

    .line 265
    :cond_0
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIDList:[Ljava/lang/Long;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIDList:[Ljava/lang/Long;

    array-length v1, v1

    if-le v1, p1, :cond_1

    .line 266
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIDList:[Ljava/lang/Long;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 270
    :goto_0
    return-wide v0

    .line 268
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ERR] can not found id for index "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ". mIDList.length = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIDList:[Ljava/lang/Long;

    if-nez v2, :cond_2

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->errorLog(Ljava/lang/String;)V

    .line 270
    const-wide/16 v0, -0x1

    goto :goto_0

    .line 268
    :cond_2
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mIDList:[Ljava/lang/Long;

    array-length v0, v0

    goto :goto_1
.end method

.method public querySimPbID(I)J
    .locals 4
    .parameter "index"

    .prologue
    const/4 v3, 0x1

    const/4 v0, 0x0

    .line 274
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[API] querySimPbID("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->printLog(Ljava/lang/String;)V

    .line 275
    iget-boolean v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimDirty:Z

    if-eqz v1, :cond_0

    .line 280
    const/4 v1, 0x0

    invoke-direct {p0, v3, v3, v0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->listSimPb(ZIILjava/util/ArrayList;)I

    .line 282
    :cond_0
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimIDList:[Ljava/lang/Long;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimIDList:[Ljava/lang/Long;

    array-length v1, v1

    if-le v1, p1, :cond_1

    .line 283
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimIDList:[Ljava/lang/Long;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 287
    :goto_0
    return-wide v0

    .line 285
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ERR] can not found id for index "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ". mSimIDList.length = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimIDList:[Ljava/lang/Long;

    if-nez v2, :cond_2

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->errorLog(Ljava/lang/String;)V

    .line 287
    const-wide/16 v0, -0x1

    goto :goto_0

    .line 285
    :cond_2
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->mSimIDList:[Ljava/lang/Long;

    array-length v0, v0

    goto :goto_1
.end method
