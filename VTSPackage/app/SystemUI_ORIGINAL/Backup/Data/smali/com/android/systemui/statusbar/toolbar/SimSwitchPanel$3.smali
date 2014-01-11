.class Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$3;
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
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 349
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$3;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    iput-object p2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$3;->val$simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7
    .parameter "v"

    .prologue
    const-wide/16 v5, -0x1

    const/4 v4, 0x0

    .line 352
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$3;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;
    invoke-static {v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$700(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 353
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$3;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;
    invoke-static {v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$700(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/toolbar/SimIconView;

    invoke-virtual {v2, v4}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSelected(Z)V

    .line 352
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 355
    :cond_0
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$3;->val$simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSelected(Z)V

    .line 356
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$3;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$1000(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$3;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentServiceType:Ljava/lang/String;
    invoke-static {v3}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$200(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v5, v6}, Landroid/provider/Settings$System;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    .line 359
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 360
    .local v1, intent:Landroid/content/Intent;
    const-string v2, "simid"

    invoke-virtual {v1, v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 361
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$3;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentServiceType:Ljava/lang/String;
    invoke-static {v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$200(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "voice_call_sim_setting"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 362
    const-string v2, "android.intent.action.VOICE_CALL_DEFAULT_SIM"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 366
    :cond_1
    :goto_1
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$3;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-virtual {v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 367
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$3;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mToolBarView:Lcom/android/systemui/statusbar/toolbar/ToolBarView;
    invoke-static {v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$900(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Lcom/android/systemui/statusbar/toolbar/ToolBarView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getStatusBarService()Lcom/android/systemui/statusbar/BaseStatusBar;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/android/systemui/statusbar/BaseStatusBar;->animateCollapsePanels(I)V

    .line 369
    return-void

    .line 363
    :cond_2
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$3;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentServiceType:Ljava/lang/String;
    invoke-static {v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$200(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "sms_sim_setting"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 364
    const-string v2, "android.intent.action.SMS_DEFAULT_SIM"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1
.end method
