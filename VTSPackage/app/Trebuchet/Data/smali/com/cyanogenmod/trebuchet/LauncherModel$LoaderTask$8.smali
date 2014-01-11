.class Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$8;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->bindWorkspace(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

.field final synthetic val$currentScreen:I

.field final synthetic val$oldCallbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;I)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1866
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$8;->this$1:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$8;->val$oldCallbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;

    iput p3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$8;->val$currentScreen:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1868
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$8;->this$1:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$8;->val$oldCallbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->tryGetCallbacks(Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;)Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;

    move-result-object v0

    .line 1869
    .local v0, callbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
    if-eqz v0, :cond_0

    .line 1870
    iget v1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$8;->val$currentScreen:I

    invoke-interface {v0, v1}, Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;->onPageBoundSynchronously(I)V

    .line 1872
    :cond_0
    return-void
.end method
