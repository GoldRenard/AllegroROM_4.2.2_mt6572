.class public Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;
.super Landroid/widget/LinearLayout;
.source "MediatekCarrierText.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$2;,
        Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MediatekCarrierText"

.field private static mSeparator:Ljava/lang/CharSequence;


# instance fields
.field private mCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitorCallback;

.field private mCarrierDivider:[Landroid/widget/TextView;

.field private mCarrierView:[Landroid/widget/TextView;

.field private mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

.field private mPlmn:[Ljava/lang/CharSequence;

.field private mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

.field private mSpn:[Ljava/lang/CharSequence;

.field private mStatusMode:[Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 141
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 142
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->initMembers()V

    .line 143
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v2, 0x1

    .line 146
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 50
    new-instance v1, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitorCallback;

    .line 147
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->initMembers()V

    .line 148
    const-string v1, "layout_inflater"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 150
    .local v0, inflater:Landroid/view/LayoutInflater;
    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->isGemini()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 151
    const v1, 0x207000b

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 155
    :goto_0
    new-instance v1, Lcom/android/internal/widget/LockPatternUtils;

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 156
    return-void

    .line 153
    :cond_0
    const v1, 0x207000a

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Ljava/lang/CharSequence;
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mPlmn:[Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Ljava/lang/CharSequence;
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSpn:[Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Lcom/android/internal/telephony/IccCardConstants$State;
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mStatusMode:[Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;Ljava/lang/String;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->updateCarrierTextGeminiForSearchNetwork(Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;Lcom/android/internal/telephony/IccCardConstants$State;)Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->getStatusForIccState(Lcom/android/internal/telephony/IccCardConstants$State;)Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    move-result-object v0

    return-object v0
.end method

.method private static concatenate(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 5
    .parameter "plmn"
    .parameter "spn"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 319
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    move v0, v2

    .line 320
    .local v0, plmnValid:Z
    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    move v1, v2

    .line 321
    .local v1, spnValid:Z
    :goto_1
    if-eqz v0, :cond_3

    if-eqz v1, :cond_3

    .line 322
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSeparator:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 328
    .end local p0
    :cond_0
    :goto_2
    return-object p0

    .end local v0           #plmnValid:Z
    .end local v1           #spnValid:Z
    .restart local p0
    :cond_1
    move v0, v3

    .line 319
    goto :goto_0

    .restart local v0       #plmnValid:Z
    :cond_2
    move v1, v3

    .line 320
    goto :goto_1

    .line 323
    .restart local v1       #spnValid:Z
    :cond_3
    if-nez v0, :cond_0

    .line 325
    if-eqz v1, :cond_4

    move-object p0, p1

    .line 326
    goto :goto_2

    .line 328
    :cond_4
    const-string p0, ""

    goto :goto_2
.end method

.method private getCarrierTextForSimState(Lcom/android/internal/telephony/IccCardConstants$State;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 5
    .parameter "simState"
    .parameter "plmn"
    .parameter "spn"

    .prologue
    const v4, 0x10402f5

    .line 206
    if-nez p2, :cond_0

    if-nez p3, :cond_0

    .line 207
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->getDefaultPlmn()Ljava/lang/CharSequence;

    move-result-object p2

    .line 210
    :cond_0
    const/4 v0, 0x0

    .line 211
    .local v0, carrierText:Ljava/lang/CharSequence;
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->getStatusForIccState(Lcom/android/internal/telephony/IccCardConstants$State;)Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    move-result-object v1

    .line 212
    .local v1, status:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;
    sget-object v2, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$2;->$SwitchMap$com$android$internal$policy$impl$keyguard$MediatekCarrierText$StatusMode:[I

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 260
    :goto_0
    const-string v2, "MediatekCarrierText"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getCarrierTextForSimState simState="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", PLMN="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", SPN="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " carrierText="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    return-object v0

    .line 215
    :pswitch_0
    invoke-static {p2, p3}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->concatenate(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 216
    goto :goto_0

    .line 219
    :pswitch_1
    invoke-static {p2, p3}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->concatenate(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 220
    goto :goto_0

    .line 223
    :pswitch_2
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mContext:Landroid/content/Context;

    const v3, 0x1040301

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-direct {p0, v2, p2}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->makeCarrierStringOnEmergencyCapable(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 225
    goto :goto_0

    .line 232
    :pswitch_3
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-direct {p0, v2, p2}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->makeCarrierStringOnEmergencyCapable(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 235
    goto :goto_0

    .line 238
    :pswitch_4
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x10402f9

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 239
    goto :goto_0

    .line 242
    :pswitch_5
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-direct {p0, v2, p2}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->makeCarrierStringOnEmergencyCapable(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 245
    goto :goto_0

    .line 248
    :pswitch_6
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x1040304

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-direct {p0, v2, p2}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->makeCarrierStringOnEmergencyCapable(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 251
    goto/16 :goto_0

    .line 254
    :pswitch_7
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x1040302

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-direct {p0, v2, p2}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->makeCarrierStringOnEmergencyCapable(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    goto/16 :goto_0

    .line 212
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method private getDefaultPlmn()Ljava/lang/CharSequence;
    .locals 2

    .prologue
    .line 458
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x10402e6

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method private getStatusForIccState(Lcom/android/internal/telephony/IccCardConstants$State;)Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;
    .locals 3
    .parameter "simState"

    .prologue
    .line 280
    if-nez p1, :cond_0

    .line 281
    sget-object v1, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;->SimUnknown:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    .line 315
    :goto_0
    return-object v1

    .line 284
    :cond_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->getInstance(Landroid/content/Context;)Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->isDeviceProvisioned()Z

    move-result v1

    if-nez v1, :cond_2

    sget-object v1, Lcom/android/internal/telephony/IccCardConstants$State;->ABSENT:Lcom/android/internal/telephony/IccCardConstants$State;

    if-eq p1, v1, :cond_1

    sget-object v1, Lcom/android/internal/telephony/IccCardConstants$State;->PERM_DISABLED:Lcom/android/internal/telephony/IccCardConstants$State;

    if-ne p1, v1, :cond_2

    :cond_1
    const/4 v0, 0x1

    .line 290
    .local v0, missingAndNotProvisioned:Z
    :goto_1
    if-eqz v0, :cond_3

    .line 291
    sget-object v1, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;->SimMissingLocked:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    goto :goto_0

    .line 284
    .end local v0           #missingAndNotProvisioned:Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    .line 296
    .restart local v0       #missingAndNotProvisioned:Z
    :cond_3
    sget-object v1, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$2;->$SwitchMap$com$android$internal$telephony$IccCardConstants$State:[I

    invoke-virtual {p1}, Lcom/android/internal/telephony/IccCardConstants$State;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 315
    sget-object v1, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;->SimMissing:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    goto :goto_0

    .line 298
    :pswitch_0
    sget-object v1, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;->SimMissing:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    goto :goto_0

    .line 301
    :pswitch_1
    sget-object v1, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;->NetworkLocked:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    goto :goto_0

    .line 303
    :pswitch_2
    sget-object v1, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;->SimNotReady:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    goto :goto_0

    .line 305
    :pswitch_3
    sget-object v1, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;->SimLocked:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    goto :goto_0

    .line 307
    :pswitch_4
    sget-object v1, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;->SimPukLocked:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    goto :goto_0

    .line 309
    :pswitch_5
    sget-object v1, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;->Normal:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    goto :goto_0

    .line 311
    :pswitch_6
    sget-object v1, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;->SimPermDisabled:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    goto :goto_0

    .line 313
    :pswitch_7
    sget-object v1, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;->SimUnknown:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    goto :goto_0

    .line 296
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method private initMembers()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 126
    const/4 v1, 0x4

    new-array v1, v1, [Landroid/widget/TextView;

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    .line 127
    const/4 v1, 0x3

    new-array v1, v1, [Landroid/widget/TextView;

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierDivider:[Landroid/widget/TextView;

    .line 128
    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->getNumOfSim()I

    move-result v1

    new-array v1, v1, [Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mStatusMode:[Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    .line 129
    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->getNumOfSim()I

    move-result v1

    new-array v1, v1, [Lcom/android/internal/telephony/IccCardConstants$State;

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    .line 130
    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->getNumOfSim()I

    move-result v1

    new-array v1, v1, [Ljava/lang/CharSequence;

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mPlmn:[Ljava/lang/CharSequence;

    .line 131
    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->getNumOfSim()I

    move-result v1

    new-array v1, v1, [Ljava/lang/CharSequence;

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSpn:[Ljava/lang/CharSequence;

    .line 132
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->getMaxSimId()I

    move-result v1

    if-gt v0, v1, :cond_0

    .line 133
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mStatusMode:[Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    sget-object v2, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;->Normal:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    aput-object v2, v1, v0

    .line 134
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->READY:Lcom/android/internal/telephony/IccCardConstants$State;

    aput-object v2, v1, v0

    .line 135
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mPlmn:[Ljava/lang/CharSequence;

    aput-object v3, v1, v0

    .line 136
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSpn:[Ljava/lang/CharSequence;

    aput-object v3, v1, v0

    .line 132
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 138
    :cond_0
    return-void
.end method

.method private isWifiOnlyDevice()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 365
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 366
    .local v0, cm:Landroid/net/ConnectivityManager;
    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->isNetworkSupported(I)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method private makeCarrierStringOnEmergencyCapable(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 1
    .parameter "simMessage"
    .parameter "emergencyCallMessage"

    .prologue
    .line 269
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v0}, Lcom/android/internal/widget/LockPatternUtils;->isEmergencyCallCapable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 270
    invoke-static {p1, p2}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->concatenate(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    .line 272
    .end local p1
    :cond_0
    return-object p1
.end method

.method private showOrHideCarrier()V
    .locals 11

    .prologue
    const/4 v6, 0x1

    const/4 v10, 0x2

    const/16 v9, 0x8

    const/4 v5, 0x0

    .line 378
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->isWifiOnlyDevice()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 379
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->getMaxSimId()I

    move-result v5

    if-gt v0, v5, :cond_1

    .line 380
    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v5, v5, v0

    if-eqz v5, :cond_0

    .line 381
    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v5, v5, v0

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 379
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 385
    :cond_1
    const/4 v0, 0x0

    :goto_1
    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->getMaxSimId()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-gt v0, v5, :cond_10

    .line 386
    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierDivider:[Landroid/widget/TextView;

    aget-object v5, v5, v0

    if-eqz v5, :cond_2

    .line 387
    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierDivider:[Landroid/widget/TextView;

    aget-object v5, v5, v0

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 385
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 391
    .end local v0           #i:I
    :cond_3
    const/4 v3, 0x0

    .line 392
    .local v3, mNumOfSIM:I
    const/4 v1, 0x0

    .line 393
    .local v1, mCarrierLeft:Landroid/widget/TextView;
    const/4 v2, 0x0

    .line 395
    .local v2, mCarrierRight:Landroid/widget/TextView;
    const/4 v0, 0x0

    .restart local v0       #i:I
    :goto_2
    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->getMaxSimId()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    if-gt v0, v7, :cond_5

    .line 396
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierDivider:[Landroid/widget/TextView;

    aget-object v7, v7, v0

    if-eqz v7, :cond_4

    .line 397
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierDivider:[Landroid/widget/TextView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 395
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 401
    :cond_5
    const/4 v0, 0x0

    :goto_3
    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->getMaxSimId()I

    move-result v7

    if-gt v0, v7, :cond_e

    .line 402
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mStatusMode:[Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    aget-object v7, v7, v0

    sget-object v8, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;->SimMissing:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    if-eq v7, v8, :cond_6

    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mStatusMode:[Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    aget-object v7, v7, v0

    sget-object v8, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;->SimMissingLocked:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    if-eq v7, v8, :cond_6

    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mStatusMode:[Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    aget-object v7, v7, v0

    sget-object v8, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;->SimUnknown:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    if-eq v7, v8, :cond_6

    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->getInstance(Landroid/content/Context;)Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;

    move-result-object v7

    invoke-virtual {v7, v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->isSIMInserted(I)Z

    move-result v7

    if-nez v7, :cond_b

    :cond_6
    move v4, v6

    .line 406
    .local v4, simMissing:Z
    :goto_4
    if-nez v4, :cond_d

    .line 407
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v7, v7, v0

    if-eqz v7, :cond_7

    .line 408
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 410
    :cond_7
    add-int/lit8 v3, v3, 0x1

    .line 411
    if-ne v3, v6, :cond_c

    .line 412
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v1, v7, v0

    .line 416
    :cond_8
    :goto_5
    if-lt v3, v10, :cond_9

    add-int/lit8 v7, v0, -0x1

    if-ltz v7, :cond_9

    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierDivider:[Landroid/widget/TextView;

    if-eqz v7, :cond_9

    .line 417
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierDivider:[Landroid/widget/TextView;

    add-int/lit8 v8, v0, -0x1

    aget-object v7, v7, v8

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 418
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierDivider:[Landroid/widget/TextView;

    add-int/lit8 v8, v0, -0x1

    aget-object v7, v7, v8

    const-string v8, "|"

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 425
    :cond_9
    :goto_6
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v7, v7, v0

    if-eqz v7, :cond_a

    .line 426
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v7, v7, v0

    const/16 v8, 0x11

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setGravity(I)V

    .line 401
    :cond_a
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .end local v4           #simMissing:Z
    :cond_b
    move v4, v5

    .line 402
    goto :goto_4

    .line 413
    .restart local v4       #simMissing:Z
    :cond_c
    if-ne v3, v10, :cond_8

    .line 414
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v2, v7, v0

    goto :goto_5

    .line 421
    :cond_d
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v7, v7, v0

    if-eqz v7, :cond_9

    .line 422
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_6

    .line 430
    .end local v4           #simMissing:Z
    :cond_e
    if-ne v3, v10, :cond_11

    .line 431
    if-eqz v1, :cond_f

    .line 432
    const/4 v5, 0x5

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 434
    :cond_f
    if-eqz v2, :cond_10

    .line 435
    const/4 v5, 0x3

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 444
    .end local v1           #mCarrierLeft:Landroid/widget/TextView;
    .end local v2           #mCarrierRight:Landroid/widget/TextView;
    .end local v3           #mNumOfSIM:I
    :cond_10
    :goto_7
    return-void

    .line 437
    .restart local v1       #mCarrierLeft:Landroid/widget/TextView;
    .restart local v2       #mCarrierRight:Landroid/widget/TextView;
    .restart local v3       #mNumOfSIM:I
    :cond_11
    if-nez v3, :cond_10

    .line 438
    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v6, v6, v5

    if-eqz v6, :cond_12

    .line 439
    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v6, v6, v5

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 441
    :cond_12
    const-string v5, "MediatekCarrierText"

    const-string v6, "updateOperatorInfo, force the slotId 0 to visible."

    invoke-static {v5, v6}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7
.end method

.method private updateCarrierTextGeminiForSearchNetwork(Ljava/lang/String;I)V
    .locals 3
    .parameter "carrierText"
    .parameter "simId"

    .prologue
    .line 447
    const-string v0, "MediatekCarrierText"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateCarrierTextGeminiForSearchNetwork carrierText="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", simId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 448
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->isWifiOnlyDevice()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 449
    const-string v0, "MediatekCarrierText"

    const-string v1, "updateCarrierTextGeminiForSearchNetwork WifiOnly"

    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 450
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 455
    :goto_0
    return-void

    .line 452
    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v0, v0, p2

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 453
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->showOrHideCarrier()V

    goto :goto_0
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 183
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 184
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->getInstance(Landroid/content/Context;)Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitorCallback;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->registerCallback(Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitorCallback;)V

    .line 185
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 189
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 190
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->getInstance(Landroid/content/Context;)Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitorCallback;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->removeCallback(Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitorCallback;)V

    .line 191
    return-void
.end method

.method protected onFinishInflate()V
    .locals 7

    .prologue
    const v6, 0x210001e

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 160
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 162
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x1040543

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSeparator:Ljava/lang/CharSequence;

    .line 163
    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->isGemini()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 164
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    invoke-virtual {p0, v6}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    aput-object v0, v1, v3

    .line 165
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    const v0, 0x2100020

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    aput-object v0, v1, v2

    .line 166
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    const v0, 0x2100022

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    aput-object v0, v1, v4

    .line 167
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    const v0, 0x2100024

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    aput-object v0, v1, v5

    .line 168
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierDivider:[Landroid/widget/TextView;

    const v0, 0x210001f

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    aput-object v0, v1, v3

    .line 169
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierDivider:[Landroid/widget/TextView;

    const v0, 0x2100021

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    aput-object v0, v1, v2

    .line 170
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierDivider:[Landroid/widget/TextView;

    const v0, 0x2100023

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    aput-object v0, v1, v4

    .line 171
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v0, v0, v3

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setSelected(Z)V

    .line 172
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v0, v0, v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setSelected(Z)V

    .line 173
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v0, v0, v4

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setSelected(Z)V

    .line 174
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v0, v0, v5

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setSelected(Z)V

    .line 179
    :goto_0
    return-void

    .line 176
    :cond_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    invoke-virtual {p0, v6}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    aput-object v0, v1, v3

    .line 177
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v0, v0, v3

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setSelected(Z)V

    goto :goto_0
.end method

.method protected updateCarrierTextGemini(Lcom/android/internal/telephony/IccCardConstants$State;Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)V
    .locals 5
    .parameter "simState"
    .parameter "plmn"
    .parameter "spn"
    .parameter "simId"

    .prologue
    .line 334
    const-string v2, "MediatekCarrierText"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateCarrierTextGemini, simState="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", plmn="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", spn="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", simId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 337
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    aget-object v1, v2, p4

    .line 338
    .local v1, toSetCarrierView:Landroid/widget/TextView;
    sget-object v2, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;->NetworkSearching:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mStatusMode:[Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    aget-object v3, v3, p4

    if-ne v2, v3, :cond_0

    .line 339
    const-string v2, "MediatekCarrierText"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateCarrierTextGemini, searching network now, don\'t interrupt it, simState="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 359
    :goto_0
    return-void

    .line 343
    :cond_0
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mStatusMode:[Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->getStatusForIccState(Lcom/android/internal/telephony/IccCardConstants$State;)Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    move-result-object v3

    aput-object v3, v2, p4

    .line 345
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->isWifiOnlyDevice()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 346
    const-string v2, "MediatekCarrierText"

    const-string v3, "updateCarrierText WifiOnly"

    invoke-static {v2, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 347
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mCarrierView:[Landroid/widget/TextView;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 351
    :cond_1
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->showOrHideCarrier()V

    .line 353
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->getCarrierTextForSimState(Lcom/android/internal/telephony/IccCardConstants$State;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 354
    .local v0, text:Ljava/lang/CharSequence;
    sget-boolean v2, Lcom/android/internal/policy/impl/keyguard/KeyguardViewManager;->USE_UPPER_CASE:Z

    if-eqz v2, :cond_3

    .line 355
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    goto :goto_1

    .line 357
    :cond_3
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
