.class Lcom/android/systemui/statusbar/policy/CircleBattery$SettingsObserver;
.super Landroid/database/ContentObserver;
.source "CircleBattery.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/policy/CircleBattery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SettingsObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/policy/CircleBattery;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/policy/CircleBattery;Landroid/os/Handler;)V
    .locals 0
    .parameter
    .parameter "handler"

    .prologue
    .line 69
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery$SettingsObserver;->this$0:Lcom/android/systemui/statusbar/policy/CircleBattery;

    .line 70
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 71
    return-void
.end method


# virtual methods
.method public observe()V
    .locals 3

    .prologue
    .line 74
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery$SettingsObserver;->this$0:Lcom/android/systemui/statusbar/policy/CircleBattery;

    #getter for: Lcom/android/systemui/statusbar/policy/CircleBattery;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/CircleBattery;->access$200(Lcom/android/systemui/statusbar/policy/CircleBattery;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 75
    .local v0, resolver:Landroid/content/ContentResolver;
    const-string v1, "status_bar_battery"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 76
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/policy/CircleBattery$SettingsObserver;->onChange(Z)V

    .line 77
    return-void
.end method

.method public onChange(Z)V
    .locals 1
    .parameter "selfChange"

    .prologue
    .line 85
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery$SettingsObserver;->this$0:Lcom/android/systemui/statusbar/policy/CircleBattery;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->updateSettings()V

    .line 86
    return-void
.end method

.method public unobserve()V
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery$SettingsObserver;->this$0:Lcom/android/systemui/statusbar/policy/CircleBattery;

    #getter for: Lcom/android/systemui/statusbar/policy/CircleBattery;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->access$200(Lcom/android/systemui/statusbar/policy/CircleBattery;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 81
    return-void
.end method
