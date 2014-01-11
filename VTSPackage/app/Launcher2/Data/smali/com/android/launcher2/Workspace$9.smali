.class Lcom/android/launcher2/Workspace$9;
.super Ljava/lang/Object;
.source "Workspace.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Workspace;->onDropExternal([ILjava/lang/Object;Lcom/android/launcher2/CellLayout;ZLcom/android/launcher2/DropTarget$DragObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Workspace;

.field final synthetic val$container:J

.field final synthetic val$item:Lcom/android/launcher2/ItemInfo;

.field final synthetic val$pendingInfo:Lcom/android/launcher2/PendingAddItemInfo;

.field final synthetic val$screen:I


# direct methods
.method constructor <init>(Lcom/android/launcher2/Workspace;Lcom/android/launcher2/PendingAddItemInfo;Lcom/android/launcher2/ItemInfo;JI)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 3280
    iput-object p1, p0, Lcom/android/launcher2/Workspace$9;->this$0:Lcom/android/launcher2/Workspace;

    iput-object p2, p0, Lcom/android/launcher2/Workspace$9;->val$pendingInfo:Lcom/android/launcher2/PendingAddItemInfo;

    iput-object p3, p0, Lcom/android/launcher2/Workspace$9;->val$item:Lcom/android/launcher2/ItemInfo;

    iput-wide p4, p0, Lcom/android/launcher2/Workspace$9;->val$container:J

    iput p6, p0, Lcom/android/launcher2/Workspace$9;->val$screen:I

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    const/4 v7, 0x0

    .line 3285
    iget-object v0, p0, Lcom/android/launcher2/Workspace$9;->val$pendingInfo:Lcom/android/launcher2/PendingAddItemInfo;

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->itemType:I

    packed-switch v0, :pswitch_data_0

    .line 3298
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown item type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/Workspace$9;->val$pendingInfo:Lcom/android/launcher2/PendingAddItemInfo;

    iget v2, v2, Lcom/android/launcher2/ItemInfo;->itemType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3287
    :pswitch_1
    const/4 v0, 0x2

    new-array v6, v0, [I

    .line 3288
    .local v6, span:[I
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/android/launcher2/Workspace$9;->val$item:Lcom/android/launcher2/ItemInfo;

    iget v1, v1, Lcom/android/launcher2/ItemInfo;->spanX:I

    aput v1, v6, v0

    .line 3289
    const/4 v0, 0x1

    iget-object v1, p0, Lcom/android/launcher2/Workspace$9;->val$item:Lcom/android/launcher2/ItemInfo;

    iget v1, v1, Lcom/android/launcher2/ItemInfo;->spanY:I

    aput v1, v6, v0

    .line 3290
    iget-object v0, p0, Lcom/android/launcher2/Workspace$9;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;
    invoke-static {v0}, Lcom/android/launcher2/Workspace;->access$000(Lcom/android/launcher2/Workspace;)Lcom/android/launcher2/Launcher;

    move-result-object v0

    iget-object v1, p0, Lcom/android/launcher2/Workspace$9;->val$pendingInfo:Lcom/android/launcher2/PendingAddItemInfo;

    check-cast v1, Lcom/android/launcher2/PendingAddWidgetInfo;

    iget-wide v2, p0, Lcom/android/launcher2/Workspace$9;->val$container:J

    iget v4, p0, Lcom/android/launcher2/Workspace$9;->val$screen:I

    iget-object v5, p0, Lcom/android/launcher2/Workspace$9;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mTargetCell:[I
    invoke-static {v5}, Lcom/android/launcher2/Workspace;->access$800(Lcom/android/launcher2/Workspace;)[I

    move-result-object v5

    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher2/Launcher;->addAppWidgetFromDrop(Lcom/android/launcher2/PendingAddWidgetInfo;JI[I[I[I)V

    .line 3301
    .end local v6           #span:[I
    :goto_0
    return-void

    .line 3294
    :pswitch_2
    iget-object v0, p0, Lcom/android/launcher2/Workspace$9;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;
    invoke-static {v0}, Lcom/android/launcher2/Workspace;->access$000(Lcom/android/launcher2/Workspace;)Lcom/android/launcher2/Launcher;

    move-result-object v8

    iget-object v0, p0, Lcom/android/launcher2/Workspace$9;->val$pendingInfo:Lcom/android/launcher2/PendingAddItemInfo;

    iget-object v9, v0, Lcom/android/launcher2/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    iget-wide v10, p0, Lcom/android/launcher2/Workspace$9;->val$container:J

    iget v12, p0, Lcom/android/launcher2/Workspace$9;->val$screen:I

    iget-object v0, p0, Lcom/android/launcher2/Workspace$9;->this$0:Lcom/android/launcher2/Workspace;

    #getter for: Lcom/android/launcher2/Workspace;->mTargetCell:[I
    invoke-static {v0}, Lcom/android/launcher2/Workspace;->access$800(Lcom/android/launcher2/Workspace;)[I

    move-result-object v13

    move-object v14, v7

    invoke-virtual/range {v8 .. v14}, Lcom/android/launcher2/Launcher;->processShortcutFromDrop(Landroid/content/ComponentName;JI[I[I)V

    goto :goto_0

    .line 3285
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
