.class public Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
.super Ljava/lang/Object;
.source "ImportContactsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/ImportContactsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SIMSlotStatus"
.end annotation


# instance fields
.field public mCopyFinished:Z

.field public mIsCopying:Z

.field public mIsSelected:Z

.field public mIsSrcSimUSIM:Z

.field public mQuerySimDone:Z

.field public mSuccessCount:I

.field public mTotalCount:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 179
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 181
    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mCopyFinished:Z

    .line 182
    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsCopying:Z

    .line 183
    iput v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mSuccessCount:I

    .line 184
    iput v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mTotalCount:I

    .line 185
    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    .line 186
    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mQuerySimDone:Z

    .line 187
    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSrcSimUSIM:Z

    .line 188
    return-void
.end method
