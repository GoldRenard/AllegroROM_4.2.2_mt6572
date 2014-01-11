.class public Lcom/google/common/collect/AsynchronousComputationException;
.super Lcom/google/common/collect/ComputationException;
.source "AsynchronousComputationException.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final serialVersionUID:J


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0
    .parameter "cause"

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/google/common/collect/ComputationException;-><init>(Ljava/lang/Throwable;)V

    .line 35
    return-void
.end method
