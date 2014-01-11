.class Lcom/cyanogenmod/trebuchet/Folder$GridComparator;
.super Ljava/lang/Object;
.source "Folder.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/Folder;
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
        "Lcom/cyanogenmod/trebuchet/ShortcutInfo;",
        ">;"
    }
.end annotation


# instance fields
.field mNumCols:I

.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Folder;


# direct methods
.method public constructor <init>(Lcom/cyanogenmod/trebuchet/Folder;I)V
    .locals 0
    .parameter
    .parameter "numCols"

    .prologue
    .line 334
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Folder$GridComparator;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 335
    iput p2, p0, Lcom/cyanogenmod/trebuchet/Folder$GridComparator;->mNumCols:I

    .line 336
    return-void
.end method


# virtual methods
.method public compare(Lcom/cyanogenmod/trebuchet/ShortcutInfo;Lcom/cyanogenmod/trebuchet/ShortcutInfo;)I
    .locals 4
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 340
    iget v2, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/Folder$GridComparator;->mNumCols:I

    mul-int/2addr v2, v3

    iget v3, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    add-int v0, v2, v3

    .line 341
    .local v0, lhIndex:I
    iget v2, p2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/Folder$GridComparator;->mNumCols:I

    mul-int/2addr v2, v3

    iget v3, p2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    add-int v1, v2, v3

    .line 342
    .local v1, rhIndex:I
    sub-int v2, v0, v1

    return v2
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 332
    check-cast p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .end local p1
    check-cast p2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/Folder$GridComparator;->compare(Lcom/cyanogenmod/trebuchet/ShortcutInfo;Lcom/cyanogenmod/trebuchet/ShortcutInfo;)I

    move-result v0

    return v0
.end method
