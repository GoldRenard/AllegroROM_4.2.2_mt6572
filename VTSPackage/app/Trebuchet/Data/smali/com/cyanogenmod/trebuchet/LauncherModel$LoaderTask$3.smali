.class Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$3;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->sortWorkspaceItemsSpatially(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/cyanogenmod/trebuchet/ItemInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;)V
    .locals 0
    .parameter

    .prologue
    .line 1636
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$3;->this$1:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/ItemInfo;)I
    .locals 12
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 1639
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountX()I

    move-result v0

    .line 1640
    .local v0, cellCountX:I
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountY()I

    move-result v1

    .line 1641
    .local v1, cellCountY:I
    mul-int v7, v0, v1

    .line 1642
    .local v7, screenOffset:I
    mul-int/lit8 v2, v7, 0xb

    .line 1643
    .local v2, containerOffset:I
    iget-wide v8, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    int-to-long v10, v2

    mul-long/2addr v8, v10

    iget v10, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    mul-int/2addr v10, v7

    int-to-long v10, v10

    add-long/2addr v8, v10

    iget v10, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    mul-int/2addr v10, v0

    int-to-long v10, v10

    add-long/2addr v8, v10

    iget v10, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    int-to-long v10, v10

    add-long v3, v8, v10

    .line 1645
    .local v3, lr:J
    iget-wide v8, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    int-to-long v10, v2

    mul-long/2addr v8, v10

    iget v10, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    mul-int/2addr v10, v7

    int-to-long v10, v10

    add-long/2addr v8, v10

    iget v10, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    mul-int/2addr v10, v0

    int-to-long v10, v10

    add-long/2addr v8, v10

    iget v10, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    int-to-long v10, v10

    add-long v5, v8, v10

    .line 1647
    .local v5, rr:J
    sub-long v8, v3, v5

    long-to-int v8, v8

    return v8
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1636
    check-cast p1, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .end local p1
    check-cast p2, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$3;->compare(Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/ItemInfo;)I

    move-result v0

    return v0
.end method
