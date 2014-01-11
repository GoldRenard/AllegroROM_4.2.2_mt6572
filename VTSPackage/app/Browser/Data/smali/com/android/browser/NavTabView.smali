.class public Lcom/android/browser/NavTabView;
.super Landroid/widget/LinearLayout;
.source "NavTabView.java"


# instance fields
.field private mClickListener:Landroid/view/View$OnClickListener;

.field private mClose:Landroid/widget/ImageView;

.field private mContent:Landroid/view/ViewGroup;

.field private mHighlighted:Z

.field mImage:Landroid/widget/ImageView;

.field private mTab:Lcom/android/browser/Tab;

.field private mTitle:Landroid/widget/TextView;

.field private mTitleBar:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 52
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 53
    invoke-direct {p0}, Lcom/android/browser/NavTabView;->init()V

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 48
    invoke-direct {p0}, Lcom/android/browser/NavTabView;->init()V

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 42
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 43
    invoke-direct {p0}, Lcom/android/browser/NavTabView;->init()V

    .line 44
    return-void
.end method

.method private init()V
    .locals 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/android/browser/NavTabView;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f040022

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 58
    const v0, 0x7f0d0009

    invoke-virtual {p0, v0}, Lcom/android/browser/NavTabView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/browser/NavTabView;->mContent:Landroid/view/ViewGroup;

    .line 59
    const v0, 0x7f0d0061

    invoke-virtual {p0, v0}, Lcom/android/browser/NavTabView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/browser/NavTabView;->mClose:Landroid/widget/ImageView;

    .line 60
    const v0, 0x7f0d0007

    invoke-virtual {p0, v0}, Lcom/android/browser/NavTabView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/browser/NavTabView;->mTitle:Landroid/widget/TextView;

    .line 61
    const v0, 0x7f0d0060

    invoke-virtual {p0, v0}, Lcom/android/browser/NavTabView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/NavTabView;->mTitleBar:Landroid/view/View;

    .line 62
    const v0, 0x7f0d0003

    invoke-virtual {p0, v0}, Lcom/android/browser/NavTabView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/browser/NavTabView;->mImage:Landroid/widget/ImageView;

    .line 63
    return-void
.end method

.method private setTitle()V
    .locals 3

    .prologue
    .line 78
    iget-object v1, p0, Lcom/android/browser/NavTabView;->mTab:Lcom/android/browser/Tab;

    if-nez v1, :cond_0

    .line 95
    :goto_0
    return-void

    .line 79
    :cond_0
    iget-boolean v1, p0, Lcom/android/browser/NavTabView;->mHighlighted:Z

    if-eqz v1, :cond_1

    .line 80
    iget-object v1, p0, Lcom/android/browser/NavTabView;->mTitle:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/android/browser/NavTabView;->mTab:Lcom/android/browser/Tab;

    invoke-virtual {v2}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    :goto_1
    iget-object v1, p0, Lcom/android/browser/NavTabView;->mTab:Lcom/android/browser/Tab;

    invoke-virtual {v1}, Lcom/android/browser/Tab;->isSnapshot()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 89
    const v1, 0x7f020037

    invoke-direct {p0, v1}, Lcom/android/browser/NavTabView;->setTitleIcon(I)V

    goto :goto_0

    .line 82
    :cond_1
    iget-object v1, p0, Lcom/android/browser/NavTabView;->mTab:Lcom/android/browser/Tab;

    invoke-virtual {v1}, Lcom/android/browser/Tab;->getTitle()Ljava/lang/String;

    move-result-object v0

    .line 83
    .local v0, txt:Ljava/lang/String;
    if-nez v0, :cond_2

    .line 84
    iget-object v1, p0, Lcom/android/browser/NavTabView;->mTab:Lcom/android/browser/Tab;

    invoke-virtual {v1}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v0

    .line 86
    :cond_2
    iget-object v1, p0, Lcom/android/browser/NavTabView;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 90
    .end local v0           #txt:Ljava/lang/String;
    :cond_3
    iget-object v1, p0, Lcom/android/browser/NavTabView;->mTab:Lcom/android/browser/Tab;

    invoke-virtual {v1}, Lcom/android/browser/Tab;->isPrivateBrowsingEnabled()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 91
    const v1, 0x7f02003a

    invoke-direct {p0, v1}, Lcom/android/browser/NavTabView;->setTitleIcon(I)V

    goto :goto_0

    .line 93
    :cond_4
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/android/browser/NavTabView;->setTitleIcon(I)V

    goto :goto_0
.end method

.method private setTitleIcon(I)V
    .locals 3
    .parameter "id"

    .prologue
    const/4 v2, 0x0

    .line 98
    if-nez p1, :cond_0

    .line 99
    iget-object v0, p0, Lcom/android/browser/NavTabView;->mTitle:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/browser/NavTabView;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getCompoundDrawablePadding()I

    move-result v1

    invoke-virtual {v0, v1, v2, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 103
    :goto_0
    iget-object v0, p0, Lcom/android/browser/NavTabView;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1, v2, v2, v2}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 104
    return-void

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/android/browser/NavTabView;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    goto :goto_0
.end method


# virtual methods
.method protected isClose(Landroid/view/View;)Z
    .locals 1
    .parameter "v"

    .prologue
    .line 66
    iget-object v0, p0, Lcom/android/browser/NavTabView;->mClose:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isHighlighted()Z
    .locals 1

    .prologue
    .line 107
    iget-boolean v0, p0, Lcom/android/browser/NavTabView;->mHighlighted:Z

    return v0
.end method

.method protected isTitle(Landroid/view/View;)Z
    .locals 1
    .parameter "v"

    .prologue
    .line 70
    iget-object v0, p0, Lcom/android/browser/NavTabView;->mTitleBar:Landroid/view/View;

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isWebView(Landroid/view/View;)Z
    .locals 1
    .parameter "v"

    .prologue
    .line 74
    iget-object v0, p0, Lcom/android/browser/NavTabView;->mImage:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 2
    .parameter "listener"

    .prologue
    .line 124
    iput-object p1, p0, Lcom/android/browser/NavTabView;->mClickListener:Landroid/view/View$OnClickListener;

    .line 125
    iget-object v0, p0, Lcom/android/browser/NavTabView;->mTitleBar:Landroid/view/View;

    iget-object v1, p0, Lcom/android/browser/NavTabView;->mClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    iget-object v0, p0, Lcom/android/browser/NavTabView;->mClose:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/browser/NavTabView;->mClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 127
    iget-object v0, p0, Lcom/android/browser/NavTabView;->mImage:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 128
    iget-object v0, p0, Lcom/android/browser/NavTabView;->mImage:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/browser/NavTabView;->mClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 130
    :cond_0
    return-void
.end method

.method protected setWebView(Lcom/android/browser/Tab;)V
    .locals 3
    .parameter "tab"

    .prologue
    .line 111
    iput-object p1, p0, Lcom/android/browser/NavTabView;->mTab:Lcom/android/browser/Tab;

    .line 112
    invoke-direct {p0}, Lcom/android/browser/NavTabView;->setTitle()V

    .line 113
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getScreenshot()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 114
    .local v0, image:Landroid/graphics/Bitmap;
    if-eqz v0, :cond_0

    .line 115
    iget-object v1, p0, Lcom/android/browser/NavTabView;->mImage:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 116
    if-eqz p1, :cond_0

    .line 117
    iget-object v1, p0, Lcom/android/browser/NavTabView;->mImage:Landroid/widget/ImageView;

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 120
    :cond_0
    return-void
.end method
