.class final enum Lcom/google/common/collect/BstSide$1;
.super Lcom/google/common/collect/BstSide;
.source "BstSide.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/BstSide;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 26
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/common/collect/BstSide;-><init>(Ljava/lang/String;ILcom/google/common/collect/BstSide$1;)V

    return-void
.end method


# virtual methods
.method public other()Lcom/google/common/collect/BstSide;
    .locals 1

    .prologue
    .line 29
    sget-object v0, Lcom/google/common/collect/BstSide$1;->RIGHT:Lcom/google/common/collect/BstSide;

    return-object v0
.end method
