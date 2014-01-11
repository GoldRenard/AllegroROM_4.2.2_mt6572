.class public Lcom/mediatek/bluetooth/psm/ResultCode;
.super Ljava/lang/Object;
.source "ResultCode.java"


# static fields
.field public static final STATUS_FAILED:I = 0x3

.field public static final STATUS_PENDING:I = 0x2

.field public static final STATUS_SUCCESS:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(I)I
    .locals 1
    .parameter "statusCode"

    .prologue
    .line 73
    shl-int/lit8 v0, p0, 0x10

    return v0
.end method

.method public static create(II)I
    .locals 1
    .parameter "statusCode"
    .parameter "responseCode"

    .prologue
    .line 85
    shl-int/lit8 v0, p0, 0x10

    or-int/2addr v0, p1

    return v0
.end method

.method public static rspcode(I)I
    .locals 1
    .parameter "resultCode"

    .prologue
    .line 107
    const v0, 0xffff

    and-int/2addr v0, p0

    return v0
.end method

.method public static status(I)I
    .locals 1
    .parameter "resultCode"

    .prologue
    .line 96
    shr-int/lit8 v0, p0, 0x10

    return v0
.end method
