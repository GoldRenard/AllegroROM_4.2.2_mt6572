.class Lcom/mediatek/phone/recording/PhoneRecorderHandler$5;
.super Landroid/content/BroadcastReceiver;
.source "PhoneRecorderHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/phone/recording/PhoneRecorderHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;


# direct methods
.method constructor <init>(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 330
    iput-object p1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$5;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v4, 0x1

    .line 332
    const-string v2, "android.intent.action.MEDIA_EJECT"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "android.intent.action.MEDIA_UNMOUNTED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 334
    :cond_0
    const-string v2, "storage_volume"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/os/storage/StorageVolume;

    .line 336
    .local v1, storageVolume:Landroid/os/storage/StorageVolume;
    if-nez v1, :cond_2

    .line 337
    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$5;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    const-string v3, "storageVolume is null"

    #calls: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$200(Lcom/mediatek/phone/recording/PhoneRecorderHandler;Ljava/lang/String;)V

    .line 358
    .end local v1           #storageVolume:Landroid/os/storage/StorageVolume;
    :cond_1
    :goto_0
    return-void

    .line 340
    .restart local v1       #storageVolume:Landroid/os/storage/StorageVolume;
    :cond_2
    invoke-virtual {v1}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 341
    .local v0, currentPath:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$5;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordStoragePath:Ljava/lang/String;
    invoke-static {v2}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$900(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$5;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordStoragePath:Ljava/lang/String;
    invoke-static {v2}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$900(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 342
    :cond_3
    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$5;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    const-string v3, "not current used storage unmount or eject"

    #calls: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$200(Lcom/mediatek/phone/recording/PhoneRecorderHandler;Ljava/lang/String;)V

    goto :goto_0

    .line 345
    :cond_4
    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$5;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorderState:I
    invoke-static {v2}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$600(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)I

    move-result v2

    if-ne v4, v2, :cond_1

    .line 346
    const/4 v2, 0x2

    iget-object v3, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$5;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordType:I
    invoke-static {v3}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$1000(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)I

    move-result v3

    if-ne v2, v3, :cond_5

    .line 347
    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$5;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    const-string v3, "Current used sd card is ejected, stop voice record"

    #calls: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$200(Lcom/mediatek/phone/recording/PhoneRecorderHandler;Ljava/lang/String;)V

    .line 348
    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$5;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    const/4 v3, 0x0

    #calls: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->stopVoiceRecord(Z)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$1100(Lcom/mediatek/phone/recording/PhoneRecorderHandler;Z)V

    goto :goto_0

    .line 349
    :cond_5
    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$5;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordType:I
    invoke-static {v2}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$1000(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)I

    move-result v2

    if-eq v4, v2, :cond_6

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$5;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordType:I
    invoke-static {v3}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$1000(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)I

    move-result v3

    if-ne v2, v3, :cond_1

    .line 351
    :cond_6
    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$5;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    const-string v3, "Current used sd card is ejected, stop video record"

    #calls: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$200(Lcom/mediatek/phone/recording/PhoneRecorderHandler;Ljava/lang/String;)V

    .line 352
    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$5;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    invoke-virtual {v2}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->stopVideoRecord()V

    goto :goto_0
.end method
