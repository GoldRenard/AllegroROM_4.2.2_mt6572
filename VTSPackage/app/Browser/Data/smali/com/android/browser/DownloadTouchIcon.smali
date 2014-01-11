.class Lcom/android/browser/DownloadTouchIcon;
.super Landroid/os/AsyncTask;
.source "DownloadTouchIcon.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private final mContentResolver:Landroid/content/ContentResolver;

.field private final mContext:Landroid/content/Context;

.field private mCursor:Landroid/database/Cursor;

.field private mMessage:Landroid/os/Message;

.field private final mOriginalUrl:Ljava/lang/String;

.field mTab:Lcom/android/browser/Tab;

.field private final mUrl:Ljava/lang/String;

.field private final mUserAgent:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/content/ContentResolver;Ljava/lang/String;)V
    .locals 2
    .parameter "ctx"
    .parameter "cr"
    .parameter "url"

    .prologue
    const/4 v1, 0x0

    .line 79
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 80
    iput-object v1, p0, Lcom/android/browser/DownloadTouchIcon;->mTab:Lcom/android/browser/Tab;

    .line 81
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/DownloadTouchIcon;->mContext:Landroid/content/Context;

    .line 82
    iput-object p2, p0, Lcom/android/browser/DownloadTouchIcon;->mContentResolver:Landroid/content/ContentResolver;

    .line 83
    iput-object v1, p0, Lcom/android/browser/DownloadTouchIcon;->mOriginalUrl:Ljava/lang/String;

    .line 84
    iput-object p3, p0, Lcom/android/browser/DownloadTouchIcon;->mUrl:Ljava/lang/String;

    .line 85
    iput-object v1, p0, Lcom/android/browser/DownloadTouchIcon;->mUserAgent:Ljava/lang/String;

    .line 86
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Message;Ljava/lang/String;)V
    .locals 2
    .parameter "context"
    .parameter "msg"
    .parameter "userAgent"

    .prologue
    const/4 v1, 0x0

    .line 93
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 94
    iput-object p2, p0, Lcom/android/browser/DownloadTouchIcon;->mMessage:Landroid/os/Message;

    .line 95
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/DownloadTouchIcon;->mContext:Landroid/content/Context;

    .line 96
    iput-object v1, p0, Lcom/android/browser/DownloadTouchIcon;->mContentResolver:Landroid/content/ContentResolver;

    .line 97
    iput-object v1, p0, Lcom/android/browser/DownloadTouchIcon;->mOriginalUrl:Ljava/lang/String;

    .line 98
    iput-object v1, p0, Lcom/android/browser/DownloadTouchIcon;->mUrl:Ljava/lang/String;

    .line 99
    iput-object p3, p0, Lcom/android/browser/DownloadTouchIcon;->mUserAgent:Ljava/lang/String;

    .line 100
    return-void
.end method

.method public constructor <init>(Lcom/android/browser/Tab;Landroid/content/Context;Landroid/content/ContentResolver;Landroid/webkit/WebView;)V
    .locals 1
    .parameter "tab"
    .parameter "ctx"
    .parameter "cr"
    .parameter "view"

    .prologue
    .line 62
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 63
    iput-object p1, p0, Lcom/android/browser/DownloadTouchIcon;->mTab:Lcom/android/browser/Tab;

    .line 64
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/DownloadTouchIcon;->mContext:Landroid/content/Context;

    .line 65
    iput-object p3, p0, Lcom/android/browser/DownloadTouchIcon;->mContentResolver:Landroid/content/ContentResolver;

    .line 67
    invoke-virtual {p4}, Landroid/webkit/WebView;->getOriginalUrl()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/DownloadTouchIcon;->mOriginalUrl:Ljava/lang/String;

    .line 68
    invoke-virtual {p4}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/DownloadTouchIcon;->mUrl:Ljava/lang/String;

    .line 69
    invoke-virtual {p4}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/DownloadTouchIcon;->mUserAgent:Ljava/lang/String;

    .line 70
    return-void
.end method

.method private storeIcon(Landroid/graphics/Bitmap;)V
    .locals 6
    .parameter "icon"

    .prologue
    const/4 v5, 0x0

    .line 205
    iget-object v2, p0, Lcom/android/browser/DownloadTouchIcon;->mTab:Lcom/android/browser/Tab;

    if-eqz v2, :cond_0

    .line 207
    iget-object v2, p0, Lcom/android/browser/DownloadTouchIcon;->mTab:Lcom/android/browser/Tab;

    iput-object v5, v2, Lcom/android/browser/Tab;->mTouchIconLoader:Lcom/android/browser/DownloadTouchIcon;

    .line 210
    :cond_0
    if-eqz p1, :cond_1

    iget-object v2, p0, Lcom/android/browser/DownloadTouchIcon;->mCursor:Landroid/database/Cursor;

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/android/browser/DownloadTouchIcon;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 226
    :cond_1
    :goto_0
    return-void

    .line 214
    :cond_2
    iget-object v2, p0, Lcom/android/browser/DownloadTouchIcon;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 215
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 216
    .local v0, os:Ljava/io/ByteArrayOutputStream;
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x64

    invoke-virtual {p1, v2, v3, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 218
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 219
    .local v1, values:Landroid/content/ContentValues;
    const-string v2, "touch_icon"

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 222
    :cond_3
    const-string v2, "url_key"

    iget-object v3, p0, Lcom/android/browser/DownloadTouchIcon;->mCursor:Landroid/database/Cursor;

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    iget-object v2, p0, Lcom/android/browser/DownloadTouchIcon;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v3, Landroid/provider/BrowserContract$Images;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v2, v3, v1, v5, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 224
    iget-object v2, p0, Lcom/android/browser/DownloadTouchIcon;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_3

    goto :goto_0
.end method


# virtual methods
.method public bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 45
    check-cast p1, [Ljava/lang/String;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/browser/DownloadTouchIcon;->doInBackground([Ljava/lang/String;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public varargs doInBackground([Ljava/lang/String;)Ljava/lang/Void;
    .locals 29
    .parameter "values"

    .prologue
    .line 104
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/DownloadTouchIcon;->mContentResolver:Landroid/content/ContentResolver;

    move-object/from16 v26, v0

    if-eqz v26, :cond_0

    .line 105
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/DownloadTouchIcon;->mContentResolver:Landroid/content/ContentResolver;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/DownloadTouchIcon;->mOriginalUrl:Ljava/lang/String;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/DownloadTouchIcon;->mUrl:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-static/range {v26 .. v28}, Lcom/android/browser/Bookmarks;->queryCombinedForUrl(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/DownloadTouchIcon;->mCursor:Landroid/database/Cursor;

    .line 109
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/DownloadTouchIcon;->mCursor:Landroid/database/Cursor;

    move-object/from16 v26, v0

    if-eqz v26, :cond_3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/DownloadTouchIcon;->mCursor:Landroid/database/Cursor;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Landroid/database/Cursor;->getCount()I

    move-result v26

    if-lez v26, :cond_3

    const/4 v14, 0x1

    .line 111
    .local v14, inDatabase:Z
    :goto_0
    const/16 v26, 0x0

    aget-object v24, p1, v26

    .line 113
    .local v24, url:Ljava/lang/String;
    if-nez v14, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/DownloadTouchIcon;->mMessage:Landroid/os/Message;

    move-object/from16 v26, v0

    if-eqz v26, :cond_8

    .line 114
    :cond_1
    const/4 v5, 0x0

    .line 115
    .local v5, client:Landroid/net/http/AndroidHttpClient;
    const/16 v19, 0x0

    .line 118
    .local v19, request:Lorg/apache/http/client/methods/HttpGet;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/DownloadTouchIcon;->mUserAgent:Ljava/lang/String;

    move-object/from16 v26, v0

    invoke-static/range {v26 .. v26}, Landroid/net/http/AndroidHttpClient;->newInstance(Ljava/lang/String;)Landroid/net/http/AndroidHttpClient;

    move-result-object v5

    .line 119
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/DownloadTouchIcon;->mContext:Landroid/content/Context;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v24

    invoke-static {v0, v1}, Landroid/net/Proxy;->getPreferredHttpHost(Landroid/content/Context;Ljava/lang/String;)Lorg/apache/http/HttpHost;

    move-result-object v12

    .line 120
    .local v12, httpHost:Lorg/apache/http/HttpHost;
    if-eqz v12, :cond_2

    .line 121
    invoke-virtual {v5}, Landroid/net/http/AndroidHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-static {v0, v12}, Lorg/apache/http/conn/params/ConnRouteParams;->setDefaultProxy(Lorg/apache/http/params/HttpParams;Lorg/apache/http/HttpHost;)V

    .line 124
    :cond_2
    new-instance v20, Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 127
    .end local v19           #request:Lorg/apache/http/client/methods/HttpGet;
    .local v20, request:Lorg/apache/http/client/methods/HttpGet;
    :try_start_1
    invoke-virtual {v5}, Landroid/net/http/AndroidHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v26

    const/16 v27, 0x1

    invoke-static/range {v26 .. v27}, Lorg/apache/http/client/params/HttpClientParams;->setRedirecting(Lorg/apache/http/params/HttpParams;Z)V

    .line 129
    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Landroid/net/http/AndroidHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v21

    .line 130
    .local v21, response:Lorg/apache/http/HttpResponse;
    invoke-interface/range {v21 .. v21}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v26

    invoke-interface/range {v26 .. v26}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v26

    const/16 v27, 0xc8

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_7

    .line 131
    invoke-interface/range {v21 .. v21}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v9

    .line 132
    .local v9, entity:Lorg/apache/http/HttpEntity;
    if-eqz v9, :cond_7

    .line 133
    invoke-interface {v9}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v7

    .line 134
    .local v7, content:Ljava/io/InputStream;
    if-eqz v7, :cond_7

    .line 137
    :try_start_2
    new-instance v23, Ljava/io/ByteArrayOutputStream;

    invoke-direct/range {v23 .. v23}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 138
    .local v23, swapStream:Ljava/io/ByteArrayOutputStream;
    const/16 v26, 0x400

    move/from16 v0, v26

    new-array v4, v0, [B

    .line 139
    .local v4, buff:[B
    const/16 v18, 0x0

    .line 140
    .local v18, rc:I
    const/4 v6, 0x0

    .line 141
    .local v6, cnt:I
    :goto_1
    const/16 v26, 0x0

    const/16 v27, 0x400

    move/from16 v0, v26

    move/from16 v1, v27

    invoke-virtual {v7, v4, v0, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v18

    if-lez v18, :cond_4

    .line 142
    const/16 v26, 0x0

    move-object/from16 v0, v23

    move/from16 v1, v26

    move/from16 v2, v18

    invoke-virtual {v0, v4, v1, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 143
    add-int v6, v6, v18

    goto :goto_1

    .line 109
    .end local v4           #buff:[B
    .end local v5           #client:Landroid/net/http/AndroidHttpClient;
    .end local v6           #cnt:I
    .end local v7           #content:Ljava/io/InputStream;
    .end local v9           #entity:Lorg/apache/http/HttpEntity;
    .end local v12           #httpHost:Lorg/apache/http/HttpHost;
    .end local v14           #inDatabase:Z
    .end local v18           #rc:I
    .end local v20           #request:Lorg/apache/http/client/methods/HttpGet;
    .end local v21           #response:Lorg/apache/http/HttpResponse;
    .end local v23           #swapStream:Ljava/io/ByteArrayOutputStream;
    .end local v24           #url:Ljava/lang/String;
    :cond_3
    const/4 v14, 0x0

    goto/16 :goto_0

    .line 145
    .restart local v4       #buff:[B
    .restart local v5       #client:Landroid/net/http/AndroidHttpClient;
    .restart local v6       #cnt:I
    .restart local v7       #content:Ljava/io/InputStream;
    .restart local v9       #entity:Lorg/apache/http/HttpEntity;
    .restart local v12       #httpHost:Lorg/apache/http/HttpHost;
    .restart local v14       #inDatabase:Z
    .restart local v18       #rc:I
    .restart local v20       #request:Lorg/apache/http/client/methods/HttpGet;
    .restart local v21       #response:Lorg/apache/http/HttpResponse;
    .restart local v23       #swapStream:Ljava/io/ByteArrayOutputStream;
    .restart local v24       #url:Ljava/lang/String;
    :cond_4
    invoke-virtual/range {v23 .. v23}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v8

    .line 147
    .local v8, data:[B
    new-instance v17, Landroid/graphics/BitmapFactory$Options;

    invoke-direct/range {v17 .. v17}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 148
    .local v17, opts:Landroid/graphics/BitmapFactory$Options;
    const/16 v26, 0x1

    move/from16 v0, v26

    move-object/from16 v1, v17

    iput-boolean v0, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 149
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, v17

    invoke-static {v8, v0, v6, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 150
    move-object/from16 v0, v17

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    move/from16 v25, v0

    .line 151
    .local v25, width:I
    move-object/from16 v0, v17

    iget v11, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 152
    .local v11, height:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/DownloadTouchIcon;->mContext:Landroid/content/Context;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v26

    const v27, 0x7f0e000b

    invoke-virtual/range {v26 .. v27}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v16

    .line 153
    .local v16, limitWidth:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/DownloadTouchIcon;->mContext:Landroid/content/Context;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v26

    const v27, 0x7f0e000c

    invoke-virtual/range {v26 .. v27}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v15

    .line 155
    .local v15, limitHeight:I
    const/16 v22, 0x1

    .line 156
    .local v22, scale:I
    :goto_2
    div-int v26, v25, v22

    move/from16 v0, v26

    move/from16 v1, v16

    if-gt v0, v1, :cond_5

    div-int v26, v11, v22

    move/from16 v0, v26

    if-le v0, v15, :cond_6

    .line 157
    :cond_5
    mul-int/lit8 v22, v22, 0x2

    goto :goto_2

    .line 159
    :cond_6
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, v17

    iput-boolean v0, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 160
    move/from16 v0, v22

    move-object/from16 v1, v17

    iput v0, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 161
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, v17

    invoke-static {v8, v0, v6, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v13

    .line 162
    .local v13, icon:Landroid/graphics/Bitmap;
    if-eqz v14, :cond_b

    .line 163
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/android/browser/DownloadTouchIcon;->storeIcon(Landroid/graphics/Bitmap;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 179
    .end local v4           #buff:[B
    .end local v6           #cnt:I
    .end local v7           #content:Ljava/io/InputStream;
    .end local v8           #data:[B
    .end local v9           #entity:Lorg/apache/http/HttpEntity;
    .end local v11           #height:I
    .end local v13           #icon:Landroid/graphics/Bitmap;
    .end local v15           #limitHeight:I
    .end local v16           #limitWidth:I
    .end local v17           #opts:Landroid/graphics/BitmapFactory$Options;
    .end local v18           #rc:I
    .end local v22           #scale:I
    .end local v23           #swapStream:Ljava/io/ByteArrayOutputStream;
    .end local v25           #width:I
    :cond_7
    :goto_3
    if-eqz v5, :cond_8

    .line 180
    invoke-virtual {v5}, Landroid/net/http/AndroidHttpClient;->close()V

    .line 185
    .end local v5           #client:Landroid/net/http/AndroidHttpClient;
    .end local v12           #httpHost:Lorg/apache/http/HttpHost;
    .end local v20           #request:Lorg/apache/http/client/methods/HttpGet;
    .end local v21           #response:Lorg/apache/http/HttpResponse;
    :cond_8
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/DownloadTouchIcon;->mCursor:Landroid/database/Cursor;

    move-object/from16 v26, v0

    if-eqz v26, :cond_9

    .line 186
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/DownloadTouchIcon;->mCursor:Landroid/database/Cursor;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Landroid/database/Cursor;->close()V

    .line 189
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/DownloadTouchIcon;->mMessage:Landroid/os/Message;

    move-object/from16 v26, v0

    if-eqz v26, :cond_a

    .line 190
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/DownloadTouchIcon;->mMessage:Landroid/os/Message;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/os/Message;->sendToTarget()V

    .line 193
    :cond_a
    const/16 v26, 0x0

    return-object v26

    .line 164
    .restart local v4       #buff:[B
    .restart local v5       #client:Landroid/net/http/AndroidHttpClient;
    .restart local v6       #cnt:I
    .restart local v7       #content:Ljava/io/InputStream;
    .restart local v8       #data:[B
    .restart local v9       #entity:Lorg/apache/http/HttpEntity;
    .restart local v11       #height:I
    .restart local v12       #httpHost:Lorg/apache/http/HttpHost;
    .restart local v13       #icon:Landroid/graphics/Bitmap;
    .restart local v15       #limitHeight:I
    .restart local v16       #limitWidth:I
    .restart local v17       #opts:Landroid/graphics/BitmapFactory$Options;
    .restart local v18       #rc:I
    .restart local v20       #request:Lorg/apache/http/client/methods/HttpGet;
    .restart local v21       #response:Lorg/apache/http/HttpResponse;
    .restart local v22       #scale:I
    .restart local v23       #swapStream:Ljava/io/ByteArrayOutputStream;
    .restart local v25       #width:I
    :cond_b
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/DownloadTouchIcon;->mMessage:Landroid/os/Message;

    move-object/from16 v26, v0

    if-eqz v26, :cond_7

    .line 165
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/DownloadTouchIcon;->mMessage:Landroid/os/Message;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    .line 166
    .local v3, b:Landroid/os/Bundle;
    const-string v26, "touch_icon"

    move-object/from16 v0, v26

    invoke-virtual {v3, v0, v13}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_3

    .line 168
    .end local v3           #b:Landroid/os/Bundle;
    .end local v4           #buff:[B
    .end local v6           #cnt:I
    .end local v8           #data:[B
    .end local v11           #height:I
    .end local v13           #icon:Landroid/graphics/Bitmap;
    .end local v15           #limitHeight:I
    .end local v16           #limitWidth:I
    .end local v17           #opts:Landroid/graphics/BitmapFactory$Options;
    .end local v18           #rc:I
    .end local v22           #scale:I
    .end local v23           #swapStream:Ljava/io/ByteArrayOutputStream;
    .end local v25           #width:I
    :catch_0
    move-exception v26

    goto :goto_3

    .line 174
    .end local v7           #content:Ljava/io/InputStream;
    .end local v9           #entity:Lorg/apache/http/HttpEntity;
    .end local v12           #httpHost:Lorg/apache/http/HttpHost;
    .end local v20           #request:Lorg/apache/http/client/methods/HttpGet;
    .end local v21           #response:Lorg/apache/http/HttpResponse;
    .restart local v19       #request:Lorg/apache/http/client/methods/HttpGet;
    :catch_1
    move-exception v10

    .line 175
    .local v10, ex:Ljava/lang/Exception;
    :goto_5
    if-eqz v19, :cond_c

    .line 176
    :try_start_4
    invoke-virtual/range {v19 .. v19}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 179
    :cond_c
    if-eqz v5, :cond_8

    .line 180
    invoke-virtual {v5}, Landroid/net/http/AndroidHttpClient;->close()V

    goto :goto_4

    .line 179
    .end local v10           #ex:Ljava/lang/Exception;
    :catchall_0
    move-exception v26

    :goto_6
    if-eqz v5, :cond_d

    .line 180
    invoke-virtual {v5}, Landroid/net/http/AndroidHttpClient;->close()V

    :cond_d
    throw v26

    .line 179
    .end local v19           #request:Lorg/apache/http/client/methods/HttpGet;
    .restart local v12       #httpHost:Lorg/apache/http/HttpHost;
    .restart local v20       #request:Lorg/apache/http/client/methods/HttpGet;
    :catchall_1
    move-exception v26

    move-object/from16 v19, v20

    .end local v20           #request:Lorg/apache/http/client/methods/HttpGet;
    .restart local v19       #request:Lorg/apache/http/client/methods/HttpGet;
    goto :goto_6

    .line 174
    .end local v19           #request:Lorg/apache/http/client/methods/HttpGet;
    .restart local v20       #request:Lorg/apache/http/client/methods/HttpGet;
    :catch_2
    move-exception v10

    move-object/from16 v19, v20

    .end local v20           #request:Lorg/apache/http/client/methods/HttpGet;
    .restart local v19       #request:Lorg/apache/http/client/methods/HttpGet;
    goto :goto_5
.end method

.method protected onCancelled()V
    .locals 1

    .prologue
    .line 198
    iget-object v0, p0, Lcom/android/browser/DownloadTouchIcon;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    .line 199
    iget-object v0, p0, Lcom/android/browser/DownloadTouchIcon;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 201
    :cond_0
    return-void
.end method
