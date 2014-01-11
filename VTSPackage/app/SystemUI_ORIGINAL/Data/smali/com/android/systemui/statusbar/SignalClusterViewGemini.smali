.class public Lcom/android/systemui/statusbar/SignalClusterViewGemini;
.super Landroid/widget/LinearLayout;
.source "SignalClusterViewGemini.java"

# interfaces
.implements Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;


# static fields
.field static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "SignalClusterViewGemini"


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

.field private mNC:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

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
    .line 102
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 103
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 106
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 107
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v4, 0x0

    .line 110
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 59
    iput-boolean v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mIsAirplaneMode:Z

    .line 61
    iput-boolean v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiVisible:Z

    .line 62
    iput v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiStrengthId:I

    .line 63
    iput v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiActivityId:I

    .line 98
    sget v2, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    iput v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    .line 99
    const/4 v2, 0x2

    iput v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthIdNum:I

    .line 112
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Z

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mRoaming:[Z

    .line 113
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mRoamingId:[I

    .line 114
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Ljava/lang/String;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileDescription:[Ljava/lang/String;

    .line 115
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Ljava/lang/String;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileTypeDescription:[Ljava/lang/String;

    .line 116
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/view/ViewGroup;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    .line 117
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalNetworkType:[Landroid/widget/ImageView;

    .line 118
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/view/ViewGroup;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileGroup:[Landroid/view/ViewGroup;

    .line 119
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileRoam:[Landroid/widget/ImageView;

    .line 120
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile:[Landroid/widget/ImageView;

    .line 121
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile2:[Landroid/widget/ImageView;

    .line 122
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivity:[Landroid/widget/ImageView;

    .line 123
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileType:[Landroid/widget/ImageView;

    .line 124
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/view/View;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSpacer:[Landroid/view/View;

    .line 125
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileSlotIndicator:[Landroid/widget/ImageView;

    .line 126
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Lcom/mediatek/systemui/ext/NetworkType;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mDataNetType:[Lcom/mediatek/systemui/ext/NetworkType;

    .line 127
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileNetType:[Landroid/widget/ImageView;

    .line 128
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSIMColorId:[I

    .line 129
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 130
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 131
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [[Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 132
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Z

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mShowSimIndicator:[Z

    .line 133
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSimIndicatorResource:[I

    .line 134
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    new-array v2, v2, [Z

    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileVisible:[Z

    .line 136
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    if-ge v0, v2, :cond_1

    .line 137
    iget-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    iget v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthIdNum:I

    new-array v3, v3, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    aput-object v3, v2, v0

    .line 138
    const/4 v1, 0x0

    .local v1, j:I
    :goto_1
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthIdNum:I

    if-ge v1, v2, :cond_0

    .line 139
    iget-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v2, v2, v0

    new-instance v3, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v3, v2, v1

    .line 138
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 141
    :cond_0
    iget-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    new-instance v3, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v3, v2, v0

    .line 142
    iget-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    new-instance v3, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v3, v2, v0

    .line 136
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 144
    .end local v1           #j:I
    :cond_1
    return-void
.end method

.method private shouldMobileGroupVisible(I)Z
    .locals 4
    .parameter "slotId"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 459
    invoke-static {p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->isSimInserted(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 469
    :cond_0
    :goto_0
    return v1

    .line 461
    :cond_1
    if-nez p1, :cond_3

    .line 462
    const/4 v0, 0x1

    .local v0, i:I
    :goto_1
    iget v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    if-ge v0, v3, :cond_0

    .line 463
    invoke-static {v0}, Lcom/android/systemui/statusbar/util/SIMHelper;->isSimInserted(I)Z

    move-result v3

    if-eqz v3, :cond_2

    move v1, v2

    .line 464
    goto :goto_0

    .line 462
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v0           #i:I
    :cond_3
    move v1, v2

    .line 469
    goto :goto_0
.end method


# virtual methods
.method public apply()V
    .locals 15

    .prologue
    const/4 v14, 0x4

    const/4 v13, 0x1

    const/4 v12, 0x0

    const/16 v9, 0x8

    const/4 v8, 0x0

    .line 286
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiGroup:Landroid/view/ViewGroup;

    if-nez v7, :cond_0

    .line 287
    const-string v7, "SignalClusterViewGemini"

    const-string v8, "apply(), mWifiGroup is null, return"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 455
    :goto_0
    return-void

    .line 291
    :cond_0
    const-string v7, "SignalClusterViewGemini"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "apply(), mWifiVisible is "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-boolean v11, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiVisible:Z

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v7, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    iget-boolean v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiVisible:Z

    if-eqz v7, :cond_b

    .line 293
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiGroup:Landroid/view/ViewGroup;

    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 294
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifi:Landroid/widget/ImageView;

    iget v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiStrengthId:I

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 295
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiActivity:Landroid/widget/ImageView;

    iget v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiActivityId:I

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 296
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiGroup:Landroid/view/ViewGroup;

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiDescription:Ljava/lang/String;

    invoke-virtual {v7, v10}, Landroid/view/ViewGroup;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 306
    :goto_1
    const/4 v0, 0x0

    .local v0, i:I
    :goto_2
    iget v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    if-ge v0, v7, :cond_1d

    .line 307
    invoke-direct {p0, v0}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->shouldMobileGroupVisible(I)Z

    move-result v2

    .line 308
    .local v2, mShouldMobileGroupVisible:Z
    const-string v7, "SignalClusterViewGemini"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "apply(), slotId="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", mMobileVisible="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileVisible:[Z

    aget-boolean v11, v11, v0

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", mShouldMobileGroupVisible="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v7, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileVisible:[Z

    aget-boolean v7, v7, v0

    if-eqz v7, :cond_1b

    if-eqz v2, :cond_1b

    .line 310
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    aget-object v7, v7, v0

    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 311
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mRoaming:[Z

    aget-boolean v7, v7, v0

    if-eqz v7, :cond_c

    .line 312
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileRoam:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mRoamingId:[I

    aget v10, v10, v0

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 313
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileRoam:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 318
    :goto_3
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mContext:Landroid/content/Context;

    invoke-static {v10}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v10

    invoke-interface {v10, v0}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthNullIconGemini(I)I

    move-result v10

    if-eq v7, v10, :cond_1

    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    const v10, 0x7f0201ed

    if-ne v7, v10, :cond_2

    .line 320
    :cond_1
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileRoam:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 323
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 328
    :cond_2
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    if-eqz v7, :cond_d

    .line 329
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v0

    aget-object v10, v10, v8

    invoke-virtual {v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 337
    :goto_4
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v13

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    if-eqz v7, :cond_f

    .line 338
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile2:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v0

    aget-object v10, v10, v13

    invoke-virtual {v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 347
    :goto_5
    sget-object v7, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X3G:Lcom/mediatek/systemui/ext/NetworkType;

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mDataNetType:[Lcom/mediatek/systemui/ext/NetworkType;

    aget-object v10, v10, v0

    if-eq v7, v10, :cond_3

    .line 348
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile2:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 350
    :cond_3
    const-string v7, "SignalClusterViewGemini"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "apply(), slotId="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", mRoaming="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mRoaming:[Z

    aget-boolean v11, v11, v0

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " mMobileActivityId="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v0

    invoke-virtual {v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " mMobileTypeId="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v0

    invoke-virtual {v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " mMobileStrengthId[0] = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v0

    aget-object v11, v11, v8

    invoke-virtual {v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " mMobileStrengthId[1] = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v0

    aget-object v11, v11, v13

    invoke-virtual {v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v7, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    if-eqz v7, :cond_11

    .line 357
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivity:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v0

    invoke-virtual {v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 365
    :goto_6
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    if-eqz v7, :cond_13

    .line 366
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v0

    invoke-virtual {v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 375
    :goto_7
    invoke-static {v0}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSimIndicatorStateGemini(I)I

    move-result v6

    .line 376
    .local v6, state:I
    invoke-static {v0}, Lcom/android/systemui/statusbar/util/SIMHelper;->isSimInserted(I)Z

    move-result v7

    if-eqz v7, :cond_17

    const/4 v7, 0x2

    if-eq v7, v6, :cond_17

    if-eq v14, v6, :cond_17

    const/4 v7, 0x3

    if-eq v7, v6, :cond_17

    if-eq v13, v6, :cond_17

    .line 381
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mContext:Landroid/content/Context;

    invoke-static {v7, v0}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v5

    .line 382
    .local v5, simColorId:I
    const/4 v7, -0x1

    if-le v5, v7, :cond_6

    if-ge v5, v14, :cond_6

    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mDataNetType:[Lcom/mediatek/systemui/ext/NetworkType;

    aget-object v7, v7, v0

    if-eqz v7, :cond_6

    .line 383
    new-instance v3, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v3, v8}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    .line 384
    .local v3, resId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v7

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mDataNetType:[Lcom/mediatek/systemui/ext/NetworkType;

    aget-object v10, v10, v0

    invoke-interface {v7, v10, v5}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getDataNetworkTypeIconGemini(Lcom/mediatek/systemui/ext/NetworkType;I)I

    move-result v1

    .line 386
    .local v1, id:I
    const/4 v7, -0x1

    if-eq v1, v7, :cond_4

    .line 387
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v7

    invoke-interface {v7}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v3, v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 388
    invoke-virtual {v3, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 390
    :cond_4
    const-string v7, "SignalClusterViewGemini"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "apply(), slot="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", mDataNetType="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mDataNetType:[Lcom/mediatek/systemui/ext/NetworkType;

    aget-object v11, v11, v0

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " resId= "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " simColorId = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v7, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 392
    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    if-eqz v7, :cond_15

    .line 393
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalNetworkType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 401
    :goto_8
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalNetworkType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 402
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mContext:Landroid/content/Context;

    invoke-static {v10}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v10

    invoke-interface {v10, v0}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthNullIconGemini(I)I

    move-result v10

    if-eq v7, v10, :cond_5

    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    if-eqz v7, :cond_5

    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    const v10, 0x7f0201ed

    if-ne v7, v10, :cond_6

    .line 404
    :cond_5
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalNetworkType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 411
    .end local v1           #id:I
    .end local v3           #resId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v5           #simColorId:I
    :cond_6
    :goto_9
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mContext:Landroid/content/Context;

    invoke-static {v10}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v10

    invoke-interface {v10, v0}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthNullIconGemini(I)I

    move-result v10

    if-eq v7, v10, :cond_7

    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    const v10, 0x7f0201ed

    if-ne v7, v10, :cond_8

    .line 413
    :cond_7
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileSlotIndicator:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v14}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 415
    :cond_8
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileGroup:[Landroid/view/ViewGroup;

    aget-object v7, v7, v0

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileTypeDescription:[Ljava/lang/String;

    aget-object v11, v11, v0

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileDescription:[Ljava/lang/String;

    aget-object v11, v11, v0

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Landroid/view/ViewGroup;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 416
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mShowSimIndicator:[Z

    aget-boolean v7, v7, v0

    if-eqz v7, :cond_18

    .line 417
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSimIndicatorResource:[I

    aget v10, v10, v0

    invoke-virtual {v7, v10}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 421
    :goto_a
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    aget-object v7, v7, v0

    const/4 v10, 0x3

    invoke-virtual {v7, v8, v8, v8, v10}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 424
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v7

    invoke-interface {v7}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->supportDataTypeAlwaysDisplayWhileOn()Z

    move-result v7

    if-eqz v7, :cond_19

    .line 425
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 431
    :goto_b
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v7

    invoke-interface {v7, v0}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthSearchingIconGemini(I)I

    move-result v3

    .line 432
    .local v3, resId:I
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v7

    invoke-interface {v7, v0}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthNullIconGemini(I)I

    move-result v4

    .line 433
    .local v4, resId1:I
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    if-eq v3, v7, :cond_9

    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    if-eq v4, v7, :cond_9

    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    const v10, 0x7f0201ed

    if-ne v7, v10, :cond_a

    .line 435
    :cond_9
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 441
    .end local v3           #resId:I
    .end local v4           #resId1:I
    .end local v6           #state:I
    :cond_a
    :goto_c
    const-string v7, "SignalClusterViewGemini"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "apply(). mIsAirplaneMode is "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-boolean v11, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mIsAirplaneMode:Z

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v7, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 442
    iget-boolean v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mIsAirplaneMode:Z

    if-eqz v7, :cond_1c

    .line 443
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 444
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mFlightMode:Landroid/view/View;

    invoke-virtual {v7, v8}, Landroid/view/View;->setVisibility(I)V

    .line 306
    :goto_d
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_2

    .line 298
    .end local v0           #i:I
    .end local v2           #mShouldMobileGroupVisible:Z
    :cond_b
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiGroup:Landroid/view/ViewGroup;

    invoke-virtual {v7, v9}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto/16 :goto_1

    .line 315
    .restart local v0       #i:I
    .restart local v2       #mShouldMobileGroupVisible:Z
    :cond_c
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileRoam:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_3

    .line 331
    :cond_d
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    if-nez v7, :cond_e

    .line 332
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v12}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_4

    .line 334
    :cond_e
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v0

    aget-object v10, v10, v8

    invoke-virtual {v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_4

    .line 340
    :cond_f
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v13

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    if-nez v7, :cond_10

    .line 341
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile2:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v12}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_5

    .line 343
    :cond_10
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile2:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v0

    aget-object v10, v10, v13

    invoke-virtual {v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_5

    .line 359
    :cond_11
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    if-nez v7, :cond_12

    .line 360
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivity:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v12}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_6

    .line 362
    :cond_12
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivity:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v0

    invoke-virtual {v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_6

    .line 368
    :cond_13
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    if-nez v7, :cond_14

    .line 369
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v12}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_7

    .line 371
    :cond_14
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v0

    invoke-virtual {v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_7

    .line 395
    .restart local v1       #id:I
    .local v3, resId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .restart local v5       #simColorId:I
    .restart local v6       #state:I
    :cond_15
    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    if-nez v7, :cond_16

    .line 396
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalNetworkType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v12}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_8

    .line 398
    :cond_16
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalNetworkType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_8

    .line 408
    .end local v1           #id:I
    .end local v3           #resId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v5           #simColorId:I
    :cond_17
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalNetworkType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v12}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 409
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalNetworkType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_9

    .line 419
    :cond_18
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    aget-object v7, v7, v0

    invoke-virtual {v7, v12}, Landroid/view/ViewGroup;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_a

    .line 427
    :cond_19
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileType:[Landroid/widget/ImageView;

    aget-object v10, v7, v0

    iget-boolean v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiVisible:Z

    if-nez v7, :cond_1a

    move v7, v8

    :goto_e
    invoke-virtual {v10, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_b

    :cond_1a
    move v7, v9

    goto :goto_e

    .line 438
    .end local v6           #state:I
    :cond_1b
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto/16 :goto_c

    .line 446
    :cond_1c
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mFlightMode:Landroid/view/View;

    invoke-virtual {v7, v9}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_d

    .line 450
    .end local v2           #mShouldMobileGroupVisible:Z
    :cond_1d
    iget-boolean v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiVisible:Z

    if-eqz v7, :cond_1e

    .line 451
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSpacer:[Landroid/view/View;

    aget-object v7, v7, v8

    invoke-virtual {v7, v14}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_0

    .line 453
    :cond_1e
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSpacer:[Landroid/view/View;

    aget-object v7, v7, v8

    invoke-virtual {v7, v9}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_0
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 3
    .parameter "event"

    .prologue
    const/4 v2, 0x0

    .line 255
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiVisible:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiGroup:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 256
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiGroup:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 258
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileVisible:[Z

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileGroup:[Landroid/view/ViewGroup;

    aget-object v0, v0, v2

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 259
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileGroup:[Landroid/view/ViewGroup;

    aget-object v1, v1, v2

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 261
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v0

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 155
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 157
    const v3, 0x7f080012

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    iput-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiGroup:Landroid/view/ViewGroup;

    .line 158
    const v3, 0x7f080013

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifi:Landroid/widget/ImageView;

    .line 159
    const v3, 0x7f080014

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiActivity:Landroid/widget/ImageView;

    .line 161
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile:[Landroid/widget/ImageView;

    const v3, 0x7f080020

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v6

    .line 162
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile2:[Landroid/widget/ImageView;

    const v3, 0x7f080048

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v6

    .line 163
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileGroup:[Landroid/view/ViewGroup;

    const v3, 0x7f08001f

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    aput-object v3, v4, v6

    .line 164
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivity:[Landroid/widget/ImageView;

    const v3, 0x7f080049

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v6

    .line 165
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileType:[Landroid/widget/ImageView;

    const v3, 0x7f08001e

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v6

    .line 166
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileRoam:[Landroid/widget/ImageView;

    const v3, 0x7f080018

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v6

    .line 167
    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSpacer:[Landroid/view/View;

    const v4, 0x7f080015

    invoke-virtual {p0, v4}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v4

    aput-object v4, v3, v6

    .line 168
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileSlotIndicator:[Landroid/widget/ImageView;

    const v3, 0x7f08004a

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v6

    .line 169
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    const v3, 0x7f08001d

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    aput-object v3, v4, v6

    .line 170
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalNetworkType:[Landroid/widget/ImageView;

    const v3, 0x7f080047

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v6

    .line 172
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    iget v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    if-ge v0, v3, :cond_0

    .line 173
    add-int/lit8 v1, v0, 0x1

    .line 174
    .local v1, k:I
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile:[Landroid/widget/ImageView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mobile_signal_"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v0

    .line 175
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile2:[Landroid/widget/ImageView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mobile_signal2_"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v0

    .line 176
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileGroup:[Landroid/view/ViewGroup;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mobile_combo_"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    aput-object v3, v4, v0

    .line 177
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivity:[Landroid/widget/ImageView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mobile_inout_"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v0

    .line 178
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileType:[Landroid/widget/ImageView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mobile_type_"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v0

    .line 179
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileRoam:[Landroid/widget/ImageView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mobile_roaming_"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v0

    .line 180
    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSpacer:[Landroid/view/View;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "spacer_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    aput-object v4, v3, v0

    .line 181
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileSlotIndicator:[Landroid/widget/ImageView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mobile_slot_indicator_"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v0

    .line 182
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "signal_cluster_combo_"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    aput-object v3, v4, v0

    .line 183
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalNetworkType:[Landroid/widget/ImageView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "network_type_"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v0

    .line 172
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 186
    .end local v1           #k:I
    :cond_0
    const v3, 0x7f080025

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mFlightMode:Landroid/view/View;

    .line 188
    const/4 v0, 0x0

    :goto_1
    iget v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    if-ge v0, v3, :cond_2

    .line 189
    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v3

    invoke-interface {v3, v0}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalIndicatorIconGemini(I)I

    move-result v2

    .line 190
    .local v2, resId:I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 191
    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileSlotIndicator:[Landroid/widget/ImageView;

    aget-object v3, v3, v0

    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v4

    invoke-interface {v4}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 192
    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileSlotIndicator:[Landroid/widget/ImageView;

    aget-object v3, v3, v0

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 188
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 194
    :cond_1
    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileSlotIndicator:[Landroid/widget/ImageView;

    aget-object v3, v3, v0

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 195
    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileSlotIndicator:[Landroid/widget/ImageView;

    aget-object v3, v3, v0

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_2

    .line 198
    .end local v2           #resId:I
    :cond_2
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->apply()V

    .line 199
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 203
    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiGroup:Landroid/view/ViewGroup;

    .line 204
    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifi:Landroid/widget/ImageView;

    .line 205
    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiActivity:Landroid/widget/ImageView;

    .line 206
    iput-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mDataConnectionGroup:Landroid/view/ViewGroup;

    .line 208
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    if-ge v0, v1, :cond_0

    .line 209
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileGroup:[Landroid/view/ViewGroup;

    aput-object v2, v1, v0

    .line 210
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile:[Landroid/widget/ImageView;

    aput-object v2, v1, v0

    .line 211
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivity:[Landroid/widget/ImageView;

    aput-object v2, v1, v0

    .line 212
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileType:[Landroid/widget/ImageView;

    aput-object v2, v1, v0

    .line 213
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSpacer:[Landroid/view/View;

    aput-object v2, v1, v0

    .line 214
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileRoam:[Landroid/widget/ImageView;

    aput-object v2, v1, v0

    .line 215
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileNetType:[Landroid/widget/ImageView;

    aput-object v2, v1, v0

    .line 216
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile2:[Landroid/widget/ImageView;

    aput-object v2, v1, v0

    .line 208
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 219
    :cond_0
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 220
    return-void
.end method

.method public setDataNetType3G(ILcom/mediatek/systemui/ext/NetworkType;)V
    .locals 3
    .parameter "slotId"
    .parameter "dataNetType"

    .prologue
    .line 280
    const-string v0, "SignalClusterViewGemini"

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

    .line 281
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mDataNetType:[Lcom/mediatek/systemui/ext/NetworkType;

    aput-object p2, v0, p1

    .line 282
    return-void
.end method

.method public setIsAirplaneMode(Z)V
    .locals 3
    .parameter "is"

    .prologue
    .line 247
    const-string v0, "SignalClusterViewGemini"

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

    .line 248
    iput-boolean p1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mIsAirplaneMode:Z

    .line 249
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

    .line 234
    const-string v0, "SignalClusterViewGemini"

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

    .line 237
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileVisible:[Z

    aput-boolean p2, v0, p1

    .line 238
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v0, v0, p1

    aget-object v1, p3, v3

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v1

    aput-object v1, v0, v3

    .line 239
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v0, v0, p1

    aget-object v1, p3, v4

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v1

    aput-object v1, v0, v4

    .line 240
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-virtual {p4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v1

    aput-object v1, v0, p1

    .line 241
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-virtual {p5}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v1

    aput-object v1, v0, p1

    .line 242
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileDescription:[Ljava/lang/String;

    aput-object p6, v0, p1

    .line 243
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileTypeDescription:[Ljava/lang/String;

    aput-object p7, v0, p1

    .line 244
    return-void
.end method

.method public setNetworkControllerGemini(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)V
    .locals 0
    .parameter "nc"

    .prologue
    .line 150
    iput-object p1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mNC:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    .line 151
    return-void
.end method

.method public setRoamingFlagandResource([Z[I)V
    .locals 4
    .parameter "roaming"
    .parameter "roamingId"

    .prologue
    .line 265
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    if-ge v0, v1, :cond_0

    .line 266
    const-string v1, "SignalClusterViewGemini"

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

    .line 267
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mRoaming:[Z

    aget-boolean v2, p1, v0

    aput-boolean v2, v1, v0

    .line 268
    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mRoamingId:[I

    aget v2, p2, v0

    aput v2, v1, v0

    .line 265
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 270
    :cond_0
    return-void
.end method

.method public setShowSimIndicator(IZI)V
    .locals 3
    .parameter "slotId"
    .parameter "showSimIndicator"
    .parameter "simIndicatorResource"

    .prologue
    .line 273
    const-string v0, "SignalClusterViewGemini"

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

    .line 275
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mShowSimIndicator:[Z

    aput-boolean p2, v0, p1

    .line 276
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSimIndicatorResource:[I

    aput p3, v0, p1

    .line 277
    return-void
.end method

.method public setWifiIndicators(ZIILjava/lang/String;)V
    .locals 3
    .parameter "visible"
    .parameter "strengthIcon"
    .parameter "activityIcon"
    .parameter "contentDescription"

    .prologue
    .line 224
    const-string v0, "SignalClusterViewGemini"

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

    .line 226
    iput-boolean p1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiVisible:Z

    .line 227
    iput p2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiStrengthId:I

    .line 228
    iput p3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiActivityId:I

    .line 229
    iput-object p4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiDescription:Ljava/lang/String;

    .line 230
    return-void
.end method
