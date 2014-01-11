.class Lcom/android/browser/AddBookmarkPage$EditBookmarkInfo;
.super Ljava/lang/Object;
.source "AddBookmarkPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/AddBookmarkPage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "EditBookmarkInfo"
.end annotation


# instance fields
.field accountName:Ljava/lang/String;

.field accountType:Ljava/lang/String;

.field id:J

.field lastUsedAccountName:Ljava/lang/String;

.field lastUsedAccountType:Ljava/lang/String;

.field lastUsedId:J

.field lastUsedTitle:Ljava/lang/String;

.field parentId:J

.field parentTitle:Ljava/lang/String;

.field title:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    const-wide/16 v0, -0x1

    .line 1501
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 1502
    iput-wide v0, p0, Lcom/android/browser/AddBookmarkPage$EditBookmarkInfo;->id:J

    .line 1503
    iput-wide v0, p0, Lcom/android/browser/AddBookmarkPage$EditBookmarkInfo;->parentId:J

    .line 1509
    iput-wide v0, p0, Lcom/android/browser/AddBookmarkPage$EditBookmarkInfo;->lastUsedId:J

    return-void
.end method
