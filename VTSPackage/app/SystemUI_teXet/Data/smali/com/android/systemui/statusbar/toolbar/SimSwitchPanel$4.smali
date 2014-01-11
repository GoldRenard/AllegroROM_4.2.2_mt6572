.class Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$4;
.super Ljava/lang/Object;
.source "SimSwitchPanel.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->buildSimIconViews()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

.field final synthetic val$simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;Lcom/android/systemui/statusbar/toolbar/SimIconView;)V
    .registers 3
    .parameter
    .parameter

    .prologue
    .line 386
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$4;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    iput-object p2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$4;->val$simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 9
    .parameter "v"

    .prologue
    const-wide/16 v5, -0x3

    const/4 v4, 0x0

    .line 389
    const/4 v0, 0x0

    .local v0, i:I
    :goto_4
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$4;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-static {v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$700(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_22

    .line 390
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$4;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-static {v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$700(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/toolbar/SimIconView;

    invoke-virtual {v2, v4}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSelected(Z)V

    .line 389
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 392
    :cond_22
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$4;->val$simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSelected(Z)V

    .line 393
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$4;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-static {v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$1100(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$4;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-static {v3}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$200(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v5, v6}, Landroid/provider/Settings$System;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    .line 396
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 397
    .local v1, intent:Landroid/content/Intent;
    const-string v2, "simid"

    invoke-virtual {v1, v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 398
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$4;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-static {v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$200(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "sms_sim_setting"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_58

    .line 399
    const-string v2, "android.intent.action.SMS_DEFAULT_SIM"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 401
    :cond_58
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$4;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-virtual {v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 402
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$4;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-static {v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$900(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Lcom/android/systemui/statusbar/toolbar/ToolBarView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getStatusBarService()Lcom/android/systemui/statusbar/BaseStatusBar;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/android/systemui/statusbar/BaseStatusBar;->animateCollapsePanels(I)V

    .line 404
    return-void
.end method
