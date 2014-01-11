.class public Lcom/mediatek/bluetooth/ProfileService;
.super Lcom/mediatek/bluetooth/psm/PsmService;
.source "ProfileService.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/mediatek/bluetooth/psm/PsmService;-><init>()V

    return-void
.end method


# virtual methods
.method protected getProfileCount()I
    .locals 1

    .prologue
    .line 51
    const/4 v0, 0x2

    return v0
.end method

.method protected registerProfileServices()V
    .locals 0

    .prologue
    .line 79
    return-void
.end method
