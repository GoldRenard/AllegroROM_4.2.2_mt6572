.class Lcom/cyanogenmod/trebuchet/Workspace$2;
.super Ljava/lang/Thread;
.source "Workspace.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Workspace;->setWallpaperDimension()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Workspace;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Workspace;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    .line 1044
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Workspace$2;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1046
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$2;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperManager:Landroid/app/WallpaperManager;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Workspace;->access$100(Lcom/cyanogenmod/trebuchet/Workspace;)Landroid/app/WallpaperManager;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace$2;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    iget v1, v1, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperWidth:I

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace$2;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    iget v2, v2, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperHeight:I

    invoke-virtual {v0, v1, v2}, Landroid/app/WallpaperManager;->suggestDesiredDimensions(II)V

    .line 1047
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$2;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    new-instance v1, Lcom/cyanogenmod/trebuchet/Workspace$2$1;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/Workspace$2$1;-><init>(Lcom/cyanogenmod/trebuchet/Workspace$2;)V

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->post(Ljava/lang/Runnable;)Z

    .line 1052
    return-void
.end method
