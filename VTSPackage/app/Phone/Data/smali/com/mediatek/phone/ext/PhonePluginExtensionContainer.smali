.class public Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;
.super Ljava/lang/Object;
.source "PhonePluginExtensionContainer.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "PhonePluginExtensionContainer"


# instance fields
.field private mCallCardExtensionContainer:Lcom/mediatek/phone/ext/CallCardExtensionContainer;

.field private mInCallScreenExtensionContainer:Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;

.field private mInCallTouchUiExtensionContainer:Lcom/mediatek/phone/ext/InCallTouchUiExtensionContainer;

.field private mOthersSettingsExtension:Lcom/mediatek/phone/ext/OthersSettingsExtension;

.field private mPhoneGlobalsBroadcastReceiverExtensionContainer:Lcom/mediatek/phone/ext/PhoneGlobalsBroadcastReceiverExtensionContainer;

.field private mSettingsExtension:Lcom/mediatek/phone/ext/SettingsExtension;

.field private mVTCallBannerControllerExtensionContainer:Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;

.field private mVTInCallScreenExtensionContainer:Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;

.field private mVTInCallScreenFlagsExtensionContainer:Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 55
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mInCallScreenExtensionContainer:Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;

    .line 57
    new-instance v0, Lcom/mediatek/phone/ext/CallCardExtensionContainer;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/CallCardExtensionContainer;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mCallCardExtensionContainer:Lcom/mediatek/phone/ext/CallCardExtensionContainer;

    .line 58
    new-instance v0, Lcom/mediatek/phone/ext/InCallTouchUiExtensionContainer;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/InCallTouchUiExtensionContainer;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mInCallTouchUiExtensionContainer:Lcom/mediatek/phone/ext/InCallTouchUiExtensionContainer;

    .line 59
    new-instance v0, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mVTCallBannerControllerExtensionContainer:Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;

    .line 60
    new-instance v0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mVTInCallScreenExtensionContainer:Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;

    .line 61
    new-instance v0, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mVTInCallScreenFlagsExtensionContainer:Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;

    .line 62
    new-instance v0, Lcom/mediatek/phone/ext/PhoneGlobalsBroadcastReceiverExtensionContainer;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/PhoneGlobalsBroadcastReceiverExtensionContainer;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mPhoneGlobalsBroadcastReceiverExtensionContainer:Lcom/mediatek/phone/ext/PhoneGlobalsBroadcastReceiverExtensionContainer;

    .line 63
    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 174
    const-string v0, "PhonePluginExtensionContainer"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    return-void
.end method


# virtual methods
.method public addExtensions(Lcom/mediatek/phone/ext/IPhonePlugin;)V
    .locals 2
    .parameter "phonePlugin"

    .prologue
    .line 155
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "addExtensions, phone plugin object is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->log(Ljava/lang/String;)V

    .line 157
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mInCallScreenExtensionContainer:Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;

    invoke-interface {p1}, Lcom/mediatek/phone/ext/IPhonePlugin;->createInCallScreenExtension()Lcom/mediatek/phone/ext/InCallScreenExtension;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->add(Lcom/mediatek/phone/ext/InCallScreenExtension;)V

    .line 158
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mCallCardExtensionContainer:Lcom/mediatek/phone/ext/CallCardExtensionContainer;

    invoke-interface {p1}, Lcom/mediatek/phone/ext/IPhonePlugin;->createCallCardExtension()Lcom/mediatek/phone/ext/CallCardExtension;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->add(Lcom/mediatek/phone/ext/CallCardExtension;)V

    .line 159
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mInCallTouchUiExtensionContainer:Lcom/mediatek/phone/ext/InCallTouchUiExtensionContainer;

    invoke-interface {p1}, Lcom/mediatek/phone/ext/IPhonePlugin;->createInCallTouchUiExtension()Lcom/mediatek/phone/ext/InCallTouchUiExtension;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/ext/InCallTouchUiExtensionContainer;->add(Lcom/mediatek/phone/ext/InCallTouchUiExtension;)V

    .line 160
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mVTCallBannerControllerExtensionContainer:Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;

    invoke-interface {p1}, Lcom/mediatek/phone/ext/IPhonePlugin;->createVTCallBannerControllerExtension()Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->add(Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;)V

    .line 161
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mVTInCallScreenExtensionContainer:Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;

    invoke-interface {p1}, Lcom/mediatek/phone/ext/IPhonePlugin;->createVTInCallScreenExtension()Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->add(Lcom/mediatek/phone/ext/VTInCallScreenExtension;)V

    .line 162
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mVTInCallScreenFlagsExtensionContainer:Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;

    invoke-interface {p1}, Lcom/mediatek/phone/ext/IPhonePlugin;->createVTInCallScreenFlagsExtension()Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtension;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;->add(Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtension;)V

    .line 163
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mPhoneGlobalsBroadcastReceiverExtensionContainer:Lcom/mediatek/phone/ext/PhoneGlobalsBroadcastReceiverExtensionContainer;

    invoke-interface {p1}, Lcom/mediatek/phone/ext/IPhonePlugin;->createPhoneGlobalsBroadcastReceiverExtension()Lcom/mediatek/phone/ext/PhoneGlobalsBroadcastReceiverExtension;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/ext/PhoneGlobalsBroadcastReceiverExtensionContainer;->add(Lcom/mediatek/phone/ext/PhoneGlobalsBroadcastReceiverExtension;)V

    .line 165
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mOthersSettingsExtension:Lcom/mediatek/phone/ext/OthersSettingsExtension;

    if-nez v0, :cond_0

    .line 166
    invoke-interface {p1}, Lcom/mediatek/phone/ext/IPhonePlugin;->createOthersSettingsExtension()Lcom/mediatek/phone/ext/OthersSettingsExtension;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mOthersSettingsExtension:Lcom/mediatek/phone/ext/OthersSettingsExtension;

    .line 168
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mSettingsExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    if-nez v0, :cond_1

    .line 169
    invoke-interface {p1}, Lcom/mediatek/phone/ext/IPhonePlugin;->createSettingsExtension()Lcom/mediatek/phone/ext/SettingsExtension;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mSettingsExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    .line 171
    :cond_1
    return-void
.end method

.method public getCallCardExtension()Lcom/mediatek/phone/ext/CallCardExtension;
    .locals 1

    .prologue
    .line 79
    const-string v0, "getCallCardExtension()"

    invoke-static {v0}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->log(Ljava/lang/String;)V

    .line 80
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mCallCardExtensionContainer:Lcom/mediatek/phone/ext/CallCardExtensionContainer;

    return-object v0
.end method

.method public getInCallScreenExtension()Lcom/mediatek/phone/ext/InCallScreenExtension;
    .locals 1

    .prologue
    .line 70
    const-string v0, "getInCallScreenExtension()"

    invoke-static {v0}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->log(Ljava/lang/String;)V

    .line 71
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mInCallScreenExtensionContainer:Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;

    return-object v0
.end method

.method public getInCallTouchUiExtension()Lcom/mediatek/phone/ext/InCallTouchUiExtension;
    .locals 1

    .prologue
    .line 88
    const-string v0, "getInCallTouchUiExtension()"

    invoke-static {v0}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->log(Ljava/lang/String;)V

    .line 89
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mInCallTouchUiExtensionContainer:Lcom/mediatek/phone/ext/InCallTouchUiExtensionContainer;

    return-object v0
.end method

.method public getOthersSettingsExtension()Lcom/mediatek/phone/ext/OthersSettingsExtension;
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mOthersSettingsExtension:Lcom/mediatek/phone/ext/OthersSettingsExtension;

    if-nez v0, :cond_0

    .line 134
    new-instance v0, Lcom/mediatek/phone/ext/OthersSettingsExtension;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/OthersSettingsExtension;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mOthersSettingsExtension:Lcom/mediatek/phone/ext/OthersSettingsExtension;

    .line 136
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mOthersSettingsExtension:Lcom/mediatek/phone/ext/OthersSettingsExtension;

    return-object v0
.end method

.method public getPhoneGlobalsBroadcastReceiverExtension()Lcom/mediatek/phone/ext/PhoneGlobalsBroadcastReceiverExtension;
    .locals 1

    .prologue
    .line 124
    const-string v0, "getPhoneGlobalsBroadcastReceiverExtension()"

    invoke-static {v0}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->log(Ljava/lang/String;)V

    .line 125
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mPhoneGlobalsBroadcastReceiverExtensionContainer:Lcom/mediatek/phone/ext/PhoneGlobalsBroadcastReceiverExtensionContainer;

    return-object v0
.end method

.method public getSettingsExtension()Lcom/mediatek/phone/ext/SettingsExtension;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mSettingsExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    if-nez v0, :cond_0

    .line 145
    new-instance v0, Lcom/mediatek/phone/ext/SettingsExtension;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/SettingsExtension;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mSettingsExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    .line 147
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mSettingsExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    return-object v0
.end method

.method public getVTCallBannerControllerExtension()Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;
    .locals 1

    .prologue
    .line 97
    const-string v0, "getVTCallBannerControllerExtension()"

    invoke-static {v0}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->log(Ljava/lang/String;)V

    .line 98
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mVTCallBannerControllerExtensionContainer:Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;

    return-object v0
.end method

.method public getVTInCallScreenExtension()Lcom/mediatek/phone/ext/VTInCallScreenExtension;
    .locals 1

    .prologue
    .line 106
    const-string v0, "getVTInCallScreenExtension()"

    invoke-static {v0}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->log(Ljava/lang/String;)V

    .line 107
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mVTInCallScreenExtensionContainer:Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;

    return-object v0
.end method

.method public getVTInCallScreenFlagsExtension()Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtension;
    .locals 1

    .prologue
    .line 115
    const-string v0, "getVTInCallScreenFlagsExtension()"

    invoke-static {v0}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->log(Ljava/lang/String;)V

    .line 116
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->mVTInCallScreenFlagsExtensionContainer:Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;

    return-object v0
.end method
