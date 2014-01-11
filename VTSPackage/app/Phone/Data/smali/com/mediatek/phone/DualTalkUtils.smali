.class public final Lcom/mediatek/phone/DualTalkUtils;
.super Ljava/lang/Object;
.source "DualTalkUtils.java"


# static fields
.field private static final DBG:Z = true

.field private static final INSTANCE:Lcom/mediatek/phone/DualTalkUtils; = null

.field private static final LOG_TAG:Ljava/lang/String; = "DualTalkUtils"

.field private static sIsSupportDualTalk:Z


# instance fields
.field private final mActivePhoneList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/Phone;",
            ">;"
        }
    .end annotation
.end field

.field private mCM:Lcom/android/internal/telephony/CallManager;

.field protected mPhoneStateMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/internal/telephony/Phone;",
            "Lcom/android/internal/telephony/PhoneConstants$State;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    new-instance v0, Lcom/mediatek/phone/DualTalkUtils;

    invoke-direct {v0}, Lcom/mediatek/phone/DualTalkUtils;-><init>()V

    sput-object v0, Lcom/mediatek/phone/DualTalkUtils;->INSTANCE:Lcom/mediatek/phone/DualTalkUtils;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 38
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/DualTalkUtils;->mPhoneStateMap:Ljava/util/HashMap;

    .line 41
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    iput-object v0, p0, Lcom/mediatek/phone/DualTalkUtils;->mCM:Lcom/android/internal/telephony/CallManager;

    .line 42
    return-void
.end method

.method private dumpActivePhone()V
    .locals 4

    .prologue
    .line 281
    const-string v2, "DualTalkUtils dumpActivePhone ******* start *******"

    invoke-static {v2}, Lcom/mediatek/phone/DualTalkUtils;->log(Ljava/lang/String;)V

    .line 282
    iget-object v2, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/Phone;

    .line 283
    .local v1, phone:Lcom/android/internal/telephony/Phone;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Phone = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getPhoneName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " Phone = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/phone/DualTalkUtils;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 285
    .end local v1           #phone:Lcom/android/internal/telephony/Phone;
    :cond_0
    const-string v2, "DualTalkUtils dumpActivePhone ******** end  *******"

    invoke-static {v2}, Lcom/mediatek/phone/DualTalkUtils;->log(Ljava/lang/String;)V

    .line 286
    return-void
.end method

.method public static generateDtmfparam(CZ)Ljava/lang/String;
    .locals 3
    .parameter "c"
    .parameter "start"

    .prologue
    .line 606
    const-string v0, "SetWarningTone="

    .line 607
    .local v0, prefix:Ljava/lang/String;
    if-nez p1, :cond_0

    .line 608
    const-string v0, "StopWarningTone="

    .line 610
    :cond_0
    const/16 v1, 0x30

    if-lt p0, v1, :cond_1

    const/16 v1, 0x39

    if-gt p0, v1, :cond_1

    .line 611
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 617
    :goto_0
    return-object v1

    .line 612
    :cond_1
    const/16 v1, 0x2a

    if-ne p0, v1, :cond_2

    .line 613
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "10"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 614
    :cond_2
    const/16 v1, 0x23

    if-ne p0, v1, :cond_3

    .line 615
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "11"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 617
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "null"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private getActivePhoneList()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/Phone;",
            ">;"
        }
    .end annotation

    .prologue
    .line 293
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 294
    .local v1, list:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Phone;>;"
    iget-object v4, p0, Lcom/mediatek/phone/DualTalkUtils;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getAllPhones()Ljava/util/List;

    move-result-object v2

    .line 295
    .local v2, listPhones:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Phone;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/Phone;

    .line 296
    .local v3, phone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v4, v5, :cond_0

    .line 297
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 301
    .end local v3           #phone:Lcom/android/internal/telephony/Phone;
    :cond_1
    return-object v1
.end method

.method public static getInstance()Lcom/mediatek/phone/DualTalkUtils;
    .locals 1

    .prologue
    .line 45
    sget-object v0, Lcom/mediatek/phone/DualTalkUtils;->INSTANCE:Lcom/mediatek/phone/DualTalkUtils;

    return-object v0
.end method

.method public static init()V
    .locals 1

    .prologue
    .line 749
    const/4 v0, 0x0

    sput-boolean v0, Lcom/mediatek/phone/DualTalkUtils;->sIsSupportDualTalk:Z

    .line 750
    return-void
.end method

.method public static isSupportDualTalk()Z
    .locals 1

    .prologue
    .line 745
    sget-boolean v0, Lcom/mediatek/phone/DualTalkUtils;->sIsSupportDualTalk:Z

    return v0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 35
    const-string v0, "DualTalkUtils"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    return-void
.end method

.method private switchPhoneByNeeded()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 361
    iget-object v4, p0, Lcom/mediatek/phone/DualTalkUtils;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v3

    .line 362
    .local v3, state:Lcom/android/internal/telephony/PhoneConstants$State;
    iget-object v4, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 363
    .local v2, size:I
    const/4 v4, 0x2

    if-ge v2, v4, :cond_1

    .line 390
    :cond_0
    :goto_0
    return-void

    .line 366
    :cond_1
    sget-object v4, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v3, v4, :cond_3

    .line 367
    iget-object v4, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Phone;

    .line 368
    .local v0, phone:Lcom/android/internal/telephony/Phone;
    iget-object v4, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/Phone;

    .line 370
    .local v1, phone0:Lcom/android/internal/telephony/Phone;
    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 372
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->switchCalls()V

    goto :goto_0

    .line 373
    :cond_2
    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    if-ne v4, v5, :cond_0

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/Call$State;->HOLDING:Lcom/android/internal/telephony/Call$State;

    if-ne v4, v5, :cond_0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    if-ne v4, v5, :cond_0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v4, v5, :cond_0

    .line 379
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->switchCalls()V

    goto :goto_0

    .line 381
    .end local v0           #phone:Lcom/android/internal/telephony/Phone;
    .end local v1           #phone0:Lcom/android/internal/telephony/Phone;
    :cond_3
    sget-object v4, Lcom/android/internal/telephony/PhoneConstants$State;->RINGING:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v3, v4, :cond_0

    .line 382
    iget-object v4, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Phone;

    .line 383
    .restart local v0       #phone:Lcom/android/internal/telephony/Phone;
    iget-object v4, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/Phone;

    .line 385
    .restart local v1       #phone0:Lcom/android/internal/telephony/Phone;
    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/PhoneConstants$State;->RINGING:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v4, v5, :cond_0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/PhoneConstants$State;->RINGING:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v4, v5, :cond_0

    .line 387
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->switchCalls()V

    goto/16 :goto_0
.end method


# virtual methods
.method public canAddCallForDualTalk()Z
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 575
    sget-boolean v4, Lcom/mediatek/phone/DualTalkUtils;->sIsSupportDualTalk:Z

    if-nez v4, :cond_1

    .line 587
    :cond_0
    :goto_0
    return v3

    .line 579
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->getAllNoIdleCalls()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v1

    .line 580
    .local v1, len:I
    iget-object v4, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 581
    .local v0, count:I
    if-ne v1, v5, :cond_3

    .line 582
    if-ne v0, v5, :cond_2

    :goto_1
    move v3, v2

    goto :goto_0

    :cond_2
    move v2, v3

    goto :goto_1

    .line 583
    :cond_3
    const/4 v4, 0x3

    if-eq v1, v4, :cond_0

    move v3, v2

    .line 587
    goto :goto_0
.end method

.method public canSplitCallFromConference()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 591
    sget-boolean v3, Lcom/mediatek/phone/DualTalkUtils;->sIsSupportDualTalk:Z

    if-nez v3, :cond_1

    .line 601
    :cond_0
    :goto_0
    return v2

    .line 596
    :cond_1
    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x2

    if-lt v3, v4, :cond_0

    .line 599
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    .line 600
    .local v1, fgCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 601
    .local v0, bgCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->isMultiparty()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v3

    if-nez v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0
.end method

.method public getActiveCdmaPhone()Lcom/android/internal/telephony/Phone;
    .locals 5

    .prologue
    .line 690
    const/4 v1, 0x0

    .line 691
    .local v1, p:Lcom/android/internal/telephony/Phone;
    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/telephony/Phone;

    .line 692
    .local v2, phone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    .line 693
    move-object v1, v2

    .line 698
    .end local v2           #phone:Lcom/android/internal/telephony/Phone;
    :cond_1
    return-object v1
.end method

.method public getActiveFgCall()Lcom/android/internal/telephony/Call;
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 137
    const/4 v0, 0x0

    .line 138
    .local v0, call:Lcom/android/internal/telephony/Call;
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->isCdmaAndGsmActive()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 139
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->getActiveCdmaPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    .line 140
    .local v1, cdmaPhone:Lcom/android/internal/telephony/Phone;
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->getActiveGsmPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    .line 142
    .local v2, gsmPhone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 143
    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 166
    .end local v1           #cdmaPhone:Lcom/android/internal/telephony/Phone;
    .end local v2           #gsmPhone:Lcom/android/internal/telephony/Phone;
    :cond_0
    :goto_0
    if-nez v0, :cond_1

    .line 167
    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 169
    :cond_1
    return-object v0

    .line 145
    .restart local v1       #cdmaPhone:Lcom/android/internal/telephony/Phone;
    .restart local v2       #gsmPhone:Lcom/android/internal/telephony/Phone;
    :cond_2
    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    goto :goto_0

    .line 147
    .end local v1           #cdmaPhone:Lcom/android/internal/telephony/Phone;
    .end local v2           #gsmPhone:Lcom/android/internal/telephony/Phone;
    :cond_3
    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 148
    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x2

    if-lt v3, v4, :cond_5

    .line 149
    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/Phone;

    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v3

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/Phone;

    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v3

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/Phone;

    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v3

    if-nez v3, :cond_4

    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/Phone;

    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    sget-object v4, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v3, v4, :cond_4

    .line 156
    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/Phone;

    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    goto :goto_0

    .line 158
    :cond_4
    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/Phone;

    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    goto/16 :goto_0

    .line 161
    :cond_5
    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/Phone;

    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    goto/16 :goto_0
.end method

.method public getActiveGsmPhone()Lcom/android/internal/telephony/Phone;
    .locals 5

    .prologue
    .line 706
    const/4 v1, 0x0

    .line 707
    .local v1, p:Lcom/android/internal/telephony/Phone;
    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/telephony/Phone;

    .line 708
    .local v2, phone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_1

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v3

    const/4 v4, 0x3

    if-ne v3, v4, :cond_0

    .line 710
    :cond_1
    move-object v1, v2

    .line 715
    .end local v2           #phone:Lcom/android/internal/telephony/Phone;
    :cond_2
    return-object v1
.end method

.method public getAllActiveCalls()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/Call;",
            ">;"
        }
    .end annotation

    .prologue
    .line 753
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 754
    .local v0, callList:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Call;>;"
    iget-object v4, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/Phone;

    .line 755
    .local v3, phone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    .line 756
    .local v1, fgCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 757
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 764
    .end local v1           #fgCall:Lcom/android/internal/telephony/Call;
    .end local v3           #phone:Lcom/android/internal/telephony/Phone;
    :cond_1
    return-object v0
.end method

.method public getAllNoIdleCalls()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/Call;",
            ">;"
        }
    .end annotation

    .prologue
    .line 414
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 415
    .local v1, callList:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Call;>;"
    iget-object v5, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/telephony/Phone;

    .line 416
    .local v4, phone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    .line 417
    .local v2, fgCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 418
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 420
    :cond_1
    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 421
    .local v0, bgCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 422
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 426
    .end local v0           #bgCall:Lcom/android/internal/telephony/Call;
    .end local v2           #fgCall:Lcom/android/internal/telephony/Call;
    .end local v4           #phone:Lcom/android/internal/telephony/Phone;
    :cond_2
    return-object v1
.end method

.method public getFirstActiveBgCall()Lcom/android/internal/telephony/Call;
    .locals 5

    .prologue
    .line 177
    const/4 v0, 0x0

    .line 178
    .local v0, call:Lcom/android/internal/telephony/Call;
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->isCdmaAndGsmActive()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 180
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->getActiveCdmaPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    .line 181
    .local v1, cdmaPhone:Lcom/android/internal/telephony/Phone;
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->getActiveGsmPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    .line 182
    .local v2, gsmPhone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 183
    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 186
    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 199
    .end local v1           #cdmaPhone:Lcom/android/internal/telephony/Phone;
    .end local v2           #gsmPhone:Lcom/android/internal/telephony/Phone;
    :cond_0
    :goto_0
    return-object v0

    .line 190
    .restart local v1       #cdmaPhone:Lcom/android/internal/telephony/Phone;
    .restart local v2       #gsmPhone:Lcom/android/internal/telephony/Phone;
    :cond_1
    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    goto :goto_0

    .line 194
    :cond_2
    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    goto :goto_0

    .line 196
    .end local v1           #cdmaPhone:Lcom/android/internal/telephony/Phone;
    .end local v2           #gsmPhone:Lcom/android/internal/telephony/Phone;
    :cond_3
    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 197
    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/Phone;

    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    goto :goto_0
.end method

.method public getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;
    .locals 3

    .prologue
    .line 95
    const/4 v0, 0x0

    .line 96
    .local v0, call:Lcom/android/internal/telephony/Call;
    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 97
    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/Phone;

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 100
    :cond_0
    return-object v0
.end method

.method public getFirstPhone()Lcom/android/internal/telephony/Phone;
    .locals 2

    .prologue
    .line 737
    iget-object v0, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 738
    iget-object v0, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Phone;

    .line 741
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSecondActiveBgCall()Lcom/android/internal/telephony/Call;
    .locals 5

    .prologue
    const/4 v4, 0x2

    .line 210
    const/4 v0, 0x0

    .line 211
    .local v0, call:Lcom/android/internal/telephony/Call;
    iget-object v2, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v2, v4, :cond_0

    .line 212
    iget-object v2, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/Phone;

    .line 213
    .local v1, phone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v2

    if-ne v2, v4, :cond_1

    .line 214
    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 219
    .end local v1           #phone:Lcom/android/internal/telephony/Phone;
    :cond_0
    :goto_0
    return-object v0

    .line 216
    .restart local v1       #phone:Lcom/android/internal/telephony/Phone;
    :cond_1
    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    goto :goto_0
.end method

.method public getSecondActiveRingCall()Lcom/android/internal/telephony/Call;
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 124
    const/4 v0, 0x0

    .line 125
    .local v0, call:Lcom/android/internal/telephony/Call;
    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v1, v2, :cond_0

    .line 126
    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/Phone;

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 129
    :cond_0
    return-object v0
.end method

.method public getSecondActivieFgCall()Lcom/android/internal/telephony/Call;
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 110
    const/4 v0, 0x0

    .line 111
    .local v0, call:Lcom/android/internal/telephony/Call;
    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v1, v2, :cond_0

    .line 112
    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/Phone;

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 115
    :cond_0
    return-object v0
.end method

.method public hasActiveCdmaPhone()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 641
    sget-boolean v3, Lcom/mediatek/phone/DualTalkUtils;->sIsSupportDualTalk:Z

    if-nez v3, :cond_1

    .line 651
    :cond_0
    :goto_0
    return v2

    .line 645
    :cond_1
    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/Phone;

    .line 646
    .local v1, phone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_2

    .line 647
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public hasActiveOrHoldBothCdmaAndGsm()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 673
    sget-boolean v3, Lcom/mediatek/phone/DualTalkUtils;->sIsSupportDualTalk:Z

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x2

    if-ge v3, v4, :cond_1

    .line 685
    :cond_0
    :goto_0
    return v2

    .line 677
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->getActiveGsmPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    .line 678
    .local v1, gsmPhone:Lcom/android/internal/telephony/Phone;
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->getActiveCdmaPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    .line 680
    .local v0, cdmaPhone:Lcom/android/internal/telephony/Phone;
    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 681
    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_2
    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0
.end method

.method public hasDualHoldCallsOnly()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 473
    iget-object v0, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x2

    if-ge v0, v2, :cond_1

    .line 486
    :cond_0
    :goto_0
    return v1

    .line 477
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->isCdmaAndGsmActive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 482
    iget-object v0, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Phone;

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 486
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->getSecondActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_1
.end method

.method public hasMultipleRingingCall()Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 397
    sget-boolean v0, Lcom/mediatek/phone/DualTalkUtils;->sIsSupportDualTalk:Z

    if-nez v0, :cond_1

    .line 405
    :cond_0
    :goto_0
    return v2

    .line 401
    :cond_1
    iget-object v0, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v3, 0x2

    if-lt v0, v3, :cond_0

    .line 405
    iget-object v0, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Phone;

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call$State;->isRinging()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Phone;

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call$State;->isRinging()Z

    move-result v0

    if-eqz v0, :cond_2

    move v0, v1

    :goto_1
    move v2, v0

    goto :goto_0

    :cond_2
    move v0, v2

    goto :goto_1
.end method

.method public isAllowedIncomingCall(Lcom/android/internal/telephony/Call;)Z
    .locals 6
    .parameter "ringing"

    .prologue
    .line 622
    const/4 v0, 0x0

    .line 624
    .local v0, bResult:Z
    iget-object v4, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x2

    if-ge v4, v5, :cond_0

    .line 625
    const/4 v4, 0x1

    .line 637
    :goto_0
    return v4

    .line 628
    :cond_0
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v3

    .line 630
    .local v3, ringPhone:Lcom/android/internal/telephony/Phone;
    iget-object v4, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/telephony/Phone;

    .line 631
    .local v2, phone:Lcom/android/internal/telephony/Phone;
    if-ne v2, v3, :cond_1

    .line 632
    const/4 v0, 0x1

    .end local v2           #phone:Lcom/android/internal/telephony/Phone;
    :cond_2
    move v4, v0

    .line 637
    goto :goto_0
.end method

.method public isCdmaAndGsmActive()Z
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v2, 0x0

    .line 655
    sget-boolean v3, Lcom/mediatek/phone/DualTalkUtils;->sIsSupportDualTalk:Z

    if-nez v3, :cond_1

    .line 669
    :cond_0
    :goto_0
    return v2

    .line 659
    :cond_1
    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v3, v4, :cond_0

    .line 663
    iget-object v3, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/Phone;

    .line 664
    .local v1, phone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v3

    if-ne v3, v4, :cond_2

    .line 665
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public isCdmaCallWaiting(Lcom/android/internal/telephony/Call;)Z
    .locals 2
    .parameter "call"

    .prologue
    .line 724
    invoke-static {p1}, Lcom/android/phone/PhoneUtils;->hasMultipleConnections(Lcom/android/internal/telephony/Call;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 725
    const/4 v1, 0x0

    .line 729
    :goto_0
    return v1

    .line 728
    :cond_0
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v0

    .line 729
    .local v0, conns:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/Connection;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Connection;->isIncoming()Z

    move-result v1

    goto :goto_0
.end method

.method public isDualTalkAnswerCase()Z
    .locals 7

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v6, 0x2

    .line 438
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->getAllNoIdleCalls()Ljava/util/List;

    move-result-object v2

    .line 439
    .local v2, list:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Call;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 444
    .local v1, callCount:I
    if-ne v1, v3, :cond_0

    .line 445
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Call;

    .line 446
    .local v0, call:Lcom/android/internal/telephony/Call;
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v5

    if-ne v5, v6, :cond_0

    .line 447
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lt v5, v6, :cond_0

    .line 448
    add-int/lit8 v1, v1, 0x1

    .line 453
    .end local v0           #call:Lcom/android/internal/telephony/Call;
    :cond_0
    if-lt v1, v6, :cond_1

    :goto_0
    return v3

    :cond_1
    move v3, v4

    goto :goto_0
.end method

.method public isDualTalkMultipleHoldCase()Z
    .locals 3

    .prologue
    .line 463
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->getAllNoIdleCalls()Ljava/util/List;

    move-result-object v0

    .line 464
    .local v0, list:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Call;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x2

    if-le v1, v2, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isMultiplePhoneActive()Z
    .locals 8

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 53
    sget-boolean v6, Lcom/mediatek/phone/DualTalkUtils;->sIsSupportDualTalk:Z

    if-nez v6, :cond_0

    .line 55
    const-string v5, "don\'t support dualtalk!"

    invoke-static {v5}, Lcom/mediatek/phone/DualTalkUtils;->log(Ljava/lang/String;)V

    .line 87
    :goto_0
    return v4

    .line 60
    :cond_0
    iget-object v6, p0, Lcom/mediatek/phone/DualTalkUtils;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v6}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v6

    sget-object v7, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v6, v7, :cond_1

    .line 62
    const-string v5, "CallManager says in idle state!"

    invoke-static {v5}, Lcom/mediatek/phone/DualTalkUtils;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 67
    :cond_1
    iget-object v6, p0, Lcom/mediatek/phone/DualTalkUtils;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v6}, Lcom/android/internal/telephony/CallManager;->getAllPhones()Ljava/util/List;

    move-result-object v3

    .line 68
    .local v3, phoneList:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Phone;>;"
    const/4 v0, 0x0

    .line 70
    .local v0, count:I
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/telephony/Phone;

    .line 71
    .local v2, phone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v6

    sget-object v7, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v6, v7, :cond_2

    .line 72
    add-int/lit8 v0, v0, 0x1

    .line 74
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "non IDLE phone = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/mediatek/phone/DualTalkUtils;->log(Ljava/lang/String;)V

    .line 76
    if-le v0, v5, :cond_2

    .line 78
    const-string v4, "More than one phone active!"

    invoke-static {v4}, Lcom/mediatek/phone/DualTalkUtils;->log(Ljava/lang/String;)V

    move v4, v5

    .line 80
    goto :goto_0

    .line 85
    .end local v2           #phone:Lcom/android/internal/telephony/Phone;
    :cond_3
    const-string v5, "Strange! no phone active but we go here!"

    invoke-static {v5}, Lcom/mediatek/phone/DualTalkUtils;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public isPhoneCallAllowed(I)Z
    .locals 6
    .parameter "slot"

    .prologue
    .line 553
    const/4 v3, 0x1

    .line 554
    .local v3, result:Z
    iget-object v4, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x2

    if-lt v4, v5, :cond_4

    .line 555
    const/4 v0, 0x0

    .line 556
    .local v0, found:Z
    iget-object v4, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/telephony/Phone;

    .line 557
    .local v2, phone:Lcom/android/internal/telephony/Phone;
    instance-of v4, v2, Lcom/android/internal/telephony/sip/SipPhone;

    if-eqz v4, :cond_1

    .line 558
    const-string v4, "match the SipPhone, do nothing."

    invoke-static {v4}, Lcom/mediatek/phone/DualTalkUtils;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 559
    :cond_1
    instance-of v4, v2, Lcom/android/internal/telephony/gsm/GSMPhone;

    if-eqz v4, :cond_2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getMySimId()I

    move-result v4

    if-ne v4, p1, :cond_2

    .line 560
    const/4 v0, 0x1

    goto :goto_0

    .line 561
    :cond_2
    instance-of v4, v2, Lcom/android/internal/telephony/cdma/CDMAPhone;

    if-eqz v4, :cond_0

    .line 562
    const-string v4, "match the CDMAPhone, do nothing."

    invoke-static {v4}, Lcom/mediatek/phone/DualTalkUtils;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 566
    .end local v2           #phone:Lcom/android/internal/telephony/Phone;
    :cond_3
    if-nez v0, :cond_4

    .line 567
    const/4 v3, 0x0

    .line 571
    .end local v0           #found:Z
    .end local v1           #i$:Ljava/util/Iterator;
    :cond_4
    return v3
.end method

.method public isPhoneCallAllowed(Lcom/android/internal/telephony/Phone;)Z
    .locals 3
    .parameter "phone"

    .prologue
    .line 536
    const/4 v0, 0x1

    .line 537
    .local v0, result:Z
    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_0

    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p1, :cond_0

    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p1, :cond_0

    .line 540
    const/4 v0, 0x0

    .line 543
    :cond_0
    return v0
.end method

.method public isRingingWhenOutgoing()Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 497
    sget-boolean v0, Lcom/mediatek/phone/DualTalkUtils;->sIsSupportDualTalk:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v3, 0x2

    if-ge v0, v3, :cond_1

    :cond_0
    move v0, v2

    .line 501
    :goto_0
    return v0

    :cond_1
    iget-object v0, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Phone;

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call$State;->isRinging()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Phone;

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call$State;->isDialing()Z

    move-result v0

    if-eqz v0, :cond_2

    move v0, v1

    goto :goto_0

    :cond_2
    move v0, v2

    goto :goto_0
.end method

.method public isSupportHoldAndUnhold()Z
    .locals 4

    .prologue
    const/4 v3, 0x2

    const/4 v0, 0x0

    .line 513
    sget-boolean v1, Lcom/mediatek/phone/DualTalkUtils;->sIsSupportDualTalk:Z

    if-nez v1, :cond_1

    .line 525
    :cond_0
    :goto_0
    return v0

    .line 517
    :cond_1
    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v1, v3, :cond_0

    .line 521
    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v1

    sget-object v2, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v1, v2, :cond_0

    .line 525
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->getAllNoIdleCalls()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v3, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public switchCalls()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 340
    const-string v1, "Enter switchCalls!"

    invoke-static {v1}, Lcom/mediatek/phone/DualTalkUtils;->log(Ljava/lang/String;)V

    .line 342
    invoke-direct {p0}, Lcom/mediatek/phone/DualTalkUtils;->dumpActivePhone()V

    .line 343
    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x2

    if-ge v1, v2, :cond_1

    .line 354
    :cond_0
    :goto_0
    return-void

    .line 347
    :cond_1
    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Phone;

    .line 348
    .local v0, firstPhone:Lcom/android/internal/telephony/Phone;
    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 349
    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 350
    invoke-direct {p0}, Lcom/mediatek/phone/DualTalkUtils;->dumpActivePhone()V

    .line 352
    const-string v1, "Exit switchCalls!"

    invoke-static {v1}, Lcom/mediatek/phone/DualTalkUtils;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public switchPhoneByNeededForRing(Lcom/android/internal/telephony/Phone;)V
    .locals 4
    .parameter "ringPhone"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 313
    invoke-interface {p1}, Lcom/android/internal/telephony/Phone;->getRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->isRinging()Z

    move-result v1

    if-nez v1, :cond_1

    .line 330
    :cond_0
    :goto_0
    return-void

    .line 317
    :cond_1
    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 318
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->updateState()V

    .line 321
    :cond_2
    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 323
    .local v0, num:I
    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eq p1, v1, :cond_0

    .line 324
    if-ne v0, v3, :cond_3

    .line 325
    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v1, v2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_0

    .line 326
    :cond_3
    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v1, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-ne p1, v1, :cond_0

    .line 327
    invoke-virtual {p0}, Lcom/mediatek/phone/DualTalkUtils;->switchCalls()V

    goto :goto_0
.end method

.method public updateState()V
    .locals 8

    .prologue
    .line 234
    const-string v6, "updateState: start!"

    invoke-static {v6}, Lcom/mediatek/phone/DualTalkUtils;->log(Ljava/lang/String;)V

    .line 236
    iget-object v6, p0, Lcom/mediatek/phone/DualTalkUtils;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v6}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v5

    .line 237
    .local v5, state:Lcom/android/internal/telephony/PhoneConstants$State;
    sget-object v6, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v5, v6, :cond_0

    .line 239
    const-string v6, "updateState: CM is idle! clear activePhoneList!"

    invoke-static {v6}, Lcom/mediatek/phone/DualTalkUtils;->log(Ljava/lang/String;)V

    .line 241
    iget-object v6, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 278
    :goto_0
    return-void

    .line 246
    :cond_0
    iget-object v6, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 247
    .local v2, it:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/internal/telephony/Phone;>;"
    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 248
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/telephony/Phone;

    .line 249
    .local v4, phone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v6

    sget-object v7, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v6, v7, :cond_1

    .line 251
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "updateState: remove "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getPhoneName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " activePhoneList!"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/mediatek/phone/DualTalkUtils;->log(Ljava/lang/String;)V

    .line 253
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 258
    .end local v4           #phone:Lcom/android/internal/telephony/Phone;
    :cond_2
    invoke-direct {p0}, Lcom/mediatek/phone/DualTalkUtils;->getActivePhoneList()Ljava/util/List;

    move-result-object v3

    .line 259
    .local v3, list:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Phone;>;"
    const/4 v0, 0x0

    .line 260
    .local v0, addFlag:Z
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_3
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/telephony/Phone;

    .line 261
    .restart local v4       #phone:Lcom/android/internal/telephony/Phone;
    iget-object v6, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 263
    iget-object v6, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x2

    if-ge v6, v7, :cond_3

    .line 265
    iget-object v6, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    const/4 v7, 0x0

    invoke-virtual {v6, v7, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 266
    const/4 v0, 0x1

    goto :goto_2

    .line 270
    .end local v4           #phone:Lcom/android/internal/telephony/Phone;
    :cond_4
    iget-object v6, p0, Lcom/mediatek/phone/DualTalkUtils;->mActivePhoneList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x1

    if-le v6, v7, :cond_5

    .line 271
    invoke-direct {p0}, Lcom/mediatek/phone/DualTalkUtils;->switchPhoneByNeeded()V

    .line 275
    :cond_5
    invoke-direct {p0}, Lcom/mediatek/phone/DualTalkUtils;->dumpActivePhone()V

    .line 276
    const-string v6, "updateState: exit!"

    invoke-static {v6}, Lcom/mediatek/phone/DualTalkUtils;->log(Ljava/lang/String;)V

    goto/16 :goto_0
.end method
