.class Lcom/android/browser/TabBar$TabView;
.super Landroid/widget/LinearLayout;
.source "TabBar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/TabBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TabView"
.end annotation


# instance fields
.field mClose:Landroid/widget/ImageView;

.field mFocusPath:Landroid/graphics/Path;

.field mIconView:Landroid/widget/ImageView;

.field mIncognito:Landroid/view/View;

.field mLock:Landroid/widget/ImageView;

.field mPath:Landroid/graphics/Path;

.field mSelected:Z

.field mSnapshot:Landroid/view/View;

.field mTab:Lcom/android/browser/Tab;

.field mTabContent:Landroid/view/View;

.field mTitle:Landroid/widget/TextView;

.field mWindowPos:[I

.field final synthetic this$0:Lcom/android/browser/TabBar;


# direct methods
.method public constructor <init>(Lcom/android/browser/TabBar;Landroid/content/Context;Lcom/android/browser/Tab;)V
    .locals 4
    .parameter
    .parameter "context"
    .parameter "tab"

    .prologue
    const/4 v3, 0x0

    .line 260
    iput-object p1, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    .line 261
    invoke-direct {p0, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 262
    invoke-virtual {p0, v3}, Lcom/android/browser/TabBar$TabView;->setWillNotDraw(Z)V

    .line 263
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lcom/android/browser/TabBar$TabView;->mPath:Landroid/graphics/Path;

    .line 264
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lcom/android/browser/TabBar$TabView;->mFocusPath:Landroid/graphics/Path;

    .line 265
    const/4 v1, 0x2

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/android/browser/TabBar$TabView;->mWindowPos:[I

    .line 266
    iput-object p3, p0, Lcom/android/browser/TabBar$TabView;->mTab:Lcom/android/browser/Tab;

    .line 267
    const/16 v1, 0x10

    invoke-virtual {p0, v1}, Lcom/android/browser/TabBar$TabView;->setGravity(I)V

    .line 268
    invoke-virtual {p0, v3}, Lcom/android/browser/TabBar$TabView;->setOrientation(I)V

    .line 269
    #getter for: Lcom/android/browser/TabBar;->mTabOverlap:I
    invoke-static {p1}, Lcom/android/browser/TabBar;->access$000(Lcom/android/browser/TabBar;)I

    move-result v1

    #getter for: Lcom/android/browser/TabBar;->mTabSliceWidth:I
    invoke-static {p1}, Lcom/android/browser/TabBar;->access$100(Lcom/android/browser/TabBar;)I

    move-result v2

    invoke-virtual {p0, v1, v3, v2, v3}, Lcom/android/browser/TabBar$TabView;->setPadding(IIII)V

    .line 270
    invoke-virtual {p0}, Lcom/android/browser/TabBar$TabView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 271
    .local v0, inflater:Landroid/view/LayoutInflater;
    const v1, 0x7f040035

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/TabBar$TabView;->mTabContent:Landroid/view/View;

    .line 272
    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->mTabContent:Landroid/view/View;

    const v2, 0x7f0d0007

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/android/browser/TabBar$TabView;->mTitle:Landroid/widget/TextView;

    .line 273
    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->mTabContent:Landroid/view/View;

    const v2, 0x7f0d0006

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/browser/TabBar$TabView;->mIconView:Landroid/widget/ImageView;

    .line 274
    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->mTabContent:Landroid/view/View;

    const v2, 0x7f0d007e

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/browser/TabBar$TabView;->mLock:Landroid/widget/ImageView;

    .line 275
    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->mTabContent:Landroid/view/View;

    const v2, 0x7f0d0063

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/browser/TabBar$TabView;->mClose:Landroid/widget/ImageView;

    .line 276
    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->mClose:Landroid/widget/ImageView;

    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 277
    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->mTabContent:Landroid/view/View;

    const v2, 0x7f0d007c

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/TabBar$TabView;->mIncognito:Landroid/view/View;

    .line 278
    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->mTabContent:Landroid/view/View;

    const v2, 0x7f0d007d

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/TabBar$TabView;->mSnapshot:Landroid/view/View;

    .line 279
    iput-boolean v3, p0, Lcom/android/browser/TabBar$TabView;->mSelected:Z

    .line 281
    invoke-direct {p0}, Lcom/android/browser/TabBar$TabView;->updateFromTab()V

    .line 282
    return-void
.end method

.method static synthetic access$2100(Lcom/android/browser/TabBar$TabView;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 242
    invoke-direct {p0}, Lcom/android/browser/TabBar$TabView;->updateTabIcons()V

    return-void
.end method

.method private closeTab()V
    .locals 2

    .prologue
    .line 358
    iget-object v0, p0, Lcom/android/browser/TabBar$TabView;->mTab:Lcom/android/browser/Tab;

    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mTabControl:Lcom/android/browser/TabControl;
    invoke-static {v1}, Lcom/android/browser/TabBar;->access$500(Lcom/android/browser/TabBar;)Lcom/android/browser/TabControl;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 359
    iget-object v0, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mUiController:Lcom/android/browser/UiController;
    invoke-static {v0}, Lcom/android/browser/TabBar;->access$600(Lcom/android/browser/TabBar;)Lcom/android/browser/UiController;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/browser/UiController;->closeCurrentTab()V

    .line 363
    :goto_0
    return-void

    .line 361
    :cond_0
    iget-object v0, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mUiController:Lcom/android/browser/UiController;
    invoke-static {v0}, Lcom/android/browser/TabBar;->access$600(Lcom/android/browser/TabBar;)Lcom/android/browser/UiController;

    move-result-object v0

    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->mTab:Lcom/android/browser/Tab;

    invoke-interface {v0, v1}, Lcom/android/browser/UiController;->closeTab(Lcom/android/browser/Tab;)V

    goto :goto_0
.end method

.method private drawClipped(Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Path;I)V
    .locals 3
    .parameter "canvas"
    .parameter "paint"
    .parameter "clipPath"
    .parameter "left"

    .prologue
    .line 407
    iget-boolean v1, p0, Lcom/android/browser/TabBar$TabView;->mSelected:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mActiveMatrix:Landroid/graphics/Matrix;
    invoke-static {v1}, Lcom/android/browser/TabBar;->access$1600(Lcom/android/browser/TabBar;)Landroid/graphics/Matrix;

    move-result-object v0

    .line 408
    .local v0, matrix:Landroid/graphics/Matrix;
    :goto_0
    neg-int v1, p4

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 409
    iget-boolean v1, p0, Lcom/android/browser/TabBar$TabView;->mSelected:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mActiveShader:Landroid/graphics/BitmapShader;
    invoke-static {v1}, Lcom/android/browser/TabBar;->access$1200(Lcom/android/browser/TabBar;)Landroid/graphics/BitmapShader;

    move-result-object v1

    :goto_1
    invoke-virtual {v1, v0}, Landroid/graphics/BitmapShader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 410
    invoke-virtual {p1, p3, p2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 411
    invoke-virtual {p0}, Lcom/android/browser/TabBar$TabView;->isFocused()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 412
    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->mFocusPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mFocusPaint:Landroid/graphics/Paint;
    invoke-static {v2}, Lcom/android/browser/TabBar;->access$1800(Lcom/android/browser/TabBar;)Landroid/graphics/Paint;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 414
    :cond_0
    return-void

    .line 407
    .end local v0           #matrix:Landroid/graphics/Matrix;
    :cond_1
    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mInactiveMatrix:Landroid/graphics/Matrix;
    invoke-static {v1}, Lcom/android/browser/TabBar;->access$1700(Lcom/android/browser/TabBar;)Landroid/graphics/Matrix;

    move-result-object v0

    goto :goto_0

    .line 409
    .restart local v0       #matrix:Landroid/graphics/Matrix;
    :cond_2
    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mInactiveShader:Landroid/graphics/BitmapShader;
    invoke-static {v1}, Lcom/android/browser/TabBar;->access$1400(Lcom/android/browser/TabBar;)Landroid/graphics/BitmapShader;

    move-result-object v1

    goto :goto_1
.end method

.method private setFocusPath(Landroid/graphics/Path;IIII)V
    .locals 2
    .parameter "path"
    .parameter "l"
    .parameter "t"
    .parameter "r"
    .parameter "b"

    .prologue
    .line 426
    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 427
    int-to-float v0, p2

    int-to-float v1, p5

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 428
    int-to-float v0, p2

    int-to-float v1, p3

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 429
    iget-object v0, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mTabSliceWidth:I
    invoke-static {v0}, Lcom/android/browser/TabBar;->access$100(Lcom/android/browser/TabBar;)I

    move-result v0

    sub-int v0, p4, v0

    int-to-float v0, v0

    int-to-float v1, p3

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 430
    int-to-float v0, p4

    int-to-float v1, p5

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 431
    return-void
.end method

.method private setTabPath(Landroid/graphics/Path;IIII)V
    .locals 2
    .parameter "path"
    .parameter "l"
    .parameter "t"
    .parameter "r"
    .parameter "b"

    .prologue
    .line 417
    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 418
    int-to-float v0, p2

    int-to-float v1, p5

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 419
    int-to-float v0, p2

    int-to-float v1, p3

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 420
    iget-object v0, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mTabSliceWidth:I
    invoke-static {v0}, Lcom/android/browser/TabBar;->access$100(Lcom/android/browser/TabBar;)I

    move-result v0

    sub-int v0, p4, v0

    int-to-float v0, v0

    int-to-float v1, p3

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 421
    int-to-float v0, p4

    int-to-float v1, p5

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 422
    invoke-virtual {p1}, Landroid/graphics/Path;->close()V

    .line 423
    return-void
.end method

.method private updateFromTab()V
    .locals 3

    .prologue
    .line 292
    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->mTab:Lcom/android/browser/Tab;

    invoke-virtual {v1}, Lcom/android/browser/Tab;->getTitle()Ljava/lang/String;

    move-result-object v0

    .line 293
    .local v0, displayTitle:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 294
    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->mTab:Lcom/android/browser/Tab;

    invoke-virtual {v1}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v0

    .line 296
    :cond_0
    invoke-virtual {p0, v0}, Lcom/android/browser/TabBar$TabView;->setDisplayTitle(Ljava/lang/String;)V

    .line 297
    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->mTab:Lcom/android/browser/Tab;

    invoke-virtual {v1}, Lcom/android/browser/Tab;->getFavicon()Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 298
    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mUi:Lcom/android/browser/XLargeUi;
    invoke-static {v1}, Lcom/android/browser/TabBar;->access$200(Lcom/android/browser/TabBar;)Lcom/android/browser/XLargeUi;

    move-result-object v1

    iget-object v2, p0, Lcom/android/browser/TabBar$TabView;->mTab:Lcom/android/browser/Tab;

    invoke-virtual {v2}, Lcom/android/browser/Tab;->getFavicon()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/browser/XLargeUi;->getFaviconDrawable(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/browser/TabBar$TabView;->setFavicon(Landroid/graphics/drawable/Drawable;)V

    .line 300
    :cond_1
    invoke-direct {p0}, Lcom/android/browser/TabBar$TabView;->updateTabIcons()V

    .line 301
    return-void
.end method

.method private updateTabIcons()V
    .locals 4

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 304
    iget-object v3, p0, Lcom/android/browser/TabBar$TabView;->mIncognito:Landroid/view/View;

    iget-object v0, p0, Lcom/android/browser/TabBar$TabView;->mTab:Lcom/android/browser/Tab;

    invoke-virtual {v0}, Lcom/android/browser/Tab;->isPrivateBrowsingEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 307
    iget-object v0, p0, Lcom/android/browser/TabBar$TabView;->mSnapshot:Landroid/view/View;

    iget-object v3, p0, Lcom/android/browser/TabBar$TabView;->mTab:Lcom/android/browser/Tab;

    invoke-virtual {v3}, Lcom/android/browser/Tab;->isSnapshot()Z

    move-result v3

    if-eqz v3, :cond_1

    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 309
    return-void

    :cond_0
    move v0, v2

    .line 304
    goto :goto_0

    :cond_1
    move v1, v2

    .line 307
    goto :goto_1
.end method


# virtual methods
.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 8
    .parameter "canvas"

    .prologue
    .line 374
    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mCurrentTextureWidth:I
    invoke-static {v4}, Lcom/android/browser/TabBar;->access$700(Lcom/android/browser/TabBar;)I

    move-result v4

    iget-object v5, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mUi:Lcom/android/browser/XLargeUi;
    invoke-static {v5}, Lcom/android/browser/TabBar;->access$200(Lcom/android/browser/TabBar;)Lcom/android/browser/XLargeUi;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/browser/XLargeUi;->getContentWidth()I

    move-result v5

    if-ne v4, v5, :cond_0

    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mCurrentTextureHeight:I
    invoke-static {v4}, Lcom/android/browser/TabBar;->access$800(Lcom/android/browser/TabBar;)I

    move-result v4

    invoke-virtual {p0}, Lcom/android/browser/TabBar$TabView;->getHeight()I

    move-result v5

    if-eq v4, v5, :cond_1

    .line 376
    :cond_0
    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    iget-object v5, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mUi:Lcom/android/browser/XLargeUi;
    invoke-static {v5}, Lcom/android/browser/TabBar;->access$200(Lcom/android/browser/TabBar;)Lcom/android/browser/XLargeUi;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/browser/XLargeUi;->getContentWidth()I

    move-result v5

    #setter for: Lcom/android/browser/TabBar;->mCurrentTextureWidth:I
    invoke-static {v4, v5}, Lcom/android/browser/TabBar;->access$702(Lcom/android/browser/TabBar;I)I

    .line 377
    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    invoke-virtual {p0}, Lcom/android/browser/TabBar$TabView;->getHeight()I

    move-result v5

    #setter for: Lcom/android/browser/TabBar;->mCurrentTextureHeight:I
    invoke-static {v4, v5}, Lcom/android/browser/TabBar;->access$802(Lcom/android/browser/TabBar;I)I

    .line 379
    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mCurrentTextureWidth:I
    invoke-static {v4}, Lcom/android/browser/TabBar;->access$700(Lcom/android/browser/TabBar;)I

    move-result v4

    if-lez v4, :cond_1

    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mCurrentTextureHeight:I
    invoke-static {v4}, Lcom/android/browser/TabBar;->access$800(Lcom/android/browser/TabBar;)I

    move-result v4

    if-lez v4, :cond_1

    .line 380
    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mActiveDrawable:Landroid/graphics/drawable/Drawable;
    invoke-static {v4}, Lcom/android/browser/TabBar;->access$900(Lcom/android/browser/TabBar;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iget-object v5, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mCurrentTextureWidth:I
    invoke-static {v5}, Lcom/android/browser/TabBar;->access$700(Lcom/android/browser/TabBar;)I

    move-result v5

    iget-object v6, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mCurrentTextureHeight:I
    invoke-static {v6}, Lcom/android/browser/TabBar;->access$800(Lcom/android/browser/TabBar;)I

    move-result v6

    #calls: Lcom/android/browser/TabBar;->getDrawableAsBitmap(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;
    invoke-static {v4, v5, v6}, Lcom/android/browser/TabBar;->access$1000(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 382
    .local v0, activeTexture:Landroid/graphics/Bitmap;
    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mInactiveDrawable:Landroid/graphics/drawable/Drawable;
    invoke-static {v4}, Lcom/android/browser/TabBar;->access$1100(Lcom/android/browser/TabBar;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iget-object v5, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mCurrentTextureWidth:I
    invoke-static {v5}, Lcom/android/browser/TabBar;->access$700(Lcom/android/browser/TabBar;)I

    move-result v5

    iget-object v6, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mCurrentTextureHeight:I
    invoke-static {v6}, Lcom/android/browser/TabBar;->access$800(Lcom/android/browser/TabBar;)I

    move-result v6

    #calls: Lcom/android/browser/TabBar;->getDrawableAsBitmap(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;
    invoke-static {v4, v5, v6}, Lcom/android/browser/TabBar;->access$1000(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 385
    .local v1, inactiveTexture:Landroid/graphics/Bitmap;
    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    new-instance v5, Landroid/graphics/BitmapShader;

    sget-object v6, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v5, v0, v6, v7}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    #setter for: Lcom/android/browser/TabBar;->mActiveShader:Landroid/graphics/BitmapShader;
    invoke-static {v4, v5}, Lcom/android/browser/TabBar;->access$1202(Lcom/android/browser/TabBar;Landroid/graphics/BitmapShader;)Landroid/graphics/BitmapShader;

    .line 387
    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mActiveShaderPaint:Landroid/graphics/Paint;
    invoke-static {v4}, Lcom/android/browser/TabBar;->access$1300(Lcom/android/browser/TabBar;)Landroid/graphics/Paint;

    move-result-object v4

    iget-object v5, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mActiveShader:Landroid/graphics/BitmapShader;
    invoke-static {v5}, Lcom/android/browser/TabBar;->access$1200(Lcom/android/browser/TabBar;)Landroid/graphics/BitmapShader;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 389
    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    new-instance v5, Landroid/graphics/BitmapShader;

    sget-object v6, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v5, v1, v6, v7}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    #setter for: Lcom/android/browser/TabBar;->mInactiveShader:Landroid/graphics/BitmapShader;
    invoke-static {v4, v5}, Lcom/android/browser/TabBar;->access$1402(Lcom/android/browser/TabBar;Landroid/graphics/BitmapShader;)Landroid/graphics/BitmapShader;

    .line 391
    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mInactiveShaderPaint:Landroid/graphics/Paint;
    invoke-static {v4}, Lcom/android/browser/TabBar;->access$1500(Lcom/android/browser/TabBar;)Landroid/graphics/Paint;

    move-result-object v4

    iget-object v5, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mInactiveShader:Landroid/graphics/BitmapShader;
    invoke-static {v5}, Lcom/android/browser/TabBar;->access$1400(Lcom/android/browser/TabBar;)Landroid/graphics/BitmapShader;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 395
    .end local v0           #activeTexture:Landroid/graphics/Bitmap;
    .end local v1           #inactiveTexture:Landroid/graphics/Bitmap;
    :cond_1
    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mActiveShader:Landroid/graphics/BitmapShader;
    invoke-static {v4}, Lcom/android/browser/TabBar;->access$1200(Lcom/android/browser/TabBar;)Landroid/graphics/BitmapShader;

    move-result-object v4

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mInactiveShader:Landroid/graphics/BitmapShader;
    invoke-static {v4}, Lcom/android/browser/TabBar;->access$1400(Lcom/android/browser/TabBar;)Landroid/graphics/BitmapShader;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 396
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v3

    .line 397
    .local v3, state:I
    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->mWindowPos:[I

    invoke-virtual {p0, v4}, Lcom/android/browser/TabBar$TabView;->getLocationInWindow([I)V

    .line 398
    iget-boolean v4, p0, Lcom/android/browser/TabBar$TabView;->mSelected:Z

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mActiveShaderPaint:Landroid/graphics/Paint;
    invoke-static {v4}, Lcom/android/browser/TabBar;->access$1300(Lcom/android/browser/TabBar;)Landroid/graphics/Paint;

    move-result-object v2

    .line 399
    .local v2, paint:Landroid/graphics/Paint;
    :goto_0
    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->mPath:Landroid/graphics/Path;

    iget-object v5, p0, Lcom/android/browser/TabBar$TabView;->mWindowPos:[I

    const/4 v6, 0x0

    aget v5, v5, v6

    invoke-direct {p0, p1, v2, v4, v5}, Lcom/android/browser/TabBar$TabView;->drawClipped(Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Path;I)V

    .line 400
    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 402
    .end local v2           #paint:Landroid/graphics/Paint;
    .end local v3           #state:I
    :cond_2
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 403
    return-void

    .line 398
    .restart local v3       #state:I
    :cond_3
    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mInactiveShaderPaint:Landroid/graphics/Paint;
    invoke-static {v4}, Lcom/android/browser/TabBar;->access$1500(Lcom/android/browser/TabBar;)Landroid/graphics/Paint;

    move-result-object v2

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 286
    iget-object v0, p0, Lcom/android/browser/TabBar$TabView;->mClose:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_0

    .line 287
    invoke-direct {p0}, Lcom/android/browser/TabBar$TabView;->closeTab()V

    .line 289
    :cond_0
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 6
    .parameter "changed"
    .parameter "l"
    .parameter "t"
    .parameter "r"
    .parameter "b"

    .prologue
    const/4 v2, 0x0

    .line 367
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 368
    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->mPath:Landroid/graphics/Path;

    sub-int v4, p4, p2

    sub-int v5, p5, p3

    move-object v0, p0

    move v3, v2

    invoke-direct/range {v0 .. v5}, Lcom/android/browser/TabBar$TabView;->setTabPath(Landroid/graphics/Path;IIII)V

    .line 369
    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->mFocusPath:Landroid/graphics/Path;

    sub-int v4, p4, p2

    sub-int v5, p5, p3

    move-object v0, p0

    move v3, v2

    invoke-direct/range {v0 .. v5}, Lcom/android/browser/TabBar$TabView;->setFocusPath(Landroid/graphics/Path;IIII)V

    .line 370
    return-void
.end method

.method public setActivated(Z)V
    .locals 5
    .parameter "selected"

    .prologue
    const/16 v2, 0x8

    const/4 v3, 0x1

    const/4 v1, 0x0

    .line 313
    iput-boolean p1, p0, Lcom/android/browser/TabBar$TabView;->mSelected:Z

    .line 314
    iget-object v4, p0, Lcom/android/browser/TabBar$TabView;->mClose:Landroid/widget/ImageView;

    iget-boolean v0, p0, Lcom/android/browser/TabBar$TabView;->mSelected:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v4, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 315
    iget-object v0, p0, Lcom/android/browser/TabBar$TabView;->mIconView:Landroid/widget/ImageView;

    iget-boolean v4, p0, Lcom/android/browser/TabBar$TabView;->mSelected:Z

    if-eqz v4, :cond_1

    :goto_1
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 316
    iget-object v2, p0, Lcom/android/browser/TabBar$TabView;->mTitle:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mActivity:Landroid/app/Activity;
    invoke-static {v0}, Lcom/android/browser/TabBar;->access$300(Lcom/android/browser/TabBar;)Landroid/app/Activity;

    move-result-object v4

    iget-boolean v0, p0, Lcom/android/browser/TabBar$TabView;->mSelected:Z

    if-eqz v0, :cond_2

    const v0, 0x7f0f000d

    :goto_2
    invoke-virtual {v2, v4, v0}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 318
    iget-boolean v0, p0, Lcom/android/browser/TabBar$TabView;->mSelected:Z

    if-nez v0, :cond_3

    move v0, v3

    :goto_3
    invoke-virtual {p0, v0}, Lcom/android/browser/TabBar$TabView;->setHorizontalFadingEdgeEnabled(Z)V

    .line 319
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setActivated(Z)V

    .line 320
    invoke-virtual {p0}, Lcom/android/browser/TabBar$TabView;->updateLayoutParams()V

    .line 321
    if-nez p1, :cond_4

    :goto_4
    invoke-virtual {p0, v3}, Lcom/android/browser/TabBar$TabView;->setFocusable(Z)V

    .line 322
    invoke-virtual {p0}, Lcom/android/browser/TabBar$TabView;->postInvalidate()V

    .line 323
    return-void

    :cond_0
    move v0, v2

    .line 314
    goto :goto_0

    :cond_1
    move v2, v1

    .line 315
    goto :goto_1

    .line 316
    :cond_2
    const v0, 0x7f0f000e

    goto :goto_2

    :cond_3
    move v0, v1

    .line 318
    goto :goto_3

    :cond_4
    move v3, v1

    .line 321
    goto :goto_4
.end method

.method setDisplayTitle(Ljava/lang/String;)V
    .locals 2
    .parameter "title"

    .prologue
    .line 336
    const-string v0, "about:blank"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 337
    iget-object v0, p0, Lcom/android/browser/TabBar$TabView;->mTitle:Landroid/widget/TextView;

    const-string v1, "about:blank"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 342
    :goto_0
    return-void

    .line 339
    :cond_0
    iget-object v0, p0, Lcom/android/browser/TabBar$TabView;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method setFavicon(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .parameter "d"

    .prologue
    .line 345
    iget-object v0, p0, Lcom/android/browser/TabBar$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 346
    return-void
.end method

.method setLock(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .parameter "d"

    .prologue
    .line 349
    if-nez p1, :cond_0

    .line 350
    iget-object v0, p0, Lcom/android/browser/TabBar$TabView;->mLock:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 355
    :goto_0
    return-void

    .line 352
    :cond_0
    iget-object v0, p0, Lcom/android/browser/TabBar$TabView;->mLock:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 353
    iget-object v0, p0, Lcom/android/browser/TabBar$TabView;->mLock:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method

.method public updateLayoutParams()V
    .locals 2

    .prologue
    .line 326
    invoke-virtual {p0}, Lcom/android/browser/TabBar$TabView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 327
    .local v0, lp:Landroid/widget/LinearLayout$LayoutParams;
    iget-object v1, p0, Lcom/android/browser/TabBar$TabView;->this$0:Lcom/android/browser/TabBar;

    #getter for: Lcom/android/browser/TabBar;->mTabWidth:I
    invoke-static {v1}, Lcom/android/browser/TabBar;->access$400(Lcom/android/browser/TabBar;)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 328
    const/4 v1, -0x1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 329
    invoke-virtual {p0, v0}, Lcom/android/browser/TabBar$TabView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 330
    return-void
.end method
