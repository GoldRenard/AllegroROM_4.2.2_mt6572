.class public final Lcom/google/common/math/IntMath;
.super Ljava/lang/Object;
.source "IntMath.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation build Lcom/google/common/annotations/GwtCompatible;
    emulated = true
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/math/IntMath$1;
    }
.end annotation


# static fields
.field static BIGGEST_BINOMIALS:[I = null
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation
.end field

.field static final FACTORIALS:[I = null

.field static final FLOOR_SQRT_MAX_INT:I = 0xb504
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation
.end field

.field static final HALF_POWERS_OF_10:[I = null
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation
.end field

.field static final MAX_POWER_OF_SQRT2_UNSIGNED:I = -0x4afb0ccd
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation
.end field

.field static final POWERS_OF_10:[I
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/16 v1, 0xa

    .line 150
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/common/math/IntMath;->POWERS_OF_10:[I

    .line 154
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/google/common/math/IntMath;->HALF_POWERS_OF_10:[I

    .line 443
    const/16 v0, 0xd

    new-array v0, v0, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/google/common/math/IntMath;->FACTORIALS:[I

    .line 491
    const/16 v0, 0x11

    new-array v0, v0, [I

    fill-array-data v0, :array_3

    sput-object v0, Lcom/google/common/math/IntMath;->BIGGEST_BINOMIALS:[I

    return-void

    .line 150
    nop

    :array_0
    .array-data 0x4
        0x1t 0x0t 0x0t 0x0t
        0xat 0x0t 0x0t 0x0t
        0x64t 0x0t 0x0t 0x0t
        0xe8t 0x3t 0x0t 0x0t
        0x10t 0x27t 0x0t 0x0t
        0xa0t 0x86t 0x1t 0x0t
        0x40t 0x42t 0xft 0x0t
        0x80t 0x96t 0x98t 0x0t
        0x0t 0xe1t 0xf5t 0x5t
        0x0t 0xcat 0x9at 0x3bt
    .end array-data

    .line 154
    :array_1
    .array-data 0x4
        0x3t 0x0t 0x0t 0x0t
        0x1ft 0x0t 0x0t 0x0t
        0x3ct 0x1t 0x0t 0x0t
        0x5at 0xct 0x0t 0x0t
        0x86t 0x7bt 0x0t 0x0t
        0x43t 0xd3t 0x4t 0x0t
        0xa5t 0x40t 0x30t 0x0t
        0x78t 0x86t 0xe2t 0x1t
        0xb6t 0x40t 0xd9t 0x12t
        0xfft 0xfft 0xfft 0x7ft
    .end array-data

    .line 443
    :array_2
    .array-data 0x4
        0x1t 0x0t 0x0t 0x0t
        0x1t 0x0t 0x0t 0x0t
        0x2t 0x0t 0x0t 0x0t
        0x6t 0x0t 0x0t 0x0t
        0x18t 0x0t 0x0t 0x0t
        0x78t 0x0t 0x0t 0x0t
        0xd0t 0x2t 0x0t 0x0t
        0xb0t 0x13t 0x0t 0x0t
        0x80t 0x9dt 0x0t 0x0t
        0x80t 0x89t 0x5t 0x0t
        0x0t 0x5ft 0x37t 0x0t
        0x0t 0x15t 0x61t 0x2t
        0x0t 0xfct 0x8ct 0x1ct
    .end array-data

    .line 491
    :array_3
    .array-data 0x4
        0xfft 0xfft 0xfft 0x7ft
        0xfft 0xfft 0xfft 0x7ft
        0x0t 0x0t 0x1t 0x0t
        0x29t 0x9t 0x0t 0x0t
        0xddt 0x1t 0x0t 0x0t
        0xc1t 0x0t 0x0t 0x0t
        0x6et 0x0t 0x0t 0x0t
        0x4bt 0x0t 0x0t 0x0t
        0x3at 0x0t 0x0t 0x0t
        0x31t 0x0t 0x0t 0x0t
        0x2bt 0x0t 0x0t 0x0t
        0x27t 0x0t 0x0t 0x0t
        0x25t 0x0t 0x0t 0x0t
        0x23t 0x0t 0x0t 0x0t
        0x22t 0x0t 0x0t 0x0t
        0x22t 0x0t 0x0t 0x0t
        0x21t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 511
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static binomial(II)I
    .locals 9
    .parameter "n"
    .parameter "k"
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "need BigIntegerMath to adequately test"
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 466
    const-string v3, "n"

    invoke-static {v3, p0}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 467
    const-string v3, "k"

    invoke-static {v3, p1}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 468
    if-gt p1, p0, :cond_2

    move v3, v4

    :goto_0
    const-string v6, "k (%s) > n (%s)"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v5

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v7, v4

    invoke-static {v3, v6, v7}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 469
    shr-int/lit8 v3, p0, 0x1

    if-le p1, v3, :cond_0

    .line 470
    sub-int p1, p0, p1

    .line 472
    :cond_0
    sget-object v3, Lcom/google/common/math/IntMath;->BIGGEST_BINOMIALS:[I

    array-length v3, v3

    if-ge p1, v3, :cond_1

    sget-object v3, Lcom/google/common/math/IntMath;->BIGGEST_BINOMIALS:[I

    aget v3, v3, p1

    if-le p0, v3, :cond_3

    .line 473
    :cond_1
    const v4, 0x7fffffff

    .line 486
    :goto_1
    :pswitch_0
    return v4

    :cond_2
    move v3, v5

    .line 468
    goto :goto_0

    .line 475
    :cond_3
    packed-switch p1, :pswitch_data_0

    .line 481
    const-wide/16 v1, 0x1

    .line 482
    .local v1, result:J
    const/4 v0, 0x0

    .local v0, i:I
    :goto_2
    if-ge v0, p1, :cond_4

    .line 483
    sub-int v3, p0, v0

    int-to-long v3, v3

    mul-long/2addr v1, v3

    .line 484
    add-int/lit8 v3, v0, 0x1

    int-to-long v3, v3

    div-long/2addr v1, v3

    .line 482
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .end local v0           #i:I
    .end local v1           #result:J
    :pswitch_1
    move v4, p0

    .line 479
    goto :goto_1

    .line 486
    .restart local v0       #i:I
    .restart local v1       #result:J
    :cond_4
    long-to-int v4, v1

    goto :goto_1

    .line 475
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static checkedAdd(II)I
    .locals 6
    .parameter "a"
    .parameter "b"

    .prologue
    .line 356
    int-to-long v2, p0

    int-to-long v4, p1

    add-long v0, v2, v4

    .line 357
    .local v0, result:J
    long-to-int v2, v0

    int-to-long v2, v2

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-static {v2}, Lcom/google/common/math/MathPreconditions;->checkNoOverflow(Z)V

    .line 358
    long-to-int v2, v0

    return v2

    .line 357
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static checkedMultiply(II)I
    .locals 6
    .parameter "a"
    .parameter "b"

    .prologue
    .line 378
    int-to-long v2, p0

    int-to-long v4, p1

    mul-long v0, v2, v4

    .line 379
    .local v0, result:J
    long-to-int v2, v0

    int-to-long v2, v2

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-static {v2}, Lcom/google/common/math/MathPreconditions;->checkNoOverflow(Z)V

    .line 380
    long-to-int v2, v0

    return v2

    .line 379
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static checkedPow(II)I
    .locals 5
    .parameter "b"
    .parameter "k"
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "failing tests"
    .end annotation

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 393
    const-string v4, "exponent"

    invoke-static {v4, p1}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 394
    packed-switch p0, :pswitch_data_0

    .line 408
    const/4 v0, 0x1

    .line 410
    .local v0, accum:I
    :cond_0
    :goto_0
    packed-switch p1, :pswitch_data_1

    .line 416
    and-int/lit8 v3, p1, 0x1

    if-eqz v3, :cond_1

    .line 417
    invoke-static {v0, p0}, Lcom/google/common/math/IntMath;->checkedMultiply(II)I

    move-result v0

    .line 419
    :cond_1
    shr-int/lit8 p1, p1, 0x1

    .line 420
    if-lez p1, :cond_0

    .line 421
    const v3, -0xb504

    if-gt v3, p0, :cond_7

    move v4, v1

    :goto_1
    const v3, 0xb504

    if-gt p0, v3, :cond_8

    move v3, v1

    :goto_2
    and-int/2addr v3, v4

    invoke-static {v3}, Lcom/google/common/math/MathPreconditions;->checkNoOverflow(Z)V

    .line 422
    mul-int/2addr p0, p0

    goto :goto_0

    .line 396
    .end local v0           #accum:I
    :pswitch_0
    if-nez p1, :cond_3

    .line 414
    :cond_2
    :goto_3
    :pswitch_1
    return v1

    :cond_3
    move v1, v2

    .line 396
    goto :goto_3

    .line 400
    :pswitch_2
    and-int/lit8 v2, p1, 0x1

    if-eqz v2, :cond_2

    move v1, v3

    goto :goto_3

    .line 402
    :pswitch_3
    const/16 v3, 0x1f

    if-ge p1, v3, :cond_4

    move v2, v1

    :cond_4
    invoke-static {v2}, Lcom/google/common/math/MathPreconditions;->checkNoOverflow(Z)V

    .line 403
    shl-int/2addr v1, p1

    goto :goto_3

    .line 405
    :pswitch_4
    const/16 v4, 0x20

    if-ge p1, v4, :cond_5

    move v2, v1

    :cond_5
    invoke-static {v2}, Lcom/google/common/math/MathPreconditions;->checkNoOverflow(Z)V

    .line 406
    and-int/lit8 v2, p1, 0x1

    if-nez v2, :cond_6

    shl-int/2addr v1, p1

    goto :goto_3

    :cond_6
    shl-int v1, v3, p1

    goto :goto_3

    .restart local v0       #accum:I
    :pswitch_5
    move v1, v0

    .line 412
    goto :goto_3

    .line 414
    :pswitch_6
    invoke-static {v0, p0}, Lcom/google/common/math/IntMath;->checkedMultiply(II)I

    move-result v1

    goto :goto_3

    :cond_7
    move v4, v2

    .line 421
    goto :goto_1

    :cond_8
    move v3, v2

    goto :goto_2

    .line 394
    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_4
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_3
    .end packed-switch

    .line 410
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public static checkedSubtract(II)I
    .locals 6
    .parameter "a"
    .parameter "b"

    .prologue
    .line 367
    int-to-long v2, p0

    int-to-long v4, p1

    sub-long v0, v2, v4

    .line 368
    .local v0, result:J
    long-to-int v2, v0

    int-to-long v2, v2

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-static {v2}, Lcom/google/common/math/MathPreconditions;->checkNoOverflow(Z)V

    .line 369
    long-to-int v2, v0

    return v2

    .line 368
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static divide(IILjava/math/RoundingMode;)I
    .locals 10
    .parameter "p"
    .parameter "q"
    .parameter "mode"
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "failing tests"
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 250
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    if-nez p1, :cond_0

    .line 252
    new-instance v6, Ljava/lang/ArithmeticException;

    const-string v7, "/ by zero"

    invoke-direct {v6, v7}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 254
    :cond_0
    div-int v2, p0, p1

    .line 255
    .local v2, div:I
    mul-int v8, p1, v2

    sub-int v4, p0, v8

    .line 257
    .local v4, rem:I
    if-nez v4, :cond_2

    .line 302
    .end local v2           #div:I
    :cond_1
    :goto_0
    return v2

    .line 268
    .restart local v2       #div:I
    :cond_2
    xor-int v8, p0, p1

    shr-int/lit8 v8, v8, 0x1f

    or-int/lit8 v5, v8, 0x1

    .line 270
    .local v5, signum:I
    sget-object v8, Lcom/google/common/math/IntMath$1;->$SwitchMap$java$math$RoundingMode:[I

    invoke-virtual {p2}, Ljava/math/RoundingMode;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_0

    .line 300
    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 272
    :pswitch_0
    if-nez v4, :cond_3

    :goto_1
    invoke-static {v6}, Lcom/google/common/math/MathPreconditions;->checkRoundingUnnecessary(Z)V

    .line 275
    :pswitch_1
    const/4 v3, 0x0

    .line 302
    .local v3, increment:Z
    :goto_2
    if-eqz v3, :cond_1

    add-int/2addr v2, v5

    goto :goto_0

    .end local v3           #increment:Z
    :cond_3
    move v6, v7

    .line 272
    goto :goto_1

    .line 278
    :pswitch_2
    const/4 v3, 0x1

    .line 279
    .restart local v3       #increment:Z
    goto :goto_2

    .line 281
    .end local v3           #increment:Z
    :pswitch_3
    if-lez v5, :cond_4

    move v3, v6

    .line 282
    .restart local v3       #increment:Z
    :goto_3
    goto :goto_2

    .end local v3           #increment:Z
    :cond_4
    move v3, v7

    .line 281
    goto :goto_3

    .line 284
    :pswitch_4
    if-gez v5, :cond_5

    move v3, v6

    .line 285
    .restart local v3       #increment:Z
    :goto_4
    goto :goto_2

    .end local v3           #increment:Z
    :cond_5
    move v3, v7

    .line 284
    goto :goto_4

    .line 289
    :pswitch_5
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 290
    .local v0, absRem:I
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v8

    sub-int/2addr v8, v0

    sub-int v1, v0, v8

    .line 293
    .local v1, cmpRemToHalfDivisor:I
    if-nez v1, :cond_a

    .line 294
    sget-object v8, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    if-eq p2, v8, :cond_6

    sget-object v8, Ljava/math/RoundingMode;->HALF_EVEN:Ljava/math/RoundingMode;

    if-ne p2, v8, :cond_7

    move v9, v6

    :goto_5
    and-int/lit8 v8, v2, 0x1

    if-eqz v8, :cond_8

    move v8, v6

    :goto_6
    and-int/2addr v8, v9

    if-eqz v8, :cond_9

    :cond_6
    move v3, v6

    .restart local v3       #increment:Z
    :goto_7
    goto :goto_2

    .end local v3           #increment:Z
    :cond_7
    move v9, v7

    goto :goto_5

    :cond_8
    move v8, v7

    goto :goto_6

    :cond_9
    move v3, v7

    goto :goto_7

    .line 296
    :cond_a
    if-lez v1, :cond_b

    move v3, v6

    .line 298
    .restart local v3       #increment:Z
    :goto_8
    goto :goto_2

    .end local v3           #increment:Z
    :cond_b
    move v3, v7

    .line 296
    goto :goto_8

    .line 270
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_4
        :pswitch_2
        :pswitch_3
        :pswitch_5
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method

.method public static factorial(I)I
    .locals 1
    .parameter "n"
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "need BigIntegerMath to adequately test"
    .end annotation

    .prologue
    .line 439
    const-string v0, "n"

    invoke-static {v0, p0}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 440
    sget-object v0, Lcom/google/common/math/IntMath;->FACTORIALS:[I

    array-length v0, v0

    if-ge p0, v0, :cond_0

    sget-object v0, Lcom/google/common/math/IntMath;->FACTORIALS:[I

    aget v0, v0, p0

    :goto_0
    return v0

    :cond_0
    const v0, 0x7fffffff

    goto :goto_0
.end method

.method public static gcd(II)I
    .locals 2
    .parameter "a"
    .parameter "b"

    .prologue
    .line 339
    const-string v1, "a"

    invoke-static {v1, p0}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 340
    const-string v1, "b"

    invoke-static {v1, p1}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 342
    :goto_0
    if-eqz p1, :cond_0

    .line 343
    move v0, p1

    .line 344
    .local v0, t:I
    rem-int p1, p0, p1

    .line 345
    move p0, v0

    .line 346
    goto :goto_0

    .line 347
    .end local v0           #t:I
    :cond_0
    return p0
.end method

.method public static isPowerOfTwo(I)Z
    .locals 4
    .parameter "x"

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 64
    if-lez p0, :cond_0

    move v2, v0

    :goto_0
    add-int/lit8 v3, p0, -0x1

    and-int/2addr v3, p0

    if-nez v3, :cond_1

    :goto_1
    and-int/2addr v0, v2

    return v0

    :cond_0
    move v2, v1

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_1
.end method

.method public static log10(ILjava/math/RoundingMode;)I
    .locals 4
    .parameter "x"
    .parameter "mode"
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "need BigIntegerMath to adequately test"
    .end annotation

    .prologue
    .line 118
    const-string v2, "x"

    invoke-static {v2, p0}, Lcom/google/common/math/MathPreconditions;->checkPositive(Ljava/lang/String;I)I

    .line 119
    invoke-static {p0}, Lcom/google/common/math/IntMath;->log10Floor(I)I

    move-result v1

    .line 120
    .local v1, logFloor:I
    sget-object v2, Lcom/google/common/math/IntMath;->POWERS_OF_10:[I

    aget v0, v2, v1

    .line 121
    .local v0, floorPow:I
    sget-object v2, Lcom/google/common/math/IntMath$1;->$SwitchMap$java$math$RoundingMode:[I

    invoke-virtual {p1}, Ljava/math/RoundingMode;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 137
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 123
    :pswitch_0
    if-ne p0, v0, :cond_1

    const/4 v2, 0x1

    :goto_0
    invoke-static {v2}, Lcom/google/common/math/MathPreconditions;->checkRoundingUnnecessary(Z)V

    .line 135
    .end local v1           #logFloor:I
    :cond_0
    :goto_1
    :pswitch_1
    return v1

    .line 123
    .restart local v1       #logFloor:I
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 130
    :pswitch_2
    if-eq p0, v0, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 135
    :pswitch_3
    sget-object v2, Lcom/google/common/math/IntMath;->HALF_POWERS_OF_10:[I

    aget v2, v2, v1

    if-le p0, v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 121
    nop

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

.method private static log10Floor(I)I
    .locals 2
    .parameter "x"

    .prologue
    .line 142
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    sget-object v1, Lcom/google/common/math/IntMath;->POWERS_OF_10:[I

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 143
    sget-object v1, Lcom/google/common/math/IntMath;->POWERS_OF_10:[I

    aget v1, v1, v0

    if-ge p0, v1, :cond_0

    .line 144
    add-int/lit8 v1, v0, -0x1

    .line 147
    :goto_1
    return v1

    .line 142
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 147
    :cond_1
    sget-object v1, Lcom/google/common/math/IntMath;->POWERS_OF_10:[I

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    goto :goto_1
.end method

.method public static log2(ILjava/math/RoundingMode;)I
    .locals 5
    .parameter "x"
    .parameter "mode"
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "need BigIntegerMath to adequately test"
    .end annotation

    .prologue
    .line 77
    const-string v3, "x"

    invoke-static {v3, p0}, Lcom/google/common/math/MathPreconditions;->checkPositive(Ljava/lang/String;I)I

    .line 78
    sget-object v3, Lcom/google/common/math/IntMath$1;->$SwitchMap$java$math$RoundingMode:[I

    invoke-virtual {p1}, Ljava/math/RoundingMode;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 101
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 80
    :pswitch_0
    invoke-static {p0}, Lcom/google/common/math/IntMath;->isPowerOfTwo(I)Z

    move-result v3

    invoke-static {v3}, Lcom/google/common/math/MathPreconditions;->checkRoundingUnnecessary(Z)V

    .line 84
    :pswitch_1
    invoke-static {p0}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    move-result v3

    rsub-int/lit8 v2, v3, 0x1f

    .line 98
    :cond_0
    :goto_0
    return v2

    .line 88
    :pswitch_2
    add-int/lit8 v3, p0, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    move-result v3

    rsub-int/lit8 v2, v3, 0x20

    goto :goto_0

    .line 94
    :pswitch_3
    invoke-static {p0}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    move-result v1

    .line 95
    .local v1, leadingZeros:I
    const v3, -0x4afb0ccd

    ushr-int v0, v3, v1

    .line 97
    .local v0, cmp:I
    rsub-int/lit8 v2, v1, 0x1f

    .line 98
    .local v2, logFloor:I
    if-le p0, v0, :cond_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 78
    nop

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

.method public static mod(II)I
    .locals 4
    .parameter "x"
    .parameter "m"

    .prologue
    .line 320
    if-gtz p1, :cond_0

    .line 321
    new-instance v1, Ljava/lang/ArithmeticException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Modulus "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " must be > 0"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 323
    :cond_0
    rem-int v0, p0, p1

    .line 324
    .local v0, result:I
    if-ltz v0, :cond_1

    .end local v0           #result:I
    :goto_0
    return v0

    .restart local v0       #result:I
    :cond_1
    add-int/2addr v0, p1

    goto :goto_0
.end method

.method public static pow(II)I
    .locals 5
    .parameter "b"
    .parameter "k"
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "failing tests"
    .end annotation

    .prologue
    const/16 v4, 0x20

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 168
    const-string v3, "exponent"

    invoke-static {v3, p1}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 169
    packed-switch p0, :pswitch_data_0

    .line 185
    const/4 v0, 0x1

    .line 186
    .local v0, accum:I
    :goto_0
    packed-switch p1, :pswitch_data_1

    .line 192
    and-int/lit8 v2, p1, 0x1

    if-nez v2, :cond_5

    move v2, v1

    :goto_1
    mul-int/2addr v0, v2

    .line 193
    mul-int/2addr p0, p0

    .line 185
    shr-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 171
    .end local v0           #accum:I
    :pswitch_0
    if-nez p1, :cond_1

    .line 190
    :cond_0
    :goto_2
    :pswitch_1
    return v1

    :cond_1
    move v1, v2

    .line 171
    goto :goto_2

    .line 175
    :pswitch_2
    and-int/lit8 v2, p1, 0x1

    if-eqz v2, :cond_0

    const/4 v1, -0x1

    goto :goto_2

    .line 177
    :pswitch_3
    if-ge p1, v4, :cond_2

    shl-int v2, v1, p1

    :cond_2
    move v1, v2

    goto :goto_2

    .line 179
    :pswitch_4
    if-ge p1, v4, :cond_4

    .line 180
    and-int/lit8 v2, p1, 0x1

    if-nez v2, :cond_3

    shl-int/2addr v1, p1

    goto :goto_2

    :cond_3
    shl-int/2addr v1, p1

    neg-int v1, v1

    goto :goto_2

    :cond_4
    move v1, v2

    .line 182
    goto :goto_2

    .restart local v0       #accum:I
    :pswitch_5
    move v1, v0

    .line 188
    goto :goto_2

    .line 190
    :pswitch_6
    mul-int v1, p0, v0

    goto :goto_2

    :cond_5
    move v2, p0

    .line 192
    goto :goto_1

    .line 169
    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_4
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_3
    .end packed-switch

    .line 186
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public static sqrt(ILjava/math/RoundingMode;)I
    .locals 6
    .parameter "x"
    .parameter "mode"
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "need BigIntegerMath to adequately test"
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 208
    const-string v4, "x"

    invoke-static {v4, p0}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 209
    invoke-static {p0}, Lcom/google/common/math/IntMath;->sqrtFloor(I)I

    move-result v1

    .line 210
    .local v1, sqrtFloor:I
    sget-object v4, Lcom/google/common/math/IntMath$1;->$SwitchMap$java$math$RoundingMode:[I

    invoke-virtual {p1}, Ljava/math/RoundingMode;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    .line 230
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 212
    :pswitch_0
    mul-int v4, v1, v1

    if-ne v4, p0, :cond_1

    :goto_0
    invoke-static {v2}, Lcom/google/common/math/MathPreconditions;->checkRoundingUnnecessary(Z)V

    .line 228
    .end local v1           #sqrtFloor:I
    :cond_0
    :goto_1
    :pswitch_1
    return v1

    .restart local v1       #sqrtFloor:I
    :cond_1
    move v2, v3

    .line 212
    goto :goto_0

    .line 218
    :pswitch_2
    mul-int v2, v1, v1

    if-eq v2, p0, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 222
    :pswitch_3
    mul-int v4, v1, v1

    add-int v0, v4, v1

    .line 228
    .local v0, halfSquare:I
    if-gt p0, v0, :cond_2

    move v4, v2

    :goto_2
    if-gez v0, :cond_3

    :goto_3
    or-int/2addr v2, v4

    if-nez v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    move v4, v3

    goto :goto_2

    :cond_3
    move v2, v3

    goto :goto_3

    .line 210
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

.method private static sqrtFloor(I)I
    .locals 2
    .parameter "x"

    .prologue
    .line 237
    int-to-double v0, p0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-int v0, v0

    return v0
.end method
