.class Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
.super Ljava/lang/Object;
.source "CellLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/CellLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CellAndSpan"
.end annotation


# instance fields
.field spanX:I

.field spanY:I

.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

.field x:I

.field y:I


# direct methods
.method public constructor <init>(Lcom/cyanogenmod/trebuchet/CellLayout;)V
    .locals 0
    .parameter

    .prologue
    .line 2712
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2713
    return-void
.end method

.method public constructor <init>(Lcom/cyanogenmod/trebuchet/CellLayout;IIII)V
    .locals 0
    .parameter
    .parameter "x"
    .parameter "y"
    .parameter "spanX"
    .parameter "spanY"

    .prologue
    .line 2722
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2723
    iput p2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    .line 2724
    iput p3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    .line 2725
    iput p4, p0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    .line 2726
    iput p5, p0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    .line 2727
    return-void
.end method


# virtual methods
.method public copy(Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;)V
    .locals 1
    .parameter "copy"

    .prologue
    .line 2716
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iput v0, p1, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    .line 2717
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iput v0, p1, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    .line 2718
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    iput v0, p1, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    .line 2719
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    iput v0, p1, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    .line 2720
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 2730
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
