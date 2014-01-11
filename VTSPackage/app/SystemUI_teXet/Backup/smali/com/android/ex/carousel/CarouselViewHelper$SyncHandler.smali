.class Lcom/android/ex/carousel/CarouselViewHelper$SyncHandler;
.super Landroid/os/Handler;
.source "CarouselViewHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/ex/carousel/CarouselViewHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SyncHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/ex/carousel/CarouselViewHelper;


# direct methods
.method constructor <init>(Lcom/android/ex/carousel/CarouselViewHelper;)V
    .registers 2
    .parameter

    .prologue
    .line 136
    iput-object p1, p0, Lcom/android/ex/carousel/CarouselViewHelper$SyncHandler;->this$0:Lcom/android/ex/carousel/CarouselViewHelper;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 11
    .parameter "msg"

    .prologue
    const/4 v5, 0x0

    .line 139
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 140
    .local v1, id:I
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper$SyncHandler;->this$0:Lcom/android/ex/carousel/CarouselViewHelper;

    invoke-static {v0}, Lcom/android/ex/carousel/CarouselViewHelper;->access$000(Lcom/android/ex/carousel/CarouselViewHelper;)Lcom/android/ex/carousel/CarouselView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/ex/carousel/CarouselView;->getCardCount()I

    move-result v0

    if-lt v1, v0, :cond_28

    .line 141
    const-string v0, "CarouselViewHelper"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Index out of range for set, card:"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    :goto_27
    return-void

    .line 145
    :cond_28
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_84

    goto :goto_27

    .line 147
    :pswitch_2e
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper$SyncHandler;->this$0:Lcom/android/ex/carousel/CarouselViewHelper;

    invoke-static {v0}, Lcom/android/ex/carousel/CarouselViewHelper;->access$000(Lcom/android/ex/carousel/CarouselViewHelper;)Lcom/android/ex/carousel/CarouselView;

    move-result-object v6

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-virtual {v6, v1, v0}, Lcom/android/ex/carousel/CarouselView;->setTextureForItem(ILandroid/graphics/Bitmap;)V

    goto :goto_27

    .line 151
    :pswitch_3c
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper$SyncHandler;->this$0:Lcom/android/ex/carousel/CarouselViewHelper;

    invoke-virtual {v0, v1}, Lcom/android/ex/carousel/CarouselViewHelper;->getDetailTextureParameters(I)Lcom/android/ex/carousel/CarouselViewHelper$DetailTextureParameters;

    move-result-object v7

    .line 152
    .local v7, params:Lcom/android/ex/carousel/CarouselViewHelper$DetailTextureParameters;
    if-eqz v7, :cond_60

    iget v2, v7, Lcom/android/ex/carousel/CarouselViewHelper$DetailTextureParameters;->textureOffsetX:F

    .line 153
    .local v2, x:F
    :goto_46
    if-eqz v7, :cond_62

    iget v3, v7, Lcom/android/ex/carousel/CarouselViewHelper$DetailTextureParameters;->textureOffsetY:F

    .line 154
    .local v3, y:F
    :goto_4a
    if-eqz v7, :cond_64

    iget v4, v7, Lcom/android/ex/carousel/CarouselViewHelper$DetailTextureParameters;->lineOffsetX:F

    .line 155
    .local v4, lx:F
    :goto_4e
    if-eqz v7, :cond_52

    iget v5, v7, Lcom/android/ex/carousel/CarouselViewHelper$DetailTextureParameters;->lineOffsetY:F

    .line 156
    .local v5, ly:F
    :cond_52
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper$SyncHandler;->this$0:Lcom/android/ex/carousel/CarouselViewHelper;

    invoke-static {v0}, Lcom/android/ex/carousel/CarouselViewHelper;->access$000(Lcom/android/ex/carousel/CarouselViewHelper;)Lcom/android/ex/carousel/CarouselView;

    move-result-object v0

    iget-object v6, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v6, Landroid/graphics/Bitmap;

    invoke-virtual/range {v0 .. v6}, Lcom/android/ex/carousel/CarouselView;->setDetailTextureForItem(IFFFFLandroid/graphics/Bitmap;)V

    goto :goto_27

    .end local v2           #x:F
    .end local v3           #y:F
    .end local v4           #lx:F
    .end local v5           #ly:F
    :cond_60
    move v2, v5

    .line 152
    goto :goto_46

    .restart local v2       #x:F
    :cond_62
    move v3, v5

    .line 153
    goto :goto_4a

    .restart local v3       #y:F
    :cond_64
    move v4, v5

    .line 154
    goto :goto_4e

    .line 160
    .end local v2           #x:F
    .end local v3           #y:F
    .end local v7           #params:Lcom/android/ex/carousel/CarouselViewHelper$DetailTextureParameters;
    :pswitch_66
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper$SyncHandler;->this$0:Lcom/android/ex/carousel/CarouselViewHelper;

    invoke-static {v0}, Lcom/android/ex/carousel/CarouselViewHelper;->access$000(Lcom/android/ex/carousel/CarouselViewHelper;)Lcom/android/ex/carousel/CarouselView;

    move-result-object v6

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/renderscript/Mesh;

    invoke-virtual {v6, v1, v0}, Lcom/android/ex/carousel/CarouselView;->setGeometryForItem(ILandroid/renderscript/Mesh;)V

    goto :goto_27

    .line 164
    :pswitch_74
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselViewHelper$SyncHandler;->this$0:Lcom/android/ex/carousel/CarouselViewHelper;

    invoke-static {v0}, Lcom/android/ex/carousel/CarouselViewHelper;->access$000(Lcom/android/ex/carousel/CarouselViewHelper;)Lcom/android/ex/carousel/CarouselView;

    move-result-object v6

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [F

    check-cast v0, [F

    invoke-virtual {v6, v1, v0}, Lcom/android/ex/carousel/CarouselView;->setMatrixForItem(I[F)V

    goto :goto_27

    .line 145
    :pswitch_data_84
    .packed-switch 0x1
        :pswitch_2e
        :pswitch_3c
        :pswitch_66
        :pswitch_74
    .end packed-switch
.end method
