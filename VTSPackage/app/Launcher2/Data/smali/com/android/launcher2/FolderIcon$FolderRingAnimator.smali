.class public Lcom/android/launcher2/FolderIcon$FolderRingAnimator;
.super Ljava/lang/Object;
.source "FolderIcon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/FolderIcon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FolderRingAnimator"
.end annotation


# static fields
.field public static sPreviewPadding:I

.field public static sPreviewSize:I

.field public static sSharedInnerRingDrawable:Landroid/graphics/drawable/Drawable;

.field public static sSharedOuterRingDrawable:Landroid/graphics/drawable/Drawable;


# instance fields
.field private mAcceptAnimator:Landroid/animation/ValueAnimator;

.field private mCellLayout:Lcom/android/launcher2/CellLayout;

.field public mCellX:I

.field public mCellY:I

.field public mFolderIcon:Lcom/android/launcher2/FolderIcon;

.field public mInnerRingDrawable:Landroid/graphics/drawable/Drawable;

.field public mInnerRingSize:F

.field private mNeutralAnimator:Landroid/animation/ValueAnimator;

.field public mOuterRingDrawable:Landroid/graphics/drawable/Drawable;

.field public mOuterRingSize:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 175
    sput-object v1, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->sSharedOuterRingDrawable:Landroid/graphics/drawable/Drawable;

    .line 176
    sput-object v1, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->sSharedInnerRingDrawable:Landroid/graphics/drawable/Drawable;

    .line 177
    sput v0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->sPreviewSize:I

    .line 178
    sput v0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->sPreviewPadding:I

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher2/Launcher;Lcom/android/launcher2/FolderIcon;)V
    .locals 4
    .parameter "launcher"
    .parameter "folderIcon"

    .prologue
    const v3, 0x7f020046

    const v2, 0x7f020044

    const/4 v1, 0x0

    .line 183
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 172
    iput-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mFolderIcon:Lcom/android/launcher2/FolderIcon;

    .line 173
    iput-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mOuterRingDrawable:Landroid/graphics/drawable/Drawable;

    .line 174
    iput-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mInnerRingDrawable:Landroid/graphics/drawable/Drawable;

    .line 184
    iput-object p2, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mFolderIcon:Lcom/android/launcher2/FolderIcon;

    .line 185
    invoke-virtual {p1}, Lcom/android/launcher2/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 186
    .local v0, res:Landroid/content/res/Resources;
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mOuterRingDrawable:Landroid/graphics/drawable/Drawable;

    .line 187
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mInnerRingDrawable:Landroid/graphics/drawable/Drawable;

    .line 191
    invoke-static {}, Lcom/android/launcher2/FolderIcon;->access$000()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 192
    const v1, 0x7f0b003c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    sput v1, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->sPreviewSize:I

    .line 193
    const v1, 0x7f0b003d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    sput v1, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->sPreviewPadding:I

    .line 194
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    sput-object v1, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->sSharedOuterRingDrawable:Landroid/graphics/drawable/Drawable;

    .line 195
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    sput-object v1, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->sSharedInnerRingDrawable:Landroid/graphics/drawable/Drawable;

    .line 196
    const v1, 0x7f020047

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    sput-object v1, Lcom/android/launcher2/FolderIcon;->sSharedFolderLeaveBehind:Landroid/graphics/drawable/Drawable;

    .line 197
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/android/launcher2/FolderIcon;->access$002(Z)Z

    .line 199
    :cond_0
    return-void
.end method

.method static synthetic access$100(Lcom/android/launcher2/FolderIcon$FolderRingAnimator;)Lcom/android/launcher2/CellLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 166
    iget-object v0, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mCellLayout:Lcom/android/launcher2/CellLayout;

    return-object v0
.end method


# virtual methods
.method public animateToAcceptState()V
    .locals 4

    .prologue
    .line 202
    iget-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mNeutralAnimator:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_0

    .line 203
    iget-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mNeutralAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 205
    :cond_0
    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Lcom/android/launcher2/LauncherAnimUtils;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mAcceptAnimator:Landroid/animation/ValueAnimator;

    .line 206
    iget-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mAcceptAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0x64

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 208
    sget v0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->sPreviewSize:I

    .line 209
    .local v0, previewSize:I
    iget-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mAcceptAnimator:Landroid/animation/ValueAnimator;

    new-instance v2, Lcom/android/launcher2/FolderIcon$FolderRingAnimator$1;

    invoke-direct {v2, p0, v0}, Lcom/android/launcher2/FolderIcon$FolderRingAnimator$1;-><init>(Lcom/android/launcher2/FolderIcon$FolderRingAnimator;I)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 219
    iget-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mAcceptAnimator:Landroid/animation/ValueAnimator;

    new-instance v2, Lcom/android/launcher2/FolderIcon$FolderRingAnimator$2;

    invoke-direct {v2, p0}, Lcom/android/launcher2/FolderIcon$FolderRingAnimator$2;-><init>(Lcom/android/launcher2/FolderIcon$FolderRingAnimator;)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 227
    iget-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mAcceptAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    .line 228
    return-void

    .line 205
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method

.method public animateToNaturalState()V
    .locals 4

    .prologue
    .line 231
    iget-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mAcceptAnimator:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_0

    .line 232
    iget-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mAcceptAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 234
    :cond_0
    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Lcom/android/launcher2/LauncherAnimUtils;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mNeutralAnimator:Landroid/animation/ValueAnimator;

    .line 235
    iget-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mNeutralAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0x64

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 237
    sget v0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->sPreviewSize:I

    .line 238
    .local v0, previewSize:I
    iget-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mNeutralAnimator:Landroid/animation/ValueAnimator;

    new-instance v2, Lcom/android/launcher2/FolderIcon$FolderRingAnimator$3;

    invoke-direct {v2, p0, v0}, Lcom/android/launcher2/FolderIcon$FolderRingAnimator$3;-><init>(Lcom/android/launcher2/FolderIcon$FolderRingAnimator;I)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 248
    iget-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mNeutralAnimator:Landroid/animation/ValueAnimator;

    new-instance v2, Lcom/android/launcher2/FolderIcon$FolderRingAnimator$4;

    invoke-direct {v2, p0}, Lcom/android/launcher2/FolderIcon$FolderRingAnimator$4;-><init>(Lcom/android/launcher2/FolderIcon$FolderRingAnimator;)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 256
    iget-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mNeutralAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    .line 259
    iget-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mCellLayout:Lcom/android/launcher2/CellLayout;

    if-eqz v1, :cond_1

    .line 260
    iget-object v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mCellLayout:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v1, p0}, Lcom/android/launcher2/CellLayout;->hideFolderAccept(Lcom/android/launcher2/FolderIcon$FolderRingAnimator;)V

    .line 262
    :cond_1
    return-void

    .line 234
    nop

    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method

.method public getCell([I)V
    .locals 2
    .parameter "loc"

    .prologue
    .line 266
    const/4 v0, 0x0

    iget v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mCellX:I

    aput v1, p1, v0

    .line 267
    const/4 v0, 0x1

    iget v1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mCellY:I

    aput v1, p1, v0

    .line 268
    return-void
.end method

.method public getInnerRingSize()F
    .locals 1

    .prologue
    .line 285
    iget v0, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mInnerRingSize:F

    return v0
.end method

.method public getOuterRingSize()F
    .locals 1

    .prologue
    .line 281
    iget v0, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mOuterRingSize:F

    return v0
.end method

.method public setCell(II)V
    .locals 0
    .parameter "x"
    .parameter "y"

    .prologue
    .line 272
    iput p1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mCellX:I

    .line 273
    iput p2, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mCellY:I

    .line 274
    return-void
.end method

.method public setCellLayout(Lcom/android/launcher2/CellLayout;)V
    .locals 0
    .parameter "layout"

    .prologue
    .line 277
    iput-object p1, p0, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mCellLayout:Lcom/android/launcher2/CellLayout;

    .line 278
    return-void
.end method
