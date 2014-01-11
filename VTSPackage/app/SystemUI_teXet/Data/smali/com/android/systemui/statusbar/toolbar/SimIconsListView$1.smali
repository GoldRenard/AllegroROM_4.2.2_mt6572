.class Lcom/android/systemui/statusbar/toolbar/SimIconsListView$1;
.super Landroid/content/BroadcastReceiver;
.source "SimIconsListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/toolbar/SimIconsListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/toolbar/SimIconsListView;)V
    .registers 2
    .parameter

    .prologue
    .line 46
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 5
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 48
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 49
    .local v0, action:Ljava/lang/String;
    const-string v1, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 50
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    invoke-virtual {v1}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->initSimList()V

    .line 51
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    invoke-virtual {v1}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->notifyDataChange()V

    .line 53
    :cond_16
    return-void
.end method
