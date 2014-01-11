.class public Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;
.super Ljava/lang/Object;
.source "BluetoothVCardComposer.java"

# interfaces
.implements Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/bluetooth/pbap/BluetoothVCardComposer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "HandlerForOutputStream"
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "vcard.VCardComposer.HandlerForOutputStream"


# instance fields
.field private mOnTerminateIsCalled:Z

.field private final mOutputStream:Ljava/io/OutputStream;

.field private mWriter:Ljava/io/Writer;

.field final synthetic this$0:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;


# direct methods
.method public constructor <init>(Lcom/android/bluetooth/pbap/BluetoothVCardComposer;Ljava/io/OutputStream;)V
    .locals 1
    .parameter
    .parameter "outputStream"

    .prologue
    .line 152
    iput-object p1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->this$0:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 143
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->mOnTerminateIsCalled:Z

    .line 153
    iput-object p2, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->mOutputStream:Ljava/io/OutputStream;

    .line 154
    return-void
.end method


# virtual methods
.method public onEntryCreated(Ljava/lang/String;)Z
    .locals 4
    .parameter "vcard"

    .prologue
    .line 180
    :try_start_0
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->mWriter:Ljava/io/Writer;

    invoke-virtual {v1, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    const/4 v1, 0x1

    :goto_0
    return v1

    .line 181
    :catch_0
    move-exception v0

    .line 182
    .local v0, e:Ljava/io/IOException;
    const-string v1, "vcard.VCardComposer.HandlerForOutputStream"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "IOException occurred during exportOneContactData: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->this$0:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "IOException occurred: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #setter for: Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mErrorReason:Ljava/lang/String;
    invoke-static {v1, v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->access$102(Lcom/android/bluetooth/pbap/BluetoothVCardComposer;Ljava/lang/String;)Ljava/lang/String;

    .line 184
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onInit(Landroid/content/Context;)Z
    .locals 7
    .parameter "context"

    .prologue
    const/4 v2, 0x0

    .line 158
    :try_start_0
    new-instance v3, Ljava/io/BufferedWriter;

    new-instance v4, Ljava/io/OutputStreamWriter;

    iget-object v5, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->mOutputStream:Ljava/io/OutputStream;

    iget-object v6, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->this$0:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    #getter for: Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCharsetString:Ljava/lang/String;
    invoke-static {v6}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->access$000(Lcom/android/bluetooth/pbap/BluetoothVCardComposer;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->mWriter:Ljava/io/Writer;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    iget-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->this$0:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    #getter for: Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mIsDoCoMo:Z
    invoke-static {v3}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->access$200(Lcom/android/bluetooth/pbap/BluetoothVCardComposer;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 168
    :try_start_1
    iget-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->mWriter:Ljava/io/Writer;

    iget-object v4, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->this$0:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    const-string v5, "-1"

    #calls: Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->createOneEntryInternal(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v4, v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->access$300(Lcom/android/bluetooth/pbap/BluetoothVCardComposer;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 175
    :cond_0
    const/4 v2, 0x1

    :goto_0
    return v2

    .line 159
    :catch_0
    move-exception v1

    .line 160
    .local v1, e1:Ljava/io/UnsupportedEncodingException;
    const-string v3, "vcard.VCardComposer.HandlerForOutputStream"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unsupported charset: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->this$0:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    #getter for: Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCharsetString:Ljava/lang/String;
    invoke-static {v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->access$000(Lcom/android/bluetooth/pbap/BluetoothVCardComposer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    iget-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->this$0:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Encoding is not supported (usually this does not happen!): "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->this$0:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    #getter for: Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mCharsetString:Ljava/lang/String;
    invoke-static {v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->access$000(Lcom/android/bluetooth/pbap/BluetoothVCardComposer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    #setter for: Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mErrorReason:Ljava/lang/String;
    invoke-static {v3, v4}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->access$102(Lcom/android/bluetooth/pbap/BluetoothVCardComposer;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0

    .line 169
    .end local v1           #e1:Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v0

    .line 170
    .local v0, e:Ljava/io/IOException;
    const-string v3, "vcard.VCardComposer.HandlerForOutputStream"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "IOException occurred during exportOneContactData: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    iget-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->this$0:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "IOException occurred: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    #setter for: Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->mErrorReason:Ljava/lang/String;
    invoke-static {v3, v4}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->access$102(Lcom/android/bluetooth/pbap/BluetoothVCardComposer;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0
.end method

.method public onTerminate()V
    .locals 5

    .prologue
    .line 190
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->mOnTerminateIsCalled:Z

    .line 191
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->mWriter:Ljava/io/Writer;

    if-eqz v1, :cond_1

    .line 196
    :try_start_0
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->mWriter:Ljava/io/Writer;

    invoke-virtual {v1}, Ljava/io/Writer;->flush()V

    .line 197
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->mOutputStream:Ljava/io/OutputStream;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->mOutputStream:Ljava/io/OutputStream;

    instance-of v1, v1, Ljava/io/FileOutputStream;

    if-eqz v1, :cond_0

    .line 198
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->mOutputStream:Ljava/io/OutputStream;

    check-cast v1, Ljava/io/FileOutputStream;

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/FileDescriptor;->sync()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 204
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->mWriter:Ljava/io/Writer;

    invoke-virtual {v1}, Ljava/io/Writer;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 210
    :cond_1
    :goto_0
    return-void

    .line 205
    :catch_0
    move-exception v0

    .line 206
    .local v0, e:Ljava/io/IOException;
    const-string v1, "vcard.VCardComposer.HandlerForOutputStream"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onTerminate,"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 200
    .end local v0           #e:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 201
    .restart local v0       #e:Ljava/io/IOException;
    :try_start_2
    const-string v1, "vcard.VCardComposer.HandlerForOutputStream"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "IOException during closing the output stream: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 204
    :try_start_3
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->mWriter:Ljava/io/Writer;

    invoke-virtual {v1}, Ljava/io/Writer;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 205
    :catch_2
    move-exception v0

    .line 206
    const-string v1, "vcard.VCardComposer.HandlerForOutputStream"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onTerminate,"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 203
    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v1

    .line 204
    :try_start_4
    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothVCardComposer$HandlerForOutputStream;->mWriter:Ljava/io/Writer;

    invoke-virtual {v2}, Ljava/io/Writer;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 207
    :goto_1
    throw v1

    .line 205
    :catch_3
    move-exception v0

    .line 206
    .restart local v0       #e:Ljava/io/IOException;
    const-string v2, "vcard.VCardComposer.HandlerForOutputStream"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onTerminate,"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method
