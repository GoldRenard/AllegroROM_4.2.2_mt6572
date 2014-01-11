.class Lcom/cyanogenmod/trebuchet/Launcher$25;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->runNewAppsAnimation(Z)V
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
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;)V
    .locals 0
    .parameter

    .prologue
    .line 3798
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$25;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Landroid/view/View;Landroid/view/View;)I
    .locals 6
    .parameter "a"
    .parameter "b"

    .prologue
    .line 3801
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 3802
    .local v0, alp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 3803
    .local v1, blp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountX()I

    move-result v2

    .line 3804
    .local v2, cellCountX:I
    iget v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    mul-int/2addr v3, v2

    iget v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    add-int/2addr v3, v4

    iget v4, v1, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    mul-int/2addr v4, v2

    iget v5, v1, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    add-int/2addr v4, v5

    sub-int/2addr v3, v4

    return v3
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 3798
    check-cast p1, Landroid/view/View;

    .end local p1
    check-cast p2, Landroid/view/View;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/Launcher$25;->compare(Landroid/view/View;Landroid/view/View;)I

    move-result v0

    return v0
.end method
