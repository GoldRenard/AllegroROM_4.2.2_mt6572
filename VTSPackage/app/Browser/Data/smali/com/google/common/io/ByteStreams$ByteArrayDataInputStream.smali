.class Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;
.super Ljava/lang/Object;
.source "ByteStreams.java"

# interfaces
.implements Lcom/google/common/io/ByteArrayDataInput;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/ByteStreams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ByteArrayDataInputStream"
.end annotation


# instance fields
.field final input:Ljava/io/DataInput;


# direct methods
.method constructor <init>([B)V
    .locals 2
    .parameter "bytes"

    .prologue
    .line 282
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 283
    new-instance v0, Ljava/io/DataInputStream;

    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    .line 284
    return-void
.end method

.method constructor <init>([BI)V
    .locals 3
    .parameter "bytes"
    .parameter "start"

    .prologue
    .line 286
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 287
    new-instance v0, Ljava/io/DataInputStream;

    new-instance v1, Ljava/io/ByteArrayInputStream;

    array-length v2, p1

    sub-int/2addr v2, p2

    invoke-direct {v1, p1, p2, v2}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    .line 289
    return-void
.end method


# virtual methods
.method public readBoolean()Z
    .locals 2

    .prologue
    .line 317
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readBoolean()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 318
    :catch_0
    move-exception v0

    .line 319
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readByte()B
    .locals 3

    .prologue
    .line 325
    :try_start_0
    iget-object v2, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v2}, Ljava/io/DataInput;->readByte()B
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v2

    return v2

    .line 326
    :catch_0
    move-exception v0

    .line 327
    .local v0, e:Ljava/io/EOFException;
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 328
    .end local v0           #e:Ljava/io/EOFException;
    :catch_1
    move-exception v1

    .line 329
    .local v1, impossible:Ljava/io/IOException;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method

.method public readChar()C
    .locals 2

    .prologue
    .line 359
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readChar()C
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 360
    :catch_0
    move-exception v0

    .line 361
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readDouble()D
    .locals 3

    .prologue
    .line 391
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readDouble()D
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v1

    return-wide v1

    .line 392
    :catch_0
    move-exception v0

    .line 393
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readFloat()F
    .locals 2

    .prologue
    .line 383
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readFloat()F
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 384
    :catch_0
    move-exception v0

    .line 385
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readFully([B)V
    .locals 2
    .parameter "b"

    .prologue
    .line 293
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1, p1}, Ljava/io/DataInput;->readFully([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 297
    return-void

    .line 294
    :catch_0
    move-exception v0

    .line 295
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readFully([BII)V
    .locals 2
    .parameter "b"
    .parameter "off"
    .parameter "len"

    .prologue
    .line 301
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1, p1, p2, p3}, Ljava/io/DataInput;->readFully([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 305
    return-void

    .line 302
    :catch_0
    move-exception v0

    .line 303
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readInt()I
    .locals 2

    .prologue
    .line 367
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readInt()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 368
    :catch_0
    move-exception v0

    .line 369
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readLine()Ljava/lang/String;
    .locals 2

    .prologue
    .line 399
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readLine()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 400
    :catch_0
    move-exception v0

    .line 401
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readLong()J
    .locals 3

    .prologue
    .line 375
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readLong()J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v1

    return-wide v1

    .line 376
    :catch_0
    move-exception v0

    .line 377
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readShort()S
    .locals 2

    .prologue
    .line 343
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readShort()S
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 344
    :catch_0
    move-exception v0

    .line 345
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readUTF()Ljava/lang/String;
    .locals 2

    .prologue
    .line 407
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUTF()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 408
    :catch_0
    move-exception v0

    .line 409
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readUnsignedByte()I
    .locals 2

    .prologue
    .line 335
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 336
    :catch_0
    move-exception v0

    .line 337
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readUnsignedShort()I
    .locals 2

    .prologue
    .line 351
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedShort()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 352
    :catch_0
    move-exception v0

    .line 353
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public skipBytes(I)I
    .locals 2
    .parameter "n"

    .prologue
    .line 309
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;->input:Ljava/io/DataInput;

    invoke-interface {v1, p1}, Ljava/io/DataInput;->skipBytes(I)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 310
    :catch_0
    move-exception v0

    .line 311
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
