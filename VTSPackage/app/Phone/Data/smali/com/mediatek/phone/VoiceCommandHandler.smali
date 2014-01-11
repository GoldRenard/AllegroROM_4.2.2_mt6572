.class public Lcom/mediatek/phone/VoiceCommandHandler;
.super Ljava/lang/Object;
.source "VoiceCommandHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/phone/VoiceCommandHandler$Listener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VoiceCommandHandler"

.field private static final VOICE_COMMAND_RESULT_INCOMING_CALL_ACCEPT:I = 0x1

.field private static final VOICE_COMMAND_RESULT_INCOMING_CALL_REJECT:I = 0x2


# instance fields
.field private mContext:Landroid/content/Context;

.field private mIsVoiceIdentifying:Z

.field private mListener:Lcom/mediatek/phone/VoiceCommandHandler$Listener;

.field private mVoiceCommandListener:Lcom/mediatek/common/voicecommand/VoiceCommandListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/mediatek/phone/VoiceCommandHandler$Listener;)V
    .locals 2
    .parameter "context"
    .parameter "listener"

    .prologue
    .line 30
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mContext:Landroid/content/Context;

    .line 32
    iput-object p2, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mListener:Lcom/mediatek/phone/VoiceCommandHandler$Listener;

    .line 34
    new-instance v0, Lcom/mediatek/phone/VoiceCommandHandler$1;

    iget-object v1, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mContext:Landroid/content/Context;

    invoke-direct {v0, p0, v1}, Lcom/mediatek/phone/VoiceCommandHandler$1;-><init>(Lcom/mediatek/phone/VoiceCommandHandler;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mVoiceCommandListener:Lcom/mediatek/common/voicecommand/VoiceCommandListener;

    .line 44
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/phone/VoiceCommandHandler;ILandroid/os/Bundle;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 13
    invoke-direct {p0, p1, p2}, Lcom/mediatek/phone/VoiceCommandHandler;->handleCommonVoiceCommand(ILandroid/os/Bundle;)V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/phone/VoiceCommandHandler;ILandroid/os/Bundle;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 13
    invoke-direct {p0, p1, p2}, Lcom/mediatek/phone/VoiceCommandHandler;->handleUIVoiceCommand(ILandroid/os/Bundle;)V

    return-void
.end method

.method private handleCommonVoiceCommand(ILandroid/os/Bundle;)V
    .locals 4
    .parameter "subAction"
    .parameter "extraData"

    .prologue
    const/4 v3, 0x1

    .line 47
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "handleCommonVoiceCommand(): subAction = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", extraData = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    .line 49
    packed-switch p1, :pswitch_data_0

    .line 69
    :goto_0
    return-void

    .line 52
    :pswitch_0
    const-string v1, "Result"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    if-ne v3, v1, :cond_1

    .line 54
    const-string v1, "handleCommonVoiceCommand(): extraData = ACTION_EXTRA_RESULT_SUCCESS"

    invoke-static {v1}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    .line 55
    const-string v1, "Result_Info"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 56
    .local v0, comments:[Ljava/lang/String;
    if-eqz v0, :cond_0

    array-length v1, v0

    if-le v1, v3, :cond_0

    .line 57
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    const/4 v2, 0x0

    aget-object v2, v0, v2

    aget-object v3, v0, v3

    invoke-virtual {v1, v2, v3}, Lcom/android/phone/NotificationMgr;->showVoiceCommandNotification(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 59
    :cond_0
    const-string v1, "ACTION_VOICE_UI_NOTIFY message extra comment is null or length < 2"

    invoke-static {v1}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 62
    .end local v0           #comments:[Ljava/lang/String;
    :cond_1
    const-string v1, "ACTION_VOICE_UI_NOTIFY message\'s extra data is not SUCCESS"

    invoke-static {v1}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 49
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method private handleUIVoiceCommand(ILandroid/os/Bundle;)V
    .locals 7
    .parameter "subAction"
    .parameter "extraData"

    .prologue
    const/4 v5, 0x1

    .line 72
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleUIVoiceCommand(): subAction = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", extraData = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    .line 74
    packed-switch p1, :pswitch_data_0

    .line 132
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 77
    :pswitch_1
    const-string v3, "handleUIVoiceCommand(), VoiceCommandListener.ACTION_VOICE_UI_START"

    invoke-static {v3}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    .line 78
    const-string v3, "Result"

    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    if-eq v5, v3, :cond_1

    .line 80
    const-string v3, "handleUIVoiceCommand(), ACTION_VOICE_UI_START message\'s extra data is not SUCCESS"

    invoke-static {v3}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 83
    :cond_1
    iget-object v3, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mContext:Landroid/content/Context;

    if-eqz v3, :cond_0

    .line 84
    iget-object v3, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mContext:Landroid/content/Context;

    const-string v4, "voicecommand"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/common/voicecommand/IVoiceCommandManager;

    .line 86
    .local v2, voiceCommandManager:Lcom/mediatek/common/voicecommand/IVoiceCommandManager;
    if-eqz v2, :cond_0

    .line 88
    :try_start_0
    iget-object v3, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mContext:Landroid/content/Context;

    const/4 v4, 0x1

    const/4 v5, 0x1

    const/4 v6, 0x0

    invoke-interface {v2, v3, v4, v5, v6}, Lcom/mediatek/common/voicecommand/IVoiceCommandManager;->sendCommand(Landroid/content/Context;IILandroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 91
    :catch_0
    move-exception v1

    .line 92
    .local v1, e:Landroid/os/RemoteException;
    const-string v3, "RemoteException happens during send main voice common command"

    invoke-static {v3}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 93
    .end local v1           #e:Landroid/os/RemoteException;
    :catch_1
    move-exception v1

    .line 94
    .local v1, e:Ljava/lang/IllegalAccessException;
    const-string v3, "IllegalAccessException happens during send main voice common command"

    invoke-static {v3}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 101
    .end local v1           #e:Ljava/lang/IllegalAccessException;
    .end local v2           #voiceCommandManager:Lcom/mediatek/common/voicecommand/IVoiceCommandManager;
    :pswitch_2
    const-string v3, "handleUIVoiceCommand(), VoiceCommandListener.ACTION_VOICE_UI_STOP"

    invoke-static {v3}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 105
    :pswitch_3
    const-string v3, "handleUIVoiceCommand(), VoiceCommandListener.ACTION_VOICE_UI_NOTIFY"

    invoke-static {v3}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    .line 106
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v3

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    invoke-virtual {v3}, Lcom/android/phone/NotificationMgr;->cancelVoiceCommandNotification()V

    .line 107
    const-string v3, "Result"

    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    if-eq v5, v3, :cond_2

    .line 109
    const-string v3, "handleUIVoiceCommand(), ACTION_VOICE_UI_NOTIFY message\'s extra data is not SUCCESS"

    invoke-static {v3}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 112
    :cond_2
    invoke-virtual {p0}, Lcom/mediatek/phone/VoiceCommandHandler;->stopVoiceCommand()V

    .line 113
    const-string v3, "Result_Info"

    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 114
    .local v0, commandId:I
    if-ne v5, v0, :cond_3

    .line 115
    const-string v3, "handleUIVoiceCommand(), accept"

    invoke-static {v3}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    .line 116
    iget-object v3, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mListener:Lcom/mediatek/phone/VoiceCommandHandler$Listener;

    if-eqz v3, :cond_0

    .line 117
    iget-object v3, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mListener:Lcom/mediatek/phone/VoiceCommandHandler$Listener;

    invoke-interface {v3}, Lcom/mediatek/phone/VoiceCommandHandler$Listener;->acceptIncomingCallByVoiceCommand()V

    goto :goto_0

    .line 119
    :cond_3
    const/4 v3, 0x2

    if-ne v3, v0, :cond_4

    .line 120
    const-string v3, "handleUIVoiceCommand(), reject"

    invoke-static {v3}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    .line 121
    iget-object v3, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mListener:Lcom/mediatek/phone/VoiceCommandHandler$Listener;

    if-eqz v3, :cond_0

    .line 122
    iget-object v3, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mListener:Lcom/mediatek/phone/VoiceCommandHandler$Listener;

    invoke-interface {v3}, Lcom/mediatek/phone/VoiceCommandHandler$Listener;->rejectIncomingCallByVoiceCommand()V

    goto/16 :goto_0

    .line 125
    :cond_4
    const-string v3, "invalid command id"

    invoke-static {v3}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 74
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public static isValidCondition()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 201
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v2

    iget-object v2, v2, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 202
    .local v0, firstRingCall:Lcom/android/internal/telephony/Call;
    if-nez v0, :cond_1

    .line 205
    :cond_0
    :goto_0
    return v1

    :cond_1
    sget-object v2, Lcom/android/internal/telephony/Call$State;->INCOMING:Lcom/android/internal/telephony/Call$State;

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    if-ne v2, v3, :cond_0

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v2

    iget-object v2, v2, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v2

    iget-object v2, v2, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->hasActiveBgCall()Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 211
    const-string v0, "VoiceCommandHandler"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 192
    iput-object v0, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mContext:Landroid/content/Context;

    .line 193
    iput-object v0, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mListener:Lcom/mediatek/phone/VoiceCommandHandler$Listener;

    .line 194
    return-void
.end method

.method public isVoiceIdentifying()Z
    .locals 1

    .prologue
    .line 197
    iget-boolean v0, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mIsVoiceIdentifying:Z

    return v0
.end method

.method public startVoiceCommand()V
    .locals 6

    .prologue
    .line 135
    const-string v2, "startVoiceCommand()"

    invoke-static {v2}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    .line 136
    iget-object v2, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mContext:Landroid/content/Context;

    if-nez v2, :cond_1

    .line 137
    const-string v2, "mContext is null, just return"

    invoke-static {v2}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    .line 160
    :cond_0
    :goto_0
    return-void

    .line 140
    :cond_1
    iget-boolean v2, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mIsVoiceIdentifying:Z

    if-eqz v2, :cond_2

    .line 141
    const-string v2, "already voice identifying, just return"

    invoke-static {v2}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 144
    :cond_2
    iget-object v2, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mContext:Landroid/content/Context;

    const-string v3, "voicecommand"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/common/voicecommand/IVoiceCommandManager;

    .line 145
    .local v1, voiceCommandManager:Lcom/mediatek/common/voicecommand/IVoiceCommandManager;
    if-eqz v1, :cond_0

    .line 147
    :try_start_0
    iget-object v2, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mVoiceCommandListener:Lcom/mediatek/common/voicecommand/VoiceCommandListener;

    invoke-interface {v1, v2}, Lcom/mediatek/common/voicecommand/IVoiceCommandManager;->registerListener(Lcom/mediatek/common/voicecommand/VoiceCommandListener;)V

    .line 148
    iget-object v2, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mContext:Landroid/content/Context;

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-interface {v1, v2, v3, v4, v5}, Lcom/mediatek/common/voicecommand/IVoiceCommandManager;->sendCommand(Landroid/content/Context;IILandroid/os/Bundle;)V

    .line 151
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mIsVoiceIdentifying:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 152
    :catch_0
    move-exception v0

    .line 153
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "RemoteException happens during start voice command"

    invoke-static {v2}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 155
    .end local v0           #e:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 156
    .local v0, e:Ljava/lang/IllegalAccessException;
    const-string v2, "IllegalAccessException happens during start voice command"

    invoke-static {v2}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public stopVoiceCommand()V
    .locals 6

    .prologue
    .line 163
    const-string v2, "stopVoiceCommand()"

    invoke-static {v2}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    .line 164
    iget-object v2, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mContext:Landroid/content/Context;

    if-nez v2, :cond_1

    .line 165
    const-string v2, "mContext is null, just return"

    invoke-static {v2}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    .line 189
    :cond_0
    :goto_0
    return-void

    .line 168
    :cond_1
    iget-boolean v2, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mIsVoiceIdentifying:Z

    if-nez v2, :cond_2

    .line 169
    const-string v2, "already not voice voidentifying, just return"

    invoke-static {v2}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 172
    :cond_2
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v2

    iget-object v2, v2, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    invoke-virtual {v2}, Lcom/android/phone/NotificationMgr;->cancelVoiceCommandNotification()V

    .line 173
    iget-object v2, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mContext:Landroid/content/Context;

    const-string v3, "voicecommand"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/common/voicecommand/IVoiceCommandManager;

    .line 174
    .local v1, voiceCommandManager:Lcom/mediatek/common/voicecommand/IVoiceCommandManager;
    if-eqz v1, :cond_0

    .line 176
    :try_start_0
    iget-object v2, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mContext:Landroid/content/Context;

    const/4 v3, 0x2

    const/4 v4, 0x2

    const/4 v5, 0x0

    invoke-interface {v1, v2, v3, v4, v5}, Lcom/mediatek/common/voicecommand/IVoiceCommandManager;->sendCommand(Landroid/content/Context;IILandroid/os/Bundle;)V

    .line 179
    iget-object v2, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mVoiceCommandListener:Lcom/mediatek/common/voicecommand/VoiceCommandListener;

    invoke-interface {v1, v2}, Lcom/mediatek/common/voicecommand/IVoiceCommandManager;->unRegisterListener(Lcom/mediatek/common/voicecommand/VoiceCommandListener;)V

    .line 180
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/mediatek/phone/VoiceCommandHandler;->mIsVoiceIdentifying:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 181
    :catch_0
    move-exception v0

    .line 182
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "RemoteException happens during stop voice command"

    invoke-static {v2}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 184
    .end local v0           #e:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 185
    .local v0, e:Ljava/lang/IllegalAccessException;
    const-string v2, "IllegalAccessException happens during stop voice command"

    invoke-static {v2}, Lcom/mediatek/phone/VoiceCommandHandler;->log(Ljava/lang/String;)V

    goto :goto_0
.end method
