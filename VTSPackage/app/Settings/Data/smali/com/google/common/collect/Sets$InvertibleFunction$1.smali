.class Lcom/google/common/collect/Sets$InvertibleFunction$1;
.super Lcom/google/common/collect/Sets$InvertibleFunction;
.source "Sets.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Sets$InvertibleFunction;->inverse()Lcom/google/common/collect/Sets$InvertibleFunction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Sets$InvertibleFunction",
        "<TB;TA;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/Sets$InvertibleFunction;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Sets$InvertibleFunction;)V
    .locals 0
    .parameter

    .prologue
    .line 1307
    .local p0, this:Lcom/google/common/collect/Sets$InvertibleFunction$1;,"Lcom/google/common/collect/Sets$InvertibleFunction.1;"
    iput-object p1, p0, Lcom/google/common/collect/Sets$InvertibleFunction$1;->this$0:Lcom/google/common/collect/Sets$InvertibleFunction;

    invoke-direct {p0}, Lcom/google/common/collect/Sets$InvertibleFunction;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TB;)TA;"
        }
    .end annotation

    .prologue
    .line 1309
    .local p0, this:Lcom/google/common/collect/Sets$InvertibleFunction$1;,"Lcom/google/common/collect/Sets$InvertibleFunction.1;"
    .local p1, b:Ljava/lang/Object;,"TB;"
    iget-object v0, p0, Lcom/google/common/collect/Sets$InvertibleFunction$1;->this$0:Lcom/google/common/collect/Sets$InvertibleFunction;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/Sets$InvertibleFunction;->invert(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public inverse()Lcom/google/common/collect/Sets$InvertibleFunction;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Sets$InvertibleFunction",
            "<TA;TB;>;"
        }
    .end annotation

    .prologue
    .line 1318
    .local p0, this:Lcom/google/common/collect/Sets$InvertibleFunction$1;,"Lcom/google/common/collect/Sets$InvertibleFunction.1;"
    iget-object v0, p0, Lcom/google/common/collect/Sets$InvertibleFunction$1;->this$0:Lcom/google/common/collect/Sets$InvertibleFunction;

    return-object v0
.end method

.method invert(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TA;)TB;"
        }
    .end annotation

    .prologue
    .line 1313
    .local p0, this:Lcom/google/common/collect/Sets$InvertibleFunction$1;,"Lcom/google/common/collect/Sets$InvertibleFunction.1;"
    .local p1, a:Ljava/lang/Object;,"TA;"
    iget-object v0, p0, Lcom/google/common/collect/Sets$InvertibleFunction$1;->this$0:Lcom/google/common/collect/Sets$InvertibleFunction;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/Sets$InvertibleFunction;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
