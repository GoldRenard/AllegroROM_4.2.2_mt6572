.class Lcom/android/systemui/statusbar/toolbar/ToolBarView$3;
.super Landroid/content/BroadcastReceiver;
.source "ToolBarView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/toolbar/ToolBarView;
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
    .line 803
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$3;->this$0:Lcom/android/systemui/statusbar/toolbar/ToolBarView;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 6
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 806
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 807
    .local v0, action:Ljava/lang/String;
    const-string v1, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    .line 808
    const-string v1, "ToolBarView"

    const-string v2, "sim ready"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 809
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$3;->this$0:Lcom/android/systemui/statusbar/toolbar/ToolBarView;

    invoke-static {v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->access$400(Lcom/android/systemui/statusbar/toolbar/ToolBarView;)V

    .line 813
    :cond_18
    :goto_18
    return-void

    .line 810
    :cond_19
    const-string v1, "android.intent.action.SIM_NAME_UPDATE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 811
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$3;->this$0:Lcom/android/systemui/statusbar/toolbar/ToolBarView;

    invoke-static {v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->access$500(Lcom/android/systemui/statusbar/toolbar/ToolBarView;)V

    goto :goto_18
.end method
