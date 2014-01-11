.class Lcom/mediatek/beam/BeamShareHistory$2;
.super Ljava/lang/Object;
.source "BeamShareHistory.java"

# interfaces
.implements Landroid/widget/TabHost$OnTabChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/beam/BeamShareHistory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/beam/BeamShareHistory;


# direct methods
.method constructor <init>(Lcom/mediatek/beam/BeamShareHistory;)V
    .locals 0
    .parameter

    .prologue
    .line 197
    iput-object p1, p0, Lcom/mediatek/beam/BeamShareHistory$2;->this$0:Lcom/mediatek/beam/BeamShareHistory;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTabChanged(Ljava/lang/String;)V
    .locals 3
    .parameter "tabId"

    .prologue
    .line 200
    const-string v0, "BeamShareHistory"

    const-string v1, "OnTabChanged"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    const-string v0, "Incoming"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 202
    iget-object v0, p0, Lcom/mediatek/beam/BeamShareHistory$2;->this$0:Lcom/mediatek/beam/BeamShareHistory;

    const/4 v1, 0x0

    #setter for: Lcom/mediatek/beam/BeamShareHistory;->mCurrentTabIndex:I
    invoke-static {v0, v1}, Lcom/mediatek/beam/BeamShareHistory;->access$102(Lcom/mediatek/beam/BeamShareHistory;I)I

    .line 206
    :cond_0
    :goto_0
    const-string v0, "BeamShareHistory"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mCurrentTabIndex"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/beam/BeamShareHistory$2;->this$0:Lcom/mediatek/beam/BeamShareHistory;

    #getter for: Lcom/mediatek/beam/BeamShareHistory;->mCurrentTabIndex:I
    invoke-static {v2}, Lcom/mediatek/beam/BeamShareHistory;->access$100(Lcom/mediatek/beam/BeamShareHistory;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    iget-object v1, p0, Lcom/mediatek/beam/BeamShareHistory$2;->this$0:Lcom/mediatek/beam/BeamShareHistory;

    iget-object v0, p0, Lcom/mediatek/beam/BeamShareHistory$2;->this$0:Lcom/mediatek/beam/BeamShareHistory;

    #getter for: Lcom/mediatek/beam/BeamShareHistory;->mTabs:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/mediatek/beam/BeamShareHistory;->access$300(Lcom/mediatek/beam/BeamShareHistory;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v2, p0, Lcom/mediatek/beam/BeamShareHistory$2;->this$0:Lcom/mediatek/beam/BeamShareHistory;

    #getter for: Lcom/mediatek/beam/BeamShareHistory;->mCurrentTabIndex:I
    invoke-static {v2}, Lcom/mediatek/beam/BeamShareHistory;->access$100(Lcom/mediatek/beam/BeamShareHistory;)I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/beam/BeamShareHistory$TabInfo;

    invoke-virtual {v0}, Lcom/mediatek/beam/BeamShareHistory$TabInfo;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    #setter for: Lcom/mediatek/beam/BeamShareHistory;->mCursor:Landroid/database/Cursor;
    invoke-static {v1, v0}, Lcom/mediatek/beam/BeamShareHistory;->access$202(Lcom/mediatek/beam/BeamShareHistory;Landroid/database/Cursor;)Landroid/database/Cursor;

    .line 209
    iget-object v0, p0, Lcom/mediatek/beam/BeamShareHistory$2;->this$0:Lcom/mediatek/beam/BeamShareHistory;

    #getter for: Lcom/mediatek/beam/BeamShareHistory;->mActivity:Landroid/app/Activity;
    invoke-static {v0}, Lcom/mediatek/beam/BeamShareHistory;->access$000(Lcom/mediatek/beam/BeamShareHistory;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 210
    return-void

    .line 203
    :cond_1
    const-string v0, "Outgoing"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 204
    iget-object v0, p0, Lcom/mediatek/beam/BeamShareHistory$2;->this$0:Lcom/mediatek/beam/BeamShareHistory;

    const/4 v1, 0x1

    #setter for: Lcom/mediatek/beam/BeamShareHistory;->mCurrentTabIndex:I
    invoke-static {v0, v1}, Lcom/mediatek/beam/BeamShareHistory;->access$102(Lcom/mediatek/beam/BeamShareHistory;I)I

    goto :goto_0
.end method
