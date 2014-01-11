.class public Lcom/mediatek/bluetooth/util/MediaScanner;
.super Ljava/lang/Object;
.source "MediaScanner.java"

# interfaces
.implements Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;


# static fields
.field public static final MEDIA_SCANNED:I = 0x0

.field public static final MEDIA_SCAN_FAILED:I = 0x1

.field private static final TAG:Ljava/lang/String; = "MediaScanner"


# instance fields
.field private callback:Landroid/os/Handler;

.field private callbackId:I

.field private context:Landroid/content/Context;

.field private mimeType:Ljava/lang/String;

.field private msc:Landroid/media/MediaScannerConnection;

.field private path:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;I)V
    .locals 2
    .parameter "context"
    .parameter "path"
    .parameter "mimeType"
    .parameter "callback"
    .parameter "callbackId"

    .prologue
    .line 61
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Lcom/mediatek/bluetooth/util/MediaScanner;->context:Landroid/content/Context;

    .line 64
    iput-object p2, p0, Lcom/mediatek/bluetooth/util/MediaScanner;->path:Ljava/lang/String;

    .line 65
    iput-object p3, p0, Lcom/mediatek/bluetooth/util/MediaScanner;->mimeType:Ljava/lang/String;

    .line 66
    iput-object p4, p0, Lcom/mediatek/bluetooth/util/MediaScanner;->callback:Landroid/os/Handler;

    .line 67
    iput p5, p0, Lcom/mediatek/bluetooth/util/MediaScanner;->callbackId:I

    .line 68
    new-instance v0, Landroid/media/MediaScannerConnection;

    iget-object v1, p0, Lcom/mediatek/bluetooth/util/MediaScanner;->context:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Landroid/media/MediaScannerConnection;-><init>(Landroid/content/Context;Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/util/MediaScanner;->msc:Landroid/media/MediaScannerConnection;

    .line 70
    const-string v0, "MediaScanner"

    const-string v1, "[BT][MMI][MediaScanner]: connecting to Media Scanner Service"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    iget-object v0, p0, Lcom/mediatek/bluetooth/util/MediaScanner;->msc:Landroid/media/MediaScannerConnection;

    invoke-virtual {v0}, Landroid/media/MediaScannerConnection;->connect()V

    .line 72
    return-void
.end method


# virtual methods
.method public onMediaScannerConnected()V
    .locals 4

    .prologue
    .line 77
    :try_start_0
    const-string v1, "MediaScanner"

    const-string v2, "[BT][MMI][onMediaScannerConnected]: MediaScanner connected."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    iget-object v1, p0, Lcom/mediatek/bluetooth/util/MediaScanner;->msc:Landroid/media/MediaScannerConnection;

    iget-object v2, p0, Lcom/mediatek/bluetooth/util/MediaScanner;->path:Ljava/lang/String;

    iget-object v3, p0, Lcom/mediatek/bluetooth/util/MediaScanner;->mimeType:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaScannerConnection;->scanFile(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    :goto_0
    return-void

    .line 80
    :catch_0
    move-exception v0

    .line 82
    .local v0, ex:Ljava/lang/Exception;
    const-string v1, "MediaScanner"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[BT][MMI][onMediaScannerConnected]: MediaScanner exception: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onScanCompleted(Ljava/lang/String;Landroid/net/Uri;)V
    .locals 5
    .parameter "path"
    .parameter "uri"

    .prologue
    .line 88
    const-string v2, "MediaScanner"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[BT][MMI][onScanCompleted]: path="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", uri="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    :try_start_0
    iget-object v2, p0, Lcom/mediatek/bluetooth/util/MediaScanner;->callback:Landroid/os/Handler;

    if-eqz v2, :cond_0

    .line 93
    iget-object v2, p0, Lcom/mediatek/bluetooth/util/MediaScanner;->callback:Landroid/os/Handler;

    invoke-static {v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;)Landroid/os/Message;

    move-result-object v1

    .line 94
    .local v1, msg:Landroid/os/Message;
    iget v2, p0, Lcom/mediatek/bluetooth/util/MediaScanner;->callbackId:I

    iput v2, v1, Landroid/os/Message;->arg1:I

    .line 95
    iput-object p2, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 96
    if-eqz p2, :cond_1

    const/4 v2, 0x0

    :goto_0
    iput v2, v1, Landroid/os/Message;->what:I

    .line 97
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    .end local v1           #msg:Landroid/os/Message;
    :cond_0
    iget-object v2, p0, Lcom/mediatek/bluetooth/util/MediaScanner;->msc:Landroid/media/MediaScannerConnection;

    invoke-virtual {v2}, Landroid/media/MediaScannerConnection;->disconnect()V

    .line 108
    :goto_1
    return-void

    .line 96
    .restart local v1       #msg:Landroid/os/Message;
    :cond_1
    const/4 v2, 0x1

    goto :goto_0

    .line 100
    .end local v1           #msg:Landroid/os/Message;
    :catch_0
    move-exception v0

    .line 102
    .local v0, ex:Ljava/lang/Exception;
    :try_start_1
    const-string v2, "MediaScanner"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[BT][MMI][onScanCompleted]: MediaScanner exception: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 106
    iget-object v2, p0, Lcom/mediatek/bluetooth/util/MediaScanner;->msc:Landroid/media/MediaScannerConnection;

    invoke-virtual {v2}, Landroid/media/MediaScannerConnection;->disconnect()V

    goto :goto_1

    .end local v0           #ex:Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/mediatek/bluetooth/util/MediaScanner;->msc:Landroid/media/MediaScannerConnection;

    invoke-virtual {v3}, Landroid/media/MediaScannerConnection;->disconnect()V

    throw v2
.end method
