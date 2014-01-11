.class Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;
.super Ljava/lang/Object;
.source "AddBookmarkFolderForOP01Menu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/AddBookmarkFolderForOP01Menu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "EditBookmarkInfo"
.end annotation


# instance fields
.field mAccountName:Ljava/lang/String;

.field mAccountType:Ljava/lang/String;

.field mEBITitle:Ljava/lang/String;

.field mId:J

.field mLastUsedAccountName:Ljava/lang/String;

.field mLastUsedAccountType:Ljava/lang/String;

.field mLastUsedId:J

.field mLastUsedTitle:Ljava/lang/String;

.field mParentId:J

.field mParentTitle:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    const-wide/16 v0, -0x1

    .line 902
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 903
    iput-wide v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mId:J

    .line 905
    iput-wide v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mParentId:J

    .line 915
    iput-wide v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mLastUsedId:J

    return-void
.end method
