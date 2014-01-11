.class public Lcom/mediatek/lbs/AgpsNotifyDialog;
.super Landroid/app/Activity;
.source "AgpsNotifyDialog.java"


# static fields
.field private static final NOTIFY_STRING_LIST:[I


# instance fields
.field private mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

.field private mCliecntName:Ljava/lang/String;

.field private mDialog:Landroid/app/Dialog;

.field private mGetOtherNotify:Z

.field private mIsUserResponse:Z

.field private mMessage:Ljava/lang/String;

.field private mRequestId:Ljava/lang/String;

.field private mSessionId:I

.field private mTimer:Ljava/util/Timer;

.field private mTitle:Ljava/lang/String;

.field private mType:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 349
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/mediatek/lbs/AgpsNotifyDialog;->NOTIFY_STRING_LIST:[I

    return-void

    nop

    :array_0
    .array-data 0x4
        0x24t 0x0t 0xbt 0x7ft
        0x36t 0x0t 0xbt 0x7ft
        0x37t 0x0t 0xbt 0x7ft
        0x38t 0x0t 0xbt 0x7ft
        0x39t 0x0t 0xbt 0x7ft
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 58
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 64
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mTimer:Ljava/util/Timer;

    .line 65
    iput-boolean v1, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mIsUserResponse:Z

    .line 66
    iput-boolean v1, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mGetOtherNotify:Z

    .line 67
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mDialog:Landroid/app/Dialog;

    .line 68
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    iput-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mTitle:Ljava/lang/String;

    .line 69
    const/4 v0, -0x1

    iput v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mSessionId:I

    .line 70
    iput v1, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mType:I

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/lbs/AgpsNotifyDialog;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/mediatek/lbs/AgpsNotifyDialog;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/lbs/AgpsNotifyDialog;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mType:I

    return v0
.end method

.method static synthetic access$200(Lcom/mediatek/lbs/AgpsNotifyDialog;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mSessionId:I

    return v0
.end method

.method static synthetic access$300(Lcom/mediatek/lbs/AgpsNotifyDialog;)Lcom/mediatek/common/agps/MtkAgpsManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    return-object v0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .parameter "info"

    .prologue
    .line 355
    const-string v0, "Settings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[AgpsNotify] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    return-void
.end method

.method private setTimerIfNeed(I)V
    .locals 9
    .parameter "type"

    .prologue
    const/4 v4, 0x1

    .line 109
    new-instance v6, Ljava/util/Timer;

    invoke-direct {v6}, Ljava/util/Timer;-><init>()V

    iput-object v6, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mTimer:Ljava/util/Timer;

    .line 110
    new-instance v2, Lcom/mediatek/lbs/AgpsNotifyDialog$1;

    invoke-direct {v2, p0}, Lcom/mediatek/lbs/AgpsNotifyDialog$1;-><init>(Lcom/mediatek/lbs/AgpsNotifyDialog;)V

    .line 122
    .local v2, task:Ljava/util/TimerTask;
    iget-object v6, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    invoke-interface {v6}, Lcom/mediatek/common/agps/MtkAgpsManager;->getConfig()Lcom/mediatek/common/agps/MtkAgpsConfig;

    move-result-object v0

    .line 124
    .local v0, config:Lcom/mediatek/common/agps/MtkAgpsConfig;
    iget v1, v0, Lcom/mediatek/common/agps/MtkAgpsConfig;->notifyTimeout:I

    .line 125
    .local v1, notifyTimeout:I
    iget v5, v0, Lcom/mediatek/common/agps/MtkAgpsConfig;->verifyTimeout:I

    .line 126
    .local v5, verifyTimeout:I
    iget v6, v0, Lcom/mediatek/common/agps/MtkAgpsConfig;->niTimer:I

    if-ne v6, v4, :cond_1

    .line 128
    .local v4, timerEnabled:Z
    :goto_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "notifyTimeout="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " verifyTimeout="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " timerEnabled="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mediatek/lbs/AgpsNotifyDialog;->log(Ljava/lang/String;)V

    .line 131
    if-eqz v4, :cond_0

    .line 132
    const/4 v3, 0x0

    .line 133
    .local v3, timeout:I
    if-nez p1, :cond_2

    .line 134
    mul-int/lit16 v3, v1, 0x3e8

    .line 138
    :goto_1
    iget-object v6, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mTimer:Ljava/util/Timer;

    int-to-long v7, v3

    invoke-virtual {v6, v2, v7, v8}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 141
    .end local v3           #timeout:I
    :cond_0
    return-void

    .line 126
    .end local v4           #timerEnabled:Z
    :cond_1
    const/4 v4, 0x0

    goto :goto_0

    .line 136
    .restart local v3       #timeout:I
    .restart local v4       #timerEnabled:Z
    :cond_2
    mul-int/lit16 v3, v5, 0x3e8

    goto :goto_1
.end method

.method private setup(Landroid/content/Intent;)V
    .locals 12
    .parameter "intent"

    .prologue
    const v11, 0x7f0b001b

    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 145
    iget-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    if-nez v5, :cond_0

    .line 146
    const-string v5, "mtk-agps"

    invoke-virtual {p0, v5}, Lcom/mediatek/lbs/AgpsNotifyDialog;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mediatek/common/agps/MtkAgpsManager;

    iput-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    .line 149
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 150
    .local v0, bundle:Landroid/os/Bundle;
    const/4 v4, -0x1

    .line 152
    .local v4, type:I
    if-eqz v0, :cond_a

    .line 153
    const/4 v3, 0x0

    .line 154
    .local v3, sessionId:I
    const-string v5, "type"

    invoke-virtual {v0, v5, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 155
    const-string v5, "session_id"

    invoke-virtual {v0, v5, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 156
    const-string v5, "request_id"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mRequestId:Ljava/lang/String;

    .line 157
    const-string v5, "client_name"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mCliecntName:Ljava/lang/String;

    .line 158
    const-string v5, "cancel"

    invoke-virtual {v0, v5, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 159
    .local v1, cancel:Z
    const-string v5, "resp"

    invoke-virtual {v0, v5, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 160
    .local v2, mockUserResp:I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "type=["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] sessionId=["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] pre-essionId=["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mSessionId:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] mRequestId=["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mRequestId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] mCliecntName=["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mCliecntName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] cancel=["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] mockUserResp=["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/mediatek/lbs/AgpsNotifyDialog;->log(Ljava/lang/String;)V

    .line 165
    if-eqz v1, :cond_3

    .line 166
    iput-boolean v7, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mGetOtherNotify:Z

    .line 167
    invoke-virtual {p0, v8}, Lcom/mediatek/lbs/AgpsNotifyDialog;->finishActivity(Z)V

    .line 168
    iget v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mType:I

    if-eq v5, v9, :cond_1

    iget v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mType:I

    if-ne v5, v10, :cond_2

    .line 170
    :cond_1
    iget-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    iget v6, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mSessionId:I

    invoke-interface {v5, v6, v7}, Lcom/mediatek/common/agps/MtkAgpsManager;->niUserResponse(II)V

    .line 235
    .end local v1           #cancel:Z
    .end local v2           #mockUserResp:I
    .end local v3           #sessionId:I
    :cond_2
    :goto_0
    return-void

    .line 175
    .restart local v1       #cancel:Z
    .restart local v2       #mockUserResp:I
    .restart local v3       #sessionId:I
    :cond_3
    if-lez v2, :cond_6

    .line 176
    iput-boolean v7, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mGetOtherNotify:Z

    .line 177
    invoke-virtual {p0, v8}, Lcom/mediatek/lbs/AgpsNotifyDialog;->finishActivity(Z)V

    .line 178
    if-ne v2, v8, :cond_4

    .line 179
    iget-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    iget v6, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mSessionId:I

    invoke-interface {v5, v6, v8}, Lcom/mediatek/common/agps/MtkAgpsManager;->niUserResponse(II)V

    goto :goto_0

    .line 181
    :cond_4
    if-ne v2, v9, :cond_5

    .line 182
    iget-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    iget v6, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mSessionId:I

    invoke-interface {v5, v6, v9}, Lcom/mediatek/common/agps/MtkAgpsManager;->niUserResponse(II)V

    goto :goto_0

    .line 185
    :cond_5
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ERR: unknown mock user response="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/mediatek/lbs/AgpsNotifyDialog;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 190
    :cond_6
    iget-boolean v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mGetOtherNotify:Z

    if-eqz v5, :cond_8

    .line 191
    invoke-virtual {p0, v8}, Lcom/mediatek/lbs/AgpsNotifyDialog;->finishActivity(Z)V

    .line 192
    iget v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mType:I

    if-eq v5, v9, :cond_7

    iget v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mType:I

    if-ne v5, v10, :cond_8

    .line 194
    :cond_7
    iget-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    iget v6, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mSessionId:I

    invoke-interface {v5, v6, v7}, Lcom/mediatek/common/agps/MtkAgpsManager;->niUserResponse(II)V

    .line 198
    :cond_8
    iput v3, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mSessionId:I

    .line 199
    iput v4, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mType:I

    .line 206
    sget-object v5, Lcom/mediatek/lbs/AgpsNotifyDialog;->NOTIFY_STRING_LIST:[I

    aget v5, v5, v4

    invoke-virtual {p0, v5}, Lcom/mediatek/lbs/AgpsNotifyDialog;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mMessage:Ljava/lang/String;

    .line 208
    iget-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mRequestId:Ljava/lang/String;

    if-eqz v5, :cond_b

    iget-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mCliecntName:Ljava/lang/String;

    if-eqz v5, :cond_b

    .line 209
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mMessage:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0, v11}, Lcom/mediatek/lbs/AgpsNotifyDialog;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mRequestId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const v6, 0x7f0b001c

    invoke-virtual {p0, v6}, Lcom/mediatek/lbs/AgpsNotifyDialog;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mCliecntName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mMessage:Ljava/lang/String;

    .line 222
    :cond_9
    :goto_1
    iget v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mType:I

    if-ne v5, v8, :cond_d

    .line 223
    const v5, 0x7f0b001e

    invoke-virtual {p0, v5}, Lcom/mediatek/lbs/AgpsNotifyDialog;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mTitle:Ljava/lang/String;

    .line 224
    invoke-direct {p0, v7}, Lcom/mediatek/lbs/AgpsNotifyDialog;->setTimerIfNeed(I)V

    .line 234
    :goto_2
    iget v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mType:I

    invoke-virtual {p0, v5}, Lcom/mediatek/lbs/AgpsNotifyDialog;->showDialog(I)V

    goto/16 :goto_0

    .line 201
    .end local v1           #cancel:Z
    .end local v2           #mockUserResp:I
    .end local v3           #sessionId:I
    :cond_a
    const-string v5, "Error: Bundle is null"

    invoke-direct {p0, v5}, Lcom/mediatek/lbs/AgpsNotifyDialog;->log(Ljava/lang/String;)V

    .line 202
    invoke-virtual {p0, v7}, Lcom/mediatek/lbs/AgpsNotifyDialog;->finishActivity(Z)V

    goto/16 :goto_0

    .line 213
    .restart local v1       #cancel:Z
    .restart local v2       #mockUserResp:I
    .restart local v3       #sessionId:I
    :cond_b
    iget-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mRequestId:Ljava/lang/String;

    if-eqz v5, :cond_c

    .line 214
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mMessage:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0, v11}, Lcom/mediatek/lbs/AgpsNotifyDialog;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mRequestId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mMessage:Ljava/lang/String;

    goto :goto_1

    .line 216
    :cond_c
    iget-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mCliecntName:Ljava/lang/String;

    if-eqz v5, :cond_9

    .line 217
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mMessage:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const v6, 0x7f0b001c

    invoke-virtual {p0, v6}, Lcom/mediatek/lbs/AgpsNotifyDialog;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mCliecntName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mMessage:Ljava/lang/String;

    goto/16 :goto_1

    .line 225
    :cond_d
    iget v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mType:I

    if-ne v5, v9, :cond_e

    .line 226
    const v5, 0x7f0b001d

    invoke-virtual {p0, v5}, Lcom/mediatek/lbs/AgpsNotifyDialog;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mTitle:Ljava/lang/String;

    .line 227
    invoke-direct {p0, v8}, Lcom/mediatek/lbs/AgpsNotifyDialog;->setTimerIfNeed(I)V

    goto/16 :goto_2

    .line 228
    :cond_e
    iget v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mType:I

    if-ne v5, v10, :cond_f

    .line 229
    const v5, 0x7f0b001d

    invoke-virtual {p0, v5}, Lcom/mediatek/lbs/AgpsNotifyDialog;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mTitle:Ljava/lang/String;

    .line 230
    invoke-direct {p0, v8}, Lcom/mediatek/lbs/AgpsNotifyDialog;->setTimerIfNeed(I)V

    goto/16 :goto_2

    .line 232
    :cond_f
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ERR: unknown type recv type="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mType:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/mediatek/lbs/AgpsNotifyDialog;->log(Ljava/lang/String;)V

    goto/16 :goto_2
.end method


# virtual methods
.method public finishActivity(Z)V
    .locals 7
    .parameter "notify"

    .prologue
    .line 91
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 92
    if-eqz p1, :cond_0

    .line 93
    const v2, 0x7f02005d

    iget-object v3, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mTitle:Ljava/lang/String;

    iget-object v4, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mTitle:Ljava/lang/String;

    iget-object v5, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mMessage:Ljava/lang/String;

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    const/16 v1, 0x2710

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v6

    move-object v0, p0

    move-object v1, p0

    invoke-virtual/range {v0 .. v6}, Lcom/mediatek/lbs/AgpsNotifyDialog;->sendNotification(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 96
    :cond_0
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_1

    .line 97
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 100
    :cond_1
    iget-boolean v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mGetOtherNotify:Z

    if-nez v0, :cond_2

    .line 101
    invoke-virtual {p0}, Lcom/mediatek/lbs/AgpsNotifyDialog;->finish()V

    .line 105
    :goto_0
    return-void

    .line 103
    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mGetOtherNotify:Z

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 239
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 240
    const-string v0, "onCreate v2"

    invoke-direct {p0, v0}, Lcom/mediatek/lbs/AgpsNotifyDialog;->log(Ljava/lang/String;)V

    .line 241
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mIsUserResponse:Z

    .line 242
    invoke-virtual {p0}, Lcom/mediatek/lbs/AgpsNotifyDialog;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/lbs/AgpsNotifyDialog;->setup(Landroid/content/Intent;)V

    .line 243
    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 5
    .parameter "id"

    .prologue
    const v4, 0x7f0b0022

    const v3, 0x7f0b0021

    const v1, 0x7f0b001d

    const/4 v2, 0x0

    .line 253
    packed-switch p1, :pswitch_data_0

    .line 344
    const-string v0, "WARNING: No such dialog"

    invoke-direct {p0, v0}, Lcom/mediatek/lbs/AgpsNotifyDialog;->log(Ljava/lang/String;)V

    .line 346
    :goto_0
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mDialog:Landroid/app/Dialog;

    return-object v0

    .line 255
    :pswitch_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0b001e

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mMessage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mediatek/lbs/AgpsNotifyDialog$3;

    invoke-direct {v1, p0}, Lcom/mediatek/lbs/AgpsNotifyDialog$3;-><init>(Lcom/mediatek/lbs/AgpsNotifyDialog;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0b0020

    new-instance v2, Lcom/mediatek/lbs/AgpsNotifyDialog$2;

    invoke-direct {v2, p0}, Lcom/mediatek/lbs/AgpsNotifyDialog$2;-><init>(Lcom/mediatek/lbs/AgpsNotifyDialog;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mDialog:Landroid/app/Dialog;

    goto :goto_0

    .line 274
    :pswitch_1
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mMessage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mediatek/lbs/AgpsNotifyDialog$6;

    invoke-direct {v1, p0}, Lcom/mediatek/lbs/AgpsNotifyDialog$6;-><init>(Lcom/mediatek/lbs/AgpsNotifyDialog;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mediatek/lbs/AgpsNotifyDialog$5;

    invoke-direct {v1, p0}, Lcom/mediatek/lbs/AgpsNotifyDialog$5;-><init>(Lcom/mediatek/lbs/AgpsNotifyDialog;)V

    invoke-virtual {v0, v3, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mediatek/lbs/AgpsNotifyDialog$4;

    invoke-direct {v1, p0}, Lcom/mediatek/lbs/AgpsNotifyDialog$4;-><init>(Lcom/mediatek/lbs/AgpsNotifyDialog;)V

    invoke-virtual {v0, v4, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mDialog:Landroid/app/Dialog;

    goto :goto_0

    .line 309
    :pswitch_2
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mMessage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mediatek/lbs/AgpsNotifyDialog$9;

    invoke-direct {v1, p0}, Lcom/mediatek/lbs/AgpsNotifyDialog$9;-><init>(Lcom/mediatek/lbs/AgpsNotifyDialog;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mediatek/lbs/AgpsNotifyDialog$8;

    invoke-direct {v1, p0}, Lcom/mediatek/lbs/AgpsNotifyDialog$8;-><init>(Lcom/mediatek/lbs/AgpsNotifyDialog;)V

    invoke-virtual {v0, v3, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mediatek/lbs/AgpsNotifyDialog$7;

    invoke-direct {v1, p0}, Lcom/mediatek/lbs/AgpsNotifyDialog$7;-><init>(Lcom/mediatek/lbs/AgpsNotifyDialog;)V

    invoke-virtual {v0, v4, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mDialog:Landroid/app/Dialog;

    goto/16 :goto_0

    .line 253
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 1
    .parameter "intent"

    .prologue
    .line 247
    const-string v0, "onNewIntent"

    invoke-direct {p0, v0}, Lcom/mediatek/lbs/AgpsNotifyDialog;->log(Ljava/lang/String;)V

    .line 248
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog;->mGetOtherNotify:Z

    .line 249
    invoke-direct {p0, p1}, Lcom/mediatek/lbs/AgpsNotifyDialog;->setup(Landroid/content/Intent;)V

    .line 250
    return-void
.end method

.method public sendNotification(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 6
    .parameter "context"
    .parameter "icon"
    .parameter "ticker"
    .parameter "title"
    .parameter "content"
    .parameter "id"

    .prologue
    const/4 v5, 0x0

    .line 75
    new-instance v1, Landroid/content/Intent;

    const-string v4, ""

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 76
    .local v1, intent:Landroid/content/Intent;
    invoke-static {p1, v5, v1, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 79
    .local v0, appIntent:Landroid/app/PendingIntent;
    new-instance v2, Landroid/app/Notification;

    invoke-direct {v2}, Landroid/app/Notification;-><init>()V

    .line 80
    .local v2, notification:Landroid/app/Notification;
    iput p2, v2, Landroid/app/Notification;->icon:I

    .line 81
    iput-object p3, v2, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 82
    iput v5, v2, Landroid/app/Notification;->defaults:I

    .line 83
    const/16 v4, 0x10

    iput v4, v2, Landroid/app/Notification;->flags:I

    .line 84
    invoke-virtual {v2, p1, p4, p5, v0}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 86
    const-string v4, "notification"

    invoke-virtual {p0, v4}, Lcom/mediatek/lbs/AgpsNotifyDialog;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager;

    .line 87
    .local v3, notificationManager:Landroid/app/NotificationManager;
    invoke-virtual {v3, p6, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 88
    return-void
.end method
