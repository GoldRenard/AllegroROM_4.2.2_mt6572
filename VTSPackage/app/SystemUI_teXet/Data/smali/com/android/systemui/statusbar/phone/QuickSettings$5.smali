.class Lcom/android/systemui/statusbar/phone/QuickSettings$5;
.super Ljava/lang/Object;
.source "QuickSettings.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/phone/QuickSettings;->addUserTiles(Landroid/view/ViewGroup;Landroid/view/LayoutInflater;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/phone/QuickSettings;)V
    .registers 2
    .parameter

    .prologue
    .line 353
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$5;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 20
    .parameter "v"

    .prologue
    .line 356
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/systemui/statusbar/phone/QuickSettings$5;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-static {v1}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$700(Lcom/android/systemui/statusbar/phone/QuickSettings;)Lcom/android/systemui/statusbar/phone/PanelBar;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/android/systemui/statusbar/phone/PanelBar;->collapseAllPanels(Z)V

    .line 358
    const/16 v17, 0x0

    .line 359
    .local v17, userInfo:Landroid/content/pm/UserInfo;
    const/4 v9, 0x0

    .line 361
    .local v9, currentUserContext:Landroid/content/Context;
    :try_start_f
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/app/IActivityManager;->getCurrentUser()Landroid/content/pm/UserInfo;

    move-result-object v17

    .line 362
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/systemui/statusbar/phone/QuickSettings$5;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-static {v1}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$100(Lcom/android/systemui/statusbar/phone/QuickSettings;)Landroid/content/Context;

    move-result-object v1

    const-string v2, "android"

    const/4 v3, 0x0

    new-instance v4, Landroid/os/UserHandle;

    move-object/from16 v0, v17

    iget v5, v0, Landroid/content/pm/UserInfo;->id:I

    invoke-direct {v4, v5}, Landroid/os/UserHandle;-><init>(I)V

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/Context;->createPackageContextAsUser(Ljava/lang/String;ILandroid/os/UserHandle;)Landroid/content/Context;
    :try_end_2e
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_f .. :try_end_2e} :catch_b1
    .catch Landroid/os/RemoteException; {:try_start_f .. :try_end_2e} :catch_bf

    move-result-object v9

    .line 370
    :goto_2f
    move-object/from16 v0, v17

    iget v0, v0, Landroid/content/pm/UserInfo;->id:I

    move/from16 v16, v0

    .line 371
    .local v16, userId:I
    move-object v8, v9

    .line 372
    .local v8, context:Landroid/content/Context;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/systemui/statusbar/phone/QuickSettings$5;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-static {v1}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$100(Lcom/android/systemui/statusbar/phone/QuickSettings;)Landroid/content/Context;

    move-result-object v1

    const-string v2, "user"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/os/UserManager;

    .line 376
    .local v15, um:Landroid/os/UserManager;
    const/4 v13, 0x0

    .line 377
    .local v13, name:Ljava/lang/String;
    const/4 v7, 0x0

    .line 378
    .local v7, avatar:Landroid/graphics/drawable/Drawable;
    invoke-virtual/range {v15 .. v16}, Landroid/os/UserManager;->getUserIcon(I)Landroid/graphics/Bitmap;

    move-result-object v14

    .line 379
    .local v14, rawAvatar:Landroid/graphics/Bitmap;
    if-eqz v14, :cond_5f

    .line 380
    new-instance v7, Landroid/graphics/drawable/BitmapDrawable;

    .end local v7           #avatar:Landroid/graphics/drawable/Drawable;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/systemui/statusbar/phone/QuickSettings$5;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-static {v1}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$100(Lcom/android/systemui/statusbar/phone/QuickSettings;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v7, v1, v14}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 385
    .restart local v7       #avatar:Landroid/graphics/drawable/Drawable;
    :cond_5f
    invoke-virtual {v15}, Landroid/os/UserManager;->getUsers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-gt v1, v2, :cond_dc

    .line 387
    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/ContactsContract$Profile;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "_id"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, "display_name"

    aput-object v5, v3, v4

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 390
    .local v10, cursor:Landroid/database/Cursor;
    if-eqz v10, :cond_99

    .line 392
    :try_start_86
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_c9

    .line 393
    const-string v1, "display_name"

    invoke-interface {v10, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v10, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_95
    .catchall {:try_start_86 .. :try_end_95} :catchall_d7

    move-result-object v13

    .line 399
    :cond_96
    :goto_96
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 402
    :cond_99
    if-nez v13, :cond_dc

    if-nez v7, :cond_dc

    .line 403
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/systemui/statusbar/phone/QuickSettings$5;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-static {v1}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$100(Lcom/android/systemui/statusbar/phone/QuickSettings;)Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0b0035

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 422
    .end local v10           #cursor:Landroid/database/Cursor;
    :goto_b0
    return-void

    .line 364
    .end local v7           #avatar:Landroid/graphics/drawable/Drawable;
    .end local v8           #context:Landroid/content/Context;
    .end local v13           #name:Ljava/lang/String;
    .end local v14           #rawAvatar:Landroid/graphics/Bitmap;
    .end local v15           #um:Landroid/os/UserManager;
    .end local v16           #userId:I
    :catch_b1
    move-exception v11

    .line 365
    .local v11, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v1, "QuickSettings"

    const-string v2, "Couldn\'t create user context"

    invoke-static {v1, v2, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 366
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v11}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 367
    .end local v11           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_bf
    move-exception v11

    .line 368
    .local v11, e:Landroid/os/RemoteException;
    const-string v1, "QuickSettings"

    const-string v2, "Couldn\'t get user info"

    invoke-static {v1, v2, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_2f

    .line 394
    .end local v11           #e:Landroid/os/RemoteException;
    .restart local v7       #avatar:Landroid/graphics/drawable/Drawable;
    .restart local v8       #context:Landroid/content/Context;
    .restart local v10       #cursor:Landroid/database/Cursor;
    .restart local v13       #name:Ljava/lang/String;
    .restart local v14       #rawAvatar:Landroid/graphics/Bitmap;
    .restart local v15       #um:Landroid/os/UserManager;
    .restart local v16       #userId:I
    :cond_c9
    :try_start_c9
    invoke-static {}, Landroid/os/UserManager;->supportsMultipleUsers()Z

    move-result v1

    if-nez v1, :cond_96

    .line 395
    const-string v1, "QuickSettings"

    const-string v2, "current user is owner."

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_d6
    .catchall {:try_start_c9 .. :try_end_d6} :catchall_d7

    goto :goto_96

    .line 399
    :catchall_d7
    move-exception v1

    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    throw v1

    .line 410
    .end local v10           #cursor:Landroid/database/Cursor;
    :cond_dc
    const/4 v1, 0x1

    invoke-virtual {v15, v1}, Landroid/os/UserManager;->getUsers(Z)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_fa

    .line 412
    :try_start_e8
    invoke-static {}, Landroid/view/WindowManagerGlobal;->getWindowManagerService()Landroid/view/IWindowManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/view/IWindowManager;->lockNow(Landroid/os/Bundle;)V
    :try_end_f0
    .catch Landroid/os/RemoteException; {:try_start_e8 .. :try_end_f0} :catch_f1

    goto :goto_b0

    .line 413
    :catch_f1
    move-exception v11

    .line 414
    .restart local v11       #e:Landroid/os/RemoteException;
    const-string v1, "QuickSettings"

    const-string v2, "Couldn\'t show user switcher"

    invoke-static {v1, v2, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_b0

    .line 417
    .end local v11           #e:Landroid/os/RemoteException;
    :cond_fa
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/systemui/statusbar/phone/QuickSettings$5;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-static {v1}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$100(Lcom/android/systemui/statusbar/phone/QuickSettings;)Landroid/content/Context;

    move-result-object v1

    sget-object v2, Landroid/provider/ContactsContract$Profile;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x3

    const/4 v4, 0x0

    move-object/from16 v0, p1

    invoke-static {v1, v0, v2, v3, v4}, Landroid/provider/ContactsContract$QuickContact;->composeQuickContactsIntent(Landroid/content/Context;Landroid/view/View;Landroid/net/Uri;I[Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v12

    .line 420
    .local v12, intent:Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/systemui/statusbar/phone/QuickSettings$5;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-static {v1}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$100(Lcom/android/systemui/statusbar/phone/QuickSettings;)Landroid/content/Context;

    move-result-object v1

    new-instance v2, Landroid/os/UserHandle;

    const/4 v3, -0x2

    invoke-direct {v2, v3}, Landroid/os/UserHandle;-><init>(I)V

    invoke-virtual {v1, v12, v2}, Landroid/content/Context;->startActivityAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    goto :goto_b0
.end method
