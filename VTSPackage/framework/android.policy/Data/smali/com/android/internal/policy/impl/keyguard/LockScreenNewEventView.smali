.class public Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;
.super Landroid/widget/RelativeLayout;
.source "LockScreenNewEventView.java"


# static fields
.field private static final DEBUG:Z = true

.field private static final MAX_COUNT:I = 0x63

.field private static final MAX_COUNT_STRING:Ljava/lang/String; = "99+"

.field private static final TAG:Ljava/lang/String; = "NewEventView"


# instance fields
.field mAttachedToWindow:Z

.field private mContext:Landroid/content/Context;

.field private mCount:I

.field private mEventChangeObserver:Lcom/android/internal/policy/impl/keyguard/UnReadObserver;

.field private mNumberText:Ljava/lang/String;

.field private mResourceId:I

.field mSetNumberRunnable:Ljava/lang/Runnable;

.field private mTopParentView:Landroid/view/ViewGroup;

.field private mUnReadImageView:Landroid/widget/ImageView;

.field private mUnReadTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 53
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 57
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 58
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v0, 0x0

    .line 61
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 33
    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mCount:I

    .line 34
    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mAttachedToWindow:Z

    .line 45
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView$1;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView$1;-><init>(Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mSetNumberRunnable:Ljava/lang/Runnable;

    .line 62
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mContext:Landroid/content/Context;

    .line 63
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->setDrawingCacheEnabled(Z)V

    .line 64
    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 25
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mCount:I

    return v0
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->setNumberImp(I)V

    return-void
.end method

.method private final setNumberImp(I)V
    .locals 3
    .parameter "count"

    .prologue
    .line 108
    const-string v0, "NewEventView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setNumber count="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    if-gtz p1, :cond_0

    .line 112
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->setViewVisibility(I)V

    .line 124
    :goto_0
    return-void

    .line 116
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->setViewVisibility(I)V

    .line 118
    const/16 v0, 0x63

    if-le p1, v0, :cond_1

    .line 119
    const-string v0, "99+"

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mNumberText:Ljava/lang/String;

    .line 123
    :goto_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mUnReadTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mNumberText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 121
    :cond_1
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mNumberText:Ljava/lang/String;

    goto :goto_1
.end method


# virtual methods
.method public getFakeCenterX()I
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mUnReadImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public getFakeCenterY()I
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mUnReadImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public getNewEventBitmapHeight()I
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mUnReadImageView:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mUnReadImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 148
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mUnReadImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    .line 150
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getNewEventBitmapWidth()I
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mUnReadImageView:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mUnReadImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 140
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mUnReadImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    .line 142
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getNewEventImageView()Landroid/widget/ImageView;
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mUnReadImageView:Landroid/widget/ImageView;

    return-object v0
.end method

.method public getResourceId()I
    .locals 1

    .prologue
    .line 97
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mResourceId:I

    return v0
.end method

.method public init(I)V
    .locals 4
    .parameter "drawableId"

    .prologue
    const/high16 v3, 0x3f00

    .line 88
    const-string v1, "NewEventView"

    const-string v2, "init"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    iput p1, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mResourceId:I

    .line 90
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 91
    .local v0, drawable:Landroid/graphics/drawable/Drawable;
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mUnReadImageView:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 92
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getMeasuredHeight()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v3

    invoke-virtual {p0, v1}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->setPivotY(F)V

    .line 93
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getMeasuredWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v3

    invoke-virtual {p0, v1}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->setPivotX(F)V

    .line 94
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .prologue
    .line 75
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onAttachedToWindow()V

    .line 76
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mAttachedToWindow:Z

    .line 77
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 81
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onDetachedFromWindow()V

    .line 82
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mSetNumberRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 83
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mAttachedToWindow:Z

    .line 84
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .prologue
    .line 67
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    .line 68
    const v0, 0x2100029

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mUnReadTextView:Landroid/widget/TextView;

    .line 69
    const v0, 0x2100028

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mUnReadImageView:Landroid/widget/ImageView;

    .line 70
    return-void
.end method

.method public registerForQueryObserver(Landroid/net/Uri;Lcom/android/internal/policy/impl/keyguard/UnReadObserver;)V
    .locals 3
    .parameter "uri"
    .parameter "unReadObserver"

    .prologue
    .line 165
    if-eqz p2, :cond_0

    .line 166
    iput-object p2, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mEventChangeObserver:Lcom/android/internal/policy/impl/keyguard/UnReadObserver;

    .line 167
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mEventChangeObserver:Lcom/android/internal/policy/impl/keyguard/UnReadObserver;

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 170
    :cond_0
    return-void
.end method

.method public setNumber(I)V
    .locals 2
    .parameter "count"

    .prologue
    .line 101
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mAttachedToWindow:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 102
    iput p1, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mCount:I

    .line 103
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mSetNumberRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->post(Ljava/lang/Runnable;)Z

    .line 105
    :cond_0
    return-void
.end method

.method public setTopParent(Landroid/view/ViewGroup;)V
    .locals 0
    .parameter "parentView"

    .prologue
    .line 127
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mTopParentView:Landroid/view/ViewGroup;

    .line 128
    return-void
.end method

.method public setViewVisibility(I)V
    .locals 1
    .parameter "visibility"

    .prologue
    .line 131
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mTopParentView:Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 132
    return-void
.end method

.method public unRegisterNewEventObserver()V
    .locals 2

    .prologue
    .line 173
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mEventChangeObserver:Lcom/android/internal/policy/impl/keyguard/UnReadObserver;

    if-eqz v0, :cond_0

    .line 174
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mEventChangeObserver:Lcom/android/internal/policy/impl/keyguard/UnReadObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 176
    :cond_0
    return-void
.end method

.method public updateQueryBaseTime(J)V
    .locals 1
    .parameter "newBaseTime"

    .prologue
    .line 179
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mEventChangeObserver:Lcom/android/internal/policy/impl/keyguard/UnReadObserver;

    invoke-virtual {v0, p1, p2}, Lcom/android/internal/policy/impl/keyguard/UnReadObserver;->updateQueryBaseTime(J)V

    .line 180
    return-void
.end method
