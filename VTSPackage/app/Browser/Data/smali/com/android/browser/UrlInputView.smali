.class public Lcom/android/browser/UrlInputView;
.super Landroid/widget/AutoCompleteTextView;
.source "UrlInputView.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Lcom/android/browser/SuggestionsAdapter$CompletionListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/UrlInputView$UrlInputListener;,
        Lcom/android/browser/UrlInputView$StateListener;
    }
.end annotation


# static fields
.field static final POST_DELAY:I = 0x64

.field static final SUGGESTED:Ljava/lang/String; = "browser-suggest"

.field static final TYPED:Ljava/lang/String; = "browser-type"


# instance fields
.field private mAdapter:Lcom/android/browser/SuggestionsAdapter;

.field private mContainer:Landroid/view/View;

.field private mIncognitoMode:Z

.field private mInputManager:Landroid/view/inputmethod/InputMethodManager;

.field private mIsActionMode:Z

.field private mLandscape:Z

.field private mListener:Lcom/android/browser/UrlInputView$UrlInputListener;

.field private mNeedsUpdate:Z

.field private mPopupPadding:Landroid/graphics/Rect;

.field private mState:I

.field private mStateListener:Lcom/android/browser/UrlInputView$StateListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 99
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/browser/UrlInputView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 100
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 95
    const v0, 0x101006b

    invoke-direct {p0, p1, p2, v0}, Lcom/android/browser/UrlInputView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 96
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v4, 0x0

    .line 82
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/AutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 83
    sget-object v2, Lcom/android/internal/R$styleable;->PopupWindow:[I

    const v3, 0x101006b

    invoke-virtual {p1, p2, v2, v3, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 87
    .local v0, a:Landroid/content/res/TypedArray;
    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 88
    .local v1, popupbg:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 89
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/android/browser/UrlInputView;->mPopupPadding:Landroid/graphics/Rect;

    .line 90
    iget-object v2, p0, Lcom/android/browser/UrlInputView;->mPopupPadding:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 91
    invoke-direct {p0, p1}, Lcom/android/browser/UrlInputView;->init(Landroid/content/Context;)V

    .line 92
    return-void
.end method

.method static synthetic access$000(Lcom/android/browser/UrlInputView;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/android/browser/UrlInputView;->changeState(I)V

    return-void
.end method

.method private changeState(I)V
    .locals 2
    .parameter "newState"

    .prologue
    .line 191
    iput p1, p0, Lcom/android/browser/UrlInputView;->mState:I

    .line 192
    iget-object v0, p0, Lcom/android/browser/UrlInputView;->mStateListener:Lcom/android/browser/UrlInputView$StateListener;

    if-eqz v0, :cond_0

    .line 193
    iget-object v0, p0, Lcom/android/browser/UrlInputView;->mStateListener:Lcom/android/browser/UrlInputView$StateListener;

    iget v1, p0, Lcom/android/browser/UrlInputView;->mState:I

    invoke-interface {v0, v1}, Lcom/android/browser/UrlInputView$StateListener;->onStateChanged(I)V

    .line 195
    :cond_0
    return-void
.end method

.method private finishInput(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .parameter "url"
    .parameter "extra"
    .parameter "source"

    .prologue
    .line 258
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/browser/UrlInputView;->mNeedsUpdate:Z

    .line 259
    invoke-virtual {p0}, Lcom/android/browser/UrlInputView;->dismissDropDown()V

    .line 260
    iget-object v2, p0, Lcom/android/browser/UrlInputView;->mInputManager:Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {p0}, Lcom/android/browser/UrlInputView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 261
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 262
    iget-object v2, p0, Lcom/android/browser/UrlInputView;->mListener:Lcom/android/browser/UrlInputView$UrlInputListener;

    invoke-interface {v2}, Lcom/android/browser/UrlInputView$UrlInputListener;->onDismiss()V

    .line 278
    :cond_0
    :goto_0
    return-void

    .line 264
    :cond_1
    iget-boolean v2, p0, Lcom/android/browser/UrlInputView;->mIncognitoMode:Z

    if-eqz v2, :cond_2

    invoke-virtual {p0, p1}, Lcom/android/browser/UrlInputView;->isSearch(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 267
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/browser/BrowserSettings;->getSearchEngine()Lcom/android/browser/search/SearchEngine;

    move-result-object v1

    .line 269
    .local v1, searchEngine:Lcom/android/browser/search/SearchEngine;
    if-eqz v1, :cond_0

    .line 270
    iget-object v2, p0, Lcom/android/browser/UrlInputView;->mContext:Landroid/content/Context;

    invoke-interface {v1}, Lcom/android/browser/search/SearchEngine;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/browser/search/SearchEngines;->getSearchEngineInfo(Landroid/content/Context;Ljava/lang/String;)Lcom/mediatek/common/search/SearchEngineInfo;

    move-result-object v0

    .line 272
    .local v0, engineInfo:Lcom/mediatek/common/search/SearchEngineInfo;
    if-eqz v0, :cond_0

    .line 273
    invoke-virtual {v0, p1}, Lcom/mediatek/common/search/SearchEngineInfo;->getSearchUriForQuery(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 276
    .end local v0           #engineInfo:Lcom/mediatek/common/search/SearchEngineInfo;
    .end local v1           #searchEngine:Lcom/android/browser/search/SearchEngine;
    :cond_2
    iget-object v2, p0, Lcom/android/browser/UrlInputView;->mListener:Lcom/android/browser/UrlInputView$UrlInputListener;

    invoke-interface {v2, p1, p2, p3}, Lcom/android/browser/UrlInputView$UrlInputListener;->onAction(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private init(Landroid/content/Context;)V
    .locals 3
    .parameter "ctx"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 103
    const-string v0, "input_method"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    iput-object v0, p0, Lcom/android/browser/UrlInputView;->mInputManager:Landroid/view/inputmethod/InputMethodManager;

    .line 104
    invoke-virtual {p0, p0}, Lcom/android/browser/UrlInputView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 105
    new-instance v0, Lcom/android/browser/SuggestionsAdapter;

    invoke-direct {v0, p1, p0}, Lcom/android/browser/SuggestionsAdapter;-><init>(Landroid/content/Context;Lcom/android/browser/SuggestionsAdapter$CompletionListener;)V

    iput-object v0, p0, Lcom/android/browser/UrlInputView;->mAdapter:Lcom/android/browser/SuggestionsAdapter;

    .line 106
    iget-object v0, p0, Lcom/android/browser/UrlInputView;->mAdapter:Lcom/android/browser/SuggestionsAdapter;

    invoke-virtual {p0, v0}, Lcom/android/browser/UrlInputView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 107
    invoke-virtual {p0, v2}, Lcom/android/browser/UrlInputView;->setSelectAllOnFocus(Z)V

    .line 108
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/browser/UrlInputView;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 109
    invoke-virtual {p0, v2}, Lcom/android/browser/UrlInputView;->setThreshold(I)V

    .line 110
    invoke-virtual {p0, p0}, Lcom/android/browser/UrlInputView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 111
    iput-boolean v1, p0, Lcom/android/browser/UrlInputView;->mNeedsUpdate:Z

    .line 112
    invoke-virtual {p0, p0}, Lcom/android/browser/UrlInputView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 114
    iput v1, p0, Lcom/android/browser/UrlInputView;->mState:I

    .line 115
    return-void
.end method

.method private setupDropDown()V
    .locals 4

    .prologue
    .line 226
    iget-object v2, p0, Lcom/android/browser/UrlInputView;->mContainer:Landroid/view/View;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/android/browser/UrlInputView;->mContainer:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v1

    .line 227
    .local v1, width:I
    :goto_0
    iget-object v2, p0, Lcom/android/browser/UrlInputView;->mPopupPadding:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    iget-object v3, p0, Lcom/android/browser/UrlInputView;->mPopupPadding:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    add-int/2addr v2, v3

    add-int/2addr v1, v2

    .line 228
    invoke-virtual {p0}, Lcom/android/browser/UrlInputView;->getDropDownWidth()I

    move-result v2

    if-eq v1, v2, :cond_0

    .line 229
    invoke-virtual {p0, v1}, Lcom/android/browser/UrlInputView;->setDropDownWidth(I)V

    .line 231
    :cond_0
    invoke-virtual {p0}, Lcom/android/browser/UrlInputView;->getLeft()I

    move-result v0

    .line 232
    .local v0, left:I
    iget-object v2, p0, Lcom/android/browser/UrlInputView;->mPopupPadding:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    add-int/2addr v0, v2

    .line 233
    invoke-virtual {p0}, Lcom/android/browser/UrlInputView;->getDropDownHorizontalOffset()I

    move-result v2

    neg-int v2, v2

    if-eq v0, v2, :cond_1

    .line 234
    neg-int v2, v0

    invoke-virtual {p0, v2}, Lcom/android/browser/UrlInputView;->setDropDownHorizontalOffset(I)V

    .line 236
    :cond_1
    return-void

    .line 226
    .end local v0           #left:I
    .end local v1           #width:I
    :cond_2
    invoke-virtual {p0}, Lcom/android/browser/UrlInputView;->getWidth()I

    move-result v1

    goto :goto_0
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .parameter "s"

    .prologue
    .line 358
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "count"
    .parameter "after"

    .prologue
    .line 348
    return-void
.end method

.method clearNeedsUpdate()V
    .locals 1

    .prologue
    .line 167
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/UrlInputView;->mNeedsUpdate:Z

    .line 168
    return-void
.end method

.method public dismissDropDown()V
    .locals 1

    .prologue
    .line 221
    invoke-super {p0}, Landroid/widget/AutoCompleteTextView;->dismissDropDown()V

    .line 222
    iget-object v0, p0, Lcom/android/browser/UrlInputView;->mAdapter:Lcom/android/browser/SuggestionsAdapter;

    invoke-virtual {v0}, Lcom/android/browser/SuggestionsAdapter;->clearCache()V

    .line 223
    return-void
.end method

.method forceFilter()V
    .locals 0

    .prologue
    .line 245
    invoke-virtual {p0}, Lcom/android/browser/UrlInputView;->showDropDown()V

    .line 246
    return-void
.end method

.method public bridge synthetic getAdapter()Landroid/widget/ListAdapter;
    .locals 1

    .prologue
    .line 52
    invoke-virtual {p0}, Lcom/android/browser/UrlInputView;->getAdapter()Lcom/android/browser/SuggestionsAdapter;

    move-result-object v0

    return-object v0
.end method

.method public getAdapter()Lcom/android/browser/SuggestionsAdapter;
    .locals 1

    .prologue
    .line 335
    iget-object v0, p0, Lcom/android/browser/UrlInputView;->mAdapter:Lcom/android/browser/SuggestionsAdapter;

    return-object v0
.end method

.method getState()I
    .locals 1

    .prologue
    .line 198
    iget v0, p0, Lcom/android/browser/UrlInputView;->mState:I

    return v0
.end method

.method hideIME()V
    .locals 3

    .prologue
    .line 249
    iget-object v0, p0, Lcom/android/browser/UrlInputView;->mInputManager:Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {p0}, Lcom/android/browser/UrlInputView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 250
    return-void
.end method

.method public isActionMode()Z
    .locals 1

    .prologue
    .line 139
    iget-boolean v0, p0, Lcom/android/browser/UrlInputView;->mIsActionMode:Z

    return v0
.end method

.method isSearch(Ljava/lang/String;)Z
    .locals 3
    .parameter "inUrl"

    .prologue
    const/4 v1, 0x0

    .line 281
    invoke-static {p1}, Lcom/android/browser/UrlUtils;->fixUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 282
    .local v0, url:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 288
    :cond_0
    :goto_0
    return v1

    .line 284
    :cond_1
    sget-object v2, Landroid/util/Patterns;->WEB_URL:Ljava/util/regex/Pattern;

    invoke-virtual {v2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-nez v2, :cond_0

    sget-object v2, Lcom/android/browser/UrlUtils;->ACCEPTED_URI_SCHEMA:Ljava/util/regex/Pattern;

    invoke-virtual {v2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-nez v2, :cond_0

    .line 288
    const/4 v1, 0x1

    goto :goto_0
.end method

.method needsUpdate()Z
    .locals 1

    .prologue
    .line 160
    iget-boolean v0, p0, Lcom/android/browser/UrlInputView;->mNeedsUpdate:Z

    return v0
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3
    .parameter "config"

    .prologue
    const/4 v1, 0x0

    .line 203
    invoke-super {p0, p1}, Landroid/widget/AutoCompleteTextView;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 204
    iget v0, p1, Landroid/content/res/Configuration;->orientation:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/android/browser/UrlInputView;->mLandscape:Z

    .line 206
    iget-object v0, p0, Lcom/android/browser/UrlInputView;->mAdapter:Lcom/android/browser/SuggestionsAdapter;

    iget-boolean v2, p0, Lcom/android/browser/UrlInputView;->mLandscape:Z

    invoke-virtual {v0, v2}, Lcom/android/browser/SuggestionsAdapter;->setLandscapeMode(Z)V

    .line 207
    invoke-virtual {p0}, Lcom/android/browser/UrlInputView;->isPopupShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/browser/UrlInputView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 208
    invoke-direct {p0}, Lcom/android/browser/UrlInputView;->setupDropDown()V

    .line 209
    invoke-virtual {p0}, Lcom/android/browser/UrlInputView;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Lcom/android/browser/UrlInputView;->performFiltering(Ljava/lang/CharSequence;I)V

    .line 211
    :cond_0
    return-void

    :cond_1
    move v0, v1

    .line 204
    goto :goto_0
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 3
    .parameter "v"
    .parameter "actionId"
    .parameter "event"

    .prologue
    .line 240
    invoke-virtual {p0}, Lcom/android/browser/UrlInputView;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "browser-type"

    invoke-direct {p0, v0, v1, v2}, Lcom/android/browser/UrlInputView;->finishInput(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 241
    const/4 v0, 0x1

    return v0
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 3
    .parameter "focused"
    .parameter "direction"
    .parameter "prevRect"

    .prologue
    .line 118
    invoke-super {p0, p1, p2, p3}, Landroid/widget/AutoCompleteTextView;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 119
    const/4 v1, -0x1

    .line 120
    .local v1, state:I
    if-eqz p1, :cond_1

    .line 121
    invoke-virtual {p0}, Lcom/android/browser/UrlInputView;->hasSelection()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 122
    const/4 v1, 0x1

    .line 130
    :goto_0
    move v0, v1

    .line 131
    .local v0, s:I
    new-instance v2, Lcom/android/browser/UrlInputView$1;

    invoke-direct {v2, p0, v0}, Lcom/android/browser/UrlInputView$1;-><init>(Lcom/android/browser/UrlInputView;I)V

    invoke-virtual {p0, v2}, Lcom/android/browser/UrlInputView;->post(Ljava/lang/Runnable;)Z

    .line 136
    return-void

    .line 124
    .end local v0           #s:I
    :cond_0
    const/4 v1, 0x2

    goto :goto_0

    .line 128
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 306
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Lcom/android/browser/UrlInputView;->mAdapter:Lcom/android/browser/SuggestionsAdapter;

    invoke-virtual {v1, p3}, Lcom/android/browser/SuggestionsAdapter;->getItem(I)Lcom/android/browser/SuggestionsAdapter$SuggestItem;

    move-result-object v0

    .line 307
    .local v0, item:Lcom/android/browser/SuggestionsAdapter$SuggestItem;
    invoke-static {v0}, Lcom/android/browser/SuggestionsAdapter;->getSuggestionUrl(Lcom/android/browser/SuggestionsAdapter$SuggestItem;)Ljava/lang/String;

    move-result-object v1

    iget v2, v0, Lcom/android/browser/SuggestionsAdapter$SuggestItem;->type:I

    iget-object v3, v0, Lcom/android/browser/SuggestionsAdapter$SuggestItem;->extra:Ljava/lang/String;

    invoke-virtual {p0, v1, v2, v3}, Lcom/android/browser/UrlInputView;->onSelect(Ljava/lang/String;ILjava/lang/String;)V

    .line 308
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .parameter "keyCode"
    .parameter "evt"

    .prologue
    const/4 v1, 0x0

    .line 327
    const/16 v0, 0x6f

    if-ne p1, v0, :cond_0

    invoke-virtual {p0}, Lcom/android/browser/UrlInputView;->isInTouchMode()Z

    move-result v0

    if-nez v0, :cond_0

    .line 328
    invoke-direct {p0, v1, v1, v1}, Lcom/android/browser/UrlInputView;->finishInput(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 329
    const/4 v0, 0x1

    .line 331
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/AutoCompleteTextView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onSearch(Ljava/lang/String;)V
    .locals 1
    .parameter "search"

    .prologue
    .line 295
    iget-object v0, p0, Lcom/android/browser/UrlInputView;->mListener:Lcom/android/browser/UrlInputView$UrlInputListener;

    invoke-interface {v0, p1}, Lcom/android/browser/UrlInputView$UrlInputListener;->onCopySuggestion(Ljava/lang/String;)V

    .line 296
    return-void
.end method

.method public onSelect(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1
    .parameter "url"
    .parameter "type"
    .parameter "extra"

    .prologue
    .line 300
    const-string v0, "browser-suggest"

    invoke-direct {p0, p1, p3, v0}, Lcom/android/browser/UrlInputView;->finishInput(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 2
    .parameter "s"
    .parameter "start"
    .parameter "before"
    .parameter "count"

    .prologue
    .line 352
    const/4 v0, 0x1

    iget v1, p0, Lcom/android/browser/UrlInputView;->mState:I

    if-ne v0, v1, :cond_0

    .line 353
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/android/browser/UrlInputView;->changeState(I)V

    .line 355
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5
    .parameter "evt"

    .prologue
    .line 144
    invoke-virtual {p0}, Lcom/android/browser/UrlInputView;->hasSelection()Z

    move-result v0

    .line 145
    .local v0, hasSelection:Z
    invoke-super {p0, p1}, Landroid/widget/AutoCompleteTextView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 146
    .local v1, res:Z
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    if-nez v2, :cond_0

    if-eqz v0, :cond_0

    .line 148
    new-instance v2, Lcom/android/browser/UrlInputView$2;

    invoke-direct {v2, p0}, Lcom/android/browser/UrlInputView$2;-><init>(Lcom/android/browser/UrlInputView;)V

    const-wide/16 v3, 0x64

    invoke-virtual {p0, v2, v3, v4}, Lcom/android/browser/UrlInputView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 153
    :cond_0
    return v1
.end method

.method public requestRectangleOnScreen(Landroid/graphics/Rect;Z)Z
    .locals 1
    .parameter "rect"
    .parameter "immediate"

    .prologue
    .line 344
    const/4 v0, 0x0

    return v0
.end method

.method setContainer(Landroid/view/View;)V
    .locals 0
    .parameter "container"

    .prologue
    .line 177
    iput-object p1, p0, Lcom/android/browser/UrlInputView;->mContainer:Landroid/view/View;

    .line 178
    return-void
.end method

.method setController(Lcom/android/browser/UiController;)V
    .locals 1
    .parameter "controller"

    .prologue
    .line 171
    new-instance v0, Lcom/android/browser/UrlSelectionActionMode;

    invoke-direct {v0, p1}, Lcom/android/browser/UrlSelectionActionMode;-><init>(Lcom/android/browser/UiController;)V

    .line 173
    .local v0, urlSelectionMode:Lcom/android/browser/UrlSelectionActionMode;
    invoke-virtual {p0, v0}, Lcom/android/browser/UrlInputView;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    .line 174
    return-void
.end method

.method public setIncognitoMode(Z)V
    .locals 2
    .parameter "incognito"

    .prologue
    .line 321
    iput-boolean p1, p0, Lcom/android/browser/UrlInputView;->mIncognitoMode:Z

    .line 322
    iget-object v0, p0, Lcom/android/browser/UrlInputView;->mAdapter:Lcom/android/browser/SuggestionsAdapter;

    iget-boolean v1, p0, Lcom/android/browser/UrlInputView;->mIncognitoMode:Z

    invoke-virtual {v0, v1}, Lcom/android/browser/SuggestionsAdapter;->setIncognitoMode(Z)V

    .line 323
    return-void
.end method

.method public setStateListener(Lcom/android/browser/UrlInputView$StateListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 185
    iput-object p1, p0, Lcom/android/browser/UrlInputView;->mStateListener:Lcom/android/browser/UrlInputView$StateListener;

    .line 187
    iget v0, p0, Lcom/android/browser/UrlInputView;->mState:I

    invoke-direct {p0, v0}, Lcom/android/browser/UrlInputView;->changeState(I)V

    .line 188
    return-void
.end method

.method public setUrlInputListener(Lcom/android/browser/UrlInputView$UrlInputListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 181
    iput-object p1, p0, Lcom/android/browser/UrlInputView;->mListener:Lcom/android/browser/UrlInputView$UrlInputListener;

    .line 182
    return-void
.end method

.method public showDropDown()V
    .locals 0

    .prologue
    .line 215
    invoke-direct {p0}, Lcom/android/browser/UrlInputView;->setupDropDown()V

    .line 216
    invoke-super {p0}, Landroid/widget/AutoCompleteTextView;->showDropDown()V

    .line 217
    return-void
.end method

.method showIME()V
    .locals 2

    .prologue
    .line 253
    iget-object v0, p0, Lcom/android/browser/UrlInputView;->mInputManager:Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {v0, p0}, Landroid/view/inputmethod/InputMethodManager;->focusIn(Landroid/view/View;)V

    .line 254
    iget-object v0, p0, Lcom/android/browser/UrlInputView;->mInputManager:Landroid/view/inputmethod/InputMethodManager;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 255
    return-void
.end method
