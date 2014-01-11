.class public Lcom/mediatek/bluetooth/util/ConvertUtils;
.super Ljava/lang/Object;
.source "ConvertUtils.java"


# static fields
.field private static final HEX:Ljava/lang/String; = "0123456789ABCDEF"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertBdAddr([B)Ljava/lang/String;
    .locals 9
    .parameter "bdaddr"

    .prologue
    const/16 v8, 0x9

    .line 102
    if-eqz p0, :cond_0

    array-length v6, p0

    const/4 v7, 0x6

    if-eq v6, v7, :cond_1

    .line 104
    :cond_0
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "convertBdAddr() error: invalid bdaddr["

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "]"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 107
    :cond_1
    const/16 v6, 0x11

    new-array v3, v6, [C

    .line 108
    .local v3, result:[C
    const/4 v1, 0x0

    .line 109
    .local v1, j:I
    const/4 v0, 0x5

    .local v0, i:I
    move v2, v1

    .end local v1           #j:I
    .local v2, j:I
    :goto_0
    if-ltz v0, :cond_4

    .line 112
    aget-byte v5, p0, v0

    .line 115
    .local v5, v:I
    ushr-int/lit8 v6, v5, 0x4

    and-int/lit8 v4, v6, 0xf

    .line 116
    .local v4, t:I
    if-le v4, v8, :cond_2

    add-int/lit8 v6, v4, -0xa

    add-int/lit8 v4, v6, 0x41

    .line 118
    :goto_1
    add-int/lit8 v1, v2, 0x1

    .end local v2           #j:I
    .restart local v1       #j:I
    int-to-char v6, v4

    aput-char v6, v3, v2

    .line 121
    and-int/lit8 v4, v5, 0xf

    .line 122
    if-le v4, v8, :cond_3

    add-int/lit8 v6, v4, -0xa

    add-int/lit8 v4, v6, 0x41

    .line 124
    :goto_2
    add-int/lit8 v2, v1, 0x1

    .end local v1           #j:I
    .restart local v2       #j:I
    int-to-char v6, v4

    aput-char v6, v3, v1

    .line 127
    if-lez v0, :cond_5

    add-int/lit8 v1, v2, 0x1

    .end local v2           #j:I
    .restart local v1       #j:I
    const/16 v6, 0x3a

    aput-char v6, v3, v2

    .line 109
    :goto_3
    add-int/lit8 v0, v0, -0x1

    move v2, v1

    .end local v1           #j:I
    .restart local v2       #j:I
    goto :goto_0

    .line 117
    :cond_2
    add-int/lit8 v4, v4, 0x30

    goto :goto_1

    .line 123
    .end local v2           #j:I
    .restart local v1       #j:I
    :cond_3
    add-int/lit8 v4, v4, 0x30

    goto :goto_2

    .line 131
    .end local v1           #j:I
    .end local v4           #t:I
    .end local v5           #v:I
    .restart local v2       #j:I
    :cond_4
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v3}, Ljava/lang/String;-><init>([C)V

    return-object v6

    .restart local v4       #t:I
    .restart local v5       #v:I
    :cond_5
    move v1, v2

    .end local v2           #j:I
    .restart local v1       #j:I
    goto :goto_3
.end method

.method public static convertBdAddr(Ljava/lang/String;)[B
    .locals 11
    .parameter "bdaddr"

    .prologue
    const/16 v10, 0x46

    const/16 v9, 0x41

    const/16 v8, 0x39

    const/16 v7, 0x30

    const/16 v6, 0x11

    .line 54
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-eq v4, v6, :cond_1

    .line 56
    :cond_0
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "convertBdAddr() error: invalid bdaddr["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 63
    :cond_1
    const/4 v1, 0x0

    .line 64
    .local v1, digital:S
    const/4 v4, 0x6

    new-array v3, v4, [B

    .line 65
    .local v3, result:[B
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v6, :cond_6

    .line 68
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 69
    .local v0, c:C
    if-gt v7, v0, :cond_2

    if-gt v0, v8, :cond_2

    add-int/lit8 v4, v0, -0x30

    int-to-short v1, v4

    .line 76
    :goto_1
    shl-int/lit8 v4, v1, 0x4

    int-to-short v1, v4

    .line 79
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 80
    if-gt v7, v0, :cond_4

    if-gt v0, v8, :cond_4

    add-int/lit8 v4, v0, -0x30

    int-to-short v4, v4

    add-int/2addr v4, v1

    int-to-short v1, v4

    .line 87
    :goto_2
    div-int/lit8 v4, v2, 0x3

    rsub-int/lit8 v4, v4, 0x5

    int-to-byte v5, v1

    aput-byte v5, v3, v4

    .line 65
    add-int/lit8 v2, v2, 0x3

    goto :goto_0

    .line 70
    :cond_2
    if-gt v9, v0, :cond_3

    if-gt v0, v10, :cond_3

    add-int/lit8 v4, v0, -0x41

    add-int/lit8 v4, v4, 0xa

    int-to-short v1, v4

    goto :goto_1

    .line 72
    :cond_3
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "convertBdAddr() error: invalid char["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] in ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 81
    :cond_4
    if-gt v9, v0, :cond_5

    if-gt v0, v10, :cond_5

    add-int/lit8 v4, v0, -0x41

    add-int/lit8 v4, v4, 0xa

    int-to-short v4, v4

    add-int/2addr v4, v1

    int-to-short v1, v4

    goto :goto_2

    .line 83
    :cond_5
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "convertBdAddr() error: invalid char["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] in ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 91
    .end local v0           #c:C
    :cond_6
    return-object v3
.end method

.method public static toHexString(Ljava/nio/ByteBuffer;)Ljava/lang/String;
    .locals 7
    .parameter "raw"

    .prologue
    .line 137
    if-nez p0, :cond_0

    const-string v4, ""

    .line 147
    :goto_0
    return-object v4

    .line 140
    :cond_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v3

    .line 141
    .local v3, size:I
    new-instance v2, Ljava/lang/StringBuilder;

    mul-int/lit8 v4, v3, 0x2

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 142
    .local v2, res:Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v3, :cond_1

    .line 144
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    .line 145
    .local v0, b:B
    const-string v4, "0123456789ABCDEF"

    and-int/lit16 v5, v0, 0xf0

    shr-int/lit8 v5, v5, 0x4

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "0123456789ABCDEF"

    and-int/lit8 v6, v0, 0xf

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 142
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 147
    .end local v0           #b:B
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0
.end method
