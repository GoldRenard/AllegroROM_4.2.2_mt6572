.class public Lcom/android/browser/BrowserWebView;
.super Landroid/webkit/WebView;
.source "BrowserWebView.java"

# interfaces
.implements Landroid/webkit/WebViewClassic$TitleBarDelegate;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/BrowserWebView$OnScrollChangedListener;
    }
.end annotation


# instance fields
.field private mBackgroundRemoved:Z

.field private mOnScrollChangedListener:Lcom/android/browser/BrowserWebView$OnScrollChangedListener;

.field private mTitleBar:Lcom/android/browser/TitleBar;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 74
    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 37
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/BrowserWebView;->mBackgroundRemoved:Z

    .line 75
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 67
    invoke-direct {p0, p1, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/BrowserWebView;->mBackgroundRemoved:Z

    .line 68
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILjava/util/Map;Z)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"
    .parameter
    .parameter "privateBrowsing"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/util/AttributeSet;",
            "I",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 49
    .local p4, javascriptInterfaces:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct/range {p0 .. p5}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILjava/util/Map;Z)V

    .line 37
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/BrowserWebView;->mBackgroundRemoved:Z

    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IZ)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"
    .parameter "privateBrowsing"

    .prologue
    .line 59
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IZ)V

    .line 37
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/BrowserWebView;->mBackgroundRemoved:Z

    .line 60
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .prologue
    .line 135
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/browser/BrowserWebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/browser/BrowserSettings;->stopManagingSettings(Landroid/webkit/WebSettings;)V

    .line 136
    invoke-super {p0}, Landroid/webkit/WebView;->destroy()V

    .line 137
    return-void
.end method

.method public drawContent(Landroid/graphics/Canvas;)V
    .locals 0
    .parameter "c"

    .prologue
    .line 110
    invoke-virtual {p0, p1}, Lcom/android/browser/BrowserWebView;->onDraw(Landroid/graphics/Canvas;)V

    .line 111
    return-void
.end method

.method public getTitleHeight()I
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/android/browser/BrowserWebView;->mTitleBar:Lcom/android/browser/TitleBar;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/BrowserWebView;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->getEmbeddedHeight()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasTitleBar()Z
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/android/browser/BrowserWebView;->mTitleBar:Lcom/android/browser/TitleBar;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1
    .parameter "c"

    .prologue
    .line 98
    invoke-super {p0, p1}, Landroid/webkit/WebView;->onDraw(Landroid/graphics/Canvas;)V

    .line 99
    iget-boolean v0, p0, Lcom/android/browser/BrowserWebView;->mBackgroundRemoved:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/browser/BrowserWebView;->getRootView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 100
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/browser/BrowserWebView;->mBackgroundRemoved:Z

    .line 101
    new-instance v0, Lcom/android/browser/BrowserWebView$1;

    invoke-direct {v0, p0}, Lcom/android/browser/BrowserWebView$1;-><init>(Lcom/android/browser/BrowserWebView;)V

    invoke-virtual {p0, v0}, Lcom/android/browser/BrowserWebView;->post(Ljava/lang/Runnable;)Z

    .line 107
    :cond_0
    return-void
.end method

.method protected onScrollChanged(IIII)V
    .locals 1
    .parameter "l"
    .parameter "t"
    .parameter "oldl"
    .parameter "oldt"

    .prologue
    .line 115
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebView;->onScrollChanged(IIII)V

    .line 116
    iget-object v0, p0, Lcom/android/browser/BrowserWebView;->mTitleBar:Lcom/android/browser/TitleBar;

    if-eqz v0, :cond_0

    .line 117
    iget-object v0, p0, Lcom/android/browser/BrowserWebView;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->onScrollChanged()V

    .line 119
    :cond_0
    iget-object v0, p0, Lcom/android/browser/BrowserWebView;->mOnScrollChangedListener:Lcom/android/browser/BrowserWebView$OnScrollChangedListener;

    if-eqz v0, :cond_1

    .line 120
    iget-object v0, p0, Lcom/android/browser/BrowserWebView;->mOnScrollChangedListener:Lcom/android/browser/BrowserWebView$OnScrollChangedListener;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/android/browser/BrowserWebView$OnScrollChangedListener;->onScrollChanged(IIII)V

    .line 122
    :cond_1
    return-void
.end method

.method public onSetEmbeddedTitleBar(Landroid/view/View;)V
    .locals 0
    .parameter "title"

    .prologue
    .line 90
    return-void
.end method

.method public setOnScrollChangedListener(Lcom/android/browser/BrowserWebView$OnScrollChangedListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 125
    iput-object p1, p0, Lcom/android/browser/BrowserWebView;->mOnScrollChangedListener:Lcom/android/browser/BrowserWebView$OnScrollChangedListener;

    .line 126
    return-void
.end method

.method public setTitleBar(Lcom/android/browser/TitleBar;)V
    .locals 0
    .parameter "title"

    .prologue
    .line 78
    iput-object p1, p0, Lcom/android/browser/BrowserWebView;->mTitleBar:Lcom/android/browser/TitleBar;

    .line 79
    return-void
.end method

.method public showContextMenuForChild(Landroid/view/View;)Z
    .locals 1
    .parameter "originalView"

    .prologue
    .line 130
    const/4 v0, 0x0

    return v0
.end method
