.class Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;
.super Landroid/database/DataSetObserver;
.source "CustomAdapterView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AdapterDataSetObserver"
.end annotation


# instance fields
.field private mInstanceState:Landroid/os/Parcelable;

.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;)V
    .locals 1
    .parameter

    .prologue
    .line 759
    .local p0, this:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;,"Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView<TT;>.AdapterDataSetObserver;"
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    .line 761
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->mInstanceState:Landroid/os/Parcelable;

    return-void
.end method


# virtual methods
.method public clearSavedState()V
    .locals 1

    .prologue
    .line 806
    .local p0, this:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;,"Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView<TT;>.AdapterDataSetObserver;"
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->mInstanceState:Landroid/os/Parcelable;

    .line 807
    return-void
.end method

.method public onChanged()V
    .locals 2

    .prologue
    .line 765
    .local p0, this:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;,"Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView<TT;>.AdapterDataSetObserver;"
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->mDataChanged:Z

    .line 766
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    iget v1, v1, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->mItemCount:I

    iput v1, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->mOldItemCount:I

    .line 767
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v1

    invoke-interface {v1}, Landroid/widget/Adapter;->getCount()I

    move-result v1

    iput v1, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->mItemCount:I

    .line 771
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    invoke-interface {v0}, Landroid/widget/Adapter;->hasStableIds()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->mInstanceState:Landroid/os/Parcelable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    iget v0, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->mOldItemCount:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    iget v0, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->mItemCount:I

    if-lez v0, :cond_0

    .line 773
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->mInstanceState:Landroid/os/Parcelable;

    #calls: Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->onRestoreInstanceState(Landroid/os/Parcelable;)V
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->access$000(Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;Landroid/os/Parcelable;)V

    .line 774
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->mInstanceState:Landroid/os/Parcelable;

    .line 778
    :goto_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->checkFocus()V

    .line 779
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->requestLayout()V

    .line 780
    return-void

    .line 776
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->rememberSyncState()V

    goto :goto_0
.end method

.method public onInvalidated()V
    .locals 6

    .prologue
    .local p0, this:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;,"Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView<TT;>.AdapterDataSetObserver;"
    const-wide/high16 v4, -0x8000

    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 784
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->mDataChanged:Z

    .line 786
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    invoke-interface {v0}, Landroid/widget/Adapter;->hasStableIds()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 789
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    #calls: Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->onSaveInstanceState()Landroid/os/Parcelable;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->access$100(Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;)Landroid/os/Parcelable;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->mInstanceState:Landroid/os/Parcelable;

    .line 793
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    iget v1, v1, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->mItemCount:I

    iput v1, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->mOldItemCount:I

    .line 794
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    iput v3, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->mItemCount:I

    .line 795
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    iput v2, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->mSelectedPosition:I

    .line 796
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    iput-wide v4, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->mSelectedRowId:J

    .line 797
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    iput v2, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->mNextSelectedPosition:I

    .line 798
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    iput-wide v4, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->mNextSelectedRowId:J

    .line 799
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    iput-boolean v3, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->mNeedSync:Z

    .line 801
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->checkFocus()V

    .line 802
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->requestLayout()V

    .line 803
    return-void
.end method
