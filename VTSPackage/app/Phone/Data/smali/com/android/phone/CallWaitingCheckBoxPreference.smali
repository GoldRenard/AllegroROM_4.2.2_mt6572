.class public Lcom/android/phone/CallWaitingCheckBoxPreference;
.super Landroid/preference/CheckBoxPreference;
.source "CallWaitingCheckBoxPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/phone/CallWaitingCheckBoxPreference$1;,
        Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;
    }
.end annotation


# static fields
.field private static final DBG:Z = true

.field public static final DEFAULT_SIM:I = 0x2

.field private static final LOG_TAG:Ljava/lang/String; = "Settings/CallWaitingCheckBoxPreference"


# instance fields
.field private final mHandler:Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;

.field private final mPhone:Lcom/android/internal/telephony/Phone;

.field private mServiceClass:I

.field private mSimId:I

.field private mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 79
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/phone/CallWaitingCheckBoxPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 80
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 75
    const v0, 0x101008f

    invoke-direct {p0, p1, p2, v0}, Lcom/android/phone/CallWaitingCheckBoxPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 76
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 69
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 60
    new-instance v0, Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;-><init>(Lcom/android/phone/CallWaitingCheckBoxPreference;Lcom/android/phone/CallWaitingCheckBoxPreference$1;)V

    iput-object v0, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mHandler:Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;

    .line 65
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mSimId:I

    .line 66
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mServiceClass:I

    .line 71
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 72
    return-void
.end method

.method static synthetic access$100(Lcom/android/phone/CallWaitingCheckBoxPreference;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/phone/CallWaitingCheckBoxPreference;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget v0, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mServiceClass:I

    return v0
.end method

.method static synthetic access$300(Lcom/android/phone/CallWaitingCheckBoxPreference;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget v0, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mSimId:I

    return v0
.end method

.method static synthetic access$400(Lcom/android/phone/CallWaitingCheckBoxPreference;)Lcom/android/internal/telephony/Phone;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    return-object v0
.end method


# virtual methods
.method init(Lcom/mediatek/phone/TimeConsumingPreferenceListener;ZI)V
    .locals 5
    .parameter "listener"
    .parameter "skipReading"
    .parameter "simId"

    .prologue
    const/16 v4, 0x200

    const/4 v3, 0x0

    .line 83
    const-string v0, "Settings/CallWaitingCheckBoxPreference"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "init, simId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    iput-object p1, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    .line 85
    iput p3, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mSimId:I

    .line 87
    if-nez p2, :cond_0

    .line 89
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 90
    iget v0, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mServiceClass:I

    if-ne v0, v4, :cond_1

    .line 91
    iget-object v0, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget-object v1, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mHandler:Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;

    invoke-virtual {v1, v3, v3, v3}, Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v1

    iget v2, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mSimId:I

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getVtCallWaitingGemini(Landroid/os/Message;I)V

    .line 106
    :goto_0
    iget-object v0, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    if-eqz v0, :cond_0

    .line 107
    iget-object v0, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    const/4 v1, 0x1

    invoke-interface {v0, p0, v1}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onStarted(Landroid/preference/Preference;Z)V

    .line 110
    :cond_0
    return-void

    .line 94
    :cond_1
    iget-object v0, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget-object v1, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mHandler:Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;

    invoke-virtual {v1, v3, v3, v3}, Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v1

    iget v2, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mSimId:I

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getCallWaitingGemini(Landroid/os/Message;I)V

    goto :goto_0

    .line 98
    :cond_2
    iget v0, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mServiceClass:I

    if-ne v0, v4, :cond_3

    .line 99
    iget-object v0, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    iget-object v1, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mHandler:Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;

    invoke-virtual {v1, v3, v3, v3}, Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/internal/telephony/Phone;->getVtCallWaiting(Landroid/os/Message;)V

    goto :goto_0

    .line 102
    :cond_3
    iget-object v0, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    iget-object v1, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mHandler:Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;

    invoke-virtual {v1, v3, v3, v3}, Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/internal/telephony/Phone;->getCallWaiting(Landroid/os/Message;)V

    goto :goto_0
.end method

.method protected onClick()V
    .locals 5

    .prologue
    const/16 v4, 0x200

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 114
    invoke-super {p0}, Landroid/preference/CheckBoxPreference;->onClick()V

    .line 115
    invoke-virtual {p0}, Lcom/android/phone/CallWaitingCheckBoxPreference;->isChecked()Z

    move-result v0

    .line 116
    .local v0, toState:Z
    if-nez v0, :cond_1

    move v1, v2

    :goto_0
    invoke-virtual {p0, v1}, Lcom/android/phone/CallWaitingCheckBoxPreference;->setChecked(Z)V

    .line 118
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 119
    iget v1, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mServiceClass:I

    if-ne v1, v4, :cond_2

    .line 120
    iget-object v1, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget-object v4, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mHandler:Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;

    invoke-virtual {v4, v2}, Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    iget v4, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mSimId:I

    invoke-virtual {v1, v0, v2, v4}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setVtCallWaitingGemini(ZLandroid/os/Message;I)V

    .line 135
    :goto_1
    iget-object v1, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    if-eqz v1, :cond_0

    .line 136
    iget-object v1, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    invoke-interface {v1, p0, v3}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onStarted(Landroid/preference/Preference;Z)V

    .line 138
    :cond_0
    return-void

    :cond_1
    move v1, v3

    .line 116
    goto :goto_0

    .line 123
    :cond_2
    iget-object v1, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget-object v4, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mHandler:Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;

    invoke-virtual {v4, v2}, Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    iget v4, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mSimId:I

    invoke-virtual {v1, v0, v2, v4}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setCallWaitingGemini(ZLandroid/os/Message;I)V

    goto :goto_1

    .line 127
    :cond_3
    iget v1, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mServiceClass:I

    if-ne v1, v4, :cond_4

    .line 128
    iget-object v1, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    iget-object v4, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mHandler:Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;

    invoke-virtual {v4, v2}, Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lcom/android/internal/telephony/Phone;->setVtCallWaiting(ZLandroid/os/Message;)V

    goto :goto_1

    .line 131
    :cond_4
    iget-object v1, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    iget-object v4, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mHandler:Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;

    invoke-virtual {v4, v2}, Lcom/android/phone/CallWaitingCheckBoxPreference$MyHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lcom/android/internal/telephony/Phone;->setCallWaiting(ZLandroid/os/Message;)V

    goto :goto_1
.end method

.method public setServiceClass(I)V
    .locals 0
    .parameter "serviceClass"

    .prologue
    .line 232
    iput p1, p0, Lcom/android/phone/CallWaitingCheckBoxPreference;->mServiceClass:I

    .line 233
    return-void
.end method
