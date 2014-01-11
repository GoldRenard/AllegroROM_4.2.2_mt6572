.class Lcom/google/common/collect/Multisets$ElementSet$1;
.super Ljava/lang/Object;
.source "Multisets.java"

# interfaces
.implements Lcom/google/common/base/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Multisets$ElementSet;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/base/Function",
        "<",
        "Lcom/google/common/collect/Multiset$Entry",
        "<TE;>;TE;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/Multisets$ElementSet;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Multisets$ElementSet;)V
    .locals 0
    .parameter

    .prologue
    .line 824
    .local p0, this:Lcom/google/common/collect/Multisets$ElementSet$1;,"Lcom/google/common/collect/Multisets$ElementSet.1;"
    iput-object p1, p0, Lcom/google/common/collect/Multisets$ElementSet$1;->this$0:Lcom/google/common/collect/Multisets$ElementSet;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lcom/google/common/collect/Multiset$Entry;)Ljava/lang/Object;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;)TE;"
        }
    .end annotation

    .prologue
    .line 826
    .local p0, this:Lcom/google/common/collect/Multisets$ElementSet$1;,"Lcom/google/common/collect/Multisets$ElementSet.1;"
    .local p1, entry:Lcom/google/common/collect/Multiset$Entry;,"Lcom/google/common/collect/Multiset$Entry<TE;>;"
    invoke-interface {p1}, Lcom/google/common/collect/Multiset$Entry;->getElement()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 824
    .local p0, this:Lcom/google/common/collect/Multisets$ElementSet$1;,"Lcom/google/common/collect/Multisets$ElementSet.1;"
    check-cast p1, Lcom/google/common/collect/Multiset$Entry;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Multisets$ElementSet$1;->apply(Lcom/google/common/collect/Multiset$Entry;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
