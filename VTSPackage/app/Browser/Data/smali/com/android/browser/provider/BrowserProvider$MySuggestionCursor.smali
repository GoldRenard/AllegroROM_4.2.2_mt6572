.class Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;
.super Landroid/database/AbstractCursor;
.source "BrowserProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/provider/BrowserProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MySuggestionCursor"
.end annotation


# instance fields
.field private mHistoryCount:I

.field private mHistoryCursor:Landroid/database/Cursor;

.field private mIncludeWebSearch:Z

.field private mString:Ljava/lang/String;

.field private mSuggestCursor:Landroid/database/Cursor;

.field private mSuggestIntentExtraDataId:I

.field private mSuggestQueryId:I

.field private mSuggestText1Id:I

.field private mSuggestText2Id:I

.field private mSuggestText2UrlId:I

.field private mSuggestionCount:I

.field final synthetic this$0:Lcom/android/browser/provider/BrowserProvider;


# direct methods
.method public constructor <init>(Lcom/android/browser/provider/BrowserProvider;Landroid/database/Cursor;Landroid/database/Cursor;Ljava/lang/String;)V
    .locals 5
    .parameter
    .parameter "hc"
    .parameter "sc"
    .parameter "string"

    .prologue
    const/4 v1, 0x0

    const/4 v4, -0x1

    .line 483
    iput-object p1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->this$0:Lcom/android/browser/provider/BrowserProvider;

    invoke-direct {p0}, Landroid/database/AbstractCursor;-><init>()V

    .line 484
    iput-object p2, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    .line 485
    iput-object p3, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    .line 486
    if-eqz p2, :cond_2

    invoke-interface {p2}, Landroid/database/Cursor;->getCount()I

    move-result v0

    :goto_0
    iput v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCount:I

    .line 487
    if-eqz p3, :cond_3

    invoke-interface {p3}, Landroid/database/Cursor;->getCount()I

    move-result v0

    :goto_1
    iput v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestionCount:I

    .line 488
    iget v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestionCount:I

    #getter for: Lcom/android/browser/provider/BrowserProvider;->mMaxSuggestionLongSize:I
    invoke-static {p1}, Lcom/android/browser/provider/BrowserProvider;->access$200(Lcom/android/browser/provider/BrowserProvider;)I

    move-result v2

    iget v3, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCount:I

    sub-int/2addr v2, v3

    if-le v0, v2, :cond_0

    .line 489
    #getter for: Lcom/android/browser/provider/BrowserProvider;->mMaxSuggestionLongSize:I
    invoke-static {p1}, Lcom/android/browser/provider/BrowserProvider;->access$200(Lcom/android/browser/provider/BrowserProvider;)I

    move-result v0

    iget v2, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCount:I

    sub-int/2addr v0, v2

    iput v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestionCount:I

    .line 491
    :cond_0
    iput-object p4, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mString:Ljava/lang/String;

    .line 492
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    iput-boolean v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mIncludeWebSearch:Z

    .line 497
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    if-nez v0, :cond_4

    .line 498
    iput v4, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestText1Id:I

    .line 499
    iput v4, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestText2Id:I

    .line 500
    iput v4, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestText2UrlId:I

    .line 501
    iput v4, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestQueryId:I

    .line 502
    iput v4, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestIntentExtraDataId:I

    .line 515
    :goto_2
    return-void

    :cond_2
    move v0, v1

    .line 486
    goto :goto_0

    :cond_3
    move v0, v1

    .line 487
    goto :goto_1

    .line 504
    :cond_4
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    const-string v1, "suggest_text_1"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestText1Id:I

    .line 506
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    const-string v1, "suggest_text_2"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestText2Id:I

    .line 508
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    const-string v1, "suggest_text_2_url"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestText2UrlId:I

    .line 510
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    const-string v1, "suggest_intent_query"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestQueryId:I

    .line 512
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    const-string v1, "suggest_intent_extra_data"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestIntentExtraDataId:I

    goto :goto_2
.end method

.method private getHistoryTitle()Ljava/lang/String;
    .locals 3

    .prologue
    .line 741
    iget-object v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    const/4 v2, 0x2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 742
    .local v0, title:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v0}, Landroid/text/TextUtils;->getTrimmedLength(Ljava/lang/CharSequence;)I

    move-result v1

    if-nez v1, :cond_1

    .line 743
    :cond_0
    iget-object v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/android/browser/provider/BrowserProvider;->stripUrl(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1}, Lcom/android/browser/provider/BrowserProvider;->access$400(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 745
    :cond_1
    return-object v0
.end method

.method private getHistoryUrl()Ljava/lang/String;
    .locals 3

    .prologue
    .line 756
    iget-object v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    const/4 v2, 0x2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 757
    .local v0, title:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v0}, Landroid/text/TextUtils;->getTrimmedLength(Ljava/lang/CharSequence;)I

    move-result v1

    if-nez v1, :cond_1

    .line 758
    :cond_0
    const/4 v1, 0x0

    .line 760
    :goto_0
    return-object v1

    :cond_1
    iget-object v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/android/browser/provider/BrowserProvider;->stripUrl(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1}, Lcom/android/browser/provider/BrowserProvider;->access$400(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 723
    invoke-super {p0}, Landroid/database/AbstractCursor;->close()V

    .line 724
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    .line 725
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 726
    iput-object v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    .line 728
    :cond_0
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_1

    .line 729
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 730
    iput-object v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    .line 732
    :cond_1
    return-void
.end method

.method public deactivate()V
    .locals 1

    .prologue
    .line 705
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    .line 706
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->deactivate()V

    .line 708
    :cond_0
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_1

    .line 709
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->deactivate()V

    .line 711
    :cond_1
    invoke-super {p0}, Landroid/database/AbstractCursor;->deactivate()V

    .line 712
    return-void
.end method

.method public getColumnNames()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 554
    invoke-static {}, Lcom/android/browser/provider/BrowserProvider;->access$300()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCount()I
    .locals 2

    .prologue
    .line 545
    iget-boolean v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mIncludeWebSearch:Z

    if-eqz v0, :cond_0

    .line 546
    iget v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCount:I

    iget v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestionCount:I

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    .line 548
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCount:I

    iget v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestionCount:I

    add-int/2addr v0, v1

    goto :goto_0
.end method

.method public getDouble(I)D
    .locals 1
    .parameter "column"

    .prologue
    .line 671
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getFloat(I)F
    .locals 1
    .parameter "column"

    .prologue
    .line 676
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getInt(I)I
    .locals 1
    .parameter "column"

    .prologue
    .line 681
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getLong(I)J
    .locals 2
    .parameter "column"

    .prologue
    .line 686
    iget v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mPos:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    if-nez p1, :cond_0

    .line 687
    iget v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mPos:I

    int-to-long v0, v0

    return-wide v0

    .line 689
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getShort(I)S
    .locals 1
    .parameter "column"

    .prologue
    .line 694
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 7
    .parameter "columnIndex"

    .prologue
    const/4 v2, 0x2

    const/4 v6, -0x1

    const/4 v3, 0x0

    const/4 v1, 0x1

    .line 559
    iget v4, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mPos:I

    if-eq v4, v6, :cond_2

    iget-object v4, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    if-eqz v4, :cond_2

    .line 560
    const/4 v0, -0x1

    .line 561
    .local v0, type:I
    iget-boolean v4, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mIncludeWebSearch:Z

    if-eqz v4, :cond_6

    .line 562
    iget v4, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCount:I

    if-nez v4, :cond_3

    iget v4, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mPos:I

    if-nez v4, :cond_3

    .line 563
    const/4 v0, 0x0

    .line 571
    :cond_0
    :goto_0
    if-ne v0, v6, :cond_1

    iget v4, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mPos:I

    add-int/lit8 v4, v4, -0x1

    iget v5, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCount:I

    if-ge v4, v5, :cond_5

    move v0, v1

    .line 576
    :cond_1
    :goto_1
    packed-switch p1, :pswitch_data_0

    .end local v0           #type:I
    :cond_2
    move-object v1, v3

    .line 666
    :goto_2
    return-object v1

    .line 564
    .restart local v0       #type:I
    :cond_3
    iget v4, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCount:I

    if-lez v4, :cond_0

    .line 565
    iget v4, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mPos:I

    if-nez v4, :cond_4

    .line 566
    const/4 v0, 0x1

    goto :goto_0

    .line 567
    :cond_4
    iget v4, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mPos:I

    if-ne v4, v1, :cond_0

    .line 568
    const/4 v0, 0x0

    goto :goto_0

    :cond_5
    move v0, v2

    .line 571
    goto :goto_1

    .line 573
    :cond_6
    iget v4, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mPos:I

    iget v5, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCount:I

    if-ge v4, v5, :cond_7

    move v0, v1

    :goto_3
    goto :goto_1

    :cond_7
    move v0, v2

    goto :goto_3

    .line 578
    :pswitch_0
    if-ne v0, v1, :cond_8

    .line 579
    const-string v1, "android.intent.action.VIEW"

    goto :goto_2

    .line 581
    :cond_8
    const-string v1, "android.intent.action.SEARCH"

    goto :goto_2

    .line 585
    :pswitch_1
    if-ne v0, v1, :cond_9

    .line 586
    iget-object v2, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    invoke-interface {v2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    :cond_9
    move-object v1, v3

    .line 588
    goto :goto_2

    .line 592
    :pswitch_2
    if-nez v0, :cond_a

    .line 593
    iget-object v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mString:Ljava/lang/String;

    goto :goto_2

    .line 594
    :cond_a
    if-ne v0, v1, :cond_b

    .line 595
    invoke-direct {p0}, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->getHistoryTitle()Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    .line 597
    :cond_b
    iget v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestText1Id:I

    if-ne v1, v6, :cond_c

    move-object v1, v3

    goto :goto_2

    .line 598
    :cond_c
    iget-object v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    iget v2, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestText1Id:I

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    .line 602
    :pswitch_3
    if-nez v0, :cond_d

    .line 603
    iget-object v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->this$0:Lcom/android/browser/provider/BrowserProvider;

    invoke-virtual {v1}, Lcom/android/browser/provider/BrowserProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0c015f

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    .line 604
    :cond_d
    if-ne v0, v1, :cond_e

    move-object v1, v3

    .line 605
    goto :goto_2

    .line 607
    :cond_e
    iget v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestText2Id:I

    if-ne v1, v6, :cond_f

    move-object v1, v3

    goto :goto_2

    .line 608
    :cond_f
    iget-object v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    iget v2, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestText2Id:I

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    .line 612
    :pswitch_4
    if-nez v0, :cond_10

    move-object v1, v3

    .line 613
    goto :goto_2

    .line 614
    :cond_10
    if-ne v0, v1, :cond_11

    .line 615
    invoke-direct {p0}, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->getHistoryUrl()Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    .line 617
    :cond_11
    iget v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestText2UrlId:I

    if-ne v1, v6, :cond_12

    move-object v1, v3

    goto :goto_2

    .line 618
    :cond_12
    iget-object v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    iget v2, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestText2UrlId:I

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_2

    .line 622
    :pswitch_5
    if-ne v0, v1, :cond_14

    .line 623
    iget-object v2, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    const/4 v3, 0x3

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    if-ne v2, v1, :cond_13

    .line 624
    const v1, 0x7f020049

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_2

    .line 628
    :cond_13
    const v1, 0x7f02004b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_2

    .line 633
    :cond_14
    const v1, 0x7f02004c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_2

    .line 639
    :pswitch_6
    const-string v1, "0"

    goto/16 :goto_2

    .line 642
    :pswitch_7
    if-nez v0, :cond_15

    .line 643
    iget-object v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mString:Ljava/lang/String;

    goto/16 :goto_2

    .line 644
    :cond_15
    if-ne v0, v1, :cond_16

    .line 649
    iget-object v2, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    invoke-interface {v2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_2

    .line 651
    :cond_16
    iget v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestQueryId:I

    if-ne v1, v6, :cond_17

    move-object v1, v3

    goto/16 :goto_2

    .line 652
    :cond_17
    iget-object v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    iget v2, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestQueryId:I

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_2

    .line 656
    :pswitch_8
    if-nez v0, :cond_18

    move-object v1, v3

    .line 657
    goto/16 :goto_2

    .line 658
    :cond_18
    if-ne v0, v1, :cond_19

    move-object v1, v3

    .line 659
    goto/16 :goto_2

    .line 661
    :cond_19
    iget v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestIntentExtraDataId:I

    if-ne v1, v6, :cond_1a

    move-object v1, v3

    goto/16 :goto_2

    .line 662
    :cond_1a
    iget-object v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    iget v2, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestIntentExtraDataId:I

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_2

    .line 576
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method public isNull(I)Z
    .locals 1
    .parameter "column"

    .prologue
    .line 699
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public onMove(II)Z
    .locals 3
    .parameter "oldPosition"
    .parameter "newPosition"

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 519
    iget-object v2, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    if-nez v2, :cond_0

    .line 540
    :goto_0
    return v0

    .line 522
    :cond_0
    iget-boolean v2, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mIncludeWebSearch:Z

    if-eqz v2, :cond_4

    .line 523
    iget v2, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCount:I

    if-nez v2, :cond_1

    if-nez p2, :cond_1

    move v0, v1

    .line 524
    goto :goto_0

    .line 525
    :cond_1
    iget v2, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCount:I

    if-lez v2, :cond_3

    .line 526
    if-nez p2, :cond_2

    .line 527
    iget-object v2, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    invoke-interface {v2, v0}, Landroid/database/Cursor;->moveToPosition(I)Z

    move v0, v1

    .line 528
    goto :goto_0

    .line 529
    :cond_2
    if-ne p2, v1, :cond_3

    move v0, v1

    .line 530
    goto :goto_0

    .line 533
    :cond_3
    add-int/lit8 p2, p2, -0x1

    .line 535
    :cond_4
    iget v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCount:I

    if-le v0, p2, :cond_5

    .line 536
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    invoke-interface {v0, p2}, Landroid/database/Cursor;->moveToPosition(I)Z

    :goto_1
    move v0, v1

    .line 540
    goto :goto_0

    .line 538
    :cond_5
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    iget v2, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCount:I

    sub-int v2, p2, v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    goto :goto_1
.end method

.method public requery()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 716
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mHistoryCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->requery()Z

    move-result v0

    :goto_0
    iget-object v2, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    if-eqz v2, :cond_0

    iget-object v1, p0, Lcom/android/browser/provider/BrowserProvider$MySuggestionCursor;->mSuggestCursor:Landroid/database/Cursor;

    invoke-interface {v1}, Landroid/database/Cursor;->requery()Z

    move-result v1

    :cond_0
    or-int/2addr v0, v1

    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method
