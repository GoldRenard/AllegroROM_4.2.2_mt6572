.class public Lcom/android/phone/InCallUiState;
.super Ljava/lang/Object;
.source "InCallUiState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/phone/InCallUiState$FakeCall;,
        Lcom/android/phone/InCallUiState$ProgressIndicationType;,
        Lcom/android/phone/InCallUiState$InCallScreenMode;
    }
.end annotation


# static fields
.field private static final DBG:Z = true

.field static final INCALLSCREEN_NOT_EXIT_NORMAL:I = -0x1

.field static final INCALLSCREEN_NOT_EXIT_NOT_FORGROUND:I = 0x0

.field static final INCALLSCREEN_NOT_EXIT_NOT_INIT:I = 0x1

.field private static final TAG:Ljava/lang/String; = "InCallUiState"

.field private static sInstance:Lcom/android/phone/InCallUiState;

.field static sLastInCallScreenStatus:I


# instance fields
.field delayFinished:Z

.field dialpadContextText:Ljava/lang/String;

.field dialpadDigits:Ljava/lang/String;

.field inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

.field latestActiveCallOrigin:Ljava/lang/String;

.field latestActiveCallOriginTimeStamp:J

.field latestDisconnectCall:Lcom/android/phone/InCallUiState$FakeCall;

.field private mContext:Landroid/content/Context;

.field mLastInCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

.field private mMmiMsg:Landroid/os/Message;

.field private mPendingCallStatusCode:Lcom/android/phone/Constants$CallStatusCode;

.field private mSlot:I

.field private mStrNumber:Ljava/lang/String;

.field needToShowCallLostDialog:Z

.field private progressIndication:Lcom/android/phone/InCallUiState$ProgressIndicationType;

.field providerAddress:Ljava/lang/String;

.field providerGatewayUri:Landroid/net/Uri;

.field providerIcon:Landroid/graphics/drawable/Drawable;

.field providerInfoVisible:Z

.field providerLabel:Ljava/lang/CharSequence;

.field showAlreadyDisconnectedState:Z

.field showDialpad:Z


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    .line 91
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/phone/InCallUiState;->mSlot:I

    .line 131
    sget-object v0, Lcom/android/phone/InCallUiState$InCallScreenMode;->UNDEFINED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    iput-object v0, p0, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    .line 133
    sget-object v0, Lcom/android/phone/InCallUiState$InCallScreenMode;->UNDEFINED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    iput-object v0, p0, Lcom/android/phone/InCallUiState;->mLastInCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    .line 218
    sget-object v0, Lcom/android/phone/Constants$CallStatusCode;->SUCCESS:Lcom/android/phone/Constants$CallStatusCode;

    iput-object v0, p0, Lcom/android/phone/InCallUiState;->mPendingCallStatusCode:Lcom/android/phone/Constants$CallStatusCode;

    .line 348
    sget-object v0, Lcom/android/phone/InCallUiState$ProgressIndicationType;->NONE:Lcom/android/phone/InCallUiState$ProgressIndicationType;

    iput-object v0, p0, Lcom/android/phone/InCallUiState;->progressIndication:Lcom/android/phone/InCallUiState$ProgressIndicationType;

    .line 485
    iput-object v1, p0, Lcom/android/phone/InCallUiState;->mMmiMsg:Landroid/os/Message;

    .line 499
    iput-object v1, p0, Lcom/android/phone/InCallUiState;->latestDisconnectCall:Lcom/android/phone/InCallUiState$FakeCall;

    .line 500
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/phone/InCallUiState;->delayFinished:Z

    .line 92
    iput-object p1, p0, Lcom/android/phone/InCallUiState;->mContext:Landroid/content/Context;

    .line 93
    return-void
.end method

.method static init(Landroid/content/Context;)Lcom/android/phone/InCallUiState;
    .locals 4
    .parameter "context"

    .prologue
    .line 77
    const-class v1, Lcom/android/phone/InCallUiState;

    monitor-enter v1

    .line 78
    :try_start_0
    sget-object v0, Lcom/android/phone/InCallUiState;->sInstance:Lcom/android/phone/InCallUiState;

    if-nez v0, :cond_0

    .line 79
    new-instance v0, Lcom/android/phone/InCallUiState;

    invoke-direct {v0, p0}, Lcom/android/phone/InCallUiState;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/android/phone/InCallUiState;->sInstance:Lcom/android/phone/InCallUiState;

    .line 83
    :goto_0
    sget-object v0, Lcom/android/phone/InCallUiState;->sInstance:Lcom/android/phone/InCallUiState;

    monitor-exit v1

    return-object v0

    .line 81
    :cond_0
    const-string v0, "InCallUiState"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "init() called multiple times!  sInstance = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/android/phone/InCallUiState;->sInstance:Lcom/android/phone/InCallUiState;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 84
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static isNormalInCallScreenState()Z
    .locals 2

    .prologue
    .line 517
    sget v0, Lcom/android/phone/InCallUiState;->sLastInCallScreenStatus:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 481
    const-string v0, "InCallUiState"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 482
    return-void
.end method


# virtual methods
.method public clearPendingCallStatusCode()V
    .locals 1

    .prologue
    .line 290
    const-string v0, "clearPendingCallStatusCode()..."

    invoke-static {v0}, Lcom/android/phone/InCallUiState;->log(Ljava/lang/String;)V

    .line 291
    sget-object v0, Lcom/android/phone/Constants$CallStatusCode;->SUCCESS:Lcom/android/phone/Constants$CallStatusCode;

    iput-object v0, p0, Lcom/android/phone/InCallUiState;->mPendingCallStatusCode:Lcom/android/phone/Constants$CallStatusCode;

    .line 292
    return-void
.end method

.method public clearProgressIndication()V
    .locals 1

    .prologue
    .line 357
    sget-object v0, Lcom/android/phone/InCallUiState$ProgressIndicationType;->NONE:Lcom/android/phone/InCallUiState$ProgressIndicationType;

    iput-object v0, p0, Lcom/android/phone/InCallUiState;->progressIndication:Lcom/android/phone/InCallUiState$ProgressIndicationType;

    .line 358
    return-void
.end method

.method public clearProviderInfo()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 412
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/phone/InCallUiState;->providerInfoVisible:Z

    .line 413
    iput-object v1, p0, Lcom/android/phone/InCallUiState;->providerLabel:Ljava/lang/CharSequence;

    .line 414
    iput-object v1, p0, Lcom/android/phone/InCallUiState;->providerIcon:Landroid/graphics/drawable/Drawable;

    .line 415
    iput-object v1, p0, Lcom/android/phone/InCallUiState;->providerGatewayUri:Landroid/net/Uri;

    .line 416
    iput-object v1, p0, Lcom/android/phone/InCallUiState;->providerAddress:Ljava/lang/String;

    .line 417
    return-void
.end method

.method public clearState()V
    .locals 1

    .prologue
    .line 521
    const-string v0, "clearState()"

    invoke-static {v0}, Lcom/android/phone/InCallUiState;->log(Ljava/lang/String;)V

    .line 524
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/phone/InCallUiState;->showDialpad:Z

    .line 525
    return-void
.end method

.method public dumpState()V
    .locals 2

    .prologue
    .line 458
    const-string v0, "dumpState():"

    invoke-static {v0}, Lcom/android/phone/InCallUiState;->log(Ljava/lang/String;)V

    .line 459
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  - showDialpad: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/phone/InCallUiState;->showDialpad:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/InCallUiState;->log(Ljava/lang/String;)V

    .line 460
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "    - dialpadContextText: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallUiState;->dialpadContextText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/InCallUiState;->log(Ljava/lang/String;)V

    .line 461
    invoke-virtual {p0}, Lcom/android/phone/InCallUiState;->hasPendingCallStatusCode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 462
    const-string v0, "  - status indication is pending!"

    invoke-static {v0}, Lcom/android/phone/InCallUiState;->log(Ljava/lang/String;)V

    .line 463
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "    - pending call status code = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallUiState;->mPendingCallStatusCode:Lcom/android/phone/Constants$CallStatusCode;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/InCallUiState;->log(Ljava/lang/String;)V

    .line 467
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  - progressIndication: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallUiState;->progressIndication:Lcom/android/phone/InCallUiState$ProgressIndicationType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/InCallUiState;->log(Ljava/lang/String;)V

    .line 468
    iget-boolean v0, p0, Lcom/android/phone/InCallUiState;->providerInfoVisible:Z

    if-eqz v0, :cond_1

    .line 469
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  - provider info VISIBLE: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallUiState;->providerLabel:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " / "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallUiState;->providerIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " / "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallUiState;->providerGatewayUri:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " / "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallUiState;->providerAddress:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/InCallUiState;->log(Ljava/lang/String;)V

    .line 477
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  - latestActiveCallOrigin: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallUiState;->latestActiveCallOrigin:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/InCallUiState;->log(Ljava/lang/String;)V

    .line 478
    return-void

    .line 465
    :cond_0
    const-string v0, "  - pending call status code: none"

    invoke-static {v0}, Lcom/android/phone/InCallUiState;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 475
    :cond_1
    const-string v0, "  - provider info: none"

    invoke-static {v0}, Lcom/android/phone/InCallUiState;->log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public getNumber()Ljava/lang/String;
    .locals 1

    .prologue
    .line 278
    iget-object v0, p0, Lcom/android/phone/InCallUiState;->mStrNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getPendingCallStatusCode()Lcom/android/phone/Constants$CallStatusCode;
    .locals 2

    .prologue
    .line 235
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getPendingCallStatusCode() ==> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallUiState;->mPendingCallStatusCode:Lcom/android/phone/Constants$CallStatusCode;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/InCallUiState;->log(Ljava/lang/String;)V

    .line 236
    iget-object v0, p0, Lcom/android/phone/InCallUiState;->mPendingCallStatusCode:Lcom/android/phone/Constants$CallStatusCode;

    return-object v0
.end method

.method getPendingUssdMessage()Landroid/os/Message;
    .locals 1

    .prologue
    .line 491
    iget-object v0, p0, Lcom/android/phone/InCallUiState;->mMmiMsg:Landroid/os/Message;

    return-object v0
.end method

.method public getProgressIndication()Lcom/android/phone/InCallUiState$ProgressIndicationType;
    .locals 1

    .prologue
    .line 365
    iget-object v0, p0, Lcom/android/phone/InCallUiState;->progressIndication:Lcom/android/phone/InCallUiState$ProgressIndicationType;

    return-object v0
.end method

.method public getSlot()I
    .locals 1

    .prologue
    .line 271
    iget v0, p0, Lcom/android/phone/InCallUiState;->mSlot:I

    return v0
.end method

.method hasPendingCallEvents()Z
    .locals 1

    .prologue
    .line 495
    const/4 v0, 0x0

    return v0
.end method

.method public hasPendingCallStatusCode()Z
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 225
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "hasPendingCallStatusCode() ==> "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v0, p0, Lcom/android/phone/InCallUiState;->mPendingCallStatusCode:Lcom/android/phone/Constants$CallStatusCode;

    sget-object v4, Lcom/android/phone/Constants$CallStatusCode;->SUCCESS:Lcom/android/phone/Constants$CallStatusCode;

    if-eq v0, v4, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/InCallUiState;->log(Ljava/lang/String;)V

    .line 227
    iget-object v0, p0, Lcom/android/phone/InCallUiState;->mPendingCallStatusCode:Lcom/android/phone/Constants$CallStatusCode;

    sget-object v3, Lcom/android/phone/Constants$CallStatusCode;->SUCCESS:Lcom/android/phone/Constants$CallStatusCode;

    if-eq v0, v3, :cond_1

    :goto_1
    return v1

    :cond_0
    move v0, v2

    .line 225
    goto :goto_0

    :cond_1
    move v1, v2

    .line 227
    goto :goto_1
.end method

.method public isProgressIndicationActive()Z
    .locals 2

    .prologue
    .line 370
    iget-object v0, p0, Lcom/android/phone/InCallUiState;->progressIndication:Lcom/android/phone/InCallUiState$ProgressIndicationType;

    sget-object v1, Lcom/android/phone/InCallUiState$ProgressIndicationType;->NONE:Lcom/android/phone/InCallUiState$ProgressIndicationType;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setNumberSlot(ILjava/lang/String;)V
    .locals 0
    .parameter "slot"
    .parameter "number"

    .prologue
    .line 262
    iput p1, p0, Lcom/android/phone/InCallUiState;->mSlot:I

    .line 263
    iput-object p2, p0, Lcom/android/phone/InCallUiState;->mStrNumber:Ljava/lang/String;

    .line 265
    return-void
.end method

.method public setPendingCallStatusCode(Lcom/android/phone/Constants$CallStatusCode;)V
    .locals 3
    .parameter "status"

    .prologue
    .line 243
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setPendingCallStatusCode( "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " )..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/InCallUiState;->log(Ljava/lang/String;)V

    .line 244
    iget-object v0, p0, Lcom/android/phone/InCallUiState;->mPendingCallStatusCode:Lcom/android/phone/Constants$CallStatusCode;

    sget-object v1, Lcom/android/phone/Constants$CallStatusCode;->SUCCESS:Lcom/android/phone/Constants$CallStatusCode;

    if-eq v0, v1, :cond_0

    .line 251
    const-string v0, "InCallUiState"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setPendingCallStatusCode: setting new code "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", but a previous code "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/phone/InCallUiState;->mPendingCallStatusCode:Lcom/android/phone/Constants$CallStatusCode;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " was already pending!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    :cond_0
    iput-object p1, p0, Lcom/android/phone/InCallUiState;->mPendingCallStatusCode:Lcom/android/phone/Constants$CallStatusCode;

    .line 256
    return-void
.end method

.method setPendingUssdMessage(Landroid/os/Message;)V
    .locals 0
    .parameter "msg"

    .prologue
    .line 487
    iput-object p1, p0, Lcom/android/phone/InCallUiState;->mMmiMsg:Landroid/os/Message;

    .line 488
    return-void
.end method

.method public setProgressIndication(Lcom/android/phone/InCallUiState$ProgressIndicationType;)V
    .locals 0
    .parameter "value"

    .prologue
    .line 352
    iput-object p1, p0, Lcom/android/phone/InCallUiState;->progressIndication:Lcom/android/phone/InCallUiState$ProgressIndicationType;

    .line 353
    return-void
.end method

.method public setProviderInfo(Landroid/content/Intent;)V
    .locals 1
    .parameter "intent"

    .prologue
    .line 394
    iget-object v0, p0, Lcom/android/phone/InCallUiState;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/android/phone/PhoneUtils;->getProviderLabel(Landroid/content/Context;Landroid/content/Intent;)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/InCallUiState;->providerLabel:Ljava/lang/CharSequence;

    .line 395
    iget-object v0, p0, Lcom/android/phone/InCallUiState;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/android/phone/PhoneUtils;->getProviderIcon(Landroid/content/Context;Landroid/content/Intent;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/InCallUiState;->providerIcon:Landroid/graphics/drawable/Drawable;

    .line 396
    invoke-static {p1}, Lcom/android/phone/PhoneUtils;->getProviderGatewayUri(Landroid/content/Intent;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/InCallUiState;->providerGatewayUri:Landroid/net/Uri;

    .line 397
    iget-object v0, p0, Lcom/android/phone/InCallUiState;->providerGatewayUri:Landroid/net/Uri;

    invoke-static {v0}, Lcom/android/phone/PhoneUtils;->formatProviderUri(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/InCallUiState;->providerAddress:Ljava/lang/String;

    .line 398
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/phone/InCallUiState;->providerInfoVisible:Z

    .line 402
    iget-object v0, p0, Lcom/android/phone/InCallUiState;->providerLabel:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/phone/InCallUiState;->providerIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/phone/InCallUiState;->providerGatewayUri:Landroid/net/Uri;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/phone/InCallUiState;->providerAddress:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 404
    :cond_0
    invoke-virtual {p0}, Lcom/android/phone/InCallUiState;->clearProviderInfo()V

    .line 406
    :cond_1
    return-void
.end method
