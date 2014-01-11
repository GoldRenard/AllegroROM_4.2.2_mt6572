.class public Lcom/android/systemui/BeanBag$Board$Bean;
.super Landroid/widget/ImageView;
.source "BeanBag.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/BeanBag$Board;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Bean"
.end annotation


# static fields
.field public static final VMAX:F = 1000.0f

.field public static final VMIN:F = 100.0f


# instance fields
.field public a:F

.field public grabbed:Z

.field public grabtime:J

.field public grabx:F

.field private grabx_offset:F

.field public graby:F

.field private graby_offset:F

.field public h:I

.field public r:F

.field final synthetic this$0:Lcom/android/systemui/BeanBag$Board;

.field public va:F

.field public vx:F

.field public vy:F

.field public w:I

.field public x:F

.field public y:F

.field public z:F


# direct methods
.method public constructor <init>(Lcom/android/systemui/BeanBag$Board;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter
    .parameter "context"
    .parameter "as"

    .prologue
    .line 160
    iput-object p1, p0, Lcom/android/systemui/BeanBag$Board$Bean;->this$0:Lcom/android/systemui/BeanBag$Board;

    .line 161
    invoke-direct {p0, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 162
    return-void
.end method

.method private pickBean()V
    .locals 10

    .prologue
    const/high16 v9, 0x437f

    .line 170
    sget-object v7, Lcom/android/systemui/BeanBag$Board;->BEANS:[I

    invoke-static {v7}, Lcom/android/systemui/BeanBag$Board;->pickInt([I)I

    move-result v4

    .line 171
    .local v4, beanId:I
    const/4 v7, 0x0

    const/high16 v8, 0x3f80

    invoke-static {v7, v8}, Lcom/android/systemui/BeanBag$Board;->randfrange(FF)F

    move-result v7

    sget v8, Lcom/android/systemui/BeanBag$Board;->LUCKY:F

    cmpg-float v7, v7, v8

    if-gtz v7, :cond_0

    .line 172
    const v4, 0x7f020115

    .line 174
    :cond_0
    invoke-virtual {p0}, Lcom/android/systemui/BeanBag$Board$Bean;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/BitmapDrawable;

    .line 175
    .local v2, bean:Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    .line 176
    .local v3, beanBits:Landroid/graphics/Bitmap;
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    iput v7, p0, Lcom/android/systemui/BeanBag$Board$Bean;->h:I

    .line 177
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    iput v7, p0, Lcom/android/systemui/BeanBag$Board$Bean;->w:I

    .line 182
    invoke-virtual {p0, v2}, Lcom/android/systemui/BeanBag$Board$Bean;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 184
    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 185
    .local v6, pt:Landroid/graphics/Paint;
    sget-object v7, Lcom/android/systemui/BeanBag$Board;->COLORS:[I

    invoke-static {v7}, Lcom/android/systemui/BeanBag$Board;->pickInt([I)I

    move-result v5

    .line 186
    .local v5, color:I
    new-instance v0, Landroid/graphics/ColorMatrix;

    invoke-direct {v0}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 187
    .local v0, CM:Landroid/graphics/ColorMatrix;
    invoke-virtual {v0}, Landroid/graphics/ColorMatrix;->getArray()[F

    move-result-object v1

    .line 189
    .local v1, M:[F
    const/4 v7, 0x0

    const/high16 v8, 0xff

    and-int/2addr v8, v5

    shr-int/lit8 v8, v8, 0x10

    int-to-float v8, v8

    div-float/2addr v8, v9

    aput v8, v1, v7

    .line 190
    const/4 v7, 0x5

    const v8, 0xff00

    and-int/2addr v8, v5

    shr-int/lit8 v8, v8, 0x8

    int-to-float v8, v8

    div-float/2addr v8, v9

    aput v8, v1, v7

    .line 191
    const/16 v7, 0xa

    and-int/lit16 v8, v5, 0xff

    int-to-float v8, v8

    div-float/2addr v8, v9

    aput v8, v1, v7

    .line 192
    new-instance v7, Landroid/graphics/ColorMatrixColorFilter;

    invoke-direct {v7, v1}, Landroid/graphics/ColorMatrixColorFilter;-><init>([F)V

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 193
    const/4 v7, 0x2

    const v8, 0x7f020115

    if-ne v4, v8, :cond_1

    const/4 v6, 0x0

    .end local v6           #pt:Landroid/graphics/Paint;
    :cond_1
    invoke-virtual {p0, v7, v6}, Lcom/android/systemui/BeanBag$Board$Bean;->setLayerType(ILandroid/graphics/Paint;)V

    .line 194
    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6
    .parameter "e"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 243
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 262
    :goto_0
    return v5

    .line 245
    :pswitch_0
    iput-boolean v5, p0, Lcom/android/systemui/BeanBag$Board$Bean;->grabbed:Z

    .line 246
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v1

    iget v2, p0, Lcom/android/systemui/BeanBag$Board$Bean;->x:F

    sub-float/2addr v1, v2

    iput v1, p0, Lcom/android/systemui/BeanBag$Board$Bean;->grabx_offset:F

    .line 247
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v1

    iget v2, p0, Lcom/android/systemui/BeanBag$Board$Bean;->y:F

    sub-float/2addr v1, v2

    iput v1, p0, Lcom/android/systemui/BeanBag$Board$Bean;->graby_offset:F

    .line 248
    iput v4, p0, Lcom/android/systemui/BeanBag$Board$Bean;->va:F

    .line 251
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v1

    iget v2, p0, Lcom/android/systemui/BeanBag$Board$Bean;->grabx_offset:F

    sub-float/2addr v1, v2

    iput v1, p0, Lcom/android/systemui/BeanBag$Board$Bean;->grabx:F

    .line 252
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v1

    iget v2, p0, Lcom/android/systemui/BeanBag$Board$Bean;->graby_offset:F

    sub-float/2addr v1, v2

    iput v1, p0, Lcom/android/systemui/BeanBag$Board$Bean;->graby:F

    .line 253
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/systemui/BeanBag$Board$Bean;->grabtime:J

    goto :goto_0

    .line 257
    :pswitch_2
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/systemui/BeanBag$Board$Bean;->grabbed:Z

    .line 258
    invoke-static {}, Lcom/android/systemui/BeanBag$Board;->randsign()I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lcom/android/systemui/BeanBag$Board$Bean;->vx:F

    iget v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->vy:F

    invoke-static {v2, v3}, Lcom/android/systemui/BeanBag$Board;->mag(FF)F

    move-result v2

    const v3, 0x3ea8f5c3

    mul-float/2addr v2, v3

    const/high16 v3, 0x4487

    invoke-static {v2, v4, v3}, Lcom/android/systemui/BeanBag$Board;->clamp(FFF)F

    move-result v2

    mul-float v0, v1, v2

    .line 259
    .local v0, a:F
    const/high16 v1, 0x3f00

    mul-float/2addr v1, v0

    invoke-static {v1, v0}, Lcom/android/systemui/BeanBag$Board;->randfrange(FF)F

    move-result v1

    iput v1, p0, Lcom/android/systemui/BeanBag$Board$Bean;->va:F

    goto :goto_0

    .line 243
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public overlap(Lcom/android/systemui/BeanBag$Board$Bean;)F
    .locals 4
    .parameter "other"

    .prologue
    .line 236
    iget v2, p0, Lcom/android/systemui/BeanBag$Board$Bean;->x:F

    iget v3, p1, Lcom/android/systemui/BeanBag$Board$Bean;->x:F

    sub-float v0, v2, v3

    .line 237
    .local v0, dx:F
    iget v2, p0, Lcom/android/systemui/BeanBag$Board$Bean;->y:F

    iget v3, p1, Lcom/android/systemui/BeanBag$Board$Bean;->y:F

    sub-float v1, v2, v3

    .line 238
    .local v1, dy:F
    invoke-static {v0, v1}, Lcom/android/systemui/BeanBag$Board;->mag(FF)F

    move-result v2

    iget v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->r:F

    sub-float/2addr v2, v3

    iget v3, p1, Lcom/android/systemui/BeanBag$Board$Bean;->r:F

    sub-float/2addr v2, v3

    return v2
.end method

.method public reset()V
    .locals 11

    .prologue
    const/high16 v10, 0x4040

    const/high16 v9, 0x4000

    const/high16 v8, -0x3de0

    const/high16 v7, 0x3f00

    const/4 v4, 0x0

    .line 197
    invoke-direct {p0}, Lcom/android/systemui/BeanBag$Board$Bean;->pickBean()V

    .line 199
    sget v3, Lcom/android/systemui/BeanBag$Board;->MIN_SCALE:F

    sget v5, Lcom/android/systemui/BeanBag$Board;->MAX_SCALE:F

    iget v6, p0, Lcom/android/systemui/BeanBag$Board$Bean;->z:F

    invoke-static {v3, v5, v6}, Lcom/android/systemui/BeanBag$Board;->lerp(FFF)F

    move-result v2

    .line 200
    .local v2, scale:F
    invoke-virtual {p0, v2}, Lcom/android/systemui/BeanBag$Board$Bean;->setScaleX(F)V

    invoke-virtual {p0, v2}, Lcom/android/systemui/BeanBag$Board$Bean;->setScaleY(F)V

    .line 202
    const v3, 0x3e99999a

    iget v5, p0, Lcom/android/systemui/BeanBag$Board$Bean;->h:I

    iget v6, p0, Lcom/android/systemui/BeanBag$Board$Bean;->w:I

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v3, v5

    mul-float/2addr v3, v2

    iput v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->r:F

    .line 204
    const/high16 v3, 0x43b4

    invoke-static {v4, v3}, Lcom/android/systemui/BeanBag$Board;->randfrange(FF)F

    move-result v3

    iput v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->a:F

    .line 205
    const/high16 v3, -0x3e10

    const/high16 v5, 0x41f0

    invoke-static {v3, v5}, Lcom/android/systemui/BeanBag$Board;->randfrange(FF)F

    move-result v3

    iput v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->va:F

    .line 207
    const/high16 v3, 0x4220

    invoke-static {v8, v3}, Lcom/android/systemui/BeanBag$Board;->randfrange(FF)F

    move-result v3

    iget v5, p0, Lcom/android/systemui/BeanBag$Board$Bean;->z:F

    mul-float/2addr v3, v5

    iput v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->vx:F

    .line 208
    const/high16 v3, 0x4220

    invoke-static {v8, v3}, Lcom/android/systemui/BeanBag$Board;->randfrange(FF)F

    move-result v3

    iget v5, p0, Lcom/android/systemui/BeanBag$Board$Bean;->z:F

    mul-float/2addr v3, v5

    iput v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->vy:F

    .line 209
    iget-object v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->this$0:Lcom/android/systemui/BeanBag$Board;

    #getter for: Lcom/android/systemui/BeanBag$Board;->boardHeight:I
    invoke-static {v3}, Lcom/android/systemui/BeanBag$Board;->access$000(Lcom/android/systemui/BeanBag$Board;)I

    move-result v3

    int-to-float v0, v3

    .line 210
    .local v0, boardh:F
    iget-object v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->this$0:Lcom/android/systemui/BeanBag$Board;

    #getter for: Lcom/android/systemui/BeanBag$Board;->boardWidth:I
    invoke-static {v3}, Lcom/android/systemui/BeanBag$Board;->access$100(Lcom/android/systemui/BeanBag$Board;)I

    move-result v3

    int-to-float v1, v3

    .line 212
    .local v1, boardw:F
    invoke-static {}, Lcom/android/systemui/BeanBag$Board;->flip()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 213
    iget v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->vx:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_0

    iget v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->r:F

    mul-float/2addr v3, v9

    add-float/2addr v3, v1

    :goto_0
    iput v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->x:F

    .line 214
    iget v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->r:F

    mul-float/2addr v3, v10

    sub-float v3, v0, v3

    invoke-static {v4, v3}, Lcom/android/systemui/BeanBag$Board;->randfrange(FF)F

    move-result v3

    mul-float v5, v3, v7

    iget v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->vy:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_1

    mul-float v3, v0, v7

    :goto_1
    add-float/2addr v3, v5

    iput v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->y:F

    .line 219
    :goto_2
    return-void

    .line 213
    :cond_0
    iget v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->r:F

    neg-float v3, v3

    const/high16 v5, 0x4080

    mul-float/2addr v3, v5

    goto :goto_0

    :cond_1
    move v3, v4

    .line 214
    goto :goto_1

    .line 216
    :cond_2
    iget v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->vy:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_4

    iget v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->r:F

    mul-float/2addr v3, v9

    add-float/2addr v3, v0

    :goto_3
    iput v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->y:F

    .line 217
    iget v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->r:F

    mul-float/2addr v3, v10

    sub-float v3, v1, v3

    invoke-static {v4, v3}, Lcom/android/systemui/BeanBag$Board;->randfrange(FF)F

    move-result v3

    mul-float/2addr v3, v7

    iget v5, p0, Lcom/android/systemui/BeanBag$Board$Bean;->vx:F

    cmpg-float v5, v5, v4

    if-gez v5, :cond_3

    mul-float v4, v1, v7

    :cond_3
    add-float/2addr v3, v4

    iput v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->x:F

    goto :goto_2

    .line 216
    :cond_4
    iget v3, p0, Lcom/android/systemui/BeanBag$Board$Bean;->r:F

    neg-float v3, v3

    const/high16 v5, 0x4080

    mul-float/2addr v3, v5

    goto :goto_3
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 165
    const-string v0, "<bean (%.1f, %.1f) (%d x %d)>"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/android/systemui/BeanBag$Board$Bean;->getX()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/android/systemui/BeanBag$Board$Bean;->getY()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-virtual {p0}, Lcom/android/systemui/BeanBag$Board$Bean;->getWidth()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-virtual {p0}, Lcom/android/systemui/BeanBag$Board$Bean;->getHeight()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public update(F)V
    .locals 5
    .parameter "dt"

    .prologue
    const/high16 v4, 0x3f40

    const/high16 v3, 0x3e80

    .line 222
    iget-boolean v0, p0, Lcom/android/systemui/BeanBag$Board$Bean;->grabbed:Z

    if-eqz v0, :cond_0

    .line 224
    iget v0, p0, Lcom/android/systemui/BeanBag$Board$Bean;->vx:F

    mul-float/2addr v0, v4

    iget v1, p0, Lcom/android/systemui/BeanBag$Board$Bean;->grabx:F

    iget v2, p0, Lcom/android/systemui/BeanBag$Board$Bean;->x:F

    sub-float/2addr v1, v2

    div-float/2addr v1, p1

    mul-float/2addr v1, v3

    add-float/2addr v0, v1

    iput v0, p0, Lcom/android/systemui/BeanBag$Board$Bean;->vx:F

    .line 225
    iget v0, p0, Lcom/android/systemui/BeanBag$Board$Bean;->grabx:F

    iput v0, p0, Lcom/android/systemui/BeanBag$Board$Bean;->x:F

    .line 226
    iget v0, p0, Lcom/android/systemui/BeanBag$Board$Bean;->vy:F

    mul-float/2addr v0, v4

    iget v1, p0, Lcom/android/systemui/BeanBag$Board$Bean;->graby:F

    iget v2, p0, Lcom/android/systemui/BeanBag$Board$Bean;->y:F

    sub-float/2addr v1, v2

    div-float/2addr v1, p1

    mul-float/2addr v1, v3

    add-float/2addr v0, v1

    iput v0, p0, Lcom/android/systemui/BeanBag$Board$Bean;->vy:F

    .line 227
    iget v0, p0, Lcom/android/systemui/BeanBag$Board$Bean;->graby:F

    iput v0, p0, Lcom/android/systemui/BeanBag$Board$Bean;->y:F

    .line 233
    :goto_0
    return-void

    .line 229
    :cond_0
    iget v0, p0, Lcom/android/systemui/BeanBag$Board$Bean;->x:F

    iget v1, p0, Lcom/android/systemui/BeanBag$Board$Bean;->vx:F

    mul-float/2addr v1, p1

    add-float/2addr v0, v1

    iput v0, p0, Lcom/android/systemui/BeanBag$Board$Bean;->x:F

    .line 230
    iget v0, p0, Lcom/android/systemui/BeanBag$Board$Bean;->y:F

    iget v1, p0, Lcom/android/systemui/BeanBag$Board$Bean;->vy:F

    mul-float/2addr v1, p1

    add-float/2addr v0, v1

    iput v0, p0, Lcom/android/systemui/BeanBag$Board$Bean;->y:F

    .line 231
    iget v0, p0, Lcom/android/systemui/BeanBag$Board$Bean;->a:F

    iget v1, p0, Lcom/android/systemui/BeanBag$Board$Bean;->va:F

    mul-float/2addr v1, p1

    add-float/2addr v0, v1

    iput v0, p0, Lcom/android/systemui/BeanBag$Board$Bean;->a:F

    goto :goto_0
.end method
