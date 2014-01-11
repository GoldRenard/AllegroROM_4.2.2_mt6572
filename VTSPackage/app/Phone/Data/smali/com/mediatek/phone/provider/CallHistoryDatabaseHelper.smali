.class public Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "CallHistoryDatabaseHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper$Tables;
    }
.end annotation


# static fields
.field private static final DATABASE_NAME:Ljava/lang/String; = "phone.db"

.field private static final DATABASE_VERSION:I = 0x1

.field private static final TAG:Ljava/lang/String; = "CallHistoryDatabaseHelper"

.field private static sSingleton:Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const/4 v0, 0x0

    sput-object v0, Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;->sSingleton:Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 2
    .parameter "context"
    .parameter "databaseName"
    .parameter "optimizationEnabled"

    .prologue
    .line 52
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, v0, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 53
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;
    .locals 4
    .parameter "context"

    .prologue
    .line 44
    const-class v1, Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;->sSingleton:Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;

    if-nez v0, :cond_0

    .line 45
    new-instance v0, Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;

    const-string v2, "phone.db"

    const/4 v3, 0x1

    invoke-direct {v0, p0, v2, v3}, Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Z)V

    sput-object v0, Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;->sSingleton:Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;

    .line 47
    :cond_0
    sget-object v0, Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;->sSingleton:Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 44
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static getNewInstanceForTest(Landroid/content/Context;)Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;
    .locals 3
    .parameter "context"

    .prologue
    .line 81
    new-instance v0, Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Z)V

    return-object v0
.end method


# virtual methods
.method public initDatabase()V
    .locals 0

    .prologue
    .line 56
    invoke-virtual {p0}, Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 57
    return-void
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .parameter "db"

    .prologue
    .line 61
    const-string v0, "CallHistoryDatabaseHelper"

    const-string v1, "Bootstrapping database version: 1"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    const-string v0, "CREATE TABLE calls (_id INTEGER PRIMARY KEY AUTOINCREMENT,number TEXT,date INTEGER,country_iso TEXT,area_code TEXT DEFAULT NULL,confirm INTEGER NOT NULL DEFAULT 0);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 71
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0
    .parameter "db"
    .parameter "oldVersion"
    .parameter "newVersion"

    .prologue
    .line 75
    return-void
.end method
