.class Lcom/google/common/util/concurrent/Futures$ListFuture$1;
.super Ljava/lang/Object;
.source "Futures.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/util/concurrent/Futures$ListFuture;->init(Ljava/util/concurrent/Executor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/util/concurrent/Futures$ListFuture;


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/Futures$ListFuture;)V
    .locals 0
    .parameter

    .prologue
    .line 1304
    .local p0, this:Lcom/google/common/util/concurrent/Futures$ListFuture$1;,"Lcom/google/common/util/concurrent/Futures$ListFuture.1;"
    iput-object p1, p0, Lcom/google/common/util/concurrent/Futures$ListFuture$1;->this$0:Lcom/google/common/util/concurrent/Futures$ListFuture;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .local p0, this:Lcom/google/common/util/concurrent/Futures$ListFuture$1;,"Lcom/google/common/util/concurrent/Futures$ListFuture.1;"
    const/4 v1, 0x0

    .line 1309
    iget-object v0, p0, Lcom/google/common/util/concurrent/Futures$ListFuture$1;->this$0:Lcom/google/common/util/concurrent/Futures$ListFuture;

    iput-object v1, v0, Lcom/google/common/util/concurrent/Futures$ListFuture;->values:Ljava/util/List;

    .line 1312
    iget-object v0, p0, Lcom/google/common/util/concurrent/Futures$ListFuture$1;->this$0:Lcom/google/common/util/concurrent/Futures$ListFuture;

    iput-object v1, v0, Lcom/google/common/util/concurrent/Futures$ListFuture;->futures:Lcom/google/common/collect/ImmutableList;

    .line 1313
    return-void
.end method
