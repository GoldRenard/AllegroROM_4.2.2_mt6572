.class public Lcom/android/phone/AnimationUtils;
.super Ljava/lang/Object;
.source "AnimationUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/phone/AnimationUtils$CrossFadeDrawable;,
        Lcom/android/phone/AnimationUtils$Fade;
    }
.end annotation


# static fields
.field public static final ANIMATION_DURATION:I = 0xfa

.field private static final FADE_DBG:Z

.field private static final LOG_TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lcom/android/phone/AnimationUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/phone/AnimationUtils;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 49
    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 278
    sget-object v0, Lcom/android/phone/AnimationUtils;->LOG_TAG:Ljava/lang/String;

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    return-void
.end method

.method private static newCrossFadeDrawable(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Lcom/android/phone/AnimationUtils$CrossFadeDrawable;
    .locals 2
    .parameter "first"
    .parameter "second"

    .prologue
    .line 200
    const/4 v1, 0x2

    new-array v0, v1, [Landroid/graphics/drawable/Drawable;

    .line 201
    .local v0, layers:[Landroid/graphics/drawable/Drawable;
    const/4 v1, 0x0

    aput-object p0, v0, v1

    .line 202
    const/4 v1, 0x1

    aput-object p1, v0, v1

    .line 203
    new-instance v1, Lcom/android/phone/AnimationUtils$CrossFadeDrawable;

    invoke-direct {v1, v0}, Lcom/android/phone/AnimationUtils$CrossFadeDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    return-object v1
.end method

.method public static startCrossFade(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 5
    .parameter "imageView"
    .parameter "from"
    .parameter "to"

    .prologue
    .line 214
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    instance-of v3, p1, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v3, :cond_2

    instance-of v3, p2, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v3, :cond_2

    move-object v3, p1

    check-cast v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v4

    move-object v3, p2

    check-cast v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    :cond_0
    const/4 v1, 0x1

    .line 219
    .local v1, areSameImage:Z
    :goto_0
    if-nez v1, :cond_1

    .line 226
    invoke-static {p1, p2}, Lcom/android/phone/AnimationUtils;->newCrossFadeDrawable(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Lcom/android/phone/AnimationUtils$CrossFadeDrawable;

    move-result-object v2

    .line 227
    .local v2, crossFadeDrawable:Lcom/android/phone/AnimationUtils$CrossFadeDrawable;
    invoke-virtual {v2}, Lcom/android/phone/AnimationUtils$CrossFadeDrawable;->getAnimator()Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 228
    .local v0, animator:Landroid/animation/ObjectAnimator;
    invoke-virtual {p0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 229
    const-wide/16 v3, 0xfa

    invoke-virtual {v0, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 230
    new-instance v3, Lcom/android/phone/AnimationUtils$1;

    invoke-direct {v3, p1, p2, p0}, Lcom/android/phone/AnimationUtils$1;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/widget/ImageView;)V

    invoke-virtual {v0, v3}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 253
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 267
    invoke-virtual {p0, p2}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 273
    .end local v0           #animator:Landroid/animation/ObjectAnimator;
    .end local v2           #crossFadeDrawable:Lcom/android/phone/AnimationUtils$CrossFadeDrawable;
    :cond_1
    return-void

    .line 214
    .end local v1           #areSameImage:Z
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method
