.class Lcom/mediatek/thememanager/ThemeManager$SetThemeTask;
.super Landroid/os/AsyncTask;
.source "ThemeManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/thememanager/ThemeManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetThemeTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Integer;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field final synthetic this$0:Lcom/mediatek/thememanager/ThemeManager;


# direct methods
.method public constructor <init>(Lcom/mediatek/thememanager/ThemeManager;Landroid/content/Context;)V
    .locals 0
    .parameter
    .parameter "context"

    .prologue
    .line 257
    iput-object p1, p0, Lcom/mediatek/thememanager/ThemeManager$SetThemeTask;->this$0:Lcom/mediatek/thememanager/ThemeManager;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 258
    iput-object p2, p0, Lcom/mediatek/thememanager/ThemeManager$SetThemeTask;->mContext:Landroid/content/Context;

    .line 259
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 256
    check-cast p1, [Ljava/lang/Integer;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/mediatek/thememanager/ThemeManager$SetThemeTask;->doInBackground([Ljava/lang/Integer;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Integer;)Ljava/lang/Void;
    .locals 8
    .parameter "types"

    .prologue
    .line 263
    const/4 v4, 0x0

    aget-object v4, p1, v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 264
    .local v3, position:I
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v0

    .line 269
    .local v0, am:Landroid/app/IActivityManager;
    :try_start_0
    iget-object v4, p0, Lcom/mediatek/thememanager/ThemeManager$SetThemeTask;->this$0:Lcom/mediatek/thememanager/ThemeManager;

    #getter for: Lcom/mediatek/thememanager/ThemeManager;->mLock:Ljava/lang/Object;
    invoke-static {v4}, Lcom/mediatek/thememanager/ThemeManager;->access$000(Lcom/mediatek/thememanager/ThemeManager;)Ljava/lang/Object;

    move-result-object v5

    monitor-enter v5
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 270
    :try_start_1
    iget-object v4, p0, Lcom/mediatek/thememanager/ThemeManager$SetThemeTask;->this$0:Lcom/mediatek/thememanager/ThemeManager;

    #getter for: Lcom/mediatek/thememanager/ThemeManager;->mThemeDatas:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/mediatek/thememanager/ThemeManager;->access$100(Lcom/mediatek/thememanager/ThemeManager;)Ljava/util/ArrayList;

    move-result-object v4

    if-nez v4, :cond_0

    .line 271
    const-string v4, "ThemeManager"

    const-string v6, "doInBackground error occured, mThemeDatas becomes null."

    invoke-static {v4, v6}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    :cond_0
    invoke-interface {v0}, Landroid/app/IActivityManager;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    .line 274
    .local v1, config:Landroid/content/res/Configuration;
    iget-object v4, p0, Lcom/mediatek/thememanager/ThemeManager$SetThemeTask;->this$0:Lcom/mediatek/thememanager/ThemeManager;

    #getter for: Lcom/mediatek/thememanager/ThemeManager;->mThemeDatas:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/mediatek/thememanager/ThemeManager;->access$100(Lcom/mediatek/thememanager/ThemeManager;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mediatek/thememanager/ThemeData;

    invoke-virtual {v4}, Lcom/mediatek/thememanager/ThemeData;->getThemePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Landroid/content/res/Configuration;->skin:Ljava/lang/String;

    .line 276
    const-string v4, "ThemeManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "doInBackground() am.updateConfiguration() config.skin = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v1, Landroid/content/res/Configuration;->skin:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    invoke-interface {v0, v1}, Landroid/app/IActivityManager;->updateConfiguration(Landroid/content/res/Configuration;)V

    .line 279
    monitor-exit v5

    .line 284
    .end local v1           #config:Landroid/content/res/Configuration;
    :goto_0
    const/4 v4, 0x0

    return-object v4

    .line 279
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v4
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0

    .line 280
    :catch_0
    move-exception v2

    .line 281
    .local v2, e:Landroid/os/RemoteException;
    const-string v4, "ThemeManager"

    const-string v5, "Update configuration for theme changed failed."

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 282
    invoke-virtual {v2}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 256
    check-cast p1, Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/mediatek/thememanager/ThemeManager$SetThemeTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 2
    .parameter "unused"

    .prologue
    .line 294
    iget-object v0, p0, Lcom/mediatek/thememanager/ThemeManager$SetThemeTask;->this$0:Lcom/mediatek/thememanager/ThemeManager;

    #getter for: Lcom/mediatek/thememanager/ThemeManager;->mStatusBarManager:Landroid/app/StatusBarManager;
    invoke-static {v0}, Lcom/mediatek/thememanager/ThemeManager;->access$300(Lcom/mediatek/thememanager/ThemeManager;)Landroid/app/StatusBarManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/StatusBarManager;->disable(I)V

    .line 295
    return-void
.end method

.method protected onPreExecute()V
    .locals 1

    .prologue
    .line 289
    iget-object v0, p0, Lcom/mediatek/thememanager/ThemeManager$SetThemeTask;->this$0:Lcom/mediatek/thememanager/ThemeManager;

    #calls: Lcom/mediatek/thememanager/ThemeManager;->showSetThemeDialog()V
    invoke-static {v0}, Lcom/mediatek/thememanager/ThemeManager;->access$200(Lcom/mediatek/thememanager/ThemeManager;)V

    .line 290
    return-void
.end method
