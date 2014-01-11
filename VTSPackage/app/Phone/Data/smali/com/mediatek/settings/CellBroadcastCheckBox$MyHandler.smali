.class Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;
.super Landroid/os/Handler;
.source "CellBroadcastCheckBox.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/CellBroadcastCheckBox;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;


# direct methods
.method private constructor <init>(Lcom/mediatek/settings/CellBroadcastCheckBox;)V
    .locals 0
    .parameter

    .prologue
    .line 150
    iput-object p1, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/settings/CellBroadcastCheckBox;Lcom/mediatek/settings/CellBroadcastCheckBox$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 150
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;-><init>(Lcom/mediatek/settings/CellBroadcastCheckBox;)V

    return-void
.end method

.method private handleGetStateResponse(Landroid/os/Message;)V
    .locals 9
    .parameter "msg"

    .prologue
    const/16 v5, 0x190

    const/16 v8, 0x12c

    const/16 v7, 0x64

    const/4 v6, 0x0

    .line 166
    iget v3, p1, Landroid/os/Message;->arg2:I

    if-ne v3, v7, :cond_2

    .line 167
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    #getter for: Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    invoke-static {v3}, Lcom/mediatek/settings/CellBroadcastCheckBox;->access$100(Lcom/mediatek/settings/CellBroadcastCheckBox;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 170
    const-string v3, "Settings/CellBroadcastCheckBox"

    const-string v4, "For init query, there\'s no reading dialog!"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    :cond_0
    :goto_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 184
    .local v0, ar:Landroid/os/AsyncResult;
    if-nez v0, :cond_4

    .line 185
    const-string v3, "Settings/CellBroadcastCheckBox"

    const-string v4, "handleGetStateResponse,ar is null"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    iget v3, p1, Landroid/os/Message;->arg2:I

    if-ne v3, v7, :cond_3

    .line 187
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-virtual {v3, v6}, Lcom/mediatek/settings/CellBroadcastCheckBox;->setChecked(Z)V

    .line 188
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-virtual {v3, v6}, Lcom/mediatek/settings/CellBroadcastCheckBox;->setEnabled(Z)V

    .line 237
    :cond_1
    :goto_1
    return-void

    .line 174
    .end local v0           #ar:Landroid/os/AsyncResult;
    :cond_2
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    #getter for: Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    invoke-static {v3}, Lcom/mediatek/settings/CellBroadcastCheckBox;->access$100(Lcom/mediatek/settings/CellBroadcastCheckBox;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 175
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    #getter for: Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    invoke-static {v3}, Lcom/mediatek/settings/CellBroadcastCheckBox;->access$100(Lcom/mediatek/settings/CellBroadcastCheckBox;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-interface {v3, v4, v6}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onFinished(Landroid/preference/Preference;Z)V

    .line 176
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    #getter for: Lcom/mediatek/settings/CellBroadcastCheckBox;->mLastCheckStatus:Z
    invoke-static {v3}, Lcom/mediatek/settings/CellBroadcastCheckBox;->access$200(Lcom/mediatek/settings/CellBroadcastCheckBox;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 177
    new-instance v1, Lcom/mediatek/settings/RecoverChannelSettings;

    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    iget v3, v3, Lcom/mediatek/settings/CellBroadcastCheckBox;->mSimId:I

    iget-object v4, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-virtual {v4}, Lcom/mediatek/settings/CellBroadcastCheckBox;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Lcom/mediatek/settings/RecoverChannelSettings;-><init>(ILandroid/content/ContentResolver;)V

    .line 179
    .local v1, setting:Lcom/mediatek/settings/RecoverChannelSettings;
    invoke-virtual {v1}, Lcom/mediatek/settings/RecoverChannelSettings;->updateChannelStatus()V

    goto :goto_0

    .line 190
    .end local v1           #setting:Lcom/mediatek/settings/RecoverChannelSettings;
    .restart local v0       #ar:Landroid/os/AsyncResult;
    :cond_3
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    #getter for: Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    invoke-static {v3}, Lcom/mediatek/settings/CellBroadcastCheckBox;->access$100(Lcom/mediatek/settings/CellBroadcastCheckBox;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 191
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    #getter for: Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    invoke-static {v3}, Lcom/mediatek/settings/CellBroadcastCheckBox;->access$100(Lcom/mediatek/settings/CellBroadcastCheckBox;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-interface {v3, v4, v8}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onError(Landroid/preference/Preference;I)V

    goto :goto_1

    .line 196
    :cond_4
    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_6

    .line 198
    const-string v3, "Settings/CellBroadcastCheckBox"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleGetStateResponse: ar.exception="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    iget v3, p1, Landroid/os/Message;->arg2:I

    if-ne v3, v7, :cond_5

    .line 201
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-virtual {v3, v6}, Lcom/mediatek/settings/CellBroadcastCheckBox;->setChecked(Z)V

    .line 202
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-virtual {v3, v6}, Lcom/mediatek/settings/CellBroadcastCheckBox;->setEnabled(Z)V

    goto :goto_1

    .line 204
    :cond_5
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    #getter for: Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    invoke-static {v3}, Lcom/mediatek/settings/CellBroadcastCheckBox;->access$100(Lcom/mediatek/settings/CellBroadcastCheckBox;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 205
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    #getter for: Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    invoke-static {v3}, Lcom/mediatek/settings/CellBroadcastCheckBox;->access$100(Lcom/mediatek/settings/CellBroadcastCheckBox;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-interface {v3, v4, v8}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onError(Landroid/preference/Preference;I)V

    goto/16 :goto_1

    .line 210
    :cond_6
    iget-object v3, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    instance-of v3, v3, Ljava/lang/Throwable;

    if-eqz v3, :cond_8

    .line 211
    iget v3, p1, Landroid/os/Message;->arg2:I

    if-ne v3, v7, :cond_7

    .line 212
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-virtual {v3, v6}, Lcom/mediatek/settings/CellBroadcastCheckBox;->setChecked(Z)V

    .line 213
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-virtual {v3, v6}, Lcom/mediatek/settings/CellBroadcastCheckBox;->setEnabled(Z)V

    goto/16 :goto_1

    .line 215
    :cond_7
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    #getter for: Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    invoke-static {v3}, Lcom/mediatek/settings/CellBroadcastCheckBox;->access$100(Lcom/mediatek/settings/CellBroadcastCheckBox;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 216
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    #getter for: Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    invoke-static {v3}, Lcom/mediatek/settings/CellBroadcastCheckBox;->access$100(Lcom/mediatek/settings/CellBroadcastCheckBox;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-interface {v3, v4, v5}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onError(Landroid/preference/Preference;I)V

    goto/16 :goto_1

    .line 221
    :cond_8
    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-eqz v3, :cond_9

    .line 222
    iget-object v2, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Boolean;

    .line 223
    .local v2, state:Ljava/lang/Boolean;
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/mediatek/settings/CellBroadcastCheckBox;->setChecked(Z)V

    goto/16 :goto_1

    .line 225
    .end local v2           #state:Ljava/lang/Boolean;
    :cond_9
    iget v3, p1, Landroid/os/Message;->arg2:I

    if-ne v3, v7, :cond_a

    .line 226
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-virtual {v3, v6}, Lcom/mediatek/settings/CellBroadcastCheckBox;->setChecked(Z)V

    .line 227
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-virtual {v3, v6}, Lcom/mediatek/settings/CellBroadcastCheckBox;->setEnabled(Z)V

    goto/16 :goto_1

    .line 229
    :cond_a
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    #getter for: Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    invoke-static {v3}, Lcom/mediatek/settings/CellBroadcastCheckBox;->access$100(Lcom/mediatek/settings/CellBroadcastCheckBox;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 230
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    #getter for: Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    invoke-static {v3}, Lcom/mediatek/settings/CellBroadcastCheckBox;->access$100(Lcom/mediatek/settings/CellBroadcastCheckBox;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-interface {v3, v4, v5}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onError(Landroid/preference/Preference;I)V

    goto/16 :goto_1
.end method

.method private handleSetStateResponse(Landroid/os/Message;)V
    .locals 5
    .parameter "msg"

    .prologue
    const/16 v4, 0x12c

    .line 240
    iget v1, p1, Landroid/os/Message;->arg2:I

    const/16 v2, 0x65

    if-ne v1, v2, :cond_0

    .line 241
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 242
    .local v0, ar:Landroid/os/AsyncResult;
    if-nez v0, :cond_1

    .line 243
    const-string v1, "Settings/CellBroadcastCheckBox"

    const-string v2, "handleSetStateResponse,ar is null"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    #getter for: Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    invoke-static {v1}, Lcom/mediatek/settings/CellBroadcastCheckBox;->access$100(Lcom/mediatek/settings/CellBroadcastCheckBox;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-interface {v1, v2, v4}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onError(Landroid/preference/Preference;I)V

    .line 259
    .end local v0           #ar:Landroid/os/AsyncResult;
    :cond_0
    :goto_0
    return-void

    .line 247
    .restart local v0       #ar:Landroid/os/AsyncResult;
    :cond_1
    iget-object v1, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v1, :cond_2

    .line 249
    const-string v1, "Settings/CellBroadcastCheckBox"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handleSetStateResponse: ar.exception="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    #getter for: Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    invoke-static {v1}, Lcom/mediatek/settings/CellBroadcastCheckBox;->access$100(Lcom/mediatek/settings/CellBroadcastCheckBox;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 252
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    #getter for: Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    invoke-static {v1}, Lcom/mediatek/settings/CellBroadcastCheckBox;->access$100(Lcom/mediatek/settings/CellBroadcastCheckBox;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-interface {v1, v2, v4}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onError(Landroid/preference/Preference;I)V

    goto :goto_0

    .line 255
    :cond_2
    const-string v1, "Settings/CellBroadcastCheckBox"

    const-string v2, "handleSetStateResponse: re get ok"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->this$0:Lcom/mediatek/settings/CellBroadcastCheckBox;

    const/4 v2, 0x0

    #calls: Lcom/mediatek/settings/CellBroadcastCheckBox;->getCBState(Z)V
    invoke-static {v1, v2}, Lcom/mediatek/settings/CellBroadcastCheckBox;->access$300(Lcom/mediatek/settings/CellBroadcastCheckBox;Z)V

    goto :goto_0
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 153
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 163
    :goto_0
    return-void

    .line 155
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->handleGetStateResponse(Landroid/os/Message;)V

    goto :goto_0

    .line 158
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->handleSetStateResponse(Landroid/os/Message;)V

    goto :goto_0

    .line 153
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
