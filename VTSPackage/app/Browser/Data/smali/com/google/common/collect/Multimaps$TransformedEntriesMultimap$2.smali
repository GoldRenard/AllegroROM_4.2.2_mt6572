.class Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$2;
.super Ljava/lang/Object;
.source "Multimaps.java"

# interfaces
.implements Lcom/google/common/collect/Maps$EntryTransformer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->asMap()Ljava/util/Map;
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
        "<TV1;>;",
        "Ljava/util/Collection",
        "<TV2;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;)V
    .locals 0
    .parameter

    .prologue
    .line 1425
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$2;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap.2;"
    iput-object p1, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$2;->this$0:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic transformEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1425
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$2;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap.2;"
    check-cast p2, Ljava/util/Collection;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$2;->transformEntry(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public transformEntry(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/Collection;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/util/Collection",
            "<TV1;>;)",
            "Ljava/util/Collection",
            "<TV2;>;"
        }
    .end annotation

    .prologue
    .line 1429
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$2;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap.2;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p2, value:Ljava/util/Collection;,"Ljava/util/Collection<TV1;>;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$2;->this$0:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;

    invoke-virtual {v0, p1, p2}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->transform(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
