.class public interface abstract Lcom/android/systemui/statusbar/policy/NetworkController$SignalCluster;
.super Ljava/lang/Object;
.source "NetworkController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/policy/NetworkController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "SignalCluster"
.end annotation


# virtual methods
.method public abstract setIsAirplaneMode(ZI)V
.end method

.method public abstract setMobileDataIndicators(ZLcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;ILjava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract setRoamingFlagandResource(ZI)V
.end method

.method public abstract setShowSimIndicator(ZI)V
.end method

.method public abstract setWifiIndicators(ZIILjava/lang/String;)V
.end method
