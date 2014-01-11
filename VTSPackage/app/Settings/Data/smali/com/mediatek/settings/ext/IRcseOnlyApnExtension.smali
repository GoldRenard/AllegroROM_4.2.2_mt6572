.class public interface abstract Lcom/mediatek/settings/ext/IRcseOnlyApnExtension;
.super Ljava/lang/Object;
.source "IRcseOnlyApnExtension.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/settings/ext/IRcseOnlyApnExtension$OnRcseOnlyApnStateChangedListener;
    }
.end annotation


# virtual methods
.method public abstract addRcseOnlyApnStateChanged(Lcom/mediatek/settings/ext/IRcseOnlyApnExtension$OnRcseOnlyApnStateChangedListener;)V
.end method

.method public abstract isRcseOnlyApnEnabled()Z
.end method

.method public abstract removeRcseOnlyApnStateChanged(Lcom/mediatek/settings/ext/IRcseOnlyApnExtension$OnRcseOnlyApnStateChangedListener;)V
.end method
