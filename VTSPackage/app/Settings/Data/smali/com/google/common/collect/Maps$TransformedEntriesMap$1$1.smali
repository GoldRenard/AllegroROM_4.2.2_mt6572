.class Lcom/google/common/collect/Maps$TransformedEntriesMap$1$1;
.super Ljava/lang/Object;
.source "Maps.java"

# interfaces
.implements Lcom/google/common/base/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Maps$TransformedEntriesMap$1;->iterator()Ljava/util/Iterator;
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
.field final synthetic this$1:Lcom/google/common/collect/Maps$TransformedEntriesMap$1;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Maps$TransformedEntriesMap$1;)V
    .locals 0
    .parameter

    .prologue
    .line 1216
    .local p0, this:Lcom/google/common/collect/Maps$TransformedEntriesMap$1$1;,"Lcom/google/common/collect/Maps$TransformedEntriesMap$1.1;"
    iput-object p1, p0, Lcom/google/common/collect/Maps$TransformedEntriesMap$1$1;->this$1:Lcom/google/common/collect/Maps$TransformedEntriesMap$1;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 1216
    .local p0, this:Lcom/google/common/collect/Maps$TransformedEntriesMap$1$1;,"Lcom/google/common/collect/Maps$TransformedEntriesMap$1.1;"
    check-cast p1, Ljava/util/Map$Entry;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Maps$TransformedEntriesMap$1$1;->apply(Ljava/util/Map$Entry;)Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public apply(Ljava/util/Map$Entry;)Ljava/util/Map$Entry;
    .locals 4
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
    .line 1218
    .local p0, this:Lcom/google/common/collect/Maps$TransformedEntriesMap$1$1;,"Lcom/google/common/collect/Maps$TransformedEntriesMap$1.1;"
    .local p1, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;TV1;>;"
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/google/common/collect/Maps$TransformedEntriesMap$1$1;->this$1:Lcom/google/common/collect/Maps$TransformedEntriesMap$1;

    iget-object v1, v1, Lcom/google/common/collect/Maps$TransformedEntriesMap$1;->this$0:Lcom/google/common/collect/Maps$TransformedEntriesMap;

    iget-object v1, v1, Lcom/google/common/collect/Maps$TransformedEntriesMap;->transformer:Lcom/google/common/collect/Maps$EntryTransformer;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/google/common/collect/Maps$EntryTransformer;->transformEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/common/collect/Maps;->immutableEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method
