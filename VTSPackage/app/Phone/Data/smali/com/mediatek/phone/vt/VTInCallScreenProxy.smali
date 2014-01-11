.class public Lcom/mediatek/phone/vt/VTInCallScreenProxy;
.super Ljava/lang/Object;
.source "VTInCallScreenProxy.java"

# interfaces
.implements Lcom/mediatek/phone/vt/IVTInCallScreen;


# static fields
.field private static final DBG:Z = true

.field private static final LOG_TAG:Ljava/lang/String; = "VTInCallScreenProxy"


# instance fields
.field private mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

.field private mInCallScreen:Lcom/android/phone/InCallScreen;

.field private mIsInflate:Z

.field private mIsLocaleChanged:Z

.field private mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;


# direct methods
.method public constructor <init>(Lcom/android/phone/InCallScreen;Lcom/android/phone/DTMFTwelveKeyDialer;)V
    .locals 0
    .parameter "inCallScreen"
    .parameter "dialer"

    .prologue
    .line 67
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mInCallScreen:Lcom/android/phone/InCallScreen;

    .line 69
    iput-object p2, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    .line 70
    return-void
.end method

.method private isInflated()Z
    .locals 1

    .prologue
    .line 414
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mIsInflate:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 418
    const-string v0, "VTInCallScreenProxy"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 419
    return-void
.end method


# virtual methods
.method public dismissVTDialogs()V
    .locals 1

    .prologue
    .line 167
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 171
    :goto_0
    return-void

    .line 170
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->dismissVTDialogs()V

    goto :goto_0
.end method

.method public getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;
    .locals 1

    .prologue
    .line 131
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 132
    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    .line 134
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v0

    goto :goto_0
.end method

.method public handleOnScreenMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "menuItem"

    .prologue
    .line 264
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 265
    const/4 v0, 0x0

    .line 267
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0, p1}, Lcom/mediatek/phone/vt/VTInCallScreen;->handleOnScreenMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method public initCommonVTState()V
    .locals 1

    .prologue
    .line 274
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 278
    :goto_0
    return-void

    .line 277
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->initCommonVTState()V

    goto :goto_0
.end method

.method public initDialingSuccessVTState()V
    .locals 1

    .prologue
    .line 284
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 288
    :goto_0
    return-void

    .line 287
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->initDialingSuccessVTState()V

    goto :goto_0
.end method

.method public initDialingVTState()V
    .locals 1

    .prologue
    .line 294
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 298
    :goto_0
    return-void

    .line 297
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->initDialingVTState()V

    goto :goto_0
.end method

.method public initVTInCallScreen()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 76
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mInCallScreen:Lcom/android/phone/InCallScreen;

    if-nez v1, :cond_0

    .line 78
    const-string v1, "mInCallScreen is null, just return"

    invoke-direct {p0, v1}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->log(Ljava/lang/String;)V

    .line 102
    :goto_0
    return-void

    .line 82
    :cond_0
    iget-boolean v1, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mIsInflate:Z

    if-eqz v1, :cond_1

    .line 84
    const-string v1, "already inflate, just return"

    invoke-direct {p0, v1}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 89
    :cond_1
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mInCallScreen:Lcom/android/phone/InCallScreen;

    const v2, 0x7f080072

    invoke-virtual {v1, v2}, Lcom/android/phone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewStub;

    .line 90
    .local v0, stub:Landroid/view/ViewStub;
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 91
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mInCallScreen:Lcom/android/phone/InCallScreen;

    const v2, 0x7f08010e

    invoke-virtual {v1, v2}, Lcom/android/phone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/mediatek/phone/vt/VTInCallScreen;

    iput-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    .line 92
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v1, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->setInCallScreenInstance(Lcom/android/phone/InCallScreen;)V

    .line 93
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v1, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->setDialer(Lcom/android/phone/DTMFTwelveKeyDialer;)V

    .line 94
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->initVTInCallScreen()V

    .line 95
    iget-boolean v1, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mIsLocaleChanged:Z

    if-eqz v1, :cond_2

    .line 96
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->notifyLocaleChange()V

    .line 97
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mIsLocaleChanged:Z

    .line 99
    :cond_2
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->registerForVTPhoneStates()V

    .line 100
    iput-boolean v3, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mIsInflate:Z

    .line 101
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v1

    iput-boolean v3, v1, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTIsInflate:Z

    goto :goto_0
.end method

.method public internalAnswerVTCallPre()V
    .locals 1

    .prologue
    .line 142
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->initVTInCallScreen()V

    .line 143
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 145
    const-string v0, "inflate failed"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->log(Ljava/lang/String;)V

    .line 150
    :goto_0
    return-void

    .line 149
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->internalAnswerVTCallPre()V

    goto :goto_0
.end method

.method public notifyLocaleChange()V
    .locals 1

    .prologue
    .line 342
    const-string v0, "NotifyLocaleChange"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->log(Ljava/lang/String;)V

    .line 344
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 345
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mIsLocaleChanged:Z

    .line 349
    :goto_0
    return-void

    .line 348
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->notifyLocaleChange()V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 227
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 231
    :goto_0
    return-void

    .line 230
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->onDestroy()V

    goto :goto_0
.end method

.method public onDisconnectVT(Lcom/android/internal/telephony/Connection;IZ)Z
    .locals 1
    .parameter "connection"
    .parameter "slotId"
    .parameter "isForeground"

    .prologue
    .line 206
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 207
    const/4 v0, 0x0

    .line 209
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0, p1, p2, p3}, Lcom/mediatek/phone/vt/VTInCallScreen;->onDisconnectVT(Lcom/android/internal/telephony/Connection;IZ)Z

    move-result v0

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 389
    const-string v0, "onKeyDown"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->log(Ljava/lang/String;)V

    .line 391
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 392
    const/4 v0, 0x0

    .line 394
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0, p1, p2}, Lcom/mediatek/phone/vt/VTInCallScreen;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 251
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 252
    const/4 v0, 0x0

    .line 254
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0, p1}, Lcom/mediatek/phone/vt/VTInCallScreen;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .parameter "menu"

    .prologue
    .line 405
    const-string v0, "onPrepareOptionsMenu"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->log(Ljava/lang/String;)V

    .line 407
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 408
    const/4 v0, 0x0

    .line 410
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0, p1}, Lcom/mediatek/phone/vt/VTInCallScreen;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    goto :goto_0
.end method

.method public onReceiveVTManagerStartCounter()V
    .locals 1

    .prologue
    .line 356
    const-string v0, "onReceiveVTManagerStartCounter"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->log(Ljava/lang/String;)V

    .line 358
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 362
    :goto_0
    return-void

    .line 361
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->onReceiveVTManagerStartCounter()V

    goto :goto_0
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 329
    const-string v0, "onStop"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->log(Ljava/lang/String;)V

    .line 331
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 335
    :goto_0
    return-void

    .line 334
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->onStop()V

    goto :goto_0
.end method

.method public refreshAudioModePopup()V
    .locals 1

    .prologue
    .line 305
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 309
    :goto_0
    return-void

    .line 308
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->refreshAudioModePopup()V

    goto :goto_0
.end method

.method public resetVTFlags()V
    .locals 1

    .prologue
    .line 157
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 161
    :goto_0
    return-void

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->resetVTFlags()V

    goto :goto_0
.end method

.method public setVTScreenMode(Lcom/android/phone/Constants$VTScreenMode;)V
    .locals 1
    .parameter "mode"

    .prologue
    .line 120
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 124
    :goto_0
    return-void

    .line 123
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0, p1}, Lcom/mediatek/phone/vt/VTInCallScreen;->setVTScreenMode(Lcom/android/phone/Constants$VTScreenMode;)V

    goto :goto_0
.end method

.method public setVTVisible(Z)V
    .locals 1
    .parameter "bIsVisible"

    .prologue
    .line 189
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mIsInflate:Z

    if-nez v0, :cond_1

    .line 193
    :cond_0
    :goto_0
    return-void

    .line 192
    :cond_1
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0, p1}, Lcom/mediatek/phone/vt/VTInCallScreen;->setVTVisible(Z)V

    goto :goto_0
.end method

.method public setupMenuItems(Landroid/view/Menu;)V
    .locals 1
    .parameter "menu"

    .prologue
    .line 238
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 242
    :goto_0
    return-void

    .line 241
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0, p1}, Lcom/mediatek/phone/vt/VTInCallScreen;->setupMenuItems(Landroid/view/Menu;)V

    goto :goto_0
.end method

.method public showReCallDialog(ILjava/lang/String;I)V
    .locals 1
    .parameter "resid"
    .parameter "number"
    .parameter "slot"

    .prologue
    .line 372
    const-string v0, "showReCallDialog"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->log(Ljava/lang/String;)V

    .line 374
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 378
    :goto_0
    return-void

    .line 377
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0, p1, p2, p3}, Lcom/mediatek/phone/vt/VTInCallScreen;->showReCallDialog(ILjava/lang/String;I)V

    goto :goto_0
.end method

.method public stopRecord()V
    .locals 1

    .prologue
    .line 316
    const-string v0, "stopRecord"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->log(Ljava/lang/String;)V

    .line 318
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 322
    :goto_0
    return-void

    .line 321
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->stopRecord()V

    goto :goto_0
.end method

.method public updateElapsedTime(J)V
    .locals 1
    .parameter "elapsedTime"

    .prologue
    .line 217
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 221
    :goto_0
    return-void

    .line 220
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0, p1, p2}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateElapsedTime(J)V

    goto :goto_0
.end method

.method public updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V
    .locals 1
    .parameter "mode"

    .prologue
    .line 109
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 113
    :goto_0
    return-void

    .line 112
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0, p1}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    goto :goto_0
.end method

.method public updateVideoCallRecordState(I)V
    .locals 1
    .parameter "state"

    .prologue
    .line 178
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->isInflated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 182
    :goto_0
    return-void

    .line 181
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreenProxy;->mVTInCallScreen:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v0, p1}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVideoCallRecordState(I)V

    goto :goto_0
.end method
