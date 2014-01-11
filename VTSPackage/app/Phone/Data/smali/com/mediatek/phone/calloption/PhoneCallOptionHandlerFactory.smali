.class public Lcom/mediatek/phone/calloption/PhoneCallOptionHandlerFactory;
.super Lcom/mediatek/calloption/CallOptionHandlerFactory;
.source "PhoneCallOptionHandlerFactory.java"


# instance fields
.field private mInternationalCallOptionHandler:Lcom/mediatek/calloption/InternationalCallOptionHandler;

.field private mInternetCallOptionHandler:Lcom/mediatek/calloption/InternetCallOptionHandler;

.field private mIpCallOptionHandler:Lcom/mediatek/calloption/IpCallOptionHandler;

.field private mSimSelectionCallOptionHandler:Lcom/mediatek/calloption/SimSelectionCallOptionHandler;

.field private mSimStatusCallOptionHandler:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

.field private mVideoCallOptionHandler:Lcom/mediatek/calloption/VideoCallOptionHandler;

.field private mVoiceMailCallOptionHandler:Lcom/mediatek/calloption/VoiceMailCallOptionHandler;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/mediatek/calloption/CallOptionHandlerFactory;-><init>()V

    .line 24
    new-instance v0, Lcom/mediatek/phone/calloption/PhoneInternetCallOptionHandler;

    invoke-direct {v0}, Lcom/mediatek/phone/calloption/PhoneInternetCallOptionHandler;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/calloption/PhoneCallOptionHandlerFactory;->mInternetCallOptionHandler:Lcom/mediatek/calloption/InternetCallOptionHandler;

    .line 25
    new-instance v0, Lcom/mediatek/phone/calloption/PhoneVideoCallOptionHandler;

    invoke-direct {v0}, Lcom/mediatek/phone/calloption/PhoneVideoCallOptionHandler;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/calloption/PhoneCallOptionHandlerFactory;->mVideoCallOptionHandler:Lcom/mediatek/calloption/VideoCallOptionHandler;

    .line 26
    new-instance v0, Lcom/mediatek/phone/calloption/PhoneInternationalCallOptionHandler;

    invoke-direct {v0}, Lcom/mediatek/phone/calloption/PhoneInternationalCallOptionHandler;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/calloption/PhoneCallOptionHandlerFactory;->mInternationalCallOptionHandler:Lcom/mediatek/calloption/InternationalCallOptionHandler;

    .line 27
    new-instance v0, Lcom/mediatek/phone/calloption/PhoneSimSelectionCallOptionHandler;

    invoke-direct {v0}, Lcom/mediatek/phone/calloption/PhoneSimSelectionCallOptionHandler;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/calloption/PhoneCallOptionHandlerFactory;->mSimSelectionCallOptionHandler:Lcom/mediatek/calloption/SimSelectionCallOptionHandler;

    .line 28
    new-instance v0, Lcom/mediatek/phone/calloption/PhoneSimStatusCallOptionHandler;

    invoke-direct {v0}, Lcom/mediatek/phone/calloption/PhoneSimStatusCallOptionHandler;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/calloption/PhoneCallOptionHandlerFactory;->mSimStatusCallOptionHandler:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    .line 29
    new-instance v0, Lcom/mediatek/phone/calloption/PhoneIpCallOptionHandler;

    invoke-direct {v0}, Lcom/mediatek/phone/calloption/PhoneIpCallOptionHandler;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/calloption/PhoneCallOptionHandlerFactory;->mIpCallOptionHandler:Lcom/mediatek/calloption/IpCallOptionHandler;

    .line 30
    new-instance v0, Lcom/mediatek/phone/calloption/PhoneVoiceMailCallOptionHandler;

    invoke-direct {v0}, Lcom/mediatek/phone/calloption/PhoneVoiceMailCallOptionHandler;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/calloption/PhoneCallOptionHandlerFactory;->mVoiceMailCallOptionHandler:Lcom/mediatek/calloption/VoiceMailCallOptionHandler;

    .line 31
    return-void
.end method


# virtual methods
.method public getInternationalCallOptionHandler()Lcom/mediatek/calloption/InternationalCallOptionHandler;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mediatek/phone/calloption/PhoneCallOptionHandlerFactory;->mInternationalCallOptionHandler:Lcom/mediatek/calloption/InternationalCallOptionHandler;

    return-object v0
.end method

.method public getInternetCallOptionHandler()Lcom/mediatek/calloption/InternetCallOptionHandler;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/mediatek/phone/calloption/PhoneCallOptionHandlerFactory;->mInternetCallOptionHandler:Lcom/mediatek/calloption/InternetCallOptionHandler;

    return-object v0
.end method

.method public getIpCallOptionHandler()Lcom/mediatek/calloption/IpCallOptionHandler;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/mediatek/phone/calloption/PhoneCallOptionHandlerFactory;->mIpCallOptionHandler:Lcom/mediatek/calloption/IpCallOptionHandler;

    return-object v0
.end method

.method public getSimSelectionCallOptionHandler()Lcom/mediatek/calloption/SimSelectionCallOptionHandler;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/mediatek/phone/calloption/PhoneCallOptionHandlerFactory;->mSimSelectionCallOptionHandler:Lcom/mediatek/calloption/SimSelectionCallOptionHandler;

    return-object v0
.end method

.method public getSimStatusCallOptionHandler()Lcom/mediatek/calloption/SimStatusCallOptionHandler;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/mediatek/phone/calloption/PhoneCallOptionHandlerFactory;->mSimStatusCallOptionHandler:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    return-object v0
.end method

.method public getVideoCallOptionHandler()Lcom/mediatek/calloption/VideoCallOptionHandler;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/mediatek/phone/calloption/PhoneCallOptionHandlerFactory;->mVideoCallOptionHandler:Lcom/mediatek/calloption/VideoCallOptionHandler;

    return-object v0
.end method

.method public getVoiceMailCallOptionHandler()Lcom/mediatek/calloption/VoiceMailCallOptionHandler;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/mediatek/phone/calloption/PhoneCallOptionHandlerFactory;->mVoiceMailCallOptionHandler:Lcom/mediatek/calloption/VoiceMailCallOptionHandler;

    return-object v0
.end method
