.class public Lcom/mediatek/settings/ext/OmacpApn;
.super Ljava/lang/Object;
.source "OmacpApn.java"


# static fields
.field protected static final APN_ID_INDEX:I = 0x11

.field protected static final APN_INDEX:I = 0x2

.field protected static final AUTH_TYPE_INDEX:I = 0xe

.field protected static final ID_INDEX:I = 0x0

.field protected static final MCC_INDEX:I = 0x9

.field protected static final MMSC_INDEX:I = 0x8

.field protected static final MMSPORT_INDEX:I = 0xd

.field protected static final MMSPROXY_INDEX:I = 0xc

.field protected static final MNC_INDEX:I = 0xa

.field protected static final NAME_INDEX:I = 0x1

.field protected static final NAP_ID_INDEX:I = 0x12

.field protected static final NUMERIC_INDEX:I = 0xb

.field protected static final PASSWORD_INDEX:I = 0x7

.field protected static final PORT_INDEX:I = 0x4

.field protected static final PROJECTION:[Ljava/lang/String; = null

.field protected static final PROXY_ID_INDEX:I = 0x13

.field protected static final PROXY_INDEX:I = 0x3

.field protected static final SERVER_INDEX:I = 0x6

.field private static final SIM_CARD_1:I = 0x0

.field private static final SIM_CARD_2:I = 0x1

.field private static final SIM_CARD_SINGLE:I = 0x2

.field protected static final SOURCE_TYPE_INDEX:I = 0x10

.field private static final TAG:Ljava/lang/String; = "omacp"

.field protected static final TYPE_INDEX:I = 0xf

.field protected static final USER_INDEX:I = 0x5


# instance fields
.field private mContentResolver:Landroid/content/ContentResolver;

.field private mContext:Landroid/content/Context;

.field private mNumeric:Ljava/lang/String;

.field private mSimId:I

.field private mUri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 38
    const/16 v0, 0x14

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "name"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "apn"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "proxy"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "port"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "user"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "server"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "password"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "mmsc"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "mcc"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "mnc"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "numeric"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "mmsproxy"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "mmsport"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "authtype"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "type"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "sourcetype"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "omacpid"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "napid"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "proxyid"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mediatek/settings/ext/OmacpApn;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .parameter "context"
    .parameter "simId"

    .prologue
    .line 83
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 85
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/settings/ext/OmacpApn;->mContentResolver:Landroid/content/ContentResolver;

    .line 86
    iput p2, p0, Lcom/mediatek/settings/ext/OmacpApn;->mSimId:I

    .line 88
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILandroid/net/Uri;Ljava/lang/String;)V
    .locals 1
    .parameter "context"
    .parameter "simId"
    .parameter "uri"
    .parameter "numeric"

    .prologue
    .line 90
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 92
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/settings/ext/OmacpApn;->mContentResolver:Landroid/content/ContentResolver;

    .line 93
    iput p2, p0, Lcom/mediatek/settings/ext/OmacpApn;->mSimId:I

    .line 94
    iput-object p3, p0, Lcom/mediatek/settings/ext/OmacpApn;->mUri:Landroid/net/Uri;

    .line 95
    iput-object p4, p0, Lcom/mediatek/settings/ext/OmacpApn;->mNumeric:Ljava/lang/String;

    .line 96
    return-void
.end method


# virtual methods
.method public bulkInsert(Landroid/content/Context;[Landroid/content/ContentValues;)Z
    .locals 6
    .parameter "context"
    .parameter "values"

    .prologue
    .line 209
    const/4 v3, 0x0

    .line 210
    .local v3, success:Z
    const/4 v2, 0x0

    .line 212
    .local v2, rows:I
    const/4 v0, 0x0

    .line 214
    .local v0, cursor:Landroid/database/Cursor;
    :try_start_0
    iget-object v4, p0, Lcom/mediatek/settings/ext/OmacpApn;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v5, p0, Lcom/mediatek/settings/ext/OmacpApn;->mUri:Landroid/net/Uri;

    invoke-virtual {v4, v5, p2}, Landroid/content/ContentResolver;->bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 215
    if-lez v2, :cond_0

    .line 216
    const/4 v3, 0x1

    .line 221
    :cond_0
    if-eqz v0, :cond_1

    .line 222
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 226
    :cond_1
    :goto_0
    return v3

    .line 218
    :catch_0
    move-exception v1

    .line 219
    .local v1, e:Landroid/database/SQLException;
    :try_start_1
    const-string v4, "omacp"

    const-string v5, "Database operation: bulkInsert() failed!"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 221
    if-eqz v0, :cond_1

    .line 222
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 221
    .end local v1           #e:Landroid/database/SQLException;
    :catchall_0
    move-exception v4

    if-eqz v0, :cond_2

    .line 222
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v4
.end method

.method public getExistOmacpId()Ljava/util/ArrayList;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 128
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 129
    .local v7, mOmacpIdSet:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 132
    .local v8, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "numeric=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/settings/ext/OmacpApn;->mNumeric:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " and omacpid<>\'\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 134
    .local v3, where:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/settings/ext/OmacpApn;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/mediatek/settings/ext/OmacpApn;->mUri:Landroid/net/Uri;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const-string v4, "_id"

    aput-object v4, v2, v9

    const-string v4, "omacpid"

    aput-object v4, v2, v10

    const/4 v4, 0x0

    const-string v5, "name ASC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 141
    .local v6, cursor:Landroid/database/Cursor;
    if-eqz v6, :cond_1

    .line 142
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 143
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_0

    .line 144
    invoke-interface {v6, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v6, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 146
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 148
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 151
    :cond_1
    return-object v7
.end method

.method public insert(Landroid/content/Context;Landroid/content/ContentValues;)J
    .locals 7
    .parameter "context"
    .parameter "values"

    .prologue
    .line 231
    const/4 v2, 0x0

    .line 232
    .local v2, id:Ljava/lang/String;
    const/4 v0, 0x0

    .line 234
    .local v0, cursor:Landroid/database/Cursor;
    :try_start_0
    iget-object v4, p0, Lcom/mediatek/settings/ext/OmacpApn;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v5, p0, Lcom/mediatek/settings/ext/OmacpApn;->mUri:Landroid/net/Uri;

    invoke-virtual {v4, v5, p2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v3

    .line 235
    .local v3, newRow:Landroid/net/Uri;
    if-eqz v3, :cond_0

    .line 236
    const-string v4, "omacp"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "uri = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    invoke-virtual {v3}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_0

    .line 238
    invoke-virtual {v3}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 245
    :cond_0
    if-eqz v0, :cond_1

    .line 246
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 249
    .end local v3           #newRow:Landroid/net/Uri;
    :cond_1
    :goto_0
    if-eqz v2, :cond_3

    .line 250
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 252
    :goto_1
    return-wide v4

    .line 242
    :catch_0
    move-exception v1

    .line 243
    .local v1, e:Landroid/database/SQLException;
    :try_start_1
    const-string v4, "omacp"

    const-string v5, "insert SQLException happened!"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 245
    if-eqz v0, :cond_1

    .line 246
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 245
    .end local v1           #e:Landroid/database/SQLException;
    :catchall_0
    move-exception v4

    if-eqz v0, :cond_2

    .line 246
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v4

    .line 252
    :cond_3
    const-wide/16 v4, -0x1

    goto :goto_1
.end method

.method public query()Ljava/util/ArrayList;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    const/4 v13, 0x5

    const/4 v12, 0x4

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    .line 157
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "numeric=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/settings/ext/OmacpApn;->mNumeric:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 159
    .local v3, where:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/settings/ext/OmacpApn;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/mediatek/settings/ext/OmacpApn;->mUri:Landroid/net/Uri;

    sget-object v2, Lcom/mediatek/settings/ext/OmacpApn;->PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "name ASC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 168
    .local v7, cursor:Landroid/database/Cursor;
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 169
    .local v8, mApnList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    if-eqz v7, :cond_1

    .line 170
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 171
    :goto_0
    invoke-interface {v7}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_0

    .line 172
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 174
    .local v6, apnProp:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v0, Lcom/mediatek/settings/ext/OmacpApn;->PROJECTION:[Ljava/lang/String;

    aget-object v0, v0, v9

    invoke-interface {v7, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    sget-object v0, Lcom/mediatek/settings/ext/OmacpApn;->PROJECTION:[Ljava/lang/String;

    aget-object v0, v0, v10

    invoke-interface {v7, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    sget-object v0, Lcom/mediatek/settings/ext/OmacpApn;->PROJECTION:[Ljava/lang/String;

    aget-object v0, v0, v11

    invoke-interface {v7, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    sget-object v0, Lcom/mediatek/settings/ext/OmacpApn;->PROJECTION:[Ljava/lang/String;

    aget-object v0, v0, v12

    invoke-interface {v7, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    sget-object v0, Lcom/mediatek/settings/ext/OmacpApn;->PROJECTION:[Ljava/lang/String;

    aget-object v0, v0, v13

    invoke-interface {v7, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    sget-object v0, Lcom/mediatek/settings/ext/OmacpApn;->PROJECTION:[Ljava/lang/String;

    const/4 v1, 0x6

    aget-object v0, v0, v1

    const/4 v1, 0x6

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    sget-object v0, Lcom/mediatek/settings/ext/OmacpApn;->PROJECTION:[Ljava/lang/String;

    const/4 v1, 0x7

    aget-object v0, v0, v1

    const/4 v1, 0x7

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    sget-object v0, Lcom/mediatek/settings/ext/OmacpApn;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0xc

    aget-object v0, v0, v1

    const/16 v1, 0xc

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    sget-object v0, Lcom/mediatek/settings/ext/OmacpApn;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0xd

    aget-object v0, v0, v1

    const/16 v1, 0xd

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    sget-object v0, Lcom/mediatek/settings/ext/OmacpApn;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0x8

    aget-object v0, v0, v1

    const/16 v1, 0x8

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    sget-object v0, Lcom/mediatek/settings/ext/OmacpApn;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0x9

    aget-object v0, v0, v1

    const/16 v1, 0xa

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    sget-object v0, Lcom/mediatek/settings/ext/OmacpApn;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0xe

    aget-object v0, v0, v1

    const/16 v1, 0xe

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    sget-object v0, Lcom/mediatek/settings/ext/OmacpApn;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0xf

    aget-object v0, v0, v1

    const/16 v1, 0xf

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 190
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    goto/16 :goto_0

    .line 192
    .end local v6           #apnProp:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 195
    :cond_1
    return-object v8
.end method

.method public setCurrentApn(Landroid/content/Context;ILandroid/net/Uri;)I
    .locals 6
    .parameter "context"
    .parameter "id"
    .parameter "preferedUri"

    .prologue
    .line 258
    const/4 v1, 0x0

    .line 259
    .local v1, rows:I
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 260
    .local v2, values:Landroid/content/ContentValues;
    const-string v3, "apn_id"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 262
    :try_start_0
    iget-object v3, p0, Lcom/mediatek/settings/ext/OmacpApn;->mContentResolver:Landroid/content/ContentResolver;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v3, p3, v2, v4, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 266
    :goto_0
    return v1

    .line 263
    :catch_0
    move-exception v0

    .line 264
    .local v0, e:Landroid/database/SQLException;
    const-string v3, "omacp"

    const-string v4, "setCurrentApn SQLException happened!"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
