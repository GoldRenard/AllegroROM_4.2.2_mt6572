.class Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;
.super Ljava/lang/Object;
.source "CustomAbsSpinner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RecycleBin"
.end annotation


# instance fields
.field private mScrapHeap:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;)V
    .locals 1
    .parameter

    .prologue
    .line 451
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 452
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->mScrapHeap:Landroid/util/SparseArray;

    return-void
.end method


# virtual methods
.method public add(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 459
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->mScrapHeap:Landroid/util/SparseArray;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->mScrapHeap:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 460
    return-void
.end method

.method clear()V
    .locals 6

    .prologue
    .line 486
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->mScrapHeap:Landroid/util/SparseArray;

    .line 488
    .local v2, scrapHeap:Landroid/util/SparseArray;,"Landroid/util/SparseArray<Landroid/view/View;>;"
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v0

    .line 489
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 490
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 491
    .local v3, view:Landroid/view/View;
    if-eqz v3, :cond_0

    .line 492
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;

    const/4 v5, 0x1

    #calls: Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->removeDetachedView(Landroid/view/View;Z)V
    invoke-static {v4, v3, v5}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->access$100(Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;Landroid/view/View;Z)V

    .line 489
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 496
    .end local v3           #view:Landroid/view/View;
    :cond_1
    invoke-virtual {v2}, Landroid/util/SparseArray;->clear()V

    .line 497
    return-void
.end method

.method public get()Landroid/view/View;
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 462
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->mScrapHeap:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ge v2, v3, :cond_1

    const/4 v1, 0x0

    .line 470
    :cond_0
    :goto_0
    return-object v1

    .line 464
    :cond_1
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->mScrapHeap:Landroid/util/SparseArray;

    invoke-virtual {v2, v4}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 465
    .local v1, result:Landroid/view/View;
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->mScrapHeap:Landroid/util/SparseArray;

    invoke-virtual {v2, v4}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v0

    .line 467
    .local v0, key:I
    if-eqz v1, :cond_0

    .line 468
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->mScrapHeap:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->delete(I)V

    goto :goto_0
.end method

.method get(I)Landroid/view/View;
    .locals 2
    .parameter "position"

    .prologue
    .line 474
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->mScrapHeap:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 475
    .local v0, result:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 476
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->mScrapHeap:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 478
    :cond_0
    return-object v0
.end method

.method peek(I)Landroid/view/View;
    .locals 1
    .parameter "position"

    .prologue
    .line 482
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->mScrapHeap:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    return-object v0
.end method

.method public put(ILandroid/view/View;)V
    .locals 1
    .parameter "position"
    .parameter "v"

    .prologue
    .line 455
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->mScrapHeap:Landroid/util/SparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 456
    return-void
.end method
