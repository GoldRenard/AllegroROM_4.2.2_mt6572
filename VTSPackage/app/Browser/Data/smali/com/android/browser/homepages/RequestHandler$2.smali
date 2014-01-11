.class Lcom/android/browser/homepages/RequestHandler$2;
.super Lcom/android/browser/homepages/Template$CursorListEntityWrapper;
.source "RequestHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/homepages/RequestHandler;->writeTemplatedIndex()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/homepages/RequestHandler;


# direct methods
.method constructor <init>(Lcom/android/browser/homepages/RequestHandler;Landroid/database/Cursor;)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    .line 129
    iput-object p1, p0, Lcom/android/browser/homepages/RequestHandler$2;->this$0:Lcom/android/browser/homepages/RequestHandler;

    invoke-direct {p0, p2}, Lcom/android/browser/homepages/Template$CursorListEntityWrapper;-><init>(Landroid/database/Cursor;)V

    return-void
.end method


# virtual methods
.method public writeValue(Ljava/io/OutputStream;Ljava/lang/String;)V
    .locals 4
    .parameter "stream"
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 132
    invoke-virtual {p0}, Lcom/android/browser/homepages/RequestHandler$2;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 133
    .local v0, cursor:Landroid/database/Cursor;
    const-string v2, "url"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 134
    iget-object v2, p0, Lcom/android/browser/homepages/RequestHandler$2;->this$0:Lcom/android/browser/homepages/RequestHandler;

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/browser/homepages/RequestHandler;->htmlEncode(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 142
    :cond_0
    :goto_0
    return-void

    .line 135
    :cond_1
    const-string v2, "title"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 136
    iget-object v2, p0, Lcom/android/browser/homepages/RequestHandler$2;->this$0:Lcom/android/browser/homepages/RequestHandler;

    const/4 v3, 0x1

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/browser/homepages/RequestHandler;->htmlEncode(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    goto :goto_0

    .line 137
    :cond_2
    const-string v2, "thumbnail"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 138
    const-string v2, "data:image/png;base64,"

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 139
    const/4 v2, 0x2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v1

    .line 140
    .local v1, thumb:[B
    invoke-static {v1, v3}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    goto :goto_0
.end method
