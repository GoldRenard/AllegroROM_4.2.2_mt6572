.class public final Lcom/google/common/net/InetAddresses;
.super Ljava/lang/Object;
.source "InetAddresses.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/net/InetAddresses$TeredoInfo;
    }
.end annotation


# static fields
.field private static final ANY4:Ljava/net/Inet4Address; = null

.field private static final IPV4_PART_COUNT:I = 0x4

.field private static final IPV6_PART_COUNT:I = 0x8

.field private static final LOOPBACK4:Ljava/net/Inet4Address;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 122
    const-string v0, "127.0.0.1"

    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->forString(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    check-cast v0, Ljava/net/Inet4Address;

    sput-object v0, Lcom/google/common/net/InetAddresses;->LOOPBACK4:Ljava/net/Inet4Address;

    .line 124
    const-string v0, "0.0.0.0"

    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->forString(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    check-cast v0, Ljava/net/Inet4Address;

    sput-object v0, Lcom/google/common/net/InetAddresses;->ANY4:Ljava/net/Inet4Address;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 127
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/net/Inet4Address;
    .locals 1

    .prologue
    .line 119
    sget-object v0, Lcom/google/common/net/InetAddresses;->ANY4:Ljava/net/Inet4Address;

    return-object v0
.end method

.method public static coerceToInteger(Ljava/net/InetAddress;)I
    .locals 1
    .parameter "ip"

    .prologue
    .line 1029
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->getCoercedIPv4Address(Ljava/net/InetAddress;)Ljava/net/Inet4Address;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Inet4Address;->getAddress()[B

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/io/ByteStreams;->newDataInput([B)Lcom/google/common/io/ByteArrayDataInput;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/io/ByteArrayDataInput;->readInt()I

    move-result v0

    return v0
.end method

.method private static compressLongestRunOfZeroes([I)V
    .locals 7
    .parameter "hextets"

    .prologue
    .line 417
    const/4 v1, -0x1

    .line 418
    .local v1, bestRunStart:I
    const/4 v0, -0x1

    .line 419
    .local v0, bestRunLength:I
    const/4 v4, -0x1

    .line 420
    .local v4, runStart:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v5, p0

    add-int/lit8 v5, v5, 0x1

    if-ge v2, v5, :cond_3

    .line 421
    array-length v5, p0

    if-ge v2, v5, :cond_1

    aget v5, p0, v2

    if-nez v5, :cond_1

    .line 422
    if-gez v4, :cond_0

    .line 423
    move v4, v2

    .line 420
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 425
    :cond_1
    if-ltz v4, :cond_0

    .line 426
    sub-int v3, v2, v4

    .line 427
    .local v3, runLength:I
    if-le v3, v0, :cond_2

    .line 428
    move v1, v4

    .line 429
    move v0, v3

    .line 431
    :cond_2
    const/4 v4, -0x1

    goto :goto_1

    .line 434
    .end local v3           #runLength:I
    :cond_3
    const/4 v5, 0x2

    if-lt v0, v5, :cond_4

    .line 435
    add-int v5, v1, v0

    const/4 v6, -0x1

    invoke-static {p0, v1, v5, v6}, Ljava/util/Arrays;->fill([IIII)V

    .line 437
    :cond_4
    return-void
.end method

.method private static convertDottedQuadToHex(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .parameter "ipString"

    .prologue
    const/4 v7, 0x0

    .line 341
    const/16 v6, 0x3a

    invoke-virtual {p0, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 342
    .local v2, lastColon:I
    add-int/lit8 v6, v2, 0x1

    invoke-virtual {p0, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 343
    .local v1, initialPart:Ljava/lang/String;
    add-int/lit8 v6, v2, 0x1

    invoke-virtual {p0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 344
    .local v0, dottedQuad:Ljava/lang/String;
    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->textToNumericFormatV4(Ljava/lang/String;)[B

    move-result-object v4

    .line 345
    .local v4, quad:[B
    if-nez v4, :cond_0

    .line 346
    const/4 v6, 0x0

    .line 350
    :goto_0
    return-object v6

    .line 348
    :cond_0
    aget-byte v6, v4, v7

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    const/4 v7, 0x1

    aget-byte v7, v4, v7

    and-int/lit16 v7, v7, 0xff

    or-int/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    .line 349
    .local v3, penultimate:Ljava/lang/String;
    const/4 v6, 0x2

    aget-byte v6, v4, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    const/4 v7, 0x3

    aget-byte v7, v4, v7

    and-int/lit16 v7, v7, 0xff

    or-int/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    .line 350
    .local v5, ultimate:Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_0
.end method

.method private static copyOfRange([BII)[B
    .locals 4
    .parameter "original"
    .parameter "from"
    .parameter "to"

    .prologue
    .line 1115
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1117
    array-length v2, p0

    invoke-static {p2, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1118
    .local v0, end:I
    sub-int v2, p2, p1

    new-array v1, v2, [B

    .line 1120
    .local v1, result:[B
    const/4 v2, 0x0

    sub-int v3, v0, p1

    invoke-static {p0, p1, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1121
    return-object v1
.end method

.method public static forString(Ljava/lang/String;)Ljava/net/InetAddress;
    .locals 6
    .parameter "ipString"

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 186
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->ipStringToBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 189
    .local v0, addr:[B
    if-nez v0, :cond_0

    .line 190
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'%s\' is not an IP string literal."

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p0, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 195
    :cond_0
    :try_start_0
    invoke-static {v0}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    return-object v2

    .line 196
    :catch_0
    move-exception v1

    .line 210
    .local v1, e:Ljava/net/UnknownHostException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'%s\' is extremely broken."

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p0, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static forUriString(Ljava/lang/String;)Ljava/net/InetAddress;
    .locals 6
    .parameter "hostAddr"

    .prologue
    const/16 v5, 0x22

    const/4 v3, 0x1

    .line 521
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 522
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    move v2, v3

    :goto_0
    const-string v4, "host string is empty"

    invoke-static {v2, v4}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 523
    const/4 v0, 0x0

    .line 527
    .local v0, retval:Ljava/net/InetAddress;
    :try_start_0
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->forString(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    .line 528
    instance-of v2, v0, Ljava/net/Inet4Address;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v2, :cond_1

    move-object v1, v0

    .line 542
    .end local v0           #retval:Ljava/net/InetAddress;
    .local v1, retval:Ljava/net/InetAddress;
    :goto_1
    return-object v1

    .line 522
    .end local v1           #retval:Ljava/net/InetAddress;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 531
    .restart local v0       #retval:Ljava/net/InetAddress;
    :catch_0
    move-exception v2

    .line 536
    :cond_1
    const-string v2, "["

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v2, "]"

    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 537
    :cond_2
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Not a valid address: \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 540
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/common/net/InetAddresses;->forString(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    .line 541
    instance-of v2, v0, Ljava/net/Inet6Address;

    if-eqz v2, :cond_4

    move-object v1, v0

    .line 542
    .end local v0           #retval:Ljava/net/InetAddress;
    .restart local v1       #retval:Ljava/net/InetAddress;
    goto :goto_1

    .line 545
    .end local v1           #retval:Ljava/net/InetAddress;
    .restart local v0       #retval:Ljava/net/InetAddress;
    :cond_4
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Not a valid address: \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static fromInteger(I)Ljava/net/Inet4Address;
    .locals 1
    .parameter "address"

    .prologue
    .line 1040
    invoke-static {p0}, Lcom/google/common/primitives/Ints;->toByteArray(I)[B

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object v0

    return-object v0
.end method

.method public static fromLittleEndianByteArray([B)Ljava/net/InetAddress;
    .locals 3
    .parameter "addr"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 1056
    array-length v2, p0

    new-array v1, v2, [B

    .line 1057
    .local v1, reversed:[B
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 1058
    array-length v2, p0

    sub-int/2addr v2, v0

    add-int/lit8 v2, v2, -0x1

    aget-byte v2, p0, v2

    aput-byte v2, v1, v0

    .line 1057
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1060
    :cond_0
    invoke-static {v1}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v2

    return-object v2
.end method

.method public static get6to4IPv4Address(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;
    .locals 5
    .parameter "ip"

    .prologue
    .line 649
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->is6to4Address(Ljava/net/Inet6Address;)Z

    move-result v0

    const-string v1, "Address \'%s\' is not a 6to4 address."

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 652
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x6

    invoke-static {v0, v1, v2}, Lcom/google/common/net/InetAddresses;->copyOfRange([BII)[B

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object v0

    return-object v0
.end method

.method public static getCoercedIPv4Address(Ljava/net/InetAddress;)Ljava/net/Inet4Address;
    .locals 10
    .parameter "ip"

    .prologue
    const/16 v9, 0xf

    .line 942
    instance-of v7, p0, Ljava/net/Inet4Address;

    if-eqz v7, :cond_0

    .line 943
    check-cast p0, Ljava/net/Inet4Address;

    .line 983
    .end local p0
    .local v2, bytes:[B
    .local v4, i:I
    .local v6, leadingBytesOfZero:Z
    :goto_0
    return-object p0

    .line 947
    .end local v2           #bytes:[B
    .end local v4           #i:I
    .end local v6           #leadingBytesOfZero:Z
    .restart local p0
    :cond_0
    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v2

    .line 948
    .restart local v2       #bytes:[B
    const/4 v6, 0x1

    .line 949
    .restart local v6       #leadingBytesOfZero:Z
    const/4 v4, 0x0

    .restart local v4       #i:I
    :goto_1
    if-ge v4, v9, :cond_1

    .line 950
    aget-byte v7, v2, v4

    if-eqz v7, :cond_2

    .line 951
    const/4 v6, 0x0

    .line 955
    :cond_1
    if-eqz v6, :cond_3

    aget-byte v7, v2, v9

    const/4 v8, 0x1

    if-ne v7, v8, :cond_3

    .line 956
    sget-object p0, Lcom/google/common/net/InetAddresses;->LOOPBACK4:Ljava/net/Inet4Address;

    goto :goto_0

    .line 949
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 957
    :cond_3
    if-eqz v6, :cond_4

    aget-byte v7, v2, v9

    if-nez v7, :cond_4

    .line 958
    sget-object p0, Lcom/google/common/net/InetAddresses;->ANY4:Ljava/net/Inet4Address;

    goto :goto_0

    :cond_4
    move-object v5, p0

    .line 961
    check-cast v5, Ljava/net/Inet6Address;

    .line 962
    .local v5, ip6:Ljava/net/Inet6Address;
    const-wide/16 v0, 0x0

    .line 963
    .local v0, addressAsLong:J
    invoke-static {v5}, Lcom/google/common/net/InetAddresses;->hasEmbeddedIPv4ClientAddress(Ljava/net/Inet6Address;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 964
    invoke-static {v5}, Lcom/google/common/net/InetAddresses;->getEmbeddedIPv4ClientAddress(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;

    move-result-object v7

    invoke-virtual {v7}, Ljava/net/Inet4Address;->hashCode()I

    move-result v7

    int-to-long v0, v7

    .line 972
    :goto_2
    invoke-static {v0, v1}, Lcom/google/common/net/InetAddresses;->hash64To32(J)I

    move-result v3

    .line 975
    .local v3, coercedHash:I
    const/high16 v7, -0x2000

    or-int/2addr v3, v7

    .line 979
    const/4 v7, -0x1

    if-ne v3, v7, :cond_5

    .line 980
    const/4 v3, -0x2

    .line 983
    :cond_5
    invoke-static {v3}, Lcom/google/common/primitives/Ints;->toByteArray(I)[B

    move-result-object v7

    invoke-static {v7}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object p0

    goto :goto_0

    .line 968
    .end local v3           #coercedHash:I
    :cond_6
    invoke-virtual {v5}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v7

    const/4 v8, 0x0

    const/16 v9, 0x8

    invoke-static {v7, v8, v9}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    goto :goto_2
.end method

.method public static getCompatIPv4Address(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;
    .locals 5
    .parameter "ip"

    .prologue
    .line 613
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isCompatIPv4Address(Ljava/net/Inet6Address;)Z

    move-result v0

    const-string v1, "Address \'%s\' is not IPv4-compatible."

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 616
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v0

    const/16 v1, 0xc

    const/16 v2, 0x10

    invoke-static {v0, v1, v2}, Lcom/google/common/net/InetAddresses;->copyOfRange([BII)[B

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object v0

    return-object v0
.end method

.method public static getEmbeddedIPv4ClientAddress(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;
    .locals 5
    .parameter "ip"

    .prologue
    .line 863
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isCompatIPv4Address(Ljava/net/Inet6Address;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 864
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->getCompatIPv4Address(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;

    move-result-object v0

    .line 872
    :goto_0
    return-object v0

    .line 867
    :cond_0
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->is6to4Address(Ljava/net/Inet6Address;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 868
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->get6to4IPv4Address(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;

    move-result-object v0

    goto :goto_0

    .line 871
    :cond_1
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isTeredoAddress(Ljava/net/Inet6Address;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 872
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->getTeredoInfo(Ljava/net/Inet6Address;)Lcom/google/common/net/InetAddresses$TeredoInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/net/InetAddresses$TeredoInfo;->getClient()Ljava/net/Inet4Address;

    move-result-object v0

    goto :goto_0

    .line 875
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'%s\' has no embedded IPv4 address."

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static getInet4Address([B)Ljava/net/Inet4Address;
    .locals 9
    .parameter "bytes"

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 141
    array-length v2, p0

    const/4 v5, 0x4

    if-ne v2, v5, :cond_0

    move v2, v3

    :goto_0
    const-string v5, "Byte array has invalid length for an IPv4 address: %s != 4."

    new-array v6, v3, [Ljava/lang/Object;

    array-length v7, p0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v4

    invoke-static {v2, v5, v6}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 146
    :try_start_0
    invoke-static {p0}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v1

    .line 147
    .local v1, ipv4:Ljava/net/InetAddress;
    instance-of v2, v1, Ljava/net/Inet4Address;

    if-nez v2, :cond_1

    .line 148
    new-instance v2, Ljava/net/UnknownHostException;

    const-string v5, "\'%s\' is not an IPv4 address."

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    .line 154
    .end local v1           #ipv4:Ljava/net/InetAddress;
    :catch_0
    move-exception v0

    .line 166
    .local v0, e:Ljava/net/UnknownHostException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v5, "Host address \'%s\' is not a valid IPv4 address."

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v4

    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .end local v0           #e:Ljava/net/UnknownHostException;
    :cond_0
    move v2, v4

    .line 141
    goto :goto_0

    .line 153
    .restart local v1       #ipv4:Ljava/net/InetAddress;
    :cond_1
    :try_start_1
    check-cast v1, Ljava/net/Inet4Address;
    :try_end_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_0

    .end local v1           #ipv4:Ljava/net/InetAddress;
    return-object v1
.end method

.method public static getIsatapIPv4Address(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;
    .locals 5
    .parameter "ip"

    .prologue
    .line 823
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isIsatapAddress(Ljava/net/Inet6Address;)Z

    move-result v0

    const-string v1, "Address \'%s\' is not an ISATAP address."

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 826
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v0

    const/16 v1, 0xc

    const/16 v2, 0x10

    invoke-static {v0, v1, v2}, Lcom/google/common/net/InetAddresses;->copyOfRange([BII)[B

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object v0

    return-object v0
.end method

.method public static getTeredoInfo(Ljava/net/Inet6Address;)Lcom/google/common/net/InetAddresses$TeredoInfo;
    .locals 14
    .parameter "ip"

    .prologue
    const v13, 0xffff

    const/16 v12, 0x8

    .line 755
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isTeredoAddress(Ljava/net/Inet6Address;)Z

    move-result v7

    const-string v8, "Address \'%s\' is not a Teredo address."

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v7, v8, v9}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 758
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v0

    .line 759
    .local v0, bytes:[B
    const/4 v7, 0x4

    invoke-static {v0, v7, v12}, Lcom/google/common/net/InetAddresses;->copyOfRange([BII)[B

    move-result-object v7

    invoke-static {v7}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object v6

    .line 761
    .local v6, server:Ljava/net/Inet4Address;
    invoke-static {v0, v12}, Lcom/google/common/io/ByteStreams;->newDataInput([BI)Lcom/google/common/io/ByteArrayDataInput;

    move-result-object v7

    invoke-interface {v7}, Lcom/google/common/io/ByteArrayDataInput;->readShort()S

    move-result v7

    and-int v3, v7, v13

    .line 764
    .local v3, flags:I
    const/16 v7, 0xa

    invoke-static {v0, v7}, Lcom/google/common/io/ByteStreams;->newDataInput([BI)Lcom/google/common/io/ByteArrayDataInput;

    move-result-object v7

    invoke-interface {v7}, Lcom/google/common/io/ByteArrayDataInput;->readShort()S

    move-result v7

    xor-int/lit8 v7, v7, -0x1

    and-int v5, v7, v13

    .line 766
    .local v5, port:I
    const/16 v7, 0xc

    const/16 v8, 0x10

    invoke-static {v0, v7, v8}, Lcom/google/common/net/InetAddresses;->copyOfRange([BII)[B

    move-result-object v2

    .line 767
    .local v2, clientBytes:[B
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    array-length v7, v2

    if-ge v4, v7, :cond_0

    .line 769
    aget-byte v7, v2, v4

    xor-int/lit8 v7, v7, -0x1

    int-to-byte v7, v7

    aput-byte v7, v2, v4

    .line 767
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 771
    :cond_0
    invoke-static {v2}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object v1

    .line 773
    .local v1, client:Ljava/net/Inet4Address;
    new-instance v7, Lcom/google/common/net/InetAddresses$TeredoInfo;

    invoke-direct {v7, v6, v1, v5, v3}, Lcom/google/common/net/InetAddresses$TeredoInfo;-><init>(Ljava/net/Inet4Address;Ljava/net/Inet4Address;II)V

    return-object v7
.end method

.method public static hasEmbeddedIPv4ClientAddress(Ljava/net/Inet6Address;)Z
    .locals 1
    .parameter "ip"

    .prologue
    .line 843
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isCompatIPv4Address(Ljava/net/Inet6Address;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->is6to4Address(Ljava/net/Inet6Address;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isTeredoAddress(Ljava/net/Inet6Address;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static hash64To32(J)I
    .locals 4
    .parameter "key"
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation

    .prologue
    .line 998
    const-wide/16 v0, -0x1

    xor-long/2addr v0, p0

    const/16 v2, 0x12

    shl-long v2, p0, v2

    add-long p0, v0, v2

    .line 999
    const/16 v0, 0x1f

    ushr-long v0, p0, v0

    xor-long/2addr p0, v0

    .line 1000
    const-wide/16 v0, 0x15

    mul-long/2addr p0, v0

    .line 1001
    const/16 v0, 0xb

    ushr-long v0, p0, v0

    xor-long/2addr p0, v0

    .line 1002
    const/4 v0, 0x6

    shl-long v0, p0, v0

    add-long/2addr p0, v0

    .line 1003
    const/16 v0, 0x16

    ushr-long v0, p0, v0

    xor-long/2addr p0, v0

    .line 1004
    long-to-int v0, p0

    return v0
.end method

.method private static hextetsToIPv6String([I)Ljava/lang/String;
    .locals 5
    .parameter "hextets"

    .prologue
    .line 454
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v4, 0x27

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 455
    .local v0, buf:Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 456
    .local v2, lastWasNumber:Z
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v4, p0

    if-ge v1, v4, :cond_5

    .line 457
    aget v4, p0, v1

    if-ltz v4, :cond_2

    const/4 v3, 0x1

    .line 458
    .local v3, thisIsNumber:Z
    :goto_1
    if-eqz v3, :cond_3

    .line 459
    if-eqz v2, :cond_0

    .line 460
    const/16 v4, 0x3a

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 462
    :cond_0
    aget v4, p0, v1

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 468
    :cond_1
    :goto_2
    move v2, v3

    .line 456
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 457
    .end local v3           #thisIsNumber:Z
    :cond_2
    const/4 v3, 0x0

    goto :goto_1

    .line 464
    .restart local v3       #thisIsNumber:Z
    :cond_3
    if-eqz v1, :cond_4

    if-eqz v2, :cond_1

    .line 465
    :cond_4
    const-string v4, "::"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 470
    .end local v3           #thisIsNumber:Z
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public static increment(Ljava/net/InetAddress;)Ljava/net/InetAddress;
    .locals 7
    .parameter "address"

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1074
    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v0

    .line 1075
    .local v0, addr:[B
    array-length v3, v0

    add-int/lit8 v2, v3, -0x1

    .line 1076
    .local v2, i:I
    :goto_0
    if-ltz v2, :cond_0

    aget-byte v3, v0, v2

    const/4 v6, -0x1

    if-ne v3, v6, :cond_0

    .line 1077
    aput-byte v5, v0, v2

    .line 1078
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 1081
    :cond_0
    if-ltz v2, :cond_1

    move v3, v4

    :goto_1
    const-string v6, "Incrementing %s would wrap."

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p0, v4, v5

    invoke-static {v3, v6, v4}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 1083
    aget-byte v3, v0, v2

    add-int/lit8 v3, v3, 0x1

    int-to-byte v3, v3

    aput-byte v3, v0, v2

    .line 1085
    :try_start_0
    invoke-static {v0}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    return-object v3

    :cond_1
    move v3, v5

    .line 1081
    goto :goto_1

    .line 1086
    :catch_0
    move-exception v1

    .line 1087
    .local v1, e:Ljava/net/UnknownHostException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3
.end method

.method private static ipStringToBytes(Ljava/lang/String;)[B
    .locals 7
    .parameter "ipString"

    .prologue
    const/4 v4, 0x0

    .line 228
    const/4 v1, 0x0

    .line 229
    .local v1, hasColon:Z
    const/4 v2, 0x0

    .line 230
    .local v2, hasDot:Z
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v3, v5, :cond_5

    .line 231
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 232
    .local v0, c:C
    const/16 v5, 0x2e

    if-ne v0, v5, :cond_1

    .line 233
    const/4 v2, 0x1

    .line 230
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 234
    :cond_1
    const/16 v5, 0x3a

    if-ne v0, v5, :cond_4

    .line 235
    if-eqz v2, :cond_3

    .line 256
    .end local v0           #c:C
    :cond_2
    :goto_2
    return-object v4

    .line 238
    .restart local v0       #c:C
    :cond_3
    const/4 v1, 0x1

    goto :goto_1

    .line 239
    :cond_4
    const/16 v5, 0x10

    invoke-static {v0, v5}, Ljava/lang/Character;->digit(CI)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_0

    goto :goto_2

    .line 245
    .end local v0           #c:C
    :cond_5
    if-eqz v1, :cond_7

    .line 246
    if-eqz v2, :cond_6

    .line 247
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->convertDottedQuadToHex(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 248
    if-eqz p0, :cond_2

    .line 252
    :cond_6
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->textToNumericFormatV6(Ljava/lang/String;)[B

    move-result-object v4

    goto :goto_2

    .line 253
    :cond_7
    if-eqz v2, :cond_2

    .line 254
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->textToNumericFormatV4(Ljava/lang/String;)[B

    move-result-object v4

    goto :goto_2
.end method

.method public static is6to4Address(Ljava/net/Inet6Address;)Z
    .locals 5
    .parameter "ip"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 635
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v0

    .line 636
    .local v0, bytes:[B
    aget-byte v3, v0, v2

    const/16 v4, 0x20

    if-ne v3, v4, :cond_0

    aget-byte v3, v0, v1

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    :goto_0
    return v1

    :cond_0
    move v1, v2

    goto :goto_0
.end method

.method public static isCompatIPv4Address(Ljava/net/Inet6Address;)Z
    .locals 5
    .parameter "ip"

    .prologue
    const/16 v4, 0xf

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 590
    invoke-virtual {p0}, Ljava/net/Inet6Address;->isIPv4CompatibleAddress()Z

    move-result v3

    if-nez v3, :cond_1

    .line 600
    :cond_0
    :goto_0
    return v1

    .line 594
    :cond_1
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v0

    .line 595
    .local v0, bytes:[B
    const/16 v3, 0xc

    aget-byte v3, v0, v3

    if-nez v3, :cond_2

    const/16 v3, 0xd

    aget-byte v3, v0, v3

    if-nez v3, :cond_2

    const/16 v3, 0xe

    aget-byte v3, v0, v3

    if-nez v3, :cond_2

    aget-byte v3, v0, v4

    if-eqz v3, :cond_0

    aget-byte v3, v0, v4

    if-eq v3, v2, :cond_0

    :cond_2
    move v1, v2

    .line 600
    goto :goto_0
.end method

.method public static isInetAddress(Ljava/lang/String;)Z
    .locals 1
    .parameter "ipString"

    .prologue
    .line 223
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->ipStringToBytes(Ljava/lang/String;)[B

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isIsatapAddress(Ljava/net/Inet6Address;)Z
    .locals 4
    .parameter "ip"

    .prologue
    const/4 v1, 0x0

    .line 796
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isTeredoAddress(Ljava/net/Inet6Address;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 809
    :cond_0
    :goto_0
    return v1

    .line 800
    :cond_1
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v0

    .line 802
    .local v0, bytes:[B
    const/16 v2, 0x8

    aget-byte v2, v0, v2

    or-int/lit8 v2, v2, 0x3

    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    .line 809
    const/16 v2, 0x9

    aget-byte v2, v0, v2

    if-nez v2, :cond_0

    const/16 v2, 0xa

    aget-byte v2, v0, v2

    const/16 v3, 0x5e

    if-ne v2, v3, :cond_0

    const/16 v2, 0xb

    aget-byte v2, v0, v2

    const/4 v3, -0x2

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static isMappedIPv4Address(Ljava/lang/String;)Z
    .locals 5
    .parameter "ipString"

    .prologue
    const/4 v2, 0x0

    .line 904
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->ipStringToBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 905
    .local v0, bytes:[B
    if-eqz v0, :cond_0

    array-length v3, v0

    const/16 v4, 0x10

    if-ne v3, v4, :cond_0

    .line 906
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    const/16 v3, 0xa

    if-ge v1, v3, :cond_2

    .line 907
    aget-byte v3, v0, v1

    if-eqz v3, :cond_1

    .line 918
    .end local v1           #i:I
    :cond_0
    :goto_1
    return v2

    .line 906
    .restart local v1       #i:I
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 911
    :cond_2
    const/16 v1, 0xa

    :goto_2
    const/16 v3, 0xc

    if-ge v1, v3, :cond_3

    .line 912
    aget-byte v3, v0, v1

    const/4 v4, -0x1

    if-ne v3, v4, :cond_0

    .line 911
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 916
    :cond_3
    const/4 v2, 0x1

    goto :goto_1
.end method

.method public static isMaximum(Ljava/net/InetAddress;)Z
    .locals 4
    .parameter "address"

    .prologue
    .line 1100
    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v0

    .line 1101
    .local v0, addr:[B
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 1102
    aget-byte v2, v0, v1

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 1103
    const/4 v2, 0x0

    .line 1106
    :goto_1
    return v2

    .line 1101
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1106
    :cond_1
    const/4 v2, 0x1

    goto :goto_1
.end method

.method public static isTeredoAddress(Ljava/net/Inet6Address;)Z
    .locals 5
    .parameter "ip"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 740
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v0

    .line 741
    .local v0, bytes:[B
    aget-byte v3, v0, v2

    const/16 v4, 0x20

    if-ne v3, v4, :cond_0

    aget-byte v3, v0, v1

    if-ne v3, v1, :cond_0

    const/4 v3, 0x2

    aget-byte v3, v0, v3

    if-nez v3, :cond_0

    const/4 v3, 0x3

    aget-byte v3, v0, v3

    if-nez v3, :cond_0

    :goto_0
    return v1

    :cond_0
    move v1, v2

    goto :goto_0
.end method

.method public static isUriInetAddress(Ljava/lang/String;)Z
    .locals 2
    .parameter "ipString"

    .prologue
    .line 557
    :try_start_0
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->forUriString(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 558
    const/4 v1, 0x1

    .line 560
    :goto_0
    return v1

    .line 559
    :catch_0
    move-exception v0

    .line 560
    .local v0, e:Ljava/lang/IllegalArgumentException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static parseHextet(Ljava/lang/String;)S
    .locals 2
    .parameter "ipPart"

    .prologue
    .line 366
    const/16 v1, 0x10

    invoke-static {p0, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    .line 367
    .local v0, hextet:I
    const v1, 0xffff

    if-le v0, v1, :cond_0

    .line 368
    new-instance v1, Ljava/lang/NumberFormatException;

    invoke-direct {v1}, Ljava/lang/NumberFormatException;-><init>()V

    throw v1

    .line 370
    :cond_0
    int-to-short v1, v0

    return v1
.end method

.method private static parseOctet(Ljava/lang/String;)B
    .locals 3
    .parameter "ipPart"

    .prologue
    .line 355
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 358
    .local v0, octet:I
    const/16 v1, 0xff

    if-gt v0, v1, :cond_0

    const-string v1, "0"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_1

    .line 359
    :cond_0
    new-instance v1, Ljava/lang/NumberFormatException;

    invoke-direct {v1}, Ljava/lang/NumberFormatException;-><init>()V

    throw v1

    .line 361
    :cond_1
    int-to-byte v1, v0

    return v1
.end method

.method private static textToNumericFormatV4(Ljava/lang/String;)[B
    .locals 8
    .parameter "ipString"

    .prologue
    const/4 v4, 0x0

    const/4 v7, 0x4

    .line 260
    const-string v5, "\\."

    const/4 v6, 0x5

    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .line 261
    .local v0, address:[Ljava/lang/String;
    array-length v5, v0

    if-eq v5, v7, :cond_1

    move-object v1, v4

    .line 274
    :cond_0
    :goto_0
    return-object v1

    .line 265
    :cond_1
    new-array v1, v7, [B

    .line 267
    .local v1, bytes:[B
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    :try_start_0
    array-length v5, v1

    if-ge v3, v5, :cond_0

    .line 268
    aget-object v5, v0, v3

    invoke-static {v5}, Lcom/google/common/net/InetAddresses;->parseOctet(Ljava/lang/String;)B

    move-result v5

    aput-byte v5, v1, v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 267
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 270
    :catch_0
    move-exception v2

    .local v2, ex:Ljava/lang/NumberFormatException;
    move-object v1, v4

    .line 271
    goto :goto_0
.end method

.method private static textToNumericFormatV6(Ljava/lang/String;)[B
    .locals 12
    .parameter "ipString"

    .prologue
    const/4 v11, 0x0

    const/4 v8, 0x0

    .line 279
    const-string v9, ":"

    const/16 v10, 0xa

    invoke-virtual {p0, v9, v10}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v2

    .line 280
    .local v2, parts:[Ljava/lang/String;
    array-length v9, v2

    const/4 v10, 0x3

    if-lt v9, v10, :cond_0

    array-length v9, v2

    const/16 v10, 0x9

    if-le v9, v10, :cond_1

    .line 337
    :cond_0
    :goto_0
    return-object v8

    .line 286
    :cond_1
    const/4 v7, -0x1

    .line 287
    .local v7, skipIndex:I
    const/4 v1, 0x1

    .local v1, i:I
    :goto_1
    array-length v9, v2

    add-int/lit8 v9, v9, -0x1

    if-ge v1, v9, :cond_3

    .line 288
    aget-object v9, v2, v1

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-nez v9, :cond_2

    .line 289
    if-gez v7, :cond_0

    .line 292
    move v7, v1

    .line 287
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 298
    :cond_3
    if-ltz v7, :cond_7

    .line 300
    move v3, v7

    .line 301
    .local v3, partsHi:I
    array-length v9, v2

    sub-int/2addr v9, v7

    add-int/lit8 v4, v9, -0x1

    .line 302
    .local v4, partsLo:I
    aget-object v9, v2, v11

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-nez v9, :cond_4

    add-int/lit8 v3, v3, -0x1

    if-nez v3, :cond_0

    .line 305
    :cond_4
    array-length v9, v2

    add-int/lit8 v9, v9, -0x1

    aget-object v9, v2, v9

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-nez v9, :cond_5

    add-int/lit8 v4, v4, -0x1

    if-nez v4, :cond_0

    .line 317
    :cond_5
    :goto_2
    add-int v9, v3, v4

    rsub-int/lit8 v5, v9, 0x8

    .line 318
    .local v5, partsSkipped:I
    if-ltz v7, :cond_8

    const/4 v9, 0x1

    if-lt v5, v9, :cond_0

    .line 323
    :cond_6
    const/16 v9, 0x10

    invoke-static {v9}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 325
    .local v6, rawBytes:Ljava/nio/ByteBuffer;
    const/4 v1, 0x0

    :goto_3
    if-ge v1, v3, :cond_9

    .line 326
    :try_start_0
    aget-object v9, v2, v1

    invoke-static {v9}, Lcom/google/common/net/InetAddresses;->parseHextet(Ljava/lang/String;)S

    move-result v9

    invoke-virtual {v6, v9}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 325
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 311
    .end local v3           #partsHi:I
    .end local v4           #partsLo:I
    .end local v5           #partsSkipped:I
    .end local v6           #rawBytes:Ljava/nio/ByteBuffer;
    :cond_7
    array-length v3, v2

    .line 312
    .restart local v3       #partsHi:I
    const/4 v4, 0x0

    .restart local v4       #partsLo:I
    goto :goto_2

    .line 318
    .restart local v5       #partsSkipped:I
    :cond_8
    if-eqz v5, :cond_6

    goto :goto_0

    .line 328
    .restart local v6       #rawBytes:Ljava/nio/ByteBuffer;
    :cond_9
    const/4 v1, 0x0

    :goto_4
    if-ge v1, v5, :cond_a

    .line 329
    const/4 v9, 0x0

    :try_start_1
    invoke-virtual {v6, v9}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 328
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 331
    :cond_a
    move v1, v4

    :goto_5
    if-lez v1, :cond_b

    .line 332
    array-length v9, v2

    sub-int/2addr v9, v1

    aget-object v9, v2, v9

    invoke-static {v9}, Lcom/google/common/net/InetAddresses;->parseHextet(Ljava/lang/String;)S

    move-result v9

    invoke-virtual {v6, v9}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 331
    add-int/lit8 v1, v1, -0x1

    goto :goto_5

    .line 334
    :catch_0
    move-exception v0

    .line 335
    .local v0, ex:Ljava/lang/NumberFormatException;
    goto :goto_0

    .line 337
    .end local v0           #ex:Ljava/lang/NumberFormatException;
    :cond_b
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v8

    goto :goto_0
.end method

.method public static toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;
    .locals 6
    .parameter "ip"

    .prologue
    const/4 v5, 0x0

    .line 391
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    instance-of v3, p0, Ljava/net/Inet4Address;

    if-eqz v3, :cond_0

    .line 394
    invoke-virtual {p0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    .line 404
    :goto_0
    return-object v3

    .line 396
    :cond_0
    instance-of v3, p0, Ljava/net/Inet6Address;

    invoke-static {v3}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 397
    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v0

    .line 398
    .local v0, bytes:[B
    const/16 v3, 0x8

    new-array v1, v3, [I

    .line 399
    .local v1, hextets:[I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    array-length v3, v1

    if-ge v2, v3, :cond_1

    .line 400
    mul-int/lit8 v3, v2, 0x2

    aget-byte v3, v0, v3

    mul-int/lit8 v4, v2, 0x2

    add-int/lit8 v4, v4, 0x1

    aget-byte v4, v0, v4

    invoke-static {v5, v5, v3, v4}, Lcom/google/common/primitives/Ints;->fromBytes(BBBB)I

    move-result v3

    aput v3, v1, v2

    .line 399
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 403
    :cond_1
    invoke-static {v1}, Lcom/google/common/net/InetAddresses;->compressLongestRunOfZeroes([I)V

    .line 404
    invoke-static {v1}, Lcom/google/common/net/InetAddresses;->hextetsToIPv6String([I)Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public static toUriString(Ljava/net/InetAddress;)Ljava/lang/String;
    .locals 2
    .parameter "ip"

    .prologue
    .line 499
    instance-of v0, p0, Ljava/net/Inet6Address;

    if-eqz v0, :cond_0

    .line 500
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 502
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
