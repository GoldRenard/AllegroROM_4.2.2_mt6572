.class Lcom/cyanogenmod/trebuchet/Launcher$9;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->onWindowVisibilityChanged(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;

.field final synthetic val$observer:Landroid/view/ViewTreeObserver;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/ViewTreeObserver;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1432
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$9;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Launcher$9;->val$observer:Landroid/view/ViewTreeObserver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 4

    .prologue
    .line 1439
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$9;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$100(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$9;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mBuildLayersRunnable:Ljava/lang/Runnable;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->access$1500(Lcom/cyanogenmod/trebuchet/Launcher;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1441
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$9;->val$observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 1442
    const/4 v0, 0x1

    return v0
.end method
