.class interface abstract Lcom/google/common/collect/BstAggregate;
.super Ljava/lang/Object;
.source "BstAggregate.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Lcom/google/common/collect/BstNode",
        "<*TN;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract entryValue(Lcom/google/common/collect/BstNode;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TN;)I"
        }
    .end annotation
.end method

.method public abstract treeValue(Lcom/google/common/collect/BstNode;)J
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TN;)J"
        }
    .end annotation
.end method
