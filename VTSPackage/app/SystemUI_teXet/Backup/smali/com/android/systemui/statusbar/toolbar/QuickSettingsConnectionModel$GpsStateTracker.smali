.class final Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;
.super Lcom/android/systemui/statusbar/util/StateTracker;
.source "QuickSettingsConnectionModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "GpsStateTracker"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;


# direct methods
.method private constructor <init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V
    .registers 2
    .parameter

    .prologue
    .line 925
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;->this$0:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;

    invoke-direct {p0}, Lcom/android/systemui/statusbar/util/StateTracker;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 925
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    return-void
.end method


# virtual methods
.method public getActualState(Landroid/content/Context;)I
    .registers 5
    .parameter "context"

    .prologue
    .line 928
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 929
    .local v1, resolver:Landroid/content/ContentResolver;
    const-string v2, "gps"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->isLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;)Z

    move-result v0

    .line 930
    .local v0, on:Z
    if-eqz v0, :cond_e

    const/4 v2, 0x1

    :goto_d
    return v2

    :cond_e
    const/4 v2, 0x0

    goto :goto_d
.end method

.method public getDisabledResource()I
    .registers 2

    .prologue
    .line 958
    const v0, 0x7f02005e

    return v0
.end method

.method public getEnabledResource()I
    .registers 2

    .prologue
    .line 962
    const v0, 0x7f02005d

    return v0
.end method

.method public getImageButtonView()Landroid/widget/ImageView;
    .registers 2

    .prologue
    .line 966
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;->this$0:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;

    invoke-static {v0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->access$3600(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;

    move-result-object v0

    return-object v0
.end method

.method public getIndicatorView()Landroid/widget/ImageView;
    .registers 2

    .prologue
    .line 975
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTileView()Landroid/view/View;
    .registers 2

    .prologue
    .line 970
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;->this$0:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;

    invoke-static {v0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->access$3700(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onActualStateChange(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 4
    .parameter "context"
    .parameter "unused"

    .prologue
    .line 937
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;->getActualState(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;->setCurrentState(Landroid/content/Context;I)V

    .line 938
    return-void
.end method

.method public requestStateChange(Landroid/content/Context;Z)V
    .registers 6
    .parameter "context"
    .parameter "desiredState"

    .prologue
    .line 942
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 943
    .local v0, resolver:Landroid/content/ContentResolver;
    new-instance v1, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker$1;

    invoke-direct {v1, p0, v0, p2, p1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker$1;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;Landroid/content/ContentResolver;ZLandroid/content/Context;)V

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v1, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 955
    return-void
.end method
