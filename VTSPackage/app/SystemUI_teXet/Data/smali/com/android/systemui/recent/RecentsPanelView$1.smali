.class Lcom/android/systemui/recent/RecentsPanelView$1;
.super Ljava/lang/Object;
.source "RecentsPanelView.java"

# interfaces
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/recent/RecentsPanelView;->handleLongPress(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/recent/RecentsPanelView;

.field final synthetic val$selectedView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/systemui/recent/RecentsPanelView;Landroid/view/View;)V
    .registers 3
    .parameter
    .parameter

    .prologue
    .line 796
    iput-object p1, p0, Lcom/android/systemui/recent/RecentsPanelView$1;->this$0:Lcom/android/systemui/recent/RecentsPanelView;

    iput-object p2, p0, Lcom/android/systemui/recent/RecentsPanelView$1;->val$selectedView:Landroid/view/View;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 7
    .parameter "item"

    .prologue
    const/4 v2, 0x0

    .line 798
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v4, 0x7f080128

    if-ne v3, v4, :cond_17

    .line 799
    iget-object v2, p0, Lcom/android/systemui/recent/RecentsPanelView$1;->this$0:Lcom/android/systemui/recent/RecentsPanelView;

    invoke-static {v2}, Lcom/android/systemui/recent/RecentsPanelView;->access$900(Lcom/android/systemui/recent/RecentsPanelView;)Landroid/view/ViewGroup;

    move-result-object v2

    iget-object v3, p0, Lcom/android/systemui/recent/RecentsPanelView$1;->val$selectedView:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeViewInLayout(Landroid/view/View;)V

    .line 812
    :goto_15
    const/4 v2, 0x1

    :cond_16
    return v2

    .line 800
    :cond_17
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v4, 0x7f080129

    if-ne v3, v4, :cond_16

    .line 801
    iget-object v3, p0, Lcom/android/systemui/recent/RecentsPanelView$1;->val$selectedView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/systemui/recent/RecentsPanelView$ViewHolder;

    .line 802
    .local v1, viewHolder:Lcom/android/systemui/recent/RecentsPanelView$ViewHolder;
    if-eqz v1, :cond_39

    .line 803
    iget-object v0, v1, Lcom/android/systemui/recent/RecentsPanelView$ViewHolder;->taskDescription:Lcom/android/systemui/recent/TaskDescription;

    .line 804
    .local v0, ad:Lcom/android/systemui/recent/TaskDescription;
    iget-object v3, p0, Lcom/android/systemui/recent/RecentsPanelView$1;->this$0:Lcom/android/systemui/recent/RecentsPanelView;

    iget-object v4, v0, Lcom/android/systemui/recent/TaskDescription;->packageName:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/android/systemui/recent/RecentsPanelView;->access$1000(Lcom/android/systemui/recent/RecentsPanelView;Ljava/lang/String;)V

    .line 805
    iget-object v3, p0, Lcom/android/systemui/recent/RecentsPanelView$1;->this$0:Lcom/android/systemui/recent/RecentsPanelView;

    invoke-virtual {v3, v2}, Lcom/android/systemui/recent/RecentsPanelView;->show(Z)V

    goto :goto_15

    .line 807
    .end local v0           #ad:Lcom/android/systemui/recent/TaskDescription;
    :cond_39
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Oops, no tag on view "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/systemui/recent/RecentsPanelView$1;->val$selectedView:Landroid/view/View;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
