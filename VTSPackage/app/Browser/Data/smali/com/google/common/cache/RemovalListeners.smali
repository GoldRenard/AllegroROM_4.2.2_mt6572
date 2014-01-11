.class public final Lcom/google/common/cache/RemovalListeners;
.super Ljava/lang/Object;
.source "RemovalListeners.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static asynchronous(Lcom/google/common/cache/RemovalListener;Ljava/util/concurrent/Executor;)Lcom/google/common/cache/RemovalListener;
    .locals 1
    .parameter
    .parameter "executor"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/cache/RemovalListener",
            "<TK;TV;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/google/common/cache/RemovalListener",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 44
    .local p0, listener:Lcom/google/common/cache/RemovalListener;,"Lcom/google/common/cache/RemovalListener<TK;TV;>;"
    new-instance v0, Lcom/google/common/cache/RemovalListeners$1;

    invoke-direct {v0, p1, p0}, Lcom/google/common/cache/RemovalListeners$1;-><init>(Ljava/util/concurrent/Executor;Lcom/google/common/cache/RemovalListener;)V

    return-object v0
.end method
