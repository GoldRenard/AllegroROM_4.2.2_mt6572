.class final Lcom/android/browser/provider/SnapshotProvider$SnapshotDatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "SnapshotProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/provider/SnapshotProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SnapshotDatabaseHelper"
.end annotation


# static fields
.field static final DATABASE_NAME:Ljava/lang/String; = "snapshots.db"

.field static final DATABASE_VERSION:I = 0x3


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 77
    const-string v0, "snapshots.db"

    const/4 v1, 0x0

    const/4 v2, 0x3

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 78
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 82
    const-string v0, "CREATE TABLE snapshots(_id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,url TEXT NOT NULL,date_created INTEGER,favicon BLOB,thumbnail BLOB,background INTEGER,view_state BLOB NOT NULL,viewstate_path TEXT,viewstate_size INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 94
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 1
    .parameter "db"
    .parameter "oldVersion"
    .parameter "newVersion"

    .prologue
    .line 98
    const/4 v0, 0x2

    if-ge p2, v0, :cond_0

    .line 99
    const-string v0, "DROP TABLE snapshots"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 100
    invoke-virtual {p0, p1}, Lcom/android/browser/provider/SnapshotProvider$SnapshotDatabaseHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 102
    :cond_0
    const/4 v0, 0x3

    if-ge p2, v0, :cond_1

    .line 103
    const-string v0, "ALTER TABLE snapshots ADD COLUMN viewstate_path TEXT"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 105
    const-string v0, "ALTER TABLE snapshots ADD COLUMN viewstate_size INTEGER"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 107
    const-string v0, "UPDATE snapshots SET viewstate_size = length(view_state)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 111
    :cond_1
    return-void
.end method
