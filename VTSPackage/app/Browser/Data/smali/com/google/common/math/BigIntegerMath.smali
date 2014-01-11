.class public final Lcom/google/common/math/BigIntegerMath;
.super Ljava/lang/Object;
.source "BigIntegerMath.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/math/BigIntegerMath$1;
    }
.end annotation


# static fields
.field static final SQRT2_PRECOMPUTED_BITS:Ljava/math/BigInteger; = null
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation
.end field

.field static final SQRT2_PRECOMPUTE_THRESHOLD:I = 0x100
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 115
    new-instance v0, Ljava/math/BigInteger;

    const-string v1, "16a09e667f3bcc908b2fb1366ea957d3e3adec17512775099da2f590b0667322a"

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/math/BigIntegerMath;->SQRT2_PRECOMPUTED_BITS:Ljava/math/BigInteger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 391
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static binomial(II)Ljava/math/BigInteger;
    .locals 8
    .parameter "n"
    .parameter "k"

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 369
    const-string v2, "n"

    invoke-static {v2, p0}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 370
    const-string v2, "k"

    invoke-static {v2, p1}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 371
    if-gt p1, p0, :cond_2

    move v2, v3

    :goto_0
    const-string v5, "k (%s) > n (%s)"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v4

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v6, v3

    invoke-static {v2, v5, v6}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 372
    shr-int/lit8 v2, p0, 0x1

    if-le p1, v2, :cond_0

    .line 373
    sub-int p1, p0, p1

    .line 375
    :cond_0
    sget-object v2, Lcom/google/common/math/LongMath;->BIGGEST_BINOMIALS:[I

    array-length v2, v2

    if-ge p1, v2, :cond_3

    sget-object v2, Lcom/google/common/math/LongMath;->BIGGEST_BINOMIALS:[I

    aget v2, v2, p1

    if-gt p0, v2, :cond_3

    .line 376
    invoke-static {p0, p1}, Lcom/google/common/math/LongMath;->binomial(II)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    .line 383
    :cond_1
    return-object v1

    :cond_2
    move v2, v4

    .line 371
    goto :goto_0

    .line 378
    :cond_3
    sget-object v1, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    .line 379
    .local v1, result:Ljava/math/BigInteger;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-ge v0, p1, :cond_1

    .line 380
    sub-int v2, p0, v0

    int-to-long v2, v2

    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    .line 381
    add-int/lit8 v2, v0, 0x1

    int-to-long v2, v2

    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    .line 379
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static divide(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/RoundingMode;)Ljava/math/BigInteger;
    .locals 3
    .parameter "p"
    .parameter "q"
    .parameter "mode"

    .prologue
    .line 267
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p0}, Ljava/math/BigDecimal;-><init>(Ljava/math/BigInteger;)V

    .line 268
    .local v0, pDec:Ljava/math/BigDecimal;
    new-instance v1, Ljava/math/BigDecimal;

    invoke-direct {v1, p1}, Ljava/math/BigDecimal;-><init>(Ljava/math/BigInteger;)V

    .line 269
    .local v1, qDec:Ljava/math/BigDecimal;
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p2}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigDecimal;->toBigIntegerExact()Ljava/math/BigInteger;

    move-result-object v2

    return-object v2
.end method

.method public static factorial(I)Ljava/math/BigInteger;
    .locals 21
    .parameter "n"

    .prologue
    .line 285
    const-string v17, "n"

    move-object/from16 v0, v17

    move/from16 v1, p0

    invoke-static {v0, v1}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 288
    sget-object v17, Lcom/google/common/math/LongMath;->FACTORIALS:[J

    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v17, v0

    move/from16 v0, p0

    move/from16 v1, v17

    if-ge v0, v1, :cond_0

    .line 289
    sget-object v17, Lcom/google/common/math/LongMath;->FACTORIALS:[J

    aget-wide v17, v17, p0

    invoke-static/range {v17 .. v18}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v17

    .line 336
    :goto_0
    return-object v17

    .line 293
    :cond_0
    sget-object v17, Ljava/math/RoundingMode;->CEILING:Ljava/math/RoundingMode;

    move/from16 v0, p0

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/common/math/IntMath;->log2(ILjava/math/RoundingMode;)I

    move-result v17

    mul-int v17, v17, p0

    const/16 v18, 0x40

    sget-object v19, Ljava/math/RoundingMode;->CEILING:Ljava/math/RoundingMode;

    invoke-static/range {v17 .. v19}, Lcom/google/common/math/IntMath;->divide(IILjava/math/RoundingMode;)I

    move-result v2

    .line 294
    .local v2, approxSize:I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 297
    .local v3, bignums:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/math/BigInteger;>;"
    sget-object v17, Lcom/google/common/math/LongMath;->FACTORIALS:[J

    move-object/from16 v0, v17

    array-length v15, v0

    .line 298
    .local v15, startingNumber:I
    sget-object v17, Lcom/google/common/math/LongMath;->FACTORIALS:[J

    add-int/lit8 v18, v15, -0x1

    aget-wide v11, v17, v18

    .line 300
    .local v11, product:J
    invoke-static {v11, v12}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    move-result v14

    .line 301
    .local v14, shift:I
    shr-long/2addr v11, v14

    .line 304
    sget-object v17, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    move-object/from16 v0, v17

    invoke-static {v11, v12, v0}, Lcom/google/common/math/LongMath;->log2(JLjava/math/RoundingMode;)I

    move-result v17

    add-int/lit8 v13, v17, 0x1

    .line 305
    .local v13, productBits:I
    int-to-long v0, v15

    move-wide/from16 v17, v0

    sget-object v19, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    invoke-static/range {v17 .. v19}, Lcom/google/common/math/LongMath;->log2(JLjava/math/RoundingMode;)I

    move-result v17

    add-int/lit8 v4, v17, 0x1

    .line 307
    .local v4, bits:I
    const/16 v17, 0x1

    add-int/lit8 v18, v4, -0x1

    shl-int v5, v17, v18

    .line 310
    .local v5, nextPowerOfTwo:I
    int-to-long v9, v15

    .local v9, num:J
    :goto_1
    move/from16 v0, p0

    int-to-long v0, v0

    move-wide/from16 v17, v0

    cmp-long v17, v9, v17

    if-gtz v17, :cond_3

    .line 312
    int-to-long v0, v5

    move-wide/from16 v17, v0

    and-long v17, v17, v9

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-eqz v17, :cond_1

    .line 313
    shl-int/lit8 v5, v5, 0x1

    .line 314
    add-int/lit8 v4, v4, 0x1

    .line 317
    :cond_1
    invoke-static {v9, v10}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    move-result v16

    .line 318
    .local v16, tz:I
    shr-long v7, v9, v16

    .line 319
    .local v7, normalizedNum:J
    add-int v14, v14, v16

    .line 321
    sub-int v6, v4, v16

    .line 323
    .local v6, normalizedBits:I
    add-int v17, v6, v13

    const/16 v18, 0x40

    move/from16 v0, v17

    move/from16 v1, v18

    if-lt v0, v1, :cond_2

    .line 324
    invoke-static {v11, v12}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 325
    const-wide/16 v11, 0x1

    .line 326
    const/4 v13, 0x0

    .line 328
    :cond_2
    mul-long/2addr v11, v7

    .line 329
    sget-object v17, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    move-object/from16 v0, v17

    invoke-static {v11, v12, v0}, Lcom/google/common/math/LongMath;->log2(JLjava/math/RoundingMode;)I

    move-result v17

    add-int/lit8 v13, v17, 0x1

    .line 310
    const-wide/16 v17, 0x1

    add-long v9, v9, v17

    goto :goto_1

    .line 332
    .end local v6           #normalizedBits:I
    .end local v7           #normalizedNum:J
    .end local v16           #tz:I
    :cond_3
    const-wide/16 v17, 0x1

    cmp-long v17, v11, v17

    if-lez v17, :cond_4

    .line 333
    invoke-static {v11, v12}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 336
    :cond_4
    invoke-static {v3}, Lcom/google/common/math/BigIntegerMath;->listProduct(Ljava/util/List;)Ljava/math/BigInteger;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v17

    goto/16 :goto_0
.end method

.method static fitsInLong(Ljava/math/BigInteger;)Z
    .locals 2
    .parameter "x"

    .prologue
    .line 388
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v0

    const/16 v1, 0x3f

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isPowerOfTwo(Ljava/math/BigInteger;)Z
    .locals 2
    .parameter "x"

    .prologue
    .line 55
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Ljava/math/BigInteger;->getLowestSetBit()I

    move-result v0

    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static listProduct(Ljava/util/List;)Ljava/math/BigInteger;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/math/BigInteger;",
            ">;)",
            "Ljava/math/BigInteger;"
        }
    .end annotation

    .prologue
    .line 340
    .local p0, nums:Ljava/util/List;,"Ljava/util/List<Ljava/math/BigInteger;>;"
    const/4 v0, 0x0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {p0, v0, v1}, Lcom/google/common/math/BigIntegerMath;->listProduct(Ljava/util/List;II)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method static listProduct(Ljava/util/List;II)Ljava/math/BigInteger;
    .locals 3
    .parameter
    .parameter "start"
    .parameter "end"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/math/BigInteger;",
            ">;II)",
            "Ljava/math/BigInteger;"
        }
    .end annotation

    .prologue
    .line 344
    .local p0, nums:Ljava/util/List;,"Ljava/util/List<Ljava/math/BigInteger;>;"
    sub-int v1, p2, p1

    packed-switch v1, :pswitch_data_0

    .line 355
    add-int v1, p2, p1

    ushr-int/lit8 v0, v1, 0x1

    .line 356
    .local v0, m:I
    invoke-static {p0, p1, v0}, Lcom/google/common/math/BigIntegerMath;->listProduct(Ljava/util/List;II)Ljava/math/BigInteger;

    move-result-object v1

    invoke-static {p0, v0, p2}, Lcom/google/common/math/BigIntegerMath;->listProduct(Ljava/util/List;II)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    .end local v0           #m:I
    :goto_0
    return-object v1

    .line 346
    :pswitch_0
    sget-object v1, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    goto :goto_0

    .line 348
    :pswitch_1
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/math/BigInteger;

    goto :goto_0

    .line 350
    :pswitch_2
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/math/BigInteger;

    add-int/lit8 v2, p1, 0x1

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/math/BigInteger;

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    goto :goto_0

    .line 352
    :pswitch_3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/math/BigInteger;

    add-int/lit8 v2, p1, 0x1

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/math/BigInteger;

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    add-int/lit8 v1, p1, 0x2

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/math/BigInteger;

    invoke-virtual {v2, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    goto :goto_0

    .line 344
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public static log10(Ljava/math/BigInteger;Ljava/math/RoundingMode;)I
    .locals 12
    .parameter "x"
    .parameter "mode"

    .prologue
    const/4 v11, 0x2

    .line 127
    const-string v9, "x"

    invoke-static {v9, p0}, Lcom/google/common/math/MathPreconditions;->checkPositive(Ljava/lang/String;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 128
    invoke-static {p0}, Lcom/google/common/math/BigIntegerMath;->fitsInLong(Ljava/math/BigInteger;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 129
    invoke-virtual {p0}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v9

    invoke-static {v9, v10, p1}, Lcom/google/common/math/LongMath;->log10(JLjava/math/RoundingMode;)I

    move-result v0

    .line 168
    :cond_0
    :goto_0
    :pswitch_0
    return v0

    .line 133
    :cond_1
    new-instance v6, Ljava/util/ArrayList;

    const/16 v9, 0xa

    invoke-direct {v6, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 134
    .local v6, powersOf10:Ljava/util/List;,"Ljava/util/List<Ljava/math/BigInteger;>;"
    sget-object v5, Ljava/math/BigInteger;->TEN:Ljava/math/BigInteger;

    .line 135
    .local v5, powerOf10:Ljava/math/BigInteger;
    :goto_1
    invoke-virtual {p0, v5}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v9

    if-ltz v9, :cond_2

    .line 136
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    invoke-virtual {v5, v11}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    move-result-object v5

    goto :goto_1

    .line 139
    :cond_2
    sget-object v1, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    .line 140
    .local v1, floorPow:Ljava/math/BigInteger;
    const/4 v0, 0x0

    .line 141
    .local v0, floorLog:I
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9

    add-int/lit8 v3, v9, -0x1

    .local v3, i:I
    :goto_2
    if-ltz v3, :cond_4

    .line 142
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/math/BigInteger;

    .line 143
    .local v4, powOf10:Ljava/math/BigInteger;
    mul-int/lit8 v0, v0, 0x2

    .line 144
    invoke-virtual {v4, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    .line 145
    .local v7, tenPow:Ljava/math/BigInteger;
    invoke-virtual {p0, v7}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v9

    if-ltz v9, :cond_3

    .line 146
    move-object v1, v7

    .line 147
    add-int/lit8 v0, v0, 0x1

    .line 141
    :cond_3
    add-int/lit8 v3, v3, -0x1

    goto :goto_2

    .line 150
    .end local v4           #powOf10:Ljava/math/BigInteger;
    .end local v7           #tenPow:Ljava/math/BigInteger;
    :cond_4
    sget-object v9, Lcom/google/common/math/BigIntegerMath$1;->$SwitchMap$java$math$RoundingMode:[I

    invoke-virtual {p1}, Ljava/math/RoundingMode;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_0

    .line 170
    new-instance v9, Ljava/lang/AssertionError;

    invoke-direct {v9}, Ljava/lang/AssertionError;-><init>()V

    throw v9

    .line 152
    :pswitch_1
    invoke-virtual {v1, p0}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v9

    invoke-static {v9}, Lcom/google/common/math/MathPreconditions;->checkRoundingUnnecessary(Z)V

    goto :goto_0

    .line 160
    :pswitch_2
    invoke-virtual {v1, p0}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 166
    :pswitch_3
    invoke-virtual {p0, v11}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    move-result-object v8

    .line 167
    .local v8, x2:Ljava/math/BigInteger;
    invoke-virtual {v1, v11}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    move-result-object v9

    sget-object v10, Ljava/math/BigInteger;->TEN:Ljava/math/BigInteger;

    invoke-virtual {v9, v10}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 168
    .local v2, halfPowerSquared:Ljava/math/BigInteger;
    invoke-virtual {v8, v2}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v9

    if-lez v9, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 150
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method

.method public static log2(Ljava/math/BigInteger;Ljava/math/RoundingMode;)I
    .locals 6
    .parameter "x"
    .parameter "mode"

    .prologue
    .line 68
    const-string v5, "x"

    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/math/BigInteger;

    invoke-static {v5, v4}, Lcom/google/common/math/MathPreconditions;->checkPositive(Ljava/lang/String;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 69
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v4

    add-int/lit8 v1, v4, -0x1

    .line 70
    .local v1, logFloor:I
    sget-object v4, Lcom/google/common/math/BigIntegerMath$1;->$SwitchMap$java$math$RoundingMode:[I

    invoke-virtual {p1}, Ljava/math/RoundingMode;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    .line 104
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 72
    :pswitch_0
    invoke-static {p0}, Lcom/google/common/math/BigIntegerMath;->isPowerOfTwo(Ljava/math/BigInteger;)Z

    move-result v4

    invoke-static {v4}, Lcom/google/common/math/MathPreconditions;->checkRoundingUnnecessary(Z)V

    .line 101
    .end local v1           #logFloor:I
    :cond_0
    :goto_0
    :pswitch_1
    return v1

    .line 79
    .restart local v1       #logFloor:I
    :pswitch_2
    invoke-static {p0}, Lcom/google/common/math/BigIntegerMath;->isPowerOfTwo(Ljava/math/BigInteger;)Z

    move-result v4

    if-nez v4, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 84
    :pswitch_3
    const/16 v4, 0x100

    if-ge v1, v4, :cond_1

    .line 85
    sget-object v4, Lcom/google/common/math/BigIntegerMath;->SQRT2_PRECOMPUTED_BITS:Ljava/math/BigInteger;

    rsub-int v5, v1, 0x100

    invoke-virtual {v4, v5}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v0

    .line 87
    .local v0, halfPower:Ljava/math/BigInteger;
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v4

    if-lez v4, :cond_0

    .line 90
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 99
    .end local v0           #halfPower:Ljava/math/BigInteger;
    :cond_1
    const/4 v4, 0x2

    invoke-virtual {p0, v4}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    move-result-object v3

    .line 100
    .local v3, x2:Ljava/math/BigInteger;
    invoke-virtual {v3}, Ljava/math/BigInteger;->bitLength()I

    move-result v4

    add-int/lit8 v2, v4, -0x1

    .line 101
    .local v2, logX2Floor:I
    mul-int/lit8 v4, v1, 0x2

    add-int/lit8 v4, v4, 0x1

    if-lt v2, v4, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 70
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method

.method public static sqrt(Ljava/math/BigInteger;Ljava/math/RoundingMode;)Ljava/math/BigInteger;
    .locals 5
    .parameter "x"
    .parameter "mode"

    .prologue
    const/4 v4, 0x2

    .line 183
    const-string v2, "x"

    invoke-static {v2, p0}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 184
    invoke-static {p0}, Lcom/google/common/math/BigIntegerMath;->fitsInLong(Ljava/math/BigInteger;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 185
    invoke-virtual {p0}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3, p1}, Lcom/google/common/math/LongMath;->sqrt(JLjava/math/RoundingMode;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    .line 206
    :cond_0
    :goto_0
    :pswitch_0
    return-object v1

    .line 187
    :cond_1
    invoke-static {p0}, Lcom/google/common/math/BigIntegerMath;->sqrtFloor(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    .line 188
    .local v1, sqrtFloor:Ljava/math/BigInteger;
    sget-object v2, Lcom/google/common/math/BigIntegerMath$1;->$SwitchMap$java$math$RoundingMode:[I

    invoke-virtual {p1}, Ljava/math/RoundingMode;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 208
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 190
    :pswitch_1
    invoke-virtual {v1, v4}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v2

    invoke-static {v2}, Lcom/google/common/math/MathPreconditions;->checkRoundingUnnecessary(Z)V

    goto :goto_0

    .line 196
    :pswitch_2
    invoke-virtual {v1, v4}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    sget-object v2, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    goto :goto_0

    .line 200
    :pswitch_3
    invoke-virtual {v1, v4}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    .line 206
    .local v0, halfSquare:Ljava/math/BigInteger;
    invoke-virtual {v0, p0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v2

    if-gez v2, :cond_0

    sget-object v2, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    goto :goto_0

    .line 188
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method

.method private static sqrtApproxWithDoubles(Ljava/math/BigInteger;)Ljava/math/BigInteger;
    .locals 3
    .parameter "x"

    .prologue
    .line 256
    invoke-static {p0}, Lcom/google/common/math/DoubleUtils;->bigToDouble(Ljava/math/BigInteger;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    sget-object v2, Ljava/math/RoundingMode;->HALF_EVEN:Ljava/math/RoundingMode;

    invoke-static {v0, v1, v2}, Lcom/google/common/math/DoubleMath;->roundToBigInteger(DLjava/math/RoundingMode;)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method private static sqrtFloor(Ljava/math/BigInteger;)Ljava/math/BigInteger;
    .locals 8
    .parameter "x"

    .prologue
    const/4 v7, 0x1

    .line 233
    sget-object v5, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    invoke-static {p0, v5}, Lcom/google/common/math/BigIntegerMath;->log2(Ljava/math/BigInteger;Ljava/math/RoundingMode;)I

    move-result v0

    .line 234
    .local v0, log2:I
    const/16 v5, 0x3ff

    if-ge v0, v5, :cond_0

    .line 235
    invoke-static {p0}, Lcom/google/common/math/BigIntegerMath;->sqrtApproxWithDoubles(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 244
    .local v2, sqrt0:Ljava/math/BigInteger;
    :goto_0
    invoke-virtual {p0, v2}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v4

    .line 245
    .local v4, sqrt1:Ljava/math/BigInteger;
    invoke-virtual {v2, v4}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    move-object v3, v2

    .line 252
    .end local v2           #sqrt0:Ljava/math/BigInteger;
    .local v3, sqrt0:Ljava/math/BigInteger;
    :goto_1
    return-object v3

    .line 237
    .end local v3           #sqrt0:Ljava/math/BigInteger;
    .end local v4           #sqrt1:Ljava/math/BigInteger;
    :cond_0
    add-int/lit8 v5, v0, -0x34

    and-int/lit8 v1, v5, -0x2

    .line 242
    .local v1, shift:I
    invoke-virtual {p0, v1}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v5

    invoke-static {v5}, Lcom/google/common/math/BigIntegerMath;->sqrtApproxWithDoubles(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    shr-int/lit8 v6, v1, 0x1

    invoke-virtual {v5, v6}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v2

    .restart local v2       #sqrt0:Ljava/math/BigInteger;
    goto :goto_0

    .line 249
    .end local v1           #shift:I
    .restart local v4       #sqrt1:Ljava/math/BigInteger;
    :cond_1
    move-object v2, v4

    .line 250
    invoke-virtual {p0, v2}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v4

    .line 251
    invoke-virtual {v4, v2}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v5

    if-ltz v5, :cond_1

    move-object v3, v2

    .line 252
    .end local v2           #sqrt0:Ljava/math/BigInteger;
    .restart local v3       #sqrt0:Ljava/math/BigInteger;
    goto :goto_1
.end method
