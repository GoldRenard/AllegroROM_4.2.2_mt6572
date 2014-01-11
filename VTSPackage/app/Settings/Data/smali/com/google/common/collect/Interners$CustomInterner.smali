.class Lcom/google/common/collect/Interners$CustomInterner;
.super Ljava/lang/Object;
.source "Interners.java"

# interfaces
.implements Lcom/google/common/collect/Interner;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Interners;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CustomInterner"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/Interners$CustomInterner$Dummy;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/common/collect/Interner",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private final map:Lcom/google/common/collect/MapMakerInternalMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/MapMakerInternalMap",
            "<TE;",
            "Lcom/google/common/collect/Interners$CustomInterner$Dummy;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/collect/GenericMapMaker;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/GenericMapMaker",
            "<-TE;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, this:Lcom/google/common/collect/Interners$CustomInterner;,"Lcom/google/common/collect/Interners$CustomInterner<TE;>;"
    .local p1, mm:Lcom/google/common/collect/GenericMapMaker;,"Lcom/google/common/collect/GenericMapMaker<-TE;Ljava/lang/Object;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 59
    invoke-virtual {p1}, Lcom/google/common/collect/GenericMapMaker;->strongValues()Lcom/google/common/collect/GenericMapMaker;

    move-result-object v0

    invoke-static {}, Lcom/google/common/base/Equivalences;->equals()Lcom/google/common/base/Equivalence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/GenericMapMaker;->keyEquivalence(Lcom/google/common/base/Equivalence;)Lcom/google/common/collect/GenericMapMaker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/GenericMapMaker;->makeCustomMap()Lcom/google/common/collect/MapMakerInternalMap;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/Interners$CustomInterner;->map:Lcom/google/common/collect/MapMakerInternalMap;

    .line 63
    return-void
.end method


# virtual methods
.method public intern(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)TE;"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, this:Lcom/google/common/collect/Interners$CustomInterner;,"Lcom/google/common/collect/Interners$CustomInterner<TE;>;"
    .local p1, sample:Ljava/lang/Object;,"TE;"
    :cond_0
    iget-object v3, p0, Lcom/google/common/collect/Interners$CustomInterner;->map:Lcom/google/common/collect/MapMakerInternalMap;

    invoke-virtual {v3, p1}, Lcom/google/common/collect/MapMakerInternalMap;->getEntry(Ljava/lang/Object;)Lcom/google/common/collect/MapMakerInternalMap$ReferenceEntry;

    move-result-object v1

    .line 69
    .local v1, entry:Lcom/google/common/collect/MapMakerInternalMap$ReferenceEntry;,"Lcom/google/common/collect/MapMakerInternalMap$ReferenceEntry<TE;Lcom/google/common/collect/Interners$CustomInterner$Dummy;>;"
    if-eqz v1, :cond_1

    .line 70
    invoke-interface {v1}, Lcom/google/common/collect/MapMakerInternalMap$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v0

    .line 71
    .local v0, canonical:Ljava/lang/Object;,"TE;"
    if-eqz v0, :cond_1

    .line 79
    .end local v0           #canonical:Ljava/lang/Object;,"TE;"
    :goto_0
    return-object v0

    .line 77
    :cond_1
    iget-object v3, p0, Lcom/google/common/collect/Interners$CustomInterner;->map:Lcom/google/common/collect/MapMakerInternalMap;

    sget-object v4, Lcom/google/common/collect/Interners$CustomInterner$Dummy;->VALUE:Lcom/google/common/collect/Interners$CustomInterner$Dummy;

    invoke-virtual {v3, p1, v4}, Lcom/google/common/collect/MapMakerInternalMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/common/collect/Interners$CustomInterner$Dummy;

    .line 78
    .local v2, sneaky:Lcom/google/common/collect/Interners$CustomInterner$Dummy;
    if-nez v2, :cond_0

    move-object v0, p1

    .line 79
    goto :goto_0
.end method
