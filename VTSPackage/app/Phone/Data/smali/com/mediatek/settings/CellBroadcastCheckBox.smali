.class public Lcom/mediatek/settings/CellBroadcastCheckBox;
.super Landroid/preference/CheckBoxPreference;
.source "CellBroadcastCheckBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/settings/CellBroadcastCheckBox$1;,
        Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;
    }
.end annotation


# static fields
.field private static final DBG:Z = true

.field private static final LOG_TAG:Ljava/lang/String; = "Settings/CellBroadcastCheckBox"

.field private static final MESSAGE_GET_STATE:I = 0x64

.field private static final MESSAGE_SET_STATE:I = 0x65


# instance fields
.field private mHandler:Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;

.field private mLastCheckStatus:Z

.field private mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

.field private mPhone:Lcom/android/internal/telephony/Phone;

.field mSimId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 78
    invoke-direct {p0, p1, p2}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 72
    new-instance v0, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;-><init>(Lcom/mediatek/settings/CellBroadcastCheckBox;Lcom/mediatek/settings/CellBroadcastCheckBox$1;)V

    iput-object v0, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mHandler:Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;

    .line 79
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 80
    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/settings/CellBroadcastCheckBox;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 65
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mediatek/settings/CellBroadcastCheckBox;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 65
    iget-boolean v0, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mLastCheckStatus:Z

    return v0
.end method

.method static synthetic access$300(Lcom/mediatek/settings/CellBroadcastCheckBox;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CellBroadcastCheckBox;->getCBState(Z)V

    return-void
.end method

.method private getCBState(Z)V
    .locals 6
    .parameter "reason"

    .prologue
    const/4 v5, 0x0

    const/16 v4, 0x65

    const/4 v3, 0x0

    const/16 v2, 0x64

    .line 118
    if-eqz p1, :cond_1

    .line 119
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mHandler:Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;

    invoke-virtual {v1, v2, v3, v2, v5}, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 123
    .local v0, msg:Landroid/os/Message;
    :goto_0
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 124
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v2, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mSimId:I

    invoke-virtual {v1, v0, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->queryCellBroadcastSmsActivationGemini(Landroid/os/Message;I)V

    .line 129
    :goto_1
    if-eqz p1, :cond_0

    .line 130
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    if-eqz v1, :cond_0

    iget v1, v0, Landroid/os/Message;->arg2:I

    if-ne v1, v4, :cond_0

    .line 131
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    invoke-interface {v1, p0, p1}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onStarted(Landroid/preference/Preference;Z)V

    .line 134
    :cond_0
    return-void

    .line 121
    .end local v0           #msg:Landroid/os/Message;
    :cond_1
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mHandler:Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .restart local v0       #msg:Landroid/os/Message;
    goto :goto_0

    .line 126
    :cond_2
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1, v0}, Lcom/android/internal/telephony/Phone;->queryCellBroadcastSmsActivation(Landroid/os/Message;)V

    goto :goto_1
.end method

.method private setCBState(I)V
    .locals 5
    .parameter "state"

    .prologue
    const/16 v4, 0x65

    const/4 v3, 0x0

    .line 138
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mHandler:Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;

    const/4 v2, 0x0

    invoke-virtual {v1, v4, v3, v4, v2}, Lcom/mediatek/settings/CellBroadcastCheckBox$MyHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 139
    .local v0, msg:Landroid/os/Message;
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 140
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v2, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mSimId:I

    invoke-virtual {v1, p1, v0, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->activateCellBroadcastSmsGemini(ILandroid/os/Message;I)V

    .line 145
    :goto_0
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    if-eqz v1, :cond_0

    .line 146
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    invoke-interface {v1, p0, v3}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onStarted(Landroid/preference/Preference;Z)V

    .line 148
    :cond_0
    return-void

    .line 142
    :cond_1
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1, p1, v0}, Lcom/android/internal/telephony/Phone;->activateCellBroadcastSms(ILandroid/os/Message;)V

    goto :goto_0
.end method


# virtual methods
.method init(Lcom/mediatek/phone/TimeConsumingPreferenceListener;ZI)V
    .locals 6
    .parameter "listener"
    .parameter "skipReading"
    .parameter "simId"

    .prologue
    const/4 v5, 0x0

    .line 92
    const-string v2, "Settings/CellBroadcastCheckBox"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "init, simId = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    iput-object p1, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    .line 94
    iput p3, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mSimId:I

    .line 96
    if-nez p2, :cond_0

    .line 97
    check-cast p1, Lcom/mediatek/settings/CellBroadcastActivity;

    .end local p1
    const-string v2, "phone"

    invoke-virtual {p1, v2}, Lcom/mediatek/settings/CellBroadcastActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 101
    .local v1, telephonyManager:Landroid/telephony/TelephonyManager;
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 102
    iget v2, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mSimId:I

    invoke-virtual {v1, v2}, Landroid/telephony/TelephonyManager;->hasIccCardGemini(I)Z

    move-result v0

    .line 107
    .local v0, hasIccCard:Z
    :goto_0
    if-eqz v0, :cond_2

    .line 108
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/mediatek/settings/CellBroadcastCheckBox;->getCBState(Z)V

    .line 114
    .end local v0           #hasIccCard:Z
    .end local v1           #telephonyManager:Landroid/telephony/TelephonyManager;
    :cond_0
    :goto_1
    return-void

    .line 104
    .restart local v1       #telephonyManager:Landroid/telephony/TelephonyManager;
    :cond_1
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->hasIccCard()Z

    move-result v0

    .restart local v0       #hasIccCard:Z
    goto :goto_0

    .line 110
    :cond_2
    invoke-virtual {p0, v5}, Lcom/mediatek/settings/CellBroadcastCheckBox;->setChecked(Z)V

    .line 111
    invoke-virtual {p0, v5}, Lcom/mediatek/settings/CellBroadcastCheckBox;->setEnabled(Z)V

    goto :goto_1
.end method

.method protected onClick()V
    .locals 4

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 84
    invoke-super {p0}, Landroid/preference/CheckBoxPreference;->onClick()V

    .line 85
    invoke-virtual {p0}, Lcom/mediatek/settings/CellBroadcastCheckBox;->isChecked()Z

    move-result v0

    .line 86
    .local v0, state:Z
    if-nez v0, :cond_0

    move v1, v2

    :goto_0
    iput-boolean v1, p0, Lcom/mediatek/settings/CellBroadcastCheckBox;->mLastCheckStatus:Z

    .line 87
    if-eqz v0, :cond_1

    move v1, v3

    :goto_1
    invoke-direct {p0, v1}, Lcom/mediatek/settings/CellBroadcastCheckBox;->setCBState(I)V

    .line 88
    if-nez v0, :cond_2

    :goto_2
    invoke-virtual {p0, v2}, Lcom/mediatek/settings/CellBroadcastCheckBox;->setChecked(Z)V

    .line 89
    return-void

    :cond_0
    move v1, v3

    .line 86
    goto :goto_0

    :cond_1
    move v1, v2

    .line 87
    goto :goto_1

    :cond_2
    move v2, v3

    .line 88
    goto :goto_2
.end method
