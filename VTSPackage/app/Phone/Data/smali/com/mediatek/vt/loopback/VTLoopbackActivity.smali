.class public Lcom/mediatek/vt/loopback/VTLoopbackActivity;
.super Landroid/app/Activity;
.source "VTLoopbackActivity.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "VTLoopbackActivity"


# instance fields
.field private mVTInCallScreenLoopback:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 36
    const-string v0, "VTLoopbackActivity"

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 41
    const-string v1, "VTLoopbackActivity:onCreate"

    invoke-virtual {p0, v1}, Lcom/mediatek/vt/loopback/VTLoopbackActivity;->log(Ljava/lang/String;)V

    .line 42
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 43
    const v1, 0x7f040042

    invoke-virtual {p0, v1}, Lcom/mediatek/vt/loopback/VTLoopbackActivity;->setContentView(I)V

    .line 45
    new-instance v1, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-direct {v1, p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/mediatek/vt/loopback/VTLoopbackActivity;->mVTInCallScreenLoopback:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    .line 47
    const v1, 0x7f08011f

    invoke-virtual {p0, v1}, Lcom/mediatek/vt/loopback/VTLoopbackActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewStub;

    .line 48
    .local v0, stub:Landroid/view/ViewStub;
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 49
    const v1, 0x7f08010e

    invoke-virtual {p0, v1}, Lcom/mediatek/vt/loopback/VTLoopbackActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iput-object v1, p0, Lcom/mediatek/vt/loopback/VTLoopbackActivity;->mVTInCallScreenLoopback:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    .line 50
    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTLoopbackActivity;->mVTInCallScreenLoopback:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v1, p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->setVTLoopBackInstance(Landroid/app/Activity;)V

    .line 51
    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTLoopbackActivity;->mVTInCallScreenLoopback:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->initVTInCallScreen()V

    .line 54
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/mediatek/settings/VTSettingUtils;->updateVTSettingState(I)V

    .line 55
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/settings/VTSettingUtils;->updateVTEngineerModeValues()V

    .line 57
    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTLoopbackActivity;->mVTInCallScreenLoopback:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->internalAnswerVTCallPre()V

    .line 58
    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTLoopbackActivity;->mVTInCallScreenLoopback:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    sget-object v2, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_OPEN:Lcom/android/phone/Constants$VTScreenMode;

    invoke-virtual {v1, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->setVTScreenMode(Lcom/android/phone/Constants$VTScreenMode;)V

    .line 60
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 72
    const-string v0, "VTLoopbackActivity:onDestroy()"

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTLoopbackActivity;->log(Ljava/lang/String;)V

    .line 73
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 79
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 82
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 83
    const-string v0, "VTLoopbackActivity:onResume"

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTLoopbackActivity;->log(Ljava/lang/String;)V

    .line 88
    return-void
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 64
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 65
    const-string v0, "VTLoopbackActivity:onStop"

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTLoopbackActivity;->log(Ljava/lang/String;)V

    .line 66
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTLoopbackActivity;->mVTInCallScreenLoopback:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onStop()V

    .line 67
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTLoopbackActivity;->finish()V

    .line 68
    return-void
.end method
