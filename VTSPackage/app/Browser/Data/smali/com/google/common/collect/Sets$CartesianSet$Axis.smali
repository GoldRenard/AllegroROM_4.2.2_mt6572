.class Lcom/google/common/collect/Sets$CartesianSet$Axis;
.super Ljava/lang/Object;
.source "Sets.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Sets$CartesianSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Axis"
.end annotation


# instance fields
.field final choices:Lcom/google/common/collect/ImmutableSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableSet",
            "<+TB;>;"
        }
    .end annotation
.end field

.field final choicesList:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<+TB;>;"
        }
    .end annotation
.end field

.field final dividend:I

.field final synthetic this$0:Lcom/google/common/collect/Sets$CartesianSet;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Sets$CartesianSet;Ljava/util/Set;I)V
    .locals 1
    .parameter
    .parameter
    .parameter "dividend"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<+TB;>;I)V"
        }
    .end annotation

    .prologue
    .line 1085
    .local p0, this:Lcom/google/common/collect/Sets$CartesianSet$Axis;,"Lcom/google/common/collect/Sets$CartesianSet<TB;>.Axis;"
    .local p2, set:Ljava/util/Set;,"Ljava/util/Set<+TB;>;"
    iput-object p1, p0, Lcom/google/common/collect/Sets$CartesianSet$Axis;->this$0:Lcom/google/common/collect/Sets$CartesianSet;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 1086
    invoke-static {p2}, Lcom/google/common/collect/ImmutableSet;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/Sets$CartesianSet$Axis;->choices:Lcom/google/common/collect/ImmutableSet;

    .line 1087
    iget-object v0, p0, Lcom/google/common/collect/Sets$CartesianSet$Axis;->choices:Lcom/google/common/collect/ImmutableSet;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSet;->asList()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/Sets$CartesianSet$Axis;->choicesList:Lcom/google/common/collect/ImmutableList;

    .line 1088
    iput p3, p0, Lcom/google/common/collect/Sets$CartesianSet$Axis;->dividend:I

    .line 1089
    return-void
.end method


# virtual methods
.method contains(Ljava/lang/Object;)Z
    .locals 1
    .parameter "target"

    .prologue
    .line 1100
    .local p0, this:Lcom/google/common/collect/Sets$CartesianSet$Axis;,"Lcom/google/common/collect/Sets$CartesianSet<TB;>.Axis;"
    iget-object v0, p0, Lcom/google/common/collect/Sets$CartesianSet$Axis;->choices:Lcom/google/common/collect/ImmutableSet;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .parameter "obj"

    .prologue
    .line 1104
    .local p0, this:Lcom/google/common/collect/Sets$CartesianSet$Axis;,"Lcom/google/common/collect/Sets$CartesianSet<TB;>.Axis;"
    instance-of v1, p1, Lcom/google/common/collect/Sets$CartesianSet$Axis;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 1105
    check-cast v0, Lcom/google/common/collect/Sets$CartesianSet$Axis;

    .line 1106
    .local v0, that:Lcom/google/common/collect/Sets$CartesianSet$Axis;
    iget-object v1, p0, Lcom/google/common/collect/Sets$CartesianSet$Axis;->choices:Lcom/google/common/collect/ImmutableSet;

    iget-object v2, v0, Lcom/google/common/collect/Sets$CartesianSet$Axis;->choices:Lcom/google/common/collect/ImmutableSet;

    invoke-virtual {v1, v2}, Lcom/google/common/collect/ImmutableSet;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 1109
    .end local v0           #that:Lcom/google/common/collect/Sets$CartesianSet$Axis;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method getForIndex(I)Ljava/lang/Object;
    .locals 3
    .parameter "index"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TB;"
        }
    .end annotation

    .prologue
    .line 1096
    .local p0, this:Lcom/google/common/collect/Sets$CartesianSet$Axis;,"Lcom/google/common/collect/Sets$CartesianSet<TB;>.Axis;"
    iget-object v0, p0, Lcom/google/common/collect/Sets$CartesianSet$Axis;->choicesList:Lcom/google/common/collect/ImmutableList;

    iget v1, p0, Lcom/google/common/collect/Sets$CartesianSet$Axis;->dividend:I

    div-int v1, p1, v1

    invoke-virtual {p0}, Lcom/google/common/collect/Sets$CartesianSet$Axis;->size()I

    move-result v2

    rem-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 1116
    .local p0, this:Lcom/google/common/collect/Sets$CartesianSet$Axis;,"Lcom/google/common/collect/Sets$CartesianSet<TB;>.Axis;"
    iget-object v0, p0, Lcom/google/common/collect/Sets$CartesianSet$Axis;->this$0:Lcom/google/common/collect/Sets$CartesianSet;

    iget v0, v0, Lcom/google/common/collect/Sets$CartesianSet;->size:I

    iget-object v1, p0, Lcom/google/common/collect/Sets$CartesianSet$Axis;->choices:Lcom/google/common/collect/ImmutableSet;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableSet;->size()I

    move-result v1

    div-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/common/collect/Sets$CartesianSet$Axis;->choices:Lcom/google/common/collect/ImmutableSet;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableSet;->hashCode()I

    move-result v1

    mul-int/2addr v0, v1

    return v0
.end method

.method size()I
    .locals 1

    .prologue
    .line 1092
    .local p0, this:Lcom/google/common/collect/Sets$CartesianSet$Axis;,"Lcom/google/common/collect/Sets$CartesianSet<TB;>.Axis;"
    iget-object v0, p0, Lcom/google/common/collect/Sets$CartesianSet$Axis;->choices:Lcom/google/common/collect/ImmutableSet;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSet;->size()I

    move-result v0

    return v0
.end method
