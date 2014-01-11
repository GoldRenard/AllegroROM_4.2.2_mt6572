.class Lcom/google/common/collect/Multimaps$FilteredMultimap$2;
.super Ljava/lang/Object;
.source "Multimaps.java"

# interfaces
.implements Lcom/google/common/collect/Maps$EntryTransformer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Multimaps$FilteredMultimap;->createAsMap()Ljava/util/Map;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/collect/Maps$EntryTransformer",
        "<TK;",
        "Ljava/util/Collection",
        "<TV;>;",
        "Ljava/util/Collection",
        "<TV;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Multimaps$FilteredMultimap;)V
    .locals 0
    .parameter

    .prologue
    .line 2536
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$2;,"Lcom/google/common/collect/Multimaps$FilteredMultimap.2;"
    iput-object p1, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$2;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic transformEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 2536
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$2;,"Lcom/google/common/collect/Multimaps$FilteredMultimap.2;"
    check-cast p2, Ljava/util/Collection;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/Multimaps$FilteredMultimap$2;->transformEntry(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public transformEntry(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/Collection;
    .locals 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/util/Collection",
            "<TV;>;)",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 2538
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$2;,"Lcom/google/common/collect/Multimaps$FilteredMultimap.2;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p2, collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$2;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    new-instance v1, Lcom/google/common/collect/Multimaps$FilteredMultimap$ValuePredicate;

    iget-object v2, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$2;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    invoke-direct {v1, v2, p1}, Lcom/google/common/collect/Multimaps$FilteredMultimap$ValuePredicate;-><init>(Lcom/google/common/collect/Multimaps$FilteredMultimap;Ljava/lang/Object;)V

    invoke-virtual {v0, p2, v1}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->filterCollection(Ljava/util/Collection;Lcom/google/common/base/Predicate;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
