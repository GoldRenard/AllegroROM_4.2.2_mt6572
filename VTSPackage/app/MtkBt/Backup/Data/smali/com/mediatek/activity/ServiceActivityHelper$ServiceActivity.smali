.class public interface abstract Lcom/mediatek/activity/ServiceActivityHelper$ServiceActivity;
.super Ljava/lang/Object;
.source "ServiceActivityHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/activity/ServiceActivityHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ServiceActivity"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ServiceInterface:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract asInterface(Landroid/os/IBinder;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/IBinder;",
            ")TServiceInterface;"
        }
    .end annotation
.end method

.method public abstract getServiceAction()Ljava/lang/String;
.end method

.method public abstract onServiceConnected()V
.end method

.method public abstract onServiceDisconnected()V
.end method

.method public abstract refreshActivityUi()V
.end method
