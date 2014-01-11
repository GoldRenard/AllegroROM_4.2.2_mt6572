.class Lcom/mediatek/oobe/basic/MainActivity$2;
.super Landroid/content/BroadcastReceiver;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mSlotChecked:[Z

.field final synthetic this$0:Lcom/mediatek/oobe/basic/MainActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/MainActivity;)V
    .locals 1
    .parameter

    .prologue
    .line 154
    iput-object p1, p0, Lcom/mediatek/oobe/basic/MainActivity$2;->this$0:Lcom/mediatek/oobe/basic/MainActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 155
    const/4 v0, 0x4

    new-array v0, v0, [Z

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/mediatek/oobe/basic/MainActivity$2;->mSlotChecked:[Z

    .line 154
    return-void

    .line 155
    :array_0
    .array-data 0x1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 12
    .parameter "context"
    .parameter "intent"

    .prologue
    const/16 v11, 0x7d2

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 159
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 160
    .local v0, action:Ljava/lang/String;
    const-string v7, "hotswapdbg"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "MainActivity "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    if-eqz v0, :cond_0

    const-string v7, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 162
    const-string v7, "ss"

    invoke-virtual {p2, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 163
    .local v3, newState:Ljava/lang/String;
    const-string v7, "simId"

    const/4 v8, -0x1

    invoke-virtual {p2, v7, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 164
    .local v4, slotId:I
    const-string v7, "OOBE"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "MainActivity(), monitor SIM state change, new state="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "SIM slotId="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    const-string v7, "ABSENT"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    const-string v7, "NOT_READY"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 170
    iget-object v6, p0, Lcom/mediatek/oobe/basic/MainActivity$2;->mSlotChecked:[Z

    aput-boolean v5, v6, v4

    .line 171
    iget-object v6, p0, Lcom/mediatek/oobe/basic/MainActivity$2;->this$0:Lcom/mediatek/oobe/basic/MainActivity;

    #setter for: Lcom/mediatek/oobe/basic/MainActivity;->mSimExist:Z
    invoke-static {v6, v5}, Lcom/mediatek/oobe/basic/MainActivity;->access$402(Lcom/mediatek/oobe/basic/MainActivity;Z)Z

    .line 172
    iget-object v5, p0, Lcom/mediatek/oobe/basic/MainActivity$2;->this$0:Lcom/mediatek/oobe/basic/MainActivity;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    #setter for: Lcom/mediatek/oobe/basic/MainActivity;->mEndTime:J
    invoke-static {v5, v6, v7}, Lcom/mediatek/oobe/basic/MainActivity;->access$502(Lcom/mediatek/oobe/basic/MainActivity;J)J

    .line 173
    const-string v5, "OOBE"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "detecting SIM card using time "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/mediatek/oobe/basic/MainActivity$2;->this$0:Lcom/mediatek/oobe/basic/MainActivity;

    #getter for: Lcom/mediatek/oobe/basic/MainActivity;->mEndTime:J
    invoke-static {v7}, Lcom/mediatek/oobe/basic/MainActivity;->access$500(Lcom/mediatek/oobe/basic/MainActivity;)J

    move-result-wide v7

    iget-object v9, p0, Lcom/mediatek/oobe/basic/MainActivity$2;->this$0:Lcom/mediatek/oobe/basic/MainActivity;

    #getter for: Lcom/mediatek/oobe/basic/MainActivity;->mStartTime:J
    invoke-static {v9}, Lcom/mediatek/oobe/basic/MainActivity;->access$600(Lcom/mediatek/oobe/basic/MainActivity;)J

    move-result-wide v9

    sub-long/2addr v7, v9

    const-wide/16 v9, 0x3e8

    div-long/2addr v7, v9

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "s."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    iget-object v5, p0, Lcom/mediatek/oobe/basic/MainActivity$2;->this$0:Lcom/mediatek/oobe/basic/MainActivity;

    #getter for: Lcom/mediatek/oobe/basic/MainActivity;->mHandler:Landroid/os/Handler;
    invoke-static {v5}, Lcom/mediatek/oobe/basic/MainActivity;->access$000(Lcom/mediatek/oobe/basic/MainActivity;)Landroid/os/Handler;

    move-result-object v5

    invoke-virtual {v5, v11}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 201
    .end local v3           #newState:Ljava/lang/String;
    .end local v4           #slotId:I
    :cond_0
    :goto_0
    return-void

    .line 176
    .restart local v3       #newState:Ljava/lang/String;
    .restart local v4       #slotId:I
    :cond_1
    const-string v7, "ABSENT"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 179
    iget-object v7, p0, Lcom/mediatek/oobe/basic/MainActivity$2;->mSlotChecked:[Z

    aput-boolean v5, v7, v4

    .line 181
    sget v7, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    const/4 v8, 0x2

    if-lt v7, v8, :cond_4

    .line 184
    const/4 v2, 0x1

    .line 185
    .local v2, isAllChecked:Z
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    sget v7, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    if-ge v1, v7, :cond_3

    .line 186
    if-eqz v2, :cond_2

    iget-object v7, p0, Lcom/mediatek/oobe/basic/MainActivity$2;->mSlotChecked:[Z

    aget-boolean v7, v7, v1

    if-eqz v7, :cond_2

    move v2, v5

    .line 185
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    move v2, v6

    .line 186
    goto :goto_2

    .line 188
    :cond_3
    if-eqz v2, :cond_0

    .line 189
    const-string v5, "OOBE"

    const-string v7, "gemini: checked slots done "

    invoke-static {v5, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    iget-object v5, p0, Lcom/mediatek/oobe/basic/MainActivity$2;->this$0:Lcom/mediatek/oobe/basic/MainActivity;

    #setter for: Lcom/mediatek/oobe/basic/MainActivity;->mSimExist:Z
    invoke-static {v5, v6}, Lcom/mediatek/oobe/basic/MainActivity;->access$402(Lcom/mediatek/oobe/basic/MainActivity;Z)Z

    .line 191
    iget-object v5, p0, Lcom/mediatek/oobe/basic/MainActivity$2;->this$0:Lcom/mediatek/oobe/basic/MainActivity;

    #getter for: Lcom/mediatek/oobe/basic/MainActivity;->mHandler:Landroid/os/Handler;
    invoke-static {v5}, Lcom/mediatek/oobe/basic/MainActivity;->access$000(Lcom/mediatek/oobe/basic/MainActivity;)Landroid/os/Handler;

    move-result-object v5

    invoke-virtual {v5, v11}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 195
    .end local v1           #i:I
    .end local v2           #isAllChecked:Z
    :cond_4
    const-string v5, "OOBE"

    const-string v7, " signal card: checked slots done "

    invoke-static {v5, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    iget-object v5, p0, Lcom/mediatek/oobe/basic/MainActivity$2;->this$0:Lcom/mediatek/oobe/basic/MainActivity;

    #setter for: Lcom/mediatek/oobe/basic/MainActivity;->mSimExist:Z
    invoke-static {v5, v6}, Lcom/mediatek/oobe/basic/MainActivity;->access$402(Lcom/mediatek/oobe/basic/MainActivity;Z)Z

    .line 197
    iget-object v5, p0, Lcom/mediatek/oobe/basic/MainActivity$2;->this$0:Lcom/mediatek/oobe/basic/MainActivity;

    #getter for: Lcom/mediatek/oobe/basic/MainActivity;->mHandler:Landroid/os/Handler;
    invoke-static {v5}, Lcom/mediatek/oobe/basic/MainActivity;->access$000(Lcom/mediatek/oobe/basic/MainActivity;)Landroid/os/Handler;

    move-result-object v5

    invoke-virtual {v5, v11}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0
.end method
