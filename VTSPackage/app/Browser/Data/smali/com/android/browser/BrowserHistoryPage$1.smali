.class Lcom/android/browser/BrowserHistoryPage$1;
.super Ljava/lang/Object;
.source "BrowserHistoryPage.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/BrowserHistoryPage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/BrowserHistoryPage;


# direct methods
.method constructor <init>(Lcom/android/browser/BrowserHistoryPage;)V
    .locals 0
    .parameter

    .prologue
    .line 256
    iput-object p1, p0, Lcom/android/browser/BrowserHistoryPage$1;->this$0:Lcom/android/browser/BrowserHistoryPage;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
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
    .line 264
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$1;->this$0:Lcom/android/browser/BrowserHistoryPage;

    iget-object v0, v0, Lcom/android/browser/BrowserHistoryPage;->mChildWrapper:Lcom/android/browser/BrowserHistoryPage$HistoryChildWrapper;

    invoke-virtual {v0, p3}, Lcom/android/browser/BrowserHistoryPage$HistoryChildWrapper;->setSelectedGroup(I)V

    .line 265
    iget-object v0, p0, Lcom/android/browser/BrowserHistoryPage$1;->this$0:Lcom/android/browser/BrowserHistoryPage;

    iget-object v0, v0, Lcom/android/browser/BrowserHistoryPage;->mGroupList:Landroid/widget/ListView;

    const/4 v1, 0x1

    invoke-virtual {v0, p3, v1}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 266
    return-void
.end method
