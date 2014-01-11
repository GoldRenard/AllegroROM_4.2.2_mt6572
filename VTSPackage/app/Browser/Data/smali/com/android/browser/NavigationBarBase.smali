.class public Lcom/android/browser/NavigationBarBase;
.super Landroid/widget/LinearLayout;
.source "NavigationBarBase.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/browser/UrlInputView$UrlInputListener;
.implements Landroid/view/View$OnFocusChangeListener;
.implements Landroid/text/TextWatcher;


# instance fields
.field protected mBaseUi:Lcom/android/browser/BaseUi;

.field private mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

.field private mFavicon:Landroid/widget/ImageView;

.field protected mInVoiceMode:Z

.field private mLockIcon:Landroid/widget/ImageView;

.field protected mTitleBar:Lcom/android/browser/TitleBar;

.field protected mUiController:Lcom/android/browser/UiController;

.field protected mUrlInput:Lcom/android/browser/UrlInputView;

.field private mWarningDialog:Landroid/app/AlertDialog;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 61
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/NavigationBarBase;->mInVoiceMode:Z

    .line 58
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/NavigationBarBase;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 62
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 65
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/NavigationBarBase;->mInVoiceMode:Z

    .line 58
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/NavigationBarBase;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 69
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/NavigationBarBase;->mInVoiceMode:Z

    .line 58
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/NavigationBarBase;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 70
    return-void
.end method

.method static synthetic access$000(Lcom/android/browser/NavigationBarBase;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/android/browser/NavigationBarBase;->showWarningDialog()V

    return-void
.end method

.method private showWarningDialog()V
    .locals 3

    .prologue
    .line 124
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mWarningDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mWarningDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 125
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mWarningDialog:Landroid/app/AlertDialog;

    const v1, 0x7f0c0039

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setTitle(I)V

    .line 126
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mWarningDialog:Landroid/app/AlertDialog;

    invoke-virtual {p0}, Lcom/android/browser/NavigationBarBase;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0c0038

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 127
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mWarningDialog:Landroid/app/AlertDialog;

    invoke-virtual {p0}, Lcom/android/browser/NavigationBarBase;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0c003a

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/android/browser/NavigationBarBase$2;

    invoke-direct {v2, p0}, Lcom/android/browser/NavigationBarBase$2;-><init>(Lcom/android/browser/NavigationBarBase;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog;->setButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 133
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mWarningDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 135
    :cond_0
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .parameter "s"

    .prologue
    .line 366
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "count"
    .parameter "after"

    .prologue
    .line 360
    return-void
.end method

.method clearCompletions()V
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v0}, Lcom/android/browser/UrlInputView;->dismissDropDown()V

    .line 219
    return-void
.end method

.method public dispatchKeyEventPreIme(Landroid/view/KeyEvent;)Z
    .locals 2
    .parameter "evt"

    .prologue
    .line 312
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 314
    invoke-virtual {p0}, Lcom/android/browser/NavigationBarBase;->stopEditingUrl()V

    .line 315
    const/4 v0, 0x1

    .line 317
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchKeyEventPreIme(Landroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public getUrlInputView()Lcom/android/browser/UrlInputView;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    return-object v0
.end method

.method public isEditingUrl()Z
    .locals 1

    .prologue
    .line 189
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v0}, Lcom/android/browser/UrlInputView;->hasFocus()Z

    move-result v0

    return v0
.end method

.method public isMenuShowing()Z
    .locals 1

    .prologue
    .line 348
    const/4 v0, 0x0

    return v0
.end method

.method public onAction(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .parameter "text"
    .parameter "extra"
    .parameter "source"

    .prologue
    .line 229
    invoke-virtual {p0}, Lcom/android/browser/NavigationBarBase;->stopEditingUrl()V

    .line 230
    const-string v5, "browser-type"

    invoke-virtual {v5, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 231
    const/4 v5, 0x0

    invoke-static {p1, v5}, Lcom/android/browser/UrlUtils;->smartUrlFilter(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    .line 232
    .local v4, url:Ljava/lang/String;
    iget-object v5, p0, Lcom/android/browser/NavigationBarBase;->mBaseUi:Lcom/android/browser/BaseUi;

    invoke-virtual {v5}, Lcom/android/browser/BaseUi;->getActiveTab()Lcom/android/browser/Tab;

    move-result-object v3

    .line 235
    .local v3, t:Lcom/android/browser/Tab;
    if-eqz v4, :cond_0

    if-eqz v3, :cond_0

    const-string v5, "javascript:"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 236
    iget-object v5, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v5, v3, v4}, Lcom/android/browser/UiController;->loadUrl(Lcom/android/browser/Tab;Ljava/lang/String;)V

    .line 237
    invoke-virtual {p0, p1}, Lcom/android/browser/NavigationBarBase;->setDisplayTitle(Ljava/lang/String;)V

    .line 279
    .end local v3           #t:Lcom/android/browser/Tab;
    .end local v4           #url:Ljava/lang/String;
    :goto_0
    return-void

    .line 241
    :cond_0
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 242
    .local v2, i:Landroid/content/Intent;
    if-eqz p1, :cond_2

    const-string v5, "content://"

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 243
    const-string v5, "android.intent.action.VIEW"

    invoke-virtual {v2, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 244
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 277
    :cond_1
    :goto_1
    iget-object v5, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v5, v2}, Lcom/android/browser/UiController;->handleNewIntent(Landroid/content/Intent;)V

    .line 278
    invoke-virtual {p0, p1}, Lcom/android/browser/NavigationBarBase;->setDisplayTitle(Ljava/lang/String;)V

    goto :goto_0

    .line 246
    :cond_2
    if-eqz p1, :cond_3

    const-string v5, "rtsp://"

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 247
    const-string v5, "android.intent.action.VIEW"

    invoke-virtual {v2, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 248
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_1

    .line 251
    :cond_3
    if-eqz p1, :cond_4

    const-string v5, "wtai://wp/mc;"

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 252
    const-string v5, "android.intent.action.VIEW"

    invoke-virtual {v2, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 253
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "tel:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "wtai://wp/mc;"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {p1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_1

    .line 265
    :cond_4
    const-string v0, "android.intent.action.SEARCH"

    .line 266
    .local v0, action:Ljava/lang/String;
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 267
    const-string v5, "query"

    invoke-virtual {v2, v5, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 268
    if-eqz p2, :cond_5

    .line 269
    const-string v5, "intent_extra_data_key"

    invoke-virtual {v2, v5, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 271
    :cond_5
    if-eqz p3, :cond_1

    .line 272
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 273
    .local v1, appData:Landroid/os/Bundle;
    const-string v5, "source"

    invoke-virtual {v1, v5, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    const-string v5, "app_data"

    invoke-virtual {v2, v5, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    goto :goto_1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0
    .parameter "v"

    .prologue
    .line 161
    return-void
.end method

.method public onCopySuggestion(Ljava/lang/String;)V
    .locals 2
    .parameter "text"

    .prologue
    .line 301
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/android/browser/UrlInputView;->setText(Ljava/lang/CharSequence;Z)V

    .line 302
    if-eqz p1, :cond_0

    .line 303
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/browser/UrlInputView;->setSelection(I)V

    .line 305
    :cond_0
    return-void
.end method

.method public onDismiss()V
    .locals 2

    .prologue
    .line 283
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mBaseUi:Lcom/android/browser/BaseUi;

    invoke-virtual {v1}, Lcom/android/browser/BaseUi;->getActiveTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 284
    .local v0, currentTab:Lcom/android/browser/Tab;
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mBaseUi:Lcom/android/browser/BaseUi;

    invoke-virtual {v1}, Lcom/android/browser/BaseUi;->hideTitleBar()V

    .line 285
    new-instance v1, Lcom/android/browser/NavigationBarBase$3;

    invoke-direct {v1, p0, v0}, Lcom/android/browser/NavigationBarBase$3;-><init>(Lcom/android/browser/NavigationBarBase;Lcom/android/browser/Tab;)V

    invoke-virtual {p0, v1}, Lcom/android/browser/NavigationBarBase;->post(Ljava/lang/Runnable;)Z

    .line 293
    return-void
.end method

.method protected onFinishInflate()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 78
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 79
    const v2, 0x7f0d007e

    invoke-virtual {p0, v2}, Lcom/android/browser/NavigationBarBase;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/browser/NavigationBarBase;->mLockIcon:Landroid/widget/ImageView;

    .line 80
    const v2, 0x7f0d0006

    invoke-virtual {p0, v2}, Lcom/android/browser/NavigationBarBase;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/browser/NavigationBarBase;->mFavicon:Landroid/widget/ImageView;

    .line 81
    const v2, 0x7f0d0008

    invoke-virtual {p0, v2}, Lcom/android/browser/NavigationBarBase;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/browser/UrlInputView;

    iput-object v2, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    .line 82
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v2, p0}, Lcom/android/browser/UrlInputView;->setUrlInputListener(Lcom/android/browser/UrlInputView$UrlInputListener;)V

    .line 83
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v2, p0}, Lcom/android/browser/UrlInputView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 84
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v2, v4}, Lcom/android/browser/UrlInputView;->setSelectAllOnFocus(Z)V

    .line 85
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v2, p0}, Lcom/android/browser/UrlInputView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 88
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v2

    iput-object v2, p0, Lcom/android/browser/NavigationBarBase;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 89
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-interface {v2}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->shouldCheckUrlLengthLimit()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 90
    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/android/browser/NavigationBarBase;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/android/browser/NavigationBarBase;->mWarningDialog:Landroid/app/AlertDialog;

    .line 93
    new-array v0, v4, [Landroid/text/InputFilter;

    .line 94
    .local v0, contentFilters:[Landroid/text/InputFilter;
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/high16 v3, 0x20b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    .line 96
    .local v1, nLimit:I
    const/4 v2, 0x0

    new-instance v3, Lcom/android/browser/NavigationBarBase$1;

    invoke-direct {v3, p0, v1, v1}, Lcom/android/browser/NavigationBarBase$1;-><init>(Lcom/android/browser/NavigationBarBase;II)V

    aput-object v3, v0, v2

    .line 114
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v2, v0}, Lcom/android/browser/UrlInputView;->setFilters([Landroid/text/InputFilter;)V

    .line 117
    .end local v0           #contentFilters:[Landroid/text/InputFilter;
    .end local v1           #nLimit:I
    :cond_0
    return-void
.end method

.method public onFocusChange(Landroid/view/View;Z)V
    .locals 2
    .parameter "view"
    .parameter "hasFocus"

    .prologue
    .line 166
    if-nez p2, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->isInTouchMode()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v1}, Lcom/android/browser/UrlInputView;->needsUpdate()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 167
    :cond_0
    invoke-virtual {p0, p2}, Lcom/android/browser/NavigationBarBase;->setFocusState(Z)V

    .line 169
    :cond_1
    if-eqz p2, :cond_3

    .line 170
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mBaseUi:Lcom/android/browser/BaseUi;

    invoke-virtual {v1}, Lcom/android/browser/BaseUi;->showTitleBar()V

    .line 182
    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v1}, Lcom/android/browser/UrlInputView;->clearNeedsUpdate()V

    .line 183
    return-void

    .line 171
    :cond_3
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v1}, Lcom/android/browser/UrlInputView;->needsUpdate()Z

    move-result v1

    if-nez v1, :cond_2

    .line 172
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v1}, Lcom/android/browser/UrlInputView;->dismissDropDown()V

    .line 173
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v1}, Lcom/android/browser/UrlInputView;->hideIME()V

    .line 174
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v1}, Lcom/android/browser/UrlInputView;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v1

    if-nez v1, :cond_4

    .line 175
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v1}, Lcom/android/browser/UiController;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 176
    .local v0, currentTab:Lcom/android/browser/Tab;
    if-eqz v0, :cond_4

    .line 177
    invoke-virtual {v0}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/browser/NavigationBarBase;->setDisplayTitle(Ljava/lang/String;)V

    .line 180
    .end local v0           #currentTab:Lcom/android/browser/Tab;
    :cond_4
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mBaseUi:Lcom/android/browser/BaseUi;

    invoke-virtual {v1}, Lcom/android/browser/BaseUi;->suggestHideTitleBar()V

    goto :goto_0
.end method

.method public onProgressStarted()V
    .locals 0

    .prologue
    .line 342
    return-void
.end method

.method public onProgressStopped()V
    .locals 0

    .prologue
    .line 345
    return-void
.end method

.method public onTabDataChanged(Lcom/android/browser/Tab;)V
    .locals 0
    .parameter "tab"

    .prologue
    .line 352
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "before"
    .parameter "count"

    .prologue
    .line 363
    return-void
.end method

.method public onVoiceResult(Ljava/lang/String;)V
    .locals 1
    .parameter "s"

    .prologue
    const/4 v0, 0x1

    .line 355
    invoke-virtual {p0, v0, v0}, Lcom/android/browser/NavigationBarBase;->startEditingUrl(ZZ)V

    .line 356
    invoke-virtual {p0, p1}, Lcom/android/browser/NavigationBarBase;->onCopySuggestion(Ljava/lang/String;)V

    .line 357
    return-void
.end method

.method public setCurrentUrlIsBookmark(Z)V
    .locals 0
    .parameter "isBookmark"

    .prologue
    .line 308
    return-void
.end method

.method setDisplayTitle(Ljava/lang/String;)V
    .locals 3
    .parameter "title"

    .prologue
    const/4 v2, 0x0

    .line 200
    invoke-virtual {p0}, Lcom/android/browser/NavigationBarBase;->isEditingUrl()Z

    move-result v0

    if-nez v0, :cond_0

    .line 204
    const-string v0, "about:blank"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 205
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    const-string v1, "about:blank"

    invoke-virtual {v0, v1, v2}, Lcom/android/browser/UrlInputView;->setText(Ljava/lang/CharSequence;Z)V

    .line 211
    :cond_0
    :goto_0
    return-void

    .line 207
    :cond_1
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v0, p1, v2}, Lcom/android/browser/UrlInputView;->setText(Ljava/lang/CharSequence;Z)V

    goto :goto_0
.end method

.method public setFavicon(Landroid/graphics/Bitmap;)V
    .locals 2
    .parameter "icon"

    .prologue
    .line 155
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mFavicon:Landroid/widget/ImageView;

    if-nez v0, :cond_0

    .line 157
    :goto_0
    return-void

    .line 156
    :cond_0
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mFavicon:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mBaseUi:Lcom/android/browser/BaseUi;

    invoke-virtual {v1, p1}, Lcom/android/browser/BaseUi;->getFaviconDrawable(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method protected setFocusState(Z)V
    .locals 0
    .parameter "focus"

    .prologue
    .line 186
    return-void
.end method

.method setIncognitoMode(Z)V
    .locals 1
    .parameter "incognito"

    .prologue
    .line 214
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v0, p1}, Lcom/android/browser/UrlInputView;->setIncognitoMode(Z)V

    .line 215
    return-void
.end method

.method public setLock(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .parameter "d"

    .prologue
    .line 145
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mLockIcon:Landroid/widget/ImageView;

    if-nez v0, :cond_0

    .line 152
    :goto_0
    return-void

    .line 146
    :cond_0
    if-nez p1, :cond_1

    .line 147
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mLockIcon:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    .line 149
    :cond_1
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mLockIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 150
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mLockIcon:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method

.method public setTitleBar(Lcom/android/browser/TitleBar;)V
    .locals 2
    .parameter "titleBar"

    .prologue
    .line 138
    iput-object p1, p0, Lcom/android/browser/NavigationBarBase;->mTitleBar:Lcom/android/browser/TitleBar;

    .line 139
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->getUi()Lcom/android/browser/BaseUi;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/NavigationBarBase;->mBaseUi:Lcom/android/browser/BaseUi;

    .line 140
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->getUiController()Lcom/android/browser/UiController;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    .line 141
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-virtual {v0, v1}, Lcom/android/browser/UrlInputView;->setController(Lcom/android/browser/UiController;)V

    .line 142
    return-void
.end method

.method startEditingUrl(ZZ)V
    .locals 2
    .parameter "clearInput"
    .parameter "forceIME"

    .prologue
    .line 326
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/browser/NavigationBarBase;->setVisibility(I)V

    .line 327
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->useQuickControls()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 328
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->getProgressView()Lcom/android/browser/PageProgressView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/browser/PageProgressView;->setVisibility(I)V

    .line 330
    :cond_0
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v0}, Lcom/android/browser/UrlInputView;->hasFocus()Z

    move-result v0

    if-nez v0, :cond_1

    .line 331
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v0}, Lcom/android/browser/UrlInputView;->requestFocus()Z

    .line 333
    :cond_1
    if-eqz p1, :cond_2

    .line 334
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/android/browser/UrlInputView;->setText(Ljava/lang/CharSequence;)V

    .line 336
    :cond_2
    if-eqz p2, :cond_3

    .line 337
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v0}, Lcom/android/browser/UrlInputView;->showIME()V

    .line 339
    :cond_3
    return-void
.end method

.method stopEditingUrl()V
    .locals 2

    .prologue
    .line 193
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v1}, Lcom/android/browser/UiController;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v0

    .line 194
    .local v0, currentTopWebView:Landroid/webkit/WebView;
    if-eqz v0, :cond_0

    .line 195
    invoke-virtual {v0}, Landroid/webkit/WebView;->requestFocus()Z

    .line 197
    :cond_0
    return-void
.end method
