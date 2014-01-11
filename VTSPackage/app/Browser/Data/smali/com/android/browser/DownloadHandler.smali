.class public Lcom/android/browser/DownloadHandler;
.super Ljava/lang/Object;
.source "DownloadHandler.java"


# static fields
.field private static final LOGD_ENABLED:Z = true

.field private static final LOGTAG:Ljava/lang/String; = "DLHandler"

.field private static final XLOGTAG:Ljava/lang/String; = "browser/DLHandler"

.field private static sBrowserDownloadEx:Lcom/mediatek/browser/ext/IBrowserDownloadEx;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    const/4 v0, 0x0

    sput-object v0, Lcom/android/browser/DownloadHandler;->sBrowserDownloadEx:Lcom/mediatek/browser/ext/IBrowserDownloadEx;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static encodePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .parameter "path"

    .prologue
    const/16 v10, 0x7c

    const/16 v9, 0x5d

    const/16 v8, 0x5b

    .line 125
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    .line 127
    .local v2, chars:[C
    const/4 v5, 0x0

    .line 128
    .local v5, needed:Z
    move-object v0, v2

    .local v0, arr$:[C
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-char v1, v0, v3

    .line 129
    .local v1, c:C
    if-eq v1, v8, :cond_0

    if-eq v1, v9, :cond_0

    if-ne v1, v10, :cond_2

    .line 130
    :cond_0
    const/4 v5, 0x1

    .line 134
    .end local v1           #c:C
    :cond_1
    if-nez v5, :cond_3

    .line 148
    .end local p0
    :goto_1
    return-object p0

    .line 128
    .restart local v1       #c:C
    .restart local p0
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 138
    .end local v1           #c:C
    :cond_3
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, ""

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 139
    .local v6, sb:Ljava/lang/StringBuilder;
    move-object v0, v2

    array-length v4, v0

    const/4 v3, 0x0

    :goto_2
    if-ge v3, v4, :cond_6

    aget-char v1, v0, v3

    .line 140
    .restart local v1       #c:C
    if-eq v1, v8, :cond_4

    if-eq v1, v9, :cond_4

    if-ne v1, v10, :cond_5

    .line 141
    :cond_4
    const/16 v7, 0x25

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 142
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 144
    :cond_5
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 148
    .end local v1           #c:C
    :cond_6
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_1
.end method

.method public static onDownloadStart(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V
    .locals 13
    .parameter "activity"
    .parameter "url"
    .parameter "userAgent"
    .parameter "contentDisposition"
    .parameter "mimetype"
    .parameter "referer"
    .parameter "privateBrowsing"
    .parameter "contentLength"

    .prologue
    .line 74
    if-eqz p3, :cond_0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const-string v4, "attachment"

    const/4 v5, 0x0

    const/16 v6, 0xa

    move-object/from16 v1, p3

    invoke-virtual/range {v1 .. v6}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v1

    if-nez v1, :cond_4

    .line 79
    :cond_0
    new-instance v2, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 80
    .local v2, intent:Landroid/content/Intent;
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    move-object/from16 v0, p4

    invoke-virtual {v2, v1, v0}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 81
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/high16 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v11

    .line 83
    .local v11, info:Landroid/content/pm/ResolveInfo;
    if-eqz v11, :cond_4

    .line 84
    invoke-virtual {p0}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v12

    .line 87
    .local v12, myName:Landroid/content/ComponentName;
    invoke-virtual {v12}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    iget-object v3, v11, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v12}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v1

    iget-object v3, v11, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 92
    :cond_1
    const-string v1, "application/x-mpegurl"

    move-object/from16 v0, p4

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "application/vnd.apple.mpegurl"

    move-object/from16 v0, p4

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 94
    :cond_2
    invoke-virtual {p0, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 119
    .end local v2           #intent:Landroid/content/Intent;
    .end local v11           #info:Landroid/content/pm/ResolveInfo;
    .end local v12           #myName:Landroid/content/ComponentName;
    :goto_0
    return-void

    .restart local v2       #intent:Landroid/content/Intent;
    .restart local v11       #info:Landroid/content/pm/ResolveInfo;
    .restart local v12       #myName:Landroid/content/ComponentName;
    :cond_3
    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move/from16 v7, p6

    move-wide/from16 v8, p7

    .line 101
    :try_start_0
    invoke-static/range {v1 .. v9}, Lcom/android/browser/DownloadHandler;->showDownloadOrOpenContent(Landroid/app/Activity;Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 105
    :catch_0
    move-exception v10

    .line 107
    .local v10, ex:Landroid/content/ActivityNotFoundException;
    const-string v1, "DLHandler"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "activity not found for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p4

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " over "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 117
    .end local v2           #intent:Landroid/content/Intent;
    .end local v10           #ex:Landroid/content/ActivityNotFoundException;
    .end local v11           #info:Landroid/content/pm/ResolveInfo;
    .end local v12           #myName:Landroid/content/ComponentName;
    :cond_4
    invoke-static/range {p0 .. p8}, Lcom/android/browser/DownloadHandler;->onDownloadStartNoStream(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V

    goto :goto_0
.end method

.method public static onDownloadStartNoStream(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V
    .locals 23
    .parameter "activity"
    .parameter "url"
    .parameter "userAgent"
    .parameter "contentDisposition"
    .parameter "mimetype"
    .parameter "referer"
    .parameter "privateBrowsing"
    .parameter "contentLength"

    .prologue
    .line 166
    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-static {v0, v1, v2}, Landroid/webkit/URLUtil;->guessFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 168
    .local v11, filename:Ljava/lang/String;
    const-string v3, "browser/DLHandler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Guess file name is: "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v8, " mimetype is: "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v19

    .line 173
    .local v19, status:Ljava/lang/String;
    const-string v3, "mounted"

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 178
    const-string v3, "shared"

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 179
    const v3, 0x7f0c0159

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 180
    .local v16, msg:Ljava/lang/String;
    const v20, 0x7f0c0158

    .line 186
    .local v20, title:I
    :goto_0
    new-instance v3, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x1010355

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setIconAttribute(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f0c0058

    const/4 v8, 0x0

    invoke-virtual {v3, v4, v8}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 308
    .end local v16           #msg:Ljava/lang/String;
    .end local v20           #title:I
    :cond_0
    :goto_1
    return-void

    .line 182
    :cond_1
    const v3, 0x7f0c0157

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v11, v4, v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    .line 183
    .restart local v16       #msg:Ljava/lang/String;
    const v20, 0x7f0c0156

    .restart local v20       #title:I
    goto :goto_0

    .line 196
    .end local v16           #msg:Ljava/lang/String;
    .end local v20           #title:I
    :cond_2
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/browser/BrowserSettings;->getDownloadPath()Ljava/lang/String;

    move-result-object v12

    .line 197
    .local v12, mDownloadPath:Ljava/lang/String;
    const-string v3, "sdcard1"

    invoke-virtual {v12, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 198
    new-instance v3, Ljava/io/File;

    const-string v4, "/storage/sdcard1"

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->canWrite()Z

    move-result v3

    if-nez v3, :cond_3

    .line 199
    const v14, 0x7f0c0009

    .line 200
    .local v14, mTitle:I
    const v3, 0x7f0c000a

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 201
    .local v13, mMsg:Ljava/lang/String;
    new-instance v3, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v14}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x1080027

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, v13}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f0c0058

    const/4 v8, 0x0

    invoke-virtual {v3, v4, v8}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_1

    .line 216
    .end local v13           #mMsg:Ljava/lang/String;
    .end local v14           #mTitle:I
    :cond_3
    :try_start_0
    new-instance v22, Landroid/net/WebAddress;

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Landroid/net/WebAddress;-><init>(Ljava/lang/String;)V

    .line 217
    .local v22, webAddress:Landroid/net/WebAddress;
    invoke-virtual/range {v22 .. v22}, Landroid/net/WebAddress;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/browser/DownloadHandler;->encodePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Landroid/net/WebAddress;->setPath(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 225
    invoke-virtual/range {v22 .. v22}, Landroid/net/WebAddress;->toString()Ljava/lang/String;

    move-result-object v6

    .line 226
    .local v6, addressString:Ljava/lang/String;
    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v21

    .line 229
    .local v21, uri:Landroid/net/Uri;
    :try_start_1
    new-instance v5, Landroid/app/DownloadManager$Request;

    move-object/from16 v0, v21

    invoke-direct {v5, v0}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 234
    .local v5, request:Landroid/app/DownloadManager$Request;
    move-object/from16 v0, p4

    invoke-virtual {v5, v0}, Landroid/app/DownloadManager$Request;->setMimeType(Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 236
    invoke-static/range {p0 .. p0}, Lcom/mediatek/browser/ext/Extensions;->getDownloadPlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserDownloadEx;

    move-result-object v3

    sput-object v3, Lcom/android/browser/DownloadHandler;->sBrowserDownloadEx:Lcom/mediatek/browser/ext/IBrowserDownloadEx;

    .line 237
    sget-object v3, Lcom/android/browser/DownloadHandler;->sBrowserDownloadEx:Lcom/mediatek/browser/ext/IBrowserDownloadEx;

    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/browser/BrowserSettings;->getDownloadPath()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p4

    invoke-interface {v3, v4, v5, v11, v0}, Lcom/mediatek/browser/ext/IBrowserDownloadEx;->setRequestDestinationDir(Ljava/lang/String;Landroid/app/DownloadManager$Request;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 242
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "file://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/browser/BrowserSettings;->getDownloadPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 244
    .local v9, downloadPath:Ljava/lang/String;
    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v18

    .line 245
    .local v18, pathUri:Landroid/net/Uri;
    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Landroid/app/DownloadManager$Request;->setDestinationUri(Landroid/net/Uri;)Landroid/app/DownloadManager$Request;

    .line 246
    const-string v3, "browser/DLHandler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "request.setDestinationInExternalPublicDir, addressString: "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    .end local v9           #downloadPath:Ljava/lang/String;
    .end local v18           #pathUri:Landroid/net/Uri;
    :cond_4
    invoke-virtual {v5}, Landroid/app/DownloadManager$Request;->allowScanningByMediaScanner()V

    .line 253
    invoke-virtual/range {v22 .. v22}, Landroid/net/WebAddress;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Landroid/app/DownloadManager$Request;->setDescription(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    .line 256
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v3

    move-object/from16 v0, p1

    move/from16 v1, p6

    invoke-virtual {v3, v0, v1}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v7

    .line 257
    .local v7, cookies:Ljava/lang/String;
    const-string v3, "cookie"

    invoke-virtual {v5, v3, v7}, Landroid/app/DownloadManager$Request;->addRequestHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 258
    const-string v3, "User-Agent"

    move-object/from16 v0, p2

    invoke-virtual {v5, v3, v0}, Landroid/app/DownloadManager$Request;->addRequestHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 259
    const-string v3, "Referer"

    move-object/from16 v0, p5

    invoke-virtual {v5, v3, v0}, Landroid/app/DownloadManager$Request;->addRequestHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 260
    const/4 v3, 0x1

    invoke-virtual {v5, v3}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    .line 262
    move-object/from16 v0, p2

    invoke-virtual {v5, v0}, Landroid/app/DownloadManager$Request;->setUserAgent(Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 263
    if-nez p4, :cond_5

    .line 264
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 270
    :try_start_2
    invoke-static {v6}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_2

    .line 279
    new-instance v3, Lcom/android/browser/FetchUrlMimeType;

    move-object/from16 v4, p0

    move-object/from16 v8, p2

    invoke-direct/range {v3 .. v8}, Lcom/android/browser/FetchUrlMimeType;-><init>(Landroid/content/Context;Landroid/app/DownloadManager$Request;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/android/browser/FetchUrlMimeType;->start()V

    .line 292
    :goto_2
    invoke-static/range {p0 .. p0}, Lcom/mediatek/browser/ext/Extensions;->getDownloadPlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserDownloadEx;

    move-result-object v3

    sput-object v3, Lcom/android/browser/DownloadHandler;->sBrowserDownloadEx:Lcom/mediatek/browser/ext/IBrowserDownloadEx;

    .line 293
    const-wide/16 v3, 0x0

    cmp-long v3, p7, v3

    if-lez v3, :cond_6

    sget-object v3, Lcom/android/browser/DownloadHandler;->sBrowserDownloadEx:Lcom/mediatek/browser/ext/IBrowserDownloadEx;

    invoke-interface {v3}, Lcom/mediatek/browser/ext/IBrowserDownloadEx;->shouldShowToastWithFileSize()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 294
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const v4, 0x7f0c003f

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    move-wide/from16 v1, p7

    invoke-static {v0, v1, v2}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 304
    :goto_3
    new-instance v17, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW_DOWNLOADS"

    move-object/from16 v0, v17

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 305
    .local v17, pageView:Landroid/content/Intent;
    const/high16 v3, 0x1000

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 306
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_1

    .line 218
    .end local v5           #request:Landroid/app/DownloadManager$Request;
    .end local v6           #addressString:Ljava/lang/String;
    .end local v7           #cookies:Ljava/lang/String;
    .end local v17           #pageView:Landroid/content/Intent;
    .end local v21           #uri:Landroid/net/Uri;
    .end local v22           #webAddress:Landroid/net/WebAddress;
    :catch_0
    move-exception v10

    .line 221
    .local v10, e:Ljava/lang/Exception;
    const-string v3, "DLHandler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Exception trying to parse url:"

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 230
    .end local v10           #e:Ljava/lang/Exception;
    .restart local v6       #addressString:Ljava/lang/String;
    .restart local v21       #uri:Landroid/net/Uri;
    .restart local v22       #webAddress:Landroid/net/WebAddress;
    :catch_1
    move-exception v10

    .line 231
    .local v10, e:Ljava/lang/IllegalArgumentException;
    const v3, 0x7f0c015a

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 271
    .end local v10           #e:Ljava/lang/IllegalArgumentException;
    .restart local v5       #request:Landroid/app/DownloadManager$Request;
    .restart local v7       #cookies:Ljava/lang/String;
    :catch_2
    move-exception v10

    .line 272
    .restart local v10       #e:Ljava/lang/IllegalArgumentException;
    const v3, 0x7f0c015a

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 282
    .end local v10           #e:Ljava/lang/IllegalArgumentException;
    :cond_5
    const-string v3, "download"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/app/DownloadManager;

    .line 284
    .local v15, manager:Landroid/app/DownloadManager;
    new-instance v3, Lcom/android/browser/DownloadHandler$1;

    const-string v4, "Browser download"

    invoke-direct {v3, v4, v15, v5}, Lcom/android/browser/DownloadHandler$1;-><init>(Ljava/lang/String;Landroid/app/DownloadManager;Landroid/app/DownloadManager$Request;)V

    invoke-virtual {v3}, Lcom/android/browser/DownloadHandler$1;->start()V

    goto/16 :goto_2

    .line 299
    .end local v15           #manager:Landroid/app/DownloadManager;
    :cond_6
    const v3, 0x7f0c015b

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_3
.end method

.method public static showDownloadOrOpenContent(Landroid/app/Activity;Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V
    .locals 11
    .parameter "activity"
    .parameter "intent"
    .parameter "url"
    .parameter "userAgent"
    .parameter "contentDisposition"
    .parameter "mimetype"
    .parameter "privateBrowsing"
    .parameter "contentLength"

    .prologue
    .line 325
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0c0047

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x108009b

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0c0022

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v9

    const v10, 0x7f0c0023

    new-instance v0, Lcom/android/browser/DownloadHandler$4;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    move/from16 v6, p6

    move-wide/from16 v7, p7

    invoke-direct/range {v0 .. v8}, Lcom/android/browser/DownloadHandler$4;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V

    invoke-virtual {v9, v10, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0c0024

    new-instance v2, Lcom/android/browser/DownloadHandler$3;

    invoke-direct {v2, p1, p0}, Lcom/android/browser/DownloadHandler$3;-><init>(Landroid/content/Intent;Landroid/app/Activity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/android/browser/DownloadHandler$2;

    invoke-direct {v1}, Lcom/android/browser/DownloadHandler$2;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 360
    return-void
.end method
