.class public final Lcom/mediatek/phone/ext/ExtensionManager;
.super Ljava/lang/Object;
.source "ExtensionManager.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "ExtensionManager"

.field private static sInstance:Lcom/mediatek/phone/ext/ExtensionManager;


# instance fields
.field private mIPhonePluginList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/mediatek/phone/ext/IPhonePlugin;",
            ">;"
        }
    .end annotation
.end field

.field private mPhonePluginExtContainer:Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 56
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/ext/ExtensionManager;->mPhonePluginExtContainer:Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;

    .line 58
    invoke-direct {p0}, Lcom/mediatek/phone/ext/ExtensionManager;->initContainerByPlugin()V

    .line 59
    return-void
.end method

.method public static getInstance()Lcom/mediatek/phone/ext/ExtensionManager;
    .locals 1

    .prologue
    .line 66
    sget-object v0, Lcom/mediatek/phone/ext/ExtensionManager;->sInstance:Lcom/mediatek/phone/ext/ExtensionManager;

    if-nez v0, :cond_0

    .line 67
    new-instance v0, Lcom/mediatek/phone/ext/ExtensionManager;

    invoke-direct {v0}, Lcom/mediatek/phone/ext/ExtensionManager;-><init>()V

    sput-object v0, Lcom/mediatek/phone/ext/ExtensionManager;->sInstance:Lcom/mediatek/phone/ext/ExtensionManager;

    .line 69
    :cond_0
    sget-object v0, Lcom/mediatek/phone/ext/ExtensionManager;->sInstance:Lcom/mediatek/phone/ext/ExtensionManager;

    return-object v0
.end method

.method private initContainerByPlugin()V
    .locals 8

    .prologue
    .line 152
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v5

    const-class v6, Lcom/mediatek/phone/ext/IPhonePlugin;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    new-array v7, v7, [Landroid/content/pm/Signature;

    invoke-static {v5, v6, v7}, Lcom/mediatek/pluginmanager/PluginManager;->create(Landroid/content/Context;Ljava/lang/String;[Landroid/content/pm/Signature;)Lcom/mediatek/pluginmanager/PluginManager;

    move-result-object v4

    .line 155
    .local v4, pm:Lcom/mediatek/pluginmanager/PluginManager;,"Lcom/mediatek/pluginmanager/PluginManager<Lcom/mediatek/phone/ext/IPhonePlugin;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    :try_start_0
    invoke-virtual {v4}, Lcom/mediatek/pluginmanager/PluginManager;->getPluginCount()I

    move-result v5

    if-ge v1, v5, :cond_2

    .line 156
    invoke-virtual {v4, v1}, Lcom/mediatek/pluginmanager/PluginManager;->getPlugin(I)Lcom/mediatek/pluginmanager/Plugin;

    move-result-object v3

    .line 157
    .local v3, plugIn:Lcom/mediatek/pluginmanager/Plugin;,"Lcom/mediatek/pluginmanager/Plugin<Lcom/mediatek/phone/ext/IPhonePlugin;>;"
    if-eqz v3, :cond_1

    .line 158
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "create plugin object, number = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    add-int/lit8 v6, v1, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/phone/ext/ExtensionManager;->log(Ljava/lang/String;)V

    .line 159
    invoke-virtual {v3}, Lcom/mediatek/pluginmanager/Plugin;->createObject()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/phone/ext/IPhonePlugin;

    .line 160
    .local v2, phonePluginObject:Lcom/mediatek/phone/ext/IPhonePlugin;
    iget-object v5, p0, Lcom/mediatek/phone/ext/ExtensionManager;->mPhonePluginExtContainer:Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;

    invoke-virtual {v5, v2}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->addExtensions(Lcom/mediatek/phone/ext/IPhonePlugin;)V

    .line 161
    iget-object v5, p0, Lcom/mediatek/phone/ext/ExtensionManager;->mIPhonePluginList:Ljava/util/LinkedList;

    if-nez v5, :cond_0

    .line 162
    const-string v5, "create mIPhonePluglist"

    invoke-static {v5}, Lcom/mediatek/phone/ext/ExtensionManager;->log(Ljava/lang/String;)V

    .line 163
    new-instance v5, Ljava/util/LinkedList;

    invoke-direct {v5}, Ljava/util/LinkedList;-><init>()V

    iput-object v5, p0, Lcom/mediatek/phone/ext/ExtensionManager;->mIPhonePluginList:Ljava/util/LinkedList;

    .line 165
    :cond_0
    iget-object v5, p0, Lcom/mediatek/phone/ext/ExtensionManager;->mIPhonePluginList:Ljava/util/LinkedList;

    invoke-virtual {v5, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 155
    .end local v2           #phonePluginObject:Lcom/mediatek/phone/ext/IPhonePlugin;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 168
    .end local v3           #plugIn:Lcom/mediatek/pluginmanager/Plugin;,"Lcom/mediatek/pluginmanager/Plugin<Lcom/mediatek/phone/ext/IPhonePlugin;>;"
    :catch_0
    move-exception v0

    .line 169
    .local v0, e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    const-string v5, "create plugin object failed"

    invoke-static {v5}, Lcom/mediatek/phone/ext/ExtensionManager;->log(Ljava/lang/String;)V

    .line 170
    invoke-virtual {v0}, Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;->printStackTrace()V

    .line 172
    .end local v0           #e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    :cond_2
    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 175
    const-string v0, "ExtensionManager"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    return-void
.end method


# virtual methods
.method public getCallCardExtension()Lcom/mediatek/phone/ext/CallCardExtension;
    .locals 1

    .prologue
    .line 85
    const-string v0, "getCallCardExtension()"

    invoke-static {v0}, Lcom/mediatek/phone/ext/ExtensionManager;->log(Ljava/lang/String;)V

    .line 86
    iget-object v0, p0, Lcom/mediatek/phone/ext/ExtensionManager;->mPhonePluginExtContainer:Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;

    invoke-virtual {v0}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->getCallCardExtension()Lcom/mediatek/phone/ext/CallCardExtension;

    move-result-object v0

    return-object v0
.end method

.method public getInCallScreenExtension()Lcom/mediatek/phone/ext/InCallScreenExtension;
    .locals 1

    .prologue
    .line 77
    const-string v0, "getInCallScreenExtension()"

    invoke-static {v0}, Lcom/mediatek/phone/ext/ExtensionManager;->log(Ljava/lang/String;)V

    .line 78
    iget-object v0, p0, Lcom/mediatek/phone/ext/ExtensionManager;->mPhonePluginExtContainer:Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;

    invoke-virtual {v0}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->getInCallScreenExtension()Lcom/mediatek/phone/ext/InCallScreenExtension;

    move-result-object v0

    return-object v0
.end method

.method public getInCallTouchUiExtension()Lcom/mediatek/phone/ext/InCallTouchUiExtension;
    .locals 1

    .prologue
    .line 94
    const-string v0, "getInCallTouchUiExtension()"

    invoke-static {v0}, Lcom/mediatek/phone/ext/ExtensionManager;->log(Ljava/lang/String;)V

    .line 95
    iget-object v0, p0, Lcom/mediatek/phone/ext/ExtensionManager;->mPhonePluginExtContainer:Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;

    invoke-virtual {v0}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->getInCallTouchUiExtension()Lcom/mediatek/phone/ext/InCallTouchUiExtension;

    move-result-object v0

    return-object v0
.end method

.method public getOthersSettingsExtension()Lcom/mediatek/phone/ext/OthersSettingsExtension;
    .locals 1

    .prologue
    .line 138
    const-string v0, "getOthersSettingsExtension()"

    invoke-static {v0}, Lcom/mediatek/phone/ext/ExtensionManager;->log(Ljava/lang/String;)V

    .line 139
    iget-object v0, p0, Lcom/mediatek/phone/ext/ExtensionManager;->mPhonePluginExtContainer:Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;

    invoke-virtual {v0}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->getOthersSettingsExtension()Lcom/mediatek/phone/ext/OthersSettingsExtension;

    move-result-object v0

    return-object v0
.end method

.method public getPhoneGlobalsBroadcastReceiverExtension()Lcom/mediatek/phone/ext/PhoneGlobalsBroadcastReceiverExtension;
    .locals 1

    .prologue
    .line 129
    const-string v0, "PhoneGlobalsBroadcastReceiverExtension()"

    invoke-static {v0}, Lcom/mediatek/phone/ext/ExtensionManager;->log(Ljava/lang/String;)V

    .line 130
    iget-object v0, p0, Lcom/mediatek/phone/ext/ExtensionManager;->mPhonePluginExtContainer:Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;

    invoke-virtual {v0}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->getPhoneGlobalsBroadcastReceiverExtension()Lcom/mediatek/phone/ext/PhoneGlobalsBroadcastReceiverExtension;

    move-result-object v0

    return-object v0
.end method

.method public getSettingsExtension()Lcom/mediatek/phone/ext/SettingsExtension;
    .locals 1

    .prologue
    .line 147
    const-string v0, "getSettingsExtension()"

    invoke-static {v0}, Lcom/mediatek/phone/ext/ExtensionManager;->log(Ljava/lang/String;)V

    .line 148
    iget-object v0, p0, Lcom/mediatek/phone/ext/ExtensionManager;->mPhonePluginExtContainer:Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;

    invoke-virtual {v0}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->getSettingsExtension()Lcom/mediatek/phone/ext/SettingsExtension;

    move-result-object v0

    return-object v0
.end method

.method public getVTCallBannerControllerExtension()Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;
    .locals 1

    .prologue
    .line 111
    const-string v0, "getVTCallBannerControllerExtension()"

    invoke-static {v0}, Lcom/mediatek/phone/ext/ExtensionManager;->log(Ljava/lang/String;)V

    .line 112
    iget-object v0, p0, Lcom/mediatek/phone/ext/ExtensionManager;->mPhonePluginExtContainer:Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;

    invoke-virtual {v0}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->getVTCallBannerControllerExtension()Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;

    move-result-object v0

    return-object v0
.end method

.method public getVTInCallScreenExtension()Lcom/mediatek/phone/ext/VTInCallScreenExtension;
    .locals 1

    .prologue
    .line 103
    const-string v0, "getVTInCallScreenExtension()"

    invoke-static {v0}, Lcom/mediatek/phone/ext/ExtensionManager;->log(Ljava/lang/String;)V

    .line 104
    iget-object v0, p0, Lcom/mediatek/phone/ext/ExtensionManager;->mPhonePluginExtContainer:Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;

    invoke-virtual {v0}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->getVTInCallScreenExtension()Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    move-result-object v0

    return-object v0
.end method

.method public getVTInCallScreenFlagsExtension()Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtension;
    .locals 1

    .prologue
    .line 120
    const-string v0, "getVTInCallScreenFlagsExtension()"

    invoke-static {v0}, Lcom/mediatek/phone/ext/ExtensionManager;->log(Ljava/lang/String;)V

    .line 121
    iget-object v0, p0, Lcom/mediatek/phone/ext/ExtensionManager;->mPhonePluginExtContainer:Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;

    invoke-virtual {v0}, Lcom/mediatek/phone/ext/PhonePluginExtensionContainer;->getVTInCallScreenFlagsExtension()Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtension;

    move-result-object v0

    return-object v0
.end method
