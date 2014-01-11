.class Lcom/mediatek/oobe/basic/LanguageSettingsWizard$1;
.super Landroid/content/BroadcastReceiver;
.source "LanguageSettingsWizard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/LanguageSettingsWizard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;)V
    .locals 0
    .parameter

    .prologue
    .line 124
    iput-object p1, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$1;->this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 128
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, action:Ljava/lang/String;
    if-eqz v0, :cond_1

    const-string v3, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 131
    const-string v3, "ss"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 132
    .local v1, newState:Ljava/lang/String;
    const-string v3, "simId"

    const/4 v4, -0x1

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 133
    .local v2, slotId:I
    const-string v3, "OOBE"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sim card status:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    const-string v3, "READY"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 137
    iget-object v3, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$1;->this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;

    const/4 v4, 0x0

    #setter for: Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mShowEmergencycall:Z
    invoke-static {v3, v4}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->access$002(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;Z)Z

    .line 138
    iget-object v3, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$1;->this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;

    #getter for: Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mEmergencybtn:Landroid/widget/Button;
    invoke-static {v3}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->access$100(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;)Landroid/widget/Button;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Button;->isShown()Z

    move-result v3

    iget-object v4, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$1;->this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;

    #getter for: Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mShowEmergencycall:Z
    invoke-static {v4}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->access$000(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;)Z

    move-result v4

    if-eq v3, v4, :cond_0

    .line 139
    iget-object v3, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$1;->this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;

    iget-object v4, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$1;->this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;

    #getter for: Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mShowEmergencycall:Z
    invoke-static {v4}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->access$000(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;)Z

    move-result v4

    #calls: Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->updateEmergencycallButton(Z)V
    invoke-static {v3, v4}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->access$200(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;Z)V

    .line 147
    :cond_0
    :goto_0
    const-string v3, "OOBE"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mShowEmergencycall:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$1;->this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;

    #getter for: Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mShowEmergencycall:Z
    invoke-static {v5}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->access$000(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;)Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " mEmergencybtn.isShown:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$1;->this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;

    #getter for: Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mEmergencybtn:Landroid/widget/Button;
    invoke-static {v5}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->access$100(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;)Landroid/widget/Button;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Button;->isShown()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    .end local v1           #newState:Ljava/lang/String;
    .end local v2           #slotId:I
    :cond_1
    return-void

    .line 141
    .restart local v1       #newState:Ljava/lang/String;
    .restart local v2       #slotId:I
    :cond_2
    const-string v3, "NOT_READY"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 142
    iget-object v3, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$1;->this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;

    const/4 v4, 0x1

    #setter for: Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mShowEmergencycall:Z
    invoke-static {v3, v4}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->access$002(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;Z)Z

    .line 143
    iget-object v3, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$1;->this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;

    #getter for: Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mEmergencybtn:Landroid/widget/Button;
    invoke-static {v3}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->access$100(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;)Landroid/widget/Button;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Button;->isShown()Z

    move-result v3

    iget-object v4, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$1;->this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;

    #getter for: Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mShowEmergencycall:Z
    invoke-static {v4}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->access$000(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;)Z

    move-result v4

    if-eq v3, v4, :cond_0

    .line 144
    iget-object v3, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$1;->this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;

    iget-object v4, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$1;->this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;

    #getter for: Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mShowEmergencycall:Z
    invoke-static {v4}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->access$000(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;)Z

    move-result v4

    #calls: Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->updateEmergencycallButton(Z)V
    invoke-static {v3, v4}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->access$200(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;Z)V

    goto :goto_0
.end method
