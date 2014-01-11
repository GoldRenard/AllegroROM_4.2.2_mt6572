.class Lcom/android/browser/homepages/RequestHandler$4;
.super Ljava/lang/Object;
.source "RequestHandler.java"

# interfaces
.implements Lcom/android/browser/homepages/Template$ListEntityIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/homepages/RequestHandler;->writeFolderIndex()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field index:I

.field final synthetic this$0:Lcom/android/browser/homepages/RequestHandler;

.field final synthetic val$files:[Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/android/browser/homepages/RequestHandler;[Ljava/io/File;)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 167
    iput-object p1, p0, Lcom/android/browser/homepages/RequestHandler$4;->this$0:Lcom/android/browser/homepages/RequestHandler;

    iput-object p2, p0, Lcom/android/browser/homepages/RequestHandler$4;->val$files:[Ljava/io/File;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 168
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/browser/homepages/RequestHandler$4;->index:I

    return-void
.end method


# virtual methods
.method public getListIterator(Ljava/lang/String;)Lcom/android/browser/homepages/Template$ListEntityIterator;
    .locals 1
    .parameter "key"

    .prologue
    .line 202
    const/4 v0, 0x0

    return-object v0
.end method

.method public moveToNext()Z
    .locals 2

    .prologue
    .line 212
    iget v0, p0, Lcom/android/browser/homepages/RequestHandler$4;->index:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/browser/homepages/RequestHandler$4;->index:I

    iget-object v1, p0, Lcom/android/browser/homepages/RequestHandler$4;->val$files:[Ljava/io/File;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 207
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/browser/homepages/RequestHandler$4;->index:I

    .line 208
    return-void
.end method

.method public writeValue(Ljava/io/OutputStream;Ljava/lang/String;)V
    .locals 5
    .parameter "stream"
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x3

    .line 172
    iget-object v2, p0, Lcom/android/browser/homepages/RequestHandler$4;->val$files:[Ljava/io/File;

    iget v3, p0, Lcom/android/browser/homepages/RequestHandler$4;->index:I

    aget-object v1, v2, v3

    .line 173
    .local v1, f:Ljava/io/File;
    const-string v2, "name"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 174
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 176
    :cond_0
    const-string v2, "url"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 177
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "file://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 179
    :cond_1
    const-string v2, "type"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 180
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_6

    const-string v2, "dir"

    :goto_0
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 182
    :cond_2
    const-string v2, "size"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 183
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 184
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/android/browser/homepages/RequestHandler;->readableFileSize(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 187
    :cond_3
    const-string v2, "last_modified"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 188
    invoke-static {v4, v4}, Ljava/text/DateFormat;->getDateTimeInstance(II)Ljava/text/DateFormat;

    move-result-object v2

    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 191
    .local v0, date:Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 193
    .end local v0           #date:Ljava/lang/String;
    :cond_4
    const-string v2, "alt"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 194
    iget v2, p0, Lcom/android/browser/homepages/RequestHandler$4;->index:I

    rem-int/lit8 v2, v2, 0x2

    if-nez v2, :cond_5

    .line 195
    const-string v2, "alt"

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 198
    :cond_5
    return-void

    .line 180
    :cond_6
    const-string v2, "file"

    goto :goto_0
.end method
