.class Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;
.super Ljava/lang/Object;
.source "ByteStreams.java"

# interfaces
.implements Lcom/google/common/io/ByteArrayDataOutput;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/ByteStreams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ByteArrayDataOutputStream"
.end annotation


# instance fields
.field final byteArrayOutputSteam:Ljava/io/ByteArrayOutputStream;

.field final output:Ljava/io/DataOutput;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 440
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-direct {p0, v0}, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;-><init>(Ljava/io/ByteArrayOutputStream;)V

    .line 441
    return-void
.end method

.method constructor <init>(I)V
    .locals 1
    .parameter "size"

    .prologue
    .line 444
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    invoke-direct {p0, v0}, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;-><init>(Ljava/io/ByteArrayOutputStream;)V

    .line 445
    return-void
.end method

.method constructor <init>(Ljava/io/ByteArrayOutputStream;)V
    .locals 1
    .parameter "byteArrayOutputSteam"

    .prologue
    .line 447
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 448
    iput-object p1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->byteArrayOutputSteam:Ljava/io/ByteArrayOutputStream;

    .line 449
    new-instance v0, Ljava/io/DataOutputStream;

    invoke-direct {v0, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    .line 450
    return-void
.end method


# virtual methods
.method public toByteArray()[B
    .locals 1

    .prologue
    .line 565
    iget-object v0, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->byteArrayOutputSteam:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method public write(I)V
    .locals 2
    .parameter "b"

    .prologue
    .line 454
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->write(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 458
    return-void

    .line 455
    :catch_0
    move-exception v0

    .line 456
    .local v0, impossible:Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public write([B)V
    .locals 2
    .parameter "b"

    .prologue
    .line 462
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 466
    return-void

    .line 463
    :catch_0
    move-exception v0

    .line 464
    .local v0, impossible:Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public write([BII)V
    .locals 2
    .parameter "b"
    .parameter "off"
    .parameter "len"

    .prologue
    .line 470
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1, p2, p3}, Ljava/io/DataOutput;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 474
    return-void

    .line 471
    :catch_0
    move-exception v0

    .line 472
    .local v0, impossible:Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeBoolean(Z)V
    .locals 2
    .parameter "v"

    .prologue
    .line 478
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeBoolean(Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 482
    return-void

    .line 479
    :catch_0
    move-exception v0

    .line 480
    .local v0, impossible:Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeByte(I)V
    .locals 2
    .parameter "v"

    .prologue
    .line 486
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeByte(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 490
    return-void

    .line 487
    :catch_0
    move-exception v0

    .line 488
    .local v0, impossible:Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeBytes(Ljava/lang/String;)V
    .locals 2
    .parameter "s"

    .prologue
    .line 494
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeBytes(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 498
    return-void

    .line 495
    :catch_0
    move-exception v0

    .line 496
    .local v0, impossible:Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeChar(I)V
    .locals 2
    .parameter "v"

    .prologue
    .line 502
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeChar(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 506
    return-void

    .line 503
    :catch_0
    move-exception v0

    .line 504
    .local v0, impossible:Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeChars(Ljava/lang/String;)V
    .locals 2
    .parameter "s"

    .prologue
    .line 510
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeChars(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 514
    return-void

    .line 511
    :catch_0
    move-exception v0

    .line 512
    .local v0, impossible:Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeDouble(D)V
    .locals 2
    .parameter "v"

    .prologue
    .line 518
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1, p2}, Ljava/io/DataOutput;->writeDouble(D)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 522
    return-void

    .line 519
    :catch_0
    move-exception v0

    .line 520
    .local v0, impossible:Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeFloat(F)V
    .locals 2
    .parameter "v"

    .prologue
    .line 526
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeFloat(F)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 530
    return-void

    .line 527
    :catch_0
    move-exception v0

    .line 528
    .local v0, impossible:Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeInt(I)V
    .locals 2
    .parameter "v"

    .prologue
    .line 534
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeInt(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 538
    return-void

    .line 535
    :catch_0
    move-exception v0

    .line 536
    .local v0, impossible:Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeLong(J)V
    .locals 2
    .parameter "v"

    .prologue
    .line 542
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1, p2}, Ljava/io/DataOutput;->writeLong(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 546
    return-void

    .line 543
    :catch_0
    move-exception v0

    .line 544
    .local v0, impossible:Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeShort(I)V
    .locals 2
    .parameter "v"

    .prologue
    .line 550
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeShort(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 554
    return-void

    .line 551
    :catch_0
    move-exception v0

    .line 552
    .local v0, impossible:Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeUTF(Ljava/lang/String;)V
    .locals 2
    .parameter "s"

    .prologue
    .line 558
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeUTF(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 562
    return-void

    .line 559
    :catch_0
    move-exception v0

    .line 560
    .local v0, impossible:Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method
