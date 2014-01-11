.class Lcom/cyanogenmod/trebuchet/DeleteDropTarget$1;
.super Ljava/lang/Object;
.source "DeleteDropTarget.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/DeleteDropTarget;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;)V
    .locals 0
    .parameter

    .prologue
    .line 71
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$1;->this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$1;->this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->performHapticFeedback(I)Z

    .line 74
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$1;->this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

    #calls: Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->switchToUninstallTarget()V
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->access$000(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;)V

    .line 75
    return-void
.end method
