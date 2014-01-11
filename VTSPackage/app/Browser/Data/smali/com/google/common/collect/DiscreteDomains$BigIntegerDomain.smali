.class final Lcom/google/common/collect/DiscreteDomains$BigIntegerDomain;
.super Lcom/google/common/collect/DiscreteDomain;
.source "DiscreteDomains.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/DiscreteDomains;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "BigIntegerDomain"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/DiscreteDomain",
        "<",
        "Ljava/math/BigInteger;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final INSTANCE:Lcom/google/common/collect/DiscreteDomains$BigIntegerDomain;

.field private static final MAX_LONG:Ljava/math/BigInteger;

.field private static final MIN_LONG:Ljava/math/BigInteger;

.field private static final serialVersionUID:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 133
    new-instance v0, Lcom/google/common/collect/DiscreteDomains$BigIntegerDomain;

    invoke-direct {v0}, Lcom/google/common/collect/DiscreteDomains$BigIntegerDomain;-><init>()V

    sput-object v0, Lcom/google/common/collect/DiscreteDomains$BigIntegerDomain;->INSTANCE:Lcom/google/common/collect/DiscreteDomains$BigIntegerDomain;

    .line 135
    const-wide/high16 v0, -0x8000

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    sput-object v0, Lcom/google/common/collect/DiscreteDomains$BigIntegerDomain;->MIN_LONG:Ljava/math/BigInteger;

    .line 137
    const-wide v0, 0x7fffffffffffffffL

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    sput-object v0, Lcom/google/common/collect/DiscreteDomains$BigIntegerDomain;->MAX_LONG:Ljava/math/BigInteger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 131
    invoke-direct {p0}, Lcom/google/common/collect/DiscreteDomain;-><init>()V

    return-void
.end method

.method static synthetic access$200()Lcom/google/common/collect/DiscreteDomains$BigIntegerDomain;
    .locals 1

    .prologue
    .line 131
    sget-object v0, Lcom/google/common/collect/DiscreteDomains$BigIntegerDomain;->INSTANCE:Lcom/google/common/collect/DiscreteDomains$BigIntegerDomain;

    return-object v0
.end method

.method private readResolve()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 153
    sget-object v0, Lcom/google/common/collect/DiscreteDomains$BigIntegerDomain;->INSTANCE:Lcom/google/common/collect/DiscreteDomains$BigIntegerDomain;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic distance(Ljava/lang/Comparable;Ljava/lang/Comparable;)J
    .locals 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 131
    check-cast p1, Ljava/math/BigInteger;

    .end local p1
    check-cast p2, Ljava/math/BigInteger;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/DiscreteDomains$BigIntegerDomain;->distance(Ljava/math/BigInteger;Ljava/math/BigInteger;)J

    move-result-wide v0

    return-wide v0
.end method

.method public distance(Ljava/math/BigInteger;Ljava/math/BigInteger;)J
    .locals 2
    .parameter "start"
    .parameter "end"

    .prologue
    .line 149
    invoke-virtual {p1, p2}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    sget-object v1, Lcom/google/common/collect/DiscreteDomains$BigIntegerDomain;->MIN_LONG:Ljava/math/BigInteger;

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->max(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    sget-object v1, Lcom/google/common/collect/DiscreteDomains$BigIntegerDomain;->MAX_LONG:Ljava/math/BigInteger;

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->min(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public bridge synthetic next(Ljava/lang/Comparable;)Ljava/lang/Comparable;
    .locals 1
    .parameter "x0"

    .prologue
    .line 131
    check-cast p1, Ljava/math/BigInteger;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/google/common/collect/DiscreteDomains$BigIntegerDomain;->next(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public next(Ljava/math/BigInteger;)Ljava/math/BigInteger;
    .locals 1
    .parameter "value"

    .prologue
    .line 141
    sget-object v0, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    invoke-virtual {p1, v0}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic previous(Ljava/lang/Comparable;)Ljava/lang/Comparable;
    .locals 1
    .parameter "x0"

    .prologue
    .line 131
    check-cast p1, Ljava/math/BigInteger;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/google/common/collect/DiscreteDomains$BigIntegerDomain;->previous(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public previous(Ljava/math/BigInteger;)Ljava/math/BigInteger;
    .locals 1
    .parameter "value"

    .prologue
    .line 145
    sget-object v0, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    invoke-virtual {p1, v0}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method
