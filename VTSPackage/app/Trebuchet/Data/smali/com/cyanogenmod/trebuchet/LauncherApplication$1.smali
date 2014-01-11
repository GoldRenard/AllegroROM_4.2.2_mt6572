.class Lcom/cyanogenmod/trebuchet/LauncherApplication$1;
.super Landroid/database/ContentObserver;
.source "LauncherApplication.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/LauncherApplication;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/LauncherApplication;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/LauncherApplication;Landroid/os/Handler;)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    .line 94
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication$1;->this$0:Lcom/cyanogenmod/trebuchet/LauncherApplication;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 3
    .parameter "selfChange"

    .prologue
    .line 99
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication$1;->this$0:Lcom/cyanogenmod/trebuchet/LauncherApplication;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/LauncherModel;->resetLoadedState(ZZ)V

    .line 100
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication$1;->this$0:Lcom/cyanogenmod/trebuchet/LauncherApplication;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->startLoaderFromBackground()V

    .line 101
    return-void
.end method
