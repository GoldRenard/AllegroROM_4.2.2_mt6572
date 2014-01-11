.class Lcom/cyanogenmod/trebuchet/Launcher$10;
.super Landroid/os/Handler;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/Launcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;)V
    .locals 0
    .parameter

    .prologue
    .line 1481
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$10;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 8
    .parameter "msg"

    .prologue
    .line 1484
    iget v5, p1, Landroid/os/Message;->what:I

    const/4 v6, 0x1

    if-ne v5, v6, :cond_2

    .line 1485
    const/4 v1, 0x0

    .line 1486
    .local v1, i:I
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher$10;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;
    invoke-static {v5}, Lcom/cyanogenmod/trebuchet/Launcher;->access$1600(Lcom/cyanogenmod/trebuchet/Launcher;)Ljava/util/HashMap;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 1487
    .local v3, key:Landroid/view/View;
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher$10;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;
    invoke-static {v5}, Lcom/cyanogenmod/trebuchet/Launcher;->access$1600(Lcom/cyanogenmod/trebuchet/Launcher;)Ljava/util/HashMap;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/appwidget/AppWidgetProviderInfo;

    iget v5, v5, Landroid/appwidget/AppWidgetProviderInfo;->autoAdvanceViewId:I

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 1488
    .local v4, v:Landroid/view/View;
    mul-int/lit16 v0, v1, 0xfa

    .line 1489
    .local v0, delay:I
    instance-of v5, v4, Landroid/widget/Advanceable;

    if-eqz v5, :cond_0

    .line 1490
    new-instance v5, Lcom/cyanogenmod/trebuchet/Launcher$10$1;

    invoke-direct {v5, p0, v4}, Lcom/cyanogenmod/trebuchet/Launcher$10$1;-><init>(Lcom/cyanogenmod/trebuchet/Launcher$10;Landroid/view/View;)V

    int-to-long v6, v0

    invoke-virtual {p0, v5, v6, v7}, Lcom/cyanogenmod/trebuchet/Launcher$10;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1496
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 1497
    goto :goto_0

    .line 1498
    .end local v0           #delay:I
    .end local v3           #key:Landroid/view/View;
    .end local v4           #v:Landroid/view/View;
    :cond_1
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher$10;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    const-wide/16 v6, 0x4e20

    #calls: Lcom/cyanogenmod/trebuchet/Launcher;->sendAdvanceMessage(J)V
    invoke-static {v5, v6, v7}, Lcom/cyanogenmod/trebuchet/Launcher;->access$1700(Lcom/cyanogenmod/trebuchet/Launcher;J)V

    .line 1500
    .end local v1           #i:I
    .end local v2           #i$:Ljava/util/Iterator;
    :cond_2
    return-void
.end method
