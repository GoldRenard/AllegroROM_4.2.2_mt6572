.class Lcom/android/browser/BrowserHistoryPage$HistoryWrapper$1;
.super Landroid/database/DataSetObserver;
.source "BrowserHistoryPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/BrowserHistoryPage$HistoryWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/BrowserHistoryPage$HistoryWrapper;


# direct methods
.method constructor <init>(Lcom/android/browser/BrowserHistoryPage$HistoryWrapper;)V
    .locals 0
    .parameter

    .prologue
    .line 467
    iput-object p1, p0, Lcom/android/browser/BrowserHistoryPage$HistoryWrapper$1;->this$0:Lcom/android/browser/BrowserHistoryPage$HistoryWrapper;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    .prologue
    .line 470
    invoke-super {p0}, Landroid/database/DataSetObserver;->onChanged()V

    .line 471
    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryWrapper$1;->this$0:Lcom/android/browser/BrowserHistoryPage$HistoryWrapper;

    invoke-virtual {v0}, Lcom/android/browser/BrowserHistoryPage$HistoryWrapper;->notifyDataSetChanged()V

    .line 472
    return-void
.end method

.method public onInvalidated()V
    .locals 1

    .prologue
    .line 476
    invoke-super {p0}, Landroid/database/DataSetObserver;->onInvalidated()V

    .line 477
    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$HistoryWrapper$1;->this$0:Lcom/android/browser/BrowserHistoryPage$HistoryWrapper;

    invoke-virtual {v0}, Lcom/android/browser/BrowserHistoryPage$HistoryWrapper;->notifyDataSetInvalidated()V

    .line 478
    return-void
.end method
