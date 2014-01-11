.class public interface abstract Lcom/cyanogenmod/trebuchet/DropTarget;
.super Ljava/lang/Object;
.source "DropTarget.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;,
        Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "Trebuchet.DropTarget"


# virtual methods
.method public abstract acceptDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)Z
.end method

.method public abstract getDropTargetDelegate(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)Lcom/cyanogenmod/trebuchet/DropTarget;
.end method

.method public abstract getHitRect(Landroid/graphics/Rect;)V
.end method

.method public abstract getLeft()I
.end method

.method public abstract getLocationInDragLayer([I)V
.end method

.method public abstract getTop()I
.end method

.method public abstract isDropEnabled()Z
.end method

.method public abstract onDragEnter(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
.end method

.method public abstract onDragExit(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
.end method

.method public abstract onDragOver(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
.end method

.method public abstract onDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
.end method

.method public abstract onFlingToDelete(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;IILandroid/graphics/PointF;)V
.end method
