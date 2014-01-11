.class Lcom/mediatek/settings/RecoverChannelSettings;
.super Landroid/os/Handler;
.source "CellBroadcastCheckBox.java"


# static fields
.field private static final CHANNEL_URI:Landroid/net/Uri; = null

.field private static final CHANNEL_URI1:Landroid/net/Uri; = null

.field private static final CHANNEL_URI2:Landroid/net/Uri; = null

.field private static final CHANNEL_URI3:Landroid/net/Uri; = null

.field private static final ENABLE:Ljava/lang/String; = "enable"

.field private static final KEYID:Ljava/lang/String; = "_id"

.field private static final LOG_TAG:Ljava/lang/String; = "RecoverChannelSettings"

.field private static final MESSAGE_SET_CONFIG:I = 0x65

.field private static final NAME:Ljava/lang/String; = "name"

.field private static final NUMBER:Ljava/lang/String; = "number"


# instance fields
.field private mChannelArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mediatek/settings/CellBroadcastChannel;",
            ">;"
        }
    .end annotation
.end field

.field mPhone:Lcom/android/internal/telephony/Phone;

.field private mResolver:Landroid/content/ContentResolver;

.field private mSimId:I

.field private mUri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 271
    const-string v0, "content://cb/channel"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mediatek/settings/RecoverChannelSettings;->CHANNEL_URI:Landroid/net/Uri;

    .line 272
    const-string v0, "content://cb/channel1"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mediatek/settings/RecoverChannelSettings;->CHANNEL_URI1:Landroid/net/Uri;

    .line 274
    const-string v0, "content://cb/channel2"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mediatek/settings/RecoverChannelSettings;->CHANNEL_URI2:Landroid/net/Uri;

    .line 275
    const-string v0, "content://cb/channel3"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mediatek/settings/RecoverChannelSettings;->CHANNEL_URI3:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>(ILandroid/content/ContentResolver;)V
    .locals 3
    .parameter "simId"
    .parameter "resolver"

    .prologue
    const/4 v1, 0x0

    .line 282
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 277
    sget-object v0, Lcom/mediatek/settings/RecoverChannelSettings;->CHANNEL_URI:Landroid/net/Uri;

    iput-object v0, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mUri:Landroid/net/Uri;

    .line 279
    iput-object v1, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 280
    iput-object v1, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mResolver:Landroid/content/ContentResolver;

    .line 308
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mChannelArray:Ljava/util/ArrayList;

    .line 283
    iput p1, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mSimId:I

    .line 284
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 285
    iput-object p2, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mResolver:Landroid/content/ContentResolver;

    .line 287
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 288
    iget v0, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mSimId:I

    packed-switch v0, :pswitch_data_0

    .line 302
    const-string v0, "RecoverChannelSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error with simid = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mSimId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    :cond_0
    :goto_0
    return-void

    .line 290
    :pswitch_0
    sget-object v0, Lcom/mediatek/settings/RecoverChannelSettings;->CHANNEL_URI:Landroid/net/Uri;

    iput-object v0, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mUri:Landroid/net/Uri;

    goto :goto_0

    .line 293
    :pswitch_1
    sget-object v0, Lcom/mediatek/settings/RecoverChannelSettings;->CHANNEL_URI1:Landroid/net/Uri;

    iput-object v0, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mUri:Landroid/net/Uri;

    goto :goto_0

    .line 296
    :pswitch_2
    sget-object v0, Lcom/mediatek/settings/RecoverChannelSettings;->CHANNEL_URI2:Landroid/net/Uri;

    iput-object v0, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mUri:Landroid/net/Uri;

    goto :goto_0

    .line 299
    :pswitch_3
    sget-object v0, Lcom/mediatek/settings/RecoverChannelSettings;->CHANNEL_URI3:Landroid/net/Uri;

    iput-object v0, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mUri:Landroid/net/Uri;

    goto :goto_0

    .line 288
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private handleSetCellBroadcastConfigResponse(Landroid/os/Message;)V
    .locals 9
    .parameter "msg"

    .prologue
    .line 417
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 418
    .local v0, ar:Landroid/os/AsyncResult;
    if-nez v0, :cond_0

    .line 419
    const-string v6, "RecoverChannelSettings"

    const-string v7, "handleSetCellBroadcastConfigResponse,ar is null"

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 421
    :cond_0
    iget-object v6, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v6, :cond_3

    .line 422
    const/4 v5, -0x1

    .line 423
    .local v5, location:I
    iget-object v6, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 427
    .local v4, length:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v4, :cond_1

    .line 428
    iget-object v6, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mediatek/settings/CellBroadcastChannel;

    invoke-virtual {v6}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelId()I

    move-result v1

    .line 429
    .local v1, channelId:I
    iget v6, p1, Landroid/os/Message;->arg2:I

    if-ne v1, v6, :cond_2

    .line 430
    move v5, v3

    .line 434
    .end local v1           #channelId:I
    :cond_1
    const-string v6, "RecoverChannelSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "handleSetCellBroadcastConfigResponse: ar.exception = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 435
    move v3, v5

    :goto_1
    if-ltz v3, :cond_3

    .line 436
    iget-object v6, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mediatek/settings/CellBroadcastChannel;

    invoke-virtual {v6}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelState()Z

    move-result v2

    .line 438
    .local v2, channelState:Z
    if-eqz v2, :cond_3

    .line 439
    invoke-direct {p0, v3}, Lcom/mediatek/settings/RecoverChannelSettings;->updateChannelToDatabase(I)Z

    .line 435
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 427
    .end local v2           #channelState:Z
    .restart local v1       #channelId:I
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 445
    .end local v1           #channelId:I
    .end local v3           #i:I
    .end local v4           #length:I
    .end local v5           #location:I
    :cond_3
    return-void
.end method

.method private setCellBroadcastConfig([Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;I)V
    .locals 4
    .parameter "objectList"
    .parameter "index"

    .prologue
    .line 390
    const/16 v1, 0x65

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0, v1, v2, p2, v3}, Lcom/mediatek/settings/RecoverChannelSettings;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 391
    .local v0, msg:Landroid/os/Message;
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 392
    iget-object v1, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v2, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mSimId:I

    invoke-virtual {v1, p1, p1, v0, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setCellBroadcastSmsConfigGemini([Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;Landroid/os/Message;I)V

    .line 396
    :goto_0
    return-void

    .line 394
    :cond_0
    iget-object v1, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1, p1, p1, v0}, Lcom/android/internal/telephony/Phone;->setCellBroadcastSmsConfig([Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;Landroid/os/Message;)V

    goto :goto_0
.end method

.method private updateChannelToDatabase(I)Z
    .locals 12
    .parameter "index"

    .prologue
    const/4 v8, 0x0

    .line 311
    iget-object v9, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v9, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/settings/CellBroadcastChannel;

    .line 312
    .local v0, channel:Lcom/mediatek/settings/CellBroadcastChannel;
    invoke-virtual {v0}, Lcom/mediatek/settings/CellBroadcastChannel;->getKeyId()I

    move-result v2

    .line 313
    .local v2, id:I
    invoke-virtual {v0}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelName()Ljava/lang/String;

    move-result-object v3

    .line 314
    .local v3, name:Ljava/lang/String;
    const/4 v1, 0x0

    .line 315
    .local v1, enable:Z
    invoke-virtual {v0}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelId()I

    move-result v4

    .line 316
    .local v4, number:I
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 317
    .local v6, values:Landroid/content/ContentValues;
    const-string v9, "_id"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v6, v9, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 318
    const-string v9, "name"

    invoke-virtual {v6, v9, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    const-string v9, "number"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v6, v9, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 320
    const-string v9, "enable"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v6, v9, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 321
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "_id="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v0}, Lcom/mediatek/settings/CellBroadcastChannel;->getKeyId()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 322
    .local v7, where:Ljava/lang/String;
    iget-object v9, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mResolver:Landroid/content/ContentResolver;

    iget-object v10, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mUri:Landroid/net/Uri;

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v6, v7, v11}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v5

    .line 323
    .local v5, rows:I
    if-lez v5, :cond_0

    const/4 v8, 0x1

    :cond_0
    return v8
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 399
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 406
    :goto_0
    return-void

    .line 401
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/mediatek/settings/RecoverChannelSettings;->handleSetCellBroadcastConfigResponse(Landroid/os/Message;)V

    goto :goto_0

    .line 399
    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_0
    .end packed-switch
.end method

.method queryChannelFromDatabase()Z
    .locals 10

    .prologue
    const/4 v3, 0x3

    const/4 v1, 0x2

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 327
    const/4 v0, 0x4

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v9

    const-string v0, "name"

    aput-object v0, v2, v8

    const-string v0, "number"

    aput-object v0, v2, v1

    const-string v0, "enable"

    aput-object v0, v2, v3

    .line 328
    .local v2, projection:[Ljava/lang/String;
    const/4 v7, 0x0

    .line 330
    .local v7, cursor:Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mUri:Landroid/net/Uri;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 331
    if-eqz v7, :cond_2

    .line 332
    :goto_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 333
    new-instance v6, Lcom/mediatek/settings/CellBroadcastChannel;

    invoke-direct {v6}, Lcom/mediatek/settings/CellBroadcastChannel;-><init>()V

    .line 334
    .local v6, channel:Lcom/mediatek/settings/CellBroadcastChannel;
    const/4 v0, 0x2

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {v6, v0}, Lcom/mediatek/settings/CellBroadcastChannel;->setChannelId(I)V

    .line 335
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {v6, v0}, Lcom/mediatek/settings/CellBroadcastChannel;->setKeyId(I)V

    .line 336
    const/4 v0, 0x1

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Lcom/mediatek/settings/CellBroadcastChannel;->setChannelName(Ljava/lang/String;)V

    .line 337
    const/4 v0, 0x3

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-ne v0, v8, :cond_1

    move v0, v8

    :goto_1
    invoke-virtual {v6, v0}, Lcom/mediatek/settings/CellBroadcastChannel;->setChannelState(Z)V

    .line 338
    iget-object v0, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 342
    .end local v6           #channel:Lcom/mediatek/settings/CellBroadcastChannel;
    :catchall_0
    move-exception v0

    if-eqz v7, :cond_0

    .line 343
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_0
    throw v0

    .restart local v6       #channel:Lcom/mediatek/settings/CellBroadcastChannel;
    :cond_1
    move v0, v9

    .line 337
    goto :goto_1

    .line 342
    .end local v6           #channel:Lcom/mediatek/settings/CellBroadcastChannel;
    :cond_2
    if-eqz v7, :cond_3

    .line 343
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 346
    :cond_3
    return v8
.end method

.method public updateChannelStatus()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    const/4 v5, 0x1

    const/4 v3, -0x1

    .line 356
    invoke-virtual {p0}, Lcom/mediatek/settings/RecoverChannelSettings;->queryChannelFromDatabase()Z

    move-result v2

    if-nez v2, :cond_1

    .line 357
    const-string v2, "RecoverChannelSettings"

    const-string v3, "queryChannelFromDatabase failure!"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    :cond_0
    :goto_0
    return-void

    .line 360
    :cond_1
    iget-object v2, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v9

    .line 361
    .local v9, length:I
    const-string v2, "RecoverChannelSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "updateChannelStatus length: "

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 362
    const/4 v0, 0x0

    .line 363
    .local v0, infoList:Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    const/4 v1, -0x1

    .line 365
    .local v1, channelId:I
    const/4 v7, 0x0

    .local v7, i:I
    :goto_1
    if-ge v7, v9, :cond_5

    .line 366
    iget-object v2, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/settings/CellBroadcastChannel;

    invoke-virtual {v2}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelId()I

    move-result v1

    .line 367
    iget-object v2, p0, Lcom/mediatek/settings/RecoverChannelSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/settings/CellBroadcastChannel;

    invoke-virtual {v2}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelState()Z

    move-result v6

    .line 368
    .local v6, channelState:Z
    if-eqz v6, :cond_2

    .line 369
    if-nez v0, :cond_3

    .line 370
    new-instance v0, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;

    .end local v0           #infoList:Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    move v2, v1

    move v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;-><init>(IIIIZ)V

    .line 365
    .restart local v0       #infoList:Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    :cond_2
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 371
    :cond_3
    invoke-virtual {v0}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;->getToServiceId()I

    move-result v2

    add-int/lit8 v4, v1, -0x1

    if-eq v2, v4, :cond_4

    .line 372
    new-array v8, v5, [Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;

    .line 373
    .local v8, info:[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    aput-object v0, v8, v11

    .line 374
    invoke-virtual {v0}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;->getToServiceId()I

    move-result v2

    invoke-direct {p0, v8, v2}, Lcom/mediatek/settings/RecoverChannelSettings;->setCellBroadcastConfig([Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;I)V

    .line 375
    new-instance v0, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;

    .end local v0           #infoList:Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    move v2, v1

    move v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;-><init>(IIIIZ)V

    .line 376
    .restart local v0       #infoList:Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    goto :goto_2

    .line 377
    .end local v8           #info:[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    :cond_4
    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;->setToServiceId(I)V

    goto :goto_2

    .line 381
    .end local v6           #channelState:Z
    :cond_5
    if-eqz v0, :cond_0

    .line 382
    const-string v2, "RecoverChannelSettings"

    const-string v3, "updateChannelStatus last times"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    new-array v8, v5, [Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;

    .line 384
    .restart local v8       #info:[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    aput-object v0, v8, v11

    .line 385
    invoke-virtual {v0}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;->getToServiceId()I

    move-result v2

    invoke-direct {p0, v8, v2}, Lcom/mediatek/settings/RecoverChannelSettings;->setCellBroadcastConfig([Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;I)V

    goto :goto_0
.end method
