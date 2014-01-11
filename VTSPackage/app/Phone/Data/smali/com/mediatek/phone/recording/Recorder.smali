.class public Lcom/mediatek/phone/recording/Recorder;
.super Ljava/lang/Object;
.source "Recorder.java"

# interfaces
.implements Landroid/media/MediaRecorder$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/phone/recording/Recorder$OnStateChangedListener;
    }
.end annotation


# static fields
.field public static final IDLE_STATE:I = 0x0

.field public static final INTERNAL_ERROR:I = 0x2

.field public static final NO_ERROR:I = 0x0

.field public static final RECORDING_STATE:I = 0x1

.field static final SAMPLE_LENGTH_KEY:Ljava/lang/String; = "sample_length"

.field static final SAMPLE_PATH_KEY:Ljava/lang/String; = "sample_path"

.field static final SAMPLE_PREFIX:Ljava/lang/String; = "recording"

.field public static final SDCARD_ACCESS_ERROR:I = 0x1

.field private static final TAG:Ljava/lang/String; = "Recorder"


# instance fields
.field mOnStateChangedListener:Lcom/mediatek/phone/recording/Recorder$OnStateChangedListener;

.field mRecorder:Landroid/media/MediaRecorder;

.field mSampleFile:Ljava/io/File;

.field mSampleLength:J

.field mSampleStart:J

.field mState:I

.field public recordFilePatch:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 92
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/phone/recording/Recorder;->mState:I

    .line 68
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/phone/recording/Recorder;->recordFilePatch:Ljava/lang/String;

    .line 93
    return-void
.end method

.method private handleException()V
    .locals 1

    .prologue
    .line 278
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/mediatek/phone/recording/Recorder;->setError(I)V

    .line 279
    iget-object v0, p0, Lcom/mediatek/phone/recording/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->reset()V

    .line 280
    iget-object v0, p0, Lcom/mediatek/phone/recording/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->release()V

    .line 281
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/phone/recording/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    .line 282
    return-void
.end method

.method private setError(I)V
    .locals 1
    .parameter "error"

    .prologue
    .line 328
    iget-object v0, p0, Lcom/mediatek/phone/recording/Recorder;->mOnStateChangedListener:Lcom/mediatek/phone/recording/Recorder$OnStateChangedListener;

    if-eqz v0, :cond_0

    .line 329
    iget-object v0, p0, Lcom/mediatek/phone/recording/Recorder;->mOnStateChangedListener:Lcom/mediatek/phone/recording/Recorder$OnStateChangedListener;

    invoke-interface {v0, p1}, Lcom/mediatek/phone/recording/Recorder$OnStateChangedListener;->onError(I)V

    .line 331
    :cond_0
    return-void
.end method

.method private setState(I)V
    .locals 1
    .parameter "state"

    .prologue
    .line 306
    iget v0, p0, Lcom/mediatek/phone/recording/Recorder;->mState:I

    if-ne p1, v0, :cond_0

    .line 311
    :goto_0
    return-void

    .line 309
    :cond_0
    iput p1, p0, Lcom/mediatek/phone/recording/Recorder;->mState:I

    .line 310
    iget v0, p0, Lcom/mediatek/phone/recording/Recorder;->mState:I

    invoke-direct {p0, v0}, Lcom/mediatek/phone/recording/Recorder;->signalStateChanged(I)V

    goto :goto_0
.end method

.method private signalStateChanged(I)V
    .locals 1
    .parameter "state"

    .prologue
    .line 318
    iget-object v0, p0, Lcom/mediatek/phone/recording/Recorder;->mOnStateChangedListener:Lcom/mediatek/phone/recording/Recorder$OnStateChangedListener;

    if-eqz v0, :cond_0

    .line 319
    iget-object v0, p0, Lcom/mediatek/phone/recording/Recorder;->mOnStateChangedListener:Lcom/mediatek/phone/recording/Recorder$OnStateChangedListener;

    invoke-interface {v0, p1}, Lcom/mediatek/phone/recording/Recorder$OnStateChangedListener;->onStateChanged(I)V

    .line 321
    :cond_0
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 2

    .prologue
    .line 206
    invoke-virtual {p0}, Lcom/mediatek/phone/recording/Recorder;->stop()V

    .line 208
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleLength:J

    .line 210
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/mediatek/phone/recording/Recorder;->signalStateChanged(I)V

    .line 211
    return-void
.end method

.method public delete()V
    .locals 2

    .prologue
    .line 190
    invoke-virtual {p0}, Lcom/mediatek/phone/recording/Recorder;->stop()V

    .line 192
    iget-object v0, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleFile:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 193
    iget-object v0, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 195
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleFile:Ljava/io/File;

    .line 196
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleLength:J

    .line 198
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/mediatek/phone/recording/Recorder;->signalStateChanged(I)V

    .line 199
    return-void
.end method

.method public getMaxAmplitude()I
    .locals 2

    .prologue
    .line 109
    iget v0, p0, Lcom/mediatek/phone/recording/Recorder;->mState:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 110
    const/4 v0, 0x0

    .line 112
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/recording/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->getMaxAmplitude()I

    move-result v0

    goto :goto_0
.end method

.method public log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 346
    const-string v0, "Recorder"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 347
    return-void
.end method

.method public onError(Landroid/media/MediaRecorder;II)V
    .locals 1
    .parameter "mp"
    .parameter "what"
    .parameter "extra"

    .prologue
    .line 337
    const-string v0, "onError"

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/recording/Recorder;->log(Ljava/lang/String;)V

    .line 338
    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    .line 339
    invoke-virtual {p0}, Lcom/mediatek/phone/recording/Recorder;->stop()V

    .line 342
    :cond_0
    return-void
.end method

.method public progress()I
    .locals 4

    .prologue
    .line 164
    iget v0, p0, Lcom/mediatek/phone/recording/Recorder;->mState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 165
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleStart:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    long-to-int v0, v0

    .line 167
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public restoreState(Landroid/os/Bundle;)V
    .locals 7
    .parameter "recorderState"

    .prologue
    const-wide/16 v5, -0x1

    .line 120
    const-string v4, "sample_path"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 121
    .local v3, samplePath:Ljava/lang/String;
    if-nez v3, :cond_1

    .line 141
    :cond_0
    :goto_0
    return-void

    .line 124
    :cond_1
    const-string v4, "sample_length"

    invoke-virtual {p1, v4, v5, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    .line 125
    .local v1, sampleLength:J
    cmp-long v4, v1, v5

    if-eqz v4, :cond_0

    .line 128
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 129
    .local v0, file:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 132
    iget-object v4, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleFile:Ljava/io/File;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleFile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    if-eqz v4, :cond_0

    .line 136
    :cond_2
    invoke-virtual {p0}, Lcom/mediatek/phone/recording/Recorder;->delete()V

    .line 137
    iput-object v0, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleFile:Ljava/io/File;

    .line 138
    iput-wide v1, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleLength:J

    .line 140
    const/4 v4, 0x0

    invoke-direct {p0, v4}, Lcom/mediatek/phone/recording/Recorder;->signalStateChanged(I)V

    goto :goto_0
.end method

.method public sampleFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleFile:Ljava/io/File;

    return-object v0
.end method

.method public sampleLength()J
    .locals 2

    .prologue
    .line 175
    iget-wide v0, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleLength:J

    return-wide v0
.end method

.method public saveState(Landroid/os/Bundle;)V
    .locals 3
    .parameter "recorderState"

    .prologue
    .line 100
    const-string v0, "sample_path"

    iget-object v1, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    const-string v0, "sample_length"

    iget-wide v1, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleLength:J

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 102
    return-void
.end method

.method public setOnStateChangedListener(Lcom/mediatek/phone/recording/Recorder$OnStateChangedListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 148
    iput-object p1, p0, Lcom/mediatek/phone/recording/Recorder;->mOnStateChangedListener:Lcom/mediatek/phone/recording/Recorder$OnStateChangedListener;

    .line 149
    return-void
.end method

.method public startRecording(ILjava/lang/String;)V
    .locals 9
    .parameter "outputfileformat"
    .parameter "extension"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 220
    const-string v6, "startRecording"

    invoke-virtual {p0, v6}, Lcom/mediatek/phone/recording/Recorder;->log(Ljava/lang/String;)V

    .line 221
    invoke-virtual {p0}, Lcom/mediatek/phone/recording/Recorder;->stop()V

    .line 223
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v6, "yyyy-MM-dd_HH.mm.ss"

    invoke-direct {v0, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 224
    .local v0, dateFormat:Ljava/text/SimpleDateFormat;
    new-instance v6, Ljava/util/Date;

    invoke-direct {v6}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v6}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    .line 225
    .local v3, prefix:Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    invoke-static {}, Lcom/mediatek/storage/StorageManagerEx;->getDefaultPath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 227
    .local v4, sampleDir:Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->canWrite()Z

    move-result v6

    if-nez v6, :cond_0

    .line 228
    const-string v6, "Recorder"

    const-string v7, "----- file can\'t write!! ---"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    new-instance v4, Ljava/io/File;

    .end local v4           #sampleDir:Ljava/io/File;
    const-string v6, "/sdcard/sdcard"

    invoke-direct {v4, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 233
    .restart local v4       #sampleDir:Ljava/io/File;
    :cond_0
    new-instance v5, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/PhoneRecord"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 234
    .end local v4           #sampleDir:Ljava/io/File;
    .local v5, sampleDir:Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_1

    .line 235
    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    .line 239
    :cond_1
    :try_start_0
    invoke-static {v3, p2, v5}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v6

    iput-object v6, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleFile:Ljava/io/File;

    .line 241
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, ": "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleFile:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/mediatek/phone/recording/Recorder;->recordFilePatch:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 249
    const-string v6, "finish creating temp file, start to record"

    invoke-virtual {p0, v6}, Lcom/mediatek/phone/recording/Recorder;->log(Ljava/lang/String;)V

    .line 251
    new-instance v6, Landroid/media/MediaRecorder;

    invoke-direct {v6}, Landroid/media/MediaRecorder;-><init>()V

    iput-object v6, p0, Lcom/mediatek/phone/recording/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    .line 252
    iget-object v6, p0, Lcom/mediatek/phone/recording/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v6, p0}, Landroid/media/MediaRecorder;->setOnErrorListener(Landroid/media/MediaRecorder$OnErrorListener;)V

    .line 253
    iget-object v6, p0, Lcom/mediatek/phone/recording/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v6, v8}, Landroid/media/MediaRecorder;->setAudioSource(I)V

    .line 254
    iget-object v6, p0, Lcom/mediatek/phone/recording/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v6, p1}, Landroid/media/MediaRecorder;->setOutputFormat(I)V

    .line 255
    iget-object v6, p0, Lcom/mediatek/phone/recording/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v6, v8}, Landroid/media/MediaRecorder;->setAudioEncoder(I)V

    .line 256
    iget-object v6, p0, Lcom/mediatek/phone/recording/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    iget-object v7, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleFile:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/lang/String;)V

    .line 259
    :try_start_1
    iget-object v6, p0, Lcom/mediatek/phone/recording/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v6}, Landroid/media/MediaRecorder;->prepare()V

    .line 260
    iget-object v6, p0, Lcom/mediatek/phone/recording/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v6}, Landroid/media/MediaRecorder;->start()V

    .line 261
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleStart:J

    .line 262
    const/4 v6, 0x1

    invoke-direct {p0, v6}, Lcom/mediatek/phone/recording/Recorder;->setState(I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_2

    .line 275
    return-void

    .line 243
    :catch_0
    move-exception v1

    .line 244
    .local v1, e:Ljava/io/IOException;
    invoke-direct {p0, v8}, Lcom/mediatek/phone/recording/Recorder;->setError(I)V

    .line 245
    const-string v6, "Recorder"

    const-string v7, "----***------- can\'t access sdcard !!"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    throw v1

    .line 263
    .end local v1           #e:Ljava/io/IOException;
    :catch_1
    move-exception v2

    .line 264
    .local v2, exception:Ljava/io/IOException;
    const-string v6, "startRecording, IOException"

    invoke-virtual {p0, v6}, Lcom/mediatek/phone/recording/Recorder;->log(Ljava/lang/String;)V

    .line 265
    invoke-direct {p0}, Lcom/mediatek/phone/recording/Recorder;->handleException()V

    .line 266
    throw v2

    .line 267
    .end local v2           #exception:Ljava/io/IOException;
    :catch_2
    move-exception v2

    .line 271
    .local v2, exception:Ljava/lang/RuntimeException;
    const-string v6, "startRecording, RuntimeException"

    invoke-virtual {p0, v6}, Lcom/mediatek/phone/recording/Recorder;->log(Ljava/lang/String;)V

    .line 272
    invoke-direct {p0}, Lcom/mediatek/phone/recording/Recorder;->handleException()V

    .line 273
    throw v2
.end method

.method public state()I
    .locals 1

    .prologue
    .line 156
    iget v0, p0, Lcom/mediatek/phone/recording/Recorder;->mState:I

    return v0
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 298
    const-string v0, "stop"

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/recording/Recorder;->log(Ljava/lang/String;)V

    .line 299
    invoke-virtual {p0}, Lcom/mediatek/phone/recording/Recorder;->stopRecording()V

    .line 300
    return-void
.end method

.method public stopRecording()V
    .locals 4

    .prologue
    .line 285
    const-string v0, "stopRecording"

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/recording/Recorder;->log(Ljava/lang/String;)V

    .line 286
    iget-object v0, p0, Lcom/mediatek/phone/recording/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    if-nez v0, :cond_0

    .line 295
    :goto_0
    return-void

    .line 289
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleStart:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/mediatek/phone/recording/Recorder;->mSampleLength:J

    .line 290
    iget-object v0, p0, Lcom/mediatek/phone/recording/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->stop()V

    .line 291
    iget-object v0, p0, Lcom/mediatek/phone/recording/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->release()V

    .line 292
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/phone/recording/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    .line 294
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/mediatek/phone/recording/Recorder;->setState(I)V

    goto :goto_0
.end method
