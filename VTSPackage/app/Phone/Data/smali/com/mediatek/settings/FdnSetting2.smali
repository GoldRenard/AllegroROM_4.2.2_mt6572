.class public Lcom/mediatek/settings/FdnSetting2;
.super Landroid/preference/PreferenceActivity;
.source "FdnSetting2.java"

# interfaces
.implements Lcom/android/phone/EditPinPreference$OnPinEnteredListener;
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/settings/FdnSetting2$FdnSetting2BroadcastReceiver;
    }
.end annotation


# static fields
.field private static final BUTTON_CHANGE_PIN2_KEY:Ljava/lang/String; = "button_change_pin2_key"

.field private static final BUTTON_FDN_ENABLE_KEY:Ljava/lang/String; = "button_fdn_enable_key"

.field private static final BUTTON_FDN_LIST_KEY:Ljava/lang/String; = "button_fdn_list_key"

.field private static final EVENT_PIN2_ENTRY_COMPLETE:I = 0x64

.field private static final GET_SIM_RETRY_EMPTY:I = -0x1

.field private static final LOG_TAG:Ljava/lang/String; = "Settings/FdnSetting2"

.field private static final MAX_PIN_LENGTH:I = 0x8

.field private static final MIN_PIN_LENGTH:I = 0x4


# instance fields
.field private mButtonChangePin2:Landroid/preference/Preference;

.field private mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

.field private mButtonFDNList:Landroid/preference/Preference;

.field private mFDNHandler:Landroid/os/Handler;

.field private mFdnSupport:Z

.field private mPhone:Lcom/android/internal/telephony/Phone;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mRetryPin2New:I

.field private mRetryPin2Old:I

.field private mSimId:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 98
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 124
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/settings/FdnSetting2;->mFdnSupport:Z

    .line 131
    new-instance v0, Lcom/mediatek/settings/FdnSetting2$FdnSetting2BroadcastReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mediatek/settings/FdnSetting2$FdnSetting2BroadcastReceiver;-><init>(Lcom/mediatek/settings/FdnSetting2;Lcom/mediatek/settings/FdnSetting2$1;)V

    iput-object v0, p0, Lcom/mediatek/settings/FdnSetting2;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 291
    new-instance v0, Lcom/mediatek/settings/FdnSetting2$1;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/FdnSetting2$1;-><init>(Lcom/mediatek/settings/FdnSetting2;)V

    iput-object v0, p0, Lcom/mediatek/settings/FdnSetting2;->mFDNHandler:Landroid/os/Handler;

    .line 608
    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/settings/FdnSetting2;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 98
    invoke-direct {p0}, Lcom/mediatek/settings/FdnSetting2;->getRetryPin2Count()I

    move-result v0

    return v0
.end method

.method static synthetic access$1000(Lcom/mediatek/settings/FdnSetting2;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 98
    iget v0, p0, Lcom/mediatek/settings/FdnSetting2;->mSimId:I

    return v0
.end method

.method static synthetic access$200(Lcom/mediatek/settings/FdnSetting2;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 98
    invoke-direct {p0, p1}, Lcom/mediatek/settings/FdnSetting2;->displayMessage(I)V

    return-void
.end method

.method static synthetic access$300(Lcom/mediatek/settings/FdnSetting2;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 98
    invoke-direct {p0}, Lcom/mediatek/settings/FdnSetting2;->updateFDNPreference()V

    return-void
.end method

.method static synthetic access$400(Lcom/mediatek/settings/FdnSetting2;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 98
    invoke-direct {p0, p1}, Lcom/mediatek/settings/FdnSetting2;->resetFDNDialog(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/mediatek/settings/FdnSetting2;)Lcom/android/phone/EditPinPreference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 98
    iget-object v0, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mediatek/settings/FdnSetting2;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 98
    invoke-direct {p0}, Lcom/mediatek/settings/FdnSetting2;->updateEnableFDN()V

    return-void
.end method

.method static synthetic access$700(Lcom/mediatek/settings/FdnSetting2;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 98
    iget v0, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2Old:I

    return v0
.end method

.method static synthetic access$702(Lcom/mediatek/settings/FdnSetting2;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 98
    iput p1, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2Old:I

    return p1
.end method

.method static synthetic access$800(Lcom/mediatek/settings/FdnSetting2;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 98
    iget v0, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2New:I

    return v0
.end method

.method static synthetic access$900(Lcom/mediatek/settings/FdnSetting2;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 98
    invoke-direct {p0, p1}, Lcom/mediatek/settings/FdnSetting2;->updateMenuEnableState(Z)V

    return-void
.end method

.method private checkPhoneBookState()Z
    .locals 3

    .prologue
    .line 592
    const/4 v0, 0x0

    .line 593
    .local v0, isPhoneBookReady:Z
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 594
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v2, p0, Lcom/mediatek/settings/FdnSetting2;->mSimId:I

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getIccCardGemini(I)Lcom/android/internal/telephony/IccCard;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/IccCard;->isPhbReady()Z

    move-result v0

    .line 598
    :goto_0
    if-nez v0, :cond_0

    .line 599
    const v1, 0x7f0d00cc

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/FdnSetting2;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f0d0086

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/FdnSetting2;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mediatek/settings/FdnSetting2;->showTipToast(Ljava/lang/String;Ljava/lang/String;)V

    .line 601
    :cond_0
    return v0

    .line 596
    :cond_1
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getIccCard()Lcom/android/internal/telephony/IccCard;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/IccCard;->isPhbReady()Z

    move-result v0

    goto :goto_0
.end method

.method private checkPhoneBookStateExit()V
    .locals 3

    .prologue
    .line 579
    const/4 v0, 0x0

    .line 580
    .local v0, isPhoneBookReady:Z
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 581
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v2, p0, Lcom/mediatek/settings/FdnSetting2;->mSimId:I

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getIccCardGemini(I)Lcom/android/internal/telephony/IccCard;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/IccCard;->isPhbReady()Z

    move-result v0

    .line 585
    :goto_0
    if-nez v0, :cond_0

    .line 586
    const v1, 0x7f0d00cc

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/FdnSetting2;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f0d0086

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/FdnSetting2;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mediatek/settings/FdnSetting2;->showTipToast(Ljava/lang/String;Ljava/lang/String;)V

    .line 587
    invoke-virtual {p0}, Lcom/mediatek/settings/FdnSetting2;->finish()V

    .line 589
    :cond_0
    return-void

    .line 583
    :cond_1
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getIccCard()Lcom/android/internal/telephony/IccCard;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/IccCard;->isPhbReady()Z

    move-result v0

    goto :goto_0
.end method

.method private displayMessage(I)V
    .locals 2
    .parameter "strId"

    .prologue
    .line 325
    invoke-virtual {p0, p1}, Lcom/mediatek/settings/FdnSetting2;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 327
    return-void
.end method

.method private getRetryPin2()Ljava/lang/String;
    .locals 6

    .prologue
    .line 187
    invoke-direct {p0}, Lcom/mediatek/settings/FdnSetting2;->getRetryPin2Count()I

    move-result v0

    .line 188
    .local v0, retryCount:I
    iput v0, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2New:I

    .line 189
    const-string v1, "Settings/FdnSetting2"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getRetryPin2 ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    packed-switch v0, :pswitch_data_0

    .line 197
    :pswitch_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const v2, 0x7f0d0142

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/settings/FdnSetting2;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    .line 192
    :pswitch_1
    const-string v1, "Settings/FdnSetting2"

    const-string v2, "getRetryPin2,GET_SIM_RETRY_EMPTY"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    const-string v1, " "

    goto :goto_0

    .line 195
    :pswitch_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const v2, 0x7f0d0141

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/FdnSetting2;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 190
    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private getRetryPin2Count()I
    .locals 4

    .prologue
    .line 161
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 162
    iget v1, p0, Lcom/mediatek/settings/FdnSetting2;->mSimId:I

    packed-switch v1, :pswitch_data_0

    .line 176
    const-string v1, "Settings/FdnSetting2"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error happened mSimId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/FdnSetting2;->mSimId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    const-string v0, "gsm.sim.retry.pin2"

    .line 183
    .local v0, pin2RetryString:Ljava/lang/String;
    :goto_0
    const/4 v1, -0x1

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    return v1

    .line 164
    .end local v0           #pin2RetryString:Ljava/lang/String;
    :pswitch_0
    const-string v0, "gsm.sim.retry.pin2"

    .line 165
    .restart local v0       #pin2RetryString:Ljava/lang/String;
    goto :goto_0

    .line 167
    .end local v0           #pin2RetryString:Ljava/lang/String;
    :pswitch_1
    const-string v0, "gsm.sim.retry.pin2.2"

    .line 168
    .restart local v0       #pin2RetryString:Ljava/lang/String;
    goto :goto_0

    .line 170
    .end local v0           #pin2RetryString:Ljava/lang/String;
    :pswitch_2
    const-string v0, "gsm.sim.retry.pin2.3"

    .line 171
    .restart local v0       #pin2RetryString:Ljava/lang/String;
    goto :goto_0

    .line 173
    .end local v0           #pin2RetryString:Ljava/lang/String;
    :pswitch_3
    const-string v0, "gsm.sim.retry.pin2.4"

    .line 174
    .restart local v0       #pin2RetryString:Ljava/lang/String;
    goto :goto_0

    .line 181
    .end local v0           #pin2RetryString:Ljava/lang/String;
    :cond_0
    const-string v0, "gsm.sim.retry.pin2"

    .restart local v0       #pin2RetryString:Ljava/lang/String;
    goto :goto_0

    .line 162
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private getRetryPuk2Count()I
    .locals 4

    .prologue
    .line 134
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 135
    iget v1, p0, Lcom/mediatek/settings/FdnSetting2;->mSimId:I

    packed-switch v1, :pswitch_data_0

    .line 149
    const-string v1, "Settings/FdnSetting2"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error happened mSimId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/FdnSetting2;->mSimId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    const-string v0, "gsm.sim.retry.puk2"

    .line 156
    .local v0, puk2RetryStr:Ljava/lang/String;
    :goto_0
    const/4 v1, -0x1

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    return v1

    .line 137
    .end local v0           #puk2RetryStr:Ljava/lang/String;
    :pswitch_0
    const-string v0, "gsm.sim.retry.puk2"

    .line 138
    .restart local v0       #puk2RetryStr:Ljava/lang/String;
    goto :goto_0

    .line 140
    .end local v0           #puk2RetryStr:Ljava/lang/String;
    :pswitch_1
    const-string v0, "gsm.sim.retry.puk2.2"

    .line 141
    .restart local v0       #puk2RetryStr:Ljava/lang/String;
    goto :goto_0

    .line 143
    .end local v0           #puk2RetryStr:Ljava/lang/String;
    :pswitch_2
    const-string v0, "gsm.sim.retry.puk2.3"

    .line 144
    .restart local v0       #puk2RetryStr:Ljava/lang/String;
    goto :goto_0

    .line 146
    .end local v0           #puk2RetryStr:Ljava/lang/String;
    :pswitch_3
    const-string v0, "gsm.sim.retry.puk2.4"

    .line 147
    .restart local v0       #puk2RetryStr:Ljava/lang/String;
    goto :goto_0

    .line 154
    .end local v0           #puk2RetryStr:Ljava/lang/String;
    :cond_0
    const-string v0, "gsm.sim.retry.puk2"

    .restart local v0       #puk2RetryStr:Ljava/lang/String;
    goto :goto_0

    .line 135
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private resetFDNDialog(I)V
    .locals 4
    .parameter "strId"

    .prologue
    const v3, 0x7f0d02a8

    .line 238
    if-eqz p1, :cond_0

    .line 239
    iget-object v0, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Lcom/mediatek/settings/FdnSetting2;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/FdnSetting2;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lcom/mediatek/settings/FdnSetting2;->getRetryPin2()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/phone/EditPinPreference;->setDialogMessage(Ljava/lang/CharSequence;)V

    .line 247
    :goto_0
    return-void

    .line 243
    :cond_0
    const-string v0, "Settings/FdnSetting2"

    const-string v1, "resetFDNDialog 0"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    iget-object v0, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/FdnSetting2;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lcom/mediatek/settings/FdnSetting2;->getRetryPin2()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/phone/EditPinPreference;->setDialogMessage(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private setFDNSupport()V
    .locals 3

    .prologue
    .line 568
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 569
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v2, p0, Lcom/mediatek/settings/FdnSetting2;->mSimId:I

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getIccCardGemini(I)Lcom/android/internal/telephony/IccCard;

    move-result-object v0

    .line 573
    .local v0, iccCard:Lcom/android/internal/telephony/IccCard;
    :goto_0
    invoke-interface {v0}, Lcom/android/internal/telephony/IccCard;->isFDNExist()Z

    move-result v1

    iput-boolean v1, p0, Lcom/mediatek/settings/FdnSetting2;->mFdnSupport:Z

    .line 574
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    iget-boolean v2, p0, Lcom/mediatek/settings/FdnSetting2;->mFdnSupport:Z

    invoke-virtual {v1, v2}, Lcom/android/phone/EditPinPreference;->setEnabled(Z)V

    .line 575
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonFDNList:Landroid/preference/Preference;

    iget-boolean v2, p0, Lcom/mediatek/settings/FdnSetting2;->mFdnSupport:Z

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 576
    return-void

    .line 571
    .end local v0           #iccCard:Lcom/android/internal/telephony/IccCard;
    :cond_0
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getIccCard()Lcom/android/internal/telephony/IccCard;

    move-result-object v0

    .restart local v0       #iccCard:Lcom/android/internal/telephony/IccCard;
    goto :goto_0
.end method

.method private toggleFDNEnable(Z)V
    .locals 8
    .parameter "positiveResult"

    .prologue
    const/4 v5, 0x0

    .line 253
    const-string v4, "Settings/FdnSetting2"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "toggleFDNEnable"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    if-nez p1, :cond_0

    .line 256
    const-string v4, "Settings/FdnSetting2"

    const-string v6, "toggleFDNEnable positiveResult is false"

    invoke-static {v4, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    invoke-direct {p0, v5}, Lcom/mediatek/settings/FdnSetting2;->resetFDNDialog(I)V

    .line 258
    iget v4, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2New:I

    iput v4, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2Old:I

    .line 259
    const-string v4, "Settings/FdnSetting2"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "toggleFDNEnable mRetryPin2Old="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2Old:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    :goto_0
    return-void

    .line 264
    :cond_0
    iget-object v4, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    invoke-virtual {v4}, Lcom/android/phone/EditPinPreference;->getText()Ljava/lang/String;

    move-result-object v3

    .line 265
    .local v3, password:Ljava/lang/String;
    invoke-direct {p0, v3, v5}, Lcom/mediatek/settings/FdnSetting2;->validatePin(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 268
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 269
    iget-object v4, p0, Lcom/mediatek/settings/FdnSetting2;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v4, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v6, p0, Lcom/mediatek/settings/FdnSetting2;->mSimId:I

    invoke-virtual {v4, v6}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getIccCardGemini(I)Lcom/android/internal/telephony/IccCard;

    move-result-object v0

    .line 273
    .local v0, iccCard:Lcom/android/internal/telephony/IccCard;
    :goto_1
    invoke-interface {v0}, Lcom/android/internal/telephony/IccCard;->getIccFdnEnabled()Z

    move-result v1

    .line 274
    .local v1, isEnabled:Z
    iget-object v4, p0, Lcom/mediatek/settings/FdnSetting2;->mFDNHandler:Landroid/os/Handler;

    const/16 v6, 0x64

    invoke-virtual {v4, v6}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    .line 277
    .local v2, onComplete:Landroid/os/Message;
    if-nez v1, :cond_2

    const/4 v4, 0x1

    :goto_2
    invoke-interface {v0, v4, v3, v2}, Lcom/android/internal/telephony/IccCard;->setIccFdnEnabled(ZLjava/lang/String;Landroid/os/Message;)V

    .line 285
    .end local v0           #iccCard:Lcom/android/internal/telephony/IccCard;
    .end local v1           #isEnabled:Z
    .end local v2           #onComplete:Landroid/os/Message;
    :goto_3
    iget-object v4, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    const-string v5, ""

    invoke-virtual {v4, v5}, Lcom/android/phone/EditPinPreference;->setText(Ljava/lang/String;)V

    goto :goto_0

    .line 271
    :cond_1
    iget-object v4, p0, Lcom/mediatek/settings/FdnSetting2;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getIccCard()Lcom/android/internal/telephony/IccCard;

    move-result-object v0

    .restart local v0       #iccCard:Lcom/android/internal/telephony/IccCard;
    goto :goto_1

    .restart local v1       #isEnabled:Z
    .restart local v2       #onComplete:Landroid/os/Message;
    :cond_2
    move v4, v5

    .line 277
    goto :goto_2

    .line 280
    .end local v0           #iccCard:Lcom/android/internal/telephony/IccCard;
    .end local v1           #isEnabled:Z
    .end local v2           #onComplete:Landroid/os/Message;
    :cond_3
    const v4, 0x7f0d02af

    invoke-direct {p0, v4}, Lcom/mediatek/settings/FdnSetting2;->resetFDNDialog(I)V

    .line 281
    iget-object v4, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    const-string v5, ""

    invoke-virtual {v4, v5}, Lcom/android/phone/EditPinPreference;->setText(Ljava/lang/String;)V

    .line 282
    iget-object v4, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    invoke-virtual {v4}, Lcom/android/phone/EditPinPreference;->showPinDialog()V

    goto :goto_3
.end method

.method private updateEnableFDN()V
    .locals 3

    .prologue
    .line 350
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 351
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v2, p0, Lcom/mediatek/settings/FdnSetting2;->mSimId:I

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getIccCardGemini(I)Lcom/android/internal/telephony/IccCard;

    move-result-object v0

    .line 355
    .local v0, iccCard:Lcom/android/internal/telephony/IccCard;
    :goto_0
    invoke-interface {v0}, Lcom/android/internal/telephony/IccCard;->getIccFdnEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 356
    const-string v1, "Settings/FdnSetting2"

    const-string v2, "updateEnableFDN is FdnEnabled=2131559027"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    const v2, 0x7f0d0275

    invoke-virtual {v1, v2}, Lcom/android/phone/EditPinPreference;->setTitle(I)V

    .line 358
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    const v2, 0x7f0d0270

    invoke-virtual {v1, v2}, Lcom/android/phone/EditPinPreference;->setSummary(I)V

    .line 359
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    const v2, 0x7f0d0273

    invoke-virtual {v1, v2}, Lcom/android/phone/EditPinPreference;->setDialogTitle(I)V

    .line 366
    :goto_1
    const-string v1, "Settings/FdnSetting2"

    const-string v2, "updateEnableFDN"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 367
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/mediatek/settings/FdnSetting2;->resetFDNDialog(I)V

    .line 368
    return-void

    .line 353
    .end local v0           #iccCard:Lcom/android/internal/telephony/IccCard;
    :cond_0
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getIccCard()Lcom/android/internal/telephony/IccCard;

    move-result-object v0

    .restart local v0       #iccCard:Lcom/android/internal/telephony/IccCard;
    goto :goto_0

    .line 361
    :cond_1
    const-string v1, "Settings/FdnSetting2"

    const-string v2, "updateEnableFDN is not FdnEnabled=2131559026"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 362
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    const v2, 0x7f0d0276

    invoke-virtual {v1, v2}, Lcom/android/phone/EditPinPreference;->setTitle(I)V

    .line 363
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    const v2, 0x7f0d0271

    invoke-virtual {v1, v2}, Lcom/android/phone/EditPinPreference;->setSummary(I)V

    .line 364
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    const v2, 0x7f0d0272

    invoke-virtual {v1, v2}, Lcom/android/phone/EditPinPreference;->setDialogTitle(I)V

    goto :goto_1
.end method

.method private updateFDNPreference()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 371
    const/4 v0, 0x0

    .line 373
    .local v0, dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mPhone:Lcom/android/internal/telephony/Phone;

    instance-of v1, v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    if-eqz v1, :cond_0

    .line 374
    iget-object v0, p0, Lcom/mediatek/settings/FdnSetting2;->mPhone:Lcom/android/internal/telephony/Phone;

    .end local v0           #dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 376
    .restart local v0       #dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    :cond_0
    iget v1, p0, Lcom/mediatek/settings/FdnSetting2;->mSimId:I

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->isRadioOnGemini(I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 377
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    invoke-virtual {v1, v4}, Lcom/android/phone/EditPinPreference;->setEnabled(Z)V

    .line 378
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonFDNList:Landroid/preference/Preference;

    invoke-virtual {v1, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 379
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonChangePin2:Landroid/preference/Preference;

    invoke-virtual {v1, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 443
    :goto_0
    return-void

    .line 381
    :cond_1
    invoke-direct {p0}, Lcom/mediatek/settings/FdnSetting2;->getRetryPin2Count()I

    move-result v1

    if-nez v1, :cond_3

    .line 382
    iput v4, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2New:I

    .line 383
    const-string v1, "Settings/FdnSetting2"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateFDNPreference, mRetryPin2New="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2New:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 384
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    invoke-virtual {v1, v4}, Lcom/android/phone/EditPinPreference;->setEnabled(Z)V

    .line 385
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonFDNList:Landroid/preference/Preference;

    invoke-virtual {v1, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 386
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonChangePin2:Landroid/preference/Preference;

    const v2, 0x7f0d0144

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setTitle(I)V

    .line 388
    invoke-direct {p0}, Lcom/mediatek/settings/FdnSetting2;->getRetryPuk2Count()I

    move-result v1

    if-nez v1, :cond_2

    .line 389
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonChangePin2:Landroid/preference/Preference;

    invoke-virtual {v1, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 390
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonChangePin2:Landroid/preference/Preference;

    const v2, 0x7f0d0145

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(I)V

    .line 395
    :goto_1
    invoke-direct {p0}, Lcom/mediatek/settings/FdnSetting2;->updateEnableFDN()V

    goto :goto_0

    .line 392
    :cond_2
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonChangePin2:Landroid/preference/Preference;

    invoke-virtual {v1, v5}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 393
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonChangePin2:Landroid/preference/Preference;

    const v2, 0x7f0d02a7

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(I)V

    goto :goto_1

    .line 397
    :cond_3
    const-string v1, "Settings/FdnSetting2"

    const-string v2, "updateFDNPreference"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 398
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    iget-boolean v2, p0, Lcom/mediatek/settings/FdnSetting2;->mFdnSupport:Z

    invoke-virtual {v1, v2}, Lcom/android/phone/EditPinPreference;->setEnabled(Z)V

    .line 399
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonChangePin2:Landroid/preference/Preference;

    invoke-virtual {v1, v5}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 400
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonChangePin2:Landroid/preference/Preference;

    const v2, 0x7f0d0274

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setTitle(I)V

    .line 401
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonChangePin2:Landroid/preference/Preference;

    const v2, 0x7f0d0278

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(I)V

    .line 402
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonFDNList:Landroid/preference/Preference;

    iget-boolean v2, p0, Lcom/mediatek/settings/FdnSetting2;->mFdnSupport:Z

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 403
    invoke-direct {p0}, Lcom/mediatek/settings/FdnSetting2;->updateEnableFDN()V

    goto/16 :goto_0
.end method

.method private updateMenuEnableState(Z)V
    .locals 4
    .parameter "bEnable"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 647
    iget-object v3, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    iget-boolean v0, p0, Lcom/mediatek/settings/FdnSetting2;->mFdnSupport:Z

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Lcom/android/phone/EditPinPreference;->setEnabled(Z)V

    .line 648
    iget-object v0, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonFDNList:Landroid/preference/Preference;

    iget-boolean v3, p0, Lcom/mediatek/settings/FdnSetting2;->mFdnSupport:Z

    if-eqz v3, :cond_1

    if-eqz p1, :cond_1

    :goto_1
    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 649
    iget-object v0, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonChangePin2:Landroid/preference/Preference;

    invoke-virtual {v0, p1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 650
    return-void

    :cond_0
    move v0, v2

    .line 647
    goto :goto_0

    :cond_1
    move v1, v2

    .line 648
    goto :goto_1
.end method

.method private validatePin(Ljava/lang/String;Z)Z
    .locals 3
    .parameter "pin"
    .parameter "isPUK"

    .prologue
    const/16 v1, 0x8

    .line 339
    if-eqz p2, :cond_0

    move v0, v1

    .line 342
    .local v0, pinMinimum:I
    :goto_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v2, v0, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-gt v2, v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    return v1

    .line 339
    .end local v0           #pinMinimum:I
    :cond_0
    const/4 v0, 0x4

    goto :goto_0

    .line 342
    .restart local v0       #pinMinimum:I
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "icicle"

    .prologue
    .line 447
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 449
    const v3, 0x7f06000f

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/FdnSetting2;->addPreferencesFromResource(I)V

    .line 451
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/settings/FdnSetting2;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 452
    invoke-virtual {p0}, Lcom/mediatek/settings/FdnSetting2;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "simId"

    const/4 v5, -0x1

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/mediatek/settings/FdnSetting2;->mSimId:I

    .line 453
    const-string v3, "Settings/FdnSetting2"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onCreate,Sim Id "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/mediatek/settings/FdnSetting2;->mSimId:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 455
    invoke-virtual {p0}, Lcom/mediatek/settings/FdnSetting2;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    .line 456
    .local v2, prefSet:Landroid/preference/PreferenceScreen;
    const-string v3, "button_fdn_enable_key"

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Lcom/android/phone/EditPinPreference;

    iput-object v3, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    .line 457
    const-string v3, "button_change_pin2_key"

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonChangePin2:Landroid/preference/Preference;

    .line 458
    const-string v3, "button_fdn_list_key"

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonFDNList:Landroid/preference/Preference;

    .line 460
    iget-object v3, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    if-eqz v3, :cond_0

    .line 461
    iget-object v3, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    invoke-virtual {v3, p0}, Lcom/android/phone/EditPinPreference;->setOnPinEnteredListener(Lcom/android/phone/EditPinPreference$OnPinEnteredListener;)V

    .line 462
    iget-object v3, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    invoke-virtual {v3}, Lcom/android/phone/EditPinPreference;->getEditText()Landroid/widget/EditText;

    move-result-object v3

    new-instance v4, Lcom/mediatek/settings/FdnSetting2$2;

    invoke-direct {v4, p0}, Lcom/mediatek/settings/FdnSetting2$2;-><init>(Lcom/mediatek/settings/FdnSetting2;)V

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 484
    :cond_0
    iget-object v3, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonChangePin2:Landroid/preference/Preference;

    if-eqz v3, :cond_1

    .line 485
    iget-object v3, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonChangePin2:Landroid/preference/Preference;

    invoke-virtual {v3, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 487
    :cond_1
    iget-object v3, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonFDNList:Landroid/preference/Preference;

    if-eqz v3, :cond_2

    .line 488
    iget-object v3, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonFDNList:Landroid/preference/Preference;

    invoke-virtual {v3, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 490
    :cond_2
    new-instance v1, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v1, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 493
    .local v1, intentFilter:Landroid/content/IntentFilter;
    const-string v3, "android.intent.action.DUAL_SIM_MODE"

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 496
    const-string v3, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 499
    iget-object v3, p0, Lcom/mediatek/settings/FdnSetting2;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3, v1}, Lcom/mediatek/settings/FdnSetting2;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 500
    iget-object v3, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    iget-object v4, p0, Lcom/mediatek/settings/FdnSetting2;->mPhone:Lcom/android/internal/telephony/Phone;

    const/16 v5, 0xa

    iget v6, p0, Lcom/mediatek/settings/FdnSetting2;->mSimId:I

    invoke-virtual {v3, v4, v5, v6}, Lcom/android/phone/EditPinPreference;->initFdnModeData(Lcom/android/internal/telephony/Phone;II)V

    .line 501
    invoke-virtual {p0}, Lcom/mediatek/settings/FdnSetting2;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "sub_title_name"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 502
    invoke-virtual {p0}, Lcom/mediatek/settings/FdnSetting2;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "sub_title_name"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/FdnSetting2;->setTitle(Ljava/lang/CharSequence;)V

    .line 504
    :cond_3
    if-eqz p1, :cond_4

    .line 505
    invoke-direct {p0}, Lcom/mediatek/settings/FdnSetting2;->updateFDNPreference()V

    .line 507
    :cond_4
    invoke-direct {p0}, Lcom/mediatek/settings/FdnSetting2;->getRetryPin2Count()I

    move-result v3

    iput v3, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2Old:I

    .line 508
    const-string v3, "Settings/FdnSetting2"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onCreate,  mRetryPin2Old="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2Old:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 509
    invoke-direct {p0}, Lcom/mediatek/settings/FdnSetting2;->checkPhoneBookStateExit()V

    .line 510
    invoke-direct {p0}, Lcom/mediatek/settings/FdnSetting2;->setFDNSupport()V

    .line 511
    invoke-virtual {p0}, Lcom/mediatek/settings/FdnSetting2;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 512
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_5

    .line 514
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 516
    :cond_5
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 561
    const-string v0, "Settings/FdnSetting2"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 562
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 563
    iget-object v0, p0, Lcom/mediatek/settings/FdnSetting2;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/FdnSetting2;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 564
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 548
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 549
    .local v0, itemId:I
    packed-switch v0, :pswitch_data_0

    .line 556
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 551
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/settings/FdnSetting2;->finish()V

    .line 552
    const/4 v1, 0x1

    goto :goto_0

    .line 549
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public onPinEntered(Lcom/android/phone/EditPinPreference;Z)V
    .locals 2
    .parameter "preference"
    .parameter "positiveResult"

    .prologue
    .line 231
    iget-object v0, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    if-ne p1, v0, :cond_0

    .line 232
    const-string v0, "Settings/FdnSetting2"

    const-string v1, "onPinEntered"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    invoke-direct {p0, p2}, Lcom/mediatek/settings/FdnSetting2;->toggleFDNEnable(Z)V

    .line 235
    :cond_0
    return-void
.end method

.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 4
    .parameter "preference"

    .prologue
    const/4 v1, 0x1

    .line 202
    const-string v2, "Settings/FdnSetting2"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    iget-object v2, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonChangePin2:Landroid/preference/Preference;

    if-ne p1, v2, :cond_1

    .line 204
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 205
    .local v0, intent:Landroid/content/Intent;
    const-string v2, "pin2"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 206
    iget v2, p0, Lcom/mediatek/settings/FdnSetting2;->mSimId:I

    if-ltz v2, :cond_0

    .line 207
    const-string v2, "simId"

    iget v3, p0, Lcom/mediatek/settings/FdnSetting2;->mSimId:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 209
    :cond_0
    const-class v2, Lcom/android/phone/ChangeIccPinScreen;

    invoke-virtual {v0, p0, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 210
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/FdnSetting2;->startActivity(Landroid/content/Intent;)V

    .line 213
    .end local v0           #intent:Landroid/content/Intent;
    :cond_1
    iget-object v2, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonFDNList:Landroid/preference/Preference;

    if-ne p1, v2, :cond_2

    .line 214
    const-string v2, "Settings/FdnSetting2"

    const-string v3, "onPreferenceClick mButtonFDNList"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    invoke-direct {p0}, Lcom/mediatek/settings/FdnSetting2;->checkPhoneBookState()Z

    move-result v2

    if-nez v2, :cond_3

    .line 216
    const/4 v1, 0x0

    .line 224
    :cond_2
    :goto_0
    return v1

    .line 218
    :cond_3
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/android/phone/FdnList;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 219
    .restart local v0       #intent:Landroid/content/Intent;
    iget v2, p0, Lcom/mediatek/settings/FdnSetting2;->mSimId:I

    if-ltz v2, :cond_4

    .line 220
    const-string v2, "simId"

    iget v3, p0, Lcom/mediatek/settings/FdnSetting2;->mSimId:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 222
    :cond_4
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/FdnSetting2;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method protected onResume()V
    .locals 4

    .prologue
    .line 520
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 521
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 523
    const-string v1, "Settings/FdnSetting2"

    const-string v2, "onResume"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 524
    invoke-direct {p0}, Lcom/mediatek/settings/FdnSetting2;->updateFDNPreference()V

    .line 525
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    invoke-virtual {v1}, Lcom/android/phone/EditPinPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 527
    .local v0, fdnDialog:Landroid/app/Dialog;
    const-string v1, "Settings/FdnSetting2"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onResume, mRetryPin2New= "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2New:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " mRetryPin2Old="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2Old:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 530
    iget v1, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2New:I

    iget v2, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2Old:I

    if-eq v1, v2, :cond_1

    .line 531
    iget v1, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2New:I

    iput v1, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2Old:I

    .line 532
    const-string v1, "Settings/FdnSetting2"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onResume, fdnDialog= "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 533
    if-eqz v0, :cond_0

    .line 534
    const-string v1, "Settings/FdnSetting2"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onResume, fdnDialog.isShowing()="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 536
    :cond_0
    const-string v1, "Settings/FdnSetting2"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onResume, second mRetryPin2New= "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2New:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " mRetryPin2Old="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/FdnSetting2;->mRetryPin2Old:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 539
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 540
    const-string v1, "Settings/FdnSetting2"

    const-string v2, "onResume, isShowing"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 541
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;

    invoke-virtual {v1}, Lcom/android/phone/EditPinPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    .line 544
    :cond_1
    return-void
.end method

.method public showTipToast(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "title"
    .parameter "msg"

    .prologue
    .line 605
    const/4 v0, 0x1

    invoke-static {p0, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 606
    return-void
.end method
