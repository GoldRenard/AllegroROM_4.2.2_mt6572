.class public Lcom/android/providers/settings/DatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "DatabaseHelper.java"


# static fields
.field private static final DATABASE_NAME:Ljava/lang/String; = "settings.db"

.field private static final DATABASE_VERSION:I = 0x5f

.field private static final TABLE_GLOBAL:Ljava/lang/String; = "global"

.field private static final TABLE_SECURE:Ljava/lang/String; = "secure"

.field private static final TABLE_SYSTEM:Ljava/lang/String; = "system"

.field private static final TAG:Ljava/lang/String; = "SettingsProvider"

.field private static final mValidTables:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mContext:Landroid/content/Context;

.field private mExt:Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;

.field private mUserHandle:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 97
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    .line 104
    sget-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    const-string v1, "system"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 105
    sget-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    const-string v1, "secure"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 106
    sget-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    const-string v1, "global"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 107
    sget-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    const-string v1, "bluetooth_devices"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 108
    sget-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    const-string v1, "bookmarks"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 111
    sget-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    const-string v1, "favorites"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 112
    sget-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    const-string v1, "gservices"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 113
    sget-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    const-string v1, "old_favorites"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 114
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 3
    .parameter "context"
    .parameter "userHandle"

    .prologue
    .line 130
    invoke-static {p2}, Lcom/android/providers/settings/DatabaseHelper;->dbNameForUser(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/16 v2, 0x5f

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 131
    iput-object p1, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    .line 132
    iput p2, p0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    .line 133
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/providers/settings/DatabaseHelper;->setWriteAheadLoggingEnabled(Z)V

    .line 134
    return-void
.end method

.method private createGlobalTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 150
    const-string v0, "CREATE TABLE global (_id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT UNIQUE ON CONFLICT REPLACE,value TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 155
    const-string v0, "CREATE INDEX globalIndex1 ON global (name);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 156
    return-void
.end method

.method private createSecureTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 141
    const-string v0, "CREATE TABLE secure (_id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT UNIQUE ON CONFLICT REPLACE,value TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 146
    const-string v0, "CREATE INDEX secureIndex1 ON secure (name);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 147
    return-void
.end method

.method static dbNameForUser(I)Ljava/lang/String;
    .locals 3
    .parameter "userHandle"

    .prologue
    .line 118
    if-nez p0, :cond_0

    .line 119
    const-string v1, "settings.db"

    .line 125
    :goto_0
    return-object v1

    .line 123
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-static {p0}, Landroid/os/Environment;->getUserSystemDirectory(I)Ljava/io/File;

    move-result-object v1

    const-string v2, "settings.db"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 125
    .local v0, databaseFile:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static getDatabaseHelperPlgin(Landroid/content/Context;)Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;
    .locals 5
    .parameter "context"

    .prologue
    .line 1960
    :try_start_0
    const-string v2, "SettingsProvider"

    const-string v3, "getDatabaseHelperPlgin() --- begin"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1961
    const-class v2, Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Landroid/content/pm/Signature;

    invoke-static {p0, v2, v3}, Lcom/mediatek/pluginmanager/PluginManager;->createPluginObject(Landroid/content/Context;Ljava/lang/String;[Landroid/content/pm/Signature;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;

    .line 1963
    .local v1, ext:Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;
    const-string v2, "SettingsProvider"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getDatabaseHelperPlgin() --- end: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1968
    :goto_0
    return-object v1

    .line 1964
    .end local v1           #ext:Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;
    :catch_0
    move-exception v0

    .line 1965
    .local v0, e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    const-string v2, "SettingsProvider"

    const-string v3, "Plugin ObjectCreationException"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1966
    new-instance v1, Lcom/mediatek/providers/settings/ext/DefaultDatabaseHelperExt;

    invoke-direct {v1}, Lcom/mediatek/providers/settings/ext/DefaultDatabaseHelperExt;-><init>()V

    .restart local v1       #ext:Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;
    goto :goto_0
.end method

.method private getIntValueFromSystem(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;I)I
    .locals 1
    .parameter "db"
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    .line 2506
    const-string v0, "system"

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/android/providers/settings/DatabaseHelper;->getIntValueFromTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private getIntValueFromTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;I)I
    .locals 2
    .parameter "db"
    .parameter "table"
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    .line 2511
    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, p3, v1}, Lcom/android/providers/settings/DatabaseHelper;->getStringValueFromTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2512
    .local v0, value:Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p4

    .end local p4
    :cond_0
    return p4
.end method

.method private getStringValueFromTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .parameter "db"
    .parameter "table"
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    .line 2517
    const/4 v8, 0x0

    .line 2519
    .local v8, c:Landroid/database/Cursor;
    const/4 v0, 0x1

    :try_start_0
    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "value"

    aput-object v1, v2, v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "name=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p1

    move-object v1, p2

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 2521
    if-eqz v8, :cond_2

    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2522
    const/4 v0, 0x0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v9

    .line 2523
    .local v9, val:Ljava/lang/String;
    if-nez v9, :cond_1

    .line 2526
    .end local p4
    :goto_0
    if-eqz v8, :cond_0

    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 2528
    .end local v9           #val:Ljava/lang/String;
    :cond_0
    :goto_1
    return-object p4

    .restart local v9       #val:Ljava/lang/String;
    .restart local p4
    :cond_1
    move-object p4, v9

    .line 2523
    goto :goto_0

    .line 2526
    .end local v9           #val:Ljava/lang/String;
    :cond_2
    if-eqz v8, :cond_0

    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    goto :goto_1

    :catchall_0
    move-exception v0

    if-eqz v8, :cond_3

    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0
.end method

.method private hashsetToStringArray(Ljava/util/HashSet;)[Ljava/lang/String;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1573
    .local p1, set:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljava/util/HashSet;->size()I

    move-result v1

    new-array v0, v1, [Ljava/lang/String;

    .line 1574
    .local v0, array:[Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    return-object v1
.end method

.method public static isValidTable(Ljava/lang/String;)Z
    .locals 1
    .parameter "name"

    .prologue
    .line 137
    sget-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private loadBookmarks(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 27
    .parameter "db"

    .prologue
    .line 1756
    new-instance v21, Landroid/content/ContentValues;

    invoke-direct/range {v21 .. v21}, Landroid/content/ContentValues;-><init>()V

    .line 1758
    .local v21, values:Landroid/content/ContentValues;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v13

    .line 1760
    .local v13, packageManager:Landroid/content/pm/PackageManager;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v22

    const/high16 v23, 0x7f03

    invoke-virtual/range {v22 .. v23}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v15

    .line 1761
    .local v15, parser:Landroid/content/res/XmlResourceParser;
    const-string v22, "bookmarks"

    move-object/from16 v0, v22

    invoke-static {v15, v0}, Lcom/android/internal/util/XmlUtils;->beginDocument(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V

    .line 1763
    invoke-interface {v15}, Landroid/content/res/XmlResourceParser;->getDepth()I

    move-result v7

    .line 1767
    .local v7, depth:I
    :cond_0
    :goto_0
    invoke-interface {v15}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v20

    .local v20, type:I
    const/16 v22, 0x3

    move/from16 v0, v20

    move/from16 v1, v22

    if-ne v0, v1, :cond_1

    invoke-interface {v15}, Landroid/content/res/XmlResourceParser;->getDepth()I

    move-result v22

    move/from16 v0, v22

    if-le v0, v7, :cond_2

    :cond_1
    const/16 v22, 0x1

    move/from16 v0, v20

    move/from16 v1, v22

    if-eq v0, v1, :cond_2

    .line 1769
    const/16 v22, 0x2

    move/from16 v0, v20

    move/from16 v1, v22

    if-ne v0, v1, :cond_0

    .line 1773
    invoke-interface {v15}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v12

    .line 1774
    .local v12, name:Ljava/lang/String;
    const-string v22, "bookmark"

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_3

    .line 1834
    .end local v7           #depth:I
    .end local v12           #name:Ljava/lang/String;
    .end local v15           #parser:Landroid/content/res/XmlResourceParser;
    .end local v20           #type:I
    :cond_2
    :goto_1
    return-void

    .line 1778
    .restart local v7       #depth:I
    .restart local v12       #name:Ljava/lang/String;
    .restart local v15       #parser:Landroid/content/res/XmlResourceParser;
    .restart local v20       #type:I
    :cond_3
    const/16 v22, 0x0

    const-string v23, "package"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-interface {v15, v0, v1}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 1779
    .local v16, pkg:Ljava/lang/String;
    const/16 v22, 0x0

    const-string v23, "class"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-interface {v15, v0, v1}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1780
    .local v5, cls:Ljava/lang/String;
    const/16 v22, 0x0

    const-string v23, "shortcut"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-interface {v15, v0, v1}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 1781
    .local v17, shortcutStr:Ljava/lang/String;
    const/16 v22, 0x0

    const-string v23, "category"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-interface {v15, v0, v1}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1783
    .local v4, category:Ljava/lang/String;
    const/16 v22, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v18

    .line 1784
    .local v18, shortcutValue:I
    invoke-static/range {v17 .. v17}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-eqz v22, :cond_4

    .line 1785
    const-string v22, "SettingsProvider"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Unable to get shortcut for: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "/"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto/16 :goto_0

    .line 1829
    .end local v4           #category:Ljava/lang/String;
    .end local v5           #cls:Ljava/lang/String;
    .end local v7           #depth:I
    .end local v12           #name:Ljava/lang/String;
    .end local v15           #parser:Landroid/content/res/XmlResourceParser;
    .end local v16           #pkg:Ljava/lang/String;
    .end local v17           #shortcutStr:Ljava/lang/String;
    .end local v18           #shortcutValue:I
    .end local v20           #type:I
    :catch_0
    move-exception v8

    .line 1830
    .local v8, e:Lorg/xmlpull/v1/XmlPullParserException;
    const-string v22, "SettingsProvider"

    const-string v23, "Got execption parsing bookmarks."

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-static {v0, v1, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 1791
    .end local v8           #e:Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v4       #category:Ljava/lang/String;
    .restart local v5       #cls:Ljava/lang/String;
    .restart local v7       #depth:I
    .restart local v12       #name:Ljava/lang/String;
    .restart local v15       #parser:Landroid/content/res/XmlResourceParser;
    .restart local v16       #pkg:Ljava/lang/String;
    .restart local v17       #shortcutStr:Ljava/lang/String;
    .restart local v18       #shortcutValue:I
    .restart local v20       #type:I
    :cond_4
    if-eqz v16, :cond_5

    if-eqz v5, :cond_5

    .line 1792
    const/4 v10, 0x0

    .line 1793
    .local v10, info:Landroid/content/pm/ActivityInfo;
    :try_start_1
    new-instance v6, Landroid/content/ComponentName;

    move-object/from16 v0, v16

    invoke-direct {v6, v0, v5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1795
    .local v6, cn:Landroid/content/ComponentName;
    const/16 v22, 0x0

    :try_start_2
    move/from16 v0, v22

    invoke-virtual {v13, v6, v0}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v10

    .line 1808
    :goto_2
    :try_start_3
    new-instance v11, Landroid/content/Intent;

    const-string v22, "android.intent.action.MAIN"

    const/16 v23, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-direct {v11, v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1809
    .local v11, intent:Landroid/content/Intent;
    const-string v22, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v22

    invoke-virtual {v11, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 1810
    invoke-virtual {v11, v6}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1811
    invoke-virtual {v10, v13}, Landroid/content/pm/ActivityInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v19

    .line 1821
    .end local v6           #cn:Landroid/content/ComponentName;
    .end local v10           #info:Landroid/content/pm/ActivityInfo;
    .local v19, title:Ljava/lang/String;
    :goto_3
    const/high16 v22, 0x1000

    move/from16 v0, v22

    invoke-virtual {v11, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1822
    const-string v22, "intent"

    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v11, v0}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1823
    const-string v22, "title"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1824
    const-string v22, "shortcut"

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1825
    const-string v22, "bookmarks"

    const-string v23, "shortcut = ?"

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v26

    aput-object v26, v24, v25

    move-object/from16 v0, p1

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    move-object/from16 v3, v24

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1827
    const-string v22, "bookmarks"

    const/16 v23, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    move-object/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_0

    .line 1831
    .end local v4           #category:Ljava/lang/String;
    .end local v5           #cls:Ljava/lang/String;
    .end local v7           #depth:I
    .end local v11           #intent:Landroid/content/Intent;
    .end local v12           #name:Ljava/lang/String;
    .end local v15           #parser:Landroid/content/res/XmlResourceParser;
    .end local v16           #pkg:Ljava/lang/String;
    .end local v17           #shortcutStr:Ljava/lang/String;
    .end local v18           #shortcutValue:I
    .end local v19           #title:Ljava/lang/String;
    .end local v20           #type:I
    :catch_1
    move-exception v8

    .line 1832
    .local v8, e:Ljava/io/IOException;
    const-string v22, "SettingsProvider"

    const-string v23, "Got execption parsing bookmarks."

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-static {v0, v1, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 1796
    .end local v8           #e:Ljava/io/IOException;
    .restart local v4       #category:Ljava/lang/String;
    .restart local v5       #cls:Ljava/lang/String;
    .restart local v6       #cn:Landroid/content/ComponentName;
    .restart local v7       #depth:I
    .restart local v10       #info:Landroid/content/pm/ActivityInfo;
    .restart local v12       #name:Ljava/lang/String;
    .restart local v15       #parser:Landroid/content/res/XmlResourceParser;
    .restart local v16       #pkg:Ljava/lang/String;
    .restart local v17       #shortcutStr:Ljava/lang/String;
    .restart local v18       #shortcutValue:I
    .restart local v20       #type:I
    :catch_2
    move-exception v8

    .line 1797
    .local v8, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const/16 v22, 0x1

    :try_start_4
    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput-object v16, v22, v23

    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Landroid/content/pm/PackageManager;->canonicalToCurrentPackageNames([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    .line 1799
    .local v14, packages:[Ljava/lang/String;
    new-instance v6, Landroid/content/ComponentName;

    .end local v6           #cn:Landroid/content/ComponentName;
    const/16 v22, 0x0

    aget-object v22, v14, v22

    move-object/from16 v0, v22

    invoke-direct {v6, v0, v5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 1801
    .restart local v6       #cn:Landroid/content/ComponentName;
    const/16 v22, 0x0

    :try_start_5
    move/from16 v0, v22

    invoke-virtual {v13, v6, v0}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_5
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    move-result-object v10

    goto/16 :goto_2

    .line 1802
    :catch_3
    move-exception v9

    .line 1803
    .local v9, e1:Landroid/content/pm/PackageManager$NameNotFoundException;
    :try_start_6
    const-string v22, "SettingsProvider"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Unable to add bookmark: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "/"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-static {v0, v1, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 1812
    .end local v6           #cn:Landroid/content/ComponentName;
    .end local v8           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v9           #e1:Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v10           #info:Landroid/content/pm/ActivityInfo;
    .end local v14           #packages:[Ljava/lang/String;
    :cond_5
    if-eqz v4, :cond_6

    .line 1813
    const-string v22, "android.intent.action.MAIN"

    move-object/from16 v0, v22

    invoke-static {v0, v4}, Landroid/content/Intent;->makeMainSelectorActivity(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v11

    .line 1814
    .restart local v11       #intent:Landroid/content/Intent;
    const-string v19, ""

    .restart local v19       #title:Ljava/lang/String;
    goto/16 :goto_3

    .line 1816
    .end local v11           #intent:Landroid/content/Intent;
    .end local v19           #title:Ljava/lang/String;
    :cond_6
    const-string v22, "SettingsProvider"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Unable to add bookmark for shortcut "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ": missing package/class or category attributes"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    goto/16 :goto_0
.end method

.method private loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V
    .locals 1
    .parameter "stmt"
    .parameter "key"
    .parameter "resid"

    .prologue
    .line 2491
    iget-object v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "1"

    :goto_0
    invoke-direct {p0, p1, p2, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2493
    return-void

    .line 2491
    :cond_0
    const-string v0, "0"

    goto :goto_0
.end method

.method private loadDefaultAnimationSettings(Landroid/database/sqlite/SQLiteStatement;)V
    .locals 3
    .parameter "stmt"

    .prologue
    const/4 v2, 0x1

    .line 2137
    const-string v0, "window_animation_scale"

    const/high16 v1, 0x7f07

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadFractionSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;II)V

    .line 2139
    const-string v0, "transition_animation_scale"

    const v1, 0x7f070001

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadFractionSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;II)V

    .line 2141
    return-void
.end method

.method private loadDefaultHapticSettings(Landroid/database/sqlite/SQLiteStatement;)V
    .locals 5
    .parameter "stmt"

    .prologue
    const v4, 0x7f050006

    .line 2145
    iget-object v1, p0, Lcom/android/providers/settings/DatabaseHelper;->mExt:Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;

    iget-object v2, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    const-string v3, "haptic_feedback_enabled"

    invoke-interface {v1, v2, v3, v4}, Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;->getResBoolean(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 2148
    .local v0, hapticValue:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 2149
    const-string v1, "haptic_feedback_enabled"

    invoke-direct {p0, p1, v1, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2155
    :goto_0
    return-void

    .line 2151
    :cond_0
    const-string v1, "haptic_feedback_enabled"

    invoke-direct {p0, p1, v1, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method private loadFractionSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;II)V
    .locals 1
    .parameter "stmt"
    .parameter "key"
    .parameter "resid"
    .parameter "base"

    .prologue
    .line 2501
    iget-object v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p3, p4, p4}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2503
    return-void
.end method

.method private loadGlobalSettings(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 13
    .parameter "db"

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 2297
    const/4 v5, 0x0

    .line 2299
    .local v5, stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    const-string v9, "INSERT OR IGNORE INTO global(name,value) VALUES(?,?);"

    invoke-virtual {p1, v9}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v5

    .line 2303
    const-string v9, "airplane_mode_on"

    const v10, 0x7f050001

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2306
    const-string v9, "airplane_mode_radios"

    const v10, 0x7f040001

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2309
    const-string v9, "airplane_mode_toggleable_radios"

    const v10, 0x7f040002

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2312
    const-string v9, "assisted_gps_enabled"

    const v10, 0x7f05000b

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2315
    const-string v10, "stay_on_while_plugged_in"

    const-string v9, "1"

    const-string v11, "ro.kernel.qemu"

    invoke-static {v11}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    iget-object v9, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f050021

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v9

    if-eqz v9, :cond_4

    :cond_0
    move v9, v7

    :goto_0
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-direct {p0, v5, v10, v9}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2320
    const-string v9, "wifi_sleep_policy"

    const v10, 0x7f060003

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2323
    const-string v9, "mode_ringer"

    const/4 v10, 0x2

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2327
    const-string v9, "package_verifier_enable"

    const v10, 0x7f05000a

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2330
    const-string v9, "wifi_on"

    const v10, 0x7f05000e

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2333
    const-string v9, "wifi_networks_available_notification_on"

    const v10, 0x7f05000f

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2336
    const-string v9, "bluetooth_on"

    const v10, 0x7f050007

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2340
    const-string v9, "cdma_cell_broadcast_sms"

    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2344
    const-string v10, "data_roaming"

    const-string v9, "true"

    const-string v11, "ro.com.android.dataroaming"

    const-string v12, "false"

    invoke-static {v11, v12}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_5

    move v9, v7

    :goto_1
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-direct {p0, v5, v10, v9}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2349
    const-string v9, "device_provisioned"

    const v10, 0x7f050017

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2352
    iget-object v9, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f060008

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    .line 2354
    .local v2, maxBytes:I
    if-lez v2, :cond_1

    .line 2355
    const-string v9, "download_manager_max_bytes_over_mobile"

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2359
    :cond_1
    iget-object v9, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f060009

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    .line 2361
    .local v4, recommendedMaxBytes:I
    if-lez v4, :cond_2

    .line 2362
    const-string v9, "download_manager_recommended_max_bytes_over_mobile"

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2368
    :cond_2
    const-string v9, "mobile_data"

    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2372
    const-string v9, "netstats_enabled"

    const v10, 0x7f05000c

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2375
    const-string v9, "network_preference"

    const v10, 0x7f060002

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2378
    const-string v9, "usb_mass_storage_enabled"

    const v10, 0x7f05000d

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2381
    const-string v9, "wifi_max_dhcp_retry_count"

    const v10, 0x7f06000c

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2384
    const-string v9, "wifi_display_on"

    const v10, 0x7f050008

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2387
    const-string v9, "lock_sound"

    const v10, 0x7f04000a

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2389
    const-string v9, "unlock_sound"

    const v10, 0x7f04000b

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2391
    const-string v9, "power_sounds_enabled"

    const v10, 0x7f060004

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2393
    const-string v9, "low_battery_sound"

    const v10, 0x7f040005

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2395
    const-string v9, "dock_sounds_enabled"

    const v10, 0x7f060005

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2397
    const-string v9, "desk_dock_sound"

    const v10, 0x7f040006

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2399
    const-string v9, "desk_undock_sound"

    const v10, 0x7f040007

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2401
    const-string v9, "car_dock_sound"

    const v10, 0x7f040008

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2403
    const-string v9, "car_undock_sound"

    const v10, 0x7f040009

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2405
    const-string v9, "wireless_charging_started_sound"

    const v10, 0x7f04000c

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2408
    const-string v9, "set_install_location"

    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2409
    const-string v9, "default_install_location"

    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2413
    const-string v9, "emergency_tone"

    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2416
    const-string v9, "call_auto_retry"

    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2420
    invoke-static {}, Landroid/telephony/TelephonyManager;->getLteOnCdmaModeStatic()I

    move-result v9

    if-ne v9, v7, :cond_6

    .line 2421
    const/4 v6, 0x7

    .line 2426
    .local v6, type:I
    :goto_2
    const-string v9, "preferred_network_mode"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-direct {p0, v5, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2432
    const-string v9, "data_roaming_2"

    const-string v10, "true"

    const-string v11, "ro.com.android.dataroaming2"

    const-string v12, "false"

    invoke-static {v11, v12}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_7

    :goto_3
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {p0, v5, v9, v7}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2437
    const-string v7, "auto_time_gps"

    const v8, 0x7f050023

    invoke-direct {p0, v5, v7, v8}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2441
    iget-object v7, p0, Lcom/android/providers/settings/DatabaseHelper;->mExt:Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;

    iget-object v8, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    const-string v9, "auto_time"

    const v10, 0x7f050002

    invoke-interface {v7, v8, v9, v10}, Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;->getResBoolean(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 2443
    .local v1, autotimeValue:Ljava/lang/String;
    if-eqz v1, :cond_8

    .line 2444
    const-string v7, "auto_time"

    invoke-direct {p0, v5, v7, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2450
    :goto_4
    iget-object v7, p0, Lcom/android/providers/settings/DatabaseHelper;->mExt:Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;

    iget-object v8, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    const-string v9, "auto_time_zone"

    const v10, 0x7f050003

    invoke-interface {v7, v8, v9, v10}, Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;->getResBoolean(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 2452
    .local v0, autoTzoneValue:Ljava/lang/String;
    if-eqz v0, :cond_a

    .line 2453
    const-string v7, "auto_time_zone"

    invoke-direct {p0, v5, v7, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2461
    :goto_5
    iget-object v7, p0, Lcom/android/providers/settings/DatabaseHelper;->mExt:Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;

    iget-object v8, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    const-string v9, "install_non_market_apps"

    const v10, 0x7f050009

    invoke-interface {v7, v8, v9, v10}, Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;->getResBoolean(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    .line 2464
    .local v3, nonMarketValue:Ljava/lang/String;
    if-eqz v3, :cond_b

    .line 2465
    const-string v7, "install_non_market_apps"

    invoke-direct {p0, v5, v7, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2476
    :goto_6
    if-eqz v5, :cond_3

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 2478
    :cond_3
    return-void

    .end local v0           #autoTzoneValue:Ljava/lang/String;
    .end local v1           #autotimeValue:Ljava/lang/String;
    .end local v2           #maxBytes:I
    .end local v3           #nonMarketValue:Ljava/lang/String;
    .end local v4           #recommendedMaxBytes:I
    .end local v6           #type:I
    :cond_4
    move v9, v8

    .line 2315
    goto/16 :goto_0

    :cond_5
    move v9, v8

    .line 2344
    goto/16 :goto_1

    .line 2423
    .restart local v2       #maxBytes:I
    .restart local v4       #recommendedMaxBytes:I
    :cond_6
    :try_start_1
    const-string v9, "ro.telephony.default_network"

    const/4 v10, 0x0

    invoke-static {v9, v10}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v6

    .restart local v6       #type:I
    goto :goto_2

    :cond_7
    move v7, v8

    .line 2432
    goto :goto_3

    .line 2446
    .restart local v1       #autotimeValue:Ljava/lang/String;
    :cond_8
    const-string v7, "auto_time"

    const v8, 0x7f050002

    invoke-direct {p0, v5, v7, v8}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_4

    .line 2476
    .end local v1           #autotimeValue:Ljava/lang/String;
    .end local v2           #maxBytes:I
    .end local v4           #recommendedMaxBytes:I
    .end local v6           #type:I
    :catchall_0
    move-exception v7

    if-eqz v5, :cond_9

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_9
    throw v7

    .line 2456
    .restart local v0       #autoTzoneValue:Ljava/lang/String;
    .restart local v1       #autotimeValue:Ljava/lang/String;
    .restart local v2       #maxBytes:I
    .restart local v4       #recommendedMaxBytes:I
    .restart local v6       #type:I
    :cond_a
    :try_start_2
    const-string v7, "auto_time_zone"

    const v8, 0x7f050003

    invoke-direct {p0, v5, v7, v8}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    goto :goto_5

    .line 2468
    .restart local v3       #nonMarketValue:Ljava/lang/String;
    :cond_b
    const-string v7, "install_non_market_apps"

    const v8, 0x7f050009

    invoke-direct {p0, v5, v7, v8}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_6
.end method

.method private loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V
    .locals 1
    .parameter "stmt"
    .parameter "key"
    .parameter "resid"

    .prologue
    .line 2496
    iget-object v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2498
    return-void
.end method

.method private loadSecure35Settings(Landroid/database/sqlite/SQLiteStatement;)V
    .locals 2
    .parameter "stmt"

    .prologue
    .line 2289
    const-string v0, "backup_enabled"

    const v1, 0x7f050010

    invoke-direct {p0, p1, v0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2292
    const-string v0, "backup_transport"

    const v1, 0x7f040004

    invoke-direct {p0, p1, v0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2294
    return-void
.end method

.method private loadSecureSettings(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 13
    .parameter "db"

    .prologue
    const/4 v8, 0x0

    const/4 v9, 0x1

    .line 2158
    const/4 v4, 0x0

    .line 2160
    .local v4, stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    const-string v10, "INSERT OR IGNORE INTO secure(name,value) VALUES(?,?);"

    invoke-virtual {p1, v10}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v4

    .line 2163
    const-string v10, "ro.com.android.wifi-watchlist"

    invoke-static {v10}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2164
    .local v7, wifiWatchList:Ljava/lang/String;
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 2165
    const-string v10, "wifi_watchdog_watch_list"

    invoke-direct {p0, v4, v10, v7}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2173
    :cond_0
    const-string v10, "mock_location"

    const-string v11, "1"

    const-string v12, "ro.allow.mock.location"

    invoke-static {v12}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    move v8, v9

    :cond_1
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-direct {p0, v4, v10, v8}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2176
    invoke-direct {p0, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadSecure35Settings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 2178
    const-string v8, "mount_play_not_snd"

    const v10, 0x7f050012

    invoke-direct {p0, v4, v8, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2181
    const-string v8, "mount_ums_autostart"

    const v10, 0x7f050013

    invoke-direct {p0, v4, v8, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2184
    const-string v8, "mount_ums_prompt"

    const v10, 0x7f050014

    invoke-direct {p0, v4, v8, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2187
    const-string v8, "mount_ums_notify_enabled"

    const v10, 0x7f050015

    invoke-direct {p0, v4, v8, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2190
    const-string v8, "accessibility_script_injection"

    const v10, 0x7f05001a

    invoke-direct {p0, v4, v8, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2193
    const-string v8, "accessibility_web_content_key_bindings"

    const v10, 0x7f04000d

    invoke-direct {p0, v4, v8, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2196
    const-string v8, "long_press_timeout"

    const v10, 0x7f06000a

    invoke-direct {p0, v4, v8, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2199
    const-string v8, "touch_exploration_enabled"

    const v10, 0x7f05001c

    invoke-direct {p0, v4, v8, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2202
    const-string v8, "speak_password"

    const v10, 0x7f05001b

    invoke-direct {p0, v4, v8, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2205
    const-string v8, "accessibility_script_injection_url"

    const v10, 0x7f04000e

    invoke-direct {p0, v4, v8, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2208
    const-string v8, "ro.lockscreen.disable.default"

    const/4 v10, 0x0

    invoke-static {v8, v10}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-ne v8, v9, :cond_3

    .line 2209
    const-string v8, "lockscreen.disabled"

    const-string v9, "1"

    invoke-direct {p0, v4, v8, v9}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2215
    :goto_0
    const-string v8, "screensaver_enabled"

    const v9, 0x1110041

    invoke-direct {p0, v4, v8, v9}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2217
    const-string v8, "screensaver_activate_on_dock"

    const v9, 0x1110042

    invoke-direct {p0, v4, v8, v9}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2219
    const-string v8, "screensaver_activate_on_sleep"

    const v9, 0x1110043

    invoke-direct {p0, v4, v8, v9}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2221
    const-string v8, "screensaver_components"

    const v9, 0x104002c

    invoke-direct {p0, v4, v8, v9}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2223
    const-string v8, "screensaver_default_component"

    const v9, 0x104002c

    invoke-direct {p0, v4, v8, v9}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2226
    const-string v8, "accessibility_display_magnification_enabled"

    const v9, 0x7f05001d

    invoke-direct {p0, v4, v8, v9}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2229
    const-string v8, "accessibility_display_magnification_scale"

    const v9, 0x7f070002

    const/4 v10, 0x1

    invoke-direct {p0, v4, v8, v9, v10}, Lcom/android/providers/settings/DatabaseHelper;->loadFractionSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;II)V

    .line 2232
    const-string v8, "accessibility_display_magnification_auto_update"

    const v9, 0x7f05001e

    invoke-direct {p0, v4, v8, v9}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2236
    const-string v8, "user_setup_complete"

    const v9, 0x7f050022

    invoke-direct {p0, v4, v8, v9}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2241
    const-string v1, "com.android.inputmethod.pinyin.PinyinIME"

    .line 2242
    .local v1, defaultIME:Ljava/lang/String;
    const-string v8, "SettingsProvider"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "defaultIME : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2243
    if-eqz v1, :cond_5

    .line 2244
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 2245
    .local v5, strBuffer:Ljava/lang/StringBuffer;
    const-string v8, "."

    invoke-virtual {v1, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    .line 2246
    .local v2, lastDotPos:I
    const-string v6, "/"

    .line 2247
    .local v6, strInsert:Ljava/lang/String;
    invoke-virtual {v5, v2, v6}, Ljava/lang/StringBuffer;->insert(ILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 2248
    const-string v8, "default_input_method"

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v4, v8, v9}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2255
    .end local v2           #lastDotPos:I
    .end local v5           #strBuffer:Ljava/lang/StringBuffer;
    .end local v6           #strInsert:Ljava/lang/String;
    :goto_1
    iget-object v8, p0, Lcom/android/providers/settings/DatabaseHelper;->mExt:Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;

    iget-object v9, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    const-string v10, "battery_percentage"

    const v11, 0x7f050026

    invoke-interface {v8, v9, v10, v11}, Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;->getResBoolean(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 2258
    .local v0, batteryValue:Ljava/lang/String;
    if-eqz v0, :cond_6

    .line 2259
    const-string v8, "battery_percentage"

    invoke-direct {p0, v4, v8, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2266
    :goto_2
    const-string v8, "wfd_auto_connect_on"

    const v9, 0x7f050028

    invoke-direct {p0, v4, v8, v9}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2270
    iget-object v8, p0, Lcom/android/providers/settings/DatabaseHelper;->mExt:Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;

    iget-object v9, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    const-string v10, "location_providers_allowed"

    const v11, 0x7f040003

    invoke-interface {v8, v9, v10, v11}, Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;->getResStr(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    .line 2273
    .local v3, locationValue:Ljava/lang/String;
    if-eqz v3, :cond_7

    .line 2274
    const-string v8, "location_providers_allowed"

    invoke-direct {p0, v4, v8, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2284
    :goto_3
    if-eqz v4, :cond_2

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 2286
    :cond_2
    return-void

    .line 2211
    .end local v0           #batteryValue:Ljava/lang/String;
    .end local v1           #defaultIME:Ljava/lang/String;
    .end local v3           #locationValue:Ljava/lang/String;
    :cond_3
    :try_start_1
    const-string v8, "lockscreen.disabled"

    const v9, 0x7f050016

    invoke-direct {p0, v4, v8, v9}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 2284
    .end local v7           #wifiWatchList:Ljava/lang/String;
    :catchall_0
    move-exception v8

    if-eqz v4, :cond_4

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_4
    throw v8

    .line 2251
    .restart local v1       #defaultIME:Ljava/lang/String;
    .restart local v7       #wifiWatchList:Ljava/lang/String;
    :cond_5
    :try_start_2
    const-string v8, "SettingsProvider"

    const-string v9, "default IME from IMEFeatureOption is null!!"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 2262
    .restart local v0       #batteryValue:Ljava/lang/String;
    :cond_6
    const-string v8, "battery_percentage"

    const v9, 0x7f050026

    invoke-direct {p0, v4, v8, v9}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    goto :goto_2

    .line 2277
    .restart local v3       #locationValue:Ljava/lang/String;
    :cond_7
    const-string v8, "location_providers_allowed"

    const v9, 0x7f040003

    invoke-direct {p0, v4, v8, v9}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_3
.end method

.method private loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .parameter "stmt"
    .parameter "key"
    .parameter "value"

    .prologue
    .line 2481
    const/4 v0, 0x1

    invoke-virtual {p1, v0, p2}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 2482
    const/4 v0, 0x2

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 2483
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 2484
    return-void
.end method

.method private loadSettings(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 1946
    iget-object v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/providers/settings/DatabaseHelper;->getDatabaseHelperPlgin(Landroid/content/Context;)Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;

    move-result-object v0

    iput-object v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mExt:Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;

    .line 1948
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->loadSystemSettings(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1949
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->loadSecureSettings(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1951
    iget v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v0, :cond_0

    .line 1952
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->loadGlobalSettings(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1954
    :cond_0
    return-void
.end method

.method private loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V
    .locals 1
    .parameter "stmt"
    .parameter "key"
    .parameter "resid"

    .prologue
    .line 2487
    iget-object v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2488
    return-void
.end method

.method private loadSystemSettings(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 3
    .parameter "db"

    .prologue
    .line 1973
    const/4 v0, 0x0

    .line 1975
    .local v0, stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    const-string v1, "INSERT OR IGNORE INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 1980
    const-string v1, "time_12_24"

    const/high16 v2, 0x7f04

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1984
    const-string v1, "dim_screen"

    const/high16 v2, 0x7f05

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1986
    const-string v1, "screen_off_timeout"

    const/high16 v2, 0x7f06

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1990
    const-string v1, "dtmf_tone_type"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1993
    const-string v1, "hearing_aid"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1996
    const-string v1, "tty_mode"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1998
    const-string v1, "screen_brightness"

    const v2, 0x7f060001

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2001
    const-string v1, "screen_brightness_mode"

    const v2, 0x7f050005

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2004
    invoke-direct {p0, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadDefaultAnimationSettings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 2006
    const-string v1, "accelerometer_rotation"

    const v2, 0x7f050004

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2009
    invoke-direct {p0, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadDefaultHapticSettings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 2011
    const-string v1, "notification_light_pulse"

    const v2, 0x7f050011

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2014
    invoke-direct {p0, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadUISoundEffectsSettings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 2016
    const-string v1, "pointer_speed"

    const v2, 0x7f06000b

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2022
    const-string v1, "mtk_audioprofile_active"

    const v2, 0x7f040010

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2031
    const-string v1, "dual_sim_mode_setting"

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2036
    const-string v1, "boot_up_select_mode"

    const v2, 0x7f06000e

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2041
    const-string v1, "enable_internet_call_value"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2043
    const-string v1, "roaming_reminder_mode_setting"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2045
    const-string v1, "roaming_indication_needed"

    const v2, 0x7f050024

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2049
    const-string v1, "ipo_setting"

    const v2, 0x7f050025

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2052
    const-string v1, "landscape_launcher"

    const v2, 0x7f04000f

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2055
    const-string v1, "wifi_select_ssid_type"

    const v2, 0x7f06000d

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2059
    const-string v1, "mtk_rtsp_name"

    const v2, 0x7f040012

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2061
    const-string v1, "mtk_rtsp_to_proxy"

    const v2, 0x7f040013

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2063
    const-string v1, "mtk_rtsp_netinfo"

    const v2, 0x7f040014

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2065
    const-string v1, "mtk_rtsp_to_napid"

    const v2, 0x7f040015

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2067
    const-string v1, "mtk_rtsp_max_udp_port"

    const v2, 0x7f040016

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2069
    const-string v1, "mtk_rtsp_min_udp_port"

    const v2, 0x7f040017

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2073
    const-string v1, "voice_call_reject_mode"

    const v2, 0x7f060010

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2076
    const-string v1, "vt_call_reject_mode"

    const v2, 0x7f060011

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2079
    const-string v1, "ivsr_setting"

    const v2, 0x7f060012

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2082
    const-string v1, "cro_setting"

    const v2, 0x7f060013

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2085
    const-string v1, "hoo_setting"

    const v2, 0x7f060014

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2089
    const-string v1, "tether_ipv6_feature"

    const v2, 0x7f060015

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2093
    const-string v1, "international_dialing_key"

    const v2, 0x7f06000f

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2097
    const-string v1, "data_usage_on_lockscreen_sim1"

    const v2, 0x7f050027

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2100
    const-string v1, "data_usage_on_lockscreen_sim2"

    const v2, 0x7f050027

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2104
    const-string v1, "dtmf_tone"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2105
    const-string v1, "gprs_connection_setting"

    const/4 v2, -0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2110
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 2112
    :cond_0
    return-void

    .line 2110
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_1
    throw v1
.end method

.method private loadUISoundEffectsSettings(Landroid/database/sqlite/SQLiteStatement;)V
    .locals 5
    .parameter "stmt"

    .prologue
    const v4, 0x7f050006

    .line 2115
    const-string v1, "dtmf_tone"

    const v2, 0x7f05001f

    invoke-direct {p0, p1, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2117
    const-string v1, "sound_effects_enabled"

    const v2, 0x7f050020

    invoke-direct {p0, p1, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2121
    iget-object v1, p0, Lcom/android/providers/settings/DatabaseHelper;->mExt:Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;

    iget-object v2, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    const-string v3, "haptic_feedback_enabled"

    invoke-interface {v1, v2, v3, v4}, Lcom/mediatek/providers/settings/ext/IDatabaseHelperExt;->getResBoolean(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 2124
    .local v0, hapticValue:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 2125
    const-string v1, "haptic_feedback_enabled"

    invoke-direct {p0, p1, v1, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2132
    :goto_0
    const-string v1, "lockscreen_sounds_enabled"

    const v2, 0x7f060006

    invoke-direct {p0, p1, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2134
    return-void

    .line 2127
    :cond_0
    const-string v1, "haptic_feedback_enabled"

    invoke-direct {p0, p1, v1, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method private loadVibrateSetting(Landroid/database/sqlite/SQLiteDatabase;Z)V
    .locals 4
    .parameter "db"
    .parameter "deleteOld"

    .prologue
    .line 1902
    if-eqz p2, :cond_0

    .line 1903
    const-string v2, "DELETE FROM system WHERE name=\'vibrate_on\'"

    invoke-virtual {p1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1906
    :cond_0
    const/4 v0, 0x0

    .line 1908
    .local v0, stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    const-string v2, "INSERT OR IGNORE INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v2}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 1912
    const/4 v1, 0x0

    .line 1914
    .local v1, vibrate:I
    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/media/AudioService;->getValueForVibrateSetting(III)I

    move-result v1

    .line 1917
    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/media/AudioService;->getValueForVibrateSetting(III)I

    move-result v2

    or-int/2addr v1, v2

    .line 1919
    const-string v2, "vibrate_on"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v0, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1922
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1924
    :cond_1
    return-void

    .line 1922
    .end local v1           #vibrate:I
    :catchall_0
    move-exception v2

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_2
    throw v2
.end method

.method private loadVibrateWhenRingingSetting(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 6
    .parameter "db"

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1930
    const-string v5, "vibrate_on"

    invoke-direct {p0, p1, v5, v4}, Lcom/android/providers/settings/DatabaseHelper;->getIntValueFromSystem(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;I)I

    move-result v1

    .line 1932
    .local v1, vibrateSetting:I
    and-int/lit8 v5, v1, 0x3

    if-ne v5, v3, :cond_1

    move v2, v3

    .line 1934
    .local v2, vibrateWhenRinging:Z
    :goto_0
    const/4 v0, 0x0

    .line 1936
    .local v0, stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    const-string v5, "INSERT OR IGNORE INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v5}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 1938
    const-string v5, "vibrate_when_ringing"

    if-eqz v2, :cond_2

    :goto_1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v0, v5, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1940
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1942
    :cond_0
    return-void

    .end local v0           #stmt:Landroid/database/sqlite/SQLiteStatement;
    .end local v2           #vibrateWhenRinging:Z
    :cond_1
    move v2, v4

    .line 1932
    goto :goto_0

    .restart local v0       #stmt:Landroid/database/sqlite/SQLiteStatement;
    .restart local v2       #vibrateWhenRinging:Z
    :cond_2
    move v3, v4

    .line 1938
    goto :goto_1

    .line 1940
    :catchall_0
    move-exception v3

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_3
    throw v3
.end method

.method private loadVolumeLevels(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 5
    .parameter "db"

    .prologue
    .line 1843
    const/4 v1, 0x0

    .line 1845
    .local v1, stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    const-string v2, "INSERT OR IGNORE INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v2}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1848
    const-string v2, "volume_music"

    sget-object v3, Landroid/media/AudioManager;->DEFAULT_STREAM_VOLUME:[I

    const/4 v4, 0x3

    aget v3, v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1850
    const-string v2, "volume_ring"

    sget-object v3, Landroid/media/AudioManager;->DEFAULT_STREAM_VOLUME:[I

    const/4 v4, 0x2

    aget v3, v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1852
    const-string v2, "volume_system"

    sget-object v3, Landroid/media/AudioManager;->DEFAULT_STREAM_VOLUME:[I

    const/4 v4, 0x1

    aget v3, v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1854
    const-string v2, "volume_voice"

    sget-object v3, Landroid/media/AudioManager;->DEFAULT_STREAM_VOLUME:[I

    const/4 v4, 0x0

    aget v3, v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1858
    const-string v2, "volume_alarm"

    sget-object v3, Landroid/media/AudioManager;->DEFAULT_STREAM_VOLUME:[I

    const/4 v4, 0x4

    aget v3, v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1860
    const-string v2, "volume_notification"

    sget-object v3, Landroid/media/AudioManager;->DEFAULT_STREAM_VOLUME:[I

    const/4 v4, 0x5

    aget v3, v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1864
    const-string v2, "volume_bluetooth_sco"

    sget-object v3, Landroid/media/AudioManager;->DEFAULT_STREAM_VOLUME:[I

    const/4 v4, 0x6

    aget v3, v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1874
    const/16 v0, 0xa6

    .line 1878
    .local v0, ringerModeAffectedStreams:I
    iget-object v2, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x1110030

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1880
    or-int/lit8 v0, v0, 0x8

    .line 1882
    :cond_0
    const-string v2, "mode_ringer_streams_affected"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1885
    const-string v2, "mute_streams_affected"

    const/16 v3, 0xc2e

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1895
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1898
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->loadVibrateWhenRingingSetting(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1899
    return-void

    .line 1895
    .end local v0           #ringerModeAffectedStreams:I
    :catchall_0
    move-exception v2

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_2
    throw v2
.end method

.method private movePrefixedSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 9
    .parameter "db"
    .parameter "sourceTable"
    .parameter "destTable"
    .parameter "prefixesToMove"

    .prologue
    .line 1617
    const/4 v3, 0x0

    .line 1618
    .local v3, insertStmt:Landroid/database/sqlite/SQLiteStatement;
    const/4 v1, 0x0

    .line 1620
    .local v1, deleteStmt:Landroid/database/sqlite/SQLiteStatement;
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1622
    :try_start_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "INSERT INTO "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " (name,value) SELECT name,value FROM "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " WHERE substr(name,0,?)=?"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v3

    .line 1625
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "DELETE FROM "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " WHERE substr(name,0,?)=?"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1628
    move-object v0, p4

    .local v0, arr$:[Ljava/lang/String;
    array-length v4, v0

    .local v4, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v4, :cond_0

    aget-object v5, v0, v2

    .line 1629
    .local v5, prefix:Ljava/lang/String;
    const/4 v6, 0x1

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    int-to-long v7, v7

    invoke-virtual {v3, v6, v7, v8}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 1630
    const/4 v6, 0x2

    invoke-virtual {v3, v6, v5}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 1631
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 1633
    const/4 v6, 0x1

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    int-to-long v7, v7

    invoke-virtual {v1, v6, v7, v8}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 1634
    const/4 v6, 0x2

    invoke-virtual {v1, v6, v5}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 1635
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 1628
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1637
    .end local v5           #prefix:Ljava/lang/String;
    :cond_0
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1639
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1640
    if-eqz v3, :cond_1

    .line 1641
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1643
    :cond_1
    if-eqz v1, :cond_2

    .line 1644
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1647
    :cond_2
    return-void

    .line 1639
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v2           #i$:I
    .end local v4           #len$:I
    :catchall_0
    move-exception v6

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1640
    if-eqz v3, :cond_3

    .line 1641
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1643
    :cond_3
    if-eqz v1, :cond_4

    .line 1644
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_4
    throw v6
.end method

.method private moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V
    .locals 8
    .parameter "db"
    .parameter "sourceTable"
    .parameter "destTable"
    .parameter "settingsToMove"
    .parameter "doIgnore"

    .prologue
    .line 1581
    const/4 v3, 0x0

    .line 1582
    .local v3, insertStmt:Landroid/database/sqlite/SQLiteStatement;
    const/4 v1, 0x0

    .line 1584
    .local v1, deleteStmt:Landroid/database/sqlite/SQLiteStatement;
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1586
    :try_start_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "INSERT "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-eqz p5, :cond_0

    const-string v6, " OR IGNORE "

    :goto_0
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " INTO "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " (name,value) SELECT name,value FROM "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " WHERE name=?"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v3

    .line 1590
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "DELETE FROM "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " WHERE name=?"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1592
    move-object v0, p4

    .local v0, arr$:[Ljava/lang/String;
    array-length v4, v0

    .local v4, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_1
    if-ge v2, v4, :cond_1

    aget-object v5, v0, v2

    .line 1593
    .local v5, setting:Ljava/lang/String;
    const/4 v6, 0x1

    invoke-virtual {v3, v6, v5}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 1594
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 1596
    const/4 v6, 0x1

    invoke-virtual {v1, v6, v5}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 1597
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 1592
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1586
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v2           #i$:I
    .end local v4           #len$:I
    .end local v5           #setting:Ljava/lang/String;
    :cond_0
    const-string v6, ""

    goto :goto_0

    .line 1599
    .restart local v0       #arr$:[Ljava/lang/String;
    .restart local v2       #i$:I
    .restart local v4       #len$:I
    :cond_1
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1601
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1602
    if-eqz v3, :cond_2

    .line 1603
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1605
    :cond_2
    if-eqz v1, :cond_3

    .line 1606
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1609
    :cond_3
    return-void

    .line 1601
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v2           #i$:I
    .end local v4           #len$:I
    :catchall_0
    move-exception v6

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1602
    if-eqz v3, :cond_4

    .line 1603
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1605
    :cond_4
    if-eqz v1, :cond_5

    .line 1606
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_5
    throw v6
.end method

.method private upgradeAutoBrightness(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 3
    .parameter "db"

    .prologue
    .line 1737
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1739
    :try_start_0
    iget-object v1, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f050005

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v0, "1"

    .line 1742
    .local v0, value:Ljava/lang/String;
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "INSERT OR REPLACE INTO system(name,value) values(\'screen_brightness_mode\',\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\');"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1744
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1746
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1748
    return-void

    .line 1739
    .end local v0           #value:Ljava/lang/String;
    :cond_0
    :try_start_1
    const-string v0, "0"
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1746
    :catchall_0
    move-exception v1

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v1
.end method

.method private upgradeLockPatternLocation(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 13
    .parameter "db"

    .prologue
    const/4 v12, 0x1

    const/4 v4, 0x0

    .line 1650
    const-string v1, "system"

    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "_id"

    aput-object v3, v2, v0

    const-string v0, "value"

    aput-object v0, v2, v12

    const-string v3, "name=\'lock_pattern\'"

    move-object v0, p1

    move-object v5, v4

    move-object v6, v4

    move-object v7, v4

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 1652
    .local v8, c:Landroid/database/Cursor;
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 1653
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1654
    invoke-interface {v8, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 1655
    .local v10, lockPattern:Ljava/lang/String;
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1658
    :try_start_0
    new-instance v11, Lcom/android/internal/widget/LockPatternUtils;

    iget-object v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-direct {v11, v0}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    .line 1659
    .local v11, lpu:Lcom/android/internal/widget/LockPatternUtils;
    invoke-static {v10}, Lcom/android/internal/widget/LockPatternUtils;->stringToPattern(Ljava/lang/String;)Ljava/util/List;

    move-result-object v9

    .line 1661
    .local v9, cellPattern:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/widget/LockPatternView$Cell;>;"
    invoke-virtual {v11, v9}, Lcom/android/internal/widget/LockPatternUtils;->saveLockPattern(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1666
    .end local v9           #cellPattern:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/widget/LockPatternView$Cell;>;"
    .end local v11           #lpu:Lcom/android/internal/widget/LockPatternUtils;
    :cond_0
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1667
    const-string v0, "system"

    const-string v1, "name=\'lock_pattern\'"

    invoke-virtual {p1, v0, v1, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1671
    .end local v10           #lockPattern:Ljava/lang/String;
    :goto_1
    return-void

    .line 1669
    :cond_1
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 1662
    .restart local v10       #lockPattern:Ljava/lang/String;
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private upgradeScreenTimeout(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 3
    .parameter "db"

    .prologue
    .line 1721
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1722
    const/4 v0, 0x0

    .line 1724
    .local v0, stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    const-string v1, "INSERT OR REPLACE INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 1726
    const-string v1, "screen_off_timeout"

    const/high16 v2, 0x7f06

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1728
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1730
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1731
    if-eqz v0, :cond_0

    .line 1732
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1734
    :cond_0
    return-void

    .line 1730
    :catchall_0
    move-exception v1

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1731
    if-eqz v0, :cond_1

    .line 1732
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_1
    throw v1
.end method

.method private upgradeScreenTimeoutFromNever(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 10
    .parameter "db"

    .prologue
    const/4 v4, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 1675
    const-string v1, "system"

    new-array v2, v4, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v6

    const-string v0, "value"

    aput-object v0, v2, v7

    const-string v3, "name=? AND value=?"

    new-array v4, v4, [Ljava/lang/String;

    const-string v0, "screen_off_timeout"

    aput-object v0, v4, v6

    const-string v0, "-1"

    aput-object v0, v4, v7

    move-object v0, p1

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 1679
    .local v8, c:Landroid/database/Cursor;
    const/4 v9, 0x0

    .line 1680
    .local v9, stmt:Landroid/database/sqlite/SQLiteStatement;
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_2

    .line 1681
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1683
    :try_start_0
    const-string v0, "INSERT OR REPLACE INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v9

    .line 1687
    const-string v0, "screen_off_timeout"

    const v1, 0x1b7740

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v9, v0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1690
    if-eqz v9, :cond_0

    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1695
    :cond_0
    :goto_0
    return-void

    .line 1690
    :catchall_0
    move-exception v0

    if-eqz v9, :cond_1

    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_1
    throw v0

    .line 1693
    :cond_2
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    goto :goto_0
.end method

.method private upgradeVibrateSettingFromNone(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4
    .parameter "db"

    .prologue
    const/4 v3, 0x0

    .line 1698
    const-string v2, "vibrate_on"

    invoke-direct {p0, p1, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->getIntValueFromSystem(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;I)I

    move-result v1

    .line 1700
    .local v1, vibrateSetting:I
    and-int/lit8 v2, v1, 0x3

    if-nez v2, :cond_0

    .line 1701
    const/4 v2, 0x2

    invoke-static {v3, v3, v2}, Landroid/media/AudioService;->getValueForVibrateSetting(III)I

    move-result v1

    .line 1705
    :cond_0
    const/4 v2, 0x1

    invoke-static {v1, v2, v1}, Landroid/media/AudioService;->getValueForVibrateSetting(III)I

    move-result v1

    .line 1708
    const/4 v0, 0x0

    .line 1710
    .local v0, stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    const-string v2, "INSERT OR REPLACE INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v2}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 1712
    const-string v2, "vibrate_on"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v0, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1714
    if-eqz v0, :cond_1

    .line 1715
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1717
    :cond_1
    return-void

    .line 1714
    :catchall_0
    move-exception v2

    if-eqz v0, :cond_2

    .line 1715
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_2
    throw v2
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .parameter "db"

    .prologue
    .line 160
    const-string v1, "CREATE TABLE system (_id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT UNIQUE ON CONFLICT REPLACE,value TEXT);"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 165
    const-string v1, "CREATE INDEX systemIndex1 ON system (name);"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 167
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->createSecureTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 170
    iget v1, p0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v1, :cond_0

    .line 171
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->createGlobalTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 174
    :cond_0
    const-string v1, "CREATE TABLE bluetooth_devices (_id INTEGER PRIMARY KEY,name TEXT,addr TEXT,channel INTEGER,type INTEGER);"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 182
    const-string v1, "CREATE TABLE bookmarks (_id INTEGER PRIMARY KEY,title TEXT,folder TEXT,intent TEXT,shortcut INTEGER,ordering INTEGER);"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 191
    const-string v1, "CREATE INDEX bookmarksIndex1 ON bookmarks (folder);"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 192
    const-string v1, "CREATE INDEX bookmarksIndex2 ON bookmarks (shortcut);"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 195
    const/4 v0, 0x0

    .line 197
    .local v0, onlyCore:Z
    :try_start_0
    const-string v1, "package"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Landroid/content/pm/IPackageManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/content/pm/IPackageManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/pm/IPackageManager;->isOnlyCoreApps()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 201
    :goto_0
    if-nez v0, :cond_1

    .line 202
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->loadBookmarks(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 206
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->loadVolumeLevels(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 209
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->loadSettings(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 210
    return-void

    .line 199
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 36
    .parameter "db"
    .parameter "oldVersion"
    .parameter "currentVersion"

    .prologue
    .line 214
    const-string v3, "SettingsProvider"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Upgrading settings database from version "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    move/from16 v32, p2

    .line 226
    .local v32, upgradeVersion:I
    const/16 v3, 0x14

    move/from16 v0, v32

    if-ne v0, v3, :cond_0

    .line 233
    const/4 v3, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadVibrateSetting(Landroid/database/sqlite/SQLiteDatabase;Z)V

    .line 235
    const/16 v32, 0x15

    .line 238
    :cond_0
    const/16 v3, 0x16

    move/from16 v0, v32

    if-ge v0, v3, :cond_1

    .line 239
    const/16 v32, 0x16

    .line 241
    invoke-direct/range {p0 .. p1}, Lcom/android/providers/settings/DatabaseHelper;->upgradeLockPatternLocation(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 244
    :cond_1
    const/16 v3, 0x17

    move/from16 v0, v32

    if-ge v0, v3, :cond_2

    .line 245
    const-string v3, "UPDATE favorites SET iconResource=0 WHERE iconType=0"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 246
    const/16 v32, 0x17

    .line 249
    :cond_2
    const/16 v3, 0x17

    move/from16 v0, v32

    if-ne v0, v3, :cond_3

    .line 250
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 252
    :try_start_0
    const-string v3, "ALTER TABLE favorites ADD spanX INTEGER"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 253
    const-string v3, "ALTER TABLE favorites ADD spanY INTEGER"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 255
    const-string v3, "UPDATE favorites SET spanX=1, spanY=1 WHERE itemType<=0"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 257
    const-string v3, "UPDATE favorites SET spanX=2, spanY=2 WHERE itemType=1000 or itemType=1002"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 260
    const-string v3, "UPDATE favorites SET spanX=4, spanY=1 WHERE itemType=1001"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 261
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 263
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 265
    const/16 v32, 0x18

    .line 268
    :cond_3
    const/16 v3, 0x18

    move/from16 v0, v32

    if-ne v0, v3, :cond_4

    .line 269
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 273
    :try_start_1
    const-string v3, "DELETE FROM system WHERE name=\'network_preference\'"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 274
    const-string v3, "INSERT INTO system (\'name\', \'value\') values (\'network_preference\', \'1\')"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 276
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 278
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 280
    const/16 v32, 0x19

    .line 283
    :cond_4
    const/16 v3, 0x19

    move/from16 v0, v32

    if-ne v0, v3, :cond_5

    .line 284
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 286
    :try_start_2
    const-string v3, "ALTER TABLE favorites ADD uri TEXT"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 287
    const-string v3, "ALTER TABLE favorites ADD displayMode INTEGER"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 288
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 290
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 292
    const/16 v32, 0x1a

    .line 295
    :cond_5
    const/16 v3, 0x1a

    move/from16 v0, v32

    if-ne v0, v3, :cond_6

    .line 297
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 299
    :try_start_3
    invoke-direct/range {p0 .. p1}, Lcom/android/providers/settings/DatabaseHelper;->createSecureTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 300
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 302
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 304
    const/16 v32, 0x1b

    .line 307
    :cond_6
    const/16 v3, 0x1b

    move/from16 v0, v32

    if-ne v0, v3, :cond_7

    .line 308
    const/16 v3, 0x1f

    new-array v7, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "adb_enabled"

    aput-object v4, v7, v3

    const/4 v3, 0x1

    const-string v4, "android_id"

    aput-object v4, v7, v3

    const/4 v3, 0x2

    const-string v4, "bluetooth_on"

    aput-object v4, v7, v3

    const/4 v3, 0x3

    const-string v4, "data_roaming"

    aput-object v4, v7, v3

    const/4 v3, 0x4

    const-string v4, "device_provisioned"

    aput-object v4, v7, v3

    const/4 v3, 0x5

    const-string v4, "http_proxy"

    aput-object v4, v7, v3

    const/4 v3, 0x6

    const-string v4, "install_non_market_apps"

    aput-object v4, v7, v3

    const/4 v3, 0x7

    const-string v4, "location_providers_allowed"

    aput-object v4, v7, v3

    const/16 v3, 0x8

    const-string v4, "logging_id"

    aput-object v4, v7, v3

    const/16 v3, 0x9

    const-string v4, "network_preference"

    aput-object v4, v7, v3

    const/16 v3, 0xa

    const-string v4, "parental_control_enabled"

    aput-object v4, v7, v3

    const/16 v3, 0xb

    const-string v4, "parental_control_last_update"

    aput-object v4, v7, v3

    const/16 v3, 0xc

    const-string v4, "parental_control_redirect_url"

    aput-object v4, v7, v3

    const/16 v3, 0xd

    const-string v4, "settings_classname"

    aput-object v4, v7, v3

    const/16 v3, 0xe

    const-string v4, "usb_mass_storage_enabled"

    aput-object v4, v7, v3

    const/16 v3, 0xf

    const-string v4, "use_google_mail"

    aput-object v4, v7, v3

    const/16 v3, 0x10

    const-string v4, "wifi_networks_available_notification_on"

    aput-object v4, v7, v3

    const/16 v3, 0x11

    const-string v4, "wifi_networks_available_repeat_delay"

    aput-object v4, v7, v3

    const/16 v3, 0x12

    const-string v4, "wifi_num_open_networks_kept"

    aput-object v4, v7, v3

    const/16 v3, 0x13

    const-string v4, "wifi_on"

    aput-object v4, v7, v3

    const/16 v3, 0x14

    const-string v4, "wifi_watchdog_acceptable_packet_loss_percentage"

    aput-object v4, v7, v3

    const/16 v3, 0x15

    const-string v4, "wifi_watchdog_ap_count"

    aput-object v4, v7, v3

    const/16 v3, 0x16

    const-string v4, "wifi_watchdog_background_check_delay_ms"

    aput-object v4, v7, v3

    const/16 v3, 0x17

    const-string v4, "wifi_watchdog_background_check_enabled"

    aput-object v4, v7, v3

    const/16 v3, 0x18

    const-string v4, "wifi_watchdog_background_check_timeout_ms"

    aput-object v4, v7, v3

    const/16 v3, 0x19

    const-string v4, "wifi_watchdog_initial_ignored_ping_count"

    aput-object v4, v7, v3

    const/16 v3, 0x1a

    const-string v4, "wifi_watchdog_max_ap_checks"

    aput-object v4, v7, v3

    const/16 v3, 0x1b

    const-string v4, "wifi_watchdog_on"

    aput-object v4, v7, v3

    const/16 v3, 0x1c

    const-string v4, "wifi_watchdog_ping_count"

    aput-object v4, v7, v3

    const/16 v3, 0x1d

    const-string v4, "wifi_watchdog_ping_delay_ms"

    aput-object v4, v7, v3

    const/16 v3, 0x1e

    const-string v4, "wifi_watchdog_ping_timeout_ms"

    aput-object v4, v7, v3

    .line 341
    .local v7, settingsToMove:[Ljava/lang/String;
    const-string v5, "system"

    const-string v6, "secure"

    const/4 v8, 0x0

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    invoke-direct/range {v3 .. v8}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 342
    const/16 v32, 0x1c

    .line 345
    .end local v7           #settingsToMove:[Ljava/lang/String;
    :cond_7
    const/16 v3, 0x1c

    move/from16 v0, v32

    if-eq v0, v3, :cond_8

    const/16 v3, 0x1d

    move/from16 v0, v32

    if-ne v0, v3, :cond_9

    .line 352
    :cond_8
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 354
    :try_start_4
    const-string v3, "DELETE FROM system WHERE name=\'mode_ringer_streams_affected\'"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 356
    const/16 v25, 0x26

    .line 359
    .local v25, newValue:I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "INSERT INTO system (\'name\', \'value\') values (\'mode_ringer_streams_affected\', \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static/range {v25 .. v25}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\')"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 362
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 364
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 367
    const/16 v32, 0x1e

    .line 370
    .end local v25           #newValue:I
    :cond_9
    const/16 v3, 0x1e

    move/from16 v0, v32

    if-ne v0, v3, :cond_a

    .line 376
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 378
    :try_start_5
    const-string v3, "UPDATE bookmarks SET folder = \'@quicklaunch\'"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 379
    const-string v3, "UPDATE bookmarks SET title = \'\'"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 380
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    .line 382
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 384
    const/16 v32, 0x1f

    .line 387
    :cond_a
    const/16 v3, 0x1f

    move/from16 v0, v32

    if-ne v0, v3, :cond_c

    .line 392
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 393
    const/16 v28, 0x0

    .line 395
    .local v28, stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_6
    const-string v3, "DELETE FROM system WHERE name=\'window_animation_scale\'"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 397
    const-string v3, "DELETE FROM system WHERE name=\'transition_animation_scale\'"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 399
    const-string v3, "INSERT INTO system(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 401
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadDefaultAnimationSettings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 402
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_6

    .line 404
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 405
    if-eqz v28, :cond_b

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 407
    :cond_b
    const/16 v32, 0x20

    .line 410
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_c
    const/16 v3, 0x20

    move/from16 v0, v32

    if-ne v0, v3, :cond_e

    .line 413
    const-string v3, "ro.com.android.wifi-watchlist"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    .line 414
    .local v34, wifiWatchList:Ljava/lang/String;
    invoke-static/range {v34 .. v34}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_d

    .line 415
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 417
    :try_start_7
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "INSERT OR IGNORE INTO secure(name,value) values(\'wifi_watchdog_watch_list\',\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v34

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\');"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 420
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_7

    .line 422
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 425
    :cond_d
    const/16 v32, 0x21

    .line 428
    .end local v34           #wifiWatchList:Ljava/lang/String;
    :cond_e
    const/16 v3, 0x21

    move/from16 v0, v32

    if-ne v0, v3, :cond_f

    .line 430
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 432
    :try_start_8
    const-string v3, "INSERT INTO system(name,value) values(\'zoom\',\'2\');"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 433
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_8

    .line 435
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 437
    const/16 v32, 0x22

    .line 440
    :cond_f
    const/16 v3, 0x22

    move/from16 v0, v32

    if-ne v0, v3, :cond_11

    .line 441
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 442
    const/16 v28, 0x0

    .line 444
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_9
    const-string v3, "INSERT OR IGNORE INTO secure(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 446
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadSecure35Settings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 447
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_9

    .line 449
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 450
    if-eqz v28, :cond_10

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 452
    :cond_10
    const/16 v32, 0x23

    .line 458
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_11
    const/16 v3, 0x23

    move/from16 v0, v32

    if-ne v0, v3, :cond_12

    .line 459
    const/16 v32, 0x24

    .line 462
    :cond_12
    const/16 v3, 0x24

    move/from16 v0, v32

    if-ne v0, v3, :cond_13

    .line 465
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 467
    :try_start_a
    const-string v3, "DELETE FROM system WHERE name=\'mode_ringer_streams_affected\'"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 469
    const/16 v25, 0xa6

    .line 473
    .restart local v25       #newValue:I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "INSERT INTO system (\'name\', \'value\') values (\'mode_ringer_streams_affected\', \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static/range {v25 .. v25}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\')"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 476
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_a

    .line 478
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 480
    const/16 v32, 0x25

    .line 483
    .end local v25           #newValue:I
    :cond_13
    const/16 v3, 0x25

    move/from16 v0, v32

    if-ne v0, v3, :cond_15

    .line 484
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 485
    const/16 v28, 0x0

    .line 487
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_b
    const-string v3, "INSERT OR IGNORE INTO system(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 489
    const-string v3, "airplane_mode_toggleable_radios"

    const v4, 0x7f040002

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 491
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_b

    .line 493
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 494
    if-eqz v28, :cond_14

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 496
    :cond_14
    const/16 v32, 0x26

    .line 499
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_15
    const/16 v3, 0x26

    move/from16 v0, v32

    if-ne v0, v3, :cond_16

    .line 500
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 502
    :try_start_c
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f05000b

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    if-eqz v3, :cond_7a

    const-string v33, "1"

    .line 504
    .local v33, value:Ljava/lang/String;
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "INSERT OR IGNORE INTO secure(name,value) values(\'assisted_gps_enabled\',\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v33

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\');"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 506
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_c

    .line 508
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 511
    const/16 v32, 0x27

    .line 514
    .end local v33           #value:Ljava/lang/String;
    :cond_16
    const/16 v3, 0x27

    move/from16 v0, v32

    if-ne v0, v3, :cond_17

    .line 515
    invoke-direct/range {p0 .. p1}, Lcom/android/providers/settings/DatabaseHelper;->upgradeAutoBrightness(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 516
    const/16 v32, 0x28

    .line 519
    :cond_17
    const/16 v3, 0x28

    move/from16 v0, v32

    if-ne v0, v3, :cond_19

    .line 523
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 524
    const/16 v28, 0x0

    .line 526
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_d
    const-string v3, "DELETE FROM system WHERE name=\'window_animation_scale\'"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 528
    const-string v3, "DELETE FROM system WHERE name=\'transition_animation_scale\'"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 530
    const-string v3, "INSERT INTO system(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 532
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadDefaultAnimationSettings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 533
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_d

    .line 535
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 536
    if-eqz v28, :cond_18

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 538
    :cond_18
    const/16 v32, 0x29

    .line 541
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_19
    const/16 v3, 0x29

    move/from16 v0, v32

    if-ne v0, v3, :cond_1b

    .line 545
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 546
    const/16 v28, 0x0

    .line 548
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_e
    const-string v3, "DELETE FROM system WHERE name=\'haptic_feedback_enabled\'"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 550
    const-string v3, "INSERT INTO system(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 552
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadDefaultHapticSettings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 553
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_e

    .line 555
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 556
    if-eqz v28, :cond_1a

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 558
    :cond_1a
    const/16 v32, 0x2a

    .line 561
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_1b
    const/16 v3, 0x2a

    move/from16 v0, v32

    if-ne v0, v3, :cond_1d

    .line 565
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 566
    const/16 v28, 0x0

    .line 568
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_f
    const-string v3, "INSERT INTO system(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 570
    const-string v3, "notification_light_pulse"

    const v4, 0x7f050011

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 572
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_f

    .line 574
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 575
    if-eqz v28, :cond_1c

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 577
    :cond_1c
    const/16 v32, 0x2b

    .line 580
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_1d
    const/16 v3, 0x2b

    move/from16 v0, v32

    if-ne v0, v3, :cond_1f

    .line 584
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 585
    const/16 v28, 0x0

    .line 587
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_10
    const-string v3, "INSERT OR IGNORE INTO system(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 589
    const-string v3, "volume_bluetooth_sco"

    sget-object v4, Landroid/media/AudioManager;->DEFAULT_STREAM_VOLUME:[I

    const/4 v5, 0x6

    aget v4, v4, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 591
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_10

    .line 593
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 594
    if-eqz v28, :cond_1e

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 596
    :cond_1e
    const/16 v32, 0x2c

    .line 599
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_1f
    const/16 v3, 0x2c

    move/from16 v0, v32

    if-ne v0, v3, :cond_20

    .line 603
    const-string v3, "DROP TABLE IF EXISTS gservices"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 604
    const-string v3, "DROP INDEX IF EXISTS gservicesIndex1"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 605
    const/16 v32, 0x2d

    .line 608
    :cond_20
    const/16 v3, 0x2d

    move/from16 v0, v32

    if-ne v0, v3, :cond_21

    .line 612
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 614
    :try_start_11
    const-string v3, "INSERT INTO secure(name,value) values(\'mount_play_not_snd\',\'1\');"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 616
    const-string v3, "INSERT INTO secure(name,value) values(\'mount_ums_autostart\',\'0\');"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 618
    const-string v3, "INSERT INTO secure(name,value) values(\'mount_ums_prompt\',\'1\');"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 620
    const-string v3, "INSERT INTO secure(name,value) values(\'mount_ums_notify_enabled\',\'1\');"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 622
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_11

    .line 624
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 626
    const/16 v32, 0x2e

    .line 629
    :cond_21
    const/16 v3, 0x2e

    move/from16 v0, v32

    if-ne v0, v3, :cond_22

    .line 634
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 636
    :try_start_12
    const-string v3, "DELETE FROM system WHERE name=\'lockscreen.password_type\';"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 637
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_12

    .line 639
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 641
    const/16 v32, 0x2f

    .line 645
    :cond_22
    const/16 v3, 0x2f

    move/from16 v0, v32

    if-ne v0, v3, :cond_23

    .line 650
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 652
    :try_start_13
    const-string v3, "DELETE FROM system WHERE name=\'lockscreen.password_type\';"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 653
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_13

    .line 655
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 657
    const/16 v32, 0x30

    .line 660
    :cond_23
    const/16 v3, 0x30

    move/from16 v0, v32

    if-ne v0, v3, :cond_24

    .line 665
    const/16 v32, 0x31

    .line 668
    :cond_24
    const/16 v3, 0x31

    move/from16 v0, v32

    if-ne v0, v3, :cond_26

    .line 672
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 673
    const/16 v28, 0x0

    .line 675
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_14
    const-string v3, "INSERT INTO system(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 677
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadUISoundEffectsSettings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 678
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_14

    .line 680
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 681
    if-eqz v28, :cond_25

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 684
    :cond_25
    const/16 v32, 0x32

    .line 687
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_26
    const/16 v3, 0x32

    move/from16 v0, v32

    if-ne v0, v3, :cond_27

    .line 691
    const/16 v32, 0x33

    .line 694
    :cond_27
    const/16 v3, 0x33

    move/from16 v0, v32

    if-ne v0, v3, :cond_28

    .line 696
    const/16 v3, 0x9

    new-array v7, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "lock_pattern_autolock"

    aput-object v4, v7, v3

    const/4 v3, 0x1

    const-string v4, "lock_pattern_visible_pattern"

    aput-object v4, v7, v3

    const/4 v3, 0x2

    const-string v4, "lock_pattern_tactile_feedback_enabled"

    aput-object v4, v7, v3

    const/4 v3, 0x3

    const-string v4, "lockscreen.password_type"

    aput-object v4, v7, v3

    const/4 v3, 0x4

    const-string v4, "lockscreen.lockoutattemptdeadline"

    aput-object v4, v7, v3

    const/4 v3, 0x5

    const-string v4, "lockscreen.patterneverchosen"

    aput-object v4, v7, v3

    const/4 v3, 0x6

    const-string v4, "lock_pattern_autolock"

    aput-object v4, v7, v3

    const/4 v3, 0x7

    const-string v4, "lockscreen.lockedoutpermanently"

    aput-object v4, v7, v3

    const/16 v3, 0x8

    const-string v4, "lockscreen.password_salt"

    aput-object v4, v7, v3

    .line 707
    .restart local v7       #settingsToMove:[Ljava/lang/String;
    const-string v5, "system"

    const-string v6, "secure"

    const/4 v8, 0x0

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    invoke-direct/range {v3 .. v8}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 708
    const/16 v32, 0x34

    .line 711
    .end local v7           #settingsToMove:[Ljava/lang/String;
    :cond_28
    const/16 v3, 0x34

    move/from16 v0, v32

    if-ne v0, v3, :cond_2a

    .line 713
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 714
    const/16 v28, 0x0

    .line 716
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_15
    const-string v3, "INSERT INTO system(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 718
    const-string v3, "vibrate_in_silent"

    const v4, 0x7f050019

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 720
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_15

    .line 722
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 723
    if-eqz v28, :cond_29

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 726
    :cond_29
    const/16 v32, 0x35

    .line 729
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_2a
    const/16 v3, 0x35

    move/from16 v0, v32

    if-ne v0, v3, :cond_2b

    .line 733
    const/16 v32, 0x36

    .line 736
    :cond_2b
    const/16 v3, 0x36

    move/from16 v0, v32

    if-ne v0, v3, :cond_2c

    .line 740
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 742
    :try_start_16
    invoke-direct/range {p0 .. p1}, Lcom/android/providers/settings/DatabaseHelper;->upgradeScreenTimeoutFromNever(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 743
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_16

    .line 745
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 748
    const/16 v32, 0x37

    .line 751
    :cond_2c
    const/16 v3, 0x37

    move/from16 v0, v32

    if-ne v0, v3, :cond_2e

    .line 753
    const/4 v3, 0x2

    new-array v7, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "set_install_location"

    aput-object v4, v7, v3

    const/4 v3, 0x1

    const-string v4, "default_install_location"

    aput-object v4, v7, v3

    .line 757
    .restart local v7       #settingsToMove:[Ljava/lang/String;
    const-string v5, "system"

    const-string v6, "secure"

    const/4 v8, 0x0

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    invoke-direct/range {v3 .. v8}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 758
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 759
    const/16 v28, 0x0

    .line 761
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_17
    const-string v3, "INSERT INTO system(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 763
    const-string v3, "set_install_location"

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 764
    const-string v3, "default_install_location"

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 766
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_17

    .line 768
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 769
    if-eqz v28, :cond_2d

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 771
    :cond_2d
    const/16 v32, 0x38

    .line 774
    .end local v7           #settingsToMove:[Ljava/lang/String;
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_2e
    const/16 v3, 0x38

    move/from16 v0, v32

    if-ne v0, v3, :cond_30

    .line 778
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 779
    const/16 v28, 0x0

    .line 781
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_18
    const-string v3, "DELETE FROM system WHERE name=\'airplane_mode_toggleable_radios\'"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 783
    const-string v3, "INSERT OR IGNORE INTO system(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 785
    const-string v3, "airplane_mode_toggleable_radios"

    const v4, 0x7f040002

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 787
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_18

    .line 789
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 790
    if-eqz v28, :cond_2f

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 792
    :cond_2f
    const/16 v32, 0x39

    .line 797
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_30
    const/16 v3, 0x39

    move/from16 v0, v32

    if-ne v0, v3, :cond_32

    .line 803
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 804
    const/16 v28, 0x0

    .line 806
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_19
    const-string v3, "INSERT INTO secure(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 808
    const-string v3, "accessibility_script_injection"

    const v4, 0x7f05001a

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 810
    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 811
    const-string v3, "INSERT INTO secure(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 813
    const-string v3, "accessibility_web_content_key_bindings"

    const v4, 0x7f04000d

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 815
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_19

    .line 817
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 818
    if-eqz v28, :cond_31

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 820
    :cond_31
    const/16 v32, 0x3a

    .line 823
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_32
    const/16 v3, 0x3a

    move/from16 v0, v32

    if-ne v0, v3, :cond_34

    .line 825
    const-string v3, "auto_time"

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->getIntValueFromSystem(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;I)I

    move-result v21

    .line 826
    .local v21, autoTimeValue:I
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 827
    const/16 v28, 0x0

    .line 829
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_1a
    const-string v3, "INSERT INTO system(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 830
    const-string v3, "auto_time_zone"

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 832
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_1a

    .line 834
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 835
    if-eqz v28, :cond_33

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 837
    :cond_33
    const/16 v32, 0x3b

    .line 840
    .end local v21           #autoTimeValue:I
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_34
    const/16 v3, 0x3b

    move/from16 v0, v32

    if-ne v0, v3, :cond_36

    .line 842
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 843
    const/16 v28, 0x0

    .line 845
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_1b
    const-string v3, "INSERT INTO system(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 847
    const-string v3, "user_rotation"

    const v4, 0x7f060007

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 849
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_1b

    .line 851
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 852
    if-eqz v28, :cond_35

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 854
    :cond_35
    const/16 v32, 0x3c

    .line 857
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_36
    const/16 v3, 0x3c

    move/from16 v0, v32

    if-ne v0, v3, :cond_37

    .line 861
    const/16 v32, 0x3d

    .line 864
    :cond_37
    const/16 v3, 0x3d

    move/from16 v0, v32

    if-ne v0, v3, :cond_38

    .line 868
    const/16 v32, 0x3e

    .line 872
    :cond_38
    const/16 v3, 0x3e

    move/from16 v0, v32

    if-ne v0, v3, :cond_39

    .line 876
    const/16 v32, 0x3f

    .line 879
    :cond_39
    const/16 v3, 0x3f

    move/from16 v0, v32

    if-ne v0, v3, :cond_3a

    .line 882
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 884
    :try_start_1c
    const-string v3, "DELETE FROM system WHERE name=\'mode_ringer_streams_affected\'"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 886
    const/16 v25, 0xae

    .line 891
    .restart local v25       #newValue:I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "INSERT INTO system (\'name\', \'value\') values (\'mode_ringer_streams_affected\', \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static/range {v25 .. v25}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\')"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 894
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_1c

    .line 896
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 898
    const/16 v32, 0x40

    .line 901
    .end local v25           #newValue:I
    :cond_3a
    const/16 v3, 0x40

    move/from16 v0, v32

    if-ne v0, v3, :cond_3c

    .line 903
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 904
    const/16 v28, 0x0

    .line 906
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_1d
    const-string v3, "INSERT INTO secure(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 908
    const-string v3, "long_press_timeout"

    const v4, 0x7f06000a

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 910
    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 911
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_1d

    .line 913
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 914
    if-eqz v28, :cond_3b

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 916
    :cond_3b
    const/16 v32, 0x41

    .line 921
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_3c
    const/16 v3, 0x41

    move/from16 v0, v32

    if-ne v0, v3, :cond_3e

    .line 925
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 926
    const/16 v28, 0x0

    .line 928
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_1e
    const-string v3, "DELETE FROM system WHERE name=\'window_animation_scale\'"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 930
    const-string v3, "DELETE FROM system WHERE name=\'transition_animation_scale\'"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 932
    const-string v3, "INSERT INTO system(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 934
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadDefaultAnimationSettings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 935
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_1e

    .line 937
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 938
    if-eqz v28, :cond_3d

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 940
    :cond_3d
    const/16 v32, 0x42

    .line 943
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_3e
    const/16 v3, 0x42

    move/from16 v0, v32

    if-ne v0, v3, :cond_40

    .line 946
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 948
    const/16 v27, 0xa6

    .line 952
    .local v27, ringerModeAffectedStreams:I
    :try_start_1f
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x1110030

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    if-nez v3, :cond_3f

    .line 954
    or-int/lit8 v27, v27, 0x8

    .line 956
    :cond_3f
    const-string v3, "DELETE FROM system WHERE name=\'mode_ringer_streams_affected\'"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 958
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "INSERT INTO system (\'name\', \'value\') values (\'mode_ringer_streams_affected\', \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static/range {v27 .. v27}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\')"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 961
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_1f

    .line 963
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 965
    const/16 v32, 0x43

    .line 968
    .end local v27           #ringerModeAffectedStreams:I
    :cond_40
    const/16 v3, 0x43

    move/from16 v0, v32

    if-ne v0, v3, :cond_42

    .line 970
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 971
    const/16 v28, 0x0

    .line 973
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_20
    const-string v3, "INSERT INTO secure(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 975
    const-string v3, "touch_exploration_enabled"

    const v4, 0x7f05001c

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 977
    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 978
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_20

    .line 980
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 981
    if-eqz v28, :cond_41

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 983
    :cond_41
    const/16 v32, 0x44

    .line 986
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_42
    const/16 v3, 0x44

    move/from16 v0, v32

    if-ne v0, v3, :cond_43

    .line 988
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 990
    :try_start_21
    const-string v3, "DELETE FROM system WHERE name=\'notifications_use_ring_volume\'"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 992
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_21

    .line 994
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 996
    const/16 v32, 0x45

    .line 999
    :cond_43
    const/16 v3, 0x45

    move/from16 v0, v32

    if-ne v0, v3, :cond_44

    .line 1001
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f040001

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v20

    .line 1003
    .local v20, airplaneRadios:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f040002

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v29

    .line 1005
    .local v29, toggleableRadios:Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1007
    :try_start_22
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "UPDATE system SET value=\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "WHERE name=\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "airplane_mode_radios"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1009
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "UPDATE system SET value=\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v29

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "WHERE name=\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "airplane_mode_toggleable_radios"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1011
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_22

    .line 1013
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1015
    const/16 v32, 0x46

    .line 1018
    .end local v20           #airplaneRadios:Ljava/lang/String;
    .end local v29           #toggleableRadios:Ljava/lang/String;
    :cond_44
    const/16 v3, 0x46

    move/from16 v0, v32

    if-ne v0, v3, :cond_45

    .line 1020
    invoke-direct/range {p0 .. p1}, Lcom/android/providers/settings/DatabaseHelper;->loadBookmarks(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1021
    const/16 v32, 0x47

    .line 1024
    :cond_45
    const/16 v3, 0x47

    move/from16 v0, v32

    if-ne v0, v3, :cond_47

    .line 1026
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1027
    const/16 v28, 0x0

    .line 1029
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_23
    const-string v3, "INSERT INTO secure(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 1031
    const-string v3, "speak_password"

    const v4, 0x7f05001b

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1033
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_23

    .line 1035
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1036
    if-eqz v28, :cond_46

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1038
    :cond_46
    const/16 v32, 0x48

    .line 1041
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_47
    const/16 v3, 0x48

    move/from16 v0, v32

    if-ne v0, v3, :cond_49

    .line 1043
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1044
    const/16 v28, 0x0

    .line 1046
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_24
    const-string v3, "INSERT OR REPLACE INTO system(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 1048
    const-string v3, "vibrate_in_silent"

    const v4, 0x7f050019

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1050
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_24

    .line 1052
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1053
    if-eqz v28, :cond_48

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1055
    :cond_48
    const/16 v32, 0x49

    .line 1058
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_49
    const/16 v3, 0x49

    move/from16 v0, v32

    if-ne v0, v3, :cond_4a

    .line 1059
    invoke-direct/range {p0 .. p1}, Lcom/android/providers/settings/DatabaseHelper;->upgradeVibrateSettingFromNone(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1060
    const/16 v32, 0x4a

    .line 1063
    :cond_4a
    const/16 v3, 0x4a

    move/from16 v0, v32

    if-ne v0, v3, :cond_4c

    .line 1065
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1066
    const/16 v28, 0x0

    .line 1068
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_25
    const-string v3, "INSERT INTO secure(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 1069
    const-string v3, "accessibility_script_injection_url"

    const v4, 0x7f04000e

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1071
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_25

    .line 1073
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1074
    if-eqz v28, :cond_4b

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1076
    :cond_4b
    const/16 v32, 0x4b

    .line 1078
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_4c
    const/16 v3, 0x4b

    move/from16 v0, v32

    if-ne v0, v3, :cond_51

    .line 1079
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1080
    const/16 v28, 0x0

    .line 1081
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    const/16 v22, 0x0

    .line 1083
    .local v22, c:Landroid/database/Cursor;
    :try_start_26
    const-string v9, "secure"

    const/4 v3, 0x2

    new-array v10, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "_id"

    aput-object v4, v10, v3

    const/4 v3, 0x1

    const-string v4, "value"

    aput-object v4, v10, v3

    const-string v11, "name=\'lockscreen.disabled\'"

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v8, p1

    invoke-virtual/range {v8 .. v15}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v22

    .line 1087
    if-eqz v22, :cond_4d

    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-nez v3, :cond_4e

    .line 1088
    :cond_4d
    const-string v3, "INSERT INTO system(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 1090
    const-string v3, "lockscreen.disabled"

    const v4, 0x7f050016

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1093
    :cond_4e
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_26
    .catchall {:try_start_26 .. :try_end_26} :catchall_26

    .line 1095
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1096
    if-eqz v22, :cond_4f

    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->close()V

    .line 1097
    :cond_4f
    if-eqz v28, :cond_50

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1099
    :cond_50
    const/16 v32, 0x4c

    .line 1104
    .end local v22           #c:Landroid/database/Cursor;
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_51
    const/16 v3, 0x4c

    move/from16 v0, v32

    if-ne v0, v3, :cond_52

    .line 1106
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1108
    :try_start_27
    const-string v3, "DELETE FROM system WHERE name=\'vibrate_in_silent\'"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1110
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_27

    .line 1112
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1115
    const/16 v32, 0x4d

    .line 1118
    :cond_52
    const/16 v3, 0x4d

    move/from16 v0, v32

    if-ne v0, v3, :cond_53

    .line 1120
    invoke-direct/range {p0 .. p1}, Lcom/android/providers/settings/DatabaseHelper;->loadVibrateWhenRingingSetting(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1122
    const/16 v32, 0x4e

    .line 1125
    :cond_53
    const/16 v3, 0x4e

    move/from16 v0, v32

    if-ne v0, v3, :cond_55

    .line 1127
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1128
    const/16 v28, 0x0

    .line 1130
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_28
    const-string v3, "INSERT OR REPLACE INTO secure(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 1132
    const-string v3, "accessibility_script_injection_url"

    const v4, 0x7f04000e

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1134
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_28
    .catchall {:try_start_28 .. :try_end_28} :catchall_28

    .line 1136
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1137
    if-eqz v28, :cond_54

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1139
    :cond_54
    const/16 v32, 0x4f

    .line 1142
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_55
    const/16 v3, 0x4f

    move/from16 v0, v32

    if-ne v0, v3, :cond_57

    .line 1159
    const-string v3, "secure"

    const-string v4, "accessibility_enabled"

    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v3, v4, v5}, Lcom/android/providers/settings/DatabaseHelper;->getIntValueFromTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_8f

    const/16 v19, 0x1

    .line 1161
    .local v19, accessibilityEnabled:Z
    :goto_1
    const-string v3, "secure"

    const-string v4, "touch_exploration_enabled"

    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v3, v4, v5}, Lcom/android/providers/settings/DatabaseHelper;->getIntValueFromTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_90

    const/16 v30, 0x1

    .line 1163
    .local v30, touchExplorationEnabled:Z
    :goto_2
    if-eqz v19, :cond_56

    if-eqz v30, :cond_56

    .line 1164
    const-string v3, "secure"

    const-string v4, "enabled_accessibility_services"

    const-string v5, ""

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v3, v4, v5}, Lcom/android/providers/settings/DatabaseHelper;->getStringValueFromTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 1166
    .local v24, enabledServices:Ljava/lang/String;
    const-string v3, "secure"

    const-string v4, "touch_exploration_granted_accessibility_services"

    const-string v5, ""

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v3, v4, v5}, Lcom/android/providers/settings/DatabaseHelper;->getStringValueFromTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    .line 1168
    .local v31, touchExplorationGrantedServices:Ljava/lang/String;
    invoke-static/range {v31 .. v31}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_56

    invoke-static/range {v24 .. v24}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_56

    .line 1170
    const/16 v28, 0x0

    .line 1172
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_29
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1173
    const-string v3, "INSERT OR REPLACE INTO secure(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 1175
    const-string v3, "touch_exploration_granted_accessibility_services"

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v3, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1178
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_29
    .catchall {:try_start_29 .. :try_end_29} :catchall_29

    .line 1180
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1181
    if-eqz v28, :cond_56

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1185
    .end local v24           #enabledServices:Ljava/lang/String;
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    .end local v31           #touchExplorationGrantedServices:Ljava/lang/String;
    :cond_56
    const/16 v32, 0x50

    .line 1190
    .end local v19           #accessibilityEnabled:Z
    .end local v30           #touchExplorationEnabled:Z
    :cond_57
    const/16 v3, 0x50

    move/from16 v0, v32

    if-ne v0, v3, :cond_59

    .line 1192
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1193
    const/16 v28, 0x0

    .line 1195
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_2a
    const-string v3, "INSERT OR REPLACE INTO secure(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 1197
    const-string v3, "screensaver_enabled"

    const v4, 0x1110041

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1199
    const-string v3, "screensaver_activate_on_dock"

    const v4, 0x1110042

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1201
    const-string v3, "screensaver_activate_on_sleep"

    const v4, 0x1110043

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1203
    const-string v3, "screensaver_components"

    const v4, 0x104002c

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1205
    const-string v3, "screensaver_default_component"

    const v4, 0x104002c

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1208
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2a
    .catchall {:try_start_2a .. :try_end_2a} :catchall_2a

    .line 1210
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1211
    if-eqz v28, :cond_58

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1213
    :cond_58
    const/16 v32, 0x51

    .line 1216
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_59
    const/16 v3, 0x51

    move/from16 v0, v32

    if-ne v0, v3, :cond_5b

    .line 1218
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1219
    const/16 v28, 0x0

    .line 1221
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_2b
    const-string v3, "INSERT OR REPLACE INTO secure(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 1223
    const-string v3, "package_verifier_enable"

    const v4, 0x7f05000a

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1225
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_2b

    .line 1227
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1228
    if-eqz v28, :cond_5a

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1230
    :cond_5a
    const/16 v32, 0x52

    .line 1233
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_5b
    const/16 v3, 0x52

    move/from16 v0, v32

    if-ne v0, v3, :cond_5d

    .line 1235
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v3, :cond_5c

    .line 1237
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1238
    const/16 v28, 0x0

    .line 1242
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_2c
    invoke-direct/range {p0 .. p1}, Lcom/android/providers/settings/DatabaseHelper;->createGlobalTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1243
    sget-object v3, Lcom/android/providers/settings/SettingsProvider;->sSystemGlobalKeys:Ljava/util/HashSet;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/android/providers/settings/DatabaseHelper;->hashsetToStringArray(Ljava/util/HashSet;)[Ljava/lang/String;

    move-result-object v7

    .line 1244
    .restart local v7       #settingsToMove:[Ljava/lang/String;
    const-string v5, "system"

    const-string v6, "global"

    const/4 v8, 0x0

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    invoke-direct/range {v3 .. v8}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1245
    sget-object v3, Lcom/android/providers/settings/SettingsProvider;->sSecureGlobalKeys:Ljava/util/HashSet;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/android/providers/settings/DatabaseHelper;->hashsetToStringArray(Ljava/util/HashSet;)[Ljava/lang/String;

    move-result-object v7

    .line 1246
    const-string v5, "secure"

    const-string v6, "global"

    const/4 v8, 0x0

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    invoke-direct/range {v3 .. v8}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1248
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2c
    .catchall {:try_start_2c .. :try_end_2c} :catchall_2c

    .line 1250
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1251
    if-eqz v28, :cond_5c

    throw v28

    .line 1254
    .end local v7           #settingsToMove:[Ljava/lang/String;
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_5c
    const/16 v32, 0x53

    .line 1257
    :cond_5d
    const/16 v3, 0x53

    move/from16 v0, v32

    if-ne v0, v3, :cond_5f

    .line 1261
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1262
    const/16 v28, 0x0

    .line 1264
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_2d
    const-string v3, "INSERT INTO secure(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 1265
    const-string v3, "accessibility_display_magnification_enabled"

    const v4, 0x7f05001d

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1268
    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1269
    const-string v3, "INSERT INTO secure(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 1270
    const-string v3, "accessibility_display_magnification_scale"

    const v4, 0x7f070002

    const/4 v5, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4, v5}, Lcom/android/providers/settings/DatabaseHelper;->loadFractionSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;II)V

    .line 1272
    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1273
    const-string v3, "INSERT INTO secure(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 1274
    const-string v3, "accessibility_display_magnification_auto_update"

    const v4, 0x7f05001e

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1278
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2d
    .catchall {:try_start_2d .. :try_end_2d} :catchall_2d

    .line 1280
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1281
    if-eqz v28, :cond_5e

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1283
    :cond_5e
    const/16 v32, 0x54

    .line 1286
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_5f
    const/16 v3, 0x54

    move/from16 v0, v32

    if-ne v0, v3, :cond_61

    .line 1287
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v3, :cond_60

    .line 1288
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1289
    const/16 v28, 0x0

    .line 1293
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    const/4 v3, 0x6

    :try_start_2e
    new-array v7, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "adb_enabled"

    aput-object v4, v7, v3

    const/4 v3, 0x1

    const-string v4, "bluetooth_on"

    aput-object v4, v7, v3

    const/4 v3, 0x2

    const-string v4, "data_roaming"

    aput-object v4, v7, v3

    const/4 v3, 0x3

    const-string v4, "device_provisioned"

    aput-object v4, v7, v3

    const/4 v3, 0x4

    const-string v4, "install_non_market_apps"

    aput-object v4, v7, v3

    const/4 v3, 0x5

    const-string v4, "usb_mass_storage_enabled"

    aput-object v4, v7, v3

    .line 1301
    .restart local v7       #settingsToMove:[Ljava/lang/String;
    const-string v5, "secure"

    const-string v6, "global"

    const/4 v8, 0x1

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    invoke-direct/range {v3 .. v8}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1302
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2e
    .catchall {:try_start_2e .. :try_end_2e} :catchall_2e

    .line 1304
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1305
    if-eqz v28, :cond_60

    throw v28

    .line 1308
    .end local v7           #settingsToMove:[Ljava/lang/String;
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_60
    const/16 v32, 0x55

    .line 1311
    :cond_61
    const/16 v3, 0x55

    move/from16 v0, v32

    if-ne v0, v3, :cond_63

    .line 1312
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v3, :cond_62

    .line 1313
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1317
    const/4 v3, 0x1

    :try_start_2f
    new-array v7, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "stay_on_while_plugged_in"

    aput-object v4, v7, v3

    .line 1318
    .restart local v7       #settingsToMove:[Ljava/lang/String;
    const-string v5, "system"

    const-string v6, "global"

    const/4 v8, 0x1

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    invoke-direct/range {v3 .. v8}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1320
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2f
    .catchall {:try_start_2f .. :try_end_2f} :catchall_2f

    .line 1322
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1325
    .end local v7           #settingsToMove:[Ljava/lang/String;
    :cond_62
    const/16 v32, 0x56

    .line 1328
    :cond_63
    const/16 v3, 0x56

    move/from16 v0, v32

    if-ne v0, v3, :cond_65

    .line 1329
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v3, :cond_64

    .line 1330
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1332
    const/4 v3, 0x3

    :try_start_30
    new-array v7, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "package_verifier_enable"

    aput-object v4, v7, v3

    const/4 v3, 0x1

    const-string v4, "verifier_timeout"

    aput-object v4, v7, v3

    const/4 v3, 0x2

    const-string v4, "verifier_default_response"

    aput-object v4, v7, v3

    .line 1337
    .restart local v7       #settingsToMove:[Ljava/lang/String;
    const-string v5, "secure"

    const-string v6, "global"

    const/4 v8, 0x1

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    invoke-direct/range {v3 .. v8}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1339
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_30
    .catchall {:try_start_30 .. :try_end_30} :catchall_30

    .line 1341
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1344
    .end local v7           #settingsToMove:[Ljava/lang/String;
    :cond_64
    const/16 v32, 0x57

    .line 1347
    :cond_65
    const/16 v3, 0x57

    move/from16 v0, v32

    if-ne v0, v3, :cond_67

    .line 1348
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v3, :cond_66

    .line 1349
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1351
    const/4 v3, 0x3

    :try_start_31
    new-array v7, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "data_stall_alarm_non_aggressive_delay_in_ms"

    aput-object v4, v7, v3

    const/4 v3, 0x1

    const-string v4, "data_stall_alarm_aggressive_delay_in_ms"

    aput-object v4, v7, v3

    const/4 v3, 0x2

    const-string v4, "gprs_register_check_period_ms"

    aput-object v4, v7, v3

    .line 1356
    .restart local v7       #settingsToMove:[Ljava/lang/String;
    const-string v5, "secure"

    const-string v6, "global"

    const/4 v8, 0x1

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    invoke-direct/range {v3 .. v8}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1358
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_31
    .catchall {:try_start_31 .. :try_end_31} :catchall_31

    .line 1360
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1363
    .end local v7           #settingsToMove:[Ljava/lang/String;
    :cond_66
    const/16 v32, 0x58

    .line 1366
    :cond_67
    const/16 v3, 0x58

    move/from16 v0, v32

    if-ne v0, v3, :cond_69

    .line 1367
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v3, :cond_68

    .line 1368
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1370
    const/16 v3, 0x1f

    :try_start_32
    new-array v7, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "battery_discharge_duration_threshold"

    aput-object v4, v7, v3

    const/4 v3, 0x1

    const-string v4, "battery_discharge_threshold"

    aput-object v4, v7, v3

    const/4 v3, 0x2

    const-string v4, "send_action_app_error"

    aput-object v4, v7, v3

    const/4 v3, 0x3

    const-string v4, "dropbox_age_seconds"

    aput-object v4, v7, v3

    const/4 v3, 0x4

    const-string v4, "dropbox_max_files"

    aput-object v4, v7, v3

    const/4 v3, 0x5

    const-string v4, "dropbox_quota_kb"

    aput-object v4, v7, v3

    const/4 v3, 0x6

    const-string v4, "dropbox_quota_percent"

    aput-object v4, v7, v3

    const/4 v3, 0x7

    const-string v4, "dropbox_reserve_percent"

    aput-object v4, v7, v3

    const/16 v3, 0x8

    const-string v4, "dropbox:"

    aput-object v4, v7, v3

    const/16 v3, 0x9

    const-string v4, "logcat_for_"

    aput-object v4, v7, v3

    const/16 v3, 0xa

    const-string v4, "sys_free_storage_log_interval"

    aput-object v4, v7, v3

    const/16 v3, 0xb

    const-string v4, "disk_free_change_reporting_threshold"

    aput-object v4, v7, v3

    const/16 v3, 0xc

    const-string v4, "sys_storage_threshold_percentage"

    aput-object v4, v7, v3

    const/16 v3, 0xd

    const-string v4, "sys_storage_threshold_max_bytes"

    aput-object v4, v7, v3

    const/16 v3, 0xe

    const-string v4, "sys_storage_full_threshold_bytes"

    aput-object v4, v7, v3

    const/16 v3, 0xf

    const-string v4, "sync_max_retry_delay_in_seconds"

    aput-object v4, v7, v3

    const/16 v3, 0x10

    const-string v4, "connectivity_change_delay"

    aput-object v4, v7, v3

    const/16 v3, 0x11

    const-string v4, "captive_portal_detection_enabled"

    aput-object v4, v7, v3

    const/16 v3, 0x12

    const-string v4, "captive_portal_server"

    aput-object v4, v7, v3

    const/16 v3, 0x13

    const-string v4, "nsd_on"

    aput-object v4, v7, v3

    const/16 v3, 0x14

    const-string v4, "set_install_location"

    aput-object v4, v7, v3

    const/16 v3, 0x15

    const-string v4, "default_install_location"

    aput-object v4, v7, v3

    const/16 v3, 0x16

    const-string v4, "inet_condition_debounce_up_delay"

    aput-object v4, v7, v3

    const/16 v3, 0x17

    const-string v4, "inet_condition_debounce_down_delay"

    aput-object v4, v7, v3

    const/16 v3, 0x18

    const-string v4, "read_external_storage_enforced_default"

    aput-object v4, v7, v3

    const/16 v3, 0x19

    const-string v4, "http_proxy"

    aput-object v4, v7, v3

    const/16 v3, 0x1a

    const-string v4, "global_http_proxy_host"

    aput-object v4, v7, v3

    const/16 v3, 0x1b

    const-string v4, "global_http_proxy_port"

    aput-object v4, v7, v3

    const/16 v3, 0x1c

    const-string v4, "global_http_proxy_exclusion_list"

    aput-object v4, v7, v3

    const/16 v3, 0x1d

    const-string v4, "set_global_http_proxy"

    aput-object v4, v7, v3

    const/16 v3, 0x1e

    const-string v4, "default_dns_server"

    aput-object v4, v7, v3

    .line 1403
    .restart local v7       #settingsToMove:[Ljava/lang/String;
    const-string v5, "secure"

    const-string v6, "global"

    const/4 v8, 0x1

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    invoke-direct/range {v3 .. v8}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1404
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_32
    .catchall {:try_start_32 .. :try_end_32} :catchall_32

    .line 1406
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1409
    .end local v7           #settingsToMove:[Ljava/lang/String;
    :cond_68
    const/16 v32, 0x59

    .line 1412
    :cond_69
    const/16 v3, 0x59

    move/from16 v0, v32

    if-ne v0, v3, :cond_6b

    .line 1413
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v3, :cond_6a

    .line 1414
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1416
    const/4 v3, 0x3

    :try_start_33
    new-array v0, v3, [Ljava/lang/String;

    move-object/from16 v26, v0

    const/4 v3, 0x0

    const-string v4, "bluetooth_headset_priority_"

    aput-object v4, v26, v3

    const/4 v3, 0x1

    const-string v4, "bluetooth_a2dp_sink_priority_"

    aput-object v4, v26, v3

    const/4 v3, 0x2

    const-string v4, "bluetooth_input_device_priority_"

    aput-object v4, v26, v3

    .line 1422
    .local v26, prefixesToMove:[Ljava/lang/String;
    const-string v3, "secure"

    const-string v4, "global"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/android/providers/settings/DatabaseHelper;->movePrefixedSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 1424
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_33
    .catchall {:try_start_33 .. :try_end_33} :catchall_33

    .line 1426
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1429
    .end local v26           #prefixesToMove:[Ljava/lang/String;
    :cond_6a
    const/16 v32, 0x5a

    .line 1432
    :cond_6b
    const/16 v3, 0x5a

    move/from16 v0, v32

    if-ne v0, v3, :cond_6d

    .line 1433
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v3, :cond_6c

    .line 1434
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1436
    const/16 v3, 0xb

    :try_start_34
    new-array v12, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "window_animation_scale"

    aput-object v4, v12, v3

    const/4 v3, 0x1

    const-string v4, "transition_animation_scale"

    aput-object v4, v12, v3

    const/4 v3, 0x2

    const-string v4, "animator_duration_scale"

    aput-object v4, v12, v3

    const/4 v3, 0x3

    const-string v4, "fancy_ime_animations"

    aput-object v4, v12, v3

    const/4 v3, 0x4

    const-string v4, "compatibility_mode"

    aput-object v4, v12, v3

    const/4 v3, 0x5

    const-string v4, "emergency_tone"

    aput-object v4, v12, v3

    const/4 v3, 0x6

    const-string v4, "call_auto_retry"

    aput-object v4, v12, v3

    const/4 v3, 0x7

    const-string v4, "debug_app"

    aput-object v4, v12, v3

    const/16 v3, 0x8

    const-string v4, "wait_for_debugger"

    aput-object v4, v12, v3

    const/16 v3, 0x9

    const-string v4, "show_processes"

    aput-object v4, v12, v3

    const/16 v3, 0xa

    const-string v4, "always_finish_activities"

    aput-object v4, v12, v3

    .line 1449
    .local v12, systemToGlobal:[Ljava/lang/String;
    const/4 v3, 0x2

    new-array v0, v3, [Ljava/lang/String;

    move-object/from16 v17, v0

    const/4 v3, 0x0

    const-string v4, "preferred_network_mode"

    aput-object v4, v17, v3

    const/4 v3, 0x1

    const-string v4, "preferred_cdma_subscription"

    aput-object v4, v17, v3

    .line 1454
    .local v17, secureToGlobal:[Ljava/lang/String;
    const-string v10, "system"

    const-string v11, "global"

    const/4 v13, 0x1

    move-object/from16 v8, p0

    move-object/from16 v9, p1

    invoke-direct/range {v8 .. v13}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1455
    const-string v15, "secure"

    const-string v16, "global"

    const/16 v18, 0x1

    move-object/from16 v13, p0

    move-object/from16 v14, p1

    invoke-direct/range {v13 .. v18}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1457
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_34
    .catchall {:try_start_34 .. :try_end_34} :catchall_34

    .line 1459
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1462
    .end local v12           #systemToGlobal:[Ljava/lang/String;
    .end local v17           #secureToGlobal:[Ljava/lang/String;
    :cond_6c
    const/16 v32, 0x5b

    .line 1465
    :cond_6d
    const/16 v3, 0x5b

    move/from16 v0, v32

    if-ne v0, v3, :cond_6f

    .line 1466
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v3, :cond_6e

    .line 1467
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1470
    const/4 v3, 0x1

    :try_start_35
    new-array v7, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "mode_ringer"

    aput-object v4, v7, v3

    .line 1471
    .restart local v7       #settingsToMove:[Ljava/lang/String;
    const-string v5, "system"

    const-string v6, "global"

    const/4 v8, 0x1

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    invoke-direct/range {v3 .. v8}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1473
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_35
    .catchall {:try_start_35 .. :try_end_35} :catchall_35

    .line 1475
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1478
    .end local v7           #settingsToMove:[Ljava/lang/String;
    :cond_6e
    const/16 v32, 0x5c

    .line 1481
    :cond_6f
    const/16 v3, 0x5c

    move/from16 v0, v32

    if-ne v0, v3, :cond_71

    .line 1482
    const/16 v28, 0x0

    .line 1484
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_36
    const-string v3, "INSERT OR IGNORE INTO secure(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 1486
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v3, :cond_97

    .line 1490
    const-string v3, "global"

    const-string v4, "device_provisioned"

    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v3, v4, v5}, Lcom/android/providers/settings/DatabaseHelper;->getIntValueFromTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v23

    .line 1492
    .local v23, deviceProvisioned:I
    const-string v3, "user_setup_complete"

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_36
    .catchall {:try_start_36 .. :try_end_36} :catchall_36

    .line 1500
    .end local v23           #deviceProvisioned:I
    :goto_3
    if-eqz v28, :cond_70

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1502
    :cond_70
    const/16 v32, 0x5d

    .line 1505
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_71
    const/16 v3, 0x5d

    move/from16 v0, v32

    if-ne v0, v3, :cond_73

    .line 1507
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v3, :cond_72

    .line 1508
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1509
    const/16 v28, 0x0

    .line 1512
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_37
    sget-object v3, Lcom/android/providers/settings/SettingsProvider;->sSystemGlobalKeys:Ljava/util/HashSet;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/android/providers/settings/DatabaseHelper;->hashsetToStringArray(Ljava/util/HashSet;)[Ljava/lang/String;

    move-result-object v7

    .line 1513
    .restart local v7       #settingsToMove:[Ljava/lang/String;
    const-string v5, "system"

    const-string v6, "global"

    const/4 v8, 0x1

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    invoke-direct/range {v3 .. v8}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1514
    sget-object v3, Lcom/android/providers/settings/SettingsProvider;->sSecureGlobalKeys:Ljava/util/HashSet;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/android/providers/settings/DatabaseHelper;->hashsetToStringArray(Ljava/util/HashSet;)[Ljava/lang/String;

    move-result-object v7

    .line 1515
    const-string v5, "secure"

    const-string v6, "global"

    const/4 v8, 0x1

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    invoke-direct/range {v3 .. v8}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1517
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_37
    .catchall {:try_start_37 .. :try_end_37} :catchall_37

    .line 1519
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1520
    if-eqz v28, :cond_72

    throw v28

    .line 1523
    .end local v7           #settingsToMove:[Ljava/lang/String;
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_72
    const/16 v32, 0x5e

    .line 1526
    :cond_73
    const/16 v3, 0x5e

    move/from16 v0, v32

    if-ne v0, v3, :cond_75

    .line 1528
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v3, :cond_74

    .line 1529
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1530
    const/16 v28, 0x0

    .line 1532
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_38
    const-string v3, "INSERT OR REPLACE INTO global(name,value) VALUES(?,?);"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v28

    .line 1534
    const-string v3, "wireless_charging_started_sound"

    const v4, 0x7f04000c

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1536
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_38
    .catchall {:try_start_38 .. :try_end_38} :catchall_38

    .line 1538
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1539
    if-eqz v28, :cond_74

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1542
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_74
    const/16 v32, 0x5f

    .line 1547
    :cond_75
    move/from16 v0, v32

    move/from16 v1, p3

    if-eq v0, v1, :cond_76

    .line 1548
    const-string v3, "SettingsProvider"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Got stuck trying to upgrade from version "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v32

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", must wipe the settings provider"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1550
    const-string v3, "DROP TABLE IF EXISTS global"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1551
    const-string v3, "DROP TABLE IF EXISTS globalIndex1"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1552
    const-string v3, "DROP TABLE IF EXISTS system"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1553
    const-string v3, "DROP INDEX IF EXISTS systemIndex1"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1554
    const-string v3, "DROP TABLE IF EXISTS secure"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1555
    const-string v3, "DROP INDEX IF EXISTS secureIndex1"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1556
    const-string v3, "DROP TABLE IF EXISTS gservices"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1557
    const-string v3, "DROP INDEX IF EXISTS gservicesIndex1"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1558
    const-string v3, "DROP TABLE IF EXISTS bluetooth_devices"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1559
    const-string v3, "DROP TABLE IF EXISTS bookmarks"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1560
    const-string v3, "DROP INDEX IF EXISTS bookmarksIndex1"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1561
    const-string v3, "DROP INDEX IF EXISTS bookmarksIndex2"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1562
    const-string v3, "DROP TABLE IF EXISTS favorites"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1563
    invoke-virtual/range {p0 .. p1}, Lcom/android/providers/settings/DatabaseHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1566
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v32

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v35

    .line 1567
    .local v35, wipeReason:Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "INSERT INTO secure(name,value) values(\'wiped_db_reason\',\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v35

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\');"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1570
    .end local v35           #wipeReason:Ljava/lang/String;
    :cond_76
    return-void

    .line 263
    :catchall_0
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 278
    :catchall_1
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 290
    :catchall_2
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 302
    :catchall_3
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 364
    :catchall_4
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 382
    :catchall_5
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 404
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :catchall_6
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 405
    if-eqz v28, :cond_77

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_77
    throw v3

    .line 422
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    .restart local v34       #wifiWatchList:Ljava/lang/String;
    :catchall_7
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 435
    .end local v34           #wifiWatchList:Ljava/lang/String;
    :catchall_8
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 449
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :catchall_9
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 450
    if-eqz v28, :cond_78

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_78
    throw v3

    .line 478
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :catchall_a
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 493
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :catchall_b
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 494
    if-eqz v28, :cond_79

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_79
    throw v3

    .line 502
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_7a
    :try_start_39
    const-string v33, "0"
    :try_end_39
    .catchall {:try_start_39 .. :try_end_39} :catchall_c

    goto/16 :goto_0

    .line 508
    :catchall_c
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 535
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :catchall_d
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 536
    if-eqz v28, :cond_7b

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_7b
    throw v3

    .line 555
    :catchall_e
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 556
    if-eqz v28, :cond_7c

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_7c
    throw v3

    .line 574
    :catchall_f
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 575
    if-eqz v28, :cond_7d

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_7d
    throw v3

    .line 593
    :catchall_10
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 594
    if-eqz v28, :cond_7e

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_7e
    throw v3

    .line 624
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :catchall_11
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 639
    :catchall_12
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 655
    :catchall_13
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 680
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :catchall_14
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 681
    if-eqz v28, :cond_7f

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_7f
    throw v3

    .line 722
    :catchall_15
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 723
    if-eqz v28, :cond_80

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_80
    throw v3

    .line 745
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :catchall_16
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 768
    .restart local v7       #settingsToMove:[Ljava/lang/String;
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :catchall_17
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 769
    if-eqz v28, :cond_81

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_81
    throw v3

    .line 789
    .end local v7           #settingsToMove:[Ljava/lang/String;
    :catchall_18
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 790
    if-eqz v28, :cond_82

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_82
    throw v3

    .line 817
    :catchall_19
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 818
    if-eqz v28, :cond_83

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_83
    throw v3

    .line 834
    .restart local v21       #autoTimeValue:I
    :catchall_1a
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 835
    if-eqz v28, :cond_84

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_84
    throw v3

    .line 851
    .end local v21           #autoTimeValue:I
    :catchall_1b
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 852
    if-eqz v28, :cond_85

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_85
    throw v3

    .line 896
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :catchall_1c
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 913
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :catchall_1d
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 914
    if-eqz v28, :cond_86

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_86
    throw v3

    .line 937
    :catchall_1e
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 938
    if-eqz v28, :cond_87

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_87
    throw v3

    .line 963
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    .restart local v27       #ringerModeAffectedStreams:I
    :catchall_1f
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 980
    .end local v27           #ringerModeAffectedStreams:I
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :catchall_20
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 981
    if-eqz v28, :cond_88

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_88
    throw v3

    .line 994
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :catchall_21
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 1013
    .restart local v20       #airplaneRadios:Ljava/lang/String;
    .restart local v29       #toggleableRadios:Ljava/lang/String;
    :catchall_22
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 1035
    .end local v20           #airplaneRadios:Ljava/lang/String;
    .end local v29           #toggleableRadios:Ljava/lang/String;
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :catchall_23
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1036
    if-eqz v28, :cond_89

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_89
    throw v3

    .line 1052
    :catchall_24
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1053
    if-eqz v28, :cond_8a

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_8a
    throw v3

    .line 1073
    :catchall_25
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1074
    if-eqz v28, :cond_8b

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_8b
    throw v3

    .line 1095
    .restart local v22       #c:Landroid/database/Cursor;
    :catchall_26
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1096
    if-eqz v22, :cond_8c

    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->close()V

    .line 1097
    :cond_8c
    if-eqz v28, :cond_8d

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_8d
    throw v3

    .line 1112
    .end local v22           #c:Landroid/database/Cursor;
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :catchall_27
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 1136
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :catchall_28
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1137
    if-eqz v28, :cond_8e

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_8e
    throw v3

    .line 1159
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_8f
    const/16 v19, 0x0

    goto/16 :goto_1

    .line 1161
    .restart local v19       #accessibilityEnabled:Z
    :cond_90
    const/16 v30, 0x0

    goto/16 :goto_2

    .line 1180
    .restart local v24       #enabledServices:Ljava/lang/String;
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    .restart local v30       #touchExplorationEnabled:Z
    .restart local v31       #touchExplorationGrantedServices:Ljava/lang/String;
    :catchall_29
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1181
    if-eqz v28, :cond_91

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_91
    throw v3

    .line 1210
    .end local v19           #accessibilityEnabled:Z
    .end local v24           #enabledServices:Ljava/lang/String;
    .end local v30           #touchExplorationEnabled:Z
    .end local v31           #touchExplorationGrantedServices:Ljava/lang/String;
    :catchall_2a
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1211
    if-eqz v28, :cond_92

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_92
    throw v3

    .line 1227
    :catchall_2b
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1228
    if-eqz v28, :cond_93

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_93
    throw v3

    .line 1250
    :catchall_2c
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1251
    if-eqz v28, :cond_94

    throw v28

    :cond_94
    throw v3

    .line 1280
    :catchall_2d
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1281
    if-eqz v28, :cond_95

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_95
    throw v3

    .line 1304
    :catchall_2e
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1305
    if-eqz v28, :cond_96

    throw v28

    :cond_96
    throw v3

    .line 1322
    .end local v28           #stmt:Landroid/database/sqlite/SQLiteStatement;
    :catchall_2f
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 1341
    :catchall_30
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 1360
    :catchall_31
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 1406
    :catchall_32
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 1426
    :catchall_33
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 1459
    :catchall_34
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 1475
    :catchall_35
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 1496
    .restart local v28       #stmt:Landroid/database/sqlite/SQLiteStatement;
    :cond_97
    :try_start_3a
    const-string v3, "user_setup_complete"

    const v4, 0x7f050022

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V
    :try_end_3a
    .catchall {:try_start_3a .. :try_end_3a} :catchall_36

    goto/16 :goto_3

    .line 1500
    :catchall_36
    move-exception v3

    if-eqz v28, :cond_98

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_98
    throw v3

    .line 1519
    :catchall_37
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1520
    if-eqz v28, :cond_99

    throw v28

    :cond_99
    throw v3

    .line 1538
    :catchall_38
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1539
    if-eqz v28, :cond_9a

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_9a
    throw v3
.end method
