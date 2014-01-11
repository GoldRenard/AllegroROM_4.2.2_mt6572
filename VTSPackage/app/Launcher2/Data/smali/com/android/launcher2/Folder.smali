.class public Lcom/android/launcher2/Folder;
.super Landroid/widget/LinearLayout;
.source "Folder.java"

# interfaces
.implements Lcom/android/launcher2/DragSource;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Lcom/android/launcher2/DropTarget;
.implements Lcom/android/launcher2/FolderInfo$FolderListener;
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Landroid/view/View$OnFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/Folder$GridComparator;
    }
.end annotation


# static fields
.field private static final ON_EXIT_CLOSE_DELAY:I = 0x320

.field private static final REORDER_ANIMATION_DURATION:I = 0xe6

.field static final STATE_ANIMATING:I = 0x1

.field static final STATE_NONE:I = -0x1

.field static final STATE_OPEN:I = 0x2

.field static final STATE_SMALL:I = 0x0

.field private static final TAG:Ljava/lang/String; = "Launcher.Folder"

.field private static sDefaultFolderName:Ljava/lang/String;

.field private static sHintText:Ljava/lang/String;


# instance fields
.field private mActionModeCallback:Landroid/view/ActionMode$Callback;

.field protected mContent:Lcom/android/launcher2/CellLayout;

.field private mCurrentDragInfo:Lcom/android/launcher2/ShortcutInfo;

.field private mCurrentDragView:Landroid/view/View;

.field private mDeleteFolderOnDropCompleted:Z

.field private mDestroyed:Z

.field protected mDragController:Lcom/android/launcher2/DragController;

.field private mDragInProgress:Z

.field private mEmptyCell:[I

.field private mExpandDuration:I

.field private mFolderIcon:Lcom/android/launcher2/FolderIcon;

.field private mFolderIconPivotX:F

.field private mFolderIconPivotY:F

.field mFolderName:Lcom/android/launcher2/FolderEditText;

.field private mFolderNameHeight:I

.field private final mIconCache:Lcom/android/launcher2/IconCache;

.field private mIconDrawable:Landroid/graphics/drawable/Drawable;

.field private final mInflater:Landroid/view/LayoutInflater;

.field protected mInfo:Lcom/android/launcher2/FolderInfo;

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

.field protected mLauncher:Lcom/android/launcher2/Launcher;

.field private mMaxCountX:I

.field private mMaxCountY:I

.field private mMaxNumItems:I

.field private mOnExitAlarm:Lcom/android/launcher2/Alarm;

.field mOnExitAlarmListener:Lcom/android/launcher2/OnAlarmListener;

.field private mOpenCloseAnimator:Landroid/animation/ObjectAnimator;

.field private mPreviousTargetCell:[I

.field private mRearrangeOnClose:Z

.field private mReorderAlarm:Lcom/android/launcher2/Alarm;

.field mReorderAlarmListener:Lcom/android/launcher2/OnAlarmListener;

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

    .line 121
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 76
    const/4 v1, -0x1

    iput v1, p0, Lcom/android/launcher2/Folder;->mState:I

    .line 79
    iput-boolean v2, p0, Lcom/android/launcher2/Folder;->mRearrangeOnClose:Z

    .line 84
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/launcher2/Folder;->mItemsInReadingOrder:Ljava/util/ArrayList;

    .line 86
    iput-boolean v2, p0, Lcom/android/launcher2/Folder;->mItemsInvalidated:Z

    .line 89
    iput-boolean v2, p0, Lcom/android/launcher2/Folder;->mSuppressOnAdd:Z

    .line 90
    new-array v1, v3, [I

    iput-object v1, p0, Lcom/android/launcher2/Folder;->mTargetCell:[I

    .line 91
    new-array v1, v3, [I

    iput-object v1, p0, Lcom/android/launcher2/Folder;->mPreviousTargetCell:[I

    .line 92
    new-array v1, v3, [I

    iput-object v1, p0, Lcom/android/launcher2/Folder;->mEmptyCell:[I

    .line 93
    new-instance v1, Lcom/android/launcher2/Alarm;

    invoke-direct {v1}, Lcom/android/launcher2/Alarm;-><init>()V

    iput-object v1, p0, Lcom/android/launcher2/Folder;->mReorderAlarm:Lcom/android/launcher2/Alarm;

    .line 94
    new-instance v1, Lcom/android/launcher2/Alarm;

    invoke-direct {v1}, Lcom/android/launcher2/Alarm;-><init>()V

    iput-object v1, p0, Lcom/android/launcher2/Folder;->mOnExitAlarm:Lcom/android/launcher2/Alarm;

    .line 96
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/android/launcher2/Folder;->mTempRect:Landroid/graphics/Rect;

    .line 97
    iput-boolean v2, p0, Lcom/android/launcher2/Folder;->mDragInProgress:Z

    .line 98
    iput-boolean v2, p0, Lcom/android/launcher2/Folder;->mDeleteFolderOnDropCompleted:Z

    .line 99
    iput-boolean v2, p0, Lcom/android/launcher2/Folder;->mSuppressFolderDeletion:Z

    .line 100
    iput-boolean v2, p0, Lcom/android/launcher2/Folder;->mItemAddedBackToSelfViaIcon:Z

    .line 105
    iput-boolean v2, p0, Lcom/android/launcher2/Folder;->mIsEditingName:Z

    .line 183
    new-instance v1, Lcom/android/launcher2/Folder$1;

    invoke-direct {v1, p0}, Lcom/android/launcher2/Folder$1;-><init>(Lcom/android/launcher2/Folder;)V

    iput-object v1, p0, Lcom/android/launcher2/Folder;->mActionModeCallback:Landroid/view/ActionMode$Callback;

    .line 611
    new-instance v1, Lcom/android/launcher2/Folder$6;

    invoke-direct {v1, p0}, Lcom/android/launcher2/Folder$6;-><init>(Lcom/android/launcher2/Folder;)V

    iput-object v1, p0, Lcom/android/launcher2/Folder;->mReorderAlarmListener:Lcom/android/launcher2/OnAlarmListener;

    .line 708
    new-instance v1, Lcom/android/launcher2/Folder$7;

    invoke-direct {v1, p0}, Lcom/android/launcher2/Folder$7;-><init>(Lcom/android/launcher2/Folder;)V

    iput-object v1, p0, Lcom/android/launcher2/Folder;->mOnExitAlarmListener:Lcom/android/launcher2/OnAlarmListener;

    .line 122
    invoke-virtual {p0, v2}, Lcom/android/launcher2/Folder;->setAlwaysDrawnWithCacheEnabled(Z)V

    .line 123
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/Folder;->mInflater:Landroid/view/LayoutInflater;

    .line 124
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/LauncherApplication;

    invoke-virtual {v1}, Lcom/android/launcher2/LauncherApplication;->getIconCache()Lcom/android/launcher2/IconCache;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/Folder;->mIconCache:Lcom/android/launcher2/IconCache;

    .line 126
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 127
    .local v0, res:Landroid/content/res/Resources;
    const v1, 0x7f0a001a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/Folder;->mMaxCountX:I

    .line 128
    const v1, 0x7f0a001b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/Folder;->mMaxCountY:I

    .line 129
    const v1, 0x7f0a001c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/Folder;->mMaxNumItems:I

    .line 130
    iget v1, p0, Lcom/android/launcher2/Folder;->mMaxCountX:I

    if-ltz v1, :cond_0

    iget v1, p0, Lcom/android/launcher2/Folder;->mMaxCountY:I

    if-ltz v1, :cond_0

    iget v1, p0, Lcom/android/launcher2/Folder;->mMaxNumItems:I

    if-gez v1, :cond_1

    .line 131
    :cond_0
    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getCellCountX()I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/Folder;->mMaxCountX:I

    .line 132
    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getCellCountY()I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/Folder;->mMaxCountY:I

    .line 133
    iget v1, p0, Lcom/android/launcher2/Folder;->mMaxCountX:I

    iget v2, p0, Lcom/android/launcher2/Folder;->mMaxCountY:I

    mul-int/2addr v1, v2

    iput v1, p0, Lcom/android/launcher2/Folder;->mMaxNumItems:I

    .line 136
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    iput-object v1, p0, Lcom/android/launcher2/Folder;->mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    .line 139
    const v1, 0x7f0a0015

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/Folder;->mExpandDuration:I

    .line 141
    sget-object v1, Lcom/android/launcher2/Folder;->sDefaultFolderName:Ljava/lang/String;

    if-nez v1, :cond_2

    .line 142
    const v1, 0x7f0d0010

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/android/launcher2/Folder;->sDefaultFolderName:Ljava/lang/String;

    .line 144
    :cond_2
    sget-object v1, Lcom/android/launcher2/Folder;->sHintText:Ljava/lang/String;

    if-nez v1, :cond_3

    .line 145
    const v1, 0x7f0d0053

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/android/launcher2/Folder;->sHintText:Ljava/lang/String;

    .line 147
    :cond_3
    check-cast p1, Lcom/android/launcher2/Launcher;

    .end local p1
    iput-object p1, p0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    .line 151
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Folder;->setFocusableInTouchMode(Z)V

    .line 152
    return-void
.end method

.method static synthetic access$000(Lcom/android/launcher2/Folder;ILjava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Lcom/android/launcher2/Folder;->sendCustomAccessibilityEvent(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$102(Lcom/android/launcher2/Folder;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 58
    iput p1, p0, Lcom/android/launcher2/Folder;->mState:I

    return p1
.end method

.method static synthetic access$200(Lcom/android/launcher2/Folder;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/android/launcher2/Folder;->setFocusOnFirstChild()V

    return-void
.end method

.method static synthetic access$300(Lcom/android/launcher2/Folder;)Landroid/animation/ObjectAnimator;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mOpenCloseAnimator:Landroid/animation/ObjectAnimator;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/launcher2/Folder;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mEmptyCell:[I

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/launcher2/Folder;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mTargetCell:[I

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/launcher2/Folder;[I[I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Lcom/android/launcher2/Folder;->realTimeReorder([I[I)V

    return-void
.end method

.method static synthetic access$700(Lcom/android/launcher2/Folder;)Lcom/android/launcher2/FolderIcon;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mFolderIcon:Lcom/android/launcher2/FolderIcon;

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/launcher2/Folder;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mItemsInReadingOrder:Ljava/util/ArrayList;

    return-object v0
.end method

.method private arrangeChildren(Ljava/util/ArrayList;)V
    .locals 13
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
    .line 948
    .local p1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    const/4 v0, 0x2

    new-array v12, v0, [I

    .line 949
    .local v12, vacant:[I
    if-nez p1, :cond_0

    .line 950
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getItemsInReadingOrder()Ljava/util/ArrayList;

    move-result-object p1

    .line 952
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->removeAllViews()V

    .line 954
    const/4 v8, 0x0

    .local v8, i:I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v8, v0, :cond_4

    .line 955
    invoke-virtual {p1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/view/View;

    .line 956
    .local v11, v:Landroid/view/View;
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    const/4 v2, 0x1

    const/4 v3, 0x1

    invoke-virtual {v0, v12, v2, v3}, Lcom/android/launcher2/CellLayout;->getVacantCell([III)Z

    .line 957
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 958
    .local v10, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    const/4 v0, 0x0

    aget v0, v12, v0

    iput v0, v10, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    .line 959
    const/4 v0, 0x1

    aget v0, v12, v0

    iput v0, v10, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    .line 960
    invoke-virtual {v11}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/ItemInfo;

    .line 961
    .local v1, info:Lcom/android/launcher2/ItemInfo;
    iget v0, v1, Lcom/android/launcher2/ItemInfo;->cellX:I

    const/4 v2, 0x0

    aget v2, v12, v2

    if-ne v0, v2, :cond_1

    iget v0, v1, Lcom/android/launcher2/ItemInfo;->cellY:I

    const/4 v2, 0x1

    aget v2, v12, v2

    if-eq v0, v2, :cond_2

    .line 962
    :cond_1
    const/4 v0, 0x0

    aget v0, v12, v0

    iput v0, v1, Lcom/android/launcher2/ItemInfo;->cellX:I

    .line 963
    const/4 v0, 0x1

    aget v0, v12, v0

    iput v0, v1, Lcom/android/launcher2/ItemInfo;->cellY:I

    .line 964
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    iget-object v2, p0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget-wide v2, v2, Lcom/android/launcher2/ItemInfo;->id:J

    const/4 v4, 0x0

    iget v5, v1, Lcom/android/launcher2/ItemInfo;->cellX:I

    iget v6, v1, Lcom/android/launcher2/ItemInfo;->cellY:I

    invoke-static/range {v0 .. v6}, Lcom/android/launcher2/LauncherModel;->addOrMoveItemInDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;JIII)V

    .line 967
    :cond_2
    const/4 v9, 0x0

    .line 968
    .local v9, insert:Z
    iget-object v2, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    if-eqz v9, :cond_3

    const/4 v4, 0x0

    :goto_1
    iget-wide v5, v1, Lcom/android/launcher2/ItemInfo;->id:J

    long-to-int v5, v5

    const/4 v7, 0x1

    move-object v3, v11

    move-object v6, v10

    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher2/CellLayout;->addViewToCellLayout(Landroid/view/View;IILcom/android/launcher2/CellLayout$LayoutParams;Z)Z

    .line 954
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 968
    :cond_3
    const/4 v4, -0x1

    goto :goto_1

    .line 970
    .end local v1           #info:Lcom/android/launcher2/ItemInfo;
    .end local v9           #insert:Z
    .end local v10           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    .end local v11           #v:Landroid/view/View;
    :cond_4
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/Folder;->mItemsInvalidated:Z

    .line 971
    return-void
.end method

.method private centerAboutIcon()V
    .locals 22

    .prologue
    .line 854
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Folder;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v14

    check-cast v14, Lcom/android/launcher2/DragLayer$LayoutParams;

    .line 856
    .local v14, lp:Lcom/android/launcher2/DragLayer$LayoutParams;
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Folder;->getPaddingLeft()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Folder;->getPaddingRight()I

    move-result v20

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/android/launcher2/CellLayout;->getDesiredWidth()I

    move-result v20

    add-int v18, v19, v20

    .line 857
    .local v18, width:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Folder;->getPaddingTop()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Folder;->getPaddingBottom()I

    move-result v20

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/android/launcher2/CellLayout;->getDesiredHeight()I

    move-result v20

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/Folder;->mFolderNameHeight:I

    move/from16 v20, v0

    add-int v12, v19, v20

    .line 859
    .local v12, height:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    move-object/from16 v19, v0

    const v20, 0x7f07001b

    invoke-virtual/range {v19 .. v20}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Lcom/android/launcher2/DragLayer;

    .line 861
    .local v15, parent:Lcom/android/launcher2/DragLayer;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mFolderIcon:Lcom/android/launcher2/FolderIcon;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mTempRect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v15, v0, v1}, Lcom/android/launcher2/DragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    move-result v16

    .line 863
    .local v16, scale:F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mTempRect:Landroid/graphics/Rect;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mTempRect:Landroid/graphics/Rect;

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

    .line 864
    .local v4, centerX:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mTempRect:Landroid/graphics/Rect;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mTempRect:Landroid/graphics/Rect;

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

    .line 865
    .local v5, centerY:I
    div-int/lit8 v19, v18, 0x2

    sub-int v6, v4, v19

    .line 866
    .local v6, centeredLeft:I
    div-int/lit8 v19, v12, 0x2

    sub-int v7, v5, v19

    .line 868
    .local v7, centeredTop:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/android/launcher2/Workspace;->getCurrentPage()I

    move-result v9

    .line 871
    .local v9, currentPage:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Lcom/android/launcher2/Workspace;->setFinalScrollForPageChange(I)V

    .line 873
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/android/launcher2/CellLayout;

    .line 874
    .local v8, currentLayout:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v8}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v2

    .line 875
    .local v2, boundingLayout:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 876
    .local v3, bounds:Landroid/graphics/Rect;
    invoke-virtual {v15, v2, v3}, Lcom/android/launcher2/DragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 878
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/android/launcher2/Workspace;->isSmall()Z

    move-result v19

    if-eqz v19, :cond_0

    .line 879
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/launcher2/Launcher;->getCurrentBounds()Landroid/graphics/Rect;

    move-result-object v3

    .line 882
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Lcom/android/launcher2/Workspace;->resetFinalScrollForPageChange(I)V

    .line 885
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

    .line 887
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

    .line 890
    .local v17, top:I
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v19

    move/from16 v0, v18

    move/from16 v1, v19

    if-lt v0, v1, :cond_1

    .line 891
    iget v0, v3, Landroid/graphics/Rect;->left:I

    move/from16 v19, v0

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v20

    sub-int v20, v20, v18

    div-int/lit8 v20, v20, 0x2

    add-int v13, v19, v20

    .line 893
    :cond_1
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v19

    move/from16 v0, v19

    if-lt v12, v0, :cond_2

    .line 894
    iget v0, v3, Landroid/graphics/Rect;->top:I

    move/from16 v19, v0

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v20

    sub-int v20, v20, v12

    div-int/lit8 v20, v20, 0x2

    add-int v17, v19, v20

    .line 897
    :cond_2
    div-int/lit8 v19, v18, 0x2

    sub-int v20, v6, v13

    add-int v10, v19, v20

    .line 898
    .local v10, folderPivotX:I
    div-int/lit8 v19, v12, 0x2

    sub-int v20, v7, v17

    add-int v11, v19, v20

    .line 899
    .local v11, folderPivotY:I
    int-to-float v0, v10

    move/from16 v19, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Folder;->setPivotX(F)V

    .line 900
    int-to-float v0, v11

    move/from16 v19, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Folder;->setPivotY(F)V

    .line 901
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mFolderIcon:Lcom/android/launcher2/FolderIcon;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/launcher2/FolderIcon;->getMeasuredWidth()I

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

    iput v0, v1, Lcom/android/launcher2/Folder;->mFolderIconPivotX:F

    .line 903
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mFolderIcon:Lcom/android/launcher2/FolderIcon;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/launcher2/FolderIcon;->getMeasuredHeight()I

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

    iput v0, v1, Lcom/android/launcher2/Folder;->mFolderIconPivotY:F

    .line 906
    move/from16 v0, v18

    iput v0, v14, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 907
    iput v12, v14, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 908
    iput v13, v14, Lcom/android/launcher2/DragLayer$LayoutParams;->x:I

    .line 909
    move/from16 v0, v17

    iput v0, v14, Lcom/android/launcher2/DragLayer$LayoutParams;->y:I

    .line 910
    return-void
.end method

.method static fromXml(Landroid/content/Context;)Lcom/android/launcher2/Folder;
    .locals 3
    .parameter "context"

    .prologue
    .line 416
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f040016

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/Folder;

    return-object v0
.end method

.method private getDragViewVisualCenter(IIIILcom/android/launcher2/DragView;[F)[F
    .locals 5
    .parameter "x"
    .parameter "y"
    .parameter "xOffset"
    .parameter "yOffset"
    .parameter "dragView"
    .parameter "recycle"

    .prologue
    .line 688
    if-nez p6, :cond_0

    .line 689
    const/4 v3, 0x2

    new-array v1, v3, [F

    .line 698
    .local v1, res:[F
    :goto_0
    sub-int v0, p1, p3

    .line 699
    .local v0, left:I
    sub-int v2, p2, p4

    .line 702
    .local v2, top:I
    const/4 v3, 0x0

    invoke-virtual {p5}, Lcom/android/launcher2/DragView;->getDragRegion()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v0

    int-to-float v4, v4

    aput v4, v1, v3

    .line 703
    const/4 v3, 0x1

    invoke-virtual {p5}, Lcom/android/launcher2/DragView;->getDragRegion()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v2

    int-to-float v4, v4

    aput v4, v1, v3

    .line 705
    return-object v1

    .line 691
    .end local v0           #left:I
    .end local v1           #res:[F
    .end local v2           #top:I
    :cond_0
    move-object v1, p6

    .restart local v1       #res:[F
    goto :goto_0
.end method

.method private getViewForInfo(Lcom/android/launcher2/ShortcutInfo;)Landroid/view/View;
    .locals 4
    .parameter "item"

    .prologue
    .line 1164
    const/4 v1, 0x0

    .local v1, j:I
    :goto_0
    iget-object v3, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v3}, Lcom/android/launcher2/CellLayout;->getCountY()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 1165
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget-object v3, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v3}, Lcom/android/launcher2/CellLayout;->getCountX()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 1166
    iget-object v3, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v3, v0, v1}, Lcom/android/launcher2/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v2

    .line 1167
    .local v2, v:Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    if-ne v3, p1, :cond_0

    .line 1172
    .end local v0           #i:I
    .end local v2           #v:Landroid/view/View;
    :goto_2
    return-object v2

    .line 1165
    .restart local v0       #i:I
    .restart local v2       #v:Landroid/view/View;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1164
    .end local v2           #v:Landroid/view/View;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1172
    .end local v0           #i:I
    :cond_2
    const/4 v2, 0x0

    goto :goto_2
.end method

.method private onCloseComplete()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 983
    const-string v1, "Launcher.Folder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onCloseComplete: parent = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 986
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/DragLayer;

    .line 987
    .local v0, parent:Lcom/android/launcher2/DragLayer;
    if-eqz v0, :cond_0

    .line 988
    invoke-virtual {v0, p0}, Lcom/android/launcher2/DragLayer;->removeView(Landroid/view/View;)V

    .line 990
    :cond_0
    iget-object v1, p0, Lcom/android/launcher2/Folder;->mDragController:Lcom/android/launcher2/DragController;

    invoke-virtual {v1, p0}, Lcom/android/launcher2/DragController;->removeDropTarget(Lcom/android/launcher2/DropTarget;)V

    .line 991
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->clearFocus()V

    .line 992
    iget-object v1, p0, Lcom/android/launcher2/Folder;->mFolderIcon:Lcom/android/launcher2/FolderIcon;

    invoke-virtual {v1}, Lcom/android/launcher2/FolderIcon;->requestFocus()Z

    .line 994
    iget-boolean v1, p0, Lcom/android/launcher2/Folder;->mRearrangeOnClose:Z

    if-eqz v1, :cond_1

    .line 995
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getItemCount()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/launcher2/Folder;->setupContentForNumItems(I)V

    .line 996
    iput-boolean v4, p0, Lcom/android/launcher2/Folder;->mRearrangeOnClose:Z

    .line 998
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getItemCount()I

    move-result v1

    if-gt v1, v5, :cond_2

    .line 999
    iget-boolean v1, p0, Lcom/android/launcher2/Folder;->mDragInProgress:Z

    if-nez v1, :cond_3

    iget-boolean v1, p0, Lcom/android/launcher2/Folder;->mSuppressFolderDeletion:Z

    if-nez v1, :cond_3

    .line 1000
    invoke-direct {p0}, Lcom/android/launcher2/Folder;->replaceFolderWithFinalItem()V

    .line 1005
    :cond_2
    :goto_0
    iput-boolean v4, p0, Lcom/android/launcher2/Folder;->mSuppressFolderDeletion:Z

    .line 1006
    return-void

    .line 1001
    :cond_3
    iget-boolean v1, p0, Lcom/android/launcher2/Folder;->mDragInProgress:Z

    if-eqz v1, :cond_2

    .line 1002
    iput-boolean v5, p0, Lcom/android/launcher2/Folder;->mDeleteFolderOnDropCompleted:Z

    goto :goto_0
.end method

.method private placeInReadingOrder(Ljava/util/ArrayList;)V
    .locals 9
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ShortcutInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 348
    .local p1, items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutInfo;>;"
    const/4 v5, 0x0

    .line 349
    .local v5, maxX:I
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 350
    .local v0, count:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v0, :cond_1

    .line 351
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/launcher2/ShortcutInfo;

    .line 352
    .local v4, item:Lcom/android/launcher2/ShortcutInfo;
    iget v8, v4, Lcom/android/launcher2/ItemInfo;->cellX:I

    if-le v8, v5, :cond_0

    .line 353
    iget v5, v4, Lcom/android/launcher2/ItemInfo;->cellX:I

    .line 350
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 357
    .end local v4           #item:Lcom/android/launcher2/ShortcutInfo;
    :cond_1
    new-instance v2, Lcom/android/launcher2/Folder$GridComparator;

    add-int/lit8 v8, v5, 0x1

    invoke-direct {v2, p0, v8}, Lcom/android/launcher2/Folder$GridComparator;-><init>(Lcom/android/launcher2/Folder;I)V

    .line 358
    .local v2, gridComparator:Lcom/android/launcher2/Folder$GridComparator;
    invoke-static {p1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 359
    iget-object v8, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v8}, Lcom/android/launcher2/CellLayout;->getCountX()I

    move-result v1

    .line 360
    .local v1, countX:I
    const/4 v3, 0x0

    :goto_1
    if-ge v3, v0, :cond_2

    .line 361
    rem-int v6, v3, v1

    .line 362
    .local v6, x:I
    div-int v7, v3, v1

    .line 363
    .local v7, y:I
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/launcher2/ShortcutInfo;

    .line 364
    .restart local v4       #item:Lcom/android/launcher2/ShortcutInfo;
    iput v6, v4, Lcom/android/launcher2/ItemInfo;->cellX:I

    .line 365
    iput v7, v4, Lcom/android/launcher2/ItemInfo;->cellY:I

    .line 360
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 367
    .end local v4           #item:Lcom/android/launcher2/ShortcutInfo;
    .end local v6           #x:I
    .end local v7           #y:I
    :cond_2
    return-void
.end method

.method private positionAndSizeAsIcon()V
    .locals 2

    .prologue
    const v1, 0x3f4ccccd

    .line 424
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Lcom/android/launcher2/DragLayer;

    if-nez v0, :cond_0

    .line 431
    :goto_0
    return-void

    .line 427
    :cond_0
    invoke-virtual {p0, v1}, Lcom/android/launcher2/Folder;->setScaleX(F)V

    .line 428
    invoke-virtual {p0, v1}, Lcom/android/launcher2/Folder;->setScaleY(F)V

    .line 429
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Folder;->setAlpha(F)V

    .line 430
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/launcher2/Folder;->mState:I

    goto :goto_0
.end method

.method private realTimeReorder([I[I)V
    .locals 18
    .parameter "empty"
    .parameter "target"

    .prologue
    .line 630
    const/4 v8, 0x0

    .line 631
    .local v8, delay:I
    const/high16 v11, 0x41f0

    .line 632
    .local v11, delayAmount:F
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Lcom/android/launcher2/Folder;->readingOrderGreaterThan([I[I)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 633
    const/4 v3, 0x0

    aget v3, p1, v3

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v5}, Lcom/android/launcher2/CellLayout;->getCountX()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-lt v3, v5, :cond_1

    const/4 v15, 0x1

    .line 634
    .local v15, wrap:Z
    :goto_0
    if-eqz v15, :cond_2

    const/4 v3, 0x1

    aget v3, p1, v3

    add-int/lit8 v14, v3, 0x1

    .line 635
    .local v14, startY:I
    :goto_1
    move/from16 v17, v14

    .local v17, y:I
    :goto_2
    const/4 v3, 0x1

    aget v3, p2, v3

    move/from16 v0, v17

    if-gt v0, v3, :cond_d

    .line 636
    const/4 v3, 0x1

    aget v3, p1, v3

    move/from16 v0, v17

    if-ne v0, v3, :cond_3

    const/4 v3, 0x0

    aget v3, p1, v3

    add-int/lit8 v13, v3, 0x1

    .line 637
    .local v13, startX:I
    :goto_3
    const/4 v3, 0x1

    aget v3, p2, v3

    move/from16 v0, v17

    if-ge v0, v3, :cond_4

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v3}, Lcom/android/launcher2/CellLayout;->getCountX()I

    move-result v3

    add-int/lit8 v12, v3, -0x1

    .line 638
    .local v12, endX:I
    :goto_4
    move/from16 v16, v13

    .local v16, x:I
    :goto_5
    move/from16 v0, v16

    if-gt v0, v12, :cond_5

    .line 639
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v3, v0, v1}, Lcom/android/launcher2/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v4

    .line 640
    .local v4, v:Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    const/4 v5, 0x0

    aget v5, p1, v5

    const/4 v6, 0x1

    aget v6, p1, v6

    const/16 v7, 0xe6

    const/4 v9, 0x1

    const/4 v10, 0x1

    invoke-virtual/range {v3 .. v10}, Lcom/android/launcher2/CellLayout;->animateChildToPosition(Landroid/view/View;IIIIZZ)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 642
    const/4 v3, 0x0

    aput v16, p1, v3

    .line 643
    const/4 v3, 0x1

    aput v17, p1, v3

    .line 644
    int-to-float v3, v8

    add-float/2addr v3, v11

    float-to-int v8, v3

    .line 645
    float-to-double v5, v11

    const-wide v9, 0x3feccccccccccccdL

    mul-double/2addr v5, v9

    double-to-float v11, v5

    .line 638
    :cond_0
    add-int/lit8 v16, v16, 0x1

    goto :goto_5

    .line 633
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

    .line 634
    .restart local v15       #wrap:Z
    :cond_2
    const/4 v3, 0x1

    aget v14, p1, v3

    goto :goto_1

    .line 636
    .restart local v14       #startY:I
    .restart local v17       #y:I
    :cond_3
    const/4 v13, 0x0

    goto :goto_3

    .line 637
    .restart local v13       #startX:I
    :cond_4
    const/4 v3, 0x0

    aget v12, p2, v3

    goto :goto_4

    .line 635
    .restart local v12       #endX:I
    .restart local v16       #x:I
    :cond_5
    add-int/lit8 v17, v17, 0x1

    goto :goto_2

    .line 650
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

    .line 651
    .restart local v15       #wrap:Z
    :goto_6
    if-eqz v15, :cond_9

    const/4 v3, 0x1

    aget v3, p1, v3

    add-int/lit8 v14, v3, -0x1

    .line 652
    .restart local v14       #startY:I
    :goto_7
    move/from16 v17, v14

    .restart local v17       #y:I
    :goto_8
    const/4 v3, 0x1

    aget v3, p2, v3

    move/from16 v0, v17

    if-lt v0, v3, :cond_d

    .line 653
    const/4 v3, 0x1

    aget v3, p1, v3

    move/from16 v0, v17

    if-ne v0, v3, :cond_a

    const/4 v3, 0x0

    aget v3, p1, v3

    add-int/lit8 v13, v3, -0x1

    .line 654
    .restart local v13       #startX:I
    :goto_9
    const/4 v3, 0x1

    aget v3, p2, v3

    move/from16 v0, v17

    if-le v0, v3, :cond_b

    const/4 v12, 0x0

    .line 655
    .restart local v12       #endX:I
    :goto_a
    move/from16 v16, v13

    .restart local v16       #x:I
    :goto_b
    move/from16 v0, v16

    if-lt v0, v12, :cond_c

    .line 656
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v3, v0, v1}, Lcom/android/launcher2/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v4

    .line 657
    .restart local v4       #v:Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    const/4 v5, 0x0

    aget v5, p1, v5

    const/4 v6, 0x1

    aget v6, p1, v6

    const/16 v7, 0xe6

    const/4 v9, 0x1

    const/4 v10, 0x1

    invoke-virtual/range {v3 .. v10}, Lcom/android/launcher2/CellLayout;->animateChildToPosition(Landroid/view/View;IIIIZZ)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 659
    const/4 v3, 0x0

    aput v16, p1, v3

    .line 660
    const/4 v3, 0x1

    aput v17, p1, v3

    .line 661
    int-to-float v3, v8

    add-float/2addr v3, v11

    float-to-int v8, v3

    .line 662
    float-to-double v5, v11

    const-wide v9, 0x3feccccccccccccdL

    mul-double/2addr v5, v9

    double-to-float v11, v5

    .line 655
    :cond_7
    add-int/lit8 v16, v16, -0x1

    goto :goto_b

    .line 650
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

    .line 651
    .restart local v15       #wrap:Z
    :cond_9
    const/4 v3, 0x1

    aget v14, p1, v3

    goto :goto_7

    .line 653
    .restart local v14       #startY:I
    .restart local v17       #y:I
    :cond_a
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v3}, Lcom/android/launcher2/CellLayout;->getCountX()I

    move-result v3

    add-int/lit8 v13, v3, -0x1

    goto :goto_9

    .line 654
    .restart local v13       #startX:I
    :cond_b
    const/4 v3, 0x0

    aget v12, p2, v3

    goto :goto_a

    .line 652
    .restart local v12       #endX:I
    .restart local v16       #x:I
    :cond_c
    add-int/lit8 v17, v17, -0x1

    goto :goto_8

    .line 667
    .end local v12           #endX:I
    .end local v13           #startX:I
    .end local v16           #x:I
    :cond_d
    return-void
.end method

.method private replaceFolderWithFinalItem()V
    .locals 3

    .prologue
    .line 1010
    new-instance v1, Lcom/android/launcher2/Folder$8;

    invoke-direct {v1, p0}, Lcom/android/launcher2/Folder$8;-><init>(Lcom/android/launcher2/Folder;)V

    .line 1046
    .local v1, onCompleteRunnable:Ljava/lang/Runnable;
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/android/launcher2/Folder;->getItemAt(I)Landroid/view/View;

    move-result-object v0

    .line 1047
    .local v0, finalChild:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 1048
    iget-object v2, p0, Lcom/android/launcher2/Folder;->mFolderIcon:Lcom/android/launcher2/FolderIcon;

    invoke-virtual {v2, v0, v1}, Lcom/android/launcher2/FolderIcon;->performDestroyAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 1050
    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/launcher2/Folder;->mDestroyed:Z

    .line 1051
    return-void
.end method

.method private sendCustomAccessibilityEvent(ILjava/lang/String;)V
    .locals 4
    .parameter "type"
    .parameter "text"

    .prologue
    .line 482
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "accessibility"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    .line 484
    .local v0, accessibilityManager:Landroid/view/accessibility/AccessibilityManager;
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 485
    invoke-static {p1}, Landroid/view/accessibility/AccessibilityEvent;->obtain(I)Landroid/view/accessibility/AccessibilityEvent;

    move-result-object v1

    .line 486
    .local v1, event:Landroid/view/accessibility/AccessibilityEvent;
    invoke-virtual {p0, v1}, Lcom/android/launcher2/Folder;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 487
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 488
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityManager;->sendAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 490
    .end local v1           #event:Landroid/view/accessibility/AccessibilityEvent;
    :cond_0
    return-void
.end method

.method private setFocusOnFirstChild()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 493
    iget-object v1, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v1, v2, v2}, Lcom/android/launcher2/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v0

    .line 494
    .local v0, firstChild:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 495
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 497
    :cond_0
    return-void
.end method

.method private setupContentDimensions(I)V
    .locals 8
    .parameter "count"

    .prologue
    const/4 v6, 0x0

    .line 821
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getItemsInReadingOrder()Ljava/util/ArrayList;

    move-result-object v3

    .line 823
    .local v3, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    iget-object v7, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v7}, Lcom/android/launcher2/CellLayout;->getCountX()I

    move-result v0

    .line 824
    .local v0, countX:I
    iget-object v7, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v7}, Lcom/android/launcher2/CellLayout;->getCountY()I

    move-result v1

    .line 825
    .local v1, countY:I
    const/4 v2, 0x0

    .line 827
    .local v2, done:Z
    :goto_0
    if-nez v2, :cond_7

    .line 828
    move v4, v0

    .line 829
    .local v4, oldCountX:I
    move v5, v1

    .line 830
    .local v5, oldCountY:I
    mul-int v7, v0, v1

    if-ge v7, p1, :cond_4

    .line 832
    if-le v0, v1, :cond_0

    iget v7, p0, Lcom/android/launcher2/Folder;->mMaxCountY:I

    if-ne v1, v7, :cond_3

    :cond_0
    iget v7, p0, Lcom/android/launcher2/Folder;->mMaxCountX:I

    if-ge v0, v7, :cond_3

    .line 833
    add-int/lit8 v0, v0, 0x1

    .line 837
    :cond_1
    :goto_1
    if-nez v1, :cond_2

    add-int/lit8 v1, v1, 0x1

    .line 843
    :cond_2
    :goto_2
    if-ne v0, v4, :cond_6

    if-ne v1, v5, :cond_6

    const/4 v2, 0x1

    .line 844
    :goto_3
    goto :goto_0

    .line 834
    :cond_3
    iget v7, p0, Lcom/android/launcher2/Folder;->mMaxCountY:I

    if-ge v1, v7, :cond_1

    .line 835
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 838
    :cond_4
    add-int/lit8 v7, v1, -0x1

    mul-int/2addr v7, v0

    if-lt v7, p1, :cond_5

    if-lt v1, v0, :cond_5

    .line 839
    add-int/lit8 v7, v1, -0x1

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v1

    goto :goto_2

    .line 840
    :cond_5
    add-int/lit8 v7, v0, -0x1

    mul-int/2addr v7, v1

    if-lt v7, p1, :cond_2

    .line 841
    add-int/lit8 v7, v0, -0x1

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_2

    :cond_6
    move v2, v6

    .line 843
    goto :goto_3

    .line 845
    .end local v4           #oldCountX:I
    .end local v5           #oldCountY:I
    :cond_7
    iget-object v6, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v6, v0, v1}, Lcom/android/launcher2/CellLayout;->setGridSize(II)V

    .line 846
    invoke-direct {p0, v3}, Lcom/android/launcher2/Folder;->arrangeChildren(Ljava/util/ArrayList;)V

    .line 847
    return-void
.end method

.method private setupContentForNumItems(I)V
    .locals 2
    .parameter "count"

    .prologue
    const/4 v1, 0x0

    .line 920
    invoke-direct {p0, p1}, Lcom/android/launcher2/Folder;->setupContentDimensions(I)V

    .line 922
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/DragLayer$LayoutParams;

    .line 923
    .local v0, lp:Lcom/android/launcher2/DragLayer$LayoutParams;
    if-nez v0, :cond_0

    .line 924
    new-instance v0, Lcom/android/launcher2/DragLayer$LayoutParams;

    .end local v0           #lp:Lcom/android/launcher2/DragLayer$LayoutParams;
    invoke-direct {v0, v1, v1}, Lcom/android/launcher2/DragLayer$LayoutParams;-><init>(II)V

    .line 925
    .restart local v0       #lp:Lcom/android/launcher2/DragLayer$LayoutParams;
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/android/launcher2/DragLayer$LayoutParams;->customPosition:Z

    .line 926
    invoke-virtual {p0, v0}, Lcom/android/launcher2/Folder;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 928
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher2/Folder;->centerAboutIcon()V

    .line 929
    return-void
.end method

.method private updateItemLocationsInDatabase()V
    .locals 10

    .prologue
    .line 797
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getItemsInReadingOrder()Ljava/util/ArrayList;

    move-result-object v8

    .line 798
    .local v8, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    const/4 v7, 0x0

    .local v7, i:I
    :goto_0
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v7, v0, :cond_0

    .line 799
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/View;

    .line 800
    .local v9, v:Landroid/view/View;
    invoke-virtual {v9}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/ItemInfo;

    .line 801
    .local v1, info:Lcom/android/launcher2/ItemInfo;
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    iget-object v2, p0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget-wide v2, v2, Lcom/android/launcher2/ItemInfo;->id:J

    const/4 v4, 0x0

    iget v5, v1, Lcom/android/launcher2/ItemInfo;->cellX:I

    iget v6, v1, Lcom/android/launcher2/ItemInfo;->cellY:I

    invoke-static/range {v0 .. v6}, Lcom/android/launcher2/LauncherModel;->moveItemInDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;JIII)V

    .line 798
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 804
    .end local v1           #info:Lcom/android/launcher2/ItemInfo;
    .end local v9           #v:Landroid/view/View;
    :cond_0
    return-void
.end method

.method private updateTextViewFocus()V
    .locals 3

    .prologue
    .line 1060
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Folder;->getItemAt(I)Landroid/view/View;

    move-result-object v0

    .line 1061
    .local v0, lastChild:Landroid/view/View;
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Folder;->getItemAt(I)Landroid/view/View;

    .line 1062
    if-eqz v0, :cond_0

    .line 1063
    iget-object v1, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/launcher2/FolderEditText;->setNextFocusDownId(I)V

    .line 1064
    iget-object v1, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/launcher2/FolderEditText;->setNextFocusRightId(I)V

    .line 1065
    iget-object v1, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/launcher2/FolderEditText;->setNextFocusLeftId(I)V

    .line 1066
    iget-object v1, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/launcher2/FolderEditText;->setNextFocusUpId(I)V

    .line 1068
    :cond_0
    return-void
.end method


# virtual methods
.method public acceptDrop(Lcom/android/launcher2/DropTarget$DragObject;)Z
    .locals 6
    .parameter "d"

    .prologue
    const/4 v2, 0x1

    .line 551
    const-string v3, "Launcher.Folder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "acceptDrop: DragObject = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 554
    iget-object v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v0, Lcom/android/launcher2/ItemInfo;

    .line 555
    .local v0, item:Lcom/android/launcher2/ItemInfo;
    iget v1, v0, Lcom/android/launcher2/ItemInfo;->itemType:I

    .line 556
    .local v1, itemType:I
    if-eqz v1, :cond_0

    if-ne v1, v2, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->isFull()Z

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

    .line 501
    const-string v4, "Launcher.Folder"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "animateClosed: parent = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 503
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    instance-of v4, v4, Lcom/android/launcher2/DragLayer;

    if-nez v4, :cond_0

    .line 538
    :goto_0
    return-void

    .line 506
    :cond_0
    const-string v4, "alpha"

    new-array v5, v8, [F

    const/4 v6, 0x0

    aput v6, v5, v7

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    .line 507
    .local v0, alpha:Landroid/animation/PropertyValuesHolder;
    const-string v4, "scaleX"

    new-array v5, v8, [F

    aput v9, v5, v7

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v2

    .line 508
    .local v2, scaleX:Landroid/animation/PropertyValuesHolder;
    const-string v4, "scaleY"

    new-array v5, v8, [F

    aput v9, v5, v7

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    .line 509
    .local v3, scaleY:Landroid/animation/PropertyValuesHolder;
    const/4 v4, 0x3

    new-array v4, v4, [Landroid/animation/PropertyValuesHolder;

    aput-object v0, v4, v7

    aput-object v2, v4, v8

    aput-object v3, v4, v10

    invoke-static {p0, v4}, Lcom/android/launcher2/LauncherAnimUtils;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/Folder;->mOpenCloseAnimator:Landroid/animation/ObjectAnimator;

    .line 512
    .local v1, oa:Landroid/animation/ObjectAnimator;
    new-instance v4, Lcom/android/launcher2/Folder$4;

    invoke-direct {v4, p0}, Lcom/android/launcher2/Folder$4;-><init>(Lcom/android/launcher2/Folder;)V

    invoke-virtual {v1, v4}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 526
    iget v4, p0, Lcom/android/launcher2/Folder;->mExpandDuration:I

    int-to-long v4, v4

    invoke-virtual {v1, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 527
    const/4 v4, 0x0

    invoke-virtual {p0, v10, v4}, Lcom/android/launcher2/Folder;->setLayerType(ILandroid/graphics/Paint;)V

    .line 528
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->buildLayer()V

    .line 529
    new-instance v4, Lcom/android/launcher2/Folder$5;

    invoke-direct {v4, p0, v1}, Lcom/android/launcher2/Folder$5;-><init>(Lcom/android/launcher2/Folder;Landroid/animation/ObjectAnimator;)V

    invoke-virtual {p0, v4}, Lcom/android/launcher2/Folder;->post(Ljava/lang/Runnable;)Z

    .line 537
    invoke-direct {p0}, Lcom/android/launcher2/Folder;->onCloseComplete()V

    goto :goto_0
.end method

.method public animateOpen()V
    .locals 10

    .prologue
    const/4 v9, 0x2

    const/high16 v8, 0x3f80

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 434
    invoke-direct {p0}, Lcom/android/launcher2/Folder;->positionAndSizeAsIcon()V

    .line 437
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->updateContentUnreadNum()V

    .line 439
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    instance-of v4, v4, Lcom/android/launcher2/DragLayer;

    if-nez v4, :cond_0

    .line 479
    :goto_0
    return-void

    .line 442
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher2/Folder;->centerAboutIcon()V

    .line 443
    const-string v4, "alpha"

    new-array v5, v7, [F

    aput v8, v5, v6

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    .line 444
    .local v0, alpha:Landroid/animation/PropertyValuesHolder;
    const-string v4, "scaleX"

    new-array v5, v7, [F

    aput v8, v5, v6

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v2

    .line 445
    .local v2, scaleX:Landroid/animation/PropertyValuesHolder;
    const-string v4, "scaleY"

    new-array v5, v7, [F

    aput v8, v5, v6

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    .line 446
    .local v3, scaleY:Landroid/animation/PropertyValuesHolder;
    const/4 v4, 0x3

    new-array v4, v4, [Landroid/animation/PropertyValuesHolder;

    aput-object v0, v4, v6

    aput-object v2, v4, v7

    aput-object v3, v4, v9

    invoke-static {p0, v4}, Lcom/android/launcher2/LauncherAnimUtils;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/Folder;->mOpenCloseAnimator:Landroid/animation/ObjectAnimator;

    .line 449
    .local v1, oa:Landroid/animation/ObjectAnimator;
    new-instance v4, Lcom/android/launcher2/Folder$2;

    invoke-direct {v4, p0}, Lcom/android/launcher2/Folder$2;-><init>(Lcom/android/launcher2/Folder;)V

    invoke-virtual {v1, v4}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 468
    iget v4, p0, Lcom/android/launcher2/Folder;->mExpandDuration:I

    int-to-long v4, v4

    invoke-virtual {v1, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 469
    const/4 v4, 0x0

    invoke-virtual {p0, v9, v4}, Lcom/android/launcher2/Folder;->setLayerType(ILandroid/graphics/Paint;)V

    .line 470
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->buildLayer()V

    .line 471
    new-instance v4, Lcom/android/launcher2/Folder$3;

    invoke-direct {v4, p0, v1}, Lcom/android/launcher2/Folder$3;-><init>(Lcom/android/launcher2/Folder;Landroid/animation/ObjectAnimator;)V

    invoke-virtual {p0, v4}, Lcom/android/launcher2/Folder;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method bind(Lcom/android/launcher2/FolderInfo;)V
    .locals 9
    .parameter "info"

    .prologue
    .line 370
    iput-object p1, p0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    .line 371
    iget-object v1, p1, Lcom/android/launcher2/FolderInfo;->contents:Ljava/util/ArrayList;

    .line 372
    .local v1, children:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutInfo;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 373
    .local v6, overflow:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutInfo;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-direct {p0, v7}, Lcom/android/launcher2/Folder;->setupContentForNumItems(I)V

    .line 374
    invoke-direct {p0, v1}, Lcom/android/launcher2/Folder;->placeInReadingOrder(Ljava/util/ArrayList;)V

    .line 375
    const/4 v2, 0x0

    .line 376
    .local v2, count:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v3, v7, :cond_1

    .line 377
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/ShortcutInfo;

    .line 378
    .local v0, child:Lcom/android/launcher2/ShortcutInfo;
    invoke-virtual {p0, v0}, Lcom/android/launcher2/Folder;->createAndAddShortcut(Lcom/android/launcher2/ShortcutInfo;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 379
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 376
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 381
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 386
    .end local v0           #child:Lcom/android/launcher2/ShortcutInfo;
    :cond_1
    invoke-direct {p0, v2}, Lcom/android/launcher2/Folder;->setupContentForNumItems(I)V

    .line 391
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/launcher2/ShortcutInfo;

    .line 392
    .local v5, item:Lcom/android/launcher2/ShortcutInfo;
    iget-object v7, p0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    invoke-virtual {v7, v5}, Lcom/android/launcher2/FolderInfo;->remove(Lcom/android/launcher2/ShortcutInfo;)V

    .line 393
    iget-object v7, p0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-static {v7, v5}, Lcom/android/launcher2/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;)V

    goto :goto_2

    .line 396
    .end local v5           #item:Lcom/android/launcher2/ShortcutInfo;
    :cond_2
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/android/launcher2/Folder;->mItemsInvalidated:Z

    .line 397
    invoke-direct {p0}, Lcom/android/launcher2/Folder;->updateTextViewFocus()V

    .line 398
    iget-object v7, p0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    invoke-virtual {v7, p0}, Lcom/android/launcher2/FolderInfo;->addListener(Lcom/android/launcher2/FolderInfo$FolderListener;)V

    .line 400
    sget-object v7, Lcom/android/launcher2/Folder;->sDefaultFolderName:Ljava/lang/String;

    iget-object v8, p0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget-object v8, v8, Lcom/android/launcher2/ItemInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v7, v8}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 401
    iget-object v7, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    iget-object v8, p0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget-object v8, v8, Lcom/android/launcher2/ItemInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v7, v8}, Lcom/android/launcher2/FolderEditText;->setText(Ljava/lang/CharSequence;)V

    .line 405
    :goto_3
    invoke-direct {p0}, Lcom/android/launcher2/Folder;->updateItemLocationsInDatabase()V

    .line 406
    return-void

    .line 403
    :cond_3
    iget-object v7, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    const-string v8, ""

    invoke-virtual {v7, v8}, Lcom/android/launcher2/FolderEditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_3
.end method

.method public completeDragExit()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 716
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/Folder;->mRearrangeOnClose:Z

    .line 717
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->closeFolder()V

    .line 718
    iput-object v1, p0, Lcom/android/launcher2/Folder;->mCurrentDragInfo:Lcom/android/launcher2/ShortcutInfo;

    .line 719
    iput-object v1, p0, Lcom/android/launcher2/Folder;->mCurrentDragView:Landroid/view/View;

    .line 720
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/launcher2/Folder;->mSuppressOnAdd:Z

    .line 722
    return-void
.end method

.method protected createAndAddShortcut(Lcom/android/launcher2/ShortcutInfo;)Z
    .locals 9
    .parameter "item"

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    const/4 v2, 0x0

    .line 573
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mInflater:Landroid/view/LayoutInflater;

    const v3, 0x7f040002

    invoke-virtual {v0, v3, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 575
    .local v1, textView:Landroid/widget/TextView;
    new-instance v0, Lcom/android/launcher2/FastBitmapDrawable;

    iget-object v3, p0, Lcom/android/launcher2/Folder;->mIconCache:Lcom/android/launcher2/IconCache;

    invoke-virtual {p1, v3}, Lcom/android/launcher2/ShortcutInfo;->getIcon(Lcom/android/launcher2/IconCache;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/android/launcher2/FastBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v1, v7, v0, v7, v7}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 577
    iget-object v0, p1, Lcom/android/launcher2/ItemInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 578
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 581
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mFolderIcon:Lcom/android/launcher2/FolderIcon;

    iget-object v3, p1, Lcom/android/launcher2/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v3}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v3

    iget v7, p1, Lcom/android/launcher2/ItemInfo;->unreadNum:I

    invoke-virtual {v0, v3, v7}, Lcom/android/launcher2/FolderIcon;->updateFolderUnreadNum(Landroid/content/ComponentName;I)V

    .line 583
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 584
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 588
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    iget v3, p1, Lcom/android/launcher2/ItemInfo;->cellX:I

    iget v7, p1, Lcom/android/launcher2/ItemInfo;->cellY:I

    invoke-virtual {v0, v3, v7}, Lcom/android/launcher2/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    iget v0, p1, Lcom/android/launcher2/ItemInfo;->cellX:I

    if-ltz v0, :cond_0

    iget v0, p1, Lcom/android/launcher2/ItemInfo;->cellY:I

    if-ltz v0, :cond_0

    iget v0, p1, Lcom/android/launcher2/ItemInfo;->cellX:I

    iget-object v3, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v3}, Lcom/android/launcher2/CellLayout;->getCountX()I

    move-result v3

    if-ge v0, v3, :cond_0

    iget v0, p1, Lcom/android/launcher2/ItemInfo;->cellY:I

    iget-object v3, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v3}, Lcom/android/launcher2/CellLayout;->getCountY()I

    move-result v3

    if-lt v0, v3, :cond_1

    .line 591
    :cond_0
    const-string v0, "Launcher.Folder"

    const-string v3, "Folder order not properly persisted during bind"

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 592
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Folder;->findAndSetEmptyCells(Lcom/android/launcher2/ShortcutInfo;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 602
    :goto_0
    return v2

    .line 597
    :cond_1
    new-instance v4, Lcom/android/launcher2/CellLayout$LayoutParams;

    iget v0, p1, Lcom/android/launcher2/ItemInfo;->cellX:I

    iget v3, p1, Lcom/android/launcher2/ItemInfo;->cellY:I

    iget v7, p1, Lcom/android/launcher2/ItemInfo;->spanX:I

    iget v8, p1, Lcom/android/launcher2/ItemInfo;->spanY:I

    invoke-direct {v4, v0, v3, v7, v8}, Lcom/android/launcher2/CellLayout$LayoutParams;-><init>(IIII)V

    .line 599
    .local v4, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    const/4 v6, 0x0

    .line 600
    .local v6, insert:Z
    new-instance v0, Lcom/android/launcher2/FolderKeyEventListener;

    invoke-direct {v0}, Lcom/android/launcher2/FolderKeyEventListener;-><init>()V

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 601
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    if-eqz v6, :cond_2

    :goto_1
    iget-wide v7, p1, Lcom/android/launcher2/ItemInfo;->id:J

    long-to-int v3, v7

    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher2/CellLayout;->addViewToCellLayout(Landroid/view/View;IILcom/android/launcher2/CellLayout$LayoutParams;Z)Z

    move v2, v5

    .line 602
    goto :goto_0

    .line 601
    :cond_2
    const/4 v2, -0x1

    goto :goto_1
.end method

.method public dismissEditingName()V
    .locals 3

    .prologue
    .line 264
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 265
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Folder;->doneEditingFolderName(Z)V

    .line 266
    return-void
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1
    .parameter "event"

    .prologue
    .line 323
    const/4 v0, 0x1

    return v0
.end method

.method public doneEditingFolderName(Z)V
    .locals 5
    .parameter "commit"

    .prologue
    const/4 v4, 0x0

    .line 269
    iget-object v1, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    sget-object v2, Lcom/android/launcher2/Folder;->sHintText:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/android/launcher2/FolderEditText;->setHint(Ljava/lang/CharSequence;)V

    .line 272
    iget-object v1, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    invoke-virtual {v1}, Lcom/android/launcher2/FolderEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 273
    .local v0, newTitle:Ljava/lang/String;
    iget-object v1, p0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    invoke-virtual {v1, v0}, Lcom/android/launcher2/FolderInfo;->setTitle(Ljava/lang/CharSequence;)V

    .line 274
    iget-object v1, p0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    iget-object v2, p0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherModel;->updateItemInDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;)V

    .line 276
    if-eqz p1, :cond_0

    .line 277
    const/16 v1, 0x20

    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0d0067

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/android/launcher2/Folder;->sendCustomAccessibilityEvent(ILjava/lang/String;)V

    .line 282
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->requestFocus()Z

    .line 284
    iget-object v1, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    invoke-virtual {v1}, Lcom/android/launcher2/FolderEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-static {v1, v4, v4}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;II)V

    .line 285
    iput-boolean v4, p0, Lcom/android/launcher2/Folder;->mIsEditingName:Z

    .line 286
    return-void
.end method

.method protected findAndSetEmptyCells(Lcom/android/launcher2/ShortcutInfo;)Z
    .locals 6
    .parameter "item"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 562
    const/4 v3, 0x2

    new-array v0, v3, [I

    .line 563
    .local v0, emptyCell:[I
    iget-object v3, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    iget v4, p1, Lcom/android/launcher2/ItemInfo;->spanX:I

    iget v5, p1, Lcom/android/launcher2/ItemInfo;->spanY:I

    invoke-virtual {v3, v0, v4, v5}, Lcom/android/launcher2/CellLayout;->findCellForSpan([III)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 564
    aget v2, v0, v2

    iput v2, p1, Lcom/android/launcher2/ItemInfo;->cellX:I

    .line 565
    aget v2, v0, v1

    iput v2, p1, Lcom/android/launcher2/ItemInfo;->cellY:I

    .line 568
    :goto_0
    return v1

    :cond_0
    move v1, v2

    goto :goto_0
.end method

.method public getDragDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 301
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getDropTargetDelegate(Lcom/android/launcher2/DropTarget$DragObject;)Lcom/android/launcher2/DropTarget;
    .locals 1
    .parameter "d"

    .prologue
    .line 817
    const/4 v0, 0x0

    return-object v0
.end method

.method public getEditTextRegion()Landroid/view/View;
    .locals 1

    .prologue
    .line 297
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    return-object v0
.end method

.method getInfo()Lcom/android/launcher2/FolderInfo;
    .locals 1

    .prologue
    .line 330
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    return-object v0
.end method

.method public getItemAt(I)Landroid/view/View;
    .locals 1
    .parameter "index"

    .prologue
    .line 978
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 974
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

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
    .line 1183
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Folder;->getItemsInReadingOrder(Z)Ljava/util/ArrayList;

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
    .line 1187
    iget-boolean v4, p0, Lcom/android/launcher2/Folder;->mItemsInvalidated:Z

    if-eqz v4, :cond_4

    .line 1188
    iget-object v4, p0, Lcom/android/launcher2/Folder;->mItemsInReadingOrder:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 1189
    const/4 v2, 0x0

    .local v2, j:I
    :goto_0
    iget-object v4, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v4}, Lcom/android/launcher2/CellLayout;->getCountY()I

    move-result v4

    if-ge v2, v4, :cond_3

    .line 1190
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget-object v4, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v4}, Lcom/android/launcher2/CellLayout;->getCountX()I

    move-result v4

    if-ge v0, v4, :cond_2

    .line 1191
    iget-object v4, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v4, v0, v2}, Lcom/android/launcher2/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v3

    .line 1192
    .local v3, v:Landroid/view/View;
    if-eqz v3, :cond_1

    .line 1193
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/ShortcutInfo;

    .line 1194
    .local v1, info:Lcom/android/launcher2/ShortcutInfo;
    iget-object v4, p0, Lcom/android/launcher2/Folder;->mCurrentDragInfo:Lcom/android/launcher2/ShortcutInfo;

    if-ne v1, v4, :cond_0

    if-eqz p1, :cond_1

    .line 1195
    :cond_0
    iget-object v4, p0, Lcom/android/launcher2/Folder;->mItemsInReadingOrder:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1190
    .end local v1           #info:Lcom/android/launcher2/ShortcutInfo;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1189
    .end local v3           #v:Landroid/view/View;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1200
    .end local v0           #i:I
    :cond_3
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/android/launcher2/Folder;->mItemsInvalidated:Z

    .line 1202
    .end local v2           #j:I
    :cond_4
    iget-object v4, p0, Lcom/android/launcher2/Folder;->mItemsInReadingOrder:Ljava/util/ArrayList;

    return-object v4
.end method

.method public getLocationInDragLayer([I)V
    .locals 1
    .parameter "loc"

    .prologue
    .line 1206
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/android/launcher2/DragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 1207
    return-void
.end method

.method getPivotXForIconAnimation()F
    .locals 1

    .prologue
    .line 913
    iget v0, p0, Lcom/android/launcher2/Folder;->mFolderIconPivotX:F

    return v0
.end method

.method getPivotYForIconAnimation()F
    .locals 1

    .prologue
    .line 916
    iget v0, p0, Lcom/android/launcher2/Folder;->mFolderIconPivotY:F

    return v0
.end method

.method isDestroyed()Z
    .locals 1

    .prologue
    .line 1054
    iget-boolean v0, p0, Lcom/android/launcher2/Folder;->mDestroyed:Z

    return v0
.end method

.method public isDropEnabled()Z
    .locals 1

    .prologue
    .line 813
    const/4 v0, 0x1

    return v0
.end method

.method public isEditingName()Z
    .locals 1

    .prologue
    .line 255
    iget-boolean v0, p0, Lcom/android/launcher2/Folder;->mIsEditingName:Z

    return v0
.end method

.method public isFull()Z
    .locals 2

    .prologue
    .line 850
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getItemCount()I

    move-result v0

    iget v1, p0, Lcom/android/launcher2/Folder;->mMaxNumItems:I

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method notifyDataSetChanged()V
    .locals 2

    .prologue
    .line 543
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->removeAllViewsInLayout()V

    .line 545
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    const/4 v1, 0x0

    iput v1, v0, Lcom/android/launcher2/ItemInfo;->unreadNum:I

    .line 546
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Folder;->bind(Lcom/android/launcher2/FolderInfo;)V

    .line 547
    return-void
.end method

.method public notifyDrop()V
    .locals 1

    .prologue
    .line 807
    iget-boolean v0, p0, Lcom/android/launcher2/Folder;->mDragInProgress:Z

    if-eqz v0, :cond_0

    .line 808
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/Folder;->mItemAddedBackToSelfViaIcon:Z

    .line 810
    :cond_0
    return-void
.end method

.method public onAdd(Lcom/android/launcher2/ShortcutInfo;)V
    .locals 7
    .parameter "item"

    .prologue
    .line 1107
    const-string v0, "Launcher.Folder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onAdd item = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1110
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/Folder;->mItemsInvalidated:Z

    .line 1113
    iget-boolean v0, p0, Lcom/android/launcher2/Folder;->mSuppressOnAdd:Z

    if-eqz v0, :cond_0

    .line 1122
    :goto_0
    return-void

    .line 1114
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Folder;->findAndSetEmptyCells(Lcom/android/launcher2/ShortcutInfo;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1116
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/launcher2/Folder;->setupContentForNumItems(I)V

    .line 1117
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Folder;->findAndSetEmptyCells(Lcom/android/launcher2/ShortcutInfo;)Z

    .line 1119
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Folder;->createAndAddShortcut(Lcom/android/launcher2/ShortcutInfo;)Z

    .line 1120
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    iget-object v1, p0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget-wide v2, v1, Lcom/android/launcher2/ItemInfo;->id:J

    const/4 v4, 0x0

    iget v5, p1, Lcom/android/launcher2/ItemInfo;->cellX:I

    iget v6, p1, Lcom/android/launcher2/ItemInfo;->cellY:I

    move-object v1, p1

    invoke-static/range {v0 .. v6}, Lcom/android/launcher2/LauncherModel;->addOrMoveItemInDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;JIII)V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 10
    .parameter "v"

    .prologue
    const/4 v9, 0x1

    const/4 v7, 0x0

    .line 201
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    .line 203
    .local v2, tag:Ljava/lang/Object;
    const-string v3, "Launcher.Folder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onClick: v = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", tag = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    instance-of v3, v2, Lcom/android/launcher2/ShortcutInfo;

    if-eqz v3, :cond_0

    move-object v0, v2

    .line 208
    check-cast v0, Lcom/android/launcher2/ShortcutInfo;

    .line 209
    .local v0, item:Lcom/android/launcher2/ShortcutInfo;
    const/4 v3, 0x2

    new-array v1, v3, [I

    .line 210
    .local v1, pos:[I
    invoke-virtual {p1, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 211
    iget-object v3, v0, Lcom/android/launcher2/ShortcutInfo;->intent:Landroid/content/Intent;

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
    iget-object v3, p0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    iget-object v4, v0, Lcom/android/launcher2/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v3, p1, v4, v0}, Lcom/android/launcher2/Launcher;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z

    .line 216
    .end local v0           #item:Lcom/android/launcher2/ShortcutInfo;
    .end local v1           #pos:[I
    :cond_0
    return-void
.end method

.method public onDragEnter(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 3
    .parameter "d"

    .prologue
    const/4 v2, -0x1

    .line 606
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mPreviousTargetCell:[I

    const/4 v1, 0x0

    aput v2, v0, v1

    .line 607
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mPreviousTargetCell:[I

    const/4 v1, 0x1

    aput v2, v0, v1

    .line 608
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mOnExitAlarm:Lcom/android/launcher2/Alarm;

    invoke-virtual {v0}, Lcom/android/launcher2/Alarm;->cancelAlarm()V

    .line 609
    return-void
.end method

.method public onDragExit(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 3
    .parameter "d"

    .prologue
    .line 726
    const-string v0, "Launcher.Folder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDragExit: DragObject = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 731
    iget-boolean v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragComplete:Z

    if-nez v0, :cond_0

    .line 732
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mOnExitAlarm:Lcom/android/launcher2/Alarm;

    iget-object v1, p0, Lcom/android/launcher2/Folder;->mOnExitAlarmListener:Lcom/android/launcher2/OnAlarmListener;

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Alarm;->setOnAlarmListener(Lcom/android/launcher2/OnAlarmListener;)V

    .line 733
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mOnExitAlarm:Lcom/android/launcher2/Alarm;

    const-wide/16 v1, 0x320

    invoke-virtual {v0, v1, v2}, Lcom/android/launcher2/Alarm;->setAlarm(J)V

    .line 735
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mReorderAlarm:Lcom/android/launcher2/Alarm;

    invoke-virtual {v0}, Lcom/android/launcher2/Alarm;->cancelAlarm()V

    .line 736
    return-void
.end method

.method public onDragOver(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 10
    .parameter "d"

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 670
    iget v1, p1, Lcom/android/launcher2/DropTarget$DragObject;->x:I

    iget v2, p1, Lcom/android/launcher2/DropTarget$DragObject;->y:I

    iget v3, p1, Lcom/android/launcher2/DropTarget$DragObject;->xOffset:I

    iget v4, p1, Lcom/android/launcher2/DropTarget$DragObject;->yOffset:I

    iget-object v5, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    const/4 v6, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/launcher2/Folder;->getDragViewVisualCenter(IIIILcom/android/launcher2/DragView;[F)[F

    move-result-object v7

    .line 671
    .local v7, r:[F
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    aget v1, v7, v9

    float-to-int v1, v1

    aget v2, v7, v8

    float-to-int v2, v2

    iget-object v5, p0, Lcom/android/launcher2/Folder;->mTargetCell:[I

    move v3, v8

    move v4, v8

    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher2/CellLayout;->findNearestArea(IIII[I)[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/Folder;->mTargetCell:[I

    .line 673
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mTargetCell:[I

    aget v0, v0, v9

    iget-object v1, p0, Lcom/android/launcher2/Folder;->mPreviousTargetCell:[I

    aget v1, v1, v9

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/Folder;->mTargetCell:[I

    aget v0, v0, v8

    iget-object v1, p0, Lcom/android/launcher2/Folder;->mPreviousTargetCell:[I

    aget v1, v1, v8

    if-eq v0, v1, :cond_1

    .line 674
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mReorderAlarm:Lcom/android/launcher2/Alarm;

    invoke-virtual {v0}, Lcom/android/launcher2/Alarm;->cancelAlarm()V

    .line 675
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mReorderAlarm:Lcom/android/launcher2/Alarm;

    iget-object v1, p0, Lcom/android/launcher2/Folder;->mReorderAlarmListener:Lcom/android/launcher2/OnAlarmListener;

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Alarm;->setOnAlarmListener(Lcom/android/launcher2/OnAlarmListener;)V

    .line 676
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mReorderAlarm:Lcom/android/launcher2/Alarm;

    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Lcom/android/launcher2/Alarm;->setAlarm(J)V

    .line 677
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mPreviousTargetCell:[I

    iget-object v1, p0, Lcom/android/launcher2/Folder;->mTargetCell:[I

    aget v1, v1, v9

    aput v1, v0, v9

    .line 678
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mPreviousTargetCell:[I

    iget-object v1, p0, Lcom/android/launcher2/Folder;->mTargetCell:[I

    aget v1, v1, v8

    aput v1, v0, v8

    .line 680
    :cond_1
    return-void
.end method

.method public onDrop(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 11
    .parameter "d"

    .prologue
    const/4 v10, 0x0

    const/4 v5, 0x1

    .line 1072
    const-string v0, "Launcher.Folder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDrop: DragObject = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1076
    iget-object v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v0, v0, Lcom/android/launcher2/ApplicationInfo;

    if-eqz v0, :cond_1

    .line 1078
    iget-object v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v0, Lcom/android/launcher2/ApplicationInfo;

    invoke-virtual {v0}, Lcom/android/launcher2/ApplicationInfo;->makeShortcut()Lcom/android/launcher2/ShortcutInfo;

    move-result-object v6

    .line 1079
    .local v6, item:Lcom/android/launcher2/ShortcutInfo;
    iput v5, v6, Lcom/android/launcher2/ItemInfo;->spanX:I

    .line 1080
    iput v5, v6, Lcom/android/launcher2/ItemInfo;->spanY:I

    .line 1086
    :goto_0
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mCurrentDragInfo:Lcom/android/launcher2/ShortcutInfo;

    if-ne v6, v0, :cond_0

    .line 1087
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mCurrentDragView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/launcher2/ShortcutInfo;

    .line 1088
    .local v7, si:Lcom/android/launcher2/ShortcutInfo;
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mCurrentDragView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 1089
    .local v4, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mEmptyCell:[I

    aget v0, v0, v10

    iput v0, v4, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    iput v0, v7, Lcom/android/launcher2/ItemInfo;->cellX:I

    .line 1090
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mEmptyCell:[I

    aget v0, v0, v5

    iput v0, v4, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    iput v0, v7, Lcom/android/launcher2/ItemInfo;->cellX:I

    .line 1091
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    iget-object v1, p0, Lcom/android/launcher2/Folder;->mCurrentDragView:Landroid/view/View;

    const/4 v2, -0x1

    iget-wide v8, v6, Lcom/android/launcher2/ItemInfo;->id:J

    long-to-int v3, v8

    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher2/CellLayout;->addViewToCellLayout(Landroid/view/View;IILcom/android/launcher2/CellLayout$LayoutParams;Z)Z

    .line 1092
    iget-object v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    invoke-virtual {v0}, Lcom/android/launcher2/DragView;->hasDrawn()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1093
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v0

    iget-object v1, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    iget-object v2, p0, Lcom/android/launcher2/Folder;->mCurrentDragView:Landroid/view/View;

    invoke-virtual {v0, v1, v2}, Lcom/android/launcher2/DragLayer;->animateViewIntoPosition(Lcom/android/launcher2/DragView;Landroid/view/View;)V

    .line 1098
    :goto_1
    iput-boolean v5, p0, Lcom/android/launcher2/Folder;->mItemsInvalidated:Z

    .line 1099
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getItemCount()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/launcher2/Folder;->setupContentDimensions(I)V

    .line 1100
    iput-boolean v5, p0, Lcom/android/launcher2/Folder;->mSuppressOnAdd:Z

    .line 1102
    .end local v4           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    .end local v7           #si:Lcom/android/launcher2/ShortcutInfo;
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    invoke-virtual {v0, v6}, Lcom/android/launcher2/FolderInfo;->add(Lcom/android/launcher2/ShortcutInfo;)V

    .line 1103
    return-void

    .line 1082
    .end local v6           #item:Lcom/android/launcher2/ShortcutInfo;
    :cond_1
    iget-object v6, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v6, Lcom/android/launcher2/ShortcutInfo;

    .restart local v6       #item:Lcom/android/launcher2/ShortcutInfo;
    goto :goto_0

    .line 1095
    .restart local v4       #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    .restart local v7       #si:Lcom/android/launcher2/ShortcutInfo;
    :cond_2
    iput-boolean v10, p1, Lcom/android/launcher2/DropTarget$DragObject;->deferDragViewCleanupPostAnimation:Z

    .line 1096
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mCurrentDragView:Landroid/view/View;

    invoke-virtual {v0, v10}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1
.end method

.method public onDropCompleted(Landroid/view/View;Lcom/android/launcher2/DropTarget$DragObject;ZZ)V
    .locals 5
    .parameter "target"
    .parameter "d"
    .parameter "isFlingToDelete"
    .parameter "success"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 741
    const-string v0, "Launcher.Folder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDropCompleted: View = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", DragObject = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", isFlingToDelete = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", success = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 745
    if-eqz p4, :cond_2

    .line 746
    iget-boolean v0, p0, Lcom/android/launcher2/Folder;->mDeleteFolderOnDropCompleted:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/launcher2/Folder;->mItemAddedBackToSelfViaIcon:Z

    if-nez v0, :cond_0

    .line 747
    invoke-direct {p0}, Lcom/android/launcher2/Folder;->replaceFolderWithFinalItem()V

    .line 761
    :cond_0
    :goto_0
    iput-boolean v3, p0, Lcom/android/launcher2/Folder;->mDragInProgress:Z

    .line 762
    iput-object v4, p0, Lcom/android/launcher2/Folder;->mCurrentDragInfo:Lcom/android/launcher2/ShortcutInfo;

    .line 764
    if-eq p1, p0, :cond_1

    .line 765
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mOnExitAlarm:Lcom/android/launcher2/Alarm;

    invoke-virtual {v0}, Lcom/android/launcher2/Alarm;->alarmPending()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 766
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mOnExitAlarm:Lcom/android/launcher2/Alarm;

    invoke-virtual {v0}, Lcom/android/launcher2/Alarm;->cancelAlarm()V

    .line 767
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->completeDragExit()V

    .line 770
    :cond_1
    iput-boolean v3, p0, Lcom/android/launcher2/Folder;->mDeleteFolderOnDropCompleted:Z

    .line 772
    iput-boolean v3, p0, Lcom/android/launcher2/Folder;->mItemAddedBackToSelfViaIcon:Z

    .line 774
    iput-object v4, p0, Lcom/android/launcher2/Folder;->mCurrentDragView:Landroid/view/View;

    .line 775
    iput-boolean v3, p0, Lcom/android/launcher2/Folder;->mSuppressOnAdd:Z

    .line 779
    invoke-direct {p0}, Lcom/android/launcher2/Folder;->updateItemLocationsInDatabase()V

    .line 780
    return-void

    .line 751
    :cond_2
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mFolderIcon:Lcom/android/launcher2/FolderIcon;

    invoke-virtual {v0, p2}, Lcom/android/launcher2/FolderIcon;->onDrop(Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 755
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mOnExitAlarm:Lcom/android/launcher2/Alarm;

    invoke-virtual {v0}, Lcom/android/launcher2/Alarm;->alarmPending()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 756
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/Folder;->mSuppressFolderDeletion:Z

    goto :goto_0
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "v"
    .parameter "actionId"
    .parameter "event"

    .prologue
    .line 289
    const/4 v0, 0x6

    if-ne p2, v0, :cond_0

    .line 290
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->dismissEditingName()V

    .line 291
    const/4 v0, 0x1

    .line 293
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onFinishInflate()V
    .locals 6

    .prologue
    const/4 v4, 0x0

    .line 156
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 157
    const v3, 0x7f070035

    invoke-virtual {p0, v3}, Lcom/android/launcher2/Folder;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/CellLayout;

    iput-object v3, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    .line 158
    iget-object v3, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v3, v4, v4}, Lcom/android/launcher2/CellLayout;->setGridSize(II)V

    .line 159
    iget-object v3, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v3}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->setMotionEventSplittingEnabled(Z)V

    .line 160
    const v3, 0x7f07002e

    invoke-virtual {p0, v3}, Lcom/android/launcher2/Folder;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/FolderEditText;

    iput-object v3, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    .line 161
    iget-object v3, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    invoke-virtual {v3, p0}, Lcom/android/launcher2/FolderEditText;->setFolder(Lcom/android/launcher2/Folder;)V

    .line 162
    iget-object v3, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    invoke-virtual {v3, p0}, Lcom/android/launcher2/FolderEditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 166
    const/4 v1, 0x0

    .line 167
    .local v1, measureSpec:I
    iget-object v3, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    invoke-virtual {v3, v1, v1}, Lcom/android/launcher2/FolderEditText;->measure(II)V

    .line 168
    iget-object v3, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    invoke-virtual {v3}, Lcom/android/launcher2/FolderEditText;->getMeasuredHeight()I

    move-result v3

    iput v3, p0, Lcom/android/launcher2/Folder;->mFolderNameHeight:I

    .line 171
    iget-object v3, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    iget-object v4, p0, Lcom/android/launcher2/Folder;->mActionModeCallback:Landroid/view/ActionMode$Callback;

    invoke-virtual {v3, v4}, Lcom/android/launcher2/FolderEditText;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    .line 172
    iget-object v3, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    invoke-virtual {v3, p0}, Lcom/android/launcher2/FolderEditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 173
    iget-object v3, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/android/launcher2/FolderEditText;->setSelectAllOnFocus(Z)V

    .line 174
    iget-object v3, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    iget-object v4, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    invoke-virtual {v4}, Lcom/android/launcher2/FolderEditText;->getInputType()I

    move-result v4

    const/high16 v5, 0x8

    or-int/2addr v4, v5

    or-int/lit16 v4, v4, 0x2000

    invoke-virtual {v3, v4}, Lcom/android/launcher2/FolderEditText;->setInputType(I)V

    .line 178
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 179
    .local v2, res:Landroid/content/res/Resources;
    const v3, 0x7f080007

    invoke-static {v2, v3}, Lcom/android/launcher2/Launcher;->getThemeColor(Landroid/content/res/Resources;I)I

    move-result v0

    .line 180
    .local v0, folderTextColor:I
    iget-object v3, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    invoke-virtual {v3, v0}, Lcom/android/launcher2/FolderEditText;->setTextColor(I)V

    .line 181
    return-void
.end method

.method public onFlingToDelete(Lcom/android/launcher2/DropTarget$DragObject;IILandroid/graphics/PointF;)V
    .locals 0
    .parameter "d"
    .parameter "x"
    .parameter "y"
    .parameter "vec"

    .prologue
    .line 789
    return-void
.end method

.method public onFlingToDeleteCompleted()V
    .locals 0

    .prologue
    .line 794
    return-void
.end method

.method public onFocusChange(Landroid/view/View;Z)V
    .locals 1
    .parameter "v"
    .parameter "hasFocus"

    .prologue
    .line 1210
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    if-ne p1, v0, :cond_0

    if-eqz p2, :cond_0

    .line 1211
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->startEditingFolderName()V

    .line 1213
    :cond_0
    return-void
.end method

.method public onItemsChanged()V
    .locals 0

    .prologue
    .line 1176
    invoke-direct {p0}, Lcom/android/launcher2/Folder;->updateTextViewFocus()V

    .line 1177
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 7
    .parameter "v"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 220
    iget-object v2, p0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->isDraggingEnabled()Z

    move-result v2

    if-nez v2, :cond_0

    move v2, v3

    .line 251
    :goto_0
    return v2

    .line 224
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    .line 226
    .local v1, tag:Ljava/lang/Object;
    const-string v2, "Launcher.Folder"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onLongClick: v = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", tag = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    instance-of v2, v1, Lcom/android/launcher2/ShortcutInfo;

    if-eqz v2, :cond_2

    move-object v0, v1

    .line 230
    check-cast v0, Lcom/android/launcher2/ShortcutInfo;

    .line 231
    .local v0, item:Lcom/android/launcher2/ShortcutInfo;
    invoke-virtual {p1}, Landroid/view/View;->isInTouchMode()Z

    move-result v2

    if-nez v2, :cond_1

    move v2, v4

    .line 232
    goto :goto_0

    .line 235
    :cond_1
    iget-object v2, p0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Lcom/android/launcher2/Launcher;->dismissFolderCling(Landroid/view/View;)V

    .line 237
    iget-object v2, p0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/android/launcher2/Workspace;->onDragStartedWithItem(Landroid/view/View;)V

    .line 238
    iget-object v2, p0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v2

    invoke-virtual {v2, p1, p0}, Lcom/android/launcher2/Workspace;->beginDragShared(Landroid/view/View;Lcom/android/launcher2/DragSource;)V

    move-object v2, p1

    .line 239
    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v2

    aget-object v2, v2, v3

    iput-object v2, p0, Lcom/android/launcher2/Folder;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 241
    iput-object v0, p0, Lcom/android/launcher2/Folder;->mCurrentDragInfo:Lcom/android/launcher2/ShortcutInfo;

    .line 242
    iget-object v2, p0, Lcom/android/launcher2/Folder;->mEmptyCell:[I

    iget v5, v0, Lcom/android/launcher2/ItemInfo;->cellX:I

    aput v5, v2, v4

    .line 243
    iget-object v2, p0, Lcom/android/launcher2/Folder;->mEmptyCell:[I

    iget v5, v0, Lcom/android/launcher2/ItemInfo;->cellY:I

    aput v5, v2, v3

    .line 244
    iput-object p1, p0, Lcom/android/launcher2/Folder;->mCurrentDragView:Landroid/view/View;

    .line 246
    iget-object v2, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    iget-object v5, p0, Lcom/android/launcher2/Folder;->mCurrentDragView:Landroid/view/View;

    invoke-virtual {v2, v5}, Lcom/android/launcher2/CellLayout;->removeView(Landroid/view/View;)V

    .line 247
    iget-object v2, p0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget-object v5, p0, Lcom/android/launcher2/Folder;->mCurrentDragInfo:Lcom/android/launcher2/ShortcutInfo;

    invoke-virtual {v2, v5}, Lcom/android/launcher2/FolderInfo;->remove(Lcom/android/launcher2/ShortcutInfo;)V

    .line 248
    iput-boolean v3, p0, Lcom/android/launcher2/Folder;->mDragInProgress:Z

    .line 249
    iput-boolean v4, p0, Lcom/android/launcher2/Folder;->mItemAddedBackToSelfViaIcon:Z

    .end local v0           #item:Lcom/android/launcher2/ShortcutInfo;
    :cond_2
    move v2, v3

    .line 251
    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 7
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    const/high16 v6, 0x4000

    .line 932
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getPaddingLeft()I

    move-result v4

    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getPaddingRight()I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v5}, Lcom/android/launcher2/CellLayout;->getDesiredWidth()I

    move-result v5

    add-int v3, v4, v5

    .line 933
    .local v3, width:I
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getPaddingTop()I

    move-result v4

    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getPaddingBottom()I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v5}, Lcom/android/launcher2/CellLayout;->getDesiredHeight()I

    move-result v5

    add-int/2addr v4, v5

    iget v5, p0, Lcom/android/launcher2/Folder;->mFolderNameHeight:I

    add-int v2, v4, v5

    .line 936
    .local v2, height:I
    iget-object v4, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v4}, Lcom/android/launcher2/CellLayout;->getDesiredWidth()I

    move-result v4

    invoke-static {v4, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 938
    .local v1, contentWidthSpec:I
    iget-object v4, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v4}, Lcom/android/launcher2/CellLayout;->getDesiredHeight()I

    move-result v4

    invoke-static {v4, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 940
    .local v0, contentHeightSpec:I
    iget-object v4, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v4, v1, v0}, Lcom/android/launcher2/CellLayout;->measure(II)V

    .line 942
    iget-object v4, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    iget v5, p0, Lcom/android/launcher2/Folder;->mFolderNameHeight:I

    invoke-static {v5, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    invoke-virtual {v4, v1, v5}, Lcom/android/launcher2/FolderEditText;->measure(II)V

    .line 944
    invoke-virtual {p0, v3, v2}, Lcom/android/launcher2/Folder;->setMeasuredDimension(II)V

    .line 945
    return-void
.end method

.method public onRemove(Lcom/android/launcher2/ShortcutInfo;)V
    .locals 10
    .parameter "item"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 1126
    const-string v7, "Launcher.Folder"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "onRemove item = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1129
    iput-boolean v5, p0, Lcom/android/launcher2/Folder;->mItemsInvalidated:Z

    .line 1132
    iget-object v7, p0, Lcom/android/launcher2/Folder;->mCurrentDragInfo:Lcom/android/launcher2/ShortcutInfo;

    if-ne p1, v7, :cond_1

    .line 1161
    :cond_0
    :goto_0
    return-void

    .line 1133
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/launcher2/Folder;->getViewForInfo(Lcom/android/launcher2/ShortcutInfo;)Landroid/view/View;

    move-result-object v4

    .line 1134
    .local v4, v:Landroid/view/View;
    iget-object v7, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v7, v4}, Lcom/android/launcher2/CellLayout;->removeView(Landroid/view/View;)V

    .line 1135
    iget v7, p0, Lcom/android/launcher2/Folder;->mState:I

    if-ne v7, v5, :cond_4

    .line 1136
    iput-boolean v5, p0, Lcom/android/launcher2/Folder;->mRearrangeOnClose:Z

    .line 1143
    :goto_1
    const/4 v2, 0x0

    .line 1144
    .local v2, finalItem:Lcom/android/launcher2/ShortcutInfo;
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getItemCount()I

    move-result v7

    if-ne v7, v5, :cond_2

    .line 1145
    iget-object v7, p0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget-object v7, v7, Lcom/android/launcher2/FolderInfo;->contents:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2           #finalItem:Lcom/android/launcher2/ShortcutInfo;
    check-cast v2, Lcom/android/launcher2/ShortcutInfo;

    .line 1148
    .restart local v2       #finalItem:Lcom/android/launcher2/ShortcutInfo;
    :cond_2
    const/4 v0, 0x0

    .line 1149
    .local v0, allItemsSame:Z
    if-eqz v2, :cond_3

    .line 1150
    iget-object v7, v2, Lcom/android/launcher2/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v7}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    .line 1151
    .local v1, finalComponent:Landroid/content/ComponentName;
    iget-object v7, p1, Lcom/android/launcher2/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v7}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v3

    .line 1152
    .local v3, itemComponent:Landroid/content/ComponentName;
    if-eqz v1, :cond_3

    if-eqz v3, :cond_3

    .line 1153
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-virtual {v1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    move v0, v5

    .line 1158
    .end local v1           #finalComponent:Landroid/content/ComponentName;
    .end local v3           #itemComponent:Landroid/content/ComponentName;
    :cond_3
    :goto_2
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getItemCount()I

    move-result v6

    if-gt v6, v5, :cond_0

    if-nez v0, :cond_0

    .line 1159
    invoke-direct {p0}, Lcom/android/launcher2/Folder;->replaceFolderWithFinalItem()V

    goto :goto_0

    .line 1138
    .end local v0           #allItemsSame:Z
    .end local v2           #finalItem:Lcom/android/launcher2/ShortcutInfo;
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher2/Folder;->getItemCount()I

    move-result v7

    invoke-direct {p0, v7}, Lcom/android/launcher2/Folder;->setupContentForNumItems(I)V

    goto :goto_1

    .restart local v0       #allItemsSame:Z
    .restart local v1       #finalComponent:Landroid/content/ComponentName;
    .restart local v2       #finalItem:Lcom/android/launcher2/ShortcutInfo;
    .restart local v3       #itemComponent:Landroid/content/ComponentName;
    :cond_5
    move v0, v6

    .line 1153
    goto :goto_2
.end method

.method public onTitleChanged(Ljava/lang/CharSequence;)V
    .locals 0
    .parameter "title"

    .prologue
    .line 1180
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 309
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

    .line 618
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

    .line 621
    :cond_1
    return v0
.end method

.method public setDragController(Lcom/android/launcher2/DragController;)V
    .locals 0
    .parameter "dragController"

    .prologue
    .line 313
    iput-object p1, p0, Lcom/android/launcher2/Folder;->mDragController:Lcom/android/launcher2/DragController;

    .line 314
    return-void
.end method

.method setFolderIcon(Lcom/android/launcher2/FolderIcon;)V
    .locals 0
    .parameter "icon"

    .prologue
    .line 317
    iput-object p1, p0, Lcom/android/launcher2/Folder;->mFolderIcon:Lcom/android/launcher2/FolderIcon;

    .line 318
    return-void
.end method

.method public startEditingFolderName()V
    .locals 2

    .prologue
    .line 259
    iget-object v0, p0, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/android/launcher2/FolderEditText;->setHint(Ljava/lang/CharSequence;)V

    .line 260
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/Folder;->mIsEditingName:Z

    .line 261
    return-void
.end method

.method public supportsFlingToDelete()Z
    .locals 1

    .prologue
    .line 784
    const/4 v0, 0x1

    return v0
.end method

.method public updateContentUnreadNum()V
    .locals 6

    .prologue
    .line 1222
    iget-object v5, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v5}, Lcom/android/launcher2/CellLayout;->getCountX()I

    move-result v0

    .line 1223
    .local v0, countX:I
    iget-object v5, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v5}, Lcom/android/launcher2/CellLayout;->getCountY()I

    move-result v1

    .line 1224
    .local v1, countY:I
    const/4 v3, 0x0

    .local v3, j:I
    :goto_0
    if-ge v3, v1, :cond_2

    .line 1225
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    if-ge v2, v0, :cond_1

    .line 1226
    iget-object v5, p0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v5, v2, v3}, Lcom/android/launcher2/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/android/launcher2/BubbleTextView;

    .line 1227
    .local v4, shortcut:Lcom/android/launcher2/BubbleTextView;
    if-eqz v4, :cond_0

    .line 1228
    invoke-virtual {v4}, Lcom/android/launcher2/BubbleTextView;->invalidate()V

    .line 1225
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1224
    .end local v4           #shortcut:Lcom/android/launcher2/BubbleTextView;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1232
    .end local v2           #i:I
    :cond_2
    return-void
.end method
