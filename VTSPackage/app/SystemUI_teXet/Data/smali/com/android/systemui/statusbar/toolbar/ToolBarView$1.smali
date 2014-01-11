.class Lcom/android/systemui/statusbar/toolbar/ToolBarView$1;
.super Ljava/lang/Object;
.source "ToolBarView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/toolbar/ToolBarView;->onDetachedFromWindow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/toolbar/ToolBarView;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/toolbar/ToolBarView;)V
    .registers 2
    .parameter

    .prologue
    .line 137
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$1;->this$0:Lcom/android/systemui/statusbar/toolbar/ToolBarView;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 140
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$1;->this$0:Lcom/android/systemui/statusbar/toolbar/ToolBarView;

    invoke-static {v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->access$100(Lcom/android/systemui/statusbar/toolbar/ToolBarView;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$1;->this$0:Lcom/android/systemui/statusbar/toolbar/ToolBarView;

    invoke-static {v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->access$000(Lcom/android/systemui/statusbar/toolbar/ToolBarView;)Landroid/content/BroadcastReceiver;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 141
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$1;->this$0:Lcom/android/systemui/statusbar/toolbar/ToolBarView;

    iget-object v0, v0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mSimSwitchPanelView:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->setUpdates(Z)V

    .line 142
    return-void
.end method
