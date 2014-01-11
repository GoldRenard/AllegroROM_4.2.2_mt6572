.class public Lcom/android/phone/DeleteFdnContactScreen;
.super Landroid/app/Activity;
.source "DeleteFdnContactScreen.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/phone/DeleteFdnContactScreen$DeleteFdnContactScreenBroadcastReceiver;,
        Lcom/android/phone/DeleteFdnContactScreen$QueryHandler;
    }
.end annotation


# static fields
.field private static final DBG:Z = true

.field private static final GET_PIN_RETRY_EMPTY:I = -0x1

.field private static final INTENT_EXTRA_INDEX:Ljava/lang/String; = "index"

.field private static final INTENT_EXTRA_NAME:Ljava/lang/String; = "name"

.field private static final INTENT_EXTRA_NUMBER:Ljava/lang/String; = "number"

.field private static final LOG_TAG:Ljava/lang/String; = "PhoneGlobals"

.field private static final PIN2_REQUEST_CODE:I = 0x64


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mIndex:Ljava/lang/String;

.field private mName:Ljava/lang/String;

.field private mNumber:Ljava/lang/String;

.field private mPin2:Ljava/lang/String;

.field protected mQueryHandler:Lcom/android/phone/DeleteFdnContactScreen$QueryHandler;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mSimId:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 85
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 95
    new-instance v0, Lcom/android/phone/DeleteFdnContactScreen$DeleteFdnContactScreenBroadcastReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/phone/DeleteFdnContactScreen$DeleteFdnContactScreenBroadcastReceiver;-><init>(Lcom/android/phone/DeleteFdnContactScreen;Lcom/android/phone/DeleteFdnContactScreen$1;)V

    iput-object v0, p0, Lcom/android/phone/DeleteFdnContactScreen;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 106
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/android/phone/DeleteFdnContactScreen;->mHandler:Landroid/os/Handler;

    .line 424
    return-void
.end method

.method static synthetic access$100(Lcom/android/phone/DeleteFdnContactScreen;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 85
    invoke-direct {p0, p1}, Lcom/android/phone/DeleteFdnContactScreen;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/phone/DeleteFdnContactScreen;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 85
    invoke-direct {p0, p1}, Lcom/android/phone/DeleteFdnContactScreen;->displayProgress(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/phone/DeleteFdnContactScreen;Lcom/android/phone/EditFdnContactScreen$Operate;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 85
    invoke-direct {p0, p1, p2}, Lcom/android/phone/DeleteFdnContactScreen;->handleResult(Lcom/android/phone/EditFdnContactScreen$Operate;I)V

    return-void
.end method

.method private authenticatePin2()V
    .locals 3

    .prologue
    .line 234
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 235
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "simId"

    iget v2, p0, Lcom/android/phone/DeleteFdnContactScreen;->mSimId:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 236
    const-class v1, Lcom/android/phone/GetPin2Screen;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 237
    const/16 v1, 0x64

    invoke-virtual {p0, v0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->startActivityForResult(Landroid/content/Intent;I)V

    .line 238
    return-void
.end method

.method private deleteContact()V
    .locals 7

    .prologue
    const/4 v2, 0x0

    .line 189
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 190
    .local v6, buf:Ljava/lang/StringBuilder;
    iget-object v0, p0, Lcom/android/phone/DeleteFdnContactScreen;->mName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 191
    const-string v0, "number=\'"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    :goto_0
    iget-object v0, p0, Lcom/android/phone/DeleteFdnContactScreen;->mNumber:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    const-string v0, "\' AND pin2=\'"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    iget-object v0, p0, Lcom/android/phone/DeleteFdnContactScreen;->mPin2:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    const-string v0, "\'"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    invoke-direct {p0}, Lcom/android/phone/DeleteFdnContactScreen;->getContentURI()Landroid/net/Uri;

    move-result-object v3

    .line 204
    .local v3, uri:Landroid/net/Uri;
    new-instance v0, Lcom/android/phone/DeleteFdnContactScreen$QueryHandler;

    invoke-virtual {p0}, Lcom/android/phone/DeleteFdnContactScreen;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/phone/DeleteFdnContactScreen$QueryHandler;-><init>(Lcom/android/phone/DeleteFdnContactScreen;Landroid/content/ContentResolver;)V

    iput-object v0, p0, Lcom/android/phone/DeleteFdnContactScreen;->mQueryHandler:Lcom/android/phone/DeleteFdnContactScreen$QueryHandler;

    .line 205
    iget-object v0, p0, Lcom/android/phone/DeleteFdnContactScreen;->mQueryHandler:Lcom/android/phone/DeleteFdnContactScreen$QueryHandler;

    const/4 v1, 0x0

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Lcom/android/phone/DeleteFdnContactScreen$QueryHandler;->startDelete(ILjava/lang/Object;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)V

    .line 206
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/phone/DeleteFdnContactScreen;->displayProgress(Z)V

    .line 207
    return-void

    .line 193
    .end local v3           #uri:Landroid/net/Uri;
    :cond_0
    const-string v0, "tag=\'"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    iget-object v0, p0, Lcom/android/phone/DeleteFdnContactScreen;->mName:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    const-string v0, "\' AND number=\'"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method private displayProgress(Z)V
    .locals 3
    .parameter "flag"

    .prologue
    .line 241
    invoke-virtual {p0}, Lcom/android/phone/DeleteFdnContactScreen;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, 0x5

    if-eqz p1, :cond_0

    const/4 v0, -0x1

    :goto_0
    invoke-virtual {v1, v2, v0}, Landroid/view/Window;->setFeatureInt(II)V

    .line 243
    return-void

    .line 241
    :cond_0
    const/4 v0, -0x2

    goto :goto_0
.end method

.method private finishThisActivity()V
    .locals 4

    .prologue
    .line 382
    iget-object v0, p0, Lcom/android/phone/DeleteFdnContactScreen;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/phone/DeleteFdnContactScreen$2;

    invoke-direct {v1, p0}, Lcom/android/phone/DeleteFdnContactScreen$2;-><init>(Lcom/android/phone/DeleteFdnContactScreen;)V

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 387
    return-void
.end method

.method private getContentURI()Landroid/net/Uri;
    .locals 3

    .prologue
    .line 210
    const-string v0, "content://icc/fdn"

    .line 211
    .local v0, fdnUri:Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 212
    iget v1, p0, Lcom/android/phone/DeleteFdnContactScreen;->mSimId:I

    packed-switch v1, :pswitch_data_0

    .line 226
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error as mSimId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/phone/DeleteFdnContactScreen;->mSimId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->log(Ljava/lang/String;)V

    .line 230
    :cond_0
    :goto_0
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    return-object v1

    .line 214
    :pswitch_0
    const-string v0, "content://icc/fdn1"

    .line 215
    goto :goto_0

    .line 217
    :pswitch_1
    const-string v0, "content://icc/fdn2"

    .line 218
    goto :goto_0

    .line 220
    :pswitch_2
    const-string v0, "content://icc/fdn3"

    .line 221
    goto :goto_0

    .line 223
    :pswitch_3
    const-string v0, "content://icc/fdn4"

    .line 224
    goto :goto_0

    .line 212
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private getPin2RetryNumber()I
    .locals 4

    .prologue
    const/4 v3, -0x1

    .line 254
    const-string v0, "gsm.sim.retry.pin2"

    .line 255
    .local v0, pinStr:Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 256
    iget v1, p0, Lcom/android/phone/DeleteFdnContactScreen;->mSimId:I

    packed-switch v1, :pswitch_data_0

    .line 270
    const-string v1, "error without correct "

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->log(Ljava/lang/String;)V

    .line 275
    :cond_0
    :goto_0
    iget v1, p0, Lcom/android/phone/DeleteFdnContactScreen;->mSimId:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 276
    const-string v1, "gsm.sim.retry.pin2.2"

    invoke-static {v1, v3}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 278
    :goto_1
    return v1

    .line 258
    :pswitch_0
    const-string v0, "gsm.sim.retry.pin2"

    .line 259
    goto :goto_0

    .line 261
    :pswitch_1
    const-string v0, "gsm.sim.retry.pin2.2"

    .line 262
    goto :goto_0

    .line 264
    :pswitch_2
    const-string v0, "gsm.sim.retry.pin2.3"

    .line 265
    goto :goto_0

    .line 267
    :pswitch_3
    const-string v0, "gsm.sim.retry.pin2.4"

    .line 268
    goto :goto_0

    .line 278
    :cond_1
    const-string v1, "gsm.sim.retry.pin2"

    invoke-static {v1, v3}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    goto :goto_1

    .line 256
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private getRetryPin2()Ljava/lang/String;
    .locals 5

    .prologue
    .line 283
    invoke-direct {p0}, Lcom/android/phone/DeleteFdnContactScreen;->getPin2RetryNumber()I

    move-result v0

    .line 284
    .local v0, retryCount:I
    packed-switch v0, :pswitch_data_0

    .line 290
    :pswitch_0
    const v1, 0x7f0d0142

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/android/phone/DeleteFdnContactScreen;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    .line 286
    :pswitch_1
    const-string v1, " "

    goto :goto_0

    .line 288
    :pswitch_2
    const v1, 0x7f0d0141

    invoke-virtual {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 284
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private handlePin2Error()V
    .locals 5

    .prologue
    .line 360
    invoke-direct {p0}, Lcom/android/phone/DeleteFdnContactScreen;->getPin2RetryNumber()I

    move-result v1

    .line 362
    .local v1, retryNumber:I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handleResult: retryNumber="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/DeleteFdnContactScreen;->log(Ljava/lang/String;)V

    .line 364
    if-nez v1, :cond_0

    .line 366
    const-string v2, "handleResult: pin2 retry= 0 ,pin2 is locked!"

    invoke-direct {p0, v2}, Lcom/android/phone/DeleteFdnContactScreen;->log(Ljava/lang/String;)V

    .line 368
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f0d0192

    new-instance v4, Lcom/android/phone/DeleteFdnContactScreen$1;

    invoke-direct {v4, p0}, Lcom/android/phone/DeleteFdnContactScreen$1;-><init>(Lcom/android/phone/DeleteFdnContactScreen;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f0d02b4

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 374
    .local v0, a:Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/view/Window;->addFlags(I)V

    .line 375
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 379
    .end local v0           #a:Landroid/app/AlertDialog;
    :goto_0
    return-void

    .line 377
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const v3, 0x7f0d00e4

    invoke-virtual {p0, v3}, Lcom/android/phone/DeleteFdnContactScreen;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Lcom/android/phone/DeleteFdnContactScreen;->getRetryPin2()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/DeleteFdnContactScreen;->showStatus(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private handleResult(Lcom/android/phone/EditFdnContactScreen$Operate;I)V
    .locals 3
    .parameter "op"
    .parameter "errorCode"

    .prologue
    .line 304
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "handleResult: [errorcode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->log(Ljava/lang/String;)V

    .line 306
    packed-switch p2, :pswitch_data_0

    .line 345
    const-string v1, "handleResult: Error,system return unknown error code!"

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->log(Ljava/lang/String;)V

    .line 350
    :goto_0
    const/4 v1, 0x1

    if-lt p2, v1, :cond_0

    .line 351
    invoke-virtual {p0}, Lcom/android/phone/DeleteFdnContactScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d028f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->showStatus(Ljava/lang/CharSequence;)V

    .line 353
    :cond_0
    invoke-direct {p0}, Lcom/android/phone/DeleteFdnContactScreen;->getPin2RetryNumber()I

    move-result v0

    .line 354
    .local v0, retryNumber:I
    if-eqz v0, :cond_1

    .line 355
    invoke-direct {p0}, Lcom/android/phone/DeleteFdnContactScreen;->finishThisActivity()V

    .line 357
    :cond_1
    return-void

    .line 309
    .end local v0           #retryNumber:I
    :pswitch_0
    const-string v1, "handleResult: Error,unknown error code!"

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->log(Ljava/lang/String;)V

    .line 311
    const v1, 0x7f0d00df

    invoke-virtual {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->showStatus(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 315
    :pswitch_1
    const-string v1, "handleResult: Error,Contact number\'s length is too long !"

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->log(Ljava/lang/String;)V

    .line 317
    const v1, 0x7f0d00e0

    invoke-virtual {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->showStatus(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 321
    :pswitch_2
    const-string v1, "handleResult: Error,Contact name\'s length is too long !"

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->log(Ljava/lang/String;)V

    .line 323
    const v1, 0x7f0d00e1

    invoke-virtual {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->showStatus(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 327
    :pswitch_3
    const-string v1, "handleResult: Error,storage is full !"

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->log(Ljava/lang/String;)V

    .line 329
    const v1, 0x7f0d00e2

    invoke-virtual {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->showStatus(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 333
    :pswitch_4
    const-string v1, "handleResult: Error,Phone book is not ready !"

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->log(Ljava/lang/String;)V

    .line 335
    const v1, 0x7f0d00e3

    invoke-virtual {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->showStatus(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 339
    :pswitch_5
    const-string v1, "handleResult: Error,invalid pin2 !"

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->log(Ljava/lang/String;)V

    .line 341
    invoke-direct {p0}, Lcom/android/phone/DeleteFdnContactScreen;->handlePin2Error()V

    goto :goto_0

    .line 306
    :pswitch_data_0
    .packed-switch -0x5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 415
    const-string v0, "PhoneGlobals"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[DeleteFdnContact] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 416
    return-void
.end method

.method private resolveIntent()V
    .locals 3

    .prologue
    .line 180
    invoke-virtual {p0}, Lcom/android/phone/DeleteFdnContactScreen;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 182
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "index"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/phone/DeleteFdnContactScreen;->mIndex:Ljava/lang/String;

    .line 183
    const-string v1, "name"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/phone/DeleteFdnContactScreen;->mName:Ljava/lang/String;

    .line 184
    const-string v1, "number"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/phone/DeleteFdnContactScreen;->mNumber:Ljava/lang/String;

    .line 185
    const-string v1, "simId"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/phone/DeleteFdnContactScreen;->mSimId:I

    .line 186
    return-void
.end method

.method private showStatus(Ljava/lang/CharSequence;)V
    .locals 1
    .parameter "statusMsg"

    .prologue
    .line 248
    if-eqz p1, :cond_0

    .line 249
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 251
    :cond_0
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "intent"

    .prologue
    .line 154
    const-string v1, "onActivityResult"

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->log(Ljava/lang/String;)V

    .line 157
    packed-switch p1, :pswitch_data_0

    .line 177
    :goto_0
    return-void

    .line 159
    :pswitch_0
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 160
    .local v0, extras:Landroid/os/Bundle;
    :goto_1
    if-eqz v0, :cond_1

    .line 161
    const-string v1, "pin2"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/phone/DeleteFdnContactScreen;->mPin2:Ljava/lang/String;

    .line 162
    invoke-virtual {p0}, Lcom/android/phone/DeleteFdnContactScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d028e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->showStatus(Ljava/lang/CharSequence;)V

    .line 164
    invoke-direct {p0}, Lcom/android/phone/DeleteFdnContactScreen;->deleteContact()V

    goto :goto_0

    .line 159
    .end local v0           #extras:Landroid/os/Bundle;
    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    .line 168
    .restart local v0       #extras:Landroid/os/Bundle;
    :cond_1
    const-string v1, "onActivityResult: CANCELLED"

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->log(Ljava/lang/String;)V

    .line 170
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/android/phone/DeleteFdnContactScreen;->displayProgress(Z)V

    .line 171
    invoke-virtual {p0}, Lcom/android/phone/DeleteFdnContactScreen;->finish()V

    goto :goto_0

    .line 157
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_0
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "icicle"

    .prologue
    .line 110
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 112
    invoke-direct {p0}, Lcom/android/phone/DeleteFdnContactScreen;->resolveIntent()V

    .line 114
    invoke-direct {p0}, Lcom/android/phone/DeleteFdnContactScreen;->authenticatePin2()V

    .line 116
    invoke-virtual {p0}, Lcom/android/phone/DeleteFdnContactScreen;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Landroid/view/Window;->requestFeature(I)Z

    .line 117
    const v2, 0x7f04000e

    invoke-virtual {p0, v2}, Lcom/android/phone/DeleteFdnContactScreen;->setContentView(I)V

    .line 118
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 120
    .local v1, intentFilter:Landroid/content/IntentFilter;
    iget-object v2, p0, Lcom/android/phone/DeleteFdnContactScreen;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2, v1}, Lcom/android/phone/DeleteFdnContactScreen;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 121
    invoke-virtual {p0}, Lcom/android/phone/DeleteFdnContactScreen;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 122
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_0

    .line 124
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 126
    :cond_0
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 420
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 421
    iget-object v0, p0, Lcom/android/phone/DeleteFdnContactScreen;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/android/phone/DeleteFdnContactScreen;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 422
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 139
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 140
    .local v0, itemId:I
    packed-switch v0, :pswitch_data_0

    .line 147
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 142
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/phone/DeleteFdnContactScreen;->finish()V

    .line 143
    const/4 v1, 0x1

    goto :goto_0

    .line 140
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 130
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 131
    invoke-direct {p0}, Lcom/android/phone/DeleteFdnContactScreen;->getPin2RetryNumber()I

    move-result v0

    .line 132
    .local v0, retryNumber:I
    if-nez v0, :cond_0

    .line 133
    invoke-virtual {p0}, Lcom/android/phone/DeleteFdnContactScreen;->finish()V

    .line 135
    :cond_0
    return-void
.end method
