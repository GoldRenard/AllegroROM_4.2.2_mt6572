.class public Lcom/android/ex/carousel/CarouselViewHelper;
.super Ljava/lang/Object;
.source "CarouselViewHelper.java"

# interfaces
.implements Lcom/android/ex/carousel/CarouselRS$CarouselCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/ex/carousel/CarouselViewHelper$SyncHandler;,
        Lcom/android/ex/carousel/CarouselViewHelper$AsyncHandler;,
        Lcom/android/ex/carousel/CarouselViewHelper$DetailTextureParameters;,
        Lcom/android/ex/carousel/CarouselViewHelper$TextureParameters;
    }
.end annotation


# static fields
.field private static final REQUEST_DETAIL_TEXTURE_N:I = 0x1e8480

.field private static final REQUEST_END:I = 0x3d0900

.field private static final REQUEST_GEOMETRY_N:I = 0x2dc6c0

.field private static final REQUEST_TEXTURE_N:I = 0xf4240

.field private static final SET_DETAIL_TEXTURE_N:I = 0x2

.field private static final SET_GEOMETRY_N:I = 0x3

.field private static final SET_MATRIX_N:I = 0x4

.field private static final SET_TEXTURE_N:I = 0x1

.field private static final TAG:Ljava/lang/String; = "CarouselViewHelper"


# instance fields
.field private DBG:Z

.field private HOLDOFF_DELAY:J

.field private mAsyncHandler:Landroid/os/Handler;

.field private mCarouselView:Lcom/android/ex/carousel/CarouselView;

.field private mContext:Landroid/content/Context;

.field private mHandlerThread:Landroid/os/HandlerThread;

.field private mSyncHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .parameter "context"

    .prologue
    .line 82
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->DBG:Z

    .line 41
    const-wide/16 v0, 0x64

    iput-wide v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->HOLDOFF_DELAY:J

    .line 83
    iput-object p1, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mContext:Landroid/content/Context;

    .line 85
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "CarouselViewHelper.handler"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mHandlerThread:Landroid/os/HandlerThread;

    .line 86
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 88
    new-instance v0, Lcom/android/ex/carousel/CarouselViewHelper$AsyncHandler;

    iget-object v1, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/ex/carousel/CarouselViewHelper$AsyncHandler;-><init>(Lcom/android/ex/carousel/CarouselViewHelper;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mAsyncHandler:Landroid/os/Handler;

    .line 89
    new-instance v0, Lcom/android/ex/carousel/CarouselViewHelper$SyncHandler;

    invoke-direct {v0, p0}, Lcom/android/ex/carousel/CarouselViewHelper$SyncHandler;-><init>(Lcom/android/ex/carousel/CarouselViewHelper;)V

    iput-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mSyncHandler:Landroid/os/Handler;

    .line 90
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/ex/carousel/CarouselView;)V
    .registers 3
    .parameter "context"
    .parameter "carouselView"

    .prologue
    .line 78
    invoke-direct {p0, p1}, Lcom/android/ex/carousel/CarouselViewHelper;-><init>(Landroid/content/Context;)V

    .line 79
    invoke-virtual {p0, p2}, Lcom/android/ex/carousel/CarouselViewHelper;->setCarouselView(Lcom/android/ex/carousel/CarouselView;)V

    .line 80
    return-void
.end method

.method static synthetic access$000(Lcom/android/ex/carousel/CarouselViewHelper;)Lcom/android/ex/carousel/CarouselView;
    .registers 2
    .parameter "x0"

    .prologue
    .line 23
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mCarouselView:Lcom/android/ex/carousel/CarouselView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/ex/carousel/CarouselViewHelper;)Landroid/os/Handler;
    .registers 2
    .parameter "x0"

    .prologue
    .line 23
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mSyncHandler:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method protected getAsyncHandler()Landroid/os/Handler;
    .registers 2

    .prologue
    .line 299
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mAsyncHandler:Landroid/os/Handler;

    return-object v0
.end method

.method protected getCarouselView()Lcom/android/ex/carousel/CarouselView;
    .registers 2

    .prologue
    .line 303
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mCarouselView:Lcom/android/ex/carousel/CarouselView;

    return-object v0
.end method

.method public getDetailTexture(I)Landroid/graphics/Bitmap;
    .registers 3
    .parameter "id"

    .prologue
    .line 191
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDetailTextureParameters(I)Lcom/android/ex/carousel/CarouselViewHelper$DetailTextureParameters;
    .registers 3
    .parameter "id"

    .prologue
    .line 227
    const/4 v0, 0x0

    return-object v0
.end method

.method public getGeometry(I)Landroid/renderscript/Mesh;
    .registers 3
    .parameter "id"

    .prologue
    .line 203
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTexture(I)Landroid/graphics/Bitmap;
    .registers 3
    .parameter "id"

    .prologue
    .line 179
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTextureParameters(I)Lcom/android/ex/carousel/CarouselViewHelper$TextureParameters;
    .registers 3
    .parameter "id"

    .prologue
    .line 215
    const/4 v0, 0x0

    return-object v0
.end method

.method public onAnimationFinished(F)V
    .registers 2
    .parameter "carouselRotationAngle"

    .prologue
    .line 284
    return-void
.end method

.method public onAnimationStarted()V
    .registers 1

    .prologue
    .line 280
    return-void
.end method

.method public onCardLongPress(I[ILandroid/graphics/Rect;)V
    .registers 7
    .parameter "n"
    .parameter "touchPosition"
    .parameter "detailCoordinates"

    .prologue
    .line 274
    iget-boolean v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->DBG:Z

    if-eqz v0, :cond_36

    const-string v0, "CarouselViewHelper"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCardLongPress("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "), ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") )"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    :cond_36
    return-void
.end method

.method public onCardSelected(I)V
    .registers 5
    .parameter "n"

    .prologue
    .line 266
    iget-boolean v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->DBG:Z

    if-eqz v0, :cond_22

    const-string v0, "CarouselViewHelper"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCardSelected("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    :cond_22
    return-void
.end method

.method public onDestroy()V
    .registers 2

    .prologue
    .line 295
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 296
    return-void
.end method

.method public onDetailSelected(III)V
    .registers 7
    .parameter "n"
    .parameter "x"
    .parameter "y"

    .prologue
    .line 270
    iget-boolean v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->DBG:Z

    if-eqz v0, :cond_36

    const-string v0, "CarouselViewHelper"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDetailSelected("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    :cond_36
    return-void
.end method

.method public onInvalidateDetailTexture(I)V
    .registers 5
    .parameter "id"

    .prologue
    .line 261
    iget-boolean v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->DBG:Z

    if-eqz v0, :cond_22

    const-string v0, "CarouselViewHelper"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onInvalidateDetailTexture("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    :cond_22
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mAsyncHandler:Landroid/os/Handler;

    const v1, 0x1e8480

    add-int/2addr v1, p1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 263
    return-void
.end method

.method public onInvalidateGeometry(I)V
    .registers 5
    .parameter "id"

    .prologue
    .line 249
    iget-boolean v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->DBG:Z

    if-eqz v0, :cond_22

    const-string v0, "CarouselViewHelper"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onInvalidateGeometry("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    :cond_22
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mAsyncHandler:Landroid/os/Handler;

    const v1, 0x2dc6c0

    add-int/2addr v1, p1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 251
    return-void
.end method

.method public onInvalidateTexture(I)V
    .registers 5
    .parameter "id"

    .prologue
    .line 238
    iget-boolean v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->DBG:Z

    if-eqz v0, :cond_22

    const-string v0, "CarouselViewHelper"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onInvalidateTexture("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    :cond_22
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mAsyncHandler:Landroid/os/Handler;

    const v1, 0xf4240

    add-int/2addr v1, p1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 240
    return-void
.end method

.method public onPause()V
    .registers 2

    .prologue
    .line 291
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mCarouselView:Lcom/android/ex/carousel/CarouselView;

    invoke-virtual {v0}, Lcom/android/ex/carousel/CarouselView;->pause()V

    .line 292
    return-void
.end method

.method public onRequestDetailTexture(I)V
    .registers 7
    .parameter "id"

    .prologue
    const v4, 0x1e8480

    .line 254
    iget-boolean v1, p0, Lcom/android/ex/carousel/CarouselViewHelper;->DBG:Z

    if-eqz v1, :cond_25

    const-string v1, "CarouselViewHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onRequestDetailTexture("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    :cond_25
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mAsyncHandler:Landroid/os/Handler;

    add-int v2, v4, p1

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 256
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mAsyncHandler:Landroid/os/Handler;

    add-int v2, v4, p1

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    .line 257
    .local v0, message:Landroid/os/Message;
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mAsyncHandler:Landroid/os/Handler;

    iget-wide v2, p0, Lcom/android/ex/carousel/CarouselViewHelper;->HOLDOFF_DELAY:J

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 258
    return-void
.end method

.method public onRequestGeometry(I)V
    .registers 6
    .parameter "id"

    .prologue
    const v3, 0x2dc6c0

    .line 243
    iget-boolean v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->DBG:Z

    if-eqz v0, :cond_25

    const-string v0, "CarouselViewHelper"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onRequestGeometry("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    :cond_25
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mAsyncHandler:Landroid/os/Handler;

    add-int v1, v3, p1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 245
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mAsyncHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mAsyncHandler:Landroid/os/Handler;

    add-int v2, v3, p1

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 246
    return-void
.end method

.method public onRequestTexture(I)V
    .registers 7
    .parameter "id"

    .prologue
    const v4, 0xf4240

    .line 231
    iget-boolean v1, p0, Lcom/android/ex/carousel/CarouselViewHelper;->DBG:Z

    if-eqz v1, :cond_25

    const-string v1, "CarouselViewHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onRequestTexture("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    :cond_25
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mAsyncHandler:Landroid/os/Handler;

    add-int v2, v4, p1

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 233
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mAsyncHandler:Landroid/os/Handler;

    add-int v2, v4, p1

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    .line 234
    .local v0, message:Landroid/os/Message;
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mAsyncHandler:Landroid/os/Handler;

    iget-wide v2, p0, Lcom/android/ex/carousel/CarouselViewHelper;->HOLDOFF_DELAY:J

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 235
    return-void
.end method

.method public onResume()V
    .registers 2

    .prologue
    .line 287
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mCarouselView:Lcom/android/ex/carousel/CarouselView;

    invoke-virtual {v0}, Lcom/android/ex/carousel/CarouselView;->resume()V

    .line 288
    return-void
.end method

.method public setCarouselView(Lcom/android/ex/carousel/CarouselView;)V
    .registers 3
    .parameter "carouselView"

    .prologue
    .line 73
    iput-object p1, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mCarouselView:Lcom/android/ex/carousel/CarouselView;

    .line 74
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper;->mCarouselView:Lcom/android/ex/carousel/CarouselView;

    invoke-virtual {v0, p0}, Lcom/android/ex/carousel/CarouselView;->setCallback(Lcom/android/ex/carousel/CarouselRS$CarouselCallback;)V

    .line 75
    return-void
.end method
