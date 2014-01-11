.class Lcom/android/browser/SuggestionsAdapter$SuggestCursor;
.super Lcom/android/browser/SuggestionsAdapter$CursorSource;
.source "SuggestionsAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/SuggestionsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SuggestCursor"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/SuggestionsAdapter;


# direct methods
.method constructor <init>(Lcom/android/browser/SuggestionsAdapter;)V
    .locals 0
    .parameter

    .prologue
    .line 500
    iput-object p1, p0, Lcom/android/browser/SuggestionsAdapter$SuggestCursor;->this$0:Lcom/android/browser/SuggestionsAdapter;

    invoke-direct {p0, p1}, Lcom/android/browser/SuggestionsAdapter$CursorSource;-><init>(Lcom/android/browser/SuggestionsAdapter;)V

    return-void
.end method


# virtual methods
.method public getItem()Lcom/android/browser/SuggestionsAdapter$SuggestItem;
    .locals 9

    .prologue
    .line 504
    iget-object v6, p0, Lcom/android/browser/SuggestionsAdapter$CursorSource;->mCursor:Landroid/database/Cursor;

    if-eqz v6, :cond_1

    .line 505
    iget-object v6, p0, Lcom/android/browser/SuggestionsAdapter$CursorSource;->mCursor:Landroid/database/Cursor;

    iget-object v7, p0, Lcom/android/browser/SuggestionsAdapter$CursorSource;->mCursor:Landroid/database/Cursor;

    const-string v8, "suggest_text_1"

    invoke-interface {v7, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 507
    .local v2, title:Ljava/lang/String;
    iget-object v6, p0, Lcom/android/browser/SuggestionsAdapter$CursorSource;->mCursor:Landroid/database/Cursor;

    iget-object v7, p0, Lcom/android/browser/SuggestionsAdapter$CursorSource;->mCursor:Landroid/database/Cursor;

    const-string v8, "suggest_text_2"

    invoke-interface {v7, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 509
    .local v1, text2:Ljava/lang/String;
    iget-object v6, p0, Lcom/android/browser/SuggestionsAdapter$CursorSource;->mCursor:Landroid/database/Cursor;

    iget-object v7, p0, Lcom/android/browser/SuggestionsAdapter$CursorSource;->mCursor:Landroid/database/Cursor;

    const-string v8, "suggest_text_2_url"

    invoke-interface {v7, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 511
    .local v5, url:Ljava/lang/String;
    iget-object v6, p0, Lcom/android/browser/SuggestionsAdapter$CursorSource;->mCursor:Landroid/database/Cursor;

    iget-object v7, p0, Lcom/android/browser/SuggestionsAdapter$CursorSource;->mCursor:Landroid/database/Cursor;

    const-string v8, "suggest_intent_data"

    invoke-interface {v7, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 513
    .local v4, uri:Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v3, 0x4

    .line 514
    .local v3, type:I
    :goto_0
    new-instance v0, Lcom/android/browser/SuggestionsAdapter$SuggestItem;

    iget-object v6, p0, Lcom/android/browser/SuggestionsAdapter$SuggestCursor;->this$0:Lcom/android/browser/SuggestionsAdapter;

    invoke-direct {v0, v6, v2, v5, v3}, Lcom/android/browser/SuggestionsAdapter$SuggestItem;-><init>(Lcom/android/browser/SuggestionsAdapter;Ljava/lang/String;Ljava/lang/String;I)V

    .line 515
    .local v0, item:Lcom/android/browser/SuggestionsAdapter$SuggestItem;
    iget-object v6, p0, Lcom/android/browser/SuggestionsAdapter$CursorSource;->mCursor:Landroid/database/Cursor;

    iget-object v7, p0, Lcom/android/browser/SuggestionsAdapter$CursorSource;->mCursor:Landroid/database/Cursor;

    const-string v8, "suggest_intent_extra_data"

    invoke-interface {v7, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v0, Lcom/android/browser/SuggestionsAdapter$SuggestItem;->extra:Ljava/lang/String;

    .line 519
    .end local v0           #item:Lcom/android/browser/SuggestionsAdapter$SuggestItem;
    .end local v1           #text2:Ljava/lang/String;
    .end local v2           #title:Ljava/lang/String;
    .end local v3           #type:I
    .end local v4           #uri:Ljava/lang/String;
    .end local v5           #url:Ljava/lang/String;
    :goto_1
    return-object v0

    .line 513
    .restart local v1       #text2:Ljava/lang/String;
    .restart local v2       #title:Ljava/lang/String;
    .restart local v4       #uri:Ljava/lang/String;
    .restart local v5       #url:Ljava/lang/String;
    :cond_0
    const/4 v3, 0x2

    goto :goto_0

    .line 519
    .end local v1           #text2:Ljava/lang/String;
    .end local v2           #title:Ljava/lang/String;
    .end local v4           #uri:Ljava/lang/String;
    .end local v5           #url:Ljava/lang/String;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public runQuery(Ljava/lang/CharSequence;)V
    .locals 3
    .parameter "constraint"

    .prologue
    .line 524
    iget-object v1, p0, Lcom/android/browser/SuggestionsAdapter$CursorSource;->mCursor:Landroid/database/Cursor;

    if-eqz v1, :cond_0

    .line 525
    iget-object v1, p0, Lcom/android/browser/SuggestionsAdapter$CursorSource;->mCursor:Landroid/database/Cursor;

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 527
    :cond_0
    iget-object v1, p0, Lcom/android/browser/SuggestionsAdapter$SuggestCursor;->this$0:Lcom/android/browser/SuggestionsAdapter;

    iget-object v1, v1, Lcom/android/browser/SuggestionsAdapter;->mSettings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {v1}, Lcom/android/browser/BrowserSettings;->getSearchEngine()Lcom/android/browser/search/SearchEngine;

    move-result-object v0

    .line 528
    .local v0, searchEngine:Lcom/android/browser/search/SearchEngine;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 529
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/browser/search/SearchEngine;->supportsSuggestions()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 530
    iget-object v1, p0, Lcom/android/browser/SuggestionsAdapter$SuggestCursor;->this$0:Lcom/android/browser/SuggestionsAdapter;

    iget-object v1, v1, Lcom/android/browser/SuggestionsAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/android/browser/search/SearchEngine;->getSuggestions(Landroid/content/Context;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/SuggestionsAdapter$CursorSource;->mCursor:Landroid/database/Cursor;

    .line 531
    iget-object v1, p0, Lcom/android/browser/SuggestionsAdapter$CursorSource;->mCursor:Landroid/database/Cursor;

    if-eqz v1, :cond_1

    .line 532
    iget-object v1, p0, Lcom/android/browser/SuggestionsAdapter$CursorSource;->mCursor:Landroid/database/Cursor;

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 541
    :cond_1
    :goto_0
    return-void

    .line 536
    :cond_2
    invoke-interface {v0}, Lcom/android/browser/search/SearchEngine;->wantsEmptyQuery()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 537
    iget-object v1, p0, Lcom/android/browser/SuggestionsAdapter$SuggestCursor;->this$0:Lcom/android/browser/SuggestionsAdapter;

    iget-object v1, v1, Lcom/android/browser/SuggestionsAdapter;->mContext:Landroid/content/Context;

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Lcom/android/browser/search/SearchEngine;->getSuggestions(Landroid/content/Context;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/SuggestionsAdapter$CursorSource;->mCursor:Landroid/database/Cursor;

    .line 539
    :cond_3
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/browser/SuggestionsAdapter$CursorSource;->mCursor:Landroid/database/Cursor;

    goto :goto_0
.end method
