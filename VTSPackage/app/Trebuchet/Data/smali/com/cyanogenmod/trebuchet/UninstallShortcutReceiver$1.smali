.class final Lcom/cyanogenmod/trebuchet/UninstallShortcutReceiver$1;
.super Ljava/lang/Thread;
.source "UninstallShortcutReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/UninstallShortcutReceiver;->removeShortcut(Landroid/content/Context;Landroid/content/Intent;Landroid/content/SharedPreferences;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$savedNewApps:Ljava/util/Set;

.field final synthetic val$sharedPrefs:Landroid/content/SharedPreferences;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/util/Set;Landroid/content/SharedPreferences;)V
    .locals 0
    .parameter "x0"
    .parameter
    .parameter

    .prologue
    .line 149
    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/UninstallShortcutReceiver$1;->val$savedNewApps:Ljava/util/Set;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/UninstallShortcutReceiver$1;->val$sharedPrefs:Landroid/content/SharedPreferences;

    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 151
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/UninstallShortcutReceiver$1;->val$savedNewApps:Ljava/util/Set;

    monitor-enter v2

    .line 152
    :try_start_0
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/UninstallShortcutReceiver$1;->val$sharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 153
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v1, "apps.new.list"

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/UninstallShortcutReceiver$1;->val$savedNewApps:Ljava/util/Set;

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    .line 155
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/UninstallShortcutReceiver$1;->val$savedNewApps:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 157
    const-string v1, "apps.new.page"

    const/4 v3, -0x1

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 159
    :cond_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 160
    monitor-exit v2

    .line 161
    return-void

    .line 160
    .end local v0           #editor:Landroid/content/SharedPreferences$Editor;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
