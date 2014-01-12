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
    .registers 3
    .parameter "context"

    .prologue
    .line 102
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 103
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
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
    .registers 9
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
    :goto_9e
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    if-ge v0, v2, :cond_d2

    .line 137
    iget-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    iget v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthIdNum:I

    new-array v3, v3, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    aput-object v3, v2, v0

    .line 138
    const/4 v1, 0x0

    .local v1, j:I
    :goto_ab
    iget v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthIdNum:I

    if-ge v1, v2, :cond_bd

    .line 139
    iget-object v2, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v2, v2, v0

    new-instance v3, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v3, v2, v1

    .line 138
    add-int/lit8 v1, v1, 0x1

    goto :goto_ab

    .line 141
    :cond_bd
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

    goto :goto_9e

    .line 144
    .end local v1           #j:I
    :cond_d2
    return-void
.end method

.method private shouldMobileGroupVisible(I)Z
    .registers 3
    .parameter "slotId"

    .prologue
    .line 461
    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method public apply()V
    .registers 16

    .prologue
    const/4 v14, 0x4

    const/4 v13, 0x1

    const/4 v12, 0x0

    const/16 v9, 0x8

    const/4 v8, 0x0

    .line 286
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiGroup:Landroid/view/ViewGroup;

    if-nez v7, :cond_12

    .line 287
    const-string v7, "SignalClusterViewGemini"

    const-string v8, "apply(), mWifiGroup is null, return"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 456
    :goto_11
    return-void

    .line 291
    :cond_12
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

    if-eqz v7, :cond_39c

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
    :goto_4a
    const/4 v0, 0x0

    .local v0, i:I
    :goto_4b
    iget v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    if-ge v0, v7, :cond_4b5

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

    if-eqz v7, :cond_4a5

    if-eqz v2, :cond_4a5

    .line 310
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    aget-object v7, v7, v0

    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 311
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mRoaming:[Z

    aget-boolean v7, v7, v0

    if-eqz v7, :cond_3a3

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
    :goto_aa
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

    if-eq v7, v10, :cond_db

    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    if-eqz v7, :cond_db

    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    const v10, 0x7f0201e7

    if-ne v7, v10, :cond_e2

    .line 320
    :cond_db
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileRoam:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 323
    :cond_e2
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    if-eqz v7, :cond_3ac

    .line 324
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v0

    aget-object v10, v10, v8

    invoke-virtual {v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 332
    :goto_ff
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v13

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    if-eqz v7, :cond_3d4

    .line 333
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile2:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v0

    aget-object v10, v10, v13

    invoke-virtual {v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 342
    :goto_11c
    sget-object v7, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X3G:Lcom/mediatek/systemui/ext/NetworkType;

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mDataNetType:[Lcom/mediatek/systemui/ext/NetworkType;

    aget-object v10, v10, v0

    if-eq v7, v10, :cond_12b

    .line 343
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile2:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 345
    :cond_12b
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

    .line 351
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    if-eqz v7, :cond_3fc

    .line 352
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivity:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v0

    invoke-virtual {v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 360
    :goto_1bc
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    if-eqz v7, :cond_420

    .line 361
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v0

    invoke-virtual {v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 370
    :goto_1d5
    invoke-static {v0}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSimIndicatorStateGemini(I)I

    move-result v6

    .line 371
    .local v6, state:I
    invoke-static {v0}, Lcom/android/systemui/statusbar/util/SIMHelper;->isSimInserted(I)Z

    move-result v7

    if-eqz v7, :cond_473

	#HIDE_SIM_ICON
	iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileGroup:[Landroid/view/ViewGroup;
	aget-object v7, v7, v0
	invoke-virtual {v7, v12}, Landroid/view/ViewGroup;->setVisibility(I)V

    const/4 v7, 0x2

    if-eq v7, v6, :cond_473

    if-eq v14, v6, :cond_473

    const/4 v7, 0x3

    if-eq v7, v6, :cond_473

    if-eq v13, v6, :cond_473

    .line 376
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mContext:Landroid/content/Context;

    invoke-static {v7, v0}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v5

    .line 377
    .local v5, simColorId:I
    const/4 v7, -0x1

    if-le v5, v7, :cond_2ae

    if-ge v5, v14, :cond_2ae

    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mDataNetType:[Lcom/mediatek/systemui/ext/NetworkType;

    aget-object v7, v7, v0

    if-eqz v7, :cond_2ae

    .line 378
    new-instance v3, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v3, v8}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    .line 379
    .local v3, resId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v7

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mDataNetType:[Lcom/mediatek/systemui/ext/NetworkType;

    aget-object v10, v10, v0

    invoke-interface {v7, v10, v5}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getDataNetworkTypeIconGemini(Lcom/mediatek/systemui/ext/NetworkType;I)I

    move-result v1

    .line 381
    .local v1, id:I
    const/4 v7, -0x1

    if-eq v1, v7, :cond_444

    .line 382
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v7

    invoke-interface {v7}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v3, v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 383
    invoke-virtual {v3, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 389
    :cond_220
    :goto_220
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

    .line 391
    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    if-eqz v7, :cond_457

    .line 392
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalNetworkType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 400
    :goto_26f
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalNetworkType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 401
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

    if-eq v7, v10, :cond_2a7

    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    if-eqz v7, :cond_2a7

    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    const v10, 0x7f0201e7

    if-ne v7, v10, :cond_2ae

    .line 403
    :cond_2a7
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalNetworkType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 410
    .end local v1           #id:I
    .end local v3           #resId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v5           #simColorId:I
    :cond_2ae
    :goto_2ae
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

    if-eq v7, v10, :cond_2d3

    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    const v10, 0x7f0201e7

    if-ne v7, v10, :cond_483

    .line 412
    :cond_2d3
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileSlotIndicator:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v14}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 416
    :goto_2da
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

    .line 417
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mShowSimIndicator:[Z

    aget-boolean v7, v7, v0

    if-eqz v7, :cond_48c

    .line 418
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSimIndicatorResource:[I

    aget v10, v10, v0

    invoke-virtual {v7, v10}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 422
    :goto_311
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    aget-object v7, v7, v0

    const/4 v10, 0x3

    invoke-virtual {v7, v8, v8, v8, v10}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 425
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v7

    invoke-interface {v7}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->supportDataTypeAlwaysDisplayWhileOn()Z

    move-result v7

    if-eqz v7, :cond_495

    .line 426
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 432
    :goto_32c
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v7

    invoke-interface {v7, v0}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthSearchingIconGemini(I)I

    move-result v3

    .line 433
    .local v3, resId:I
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v7

    invoke-interface {v7, v0}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthNullIconGemini(I)I

    move-result v4

    .line 434
    .local v4, resId1:I
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    if-eq v3, v7, :cond_367

    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    if-eq v4, v7, :cond_367

    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    const v10, 0x7f0201e7

    if-ne v7, v10, :cond_36e

    .line 436
    :cond_367
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 442
    .end local v3           #resId:I
    .end local v4           #resId1:I
    .end local v6           #state:I
    :cond_36e
    :goto_36e
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

    .line 443
    iget-boolean v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mIsAirplaneMode:Z

    if-eqz v7, :cond_4ae

    .line 444
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 445
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mFlightMode:Landroid/view/View;

    invoke-virtual {v7, v8}, Landroid/view/View;->setVisibility(I)V

    .line 306
    :goto_398
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_4b

    .line 298
    .end local v0           #i:I
    .end local v2           #mShouldMobileGroupVisible:Z
    :cond_39c
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiGroup:Landroid/view/ViewGroup;

    invoke-virtual {v7, v9}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto/16 :goto_4a

    .line 315
    .restart local v0       #i:I
    .restart local v2       #mShouldMobileGroupVisible:Z
    :cond_3a3
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileRoam:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_aa

    .line 326
    :cond_3ac
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    if-nez v7, :cond_3c1

    .line 327
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v12}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_ff

    .line 329
    :cond_3c1
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v0

    aget-object v10, v10, v8

    invoke-virtual {v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_ff

    .line 335
    :cond_3d4
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    aget-object v7, v7, v13

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    if-nez v7, :cond_3e9

    .line 336
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile2:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v12}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_11c

    .line 338
    :cond_3e9
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile2:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileStrengthId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v0

    aget-object v10, v10, v13

    invoke-virtual {v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_11c

    .line 354
    :cond_3fc
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    if-nez v7, :cond_40f

    .line 355
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivity:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v12}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_1bc

    .line 357
    :cond_40f
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivity:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivityId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v0

    invoke-virtual {v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_1bc

    .line 363
    :cond_420
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v7, v7, v0

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    if-nez v7, :cond_433

    .line 364
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v12}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_1d5

    .line 366
    :cond_433
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    iget-object v10, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileTypeId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v0

    invoke-virtual {v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_1d5

    .line 384
    .restart local v1       #id:I
    .local v3, resId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .restart local v5       #simColorId:I
    .restart local v6       #state:I
    :cond_444
    invoke-static {}, Lcom/mediatek/systemui/ext/PluginFactory;->isDefaultStatusBarPlugin()Z

    move-result v7

    if-eqz v7, :cond_220

    .line 386
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mDataNetType:[Lcom/mediatek/systemui/ext/NetworkType;

    aget-object v7, v7, v0

    invoke-static {v7, v5}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getNetworkTypeIconGemini(Lcom/mediatek/systemui/ext/NetworkType;I)I

    move-result v1

    .line 387
    invoke-virtual {v3, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_220

    .line 394
    :cond_457
    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v7

    if-nez v7, :cond_466

    .line 395
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalNetworkType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v12}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_26f

    .line 397
    :cond_466
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalNetworkType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v10

    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_26f

    .line 407
    .end local v1           #id:I
    .end local v3           #resId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v5           #simColorId:I
    :cond_473
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalNetworkType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v12}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 408
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalNetworkType:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setVisibility(I)V

	#HIDE_SIM_ICON
	iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileGroup:[Landroid/view/ViewGroup;
	aget-object v7, v7, v0
	invoke-virtual {v7, v9}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto/16 :goto_2ae

    .line 414
    :cond_483
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileSlotIndicator:[Landroid/widget/ImageView;

    aget-object v7, v7, v0

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_2da

    .line 420
    :cond_48c
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    aget-object v7, v7, v0

    invoke-virtual {v7, v12}, Landroid/view/ViewGroup;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_311

    .line 428
    :cond_495
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileType:[Landroid/widget/ImageView;

    aget-object v10, v7, v0

    iget-boolean v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiVisible:Z

    if-nez v7, :cond_4a3

    move v7, v8

    :goto_49e
    invoke-virtual {v10, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_32c

    :cond_4a3
    move v7, v9

    goto :goto_49e

    .line 439
    .end local v6           #state:I
    :cond_4a5
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    aget-object v7, v7, v0

    invoke-virtual {v7, v9}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto/16 :goto_36e

    .line 447
    :cond_4ae
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mFlightMode:Landroid/view/View;

    invoke-virtual {v7, v9}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_398

    .line 451
    .end local v2           #mShouldMobileGroupVisible:Z
    :cond_4b5
    iget-boolean v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiVisible:Z

    if-eqz v7, :cond_4c2

    .line 452
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSpacer:[Landroid/view/View;

    aget-object v7, v7, v8

    invoke-virtual {v7, v14}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_11

    .line 454
    :cond_4c2
    iget-object v7, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSpacer:[Landroid/view/View;

    aget-object v7, v7, v8

    invoke-virtual {v7, v9}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_11
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 5
    .parameter "event"

    .prologue
    const/4 v2, 0x0

    .line 255
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiVisible:Z

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiGroup:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_1a

    .line 256
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiGroup:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 258
    :cond_1a
    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileVisible:[Z

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_39

    iget-object v0, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileGroup:[Landroid/view/ViewGroup;

    aget-object v0, v0, v2

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_39

    .line 259
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileGroup:[Landroid/view/ViewGroup;

    aget-object v1, v1, v2

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 261
    :cond_39
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v0

    return v0
.end method

.method protected onAttachedToWindow()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 155
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 157
    const v3, 0x7f08001b

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    iput-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiGroup:Landroid/view/ViewGroup;

    .line 158
    const v3, 0x7f08001c

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifi:Landroid/widget/ImageView;

    .line 159
    const v3, 0x7f08001d

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mWifiActivity:Landroid/widget/ImageView;

    .line 161
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile:[Landroid/widget/ImageView;

    const v3, 0x7f080023

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v6

    .line 162
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobile2:[Landroid/widget/ImageView;

    const v3, 0x7f080024

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v6

    .line 163
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileGroup:[Landroid/view/ViewGroup;

    const v3, 0x7f080022

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    aput-object v3, v4, v6

    .line 164
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileActivity:[Landroid/widget/ImageView;

    const v3, 0x7f080027

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v6

    .line 165
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileType:[Landroid/widget/ImageView;

    const v3, 0x7f080025

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v6

    .line 166
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileRoam:[Landroid/widget/ImageView;

    const v3, 0x7f080026

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v6

    .line 167
    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSpacer:[Landroid/view/View;

    const v4, 0x7f08001e

    invoke-virtual {p0, v4}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v4

    aput-object v4, v3, v6

    .line 168
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileSlotIndicator:[Landroid/widget/ImageView;

    const v3, 0x7f080028

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v6

    .line 169
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalClusterCombo:[Landroid/view/ViewGroup;

    const v3, 0x7f080020

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    aput-object v3, v4, v6

    .line 170
    iget-object v4, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mSignalNetworkType:[Landroid/widget/ImageView;

    const v3, 0x7f080021

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    aput-object v3, v4, v6

    .line 172
    const/4 v0, 0x1

    .local v0, i:I
    :goto_a6
    iget v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    if-ge v0, v3, :cond_1d0

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

    goto/16 :goto_a6

    .line 186
    .end local v1           #k:I
    :cond_1d0
    const v3, 0x7f080047

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mFlightMode:Landroid/view/View;

    .line 188
    const/4 v0, 0x0

    :goto_1dc
    iget v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    if-ge v0, v3, :cond_21d

    .line 189
    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v3

    invoke-interface {v3, v0}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalIndicatorIconGemini(I)I

    move-result v2

    .line 190
    .local v2, resId:I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_20c

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
    :goto_209
    add-int/lit8 v0, v0, 0x1

    goto :goto_1dc

    .line 194
    :cond_20c
    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileSlotIndicator:[Landroid/widget/ImageView;

    aget-object v3, v3, v0

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 195
    iget-object v3, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mMobileSlotIndicator:[Landroid/widget/ImageView;

    aget-object v3, v3, v0

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_209

    .line 198
    .end local v2           #resId:I
    :cond_21d
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->apply()V

    .line 199
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 4

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
    :goto_a
    iget v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    if-ge v0, v1, :cond_31

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

    goto :goto_a

    .line 219
    :cond_31
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 220
    return-void
.end method

.method public setDataNetType3G(ILcom/mediatek/systemui/ext/NetworkType;)V
    .registers 6
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
    .registers 5
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
    .registers 13
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
    .registers 2
    .parameter "nc"

    .prologue
    .line 150
    iput-object p1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mNC:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    .line 151
    return-void
.end method

.method public setRoamingFlagandResource([Z[I)V
    .registers 7
    .parameter "roaming"
    .parameter "roamingId"

    .prologue
    .line 265
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget v1, p0, Lcom/android/systemui/statusbar/SignalClusterViewGemini;->mGeminiSimNum:I

    if-ge v0, v1, :cond_44

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

    goto :goto_1

    .line 270
    :cond_44
    return-void
.end method

.method public setShowSimIndicator(IZI)V
    .registers 7
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
    .registers 8
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
