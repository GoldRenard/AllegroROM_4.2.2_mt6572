.class Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;
.super Lcom/android/browser/DateSortedExpandableListAdapter;
.source "BrowserHistoryPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/BrowserHistoryPage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HistoryAdapter"
.end annotation


# instance fields
.field mFaviconBackground:Landroid/graphics/drawable/Drawable;

.field private mHistoryCursor:Landroid/database/Cursor;

.field private mMostVisited:Landroid/database/Cursor;

.field final synthetic this$0:Lcom/android/browser/BrowserHistoryPage;


# direct methods
.method constructor <init>(Lcom/android/browser/BrowserHistoryPage;Landroid/content/Context;)V
    .locals 1
    .parameter
    .parameter "context"

    .prologue
    .line 556
    iput-object p1, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->this$0:Lcom/android/browser/BrowserHistoryPage;

    .line 557
    const/4 v0, 0x1

    invoke-direct {p0, p2, v0}, Lcom/android/browser/DateSortedExpandableListAdapter;-><init>(Landroid/content/Context;I)V

    .line 558
    invoke-static {p2}, Lcom/android/browser/BookmarkUtils;->createListFaviconBackground(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mFaviconBackground:Landroid/graphics/drawable/Drawable;

    .line 559
    return-void
.end method

.method static synthetic access$000(Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;)Landroid/database/Cursor;
    .locals 1
    .parameter "x0"

    .prologue
    .line 551
    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mMostVisited:Landroid/database/Cursor;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;)Landroid/database/Cursor;
    .locals 1
    .parameter "x0"

    .prologue
    .line 551
    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mHistoryCursor:Landroid/database/Cursor;

    return-object v0
.end method

.method private isMostVisitedEmpty()Z
    .locals 1

    .prologue
    .line 616
    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mMostVisited:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mMostVisited:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mMostVisited:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public changeCursor(Landroid/database/Cursor;)V
    .locals 0
    .parameter "cursor"

    .prologue
    .line 563
    iput-object p1, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mHistoryCursor:Landroid/database/Cursor;

    .line 564
    invoke-super {p0, p1}, Lcom/android/browser/DateSortedExpandableListAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 565
    return-void
.end method

.method changeMostVisitedCursor(Landroid/database/Cursor;)V
    .locals 2
    .parameter "cursor"

    .prologue
    .line 568
    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mMostVisited:Landroid/database/Cursor;

    if-ne v0, p1, :cond_0

    .line 580
    :goto_0
    return-void

    .line 571
    :cond_0
    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mMostVisited:Landroid/database/Cursor;

    if-eqz v0, :cond_1

    .line 572
    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mMostVisited:Landroid/database/Cursor;

    iget-object v1, p0, Lcom/android/browser/DateSortedExpandableListAdapter;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-interface {v0, v1}, Landroid/database/Cursor;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 573
    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mMostVisited:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 575
    :cond_1
    iput-object p1, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mMostVisited:Landroid/database/Cursor;

    .line 576
    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mMostVisited:Landroid/database/Cursor;

    if-eqz v0, :cond_2

    .line 577
    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mMostVisited:Landroid/database/Cursor;

    iget-object v1, p0, Lcom/android/browser/DateSortedExpandableListAdapter;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-interface {v0, v1}, Landroid/database/Cursor;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 579
    :cond_2
    invoke-virtual {p0}, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->notifyDataSetChanged()V

    goto :goto_0
.end method

.method public getChildId(II)J
    .locals 3
    .parameter "groupPosition"
    .parameter "childPosition"

    .prologue
    .line 584
    invoke-virtual {p0, p1, p2}, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->moveCursorToChildPosition(II)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 585
    invoke-virtual {p0, p1}, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->getCursor(I)Landroid/database/Cursor;

    move-result-object v0

    .line 586
    .local v0, cursor:Landroid/database/Cursor;
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    .line 588
    .end local v0           #cursor:Landroid/database/Cursor;
    :goto_0
    return-wide v1

    :cond_0
    const-wide/16 v1, 0x0

    goto :goto_0
.end method

.method public getChildView(IIZLandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 10
    .parameter "groupPosition"
    .parameter "childPosition"
    .parameter "isLastChild"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 665
    if-eqz p4, :cond_0

    instance-of v6, p4, Lcom/android/browser/HistoryItem;

    if-nez v6, :cond_1

    .line 666
    :cond_0
    new-instance v2, Lcom/android/browser/HistoryItem;

    invoke-virtual {p0}, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v2, v6}, Lcom/android/browser/HistoryItem;-><init>(Landroid/content/Context;)V

    .line 669
    .local v2, item:Lcom/android/browser/HistoryItem;
    invoke-virtual {v2}, Lcom/android/browser/HistoryItem;->getPaddingLeft()I

    move-result v6

    add-int/lit8 v6, v6, 0xa

    invoke-virtual {v2}, Lcom/android/browser/HistoryItem;->getPaddingTop()I

    move-result v7

    invoke-virtual {v2}, Lcom/android/browser/HistoryItem;->getPaddingRight()I

    move-result v8

    invoke-virtual {v2}, Lcom/android/browser/HistoryItem;->getPaddingBottom()I

    move-result v9

    invoke-virtual {v2, v6, v7, v8, v9}, Lcom/android/browser/HistoryItem;->setPadding(IIII)V

    .line 673
    iget-object v6, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mFaviconBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v6}, Lcom/android/browser/HistoryItem;->setFaviconBackground(Landroid/graphics/drawable/Drawable;)V

    .line 679
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->moveCursorToChildPosition(II)Z

    move-result v6

    if-nez v6, :cond_2

    .line 696
    :goto_1
    return-object v2

    .end local v2           #item:Lcom/android/browser/HistoryItem;
    :cond_1
    move-object v2, p4

    .line 675
    check-cast v2, Lcom/android/browser/HistoryItem;

    .restart local v2       #item:Lcom/android/browser/HistoryItem;
    goto :goto_0

    .line 683
    :cond_2
    invoke-virtual {p0, p1}, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->getCursor(I)Landroid/database/Cursor;

    move-result-object v0

    .line 684
    .local v0, cursor:Landroid/database/Cursor;
    const/4 v6, 0x2

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/android/browser/HistoryItem;->setName(Ljava/lang/String;)V

    .line 685
    const/4 v6, 0x3

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 686
    .local v3, url:Ljava/lang/String;
    invoke-virtual {v2, v3}, Lcom/android/browser/HistoryItem;->setUrl(Ljava/lang/String;)V

    .line 687
    const/4 v6, 0x4

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v1

    .line 688
    .local v1, data:[B
    if-eqz v1, :cond_3

    .line 689
    array-length v6, v1

    invoke-static {v1, v5, v6}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/android/browser/HistoryItem;->setFavicon(Landroid/graphics/Bitmap;)V

    .line 695
    :goto_2
    const/4 v6, 0x6

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    if-ne v6, v4, :cond_4

    :goto_3
    invoke-virtual {v2, v4}, Lcom/android/browser/HistoryItem;->setIsBookmark(Z)V

    goto :goto_1

    .line 693
    :cond_3
    const/4 v6, 0x0

    invoke-virtual {v2, v6}, Lcom/android/browser/HistoryItem;->setFavicon(Landroid/graphics/Bitmap;)V

    goto :goto_2

    :cond_4
    move v4, v5

    .line 695
    goto :goto_3
.end method

.method public getChildrenCount(I)I
    .locals 1
    .parameter "groupPosition"

    .prologue
    .line 598
    invoke-super {p0}, Lcom/android/browser/DateSortedExpandableListAdapter;->getGroupCount()I

    move-result v0

    if-lt p1, v0, :cond_1

    .line 599
    invoke-direct {p0}, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->isMostVisitedEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 600
    const/4 v0, 0x0

    .line 604
    :goto_0
    return v0

    .line 602
    :cond_0
    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mMostVisited:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    goto :goto_0

    .line 604
    :cond_1
    invoke-super {p0, p1}, Lcom/android/browser/DateSortedExpandableListAdapter;->getChildrenCount(I)I

    move-result v0

    goto :goto_0
.end method

.method getCursor(I)Landroid/database/Cursor;
    .locals 1
    .parameter "groupPosition"

    .prologue
    .line 622
    invoke-super {p0}, Lcom/android/browser/DateSortedExpandableListAdapter;->getGroupCount()I

    move-result v0

    if-lt p1, v0, :cond_0

    .line 623
    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mMostVisited:Landroid/database/Cursor;

    .line 625
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mHistoryCursor:Landroid/database/Cursor;

    goto :goto_0
.end method

.method public getGroupCount()I
    .locals 2

    .prologue
    .line 593
    invoke-super {p0}, Lcom/android/browser/DateSortedExpandableListAdapter;->getGroupCount()I

    move-result v1

    invoke-direct {p0}, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->isMostVisitedEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    add-int/2addr v0, v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getGroupView(IZLandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .parameter "groupPosition"
    .parameter "isExpanded"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 631
    invoke-super {p0}, Lcom/android/browser/DateSortedExpandableListAdapter;->getGroupCount()I

    move-result v2

    if-lt p1, v2, :cond_4

    .line 632
    iget-object v2, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mMostVisited:Landroid/database/Cursor;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mMostVisited:Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->isClosed()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 633
    :cond_0
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Data is not valid"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 636
    :cond_1
    if-eqz p3, :cond_2

    instance-of v2, p3, Landroid/widget/TextView;

    if-nez v2, :cond_3

    .line 637
    :cond_2
    invoke-virtual {p0}, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 638
    .local v0, factory:Landroid/view/LayoutInflater;
    const v2, 0x7f04001c

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 642
    .end local v0           #factory:Landroid/view/LayoutInflater;
    .local v1, item:Landroid/widget/TextView;
    :goto_0
    const v2, 0x7f0c004d

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 645
    .end local v1           #item:Landroid/widget/TextView;
    :goto_1
    return-object v1

    :cond_3
    move-object v1, p3

    .line 640
    check-cast v1, Landroid/widget/TextView;

    .restart local v1       #item:Landroid/widget/TextView;
    goto :goto_0

    .line 645
    .end local v1           #item:Landroid/widget/TextView;
    :cond_4
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/browser/DateSortedExpandableListAdapter;->getGroupView(IZLandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    goto :goto_1
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 609
    invoke-super {p0}, Lcom/android/browser/DateSortedExpandableListAdapter;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 610
    const/4 v0, 0x0

    .line 612
    :goto_0
    return v0

    :cond_0
    invoke-direct {p0}, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->isMostVisitedEmpty()Z

    move-result v0

    goto :goto_0
.end method

.method moveCursorToChildPosition(II)Z
    .locals 1
    .parameter "groupPosition"
    .parameter "childPosition"

    .prologue
    .line 651
    invoke-super {p0}, Lcom/android/browser/DateSortedExpandableListAdapter;->getGroupCount()I

    move-result v0

    if-lt p1, v0, :cond_1

    .line 652
    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mMostVisited:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mMostVisited:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 653
    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryAdapter;->mMostVisited:Landroid/database/Cursor;

    invoke-interface {v0, p2}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 654
    const/4 v0, 0x1

    .line 658
    :goto_0
    return v0

    .line 656
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 658
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/android/browser/DateSortedExpandableListAdapter;->moveCursorToChildPosition(II)Z

    move-result v0

    goto :goto_0
.end method
