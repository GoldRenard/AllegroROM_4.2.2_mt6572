.class public interface abstract Lcom/mediatek/FMRadio/FMRecorder$OnRecorderStateChangedListener;
.super Ljava/lang/Object;
.source "FMRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/FMRadio/FMRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnRecorderStateChangedListener"
.end annotation


# virtual methods
.method public abstract onPlayRecordFileComplete()V
.end method

.method public abstract onRecorderError(I)V
.end method

.method public abstract onRecorderStateChanged(I)V
.end method
