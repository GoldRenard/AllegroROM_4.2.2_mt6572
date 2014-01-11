.class Lcom/cyanogenmod/trebuchet/Folder$8;
.super Ljava/lang/Object;
.source "Folder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Folder;->replaceFolderWithFinalItem()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Folder;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Folder;)V
    .locals 0
    .parameter

    .prologue
    .line 961
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 18

    .prologue
    .line 964
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget v5, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->screen:I

    .line 965
    .local v5, screen:I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget-wide v3, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->container:J

    const-wide/16 v10, -0x65

    cmp-long v1, v3, v10

    if-nez v1, :cond_0

    .line 966
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v3, v3, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v4, v4, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget v4, v4, Lcom/cyanogenmod/trebuchet/FolderInfo;->screen:I

    invoke-virtual {v3, v4}, Lcom/cyanogenmod/trebuchet/Hotseat;->getScreenFromOrder(I)I

    move-result v3

    iput v3, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->screen:I

    .line 969
    :cond_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v3, v3, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget-wide v3, v3, Lcom/cyanogenmod/trebuchet/FolderInfo;->container:J

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v8, v8, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget v8, v8, Lcom/cyanogenmod/trebuchet/FolderInfo;->screen:I

    invoke-virtual {v1, v3, v4, v8}, Lcom/cyanogenmod/trebuchet/Launcher;->getCellLayout(JI)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v17

    .line 971
    .local v17, cellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;
    const/4 v9, 0x0

    .line 973
    .local v9, child:Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Folder;->getItemCount()I

    move-result v1

    const/4 v3, 0x1

    if-ne v1, v3, :cond_2

    .line 974
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->contents:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 975
    .local v2, finalItem:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    const v3, 0x7f040003

    move-object/from16 v0, v17

    invoke-virtual {v1, v3, v0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->createShortcut(ILandroid/view/ViewGroup;Lcom/cyanogenmod/trebuchet/ShortcutInfo;)Landroid/view/View;

    move-result-object v9

    .line 977
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget v6, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->cellX:I

    .local v6, x:I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget v7, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->cellY:I

    .line 978
    .local v7, y:I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget-wide v3, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->container:J

    const-wide/16 v10, -0x65

    cmp-long v1, v3, v10

    if-nez v1, :cond_1

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v1

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Hotseat;->hasVerticalHotseat()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 981
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v1

    invoke-virtual {v1, v6}, Lcom/cyanogenmod/trebuchet/Hotseat;->getCellYFromOrder(I)I

    move-result v7

    .line 982
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v1

    invoke-virtual {v1, v6}, Lcom/cyanogenmod/trebuchet/Hotseat;->getCellXFromOrder(I)I

    move-result v6

    .line 984
    :cond_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v3, v3, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget-wide v3, v3, Lcom/cyanogenmod/trebuchet/FolderInfo;->container:J

    invoke-static/range {v1 .. v7}, Lcom/cyanogenmod/trebuchet/LauncherModel;->addOrMoveItemInDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIII)V

    .line 987
    .end local v2           #finalItem:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .end local v6           #x:I
    .end local v7           #y:I
    :cond_2
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Folder;->getItemCount()I

    move-result v1

    const/4 v3, 0x1

    if-gt v1, v3, :cond_4

    .line 989
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v3, v3, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    invoke-static {v1, v3}, Lcom/cyanogenmod/trebuchet/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 990
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    #getter for: Lcom/cyanogenmod/trebuchet/Folder;->mFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Folder;->access$800(Lcom/cyanogenmod/trebuchet/Folder;)Lcom/cyanogenmod/trebuchet/FolderIcon;

    move-result-object v1

    move-object/from16 v0, v17

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->removeView(Landroid/view/View;)V

    .line 991
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    #getter for: Lcom/cyanogenmod/trebuchet/Folder;->mFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Folder;->access$800(Lcom/cyanogenmod/trebuchet/Folder;)Lcom/cyanogenmod/trebuchet/FolderIcon;

    move-result-object v1

    instance-of v1, v1, Lcom/cyanogenmod/trebuchet/DropTarget;

    if-eqz v1, :cond_3

    .line 992
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v3, v1, Lcom/cyanogenmod/trebuchet/Folder;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    #getter for: Lcom/cyanogenmod/trebuchet/Folder;->mFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Folder;->access$800(Lcom/cyanogenmod/trebuchet/Folder;)Lcom/cyanogenmod/trebuchet/FolderIcon;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/DropTarget;

    invoke-virtual {v3, v1}, Lcom/cyanogenmod/trebuchet/DragController;->removeDropTarget(Lcom/cyanogenmod/trebuchet/DropTarget;)V

    .line 994
    :cond_3
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v3, v3, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    invoke-virtual {v1, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->removeFolder(Lcom/cyanogenmod/trebuchet/FolderInfo;)V

    .line 998
    :cond_4
    if-eqz v9, :cond_5

    .line 999
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget-wide v10, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->container:J

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget v13, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->cellX:I

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget v14, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->cellY:I

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget v15, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->spanX:I

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder$8;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget v0, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->spanY:I

    move/from16 v16, v0

    move v12, v5

    invoke-virtual/range {v8 .. v16}, Lcom/cyanogenmod/trebuchet/Workspace;->addInScreen(Landroid/view/View;JIIIII)V

    .line 1002
    :cond_5
    return-void
.end method
