.class Lcom/android/browser/AddBookmarkFolderForOP01Menu$1;
.super Ljava/lang/Object;
.source "AddBookmarkFolderForOP01Menu.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/AddBookmarkFolderForOP01Menu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/app/LoaderManager$LoaderCallbacks",
        "<",
        "Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/AddBookmarkFolderForOP01Menu;


# direct methods
.method constructor <init>(Lcom/android/browser/AddBookmarkFolderForOP01Menu;)V
    .locals 0
    .parameter

    .prologue
    .line 431
    iput-object p1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$1;->this$0:Lcom/android/browser/AddBookmarkFolderForOP01Menu;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 3
    .parameter "id"
    .parameter "args"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/content/Loader",
            "<",
            "Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 465
    new-instance v0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfoLoader;

    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$1;->this$0:Lcom/android/browser/AddBookmarkFolderForOP01Menu;

    iget-object v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$1;->this$0:Lcom/android/browser/AddBookmarkFolderForOP01Menu;

    #getter for: Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mMap:Landroid/os/Bundle;
    invoke-static {v2}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->access$300(Lcom/android/browser/AddBookmarkFolderForOP01Menu;)Landroid/os/Bundle;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfoLoader;-><init>(Landroid/content/Context;Landroid/os/Bundle;)V

    return-object v0
.end method

.method public onLoadFinished(Landroid/content/Loader;Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;)V
    .locals 5
    .parameter
    .parameter "info"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader",
            "<",
            "Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;",
            ">;",
            "Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;",
            ")V"
        }
    .end annotation

    .prologue
    .line 440
    .local p1, loader:Landroid/content/Loader;,"Landroid/content/Loader<Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;>;"
    const/4 v0, 0x0

    .line 445
    .local v0, setAccount:Z
    iget-wide v1, p2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mLastUsedId:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    iget-wide v1, p2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mLastUsedId:J

    iget-wide v3, p2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mId:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 446
    if-eqz v0, :cond_2

    iget-wide v1, p2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mLastUsedId:J

    iget-object v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$1;->this$0:Lcom/android/browser/AddBookmarkFolderForOP01Menu;

    #getter for: Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mRootFolder:J
    invoke-static {v3}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->access$000(Lcom/android/browser/AddBookmarkFolderForOP01Menu;)J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-eqz v1, :cond_2

    iget-object v1, p2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mLastUsedAccountName:Ljava/lang/String;

    iget-object v2, p2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mAccountName:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mLastUsedAccountType:Ljava/lang/String;

    iget-object v2, p2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mAccountType:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 449
    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$1;->this$0:Lcom/android/browser/AddBookmarkFolderForOP01Menu;

    #getter for: Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;
    invoke-static {v1}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->access$100(Lcom/android/browser/AddBookmarkFolderForOP01Menu;)Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    move-result-object v1

    iget-wide v2, p2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mLastUsedId:J

    iget-object v4, p2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mLastUsedTitle:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v4}, Lcom/android/browser/addbookmark/FolderSpinnerAdapter;->addRecentFolder(JLjava/lang/String;)V

    .line 458
    :cond_0
    :goto_0
    if-nez v0, :cond_1

    .line 459
    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$1;->this$0:Lcom/android/browser/AddBookmarkFolderForOP01Menu;

    #getter for: Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAccountSpinner:Landroid/widget/Spinner;
    invoke-static {v1}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->access$200(Lcom/android/browser/AddBookmarkFolderForOP01Menu;)Landroid/widget/Spinner;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 461
    :cond_1
    return-void

    .line 450
    :cond_2
    if-nez v0, :cond_0

    .line 451
    const/4 v0, 0x1

    .line 452
    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$1;->this$0:Lcom/android/browser/AddBookmarkFolderForOP01Menu;

    iget-object v2, p2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mLastUsedAccountName:Ljava/lang/String;

    iget-object v3, p2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mLastUsedAccountType:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->setAccount(Ljava/lang/String;Ljava/lang/String;)V

    .line 453
    iget-wide v1, p2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mLastUsedId:J

    iget-object v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$1;->this$0:Lcom/android/browser/AddBookmarkFolderForOP01Menu;

    #getter for: Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mRootFolder:J
    invoke-static {v3}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->access$000(Lcom/android/browser/AddBookmarkFolderForOP01Menu;)J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 454
    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$1;->this$0:Lcom/android/browser/AddBookmarkFolderForOP01Menu;

    #getter for: Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;
    invoke-static {v1}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->access$100(Lcom/android/browser/AddBookmarkFolderForOP01Menu;)Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    move-result-object v1

    iget-wide v2, p2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mLastUsedId:J

    iget-object v4, p2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mLastUsedTitle:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v4}, Lcom/android/browser/addbookmark/FolderSpinnerAdapter;->addRecentFolder(JLjava/lang/String;)V

    goto :goto_0
.end method

.method public bridge synthetic onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 431
    check-cast p2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/android/browser/AddBookmarkFolderForOP01Menu$1;->onLoadFinished(Landroid/content/Loader;Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;)V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader",
            "<",
            "Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 436
    .local p1, loader:Landroid/content/Loader;,"Landroid/content/Loader<Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;>;"
    return-void
.end method
