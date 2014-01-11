.class public Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;
.super Ljava/lang/Object;
.source "DropTarget.java"

# interfaces
.implements Lcom/cyanogenmod/trebuchet/DragController$DragListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/DropTarget;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DragEnforcer"
.end annotation


# instance fields
.field dragParity:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    const/4 v1, 0x0

    iput v1, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;->dragParity:I

    move-object v0, p1

    .line 73
    check-cast v0, Lcom/cyanogenmod/trebuchet/Launcher;

    .line 74
    .local v0, launcher:Lcom/cyanogenmod/trebuchet/Launcher;
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragController()Lcom/cyanogenmod/trebuchet/DragController;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/cyanogenmod/trebuchet/DragController;->addDragListener(Lcom/cyanogenmod/trebuchet/DragController$DragListener;)V

    .line 75
    return-void
.end method


# virtual methods
.method public onDragEnd()V
    .locals 3

    .prologue
    .line 100
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;->dragParity:I

    if-eqz v0, :cond_0

    .line 101
    const-string v0, "Trebuchet.DropTarget"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDragExit: Drag contract violated: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;->dragParity:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    :cond_0
    return-void
.end method

.method onDragEnter()V
    .locals 3

    .prologue
    .line 78
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;->dragParity:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;->dragParity:I

    .line 79
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;->dragParity:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 80
    const-string v0, "Trebuchet.DropTarget"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDragEnter: Drag contract violated: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;->dragParity:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    :cond_0
    return-void
.end method

.method onDragExit()V
    .locals 3

    .prologue
    .line 85
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;->dragParity:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;->dragParity:I

    .line 86
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;->dragParity:I

    if-eqz v0, :cond_0

    .line 87
    const-string v0, "Trebuchet.DropTarget"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDragExit: Drag contract violated: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;->dragParity:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    :cond_0
    return-void
.end method

.method public onDragStart(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;I)V
    .locals 3
    .parameter "source"
    .parameter "info"
    .parameter "dragAction"

    .prologue
    .line 93
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;->dragParity:I

    if-eqz v0, :cond_0

    .line 94
    const-string v0, "Trebuchet.DropTarget"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDragEnter: Drag contract violated: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;->dragParity:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    :cond_0
    return-void
.end method
