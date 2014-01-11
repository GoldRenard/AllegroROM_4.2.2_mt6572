.class public final Lcom/google/common/hash/Hashing;
.super Ljava/lang/Object;
.source "Hashing.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;
    }
.end annotation


# static fields
.field private static final MD5:Lcom/google/common/hash/HashFunction;

.field private static final MURMUR3_128:Lcom/google/common/hash/Murmur3_128HashFunction;

.field private static final MURMUR3_32:Lcom/google/common/hash/Murmur3_32HashFunction;

.field private static final SHA_1:Lcom/google/common/hash/HashFunction;

.field private static final SHA_256:Lcom/google/common/hash/HashFunction;

.field private static final SHA_512:Lcom/google/common/hash/HashFunction;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 85
    new-instance v0, Lcom/google/common/hash/Murmur3_32HashFunction;

    invoke-direct {v0, v1}, Lcom/google/common/hash/Murmur3_32HashFunction;-><init>(I)V

    sput-object v0, Lcom/google/common/hash/Hashing;->MURMUR3_32:Lcom/google/common/hash/Murmur3_32HashFunction;

    .line 107
    new-instance v0, Lcom/google/common/hash/Murmur3_128HashFunction;

    invoke-direct {v0, v1}, Lcom/google/common/hash/Murmur3_128HashFunction;-><init>(I)V

    sput-object v0, Lcom/google/common/hash/Hashing;->MURMUR3_128:Lcom/google/common/hash/Murmur3_128HashFunction;

    .line 117
    new-instance v0, Lcom/google/common/hash/MessageDigestHashFunction;

    const-string v1, "MD5"

    invoke-direct {v0, v1}, Lcom/google/common/hash/MessageDigestHashFunction;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/common/hash/Hashing;->MD5:Lcom/google/common/hash/HashFunction;

    .line 127
    new-instance v0, Lcom/google/common/hash/MessageDigestHashFunction;

    const-string v1, "SHA-1"

    invoke-direct {v0, v1}, Lcom/google/common/hash/MessageDigestHashFunction;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/common/hash/Hashing;->SHA_1:Lcom/google/common/hash/HashFunction;

    .line 137
    new-instance v0, Lcom/google/common/hash/MessageDigestHashFunction;

    const-string v1, "SHA-256"

    invoke-direct {v0, v1}, Lcom/google/common/hash/MessageDigestHashFunction;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/common/hash/Hashing;->SHA_256:Lcom/google/common/hash/HashFunction;

    .line 147
    new-instance v0, Lcom/google/common/hash/MessageDigestHashFunction;

    const-string v1, "SHA-512"

    invoke-direct {v0, v1}, Lcom/google/common/hash/MessageDigestHashFunction;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/common/hash/Hashing;->SHA_512:Lcom/google/common/hash/HashFunction;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static checkPositiveAndMakeMultipleOf32(I)I
    .locals 2
    .parameter "bits"

    .prologue
    .line 265
    if-lez p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    const-string v1, "Number of bits must be positive"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 266
    add-int/lit8 v0, p0, 0x1f

    and-int/lit8 v0, v0, -0x20

    return v0

    .line 265
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static combineOrdered(Ljava/lang/Iterable;)Lcom/google/common/hash/HashCode;
    .locals 9
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/google/common/hash/HashCode;",
            ">;)",
            "Lcom/google/common/hash/HashCode;"
        }
    .end annotation

    .prologue
    .line 221
    .local p0, hashCodes:Ljava/lang/Iterable;,"Ljava/lang/Iterable<Lcom/google/common/hash/HashCode;>;"
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 222
    .local v4, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/google/common/hash/HashCode;>;"
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const-string v8, "Must be at least 1 hash code to combine."

    invoke-static {v7, v8}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 223
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/common/hash/HashCode;

    invoke-virtual {v7}, Lcom/google/common/hash/HashCode;->bits()I

    move-result v0

    .line 224
    .local v0, bits:I
    div-int/lit8 v7, v0, 0x8

    new-array v6, v7, [B

    .line 225
    .local v6, resultBytes:[B
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/hash/HashCode;

    .line 226
    .local v1, hashCode:Lcom/google/common/hash/HashCode;
    invoke-virtual {v1}, Lcom/google/common/hash/HashCode;->asBytes()[B

    move-result-object v5

    .line 227
    .local v5, nextBytes:[B
    array-length v7, v5

    array-length v8, v6

    if-ne v7, v8, :cond_1

    const/4 v7, 0x1

    :goto_0
    const-string v8, "All hashcodes must have the same bit length."

    invoke-static {v7, v8}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 229
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    array-length v7, v5

    if-ge v2, v7, :cond_0

    .line 230
    aget-byte v7, v6, v2

    mul-int/lit8 v7, v7, 0x25

    aget-byte v8, v5, v2

    xor-int/2addr v7, v8

    int-to-byte v7, v7

    aput-byte v7, v6, v2

    .line 229
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 227
    .end local v2           #i:I
    :cond_1
    const/4 v7, 0x0

    goto :goto_0

    .line 233
    .end local v1           #hashCode:Lcom/google/common/hash/HashCode;
    .end local v5           #nextBytes:[B
    :cond_2
    invoke-static {v6}, Lcom/google/common/hash/HashCodes;->fromBytes([B)Lcom/google/common/hash/HashCode;

    move-result-object v7

    return-object v7
.end method

.method public static combineUnordered(Ljava/lang/Iterable;)Lcom/google/common/hash/HashCode;
    .locals 8
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/google/common/hash/HashCode;",
            ">;)",
            "Lcom/google/common/hash/HashCode;"
        }
    .end annotation

    .prologue
    .line 247
    .local p0, hashCodes:Ljava/lang/Iterable;,"Ljava/lang/Iterable<Lcom/google/common/hash/HashCode;>;"
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 248
    .local v3, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/google/common/hash/HashCode;>;"
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const-string v7, "Must be at least 1 hash code to combine."

    invoke-static {v6, v7}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 249
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/common/hash/HashCode;

    invoke-virtual {v6}, Lcom/google/common/hash/HashCode;->bits()I

    move-result v6

    div-int/lit8 v6, v6, 0x8

    new-array v5, v6, [B

    .line 250
    .local v5, resultBytes:[B
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/hash/HashCode;

    .line 251
    .local v0, hashCode:Lcom/google/common/hash/HashCode;
    invoke-virtual {v0}, Lcom/google/common/hash/HashCode;->asBytes()[B

    move-result-object v4

    .line 252
    .local v4, nextBytes:[B
    array-length v6, v4

    array-length v7, v5

    if-ne v6, v7, :cond_1

    const/4 v6, 0x1

    :goto_0
    const-string v7, "All hashcodes must have the same bit length."

    invoke-static {v6, v7}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 254
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v6, v4

    if-ge v1, v6, :cond_0

    .line 255
    aget-byte v6, v5, v1

    aget-byte v7, v4, v1

    add-int/2addr v6, v7

    int-to-byte v6, v6

    aput-byte v6, v5, v1

    .line 254
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 252
    .end local v1           #i:I
    :cond_1
    const/4 v6, 0x0

    goto :goto_0

    .line 258
    .end local v0           #hashCode:Lcom/google/common/hash/HashCode;
    .end local v4           #nextBytes:[B
    :cond_2
    invoke-static {v5}, Lcom/google/common/hash/HashCodes;->fromBytes([B)Lcom/google/common/hash/HashCode;

    move-result-object v6

    return-object v6
.end method

.method public static consistentHash(JI)I
    .locals 11
    .parameter "input"
    .parameter "buckets"

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 189
    if-lez p2, :cond_0

    move v6, v7

    :goto_0
    const-string v9, "buckets must be positive: %s"

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v7, v8

    invoke-static {v6, v9, v7}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 190
    move-wide v1, p0

    .line 191
    .local v1, h:J
    const/4 v0, 0x0

    .line 198
    .local v0, candidate:I
    :goto_1
    const-wide v6, 0x27bb2ee687b0b0fdL

    mul-long/2addr v6, v1

    const-wide/16 v8, 0x1

    add-long v1, v6, v8

    .line 199
    const-wide/high16 v6, 0x41e0

    const/16 v8, 0x21

    ushr-long v8, v1, v8

    long-to-int v8, v8

    add-int/lit8 v8, v8, 0x1

    int-to-double v8, v8

    div-double v3, v6, v8

    .line 200
    .local v3, inv:D
    add-int/lit8 v6, v0, 0x1

    int-to-double v6, v6

    mul-double/2addr v6, v3

    double-to-int v5, v6

    .line 202
    .local v5, next:I
    if-ltz v5, :cond_1

    if-ge v5, p2, :cond_1

    .line 203
    move v0, v5

    goto :goto_1

    .end local v0           #candidate:I
    .end local v1           #h:J
    .end local v3           #inv:D
    .end local v5           #next:I
    :cond_0
    move v6, v8

    .line 189
    goto :goto_0

    .line 205
    .restart local v0       #candidate:I
    .restart local v1       #h:J
    .restart local v3       #inv:D
    .restart local v5       #next:I
    :cond_1
    return v0
.end method

.method public static consistentHash(Lcom/google/common/hash/HashCode;I)I
    .locals 2
    .parameter "hashCode"
    .parameter "buckets"

    .prologue
    .line 172
    invoke-static {p0}, Lcom/google/common/hash/Hashing;->padToLong(Lcom/google/common/hash/HashCode;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/google/common/hash/Hashing;->consistentHash(JI)I

    move-result v0

    return v0
.end method

.method public static goodFastHash(I)Lcom/google/common/hash/HashFunction;
    .locals 5
    .parameter "minimumBits"

    .prologue
    .line 50
    invoke-static {p0}, Lcom/google/common/hash/Hashing;->checkPositiveAndMakeMultipleOf32(I)I

    move-result v0

    .line 52
    .local v0, bits:I
    const/16 v4, 0x20

    if-ne v0, v4, :cond_0

    .line 53
    invoke-static {}, Lcom/google/common/hash/Hashing;->murmur3_32()Lcom/google/common/hash/HashFunction;

    move-result-object v4

    .line 63
    :goto_0
    return-object v4

    .line 54
    :cond_0
    const/16 v4, 0x80

    if-gt v0, v4, :cond_1

    .line 55
    invoke-static {}, Lcom/google/common/hash/Hashing;->murmur3_128()Lcom/google/common/hash/HashFunction;

    move-result-object v4

    goto :goto_0

    .line 58
    :cond_1
    add-int/lit8 v4, v0, 0x7f

    div-int/lit16 v2, v4, 0x80

    .line 59
    .local v2, hashFunctionsNeeded:I
    new-array v1, v2, [Lcom/google/common/hash/HashFunction;

    .line 60
    .local v1, hashFunctions:[Lcom/google/common/hash/HashFunction;
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    if-ge v3, v2, :cond_2

    .line 61
    const v4, 0x596f0ddf

    mul-int/2addr v4, v3

    invoke-static {v4}, Lcom/google/common/hash/Hashing;->murmur3_128(I)Lcom/google/common/hash/HashFunction;

    move-result-object v4

    aput-object v4, v1, v3

    .line 60
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 63
    :cond_2
    new-instance v4, Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;

    invoke-direct {v4, v1}, Lcom/google/common/hash/Hashing$ConcatenatedHashFunction;-><init>([Lcom/google/common/hash/HashFunction;)V

    goto :goto_0
.end method

.method public static md5()Lcom/google/common/hash/HashFunction;
    .locals 1

    .prologue
    .line 114
    sget-object v0, Lcom/google/common/hash/Hashing;->MD5:Lcom/google/common/hash/HashFunction;

    return-object v0
.end method

.method public static murmur3_128()Lcom/google/common/hash/HashFunction;
    .locals 1

    .prologue
    .line 104
    sget-object v0, Lcom/google/common/hash/Hashing;->MURMUR3_128:Lcom/google/common/hash/Murmur3_128HashFunction;

    return-object v0
.end method

.method public static murmur3_128(I)Lcom/google/common/hash/HashFunction;
    .locals 1
    .parameter "seed"

    .prologue
    .line 94
    new-instance v0, Lcom/google/common/hash/Murmur3_128HashFunction;

    invoke-direct {v0, p0}, Lcom/google/common/hash/Murmur3_128HashFunction;-><init>(I)V

    return-object v0
.end method

.method public static murmur3_32()Lcom/google/common/hash/HashFunction;
    .locals 1

    .prologue
    .line 82
    sget-object v0, Lcom/google/common/hash/Hashing;->MURMUR3_32:Lcom/google/common/hash/Murmur3_32HashFunction;

    return-object v0
.end method

.method public static murmur3_32(I)Lcom/google/common/hash/HashFunction;
    .locals 1
    .parameter "seed"

    .prologue
    .line 73
    new-instance v0, Lcom/google/common/hash/Murmur3_32HashFunction;

    invoke-direct {v0, p0}, Lcom/google/common/hash/Murmur3_32HashFunction;-><init>(I)V

    return-object v0
.end method

.method public static padToLong(Lcom/google/common/hash/HashCode;)J
    .locals 2
    .parameter "hashCode"

    .prologue
    .line 155
    invoke-virtual {p0}, Lcom/google/common/hash/HashCode;->bits()I

    move-result v0

    const/16 v1, 0x40

    if-ge v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/google/common/hash/HashCode;->asInt()I

    move-result v0

    invoke-static {v0}, Lcom/google/common/primitives/UnsignedInts;->toLong(I)J

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/common/hash/HashCode;->asLong()J

    move-result-wide v0

    goto :goto_0
.end method

.method public static sha1()Lcom/google/common/hash/HashFunction;
    .locals 1

    .prologue
    .line 124
    sget-object v0, Lcom/google/common/hash/Hashing;->SHA_1:Lcom/google/common/hash/HashFunction;

    return-object v0
.end method

.method public static sha256()Lcom/google/common/hash/HashFunction;
    .locals 1

    .prologue
    .line 134
    sget-object v0, Lcom/google/common/hash/Hashing;->SHA_256:Lcom/google/common/hash/HashFunction;

    return-object v0
.end method

.method public static sha512()Lcom/google/common/hash/HashFunction;
    .locals 1

    .prologue
    .line 144
    sget-object v0, Lcom/google/common/hash/Hashing;->SHA_512:Lcom/google/common/hash/HashFunction;

    return-object v0
.end method
