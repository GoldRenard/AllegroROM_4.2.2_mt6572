.class public Lcom/android/phone/EmergencyCallHelper;
.super Landroid/os/Handler;
.source "EmergencyCallHelper.java"


# static fields
.field private static final DBG:Z = true

.field private static final DISCONNECT:I = 0x3

#the value of this static final field might be set in the static constructor
.field private static final DUAL_SIMS_MODE_ON:I = 0x0

.field public static final MAX_NUM_RETRIES:I = 0x6

.field private static final PHONE_STATE_CHANGED:I = 0x5

.field private static final RETRY_TIMEOUT:I = 0x4

.field private static final SEND_ECC_CALL:I = 0x6

.field private static final SERVICE_STATE_CHANGED:I = 0x2

.field private static final SERVICE_STATE_CHANGED2:I = 0x66

.field private static final SERVICE_STATE_CHANGED3:I = 0xca

.field private static final SERVICE_STATE_CHANGED4:I = 0x12e

.field private static final SERVICE_STATE_CHANGED_GEMINI:[I = null

.field private static final START_SEQUENCE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "EmergencyCallHelper"

.field public static final TIME_BETWEEN_RETRIES:J = 0x3a98L

.field public static final WAKE_LOCK_TIMEOUT:J = 0x493e0L


# instance fields
.field private mApp:Lcom/android/phone/PhoneGlobals;

.field private mCM:Lcom/android/internal/telephony/CallManager;

.field public mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

.field private mCallController:Lcom/android/phone/CallController;

.field private mNumRetriesSoFar:I

.field private mNumber:Ljava/lang/String;

.field private mPartialWakeLock:Landroid/os/PowerManager$WakeLock;

.field private mPhone:Lcom/android/internal/telephony/Phone;

.field private mServiceOnSlot:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 654
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/phone/EmergencyCallHelper;->SERVICE_STATE_CHANGED_GEMINI:[I

    .line 665
    const/4 v0, 0x1

    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlotCount()I

    move-result v1

    shl-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    sput v0, Lcom/android/phone/EmergencyCallHelper;->DUAL_SIMS_MODE_ON:I

    return-void

    .line 654
    nop

    :array_0
    .array-data 0x4
        0x2t 0x0t 0x0t 0x0t
        0x66t 0x0t 0x0t 0x0t
        0xcat 0x0t 0x0t 0x0t
        0x2et 0x1t 0x0t 0x0t
    .end array-data
.end method

.method public constructor <init>(Lcom/android/phone/CallController;)V
    .locals 1
    .parameter "callController"

    .prologue
    .line 99
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 649
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/phone/EmergencyCallHelper;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 100
    const-string v0, "EmergencyCallHelper constructor..."

    invoke-direct {p0, v0}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 101
    iput-object p1, p0, Lcom/android/phone/EmergencyCallHelper;->mCallController:Lcom/android/phone/CallController;

    .line 102
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    .line 103
    iget-object v0, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    iput-object v0, p0, Lcom/android/phone/EmergencyCallHelper;->mCM:Lcom/android/internal/telephony/CallManager;

    .line 104
    iget-object v0, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    iput-object v0, p0, Lcom/android/phone/EmergencyCallHelper;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 105
    return-void
.end method

.method private cancelRetryTimer()V
    .locals 1

    .prologue
    .line 644
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/android/phone/EmergencyCallHelper;->removeMessages(I)V

    .line 645
    return-void
.end method

.method private cleanup()V
    .locals 3

    .prologue
    .line 595
    const-string v1, "cleanup()..."

    invoke-direct {p0, v1}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 598
    iget-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    invoke-virtual {v1}, Lcom/android/phone/InCallUiState;->clearProgressIndication()V

    .line 600
    iget-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mPhone:Lcom/android/internal/telephony/Phone;

    sget-object v2, Lcom/android/phone/EmergencyCallHelper;->SERVICE_STATE_CHANGED_GEMINI:[I

    invoke-static {v1, p0, v2}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForServiceStateChanged(Lcom/android/internal/telephony/Phone;Landroid/os/Handler;[I)V

    .line 601
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v0, p0, Lcom/android/phone/EmergencyCallHelper;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 602
    .local v0, callManager:Ljava/lang/Object;
    :goto_0
    invoke-static {v0, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForDisconnect(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 603
    invoke-direct {p0}, Lcom/android/phone/EmergencyCallHelper;->cancelRetryTimer()V

    .line 606
    iget-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mPartialWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v1, :cond_1

    .line 607
    iget-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mPartialWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 608
    const-string v1, "- releasing wake lock"

    invoke-direct {p0, v1}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 609
    iget-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mPartialWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 611
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mPartialWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 616
    :cond_1
    iget-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v1}, Lcom/android/phone/PhoneGlobals;->updateInCallScreen()V

    .line 617
    return-void

    .line 601
    .end local v0           #callManager:Ljava/lang/Object;
    :cond_2
    iget-object v0, p0, Lcom/android/phone/EmergencyCallHelper;->mCM:Lcom/android/internal/telephony/CallManager;

    goto :goto_0
.end method

.method private getBestSlotForDualSimMode(I)I
    .locals 9
    .parameter "mode"

    .prologue
    .line 751
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getDefaultSlot()I

    move-result v1

    .line 752
    .local v1, bestSlot:I
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v3

    .line 753
    .local v3, geminiSlots:[I
    move-object v0, v3

    .local v0, arr$:[I
    array-length v6, v0

    .local v6, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_0
    if-ge v5, v6, :cond_0

    aget v4, v0, v5

    .line 754
    .local v4, gs:I
    const/4 v7, 0x1

    shl-int/2addr v7, v4

    and-int v2, p1, v7

    .line 755
    .local v2, dualSim:I
    if-lez v2, :cond_1

    .line 756
    move v1, v4

    .line 760
    .end local v2           #dualSim:I
    .end local v4           #gs:I
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getBestSlotForDualSimMode, mode="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", bestSlot="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 761
    return v1

    .line 753
    .restart local v2       #dualSim:I
    .restart local v4       #gs:I
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0
.end method

.method private getProperDualSimMode(I)I
    .locals 11
    .parameter "originMode"

    .prologue
    .line 719
    const/4 v8, 0x0

    .line 720
    .local v8, mode:I
    iget-object v9, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-static {v9}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v7

    .line 721
    .local v7, list:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    if-eqz v7, :cond_0

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 722
    :cond_0
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getProperDualSimMode, No sim inserted, return "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget v10, Lcom/android/phone/EmergencyCallHelper;->DUAL_SIMS_MODE_ON:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 723
    sget v9, Lcom/android/phone/EmergencyCallHelper;->DUAL_SIMS_MODE_ON:I

    .line 746
    :goto_0
    return v9

    .line 725
    :cond_1
    if-eqz v7, :cond_4

    .line 726
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v1

    .line 727
    .local v1, geminiSlots:[I
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/provider/Telephony$SIMInfo;

    .line 728
    .local v5, info:Landroid/provider/Telephony$SIMInfo;
    move-object v0, v1

    .local v0, arr$:[I
    array-length v6, v0

    .local v6, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_2
    if-ge v4, v6, :cond_2

    aget v2, v0, v4

    .line 729
    .local v2, gs:I
    iget v9, v5, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    if-ne v9, v2, :cond_3

    .line 730
    const/4 v9, 0x1

    shl-int/2addr v9, v2

    or-int/2addr v8, v9

    .line 731
    goto :goto_1

    .line 728
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 737
    .end local v0           #arr$:[I
    .end local v1           #geminiSlots:[I
    .end local v2           #gs:I
    .end local v4           #i$:I
    .end local v5           #info:Landroid/provider/Telephony$SIMInfo;
    .end local v6           #len$:I
    :cond_4
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getProperDualSimMode, mode="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 742
    and-int v9, v8, p1

    if-eqz v9, :cond_5

    .line 743
    move v8, p1

    :cond_5
    move v9, v8

    .line 746
    goto :goto_0
.end method

.method private getSysDualSimMode()I
    .locals 4

    .prologue
    .line 702
    const/4 v0, 0x0

    .line 703
    .local v0, dualSimMode:I
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 704
    iget-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v1}, Lcom/android/phone/PhoneGlobals;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    const/4 v3, 0x3

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 708
    :cond_0
    return v0
.end method

.method private hangupAllCallsWhenEcc()Z
    .locals 12

    .prologue
    const/4 v10, 0x0

    .line 796
    const-string v11, "hangupAllCallsWhenEcc()..."

    invoke-direct {p0, v11}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 797
    iget-object v11, p0, Lcom/android/phone/EmergencyCallHelper;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v11}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v8

    .line 798
    .local v8, phoneState:Lcom/android/internal/telephony/PhoneConstants$State;
    sget-object v11, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v8, v11, :cond_6

    .line 799
    iget-object v11, p0, Lcom/android/phone/EmergencyCallHelper;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v11}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v7

    .line 800
    .local v7, fgCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {v7}, Lcom/android/internal/telephony/Call;->getEarliestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v5

    .line 801
    .local v5, connection:Lcom/android/internal/telephony/Connection;
    if-eqz v5, :cond_3

    invoke-virtual {v5}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v0

    .line 803
    .local v0, activeCallAddress:Ljava/lang/String;
    :goto_0
    iget-object v11, p0, Lcom/android/phone/EmergencyCallHelper;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v11}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    .line 804
    .local v1, bgCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getEarliestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v3

    .line 805
    .local v3, bgconnection:Lcom/android/internal/telephony/Connection;
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v2

    .line 808
    .local v2, bgCallAddress:Ljava/lang/String;
    :goto_1
    iget-object v10, p0, Lcom/android/phone/EmergencyCallHelper;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v10}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v9

    .line 812
    .local v9, ringingCall:Lcom/android/internal/telephony/Call;
    if-eqz v7, :cond_0

    invoke-virtual {v7}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v10

    invoke-virtual {v10}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-static {v7}, Lcom/android/phone/PhoneUtils;->isEccCall(Lcom/android/internal/telephony/Call;)Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-static {v0}, Lcom/mediatek/telephony/PhoneNumberUtilsEx;->isSpecialEmergencyNumber(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_2

    :cond_0
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v10

    invoke-virtual {v10}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v10

    if-eqz v10, :cond_1

    invoke-static {v1}, Lcom/android/phone/PhoneUtils;->isEccCall(Lcom/android/internal/telephony/Call;)Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-static {v2}, Lcom/mediatek/telephony/PhoneNumberUtilsEx;->isSpecialEmergencyNumber(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_2

    :cond_1
    if-eqz v9, :cond_6

    invoke-virtual {v9}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v10

    invoke-virtual {v10}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v10

    if-eqz v10, :cond_6

    .line 822
    :cond_2
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v10

    iget-object v4, v10, Lcom/android/phone/PhoneGlobals;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 823
    .local v4, callManager:Ljava/lang/Object;
    :goto_2
    const/4 v10, 0x5

    invoke-static {v4, p0, v10}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForDisconnect(Ljava/lang/Object;Landroid/os/Handler;I)V

    .line 825
    :try_start_0
    iget-object v10, p0, Lcom/android/phone/EmergencyCallHelper;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v10}, Lcom/android/internal/telephony/CallManager;->hangupAllEx()Z

    .line 826
    const-string v10, "Waiting for disconnect exist calls."

    invoke-direct {p0, v10}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 827
    const/4 v10, 0x1

    .line 833
    .end local v0           #activeCallAddress:Ljava/lang/String;
    .end local v1           #bgCall:Lcom/android/internal/telephony/Call;
    .end local v2           #bgCallAddress:Ljava/lang/String;
    .end local v3           #bgconnection:Lcom/android/internal/telephony/Connection;
    .end local v4           #callManager:Ljava/lang/Object;
    .end local v5           #connection:Lcom/android/internal/telephony/Connection;
    .end local v7           #fgCall:Lcom/android/internal/telephony/Call;
    .end local v9           #ringingCall:Lcom/android/internal/telephony/Call;
    :goto_3
    return v10

    .restart local v5       #connection:Lcom/android/internal/telephony/Connection;
    .restart local v7       #fgCall:Lcom/android/internal/telephony/Call;
    :cond_3
    move-object v0, v10

    .line 801
    goto :goto_0

    .restart local v0       #activeCallAddress:Ljava/lang/String;
    .restart local v1       #bgCall:Lcom/android/internal/telephony/Call;
    .restart local v3       #bgconnection:Lcom/android/internal/telephony/Connection;
    :cond_4
    move-object v2, v10

    .line 805
    goto :goto_1

    .line 822
    .restart local v2       #bgCallAddress:Ljava/lang/String;
    .restart local v9       #ringingCall:Lcom/android/internal/telephony/Call;
    :cond_5
    iget-object v4, p0, Lcom/android/phone/EmergencyCallHelper;->mCM:Lcom/android/internal/telephony/CallManager;

    goto :goto_2

    .line 828
    .restart local v4       #callManager:Ljava/lang/Object;
    :catch_0
    move-exception v6

    .line 829
    .local v6, e:Lcom/android/internal/telephony/CallStateException;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "catch exception = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 833
    .end local v0           #activeCallAddress:Ljava/lang/String;
    .end local v1           #bgCall:Lcom/android/internal/telephony/Call;
    .end local v2           #bgCallAddress:Ljava/lang/String;
    .end local v3           #bgconnection:Lcom/android/internal/telephony/Connection;
    .end local v4           #callManager:Ljava/lang/Object;
    .end local v5           #connection:Lcom/android/internal/telephony/Connection;
    .end local v6           #e:Lcom/android/internal/telephony/CallStateException;
    .end local v7           #fgCall:Lcom/android/internal/telephony/Call;
    .end local v9           #ringingCall:Lcom/android/internal/telephony/Call;
    :cond_6
    const/4 v10, 0x0

    goto :goto_3
.end method

.method private isSlotPowerOff(I)Z
    .locals 10
    .parameter "slotId"

    .prologue
    const/4 v9, 0x3

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 770
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 771
    iget-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 772
    .local v1, gPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    invoke-static {p1}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 773
    invoke-virtual {v1, p1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getServiceStateGemini(I)Landroid/telephony/ServiceState;

    move-result-object v8

    invoke-virtual {v8}, Landroid/telephony/ServiceState;->getState()I

    move-result v8

    if-ne v8, v9, :cond_1

    .line 783
    .end local v1           #gPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    :cond_0
    :goto_0
    return v6

    .restart local v1       #gPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    :cond_1
    move v6, v7

    .line 773
    goto :goto_0

    .line 775
    :cond_2
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v2

    .line 776
    .local v2, geminiSlots:[I
    move-object v0, v2

    .local v0, arr$:[I
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_1
    if-ge v4, v5, :cond_0

    aget v3, v0, v4

    .line 777
    .local v3, gs:I
    invoke-virtual {v1, v3}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getServiceStateGemini(I)Landroid/telephony/ServiceState;

    move-result-object v8

    invoke-virtual {v8}, Landroid/telephony/ServiceState;->getState()I

    move-result v8

    if-eq v8, v9, :cond_3

    move v6, v7

    .line 778
    goto :goto_0

    .line 776
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 783
    .end local v0           #arr$:[I
    .end local v1           #gPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    .end local v2           #geminiSlots:[I
    .end local v3           #gs:I
    .end local v4           #i$:I
    .end local v5           #len$:I
    :cond_4
    iget-object v8, p0, Lcom/android/phone/EmergencyCallHelper;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v8}, Lcom/android/internal/telephony/Phone;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v8

    invoke-virtual {v8}, Landroid/telephony/ServiceState;->getState()I

    move-result v8

    if-eq v8, v9, :cond_0

    move v6, v7

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 787
    const-string v0, "EmergencyCallHelper"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 788
    return-void
.end method

.method private needSetDualSimMode(I)Z
    .locals 12
    .parameter "lastMode"

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 670
    iget-object v11, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-static {v11}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v8

    .line 671
    .local v8, list:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    if-eqz v8, :cond_0

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v11

    if-nez v11, :cond_4

    .line 672
    :cond_0
    const/4 v4, 0x0

    .line 673
    .local v4, hasSimInserted:Z
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v2

    .line 674
    .local v2, geminiSlots:[I
    move-object v0, v2

    .local v0, arr$:[I
    array-length v7, v0

    .local v7, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_0
    if-ge v5, v7, :cond_3

    aget v3, v0, v5

    .line 675
    .local v3, gs:I
    if-nez v4, :cond_1

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v11

    iget-object v11, v11, Lcom/android/phone/PhoneGlobals;->phoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v11, v3}, Lcom/android/phone/PhoneInterfaceManager;->isSimInsert(I)Z

    move-result v11

    if-eqz v11, :cond_2

    :cond_1
    move v4, v10

    .line 674
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_2
    move v4, v9

    .line 675
    goto :goto_1

    .line 677
    .end local v3           #gs:I
    :cond_3
    if-nez v4, :cond_4

    .line 679
    const-string v10, "needSetDualSimMode, false, no sim inserted"

    invoke-direct {p0, v10}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 693
    .end local v0           #arr$:[I
    .end local v2           #geminiSlots:[I
    .end local v4           #hasSimInserted:Z
    .end local v5           #i$:I
    .end local v7           #len$:I
    :goto_2
    return v9

    .line 684
    :cond_4
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, i$:Ljava/util/Iterator;
    :cond_5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/provider/Telephony$SIMInfo;

    .line 685
    .local v6, info:Landroid/provider/Telephony$SIMInfo;
    iget v11, v6, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    shl-int v11, v10, v11

    and-int v1, p1, v11

    .line 686
    .local v1, dualSim:I
    if-lez v1, :cond_5

    .line 688
    const-string v10, "needSetDualSimMode, false, follow settings mode"

    invoke-direct {p0, v10}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    goto :goto_2

    .line 692
    .end local v1           #dualSim:I
    .end local v6           #info:Landroid/provider/Telephony$SIMInfo;
    :cond_6
    const-string v9, "needSetDualSimMode, true"

    invoke-direct {p0, v9}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    move v9, v10

    .line 693
    goto :goto_2
.end method

.method private onDisconnect(Landroid/os/Message;)V
    .locals 4
    .parameter "msg"

    .prologue
    .line 338
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    iget-object v1, v2, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v1, Lcom/android/internal/telephony/Connection;

    .line 339
    .local v1, conn:Lcom/android/internal/telephony/Connection;
    invoke-virtual {v1}, Lcom/android/internal/telephony/Connection;->getDisconnectCause()Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-result-object v0

    .line 340
    .local v0, cause:Lcom/android/internal/telephony/Connection$DisconnectCause;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onDisconnect: connection \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\', addr \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\', cause = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 343
    sget-object v2, Lcom/android/internal/telephony/Connection$DisconnectCause;->OUT_OF_SERVICE:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v2, :cond_0

    .line 346
    const-string v2, "- onDisconnect: OUT_OF_SERVICE, need to retry..."

    invoke-direct {p0, v2}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 348
    invoke-direct {p0}, Lcom/android/phone/EmergencyCallHelper;->cleanup()V

    .line 363
    :goto_0
    return-void

    .line 355
    :cond_0
    const-string v2, "==> Disconnect event; clean up..."

    invoke-direct {p0, v2}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 356
    invoke-direct {p0}, Lcom/android/phone/EmergencyCallHelper;->cleanup()V

    goto :goto_0
.end method

.method private onRetryTimeout(Landroid/os/Message;)V
    .locals 5
    .parameter "msg"

    .prologue
    .line 369
    sget-object v0, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    .line 370
    .local v0, phoneState:Lcom/android/internal/telephony/PhoneConstants$State;
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 371
    .local v1, slot:I
    iget v3, p1, Landroid/os/Message;->arg1:I

    invoke-direct {p0, v3}, Lcom/android/phone/EmergencyCallHelper;->isSlotPowerOff(I)Z

    move-result v2

    .line 373
    .local v2, slotPowerOff:Z
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onRetryTimeout():  phone state "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", service state(PowerOff)="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mNumRetriesSoFar = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/phone/EmergencyCallHelper;->mNumRetriesSoFar:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 386
    sget-object v3, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v0, v3, :cond_0

    .line 387
    const-string v3, "- onRetryTimeout: Call is active!  Cleaning up..."

    invoke-direct {p0, v3}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 388
    invoke-direct {p0}, Lcom/android/phone/EmergencyCallHelper;->cleanup()V

    .line 419
    :goto_0
    return-void

    .line 392
    :cond_0
    if-nez v2, :cond_1

    .line 397
    iget-object v3, p0, Lcom/android/phone/EmergencyCallHelper;->mPhone:Lcom/android/internal/telephony/Phone;

    sget-object v4, Lcom/android/phone/EmergencyCallHelper;->SERVICE_STATE_CHANGED_GEMINI:[I

    invoke-static {v3, p0, v4}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForServiceStateChanged(Lcom/android/internal/telephony/Phone;Landroid/os/Handler;[I)V

    .line 400
    iget-object v3, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    invoke-virtual {v3}, Lcom/android/phone/InCallUiState;->clearProgressIndication()V

    .line 402
    invoke-direct {p0, v1}, Lcom/android/phone/EmergencyCallHelper;->placeEmergencyCall(I)V

    .line 418
    :goto_1
    iget-object v3, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/android/phone/PhoneGlobals;->displayCallScreen(Z)V

    goto :goto_0

    .line 407
    :cond_1
    const-string v3, "- Trying (again) to turn on the radio..."

    invoke-direct {p0, v3}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 408
    invoke-direct {p0}, Lcom/android/phone/EmergencyCallHelper;->powerOnRadio()V

    .line 413
    invoke-direct {p0}, Lcom/android/phone/EmergencyCallHelper;->scheduleRetryOrBailOut()V

    goto :goto_1
.end method

.method private onServiceStateChanged(Landroid/os/Message;)V
    .locals 5
    .parameter "msg"

    .prologue
    const/4 v3, 0x1

    .line 262
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    iget-object v1, v2, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v1, Landroid/telephony/ServiceState;

    .line 263
    .local v1, state:Landroid/telephony/ServiceState;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onServiceStateChanged()...  new state = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 282
    invoke-virtual {v1}, Landroid/telephony/ServiceState;->getState()I

    move-result v2

    const/4 v4, 0x3

    if-eq v2, v4, :cond_0

    move v0, v3

    .line 284
    .local v0, okToCall:Z
    :goto_0
    if-eqz v0, :cond_2

    .line 286
    const-string v2, "onServiceStateChanged: ok to call!"

    invoke-direct {p0, v2}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 289
    iget-object v2, p0, Lcom/android/phone/EmergencyCallHelper;->mPhone:Lcom/android/internal/telephony/Phone;

    sget-object v4, Lcom/android/phone/EmergencyCallHelper;->SERVICE_STATE_CHANGED_GEMINI:[I

    invoke-static {v2, p0, v4}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForServiceStateChanged(Lcom/android/internal/telephony/Phone;Landroid/os/Handler;[I)V

    .line 292
    iget v2, p1, Landroid/os/Message;->what:I

    sget-object v4, Lcom/android/phone/EmergencyCallHelper;->SERVICE_STATE_CHANGED_GEMINI:[I

    invoke-static {v2, v4}, Lcom/mediatek/phone/gemini/GeminiRegister;->getSlotIdByRegisterEvent(I[I)I

    move-result v2

    iput v2, p0, Lcom/android/phone/EmergencyCallHelper;->mServiceOnSlot:I

    .line 293
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onServiceStateChanged slotId="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v4, p0, Lcom/android/phone/EmergencyCallHelper;->mServiceOnSlot:I

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 297
    invoke-direct {p0}, Lcom/android/phone/EmergencyCallHelper;->hangupAllCallsWhenEcc()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 327
    :goto_1
    return-void

    .line 282
    .end local v0           #okToCall:Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 303
    .restart local v0       #okToCall:Z
    :cond_1
    iget-object v2, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v2, v2, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    invoke-virtual {v2}, Lcom/android/phone/InCallUiState;->clearProgressIndication()V

    .line 307
    invoke-direct {p0}, Lcom/android/phone/EmergencyCallHelper;->cancelRetryTimer()V

    .line 310
    iget v2, p0, Lcom/android/phone/EmergencyCallHelper;->mServiceOnSlot:I

    invoke-direct {p0, v2}, Lcom/android/phone/EmergencyCallHelper;->placeEmergencyCall(I)V

    .line 314
    iget-object v2, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v2, v3}, Lcom/android/phone/PhoneGlobals;->displayCallScreen(Z)V

    goto :goto_1

    .line 325
    :cond_2
    const-string v2, "onServiceStateChanged: not ready to call yet, keep waiting..."

    invoke-direct {p0, v2}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private placeEmergencyCall(I)V
    .locals 10
    .parameter "simId"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 484
    const-string v0, "placeEmergencyCall()..."

    invoke-direct {p0, v0}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 493
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v7, p0, Lcom/android/phone/EmergencyCallHelper;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 494
    .local v7, callManager:Ljava/lang/Object;
    :goto_0
    const/4 v0, 0x3

    invoke-static {v7, p0, v0}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForDisconnect(Ljava/lang/Object;Landroid/os/Handler;I)V

    .line 496
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- placing call to \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mNumber:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " simId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 498
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 499
    iget-object v0, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mPhone:Lcom/android/internal/telephony/Phone;

    iget-object v2, p0, Lcom/android/phone/EmergencyCallHelper;->mNumber:Ljava/lang/String;

    move-object v5, v3

    move v6, p1

    invoke-static/range {v0 .. v6}, Lcom/android/phone/PhoneUtils;->placeCallGemini(Landroid/content/Context;Lcom/android/internal/telephony/Phone;Ljava/lang/String;Landroid/net/Uri;ZLandroid/net/Uri;I)I

    move-result v8

    .line 506
    .local v8, callStatus:I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- PhoneUtils.placeCallGemini() returned status = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 520
    :goto_1
    packed-switch v8, :pswitch_data_0

    .line 529
    const-string v0, "EmergencyCallHelper"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "placeEmergencyCall(): placeCall() failed: callStatus = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 530
    const/4 v9, 0x0

    .line 534
    .local v9, success:Z
    :goto_2
    if-eqz v9, :cond_2

    .line 535
    const-string v0, "==> Success from PhoneUtils.placeCall()!"

    invoke-direct {p0, v0}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 548
    :goto_3
    return-void

    .line 493
    .end local v7           #callManager:Ljava/lang/Object;
    .end local v8           #callStatus:I
    .end local v9           #success:Z
    :cond_0
    iget-object v7, p0, Lcom/android/phone/EmergencyCallHelper;->mCM:Lcom/android/internal/telephony/CallManager;

    goto :goto_0

    .line 508
    .restart local v7       #callManager:Ljava/lang/Object;
    :cond_1
    iget-object v0, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mPhone:Lcom/android/internal/telephony/Phone;

    iget-object v2, p0, Lcom/android/phone/EmergencyCallHelper;->mNumber:Ljava/lang/String;

    move-object v5, v3

    invoke-static/range {v0 .. v5}, Lcom/android/phone/PhoneUtils;->placeCall(Landroid/content/Context;Lcom/android/internal/telephony/Phone;Ljava/lang/String;Landroid/net/Uri;ZLandroid/net/Uri;)I

    move-result v8

    .line 514
    .restart local v8       #callStatus:I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- PhoneUtils.placeCall() returned status = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 522
    :pswitch_0
    const/4 v9, 0x1

    .line 523
    .restart local v9       #success:Z
    goto :goto_2

    .line 543
    :cond_2
    const-string v0, "==> Failure."

    invoke-direct {p0, v0}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 546
    invoke-direct {p0}, Lcom/android/phone/EmergencyCallHelper;->scheduleRetryOrBailOut()V

    goto :goto_3

    .line 520
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method private powerOnRadio()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 431
    const-string v4, "- powerOnRadio()..."

    invoke-direct {p0, v4}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 435
    iget-object v4, p0, Lcom/android/phone/EmergencyCallHelper;->mPhone:Lcom/android/internal/telephony/Phone;

    sget-object v5, Lcom/android/phone/EmergencyCallHelper;->SERVICE_STATE_CHANGED_GEMINI:[I

    invoke-static {v4, p0, v5}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForServiceStateChanged(Lcom/android/internal/telephony/Phone;Landroid/os/Handler;[I)V

    .line 439
    invoke-direct {p0}, Lcom/android/phone/EmergencyCallHelper;->getSysDualSimMode()I

    move-result v1

    .line 440
    .local v1, dualSimMode:I
    const/4 v0, 0x0

    .line 442
    .local v0, bOffAirplaneMode:Z
    const-string v4, "EmergencyCallHelper"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "dualSimMode = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 443
    iget-object v4, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v4}, Lcom/android/phone/PhoneGlobals;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "airplane_mode_on"

    invoke-static {v4, v5, v7}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    if-lez v4, :cond_2

    .line 444
    const-string v4, "==> Turning off airplane mode..."

    invoke-direct {p0, v4}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 447
    iget-object v4, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v4}, Lcom/android/phone/PhoneGlobals;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "airplane_mode_on"

    invoke-static {v4, v5, v7}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 450
    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 451
    .local v3, intent:Landroid/content/Intent;
    const-string v4, "state"

    invoke-virtual {v3, v4, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 452
    iget-object v4, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    sget-object v5, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v4, v3, v5}, Lcom/android/phone/PhoneGlobals;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 453
    const/4 v0, 0x1

    .line 462
    .end local v3           #intent:Landroid/content/Intent;
    :cond_0
    :goto_0
    invoke-direct {p0, v1}, Lcom/android/phone/EmergencyCallHelper;->getProperDualSimMode(I)I

    move-result v2

    .line 463
    .local v2, expMode:I
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v4

    if-eqz v4, :cond_3

    if-eqz v0, :cond_1

    if-eqz v0, :cond_3

    if-eq v2, v1, :cond_3

    .line 465
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Send broadcast to turn on radio with mode = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 466
    iget-object v4, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v4}, Lcom/android/phone/PhoneGlobals;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "dual_sim_mode_setting"

    invoke-static {v4, v5, v2}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 468
    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.DUAL_SIM_MODE"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 469
    .restart local v3       #intent:Landroid/content/Intent;
    const-string v4, "mode"

    invoke-virtual {v3, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 470
    iget-object v4, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    sget-object v5, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v4, v3, v5}, Lcom/android/phone/PhoneGlobals;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 474
    .end local v3           #intent:Landroid/content/Intent;
    :goto_1
    return-void

    .line 454
    .end local v2           #expMode:I
    :cond_2
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v4

    if-nez v4, :cond_0

    .line 459
    const-string v4, "==> (Apparently) not in airplane mode; manually powering radio on..."

    invoke-direct {p0, v4}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 460
    iget-object v4, p0, Lcom/android/phone/EmergencyCallHelper;->mPhone:Lcom/android/internal/telephony/Phone;

    const/4 v5, 0x1

    invoke-interface {v4, v5}, Lcom/android/internal/telephony/Phone;->setRadioPower(Z)V

    goto :goto_0

    .line 472
    .restart local v2       #expMode:I
    :cond_3
    const-string v4, "do nothing."

    invoke-direct {p0, v4}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private scheduleRetryOrBailOut()V
    .locals 2

    .prologue
    .line 557
    iget v0, p0, Lcom/android/phone/EmergencyCallHelper;->mNumRetriesSoFar:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/phone/EmergencyCallHelper;->mNumRetriesSoFar:I

    .line 558
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "scheduleRetryOrBailOut()...  mNumRetriesSoFar is now "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/phone/EmergencyCallHelper;->mNumRetriesSoFar:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 560
    iget v0, p0, Lcom/android/phone/EmergencyCallHelper;->mNumRetriesSoFar:I

    const/4 v1, 0x6

    if-le v0, v1, :cond_0

    .line 561
    const-string v0, "EmergencyCallHelper"

    const-string v1, "scheduleRetryOrBailOut: hit MAX_NUM_RETRIES; giving up..."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 562
    invoke-direct {p0}, Lcom/android/phone/EmergencyCallHelper;->cleanup()V

    .line 565
    iget-object v0, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    sget-object v1, Lcom/android/phone/Constants$CallStatusCode;->CALL_FAILED:Lcom/android/phone/Constants$CallStatusCode;

    invoke-virtual {v0, v1}, Lcom/android/phone/InCallUiState;->setPendingCallStatusCode(Lcom/android/phone/Constants$CallStatusCode;)V

    .line 571
    :goto_0
    return-void

    .line 567
    :cond_0
    const-string v0, "- Scheduling another retry..."

    invoke-direct {p0, v0}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 568
    invoke-direct {p0}, Lcom/android/phone/EmergencyCallHelper;->startRetryTimer()V

    .line 569
    iget-object v0, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    sget-object v1, Lcom/android/phone/InCallUiState$ProgressIndicationType;->RETRYING:Lcom/android/phone/InCallUiState$ProgressIndicationType;

    invoke-virtual {v0, v1}, Lcom/android/phone/InCallUiState;->setProgressIndication(Lcom/android/phone/InCallUiState$ProgressIndicationType;)V

    goto :goto_0
.end method

.method private startRetryTimer()V
    .locals 7

    .prologue
    const-wide/16 v5, 0x3a98

    const/4 v4, 0x4

    .line 620
    invoke-virtual {p0, v4}, Lcom/android/phone/EmergencyCallHelper;->removeMessages(I)V

    .line 628
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 629
    invoke-direct {p0}, Lcom/android/phone/EmergencyCallHelper;->getSysDualSimMode()I

    move-result v0

    .line 630
    .local v0, dualSimMode:I
    invoke-direct {p0, v0}, Lcom/android/phone/EmergencyCallHelper;->getBestSlotForDualSimMode(I)I

    move-result v2

    .line 632
    .local v2, slot:I
    const/4 v3, 0x0

    invoke-virtual {p0, v4, v2, v3}, Lcom/android/phone/EmergencyCallHelper;->obtainMessage(III)Landroid/os/Message;

    move-result-object v1

    .line 633
    .local v1, msg:Landroid/os/Message;
    invoke-virtual {p0, v1, v5, v6}, Lcom/android/phone/EmergencyCallHelper;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 641
    .end local v0           #dualSimMode:I
    .end local v1           #msg:Landroid/os/Message;
    .end local v2           #slot:I
    :goto_0
    return-void

    .line 636
    :cond_0
    invoke-virtual {p0, v4, v5, v6}, Lcom/android/phone/EmergencyCallHelper;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0
.end method

.method private startSequenceInternal(Landroid/os/Message;)V
    .locals 4
    .parameter "msg"

    .prologue
    .line 198
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startSequenceInternal(): msg = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 205
    invoke-direct {p0}, Lcom/android/phone/EmergencyCallHelper;->cleanup()V

    .line 207
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mNumber:Ljava/lang/String;

    .line 208
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "- startSequenceInternal: Got mNumber: \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/phone/EmergencyCallHelper;->mNumber:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 210
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/phone/EmergencyCallHelper;->mNumRetriesSoFar:I

    .line 219
    iget-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    iput-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 223
    iget-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    const-string v2, "power"

    invoke-virtual {v1, v2}, Lcom/android/phone/PhoneGlobals;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 224
    .local v0, pm:Landroid/os/PowerManager;
    const/4 v1, 0x1

    const-string v2, "EmergencyCallHelper"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    iput-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mPartialWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 228
    const-string v1, "- startSequenceInternal: acquiring wake lock"

    invoke-direct {p0, v1}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 229
    iget-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mPartialWakeLock:Landroid/os/PowerManager$WakeLock;

    const-wide/32 v2, 0x493e0

    invoke-virtual {v1, v2, v3}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    .line 237
    invoke-direct {p0}, Lcom/android/phone/EmergencyCallHelper;->powerOnRadio()V

    .line 245
    invoke-direct {p0}, Lcom/android/phone/EmergencyCallHelper;->startRetryTimer()V

    .line 249
    iget-object v1, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    sget-object v2, Lcom/android/phone/InCallUiState$ProgressIndicationType;->TURNING_ON_RADIO:Lcom/android/phone/InCallUiState$ProgressIndicationType;

    invoke-virtual {v1, v2}, Lcom/android/phone/InCallUiState;->setProgressIndication(Lcom/android/phone/InCallUiState$ProgressIndicationType;)V

    .line 252
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .parameter "msg"

    .prologue
    .line 109
    iget v3, p1, Landroid/os/Message;->what:I

    sparse-switch v3, :sswitch_data_0

    .line 156
    const-string v3, "EmergencyCallHelper"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleMessage: unexpected message: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    :goto_0
    return-void

    .line 111
    :sswitch_0
    invoke-direct {p0, p1}, Lcom/android/phone/EmergencyCallHelper;->startSequenceInternal(Landroid/os/Message;)V

    goto :goto_0

    .line 117
    :sswitch_1
    invoke-direct {p0, p1}, Lcom/android/phone/EmergencyCallHelper;->onServiceStateChanged(Landroid/os/Message;)V

    goto :goto_0

    .line 120
    :sswitch_2
    invoke-direct {p0, p1}, Lcom/android/phone/EmergencyCallHelper;->onDisconnect(Landroid/os/Message;)V

    goto :goto_0

    .line 123
    :sswitch_3
    invoke-direct {p0, p1}, Lcom/android/phone/EmergencyCallHelper;->onRetryTimeout(Landroid/os/Message;)V

    goto :goto_0

    .line 129
    :sswitch_4
    iget-object v3, p0, Lcom/android/phone/EmergencyCallHelper;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v2

    .line 130
    .local v2, state:Lcom/android/internal/telephony/PhoneConstants$State;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleMessage: PHONE_STATE_CHANGED with state = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 131
    sget-object v3, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v2, v3, :cond_1

    .line 134
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v3

    iget-object v0, v3, Lcom/android/phone/PhoneGlobals;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 135
    .local v0, callManager:Ljava/lang/Object;
    :goto_1
    invoke-static {v0, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForDisconnect(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 139
    const/4 v3, 0x6

    invoke-virtual {p0, v3}, Lcom/android/phone/EmergencyCallHelper;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 140
    .local v1, message:Landroid/os/Message;
    const-wide/16 v3, 0xc8

    invoke-virtual {p0, v1, v3, v4}, Lcom/android/phone/EmergencyCallHelper;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0

    .line 134
    .end local v0           #callManager:Ljava/lang/Object;
    .end local v1           #message:Landroid/os/Message;
    :cond_0
    iget-object v0, p0, Lcom/android/phone/EmergencyCallHelper;->mCM:Lcom/android/internal/telephony/CallManager;

    goto :goto_1

    .line 142
    :cond_1
    const-string v3, "handleMessage: PHONE_STATE_CHANGED continue waiting..."

    invoke-direct {p0, v3}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 147
    .end local v2           #state:Lcom/android/internal/telephony/PhoneConstants$State;
    :sswitch_5
    const-string v3, "send the ecc call!"

    invoke-direct {p0, v3}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 149
    iget-object v3, p0, Lcom/android/phone/EmergencyCallHelper;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    invoke-virtual {v3}, Lcom/android/phone/InCallUiState;->clearProgressIndication()V

    .line 150
    invoke-direct {p0}, Lcom/android/phone/EmergencyCallHelper;->cancelRetryTimer()V

    .line 151
    iget v3, p0, Lcom/android/phone/EmergencyCallHelper;->mServiceOnSlot:I

    invoke-direct {p0, v3}, Lcom/android/phone/EmergencyCallHelper;->placeEmergencyCall(I)V

    goto :goto_0

    .line 109
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0x3 -> :sswitch_2
        0x4 -> :sswitch_3
        0x5 -> :sswitch_4
        0x6 -> :sswitch_5
        0x66 -> :sswitch_1
        0xca -> :sswitch_1
        0x12e -> :sswitch_1
    .end sparse-switch
.end method

.method public startEmergencyCallFromAirplaneModeSequence(Ljava/lang/String;)V
    .locals 3
    .parameter "number"

    .prologue
    .line 187
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startEmergencyCallFromAirplaneModeSequence(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\')..."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/EmergencyCallHelper;->log(Ljava/lang/String;)V

    .line 188
    const/4 v1, 0x1

    invoke-virtual {p0, v1, p1}, Lcom/android/phone/EmergencyCallHelper;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 189
    .local v0, msg:Landroid/os/Message;
    invoke-virtual {p0, v0}, Lcom/android/phone/EmergencyCallHelper;->sendMessage(Landroid/os/Message;)Z

    .line 190
    return-void
.end method
