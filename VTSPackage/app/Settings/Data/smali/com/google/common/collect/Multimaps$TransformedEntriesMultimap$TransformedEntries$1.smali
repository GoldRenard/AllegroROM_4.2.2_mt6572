.class Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1;
.super Ljava/lang/Object;
.source "Multimaps.java"

# interfaces
.implements Lcom/google/common/base/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries;-><init>(Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;Lcom/google/common/collect/Maps$EntryTransformer;)V
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
        "Ljava/util/Map$Entry",
        "<TK;TV1;>;",
        "Ljava/util/Map$Entry",
        "<TK;TV2;>;>;"
    }
.end annotation


# instance fields
.field final synthetic val$this$0:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;

.field final synthetic val$transformer:Lcom/google/common/collect/Maps$EntryTransformer;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;Lcom/google/common/collect/Maps$EntryTransformer;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1473
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries.1;"
    iput-object p1, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1;->val$this$0:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;

    iput-object p2, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1;->val$transformer:Lcom/google/common/collect/Maps$EntryTransformer;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 1473
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries.1;"
    check-cast p1, Ljava/util/Map$Entry;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1;->apply(Ljava/util/Map$Entry;)Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public apply(Ljava/util/Map$Entry;)Ljava/util/Map$Entry;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<TK;TV1;>;)",
            "Ljava/util/Map$Entry",
            "<TK;TV2;>;"
        }
    .end annotation

    .prologue
    .line 1475
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries.1;"
    .local p1, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;TV1;>;"
    new-instance v0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1$1;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1$1;-><init>(Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1;Ljava/util/Map$Entry;)V

    return-object v0
.end method
