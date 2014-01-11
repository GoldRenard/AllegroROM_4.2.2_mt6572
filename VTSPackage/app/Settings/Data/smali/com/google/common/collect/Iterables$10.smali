.class final Lcom/google/common/collect/Iterables$10;
.super Lcom/google/common/collect/Iterables$IterableWithToString;
.source "Iterables.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Iterables;->skip(Ljava/lang/Iterable;I)Ljava/lang/Iterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Iterables$IterableWithToString",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic val$iterable:Ljava/lang/Iterable;

.field final synthetic val$numberToSkip:I


# direct methods
.method constructor <init>(Ljava/lang/Iterable;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 889
    iput-object p1, p0, Lcom/google/common/collect/Iterables$10;->val$iterable:Ljava/lang/Iterable;

    iput p2, p0, Lcom/google/common/collect/Iterables$10;->val$numberToSkip:I

    invoke-direct {p0}, Lcom/google/common/collect/Iterables$IterableWithToString;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 892
    iget-object v1, p0, Lcom/google/common/collect/Iterables$10;->val$iterable:Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 894
    .local v0, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<TT;>;"
    iget v1, p0, Lcom/google/common/collect/Iterables$10;->val$numberToSkip:I

    invoke-static {v0, v1}, Lcom/google/common/collect/Iterators;->skip(Ljava/util/Iterator;I)I

    .line 901
    new-instance v1, Lcom/google/common/collect/Iterables$10$1;

    invoke-direct {v1, p0, v0}, Lcom/google/common/collect/Iterables$10$1;-><init>(Lcom/google/common/collect/Iterables$10;Ljava/util/Iterator;)V

    return-object v1
.end method
