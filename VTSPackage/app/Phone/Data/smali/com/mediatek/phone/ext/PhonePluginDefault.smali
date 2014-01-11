.class public Lcom/mediatek/phone/ext/PhonePluginDefault;
.super Ljava/lang/Object;
.source "PhonePluginDefault.java"

# interfaces
.implements Lcom/mediatek/phone/ext/IPhonePlugin;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createCallCardExtension()Lcom/mediatek/phone/ext/CallCardExtension;
    .locals 1

    .prologue
    .line 45
    new-instance v0, Lcom/mediatek/phone/ext/CallCardExtension;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/CallCardExtension;-><init>()V

    return-object v0
.end method

.method public createInCallScreenExtension()Lcom/mediatek/phone/ext/InCallScreenExtension;
    .locals 1

    .prologue
    .line 61
    new-instance v0, Lcom/mediatek/phone/ext/InCallScreenExtension;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/InCallScreenExtension;-><init>()V

    return-object v0
.end method

.method public createInCallTouchUiExtension()Lcom/mediatek/phone/ext/InCallTouchUiExtension;
    .locals 1

    .prologue
    .line 53
    new-instance v0, Lcom/mediatek/phone/ext/InCallTouchUiExtension;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/InCallTouchUiExtension;-><init>()V

    return-object v0
.end method

.method public createOthersSettingsExtension()Lcom/mediatek/phone/ext/OthersSettingsExtension;
    .locals 1

    .prologue
    .line 101
    new-instance v0, Lcom/mediatek/phone/ext/OthersSettingsExtension;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/OthersSettingsExtension;-><init>()V

    return-object v0
.end method

.method public createPhoneGlobalsBroadcastReceiverExtension()Lcom/mediatek/phone/ext/PhoneGlobalsBroadcastReceiverExtension;
    .locals 1

    .prologue
    .line 93
    new-instance v0, Lcom/mediatek/phone/ext/PhoneGlobalsBroadcastReceiverExtension;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/PhoneGlobalsBroadcastReceiverExtension;-><init>()V

    return-object v0
.end method

.method public createSettingsExtension()Lcom/mediatek/phone/ext/SettingsExtension;
    .locals 1

    .prologue
    .line 109
    new-instance v0, Lcom/mediatek/phone/ext/SettingsExtension;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/SettingsExtension;-><init>()V

    return-object v0
.end method

.method public createVTCallBannerControllerExtension()Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;
    .locals 1

    .prologue
    .line 69
    new-instance v0, Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;-><init>()V

    return-object v0
.end method

.method public createVTInCallScreenExtension()Lcom/mediatek/phone/ext/VTInCallScreenExtension;
    .locals 1

    .prologue
    .line 77
    new-instance v0, Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;-><init>()V

    return-object v0
.end method

.method public createVTInCallScreenFlagsExtension()Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtension;
    .locals 1

    .prologue
    .line 85
    new-instance v0, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtension;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtension;-><init>()V

    return-object v0
.end method
