.class public Lcom/mediatek/phone/ext/InCallScreenExtension;
.super Ljava/lang/Object;
.source "InCallScreenExtension.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public dismissDialogs()Z
    .locals 1

    .prologue
    .line 127
    const/4 v0, 0x0

    return v0
.end method

.method public handleOnScreenMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "menuItem"

    .prologue
    .line 62
    const/4 v0, 0x0

    return v0
.end method

.method public handleOnscreenButtonClick(I)Z
    .locals 1
    .parameter "id"

    .prologue
    .line 119
    const/4 v0, 0x0

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;Landroid/app/Activity;Lcom/mediatek/phone/ext/IInCallScreen;Lcom/android/internal/telephony/CallManager;)V
    .locals 0
    .parameter "icicle"
    .parameter "inCallScreenActivity"
    .parameter "inCallScreenHost"
    .parameter "cm"

    .prologue
    .line 85
    return-void
.end method

.method public onDestroy(Landroid/app/Activity;)V
    .locals 0
    .parameter "inCallScreen"

    .prologue
    .line 93
    return-void
.end method

.method public onDisconnect(Lcom/android/internal/telephony/Connection;)Z
    .locals 1
    .parameter "cn"

    .prologue
    .line 101
    const/4 v0, 0x0

    return v0
.end method

.method public onPhoneStateChanged(Lcom/android/internal/telephony/CallManager;)Z
    .locals 1
    .parameter "cm"

    .prologue
    .line 110
    const/4 v0, 0x0

    return v0
.end method

.method public setupMenuItems(Landroid/view/Menu;Lcom/mediatek/phone/ext/IInCallControlState;)V
    .locals 0
    .parameter "menu"
    .parameter "inCallControlState"

    .prologue
    .line 54
    return-void
.end method

.method public updateScreen(Lcom/android/internal/telephony/CallManager;Z)Z
    .locals 1
    .parameter "callManager"
    .parameter "isForegroundActivity"

    .prologue
    .line 72
    const/4 v0, 0x0

    return v0
.end method
