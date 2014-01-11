.class abstract Lcom/google/common/collect/Sets$InvertibleFunction;
.super Ljava/lang/Object;
.source "Sets.java"

# interfaces
.implements Lcom/google/common/base/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Sets;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "InvertibleFunction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<A:",
        "Ljava/lang/Object;",
        "B:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/common/base/Function",
        "<TA;TB;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 1303
    .local p0, this:Lcom/google/common/collect/Sets$InvertibleFunction;,"Lcom/google/common/collect/Sets$InvertibleFunction<TA;TB;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public inverse()Lcom/google/common/collect/Sets$InvertibleFunction;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Sets$InvertibleFunction",
            "<TB;TA;>;"
        }
    .end annotation

    .prologue
    .line 1307
    .local p0, this:Lcom/google/common/collect/Sets$InvertibleFunction;,"Lcom/google/common/collect/Sets$InvertibleFunction<TA;TB;>;"
    new-instance v0, Lcom/google/common/collect/Sets$InvertibleFunction$1;

    invoke-direct {v0, p0}, Lcom/google/common/collect/Sets$InvertibleFunction$1;-><init>(Lcom/google/common/collect/Sets$InvertibleFunction;)V

    return-object v0
.end method

.method abstract invert(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TB;)TA;"
        }
    .end annotation
.end method
