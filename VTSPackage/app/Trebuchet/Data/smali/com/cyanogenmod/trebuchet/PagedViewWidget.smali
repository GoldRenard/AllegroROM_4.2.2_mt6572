.class public Lcom/cyanogenmod/trebuchet/PagedViewWidget;
.super Landroid/widget/LinearLayout;
.source "PagedViewWidget.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/PagedViewWidget$CheckForShortPress;,
        Lcom/cyanogenmod/trebuchet/PagedViewWidget$ShortPressListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Trebuchet.PagedViewWidgetLayout"

.field private static sDeletePreviewsWhenDetachedFromWindow:Z

.field static sShortpressTarget:Lcom/cyanogenmod/trebuchet/PagedViewWidget;


# instance fields
.field private mDimensionsFormatString:Ljava/lang/String;

.field mIsAppWidget:Z

.field private final mOriginalImagePadding:Landroid/graphics/Rect;

.field mPendingCheckForShortPress:Lcom/cyanogenmod/trebuchet/PagedViewWidget$CheckForShortPress;

.field mShortPressListener:Lcom/cyanogenmod/trebuchet/PagedViewWidget$ShortPressListener;

.field mShortPressTriggered:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const/4 v0, 0x1

    sput-boolean v0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->sDeletePreviewsWhenDetachedFromWindow:Z

    .line 44
    const/4 v0, 0x0

    sput-object v0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->sShortpressTarget:Lcom/cyanogenmod/trebuchet/PagedViewWidget;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 49
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 53
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 57
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mPendingCheckForShortPress:Lcom/cyanogenmod/trebuchet/PagedViewWidget$CheckForShortPress;

    .line 42
    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mShortPressListener:Lcom/cyanogenmod/trebuchet/PagedViewWidget$ShortPressListener;

    .line 43
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mShortPressTriggered:Z

    .line 46
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mOriginalImagePadding:Landroid/graphics/Rect;

    .line 59
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 60
    .local v0, r:Landroid/content/res/Resources;
    const v1, 0x7f090086

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mDimensionsFormatString:Ljava/lang/String;

    .line 62
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->setWillNotDraw(Z)V

    .line 63
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->setClipToPadding(Z)V

    .line 64
    return-void
.end method

.method private checkForShortPress()V
    .locals 3

    .prologue
    .line 177
    sget-object v0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->sShortpressTarget:Lcom/cyanogenmod/trebuchet/PagedViewWidget;

    if-eqz v0, :cond_0

    .line 182
    :goto_0
    return-void

    .line 178
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mPendingCheckForShortPress:Lcom/cyanogenmod/trebuchet/PagedViewWidget$CheckForShortPress;

    if-nez v0, :cond_1

    .line 179
    new-instance v0, Lcom/cyanogenmod/trebuchet/PagedViewWidget$CheckForShortPress;

    invoke-direct {v0, p0}, Lcom/cyanogenmod/trebuchet/PagedViewWidget$CheckForShortPress;-><init>(Lcom/cyanogenmod/trebuchet/PagedViewWidget;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mPendingCheckForShortPress:Lcom/cyanogenmod/trebuchet/PagedViewWidget$CheckForShortPress;

    .line 181
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mPendingCheckForShortPress:Lcom/cyanogenmod/trebuchet/PagedViewWidget$CheckForShortPress;

    const-wide/16 v1, 0x78

    invoke-virtual {p0, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method private cleanUpShortPress()V
    .locals 1

    .prologue
    .line 194
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->removeShortPressCallback()V

    .line 195
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mShortPressTriggered:Z

    if-eqz v0, :cond_1

    .line 196
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mShortPressListener:Lcom/cyanogenmod/trebuchet/PagedViewWidget$ShortPressListener;

    if-eqz v0, :cond_0

    .line 197
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mShortPressListener:Lcom/cyanogenmod/trebuchet/PagedViewWidget$ShortPressListener;

    invoke-interface {v0, p0}, Lcom/cyanogenmod/trebuchet/PagedViewWidget$ShortPressListener;->cleanUpShortPress(Landroid/view/View;)V

    .line 199
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mShortPressTriggered:Z

    .line 201
    :cond_1
    return-void
.end method

.method private removeShortPressCallback()V
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mPendingCheckForShortPress:Lcom/cyanogenmod/trebuchet/PagedViewWidget$CheckForShortPress;

    if-eqz v0, :cond_0

    .line 189
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mPendingCheckForShortPress:Lcom/cyanogenmod/trebuchet/PagedViewWidget$CheckForShortPress;

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 191
    :cond_0
    return-void
.end method

.method static resetShortPressTarget()V
    .locals 1

    .prologue
    .line 204
    const/4 v0, 0x0

    sput-object v0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->sShortpressTarget:Lcom/cyanogenmod/trebuchet/PagedViewWidget;

    .line 205
    return-void
.end method

.method public static setDeletePreviewsWhenDetachedFromWindow(Z)V
    .locals 0
    .parameter "value"

    .prologue
    .line 78
    sput-boolean p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->sDeletePreviewsWhenDetachedFromWindow:Z

    .line 79
    return-void
.end method


# virtual methods
.method public applyFromAppWidgetProviderInfo(Landroid/appwidget/AppWidgetProviderInfo;I[I)V
    .locals 10
    .parameter "info"
    .parameter "maxWidth"
    .parameter "cellSpan"

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 99
    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mIsAppWidget:Z

    .line 100
    const v5, 0x7f070015

    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 101
    .local v2, image:Landroid/widget/ImageView;
    const/4 v5, -0x1

    if-le p2, v5, :cond_0

    .line 102
    invoke-virtual {v2, p2}, Landroid/widget/ImageView;->setMaxWidth(I)V

    .line 104
    :cond_0
    iget-object v5, p1, Landroid/appwidget/AppWidgetProviderInfo;->label:Ljava/lang/String;

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 105
    const v5, 0x7f070016

    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 106
    .local v3, name:Landroid/widget/TextView;
    iget-object v5, p1, Landroid/appwidget/AppWidgetProviderInfo;->label:Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    const v5, 0x7f070017

    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 108
    .local v0, dims:Landroid/widget/TextView;
    if-eqz v0, :cond_1

    .line 109
    aget v5, p3, v9

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountX()I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 110
    .local v1, hSpan:I
    aget v5, p3, v8

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountY()I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 111
    .local v4, vSpan:I
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mDimensionsFormatString:Ljava/lang/String;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    .end local v1           #hSpan:I
    .end local v4           #vSpan:I
    :cond_1
    return-void
.end method

.method public applyFromResolveInfo(Landroid/content/pm/PackageManager;Landroid/content/pm/ResolveInfo;)V
    .locals 9
    .parameter "pm"
    .parameter "info"

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 116
    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mIsAppWidget:Z

    .line 117
    invoke-virtual {p2, p1}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v2

    .line 118
    .local v2, label:Ljava/lang/CharSequence;
    const v4, 0x7f070015

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 119
    .local v1, image:Landroid/widget/ImageView;
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 120
    const v4, 0x7f070016

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 121
    .local v3, name:Landroid/widget/TextView;
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    const v4, 0x7f070017

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 123
    .local v0, dims:Landroid/widget/TextView;
    if-eqz v0, :cond_0

    .line 124
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mDimensionsFormatString:Ljava/lang/String;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    :cond_0
    return-void
.end method

.method applyPreview(Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;)V
    .locals 7
    .parameter "preview"

    .prologue
    const/4 v4, 0x0

    .line 137
    const v3, 0x7f070015

    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/PagedViewWidgetImageView;

    .line 139
    .local v1, image:Lcom/cyanogenmod/trebuchet/PagedViewWidgetImageView;
    if-eqz p1, :cond_1

    .line 140
    iput-boolean v4, v1, Lcom/cyanogenmod/trebuchet/PagedViewWidgetImageView;->mAllowRequestLayout:Z

    .line 141
    invoke-virtual {v1, p1}, Lcom/cyanogenmod/trebuchet/PagedViewWidgetImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 142
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mIsAppWidget:Z

    if-eqz v3, :cond_0

    .line 144
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->getPreviewSize()[I

    move-result-object v2

    .line 145
    .local v2, imageSize:[I
    aget v3, v2, v4

    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->getIntrinsicWidth()I

    move-result v4

    sub-int/2addr v3, v4

    div-int/lit8 v0, v3, 0x2

    .line 146
    .local v0, centerAmount:I
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mOriginalImagePadding:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    add-int/2addr v3, v0

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mOriginalImagePadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mOriginalImagePadding:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->right:I

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mOriginalImagePadding:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v1, v3, v4, v5, v6}, Lcom/cyanogenmod/trebuchet/PagedViewWidgetImageView;->setPadding(IIII)V

    .line 151
    .end local v0           #centerAmount:I
    .end local v2           #imageSize:[I
    :cond_0
    const/high16 v3, 0x3f80

    invoke-virtual {v1, v3}, Lcom/cyanogenmod/trebuchet/PagedViewWidgetImageView;->setAlpha(F)V

    .line 152
    const/4 v3, 0x1

    iput-boolean v3, v1, Lcom/cyanogenmod/trebuchet/PagedViewWidgetImageView;->mAllowRequestLayout:Z

    .line 154
    :cond_1
    return-void
.end method

.method public getPreviewSize()[I
    .locals 5

    .prologue
    .line 129
    const v2, 0x7f070015

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 130
    .local v0, i:Landroid/widget/ImageView;
    const/4 v2, 0x2

    new-array v1, v2, [I

    .line 131
    .local v1, maxSize:[I
    const/4 v2, 0x0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getWidth()I

    move-result v3

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mOriginalImagePadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    sub-int/2addr v3, v4

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mOriginalImagePadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    sub-int/2addr v3, v4

    aput v3, v1, v2

    .line 132
    const/4 v2, 0x1

    invoke-virtual {v0}, Landroid/widget/ImageView;->getHeight()I

    move-result v3

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mOriginalImagePadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, v4

    aput v3, v1, v2

    .line 133
    return-object v1
.end method

.method protected onDetachedFromWindow()V
    .locals 3

    .prologue
    .line 83
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 85
    sget-boolean v2, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->sDeletePreviewsWhenDetachedFromWindow:Z

    if-eqz v2, :cond_1

    .line 86
    const v2, 0x7f070015

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 87
    .local v0, image:Landroid/widget/ImageView;
    if-eqz v0, :cond_1

    .line 88
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;

    .line 89
    .local v1, preview:Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 90
    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 92
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 95
    .end local v0           #image:Landroid/widget/ImageView;
    .end local v1           #preview:Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;
    :cond_1
    return-void
.end method

.method protected onFinishInflate()V
    .locals 3

    .prologue
    .line 68
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 70
    const v1, 0x7f070015

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 71
    .local v0, image:Landroid/widget/ImageView;
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mOriginalImagePadding:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getPaddingLeft()I

    move-result v2

    iput v2, v1, Landroid/graphics/Rect;->left:I

    .line 72
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mOriginalImagePadding:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getPaddingTop()I

    move-result v2

    iput v2, v1, Landroid/graphics/Rect;->top:I

    .line 73
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mOriginalImagePadding:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getPaddingRight()I

    move-result v2

    iput v2, v1, Landroid/graphics/Rect;->right:I

    .line 74
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mOriginalImagePadding:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getPaddingBottom()I

    move-result v2

    iput v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 75
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "event"

    .prologue
    .line 209
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 211
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 232
    :goto_0
    :pswitch_0
    const/4 v0, 0x1

    return v0

    .line 213
    :pswitch_1
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->cleanUpShortPress()V

    goto :goto_0

    .line 216
    :pswitch_2
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->checkForShortPress()V

    goto :goto_0

    .line 219
    :pswitch_3
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->cleanUpShortPress()V

    goto :goto_0

    .line 211
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method setShortPressListener(Lcom/cyanogenmod/trebuchet/PagedViewWidget$ShortPressListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 157
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->mShortPressListener:Lcom/cyanogenmod/trebuchet/PagedViewWidget$ShortPressListener;

    .line 158
    return-void
.end method
