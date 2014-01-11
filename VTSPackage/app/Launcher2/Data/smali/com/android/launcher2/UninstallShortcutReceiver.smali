.class public Lcom/android/launcher2/UninstallShortcutReceiver;
.super Landroid/content/BroadcastReceiver;
.source "UninstallShortcutReceiver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/UninstallShortcutReceiver$PendingUninstallShortcutInfo;
    }
.end annotation


# static fields
.field private static final ACTION_UNINSTALL_SHORTCUT:Ljava/lang/String; = "com.android.launcher.action.UNINSTALL_SHORTCUT"

.field private static final TAG:Ljava/lang/String; = "UninstallShortcutReceiver"

.field private static mUninstallQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/UninstallShortcutReceiver$PendingUninstallShortcutInfo;",
            ">;"
        }
    .end annotation
.end field

.field private static mUseUninstallQueue:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/launcher2/UninstallShortcutReceiver;->mUninstallQueue:Ljava/util/ArrayList;

    .line 47
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/launcher2/UninstallShortcutReceiver;->mUseUninstallQueue:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 49
    return-void
.end method

.method static disableAndFlushUninstallQueue(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 80
    const/4 v1, 0x0

    sput-boolean v1, Lcom/android/launcher2/UninstallShortcutReceiver;->mUseUninstallQueue:Z

    .line 81
    sget-object v1, Lcom/android/launcher2/UninstallShortcutReceiver;->mUninstallQueue:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 82
    .local v0, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/launcher2/UninstallShortcutReceiver$PendingUninstallShortcutInfo;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 83
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/UninstallShortcutReceiver$PendingUninstallShortcutInfo;

    invoke-static {p0, v1}, Lcom/android/launcher2/UninstallShortcutReceiver;->processUninstallShortcut(Landroid/content/Context;Lcom/android/launcher2/UninstallShortcutReceiver$PendingUninstallShortcutInfo;)V

    .line 84
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 86
    :cond_0
    return-void
.end method

.method static enableUninstallQueue()V
    .locals 1

    .prologue
    .line 76
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/launcher2/UninstallShortcutReceiver;->mUseUninstallQueue:Z

    .line 77
    return-void
.end method

.method private static processUninstallShortcut(Landroid/content/Context;Lcom/android/launcher2/UninstallShortcutReceiver$PendingUninstallShortcutInfo;)V
    .locals 7
    .parameter "context"
    .parameter "pendingInfo"

    .prologue
    .line 90
    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->getSharedPreferencesKey()Ljava/lang/String;

    move-result-object v3

    .line 91
    .local v3, spKey:Ljava/lang/String;
    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 93
    .local v2, sharedPrefs:Landroid/content/SharedPreferences;
    iget-object v1, p1, Lcom/android/launcher2/UninstallShortcutReceiver$PendingUninstallShortcutInfo;->data:Landroid/content/Intent;

    .line 95
    .local v1, data:Landroid/content/Intent;
    const-string v4, "UninstallShortcutReceiver"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "processUninstallShortcut pendingInfo = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", data = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/LauncherApplication;

    .line 100
    .local v0, app:Lcom/android/launcher2/LauncherApplication;
    monitor-enter v0

    .line 101
    :try_start_0
    invoke-static {p0, v1, v2}, Lcom/android/launcher2/UninstallShortcutReceiver;->removeShortcut(Landroid/content/Context;Landroid/content/Intent;Landroid/content/SharedPreferences;)V

    .line 102
    monitor-exit v0

    .line 103
    return-void

    .line 102
    :catchall_0
    move-exception v4

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method private static removeShortcut(Landroid/content/Context;Landroid/content/Intent;Landroid/content/SharedPreferences;)V
    .locals 22
    .parameter "context"
    .parameter "data"
    .parameter "sharedPrefs"

    .prologue
    .line 107
    const-string v3, "android.intent.extra.shortcut.INTENT"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v16

    check-cast v16, Landroid/content/Intent;

    .line 108
    .local v16, intent:Landroid/content/Intent;
    const-string v3, "android.intent.extra.shortcut.NAME"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 109
    .local v18, name:Ljava/lang/String;
    const-string v3, "duplicate"

    const/4 v4, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v11

    .line 111
    .local v11, duplicate:Z
    const-string v3, "UninstallShortcutReceiver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onReceive: data = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", intent = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", name = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", duplicate = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    if-eqz v16, :cond_4

    if-eqz v18, :cond_4

    .line 116
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 117
    .local v2, cr:Landroid/content/ContentResolver;
    sget-object v3, Lcom/android/launcher2/LauncherSettings$Favorites;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "_id"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "intent"

    aput-object v6, v4, v5

    const-string v5, "title=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v18, v6, v7

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 121
    .local v9, c:Landroid/database/Cursor;
    const-string v3, "intent"

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v17

    .line 122
    .local v17, intentIndex:I
    const-string v3, "_id"

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v15

    .line 124
    .local v15, idIndex:I
    const/4 v10, 0x0

    .line 127
    .local v10, changed:Z
    :cond_0
    :goto_0
    :try_start_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-eqz v3, :cond_1

    .line 129
    :try_start_1
    move/from16 v0, v17

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Landroid/content/Intent;->filterEquals(Landroid/content/Intent;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 130
    invoke-interface {v9, v15}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    .line 131
    .local v13, id:J
    const/4 v3, 0x0

    invoke-static {v13, v14, v3}, Lcom/android/launcher2/LauncherSettings$Favorites;->getContentUri(JZ)Landroid/net/Uri;

    move-result-object v21

    .line 132
    .local v21, uri:Landroid/net/Uri;
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, v21

    invoke-virtual {v2, v0, v3, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_0

    .line 133
    const/4 v10, 0x1

    .line 134
    if-nez v11, :cond_0

    .line 143
    .end local v13           #id:J
    .end local v21           #uri:Landroid/net/Uri;
    :cond_1
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 146
    if-eqz v10, :cond_2

    .line 147
    sget-object v3, Lcom/android/launcher2/LauncherSettings$Favorites;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 148
    const v3, 0x7f0d002a

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v18, v4, v5

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 154
    :cond_2
    new-instance v19, Ljava/util/HashSet;

    invoke-direct/range {v19 .. v19}, Ljava/util/HashSet;-><init>()V

    .line 155
    .local v19, newApps:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    const-string v3, "apps.new.list"

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v19

    .line 156
    monitor-enter v19

    .line 158
    :cond_3
    const/4 v3, 0x0

    :try_start_2
    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v8

    .line 159
    .local v8, appRemoved:Z
    if-nez v8, :cond_3

    .line 160
    monitor-exit v19
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 161
    if-eqz v8, :cond_4

    .line 162
    move-object/from16 v20, v19

    .line 163
    .local v20, savedNewApps:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v3, Lcom/android/launcher2/UninstallShortcutReceiver$1;

    const-string v4, "setNewAppsThread-remove"

    move-object/from16 v0, v20

    move-object/from16 v1, p2

    invoke-direct {v3, v4, v0, v1}, Lcom/android/launcher2/UninstallShortcutReceiver$1;-><init>(Ljava/lang/String;Ljava/util/Set;Landroid/content/SharedPreferences;)V

    invoke-virtual {v3}, Lcom/android/launcher2/UninstallShortcutReceiver$1;->start()V

    .line 179
    .end local v2           #cr:Landroid/content/ContentResolver;
    .end local v8           #appRemoved:Z
    .end local v9           #c:Landroid/database/Cursor;
    .end local v10           #changed:Z
    .end local v15           #idIndex:I
    .end local v17           #intentIndex:I
    .end local v19           #newApps:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    .end local v20           #savedNewApps:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    :cond_4
    return-void

    .line 138
    .restart local v2       #cr:Landroid/content/ContentResolver;
    .restart local v9       #c:Landroid/database/Cursor;
    .restart local v10       #changed:Z
    .restart local v15       #idIndex:I
    .restart local v17       #intentIndex:I
    :catch_0
    move-exception v12

    .line 139
    .local v12, e:Ljava/net/URISyntaxException;
    :try_start_3
    const-string v3, "UninstallShortcutReceiver"

    const-string v4, "URISyntaxException happened when removeShortcut."

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0

    .line 143
    .end local v12           #e:Ljava/net/URISyntaxException;
    :catchall_0
    move-exception v3

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    throw v3

    .line 160
    .restart local v19       #newApps:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    :catchall_1
    move-exception v3

    :try_start_4
    monitor-exit v19
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v3
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .parameter "context"
    .parameter "data"

    .prologue
    .line 58
    const-string v1, "com.android.launcher.action.UNINSTALL_SHORTCUT"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 59
    const-string v1, "UninstallShortcutReceiver"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Receive "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " in UninstallShortcutReceiver."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    :goto_0
    return-void

    .line 63
    :cond_0
    new-instance v0, Lcom/android/launcher2/UninstallShortcutReceiver$PendingUninstallShortcutInfo;

    invoke-direct {v0, p2}, Lcom/android/launcher2/UninstallShortcutReceiver$PendingUninstallShortcutInfo;-><init>(Landroid/content/Intent;)V

    .line 65
    .local v0, info:Lcom/android/launcher2/UninstallShortcutReceiver$PendingUninstallShortcutInfo;
    const-string v1, "UninstallShortcutReceiver"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onReceive data = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", info = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    sget-boolean v1, Lcom/android/launcher2/UninstallShortcutReceiver;->mUseUninstallQueue:Z

    if-eqz v1, :cond_1

    .line 69
    sget-object v1, Lcom/android/launcher2/UninstallShortcutReceiver;->mUninstallQueue:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 71
    :cond_1
    invoke-static {p1, v0}, Lcom/android/launcher2/UninstallShortcutReceiver;->processUninstallShortcut(Landroid/content/Context;Lcom/android/launcher2/UninstallShortcutReceiver$PendingUninstallShortcutInfo;)V

    goto :goto_0
.end method
