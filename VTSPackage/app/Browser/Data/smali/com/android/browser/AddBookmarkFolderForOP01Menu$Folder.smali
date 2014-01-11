.class Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;
.super Ljava/lang/Object;
.source "AddBookmarkFolderForOP01Menu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/AddBookmarkFolderForOP01Menu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Folder"
.end annotation


# instance fields
.field mId:J

.field mName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;J)V
    .locals 0
    .parameter "name"
    .parameter "id"

    .prologue
    .line 160
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 161
    iput-object p1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;->mName:Ljava/lang/String;

    .line 162
    iput-wide p2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;->mId:J

    .line 163
    return-void
.end method
