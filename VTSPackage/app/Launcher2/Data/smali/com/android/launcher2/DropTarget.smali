.class public interface abstract Lcom/android/launcher2/DropTarget;
.super Ljava/lang/Object;
.source "DropTarget.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/DropTarget$DragEnforcer;,
        Lcom/android/launcher2/DropTarget$DragObject;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "DropTarget"


# virtual methods
.method public abstract acceptDrop(Lcom/android/launcher2/DropTarget$DragObject;)Z
.end method

.method public abstract getDropTargetDelegate(Lcom/android/launcher2/DropTarget$DragObject;)Lcom/android/launcher2/DropTarget;
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

.method public abstract onDragEnter(Lcom/android/launcher2/DropTarget$DragObject;)V
.end method

.method public abstract onDragExit(Lcom/android/launcher2/DropTarget$DragObject;)V
.end method

.method public abstract onDragOver(Lcom/android/launcher2/DropTarget$DragObject;)V
.end method

.method public abstract onDrop(Lcom/android/launcher2/DropTarget$DragObject;)V
.end method

.method public abstract onFlingToDelete(Lcom/android/launcher2/DropTarget$DragObject;IILandroid/graphics/PointF;)V
.end method
