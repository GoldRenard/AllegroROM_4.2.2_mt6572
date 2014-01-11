.class Lcom/android/browser/AddBookmarkFolderForOP01Menu$2;
.super Landroid/text/InputFilter$LengthFilter;
.source "AddBookmarkFolderForOP01Menu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/AddBookmarkFolderForOP01Menu;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/AddBookmarkFolderForOP01Menu;

.field final synthetic val$nLimit:I


# direct methods
.method constructor <init>(Lcom/android/browser/AddBookmarkFolderForOP01Menu;II)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter

    .prologue
    .line 640
    iput-object p1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$2;->this$0:Lcom/android/browser/AddBookmarkFolderForOP01Menu;

    iput p3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$2;->val$nLimit:I

    invoke-direct {p0, p2}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    return-void
.end method


# virtual methods
.method public filter(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 4
    .parameter "source"
    .parameter "start"
    .parameter "end"
    .parameter "dest"
    .parameter "dstart"
    .parameter "dend"

    .prologue
    .line 644
    iget v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$2;->val$nLimit:I

    invoke-interface {p4}, Landroid/text/Spanned;->length()I

    move-result v2

    sub-int v3, p6, p5

    sub-int/2addr v2, v3

    sub-int v0, v1, v2

    .line 645
    .local v0, keep:I
    if-gtz v0, :cond_0

    .line 646
    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$2;->this$0:Lcom/android/browser/AddBookmarkFolderForOP01Menu;

    #calls: Lcom/android/browser/AddBookmarkFolderForOP01Menu;->showWarningDialog()V
    invoke-static {v1}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->access$500(Lcom/android/browser/AddBookmarkFolderForOP01Menu;)V

    .line 647
    const-string v1, ""

    .line 654
    :goto_0
    return-object v1

    .line 648
    :cond_0
    sub-int v1, p3, p2

    if-lt v0, v1, :cond_1

    .line 649
    const/4 v1, 0x0

    goto :goto_0

    .line 651
    :cond_1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 652
    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$2;->this$0:Lcom/android/browser/AddBookmarkFolderForOP01Menu;

    #calls: Lcom/android/browser/AddBookmarkFolderForOP01Menu;->showWarningDialog()V
    invoke-static {v1}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->access$500(Lcom/android/browser/AddBookmarkFolderForOP01Menu;)V

    .line 654
    :cond_2
    add-int v1, p2, v0

    invoke-interface {p1, p2, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v1

    goto :goto_0
.end method
