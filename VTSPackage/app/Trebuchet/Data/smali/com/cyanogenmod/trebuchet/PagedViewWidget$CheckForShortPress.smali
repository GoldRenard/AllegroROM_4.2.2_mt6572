.class Lcom/cyanogenmod/trebuchet/PagedViewWidget$CheckForShortPress;
.super Ljava/lang/Object;
.source "PagedViewWidget.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/PagedViewWidget;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CheckForShortPress"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/PagedViewWidget;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/PagedViewWidget;)V
    .locals 0
    .parameter

    .prologue
    .line 165
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget$CheckForShortPress;->this$0:Lcom/cyanogenmod/trebuchet/PagedViewWidget;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 167
    sget-object v0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->sShortpressTarget:Lcom/cyanogenmod/trebuchet/PagedViewWidget;

    if-eqz v0, :cond_0

    .line 173
    :goto_0
    return-void

    .line 168
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget$CheckForShortPress;->this$0:Lcom/cyanogenmod/trebuchet/PagedViewWidget;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mShortPressListener:Lcom/cyanogenmod/trebuchet/PagedViewWidget$ShortPressListener;

    if-eqz v0, :cond_1

    .line 169
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget$CheckForShortPress;->this$0:Lcom/cyanogenmod/trebuchet/PagedViewWidget;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mShortPressListener:Lcom/cyanogenmod/trebuchet/PagedViewWidget$ShortPressListener;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget$CheckForShortPress;->this$0:Lcom/cyanogenmod/trebuchet/PagedViewWidget;

    invoke-interface {v0, v1}, Lcom/cyanogenmod/trebuchet/PagedViewWidget$ShortPressListener;->onShortPress(Landroid/view/View;)V

    .line 170
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget$CheckForShortPress;->this$0:Lcom/cyanogenmod/trebuchet/PagedViewWidget;

    sput-object v0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->sShortpressTarget:Lcom/cyanogenmod/trebuchet/PagedViewWidget;

    .line 172
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget$CheckForShortPress;->this$0:Lcom/cyanogenmod/trebuchet/PagedViewWidget;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mShortPressTriggered:Z

    goto :goto_0
.end method
