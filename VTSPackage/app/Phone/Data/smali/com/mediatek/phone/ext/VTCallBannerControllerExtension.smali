.class public Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;
.super Ljava/lang/Object;
.source "VTCallBannerControllerExtension.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public initialize(Landroid/content/Context;Landroid/view/ViewGroup;)V
    .locals 0
    .parameter "context"
    .parameter "vtCallBanner"

    .prologue
    .line 53
    return-void
.end method

.method public updateCallStateWidgets(Lcom/android/internal/telephony/Call;)Z
    .locals 1
    .parameter "call"

    .prologue
    .line 61
    const/4 v0, 0x0

    return v0
.end method

.method public updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;)V
    .locals 0
    .parameter "info"
    .parameter "presentation"
    .parameter "isTemporary"
    .parameter "call"
    .parameter "conn"

    .prologue
    .line 83
    return-void
.end method

.method public updateState(Lcom/android/internal/telephony/Call;)Z
    .locals 1
    .parameter "call"

    .prologue
    .line 70
    const/4 v0, 0x0

    return v0
.end method
