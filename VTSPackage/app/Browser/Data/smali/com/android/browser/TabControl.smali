.class Lcom/android/browser/TabControl;
.super Ljava/lang/Object;
.source "TabControl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/TabControl$OnTabCountChangedListener;,
        Lcom/android/browser/TabControl$OnThumbnailUpdatedListener;
    }
.end annotation


# static fields
.field private static final CURRENT:Ljava/lang/String; = "current"

.field private static final LOGTAG:Ljava/lang/String; = "TabControl"

.field private static final POSITIONS:Ljava/lang/String; = "positions"

.field private static sNextId:J


# instance fields
.field private final mController:Lcom/android/browser/Controller;

.field private mCurrentTab:I

.field private mMaxTabs:I

.field private mOnTabCountChangedListener:Lcom/android/browser/TabControl$OnTabCountChangedListener;

.field private mOnThumbnailUpdatedListener:Lcom/android/browser/TabControl$OnThumbnailUpdatedListener;

.field private mTabQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/browser/Tab;",
            ">;"
        }
    .end annotation
.end field

.field private mTabs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/browser/Tab;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 35
    const-wide/16 v0, 0x1

    sput-wide v0, Lcom/android/browser/TabControl;->sNextId:J

    return-void
.end method

.method constructor <init>(Lcom/android/browser/Controller;)V
    .locals 2
    .parameter "controller"

    .prologue
    .line 66
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 55
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/browser/TabControl;->mCurrentTab:I

    .line 67
    iput-object p1, p0, Lcom/android/browser/TabControl;->mController:Lcom/android/browser/Controller;

    .line 68
    iget-object v0, p0, Lcom/android/browser/TabControl;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v0}, Lcom/android/browser/Controller;->getMaxTabs()I

    move-result v0

    iput v0, p0, Lcom/android/browser/TabControl;->mMaxTabs:I

    .line 69
    new-instance v0, Ljava/util/ArrayList;

    iget v1, p0, Lcom/android/browser/TabControl;->mMaxTabs:I

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    .line 70
    new-instance v0, Ljava/util/ArrayList;

    iget v1, p0, Lcom/android/browser/TabControl;->mMaxTabs:I

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/android/browser/TabControl;->mTabQueue:Ljava/util/ArrayList;

    .line 71
    return-void
.end method

.method private createNewWebView()Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 686
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/browser/TabControl;->createNewWebView(Z)Landroid/webkit/WebView;

    move-result-object v0

    return-object v0
.end method

.method private createNewWebView(Z)Landroid/webkit/WebView;
    .locals 1
    .parameter "privateBrowsing"

    .prologue
    .line 695
    iget-object v0, p0, Lcom/android/browser/TabControl;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v0}, Lcom/android/browser/Controller;->getWebViewFactory()Lcom/android/browser/WebViewFactory;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/browser/WebViewFactory;->createWebView(Z)Landroid/webkit/WebView;

    move-result-object v0

    return-object v0
.end method

.method private getHalfLeastUsedTabs(Lcom/android/browser/Tab;)Ljava/util/Vector;
    .locals 6
    .parameter "current"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/browser/Tab;",
            ")",
            "Ljava/util/Vector",
            "<",
            "Lcom/android/browser/Tab;",
            ">;"
        }
    .end annotation

    .prologue
    .line 512
    new-instance v3, Ljava/util/Vector;

    invoke-direct {v3}, Ljava/util/Vector;-><init>()V

    .line 516
    .local v3, tabsToGo:Ljava/util/Vector;,"Ljava/util/Vector<Lcom/android/browser/Tab;>;"
    invoke-virtual {p0}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_0

    if-nez p1, :cond_1

    .line 542
    :cond_0
    :goto_0
    return-object v3

    .line 520
    :cond_1
    iget-object v4, p0, Lcom/android/browser/TabControl;->mTabQueue:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-eqz v4, :cond_0

    .line 527
    const/4 v1, 0x0

    .line 528
    .local v1, openTabCount:I
    iget-object v4, p0, Lcom/android/browser/TabControl;->mTabQueue:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/browser/Tab;

    .line 529
    .local v2, t:Lcom/android/browser/Tab;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 530
    add-int/lit8 v1, v1, 0x1

    .line 531
    if-eq v2, p1, :cond_2

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getParent()Lcom/android/browser/Tab;

    move-result-object v4

    if-eq v2, v4, :cond_2

    .line 532
    invoke-virtual {v3, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 537
    .end local v2           #t:Lcom/android/browser/Tab;
    :cond_3
    div-int/lit8 v1, v1, 0x2

    .line 538
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v4

    if-le v4, v1, :cond_0

    .line 539
    invoke-virtual {v3, v1}, Ljava/util/Vector;->setSize(I)V

    goto :goto_0
.end method

.method private getLessUsedTabs(Lcom/android/browser/Tab;)Ljava/util/Vector;
    .locals 6
    .parameter "current"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/browser/Tab;",
            ")",
            "Ljava/util/Vector",
            "<",
            "Lcom/android/browser/Tab;",
            ">;"
        }
    .end annotation

    .prologue
    .line 547
    new-instance v3, Ljava/util/Vector;

    invoke-direct {v3}, Ljava/util/Vector;-><init>()V

    .line 551
    .local v3, tabsToGo:Ljava/util/Vector;,"Ljava/util/Vector<Lcom/android/browser/Tab;>;"
    invoke-virtual {p0}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_0

    if-nez p1, :cond_1

    .line 572
    :cond_0
    return-object v3

    .line 555
    :cond_1
    iget-object v4, p0, Lcom/android/browser/TabControl;->mTabQueue:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-eqz v4, :cond_0

    .line 562
    const/4 v1, 0x0

    .line 563
    .local v1, openTabCount:I
    iget-object v4, p0, Lcom/android/browser/TabControl;->mTabQueue:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/browser/Tab;

    .line 564
    .local v2, t:Lcom/android/browser/Tab;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 565
    add-int/lit8 v1, v1, 0x1

    .line 566
    if-eq v2, p1, :cond_2

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getParent()Lcom/android/browser/Tab;

    move-result-object v4

    if-eq v2, v4, :cond_2

    .line 567
    invoke-virtual {v3, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method static declared-synchronized getNextId()J
    .locals 6

    .prologue
    .line 74
    const-class v1, Lcom/android/browser/TabControl;

    monitor-enter v1

    :try_start_0
    sget-wide v2, Lcom/android/browser/TabControl;->sNextId:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v2

    sput-wide v4, Lcom/android/browser/TabControl;->sNextId:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-wide v2

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private hasState(JLandroid/os/Bundle;)Z
    .locals 4
    .parameter "id"
    .parameter "state"

    .prologue
    const/4 v1, 0x0

    .line 384
    const-wide/16 v2, -0x1

    cmp-long v2, p1, v2

    if-nez v2, :cond_1

    .line 386
    :cond_0
    :goto_0
    return v1

    .line 385
    :cond_1
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 386
    .local v0, tab:Landroid/os/Bundle;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/os/Bundle;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method private isIncognito(JLandroid/os/Bundle;)Z
    .locals 2
    .parameter "id"
    .parameter "state"

    .prologue
    .line 390
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 391
    .local v0, tabstate:Landroid/os/Bundle;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/os/Bundle;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 392
    const-string v1, "privateBrowsingEnabled"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    .line 394
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private setCurrentTab(Lcom/android/browser/Tab;Z)Z
    .locals 8
    .parameter "newTab"
    .parameter "force"

    .prologue
    const/4 v5, 0x0

    const/4 v7, -0x1

    const/4 v4, 0x1

    .line 711
    iget v6, p0, Lcom/android/browser/TabControl;->mCurrentTab:I

    invoke-virtual {p0, v6}, Lcom/android/browser/TabControl;->getTab(I)Lcom/android/browser/Tab;

    move-result-object v0

    .line 712
    .local v0, current:Lcom/android/browser/Tab;
    if-ne v0, p1, :cond_0

    if-nez p2, :cond_0

    .line 740
    :goto_0
    return v4

    .line 715
    :cond_0
    if-eqz v0, :cond_1

    .line 716
    invoke-virtual {v0}, Lcom/android/browser/Tab;->putInBackground()V

    .line 717
    iput v7, p0, Lcom/android/browser/TabControl;->mCurrentTab:I

    .line 719
    :cond_1
    if-nez p1, :cond_2

    move v4, v5

    .line 720
    goto :goto_0

    .line 724
    :cond_2
    iget-object v6, p0, Lcom/android/browser/TabControl;->mTabQueue:Ljava/util/ArrayList;

    invoke-virtual {v6, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    .line 725
    .local v1, index:I
    if-eq v1, v7, :cond_3

    .line 726
    iget-object v6, p0, Lcom/android/browser/TabControl;->mTabQueue:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 728
    :cond_3
    iget-object v6, p0, Lcom/android/browser/TabControl;->mTabQueue:Ljava/util/ArrayList;

    invoke-virtual {v6, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 731
    iget-object v6, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v6, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v6

    iput v6, p0, Lcom/android/browser/TabControl;->mCurrentTab:I

    .line 732
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v2

    .line 733
    .local v2, mainView:Landroid/webkit/WebView;
    invoke-virtual {p1}, Lcom/android/browser/Tab;->isSnapshot()Z

    move-result v6

    if-nez v6, :cond_5

    if-nez v2, :cond_5

    move v3, v4

    .line 734
    .local v3, needRestore:Z
    :goto_1
    if-eqz v3, :cond_4

    .line 736
    invoke-direct {p0}, Lcom/android/browser/TabControl;->createNewWebView()Landroid/webkit/WebView;

    move-result-object v2

    .line 737
    invoke-virtual {p1, v2}, Lcom/android/browser/Tab;->setWebView(Landroid/webkit/WebView;)V

    .line 739
    :cond_4
    invoke-virtual {p1}, Lcom/android/browser/Tab;->putInForeground()V

    goto :goto_0

    .end local v3           #needRestore:Z
    :cond_5
    move v3, v5

    .line 733
    goto :goto_1
.end method

.method private tabMatchesUrl(Lcom/android/browser/Tab;Ljava/lang/String;)Z
    .locals 1
    .parameter "t"
    .parameter "url"

    .prologue
    .line 641
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getOriginalUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method addPreloadedTab(Lcom/android/browser/Tab;)V
    .locals 6
    .parameter "tab"

    .prologue
    .line 181
    iget-object v2, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/browser/Tab;

    .line 182
    .local v0, current:Lcom/android/browser/Tab;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/browser/Tab;->getId()J

    move-result-wide v2

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getId()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 183
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tab with id "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " already exists: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/android/browser/Tab;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 187
    .end local v0           #current:Lcom/android/browser/Tab;
    :cond_1
    iget-object v2, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 188
    iget-object v2, p0, Lcom/android/browser/TabControl;->mOnTabCountChangedListener:Lcom/android/browser/TabControl$OnTabCountChangedListener;

    if-eqz v2, :cond_2

    .line 189
    iget-object v2, p0, Lcom/android/browser/TabControl;->mOnTabCountChangedListener:Lcom/android/browser/TabControl$OnTabCountChangedListener;

    invoke-interface {v2}, Lcom/android/browser/TabControl$OnTabCountChangedListener;->onTabCountChanged()V

    .line 192
    :cond_2
    iget-object v2, p0, Lcom/android/browser/TabControl;->mController:Lcom/android/browser/Controller;

    invoke-virtual {p1, v2}, Lcom/android/browser/Tab;->setController(Lcom/android/browser/WebViewController;)V

    .line 193
    iget-object v2, p0, Lcom/android/browser/TabControl;->mController:Lcom/android/browser/Controller;

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v3

    invoke-virtual {v2, p1, v3}, Lcom/android/browser/Controller;->onSetWebView(Lcom/android/browser/Tab;Landroid/webkit/WebView;)V

    .line 194
    invoke-virtual {p1}, Lcom/android/browser/Tab;->putInBackground()V

    .line 195
    return-void
.end method

.method canCreateNewTab()Z
    .locals 2

    .prologue
    .line 163
    iget v0, p0, Lcom/android/browser/TabControl;->mMaxTabs:I

    iget-object v1, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method canRestoreState(Landroid/os/Bundle;Z)J
    .locals 11
    .parameter "inState"
    .parameter "restoreIncognitoTabs"

    .prologue
    .line 363
    if-nez p1, :cond_1

    const/4 v6, 0x0

    .line 364
    .local v6, ids:[J
    :goto_0
    if-nez v6, :cond_2

    .line 365
    const-wide/16 v1, -0x1

    .line 380
    :cond_0
    :goto_1
    return-wide v1

    .line 363
    .end local v6           #ids:[J
    :cond_1
    const-string v10, "positions"

    invoke-virtual {p1, v10}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object v6

    goto :goto_0

    .line 367
    .restart local v6       #ids:[J
    :cond_2
    const-string v10, "current"

    invoke-virtual {p1, v10}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v8

    .line 368
    .local v8, oldcurrent:J
    const-wide/16 v1, -0x1

    .line 369
    .local v1, current:J
    if-nez p2, :cond_3

    invoke-direct {p0, v8, v9, p1}, Lcom/android/browser/TabControl;->hasState(JLandroid/os/Bundle;)Z

    move-result v10

    if-eqz v10, :cond_4

    invoke-direct {p0, v8, v9, p1}, Lcom/android/browser/TabControl;->isIncognito(JLandroid/os/Bundle;)Z

    move-result v10

    if-nez v10, :cond_4

    .line 370
    :cond_3
    move-wide v1, v8

    goto :goto_1

    .line 373
    :cond_4
    move-object v0, v6

    .local v0, arr$:[J
    array-length v7, v0

    .local v7, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_2
    if-ge v3, v7, :cond_0

    aget-wide v4, v0, v3

    .line 374
    .local v4, id:J
    invoke-direct {p0, v4, v5, p1}, Lcom/android/browser/TabControl;->hasState(JLandroid/os/Bundle;)Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-direct {p0, v4, v5, p1}, Lcom/android/browser/TabControl;->isIncognito(JLandroid/os/Bundle;)Z

    move-result v10

    if-nez v10, :cond_5

    .line 375
    move-wide v1, v4

    .line 376
    goto :goto_1

    .line 373
    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_2
.end method

.method createNewTab()Lcom/android/browser/Tab;
    .locals 1

    .prologue
    .line 231
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/browser/TabControl;->createNewTab(Z)Lcom/android/browser/Tab;

    move-result-object v0

    return-object v0
.end method

.method createNewTab(Landroid/os/Bundle;Z)Lcom/android/browser/Tab;
    .locals 4
    .parameter "state"
    .parameter "privateBrowsing"

    .prologue
    .line 207
    iget-object v3, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 209
    .local v0, size:I
    invoke-virtual {p0}, Lcom/android/browser/TabControl;->canCreateNewTab()Z

    move-result v3

    if-nez v3, :cond_0

    .line 210
    const/4 v1, 0x0

    .line 223
    :goto_0
    return-object v1

    .line 213
    :cond_0
    invoke-direct {p0, p2}, Lcom/android/browser/TabControl;->createNewWebView(Z)Landroid/webkit/WebView;

    move-result-object v2

    .line 216
    .local v2, w:Landroid/webkit/WebView;
    new-instance v1, Lcom/android/browser/Tab;

    iget-object v3, p0, Lcom/android/browser/TabControl;->mController:Lcom/android/browser/Controller;

    invoke-direct {v1, v3, v2, p1}, Lcom/android/browser/Tab;-><init>(Lcom/android/browser/WebViewController;Landroid/webkit/WebView;Landroid/os/Bundle;)V

    .line 217
    .local v1, t:Lcom/android/browser/Tab;
    iget-object v3, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 218
    iget-object v3, p0, Lcom/android/browser/TabControl;->mOnTabCountChangedListener:Lcom/android/browser/TabControl$OnTabCountChangedListener;

    if-eqz v3, :cond_1

    .line 219
    iget-object v3, p0, Lcom/android/browser/TabControl;->mOnTabCountChangedListener:Lcom/android/browser/TabControl$OnTabCountChangedListener;

    invoke-interface {v3}, Lcom/android/browser/TabControl$OnTabCountChangedListener;->onTabCountChanged()V

    .line 222
    :cond_1
    invoke-virtual {v1}, Lcom/android/browser/Tab;->putInBackground()V

    goto :goto_0
.end method

.method createNewTab(Z)Lcom/android/browser/Tab;
    .locals 1
    .parameter "privateBrowsing"

    .prologue
    .line 203
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/android/browser/TabControl;->createNewTab(Landroid/os/Bundle;Z)Lcom/android/browser/Tab;

    move-result-object v0

    return-object v0
.end method

.method createSnapshotTab(J)Lcom/android/browser/SnapshotTab;
    .locals 2
    .parameter "snapshotId"

    .prologue
    .line 235
    new-instance v0, Lcom/android/browser/SnapshotTab;

    iget-object v1, p0, Lcom/android/browser/TabControl;->mController:Lcom/android/browser/Controller;

    invoke-direct {v0, v1, p1, p2}, Lcom/android/browser/SnapshotTab;-><init>(Lcom/android/browser/WebViewController;J)V

    .line 236
    .local v0, t:Lcom/android/browser/SnapshotTab;
    iget-object v1, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 237
    iget-object v1, p0, Lcom/android/browser/TabControl;->mOnTabCountChangedListener:Lcom/android/browser/TabControl$OnTabCountChangedListener;

    if-eqz v1, :cond_0

    .line 238
    iget-object v1, p0, Lcom/android/browser/TabControl;->mOnTabCountChangedListener:Lcom/android/browser/TabControl$OnTabCountChangedListener;

    invoke-interface {v1}, Lcom/android/browser/TabControl$OnTabCountChangedListener;->onTabCountChanged()V

    .line 240
    :cond_0
    return-object v0
.end method

.method destroy()V
    .locals 3

    .prologue
    .line 295
    iget-object v2, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/browser/Tab;

    .line 296
    .local v1, t:Lcom/android/browser/Tab;
    invoke-virtual {v1}, Lcom/android/browser/Tab;->destroy()V

    goto :goto_0

    .line 298
    .end local v1           #t:Lcom/android/browser/Tab;
    :cond_0
    iget-object v2, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 299
    iget-object v2, p0, Lcom/android/browser/TabControl;->mTabQueue:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 300
    return-void
.end method

.method findTabWithUrl(Ljava/lang/String;)Lcom/android/browser/Tab;
    .locals 5
    .parameter "url"

    .prologue
    const/4 v3, 0x0

    .line 649
    if-nez p1, :cond_1

    move-object v0, v3

    .line 663
    :cond_0
    :goto_0
    return-object v0

    .line 653
    :cond_1
    invoke-virtual {p0}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 654
    .local v0, currentTab:Lcom/android/browser/Tab;
    if-eqz v0, :cond_2

    invoke-direct {p0, v0, p1}, Lcom/android/browser/TabControl;->tabMatchesUrl(Lcom/android/browser/Tab;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 658
    :cond_2
    iget-object v4, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/browser/Tab;

    .line 659
    .local v2, tab:Lcom/android/browser/Tab;
    invoke-direct {p0, v2, p1}, Lcom/android/browser/TabControl;->tabMatchesUrl(Lcom/android/browser/Tab;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    move-object v0, v2

    .line 660
    goto :goto_0

    .end local v2           #tab:Lcom/android/browser/Tab;
    :cond_4
    move-object v0, v3

    .line 663
    goto :goto_0
.end method

.method freeMemory()V
    .locals 7

    .prologue
    .line 482
    invoke-virtual {p0}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v4

    if-nez v4, :cond_1

    .line 509
    :cond_0
    :goto_0
    return-void

    .line 485
    :cond_1
    const/4 v2, 0x0

    .line 489
    .local v2, tabs:Ljava/util/Vector;,"Ljava/util/Vector<Lcom/android/browser/Tab;>;"
    invoke-virtual {p0}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/browser/TabControl;->getLessUsedTabs(Lcom/android/browser/Tab;)Ljava/util/Vector;

    move-result-object v2

    .line 491
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v4

    if-lez v4, :cond_2

    .line 492
    const-string v4, "TabControl"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Free "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " tabs in the browser"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 493
    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/browser/Tab;

    .line 495
    .local v1, t:Lcom/android/browser/Tab;
    invoke-virtual {v1}, Lcom/android/browser/Tab;->saveState()Landroid/os/Bundle;

    .line 497
    invoke-virtual {v1}, Lcom/android/browser/Tab;->destroy()V

    goto :goto_1

    .line 504
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #t:Lcom/android/browser/Tab;
    :cond_2
    const-string v4, "TabControl"

    const-string v5, "Free WebView\'s unused memory and cache"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 505
    invoke-virtual {p0}, Lcom/android/browser/TabControl;->getCurrentWebView()Landroid/webkit/WebView;

    move-result-object v3

    .line 506
    .local v3, view:Landroid/webkit/WebView;
    if-eqz v3, :cond_0

    .line 507
    invoke-virtual {v3}, Landroid/webkit/WebView;->freeMemory()V

    goto :goto_0
.end method

.method getCurrentPosition()I
    .locals 1

    .prologue
    .line 147
    iget v0, p0, Lcom/android/browser/TabControl;->mCurrentTab:I

    return v0
.end method

.method getCurrentSubWindow()Landroid/webkit/WebView;
    .locals 2

    .prologue
    .line 108
    iget v1, p0, Lcom/android/browser/TabControl;->mCurrentTab:I

    invoke-virtual {p0, v1}, Lcom/android/browser/TabControl;->getTab(I)Lcom/android/browser/Tab;

    move-result-object v0

    .line 109
    .local v0, t:Lcom/android/browser/Tab;
    if-nez v0, :cond_0

    .line 110
    const/4 v1, 0x0

    .line 112
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lcom/android/browser/Tab;->getSubWebView()Landroid/webkit/WebView;

    move-result-object v1

    goto :goto_0
.end method

.method getCurrentTab()Lcom/android/browser/Tab;
    .locals 1

    .prologue
    .line 139
    iget v0, p0, Lcom/android/browser/TabControl;->mCurrentTab:I

    invoke-virtual {p0, v0}, Lcom/android/browser/TabControl;->getTab(I)Lcom/android/browser/Tab;

    move-result-object v0

    return-object v0
.end method

.method getCurrentTopWebView()Landroid/webkit/WebView;
    .locals 2

    .prologue
    .line 96
    iget v1, p0, Lcom/android/browser/TabControl;->mCurrentTab:I

    invoke-virtual {p0, v1}, Lcom/android/browser/TabControl;->getTab(I)Lcom/android/browser/Tab;

    move-result-object v0

    .line 97
    .local v0, t:Lcom/android/browser/Tab;
    if-nez v0, :cond_0

    .line 98
    const/4 v1, 0x0

    .line 100
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lcom/android/browser/Tab;->getTopWindow()Landroid/webkit/WebView;

    move-result-object v1

    goto :goto_0
.end method

.method getCurrentWebView()Landroid/webkit/WebView;
    .locals 2

    .prologue
    .line 83
    iget v1, p0, Lcom/android/browser/TabControl;->mCurrentTab:I

    invoke-virtual {p0, v1}, Lcom/android/browser/TabControl;->getTab(I)Lcom/android/browser/Tab;

    move-result-object v0

    .line 84
    .local v0, t:Lcom/android/browser/Tab;
    if-nez v0, :cond_0

    .line 85
    const/4 v1, 0x0

    .line 87
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    goto :goto_0
.end method

.method getLeastUsedTab(Lcom/android/browser/Tab;)Lcom/android/browser/Tab;
    .locals 5
    .parameter "current"

    .prologue
    const/4 v2, 0x0

    .line 576
    invoke-virtual {p0}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_0

    if-nez p1, :cond_1

    :cond_0
    move-object v1, v2

    .line 591
    :goto_0
    return-object v1

    .line 579
    :cond_1
    iget-object v3, p0, Lcom/android/browser/TabControl;->mTabQueue:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_2

    move-object v1, v2

    .line 580
    goto :goto_0

    .line 584
    :cond_2
    iget-object v3, p0, Lcom/android/browser/TabControl;->mTabQueue:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/browser/Tab;

    .line 585
    .local v1, t:Lcom/android/browser/Tab;
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 586
    if-eq v1, p1, :cond_3

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getParent()Lcom/android/browser/Tab;

    move-result-object v3

    if-eq v1, v3, :cond_3

    goto :goto_0

    .end local v1           #t:Lcom/android/browser/Tab;
    :cond_4
    move-object v1, v2

    .line 591
    goto :goto_0
.end method

.method public getOnThumbnailUpdatedListener()Lcom/android/browser/TabControl$OnThumbnailUpdatedListener;
    .locals 1

    .prologue
    .line 754
    iget-object v0, p0, Lcom/android/browser/TabControl;->mOnThumbnailUpdatedListener:Lcom/android/browser/TabControl$OnThumbnailUpdatedListener;

    return-object v0
.end method

.method getTab(I)Lcom/android/browser/Tab;
    .locals 1
    .parameter "position"

    .prologue
    .line 128
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 129
    iget-object v0, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/browser/Tab;

    .line 131
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getTabCount()I
    .locals 1

    .prologue
    .line 307
    iget-object v0, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method getTabFromAppId(Ljava/lang/String;)Lcom/android/browser/Tab;
    .locals 4
    .parameter "id"

    .prologue
    const/4 v2, 0x0

    .line 612
    if-nez p1, :cond_0

    move-object v1, v2

    .line 620
    :goto_0
    return-object v1

    .line 615
    :cond_0
    iget-object v3, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/browser/Tab;

    .line 616
    .local v1, t:Lcom/android/browser/Tab;
    invoke-virtual {v1}, Lcom/android/browser/Tab;->getAppId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .end local v1           #t:Lcom/android/browser/Tab;
    :cond_2
    move-object v1, v2

    .line 620
    goto :goto_0
.end method

.method getTabFromView(Landroid/webkit/WebView;)Lcom/android/browser/Tab;
    .locals 3
    .parameter "view"

    .prologue
    .line 599
    iget-object v2, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/browser/Tab;

    .line 600
    .local v1, t:Lcom/android/browser/Tab;
    invoke-virtual {v1}, Lcom/android/browser/Tab;->getSubWebView()Landroid/webkit/WebView;

    move-result-object v2

    if-eq v2, p1, :cond_1

    invoke-virtual {v1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v2

    if-ne v2, p1, :cond_0

    .line 604
    .end local v1           #t:Lcom/android/browser/Tab;
    :cond_1
    :goto_0
    return-object v1

    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method getTabPosition(Lcom/android/browser/Tab;)I
    .locals 1
    .parameter "tab"

    .prologue
    .line 156
    if-nez p1, :cond_0

    .line 157
    const/4 v0, -0x1

    .line 159
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    goto :goto_0
.end method

.method getTabs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/browser/Tab;",
            ">;"
        }
    .end annotation

    .prologue
    .line 119
    iget-object v0, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    return-object v0
.end method

.method hasAnyOpenIncognitoTabs()Z
    .locals 3

    .prologue
    .line 171
    iget-object v2, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/browser/Tab;

    .line 172
    .local v1, tab:Lcom/android/browser/Tab;
    invoke-virtual {v1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/webkit/WebView;->isPrivateBrowsingEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 174
    const/4 v2, 0x1

    .line 177
    .end local v1           #tab:Lcom/android/browser/Tab;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method recreateWebView(Lcom/android/browser/Tab;)V
    .locals 3
    .parameter "t"

    .prologue
    .line 670
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    .line 671
    .local v0, w:Landroid/webkit/WebView;
    if-eqz v0, :cond_0

    .line 672
    invoke-virtual {p1}, Lcom/android/browser/Tab;->destroy()V

    .line 676
    :cond_0
    invoke-direct {p0}, Lcom/android/browser/TabControl;->createNewWebView()Landroid/webkit/WebView;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Lcom/android/browser/Tab;->setWebView(Landroid/webkit/WebView;Z)V

    .line 677
    invoke-virtual {p0}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v1

    if-ne v1, p1, :cond_1

    .line 678
    const/4 v1, 0x1

    invoke-direct {p0, p1, v1}, Lcom/android/browser/TabControl;->setCurrentTab(Lcom/android/browser/Tab;Z)Z

    .line 680
    :cond_1
    return-void
.end method

.method removeParentChildRelationShips()V
    .locals 3

    .prologue
    .line 247
    iget-object v2, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/browser/Tab;

    .line 248
    .local v1, tab:Lcom/android/browser/Tab;
    invoke-virtual {v1}, Lcom/android/browser/Tab;->removeFromTree()V

    goto :goto_0

    .line 250
    .end local v1           #tab:Lcom/android/browser/Tab;
    :cond_0
    return-void
.end method

.method removeTab(Lcom/android/browser/Tab;)Z
    .locals 2
    .parameter "t"

    .prologue
    .line 258
    if-nez p1, :cond_0

    .line 259
    const/4 v1, 0x0

    .line 288
    :goto_0
    return v1

    .line 263
    :cond_0
    invoke-virtual {p0}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 266
    .local v0, current:Lcom/android/browser/Tab;
    iget-object v1, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 269
    if-ne v0, p1, :cond_2

    .line 270
    invoke-virtual {p1}, Lcom/android/browser/Tab;->putInBackground()V

    .line 271
    const/4 v1, -0x1

    iput v1, p0, Lcom/android/browser/TabControl;->mCurrentTab:I

    .line 279
    :goto_1
    invoke-virtual {p1}, Lcom/android/browser/Tab;->destroy()V

    .line 281
    invoke-virtual {p1}, Lcom/android/browser/Tab;->removeFromTree()V

    .line 284
    iget-object v1, p0, Lcom/android/browser/TabControl;->mTabQueue:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 285
    iget-object v1, p0, Lcom/android/browser/TabControl;->mOnTabCountChangedListener:Lcom/android/browser/TabControl$OnTabCountChangedListener;

    if-eqz v1, :cond_1

    .line 286
    iget-object v1, p0, Lcom/android/browser/TabControl;->mOnTabCountChangedListener:Lcom/android/browser/TabControl$OnTabCountChangedListener;

    invoke-interface {v1}, Lcom/android/browser/TabControl$OnTabCountChangedListener;->onTabCountChanged()V

    .line 288
    :cond_1
    const/4 v1, 0x1

    goto :goto_0

    .line 275
    :cond_2
    invoke-virtual {p0, v0}, Lcom/android/browser/TabControl;->getTabPosition(Lcom/android/browser/Tab;)I

    move-result v1

    iput v1, p0, Lcom/android/browser/TabControl;->mCurrentTab:I

    goto :goto_1
.end method

.method restoreState(Landroid/os/Bundle;JZZ)V
    .locals 23
    .parameter "inState"
    .parameter "currentId"
    .parameter "restoreIncognitoTabs"
    .parameter "restoreAll"

    .prologue
    .line 407
    const-wide/16 v20, -0x1

    cmp-long v20, p2, v20

    if-nez v20, :cond_1

    .line 475
    :cond_0
    return-void

    .line 410
    :cond_1
    const-string v20, "positions"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object v9

    .line 411
    .local v9, ids:[J
    const-wide v11, -0x7fffffffffffffffL

    .line 412
    .local v11, maxId:J
    new-instance v19, Ljava/util/HashMap;

    invoke-direct/range {v19 .. v19}, Ljava/util/HashMap;-><init>()V

    .line 413
    .local v19, tabMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/browser/Tab;>;"
    move-object v3, v9

    .local v3, arr$:[J
    array-length v10, v3

    .local v10, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_0
    if-ge v5, v10, :cond_9

    aget-wide v6, v3, v5

    .line 414
    .local v6, id:J
    cmp-long v20, v6, v11

    if-lez v20, :cond_2

    .line 415
    move-wide v11, v6

    .line 417
    :cond_2
    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    .line 418
    .local v8, idkey:Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v16

    .line 419
    .local v16, state:Landroid/os/Bundle;
    if-eqz v16, :cond_3

    invoke-virtual/range {v16 .. v16}, Landroid/os/Bundle;->isEmpty()Z

    move-result v20

    if-eqz v20, :cond_4

    .line 413
    :cond_3
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 422
    :cond_4
    if-nez p4, :cond_5

    const-string v20, "privateBrowsingEnabled"

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v20

    if-nez v20, :cond_3

    .line 425
    :cond_5
    cmp-long v20, v6, p2

    if-eqz v20, :cond_6

    if-eqz p5, :cond_7

    .line 426
    :cond_6
    const/16 v20, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/browser/TabControl;->createNewTab(Landroid/os/Bundle;Z)Lcom/android/browser/Tab;

    move-result-object v17

    .line 427
    .local v17, t:Lcom/android/browser/Tab;
    if-eqz v17, :cond_3

    .line 432
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 435
    cmp-long v20, v6, p2

    if-nez v20, :cond_3

    .line 436
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/android/browser/TabControl;->setCurrentTab(Lcom/android/browser/Tab;)Z

    goto :goto_1

    .line 441
    .end local v17           #t:Lcom/android/browser/Tab;
    :cond_7
    new-instance v17, Lcom/android/browser/Tab;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/TabControl;->mController:Lcom/android/browser/Controller;

    move-object/from16 v20, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lcom/android/browser/Tab;-><init>(Lcom/android/browser/WebViewController;Landroid/os/Bundle;)V

    .line 442
    .restart local v17       #t:Lcom/android/browser/Tab;
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 443
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 444
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/TabControl;->mOnTabCountChangedListener:Lcom/android/browser/TabControl$OnTabCountChangedListener;

    move-object/from16 v20, v0

    if-eqz v20, :cond_8

    .line 445
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/TabControl;->mOnTabCountChangedListener:Lcom/android/browser/TabControl$OnTabCountChangedListener;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Lcom/android/browser/TabControl$OnTabCountChangedListener;->onTabCountChanged()V

    .line 448
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/TabControl;->mTabQueue:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v21

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto/16 :goto_1

    .line 454
    .end local v6           #id:J
    .end local v8           #idkey:Ljava/lang/String;
    .end local v16           #state:Landroid/os/Bundle;
    .end local v17           #t:Lcom/android/browser/Tab;
    :cond_9
    const-wide/16 v20, 0x1

    add-long v20, v20, v11

    sput-wide v20, Lcom/android/browser/TabControl;->sNextId:J

    .line 456
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/browser/TabControl;->mCurrentTab:I

    move/from16 v20, v0

    const/16 v21, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_a

    .line 457
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v20

    if-lez v20, :cond_a

    .line 458
    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/android/browser/TabControl;->getTab(I)Lcom/android/browser/Tab;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/android/browser/TabControl;->setCurrentTab(Lcom/android/browser/Tab;)Z

    .line 462
    :cond_a
    move-object v3, v9

    array-length v10, v3

    const/4 v5, 0x0

    :goto_2
    if-ge v5, v10, :cond_0

    aget-wide v6, v3, v5

    .line 463
    .restart local v6       #id:J
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/android/browser/Tab;

    .line 464
    .local v18, tab:Lcom/android/browser/Tab;
    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v4

    .line 465
    .local v4, b:Landroid/os/Bundle;
    if-eqz v4, :cond_b

    if-eqz v18, :cond_b

    .line 466
    const-string v20, "parentTab"

    const-wide/16 v21, -0x1

    move-object/from16 v0, v20

    move-wide/from16 v1, v21

    invoke-virtual {v4, v0, v1, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v14

    .line 467
    .local v14, parentId:J
    const-wide/16 v20, -0x1

    cmp-long v20, v14, v20

    if-eqz v20, :cond_b

    .line 468
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/android/browser/Tab;

    .line 469
    .local v13, parent:Lcom/android/browser/Tab;
    if-eqz v13, :cond_b

    .line 470
    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lcom/android/browser/Tab;->addChildTab(Lcom/android/browser/Tab;)V

    .line 462
    .end local v13           #parent:Lcom/android/browser/Tab;
    .end local v14           #parentId:J
    :cond_b
    add-int/lit8 v5, v5, 0x1

    goto :goto_2
.end method

.method saveState(Landroid/os/Bundle;)V
    .locals 14
    .parameter "outState"

    .prologue
    .line 319
    invoke-virtual {p0}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v9

    .line 320
    .local v9, numTabs:I
    if-nez v9, :cond_1

    .line 354
    :cond_0
    :goto_0
    return-void

    .line 323
    :cond_1
    new-array v7, v9, [J

    .line 324
    .local v7, ids:[J
    const/4 v4, 0x0

    .line 325
    .local v4, i:I
    iget-object v12, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/browser/Tab;

    .line 326
    .local v10, tab:Lcom/android/browser/Tab;
    invoke-virtual {v10}, Lcom/android/browser/Tab;->saveState()Landroid/os/Bundle;

    move-result-object v11

    .line 327
    .local v11, tabState:Landroid/os/Bundle;
    if-eqz v11, :cond_4

    .line 328
    add-int/lit8 v5, v4, 0x1

    .end local v4           #i:I
    .local v5, i:I
    invoke-virtual {v10}, Lcom/android/browser/Tab;->getId()J

    move-result-wide v12

    aput-wide v12, v7, v4

    .line 329
    invoke-virtual {v10}, Lcom/android/browser/Tab;->getId()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    .line 330
    .local v8, key:Ljava/lang/String;
    invoke-virtual {p1, v8}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 332
    iget-object v12, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/browser/Tab;

    .line 333
    .local v3, dt:Lcom/android/browser/Tab;
    const-string v12, "TabControl"

    invoke-virtual {v3}, Lcom/android/browser/Tab;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 335
    .end local v3           #dt:Lcom/android/browser/Tab;
    :cond_2
    new-instance v12, Ljava/lang/IllegalStateException;

    const-string v13, "Error saving state, duplicate tab ids!"

    invoke-direct {v12, v13}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 338
    :cond_3
    invoke-virtual {p1, v8, v11}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    move v4, v5

    .line 339
    .end local v5           #i:I
    .restart local v4       #i:I
    goto :goto_1

    .line 340
    .end local v8           #key:Ljava/lang/String;
    :cond_4
    add-int/lit8 v5, v4, 0x1

    .end local v4           #i:I
    .restart local v5       #i:I
    const-wide/16 v12, -0x1

    aput-wide v12, v7, v4

    .line 342
    invoke-virtual {v10}, Lcom/android/browser/Tab;->deleteThumbnail()V

    move v4, v5

    .end local v5           #i:I
    .restart local v4       #i:I
    goto :goto_1

    .line 345
    .end local v10           #tab:Lcom/android/browser/Tab;
    .end local v11           #tabState:Landroid/os/Bundle;
    :cond_5
    invoke-virtual {p1}, Landroid/os/Bundle;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_0

    .line 346
    const-string v12, "positions"

    invoke-virtual {p1, v12, v7}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    .line 347
    invoke-virtual {p0}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v2

    .line 348
    .local v2, current:Lcom/android/browser/Tab;
    const-wide/16 v0, -0x1

    .line 349
    .local v0, cid:J
    if-eqz v2, :cond_6

    .line 350
    invoke-virtual {v2}, Lcom/android/browser/Tab;->getId()J

    move-result-wide v0

    .line 352
    :cond_6
    const-string v12, "current"

    invoke-virtual {p1, v12, v0, v1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    goto/16 :goto_0
.end method

.method setCurrentTab(Lcom/android/browser/Tab;)Z
    .locals 1
    .parameter "newTab"

    .prologue
    .line 704
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/browser/TabControl;->setCurrentTab(Lcom/android/browser/Tab;Z)Z

    move-result v0

    return v0
.end method

.method public setOnTabCountChangedListener(Lcom/android/browser/TabControl$OnTabCountChangedListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 758
    iput-object p1, p0, Lcom/android/browser/TabControl;->mOnTabCountChangedListener:Lcom/android/browser/TabControl$OnTabCountChangedListener;

    .line 759
    return-void
.end method

.method public setOnThumbnailUpdatedListener(Lcom/android/browser/TabControl$OnThumbnailUpdatedListener;)V
    .locals 4
    .parameter "listener"

    .prologue
    .line 744
    iput-object p1, p0, Lcom/android/browser/TabControl;->mOnThumbnailUpdatedListener:Lcom/android/browser/TabControl$OnThumbnailUpdatedListener;

    .line 745
    iget-object v3, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/browser/Tab;

    .line 746
    .local v1, t:Lcom/android/browser/Tab;
    invoke-virtual {v1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v2

    .line 747
    .local v2, web:Landroid/webkit/WebView;
    if-eqz v2, :cond_0

    .line 748
    if-eqz p1, :cond_1

    .end local v1           #t:Lcom/android/browser/Tab;
    :goto_1
    invoke-virtual {v2, v1}, Landroid/webkit/WebView;->setPictureListener(Landroid/webkit/WebView$PictureListener;)V

    goto :goto_0

    .restart local v1       #t:Lcom/android/browser/Tab;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    .line 751
    .end local v1           #t:Lcom/android/browser/Tab;
    .end local v2           #web:Landroid/webkit/WebView;
    :cond_2
    return-void
.end method

.method stopAllLoading()V
    .locals 5

    .prologue
    .line 627
    iget-object v4, p0, Lcom/android/browser/TabControl;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/browser/Tab;

    .line 628
    .local v2, t:Lcom/android/browser/Tab;
    invoke-virtual {v2}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v3

    .line 629
    .local v3, webview:Landroid/webkit/WebView;
    if-eqz v3, :cond_1

    .line 630
    invoke-virtual {v3}, Landroid/webkit/WebView;->stopLoading()V

    .line 632
    :cond_1
    invoke-virtual {v2}, Lcom/android/browser/Tab;->getSubWebView()Landroid/webkit/WebView;

    move-result-object v1

    .line 633
    .local v1, subview:Landroid/webkit/WebView;
    if-eqz v1, :cond_0

    .line 634
    invoke-virtual {v1}, Landroid/webkit/WebView;->stopLoading()V

    goto :goto_0

    .line 637
    .end local v1           #subview:Landroid/webkit/WebView;
    .end local v2           #t:Lcom/android/browser/Tab;
    .end local v3           #webview:Landroid/webkit/WebView;
    :cond_2
    return-void
.end method
