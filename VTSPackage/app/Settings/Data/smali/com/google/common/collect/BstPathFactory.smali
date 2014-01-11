.class interface abstract Lcom/google/common/collect/BstPathFactory;
.super Ljava/lang/Object;
.source "BstPathFactory.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Lcom/google/common/collect/BstNode",
        "<*TN;>;P:",
        "Lcom/google/common/collect/BstPath",
        "<TN;TP;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract extension(Lcom/google/common/collect/BstPath;Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstPath;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TP;",
            "Lcom/google/common/collect/BstSide;",
            ")TP;"
        }
    .end annotation
.end method

.method public abstract initialPath(Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstPath;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TN;)TP;"
        }
    .end annotation
.end method
