.class public Lcom/android/browser/view/BookmarkExpandableView;
.super Landroid/widget/ExpandableListView;
.source "BookmarkExpandableView.java"

# interfaces
.implements Lcom/android/browser/BreadCrumbView$Controller;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/view/BookmarkExpandableView$BookmarkContextMenuInfo;,
        Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;
    }
.end annotation


# static fields
.field public static final LOCAL_ACCOUNT_NAME:Ljava/lang/String; = "local"


# instance fields
.field private mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

.field private mBreadcrumbController:Lcom/android/browser/BreadCrumbView$Controller;

.field private mChildClickListener:Landroid/view/View$OnClickListener;

.field private mColumnWidth:I

.field private mContext:Landroid/content/Context;

.field private mContextMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

.field private mGroupOnClickListener:Landroid/view/View$OnClickListener;

.field private mLongClickable:Z

.field private mMaxColumnCount:I

.field private mOnChildClickListener:Landroid/widget/ExpandableListView$OnChildClickListener;

.field private mOnCreateContextMenuListener:Landroid/view/View$OnCreateContextMenuListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 62
    invoke-direct {p0, p1}, Landroid/widget/ExpandableListView;-><init>(Landroid/content/Context;)V

    .line 55
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mContextMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

    .line 225
    new-instance v0, Lcom/android/browser/view/BookmarkExpandableView$1;

    invoke-direct {v0, p0}, Lcom/android/browser/view/BookmarkExpandableView$1;-><init>(Lcom/android/browser/view/BookmarkExpandableView;)V

    iput-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mChildClickListener:Landroid/view/View$OnClickListener;

    .line 246
    new-instance v0, Lcom/android/browser/view/BookmarkExpandableView$2;

    invoke-direct {v0, p0}, Lcom/android/browser/view/BookmarkExpandableView$2;-><init>(Lcom/android/browser/view/BookmarkExpandableView;)V

    iput-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mGroupOnClickListener:Landroid/view/View$OnClickListener;

    .line 63
    invoke-virtual {p0, p1}, Lcom/android/browser/view/BookmarkExpandableView;->init(Landroid/content/Context;)V

    .line 64
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 67
    invoke-direct {p0, p1, p2}, Landroid/widget/ExpandableListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 55
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mContextMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

    .line 225
    new-instance v0, Lcom/android/browser/view/BookmarkExpandableView$1;

    invoke-direct {v0, p0}, Lcom/android/browser/view/BookmarkExpandableView$1;-><init>(Lcom/android/browser/view/BookmarkExpandableView;)V

    iput-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mChildClickListener:Landroid/view/View$OnClickListener;

    .line 246
    new-instance v0, Lcom/android/browser/view/BookmarkExpandableView$2;

    invoke-direct {v0, p0}, Lcom/android/browser/view/BookmarkExpandableView$2;-><init>(Lcom/android/browser/view/BookmarkExpandableView;)V

    iput-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mGroupOnClickListener:Landroid/view/View$OnClickListener;

    .line 68
    invoke-virtual {p0, p1}, Lcom/android/browser/view/BookmarkExpandableView;->init(Landroid/content/Context;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 73
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ExpandableListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 55
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mContextMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

    .line 225
    new-instance v0, Lcom/android/browser/view/BookmarkExpandableView$1;

    invoke-direct {v0, p0}, Lcom/android/browser/view/BookmarkExpandableView$1;-><init>(Lcom/android/browser/view/BookmarkExpandableView;)V

    iput-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mChildClickListener:Landroid/view/View$OnClickListener;

    .line 246
    new-instance v0, Lcom/android/browser/view/BookmarkExpandableView$2;

    invoke-direct {v0, p0}, Lcom/android/browser/view/BookmarkExpandableView$2;-><init>(Lcom/android/browser/view/BookmarkExpandableView;)V

    iput-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mGroupOnClickListener:Landroid/view/View$OnClickListener;

    .line 74
    invoke-virtual {p0, p1}, Lcom/android/browser/view/BookmarkExpandableView;->init(Landroid/content/Context;)V

    .line 75
    return-void
.end method

.method static synthetic access$100(Lcom/android/browser/view/BookmarkExpandableView;)Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/browser/view/BookmarkExpandableView;)Landroid/widget/ExpandableListView$OnChildClickListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mOnChildClickListener:Landroid/widget/ExpandableListView$OnChildClickListener;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/browser/view/BookmarkExpandableView;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$302(Lcom/android/browser/view/BookmarkExpandableView;Landroid/content/Context;)Landroid/content/Context;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 46
    iput-object p1, p0, Lcom/android/browser/view/BookmarkExpandableView;->mContext:Landroid/content/Context;

    return-object p1
.end method

.method static synthetic access$400(Lcom/android/browser/view/BookmarkExpandableView;)Landroid/view/View$OnClickListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mChildClickListener:Landroid/view/View$OnClickListener;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/browser/view/BookmarkExpandableView;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mLongClickable:Z

    return v0
.end method

.method static synthetic access$600(Lcom/android/browser/view/BookmarkExpandableView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mColumnWidth:I

    return v0
.end method

.method static synthetic access$700(Lcom/android/browser/view/BookmarkExpandableView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mMaxColumnCount:I

    return v0
.end method

.method static synthetic access$800(Lcom/android/browser/view/BookmarkExpandableView;)Landroid/view/View$OnClickListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mGroupOnClickListener:Landroid/view/View$OnClickListener;

    return-object v0
.end method


# virtual methods
.method public addAccount(Ljava/lang/String;Lcom/android/browser/BrowserBookmarksAdapter;Z)V
    .locals 3
    .parameter "accountName"
    .parameter "adapter"
    .parameter "expandGroup"

    .prologue
    .line 122
    iget-object v2, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    iget-object v2, v2, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->mGroups:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    .line 123
    .local v1, indexOf:I
    if-ltz v1, :cond_2

    .line 124
    iget-object v2, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    iget-object v2, v2, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/browser/BrowserBookmarksAdapter;

    .line 125
    .local v0, existing:Lcom/android/browser/BrowserBookmarksAdapter;
    if-eq v0, p2, :cond_0

    .line 126
    iget-object v2, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    iget-object v2, v2, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->mObserver:Landroid/database/DataSetObserver;

    invoke-virtual {v0, v2}, Lcom/android/browser/BrowserBookmarksAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 128
    iget-object v2, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    iget-object v2, v2, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 129
    iget-object v2, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    iget-object v2, v2, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v2, v1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 130
    iget-object v2, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    iget-object v2, v2, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->mObserver:Landroid/database/DataSetObserver;

    invoke-virtual {p2, v2}, Lcom/android/browser/BrowserBookmarksAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 137
    .end local v0           #existing:Lcom/android/browser/BrowserBookmarksAdapter;
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    invoke-virtual {v2}, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->notifyDataSetChanged()V

    .line 138
    if-eqz p3, :cond_1

    .line 139
    iget-object v2, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    invoke-virtual {v2}, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->getGroupCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v2}, Lcom/android/browser/view/BookmarkExpandableView;->expandGroup(I)Z

    .line 141
    :cond_1
    return-void

    .line 133
    :cond_2
    iget-object v2, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    iget-object v2, v2, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->mGroups:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    iget-object v2, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    iget-object v2, v2, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 135
    iget-object v2, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    iget-object v2, v2, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->mObserver:Landroid/database/DataSetObserver;

    invoke-virtual {p2, v2}, Lcom/android/browser/BrowserBookmarksAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    goto :goto_0
.end method

.method public clearAccounts()V
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    invoke-virtual {v0}, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->clear()V

    .line 117
    return-void
.end method

.method public createContextMenu(Landroid/view/ContextMenu;)V
    .locals 3
    .parameter "menu"

    .prologue
    .line 171
    invoke-virtual {p0}, Lcom/android/browser/view/BookmarkExpandableView;->getContextMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v0

    .local v0, menuInfo:Landroid/view/ContextMenu$ContextMenuInfo;
    move-object v1, p1

    .line 175
    check-cast v1, Lcom/android/internal/view/menu/MenuBuilder;

    invoke-virtual {v1, v0}, Lcom/android/internal/view/menu/MenuBuilder;->setCurrentMenuInfo(Landroid/view/ContextMenu$ContextMenuInfo;)V

    .line 177
    invoke-virtual {p0, p1}, Lcom/android/browser/view/BookmarkExpandableView;->onCreateContextMenu(Landroid/view/ContextMenu;)V

    .line 178
    iget-object v1, p0, Lcom/android/browser/view/BookmarkExpandableView;->mOnCreateContextMenuListener:Landroid/view/View$OnCreateContextMenuListener;

    if-eqz v1, :cond_0

    .line 179
    iget-object v1, p0, Lcom/android/browser/view/BookmarkExpandableView;->mOnCreateContextMenuListener:Landroid/view/View$OnCreateContextMenuListener;

    invoke-interface {v1, p1, p0, v0}, Landroid/view/View$OnCreateContextMenuListener;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    :cond_0
    move-object v1, p1

    .line 184
    check-cast v1, Lcom/android/internal/view/menu/MenuBuilder;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/internal/view/menu/MenuBuilder;->setCurrentMenuInfo(Landroid/view/ContextMenu$ContextMenuInfo;)V

    .line 186
    iget-object v1, p0, Lcom/android/browser/view/BookmarkExpandableView;->mParent:Landroid/view/ViewParent;

    if-eqz v1, :cond_1

    .line 187
    iget-object v1, p0, Lcom/android/browser/view/BookmarkExpandableView;->mParent:Landroid/view/ViewParent;

    invoke-interface {v1, p1}, Landroid/view/ViewParent;->createContextMenu(Landroid/view/ContextMenu;)V

    .line 189
    :cond_1
    return-void
.end method

.method public getBreadCrumbs(I)Lcom/android/browser/BreadCrumbView;
    .locals 1
    .parameter "groupPosition"

    .prologue
    .line 263
    iget-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    invoke-virtual {v0, p1}, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->getBreadCrumbView(I)Lcom/android/browser/BreadCrumbView;

    move-result-object v0

    return-object v0
.end method

.method public getChildAdapter(I)Lcom/android/browser/BrowserBookmarksAdapter;
    .locals 1
    .parameter "groupPosition"

    .prologue
    .line 222
    iget-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    iget-object v0, v0, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/browser/BrowserBookmarksAdapter;

    return-object v0
.end method

.method protected getContextMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mContextMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

    return-object v0
.end method

.method public hideAllGroups()V
    .locals 2

    .prologue
    .line 144
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    invoke-virtual {v1}, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->getGroupCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 145
    invoke-virtual {p0, v0}, Lcom/android/browser/view/BookmarkExpandableView;->getBreadCrumbs(I)Lcom/android/browser/BreadCrumbView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/browser/BreadCrumbView;->popView()V

    .line 146
    invoke-virtual {p0, v0}, Lcom/android/browser/view/BookmarkExpandableView;->collapseGroup(I)Z

    .line 144
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 148
    :cond_0
    return-void
.end method

.method init(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 78
    iput-object p1, p0, Lcom/android/browser/view/BookmarkExpandableView;->mContext:Landroid/content/Context;

    .line 79
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/browser/view/BookmarkExpandableView;->setItemsCanFocus(Z)V

    .line 80
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/browser/view/BookmarkExpandableView;->setLongClickable(Z)V

    .line 81
    iget-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e0007

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mMaxColumnCount:I

    .line 83
    const/high16 v0, 0x200

    invoke-virtual {p0, v0}, Lcom/android/browser/view/BookmarkExpandableView;->setScrollBarStyle(I)V

    .line 84
    new-instance v0, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    iget-object v1, p0, Lcom/android/browser/view/BookmarkExpandableView;->mContext:Landroid/content/Context;

    invoke-direct {v0, p0, v1}, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;-><init>(Lcom/android/browser/view/BookmarkExpandableView;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    .line 85
    iget-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    invoke-super {p0, v0}, Landroid/widget/ExpandableListView;->setAdapter(Landroid/widget/ExpandableListAdapter;)V

    .line 86
    return-void
.end method

.method protected onMeasure(II)V
    .locals 5
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    const/4 v4, 0x0

    .line 90
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 91
    .local v0, width:I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 92
    .local v1, widthMode:I
    if-lez v0, :cond_0

    .line 93
    iget-object v2, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    invoke-virtual {v2, v0}, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->measureChildren(I)V

    .line 94
    iget-object v2, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    iget v2, v2, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->mRowPadding:I

    iget-object v3, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    iget v3, v3, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->mRowPadding:I

    invoke-virtual {p0, v2, v4, v3, v4}, Lcom/android/browser/view/BookmarkExpandableView;->setPadding(IIII)V

    .line 95
    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    .line 97
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/ExpandableListView;->onMeasure(II)V

    .line 98
    invoke-virtual {p0}, Lcom/android/browser/view/BookmarkExpandableView;->getMeasuredWidth()I

    move-result v2

    if-eq v0, v2, :cond_1

    .line 99
    iget-object v2, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    invoke-virtual {p0}, Lcom/android/browser/view/BookmarkExpandableView;->getMeasuredWidth()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->measureChildren(I)V

    .line 101
    :cond_1
    return-void
.end method

.method public onTop(Lcom/android/browser/BreadCrumbView;ILjava/lang/Object;)V
    .locals 1
    .parameter "view"
    .parameter "level"
    .parameter "data"

    .prologue
    .line 207
    iget-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mBreadcrumbController:Lcom/android/browser/BreadCrumbView$Controller;

    if-eqz v0, :cond_0

    .line 208
    iget-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mBreadcrumbController:Lcom/android/browser/BreadCrumbView$Controller;

    invoke-interface {v0, p1, p2, p3}, Lcom/android/browser/BreadCrumbView$Controller;->onTop(Lcom/android/browser/BreadCrumbView;ILjava/lang/Object;)V

    .line 210
    :cond_0
    return-void
.end method

.method public saveGroupState()Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 267
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 268
    .local v3, obj:Lorg/json/JSONObject;
    iget-object v4, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    invoke-virtual {v4}, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->getGroupCount()I

    move-result v1

    .line 269
    .local v1, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_2

    .line 270
    iget-object v4, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    iget-object v4, v4, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->mGroups:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 271
    .local v0, acctName:Ljava/lang/String;
    invoke-virtual {p0, v2}, Lcom/android/browser/view/BookmarkExpandableView;->isGroupExpanded(I)Z

    move-result v4

    if-nez v4, :cond_0

    .line 272
    if-eqz v0, :cond_1

    .end local v0           #acctName:Ljava/lang/String;
    :goto_1
    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 269
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 272
    .restart local v0       #acctName:Ljava/lang/String;
    :cond_1
    const-string v0, "local"

    goto :goto_1

    .line 275
    .end local v0           #acctName:Ljava/lang/String;
    :cond_2
    return-object v3
.end method

.method public setAdapter(Landroid/widget/ExpandableListAdapter;)V
    .locals 2
    .parameter "adapter"

    .prologue
    .line 105
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Not supported"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setBreadcrumbController(Lcom/android/browser/BreadCrumbView$Controller;)V
    .locals 0
    .parameter "controller"

    .prologue
    .line 213
    iput-object p1, p0, Lcom/android/browser/view/BookmarkExpandableView;->mBreadcrumbController:Lcom/android/browser/BreadCrumbView$Controller;

    .line 214
    return-void
.end method

.method public setColumnWidthFromLayout(I)V
    .locals 4
    .parameter "layout"

    .prologue
    const/4 v3, 0x0

    .line 109
    iget-object v2, p0, Lcom/android/browser/view/BookmarkExpandableView;->mContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 110
    .local v0, infalter:Landroid/view/LayoutInflater;
    invoke-virtual {v0, p1, p0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 111
    .local v1, v:Landroid/view/View;
    invoke-virtual {v1, v3, v3}, Landroid/view/View;->measure(II)V

    .line 112
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    iput v2, p0, Lcom/android/browser/view/BookmarkExpandableView;->mColumnWidth:I

    .line 113
    return-void
.end method

.method public setOnChildClickListener(Landroid/widget/ExpandableListView$OnChildClickListener;)V
    .locals 0
    .parameter "onChildClickListener"

    .prologue
    .line 152
    iput-object p1, p0, Lcom/android/browser/view/BookmarkExpandableView;->mOnChildClickListener:Landroid/widget/ExpandableListView$OnChildClickListener;

    .line 153
    return-void
.end method

.method public setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V
    .locals 1
    .parameter "l"

    .prologue
    .line 157
    iput-object p1, p0, Lcom/android/browser/view/BookmarkExpandableView;->mOnCreateContextMenuListener:Landroid/view/View$OnCreateContextMenuListener;

    .line 158
    iget-boolean v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mLongClickable:Z

    if-nez v0, :cond_0

    .line 159
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mLongClickable:Z

    .line 160
    iget-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    if-eqz v0, :cond_0

    .line 161
    iget-object v0, p0, Lcom/android/browser/view/BookmarkExpandableView;->mAdapter:Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;

    invoke-virtual {v0}, Lcom/android/browser/view/BookmarkExpandableView$BookmarkAccountAdapter;->notifyDataSetChanged()V

    .line 164
    :cond_0
    return-void
.end method

.method public showContextMenuForChild(Landroid/view/View;)Z
    .locals 4
    .parameter "originalView"

    .prologue
    .line 193
    const/high16 v2, 0x7f0d

    invoke-virtual {p1, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 194
    .local v1, groupPosition:I
    const v2, 0x7f0d0001

    invoke-virtual {p1, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 196
    .local v0, childPosition:I
    new-instance v2, Lcom/android/browser/view/BookmarkExpandableView$BookmarkContextMenuInfo;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v1, v3}, Lcom/android/browser/view/BookmarkExpandableView$BookmarkContextMenuInfo;-><init>(IILcom/android/browser/view/BookmarkExpandableView$1;)V

    iput-object v2, p0, Lcom/android/browser/view/BookmarkExpandableView;->mContextMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

    .line 198
    invoke-virtual {p0}, Lcom/android/browser/view/BookmarkExpandableView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 199
    invoke-virtual {p0}, Lcom/android/browser/view/BookmarkExpandableView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    invoke-interface {v2, p0}, Landroid/view/ViewParent;->showContextMenuForChild(Landroid/view/View;)Z

    .line 202
    :cond_0
    const/4 v2, 0x1

    return v2
.end method
