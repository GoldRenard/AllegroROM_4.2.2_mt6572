.class public final Lcom/mediatek/phone/gemini/GeminiUtils;
.super Ljava/lang/Object;
.source "GeminiUtils.java"


# static fields
.field private static final DEBUG:Z = true

.field private static final GET_SIM_RETRY_EMPTY:I = -0x1

.field private static final TAG:Ljava/lang/String; = "Gemini"

.field private static sInstance:Lcom/mediatek/phone/gemini/GeminiUtils;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    new-instance v0, Lcom/mediatek/phone/gemini/GeminiUtils;

    invoke-direct {v0}, Lcom/mediatek/phone/gemini/GeminiUtils;-><init>()V

    sput-object v0, Lcom/mediatek/phone/gemini/GeminiUtils;->sInstance:Lcom/mediatek/phone/gemini/GeminiUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get3GCapabilitySIM()I
    .locals 5

    .prologue
    .line 208
    const-string v3, "phone"

    invoke-static {v3}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v0

    .line 210
    .local v0, iTelephony:Lcom/android/internal/telephony/ITelephony;
    :try_start_0
    invoke-interface {v0}, Lcom/android/internal/telephony/ITelephony;->get3GCapabilitySIM()I

    move-result v2

    .line 211
    .local v2, slot3G:I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "get3GCapabilitySIM, slot3G"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 212
    invoke-interface {v0}, Lcom/android/internal/telephony/ITelephony;->get3GCapabilitySIM()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 215
    .end local v2           #slot3G:I
    :goto_0
    return v3

    .line 213
    :catch_0
    move-exception v1

    .line 214
    .local v1, re:Landroid/os/RemoteException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "get3GCapabilitySIM, "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", return -1"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 215
    const/4 v3, -0x1

    goto :goto_0
.end method

.method public static getCDMASlot()I
    .locals 1

    .prologue
    .line 84
    const/4 v0, 0x1

    return v0
.end method

.method public static getCallerInfo(Landroid/content/Context;Ljava/lang/String;I)Lcom/android/internal/telephony/CallerInfo;
    .locals 1
    .parameter "context"
    .parameter "number"
    .parameter "slotId"

    .prologue
    .line 247
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p2}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 248
    invoke-static {p0, p1, p2}, Lcom/android/internal/telephony/CallerInfo;->getCallerInfoGemini(Landroid/content/Context;Ljava/lang/String;I)Lcom/android/internal/telephony/CallerInfo;

    move-result-object v0

    .line 250
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0, p1}, Lcom/android/internal/telephony/CallerInfo;->getCallerInfo(Landroid/content/Context;Ljava/lang/String;)Lcom/android/internal/telephony/CallerInfo;

    move-result-object v0

    goto :goto_0
.end method

.method public static getDefaultPhone()Lcom/android/internal/telephony/Phone;
    .locals 1

    .prologue
    .line 377
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 378
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/gemini/MTKCallManager;->getDefaultPhoneGemini()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    .line 380
    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getDefaultPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    goto :goto_0
.end method

.method public static getDefaultSlot()I
    .locals 1

    .prologue
    .line 74
    const/4 v0, 0x0

    return v0
.end method

.method public static getIccCard(Lcom/android/internal/telephony/Phone;I)Lcom/android/internal/telephony/IccCard;
    .locals 1
    .parameter "phone"
    .parameter "slotId"

    .prologue
    .line 429
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 430
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 431
    check-cast p0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getIccCardGemini(I)Lcom/android/internal/telephony/IccCard;

    move-result-object v0

    .line 433
    :goto_0
    return-object v0

    .restart local p0
    :cond_0
    invoke-interface {p0}, Lcom/android/internal/telephony/Phone;->getIccCard()Lcom/android/internal/telephony/IccCard;

    move-result-object v0

    goto :goto_0
.end method

.method public static getIccRecordsLoaded(Lcom/android/internal/telephony/Phone;I)Z
    .locals 3
    .parameter "phone"
    .parameter "slotId"

    .prologue
    .line 410
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 411
    const/4 v0, 0x0

    .line 412
    .local v0, iccRecordloaded:Z
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p1}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 413
    check-cast p0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getIccRecordsLoadedGemini(I)Z

    move-result v0

    .line 417
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getIccRecordsLoaded : iccRecordloaded:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", slotId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 418
    return v0

    .line 415
    .restart local p0
    :cond_0
    invoke-interface {p0}, Lcom/android/internal/telephony/Phone;->getIccRecordsLoaded()Z

    move-result v0

    goto :goto_0
.end method

.method public static getIndexInArray(I[I)I
    .locals 3
    .parameter "value"
    .parameter "array"

    .prologue
    .line 300
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 301
    aget v1, p1, v0

    if-ne p0, v1, :cond_0

    .line 306
    .end local v0           #i:I
    :goto_1
    return v0

    .line 300
    .restart local v0       #i:I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 305
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getIndexInArray failed, value="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", array="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 306
    const/4 v0, -0x1

    goto :goto_1
.end method

.method private static getIntSystemProperties(Ljava/lang/String;I)I
    .locals 1
    .parameter "key"
    .parameter "defValue"

    .prologue
    .line 857
    invoke-static {p0, p1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getMessageWaitingIndicator(Lcom/android/internal/telephony/Phone;I)Z
    .locals 3
    .parameter "phone"
    .parameter "slotId"

    .prologue
    .line 611
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 612
    const/4 v0, 0x0

    .line 613
    .local v0, indicator:Z
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p1}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 614
    check-cast p0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getMessageWaitingIndicatorGemini(I)Z

    move-result v0

    .line 618
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getMessageWaitingIndicator, indicator:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 619
    return v0

    .line 616
    .restart local p0
    :cond_0
    invoke-interface {p0}, Lcom/android/internal/telephony/Phone;->getMessageWaitingIndicator()Z

    move-result v0

    goto :goto_0
.end method

.method public static getNetworkOperatorName()Ljava/lang/String;
    .locals 6

    .prologue
    .line 131
    const/4 v3, 0x0

    .line 132
    .local v3, operatorName:Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 133
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v4

    iget-object v1, v4, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 134
    .local v1, gphone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 135
    .local v0, geminiSlots:[I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v4, v0

    if-ge v2, v4, :cond_0

    .line 136
    aget v4, v0, v2

    invoke-virtual {v1, v4}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getStateGemini(I)Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v4, v5, :cond_2

    .line 137
    sget-object v4, Lcom/mediatek/phone/GeminiConstants;->PROPERTY_OPERATOR_ALPHAS:[Ljava/lang/String;

    aget-object v4, v4, v2

    invoke-static {v4}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSystemProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 138
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getNetworkOperatorName operatorName:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", slotId:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget v5, v0, v2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 144
    :cond_0
    if-nez v3, :cond_1

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v4

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v4, v5, :cond_1

    .line 146
    const/4 v2, 0x0

    :goto_1
    array-length v4, v0

    if-ge v2, v4, :cond_1

    .line 147
    aget v4, v0, v2

    invoke-virtual {v1, v4}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getPendingMmiCodesGemini(I)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-eqz v4, :cond_3

    .line 148
    sget-object v4, Lcom/mediatek/phone/GeminiConstants;->PROPERTY_OPERATOR_ALPHAS:[Ljava/lang/String;

    aget-object v4, v4, v2

    invoke-static {v4}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSystemProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 149
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getNetworkOperatorName operatorName:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", slotId:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget v5, v0, v2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 158
    .end local v0           #geminiSlots:[I
    .end local v1           #gphone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    .end local v2           #i:I
    :cond_1
    :goto_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getNetworkOperatorName operatorName = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 159
    return-object v3

    .line 135
    .restart local v0       #geminiSlots:[I
    .restart local v1       #gphone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    .restart local v2       #i:I
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 146
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 156
    .end local v0           #geminiSlots:[I
    .end local v1           #gphone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    .end local v2           #i:I
    :cond_4
    const-string v4, "gsm.operator.alpha"

    invoke-static {v4}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSystemProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_2
.end method

.method public static getNetworkOperatorName(Lcom/android/internal/telephony/Call;)Ljava/lang/String;
    .locals 6
    .parameter "call"

    .prologue
    .line 163
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v4

    if-eqz v4, :cond_0

    if-eqz p0, :cond_0

    .line 164
    const/4 v1, 0x0

    .line 165
    .local v1, operatorName:Ljava/lang/String;
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v4

    iget-object v2, v4, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    check-cast v2, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 166
    .local v2, phone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    invoke-static {p0}, Lcom/android/phone/PhoneUtils;->getSimInfoByCall(Lcom/android/internal/telephony/Call;)Landroid/provider/Telephony$SIMInfo;

    move-result-object v0

    .line 167
    .local v0, info:Landroid/provider/Telephony$SIMInfo;
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    if-eq v4, v5, :cond_0

    .line 168
    iget v4, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/phone/gemini/GeminiUtils;->getIndexInArray(I[I)I

    move-result v3

    .line 169
    .local v3, slotIndex:I
    if-ltz v3, :cond_0

    .line 170
    sget-object v4, Lcom/mediatek/phone/GeminiConstants;->PROPERTY_OPERATOR_ALPHAS:[Ljava/lang/String;

    aget-object v4, v4, v3

    invoke-static {v4}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSystemProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 174
    .end local v0           #info:Landroid/provider/Telephony$SIMInfo;
    .end local v1           #operatorName:Ljava/lang/String;
    .end local v2           #phone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    .end local v3           #slotIndex:I
    :goto_0
    return-object v4

    :cond_0
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v4

    goto :goto_0
.end method

.method public static getOperatorName(I)Ljava/lang/String;
    .locals 4
    .parameter "slotId"

    .prologue
    .line 110
    const/4 v0, 0x0

    .line 111
    .local v0, operatorName:Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {p0}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 112
    invoke-static {}, Lcom/mediatek/phone/SIMInfoWrapper;->getDefault()Lcom/mediatek/phone/SIMInfoWrapper;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/mediatek/phone/SIMInfoWrapper;->getSimInfoBySlot(I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v1

    .line 113
    .local v1, simInfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v1, :cond_0

    .line 114
    iget-object v0, v1, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    .line 115
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getOperatorName, operatorName= "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v1, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 120
    .end local v1           #simInfo:Landroid/provider/Telephony$SIMInfo;
    :cond_0
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getOperatorName, slotId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " operatorName="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 121
    return-object v0

    .line 118
    :cond_1
    const-string v2, "gsm.operator.alpha"

    invoke-static {v2}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSystemProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static getPendingMmiCodes(Lcom/android/internal/telephony/Phone;I)Ljava/util/List;
    .locals 2
    .parameter "phone"
    .parameter "slotId"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/internal/telephony/Phone;",
            "I)",
            "Ljava/util/List",
            "<+",
            "Lcom/android/internal/telephony/MmiCode;",
            ">;"
        }
    .end annotation

    .prologue
    .line 774
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 775
    const/4 v0, 0x0

    .line 776
    .local v0, mmiCodes:Ljava/util/List;,"Ljava/util/List<+Lcom/android/internal/telephony/MmiCode;>;"
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p1}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 777
    check-cast p0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getPendingMmiCodesGemini(I)Ljava/util/List;

    move-result-object v0

    .line 781
    :goto_0
    if-nez v0, :cond_0

    .line 782
    new-instance v0, Ljava/util/ArrayList;

    .end local v0           #mmiCodes:Ljava/util/List;,"Ljava/util/List<+Lcom/android/internal/telephony/MmiCode;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 784
    .restart local v0       #mmiCodes:Ljava/util/List;,"Ljava/util/List<+Lcom/android/internal/telephony/MmiCode;>;"
    :cond_0
    return-object v0

    .line 779
    .restart local p0
    :cond_1
    invoke-interface {p0}, Lcom/android/internal/telephony/Phone;->getPendingMmiCodes()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public static getPhbRecordInfo(Lcom/android/internal/telephony/Phone;Landroid/os/Message;I)V
    .locals 3
    .parameter "phone"
    .parameter "response"
    .parameter "slotId"

    .prologue
    .line 591
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 592
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p2}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 593
    check-cast p0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .end local p0
    invoke-virtual {p0, p2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getIccFileHandlerGemini(I)Lcom/android/internal/telephony/IccFileHandler;

    move-result-object v0

    .line 594
    .local v0, filehandle:Lcom/android/internal/telephony/IccFileHandler;
    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/IccFileHandler;->getPhbRecordInfo(Landroid/os/Message;)V

    .line 599
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getPhbRecordInfo, response:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " slotId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 600
    return-void

    .line 596
    .end local v0           #filehandle:Lcom/android/internal/telephony/IccFileHandler;
    .restart local p0
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/PhoneProxy;

    .end local p0
    invoke-virtual {p0}, Lcom/android/internal/telephony/PhoneProxy;->getIccFileHandler()Lcom/android/internal/telephony/IccFileHandler;

    move-result-object v0

    .line 597
    .restart local v0       #filehandle:Lcom/android/internal/telephony/IccFileHandler;
    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/IccFileHandler;->getPhbRecordInfo(Landroid/os/Message;)V

    goto :goto_0
.end method

.method public static getPhoneType(Lcom/android/internal/telephony/Phone;I)I
    .locals 3
    .parameter "phone"
    .parameter "slotId"

    .prologue
    .line 735
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 736
    const/4 v0, 0x1

    .line 737
    .local v0, phoneType:I
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_0

    instance-of v1, p0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    if-eqz v1, :cond_0

    invoke-static {p1}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 738
    check-cast p0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getPhonebyId(I)Lcom/android/internal/telephony/Phone;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v0

    .line 742
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getPhoneType, slotId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", phoneType:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 743
    return v0

    .line 740
    .restart local p0
    :cond_0
    invoke-interface {p0}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v0

    goto :goto_0
.end method

.method public static getPin2RetryNumber(I)I
    .locals 4
    .parameter "slotId"

    .prologue
    .line 274
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v2

    invoke-static {p0, v2}, Lcom/mediatek/phone/gemini/GeminiUtils;->getIndexInArray(I[I)I

    move-result v0

    .line 275
    .local v0, index:I
    const/4 v1, -0x1

    .line 276
    .local v1, number:I
    if-ltz v0, :cond_0

    .line 277
    sget-object v2, Lcom/mediatek/phone/GeminiConstants;->GSM_SIM_RETRY_PIN2_GEMINI:[Ljava/lang/String;

    aget-object v2, v2, v0

    const/4 v3, -0x1

    invoke-static {v2, v3}, Lcom/mediatek/phone/gemini/GeminiUtils;->getIntSystemProperties(Ljava/lang/String;I)I

    move-result v1

    .line 279
    :cond_0
    return v1
.end method

.method public static getPinRetryNumber(I)I
    .locals 4
    .parameter "slotId"

    .prologue
    .line 265
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v2

    invoke-static {p0, v2}, Lcom/mediatek/phone/gemini/GeminiUtils;->getIndexInArray(I[I)I

    move-result v0

    .line 266
    .local v0, index:I
    const/4 v1, -0x1

    .line 267
    .local v1, number:I
    if-ltz v0, :cond_0

    .line 268
    sget-object v2, Lcom/mediatek/phone/GeminiConstants;->GSM_SIM_RETRY_PIN_GEMINI:[Ljava/lang/String;

    aget-object v2, v2, v0

    const/4 v3, -0x1

    invoke-static {v2, v3}, Lcom/mediatek/phone/gemini/GeminiUtils;->getIntSystemProperties(Ljava/lang/String;I)I

    move-result v1

    .line 270
    :cond_0
    return v1
.end method

.method public static getPuk2RetryNumber(I)I
    .locals 4
    .parameter "slotId"

    .prologue
    .line 283
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v2

    invoke-static {p0, v2}, Lcom/mediatek/phone/gemini/GeminiUtils;->getIndexInArray(I[I)I

    move-result v0

    .line 284
    .local v0, index:I
    const/4 v1, -0x1

    .line 285
    .local v1, number:I
    if-ltz v0, :cond_0

    .line 286
    sget-object v2, Lcom/mediatek/phone/GeminiConstants;->GSM_SIM_RETRY_PUK2_GEMINI:[Ljava/lang/String;

    aget-object v2, v2, v0

    const/4 v3, -0x1

    invoke-static {v2, v3}, Lcom/mediatek/phone/gemini/GeminiUtils;->getIntSystemProperties(Ljava/lang/String;I)I

    move-result v1

    .line 288
    :cond_0
    return v1
.end method

.method public static getSimFdnUri(I)Landroid/net/Uri;
    .locals 3
    .parameter "slotId"

    .prologue
    .line 254
    const/4 v1, 0x0

    .line 255
    .local v1, uri:Landroid/net/Uri;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v2

    invoke-static {p0, v2}, Lcom/mediatek/phone/gemini/GeminiUtils;->getIndexInArray(I[I)I

    move-result v0

    .line 256
    .local v0, index:I
    if-ltz v0, :cond_0

    .line 257
    sget-object v2, Lcom/mediatek/phone/GeminiConstants;->FDN_CONTENT_GEMINI:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 261
    :goto_0
    return-object v1

    .line 259
    :cond_0
    const-string v2, "content://icc/fdn"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    goto :goto_0
.end method

.method public static getSlotByPhoneType(I)I
    .locals 9
    .parameter "phontType"

    .prologue
    .line 355
    const/4 v5, 0x0

    .line 356
    .local v5, slot:I
    const/4 v7, 0x2

    if-eq p0, v7, :cond_0

    const/4 v7, 0x1

    if-ne p0, v7, :cond_1

    .line 358
    :cond_0
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v6

    .line 359
    .local v6, telephony:Landroid/telephony/TelephonyManager;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v1

    .line 360
    .local v1, geminiSlots:[I
    move-object v0, v1

    .local v0, arr$:[I
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_1

    aget v2, v0, v3

    .line 361
    .local v2, gs:I
    invoke-virtual {v6, v2}, Landroid/telephony/TelephonyManager;->getPhoneTypeGemini(I)I

    move-result v7

    if-ne v7, p0, :cond_2

    .line 362
    move v5, v2

    .line 367
    .end local v0           #arr$:[I
    .end local v1           #geminiSlots:[I
    .end local v2           #gs:I
    .end local v3           #i$:I
    .end local v4           #len$:I
    .end local v6           #telephony:Landroid/telephony/TelephonyManager;
    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getSlotByPhoneType with phontType = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " and return slot = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 368
    return v5

    .line 360
    .restart local v0       #arr$:[I
    .restart local v1       #geminiSlots:[I
    .restart local v2       #gs:I
    .restart local v3       #i$:I
    .restart local v4       #len$:I
    .restart local v6       #telephony:Landroid/telephony/TelephonyManager;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public static final getSlotCount()I
    .locals 1

    .prologue
    .line 58
    sget-object v0, Lcom/mediatek/phone/GeminiConstants;->SLOTS:[I

    array-length v0, v0

    return v0
.end method

.method public static getSlotNotIdle(Lcom/android/internal/telephony/Phone;)I
    .locals 8
    .parameter "phone"

    .prologue
    .line 835
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 836
    instance-of v6, p0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    if-eqz v6, :cond_1

    move-object v1, p0

    .line 837
    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 838
    .local v1, gPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v2

    .line 839
    .local v2, geminiSlots:[I
    move-object v0, v2

    .local v0, arr$:[I
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_2

    aget v5, v0, v3

    .line 840
    .local v5, slot:I
    invoke-virtual {v1, v5}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getStateGemini(I)Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v6

    sget-object v7, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v6, v7, :cond_0

    .line 849
    .end local v0           #arr$:[I
    .end local v1           #gPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    .end local v2           #geminiSlots:[I
    .end local v3           #i$:I
    .end local v4           #len$:I
    .end local v5           #slot:I
    :goto_1
    return v5

    .line 839
    .restart local v0       #arr$:[I
    .restart local v1       #gPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    .restart local v2       #geminiSlots:[I
    .restart local v3       #i$:I
    .restart local v4       #len$:I
    .restart local v5       #slot:I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 845
    .end local v0           #arr$:[I
    .end local v1           #gPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    .end local v2           #geminiSlots:[I
    .end local v3           #i$:I
    .end local v4           #len$:I
    .end local v5           #slot:I
    :cond_1
    invoke-interface {p0}, Lcom/android/internal/telephony/Phone;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v6

    sget-object v7, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v6, v7, :cond_2

    .line 846
    const/4 v5, 0x0

    goto :goto_1

    .line 849
    :cond_2
    const/4 v5, -0x1

    goto :goto_1
.end method

.method public static getSlots()[I
    .locals 1

    .prologue
    .line 67
    sget-object v0, Lcom/mediatek/phone/GeminiConstants;->SLOTS:[I

    return-object v0
.end method

.method public static getSmscAddress(Lcom/android/internal/telephony/Phone;Landroid/os/Message;I)V
    .locals 2
    .parameter "phone"
    .parameter "msg"
    .parameter "slotId"

    .prologue
    .line 472
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 473
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getSmscAddress: slotId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 474
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p2}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 475
    check-cast p0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .end local p0
    invoke-virtual {p0, p1, p2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getSmscAddressGemini(Landroid/os/Message;I)V

    .line 479
    :goto_0
    return-void

    .line 477
    .restart local p0
    :cond_0
    invoke-interface {p0, p1}, Lcom/android/internal/telephony/Phone;->getSmscAddress(Landroid/os/Message;)V

    goto :goto_0
.end method

.method private static getSystemProperties(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "key"

    .prologue
    .line 853
    invoke-static {p0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getVTNetworkOperatorName(Lcom/android/internal/telephony/Call;)Ljava/lang/String;
    .locals 6
    .parameter "call"

    .prologue
    .line 184
    const/4 v2, 0x0

    .line 185
    .local v2, operatorName:Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v4

    if-eqz v4, :cond_2

    if-eqz p0, :cond_2

    .line 186
    const/4 v3, -0x1

    .line 187
    .local v3, slot:I
    invoke-static {p0}, Lcom/android/phone/PhoneUtils;->getSimInfoByCall(Lcom/android/internal/telephony/Call;)Landroid/provider/Telephony$SIMInfo;

    move-result-object v1

    .line 188
    .local v1, info:Landroid/provider/Telephony$SIMInfo;
    if-eqz p0, :cond_0

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    if-eq v4, v5, :cond_0

    .line 189
    iget v3, v1, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    .line 191
    :cond_0
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/phone/gemini/GeminiUtils;->getIndexInArray(I[I)I

    move-result v0

    .line 192
    .local v0, index:I
    if-ltz v0, :cond_1

    .line 193
    sget-object v4, Lcom/mediatek/phone/GeminiConstants;->PROPERTY_OPERATOR_ALPHAS:[Ljava/lang/String;

    aget-object v4, v4, v0

    invoke-static {v4}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSystemProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 198
    .end local v0           #index:I
    .end local v1           #info:Landroid/provider/Telephony$SIMInfo;
    .end local v3           #slot:I
    :cond_1
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getVTNetworkOperatorName, operatorName= "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 199
    return-object v2

    .line 196
    :cond_2
    const-string v4, "gsm.operator.alpha"

    invoke-static {v4}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSystemProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static getVoiceMailNumber(I)Ljava/lang/String;
    .locals 2
    .parameter "slotId"

    .prologue
    .line 226
    const/4 v0, 0x0

    .line 227
    .local v0, voiceMailNumber:Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p0}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 230
    invoke-static {}, Lcom/mediatek/telephony/TelephonyManagerEx;->getDefault()Lcom/mediatek/telephony/TelephonyManagerEx;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/mediatek/telephony/TelephonyManagerEx;->getVoiceMailNumber(I)Ljava/lang/String;

    move-result-object v0

    .line 234
    :goto_0
    return-object v0

    .line 232
    :cond_0
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getVoiceMailNumber()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static getVoiceMailNumber(Lcom/android/internal/telephony/Phone;I)Ljava/lang/String;
    .locals 3
    .parameter "phone"
    .parameter "slotId"

    .prologue
    .line 392
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 394
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p1}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 395
    check-cast p0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getVoiceMailNumberGemini(I)Ljava/lang/String;

    move-result-object v0

    .line 399
    .local v0, vmNumber:Ljava/lang/String;
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getVoiceMailNumber : vmNumber:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " slotId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 400
    return-object v0

    .line 397
    .end local v0           #vmNumber:Ljava/lang/String;
    .restart local p0
    :cond_0
    invoke-interface {p0}, Lcom/android/internal/telephony/Phone;->getVoiceMailNumber()Ljava/lang/String;

    move-result-object v0

    .restart local v0       #vmNumber:Ljava/lang/String;
    goto :goto_0
.end method

.method public static handlePinMmi(Lcom/android/internal/telephony/Phone;Ljava/lang/String;I)Z
    .locals 3
    .parameter "phone"
    .parameter "dialString"
    .parameter "slotId"

    .prologue
    .line 453
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 454
    const/4 v0, 0x0

    .line 455
    .local v0, result:Z
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p2}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 456
    check-cast p0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .end local p0
    invoke-virtual {p0, p1, p2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->handlePinMmiGemini(Ljava/lang/String;I)Z

    move-result v0

    .line 460
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "handlePinMmi : result:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " dialString:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", slotId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 461
    return v0

    .line 458
    .restart local p0
    :cond_0
    invoke-interface {p0, p1}, Lcom/android/internal/telephony/Phone;->handlePinMmi(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public static hangupAll(Lcom/android/internal/telephony/Phone;)V
    .locals 9
    .parameter "phone"

    .prologue
    .line 818
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 820
    :try_start_0
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 821
    move-object v0, p0

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    move-object v4, v0

    .line 822
    .local v4, gphone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v3

    .line 823
    .local v3, geminiSlots:[I
    move-object v1, v3

    .local v1, arr$:[I
    array-length v7, v1

    .local v7, len$:I
    const/4 v6, 0x0

    .local v6, i$:I
    :goto_0
    if-ge v6, v7, :cond_1

    aget v5, v1, v6

    .line 824
    .local v5, gs:I
    invoke-virtual {v4, v5}, Lcom/android/internal/telephony/gemini/GeminiPhone;->hangupAllGemini(I)V

    .line 823
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 827
    .end local v1           #arr$:[I
    .end local v3           #geminiSlots:[I
    .end local v4           #gphone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    .end local v5           #gs:I
    .end local v6           #i$:I
    .end local v7           #len$:I
    :cond_0
    invoke-interface {p0}, Lcom/android/internal/telephony/Phone;->hangupAllEx()V
    :try_end_0
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 832
    :cond_1
    :goto_1
    return-void

    .line 829
    :catch_0
    move-exception v2

    .line 830
    .local v2, ex:Lcom/android/internal/telephony/CallStateException;
    const-string v8, "Error, cannot hangup All Calls"

    invoke-static {v8}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public static hasPendingMmi(Lcom/android/internal/telephony/Phone;)Z
    .locals 9
    .parameter "phone"

    .prologue
    .line 795
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 796
    const/4 v6, 0x0

    .line 797
    .local v6, mmiCount:I
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v7

    if-eqz v7, :cond_0

    move-object v2, p0

    .line 798
    check-cast v2, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 799
    .local v2, gphone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v1

    .line 800
    .local v1, geminiSlots:[I
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "hasPendingMmi mmiCount slot size:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    array-length v8, v1

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 801
    move-object v0, v1

    .local v0, arr$:[I
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_1

    aget v3, v0, v4

    .line 802
    .local v3, gs:I
    invoke-virtual {v2, v3}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getPendingMmiCodesGemini(I)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/2addr v6, v7

    .line 801
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 805
    .end local v0           #arr$:[I
    .end local v1           #geminiSlots:[I
    .end local v2           #gphone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    .end local v3           #gs:I
    .end local v4           #i$:I
    .end local v5           #len$:I
    :cond_0
    invoke-interface {p0}, Lcom/android/internal/telephony/Phone;->getPendingMmiCodes()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v6

    .line 807
    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "hasPendingMmi mmiCount="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 808
    if-lez v6, :cond_2

    const/4 v7, 0x1

    :goto_1
    return v7

    :cond_2
    const/4 v7, 0x0

    goto :goto_1
.end method

.method public static isDialing(Lcom/android/internal/telephony/Phone;)Z
    .locals 5
    .parameter "phone"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 695
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 696
    const/4 v0, 0x0

    .line 697
    .local v0, isDialing:Z
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 698
    check-cast p0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .end local p0
    invoke-virtual {p0}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    sget-object v4, Lcom/android/internal/telephony/Call$State;->DIALING:Lcom/android/internal/telephony/Call$State;

    if-ne v3, v4, :cond_0

    move v0, v1

    .line 702
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isDialing, isDialing:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 703
    return v0

    :cond_0
    move v0, v2

    .line 698
    goto :goto_0

    .line 700
    .restart local p0
    :cond_1
    invoke-interface {p0}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    sget-object v4, Lcom/android/internal/telephony/Call$State;->DIALING:Lcom/android/internal/telephony/Call$State;

    if-ne v3, v4, :cond_2

    move v0, v1

    :goto_1
    goto :goto_0

    :cond_2
    move v0, v2

    goto :goto_1
.end method

.method public static isGeminiSupport()Z
    .locals 2

    .prologue
    .line 316
    sget v0, Lcom/mediatek/phone/GeminiConstants;->SOLT_NUM:I

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isPhbReady(Lcom/android/internal/telephony/Phone;I)Z
    .locals 3
    .parameter "phone"
    .parameter "slotId"

    .prologue
    .line 437
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 438
    invoke-static {p0, p1}, Lcom/mediatek/phone/gemini/GeminiUtils;->getIccCard(Lcom/android/internal/telephony/Phone;I)Lcom/android/internal/telephony/IccCard;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/IccCard;->isPhbReady()Z

    move-result v0

    .line 439
    .local v0, isPhbReady:Z
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getIccRecordsLoaded : isPhbReady:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", slotId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 440
    return v0
.end method

.method public static isPhoneBackgroundCallIdle(Lcom/android/internal/telephony/Phone;)Z
    .locals 2
    .parameter "phone"

    .prologue
    .line 526
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 527
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "isPhoneBackgroundCallIdle :"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p0}, Lcom/android/internal/telephony/Phone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 528
    invoke-interface {p0}, Lcom/android/internal/telephony/Phone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v0

    return v0
.end method

.method public static isPhoneForegroundCallIdle(Lcom/android/internal/telephony/Phone;)Z
    .locals 2
    .parameter "phone"

    .prologue
    .line 516
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 517
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "isPhoneForegroundCallIdle :"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p0}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 518
    invoke-interface {p0}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v0

    return v0
.end method

.method public static isPhoneRingingCallIdle(Lcom/android/internal/telephony/Phone;)Z
    .locals 2
    .parameter "phone"

    .prologue
    .line 506
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 507
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "isPhoneRingingCallIdle :"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p0}, Lcom/android/internal/telephony/Phone;->getRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 508
    invoke-interface {p0}, Lcom/android/internal/telephony/Phone;->getRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v0

    return v0
.end method

.method public static isValidSlot(I)Z
    .locals 3
    .parameter "slotId"

    .prologue
    .line 94
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 95
    .local v0, geminiSlots:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 96
    aget v2, v0, v1

    if-ne v2, p0, :cond_0

    .line 97
    const/4 v2, 0x1

    .line 100
    :goto_1
    return v2

    .line 95
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 100
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 862
    const-string v0, "Gemini"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 864
    return-void
.end method

.method public static sendBTSIMProfile(Lcom/android/internal/telephony/Phone;IILjava/lang/String;Landroid/os/Message;I)V
    .locals 6
    .parameter "phone"
    .parameter "action"
    .parameter "type"
    .parameter "data"
    .parameter "callback"
    .parameter "slotId"

    .prologue
    .line 718
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 719
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sendBTSIMProfile, callback:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", slotId:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 720
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p5}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p0

    .line 721
    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/telephony/gemini/GeminiPhone;->sendBTSIMProfileGemini(IILjava/lang/String;Landroid/os/Message;I)V

    .line 725
    :goto_0
    return-void

    .line 723
    :cond_0
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/Phone;->sendBTSIMProfile(IILjava/lang/String;Landroid/os/Message;)V

    goto :goto_0
.end method

.method public static sendUssdResponse(Lcom/android/internal/telephony/Phone;Ljava/lang/String;I)V
    .locals 2
    .parameter "phone"
    .parameter "text"
    .parameter "slotId"

    .prologue
    .line 755
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 756
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sendUssdResponse, text:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", slotId:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 757
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p2}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 758
    check-cast p0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .end local p0
    invoke-virtual {p0, p1, p2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->sendUssdResponseGemini(Ljava/lang/String;I)V

    .line 762
    :goto_0
    return-void

    .line 760
    .restart local p0
    :cond_0
    invoke-interface {p0, p1}, Lcom/android/internal/telephony/Phone;->sendUssdResponse(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static setPreferredNetworkType(Lcom/android/internal/telephony/Phone;ILandroid/os/Message;I)V
    .locals 2
    .parameter "phone"
    .parameter "modemNetworkMode"
    .parameter "msg"
    .parameter "slotId"

    .prologue
    .line 679
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 680
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p3}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 681
    check-cast p0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .end local p0
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setPreferredNetworkTypeGemini(ILandroid/os/Message;I)V

    .line 685
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setPreferredNetworkType, modemNetworkMode:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " slotId:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 686
    return-void

    .line 683
    .restart local p0
    :cond_0
    invoke-interface {p0, p1, p2}, Lcom/android/internal/telephony/Phone;->setPreferredNetworkType(ILandroid/os/Message;)V

    goto :goto_0
.end method

.method public static setRadioMode(Lcom/android/internal/telephony/Phone;ZLandroid/content/ContentResolver;)V
    .locals 3
    .parameter "phone"
    .parameter "isRadioOn"
    .parameter "contentResolver"

    .prologue
    .line 633
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 634
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 635
    const/4 v0, 0x0

    .line 636
    .local v0, dualSimModeSetting:I
    if-nez p1, :cond_0

    if-eqz p2, :cond_0

    .line 637
    const-string v1, "dual_sim_mode_setting"

    const/4 v2, 0x3

    invoke-static {p2, v1, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 640
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .end local p0
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setRadioMode(I)V

    .line 641
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setRadioPower, isRadioOn:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", dualSimModeSetting:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 646
    .end local v0           #dualSimModeSetting:I
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setRadioPower, isRadioOn:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 647
    return-void

    .line 644
    .restart local p0
    :cond_1
    if-nez p1, :cond_2

    const/4 v1, 0x1

    :goto_1
    invoke-interface {p0, v1}, Lcom/android/internal/telephony/Phone;->setRadioPower(Z)V

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public static setRadioPowerOFF(Lcom/android/internal/telephony/Phone;)V
    .locals 2
    .parameter "phone"

    .prologue
    .line 659
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 660
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 661
    check-cast p0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .end local p0
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setRadioMode(I)V

    .line 665
    :goto_0
    const-string v0, "setRadioPowerOFF"

    invoke-static {v0}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 666
    return-void

    .line 663
    .restart local p0
    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Lcom/android/internal/telephony/Phone;->setRadioPower(ZZ)V

    goto :goto_0
.end method

.method public static setSmscAddress(Lcom/android/internal/telephony/Phone;Ljava/lang/String;Landroid/os/Message;I)V
    .locals 2
    .parameter "phone"
    .parameter "scAddr"
    .parameter "msg"
    .parameter "slotId"

    .prologue
    .line 490
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 491
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setSmscAddress: slotId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 492
    invoke-static {p3}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 493
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 494
    check-cast p0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .end local p0
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setSmscAddressGemini(Ljava/lang/String;Landroid/os/Message;I)V

    .line 499
    :cond_0
    :goto_0
    return-void

    .line 496
    .restart local p0
    :cond_1
    invoke-interface {p0, p1, p2}, Lcom/android/internal/telephony/Phone;->setSmscAddress(Ljava/lang/String;Landroid/os/Message;)V

    goto :goto_0
.end method

.method public static startQueryGemini(ILandroid/content/Context;Ljava/lang/String;Lcom/android/internal/telephony/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;IZ)Lcom/android/internal/telephony/CallerInfoAsyncQuery;
    .locals 2
    .parameter "token"
    .parameter "context"
    .parameter "number"
    .parameter "listener"
    .parameter "cookie"
    .parameter "simId"
    .parameter "isSipPhone"

    .prologue
    .line 336
    const/4 v0, 0x0

    .line 337
    .local v0, asyncQuery:Lcom/android/internal/telephony/CallerInfoAsyncQuery;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_0

    if-nez p6, :cond_0

    .line 338
    invoke-static/range {p0 .. p5}, Lcom/android/internal/telephony/CallerInfoAsyncQuery;->startQueryGemini(ILandroid/content/Context;Ljava/lang/String;Lcom/android/internal/telephony/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;I)Lcom/android/internal/telephony/CallerInfoAsyncQuery;

    move-result-object v0

    .line 344
    :goto_0
    return-object v0

    .line 342
    :cond_0
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/CallerInfoAsyncQuery;->startQuery(ILandroid/content/Context;Ljava/lang/String;Lcom/android/internal/telephony/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;)Lcom/android/internal/telephony/CallerInfoAsyncQuery;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public getGateway(Lcom/android/internal/telephony/Phone;Ljava/lang/String;I)Ljava/lang/String;
    .locals 3
    .parameter "phone"
    .parameter "apnType"
    .parameter "slotId"

    .prologue
    .line 574
    invoke-static {p1}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 575
    const/4 v0, 0x0

    .line 576
    .local v0, gateWay:Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p3}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 577
    check-cast p1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .end local p1
    invoke-virtual {p1, p2, p3}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getGatewayGemini(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 581
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getGateway, gateWay:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " apnType:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", slotId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 582
    return-object v0

    .line 579
    .restart local p1
    :cond_0
    invoke-interface {p1, p2}, Lcom/android/internal/telephony/Phone;->getGateway(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getInterfaceName(Lcom/android/internal/telephony/Phone;Ljava/lang/String;I)Ljava/lang/String;
    .locals 3
    .parameter "phone"
    .parameter "apnType"
    .parameter "slotId"

    .prologue
    .line 540
    invoke-static {p1}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 541
    const/4 v0, 0x0

    .line 543
    .local v0, interfaceName:Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p3}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 544
    check-cast p1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .end local p1
    invoke-virtual {p1, p2, p3}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getInterfaceNameGemini(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 548
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getGateway, interfaceName:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " apnType:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", slotId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 550
    return-object v0

    .line 546
    .restart local p1
    :cond_0
    invoke-interface {p1, p2}, Lcom/android/internal/telephony/Phone;->getInterfaceName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getIpAddress(Lcom/android/internal/telephony/Phone;Ljava/lang/String;I)Ljava/lang/String;
    .locals 3
    .parameter "phone"
    .parameter "apnType"
    .parameter "slotId"

    .prologue
    .line 554
    invoke-static {p1}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 555
    const/4 v0, 0x0

    .line 556
    .local v0, ipAddr:Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p3}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 557
    check-cast p1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .end local p1
    invoke-virtual {p1, p2, p3}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getIpAddressGemini(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 561
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getGateway, ipAddr:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " apnType:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", slotId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/gemini/GeminiUtils;->log(Ljava/lang/String;)V

    .line 562
    return-object v0

    .line 559
    .restart local p1
    :cond_0
    invoke-interface {p1, p2}, Lcom/android/internal/telephony/Phone;->getIpAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
