.class public Lcom/android/browser/UploadHandler;
.super Ljava/lang/Object;
.source "UploadHandler.java"


# instance fields
.field private mCameraFilePath:Ljava/lang/String;

.field private mCaughtActivityNotFoundException:Z

.field private mController:Lcom/android/browser/Controller;

.field private mHandled:Z

.field private mUploadMessage:Landroid/webkit/ValueCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/webkit/ValueCallback",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/browser/Controller;)V
    .locals 0
    .parameter "controller"

    .prologue
    .line 47
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/android/browser/UploadHandler;->mController:Lcom/android/browser/Controller;

    .line 49
    return-void
.end method

.method private createCamcorderIntent()Landroid/content/Intent;
    .locals 2

    .prologue
    .line 256
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.media.action.VIDEO_CAPTURE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private createCameraIntent()Landroid/content/Intent;
    .locals 6

    .prologue
    .line 243
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 244
    .local v1, cameraIntent:Landroid/content/Intent;
    sget-object v3, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    invoke-static {v3}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 246
    .local v2, externalDataDir:Ljava/io/File;
    new-instance v0, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "browser-photos"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 248
    .local v0, cameraDataDir:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 249
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".jpg"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/browser/UploadHandler;->mCameraFilePath:Ljava/lang/String;

    .line 251
    const-string v3, "output"

    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lcom/android/browser/UploadHandler;->mCameraFilePath:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 252
    return-object v1
.end method

.method private varargs createChooserIntent([Landroid/content/Intent;)Landroid/content/Intent;
    .locals 4
    .parameter "intents"

    .prologue
    .line 227
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CHOOSER"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 228
    .local v0, chooser:Landroid/content/Intent;
    const-string v1, "android.intent.extra.INITIAL_INTENTS"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 229
    const-string v1, "android.intent.extra.TITLE"

    iget-object v2, p0, Lcom/android/browser/UploadHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v2}, Lcom/android/browser/Controller;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c0048

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 232
    return-object v0
.end method

.method private createDefaultOpenableIntent()Landroid/content/Intent;
    .locals 5

    .prologue
    .line 216
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.GET_CONTENT"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 217
    .local v1, i:Landroid/content/Intent;
    const-string v2, "android.intent.category.OPENABLE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 218
    const-string v2, "*/*"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 220
    const/4 v2, 0x3

    new-array v2, v2, [Landroid/content/Intent;

    const/4 v3, 0x0

    invoke-direct {p0}, Lcom/android/browser/UploadHandler;->createCameraIntent()Landroid/content/Intent;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-direct {p0}, Lcom/android/browser/UploadHandler;->createCamcorderIntent()Landroid/content/Intent;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-direct {p0}, Lcom/android/browser/UploadHandler;->createSoundRecorderIntent()Landroid/content/Intent;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-direct {p0, v2}, Lcom/android/browser/UploadHandler;->createChooserIntent([Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    .line 222
    .local v0, chooser:Landroid/content/Intent;
    const-string v2, "android.intent.extra.INTENT"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 223
    return-object v0
.end method

.method private createOpenableIntent(Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .parameter "type"

    .prologue
    .line 236
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GET_CONTENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 237
    .local v0, i:Landroid/content/Intent;
    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 238
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 239
    return-object v0
.end method

.method private createSoundRecorderIntent()Landroid/content/Intent;
    .locals 2

    .prologue
    .line 260
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.provider.MediaStore.RECORD_SOUND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private startActivity(Landroid/content/Intent;)V
    .locals 6
    .parameter "intent"

    .prologue
    const/4 v5, 0x1

    .line 196
    :try_start_0
    iget-object v2, p0, Lcom/android/browser/UploadHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v2}, Lcom/android/browser/Controller;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v2, p1, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 210
    :goto_0
    return-void

    .line 197
    :catch_0
    move-exception v0

    .line 201
    .local v0, e:Landroid/content/ActivityNotFoundException;
    const/4 v2, 0x1

    :try_start_1
    iput-boolean v2, p0, Lcom/android/browser/UploadHandler;->mCaughtActivityNotFoundException:Z

    .line 202
    iget-object v2, p0, Lcom/android/browser/UploadHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v2}, Lcom/android/browser/Controller;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {p0}, Lcom/android/browser/UploadHandler;->createDefaultOpenableIntent()Landroid/content/Intent;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {v2, v3, v4}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 204
    :catch_1
    move-exception v1

    .line 206
    .local v1, e2:Landroid/content/ActivityNotFoundException;
    iget-object v2, p0, Lcom/android/browser/UploadHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v2}, Lcom/android/browser/Controller;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f0c0049

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method


# virtual methods
.method getFilePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/android/browser/UploadHandler;->mCameraFilePath:Ljava/lang/String;

    return-object v0
.end method

.method handled()Z
    .locals 1

    .prologue
    .line 56
    iget-boolean v0, p0, Lcom/android/browser/UploadHandler;->mHandled:Z

    return v0
.end method

.method onResult(ILandroid/content/Intent;)V
    .locals 6
    .parameter "resultCode"
    .parameter "intent"

    .prologue
    const/4 v5, 0x0

    const/4 v3, -0x1

    .line 61
    if-nez p1, :cond_0

    iget-boolean v2, p0, Lcom/android/browser/UploadHandler;->mCaughtActivityNotFoundException:Z

    if-eqz v2, :cond_0

    .line 64
    iput-boolean v5, p0, Lcom/android/browser/UploadHandler;->mCaughtActivityNotFoundException:Z

    .line 91
    :goto_0
    return-void

    .line 68
    :cond_0
    if-eqz p2, :cond_1

    if-eq p1, v3, :cond_3

    :cond_1
    const/4 v1, 0x0

    .line 77
    .local v1, result:Landroid/net/Uri;
    :goto_1
    if-nez v1, :cond_2

    if-nez p2, :cond_2

    if-ne p1, v3, :cond_2

    .line 78
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lcom/android/browser/UploadHandler;->mCameraFilePath:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 79
    .local v0, cameraFile:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 80
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    .line 83
    iget-object v2, p0, Lcom/android/browser/UploadHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v2}, Lcom/android/browser/Controller;->getActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    invoke-direct {v3, v4, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 88
    .end local v0           #cameraFile:Ljava/io/File;
    :cond_2
    iget-object v2, p0, Lcom/android/browser/UploadHandler;->mUploadMessage:Landroid/webkit/ValueCallback;

    invoke-interface {v2, v1}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 89
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/browser/UploadHandler;->mHandled:Z

    .line 90
    iput-boolean v5, p0, Lcom/android/browser/UploadHandler;->mCaughtActivityNotFoundException:Z

    goto :goto_0

    .line 68
    .end local v1           #result:Landroid/net/Uri;
    :cond_3
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    goto :goto_1
.end method

.method openFileChooser(Landroid/webkit/ValueCallback;Ljava/lang/String;Ljava/lang/String;)V
    .locals 22
    .parameter
    .parameter "acceptType"
    .parameter "capture"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/ValueCallback",
            "<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 95
    .local p1, uploadMsg:Landroid/webkit/ValueCallback;,"Landroid/webkit/ValueCallback<Landroid/net/Uri;>;"
    const-string v6, "image/*"

    .line 96
    .local v6, imageMimeType:Ljava/lang/String;
    const-string v18, "video/*"

    .line 97
    .local v18, videoMimeType:Ljava/lang/String;
    const-string v3, "audio/*"

    .line 98
    .local v3, audioMimeType:Ljava/lang/String;
    const-string v10, "capture"

    .line 99
    .local v10, mediaSourceKey:Ljava/lang/String;
    const-string v12, "camera"

    .line 100
    .local v12, mediaSourceValueCamera:Ljava/lang/String;
    const-string v13, "filesystem"

    .line 101
    .local v13, mediaSourceValueFileSystem:Ljava/lang/String;
    const-string v11, "camcorder"

    .line 102
    .local v11, mediaSourceValueCamcorder:Ljava/lang/String;
    const-string v14, "microphone"

    .line 106
    .local v14, mediaSourceValueMicrophone:Ljava/lang/String;
    const-string v9, "filesystem"

    .line 108
    .local v9, mediaSource:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/UploadHandler;->mUploadMessage:Landroid/webkit/ValueCallback;

    move-object/from16 v19, v0

    if-eqz v19, :cond_0

    .line 192
    :goto_0
    return-void

    .line 113
    :cond_0
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/UploadHandler;->mUploadMessage:Landroid/webkit/ValueCallback;

    .line 116
    const-string v19, ";"

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v17

    .line 117
    .local v17, params:[Ljava/lang/String;
    const/16 v19, 0x0

    aget-object v15, v17, v19

    .line 119
    .local v15, mimeType:Ljava/lang/String;
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v19

    if-lez v19, :cond_1

    .line 120
    move-object/from16 v9, p3

    .line 123
    :cond_1
    const-string v19, "filesystem"

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_3

    .line 128
    move-object/from16 v2, v17

    .local v2, arr$:[Ljava/lang/String;
    array-length v8, v2

    .local v8, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_1
    if-ge v5, v8, :cond_3

    aget-object v16, v2, v5

    .line 129
    .local v16, p:Ljava/lang/String;
    const-string v19, "="

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 130
    .local v7, keyValue:[Ljava/lang/String;
    array-length v0, v7

    move/from16 v19, v0

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_2

    .line 132
    const-string v19, "capture"

    const/16 v20, 0x0

    aget-object v20, v7, v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_2

    .line 133
    const/16 v19, 0x1

    aget-object v9, v7, v19

    .line 128
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 140
    .end local v2           #arr$:[Ljava/lang/String;
    .end local v5           #i$:I
    .end local v7           #keyValue:[Ljava/lang/String;
    .end local v8           #len$:I
    .end local v16           #p:Ljava/lang/String;
    :cond_3
    const/16 v19, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/UploadHandler;->mCameraFilePath:Ljava/lang/String;

    .line 142
    const-string v19, "image/*"

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_5

    .line 143
    const-string v19, "camera"

    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_4

    .line 146
    invoke-direct/range {p0 .. p0}, Lcom/android/browser/UploadHandler;->createCameraIntent()Landroid/content/Intent;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/browser/UploadHandler;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 152
    :cond_4
    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Landroid/content/Intent;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-direct/range {p0 .. p0}, Lcom/android/browser/UploadHandler;->createCameraIntent()Landroid/content/Intent;

    move-result-object v21

    aput-object v21, v19, v20

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/browser/UploadHandler;->createChooserIntent([Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v4

    .line 153
    .local v4, chooser:Landroid/content/Intent;
    const-string v19, "android.intent.extra.INTENT"

    const-string v20, "image/*"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/android/browser/UploadHandler;->createOpenableIntent(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v4, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 154
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/browser/UploadHandler;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 157
    .end local v4           #chooser:Landroid/content/Intent;
    :cond_5
    const-string v19, "video/*"

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_7

    .line 158
    const-string v19, "camcorder"

    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_6

    .line 161
    invoke-direct/range {p0 .. p0}, Lcom/android/browser/UploadHandler;->createCamcorderIntent()Landroid/content/Intent;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/browser/UploadHandler;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 167
    :cond_6
    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Landroid/content/Intent;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-direct/range {p0 .. p0}, Lcom/android/browser/UploadHandler;->createCamcorderIntent()Landroid/content/Intent;

    move-result-object v21

    aput-object v21, v19, v20

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/browser/UploadHandler;->createChooserIntent([Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v4

    .line 168
    .restart local v4       #chooser:Landroid/content/Intent;
    const-string v19, "android.intent.extra.INTENT"

    const-string v20, "video/*"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/android/browser/UploadHandler;->createOpenableIntent(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v4, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 169
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/browser/UploadHandler;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 172
    .end local v4           #chooser:Landroid/content/Intent;
    :cond_7
    const-string v19, "audio/*"

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_9

    .line 173
    const-string v19, "microphone"

    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_8

    .line 176
    invoke-direct/range {p0 .. p0}, Lcom/android/browser/UploadHandler;->createSoundRecorderIntent()Landroid/content/Intent;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/browser/UploadHandler;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 182
    :cond_8
    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Landroid/content/Intent;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-direct/range {p0 .. p0}, Lcom/android/browser/UploadHandler;->createSoundRecorderIntent()Landroid/content/Intent;

    move-result-object v21

    aput-object v21, v19, v20

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/browser/UploadHandler;->createChooserIntent([Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v4

    .line 183
    .restart local v4       #chooser:Landroid/content/Intent;
    const-string v19, "android.intent.extra.INTENT"

    const-string v20, "audio/*"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/android/browser/UploadHandler;->createOpenableIntent(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v4, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 184
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/browser/UploadHandler;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 191
    .end local v4           #chooser:Landroid/content/Intent;
    :cond_9
    invoke-direct/range {p0 .. p0}, Lcom/android/browser/UploadHandler;->createDefaultOpenableIntent()Landroid/content/Intent;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/browser/UploadHandler;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0
.end method
