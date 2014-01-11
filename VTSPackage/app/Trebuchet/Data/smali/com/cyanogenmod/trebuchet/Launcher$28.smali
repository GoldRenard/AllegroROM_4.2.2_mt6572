.class Lcom/cyanogenmod/trebuchet/Launcher$28;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->bindAllApplications(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;

.field final synthetic val$apps:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;Ljava/util/ArrayList;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 3867
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$28;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Launcher$28;->val$apps:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 3869
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$28;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2200(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 3870
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$28;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2200(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$28;->val$apps:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->setApps(Ljava/util/ArrayList;)V

    .line 3872
    :cond_0
    return-void
.end method
