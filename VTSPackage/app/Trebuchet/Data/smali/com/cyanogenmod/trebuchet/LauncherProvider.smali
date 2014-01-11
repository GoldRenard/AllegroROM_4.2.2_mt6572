.class public Lcom/cyanogenmod/trebuchet/LauncherProvider;
.super Landroid/content/ContentProvider;
.source "LauncherProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;,
        Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;
    }
.end annotation


# static fields
.field private static final ACTION_APPWIDGET_DEFAULT_WORKSPACE_CONFIGURE:Ljava/lang/String; = "com.cyanogenmod.trebuchet.action.APPWIDGET_DEFAULT_WORKSPACE_CONFIGURE"

.field static final AUTHORITY:Ljava/lang/String; = "com.cyanogenmod.trebuchet.settings"

.field static final CONTENT_APPWIDGET_RESET_URI:Landroid/net/Uri; = null

.field private static final DATABASE_NAME:Ljava/lang/String; = "launcher.db"

.field private static final DATABASE_VERSION:I = 0xe

.field static final DB_CREATED_BUT_DEFAULT_WORKSPACE_NOT_LOADED:Ljava/lang/String; = "DB_CREATED_BUT_DEFAULT_WORKSPACE_NOT_LOADED"

.field static final DEFAULT_WORKSPACE_RESOURCE_ID:Ljava/lang/String; = "DEFAULT_WORKSPACE_RESOURCE_ID"

.field private static final LOGD:Z = false

.field static final PARAMETER_NOTIFY:Ljava/lang/String; = "notify"

.field static final TABLE_FAVORITES:Ljava/lang/String; = "favorites"

.field private static final TAG:Ljava/lang/String; = "Trebuchet.LauncherProvider"


# instance fields
.field private mOpenHelper:Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 84
    const-string v0, "content://com.cyanogenmod.trebuchet.settings/appWidgetReset"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/cyanogenmod/trebuchet/LauncherProvider;->CONTENT_APPWIDGET_RESET_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    .line 975
    return-void
.end method

.method static synthetic access$100(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    .locals 2
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 59
    invoke-static {p0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->dbInsertAndCheck(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$200(Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 59
    invoke-static {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->deleteId(Landroid/database/sqlite/SQLiteDatabase;J)V

    return-void
.end method

.method static buildOrWhereString(Ljava/lang/String;[I)Ljava/lang/String;
    .locals 4
    .parameter "column"
    .parameter "values"

    .prologue
    .line 965
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 966
    .local v1, selectWhere:Ljava/lang/StringBuilder;
    array-length v2, p1

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_1

    .line 967
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget v3, p1, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 968
    if-lez v0, :cond_0

    .line 969
    const-string v2, " OR "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 966
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 972
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static dbInsertAndCheck(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    .locals 2
    .parameter "db"
    .parameter "table"
    .parameter "nullColumnHack"
    .parameter "values"

    .prologue
    .line 122
    const-string v0, "_id"

    invoke-virtual {p3, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 123
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Error: attempting to add item without specifying an id"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 125
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    return-wide v0
.end method

.method private static deleteId(Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 5
    .parameter "db"
    .parameter "id"

    .prologue
    const/4 v3, 0x0

    .line 129
    const/4 v2, 0x0

    invoke-static {p1, p2, v2}, Lcom/cyanogenmod/trebuchet/LauncherSettings$Favorites;->getContentUri(JZ)Landroid/net/Uri;

    move-result-object v1

    .line 130
    .local v1, uri:Landroid/net/Uri;
    new-instance v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;

    invoke-direct {v0, v1, v3, v3}, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;-><init>(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)V

    .line 131
    .local v0, args:Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;
    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;->table:Ljava/lang/String;

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;->where:Ljava/lang/String;

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;->args:[Ljava/lang/String;

    invoke-virtual {p0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 132
    return-void
.end method

.method private sendNotify(Landroid/net/Uri;)V
    .locals 3
    .parameter "uri"

    .prologue
    .line 192
    const-string v1, "notify"

    invoke-virtual {p1, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 193
    .local v0, notify:Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string v1, "true"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 194
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 196
    :cond_1
    return-void
.end method


# virtual methods
.method public bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I
    .locals 10
    .parameter "uri"
    .parameter "values"

    .prologue
    .line 150
    new-instance v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;

    invoke-direct {v0, p1}, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;-><init>(Landroid/net/Uri;)V

    .line 152
    .local v0, args:Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider;->mOpenHelper:Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 153
    .local v2, db:Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 155
    move-object v1, p2

    .local v1, arr$:[Landroid/content/ContentValues;
    :try_start_0
    array-length v4, v1

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v5, v1, v3

    .line 156
    .local v5, value:Landroid/content/ContentValues;
    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;->table:Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {v2, v6, v7, v5}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->dbInsertAndCheck(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-gez v6, :cond_0

    .line 157
    const/4 v6, 0x0

    .line 162
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 166
    .end local v5           #value:Landroid/content/ContentValues;
    :goto_1
    return v6

    .line 155
    .restart local v5       #value:Landroid/content/ContentValues;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 160
    .end local v5           #value:Landroid/content/ContentValues;
    :cond_1
    :try_start_1
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 162
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 165
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->sendNotify(Landroid/net/Uri;)V

    .line 166
    array-length v6, p2

    goto :goto_1

    .line 162
    .end local v3           #i$:I
    .end local v4           #len$:I
    :catchall_0
    move-exception v6

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v6
.end method

.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 6
    .parameter "uri"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    .line 171
    new-instance v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;

    invoke-direct {v0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;-><init>(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)V

    .line 173
    .local v0, args:Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider;->mOpenHelper:Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 174
    .local v2, db:Landroid/database/sqlite/SQLiteDatabase;
    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;->table:Ljava/lang/String;

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;->where:Ljava/lang/String;

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;->args:[Ljava/lang/String;

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 175
    .local v1, count:I
    if-lez v1, :cond_0

    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->sendNotify(Landroid/net/Uri;)V

    .line 177
    :cond_0
    return v1
.end method

.method public generateNewId()J
    .locals 2

    .prologue
    .line 199
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider;->mOpenHelper:Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->generateNewId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 3
    .parameter "uri"

    .prologue
    const/4 v1, 0x0

    .line 98
    new-instance v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;

    invoke-direct {v0, p1, v1, v1}, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;-><init>(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)V

    .line 99
    .local v0, args:Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;
    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;->where:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 100
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "vnd.android.cursor.dir/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 102
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "vnd.android.cursor.item/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 7
    .parameter "uri"
    .parameter "initialValues"

    .prologue
    const/4 v4, 0x0

    .line 136
    new-instance v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;

    invoke-direct {v0, p1}, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;-><init>(Landroid/net/Uri;)V

    .line 138
    .local v0, args:Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider;->mOpenHelper:Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 139
    .local v1, db:Landroid/database/sqlite/SQLiteDatabase;
    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-static {v1, v5, v4, p2}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->dbInsertAndCheck(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    .line 140
    .local v2, rowId:J
    const-wide/16 v5, 0x0

    cmp-long v5, v2, v5

    if-gtz v5, :cond_0

    .line 145
    :goto_0
    return-object v4

    .line 142
    :cond_0
    invoke-static {p1, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p1

    .line 143
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->sendNotify(Landroid/net/Uri;)V

    move-object v4, p1

    .line 145
    goto :goto_0
.end method

.method public declared-synchronized loadDefaultFavoritesIfNecessary(I)V
    .locals 7
    .parameter "origWorkspaceResId"

    .prologue
    .line 206
    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->getSharedPreferencesKey()Ljava/lang/String;

    move-result-object v2

    .line 207
    .local v2, spKey:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->getContext()Landroid/content/Context;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v2, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 208
    .local v1, sp:Landroid/content/SharedPreferences;
    const-string v5, "DB_CREATED_BUT_DEFAULT_WORKSPACE_NOT_LOADED"

    const/4 v6, 0x0

    invoke-interface {v1, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 209
    move v4, p1

    .line 212
    .local v4, workspaceResId:I
    if-nez v4, :cond_0

    .line 213
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->getContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "phone"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/TelephonyManager;

    .line 214
    .local v3, tm:Landroid/telephony/TelephonyManager;
    invoke-virtual {v3}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    move-result v5

    if-nez v5, :cond_3

    .line 215
    const-string v5, "DEFAULT_WORKSPACE_RESOURCE_ID"

    const v6, 0x7f060001

    invoke-interface {v1, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 222
    .end local v3           #tm:Landroid/telephony/TelephonyManager;
    :cond_0
    :goto_0
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 223
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v5, "DB_CREATED_BUT_DEFAULT_WORKSPACE_NOT_LOADED"

    invoke-interface {v0, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 224
    if-eqz p1, :cond_1

    .line 225
    const-string v5, "DEFAULT_WORKSPACE_RESOURCE_ID"

    invoke-interface {v0, v5, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 227
    :cond_1
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider;->mOpenHelper:Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider;->mOpenHelper:Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    #calls: Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->loadFavorites(Landroid/database/sqlite/SQLiteDatabase;I)I
    invoke-static {v5, v6, v4}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->access$000(Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;Landroid/database/sqlite/SQLiteDatabase;I)I

    .line 228
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 230
    .end local v0           #editor:Landroid/content/SharedPreferences$Editor;
    .end local v4           #workspaceResId:I
    :cond_2
    monitor-exit p0

    return-void

    .line 217
    .restart local v3       #tm:Landroid/telephony/TelephonyManager;
    .restart local v4       #workspaceResId:I
    :cond_3
    :try_start_1
    const-string v5, "DEFAULT_WORKSPACE_RESOURCE_ID"

    const/high16 v6, 0x7f06

    invoke-interface {v1, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v4

    goto :goto_0

    .line 206
    .end local v1           #sp:Landroid/content/SharedPreferences;
    .end local v2           #spKey:Ljava/lang/String;
    .end local v3           #tm:Landroid/telephony/TelephonyManager;
    .end local v4           #workspaceResId:I
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method public onCreate()Z
    .locals 2

    .prologue
    .line 91
    new-instance v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider;->mOpenHelper:Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;

    .line 92
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/LauncherApplication;

    invoke-virtual {v0, p0}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->setLauncherProvider(Lcom/cyanogenmod/trebuchet/LauncherProvider;)V

    .line 93
    const/4 v0, 0x1

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 10
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "sortOrder"

    .prologue
    const/4 v5, 0x0

    .line 110
    new-instance v8, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;

    invoke-direct {v8, p1, p3, p4}, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;-><init>(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)V

    .line 111
    .local v8, args:Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 112
    .local v0, qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    iget-object v2, v8, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 114
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider;->mOpenHelper:Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 115
    .local v1, db:Landroid/database/sqlite/SQLiteDatabase;
    iget-object v3, v8, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;->where:Ljava/lang/String;

    iget-object v4, v8, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;->args:[Ljava/lang/String;

    move-object v2, p2

    move-object v6, v5

    move-object v7, p5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 116
    .local v9, result:Landroid/database/Cursor;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-interface {v9, v2, p1}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    .line 118
    return-object v9
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 6
    .parameter "uri"
    .parameter "values"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    .line 182
    new-instance v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;

    invoke-direct {v0, p1, p3, p4}, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;-><init>(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)V

    .line 184
    .local v0, args:Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider;->mOpenHelper:Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 185
    .local v2, db:Landroid/database/sqlite/SQLiteDatabase;
    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;->table:Ljava/lang/String;

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;->where:Ljava/lang/String;

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$SqlArguments;->args:[Ljava/lang/String;

    invoke-virtual {v2, v3, p2, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 186
    .local v1, count:I
    if-lez v1, :cond_0

    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->sendNotify(Landroid/net/Uri;)V

    .line 188
    :cond_0
    return v1
.end method
