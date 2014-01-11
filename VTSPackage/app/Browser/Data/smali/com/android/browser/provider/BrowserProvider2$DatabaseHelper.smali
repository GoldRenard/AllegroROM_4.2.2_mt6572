.class final Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "BrowserProvider2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/provider/BrowserProvider2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "DatabaseHelper"
.end annotation


# static fields
.field static final DATABASE_NAME:Ljava/lang/String; = "browser2.db"

.field static final DATABASE_VERSION:I = 0x20


# instance fields
.field final synthetic this$0:Lcom/android/browser/provider/BrowserProvider2;


# direct methods
.method public constructor <init>(Lcom/android/browser/provider/BrowserProvider2;Landroid/content/Context;)V
    .locals 3
    .parameter
    .parameter "context"

    .prologue
    .line 464
    iput-object p1, p0, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->this$0:Lcom/android/browser/provider/BrowserProvider2;

    .line 465
    const-string v0, "browser2.db"

    const/4 v1, 0x0

    const/16 v2, 0x20

    invoke-direct {p0, p2, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 466
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->setWriteAheadLoggingEnabled(Z)V

    .line 467
    return-void
.end method

.method static synthetic access$000(Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;Landroid/database/sqlite/SQLiteDatabase;J[Ljava/lang/CharSequence;Landroid/content/res/TypedArray;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"

    .prologue
    .line 461
    invoke-direct/range {p0 .. p6}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->addDefaultBookmarks(Landroid/database/sqlite/SQLiteDatabase;J[Ljava/lang/CharSequence;Landroid/content/res/TypedArray;I)I

    move-result v0

    return v0
.end method

.method private addDefaultBookmarks(Landroid/database/sqlite/SQLiteDatabase;J[Ljava/lang/CharSequence;Landroid/content/res/TypedArray;I)I
    .locals 15
    .parameter "db"
    .parameter "parentId"
    .parameter "bookmarks"
    .parameter "preloads"
    .parameter "position"

    .prologue
    .line 833
    iget-object v13, p0, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->this$0:Lcom/android/browser/provider/BrowserProvider2;

    invoke-virtual {v13}, Lcom/android/browser/provider/BrowserProvider2;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    .line 834
    .local v9, res:Landroid/content/res/Resources;
    move-object/from16 v0, p4

    array-length v10, v0

    .line 836
    .local v10, size:I
    :try_start_0
    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    .line 837
    .local v8, parent:Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    .line 838
    .local v7, now:Ljava/lang/String;
    const/4 v6, 0x0

    .line 839
    .local v6, isGoogleHomepage:Z
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-ge v4, v10, :cond_6

    .line 840
    iget-object v13, p0, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->this$0:Lcom/android/browser/provider/BrowserProvider2;

    invoke-virtual {v13}, Lcom/android/browser/provider/BrowserProvider2;->getContext()Landroid/content/Context;

    move-result-object v13

    add-int/lit8 v14, v4, 0x1

    aget-object v14, p4, v14

    invoke-static {v13, v14}, Lcom/android/browser/provider/BrowserProvider2;->replaceSystemPropertyInString(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    .line 842
    .local v1, bookmarkDestination:Ljava/lang/CharSequence;
    const/4 v6, 0x0

    .line 844
    const-string v13, "http://www.google.com/"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 845
    const/4 v6, 0x1

    .line 848
    :cond_0
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "INSERT INTO bookmarks (title, url, folder,parent,position,created) VALUES (\'"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    aget-object v14, p4, v4

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "\', "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "\'"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "\', "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "0,"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ","

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    if-eqz v6, :cond_5

    const/4 v13, 0x1

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    :goto_1
    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ","

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ");"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 864
    const/4 v13, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v4, v13}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    .line 865
    .local v3, faviconId:I
    add-int/lit8 v13, v4, 0x1

    const/4 v14, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v13, v14}, Landroid/content/res/TypedArray;->getResourceId(II)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v12

    .line 866
    .local v12, thumbId:I
    const/4 v11, 0x0

    .local v11, thumb:[B
    const/4 v2, 0x0

    .line 868
    .local v2, favicon:[B
    :try_start_1
    invoke-direct {p0, v9, v12}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->readRaw(Landroid/content/res/Resources;I)[B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v11

    .line 872
    :goto_2
    :try_start_2
    invoke-direct {p0, v9, v3}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->readRaw(Landroid/content/res/Resources;I)[B
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v2

    .line 875
    :goto_3
    if-nez v11, :cond_1

    if-eqz v2, :cond_4

    .line 876
    :cond_1
    :try_start_3
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    .line 877
    .local v5, imageValues:Landroid/content/ContentValues;
    const-string v13, "url_key"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 878
    if-eqz v2, :cond_2

    .line 879
    const-string v13, "favicon"

    invoke-virtual {v5, v13, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 881
    :cond_2
    if-eqz v11, :cond_3

    .line 882
    const-string v13, "thumbnail"

    invoke-virtual {v5, v13, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 884
    :cond_3
    const-string v13, "images"

    const-string v14, "favicon"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14, v5}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 839
    .end local v5           #imageValues:Landroid/content/ContentValues;
    :cond_4
    add-int/lit8 v4, v4, 0x2

    goto/16 :goto_0

    .line 848
    .end local v2           #favicon:[B
    .end local v3           #faviconId:I
    .end local v11           #thumb:[B
    .end local v12           #thumbId:I
    :cond_5
    add-int v13, p6, v4

    invoke-static {v13}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v13

    goto :goto_1

    .line 889
    .end local v1           #bookmarkDestination:Ljava/lang/CharSequence;
    :cond_6
    invoke-virtual/range {p5 .. p5}, Landroid/content/res/TypedArray;->recycle()V

    .line 891
    .end local v4           #i:I
    .end local v6           #isGoogleHomepage:Z
    .end local v7           #now:Ljava/lang/String;
    .end local v8           #parent:Ljava/lang/String;
    :goto_4
    return v10

    .line 887
    :catch_0
    move-exception v13

    .line 889
    invoke-virtual/range {p5 .. p5}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_4

    :catchall_0
    move-exception v13

    invoke-virtual/range {p5 .. p5}, Landroid/content/res/TypedArray;->recycle()V

    throw v13

    .line 869
    .restart local v1       #bookmarkDestination:Ljava/lang/CharSequence;
    .restart local v2       #favicon:[B
    .restart local v3       #faviconId:I
    .restart local v4       #i:I
    .restart local v6       #isGoogleHomepage:Z
    .restart local v7       #now:Ljava/lang/String;
    .restart local v8       #parent:Ljava/lang/String;
    .restart local v11       #thumb:[B
    .restart local v12       #thumbId:I
    :catch_1
    move-exception v13

    goto :goto_2

    .line 873
    :catch_2
    move-exception v13

    goto :goto_3
.end method

.method private addDefaultBookmarks(Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 9
    .parameter "db"
    .parameter "parentId"

    .prologue
    .line 796
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->this$0:Lcom/android/browser/provider/BrowserProvider2;

    invoke-virtual {v0}, Lcom/android/browser/provider/BrowserProvider2;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 797
    .local v7, res:Landroid/content/res/Resources;
    const v0, 0x7f080078

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v4

    .line 799
    .local v4, bookmarks:[Ljava/lang/CharSequence;
    array-length v8, v4

    .line 800
    .local v8, size:I
    const v0, 0x7f08005c

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v5

    .line 801
    .local v5, preloads:Landroid/content/res/TypedArray;
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    invoke-direct/range {v0 .. v6}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->addDefaultBookmarks(Landroid/database/sqlite/SQLiteDatabase;J[Ljava/lang/CharSequence;Landroid/content/res/TypedArray;I)I

    .line 802
    return-void
.end method

.method private createDefaultBookmarks(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 8
    .parameter "db"

    .prologue
    const/4 v7, 0x1

    const-wide/16 v3, 0x1

    .line 766
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 770
    .local v6, values:Landroid/content/ContentValues;
    const-string v0, "_id"

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 771
    const-string v0, "sync3"

    const-string v1, "google_chrome_bookmarks"

    invoke-virtual {v6, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 772
    const-string v0, "title"

    const-string v1, "Bookmarks"

    invoke-virtual {v6, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 773
    const-string v0, "parent"

    invoke-virtual {v6, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 774
    const-string v0, "position"

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 775
    const-string v0, "folder"

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 776
    const-string v0, "dirty"

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 777
    const-string v0, "bookmarks"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, v6}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 779
    const/4 v5, 0x0

    .line 782
    .local v5, position:I
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->this$0:Lcom/android/browser/provider/BrowserProvider2;

    iget-object v1, p0, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->this$0:Lcom/android/browser/provider/BrowserProvider2;

    invoke-virtual {v1}, Lcom/android/browser/provider/BrowserProvider2;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v1

    #setter for: Lcom/android/browser/provider/BrowserProvider2;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;
    invoke-static {v0, v1}, Lcom/android/browser/provider/BrowserProvider2;->access$202(Lcom/android/browser/provider/BrowserProvider2;Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 783
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->this$0:Lcom/android/browser/provider/BrowserProvider2;

    #getter for: Lcom/android/browser/provider/BrowserProvider2;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;
    invoke-static {v0}, Lcom/android/browser/provider/BrowserProvider2;->access$200(Lcom/android/browser/provider/BrowserProvider2;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v0

    iget-object v1, p0, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->this$0:Lcom/android/browser/provider/BrowserProvider2;

    move-object v2, p1

    invoke-interface/range {v0 .. v5}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->addDefaultBookmarksForCustomer(Lcom/mediatek/browser/ext/IBrowserProvider2Ex;Landroid/database/sqlite/SQLiteDatabase;JI)I

    move-result v5

    if-nez v5, :cond_0

    .line 786
    if-lez v5, :cond_1

    move v0, v7

    :goto_0
    add-int/2addr v5, v0

    .line 788
    invoke-virtual {p0, p1, v3, v4, v5}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->addDefaultBookmarksForYahoo(Landroid/database/sqlite/SQLiteDatabase;JI)I

    move-result v5

    .line 790
    invoke-virtual {p0, p1, v3, v4, v5}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->addDefaultBookmarks(Landroid/database/sqlite/SQLiteDatabase;JI)I

    .line 793
    :cond_0
    return-void

    .line 786
    :cond_1
    const/4 v0, 0x2

    goto :goto_0
.end method

.method private readRaw(Landroid/content/res/Resources;I)[B
    .locals 5
    .parameter "res"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 895
    if-nez p2, :cond_0

    .line 896
    const/4 v4, 0x0

    .line 909
    :goto_0
    return-object v4

    .line 898
    :cond_0
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v2

    .line 900
    .local v2, is:Ljava/io/InputStream;
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 901
    .local v0, bos:Ljava/io/ByteArrayOutputStream;
    const/16 v4, 0x1000

    new-array v1, v4, [B

    .line 903
    .local v1, buf:[B
    :goto_1
    invoke-virtual {v2, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, read:I
    if-lez v3, :cond_1

    .line 904
    const/4 v4, 0x0

    invoke-virtual {v0, v1, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 909
    .end local v0           #bos:Ljava/io/ByteArrayOutputStream;
    .end local v1           #buf:[B
    .end local v3           #read:I
    :catchall_0
    move-exception v4

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw v4

    .line 906
    .restart local v0       #bos:Ljava/io/ByteArrayOutputStream;
    .restart local v1       #buf:[B
    .restart local v3       #read:I
    :cond_1
    :try_start_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->flush()V

    .line 907
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v4

    .line 909
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    goto :goto_0
.end method


# virtual methods
.method public addDefaultBookmarks(Landroid/database/sqlite/SQLiteDatabase;JI)I
    .locals 9
    .parameter "db"
    .parameter "parentId"
    .parameter "position"

    .prologue
    .line 808
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->this$0:Lcom/android/browser/provider/BrowserProvider2;

    invoke-virtual {v0}, Lcom/android/browser/provider/BrowserProvider2;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 809
    .local v7, res:Landroid/content/res/Resources;
    const v0, 0x7f080078

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v4

    .line 811
    .local v4, bookmarks:[Ljava/lang/CharSequence;
    array-length v8, v4

    .line 812
    .local v8, size:I
    const v0, 0x7f08005c

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v5

    .local v5, preloads:Landroid/content/res/TypedArray;
    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move v6, p4

    .line 813
    invoke-direct/range {v0 .. v6}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->addDefaultBookmarks(Landroid/database/sqlite/SQLiteDatabase;J[Ljava/lang/CharSequence;Landroid/content/res/TypedArray;I)I

    move-result v0

    return v0
.end method

.method public addDefaultBookmarksForYahoo(Landroid/database/sqlite/SQLiteDatabase;JI)I
    .locals 9
    .parameter "db"
    .parameter "parentId"
    .parameter "position"

    .prologue
    .line 820
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->this$0:Lcom/android/browser/provider/BrowserProvider2;

    invoke-virtual {v0}, Lcom/android/browser/provider/BrowserProvider2;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 821
    .local v7, res:Landroid/content/res/Resources;
    const v0, 0x7f080064

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v4

    .line 823
    .local v4, bookmarks:[Ljava/lang/CharSequence;
    array-length v8, v4

    .line 824
    .local v8, size:I
    const v0, 0x7f08005b

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v5

    .local v5, preloads:Landroid/content/res/TypedArray;
    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move v6, p4

    .line 825
    invoke-direct/range {v0 .. v6}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->addDefaultBookmarks(Landroid/database/sqlite/SQLiteDatabase;J[Ljava/lang/CharSequence;Landroid/content/res/TypedArray;I)I

    move-result v0

    return v0
.end method

.method createAccountsView(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 715
    const-string v0, "CREATE VIEW IF NOT EXISTS v_accounts AS SELECT NULL AS account_name, NULL AS account_type, 1 AS root_id UNION ALL SELECT account_name, account_type, _id AS root_id FROM bookmarks WHERE sync3 = \"bookmark_bar\" AND deleted = 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 726
    return-void
.end method

.method createOmniboxSuggestions(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 540
    const-string v0, "CREATE VIEW IF NOT EXISTS v_omnibox_suggestions  AS   SELECT _id, url, title, 1 AS bookmark, 0 AS visits, 0 AS date  FROM bookmarks   WHERE deleted = 0 AND folder = 0   UNION ALL   SELECT _id, url, title, 0 AS bookmark, visits, date   FROM history   WHERE url NOT IN (SELECT url FROM bookmarks    WHERE deleted = 0 AND folder = 0)   ORDER BY bookmark DESC, visits DESC, date DESC "

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 541
    return-void
.end method

.method createThumbnails(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 544
    const-string v0, "CREATE TABLE IF NOT EXISTS thumbnails (_id INTEGER PRIMARY KEY,thumbnail BLOB NOT NULL);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 548
    return-void
.end method

.method enableSync(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 10
    .parameter "db"

    .prologue
    const/4 v9, 0x1

    .line 551
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 552
    .local v6, values:Landroid/content/ContentValues;
    const-string v7, "key"

    const-string v8, "sync_enabled"

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 553
    const-string v7, "value"

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 554
    iget-object v7, p0, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->this$0:Lcom/android/browser/provider/BrowserProvider2;

    #calls: Lcom/android/browser/provider/BrowserProvider2;->insertSettingsInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)J
    invoke-static {v7, p1, v6}, Lcom/android/browser/provider/BrowserProvider2;->access$100(Lcom/android/browser/provider/BrowserProvider2;Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)J

    .line 556
    iget-object v7, p0, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->this$0:Lcom/android/browser/provider/BrowserProvider2;

    invoke-virtual {v7}, Lcom/android/browser/provider/BrowserProvider2;->getContext()Landroid/content/Context;

    move-result-object v7

    const-string v8, "account"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/accounts/AccountManager;

    .line 558
    .local v2, am:Landroid/accounts/AccountManager;
    if-nez v2, :cond_1

    .line 575
    :cond_0
    return-void

    .line 561
    :cond_1
    const-string v7, "com.google"

    invoke-virtual {v2, v7}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v1

    .line 562
    .local v1, accounts:[Landroid/accounts/Account;
    if-eqz v1, :cond_0

    array-length v7, v1

    if-eqz v7, :cond_0

    .line 565
    move-object v3, v1

    .local v3, arr$:[Landroid/accounts/Account;
    array-length v5, v3

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_0

    aget-object v0, v3, v4

    .line 566
    .local v0, account:Landroid/accounts/Account;
    const-string v7, "com.android.browser"

    invoke-static {v0, v7}, Landroid/content/ContentResolver;->getIsSyncable(Landroid/accounts/Account;Ljava/lang/String;)I

    move-result v7

    if-nez v7, :cond_2

    .line 569
    const-string v7, "com.android.browser"

    invoke-static {v0, v7, v9}, Landroid/content/ContentResolver;->setIsSyncable(Landroid/accounts/Account;Ljava/lang/String;I)V

    .line 571
    const-string v7, "com.android.browser"

    invoke-static {v0, v7, v9}, Landroid/content/ContentResolver;->setSyncAutomatically(Landroid/accounts/Account;Ljava/lang/String;Z)V

    .line 565
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method importFromBrowserProvider(Landroid/database/sqlite/SQLiteDatabase;)Z
    .locals 20
    .parameter "db"

    .prologue
    .line 578
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->this$0:Lcom/android/browser/provider/BrowserProvider2;

    invoke-virtual {v4}, Lcom/android/browser/provider/BrowserProvider2;->getContext()Landroid/content/Context;

    move-result-object v13

    .line 579
    .local v13, context:Landroid/content/Context;
    const-string v4, "browser.db"

    invoke-virtual {v13, v4}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v16

    .line 580
    .local v16, oldDbFile:Ljava/io/File;
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_b

    .line 581
    new-instance v14, Lcom/android/browser/provider/BrowserProvider$DatabaseHelper;

    invoke-direct {v14, v13}, Lcom/android/browser/provider/BrowserProvider$DatabaseHelper;-><init>(Landroid/content/Context;)V

    .line 583
    .local v14, helper:Lcom/android/browser/provider/BrowserProvider$DatabaseHelper;
    invoke-virtual {v14}, Lcom/android/browser/provider/BrowserProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 584
    .local v2, oldDb:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v12, 0x0

    .line 587
    .local v12, c:Landroid/database/Cursor;
    const/16 v17, 0x0

    .line 590
    .local v17, position:I
    :try_start_0
    new-instance v19, Landroid/content/ContentValues;

    invoke-direct/range {v19 .. v19}, Landroid/content/ContentValues;-><init>()V

    .line 591
    .local v19, values:Landroid/content/ContentValues;
    const-string v4, "_id"

    const-wide/16 v6, 0x1

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 592
    const-string v4, "sync3"

    const-string v6, "google_chrome_bookmarks"

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 593
    const-string v4, "title"

    const-string v6, "Bookmarks"

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 594
    const-string v4, "parent"

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 595
    const-string v4, "position"

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 596
    const-string v4, "folder"

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 597
    const-string v4, "dirty"

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 598
    const-string v4, "bookmarks"

    const/4 v6, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v4, v6, v1}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 601
    sget-object v4, Lcom/android/browser/provider/BrowserProvider;->TABLE_NAMES:[Ljava/lang/String;

    const/4 v6, 0x2

    aget-object v3, v4, v6

    .line 604
    .local v3, tableFolder:Ljava/lang/String;
    const-string v4, "CREATE TABLE IF NOT EXISTS bookmark_folders (_id INTEGER PRIMARY KEY,parent_id INTEGER,folder_level INTEGER,name TEXT,date LONG,visits INTEGER);"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 614
    sget-object v4, Lcom/android/browser/provider/BrowserProvider2;->BOOKMARK_FOLDERS_PROJECTION:[Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "visits DESC"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v12

    .line 617
    if-eqz v12, :cond_2

    .line 618
    :goto_0
    invoke-interface {v12}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 619
    add-int/lit8 v17, v17, 0x1

    .line 620
    new-instance v19, Landroid/content/ContentValues;

    .end local v19           #values:Landroid/content/ContentValues;
    invoke-direct/range {v19 .. v19}, Landroid/content/ContentValues;-><init>()V

    .line 623
    .restart local v19       #values:Landroid/content/ContentValues;
    const-string v4, "_id"

    const/4 v6, 0x0

    invoke-interface {v12, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 624
    const-string v4, "title"

    const/4 v6, 0x3

    invoke-interface {v12, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 625
    const-string v4, "created"

    const/4 v6, 0x4

    invoke-interface {v12, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 626
    const-string v4, "position"

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 627
    const-string v4, "folder"

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 628
    const-string v4, "parent"

    const/4 v6, 0x1

    invoke-interface {v12, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 629
    const-string v4, "bookmarks"

    const-string v6, "dirty"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v4, v6, v1}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 702
    .end local v3           #tableFolder:Ljava/lang/String;
    .end local v19           #values:Landroid/content/ContentValues;
    :catchall_0
    move-exception v4

    if-eqz v12, :cond_0

    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 703
    :cond_0
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 704
    invoke-virtual {v14}, Lcom/android/browser/provider/BrowserProvider$DatabaseHelper;->close()V

    throw v4

    .line 631
    .restart local v3       #tableFolder:Ljava/lang/String;
    .restart local v19       #values:Landroid/content/ContentValues;
    :cond_1
    :try_start_1
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 634
    :cond_2
    sget-object v4, Lcom/android/browser/provider/BrowserProvider;->TABLE_NAMES:[Ljava/lang/String;

    const/4 v6, 0x0

    aget-object v5, v4, v6

    .line 636
    .local v5, table:Ljava/lang/String;
    const/4 v4, 0x6

    new-array v6, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v7, "url"

    aput-object v7, v6, v4

    const/4 v4, 0x1

    const-string v7, "title"

    aput-object v7, v6, v4

    const/4 v4, 0x2

    const-string v7, "favicon"

    aput-object v7, v6, v4

    const/4 v4, 0x3

    const-string v7, "touch_icon"

    aput-object v7, v6, v4

    const/4 v4, 0x4

    const-string v7, "created"

    aput-object v7, v6, v4

    const/4 v4, 0x5

    const-string v7, "folder_id"

    aput-object v7, v6, v4

    const-string v7, "bookmark!=0"

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const-string v11, "visits DESC"

    move-object v4, v2

    invoke-virtual/range {v4 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v12

    .line 648
    if-eqz v12, :cond_5

    .line 649
    :cond_3
    :goto_1
    invoke-interface {v12}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 650
    const/4 v4, 0x0

    invoke-interface {v12, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    .line 651
    .local v18, url:Ljava/lang/String;
    invoke-static/range {v18 .. v18}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 655
    add-int/lit8 v17, v17, 0x1

    .line 656
    new-instance v19, Landroid/content/ContentValues;

    .end local v19           #values:Landroid/content/ContentValues;
    invoke-direct/range {v19 .. v19}, Landroid/content/ContentValues;-><init>()V

    .line 657
    .restart local v19       #values:Landroid/content/ContentValues;
    const-string v4, "url"

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 658
    const-string v4, "title"

    const/4 v6, 0x1

    invoke-interface {v12, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 659
    const-string v4, "created"

    const/4 v6, 0x4

    invoke-interface {v12, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 661
    const-string v4, "position"

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 663
    const-string v4, "parent"

    const/4 v6, 0x5

    invoke-interface {v12, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 664
    new-instance v15, Landroid/content/ContentValues;

    invoke-direct {v15}, Landroid/content/ContentValues;-><init>()V

    .line 665
    .local v15, imageValues:Landroid/content/ContentValues;
    const-string v4, "url_key"

    move-object/from16 v0, v18

    invoke-virtual {v15, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 666
    const-string v4, "favicon"

    const/4 v6, 0x2

    invoke-interface {v12, v6}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v6

    invoke-virtual {v15, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 667
    const-string v4, "touch_icon"

    const/4 v6, 0x3

    invoke-interface {v12, v6}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v6

    invoke-virtual {v15, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 668
    const-string v4, "images"

    const-string v6, "thumbnail"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v6, v15}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 669
    const-string v4, "bookmarks"

    const-string v6, "dirty"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v4, v6, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto/16 :goto_1

    .line 671
    .end local v15           #imageValues:Landroid/content/ContentValues;
    .end local v18           #url:Ljava/lang/String;
    :cond_4
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 674
    :cond_5
    const/4 v4, 0x5

    new-array v6, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v7, "url"

    aput-object v7, v6, v4

    const/4 v4, 0x1

    const-string v7, "title"

    aput-object v7, v6, v4

    const/4 v4, 0x2

    const-string v7, "visits"

    aput-object v7, v6, v4

    const/4 v4, 0x3

    const-string v7, "date"

    aput-object v7, v6, v4

    const/4 v4, 0x4

    const-string v7, "created"

    aput-object v7, v6, v4

    const-string v7, "visits > 0 OR bookmark = 0"

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v4, v2

    invoke-virtual/range {v4 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v12

    .line 684
    if-eqz v12, :cond_8

    .line 685
    :cond_6
    :goto_2
    invoke-interface {v12}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 686
    new-instance v19, Landroid/content/ContentValues;

    .end local v19           #values:Landroid/content/ContentValues;
    invoke-direct/range {v19 .. v19}, Landroid/content/ContentValues;-><init>()V

    .line 687
    .restart local v19       #values:Landroid/content/ContentValues;
    const/4 v4, 0x0

    invoke-interface {v12, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    .line 688
    .restart local v18       #url:Ljava/lang/String;
    invoke-static/range {v18 .. v18}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_6

    .line 690
    const-string v4, "url"

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 691
    const-string v4, "title"

    const/4 v6, 0x1

    invoke-interface {v12, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 692
    const-string v4, "visits"

    const/4 v6, 0x2

    invoke-interface {v12, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 693
    const-string v4, "date"

    const/4 v6, 0x3

    invoke-interface {v12, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 694
    const-string v4, "created"

    const/4 v6, 0x4

    invoke-interface {v12, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 695
    const-string v4, "history"

    const-string v6, "favicon"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v4, v6, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_2

    .line 697
    .end local v18           #url:Ljava/lang/String;
    :cond_7
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 700
    :cond_8
    const/4 v4, 0x0

    const/4 v6, 0x0

    invoke-virtual {v2, v5, v4, v6}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 702
    if-eqz v12, :cond_9

    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 703
    :cond_9
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 704
    invoke-virtual {v14}, Lcom/android/browser/provider/BrowserProvider$DatabaseHelper;->close()V

    .line 706
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->delete()Z

    move-result v4

    if-nez v4, :cond_a

    .line 707
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->deleteOnExit()V

    .line 709
    :cond_a
    const/4 v4, 0x1

    .line 711
    .end local v2           #oldDb:Landroid/database/sqlite/SQLiteDatabase;
    .end local v3           #tableFolder:Ljava/lang/String;
    .end local v5           #table:Ljava/lang/String;
    .end local v12           #c:Landroid/database/Cursor;
    .end local v14           #helper:Lcom/android/browser/provider/BrowserProvider$DatabaseHelper;
    .end local v17           #position:I
    .end local v19           #values:Landroid/content/ContentValues;
    :goto_3
    return v4

    :cond_b
    const/4 v4, 0x0

    goto :goto_3
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 471
    const-string v0, "CREATE TABLE bookmarks(_id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,url TEXT,folder INTEGER NOT NULL DEFAULT 0,parent INTEGER,position INTEGER NOT NULL,insert_after INTEGER,deleted INTEGER NOT NULL DEFAULT 0,account_name TEXT,account_type TEXT,sourceid TEXT,version INTEGER NOT NULL DEFAULT 1,created INTEGER,modified INTEGER,dirty INTEGER NOT NULL DEFAULT 0,sync1 TEXT,sync2 TEXT,sync3 TEXT,sync4 TEXT,sync5 TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 496
    const-string v0, "CREATE TABLE history(_id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,url TEXT NOT NULL,created INTEGER,date INTEGER,visits INTEGER NOT NULL DEFAULT 0,user_entered INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 506
    const-string v0, "CREATE TABLE images (url_key TEXT UNIQUE NOT NULL,favicon BLOB,thumbnail BLOB,touch_icon BLOB);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 512
    const-string v0, "CREATE INDEX imagesUrlIndex ON images(url_key)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 515
    const-string v0, "CREATE TABLE searches (_id INTEGER PRIMARY KEY AUTOINCREMENT,search TEXT,date LONG);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 521
    const-string v0, "CREATE TABLE settings (key TEXT PRIMARY KEY,value TEXT NOT NULL);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 526
    invoke-virtual {p0, p1}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->createAccountsView(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 527
    invoke-virtual {p0, p1}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->createThumbnails(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 529
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->this$0:Lcom/android/browser/provider/BrowserProvider2;

    iget-object v0, v0, Lcom/android/browser/provider/BrowserProvider2;->mSyncHelper:Lcom/android/common/content/SyncStateContentProviderHelper;

    invoke-virtual {v0, p1}, Lcom/android/common/content/SyncStateContentProviderHelper;->createDatabase(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 531
    invoke-virtual {p0, p1}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->importFromBrowserProvider(Landroid/database/sqlite/SQLiteDatabase;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 532
    invoke-direct {p0, p1}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->createDefaultBookmarks(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 535
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->enableSync(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 536
    invoke-virtual {p0, p1}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->createOmniboxSuggestions(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 537
    return-void
.end method

.method public onOpen(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 762
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->this$0:Lcom/android/browser/provider/BrowserProvider2;

    iget-object v0, v0, Lcom/android/browser/provider/BrowserProvider2;->mSyncHelper:Lcom/android/common/content/SyncStateContentProviderHelper;

    invoke-virtual {v0, p1}, Lcom/android/common/content/SyncStateContentProviderHelper;->onDatabaseOpened(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 763
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 2
    .parameter "db"
    .parameter "oldVersion"
    .parameter "newVersion"

    .prologue
    .line 730
    const/16 v0, 0x20

    if-ge p2, v0, :cond_0

    .line 731
    invoke-virtual {p0, p1}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->createOmniboxSuggestions(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 733
    :cond_0
    const/16 v0, 0x1f

    if-ge p2, v0, :cond_1

    .line 734
    invoke-virtual {p0, p1}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->createThumbnails(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 736
    :cond_1
    const/16 v0, 0x1e

    if-ge p2, v0, :cond_2

    .line 737
    const-string v0, "DROP VIEW IF EXISTS v_snapshots_combined"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 738
    const-string v0, "DROP TABLE IF EXISTS snapshots"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 740
    :cond_2
    const/16 v0, 0x1c

    if-ge p2, v0, :cond_3

    .line 741
    invoke-virtual {p0, p1}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->enableSync(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 743
    :cond_3
    const/16 v0, 0x1b

    if-ge p2, v0, :cond_4

    .line 744
    invoke-virtual {p0, p1}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->createAccountsView(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 746
    :cond_4
    const/16 v0, 0x1a

    if-ge p2, v0, :cond_5

    .line 747
    const-string v0, "DROP VIEW IF EXISTS combined"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 749
    :cond_5
    const/16 v0, 0x19

    if-ge p2, v0, :cond_6

    .line 750
    const-string v0, "browser/BrowserProvider"

    const-string v1, "onUpgrade < 25"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 751
    const-string v0, "DROP TABLE IF EXISTS bookmarks"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 752
    const-string v0, "DROP TABLE IF EXISTS history"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 753
    const-string v0, "DROP TABLE IF EXISTS searches"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 754
    const-string v0, "DROP TABLE IF EXISTS images"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 755
    const-string v0, "DROP TABLE IF EXISTS settings"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 756
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->this$0:Lcom/android/browser/provider/BrowserProvider2;

    iget-object v0, v0, Lcom/android/browser/provider/BrowserProvider2;->mSyncHelper:Lcom/android/common/content/SyncStateContentProviderHelper;

    const/4 v1, 0x0

    new-array v1, v1, [Landroid/accounts/Account;

    invoke-virtual {v0, p1, v1}, Lcom/android/common/content/SyncStateContentProviderHelper;->onAccountsChanged(Landroid/database/sqlite/SQLiteDatabase;[Landroid/accounts/Account;)V

    .line 757
    invoke-virtual {p0, p1}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 759
    :cond_6
    return-void
.end method
