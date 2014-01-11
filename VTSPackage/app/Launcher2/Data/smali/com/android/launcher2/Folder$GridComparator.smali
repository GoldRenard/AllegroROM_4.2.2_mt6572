.class Lcom/android/launcher2/Folder$GridComparator;
.super Ljava/lang/Object;
.source "Folder.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/Folder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GridComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/android/launcher2/ShortcutInfo;",
        ">;"
    }
.end annotation


# instance fields
.field mNumCols:I

.field final synthetic this$0:Lcom/android/launcher2/Folder;


# direct methods
.method public constructor <init>(Lcom/android/launcher2/Folder;I)V
    .locals 0
    .parameter
    .parameter "numCols"

    .prologue
    .line 335
    iput-object p1, p0, Lcom/android/launcher2/Folder$GridComparator;->this$0:Lcom/android/launcher2/Folder;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 336
    iput p2, p0, Lcom/android/launcher2/Folder$GridComparator;->mNumCols:I

    .line 337
    return-void
.end method


# virtual methods
.method public compare(Lcom/android/launcher2/ShortcutInfo;Lcom/android/launcher2/ShortcutInfo;)I
    .locals 4
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 341
    iget v2, p1, Lcom/android/launcher2/ItemInfo;->cellY:I

    iget v3, p0, Lcom/android/launcher2/Folder$GridComparator;->mNumCols:I

    mul-int/2addr v2, v3

    iget v3, p1, Lcom/android/launcher2/ItemInfo;->cellX:I

    add-int v0, v2, v3

    .line 342
    .local v0, lhIndex:I
    iget v2, p2, Lcom/android/launcher2/ItemInfo;->cellY:I

    iget v3, p0, Lcom/android/launcher2/Folder$GridComparator;->mNumCols:I

    mul-int/2addr v2, v3

    iget v3, p2, Lcom/android/launcher2/ItemInfo;->cellX:I

    add-int v1, v2, v3

    .line 343
    .local v1, rhIndex:I
    sub-int v2, v0, v1

    return v2
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 333
    check-cast p1, Lcom/android/launcher2/ShortcutInfo;

    .end local p1
    check-cast p2, Lcom/android/launcher2/ShortcutInfo;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher2/Folder$GridComparator;->compare(Lcom/android/launcher2/ShortcutInfo;Lcom/android/launcher2/ShortcutInfo;)I

    move-result v0

    return v0
.end method
