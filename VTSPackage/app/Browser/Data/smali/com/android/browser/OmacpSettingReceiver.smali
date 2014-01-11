.class public Lcom/android/browser/OmacpSettingReceiver;
.super Landroid/content/BroadcastReceiver;
.source "OmacpSettingReceiver.java"


# static fields
.field private static final APP_CAPABILITY_ACTION:Ljava/lang/String; = "com.mediatek.omacp.capability"

.field private static final APP_CAPABILITY_RESULT_ACTION:Ljava/lang/String; = "com.mediatek.omacp.capability.result"

.field private static final APP_ID_KEY:Ljava/lang/String; = "appId"

.field private static final APP_RESULT:Ljava/lang/String; = "result"

.field private static final APP_SETTING_ACTION:Ljava/lang/String; = "com.mediatek.omacp.settings"

.field private static final APP_SETTING_RESULT_ACTION:Ljava/lang/String; = "com.mediatek.omacp.settings.result"

.field private static final BOOKMARK_NAME:Ljava/lang/String; = "NAME"

.field private static final BOOKMARK_URI:Ljava/lang/String; = "URI"

.field private static final BROWSER:Ljava/lang/String; = "browser"

.field private static final BROWSER_APP_ID:Ljava/lang/String; = "w2"

.field private static final BROWSER_BOOKMARK:Ljava/lang/String; = "browser_bookmark"

.field private static final BROWSER_BOOKMARK_FOLDER:Ljava/lang/String; = "browser_bookmark_folder"

.field private static final BROWSER_BOOKMARK_NAME:Ljava/lang/String; = "browser_bookmark_name"

.field private static final BROWSER_HOMEPAGE:Ljava/lang/String; = "browser_homepage"

.field private static final BROWSER_PASSWORD:Ljava/lang/String; = "browser_password"

.field private static final BROWSER_TO_NAPID:Ljava/lang/String; = "browser_to_napid"

.field private static final BROWSER_TO_PROXY:Ljava/lang/String; = "browser_to_proxy"

.field private static final BROWSER_USERNAME:Ljava/lang/String; = "browser_username"

.field private static final DEBUG:Z = true

.field private static final FOLDER_NAME:Ljava/lang/String; = "NAME"

.field private static final RESOURCE:Ljava/lang/String; = "RESOURCE"

.field private static final STARTPAGE:Ljava/lang/String; = "STARTPAGE"

.field private static final STARTPAGE_TRUE:Ljava/lang/String; = "1"

.field private static final XLOG:Ljava/lang/String; = "browser/OmacpSettingReceiver"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private sendCapabilityResult(Landroid/content/Context;)V
    .locals 5
    .parameter "context"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 177
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.mediatek.omacp.capability.result"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 178
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "appId"

    const-string v2, "w2"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 179
    const-string v1, "browser"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 180
    const-string v1, "browser_bookmark_folder"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 181
    const-string v1, "browser_to_proxy"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 182
    const-string v1, "browser_to_napid"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 183
    const-string v1, "browser_bookmark_name"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 184
    const-string v1, "browser_bookmark"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 185
    const-string v1, "browser_username"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 186
    const-string v1, "browser_password"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 187
    const-string v1, "browser_homepage"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 190
    const-string v1, "browser/OmacpSettingReceiver"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Capability Broadcasting: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 193
    return-void
.end method

.method private sendSettingResult(Landroid/content/Context;Z)V
    .locals 4
    .parameter "context"
    .parameter "result"

    .prologue
    .line 167
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.mediatek.omacp.settings.result"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 168
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "appId"

    const-string v2, "w2"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 169
    const-string v1, "result"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 172
    const-string v1, "browser/OmacpSettingReceiver"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Setting Broadcasting: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 175
    return-void
.end method

.method private setBookmarkAndHomePage(Landroid/content/Context;Landroid/content/Intent;J)Z
    .locals 18
    .parameter "context"
    .parameter "intent"
    .parameter "folderId"

    .prologue
    .line 107
    const/4 v14, 0x0

    .line 108
    .local v14, result:Z
    const-wide/16 v2, -0x1

    cmp-long v2, v2, p3

    if-nez v2, :cond_0

    move v15, v14

    .line 151
    .end local v14           #result:Z
    .local v15, result:I
    :goto_0
    return v15

    .line 112
    .end local v15           #result:I
    .restart local v14       #result:Z
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    .line 113
    .local v9, cr:Landroid/content/ContentResolver;
    const-string v2, "RESOURCE"

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v13

    check-cast v13, Ljava/util/ArrayList;

    .line 115
    .local v13, resourceMapList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    if-nez v13, :cond_1

    .line 116
    const-string v2, "browser/OmacpSettingReceiver"

    const-string v3, "resourceMapList is null"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    move v15, v14

    .line 151
    .restart local v15       #result:I
    goto :goto_0

    .line 119
    .end local v15           #result:I
    :cond_1
    const-string v2, "browser/OmacpSettingReceiver"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "resourceMapList size:"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    const/4 v10, 0x0

    .line 122
    .local v10, hasSetStartPage:Z
    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, i$:Ljava/util/Iterator;
    :cond_2
    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/HashMap;

    .line 123
    .local v12, item:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "URI"

    invoke-virtual {v12, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 124
    .local v17, url:Ljava/lang/String;
    const-string v2, "NAME"

    invoke-virtual {v12, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 125
    .local v5, name:Ljava/lang/String;
    const-string v2, "STARTPAGE"

    invoke-virtual {v12, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 126
    .local v16, startPage:Ljava/lang/String;
    if-eqz v17, :cond_2

    .line 129
    invoke-static/range {v17 .. v17}, Lcom/android/browser/UrlUtils;->fixUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 130
    .local v4, formattedUrl:Ljava/lang/String;
    if-eqz v4, :cond_2

    .line 133
    if-nez v5, :cond_3

    .line 134
    move-object v5, v4

    .line 137
    :cond_3
    const/4 v3, 0x0

    const/4 v6, 0x0

    move-object/from16 v2, p1

    move-wide/from16 v7, p3

    invoke-static/range {v2 .. v8}, Lcom/android/browser/Bookmarks;->addBookmark(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;J)V

    .line 139
    if-nez v10, :cond_4

    if-eqz v16, :cond_4

    const-string v2, "1"

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 140
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4}, Lcom/android/browser/OmacpSettingReceiver;->setHomePage(Landroid/content/Context;Ljava/lang/String;)Z

    .line 141
    const/4 v10, 0x1

    .line 144
    :cond_4
    const-string v2, "browser/OmacpSettingReceiver"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "BOOKMARK_URI: "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    const-string v2, "browser/OmacpSettingReceiver"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "BOOKMARK_NAME: "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    const-string v2, "browser/OmacpSettingReceiver"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "STARTPAGE: "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 149
    .end local v4           #formattedUrl:Ljava/lang/String;
    .end local v5           #name:Ljava/lang/String;
    .end local v12           #item:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v16           #startPage:Ljava/lang/String;
    .end local v17           #url:Ljava/lang/String;
    :cond_5
    const/4 v14, 0x1

    goto/16 :goto_1
.end method

.method private setHomePage(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 4
    .parameter "context"
    .parameter "url"

    .prologue
    .line 154
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-gtz v2, :cond_1

    .line 155
    :cond_0
    const/4 v2, 0x0

    .line 164
    :goto_0
    return v2

    .line 157
    :cond_1
    const-string v2, "http:"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 158
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "http://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 160
    :cond_2
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 161
    .local v1, p:Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 162
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v2, "homepage"

    invoke-interface {v0, v2, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 163
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 164
    const/4 v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 8
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 85
    const-string v5, "browser/OmacpSettingReceiver"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "OmacpSettingReceiver action:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 88
    .local v0, cr:Landroid/content/ContentResolver;
    const-string v5, "com.mediatek.omacp.settings"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 89
    const/4 v4, 0x0

    .line 90
    .local v4, result:Z
    const-string v5, "NAME"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 91
    .local v3, folderName:Ljava/lang/String;
    if-nez v3, :cond_2

    .line 92
    const-wide/16 v5, 0x1

    invoke-direct {p0, p1, p2, v5, v6}, Lcom/android/browser/OmacpSettingReceiver;->setBookmarkAndHomePage(Landroid/content/Context;Landroid/content/Intent;J)Z

    move-result v4

    .line 99
    :goto_0
    invoke-direct {p0, p1, v4}, Lcom/android/browser/OmacpSettingReceiver;->sendSettingResult(Landroid/content/Context;Z)V

    .line 101
    .end local v3           #folderName:Ljava/lang/String;
    .end local v4           #result:Z
    :cond_0
    const-string v5, "com.mediatek.omacp.capability"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 103
    invoke-direct {p0, p1}, Lcom/android/browser/OmacpSettingReceiver;->sendCapabilityResult(Landroid/content/Context;)V

    .line 105
    :cond_1
    return-void

    .line 94
    .restart local v3       #folderName:Ljava/lang/String;
    .restart local v4       #result:Z
    :cond_2
    const-string v5, "browser/OmacpSettingReceiver"

    const-string v6, "folderName isn\'t null"

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    invoke-static {p1, v3}, Lcom/android/browser/AddBookmarkPage;->addFolderToRoot(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v1

    .line 96
    .local v1, folderId:J
    invoke-direct {p0, p1, p2, v1, v2}, Lcom/android/browser/OmacpSettingReceiver;->setBookmarkAndHomePage(Landroid/content/Context;Landroid/content/Intent;J)Z

    move-result v4

    goto :goto_0
.end method
