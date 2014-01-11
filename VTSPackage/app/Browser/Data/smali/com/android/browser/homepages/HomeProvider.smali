.class public Lcom/android/browser/homepages/HomeProvider;
.super Landroid/content/ContentProvider;
.source "HomeProvider.java"


# static fields
.field public static final AUTHORITY:Ljava/lang/String; = "com.android.browser.home"

.field public static final MOST_VISITED:Ljava/lang/String; = "content://com.android.browser.home/"

.field private static final TAG:Ljava/lang/String; = "HomeProvider"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method

.method private static interceptFile(Ljava/lang/String;)Z
    .locals 4
    .parameter "url"

    .prologue
    const/4 v2, 0x0

    .line 113
    const-string v3, "file:///"

    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 121
    :cond_0
    :goto_0
    return v2

    .line 116
    :cond_1
    const/4 v3, 0x7

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 117
    .local v1, fpath:Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 118
    .local v0, f:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 121
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static shouldInterceptRequest(Landroid/content/Context;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 7
    .parameter "context"
    .parameter "url"

    .prologue
    .line 95
    :try_start_0
    const-string v4, "content://com.android.browser.site_navigation/websites"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "content://com.android.browser.home/"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 97
    :cond_0
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 98
    .local v3, uri:Landroid/net/Uri;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v0

    .line 99
    .local v0, ins:Ljava/io/InputStream;
    new-instance v4, Landroid/webkit/WebResourceResponse;

    const-string v5, "text/html"

    const-string v6, "utf-8"

    invoke-direct {v4, v5, v6, v0}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    .line 109
    .end local v0           #ins:Ljava/io/InputStream;
    .end local v3           #uri:Landroid/net/Uri;
    :goto_0
    return-object v4

    .line 101
    :cond_1
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/browser/BrowserSettings;->isDebugEnabled()Z

    move-result v1

    .line 102
    .local v1, listFiles:Z
    if-eqz v1, :cond_2

    invoke-static {p1}, Lcom/android/browser/homepages/HomeProvider;->interceptFile(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 103
    new-instance v0, Ljava/io/PipedInputStream;

    invoke-direct {v0}, Ljava/io/PipedInputStream;-><init>()V

    .line 104
    .local v0, ins:Ljava/io/PipedInputStream;
    new-instance v2, Ljava/io/PipedOutputStream;

    invoke-direct {v2, v0}, Ljava/io/PipedOutputStream;-><init>(Ljava/io/PipedInputStream;)V

    .line 105
    .local v2, outs:Ljava/io/PipedOutputStream;
    new-instance v4, Lcom/android/browser/homepages/RequestHandler;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-direct {v4, p0, v5, v2}, Lcom/android/browser/homepages/RequestHandler;-><init>(Landroid/content/Context;Landroid/net/Uri;Ljava/io/OutputStream;)V

    invoke-virtual {v4}, Lcom/android/browser/homepages/RequestHandler;->start()V

    .line 106
    new-instance v4, Landroid/webkit/WebResourceResponse;

    const-string v5, "text/html"

    const-string v6, "utf-8"

    invoke-direct {v4, v5, v6, v0}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 108
    .end local v0           #ins:Ljava/io/PipedInputStream;
    .end local v1           #listFiles:Z
    .end local v2           #outs:Ljava/io/PipedOutputStream;
    :catch_0
    move-exception v4

    .line 109
    :cond_2
    const/4 v4, 0x0

    goto :goto_0
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .parameter "uri"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    .line 45
    const/4 v0, 0x0

    return v0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .parameter "uri"

    .prologue
    .line 50
    const/4 v0, 0x0

    return-object v0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 1
    .parameter "uri"
    .parameter "values"

    .prologue
    .line 55
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()Z
    .locals 1

    .prologue
    .line 60
    const/4 v0, 0x0

    return v0
.end method

.method public openFile(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;
    .locals 8
    .parameter "uri"
    .parameter "mode"

    .prologue
    .line 78
    :try_start_0
    invoke-static {}, Landroid/os/ParcelFileDescriptor;->createPipe()[Landroid/os/ParcelFileDescriptor;

    move-result-object v7

    .line 79
    .local v7, pipes:[Landroid/os/ParcelFileDescriptor;
    const/4 v2, 0x1

    aget-object v1, v7, v2

    .line 80
    .local v1, write:Landroid/os/ParcelFileDescriptor;
    new-instance v0, Landroid/content/res/AssetFileDescriptor;

    const-wide/16 v2, 0x0

    const-wide/16 v4, -0x1

    invoke-direct/range {v0 .. v5}, Landroid/content/res/AssetFileDescriptor;-><init>(Landroid/os/ParcelFileDescriptor;JJ)V

    .line 81
    .local v0, afd:Landroid/content/res/AssetFileDescriptor;
    new-instance v2, Lcom/android/browser/homepages/RequestHandler;

    invoke-virtual {p0}, Lcom/android/browser/homepages/HomeProvider;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->createOutputStream()Ljava/io/FileOutputStream;

    move-result-object v4

    invoke-direct {v2, v3, p1, v4}, Lcom/android/browser/homepages/RequestHandler;-><init>(Landroid/content/Context;Landroid/net/Uri;Ljava/io/OutputStream;)V

    invoke-virtual {v2}, Lcom/android/browser/homepages/RequestHandler;->start()V

    .line 82
    const/4 v2, 0x0

    aget-object v2, v7, v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    .end local v0           #afd:Landroid/content/res/AssetFileDescriptor;
    .end local v1           #write:Landroid/os/ParcelFileDescriptor;
    .end local v7           #pipes:[Landroid/os/ParcelFileDescriptor;
    :goto_0
    return-object v2

    .line 83
    :catch_0
    move-exception v6

    .line 84
    .local v6, e:Ljava/io/IOException;
    const-string v2, "HomeProvider"

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

    .line 85
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 1
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "sortOrder"

    .prologue
    .line 66
    const/4 v0, 0x0

    return-object v0
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .parameter "uri"
    .parameter "values"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    .line 72
    const/4 v0, 0x0

    return v0
.end method
