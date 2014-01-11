.class public Lcom/mediatek/phone/provider/CallHistoryContentProvider;
.super Landroid/content/ContentProvider;
.source "CallHistoryContentProvider.java"


# static fields
.field private static final CALLS:I = 0x1

.field private static final CALLSPROJECTIONMAP:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final COUNTRY_ISOS:I = 0x2

.field private static final URIMATCHER:Landroid/content/UriMatcher;


# instance fields
.field private mDbHelper:Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 38
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->URIMATCHER:Landroid/content/UriMatcher;

    .line 40
    sget-object v0, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->URIMATCHER:Landroid/content/UriMatcher;

    const-string v1, "call_history"

    const-string v2, "calls"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 41
    sget-object v0, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->URIMATCHER:Landroid/content/UriMatcher;

    const-string v1, "call_history"

    const-string v2, "country_isos"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 47
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->CALLSPROJECTIONMAP:Ljava/util/HashMap;

    .line 48
    sget-object v0, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->CALLSPROJECTIONMAP:Ljava/util/HashMap;

    const-string v1, "_id"

    const-string v2, "_id"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    sget-object v0, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->CALLSPROJECTIONMAP:Ljava/util/HashMap;

    const-string v1, "number"

    const-string v2, "number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    sget-object v0, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->CALLSPROJECTIONMAP:Ljava/util/HashMap;

    const-string v1, "date"

    const-string v2, "date"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    sget-object v0, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->CALLSPROJECTIONMAP:Ljava/util/HashMap;

    const-string v1, "country_iso"

    const-string v2, "country_iso"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    sget-object v0, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->CALLSPROJECTIONMAP:Ljava/util/HashMap;

    const-string v1, "area_code"

    const-string v2, "area_code"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    sget-object v0, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->CALLSPROJECTIONMAP:Ljava/util/HashMap;

    const-string v1, "confirm"

    const-string v2, "confirm"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 6
    .parameter "uri"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    .line 134
    new-instance v2, Lcom/mediatek/phone/provider/SelectionBuilder;

    invoke-direct {v2, p2}, Lcom/mediatek/phone/provider/SelectionBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .local v2, selectionBuilder:Lcom/mediatek/phone/provider/SelectionBuilder;
    iget-object v3, p0, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->mDbHelper:Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;

    invoke-virtual {v3}, Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 137
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    sget-object v3, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->URIMATCHER:Landroid/content/UriMatcher;

    invoke-virtual {v3, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v1

    .line 138
    .local v1, matchedUriId:I
    packed-switch v1, :pswitch_data_0

    .line 142
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Cannot delete that URL: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 140
    :pswitch_0
    const-string v3, "calls"

    invoke-virtual {v2}, Lcom/mediatek/phone/provider/SelectionBuilder;->build()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    return v3

    .line 138
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method protected getDatabaseHelperInstance(Landroid/content/Context;)Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;
    .locals 1
    .parameter "context"

    .prologue
    .line 59
    invoke-static {p1}, Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;->getInstance(Landroid/content/Context;)Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;

    move-result-object v0

    .line 60
    .local v0, dbHelper:Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;
    return-object v0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 4
    .parameter "uri"

    .prologue
    .line 97
    sget-object v1, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->URIMATCHER:Landroid/content/UriMatcher;

    invoke-virtual {v1, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    .line 98
    .local v0, match:I
    packed-switch v0, :pswitch_data_0

    .line 103
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown URI: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 101
    :pswitch_0
    const-string v1, "vnd.android.cursor.dir/calls"

    return-object v1

    .line 98
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 5
    .parameter "uri"
    .parameter "values"

    .prologue
    .line 109
    iget-object v3, p0, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->mDbHelper:Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;

    invoke-virtual {v3}, Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 110
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v3, "calls"

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v1

    .line 111
    .local v1, id:J
    invoke-static {p1, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v3

    return-object v3
.end method

.method public onCreate()Z
    .locals 2

    .prologue
    .line 65
    invoke-virtual {p0}, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 66
    .local v0, context:Landroid/content/Context;
    invoke-virtual {p0, v0}, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->getDatabaseHelperInstance(Landroid/content/Context;)Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->mDbHelper:Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;

    .line 67
    const/4 v1, 0x1

    return v1
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 14
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "sortOrder"

    .prologue
    .line 74
    new-instance v13, Lcom/mediatek/phone/provider/SelectionBuilder;

    move-object/from16 v0, p3

    invoke-direct {v13, v0}, Lcom/mediatek/phone/provider/SelectionBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .local v13, selectionBuilder:Lcom/mediatek/phone/provider/SelectionBuilder;
    const/4 v2, 0x0

    .line 77
    .local v2, distinct:Z
    sget-object v3, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->URIMATCHER:Landroid/content/UriMatcher;

    invoke-virtual {v3, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v12

    .line 78
    .local v12, match:I
    packed-switch v12, :pswitch_data_0

    .line 86
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown URL "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 82
    :pswitch_0
    const/4 v2, 0x1

    .line 89
    :pswitch_1
    iget-object v3, p0, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->mDbHelper:Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;

    invoke-virtual {v3}, Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 90
    .local v1, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v3, "calls"

    invoke-virtual {v13}, Lcom/mediatek/phone/provider/SelectionBuilder;->build()Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x0

    move-object/from16 v4, p2

    move-object/from16 v6, p4

    move-object/from16 v9, p5

    invoke-virtual/range {v1 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 92
    .local v11, c:Landroid/database/Cursor;
    return-object v11

    .line 78
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 6
    .parameter "uri"
    .parameter "values"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    .line 117
    new-instance v2, Lcom/mediatek/phone/provider/SelectionBuilder;

    invoke-direct {v2, p3}, Lcom/mediatek/phone/provider/SelectionBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .local v2, selectionBuilder:Lcom/mediatek/phone/provider/SelectionBuilder;
    iget-object v3, p0, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->mDbHelper:Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;

    invoke-virtual {v3}, Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 120
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    sget-object v3, Lcom/mediatek/phone/provider/CallHistoryContentProvider;->URIMATCHER:Landroid/content/UriMatcher;

    invoke-virtual {v3, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v1

    .line 121
    .local v1, matchedUriId:I
    packed-switch v1, :pswitch_data_0

    .line 126
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Cannot update URL: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 129
    :pswitch_0
    const-string v3, "calls"

    invoke-virtual {v2}, Lcom/mediatek/phone/provider/SelectionBuilder;->build()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, p2, v4, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    return v3

    .line 121
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
