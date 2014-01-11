.class Lcom/cyanogenmod/trebuchet/Workspace$9;
.super Ljava/lang/Object;
.source "Workspace.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Workspace;->onDropExternal([ILjava/lang/Object;Lcom/cyanogenmod/trebuchet/CellLayout;ZLcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Workspace;

.field final synthetic val$container:J

.field final synthetic val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

.field final synthetic val$pendingInfo:Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;

.field final synthetic val$screen:I


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Workspace;Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;Lcom/cyanogenmod/trebuchet/ItemInfo;JI)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 3756
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->val$pendingInfo:Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iput-wide p4, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->val$container:J

    iput p6, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->val$screen:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    const/4 v7, 0x0

    .line 3761
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->val$pendingInfo:Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->itemType:I

    packed-switch v0, :pswitch_data_0

    .line 3774
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown item type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->val$pendingInfo:Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;

    iget v2, v2, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->itemType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3763
    :pswitch_1
    const/4 v0, 0x2

    new-array v6, v0, [I

    .line 3764
    .local v6, span:[I
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v1, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    aput v1, v6, v0

    .line 3765
    const/4 v0, 0x1

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v1, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    aput v1, v6, v0

    .line 3766
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Workspace;->access$000(Lcom/cyanogenmod/trebuchet/Workspace;)Lcom/cyanogenmod/trebuchet/Launcher;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->val$pendingInfo:Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;

    check-cast v1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    iget-wide v2, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->val$container:J

    iget v4, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->val$screen:I

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I
    invoke-static {v5}, Lcom/cyanogenmod/trebuchet/Workspace;->access$800(Lcom/cyanogenmod/trebuchet/Workspace;)[I

    move-result-object v5

    invoke-virtual/range {v0 .. v7}, Lcom/cyanogenmod/trebuchet/Launcher;->addAppWidgetFromDrop(Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;JI[I[I[I)V

    .line 3777
    .end local v6           #span:[I
    :goto_0
    return-void

    .line 3770
    :pswitch_2
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Workspace;->access$000(Lcom/cyanogenmod/trebuchet/Workspace;)Lcom/cyanogenmod/trebuchet/Launcher;

    move-result-object v8

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->val$pendingInfo:Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;

    iget-object v9, v0, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    iget-wide v10, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->val$container:J

    iget v12, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->val$screen:I

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$9;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Workspace;->access$800(Lcom/cyanogenmod/trebuchet/Workspace;)[I

    move-result-object v13

    move-object v14, v7

    invoke-virtual/range {v8 .. v14}, Lcom/cyanogenmod/trebuchet/Launcher;->processShortcutFromDrop(Landroid/content/ComponentName;JI[I[I)V

    goto :goto_0

    .line 3761
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
