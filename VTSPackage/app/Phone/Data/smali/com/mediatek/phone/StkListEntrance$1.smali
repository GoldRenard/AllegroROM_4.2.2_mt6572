.class Lcom/mediatek/phone/StkListEntrance$1;
.super Landroid/content/BroadcastReceiver;
.source "StkListEntrance.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/phone/StkListEntrance;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/phone/StkListEntrance;


# direct methods
.method constructor <init>(Lcom/mediatek/phone/StkListEntrance;)V
    .locals 0
    .parameter

    .prologue
    .line 85
    iput-object p1, p0, Lcom/mediatek/phone/StkListEntrance$1;->this$0:Lcom/mediatek/phone/StkListEntrance;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v4, -0x1

    .line 89
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, action:Ljava/lang/String;
    const-string v3, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 92
    const-string v3, "slotId"

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 93
    .local v2, slotId:I
    const-string v3, "state"

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 94
    .local v1, simStatus:I
    const-string v3, "StkListEntrance"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "receive notification of  sim slot = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " status = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    if-ltz v2, :cond_0

    if-ltz v1, :cond_0

    .line 97
    iget-object v3, p0, Lcom/mediatek/phone/StkListEntrance$1;->this$0:Lcom/mediatek/phone/StkListEntrance;

    #calls: Lcom/mediatek/phone/StkListEntrance;->updateSimState(II)V
    invoke-static {v3, v2, v1}, Lcom/mediatek/phone/StkListEntrance;->access$000(Lcom/mediatek/phone/StkListEntrance;II)V

    .line 104
    .end local v1           #simStatus:I
    .end local v2           #slotId:I
    :cond_0
    :goto_0
    return-void

    .line 99
    :cond_1
    const-string v3, "android.intent.action.RADIO_OFF"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 100
    iget-object v3, p0, Lcom/mediatek/phone/StkListEntrance$1;->this$0:Lcom/mediatek/phone/StkListEntrance;

    invoke-virtual {v3}, Lcom/mediatek/phone/StkListEntrance;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "sim_lock_state_setting"

    const-wide/16 v5, 0x0

    invoke-static {v3, v4, v5, v6}, Landroid/provider/Settings$System;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    .line 101
    const-string v3, "StkListEntrance"

    const-string v4, "MODEM RESET"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    iget-object v3, p0, Lcom/mediatek/phone/StkListEntrance$1;->this$0:Lcom/mediatek/phone/StkListEntrance;

    invoke-virtual {v3}, Lcom/mediatek/phone/StkListEntrance;->finish()V

    goto :goto_0
.end method
