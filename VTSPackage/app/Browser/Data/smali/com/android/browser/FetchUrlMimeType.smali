.class Lcom/android/browser/FetchUrlMimeType;
.super Ljava/lang/Thread;
.source "FetchUrlMimeType.java"


# static fields
.field private static final LOGTAG:Ljava/lang/String; = "FetchUrlMimeType"

.field public static final XLOGTAG:Ljava/lang/String; = "Browser/FetchMimeType"


# instance fields
.field private mBrowserDownloadEx:Lcom/mediatek/browser/ext/IBrowserDownloadEx;

.field private mContext:Landroid/content/Context;

.field private mCookies:Ljava/lang/String;

.field private mRequest:Landroid/app/DownloadManager$Request;

.field private mUri:Ljava/lang/String;

.field private mUserAgent:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/app/DownloadManager$Request;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "context"
    .parameter "request"
    .parameter "uri"
    .parameter "cookies"
    .parameter "userAgent"

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/FetchUrlMimeType;->mBrowserDownloadEx:Lcom/mediatek/browser/ext/IBrowserDownloadEx;

    .line 67
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/FetchUrlMimeType;->mContext:Landroid/content/Context;

    .line 68
    iput-object p2, p0, Lcom/android/browser/FetchUrlMimeType;->mRequest:Landroid/app/DownloadManager$Request;

    .line 69
    iput-object p3, p0, Lcom/android/browser/FetchUrlMimeType;->mUri:Ljava/lang/String;

    .line 70
    iput-object p4, p0, Lcom/android/browser/FetchUrlMimeType;->mCookies:Ljava/lang/String;

    .line 71
    iput-object p5, p0, Lcom/android/browser/FetchUrlMimeType;->mUserAgent:Ljava/lang/String;

    .line 72
    return-void
.end method


# virtual methods
.method public run()V
    .locals 24

    .prologue
    .line 78
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/FetchUrlMimeType;->mUserAgent:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Landroid/net/http/AndroidHttpClient;->newInstance(Ljava/lang/String;)Landroid/net/http/AndroidHttpClient;

    move-result-object v3

    .line 81
    .local v3, client:Landroid/net/http/AndroidHttpClient;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/FetchUrlMimeType;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/FetchUrlMimeType;->mUri:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-static/range {v21 .. v22}, Landroid/net/Proxy;->getPreferredHttpHost(Landroid/content/Context;Ljava/lang/String;)Lorg/apache/http/HttpHost;

    move-result-object v10

    .line 82
    .local v10, httpHost:Lorg/apache/http/HttpHost;
    if-eqz v10, :cond_0

    .line 83
    invoke-virtual {v3}, Landroid/net/http/AndroidHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-static {v0, v10}, Lorg/apache/http/conn/params/ConnRouteParams;->setDefaultProxy(Lorg/apache/http/params/HttpParams;Lorg/apache/http/HttpHost;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    :cond_0
    new-instance v16, Lorg/apache/http/client/methods/HttpHead;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/FetchUrlMimeType;->mUri:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpHead;-><init>(Ljava/lang/String;)V

    .line 92
    .local v16, request:Lorg/apache/http/client/methods/HttpHead;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/FetchUrlMimeType;->mCookies:Ljava/lang/String;

    move-object/from16 v21, v0

    if-eqz v21, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/FetchUrlMimeType;->mCookies:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v21

    if-lez v21, :cond_1

    .line 93
    const-string v21, "Cookie"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/FetchUrlMimeType;->mCookies:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpHead;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    :cond_1
    const/4 v12, 0x0

    .line 98
    .local v12, mimeType:Ljava/lang/String;
    const/4 v4, 0x0

    .line 100
    .local v4, contentDisposition:Ljava/lang/String;
    const/16 v17, 0x0

    .line 102
    .local v17, requestGet:Lorg/apache/http/client/methods/HttpGet;
    :try_start_1
    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Landroid/net/http/AndroidHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v19

    .line 104
    .local v19, response:Lorg/apache/http/HttpResponse;
    invoke-interface/range {v19 .. v19}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v21

    const/16 v22, 0x1f5

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_2

    invoke-interface/range {v19 .. v19}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v21

    const/16 v22, 0x190

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_3

    .line 106
    :cond_2
    new-instance v18, Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/FetchUrlMimeType;->mUri:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 107
    .end local v17           #requestGet:Lorg/apache/http/client/methods/HttpGet;
    .local v18, requestGet:Lorg/apache/http/client/methods/HttpGet;
    :try_start_2
    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Landroid/net/http/AndroidHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v19

    .line 108
    const-string v21, "Browser/FetchMimeType"

    const-string v22, "FetchUrlMimeType:  use Get method"

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    move-object/from16 v17, v18

    .line 114
    .end local v18           #requestGet:Lorg/apache/http/client/methods/HttpGet;
    .restart local v17       #requestGet:Lorg/apache/http/client/methods/HttpGet;
    :cond_3
    :try_start_3
    invoke-interface/range {v19 .. v19}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v21

    const/16 v22, 0xc8

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_5

    .line 115
    const-string v21, "Content-Type"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v9

    .line 116
    .local v9, header:Lorg/apache/http/Header;
    if-eqz v9, :cond_4

    .line 117
    invoke-interface {v9}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v12

    .line 118
    const/16 v21, 0x3b

    move/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v20

    .line 119
    .local v20, semicolonIndex:I
    const/16 v21, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_4

    .line 120
    const/16 v21, 0x0

    move/from16 v0, v21

    move/from16 v1, v20

    invoke-virtual {v12, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 123
    .end local v20           #semicolonIndex:I
    :cond_4
    const-string v21, "Content-Disposition"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v5

    .line 124
    .local v5, contentDispositionHeader:Lorg/apache/http/Header;
    if-eqz v5, :cond_5

    .line 125
    invoke-interface {v5}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    move-result-object v4

    .line 139
    .end local v5           #contentDispositionHeader:Lorg/apache/http/Header;
    .end local v9           #header:Lorg/apache/http/Header;
    :cond_5
    invoke-virtual {v3}, Landroid/net/http/AndroidHttpClient;->close()V

    .line 142
    .end local v19           #response:Lorg/apache/http/HttpResponse;
    :goto_0
    if-eqz v12, :cond_7

    .line 143
    const-string v21, "text/plain"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v21

    if-nez v21, :cond_6

    const-string v21, "application/octet-stream"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_7

    .line 145
    :cond_6
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/FetchUrlMimeType;->mUri:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Landroid/webkit/MimeTypeMap;->getFileExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 148
    .local v13, newMimeType:Ljava/lang/String;
    if-eqz v13, :cond_7

    .line 149
    move-object v12, v13

    .line 150
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/FetchUrlMimeType;->mRequest:Landroid/app/DownloadManager$Request;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v13}, Landroid/app/DownloadManager$Request;->setMimeType(Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 155
    .end local v13           #newMimeType:Ljava/lang/String;
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/FetchUrlMimeType;->mUri:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-static {v0, v4, v12}, Landroid/webkit/URLUtil;->guessFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 157
    .local v8, filename:Ljava/lang/String;
    const-string v21, "Browser/FetchMimeType"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "FetchUrlMimeType: Guess file name is: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " mimeType is: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/FetchUrlMimeType;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/mediatek/browser/ext/Extensions;->getDownloadPlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserDownloadEx;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/FetchUrlMimeType;->mBrowserDownloadEx:Lcom/mediatek/browser/ext/IBrowserDownloadEx;

    .line 161
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/FetchUrlMimeType;->mBrowserDownloadEx:Lcom/mediatek/browser/ext/IBrowserDownloadEx;

    move-object/from16 v21, v0

    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Lcom/android/browser/BrowserSettings;->getDownloadPath()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/FetchUrlMimeType;->mRequest:Landroid/app/DownloadManager$Request;

    move-object/from16 v23, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-interface {v0, v1, v2, v8, v12}, Lcom/mediatek/browser/ext/IBrowserDownloadEx;->setRequestDestinationDir(Ljava/lang/String;Landroid/app/DownloadManager$Request;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v21

    if-nez v21, :cond_8

    .line 165
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "file://"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Lcom/android/browser/BrowserSettings;->getDownloadPath()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    sget-object v22, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 167
    .local v6, downloadPath:Ljava/lang/String;
    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v15

    .line 168
    .local v15, pathUri:Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/FetchUrlMimeType;->mRequest:Landroid/app/DownloadManager$Request;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v15}, Landroid/app/DownloadManager$Request;->setDestinationUri(Landroid/net/Uri;)Landroid/app/DownloadManager$Request;

    .line 173
    .end local v6           #downloadPath:Ljava/lang/String;
    .end local v15           #pathUri:Landroid/net/Uri;
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/FetchUrlMimeType;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    const-string v22, "download"

    invoke-virtual/range {v21 .. v22}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/app/DownloadManager;

    .line 175
    .local v11, manager:Landroid/app/DownloadManager;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/FetchUrlMimeType;->mRequest:Landroid/app/DownloadManager$Request;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v11, v0}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    .line 178
    new-instance v14, Landroid/content/Intent;

    const-string v21, "android.intent.action.VIEW_DOWNLOADS"

    move-object/from16 v0, v21

    invoke-direct {v14, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 179
    .local v14, pageView:Landroid/content/Intent;
    const/high16 v21, 0x1000

    move/from16 v0, v21

    invoke-virtual {v14, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 180
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/FetchUrlMimeType;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v14}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 181
    .end local v4           #contentDisposition:Ljava/lang/String;
    .end local v8           #filename:Ljava/lang/String;
    .end local v10           #httpHost:Lorg/apache/http/HttpHost;
    .end local v11           #manager:Landroid/app/DownloadManager;
    .end local v12           #mimeType:Ljava/lang/String;
    .end local v14           #pageView:Landroid/content/Intent;
    .end local v16           #request:Lorg/apache/http/client/methods/HttpHead;
    .end local v17           #requestGet:Lorg/apache/http/client/methods/HttpGet;
    :goto_1
    return-void

    .line 85
    :catch_0
    move-exception v7

    .line 86
    .local v7, ex:Ljava/lang/IllegalArgumentException;
    const-string v21, "FetchUrlMimeType"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Download failed: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    invoke-virtual {v3}, Landroid/net/http/AndroidHttpClient;->close()V

    goto :goto_1

    .line 128
    .end local v7           #ex:Ljava/lang/IllegalArgumentException;
    .restart local v4       #contentDisposition:Ljava/lang/String;
    .restart local v10       #httpHost:Lorg/apache/http/HttpHost;
    .restart local v12       #mimeType:Ljava/lang/String;
    .restart local v16       #request:Lorg/apache/http/client/methods/HttpHead;
    .restart local v17       #requestGet:Lorg/apache/http/client/methods/HttpGet;
    :catch_1
    move-exception v7

    .line 129
    .restart local v7       #ex:Ljava/lang/IllegalArgumentException;
    :goto_2
    :try_start_4
    invoke-virtual/range {v16 .. v16}, Lorg/apache/http/client/methods/HttpHead;->abort()V

    .line 130
    if-eqz v17, :cond_9

    .line 131
    invoke-virtual/range {v17 .. v17}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 139
    :cond_9
    invoke-virtual {v3}, Landroid/net/http/AndroidHttpClient;->close()V

    goto/16 :goto_0

    .line 133
    .end local v7           #ex:Ljava/lang/IllegalArgumentException;
    :catch_2
    move-exception v7

    .line 134
    .local v7, ex:Ljava/io/IOException;
    :goto_3
    :try_start_5
    invoke-virtual/range {v16 .. v16}, Lorg/apache/http/client/methods/HttpHead;->abort()V

    .line 135
    if-eqz v17, :cond_a

    .line 136
    invoke-virtual/range {v17 .. v17}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 139
    :cond_a
    invoke-virtual {v3}, Landroid/net/http/AndroidHttpClient;->close()V

    goto/16 :goto_0

    .end local v7           #ex:Ljava/io/IOException;
    :catchall_0
    move-exception v21

    :goto_4
    invoke-virtual {v3}, Landroid/net/http/AndroidHttpClient;->close()V

    throw v21

    .end local v17           #requestGet:Lorg/apache/http/client/methods/HttpGet;
    .restart local v18       #requestGet:Lorg/apache/http/client/methods/HttpGet;
    .restart local v19       #response:Lorg/apache/http/HttpResponse;
    :catchall_1
    move-exception v21

    move-object/from16 v17, v18

    .end local v18           #requestGet:Lorg/apache/http/client/methods/HttpGet;
    .restart local v17       #requestGet:Lorg/apache/http/client/methods/HttpGet;
    goto :goto_4

    .line 133
    .end local v17           #requestGet:Lorg/apache/http/client/methods/HttpGet;
    .restart local v18       #requestGet:Lorg/apache/http/client/methods/HttpGet;
    :catch_3
    move-exception v7

    move-object/from16 v17, v18

    .end local v18           #requestGet:Lorg/apache/http/client/methods/HttpGet;
    .restart local v17       #requestGet:Lorg/apache/http/client/methods/HttpGet;
    goto :goto_3

    .line 128
    .end local v17           #requestGet:Lorg/apache/http/client/methods/HttpGet;
    .restart local v18       #requestGet:Lorg/apache/http/client/methods/HttpGet;
    :catch_4
    move-exception v7

    move-object/from16 v17, v18

    .end local v18           #requestGet:Lorg/apache/http/client/methods/HttpGet;
    .restart local v17       #requestGet:Lorg/apache/http/client/methods/HttpGet;
    goto :goto_2
.end method
