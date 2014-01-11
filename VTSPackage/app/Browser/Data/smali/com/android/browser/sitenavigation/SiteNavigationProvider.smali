.class public Lcom/android/browser/sitenavigation/SiteNavigationProvider;
.super Landroid/content/ContentProvider;
.source "SiteNavigationProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;
    }
.end annotation


# static fields
.field private static final NOTIFICATION_URI:Landroid/net/Uri; = null

.field private static final S_URI_MATCHER:Landroid/content/UriMatcher; = null

.field private static final TABLE_WEB_SITES:Ljava/lang/String; = "websites"

.field private static final TAG:Ljava/lang/String; = "browser/SiteNavigationProvider"

.field private static final WEB_SITES_ALL:I = 0x0

.field private static final WEB_SITES_ID:I = 0x1


# instance fields
.field private mOpenHelper:Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 59
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider;->S_URI_MATCHER:Landroid/content/UriMatcher;

    .line 61
    sget-object v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider;->S_URI_MATCHER:Landroid/content/UriMatcher;

    const-string v1, "com.android.browser.site_navigation"

    const-string v2, "websites"

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 62
    sget-object v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider;->S_URI_MATCHER:Landroid/content/UriMatcher;

    const-string v1, "com.android.browser.site_navigation"

    const-string v2, "websites/#"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 65
    sget-object v0, Lcom/android/browser/sitenavigation/SiteNavigation;->SITE_NAVIGATION_URI:Landroid/net/Uri;

    sput-object v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider;->NOTIFICATION_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    .line 172
    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .parameter "uri"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    .line 71
    const/4 v0, 0x0

    return v0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .parameter "uri"

    .prologue
    .line 77
    const/4 v0, 0x0

    return-object v0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 1
    .parameter "uri"
    .parameter "values"

    .prologue
    .line 83
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()Z
    .locals 2

    .prologue
    .line 88
    new-instance v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;

    invoke-virtual {p0}, Lcom/android/browser/sitenavigation/SiteNavigationProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;-><init>(Lcom/android/browser/sitenavigation/SiteNavigationProvider;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/browser/sitenavigation/SiteNavigationProvider;->mOpenHelper:Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;

    .line 89
    const/4 v0, 0x1

    return v0
.end method

.method public openFile(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;
    .locals 8
    .parameter "uri"
    .parameter "mode"

    .prologue
    .line 160
    :try_start_0
    invoke-static {}, Landroid/os/ParcelFileDescriptor;->createPipe()[Landroid/os/ParcelFileDescriptor;

    move-result-object v7

    .line 161
    .local v7, pipes:[Landroid/os/ParcelFileDescriptor;
    const/4 v2, 0x1

    aget-object v1, v7, v2

    .line 162
    .local v1, write:Landroid/os/ParcelFileDescriptor;
    new-instance v0, Landroid/content/res/AssetFileDescriptor;

    const-wide/16 v2, 0x0

    const-wide/16 v4, -0x1

    invoke-direct/range {v0 .. v5}, Landroid/content/res/AssetFileDescriptor;-><init>(Landroid/os/ParcelFileDescriptor;JJ)V

    .line 163
    .local v0, afd:Landroid/content/res/AssetFileDescriptor;
    new-instance v2, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;

    invoke-virtual {p0}, Lcom/android/browser/sitenavigation/SiteNavigationProvider;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->createOutputStream()Ljava/io/FileOutputStream;

    move-result-object v4

    invoke-direct {v2, v3, p1, v4}, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;-><init>(Landroid/content/Context;Landroid/net/Uri;Ljava/io/OutputStream;)V

    invoke-virtual {v2}, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->start()V

    .line 165
    const/4 v2, 0x0

    aget-object v2, v7, v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    .end local v0           #afd:Landroid/content/res/AssetFileDescriptor;
    .end local v1           #write:Landroid/os/ParcelFileDescriptor;
    .end local v7           #pipes:[Landroid/os/ParcelFileDescriptor;
    :goto_0
    return-object v2

    .line 166
    :catch_0
    move-exception v6

    .line 167
    .local v6, e:Ljava/io/IOException;
    const-string v2, "browser/SiteNavigationProvider"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to handle request: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 168
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 9
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "sortOrder"

    .prologue
    const/4 v5, 0x0

    .line 95
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 96
    .local v0, qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "websites"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 98
    sget-object v2, Lcom/android/browser/sitenavigation/SiteNavigationProvider;->S_URI_MATCHER:Landroid/content/UriMatcher;

    invoke-virtual {v2, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 105
    const-string v2, "browser/SiteNavigationProvider"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "SiteNavigationProvider query Unknown URI: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    :goto_0
    return-object v5

    .line 102
    :pswitch_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v2

    const/4 v4, 0x0

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 110
    :pswitch_1
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 111
    const/4 v7, 0x0

    .line 117
    .local v7, orderBy:Ljava/lang/String;
    :goto_1
    iget-object v2, p0, Lcom/android/browser/sitenavigation/SiteNavigationProvider;->mOpenHelper:Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;

    invoke-virtual {v2}, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .local v1, db:Landroid/database/sqlite/SQLiteDatabase;
    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v6, v5

    .line 118
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 119
    .local v8, c:Landroid/database/Cursor;
    if-eqz v8, :cond_0

    .line 121
    invoke-virtual {p0}, Lcom/android/browser/sitenavigation/SiteNavigationProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lcom/android/browser/sitenavigation/SiteNavigationProvider;->NOTIFICATION_URI:Landroid/net/Uri;

    invoke-interface {v8, v2, v3}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    :cond_0
    move-object v5, v8

    .line 123
    goto :goto_0

    .line 113
    .end local v1           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v7           #orderBy:Ljava/lang/String;
    .end local v8           #c:Landroid/database/Cursor;
    :cond_1
    move-object v7, p5

    .restart local v7       #orderBy:Ljava/lang/String;
    goto :goto_1

    .line 98
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 9
    .parameter "uri"
    .parameter "values"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    .line 129
    iget-object v6, p0, Lcom/android/browser/sitenavigation/SiteNavigationProvider;->mOpenHelper:Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;

    invoke-virtual {v6}, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 130
    .local v3, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v0, 0x0

    .line 132
    .local v0, count:I
    sget-object v6, Lcom/android/browser/sitenavigation/SiteNavigationProvider;->S_URI_MATCHER:Landroid/content/UriMatcher;

    invoke-virtual {v6, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v6

    packed-switch v6, :pswitch_data_0

    .line 146
    const-string v6, "browser/SiteNavigationProvider"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "SiteNavigationProvider update Unknown URI: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v0

    .line 154
    .end local v0           #count:I
    .local v1, count:I
    :goto_0
    return v1

    .line 134
    .end local v1           #count:I
    .restart local v0       #count:I
    :pswitch_0
    const-string v6, "websites"

    invoke-virtual {v3, v6, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 150
    :goto_1
    if-lez v0, :cond_0

    .line 151
    invoke-virtual {p0}, Lcom/android/browser/sitenavigation/SiteNavigationProvider;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 152
    .local v2, cr:Landroid/content/ContentResolver;
    const/4 v6, 0x0

    invoke-virtual {v2, p1, v6}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .end local v2           #cr:Landroid/content/ContentResolver;
    :cond_0
    move v1, v0

    .line 154
    .end local v0           #count:I
    .restart local v1       #count:I
    goto :goto_0

    .line 137
    .end local v1           #count:I
    .restart local v0       #count:I
    :pswitch_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "_id="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, " AND ("

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v8, 0x29

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    :goto_2
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 140
    .local v5, newIdSelection:Ljava/lang/String;
    :try_start_0
    const-string v6, "websites"

    invoke-virtual {v3, v6, p2, v5, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_1

    .line 137
    .end local v5           #newIdSelection:Ljava/lang/String;
    :cond_1
    const-string v6, ""

    goto :goto_2

    .line 141
    .restart local v5       #newIdSelection:Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 142
    .local v4, e:Landroid/database/sqlite/SQLiteFullException;
    const-string v6, "browser/SiteNavigationProvider"

    const-string v7, "Here happened SQLiteFullException"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 132
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
