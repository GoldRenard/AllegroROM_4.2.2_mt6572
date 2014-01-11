.class public Lcom/mediatek/phone/gemini/GeminiRegister;
.super Ljava/lang/Object;
.source "GeminiRegister.java"


# static fields
.field private static final DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "GeminiRegister"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dial(Ljava/lang/Object;Lcom/android/internal/telephony/Phone;Ljava/lang/String;I)Lcom/android/internal/telephony/Connection;
    .locals 7
    .parameter "callManager"
    .parameter "phone"
    .parameter "numberToDial"
    .parameter "slotId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 954
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 955
    invoke-static {p1}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 956
    invoke-interface {p1}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v4

    const/4 v5, 0x3

    if-ne v4, v5, :cond_1

    const/4 v3, 0x1

    .line 957
    .local v3, isSipPhone:Z
    :goto_0
    const/4 v0, 0x0

    .line 959
    .local v0, connection:Lcom/android/internal/telephony/Connection;
    :try_start_0
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v4

    if-eqz v4, :cond_2

    if-nez v3, :cond_2

    .line 960
    move v1, p3

    .line 961
    .local v1, dialSlot:I
    invoke-static {p3}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v4

    if-nez v4, :cond_0

    .line 962
    const-string v4, "persist.radio.default_sim"

    const/4 v5, -0x1

    invoke-static {v4, v5}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 964
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .end local p0
    invoke-virtual {p0, p1, p2, v1}, Lcom/android/internal/telephony/gemini/MTKCallManager;->dialGemini(Lcom/android/internal/telephony/Phone;Ljava/lang/String;I)Lcom/android/internal/telephony/Connection;

    move-result-object v0

    .line 973
    .end local v1           #dialSlot:I
    :goto_1
    return-object v0

    .line 956
    .end local v0           #connection:Lcom/android/internal/telephony/Connection;
    .end local v3           #isSipPhone:Z
    .restart local p0
    :cond_1
    const/4 v3, 0x0

    goto :goto_0

    .line 967
    .restart local v0       #connection:Lcom/android/internal/telephony/Connection;
    .restart local v3       #isSipPhone:Z
    :cond_2
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1, p2}, Lcom/android/internal/telephony/CallManager;->dial(Lcom/android/internal/telephony/Phone;Ljava/lang/String;)Lcom/android/internal/telephony/Connection;
    :try_end_0
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_1

    .line 969
    :catch_0
    move-exception v2

    .line 970
    .local v2, ex:Lcom/android/internal/telephony/CallStateException;
    new-instance v4, Lcom/android/internal/telephony/CallStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "cannot dial, numberToDial:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", slotId:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/android/internal/telephony/CallStateException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public static getSlotIdByRegisterEvent(I[I)I
    .locals 3
    .parameter "value"
    .parameter "array"

    .prologue
    const/4 v2, -0x1

    .line 895
    invoke-static {p1}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 896
    invoke-static {p0, p1}, Lcom/mediatek/phone/gemini/GeminiUtils;->getIndexInArray(I[I)I

    move-result v1

    .line 897
    .local v1, index:I
    if-eq v1, v2, :cond_0

    .line 898
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 899
    .local v0, geminiSlots:[I
    aget v2, v0, v1

    .line 901
    .end local v0           #geminiSlots:[I
    :cond_0
    return v2
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 978
    const-string v0, "GeminiRegister"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 980
    return-void
.end method

.method public static pickBestSlotForEmergencyCall(Lcom/android/internal/telephony/Phone;Ljava/lang/String;)I
    .locals 8
    .parameter "phone"
    .parameter "number"

    .prologue
    .line 913
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 914
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v6

    if-eqz v6, :cond_3

    move-object v1, p0

    .line 915
    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 916
    .local v1, gPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v2

    .line 917
    .local v2, geminiSlots:[I
    array-length v0, v2

    .line 918
    .local v0, count:I
    new-array v4, v0, [Z

    .line 919
    .local v4, isRadioOn:[Z
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v0, :cond_1

    .line 920
    aget v6, v2, v3

    invoke-virtual {v1, v6}, Lcom/android/internal/telephony/gemini/GeminiPhone;->isRadioOnGemini(I)Z

    move-result v6

    aput-boolean v6, v4, v3

    .line 921
    aget v6, v2, v3

    invoke-virtual {v1, v6}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getServiceStateGemini(I)Landroid/telephony/ServiceState;

    move-result-object v6

    invoke-virtual {v6}, Landroid/telephony/ServiceState;->getState()I

    move-result v5

    .line 922
    .local v5, state:I
    aget-boolean v6, v4, v3

    if-eqz v6, :cond_0

    if-nez v5, :cond_0

    .line 924
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "pickBestSlotForEmergencyCallm, radio on & in service, slot:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget v7, v2, v3

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/mediatek/phone/gemini/GeminiRegister;->log(Ljava/lang/String;)V

    .line 926
    aget v6, v2, v3

    .line 938
    .end local v0           #count:I
    .end local v1           #gPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    .end local v2           #geminiSlots:[I
    .end local v3           #i:I
    .end local v4           #isRadioOn:[Z
    .end local v5           #state:I
    :goto_1
    return v6

    .line 919
    .restart local v0       #count:I
    .restart local v1       #gPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    .restart local v2       #geminiSlots:[I
    .restart local v3       #i:I
    .restart local v4       #isRadioOn:[Z
    .restart local v5       #state:I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 929
    .end local v5           #state:I
    :cond_1
    const/4 v3, 0x0

    :goto_2
    if-ge v3, v0, :cond_3

    .line 930
    aget-boolean v6, v4, v3

    if-eqz v6, :cond_2

    .line 932
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "pickBestSlotForEmergencyCallm, radio on, slot:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget v7, v2, v3

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/mediatek/phone/gemini/GeminiRegister;->log(Ljava/lang/String;)V

    .line 933
    aget v6, v2, v3

    goto :goto_1

    .line 929
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 937
    .end local v0           #count:I
    .end local v1           #gPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    .end local v2           #geminiSlots:[I
    .end local v3           #i:I
    .end local v4           #isRadioOn:[Z
    :cond_3
    const-string v6, "pickBestSlotForEmergencyCallm, no gemini"

    invoke-static {v6}, Lcom/mediatek/phone/gemini/GeminiRegister;->log(Ljava/lang/String;)V

    .line 938
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getDefaultSlot()I

    move-result v6

    goto :goto_1
.end method

.method public static registerForCrssSuppServiceNotification(Ljava/lang/Object;Landroid/os/Handler;I)V
    .locals 5
    .parameter "callManager"
    .parameter "handler"
    .parameter "what"

    .prologue
    const/4 v4, 0x0

    .line 649
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 650
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    .line 651
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .local v0, geminiSlots:[I
    move-object v2, p0

    .line 652
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 653
    .local v2, mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 654
    aget v3, v0, v1

    invoke-virtual {v2, p1, p2, v4, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->registerForCrssSuppServiceNotificationGemini(Landroid/os/Handler;ILjava/lang/Object;I)V

    .line 653
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 658
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1, p2, v4}, Lcom/android/internal/telephony/CallManager;->registerForCrssSuppServiceNotification(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 660
    :cond_1
    return-void
.end method

.method public static registerForDisconnect(Ljava/lang/Object;Landroid/os/Handler;I)V
    .locals 5
    .parameter "callManager"
    .parameter "handler"
    .parameter "what"

    .prologue
    .line 79
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v1

    .line 80
    .local v1, geminiSlots:[I
    array-length v0, v1

    .line 81
    .local v0, count:I
    new-array v3, v0, [I

    .line 82
    .local v3, whats:[I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v4, v3

    if-ge v2, v4, :cond_0

    .line 83
    aput p2, v3, v2

    .line 82
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 85
    :cond_0
    invoke-static {p0, p1, v3}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForDisconnect(Ljava/lang/Object;Landroid/os/Handler;[I)V

    .line 86
    return-void
.end method

.method public static registerForDisconnect(Ljava/lang/Object;Landroid/os/Handler;[I)V
    .locals 7
    .parameter "callManager"
    .parameter "handler"
    .parameter "whats"

    .prologue
    const/4 v6, 0x0

    const/4 v3, 0x0

    .line 101
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 102
    instance-of v4, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v4, :cond_1

    move-object v2, p0

    .line 103
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 104
    .local v2, mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 106
    .local v0, geminiSlots:[I
    array-length v4, p2

    array-length v5, v0

    if-lt v4, v5, :cond_0

    const/4 v3, 0x1

    :cond_0
    invoke-static {v3}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 108
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_2

    .line 109
    aget v3, p2, v1

    aget v4, v0, v1

    invoke-virtual {v2, p1, v3, v6, v4}, Lcom/android/internal/telephony/gemini/MTKCallManager;->registerForDisconnectGemini(Landroid/os/Handler;ILjava/lang/Object;I)V

    .line 108
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 112
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_1
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    aget v3, p2, v3

    invoke-virtual {p0, p1, v3, v6}, Lcom/android/internal/telephony/CallManager;->registerForDisconnect(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 114
    :cond_2
    return-void
.end method

.method public static registerForIncomingRing(Ljava/lang/Object;Landroid/os/Handler;I)V
    .locals 5
    .parameter "callManager"
    .parameter "handler"
    .parameter "what"

    .prologue
    const/4 v4, 0x0

    .line 247
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 248
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    move-object v2, p0

    .line 249
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 250
    .local v2, mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 251
    .local v0, geminiSlots:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 252
    aget v3, v0, v1

    invoke-virtual {v2, p1, p2, v4, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->registerForIncomingRingGemini(Landroid/os/Handler;ILjava/lang/Object;I)V

    .line 251
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 255
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1, p2, v4}, Lcom/android/internal/telephony/CallManager;->registerForIncomingRing(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 257
    :cond_1
    return-void
.end method

.method public static registerForMmiComplete(Ljava/lang/Object;Landroid/os/Handler;[I)V
    .locals 7
    .parameter "callManager"
    .parameter "handler"
    .parameter "whats"

    .prologue
    const/4 v6, 0x0

    const/4 v3, 0x0

    .line 568
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 569
    instance-of v4, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v4, :cond_1

    .line 570
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .local v0, geminiSlots:[I
    move-object v2, p0

    .line 571
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 573
    .local v2, mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    array-length v4, p2

    array-length v5, v0

    if-lt v4, v5, :cond_0

    const/4 v3, 0x1

    :cond_0
    invoke-static {v3}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 575
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_2

    .line 576
    aget v3, p2, v1

    aget v4, v0, v1

    invoke-virtual {v2, p1, v3, v6, v4}, Lcom/android/internal/telephony/gemini/MTKCallManager;->registerForMmiCompleteGemini(Landroid/os/Handler;ILjava/lang/Object;I)V

    .line 575
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 579
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_1
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    aget v3, p2, v3

    invoke-virtual {p0, p1, v3, v6}, Lcom/android/internal/telephony/CallManager;->registerForMmiComplete(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 581
    :cond_2
    return-void
.end method

.method public static registerForMmiInitiate(Ljava/lang/Object;Landroid/os/Handler;[I)V
    .locals 7
    .parameter "callManager"
    .parameter "handler"
    .parameter "whats"

    .prologue
    const/4 v6, 0x0

    const/4 v3, 0x0

    .line 608
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 609
    instance-of v4, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v4, :cond_1

    .line 610
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .local v0, geminiSlots:[I
    move-object v2, p0

    .line 611
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 613
    .local v2, mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    array-length v4, p2

    array-length v5, v0

    if-lt v4, v5, :cond_0

    const/4 v3, 0x1

    :cond_0
    invoke-static {v3}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 615
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_2

    .line 616
    aget v3, p2, v1

    aget v4, v0, v1

    invoke-virtual {v2, p1, v3, v6, v4}, Lcom/android/internal/telephony/gemini/MTKCallManager;->registerForMmiInitiateGemini(Landroid/os/Handler;ILjava/lang/Object;I)V

    .line 615
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 619
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_1
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    aget v3, p2, v3

    invoke-virtual {p0, p1, v3, v6}, Lcom/android/internal/telephony/CallManager;->registerForMmiInitiate(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 621
    :cond_2
    return-void
.end method

.method public static registerForNetworkLocked(Lcom/android/internal/telephony/Phone;Landroid/os/Handler;[I)V
    .locals 5
    .parameter "phone"
    .parameter "handler"
    .parameter "whats"

    .prologue
    .line 874
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 875
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 877
    .local v0, geminiSlots:[I
    array-length v3, p2

    array-length v4, v0

    if-lt v3, v4, :cond_1

    const/4 v3, 0x1

    :goto_0
    invoke-static {v3}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 879
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v3, v0

    if-ge v1, v3, :cond_2

    .line 880
    aget v3, v0, v1

    invoke-static {p0, v3}, Lcom/mediatek/phone/gemini/GeminiUtils;->getIccCard(Lcom/android/internal/telephony/Phone;I)Lcom/android/internal/telephony/IccCard;

    move-result-object v2

    .line 881
    .local v2, iccCard:Lcom/android/internal/telephony/IccCard;
    if-eqz v2, :cond_0

    .line 882
    aget v3, p2, v1

    const/4 v4, 0x0

    invoke-interface {v2, p1, v3, v4}, Lcom/android/internal/telephony/IccCard;->registerForNetworkLocked(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 879
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 877
    .end local v1           #i:I
    .end local v2           #iccCard:Lcom/android/internal/telephony/IccCard;
    :cond_1
    const/4 v3, 0x0

    goto :goto_0

    .line 885
    .restart local v1       #i:I
    :cond_2
    return-void
.end method

.method public static registerForNewRingingConnection(Ljava/lang/Object;Landroid/os/Handler;I)V
    .locals 5
    .parameter "callManager"
    .parameter "handler"
    .parameter "what"

    .prologue
    const/4 v4, 0x0

    .line 40
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 41
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    move-object v2, p0

    .line 42
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 43
    .local v2, mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 44
    .local v0, geminiSlots:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 45
    aget v3, v0, v1

    invoke-virtual {v2, p1, p2, v4, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->registerForNewRingingConnectionGemini(Landroid/os/Handler;ILjava/lang/Object;I)V

    .line 44
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 48
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1, p2, v4}, Lcom/android/internal/telephony/CallManager;->registerForNewRingingConnection(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 50
    :cond_1
    return-void
.end method

.method public static registerForPostDialCharacter(Ljava/lang/Object;Landroid/os/Handler;I)V
    .locals 5
    .parameter "callManager"
    .parameter "handler"
    .parameter "what"

    .prologue
    const/4 v4, 0x0

    .line 688
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 689
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    .line 690
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .local v0, geminiSlots:[I
    move-object v2, p0

    .line 691
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 692
    .local v2, mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 693
    aget v3, v0, v1

    invoke-virtual {v2, p1, p2, v4, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->registerForPostDialCharacterGemini(Landroid/os/Handler;ILjava/lang/Object;I)V

    .line 692
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 696
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1, p2, v4}, Lcom/android/internal/telephony/CallManager;->registerForPostDialCharacter(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 698
    :cond_1
    return-void
.end method

.method public static registerForPreciseCallStateChanged(Ljava/lang/Object;Landroid/os/Handler;I)V
    .locals 1
    .parameter "callManager"
    .parameter "handler"
    .parameter "what"

    .prologue
    .line 145
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForPreciseCallStateChanged(Ljava/lang/Object;Landroid/os/Handler;ILjava/lang/Object;)V

    .line 146
    return-void
.end method

.method public static registerForPreciseCallStateChanged(Ljava/lang/Object;Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 4
    .parameter "callManager"
    .parameter "handler"
    .parameter "what"
    .parameter "obj"

    .prologue
    .line 163
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 164
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    move-object v2, p0

    .line 165
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 166
    .local v2, mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 167
    .local v0, geminiSlots:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 168
    aget v3, v0, v1

    invoke-virtual {v2, p1, p2, p3, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->registerForPreciseCallStateChangedGemini(Landroid/os/Handler;ILjava/lang/Object;I)V

    .line 167
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 171
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/internal/telephony/CallManager;->registerForPreciseCallStateChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 173
    :cond_1
    return-void
.end method

.method public static registerForRingbackTone(Ljava/lang/Object;Landroid/os/Handler;I)V
    .locals 8
    .parameter "callManager"
    .parameter "handler"
    .parameter "what"

    .prologue
    const/4 v7, 0x0

    .line 291
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 292
    instance-of v6, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v6, :cond_0

    move-object v5, p0

    .line 293
    check-cast v5, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 294
    .local v5, mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v1

    .line 295
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

    .line 296
    .local v2, gs:I
    invoke-virtual {v5, p1, p2, v7, v2}, Lcom/android/internal/telephony/gemini/MTKCallManager;->registerForRingbackToneGemini(Landroid/os/Handler;ILjava/lang/Object;I)V

    .line 295
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 299
    .end local v0           #arr$:[I
    .end local v1           #geminiSlots:[I
    .end local v2           #gs:I
    .end local v3           #i$:I
    .end local v4           #len$:I
    .end local v5           #mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1, p2, v7}, Lcom/android/internal/telephony/CallManager;->registerForRingbackTone(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 301
    :cond_1
    return-void
.end method

.method public static registerForServiceStateChanged(Lcom/android/internal/telephony/Phone;Landroid/os/Handler;[I)V
    .locals 7
    .parameter "phone"
    .parameter "handler"
    .parameter "whats"

    .prologue
    const/4 v6, 0x0

    const/4 v3, 0x0

    .line 511
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 512
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v4

    if-eqz v4, :cond_1

    move-object v0, p0

    .line 513
    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 514
    .local v0, gPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v1

    .line 516
    .local v1, geminiSlots:[I
    array-length v4, p2

    array-length v5, v1

    if-lt v4, v5, :cond_0

    const/4 v3, 0x1

    :cond_0
    invoke-static {v3}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 518
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_2

    .line 519
    aget v3, v1, v2

    invoke-virtual {v0, p1, v3}, Lcom/android/internal/telephony/gemini/GeminiPhone;->unregisterForServiceStateChangedGemini(Landroid/os/Handler;I)V

    .line 520
    aget v3, p2, v2

    aget v4, v1, v2

    invoke-virtual {v0, p1, v3, v6, v4}, Lcom/android/internal/telephony/gemini/GeminiPhone;->registerForServiceStateChangedGemini(Landroid/os/Handler;ILjava/lang/Object;I)V

    .line 518
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 526
    .end local v0           #gPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    .end local v1           #geminiSlots:[I
    .end local v2           #i:I
    :cond_1
    invoke-interface {p0, p1}, Lcom/android/internal/telephony/Phone;->unregisterForServiceStateChanged(Landroid/os/Handler;)V

    .line 527
    aget v3, p2, v3

    invoke-interface {p0, p1, v3, v6}, Lcom/android/internal/telephony/Phone;->registerForServiceStateChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 529
    :cond_2
    return-void
.end method

.method public static registerForSpeechInfo(Ljava/lang/Object;Landroid/os/Handler;I)V
    .locals 4
    .parameter "callManager"
    .parameter "handler"
    .parameter "what"

    .prologue
    .line 802
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v1

    .line 803
    .local v1, geminiSlots:[I
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlotCount()I

    move-result v0

    .line 804
    .local v0, count:I
    new-array v3, v0, [I

    .line 805
    .local v3, whats:[I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 806
    aput p2, v3, v2

    .line 805
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 808
    :cond_0
    invoke-static {p0, p1, v3}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForSpeechInfo(Ljava/lang/Object;Landroid/os/Handler;[I)V

    .line 809
    return-void
.end method

.method public static registerForSpeechInfo(Ljava/lang/Object;Landroid/os/Handler;[I)V
    .locals 7
    .parameter "callManager"
    .parameter "handler"
    .parameter "whats"

    .prologue
    const/4 v6, 0x0

    const/4 v3, 0x0

    .line 818
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 819
    instance-of v4, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v4, :cond_1

    .line 820
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .local v0, geminiSlots:[I
    move-object v2, p0

    .line 821
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 823
    .local v2, mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    array-length v4, p2

    array-length v5, v0

    if-lt v4, v5, :cond_0

    const/4 v3, 0x1

    :cond_0
    invoke-static {v3}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 825
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_2

    .line 826
    aget v3, p2, v1

    aget v4, v0, v1

    invoke-virtual {v2, p1, v3, v6, v4}, Lcom/android/internal/telephony/gemini/MTKCallManager;->registerForSpeechInfoGemini(Landroid/os/Handler;ILjava/lang/Object;I)V

    .line 825
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 829
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_1
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    aget v3, p2, v3

    invoke-virtual {p0, p1, v3, v6}, Lcom/android/internal/telephony/CallManager;->registerForSpeechInfo(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 831
    :cond_2
    return-void
.end method

.method public static registerForSuppServiceFailed(Ljava/lang/Object;Landroid/os/Handler;I)V
    .locals 5
    .parameter "callManager"
    .parameter "handler"
    .parameter "what"

    .prologue
    const/4 v4, 0x0

    .line 727
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 728
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    .line 729
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .local v0, geminiSlots:[I
    move-object v2, p0

    .line 730
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 731
    .local v2, mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 732
    aget v3, v0, v1

    invoke-virtual {v2, p1, p2, v4, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->registerForSuppServiceFailedGemini(Landroid/os/Handler;ILjava/lang/Object;I)V

    .line 731
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 735
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1, p2, v4}, Lcom/android/internal/telephony/CallManager;->registerForSuppServiceFailed(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 737
    :cond_1
    return-void
.end method

.method public static registerForSuppServiceNotification(Ljava/lang/Object;Landroid/os/Handler;I)V
    .locals 5
    .parameter "callManager"
    .parameter "handler"
    .parameter "what"

    .prologue
    const/4 v4, 0x0

    .line 765
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 766
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    .line 767
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .local v0, geminiSlots:[I
    move-object v2, p0

    .line 768
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 769
    .local v2, mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 770
    aget v3, v0, v1

    invoke-virtual {v2, p1, p2, v4, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->registerForSuppServiceNotificationGemini(Landroid/os/Handler;ILjava/lang/Object;I)V

    .line 769
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 773
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1, p2, v4}, Lcom/android/internal/telephony/CallManager;->registerForSuppServiceNotification(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 775
    :cond_1
    return-void
.end method

.method public static registerForUnknownConnection(Ljava/lang/Object;Landroid/os/Handler;I)V
    .locals 5
    .parameter "callManager"
    .parameter "handler"
    .parameter "what"

    .prologue
    const/4 v4, 0x0

    .line 205
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 206
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    move-object v2, p0

    .line 207
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 208
    .local v2, mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 209
    .local v0, geminiSlots:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 210
    aget v3, v0, v1

    invoke-virtual {v2, p1, p2, v4, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->registerForUnknownConnectionGemini(Landroid/os/Handler;ILjava/lang/Object;I)V

    .line 209
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 213
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1, p2, v4}, Lcom/android/internal/telephony/CallManager;->registerForUnknownConnection(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 215
    :cond_1
    return-void
.end method

.method public static registerForVtReplaceDisconnect(Ljava/lang/Object;Landroid/os/Handler;I)V
    .locals 0
    .parameter "callManager"
    .parameter "handler"
    .parameter "what"

    .prologue
    .line 427
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 446
    return-void
.end method

.method public static registerForVtRingInfo(Ljava/lang/Object;Landroid/os/Handler;I)V
    .locals 0
    .parameter "callManager"
    .parameter "handler"
    .parameter "ringInfo"

    .prologue
    .line 330
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 349
    return-void
.end method

.method public static registerForVtStatusInfo(Ljava/lang/Object;Landroid/os/Handler;I)V
    .locals 0
    .parameter "callManager"
    .parameter "handler"
    .parameter "statusInfo"

    .prologue
    .line 379
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 398
    return-void
.end method

.method public static unregisterForCrssSuppServiceNotification(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 4
    .parameter "callManager"
    .parameter "handler"

    .prologue
    .line 669
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 670
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    .line 671
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .local v0, geminiSlots:[I
    move-object v2, p0

    .line 672
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 673
    .local v2, mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 674
    aget v3, v0, v1

    invoke-virtual {v2, p1, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForCrssSuppServiceNotificationGemini(Landroid/os/Handler;I)V

    .line 673
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 677
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CallManager;->unregisterForCrssSuppServiceNotification(Landroid/os/Handler;)V

    .line 679
    :cond_1
    return-void
.end method

.method public static unregisterForDisconnect(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 4
    .parameter "callManager"
    .parameter "handler"

    .prologue
    .line 124
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 125
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    move-object v2, p0

    .line 126
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 127
    .local v2, mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 128
    .local v0, geminiSlots:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 129
    aget v3, v0, v1

    invoke-virtual {v2, p1, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForDisconnectGemini(Landroid/os/Handler;I)V

    .line 128
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 132
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CallManager;->unregisterForDisconnect(Landroid/os/Handler;)V

    .line 134
    :cond_1
    return-void
.end method

.method public static unregisterForInCallVoicePrivacyOff(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 4
    .parameter "callManager"
    .parameter "handler"

    .prologue
    .line 492
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 493
    instance-of v2, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v2, :cond_0

    .line 494
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 495
    .local v0, geminiSlots:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    move-object v2, p0

    .line 496
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    aget v3, v0, v1

    invoke-virtual {v2, p1, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForInCallVoicePrivacyOffGemini(Landroid/os/Handler;I)V

    .line 495
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 500
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CallManager;->unregisterForInCallVoicePrivacyOff(Landroid/os/Handler;)V

    .line 502
    :cond_1
    return-void
.end method

.method public static unregisterForInCallVoicePrivacyOn(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 4
    .parameter "callManager"
    .parameter "handler"

    .prologue
    .line 474
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 475
    instance-of v2, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v2, :cond_0

    .line 476
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 477
    .local v0, geminiSlots:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    move-object v2, p0

    .line 478
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    aget v3, v0, v1

    invoke-virtual {v2, p1, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForInCallVoicePrivacyOnGemini(Landroid/os/Handler;I)V

    .line 477
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 482
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CallManager;->unregisterForInCallVoicePrivacyOn(Landroid/os/Handler;)V

    .line 484
    :cond_1
    return-void
.end method

.method public static unregisterForIncomingRing(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 4
    .parameter "callManager"
    .parameter "handler"

    .prologue
    .line 267
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 268
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    move-object v2, p0

    .line 269
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 270
    .local v2, mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 271
    .local v0, geminiSlots:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 272
    aget v3, v0, v1

    invoke-virtual {v2, p1, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForIncomingRingGemini(Landroid/os/Handler;I)V

    .line 271
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 275
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CallManager;->unregisterForIncomingRing(Landroid/os/Handler;)V

    .line 277
    :cond_1
    return-void
.end method

.method public static unregisterForMmiComplete(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 4
    .parameter "callManager"
    .parameter "handler"

    .prologue
    .line 589
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 590
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    .line 591
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .local v0, geminiSlots:[I
    move-object v2, p0

    .line 592
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 593
    .local v2, mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 594
    aget v3, v0, v1

    invoke-virtual {v2, p1, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForMmiCompleteGemini(Landroid/os/Handler;I)V

    .line 593
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 597
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CallManager;->unregisterForMmiComplete(Landroid/os/Handler;)V

    .line 599
    :cond_1
    return-void
.end method

.method public static unregisterForMmiInitiate(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 4
    .parameter "callManager"
    .parameter "handler"

    .prologue
    .line 629
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 630
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    .line 631
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .local v0, geminiSlots:[I
    move-object v2, p0

    .line 632
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 633
    .local v2, mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 634
    aget v3, v0, v1

    invoke-virtual {v2, p1, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForMmiInitiateGemini(Landroid/os/Handler;I)V

    .line 633
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 637
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CallManager;->unregisterForMmiInitiate(Landroid/os/Handler;)V

    .line 639
    :cond_1
    return-void
.end method

.method public static unregisterForNewRingingConnection(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 4
    .parameter "callManager"
    .parameter "handler"

    .prologue
    .line 60
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 61
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    move-object v2, p0

    .line 62
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 63
    .local v2, mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 64
    .local v0, geminiSlots:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 65
    aget v3, v0, v1

    invoke-virtual {v2, p1, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForNewRingingConnectionGemini(Landroid/os/Handler;I)V

    .line 64
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 68
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CallManager;->unregisterForNewRingingConnection(Landroid/os/Handler;)V

    .line 70
    :cond_1
    return-void
.end method

.method public static unregisterForPostDialCharacter(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 4
    .parameter "callManager"
    .parameter "handler"

    .prologue
    .line 706
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 707
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    .line 708
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .local v0, geminiSlots:[I
    move-object v2, p0

    .line 709
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 710
    .local v2, mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 711
    aget v3, v0, v1

    invoke-virtual {v2, p1, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForPostDialCharacterGemini(Landroid/os/Handler;I)V

    .line 710
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 714
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CallManager;->unregisterForPostDialCharacter(Landroid/os/Handler;)V

    .line 716
    :cond_1
    return-void
.end method

.method public static unregisterForPreciseCallStateChanged(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 4
    .parameter "callManager"
    .parameter "handler"

    .prologue
    .line 183
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 184
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    move-object v2, p0

    .line 185
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 186
    .local v2, mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 187
    .local v0, geminiSlots:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 188
    aget v3, v0, v1

    invoke-virtual {v2, p1, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForPreciseCallStateChangedGemini(Landroid/os/Handler;I)V

    .line 187
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 191
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CallManager;->unregisterForPreciseCallStateChanged(Landroid/os/Handler;)V

    .line 193
    :cond_1
    return-void
.end method

.method public static unregisterForRingbackTone(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 4
    .parameter "callManager"
    .parameter "handler"

    .prologue
    .line 310
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 311
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    move-object v2, p0

    .line 312
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 313
    .local v2, mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 314
    .local v0, geminiSlots:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 315
    aget v3, v0, v1

    invoke-virtual {v2, p1, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForDisconnectGemini(Landroid/os/Handler;I)V

    .line 314
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 318
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CallManager;->unregisterForRingbackTone(Landroid/os/Handler;)V

    .line 320
    :cond_1
    return-void
.end method

.method public static unregisterForServiceStateChanged(Lcom/android/internal/telephony/Phone;Landroid/os/Handler;[I)V
    .locals 5
    .parameter "phone"
    .parameter "handler"
    .parameter "whats"

    .prologue
    const/4 v3, 0x0

    .line 539
    if-eqz p0, :cond_2

    .line 540
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 541
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 543
    .local v0, geminiSlots:[I
    array-length v2, p2

    array-length v4, v0

    if-lt v2, v4, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-static {v2}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 545
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v2, v0

    if-ge v1, v2, :cond_2

    .line 546
    aget v2, p2, v1

    invoke-virtual {p1, v2}, Landroid/os/Handler;->removeMessages(I)V

    move-object v2, p0

    .line 548
    check-cast v2, Lcom/android/internal/telephony/gemini/GeminiPhone;

    aget v4, v0, v1

    invoke-virtual {v2, p1, v4}, Lcom/android/internal/telephony/gemini/GeminiPhone;->unregisterForServiceStateChangedGemini(Landroid/os/Handler;I)V

    .line 545
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .end local v1           #i:I
    :cond_0
    move v2, v3

    .line 543
    goto :goto_0

    .line 553
    .end local v0           #geminiSlots:[I
    :cond_1
    invoke-interface {p0, p1}, Lcom/android/internal/telephony/Phone;->unregisterForServiceStateChanged(Landroid/os/Handler;)V

    .line 558
    :cond_2
    aget v2, p2, v3

    invoke-virtual {p1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 559
    return-void
.end method

.method public static unregisterForSpeechInfo(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 4
    .parameter "callManager"
    .parameter "handler"

    .prologue
    .line 854
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 855
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    .line 856
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .local v0, geminiSlots:[I
    move-object v2, p0

    .line 857
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 858
    .local v2, mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 859
    aget v3, v0, v1

    invoke-virtual {v2, p1, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForSpeechInfoGemini(Landroid/os/Handler;I)V

    .line 858
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 862
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CallManager;->unregisterForSpeechInfo(Landroid/os/Handler;)V

    .line 864
    :cond_1
    return-void
.end method

.method public static unregisterForSpeechInfo(Ljava/lang/Object;Landroid/os/Handler;I)V
    .locals 1
    .parameter "callManager"
    .parameter "handler"
    .parameter "slotId"

    .prologue
    .line 840
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 841
    instance-of v0, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v0, :cond_0

    .line 842
    check-cast p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .end local p0
    invoke-virtual {p0, p1, p2}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForSpeechInfoGemini(Landroid/os/Handler;I)V

    .line 846
    :goto_0
    return-void

    .line 844
    .restart local p0
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CallManager;->unregisterForSpeechInfo(Landroid/os/Handler;)V

    goto :goto_0
.end method

.method public static unregisterForSuppServiceFailed(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 4
    .parameter "callManager"
    .parameter "handler"

    .prologue
    .line 745
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 746
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    .line 747
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .local v0, geminiSlots:[I
    move-object v2, p0

    .line 748
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 749
    .local v2, mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 750
    aget v3, v0, v1

    invoke-virtual {v2, p1, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForSuppServiceFailedGemini(Landroid/os/Handler;I)V

    .line 749
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 753
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CallManager;->unregisterForSuppServiceFailed(Landroid/os/Handler;)V

    .line 755
    :cond_1
    return-void
.end method

.method public static unregisterForSuppServiceNotification(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 4
    .parameter "callManager"
    .parameter "handler"

    .prologue
    .line 783
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 784
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    .line 785
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .local v0, geminiSlots:[I
    move-object v2, p0

    .line 786
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 787
    .local v2, mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 788
    aget v3, v0, v1

    invoke-virtual {v2, p1, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForSuppServiceNotificationGemini(Landroid/os/Handler;I)V

    .line 787
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 791
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCM:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CallManager;->unregisterForSuppServiceNotification(Landroid/os/Handler;)V

    .line 793
    :cond_1
    return-void
.end method

.method public static unregisterForUnknownConnection(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 4
    .parameter "callManager"
    .parameter "handler"

    .prologue
    .line 224
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 225
    instance-of v3, p0, Lcom/android/internal/telephony/gemini/MTKCallManager;

    if-eqz v3, :cond_0

    move-object v2, p0

    .line 226
    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 227
    .local v2, mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 228
    .local v0, geminiSlots:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 229
    aget v3, v0, v1

    invoke-virtual {v2, p1, v3}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForUnknownConnectionGemini(Landroid/os/Handler;I)V

    .line 228
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 232
    .end local v0           #geminiSlots:[I
    .end local v1           #i:I
    .end local v2           #mtkCm:Lcom/android/internal/telephony/gemini/MTKCallManager;
    :cond_0
    check-cast p0, Lcom/android/internal/telephony/CallManager;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/CallManager;->unregisterForUnknownConnection(Landroid/os/Handler;)V

    .line 234
    :cond_1
    return-void
.end method

.method public static unregisterForVtReplaceDisconnect(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 0
    .parameter "callManager"
    .parameter "handler"

    .prologue
    .line 454
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 466
    return-void
.end method

.method public static unregisterForVtRingInfo(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 0
    .parameter "callManager"
    .parameter "handler"

    .prologue
    .line 358
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 370
    return-void
.end method

.method public static unregisterForVtStatusInfo(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 0
    .parameter "callManager"
    .parameter "handler"

    .prologue
    .line 406
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 418
    return-void
.end method
