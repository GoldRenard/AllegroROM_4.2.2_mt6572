.class Lcom/android/settings/fuelgauge/PowerUsageSummary$GetPowerSavingStatusTask;
.super Landroid/os/AsyncTask;
.source "PowerUsageSummary.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/fuelgauge/PowerUsageSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GetPowerSavingStatusTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field private static final EXEC_COMMAND_FAIL:I = 0x1

.field private static final EXEC_COMMAND_SUCCESS:I = 0x0

.field private static final POWER_SAVING_MODE_FILE:Ljava/lang/String; = "/etc/.tp/thermal.conf"


# instance fields
.field mResult:I

.field private mResultString:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/settings/fuelgauge/PowerUsageSummary;


# direct methods
.method private constructor <init>(Lcom/android/settings/fuelgauge/PowerUsageSummary;)V
    .locals 1
    .parameter

    .prologue
    .line 390
    iput-object p1, p0, Lcom/android/settings/fuelgauge/PowerUsageSummary$GetPowerSavingStatusTask;->this$0:Lcom/android/settings/fuelgauge/PowerUsageSummary;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 395
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/settings/fuelgauge/PowerUsageSummary$GetPowerSavingStatusTask;->mResult:I

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/Integer;
    .locals 8
    .parameter "arg"

    .prologue
    .line 400
    const-string v4, "PowerUsageSummary"

    const-string v5, "GetPowerSavingStatusTask doInBackground"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 401
    const/4 v0, 0x0

    .line 403
    .local v0, bufferedReader:Ljava/io/BufferedReader;
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v4

    const/4 v5, 0x0

    aget-object v5, p1, v5

    invoke-virtual {v4, v5}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v3

    .line 404
    .local v3, process:Ljava/lang/Process;
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-virtual {v3}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5

    .line 407
    .end local v0           #bufferedReader:Ljava/io/BufferedReader;
    .local v1, bufferedReader:Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {v3}, Ljava/lang/Process;->waitFor()I

    move-result v4

    if-eqz v4, :cond_1

    .line 408
    const-string v4, "PowerUsageSummary"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "exit value = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/Process;->exitValue()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 409
    const/4 v4, 0x1

    iput v4, p0, Lcom/android/settings/fuelgauge/PowerUsageSummary$GetPowerSavingStatusTask;->mResult:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 423
    :goto_0
    if-eqz v1, :cond_3

    .line 425
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    move-object v0, v1

    .line 432
    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .end local v3           #process:Ljava/lang/Process;
    .restart local v0       #bufferedReader:Ljava/io/BufferedReader;
    :cond_0
    :goto_1
    const-string v4, "PowerUsageSummary"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "result is "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/settings/fuelgauge/PowerUsageSummary$GetPowerSavingStatusTask;->mResultString:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 433
    iget v4, p0, Lcom/android/settings/fuelgauge/PowerUsageSummary$GetPowerSavingStatusTask;->mResult:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    return-object v4

    .line 411
    .end local v0           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v1       #bufferedReader:Ljava/io/BufferedReader;
    .restart local v3       #process:Ljava/lang/Process;
    :cond_1
    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/android/settings/fuelgauge/PowerUsageSummary$GetPowerSavingStatusTask;->mResultString:Ljava/lang/String;

    .line 412
    const/4 v4, 0x0

    iput v4, p0, Lcom/android/settings/fuelgauge/PowerUsageSummary$GetPowerSavingStatusTask;->mResult:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 414
    :catch_0
    move-exception v2

    .line 415
    .local v2, e:Ljava/lang/InterruptedException;
    :try_start_4
    const-string v4, "PowerUsageSummary"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "exe shell command InterruptedException: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 417
    const/4 v4, 0x1

    iput v4, p0, Lcom/android/settings/fuelgauge/PowerUsageSummary$GetPowerSavingStatusTask;->mResult:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    .line 419
    .end local v2           #e:Ljava/lang/InterruptedException;
    :catch_1
    move-exception v2

    move-object v0, v1

    .line 420
    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .end local v3           #process:Ljava/lang/Process;
    .restart local v0       #bufferedReader:Ljava/io/BufferedReader;
    .local v2, e:Ljava/io/IOException;
    :goto_2
    :try_start_5
    const-string v4, "PowerUsageSummary"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "exe shell command IOException: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 421
    const/4 v4, 0x1

    iput v4, p0, Lcom/android/settings/fuelgauge/PowerUsageSummary$GetPowerSavingStatusTask;->mResult:I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 423
    if-eqz v0, :cond_0

    .line 425
    :try_start_6
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_1

    .line 426
    :catch_2
    move-exception v2

    .line 427
    const-string v4, "PowerUsageSummary"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "close reader in finally block exception: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 426
    .end local v0           #bufferedReader:Ljava/io/BufferedReader;
    .end local v2           #e:Ljava/io/IOException;
    .restart local v1       #bufferedReader:Ljava/io/BufferedReader;
    .restart local v3       #process:Ljava/lang/Process;
    :catch_3
    move-exception v2

    .line 427
    .restart local v2       #e:Ljava/io/IOException;
    const-string v4, "PowerUsageSummary"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "close reader in finally block exception: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v1

    .line 429
    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v0       #bufferedReader:Ljava/io/BufferedReader;
    goto/16 :goto_1

    .line 423
    .end local v2           #e:Ljava/io/IOException;
    .end local v3           #process:Ljava/lang/Process;
    :catchall_0
    move-exception v4

    :goto_3
    if-eqz v0, :cond_2

    .line 425
    :try_start_7
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    .line 429
    :cond_2
    :goto_4
    throw v4

    .line 426
    :catch_4
    move-exception v2

    .line 427
    .restart local v2       #e:Ljava/io/IOException;
    const-string v5, "PowerUsageSummary"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "close reader in finally block exception: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    .line 423
    .end local v0           #bufferedReader:Ljava/io/BufferedReader;
    .end local v2           #e:Ljava/io/IOException;
    .restart local v1       #bufferedReader:Ljava/io/BufferedReader;
    .restart local v3       #process:Ljava/lang/Process;
    :catchall_1
    move-exception v4

    move-object v0, v1

    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v0       #bufferedReader:Ljava/io/BufferedReader;
    goto :goto_3

    .line 419
    .end local v3           #process:Ljava/lang/Process;
    :catch_5
    move-exception v2

    goto/16 :goto_2

    .end local v0           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v1       #bufferedReader:Ljava/io/BufferedReader;
    .restart local v3       #process:Ljava/lang/Process;
    :cond_3
    move-object v0, v1

    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v0       #bufferedReader:Ljava/io/BufferedReader;
    goto/16 :goto_1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 390
    check-cast p1, [Ljava/lang/String;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/settings/fuelgauge/PowerUsageSummary$GetPowerSavingStatusTask;->doInBackground([Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Integer;)V
    .locals 2
    .parameter "result"

    .prologue
    .line 438
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_0

    .line 439
    const-string v0, "/etc/.tp/thermal.conf"

    iget-object v1, p0, Lcom/android/settings/fuelgauge/PowerUsageSummary$GetPowerSavingStatusTask;->mResultString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 440
    iget-object v0, p0, Lcom/android/settings/fuelgauge/PowerUsageSummary$GetPowerSavingStatusTask;->this$0:Lcom/android/settings/fuelgauge/PowerUsageSummary;

    iget-object v0, v0, Lcom/android/settings/fuelgauge/PowerUsageSummary;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 445
    :cond_0
    :goto_0
    return-void

    .line 442
    :cond_1
    iget-object v0, p0, Lcom/android/settings/fuelgauge/PowerUsageSummary$GetPowerSavingStatusTask;->this$0:Lcom/android/settings/fuelgauge/PowerUsageSummary;

    iget-object v0, v0, Lcom/android/settings/fuelgauge/PowerUsageSummary;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 390
    check-cast p1, Ljava/lang/Integer;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/settings/fuelgauge/PowerUsageSummary$GetPowerSavingStatusTask;->onPostExecute(Ljava/lang/Integer;)V

    return-void
.end method
