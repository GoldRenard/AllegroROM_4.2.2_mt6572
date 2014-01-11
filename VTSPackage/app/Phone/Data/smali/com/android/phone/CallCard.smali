.class public Lcom/android/phone/CallCard;
.super Landroid/widget/LinearLayout;
.source "CallCard.java"

# interfaces
.implements Lcom/android/phone/CallTime$OnTickListener;
.implements Lcom/android/internal/telephony/CallerInfoAsyncQuery$OnQueryCompleteListener;
.implements Lcom/android/phone/ContactsAsyncHelper$OnImageLoadCompleteListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/phone/CallCard$4;,
        Lcom/android/phone/CallCard$CallInfoCookie;,
        Lcom/android/phone/CallCard$AsyncLoadCookie;
    }
.end annotation


# static fields
.field private static final DBG:Z = true

.field private static final LOG_TAG:Ljava/lang/String; = "CallCard"

.field private static final MESSAGE_DELAY:I = 0x1f4

.field private static final MESSAGE_SHOW_UNKNOWN_PHOTO:I = 0x65

.field private static final PRIMARY_CALL_BANNER:I = 0x0

.field private static final SECONDARY_CALL_BANNER:I = 0x1

.field private static final SECOND_HOLD_CALL_BANNER:I = 0x2

.field private static final TOKEN_DO_NOTHING:I = 0x1

.field private static final TOKEN_UPDATE_PHOTO_FOR_CALL_STATE:I

.field private static mLCforUserData:Z

.field private static mLCforUserDataHoldCall:Z

.field private static mLocaleChanged:Z

.field private static sLCforUserDataSecondHoldCall:Z


# instance fields
.field callCardListener:Landroid/view/View$OnClickListener;

.field m2ndHoldName:Landroid/widget/TextView;

.field m2ndHoldState:Landroid/widget/TextView;

.field m2ndIncomingName:Landroid/widget/TextView;

.field m2ndIncomingState:Landroid/widget/TextView;

.field mAnimationListener:Landroid/view/animation/Animation$AnimationListener;

.field private mApplication:Lcom/android/phone/PhoneGlobals;

.field private mCallBannerSidePadding:I

.field private mCallBannerTopBottomPadding:I

.field private mCallInfoContainer:Landroid/view/ViewGroup;

.field private mCallStateLabel:Landroid/widget/TextView;

.field private mCallTypeLabel:Landroid/widget/TextView;

.field private mDensity:F

.field mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

.field private mDualTalkSecondaryCallInfo:Landroid/view/ViewStub;

.field private mDualTalkSecondaryCallPhotoDimEffect:Landroid/view/View;

.field private final mHandler:Landroid/os/Handler;

.field private mInCallScreen:Lcom/android/phone/InCallScreen;

.field private mIncomingCall2Info:Landroid/view/ViewGroup;

.field private mIncomingCall2PhotoDimEffect:Landroid/view/View;

.field private mIncomingCallInfoHeight:I

.field private mIncomingCallInfoTopMargin:I

.field private mIncomingCallInfoWidth:I

.field private mIncomingCallWidgetHintColorResId:I

.field private mIncomingCallWidgetHintTextResId:I

.field private mLabel:Landroid/widget/TextView;

.field private mLoadingPersonUri:Landroid/net/Uri;

.field private mName:Landroid/widget/TextView;

.field private mNeedShowIncomingCall2Animator:Z

.field private mOperatorName:Landroid/widget/TextView;

.field private mPhoneNumber:Landroid/widget/TextView;

.field private mPhoneNumberGeoDescription:Landroid/widget/TextView;

.field private mPhoto:Landroid/widget/ImageView;

.field private mPhotoDimEffect:Landroid/view/View;

.field private mPhotoHoldPre:Landroid/widget/ImageView;

.field private mPhotoIncomingPre:Landroid/widget/ImageView;

.field private mPhotoTracker:Lcom/android/phone/ContactsAsyncHelper$ImageTracker;

.field private mPrimaryCallBanner:Landroid/view/ViewGroup;

.field private mPrimaryCallInfo:Landroid/view/ViewGroup;

.field private mProviderAddress:Landroid/widget/TextView;

.field private mProviderInfo:Landroid/view/ViewGroup;

.field private mProviderLabel:Landroid/widget/TextView;

.field private mSecondHoldCallBanner:Landroid/view/ViewGroup;

.field private mSecondIncomingCallBanner:Landroid/view/ViewGroup;

.field private mSecondaryCallBanner:Landroid/view/ViewGroup;

.field private mSecondaryCallInfo:Landroid/view/ViewStub;

.field private mSecondaryCallName:Landroid/widget/TextView;

.field private mSecondaryCallPhoto:Landroid/widget/ImageView;

.field private mSecondaryCallPhotoDimEffect:Landroid/view/View;

.field private mSecondaryCallStatus:Landroid/widget/TextView;

.field private mSecondaryInfoContainer:Landroid/view/ViewGroup;

.field private mServiceStateExt:Lcom/mediatek/common/telephony/IServiceStateExt;

.field private mShowAnimator2End:I

.field private mShowSwtchCall2Animator:Z

.field private mSimBorderMap:[I

.field private mSimColorMap:[I

.field private mSimIndicator:Landroid/widget/TextView;

.field private mSimIndicatorPaddingLeft:I

.field private mSimIndicatorPaddingRight:I

.field private mSimInfo:Landroid/provider/Telephony$SIMInfo;

.field private mTextColorCallTypeSip:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 2338
    sput-boolean v0, Lcom/android/phone/CallCard;->mLocaleChanged:Z

    .line 2339
    sput-boolean v0, Lcom/android/phone/CallCard;->mLCforUserData:Z

    .line 2340
    sput-boolean v0, Lcom/android/phone/CallCard;->mLCforUserDataHoldCall:Z

    .line 2342
    sput-boolean v0, Lcom/android/phone/CallCard;->sLCforUserDataSecondHoldCall:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v2, 0x4

    const/4 v1, 0x1

    .line 200
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 182
    new-instance v0, Lcom/android/phone/CallCard$1;

    invoke-direct {v0, p0}, Lcom/android/phone/CallCard$1;-><init>(Lcom/android/phone/CallCard;)V

    iput-object v0, p0, Lcom/android/phone/CallCard;->mHandler:Landroid/os/Handler;

    .line 2344
    new-array v0, v2, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/android/phone/CallCard;->mSimColorMap:[I

    .line 2351
    new-array v0, v2, [I

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/android/phone/CallCard;->mSimBorderMap:[I

    .line 2394
    iput v1, p0, Lcom/android/phone/CallCard;->mShowAnimator2End:I

    .line 3530
    new-instance v0, Lcom/android/phone/CallCard$2;

    invoke-direct {v0, p0}, Lcom/android/phone/CallCard$2;-><init>(Lcom/android/phone/CallCard;)V

    iput-object v0, p0, Lcom/android/phone/CallCard;->callCardListener:Landroid/view/View$OnClickListener;

    .line 3636
    new-instance v0, Lcom/android/phone/CallCard$3;

    invoke-direct {v0, p0}, Lcom/android/phone/CallCard$3;-><init>(Lcom/android/phone/CallCard;)V

    iput-object v0, p0, Lcom/android/phone/CallCard;->mAnimationListener:Landroid/view/animation/Animation$AnimationListener;

    .line 202
    const-class v0, Lcom/mediatek/common/telephony/IServiceStateExt;

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mediatek/common/MediatekClassFactory;->createInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/common/telephony/IServiceStateExt;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mServiceStateExt:Lcom/mediatek/common/telephony/IServiceStateExt;

    .line 205
    const-string v0, "CallCard constructor..."

    invoke-static {v0}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 206
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- this = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 207
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- context "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", attrs "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 209
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/CallCard;->mApplication:Lcom/android/phone/PhoneGlobals;

    .line 214
    new-instance v0, Lcom/android/phone/ContactsAsyncHelper$ImageTracker;

    invoke-direct {v0}, Lcom/android/phone/ContactsAsyncHelper$ImageTracker;-><init>()V

    iput-object v0, p0, Lcom/android/phone/CallCard;->mPhotoTracker:Lcom/android/phone/ContactsAsyncHelper$ImageTracker;

    .line 216
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 217
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->getInstance()Lcom/mediatek/phone/DualTalkUtils;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    .line 220
    :cond_0
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iput v0, p0, Lcom/android/phone/CallCard;->mDensity:F

    .line 221
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0c0040

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/phone/CallCard;->mCallBannerSidePadding:I

    .line 222
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0c0007

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/phone/CallCard;->mCallBannerTopBottomPadding:I

    .line 223
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0c0022

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/phone/CallCard;->mSimIndicatorPaddingLeft:I

    .line 224
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0c0023

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/phone/CallCard;->mSimIndicatorPaddingRight:I

    .line 225
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- Density: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/phone/CallCard;->mDensity:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 226
    return-void

    .line 2344
    :array_0
    .array-data 0x4
        0x8et 0x0t 0x2t 0x7ft
        0x8ft 0x0t 0x2t 0x7ft
        0x90t 0x0t 0x2t 0x7ft
        0x91t 0x0t 0x2t 0x7ft
    .end array-data

    .line 2351
    :array_1
    .array-data 0x4
        0xa2t 0x0t 0x2t 0x7ft
        0xa5t 0x0t 0x2t 0x7ft
        0xa3t 0x0t 0x2t 0x7ft
        0xa6t 0x0t 0x2t 0x7ft
    .end array-data
.end method

.method static synthetic access$000(Lcom/android/phone/CallCard;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/phone/CallCard;->mPhoto:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$100(Landroid/widget/ImageView;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 76
    invoke-static {p0, p1}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/phone/CallCard;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget v0, p0, Lcom/android/phone/CallCard;->mIncomingCallInfoTopMargin:I

    return v0
.end method

.method static synthetic access$1100(Lcom/android/phone/CallCard;)Landroid/view/ViewGroup;
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/phone/CallCard;->mIncomingCall2Info:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/android/phone/CallCard;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-boolean v0, p0, Lcom/android/phone/CallCard;->mNeedShowIncomingCall2Animator:Z

    return v0
.end method

.method static synthetic access$1202(Lcom/android/phone/CallCard;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 76
    iput-boolean p1, p0, Lcom/android/phone/CallCard;->mNeedShowIncomingCall2Animator:Z

    return p1
.end method

.method static synthetic access$200(Lcom/android/phone/CallCard;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-boolean v0, p0, Lcom/android/phone/CallCard;->mShowSwtchCall2Animator:Z

    return v0
.end method

.method static synthetic access$202(Lcom/android/phone/CallCard;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 76
    iput-boolean p1, p0, Lcom/android/phone/CallCard;->mShowSwtchCall2Animator:Z

    return p1
.end method

.method static synthetic access$300(Lcom/android/phone/CallCard;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/android/phone/CallCard;->displaySwitchIncomingAnimator()V

    return-void
.end method

.method static synthetic access$400(Ljava/lang/String;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 76
    invoke-static {p0}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/phone/CallCard;)Lcom/android/phone/InCallScreen;
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/phone/CallCard;->mInCallScreen:Lcom/android/phone/InCallScreen;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/phone/CallCard;)Lcom/android/phone/PhoneGlobals;
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/phone/CallCard;->mApplication:Lcom/android/phone/PhoneGlobals;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/phone/CallCard;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget v0, p0, Lcom/android/phone/CallCard;->mShowAnimator2End:I

    return v0
.end method

.method static synthetic access$702(Lcom/android/phone/CallCard;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 76
    iput p1, p0, Lcom/android/phone/CallCard;->mShowAnimator2End:I

    return p1
.end method

.method static synthetic access$708(Lcom/android/phone/CallCard;)I
    .locals 2
    .parameter "x0"

    .prologue
    .line 76
    iget v0, p0, Lcom/android/phone/CallCard;->mShowAnimator2End:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/android/phone/CallCard;->mShowAnimator2End:I

    return v0
.end method

.method static synthetic access$800(Lcom/android/phone/CallCard;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget v0, p0, Lcom/android/phone/CallCard;->mIncomingCallInfoWidth:I

    return v0
.end method

.method static synthetic access$900(Lcom/android/phone/CallCard;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget v0, p0, Lcom/android/phone/CallCard;->mIncomingCallInfoHeight:I

    return v0
.end method

.method private dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;Landroid/view/View;)V
    .locals 3
    .parameter "event"
    .parameter "view"

    .prologue
    .line 2305
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v0

    .line 2306
    .local v0, eventText:Ljava/util/List;,"Ljava/util/List<Ljava/lang/CharSequence;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    .line 2307
    .local v1, size:I
    invoke-virtual {p2, p1}, Landroid/view/View;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    .line 2309
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 2310
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2312
    :cond_0
    return-void
.end method

.method private displayMainCallStatus(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)V
    .locals 22
    .parameter "cm"
    .parameter "call"

    .prologue
    .line 710
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "displayMainCallStatus(call "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ")..."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 712
    if-nez p2, :cond_1

    .line 714
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mPrimaryCallInfo:Landroid/view/ViewGroup;

    const/16 v4, 0x8

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 895
    :cond_0
    :goto_0
    return-void

    .line 720
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "displayMainCallStatus(call "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p2 .. p2}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ")..."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 723
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mPrimaryCallInfo:Landroid/view/ViewGroup;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 725
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/android/phone/CallCard;->updateCallStateWidgets(Lcom/android/internal/telephony/Call;)V

    .line 729
    invoke-static/range {p2 .. p2}, Lcom/android/phone/PhoneUtils;->getSimInfoByCall(Lcom/android/internal/telephony/Call;)Landroid/provider/Telephony$SIMInfo;

    move-result-object v19

    .line 730
    .local v19, simInfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v19, :cond_2

    move-object/from16 v0, v19

    iget-object v2, v0, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual/range {p2 .. p2}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v2

    const/4 v4, 0x3

    if-eq v2, v4, :cond_2

    .line 732
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    move-object/from16 v0, v19

    iget-object v4, v0, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 733
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 742
    :goto_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mPrimaryCallBanner:Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v2}, Lcom/android/phone/CallCard;->updateCallBannerBackground(Lcom/android/internal/telephony/Call;Landroid/view/ViewGroup;)V

    .line 743
    invoke-virtual/range {p2 .. p2}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v2

    const/4 v4, 0x3

    if-ne v2, v4, :cond_4

    .line 745
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mOperatorName:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 746
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mOperatorName:Landroid/widget/TextView;

    const v4, 0x7f0d02e1

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(I)V

    .line 757
    :goto_2
    invoke-static/range {p2 .. p2}, Lcom/android/phone/PhoneUtils;->isConferenceCall(Lcom/android/internal/telephony/Call;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 759
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/android/phone/CallCard;->updateDisplayForConference(Lcom/android/internal/telephony/Call;)V

    .line 879
    :goto_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mPhoto:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v2}, Lcom/android/phone/CallCard;->updatePhotoForCallState(Lcom/android/internal/telephony/Call;Landroid/widget/ImageView;)V

    .line 884
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/phone/CallCard;->mIncomingCallWidgetHintTextResId:I

    if-eqz v2, :cond_0

    .line 886
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/phone/CallCard;->mIncomingCallWidgetHintTextResId:I

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(I)V

    .line 887
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/phone/CallCard;->mIncomingCallWidgetHintColorResId:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 888
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 889
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mLabel:Landroid/widget/TextView;

    const/16 v4, 0x8

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_0

    .line 734
    :cond_2
    invoke-virtual/range {p2 .. p2}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v2

    const/4 v4, 0x3

    if-ne v2, v4, :cond_3

    .line 735
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    const v4, 0x7f0d02e1

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(I)V

    .line 736
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_1

    .line 738
    :cond_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    const/16 v4, 0x8

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_1

    .line 748
    :cond_4
    invoke-static/range {p2 .. p2}, Lcom/android/phone/PhoneUtils;->isEccCall(Lcom/android/internal/telephony/Call;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 749
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mOperatorName:Landroid/widget/TextView;

    invoke-static/range {p2 .. p2}, Lcom/mediatek/phone/gemini/GeminiUtils;->getNetworkOperatorName(Lcom/android/internal/telephony/Call;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 750
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mOperatorName:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_2

    .line 752
    :cond_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mOperatorName:Landroid/widget/TextView;

    const/16 v4, 0x8

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_2

    .line 763
    :cond_6
    const/4 v7, 0x0

    .line 764
    .local v7, conn:Lcom/android/internal/telephony/Connection;
    invoke-virtual/range {p2 .. p2}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v17

    .line 765
    .local v17, phoneType:I
    const/4 v2, 0x2

    move/from16 v0, v17

    if-ne v0, v2, :cond_7

    .line 766
    invoke-virtual/range {p2 .. p2}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v7

    .line 774
    :goto_4
    if-nez v7, :cond_a

    .line 775
    const-string v2, "displayMainCallStatus: connection is null, using default values."

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 780
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v4, 0x0

    invoke-static {v2, v4}, Lcom/android/phone/PhoneUtils;->getCallerInfo(Landroid/content/Context;Lcom/android/internal/telephony/Connection;)Lcom/android/internal/telephony/CallerInfo;

    move-result-object v3

    .line 781
    .local v3, info:Lcom/android/internal/telephony/CallerInfo;
    sget v4, Lcom/android/internal/telephony/PhoneConstants;->PRESENTATION_ALLOWED:I

    const/4 v5, 0x0

    move-object/from16 v2, p0

    move-object/from16 v6, p2

    invoke-direct/range {v2 .. v7}, Lcom/android/phone/CallCard;->updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;)V

    goto/16 :goto_3

    .line 767
    .end local v3           #info:Lcom/android/internal/telephony/CallerInfo;
    :cond_7
    const/4 v2, 0x1

    move/from16 v0, v17

    if-eq v0, v2, :cond_8

    const/4 v2, 0x3

    move/from16 v0, v17

    if-ne v0, v2, :cond_9

    .line 769
    :cond_8
    invoke-virtual/range {p2 .. p2}, Lcom/android/internal/telephony/Call;->getEarliestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v7

    goto :goto_4

    .line 771
    :cond_9
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unexpected phone type: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 783
    :cond_a
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "  - CONN: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", state = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v7}, Lcom/android/internal/telephony/Connection;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 784
    invoke-virtual {v7}, Lcom/android/internal/telephony/Connection;->getNumberPresentation()I

    move-result v10

    .line 788
    .local v10, presentation:I
    const/16 v18, 0x1

    .line 789
    .local v18, runQuery:Z
    invoke-virtual {v7}, Lcom/android/internal/telephony/Connection;->getUserData()Ljava/lang/Object;

    move-result-object v15

    .line 790
    .local v15, o:Ljava/lang/Object;
    instance-of v2, v15, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    if-eqz v2, :cond_f

    .line 791
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallCard;->mPhotoTracker:Lcom/android/phone/ContactsAsyncHelper$ImageTracker;

    move-object v2, v15

    check-cast v2, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    iget-object v2, v2, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    invoke-virtual {v4, v2}, Lcom/android/phone/ContactsAsyncHelper$ImageTracker;->isDifferentImageRequest(Lcom/android/internal/telephony/CallerInfo;)Z

    move-result v18

    .line 799
    :goto_5
    const/4 v2, 0x2

    move/from16 v0, v17

    if-ne v0, v2, :cond_d

    .line 800
    invoke-virtual {v7}, Lcom/android/internal/telephony/Connection;->getUserData()Ljava/lang/Object;

    move-result-object v16

    .line 801
    .local v16, obj:Ljava/lang/Object;
    invoke-virtual {v7}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v21

    .line 802
    .local v21, updatedNumber:Ljava/lang/String;
    invoke-virtual {v7}, Lcom/android/internal/telephony/Connection;->getCnapName()Ljava/lang/String;

    move-result-object v20

    .line 803
    .local v20, updatedCnapName:Ljava/lang/String;
    const/4 v3, 0x0

    .line 804
    .restart local v3       #info:Lcom/android/internal/telephony/CallerInfo;
    move-object/from16 v0, v16

    instance-of v2, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    if-eqz v2, :cond_10

    move-object v2, v15

    .line 805
    check-cast v2, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    iget-object v3, v2, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    .line 810
    :cond_b
    :goto_6
    if-eqz v3, :cond_d

    .line 811
    if-eqz v21, :cond_c

    iget-object v2, v3, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c

    .line 812
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "- displayMainCallStatus: updatedNumber = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 814
    const/16 v18, 0x1

    .line 816
    :cond_c
    if-eqz v20, :cond_d

    iget-object v2, v3, Lcom/android/internal/telephony/CallerInfo;->cnapName:Ljava/lang/String;

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d

    .line 817
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "- displayMainCallStatus: updatedCnapName = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 819
    const/16 v18, 0x1

    .line 824
    .end local v3           #info:Lcom/android/internal/telephony/CallerInfo;
    .end local v16           #obj:Ljava/lang/Object;
    .end local v20           #updatedCnapName:Ljava/lang/String;
    .end local v21           #updatedNumber:Ljava/lang/String;
    :cond_d
    if-eqz v18, :cond_12

    .line 825
    const-string v2, "- displayMainCallStatus: starting CallerInfo query..."

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 827
    sget-boolean v2, Lcom/android/phone/CallCard;->mLCforUserData:Z

    if-eqz v2, :cond_e

    .line 829
    const-string v2, "- displayMainCallStatus: the language changed to clear userdata"

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 831
    invoke-virtual {v7}, Lcom/android/internal/telephony/Connection;->clearUserData()V

    .line 832
    const/4 v2, 0x0

    sput-boolean v2, Lcom/android/phone/CallCard;->mLCforUserData:Z

    .line 835
    :cond_e
    new-instance v14, Lcom/android/phone/CallCard$CallInfoCookie;

    const/4 v2, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v14, v0, v1, v2}, Lcom/android/phone/CallCard$CallInfoCookie;-><init>(Lcom/android/phone/CallCard;Lcom/android/internal/telephony/Call;I)V

    .line 837
    .local v14, callInfoCookie:Lcom/android/phone/CallCard$CallInfoCookie;
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-static {v2, v7, v0, v14}, Lcom/android/phone/PhoneUtils;->startGetCallerInfo(Landroid/content/Context;Lcom/android/internal/telephony/Connection;Lcom/android/internal/telephony/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;)Lcom/android/phone/PhoneUtils$CallerInfoToken;

    move-result-object v3

    .line 839
    .local v3, info:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    iget-object v9, v3, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    iget-boolean v2, v3, Lcom/android/phone/PhoneUtils$CallerInfoToken;->isFinal:Z

    if-nez v2, :cond_11

    const/4 v11, 0x1

    :goto_7
    move-object/from16 v8, p0

    move-object/from16 v12, p2

    move-object v13, v7

    invoke-direct/range {v8 .. v13}, Lcom/android/phone/CallCard;->updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;)V

    goto/16 :goto_3

    .line 794
    .end local v3           #info:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    .end local v14           #callInfoCookie:Lcom/android/phone/CallCard$CallInfoCookie;
    :cond_f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mPhotoTracker:Lcom/android/phone/ContactsAsyncHelper$ImageTracker;

    invoke-virtual {v2, v7}, Lcom/android/phone/ContactsAsyncHelper$ImageTracker;->isDifferentImageRequest(Lcom/android/internal/telephony/Connection;)Z

    move-result v18

    goto/16 :goto_5

    .line 806
    .local v3, info:Lcom/android/internal/telephony/CallerInfo;
    .restart local v16       #obj:Ljava/lang/Object;
    .restart local v20       #updatedCnapName:Ljava/lang/String;
    .restart local v21       #updatedNumber:Ljava/lang/String;
    :cond_10
    instance-of v2, v15, Lcom/android/internal/telephony/CallerInfo;

    if-eqz v2, :cond_b

    move-object v3, v15

    .line 807
    check-cast v3, Lcom/android/internal/telephony/CallerInfo;

    goto/16 :goto_6

    .line 839
    .end local v16           #obj:Ljava/lang/Object;
    .end local v20           #updatedCnapName:Ljava/lang/String;
    .end local v21           #updatedNumber:Ljava/lang/String;
    .local v3, info:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    .restart local v14       #callInfoCookie:Lcom/android/phone/CallCard$CallInfoCookie;
    :cond_11
    const/4 v11, 0x0

    goto :goto_7

    .line 845
    .end local v3           #info:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    .end local v14           #callInfoCookie:Lcom/android/phone/CallCard$CallInfoCookie;
    :cond_12
    const-string v2, "- displayMainCallStatus: using data we already have..."

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 846
    instance-of v2, v15, Lcom/android/internal/telephony/CallerInfo;

    if-eqz v2, :cond_13

    move-object v9, v15

    .line 847
    check-cast v9, Lcom/android/internal/telephony/CallerInfo;

    .line 849
    .local v9, ci:Lcom/android/internal/telephony/CallerInfo;
    invoke-virtual {v7}, Lcom/android/internal/telephony/Connection;->getCnapName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v9, Lcom/android/internal/telephony/CallerInfo;->cnapName:Ljava/lang/String;

    .line 850
    invoke-virtual {v7}, Lcom/android/internal/telephony/Connection;->getNumberPresentation()I

    move-result v2

    iput v2, v9, Lcom/android/internal/telephony/CallerInfo;->numberPresentation:I

    .line 851
    invoke-virtual {v7}, Lcom/android/internal/telephony/Connection;->getCnapNamePresentation()I

    move-result v2

    iput v2, v9, Lcom/android/internal/telephony/CallerInfo;->namePresentation:I

    .line 852
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "- displayMainCallStatus: CNAP data from Connection: CNAP name="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, v9, Lcom/android/internal/telephony/CallerInfo;->cnapName:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", Number/Name Presentation="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v4, v9, Lcom/android/internal/telephony/CallerInfo;->numberPresentation:I

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 855
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "   ==> Got CallerInfo; updating display: ci = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 856
    const/4 v11, 0x0

    move-object/from16 v8, p0

    move-object/from16 v12, p2

    move-object v13, v7

    invoke-direct/range {v8 .. v13}, Lcom/android/phone/CallCard;->updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;)V

    goto/16 :goto_3

    .line 857
    .end local v9           #ci:Lcom/android/internal/telephony/CallerInfo;
    :cond_13
    instance-of v2, v15, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    if-eqz v2, :cond_14

    .line 858
    check-cast v15, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    .end local v15           #o:Ljava/lang/Object;
    iget-object v9, v15, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    .line 859
    .restart local v9       #ci:Lcom/android/internal/telephony/CallerInfo;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "- displayMainCallStatus: CNAP data from Connection: CNAP name="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, v9, Lcom/android/internal/telephony/CallerInfo;->cnapName:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", Number/Name Presentation="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v4, v9, Lcom/android/internal/telephony/CallerInfo;->numberPresentation:I

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 862
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "   ==> Got CallerInfoToken; updating display: ci = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 863
    const/4 v11, 0x1

    move-object/from16 v8, p0

    move-object/from16 v12, p2

    move-object v13, v7

    invoke-direct/range {v8 .. v13}, Lcom/android/phone/CallCard;->updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;)V

    goto/16 :goto_3

    .line 865
    .end local v9           #ci:Lcom/android/internal/telephony/CallerInfo;
    .restart local v15       #o:Ljava/lang/Object;
    :cond_14
    const-string v2, "CallCard"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "displayMainCallStatus: runQuery was false, but we didn\'t have a cached CallerInfo object!  o = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3
.end method

.method private displaySecondaryCallStatus(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)V
    .locals 23
    .parameter "cm"
    .parameter "call"

    .prologue
    .line 1273
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "displaySecondaryCallStatus(call ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")..."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 1275
    if-eqz p2, :cond_0

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/phone/PhoneGlobals;->isOtaCallInActiveState()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1276
    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallInfo:Landroid/view/ViewStub;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/ViewStub;->setVisibility(I)V

    .line 1482
    :goto_0
    return-void

    .line 1280
    :cond_1
    invoke-virtual/range {p2 .. p2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v22

    .line 1282
    .local v22, state:Lcom/android/internal/telephony/Call$State;
    invoke-static/range {p2 .. p2}, Lcom/android/phone/PhoneUtils;->getSimInfoByCall(Lcom/android/internal/telephony/Call;)Landroid/provider/Telephony$SIMInfo;

    move-result-object v21

    .line 1283
    .local v21, simInfo:Landroid/provider/Telephony$SIMInfo;
    sget-object v2, Lcom/android/phone/CallCard$4;->$SwitchMap$com$android$internal$telephony$Call$State:[I

    invoke-virtual/range {v22 .. v22}, Lcom/android/internal/telephony/Call$State;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 1479
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallInfo:Landroid/view/ViewStub;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/ViewStub;->setVisibility(I)V

    goto :goto_0

    .line 1291
    :pswitch_0
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/CallCard;->showSecondaryCallInfo()V

    .line 1306
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    if-eqz v2, :cond_2

    .line 1307
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v2}, Lcom/android/phone/CallCard;->updateCallBannerBackground(Lcom/android/internal/telephony/Call;Landroid/view/ViewGroup;)V

    .line 1312
    :cond_2
    invoke-static/range {p2 .. p2}, Lcom/android/phone/PhoneUtils;->isConferenceCall(Lcom/android/internal/telephony/Call;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1313
    const-string v2, "==> conference call."

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 1314
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallName:Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f0d0190

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1317
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallPhoto:Landroid/widget/ImageView;

    const v3, 0x7f020098

    invoke-static {v2, v3}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    .line 1364
    :goto_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallPhotoDimEffect:Landroid/view/View;

    invoke-static {v2}, Lcom/android/phone/AnimationUtils$Fade;->show(Landroid/view/View;)V

    goto :goto_0

    .line 1322
    :cond_3
    const-string v2, "==> NOT a conf call; call startGetCallerInfo..."

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 1323
    const/16 v17, 0x0

    .line 1324
    .local v17, infoToken:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    sget-boolean v2, Lcom/android/phone/CallCard;->mLCforUserDataHoldCall:Z

    if-eqz v2, :cond_4

    .line 1326
    const-string v2, "- displaySecondaryCallStatus: the language changed to clear userdata"

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 1328
    new-instance v13, Lcom/android/phone/CallCard$CallInfoCookie;

    const/4 v2, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v13, v0, v1, v2}, Lcom/android/phone/CallCard$CallInfoCookie;-><init>(Lcom/android/phone/CallCard;Lcom/android/internal/telephony/Call;I)V

    .line 1329
    .local v13, callInfoCookie:Lcom/android/phone/CallCard$CallInfoCookie;
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x1

    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-static {v2, v0, v1, v13, v3}, Lcom/android/phone/PhoneUtils;->startGetCallerInfo(Landroid/content/Context;Lcom/android/internal/telephony/Call;Lcom/android/internal/telephony/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;Z)Lcom/android/phone/PhoneUtils$CallerInfoToken;

    move-result-object v17

    .line 1330
    const/4 v2, 0x0

    sput-boolean v2, Lcom/android/phone/CallCard;->mLCforUserDataHoldCall:Z

    .line 1334
    .end local v13           #callInfoCookie:Lcom/android/phone/CallCard$CallInfoCookie;
    :goto_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallName:Landroid/widget/TextView;

    move-object/from16 v0, v17

    iget-object v3, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/android/phone/PhoneUtils;->getCompactNameFromCallerInfo(Lcom/android/internal/telephony/CallerInfo;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1343
    move-object/from16 v0, v17

    iget-boolean v2, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;->isFinal:Z

    if-eqz v2, :cond_8

    .line 1344
    const/4 v7, 0x0

    .line 1345
    .local v7, conn:Lcom/android/internal/telephony/Connection;
    invoke-virtual/range {p2 .. p2}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v20

    .line 1346
    .local v20, phoneType:I
    const/4 v2, 0x2

    move/from16 v0, v20

    if-ne v0, v2, :cond_5

    .line 1347
    invoke-virtual/range {p2 .. p2}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v7

    .line 1355
    :goto_3
    invoke-virtual {v7}, Lcom/android/internal/telephony/Connection;->getNumberPresentation()I

    move-result v4

    .line 1356
    .local v4, presentation:I
    move-object/from16 v0, v17

    iget-object v3, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/phone/CallCard;->mSecondaryCallName:Landroid/widget/TextView;

    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mSecondaryCallPhoto:Landroid/widget/ImageView;

    move-object/from16 v2, p0

    move-object/from16 v6, p2

    invoke-direct/range {v2 .. v12}, Lcom/android/phone/CallCard;->updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;Landroid/widget/TextView;ZLandroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/ImageView;)V

    goto :goto_1

    .line 1332
    .end local v4           #presentation:I
    .end local v7           #conn:Lcom/android/internal/telephony/Connection;
    .end local v20           #phoneType:I
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mSecondaryCallName:Landroid/widget/TextView;

    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-static {v2, v0, v1, v3}, Lcom/android/phone/PhoneUtils;->startGetCallerInfo(Landroid/content/Context;Lcom/android/internal/telephony/Call;Lcom/android/internal/telephony/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;)Lcom/android/phone/PhoneUtils$CallerInfoToken;

    move-result-object v17

    goto :goto_2

    .line 1348
    .restart local v7       #conn:Lcom/android/internal/telephony/Connection;
    .restart local v20       #phoneType:I
    :cond_5
    const/4 v2, 0x1

    move/from16 v0, v20

    if-eq v0, v2, :cond_6

    const/4 v2, 0x3

    move/from16 v0, v20

    if-ne v0, v2, :cond_7

    .line 1350
    :cond_6
    invoke-virtual/range {p2 .. p2}, Lcom/android/internal/telephony/Call;->getEarliestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v7

    goto :goto_3

    .line 1352
    :cond_7
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unexpected phone type: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1360
    .end local v7           #conn:Lcom/android/internal/telephony/Connection;
    .end local v20           #phoneType:I
    :cond_8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallPhoto:Landroid/widget/ImageView;

    const v3, 0x7f02009c

    invoke-static {v2, v3}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    goto/16 :goto_1

    .line 1369
    .end local v17           #infoToken:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    :pswitch_1
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/CallCard;->showSecondaryCallInfo()V

    .line 1370
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-virtual/range {p2 .. p2}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_9

    .line 1379
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    if-eqz v2, :cond_9

    .line 1380
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v2}, Lcom/android/phone/CallCard;->updateCallBannerBackground(Lcom/android/internal/telephony/Call;Landroid/view/ViewGroup;)V

    .line 1388
    :cond_9
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v2, v2, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_f

    .line 1389
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/CallCard;->showSecondaryCallInfo()V

    .line 1391
    invoke-virtual/range {p2 .. p2}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v14

    .line 1392
    .local v14, connections:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x2

    if-le v2, v3, :cond_a

    .line 1397
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallName:Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f0d02c1

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1399
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallPhoto:Landroid/widget/ImageView;

    const v3, 0x7f02009c

    invoke-static {v2, v3}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    .line 1472
    .end local v14           #connections:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    :goto_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallPhotoDimEffect:Landroid/view/View;

    const/16 v3, 0x8

    invoke-static {v2, v3}, Lcom/android/phone/AnimationUtils$Fade;->hide(Landroid/view/View;I)V

    goto/16 :goto_0

    .line 1403
    .restart local v14       #connections:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    :cond_a
    invoke-virtual/range {p2 .. p2}, Lcom/android/internal/telephony/Call;->getEarliestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v7

    .line 1404
    .restart local v7       #conn:Lcom/android/internal/telephony/Connection;
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mSecondaryCallName:Landroid/widget/TextView;

    move-object/from16 v0, p0

    invoke-static {v2, v7, v0, v3}, Lcom/android/phone/PhoneUtils;->startGetCallerInfo(Landroid/content/Context;Lcom/android/internal/telephony/Connection;Lcom/android/internal/telephony/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;)Lcom/android/phone/PhoneUtils$CallerInfoToken;

    move-result-object v17

    .line 1410
    .restart local v17       #infoToken:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    move-object/from16 v16, v0

    .line 1412
    .local v16, info:Lcom/android/internal/telephony/CallerInfo;
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-static {v0, v2}, Lcom/android/phone/PhoneUtils;->getCompactNameFromCallerInfo(Lcom/android/internal/telephony/CallerInfo;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v18

    .line 1413
    .local v18, name:Ljava/lang/String;
    const/4 v15, 0x0

    .line 1414
    .local v15, forceGenericPhoto:Z
    if-eqz v16, :cond_b

    move-object/from16 v0, v16

    iget v2, v0, Lcom/android/internal/telephony/CallerInfo;->numberPresentation:I

    sget v3, Lcom/android/internal/telephony/PhoneConstants;->PRESENTATION_ALLOWED:I

    if-eq v2, v3, :cond_b

    .line 1416
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v2

    move-object/from16 v0, v16

    iget v3, v0, Lcom/android/internal/telephony/CallerInfo;->numberPresentation:I

    invoke-static {v2, v3}, Lcom/android/phone/PhoneUtils;->getPresentationString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v18

    .line 1418
    const/4 v15, 0x1

    .line 1420
    :cond_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallName:Landroid/widget/TextView;

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1423
    move-object/from16 v0, v17

    iget-boolean v2, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;->isFinal:Z

    if-eqz v2, :cond_d

    .line 1424
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallPhoto:Landroid/widget/ImageView;

    move-object/from16 v0, v17

    iget-object v3, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    invoke-static {v2, v3}, Lcom/android/phone/CallCard;->showCachedImage(Landroid/widget/ImageView;Lcom/android/internal/telephony/CallerInfo;)Z

    move-result v2

    if-nez v2, :cond_c

    .line 1428
    sget-object v2, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    move-object/from16 v0, v17

    iget-object v3, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    iget-wide v5, v3, Lcom/android/internal/telephony/CallerInfo;->person_id:J

    invoke-static {v2, v5, v6}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v19

    .line 1433
    .local v19, personUri:Landroid/net/Uri;
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/phone/CallCard;->mLoadingPersonUri:Landroid/net/Uri;

    .line 1435
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallPhoto:Landroid/widget/ImageView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1437
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallPhoto:Landroid/widget/ImageView;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1440
    const/4 v2, 0x0

    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v3

    new-instance v5, Lcom/android/phone/CallCard$AsyncLoadCookie;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/phone/CallCard;->mSecondaryCallPhoto:Landroid/widget/ImageView;

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-direct {v5, v6, v0, v1}, Lcom/android/phone/CallCard$AsyncLoadCookie;-><init>(Landroid/widget/ImageView;Lcom/android/internal/telephony/CallerInfo;Lcom/android/internal/telephony/Call;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-static {v2, v3, v0, v1, v5}, Lcom/android/phone/ContactsAsyncHelper;->startObtainPhotoAsync(ILandroid/content/Context;Landroid/net/Uri;Lcom/android/phone/ContactsAsyncHelper$OnImageLoadCompleteListener;Ljava/lang/Object;)V

    .line 1444
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mHandler:Landroid/os/Handler;

    const/16 v3, 0x65

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 1445
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mHandler:Landroid/os/Handler;

    const/16 v3, 0x65

    const-wide/16 v5, 0x1f4

    invoke-virtual {v2, v3, v5, v6}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1448
    .end local v19           #personUri:Landroid/net/Uri;
    :cond_c
    invoke-virtual {v7}, Lcom/android/internal/telephony/Connection;->getNumberPresentation()I

    move-result v4

    .line 1449
    .restart local v4       #presentation:I
    move-object/from16 v0, v17

    iget-object v3, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/phone/CallCard;->mSecondaryCallName:Landroid/widget/TextView;

    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mSecondaryCallPhoto:Landroid/widget/ImageView;

    move-object/from16 v2, p0

    move-object/from16 v6, p2

    invoke-direct/range {v2 .. v12}, Lcom/android/phone/CallCard;->updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;Landroid/widget/TextView;ZLandroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/ImageView;)V

    .line 1460
    .end local v4           #presentation:I
    :cond_d
    if-nez v15, :cond_e

    move-object/from16 v0, v17

    iget-boolean v2, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;->isFinal:Z

    if-eqz v2, :cond_e

    .line 1461
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallPhoto:Landroid/widget/ImageView;

    move-object/from16 v0, v16

    invoke-static {v2, v0}, Lcom/android/phone/CallCard;->showCachedImage(Landroid/widget/ImageView;Lcom/android/internal/telephony/CallerInfo;)Z

    goto/16 :goto_4

    .line 1463
    :cond_e
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallPhoto:Landroid/widget/ImageView;

    const v3, 0x7f02009c

    invoke-static {v2, v3}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    goto/16 :goto_4

    .line 1468
    .end local v7           #conn:Lcom/android/internal/telephony/Connection;
    .end local v14           #connections:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    .end local v15           #forceGenericPhoto:Z
    .end local v16           #info:Lcom/android/internal/telephony/CallerInfo;
    .end local v17           #infoToken:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    .end local v18           #name:Ljava/lang/String;
    :cond_f
    const-string v2, "CallCard"

    const-string v3, "displaySecondaryCallStatus: ACTIVE state on non-CDMA device"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1469
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallInfo:Landroid/view/ViewStub;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/ViewStub;->setVisibility(I)V

    goto/16 :goto_4

    .line 1283
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private displaySecondaryIncomingAnimator()V
    .locals 13

    .prologue
    const v2, 0x3ecccccd

    const/4 v5, 0x1

    const/4 v1, 0x0

    .line 3686
    new-instance v9, Landroid/view/animation/AnimationSet;

    invoke-direct {v9, v5}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 3688
    .local v9, animationSet:Landroid/view/animation/AnimationSet;
    iget-object v3, p0, Lcom/android/phone/CallCard;->mPrimaryCallInfo:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getRight()I

    move-result v3

    iget v4, p0, Lcom/android/phone/CallCard;->mIncomingCallInfoWidth:I

    add-int v10, v3, v4

    .line 3689
    .local v10, dx:I
    iget v3, p0, Lcom/android/phone/CallCard;->mIncomingCallInfoTopMargin:I

    iget v4, p0, Lcom/android/phone/CallCard;->mIncomingCallInfoHeight:I

    add-int v11, v3, v4

    .line 3690
    .local v11, dy:I
    new-instance v12, Landroid/view/animation/TranslateAnimation;

    int-to-float v3, v10

    int-to-float v4, v11

    invoke-direct {v12, v1, v3, v1, v4}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 3691
    .local v12, translateAnimation:Landroid/view/animation/TranslateAnimation;
    const-wide/16 v3, 0x12c

    invoke-virtual {v12, v3, v4}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 3692
    invoke-virtual {v9, v12}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 3694
    new-instance v0, Landroid/view/animation/ScaleAnimation;

    move v3, v1

    move v4, v2

    move v6, v1

    move v7, v5

    move v8, v1

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    .line 3696
    .local v0, myAnimationScale:Landroid/view/animation/ScaleAnimation;
    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/ScaleAnimation;->setDuration(J)V

    .line 3697
    invoke-virtual {v9, v0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 3699
    iget-object v1, p0, Lcom/android/phone/CallCard;->mAnimationListener:Landroid/view/animation/Animation$AnimationListener;

    invoke-virtual {v9, v1}, Landroid/view/animation/AnimationSet;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 3700
    iget-object v1, p0, Lcom/android/phone/CallCard;->mIncomingCall2Info:Landroid/view/ViewGroup;

    invoke-virtual {v1, v9}, Landroid/view/ViewGroup;->startAnimation(Landroid/view/animation/Animation;)V

    .line 3701
    return-void
.end method

.method private displaySwitchIncomingAnimator()V
    .locals 14

    .prologue
    const-wide/16 v12, 0x1f4

    const v1, 0x3ecccccd

    const/4 v5, 0x1

    const/4 v2, 0x0

    .line 3705
    iget-object v3, p0, Lcom/android/phone/CallCard;->mPrimaryCallInfo:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getRight()I

    move-result v3

    iget v4, p0, Lcom/android/phone/CallCard;->mIncomingCallInfoWidth:I

    sub-int v10, v3, v4

    .line 3707
    .local v10, dx:I
    new-instance v9, Landroid/view/animation/AnimationSet;

    invoke-direct {v9, v5}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 3708
    .local v9, animationSet:Landroid/view/animation/AnimationSet;
    new-instance v11, Landroid/view/animation/TranslateAnimation;

    int-to-float v3, v10

    iget v4, p0, Lcom/android/phone/CallCard;->mIncomingCallInfoTopMargin:I

    int-to-float v4, v4

    invoke-direct {v11, v3, v2, v4, v2}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 3709
    .local v11, translateAnimation:Landroid/view/animation/TranslateAnimation;
    invoke-virtual {v11, v12, v13}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 3710
    invoke-virtual {v9, v11}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 3712
    new-instance v0, Landroid/view/animation/ScaleAnimation;

    move v3, v1

    move v4, v2

    move v6, v2

    move v7, v5

    move v8, v2

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    .line 3714
    .local v0, myAnimationScale:Landroid/view/animation/ScaleAnimation;
    invoke-virtual {v0, v12, v13}, Landroid/view/animation/ScaleAnimation;->setDuration(J)V

    .line 3715
    invoke-virtual {v9, v0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 3716
    iget-object v1, p0, Lcom/android/phone/CallCard;->mAnimationListener:Landroid/view/animation/Animation$AnimationListener;

    invoke-virtual {v9, v1}, Landroid/view/animation/AnimationSet;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 3718
    iget-object v1, p0, Lcom/android/phone/CallCard;->mIncomingCall2Info:Landroid/view/ViewGroup;

    invoke-virtual {v1, v9}, Landroid/view/ViewGroup;->startAnimation(Landroid/view/animation/Animation;)V

    .line 3719
    return-void
.end method

.method private getCallFailedString(Lcom/android/internal/telephony/Call;)Ljava/lang/String;
    .locals 5
    .parameter "call"

    .prologue
    .line 1524
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getEarliestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v0

    .line 1527
    .local v0, c:Lcom/android/internal/telephony/Connection;
    if-nez v0, :cond_0

    .line 1528
    const-string v3, "getCallFailedString: connection is null, using default values."

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 1531
    const v2, 0x7f0d02be

    .line 1608
    .local v2, resID:I
    :goto_0
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 1534
    .end local v2           #resID:I
    :cond_0
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getDisconnectCause()Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-result-object v1

    .line 1540
    .local v1, cause:Lcom/android/internal/telephony/Connection$DisconnectCause;
    sget-object v3, Lcom/android/phone/CallCard$4;->$SwitchMap$com$android$internal$telephony$Connection$DisconnectCause:[I

    invoke-virtual {v1}, Lcom/android/internal/telephony/Connection$DisconnectCause;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 1604
    const v2, 0x7f0d02be

    .restart local v2       #resID:I
    goto :goto_0

    .line 1542
    .end local v2           #resID:I
    :pswitch_0
    const v2, 0x7f0d017b

    .line 1543
    .restart local v2       #resID:I
    goto :goto_0

    .line 1546
    .end local v2           #resID:I
    :pswitch_1
    const v2, 0x7f0d017c

    .line 1547
    .restart local v2       #resID:I
    goto :goto_0

    .line 1550
    .end local v2           #resID:I
    :pswitch_2
    const v2, 0x7f0d017d

    .line 1551
    .restart local v2       #resID:I
    goto :goto_0

    .line 1554
    .end local v2           #resID:I
    :pswitch_3
    const v2, 0x7f0d017e

    .line 1555
    .restart local v2       #resID:I
    goto :goto_0

    .line 1558
    .end local v2           #resID:I
    :pswitch_4
    const v2, 0x7f0d017f

    .line 1559
    .restart local v2       #resID:I
    goto :goto_0

    .line 1562
    .end local v2           #resID:I
    :pswitch_5
    const v2, 0x7f0d0180

    .line 1563
    .restart local v2       #resID:I
    goto :goto_0

    .line 1566
    .end local v2           #resID:I
    :pswitch_6
    const v2, 0x7f0d0182

    .line 1567
    .restart local v2       #resID:I
    goto :goto_0

    .line 1570
    .end local v2           #resID:I
    :pswitch_7
    const v2, 0x7f0d0181

    .line 1571
    .restart local v2       #resID:I
    goto :goto_0

    .line 1575
    .end local v2           #resID:I
    :pswitch_8
    const v2, 0x7f0d0183

    .line 1576
    .restart local v2       #resID:I
    goto :goto_0

    .line 1579
    .end local v2           #resID:I
    :pswitch_9
    const v2, 0x7f0d0184

    .line 1580
    .restart local v2       #resID:I
    goto :goto_0

    .line 1583
    .end local v2           #resID:I
    :pswitch_a
    const v2, 0x7f0d0185

    .line 1584
    .restart local v2       #resID:I
    goto :goto_0

    .line 1588
    .end local v2           #resID:I
    :pswitch_b
    iget-object v3, p0, Lcom/android/phone/CallCard;->mServiceStateExt:Lcom/mediatek/common/telephony/IServiceStateExt;

    invoke-interface {v3}, Lcom/mediatek/common/telephony/IServiceStateExt;->isImeiLocked()Z

    move-result v3

    if-eqz v3, :cond_1

    const v2, 0x7f0d018e

    .line 1592
    .restart local v2       #resID:I
    :goto_1
    goto :goto_0

    .line 1588
    .end local v2           #resID:I
    :cond_1
    const v2, 0x7f0d0186

    goto :goto_1

    .line 1595
    :pswitch_c
    const v2, 0x7f0d0187

    .line 1596
    .restart local v2       #resID:I
    goto :goto_0

    .line 1600
    .end local v2           #resID:I
    :pswitch_d
    const v2, 0x7f0d018f

    .line 1601
    .restart local v2       #resID:I
    goto :goto_0

    .line 1540
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
        :pswitch_8
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_d
    .end packed-switch
.end method

.method private getCallFailedString(Lcom/android/internal/telephony/Connection$DisconnectCause;)Ljava/lang/String;
    .locals 3
    .parameter "cause"

    .prologue
    .line 2845
    if-nez p1, :cond_0

    .line 2847
    const-string v1, "getCallFailedString: connection is null, using default values."

    invoke-static {v1}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2851
    const v0, 0x7f0d02be

    .line 2921
    .local v0, resID:I
    :goto_0
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 2853
    .end local v0           #resID:I
    :cond_0
    sget-object v1, Lcom/android/phone/CallCard$4;->$SwitchMap$com$android$internal$telephony$Connection$DisconnectCause:[I

    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection$DisconnectCause;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 2917
    const v0, 0x7f0d02be

    .restart local v0       #resID:I
    goto :goto_0

    .line 2855
    .end local v0           #resID:I
    :pswitch_0
    const v0, 0x7f0d017b

    .line 2856
    .restart local v0       #resID:I
    goto :goto_0

    .line 2859
    .end local v0           #resID:I
    :pswitch_1
    const v0, 0x7f0d017c

    .line 2860
    .restart local v0       #resID:I
    goto :goto_0

    .line 2863
    .end local v0           #resID:I
    :pswitch_2
    const v0, 0x7f0d017d

    .line 2864
    .restart local v0       #resID:I
    goto :goto_0

    .line 2867
    .end local v0           #resID:I
    :pswitch_3
    const v0, 0x7f0d017e

    .line 2868
    .restart local v0       #resID:I
    goto :goto_0

    .line 2871
    .end local v0           #resID:I
    :pswitch_4
    const v0, 0x7f0d017f

    .line 2872
    .restart local v0       #resID:I
    goto :goto_0

    .line 2875
    .end local v0           #resID:I
    :pswitch_5
    const v0, 0x7f0d0180

    .line 2876
    .restart local v0       #resID:I
    goto :goto_0

    .line 2879
    .end local v0           #resID:I
    :pswitch_6
    const v0, 0x7f0d0182

    .line 2880
    .restart local v0       #resID:I
    goto :goto_0

    .line 2883
    .end local v0           #resID:I
    :pswitch_7
    const v0, 0x7f0d0181

    .line 2884
    .restart local v0       #resID:I
    goto :goto_0

    .line 2888
    .end local v0           #resID:I
    :pswitch_8
    const v0, 0x7f0d0183

    .line 2889
    .restart local v0       #resID:I
    goto :goto_0

    .line 2892
    .end local v0           #resID:I
    :pswitch_9
    const v0, 0x7f0d0184

    .line 2893
    .restart local v0       #resID:I
    goto :goto_0

    .line 2896
    .end local v0           #resID:I
    :pswitch_a
    const v0, 0x7f0d0185

    .line 2897
    .restart local v0       #resID:I
    goto :goto_0

    .line 2901
    .end local v0           #resID:I
    :pswitch_b
    iget-object v1, p0, Lcom/android/phone/CallCard;->mServiceStateExt:Lcom/mediatek/common/telephony/IServiceStateExt;

    invoke-interface {v1}, Lcom/mediatek/common/telephony/IServiceStateExt;->isImeiLocked()Z

    move-result v1

    if-eqz v1, :cond_1

    const v0, 0x7f0d018e

    .line 2905
    .restart local v0       #resID:I
    :goto_1
    goto :goto_0

    .line 2901
    .end local v0           #resID:I
    :cond_1
    const v0, 0x7f0d0186

    goto :goto_1

    .line 2908
    :pswitch_c
    const v0, 0x7f0d0187

    .line 2909
    .restart local v0       #resID:I
    goto :goto_0

    .line 2913
    .end local v0           #resID:I
    :pswitch_d
    const v0, 0x7f0d018f

    .line 2914
    .restart local v0       #resID:I
    goto :goto_0

    .line 2853
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
        :pswitch_8
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_d
    .end packed-switch
.end method

.method private isSecondHoldCallVisible(Lcom/android/internal/telephony/CallManager;)Z
    .locals 9
    .parameter "cm"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 589
    const/4 v3, 0x0

    .line 590
    .local v3, result:Z
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v7

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v7}, Lcom/mediatek/phone/DualTalkUtils;->isDualTalkMultipleHoldCase()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 594
    const/4 v3, 0x1

    .line 610
    :cond_0
    :goto_0
    return v3

    .line 595
    :cond_1
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v7

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v7}, Lcom/mediatek/phone/DualTalkUtils;->hasDualHoldCallsOnly()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 599
    iget-object v7, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v7}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    .line 600
    .local v2, firstHold:Lcom/android/internal/telephony/Call;
    iget-object v7, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v7}, Lcom/mediatek/phone/DualTalkUtils;->getSecondActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    .line 601
    .local v4, secondHold:Lcom/android/internal/telephony/Call;
    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v7

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v8

    if-eq v7, v8, :cond_2

    move v3, v5

    .line 602
    :goto_1
    goto :goto_0

    :cond_2
    move v3, v6

    .line 601
    goto :goto_1

    .line 603
    .end local v2           #firstHold:Lcom/android/internal/telephony/Call;
    .end local v4           #secondHold:Lcom/android/internal/telephony/Call;
    :cond_3
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    .line 604
    .local v1, fgCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 605
    .local v0, bgCall:Lcom/android/internal/telephony/Call;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v7

    sget-object v8, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    if-eq v7, v8, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 606
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v7

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v8

    if-eq v7, v8, :cond_4

    move v3, v5

    :goto_2
    goto :goto_0

    :cond_4
    move v3, v6

    goto :goto_2
.end method

.method private isSecondaryCallVisible(Lcom/android/internal/telephony/CallManager;)Z
    .locals 9
    .parameter "cm"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 564
    const/4 v3, 0x0

    .line 565
    .local v3, result:Z
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v7

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v7}, Lcom/mediatek/phone/DualTalkUtils;->isDualTalkMultipleHoldCase()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 569
    const/4 v3, 0x1

    .line 585
    :cond_0
    :goto_0
    return v3

    .line 570
    :cond_1
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v7

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v7}, Lcom/mediatek/phone/DualTalkUtils;->hasDualHoldCallsOnly()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 574
    iget-object v7, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v7}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    .line 575
    .local v2, firstHold:Lcom/android/internal/telephony/Call;
    iget-object v7, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v7}, Lcom/mediatek/phone/DualTalkUtils;->getSecondActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    .line 576
    .local v4, secondHold:Lcom/android/internal/telephony/Call;
    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v7

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v8

    if-ne v7, v8, :cond_2

    move v3, v5

    .line 577
    :goto_1
    goto :goto_0

    :cond_2
    move v3, v6

    .line 576
    goto :goto_1

    .line 578
    .end local v2           #firstHold:Lcom/android/internal/telephony/Call;
    .end local v4           #secondHold:Lcom/android/internal/telephony/Call;
    :cond_3
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    .line 579
    .local v1, fgCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 580
    .local v0, bgCall:Lcom/android/internal/telephony/Call;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v7

    sget-object v8, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    if-eq v7, v8, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 581
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v7

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v8

    if-ne v7, v8, :cond_4

    move v3, v5

    :goto_2
    goto :goto_0

    :cond_4
    move v3, v6

    goto :goto_2
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 2320
    const-string v0, "CallCard"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2321
    return-void
.end method

.method private static final showCachedImage(Landroid/widget/ImageView;Lcom/android/internal/telephony/CallerInfo;)Z
    .locals 1
    .parameter "view"
    .parameter "ci"

    .prologue
    .line 2145
    if-eqz p1, :cond_1

    iget-boolean v0, p1, Lcom/android/internal/telephony/CallerInfo;->isCachedPhotoCurrent:Z

    if-eqz v0, :cond_1

    .line 2146
    iget-object v0, p1, Lcom/android/internal/telephony/CallerInfo;->cachedPhoto:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 2147
    const-string v0, "showCachedImage: using the cachedPhoto!"

    invoke-static {v0}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2148
    iget-object v0, p1, Lcom/android/internal/telephony/CallerInfo;->cachedPhoto:Landroid/graphics/drawable/Drawable;

    invoke-static {p0, v0}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    .line 2153
    :goto_0
    const/4 v0, 0x1

    .line 2156
    :goto_1
    return v0

    .line 2150
    :cond_0
    const-string v0, "showCachedImage: using picture_unknown!"

    invoke-static {v0}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2151
    const v0, 0x7f02009c

    invoke-static {p0, v0}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    goto :goto_0

    .line 2155
    :cond_1
    const-string v0, "showCachedImage: return false!"

    invoke-static {v0}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2156
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private static final showImage(Landroid/widget/ImageView;I)V
    .locals 1
    .parameter "view"
    .parameter "resource"

    .prologue
    .line 2161
    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    .line 2162
    return-void
.end method

.method private static final showImage(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V
    .locals 2
    .parameter "view"
    .parameter "bitmap"

    .prologue
    .line 2165
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-static {p0, v0}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    .line 2166
    return-void
.end method

.method private static final showImage(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V
    .locals 4
    .parameter "view"
    .parameter "drawable"

    .prologue
    .line 2170
    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 2171
    .local v1, res:Landroid/content/res/Resources;
    invoke-virtual {p0}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    .line 2173
    .local v0, current:Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_0

    .line 2174
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Start fade-in animation for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2175
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2176
    invoke-static {p0}, Lcom/android/phone/AnimationUtils$Fade;->show(Landroid/view/View;)V

    .line 2177
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 2182
    :goto_0
    return-void

    .line 2179
    :cond_0
    invoke-static {p0, v0, p1}, Lcom/android/phone/AnimationUtils;->startCrossFade(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 2180
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method

.method private showSecondaryCallInfo()V
    .locals 2

    .prologue
    .line 1486
    const-string v0, "showSecondaryCallInfo()"

    invoke-static {v0}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 1489
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallInfo:Landroid/view/ViewStub;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewStub;->setVisibility(I)V

    .line 1490
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallName:Landroid/widget/TextView;

    if-nez v0, :cond_0

    .line 1491
    const v0, 0x7f0800f4

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallName:Landroid/widget/TextView;

    .line 1493
    :cond_0
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallStatus:Landroid/widget/TextView;

    if-nez v0, :cond_1

    .line 1494
    const v0, 0x7f0800f9

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallStatus:Landroid/widget/TextView;

    .line 1496
    :cond_1
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallPhoto:Landroid/widget/ImageView;

    if-nez v0, :cond_2

    .line 1497
    const v0, 0x7f0800f5

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallPhoto:Landroid/widget/ImageView;

    .line 1499
    :cond_2
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallPhotoDimEffect:Landroid/view/View;

    if-nez v0, :cond_3

    .line 1500
    const v0, 0x7f0800f6

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallPhotoDimEffect:Landroid/view/View;

    .line 1501
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallPhotoDimEffect:Landroid/view/View;

    iget-object v1, p0, Lcom/android/phone/CallCard;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1503
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallPhotoDimEffect:Landroid/view/View;

    new-instance v1, Lcom/android/phone/SmallerHitTargetTouchListener;

    invoke-direct {v1}, Lcom/android/phone/SmallerHitTargetTouchListener;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 1506
    :cond_3
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    if-nez v0, :cond_4

    .line 1507
    const v0, 0x7f0800f7

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    .line 1510
    :cond_4
    iget-object v0, p0, Lcom/android/phone/CallCard;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v0}, Lcom/android/phone/InCallScreen;->updateButtonStateOutsideInCallTouchUi()V

    .line 1511
    return-void
.end method

.method private updateAlreadyDisconnected(Lcom/android/internal/telephony/CallManager;)V
    .locals 4
    .parameter "cm"

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 666
    iget-object v0, p0, Lcom/android/phone/CallCard;->mPrimaryCallInfo:Landroid/view/ViewGroup;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 667
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 668
    iget-object v0, p0, Lcom/android/phone/CallCard;->mProviderInfo:Landroid/view/ViewGroup;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 669
    iget-object v0, p0, Lcom/android/phone/CallCard;->mCallStateLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 670
    iget-object v0, p0, Lcom/android/phone/CallCard;->mCallStateLabel:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/phone/CallCard;->mContext:Landroid/content/Context;

    const v2, 0x7f0d02be

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 678
    invoke-direct {p0, p1, v3}, Lcom/android/phone/CallCard;->displaySecondaryCallStatus(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)V

    .line 679
    invoke-virtual {p0, v3}, Lcom/android/phone/CallCard;->displaySecondHoldCallStatus(Lcom/android/internal/telephony/Call;)V

    .line 680
    return-void
.end method

.method private updateCallBannerBackground(Lcom/android/internal/telephony/Call;Landroid/view/ViewGroup;)V
    .locals 9
    .parameter "call"
    .parameter "callBanner"

    .prologue
    const v8, 0x7f0200a4

    const/4 v7, 0x3

    const v5, 0x7f020092

    const/4 v6, 0x0

    .line 2451
    invoke-static {p1}, Lcom/android/phone/PhoneUtils;->getSimInfoByCall(Lcom/android/internal/telephony/Call;)Landroid/provider/Telephony$SIMInfo;

    move-result-object v2

    .line 2452
    .local v2, simInfo:Landroid/provider/Telephony$SIMInfo;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 2453
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    .line 2454
    .local v0, phone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v1

    .line 2456
    .local v1, phoneType:I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Phone type is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2459
    if-ne v7, v1, :cond_5

    .line 2461
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getVisibility()I

    move-result v3

    if-nez v3, :cond_0

    .line 2462
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 2464
    :cond_0
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v3

    if-nez v3, :cond_1

    .line 2465
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 2467
    :cond_1
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v3

    if-nez v3, :cond_2

    .line 2468
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 2522
    .end local v0           #phone:Lcom/android/internal/telephony/Phone;
    .end local v1           #phoneType:I
    :cond_2
    :goto_0
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v3

    if-nez v3, :cond_3

    .line 2523
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    iget v4, p0, Lcom/android/phone/CallCard;->mCallBannerSidePadding:I

    iget v5, p0, Lcom/android/phone/CallCard;->mCallBannerSidePadding:I

    invoke-virtual {v3, v4, v6, v5, v6}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 2525
    :cond_3
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getVisibility()I

    move-result v3

    if-nez v3, :cond_4

    .line 2526
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    iget v4, p0, Lcom/android/phone/CallCard;->mSimIndicatorPaddingLeft:I

    iget v5, p0, Lcom/android/phone/CallCard;->mSimIndicatorPaddingRight:I

    invoke-virtual {v3, v4, v6, v5, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 2532
    :cond_4
    :goto_1
    return-void

    .line 2471
    .restart local v0       #phone:Lcom/android/internal/telephony/Phone;
    .restart local v1       #phoneType:I
    :cond_5
    if-eqz v2, :cond_6

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimColorMap:[I

    if-eqz v3, :cond_6

    iget v3, v2, Landroid/provider/Telephony$SIMInfo;->mColor:I

    if-ltz v3, :cond_6

    iget v3, v2, Landroid/provider/Telephony$SIMInfo;->mColor:I

    iget-object v4, p0, Lcom/android/phone/CallCard;->mSimColorMap:[I

    array-length v4, v4

    if-lt v3, v4, :cond_7

    .line 2474
    :cond_6
    const-string v3, "mSimInfo is null or mSimInfo.mColor invalid, do not update background"

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 2479
    :cond_7
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    if-eqz v3, :cond_8

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getVisibility()I

    move-result v3

    if-nez v3, :cond_8

    .line 2480
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/android/phone/CallCard;->mSimBorderMap:[I

    iget v5, v2, Landroid/provider/Telephony$SIMInfo;->mColor:I

    aget v4, v4, v5

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 2482
    :cond_8
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    if-eqz v3, :cond_9

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v3

    if-nez v3, :cond_9

    .line 2483
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    iget-object v4, p0, Lcom/android/phone/CallCard;->mSimColorMap:[I

    iget v5, v2, Landroid/provider/Telephony$SIMInfo;->mColor:I

    aget v4, v4, v5

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 2485
    :cond_9
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v3

    if-nez v3, :cond_2

    .line 2486
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    iget-object v4, p0, Lcom/android/phone/CallCard;->mSimColorMap:[I

    iget v5, v2, Landroid/provider/Telephony$SIMInfo;->mColor:I

    aget v4, v4, v5

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 2490
    .end local v0           #phone:Lcom/android/internal/telephony/Phone;
    .end local v1           #phoneType:I
    :cond_a
    if-eqz v2, :cond_b

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimColorMap:[I

    if-eqz v3, :cond_b

    iget v3, v2, Landroid/provider/Telephony$SIMInfo;->mColor:I

    if-ltz v3, :cond_b

    iget v3, v2, Landroid/provider/Telephony$SIMInfo;->mColor:I

    iget-object v4, p0, Lcom/android/phone/CallCard;->mSimColorMap:[I

    array-length v4, v4

    if-lt v3, v4, :cond_e

    .line 2493
    :cond_b
    const-string v3, "mSimInfo is null or mSimInfo.mColor invalid, set them to default value"

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2495
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    .line 2496
    .restart local v0       #phone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v1

    .line 2497
    .restart local v1       #phoneType:I
    if-ne v7, v1, :cond_4

    .line 2499
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    if-eqz v3, :cond_c

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getVisibility()I

    move-result v3

    if-nez v3, :cond_c

    .line 2500
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 2502
    :cond_c
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    if-eqz v3, :cond_d

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v3

    if-nez v3, :cond_d

    .line 2503
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 2505
    :cond_d
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v3

    if-nez v3, :cond_4

    .line 2506
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    goto/16 :goto_1

    .line 2512
    .end local v0           #phone:Lcom/android/internal/telephony/Phone;
    .end local v1           #phoneType:I
    :cond_e
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    if-eqz v3, :cond_f

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getVisibility()I

    move-result v3

    if-nez v3, :cond_f

    .line 2513
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/android/phone/CallCard;->mSimBorderMap:[I

    iget v5, v2, Landroid/provider/Telephony$SIMInfo;->mColor:I

    aget v4, v4, v5

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 2515
    :cond_f
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    if-eqz v3, :cond_10

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v3

    if-nez v3, :cond_10

    .line 2516
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    iget-object v4, p0, Lcom/android/phone/CallCard;->mSimColorMap:[I

    iget v5, v2, Landroid/provider/Telephony$SIMInfo;->mColor:I

    aget v4, v4, v5

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 2518
    :cond_10
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v3

    if-nez v3, :cond_2

    .line 2519
    iget-object v3, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    iget-object v4, p0, Lcom/android/phone/CallCard;->mSimColorMap:[I

    iget v5, v2, Landroid/provider/Telephony$SIMInfo;->mColor:I

    aget v4, v4, v5

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    goto/16 :goto_0
.end method

.method private updateCallBannerBackground(Lcom/android/phone/InCallUiState$FakeCall;Landroid/view/ViewGroup;)V
    .locals 6
    .parameter "call"
    .parameter "callBanner"

    .prologue
    const v5, 0x7f020092

    const v3, 0x7f020091

    const/4 v4, 0x0

    .line 2929
    const-string v1, "displayFakeCallStatus..."

    invoke-static {v1}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2931
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 2932
    iget v0, p1, Lcom/android/phone/InCallUiState$FakeCall;->phoneType:I

    .line 2934
    .local v0, phoneType:I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Phone type is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2936
    const/4 v1, 0x3

    if-ne v1, v0, :cond_5

    .line 2938
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_0

    .line 2939
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    const v2, 0x7f0200a4

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 2941
    :cond_0
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v1

    if-nez v1, :cond_1

    .line 2942
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 2944
    :cond_1
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v1

    if-nez v1, :cond_2

    .line 2945
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 2978
    .end local v0           #phoneType:I
    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v1

    if-nez v1, :cond_3

    .line 2979
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    iget v2, p0, Lcom/android/phone/CallCard;->mCallBannerSidePadding:I

    iget v3, p0, Lcom/android/phone/CallCard;->mCallBannerSidePadding:I

    invoke-virtual {v1, v2, v4, v3, v4}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 2981
    :cond_3
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_4

    .line 2982
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    iget v2, p0, Lcom/android/phone/CallCard;->mSimIndicatorPaddingLeft:I

    iget v3, p0, Lcom/android/phone/CallCard;->mSimIndicatorPaddingRight:I

    invoke-virtual {v1, v2, v4, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 2988
    :cond_4
    :goto_1
    return-void

    .line 2948
    .restart local v0       #phoneType:I
    :cond_5
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/android/phone/CallCard;->mSimColorMap:[I

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    iget v1, v1, Landroid/provider/Telephony$SIMInfo;->mColor:I

    if-ltz v1, :cond_6

    iget-object v1, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    iget v1, v1, Landroid/provider/Telephony$SIMInfo;->mColor:I

    iget-object v2, p0, Lcom/android/phone/CallCard;->mSimColorMap:[I

    array-length v2, v2

    if-lt v1, v2, :cond_7

    .line 2951
    :cond_6
    const-string v1, "mSimInfo is null or mSimInfo.mColor invalid, do not update background"

    invoke-static {v1}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 2956
    :cond_7
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    if-eqz v1, :cond_8

    iget-object v1, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_8

    .line 2957
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/android/phone/CallCard;->mSimBorderMap:[I

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    iget v3, v3, Landroid/provider/Telephony$SIMInfo;->mColor:I

    aget v2, v2, v3

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 2959
    :cond_8
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    if-eqz v1, :cond_9

    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v1

    if-nez v1, :cond_9

    .line 2960
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/android/phone/CallCard;->mSimColorMap:[I

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    iget v3, v3, Landroid/provider/Telephony$SIMInfo;->mColor:I

    aget v2, v2, v3

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 2962
    :cond_9
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v1

    if-nez v1, :cond_2

    .line 2963
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/android/phone/CallCard;->mSimColorMap:[I

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    iget v3, v3, Landroid/provider/Telephony$SIMInfo;->mColor:I

    aget v2, v2, v3

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 2968
    .end local v0           #phoneType:I
    :cond_a
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    if-eqz v1, :cond_b

    iget-object v1, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_b

    .line 2969
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    const v2, 0x7f0200a6

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 2971
    :cond_b
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    if-eqz v1, :cond_c

    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v1

    if-nez v1, :cond_c

    .line 2972
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 2974
    :cond_c
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v1

    if-nez v1, :cond_2

    .line 2975
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryCallBanner:Landroid/view/ViewGroup;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    goto/16 :goto_0
.end method

.method private updateCallInfoLayout(Lcom/android/internal/telephony/PhoneConstants$State;)V
    .locals 5
    .parameter "state"

    .prologue
    .line 412
    invoke-static {}, Lcom/mediatek/phone/ext/ExtensionManager;->getInstance()Lcom/mediatek/phone/ext/ExtensionManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/phone/ext/ExtensionManager;->getCallCardExtension()Lcom/mediatek/phone/ext/CallCardExtension;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/mediatek/phone/ext/CallCardExtension;->updateCallInfoLayout(Lcom/android/internal/telephony/PhoneConstants$State;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 445
    :goto_0
    return-void

    .line 418
    :cond_0
    sget-object v3, Lcom/android/internal/telephony/PhoneConstants$State;->RINGING:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne p1, v3, :cond_1

    const/4 v2, 0x1

    .line 419
    .local v2, ringing:Z
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateCallInfoLayout()...  ringing = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 431
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/android/phone/PhoneUtils;->isLandscape(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 433
    const/4 v1, 0x0

    .line 439
    .local v1, reservedVerticalSpace:I
    :goto_2
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 441
    .local v0, callInfoLp:Landroid/view/ViewGroup$MarginLayoutParams;
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 443
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "  ==> callInfoLp.bottomMargin: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 444
    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    .line 418
    .end local v0           #callInfoLp:Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v1           #reservedVerticalSpace:I
    .end local v2           #ringing:Z
    :cond_1
    const/4 v2, 0x0

    goto :goto_1

    .line 436
    .restart local v2       #ringing:Z
    :cond_2
    const/4 v1, 0x0

    .restart local v1       #reservedVerticalSpace:I
    goto :goto_2
.end method

.method private updateCallStateWidgets(Lcom/android/internal/telephony/Call;)V
    .locals 14
    .parameter "call"

    .prologue
    .line 1033
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "updateCallStateWidgets(call "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ")..."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 1034
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v8

    .line 1035
    .local v8, state:Lcom/android/internal/telephony/Call$State;
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 1036
    .local v2, context:Landroid/content/Context;
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    .line 1037
    .local v5, phone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v6

    .line 1039
    .local v6, phoneType:I
    const/4 v1, 0x0

    .line 1040
    .local v1, callStateLabel:Ljava/lang/String;
    const/4 v0, 0x0

    .line 1042
    .local v0, bluetoothIconId:I
    sget-object v9, Lcom/android/phone/CallCard$4;->$SwitchMap$com$android$internal$telephony$Call$State:[I

    invoke-virtual {v8}, Lcom/android/internal/telephony/Call$State;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_0

    .line 1097
    const-string v9, "CallCard"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "updateCallStateWidgets: unexpected call state: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 1103
    :cond_0
    :goto_0
    :pswitch_0
    const/4 v9, 0x2

    if-ne v6, v9, :cond_1

    .line 1104
    sget-object v9, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v8, v9, :cond_9

    iget-object v9, p0, Lcom/android/phone/CallCard;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v9, v9, Lcom/android/phone/PhoneGlobals;->cdmaPhoneCallState:Lcom/android/phone/CdmaPhoneCallState;

    invoke-virtual {v9}, Lcom/android/phone/CdmaPhoneCallState;->IsThreeWayCallOrigStateDialing()Z

    move-result v9

    if-eqz v9, :cond_9

    .line 1108
    const v9, 0x7f0d02ba

    invoke-virtual {v2, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1113
    :cond_1
    :goto_1
    invoke-static {v5}, Lcom/android/phone/PhoneUtils;->isPhoneInEcm(Lcom/android/internal/telephony/Phone;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 1116
    invoke-static {v2, v5}, Lcom/android/phone/PhoneUtils;->getECMCardTitle(Landroid/content/Context;Lcom/android/internal/telephony/Phone;)Ljava/lang/String;

    move-result-object v1

    .line 1119
    :cond_2
    iget-object v9, p0, Lcom/android/phone/CallCard;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v9, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    .line 1121
    .local v3, inCallUiState:Lcom/android/phone/InCallUiState;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "==> callStateLabel: \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\', bluetoothIconId = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", providerInfoVisible = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-boolean v10, v3, Lcom/android/phone/InCallUiState;->providerInfoVisible:Z

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 1130
    sget-object v9, Lcom/android/internal/telephony/Call$State;->DIALING:Lcom/android/internal/telephony/Call$State;

    if-eq v8, v9, :cond_3

    sget-object v9, Lcom/android/internal/telephony/Call$State;->DISCONNECTING:Lcom/android/internal/telephony/Call$State;

    if-eq v8, v9, :cond_3

    sget-object v9, Lcom/android/internal/telephony/Call$State;->DISCONNECTED:Lcom/android/internal/telephony/Call$State;

    if-ne v8, v9, :cond_a

    :cond_3
    const/4 v7, 0x1

    .line 1133
    .local v7, skipAnimation:Z
    :goto_2
    const/4 v4, 0x0

    .line 1134
    .local v4, layoutTransition:Landroid/animation/LayoutTransition;
    if-eqz v7, :cond_4

    .line 1136
    iget-object v9, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    invoke-virtual {v9}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v4

    .line 1137
    iget-object v9, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 1140
    :cond_4
    iget-boolean v9, v3, Lcom/android/phone/InCallUiState;->providerInfoVisible:Z

    if-eqz v9, :cond_b

    .line 1141
    iget-object v9, p0, Lcom/android/phone/CallCard;->mProviderInfo:Landroid/view/ViewGroup;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1142
    iget-object v9, p0, Lcom/android/phone/CallCard;->mProviderLabel:Landroid/widget/TextView;

    const v10, 0x7f0d0319

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    iget-object v13, v3, Lcom/android/phone/InCallUiState;->providerLabel:Ljava/lang/CharSequence;

    aput-object v13, v11, v12

    invoke-virtual {v2, v10, v11}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1144
    iget-object v9, p0, Lcom/android/phone/CallCard;->mProviderAddress:Landroid/widget/TextView;

    iget-object v10, v3, Lcom/android/phone/InCallUiState;->providerAddress:Ljava/lang/String;

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1146
    iget-object v9, p0, Lcom/android/phone/CallCard;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v9}, Lcom/android/phone/InCallScreen;->requestRemoveProviderInfoWithDelay()V

    .line 1153
    :goto_3
    iget-object v9, p0, Lcom/android/phone/CallCard;->mCallStateLabel:Landroid/widget/TextView;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1155
    if-eqz v1, :cond_5

    .line 1156
    iget-object v9, p0, Lcom/android/phone/CallCard;->mCallStateLabel:Landroid/widget/TextView;

    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1159
    :cond_5
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v9

    if-eqz v9, :cond_6

    .line 1160
    const-string v9, "DualTalkUtils.isSupportDualTalk()"

    invoke-static {v9}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 1174
    :cond_6
    if-eqz v0, :cond_c

    .line 1176
    iget-object v9, p0, Lcom/android/phone/CallCard;->mCallStateLabel:Landroid/widget/TextView;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual {v9, v10, v11, v0, v12}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 1180
    iget-object v9, p0, Lcom/android/phone/CallCard;->mCallStateLabel:Landroid/widget/TextView;

    iget v10, p0, Lcom/android/phone/CallCard;->mDensity:F

    const/high16 v11, 0x40a0

    mul-float/2addr v10, v11

    float-to-int v10, v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 1198
    :goto_4
    if-eqz v7, :cond_7

    .line 1200
    iget-object v9, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    invoke-virtual {v9, v4}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 1242
    :cond_7
    return-void

    .line 1046
    .end local v3           #inCallUiState:Lcom/android/phone/InCallUiState;
    .end local v4           #layoutTransition:Landroid/animation/LayoutTransition;
    .end local v7           #skipAnimation:Z
    :pswitch_1
    const-string v1, ""

    .line 1048
    goto/16 :goto_0

    .line 1056
    :pswitch_2
    const v9, 0x7f0d02bf

    invoke-virtual {v2, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1057
    goto/16 :goto_0

    .line 1061
    :pswitch_3
    const v9, 0x7f0d02ba

    invoke-virtual {v2, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1062
    goto/16 :goto_0

    .line 1067
    :pswitch_4
    invoke-static {p1}, Lcom/mediatek/phone/vt/VTCallUtils;->isVideoCall(Lcom/android/internal/telephony/Call;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 1068
    const v9, 0x7f0d0148

    invoke-virtual {v2, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1077
    :goto_5
    iget-object v9, p0, Lcom/android/phone/CallCard;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v9}, Lcom/android/phone/PhoneGlobals;->showBluetoothIndication()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 1078
    const v0, 0x7f020064

    goto/16 :goto_0

    .line 1070
    :cond_8
    const v9, 0x7f0d02bd

    invoke-virtual {v2, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_5

    .line 1089
    :pswitch_5
    const v9, 0x7f0d02c0

    invoke-virtual {v2, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1090
    goto/16 :goto_0

    .line 1093
    :pswitch_6
    invoke-direct {p0, p1}, Lcom/android/phone/CallCard;->getCallFailedString(Lcom/android/internal/telephony/Call;)Ljava/lang/String;

    move-result-object v1

    .line 1094
    goto/16 :goto_0

    .line 1109
    :cond_9
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v9

    iget-object v9, v9, Lcom/android/phone/PhoneGlobals;->notifier:Lcom/android/phone/CallNotifier;

    invoke-virtual {v9}, Lcom/android/phone/CallNotifier;->getIsCdmaRedialCall()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 1110
    const v9, 0x7f0d02bb

    invoke-virtual {v2, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_1

    .line 1130
    .restart local v3       #inCallUiState:Lcom/android/phone/InCallUiState;
    :cond_a
    const/4 v7, 0x0

    goto/16 :goto_2

    .line 1148
    .restart local v4       #layoutTransition:Landroid/animation/LayoutTransition;
    .restart local v7       #skipAnimation:Z
    :cond_b
    iget-object v9, p0, Lcom/android/phone/CallCard;->mProviderInfo:Landroid/view/ViewGroup;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto/16 :goto_3

    .line 1183
    :cond_c
    iget-object v9, p0, Lcom/android/phone/CallCard;->mCallStateLabel:Landroid/widget/TextView;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-virtual {v9, v10, v11, v12, v13}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    goto :goto_4

    .line 1042
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method private updateCallTypeLabel(Lcom/android/internal/telephony/Call;)V
    .locals 3
    .parameter "call"

    .prologue
    const/4 v1, 0x0

    .line 2213
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v0

    .line 2214
    .local v0, phoneType:I
    :goto_0
    const/4 v2, 0x3

    if-ne v0, v2, :cond_1

    .line 2215
    iget-object v2, p0, Lcom/android/phone/CallCard;->mCallTypeLabel:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2216
    iget-object v1, p0, Lcom/android/phone/CallCard;->mCallTypeLabel:Landroid/widget/TextView;

    const v2, 0x7f0d02e1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 2217
    iget-object v1, p0, Lcom/android/phone/CallCard;->mCallTypeLabel:Landroid/widget/TextView;

    iget v2, p0, Lcom/android/phone/CallCard;->mTextColorCallTypeSip:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2225
    :goto_1
    return-void

    .end local v0           #phoneType:I
    :cond_0
    move v0, v1

    .line 2213
    goto :goto_0

    .line 2223
    .restart local v0       #phoneType:I
    :cond_1
    iget-object v1, p0, Lcom/android/phone/CallCard;->mCallTypeLabel:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1
.end method

.method private updateDisplayForConference(Lcom/android/internal/telephony/Call;)V
    .locals 6
    .parameter "call"

    .prologue
    const v5, 0x7f020099

    const v3, 0x7f020098

    const/16 v4, 0x8

    .line 1937
    const-string v2, "updateDisplayForConference()..."

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 1939
    const/4 v0, 0x0

    .line 1940
    .local v0, hasMultipleRingingCalls:Z
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v2}, Lcom/mediatek/phone/DualTalkUtils;->hasMultipleRingingCall()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1941
    const/4 v0, 0x1

    .line 1945
    :cond_0
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v1

    .line 1946
    .local v1, phoneType:I
    const/4 v2, 0x2

    if-ne v1, v2, :cond_3

    .line 1953
    iget-object v2, p0, Lcom/android/phone/CallCard;->mPhoto:Landroid/widget/ImageView;

    invoke-static {v2, v5}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    .line 1955
    if-eqz v0, :cond_1

    .line 1956
    iget-object v2, p0, Lcom/android/phone/CallCard;->mPhotoIncomingPre:Landroid/widget/ImageView;

    invoke-static {v2, v5}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    .line 1959
    :cond_1
    iget-object v2, p0, Lcom/android/phone/CallCard;->mName:Landroid/widget/TextView;

    const v3, 0x7f0d02c1

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 1977
    :goto_0
    iget-object v2, p0, Lcom/android/phone/CallCard;->mName:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1983
    iget-object v2, p0, Lcom/android/phone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1984
    iget-object v2, p0, Lcom/android/phone/CallCard;->mLabel:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1986
    iget-object v2, p0, Lcom/android/phone/CallCard;->mPhoneNumberGeoDescription:Landroid/widget/TextView;

    if-eqz v2, :cond_2

    .line 1987
    iget-object v2, p0, Lcom/android/phone/CallCard;->mPhoneNumberGeoDescription:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1991
    :cond_2
    invoke-direct {p0, p1}, Lcom/android/phone/CallCard;->updateCallTypeLabel(Lcom/android/internal/telephony/Call;)V

    .line 2003
    return-void

    .line 1960
    :cond_3
    const/4 v2, 0x1

    if-eq v1, v2, :cond_4

    const/4 v2, 0x3

    if-ne v1, v2, :cond_6

    .line 1966
    :cond_4
    iget-object v2, p0, Lcom/android/phone/CallCard;->mPhoto:Landroid/widget/ImageView;

    invoke-static {v2, v3}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    .line 1968
    if-eqz v0, :cond_5

    .line 1969
    iget-object v2, p0, Lcom/android/phone/CallCard;->mPhotoIncomingPre:Landroid/widget/ImageView;

    invoke-static {v2, v3}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    .line 1972
    :cond_5
    iget-object v2, p0, Lcom/android/phone/CallCard;->mName:Landroid/widget/TextView;

    const v3, 0x7f0d02bc

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 1974
    :cond_6
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected phone type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;)V
    .locals 16
    .parameter "info"
    .parameter "presentation"
    .parameter "isTemporary"
    .parameter "call"
    .parameter "conn"

    .prologue
    .line 1623
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "updateDisplayForPerson("

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ")\npresentation:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " isTemporary:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move/from16 v0, p3

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 1627
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhotoTracker:Lcom/android/phone/ContactsAsyncHelper$ImageTracker;

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Lcom/android/phone/ContactsAsyncHelper$ImageTracker;->setPhotoRequest(Lcom/android/internal/telephony/CallerInfo;)V

    .line 1628
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhotoTracker:Lcom/android/phone/ContactsAsyncHelper$ImageTracker;

    const/4 v13, -0x1

    invoke-virtual {v12, v13}, Lcom/android/phone/ContactsAsyncHelper$ImageTracker;->setPhotoState(I)V

    .line 1639
    const/4 v4, 0x0

    .line 1640
    .local v4, displayNumber:Ljava/lang/String;
    const/4 v7, 0x0

    .line 1641
    .local v7, label:Ljava/lang/String;
    const/4 v10, 0x0

    .line 1645
    .local v10, personUri:Landroid/net/Uri;
    const/4 v9, 0x0

    .line 1646
    .local v9, numberGeoDescription:Ljava/lang/String;
    const/4 v6, 0x0

    .line 1647
    .local v6, hasMultipleRingingCalls:Z
    const/4 v2, 0x1

    .line 1649
    .local v2, bFirstIncoming:Z
    if-eqz p1, :cond_d

    .line 1666
    sget-boolean v12, Lcom/android/phone/CallCard;->mLocaleChanged:Z

    if-eqz v12, :cond_1

    .line 1667
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/CallerInfo;->isEmergencyNumber()Z

    move-result v12

    if-eqz v12, :cond_0

    .line 1668
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v12

    const v13, 0x10402e5

    invoke-virtual {v12, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p1

    iput-object v12, v0, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    .line 1671
    :cond_0
    const/4 v12, 0x0

    sput-boolean v12, Lcom/android/phone/CallCard;->mLocaleChanged:Z

    .line 1683
    :cond_1
    move-object/from16 v0, p1

    iget-object v8, v0, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    .line 1684
    .local v8, number:Ljava/lang/String;
    if-eqz v8, :cond_2

    const-string v12, "sip:"

    invoke-virtual {v8, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 1685
    const/4 v12, 0x4

    invoke-virtual {v8, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 1689
    :cond_2
    if-eqz v8, :cond_3

    .line 1690
    invoke-static {}, Lcom/mediatek/phone/HyphonManager;->getInstance()Lcom/mediatek/phone/HyphonManager;

    move-result-object v12

    invoke-virtual {v12, v8}, Lcom/mediatek/phone/HyphonManager;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1694
    :cond_3
    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/android/internal/telephony/CallerInfo;->name:Ljava/lang/String;

    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_b

    .line 1700
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_7

    .line 1703
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v12

    move/from16 v0, p2

    invoke-static {v12, v0}, Lcom/android/phone/PhoneUtils;->getPresentationString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v3

    .line 1704
    .local v3, displayName:Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "  ==> no name *or* number! displayName = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 1779
    :goto_0
    sget-object v12, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    move-object/from16 v0, p1

    iget-wide v13, v0, Lcom/android/internal/telephony/CallerInfo;->person_id:J

    invoke-static {v12, v13, v14}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v10

    .line 1780
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "- got personUri: \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\', based on info.person_id: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p1

    iget-wide v13, v0, Lcom/android/internal/telephony/CallerInfo;->person_id:J

    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 1816
    .end local v8           #number:Ljava/lang/String;
    :goto_1
    invoke-virtual/range {p4 .. p4}, Lcom/android/internal/telephony/Call;->isGeneric()Z

    move-result v12

    if-eqz v12, :cond_e

    .line 1817
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mName:Landroid/widget/TextView;

    const v13, 0x7f0d02c1

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(I)V

    .line 1821
    :goto_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mName:Landroid/widget/TextView;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1823
    if-eqz v4, :cond_f

    invoke-virtual/range {p4 .. p4}, Lcom/android/internal/telephony/Call;->isGeneric()Z

    move-result v12

    if-nez v12, :cond_f

    .line 1824
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    invoke-virtual {v12, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1825
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1830
    :goto_3
    if-eqz v7, :cond_10

    invoke-virtual/range {p4 .. p4}, Lcom/android/internal/telephony/Call;->isGeneric()Z

    move-result v12

    if-nez v12, :cond_10

    .line 1831
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mLabel:Landroid/widget/TextView;

    invoke-virtual {v12, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1832
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mLabel:Landroid/widget/TextView;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1850
    :goto_4
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v12

    if-eqz v12, :cond_4

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v12}, Lcom/mediatek/phone/DualTalkUtils;->hasMultipleRingingCall()Z

    move-result v12

    if-eqz v12, :cond_4

    .line 1851
    const/4 v6, 0x1

    .line 1852
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v12}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v5

    .line 1853
    .local v5, fisrtCall:Lcom/android/internal/telephony/Call;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v12}, Lcom/mediatek/phone/DualTalkUtils;->getSecondActiveRingCall()Lcom/android/internal/telephony/Call;

    move-result-object v11

    .line 1854
    .local v11, secondCall:Lcom/android/internal/telephony/Call;
    move-object/from16 v0, p4

    if-ne v0, v11, :cond_4

    .line 1855
    const/4 v2, 0x0

    .line 1859
    .end local v5           #fisrtCall:Lcom/android/internal/telephony/Call;
    .end local v11           #secondCall:Lcom/android/internal/telephony/Call;
    :cond_4
    if-eqz p3, :cond_11

    if-eqz p1, :cond_5

    move-object/from16 v0, p1

    iget-boolean v12, v0, Lcom/android/internal/telephony/CallerInfo;->isCachedPhotoCurrent:Z

    if-nez v12, :cond_11

    .line 1860
    :cond_5
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhoto:Landroid/widget/ImageView;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1861
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhoto:Landroid/widget/ImageView;

    const/4 v13, 0x4

    invoke-virtual {v12, v13}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1909
    :cond_6
    :goto_5
    invoke-virtual/range {p4 .. p4}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v12

    sget-object v13, Lcom/android/internal/telephony/Call$State;->HOLDING:Lcom/android/internal/telephony/Call$State;

    if-ne v12, v13, :cond_19

    .line 1910
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhotoDimEffect:Landroid/view/View;

    invoke-static {v12}, Lcom/android/phone/AnimationUtils$Fade;->show(Landroid/view/View;)V

    .line 1916
    :goto_6
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_1a

    .line 1917
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhoneNumberGeoDescription:Landroid/widget/TextView;

    const/4 v13, 0x4

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1925
    :goto_7
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lcom/android/phone/CallCard;->updateCallTypeLabel(Lcom/android/internal/telephony/Call;)V

    .line 1927
    return-void

    .line 1705
    .end local v3           #displayName:Ljava/lang/String;
    .restart local v8       #number:Ljava/lang/String;
    :cond_7
    sget v12, Lcom/android/internal/telephony/PhoneConstants;->PRESENTATION_ALLOWED:I

    move/from16 v0, p2

    if-eq v0, v12, :cond_8

    .line 1709
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v12

    move/from16 v0, p2

    invoke-static {v12, v0}, Lcom/android/phone/PhoneUtils;->getPresentationString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v3

    .line 1710
    .restart local v3       #displayName:Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "  ==> presentation not allowed! displayName = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1711
    .end local v3           #displayName:Ljava/lang/String;
    :cond_8
    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/android/internal/telephony/CallerInfo;->cnapName:Ljava/lang/String;

    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_9

    .line 1713
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/android/internal/telephony/CallerInfo;->cnapName:Ljava/lang/String;

    .line 1714
    .restart local v3       #displayName:Ljava/lang/String;
    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/android/internal/telephony/CallerInfo;->cnapName:Ljava/lang/String;

    move-object/from16 v0, p1

    iput-object v12, v0, Lcom/android/internal/telephony/CallerInfo;->name:Ljava/lang/String;

    .line 1715
    move-object v4, v8

    .line 1716
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "  ==> cnapName available: displayName \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\', displayNumber \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1725
    .end local v3           #displayName:Ljava/lang/String;
    :cond_9
    move-object v3, v8

    .line 1736
    .restart local v3       #displayName:Ljava/lang/String;
    if-eqz p5, :cond_a

    .line 1744
    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/android/internal/telephony/CallerInfo;->geoDescription:Ljava/lang/String;

    .line 1749
    :cond_a
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "  ==>  no name; falling back to number: displayName \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\', numberGeoDescription \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1755
    .end local v3           #displayName:Ljava/lang/String;
    :cond_b
    sget v12, Lcom/android/internal/telephony/PhoneConstants;->PRESENTATION_ALLOWED:I

    move/from16 v0, p2

    if-eq v0, v12, :cond_c

    .line 1759
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v12

    move/from16 v0, p2

    invoke-static {v12, v0}, Lcom/android/phone/PhoneUtils;->getPresentationString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v3

    .line 1760
    .restart local v3       #displayName:Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "  ==> valid name, but presentation not allowed! displayName = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1763
    .end local v3           #displayName:Ljava/lang/String;
    :cond_c
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/android/internal/telephony/CallerInfo;->name:Ljava/lang/String;

    .line 1764
    .restart local v3       #displayName:Ljava/lang/String;
    move-object v4, v8

    .line 1765
    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/android/internal/telephony/CallerInfo;->phoneLabel:Ljava/lang/String;

    .line 1766
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "  ==>  name is present in CallerInfo: displayName \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\', displayNumber \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 1770
    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/android/internal/telephony/CallerInfo;->geoDescription:Ljava/lang/String;

    .line 1772
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "  ==>  name is present in CallerInfo: numberGeooDescription \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1783
    .end local v3           #displayName:Ljava/lang/String;
    .end local v8           #number:Ljava/lang/String;
    :cond_d
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v12

    move/from16 v0, p2

    invoke-static {v12, v0}, Lcom/android/phone/PhoneUtils;->getPresentationString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v3

    .restart local v3       #displayName:Ljava/lang/String;
    goto/16 :goto_1

    .line 1819
    :cond_e
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mName:Landroid/widget/TextView;

    invoke-virtual {v12, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 1827
    :cond_f
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    const/16 v13, 0x8

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_3

    .line 1834
    :cond_10
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mLabel:Landroid/widget/TextView;

    const/16 v13, 0x8

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_4

    .line 1862
    :cond_11
    if-eqz p1, :cond_13

    move-object/from16 v0, p1

    iget v12, v0, Lcom/android/internal/telephony/CallerInfo;->photoResource:I

    if-eqz v12, :cond_13

    .line 1863
    if-eqz v2, :cond_12

    .line 1864
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhoto:Landroid/widget/ImageView;

    move-object/from16 v0, p1

    iget v13, v0, Lcom/android/internal/telephony/CallerInfo;->photoResource:I

    invoke-static {v12, v13}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    goto/16 :goto_5

    .line 1866
    :cond_12
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhotoIncomingPre:Landroid/widget/ImageView;

    move-object/from16 v0, p1

    iget v13, v0, Lcom/android/internal/telephony/CallerInfo;->photoResource:I

    invoke-static {v12, v13}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    goto/16 :goto_5

    .line 1868
    :cond_13
    if-eqz v2, :cond_14

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhoto:Landroid/widget/ImageView;

    :goto_8
    move-object/from16 v0, p1

    invoke-static {v12, v0}, Lcom/android/phone/CallCard;->showCachedImage(Landroid/widget/ImageView;Lcom/android/internal/telephony/CallerInfo;)Z

    move-result v12

    if-nez v12, :cond_6

    .line 1869
    if-nez v10, :cond_16

    .line 1870
    const-string v12, "CallCard"

    const-string v13, "personPri is null. Just use Unknown picture."

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1871
    if-eqz v2, :cond_15

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhoto:Landroid/widget/ImageView;

    :goto_9
    const v13, 0x7f02009c

    invoke-static {v12, v13}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    .line 1898
    :goto_a
    if-eqz v6, :cond_6

    .line 1899
    const/4 v13, 0x0

    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v14

    new-instance v15, Lcom/android/phone/CallCard$AsyncLoadCookie;

    if-eqz v2, :cond_18

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhoto:Landroid/widget/ImageView;

    :goto_b
    move-object/from16 v0, p1

    move-object/from16 v1, p4

    invoke-direct {v15, v12, v0, v1}, Lcom/android/phone/CallCard$AsyncLoadCookie;-><init>(Landroid/widget/ImageView;Lcom/android/internal/telephony/CallerInfo;Lcom/android/internal/telephony/Call;)V

    move-object/from16 v0, p0

    invoke-static {v13, v14, v10, v0, v15}, Lcom/android/phone/ContactsAsyncHelper;->startObtainPhotoAsync(ILandroid/content/Context;Landroid/net/Uri;Lcom/android/phone/ContactsAsyncHelper$OnImageLoadCompleteListener;Ljava/lang/Object;)V

    goto/16 :goto_5

    .line 1868
    :cond_14
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhotoIncomingPre:Landroid/widget/ImageView;

    goto :goto_8

    .line 1871
    :cond_15
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhotoIncomingPre:Landroid/widget/ImageView;

    goto :goto_9

    .line 1872
    :cond_16
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mLoadingPersonUri:Landroid/net/Uri;

    invoke-virtual {v10, v12}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_17

    .line 1874
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "The requested Uri ("

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ") is being loaded already."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " Ignoret the duplicate load request."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto :goto_a

    .line 1881
    :cond_17
    move-object/from16 v0, p0

    iput-object v10, v0, Lcom/android/phone/CallCard;->mLoadingPersonUri:Landroid/net/Uri;

    .line 1884
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhoto:Landroid/widget/ImageView;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1886
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhoto:Landroid/widget/ImageView;

    const/4 v13, 0x4

    invoke-virtual {v12, v13}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1889
    const/4 v12, 0x0

    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v13

    new-instance v14, Lcom/android/phone/CallCard$AsyncLoadCookie;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/CallCard;->mPhoto:Landroid/widget/ImageView;

    move-object/from16 v0, p1

    move-object/from16 v1, p4

    invoke-direct {v14, v15, v0, v1}, Lcom/android/phone/CallCard$AsyncLoadCookie;-><init>(Landroid/widget/ImageView;Lcom/android/internal/telephony/CallerInfo;Lcom/android/internal/telephony/Call;)V

    move-object/from16 v0, p0

    invoke-static {v12, v13, v10, v0, v14}, Lcom/android/phone/ContactsAsyncHelper;->startObtainPhotoAsync(ILandroid/content/Context;Landroid/net/Uri;Lcom/android/phone/ContactsAsyncHelper$OnImageLoadCompleteListener;Ljava/lang/Object;)V

    .line 1894
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mHandler:Landroid/os/Handler;

    const/16 v13, 0x65

    invoke-virtual {v12, v13}, Landroid/os/Handler;->removeMessages(I)V

    .line 1895
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mHandler:Landroid/os/Handler;

    const/16 v13, 0x65

    const-wide/16 v14, 0x1f4

    invoke-virtual {v12, v13, v14, v15}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_a

    .line 1899
    :cond_18
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhotoIncomingPre:Landroid/widget/ImageView;

    goto/16 :goto_b

    .line 1912
    :cond_19
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhotoDimEffect:Landroid/view/View;

    const/16 v13, 0x8

    invoke-static {v12, v13}, Lcom/android/phone/AnimationUtils$Fade;->hide(Landroid/view/View;I)V

    goto/16 :goto_6

    .line 1919
    :cond_1a
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhoneNumberGeoDescription:Landroid/widget/TextView;

    invoke-virtual {v12, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1920
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhoneNumberGeoDescription:Landroid/widget/TextView;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_7
.end method

.method private updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;Landroid/widget/TextView;ZLandroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/ImageView;)V
    .locals 13
    .parameter "info"
    .parameter "presentation"
    .parameter "isTemporary"
    .parameter "call"
    .parameter "conn"
    .parameter "nameView"
    .parameter "isOnHold"
    .parameter "numberView"
    .parameter "labelView"
    .parameter "photoView"

    .prologue
    .line 2538
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "updateDisplayForPerson(), info: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " presentation:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " isTemporary: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move/from16 v0, p3

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " call: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, p4

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " conn: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, p5

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " nameView: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, p6

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " isOnHold: +"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move/from16 v0, p7

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " numberView: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, p8

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " labelView: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, p9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "photoView: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, p10

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2546
    if-nez p7, :cond_0

    .line 2547
    iget-object v9, p0, Lcom/android/phone/CallCard;->mPhotoTracker:Lcom/android/phone/ContactsAsyncHelper$ImageTracker;

    invoke-virtual {v9, p1}, Lcom/android/phone/ContactsAsyncHelper$ImageTracker;->setPhotoRequest(Lcom/android/internal/telephony/CallerInfo;)V

    .line 2548
    iget-object v9, p0, Lcom/android/phone/CallCard;->mPhotoTracker:Lcom/android/phone/ContactsAsyncHelper$ImageTracker;

    const/4 v10, -0x1

    invoke-virtual {v9, v10}, Lcom/android/phone/ContactsAsyncHelper$ImageTracker;->setPhotoState(I)V

    .line 2553
    :cond_0
    const/4 v3, 0x0

    .line 2554
    .local v3, displayNumber:Ljava/lang/String;
    const/4 v4, 0x0

    .line 2555
    .local v4, label:Ljava/lang/String;
    const/4 v6, 0x0

    .line 2556
    .local v6, personUri:Landroid/net/Uri;
    const/4 v8, 0x0

    .line 2557
    .local v8, socialStatusText:Ljava/lang/String;
    const/4 v7, 0x0

    .line 2559
    .local v7, socialStatusBadge:Landroid/graphics/drawable/Drawable;
    if-eqz p1, :cond_11

    .line 2575
    sget-boolean v9, Lcom/android/phone/CallCard;->mLocaleChanged:Z

    if-eqz v9, :cond_2

    .line 2576
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallerInfo;->isEmergencyNumber()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 2577
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v9

    const v10, 0x10402e5

    invoke-virtual {v9, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p1, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    .line 2580
    :cond_1
    const/4 v9, 0x0

    sput-boolean v9, Lcom/android/phone/CallCard;->mLocaleChanged:Z

    .line 2592
    :cond_2
    iget-object v5, p1, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    .line 2593
    .local v5, number:Ljava/lang/String;
    if-eqz v5, :cond_3

    const-string v9, "sip:"

    invoke-virtual {v5, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 2594
    const/4 v9, 0x4

    invoke-virtual {v5, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 2596
    :cond_3
    invoke-static {}, Lcom/mediatek/phone/HyphonManager;->getInstance()Lcom/mediatek/phone/HyphonManager;

    move-result-object v9

    invoke-virtual {v9, v5}, Lcom/mediatek/phone/HyphonManager;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 2598
    iget-object v9, p1, Lcom/android/internal/telephony/CallerInfo;->name:Ljava/lang/String;

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_f

    .line 2604
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 2608
    iget-object v9, p0, Lcom/android/phone/CallCard;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-static {v9, p2}, Lcom/android/phone/PhoneUtils;->getPresentationString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    .line 2610
    .local v2, displayName:Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "  ==> no name *or* number! displayName = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2690
    :goto_0
    sget-object v9, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    iget-wide v10, p1, Lcom/android/internal/telephony/CallerInfo;->person_id:J

    invoke-static {v9, v10, v11}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v6

    .line 2692
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "- got personUri: \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\', based on info.person_id: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-wide v10, p1, Lcom/android/internal/telephony/CallerInfo;->person_id:J

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2699
    .end local v5           #number:Ljava/lang/String;
    :goto_1
    invoke-virtual/range {p4 .. p4}, Lcom/android/internal/telephony/Call;->isGeneric()Z

    move-result v9

    if-eqz v9, :cond_12

    if-eqz p6, :cond_12

    .line 2700
    const v9, 0x7f0d02c1

    move-object/from16 v0, p6

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setText(I)V

    .line 2704
    :cond_4
    :goto_2
    if-eqz p6, :cond_5

    .line 2705
    const/4 v9, 0x0

    move-object/from16 v0, p6

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2721
    :cond_5
    if-eqz p3, :cond_13

    if-eqz p1, :cond_6

    iget-boolean v9, p1, Lcom/android/internal/telephony/CallerInfo;->isCachedPhotoCurrent:Z

    if-nez v9, :cond_13

    .line 2722
    :cond_6
    const/4 v9, 0x0

    move-object/from16 v0, p10

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 2723
    const/4 v9, 0x4

    move-object/from16 v0, p10

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2752
    :cond_7
    :goto_3
    if-eqz p8, :cond_16

    if-eqz v3, :cond_16

    invoke-virtual/range {p4 .. p4}, Lcom/android/internal/telephony/Call;->isGeneric()Z

    move-result v9

    if-nez v9, :cond_16

    .line 2753
    move-object/from16 v0, p8

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2754
    const/4 v9, 0x0

    move-object/from16 v0, p8

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2759
    :cond_8
    :goto_4
    if-eqz p9, :cond_17

    if-eqz v4, :cond_17

    invoke-virtual/range {p4 .. p4}, Lcom/android/internal/telephony/Call;->isGeneric()Z

    move-result v9

    if-nez v9, :cond_17

    .line 2760
    move-object/from16 v0, p9

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2761
    const/4 v9, 0x0

    move-object/from16 v0, p9

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2765
    :cond_9
    :goto_5
    return-void

    .line 2612
    .end local v2           #displayName:Ljava/lang/String;
    .restart local v5       #number:Ljava/lang/String;
    :cond_a
    sget v9, Lcom/android/internal/telephony/PhoneConstants;->PRESENTATION_ALLOWED:I

    if-eq p2, v9, :cond_b

    .line 2618
    iget-object v9, p0, Lcom/android/phone/CallCard;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-static {v9, p2}, Lcom/android/phone/PhoneUtils;->getPresentationString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    .line 2620
    .restart local v2       #displayName:Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "  ==> presentation not allowed! displayName = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2622
    .end local v2           #displayName:Ljava/lang/String;
    :cond_b
    iget-object v9, p1, Lcom/android/internal/telephony/CallerInfo;->cnapName:Ljava/lang/String;

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_c

    .line 2624
    iget-object v2, p1, Lcom/android/internal/telephony/CallerInfo;->cnapName:Ljava/lang/String;

    .line 2625
    .restart local v2       #displayName:Ljava/lang/String;
    iget-object v9, p1, Lcom/android/internal/telephony/CallerInfo;->cnapName:Ljava/lang/String;

    iput-object v9, p1, Lcom/android/internal/telephony/CallerInfo;->name:Ljava/lang/String;

    .line 2626
    move-object v3, v5

    .line 2628
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "  ==> cnapName available: displayName \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\', displayNumber \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2638
    .end local v2           #displayName:Ljava/lang/String;
    :cond_c
    move-object v2, v5

    .line 2643
    .restart local v2       #displayName:Ljava/lang/String;
    if-eqz p5, :cond_d

    invoke-virtual/range {p5 .. p5}, Lcom/android/internal/telephony/Connection;->isIncoming()Z

    move-result v9

    if-eqz v9, :cond_d

    invoke-virtual/range {p4 .. p4}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v9

    sget-object v10, Lcom/android/internal/telephony/Call$State;->HOLDING:Lcom/android/internal/telephony/Call$State;

    if-eq v9, v10, :cond_d

    .line 2651
    iget-object v9, p1, Lcom/android/internal/telephony/CallerInfo;->geoDescription:Ljava/lang/String;

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_e

    .line 2652
    iget-object v9, p0, Lcom/android/phone/CallCard;->mPhoneNumberGeoDescription:Landroid/widget/TextView;

    const/4 v10, 0x4

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2661
    :cond_d
    :goto_6
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "  ==>  no name; falling back to number: displayName \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\', displayNumber \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2654
    :cond_e
    iget-object v9, p0, Lcom/android/phone/CallCard;->mPhoneNumberGeoDescription:Landroid/widget/TextView;

    iget-object v10, p1, Lcom/android/internal/telephony/CallerInfo;->geoDescription:Ljava/lang/String;

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2655
    iget-object v9, p0, Lcom/android/phone/CallCard;->mPhoneNumberGeoDescription:Landroid/widget/TextView;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_6

    .line 2669
    .end local v2           #displayName:Ljava/lang/String;
    :cond_f
    sget v9, Lcom/android/internal/telephony/PhoneConstants;->PRESENTATION_ALLOWED:I

    if-eq p2, v9, :cond_10

    .line 2675
    iget-object v9, p0, Lcom/android/phone/CallCard;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-static {v9, p2}, Lcom/android/phone/PhoneUtils;->getPresentationString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    .line 2677
    .restart local v2       #displayName:Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "  ==> valid name, but presentation not allowed! displayName = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2681
    .end local v2           #displayName:Ljava/lang/String;
    :cond_10
    iget-object v2, p1, Lcom/android/internal/telephony/CallerInfo;->name:Ljava/lang/String;

    .line 2682
    .restart local v2       #displayName:Ljava/lang/String;
    move-object v3, v5

    .line 2683
    iget-object v4, p1, Lcom/android/internal/telephony/CallerInfo;->phoneLabel:Ljava/lang/String;

    .line 2685
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "  ==>  name is present in CallerInfo: displayName \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\', displayNumber \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2696
    .end local v2           #displayName:Ljava/lang/String;
    .end local v5           #number:Ljava/lang/String;
    :cond_11
    iget-object v9, p0, Lcom/android/phone/CallCard;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-static {v9, p2}, Lcom/android/phone/PhoneUtils;->getPresentationString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    .restart local v2       #displayName:Ljava/lang/String;
    goto/16 :goto_1

    .line 2701
    :cond_12
    if-eqz p6, :cond_4

    .line 2702
    move-object/from16 v0, p6

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 2724
    :cond_13
    if-eqz p1, :cond_14

    iget v9, p1, Lcom/android/internal/telephony/CallerInfo;->photoResource:I

    if-eqz v9, :cond_14

    .line 2725
    iget v9, p1, Lcom/android/internal/telephony/CallerInfo;->photoResource:I

    move-object/from16 v0, p10

    invoke-static {v0, v9}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    goto/16 :goto_3

    .line 2726
    :cond_14
    move-object/from16 v0, p10

    invoke-static {v0, p1}, Lcom/android/phone/CallCard;->showCachedImage(Landroid/widget/ImageView;Lcom/android/internal/telephony/CallerInfo;)Z

    move-result v9

    if-nez v9, :cond_7

    .line 2730
    iput-object v6, p0, Lcom/android/phone/CallCard;->mLoadingPersonUri:Landroid/net/Uri;

    .line 2732
    const/4 v9, 0x0

    move-object/from16 v0, p10

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 2734
    const/4 v9, 0x4

    move-object/from16 v0, p10

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2736
    if-nez v6, :cond_15

    .line 2737
    const-string v9, "CallCard"

    const-string v10, "personPri is null. Just use Unknown picture."

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2738
    const v9, 0x7f02009c

    move-object/from16 v0, p10

    invoke-static {v0, v9}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    goto/16 :goto_3

    .line 2742
    :cond_15
    const/4 v9, 0x0

    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v10

    new-instance v11, Lcom/android/phone/CallCard$AsyncLoadCookie;

    move-object/from16 v0, p10

    move-object/from16 v1, p4

    invoke-direct {v11, v0, p1, v1}, Lcom/android/phone/CallCard$AsyncLoadCookie;-><init>(Landroid/widget/ImageView;Lcom/android/internal/telephony/CallerInfo;Lcom/android/internal/telephony/Call;)V

    invoke-static {v9, v10, v6, p0, v11}, Lcom/android/phone/ContactsAsyncHelper;->startObtainPhotoAsync(ILandroid/content/Context;Landroid/net/Uri;Lcom/android/phone/ContactsAsyncHelper$OnImageLoadCompleteListener;Ljava/lang/Object;)V

    .line 2747
    iget-object v9, p0, Lcom/android/phone/CallCard;->mHandler:Landroid/os/Handler;

    const/16 v10, 0x65

    invoke-virtual {v9, v10}, Landroid/os/Handler;->removeMessages(I)V

    .line 2748
    iget-object v9, p0, Lcom/android/phone/CallCard;->mHandler:Landroid/os/Handler;

    const/16 v10, 0x65

    const-wide/16 v11, 0x1f4

    invoke-virtual {v9, v10, v11, v12}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_3

    .line 2755
    :cond_16
    if-eqz p8, :cond_8

    .line 2756
    const/16 v9, 0x8

    move-object/from16 v0, p8

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_4

    .line 2762
    :cond_17
    if-eqz p9, :cond_9

    .line 2763
    const/16 v9, 0x8

    move-object/from16 v0, p9

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_5
.end method

.method private updateForegroundCall(Lcom/android/internal/telephony/CallManager;)V
    .locals 10
    .parameter "cm"

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 451
    const-string v6, "updateForegroundCall()..."

    invoke-static {v6}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 455
    const/4 v1, 0x0

    .line 456
    .local v1, fgCall:Lcom/android/internal/telephony/Call;
    const/4 v0, 0x0

    .line 458
    .local v0, bgCall:Lcom/android/internal/telephony/Call;
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v6

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v6}, Lcom/mediatek/phone/DualTalkUtils;->isDualTalkMultipleHoldCase()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 461
    iget-object v6, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v6}, Lcom/mediatek/phone/DualTalkUtils;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    .line 462
    iget-object v6, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v6}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 485
    :goto_0
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v5

    .line 486
    .local v5, ringingCall:Lcom/android/internal/telephony/Call;
    if-eqz v5, :cond_4

    if-eqz v1, :cond_4

    .line 487
    invoke-virtual {v5}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v6

    sget-object v7, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    if-eq v6, v7, :cond_4

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/internal/telephony/Call$State;->isDialing()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 561
    :cond_0
    :goto_1
    return-void

    .line 463
    .end local v5           #ringingCall:Lcom/android/internal/telephony/Call;
    :cond_1
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v6

    if-eqz v6, :cond_2

    iget-object v6, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v6}, Lcom/mediatek/phone/DualTalkUtils;->hasDualHoldCallsOnly()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 466
    iget-object v6, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v6}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    .line 467
    iget-object v6, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v6}, Lcom/mediatek/phone/DualTalkUtils;->getSecondActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    goto :goto_0

    .line 468
    :cond_2
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v6

    if-eqz v6, :cond_3

    iget-object v6, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v6}, Lcom/mediatek/phone/DualTalkUtils;->isCdmaAndGsmActive()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 470
    iget-object v6, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v6}, Lcom/mediatek/phone/DualTalkUtils;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    .line 471
    iget-object v6, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v6}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 473
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "isCdmaAndGsmActive: fgCall = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "  bgCall = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 476
    :cond_3
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    .line 477
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 479
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "updateForegroundCall: common case : fgCall "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "  bgCall = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 494
    .restart local v5       #ringingCall:Lcom/android/internal/telephony/Call;
    :cond_4
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v6

    sget-object v7, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    if-ne v6, v7, :cond_5

    .line 495
    const-string v6, "updateForegroundCall: no active call, show holding call"

    invoke-static {v6}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 502
    move-object v1, v0

    .line 505
    const/4 v0, 0x0

    .line 510
    :cond_5
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v6

    sget-object v7, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v6, v7, :cond_6

    .line 511
    invoke-virtual {p0, v1}, Lcom/android/phone/CallCard;->updateElapsedTimeWidget(Lcom/android/internal/telephony/Call;)V

    .line 514
    :cond_6
    invoke-direct {p0, p1, v1}, Lcom/android/phone/CallCard;->displayMainCallStatus(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)V

    .line 516
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v3

    .line 519
    .local v3, phone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v4

    .line 521
    .local v4, phoneType:I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "updateForegroundCall: fgCall phoneType "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 523
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v6

    if-eqz v6, :cond_8

    iget-object v6, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v6}, Lcom/mediatek/phone/DualTalkUtils;->isCdmaAndGsmActive()Z

    move-result v6

    if-eqz v6, :cond_8

    .line 524
    if-ne v4, v8, :cond_7

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v6

    invoke-interface {v6}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v6

    if-ne v6, v8, :cond_7

    .line 526
    invoke-direct {p0, p1, v0}, Lcom/android/phone/CallCard;->displaySecondaryCallStatus(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)V

    .line 527
    iget-object v6, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v6}, Lcom/mediatek/phone/DualTalkUtils;->getSecondActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/phone/CallCard;->displaySecondHoldCallStatus(Lcom/android/internal/telephony/Call;)V

    goto/16 :goto_1

    .line 529
    :cond_7
    invoke-direct {p0, p1, v9}, Lcom/android/phone/CallCard;->displaySecondaryCallStatus(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)V

    .line 530
    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->displaySecondHoldCallStatus(Lcom/android/internal/telephony/Call;)V

    goto/16 :goto_1

    .line 532
    :cond_8
    const/4 v6, 0x2

    if-ne v4, v6, :cond_a

    .line 533
    iget-object v6, p0, Lcom/android/phone/CallCard;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v6, v6, Lcom/android/phone/PhoneGlobals;->cdmaPhoneCallState:Lcom/android/phone/CdmaPhoneCallState;

    invoke-virtual {v6}, Lcom/android/phone/CdmaPhoneCallState;->getCurrentCallState()Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;

    move-result-object v6

    sget-object v7, Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;->THRWAY_ACTIVE:Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;

    if-ne v6, v7, :cond_9

    iget-object v6, p0, Lcom/android/phone/CallCard;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v6, v6, Lcom/android/phone/PhoneGlobals;->cdmaPhoneCallState:Lcom/android/phone/CdmaPhoneCallState;

    invoke-virtual {v6}, Lcom/android/phone/CdmaPhoneCallState;->IsThreeWayCallOrigStateDialing()Z

    move-result v6

    if-eqz v6, :cond_9

    .line 536
    invoke-direct {p0, p1, v1}, Lcom/android/phone/CallCard;->displaySecondaryCallStatus(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)V

    goto/16 :goto_1

    .line 540
    :cond_9
    invoke-direct {p0, p1, v0}, Lcom/android/phone/CallCard;->displaySecondaryCallStatus(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)V

    goto/16 :goto_1

    .line 542
    :cond_a
    if-eq v4, v8, :cond_b

    const/4 v6, 0x3

    if-ne v4, v6, :cond_0

    .line 543
    :cond_b
    invoke-direct {p0, p1}, Lcom/android/phone/CallCard;->isSecondaryCallVisible(Lcom/android/internal/telephony/CallManager;)Z

    move-result v2

    .line 544
    .local v2, isSecondary:Z
    if-eqz v2, :cond_c

    .line 545
    invoke-direct {p0, p1, v0}, Lcom/android/phone/CallCard;->displaySecondaryCallStatus(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)V

    .line 550
    :goto_2
    invoke-direct {p0, p1}, Lcom/android/phone/CallCard;->isSecondHoldCallVisible(Lcom/android/internal/telephony/CallManager;)Z

    move-result v6

    if-eqz v6, :cond_e

    .line 551
    if-eqz v2, :cond_d

    .line 552
    iget-object v6, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v6}, Lcom/mediatek/phone/DualTalkUtils;->getSecondActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/phone/CallCard;->displaySecondHoldCallStatus(Lcom/android/internal/telephony/Call;)V

    goto/16 :goto_1

    .line 547
    :cond_c
    invoke-direct {p0, p1, v9}, Lcom/android/phone/CallCard;->displaySecondaryCallStatus(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)V

    goto :goto_2

    .line 554
    :cond_d
    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->displaySecondHoldCallStatus(Lcom/android/internal/telephony/Call;)V

    goto/16 :goto_1

    .line 557
    :cond_e
    invoke-virtual {p0, v9}, Lcom/android/phone/CallCard;->displaySecondHoldCallStatus(Lcom/android/internal/telephony/Call;)V

    goto/16 :goto_1
.end method

.method private updateNoCall(Lcom/android/internal/telephony/CallManager;)V
    .locals 3
    .parameter "cm"

    .prologue
    const/4 v2, 0x0

    .line 691
    const-string v1, "updateNoCall()..."

    invoke-static {v1}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 694
    iget-object v1, p0, Lcom/android/phone/CallCard;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v1, Lcom/android/phone/InCallUiState;->latestDisconnectCall:Lcom/android/phone/InCallUiState$FakeCall;

    .line 695
    .local v0, fakeCall:Lcom/android/phone/InCallUiState$FakeCall;
    if-eqz v0, :cond_0

    .line 696
    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->displayFakeCallStatus(Lcom/android/phone/InCallUiState$FakeCall;)V

    .line 703
    :goto_0
    return-void

    .line 698
    :cond_0
    invoke-direct {p0, p1, v2}, Lcom/android/phone/CallCard;->displayMainCallStatus(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)V

    .line 699
    invoke-direct {p0, p1, v2}, Lcom/android/phone/CallCard;->displaySecondaryCallStatus(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)V

    .line 700
    invoke-virtual {p0, v2}, Lcom/android/phone/CallCard;->displaySecondHoldCallStatus(Lcom/android/internal/telephony/Call;)V

    goto :goto_0
.end method

.method private updatePhotoForCallState(Lcom/android/internal/telephony/Call;Landroid/widget/ImageView;)V
    .locals 13
    .parameter "call"
    .parameter "view"

    .prologue
    const/4 v12, 0x0

    const/4 v11, 0x1

    const/4 v10, -0x1

    const/4 v9, -0x2

    .line 2016
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "updatePhotoForCallState("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ")..."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2017
    const/4 v4, 0x0

    .line 2021
    .local v4, photoImageResource:I
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v6

    .line 2022
    .local v6, state:Lcom/android/internal/telephony/Call$State;
    sget-object v7, Lcom/android/phone/CallCard$4;->$SwitchMap$com$android$internal$telephony$Call$State:[I

    invoke-virtual {v6}, Lcom/android/internal/telephony/Call$State;->ordinal()I

    move-result v8

    aget v7, v7, v8

    .line 2065
    const/4 v0, 0x0

    .line 2067
    .local v0, ci:Lcom/android/internal/telephony/CallerInfo;
    const/4 v1, 0x0

    .line 2068
    .local v1, conn:Lcom/android/internal/telephony/Connection;
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v7

    invoke-interface {v7}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v3

    .line 2069
    .local v3, phoneType:I
    const/4 v7, 0x2

    if-ne v3, v7, :cond_4

    .line 2070
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v1

    .line 2078
    :goto_0
    if-eqz v1, :cond_0

    .line 2079
    invoke-virtual {v1}, Lcom/android/internal/telephony/Connection;->getUserData()Ljava/lang/Object;

    move-result-object v2

    .line 2080
    .local v2, o:Ljava/lang/Object;
    instance-of v7, v2, Lcom/android/internal/telephony/CallerInfo;

    if-eqz v7, :cond_7

    move-object v0, v2

    .line 2081
    check-cast v0, Lcom/android/internal/telephony/CallerInfo;

    .line 2088
    .end local v2           #o:Ljava/lang/Object;
    :cond_0
    :goto_1
    if-eqz v0, :cond_1

    .line 2089
    iget v4, v0, Lcom/android/internal/telephony/CallerInfo;->photoResource:I

    .line 2100
    :cond_1
    if-nez v4, :cond_9

    .line 2101
    invoke-static {p1}, Lcom/android/phone/PhoneUtils;->isConferenceCall(Lcom/android/internal/telephony/Call;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 2102
    invoke-static {p2, v0}, Lcom/android/phone/CallCard;->showCachedImage(Landroid/widget/ImageView;Lcom/android/internal/telephony/CallerInfo;)Z

    move-result v7

    if-nez v7, :cond_2

    iget-object v7, p0, Lcom/android/phone/CallCard;->mPhotoTracker:Lcom/android/phone/ContactsAsyncHelper$ImageTracker;

    invoke-virtual {v7}, Lcom/android/phone/ContactsAsyncHelper$ImageTracker;->getPhotoState()I

    move-result v7

    if-ne v7, v9, :cond_2

    .line 2104
    iget-object v7, p0, Lcom/android/phone/CallCard;->mPhotoTracker:Lcom/android/phone/ContactsAsyncHelper$ImageTracker;

    invoke-virtual {v7}, Lcom/android/phone/ContactsAsyncHelper$ImageTracker;->getPhotoUri()Landroid/net/Uri;

    move-result-object v5

    .line 2105
    .local v5, photoUri:Landroid/net/Uri;
    if-nez v5, :cond_8

    .line 2106
    const-string v7, "CallCard"

    const-string v8, "photoUri became null. Show default avatar icon"

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2107
    const v7, 0x7f02009c

    invoke-static {p2, v7}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    .line 2119
    :goto_2
    iget-object v7, p0, Lcom/android/phone/CallCard;->mPhotoTracker:Lcom/android/phone/ContactsAsyncHelper$ImageTracker;

    invoke-virtual {v7, v10}, Lcom/android/phone/ContactsAsyncHelper$ImageTracker;->setPhotoState(I)V

    .line 2131
    .end local v5           #photoUri:Landroid/net/Uri;
    :cond_2
    if-eqz v4, :cond_3

    .line 2132
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "- overrriding photo image: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2133
    invoke-static {p2, v4}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    .line 2135
    iget-object v7, p0, Lcom/android/phone/CallCard;->mPhotoTracker:Lcom/android/phone/ContactsAsyncHelper$ImageTracker;

    invoke-virtual {v7, v9}, Lcom/android/phone/ContactsAsyncHelper$ImageTracker;->setPhotoState(I)V

    .line 2137
    :cond_3
    :goto_3
    return-void

    .line 2071
    :cond_4
    if-eq v3, v11, :cond_5

    const/4 v7, 0x3

    if-ne v3, v7, :cond_6

    .line 2073
    :cond_5
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getEarliestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v1

    goto :goto_0

    .line 2075
    :cond_6
    new-instance v7, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unexpected phone type: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 2082
    .restart local v2       #o:Ljava/lang/Object;
    :cond_7
    instance-of v7, v2, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    if-eqz v7, :cond_0

    .line 2083
    check-cast v2, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    .end local v2           #o:Ljava/lang/Object;
    iget-object v0, v2, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    goto :goto_1

    .line 2110
    .restart local v5       #photoUri:Landroid/net/Uri;
    :cond_8
    const-string v7, "start asynchronous load inside updatePhotoForCallState()"

    invoke-static {v7}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2112
    invoke-virtual {p2, v12}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 2114
    const/4 v7, 0x4

    invoke-virtual {p2, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2115
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v7

    new-instance v8, Lcom/android/phone/CallCard$AsyncLoadCookie;

    invoke-direct {v8, p2, v0, v12}, Lcom/android/phone/CallCard$AsyncLoadCookie;-><init>(Landroid/widget/ImageView;Lcom/android/internal/telephony/CallerInfo;Lcom/android/internal/telephony/Call;)V

    invoke-static {v11, v7, v5, p0, v8}, Lcom/android/phone/ContactsAsyncHelper;->startObtainPhotoAsync(ILandroid/content/Context;Landroid/net/Uri;Lcom/android/phone/ContactsAsyncHelper$OnImageLoadCompleteListener;Ljava/lang/Object;)V

    goto :goto_2

    .line 2124
    .end local v5           #photoUri:Landroid/net/Uri;
    :cond_9
    invoke-static {p2, v4}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    .line 2125
    iget-object v7, p0, Lcom/android/phone/CallCard;->mPhotoTracker:Lcom/android/phone/ContactsAsyncHelper$ImageTracker;

    invoke-virtual {v7, v10}, Lcom/android/phone/ContactsAsyncHelper$ImageTracker;->setPhotoState(I)V

    goto :goto_3
.end method

.method private updateRingingCall(Lcom/android/internal/telephony/CallManager;)V
    .locals 3
    .parameter "cm"

    .prologue
    const/4 v2, 0x0

    .line 618
    const-string v1, "updateRingingCall()..."

    invoke-static {v1}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 621
    const/4 v0, 0x0

    .line 623
    .local v0, ringingCall:Lcom/android/internal/telephony/Call;
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v1}, Lcom/mediatek/phone/DualTalkUtils;->hasMultipleRingingCall()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 624
    iget-object v1, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v1}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 630
    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/android/phone/CallCard;->displayMainCallStatus(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)V

    .line 633
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 634
    iget-object v1, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v1}, Lcom/mediatek/phone/DualTalkUtils;->hasMultipleRingingCall()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 635
    iget-object v1, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v1}, Lcom/mediatek/phone/DualTalkUtils;->getSecondActiveRingCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/phone/CallCard;->displaySecondIncomingCallStatus(Lcom/android/internal/telephony/Call;)V

    .line 646
    :cond_0
    :goto_1
    invoke-direct {p0, p1, v2}, Lcom/android/phone/CallCard;->displaySecondaryCallStatus(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)V

    .line 647
    invoke-virtual {p0, v2}, Lcom/android/phone/CallCard;->displaySecondHoldCallStatus(Lcom/android/internal/telephony/Call;)V

    .line 648
    return-void

    .line 626
    :cond_1
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    goto :goto_0

    .line 637
    :cond_2
    invoke-virtual {p0, v2}, Lcom/android/phone/CallCard;->displaySecondIncomingCallStatus(Lcom/android/internal/telephony/Call;)V

    goto :goto_1
.end method

.method private updateSimInfo(Lcom/android/internal/telephony/Call;)V
    .locals 9
    .parameter "call"

    .prologue
    const/4 v8, -0x1

    .line 2410
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 2411
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v7

    iget-object v5, v7, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    check-cast v5, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 2412
    .local v5, phone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    invoke-static {v5}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlotNotIdle(Lcom/android/internal/telephony/Phone;)I

    move-result v6

    .line 2414
    .local v6, slot:I
    if-ne v6, v8, :cond_4

    .line 2415
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v1

    .line 2416
    .local v1, geminiSlots:[I
    move-object v0, v1

    .local v0, arr$:[I
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_0

    aget v2, v0, v3

    .line 2417
    .local v2, gs:I
    invoke-virtual {v5, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getPendingMmiCodesGemini(I)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-eqz v7, :cond_3

    .line 2418
    move v6, v2

    .line 2422
    .end local v2           #gs:I
    :cond_0
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    .line 2424
    if-ne v6, v8, :cond_1

    if-eqz p1, :cond_1

    .line 2425
    invoke-static {p1}, Lcom/android/phone/PhoneUtils;->getSimInfoByCall(Lcom/android/internal/telephony/Call;)Landroid/provider/Telephony$SIMInfo;

    move-result-object v7

    iput-object v7, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    .line 2429
    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "updateSimIndicator, running mmi, slot = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2448
    .end local v0           #arr$:[I
    .end local v1           #geminiSlots:[I
    .end local v3           #i$:I
    .end local v4           #len$:I
    .end local v5           #phone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    .end local v6           #slot:I
    :cond_2
    :goto_1
    return-void

    .line 2416
    .restart local v0       #arr$:[I
    .restart local v1       #geminiSlots:[I
    .restart local v2       #gs:I
    .restart local v3       #i$:I
    .restart local v4       #len$:I
    .restart local v5       #phone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    .restart local v6       #slot:I
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2432
    .end local v0           #arr$:[I
    .end local v1           #geminiSlots:[I
    .end local v2           #gs:I
    .end local v3           #i$:I
    .end local v4           #len$:I
    :cond_4
    invoke-static {}, Lcom/mediatek/phone/SIMInfoWrapper;->getDefault()Lcom/mediatek/phone/SIMInfoWrapper;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/mediatek/phone/SIMInfoWrapper;->getSimInfoBySlot(I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v7

    iput-object v7, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    .line 2433
    iget-object v7, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    if-eqz v7, :cond_2

    .line 2435
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "updateSimIndicator slot = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " mSimInfo :"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2436
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "displayName = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v8, v8, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2437
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "color       = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    iget v8, v8, Landroid/provider/Telephony$SIMInfo;->mColor:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2439
    iget-object v7, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v7, v7, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    if-nez v7, :cond_2

    .line 2440
    iget-object v7, p0, Lcom/android/phone/CallCard;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-static {v7, v6}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v7

    iput-object v7, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    .line 2442
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "displayName = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v8, v8, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto/16 :goto_1
.end method


# virtual methods
.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 3
    .parameter "event"

    .prologue
    const/4 v2, 0x1

    .line 2283
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0

    const/16 v1, 0x20

    if-ne v0, v1, :cond_1

    .line 2284
    iget-object v0, p0, Lcom/android/phone/CallCard;->mName:Landroid/widget/TextView;

    invoke-direct {p0, p1, v0}, Lcom/android/phone/CallCard;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;Landroid/view/View;)V

    .line 2285
    iget-object v0, p0, Lcom/android/phone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    invoke-direct {p0, p1, v0}, Lcom/android/phone/CallCard;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;Landroid/view/View;)V

    .line 2301
    :cond_0
    :goto_0
    return v2

    .line 2289
    :cond_1
    iget-object v0, p0, Lcom/android/phone/CallCard;->mCallStateLabel:Landroid/widget/TextView;

    invoke-direct {p0, p1, v0}, Lcom/android/phone/CallCard;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;Landroid/view/View;)V

    .line 2290
    iget-object v0, p0, Lcom/android/phone/CallCard;->mPhoto:Landroid/widget/ImageView;

    invoke-direct {p0, p1, v0}, Lcom/android/phone/CallCard;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;Landroid/view/View;)V

    .line 2291
    iget-object v0, p0, Lcom/android/phone/CallCard;->mName:Landroid/widget/TextView;

    invoke-direct {p0, p1, v0}, Lcom/android/phone/CallCard;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;Landroid/view/View;)V

    .line 2292
    iget-object v0, p0, Lcom/android/phone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    invoke-direct {p0, p1, v0}, Lcom/android/phone/CallCard;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;Landroid/view/View;)V

    .line 2293
    iget-object v0, p0, Lcom/android/phone/CallCard;->mLabel:Landroid/widget/TextView;

    invoke-direct {p0, p1, v0}, Lcom/android/phone/CallCard;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;Landroid/view/View;)V

    .line 2295
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallName:Landroid/widget/TextView;

    if-eqz v0, :cond_2

    .line 2296
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallName:Landroid/widget/TextView;

    invoke-direct {p0, p1, v0}, Lcom/android/phone/CallCard;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;Landroid/view/View;)V

    .line 2298
    :cond_2
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallPhoto:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 2299
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallPhoto:Landroid/widget/ImageView;

    invoke-direct {p0, p1, v0}, Lcom/android/phone/CallCard;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;Landroid/view/View;)V

    goto :goto_0
.end method

.method displayFakeCallStatus(Lcom/android/phone/InCallUiState$FakeCall;)V
    .locals 8
    .parameter "call"

    .prologue
    const/16 v7, 0x8

    const/4 v6, 0x3

    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 2771
    if-nez p1, :cond_0

    .line 2773
    iget-object v2, p0, Lcom/android/phone/CallCard;->mPrimaryCallInfo:Landroid/view/ViewGroup;

    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 2840
    :goto_0
    return-void

    .line 2778
    :cond_0
    const-string v2, "displayFakeCallStatus..."

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 2781
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p1, Lcom/android/phone/InCallUiState$FakeCall;->conn:Lcom/android/internal/telephony/Connection;

    invoke-static {v2, v3, p0, p1}, Lcom/android/phone/PhoneUtils;->startGetCallerInfo(Landroid/content/Context;Lcom/android/internal/telephony/Connection;Lcom/android/internal/telephony/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;)Lcom/android/phone/PhoneUtils$CallerInfoToken;

    move-result-object v0

    .line 2784
    .local v0, info:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    iget-object v2, p0, Lcom/android/phone/CallCard;->mPrimaryCallInfo:Landroid/view/ViewGroup;

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 2787
    iget-object v2, p0, Lcom/android/phone/CallCard;->mCallStateLabel:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2788
    iget-object v2, p0, Lcom/android/phone/CallCard;->mCallStateLabel:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/android/phone/InCallUiState$FakeCall;->cause:Lcom/android/internal/telephony/Connection$DisconnectCause;

    invoke-direct {p0, v3}, Lcom/android/phone/CallCard;->getCallFailedString(Lcom/android/internal/telephony/Connection$DisconnectCause;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2790
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 2791
    invoke-static {}, Lcom/mediatek/phone/SIMInfoWrapper;->getDefault()Lcom/mediatek/phone/SIMInfoWrapper;

    move-result-object v2

    iget v3, p1, Lcom/android/phone/InCallUiState$FakeCall;->slotId:I

    invoke-virtual {v2, v3}, Lcom/mediatek/phone/SIMInfoWrapper;->getSimInfoBySlot(I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v2

    iput-object v2, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    .line 2796
    :goto_1
    iget-object v2, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    if-eqz v2, :cond_1

    .line 2797
    iget-object v2, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v3, v3, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2798
    iget-object v2, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2801
    :cond_1
    iget-object v2, p0, Lcom/android/phone/CallCard;->mPrimaryCallBanner:Landroid/view/ViewGroup;

    invoke-direct {p0, p1, v2}, Lcom/android/phone/CallCard;->updateCallBannerBackground(Lcom/android/phone/InCallUiState$FakeCall;Landroid/view/ViewGroup;)V

    .line 2803
    iget v2, p1, Lcom/android/phone/InCallUiState$FakeCall;->phoneType:I

    if-ne v2, v6, :cond_5

    .line 2805
    iget-object v2, p0, Lcom/android/phone/CallCard;->mOperatorName:Landroid/widget/TextView;

    const v3, 0x7f0d02e1

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 2814
    :goto_2
    iget-object v2, p0, Lcom/android/phone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getVisibility()I

    move-result v2

    if-nez v2, :cond_2

    .line 2815
    iget-object v2, p0, Lcom/android/phone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2817
    :cond_2
    iget-object v2, p0, Lcom/android/phone/CallCard;->mLabel:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getVisibility()I

    move-result v2

    if-nez v2, :cond_3

    .line 2818
    iget-object v2, p0, Lcom/android/phone/CallCard;->mLabel:Landroid/widget/TextView;

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2821
    :cond_3
    iget-object v2, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v2, v2, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6

    iget v2, p1, Lcom/android/phone/InCallUiState$FakeCall;->phoneType:I

    if-eq v2, v6, :cond_6

    .line 2823
    iget-object v2, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v3, v3, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2824
    iget-object v2, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2828
    :goto_3
    if-eqz v0, :cond_8

    iget-boolean v2, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;->isFinal:Z

    if-eqz v2, :cond_8

    .line 2829
    iget-object v2, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    if-eqz v2, :cond_7

    iget-object v2, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    iget-object v2, v2, Lcom/android/internal/telephony/CallerInfo;->name:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 2830
    iget-object v2, p0, Lcom/android/phone/CallCard;->mName:Landroid/widget/TextView;

    iget-object v3, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    iget-object v3, v3, Lcom/android/internal/telephony/CallerInfo;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2837
    :goto_4
    iget-object v2, p0, Lcom/android/phone/CallCard;->mPhoto:Landroid/widget/ImageView;

    const v3, 0x7f02009c

    invoke-static {v2, v3}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    .line 2838
    iget-object v2, p0, Lcom/android/phone/CallCard;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v2, v2, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-direct {p0, v2, v5}, Lcom/android/phone/CallCard;->displaySecondaryCallStatus(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)V

    .line 2839
    invoke-virtual {p0, v5}, Lcom/android/phone/CallCard;->displaySecondHoldCallStatus(Lcom/android/internal/telephony/Call;)V

    goto/16 :goto_0

    .line 2793
    :cond_4
    iput-object v5, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    goto/16 :goto_1

    .line 2808
    :cond_5
    iget v2, p1, Lcom/android/phone/InCallUiState$FakeCall;->slotId:I

    invoke-static {v2}, Lcom/mediatek/phone/gemini/GeminiUtils;->getOperatorName(I)Ljava/lang/String;

    move-result-object v1

    .line 2809
    .local v1, operatorName:Ljava/lang/String;
    iget-object v2, p0, Lcom/android/phone/CallCard;->mOperatorName:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2810
    iget-object v2, p0, Lcom/android/phone/CallCard;->mOperatorName:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_2

    .line 2826
    .end local v1           #operatorName:Ljava/lang/String;
    :cond_6
    iget-object v2, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_3

    .line 2832
    :cond_7
    iget-object v2, p0, Lcom/android/phone/CallCard;->mName:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/android/phone/InCallUiState$FakeCall;->number:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_4

    .line 2835
    :cond_8
    iget-object v2, p0, Lcom/android/phone/CallCard;->mName:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/android/phone/InCallUiState$FakeCall;->number:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_4
.end method

.method displaySecondHoldCallStatus(Lcom/android/internal/telephony/Call;)V
    .locals 19
    .parameter "call"

    .prologue
    .line 3380
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "displaySecondHoldCallStatus(call ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")..."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3383
    if-nez p1, :cond_5

    .line 3384
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->m2ndHoldName:Landroid/widget/TextView;

    if-eqz v2, :cond_0

    .line 3385
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->m2ndHoldName:Landroid/widget/TextView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3387
    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->m2ndHoldState:Landroid/widget/TextView;

    if-eqz v2, :cond_1

    .line 3388
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->m2ndHoldState:Landroid/widget/TextView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3390
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mPhotoHoldPre:Landroid/widget/ImageView;

    if-eqz v2, :cond_2

    .line 3391
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mPhotoHoldPre:Landroid/widget/ImageView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3393
    :cond_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mDualTalkSecondaryCallInfo:Landroid/view/ViewStub;

    if-eqz v2, :cond_3

    .line 3394
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mDualTalkSecondaryCallInfo:Landroid/view/ViewStub;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/ViewStub;->setVisibility(I)V

    .line 3396
    :cond_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mDualTalkSecondaryCallPhotoDimEffect:Landroid/view/View;

    if-eqz v2, :cond_4

    .line 3397
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mDualTalkSecondaryCallPhotoDimEffect:Landroid/view/View;

    const/16 v3, 0x8

    invoke-static {v2, v3}, Lcom/android/phone/AnimationUtils$Fade;->hide(Landroid/view/View;I)V

    .line 3528
    :cond_4
    :goto_0
    return-void

    .line 3401
    :cond_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mDualTalkSecondaryCallInfo:Landroid/view/ViewStub;

    if-nez v2, :cond_7

    .line 3402
    const v2, 0x7f0800f1

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewStub;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/phone/CallCard;->mDualTalkSecondaryCallInfo:Landroid/view/ViewStub;

    .line 3403
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mDualTalkSecondaryCallInfo:Landroid/view/ViewStub;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/ViewStub;->setVisibility(I)V

    .line 3404
    const v2, 0x7f080050

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/phone/CallCard;->mPhotoHoldPre:Landroid/widget/ImageView;

    .line 3405
    const v2, 0x7f08004f

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/phone/CallCard;->m2ndHoldName:Landroid/widget/TextView;

    .line 3406
    const v2, 0x7f080054

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/phone/CallCard;->m2ndHoldState:Landroid/widget/TextView;

    .line 3407
    const v2, 0x7f080052

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/phone/CallCard;->mSecondHoldCallBanner:Landroid/view/ViewGroup;

    .line 3408
    const v2, 0x7f080051

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/phone/CallCard;->mDualTalkSecondaryCallPhotoDimEffect:Landroid/view/View;

    .line 3409
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mDualTalkSecondaryCallPhotoDimEffect:Landroid/view/View;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 3410
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mDualTalkSecondaryCallPhotoDimEffect:Landroid/view/View;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/View;->setClickable(Z)V

    .line 3411
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mDualTalkSecondaryCallPhotoDimEffect:Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->callCardListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 3414
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mDualTalkSecondaryCallPhotoDimEffect:Landroid/view/View;

    new-instance v3, Lcom/android/phone/SmallerHitTargetTouchListener;

    invoke-direct {v3}, Lcom/android/phone/SmallerHitTargetTouchListener;-><init>()V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 3419
    :goto_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->m2ndHoldName:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3420
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->m2ndHoldState:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3421
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mPhotoHoldPre:Landroid/widget/ImageView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3422
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mDualTalkSecondaryCallPhotoDimEffect:Landroid/view/View;

    invoke-static {v2}, Lcom/android/phone/AnimationUtils$Fade;->show(Landroid/view/View;)V

    .line 3426
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "displaySecondHoldCallStatus ==> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3429
    invoke-static/range {p1 .. p1}, Lcom/android/phone/PhoneUtils;->getSimInfoByCall(Lcom/android/internal/telephony/Call;)Landroid/provider/Telephony$SIMInfo;

    move-result-object v14

    .line 3430
    .local v14, info:Landroid/provider/Telephony$SIMInfo;
    if-eqz v14, :cond_8

    iget v2, v14, Landroid/provider/Telephony$SIMInfo;->mColor:I

    if-ltz v2, :cond_8

    iget v2, v14, Landroid/provider/Telephony$SIMInfo;->mColor:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mSimColorMap:[I

    array-length v3, v3

    if-ge v2, v3, :cond_8

    .line 3432
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondHoldCallBanner:Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mSimColorMap:[I

    iget v5, v14, Landroid/provider/Telephony$SIMInfo;->mColor:I

    aget v3, v3, v5

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 3437
    :cond_6
    :goto_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondHoldCallBanner:Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/phone/CallCard;->mCallBannerSidePadding:I

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/phone/CallCard;->mCallBannerSidePadding:I

    const/4 v8, 0x0

    invoke-virtual {v2, v3, v5, v6, v8}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 3439
    const/16 v17, 0x0

    .line 3440
    .local v17, showSecondaryCallInfo:Z
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v18

    .line 3441
    .local v18, state:Lcom/android/internal/telephony/Call$State;
    sget-object v2, Lcom/android/phone/CallCard$4;->$SwitchMap$com$android$internal$telephony$Call$State:[I

    invoke-virtual/range {v18 .. v18}, Lcom/android/internal/telephony/Call$State;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 3525
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mDualTalkSecondaryCallInfo:Landroid/view/ViewStub;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/ViewStub;->setVisibility(I)V

    goto/16 :goto_0

    .line 3417
    .end local v14           #info:Landroid/provider/Telephony$SIMInfo;
    .end local v17           #showSecondaryCallInfo:Z
    .end local v18           #state:Lcom/android/internal/telephony/Call$State;
    :cond_7
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mDualTalkSecondaryCallInfo:Landroid/view/ViewStub;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/ViewStub;->setVisibility(I)V

    goto/16 :goto_1

    .line 3433
    .restart local v14       #info:Landroid/provider/Telephony$SIMInfo;
    :cond_8
    if-nez v14, :cond_6

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_6

    .line 3435
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondHoldCallBanner:Landroid/view/ViewGroup;

    const v3, 0x7f020092

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    goto :goto_2

    .line 3444
    .restart local v17       #showSecondaryCallInfo:Z
    .restart local v18       #state:Lcom/android/internal/telephony/Call$State;
    :pswitch_0
    const-string v2, "displaySecondHoldCallStatus : meet cdma case!"

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3457
    :pswitch_1
    invoke-static/range {p1 .. p1}, Lcom/android/phone/PhoneUtils;->isConferenceCall(Lcom/android/internal/telephony/Call;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 3459
    const-string v2, "==> conference call."

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3461
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->m2ndHoldName:Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f0d0190

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3462
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_9

    .line 3463
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mPhotoHoldPre:Landroid/widget/ImageView;

    const v3, 0x7f020099

    invoke-static {v2, v3}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    .line 3517
    :goto_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->m2ndHoldState:Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f0d02bf

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 3465
    :cond_9
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mPhotoHoldPre:Landroid/widget/ImageView;

    const v3, 0x7f020098

    invoke-static {v2, v3}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    goto :goto_3

    .line 3468
    :cond_a
    const/4 v15, 0x0

    .line 3469
    .local v15, infoToken:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    sget-boolean v2, Lcom/android/phone/CallCard;->sLCforUserDataSecondHoldCall:Z

    if-eqz v2, :cond_b

    .line 3471
    const-string v2, "- displaySecondHoldCallStatus: the language changed to clear userdata"

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3473
    new-instance v13, Lcom/android/phone/CallCard$CallInfoCookie;

    const/4 v2, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v13, v0, v1, v2}, Lcom/android/phone/CallCard$CallInfoCookie;-><init>(Lcom/android/phone/CallCard;Lcom/android/internal/telephony/Call;I)V

    .line 3474
    .local v13, callInfoCookie:Lcom/android/phone/CallCard$CallInfoCookie;
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-static {v2, v0, v1, v13, v3}, Lcom/android/phone/PhoneUtils;->startGetCallerInfo(Landroid/content/Context;Lcom/android/internal/telephony/Call;Lcom/android/internal/telephony/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;Z)Lcom/android/phone/PhoneUtils$CallerInfoToken;

    move-result-object v15

    .line 3475
    const/4 v2, 0x0

    sput-boolean v2, Lcom/android/phone/CallCard;->sLCforUserDataSecondHoldCall:Z

    .line 3484
    .end local v13           #callInfoCookie:Lcom/android/phone/CallCard$CallInfoCookie;
    :goto_4
    const-string v2, "==> NOT a conf call; call startGetCallerInfo..."

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3487
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->m2ndHoldName:Landroid/widget/TextView;

    iget-object v3, v15, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/android/phone/PhoneUtils;->getCompactNameFromCallerInfo(Lcom/android/internal/telephony/CallerInfo;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3497
    iget-boolean v2, v15, Lcom/android/phone/PhoneUtils$CallerInfoToken;->isFinal:Z

    if-eqz v2, :cond_f

    .line 3498
    const/4 v7, 0x0

    .line 3499
    .local v7, conn:Lcom/android/internal/telephony/Connection;
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v16

    .line 3500
    .local v16, phoneType:I
    const/4 v2, 0x2

    move/from16 v0, v16

    if-ne v0, v2, :cond_c

    .line 3501
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v7

    .line 3509
    :goto_5
    invoke-virtual {v7}, Lcom/android/internal/telephony/Connection;->getNumberPresentation()I

    move-result v4

    .line 3510
    .local v4, presentation:I
    iget-object v3, v15, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/phone/CallCard;->mPhotoHoldPre:Landroid/widget/ImageView;

    move-object/from16 v2, p0

    move-object/from16 v6, p1

    invoke-direct/range {v2 .. v12}, Lcom/android/phone/CallCard;->updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;Landroid/widget/TextView;ZLandroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/ImageView;)V

    goto/16 :goto_3

    .line 3477
    .end local v4           #presentation:I
    .end local v7           #conn:Lcom/android/internal/telephony/Connection;
    .end local v16           #phoneType:I
    :cond_b
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->m2ndHoldName:Landroid/widget/TextView;

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-static {v2, v0, v1, v3}, Lcom/android/phone/PhoneUtils;->startGetCallerInfo(Landroid/content/Context;Lcom/android/internal/telephony/Call;Lcom/android/internal/telephony/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;)Lcom/android/phone/PhoneUtils$CallerInfoToken;

    move-result-object v15

    goto :goto_4

    .line 3502
    .restart local v7       #conn:Lcom/android/internal/telephony/Connection;
    .restart local v16       #phoneType:I
    :cond_c
    const/4 v2, 0x1

    move/from16 v0, v16

    if-eq v0, v2, :cond_d

    const/4 v2, 0x3

    move/from16 v0, v16

    if-ne v0, v2, :cond_e

    .line 3504
    :cond_d
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/Call;->getEarliestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v7

    goto :goto_5

    .line 3506
    :cond_e
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unexpected phone type: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 3514
    .end local v7           #conn:Lcom/android/internal/telephony/Connection;
    .end local v16           #phoneType:I
    :cond_f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mPhotoHoldPre:Landroid/widget/ImageView;

    const v3, 0x7f02009c

    invoke-static {v2, v3}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    goto/16 :goto_3

    .line 3441
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method displaySecondIncomingCallStatus(Lcom/android/internal/telephony/Call;)V
    .locals 28
    .parameter "call"

    .prologue
    .line 3028
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "displaySecondIncomingCallStatus(call ="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ")..."

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3030
    if-nez p1, :cond_6

    .line 3031
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->m2ndIncomingName:Landroid/widget/TextView;

    if-eqz v3, :cond_0

    .line 3032
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->m2ndIncomingName:Landroid/widget/TextView;

    const/16 v5, 0x8

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3034
    :cond_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->m2ndIncomingState:Landroid/widget/TextView;

    if-eqz v3, :cond_1

    .line 3035
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->m2ndIncomingState:Landroid/widget/TextView;

    const/16 v5, 0x8

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3037
    :cond_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mPhotoIncomingPre:Landroid/widget/ImageView;

    if-eqz v3, :cond_2

    .line 3038
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mPhotoIncomingPre:Landroid/widget/ImageView;

    const/16 v5, 0x8

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3040
    :cond_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mIncomingCall2PhotoDimEffect:Landroid/view/View;

    if-eqz v3, :cond_3

    .line 3041
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mIncomingCall2PhotoDimEffect:Landroid/view/View;

    const/16 v5, 0x8

    invoke-static {v3, v5}, Lcom/android/phone/AnimationUtils$Fade;->hide(Landroid/view/View;I)V

    .line 3043
    :cond_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mSecondIncomingCallBanner:Landroid/view/ViewGroup;

    if-eqz v3, :cond_4

    .line 3044
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mSecondIncomingCallBanner:Landroid/view/ViewGroup;

    const/16 v5, 0x8

    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 3046
    :cond_4
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mIncomingCall2Info:Landroid/view/ViewGroup;

    if-eqz v3, :cond_5

    .line 3047
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mIncomingCall2Info:Landroid/view/ViewGroup;

    const/16 v5, 0x8

    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 3048
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/android/phone/CallCard;->mNeedShowIncomingCall2Animator:Z

    .line 3244
    :cond_5
    :goto_0
    return-void

    .line 3054
    :cond_6
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "displaySecondIncomingCallStatus ==> "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3057
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mIncomingCall2Info:Landroid/view/ViewGroup;

    if-eqz v3, :cond_7

    const/16 v3, 0x8

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/phone/CallCard;->mIncomingCall2Info:Landroid/view/ViewGroup;

    invoke-virtual {v5}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v5

    if-ne v3, v5, :cond_7

    .line 3058
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/android/phone/CallCard;->mNeedShowIncomingCall2Animator:Z

    .line 3060
    :cond_7
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/phone/CallCard;->mNeedShowIncomingCall2Animator:Z

    if-eqz v3, :cond_8

    .line 3061
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/CallCard;->displaySecondaryIncomingAnimator()V

    .line 3064
    :cond_8
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mIncomingCall2Info:Landroid/view/ViewGroup;

    if-eqz v3, :cond_9

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mIncomingCall2PhotoDimEffect:Landroid/view/View;

    if-eqz v3, :cond_9

    .line 3065
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mIncomingCall2Info:Landroid/view/ViewGroup;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 3066
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mIncomingCall2PhotoDimEffect:Landroid/view/View;

    invoke-static {v3}, Lcom/android/phone/AnimationUtils$Fade;->show(Landroid/view/View;)V

    .line 3069
    :cond_9
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mPhotoIncomingPre:Landroid/widget/ImageView;

    if-eqz v3, :cond_a

    .line 3070
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mPhotoIncomingPre:Landroid/widget/ImageView;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3073
    :cond_a
    invoke-static/range {p1 .. p1}, Lcom/android/phone/PhoneUtils;->isConferenceCall(Lcom/android/internal/telephony/Call;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 3075
    invoke-direct/range {p0 .. p1}, Lcom/android/phone/CallCard;->updateDisplayForConference(Lcom/android/internal/telephony/Call;)V

    .line 3215
    :goto_1
    invoke-static/range {p1 .. p1}, Lcom/android/phone/PhoneUtils;->getSimInfoByCall(Lcom/android/internal/telephony/Call;)Landroid/provider/Telephony$SIMInfo;

    move-result-object v4

    .line 3216
    .local v4, info:Landroid/provider/Telephony$SIMInfo;
    if-eqz v4, :cond_1c

    iget v3, v4, Landroid/provider/Telephony$SIMInfo;->mColor:I

    if-ltz v3, :cond_1c

    iget v3, v4, Landroid/provider/Telephony$SIMInfo;->mColor:I

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/phone/CallCard;->mSimColorMap:[I

    array-length v5, v5

    if-ge v3, v5, :cond_1c

    .line 3219
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mSecondIncomingCallBanner:Landroid/view/ViewGroup;

    if-eqz v3, :cond_b

    .line 3220
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mSecondIncomingCallBanner:Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/phone/CallCard;->mSimColorMap:[I

    iget v6, v4, Landroid/provider/Telephony$SIMInfo;->mColor:I

    aget v5, v5, v6

    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 3230
    :cond_b
    :goto_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mSecondIncomingCallBanner:Landroid/view/ViewGroup;

    if-eqz v3, :cond_c

    .line 3231
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mSecondIncomingCallBanner:Landroid/view/ViewGroup;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 3234
    :cond_c
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->m2ndIncomingName:Landroid/widget/TextView;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3235
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->m2ndIncomingState:Landroid/widget/TextView;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3237
    const-string v21, ""

    .line 3238
    .local v21, callState:Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lcom/mediatek/phone/vt/VTCallUtils;->isVideoCall(Lcom/android/internal/telephony/Call;)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 3239
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f0d0148

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v21

    .line 3243
    :goto_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->m2ndIncomingState:Landroid/widget/TextView;

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 3079
    .end local v4           #info:Landroid/provider/Telephony$SIMInfo;
    .end local v21           #callState:Ljava/lang/String;
    :cond_d
    const/4 v8, 0x0

    .line 3080
    .local v8, conn:Lcom/android/internal/telephony/Connection;
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v24

    .line 3081
    .local v24, phoneType:I
    const/4 v3, 0x2

    move/from16 v0, v24

    if-ne v0, v3, :cond_e

    .line 3082
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v8

    .line 3090
    :goto_4
    if-nez v8, :cond_11

    .line 3092
    const-string v3, "displaySecondIncomingCallStatus: connection is null, using default values."

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3098
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v3

    const/4 v5, 0x0

    invoke-static {v3, v5}, Lcom/android/phone/PhoneUtils;->getCallerInfo(Landroid/content/Context;Lcom/android/internal/telephony/Connection;)Lcom/android/internal/telephony/CallerInfo;

    move-result-object v4

    .line 3099
    .local v4, info:Lcom/android/internal/telephony/CallerInfo;
    sget v5, Lcom/android/internal/telephony/PhoneConstants;->PRESENTATION_ALLOWED:I

    const/4 v6, 0x0

    move-object/from16 v3, p0

    move-object/from16 v7, p1

    invoke-direct/range {v3 .. v8}, Lcom/android/phone/CallCard;->updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;)V

    goto/16 :goto_1

    .line 3083
    .end local v4           #info:Lcom/android/internal/telephony/CallerInfo;
    :cond_e
    const/4 v3, 0x1

    move/from16 v0, v24

    if-eq v0, v3, :cond_f

    const/4 v3, 0x3

    move/from16 v0, v24

    if-ne v0, v3, :cond_10

    .line 3085
    :cond_f
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/Call;->getEarliestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v8

    goto :goto_4

    .line 3087
    :cond_10
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected phone type: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 3102
    :cond_11
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "  - CONN: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ", state = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v8}, Lcom/android/internal/telephony/Connection;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3104
    invoke-virtual {v8}, Lcom/android/internal/telephony/Connection;->getNumberPresentation()I

    move-result v11

    .line 3108
    .local v11, presentation:I
    const/16 v25, 0x1

    .line 3109
    .local v25, runQuery:Z
    invoke-virtual {v8}, Lcom/android/internal/telephony/Connection;->getUserData()Ljava/lang/Object;

    move-result-object v22

    .line 3110
    .local v22, o:Ljava/lang/Object;
    move-object/from16 v0, v22

    instance-of v3, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    if-eqz v3, :cond_16

    .line 3111
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/phone/CallCard;->mPhotoTracker:Lcom/android/phone/ContactsAsyncHelper$ImageTracker;

    move-object/from16 v3, v22

    check-cast v3, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    iget-object v3, v3, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    invoke-virtual {v5, v3}, Lcom/android/phone/ContactsAsyncHelper$ImageTracker;->isDifferentImageRequest(Lcom/android/internal/telephony/CallerInfo;)Z

    move-result v25

    .line 3119
    :goto_5
    const/4 v3, 0x2

    move/from16 v0, v24

    if-ne v0, v3, :cond_14

    .line 3120
    invoke-virtual {v8}, Lcom/android/internal/telephony/Connection;->getUserData()Ljava/lang/Object;

    move-result-object v23

    .line 3121
    .local v23, obj:Ljava/lang/Object;
    invoke-virtual {v8}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v27

    .line 3122
    .local v27, updatedNumber:Ljava/lang/String;
    invoke-virtual {v8}, Lcom/android/internal/telephony/Connection;->getCnapName()Ljava/lang/String;

    move-result-object v26

    .line 3123
    .local v26, updatedCnapName:Ljava/lang/String;
    const/4 v4, 0x0

    .line 3124
    .restart local v4       #info:Lcom/android/internal/telephony/CallerInfo;
    move-object/from16 v0, v23

    instance-of v3, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    if-eqz v3, :cond_17

    move-object/from16 v3, v22

    .line 3125
    check-cast v3, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    iget-object v4, v3, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    .line 3130
    :cond_12
    :goto_6
    if-eqz v4, :cond_14

    .line 3131
    if-eqz v27, :cond_13

    iget-object v3, v4, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13

    .line 3133
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "- displayMainCallStatus: updatedNumber = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v27

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3135
    const/16 v25, 0x1

    .line 3137
    :cond_13
    if-eqz v26, :cond_14

    iget-object v3, v4, Lcom/android/internal/telephony/CallerInfo;->cnapName:Ljava/lang/String;

    move-object/from16 v0, v26

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_14

    .line 3139
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "- displayMainCallStatus: updatedCnapName = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v26

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3142
    const/16 v25, 0x1

    .line 3147
    .end local v4           #info:Lcom/android/internal/telephony/CallerInfo;
    .end local v23           #obj:Ljava/lang/Object;
    .end local v26           #updatedCnapName:Ljava/lang/String;
    .end local v27           #updatedNumber:Ljava/lang/String;
    :cond_14
    if-eqz v25, :cond_19

    .line 3149
    const-string v3, "- displaySecondIncomingCallStatus: starting CallerInfo query..."

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3151
    sget-boolean v3, Lcom/android/phone/CallCard;->mLCforUserData:Z

    if-eqz v3, :cond_15

    .line 3153
    const-string v3, "- displaySecondIncomingCallStatus: the language changed to clear userdata"

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3155
    invoke-virtual {v8}, Lcom/android/internal/telephony/Connection;->clearUserData()V

    .line 3156
    const/4 v3, 0x0

    sput-boolean v3, Lcom/android/phone/CallCard;->mLCforUserData:Z

    .line 3159
    :cond_15
    new-instance v20, Lcom/android/phone/CallCard$CallInfoCookie;

    const/4 v3, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v3}, Lcom/android/phone/CallCard$CallInfoCookie;-><init>(Lcom/android/phone/CallCard;Lcom/android/internal/telephony/Call;I)V

    .line 3160
    .local v20, callInfoCookie:Lcom/android/phone/CallCard$CallInfoCookie;
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-static {v3, v8, v0, v1}, Lcom/android/phone/PhoneUtils;->startGetCallerInfo(Landroid/content/Context;Lcom/android/internal/telephony/Connection;Lcom/android/internal/telephony/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;)Lcom/android/phone/PhoneUtils$CallerInfoToken;

    move-result-object v4

    .line 3164
    .local v4, info:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->m2ndIncomingName:Landroid/widget/TextView;

    iget-object v10, v4, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    iget-boolean v5, v4, Lcom/android/phone/PhoneUtils$CallerInfoToken;->isFinal:Z

    if-nez v5, :cond_18

    const/4 v12, 0x1

    :goto_7
    move-object/from16 v9, p0

    move-object/from16 v13, p1

    move-object v14, v8

    invoke-virtual/range {v9 .. v14}, Lcom/android/phone/CallCard;->getCallerName(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3167
    iget-object v10, v4, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    const/4 v12, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/CallCard;->mPhotoIncomingPre:Landroid/widget/ImageView;

    move-object/from16 v19, v0

    move-object/from16 v9, p0

    move-object/from16 v13, p1

    move-object v14, v8

    invoke-direct/range {v9 .. v19}, Lcom/android/phone/CallCard;->updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;Landroid/widget/TextView;ZLandroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/ImageView;)V

    goto/16 :goto_1

    .line 3114
    .end local v4           #info:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    .end local v20           #callInfoCookie:Lcom/android/phone/CallCard$CallInfoCookie;
    :cond_16
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mPhotoTracker:Lcom/android/phone/ContactsAsyncHelper$ImageTracker;

    invoke-virtual {v3, v8}, Lcom/android/phone/ContactsAsyncHelper$ImageTracker;->isDifferentImageRequest(Lcom/android/internal/telephony/Connection;)Z

    move-result v25

    goto/16 :goto_5

    .line 3126
    .local v4, info:Lcom/android/internal/telephony/CallerInfo;
    .restart local v23       #obj:Ljava/lang/Object;
    .restart local v26       #updatedCnapName:Ljava/lang/String;
    .restart local v27       #updatedNumber:Ljava/lang/String;
    :cond_17
    move-object/from16 v0, v22

    instance-of v3, v0, Lcom/android/internal/telephony/CallerInfo;

    if-eqz v3, :cond_12

    move-object/from16 v4, v22

    .line 3127
    check-cast v4, Lcom/android/internal/telephony/CallerInfo;

    goto/16 :goto_6

    .line 3164
    .end local v23           #obj:Ljava/lang/Object;
    .end local v26           #updatedCnapName:Ljava/lang/String;
    .end local v27           #updatedNumber:Ljava/lang/String;
    .local v4, info:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    .restart local v20       #callInfoCookie:Lcom/android/phone/CallCard$CallInfoCookie;
    :cond_18
    const/4 v12, 0x0

    goto :goto_7

    .line 3174
    .end local v4           #info:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    .end local v20           #callInfoCookie:Lcom/android/phone/CallCard$CallInfoCookie;
    :cond_19
    const-string v3, "- displaySecondIncomingCallStatus: using data we already have..."

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3176
    move-object/from16 v0, v22

    instance-of v3, v0, Lcom/android/internal/telephony/CallerInfo;

    if-eqz v3, :cond_1a

    move-object/from16 v10, v22

    .line 3177
    check-cast v10, Lcom/android/internal/telephony/CallerInfo;

    .line 3179
    .local v10, ci:Lcom/android/internal/telephony/CallerInfo;
    invoke-virtual {v8}, Lcom/android/internal/telephony/Connection;->getCnapName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v10, Lcom/android/internal/telephony/CallerInfo;->cnapName:Ljava/lang/String;

    .line 3180
    invoke-virtual {v8}, Lcom/android/internal/telephony/Connection;->getNumberPresentation()I

    move-result v3

    iput v3, v10, Lcom/android/internal/telephony/CallerInfo;->numberPresentation:I

    .line 3181
    invoke-virtual {v8}, Lcom/android/internal/telephony/Connection;->getCnapNamePresentation()I

    move-result v3

    iput v3, v10, Lcom/android/internal/telephony/CallerInfo;->namePresentation:I

    .line 3183
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "- displaySecondIncomingCallStatus: CNAP data from Connection: CNAP name="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, v10, Lcom/android/internal/telephony/CallerInfo;->cnapName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ", Number/Name Presentation="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v5, v10, Lcom/android/internal/telephony/CallerInfo;->numberPresentation:I

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3186
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "   ==> Got CallerInfo; updating display: ci = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3189
    const/4 v12, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/CallCard;->mPhotoIncomingPre:Landroid/widget/ImageView;

    move-object/from16 v19, v0

    move-object/from16 v9, p0

    move-object/from16 v13, p1

    move-object v14, v8

    invoke-direct/range {v9 .. v19}, Lcom/android/phone/CallCard;->updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;Landroid/widget/TextView;ZLandroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/ImageView;)V

    .line 3191
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->m2ndIncomingName:Landroid/widget/TextView;

    const/4 v12, 0x0

    move-object/from16 v9, p0

    move-object/from16 v13, p1

    move-object v14, v8

    invoke-virtual/range {v9 .. v14}, Lcom/android/phone/CallCard;->getCallerName(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 3192
    .end local v10           #ci:Lcom/android/internal/telephony/CallerInfo;
    :cond_1a
    move-object/from16 v0, v22

    instance-of v3, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    if-eqz v3, :cond_1b

    .line 3193
    check-cast v22, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    .end local v22           #o:Ljava/lang/Object;
    move-object/from16 v0, v22

    iget-object v10, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    .line 3195
    .restart local v10       #ci:Lcom/android/internal/telephony/CallerInfo;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "- displaySecondIncomingCallStatus: CNAP data from Connection: CNAP name="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, v10, Lcom/android/internal/telephony/CallerInfo;->cnapName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ", Number/Name Presentation="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v5, v10, Lcom/android/internal/telephony/CallerInfo;->numberPresentation:I

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3198
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "   ==> Got CallerInfoToken; updating display: ci = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3201
    const/4 v12, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/CallCard;->mPhotoIncomingPre:Landroid/widget/ImageView;

    move-object/from16 v19, v0

    move-object/from16 v9, p0

    move-object/from16 v13, p1

    move-object v14, v8

    invoke-direct/range {v9 .. v19}, Lcom/android/phone/CallCard;->updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;Landroid/widget/TextView;ZLandroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/ImageView;)V

    .line 3203
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->m2ndIncomingName:Landroid/widget/TextView;

    const/4 v12, 0x1

    move-object/from16 v9, p0

    move-object/from16 v13, p1

    move-object v14, v8

    invoke-virtual/range {v9 .. v14}, Lcom/android/phone/CallCard;->getCallerName(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 3205
    .end local v10           #ci:Lcom/android/internal/telephony/CallerInfo;
    .restart local v22       #o:Ljava/lang/Object;
    :cond_1b
    const-string v3, "CallCard"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "displaySecondIncomingCallStatus: runQuery was false, but we didn\'t have a cached CallerInfo object!  o = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v22

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 3222
    .end local v8           #conn:Lcom/android/internal/telephony/Connection;
    .end local v11           #presentation:I
    .end local v22           #o:Ljava/lang/Object;
    .end local v24           #phoneType:I
    .end local v25           #runQuery:Z
    .local v4, info:Landroid/provider/Telephony$SIMInfo;
    :cond_1c
    if-nez v4, :cond_b

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v3

    const/4 v5, 0x3

    if-ne v3, v5, :cond_b

    .line 3225
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mSecondIncomingCallBanner:Landroid/view/ViewGroup;

    if-eqz v3, :cond_b

    .line 3226
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallCard;->mSecondIncomingCallBanner:Landroid/view/ViewGroup;

    const v5, 0x7f020092

    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    goto/16 :goto_2

    .line 3241
    .restart local v21       #callState:Ljava/lang/String;
    :cond_1d
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f0d02bd

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v21

    goto/16 :goto_3
.end method

.method public getCallInfoName(I)Ljava/lang/String;
    .locals 2
    .parameter "position"

    .prologue
    const/4 v0, 0x0

    .line 3562
    if-nez p1, :cond_1

    .line 3563
    iget-object v1, p0, Lcom/android/phone/CallCard;->mName:Landroid/widget/TextView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/phone/CallCard;->mName:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 3564
    iget-object v0, p0, Lcom/android/phone/CallCard;->mName:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3578
    :cond_0
    :goto_0
    return-object v0

    .line 3568
    :cond_1
    const/4 v1, 0x1

    if-ne p1, v1, :cond_2

    .line 3569
    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryCallName:Landroid/widget/TextView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/phone/CallCard;->mSecondaryCallName:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 3570
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallName:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 3575
    :cond_2
    iget-object v1, p0, Lcom/android/phone/CallCard;->m2ndHoldName:Landroid/widget/TextView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/phone/CallCard;->m2ndHoldName:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 3576
    iget-object v0, p0, Lcom/android/phone/CallCard;->m2ndHoldName:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method getCallerName(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;)Ljava/lang/String;
    .locals 4
    .parameter "info"
    .parameter "presentation"
    .parameter "isTemporary"
    .parameter "call"
    .parameter "conn"

    .prologue
    .line 3251
    const-string v0, ""

    .line 3253
    .local v0, displayName:Ljava/lang/String;
    if-eqz p1, :cond_a

    .line 3269
    sget-boolean v2, Lcom/android/phone/CallCard;->mLocaleChanged:Z

    if-eqz v2, :cond_1

    .line 3270
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallerInfo;->isEmergencyNumber()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3271
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x10402e5

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    .line 3274
    :cond_0
    const/4 v2, 0x0

    sput-boolean v2, Lcom/android/phone/CallCard;->mLocaleChanged:Z

    .line 3285
    :cond_1
    iget-object v1, p1, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    .line 3286
    .local v1, number:Ljava/lang/String;
    if-eqz v1, :cond_2

    const-string v2, "sip:"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 3287
    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 3290
    :cond_2
    if-eqz v1, :cond_3

    .line 3291
    invoke-static {}, Lcom/mediatek/phone/HyphonManager;->getInstance()Lcom/mediatek/phone/HyphonManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/mediatek/phone/HyphonManager;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 3294
    :cond_3
    iget-object v2, p1, Lcom/android/internal/telephony/CallerInfo;->name:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 3300
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 3303
    iget-object v2, p0, Lcom/android/phone/CallCard;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-static {v2, p2}, Lcom/android/phone/PhoneUtils;->getPresentationString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    .line 3305
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "  ==> no name *or* number! displayName = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3374
    .end local v1           #number:Ljava/lang/String;
    :cond_4
    :goto_0
    return-object v0

    .line 3307
    .restart local v1       #number:Ljava/lang/String;
    :cond_5
    sget v2, Lcom/android/internal/telephony/PhoneConstants;->PRESENTATION_ALLOWED:I

    if-eq p2, v2, :cond_6

    .line 3311
    iget-object v2, p0, Lcom/android/phone/CallCard;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-static {v2, p2}, Lcom/android/phone/PhoneUtils;->getPresentationString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    .line 3313
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "  ==> presentation not allowed! displayName = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 3315
    :cond_6
    iget-object v2, p1, Lcom/android/internal/telephony/CallerInfo;->cnapName:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 3317
    iget-object v0, p1, Lcom/android/internal/telephony/CallerInfo;->cnapName:Ljava/lang/String;

    .line 3318
    iget-object v2, p1, Lcom/android/internal/telephony/CallerInfo;->cnapName:Ljava/lang/String;

    iput-object v2, p1, Lcom/android/internal/telephony/CallerInfo;->name:Ljava/lang/String;

    .line 3320
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "  ==> cnapName available: displayName \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 3330
    :cond_7
    move-object v0, v1

    .line 3334
    if-eqz p5, :cond_4

    invoke-virtual {p5}, Lcom/android/internal/telephony/Connection;->isIncoming()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 3340
    const-string v2, " (conn != null) && (conn.isIncoming())"

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 3350
    :cond_8
    sget v2, Lcom/android/internal/telephony/PhoneConstants;->PRESENTATION_ALLOWED:I

    if-eq p2, v2, :cond_9

    .line 3354
    iget-object v2, p0, Lcom/android/phone/CallCard;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-static {v2, p2}, Lcom/android/phone/PhoneUtils;->getPresentationString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    .line 3356
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "  ==> valid name, but presentation not allowed! displayName = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 3360
    :cond_9
    iget-object v0, p1, Lcom/android/internal/telephony/CallerInfo;->name:Ljava/lang/String;

    goto :goto_0

    .line 3371
    .end local v1           #number:Ljava/lang/String;
    :cond_a
    iget-object v2, p0, Lcom/android/phone/CallCard;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-static {v2, p2}, Lcom/android/phone/PhoneUtils;->getPresentationString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0
.end method

.method getOperatorColorByCall(Lcom/android/internal/telephony/Call;)I
    .locals 4
    .parameter "call"

    .prologue
    const/4 v1, -0x1

    .line 3011
    if-nez p1, :cond_1

    .line 3023
    :cond_0
    :goto_0
    return v1

    .line 3015
    :cond_1
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3016
    invoke-static {p1}, Lcom/android/phone/PhoneUtils;->getSimInfoByCall(Lcom/android/internal/telephony/Call;)Landroid/provider/Telephony$SIMInfo;

    move-result-object v0

    .line 3017
    .local v0, info:Landroid/provider/Telephony$SIMInfo;
    if-eqz v0, :cond_0

    iget-object v2, v0, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_0

    .line 3019
    iget v1, v0, Landroid/provider/Telephony$SIMInfo;->mColor:I

    goto :goto_0
.end method

.method getOperatorNameByCall(Lcom/android/internal/telephony/Call;)Ljava/lang/String;
    .locals 4
    .parameter "call"

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x3

    .line 2991
    if-nez p1, :cond_1

    .line 3007
    :cond_0
    :goto_0
    return-object v1

    .line 2995
    :cond_1
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 2996
    invoke-static {p1}, Lcom/android/phone/PhoneUtils;->getSimInfoByCall(Lcom/android/internal/telephony/Call;)Landroid/provider/Telephony$SIMInfo;

    move-result-object v0

    .line 2997
    .local v0, info:Landroid/provider/Telephony$SIMInfo;
    if-eqz v0, :cond_2

    iget-object v2, v0, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v2

    if-eq v2, v3, :cond_2

    .line 2999
    iget-object v1, v0, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    goto :goto_0

    .line 3000
    :cond_2
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v2

    if-ne v2, v3, :cond_0

    .line 3001
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0d02e1

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 3004
    .end local v0           #info:Landroid/provider/Telephony$SIMInfo;
    :cond_3
    const-string v1, "gsm.operator.alpha"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public hasMultiplePhoneActive()Z
    .locals 9

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 3604
    iget-object v7, p0, Lcom/android/phone/CallCard;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v7, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    .line 3605
    .local v0, cm:Lcom/android/internal/telephony/CallManager;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v7

    sget-object v8, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v7, v8, :cond_1

    .line 3607
    :cond_0
    const-string v5, "CallManager says in idle state!"

    invoke-static {v5}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    move v5, v6

    .line 3633
    :goto_0
    return v5

    .line 3612
    :cond_1
    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getAllPhones()Ljava/util/List;

    move-result-object v4

    .line 3613
    .local v4, phoneList:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Phone;>;"
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "CallManager says in idle state!"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3614
    const/4 v1, 0x0

    .line 3616
    .local v1, count:I
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/Phone;

    .line 3617
    .local v3, phone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v7

    sget-object v8, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v7, v8, :cond_2

    .line 3618
    add-int/lit8 v1, v1, 0x1

    .line 3620
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "non IDLE phone = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3622
    if-le v1, v5, :cond_2

    .line 3624
    const-string v6, "More than one phone active!"

    invoke-static {v6}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 3631
    .end local v3           #phone:Lcom/android/internal/telephony/Phone;
    :cond_3
    const-string v5, "Strange! no phone active but we go here!"

    invoke-static {v5}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    move v5, v6

    .line 3633
    goto :goto_0
.end method

.method public hideCallCardElements()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 2264
    iget-object v0, p0, Lcom/android/phone/CallCard;->mPrimaryCallInfo:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 2265
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallInfo:Landroid/view/ViewStub;

    invoke-virtual {v0, v1}, Landroid/view/ViewStub;->setVisibility(I)V

    .line 2266
    return-void
.end method

.method public hideCallStates(Lcom/android/internal/telephony/CallManager;)V
    .locals 2
    .parameter "cm"

    .prologue
    const/16 v1, 0x8

    .line 3584
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/phone/CallCard;->mSimInfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v0, v0, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3586
    const-string v0, "mSimIndicator GONE"

    invoke-static {v0}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3588
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3590
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    if-nez v0, :cond_1

    .line 3592
    const-string v0, "mSecondaryCallInfo GONE"

    invoke-static {v0}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 3594
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallInfo:Landroid/view/ViewStub;

    invoke-virtual {v0, v1}, Landroid/view/ViewStub;->setVisibility(I)V

    .line 3596
    :cond_1
    return-void
.end method

.method protected onFinishInflate()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 245
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 247
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CallCard onFinishInflate(this = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 249
    const v0, 0x7f08000c

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mCallInfoContainer:Landroid/view/ViewGroup;

    .line 250
    const v0, 0x7f08000d

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mPrimaryCallInfo:Landroid/view/ViewGroup;

    .line 251
    const v0, 0x7f0800e3

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mPrimaryCallBanner:Landroid/view/ViewGroup;

    .line 253
    const v0, 0x7f0800e9

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryInfoContainer:Landroid/view/ViewGroup;

    .line 254
    const v0, 0x7f0800ea

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mProviderInfo:Landroid/view/ViewGroup;

    .line 255
    const v0, 0x7f0800eb

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mProviderLabel:Landroid/widget/TextView;

    .line 256
    const v0, 0x7f0800ec

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mProviderAddress:Landroid/widget/TextView;

    .line 257
    const v0, 0x7f0800ee

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mCallStateLabel:Landroid/widget/TextView;

    .line 262
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x7f09

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/android/phone/CallCard;->mTextColorCallTypeSip:I

    .line 265
    const v0, 0x7f0800e1

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mPhoto:Landroid/widget/ImageView;

    .line 266
    const v0, 0x7f0800e2

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/CallCard;->mPhotoDimEffect:Landroid/view/View;

    .line 268
    const v0, 0x7f0800e4

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mName:Landroid/widget/TextView;

    .line 269
    const v0, 0x7f08001c

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    .line 270
    const v0, 0x7f0800e6

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mLabel:Landroid/widget/TextView;

    .line 271
    const v0, 0x7f0800e8

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mCallTypeLabel:Landroid/widget/TextView;

    .line 275
    const v0, 0x7f08000f

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewStub;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallInfo:Landroid/view/ViewStub;

    .line 278
    const v0, 0x7f0800cf

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mOperatorName:Landroid/widget/TextView;

    .line 279
    const v0, 0x7f0800ef

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mSimIndicator:Landroid/widget/TextView;

    .line 280
    const v0, 0x7f0800e7

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mPhoneNumberGeoDescription:Landroid/widget/TextView;

    .line 282
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 283
    const v0, 0x7f0800f2

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mIncomingCall2Info:Landroid/view/ViewGroup;

    .line 285
    const v0, 0x7f08008e

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mPhotoIncomingPre:Landroid/widget/ImageView;

    .line 287
    const v0, 0x7f08008d

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/phone/CallCard;->m2ndIncomingName:Landroid/widget/TextView;

    .line 288
    const v0, 0x7f080091

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/phone/CallCard;->m2ndIncomingState:Landroid/widget/TextView;

    .line 289
    const v0, 0x7f080090

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/phone/CallCard;->mSecondIncomingCallBanner:Landroid/view/ViewGroup;

    .line 291
    const v0, 0x7f08008f

    invoke-virtual {p0, v0}, Lcom/android/phone/CallCard;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/CallCard;->mIncomingCall2PhotoDimEffect:Landroid/view/View;

    .line 292
    iget-object v0, p0, Lcom/android/phone/CallCard;->mIncomingCall2PhotoDimEffect:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 293
    iget-object v0, p0, Lcom/android/phone/CallCard;->mIncomingCall2PhotoDimEffect:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setClickable(Z)V

    .line 294
    iget-object v0, p0, Lcom/android/phone/CallCard;->mIncomingCall2PhotoDimEffect:Landroid/view/View;

    iget-object v1, p0, Lcom/android/phone/CallCard;->callCardListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 297
    iget-object v0, p0, Lcom/android/phone/CallCard;->mIncomingCall2PhotoDimEffect:Landroid/view/View;

    new-instance v1, Lcom/android/phone/SmallerHitTargetTouchListener;

    invoke-direct {v1}, Lcom/android/phone/SmallerHitTargetTouchListener;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 300
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0c003a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/phone/CallCard;->mIncomingCallInfoWidth:I

    .line 302
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0c0039

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/phone/CallCard;->mIncomingCallInfoHeight:I

    .line 304
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0c0038

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/phone/CallCard;->mIncomingCallInfoTopMargin:I

    .line 308
    :cond_0
    invoke-static {}, Lcom/mediatek/phone/ext/ExtensionManager;->getInstance()Lcom/mediatek/phone/ext/ExtensionManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/phone/ext/ExtensionManager;->getCallCardExtension()Lcom/mediatek/phone/ext/CallCardExtension;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/mediatek/phone/ext/CallCardExtension;->onFinishInflate(Landroid/view/View;)V

    .line 310
    return-void
.end method

.method public onImageLoadComplete(ILandroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;Ljava/lang/Object;)V
    .locals 6
    .parameter "token"
    .parameter "photo"
    .parameter "photoIcon"
    .parameter "cookie"

    .prologue
    .line 990
    iget-object v4, p0, Lcom/android/phone/CallCard;->mHandler:Landroid/os/Handler;

    const/16 v5, 0x65

    invoke-virtual {v4, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 991
    iget-object v4, p0, Lcom/android/phone/CallCard;->mLoadingPersonUri:Landroid/net/Uri;

    if-eqz v4, :cond_1

    .line 997
    iget-object v4, p0, Lcom/android/phone/CallCard;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v5, p0, Lcom/android/phone/CallCard;->mLoadingPersonUri:Landroid/net/Uri;

    invoke-static {v4, v5}, Lcom/android/phone/PhoneUtils;->sendViewNotificationAsync(Landroid/content/Context;Landroid/net/Uri;)V

    .line 1002
    :goto_0
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/android/phone/CallCard;->mLoadingPersonUri:Landroid/net/Uri;

    move-object v0, p4

    .line 1004
    check-cast v0, Lcom/android/phone/CallCard$AsyncLoadCookie;

    .line 1005
    .local v0, asyncLoadCookie:Lcom/android/phone/CallCard$AsyncLoadCookie;
    iget-object v2, v0, Lcom/android/phone/CallCard$AsyncLoadCookie;->callerInfo:Lcom/android/internal/telephony/CallerInfo;

    .line 1006
    .local v2, callerInfo:Lcom/android/internal/telephony/CallerInfo;
    iget-object v3, v0, Lcom/android/phone/CallCard$AsyncLoadCookie;->imageView:Landroid/widget/ImageView;

    .line 1007
    .local v3, imageView:Landroid/widget/ImageView;
    iget-object v1, v0, Lcom/android/phone/CallCard$AsyncLoadCookie;->call:Lcom/android/internal/telephony/Call;

    .line 1009
    .local v1, call:Lcom/android/internal/telephony/Call;
    iput-object p2, v2, Lcom/android/internal/telephony/CallerInfo;->cachedPhoto:Landroid/graphics/drawable/Drawable;

    .line 1010
    iput-object p3, v2, Lcom/android/internal/telephony/CallerInfo;->cachedPhotoIcon:Landroid/graphics/Bitmap;

    .line 1011
    const/4 v4, 0x1

    iput-boolean v4, v2, Lcom/android/internal/telephony/CallerInfo;->isCachedPhotoCurrent:Z

    .line 1015
    if-eqz p2, :cond_2

    .line 1016
    invoke-static {v3, p2}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    .line 1023
    :goto_1
    if-nez p1, :cond_0

    .line 1024
    invoke-direct {p0, v1, v3}, Lcom/android/phone/CallCard;->updatePhotoForCallState(Lcom/android/internal/telephony/Call;Landroid/widget/ImageView;)V

    .line 1026
    :cond_0
    return-void

    .line 1000
    .end local v0           #asyncLoadCookie:Lcom/android/phone/CallCard$AsyncLoadCookie;
    .end local v1           #call:Lcom/android/internal/telephony/Call;
    .end local v2           #callerInfo:Lcom/android/internal/telephony/CallerInfo;
    .end local v3           #imageView:Landroid/widget/ImageView;
    :cond_1
    const-string v4, "CallCard"

    const-string v5, "Person Uri isn\'t available while Image is successfully loaded."

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1017
    .restart local v0       #asyncLoadCookie:Lcom/android/phone/CallCard$AsyncLoadCookie;
    .restart local v1       #call:Lcom/android/internal/telephony/Call;
    .restart local v2       #callerInfo:Lcom/android/internal/telephony/CallerInfo;
    .restart local v3       #imageView:Landroid/widget/ImageView;
    :cond_2
    if-eqz p3, :cond_3

    .line 1018
    invoke-static {v3, p3}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V

    goto :goto_1

    .line 1020
    :cond_3
    const v4, 0x7f02009c

    invoke-static {v3, v4}, Lcom/android/phone/CallCard;->showImage(Landroid/widget/ImageView;I)V

    goto :goto_1
.end method

.method public onQueryComplete(ILjava/lang/Object;Lcom/android/internal/telephony/CallerInfo;)V
    .locals 17
    .parameter "token"
    .parameter "cookie"
    .parameter "ci"

    .prologue
    .line 903
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onQueryComplete: token "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v0, p1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", cookie "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p2

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", ci "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p3

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 906
    move-object/from16 v0, p2

    instance-of v1, v0, Lcom/android/phone/CallCard$CallInfoCookie;

    if-eqz v1, :cond_8

    .line 910
    const-string v1, "callerinfo query complete, cookie is CallInfo"

    invoke-static {v1}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    move-object/from16 v13, p2

    .line 911
    check-cast v13, Lcom/android/phone/CallCard$CallInfoCookie;

    .line 912
    .local v13, callInfo:Lcom/android/phone/CallCard$CallInfoCookie;
    iget v12, v13, Lcom/android/phone/CallCard$CallInfoCookie;->bannerNumber:I

    .line 913
    .local v12, bannerNumber:I
    iget-object v5, v13, Lcom/android/phone/CallCard$CallInfoCookie;->call:Lcom/android/internal/telephony/Call;

    .line 914
    .local v5, call:Lcom/android/internal/telephony/Call;
    const/4 v6, 0x0

    .line 915
    .local v6, conn:Lcom/android/internal/telephony/Connection;
    invoke-virtual {v5}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v16

    .line 916
    .local v16, phoneType:I
    const/4 v1, 0x2

    move/from16 v0, v16

    if-ne v0, v1, :cond_2

    .line 917
    invoke-virtual {v5}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v6

    .line 927
    :goto_0
    sget v3, Lcom/android/internal/telephony/PhoneConstants;->PRESENTATION_ALLOWED:I

    .line 928
    .local v3, presentation:I
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Lcom/android/internal/telephony/Connection;->getNumberPresentation()I

    move-result v3

    .line 929
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "- onQueryComplete: presentation="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", contactExists="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p3

    iget-boolean v2, v0, Lcom/android/internal/telephony/CallerInfo;->contactExists:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 935
    if-nez v12, :cond_6

    .line 937
    const-string v1, "banner number is PRIMARY_CALL_BANNER"

    invoke-static {v1}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 939
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-static {v1, v6, v0, v2}, Lcom/android/phone/PhoneUtils;->startGetCallerInfo(Landroid/content/Context;Lcom/android/internal/telephony/Connection;Lcom/android/internal/telephony/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;)Lcom/android/phone/PhoneUtils$CallerInfoToken;

    move-result-object v14

    .line 941
    .local v14, cit:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    move-object/from16 v0, p3

    iget-boolean v1, v0, Lcom/android/internal/telephony/CallerInfo;->contactExists:Z

    if-eqz v1, :cond_5

    .line 942
    sget v3, Lcom/android/internal/telephony/PhoneConstants;->PRESENTATION_ALLOWED:I

    .end local v3           #presentation:I
    const/4 v4, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p3

    invoke-direct/range {v1 .. v6}, Lcom/android/phone/CallCard;->updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;)V

    .line 946
    :goto_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/phone/CallCard;->mPhoto:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    invoke-direct {v0, v5, v1}, Lcom/android/phone/CallCard;->updatePhotoForCallState(Lcom/android/internal/telephony/Call;Landroid/widget/ImageView;)V

    .line 982
    .end local v5           #call:Lcom/android/internal/telephony/Call;
    .end local v6           #conn:Lcom/android/internal/telephony/Connection;
    .end local v12           #bannerNumber:I
    .end local v13           #callInfo:Lcom/android/phone/CallCard$CallInfoCookie;
    .end local v14           #cit:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    .end local v16           #phoneType:I
    .end local p2
    :cond_1
    :goto_2
    return-void

    .line 918
    .restart local v5       #call:Lcom/android/internal/telephony/Call;
    .restart local v6       #conn:Lcom/android/internal/telephony/Connection;
    .restart local v12       #bannerNumber:I
    .restart local v13       #callInfo:Lcom/android/phone/CallCard$CallInfoCookie;
    .restart local v16       #phoneType:I
    .restart local p2
    :cond_2
    const/4 v1, 0x1

    move/from16 v0, v16

    if-eq v0, v1, :cond_3

    const/4 v1, 0x3

    move/from16 v0, v16

    if-ne v0, v1, :cond_4

    .line 920
    :cond_3
    invoke-virtual {v5}, Lcom/android/internal/telephony/Call;->getEarliestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v6

    goto :goto_0

    .line 922
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected phone type: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 944
    .restart local v3       #presentation:I
    .restart local v14       #cit:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    :cond_5
    iget-object v2, v14, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    const/4 v4, 0x0

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/android/phone/CallCard;->updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;)V

    goto :goto_1

    .line 947
    .end local v14           #cit:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    :cond_6
    const/4 v1, 0x1

    if-ne v1, v12, :cond_7

    .line 949
    const-string v1, "banner number is SECONDARY_CALL_BANNER"

    invoke-static {v1}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 951
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->mSecondaryCallName:Landroid/widget/TextView;

    move-object/from16 v0, p0

    invoke-static {v1, v5, v0, v2}, Lcom/android/phone/PhoneUtils;->startGetCallerInfo(Landroid/content/Context;Lcom/android/internal/telephony/Call;Lcom/android/internal/telephony/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;)Lcom/android/phone/PhoneUtils$CallerInfoToken;

    move-result-object v15

    .line 953
    .local v15, infoToken:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/phone/CallCard;->mSecondaryCallName:Landroid/widget/TextView;

    iget-object v2, v15, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/phone/PhoneUtils;->getCompactNameFromCallerInfo(Lcom/android/internal/telephony/CallerInfo;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 956
    iget-object v2, v15, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/phone/CallCard;->mSecondaryCallName:Landroid/widget/TextView;

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/phone/CallCard;->mSecondaryCallPhoto:Landroid/widget/ImageView;

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v11}, Lcom/android/phone/CallCard;->updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;Landroid/widget/TextView;ZLandroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/ImageView;)V

    goto :goto_2

    .line 958
    .end local v15           #infoToken:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    :cond_7
    const/4 v1, 0x2

    if-ne v1, v12, :cond_1

    .line 959
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallCard;->m2ndHoldName:Landroid/widget/TextView;

    move-object/from16 v0, p0

    invoke-static {v1, v5, v0, v2}, Lcom/android/phone/PhoneUtils;->startGetCallerInfo(Landroid/content/Context;Lcom/android/internal/telephony/Call;Lcom/android/internal/telephony/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;)Lcom/android/phone/PhoneUtils$CallerInfoToken;

    move-result-object v15

    .line 961
    .restart local v15       #infoToken:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/phone/CallCard;->m2ndHoldName:Landroid/widget/TextView;

    iget-object v2, v15, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/phone/PhoneUtils;->getCompactNameFromCallerInfo(Lcom/android/internal/telephony/CallerInfo;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 964
    iget-object v2, v15, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/phone/CallCard;->m2ndHoldName:Landroid/widget/TextView;

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/phone/CallCard;->mPhotoHoldPre:Landroid/widget/ImageView;

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v11}, Lcom/android/phone/CallCard;->updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;Landroid/widget/TextView;ZLandroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/ImageView;)V

    goto/16 :goto_2

    .line 969
    .end local v3           #presentation:I
    .end local v5           #call:Lcom/android/internal/telephony/Call;
    .end local v6           #conn:Lcom/android/internal/telephony/Connection;
    .end local v12           #bannerNumber:I
    .end local v13           #callInfo:Lcom/android/phone/CallCard$CallInfoCookie;
    .end local v15           #infoToken:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    .end local v16           #phoneType:I
    :cond_8
    move-object/from16 v0, p2

    instance-of v1, v0, Landroid/widget/TextView;

    if-eqz v1, :cond_9

    .line 970
    const-string v1, "callerinfo query complete, updating ui from ongoing or onhold"

    invoke-static {v1}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 971
    check-cast p2, Landroid/widget/TextView;

    .end local p2
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/phone/CallCard;->mContext:Landroid/content/Context;

    move-object/from16 v0, p3

    invoke-static {v0, v1}, Lcom/android/phone/PhoneUtils;->getCompactNameFromCallerInfo(Lcom/android/internal/telephony/CallerInfo;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 972
    .restart local p2
    :cond_9
    move-object/from16 v0, p2

    instance-of v1, v0, Lcom/android/phone/InCallUiState$FakeCall;

    if-eqz v1, :cond_1

    .line 973
    const-string v1, "callerinfo query complete, updating fake call ui!"

    invoke-static {v1}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 974
    if-eqz p3, :cond_1

    .line 975
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ci.name = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/CallerInfo;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 976
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ci.phoneNumber = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 977
    move-object/from16 v0, p3

    iget-object v1, v0, Lcom/android/internal/telephony/CallerInfo;->name:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 978
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/phone/CallCard;->mName:Landroid/widget/TextView;

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/CallerInfo;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2
.end method

.method public onTickForCallTimeElapsed(J)V
    .locals 0
    .parameter "timeElapsed"

    .prologue
    .line 236
    invoke-virtual {p0, p1, p2}, Lcom/android/phone/CallCard;->updateElapsedTimeWidget(J)V

    .line 237
    return-void
.end method

.method setInCallScreenInstance(Lcom/android/phone/InCallScreen;)V
    .locals 0
    .parameter "inCallScreen"

    .prologue
    .line 229
    iput-object p1, p0, Lcom/android/phone/CallCard;->mInCallScreen:Lcom/android/phone/InCallScreen;

    .line 230
    return-void
.end method

.method setIncomingCallWidgetHint(II)V
    .locals 0
    .parameter "hintTextResId"
    .parameter "hintColorResId"

    .prologue
    .line 2273
    iput p1, p0, Lcom/android/phone/CallCard;->mIncomingCallWidgetHintTextResId:I

    .line 2274
    iput p2, p0, Lcom/android/phone/CallCard;->mIncomingCallWidgetHintColorResId:I

    .line 2275
    return-void
.end method

.method setSecondaryCallClickable(Z)V
    .locals 1
    .parameter "clickable"

    .prologue
    .line 1518
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallPhotoDimEffect:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 1519
    iget-object v0, p0, Lcom/android/phone/CallCard;->mSecondaryCallPhotoDimEffect:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 1521
    :cond_0
    return-void
.end method

.method public updateElapsedTimeWidget(J)V
    .locals 2
    .parameter "timeElapsed"

    .prologue
    .line 1261
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateElapsedTimeWidget: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 1262
    iget-object v0, p0, Lcom/android/phone/CallCard;->mCallStateLabel:Landroid/widget/TextView;

    invoke-static {p1, p2}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1263
    return-void
.end method

.method updateElapsedTimeWidget(Lcom/android/internal/telephony/Call;)V
    .locals 4
    .parameter "call"

    .prologue
    .line 1251
    invoke-static {p1}, Lcom/android/phone/CallTime;->getCallDuration(Lcom/android/internal/telephony/Call;)J

    move-result-wide v0

    .line 1252
    .local v0, duration:J
    const-wide/16 v2, 0x3e8

    div-long v2, v0, v2

    invoke-virtual {p0, v2, v3}, Lcom/android/phone/CallCard;->updateElapsedTimeWidget(J)V

    .line 1255
    return-void
.end method

.method public updateForLanguageChange()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 2403
    sput-boolean v0, Lcom/android/phone/CallCard;->mLocaleChanged:Z

    .line 2404
    sput-boolean v0, Lcom/android/phone/CallCard;->mLCforUserData:Z

    .line 2405
    sput-boolean v0, Lcom/android/phone/CallCard;->mLCforUserDataHoldCall:Z

    .line 2406
    sput-boolean v0, Lcom/android/phone/CallCard;->sLCforUserDataSecondHoldCall:Z

    .line 2407
    return-void
.end method

.method updateState(Lcom/android/internal/telephony/CallManager;)V
    .locals 7
    .parameter "cm"

    .prologue
    .line 317
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "updateState("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")..."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 320
    invoke-static {}, Lcom/android/phone/PhoneUtils;->dumpCallManager()V

    .line 322
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "updateState: current active call is : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/phone/CallCard;->log(Ljava/lang/String;)V

    .line 325
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v4

    .line 326
    .local v4, state:Lcom/android/internal/telephony/PhoneConstants$State;
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    .line 327
    .local v2, ringingCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    .line 328
    .local v1, fgCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 331
    .local v0, bgCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {p0}, Lcom/android/phone/CallCard;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/android/phone/PhoneUtils;->isLandscape(Landroid/content/Context;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 332
    invoke-direct {p0, v4}, Lcom/android/phone/CallCard;->updateCallInfoLayout(Lcom/android/internal/telephony/PhoneConstants$State;)V

    .line 340
    :cond_0
    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    sget-object v6, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    if-eq v5, v6, :cond_5

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/internal/telephony/Call$State;->isDialing()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v5

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/android/phone/CallCard;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v5}, Lcom/mediatek/phone/DualTalkUtils;->isRingingWhenOutgoing()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 351
    :cond_1
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    sget-object v6, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-eq v5, v6, :cond_2

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    sget-object v6, Lcom/android/internal/telephony/Call$State;->DISCONNECTING:Lcom/android/internal/telephony/Call$State;

    if-eq v5, v6, :cond_2

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    sget-object v6, Lcom/android/internal/telephony/Call$State;->DISCONNECTED:Lcom/android/internal/telephony/Call$State;

    if-eq v5, v6, :cond_2

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    sget-object v6, Lcom/android/internal/telephony/Call$State;->HOLDING:Lcom/android/internal/telephony/Call$State;

    if-ne v5, v6, :cond_3

    :cond_2
    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v5

    if-nez v5, :cond_3

    const/4 v3, 0x1

    .line 356
    .local v3, skipUpdateRingingCall:Z
    :goto_0
    if-eqz v3, :cond_4

    .line 357
    invoke-direct {p0, p1}, Lcom/android/phone/CallCard;->updateForegroundCall(Lcom/android/internal/telephony/CallManager;)V

    .line 404
    .end local v3           #skipUpdateRingingCall:Z
    :goto_1
    return-void

    .line 351
    :cond_3
    const/4 v3, 0x0

    goto :goto_0

    .line 362
    .restart local v3       #skipUpdateRingingCall:Z
    :cond_4
    invoke-direct {p0, p1}, Lcom/android/phone/CallCard;->updateRingingCall(Lcom/android/internal/telephony/CallManager;)V

    .line 403
    .end local v3           #skipUpdateRingingCall:Z
    :goto_2
    invoke-static {}, Lcom/mediatek/phone/ext/ExtensionManager;->getInstance()Lcom/mediatek/phone/ext/ExtensionManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/mediatek/phone/ext/ExtensionManager;->getCallCardExtension()Lcom/mediatek/phone/ext/CallCardExtension;

    move-result-object v5

    invoke-virtual {v5, p1}, Lcom/mediatek/phone/ext/CallCardExtension;->updateState(Lcom/android/internal/telephony/CallManager;)V

    goto :goto_1

    .line 363
    :cond_5
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    sget-object v6, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    if-ne v5, v6, :cond_6

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    sget-object v6, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    if-eq v5, v6, :cond_7

    .line 373
    :cond_6
    invoke-direct {p0, p1}, Lcom/android/phone/CallCard;->updateForegroundCall(Lcom/android/internal/telephony/CallManager;)V

    goto :goto_2

    .line 377
    :cond_7
    iget-object v5, p0, Lcom/android/phone/CallCard;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v5, v5, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-boolean v5, v5, Lcom/android/phone/InCallUiState;->showAlreadyDisconnectedState:Z

    if-eqz v5, :cond_8

    .line 385
    invoke-direct {p0, p1}, Lcom/android/phone/CallCard;->updateAlreadyDisconnected(Lcom/android/internal/telephony/CallManager;)V

    goto :goto_2

    .line 399
    :cond_8
    invoke-direct {p0, p1}, Lcom/android/phone/CallCard;->updateNoCall(Lcom/android/internal/telephony/CallManager;)V

    goto :goto_2
.end method
