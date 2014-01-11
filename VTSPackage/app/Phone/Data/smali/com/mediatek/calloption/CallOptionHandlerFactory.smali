.class public abstract Lcom/mediatek/calloption/CallOptionHandlerFactory;
.super Ljava/lang/Object;
.source "CallOptionHandlerFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFinalCallOptionHandler()Lcom/mediatek/calloption/FinalCallOptionHandler;
    .locals 1

    .prologue
    .line 24
    new-instance v0, Lcom/mediatek/calloption/FinalCallOptionHandler;

    invoke-direct {v0}, Lcom/mediatek/calloption/FinalCallOptionHandler;-><init>()V

    return-object v0
.end method

.method public getFirstCallOptionHandler()Lcom/mediatek/calloption/FirstCallOptionHandler;
    .locals 1

    .prologue
    .line 6
    new-instance v0, Lcom/mediatek/calloption/FirstCallOptionHandler;

    invoke-direct {v0}, Lcom/mediatek/calloption/FirstCallOptionHandler;-><init>()V

    return-object v0
.end method

.method public abstract getInternationalCallOptionHandler()Lcom/mediatek/calloption/InternationalCallOptionHandler;
.end method

.method public abstract getInternetCallOptionHandler()Lcom/mediatek/calloption/InternetCallOptionHandler;
.end method

.method public abstract getIpCallOptionHandler()Lcom/mediatek/calloption/IpCallOptionHandler;
.end method

.method public abstract getSimSelectionCallOptionHandler()Lcom/mediatek/calloption/SimSelectionCallOptionHandler;
.end method

.method public abstract getSimStatusCallOptionHandler()Lcom/mediatek/calloption/SimStatusCallOptionHandler;
.end method

.method public abstract getVideoCallOptionHandler()Lcom/mediatek/calloption/VideoCallOptionHandler;
.end method

.method public abstract getVoiceMailCallOptionHandler()Lcom/mediatek/calloption/VoiceMailCallOptionHandler;
.end method
