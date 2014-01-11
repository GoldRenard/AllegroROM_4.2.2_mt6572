.class public Lcom/android/browser/WallpaperHandler;
.super Ljava/lang/Thread;
.source "WallpaperHandler.java"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;
.implements Landroid/content/DialogInterface$OnCancelListener;


# static fields
.field private static final BUFFER_SIZE:I = 0x20000

.field private static final LOGTAG:Ljava/lang/String; = "WallpaperHandler"


# instance fields
.field private mCanceled:Z

.field private mContext:Landroid/content/Context;

.field private mUrl:Ljava/lang/String;

.field private mWallpaperProgress:Landroid/app/ProgressDialog;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .parameter "context"
    .parameter "url"

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/WallpaperHandler;->mCanceled:Z

    .line 57
    iput-object p1, p0, Lcom/android/browser/WallpaperHandler;->mContext:Landroid/content/Context;

    .line 58
    iput-object p2, p0, Lcom/android/browser/WallpaperHandler;->mUrl:Ljava/lang/String;

    .line 59
    return-void
.end method

.method private openStream()Ljava/io/InputStream;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 181
    const/4 v2, 0x0

    .line 182
    .local v2, inputStream:Ljava/io/InputStream;
    iget-object v4, p0, Lcom/android/browser/WallpaperHandler;->mUrl:Ljava/lang/String;

    invoke-static {v4}, Lcom/android/browser/DataUri;->isDataUri(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 183
    new-instance v1, Lcom/android/browser/DataUri;

    iget-object v4, p0, Lcom/android/browser/WallpaperHandler;->mUrl:Ljava/lang/String;

    invoke-direct {v1, v4}, Lcom/android/browser/DataUri;-><init>(Ljava/lang/String;)V

    .line 184
    .local v1, dataUri:Lcom/android/browser/DataUri;
    new-instance v2, Ljava/io/ByteArrayInputStream;

    .end local v2           #inputStream:Ljava/io/InputStream;
    invoke-virtual {v1}, Lcom/android/browser/DataUri;->getData()[B

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 192
    .end local v1           #dataUri:Lcom/android/browser/DataUri;
    .restart local v2       #inputStream:Ljava/io/InputStream;
    :goto_0
    return-object v2

    .line 186
    :cond_0
    new-instance v3, Ljava/net/URL;

    iget-object v4, p0, Lcom/android/browser/WallpaperHandler;->mUrl:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 187
    .local v3, url:Ljava/net/URL;
    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    .line 188
    .local v0, conn:Ljava/net/URLConnection;
    const-string v4, "Connection"

    const-string v5, "close"

    invoke-virtual {v0, v4, v5}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    goto :goto_0
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .parameter "dialog"

    .prologue
    .line 63
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/browser/WallpaperHandler;->mCanceled:Z

    .line 64
    return-void
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 4
    .parameter "item"

    .prologue
    const/4 v3, 0x1

    .line 68
    iget-object v0, p0, Lcom/android/browser/WallpaperHandler;->mUrl:Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/browser/WallpaperHandler;->getState()Ljava/lang/Thread$State;

    move-result-object v0

    sget-object v1, Ljava/lang/Thread$State;->NEW:Ljava/lang/Thread$State;

    if-ne v0, v1, :cond_0

    .line 73
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/android/browser/WallpaperHandler;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/browser/WallpaperHandler;->mWallpaperProgress:Landroid/app/ProgressDialog;

    .line 74
    iget-object v0, p0, Lcom/android/browser/WallpaperHandler;->mWallpaperProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 75
    iget-object v0, p0, Lcom/android/browser/WallpaperHandler;->mWallpaperProgress:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/android/browser/WallpaperHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0178

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 77
    iget-object v0, p0, Lcom/android/browser/WallpaperHandler;->mWallpaperProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 78
    iget-object v0, p0, Lcom/android/browser/WallpaperHandler;->mWallpaperProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p0}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 79
    iget-object v0, p0, Lcom/android/browser/WallpaperHandler;->mWallpaperProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 80
    invoke-virtual {p0}, Lcom/android/browser/WallpaperHandler;->start()V

    .line 82
    :cond_0
    return v3
.end method

.method public run()V
    .locals 28

    .prologue
    .line 87
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/WallpaperHandler;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v23

    .line 88
    .local v23, wm:Landroid/app/WallpaperManager;
    invoke-virtual/range {v23 .. v23}, Landroid/app/WallpaperManager;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v17

    .line 89
    .local v17, oldWallpaper:Landroid/graphics/drawable/Drawable;
    const/4 v14, 0x0

    .line 97
    .local v14, inputstream:Ljava/io/InputStream;
    :try_start_0
    invoke-direct/range {p0 .. p0}, Lcom/android/browser/WallpaperHandler;->openStream()Ljava/io/InputStream;

    move-result-object v14

    .line 98
    if-eqz v14, :cond_6

    .line 99
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 100
    .local v4, baos:Ljava/io/ByteArrayOutputStream;
    const/16 v21, 0x0

    .line 101
    .local v21, seg:I
    const/16 v24, 0x2000

    move/from16 v0, v24

    new-array v8, v0, [B

    .line 102
    .local v8, buf:[B
    :goto_0
    invoke-virtual {v14, v8}, Ljava/io/InputStream;->read([B)I

    move-result v21

    const/16 v24, -0x1

    move/from16 v0, v21

    move/from16 v1, v24

    if-eq v0, v1, :cond_3

    .line 103
    const/16 v24, 0x0

    move/from16 v0, v24

    move/from16 v1, v21

    invoke-virtual {v4, v8, v0, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 132
    .end local v4           #baos:Ljava/io/ByteArrayOutputStream;
    .end local v8           #buf:[B
    .end local v21           #seg:I
    :catch_0
    move-exception v10

    .line 133
    .local v10, e:Ljava/io/IOException;
    :try_start_1
    invoke-virtual {v10}, Ljava/io/IOException;->printStackTrace()V

    .line 134
    const-string v24, "WallpaperHandler"

    const-string v25, "Unable to set new wallpaper"

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    const/16 v24, 0x1

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/browser/WallpaperHandler;->mCanceled:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 139
    if-eqz v14, :cond_0

    .line 141
    :try_start_2
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 148
    .end local v10           #e:Ljava/io/IOException;
    :cond_0
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/browser/WallpaperHandler;->mCanceled:Z

    move/from16 v24, v0

    if-eqz v24, :cond_1

    .line 152
    invoke-virtual/range {v17 .. v17}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v22

    .line 153
    .local v22, width:I
    invoke-virtual/range {v17 .. v17}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v12

    .line 154
    .local v12, height:I
    sget-object v24, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    move/from16 v0, v22

    move-object/from16 v1, v24

    invoke-static {v0, v12, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 155
    .local v5, bm:Landroid/graphics/Bitmap;
    new-instance v9, Landroid/graphics/Canvas;

    invoke-direct {v9, v5}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 156
    .local v9, canvas:Landroid/graphics/Canvas;
    const/16 v24, 0x0

    const/16 v25, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v22

    invoke-virtual {v0, v1, v2, v3, v12}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 157
    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 158
    const/16 v24, 0x0

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 160
    :try_start_3
    move-object/from16 v0, v23

    invoke-virtual {v0, v5}, Landroid/app/WallpaperManager;->setBitmap(Landroid/graphics/Bitmap;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 164
    :goto_2
    const/16 v24, 0x0

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/browser/WallpaperHandler;->mCanceled:Z

    .line 167
    .end local v5           #bm:Landroid/graphics/Bitmap;
    .end local v9           #canvas:Landroid/graphics/Canvas;
    .end local v12           #height:I
    .end local v22           #width:I
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/WallpaperHandler;->mWallpaperProgress:Landroid/app/ProgressDialog;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v24

    if-eqz v24, :cond_2

    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/WallpaperHandler;->mWallpaperProgress:Landroid/app/ProgressDialog;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/app/ProgressDialog;->dismiss()V

    .line 170
    :cond_2
    return-void

    .line 105
    .restart local v4       #baos:Ljava/io/ByteArrayOutputStream;
    .restart local v8       #buf:[B
    .restart local v21       #seg:I
    :cond_3
    :try_start_4
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v13

    .line 106
    .local v13, imageData:[B
    new-instance v18, Landroid/graphics/BitmapFactory$Options;

    invoke-direct/range {v18 .. v18}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 107
    .local v18, options:Landroid/graphics/BitmapFactory$Options;
    const/16 v24, 0x1

    move/from16 v0, v24

    move-object/from16 v1, v18

    iput-boolean v0, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 110
    const/16 v24, 0x0

    array-length v0, v13

    move/from16 v25, v0

    move/from16 v0, v24

    move/from16 v1, v25

    move-object/from16 v2, v18

    invoke-static {v13, v0, v1, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v11

    .line 111
    .local v11, firstImage:Landroid/graphics/Bitmap;
    invoke-virtual/range {v23 .. v23}, Landroid/app/WallpaperManager;->getDesiredMinimumWidth()I

    move-result v16

    .line 112
    .local v16, maxWidth:I
    invoke-virtual/range {v23 .. v23}, Landroid/app/WallpaperManager;->getDesiredMinimumHeight()I

    move-result v15

    .line 114
    .local v15, maxHeight:I
    move/from16 v0, v16

    int-to-double v0, v0

    move-wide/from16 v24, v0

    const-wide/high16 v26, 0x3ff4

    mul-double v24, v24, v26

    move-wide/from16 v0, v24

    double-to-int v0, v0

    move/from16 v16, v0

    .line 115
    int-to-double v0, v15

    move-wide/from16 v24, v0

    const-wide/high16 v26, 0x3ff4

    mul-double v24, v24, v26

    move-wide/from16 v0, v24

    double-to-int v15, v0

    .line 116
    move-object/from16 v0, v18

    iget v7, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 117
    .local v7, bmWidth:I
    move-object/from16 v0, v18

    iget v6, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 119
    .local v6, bmHeight:I
    const/16 v19, 0x1

    .line 120
    .local v19, scale:I
    :goto_3
    move/from16 v0, v16

    if-gt v7, v0, :cond_4

    if-le v6, v15, :cond_5

    .line 121
    :cond_4
    shl-int/lit8 v19, v19, 0x1

    .line 122
    shr-int/lit8 v7, v7, 0x1

    .line 123
    shr-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 125
    :cond_5
    const/16 v24, 0x0

    move/from16 v0, v24

    move-object/from16 v1, v18

    iput-boolean v0, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 126
    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 127
    const/16 v24, 0x0

    array-length v0, v13

    move/from16 v25, v0

    move/from16 v0, v24

    move/from16 v1, v25

    move-object/from16 v2, v18

    invoke-static {v13, v0, v1, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v20

    .line 128
    .local v20, scaledWallpaper:Landroid/graphics/Bitmap;
    if-eqz v20, :cond_6

    .line 129
    move-object/from16 v0, v23

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/app/WallpaperManager;->setBitmap(Landroid/graphics/Bitmap;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 139
    .end local v4           #baos:Ljava/io/ByteArrayOutputStream;
    .end local v6           #bmHeight:I
    .end local v7           #bmWidth:I
    .end local v8           #buf:[B
    .end local v11           #firstImage:Landroid/graphics/Bitmap;
    .end local v13           #imageData:[B
    .end local v15           #maxHeight:I
    .end local v16           #maxWidth:I
    .end local v18           #options:Landroid/graphics/BitmapFactory$Options;
    .end local v19           #scale:I
    .end local v20           #scaledWallpaper:Landroid/graphics/Bitmap;
    .end local v21           #seg:I
    :cond_6
    if-eqz v14, :cond_0

    .line 141
    :try_start_5
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_1

    .line 142
    :catch_1
    move-exception v24

    goto/16 :goto_1

    .line 139
    :catchall_0
    move-exception v24

    if-eqz v14, :cond_7

    .line 141
    :try_start_6
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 144
    :cond_7
    :goto_4
    throw v24

    .line 161
    .restart local v5       #bm:Landroid/graphics/Bitmap;
    .restart local v9       #canvas:Landroid/graphics/Canvas;
    .restart local v12       #height:I
    .restart local v22       #width:I
    :catch_2
    move-exception v10

    .line 162
    .restart local v10       #e:Ljava/io/IOException;
    const-string v24, "WallpaperHandler"

    const-string v25, "Unable to restore old wallpaper."

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 142
    .end local v5           #bm:Landroid/graphics/Bitmap;
    .end local v9           #canvas:Landroid/graphics/Canvas;
    .end local v12           #height:I
    .end local v22           #width:I
    :catch_3
    move-exception v24

    goto/16 :goto_1

    .end local v10           #e:Ljava/io/IOException;
    :catch_4
    move-exception v25

    goto :goto_4
.end method
