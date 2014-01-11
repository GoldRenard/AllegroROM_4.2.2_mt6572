.class Lcom/google/common/cache/LocalCache$StrongValueReference;
.super Ljava/lang/Object;
.source "LocalCache.java"

# interfaces
.implements Lcom/google/common/cache/LocalCache$ValueReference;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/LocalCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "StrongValueReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/common/cache/LocalCache$ValueReference",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field final referent:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .prologue
    .line 1731
    .local p0, this:Lcom/google/common/cache/LocalCache$StrongValueReference;,"Lcom/google/common/cache/LocalCache$StrongValueReference<TK;TV;>;"
    .local p1, referent:Ljava/lang/Object;,"TV;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 1732
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$StrongValueReference;->referent:Ljava/lang/Object;

    .line 1733
    return-void
.end method


# virtual methods
.method public copyFor(Ljava/lang/ref/ReferenceQueue;Lcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ValueReference;
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/ReferenceQueue",
            "<TV;>;",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;)",
            "Lcom/google/common/cache/LocalCache$ValueReference",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 1752
    .local p0, this:Lcom/google/common/cache/LocalCache$StrongValueReference;,"Lcom/google/common/cache/LocalCache$StrongValueReference<TK;TV;>;"
    .local p1, queue:Ljava/lang/ref/ReferenceQueue;,"Ljava/lang/ref/ReferenceQueue<TV;>;"
    .local p2, entry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    return-object p0
.end method

.method public get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .prologue
    .line 1737
    .local p0, this:Lcom/google/common/cache/LocalCache$StrongValueReference;,"Lcom/google/common/cache/LocalCache$StrongValueReference<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$StrongValueReference;->referent:Ljava/lang/Object;

    return-object v0
.end method

.method public getEntry()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 1747
    .local p0, this:Lcom/google/common/cache/LocalCache$StrongValueReference;,"Lcom/google/common/cache/LocalCache$StrongValueReference<TK;TV;>;"
    const/4 v0, 0x0

    return-object v0
.end method

.method public getWeight()I
    .locals 1

    .prologue
    .line 1742
    .local p0, this:Lcom/google/common/cache/LocalCache$StrongValueReference;,"Lcom/google/common/cache/LocalCache$StrongValueReference<TK;TV;>;"
    const/4 v0, 0x1

    return v0
.end method

.method public isActive()Z
    .locals 1

    .prologue
    .line 1762
    .local p0, this:Lcom/google/common/cache/LocalCache$StrongValueReference;,"Lcom/google/common/cache/LocalCache$StrongValueReference<TK;TV;>;"
    const/4 v0, 0x1

    return v0
.end method

.method public isLoading()Z
    .locals 1

    .prologue
    .line 1757
    .local p0, this:Lcom/google/common/cache/LocalCache$StrongValueReference;,"Lcom/google/common/cache/LocalCache$StrongValueReference<TK;TV;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public notifyNewValue(Ljava/lang/Object;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .prologue
    .line 1771
    .local p0, this:Lcom/google/common/cache/LocalCache$StrongValueReference;,"Lcom/google/common/cache/LocalCache$StrongValueReference<TK;TV;>;"
    .local p1, newValue:Ljava/lang/Object;,"TV;"
    return-void
.end method

.method public waitForValue()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .prologue
    .line 1767
    .local p0, this:Lcom/google/common/cache/LocalCache$StrongValueReference;,"Lcom/google/common/cache/LocalCache$StrongValueReference<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$StrongValueReference;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
