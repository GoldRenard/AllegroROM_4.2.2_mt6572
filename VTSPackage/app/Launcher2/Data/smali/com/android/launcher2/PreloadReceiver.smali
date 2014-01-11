.class public Lcom/android/launcher2/PreloadReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PreloadReceiver.java"


# static fields
.field public static final EXTRA_WORKSPACE_NAME:Ljava/lang/String; = "com.android.launcher.action.EXTRA_WORKSPACE_NAME"

.field private static final LOGD:Z = false

.field private static final TAG:Ljava/lang/String; = "Launcher.PreloadReceiver"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 34
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/LauncherApplication;

    .line 35
    .local v0, app:Lcom/android/launcher2/LauncherApplication;
    invoke-virtual {v0}, Lcom/android/launcher2/LauncherApplication;->getLauncherProvider()Lcom/android/launcher2/LauncherProvider;

    move-result-object v2

    .line 36
    .local v2, provider:Lcom/android/launcher2/LauncherProvider;
    if-eqz v2, :cond_0

    .line 37
    const-string v4, "com.android.launcher.action.EXTRA_WORKSPACE_NAME"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 38
    .local v1, name:Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const-string v5, "xml"

    const-string v6, "com.android.launcher"

    invoke-virtual {v4, v1, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 43
    .local v3, workspaceResId:I
    :goto_0
    new-instance v4, Ljava/lang/Thread;

    new-instance v5, Lcom/android/launcher2/PreloadReceiver$1;

    invoke-direct {v5, p0, v2, v3}, Lcom/android/launcher2/PreloadReceiver$1;-><init>(Lcom/android/launcher2/PreloadReceiver;Lcom/android/launcher2/LauncherProvider;I)V

    invoke-direct {v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v4}, Ljava/lang/Thread;->start()V

    .line 50
    .end local v1           #name:Ljava/lang/String;
    .end local v3           #workspaceResId:I
    :cond_0
    return-void

    .line 38
    .restart local v1       #name:Ljava/lang/String;
    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method
