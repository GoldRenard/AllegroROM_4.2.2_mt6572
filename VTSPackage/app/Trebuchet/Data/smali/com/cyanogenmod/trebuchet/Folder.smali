.class public Lcom/cyanogenmod/trebuchet/Folder;
.super Landroid/widget/LinearLayout;
.source "Folder.java"

# interfaces
.implements Lcom/cyanogenmod/trebuchet/DragSource;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Lcom/cyanogenmod/trebuchet/DropTarget;
.implements Lcom/cyanogenmod/trebuchet/FolderInfo$FolderListener;
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Landroid/view/View$OnFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/Folder$GridComparator;
    }
.end annotation


# static fields
.field private static final ON_EXIT_CLOSE_DELAY:I = 0x320

.field private static final REORDER_ANIMATION_DURATION:I = 0xe6

.field static final STATE_ANIMATING:I = 0x1

.field static final STATE_NONE:I = -0x1

.field static final STATE_OPEN:I = 0x2

.field static final STATE_SMALL:I = 0x0

.field private static final TAG:Ljava/lang/String; = "Trebuchet.Folder"

.field private static sDefaultFolderName:Ljava/lang/String;

.field private static sHintText:Ljava/lang/String;


# instance fields
.field private mActionModeCallback:Landroid/view/ActionMode$Callback;

.field protected mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

.field private mCurrentDragInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;

.field private mCurrentDragView:Landroid/view/View;

.field private mDeleteFolderOnDropCompleted:Z

.field private mDestroyed:Z

.field protected mDragController:Lcom/cyanogenmod/trebuchet/DragController;

.field private mDragInProgress:Z

.field private mEmptyCell:[I

.field private mExpandDuration:I

.field private mFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

.field private mFolderIconPivotX:F

.field private mFolderIconPivotY:F

.field mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

.field private mFolderNameHeight:I

.field private final mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

.field private mIconDrawable:Landroid/graphics/drawable/Drawable;

.field private final mInflater:Landroid/view/LayoutInflater;

.field protected mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

.field private mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

.field private mIsEditingName:Z

.field private mItemAddedBackToSelfViaIcon:Z

.field private mItemsInReadingOrder:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field mItemsInvalidated:Z

.field protected mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

.field private mMaxCountX:I

.field private mMaxCountY:I

.field private mMaxNumItems:I

.field private mOnExitAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

.field mOnExitAlarmListener:Lcom/cyanogenmod/trebuchet/OnAlarmListener;

.field private mOpenCloseAnimator:Landroid/animation/ObjectAnimator;

.field private mPreviousTargetCell:[I

.field private mRearrangeOnClose:Z

.field private mReorderAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

.field mReorderAlarmListener:Lcom/cyanogenmod/trebuchet/OnAlarmListener;

.field private mState:I

.field private mSuppressFolderDeletion:Z

.field mSuppressOnAdd:Z

.field private mTargetCell:[I

.field private mTempRect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x0

    .line 120
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 75
    const/4 v1, -0x1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mState:I

    .line 78
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mRearrangeOnClose:Z

    .line 83
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mItemsInReadingOrder:Ljava/util/ArrayList;

    .line 85
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mItemsInvalidated:Z

    .line 88
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mSuppressOnAdd:Z

    .line 89
    new-array v1, v3, [I

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mTargetCell:[I

    .line 90
    new-array v1, v3, [I

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mPreviousTargetCell:[I

    .line 91
    new-array v1, v3, [I

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mEmptyCell:[I

    .line 92
    new-instance v1, Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-direct {v1}, Lcom/cyanogenmod/trebuchet/Alarm;-><init>()V

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mReorderAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    .line 93
    new-instance v1, Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-direct {v1}, Lcom/cyanogenmod/trebuchet/Alarm;-><init>()V

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mOnExitAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    .line 95
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mTempRect:Landroid/graphics/Rect;

    .line 96
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mDragInProgress:Z

    .line 97
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mDeleteFolderOnDropCompleted:Z

    .line 98
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mSuppressFolderDeletion:Z

    .line 99
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mItemAddedBackToSelfViaIcon:Z

    .line 104
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mIsEditingName:Z

    .line 187
    new-instance v1, Lcom/cyanogenmod/trebuchet/Folder$1;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/Folder$1;-><init>(Lcom/cyanogenmod/trebuchet/Folder;)V

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mActionModeCallback:Landroid/view/ActionMode$Callback;

    .line 586
    new-instance v1, Lcom/cyanogenmod/trebuchet/Folder$6;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/Folder$6;-><init>(Lcom/cyanogenmod/trebuchet/Folder;)V

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mReorderAlarmListener:Lcom/cyanogenmod/trebuchet/OnAlarmListener;

    .line 679
    new-instance v1, Lcom/cyanogenmod/trebuchet/Folder$7;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/Folder$7;-><init>(Lcom/cyanogenmod/trebuchet/Folder;)V

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mOnExitAlarmListener:Lcom/cyanogenmod/trebuchet/OnAlarmListener;

    .line 121
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Folder;->setAlwaysDrawnWithCacheEnabled(Z)V

    .line 122
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInflater:Landroid/view/LayoutInflater;

    .line 123
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/LauncherApplication;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->getIconCache()Lcom/cyanogenmod/trebuchet/IconCache;

    move-result-object v1

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    .line 125
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 126
    .local v0, res:Landroid/content/res/Resources;
    const v1, 0x7f0c0018

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mMaxCountX:I

    .line 127
    const v1, 0x7f0c0019

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mMaxCountY:I

    .line 128
    const v1, 0x7f0c001a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mMaxNumItems:I

    .line 129
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mMaxCountX:I

    if-ltz v1, :cond_0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mMaxCountY:I

    if-ltz v1, :cond_0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mMaxNumItems:I

    if-gez v1, :cond_1

    .line 130
    :cond_0
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountX()I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mMaxCountX:I

    .line 131
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountY()I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mMaxCountY:I

    .line 132
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mMaxCountX:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mMaxCountY:I

    mul-int/2addr v1, v2

    iput v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mMaxNumItems:I

    .line 135
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    .line 138
    const v1, 0x7f0c0013

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mExpandDuration:I

    .line 140
    sget-object v1, Lcom/cyanogenmod/trebuchet/Folder;->sDefaultFolderName:Ljava/lang/String;

    if-nez v1, :cond_2

    .line 141
    const v1, 0x7f09007e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/cyanogenmod/trebuchet/Folder;->sDefaultFolderName:Ljava/lang/String;

    .line 143
    :cond_2
    sget-object v1, Lcom/cyanogenmod/trebuchet/Folder;->sHintText:Ljava/lang/String;

    if-nez v1, :cond_3

    .line 144
    const v1, 0x7f0900c1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/cyanogenmod/trebuchet/Folder;->sHintText:Ljava/lang/String;

    .line 146
    :cond_3
    check-cast p1, Lcom/cyanogenmod/trebuchet/Launcher;

    .end local p1
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    .line 150
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Folder;->setFocusableInTouchMode(Z)V

    .line 151
    return-void
.end method

.method static synthetic access$000(Lcom/cyanogenmod/trebuchet/Folder;ILjava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/Folder;->sendCustomAccessibilityEvent(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$102(Lcom/cyanogenmod/trebuchet/Folder;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 57
    iput p1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mState:I

    return p1
.end method

.method static synthetic access$200(Lcom/cyanogenmod/trebuchet/Folder;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Folder;->setFocusOnFirstChild()V

    return-void
.end method

.method static synthetic access$300(Lcom/cyanogenmod/trebuchet/Folder;)Landroid/animation/ObjectAnimator;
    .locals 1
    .parameter "x0"

    .prologue
    .line 57
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mOpenCloseAnimator:Landroid/animation/ObjectAnimator;

    return-object v0
.end method

.method static synthetic access$400(Lcom/cyanogenmod/trebuchet/Folder;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Folder;->onCloseComplete()V

    return-void
.end method

.method static synthetic access$500(Lcom/cyanogenmod/trebuchet/Folder;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 57
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mEmptyCell:[I

    return-object v0
.end method

.method static synthetic access$600(Lcom/cyanogenmod/trebuchet/Folder;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 57
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mTargetCell:[I

    return-object v0
.end method

.method static synthetic access$700(Lcom/cyanogenmod/trebuchet/Folder;[I[I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/Folder;->realTimeReorder([I[I)V

    return-void
.end method

.method static synthetic access$800(Lcom/cyanogenmod/trebuchet/Folder;)Lcom/cyanogenmod/trebuchet/FolderIcon;
    .locals 1
    .parameter "x0"

    .prologue
    .line 57
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

    return-object v0
.end method

.method private arrangeChildren(Ljava/util/ArrayList;)V
    .locals 12
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    const/4 v4, 0x0

    const/4 v7, 0x1

    .line 905
    const/4 v0, 0x2

    new-array v11, v0, [I

    .line 906
    .local v11, vacant:[I
    if-nez p1, :cond_0

    .line 907
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getItemsInReadingOrder()Ljava/util/ArrayList;

    move-result-object p1

    .line 909
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->removeAllViews()V

    .line 911
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/View;

    .line 912
    .local v10, v:Landroid/view/View;
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v0, v11, v7, v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->getVacantCell([III)Z

    .line 913
    invoke-virtual {v10}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 914
    .local v9, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    aget v0, v11, v4

    iput v0, v9, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    .line 915
    aget v0, v11, v7

    iput v0, v9, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    .line 916
    invoke-virtual {v10}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 917
    .local v1, info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    iget v0, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    aget v2, v11, v4

    if-ne v0, v2, :cond_1

    iget v0, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    aget v2, v11, v7

    if-eq v0, v2, :cond_2

    .line 918
    :cond_1
    aget v0, v11, v4

    iput v0, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    .line 919
    aget v0, v11, v7

    iput v0, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    .line 920
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget-wide v2, v2, Lcom/cyanogenmod/trebuchet/FolderInfo;->id:J

    iget v5, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    iget v6, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    invoke-static/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/LauncherModel;->addOrMoveItemInDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIII)V

    .line 923
    :cond_2
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    iget-wide v5, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    long-to-int v5, v5

    move-object v3, v10

    move-object v6, v9

    invoke-virtual/range {v2 .. v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->addViewToCellLayout(Landroid/view/View;IILcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;Z)Z

    goto :goto_0

    .line 925
    .end local v1           #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .end local v9           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    .end local v10           #v:Landroid/view/View;
    :cond_3
    iput-boolean v7, p0, Lcom/cyanogenmod/trebuchet/Folder;->mItemsInvalidated:Z

    .line 926
    return-void
.end method

.method private centerAboutIcon()V
    .locals 22

    .prologue
    .line 815
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Folder;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v14

    check-cast v14, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;

    .line 817
    .local v14, lp:Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Folder;->getPaddingLeft()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Folder;->getPaddingRight()I

    move-result v20

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/cyanogenmod/trebuchet/CellLayout;->getDesiredWidth()I

    move-result v20

    add-int v18, v19, v20

    .line 818
    .local v18, width:I
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Folder;->getPaddingTop()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Folder;->getPaddingBottom()I

    move-result v20

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/cyanogenmod/trebuchet/CellLayout;->getDesiredHeight()I

    move-result v20

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderNameHeight:I

    move/from16 v20, v0

    add-int v12, v19, v20

    .line 820
    .local v12, height:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v19, v0

    const v20, 0x7f07002b

    invoke-virtual/range {v19 .. v20}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Lcom/cyanogenmod/trebuchet/DragLayer;

    .line 822
    .local v15, parent:Lcom/cyanogenmod/trebuchet/DragLayer;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Folder;->mTempRect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v15, v0, v1}, Lcom/cyanogenmod/trebuchet/DragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    move-result v16

    .line 824
    .local v16, scale:F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Folder;->mTempRect:Landroid/graphics/Rect;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Folder;->mTempRect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/Rect;->width()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    mul-float v20, v20, v16

    const/high16 v21, 0x4000

    div-float v20, v20, v21

    add-float v19, v19, v20

    move/from16 v0, v19

    float-to-int v4, v0

    .line 825
    .local v4, centerX:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Folder;->mTempRect:Landroid/graphics/Rect;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Folder;->mTempRect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/Rect;->height()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    mul-float v20, v20, v16

    const/high16 v21, 0x4000

    div-float v20, v20, v21

    add-float v19, v19, v20

    move/from16 v0, v19

    float-to-int v5, v0

    .line 826
    .local v5, centerY:I
    div-int/lit8 v19, v18, 0x2

    sub-int v6, v4, v19

    .line 827
    .local v6, centeredLeft:I
    div-int/lit8 v19, v12, 0x2

    sub-int v7, v5, v19

    .line 829
    .local v7, centeredTop:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/cyanogenmod/trebuchet/Workspace;->getCurrentPage()I

    move-result v9

    .line 832
    .local v9, currentPage:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Lcom/cyanogenmod/trebuchet/Workspace;->setFinalScrollForPageChange(I)V

    .line 834
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 835
    .local v8, currentLayout:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v2

    .line 836
    .local v2, boundingLayout:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 837
    .local v3, bounds:Landroid/graphics/Rect;
    invoke-virtual {v15, v2, v3}, Lcom/cyanogenmod/trebuchet/DragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 839
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Lcom/cyanogenmod/trebuchet/Workspace;->resetFinalScrollForPageChange(I)V

    .line 842
    iget v0, v3, Landroid/graphics/Rect;->left:I

    move/from16 v19, v0

    move/from16 v0, v19

    invoke-static {v0, v6}, Ljava/lang/Math;->max(II)I

    move-result v19

    iget v0, v3, Landroid/graphics/Rect;->left:I

    move/from16 v20, v0

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v21

    add-int v20, v20, v21

    sub-int v20, v20, v18

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->min(II)I

    move-result v13

    .line 844
    .local v13, left:I
    iget v0, v3, Landroid/graphics/Rect;->top:I

    move/from16 v19, v0

    move/from16 v0, v19

    invoke-static {v0, v7}, Ljava/lang/Math;->max(II)I

    move-result v19

    iget v0, v3, Landroid/graphics/Rect;->top:I

    move/from16 v20, v0

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v21

    add-int v20, v20, v21

    sub-int v20, v20, v12

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->min(II)I

    move-result v17

    .line 847
    .local v17, top:I
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v19

    move/from16 v0, v18

    move/from16 v1, v19

    if-lt v0, v1, :cond_0

    .line 848
    iget v0, v3, Landroid/graphics/Rect;->left:I

    move/from16 v19, v0

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v20

    sub-int v20, v20, v18

    div-int/lit8 v20, v20, 0x2

    add-int v13, v19, v20

    .line 850
    :cond_0
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v19

    move/from16 v0, v19

    if-lt v12, v0, :cond_1

    .line 851
    iget v0, v3, Landroid/graphics/Rect;->top:I

    move/from16 v19, v0

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v20

    sub-int v20, v20, v12

    div-int/lit8 v20, v20, 0x2

    add-int v17, v19, v20

    .line 854
    :cond_1
    div-int/lit8 v19, v18, 0x2

    sub-int v20, v6, v13

    add-int v10, v19, v20

    .line 855
    .local v10, folderPivotX:I
    div-int/lit8 v19, v12, 0x2

    sub-int v20, v7, v17

    add-int v11, v19, v20

    .line 856
    .local v11, folderPivotY:I
    int-to-float v0, v10

    move/from16 v19, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Folder;->setPivotX(F)V

    .line 857
    int-to-float v0, v11

    move/from16 v19, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Folder;->setPivotY(F)V

    .line 858
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getMeasuredWidth()I

    move-result v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    const/high16 v20, 0x3f80

    int-to-float v0, v10

    move/from16 v21, v0

    mul-float v20, v20, v21

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v21, v0

    div-float v20, v20, v21

    mul-float v19, v19, v20

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/Folder;->mFolderIconPivotX:F

    .line 860
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getMeasuredHeight()I

    move-result v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    const/high16 v20, 0x3f80

    int-to-float v0, v11

    move/from16 v21, v0

    mul-float v20, v20, v21

    int-to-float v0, v12

    move/from16 v21, v0

    div-float v20, v20, v21

    mul-float v19, v19, v20

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/Folder;->mFolderIconPivotY:F

    .line 863
    move/from16 v0, v18

    iput v0, v14, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->width:I

    .line 864
    iput v12, v14, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->height:I

    .line 865
    iput v13, v14, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->x:I

    .line 866
    move/from16 v0, v17

    iput v0, v14, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->y:I

    .line 867
    return-void
.end method

.method static fromXml(Landroid/content/Context;)Lcom/cyanogenmod/trebuchet/Folder;
    .locals 3
    .parameter "context"

    .prologue
    .line 413
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f04001f

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/Folder;

    return-object v0
.end method

.method private getDragViewVisualCenter(IIIILcom/cyanogenmod/trebuchet/DragView;[F)[F
    .locals 5
    .parameter "x"
    .parameter "y"
    .parameter "xOffset"
    .parameter "yOffset"
    .parameter "dragView"
    .parameter "recycle"

    .prologue
    .line 659
    if-nez p6, :cond_0

    .line 660
    const/4 v3, 0x2

    new-array v1, v3, [F

    .line 669
    .local v1, res:[F
    :goto_0
    sub-int v0, p1, p3

    .line 670
    .local v0, left:I
    sub-int v2, p2, p4

    .line 673
    .local v2, top:I
    const/4 v3, 0x0

    invoke-virtual {p5}, Lcom/cyanogenmod/trebuchet/DragView;->getDragRegion()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v0

    int-to-float v4, v4

    aput v4, v1, v3

    .line 674
    const/4 v3, 0x1

    invoke-virtual {p5}, Lcom/cyanogenmod/trebuchet/DragView;->getDragRegion()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v2

    int-to-float v4, v4

    aput v4, v1, v3

    .line 676
    return-object v1

    .line 662
    .end local v0           #left:I
    .end local v1           #res:[F
    .end local v2           #top:I
    :cond_0
    move-object v1, p6

    .restart local v1       #res:[F
    goto :goto_0
.end method

.method private getViewForInfo(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)Landroid/view/View;
    .locals 4
    .parameter "item"

    .prologue
    .line 1092
    const/4 v1, 0x0

    .local v1, j:I
    :goto_0
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCountY()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 1093
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCountX()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 1094
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v3, v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v2

    .line 1095
    .local v2, v:Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    if-ne v3, p1, :cond_0

    .line 1100
    .end local v0           #i:I
    .end local v2           #v:Landroid/view/View;
    :goto_2
    return-object v2

    .line 1093
    .restart local v0       #i:I
    .restart local v2       #v:Landroid/view/View;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1092
    .end local v2           #v:Landroid/view/View;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1100
    .end local v0           #i:I
    :cond_2
    const/4 v2, 0x0

    goto :goto_2
.end method

.method private onCloseComplete()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 937
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/DragLayer;

    .line 938
    .local v0, parent:Lcom/cyanogenmod/trebuchet/DragLayer;
    if-eqz v0, :cond_0

    .line 939
    invoke-virtual {v0, p0}, Lcom/cyanogenmod/trebuchet/DragLayer;->removeView(Landroid/view/View;)V

    .line 941
    :cond_0
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    invoke-virtual {v1, p0}, Lcom/cyanogenmod/trebuchet/DragController;->removeDropTarget(Lcom/cyanogenmod/trebuchet/DropTarget;)V

    .line 942
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->clearFocus()V

    .line 943
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->requestFocus()Z

    .line 945
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mRearrangeOnClose:Z

    if-eqz v1, :cond_1

    .line 946
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getItemCount()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/cyanogenmod/trebuchet/Folder;->setupContentForNumItems(I)V

    .line 947
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mRearrangeOnClose:Z

    .line 949
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getItemCount()I

    move-result v1

    if-gt v1, v3, :cond_2

    .line 950
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mDragInProgress:Z

    if-nez v1, :cond_3

    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mSuppressFolderDeletion:Z

    if-nez v1, :cond_3

    .line 951
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Folder;->replaceFolderWithFinalItem()V

    .line 956
    :cond_2
    :goto_0
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mSuppressFolderDeletion:Z

    .line 957
    return-void

    .line 952
    :cond_3
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mDragInProgress:Z

    if-eqz v1, :cond_2

    .line 953
    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/Folder;->mDeleteFolderOnDropCompleted:Z

    goto :goto_0
.end method

.method private placeInReadingOrder(Ljava/util/ArrayList;)V
    .locals 10
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ShortcutInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 347
    .local p1, items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ShortcutInfo;>;"
    const/4 v6, 0x0

    .line 348
    .local v6, maxX:I
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 349
    .local v0, count:I
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 350
    .local v5, item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    iget v9, v5, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    if-le v9, v6, :cond_0

    .line 351
    iget v6, v5, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    goto :goto_0

    .line 355
    .end local v5           #item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_1
    new-instance v2, Lcom/cyanogenmod/trebuchet/Folder$GridComparator;

    add-int/lit8 v9, v6, 0x1

    invoke-direct {v2, p0, v9}, Lcom/cyanogenmod/trebuchet/Folder$GridComparator;-><init>(Lcom/cyanogenmod/trebuchet/Folder;I)V

    .line 356
    .local v2, gridComparator:Lcom/cyanogenmod/trebuchet/Folder$GridComparator;
    invoke-static {p1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 357
    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v9}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCountX()I

    move-result v1

    .line 358
    .local v1, countX:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    if-ge v3, v0, :cond_2

    .line 359
    rem-int v7, v3, v1

    .line 360
    .local v7, x:I
    div-int v8, v3, v1

    .line 361
    .local v8, y:I
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 362
    .restart local v5       #item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    iput v7, v5, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    .line 363
    iput v8, v5, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    .line 358
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 365
    .end local v5           #item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .end local v7           #x:I
    .end local v8           #y:I
    :cond_2
    return-void
.end method

.method private positionAndSizeAsIcon()V
    .locals 2

    .prologue
    const v1, 0x3f4ccccd

    .line 421
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Lcom/cyanogenmod/trebuchet/DragLayer;

    if-nez v0, :cond_0

    .line 426
    :goto_0
    return-void

    .line 422
    :cond_0
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Folder;->setScaleX(F)V

    .line 423
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Folder;->setScaleY(F)V

    .line 424
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Folder;->setAlpha(F)V

    .line 425
    const/4 v0, 0x0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mState:I

    goto :goto_0
.end method

.method private realTimeReorder([I[I)V
    .locals 18
    .parameter "empty"
    .parameter "target"

    .prologue
    .line 601
    const/4 v8, 0x0

    .line 602
    .local v8, delay:I
    const/high16 v11, 0x41f0

    .line 603
    .local v11, delayAmount:F
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Folder;->readingOrderGreaterThan([I[I)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 604
    const/4 v3, 0x0

    aget v3, p1, v3

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCountX()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-lt v3, v5, :cond_1

    const/4 v15, 0x1

    .line 605
    .local v15, wrap:Z
    :goto_0
    if-eqz v15, :cond_2

    const/4 v3, 0x1

    aget v3, p1, v3

    add-int/lit8 v14, v3, 0x1

    .line 606
    .local v14, startY:I
    :goto_1
    move/from16 v17, v14

    .local v17, y:I
    :goto_2
    const/4 v3, 0x1

    aget v3, p2, v3

    move/from16 v0, v17

    if-gt v0, v3, :cond_d

    .line 607
    const/4 v3, 0x1

    aget v3, p1, v3

    move/from16 v0, v17

    if-ne v0, v3, :cond_3

    const/4 v3, 0x0

    aget v3, p1, v3

    add-int/lit8 v13, v3, 0x1

    .line 608
    .local v13, startX:I
    :goto_3
    const/4 v3, 0x1

    aget v3, p2, v3

    move/from16 v0, v17

    if-ge v0, v3, :cond_4

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCountX()I

    move-result v3

    add-int/lit8 v12, v3, -0x1

    .line 609
    .local v12, endX:I
    :goto_4
    move/from16 v16, v13

    .local v16, x:I
    :goto_5
    move/from16 v0, v16

    if-gt v0, v12, :cond_5

    .line 610
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v3, v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v4

    .line 611
    .local v4, v:Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    const/4 v5, 0x0

    aget v5, p1, v5

    const/4 v6, 0x1

    aget v6, p1, v6

    const/16 v7, 0xe6

    const/4 v9, 0x1

    const/4 v10, 0x1

    invoke-virtual/range {v3 .. v10}, Lcom/cyanogenmod/trebuchet/CellLayout;->animateChildToPosition(Landroid/view/View;IIIIZZ)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 613
    const/4 v3, 0x0

    aput v16, p1, v3

    .line 614
    const/4 v3, 0x1

    aput v17, p1, v3

    .line 615
    int-to-float v3, v8

    add-float/2addr v3, v11

    float-to-int v8, v3

    .line 616
    float-to-double v5, v11

    const-wide v9, 0x3feccccccccccccdL

    mul-double/2addr v5, v9

    double-to-float v11, v5

    .line 609
    :cond_0
    add-int/lit8 v16, v16, 0x1

    goto :goto_5

    .line 604
    .end local v4           #v:Landroid/view/View;
    .end local v12           #endX:I
    .end local v13           #startX:I
    .end local v14           #startY:I
    .end local v15           #wrap:Z
    .end local v16           #x:I
    .end local v17           #y:I
    :cond_1
    const/4 v15, 0x0

    goto :goto_0

    .line 605
    .restart local v15       #wrap:Z
    :cond_2
    const/4 v3, 0x1

    aget v14, p1, v3

    goto :goto_1

    .line 607
    .restart local v14       #startY:I
    .restart local v17       #y:I
    :cond_3
    const/4 v13, 0x0

    goto :goto_3

    .line 608
    .restart local v13       #startX:I
    :cond_4
    const/4 v3, 0x0

    aget v12, p2, v3

    goto :goto_4

    .line 606
    .restart local v12       #endX:I
    .restart local v16       #x:I
    :cond_5
    add-int/lit8 v17, v17, 0x1

    goto :goto_2

    .line 621
    .end local v12           #endX:I
    .end local v13           #startX:I
    .end local v14           #startY:I
    .end local v15           #wrap:Z
    .end local v16           #x:I
    .end local v17           #y:I
    :cond_6
    const/4 v3, 0x0

    aget v3, p1, v3

    if-nez v3, :cond_8

    const/4 v15, 0x1

    .line 622
    .restart local v15       #wrap:Z
    :goto_6
    if-eqz v15, :cond_9

    const/4 v3, 0x1

    aget v3, p1, v3

    add-int/lit8 v14, v3, -0x1

    .line 623
    .restart local v14       #startY:I
    :goto_7
    move/from16 v17, v14

    .restart local v17       #y:I
    :goto_8
    const/4 v3, 0x1

    aget v3, p2, v3

    move/from16 v0, v17

    if-lt v0, v3, :cond_d

    .line 624
    const/4 v3, 0x1

    aget v3, p1, v3

    move/from16 v0, v17

    if-ne v0, v3, :cond_a

    const/4 v3, 0x0

    aget v3, p1, v3

    add-int/lit8 v13, v3, -0x1

    .line 625
    .restart local v13       #startX:I
    :goto_9
    const/4 v3, 0x1

    aget v3, p2, v3

    move/from16 v0, v17

    if-le v0, v3, :cond_b

    const/4 v12, 0x0

    .line 626
    .restart local v12       #endX:I
    :goto_a
    move/from16 v16, v13

    .restart local v16       #x:I
    :goto_b
    move/from16 v0, v16

    if-lt v0, v12, :cond_c

    .line 627
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v3, v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v4

    .line 628
    .restart local v4       #v:Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    const/4 v5, 0x0

    aget v5, p1, v5

    const/4 v6, 0x1

    aget v6, p1, v6

    const/16 v7, 0xe6

    const/4 v9, 0x1

    const/4 v10, 0x1

    invoke-virtual/range {v3 .. v10}, Lcom/cyanogenmod/trebuchet/CellLayout;->animateChildToPosition(Landroid/view/View;IIIIZZ)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 630
    const/4 v3, 0x0

    aput v16, p1, v3

    .line 631
    const/4 v3, 0x1

    aput v17, p1, v3

    .line 632
    int-to-float v3, v8

    add-float/2addr v3, v11

    float-to-int v8, v3

    .line 633
    float-to-double v5, v11

    const-wide v9, 0x3feccccccccccccdL

    mul-double/2addr v5, v9

    double-to-float v11, v5

    .line 626
    :cond_7
    add-int/lit8 v16, v16, -0x1

    goto :goto_b

    .line 621
    .end local v4           #v:Landroid/view/View;
    .end local v12           #endX:I
    .end local v13           #startX:I
    .end local v14           #startY:I
    .end local v15           #wrap:Z
    .end local v16           #x:I
    .end local v17           #y:I
    :cond_8
    const/4 v15, 0x0

    goto :goto_6

    .line 622
    .restart local v15       #wrap:Z
    :cond_9
    const/4 v3, 0x1

    aget v14, p1, v3

    goto :goto_7

    .line 624
    .restart local v14       #startY:I
    .restart local v17       #y:I
    :cond_a
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCountX()I

    move-result v3

    add-int/lit8 v13, v3, -0x1

    goto :goto_9

    .line 625
    .restart local v13       #startX:I
    :cond_b
    const/4 v3, 0x0

    aget v12, p2, v3

    goto :goto_a

    .line 623
    .restart local v12       #endX:I
    .restart local v16       #x:I
    :cond_c
    add-int/lit8 v17, v17, -0x1

    goto :goto_8

    .line 638
    .end local v12           #endX:I
    .end local v13           #startX:I
    .end local v16           #x:I
    :cond_d
    return-void
.end method

.method private replaceFolderWithFinalItem()V
    .locals 3

    .prologue
    .line 961
    new-instance v1, Lcom/cyanogenmod/trebuchet/Folder$8;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/Folder$8;-><init>(Lcom/cyanogenmod/trebuchet/Folder;)V

    .line 1004
    .local v1, onCompleteRunnable:Ljava/lang/Runnable;
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Folder;->getItemAt(I)Landroid/view/View;

    move-result-object v0

    .line 1005
    .local v0, finalChild:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 1006
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

    invoke-virtual {v2, v0, v1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->performDestroyAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 1008
    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mDestroyed:Z

    .line 1009
    return-void
.end method

.method private sendCustomAccessibilityEvent(ILjava/lang/String;)V
    .locals 4
    .parameter "type"
    .parameter "text"

    .prologue
    .line 472
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "accessibility"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    .line 474
    .local v0, accessibilityManager:Landroid/view/accessibility/AccessibilityManager;
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 475
    invoke-static {p1}, Landroid/view/accessibility/AccessibilityEvent;->obtain(I)Landroid/view/accessibility/AccessibilityEvent;

    move-result-object v1

    .line 476
    .local v1, event:Landroid/view/accessibility/AccessibilityEvent;
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Folder;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 477
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 478
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityManager;->sendAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 480
    .end local v1           #event:Landroid/view/accessibility/AccessibilityEvent;
    :cond_0
    return-void
.end method

.method private setFocusOnFirstChild()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 483
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v1, v2, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v0

    .line 484
    .local v0, firstChild:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 485
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 487
    :cond_0
    return-void
.end method

.method private setupContentDimensions(I)V
    .locals 8
    .parameter "count"

    .prologue
    const/4 v6, 0x0

    .line 782
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getItemsInReadingOrder()Ljava/util/ArrayList;

    move-result-object v3

    .line 784
    .local v3, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCountX()I

    move-result v0

    .line 785
    .local v0, countX:I
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCountY()I

    move-result v1

    .line 786
    .local v1, countY:I
    const/4 v2, 0x0

    .line 788
    .local v2, done:Z
    :goto_0
    if-nez v2, :cond_7

    .line 789
    move v4, v0

    .line 790
    .local v4, oldCountX:I
    move v5, v1

    .line 791
    .local v5, oldCountY:I
    mul-int v7, v0, v1

    if-ge v7, p1, :cond_4

    .line 793
    if-le v0, v1, :cond_0

    iget v7, p0, Lcom/cyanogenmod/trebuchet/Folder;->mMaxCountY:I

    if-ne v1, v7, :cond_3

    :cond_0
    iget v7, p0, Lcom/cyanogenmod/trebuchet/Folder;->mMaxCountX:I

    if-ge v0, v7, :cond_3

    .line 794
    add-int/lit8 v0, v0, 0x1

    .line 798
    :cond_1
    :goto_1
    if-nez v1, :cond_2

    add-int/lit8 v1, v1, 0x1

    .line 804
    :cond_2
    :goto_2
    if-ne v0, v4, :cond_6

    if-ne v1, v5, :cond_6

    const/4 v2, 0x1

    .line 805
    :goto_3
    goto :goto_0

    .line 795
    :cond_3
    iget v7, p0, Lcom/cyanogenmod/trebuchet/Folder;->mMaxCountY:I

    if-ge v1, v7, :cond_1

    .line 796
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 799
    :cond_4
    add-int/lit8 v7, v1, -0x1

    mul-int/2addr v7, v0

    if-lt v7, p1, :cond_5

    if-lt v1, v0, :cond_5

    .line 800
    add-int/lit8 v7, v1, -0x1

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v1

    goto :goto_2

    .line 801
    :cond_5
    add-int/lit8 v7, v0, -0x1

    mul-int/2addr v7, v1

    if-lt v7, p1, :cond_2

    .line 802
    add-int/lit8 v7, v0, -0x1

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_2

    :cond_6
    move v2, v6

    .line 804
    goto :goto_3

    .line 806
    .end local v4           #oldCountX:I
    .end local v5           #oldCountY:I
    :cond_7
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v6, v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->setGridSize(II)V

    .line 807
    invoke-direct {p0, v3}, Lcom/cyanogenmod/trebuchet/Folder;->arrangeChildren(Ljava/util/ArrayList;)V

    .line 808
    return-void
.end method

.method private setupContentForNumItems(I)V
    .locals 2
    .parameter "count"

    .prologue
    const/4 v1, 0x0

    .line 877
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/Folder;->setupContentDimensions(I)V

    .line 879
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;

    .line 880
    .local v0, lp:Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;
    if-nez v0, :cond_0

    .line 881
    new-instance v0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;

    .end local v0           #lp:Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;
    invoke-direct {v0, v1, v1}, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;-><init>(II)V

    .line 882
    .restart local v0       #lp:Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->customPosition:Z

    .line 883
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Folder;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 885
    :cond_0
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Folder;->centerAboutIcon()V

    .line 886
    return-void
.end method

.method private updateItemLocationsInDatabase()V
    .locals 10

    .prologue
    .line 759
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getItemsInReadingOrder()Ljava/util/ArrayList;

    move-result-object v8

    .line 760
    .local v8, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/View;

    .line 761
    .local v9, v:Landroid/view/View;
    invoke-virtual {v9}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 762
    .local v1, info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget-wide v2, v2, Lcom/cyanogenmod/trebuchet/FolderInfo;->id:J

    const/4 v4, 0x0

    iget v5, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    iget v6, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    invoke-static/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/LauncherModel;->moveItemInDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIII)V

    goto :goto_0

    .line 765
    .end local v1           #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .end local v9           #v:Landroid/view/View;
    :cond_0
    return-void
.end method

.method private updateTextViewFocus()V
    .locals 3

    .prologue
    .line 1018
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Folder;->getItemAt(I)Landroid/view/View;

    move-result-object v0

    .line 1019
    .local v0, lastChild:Landroid/view/View;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Folder;->getItemAt(I)Landroid/view/View;

    .line 1020
    if-eqz v0, :cond_0

    .line 1021
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/FolderEditText;->setNextFocusDownId(I)V

    .line 1022
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/FolderEditText;->setNextFocusRightId(I)V

    .line 1023
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/FolderEditText;->setNextFocusLeftId(I)V

    .line 1024
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/FolderEditText;->setNextFocusUpId(I)V

    .line 1026
    :cond_0
    return-void
.end method


# virtual methods
.method public acceptDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)Z
    .locals 4
    .parameter "d"

    .prologue
    const/4 v2, 0x1

    .line 532
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v0, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 533
    .local v0, item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    iget v1, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->itemType:I

    .line 534
    .local v1, itemType:I
    if-eqz v1, :cond_0

    if-ne v1, v2, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->isFull()Z

    move-result v3

    if-nez v3, :cond_1

    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public animateClosed()V
    .locals 11

    .prologue
    const/4 v10, 0x2

    const v9, 0x3f666666

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 490
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    instance-of v4, v4, Lcom/cyanogenmod/trebuchet/DragLayer;

    if-nez v4, :cond_0

    .line 522
    :goto_0
    return-void

    .line 491
    :cond_0
    const-string v4, "alpha"

    new-array v5, v8, [F

    const/4 v6, 0x0

    aput v6, v5, v7

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    .line 492
    .local v0, alpha:Landroid/animation/PropertyValuesHolder;
    const-string v4, "scaleX"

    new-array v5, v8, [F

    aput v9, v5, v7

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v2

    .line 493
    .local v2, scaleX:Landroid/animation/PropertyValuesHolder;
    const-string v4, "scaleY"

    new-array v5, v8, [F

    aput v9, v5, v7

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    .line 494
    .local v3, scaleY:Landroid/animation/PropertyValuesHolder;
    const/4 v4, 0x3

    new-array v4, v4, [Landroid/animation/PropertyValuesHolder;

    aput-object v0, v4, v7

    aput-object v2, v4, v8

    aput-object v3, v4, v10

    invoke-static {p0, v4}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mOpenCloseAnimator:Landroid/animation/ObjectAnimator;

    .line 497
    .local v1, oa:Landroid/animation/ObjectAnimator;
    new-instance v4, Lcom/cyanogenmod/trebuchet/Folder$4;

    invoke-direct {v4, p0}, Lcom/cyanogenmod/trebuchet/Folder$4;-><init>(Lcom/cyanogenmod/trebuchet/Folder;)V

    invoke-virtual {v1, v4}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 511
    iget v4, p0, Lcom/cyanogenmod/trebuchet/Folder;->mExpandDuration:I

    int-to-long v4, v4

    invoke-virtual {v1, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 512
    const/4 v4, 0x0

    invoke-virtual {p0, v10, v4}, Lcom/cyanogenmod/trebuchet/Folder;->setLayerType(ILandroid/graphics/Paint;)V

    .line 513
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->buildLayer()V

    .line 514
    new-instance v4, Lcom/cyanogenmod/trebuchet/Folder$5;

    invoke-direct {v4, p0, v1}, Lcom/cyanogenmod/trebuchet/Folder$5;-><init>(Lcom/cyanogenmod/trebuchet/Folder;Landroid/animation/ObjectAnimator;)V

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/Folder;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public animateOpen()V
    .locals 10

    .prologue
    const/4 v9, 0x2

    const/high16 v8, 0x3f80

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 429
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Folder;->positionAndSizeAsIcon()V

    .line 431
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    instance-of v4, v4, Lcom/cyanogenmod/trebuchet/DragLayer;

    if-nez v4, :cond_0

    .line 469
    :goto_0
    return-void

    .line 432
    :cond_0
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Folder;->centerAboutIcon()V

    .line 433
    const-string v4, "alpha"

    new-array v5, v7, [F

    aput v8, v5, v6

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    .line 434
    .local v0, alpha:Landroid/animation/PropertyValuesHolder;
    const-string v4, "scaleX"

    new-array v5, v7, [F

    aput v8, v5, v6

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v2

    .line 435
    .local v2, scaleX:Landroid/animation/PropertyValuesHolder;
    const-string v4, "scaleY"

    new-array v5, v7, [F

    aput v8, v5, v6

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    .line 436
    .local v3, scaleY:Landroid/animation/PropertyValuesHolder;
    const/4 v4, 0x3

    new-array v4, v4, [Landroid/animation/PropertyValuesHolder;

    aput-object v0, v4, v6

    aput-object v2, v4, v7

    aput-object v3, v4, v9

    invoke-static {p0, v4}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mOpenCloseAnimator:Landroid/animation/ObjectAnimator;

    .line 439
    .local v1, oa:Landroid/animation/ObjectAnimator;
    new-instance v4, Lcom/cyanogenmod/trebuchet/Folder$2;

    invoke-direct {v4, p0}, Lcom/cyanogenmod/trebuchet/Folder$2;-><init>(Lcom/cyanogenmod/trebuchet/Folder;)V

    invoke-virtual {v1, v4}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 458
    iget v4, p0, Lcom/cyanogenmod/trebuchet/Folder;->mExpandDuration:I

    int-to-long v4, v4

    invoke-virtual {v1, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 459
    const/4 v4, 0x0

    invoke-virtual {p0, v9, v4}, Lcom/cyanogenmod/trebuchet/Folder;->setLayerType(ILandroid/graphics/Paint;)V

    .line 460
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->buildLayer()V

    .line 461
    new-instance v4, Lcom/cyanogenmod/trebuchet/Folder$3;

    invoke-direct {v4, p0, v1}, Lcom/cyanogenmod/trebuchet/Folder$3;-><init>(Lcom/cyanogenmod/trebuchet/Folder;Landroid/animation/ObjectAnimator;)V

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/Folder;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method bind(Lcom/cyanogenmod/trebuchet/FolderInfo;)V
    .locals 8
    .parameter "info"

    .prologue
    .line 368
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    .line 369
    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/FolderInfo;->contents:Ljava/util/ArrayList;

    .line 370
    .local v1, children:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ShortcutInfo;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 371
    .local v5, overflow:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ShortcutInfo;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-direct {p0, v6}, Lcom/cyanogenmod/trebuchet/Folder;->setupContentForNumItems(I)V

    .line 372
    invoke-direct {p0, v1}, Lcom/cyanogenmod/trebuchet/Folder;->placeInReadingOrder(Ljava/util/ArrayList;)V

    .line 373
    const/4 v2, 0x0

    .line 374
    .local v2, count:I
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 375
    .local v0, child:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Folder;->createAndAddShortcut(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 376
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 378
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 383
    .end local v0           #child:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_1
    invoke-direct {p0, v2}, Lcom/cyanogenmod/trebuchet/Folder;->setupContentForNumItems(I)V

    .line 388
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 389
    .local v4, item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    invoke-virtual {v6, v4}, Lcom/cyanogenmod/trebuchet/FolderInfo;->remove(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    .line 390
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-static {v6, v4}, Lcom/cyanogenmod/trebuchet/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    goto :goto_1

    .line 393
    .end local v4           #item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_2
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/cyanogenmod/trebuchet/Folder;->mItemsInvalidated:Z

    .line 394
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Folder;->updateTextViewFocus()V

    .line 395
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    invoke-virtual {v6, p0}, Lcom/cyanogenmod/trebuchet/FolderInfo;->addListener(Lcom/cyanogenmod/trebuchet/FolderInfo$FolderListener;)V

    .line 397
    sget-object v6, Lcom/cyanogenmod/trebuchet/Folder;->sDefaultFolderName:Ljava/lang/String;

    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget-object v7, v7, Lcom/cyanogenmod/trebuchet/FolderInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v6, v7}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 398
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget-object v7, v7, Lcom/cyanogenmod/trebuchet/FolderInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v6, v7}, Lcom/cyanogenmod/trebuchet/FolderEditText;->setText(Ljava/lang/CharSequence;)V

    .line 402
    :goto_2
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Folder;->updateItemLocationsInDatabase()V

    .line 403
    return-void

    .line 400
    :cond_3
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    const-string v7, ""

    invoke-virtual {v6, v7}, Lcom/cyanogenmod/trebuchet/FolderEditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2
.end method

.method public completeDragExit()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 686
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->closeFolder()V

    .line 687
    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mCurrentDragInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 688
    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mCurrentDragView:Landroid/view/View;

    .line 689
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mSuppressOnAdd:Z

    .line 690
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mRearrangeOnClose:Z

    .line 691
    return-void
.end method

.method protected createAndAddShortcut(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)Z
    .locals 9
    .parameter "item"

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    const/4 v2, 0x0

    .line 551
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInflater:Landroid/view/LayoutInflater;

    const v3, 0x7f040003

    invoke-virtual {v0, v3, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 553
    .local v1, textView:Landroid/widget/TextView;
    new-instance v0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Folder;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    invoke-virtual {p1, v3}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->getIcon(Lcom/cyanogenmod/trebuchet/IconCache;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v1, v7, v0, v7, v7}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 555
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 556
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 558
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 559
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 563
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    iget v3, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    iget v7, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    invoke-virtual {v0, v3, v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    iget v0, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    if-ltz v0, :cond_0

    iget v0, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    if-ltz v0, :cond_0

    iget v0, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCountX()I

    move-result v3

    if-ge v0, v3, :cond_0

    iget v0, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCountY()I

    move-result v3

    if-lt v0, v3, :cond_1

    .line 566
    :cond_0
    const-string v0, "Trebuchet.Folder"

    const-string v3, "Folder order not properly persisted during bind"

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 567
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Folder;->findAndSetEmptyCells(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 577
    :goto_0
    return v2

    .line 572
    :cond_1
    new-instance v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    iget v0, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    iget v3, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    iget v7, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->spanX:I

    iget v8, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->spanY:I

    invoke-direct {v4, v0, v3, v7, v8}, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;-><init>(IIII)V

    .line 574
    .local v4, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    const/4 v6, 0x0

    .line 575
    .local v6, insert:Z
    new-instance v0, Lcom/cyanogenmod/trebuchet/FolderKeyEventListener;

    invoke-direct {v0}, Lcom/cyanogenmod/trebuchet/FolderKeyEventListener;-><init>()V

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 576
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    if-eqz v6, :cond_2

    :goto_1
    iget-wide v7, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->id:J

    long-to-int v3, v7

    invoke-virtual/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->addViewToCellLayout(Landroid/view/View;IILcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;Z)Z

    move v2, v5

    .line 577
    goto :goto_0

    .line 576
    :cond_2
    const/4 v2, -0x1

    goto :goto_1
.end method

.method public dismissEditingName()V
    .locals 3

    .prologue
    .line 261
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 262
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Folder;->doneEditingFolderName(Z)V

    .line 263
    return-void
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1
    .parameter "event"

    .prologue
    .line 322
    const/4 v0, 0x1

    return v0
.end method

.method public doneEditingFolderName(Z)V
    .locals 5
    .parameter "commit"

    .prologue
    const/4 v4, 0x0

    .line 266
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    sget-object v2, Lcom/cyanogenmod/trebuchet/Folder;->sHintText:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/FolderEditText;->setHint(Ljava/lang/CharSequence;)V

    .line 269
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/FolderEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 270
    .local v0, newTitle:Ljava/lang/String;
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen;->getHideIconLabels()Z

    move-result v1

    if-nez v1, :cond_0

    .line 271
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    invoke-virtual {v1, v0}, Lcom/cyanogenmod/trebuchet/FolderInfo;->setTitle(Ljava/lang/CharSequence;)V

    .line 273
    :cond_0
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    invoke-static {v1, v2}, Lcom/cyanogenmod/trebuchet/LauncherModel;->updateItemInDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 275
    if-eqz p1, :cond_1

    .line 276
    const/16 v1, 0x20

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0900d5

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/cyanogenmod/trebuchet/Folder;->sendCustomAccessibilityEvent(ILjava/lang/String;)V

    .line 281
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->requestFocus()Z

    .line 283
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/FolderEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-static {v1, v4, v4}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;II)V

    .line 284
    iput-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Folder;->mIsEditingName:Z

    .line 285
    return-void
.end method

.method protected findAndSetEmptyCells(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)Z
    .locals 6
    .parameter "item"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 540
    const/4 v3, 0x2

    new-array v0, v3, [I

    .line 541
    .local v0, emptyCell:[I
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    iget v4, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->spanX:I

    iget v5, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->spanY:I

    invoke-virtual {v3, v0, v4, v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->findCellForSpan([III)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 542
    aget v2, v0, v2

    iput v2, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    .line 543
    aget v2, v0, v1

    iput v2, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    .line 546
    :goto_0
    return v1

    :cond_0
    move v1, v2

    goto :goto_0
.end method

.method public getDragDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 300
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getDropTargetDelegate(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)Lcom/cyanogenmod/trebuchet/DropTarget;
    .locals 1
    .parameter "d"

    .prologue
    .line 778
    const/4 v0, 0x0

    return-object v0
.end method

.method public getEditTextRegion()Landroid/view/View;
    .locals 1

    .prologue
    .line 296
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    return-object v0
.end method

.method getInfo()Lcom/cyanogenmod/trebuchet/FolderInfo;
    .locals 1

    .prologue
    .line 329
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    return-object v0
.end method

.method public getItemAt(I)Landroid/view/View;
    .locals 1
    .parameter "index"

    .prologue
    .line 933
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 929
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v0

    return v0
.end method

.method public getItemsInReadingOrder()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1111
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Folder;->getItemsInReadingOrder(Z)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getItemsInReadingOrder(Z)Ljava/util/ArrayList;
    .locals 5
    .parameter "includeCurrentDragItem"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1115
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Folder;->mItemsInvalidated:Z

    if-eqz v4, :cond_4

    .line 1116
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Folder;->mItemsInReadingOrder:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 1117
    const/4 v2, 0x0

    .local v2, j:I
    :goto_0
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCountY()I

    move-result v4

    if-ge v2, v4, :cond_3

    .line 1118
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCountX()I

    move-result v4

    if-ge v0, v4, :cond_2

    .line 1119
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v4, v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v3

    .line 1120
    .local v3, v:Landroid/view/View;
    if-eqz v3, :cond_1

    .line 1121
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 1122
    .local v1, info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Folder;->mCurrentDragInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-ne v1, v4, :cond_0

    if-eqz p1, :cond_1

    .line 1123
    :cond_0
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Folder;->mItemsInReadingOrder:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1118
    .end local v1           #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1117
    .end local v3           #v:Landroid/view/View;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1128
    .end local v0           #i:I
    :cond_3
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Folder;->mItemsInvalidated:Z

    .line 1130
    .end local v2           #j:I
    :cond_4
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Folder;->mItemsInReadingOrder:Ljava/util/ArrayList;

    return-object v4
.end method

.method public getLocationInDragLayer([I)V
    .locals 1
    .parameter "loc"

    .prologue
    .line 1134
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/cyanogenmod/trebuchet/DragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 1135
    return-void
.end method

.method getPivotXForIconAnimation()F
    .locals 1

    .prologue
    .line 870
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderIconPivotX:F

    return v0
.end method

.method getPivotYForIconAnimation()F
    .locals 1

    .prologue
    .line 873
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderIconPivotY:F

    return v0
.end method

.method isDestroyed()Z
    .locals 1

    .prologue
    .line 1012
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mDestroyed:Z

    return v0
.end method

.method public isDropEnabled()Z
    .locals 1

    .prologue
    .line 774
    const/4 v0, 0x1

    return v0
.end method

.method public isEditingName()Z
    .locals 1

    .prologue
    .line 252
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mIsEditingName:Z

    return v0
.end method

.method public isFull()Z
    .locals 2

    .prologue
    .line 811
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getItemCount()I

    move-result v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mMaxNumItems:I

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method notifyDataSetChanged()V
    .locals 1

    .prologue
    .line 527
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->removeAllViewsInLayout()V

    .line 528
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Folder;->bind(Lcom/cyanogenmod/trebuchet/FolderInfo;)V

    .line 529
    return-void
.end method

.method public notifyDrop()V
    .locals 1

    .prologue
    .line 768
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mDragInProgress:Z

    if-eqz v0, :cond_0

    .line 769
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mItemAddedBackToSelfViaIcon:Z

    .line 771
    :cond_0
    return-void
.end method

.method public onAdd(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V
    .locals 7
    .parameter "item"

    .prologue
    .line 1060
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mItemsInvalidated:Z

    .line 1063
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mSuppressOnAdd:Z

    if-eqz v0, :cond_0

    .line 1072
    :goto_0
    return-void

    .line 1064
    :cond_0
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Folder;->findAndSetEmptyCells(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1066
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/Folder;->setupContentForNumItems(I)V

    .line 1067
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Folder;->findAndSetEmptyCells(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)Z

    .line 1069
    :cond_1
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Folder;->createAndAddShortcut(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)Z

    .line 1070
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget-wide v2, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->id:J

    const/4 v4, 0x0

    iget v5, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    iget v6, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    move-object v1, p1

    invoke-static/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/LauncherModel;->addOrMoveItemInDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIII)V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 10
    .parameter "v"

    .prologue
    const/4 v9, 0x1

    const/4 v7, 0x0

    .line 205
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    .line 206
    .local v2, tag:Ljava/lang/Object;
    instance-of v3, v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-eqz v3, :cond_0

    move-object v0, v2

    .line 208
    check-cast v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 209
    .local v0, item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    const/4 v3, 0x2

    new-array v1, v3, [I

    .line 210
    .local v1, pos:[I
    invoke-virtual {p1, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 211
    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    new-instance v4, Landroid/graphics/Rect;

    aget v5, v1, v7

    aget v6, v1, v9

    aget v7, v1, v7

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v8

    add-int/2addr v7, v8

    aget v8, v1, v9

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v9

    add-int/2addr v8, v9

    invoke-direct {v4, v5, v6, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v3, v4}, Landroid/content/Intent;->setSourceBounds(Landroid/graphics/Rect;)V

    .line 214
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v3, p1, v4, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z

    .line 216
    .end local v0           #item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .end local v1           #pos:[I
    :cond_0
    return-void
.end method

.method public onDragEnter(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 3
    .parameter "d"

    .prologue
    const/4 v2, -0x1

    .line 581
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mPreviousTargetCell:[I

    const/4 v1, 0x0

    aput v2, v0, v1

    .line 582
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mPreviousTargetCell:[I

    const/4 v1, 0x1

    aput v2, v0, v1

    .line 583
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mOnExitAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Alarm;->cancelAlarm()V

    .line 584
    return-void
.end method

.method public onDragExit(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 3
    .parameter "d"

    .prologue
    .line 696
    iget-boolean v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragComplete:Z

    if-nez v0, :cond_0

    .line 697
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mOnExitAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mOnExitAlarmListener:Lcom/cyanogenmod/trebuchet/OnAlarmListener;

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Alarm;->setOnAlarmListener(Lcom/cyanogenmod/trebuchet/OnAlarmListener;)V

    .line 698
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mOnExitAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    const-wide/16 v1, 0x320

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Alarm;->setAlarm(J)V

    .line 700
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mReorderAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Alarm;->cancelAlarm()V

    .line 701
    return-void
.end method

.method public onDragOver(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 10
    .parameter "d"

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 641
    iget v1, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->x:I

    iget v2, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->y:I

    iget v3, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->xOffset:I

    iget v4, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->yOffset:I

    iget-object v5, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    const/4 v6, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/Folder;->getDragViewVisualCenter(IIIILcom/cyanogenmod/trebuchet/DragView;[F)[F

    move-result-object v7

    .line 642
    .local v7, r:[F
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    aget v1, v7, v9

    float-to-int v1, v1

    aget v2, v7, v8

    float-to-int v2, v2

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Folder;->mTargetCell:[I

    move v3, v8

    move v4, v8

    invoke-virtual/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->findNearestArea(IIII[I)[I

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mTargetCell:[I

    .line 644
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mTargetCell:[I

    aget v0, v0, v9

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mPreviousTargetCell:[I

    aget v1, v1, v9

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mTargetCell:[I

    aget v0, v0, v8

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mPreviousTargetCell:[I

    aget v1, v1, v8

    if-eq v0, v1, :cond_1

    .line 645
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mReorderAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Alarm;->cancelAlarm()V

    .line 646
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mReorderAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mReorderAlarmListener:Lcom/cyanogenmod/trebuchet/OnAlarmListener;

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Alarm;->setOnAlarmListener(Lcom/cyanogenmod/trebuchet/OnAlarmListener;)V

    .line 647
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mReorderAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Alarm;->setAlarm(J)V

    .line 648
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mPreviousTargetCell:[I

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mTargetCell:[I

    aget v1, v1, v9

    aput v1, v0, v9

    .line 649
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mPreviousTargetCell:[I

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mTargetCell:[I

    aget v1, v1, v8

    aput v1, v0, v8

    .line 651
    :cond_1
    return-void
.end method

.method public onDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 11
    .parameter "d"

    .prologue
    const/4 v10, 0x0

    const/4 v5, 0x1

    .line 1030
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v0, v0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    if-eqz v0, :cond_1

    .line 1032
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->makeShortcut()Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    move-result-object v6

    .line 1033
    .local v6, item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    iput v5, v6, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->spanX:I

    .line 1034
    iput v5, v6, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->spanY:I

    .line 1040
    :goto_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mCurrentDragInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-ne v6, v0, :cond_0

    .line 1041
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mCurrentDragView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 1042
    .local v7, si:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mCurrentDragView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 1043
    .local v4, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mEmptyCell:[I

    aget v0, v0, v10

    iput v0, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    iput v0, v7, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    .line 1044
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mEmptyCell:[I

    aget v0, v0, v5

    iput v0, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    iput v0, v7, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    .line 1045
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mCurrentDragView:Landroid/view/View;

    const/4 v2, -0x1

    iget-wide v8, v6, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->id:J

    long-to-int v3, v8

    invoke-virtual/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->addViewToCellLayout(Landroid/view/View;IILcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;Z)Z

    .line 1046
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragView;->hasDrawn()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1047
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v0

    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mCurrentDragView:Landroid/view/View;

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/DragLayer;->animateViewIntoPosition(Lcom/cyanogenmod/trebuchet/DragView;Landroid/view/View;)V

    .line 1052
    :goto_1
    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Folder;->mItemsInvalidated:Z

    .line 1053
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getItemCount()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/Folder;->setupContentDimensions(I)V

    .line 1054
    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Folder;->mSuppressOnAdd:Z

    .line 1056
    .end local v4           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    .end local v7           #si:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    invoke-virtual {v0, v6}, Lcom/cyanogenmod/trebuchet/FolderInfo;->add(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    .line 1057
    return-void

    .line 1036
    .end local v6           #item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_1
    iget-object v6, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v6, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .restart local v6       #item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    goto :goto_0

    .line 1049
    .restart local v4       #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    .restart local v7       #si:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_2
    iput-boolean v10, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->deferDragViewCleanupPostAnimation:Z

    .line 1050
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mCurrentDragView:Landroid/view/View;

    invoke-virtual {v0, v10}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1
.end method

.method public onDropCompleted(Landroid/view/View;Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;ZZ)V
    .locals 4
    .parameter "target"
    .parameter "d"
    .parameter "isFlingToDelete"
    .parameter "success"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 705
    if-eqz p4, :cond_3

    .line 706
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mDeleteFolderOnDropCompleted:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mItemAddedBackToSelfViaIcon:Z

    if-nez v0, :cond_1

    .line 710
    iget-object v0, p2, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v0, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-eqz v0, :cond_0

    .line 711
    iget-object v0, p2, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iput-object v1, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mFolderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    .line 713
    :cond_0
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Folder;->replaceFolderWithFinalItem()V

    .line 726
    :cond_1
    :goto_0
    if-eq p1, p0, :cond_2

    .line 727
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mOnExitAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Alarm;->alarmPending()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 728
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mOnExitAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Alarm;->cancelAlarm()V

    .line 729
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->completeDragExit()V

    .line 732
    :cond_2
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mDeleteFolderOnDropCompleted:Z

    .line 733
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mDragInProgress:Z

    .line 734
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mItemAddedBackToSelfViaIcon:Z

    .line 735
    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/Folder;->mCurrentDragInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 736
    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/Folder;->mCurrentDragView:Landroid/view/View;

    .line 737
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mSuppressOnAdd:Z

    .line 741
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Folder;->updateItemLocationsInDatabase()V

    .line 742
    return-void

    .line 717
    :cond_3
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

    invoke-virtual {v0, p2}, Lcom/cyanogenmod/trebuchet/FolderIcon;->onDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 721
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mOnExitAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Alarm;->alarmPending()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 722
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mSuppressFolderDeletion:Z

    goto :goto_0
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "v"
    .parameter "actionId"
    .parameter "event"

    .prologue
    .line 288
    const/4 v0, 0x6

    if-ne p2, v0, :cond_0

    .line 289
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->dismissEditingName()V

    .line 290
    const/4 v0, 0x1

    .line 292
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onFinishInflate()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 155
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 156
    const v1, 0x7f070042

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Folder;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/CellLayout;

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 157
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v1, v3, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->setGridSize(II)V

    .line 158
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->setMotionEventSplittingEnabled(Z)V

    .line 159
    const v1, 0x7f07003b

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Folder;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/FolderEditText;

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    .line 160
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    invoke-virtual {v1, p0}, Lcom/cyanogenmod/trebuchet/FolderEditText;->setFolder(Lcom/cyanogenmod/trebuchet/Folder;)V

    .line 161
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getLockWorkspace()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 162
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/FolderEditText;->setKeyListener(Landroid/text/method/KeyListener;)V

    .line 163
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    invoke-virtual {v1, v3}, Lcom/cyanogenmod/trebuchet/FolderEditText;->setFocusable(Z)V

    .line 170
    :goto_0
    const/4 v0, 0x0

    .line 171
    .local v0, measureSpec:I
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    invoke-virtual {v1, v0, v0}, Lcom/cyanogenmod/trebuchet/FolderEditText;->measure(II)V

    .line 172
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/FolderEditText;->getMeasuredHeight()I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderNameHeight:I

    .line 175
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mActionModeCallback:Landroid/view/ActionMode$Callback;

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/FolderEditText;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    .line 176
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    invoke-virtual {v1, p0}, Lcom/cyanogenmod/trebuchet/FolderEditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 177
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/FolderEditText;->setSelectAllOnFocus(Z)V

    .line 178
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/FolderEditText;->getInputType()I

    move-result v2

    const/high16 v3, 0x8

    or-int/2addr v2, v3

    or-int/lit16 v2, v2, 0x2000

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/FolderEditText;->setInputType(I)V

    .line 181
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen;->getHideIconLabels()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 182
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/FolderEditText;->setVisibility(I)V

    .line 183
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getPaddingBottom()I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderNameHeight:I

    .line 185
    :cond_0
    return-void

    .line 165
    .end local v0           #measureSpec:I
    :cond_1
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    invoke-virtual {v1, p0}, Lcom/cyanogenmod/trebuchet/FolderEditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    goto :goto_0
.end method

.method public onFlingToDelete(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;IILandroid/graphics/PointF;)V
    .locals 0
    .parameter "d"
    .parameter "x"
    .parameter "y"
    .parameter "vec"

    .prologue
    .line 751
    return-void
.end method

.method public onFlingToDeleteCompleted()V
    .locals 0

    .prologue
    .line 756
    return-void
.end method

.method public onFocusChange(Landroid/view/View;Z)V
    .locals 1
    .parameter "v"
    .parameter "hasFocus"

    .prologue
    .line 1138
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    if-ne p1, v0, :cond_0

    if-eqz p2, :cond_0

    .line 1139
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->startEditingFolderName()V

    .line 1141
    :cond_0
    return-void
.end method

.method public onItemsChanged()V
    .locals 0

    .prologue
    .line 1104
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Folder;->updateTextViewFocus()V

    .line 1105
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 6
    .parameter "v"

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 220
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getLockWorkspace()Z

    move-result v2

    if-eqz v2, :cond_0

    move v2, v3

    .line 248
    :goto_0
    return v2

    .line 223
    :cond_0
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->isDraggingEnabled()Z

    move-result v2

    if-nez v2, :cond_1

    move v2, v4

    goto :goto_0

    .line 225
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    .line 226
    .local v1, tag:Ljava/lang/Object;
    instance-of v2, v1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-eqz v2, :cond_3

    move-object v0, v1

    .line 227
    check-cast v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 228
    .local v0, item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    invoke-virtual {p1}, Landroid/view/View;->isInTouchMode()Z

    move-result v2

    if-nez v2, :cond_2

    move v2, v3

    .line 229
    goto :goto_0

    .line 232
    :cond_2
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Lcom/cyanogenmod/trebuchet/Launcher;->dismissFolderCling(Landroid/view/View;)V

    .line 234
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->onDragStartedWithItem(Landroid/view/View;)V

    .line 235
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v2

    invoke-virtual {v2, p1, p0}, Lcom/cyanogenmod/trebuchet/Workspace;->beginDragShared(Landroid/view/View;Lcom/cyanogenmod/trebuchet/DragSource;)V

    move-object v2, p1

    .line 236
    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v2

    aget-object v2, v2, v4

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 238
    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mCurrentDragInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 239
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mEmptyCell:[I

    iget v5, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    aput v5, v2, v3

    .line 240
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mEmptyCell:[I

    iget v5, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    aput v5, v2, v4

    .line 241
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mCurrentDragView:Landroid/view/View;

    .line 243
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Folder;->mCurrentDragView:Landroid/view/View;

    invoke-virtual {v2, v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->removeView(Landroid/view/View;)V

    .line 244
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Folder;->mCurrentDragInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    invoke-virtual {v2, v5}, Lcom/cyanogenmod/trebuchet/FolderInfo;->remove(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    .line 245
    iput-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Folder;->mDragInProgress:Z

    .line 246
    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/Folder;->mItemAddedBackToSelfViaIcon:Z

    .end local v0           #item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_3
    move v2, v4

    .line 248
    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 7
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    const/high16 v6, 0x4000

    .line 889
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getPaddingLeft()I

    move-result v4

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getPaddingRight()I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->getDesiredWidth()I

    move-result v5

    add-int v3, v4, v5

    .line 890
    .local v3, width:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getPaddingTop()I

    move-result v4

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getPaddingBottom()I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->getDesiredHeight()I

    move-result v5

    add-int/2addr v4, v5

    iget v5, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderNameHeight:I

    add-int v2, v4, v5

    .line 893
    .local v2, height:I
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->getDesiredWidth()I

    move-result v4

    invoke-static {v4, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 895
    .local v1, contentWidthSpec:I
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->getDesiredHeight()I

    move-result v4

    invoke-static {v4, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 897
    .local v0, contentHeightSpec:I
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v4, v1, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->measure(II)V

    .line 899
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    iget v5, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderNameHeight:I

    invoke-static {v5, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    invoke-virtual {v4, v1, v5}, Lcom/cyanogenmod/trebuchet/FolderEditText;->measure(II)V

    .line 901
    invoke-virtual {p0, v3, v2}, Lcom/cyanogenmod/trebuchet/Folder;->setMeasuredDimension(II)V

    .line 902
    return-void
.end method

.method public onRemove(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V
    .locals 3
    .parameter "item"

    .prologue
    const/4 v2, 0x1

    .line 1075
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mItemsInvalidated:Z

    .line 1078
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mCurrentDragInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-ne p1, v1, :cond_1

    .line 1089
    :cond_0
    :goto_0
    return-void

    .line 1079
    :cond_1
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/Folder;->getViewForInfo(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)Landroid/view/View;

    move-result-object v0

    .line 1080
    .local v0, v:Landroid/view/View;
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mContent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v1, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->removeView(Landroid/view/View;)V

    .line 1081
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mState:I

    if-ne v1, v2, :cond_2

    .line 1082
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Folder;->mRearrangeOnClose:Z

    .line 1086
    :goto_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getItemCount()I

    move-result v1

    if-gt v1, v2, :cond_0

    .line 1087
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Folder;->replaceFolderWithFinalItem()V

    goto :goto_0

    .line 1084
    :cond_2
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Folder;->getItemCount()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/cyanogenmod/trebuchet/Folder;->setupContentForNumItems(I)V

    goto :goto_1
.end method

.method public onTitleChanged(Ljava/lang/CharSequence;)V
    .locals 0
    .parameter "title"

    .prologue
    .line 1108
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 308
    const/4 v0, 0x1

    return v0
.end method

.method readingOrderGreaterThan([I[I)Z
    .locals 4
    .parameter "v1"
    .parameter "v2"

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 593
    aget v2, p1, v1

    aget v3, p2, v1

    if-gt v2, v3, :cond_0

    aget v2, p1, v1

    aget v3, p2, v1

    if-ne v2, v3, :cond_1

    aget v2, p1, v0

    aget v3, p2, v0

    if-le v2, v3, :cond_1

    :cond_0
    move v0, v1

    :cond_1
    return v0
.end method

.method public setDragController(Lcom/cyanogenmod/trebuchet/DragController;)V
    .locals 0
    .parameter "dragController"

    .prologue
    .line 312
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    .line 313
    return-void
.end method

.method setFolderIcon(Lcom/cyanogenmod/trebuchet/FolderIcon;)V
    .locals 0
    .parameter "icon"

    .prologue
    .line 316
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

    .line 317
    return-void
.end method

.method public startEditingFolderName()V
    .locals 2

    .prologue
    .line 256
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/FolderEditText;->setHint(Ljava/lang/CharSequence;)V

    .line 257
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Folder;->mIsEditingName:Z

    .line 258
    return-void
.end method

.method public supportsFlingToDelete()Z
    .locals 1

    .prologue
    .line 746
    const/4 v0, 0x1

    return v0
.end method
