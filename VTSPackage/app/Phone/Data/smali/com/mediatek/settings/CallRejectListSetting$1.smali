.class Lcom/mediatek/settings/CallRejectListSetting$1;
.super Ljava/lang/Object;
.source "CallRejectListSetting.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/settings/CallRejectListSetting;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/CallRejectListSetting;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/CallRejectListSetting;)V
    .locals 0
    .parameter

    .prologue
    .line 426
    iput-object p1, p0, Lcom/mediatek/settings/CallRejectListSetting$1;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 13
    .parameter "arg0"
    .parameter "arg1"

    .prologue
    const/4 v12, 0x1

    const/4 v3, 0x0

    const/4 v11, 0x2

    const/4 v5, 0x0

    .line 429
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListSetting$1;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    invoke-virtual {v0, v5}, Lcom/mediatek/settings/CallRejectListSetting;->dismissDialog(I)V

    .line 430
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListSetting$1;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    #getter for: Lcom/mediatek/settings/CallRejectListSetting;->mNumberEditText:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/mediatek/settings/CallRejectListSetting;->access$400(Lcom/mediatek/settings/CallRejectListSetting;)Landroid/widget/EditText;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListSetting$1;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    #getter for: Lcom/mediatek/settings/CallRejectListSetting;->mNumberEditText:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/mediatek/settings/CallRejectListSetting;->access$400(Lcom/mediatek/settings/CallRejectListSetting;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListSetting$1;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    #getter for: Lcom/mediatek/settings/CallRejectListSetting;->mType:Ljava/lang/String;
    invoke-static {v0}, Lcom/mediatek/settings/CallRejectListSetting;->access$500(Lcom/mediatek/settings/CallRejectListSetting;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    .line 469
    :cond_0
    :goto_0
    return-void

    .line 435
    :cond_1
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListSetting$1;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    iget-object v1, p0, Lcom/mediatek/settings/CallRejectListSetting$1;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    #getter for: Lcom/mediatek/settings/CallRejectListSetting;->mNumberEditText:Landroid/widget/EditText;
    invoke-static {v1}, Lcom/mediatek/settings/CallRejectListSetting;->access$400(Lcom/mediatek/settings/CallRejectListSetting;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/settings/CallRejectListSetting;->allWhite(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/mediatek/settings/CallRejectListSetting;->access$600(Lcom/mediatek/settings/CallRejectListSetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 437
    .local v8, rejectNumbers:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListSetting$1;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    invoke-virtual {v0, v11}, Lcom/mediatek/settings/CallRejectListSetting;->showDialog(I)V

    .line 438
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListSetting$1;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    invoke-virtual {v0}, Lcom/mediatek/settings/CallRejectListSetting;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    new-array v2, v11, [Ljava/lang/String;

    const-string v4, "display_name"

    aput-object v4, v2, v5

    const-string v4, "data1"

    aput-object v4, v2, v12

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 444
    .local v6, cursorName:Landroid/database/Cursor;
    const-string v10, ""

    .line 445
    .local v10, tempNumber:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListSetting$1;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    invoke-virtual {v0}, Lcom/mediatek/settings/CallRejectListSetting;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0d00b8

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 446
    .local v9, tempName:Ljava/lang/String;
    const-string v7, ""

    .line 447
    .local v7, newName:Ljava/lang/String;
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 450
    :goto_1
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_3

    .line 453
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 454
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListSetting$1;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    const/4 v1, 0x1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/settings/CallRejectListSetting;->allWhite(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/mediatek/settings/CallRejectListSetting;->access$600(Lcom/mediatek/settings/CallRejectListSetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 455
    const-string v0, "CallRejectListSetting"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateUICallback1..tempName:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " tempNumber:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 456
    invoke-virtual {v8, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 457
    move-object v9, v7

    .line 459
    :cond_2
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 462
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    :cond_3
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 464
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListSetting$1;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    invoke-virtual {v0, v11}, Lcom/mediatek/settings/CallRejectListSetting;->dismissDialog(I)V

    .line 465
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListSetting$1;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    #calls: Lcom/mediatek/settings/CallRejectListSetting;->insertNumbers(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v8, v9}, Lcom/mediatek/settings/CallRejectListSetting;->access$700(Lcom/mediatek/settings/CallRejectListSetting;Ljava/lang/String;Ljava/lang/String;)V

    .line 468
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListSetting$1;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    #calls: Lcom/mediatek/settings/CallRejectListSetting;->showNumbers()V
    invoke-static {v0}, Lcom/mediatek/settings/CallRejectListSetting;->access$200(Lcom/mediatek/settings/CallRejectListSetting;)V

    goto/16 :goto_0
.end method
