.class public Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver;
.super Landroid/content/BroadcastReceiver;
.source "InstallShortcutReceiver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;
    }
.end annotation


# static fields
.field public static final ACTION_INSTALL_SHORTCUT:Ljava/lang/String; = "com.android.launcher.action.INSTALL_SHORTCUT"

.field private static final INSTALL_SHORTCUT_IS_DUPLICATE:I = -0x1

.field private static final INSTALL_SHORTCUT_NO_SPACE:I = -0x2

.field private static final INSTALL_SHORTCUT_SUCCESSFUL:I = 0x0

.field public static final NEW_APPS_LIST_KEY:Ljava/lang/String; = "apps.new.list"

.field public static final NEW_APPS_PAGE_KEY:Ljava/lang/String; = "apps.new.page"

.field public static final NEW_SHORTCUT_BOUNCE_DURATION:I = 0x1c2

.field public static final NEW_SHORTCUT_STAGGER_DELAY:I = 0x4b

.field public static final SHORTCUT_MIMETYPE:Ljava/lang/String; = "com.cyanogenmod.trebuchet/shortcut"

.field private static mInstallQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;",
            ">;"
        }
    .end annotation
.end field

.field private static mUseInstallQueue:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver;->mInstallQueue:Ljava/util/ArrayList;

    .line 57
    const/4 v0, 0x0

    sput-boolean v0, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver;->mUseInstallQueue:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 59
    return-void
.end method

.method static disableAndFlushInstallQueue(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 109
    const/4 v0, 0x0

    sput-boolean v0, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver;->mUseInstallQueue:Z

    .line 110
    invoke-static {p0}, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver;->flushInstallQueue(Landroid/content/Context;)V

    .line 111
    return-void
.end method

.method static enableInstallQueue()V
    .locals 1

    .prologue
    .line 106
    const/4 v0, 0x1

    sput-boolean v0, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver;->mUseInstallQueue:Z

    .line 107
    return-void
.end method

.method private static findEmptyCell(Ljava/util/ArrayList;[II)Z
    .locals 17
    .parameter
    .parameter "xy"
    .parameter "screen"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ItemInfo;",
            ">;[II)Z"
        }
    .end annotation

    .prologue
    .line 229
    .local p0, items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountX()I

    move-result v4

    .line 230
    .local v4, xCount:I
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountY()I

    move-result v5

    .line 231
    .local v5, yCount:I
    filled-new-array {v4, v5}, [I

    move-result-object v1

    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [[Z

    .line 234
    .local v6, occupied:[[Z
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 235
    .local v10, item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    iget-wide v1, v10, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    const-wide/16 v15, -0x64

    cmp-long v1, v1, v15

    if-nez v1, :cond_0

    .line 236
    iget v1, v10, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    move/from16 v0, p2

    if-ne v1, v0, :cond_0

    .line 237
    iget v7, v10, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    .line 238
    .local v7, cellX:I
    iget v8, v10, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    .line 239
    .local v8, cellY:I
    iget v11, v10, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    .line 240
    .local v11, spanX:I
    iget v12, v10, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    .line 241
    .local v12, spanY:I
    move v13, v7

    .local v13, x:I
    :goto_0
    if-ltz v13, :cond_0

    add-int v1, v7, v11

    if-ge v13, v1, :cond_0

    if-ge v13, v4, :cond_0

    .line 242
    move v14, v8

    .local v14, y:I
    :goto_1
    if-ltz v14, :cond_1

    add-int v1, v8, v12

    if-ge v14, v1, :cond_1

    if-ge v14, v5, :cond_1

    .line 243
    aget-object v1, v6, v13

    const/4 v2, 0x1

    aput-boolean v2, v1, v14

    .line 242
    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    .line 241
    :cond_1
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 250
    .end local v7           #cellX:I
    .end local v8           #cellY:I
    .end local v10           #item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .end local v11           #spanX:I
    .end local v12           #spanY:I
    .end local v13           #x:I
    .end local v14           #y:I
    :cond_2
    const/4 v2, 0x1

    const/4 v3, 0x1

    move-object/from16 v1, p1

    invoke-static/range {v1 .. v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->findVacantCell([IIIII[[Z)Z

    move-result v1

    return v1
.end method

.method static flushInstallQueue(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 113
    sget-object v1, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver;->mInstallQueue:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 114
    .local v0, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 115
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;

    invoke-static {p0, v1}, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver;->processInstallShortcut(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;)V

    .line 116
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 118
    :cond_0
    return-void
.end method

.method private static installShortcut(Landroid/content/Context;Landroid/content/Intent;Ljava/util/ArrayList;Landroid/content/Intent;IZLandroid/content/SharedPreferences;[I)Z
    .locals 19
    .parameter "context"
    .parameter "data"
    .parameter
    .parameter "intent"
    .parameter "screen"
    .parameter "shortcutExists"
    .parameter "sharedPrefs"
    .parameter "result"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/content/Intent;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ItemInfo;",
            ">;",
            "Landroid/content/Intent;",
            "IZ",
            "Landroid/content/SharedPreferences;",
            "[I)Z"
        }
    .end annotation

    .prologue
    .line 168
    .local p2, items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    const/4 v3, 0x2

    new-array v0, v3, [I

    move-object/from16 v18, v0

    .line 169
    .local v18, tmpCoordinates:[I
    move-object/from16 v0, p2

    move-object/from16 v1, v18

    move/from16 v2, p4

    invoke-static {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver;->findEmptyCell(Ljava/util/ArrayList;[II)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 170
    if-eqz p3, :cond_7

    .line 171
    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_3

    .line 172
    const-string v3, "android.intent.action.VIEW"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 182
    :cond_0
    :goto_0
    const-string v3, "duplicate"

    const/4 v4, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v13

    .line 183
    .local v13, duplicate:Z
    if-nez v13, :cond_1

    if-nez p5, :cond_4

    .line 186
    :cond_1
    const-string v3, "apps.new.page"

    move-object/from16 v0, p6

    move/from16 v1, p4

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v16

    .line 187
    .local v16, newAppsScreen:I
    new-instance v15, Ljava/util/HashSet;

    invoke-direct {v15}, Ljava/util/HashSet;-><init>()V

    .line 188
    .local v15, newApps:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    move/from16 v0, v16

    move/from16 v1, p4

    if-ne v0, v1, :cond_2

    .line 189
    const-string v3, "apps.new.list"

    move-object/from16 v0, p6

    invoke-interface {v0, v3, v15}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v15

    .line 191
    :cond_2
    monitor-enter v15

    .line 192
    const/4 v3, 0x0

    :try_start_0
    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v15, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 193
    monitor-exit v15
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 194
    move-object/from16 v17, v15

    .line 195
    .local v17, savedNewApps:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v3, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$1;

    const-string v4, "setNewAppsThread"

    move-object/from16 v0, v17

    move-object/from16 v1, p6

    move/from16 v2, p4

    invoke-direct {v3, v4, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$1;-><init>(Ljava/lang/String;Ljava/util/Set;Landroid/content/SharedPreferences;I)V

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$1;->start()V

    .line 207
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v12

    check-cast v12, Lcom/cyanogenmod/trebuchet/LauncherApplication;

    .line 208
    .local v12, app:Lcom/cyanogenmod/trebuchet/LauncherApplication;
    invoke-virtual {v12}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->getModel()Lcom/cyanogenmod/trebuchet/LauncherModel;

    move-result-object v3

    const-wide/16 v6, -0x64

    const/4 v4, 0x0

    aget v9, v18, v4

    const/4 v4, 0x1

    aget v10, v18, v4

    const/4 v11, 0x1

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move/from16 v8, p4

    invoke-virtual/range {v3 .. v11}, Lcom/cyanogenmod/trebuchet/LauncherModel;->addShortcut(Landroid/content/Context;Landroid/content/Intent;JIIIZ)Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    move-result-object v14

    .line 211
    .local v14, info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    if-nez v14, :cond_5

    .line 212
    const/4 v3, 0x0

    .line 224
    .end local v12           #app:Lcom/cyanogenmod/trebuchet/LauncherApplication;
    .end local v13           #duplicate:Z
    .end local v14           #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .end local v15           #newApps:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    .end local v16           #newAppsScreen:I
    .end local v17           #savedNewApps:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    :goto_1
    return v3

    .line 173
    :cond_3
    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    const-string v4, "android.intent.action.MAIN"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v3

    const-string v4, "android.intent.category.LAUNCHER"

    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 176
    const/high16 v3, 0x1020

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    goto/16 :goto_0

    .line 193
    .restart local v13       #duplicate:Z
    .restart local v15       #newApps:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v16       #newAppsScreen:I
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v15
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 215
    .end local v15           #newApps:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    .end local v16           #newAppsScreen:I
    :cond_4
    const/4 v3, 0x0

    const/4 v4, -0x1

    aput v4, p7, v3

    .line 218
    :cond_5
    const/4 v3, 0x1

    goto :goto_1

    .line 221
    .end local v13           #duplicate:Z
    :cond_6
    const/4 v3, 0x0

    const/4 v4, -0x2

    aput v4, p7, v3

    .line 224
    :cond_7
    const/4 v3, 0x0

    goto :goto_1
.end method

.method private static processInstallShortcut(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;)V
    .locals 20
    .parameter "context"
    .parameter "pendingInfo"

    .prologue
    .line 122
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->getSharedPreferencesKey()Ljava/lang/String;

    move-result-object v17

    .line 123
    .local v17, spKey:Ljava/lang/String;
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v8

    .line 125
    .local v8, sp:Landroid/content/SharedPreferences;
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;->data:Landroid/content/Intent;

    .line 126
    .local v3, data:Landroid/content/Intent;
    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;->launchIntent:Landroid/content/Intent;

    .line 127
    .local v5, intent:Landroid/content/Intent;
    move-object/from16 v0, p1

    iget-object v13, v0, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;->name:Ljava/lang/String;

    .line 130
    .local v13, name:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    check-cast v10, Lcom/cyanogenmod/trebuchet/LauncherApplication;

    .line 131
    .local v10, app:Lcom/cyanogenmod/trebuchet/LauncherApplication;
    const/4 v2, 0x1

    new-array v9, v2, [I

    const/4 v2, 0x0

    const/16 v18, 0x0

    aput v18, v9, v2

    .line 132
    .local v9, result:[I
    const/4 v11, 0x0

    .line 133
    .local v11, found:Z
    monitor-enter v10

    .line 134
    :try_start_0
    invoke-static/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getItemsInLocalCoordinates(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v4

    .line 135
    .local v4, items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    move-object/from16 v0, p0

    invoke-static {v0, v5}, Lcom/cyanogenmod/trebuchet/LauncherModel;->shortcutExists(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v7

    .line 139
    .local v7, exists:Z
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen;->getNumberHomescreens()I

    move-result v15

    .line 140
    .local v15, screenCount:I
    div-int/lit8 v2, v15, 0x2

    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen;->getDefaultHomescreen(I)I

    move-result v16

    .line 141
    .local v16, screenDefault:I
    move/from16 v0, v16

    if-lt v0, v15, :cond_1

    div-int/lit8 v14, v15, 0x2

    .line 143
    .local v14, screen:I
    :goto_0
    const/4 v12, 0x0

    .local v12, i:I
    :goto_1
    mul-int/lit8 v2, v15, 0x2

    add-int/lit8 v2, v2, 0x1

    if-gt v12, v2, :cond_3

    if-nez v11, :cond_3

    .line 144
    int-to-float v2, v12

    const/high16 v18, 0x4000

    div-float v2, v2, v18

    const/high16 v18, 0x3f00

    add-float v2, v2, v18

    float-to-int v0, v2

    move/from16 v18, v0

    rem-int/lit8 v2, v12, 0x2

    const/16 v19, 0x1

    move/from16 v0, v19

    if-ne v2, v0, :cond_2

    const/4 v2, 0x1

    :goto_2
    mul-int v2, v2, v18

    add-int v6, v14, v2

    .line 145
    .local v6, si:I
    if-ltz v6, :cond_0

    if-ge v6, v15, :cond_0

    move-object/from16 v2, p0

    .line 146
    invoke-static/range {v2 .. v9}, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver;->installShortcut(Landroid/content/Context;Landroid/content/Intent;Ljava/util/ArrayList;Landroid/content/Intent;IZLandroid/content/SharedPreferences;[I)Z

    move-result v11

    .line 143
    :cond_0
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .end local v6           #si:I
    .end local v12           #i:I
    .end local v14           #screen:I
    :cond_1
    move/from16 v14, v16

    .line 141
    goto :goto_0

    .line 144
    .restart local v12       #i:I
    .restart local v14       #screen:I
    :cond_2
    const/4 v2, -0x1

    goto :goto_2

    .line 150
    :cond_3
    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    if-nez v11, :cond_4

    .line 155
    const/4 v2, 0x0

    aget v2, v9, v2

    const/16 v18, -0x2

    move/from16 v0, v18

    if-ne v2, v0, :cond_5

    .line 156
    const v2, 0x7f090093

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 163
    :cond_4
    :goto_3
    return-void

    .line 150
    .end local v4           #items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    .end local v7           #exists:Z
    .end local v12           #i:I
    .end local v14           #screen:I
    .end local v15           #screenCount:I
    .end local v16           #screenDefault:I
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 158
    .restart local v4       #items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    .restart local v7       #exists:Z
    .restart local v12       #i:I
    .restart local v14       #screen:I
    .restart local v15       #screenCount:I
    .restart local v16       #screenDefault:I
    :cond_5
    const/4 v2, 0x0

    aget v2, v9, v2

    const/16 v18, -0x1

    move/from16 v0, v18

    if-ne v2, v0, :cond_4

    .line 159
    const v2, 0x7f090099

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v13, v18, v19

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_3
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 8
    .parameter "context"
    .parameter "data"

    .prologue
    const/4 v2, 0x0

    .line 73
    const-string v6, "com.android.launcher.action.INSTALL_SHORTCUT"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 103
    :cond_0
    :goto_0
    return-void

    .line 77
    :cond_1
    const-string v6, "android.intent.extra.shortcut.INTENT"

    invoke-virtual {p2, v6}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/content/Intent;

    .line 78
    .local v1, intent:Landroid/content/Intent;
    if-eqz v1, :cond_0

    .line 83
    const-string v6, "android.intent.extra.shortcut.NAME"

    invoke-virtual {p2, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 84
    .local v3, name:Ljava/lang/String;
    if-nez v3, :cond_2

    .line 86
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 87
    .local v5, pm:Landroid/content/pm/PackageManager;
    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v0

    .line 88
    .local v0, info:Landroid/content/pm/ActivityInfo;
    invoke-virtual {v0, v5}, Landroid/content/pm/ActivityInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 94
    .end local v0           #info:Landroid/content/pm/ActivityInfo;
    .end local v5           #pm:Landroid/content/pm/PackageManager;
    :cond_2
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountX()I

    move-result v6

    if-lez v6, :cond_3

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountY()I

    move-result v6

    if-gtz v6, :cond_4

    :cond_3
    const/4 v2, 0x1

    .line 97
    .local v2, launcherNotLoaded:Z
    :cond_4
    new-instance v0, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;

    invoke-direct {v0, p2, v3, v1}, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;-><init>(Landroid/content/Intent;Ljava/lang/String;Landroid/content/Intent;)V

    .line 98
    .local v0, info:Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;
    sget-boolean v6, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver;->mUseInstallQueue:Z

    if-nez v6, :cond_5

    if-eqz v2, :cond_6

    .line 99
    :cond_5
    sget-object v6, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver;->mInstallQueue:Ljava/util/ArrayList;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 89
    .end local v0           #info:Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;
    .end local v2           #launcherNotLoaded:Z
    :catch_0
    move-exception v4

    .line 90
    .local v4, nnfe:Landroid/content/pm/PackageManager$NameNotFoundException;
    goto :goto_0

    .line 101
    .end local v4           #nnfe:Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v0       #info:Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;
    .restart local v2       #launcherNotLoaded:Z
    :cond_6
    invoke-static {p1, v0}, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver;->processInstallShortcut(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;)V

    goto :goto_0
.end method
