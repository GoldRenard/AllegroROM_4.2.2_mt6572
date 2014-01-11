.class Lcom/cyanogenmod/trebuchet/Workspace$11;
.super Ljava/lang/Object;
.source "Workspace.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Workspace;->removeItems(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Workspace;

.field final synthetic val$layout:Landroid/view/ViewGroup;

.field final synthetic val$layoutParent:Lcom/cyanogenmod/trebuchet/CellLayout;

.field final synthetic val$packageNames:Ljava/util/HashSet;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Workspace;Landroid/view/ViewGroup;Ljava/util/HashSet;Lcom/cyanogenmod/trebuchet/CellLayout;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 4333
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Workspace$11;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Workspace$11;->val$layout:Landroid/view/ViewGroup;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/Workspace$11;->val$packageNames:Ljava/util/HashSet;

    iput-object p4, p0, Lcom/cyanogenmod/trebuchet/Workspace$11;->val$layoutParent:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 18

    .prologue
    .line 4335
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 4336
    .local v5, childrenToRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 4338
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace$11;->val$layout:Landroid/view/ViewGroup;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    .line 4339
    .local v4, childCount:I
    const/4 v11, 0x0

    .local v11, j:I
    :goto_0
    if-ge v11, v4, :cond_5

    .line 4340
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace$11;->val$layout:Landroid/view/ViewGroup;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v15

    .line 4341
    .local v15, view:Landroid/view/View;
    invoke-virtual {v15}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v14

    .line 4343
    .local v14, tag:Ljava/lang/Object;
    instance-of v0, v14, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    move/from16 v16, v0

    if-eqz v16, :cond_1

    move-object v8, v14

    .line 4344
    check-cast v8, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 4345
    .local v8, info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    iget-object v9, v8, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    .line 4347
    .local v9, intent:Landroid/content/Intent;
    if-eqz v9, :cond_0

    .line 4348
    invoke-virtual {v9}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v12

    .line 4349
    .local v12, name:Landroid/content/ComponentName;
    if-eqz v12, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace$11;->val$packageNames:Ljava/util/HashSet;

    move-object/from16 v16, v0

    invoke-virtual {v12}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_0

    .line 4350
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace$11;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    move-object/from16 v16, v0

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;
    invoke-static/range {v16 .. v16}, Lcom/cyanogenmod/trebuchet/Workspace;->access$000(Lcom/cyanogenmod/trebuchet/Workspace;)Lcom/cyanogenmod/trebuchet/Launcher;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v0, v8}, Lcom/cyanogenmod/trebuchet/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 4351
    invoke-virtual {v5, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4339
    .end local v8           #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .end local v9           #intent:Landroid/content/Intent;
    .end local v12           #name:Landroid/content/ComponentName;
    :cond_0
    :goto_1
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 4354
    :cond_1
    instance-of v0, v14, Lcom/cyanogenmod/trebuchet/FolderInfo;

    move/from16 v16, v0

    if-eqz v16, :cond_4

    move-object v8, v14

    .line 4355
    check-cast v8, Lcom/cyanogenmod/trebuchet/FolderInfo;

    .line 4356
    .local v8, info:Lcom/cyanogenmod/trebuchet/FolderInfo;
    iget-object v6, v8, Lcom/cyanogenmod/trebuchet/FolderInfo;->contents:Ljava/util/ArrayList;

    .line 4357
    .local v6, contents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ShortcutInfo;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 4360
    .local v2, appsToRemoveFromFolder:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ShortcutInfo;>;"
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :cond_2
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 4361
    .local v1, appInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    iget-object v9, v1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    .line 4362
    .restart local v9       #intent:Landroid/content/Intent;
    invoke-virtual {v9}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v12

    .line 4364
    .restart local v12       #name:Landroid/content/ComponentName;
    if-eqz v12, :cond_2

    .line 4365
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace$11;->val$packageNames:Ljava/util/HashSet;

    move-object/from16 v16, v0

    invoke-virtual {v12}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_2

    .line 4366
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 4370
    .end local v1           #appInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .end local v9           #intent:Landroid/content/Intent;
    .end local v12           #name:Landroid/content/ComponentName;
    :cond_3
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 4371
    .local v10, item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    invoke-virtual {v8, v10}, Lcom/cyanogenmod/trebuchet/FolderInfo;->remove(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    .line 4372
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace$11;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    move-object/from16 v16, v0

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;
    invoke-static/range {v16 .. v16}, Lcom/cyanogenmod/trebuchet/Workspace;->access$000(Lcom/cyanogenmod/trebuchet/Workspace;)Lcom/cyanogenmod/trebuchet/Launcher;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v0, v10}, Lcom/cyanogenmod/trebuchet/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    goto :goto_3

    .line 4374
    .end local v2           #appsToRemoveFromFolder:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ShortcutInfo;>;"
    .end local v6           #contents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ShortcutInfo;>;"
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v8           #info:Lcom/cyanogenmod/trebuchet/FolderInfo;
    .end local v10           #item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_4
    instance-of v0, v14, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    move/from16 v16, v0

    if-eqz v16, :cond_0

    move-object v8, v14

    .line 4375
    check-cast v8, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    .line 4376
    .local v8, info:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;
    iget-object v13, v8, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->providerName:Landroid/content/ComponentName;

    .line 4377
    .local v13, provider:Landroid/content/ComponentName;
    if-eqz v13, :cond_0

    .line 4378
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace$11;->val$packageNames:Ljava/util/HashSet;

    move-object/from16 v16, v0

    invoke-virtual {v13}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_0

    .line 4379
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace$11;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    move-object/from16 v16, v0

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;
    invoke-static/range {v16 .. v16}, Lcom/cyanogenmod/trebuchet/Workspace;->access$000(Lcom/cyanogenmod/trebuchet/Workspace;)Lcom/cyanogenmod/trebuchet/Launcher;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v0, v8}, Lcom/cyanogenmod/trebuchet/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 4380
    invoke-virtual {v5, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 4386
    .end local v8           #info:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;
    .end local v13           #provider:Landroid/content/ComponentName;
    .end local v14           #tag:Ljava/lang/Object;
    .end local v15           #view:Landroid/view/View;
    :cond_5
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 4387
    const/4 v11, 0x0

    :goto_4
    if-ge v11, v4, :cond_7

    .line 4388
    invoke-virtual {v5, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 4391
    .local v3, child:Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace$11;->val$layoutParent:Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->removeViewInLayout(Landroid/view/View;)V

    .line 4392
    instance-of v0, v3, Lcom/cyanogenmod/trebuchet/DropTarget;

    move/from16 v16, v0

    if-eqz v16, :cond_6

    .line 4393
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace$11;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    move-object/from16 v16, v0

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;
    invoke-static/range {v16 .. v16}, Lcom/cyanogenmod/trebuchet/Workspace;->access$1500(Lcom/cyanogenmod/trebuchet/Workspace;)Lcom/cyanogenmod/trebuchet/DragController;

    move-result-object v16

    check-cast v3, Lcom/cyanogenmod/trebuchet/DropTarget;

    .end local v3           #child:Landroid/view/View;
    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lcom/cyanogenmod/trebuchet/DragController;->removeDropTarget(Lcom/cyanogenmod/trebuchet/DropTarget;)V

    .line 4387
    :cond_6
    add-int/lit8 v11, v11, 0x1

    goto :goto_4

    .line 4397
    :cond_7
    if-lez v4, :cond_8

    .line 4398
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace$11;->val$layout:Landroid/view/ViewGroup;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/view/ViewGroup;->requestLayout()V

    .line 4399
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace$11;->val$layout:Landroid/view/ViewGroup;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/view/ViewGroup;->invalidate()V

    .line 4401
    :cond_8
    return-void
.end method
