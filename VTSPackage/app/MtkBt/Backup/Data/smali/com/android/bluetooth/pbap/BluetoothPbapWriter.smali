.class public Lcom/android/bluetooth/pbap/BluetoothPbapWriter;
.super Ljava/lang/Object;
.source "BluetoothPbapWriter.java"


# static fields
.field public static final DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "BluetoothPbapWriter"


# instance fields
.field mOutputStream:Ljava/io/FileOutputStream;

.field mResultPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 55
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->mResultPath:Ljava/lang/String;

    .line 57
    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->mOutputStream:Ljava/io/FileOutputStream;

    .line 58
    return-void
.end method


# virtual methods
.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->mResultPath:Ljava/lang/String;

    return-object v0
.end method

.method public init(Landroid/content/Context;)Z
    .locals 5
    .parameter "context"

    .prologue
    const/4 v2, 0x1

    .line 61
    iget-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->mOutputStream:Ljava/io/FileOutputStream;

    if-nez v3, :cond_0

    .line 63
    const/4 v1, 0x0

    .line 64
    .local v1, path:Ljava/io/File;
    :try_start_0
    const-string v3, "btpbaptmp.vcf"

    const/4 v4, 0x1

    invoke-virtual {p1, v3, v4}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v3

    iput-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->mOutputStream:Ljava/io/FileOutputStream;

    .line 66
    const-string v3, "btpbaptmp.vcf"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 67
    if-eqz v1, :cond_0

    .line 68
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->mResultPath:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    .end local v1           #path:Ljava/io/File;
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->mOutputStream:Ljava/io/FileOutputStream;

    if-eqz v3, :cond_1

    :goto_1
    return v2

    .line 70
    .restart local v1       #path:Ljava/io/File;
    :catch_0
    move-exception v0

    .line 71
    .local v0, e:Ljava/io/FileNotFoundException;
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->mOutputStream:Ljava/io/FileOutputStream;

    goto :goto_0

    .line 83
    .end local v0           #e:Ljava/io/FileNotFoundException;
    .end local v1           #path:Ljava/io/File;
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public terminate()V
    .locals 2

    .prologue
    .line 106
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->mOutputStream:Ljava/io/FileOutputStream;

    if-eqz v1, :cond_0

    .line 108
    :try_start_0
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->mOutputStream:Ljava/io/FileOutputStream;

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    :cond_0
    :goto_0
    return-void

    .line 109
    :catch_0
    move-exception v0

    .line 110
    .local v0, e:Ljava/io/IOException;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->mOutputStream:Ljava/io/FileOutputStream;

    goto :goto_0
.end method

.method public write(Ljava/lang/String;)Z
    .locals 4
    .parameter "str"

    .prologue
    const/4 v1, 0x0

    .line 88
    :try_start_0
    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->mOutputStream:Ljava/io/FileOutputStream;

    if-eqz v2, :cond_0

    .line 89
    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->mOutputStream:Ljava/io/FileOutputStream;

    const-string v3, "UTF-8"

    invoke-virtual {p1, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/FileOutputStream;->write([B)V

    .line 98
    const/4 v1, 0x1

    :goto_0
    return v1

    .line 91
    :cond_0
    const-string v2, "BluetoothPbapWriter"

    const-string v3, "mOutputStream is null when calling write"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 94
    :catch_0
    move-exception v0

    .line 95
    .local v0, e:Ljava/io/IOException;
    const-string v2, "BluetoothPbapWriter"

    const-string v3, "write output stream failed"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
