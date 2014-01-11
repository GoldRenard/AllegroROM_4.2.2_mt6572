.class Lcom/google/common/collect/AbstractMultimap$1;
.super Lcom/google/common/collect/Multimaps$Keys;
.source "AbstractMultimap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/AbstractMultimap;->keys()Lcom/google/common/collect/Multiset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Multimaps$Keys",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/AbstractMultimap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/AbstractMultimap;)V
    .locals 0
    .parameter

    .prologue
    .line 996
    .local p0, this:Lcom/google/common/collect/AbstractMultimap$1;,"Lcom/google/common/collect/AbstractMultimap.1;"
    iput-object p1, p0, Lcom/google/common/collect/AbstractMultimap$1;->this$0:Lcom/google/common/collect/AbstractMultimap;

    invoke-direct {p0}, Lcom/google/common/collect/Multimaps$Keys;-><init>()V

    return-void
.end method


# virtual methods
.method multimap()Lcom/google/common/collect/Multimap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 998
    .local p0, this:Lcom/google/common/collect/AbstractMultimap$1;,"Lcom/google/common/collect/AbstractMultimap.1;"
    iget-object v0, p0, Lcom/google/common/collect/AbstractMultimap$1;->this$0:Lcom/google/common/collect/AbstractMultimap;

    return-object v0
.end method
