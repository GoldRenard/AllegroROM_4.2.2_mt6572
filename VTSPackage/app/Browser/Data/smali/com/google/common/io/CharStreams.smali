.class public final Lcom/google/common/io/CharStreams;
.super Ljava/lang/Object;
.source "CharStreams.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation


# static fields
.field private static final BUF_SIZE:I = 0x800


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static asWriter(Ljava/lang/Appendable;)Ljava/io/Writer;
    .locals 1
    .parameter "target"

    .prologue
    .line 436
    instance-of v0, p0, Ljava/io/Writer;

    if-eqz v0, :cond_0

    .line 437
    check-cast p0, Ljava/io/Writer;

    .line 439
    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    new-instance v0, Lcom/google/common/io/AppendableWriter;

    invoke-direct {v0, p0}, Lcom/google/common/io/AppendableWriter;-><init>(Ljava/lang/Appendable;)V

    move-object p0, v0

    goto :goto_0
.end method

.method public static copy(Lcom/google/common/io/InputSupplier;Lcom/google/common/io/OutputSupplier;)J
    .locals 10
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R::",
            "Ljava/lang/Readable;",
            ":",
            "Ljava/io/Closeable;",
            "W::",
            "Ljava/lang/Appendable;",
            ":",
            "Ljava/io/Closeable;",
            ">(",
            "Lcom/google/common/io/InputSupplier",
            "<TR;>;",
            "Lcom/google/common/io/OutputSupplier",
            "<TW;>;)J"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p0, from:Lcom/google/common/io/InputSupplier;,"Lcom/google/common/io/InputSupplier<TR;>;"
    .local p1, to:Lcom/google/common/io/OutputSupplier;,"Lcom/google/common/io/OutputSupplier<TW;>;"
    const/4 v9, 0x2

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 150
    const/4 v4, 0x0

    .line 151
    .local v4, successfulOps:I
    invoke-interface {p0}, Lcom/google/common/io/InputSupplier;->getInput()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Readable;

    .line 153
    .local v2, in:Ljava/lang/Readable;,"TR;"
    :try_start_0
    invoke-interface {p1}, Lcom/google/common/io/OutputSupplier;->getOutput()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Appendable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 155
    .local v3, out:Ljava/lang/Appendable;,"TW;"
    :try_start_1
    invoke-static {v2, v3}, Lcom/google/common/io/CharStreams;->copy(Ljava/lang/Readable;Ljava/lang/Appendable;)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v0

    .line 156
    .local v0, count:J
    add-int/lit8 v4, v4, 0x1

    .line 159
    :try_start_2
    check-cast v3, Ljava/io/Closeable;

    .end local v3           #out:Ljava/lang/Appendable;,"TW;"
    if-ge v4, v5, :cond_0

    move v7, v5

    :goto_0
    invoke-static {v3, v7}, Lcom/google/common/io/Closeables;->close(Ljava/io/Closeable;Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 160
    add-int/lit8 v4, v4, 0x1

    .line 163
    check-cast v2, Ljava/io/Closeable;

    .end local v2           #in:Ljava/lang/Readable;,"TR;"
    if-ge v4, v9, :cond_1

    :goto_1
    invoke-static {v2, v5}, Lcom/google/common/io/Closeables;->close(Ljava/io/Closeable;Z)V

    return-wide v0

    .restart local v2       #in:Ljava/lang/Readable;,"TR;"
    :cond_0
    move v7, v6

    .line 159
    goto :goto_0

    .end local v2           #in:Ljava/lang/Readable;,"TR;"
    :cond_1
    move v5, v6

    .line 163
    goto :goto_1

    .line 159
    .end local v0           #count:J
    .restart local v2       #in:Ljava/lang/Readable;,"TR;"
    .restart local v3       #out:Ljava/lang/Appendable;,"TW;"
    :catchall_0
    move-exception v8

    :try_start_3
    check-cast v3, Ljava/io/Closeable;

    .end local v3           #out:Ljava/lang/Appendable;,"TW;"
    if-ge v4, v5, :cond_2

    move v7, v5

    :goto_2
    invoke-static {v3, v7}, Lcom/google/common/io/Closeables;->close(Ljava/io/Closeable;Z)V

    .line 160
    add-int/lit8 v4, v4, 0x1

    throw v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 163
    :catchall_1
    move-exception v7

    check-cast v2, Ljava/io/Closeable;

    .end local v2           #in:Ljava/lang/Readable;,"TR;"
    if-ge v4, v9, :cond_3

    :goto_3
    invoke-static {v2, v5}, Lcom/google/common/io/Closeables;->close(Ljava/io/Closeable;Z)V

    throw v7

    .restart local v2       #in:Ljava/lang/Readable;,"TR;"
    :cond_2
    move v7, v6

    .line 159
    goto :goto_2

    .end local v2           #in:Ljava/lang/Readable;,"TR;"
    :cond_3
    move v5, v6

    .line 163
    goto :goto_3
.end method

.method public static copy(Lcom/google/common/io/InputSupplier;Ljava/lang/Appendable;)J
    .locals 5
    .parameter
    .parameter "to"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R::",
            "Ljava/lang/Readable;",
            ":",
            "Ljava/io/Closeable;",
            ">(",
            "Lcom/google/common/io/InputSupplier",
            "<TR;>;",
            "Ljava/lang/Appendable;",
            ")J"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 179
    .local p0, from:Lcom/google/common/io/InputSupplier;,"Lcom/google/common/io/InputSupplier<TR;>;"
    const/4 v3, 0x1

    .line 180
    .local v3, threw:Z
    invoke-interface {p0}, Lcom/google/common/io/InputSupplier;->getInput()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Readable;

    .line 182
    .local v2, in:Ljava/lang/Readable;,"TR;"
    :try_start_0
    invoke-static {v2, p1}, Lcom/google/common/io/CharStreams;->copy(Ljava/lang/Readable;Ljava/lang/Appendable;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v0

    .line 183
    .local v0, count:J
    const/4 v3, 0x0

    .line 186
    check-cast v2, Ljava/io/Closeable;

    .end local v2           #in:Ljava/lang/Readable;,"TR;"
    invoke-static {v2, v3}, Lcom/google/common/io/Closeables;->close(Ljava/io/Closeable;Z)V

    return-wide v0

    .end local v0           #count:J
    .restart local v2       #in:Ljava/lang/Readable;,"TR;"
    :catchall_0
    move-exception v4

    check-cast v2, Ljava/io/Closeable;

    .end local v2           #in:Ljava/lang/Readable;,"TR;"
    invoke-static {v2, v3}, Lcom/google/common/io/Closeables;->close(Ljava/io/Closeable;Z)V

    throw v4
.end method

.method public static copy(Ljava/lang/Readable;Ljava/lang/Appendable;)J
    .locals 6
    .parameter "from"
    .parameter "to"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 200
    const/16 v4, 0x800

    invoke-static {v4}, Ljava/nio/CharBuffer;->allocate(I)Ljava/nio/CharBuffer;

    move-result-object v0

    .line 201
    .local v0, buf:Ljava/nio/CharBuffer;
    const-wide/16 v2, 0x0

    .line 203
    .local v2, total:J
    :goto_0
    invoke-interface {p0, v0}, Ljava/lang/Readable;->read(Ljava/nio/CharBuffer;)I

    move-result v1

    .line 204
    .local v1, r:I
    const/4 v4, -0x1

    if-ne v1, v4, :cond_0

    .line 211
    return-wide v2

    .line 207
    :cond_0
    invoke-virtual {v0}, Ljava/nio/CharBuffer;->flip()Ljava/nio/Buffer;

    .line 208
    const/4 v4, 0x0

    invoke-interface {p1, v0, v4, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;

    .line 209
    int-to-long v4, v1

    add-long/2addr v2, v4

    .line 210
    goto :goto_0
.end method

.method public static join(Ljava/lang/Iterable;)Lcom/google/common/io/InputSupplier;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lcom/google/common/io/InputSupplier",
            "<+",
            "Ljava/io/Reader;",
            ">;>;)",
            "Lcom/google/common/io/InputSupplier",
            "<",
            "Ljava/io/Reader;",
            ">;"
        }
    .end annotation

    .prologue
    .line 386
    .local p0, suppliers:Ljava/lang/Iterable;,"Ljava/lang/Iterable<+Lcom/google/common/io/InputSupplier<+Ljava/io/Reader;>;>;"
    new-instance v0, Lcom/google/common/io/CharStreams$4;

    invoke-direct {v0, p0}, Lcom/google/common/io/CharStreams$4;-><init>(Ljava/lang/Iterable;)V

    return-object v0
.end method

.method public static varargs join([Lcom/google/common/io/InputSupplier;)Lcom/google/common/io/InputSupplier;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/google/common/io/InputSupplier",
            "<+",
            "Ljava/io/Reader;",
            ">;)",
            "Lcom/google/common/io/InputSupplier",
            "<",
            "Ljava/io/Reader;",
            ">;"
        }
    .end annotation

    .prologue
    .line 396
    .local p0, suppliers:[Lcom/google/common/io/InputSupplier;,"[Lcom/google/common/io/InputSupplier<+Ljava/io/Reader;>;"
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/io/CharStreams;->join(Ljava/lang/Iterable;)Lcom/google/common/io/InputSupplier;

    move-result-object v0

    return-object v0
.end method

.method public static newReaderSupplier(Lcom/google/common/io/InputSupplier;Ljava/nio/charset/Charset;)Lcom/google/common/io/InputSupplier;
    .locals 1
    .parameter
    .parameter "charset"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/io/InputSupplier",
            "<+",
            "Ljava/io/InputStream;",
            ">;",
            "Ljava/nio/charset/Charset;",
            ")",
            "Lcom/google/common/io/InputSupplier",
            "<",
            "Ljava/io/InputStreamReader;",
            ">;"
        }
    .end annotation

    .prologue
    .line 86
    .local p0, in:Lcom/google/common/io/InputSupplier;,"Lcom/google/common/io/InputSupplier<+Ljava/io/InputStream;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    new-instance v0, Lcom/google/common/io/CharStreams$2;

    invoke-direct {v0, p0, p1}, Lcom/google/common/io/CharStreams$2;-><init>(Lcom/google/common/io/InputSupplier;Ljava/nio/charset/Charset;)V

    return-object v0
.end method

.method public static newReaderSupplier(Ljava/lang/String;)Lcom/google/common/io/InputSupplier;
    .locals 1
    .parameter "value"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/common/io/InputSupplier",
            "<",
            "Ljava/io/StringReader;",
            ">;"
        }
    .end annotation

    .prologue
    .line 67
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    new-instance v0, Lcom/google/common/io/CharStreams$1;

    invoke-direct {v0, p0}, Lcom/google/common/io/CharStreams$1;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static newWriterSupplier(Lcom/google/common/io/OutputSupplier;Ljava/nio/charset/Charset;)Lcom/google/common/io/OutputSupplier;
    .locals 1
    .parameter
    .parameter "charset"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/io/OutputSupplier",
            "<+",
            "Ljava/io/OutputStream;",
            ">;",
            "Ljava/nio/charset/Charset;",
            ")",
            "Lcom/google/common/io/OutputSupplier",
            "<",
            "Ljava/io/OutputStreamWriter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 106
    .local p0, out:Lcom/google/common/io/OutputSupplier;,"Lcom/google/common/io/OutputSupplier<+Ljava/io/OutputStream;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    new-instance v0, Lcom/google/common/io/CharStreams$3;

    invoke-direct {v0, p0, p1}, Lcom/google/common/io/CharStreams$3;-><init>(Lcom/google/common/io/OutputSupplier;Ljava/nio/charset/Charset;)V

    return-object v0
.end method

.method public static readFirstLine(Lcom/google/common/io/InputSupplier;)Ljava/lang/String;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R::",
            "Ljava/lang/Readable;",
            ":",
            "Ljava/io/Closeable;",
            ">(",
            "Lcom/google/common/io/InputSupplier",
            "<TR;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 284
    .local p0, supplier:Lcom/google/common/io/InputSupplier;,"Lcom/google/common/io/InputSupplier<TR;>;"
    const/4 v2, 0x1

    .line 285
    .local v2, threw:Z
    invoke-interface {p0}, Lcom/google/common/io/InputSupplier;->getInput()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Readable;

    .line 287
    .local v1, r:Ljava/lang/Readable;,"TR;"
    :try_start_0
    new-instance v3, Lcom/google/common/io/LineReader;

    invoke-direct {v3, v1}, Lcom/google/common/io/LineReader;-><init>(Ljava/lang/Readable;)V

    invoke-virtual {v3}, Lcom/google/common/io/LineReader;->readLine()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 288
    .local v0, line:Ljava/lang/String;
    const/4 v2, 0x0

    .line 291
    check-cast v1, Ljava/io/Closeable;

    .end local v1           #r:Ljava/lang/Readable;,"TR;"
    invoke-static {v1, v2}, Lcom/google/common/io/Closeables;->close(Ljava/io/Closeable;Z)V

    return-object v0

    .end local v0           #line:Ljava/lang/String;
    .restart local v1       #r:Ljava/lang/Readable;,"TR;"
    :catchall_0
    move-exception v3

    check-cast v1, Ljava/io/Closeable;

    .end local v1           #r:Ljava/lang/Readable;,"TR;"
    invoke-static {v1, v2}, Lcom/google/common/io/Closeables;->close(Ljava/io/Closeable;Z)V

    throw v3
.end method

.method public static readLines(Lcom/google/common/io/InputSupplier;Lcom/google/common/io/LineProcessor;)Ljava/lang/Object;
    .locals 5
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R::",
            "Ljava/lang/Readable;",
            ":",
            "Ljava/io/Closeable;",
            "T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/io/InputSupplier",
            "<TR;>;",
            "Lcom/google/common/io/LineProcessor",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 352
    .local p0, supplier:Lcom/google/common/io/InputSupplier;,"Lcom/google/common/io/InputSupplier<TR;>;"
    .local p1, callback:Lcom/google/common/io/LineProcessor;,"Lcom/google/common/io/LineProcessor<TT;>;"
    const/4 v3, 0x1

    .line 353
    .local v3, threw:Z
    invoke-interface {p0}, Lcom/google/common/io/InputSupplier;->getInput()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Readable;

    .line 355
    .local v2, r:Ljava/lang/Readable;,"TR;"
    :try_start_0
    new-instance v1, Lcom/google/common/io/LineReader;

    invoke-direct {v1, v2}, Lcom/google/common/io/LineReader;-><init>(Ljava/lang/Readable;)V

    .line 357
    .local v1, lineReader:Lcom/google/common/io/LineReader;
    :cond_0
    invoke-virtual {v1}, Lcom/google/common/io/LineReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .local v0, line:Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 358
    invoke-interface {p1, v0}, Lcom/google/common/io/LineProcessor;->processLine(Ljava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-nez v4, :cond_0

    .line 362
    :cond_1
    const/4 v3, 0x0

    .line 364
    check-cast v2, Ljava/io/Closeable;

    .end local v2           #r:Ljava/lang/Readable;,"TR;"
    invoke-static {v2, v3}, Lcom/google/common/io/Closeables;->close(Ljava/io/Closeable;Z)V

    .line 366
    invoke-interface {p1}, Lcom/google/common/io/LineProcessor;->getResult()Ljava/lang/Object;

    move-result-object v4

    return-object v4

    .line 364
    .end local v0           #line:Ljava/lang/String;
    .end local v1           #lineReader:Lcom/google/common/io/LineReader;
    .restart local v2       #r:Ljava/lang/Readable;,"TR;"
    :catchall_0
    move-exception v4

    check-cast v2, Ljava/io/Closeable;

    .end local v2           #r:Ljava/lang/Readable;,"TR;"
    invoke-static {v2, v3}, Lcom/google/common/io/Closeables;->close(Ljava/io/Closeable;Z)V

    throw v4
.end method

.method public static readLines(Lcom/google/common/io/InputSupplier;)Ljava/util/List;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R::",
            "Ljava/lang/Readable;",
            ":",
            "Ljava/io/Closeable;",
            ">(",
            "Lcom/google/common/io/InputSupplier",
            "<TR;>;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 306
    .local p0, supplier:Lcom/google/common/io/InputSupplier;,"Lcom/google/common/io/InputSupplier<TR;>;"
    const/4 v2, 0x1

    .line 307
    .local v2, threw:Z
    invoke-interface {p0}, Lcom/google/common/io/InputSupplier;->getInput()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Readable;

    .line 309
    .local v0, r:Ljava/lang/Readable;,"TR;"
    :try_start_0
    invoke-static {v0}, Lcom/google/common/io/CharStreams;->readLines(Ljava/lang/Readable;)Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 310
    .local v1, result:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .line 313
    check-cast v0, Ljava/io/Closeable;

    .end local v0           #r:Ljava/lang/Readable;,"TR;"
    invoke-static {v0, v2}, Lcom/google/common/io/Closeables;->close(Ljava/io/Closeable;Z)V

    return-object v1

    .end local v1           #result:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .restart local v0       #r:Ljava/lang/Readable;,"TR;"
    :catchall_0
    move-exception v3

    check-cast v0, Ljava/io/Closeable;

    .end local v0           #r:Ljava/lang/Readable;,"TR;"
    invoke-static {v0, v2}, Lcom/google/common/io/Closeables;->close(Ljava/io/Closeable;Z)V

    throw v3
.end method

.method public static readLines(Ljava/lang/Readable;)Ljava/util/List;
    .locals 3
    .parameter "r"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Readable;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 331
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 332
    .local v2, result:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    new-instance v1, Lcom/google/common/io/LineReader;

    invoke-direct {v1, p0}, Lcom/google/common/io/LineReader;-><init>(Ljava/lang/Readable;)V

    .line 334
    .local v1, lineReader:Lcom/google/common/io/LineReader;
    :goto_0
    invoke-virtual {v1}, Lcom/google/common/io/LineReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .local v0, line:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 335
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 337
    :cond_0
    return-object v2
.end method

.method public static skipFully(Ljava/io/Reader;J)V
    .locals 6
    .parameter "reader"
    .parameter "n"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v4, 0x0

    .line 411
    :goto_0
    cmp-long v2, p1, v4

    if-lez v2, :cond_2

    .line 412
    invoke-virtual {p0, p1, p2}, Ljava/io/Reader;->skip(J)J

    move-result-wide v0

    .line 413
    .local v0, amt:J
    cmp-long v2, v0, v4

    if-nez v2, :cond_1

    .line 415
    invoke-virtual {p0}, Ljava/io/Reader;->read()I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 416
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 418
    :cond_0
    const-wide/16 v2, 0x1

    sub-long/2addr p1, v2

    goto :goto_0

    .line 420
    :cond_1
    sub-long/2addr p1, v0

    goto :goto_0

    .line 423
    .end local v0           #amt:J
    :cond_2
    return-void
.end method

.method public static toString(Lcom/google/common/io/InputSupplier;)Ljava/lang/String;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R::",
            "Ljava/lang/Readable;",
            ":",
            "Ljava/io/Closeable;",
            ">(",
            "Lcom/google/common/io/InputSupplier",
            "<TR;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 236
    .local p0, supplier:Lcom/google/common/io/InputSupplier;,"Lcom/google/common/io/InputSupplier<TR;>;"
    invoke-static {p0}, Lcom/google/common/io/CharStreams;->toStringBuilder(Lcom/google/common/io/InputSupplier;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toString(Ljava/lang/Readable;)Ljava/lang/String;
    .locals 1
    .parameter "r"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 223
    invoke-static {p0}, Lcom/google/common/io/CharStreams;->toStringBuilder(Ljava/lang/Readable;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static toStringBuilder(Lcom/google/common/io/InputSupplier;)Ljava/lang/StringBuilder;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R::",
            "Ljava/lang/Readable;",
            ":",
            "Ljava/io/Closeable;",
            ">(",
            "Lcom/google/common/io/InputSupplier",
            "<TR;>;)",
            "Ljava/lang/StringBuilder;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 262
    .local p0, supplier:Lcom/google/common/io/InputSupplier;,"Lcom/google/common/io/InputSupplier<TR;>;"
    const/4 v2, 0x1

    .line 263
    .local v2, threw:Z
    invoke-interface {p0}, Lcom/google/common/io/InputSupplier;->getInput()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Readable;

    .line 265
    .local v0, r:Ljava/lang/Readable;,"TR;"
    :try_start_0
    invoke-static {v0}, Lcom/google/common/io/CharStreams;->toStringBuilder(Ljava/lang/Readable;)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 266
    .local v1, result:Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 269
    check-cast v0, Ljava/io/Closeable;

    .end local v0           #r:Ljava/lang/Readable;,"TR;"
    invoke-static {v0, v2}, Lcom/google/common/io/Closeables;->close(Ljava/io/Closeable;Z)V

    return-object v1

    .end local v1           #result:Ljava/lang/StringBuilder;
    .restart local v0       #r:Ljava/lang/Readable;,"TR;"
    :catchall_0
    move-exception v3

    check-cast v0, Ljava/io/Closeable;

    .end local v0           #r:Ljava/lang/Readable;,"TR;"
    invoke-static {v0, v2}, Lcom/google/common/io/Closeables;->close(Ljava/io/Closeable;Z)V

    throw v3
.end method

.method private static toStringBuilder(Ljava/lang/Readable;)Ljava/lang/StringBuilder;
    .locals 1
    .parameter "r"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 248
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 249
    .local v0, sb:Ljava/lang/StringBuilder;
    invoke-static {p0, v0}, Lcom/google/common/io/CharStreams;->copy(Ljava/lang/Readable;Ljava/lang/Appendable;)J

    .line 250
    return-object v0
.end method

.method public static write(Ljava/lang/CharSequence;Lcom/google/common/io/OutputSupplier;)V
    .locals 3
    .parameter "from"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<W::",
            "Ljava/lang/Appendable;",
            ":",
            "Ljava/io/Closeable;",
            ">(",
            "Ljava/lang/CharSequence;",
            "Lcom/google/common/io/OutputSupplier",
            "<TW;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    .local p1, to:Lcom/google/common/io/OutputSupplier;,"Lcom/google/common/io/OutputSupplier<TW;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    const/4 v1, 0x1

    .line 128
    .local v1, threw:Z
    invoke-interface {p1}, Lcom/google/common/io/OutputSupplier;->getOutput()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Appendable;

    .line 130
    .local v0, out:Ljava/lang/Appendable;,"TW;"
    :try_start_0
    invoke-interface {v0, p0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 131
    const/4 v1, 0x0

    .line 133
    check-cast v0, Ljava/io/Closeable;

    .end local v0           #out:Ljava/lang/Appendable;,"TW;"
    invoke-static {v0, v1}, Lcom/google/common/io/Closeables;->close(Ljava/io/Closeable;Z)V

    .line 135
    return-void

    .line 133
    .restart local v0       #out:Ljava/lang/Appendable;,"TW;"
    :catchall_0
    move-exception v2

    check-cast v0, Ljava/io/Closeable;

    .end local v0           #out:Ljava/lang/Appendable;,"TW;"
    invoke-static {v0, v1}, Lcom/google/common/io/Closeables;->close(Ljava/io/Closeable;Z)V

    throw v2
.end method
