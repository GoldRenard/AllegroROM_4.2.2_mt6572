.class Lcom/google/common/hash/HashCodes$BytesHashCode;
.super Lcom/google/common/hash/HashCode;
.source "HashCodes.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/hash/HashCodes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BytesHashCode"
.end annotation


# instance fields
.field final bytes:[B


# direct methods
.method constructor <init>([B)V
    .locals 0
    .parameter "bytes"

    .prologue
    .line 113
    invoke-direct {p0}, Lcom/google/common/hash/HashCode;-><init>()V

    .line 114
    iput-object p1, p0, Lcom/google/common/hash/HashCodes$BytesHashCode;->bytes:[B

    .line 115
    return-void
.end method


# virtual methods
.method public asBytes()[B
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/google/common/hash/HashCodes$BytesHashCode;->bytes:[B

    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method public asInt()I
    .locals 3

    .prologue
    .line 126
    iget-object v0, p0, Lcom/google/common/hash/HashCodes$BytesHashCode;->bytes:[B

    const/4 v1, 0x0

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    iget-object v1, p0, Lcom/google/common/hash/HashCodes$BytesHashCode;->bytes:[B

    const/4 v2, 0x1

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/common/hash/HashCodes$BytesHashCode;->bytes:[B

    const/4 v2, 0x2

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/common/hash/HashCodes$BytesHashCode;->bytes:[B

    const/4 v2, 0x3

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    return v0
.end method

.method public asLong()J
    .locals 7

    .prologue
    const/16 v4, 0x8

    const-wide/16 v5, 0xff

    .line 133
    iget-object v0, p0, Lcom/google/common/hash/HashCodes$BytesHashCode;->bytes:[B

    array-length v0, v0

    if-ge v0, v4, :cond_0

    .line 135
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not enough bytes"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 137
    :cond_0
    iget-object v0, p0, Lcom/google/common/hash/HashCodes$BytesHashCode;->bytes:[B

    const/4 v1, 0x0

    aget-byte v0, v0, v1

    int-to-long v0, v0

    and-long/2addr v0, v5

    iget-object v2, p0, Lcom/google/common/hash/HashCodes$BytesHashCode;->bytes:[B

    const/4 v3, 0x1

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/common/hash/HashCodes$BytesHashCode;->bytes:[B

    const/4 v3, 0x2

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/common/hash/HashCodes$BytesHashCode;->bytes:[B

    const/4 v3, 0x3

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x18

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/common/hash/HashCodes$BytesHashCode;->bytes:[B

    const/4 v3, 0x4

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/common/hash/HashCodes$BytesHashCode;->bytes:[B

    const/4 v3, 0x5

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x28

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/common/hash/HashCodes$BytesHashCode;->bytes:[B

    const/4 v3, 0x6

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/common/hash/HashCodes$BytesHashCode;->bytes:[B

    const/4 v3, 0x7

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x38

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public bits()I
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lcom/google/common/hash/HashCodes$BytesHashCode;->bytes:[B

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x8

    return v0
.end method
