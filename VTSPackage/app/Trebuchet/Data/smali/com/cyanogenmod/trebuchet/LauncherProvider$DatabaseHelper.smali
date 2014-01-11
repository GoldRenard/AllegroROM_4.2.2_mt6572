.class Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "LauncherProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/LauncherProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DatabaseHelper"
.end annotation


# static fields
.field private static final TAG_ALLAPPS:Ljava/lang/String; = "allapps"

.field private static final TAG_APPWIDGET:Ljava/lang/String; = "appwidget"

.field private static final TAG_CLOCK:Ljava/lang/String; = "clock"

.field private static final TAG_EXTRA:Ljava/lang/String; = "extra"

.field private static final TAG_FAVORITE:Ljava/lang/String; = "favorite"

.field private static final TAG_FAVORITES:Ljava/lang/String; = "favorites"

.field private static final TAG_FOLDER:Ljava/lang/String; = "folder"

.field private static final TAG_SEARCH:Ljava/lang/String; = "search"

.field private static final TAG_SHORTCUT:Ljava/lang/String; = "shortcut"


# instance fields
.field private final mAppWidgetHost:Landroid/appwidget/AppWidgetHost;

.field private final mContext:Landroid/content/Context;

.field private mMaxId:J


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 5
    .parameter "context"

    .prologue
    const-wide/16 v3, -0x1

    .line 248
    const-string v0, "launcher.db"

    const/4 v1, 0x0

    const/16 v2, 0xe

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 245
    iput-wide v3, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mMaxId:J

    .line 249
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    .line 250
    new-instance v0, Landroid/appwidget/AppWidgetHost;

    const/16 v1, 0x400

    invoke-direct {v0, p1, v1}, Landroid/appwidget/AppWidgetHost;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mAppWidgetHost:Landroid/appwidget/AppWidgetHost;

    .line 254
    iget-wide v0, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mMaxId:J

    cmp-long v0, v0, v3

    if-nez v0, :cond_0

    .line 255
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->initializeMaxId(Landroid/database/sqlite/SQLiteDatabase;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mMaxId:J

    .line 257
    :cond_0
    return-void
.end method

.method static synthetic access$000(Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;Landroid/database/sqlite/SQLiteDatabase;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 232
    invoke-direct {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->loadFavorites(Landroid/database/sqlite/SQLiteDatabase;I)I

    move-result v0

    return v0
.end method

.method private addAllAppsButton(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)J
    .locals 8
    .parameter "db"
    .parameter "values"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 897
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 899
    .local v3, r:Landroid/content/res/Resources;
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 900
    .local v2, intent:Landroid/content/Intent;
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-class v5, Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 902
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->generateNewId()J

    move-result-wide v0

    .line 903
    .local v0, id:J
    const-string v4, "title"

    const v5, 0x7f09009c

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 904
    const-string v4, "itemType"

    const/4 v5, 0x3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p2, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 905
    const-string v4, "spanX"

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p2, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 906
    const-string v4, "spanY"

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p2, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 907
    const-string v4, "intent"

    invoke-virtual {v2, v6}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 908
    const-string v4, "iconType"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p2, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 909
    const-string v4, "iconPackage"

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 910
    const-string v4, "iconResource"

    const/high16 v5, 0x7f02

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 911
    const-string v4, "_id"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p2, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 913
    const-string v4, "favorites"

    const/4 v5, 0x0

    #calls: Lcom/cyanogenmod/trebuchet/LauncherProvider;->dbInsertAndCheck(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    invoke-static {p1, v4, v5, p2}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->access$100(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-gez v4, :cond_0

    .line 914
    const-wide/16 v0, -0x1

    .line 916
    .end local v0           #id:J
    :cond_0
    return-wide v0
.end method

.method private addAppShortcut(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;Landroid/content/res/TypedArray;Landroid/content/pm/PackageManager;Landroid/content/Intent;)J
    .locals 13
    .parameter "db"
    .parameter "values"
    .parameter "a"
    .parameter "packageManager"
    .parameter "intent"

    .prologue
    .line 718
    const-wide/16 v4, -0x1

    .line 719
    .local v4, id:J
    const/4 v9, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v9}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 720
    .local v7, packageName:Ljava/lang/String;
    const/4 v9, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v9}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 724
    .local v1, className:Ljava/lang/String;
    :try_start_0
    new-instance v2, Landroid/content/ComponentName;

    invoke-direct {v2, v7, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 725
    .local v2, cn:Landroid/content/ComponentName;
    const/4 v9, 0x0

    move-object/from16 v0, p4

    invoke-virtual {v0, v2, v9}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 732
    :goto_0
    :try_start_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->generateNewId()J

    move-result-wide v4

    .line 733
    move-object/from16 v0, p5

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 734
    const/high16 v9, 0x1020

    move-object/from16 v0, p5

    invoke-virtual {v0, v9}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 736
    const-string v9, "intent"

    const/4 v10, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v10}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p2, v9, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 737
    const-string v9, "itemType"

    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {p2, v9, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 738
    const-string v9, "spanX"

    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {p2, v9, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 739
    const-string v9, "spanY"

    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {p2, v9, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 740
    const-string v9, "_id"

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->generateNewId()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {p2, v9, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 741
    const-string v9, "favorites"

    const/4 v10, 0x0

    #calls: Lcom/cyanogenmod/trebuchet/LauncherProvider;->dbInsertAndCheck(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    invoke-static {p1, v9, v10, p2}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->access$100(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v9

    const-wide/16 v11, 0x0

    cmp-long v9, v9, v11

    if-gez v9, :cond_0

    .line 742
    const-wide/16 v9, -0x1

    .line 748
    .end local v2           #cn:Landroid/content/ComponentName;
    :goto_1
    return-wide v9

    .line 726
    :catch_0
    move-exception v6

    .line 727
    .local v6, nnfe:Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    aput-object v7, v9, v10

    move-object/from16 v0, p4

    invoke-virtual {v0, v9}, Landroid/content/pm/PackageManager;->currentToCanonicalPackageNames([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 729
    .local v8, packages:[Ljava/lang/String;
    new-instance v2, Landroid/content/ComponentName;

    const/4 v9, 0x0

    aget-object v9, v8, v9

    invoke-direct {v2, v9, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 730
    .restart local v2       #cn:Landroid/content/ComponentName;
    const/4 v9, 0x0

    move-object/from16 v0, p4

    invoke-virtual {v0, v2, v9}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 744
    .end local v2           #cn:Landroid/content/ComponentName;
    .end local v6           #nnfe:Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v8           #packages:[Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 745
    .local v3, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v9, "Trebuchet.LauncherProvider"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unable to add favorite: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v3           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_0
    move-wide v9, v4

    .line 748
    goto :goto_1
.end method

.method private addAppWidget(Landroid/content/res/XmlResourceParser;Landroid/util/AttributeSet;Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;Landroid/content/res/TypedArray;Landroid/content/pm/PackageManager;)Z
    .locals 19
    .parameter "parser"
    .parameter "attrs"
    .parameter "db"
    .parameter "values"
    .parameter "a"
    .parameter "packageManager"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 804
    const/4 v1, 0x1

    move-object/from16 v0, p5

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 805
    .local v14, packageName:Ljava/lang/String;
    const/4 v1, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 807
    .local v9, className:Ljava/lang/String;
    if-eqz v14, :cond_0

    if-nez v9, :cond_1

    .line 808
    :cond_0
    const/4 v1, 0x0

    .line 858
    :goto_0
    return v1

    .line 811
    :cond_1
    const/4 v12, 0x1

    .line 812
    .local v12, hasPackage:Z
    new-instance v4, Landroid/content/ComponentName;

    invoke-direct {v4, v14, v9}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 814
    .local v4, cn:Landroid/content/ComponentName;
    const/4 v1, 0x0

    :try_start_0
    move-object/from16 v0, p6

    invoke-virtual {v0, v4, v1}, Landroid/content/pm/PackageManager;->getReceiverInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 826
    :goto_1
    if-eqz v12, :cond_7

    .line 827
    const/4 v1, 0x6

    const/4 v2, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    .line 828
    .local v5, spanX:I
    const/4 v1, 0x7

    const/4 v2, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    .line 831
    .local v6, spanY:I
    new-instance v7, Landroid/os/Bundle;

    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    .line 832
    .local v7, extras:Landroid/os/Bundle;
    invoke-interface/range {p1 .. p1}, Landroid/content/res/XmlResourceParser;->getDepth()I

    move-result v18

    .line 835
    .local v18, widgetDepth:I
    :cond_2
    :goto_2
    invoke-interface/range {p1 .. p1}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v16

    .local v16, type:I
    const/4 v1, 0x3

    move/from16 v0, v16

    if-ne v0, v1, :cond_3

    invoke-interface/range {p1 .. p1}, Landroid/content/res/XmlResourceParser;->getDepth()I

    move-result v1

    move/from16 v0, v18

    if-le v1, v0, :cond_6

    .line 836
    :cond_3
    const/4 v1, 0x2

    move/from16 v0, v16

    if-ne v0, v1, :cond_2

    .line 840
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    sget-object v2, Lcom/cyanogenmod/trebuchet/R$styleable;->Extra:[I

    move-object/from16 v0, p2

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v8

    .line 841
    .local v8, ar:Landroid/content/res/TypedArray;
    const-string v1, "extra"

    invoke-interface/range {p1 .. p1}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 842
    const/4 v1, 0x0

    invoke-virtual {v8, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 843
    .local v13, key:Ljava/lang/String;
    const/4 v1, 0x1

    invoke-virtual {v8, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v17

    .line 844
    .local v17, value:Ljava/lang/String;
    if-eqz v13, :cond_4

    if-eqz v17, :cond_4

    .line 845
    move-object/from16 v0, v17

    invoke-virtual {v7, v13, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 852
    invoke-virtual {v8}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_2

    .line 815
    .end local v5           #spanX:I
    .end local v6           #spanY:I
    .end local v7           #extras:Landroid/os/Bundle;
    .end local v8           #ar:Landroid/content/res/TypedArray;
    .end local v13           #key:Ljava/lang/String;
    .end local v16           #type:I
    .end local v17           #value:Ljava/lang/String;
    .end local v18           #widgetDepth:I
    :catch_0
    move-exception v10

    .line 816
    .local v10, e:Ljava/lang/Exception;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v14, v1, v2

    move-object/from16 v0, p6

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->currentToCanonicalPackageNames([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 818
    .local v15, packages:[Ljava/lang/String;
    new-instance v4, Landroid/content/ComponentName;

    .end local v4           #cn:Landroid/content/ComponentName;
    const/4 v1, 0x0

    aget-object v1, v15, v1

    invoke-direct {v4, v1, v9}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 820
    .restart local v4       #cn:Landroid/content/ComponentName;
    const/4 v1, 0x0

    :try_start_1
    move-object/from16 v0, p6

    invoke-virtual {v0, v4, v1}, Landroid/content/pm/PackageManager;->getReceiverInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 821
    :catch_1
    move-exception v11

    .line 822
    .local v11, e1:Ljava/lang/Exception;
    const/4 v12, 0x0

    goto :goto_1

    .line 847
    .end local v10           #e:Ljava/lang/Exception;
    .end local v11           #e1:Ljava/lang/Exception;
    .end local v15           #packages:[Ljava/lang/String;
    .restart local v5       #spanX:I
    .restart local v6       #spanY:I
    .restart local v7       #extras:Landroid/os/Bundle;
    .restart local v8       #ar:Landroid/content/res/TypedArray;
    .restart local v13       #key:Ljava/lang/String;
    .restart local v16       #type:I
    .restart local v17       #value:Ljava/lang/String;
    .restart local v18       #widgetDepth:I
    :cond_4
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Widget extras must have a key and value"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 850
    .end local v13           #key:Ljava/lang/String;
    .end local v17           #value:Ljava/lang/String;
    :cond_5
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Widgets can contain only extras"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .end local v8           #ar:Landroid/content/res/TypedArray;
    :cond_6
    move-object/from16 v1, p0

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    .line 855
    invoke-direct/range {v1 .. v7}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->addAppWidget(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;Landroid/content/ComponentName;IILandroid/os/Bundle;)Z

    move-result v1

    goto/16 :goto_0

    .line 858
    .end local v5           #spanX:I
    .end local v6           #spanY:I
    .end local v7           #extras:Landroid/os/Bundle;
    .end local v16           #type:I
    .end local v18           #widgetDepth:I
    :cond_7
    const/4 v1, 0x0

    goto/16 :goto_0
.end method

.method private addAppWidget(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;Landroid/content/ComponentName;IILandroid/os/Bundle;)Z
    .locals 8
    .parameter "db"
    .parameter "values"
    .parameter "cn"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "extras"

    .prologue
    .line 863
    const/4 v0, 0x0

    .line 864
    .local v0, allocatedAppWidgets:Z
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v5}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v2

    .line 867
    .local v2, appWidgetManager:Landroid/appwidget/AppWidgetManager;
    :try_start_0
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mAppWidgetHost:Landroid/appwidget/AppWidgetHost;

    invoke-virtual {v5}, Landroid/appwidget/AppWidgetHost;->allocateAppWidgetId()I

    move-result v1

    .line 869
    .local v1, appWidgetId:I
    const-string v5, "itemType"

    const/4 v6, 0x4

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {p2, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 870
    const-string v5, "spanX"

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {p2, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 871
    const-string v5, "spanY"

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {p2, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 872
    const-string v5, "appWidgetId"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {p2, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 873
    const-string v5, "_id"

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->generateNewId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {p2, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 874
    const-string v5, "favorites"

    const/4 v6, 0x0

    #calls: Lcom/cyanogenmod/trebuchet/LauncherProvider;->dbInsertAndCheck(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    invoke-static {p1, v5, v6, p2}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->access$100(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 876
    const/4 v0, 0x1

    .line 879
    invoke-virtual {v2, v1, p3}, Landroid/appwidget/AppWidgetManager;->bindAppWidgetIdIfAllowed(ILandroid/content/ComponentName;)Z

    .line 882
    if-eqz p6, :cond_0

    invoke-virtual {p6}, Landroid/os/Bundle;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    .line 883
    new-instance v4, Landroid/content/Intent;

    const-string v5, "com.cyanogenmod.trebuchet.action.APPWIDGET_DEFAULT_WORKSPACE_CONFIGURE"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 884
    .local v4, intent:Landroid/content/Intent;
    invoke-virtual {v4, p3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 885
    invoke-virtual {v4, p6}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 886
    const-string v5, "appWidgetId"

    invoke-virtual {v4, v5, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 887
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v5, v4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 893
    .end local v1           #appWidgetId:I
    .end local v4           #intent:Landroid/content/Intent;
    :cond_0
    :goto_0
    return v0

    .line 889
    :catch_0
    move-exception v3

    .line 890
    .local v3, ex:Ljava/lang/RuntimeException;
    const-string v5, "Trebuchet.LauncherProvider"

    const-string v6, "Problem allocating appWidgetId"

    invoke-static {v5, v6, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private addClockWidget(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)Z
    .locals 7
    .parameter "db"
    .parameter "values"

    .prologue
    const/4 v4, 0x2

    .line 795
    new-instance v3, Landroid/content/ComponentName;

    const-string v0, "com.android.alarmclock"

    const-string v1, "com.android.alarmclock.AnalogAppWidgetProvider"

    invoke-direct {v3, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 797
    .local v3, cn:Landroid/content/ComponentName;
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v5, v4

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->addAppWidget(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;Landroid/content/ComponentName;IILandroid/os/Bundle;)Z

    move-result v0

    return v0
.end method

.method private addFolder(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)J
    .locals 6
    .parameter "db"
    .parameter "values"

    .prologue
    const/4 v4, 0x1

    .line 752
    const-string v2, "itemType"

    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p2, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 753
    const-string v2, "spanX"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p2, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 754
    const-string v2, "spanY"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p2, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 755
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->generateNewId()J

    move-result-wide v0

    .line 756
    .local v0, id:J
    const-string v2, "_id"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {p2, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 757
    const-string v2, "favorites"

    const/4 v3, 0x0

    #calls: Lcom/cyanogenmod/trebuchet/LauncherProvider;->dbInsertAndCheck(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    invoke-static {p1, v2, v3, p2}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->access$100(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gtz v2, :cond_0

    .line 758
    const-wide/16 v0, -0x1

    .line 760
    .end local v0           #id:J
    :cond_0
    return-wide v0
.end method

.method private addSearchWidget(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)Z
    .locals 7
    .parameter "db"
    .parameter "values"

    .prologue
    .line 790
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->getSearchWidgetProvider()Landroid/content/ComponentName;

    move-result-object v3

    .line 791
    .local v3, cn:Landroid/content/ComponentName;
    const/4 v4, 0x4

    const/4 v5, 0x1

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->addAppWidget(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;Landroid/content/ComponentName;IILandroid/os/Bundle;)Z

    move-result v0

    return v0
.end method

.method private addUriShortcut(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;Landroid/content/res/TypedArray;)J
    .locals 12
    .parameter "db"
    .parameter "values"
    .parameter "a"

    .prologue
    .line 921
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 923
    .local v5, r:Landroid/content/res/Resources;
    const/16 v8, 0x8

    const/4 v9, 0x0

    invoke-virtual {p3, v8, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 924
    .local v1, iconResId:I
    const/16 v8, 0x9

    const/4 v9, 0x0

    invoke-virtual {p3, v8, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    .line 927
    .local v6, titleResId:I
    const/4 v7, 0x0

    .line 929
    .local v7, uri:Ljava/lang/String;
    const/16 v8, 0xa

    :try_start_0
    invoke-virtual {p3, v8}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 930
    const/4 v8, 0x0

    invoke-static {v7, v8}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 936
    .local v4, intent:Landroid/content/Intent;
    if-eqz v1, :cond_0

    if-nez v6, :cond_2

    .line 937
    :cond_0
    const-string v8, "Trebuchet.LauncherProvider"

    const-string v9, "Shortcut is missing title or icon resource ID"

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 938
    const-wide/16 v2, -0x1

    .line 956
    .end local v4           #intent:Landroid/content/Intent;
    :cond_1
    :goto_0
    return-wide v2

    .line 931
    :catch_0
    move-exception v0

    .line 932
    .local v0, e:Ljava/net/URISyntaxException;
    const-string v8, "Trebuchet.LauncherProvider"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Shortcut has malformed uri: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 933
    const-wide/16 v2, -0x1

    goto :goto_0

    .line 941
    .end local v0           #e:Ljava/net/URISyntaxException;
    .restart local v4       #intent:Landroid/content/Intent;
    :cond_2
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->generateNewId()J

    move-result-wide v2

    .line 942
    .local v2, id:J
    const/high16 v8, 0x1000

    invoke-virtual {v4, v8}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 943
    const-string v8, "intent"

    const/4 v9, 0x0

    invoke-virtual {v4, v9}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p2, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 944
    const-string v8, "title"

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p2, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 945
    const-string v8, "itemType"

    const/4 v9, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {p2, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 946
    const-string v8, "spanX"

    const/4 v9, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {p2, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 947
    const-string v8, "spanY"

    const/4 v9, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {p2, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 948
    const-string v8, "iconType"

    const/4 v9, 0x0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {p2, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 949
    const-string v8, "iconPackage"

    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p2, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 950
    const-string v8, "iconResource"

    invoke-virtual {v5, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p2, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 951
    const-string v8, "_id"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {p2, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 953
    const-string v8, "favorites"

    const/4 v9, 0x0

    #calls: Lcom/cyanogenmod/trebuchet/LauncherProvider;->dbInsertAndCheck(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    invoke-static {p1, v8, v9, p2}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->access$100(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-gez v8, :cond_1

    .line 954
    const-wide/16 v2, -0x1

    goto/16 :goto_0
.end method

.method private static beginDocument(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V
    .locals 4
    .parameter "parser"
    .parameter "firstElementName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x2

    .line 569
    :cond_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    .local v0, type:I
    if-eq v0, v2, :cond_1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 573
    :cond_1
    if-eq v0, v2, :cond_2

    .line 574
    new-instance v1, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v2, "No start tag found"

    invoke-direct {v1, v2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 577
    :cond_2
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 578
    new-instance v1, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected start tag: found "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", expected "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 581
    :cond_3
    return-void
.end method

.method private convertDatabase(Landroid/database/sqlite/SQLiteDatabase;)Z
    .locals 9
    .parameter "db"

    .prologue
    const/4 v8, 0x0

    .line 317
    const/4 v6, 0x0

    .line 319
    .local v6, converted:Z
    const-string v2, "content://settings/old_favorites?notify=true"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 321
    .local v1, uri:Landroid/net/Uri;
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 322
    .local v0, resolver:Landroid/content/ContentResolver;
    const/4 v7, 0x0

    .line 325
    .local v7, cursor:Landroid/database/Cursor;
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :try_start_0
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 331
    :goto_0
    if-eqz v7, :cond_0

    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_0

    .line 333
    :try_start_1
    invoke-direct {p0, p1, v7}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->copyFromCursor(Landroid/database/sqlite/SQLiteDatabase;Landroid/database/Cursor;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v2

    if-lez v2, :cond_1

    const/4 v6, 0x1

    .line 335
    :goto_1
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 338
    if-eqz v6, :cond_0

    .line 339
    invoke-virtual {v0, v1, v8, v8}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 343
    :cond_0
    return v6

    .line 333
    :cond_1
    const/4 v6, 0x0

    goto :goto_1

    .line 335
    :catchall_0
    move-exception v2

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    throw v2

    .line 326
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private copyFromCursor(Landroid/database/sqlite/SQLiteDatabase;Landroid/database/Cursor;)I
    .locals 26
    .parameter "db"
    .parameter "c"

    .prologue
    .line 347
    const-string v22, "_id"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    .line 348
    .local v13, idIndex:I
    const-string v22, "intent"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v14

    .line 349
    .local v14, intentIndex:I
    const-string v22, "title"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v19

    .line 350
    .local v19, titleIndex:I
    const-string v22, "iconType"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v12

    .line 351
    .local v12, iconTypeIndex:I
    const-string v22, "icon"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    .line 352
    .local v9, iconIndex:I
    const-string v22, "iconPackage"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v10

    .line 353
    .local v10, iconPackageIndex:I
    const-string v22, "iconResource"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v11

    .line 354
    .local v11, iconResourceIndex:I
    const-string v22, "container"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    .line 355
    .local v6, containerIndex:I
    const-string v22, "itemType"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v15

    .line 356
    .local v15, itemTypeIndex:I
    const-string v22, "screen"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v18

    .line 357
    .local v18, screenIndex:I
    const-string v22, "cellX"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    .line 358
    .local v4, cellXIndex:I
    const-string v22, "cellY"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    .line 360
    .local v5, cellYIndex:I
    invoke-interface/range {p2 .. p2}, Landroid/database/Cursor;->getCount()I

    move-result v22

    move/from16 v0, v22

    new-array v0, v0, [Landroid/content/ContentValues;

    move-object/from16 v17, v0

    .line 361
    .local v17, rows:[Landroid/content/ContentValues;
    const/4 v7, 0x0

    .line 362
    .local v7, i:I
    :goto_0
    invoke-interface/range {p2 .. p2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v22

    if-eqz v22, :cond_0

    .line 363
    new-instance v21, Landroid/content/ContentValues;

    invoke-interface/range {p2 .. p2}, Landroid/database/Cursor;->getColumnCount()I

    move-result v22

    invoke-direct/range {v21 .. v22}, Landroid/content/ContentValues;-><init>(I)V

    .line 364
    .local v21, values:Landroid/content/ContentValues;
    const-string v22, "_id"

    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v23

    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 365
    const-string v22, "intent"

    move-object/from16 v0, p2

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 366
    const-string v22, "title"

    move-object/from16 v0, p2

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 367
    const-string v22, "iconType"

    move-object/from16 v0, p2

    invoke-interface {v0, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v23

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 368
    const-string v22, "icon"

    move-object/from16 v0, p2

    invoke-interface {v0, v9}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 369
    const-string v22, "iconPackage"

    move-object/from16 v0, p2

    invoke-interface {v0, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    const-string v22, "iconResource"

    move-object/from16 v0, p2

    invoke-interface {v0, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    const-string v22, "container"

    move-object/from16 v0, p2

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v23

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 372
    const-string v22, "itemType"

    move-object/from16 v0, p2

    invoke-interface {v0, v15}, Landroid/database/Cursor;->getInt(I)I

    move-result v23

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 373
    const-string v22, "appWidgetId"

    const/16 v23, -0x1

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 374
    const-string v22, "screen"

    move-object/from16 v0, p2

    move/from16 v1, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v23

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 375
    const-string v22, "cellX"

    move-object/from16 v0, p2

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v23

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 376
    const-string v22, "cellY"

    move-object/from16 v0, p2

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v23

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 377
    add-int/lit8 v8, v7, 0x1

    .end local v7           #i:I
    .local v8, i:I
    aput-object v21, v17, v7

    move v7, v8

    .line 378
    .end local v8           #i:I
    .restart local v7       #i:I
    goto/16 :goto_0

    .line 380
    .end local v21           #values:Landroid/content/ContentValues;
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 381
    const/16 v20, 0x0

    .line 383
    .local v20, total:I
    :try_start_0
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v16, v0

    .line 384
    .local v16, numValues:I
    const/4 v7, 0x0

    :goto_1
    move/from16 v0, v16

    if-ge v7, v0, :cond_2

    .line 385
    const-string v22, "favorites"

    const/16 v23, 0x0

    aget-object v24, v17, v7

    move-object/from16 v0, p1

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    move-object/from16 v3, v24

    #calls: Lcom/cyanogenmod/trebuchet/LauncherProvider;->dbInsertAndCheck(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    invoke-static {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->access$100(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v22

    const-wide/16 v24, 0x0

    cmp-long v22, v22, v24

    if-gez v22, :cond_1

    .line 386
    const/16 v20, 0x0

    .line 393
    .end local v20           #total:I
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 396
    :goto_2
    return v20

    .line 388
    .restart local v20       #total:I
    :cond_1
    add-int/lit8 v20, v20, 0x1

    .line 384
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 391
    :cond_2
    :try_start_1
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 393
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_2

    .end local v16           #numValues:I
    :catchall_0
    move-exception v22

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v22
.end method

.method private getProviderInPackage(Ljava/lang/String;)Landroid/content/ComponentName;
    .locals 7
    .parameter "packageName"

    .prologue
    const/4 v5, 0x0

    .line 777
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v6}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v0

    .line 778
    .local v0, appWidgetManager:Landroid/appwidget/AppWidgetManager;
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetManager;->getInstalledProviders()Ljava/util/List;

    move-result-object v4

    .line 779
    .local v4, providers:Ljava/util/List;,"Ljava/util/List<Landroid/appwidget/AppWidgetProviderInfo;>;"
    if-nez v4, :cond_0

    move-object v3, v5

    .line 786
    :goto_0
    return-object v3

    .line 780
    :cond_0
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/appwidget/AppWidgetProviderInfo;

    .line 781
    .local v2, p:Landroid/appwidget/AppWidgetProviderInfo;
    iget-object v3, v2, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 782
    .local v3, provider:Landroid/content/ComponentName;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    goto :goto_0

    .end local v2           #p:Landroid/appwidget/AppWidgetProviderInfo;
    .end local v3           #provider:Landroid/content/ComponentName;
    :cond_2
    move-object v3, v5

    .line 786
    goto :goto_0
.end method

.method private getSearchWidgetProvider()Landroid/content/ComponentName;
    .locals 4

    .prologue
    .line 765
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    const-string v3, "search"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/SearchManager;

    .line 767
    .local v1, searchManager:Landroid/app/SearchManager;
    invoke-virtual {v1}, Landroid/app/SearchManager;->getGlobalSearchActivity()Landroid/content/ComponentName;

    move-result-object v0

    .line 768
    .local v0, searchComponent:Landroid/content/ComponentName;
    if-nez v0, :cond_0

    const/4 v2, 0x0

    .line 769
    :goto_0
    return-object v2

    :cond_0
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->getProviderInPackage(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v2

    goto :goto_0
.end method

.method private initializeMaxId(Landroid/database/sqlite/SQLiteDatabase;)J
    .locals 6
    .parameter "db"

    .prologue
    .line 546
    const-string v4, "SELECT MAX(_id) FROM favorites"

    const/4 v5, 0x0

    invoke-virtual {p1, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 549
    .local v0, c:Landroid/database/Cursor;
    const/4 v3, 0x0

    .line 550
    .local v3, maxIdIndex:I
    const-wide/16 v1, -0x1

    .line 551
    .local v1, id:J
    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 552
    const/4 v4, 0x0

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    .line 554
    :cond_0
    if-eqz v0, :cond_1

    .line 555
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 558
    :cond_1
    const-wide/16 v4, -0x1

    cmp-long v4, v1, v4

    if-nez v4, :cond_2

    .line 559
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "Error: could not query max id"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 562
    :cond_2
    return-wide v1
.end method

.method private loadFavorites(Landroid/database/sqlite/SQLiteDatabase;I)I
    .locals 38
    .parameter "db"
    .parameter "workspaceResourceId"

    .prologue
    .line 590
    new-instance v8, Landroid/content/Intent;

    const-string v3, "android.intent.action.MAIN"

    const/4 v4, 0x0

    invoke-direct {v8, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 591
    .local v8, intent:Landroid/content/Intent;
    const-string v3, "android.intent.category.LAUNCHER"

    invoke-virtual {v8, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 592
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    .line 594
    .local v5, values:Landroid/content/ContentValues;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    .line 595
    .local v7, packageManager:Landroid/content/pm/PackageManager;
    const/16 v28, 0x0

    .line 597
    .local v28, i:I
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    move/from16 v0, p2

    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v10

    .line 598
    .local v10, parser:Landroid/content/res/XmlResourceParser;
    invoke-static {v10}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v11

    .line 599
    .local v11, attrs:Landroid/util/AttributeSet;
    const-string v3, "favorites"

    invoke-static {v10, v3}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->beginDocument(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V

    .line 601
    invoke-interface {v10}, Landroid/content/res/XmlResourceParser;->getDepth()I

    move-result v21

    .line 605
    .local v21, depth:I
    :cond_0
    :goto_0
    invoke-interface {v10}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v35

    .local v35, type:I
    const/4 v3, 0x3

    move/from16 v0, v35

    if-ne v0, v3, :cond_1

    invoke-interface {v10}, Landroid/content/res/XmlResourceParser;->getDepth()I

    move-result v3

    move/from16 v0, v21

    if-le v3, v0, :cond_5

    :cond_1
    const/4 v3, 0x1

    move/from16 v0, v35

    if-eq v0, v3, :cond_5

    .line 607
    const/4 v3, 0x2

    move/from16 v0, v35

    if-ne v0, v3, :cond_0

    .line 611
    const/16 v18, 0x0

    .line 612
    .local v18, added:Z
    invoke-interface {v10}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v31

    .line 614
    .local v31, name:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    sget-object v4, Lcom/cyanogenmod/trebuchet/R$styleable;->Favorite:[I

    invoke-virtual {v3, v11, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v6

    .line 616
    .local v6, a:Landroid/content/res/TypedArray;
    const-wide/16 v19, -0x64

    .line 617
    .local v19, container:J
    const/4 v3, 0x2

    invoke-virtual {v6, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 618
    const/4 v3, 0x2

    invoke-virtual {v6, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v19

    .line 621
    :cond_2
    const/4 v3, 0x3

    invoke-virtual {v6, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v32

    .line 622
    .local v32, screen:Ljava/lang/String;
    const/4 v3, 0x4

    invoke-virtual {v6, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v36

    .line 623
    .local v36, x:Ljava/lang/String;
    const/4 v3, 0x5

    invoke-virtual {v6, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v37

    .line 625
    .local v37, y:Ljava/lang/String;
    invoke-virtual {v5}, Landroid/content/ContentValues;->clear()V

    .line 626
    const-string v3, "container"

    invoke-static/range {v19 .. v20}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v5, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 627
    const-string v3, "screen"

    move-object/from16 v0, v32

    invoke-virtual {v5, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 628
    const-string v3, "cellX"

    move-object/from16 v0, v36

    invoke-virtual {v5, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 629
    const-string v3, "cellY"

    move-object/from16 v0, v37

    invoke-virtual {v5, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 631
    const-string v3, "favorite"

    move-object/from16 v0, v31

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    .line 632
    invoke-direct/range {v3 .. v8}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->addAppShortcut(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;Landroid/content/res/TypedArray;Landroid/content/pm/PackageManager;Landroid/content/Intent;)J

    move-result-wide v29

    .line 633
    .local v29, id:J
    const-wide/16 v3, 0x0

    cmp-long v3, v29, v3

    if-ltz v3, :cond_6

    const/16 v18, 0x1

    .line 702
    .end local v29           #id:J
    :cond_3
    :goto_1
    if-eqz v18, :cond_4

    add-int/lit8 v28, v28, 0x1

    .line 703
    :cond_4
    invoke-virtual {v6}, Landroid/content/res/TypedArray;->recycle()V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2

    goto/16 :goto_0

    .line 705
    .end local v6           #a:Landroid/content/res/TypedArray;
    .end local v10           #parser:Landroid/content/res/XmlResourceParser;
    .end local v11           #attrs:Landroid/util/AttributeSet;
    .end local v18           #added:Z
    .end local v19           #container:J
    .end local v21           #depth:I
    .end local v31           #name:Ljava/lang/String;
    .end local v32           #screen:Ljava/lang/String;
    .end local v35           #type:I
    .end local v36           #x:Ljava/lang/String;
    .end local v37           #y:Ljava/lang/String;
    :catch_0
    move-exception v22

    .line 706
    .local v22, e:Lorg/xmlpull/v1/XmlPullParserException;
    const-string v3, "Trebuchet.LauncherProvider"

    const-string v4, "Got exception parsing favorites."

    move-object/from16 v0, v22

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 713
    .end local v22           #e:Lorg/xmlpull/v1/XmlPullParserException;
    :cond_5
    :goto_2
    return v28

    .line 633
    .restart local v6       #a:Landroid/content/res/TypedArray;
    .restart local v10       #parser:Landroid/content/res/XmlResourceParser;
    .restart local v11       #attrs:Landroid/util/AttributeSet;
    .restart local v18       #added:Z
    .restart local v19       #container:J
    .restart local v21       #depth:I
    .restart local v29       #id:J
    .restart local v31       #name:Ljava/lang/String;
    .restart local v32       #screen:Ljava/lang/String;
    .restart local v35       #type:I
    .restart local v36       #x:Ljava/lang/String;
    .restart local v37       #y:Ljava/lang/String;
    :cond_6
    const/16 v18, 0x0

    goto :goto_1

    .line 634
    .end local v29           #id:J
    :cond_7
    :try_start_1
    const-string v3, "search"

    move-object/from16 v0, v31

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 635
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v5}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->addSearchWidget(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)Z

    move-result v18

    goto :goto_1

    .line 636
    :cond_8
    const-string v3, "clock"

    move-object/from16 v0, v31

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 637
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v5}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->addClockWidget(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)Z

    move-result v18

    goto :goto_1

    .line 638
    :cond_9
    const-string v3, "appwidget"

    move-object/from16 v0, v31

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    move-object/from16 v9, p0

    move-object/from16 v12, p1

    move-object v13, v5

    move-object v14, v6

    move-object v15, v7

    .line 639
    invoke-direct/range {v9 .. v15}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->addAppWidget(Landroid/content/res/XmlResourceParser;Landroid/util/AttributeSet;Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;Landroid/content/res/TypedArray;Landroid/content/pm/PackageManager;)Z

    move-result v18

    goto :goto_1

    .line 640
    :cond_a
    const-string v3, "allapps"

    move-object/from16 v0, v31

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 641
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v5}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->addAllAppsButton(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)J

    move-result-wide v29

    .line 642
    .restart local v29       #id:J
    const-wide/16 v3, 0x0

    cmp-long v3, v29, v3

    if-ltz v3, :cond_b

    const/16 v18, 0x1

    .line 643
    :goto_3
    goto :goto_1

    .line 642
    :cond_b
    const/16 v18, 0x0

    goto :goto_3

    .line 643
    .end local v29           #id:J
    :cond_c
    const-string v3, "shortcut"

    move-object/from16 v0, v31

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 644
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v5, v6}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->addUriShortcut(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;Landroid/content/res/TypedArray;)J

    move-result-wide v29

    .line 645
    .restart local v29       #id:J
    const-wide/16 v3, 0x0

    cmp-long v3, v29, v3

    if-ltz v3, :cond_d

    const/16 v18, 0x1

    .line 646
    :goto_4
    goto/16 :goto_1

    .line 645
    :cond_d
    const/16 v18, 0x0

    goto :goto_4

    .line 646
    .end local v29           #id:J
    :cond_e
    const-string v3, "folder"

    move-object/from16 v0, v31

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 648
    const/16 v3, 0x9

    const/4 v4, -0x1

    invoke-virtual {v6, v3, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v34

    .line 649
    .local v34, titleResId:I
    const/4 v3, -0x1

    move/from16 v0, v34

    if-eq v0, v3, :cond_12

    .line 650
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    move/from16 v0, v34

    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v33

    .line 654
    .local v33, title:Ljava/lang/String;
    :goto_5
    const-string v3, "title"

    move-object/from16 v0, v33

    invoke-virtual {v5, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 655
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v5}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->addFolder(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)J

    move-result-wide v24

    .line 656
    .local v24, folderId:J
    const-wide/16 v3, 0x0

    cmp-long v3, v24, v3

    if-ltz v3, :cond_13

    const/16 v18, 0x1

    .line 658
    :goto_6
    new-instance v26, Ljava/util/ArrayList;

    invoke-direct/range {v26 .. v26}, Ljava/util/ArrayList;-><init>()V

    .line 660
    .local v26, folderItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    invoke-interface {v10}, Landroid/content/res/XmlResourceParser;->getDepth()I

    move-result v23

    .line 662
    .local v23, folderDepth:I
    :cond_f
    :goto_7
    invoke-interface {v10}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v35

    const/4 v3, 0x3

    move/from16 v0, v35

    if-ne v0, v3, :cond_10

    invoke-interface {v10}, Landroid/content/res/XmlResourceParser;->getDepth()I

    move-result v3

    move/from16 v0, v23

    if-le v3, v0, :cond_16

    .line 663
    :cond_10
    const/4 v3, 0x2

    move/from16 v0, v35

    if-ne v0, v3, :cond_f

    .line 666
    invoke-interface {v10}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v27

    .line 668
    .local v27, folder_item_name:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    sget-object v4, Lcom/cyanogenmod/trebuchet/R$styleable;->Favorite:[I

    invoke-virtual {v3, v11, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v15

    .line 670
    .local v15, ar:Landroid/content/res/TypedArray;
    invoke-virtual {v5}, Landroid/content/ContentValues;->clear()V

    .line 671
    const-string v3, "container"

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v5, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 673
    const-string v3, "favorite"

    move-object/from16 v0, v27

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_14

    const-wide/16 v3, 0x0

    cmp-long v3, v24, v3

    if-ltz v3, :cond_14

    move-object/from16 v12, p0

    move-object/from16 v13, p1

    move-object v14, v5

    move-object/from16 v16, v7

    move-object/from16 v17, v8

    .line 674
    invoke-direct/range {v12 .. v17}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->addAppShortcut(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;Landroid/content/res/TypedArray;Landroid/content/pm/PackageManager;Landroid/content/Intent;)J

    move-result-wide v29

    .line 676
    .restart local v29       #id:J
    const-wide/16 v3, 0x0

    cmp-long v3, v29, v3

    if-ltz v3, :cond_11

    .line 677
    invoke-static/range {v29 .. v30}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object/from16 v0, v26

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 688
    :cond_11
    :goto_8
    invoke-virtual {v15}, Landroid/content/res/TypedArray;->recycle()V
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_7

    .line 707
    .end local v6           #a:Landroid/content/res/TypedArray;
    .end local v10           #parser:Landroid/content/res/XmlResourceParser;
    .end local v11           #attrs:Landroid/util/AttributeSet;
    .end local v15           #ar:Landroid/content/res/TypedArray;
    .end local v18           #added:Z
    .end local v19           #container:J
    .end local v21           #depth:I
    .end local v23           #folderDepth:I
    .end local v24           #folderId:J
    .end local v26           #folderItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .end local v27           #folder_item_name:Ljava/lang/String;
    .end local v29           #id:J
    .end local v31           #name:Ljava/lang/String;
    .end local v32           #screen:Ljava/lang/String;
    .end local v33           #title:Ljava/lang/String;
    .end local v34           #titleResId:I
    .end local v35           #type:I
    .end local v36           #x:Ljava/lang/String;
    .end local v37           #y:Ljava/lang/String;
    :catch_1
    move-exception v22

    .line 708
    .local v22, e:Ljava/io/IOException;
    const-string v3, "Trebuchet.LauncherProvider"

    const-string v4, "Got exception parsing favorites."

    move-object/from16 v0, v22

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_2

    .line 652
    .end local v22           #e:Ljava/io/IOException;
    .restart local v6       #a:Landroid/content/res/TypedArray;
    .restart local v10       #parser:Landroid/content/res/XmlResourceParser;
    .restart local v11       #attrs:Landroid/util/AttributeSet;
    .restart local v18       #added:Z
    .restart local v19       #container:J
    .restart local v21       #depth:I
    .restart local v31       #name:Ljava/lang/String;
    .restart local v32       #screen:Ljava/lang/String;
    .restart local v34       #titleResId:I
    .restart local v35       #type:I
    .restart local v36       #x:Ljava/lang/String;
    .restart local v37       #y:Ljava/lang/String;
    :cond_12
    :try_start_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f09007e

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v33

    .restart local v33       #title:Ljava/lang/String;
    goto/16 :goto_5

    .line 656
    .restart local v24       #folderId:J
    :cond_13
    const/16 v18, 0x0

    goto/16 :goto_6

    .line 679
    .restart local v15       #ar:Landroid/content/res/TypedArray;
    .restart local v23       #folderDepth:I
    .restart local v26       #folderItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .restart local v27       #folder_item_name:Ljava/lang/String;
    :cond_14
    const-string v3, "shortcut"

    move-object/from16 v0, v27

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_15

    const-wide/16 v3, 0x0

    cmp-long v3, v24, v3

    if-ltz v3, :cond_15

    .line 680
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v5, v15}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->addUriShortcut(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;Landroid/content/res/TypedArray;)J

    move-result-wide v29

    .line 681
    .restart local v29       #id:J
    const-wide/16 v3, 0x0

    cmp-long v3, v29, v3

    if-ltz v3, :cond_11

    .line 682
    invoke-static/range {v29 .. v30}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object/from16 v0, v26

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_8

    .line 709
    .end local v6           #a:Landroid/content/res/TypedArray;
    .end local v10           #parser:Landroid/content/res/XmlResourceParser;
    .end local v11           #attrs:Landroid/util/AttributeSet;
    .end local v15           #ar:Landroid/content/res/TypedArray;
    .end local v18           #added:Z
    .end local v19           #container:J
    .end local v21           #depth:I
    .end local v23           #folderDepth:I
    .end local v24           #folderId:J
    .end local v26           #folderItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .end local v27           #folder_item_name:Ljava/lang/String;
    .end local v29           #id:J
    .end local v31           #name:Ljava/lang/String;
    .end local v32           #screen:Ljava/lang/String;
    .end local v33           #title:Ljava/lang/String;
    .end local v34           #titleResId:I
    .end local v35           #type:I
    .end local v36           #x:Ljava/lang/String;
    .end local v37           #y:Ljava/lang/String;
    :catch_2
    move-exception v22

    .line 710
    .local v22, e:Ljava/lang/RuntimeException;
    const-string v3, "Trebuchet.LauncherProvider"

    const-string v4, "Got exception parsing favorites."

    move-object/from16 v0, v22

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_2

    .line 685
    .end local v22           #e:Ljava/lang/RuntimeException;
    .restart local v6       #a:Landroid/content/res/TypedArray;
    .restart local v10       #parser:Landroid/content/res/XmlResourceParser;
    .restart local v11       #attrs:Landroid/util/AttributeSet;
    .restart local v15       #ar:Landroid/content/res/TypedArray;
    .restart local v18       #added:Z
    .restart local v19       #container:J
    .restart local v21       #depth:I
    .restart local v23       #folderDepth:I
    .restart local v24       #folderId:J
    .restart local v26       #folderItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .restart local v27       #folder_item_name:Ljava/lang/String;
    .restart local v31       #name:Ljava/lang/String;
    .restart local v32       #screen:Ljava/lang/String;
    .restart local v33       #title:Ljava/lang/String;
    .restart local v34       #titleResId:I
    .restart local v35       #type:I
    .restart local v36       #x:Ljava/lang/String;
    .restart local v37       #y:Ljava/lang/String;
    :cond_15
    :try_start_3
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Folders can contain only shortcuts"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 693
    .end local v15           #ar:Landroid/content/res/TypedArray;
    .end local v27           #folder_item_name:Ljava/lang/String;
    :cond_16
    invoke-virtual/range {v26 .. v26}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x2

    if-ge v3, v4, :cond_3

    const-wide/16 v3, 0x0

    cmp-long v3, v24, v3

    if-ltz v3, :cond_3

    .line 695
    move-object/from16 v0, p1

    move-wide/from16 v1, v24

    #calls: Lcom/cyanogenmod/trebuchet/LauncherProvider;->deleteId(Landroid/database/sqlite/SQLiteDatabase;J)V
    invoke-static {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->access$200(Landroid/database/sqlite/SQLiteDatabase;J)V

    .line 696
    invoke-virtual/range {v26 .. v26}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_17

    .line 697
    const/4 v3, 0x0

    move-object/from16 v0, v26

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    move-object/from16 v0, p1

    #calls: Lcom/cyanogenmod/trebuchet/LauncherProvider;->deleteId(Landroid/database/sqlite/SQLiteDatabase;J)V
    invoke-static {v0, v3, v4}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->access$200(Landroid/database/sqlite/SQLiteDatabase;J)V
    :try_end_3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_2

    .line 699
    :cond_17
    const/16 v18, 0x0

    goto/16 :goto_1
.end method

.method private sendAppWidgetResetNotify()V
    .locals 3

    .prologue
    .line 266
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 267
    .local v0, resolver:Landroid/content/ContentResolver;
    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherProvider;->CONTENT_APPWIDGET_RESET_URI:Landroid/net/Uri;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 268
    return-void
.end method

.method private setFlagToLoadDefaultWorkspaceLater()V
    .locals 5

    .prologue
    .line 308
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->getSharedPreferencesKey()Ljava/lang/String;

    move-result-object v2

    .line 309
    .local v2, spKey:Ljava/lang/String;
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 310
    .local v1, sp:Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 311
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v3, "DB_CREATED_BUT_DEFAULT_WORKSPACE_NOT_LOADED"

    const/4 v4, 0x1

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 312
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 313
    return-void
.end method

.method private updateContactsShortcuts(Landroid/database/sqlite/SQLiteDatabase;)Z
    .locals 26
    .parameter "db"

    .prologue
    .line 453
    const-string v3, "itemType"

    const/4 v4, 0x1

    new-array v4, v4, [I

    const/4 v5, 0x0

    const/4 v7, 0x1

    aput v7, v4, v5

    invoke-static {v3, v4}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->buildOrWhereString(Ljava/lang/String;[I)Ljava/lang/String;

    move-result-object v6

    .line 456
    .local v6, selectWhere:Ljava/lang/String;
    const/4 v12, 0x0

    .line 457
    .local v12, c:Landroid/database/Cursor;
    const-string v11, "com.android.contacts.action.QUICK_CONTACT"

    .line 458
    .local v11, actionQuickContact:Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 461
    :try_start_0
    const-string v4, "favorites"

    const/4 v3, 0x2

    new-array v5, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v7, "_id"

    aput-object v7, v5, v3

    const/4 v3, 0x1

    const-string v7, "intent"

    aput-object v7, v5, v3

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v3, p1

    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v12

    .line 464
    if-nez v12, :cond_1

    const/4 v3, 0x0

    .line 523
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 524
    if-eqz v12, :cond_0

    .line 525
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 529
    :cond_0
    :goto_0
    return v3

    .line 468
    :cond_1
    :try_start_1
    const-string v3, "_id"

    invoke-interface {v12, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v18

    .line 469
    .local v18, idIndex:I
    const-string v3, "intent"

    invoke-interface {v12, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v20

    .line 471
    .local v20, intentIndex:I
    :cond_2
    :goto_1
    invoke-interface {v12}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 472
    move/from16 v0, v18

    invoke-interface {v12, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v16

    .line 473
    .local v16, favoriteId:J
    move/from16 v0, v20

    invoke-interface {v12, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v21

    .line 474
    .local v21, intentUri:Ljava/lang/String;
    if-eqz v21, :cond_2

    .line 476
    const/4 v3, 0x0

    :try_start_2
    move-object/from16 v0, v21

    invoke-static {v0, v3}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v19

    .line 477
    .local v19, intent:Landroid/content/Intent;
    const-string v3, "Home"

    invoke-virtual/range {v19 .. v19}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 478
    invoke-virtual/range {v19 .. v19}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v24

    .line 479
    .local v24, uri:Landroid/net/Uri;
    if-eqz v24, :cond_2

    .line 480
    invoke-virtual/range {v24 .. v24}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v13

    .line 481
    .local v13, data:Ljava/lang/String;
    const-string v3, "android.intent.action.VIEW"

    invoke-virtual/range {v19 .. v19}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "com.android.contacts.action.QUICK_CONTACT"

    invoke-virtual/range {v19 .. v19}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    :cond_3
    const-string v3, "content://contacts/people/"

    invoke-virtual {v13, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4

    const-string v3, "content://com.android.contacts/contacts/lookup/"

    invoke-virtual {v13, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 487
    :cond_4
    new-instance v22, Landroid/content/Intent;

    const-string v3, "com.android.contacts.action.QUICK_CONTACT"

    move-object/from16 v0, v22

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 493
    .local v22, newIntent:Landroid/content/Intent;
    const v3, 0x10008000

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 495
    const-string v3, "com.cyanogenmod.trebuchet.intent.extra.shortcut.INGORE_LAUNCH_ANIMATION"

    const/4 v4, 0x1

    move-object/from16 v0, v22

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 497
    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 500
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Landroid/content/Intent;->resolveType(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 502
    new-instance v25, Landroid/content/ContentValues;

    invoke-direct/range {v25 .. v25}, Landroid/content/ContentValues;-><init>()V

    .line 503
    .local v25, values:Landroid/content/ContentValues;
    const-string v3, "intent"

    const/4 v4, 0x0

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v25

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 506
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "_id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, v16

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    .line 507
    .local v23, updateWhere:Ljava/lang/String;
    const-string v3, "favorites"

    const/4 v4, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    move-object/from16 v2, v23

    invoke-virtual {v0, v3, v1, v2, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/net/URISyntaxException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Landroid/database/SQLException; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_1

    .line 510
    .end local v13           #data:Ljava/lang/String;
    .end local v19           #intent:Landroid/content/Intent;
    .end local v22           #newIntent:Landroid/content/Intent;
    .end local v23           #updateWhere:Ljava/lang/String;
    .end local v24           #uri:Landroid/net/Uri;
    .end local v25           #values:Landroid/content/ContentValues;
    :catch_0
    move-exception v15

    .line 511
    .local v15, ex:Ljava/lang/RuntimeException;
    :try_start_3
    const-string v3, "Trebuchet.LauncherProvider"

    const-string v4, "Problem upgrading shortcut"

    invoke-static {v3, v4, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Landroid/database/SQLException; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_1

    .line 519
    .end local v15           #ex:Ljava/lang/RuntimeException;
    .end local v16           #favoriteId:J
    .end local v18           #idIndex:I
    .end local v20           #intentIndex:I
    .end local v21           #intentUri:Ljava/lang/String;
    :catch_1
    move-exception v15

    .line 520
    .local v15, ex:Landroid/database/SQLException;
    :try_start_4
    const-string v3, "Trebuchet.LauncherProvider"

    const-string v4, "Problem while upgrading contacts"

    invoke-static {v3, v4, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 521
    const/4 v3, 0x0

    .line 523
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 524
    if-eqz v12, :cond_0

    .line 525
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    .line 512
    .end local v15           #ex:Landroid/database/SQLException;
    .restart local v16       #favoriteId:J
    .restart local v18       #idIndex:I
    .restart local v20       #intentIndex:I
    .restart local v21       #intentUri:Ljava/lang/String;
    :catch_2
    move-exception v14

    .line 513
    .local v14, e:Ljava/net/URISyntaxException;
    :try_start_5
    const-string v3, "Trebuchet.LauncherProvider"

    const-string v4, "Problem upgrading shortcut"

    invoke-static {v3, v4, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Landroid/database/SQLException; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_1

    .line 523
    .end local v14           #e:Ljava/net/URISyntaxException;
    .end local v16           #favoriteId:J
    .end local v18           #idIndex:I
    .end local v20           #intentIndex:I
    .end local v21           #intentUri:Ljava/lang/String;
    :catchall_0
    move-exception v3

    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 524
    if-eqz v12, :cond_5

    .line 525
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    :cond_5
    throw v3

    .line 518
    .restart local v18       #idIndex:I
    .restart local v20       #intentIndex:I
    :cond_6
    :try_start_6
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Landroid/database/SQLException; {:try_start_6 .. :try_end_6} :catch_1

    .line 523
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 524
    if-eqz v12, :cond_7

    .line 525
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 529
    :cond_7
    const/4 v3, 0x1

    goto/16 :goto_0
.end method


# virtual methods
.method public generateNewId()J
    .locals 4

    .prologue
    .line 538
    iget-wide v0, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mMaxId:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 539
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Error: max id was not initialized"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 541
    :cond_0
    iget-wide v0, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mMaxId:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mMaxId:J

    .line 542
    iget-wide v0, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mMaxId:J

    return-wide v0
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .parameter "db"

    .prologue
    .line 274
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mMaxId:J

    .line 276
    const-string v0, "CREATE TABLE favorites (_id INTEGER PRIMARY KEY,title TEXT,intent TEXT,container INTEGER,screen INTEGER,cellX INTEGER,cellY INTEGER,spanX INTEGER,spanY INTEGER,itemType INTEGER,appWidgetId INTEGER NOT NULL DEFAULT -1,isShortcut INTEGER,iconType INTEGER,iconPackage TEXT,iconResource TEXT,icon BLOB);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 296
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mAppWidgetHost:Landroid/appwidget/AppWidgetHost;

    if-eqz v0, :cond_0

    .line 297
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mAppWidgetHost:Landroid/appwidget/AppWidgetHost;

    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHost;->deleteHost()V

    .line 298
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->sendAppWidgetResetNotify()V

    .line 301
    :cond_0
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->convertDatabase(Landroid/database/sqlite/SQLiteDatabase;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 303
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->setFlagToLoadDefaultWorkspaceLater()V

    .line 305
    :cond_1
    return-void
.end method

.method public onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 2
    .parameter "db"
    .parameter "oldVersion"
    .parameter "newVersion"

    .prologue
    .line 447
    const-string v0, "Trebuchet.LauncherProvider"

    const-string v1, "Destroying all old data."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 448
    const-string v0, "DROP TABLE IF EXISTS favorites"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 449
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 450
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 8
    .parameter "db"
    .parameter "oldVersion"
    .parameter "newVersion"

    .prologue
    const/16 v7, 0xe

    .line 403
    move v1, p2

    .line 408
    .local v1, version:I
    const/16 v2, 0xc

    if-ge v1, v2, :cond_0

    .line 412
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->updateContactsShortcuts(Landroid/database/sqlite/SQLiteDatabase;)Z

    .line 413
    const/16 v1, 0xc

    .line 416
    :cond_0
    if-ge v1, v7, :cond_2

    .line 417
    const-string v2, "favorites"

    const-string v3, "container=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const/16 v6, -0x65

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {p1, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 418
    const-string v2, "ALTER TABLE favorites ADD COLUMN action TEXT;"

    invoke-virtual {p1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 422
    iget-wide v2, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mMaxId:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    .line 423
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->initializeMaxId(Landroid/database/sqlite/SQLiteDatabase;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mMaxId:J

    .line 427
    :cond_1
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    const-string v3, "phone"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 428
    .local v0, tm:Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    move-result v2

    if-nez v2, :cond_4

    .line 429
    const v2, 0x7f060008

    invoke-direct {p0, p1, v2}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->loadFavorites(Landroid/database/sqlite/SQLiteDatabase;I)I

    .line 433
    :goto_0
    const/16 v1, 0xe

    .line 436
    .end local v0           #tm:Landroid/telephony/TelephonyManager;
    :cond_2
    if-eq v1, v7, :cond_3

    .line 437
    const-string v2, "Trebuchet.LauncherProvider"

    const-string v3, "Destroying all old data."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 438
    const-string v2, "DROP TABLE IF EXISTS favorites"

    invoke-virtual {p1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 439
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 441
    :cond_3
    return-void

    .line 431
    .restart local v0       #tm:Landroid/telephony/TelephonyManager;
    :cond_4
    const v2, 0x7f060007

    invoke-direct {p0, p1, v2}, Lcom/cyanogenmod/trebuchet/LauncherProvider$DatabaseHelper;->loadFavorites(Landroid/database/sqlite/SQLiteDatabase;I)I

    goto :goto_0
.end method
