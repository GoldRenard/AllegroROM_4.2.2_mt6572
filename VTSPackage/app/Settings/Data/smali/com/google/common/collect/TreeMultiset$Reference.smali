.class final Lcom/google/common/collect/TreeMultiset$Reference;
.super Ljava/lang/Object;
.source "TreeMultiset.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/TreeMultiset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Reference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 150
    .local p0, this:Lcom/google/common/collect/TreeMultiset$Reference;,"Lcom/google/common/collect/TreeMultiset$Reference<TT;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)Z"
        }
    .end annotation

    .prologue
    .line 157
    .local p0, this:Lcom/google/common/collect/TreeMultiset$Reference;,"Lcom/google/common/collect/TreeMultiset$Reference<TT;>;"
    .local p1, expected:Ljava/lang/Object;,"TT;"
    .local p2, newValue:Ljava/lang/Object;,"TT;"
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$Reference;->value:Ljava/lang/Object;

    if-ne v0, p1, :cond_0

    .line 158
    iput-object p2, p0, Lcom/google/common/collect/TreeMultiset$Reference;->value:Ljava/lang/Object;

    .line 159
    const/4 v0, 0x1

    .line 161
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 153
    .local p0, this:Lcom/google/common/collect/TreeMultiset$Reference;,"Lcom/google/common/collect/TreeMultiset$Reference<TT;>;"
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$Reference;->value:Ljava/lang/Object;

    return-object v0
.end method
