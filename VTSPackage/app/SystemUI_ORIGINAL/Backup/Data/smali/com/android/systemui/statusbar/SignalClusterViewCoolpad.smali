.class public Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;
.super Landroid/widget/LinearLayout;
.source "SignalClusterViewCoolpad.java"

# interfaces
.implements Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;


# static fields
.field static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "SignalClusterViewCoolpad"


# instance fields
.field private mDataConnectionGroup:Landroid/view/ViewGroup;

.field private mDataNetType:[Lcom/mediatek/systemui/ext/NetworkType;

.field private mFlightMode:Landroid/view/View;

.field private mGeminiSimNum:I

.field private mIsAirplaneMode:Z

.field private mMobile:[Landroid/widget/ImageView;

.field private mMobile2:[Landroid/widget/ImageView;

.field private mMobileActivity:[Landroid/widget/ImageView;

.field private mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

.field private mMobileDescription:[Ljava/lang/String;

.field private mMobileGroup:[Landroid/view/ViewGroup;

.field private mMobileNetType:[Landroid/widget/ImageView;

.field private mMobileRoam:[Landroid/widget/ImageView;

.field private mMobileSlotIndicator:[Landroid/widget/ImageView;

.field private mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

.field private mMobileStrengthIdNum:I

.field private mMobileType:[Landroid/widget/ImageView;

.field private mMobileTypeDescription:[Ljava/lang/String;

.field private mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

.field private mMobileVisible:[Z

.field private mNC:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

.field private mRoaming:[Z

.field private mRoamingId:[I

.field private mSIMColorId:[I

.field private mShowSimIndicator:[Z

.field private mSignalClusterCombo:[Landroid/view/ViewGroup;

.field private mSignalNetworkType:[Landroid/widget/ImageView;

.field private mSimIndicatorResource:[I

.field private mSpacer:[Landroid/view/View;

.field private mWifi:Landroid/widget/ImageView;

.field private mWifiActivity:Landroid/widget/ImageView;

.field private mWifiActivityId:I

.field private mWifiDescription:Ljava/lang/String;

.field private mWifiGroup:Landroid/view/ViewGroup;

.field private mWifiStrengthId:I

.field private mWifiVisible:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 103
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 104
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 107
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 108
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v4, 0x0

    .line 111
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 60
    iput-boolean v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mIsAirplaneMode:Z

    .line 62
    iput-boolean v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiVisible:Z

    .line 63
    iput v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiStrengthId:I

    .line 64
    iput v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiActivityId:I

    .line 99
    sget v2, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    iput v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    .line 100
    const/4 v2, 0x2

    iput v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileStrengthIdNum:I

    .line 113
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Z

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mRoaming:[Z

    .line 114
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mRoamingId:[I

    .line 115
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Ljava/lang/String;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileDescription:[Ljava/lang/String;

    .line 116
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Ljava/lang/String;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileTypeDescription:[Ljava/lang/String;

    .line 117
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/view/ViewGroup;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    .line 118
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mSignalNetworkType:[Landroid/widget/ImageView;

    .line 119
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/view/ViewGroup;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileGroup:[Landroid/view/ViewGroup;

    .line 120
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileRoam:[Landroid/widget/ImageView;

    .line 121
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobile:[Landroid/widget/ImageView;

    .line 122
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobile2:[Landroid/widget/ImageView;

    .line 123
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileActivity:[Landroid/widget/ImageView;

    .line 124
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileType:[Landroid/widget/ImageView;

    .line 125
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/view/View;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mSpacer:[Landroid/view/View;

    .line 126
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileSlotIndicator:[Landroid/widget/ImageView;

    .line 127
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Lcom/mediatek/systemui/ext/NetworkType;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mDataNetType:[Lcom/mediatek/systemui/ext/NetworkType;

    .line 128
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileNetType:[Landroid/widget/ImageView;

    .line 129
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mSIMColorId:[I

    .line 130
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 131
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 132
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [[Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 133
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Z

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mShowSimIndicator:[Z

    .line 134
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mSimIndicatorResource:[I

    .line 135
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    new-array v2, v2, [Z

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileVisible:[Z

    .line 137
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    if-ge v0, v2, :cond_1

    .line 138
    iget-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    iget v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileStrengthIdNum:I

    new-array v3, v3, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    aput-object v3, v2, v0

    .line 139
    const/4 v1, 0x0

    .local v1, j:I
    :goto_1
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileStrengthIdNum:I

    if-ge v1, v2, :cond_0

    .line 140
    iget-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v2, v2, v0

    new-instance v3, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v3, v2, v1

    .line 139
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 142
    :cond_0
    iget-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    new-instance v3, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v3, v2, v0

    .line 143
    iget-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    new-instance v3, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v3, v2, v0

    .line 137
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 145
    .end local v1           #j:I
    :cond_1
    return-void
.end method


# virtual methods
.method public apply()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/16 v6, 0x8

    const/4 v5, 0x0

    .line 267
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiGroup:Landroid/view/ViewGroup;

    if-nez v1, :cond_1

    .line 268
    const-string v1, "SignalClusterViewCoolpad"

    const-string v2, "apply(), mWifiGroup is null, return"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 343
    :cond_0
    return-void

    .line 272
    :cond_1
    const-string v1, "SignalClusterViewCoolpad"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "apply(), mWifiVisible is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiVisible:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiVisible:Z

    if-eqz v1, :cond_3

    .line 274
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiGroup:Landroid/view/ViewGroup;

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 275
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifi:Landroid/widget/ImageView;

    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiStrengthId:I

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 276
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiActivity:Landroid/widget/ImageView;

    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiActivityId:I

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 277
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiGroup:Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiDescription:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 287
    :goto_0
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    if-ge v0, v1, :cond_0

    .line 288
    const-string v1, "SignalClusterViewCoolpad"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "apply(), slotId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", mMobileVisible="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileVisible:[Z

    aget-boolean v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileVisible:[Z

    aget-boolean v1, v1, v0

    if-eqz v1, :cond_2

    .line 290
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    aget-object v1, v1, v0

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 292
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mRoaming:[Z

    aget-boolean v1, v1, v0

    if-eqz v1, :cond_4

    .line 293
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileRoam:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    iget-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mRoamingId:[I

    aget v2, v2, v0

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 294
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileRoam:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 299
    :goto_2
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    if-nez v1, :cond_5

    .line 300
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileActivity:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 301
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileActivity:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    invoke-virtual {v1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 308
    :goto_3
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    aget-object v1, v1, v5

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    if-nez v1, :cond_6

    .line 309
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobile:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 310
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobile:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    invoke-virtual {v1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 316
    :goto_4
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    if-nez v1, :cond_7

    .line 317
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileType:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 318
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileType:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    invoke-virtual {v1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 324
    :goto_5
    const-string v1, "SignalClusterViewCoolpad"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "apply(), slotId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", mRoaming="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mRoaming:[Z

    aget-boolean v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " mMobileActivityId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, v0

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " mMobileTypeId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, v0

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " mMobileStrengthId[0] = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, v0

    aget-object v3, v3, v5

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " mMobileStrengthId[1] = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, v0

    const/4 v4, 0x1

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 330
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileGroup:[Landroid/view/ViewGroup;

    aget-object v1, v1, v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileTypeDescription:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileDescription:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 332
    const-string v1, "SignalClusterViewCoolpad"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "apply(). mIsAirplaneMode is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mIsAirplaneMode:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mIsAirplaneMode:Z

    if-eqz v1, :cond_8

    .line 334
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    aget-object v1, v1, v0

    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 335
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileRoam:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    invoke-virtual {v1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 336
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileActivity:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    invoke-virtual {v1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 337
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mFlightMode:Landroid/view/View;

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 287
    :cond_2
    :goto_6
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1

    .line 279
    .end local v0           #i:I
    :cond_3
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiGroup:Landroid/view/ViewGroup;

    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto/16 :goto_0

    .line 296
    .restart local v0       #i:I
    :cond_4
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileRoam:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    invoke-virtual {v1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_2

    .line 303
    :cond_5
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileActivity:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 304
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileActivity:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    iget-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_3

    .line 312
    :cond_6
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobile:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 313
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobile:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    iget-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v2, v2, v0

    aget-object v2, v2, v5

    invoke-virtual {v2}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_4

    .line 320
    :cond_7
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileType:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 321
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileType:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    iget-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_5

    .line 339
    :cond_8
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mFlightMode:Landroid/view/View;

    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_6
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 3
    .parameter "event"

    .prologue
    const/4 v2, 0x0

    .line 236
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiVisible:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiGroup:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 237
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiGroup:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileVisible:[Z

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileGroup:[Landroid/view/ViewGroup;

    aget-object v0, v0, v2

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 240
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileGroup:[Landroid/view/ViewGroup;

    aget-object v1, v1, v2

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v0

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 156
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 158
    const v0, 0x7f080012

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiGroup:Landroid/view/ViewGroup;

    .line 159
    const v0, 0x7f080013

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifi:Landroid/widget/ImageView;

    .line 160
    const v0, 0x7f080014

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiActivity:Landroid/widget/ImageView;

    .line 162
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobile:[Landroid/widget/ImageView;

    const v0, 0x7f080020

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    aput-object v0, v1, v2

    .line 163
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileGroup:[Landroid/view/ViewGroup;

    const v0, 0x7f08001f

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    aput-object v0, v1, v2

    .line 164
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileActivity:[Landroid/widget/ImageView;

    const v0, 0x7f08001b

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    aput-object v0, v1, v2

    .line 165
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileType:[Landroid/widget/ImageView;

    const v0, 0x7f08001e

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    aput-object v0, v1, v2

    .line 166
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileRoam:[Landroid/widget/ImageView;

    const v0, 0x7f080018

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    aput-object v0, v1, v2

    .line 167
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    const v0, 0x7f08001d

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    aput-object v0, v1, v2

    .line 170
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobile:[Landroid/widget/ImageView;

    const v0, 0x7f080024

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    aput-object v0, v1, v3

    .line 171
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileGroup:[Landroid/view/ViewGroup;

    const v0, 0x7f080023

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    aput-object v0, v1, v3

    .line 172
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileActivity:[Landroid/widget/ImageView;

    const v0, 0x7f08001c

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    aput-object v0, v1, v3

    .line 173
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileType:[Landroid/widget/ImageView;

    const v0, 0x7f080022

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    aput-object v0, v1, v3

    .line 174
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileRoam:[Landroid/widget/ImageView;

    const v0, 0x7f080019

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    aput-object v0, v1, v3

    .line 175
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    const v0, 0x7f080021

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    aput-object v0, v1, v3

    .line 177
    const v0, 0x7f080025

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mFlightMode:Landroid/view/View;

    .line 179
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->apply()V

    .line 180
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 184
    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiGroup:Landroid/view/ViewGroup;

    .line 185
    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifi:Landroid/widget/ImageView;

    .line 186
    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiActivity:Landroid/widget/ImageView;

    .line 187
    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mDataConnectionGroup:Landroid/view/ViewGroup;

    .line 189
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    if-ge v0, v1, :cond_0

    .line 190
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileGroup:[Landroid/view/ViewGroup;

    aput-object v2, v1, v0

    .line 191
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobile:[Landroid/widget/ImageView;

    aput-object v2, v1, v0

    .line 192
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileActivity:[Landroid/widget/ImageView;

    aput-object v2, v1, v0

    .line 193
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileType:[Landroid/widget/ImageView;

    aput-object v2, v1, v0

    .line 194
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mSpacer:[Landroid/view/View;

    aput-object v2, v1, v0

    .line 195
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileRoam:[Landroid/widget/ImageView;

    aput-object v2, v1, v0

    .line 196
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileNetType:[Landroid/widget/ImageView;

    aput-object v2, v1, v0

    .line 197
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobile2:[Landroid/widget/ImageView;

    aput-object v2, v1, v0

    .line 189
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 200
    :cond_0
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 201
    return-void
.end method

.method public setDataNetType3G(ILcom/mediatek/systemui/ext/NetworkType;)V
    .locals 3
    .parameter "slotId"
    .parameter "dataNetType"

    .prologue
    .line 261
    const-string v0, "SignalClusterViewCoolpad"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setDataNetType3G("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "), dataNetType="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mDataNetType:[Lcom/mediatek/systemui/ext/NetworkType;

    aput-object p2, v0, p1

    .line 263
    return-void
.end method

.method public setIsAirplaneMode(Z)V
    .locals 3
    .parameter "is"

    .prologue
    .line 228
    const-string v0, "SignalClusterViewCoolpad"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setIsAirplaneMode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    iput-boolean p1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mIsAirplaneMode:Z

    .line 230
    return-void
.end method

.method public setMobileDataIndicators(IZ[Lcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .parameter "slotId"
    .parameter "visible"
    .parameter "strengthIcon"
    .parameter "activityIcon"
    .parameter "typeIcon"
    .parameter "contentDescription"
    .parameter "typeContentDescription"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 215
    const-string v0, "SignalClusterViewCoolpad"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setMobileDataIndicators("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "), visible="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", strengthIcon[0] ~ [1] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget-object v2, p3, v3

    invoke-virtual {v2}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ~ "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget-object v2, p3, v4

    invoke-virtual {v2}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileVisible:[Z

    aput-boolean p2, v0, p1

    .line 219
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v0, v0, p1

    aget-object v1, p3, v3

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v1

    aput-object v1, v0, v3

    .line 220
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v0, v0, p1

    aget-object v1, p3, v4

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v1

    aput-object v1, v0, v4

    .line 221
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-virtual {p4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v1

    aput-object v1, v0, p1

    .line 222
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-virtual {p5}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v1

    aput-object v1, v0, p1

    .line 223
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileDescription:[Ljava/lang/String;

    aput-object p6, v0, p1

    .line 224
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mMobileTypeDescription:[Ljava/lang/String;

    aput-object p7, v0, p1

    .line 225
    return-void
.end method

.method public setNetworkControllerCoolpad(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)V
    .locals 0
    .parameter "nc"

    .prologue
    .line 151
    iput-object p1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mNC:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    .line 152
    return-void
.end method

.method public setRoamingFlagandResource([Z[I)V
    .locals 4
    .parameter "roaming"
    .parameter "roamingId"

    .prologue
    .line 246
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mGeminiSimNum:I

    if-ge v0, v1, :cond_0

    .line 247
    const-string v1, "SignalClusterViewCoolpad"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setRoamingFlagandResource("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "), roaming="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-boolean v3, p1, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", roamingId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget v3, p2, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mRoaming:[Z

    aget-boolean v2, p1, v0

    aput-boolean v2, v1, v0

    .line 249
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mRoamingId:[I

    aget v2, p2, v0

    aput v2, v1, v0

    .line 246
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 251
    :cond_0
    return-void
.end method

.method public setShowSimIndicator(IZI)V
    .locals 3
    .parameter "slotId"
    .parameter "showSimIndicator"
    .parameter "simIndicatorResource"

    .prologue
    .line 254
    const-string v0, "SignalClusterViewCoolpad"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setShowSimIndicator("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "), showSimIndicator="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " simIndicatorResource = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mShowSimIndicator:[Z

    aput-boolean p2, v0, p1

    .line 257
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mSimIndicatorResource:[I

    aput p3, v0, p1

    .line 258
    return-void
.end method

.method public setWifiIndicators(ZIILjava/lang/String;)V
    .locals 3
    .parameter "visible"
    .parameter "strengthIcon"
    .parameter "activityIcon"
    .parameter "contentDescription"

    .prologue
    .line 205
    const-string v0, "SignalClusterViewCoolpad"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setWifiIndicators, visible="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", strengthIcon="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", activityIcon="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", contentDescription="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    iput-boolean p1, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiVisible:Z

    .line 208
    iput p2, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiStrengthId:I

    .line 209
    iput p3, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiActivityId:I

    .line 210
    iput-object p4, p0, Lcom/android/systemui/statusbar/SignalClusterViewCoolpad;->mWifiDescription:Ljava/lang/String;

    .line 211
    return-void
.end method
