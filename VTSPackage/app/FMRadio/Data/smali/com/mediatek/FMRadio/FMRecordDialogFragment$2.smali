.class Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;
.super Ljava/lang/Object;
.source "FMRecordDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/FMRadio/FMRecordDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;


# direct methods
.method constructor <init>(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 265
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8
    .parameter "v"

    .prologue
    const/4 v7, 0x0

    .line 271
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 315
    :goto_0
    return-void

    .line 274
    :pswitch_0
    const/4 v0, 0x0

    .line 276
    .local v0, msg:Ljava/lang/String;
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    #getter for: Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameEditText:Landroid/widget/EditText;
    invoke-static {v5}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->access$300(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Landroid/widget/EditText;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    #setter for: Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameToSave:Ljava/lang/String;
    invoke-static {v4, v5}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->access$202(Lcom/mediatek/FMRadio/FMRecordDialogFragment;Ljava/lang/String;)Ljava/lang/String;

    .line 277
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    .line 278
    .local v3, sdDirectory:Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    const-string v4, "FM Recording"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    .local v2, recordingFolderPath:Ljava/io/File;
    new-instance v1, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    #getter for: Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameToSave:Ljava/lang/String;
    invoke-static {v5}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->access$200(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".3gpp"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 284
    .local v1, recordingFileToSave:Ljava/io/File;
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    #getter for: Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mDefaultRecordingName:Ljava/lang/String;
    invoke-static {v4}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->access$400(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 285
    const-string v4, "FmRx/RecordDlg"

    const-string v5, "Error:recording file is not exist!"

    invoke-static {v4, v5}, Lcom/mediatek/FMRadio/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 288
    :cond_0
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    #getter for: Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mDefaultRecordingName:Ljava/lang/String;
    invoke-static {v4}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->access$400(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    #getter for: Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameToSave:Ljava/lang/String;
    invoke-static {v5}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->access$200(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 289
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    #setter for: Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mIsNeedCheckFilenameExist:Z
    invoke-static {v4, v7}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->access$002(Lcom/mediatek/FMRadio/FMRecordDialogFragment;Z)Z

    .line 292
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    #getter for: Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mIsNeedCheckFilenameExist:Z
    invoke-static {v4}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->access$000(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 294
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    #getter for: Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameEditText:Landroid/widget/EditText;
    invoke-static {v5}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->access$300(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Landroid/widget/EditText;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    invoke-virtual {v5}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f04003c

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 296
    const-string v4, "FmRx/RecordDlg"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "file "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    #getter for: Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameToSave:Ljava/lang/String;
    invoke-static {v6}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->access$200(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".ogg is already exists!"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    invoke-virtual {v4}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4, v0, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 299
    :cond_2
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    #getter for: Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mListener:Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;
    invoke-static {v4}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->access$500(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 300
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    #getter for: Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mListener:Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;
    invoke-static {v4}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->access$500(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    #getter for: Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameToSave:Ljava/lang/String;
    invoke-static {v5}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->access$200(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;->onRecordingDialogClick(Ljava/lang/String;)V

    .line 302
    :cond_3
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    invoke-virtual {v4}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->dismissAllowingStateLoss()V

    goto/16 :goto_0

    .line 306
    .end local v0           #msg:Ljava/lang/String;
    .end local v1           #recordingFileToSave:Ljava/io/File;
    .end local v2           #recordingFolderPath:Ljava/io/File;
    .end local v3           #sdDirectory:Ljava/lang/String;
    :pswitch_1
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    #getter for: Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mListener:Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;
    invoke-static {v4}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->access$500(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;

    move-result-object v4

    if-eqz v4, :cond_4

    .line 307
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    #getter for: Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mListener:Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;
    invoke-static {v4}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->access$500(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;->onRecordingDialogClick(Ljava/lang/String;)V

    .line 309
    :cond_4
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    invoke-virtual {v4}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->dismissAllowingStateLoss()V

    .line 310
    const-string v4, "FmRx/RecordDlg"

    const-string v5, "Discard FM recording file. "

    invoke-static {v4, v5}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 271
    :pswitch_data_0
    .packed-switch 0x7f06001e
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
