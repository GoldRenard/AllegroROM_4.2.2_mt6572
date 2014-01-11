.class Lcom/android/phone/ContactsAsyncHelper$WorkerHandler;
.super Landroid/os/Handler;
.source "ContactsAsyncHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/ContactsAsyncHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WorkerHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/phone/ContactsAsyncHelper;


# direct methods
.method public constructor <init>(Lcom/android/phone/ContactsAsyncHelper;Landroid/os/Looper;)V
    .locals 0
    .parameter
    .parameter "looper"

    .prologue
    .line 206
    iput-object p1, p0, Lcom/android/phone/ContactsAsyncHelper$WorkerHandler;->this$0:Lcom/android/phone/ContactsAsyncHelper;

    .line 207
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 208
    return-void
.end method

.method private getPhotoIconWhenAppropriate(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;
    .locals 11
    .parameter "context"
    .parameter "photo"

    .prologue
    const/4 v8, 0x0

    .line 257
    instance-of v9, p2, Landroid/graphics/drawable/BitmapDrawable;

    if-nez v9, :cond_1

    move-object v4, v8

    .line 282
    .end local p2
    :cond_0
    :goto_0
    return-object v4

    .line 260
    .restart local p2
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f0c001a

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 262
    .local v0, iconSize:I
    check-cast p2, Landroid/graphics/drawable/BitmapDrawable;

    .end local p2
    invoke-virtual {p2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v4

    .line 263
    .local v4, orgBitmap:Landroid/graphics/Bitmap;
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    .line 264
    .local v6, orgWidth:I
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    .line 265
    .local v5, orgHeight:I
    if-le v6, v5, :cond_3

    move v1, v6

    .line 267
    .local v1, longerEdge:I
    :goto_1
    if-le v1, v0, :cond_0

    .line 268
    int-to-float v9, v1

    int-to-float v10, v0

    div-float v7, v9, v10

    .line 269
    .local v7, ratio:F
    int-to-float v9, v6

    div-float/2addr v9, v7

    float-to-int v3, v9

    .line 270
    .local v3, newWidth:I
    int-to-float v9, v5

    div-float/2addr v9, v7

    float-to-int v2, v9

    .line 273
    .local v2, newHeight:I
    if-lez v3, :cond_2

    if-gtz v2, :cond_4

    .line 274
    :cond_2
    const-string v9, "ContactsAsyncHelper"

    const-string v10, "Photo icon\'s width or height become 0."

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v4, v8

    .line 275
    goto :goto_0

    .end local v1           #longerEdge:I
    .end local v2           #newHeight:I
    .end local v3           #newWidth:I
    .end local v7           #ratio:F
    :cond_3
    move v1, v5

    .line 265
    goto :goto_1

    .line 280
    .restart local v1       #longerEdge:I
    .restart local v2       #newHeight:I
    .restart local v3       #newWidth:I
    .restart local v7       #ratio:F
    :cond_4
    const/4 v8, 0x1

    invoke-static {v4, v3, v2, v8}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v4

    goto :goto_0
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 8
    .parameter "msg"

    .prologue
    const/4 v7, 0x0

    .line 212
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;

    .line 214
    .local v0, args:Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;
    iget v4, p1, Landroid/os/Message;->arg1:I

    packed-switch v4, :pswitch_data_0

    .line 245
    :goto_0
    iget-object v4, p0, Lcom/android/phone/ContactsAsyncHelper$WorkerHandler;->this$0:Lcom/android/phone/ContactsAsyncHelper;

    #getter for: Lcom/android/phone/ContactsAsyncHelper;->mResultHandler:Landroid/os/Handler;
    invoke-static {v4}, Lcom/android/phone/ContactsAsyncHelper;->access$000(Lcom/android/phone/ContactsAsyncHelper;)Landroid/os/Handler;

    move-result-object v4

    iget v5, p1, Landroid/os/Message;->what:I

    invoke-virtual {v4, v5}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v3

    .line 246
    .local v3, reply:Landroid/os/Message;
    iget v4, p1, Landroid/os/Message;->arg1:I

    iput v4, v3, Landroid/os/Message;->arg1:I

    .line 247
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput-object v4, v3, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 248
    invoke-virtual {v3}, Landroid/os/Message;->sendToTarget()V

    .line 249
    return-void

    .line 216
    .end local v3           #reply:Landroid/os/Message;
    :pswitch_0
    const/4 v2, 0x0

    .line 218
    .local v2, inputStream:Ljava/io/InputStream;
    :try_start_0
    iget-object v4, v0, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    iget-object v5, v0, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->uri:Landroid/net/Uri;

    const/4 v6, 0x1

    invoke-static {v4, v5, v6}, Landroid/provider/ContactsContract$Contacts;->openContactPhotoInputStream(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 224
    :goto_1
    if-eqz v2, :cond_0

    .line 225
    iget-object v4, v0, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->uri:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iput-object v4, v0, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->photo:Landroid/graphics/drawable/Drawable;

    .line 229
    iget-object v4, v0, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->context:Landroid/content/Context;

    iget-object v5, v0, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->photo:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v4, v5}, Lcom/android/phone/ContactsAsyncHelper$WorkerHandler;->getPhotoIconWhenAppropriate(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object v4

    iput-object v4, v0, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->photoIcon:Landroid/graphics/Bitmap;

    goto :goto_0

    .line 220
    :catch_0
    move-exception v1

    .line 221
    .local v1, e:Ljava/lang/Exception;
    const-string v4, "ContactsAsyncHelper"

    const-string v5, "Error opening photo input stream"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 234
    .end local v1           #e:Ljava/lang/Exception;
    :cond_0
    iput-object v7, v0, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->photo:Landroid/graphics/drawable/Drawable;

    .line 235
    iput-object v7, v0, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->photoIcon:Landroid/graphics/Bitmap;

    goto :goto_0

    .line 214
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
