.class public Lcom/mediatek/thememanager/ThemeManager;
.super Lcom/android/settings/SettingsPreferenceFragment;
.source "ThemeManager.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Lcom/android/settings/DialogCreatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/thememanager/ThemeManager$ViewHolder;,
        Lcom/mediatek/thememanager/ThemeManager$ThemeAdapter;,
        Lcom/mediatek/thememanager/ThemeManager$SetThemeTask;
    }
.end annotation


# static fields
.field static final DEFAULT_THEME_PACKAGE_NAME:Ljava/lang/String; = "android"

.field private static final TAG:Ljava/lang/String; = "ThemeManager"


# instance fields
.field private mCurrentPosition:I

.field private mInflater:Landroid/view/LayoutInflater;

.field private mLock:Ljava/lang/Object;

.field private mProgressDialog:Landroid/app/ProgressDialog;

.field private mStatusBarManager:Landroid/app/StatusBarManager;

.field private mThemeCount:I

.field private mThemeDatas:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mediatek/thememanager/ThemeData;",
            ">;"
        }
    .end annotation
.end field

.field private mThemeList:Landroid/widget/ListView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/android/settings/SettingsPreferenceFragment;-><init>()V

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mThemeDatas:Ljava/util/ArrayList;

    .line 65
    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mLock:Ljava/lang/Object;

    .line 356
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/thememanager/ThemeManager;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mediatek/thememanager/ThemeManager;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mThemeDatas:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mediatek/thememanager/ThemeManager;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/mediatek/thememanager/ThemeManager;->showSetThemeDialog()V

    return-void
.end method

.method static synthetic access$300(Lcom/mediatek/thememanager/ThemeManager;)Landroid/app/StatusBarManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mStatusBarManager:Landroid/app/StatusBarManager;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mediatek/thememanager/ThemeManager;)Landroid/view/LayoutInflater;
    .locals 1
    .parameter "x0"

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mInflater:Landroid/view/LayoutInflater;

    return-object v0
.end method

.method private finishSetThemeDialog()V
    .locals 2

    .prologue
    .line 178
    const-string v0, "ThemeManager"

    const-string v1, "finishSetThemeDialog()"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    iget-object v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 180
    iget-object v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 181
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 183
    :cond_0
    return-void
.end method

.method private static getPackageNameLastPart(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "packageName"

    .prologue
    .line 221
    const/16 v2, 0x2e

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 222
    .local v0, index:I
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 223
    .local v1, last:Ljava/lang/String;
    return-object v1
.end method

.method static getThemeName(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;
    .locals 9
    .parameter "context"
    .parameter "packageName"
    .parameter "resId"

    .prologue
    .line 204
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 205
    .local v1, pm:Landroid/content/pm/PackageManager;
    const/4 v3, 0x0

    .line 208
    .local v3, themeName:Ljava/lang/String;
    :try_start_0
    invoke-virtual {v1, p1}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v2

    .line 209
    .local v2, r:Landroid/content/res/Resources;
    invoke-virtual {v2, p2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 210
    const-string v4, "ThemeManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "get theme name "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " from id "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {p2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 217
    .end local v2           #r:Landroid/content/res/Resources;
    :goto_0
    return-object v3

    .line 211
    :catch_0
    move-exception v0

    .line 212
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v4, "TAG"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "PackageManager cann\'t find resources for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 213
    .end local v0           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_1
    move-exception v0

    .line 214
    .local v0, e:Landroid/content/res/Resources$NotFoundException;
    const-string v4, "TAG"

    const-string v5, "Cann\'t find string in theme package, use default name."

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0b00c4

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {p1}, Lcom/mediatek/thememanager/ThemeManager;->getPackageNameLastPart(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v4, v5, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public static getThemeSummary(Landroid/content/Context;)Ljava/lang/String;
    .locals 11
    .parameter "context"

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 230
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v6, v0, Landroid/content/res/Configuration;->skin:Ljava/lang/String;

    .line 231
    .local v6, curThemePath:Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/mediatek/thememanager/Themes;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "package_name"

    aput-object v3, v2, v5

    const-string v3, "theme_name_id"

    aput-object v3, v2, v4

    const-string v3, "theme_path=?"

    new-array v4, v4, [Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 234
    .local v7, cursor:Landroid/database/Cursor;
    const/4 v8, 0x0

    .line 235
    .local v8, packageName:Ljava/lang/String;
    const/4 v10, 0x0

    .line 237
    .local v10, themeSummary:Ljava/lang/String;
    if-eqz v7, :cond_1

    .line 239
    :try_start_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 240
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 241
    const/4 v0, 0x1

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    .line 242
    .local v9, themeNameId:I
    const-string v0, "android"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 243
    const v0, 0x7f0b00c3

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v10

    .line 249
    .end local v9           #themeNameId:I
    :cond_0
    :goto_0
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 253
    :cond_1
    return-object v10

    .line 245
    .restart local v9       #themeNameId:I
    :cond_2
    :try_start_1
    invoke-static {p0, v8, v9}, Lcom/mediatek/thememanager/ThemeManager;->getThemeName(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v10

    goto :goto_0

    .line 249
    .end local v9           #themeNameId:I
    :catchall_0
    move-exception v0

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method private loadThemesFromDatabase()V
    .locals 17

    .prologue
    .line 102
    const/4 v11, 0x0

    .line 103
    .local v11, position:I
    const/4 v7, 0x0

    .line 105
    .local v7, columnIndex:I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/thememanager/ThemeManager;->mThemeDatas:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    .line 106
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/thememanager/ThemeManager;->mThemeDatas:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 109
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/thememanager/ThemeManager;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v8

    .line 110
    .local v8, config:Landroid/content/res/Configuration;
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/thememanager/ThemeManager;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/mediatek/thememanager/Themes;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 112
    .local v9, cursor:Landroid/database/Cursor;
    if-nez v9, :cond_1

    .line 113
    const-string v1, "ThemeManager"

    const-string v2, "There is no theme in database."

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    :goto_0
    return-void

    .line 118
    :cond_1
    const/4 v10, 0x0

    .line 119
    .local v10, packageName:Ljava/lang/String;
    const/16 v16, 0x0

    .line 120
    .local v16, themePath:Ljava/lang/String;
    const/4 v15, 0x0

    .line 121
    .local v15, themeNameId:I
    const/4 v14, 0x0

    .line 122
    .local v14, themeName:Ljava/lang/String;
    :try_start_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move v12, v11

    .end local v11           #position:I
    .local v12, position:I
    :goto_1
    :try_start_1
    invoke-interface {v9}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_5

    .line 123
    const-string v1, "package_name"

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    .line 124
    invoke-interface {v9, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 126
    const-string v1, "theme_path"

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    .line 127
    invoke-interface {v9, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 129
    const-string v1, "theme_name_id"

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    .line 130
    invoke-interface {v9, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    .line 132
    if-eqz v8, :cond_2

    iget-object v1, v8, Landroid/content/res/Configuration;->skin:Ljava/lang/String;

    move-object/from16 v0, v16

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 133
    move-object/from16 v0, p0

    iput v12, v0, Lcom/mediatek/thememanager/ThemeManager;->mCurrentPosition:I

    .line 136
    :cond_2
    const-string v1, "android"

    invoke-virtual {v10, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 137
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/thememanager/ThemeManager;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0b00c3

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 143
    :goto_2
    if-eqz v14, :cond_4

    .line 144
    new-instance v13, Lcom/mediatek/thememanager/ThemeData;

    invoke-direct {v13}, Lcom/mediatek/thememanager/ThemeData;-><init>()V

    .line 145
    .local v13, themeData:Lcom/mediatek/thememanager/ThemeData;
    invoke-virtual {v13, v10}, Lcom/mediatek/thememanager/ThemeData;->setPackageName(Ljava/lang/String;)V

    .line 146
    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Lcom/mediatek/thememanager/ThemeData;->setThemePath(Ljava/lang/String;)V

    .line 147
    invoke-virtual {v13, v14}, Lcom/mediatek/thememanager/ThemeData;->setThemeName(Ljava/lang/String;)V

    .line 148
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/thememanager/ThemeManager;->mThemeDatas:Ljava/util/ArrayList;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    add-int/lit8 v11, v12, 0x1

    .end local v12           #position:I
    .restart local v11       #position:I
    :try_start_2
    invoke-virtual {v1, v12, v13}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 150
    const-string v1, "ThemeManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "position = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ThemePath = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ThemeNameId = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    .end local v13           #themeData:Lcom/mediatek/thememanager/ThemeData;
    :goto_3
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move v12, v11

    .end local v11           #position:I
    .restart local v12       #position:I
    goto/16 :goto_1

    .line 139
    :cond_3
    :try_start_3
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/thememanager/ThemeManager;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, v10, v15}, Lcom/mediatek/thememanager/ThemeManager;->getThemeName(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v14

    goto :goto_2

    .line 153
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/thememanager/ThemeManager;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/mediatek/thememanager/Themes;->CONTENT_URI:Landroid/net/Uri;

    const-string v3, "package_name = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v10, v4, v5

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 156
    const-string v1, "ThemeManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "delete record whose package name is = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v11, v12

    .end local v12           #position:I
    .restart local v11       #position:I
    goto :goto_3

    .line 160
    .end local v11           #position:I
    .restart local v12       #position:I
    :cond_5
    move-object/from16 v0, p0

    iput v12, v0, Lcom/mediatek/thememanager/ThemeManager;->mThemeCount:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 162
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    move v11, v12

    .line 165
    .end local v12           #position:I
    .restart local v11       #position:I
    goto/16 :goto_0

    .line 162
    :catchall_0
    move-exception v1

    :goto_4
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    throw v1

    .end local v11           #position:I
    .restart local v12       #position:I
    :catchall_1
    move-exception v1

    move v11, v12

    .end local v12           #position:I
    .restart local v11       #position:I
    goto :goto_4
.end method

.method private showSetThemeDialog()V
    .locals 5

    .prologue
    .line 168
    const-string v0, "ThemeManager"

    const-string v1, "showSetThemeDialog()"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    iget-object v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mProgressDialog:Landroid/app/ProgressDialog;

    if-nez v0, :cond_0

    .line 170
    invoke-virtual {p0}, Lcom/mediatek/thememanager/ThemeManager;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    const v2, 0x7f0b00c5

    invoke-virtual {p0, v2}, Lcom/mediatek/thememanager/ThemeManager;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v0, v1, v2, v3, v4}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 175
    :goto_0
    return-void

    .line 173
    :cond_0
    const-string v0, "ThemeManager"

    const-string v1, "showSetThemeDialog mProgressDialog != null."

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 71
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 72
    const-string v0, "ThemeManager"

    const-string v1, "onCreate"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    invoke-virtual {p0}, Lcom/mediatek/thememanager/ThemeManager;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "layout_inflater"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mInflater:Landroid/view/LayoutInflater;

    .line 75
    const-string v0, "statusbar"

    invoke-virtual {p0, v0}, Lcom/mediatek/thememanager/ThemeManager;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/StatusBarManager;

    iput-object v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mStatusBarManager:Landroid/app/StatusBarManager;

    .line 76
    invoke-direct {p0}, Lcom/mediatek/thememanager/ThemeManager;->loadThemesFromDatabase()V

    .line 77
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 187
    const-string v0, "ThemeManager"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    invoke-direct {p0}, Lcom/mediatek/thememanager/ThemeManager;->finishSetThemeDialog()V

    .line 189
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onDestroy()V

    .line 190
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const/4 v3, 0x0

    .line 89
    iget-object v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mStatusBarManager:Landroid/app/StatusBarManager;

    const/high16 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/StatusBarManager;->disable(I)V

    .line 90
    iget v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mCurrentPosition:I

    if-eq v0, p3, :cond_0

    .line 91
    new-instance v0, Lcom/mediatek/thememanager/ThemeManager$SetThemeTask;

    invoke-virtual {p0}, Lcom/mediatek/thememanager/ThemeManager;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/mediatek/thememanager/ThemeManager$SetThemeTask;-><init>(Lcom/mediatek/thememanager/ThemeManager;Landroid/content/Context;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Integer;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/mediatek/thememanager/ThemeManager$SetThemeTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 92
    iput p3, p0, Lcom/mediatek/thememanager/ThemeManager;->mCurrentPosition:I

    .line 96
    :goto_0
    return-void

    .line 94
    :cond_0
    iget-object v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mStatusBarManager:Landroid/app/StatusBarManager;

    invoke-virtual {v0, v3}, Landroid/app/StatusBarManager;->disable(I)V

    goto :goto_0
.end method

.method public onStart()V
    .locals 4

    .prologue
    .line 81
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onStart()V

    .line 82
    invoke-virtual {p0}, Lcom/mediatek/thememanager/ThemeManager;->getListView()Landroid/widget/ListView;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mThemeList:Landroid/widget/ListView;

    .line 83
    iget-object v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mThemeList:Landroid/widget/ListView;

    new-instance v1, Lcom/mediatek/thememanager/ThemeManager$ThemeAdapter;

    invoke-virtual {p0}, Lcom/mediatek/thememanager/ThemeManager;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/thememanager/ThemeManager;->mThemeDatas:Ljava/util/ArrayList;

    invoke-direct {v1, p0, v2, v3}, Lcom/mediatek/thememanager/ThemeManager$ThemeAdapter;-><init>(Lcom/mediatek/thememanager/ThemeManager;Landroid/content/Context;Ljava/util/ArrayList;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 84
    iget-object v0, p0, Lcom/mediatek/thememanager/ThemeManager;->mThemeList:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 85
    return-void
.end method
