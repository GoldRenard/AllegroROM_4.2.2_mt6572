.class Lcom/google/common/collect/Multisets$SetMultiset$1$1;
.super Ljava/lang/Object;
.source "Multisets.java"

# interfaces
.implements Lcom/google/common/base/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Multisets$SetMultiset$1;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/base/Function",
        "<TE;",
        "Lcom/google/common/collect/Multiset$Entry",
        "<TE;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/common/collect/Multisets$SetMultiset$1;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Multisets$SetMultiset$1;)V
    .locals 0
    .parameter

    .prologue
    .line 391
    .local p0, this:Lcom/google/common/collect/Multisets$SetMultiset$1$1;,"Lcom/google/common/collect/Multisets$SetMultiset$1.1;"
    iput-object p1, p0, Lcom/google/common/collect/Multisets$SetMultiset$1$1;->this$1:Lcom/google/common/collect/Multisets$SetMultiset$1;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Ljava/lang/Object;)Lcom/google/common/collect/Multiset$Entry;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 393
    .local p0, this:Lcom/google/common/collect/Multisets$SetMultiset$1$1;,"Lcom/google/common/collect/Multisets$SetMultiset$1.1;"
    .local p1, elem:Ljava/lang/Object;,"TE;"
    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/google/common/collect/Multisets;->immutableEntry(Ljava/lang/Object;I)Lcom/google/common/collect/Multiset$Entry;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 391
    .local p0, this:Lcom/google/common/collect/Multisets$SetMultiset$1$1;,"Lcom/google/common/collect/Multisets$SetMultiset$1.1;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Multisets$SetMultiset$1$1;->apply(Ljava/lang/Object;)Lcom/google/common/collect/Multiset$Entry;

    move-result-object v0

    return-object v0
.end method
