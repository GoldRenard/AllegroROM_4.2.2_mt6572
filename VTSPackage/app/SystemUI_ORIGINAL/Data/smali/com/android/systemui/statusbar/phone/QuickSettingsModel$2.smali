.class Lcom/android/systemui/statusbar/phone/QuickSettingsModel$2;
.super Lcom/android/systemui/statusbar/policy/CurrentUserTracker;
.source "QuickSettingsModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/phone/QuickSettingsModel;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/phone/QuickSettingsModel;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/phone/QuickSettingsModel;Landroid/content/Context;)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    .line 205
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/QuickSettingsModel$2;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettingsModel;

    invoke-direct {p0, p2}, Lcom/android/systemui/statusbar/policy/CurrentUserTracker;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 208
    invoke-super {p0, p1, p2}, Lcom/android/systemui/statusbar/policy/CurrentUserTracker;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    .line 209
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/QuickSettingsModel$2;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettingsModel;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/phone/QuickSettingsModel;->onUserSwitched()V

    .line 210
    return-void
.end method
