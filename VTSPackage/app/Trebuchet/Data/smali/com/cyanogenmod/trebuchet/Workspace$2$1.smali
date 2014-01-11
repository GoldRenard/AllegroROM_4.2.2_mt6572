.class Lcom/cyanogenmod/trebuchet/Workspace$2$1;
.super Ljava/lang/Object;
.source "Workspace.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Workspace$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cyanogenmod/trebuchet/Workspace$2;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Workspace$2;)V
    .locals 0
    .parameter

    .prologue
    .line 1047
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Workspace$2$1;->this$1:Lcom/cyanogenmod/trebuchet/Workspace$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1049
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$2$1;->this$1:Lcom/cyanogenmod/trebuchet/Workspace$2;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace$2;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Workspace;->checkWallpaper()V

    .line 1050
    return-void
.end method
