.class Lcom/cyanogenmod/trebuchet/CheckLongPressHelper$CheckForLongPress;
.super Ljava/lang/Object;
.source "CheckLongPressHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CheckForLongPress"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;)V
    .locals 0
    .parameter

    .prologue
    .line 26
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper$CheckForLongPress;->this$0:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 28
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper$CheckForLongPress;->this$0:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    #getter for: Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mView:Landroid/view/View;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->access$000(Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper$CheckForLongPress;->this$0:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    #getter for: Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mView:Landroid/view/View;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->access$000(Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper$CheckForLongPress;->this$0:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    #getter for: Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mHasPerformedLongPress:Z
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->access$100(Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 30
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper$CheckForLongPress;->this$0:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    #getter for: Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mView:Landroid/view/View;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->access$000(Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->performLongClick()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 31
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper$CheckForLongPress;->this$0:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    #getter for: Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mView:Landroid/view/View;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->access$000(Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setPressed(Z)V

    .line 32
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper$CheckForLongPress;->this$0:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    const/4 v1, 0x1

    #setter for: Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mHasPerformedLongPress:Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->access$102(Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;Z)Z

    .line 35
    :cond_0
    return-void
.end method
