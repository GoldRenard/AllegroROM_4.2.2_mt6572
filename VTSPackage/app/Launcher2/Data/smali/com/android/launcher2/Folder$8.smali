.class Lcom/android/launcher2/Folder$8;
.super Ljava/lang/Object;
.source "Folder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Folder;->replaceFolderWithFinalItem()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Folder;


# direct methods
.method constructor <init>(Lcom/android/launcher2/Folder;)V
    .locals 0
    .parameter

    .prologue
    .line 1010
    iput-object p1, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .prologue
    const/4 v7, 0x1

    .line 1013
    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    iget-object v2, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v2, v2, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget-wide v4, v2, Lcom/android/launcher2/ItemInfo;->container:J

    iget-object v2, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v2, v2, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget v2, v2, Lcom/android/launcher2/ItemInfo;->screen:I

    invoke-virtual {v0, v4, v5, v2}, Lcom/android/launcher2/Launcher;->getCellLayout(JI)Lcom/android/launcher2/CellLayout;

    move-result-object v11

    .line 1015
    .local v11, cellLayout:Lcom/android/launcher2/CellLayout;
    const/4 v3, 0x0

    .line 1017
    .local v3, child:Landroid/view/View;
    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    invoke-virtual {v0}, Lcom/android/launcher2/Folder;->getItemCount()I

    move-result v0

    if-ne v0, v7, :cond_0

    .line 1018
    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget-object v0, v0, Lcom/android/launcher2/FolderInfo;->contents:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/ShortcutInfo;

    .line 1019
    .local v1, finalItem:Lcom/android/launcher2/ShortcutInfo;
    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    const v2, 0x7f040002

    invoke-virtual {v0, v2, v11, v1}, Lcom/android/launcher2/Launcher;->createShortcut(ILandroid/view/ViewGroup;Lcom/android/launcher2/ShortcutInfo;)Landroid/view/View;

    move-result-object v12

    .line 1021
    .end local v3           #child:Landroid/view/View;
    .local v12, child:Landroid/view/View;
    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    iget-object v2, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v2, v2, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget-wide v2, v2, Lcom/android/launcher2/ItemInfo;->container:J

    iget-object v4, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v4, v4, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget v4, v4, Lcom/android/launcher2/ItemInfo;->screen:I

    iget-object v5, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v5, v5, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget v5, v5, Lcom/android/launcher2/ItemInfo;->cellX:I

    iget-object v6, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v6, v6, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget v6, v6, Lcom/android/launcher2/ItemInfo;->cellY:I

    invoke-static/range {v0 .. v6}, Lcom/android/launcher2/LauncherModel;->addOrMoveItemInDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;JIII)V

    move-object v3, v12

    .line 1024
    .end local v1           #finalItem:Lcom/android/launcher2/ShortcutInfo;
    .end local v12           #child:Landroid/view/View;
    .restart local v3       #child:Landroid/view/View;
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    invoke-virtual {v0}, Lcom/android/launcher2/Folder;->getItemCount()I

    move-result v0

    if-gt v0, v7, :cond_2

    .line 1026
    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    iget-object v2, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v2, v2, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    invoke-static {v0, v2}, Lcom/android/launcher2/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;)V

    .line 1027
    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    #getter for: Lcom/android/launcher2/Folder;->mFolderIcon:Lcom/android/launcher2/FolderIcon;
    invoke-static {v0}, Lcom/android/launcher2/Folder;->access$700(Lcom/android/launcher2/Folder;)Lcom/android/launcher2/FolderIcon;

    move-result-object v0

    invoke-virtual {v11, v0}, Lcom/android/launcher2/CellLayout;->removeView(Landroid/view/View;)V

    .line 1028
    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    #getter for: Lcom/android/launcher2/Folder;->mFolderIcon:Lcom/android/launcher2/FolderIcon;
    invoke-static {v0}, Lcom/android/launcher2/Folder;->access$700(Lcom/android/launcher2/Folder;)Lcom/android/launcher2/FolderIcon;

    move-result-object v0

    instance-of v0, v0, Lcom/android/launcher2/DropTarget;

    if-eqz v0, :cond_1

    .line 1029
    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v2, v0, Lcom/android/launcher2/Folder;->mDragController:Lcom/android/launcher2/DragController;

    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    #getter for: Lcom/android/launcher2/Folder;->mFolderIcon:Lcom/android/launcher2/FolderIcon;
    invoke-static {v0}, Lcom/android/launcher2/Folder;->access$700(Lcom/android/launcher2/Folder;)Lcom/android/launcher2/FolderIcon;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/DropTarget;

    invoke-virtual {v2, v0}, Lcom/android/launcher2/DragController;->removeDropTarget(Lcom/android/launcher2/DropTarget;)V

    .line 1031
    :cond_1
    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    iget-object v2, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v2, v2, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    invoke-virtual {v0, v2}, Lcom/android/launcher2/Launcher;->removeFolder(Lcom/android/launcher2/FolderInfo;)V

    .line 1035
    :cond_2
    if-eqz v3, :cond_3

    .line 1036
    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v2

    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget-wide v4, v0, Lcom/android/launcher2/ItemInfo;->container:J

    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget v6, v0, Lcom/android/launcher2/ItemInfo;->screen:I

    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget v7, v0, Lcom/android/launcher2/ItemInfo;->cellX:I

    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget v8, v0, Lcom/android/launcher2/ItemInfo;->cellY:I

    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget v9, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget v10, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    invoke-virtual/range {v2 .. v10}, Lcom/android/launcher2/Workspace;->addInScreen(Landroid/view/View;JIIIII)V

    .line 1041
    :cond_3
    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->removeAllViews()V

    .line 1042
    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    iget-object v0, v0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    iget-object v0, v0, Lcom/android/launcher2/FolderInfo;->contents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1043
    iget-object v0, p0, Lcom/android/launcher2/Folder$8;->this$0:Lcom/android/launcher2/Folder;

    #getter for: Lcom/android/launcher2/Folder;->mItemsInReadingOrder:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/android/launcher2/Folder;->access$800(Lcom/android/launcher2/Folder;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1044
    return-void
.end method
