.class public Lcom/mediatek/phone/vt/VTCallBanner;
.super Landroid/widget/RelativeLayout;
.source "VTCallBanner.java"


# static fields
.field private static final DBG:Z = true

.field private static final LOG_TAG:Ljava/lang/String; = "VTCallBanner"


# instance fields
.field public mCallStateLabel:Landroid/widget/TextView;

.field public mCallTypeLabel:Landroid/widget/TextView;

.field public mLabel:Landroid/widget/TextView;

.field public mMainCallBanner:Landroid/view/ViewGroup;

.field public mName:Landroid/widget/TextView;

.field public mOperatorName:Landroid/widget/TextView;

.field public mPhoneNumber:Landroid/widget/TextView;

.field public mPhoneNumberGeoDescription:Landroid/widget/TextView;

.field public mSimIndicator:Landroid/widget/TextView;

.field public mVtCallStateAndSimIndicate:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 71
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 73
    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 97
    const-string v0, "VTCallBanner"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    return-void
.end method


# virtual methods
.method protected onFinishInflate()V
    .locals 2

    .prologue
    .line 77
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onFinishInflate(this = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/phone/vt/VTCallBanner;->log(Ljava/lang/String;)V

    .line 83
    const v0, 0x7f0800cf

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTCallBanner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTCallBanner;->mOperatorName:Landroid/widget/TextView;

    .line 84
    const v0, 0x7f0800ef

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTCallBanner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTCallBanner;->mSimIndicator:Landroid/widget/TextView;

    .line 86
    const v0, 0x7f0800e4

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTCallBanner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTCallBanner;->mName:Landroid/widget/TextView;

    .line 87
    const v0, 0x7f08001c

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTCallBanner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTCallBanner;->mPhoneNumber:Landroid/widget/TextView;

    .line 88
    const v0, 0x7f0800e6

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTCallBanner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTCallBanner;->mLabel:Landroid/widget/TextView;

    .line 89
    const v0, 0x7f0800e8

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTCallBanner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTCallBanner;->mCallTypeLabel:Landroid/widget/TextView;

    .line 90
    const v0, 0x7f08010c

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTCallBanner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTCallBanner;->mMainCallBanner:Landroid/view/ViewGroup;

    .line 91
    const v0, 0x7f0800ee

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTCallBanner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTCallBanner;->mCallStateLabel:Landroid/widget/TextView;

    .line 92
    const v0, 0x7f0800e7

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTCallBanner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTCallBanner;->mPhoneNumberGeoDescription:Landroid/widget/TextView;

    .line 93
    const v0, 0x7f08010d

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTCallBanner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTCallBanner;->mVtCallStateAndSimIndicate:Landroid/view/ViewGroup;

    .line 94
    return-void
.end method
