.class public Lcom/android/phone/PhoneApp;
.super Landroid/app/Application;
.source "PhoneApp.java"


# static fields
.field static final LOG_TAG:Ljava/lang/String; = "PhoneApp"


# instance fields
.field mPhoneGlobals:Lcom/android/phone/PhoneGlobals;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 35
    return-void
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .parameter "newConfig"

    .prologue
    .line 49
    iget-object v0, p0, Lcom/android/phone/PhoneApp;->mPhoneGlobals:Lcom/android/phone/PhoneGlobals;

    if-eqz v0, :cond_0

    .line 50
    iget-object v0, p0, Lcom/android/phone/PhoneApp;->mPhoneGlobals:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v0, p1}, Lcom/android/phone/PhoneGlobals;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 52
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Application;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 53
    return-void
.end method

.method public onCreate()V
    .locals 1

    .prologue
    .line 39
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v0

    if-nez v0, :cond_0

    .line 42
    new-instance v0, Lcom/android/phone/PhoneGlobals;

    invoke-direct {v0, p0}, Lcom/android/phone/PhoneGlobals;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/phone/PhoneApp;->mPhoneGlobals:Lcom/android/phone/PhoneGlobals;

    .line 43
    iget-object v0, p0, Lcom/android/phone/PhoneApp;->mPhoneGlobals:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v0}, Lcom/android/phone/PhoneGlobals;->onCreate()V

    .line 45
    :cond_0
    return-void
.end method

.method public onTerminate()V
    .locals 2

    .prologue
    .line 58
    invoke-super {p0}, Landroid/app/Application;->onTerminate()V

    .line 59
    const-string v0, "PhoneApp"

    const-string v1, "onTerminate"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    invoke-static {}, Lcom/mediatek/phone/HyphonManager;->getInstance()Lcom/mediatek/phone/HyphonManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/phone/HyphonManager;->onDestroy()V

    .line 61
    return-void
.end method
