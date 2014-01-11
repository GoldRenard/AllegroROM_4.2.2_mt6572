.class Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$11;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->loadAllAppsByBatch()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

.field final synthetic val$added:Ljava/util/ArrayList;

.field final synthetic val$callbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;Ljava/util/ArrayList;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 2012
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$11;->this$1:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$11;->val$callbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$11;->val$added:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 2014
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 2015
    .local v0, t:J
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$11;->val$callbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;

    if-eqz v2, :cond_0

    .line 2016
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$11;->val$callbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$11;->val$added:Ljava/util/ArrayList;

    invoke-interface {v2, v3}, Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;->bindAllApplications(Ljava/util/ArrayList;)V

    .line 2024
    :goto_0
    return-void

    .line 2022
    :cond_0
    const-string v2, "Trebuchet.LauncherModel"

    const-string v3, "not binding apps: no Launcher activity"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
