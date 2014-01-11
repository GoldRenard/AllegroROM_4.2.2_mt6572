.class Lcom/google/common/collect/Multimaps$FilteredMultimap$ValuePredicate;
.super Ljava/lang/Object;
.source "Multimaps.java"

# interfaces
.implements Lcom/google/common/base/Predicate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Multimaps$FilteredMultimap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ValuePredicate"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/base/Predicate",
        "<TV;>;"
    }
.end annotation


# instance fields
.field final key:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Multimaps$FilteredMultimap;Ljava/lang/Object;)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    .prologue
    .line 2407
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$ValuePredicate;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.ValuePredicate;"
    .local p2, key:Ljava/lang/Object;,"TK;"
    iput-object p1, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$ValuePredicate;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 2408
    iput-object p2, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$ValuePredicate;->key:Ljava/lang/Object;

    .line 2409
    return-void
.end method


# virtual methods
.method public apply(Ljava/lang/Object;)Z
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)Z"
        }
    .end annotation

    .prologue
    .line 2411
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$ValuePredicate;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.ValuePredicate;"
    .local p1, value:Ljava/lang/Object;,"TV;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$ValuePredicate;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    iget-object v1, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$ValuePredicate;->key:Ljava/lang/Object;

    invoke-virtual {v0, v1, p1}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->satisfiesPredicate(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
