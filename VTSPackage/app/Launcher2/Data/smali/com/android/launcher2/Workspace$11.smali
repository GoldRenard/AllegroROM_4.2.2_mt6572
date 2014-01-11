.class Lcom/android/launcher2/Workspace$11;
.super Ljava/lang/Object;
.source "Workspace.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Workspace;->removeItems(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Workspace;

.field final synthetic val$layout:Landroid/view/ViewGroup;

.field final synthetic val$layoutParent:Lcom/android/launcher2/CellLayout;

.field final synthetic val$packageNames:Ljava/util/HashSet;


# direct methods
.method constructor <init>(Lcom/android/launcher2/Workspace;Landroid/view/ViewGroup;Ljava/util/HashSet;Lcom/android/launcher2/CellLayout;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 3888
    iput-object p1, p0, Lcom/android/launcher2/Workspace$11;->this$0:Lcom/android/launcher2/Workspace;

    iput-object p2, p0, Lcom/android/launcher2/Workspace$11;->val$layout:Landroid/view/ViewGroup;

    iput-object p3, p0, Lcom/android/launcher2/Workspace$11;->val$packageNames:Ljava/util/HashSet;

    iput-object p4, p0, Lcom/android/launcher2/Workspace$11;->val$layoutParent:Lcom/android/launcher2/CellLayout;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 21

    .prologue
    .line 3890
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 3891
    .local v5, childrenToRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 3893
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 3894
    .local v9, delayToRemoveFromFolder:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/FolderInfo;>;"
    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 3896
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$11;->val$layout:Landroid/view/ViewGroup;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    .line 3897
    .local v4, childCount:I
    const/4 v13, 0x0

    .local v13, j:I
    :goto_0
    if-ge v13, v4, :cond_4

    .line 3898
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$11;->val$layout:Landroid/view/ViewGroup;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v17

    .line 3899
    .local v17, view:Landroid/view/View;
    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v16

    .line 3901
    .local v16, tag:Ljava/lang/Object;
    move-object/from16 v0, v16

    instance-of v0, v0, Lcom/android/launcher2/ShortcutInfo;

    move/from16 v18, v0

    if-eqz v18, :cond_1

    move-object/from16 v10, v16

    .line 3902
    check-cast v10, Lcom/android/launcher2/ShortcutInfo;

    .line 3903
    .local v10, info:Lcom/android/launcher2/ShortcutInfo;
    iget-object v11, v10, Lcom/android/launcher2/ShortcutInfo;->intent:Landroid/content/Intent;

    .line 3904
    .local v11, intent:Landroid/content/Intent;
    invoke-virtual {v11}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v14

    .line 3906
    .local v14, name:Landroid/content/ComponentName;
    if-eqz v14, :cond_0

    .line 3907
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$11;->val$packageNames:Ljava/util/HashSet;

    move-object/from16 v18, v0

    invoke-virtual {v14}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_0

    .line 3912
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$11;->this$0:Lcom/android/launcher2/Workspace;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/launcher2/Workspace;->getContext()Landroid/content/Context;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-static {v0, v14}, Lcom/android/launcher2/Utilities;->isComponentEnabled(Landroid/content/Context;Landroid/content/ComponentName;)Z

    move-result v12

    .line 3915
    .local v12, isComponentEnabled:Z
    const-string v18, "Workspace"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "removeFinalItem: name = "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ",isComponentEnabled = "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3918
    if-nez v12, :cond_0

    .line 3919
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$11;->this$0:Lcom/android/launcher2/Workspace;

    move-object/from16 v18, v0

    #getter for: Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;
    invoke-static/range {v18 .. v18}, Lcom/android/launcher2/Workspace;->access$000(Lcom/android/launcher2/Workspace;)Lcom/android/launcher2/Launcher;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-static {v0, v10}, Lcom/android/launcher2/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;)V

    .line 3920
    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3897
    .end local v10           #info:Lcom/android/launcher2/ShortcutInfo;
    .end local v11           #intent:Landroid/content/Intent;
    .end local v12           #isComponentEnabled:Z
    .end local v14           #name:Landroid/content/ComponentName;
    :cond_0
    :goto_1
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_0

    .line 3924
    :cond_1
    move-object/from16 v0, v16

    instance-of v0, v0, Lcom/android/launcher2/FolderInfo;

    move/from16 v18, v0

    if-eqz v18, :cond_3

    move-object/from16 v10, v16

    .line 3925
    check-cast v10, Lcom/android/launcher2/FolderInfo;

    .line 3926
    .local v10, info:Lcom/android/launcher2/FolderInfo;
    iget-object v6, v10, Lcom/android/launcher2/FolderInfo;->contents:Ljava/util/ArrayList;

    .line 3927
    .local v6, contents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutInfo;>;"
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 3928
    .local v7, contentsCount:I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 3932
    .local v2, appsToRemoveFromFolder:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutInfo;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$11;->this$0:Lcom/android/launcher2/Workspace;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$11;->val$packageNames:Ljava/util/HashSet;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    #calls: Lcom/android/launcher2/Workspace;->isNeedToDelayRemoveFolderItems(Lcom/android/launcher2/FolderInfo;Ljava/util/HashSet;Ljava/util/ArrayList;)Z
    invoke-static {v0, v10, v1, v2}, Lcom/android/launcher2/Workspace;->access$1500(Lcom/android/launcher2/Workspace;Lcom/android/launcher2/FolderInfo;Ljava/util/HashSet;Ljava/util/ArrayList;)Z

    move-result v18

    if-eqz v18, :cond_2

    .line 3933
    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 3935
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$11;->this$0:Lcom/android/launcher2/Workspace;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    #calls: Lcom/android/launcher2/Workspace;->removeFolderItems(Lcom/android/launcher2/FolderInfo;Ljava/util/ArrayList;)V
    invoke-static {v0, v10, v2}, Lcom/android/launcher2/Workspace;->access$1600(Lcom/android/launcher2/Workspace;Lcom/android/launcher2/FolderInfo;Ljava/util/ArrayList;)V

    goto :goto_1

    .line 3937
    .end local v2           #appsToRemoveFromFolder:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutInfo;>;"
    .end local v6           #contents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutInfo;>;"
    .end local v7           #contentsCount:I
    .end local v10           #info:Lcom/android/launcher2/FolderInfo;
    :cond_3
    move-object/from16 v0, v16

    instance-of v0, v0, Lcom/android/launcher2/LauncherAppWidgetInfo;

    move/from16 v18, v0

    if-eqz v18, :cond_0

    move-object/from16 v10, v16

    .line 3938
    check-cast v10, Lcom/android/launcher2/LauncherAppWidgetInfo;

    .line 3939
    .local v10, info:Lcom/android/launcher2/LauncherAppWidgetInfo;
    iget-object v15, v10, Lcom/android/launcher2/LauncherAppWidgetInfo;->providerName:Landroid/content/ComponentName;

    .line 3940
    .local v15, provider:Landroid/content/ComponentName;
    if-eqz v15, :cond_0

    .line 3941
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$11;->val$packageNames:Ljava/util/HashSet;

    move-object/from16 v18, v0

    invoke-virtual {v15}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_0

    .line 3942
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$11;->this$0:Lcom/android/launcher2/Workspace;

    move-object/from16 v18, v0

    #getter for: Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;
    invoke-static/range {v18 .. v18}, Lcom/android/launcher2/Workspace;->access$000(Lcom/android/launcher2/Workspace;)Lcom/android/launcher2/Launcher;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-static {v0, v10}, Lcom/android/launcher2/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;)V

    .line 3943
    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 3950
    .end local v10           #info:Lcom/android/launcher2/LauncherAppWidgetInfo;
    .end local v15           #provider:Landroid/content/ComponentName;
    .end local v16           #tag:Ljava/lang/Object;
    .end local v17           #view:Landroid/view/View;
    :cond_4
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v8

    .line 3951
    .local v8, delayFolderCount:I
    const/4 v13, 0x0

    :goto_2
    if-ge v13, v8, :cond_5

    .line 3952
    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/launcher2/FolderInfo;

    .line 3953
    .local v10, info:Lcom/android/launcher2/FolderInfo;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 3954
    .restart local v2       #appsToRemoveFromFolder:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutInfo;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$11;->this$0:Lcom/android/launcher2/Workspace;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$11;->val$packageNames:Ljava/util/HashSet;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    #calls: Lcom/android/launcher2/Workspace;->getRemoveFolderItems(Lcom/android/launcher2/FolderInfo;Ljava/util/HashSet;Ljava/util/ArrayList;)I
    invoke-static {v0, v10, v1, v2}, Lcom/android/launcher2/Workspace;->access$1700(Lcom/android/launcher2/Workspace;Lcom/android/launcher2/FolderInfo;Ljava/util/HashSet;Ljava/util/ArrayList;)I

    .line 3955
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$11;->this$0:Lcom/android/launcher2/Workspace;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    #calls: Lcom/android/launcher2/Workspace;->removeFolderItems(Lcom/android/launcher2/FolderInfo;Ljava/util/ArrayList;)V
    invoke-static {v0, v10, v2}, Lcom/android/launcher2/Workspace;->access$1600(Lcom/android/launcher2/Workspace;Lcom/android/launcher2/FolderInfo;Ljava/util/ArrayList;)V

    .line 3951
    add-int/lit8 v13, v13, 0x1

    goto :goto_2

    .line 3958
    .end local v2           #appsToRemoveFromFolder:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutInfo;>;"
    .end local v10           #info:Lcom/android/launcher2/FolderInfo;
    :cond_5
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 3959
    const/4 v13, 0x0

    :goto_3
    if-ge v13, v4, :cond_7

    .line 3960
    invoke-virtual {v5, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 3963
    .local v3, child:Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$11;->val$layoutParent:Lcom/android/launcher2/CellLayout;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Lcom/android/launcher2/CellLayout;->removeViewInLayout(Landroid/view/View;)V

    .line 3964
    instance-of v0, v3, Lcom/android/launcher2/DropTarget;

    move/from16 v18, v0

    if-eqz v18, :cond_6

    .line 3965
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$11;->this$0:Lcom/android/launcher2/Workspace;

    move-object/from16 v18, v0

    #getter for: Lcom/android/launcher2/Workspace;->mDragController:Lcom/android/launcher2/DragController;
    invoke-static/range {v18 .. v18}, Lcom/android/launcher2/Workspace;->access$1800(Lcom/android/launcher2/Workspace;)Lcom/android/launcher2/DragController;

    move-result-object v18

    check-cast v3, Lcom/android/launcher2/DropTarget;

    .end local v3           #child:Landroid/view/View;
    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Lcom/android/launcher2/DragController;->removeDropTarget(Lcom/android/launcher2/DropTarget;)V

    .line 3959
    :cond_6
    add-int/lit8 v13, v13, 0x1

    goto :goto_3

    .line 3969
    :cond_7
    if-lez v4, :cond_8

    .line 3970
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$11;->val$layout:Landroid/view/ViewGroup;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/view/ViewGroup;->requestLayout()V

    .line 3971
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$11;->val$layout:Landroid/view/ViewGroup;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/view/ViewGroup;->invalidate()V

    .line 3973
    :cond_8
    return-void
.end method
