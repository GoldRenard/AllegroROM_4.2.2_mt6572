.class Lcom/android/launcher2/Launcher$9;
.super Landroid/os/Handler;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/Launcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Launcher;


# direct methods
.method constructor <init>(Lcom/android/launcher2/Launcher;)V
    .locals 0
    .parameter

    .prologue
    .line 1523
    iput-object p1, p0, Lcom/android/launcher2/Launcher$9;->this$0:Lcom/android/launcher2/Launcher;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 8
    .parameter "msg"

    .prologue
    .line 1526
    iget v5, p1, Landroid/os/Message;->what:I

    const/4 v6, 0x1

    if-ne v5, v6, :cond_2

    .line 1527
    const/4 v1, 0x0

    .line 1528
    .local v1, i:I
    iget-object v5, p0, Lcom/android/launcher2/Launcher$9;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;
    invoke-static {v5}, Lcom/android/launcher2/Launcher;->access$1600(Lcom/android/launcher2/Launcher;)Ljava/util/HashMap;

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

    .line 1529
    .local v3, key:Landroid/view/View;
    iget-object v5, p0, Lcom/android/launcher2/Launcher$9;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;
    invoke-static {v5}, Lcom/android/launcher2/Launcher;->access$1600(Lcom/android/launcher2/Launcher;)Ljava/util/HashMap;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/appwidget/AppWidgetProviderInfo;

    iget v5, v5, Landroid/appwidget/AppWidgetProviderInfo;->autoAdvanceViewId:I

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 1530
    .local v4, v:Landroid/view/View;
    mul-int/lit16 v0, v1, 0xfa

    .line 1531
    .local v0, delay:I
    instance-of v5, v4, Landroid/widget/Advanceable;

    if-eqz v5, :cond_0

    .line 1532
    new-instance v5, Lcom/android/launcher2/Launcher$9$1;

    invoke-direct {v5, p0, v4}, Lcom/android/launcher2/Launcher$9$1;-><init>(Lcom/android/launcher2/Launcher$9;Landroid/view/View;)V

    int-to-long v6, v0

    invoke-virtual {p0, v5, v6, v7}, Lcom/android/launcher2/Launcher$9;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1538
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 1539
    goto :goto_0

    .line 1540
    .end local v0           #delay:I
    .end local v3           #key:Landroid/view/View;
    .end local v4           #v:Landroid/view/View;
    :cond_1
    iget-object v5, p0, Lcom/android/launcher2/Launcher$9;->this$0:Lcom/android/launcher2/Launcher;

    const-wide/16 v6, 0x4e20

    #calls: Lcom/android/launcher2/Launcher;->sendAdvanceMessage(J)V
    invoke-static {v5, v6, v7}, Lcom/android/launcher2/Launcher;->access$1700(Lcom/android/launcher2/Launcher;J)V

    .line 1542
    .end local v1           #i:I
    .end local v2           #i$:Ljava/util/Iterator;
    :cond_2
    return-void
.end method
