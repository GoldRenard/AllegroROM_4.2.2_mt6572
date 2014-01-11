.class public final Lcom/google/common/hash/Funnels;
.super Ljava/lang/Object;
.source "Funnels.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/hash/Funnels$StringFunnel;,
        Lcom/google/common/hash/Funnels$ByteArrayFunnel;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static byteArrayFunnel()Lcom/google/common/hash/Funnel;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/hash/Funnel",
            "<[B>;"
        }
    .end annotation

    .prologue
    .line 33
    sget-object v0, Lcom/google/common/hash/Funnels$ByteArrayFunnel;->INSTANCE:Lcom/google/common/hash/Funnels$ByteArrayFunnel;

    return-object v0
.end method

.method public static stringFunnel()Lcom/google/common/hash/Funnel;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/hash/Funnel",
            "<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation

    .prologue
    .line 52
    sget-object v0, Lcom/google/common/hash/Funnels$StringFunnel;->INSTANCE:Lcom/google/common/hash/Funnels$StringFunnel;

    return-object v0
.end method
