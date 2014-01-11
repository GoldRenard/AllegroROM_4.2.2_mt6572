.class final Lcom/google/common/cache/CacheBuilder$1;
.super Ljava/lang/Object;
.source "CacheBuilder.java"

# interfaces
.implements Lcom/google/common/cache/AbstractCache$StatsCounter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/CacheBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 143
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public recordEviction()V
    .locals 0

    .prologue
    .line 157
    return-void
.end method

.method public recordHits(I)V
    .locals 0
    .parameter "count"

    .prologue
    .line 145
    return-void
.end method

.method public recordLoadException(J)V
    .locals 0
    .parameter "loadTime"

    .prologue
    .line 154
    return-void
.end method

.method public recordLoadSuccess(J)V
    .locals 0
    .parameter "loadTime"

    .prologue
    .line 151
    return-void
.end method

.method public recordMisses(I)V
    .locals 0
    .parameter "count"

    .prologue
    .line 148
    return-void
.end method

.method public snapshot()Lcom/google/common/cache/CacheStats;
    .locals 1

    .prologue
    .line 161
    sget-object v0, Lcom/google/common/cache/CacheBuilder;->EMPTY_STATS:Lcom/google/common/cache/CacheStats;

    return-object v0
.end method
